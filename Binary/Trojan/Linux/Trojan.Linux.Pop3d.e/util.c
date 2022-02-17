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
 *      Modified by 
 *	Fabio Coatti
 *	cova@felix.unife.it
 *	Now verify_user() can verify no-shadow passwd file even
 * 	if compiled with -DSHADOWPWD
 *
 **************************************
 *
 *	util.c
 *
 *	REVISIONS:
 *		02-27-90 [ks]	original implementation
 *	1.000	03-04-90 [ks]
 *      1.001   29-04-97 [cova]
 */

#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <pwd.h>
#include <syslog.h>
#include <unistd.h>
#include <netdb.h>

#ifdef SHADOWPWD
#include <shadow.h>
#endif

#include "pop3.h"

char flash_buf[SVR_BUFSIZ];

extern FILE *logfp;
extern int mypid;
extern int debug;

/**************************************************************************/

int
passwd_verify_user(user,pass)
char *user;
char *pass;
{
	struct passwd *pwd;
	char *cp;
#ifdef SHADOWPWD
	struct spwd *spwd = NULL;
#endif
	/* DTS added 03July96 to force lower case names */
	for(cp=user; *cp; cp++) { *cp = tolower(*cp); }

	pwd = getpwnam(user);
	if (pwd == NULL) return -1;
 	if (pwd->pw_passwd[0] == '!' || !strcmp(pwd->pw_passwd,"*NONE*")) {
 		syslog (SYSLOGPRI, "User locked: %s", user);                	
        	return -1;
        }
 	if ( !strncmp(pwd->pw_shell,ACCT_SUSP_STR,strlen(ACCT_SUSP_STR))) {
        	return -2;
        }
#ifdef SHADOWPWD
	/* If the user exists in /etc/passwd (pwd), check to see if his
	 *   password in /etc/passwd is possibly valid, if so, use it.
	 */
	if (pwd && (strlen(pwd->pw_passwd) == 1) ) {
	    if (pwd->pw_passwd[0] == 'x' || pwd->pw_passwd[0] == '*') {
        	spwd = getspnam(user);
                if (!spwd) {
                	syslog (SYSLOGPRI,
				"No shadow entry for user %s",user);
                	return -1;
                }
                pwd->pw_passwd = spwd->sp_pwdp;
	   }
        }
#endif	
	if( !strcmp( pwd->pw_passwd, crypt(pass,pwd->pw_passwd)) )
	       	return(setuid(pwd->pw_uid));
        else
		return(-1);

} /* end passwd_verify_user */

/* Verify a usercode/password */
int
verify_user(user,pass)
char *user;
char *pass;
{
#ifdef TACACS_AUTH
	return( tacacs_verify_user(user,pass) );
/*  #elif VIRTUAL
 *	return( virtual_verify_user(user,pass) );
 */
#else
	return( passwd_verify_user(user,pass) );
#endif
}

/**************************************************************************/

/* Read a line of text from a stream. If more than n-1  */
/* characters are read without a line terminator (LF),  */
/* discard characters until line terminator is located. */
char *
fgetl(buf,n,fp)
char *buf;	/* Buffer for text */
int n;		/* Size of buffer */
FILE *fp;	/* Stream to read from */
{
	if (fgets(buf,n,fp) == NULL)
		return(NULL);
	if ((strlen(buf) == (n-1))&&(buf[n-1] != LF_CHAR)) {
		buf[n-1] = LF_CHAR;
		while (fgets(flash_buf,SVR_BUFSIZ,fp) != NULL) {
			if (strlen(flash_buf) != (SVR_BUFSIZ-1))
				break;
			if (flash_buf[SVR_BUFSIZ-1] == LF_CHAR)
				break;
		}
	}
	return(buf);
}

/* Prepare client command for server */
void
cmd_prepare(buf)
char *buf;
{
	char *cp;

	if (buf == NULL)
		return;
	/* Convert command verb to lowercase */
	while (*buf != NULL_CHAR) {
		if (isupper(*buf))
			*buf = tolower(*buf);
		else if (isspace(*buf))
			break;
		++buf;
	}
	/* Strip trailing whitespace from client command */
	if ((cp = strchr(buf,CR_CHAR)) != NULL) {
		while ((cp != buf)&&(isspace(*cp))) --cp;
		if (!isspace(*cp)) ++cp;
		*cp = NULL_CHAR;
	}
	if ((cp = strchr(buf,LF_CHAR)) != NULL) {
		while ((cp != buf)&&(isspace(*cp))) --cp;
		if (!isspace(*cp)) ++cp;
		*cp = NULL_CHAR;
	}
}

/**************************************************************************/

/* Send an error message and exit POP3 server */
void
fail(err)
int err;
{
	char *cp;

	switch(err) {
	/* DTS 10Oct96 [ 1.005d ] - created error FAIL_DUP_READ */
	case FAIL_DUP_READ:			/* Folder already being read */
		cp = "Folder already being read";
		break;
	case FAIL_FILE_ERROR:			/* File I/O error */
		cp = "File I/O error";
		break;
	case FAIL_HANGUP:			/* Client hung up on us */
		cp = "Lost connection to client";
		break;
	case FAIL_LOST_CLIENT:			/* Timeout waiting for client */
		cp = "Timeout waiting for command from client";
		break;
	case FAIL_OUT_OF_MEMORY:		/* Failed malloc() */
		cp = "Out of memory!";
		break;
	case FAIL_PROGERR:			/* Fatal program error */
		cp = "Fatal program error!";
		break;
	case FAIL_PIPE:				/* Rec'd SIGPIPE - DTS 28Jul96*/
		cp = "Received pipe failure signal!";
		break;
	case FAIL_CONFUSION:			/* Shouldnt happen */
	default:
		cp = "Complete confusion!";
		break;
	}
	fprintf(stdout,"-ERR POP3 Server Abnormal Shutdown: %s\r\n",cp);
	fflush(stdout);
	if ( debug ) {
		fprintf(logfp,"[%d] -ERR POP3 Server Abnormal Shutdown: %s\r\n",mypid,cp);
		fclose(logfp);
	}
	exit(err);				/* Exit with error */
}

/**************************************************************************/

char *
get_fqdn()
{
static char fqdn[SVR_BUFSIZ];
char buff[100];
struct hostent *h;

	if (fqdn[0] != '\0')
		return fqdn;

	if (gethostname(buff, sizeof(buff)) != 0)
	{
		perror("get_fqdn");
		return NULL;
	}

	h = gethostbyname(buff);
	if (!h)
	{
		fprintf(stderr, "get_fqdn: gethostbyname() failed\n");
		return NULL;
	}

	strncpy(fqdn, h->h_name, SVR_BUFSIZ-1);
	return fqdn;
}

/**************************************************************************/


