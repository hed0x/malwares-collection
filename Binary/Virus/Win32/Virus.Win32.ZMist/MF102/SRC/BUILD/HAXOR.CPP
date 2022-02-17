
#include <windows.h>

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <io.h>

#pragma hdrstop

#include "..\engine.hpp"

#define infile   "..\\..\\EXAMPLE\\REVERT2\\revert2.exe"

#define outfile1 "..\\..\\BIN\\mif_krn.inc"
#define outfile2 "..\\..\\BIN\\mif_mut.inc"

void main()
{

  printf("þ reading %s\n", infile);

  FILE*f=fopen(infile,"rb");
  assert(f);
  int bufsize = filelength(fileno(f));
  BYTE* buf = new BYTE[bufsize];
  fread(buf, 1,bufsize, f);
  fclose(f);

  int id1=0, id2=0, id3=0, id4=0;
  for (int i=0; i<bufsize; i++)
  {
    if (*(DWORD*)&buf[i] == 0x01FF02EB) { id1=i+5; while (buf[id1]==0x90) id1++; };
    if (*(DWORD*)&buf[i] == 0x02FF02EB) id2=i;
    if (*(DWORD*)&buf[i] == 0x03FF02EB) { id3=i+5; while (buf[id3]==0x90) id3++; };
    if (*(DWORD*)&buf[i] == 0x04FF02EB) id4=i;
  }

  printf("ID1 at %08X\n", id1);
  printf("ID2 at %08X\n", id2);
  printf("ID3 at %08X\n", id3);
  printf("ID4 at %08X\n", id4);
  assert(id1 && id2 && id3 && id4);

  printf("þ writing %s\n", outfile1);

  f=fopen(outfile1,"wb");
  fprintf(f,"; ===========================================================================\r\n");
  fprintf(f,"; MISTFALL %s -- kernel\r\n", MISTFALL_VERSION);
  fprintf(f,"; %i byte(s)\r\n", id2-id1);
  fprintf(f,"; GENERATED FILE. DO NOT EDIT!\r\n");
  fprintf(f,"; ---------------------------------------------------------------------------\r\n");
  for (int i=0; i<id2-id1; i++)
  {
    if ((i%8)==0) fprintf(f,"db ");
    fprintf(f,"0%02Xh", buf[id1+i]);
    if (((i%8)==7)||(i==id2-id1-1)) fprintf(f,"\r\n"); else fprintf(f,",");
  }
  fprintf(f,"; ===========================================================================\r\n");
  fclose(f);

  printf("þ writing %s\n", outfile2);

  f=fopen(outfile2,"wb");
  fprintf(f,"; ===========================================================================\r\n");
  fprintf(f,"; MISTFALL %s -- mutator\r\n", MISTFALL_VERSION);
  fprintf(f,"; %i byte(s)\r\n", id4-id3);
  fprintf(f,"; GENERATED FILE. DO NOT EDIT!\r\n");
  fprintf(f,"; ---------------------------------------------------------------------------\r\n");
  for (int i=0; i<id4-id3; i++)
  {
    if ((i%8)==0) fprintf(f,"db ");
    fprintf(f,"0%02Xh", buf[id3+i]);
    if (((i%8)==7)||(i==id4-id3-1)) fprintf(f,"\r\n"); else fprintf(f,",");
  }
  fprintf(f,"; ===========================================================================\r\n");
  fclose(f);

}
