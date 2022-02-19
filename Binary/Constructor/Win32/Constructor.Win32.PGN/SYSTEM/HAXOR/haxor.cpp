
#include <windows.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <io.h>

#pragma hdrstop

int OPT_Q=0;

#define M_BIN   0
#define M_ASM   1
#define M_CPP   2
#define M_PAS   3

#define NONE    0xFFFFFFFF

void help()
{
  printf("syntax:\n"\
         "HAXOR /bin|/asm|/cpp|/pas infile [outfile] [@lbl] [/S=start_id /E=end_id] [/q]\n");
  exit(0);
}

void main(int argc, char* argv[])
{
  printf("HAXOR tool  (x) 2001  right toolz for the right job\n");
  
  char *ifile="", *ofile="", *label="", *start_id="", *end_id="";
  int mode = M_ASM;

  for (int i=1; i<argc; i++)
  {
    if (argv[i][0]=='/')
    {
      if (!stricmp(argv[i],"/q")) OPT_Q=1; else
      if (!stricmp(argv[i],"/bin")) mode=M_BIN; else
      if (!stricmp(argv[i],"/asm")) mode=M_ASM; else
      if (!stricmp(argv[i],"/cpp")) mode=M_CPP; else
      if (!stricmp(argv[i],"/pas")) mode=M_PAS; else
      if (!strncmpi(argv[i],"/s=",3)) start_id = &argv[i][3]; else
      if (!strncmpi(argv[i],"/e=",3)) end_id   = &argv[i][3]; else
        help();
    }
    else
    if (argv[i][0]=='@')
    {
      if (!*label) label=&argv[i][1]; else
        help();
    }
    else
    {
      if (!*ifile) ifile=argv[i]; else
      if (!*ofile) ofile=argv[i]; else
        help();
    }
  }

  if (!*ifile) help();
  if ((*start_id != 0) ^ (*end_id != 0)) help();
  if (!*label) label="abc";

  if (  (!*ofile) || (strchr(ofile,'\\') >= strchr(ofile,'.'))  )
  {
    char* tfile = new char[1024];
    if (!*ofile)
    {
      ofile = strcpy(tfile, ifile);
      if (strchr(ofile,'.') > strchr(ofile, '\\')) *strchr(ofile,'.')=0;
    }
    else
      ofile = strcpy(tfile, ofile);
    switch (mode)
    {
      case M_BIN: strcat(ofile, ".bin"); break;
      case M_ASM: strcat(ofile, ".asi"); break;
      case M_CPP: strcat(ofile, ".hpp"); break;
      case M_PAS: strcat(ofile, ".inc"); break;
    }
  }

  if (!OPT_Q)
  printf("þ reading %s\n", ifile);

  FILE*f=fopen(ifile, "rb");
  assert(f);
  DWORD bufsize = filelength(fileno(f));
  BYTE* buf = new BYTE[ bufsize ];
  assert(buf);
  fread(buf, 1,bufsize, f);
  fclose(f);

  DWORD start_n = 0, end_n = bufsize;

  if (*start_id)
  {
    start_n = end_n = NONE;
    if (!OPT_Q)
    printf("þ searching for ID's\n");
    DWORD sl = strlen(start_id);
    DWORD el = strlen(end_id);
    for (DWORD i=0; i<bufsize; i++)
    {
      if (!memcmp(&buf[i], start_id, sl))
      {
        start_n = i + sl;
        if (end_n != NONE) break;
      }
      if (!memcmp(&buf[i], end_id, el))
      {
        end_n = i;
        if (start_n != NONE) break;
      }
    }
    if (start_n == NONE)
      printf("start_ID ***NOT FOUND***\n");
    else
      if (!OPT_Q)
        printf("start_ID found at %08X\n", start_n);
    if (end_n == NONE)
      printf("end_ID ***NOT FOUND***\n");
    else
      if (!OPT_Q)
        printf("end_ID   found at %08X\n", end_n);
    if (  ((start_n | end_n) == NONE) || (end_n < start_n)  )
    {
      printf("***ERROR***\n");
      exit(0);
    }
  }

  DWORD sz = end_n - start_n;

  if (!OPT_Q)
  printf("þ writing %s\n", ofile);

  f=fopen(ofile, "wb");
  assert(f);

  if (mode==M_BIN)
  {

    fwrite(&buf[start_n], 1,sz, f);

  }
  else
  {

    switch (mode)
    {
      case M_ASM:
        fprintf(f,"; GENERATED FILE. DO NOT EDIT!\r\n\r\n");
        fprintf(f,"%s_size\tequ\t0%08Xh\t; %i\r\n\r\n", label, sz, sz);
        fprintf(f,"%s:\r\n", label);
        break;
      case M_CPP:
        fprintf(f,"// GENERATED FILE. DO NOT EDIT!\r\n\r\n");
        fprintf(f,"#define\t%s_size\t0x%08X\t// %i\r\n\r\n", label, sz, sz);
        fprintf(f,"BYTE %s[%s_size] =\r\n{\r\n", label, label);
        break;
      case M_PAS:
        fprintf(f,"{ GENERATED FILE. DO NOT EDIT! }\r\n\r\n");
        fprintf(f,"const\r\n\t%s_size\t=\t$%08X;\t{ %i }\r\n\r\n", label, sz, sz);
        fprintf(f,"\t%s : array[0..%s_size-1] of byte =\r\n(\r\n", label,label);
        break;
    }

    for (DWORD i=start_n, j=0; i<end_n; i++, j=(j+1)&7)
    {
      if (j==0)
      {
        switch (mode)
        {
          case M_ASM:
            fprintf(f,"\tdb\t");
            break;
          case M_CPP:
          case M_PAS:
            fprintf(f,"\t");
            break;
        }
      }

      switch (mode)
      {
        case M_ASM:
          fprintf(f,"0%02Xh", buf[i]);
          break;
        case M_CPP:
          fprintf(f,"0x%02X", buf[i]);
          break;
        case M_PAS:
          fprintf(f,"$%02X", buf[i]);
          break;
      }

      if ((j<7)||(mode!=M_ASM))
        if (i!=end_n-1)
          fprintf(f,",");
      if (j==7)
        fprintf(f,"\r\n");
    } //for i

    switch (mode)
    {
      case M_CPP:
        fprintf(f,"};\r\n");
        break;
      case M_PAS:
        fprintf(f,");\r\n");
        break;
    }

  }

  fclose(f);

  if (!OPT_Q)
  printf("þ complete\n");
} //main
