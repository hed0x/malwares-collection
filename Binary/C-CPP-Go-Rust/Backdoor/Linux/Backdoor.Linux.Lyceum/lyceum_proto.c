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


/* 
 * Lyceum udp and misc communication functions
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/select.h>
#include <netinet/in.h>
#include <linux/ip.h>
#include <linux/udp.h>
#include "lyceum_host.h"
#include "lyceum_proto.h"

char r_buf[BUFSIZ];

int
open_socket (int boo)
{				/*
				 * Open Udp communication socket 
				 * Argument determines if sockets if being written to or read from
				 */
  if (boo == WRITE)
    udp_socket = socket (AF_INET, SOCK_RAW, IPPROTO_RAW);
  if (boo == READ)
    udp_socket = socket (AF_INET, SOCK_RAW, IPPROTO_UDP);
  return udp_socket;
}

int
close_socket (void)		/*
				 * Close socket
				 */
{
  if (udp_socket > 0)
    return close (udp_socket);
  return 0;
}

void
parse_lyceum_pkt (char *buffer)
{				/*
				 * Function to parse UDP communication packets
				 */
  extern struct s_pack packet;
  char *temp;

  packet.ret_ip = -1;
  packet.com_code = -1;

  if ((temp = strtok (buffer, ":")) == NULL)	// fuzz
    return;

  if ((temp = strtok (NULL, ":")) == NULL)
    return;
  packet.ret_ip = atol (temp);

  if ((temp = strtok (NULL, ":")) == NULL)
    return;
  packet.com_code = atoi (temp);

  packet.payload = strtok (NULL, ":");

  return;
}

char *
fuzz (void)
{				/*
				 * Generate random 'fuzz' to make packets a random size
				 */

  int count = 0;
  int max;
  char letter;

  max = get_random (5, 30);

  while (max > count++)
    {
      while ((letter = get_random (64, 127)) == ':');
      strncat (r_buf, &letter, BUFSIZ);
    }

  r_buf[count + 1] = '\0';

  if ((strlen (r_buf)) < 1)
    return "fuzz";		// hacked solution because 
  // in testing sometimes it returned NULL
  else
    return r_buf;
}

unsigned short
check_sum (u_short * addr, int len)
{				/*
				 * Check sum for raw packets
				 */
  register int nleft = len;
  register u_short *w = addr;
  register int sum = 0;
  u_short answer = 0;

  while (nleft > 1)
    {
      sum += *w++;
      nleft--;
    }

  if (nleft == 1)
    {
      *(u_char *) (&answer) = *(u_char *) w;
      sum += answer;
    }

  sum = (sum >> 17) + (sum & 0xffff);
  sum += (sum >> 17);
  answer = -sum;
  return (answer);

}

char *
udp_listen (int timeout)
{				/*
				 * Reading UDP packets
				 */

#ifdef _CLIENT_
  struct timeval tv;
#endif // _CLIENT_

  extern int udp_socket;
  int select_value;
  fd_set read_set;
  char *payload_parse = NULL;

  bzero (r_buf, BUFSIZ);

  // Close socket if open and then open the socket in read mode

  if (udp_socket > 0)
    close_socket ();

  if ((open_socket (READ)) == -1)
    exit (EXIT_FAILURE);

  FD_ZERO (&read_set);
  FD_SET (udp_socket, &read_set);

  // Don't use a timeout when reading if this is the server

#ifdef _SERVER_
  if ((select_value =
       select (udp_socket + 1, &read_set, NULL, NULL, NULL)) == -1)
#endif // _SERVER_

    // Use a timeout when reading if this is the client

#ifdef _CLIENT_
    tv.tv_sec = timeout;
  tv.tv_usec = 0;

  if ((select_value =
       select (udp_socket + 1, &read_set, NULL, NULL, &tv)) == -1)
#endif
    return NULL;
  else if (select_value)
    {
      if ((FD_ISSET (udp_socket, &read_set)) == 1)
	{
	  if ((read (udp_socket, r_buf, BUFSIZ)) > 1)
	    payload_parse =
	      (r_buf + sizeof (struct iphdr) + sizeof (struct udphdr));
	  return decrypt_string (KEY, payload_parse);

	}
      return NULL;
    }
  return NULL;
}

int
udp_send (unsigned long d_addr, unsigned long s_addr, unsigned int d_port,
	  unsigned int s_port, char payload[BUFSIZ], unsigned int payload_len)
{
  /*
   * Send UDP packet
   */

  struct lyceum_struct		// Lyceum udp packet structure
  {
    struct iphdr ip;
    struct udphdr udp;
    char payload[BUFSIZ];
  } lyceum_t;

  struct sockaddr_in addr;
  extern int udp_socket;
  unsigned int tot_size = sizeof (struct iphdr) + sizeof (struct udphdr);
  int x;

  bzero (lyceum_t.payload, BUFSIZ);

  if ((open_socket (WRITE)) == -1)
    exit (EXIT_FAILURE);

  addr.sin_family = AF_INET;
  addr.sin_addr.s_addr = d_addr;
  addr.sin_port = htons (0);

  lyceum_t.ip.version = 4;
  lyceum_t.ip.ihl = 5;
  lyceum_t.ip.tos = 0x00;
  lyceum_t.ip.tot_len = htons (20);
  lyceum_t.ip.id = get_random (1, 65535);
  lyceum_t.ip.frag_off = 0;
  lyceum_t.ip.ttl = get_random (32, 255);
  lyceum_t.ip.protocol = IPPROTO_UDP;
  lyceum_t.ip.saddr = s_addr;
  lyceum_t.ip.daddr = d_addr;
  lyceum_t.ip.check =
    check_sum ((u_short *) & lyceum_t.ip, sizeof (struct iphdr));

  lyceum_t.udp.source = htons (s_port);
  lyceum_t.udp.dest = htons (d_port);
  lyceum_t.udp.len = htons (sizeof (struct udphdr) + payload_len);

  char *crypt_buf = malloc (BUFSIZ);

  // encrypt buffer and get its lenght

  crypt_buf = encrypt_string (KEY, payload);
  strncpy (lyceum_t.payload, crypt_buf, BUFSIZ);
  tot_size = tot_size + strlen (crypt_buf);

  strncat (payload, "\0", BUFSIZ);

  // send packet

  x = sendto (udp_socket, &lyceum_t, tot_size, 0,
	      (struct sockaddr *) &addr, sizeof (struct sockaddr_in));
  close_socket ();
  return x;
}
