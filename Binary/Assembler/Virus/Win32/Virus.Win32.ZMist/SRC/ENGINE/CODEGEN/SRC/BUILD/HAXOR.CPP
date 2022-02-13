
#include <windows.h>

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <io.h>

#pragma hdrstop

#define infile   "build.exe"

#define outfile  "..\\..\\cg_bin.inc"
//#define outfile2 "..\\..\\cg_bin.cpp"

void main()
{

  printf("þ reading %s\n", infile);

  FILE*f=fopen(infile,"rb");
  assert(f);
  int bufsize = filelength(fileno(f));
  BYTE* buf = new BYTE[bufsize];
  fread(buf, 1,bufsize, f);
  fclose(f);

  int id1=0, id2=0;
  for (int i=0; i<bufsize; i++)
  {
    if (*(DWORD*)&buf[i] == 0x01FF02EB) id1=i+4;
    if (*(DWORD*)&buf[i] == 0x02FF02EB) id2=i;
  }

  printf("ID1 at %08X\n", id1);
  printf("ID2 at %08X\n", id2);
  assert(id1 && id2);

  printf("þ writing %s\n", outfile);

  f=fopen(outfile,"wb");
  fprintf(f,"; ===========================================================================\r\n");
  fprintf(f,"; CODEGEN 2.50 engine\r\n");
  fprintf(f,"; %i byte(s)\r\n", id2-id1);
  fprintf(f,"; GENERATED FILE. DO NOT EDIT!\r\n");
  fprintf(f,"; ---------------------------------------------------------------------------\r\n");
  fprintf(f,"codegen:\r\n");
  for (int i=0; i<id2-id1; i++)
  {
    if ((i%8)==0) fprintf(f,"db ");
    fprintf(f,"0%02Xh", buf[id1+i]);
    if (((i%8)==7)||(i==id2-id1-1)) fprintf(f,"\r\n"); else fprintf(f,",");
  }
  fprintf(f,"; ===========================================================================\r\n");
  fclose(f);

/*
  printf("þ writing %s\n", outfile2);

  f=fopen(outfile2,"wb");
  fprintf(f,"////////x///////x///////x///////x///////x///////x///////x///////x///////x////\r\n");
  fprintf(f,"// CODEGEN 2.50 engine\r\n");
  fprintf(f,"// %i byte(s)\r\n", id2-id1);
  fprintf(f,"// GENERATED FILE. DO NOT EDIT!\r\n");
  fprintf(f,"////////x///////x///////x///////x///////x///////x///////x///////x///////x////\r\n");
  fprintf(f,"BYTE cg_bin[%i] = {\r\n",id2-id1);
  for (int i=0; i<id2-id1; i++)
  {
    if ((i%8)==0) fprintf(f,"  ");
    fprintf(f,"0x%02X", buf[id1+i]);
    if (i!=id2-id1-1) fprintf(f,",");
    if ((i%8)==7) fprintf(f,"\r\n");
  }
  fprintf(f," };\r\n");
  fprintf(f,"////////x///////x///////x///////x///////x///////x///////x///////x///////x////\r\n");
  fclose(f);
*/

}
