
#include <windows.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <io.h>

#pragma hdrstop

int OPT_Q=0;

#define A_COMP          1
#define A_DECOMP        2

#define COMPRESS_CPP  // compression: use C++ subroutine instead of asm

#ifdef COMPRESS_CPP
#include "z_encode.cpp"
#endif

extern "C"
{
#ifndef COMPRESS_CPP
void __cdecl compress  (BYTE* ibuf, DWORD isize, BYTE* obuf);
#endif
void __cdecl decompress(BYTE* ibuf, BYTE* obuf);
}

void help()
{
#ifdef COMPRESS_CPP
  printf("syntax: PACKER c|d infile [outfile] [/q] [/best]\n");
#else
  printf("syntax: PACKER c|d infile [outfile] [/q]\n");
#endif
  exit(0);
}

void main(int argc, char* argv[])
{
  printf("PACKER/z_coding  (x) 2001   right toolz for the right job\n");

  char *szaction="", *ifile="", *ofile="";

  for (int i=1; i<argc; i++)
  {
#ifdef COMPRESS_CPP
    if (!stricmp(argv[i],"/best")) kind = 65000; else
#endif
    if (!stricmp(argv[i],"/q")) OPT_Q=1; else
    if (!*szaction) szaction=argv[i]; else
    if (!*ifile) ifile=argv[i]; else
    if (!*ofile) ofile=argv[i]; else help();
  }
  if (!*szaction) help();
  if (!*ifile) help();
  if (!*ofile) ofile=ifile;

#ifdef COMPRESS_CPP
  if (!OPT_Q)
  if (kind==65000)
  printf("þ using best compression\n");
#endif

  int action=0;
  if (!stricmp(szaction,"c")) action=A_COMP;
  if (!stricmp(szaction,"d")) action=A_DECOMP;
  if (!action) help();

  if (!OPT_Q)
  printf("þ reading %s\n", ifile);

  FILE*f=fopen(ifile,"rb");
  assert(f);
  DWORD isize = filelength(fileno(f));
  BYTE* ibuf = new BYTE[1024+isize];
  fread(ibuf, 1,isize, f);
  fclose(f);

  DWORD osize;

  if (action==A_COMP)   osize=isize+8;
  if (action==A_DECOMP) osize=*(DWORD*)&ibuf[4];

  BYTE* obuf = new BYTE[ 1024+osize*9/8 ];

  if (action==A_COMP)
  {
    if (!OPT_Q)
    printf("þ compressing\n");
    compress(ibuf,isize,obuf);
//  if (!OPT_Q)
//  printf("original     : %i\n",isize);
    osize=*(DWORD*)&obuf[0]+8;
//  if (!OPT_Q)
//  printf("compressed   : %i\n",osize);
  }

  if (action==A_DECOMP)
  {
    if (!OPT_Q)
    printf("þ decompressing\n");
    decompress(ibuf,obuf);
//  if (!OPT_Q)
//  {
//  printf("original     : %i\n",isize);
//  printf("decompressed : %i\n",osize);
//  }
  }

  if (!OPT_Q)
  printf("þ writing %s\n", ofile);

  f=fopen(ofile,"wb");
  assert(f);
  fwrite(obuf, 1,osize, f);
  fclose(f);

  if (action==A_COMP)
  {
    if (!OPT_Q)
    printf("þ verify... ");
    BYTE* xbuf = new BYTE[ 1024+isize*9/8 ];
    decompress(obuf,xbuf);
    for (DWORD i=0; i<isize; i++)
    if (ibuf[i]!=xbuf[i])
    {
      printf("verify ***FAILED***\n");
      exit(0);
    }
    if (!OPT_Q)
    printf("OK\n");
  }

}
