#ifndef AES_H
#define AES_H

#define LIBMIX_MD5_HASH
#include <mix/lmconfig.h>

#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif
#include <stdio.h>
#include <string.h>
#ifdef HAVE_UNISTD_H
#include <unistd.h>
#endif

#ifndef u1byte
typedef unsigned char u1byte;	/* an 8 bit unsigned character type */
typedef unsigned short u2byte;	/* a 16 bit unsigned integer type   */
typedef unsigned long u4byte;	/* a 32 bit unsigned integer type   */
typedef signed char s1byte;	/* an 8 bit signed character type   */
typedef signed short s2byte;	/* a 16 bit signed integer type     */
typedef signed long s4byte;	/* a 32 bit signed integer type     */
#endif

/* algorithms */
u4byte *cast_setkey (const u4byte in_key[], const u4byte key_len);
void cast_encrypt (const u4byte in_blk[4], u4byte out_blk[4]);
void cast_decrypt (const u4byte in_blk[4], u4byte out_blk[4]);
u4byte *mars_setkey (const u4byte in_key[], const u4byte key_len);
void mars_encrypt (const u4byte in_blk[4], u4byte out_blk[4]);
void mars_decrypt (const u4byte in_blk[4], u4byte out_blk[4]);
u4byte *safer_setkey (const u4byte in_key[], const u4byte key_len);
void safer_encrypt (const u4byte in_blk[4], u4byte out_blk[4]);
void safer_decrypt (const u4byte in_blk[4], u4byte out_blk[4]);
u4byte *twofish_setkey (const u4byte in_key[], const u4byte key_len);
void twofish_encrypt (const u4byte in_blk[4], u4byte out_blk[4]);
void twofish_decrypt (const u4byte in_blk[4], u4byte out_blk[4]);
u4byte *rijndael_setkey (const u4byte in_key[], const u4byte key_len);
void rijndael_encrypt (const u4byte in_blk[4], u4byte out_blk[4]);
void rijndael_decrypt (const u4byte in_blk[4], u4byte out_blk[4]);

typedef struct
  {
    unsigned long int state[4];
    unsigned long int count[2];
    unsigned char buffer[64];
  }
MD5_CTX;

void MD5Init(MD5_CTX *);
void MD5Update(MD5_CTX *, const unsigned char *, unsigned int);
void MD5Final(unsigned char[16], MD5_CTX *);
void MD5Transform(unsigned long int[4], const unsigned char[64]);
void md5Encode(unsigned char *, unsigned long int *, unsigned int);
void md5Decode(unsigned long int *, const unsigned char *, unsigned int);

/* esoteric macros =oP */

#ifndef _MSC_VER
#define rotr(x,n)   (((x) >> ((int)(n))) | ((x) << (32 - (int)(n))))
#define rotl(x,n)   (((x) << ((int)(n))) | ((x) >> (32 - (int)(n))))
#else
#ifdef HAVE_STDLIB_H
#include <stdlib.h>
#endif
#pragma intrinsic(_lrotr,_lrotl)
#define rotr(x,n)   _lrotr(x,n)
#define rotl(x,n)   _lrotl(x,n)
#endif
#define bswap(x)    (rotl(x, 8) & 0x00ff00ff | rotr(x, 8) & 0xff00ff00)
#define byte(x,n)   ((u1byte)((x) >> (8 * n)))
#ifdef  BYTE_SWAP
#define io_swap(x)  bswap(x)
#else
#define io_swap(x)  (x)
#endif
#ifdef  WORD_SWAP
#define get_block(x)                            \
    ((u4byte*)(x))[0] = io_swap(in_blk[3]);     \
    ((u4byte*)(x))[1] = io_swap(in_blk[2]);     \
    ((u4byte*)(x))[2] = io_swap(in_blk[1]);     \
    ((u4byte*)(x))[3] = io_swap(in_blk[0])
#define put_block(x)                            \
    out_blk[3] = io_swap(((u4byte*)(x))[0]);    \
    out_blk[2] = io_swap(((u4byte*)(x))[1]);    \
    out_blk[1] = io_swap(((u4byte*)(x))[2]);    \
    out_blk[0] = io_swap(((u4byte*)(x))[3])
#define get_key(x,len)                          \
    ((u4byte*)(x))[4] = ((u4byte*)(x))[5] =     \
    ((u4byte*)(x))[6] = ((u4byte*)(x))[7] = 0;  \
    switch((((len) + 63) / 64)) {               \
    case 2:                                     \
    ((u4byte*)(x))[0] = io_swap(in_key[3]);     \
    ((u4byte*)(x))[1] = io_swap(in_key[2]);     \
    ((u4byte*)(x))[2] = io_swap(in_key[1]);     \
    ((u4byte*)(x))[3] = io_swap(in_key[0]);     \
    break;                                      \
    case 3:                                     \
    ((u4byte*)(x))[0] = io_swap(in_key[5]);     \
    ((u4byte*)(x))[1] = io_swap(in_key[4]);     \
    ((u4byte*)(x))[2] = io_swap(in_key[3]);     \
    ((u4byte*)(x))[3] = io_swap(in_key[2]);     \
    ((u4byte*)(x))[4] = io_swap(in_key[1]);     \
    ((u4byte*)(x))[5] = io_swap(in_key[0]);     \
    break;                                      \
    case 4:                                     \
    ((u4byte*)(x))[0] = io_swap(in_key[7]);     \
    ((u4byte*)(x))[1] = io_swap(in_key[6]);     \
    ((u4byte*)(x))[2] = io_swap(in_key[5]);     \
    ((u4byte*)(x))[3] = io_swap(in_key[4]);     \
    ((u4byte*)(x))[4] = io_swap(in_key[3]);     \
    ((u4byte*)(x))[5] = io_swap(in_key[2]);     \
    ((u4byte*)(x))[6] = io_swap(in_key[1]);     \
    ((u4byte*)(x))[7] = io_swap(in_key[0]);     \
    }
#else
#define get_block(x)                            \
    ((u4byte*)(x))[0] = io_swap(in_blk[0]);     \
    ((u4byte*)(x))[1] = io_swap(in_blk[1]);     \
    ((u4byte*)(x))[2] = io_swap(in_blk[2]);     \
    ((u4byte*)(x))[3] = io_swap(in_blk[3])
#define put_block(x)                            \
    out_blk[0] = io_swap(((u4byte*)(x))[0]);    \
    out_blk[1] = io_swap(((u4byte*)(x))[1]);    \
    out_blk[2] = io_swap(((u4byte*)(x))[2]);    \
    out_blk[3] = io_swap(((u4byte*)(x))[3])
#define get_key(x,len)                          \
    ((u4byte*)(x))[4] = ((u4byte*)(x))[5] =     \
    ((u4byte*)(x))[6] = ((u4byte*)(x))[7] = 0;  \
    switch((((len) + 63) / 64)) {               \
    case 4:                                     \
    ((u4byte*)(x))[6] = io_swap(in_key[6]);     \
    ((u4byte*)(x))[7] = io_swap(in_key[7]);     \
    case 3:                                     \
    ((u4byte*)(x))[4] = io_swap(in_key[4]);     \
    ((u4byte*)(x))[5] = io_swap(in_key[5]);     \
    case 2:                                     \
    ((u4byte*)(x))[0] = io_swap(in_key[0]);     \
    ((u4byte*)(x))[1] = io_swap(in_key[1]);     \
    ((u4byte*)(x))[2] = io_swap(in_key[2]);     \
    ((u4byte*)(x))[3] = io_swap(in_key[3]);     \
    }
#endif
#ifdef  BLOCK_SWAP
#define BYTE_SWAP
#define WORD_SWAP
#endif

#endif
