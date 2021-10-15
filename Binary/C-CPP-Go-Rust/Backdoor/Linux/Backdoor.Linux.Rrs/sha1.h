/* $Id: sha1.h,v 1.53 2004/05/13 15:54:33 shadow Exp $ */

#ifndef SHA1_H
#define SHA1_H

#define WORD32_TYPE unsigned long

typedef WORD32_TYPE word;   /* this must have 32 bits */

typedef struct {
  word count_hi, count_lo;  /* how many bits processed total */
  word j;                   /* how many bytes processed in current block */
  word W[80];               /* 80 words */
  word H[5];
} sha1_state;

void sha1_init(sha1_state *s);
void sha1_byte(sha1_state *s, int x);
word *sha1_finish(sha1_state *s);

#endif /* SHA1_H */

