
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <io.h>
#pragma hdrstop

#include "random.hpp"

#define LINESIZE        64
#define C_MIN           0x21    // 0
#define C_MAX           0x7E    // ~
                                            // !'`()*;,.$^-_[]{}
#define notrangeB(x)   ( ((x)==0)||(strchr("-_0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz",(x))==0) )

#define notrange(x)    ( (notrangeB( (x)&255)      ) ||        \
                         (notrangeB( ((x)>>8)&255) ) )

char* obuf = (char*)malloc(8192);
int osize=0;

void crlf()
{
  if ((osize%(LINESIZE+2))>LINESIZE-4)
  {
    while ((osize%(LINESIZE+2))<LINESIZE-1)
      obuf[osize++]=0x4A; // dec dx
    obuf[osize++]=0x3D;   // cmp ax, 0A0Dh
    obuf[osize++]=0x0D;
    obuf[osize++]=0x0A;
  }
}

DWORD a= (C_MIN<<8)+C_MIN , a0=-1;

void gen_ax(DWORD x)
{
    DWORD b,c,t;

c9:
    b=rnd(65536);
    if notrange(b) goto c9;

    b--;
    for (;;)
    {
      b++;
      if (notrangeB(b&0xFF)) b++;
      if (notrangeB(b&0xFF)) b++;
      if (notrangeB(b&0xFF)) b=(b&0xFF00)+0x0100+C_MIN;
      if (notrange(b)) break;

      t=((a-b)^x)&0xFF;
      for (c=C_MIN; c<=C_MAX; c++)
        if (!notrangeB(c))
          if (!(t^c)) goto c1;
      continue;
c1:
      t=(((a-b)^x)>>8)&0xFF;
      int cc;
      for (cc=C_MIN; cc<=C_MAX; cc++)
        if (!notrangeB(cc))
          if (!(t^cc)) goto c2;
      continue;
c2:
      c|=cc<<8;

      goto c3;
    }

c0:
    a=rnd(65536);
    if (notrange(a)) goto c0;

    goto c9;

c3:

    assert( !(notrange(b)) );
    assert( !(notrange(c)) );

    int r = (a-b)^c;
    if ((r-x)&0xFFFF)
    {
      printf("x=%04X a=%04X b=%04X c=%04X r=%04X\n",x,a,b,c,r);
      printf("error\n");
      exit(0);
    }

    printf(".");

    if (a!=a0)
    {
      if notrange(a) goto c0;

      obuf[osize++]=0x68; // push a
      obuf[osize++]=a&255;
      obuf[osize++]=(a>>8)&255;
      crlf();

      obuf[osize++]=0x58; // pop ax
      crlf();
    }

    obuf[osize++]=0x2D; // sub ax, b
    obuf[osize++]=b&255;
    obuf[osize++]=(b>>8)&255;
    crlf();

    obuf[osize++]=0x35; // xor ax, c
    obuf[osize++]=c&255;
    obuf[osize++]=(c>>8)&255;
    crlf();

    a = x;
    a0 = a;
}

void main(int argc, char* argv[])
{
  if (argc!=3)
  {
    printf("syntax: com2uuex infile outfile\n");
    return;
  }

  FILE *f = fopen(argv[1],"rb");
  assert(f!=NULL);
  int isize = filelength(fileno(f));
  printf("þ reading %s, %i byte(s)\n", argv[1], isize);
  short* ibuf = (short*)malloc(isize);
  fread(ibuf, 1,isize, f);
  fclose(f);

  printf("þ converting\n");

  crlf();
/*
  obuf[osize++] = 0x50; // push ax
  obuf[osize++] = 0x51; // push cx
  obuf[osize++] = 0x52; // push dx
  obuf[osize++] = 0x53; // push bx
  obuf[osize++] = 0x54; // push sp
  obuf[osize++] = 0x55; // push bp
  obuf[osize++] = 0x56; // push si
  obuf[osize++] = 0x57; // push di
*/
  crlf();

  for (int i=(isize+1)/2-1; i>=0; i--)
  {
    gen_ax(ibuf[i]);
    obuf[osize++]=0x50; // push ax
    crlf();
  }

  int osize0 = osize;
  int osizes = 16;
  int savea0 = a0;

c7:
//obuf[osize++]=0xCC;

  int i=osize + osizes;
  gen_ax(0x100+i);

  obuf[osize++]=0x50;   // push ax
  crlf();
  obuf[osize++]=0x5F;   // pop  di
  crlf();

c8:
  int i2=rnd(65536);
  if notrange(i2) goto c8;

  gen_ax(0xD0FF^i2);    // FF D0   CALL AX
  obuf[osize++]=0x50;   // push ax
  crlf();
  obuf[osize++]=0x5D;   // pop  bp
  crlf();
  obuf[osize++]=0x54;   // push sp
  crlf();
  obuf[osize++]=0x58;   // pop  ax
  crlf();

  obuf[osize++]=0x31;   // xor  [di], bp
  obuf[osize++]=0x2D;
  crlf();

  while (osize<i)
  {
    obuf[osize++]=0x41;  // inc bx
    crlf();
  }

  if (osize>i)
  {
    printf("r");
    osize = osize0;
    osizes += 8;
    a0 = savea0;
    goto c7;
  }

  obuf[osize++]=i2;     // call ax
  obuf[osize++]=i2>>8;
  crlf();

  printf("\nþ writing %s, %i byte(s)\n", argv[2], osize);

  f = fopen(argv[2],"wb");
  assert(f!=NULL);
  fwrite(obuf, 1,osize, f);
  fclose(f);

}
