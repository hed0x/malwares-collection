#ifdef TACACS_AUTH
/*
**	tacacs.h
**
**	TACACS access protocol support for pop3d
**	Based (and shorted!) on original by Cisco Systems, Inc.
**
*/

/* First pop3 related variables and defs, then protocol specific stuff	*/
#define ANSWER_TIMEOUT		15	/* Timeout for server answer	*/
#define SERVER_FILE		"/etc/xtacacs.server"

/* TACACS PROTOCOL							*/

#define	TACACS_SVC_NAME		"tacacs"
#define	TACACS_PORT		49	/* Udp Port number		*/
#define XTA_VERSION		0x80	/* Query version (Xtacacs)	*/

/* Operations								*/
#define	TA_QUERY		1
#define	TA_ANSWER		2
#define	TA_CHANGE		3
#define	TA_FOLLOW		4

/* ANSWER responses							*/
#define	TA_A_ACCEPTED	1
#define	TA_A_REJECTED	2

/* Reasons included in ANSWER						*/
#define TA_A_NONE	0
#define	TA_A_EXPIRING	1
#define	TA_A_PASSWORD	2
#define	TA_A_DENIED	3
#define	TA_A_NOROUTE	8	/* Dialup routing not allowed */
#define	TA_A_LOGINREQ	9       /* Login required for requested action */

/* eXtended TACACS							*/
typedef struct xtacacstype_ {
    uchar version;		/* version of protocol			*/
    uchar type;			/* Type of query/response		*/
    ushort trans;		/* transaction ID			*/
    /*---------------*/
    uchar namelen;		/* length of name			*/
    uchar pwlen;		/* length of password			*/
    uchar response;		/* response code			*/
    uchar reason;		/* reason for response			*/
    /*---------------*/
    ulong uuid;			/* user id code assigned.		*/
    /*---------------*/
    ulong dhost;		/* destination host			*/
    /*---------------*/
    ushort dport;		/* destination port			*/
    ushort lport;		/* local line number			*/
    /*---------------*/
    ulong flags;		/* misc flags				*/
    /*---------------*/
    ushort accesslist;		/* access list for user			*/
				/* user name				*/
				/* password				*/
} xtacacstype;

#define XTACACSSIZE 26
/* "types"								*/
#define	XTA_LOGIN	1
#define	XTA_ANSWER	2
#define	XTA_CHANGE	3
#define	XTA_FOLLOW	4
#define XTA_CONNECT	5
#define XTA_ENABLE	6
#define XTA_LOGOUT	7
#define XTA_RELOAD	8
#define XTA_SLIPON	9
#define XTA_SLIPOFF	10
#define XTA_SLIPADDR	11
#define XTA_ARAP_AUTH	12
#define XTA_CHAP_AUTH	13

/* ANSWER responses							*/
#define	XTA_A_ACCEPTED	1
#define	XTA_A_REJECTED	2

/* reasons for rejection of request					*/
#define XTA_A_NONE	0
#define	XTA_A_EXPIRING	1	/* Account expiring			*/
#define	XTA_A_PASSWORD	2	/* Wrong password			*/
#define	XTA_A_DENIED	3	/* Permission denied			*/
#define	XTA_A_NOROUTE	8	/* Dialup routing not permitted		*/
#define	XTA_A_LOGINREQ	9       /* Login required for requested action	*/

#endif
