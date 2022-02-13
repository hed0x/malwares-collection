
#ifndef __KME_HPP__
#define __KME_HPP__

#pragma pack(push)
#pragma pack(1)

#define KME_FLAG_DEBUG              0x00000001 // insert INT3 into poly decr
#define KME_FLAG_NOLOGIC            0x00000002 // disable "logic"
#define KME_FLAG_NOJMPS             0x00000004 // disable JMPs.
// NOJMPS means generate continuous block of code
#define KME_FLAG_EIP0               0x00000008 // initial entry = 0, not rnd
#define KME_FLAG_NOSHORT            0x00000010 // disable short-opcodes for EAX
// v3.00+
#define KME_FLAG_NOSHORT_C          0x00000020 // disable short-consts usage
#define KME_FLAG_NOSWAP             0x00000040 // disable [cmd r1,r2] perverting
// v4.00+
#define KME_FLAG_ONLY386            0x00000080 // only .386 opcodes
#define KME_FLAG_X_CALLESP          0x00000100 // call esp; add esp, <N>
#define KME_FLAG_X_RETBYJMP         0x00000200 // JMP OrigEntry; otherwise RETN
#define KME_FLAG_X_RET0C            0x00000400 // MOV EAX,1/RETN 0Ch instead of RETN

// --------------------- registers -------------------------------------------

#define KME_REG_EAX                 0x00000001 // bitfields for register mask
#define KME_REG_ECX                 0x00000002 //
#define KME_REG_EDX                 0x00000004 // at least 1 register should
#define KME_REG_EBX                 0x00000008 // be specified.
#define KME_REG_ESP                 0x00000010 // use REG_DEFAULT otherwise
#define KME_REG_EBP                 0x00000020 //
#define KME_REG_ESI                 0x00000040 //
#define KME_REG_EDI                 0x00000080 //
#define KME_REG_ALL                 ((~KME_REG_ESP)&255)

#define KME_REG_DEFAULT             KME_REG_EAX

#define KME_REG_EAX_N               0
#define KME_REG_ECX_N               1
#define KME_REG_EDX_N               2
#define KME_REG_EBX_N               3
#define KME_REG_ESP_N               4
#define KME_REG_EBP_N               5
#define KME_REG_ESI_N               6
#define KME_REG_EDI_N               7

// --------------------- commands --------------------------------------------

#define KME_CMD_ALL                 -1              // use all available commands

#define KME_CMD_MOV                 0x00000001      // bitfields for command mask
#define KME_CMD_XCHG                0x00000002      //
#define KME_CMD_ADD                 0x00000004      // at least 1 command should
#define KME_CMD_SUB                 0x00000008      // be specified. default=XOR
#define KME_CMD_XOR                 0x00000010      //
#define KME_CMD_INC                 0x00000020      // all CMD_xxx commands can be
#define KME_CMD_DEC                 0x00000040      // disabled by FLAG_NOLOGIC
#define KME_CMD_OR                  0x00000080
#define KME_CMD_AND                 0x00000100
#define KME_CMD_SHL                 0x00000200
#define KME_CMD_SHR                 0x00000400
#define KME_CMD_ROL                 0x00000800
#define KME_CMD_ROR                 0x00001000
#define KME_CMD_SAR                 0x00002000
#define KME_CMD_NOT                 0x00004000
#define KME_CMD_NEG                 0x00008000
#define KME_CMD_IMUL_EX             0x00010000
#define KME_CMD_SHLD                0x00020000
#define KME_CMD_SHRD                0x00040000
#define KME_CMD_BTC                 0x00080000
#define KME_CMD_BTR                 0x00100000
#define KME_CMD_BTS                 0x00200000
#define KME_CMD_BSWAP               0x00400000
#define KME_CMD_XADD                0x00800000
#define KME_CMD_MOVSXZX             0x01000000      // mov?x
#define KME_CMD_BSR                 0x02000000
#define KME_CMD_BSF                 0x04000000
#define KME_CMD_MUL                 0x08000000
#define KME_CMD_IMUL                0x10000000
#define KME_CMD_DIV                 0x20000000
#define KME_CMD_IDIV                0x40000000
#define KME_CMD_PUSHPOP             0x80000000      // used when initializing regs
//
#define KME_CMD_OLDSTUFF            0x00FFFFFF      // 1.00
#define KME_CMD_NEWSTUFF            0xFF000000      // 2.00+

#define KME_CMD2_ALL                -1

#define KME_CMD2_PUSHPOPR           0x00000001      // push r; polycmd; pop r
#define KME_CMD2_PUSHPOPC           0x00000002      // push c; polycmd; pop r
#define KME_CMD2_IFOLLOW            0x00000004      // cmp r, c; jxx
#define KME_CMD2_INOFOLLOW          0x00000008      // cmp r, c; jxx fake
#define KME_CMD2_RFOLLOW            0x00000010      // cmp r, r; jxx
#define KME_CMD2_RNOFOLLOW          0x00000020      // cmp r, r; jxx fake
#define KME_CMD2_JXX                0x00000014
#define KME_CMD2_JXX_FAKE           0x00000028
#define KME_CMD2_SUBROUTINE         0x00000040      // 8-()
#define KME_CMD2_CYCLE              0x00000080      // |->
#define KME_CMD2_FPU                0x00000100      // X-)

// --------------------- engine interface ------------------------------------

// returns: 1 if all OK, 0 if error

int __cdecl kme_engine(
      DWORD  regsave,          // push/pop regs at prolog/epilog, set of KME_REG_XXX
      DWORD  original_rva,     // original entry RVA
      DWORD  vir_rva,          // virus in-file RVA
      DWORD* exitregptr,       // 0 or pointer to 8 dwords
      DWORD* initregptr,       // 0 or pointer to 8 dwords
      BYTE*  i_offs,           // virus offset
      DWORD  i_size,           // virus size
      DWORD  i_entry,          // virus entry (relative)
      BYTE*  o_offs,           // output offset
      DWORD  o_max,            // output max buf size
      DWORD  o_fillchar,       // character to fill out buf
      DWORD* po_size,          // 0 or pointer to out buf size
      DWORD* po_entry,         // 0 or pointer to out entry (rel.)
      DWORD  jmp_prob,         // JMPs if rnd(jmp_prob)==0
      DWORD  regavail,         // register set (KME_REG_XXX)
      DWORD  cmdavail2,        // adv. command set (KME_CMD2_XXX)
      DWORD  cmdavail,         // command set (KME_CMD_XXX)
      DWORD  flags             // flags (KME_FLAG_XXX)
     );

#pragma pack(pop)

#endif // __KME_HPP__

