
// ADE32 version 2.02c -- C edition

#include "ade32.hpp"
#include "ade32tbl.cpp"

int disasm(BYTE* opcode0, disasm_struct* diza)
{
  BYTE* opcode = opcode0;

  memset(diza, 0x00, sizeof(disasm_struct));
  diza->disasm_defdata = 4;
  diza->disasm_defaddr = 4;

  if (*(WORD*)opcode == 0x0000) return 0;
  if (*(WORD*)opcode == 0xFFFF) return 0;

  DWORD flag = 0;

repeat_prefix:

  BYTE c = *opcode++;

  DWORD t = ade32_table[ c ];

  if (t & C_ANYPREFIX)
  {

    if (flag & t) return 0;    // twice LOCK,SEG,REP,66,67

    flag |= t;

    if (t & C_67)
    {
      diza->disasm_defaddr ^= 2^4;
    }
    else
    if (t & C_66)
    {
      diza->disasm_defdata ^= 2^4;
    }
    else
    if (t & C_SEG)
    {
      diza->disasm_seg = c;
    }
    else
    if (t & C_REP)
    {
      diza->disasm_rep = c;
    }
    // LOCK

    goto repeat_prefix;

  } // C_ANYPREFIX

  flag |= t;

  diza->disasm_opcode = c;

  if (c == 0x0F)
  {
    c = *opcode++;

    diza->disasm_opcode2 = c;

    flag |= ade32_table[ 256 + c ]; // 2nd flagtable half

    if (flag == C_ERROR) return 0;
  }
  else
  if (c == 0xF7)
  {
    if (((*opcode) & 0x38)==0)
      flag |= C_DATA66;
  }
  else
  if (c == 0xF6)
  {
    if (((*opcode) & 0x38)==0)
      flag |= C_DATA1;
  }
  else
  if (c == 0xCD)
  {
    if (*opcode == 0x20)
      flag |= C_DATA4;
  }

  if (flag & C_MODRM)
  {
    c = *opcode++;

    diza->disasm_modrm = c;

    if ((c & 0x38) == 0x20)
    if (diza->disasm_opcode == 0xFF)
      flag |= C_STOP;

    BYTE mod = c & 0xC0;
    BYTE rm  = c & 0x07;

    if (mod != 0xC0)
    {
      if (diza->disasm_defaddr == 4)
      {
        if (rm == 4)
        {
          flag |= C_SIB;
          c = *opcode++;
          diza->disasm_sib = c;
          rm = c & 0x07;
        }

        if (mod == 0x40)
        {
          flag |= C_ADDR1;
        }
        else
        if (mod == 0x80)
        {
          flag |= C_ADDR4;
        }
        else
        {
          if (rm == 5)
            flag |= C_ADDR4;
        }
      }
      else // MODRM 16-bit
      {

        if (mod == 0x40)
        {
          flag |= C_ADDR1;
        }
        else
        if (mod == 0x80)
        {
          flag |= C_ADDR2;
        }
        else
        {
          if (rm == 6)
            flag |= C_ADDR2;
        }
      }
    }
  } // C_MODRM

  diza->disasm_flag = flag;

  DWORD a =  flag & (C_ADDR1 | C_ADDR2 | C_ADDR4);
  DWORD d = (flag & (C_DATA1 | C_DATA2 | C_DATA4)) >> 8;

  if (flag & C_ADDR67) a += diza->disasm_defaddr;
  if (flag & C_DATA66) d += diza->disasm_defdata;

  diza->disasm_addrsize = a;
  diza->disasm_datasize = d;

  for(DWORD i=0; i<a; i++)
    diza->disasm_addr_b[i] = *opcode++;

  for(DWORD i=0; i<d; i++)
    diza->disasm_data_b[i] = *opcode++;

  diza->disasm_len = opcode - opcode0;

  return diza->disasm_len;

} // disasm()
