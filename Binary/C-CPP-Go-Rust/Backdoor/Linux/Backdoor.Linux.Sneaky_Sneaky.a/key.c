#include <stdio.h>
#include <unistd.h>
#include <string.h>

char *ukey = "p";

char *
key (void)
{

#ifdef PLN
  return NULL;
#endif /*PLN*/
    while ((strlen (ukey)) < 8)
    {
      ukey = getpass ("key: ");

      if ((strlen (ukey)) < 8)
	printf ("Key to short\n");

    }

  return ukey;

}
