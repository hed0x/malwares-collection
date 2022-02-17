
#include <stdlib.h>
#include <stdio.h>
#include <signal.h>

#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>

#include "pop3.h"
#include "md5/md5.h"

/* added by Glynn Clements <glynn@sensei.co.uk> 1997-07-08 */

/*
  modified by Glynn Clements <glynn@sensei.co.uk> 1997-07-11
  to use GNU md5 routines
*/

/**************************************************************************/

static struct md5_ctx ctx;
static const char hex[] = "0123456789abcdef";

/**************************************************************************/

static void
md5_hex(unsigned char *src, char *dst)
{
	unsigned i, c;

	for (i = 0; i < 16; i++)
	{
		c = src[i];
		dst[i * 2 + 0] = hex[c >> 4];
		dst[i * 2 + 1] = hex[c & 0x0F];
	}

	dst[32] = '\0';
}

/**************************************************************************/

void
do_md5_file(FILE *src, long start, long bytes, char *hash)
{
	char buff[1024];
	unsigned char result[16];
	int left, n;

	md5_init_ctx(&ctx);

	fseek(src, start, SEEK_SET);

	while (bytes > 0)
	{
		n = fread(buff, 1, min(bytes, sizeof(buff)), src);
		if (n <= 0)
			break;
		md5_process_bytes(buff, n, &ctx);
		bytes -= n;
	}

	md5_finish_ctx(&ctx, result);
	md5_hex(result, hash);
}

void
do_md5_string(char *pass, int passlen, char *hash)
{
	unsigned char result[16];

	md5_init_ctx(&ctx);
	md5_process_bytes(pass, passlen, &ctx);
	md5_finish_ctx(&ctx, result);
	md5_hex(result, hash);
}

/**************************************************************************/

