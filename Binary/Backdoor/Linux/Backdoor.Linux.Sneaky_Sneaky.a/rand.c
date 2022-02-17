#include <stdlib.h>
#include <stdio.h>
#include <sys/time.h>
#include <unistd.h>

char buf[128];

char *
randip (void)
{

  int loop;
  int ipa[4];
  struct timeval seed;

  for (loop = 0; loop < 4; loop++)
    {
      gettimeofday (&seed, NULL);
      srand (seed.tv_usec);
      ipa[loop] = 1 + (int) (255.0 * rand () / (RAND_MAX + 1.0));
    }

  snprintf (buf, sizeof (buf), "%d.%d.%d.%d", ipa[0], ipa[1], ipa[2], ipa[3]);
  return buf;

}
