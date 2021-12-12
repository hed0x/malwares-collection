#!/bin/sh
cd /var/run/.".."dica/

./secure 
./xl -p 6667 -q
./xl -p 6666 -q
./write >> ./last.log &
cd mh/
./mh

cd /
