#ifndef __MISTFALL_HPP__
#define __MISTFALL_HPP__

#define DUMP_MSG

#include "ade32.hpp"            // ADE32 interface
#include "mz.hpp"               // MZ header
#include "pe.hpp"               // PE header

#define MISTFALL_VERSION        "1.99Beta"

// input file parameters
#define MF_PHYSFILE_MIN_SIZE    4096
#define MF_PHYSFILE_MAX_SIZE    16777216
#define MF_PE_MAXSECTIONS       8
#define MF_PE_MAXIMAGESIZE      16777216

// exit codes
#define MF_ERR_SUCCESS          0
#define MF_ERR_NOMEMORY         1
#define MF_ERR_CANTOPENFILE     2
#define MF_ERR_BADFILESIZE      3
#define MF_ERR_BADMZHDR         4
#define MF_ERR_BADPEHDR         5
#define MF_ERR_NOFIXUPS         6
#define MF_ERR_BADNSECT         7
#define MF_ERR_BADSECTNAME      8
#define MF_ERR_BADOVRSIZE       9
#define MF_ERR_BADIMAGESIZE     10
#define MF_ERR_BADOBJTABLE      11
#define MF_ERR_DISASM           12
#define MF_ERR_CANTEXPAND       13
#define MF_ERR_CANTCREATEFILE   14
#define MF_ERR_NOTASSEMBLED     15
#define MF_ERR_INTERNAL1        16
#define MF_ERR_INTERNAL2        17

// Disasm() flags
#define DF_STDSECT              0x00000001 // standard section names only
#define DF_CODEFIRST            0x00000002 // code in first section only
#define DF_TRY_DREF             0x00000004 // analyze data-references
#define DF_TRY_RELREF           0x00000008 // analyze relative references
#define DF_ENABLE_ERRDISASM     0x00000010 // quit on disasm-error

// list entry flags
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
#define FL_USER2          0x20000000    // --//--
#define FL_HEADER         0x40000000    // dataptr is in header, not xalloc()
#define FL_RES8           0x80000000    // high bit set, ==0x80000000

#pragma pack(push)
#pragma pack(1)

struct HOOY                             // list entry structure
{
  DWORD     flags;          // FL_xxx
  DWORD     oldrva;         // original RVA
  DWORD     newrva;         // unused while mutate()
  DWORD     newofs;         // unused while mutate()
  DWORD     datalen;        // data length (0 if no data)
  BYTE*     dataptr;        // ptr to data (NULL if no data)
  DWORD     arg1;           // used with FL_RVA, FL_FIXUP & FL_DELTA
  DWORD     arg2;           // used with FL_DELTA
  HOOY*     next;           // ptr to next entry or NULL (end of list)
}; // struct HOOY

#pragma pack(pop)

// main class

class CMistfall
{
  public:
  DWORD xmemsize;
  DWORD* ade32_table;         // } ADE32 flag table
  //
  DWORD i_phys_len;           // } input file, also PE/MZ/OE/overlay is here
  BYTE* i_phys_mem;           // }
  //
  DWORD o_phys_len;           // } resulting stuff, the whole file.
  BYTE* o_phys_mem;           // }
  //
  BYTE*        edit_header;   // } This used to edit MZ/PE/OE at once,
  MZ_HEADER*   edit_mz;       // } while mutate.
  PE_HEADER*   edit_pe;       // } I.e. now there is no need to search
  PE_OBJENTRY* edit_oe;       // } within list for PE/OE entries.
  MZ_HEADER* mz;       // }
  PE_HEADER* pe;       // } ptrs to i_phys_mem, edited ONCE when aligning
  PE_OBJENTRY* oe;     // } section sizes, then read-only
  DWORD ovr_offs;             // }
  DWORD ovr_size;             // } ptr to i_phys_mem
  BYTE* memb;          // }
  DWORD* flag;         // } used while Disasm()
  DWORD* arg1;         // }
  DWORD* arg2;         // }
  HOOY* root;                 // list root entry
  HOOY* tail;                 // used to faster list generation
  HOOY** fasthooy;     // used while Asm() to faster assembly
  //
  CMistfall();
  ~CMistfall();
  //
  // ---MAIN METHODS---
  int LoadFile(char* fname);  // 1. load file into memory
  int Disasm(DWORD dflags);   // 2. disassemble file into HOOY* list  DF_XXX
  int Asm();                  // 3. assemble file
  int SaveFile(char* fname);  // 4. save modified file to disk
  void DumpLog(char* logfile);// dump temporary stuff
  // other stuff
  void* xalloc(DWORD size);
  void xfree(void** ptr);
  void* xrealloc(void* ptr, DWORD size);
  DWORD disasm_opcode( BYTE* opcode, disasm_struct* ds );
  void process_import(DWORD addr);
  void process_rsrc(DWORD addr);
  void markrva(DWORD x);
  void markrvadata(DWORD x);
  void markfixup(DWORD x);
  void markdelta(DWORD x,DWORD y,DWORD z);
  HOOY* hooybyoldrva(DWORD oldrva, DWORD needflags);
  DWORD calc_pe_csum(BYTE* buf, DWORD size);
  void free_list();
  //
}; // class CMistfall

#endif // __MISTFALL_HPP__