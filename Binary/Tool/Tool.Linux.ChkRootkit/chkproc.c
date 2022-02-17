/*
  (C) Nelson Murilo - 2004/09/13
  Version 0.9
  C port from chkproc.pl code from Klaus Steding-Jessen <jessen@nic.br>
  and Cristine Hoepers <cristine@nic.br> +little output changes.

  2002/03/02 - Segmentation fault in ps for non ASCII user name, by RainbowHat

  2002/06/13 Updated by Kostya Kortchinsky <kostya.kortchinsky@renater.fr>
  - corrected the program return value ;
  - added a verbose mode displaying information about the hidden process.

  2002/08/08 - Value of MAX_PROCESSES was increased to 99999 (new versions
    of FreeBSD, HP-UX and others), reported by Morohoshi Akihiko, Paul
    and others.

  2002/09/03 - Eliminate (?) false-positives. Original idea from Aaron Sherman.

  2002/11/15 - Updated by Kostya Kortchinsky <kostya.kortchinsky@renater.fr>
  - ported to SunOS.

  2003/01/19 - Another Adore based lkm test. Original idea from Junichi Murakami

  2003/02/02 - More little fixes - Nelson Murilo

  2003/02/23 - Use of kill to eliminate false-positives abandonated, It is
  preferable false-positives that false-negatives. Uncomment kill() functions
  if you like  it.

  2003/06/07 - Fix for NPTL threading mechanisms - patch by Mike Griego

  2003/09/01 - Fix for ps mode detect, patch by Bill Dupree and others

  2004/04/03 - More fix for linux's threads - Nelson Murilo

  2004/09/13 - More and more fix for linux's threads - Nelson Murilo

*/

#if !defined(__linux__) && !defined(__FreeBSD__) && !defined(__sun)
int main (){ return 0; }
#else
#include <stdio.h>
#include <errno.h>
#include <sys/types.h>
#include <dirent.h>
#include <ctype.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#if defined(__sun)
#include <procfs.h>
#include <fcntl.h>
#endif

#define PS_SUN 0
#define PS_COM 1
#define PS_LNX 2
#define PS_MAX 2

#if defined(__sun)
#define FIRST_PROCESS 0
#else
#define FIRST_PROCESS 1
#endif
#define MAX_PROCESSES 99999
#define MAX_BUF 1024

static char *ps_cmds[] = {
	    "ps -edf",
	    "ps mauxw",
            "ps auxw -T|tr -s ' '|cut -d' ' -f2-",
          };

int psproc [MAX_PROCESSES+1];
int dirproc[MAX_PROCESSES+1];
#if defined(__linux__)
int isathread[MAX_PROCESSES+1];
#endif

int main(int argc, char **argv)
{
   char buf[MAX_BUF], *p, path[MAX_BUF];
   char *pscmd = (char *)0;
   FILE *ps;
   DIR *proc = opendir("/proc");
   struct dirent *dir;
   int i, j, retps, retdir, pv, verbose;
   long ret = 0L;
   char * tmp_d_name;
#if defined(__linux__)
   int maybeathread;
#endif
#if defined(__sun)
   psinfo_t psbuf;
#endif

   pv = verbose = 0; 

   if (!proc)
   {
      perror("proc");
      exit (1);
   }
   for (i = 1; i < argc; i++)
   {
      if (!memcmp(argv[i], "-v", 2))
	verbose++;
      else if (!memcmp(argv[i], "-?", 2))
      {
	printf("Usage: %s [-v] [-v]\n", argv[0]);
	return 0;
      }
#if defined(__linux__)
      else if (!memcmp(argv[i], "-p", 2))
        if (i+1 < argc) 
           pv = atoi(argv[++i]);
        else
        {
	   printf("Usage: %s [-v] [-v] [-p procps version]\n", argv[0]);
	   return 0;
        }
#endif
   }
#if defined(__sun)
   pscmd = ps_cmds[PS_SUN];
#elif !defined (__linux__)
   pscmd = ps_cmds[PS_COM];
#endif
#if defined(__linux__)
   if (pv < 1 || pv > PS_MAX)
      pv = 1;
   pscmd = ps_cmds[pv];
/*  printf("pv = %d\n\r", pv); /* -- DEBUG */
#endif

/* printf("pscmd = %s\n\r", pscmd); /* -- DEBUG */ 
   if (!(ps = popen(pscmd, "r")))
   {
       perror("ps");
       exit(errno);
   }

   *buf = 0;
   fgets(buf, MAX_BUF, ps); /* Skip header */
#if defined(__sun)
   if (!isspace(*buf))
#else
   if (!isalpha(*buf))
#endif
   {
     fgets(buf, MAX_BUF, ps); /* Skip header */
     if (!isalpha(*buf) && pv != PS_LNX)
     {
        fprintf(stderr, "OooPS!\n");
        exit(2);
     }
   }
   for (i = FIRST_PROCESS; i <= MAX_PROCESSES; i++) { /* Init matrix */
     psproc[i] = dirproc[i] = 0;
#if defined(__linux__)
     isathread[i] = 0;
#endif
   }

   while (fgets(buf, MAX_BUF, ps))
   {
      p = buf;
#if defined(__sun)
      while (isspace(*p)) /* Skip spaces */
          p++;
#endif
      while (!isspace(*p)) /* Skip User */
          p++;
      while (isspace(*p)) /* Skip spaces */
          p++;
/*  printf(">>%s<<\n", p);  /* -- DEBUG */
      ret = atol(p);
      if ( ret < 0 || ret > MAX_PROCESSES )
      {
         fprintf (stderr, " OooPS, not expected %d value\n", ret);
         exit (2);
      }
      psproc[ret] = 1;
   }
   pclose(ps);

   while ((dir = readdir(proc)))
   {
#if defined(__linux__)
      maybeathread = 0;
#endif
      tmp_d_name = dir->d_name;
      if (!strcmp(tmp_d_name, ".") || !strcmp(tmp_d_name, ".."))
         continue;
#if defined(__linux__)
      if (*tmp_d_name == '.') { /* here we catch the new NTPL threads in linux.  They are listed in /proc as PIDs with a period prepended */
         tmp_d_name++;
         maybeathread = 1;
      }
#endif
      if(!isdigit(*tmp_d_name))
         continue;
#if defined(__linux__)
      else if (maybeathread) {
         isathread[atol(tmp_d_name)] = 1; /* mark it as a linux NTPL thread if it's in the form of "\.[0-9]*" */
         if (verbose)
            printf("%d is a Linux Thread, marking as such...\n", atol(tmp_d_name));
      }
#endif

/*      printf("%s\n", tmp_d_name); /* -- DEBUG */
      dirproc[atol(tmp_d_name)] = 1;
   }
   closedir(proc);

   /* Brute force */
   strcpy(buf, "/proc/");
   retps = retdir = 0;
   for (i = FIRST_PROCESS; i <= MAX_PROCESSES; i++)
   {
      snprintf(&buf[6], 6, "%d", i);
      if (!chdir(buf))
      {
/*         if (!dirproc[i] ) /*  && !kill(i, 0)) */
         if (!dirproc[i] && !psproc[i])
         {
#if defined(__linux__)
            if (!isathread[i]) {
#endif
            retdir++;
            if (verbose)
	       printf ("PID %5d(%s): not in readdir output\n", i, buf);
#if defined(__linux__)
            }
#endif
         }
         if (!psproc[i] ) /* && !kill(i, 0)) */
         {
#if defined(__linux__)
            if(!isathread[i]) {
#endif
            retps++;
            if (verbose)
	       printf ("PID %5d: not in ps output\n", i);
#if defined(__linux__)
            }
#endif
	 }
#if defined(__linux__)
         if(!isathread[i]) {
#endif
/*	 if ((!dirproc[i] || !psproc[i]) && !kill(i, 0) && (verbose > 1)) */
	 if ((!dirproc[i] || !psproc[i]) && (verbose > 1))
	 {
#if defined(__linux__)
	    j = readlink ("./cwd", path, sizeof(path));
	    path[(j < sizeof(path)) ? j : sizeof(path) - 1] = 0;
	    printf ("CWD %5d: %s\n", i, path);
	    j = readlink ("./exe", path, sizeof(path));
	    path[(j < sizeof(path)) ? j : sizeof(path) - 1] = 0;
	    printf ("EXE %5d: %s\n", i, path);
#elif defined(__FreeBSD__)
	    j = readlink ("./file", path, sizeof(path));
	    path[(j < sizeof(path)) ? j : sizeof(path) - 1] = 0;
	    printf ("FILE %5d: %s\n", i, path);
#elif defined(__sun)
	    if ((j = open("./psinfo", O_RDONLY)) != -1)
            {
               if (read(j, &psbuf, sizeof(psbuf)) == sizeof(psbuf))
                  printf ("PSINFO %5d: %s\n", i, psbuf.pr_psargs);
               else
                  printf ("PSINFO %5d: unknown\n", i);
               close(j);
            }
            else
               printf ("PSINFO %5d: unknown\n", i);
#endif
         }
#if defined(__linux__)
         }
#endif
      }
   }
   if (retdir)
      printf("You have % 5d process hidden for readdir command\n", retdir);
   if (retps)
      printf("You have % 5d process hidden for ps command\n", retps);
   kill(1, 100); /*  Check for SIGINVISIBLE Adore signal */
   if ( errno == 3)
   {
      printf("SIGINVISIBLE Adore found\n");
      retdir+= errno;
   }
   return (retdir+retps);
}
#endif
