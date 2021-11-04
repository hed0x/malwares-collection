#!/bin/bash
rm -f ./output.txt ; rm -f ./svcname.txt ; rm -f ./output2.txt ; rm -f ./datapool.bk ; killall -9 -w datapool.sh 1>/dev/null 2>&1 ; for KILLER in ./bin/* ; do killall -9 -w $KILLER 1>/dev/null 2>&1 ; done ; exit $@
