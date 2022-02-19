
#include <windows.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <io.h>

#pragma hdrstop

int OPT_Q=0;
int OPT_PRI=5;

#include "..\..\INCLUDE\mz.hpp"
#include "..\..\INCLUDE\pe.hpp"
#include "..\..\INCLUDE\PGN2\pgn2.hpp"

#include "..\CRC32\fuck_api.cpp"

#define align(x,y)      (((x)+(y)-1)&(~((y)-1)))

#define NEWBASE 0

MZ_HEADER* mz;
PE_HEADER* pe;
PE_OBJENTRY* oe;

DWORD rva2offs(DWORD offs)
{
  if (offs < oe[0].oe_virtrva) return offs;
  for (int i=0; i<pe->pe_numofobjects; i++)
    if (offs - oe[i].oe_virtrva < oe[i].oe_virtsize)
      return offs - oe[i].oe_virtrva + oe[i].oe_physoffs;
  assert(0);
  return 0;
}

void help()
{
  printf("syntax: PE2PGN infile.exe [outfile.pgn] [priority<N>] [/q]\n");
  exit(0);
}

void main(int argc, char* argv[])
{
  init_fuckapi();

  printf("PE2PGN  PE EXE/DLL to PLUGIN v2.00 convertor  (x) 2001\n");

  char *ifile="", *ofile="";
  for (int i=1; i<argc; i++)
  {
    if (argv[i][0]=='/')
    {
      if (!stricmp(argv[i],"/q")) OPT_Q=1; else
        help();
    }
    else
    if (!strncmpi(argv[i],"priority",8))
    {
      char*s = &argv[i][8];
      OPT_PRI = atoi(s);
    }
    else
    if (!*ifile) ifile=argv[i]; else
    if (!*ofile) ofile=argv[i]; else
      help();
  }
  if (!*ifile) help();
  if (!*ofile)
  {
    ofile = new char[1024];
    strcpy(ofile,ifile);
    if (ofile[strlen(ofile)-4]=='.') ofile[strlen(ofile)-4]=0;
    strcat(ofile,".pgn");
  }

  if (!OPT_Q)
  if (PGN2_FUCKAPI)
  printf("þ PGN2_FUCKAPI detected\n");

  if (!OPT_Q)
  printf("þ reading %s\n", ifile);

  FILE*f=fopen(ifile,"rb");
  assert(f);
  DWORD bufsize = filelength(fileno(f));
  BYTE* buf = new BYTE[ 1024+bufsize ];
  fread(buf, 1,bufsize, f);
  fclose(f);

  // check for valid PE file
  mz = (MZ_HEADER*)&buf[0];
  assert(mz->mz_id == 'MZ');
  pe = (PE_HEADER*)&buf[mz->mz_neptr];
  assert(pe->pe_id == 'PE\x00\x00');
  assert(pe->pe_ntheadersize == 0xE0);
//assert(((pe->pe_flags & 1) == 0) && (pe->pe_fixuprva * pe->pe_fixupsize != 0));

  if (!OPT_Q)
  printf("þ converting...\n");

  // strip MZ header
  DWORD disp = mz->mz_neptr;
  memcpy(buf, &buf[disp], bufsize-disp);
  bufsize -= disp;

  // fix PE object table
  pe = (PE_HEADER*)&buf[0];
  oe = (PE_OBJENTRY*)&buf[0xF8];
  for (int i=0; i<pe->pe_numofobjects; i++)
  {
    oe[i].oe_virtsize = align(oe[i].oe_virtsize, pe->pe_objectalign);
    oe[i].oe_physsize = align(oe[i].oe_physsize, pe->pe_filealign);
    oe[i].oe_physoffs -= disp;
  }

  // check if there are resources section and kill it
  for (int i=0; i<pe->pe_numofobjects; i++)
  {
    if (!stricmp(oe[i].oe_name,".rsrc"))
    {
      memcpy(&buf[ oe[i].oe_physoffs ],
             &buf[ oe[i].oe_physoffs+oe[i].oe_physsize ],
             bufsize-oe[i].oe_physoffs);
      bufsize -= oe[i].oe_physsize;
      for (int j=i+1; j<pe->pe_numofobjects; j++)
        oe[j].oe_physoffs -= oe[i].oe_physsize;
      memcpy(&oe[i], &oe[i+1], sizeof(PE_OBJENTRY)*(pe->pe_numofobjects-i));
      memset(&oe[pe->pe_numofobjects-1], 0, sizeof(PE_OBJENTRY));
      pe->pe_numofobjects--;
      pe->pe_resourcerva == 0;
      pe->pe_resourcesize == 0;
      break;
    }
  }

  // modify fixups (kill type0)
#define MAX_FIXUP_COUNT 65536
  DWORD* fixup_data  = new DWORD[ MAX_FIXUP_COUNT ];
  DWORD  fixup_count = 0;
  PE_FIXUP* fx = (PE_FIXUP*) &buf[ rva2offs(pe->pe_fixuprva) ];
  DWORD k = 0;
  while (k < pe->pe_fixupsize)
  {
    for (DWORD i = 0; i < (fx->fx_blocksize - 8) / 2; i++)
      if ((fx->fx_typeoffs[i] >> 12) == 3)
      {
        DWORD j = fx->fx_pagerva + (fx->fx_typeoffs[i] & 0x0FFF);
        assert(fixup_count < MAX_FIXUP_COUNT);
        fixup_data[fixup_count++] = j;
        *(DWORD*)&buf[ rva2offs(j) ] -= pe->pe_imagebase - NEWBASE;
      }
//    else printf("0=%08X\n", fx->fx_pagerva + (fx->fx_typeoffs[i] & 0x0FFF));
    k += fx->fx_blocksize;
    (DWORD)fx += fx->fx_blocksize;
  }
  DWORD xptr = rva2offs(pe->pe_fixuprva), o = 0, xbase;
  for (DWORD i=0; i<fixup_count; i++)
  {
    if (o == 0)
    {
c7:   xbase = fixup_data[i] & 0xFFFFF000;
      *(DWORD*)&buf[xptr+0] = xbase;
      o = 8;
    }
    if (fixup_data[i] - xbase > 0xFFF)
    {
      *(DWORD*)&buf[xptr+4] = o;
      xptr += o;
      goto c7;
    }
    *(WORD*)&buf[xptr+o] = (fixup_data[i] - xbase) | 0x3000;
    o += 2;
  }
  if (o != 0)
  {
    *(DWORD*)&buf[xptr+4] = o;
    xptr += o;
  }
  pe->pe_fixupsize = xptr - rva2offs(pe->pe_fixuprva);
  pe->pe_imagebase = NEWBASE;

  // zerofill insignificant PE header entries
  for (int i=0; i<pe->pe_numofobjects; i++)
  {
    memset(&oe[i].oe_name, 0x00, 8);
    memset(&oe[i].oe_reserved, 0x00, 12);
    oe[i].oe_objectflags = 0;
  }

  int t = pe->pe_numofobjects - 1;
  pe->pe_imagesize = oe[t].oe_virtrva + oe[t].oe_virtsize;

  pe->pe_cputype = 0;
  pe->pe_datetime = 0;
  pe->pe_coffptr = 0;
  pe->pe_coffsize = 0;
  pe->pe_ntheadersize = 0;
  pe->pe_flags = 0;
  pe->pe_magic = 0;
  pe->pe_linkmajor = 0;
  pe->pe_linkminor = 0;
  pe->pe_sizeofcode = 0;
  pe->pe_sizeofidata = 0;
  pe->pe_sizeofudata = 0;
  pe->pe_baseofcode = 0;
  pe->pe_baseofdata = 0;
  pe->pe_objectalign = 0;
  pe->pe_filealign = 0;
  pe->pe_osmajor = 0;
  pe->pe_osminor = 0;
  pe->pe_usermajor = 0;
  pe->pe_userminor = 0;
  pe->pe_subsysmajor = 0;
  pe->pe_subsysminor = 0;
  pe->pe_headersize = 0;
  pe->pe_checksum = 0;
  pe->pe_subsystem = 0;
  pe->pe_dllflags = 0;
  pe->pe_stackreserve = 0;
  pe->pe_stackcommit = 0;
  pe->pe_heapreserve = 0;
  pe->pe_heapcommit = 0;
  pe->pe_loaderflags = 0;
  pe->pe_numofrvaandsizes = 0;

  pe->pe_id = 'PGN2';
  pe->pe_pgnsubver = 1;
  pe->pe_priority = OPT_PRI;

  // process imports
  if (pe->pe_importrva)
  {
    PE_IMPORT* im = (PE_IMPORT*) &buf[ rva2offs(pe->pe_importrva) ];
    for (; im->im_name; (DWORD)im+=sizeof(PE_IMPORT))
    {
      char* s = &buf[ rva2offs(im->im_name) ];
      for (char*c=s; *c; c++) if ((*c>='a')&&(*c<='z')) *c&=~32;
      if (s[0]=='@')
        memcpy(strrchr(s,'.'),".PGN",5);  // was: .dll

      if (PGN2_FUCKAPI)
      if (s[0]=='@')
      {
        if (!OPT_Q)
        printf("  %s --> %s\n", s, fuck_api(s));
        strcpy(s, fuck_api(s));

        for (DWORD n=0; ;n++)
        {
          DWORD z = *(DWORD*)&buf[ rva2offs(im->im_lookup+n*4) ];
          if (z==0) break;
          *(WORD*)&buf[ rva2offs(z) ] = 0x0000;  // name hash
          char *q = &buf[ rva2offs(z)+2 ];
          if (!OPT_Q)
          printf("  %s --> %s\n", q, fuck_api(q));
          strcpy(q, fuck_api(q));
        }
      }
    }
  }

  // process exports
  if (pe->pe_exportrva)
  {
    PE_EXPORT* ex = (PE_EXPORT*) &buf[ rva2offs(pe->pe_exportrva) ];
    char* s = &buf[ rva2offs(ex->ex_namerva) ];
    for (char*c=s; *c; c++) if ((*c>='a')&&(*c<='z')) *c&=~32;
    strcpy(strchr(s,'.'),".PGN"); // replace .EXE with .PGN

    if (PGN2_FUCKAPI)
    {
      if (!OPT_Q)
      printf("  %s --> %s\n", s, fuck_api(s));
      strcpy(s, fuck_api(s));
      for (DWORD j=0; j<ex->ex_numofnamepointers; j++)
      {
        char*s = &buf[ rva2offs(*(DWORD*)&buf[ rva2offs(ex->ex_namepointersrva + j*4) ]) ];
        if (!OPT_Q)
        printf("  %s --> %s\n", s, fuck_api(s));
        strcpy(s, fuck_api(s));
      }
    }
  }

  if (!OPT_Q)
  printf("þ writing %s\n", ofile);

  f=fopen(ofile,"wb");
  assert(f);
  fwrite(buf, 1,bufsize, f);
  fclose(f);

}
