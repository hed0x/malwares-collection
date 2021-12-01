#!/bin/sh
#
# ------------ ES_WuScan.sh ------------
#
# (C) BrainStorm [ElectronicSouls]
#
# This shell script will search for vulnerable version of wu-ftp-2.6.0(1) 
# If u think this is lame, cuz its wu-ftp, piss off ..we don`t give a fuck..
# u need nc to get this to work ...
#
# - THIS IS THE BETA VERSION ! -
#
# Quick Shouts: 0x7f,RSH,IC 

start=$1
end=$2

declare -i i
declare -i null=0
declare -i max=255
declare -i oct=256

declare -i tmp1
declare -i tmp2
declare -i tmp3
declare -i tmp4

if [ $# -ne 2 ]; 
then

echo
echo "[!] --- Usage: $0 StartIP EndIP ---"
echo

exit 1

fi

trap clean 1 SIGINT
trap clean 1 SIGKILL
trap clean 1 SIGQUIT
trap clean 1 SIGTERM

clean()
{
if [ -f ~/.ESwuScanOutput ]; then
	rm -rf ~/.ESwuScanOutput
fi
if [ -f ~/.pingout ]; then
	rm -rf ~/.pingout
fi
exit 0
}

declare -i startIP1=$(echo "$start"|awk -F. '{ print $4 }')
declare -i startIP2=$(echo "$start"|awk -F. '{ print $3 }')
declare -i startIP3=$(echo "$start"|awk -F. '{ print $2 }')
declare -i startIP4=$(echo "$start"|awk -F. '{ print $1 }') 

if [ "$startIP1" -gt "$max" ] || [ "$startIP2" -gt "$max" ] || [ "$startIP3" -gt "$max" ] || [ "$startIP4" -gt "$max" ]; 

then
	echo "[-] ERROR! invalid StartIP address.."
	exit 1
fi

declare -i endIP1=$(echo "$end"|awk -F. '{ print $4 }')
declare -i endIP2=$(echo "$end"|awk -F. '{ print $3 }')
declare -i endIP3=$(echo "$end"|awk -F. '{ print $2 }')
declare -i endIP4=$(echo "$end"|awk -F. '{ print $1 }')

if [ "$endIP1" -gt "$max" ] || [ "$endIP2" -gt $max ] || [ "$endIP3" -gt "$max" ] || [ "$endIP4" -gt "$max" ]; 

then
	echo "[-] ERROR! invalid EndIP address.."
	exit 1
fi
clear
echo "________________________________________"
echo "  ES_WuScan.sh (C) BrainStorm [ElectronicSouls]   "
echo "________________________________________"

ip="${startIP4}.${startIP3}.${startIP2}.${startIP1}"
while [ 1 ]
do
	echo $ip
	echo quit|nc -w 6 "${startIP4}.${startIP3}.${startIP2}.${startIP1}" 21 > ~/.ESwuScanOutput
	sleep 6s
	if [ -f ~/.ESwuScanOutput ]; then
		cat ~/.ESwuScanOutput|grep wu-2.6.0'(1)'>/dev/null && echo -n "$soct4.$soct3.$soct2.$soct1 -!- wu-2.6.0'(1)' Server [*]"
		cat ~/.ESwuScanOutput|grep rh > /dev/null  && echo "...and RH host !"
		rm ~/.ESwuScanOutput
fi
soct1=$startIP1+1
          ip="${startIP4}.${startIP3}.${startIP2}.${startIP1}"
          if [ "$startIP1" -ge "$max" ]; then

	startIP1=0
	startIP2=$startIP2+1

          ip="${startIP4}.${startIP3}.${startIP2}.${startIP1}"
          if [ "$startIP2" -ge "$max" ]; then

	startIP2=0
	startIP3=$startIP3+1

          ip="${startIP4}.${startIP3}.${startIP2}.${startIP1}"
          if [ "$startIP3" -ge "$max" ]; then

               startIP3=0
               startIP4=$startIP4+1 

          ip="${startIP4}.${startIP3}.${startIP2}.${startIP1}"
          if [ "$startIP4" -ge "$max" ]; then

echo "error: out of valid ip address range"
	exit 1
fi
	else
	startIP3=$startIP3+1
fi
	else
	startIP2=$startIP2+1
fi
fi
                if [ $end = $ip ]; then
echo "[*] done!"
exit 0
fi
	
done

