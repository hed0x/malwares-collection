#!/bin/bash
#
# clnlog3 - by everlast [07.20.97]
#
# What: just a nifty little script to search all text files for string of
# text specified on the cmd line.
#
# Usage: clnlog3 <string>

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

echo "${BLK}* ${WHI}clnlog3 ${DWHI}by ${WHI}e${BLU}ve${DBLU}rl${BLK}ast [${DWHI}07${BLK}.${DWHI}27${BLK}.${DWHI}97${BLK}]${RES}"
echo "${BLK}* ${WHI}C${DWHI}opyright ${WHI}1${BLU}9${DBLU}9${BLK}7 ${DWHI}by ${WHI}C${DWHI}onflict ${WHI}P${DWHI}roductions${RES}"
if [ $# != 1 ]
then
  echo "${BLK}* ${DWHI}Usage${WHI}: "`basename $0`" <${DWHI}string${WHI}>${RES}"
  echo " "
  exit
fi
echo "${BLK}*${RES}"
echo "${BLK}* ${DWHI}Cleaning logs.. This may take a bit depending on the size of the logs.${RES}"

WERD=$(/bin/ls -F /var/log | grep -v "/" | grep -v "*" | grep -v ".tgz" | grep -v ".gz" | grep -v ".tar" | grep -v "lastlog" | grep -v "utmp" | grep -v "wtmp" | grep -v "@")

for fil in $WERD
do
   line=$(wc -l /var/log/$fil | awk -F ' ' '{print $1}')
   echo -n "${BLK}* ${DWHI}Cleaning ${WHI}$fil ($line ${DWHI}lines${WHI})${BLK}...${RES}"
   grep -v $1 /var/log/$fil > new
   mv -f new /var/log/$fil
   newline=$(wc -l /var/log/$fil | awk -F ' ' '{print $1}')
   let linedel=$(($line-$newline))
   echo "${WHI}$linedel ${DWHI}lines removed!${RES}"

done

echo "${BLK}* ${DWHI}Logs Cleaned!${RES}"
