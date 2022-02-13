
#include <windows.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <io.h>
#include <conio.h>

#pragma hdrstop

#include "..\CRC32\crc32.hpp"

int OPT_Q=0;

void help()
{
  printf("syntax: HEADER plugin<.pgn> ver<N> [/q]\n");
  exit(0);
}

void main(int argc, char* argv[])
{
  printf("HEADER for PGN2   (x) 2001   right toolz for the right job\n");

  char *fname="",  *verstr="";

  for (int i=1; i<argc; i++)
  {
    if (!stricmp(argv[i],"/q")) OPT_Q=1; else
    if (!*fname) fname=argv[i]; else
    if (!*verstr) verstr=argv[i]; else
      help();
  }
  if (!*fname) help();
  if (!*verstr) help();

  if (!OPT_Q)
  printf("þ reading %s\n", fname);

  FILE*f=fopen(fname,"rb");
  assert(f);
  DWORD bufsize = filelength(fileno(f));
  BYTE* buf = new BYTE[1024+bufsize];
  fread(buf, 1,bufsize, f);
  fclose(f);

  DWORD crc, ver;

  char* s = strdup(fname);
  if (strrchr(s,'\\')) strcpy(s, strrchr(s,'\\')+1);
  if (strchr(s,'.')) *strchr(s,'.')=0;
  for (int i=0; i<strlen(s); i++)
    if ((s[i]>='A')&&(s[i]<='Z')) s[i]|=32;
  crc = crc32(s);

  if (!strncmpi(verstr,"ver",3)) verstr+=3;
  ver = atoi(verstr);
  assert(ver);

  if (*(DWORD*)&buf[0] != crc)
  {
    if (!OPT_Q)
    printf("þ adding: ID=CRC32('%s')=%08X, version=%i\n", s, crc, ver);

    MoveMemory(&buf[8], &buf[0], bufsize);
    bufsize += 8;
    *(DWORD*)&buf[0] = crc;
    *(DWORD*)&buf[4] = ver;

  }
  else
  {

    MoveMemory(&buf[0], &buf[8], bufsize);
    bufsize -= 8;

    if (!OPT_Q)
    printf("þ removing: ID=CRC32('%s')=%08X\n", s, crc);

  }

  if (crc==0)
  {
    printf("***ERROR***: plugin ID shouldn't be 0\n");
    getch();
    exit(0);
  }

  if (!OPT_Q)
  printf("þ writing %s\n", fname);

  f=fopen(fname,"wb");
  assert(f);
  fwrite(buf, 1,bufsize, f);
  fclose(f);
}
