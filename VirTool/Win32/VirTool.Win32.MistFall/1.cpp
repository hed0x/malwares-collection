#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <io.h>
#pragma hdrstop

#include "mistfall.hpp"
#include "mistfall.cpp"

int InsertNop(CMistfall* M)
{
  for (HOOY* h=M->root; h; h=h->next)
  if (h->flags & (FL_OPCODE|FL_FIXUP))
  if (h->next->flags & FL_OPCODE)
  if (h->dataptr[0] != 0x90)
  {
    HOOY* z = (HOOY*) M->xalloc( sizeof(HOOY) );
    if (z==NULL) return 0;
    z->flags = FL_OPCODE | FL_CODE | FL_PRESENT | FL_VPRESENT;
    z->datalen = 1;
    z->dataptr = (BYTE*) M->xalloc(z->datalen);
    if (z->dataptr==NULL) return 0;
    z->dataptr[0] = 0x90;
    z->next = h->next;
    h->next = z;
  }
  return 1;
} // InsertNop()

int PervertFile(char* ifile,
                char* ofile)
{
  try
  {
    CMistfall M1;

    int res = M1.LoadFile(ifile);
    if (res != MF_ERR_SUCCESS)
    {
      printf("CMistfall::LoadFile() error %i\n", res);
      return 0;
    }

    res = M1.Disasm(DF_STDSECT    |
                    DF_CODEFIRST  |
                    DF_TRY_DREF   |
                    DF_TRY_RELREF |
                    DF_ENABLE_ERRDISASM);
    if (res != MF_ERR_SUCCESS)
    {
      printf("CMistfall::Disasm() error %i\n", res);
      return 0;
    }

    M1.DumpLog("mistfall1.log");

    if (InsertNop(&M1) == 0)
    {
      printf("Mutate error\n");
      return 0;
    }
    M1.edit_pe->pe_linkminor = 'Z';

    res = M1.Asm();
    if (res != MF_ERR_SUCCESS)
    {
      printf("CMistfall::Asm() error %i\n", res);
      return 0;
    }

    M1.DumpLog("mistfall2.log");

    res = M1.SaveFile(ofile);
    if (res != MF_ERR_SUCCESS)
    {
      printf("CMistfall::SaveFile() error %i\n", res);
      return 0;
    }

    printf("PervertFile() OK\n");

    return 1;
  }
  __except(1)
  {
    printf("GPF :-(\n");
    return 0;
  }
} // PervertFile()

void main(int argc, char* argv[])
{
  printf("Mistfall %s -- DEMO\n", MISTFALL_VERSION);

  if (argc!=3)
  {
    printf("syntax: %s infile outfile\n", argv[0]);
    return;
  }

  PervertFile(argv[1], argv[2]);

} // main()