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
rver="${cl}${hblk}[${cl}${hcyn}St${cl}${cyn}0r${cl}${hblk}mScan${cl}${hblk}]${cl}${mag}:${cl}${wht}"
clear
echo " "
echo "${cyn}http${hblk}:${cyn}//${hblk}www${cyn}.${hblk}self-evident${cl}${cyn}.${cl}${hblk}com${cl}${cyn}${cl}${hblk}${cl}"
echo " "
echo "${cl}${cyn}----${cl}${hblk}[${cl}${cyn}stormsgirl${cl}${hblk}@${cl}${cyn}yours${cl}${hblk}.${cl}${cyn}com${cl}${hblk}]${cl}${cyn}----" 
echo " "
echo -n "$rver checking for all the bitches arguments.."
if [ "$1" = "" ]; then
 echo " ${cyn}${blink}no${cl}${wht}."
 echo ""
 echo "$rver usage is $0 host.com > [logfile] "
 exit 0
fi
echo " ${cyn}right ${hblk}on${cl}"
echo ""

if [ "$1" = "" ]; then
   echo "Enter host to scan"
   exit 1
fi
   echo "$rver ${cl}${hblk}Class C${cl}${cyn} sadmin ${cl}${hblk} scanner by ${cl}${cyn} St0rmGirl${cl}" 
   if [ -x z0ne ] && [ -x sad ]; then
   echo ""
   echo "$rver ${cl}${hblk}This will take a few moments go take a shit or something${cl}${cyn}.."
   echo ""   
   else
   echo "$rver ${cl}${hblk}This will take a few moments go take a shit or something${cl}${hcyn}..${cl}"
   echo ""
   gcc -o scan scan.c  > /dev/null 2>&1
fi

if [ -f scan.log ]; then
   rm -f scan.log
fi

./z0ne -o $1 > scan.log
cat scan.log  | while read IP; do ./sad $IP; done | grep  "Yes" | cut -s -d":" -f2
 
