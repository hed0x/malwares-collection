
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <dir.h>
#include <dos.h>

#include "..\engine\mz.hpp"
#include "..\engine\pe.hpp"
#include "..\engine\disasm.cpp"
#include "..\engine\random.cpp"
#include "..\engine\engine.cpp"

void main(int argc, char*argv[])
{
  randseed = GetTickCount();

  printf("CODE PERVERTOR Win32 CommandLine  release 1.01  http://z0mbie.cjb.net\n");

  if (argc<=1)
  {
    printf("syntax: pervwcl [/a] file(s)\n");
    return;
  }

  for (int i=1; i<argc; i++)
  {
    if (!stricmp(argv[i],"/a"))
      OPT_ALL++;
  }

  for (int i=1; i<argc; i++)
  if (stricmp(argv[i],"/a"))
  {
    char d[MAXPATH], d1[MAXDRIVE], d2[MAXDIR], d3[MAXFILE], d4[MAXEXT];
    fnsplit(argv[i], d1,d2,d3,d4);
    if (d3[0]==0) strcpy(d3,"*");
    fnmerge(d, d1,d2,d3,d4);
    struct ffblk r;
    for (int done=findfirst(d, &r, FA_ARCH);
         !done;
         done=findnext(&r))
    {
      fnmerge(d, d1,d2,r.ff_name,0);
      pervert_file(d);
    }
  }
}

