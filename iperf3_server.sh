#!/bin/bash

trap "killall iperf3; exit" INT

echo "Enter the number of iperf3 instances to run: "
read num_instances
echo "Enter the duration of the test in seconds: "
read duration
echo "Enter the destination IP address: "
read dest_ip

# check if there is any iperf3 process running
if pgrep -x "iperf3" > /dev/null
then
  echo "Iperf3 process is running, stopping all iperf3 processes"
  killall iperf3
fi

for i in $(seq 1 $num_instances)
do
  port=$((5101 + i - 1))
  iperf3 -t $duration -c $dest_ip -p $port -P 100 > /dev/null  2>&1 &
  echo "Iperf3 instance $i on port $port running for $duration seconds"
done

echo "Countdown:"
for i in $(seq $duration -1 1)
do
  echo -ne "$i\033[0K\r"
  sleep 1
done
echo "Test complete"

killall iperf3
