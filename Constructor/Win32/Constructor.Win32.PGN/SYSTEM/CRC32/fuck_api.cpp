
#include "crc32.hpp"

int PGN2_FUCKAPI=0;

void init_fuckapi()
{
  char v[512]="";
  int res=GetEnvironmentVariable("PGN2_FUCKAPI",v,sizeof(v));
  if (res)
  {
    if (!strcmp(v,"No"))    PGN2_FUCKAPI=0; else
    if (!strcmp(v,"Yes"))   PGN2_FUCKAPI=1; else
    if (!strcmp(v,"Badly")) PGN2_FUCKAPI=2; else
    {
       printf("þ ERROR: error in <set PGN2_FUCKAPI=Yes|No|Badly>\n");
       exit(0);
    }
  }
}

char* fuck_api(char* s)
{
  static char rndstr[512];
  char* o = rndstr;
  if (s[0]=='@') { s++; *o++='@'; };
  DWORD randseed = crc32(s);
  int l = strlen(s);
  while (l--)
  {
    randseed = randseed * 214013 + 2531011;
    if (PGN2_FUCKAPI == 1) *o++ = 'A' + (((randseed >> 16) *  26) >> 16);
    if (PGN2_FUCKAPI == 2) *o++ =  1  + (((randseed >> 16) * 255) >> 16);
  }
  *o = 0;
  return rndstr;
}
