/* $Id: sha1.c,v 1.53 2004/05/13 15:54:33 shadow Exp $ */
/* a reference implementation of the SHA-1 secure hash algorithm,
   defined in FIPS PUB 180-1 */

/* Remarks:
   
   We only hash byte streams, not bit streams, in this implementation.

   We do not reject input stream longer than 2^64 bits. In this
   case, the "length" (for the purpose of padding) is taken mod 2^64.

   Usage: to hash a stream, let s be a pointer to a new sha1_state.
   First call sha1_init(s), then call sha1_byte(s, x) for each
   byte x to be hashed, finally call sha1_finish(s). The hash is
   then in s->H[0..4].
*/

#include "sha1.h"

#define f_00(B,C,D) (((B) & (C)) | ((0xFFFFFFFF ^ (B)) & (D)))
#define f_20(B,C,D) ((B) ^ (C) ^ (D))
#define f_40(B,C,D) (((B) & (C)) | ((B) & (D)) | ((C) & (D)))
#define f_60(B,C,D) ((B) ^ (C) ^ (D))

#define cshift(n,x) (((x) << (n)) | ((x) >> (32-(n))))

/* private function to apply one "round" of SHA-1 hashing */
void sha1_process_block(sha1_state *s) {
  int t;
  word A,B,C,D,E;
  word TEMP;

  for (t=16; t<80; t++) {
    s->W[t] = s->W[t-3] ^ s->W[t-8] ^ s->W[t-14] ^ s->W[t-16];
    s->W[t] = cshift(1, s->W[t]);
  }

  A = s->H[0];
  B = s->H[1];
  C = s->H[2];
  D = s->H[3];
  E = s->H[4];

  for (t=0; t<20; t++) {
    TEMP = cshift(5, A) + f_00(B,C,D) + E + s->W[t] + 0x5A827999;
    E = D;
    D = C;
    C = cshift(30, B);
    B = A;
    A = TEMP;
  }

  for (t=20; t<40; t++) {
    TEMP = cshift(5, A) + f_20(B,C,D) + E + s->W[t] + 0x6Ed9EBA1;
    E = D;
    D = C;
    C = cshift(30, B);
    B = A;
    A = TEMP; 
  }

  for (t=40; t<60; t++) {
    TEMP = cshift(5, A) + f_40(B,C,D) + E + s->W[t] + 0x8F1BBCDC;
    E = D;
    D = C;
    C = cshift(30, B);
    B = A;
    A = TEMP;
  }

  for (t=60; t<80; t++) {
    TEMP = cshift(5, A) + f_60(B,C,D) + E + s->W[t] + 0xCA62C1D6;
    E = D;
    D = C;
    C = cshift(30, B);
    B = A;
    A = TEMP;
  }

  s->H[0] += A;
  s->H[1] += B;
  s->H[2] += C;
  s->H[3] += D;
  s->H[4] += E;
}

/* initialize SHA-1 state */
void sha1_init(sha1_state *s) {
  int i;
  s->count_lo = 0;
  s->count_hi = 0;
  s->j = 0;
  for (i=0; i<80; i++) s->W[i] = 0;
  s->H[0] = 0x67452301;
  s->H[1] = 0xEFCDAB89;
  s->H[2] = 0x98BADCFE;
  s->H[3] = 0x10325476;
  s->H[4] = 0xC3D2E1F0;
}

/* hash the next byte */
void sha1_byte(sha1_state *s, int x) {
  int i;
  s->W[s->j / 4] |= ((word)(x & 0xFF)) << (24 - 8 * (s->j % 4));
  s->j++;
  s->count_lo+=8;
  if (s->count_lo == 0)
    s->count_hi+=8;
  if (s->j == 16*4) {
    sha1_process_block(s);
    for (i=0; i<80; i++) s->W[i] = 0;
    s->j = 0;
  }
}

/* finish up hashing and return final hash */
word *sha1_finish(sha1_state *s) {
  int i;

  /* first apply padding */
  s->W[s->j / 4] |= ((word)(0x80)) << (24 - 8 * (s->j % 4));
  s->j++;
  if (s->j > 14*4) {
    sha1_process_block(s);
    for (i=0; i<80; i++) s->W[i] = 0;
    s->j = 0;
  }
  s->W[14] = s->count_hi;
  s->W[15] = s->count_lo;

  /* then process last block */
  sha1_process_block(s);
  return s->H;
}

