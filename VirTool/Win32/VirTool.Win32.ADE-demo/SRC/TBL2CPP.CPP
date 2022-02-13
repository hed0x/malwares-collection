
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <io.h>
#pragma hdrstop

void main()
{
  FILE*f=fopen("flagtabl.dat","rb");
  assert(f);
  FILE*o=fopen("ade32tbl.cpp","wb");
  assert(o);
  fprintf(o,"// GENERATED FILE. DO NOT EDIT!\n");
  fprintf(o,"DWORD ade32_table[512] = {\n");
  DWORD c=0;
  for(;;)
  {
    char s[1024];
    fgets(s,sizeof(s),f);
    if (feof(f)) break;
    if (strchr(s,'\n')) *strchr(s,'\n') = 0;
    if (strchr(s,'\r')) *strchr(s,'\r') = 0;
    if (strchr("0123456789ABCDEF",s[0]))
    if (strchr("0123456789ABCDEF",s[1]))
    if (s[2]==32)
    {
      fprintf(o,"/* %c%c */  %s", s[0],s[1], &s[8]);
      c++;
      if (c!=512) fprintf(o,",");
      fprintf(o,"\n");
    }
  }
  fprintf(o,"}; // ade32_table[]");
  fclose(f);
  fclose(o);
  assert(c==512);
} // main
