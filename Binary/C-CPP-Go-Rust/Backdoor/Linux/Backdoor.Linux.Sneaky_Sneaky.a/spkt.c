#include <stdio.h>

char retbuf[5000];

char *
spkt (char *msg)
{

  extern char *realip;

  snprintf (retbuf, 4068, "%s:%s", realip, msg);
  retbuf[strlen (retbuf)] = '\0';

  return (char *) retbuf;

}
