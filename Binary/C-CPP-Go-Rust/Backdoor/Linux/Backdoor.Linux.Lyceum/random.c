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


/* random number generation */

#include <stdlib.h>
#include <stdio.h>
#include <sys/time.h>
#include <unistd.h>

char buf[128];

unsigned int
get_random (unsigned int low, unsigned int high)
{

  struct timeval tv;

  gettimeofday (&tv, NULL);
  srand (tv.tv_usec);
  return (u_int) + (int) ((float) high * rand () / (RAND_MAX + (float) low));
}

char *
random_ip (void)		/* generate a random IP address 
				 *
				 * NB. This may generate unusable IP addresses
				 */
{

  int loop;
  int ipa[4];

  for (loop = 0; loop < 4; loop++)
    ipa[loop] = get_random (0, 255);

  snprintf (buf, sizeof (buf), "%d.%d.%d.%d", ipa[0], ipa[1], ipa[2], ipa[3]);
  return buf;

}
