// ADE32 v2.02

#ifndef __ADE32_HPP__
#define __ADE32_HPP__

#define C_ERROR   -1
#define C_ADDR1   0x00000001
#define C_ADDR2   0x00000002
#define C_ADDR4   0x00000004
#define C_LOCK    0x00000008
#define C_67      0x00000010
#define C_66      0x00000020
#define C_REP     0x00000040
#define C_SEG     0x00000080
#define C_ANYPREFIX  (C_66+C_67+C_LOCK+C_REP+C_SEG)
#define C_DATA1   0x00000100
#define C_DATA2   0x00000200
#define C_DATA4   0x00000400
#define C_SIB     0x00000800
#define C_ADDR67  0x00001000
#define C_DATA66  0x00002000
#define C_MODRM   0x00004000
#define C_BAD     0x00008000
#define C_OPCODE2 0x00010000
#define C_REL     0x00020000
#define C_STOP    0x00040000

#pragma pack(push)
#pragma pack(1)

struct disasm_struct
{
  BYTE  disasm_defaddr;
  BYTE  disasm_defdata;
  DWORD disasm_len;
  DWORD disasm_flag;
  DWORD disasm_addrsize;
  DWORD disasm_datasize;
  BYTE  disasm_rep;
  BYTE  disasm_seg;
  BYTE  disasm_opcode;
  BYTE  disasm_opcode2;
  BYTE  disasm_modrm;
  BYTE  disasm_sib;
  union
  {
  BYTE  disasm_addr_b[8];
  WORD  disasm_addr_w[4];
  DWORD disasm_addr_d[2];
  char  disasm_addr_c[8];
  short disasm_addr_s[4];
  long  disasm_addr_l[2];
  };
  union
  {
  BYTE  disasm_data_b[8];
  WORD  disasm_data_w[4];
  DWORD disasm_data_d[2];
  char  disasm_data_c[8];
  short disasm_data_s[4];
  long  disasm_data_l[2];
  };
};

#pragma pack(pop)

extern "C"
{
void  __cdecl ade32_init  (DWORD*);
DWORD __cdecl ade32_disasm(BYTE*, disasm_struct*, DWORD*);
DWORD __cdecl ade32_asm   (BYTE*, disasm_struct*);
}

#endif // __ADE32_HPP__