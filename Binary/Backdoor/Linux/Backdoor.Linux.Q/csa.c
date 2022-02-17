/*   ___
   '/ _ \        Version 2.4 - Remote access and
   | | | |  redirection services with strong encryption.
   | |_| |           (c) 1999-2001 by Mixter
   '\__\_\    csa.c - challenge secret authentication
 */

#include "q.h"

void
isslterm(int p, issl_t c)
{
  char buf[4096];
  fd_set rfds;
  int i;

  while (1)
    {
      FD_ZERO(&rfds);
      FD_SET(p, &rfds);
      FD_SET(c.fd, &rfds);

      if (select((p > c.fd ? p : c.fd) + 1, &rfds, NULL, NULL, NULL) < 1)
	{
	  close(p);
	  close(c.fd);
	  return;
	}

      if (FD_ISSET(c.fd, &rfds))
	{
	  memset(buf, 0, sizeof(buf));
	  if ((i = issl_read(c, buf, sizeof(buf))) < 1)
	    {
	      close(p);
	      close(c.fd);
	      return;
	    }

	  write(p, buf, i);
	}

      if (FD_ISSET(p, &rfds))
	{
	  memset(buf, 0, sizeof(buf));
	  if ((i = read(p, buf, sizeof(buf))) < 1)
	    {
	      close(p);
	      close(c.fd);
	      return;
	    }

	  issl_write(c, buf, i);
	}
    }
}

unsigned long __id = __ID;

/* Challenge Secret Authentication protocol from the WCML
   (Weak Crypto Mixter Labs)... well, at least it prevents
   having to send the authentication password over the wire
 */

void
csa_key (void)
{
  char tmp[64], *a;

  memset (tmp, 0, 64);
  snprintf (tmp, 64, "%ld", __id);
  a = aes_hash (tmp);
  strncpy (tmp, a, 64);
  free (a);
  aes_key (tmp);
}
