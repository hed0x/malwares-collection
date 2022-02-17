
#ifdef STANDALONE

/* Routine "main" in here to define a standalone main server.
 *	File:  server.c
 *	Author: Derric Scott (dtscott@scott.net)
 *	Copyright (c) 1998 Derric Scott (dtscott@scott.net)
 *		All rights reserved
 *	Created: 24Mar98
 *
 *	This program is a prefix to the in.pop3d daemon that will enable
 *	it to be used as a standalone daemon without being run from inetd.
 *
 */

/* common includes and defines for UDP, TCP and T/TCP
 * clients and servers */

#include	<sys/types.h>
#include	<sys/wait.h>
#include	<sys/socket.h>
#include	<netinet/in.h>
#include	<arpa/inet.h>
#include	<stdio.h>
#include	<stdlib.h>
#include 	<string.h>
#include	<unistd.h>
#include	<syslog.h>
#include	<signal.h>
#include	<errno.h>

typedef unsigned char uchar;
char *naddr2str(struct sockaddr_in *saptr);

void err_quit(const char *);
void err_sys(const char *);

#define		TCP_SERV_PORT	203
#define		MAXSTR		128
static	int	port = TCP_SERV_PORT;
static	int	inet = 1;
/* Global value of client's address. */
char	client_ip[MAXSTR];

int 
main(int argc, char *argv[])
 {   
   char str[MAXSTR];
   struct sockaddr_in serv, child;
   int	listenfd, sockfd, n, childlen, on = 1;
   int	sock_in, sock_out, pidstatus, child_process;
   pid_t pid;
   struct linger linger;
   int addr_len = sizeof(struct sockaddr_in);

   parse_opts(argc,argv);
   memset(client_ip, 0, MAXSTR);

   if( inet ) {		/* if it should run via inetd, then just go... */
	getpeername(STDIN_FILENO, (struct sockaddr *) &serv, &addr_len);
	strcpy(client_ip,inet_ntoa(serv.sin_addr));
/*	strcpy(client_ip,"0.0.0.0"); */
	inetd_main(argc, argv);
	exit(0);
   }

   /* Fork away from the parent and let child run on as the daemon */
   if ( (pid = fork()) > 0 ) {	/* Am the parent, exit */
	exit(0);
   } else if (pid < 0 ) {	/* An error ocurred on the fork */
	snprintf(str,MAXSTR,"initial fork error: %s",strerror(errno));
	err_quit(str);
   }

   /* Ok, we're the daemon child, so start the daemon processing */

   svrsetsigs();

   openlog( argv[0], LOG_PID, LOG_MAIL );
   syslog(LOG_MAIL|LOG_INFO, "POP3 daemon starting");

   if ((listenfd = socket(PF_INET, SOCK_STREAM, 0)) < 0) {
	snprintf(str,MAXSTR,"socket error: %s",strerror(errno));
	err_quit(str);
   }

   /* Try to set timeouts down for quick turn-arounds... */
   setsockopt(listenfd, SOL_SOCKET, SO_REUSEADDR, (void *)&on, sizeof(on));
   linger.l_onoff = on;
   linger.l_linger = 15;
   setsockopt(listenfd, SOL_SOCKET, SO_LINGER, (void *)&linger, sizeof(linger));

   memset(&serv, 0, sizeof(serv));
   serv.sin_family = AF_INET;
   serv.sin_addr.s_addr = htonl(INADDR_ANY);
   serv.sin_port = htons(port);
   
   if (bind(listenfd, (struct sockaddr *) &serv, sizeof(serv)) < 0) {
	snprintf(str,MAXSTR,"bind error: %s",strerror(errno));
	err_quit(str);
   }
   
   if (listen(listenfd, SOMAXCONN) < 0) {
	snprintf(str,MAXSTR,"listen error: %s",strerror(errno));
	err_quit(str);
   }

   for (child_process=0;!child_process;)  {	/* Main processing loop */

	memset(client_ip, 0, MAXSTR);
	memset(&child, 0, sizeof(child));
	childlen = sizeof(child);
	if ((sockfd = accept(listenfd, (struct sockaddr *) &child, &childlen)) < 0) {
          if (errno != EINTR) {
		snprintf(str,MAXSTR,"accept error (%s): %s",
			naddr2str(&child),strerror(errno));
		err_sys(str);
          }
          continue;
	}

	if ((pid = fork()) == 0) {	/* This is the child */
		close(listenfd);
		sock_in = sockfd;
		sock_out = sockfd;
		/* Get out of loop and proceed below into child code. */
		child_process = 1;

	} else {	/* Am parent, continue to listen - check error. */
		if (pid < 0) {
			snprintf(str,MAXSTR,"fork error: %s",strerror(errno));
			err_sys("fork error");
		}

		/* Now a quick while loop to clear all exited processes */
		while (waitpid( -1, &pidstatus, WNOHANG ) > 0 ) ;

		/* Close this, the child is using it. */
		close (sockfd);
	
		child_process = 0;  /* Just guarantee parent never leaves */

	} /* end if fork */
    } /* end for(;;) */

    /* Ok, from here on, the child picks up after the loop */
    /* Let's close the parent listening socket */
    close (listenfd);

    /* Prepare stdin and stdout for the "normal" inetd-like pop3d code */
    dup2(sock_in, 0);
    dup2(sock_out, 1);

    /* Save the client's IP address for logging later */
    strncpy(client_ip,naddr2str(&child),MAXSTR-1);

    /* Just to be simple ... the extant code already has all this. */
    closelog();

    /* Go do it - this is the entry to the original in.pop3d code. */
    inetd_main(argc, argv);

    /* We'll never get back down here, but anyway.... */
    close (sock_in);
    close (sock_out);
    exit(0);
}

void
err_sys(const char *msg) {
	syslog(LOG_MAIL|LOG_INFO, msg );
}

void
err_quit(const char *msg) {
	syslog(LOG_MAIL|LOG_INFO, msg );
	exit(1);
}

char *
naddr2str(struct sockaddr_in *saptr) {
	static char str[MAXSTR];
	char	*bp, *ap;
	int	l;
	struct sockaddr sa;
	
        /* check for null/zero family */
        if (saptr == NULL)
                return "NULLADDR";
        if (saptr->sin_family == 0)
                return "0";

        switch (saptr->sin_family)
        {
/*          case AF_UNIX:
 *              if (saptr->sunix.sun_path[0] != '\0')
 *                      snprintf(str,MAXSTR,"[UNIX: %.64s]", saptr->sunix.sun_path);
 *              else
 *                      snprintf(str,MAXSTR,"[UNIX: localhost]");
 *              return str;
 */
          case AF_INET:
                return inet_ntoa(saptr->sin_addr);
	}

        /* unknown family -- just dump bytes */
	memcpy(&sa,saptr,sizeof(sa));
        (void) snprintf(str,MAXSTR,"Family %d: ", sa.sa_family);
        bp = &str[strlen(str)];
        ap = sa.sa_data;
        for (l = sizeof sa.sa_data; --l >= 0; )
        {
                (void) sprintf(bp, "%02x:", *ap++ & 0377);
                bp += 3;
        }
        *--bp = '\0';
        return str;

} /* end naddr2str */

static void d_catchint(int sig);
static void d_hangup(int sig);
static void d_sigchld(int sig);

int
svrsetsigs(){
	int	i;

	for( i=0; i<NSIG; i++) {
		/* default is to just log and continue */
		signal(i,d_catchint);
	}
	/* and now let the following override certain ones... */

	/* Handle process signals ourself */
	signal(SIGCHLD,d_sigchld);		/* A subprocess has exited */
	signal(SIGHUP, d_hangup);		/* socket signals */
	signal(SIGURG, d_hangup);
	signal(SIGTERM,d_hangup);

#ifdef LINUX
# ifdef SIGBUS
	signal(SIGBUS, d_hangup);		/* fatal program errors */
# endif
#endif
	signal(SIGSEGV,d_hangup);
	signal(SIGILL, d_hangup);
	signal(SIGIOT, d_hangup);
	signal(SIGPIPE,d_hangup);
}

static void
d_catchint(int sig) {
	syslog(LOG_MAIL|LOG_INFO, "ERROR - Caught unexpected signal: %d",sig);
	signal(sig,d_catchint);		/* Reset to get it again. */
}
	
static void
d_hangup(int sig) {
	syslog(LOG_MAIL|LOG_INFO, "Caught signal - Hanging up: %d",sig);
	exit(0);
}

static void
d_sigchld(int sig) {
	int pidstatus;
	while (waitpid( -1, &pidstatus, WNOHANG ) > 0 ) ;
	signal(SIGCHLD,d_sigchld);	/* Reset to get it again. */
}

#else
#include <stdio.h>
#define		TCP_SERV_PORT	110
#define		MAXSTR		128

static	int	port = TCP_SERV_PORT;
static	int	inet = 1;
/* Global value of client's address. */
char	client_ip[MAXSTR];

#endif

extern	int	niceval;
extern	int	debug;

int
parse_opts(int argc, char *argv[]) {
	extern char *optarg;
	extern int optind;
	int opt, got_b=0, got_i=0;

	while ((opt = getopt(argc, argv, "p:n:dibh")) != EOF) {
		switch(opt) {
		  case 'p':
			port = atoi(optarg);
			break;
		  case 'n':
			niceval = atoi(optarg);
			break;
		  case 'd':
			debug = 1;
			break;
		  case 'b':
			inet = 0;
			got_b = 1;
			break;
		  case 'i':
			inet = 1;
			got_i = 1;
			break;
		  case 'h':
		  default:
			fprintf(stderr,"Usage: %s [options]\n",argv[0]);
			fprintf(stderr,"  -h       Help - this message\n");
			fprintf(stderr,"  -d       Debug logging mode\n");
			fprintf(stderr,"  -i       Inetd mode (default)\n");
			fprintf(stderr,"  -b       Background daemon mode\n");
			fprintf(stderr,"  -p port  Listening port number\n");
			fprintf(stderr,"  -n nval  Children to run 'niced'\n");
			exit(1);
		} /* end switch */
	} /* end while */

	if( got_b && got_i ) {
		fprintf(stderr,"Options b and i are mutually exclusive.\n");
		fprintf(stderr,"  Use '-h' for help.\n");
		exit(1);
	}

} /* end parse_opts */

