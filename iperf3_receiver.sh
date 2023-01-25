#!/bin/bash

trap "killall iperf3; exit" INT

echo "Enter the number of iperf3 instances to run: "
read num_instances

for i in $(seq 1 $num_instances)
do
  port=$((5101 + i - 1))
  kill $(lsof -t -i :$port) 2> /dev/null
  iperf3 -s -p $port &
done

wait
