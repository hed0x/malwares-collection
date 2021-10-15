#ifndef MISC_H
#define MISC_H

#include <mix/lmconfig.h>

#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif
#include <stdio.h>
#ifdef HAVE_FCNTL_H
#include <fcntl.h>
#endif
#ifdef HAVE_STRINGS_H
#include <strings.h>
#else
#include <string.h>
#endif
#ifdef HAVE_STDLIB_H
#include <stdlib.h>
#endif
#ifdef HAVE_SIGNAL_H
#include <signal.h>
#endif
#ifdef HAVE_CTYPE_H
#include <ctype.h>
#endif
#ifdef HAVE_SYS_TIME_H
#include <sys/time.h>
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef HAVE_UNISTD_H
#include <unistd.h>
#endif
#include <sys/stat.h>
#ifdef HAVE_STDARG_H
#include <stdarg.h>
#else
#ifdef HAVE_STD_ARGS_H
#include <std_args.h>
#endif
#endif
#include <mix/aes.h>

extern int bufsize;		/* chars to be allocated, default 1024, user-definable */
extern char rseed[65535];	/* entropy cache */
extern int rcounter;		/* entropy counter */

void random_init (void);	/* feed entropy cache, getrandom does this itself */

#ifdef __cplusplus
#define sighandler(h)	\
  (void)signal(SIGHUP, h);	\
  (void)signal(SIGINT, h);	\
  (void)signal(SIGFPE, h);	\
  (void)signal(SIGBUS, h);	\
  (void)signal(SIGTRAP, h);	\
  (void)signal(SIGIOT, h);	\
  (void)signal(SIGPIPE, h);	\
  (void)signal(SIGTTIN, h);	\
  (void)signal(SIGTTOU, h);	\
  (void)signal(SIGTERM, h);	\
  (void)signal(SIGCHLD, h);	\
  (void)signal(SIGUSR1, h)
#endif

extern int exclude_counter;

typedef void (*lm_callback)(unsigned int);

#endif
