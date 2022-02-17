/*   ___
   '/ _ \        Version 2.4 - Remote access and
   | | | |  redirection services with strong encryption.
   | |_| |           (c) 1999-2001 by Mixter
   '\__\_\    mkpass.c - password include generator
 */

#define MKPASS_C
#include "q.h"
#include <pwd.h>
#include <sys/stat.h>

#define H_ENT1 "/* password/encryption token include file - delete after compiling! */\n#ifndef PW_H\n#define PW_H\n#define __ID "
#define H_ENT2 "\n#endif\n"

int
main (void)
{
  char tmp[10];
  int fd;
  alg = Q_ALG;

  fd = open ("hash.h", O_WRONLY | O_TRUNC | O_CREAT, 0600);

  write (fd, H_ENT1, strlen (H_ENT1));
  sprintf (tmp, "%ld", getrandom (0, 2147483647));
  write (fd, tmp, strlen (tmp));
  write (fd, H_ENT2, strlen (H_ENT2));

  close (fd);

  return (0);
}
