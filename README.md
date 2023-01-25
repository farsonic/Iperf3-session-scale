# Quick iperf3 session scaler

I had to quickly create a lot of TCP sessions between two hosts to test some intermeditary hosts capabilities. There are tools like NTTTCP that can do this well but resource consumption became an issue, but is probably a better solution.

I was using iperf3 for some other testing however there is a limit of 100 parallel streams which are also CPU bound. Scaled this out with multiple iterations of iperf3 running on both the client and server. 

## Usage

Ensure iperf3 is installed on each host
Ensure there is connectivity between each host 

### Receiver 

Execute the bash script and you will be prompted for the number of sessions of iperf3 to initiate. Each instnace will listen or 100 parallel connections with each incrementing from port number 5101. 

./iperf3_receiver.sh 


### Server 

Execute the bash script and you will be prompted for the number of sessions of iperf3 to initiate, duration of the test in seconds and the remote receiver IP Address. Each instnace will transmit 100 parallel connections with each incrementing from destination port number 5101. 

./iperf3_server.sh 


