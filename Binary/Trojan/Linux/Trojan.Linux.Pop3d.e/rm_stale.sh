#!/bin/sh
##
## 8-1-97 Ian Kinner (ian@llc.net)
##
## Simple sh script to remove stale files left in the in.pop3d tmp 
## directory, which cause DoS for POP3 users. Should be run by a contab
## every 15 minutes or so.
##

# Logfile to write deletions: (/dev/null valid)
LOGFILE=/var/adm/flushpop_log

# in.pop3d tmp directory:
TMPDIR=/usr/tmp/.pop



ls -l $TMPDIR | awk '{print $9}' >/tmp/.usrtmp
NUMBER=`wc -l /tmp/.usrtmp | awk '{print $1}'`

while [ $NUMBER -gt 1 ] 
do
USER=`head -$NUMBER /tmp/.usrtmp | tail -1`
ps aux | grep in.pop3d | grep $USER >/tmp/.poptmp
SIZE=`ls -l /tmp/.poptmp | awk '{print $5}'`
if [ $SIZE -eq 0 ] ; then
  echo `date` -- removed stale file for: $USER >> $LOGFILE
  rm -f $TMPDIR/$USER
fi
TMP=`expr $NUMBER - 1`
NUMBER=$TMP
done
rm -f /tmp/{.poptmp,.usrtmp}

