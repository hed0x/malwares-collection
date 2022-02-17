# VSKI - Very Simple Kstat Installer
# Author: FuSyS [fusys@s0ftpj.org, fusys@sikurezza.org]
# SoftProject Digital Security for Y2K
# Sikurezza.org - Italian Security Mailinglist
# MOJITO-WARE LICENSE - This source code is like "THE BEER-WARE LICENSE" by
# Poul-Henning Kamp <phk@FreeBSD.ORG> but you can give me in return a mojito.
# Tested on: Slackware 8 Linux MaNTRa 2.4.16 #4 i686 unknown

#!/bin/bash

echo -e "\nWelcome to VSKI (Very Simple Kstat Installer)"
echo "============================================="
echo -e "\nThis release will compile and work on 2.4.x kernels ONLY."
echo "KSTAT is a simple utility which lets you blah blah blah..."
echo "If you downloaded this, you know what it does and what you"
echo "are doing, hopefully..."
echo "I need just a few answers, so please be honest."
read -p "Else I won't help you in checking for rootkits, right ? [y/n] " 
echo -e "\nI was just joking anyway. Ok, let's continue"

sleep 2
clear

SRC="/usr/src/linux/"
read -p "Where are your kernel sources located ? [/usr/src/linux/] " KSRC
case $KSRC in
	"")
	   cp make.orig make.tmp
	   ;;
	*)
	   sed "s|$SRC|$KSRC|" make.orig > make.tmp
	   ;;
esac
echo ""
while read -p "Have you compiled IPv6 support in your kernel ? [y/n] " ipv6 ; do
	case $ipv6 in
		y|Y)
	  	   sed 's/IPNG    =/IPNG    = -D IPV6/' make.tmp > Makefile
	  	   break
	  	   ;;
		n|N)
	   	   cp make.tmp Makefile
	  	   break
	  	   ;;
		*)
	  	   echo -e "\n y or n , please..."
	  	   sleep 1
	  	   clear
	  	   continue
	esac
done

rm -rf make.tmp

echo ""
echo -e "\t--------------------------------"
echo -e "\t|  kstat  Linux 2.4.x version  |"
echo -e "\t|  by FuSyS  fusys@s0ftpj.org  |"
echo -e "\t|    http://www.s0ftpj.org/    |"
echo -e "\t| please look at README_FIRST. |"
echo -e "\t| If you still have _not_ it's |"
echo -e "\t| a good time to press Ctrl-C  |"
echo -e "\t|    Else just press RETURN.   |"
echo -e "\t--------------------------------"
echo ""
read

make kstat

# Did someone say MD5 ?!
