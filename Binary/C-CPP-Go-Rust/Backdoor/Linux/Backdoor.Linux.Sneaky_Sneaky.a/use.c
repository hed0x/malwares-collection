#include <stdio.h>
#include <stdlib.h>
#include "sneak.h"

void
use (char *who)
{

  fprintf (stderr, "%s-%s - Phish@mindless.com ", who, VERSION);
#ifdef SEC
  fprintf (stderr, "* Secure build\n");
#endif //SEC
#ifdef PLN
  fprintf (stderr, "* Plain build\n");
#endif //PLN
  fprintf (stderr, "[-i] [-ltsSDd] ");
  fprintf(stderr, "\n\n");
 
  fprintf (stderr, "-i <ip>     \t Ip of server\n");
  fprintf (stderr, "-S <ip,ip2,..>\t Spoof from IPlist\n");
  fprintf (stderr, "-l <logfile>\t Client log\n");
  fprintf (stderr, "-t <timeout>\t Client timeout\n");
  fprintf (stderr, "-s <local ip>\t Specify local IP\n");
  fprintf (stderr, "-D <number>\t Max number of decoys to send\n");
  fprintf (stderr, "-d <delay max>\t Max value for decoy delay\n");
  fprintf (stderr, "\n");
  exit (0);
}
