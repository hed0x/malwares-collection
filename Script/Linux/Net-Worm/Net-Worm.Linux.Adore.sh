#!/bin/sh
while true
 do
  CLASSB=`./randb`
  rm -rf results.log;rm -rf hacklpd
  ./pscan-lprng $CLASSB 515 >>/dev/null
  ./lpdscan >>/dev/null
done       
