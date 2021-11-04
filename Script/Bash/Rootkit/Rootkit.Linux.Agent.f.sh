#!/bin/sh
blink="[5m"
cl="[0m"
mag="[35m"
cyn="[36m"
wht="[37m"
red="[31m"
hblk="[1;30m"
hmag="[1;35m"
hcyn="[1;36m"
hwht="[1;37m"
hred="[1;31m"
bblk="[40m"
bred="[41m"
bmag="[45m"
bcyn="[46m"
bwht="[47m"
bg="[44m"
rver="${cl}${hblk}[${cl}${hcyn}X${cl}${cyn}ploit${cl}${hblk}RPC${cl}${hblk}]${cl}${mag}:${cl}${wht}"

clear
echo "${cl}${cyn}-----${cl}${hblk}[${cl}${cyn}xploit${cl}${hblk}@${cl}${cyn}sunos${cl}${hblk}.${cl}${cyn}com${cl}${hblk}]${cl}${cyn}-----" 
echo "${cyn}RPC ${cl}class A/B/C [${cyn}scan/exploit${cl}] by ${hred}Xploit${cl}."
echo "This will scan for RPC service and try to exploit ${cyn}statd/amd/cmsd/pcnfsd/ttdb${cl}."
echo "This will exploit systems like: ${cyn}Linux/Sun/Solaris/Irix/AIX/BSD${cl}."
echo " "
echo -n "$rver checking for all the bitches arguments.."
if [ "$1" = "" ]; then
 echo " ${cyn}${blink}no${cl}${wht}."
 echo ""
 echo "$rver usage is $0 A B C "
 exit 0
fi
echo " ${cyn}right ${hblk}on${cl}"
echo " "
echo "$rver This will take a few moments go take a shit or something.."

./pscan-a $1 111 $2 $3