#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define LEN 32

int
main ()
{

  unsigned int get_random (int, int);

  FILE *fp;

  printf ("\nGenerating random access token....");

  fp = fopen ("keygen/key.h", "w");

  fprintf (fp, "#define KEY \"");

  fflush (fp);
  fflush (stdout);

  system
    ("perl keygen/RandPasswd.pm -min 12 -max 24 --algorithm letters | tr '\n' '\"' >> keygen/key.h; echo >> keygen/key.h");

  fclose (fp);

  printf ("done\n\n");

  return 0;
}
