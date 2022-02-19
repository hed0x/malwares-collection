
// to compile:
// unix:  g++ infelf.cpp
// win32: bcc32 infelf.cpp

#include <stdio.h>
#include <stdlib.h>
#include <memory.h>
#include <string.h>
#include <sys/stat.h>
#pragma hdrstop

typedef unsigned char  BYTE;
typedef unsigned short WORD;
typedef unsigned long  DWORD;
typedef int            BOOL;
#define FALSE          0
#define TRUE           1
#define IN
#define OUT

#include "engine.cpp"           // ELF infection engine

#define error(x,y)    { printf(x, y); exit(1); }

void help()
{
  printf("syntax:\n");
  printf("  INFELF [option(s)] infile\n");
  printf("disasm options:\n");
  printf("  -relref-            dont search for relative references\n");
  printf("  -jmptab-            dont search for jmp tables\n");
  printf("  -func-              dont search for push ebp/mov ebp, esp\n");
  printf("  -sym-               dont process symbols\n");
  printf("  -got-               dont process .got section\n");
  printf("inject options:\n");
  printf("  -snippet infile     inject code snippet (see readme)\n");
  printf("  -hookaddr <offset|.va>  hook at specified address, or\n");
  printf("  -hookentry          hook at entrypoint, or\n");
  printf("  -hookfunc Func      hook Func() (if present in symbols), or\n");
  printf("  -hooksign B81234... hook by hex signature\n");
  printf("  -nop-               dont remove NOP's in the snippet\n");
  printf("  -bf                 1st fill bigger islands\n");
  printf("output:\n");
  printf("  -dump               debug printf while disasm\n");
  printf("  -outmap mapfile     disasm result: replace processed code with $\n");
  printf("  -outtext textfile   write result into textfile\n");
  printf("  -out outfile        write result into outfile\n");
  exit(0);
}

int main(int argc, char* argv[])
{
  printf("INFELF v1.02 -- Code Snippet Island Injector for ELF files -- (x) 2002 Z0MBiE\n");

  if ( ( sizeof(Elf32_Dyn ) !=  8 ) ||
       ( sizeof(Elf32_Rel ) !=  8 ) ||
       ( sizeof(Elf32_Rela) != 12 ) ||
       ( sizeof(Elf32_Sym ) != 16 ) ||
       ( sizeof(Elf32_Ehdr) != 52 ) ||
       ( sizeof(Elf32_Phdr) != 32 ) ||
       ( sizeof(Elf32_Shdr) != 40 ) ||
       ( sizeof(Elf32_Nhdr) != 12 ) )
  {
    printf("compilation error: structure alignment must be 1\n");
    exit(1);
  }

  char* infile = NULL;
  char* outfile = NULL;
  char* snippet = NULL;
  char* map = NULL;
  char* text = NULL;
  DWORD df_flags = DF_RELREF | DF_JMPTAB | DF_FUNC | DF_SYM | DF_GOT;
  DWORD in_flags = IN_KILLNOP;
  DWORD hook_offs = NONE;
  int hook_isva = 0;
  int hook_isentry = 0;
  char* hook_func = 0;
  char* hook_sign = 0;

  // process commandline

  for(int i=1; i<argc; i++)
  {
    if (!strcmp(argv[i], "-dump"   )) OPT_DUMP++; else
    if (!strcmp(argv[i], "-relref-")) df_flags &= ~DF_RELREF; else
    if (!strcmp(argv[i], "-jmptab-")) df_flags &= ~DF_JMPTAB; else
    if (!strcmp(argv[i], "-func-"  )) df_flags &= ~DF_FUNC;   else
    if (!strcmp(argv[i], "-sym-"   )) df_flags &= ~DF_SYM;    else
    if (!strcmp(argv[i], "-got-"   )) df_flags &= ~DF_GOT;    else
    if (!strcmp(argv[i], "-nop-"   )) in_flags &= ~IN_KILLNOP; else
    if (!strcmp(argv[i], "-bf"     )) in_flags |= IN_BIGFIRST; else
    if ((!strcmp(argv[i], "-outmap" ))&&(i+1<argc)) map     = argv[++i]; else
    if ((!strcmp(argv[i], "-outtext"))&&(i+1<argc)) text    = argv[++i]; else
    if ((!strcmp(argv[i], "-out"    ))&&(i+1<argc)) outfile = argv[++i]; else
    if ((!strcmp(argv[i], "-snippet"))&&(i+1<argc)) snippet = argv[++i]; else
    if ((!strcmp(argv[i], "-hookaddr"))&&(i+1<argc))
    {
      i++;
      hook_isva = argv[i][0]=='.';
      sscanf(&argv[i][hook_isva], "%X", &hook_offs);
    } else
    if (!strcmp(argv[i], "-hookentry")) hook_isentry++; else
    if ((!strcmp(argv[i], "-hookfunc"))&&(i+1<argc)) hook_func = argv[++i]; else
    if ((!strcmp(argv[i], "-hooksign"))&&(i+1<argc)) hook_sign = argv[++i]; else
      if (infile == 0)
        infile = argv[i];
      else
        help();
  }
  if (infile == NULL) help();

  // go

  CElfHlp* X = new CElfHlp;
  if (X == NULL)
    error("ERROR: no memory\n", 0);

  printf("+ reading source %s\n", infile);

  if (X->Load(infile) != ERR_SUCCESS)
    error("ERROR: Load() = %s\n", ElfErr[X->result]);

  printf("+ disassembling\n");

  if (X->DisasmELF( df_flags ) != ERR_SUCCESS)
    error("ERROR: DisasmELF() = %s\n", ElfErr[X->result]);

  if (map != 0)
  {
    printf("+ writing map %s\n", map);

    if (X->Save(map, FL_CODE, '$', -1) != ERR_SUCCESS)
      error("ERROR: Save() = %s\n", ElfErr[X->result]);
  }

  printf("+ analyzing\n");

  if (X->Analyze() != ERR_SUCCESS)
    error("ERROR: Analyze() = %s\n", ElfErr[X->result]);

  if (snippet != 0)
  {
    if (hook_isva)    hook_offs = X->va2offs(hook_offs);
    if (hook_isentry) hook_offs = X->GetEntryOffs();
    if (hook_func)    hook_offs = X->GetFuncOffs(hook_func);
    if (hook_sign)
    {
      DWORD b_len  = strlen(hook_sign) / 2;
      BYTE* b_sign = new BYTE[ b_len+1 ];
      for(DWORD t=0; t<b_len; t++)
        sscanf(&hook_sign[t*2], "%02X", &b_sign[t]);
      for(DWORD t=0; t<X->len-b_len; t++)
        if (memcmp(&X->buf[t], b_sign, b_len)==0)
        {
          hook_offs = t;
          break;
        }
    }
    if (hook_offs == NONE)
      error("ERROR: invalid or not specified hook offset\n", 0);

    CElfHlp* S = new CElfHlp;
    if (S == NULL)
      error("ERROR: no memory\n", 0);

    printf("+ reading code snippet %s\n", snippet);

    if (S->Load(snippet) != ERR_SUCCESS)
      error("ERROR: Load() = %s\n", ElfErr[S->result]);

    printf("+ injecting (at offset %08X)\n", hook_offs);

    if (X->Inject(S, hook_offs, in_flags) != ERR_SUCCESS)
      error("ERROR: Inject() = %s\n", ElfErr[X->result]);

    delete S;
  }

  if (outfile != 0)
  {
    printf("+ writing destination %s\n", outfile);

    if (X->Save(outfile, 0,0,0) != ERR_SUCCESS)
      error("ERROR: Save() = %s\n", ElfErr[X->result]);

#ifndef __WIN32__
    struct stat st;
    stat(outfile, &st);
    chmod(outfile, st.st_mode | 0111);  // +x
#endif
  }

  if (text != 0)
  {
    printf("+ writing text %s\n", text);

    if (X->SaveText(text) != ERR_SUCCESS)
      error("ERROR: SaveText() = %s\n", ElfErr[X->result]);
  }

  delete X;

  printf("OK\n");

}//main
