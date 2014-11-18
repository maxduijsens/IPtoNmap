IPtoNmap
========

Convert a list of IP ranges to Nmap commands
IP ranges should be in a text file as follows:
<PREFIX> 127.0.0.1 127.0.0.255 <SUFFIX>
Prefix and Suffix can be empty

To run it: ./iptonmap.pl input.txt output.sh
Then call nmap with the command which is on top of the output.sh file.

Requirements
============
- Net::CIDR
