
#include <stdio.h>

typedef unsigned long DWORD;
typedef unsigned char BYTE;
typedef int           BOOL;

#include "table.c"

void disasm(BYTE* iptr0, DWORD* osizeptr)
{
  BYTE* iptr = iptr0;

  DWORD f = 0;

prefix:
  BYTE b = *iptr++;

  f |= table_1[b];

  if (f&C_FUCKINGTEST)
    if (((*iptr)&0x38)==0x00)   // ttt
      f=C_MODRM+C_DATAW0;       // TEST
    else
      f=C_MODRM;                // NOT,NEG,MUL,IMUL,DIV,IDIV

  if (f&C_TABLE_0F)
  {
    b = *iptr++;
    f = table_0F[b];
  }

  if (f==C_ERROR)
  {
    printf("error in %02X\n",b);
    *osizeptr=C_ERROR;
    return;
  }

  if (f&C_PREFIX)
  {
    f&=~C_PREFIX;
    goto prefix;
  }

  if (f&C_DATAW0) if (b&0x01) f|=C_DATA66; else f|=C_DATA1;

  if (f&C_MODRM)
  {
    b = *iptr++;
    BYTE mod = b & 0xC0;
    BYTE rm  = b & 0x07;
    if (mod!=0xC0)
    {
      if (f&C_67)         // modrm16
      {
        if ((mod==0x00)&&(rm==0x06)) f|=C_MEM2;
        if (mod==0x40) f|=C_MEM1;
        if (mod==0x80) f|=C_MEM2;
      }
      else                // modrm32
      {
        if (mod==0x40) f|=C_MEM1;
        if (mod==0x80) f|=C_MEM4;
        if (rm==0x04) rm = (*iptr++) & 0x07;    // rm<-sib.base
        if ((rm==0x05)&&(mod==0x00)) f|=C_MEM4;
      }
    }
  } // C_MODRM

  if (f&C_MEM67)  if (f&C_67) f|=C_MEM2;  else f|=C_MEM4;
  if (f&C_DATA66) if (f&C_66) f|=C_DATA2; else f|=C_DATA4;

  if (f&C_MEM1)  iptr++;
  if (f&C_MEM2)  iptr+=2;
  if (f&C_MEM4)  iptr+=4;

  if (f&C_DATA1) iptr++;
  if (f&C_DATA2) iptr+=2;
  if (f&C_DATA4) iptr+=4;

  *osizeptr = iptr - iptr0;
}


void main()
{
  BYTE* o;
  DWORD s;
  for ((DWORD)o=0xBFF71000, s=0; s!=C_ERROR; )
  {
    disasm(o, &s);
    printf("%08X ",o);
    for (DWORD i=0; i<(s&15); i++, o++)
      printf(" %02X",*o);
    printf("\n");
  }
}
