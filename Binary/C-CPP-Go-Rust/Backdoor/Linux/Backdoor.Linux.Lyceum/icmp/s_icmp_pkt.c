
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

char retbuf[BUFSIZ];

char *
s_icmp_pkt (char *msg)
{
  extern unsigned long realip;

  snprintf (retbuf, BUFSIZ, "1:%ld:%s", realip, msg);

  retbuf[strlen (retbuf)] = '\0';

  return (char *) retbuf;
}

char *
c_icmp_pkt (char *msg, unsigned long zombie_ip)
{
  extern unsigned long realip;

  if (zombie_ip)
    snprintf (retbuf, BUFSIZ, "0:%ld:%ld:%s", realip, zombie_ip, msg);
  else
    snprintf (retbuf, BUFSIZ, "0:%ld:0:%s", realip, msg);


  retbuf[strlen (retbuf)] = '\0';

  return (char *) retbuf;
}

#ifdef _CLIENT_

char *
get_icmp_proto_by_name (int type)
{
  switch (type)
    {
    case 0:
      return "Echo Reply";
    case 3:
      return "Destination Unreachable";
    case 4:
      return "Source Quench";
    case 5:
      return "Redirect (change route)";
    case 8:
      return "Echo Request";
    case 11:
      return "Time Exceeded";
    case 12:
      return "Parameter Problem";
    case 13:
      return "Timestamp Request";
    case 14:
      return "Timestamp Reply";
    case 15:
      return "Information Request";
    case 16:
      return "Information Reply";
    case 17:
      return "Address Mask Request";
    case 18:
      return "Address Mask Reply";
    }
  return NULL;
}

void
print_icmp_types (void)
{

  int icmp_numbers[] = {
    0,
    3,
    4,
    5,
    8,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    -1
  };

  int count = 0;

  while ((icmp_numbers[count]) != -1)
    {
      printf ("%d - %s\n", icmp_numbers[count],
	      get_icmp_proto_by_name (icmp_numbers[count]));
      count++;
    }
  exit (0);
}

#endif
