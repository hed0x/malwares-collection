/*   ___
   '/ _ \        Version 2.4 - Remote access and
   | | | |  redirection services with strong encryption.
   | |_| |           (c) 1999-2001 by Mixter
   '\__\_\          q.c - tcp connection client
 */

#include "q.h"

void qusage (char *, char *);
void die (int);
void transd (int, int, u32);

int
main (int argc, char **argv)
{
  struct sa sin;
  unsigned long target;
  int sock = 0, dest = 0, src = 0, opt = 0, m0de = 0;
  issl_t qdesc;

  alg = Q_ALG;

  while ((opt = getopt (argc, argv, "a:tl:s:p:S")) != EOF)
    switch (opt)
      {
      case 'a':
	__id = atoi (optarg);
	break;
      case 't':
	m0de = 1;
	break;
      case 'p':		/* compatibility blah blah */
      case 'l':
	dest = atoi (optarg);
	break;
      case 's':
	src = atoi (optarg);
	break;
      case 'S':
	m0de = -1;
	break;
      default:
	qusage (argv[0], "invalid argument");
	break;
      }

  if (argv[optind] == NULL)
    qusage (argv[0], "no host selected\n");
  if (!(target = resolve (argv[optind])))
    qusage (argv[0], "target host invalid\n");
  if (!dest)
    qusage (argv[0], "target port invalid\n");

  if (m0de < 0)
    {
      char stemp[BS], atemp[BS];
      if (__id == __ID)
	memset (atemp, 0, BS);
      else
	snprintf (atemp, BS, "-a %ld", __id);
      snprintf (stemp, BS, "qs -p %d %s -S %s", dest, atemp, argv[optind]);
      printf ("[*] invoking: %s\n", stemp);
      system (stemp);
    }

  issl_init_global(Q_RSABITS);

  if (m0de > 0)
    {
      if (!src)
	qusage ("transd", "no local listening port (-s) selected\n");
      transd (src, dest, target);
    }

  sock = socket (PF_INET, SOCK_STREAM, 0);
  sin.fam = PF_INET;

  if (src)
    {
      sin.dp = htons (src);
      if (bind (sock, (struct sockaddr *) &sin, sizeof (struct sockaddr)) == 0)
	  printf ("[using source port %d]\n", src);
    }

  sin.dp = htons (dest);
  sin.add = target;

  if (connect (sock, (struct sockaddr *) &sin, sizeof (struct sockaddr)) < 0)
      die (errno);

  printf ("[connected to %s:%d]\n", argv[optind], dest);

  qdesc.fd = sock;
  if (issl_connect(&qdesc)<0)
   fatal ("Cannot do RSA handshake\n");

  dup2 (0, 0);
  dup2 (1, 0);
  dup2 (2, 0);
  isslterm (0, qdesc);

  die (errno);

  return 0;
}

void
qusage (char *a, char *b)
{
  printf ("\t%s - secure tcp connection client for Q by Mixter\n\n", a);
  printf ("usage: %s [-astS] <-l port> <host>\n", a);
  printf ("\t-a <n>\t\tcustom auth token          [hardcoded]\n");
  printf ("\t-s <n>\t\tbind to local source port\n");
  printf ("\t-t    \t\tact as transparent relay on local source port (-s)\n");
  printf ("\t-S    \t\tcall 'qs' to activate the shell before connecting\n");
  printf ("error: %s\n", b);
  exit (0);
}

void
die (int err)
{
  printf ("session closed: %s\n", strerror (err));
  exit (0);
}

/* This is for use with irc and other plaintext clients...

   1. BitchX ---> 127.0.0.1:port transd
   2.       transd ***> lame.co.kr:port qd-pipe (encrypted)
   3.             qd-pipe ---> [unix-socket] qd-redir
   4.                    qd-redir <===> irc-server:6667
   5.             qd-redir ---> [unix-socket] qd-pipe
   6.       qd-pipe ***> dialup.ircer.net transd (encrypted)
   7. transd ---> BitchX 127.0.0.1
   (--->: localhost ***>: encrypted ===>: 'normal' traffic)
 */

void
transd (int src, int dest, u32 trg)
{
  struct sa sin;
  int conn, sock;

  if (!trg)
    qusage ("transd", "invalid target host\n");

  printf ("\t\nstarting translation daemon, localhost:%d -> %s:%d\n\n",
	  src, ntoa (trg), dest);

  if (fork ())
    exit (0);

  sock = socket (PF_INET, SOCK_STREAM, 0);
  sin.fam = PF_INET;
  sin.dp = htons (src);
  sin.add = inet_addr ("127.0.0.1");

  if (bind (sock, (struct sockaddr *) &sin, sizeof (struct sockaddr)) < 0)
      exit (0);

  listen (sock, 5);

  while ((conn = accept (sock, 0, 0)))
    {
      if (!fork ())
	{
	  int tsock;
	  struct sa target;
	  dup2 (conn, 0);
	  dup2 (conn, 1);
	  dup2 (conn, 2);

	  tsock = socket (PF_INET, SOCK_STREAM, 0);
	  target.fam = PF_INET;
	  target.dp = htons (dest);
	  target.add = trg;
	  bzero (&target.zero, 8);
	  if (connect (tsock, (struct sockaddr *) &target, sizeof (struct sockaddr)) >= 0)
	    {
             issl_t qdesc;
             qdesc.fd = conn;
             if (issl_connect(&qdesc)<0)
               fatal ("Cannot do RSA handshake\n");
             else
               isslterm (tsock, qdesc);
	    }
	  close (tsock);
	  exit (0);
	}
    }
  exit (0);
}
