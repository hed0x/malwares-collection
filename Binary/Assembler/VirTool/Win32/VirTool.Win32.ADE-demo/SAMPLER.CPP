
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <io.h>
#pragma hdrstop

#include "ADE32.HPP"

extern "C" void  __cdecl ade32_end   ();                      // not a subroutine!

void make_bin()
{
  FILE*f=fopen("ade32bin.asi","wb");
  assert(f);
  fprintf(f,"; ---------------------------------------------------------------------------\n");
  fprintf(f,"; ADE32   v2.02   (AUTO-GENERATED FILE)   (x) 1999-2002 http://z0mbie.cjb.net\n");
  fprintf(f,"; ---------------------------------------------------------------------------\n");
  fprintf(f,"ade32_size              equ     %i+%i+%i  ; == %i\n",
    (DWORD)&ade32_disasm - (DWORD)&ade32_init,
    (DWORD)&ade32_asm    - (DWORD)&ade32_disasm,
    (DWORD)&ade32_end    - (DWORD)&ade32_asm,
    (DWORD)&ade32_end    - (DWORD)&ade32_init);
  fprintf(f,"ade32_begin:\n");
  fprintf(f,"ade32_init:\n");
  for(DWORD j=0, i=(DWORD)&ade32_init; i<(DWORD)&ade32_disasm; i++,j++)
  {
    if ((j%8)==0) fprintf(f,"                db ");
    fprintf(f,"0%02Xh", *(BYTE*)i);
    if (((j%8)!=7)&&(i!=((DWORD)&ade32_disasm)-1)) fprintf(f,",");
    if (((j%8)==7)||(i==((DWORD)&ade32_disasm)-1)) fprintf(f,"\n");
  }
  fprintf(f,"ade32_disasm:\n");
  for(DWORD j=0, i=(DWORD)&ade32_disasm; i<(DWORD)&ade32_asm; i++,j++)
  {
    if ((j%8)==0) fprintf(f,"                db ");
    fprintf(f,"0%02Xh", *(BYTE*)i);
    if (((j%8)!=7)&&(i!=((DWORD)&ade32_asm)-1)) fprintf(f,",");
    if (((j%8)==7)||(i==((DWORD)&ade32_asm)-1)) fprintf(f,"\n");
  }
  fprintf(f,"ade32_asm:\n");
  for(DWORD j=0, i=(DWORD)&ade32_asm; i<(DWORD)&ade32_end; i++,j++)
  {
    if ((j%8)==0) fprintf(f,"                db ");
    fprintf(f,"0%02Xh", *(BYTE*)i);
    if (((j%8)!=7)&&(i!=((DWORD)&ade32_end)-1)) fprintf(f,",");
    if (((j%8)==7)||(i==((DWORD)&ade32_end)-1)) fprintf(f,"\n");
  }
  fprintf(f,"ade32_end:\n");
  fclose(f);
} // make_bin()

void main()
{
  make_bin();

  DWORD ade32_flagtable[512];
  ade32_init(ade32_flagtable);

  for(DWORD i=0x401000; ; )
  {
    disasm_struct s = {4,4};

    DWORD c = ade32_disasm((BYTE*)i, &s, ade32_flagtable);
    if (c==0)
    {
      printf("(0) %08X  %02X %02X %02X %02X ...\n", i,*(BYTE*)(i+0),*(BYTE*)(i+1),*(BYTE*)(i+2),*(BYTE*)(i+3));
      break;
    }

    assert(c==s.disasm_len);

    printf("(%i) %08X ",c,i);
    for(DWORD j=0; j<c; j++) printf(" %02X",*(BYTE*)(i+j));

    for(DWORD j=c; j<8; j++) printf("   ");
    printf("[");
    if (s.disasm_flag&C_BAD)     printf(" ***C_BAD***");
    if (s.disasm_flag&C_SEG)     printf(" C_SEG");
    if (s.disasm_flag&C_LOCK)    printf(" C_LOCK");
    if (s.disasm_flag&C_REP)     printf(" C_REP");
    if (s.disasm_flag&C_67)      printf(" C_67");
    if (s.disasm_flag&C_66)      printf(" C_66");
    if (s.disasm_flag&C_OPCODE2) printf(" C_OPCODE2");
    if (s.disasm_flag&C_MODRM)   printf(" C_MODRM");
    if (s.disasm_flag&C_SIB)     printf(" C_SIB");
    if (s.disasm_flag&C_ADDR1)   printf(" C_ADDR1");
    if (s.disasm_flag&C_ADDR2)   printf(" C_ADDR2");
    if (s.disasm_flag&C_ADDR4)   printf(" C_ADDR4");
    if (s.disasm_flag&C_ADDR67)  printf(" C_ADDR67");
    if (s.disasm_flag&C_DATA1)   printf(" C_DATA1");
    if (s.disasm_flag&C_DATA2)   printf(" C_DATA2");
    if (s.disasm_flag&C_DATA4)   printf(" C_DATA4");
    if (s.disasm_flag&C_DATA66)  printf(" C_DATA66");
    if (s.disasm_flag&C_REL)     printf(" C_REL");
    if (s.disasm_flag&C_STOP)    printf(" C_STOP");
    printf(" ]\n");

    BYTE fuck[64]={0};
    DWORD f = ade32_asm(fuck, &s);

    if ( (f!=c)||( memcmp(fuck,(BYTE*)i,c)!=0 ) )
    {
      printf("(%i) %08X ",f,i);
      for(DWORD j=0; j<f; j++) printf(" %02X",fuck[j]);
      printf("  ; fuck[]\n");
      printf("flag=%08X\n", s.disasm_flag);
      exit(0);
    }

    i += c;
  }

}//main
