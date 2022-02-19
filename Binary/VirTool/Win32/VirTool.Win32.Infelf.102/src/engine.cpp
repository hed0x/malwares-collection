
// ELF "island" disassembling/infection engine

#define MIN(a,b)                ((a)<(b)?(a):(b))
#define MAX(a,b)                ((a)>(b)?(a):(b))

// globals

int OPT_DUMP = 0;               // debug printf

// ELF header

#include "elf.h"

typedef elf32_hdr  ELF32_HEADER, *PELF32_HEADER;
typedef Elf32_Shdr ELF32_SH, *PELF32_SH;
typedef Elf32_Sym  ELF32_SYM, *PELF32_SYM;
#define IS_SPECIAL_SHN(n)      ( ((n) == SHN_UNDEF) || ((n) >= SHN_LORESERVE) )

// disassembler

#include "ade32.cpp"

// error codes

#define ERR_SUCCESS             0
#define ERR_CANTOPENFILE        1
#define ERR_CANTCREATEFILE      2
#define ERR_CANTREADFILE        3
#define ERR_CANTWRITEFILE       4
#define ERR_NOMEMORY            5
#define ERR_BADFILEFORMAT       6
#define ERR_DISASM              7
#define ERR_NOSPACE             8
#define ERR_NOTSUPP             9
#define ERR_INTERNAL1           10
#define ERR_BADHOOKOFFS         11
#define ERR_NOTOPCODEATHOOK     12
#define ERR_NOORIGBYTESSIGN     13
#define ERR_JMPRETATHOOK        14
#define ERR_INTERNAL2           15
#define ERR_INTERNAL3           16
#define ERR_INTERNAL4           17
#define ERR_INTERNAL5           18
#define ERR_INTERNAL6           19
#define ERR_TOOSMALLFILE        20

char* ElfErr[] =
{
  "OK",
  "cant open input file",
  "cant create output file",
  "cant read file",
  "cant write file",
  "not enough memory",
  "bad file format",
  "error while disasm",
  "not enough free space in the target file",
  "snippet: loop/loopz/loopnz/jcxz are not supported yet",
  "internal error 1",
  "invalid hook offset",
  "not an opcode at hook offset",
  "no $ORIGINAL_BYTES$ signature within code snippet",
  "jmp/ret-alike opcode at hook offset",
  "internal error 2",
  "internal error 3",
  "internal error 4",
  "internal error 5",
  "internal error 6",
  "input file is too small"
};

// Disasm() flags

#define DF_JMPTAB               0x00000001      // find jmp tables
#define DF_RELREF               0x00000002      // find relative references
#define DF_FUNC                 0x00000004      // push ebp/mov ebp, esp
#define DF_SYM                  0x00000008      // process symbols
#define DF_GOT                  0x00000010      // process .got entries

// Inject() flags

#define IN_KILLNOP              0x00000001      // remove NOP's in the snippet
#define IN_BIGFIRST             0x00000002      // 1st try bigger islands

// internal flags & etc.

#define FL_LABEL                0x00000001      // label (i.e. has xref)
#define FL_OPCODE               0x00000002      // 1st opcode byte
#define FL_CODE                 0x00000004      // any opcode byte
#define FL_OPCODE_END           0x00000008
#define FL_EXEC                 0x00000010      // section attr: executable
#define FL_NEXT                 0x00000020      // marked for analysis
#define FL_ANALYZED             0x00000040      // analysed
#define FL_FREE_START           0x00001000      // start of free area
     // ^^^ associated arg1 = size of free area
#define FL_FREE                 0x00002000      // any byte of free area
#define FL_INJECTED_START       0x00004000      // start of injected area
     // ^^^ associated arg1 = 0-based offset within code snippet
#define FL_INJECTED             0x00008000      // any byte of injected area
#define FL_FIXREL               0x00010000      // rel to fix (temp flag)

#define NONE                    0xFFFFFFFF
#define OFFS_PLUS_REL(offs,rel) (va2offs(offs2va(offs)+rel))
#define MAX_ISLAND_LEN          1024

class CElfHlp
{
  public:

  int result;                   // here is stored ERR_xxx after any method call
  DWORD MaxIslandLen;           // default=15
  BYTE* buf;                    // target file itself
  DWORD len;                    // length
  DWORD* flag;                  // FL_xxx
  DWORD* arg1;                  // used in infection
  PELF32_HEADER hdr;            // ptr to ELF header at buf[0]

  CElfHlp();
  ~CElfHlp();
  void Empty();                 // free allocated buffers, zerofill variables

  int Load(char* infile);       // load file into memory, returns ERR_xxx
  int Save(char* outfile, DWORD fl, int c1, int c2);  // returns ERR_xxx
  int SaveText(char* outfile);
  int DisasmELF(DWORD df_flags);// disasm ELF file, returns ERR_xxx
  int DisasmSnippet();          // disasm code snippet, returns ERR_xxx
  int Analyze();                // search & mark function alignment
  int Inject(CElfHlp* S, DWORD hook_offs, DWORD in_flags);
  DWORD GetEntryOffs();         // get entrypoint offset
  DWORD GetFuncOffs(char* func);// get func() offset -- look into symbols

  DWORD offs2va(DWORD offs);    // returns VA or NONE
  DWORD va2offs(DWORD va);      // returns OFFSET or NONE
  PELF32_SH va2sh(DWORD va);    // returns PELF32_SH or NULL

}; // class CElfHlp

CElfHlp::CElfHlp()
{
  buf = NULL;
  flag = NULL;
  arg1 = NULL;
  Empty();
}//CElfHlp::CElfHlp

CElfHlp::~CElfHlp()
{
  Empty();
}//CElfHlp::~CElfHlp

void CElfHlp::Empty()
{
  if (buf != NULL) delete buf;
  if (flag != NULL) delete flag;
  if (arg1 != NULL) delete arg1;
  buf = NULL;
  len = 0;
  flag = NULL;
  hdr = NULL;
  MaxIslandLen = 15;
} // CElfHlp::Empty

// load file into memory

int CElfHlp::Load(char* infile)
{
  Empty();

  FILE*f = fopen(infile, "rb");
  if (f == NULL)
    return result = ERR_CANTOPENFILE;

  // alloc/init buffer(s)

  fseek(f, 0, SEEK_END);
  len = ftell(f);
  rewind(f);
  buf = new BYTE[ len+1 ];
  if (buf == NULL)
  {
    fclose(f);
    return result = ERR_NOMEMORY;
  }

  flag = new DWORD[ len+1 ];
  if (flag == NULL)
  {
    fclose(f);
    return result = ERR_NOMEMORY;
  }
  memset(flag, 0x00, (len+1)*4);

  if (fread(buf,1,len,f) != len)
  {
    fclose(f);
    return result = ERR_CANTREADFILE;
  }
  fclose(f);

  return result = ERR_SUCCESS;
} // CElfHlp::Load

// save file to disk
// fl == 0 -- normal mode
// fl == FL_xxx -- replace bytes marked with fl with c1, other with c2

int CElfHlp::Save(char* outfile, DWORD fl, int c1, int c2)
{
  BYTE* temp = buf;

  if (fl != 0)
  {
    temp = new BYTE[ len+1 ];
    if (temp == NULL)
      return result = ERR_NOMEMORY;

    for(DWORD i=0; i<len; i++)
    {
      if (flag[i] & fl)
        temp[i] = c1 == -1 ? buf[i] : c1;
      else
        temp[i] = c2 == -1 ? buf[i] : c2;
    }

  } // fl != 0

  FILE*f=fopen(outfile, "wb");
  if (f==NULL)
  {
    if (temp != buf)
      delete temp;
    return result = ERR_CANTCREATEFILE;
  }
  if (fwrite(temp,1,len,f)!=len)
  {
    fclose(f);
    if (temp != buf)
      delete temp;
    return result = ERR_CANTWRITEFILE;
  }
  fclose(f);

  if (temp != buf)
    delete temp;

  return result = ERR_SUCCESS;
} // CElfHlp::Save

// dump data/flags as text file

int CElfHlp::SaveText(char* outfile)
{
  FILE*f=fopen(outfile, "wb");
  if (f==NULL)
    return result = ERR_CANTCREATEFILE;
  for(DWORD i=0; i<len; )
  {
    if (flag[i] & FL_LABEL)
      fprintf(f, "[LABEL]\n");
    if (hdr == 0)
      fprintf(f, "%08X ", i);
    else
      fprintf(f, "%08X/.%08X ", i, offs2va(i));
    fprintf(f, "%s%s%s%s ",
      flag[i] & FL_EXEC     ? "E" : " ",
      flag[i] & FL_CODE     ? "C" : " ",
      flag[i] & (FL_INJECTED|FL_INJECTED_START) ? "I" : " ",
      flag[i] & (FL_FREE    |FL_FREE_START    ) ? "F" : " " );
    DWORD op_len = 1;
    if (flag[i] & FL_OPCODE)
      op_len = ade32_disasm(&buf[i], NULL);
    for(DWORD t=0; t<op_len; t++)
    {
      fprintf(f, " %02X", buf[i+t]);
      if (arg1 != 0)
      if (arg1[i+t] != 0)
        fprintf(f, "<%08X>", arg1[i+t]);
    }
    fprintf(f, "\n");
    i += op_len;
  }
  fprintf(f, "[EOF]\n");
  return result = ERR_SUCCESS;
} // CElfHlp::SaveText

DWORD CElfHlp::offs2va(DWORD offs)
{
  for(int i=0; i<hdr->e_shnum; i++)
  {
    PELF32_SH sh = (PELF32_SH) &buf[ hdr->e_shoff + i * hdr->e_shentsize ];
    if (sh->sh_offset != 0)
    if (sh->sh_addr   != 0)
    if ((offs >= sh->sh_offset) && (offs < sh->sh_offset + sh->sh_size))
      return offs - sh->sh_offset + sh->sh_addr;
  }
  return NONE;
}//CElfHlp::offs2va

DWORD CElfHlp::va2offs(DWORD va)
{
  PELF32_SH sh = va2sh(va);
  if ((sh == NULL) || (sh->sh_type == SHT_NOBITS))
    return NONE;
  else
    return va - sh->sh_addr + sh->sh_offset;
}//CElfHlp::va2offs

PELF32_SH CElfHlp::va2sh(DWORD va)
{
  for(int i=0; i<hdr->e_shnum; i++)
  {
    PELF32_SH sh = (PELF32_SH) &buf[ hdr->e_shoff + i * hdr->e_shentsize ];
    if (sh->sh_offset != 0)
    if (sh->sh_addr   != 0)
    if ((va >= sh->sh_addr) && (va < sh->sh_addr + sh->sh_size))
      return sh;
  }
  return NULL;
}//CElfHlp::va2sh

int CElfHlp::DisasmELF(DWORD df_flags)
{
  // check file format

  if (len < 1024)
    return result = ERR_TOOSMALLFILE;

  hdr = (PELF32_HEADER) buf;

  if ( (hdr->e_ident[EI_MAG0]    != 0x7F       ) ||
       (hdr->e_ident[EI_MAG1]    != 'E'        ) ||
       (hdr->e_ident[EI_MAG2]    != 'L'        ) ||
       (hdr->e_ident[EI_MAG3]    != 'F'        ) ||
       (hdr->e_ident[EI_CLASS]   != ELFCLASS32 ) ||
       (hdr->e_ident[EI_DATA]    != ELFDATA2LSB) ||
       (hdr->e_ident[EI_VERSION] != EV_CURRENT ) ||
       (hdr->e_type              != ET_EXEC    ) ||
       (hdr->e_machine           != EM_386     ) ||
       (hdr->e_version           != EV_CURRENT ) ||
       (hdr->e_flags             != 0          ) )
    return result = ERR_BADFILEFORMAT;

  // mark entry point

  if (hdr->e_entry != 0)
  {
    DWORD entry_offs = va2offs(hdr->e_entry);
    if (entry_offs < len)
      flag[entry_offs] |= FL_LABEL | FL_NEXT;
  }

  // for each section

  for(int i=0; i<hdr->e_shnum; i++)
  {
    // make ptr to section header

    PELF32_SH sh = (PELF32_SH) &buf[ hdr->e_shoff + i * hdr->e_shentsize ];

    // mark section attribs

    if (sh->sh_offset != 0)
    if (sh->sh_size   != 0)
    if ((sh->sh_flags & (SHF_ALLOC|SHF_EXECINSTR)) == (SHF_ALLOC|SHF_EXECINSTR))
    for(DWORD t = sh->sh_offset; t < sh->sh_offset + sh->sh_size; t++)
      if ( (t >= 0) && (t < len) )
        flag[t] |= FL_EXEC;

    // check if symbols

    if (df_flags & DF_SYM)
    if ( (sh->sh_type == SHT_SYMTAB) ||
         (sh->sh_type == SHT_DYNSYM) )
    {

      // for each symbol entry

      for(DWORD j=0; j<sh->sh_size/sh->sh_entsize; j++)
      {
        PELF32_SYM st = (PELF32_SYM) &buf[ sh->sh_offset + j * sh->sh_entsize ];

        // mark functions

        if (ELF32_ST_TYPE(st->st_info) == STT_FUNC)
        {
          DWORD func_offs = va2offs(st->st_value);
          if (func_offs < len)
          {
            if (OPT_DUMP)
            if (OPT_DUMP)
              printf("offs/va=%08X/.%08X sect=[%s] symbol=[%s]\n",
                func_offs,
                st->st_value,
                IS_SPECIAL_SHN(st->st_shndx) ? "" : (char*)&buf[ ((PELF32_SH)&buf[ hdr->e_shoff + hdr->e_shstrndx * hdr->e_shentsize ])->sh_offset + ((PELF32_SH)&buf[ hdr->e_shoff + st->st_shndx * hdr->e_shentsize])->sh_name ],
                (char*)&buf[ ((PELF32_SH)&buf[ hdr->e_shoff + sh->sh_link     * hdr->e_shentsize ])->sh_offset + st->st_name ] );

            flag[func_offs] |= FL_LABEL | FL_NEXT;
          }
        }

      } // for j -- for each symbol

    } // SHT_SYMTAB || SHT_DYNSYM

    // check if .got

    if (df_flags & DF_GOT)
    if (strcmp((char*)&buf[ ((PELF32_SH) &buf[ hdr->e_shoff + hdr->e_shstrndx * hdr->e_shentsize ])->sh_offset + sh->sh_name ], ".got")==0)
    {
      // for each offset
      for(DWORD t = sh->sh_offset; t < sh->sh_offset + sh->sh_size; t += 4)
      if (t < len)
      {
        DWORD va = *(DWORD*)&buf[ t ];
        if ((va != 0) && ((va & 3)==0))
        {
          DWORD offs = va2offs(va);
          if (offs < len)
          if (flag[offs] & FL_EXEC)
          {
            if (OPT_DUMP)
              printf(".got entry: marked next at offs/va=%08X/.%08X\n", offs, va );
            flag[offs] |= FL_NEXT;
          }
        }
      } // for t -- for each offset

    } // .got

  } // for i -- for each section

  // find & mark subroutines

  if (df_flags & DF_FUNC)
  for(DWORD t=0; t<len; t+=4)
  {
    // push ebp
    // mov  ebp, esp
    // ~ to avoid fail on self
    if ( (~(*(DWORD*)&buf[t] & 0x00FFFFFF) == ~0x00EC8B55U) ||
         (~(*(DWORD*)&buf[t] & 0x00FFFFFF) == ~0x00E58955U) )
    {
      if (OPT_DUMP)
        printf("SUBROUTINE sign: marked next at offs/va=%08X/.%08X\n", t, offs2va(t) );
      flag[t] |= FL_NEXT;
    }
  } // for t

  // find & mark jmp tables

  if (df_flags & DF_JMPTAB)
  for(DWORD t = 0; t < len; t++)
  if (flag[t] & FL_EXEC)            // search within executable sections
  {
    // jmp dword ptr [reg32*4+imm32]
    if (*(WORD*)&buf[t+0] == 0x24FF)
    if ((buf[t+2]&0xC7)==0x85)
    if (buf[t+2]!=0xA5)             // reg32 != ESP -- special
    {
      DWORD jtab_va = *(DWORD*)&buf[t+3];
      for(DWORD jtab_offs = va2offs(jtab_va); jtab_offs < len; jtab_offs += 4)
      {
        DWORD f_va   = *(DWORD*)&buf[ jtab_offs ];
        DWORD f_offs = va2offs(f_va);
        if (f_offs >= len) break;
        if ((f_va & 3) == 0)
        if (flag[f_offs] & FL_EXEC)
        if ((flag[f_offs] & FL_ANALYZED) == 0)
        {
          if (OPT_DUMP)
            printf("JMPTAB: marked next at offs/va=%08X/.%08X\n", f_offs, f_va );
          flag[f_offs] |= FL_NEXT;
        }
      }
    }
  } // for t -- for each byte

  // disasm

  for(;;)       // main disasm cycle
  {

    // current instruction pointer
    DWORD ip = 0;

    // find FL_NEXT (code marked for future analysis)
    for(DWORD t = 0; t < len; t++)
    if (flag[t] & FL_NEXT)
    {
      ip = t;
      break;
    }

    // if FL_NEXT not found, search for relative-references to labels

    if (df_flags & DF_RELREF)
    if (ip == 0)
    {
      for(DWORD t = 0; t < len; t++)     // for each byte
      if (flag[t] & FL_EXEC)             // within executable section
      if ((flag[t] & FL_ANALYZED) == 0)  // which has not been analyzed yet
      {
        DWORD rel = NONE, arg = 0;
        BYTE o = buf[t];
        WORD w = *(WORD*)&buf[t];
        if ((w&0xF0FF)==0x800F)
        {
          arg = (long)(*(DWORD*)&buf[t + 2]);
          rel = OFFS_PLUS_REL(t, 6 + arg);
        }
        if ((o==0xE8)||(o==0xE9))
        {
          arg = (long)(*(DWORD*)&buf[t + 1]);
          rel = OFFS_PLUS_REL(t, 5 + arg);
        }
        if (arg & 0xFFFFFF00)
        if (rel < len)
        if ( (flag[rel] & (FL_LABEL|FL_EXEC))==(FL_LABEL|FL_EXEC) )
        {
          if (OPT_DUMP)
            printf("REL REF: marked next at offs/va=%08X/.%08X\n", t, offs2va(t) );
          flag[t] |= FL_NEXT;
          ip = t;
        }
      } // for t
    }

    if (ip == 0)
    {
      if (OPT_DUMP)
        printf("break: done\n");
      break;
    }

    // now we have FL_NEXT at ip

    if (OPT_DUMP)
      printf("NEXT at offs/va=%08X/.%08X\n", ip, offs2va(ip));

    for(;;)
    {
      flag[ip] &= ~FL_NEXT;             // remove FL_NEXT
      flag[ip] |= FL_ANALYZED;          // set FL_ANALYZED

      if (ip == 0) break;                       // troubl?

      // check typical situation on bsd elf's: call exit; db '...exp$...'
      if ((ip & 3) == 0)                // ALIGN 4
      if ( (memcmp(&buf[ip], "$FreeBSD: ", 10)==0) ||
           (memcmp(&buf[ip], "$NetBSD: " , 9 )==0) )
      {
        if (OPT_DUMP)
          printf("break: Exp$\n");
        break;
      }
      //

      if (OPT_DUMP)
        printf("  %08X/.%08X  ", ip, offs2va(ip));

      // disassemble opcode
      disasm_struct diza;
      DWORD op_len = ade32_disasm(&buf[ip], &diza);
      if (op_len == 0)
      {
        if (OPT_DUMP)
          printf("break: disasm error\n");
        break;                      // disasm error
      }

      if (OPT_DUMP)
      {
        for(DWORD t=0; t<op_len; t++)
          printf(" %02X", buf[ip+t]);
        printf("\n");
      }

      // C_BAD flag has been designed for win32 PE files, using PE_STAT.
      // todo: do the same for ELF files
      //if (diza.disasm_flag & C_BAD) break;

      // check if special flags are present within current opcode.
      for(DWORD t = 1; t < op_len; t++)
        if (flag[ip + t] & (FL_LABEL | FL_CODE | FL_OPCODE | FL_ANALYZED))
        {
          if (OPT_DUMP)
            printf("quit: ERR_DISASM (offs=%08X,flag=%08X)\n",
              ip+t, flag[ip+t]);
          return result = ERR_DISASM;
        }

      // after each opcode, flow can have 2 ways
      // (jmp/call tables are not processed yet)

      DWORD nxt = ip + op_len;    // normal way
      DWORD rel = NONE;           // jmp,call,jxx-way

      if (diza.disasm_flag & C_REL)  // have relative arg?
      {
        if (diza.disasm_datasize == 1) // jcc,jcxz,loop/z/nz,jmps
          rel = OFFS_PLUS_REL(nxt, diza.disasm_data_c[0]);
        if (diza.disasm_datasize == 4) // jcc near,call,jmp
          rel = OFFS_PLUS_REL(nxt, diza.disasm_data_l[0]);
      }

      // ret/ret#/retf/retf#/iret/jmp modrm ?
      if (diza.disasm_flag & C_STOP)
        nxt = NONE;

      // process both ways

      if (rel != NONE)
      {
        if (rel >= len)
        {
          if (OPT_DUMP)
            printf("break: rel out of range\n");
          break;          // out of range?
        }

        // ptr into the middle of the opcode?
        if ( (flag[rel] & FL_CODE) && (!(flag[rel] & FL_OPCODE)) )
        {
          if (OPT_DUMP)
            printf("break: ptr into the middle of the opcode\n");
          break;
        }

        flag[rel] |= FL_LABEL;
        if ((flag[rel] & FL_ANALYZED) == 0)
        {
          if (OPT_DUMP)
            printf("REL: marked next at offs/va=%08X/.%08X\n", rel, offs2va(rel) );
          flag[rel] |= FL_NEXT;
        }
      }

      // set flags for current opcode

      for(DWORD t = 0; t < op_len; t++)
      {
        flag[ip + t] |= FL_CODE | FL_ANALYZED;
        flag[ip + t] &= ~(FL_OPCODE | FL_NEXT);
      }
      flag[ip] |= FL_OPCODE;
      flag[ip + op_len - 1] |= FL_OPCODE_END;

      // if jmp-alike, swap nxt & rel, to follow jmp's label immediately

      if ((nxt == NONE) && (rel != NONE))
        nxt = rel;

      // go next opcode

      if (nxt == NONE)
      {
        if (OPT_DUMP)
          printf("break: STOP\n");
        break;
      }
      if (nxt >= len)
      {
        if (OPT_DUMP)
          printf("break: nxt out of range\n");
        break;                     // out of range?
      }

      ip = nxt;

      if (flag[ip] & FL_CODE)
      {
        if (OPT_DUMP)
          printf("break: already code\n");
        break;            // meet code ?
      }

    } // cycle until RET/troubl

  } // main disasm cycle

  return result = ERR_SUCCESS;
} // CElfHlp::DisasmELF

// search for free space

int CElfHlp::Analyze()
{
  // allocate additional array(s)

  arg1 = new DWORD[ len+1 ];
  if (arg1 == NULL)
    return result = ERR_NOMEMORY;
  memset(arg1, 0x00, (len+1)*4);

  // analyze padding

  DWORD n_total = 0;
  DWORD n_island[MAX_ISLAND_LEN+1] = {0};

  for(DWORD a=0; a<len; a++)
  if (flag[a] & FL_OPCODE)
  {
    disasm_struct diza;                           // if jmp/ret-alike
    ade32_disasm(&buf[a], &diza);                 //
    if (diza.disasm_flag & C_STOP)                //
    {
      while((flag[a] & FL_OPCODE_END)==0) a++;    // skip over last opcode
      a++;                                        //
      DWORD b = (a + 15) & 0xFFFFFFF0;            // assume align 16
      DWORD c = b - a;
      if ((c >= 2) && (c <= 15))       // need 5 bytes for jmp, or less
      if (flag[b] & FL_LABEL)          // in some special cases
      if (flag[b] & FL_OPCODE)
      {
        // verify its alignment
        int is_alignment = 1;
        for(DWORD i=a; i<b; i++)
        if (flag[i] & FL_CODE)
        {
          is_alignment = 0;
          break;
        }
        if (*(WORD*)&buf[b-2] != 0x0000)
        if (*(WORD*)&buf[b-2] != 0x9090)
          is_alignment = 0;
        if (is_alignment)
        {
          if (OPT_DUMP)
            printf("padd: %08X/.%08X  len=%d\n", a, offs2va(a), c);

          flag[a] |= FL_FREE_START;
          arg1[a] = c;
          for(DWORD t=a; t<b; t++)
            flag[t] |= FL_FREE;

          n_island[c]++;
          n_total += c;

          a += c - 1;
        }
      }
    }
  }//for a

  // analyze Exp$

  for(DWORD a=0; a<len-16; a+=4)        // ALIGN 4
  {
    if (flag[a] & FL_EXEC) // probably can be removed to use Exp$ in data
    if ( (memcmp(&buf[a], "$FreeBSD: ", 10)==0) ||
         (memcmp(&buf[a], "$NetBSD:  ", 9 )==0) )
    {
      DWORD c = (unsigned)strlen((char*)&buf[a])+1;
      if (c > MAX_ISLAND_LEN) c = MAX_ISLAND_LEN; // only for counting
      if (MaxIslandLen < c) MaxIslandLen = c;   // update MaxIslandLen

      if (OPT_DUMP)
        printf("Exp$: %08X/.%08X  len=%d\n", a, offs2va(a), c);

      flag[a] |= FL_FREE_START;
      arg1[a] = c;
      for(DWORD t=0; t<c; t++)
        flag[a+t] |= FL_FREE;

      n_island[c]++;
      n_total += c;
    }
  }

  // dump found "islands" statistics

  if (n_total != 0)
  {
    printf("isl.sz");
    for(DWORD n=2; n<=MaxIslandLen; n++)
      if (n_island[n])
        printf(" %4d", n);
    printf("\n");
    printf("isl.# ");
    for(DWORD n=2; n<=MaxIslandLen; n++)
      if (n_island[n])
        printf(" %4d", n_island[n]);
    printf("\n");
  }
  printf("total free space = %d bytes\n", n_total);

  // done

  /*
  FILE*f=fopen("_stat","wb");
  for(DWORD i=0; i<len; i++)
  if (flag[i] & FL_FREE_START)
  {
    fprintf(f, "%3d ", arg1[i]);
    for(DWORD j=0; j<arg1[i]; j++)
      fprintf(f," %02X", buf[i+j]);
    fprintf(f, "\n");
  }
  fclose(f);
  */

  return result = ERR_SUCCESS;
} // CElfHlp::Analyze

// disassemble code snippet (really we only need FL_OPCODE flags)

int CElfHlp::DisasmSnippet()
{
  hdr = 0;

  DWORD ip = 0;

  for(;;)
  {
    if (OPT_DUMP)
      printf("  %08X  ", ip);

    // disassemble opcode
    disasm_struct diza;
    DWORD op_len = ade32_disasm(&buf[ip], &diza);
    if (op_len == 0)
    {
      if (OPT_DUMP)
        printf("break: disasm error\n");
      return result = ERR_DISASM;
    }

    if (OPT_DUMP)
    {
      for(DWORD t=0; t<op_len; t++)
        printf(" %02X", buf[ip+t]);
      printf("\n");
    }

    // check if special flags are present within current opcode.
    for(DWORD t = 1; t < op_len; t++)
      if (flag[ip + t] & (FL_LABEL | FL_CODE | FL_OPCODE | FL_ANALYZED))
      {
        if (OPT_DUMP)
          printf("quit: ERR_DISASM\n");
        return result = ERR_DISASM;
      }

    // after each opcode, flow can have 2 ways
    // (jmp/call tables are not processed yet)

    DWORD nxt = ip + op_len;    // normal way
    DWORD rel = NONE;           // jmp,call,jxx-way

    if (diza.disasm_flag & C_REL)  // have relative arg?
    {
      if (diza.disasm_datasize == 1) // jcc,jcxz,loop/z/nz,jmps
        rel = nxt + diza.disasm_data_c[0];
      if (diza.disasm_datasize == 4) // jcc near,call,jmp
        rel = nxt + diza.disasm_data_l[0];
    }

    // process both ways

    if (rel != NONE)
    {
      if (rel > len)
      {
        if (OPT_DUMP)
          printf("break: rel out of range\n");
        return result = ERR_DISASM;
      }

      // ptr into the middle of the opcode?
      if ( (flag[rel] & FL_CODE) && (!(flag[rel] & FL_OPCODE)) )
      {
        if (OPT_DUMP)
          printf("break: ptr into the middle of the opcode\n");
        return result = ERR_DISASM;
      }

      flag[rel] |= FL_LABEL;
    }

    // set flags for current opcode

    for(DWORD t = 0; t < op_len; t++)
    {
      flag[ip + t] |= FL_CODE | FL_ANALYZED;
      flag[ip + t] &= ~(FL_OPCODE | FL_NEXT);
    }
    flag[ip] |= FL_OPCODE;
    flag[ip + op_len - 1] |= FL_OPCODE_END;

    // if jmp-alike, swap nxt & rel, to follow jmp's label immediately

    if ((nxt == NONE) && (rel != NONE))
      nxt = rel;

    // go next opcode

    if (nxt == NONE)
    {
      if (OPT_DUMP)
        printf("break: STOP\n");
      break;
    }
    if (nxt > len)
    {
      if (OPT_DUMP)
        printf("break: nxt out of range\n");
      return result = ERR_DISASM;
    }

    ip = nxt;

    if (ip == len)
    {
      if (OPT_DUMP)
        printf("break: eof\n");
      break;
    }

  } // cycle until eof

  return result = ERR_SUCCESS;
} // CElfHlp::DisasmSnippet

// most interesting stuff -- inject snippet into target file

int CElfHlp::Inject(CElfHlp* S, DWORD hook_offs, DWORD in_flags)
{
  // check if valid hook offset

  if (hook_offs+16 > len)
    return result = ERR_BADHOOKOFFS;

  // find place for original bytes within code snippet

  DWORD orig_bytes = NONE;
  for(DWORD a=0; a<S->len; a++)
    if (memcmp(&S->buf[a], "$ORIGINAL_BYTES$", 16)==0)
    {
      memset(&S->buf[a], 0x90, 16);
      orig_bytes = a;
      break;
    }
  if (orig_bytes == NONE)
    return result = ERR_NOORIGBYTESSIGN;

  // copy opcodes from hook_offs into code snippet.
  // summary opcodes size must be >= 5 bytes, to place jmp

  DWORD link = 0;

  DWORD jmpback = NONE;
  for(DWORD ip=hook_offs; ip<len; )
  {
    if (OPT_DUMP)
      printf("orig opcode at %08X/.%08X\n", ip, offs2va(ip));

    if ((flag[ip] & FL_OPCODE) == 0)
      return result = ERR_NOTOPCODEATHOOK;

    disasm_struct diza;
    DWORD op_len = ade32_disasm(&buf[ip], &diza);
    if (op_len == 0)
      return result = ERR_INTERNAL1;

    if (diza.disasm_flag & (C_REL|C_STOP))
      return result = ERR_JMPRETATHOOK;

    ip += op_len;
    DWORD orig_len = ip - hook_offs;

    if (orig_len >= 5)      // 5 bytes for jmp to snippet
    {
      // copy original bytes
      memcpy(&S->buf[orig_bytes], &buf[hook_offs], orig_len);

      // fill original bytes with NOPs, check/setup flags
      for(DWORD t=hook_offs; t<hook_offs+orig_len; t++)
      {
        if ( (flag[t] & FL_FREE) || ((flag[t] & FL_CODE)==0) )
          return result = ERR_BADHOOKOFFS;
        flag[t] |= FL_OPCODE;
        arg1[t] = 0;
        buf[t] = 0x90;      // padd jmp to snippet with NOPs
      }

      // used to build jmp to snippet later
      link = hook_offs;

      // address to return back
      jmpback = hook_offs+5;

      break;
    }
  }
  if (jmpback == NONE)
    return result = ERR_INTERNAL2;

  // disassemble snippet

  if (S->DisasmSnippet() != ERR_SUCCESS)
    return result = S->result;

  // step 1 -- copy opcodes from snippet S into current file

  DWORD next_b = 0, next_sz = 0;

  for(DWORD a=0; a<S->len; )
  {
    if ((S->flag[a] & FL_OPCODE)==0)
      return result = ERR_INTERNAL3;

    disasm_struct diza;
    DWORD op_len = ade32_disasm(&S->buf[a], &diza);
    if (op_len == 0)
      return result = ERR_INTERNAL4;

    if ( (in_flags & IN_KILLNOP) &&
         (op_len == 1) &&
         (S->buf[a] == 0x90) &&
         ((S->flag[a] & FL_LABEL)==0) )
    {
      // skip NOP's
    }
    else
    {

      // replace short jxx'es with near ones

      BYTE new_op[32];
      memcpy(new_op, &S->buf[a], op_len);
      int new_op_len = op_len;
      DWORD rel_to = NONE;

      if (diza.disasm_flag & C_REL)
      {
        if ((diza.disasm_opcode & 0xFC) == 0xE0)
          return result = ERR_NOTSUPP;

        if ((diza.disasm_opcode & 0xF0) == 0x70)
        {
          new_op[0] = 0x0F;
          new_op[1] = diza.disasm_opcode ^ (0x70 ^ 0x80);
          new_op_len = 6;
        }
        if (diza.disasm_opcode == 0xEB)
        {
          new_op[0] = 0xE9;
          new_op_len = 5;
        }

        if (diza.disasm_datasize == 1) rel_to = a + op_len + diza.disasm_data_c[0];
        if (diza.disasm_datasize == 2) rel_to = a + op_len + diza.disasm_data_s[0];
        if (diza.disasm_datasize == 4) rel_to = a + op_len + diza.disasm_data_l[0];
      }

      // search for suitable free space area

      DWORD need_size = new_op_len + (diza.disasm_flag & C_STOP ? 0 : 5);

      if ((next_b != 0) && (next_sz < need_size))
        next_b = next_sz = 0;

      DWORD szS  = need_size;
      DWORD szE  = MaxIslandLen+1;
      int   szST = 1;
      if (in_flags & IN_BIGFIRST)
      {
        szS  = MaxIslandLen;
        szE  = need_size-1;
        szST = -1;
      }

      for(DWORD sz=szS; sz!=szE; sz+=szST)
      for(DWORD b=0; b<len; b++)
      {
        // start of free area?
        if ( ((flag[b] & FL_FREE_START) && (arg1[b] == sz)) ||
             (next_b != 0) )
        {
          if (next_b != 0) { b = next_b; sz = next_sz; };
          next_b = next_sz = 0;

          // if required, set link from previous island to current

          if (link != 0)
          {
            if (OPT_DUMP)
              printf("link  : %08X/.%08X  jmp_to=%08X/.%08X\n",
                link, offs2va(link), b, offs2va(b) );

            // jmp - set new flags
            for(DWORD t=0; t<5; t++)
            {
              flag[link+t] |= FL_CODE | FL_INJECTED;
              arg1[link+t] = 0;
            }
            flag[link+0] |= FL_OPCODE | FL_INJECTED_START;
            flag[link+4] |= FL_OPCODE_END;

            // jmp - build bytes
            buf[link+0] = 0xE9;
            *(DWORD*)&buf[link+1] = offs2va(b) - offs2va(link+5);

            // link fixed
            link = 0;
          }

          // copy opcode from snippet to file

          if (OPT_DUMP)
            printf("opcode: %08X/.%08X  snippet=%08X new_op_len=%d free_len=%d rel_to=%08X\n",
              b, offs2va(b), a, new_op_len, sz, rel_to );

          // clear old flags
          for(DWORD t=b; t<b+sz; t++)
          {
            flag[t] &= ~(FL_FREE_START | FL_FREE | FL_OPCODE | FL_CODE);
            arg1[t] = 0;
          }

          // orig opcode - copy bytes
          memcpy(&buf[b], new_op, new_op_len);

          // orig opcode - set new flags
          for(DWORD t=b; t<b+new_op_len; t++)
            flag[t] |= FL_CODE | FL_INJECTED;
          flag[b] |= FL_OPCODE | FL_INJECTED_START;
          flag[b+new_op_len-1] |= FL_OPCODE_END;
          arg1[b] = a;

          // build jmp back to original bytes + 5
          if ( (new_op_len == 5) &&
               (buf[b]==0xBC) &&        // mov esp, 0aa55aa55h
               (*(DWORD*)&buf[b+1] == 0xAA55AA55) )
          {
            if (OPT_DUMP)
              printf("jmpback: %08X/.%08X jmpto=%08X/.%08X\n",
                b, offs2va(b), jmpback, va2offs(jmpback));

            buf[b+0] = 0xE9;
            *(DWORD*)&buf[b+1] = offs2va(jmpback) - offs2va(b+5);
          }

          // if opcode has relative argument, mark it to fix on step 2
          if (diza.disasm_flag & C_REL)
          {
            flag[b+new_op_len-4] |= FL_FIXREL;
            *(DWORD*)&buf[b+new_op_len-4] = rel_to;
          }

          // remember address to fix link
          if ((diza.disasm_flag & C_STOP) == 0)
            link = b + new_op_len;

          // check if we can place next opcode into the same island
          if (a+op_len < S->len)
          {
            disasm_struct diza2;
            DWORD op_len2 = ade32_disasm(&S->buf[a+op_len], &diza2);
            if (op_len2 == 0)
              return result = ERR_INTERNAL5;
            if ( sz - new_op_len >= op_len2+5 )
            if (((diza2.disasm_flag & C_REL)==0)||(diza2.disasm_datasize == 4))
            {
              next_b  = b  + new_op_len;
              next_sz = sz - new_op_len;
//            printf("***NEXT*** sz=%d\n", next_sz);
            }
          }

          goto linked;
        }
      }//for sz,b

      return result = ERR_NOSPACE;
linked: ;
    }

    // go to the next snippet's opcode
    a += op_len;

  }//for a -- for each opcode within code snippet S

  // step 2 -- fix relative jmps

  for(DWORD b=0; b<len; b++)
  if (flag[b] & FL_FIXREL)
  {
    flag[b] &= ~FL_FIXREL;

    DWORD rel_to = *(DWORD*)&buf[b];
    DWORD link_to = 0;
    for(DWORD t=0; t<len; t++)
    if (flag[t] & FL_INJECTED_START)
    if (arg1[t] == rel_to)
    {
      link_to = t;
      break;
    }
    if (link_to == 0)
      return result = ERR_INTERNAL6;

    if (OPT_DUMP)
      printf("fixjmp: %08X/.%08X link_to=%08X/.%08X\n",
        b, offs2va(b), link_to, offs2va(link_to) );

    *(DWORD*)&buf[b] = offs2va(link_to) - offs2va(b+4);
  }//for b

  // done

  return result = ERR_SUCCESS;
} // CElfHlp::Inject

DWORD CElfHlp::GetEntryOffs()
{
  return va2offs(hdr->e_entry);
}//CElfHlp::GetEntryOffs

DWORD CElfHlp::GetFuncOffs(char* func)
{
  // for each section
  for(int i=0; i<hdr->e_shnum; i++)
  {
    // make ptr to section header
    PELF32_SH sh = (PELF32_SH) &buf[ hdr->e_shoff + i * hdr->e_shentsize ];
    // check if symbols
    if ( (sh->sh_type == SHT_SYMTAB) ||
         (sh->sh_type == SHT_DYNSYM) )
    {
      // for each symbol entry
      for(DWORD j=0; j<sh->sh_size/sh->sh_entsize; j++)
      {
        PELF32_SYM st = (PELF32_SYM) &buf[ sh->sh_offset + j * sh->sh_entsize ];
        if (ELF32_ST_TYPE(st->st_info) == STT_FUNC)
          if (!strcmp(func, (char*)&buf[ ((PELF32_SH)&buf[ hdr->e_shoff + sh->sh_link     * hdr->e_shentsize ])->sh_offset + st->st_name ]))
            return va2offs(st->st_value);
      } // for j -- for each symbol
    } // SHT_SYMTAB || SHT_DYNSYM
  } // for i -- for each section
  return NONE;
} // CElfHlp::GetFuncOffs
