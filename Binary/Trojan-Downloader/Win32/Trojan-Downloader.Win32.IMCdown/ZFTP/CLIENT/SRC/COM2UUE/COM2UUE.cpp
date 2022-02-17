
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <io.h>
#pragma hdrstop

#define LINESIZE        64
#define C_MIN           0x30    // '0'

char* obuf=(char*)malloc(65536);
int obufsize=0;

int code=0, len=0, l=0;

int n2x(int k)
{
    assert(k>=0);
    assert(k<=63);
    if (k==62)        return '-'; else
    if (k==63)        return '_'; else
    if (k>=10+26)     return k+'a'-10-26;   else
    if (k>=10   )     return k+'A'-10;      else
                      return k+'0';
}

void putbyte(int x)
{
  code|=(x&255)<<len;
  len+=8;
  while (len>=6)
  {
    obuf[obufsize++] = n2x( code&63 );
    (unsigned)code>>=6;
    len-=6;

    l++;
    if (l>=LINESIZE)
    {
      l=0;
      obuf[obufsize++]=0x0D;
      obuf[obufsize++]=0x0A;
    }

  }
}

void main(int argc, char* argv[])
{
  if (argc!=4)
  {
    printf("syntax: com2uue infile outfile ldrfile\n");
    return;
  }

  FILE*f = fopen(argv[3],"rb");
  assert(f!=NULL);
  int buf1size = filelength(fileno(f));
  char* buf1 = (char*)malloc(buf1size);
  fread(buf1, 1,buf1size, f);
  fclose(f);

  for(int i=1; i<buf1size; i++)
  {
    if (buf1[i]==0x0A) l=0; else l++;
  }

  f = fopen(argv[1],"rb");
  assert(f!=NULL);
  int ibufsize = filelength(fileno(f));
  char* ibuf = (char*)malloc(ibufsize);
  fread(ibuf, 1,ibufsize, f);
  fclose(f);

//for (int i=buf1size-1; i>=0; i--, l++)
//  if (buf1[i]==0x0A) break;

  putbyte(ibufsize&0xFF);
  putbyte((ibufsize>>8)&0xFF);
  for (int i=0; i<ibufsize; i++)
    putbyte(ibuf[i]&0xFF);
  if (len!=0) obuf[obufsize++] = n2x( code&63 );

  obuf[obufsize++]=0x0D;
  obuf[obufsize++]=0x0A;

  f = fopen(argv[2],"wb");
  assert(f!=NULL);
  fwrite(buf1, 1,buf1size, f);
  fwrite(obuf, 1,obufsize, f);
  fclose(f);

}
