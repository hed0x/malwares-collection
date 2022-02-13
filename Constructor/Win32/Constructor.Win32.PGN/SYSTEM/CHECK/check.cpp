
#include <windows.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <io.h>
#include <dir.h>
#include <dos.h>

#pragma hdrstop

#include "..\..\INCLUDE\PGN2\pgn2.hpp"
#include "..\..\INCLUDE\mz.hpp"
#include "..\..\INCLUDE\pe.hpp"

#include "..\CRC32\fuck_api.cpp"

extern "C"
void __cdecl decompress(BYTE* ibuf, BYTE* obuf);

#define MAX_PLUGIN 8192

int errcode=0;

int fcount=0, fsize=0, usize=0, vsize=0;

char* fname[MAX_PLUGIN];
char* pname[MAX_PLUGIN];
char* aname[MAX_PLUGIN];
list_entry *list[MAX_PLUGIN];

#define MAX_IMPORT 16384
int imp_count=0;
char* import_func[MAX_IMPORT];
int   import_xref[MAX_IMPORT];
#define MAX_EXPORT 16384
int exp_count=0;
char* export_func[MAX_IMPORT];
int   export_xref[MAX_IMPORT];

void process_file(char* fname0)
{
  struct ffblk ff;
  int err=findfirst(fname0, &ff, FA_ARCH|FA_DIREC|FA_RDONLY|FA_HIDDEN|FA_SYSTEM);
  if (err)
  {
    printf("þ ERROR: file not found: %s\n", fname0);
    exit(0);
  }
  if ( !strrchr(fname0,'.') || stricmp(strrchr(fname0,'.'),".pgn") ) return;
  assert( fcount < MAX_PLUGIN );
  fname[fcount] = strdup(fname0);
  fsize+=ff.ff_fsize;
  char _name[512],_ext[512];
  fnsplit(fname0, 0,0, _name,_ext);
  strcat(_name,_ext);
  pname[fcount] = strdup(_name);
  for (char*c=pname[fcount]; *c; c++) if ((*c>='a')&&(*c<='z')) *c&=~32;
  if (PGN2_FUCKAPI)
    aname[fcount] = strdup( fuck_api(pname[fcount]) );
  else
    aname[fcount] = strdup( pname[fcount] );
  fcount++;
}

void recsearch(const char* path0)
{
  char path[512];
  strcpy(path, path0);
  if (path[strlen(path)-1] != '\\') strcat(path, "\\");
  char *c = strchr(path, 0);
  strcpy(c, "*.*");
  struct ffblk ff;
  for (int done=findfirst(path, &ff, FA_ARCH|FA_DIREC|FA_RDONLY|FA_HIDDEN|FA_SYSTEM);
       !done;
       done=findnext(&ff))
  {
    strcpy(c, ff.ff_name);
    if (ff.ff_attrib & FA_DIREC)
      if (ff.ff_name[0] != '.')
        recsearch(path);
      else
        ;
    else
      process_file(path);
  }//for
}//recsearch

void main(int argc, char* argv[])
{
  init_fuckapi();

  printf("PLUGIN CHECK UTILITY (x) 2001\n\n");

  if (argc!=2)
  {
    printf("syntax:\n");
    printf("  CHECK plugin_project_path || plugin_name.pgn\n");
    exit(0);
  }

//  printf("þ searching for .pgn's\n");

  int cmdtype = 0; // 0=path 1=pgn
  if (strrchr(argv[1],'.'))
  if (!stricmp(strrchr(argv[1],'.'), ".pgn"))
    cmdtype = 1;

  if (cmdtype==0)
    recsearch(argv[1]);
  else
    process_file(argv[1]);

  if (fcount>1)
  {
    printf("  %8i plugins\n", fcount);
    printf("  %8i bytes\n", fsize);
  }

  if (fcount==0)
  {
    printf("þ ERROR: no plugins, exiting\n");
    exit(0);
  }

  for (int i=0; i<fcount; i++)
  for (int j=i+1; j<fcount; j++)
    if (!stricmp(pname[i],pname[j]))
    {
      printf("þ ERROR: duplicated plugins:\n");
      printf("    %s\n", fname[i]);
      printf("    %s\n", fname[j]);
      exit(0);
    }

//  printf("þ reading & unpacking\n");

  for (int i=0; i<fcount; i++)
  {

    FILE*f=fopen(fname[i],"rb");
    if (!f)
    {
      printf("þ ERROR: cant open file %s\n", fname[i]);
      exit(0);
    }
    DWORD isize = filelength(fileno(f));
    BYTE* ibuf = new BYTE[ isize+1 ];
    assert( fread(ibuf, 1,isize, f) == isize );
    fclose(f);

    DWORD osize = *(DWORD*)&ibuf[8+ 4];
    assert(osize <= 262144);
    BYTE* obuf = new BYTE[ osize+1 ];

    decompress(&ibuf[8], obuf);

    PE_HEADER*pe = (PE_HEADER*) obuf;
    PE_OBJENTRY*oe = (PE_OBJENTRY*) &obuf[ 0xF8 ];
    BYTE* xbuf = new BYTE[ pe->pe_imagesize+1 ];

    memcpy(xbuf, obuf, oe[0].oe_physoffs);
    for (int j=0; j<pe->pe_numofobjects; j++)
      memcpy(&xbuf[ oe[j].oe_virtrva ],
             &obuf[ oe[j].oe_physoffs ],
             oe[j].oe_physsize);

    list[i] = new list_entry;
    list[i]->list_phys = (pgn2_header*) ibuf;
    list[i]->list_virt = xbuf;

    usize += osize;
    vsize += pe->pe_imagesize;

    delete obuf;
  }

  if (fcount>1)
  {
    printf("  %8i bytes decompressed\n", usize);
    printf("  %8i bytes total virtual size\n", vsize);
  }

//  printf("þ analyzing\n");

  for (int i=0; i<fcount; i++)
  {
    BYTE* buf = list[i]->list_virt;
    PE_HEADER* pe = (PE_HEADER*) &buf[0];

    if (fcount==1)
    {
      printf("\n");
      printf("plugin   : %s\n", pname[i] );
      if (PGN2_FUCKAPI)
      printf("fucked   : %s\n", aname[i] );
      char q[512];
      strcpy(q, pname[i]);
      *strchr(q,'.') = 0;
      for (char*c=q; *c; c++) if ((*c>='A')&&(*c<='Z')) *c|=32;
      printf("crc32    : %08X         ; crc32('%s')\n", list[i]->list_phys->pgn2_id, q );
      assert( list[i]->list_phys->pgn2_id == crc32(q) );
      printf("version  : %i\n",   list[i]->list_phys->pgn2_version );
      printf("priority : %i\n", pe->pe_priority );
      printf("comp     : %-8i         ; %08X\n", list[i]->list_phys->pgn2_compressed   ,list[i]->list_phys->pgn2_compressed   );
      printf("decomp   : %-8i         ; %08X\n", list[i]->list_phys->pgn2_decompressed ,list[i]->list_phys->pgn2_decompressed );
      printf("virtual  : %-8i         ; %08X\n", pe->pe_imagesize                      ,pe->pe_imagesize                      );
    }

    for (int j=i+1; j<fcount; j++)
      if (list[i]->list_phys->pgn2_id ==
          list[j]->list_phys->pgn2_id)
      {
        printf("þ ERROR in %s / %s: duplicated crc32\n", fname[i], fname[j]);
        exit(0);
      }

    for (int pass=0; pass<2; pass++)
    {
      PE_IMPORT* im = (PE_IMPORT*) &buf[ pe->pe_importrva ];

      if (fcount==1)
      {
        if (pass==0) printf("imports (from .DLL's)\n");
        if (pass==1) printf("imports (interplugin)\n");
      }

      if (pe->pe_importrva)
      {

        for (; im->im_name; (DWORD)im+=sizeof(PE_IMPORT))
        {
          char* s = &buf[ im->im_name ];
          if (!PGN2_FUCKAPI)
          if (s[0]=='@')
          if ( (strrchr(s,'.')==0) || stricmp(strrchr(s,'.'),".pgn") )
          {
            printf("þ ERROR in %s: invalid import library name, %s\n", fname[i], s);
            exit(0);
          }
          if (  ((pass==0)&&(s[0]!='@'))  ||
                ((pass==1)&&(s[0]=='@'))    )
          {
            if (s[0]!='@')
            {
              char t[1024];
              GetSystemDirectoryA(t,sizeof(t));
              strcat(t,"\\");
              strcat(t,s);
              if (GetFileAttributes(t)==0xFFFFFFFF)
              {
                printf("þ ERROR in %s: import library not found: %s\n", fname[i], t);
                exit(0);
              }
            }
            for (DWORD n=0; ;n++)
            {
              DWORD z = *(DWORD*)&buf[ im->im_lookup+n*4 ];
              if (z==0) break;
              char*q = &buf[ z+2 ];
              char t[1024];
              sprintf(t, "%s@%s", s+pass,q);    // skip '@' if pass==1
              if (fcount==1)
                printf("  %s\n", t);
              if (pass==1) // @-prefixed, interplugin
              {
                assert( imp_count < MAX_IMPORT );
                import_xref[ imp_count   ] = i;
                import_func[ imp_count++ ] = strdup(t);
              }
            }
          }
        }//for im
      }//if pe_importrva
    }//pass

    if (fcount==1)
      printf("exports\n");

    PE_EXPORT* ex = (PE_EXPORT*) &buf[ pe->pe_exportrva ];
    if (pe->pe_exportrva)
    {
      char* dllname = (char*)&buf[ ex->ex_namerva ];
      if (!PGN2_FUCKAPI)
      if (stricmp(dllname, aname[i]))
      {
        printf("þ ERROR in %s: export dllname doesnt match, %s\n", fname[i], dllname);
        exit(0);
      }
      if ( ex->ex_numoffunctions != ex->ex_numofnamepointers )
      {
        printf("þ ERROR in %s: ex_numoffunctions = %i, ex_numofnamepointers = %i\n",
          fname[i],
          ex->ex_numoffunctions,
          ex->ex_numofnamepointers);
        exit(0);
      }

      for (DWORD j=0; j<ex->ex_numofnamepointers; j++)
      {
        char*s = &buf[ *(DWORD*)&buf[ex->ex_namepointersrva + j*4] ];
        char t[1024];
        sprintf(t, "%s@%s", dllname, s);
        if (fcount==1)
          printf("  %s\n", t);
        assert( exp_count < MAX_EXPORT );
        export_xref[ exp_count   ] = i;
        export_func[ exp_count++ ] = strdup(t);
      }
    }

  }//for i

  if (fcount>1)
  {

    printf("\n\n");
    printf("unresolved imports:\n");

    // imports
    for (int i=0; i<imp_count; i++)
    {
      for (int j=0; j<exp_count; j++)
        if (!stricmp(import_func[i], export_func[j]))
          goto c1;
      printf("  %s: %s\n", aname[import_xref[i]], import_func[i]);
      errcode++;
c1:
    }

    printf("\n\n");
    printf("unused exports:\n");

    for (int i=0; i<exp_count; i++)
    {
      for (int j=0; j<imp_count; j++)
        if (!stricmp(export_func[i], import_func[j]))
          goto c2;
      char*c = strchr(export_func[i], '@')+1;
      if (!stricmp(c, "unload"))      goto c2;
      if (!stricmp(c, "HandleEvent")) goto c2;
      if (!stricmp(c, fuck_api("unload")))      goto c2;
      if (!stricmp(c, fuck_api("HandleEvent"))) goto c2;
      printf("  %s\n", export_func[i]);
c2:
    }

  }//fcount>1

  printf("\n\n");
  printf("import dependencies:\n");

  for (int i=0; i<fcount; i++)
  {
    char z[512];
    strcpy(z, aname[i]);
    if (strchr(z,'.')) *strchr(z,'.')=0;
    char s0[512]="";
    for (int j=0; j<imp_count; j++)
      if (import_xref[j]==i)
      {
        char s[512];
        strcpy(s, import_func[j]);
        *strchr(s,'@') = 0;
        if (strchr(s,'.')) *strchr(s,'.') = 0;
        if (stricmp(s0,s))
        {
          if (s0[0])
            printf(", ");
          else
            printf("  %s --> ",z);
          printf("%s",s);
          strcpy(s0,s);
        }
      }
    if (s0[0])
    printf("\n");
  }// for i

  if (fcount>1)
  {

    printf("\n\n");
    printf("export dependencies:\n");

    for (int i=0; i<fcount; i++)
    {
      char z[512];
      strcpy(z, aname[i]);
      if (strchr(z,'.')) *strchr(z,'.')=0;
      char s0[512]="";
      for (int j=0; j<imp_count; j++)
      {
        char s[512];
        strcpy(s, import_func[j]);
        *strchr(s,'@') = 0;
        if (strchr(s,'.')) *strchr(s,'.') = 0;
        if (!stricmp(s,z))
        {
          strcpy(s, aname[ import_xref[j] ]);
          if (strchr(s,'.')) *strchr(s,'.') = 0;
          if (stricmp(s0,s))
          {
            if (s0[0])
              printf(", ");
            else
              printf("  %s <-- ",z);
            printf("%s",s);
            strcpy(s0,s);
          }
        }
      }
      if (s0[0])
      printf("\n");
    }//for i

  }//fcount > 1


  exit(errcode);
  
}//main
