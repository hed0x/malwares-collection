#!/bin/sh
clear
if [ "$1" = "" ]; then
    echo "Bind mass scanner/rooter"
    echo "Project started by em1nem and EponaRhi"
    echo "* Usage: ./x aaa bbb ccc"
    echo "* aaa, bbb, ccc ** IP Classes"
    echo
    exit 0
fi
echo "* bind mass scanner/rooter"
echo
echo "* here we go ...."
gcc -o bind bind.c  > /dev/null 2>&1
gcc -o scan scan.c  > /dev/null 2>&1
./scan $1 53 $2 $3
