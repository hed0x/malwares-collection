#include <mix/aes.h>
#include <mix/mix.h>

short alg = CAST256;		/* default algorithm */
short aes_binary = 0;		/* to disable base64 encoding */

static const char b64[] =
"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

static const char ascii[256] =
{
  64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
  64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
  64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 62, 64, 64, 64, 63,
  52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 64, 64, 64, 64, 64, 64,
  64, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
  15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 64, 64, 64, 64, 64,
  64, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
  41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 64, 64, 64, 64, 64,
  64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
  64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
  64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
  64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
  64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
  64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
  64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
  64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64
};

extern u4byte l1_key[96];	/* cast-256 */
extern u4byte l2_key[40];	/* mars */
extern u4byte l3_key[528];	/* safer plus */
extern u4byte l4_key[40];	/* twofish */
extern u4byte k_len, e_key[60], d_key[60];	/* rijndael */

u4byte *
aes_key(const char *pw)
{
  u4byte keylen = strlen(pw) * 8;	/* keylen in bits */
  u4byte key[128];
  u4byte *r;

  k_len = 0;

  memset(l1_key, 0, 96);
  memset(l2_key, 0, 40);
  memset(l3_key, 0, 44);
  memset(l4_key, 0, 40);
  memset(e_key, 0, 60);
  memset(d_key, 0, 60);
  memset(key, 0, 128);

  if (keylen > 256)
    keylen = 256;

  memcpy(key, pw, keylen / 8);

  switch (alg)
    {
    case CAST256:
      r = cast_setkey(key, keylen);
      break;
    case MARS:
      r = mars_setkey(key, keylen);
      break;
    case SAFERP:
      r = safer_setkey(key, keylen);
      break;
    case TWOFISH:
      r = twofish_setkey(key, keylen);
      break;
    case RIJNDAEL:
      r = rijndael_setkey(key, keylen);
      break;
    default:
      exit(-1);
      break;
    }

  return r;
}

u1byte *
aes_encrypt(const u1byte * inbuf, int *lenp)
{
  int len = *lenp;
  u4byte i, in_blk[4], out_blk[4];
  u1byte *otmp = NEW(u1byte, len + 32);
  u1byte *obuf, *intmp;

  memset(otmp, 0, len + 32);

  if (len <= 0)
    {
      DELETE(otmp);
      return (u1byte *) nstrdup((const char *) inbuf);
    }

  intmp = NEW(u1byte, len + 32);
  memset(intmp, 0, len + 32);
  memcpy(intmp, inbuf, len);
  len += 16;
  (*lenp) = len;

  if ((len % 16) != 0)
    {
      len += 16 - (len % 16);
      (*lenp) = len;
    }

  for (i = 0; (int) i < len / 16; i++)
    {
      memset(in_blk, 0, 16);
      memset(out_blk, 0, 16);
      memcpy(in_blk, intmp + (i * 16), 16);
      switch (alg)
	{
	case CAST256:
	  cast_encrypt(in_blk, out_blk);
	  break;
	case MARS:
	  mars_encrypt(in_blk, out_blk);
	  break;
	case SAFERP:
	  safer_encrypt(in_blk, out_blk);
	  break;
	case TWOFISH:
	  twofish_encrypt(in_blk, out_blk);
	  break;
	case RIJNDAEL:
	  rijndael_encrypt(in_blk, out_blk);
	  break;
	default:
	  exit(-1);
	  break;
	}
      memcpy(otmp + (i * 16), out_blk, 16);
    }

  if (aes_binary)
    obuf = (u1byte *) nstrdup((const char *) otmp);
  else
    obuf = (u1byte *) base64_in(otmp, len);
  DELETE(intmp);
  DELETE(otmp);
  return obuf;
}

u1byte *
aes_decrypt(const u1byte * inbuf, int len)
{
  u4byte i, in_blk[4], out_blk[4];
  u1byte *otmp, *obuf;

  if (aes_binary)
    otmp = (u1byte *) nstrdup((const char *) inbuf);
  else
    otmp = base64_out((s1byte *) inbuf, len);

  if (len <= 0)
    {
      DELETE(otmp);

      return (u1byte *) nstrdup((const char *) inbuf);
    }

  obuf = NEW(u1byte, len + 48);
  memset(obuf, 0, len + 48);

  for (i = 0; (int) i < len / 16; i++)
    {
      memset(in_blk, 0, 16);
      memset(out_blk, 0, 16);
      memcpy(in_blk, otmp + (i * 16), 16);
      switch (alg)
	{
	case CAST256:
	  cast_decrypt(in_blk, out_blk);
	  break;
	case MARS:
	  mars_decrypt(in_blk, out_blk);
	  break;
	case SAFERP:
	  safer_decrypt(in_blk, out_blk);
	  break;
	case TWOFISH:
	  twofish_decrypt(in_blk, out_blk);
	  break;
	case RIJNDAEL:
	  rijndael_decrypt(in_blk, out_blk);
	  break;
	default:
	  exit(-1);
	  break;
	}
      memcpy(obuf + (i * 16), out_blk, 16);
    }
  DELETE(otmp);
  return obuf;
}

u1byte *
aes_hash(const s1byte * buf)
{
  int sl = strlen((const char *) buf);

#ifndef LIBMIX_MD5_HASH

  aes_key((const char *) buf);
  return (aes_encrypt((const u1byte *) buf, &sl));
#else
  MD5_CTX context;
  unsigned char d[16];
  u1byte *p = NEW(u1byte, 33);

  MD5Init(&context);
  MD5Update(&context, (const unsigned char *) buf, sl);
  MD5Final(d, &context);

  memset(p, 0, 33);
  snprintf((char *) p, 32, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", d[0], d[1], d[2], d[3], d[4], d[5], d[6], d[7], d[8], d[9], d[10], d[11], d[12], d[13], d[14], d[15]);

  return p;
#endif
}

s1byte *
base64_in(const u1byte * buf, int len)
{
  s1byte *obuf = NEW(s1byte, (len + 25) * 2);
  s1byte *retbuf = obuf;
  int i;

  memset(obuf, 0, (len + 25) * 2);

  for (i = 0; i < len - 2; i += 3)
    {
      *obuf++ = b64[(buf[i] >> 2) & 0x3F];
      *obuf++ = b64[((buf[i] & 0x3) << 4 | ((int) (buf[i + 1] & 0xF0) >> 4))];
      *obuf++ = b64[((buf[i + 1] & 0xF) << 2) | ((int) (buf[i + 2] & 0xC0) >> 6)];
      *obuf++ = b64[buf[i + 2] & 0x3F];
    }
  if (i < len)
    {
      *obuf++ = b64[(buf[i] >> 2) & 0x3F];
      if (i == (len - 1))
	{
	  *obuf++ = b64[((buf[i] & 0x3) << 4)];
	}
      else
	{
	  *obuf++ = b64[((buf[i] & 0x3) << 4 | ((int) (buf[i + 1] & 0xf0) >> 4))];
	  *obuf++ = b64[((buf[i + 1] & 0xf) << 2)];
	}
    }

  *obuf++ = '\0';

  return retbuf;
}

u1byte *
base64_out(const s1byte * buf, int len)
{
  u1byte *obuf = NEW(u1byte, (len + 9) * 2);
  u1byte *retbuf = obuf;
  const s1byte *p = buf;
  int nprbytes;

  memset(obuf, 0, (len + 9) * 2);

  while (ascii[(int) *(p++)] <= 63);
  nprbytes = len - 1;

  while (nprbytes > 4 && *buf != '\0')
    {
      *(obuf++) = (ascii[(int) *buf] << 2 | ascii[(int) buf[1]] >> 4);
      *(obuf++) = (ascii[(int) buf[1]] << 4 | ascii[(int) buf[2]] >> 2);
      *(obuf++) = (ascii[(int) buf[2]] << 6 | ascii[(int) buf[3]]);
      buf += 4;
      nprbytes -= 4;
    }
  if (nprbytes > 1)
    *(obuf++) =
      (ascii[(int) *buf] << 2 | ascii[(int) buf[1]] >> 4);
  if (nprbytes > 2)
    *(obuf++) =
      (ascii[(int) buf[1]] << 4 | ascii[(int) buf[2]] >> 2);
  if (nprbytes > 3)
    *(obuf++) =
      (ascii[(int) buf[2]] << 6 | ascii[(int) buf[3]]);

  *(obuf)++ = '\0';

  return retbuf;
}
