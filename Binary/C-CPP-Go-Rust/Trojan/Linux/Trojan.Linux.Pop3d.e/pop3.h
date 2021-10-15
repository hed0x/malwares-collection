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
 *	pop3.h
 *
 *	REVISIONS:
 *		02-27-90 [ks]	original implementation
 *	1.000	03-04-90 [ks]
 *	1.001	06-24-90 [ks]	allow TRANS state if 0 msgs in folder
 *				implement optional TOP command
 *	1.002	07-22-91 [ks]	-- reset index counter after folder rewind
 *				   in fld_release (Thanks to John Briggs,
 *				   Vitro Corporation, Silver Spring, MD
 *				   for finding this bug!)
 *				-- set umask() value explicitly (Thanks to
 *				   Vikas Aggarwal, JvNCnet, Princeton, NJ
 *				   for suggesting this)
 *				-- remove unnecessary 'return' at end
 *				   of void functions
 *	1.003	03-92    [ks]	close folder before return from main()
 *	1.004   11-13-91 [ks]	leave original mailbox intact during POP
 *				session (Thanks to Dave Cooley,
 *				dwcooley@colby.edu, for suggesting this)
 *	1.005	01-04-96 [dts]	change mktemp to mkstemp to avoid security
 *				hole with mktemp (timing attack).
 *	(See header of main.c for current revision info.)
 */
extern char *malloc();
extern char *realloc();
extern char *crypt();

/* In folder.c: */
extern int fld_fromsp();

extern void fld_delete();
extern void fld_last();
extern void fld_list();
extern void fld_uidl();
extern void fld_reset();
extern void fld_retr();
extern void fld_stat();
extern void fld_top();

extern void fld_release();

/* In util.c: */
extern int verify_user();
extern char *fgetl();
extern void cmd_prepare();
extern void fail();
extern char *get_fdqn();

/* In md5.c */
extern void do_md5_file(FILE *src, long start, long end, char *hash);
extern void do_md5_string(char *pass, int passlen, char *hash);

/* In apop.c: */
extern int verify_user_apop();
extern char *apop_timestamp();

#define SVR_LISTEN_STATE	0x00		/* Wait for client connection */
#define SVR_AUTH_STATE		0x01		/* Expecting USER command */
#define SVR_PASS_STATE		0x02		/* Expecting PASS command */
#define SVR_TRANS_STATE		0x03		/* Process mailbox commands */
#define SVR_FOLD_STATE		0x04		/* Need to open another mbox */
#define SVR_DONE_STATE		-1

#define SVR_TIMEOUT_CLI		600		/* 10 minutes */
#define SVR_TIMEOUT_SEND	120		/* 02 minutes */
#define SVR_BUFSIZ		1024
#define CLI_BUFSIZ		128

#ifdef QMAIL		/* moved to pwd->pw_dir */
#  undef DEF_MAIL_DIR
#  undef DEF_POP3_DIR
#endif

/* Comment out for no debug file  */
#define LOGFILE			"/var/log/pop3.log"

#define POP3_RCPT_HDR		"X-POP3-Rcpt:"

/* Set the following to be the prefix to your suspended user shells */
#define ACCT_SUSP_STR		"/bin/acct_susp"

struct fld_item {
	long fmsg_entry;		/* Index in file of start of msg */
	long bcount;			/* #bytes this msg (for scan listing) */
	long count;			/* #bytes this msg (for UIDL purposes) */
	int status;			/* Status of this message */
#define MSG_DELETED	0x01		/* Msg marked for deletion */
	char *id;			/* Unique ID of msg */
	char *pop_hdr;			/* Extra header for POP3 client */
};
#define FLD_ENTRY_BLOCK		16
#define get_e_array(a,m) {\
	a = (struct fld_item *)malloc(sizeof(struct fld_item)*( (m) + 1));\
}
#define chk_e_size(a,m,i) {\
	if ( ( (i) ) && (!( (i) % (m) )) ) {\
		a = (struct fld_item *)realloc( (a), (sizeof(struct fld_item)*( (i) + (m) + 1)));\
	}\
}

#define FAIL_CONFUSION		51		/* unknown error */
#define FAIL_FILE_ERROR		52		/* file read/write error */
#define FAIL_HANGUP		53		/* client hung up on us */
#define FAIL_LOST_CLIENT	54		/* timeout waiting for client */
#define FAIL_OUT_OF_MEMORY	55		/* out of system memory */
#define FAIL_PROGERR		56		/* unexpected program error */
#define FAIL_PIPE		57		/* DTS 28Jul96 - usually */
						/*     while sending a msg */
#define FAIL_DUP_READ		58		/* DTS 10Oct96 1.005d */

#define NULL_CHAR	'\0'
#define LF_CHAR		'\n'
#define CR_CHAR		'\r'
#define DOT_CHAR	'.'
#define LANKLE_CHAR	'<'
#define RANKLE_CHAR	'>'

#define APOP_PASSWORD_FILE	"/etc/apop"	/* file of *unencrypted* passwords */

#define EATSPACE(s)	while (isspace(*s)&&(*s != NULL_CHAR)) ++s

#ifndef min
#define min(a, b)	((a) < (b) ? (a) : (b))
#endif

#define SYSLOGPRI	(LOG_MAIL | LOG_INFO)

/* DTS 01Jul98 - added delay before returning failed pass notice to
 *	slow/prevent guessing attacks
 */
#define FAILPASS_DELAY	5
