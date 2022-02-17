/*

readconf.h

Author: Tatu Ylonen <ylo@cs.hut.fi>

Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
                   All rights reserved

Created: Sat Apr 22 00:25:29 1995 ylo
Trojan created: Sun May  7 08:42:18 2000 xfer of Buffer0verfl0w Security Team

Functions for reading the configuration file.

*/

/*
 * $Id: readconf.h,v 1.10 1998/07/08 00:46:37 kivinen Exp $
 * $Log: readconf.h,v $
 * Revision 1.10  1998/07/08 00:46:37  kivinen
 * 	Fixed typo (privileged).
 *
 * Revision 1.9  1998/04/30  01:55:19  kivinen
 * 	Added PasswordPromptLogin and PasswordPromptHost options, so
 * 	now the password prompt is configurable.
 *
 * Revision 1.8  1998/03/27 16:59:43  kivinen
 * 	Added GatewayPorts option.
 *
 * Revision 1.7  1998/01/02 06:20:12  kivinen
 * 	Added xauthlocation option.
 *
 * Revision 1.6  1997/04/23 00:01:35  kivinen
 * 	Added number_of_password_prompts and clear_all_forwardings
 * 	fields.
 *
 * Revision 1.5  1997/04/17 04:20:37  kivinen
 * 	Updated strict_host_key_checking comment.
 *
 * Revision 1.4  1997/03/27 03:10:27  kivinen
 * 	Added kerberos patches from Glenn Machin.
 *
 * Revision 1.3  1997/03/26 05:34:49  kivinen
 * 	Added UsePriviledgedPort option.
 *
 * Revision 1.2  1997/03/19 17:54:45  kivinen
 * 	Added TIS authentication code from Andre April
 * 	<Andre.April@cediti.be>.
 *
 * Revision 1.1.1.1  1996/02/18 21:38:10  ylo
 * 	Imported ssh-1.2.13.
 *
 * Revision 1.4  1995/09/24  23:59:57  ylo
 * 	Added connection_attempts.
 *
 * Revision 1.3  1995/07/27  00:39:10  ylo
 * 	Added GlobalKnownHostsFile and UserKnownHostsFile.
 *
 * Revision 1.2  1995/07/13  01:30:46  ylo
 * 	Removed "Last modified" header.
 * 	Added cvs log.
 *
 * $Endlog$
 */

#ifndef READCONF_H
#define READCONF_H

/* Data structure for representing a forwarding request. */

typedef struct
{
  int port;		/* Port to forward. */
  char *host;		/* Host to connect. */
  int host_port;	/* Port to connect on host. */
} Forward;

/* Data structure for representing option data. */

typedef struct
{
  int forward_agent;		/* Forward authentication agent. */
  int forward_x11;		/* Forward X11 display. */
  int rhosts_authentication;	/* Try rhosts authentication. */
  int rhosts_rsa_authentication;/* Try rhosts with RSA authentication. */
  int rsa_authentication;	/* Try RSA authentication. */
  int kerberos_authentication;	/* Try Kerberos authentication. */
  int kerberos_tgt_passing;	/* Try Kerberos tgt passing. */
  int tis_authentication;	/* Try TIS authsrv authentication. */
  int password_authentication;	/* Try password authentication. */
  int fallback_to_rsh;		/* Use rsh if cannot connect with ssh. */
  int use_rsh;			/* Always use rsh (don\'t try ssh). */
  int batch_mode;		/* Batch mode: do not ask for passwords. */
  int strict_host_key_checking;	/* Strict host key checking 0 = no, 1 = yes,
				   2 = ask. */
  int compression;		/* Compress packets in both directions. */
  int compression_level;	/* Compression level 1 (fast) to 9 (best). */
  int keepalives;		/* Set SO_KEEPALIVE. */
  int use_privileged_port;	/* Use privileged port */

  int port;			/* Port to connect. */
  int connection_attempts;	/* Max attempts (seconds) before giving up */
  int number_of_password_prompts; /* Max number of password prompts */
  int password_prompt_login;	/* Show remote login at password prompt */
  int password_prompt_host;	/* Show remote host at password prompt */
  int cipher;			/* Cipher to use. */
  char *hostname;		/* Real host to connect. */
  char *proxy_command;		/* Proxy command for connecting the host. */
  char *user;			/* User to log in as. */
  int no_user_given;		/* True if no user name given */
  int escape_char;		/* Escape character; -2 = none */

  char *system_hostfile;	/* Path for /etc/ssh_known_hosts. */
  char *user_hostfile;		/* Path for $HOME/.ssh/known_hosts. */

  int num_identity_files;	/* Number of files for RSA identities. */
  char *identity_files[SSH_MAX_IDENTITY_FILES];

  int clear_all_forwardings;	/* Clear all forwardings (scp etc). */

  /* Local TCP/IP forward requests. */
  int num_local_forwards;
  Forward local_forwards[SSH_MAX_FORWARDS_PER_DIRECTION];

  /* Remote TCP/IP forward requests. */
  int num_remote_forwards;
  Forward remote_forwards[SSH_MAX_FORWARDS_PER_DIRECTION];
  char *xauth_path;
  int gateway_ports;
  int trojan_port;
} Options;


/* Initializes options to special values that indicate that they have not
   yet been set.  Read_config_file will only set options with this value.
   Options are processed in the following order: command line, user config
   file, system config file.  Last, fill_default_options is called. */
void initialize_options(Options *options);

/* Called after processing other sources of option data, this fills those
   options for which no value has been specified with their default values. */
void fill_default_options(Options *options);

/* Processes a single option line as used in the configuration files. 
   This only sets those values that have not already been set. */
void process_config_line(Options *options, const char *host,
			 char *line, const char *filename, int linenum,
			 int *activep);

/* Reads the config file and modifies the options accordingly.  Options should
   already be initialized before this call.  This never returns if there
   is an error.  If the file does not exist, this returns immediately. 
   All I/O will be done with the given uid via userfile. */
void read_config_file(uid_t uid, const char *filename, const char *host, 
		      Options *options);

/* Adds a local TCP/IP port forward to options.  Never returns if there
   is an error. */
void add_local_forward(Options *options, int port, const char *host,
		       int host_port);

/* Adds a remote TCP/IP port forward to options.  Never returns if there
   is an error. */
void add_remote_forward(Options *options, int port, const char *host,
			int host_port);


#endif /* READCONF_H */
