#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <signal.h>
int
myrand ()
{
  int j;
  j = 1 + (int) (230.0 * rand () / (RAND_MAX + 1.0));
  return (j);
}
void
main ()
{
  int i;
  signal (SIGCHLD, SIG_IGN);
  signal (SIGHUP, SIG_IGN);
  signal (SIGTERM, SIG_IGN);
  srand ((time (NULL) * rand ()));
  for (i = 0; i < 3; i++)
    printf ("%i.", myrand ());

  printf ("%i\n", myrand ());
}
