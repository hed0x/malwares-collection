
#include <stdio.h>
#include <string.h>

#include <unistd.h>
#include <time.h>
#include <pwd.h>

/* syslog by A. van Veen <Andre.C.VanVeen@ruhr-uni-bochum.de> 1999-04-11 
/**************************************************************************/
#ifndef NO_SYSLOG
#include <syslog.h>
#endif
/**************************************************************************/
#include <sys/types.h>

#include "pop3.h"

/* added by Glynn Clements <glynn@sensei.co.uk> 1997-06-02 */

/**************************************************************************/

static char timestamp[256];
static int stamplen;

/**************************************************************************/

char *
apop_timestamp()
{
	time_t t;
	struct tm *tm;

	time(&t);
	tm = localtime(&t);
	strftime(timestamp, sizeof(timestamp), "<%a %b %d %H:%M:%S %Y>", tm);

	return timestamp;
}

/**************************************************************************/

/* Verify a usercode/password-hash */
int
verify_user_apop(user, pass)
char *user;
char *pass;
{
	char buff[1024];
	int userlen, passlen;
	FILE *fp;
	char *p, *q;
	struct passwd *pwd;

	for (p = user; *p; p++)
		*p = tolower(*p);
	userlen = p - user;

	pwd = getpwnam(user);
	if (!pwd) return -1;	/* User not found, return error */

	fp = fopen(APOP_PASSWORD_FILE, "r");
	if (!fp)
	{
#ifndef NO_SYSLOG
		syslog( SYSLOGPRI, "Could not open %s", APOP_PASSWORD_FILE);
#endif
		return -1;
	}

	while (1)
	{
		if (feof(fp))
		{
#ifndef NO_SYSLOG
			syslog( SYSLOGPRI, "User not found in %s: %s",
				APOP_PASSWORD_FILE, user);
#endif
			return -1;
		}

		fgets(buff, sizeof(buff), fp);
		if (strncmp(buff, user, userlen) != 0)
			continue;
		if (buff[userlen] != ':')
			continue;

		q = timestamp + strlen(timestamp);
		for (p = buff + userlen + 1; *p && *p != '\n'; p++, q++)
			*q = *p;
		passlen = q - timestamp;
		break;
	}
	fclose(fp);

	do_md5_string(timestamp, passlen, buff);
	if (strcmp(pass, buff) != 0) return -1;

	if (setuid(pwd->pw_uid) < 0)
	{
#ifndef NO_SYSLOG
		syslog( SYSLOGPRI, "[APOP]: Could not setuid()");
#endif
		return -1;
	}

	return 0;
}

/**************************************************************************/

