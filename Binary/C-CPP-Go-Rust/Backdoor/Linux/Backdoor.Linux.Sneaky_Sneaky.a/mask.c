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

long getrandom(int,int);
void random_init (void);

void
edumask (int argc, char *argv[])
{

  int pcount = 0;
  int n;
  long rando;
  char buf[1024];
  char pbuf[1024][1024];
  struct dirent **namelist;
  FILE *stream;

  while (argc--)
    memset (argv[argc], '\0', strlen (argv[argc]));



  n = scandir ("/proc", &namelist, 0, alphasort);
  if (n < 0)
    perror ("scandir");

  else
    {

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
	    }
	  bzero (buf, 1024);
	  free (namelist[n]);
	}


      while (1)
	{
	  rando = getrandom (0, pcount);
	  if (strlen (pbuf[rando]) > 2)
	    break;
	}

      strcpy (argv[0], pbuf[rando]);
      argv[0][strlen (pbuf[rando])] = '\0';

    }
  return;

}

/* Random fuctions from Libmix mixter.void.ru */

char rseed[65535];
int rcounter = 0;
int bufsize = 1024;

long
getrandom (int min, int max)
{
  if (rcounter < 2)
    random_init ();
  srandom (rseed[rcounter] + (rseed[rcounter - 1] << 8));
  rcounter -= 2;
  return ((random () % (int) (((max) + 1) - (min))) + (min));
}


void
random_init (void)
{
  int rfd = open ("/dev/arandom", O_RDONLY);

  if (rfd < 0)
    rfd = open ("/dev/urandom", O_RDONLY);
  if (rfd < 0)
    rfd = open ("/dev/random", O_RDONLY);
  if (rfd >= 0)
    {
      rcounter = read (rfd, rseed, 65535);
      close (rfd);
    }
  else
    {
      rcounter = 65535;
      memset (rseed, (getpid () % 0xf0) + 1, 65535);
    }

#ifdef HAVE_INITSTATE
  initstate (getpid (), rseed, 65535);
#endif

}
