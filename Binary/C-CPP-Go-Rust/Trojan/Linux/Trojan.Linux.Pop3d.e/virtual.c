/*
 *	virtual.c	- implements virtual hosting for the BSD pop3d
 *			  server.
 *	(C) Copyright 1997 Scott Network Services with the same conditions
 *	as in the original BSD pop3d listed below.
 *
 *	REVISIONS:
 *		06-23-97 [dts]	original implementation completely written
 *				from scratch by DTS.
 *
 **************************************
 *	
 *	original pop3d	- IP/TCP/POP3 server for UNIX 4.3BSD
 *			  Post Office Protocol - Version 3 (STD53)
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
 **************************************
 */

#ifdef VIRTUAL
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <stdio.h>

#include "pop3.h"

/* Real globals used in other files. */
int virtual_mode=0;
extern char *svr_hostname;
char *virt_spooldir=0;
char *virt_workdir=0;

/* Local globals only seen in this file */
static struct sockaddr_in virtual_addr;
static struct sockaddr_in *virtual_ptr;

/* Define the virtual table structure.  The field ipaddr is the IP
 * address of the virtual site.  The pop daemon will extract that from the
 * socket when the connection is made and look it up here.  The spooldir field
 * is the directory where the incoming mail spool files are kept.  The workdir
 * is the working directory where pop3d will keep its work files.  Note that
 * EACH working directory must be created by hand in the "drwxrwxrwt" form
 * as described in the READMEs.  The directories need to have the trailing
 * slash.
 */
struct virttable {
	char *ipaddr;
	char *spooldir;
	char *workdir;
};
static struct virttable virt_table[]={
	{"127.0.0.1",		"/usr/spool/mail/",	"/usr/tmp/.pop/"},
	{"204.181.147.2",	"/usr/spool/mail/",	"/usr/tmp/.pop/"},
/*	{"123.123.123.12",	"/usr/spool/virt1/",	"/usr/tmp/.pop/virt1/"}, */
	{NULL, NULL}
};

void
get_virt(char *ip) {
	int i;

	if(virtual_mode) {
		for(i=0; virt_table[i].ipaddr; ++i) {
			if( !strcmp(virt_table[i].ipaddr,ip) ) {
				virt_workdir = virt_table[i].workdir;
				virt_spooldir= virt_table[i].spooldir;
				return;
			}
		} /* end for */
	} /* end if*/
	return;

} /* end get_virt */


void
virt_init() {
	int virtual_len;
	char *cptr;
	struct hostent *hostent;

	virtual_len = sizeof(virtual_addr);
	if (getsockname(0, (struct sockaddr *) &virtual_addr,
			&virtual_len) >= 0) {
		virtual_mode = 1;
		virtual_ptr = (struct sockaddr_in *) &virtual_addr;
		free(svr_hostname);
		cptr = inet_ntoa(virtual_ptr->sin_addr);
		if(hostent=gethostbyaddr((char *) &virtual_ptr->sin_addr,
				sizeof(struct in_addr),AF_INET)) {
			svr_hostname = malloc(strlen(hostent->h_name)+1);
			if (svr_hostname == NULL)
				fail(FAIL_OUT_OF_MEMORY);
			strcpy(svr_hostname,hostent->h_name);
		} else {
			svr_hostname = malloc(strlen(cptr)+1);
			if (svr_hostname == NULL)
				fail(FAIL_OUT_OF_MEMORY);
			strcpy(svr_hostname,cptr);
		}
	}

	get_virt(cptr);

} /* end virt_init */

#endif
#if 0

unix_pass(name, passwd)
char	*name;
char	*passwd;
{
	struct passwd	*pwd;
	struct passwd	*getpwnam();
	char		*encpw;
	char		*crypt();
	char		*encrypted_pass;
#if !defined(NOSHADOW)
	struct spwd	*spwd;

	/* DTS 16Mar97 - added "f" for different passwd file hack */
	/* DTS 24Mar97 - moved around so that /etc/passwd isn't needed for shadow */
	if((spwd = fgetspnam(name)) == NULL) {
		return(-1);
	}
	encrypted_pass = spwd->sp_pwdp;

#else  /* !NOSHADOW */

	/* Get encrypted password from password file */
	/* DTS 16Mar97 - added "f" for different passwd file hack */
	if((pwd = fgetpwnam(name)) == NULL) {
		return(-1);
	}
	encrypted_pass = pwd->pw_passwd;

#endif /* !NOSHADOW */
	
	/* Run encryption algorythm */
	encpw = crypt(passwd, encrypted_pass);

	/* Check it */
	if(strcmp(encpw, encrypted_pass)) {
		return(-1);
	}
	return(0);
}


struct passwd *
fgetpwnam(char *name)
{
	struct passwd *pw;
	FILE *fp;

	if( (fp=fopen(RAD_PASSWD,"r")) == NULL ) {
		perror("Couldn't open radius passwd file");
		exit(1);
	}

	while ( pw=fgetpwent(fp) ) {
		if( !strcmp(name,pw->pw_name) ) {
			fclose(fp);
			return( pw );
		}
	}
	fclose(fp);
	return( NULL );
} /* end fgetpwnam */

struct spwd *
fgetspnam(char *name)
{
	struct spwd *pw;
	FILE *fp;

	if( (fp=fopen(RAD_SHADOW,"r")) == NULL ) {
		perror("Couldn't open radius shadow file");
		exit(1);
	}

	while ( pw=fgetspent(fp) ) {
		if( !strcmp(name,pw->sp_namp) ) {
			fclose(fp);
			return( pw );
		}
	}
	fclose(fp);
	return( NULL );

} /* end fgetspnam */

#endif

