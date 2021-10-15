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
 *	folder.c
 *
 *	REVISIONS:
 *		02-27-90 [ks]	original implementation
 *	1.000	03-04-90 [ks]
 *	1.001	06-24-90 [ks]	allow TRANS state if 0 msgs in folder
 *				implement optional TOP command
 *	1.002	07-22-91 [ks]	reset index counter after folder rewind
 *				in fld_release (Thanks to John Briggs,
 *				vaxs09@vitro.com, Vitro Corporation,
 *				Silver Spring, MD for finding this bug!)
 *	1.004	11-13-91 [ks]	leave original mailbox intact during POP
 *				session (Thanks to Dave Cooley,
 *				dwcooley@colby.edu for suggesting this)
 *	1.005	01-04-96 [dts]	change mktemp to mkstemp to avoid security
 *				hole with mktemp (timing attack).
 */

#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <syslog.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/file.h>
#include "pop3.h"

#ifdef QMAIL
# include <pwd.h>
#endif

#ifdef LINUX
# include <unistd.h>
#endif

#ifdef VIRTUAL
extern int virtual_mode;
extern char *virt_spooldir;
extern char *virt_workdir;
#endif

/* In main.c */
extern char *svr_hostname;
extern char svr_buf[];
extern char cli_user[];

/* In util.c */
extern char flash_buf[];

extern FILE *logfp;
extern int mypid;
extern int debug;

/* Constants used when closing a folder after POP session */
#define REMOVE_MBOX	1
#define SAVE_NEW	2
#define SAVE_ALL	3

static char *svr_nomsg = "-ERR no messages in mailbox\r\n";
static char *cli_mbox = NULL;		/* Filename of mailbox folder */

#define FNAME_SIZ 128
static char fld_fname[FNAME_SIZ];	/* Filename for working folder */
static FILE *fld_fp = NULL;		/* Stream pointer for mailbox */
static struct fld_item *fld_msg;	/* Struct for mailbox stats */
static int fld_max = -1;		/* Actual # msgs in mailbox */
static int fld_highest = -1;		/* Max msg accessed by client */
static long fld_orig_size;		/* [1.004] size of mbox when loaded */
static time_t fld_orig_mod_time;	/* [1.004] timestamp on mbox file */

#define isfromsp_start(buf)	(strncmp(buf,"From ",5) == 0)

static int fld_select();
static void retr_fromsp();
static int msg_fromsp();

/**************************************************************************/

static void
delete_folder()
{
	unlink(fld_fname);
}

/**************************************************************************/

/* Open a FromSpace delimited mailbox */
int
fld_fromsp(fname)
char *fname;
{
	int cnt;
	static char buffer[256];	/* DTS 14Sep99 - try to speed up */

	/* Release previously opened mailbox */
	if (fld_fp != NULL)
		fld_release();
	/* Construct filename for new mailbox */
	/* DTS 14Sep99 - added "if" to try to speed up (malloc slow?) */
	if ( strlen(fname) <= 255 ) {
		cli_mbox = buffer;
	} else {
		cli_mbox = malloc(strlen(fname)+1);
		if (cli_mbox == NULL)
			fail(FAIL_OUT_OF_MEMORY);
	}
/*	cli_mbox = malloc(strlen(fname)+1);
 *	if (cli_mbox == NULL)
 *		fail(FAIL_OUT_OF_MEMORY);
 */
	strcpy(cli_mbox,fname);
	/* Open mailbox */
	/* DTS 10Oct96 [ 1.005d ] added logic for "-2" return value */
	if ((cnt = fld_select(cli_mbox)) < 0) {
		if( cnt == -2 )
			sprintf(svr_buf,"-ERR being read already %s (stuck lock file in %s?)\r\n",
				cli_mbox,DEF_POP3_DIR);
		else
#ifdef QMAIL
			sprintf(svr_buf,
"-ERR cannot open mailbox %s or work file (disk space full?)\r\n",
				cli_mbox);
#else
			sprintf(svr_buf,
"-ERR cannot open mailbox %s or work file (disk space for %s?)\r\n",
				cli_mbox,DEF_POP3_DIR);
#endif
		free(cli_mbox);
		cli_mbox = NULL;
		return(SVR_FOLD_STATE);
	} else {
		sprintf(svr_buf,"+OK %d messages ready for %s in %s\r\n",
			cnt,cli_user,cli_mbox);
		return(SVR_TRANS_STATE);
	}
}

/**************************************************************************/

/* Mark a message for deletion */
void
fld_delete(msgnum)
int msgnum;
{
	if (fld_fp == NULL) {
		strcpy(svr_buf, svr_nomsg);
		return;
	}

	if ((msgnum < 1)||(msgnum > fld_max)) {
		sprintf(svr_buf,"-ERR invalid message; number out of range\r\n");
	} else {
		fld_msg[msgnum-1].status |= MSG_DELETED;
		sprintf(svr_buf,"+OK message %d marked for deletion\r\n",
			msgnum);
		if ((msgnum-1) > fld_highest)
			fld_highest =(msgnum-1);
	}
}

/* Report the highest access number for this mailbox */
void
fld_last()
{
	sprintf(svr_buf,"+OK %d\r\n",(fld_highest+1));
}

/* Give information about messages in mailbox folder */
void
fld_list(msgnum)
int msgnum;
{
	int i;

	if (fld_fp == NULL) {
		strcpy(svr_buf, svr_nomsg);
		return;
	}

	if (msgnum == -1) {
		sprintf(svr_buf,"+OK %d messages; msg# and size (in octets) for undeleted messages:\r\n",fld_max);
		svr_data_out(svr_buf);
		for (i=0; i<fld_max; ++i) {
			if ((fld_msg[i].status & MSG_DELETED) == 0) {
				sprintf(svr_buf,"%d %ld\r\n",
					(i+1),fld_msg[i].bcount);
				svr_data_out(svr_buf);
			}
		}
		sprintf(svr_buf,".\r\n");
	} else {
		if ((msgnum < 1)||(msgnum > fld_max))
			sprintf(svr_buf,"-ERR invalid message; number out of range\r\n");
		else if (fld_msg[msgnum-1].status & MSG_DELETED)
			sprintf(svr_buf,"-ERR message %d has been marked for deletion\r\n",
				msgnum);
		else
			sprintf(svr_buf,"+OK %d %ld\r\n",
				msgnum,fld_msg[msgnum-1].bcount);
	}
}

/* Give id listing of messages in mailbox folder */
void
fld_uidl(msgnum)
int msgnum;
{
	static int uidl_ready = 0;
	int i;

	if (fld_fp == NULL) {
		strcpy(svr_buf, svr_nomsg);
		return;
	}

	if (!uidl_ready) {
		for (i=0; i<fld_max; ++i) {
			do_md5_file(fld_fp, fld_msg[i].fmsg_entry, fld_msg[i].count, svr_buf);
			if( fld_msg[i].id ) free(fld_msg[i].id);
			fld_msg[i].id = strdup(svr_buf);
		}
		uidl_ready = 1;
	}

	if (msgnum == -1) {
		sprintf(svr_buf,"+OK %d messages; msg# and id for undeleted messages:\r\n",fld_max);
		svr_data_out(svr_buf);
		for (i=0; i<fld_max; ++i) {
			if ((fld_msg[i].status & MSG_DELETED) == 0) {
				sprintf(svr_buf,"%d %s\r\n",
					(i+1),fld_msg[i].id);
				svr_data_out(svr_buf);
			}
		}
		sprintf(svr_buf,".\r\n");
	} else {
		if ((msgnum < 1)||(msgnum > fld_max))
			sprintf(svr_buf,"-ERR invalid message; number out of range\r\n");
		else if (fld_msg[msgnum-1].status & MSG_DELETED)
			sprintf(svr_buf,"-ERR message %d has been marked for deletion\r\n",
				msgnum);
		else {
			sprintf(svr_buf,"+OK %d %s\r\n",
				msgnum,fld_msg[msgnum-1].id);
		}
	}
}

/* Reset deleted messages and highest access number */
void
fld_reset()
{
	int i;

	if (fld_fp == NULL) {
		strcpy(svr_buf, svr_nomsg);
		return;
	}
	/* Reset messages marked for deletion */
	for (i=0; i<fld_max; ++i) {
		fld_msg[i].status &= ~MSG_DELETED;
	}
	/* Reset highest access number for this mailbox */
	fld_highest = -1;
	sprintf(svr_buf,"+OK %d messages ready for %s in %s\r\n",
		fld_max,cli_user,cli_mbox);
}

/* Retrieve a message from mailbox */
void
fld_retr(msgnum,linecnt)
int msgnum;
int linecnt;
{
	if (fld_fp == NULL) {
		strcpy(svr_buf, svr_nomsg);
		return;
	}

	if ((msgnum < 1)||(msgnum > fld_max)) {
		sprintf(svr_buf,"-ERR invalid message; number out of range\r\n");
	} else if (fld_msg[msgnum-1].status & MSG_DELETED) {
		sprintf(svr_buf,"-ERR message %d has been marked for deletion\r\n",
			msgnum);
	} else {
		sprintf(svr_buf,"+OK message %d (%ld octets):\r\n",
			msgnum,fld_msg[msgnum-1].bcount);
		svr_data_out(svr_buf);
		retr_fromsp(--msgnum,linecnt);
		sprintf(svr_buf,".\r\n");
		if ((linecnt != -1)&&(msgnum > fld_highest))
			fld_highest = msgnum;
	}
}

/* Give message count and total size (in octets) of a mailbox folder */
void
fld_stat()
{
	int i;
	long total_cnt = 0L;

	if (fld_fp == NULL) {
		strcpy(svr_buf, "+OK 0 0\r\n");
		return;
	}
	for (i=0; i<fld_max; ++i) {
		total_cnt += fld_msg[i].bcount;
	}
	sprintf(svr_buf,"+OK %d %ld\r\n",fld_max,total_cnt);
}

/**************************************************************************/

/* Attempt to load a mailbox folder */
static int
fld_select(mbox)
char *mbox;
{
	int fd;			/* [1.005] DTS for mkstemp */
#ifdef QMAIL
	struct passwd *pwd;
#endif
	struct stat stat_buf;
	FILE *mboxfp;
	int lock;

	/* Reset folder variables */
	fld_fp = NULL;
	fld_highest = -1;

	/* Make sure mailbox is present and non-zero size */
	/* DTS 06Oct98 - added syslog below, rec'd by:  led@cyberdiner.com  */
	if (stat(mbox,&stat_buf) == -1) {
		if (errno == EACCES)
			syslog(SYSLOGPRI,
				"Permission denied on mailbox for %s",mbox);
		return 0;
	}

	if (stat_buf.st_size == 0L)
		return 0;

	/* Save current mailbox size and last-modified-timestamp */
	fld_orig_size = stat_buf.st_size;	/* [1.004] */
	fld_orig_mod_time = stat_buf.st_mtime;	/* [1.004] */

	/* [1.005d] DTS 20Oct96 re-wrote to use named temp file
	 *	(checking for prior existance for security reasons).
	 */
#ifdef VIRTUAL
	if(virtual_mode)
		snprintf(fld_fname,FNAME_SIZ,"%s",virt_workdir);
	else {
#  ifdef QMAIL
		pwd=getpwnam(cli_user);
		snprintf(fld_fname,FNAME_SIZ,"%s/.pop-",pwd->pw_dir);
#  else
		strncpy(fld_fname, DEF_POP3_DIR, FNAME_SIZ-1);
#  endif
	}

#else
#  ifdef QMAIL
	pwd=getpwnam(cli_user);
	snprintf(fld_fname,FNAME_SIZ,"%s/.pop-",pwd->pw_dir);
#  else
	strncpy(fld_fname, DEF_POP3_DIR, FNAME_SIZ-1);
#  endif
#endif
	strncat(fld_fname, (const char *) basename(mbox),
			FNAME_SIZ-strlen(fld_fname)-1);
	if ((fd=open(fld_fname, O_CREAT|O_EXCL|O_RDWR, 0600)) < 0)
		return -2;

	atexit(delete_folder);

	/* [1.005] DTS Convert from fd to fp to be compat. with existing code */
	if ((fld_fp = fdopen(fd,"w")) == NULL) {
		close(fd);
		unlink(fld_fname);
		return -1;
	}
	
	/* Secure mailbox for POP3 session; copy to temporary file */
	if ((mboxfp = fopen(mbox, "r")) == NULL) {
		fclose(fld_fp);
		unlink(fld_fname);
		return -1;
	}
	if ((lock = dup(fileno(mboxfp))) == -1) {
		fclose(fld_fp);
		fclose(mboxfp);
		unlink(fld_fname);
		return -1;
	}
	if (flock(lock, LOCK_EX) == -1) {
		fclose(fld_fp);
		fclose(mboxfp);
		close(lock);
		unlink(fld_fname);
		return -1;
	}

	/* Load messages from folder */
	fld_max = msg_fromsp(mboxfp, fld_fp);
	if (fclose(mboxfp) == EOF)
		fld_max = -1;
	if (fclose(fld_fp) == EOF)
		fld_max = -1;

	/* Unlock mailbox */
	flock(lock, LOCK_UN);
	close(lock);

	/* Prepare to use temporary file for POP3 session */
	if (fld_max > 0) {
		if ((fld_fp = fopen(fld_fname,"r")) == NULL) {
			unlink(fld_fname);
			fld_max = -1;
		}
	} else {
		/* Either zero messages or error */
		unlink(fld_fname);
		fld_fp = NULL;
	}
	return(fld_max);
}

/* Close a mailbox folder; remove messages marked for deletion */
void
fld_release()
{
	char temp_fname[FNAME_SIZ];
	int fd;			/* [1.005] DTS for mkstemp */
	FILE *mboxfp;
	FILE *tempfp;
	int lock;
	int i = 0;
	int savemsg = 1;
	int zap_orig_mbox;
	struct stat stat_buf;

	/* If no messages in folder, just free memory for filename */
	if (fld_fp == NULL) {
		if (cli_mbox != NULL) {
			free(cli_mbox);
			cli_mbox = NULL;
		}
		return;
	}

	/* [1.004] Check size and timestamp on the original mailbox file */
	if (stat(cli_mbox, &stat_buf) == -1) {
		/* Another user agent removed it while we were working */
		zap_orig_mbox = REMOVE_MBOX;
	} else {
		if ((stat_buf.st_mtime == fld_orig_mod_time) &&
		    (stat_buf.st_size  == fld_orig_size)) {
			/* Nothing added to mailbox while we were working */
			zap_orig_mbox = REMOVE_MBOX;
		} else {
			if (stat_buf.st_size > fld_orig_size) {
				/* More messages were added to end of mbox */
				zap_orig_mbox = SAVE_NEW;
	
				/* If no messages were deleted, just remove */
				/* the working mailbox file.                */
				for (i=0; i<fld_max; ++i) {
					if ((fld_msg[i].status & MSG_DELETED) != 0)
						break;
				}
				if (i == fld_max)
					goto cleanup;
			} else {
				/* Another user agent made changes while
				 * we were working; save it all to be safe
				 */
				zap_orig_mbox = SAVE_ALL;
			}
		}
	}

	/* Save changes made to original mailbox folder during
	 * this POP3 session
	 */
	if (zap_orig_mbox == REMOVE_MBOX) {
		/* No changes to save */
		if ((mboxfp = fopen(cli_mbox, "w")) == NULL)
			fail(FAIL_FILE_ERROR);
	} else { /* SAVE_NEW or SAVE_ALL */
		/* Save parts of this mailbox */
		if ((mboxfp = fopen(cli_mbox, "r")) == NULL)
			fail(FAIL_FILE_ERROR);
	}
	/* Lock original mailbox folder */
	if ((lock = dup(fileno(mboxfp))) == -1)
		fail(FAIL_FILE_ERROR);
	if (flock(lock, LOCK_EX) == -1)
		fail(FAIL_FILE_ERROR);

	/* Adjust position in original mailbox file */
	if (zap_orig_mbox == SAVE_NEW) {
		/* Save only the messages added while we were working */
		if (fseek(mboxfp, fld_orig_size, 0) == -1)
			fail(FAIL_FILE_ERROR);
	}

	/* Transfer messages we want to save */
	if (zap_orig_mbox == REMOVE_MBOX) {
		/* Nothing to save, close file we just openned for write */
		if (fclose(mboxfp) == EOF)
			fail(FAIL_FILE_ERROR);
		temp_fname[0] = '\0';
	} else {		 /* SAVE_NEW or SAVE_ALL */
		/* Copy from the original mailbox to a temp file */
		/* [1.005d] DTS 20Oct96 re-wrote to use named temp file
		 *	(checking for prior existance for security reasons).
		 */
		strncpy(temp_fname, fld_fname, FNAME_SIZ-1);
		strncat(temp_fname, ".tmp", FNAME_SIZ-strlen(temp_fname)-1);
		if ((fd=open(temp_fname, O_CREAT|O_EXCL|O_RDWR, 0600)) < 0)
			fail(FAIL_DUP_READ);

		if ((tempfp = fdopen(fd,"w")) == NULL)
			fail(FAIL_FILE_ERROR);

		while (fgetl(svr_buf,SVR_BUFSIZ,mboxfp) != NULL) {
			fputs(svr_buf,tempfp);
			if (ferror(tempfp))
				fail(FAIL_FILE_ERROR);
		}
		if (ferror(mboxfp))
			fail(FAIL_FILE_ERROR);
		if (fclose(mboxfp) == EOF)
			fail(FAIL_FILE_ERROR);
		if (fclose(tempfp) == EOF)
			fail(FAIL_FILE_ERROR);
	}
	
	/* Transfer contents of working folder to original */
	/* mailbox folder; dont copy deleted messages.     */
	if ((mboxfp = fopen(cli_mbox,"w")) == NULL)
		fail(FAIL_FILE_ERROR);

	/* If all messages were deleted, we don't need to look */
	/* through the working mailbox file.                   */
	for (i=0; i<fld_max; ++i) {
		if ((fld_msg[i].status & MSG_DELETED) == 0)
			break;
	}
	if (i == fld_max)
		goto addnew;

	/* Transfer undeleted messages from the working mailbox */
	rewind(fld_fp);
	i = 0;				/* [1.002] reset index counter */
	while (fgetl(svr_buf,SVR_BUFSIZ,fld_fp) != NULL) {
		if (isfromsp_start(svr_buf)) {
			/* FromSPACE delimited mailbox */
			/* Transfer next msg, unless deleted */
			savemsg = !(fld_msg[i++].status & MSG_DELETED);
		}
		if (savemsg) {
			fputs(svr_buf,mboxfp);
			if (ferror(mboxfp))
				fail(FAIL_FILE_ERROR);
		}
	}
	if (ferror(fld_fp))
		fail(FAIL_FILE_ERROR);

	if (temp_fname[0] == '\0') {
		/* Nothing more to add, close the original mailbox file */
		if (fclose(mboxfp) == EOF)
			fail(FAIL_FILE_ERROR);
	}

addnew:
	if (temp_fname[0] != '\0') {
		/* There were changes to the original mailbox file
		 * while we were working. Save the messages that
		 * changed in the original mailbox file.
		 */
		/* Transfer contents of temp file (messages added */
		/* to original mailbox during this POP3 session)  */
		/* back to mailbox folder                         */
		if ((tempfp = fopen(temp_fname,"r")) == NULL)
			fail(FAIL_FILE_ERROR);
		while (fgets(svr_buf,SVR_BUFSIZ,tempfp) != NULL) {
			fputs(svr_buf,mboxfp);
			if (ferror(mboxfp))
				fail(FAIL_FILE_ERROR);
		}
		if (ferror(tempfp))
			fail(FAIL_FILE_ERROR);
		if (fclose(tempfp) == EOF)
			fail(FAIL_FILE_ERROR);
		unlink(temp_fname);
		if (fclose(mboxfp) == EOF)
			fail(FAIL_FILE_ERROR);
	}

	/* Unlock original mailbox folder */
	flock(lock, LOCK_UN);
	close(lock);


cleanup:
	/* Close and remove working copy of mailbox folder */
	fclose(fld_fp);
	fld_fp = NULL;
	unlink(fld_fname);
	for (i=0; i<fld_max; ++i) {
		if (fld_msg[i].pop_hdr != NULL)
			free(fld_msg[i].pop_hdr);
	}
	free( (char *)fld_msg );
	free(cli_mbox);
	cli_mbox = NULL;
}

/********************************************/

/* Send a FromSP delimited message to the POP3 client */
static void
retr_fromsp(msgnum,linecnt)
int msgnum;
int linecnt;
{
	char *cp, *tp;
	int msgbody = 0;

	/* Locate start of message in mailbox file */
	if (fseek(fld_fp, fld_msg[msgnum].fmsg_entry, 0) == -1)
		return;

	/* Setup for byte-stuff on lines that start with '.' */
	cp = svr_buf;
	*cp = DOT_CHAR;
	++cp;
	/* Display message for the client */
	if (fld_msg[msgnum].pop_hdr != NULL)
		svr_data_out(fld_msg[msgnum].pop_hdr);
	while (fgetl(cp,SVR_BUFSIZ,fld_fp) != NULL) {
		if (isfromsp_start(cp))
			break;
		/* Use CR-LF line terminator */
		tp = strchr(cp,LF_CHAR);
		if (tp != NULL)
			strcpy(tp,"\r\n");
		/* Byte-stuff lines that start with '.' */
		if (*cp == DOT_CHAR)
			svr_data_out(svr_buf);
		else
			svr_data_out(cp);
		if ((msgbody)&&(--linecnt == 0)) {
			break;
		} else {
			if (*cp == CR_CHAR) {
				msgbody = 1;
				if (linecnt == 0)
					break;
			}
		}
	}
}

/**************************************************************************/

/* Load messages from a mailbox delimited by FromSPACE */
static int
msg_fromsp(infp, outfp)
FILE *infp;
FILE *outfp;
{
	int i = 0;
	register struct fld_item *mp;

	/* Get an array for storing info about messages in folder */
	get_e_array(fld_msg, FLD_ENTRY_BLOCK);
	if (fld_msg == NULL)
		fail(FAIL_OUT_OF_MEMORY);
	mp = &fld_msg[0];
	/* Load messages from mailbox folder to temporary folder */
	while (fgetl(svr_buf,SVR_BUFSIZ,infp) != NULL) {
		fputs(svr_buf, outfp);
		if (ferror(outfp))
			return -1;
		if (isfromsp_start(svr_buf)) {
			/* Make sure there is room in array for this entry */
			chk_e_size(fld_msg, FLD_ENTRY_BLOCK, i);
			if (fld_msg == NULL)
				fail(FAIL_OUT_OF_MEMORY);
			/* Reset stats for this message */
			mp = &fld_msg[i];
			mp->fmsg_entry = ftell(outfp);
			mp->status = 0;
			sprintf(flash_buf,"%s %s@%s\r\n",POP3_RCPT_HDR,
					cli_user,svr_hostname);
			mp->pop_hdr = malloc(strlen(flash_buf)+1);
			if (mp->pop_hdr == NULL)
				fail(FAIL_OUT_OF_MEMORY);
			strcpy(mp->pop_hdr,flash_buf);
			mp->bcount = strlen(mp->pop_hdr);
			mp->count = 0;
                        /* patch: wlad, 06/14/98,  UIDL crash on line 224, free(id) */
			mp->id = (char *)NULL;
			/* patch: end */

			++i;
		} else {
			int len = strlen(svr_buf);
			mp->bcount += len + 1L;
			mp->count += len;
		}
	}
	if (ferror(infp))
		return -1;
	if (i == 0)
		free((char *)fld_msg);
	return(i);
}

/************************************************/

