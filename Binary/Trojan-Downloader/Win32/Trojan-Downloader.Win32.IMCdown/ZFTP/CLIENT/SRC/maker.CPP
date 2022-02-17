
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <io.h>
#pragma hdrstop

DWORD buflen;
BYTE* buf  = (BYTE*)malloc(65536);
DWORD obuflen;
BYTE* obuf  = (BYTE*)malloc(65536);

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

void pack(BYTE* iptr, int isize, BYTE* optr, DWORD& osize)
{
  int c,d;

  osize=0;

  for(;;)
  {
    c=0;
x1:
    while ((iptr[c]!=0)&&(c<255)&&(isize-c>0)) c++;

    d=0;
    while ((iptr[c+d]==0)&&(d<255)&&(isize-c-d>0)) d++;

    if (d<3)
    {
      c+=d;
      goto x1;
    }

//  printf("c=%i d=%i\n",c,d);

    *optr++ = c; osize++;
    while (c--) { *optr++ = *iptr++; isize--; osize++; };

    *optr++ = d; osize++;
    iptr += d; isize -= d;

    if (isize==0) break;
  }

}

FILE*o,*o2;

DWORD code=0, len=0;

void main()
{
  o=fopen("..\\client3.bin","wb");
  assert(o);
  o2=fopen("..\\client2.com","wb");
  assert(o2);

  FILE*f=fopen("loader.com","rb");
  assert(f);
  buflen = filelength(fileno(f));
  fread(buf, 1,buflen, f);
  fclose(f);

  for(DWORD i=0; i<buflen; i++)
  {
    char s[32];
    sprintf(s,"%%%02X",buf[i]);
    fwrite(s, 1,3, o);
    fwrite(&buf[i], 1,1, o2);
  }

  fopen("runner.com","rb");
  assert(f);
  buflen = filelength(fileno(f))-0x6566;
  fseek(f, 0x6566, SEEK_SET);
  fread(buf, 1,buflen, f);
  fclose(f);

  f=fopen("fclient.xxx","rb");
  assert(f);
  int t = filelength(fileno(f));
  fread(&buf[buflen], 1,t, f);
  buflen += t;
  fclose(f);

  pack(buf,buflen, obuf,obuflen);

/*  FILE*x=fopen("x","wb");
  assert(x);
  fwrite(obuf, 1,obuflen, x);
  fclose(x);  */

//printf("%i-->%i\n",buflen,obuflen);

  while (obuflen)
  {
    code|= (*obuf++) << len;
    len+=8;
    obuflen--;
    while (len>=6)
    {
      char c = n2x( code&63 );
      fwrite(&c, 1,1, o);
      fwrite(&c, 1,1, o2);
      (unsigned)code>>=6;
      len-=6;
    }
  }

  if (len)
  {
    char c = n2x( code&63 );
    fwrite(&c, 1,1, o);
    fwrite(&c, 1,1, o2);
  }

  char c = 0x20;
  fwrite(&c, 1,1, o2);

  fclose(o);
}
