#!/bin/sh
while true
	do
	CLASS=`./randb`
	./pscan $CLASS 515
	./check
done
