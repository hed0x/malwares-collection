
////////x///////x///////x///////x///////x///////x///////x///////x///////x////

#define TRY_DREF                        // try to determine subroutines
#define TRY_RELREF                      // search for relative references

//#define DISABLE_ERR_DISASM              // disable ERR_DISASM handling

#define CODEFIRST                       // assume code in first section only
#define STDSECT                         // standard section names only

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

#include "mz.hpp"
#include "pe.hpp"
#include "debug.hpp"

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

//#define NEWBASE 0x90000000            // change imagebase (used if defined)

#define MAX_FIXUP_SIZE  131072          // max new fixup table size

#define align(x,y)      (((x)+(y)-1)&(~((y)-1)))
#define MIN(x,y)        ((x)<(y)?(x):(y))
#define MAX(x,y)        ((x)>(y)?(x):(y))

#define NONE            0xFFFFFFFF

#define memw  *(WORD*)&memb
#define memd  *(DWORD*)&memb

#define SectionSize(n)  (oe[n].oe_virtsize == 0 ?                     \
                         oe[n].oe_physsize :                          \
                         MIN(oe[n].oe_physsize, oe[n].oe_virtsize))

#define markrva(x)                              \
   {                                            \
     flag[x] |= FL_RVA | FL_DATA;               \
     flag[memd[x]] |= FL_LABEL | FL_DREF;       \
     arg1[x] = memd[x];                         \
   }

#define markrvadata(x)                          \
   {                                            \
     flag[x] |= FL_RVA | FL_DATA;               \
     flag[memd[x]] |= FL_LABEL | FL_DREF | FL_DATA; \
     arg1[x] = memd[x];                         \
   }

#define markfixup(x)                                                 \
   {                                                                 \
     flag[ x ] |= FL_FIXUP;                                          \
     arg1[x] = memd[x] - pe->pe_imagebase;                           \
     flag[ arg1[x] ] |= FL_LABEL | FL_DREF;                          \
   }

#define markdelta(x,y,z)                        \
   {                                            \
     flag[x] |= FL_DELTA;                       \
     arg1[x] = y;                               \
     arg2[x] = (y)+(z);                         \
     flag[y]       |= FL_LABEL | FL_DREF;       \
     flag[(y)+(z)] |= FL_LABEL | FL_DREF;       \
   }

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

hooy* __fastcall hooybyoldrvaEx(hooy* root, DWORD oldrva, DWORD needflags);

hooy* __fastcall hooybyoldrva(hooy* root, DWORD oldrva);

void __fastcall process_import(
                PE_HEADER* pe,
                BYTE* memb,
                DWORD* flag,
                DWORD* arg1,
                DWORD a);

void __fastcall process_rsrc(PE_HEADER *pe,
                BYTE* memb,
                DWORD* flag,
                DWORD* arg1,
                DWORD* arg2,
                DWORD x);

DWORD __fastcall calc_csum(BYTE* buf, DWORD size);

void __fastcall my_memcpy(void *dest, void *src, DWORD n);
void __fastcall my_memset(void *dest, int c, DWORD n);

#ifdef DUMP_LOG
void __fastcall dump(hooy* root,char* fname);
#endif // DUMP_LOG

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

void id1() { __emit__( 0xEB,0x02,0xFF,1 ); }

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

int __cdecl engine(
           DWORD  user_arg,
           BYTE*  buf,
           DWORD  inbufsize,
           DWORD* outbufsize,
           DWORD  maxbufsize,
           int    __cdecl user_disasm(DWORD,BYTE*),
           void*  __cdecl user_malloc(DWORD,DWORD),
           DWORD  __cdecl user_random(DWORD,DWORD),
           int    __cdecl user_mutate(
              DWORD,
              PE_HEADER*,
              PE_OBJENTRY*,
              hooy*,
              int   __cdecl (*)(DWORD,BYTE*),
              void* __cdecl (*)(DWORD,DWORD),
              DWORD __cdecl (*)(DWORD,DWORD)
              ),
           int    __cdecl user_sigman(                  // NULL allowed
              DWORD,
              PE_HEADER*,
              PE_OBJENTRY*,
              BYTE*,
              DWORD*,
              DWORD)
           )
{

/******************/

  MZ_HEADER* mz;
  PE_HEADER* pe;
  PE_OBJENTRY* oe;

  BYTE*  memb;
  DWORD* flag;
  DWORD* arg1;
  DWORD* arg2;

  hooy* root;
  hooy* tail;
  hooy** fasthooy;

/******************/

#ifdef DUMP_MSG
  printf("þ analyzing PE headers\n");
#endif // DUMP_MSG

  mz = (MZ_HEADER*) &buf[0];

  if ((mz->mz_id != 'MZ') || (mz->mz_neptr >= inbufsize))
    return ERR_BADFILE;

  pe = (PE_HEADER*)&buf[ mz->mz_neptr ];

  if (pe->pe_id != 'PE\x00\x00')
    return ERR_BADFILE;

  if ((pe->pe_fixuprva==0) || (pe->pe_flags & 1))
    return ERR_BADFILE;

#ifdef STDSECT
  oe = (PE_OBJENTRY*) &buf[ mz->mz_neptr + 0x18 + pe->pe_ntheadersize ];

  for (int i = 0; i < pe->pe_numofobjects; i++)
  {
    DWORD t = ~( *(DWORD*)&oe[i].oe_name[0] ^      // 8 bytes
                 *(DWORD*)&oe[i].oe_name[4] );
#define mk1(x) if (t != ~((DWORD)(x)))
    mk1('CODE')
    mk1('DATA')
    mk1('AUTO')
    mk1('BSS\x00')
    mk1('TLS\x00')
    mk1('.bss')
    mk1('.tls')
    mk1('.CRT')
    mk1('.INI'^'T\x00\x00\x00')
    mk1('.tex'^'t\x00\x00\x00')
    mk1('.dat'^'a\x00\x00\x00')
    mk1('.rsr'^'c\x00\x00\x00')
    mk1('.rel'^'oc\x00\x00')
    mk1('.ida'^'ta\x00\x00')
    mk1('.rda'^'ta\x00\x00')
    mk1('.eda'^'ta\x00\x00')
    mk1('.deb'^'ug\x00\x00')
    mk1('DGRO'^'UP\x00\x00')
    {
#ifdef DUMP_MSG
      printf("non-std section name [%s]\n", oe[i].oe_name);
#endif
      return ERR_BADFILE;
    }
  }
#endif // STDSECT

#ifdef DUMP_MSG
  printf("þ allocating memory\n");
#endif // DUMP_MSG

  DWORD t = pe->pe_imagesize + 1;
  memb = (BYTE*)  user_malloc(user_arg,t);
  flag = (DWORD*) user_malloc(user_arg,4*t);
  arg1 = (DWORD*) user_malloc(user_arg,4*t);
  arg2 = (DWORD*) user_malloc(user_arg,4*t);
  fasthooy = (hooy**) user_malloc(user_arg,4*t);

  if ((memb==0)||(flag==0)||(arg1==0)||(arg2==0)||(fasthooy==0))
    return ERR_NOMEMORY;

#ifdef DUMP_MSG
  printf("þ loading into virtual addresses\n");
#endif // DUMP_MSG

  my_memcpy(memb, buf, pe->pe_headersize);
  for (DWORD k=0; k<pe->pe_headersize; k++)
    flag[k] |= FL_PRESENT | FL_VPRESENT;

  mz = (MZ_HEADER*) &memb[0];

  DWORD pe0 = mz->mz_neptr;
  pe = (PE_HEADER*) &memb[ pe0 ];

  DWORD oe0 = pe0 + 0x18 + pe->pe_ntheadersize;
  oe = (PE_OBJENTRY*) &memb[ oe0 ];

  DWORD ovr_offs;
  int   ovr_size;

  for (int i = 0; i < pe->pe_numofobjects; i++)
  {
    //
    oe[i].oe_virtsize = align(oe[i].oe_virtsize, pe->pe_objectalign);
    oe[i].oe_physsize = align(oe[i].oe_physsize, pe->pe_filealign);
    //
    DWORD s = SectionSize(i);
    my_memcpy(&memb[ oe[i].oe_virtrva ],
              &buf[ oe[i].oe_physoffs ], s);
    //
    DWORD q = align(oe[i].oe_physsize, pe->pe_filealign);
    for (DWORD t=0; t < q; t++)
      flag[oe[i].oe_virtrva + t] |= FL_PRESENT;
    q = MAX(q, align(oe[i].oe_virtsize, pe->pe_objectalign));
    for (DWORD t=0; t < q; t++)
      flag[oe[i].oe_virtrva + t] |= FL_VPRESENT;
    //
    ovr_offs = oe[i].oe_physoffs + align(oe[i].oe_physsize, pe->pe_filealign);
    ovr_size = inbufsize - ovr_offs;
  }

  int t1 = 0;
  for (int i = 0; i < ovr_size; i++)
    t1 |= buf[ovr_offs + i];
  if (t1 == 0) ovr_size = 0;

#ifdef DUMP_MSG
  if (ovr_size > 0)
  printf("overlay at offs[%08X], size=%08X\n", ovr_offs, ovr_size);
#endif // DUMP_MSG

#ifdef DUMP_MSG
  printf("+ PE structure\n");
#endif // DUMP_MSG

  t = oe0;
  for (int i = 0; i < pe->pe_numofobjects; i++)
  {
    flag[oe[i].oe_virtrva] |= FL_SECTALIGN;

    flag[t+0x00] |= FL_DATA;    // 00=section name
    flag[t+0x28] |= FL_DATA;    // end of section (actual for last one)
    markrva(t+0x0C);            // 0C=virtrva

    if (oe[i].oe_virtsize != 0)
    markdelta(t+0x08, oe[i].oe_virtrva, oe[i].oe_virtsize); // 08=virtsize
    markdelta(t+0x10, oe[i].oe_virtrva, oe[i].oe_physsize); // 10=physsize

    flag[t+0x10] |= FL_PHYS | FL_FORCEFILEALIGN;

    flag[t+0x14] |= FL_RVA | FL_PHYS;           // 14=physoffs
    arg1[t+0x14] = oe[i].oe_virtrva;

    t += sizeof(PE_OBJENTRY);
  }
  flag[pe->pe_imagesize] |= FL_SECTALIGN;

  if (pe->pe_entrypointrva)
  markrva(pe0 + 0x28);                   // EntryPointRVA

  markrva(pe0 + 0x2C);                   // 2C=baseofcode
  markrva(pe0 + 0x30)                    // 30=baseofdata

  markdelta(pe0+0x1C, pe->pe_baseofcode, pe->pe_sizeofcode); // 1C=sizeofcode
//markdelta(pe0+0x20, pe->pe_baseofdata, pe->pe_sizeofidata);// 20=sizeofidata

  flag[pe0+0x1C] |= FL_FORCEOBJALIGN;
//flag[pe0+0x20] |= FL_FORCEOBJALIGN;

  markrva(pe0 + 0x50);                       // 50=imagesize
  markrvadata(pe0 + 0x54);                   // 54=headersize

  for (DWORD i=0; i<pe->pe_numofrvaandsizes; i++)
  {
    DWORD t = pe0+0x78+i*8;                // rva/size #i
    if ( memd[t] )
    {
      markrvadata(t);
      markdelta(t+4, memd[t], memd[t+4]);
      for (DWORD z=memd[t]; z<memd[t]+memd[t+4]; z++)
        flag[z] |= FL_DATA;
    }
  }

  if (pe->pe_importrva)
  {
#ifdef DUMP_MSG
    printf("+ imports\n");
#endif // DUMP_MSG
    DWORD imp0 = pe->pe_importrva;
    flag[imp0] |= FL_LABEL;
    while ( memd[imp0 + 0x10] )              // 10=addresstable
    {
      process_import(pe,memb,flag,arg1,  imp0 + 0x00);           // 00=lookup
      process_import(pe,memb,flag,arg1,  imp0 + 0x10);           // 10=addresstable
      markrvadata(imp0 + 0x0C);                    // 0C=name
      imp0 += sizeof(PE_IMPORT);
    }
  }

  if (pe->pe_exportrva)
  {
#ifdef DUMP_MSG
    printf("+ exports\n");
#endif // DUMP_MSG
    DWORD exp0 = pe->pe_exportrva;
    markrvadata(exp0+0x0C);           // 0C=namerva
    markrvadata(exp0+0x1C);           // 1C=addresstablerva
    markrvadata(exp0+0x20);           // 20=namepointersrva
    markrvadata(exp0+0x24);           // 24=ordinaltablerva
    PE_EXPORT *exp = (PE_EXPORT*) &memb[ exp0 ];
    exp0 = exp->ex_addresstablerva;
    for (DWORD i = 0; i < exp->ex_numoffunctions; i++)
      markrva(exp0 + i*4);
    exp0 = exp->ex_namepointersrva;
    for (DWORD i = 0; i < exp->ex_numofnamepointers; i++)
      markrvadata(exp0 + i*4);
  }

#ifdef DUMP_MSG
  printf("+ fixups\n");
#endif // DUMP_MSG

  int fixupcount = 0;

  PE_FIXUP* fx = (PE_FIXUP*) &memb[ pe->pe_fixuprva ];
  DWORD k = 0;
  while (k < pe->pe_fixupsize)
  {
    for (DWORD i = 0; i < (fx->fx_blocksize - 8) / 2; i++)
      if ((fx->fx_typeoffs[i] >> 12) == 3)
      {
        fixupcount++;
        DWORD j = fx->fx_pagerva + (fx->fx_typeoffs[i] & 0x0FFF);
        markfixup(j);
#ifdef NEWBASE
        memd[j] = memd[j] - pe->pe_imagebase + NEWBASE;
#endif
      }
    k += fx->fx_blocksize;
    (DWORD)fx += fx->fx_blocksize;
  }
#ifdef NEWBASE
  pe->pe_imagebase = NEWBASE;
#endif

  if (fixupcount == 0)
    return ERR_BADFILE;         // # fixups == 0

  if (pe->pe_resourcerva)
  {
#ifdef DUMP_MSG
    printf("+ resources\n");
#endif // DUMP_MSG
    process_rsrc(pe,memb,flag,arg1,arg2, pe->pe_resourcerva );
  }

#ifdef DUMP_MSG
  printf("þ sigman(0)\n");
#endif // DUMP_MSG

  if (user_sigman != NULL)
  {
    int res = user_sigman(user_arg, pe, oe, memb, flag, 0);
    if (res != 0)
      return ERR_SIGMAN;
  }

#ifdef DUMP_MSG
  printf("þ analyzing code\n");
#endif // DUMP_MSG

  if (pe->pe_entrypointrva)
    flag[ pe->pe_entrypointrva ] |= FL_NEXT;

  DWORD ip;

  for (ip = pe->pe_headersize;
       ip < pe->pe_imagesize - 16;
       ip++)
  {

    if (~(memd[ip] & 0x00FFFFFF) == ~0x00EC8B55U) // to avoid fail on self
      flag[ip] |= FL_NEXT;

    if (memw[ip] == 0x8B55)
    if (flag[ip] & FL_DREF)
      flag[ip] |= FL_NEXT;

  }// for ip

#ifdef DUMP_MSG
  printf("þ disassembling\n");
#endif // DUMP_MSG

  for (;;)
  {

    for (ip = 0; ip < pe->pe_imagesize; ip++)
      if (flag[ip] & FL_NEXT)
        goto c1;

#ifdef TRY_DREF
#ifdef CODEFIRST
    for (ip = oe[0].oe_virtrva;
         ip < oe[0].oe_virtrva + oe[0].oe_physsize;
         ip++)
#else
    for (ip = pe->pe_headersize; ip < pe->pe_imagesize - 16; ip++)
#endif
    if (flag[ip] & FL_DREF)
    if (!(flag[ip] & (FL_NEXT | FL_ANALYZED | FL_FIXUP | FL_DATA)))
    if (memb[ip]   != 0x00)
//  if (memb[ip+1] != 0x00)             // removed, 'coz <push 0>
    {
#ifdef DUMP_TRY
      printf("try .%08X: ",ip);
#endif

      flag[ip] |= FL_ANALYZED;

      DWORD j = ip;
      for (/*int opcount=0*/; j < pe->pe_imagesize - 16; /*opcount++*/)
      {
        BYTE o = memb[j];
        WORD w = memw[j];

        if (  (w==0x0000)||
              (w==0xFFFF)||
              (o==0xCD)||            // int xx
              (o==0xFA)||            // cli
              (o==0xFB)||            // sti
              (o==0xCF)||            // iretd
              (o==0x1E)||            // push ds
              (o==0x1F)||            // pop ds
              (o==0x06)||            // push es
              (o==0x07)||            // pop es
              (o==0x16)||            // push ss
              (o==0x17)||            // pop ss
              (o==0x0E)||            // push cs
              (o==0xE0)||            // loopne
              (o==0x37)||            // AAA
              (o==0x3F)||            // AAS
              (o==0xD4)||            // AAM
              (o==0xD5)||            // AAD
              (o==0x27)||            // DAA
              (o==0x2F)||            // DAS
              ((o&0xFC)==0x6C)||     // 6C/6D/6E/6F insb/insd/outsb/outsd
              (o==0xF4)              // hlt
           )
        {
#ifdef DUMP_TRY
          printf("e1 at %08X\n",j);
#endif
          break;
        }

        DWORD len = user_disasm(user_arg, &memb[j] );
        if (len==0xFFFFFFFF)
        {
#ifdef DUMP_TRY
          printf("e5 at %08X\n",j);
#endif
          break;
        }

        DWORD rel = NONE;
        if (((o&0xF0)==0x70)||((o&0xFC)==0xE0)||(o==0xEB))
          rel = j + 2 + (char)memb[j + 1];
        if ((w&0xF0FF)==0x800F)
          rel = j + 6 + (long)(memd[j + 2]);
        if ((o==0xE8)||(o==0xE9))
          rel = j + 5 + (long)(memd[j + 1]);

        if (rel != NONE)
        {
#ifdef CODEFIRST
          if (rel - oe[0].oe_virtrva > oe[0].oe_physsize)
#else
          if (rel > pe->pe_imagesize)
#endif
          {
#ifdef DUMP_TRY
            printf("e4\n");
#endif
            break;
          }
          if (flag[rel] & (FL_DATA | FL_FIXUP))
          {
#ifdef DUMP_TRY
            printf("x1\n");
#endif
            break;
          }
          if ( (flag[rel] & FL_CODE) && (!(flag[rel] & FL_OPCODE)) )
          {
#ifdef DUMP_TRY
            printf("e3\n");
#endif
            break;
          }
        }

        if (   ((o&0xF6)==0xC2)||(o==0xCF)||((w&0x38FF)==0x20FF) ||
               (o==0xEB)||(o==0xE9) ||
               (flag[j] & FL_OPCODE)   )
        {
//        if (opcount < 2) break;
          flag[ip] |= FL_NEXT;
#ifdef DUMP_TRY
          printf("OK\n");
#endif
          goto c1;
        }

        if (flag[j] & (FL_DATA | FL_FIXUP))
        {
#ifdef DUMP_TRY
          printf("e9 at %08X\n",j);
#endif
          break;
        }

        for (DWORD i=j+1; i<j+len; i++)
          if ( flag[i] & (FL_LABEL|FL_OPCODE|FL_DATA) )
          {
#ifdef DUMP_TRY
            printf("e2 at %08X\n",i);
#endif
            goto c2;
          }

        if (len>4)
        for (DWORD i=j+len-3; i<j+len; i++)
          if ( flag[i] & FL_FIXUP )
          {
#ifdef DUMP_TRY
            printf("e2a at %08X\n",i);
#endif
            goto c2;
          }

        j += len;

#ifdef CODEFIRST
        if (j > pe->pe_imagesize)
#else
        if (j - oe[0].oe_virtrva > oe[0].oe_physsize)
#endif
        {
#ifdef DUMP_TRY
          printf("x4\n");
#endif
          break;
        }

      }
c2:
    } // FL_DREF
#endif // TRY_DREF

#ifdef TRY_RELREF
#ifdef CODEFIRST
    for (ip = oe[0].oe_virtrva;
         ip < oe[0].oe_virtrva+oe[0].oe_physsize;
         ip++)
#else
    for (ip = pe->pe_headersize; ip < pe->pe_imagesize - 4; ip++)
#endif
    if (!(flag[ip] & FL_ANALYZED))
    {
      DWORD rel = NONE, arg = 0;
      BYTE o = memb[ip];
      WORD w = memw[ip];
//    if (((o&0xF0)==0x70)||((o&0xFC)==0xE0)||(o==0xEB))
//      rel = ip + 2 + (char)MEMB(ip + 1);
      if ((w&0xF0FF)==0x800F)
      {
        arg = (long)(memd[ip + 2]);
        rel = ip + 6 + arg;
      }
      if ((o==0xE8)||(o==0xE9))
      {
        arg = (long)(memd[ip + 1]);
        rel = ip + 5 + arg;
      }
      if (rel != NONE)
      if (arg & 0x00)
#ifdef CODEFIRST
      if (rel - oe[0].oe_virtrva < oe[0].oe_physsize)
#else
      if (rel < pe->pe_imagesize)
#endif
        if (flag[rel] & FL_OPCODE)
        {
          flag[ip] |= FL_NEXT;
          goto c1;
        }
    }
#endif // TRY_RELREF

    break;

c1:

    for (;;)
    {
      flag[ip] &= ~FL_NEXT;
      flag[ip] |= FL_ANALYZED;

      if ((memw[ip] == 0x0000) || (ip == 0))
        break;

      DWORD len = user_disasm(user_arg, &memb[ip] );
      if (len==0xFFFFFFFF) break;

#ifdef DUMP_DISASM
      printf("%08X: ",ip);
      for (DWORD i = 0; i < len; i++)
        printf(" %02X",memb[ip + i]);
      printf("\n");
#else
#ifdef DUMP_MSG
      printf(".%08X\x0D",ip);
#endif
#endif

      for (DWORD i = 1; i < len; i++)
        if (flag[ip + i] & (FL_LABEL | FL_CODE | FL_OPCODE | FL_ANALYZED))
        if (!(flag[ip + i] & (FL_FIXUP | FL_SIGNATURE)))
        {
//        if ((flag[ip + i] & FL_OPCODE) && ((memb[ip]&0xFE) == 0x66)) break;

#ifdef DUMP_MSG
          printf("err1 at %08X+%08X, flag=%08X\n",ip,i, flag[ip+i]);
#endif // DUMP_MSG
#ifdef DISABLE_ERR_DISASM
          goto c3;
#else
          return ERR_DISASM;
#endif
        }

      DWORD nxt = ip + len;
      DWORD rel = NONE;

      BYTE  o = memb[ip];
      WORD  w = memw[ip];

      if (o == 0x2E)
      {
        o = memb[ip+1];
        w = memw[ip+1];
      }

      if (((o&0xF0)==0x70)||((o&0xFC)==0xE0)||(o==0xEB)) // jcc,jcxz,loop/z/nz,jmps
      {
        rel = nxt + (char)(memb[nxt - 1]);;
        arg2[ip] = 1;
      }

      if (((w&0xF0FF)==0x800F)||(o==0xE8)||(o==0xE9)) // jcc near,call,jmp
      {
        rel = nxt + (long)(memd[nxt - 4]);
        arg2[ip] = 4;
      }

      if ((o==0xEB)||(o==0xE9)) nxt=NONE;       // jmps,jmp

      if (((o&0xF6)==0xC2)||(o==0xCF)||((w&0x38FF)==0x20FF))
        nxt=NONE; // ret/ret#/retf/retf#/iret/jmp modrm

      if (rel != NONE)
      {
#ifdef CODEFIRST
        if (rel - oe[0].oe_virtrva > oe[0].oe_physsize)
#else
        if (rel > pe->pe_imagesize)
#endif
        {
#ifdef DUMP_MSG
          printf("rel out of range error at .%08X\n", ip);
#endif // DUMP_MSG
          break;
        }

        if (flag[rel] & (FL_DATA | FL_FIXUP)) break;
        if ( (flag[rel] & FL_CODE) && (!(flag[rel] & FL_OPCODE)) ) break;

        flag[ip] |= FL_HAVEREL;
        flag[rel] |= FL_LABEL | FL_CREF;
        if ((flag[rel] & FL_ANALYZED) == 0)
          flag[rel] |= FL_NEXT;
        arg1[ip] = rel;
      }

      for (DWORD i = 0; i < len; i++)
      {
        flag[ip + i] |= FL_CODE | FL_ANALYZED;
        flag[ip + i] &= ~(FL_OPCODE | FL_NEXT);
      }
      flag[ip] |= FL_OPCODE;

      if (nxt == NONE)
      {
        flag[ip] |= FL_STOP;
        break;
      }

      ip = nxt;

#ifdef CODEFIRST
      if (ip - oe[0].oe_virtrva > oe[0].oe_physsize)
#else
      if (ip > pe->pe_imagesize)
#endif
        break;

      if (flag[ip] & FL_CODE) break;

    } // cycle until RET
c3:
  } // main cycle

#ifdef DUMP_MSG
  printf("þ sigman(1)\n");
#endif // DUMP_MSG

  if (user_sigman != NULL)
  {
    user_sigman(user_arg, pe, oe, memb, flag, 1);
    // no error-checking
  }

#ifdef DUMP_MSG
  printf("þ building tree\n");
#endif // DUMP_MSG

  root = NULL;
  for (  DWORD i = 0;
         (i < pe->pe_imagesize) || ((i == pe->pe_imagesize) && flag[i]);   )
  {

    DWORD l;
    if (flag[i] & (FL_SECTALIGN | FL_LABEL))
      l = 0;
    else
    if (flag[i] & (FL_RVA | FL_DELTA | FL_FIXUP))
      l = 4;
    else
    if (flag[i] & FL_OPCODE)
    {
      l = user_disasm(user_arg, &memb[i] );
      for (DWORD t=1; t<l; t++)
        if (flag[i+t] != (FL_CODE | FL_ANALYZED | FL_PRESENT | FL_VPRESENT))
        {
//        flag[i] |= FL_BREAKED;
          l = t;
          break;
        }
    }
    else
    {
      for (l=1; (flag[i] == flag[i+l]) && (i+l < pe->pe_imagesize); l++) ;
      flag[i] |= FL_DATA;
    }

    hooy* t = (hooy*) user_malloc(user_arg,sizeof(hooy));
    if (t==0) return ERR_NOMEMORY;
    t->flags = flag[i];
    t->oldrva = i;
    t->datalen = l;
    if (l)
    {
      t->dataptr = (BYTE*) user_malloc(user_arg,l);
      if (t->dataptr==0) return ERR_NOMEMORY;
      my_memcpy(t->dataptr, &memb[i], l);
    }
    else
      t->dataptr = NULL;
    t->arg1 = arg1[i];
    t->arg2 = arg2[i];
    t->next = NULL;

    if (flag[i] & FL_SECTALIGN)
    {
      t->flags &=   FL_SECTALIGN;
      flag[i]  &= ~(FL_SECTALIGN);
    }
    else
    if (flag[i] & FL_LABEL)
    {
      t->flags &=   FL_LABEL | FL_CREF | FL_DREF;
      flag[i]  &= ~(FL_LABEL | FL_CREF | FL_DREF);
    }

    if (root == NULL)
      root = tail = t;
    else
      tail = tail->next = t;

    i += l;
  }

#ifdef DUMP_LOG
  dump(root,"mistfall1.log");
#endif // DUMP_LOG

#ifdef DUMP_MSG
  printf("þ calling mutate()\n");
#endif // DUMP_MSG

  int res = user_mutate(user_arg,pe,oe,root,user_disasm,user_malloc,user_random);
  if (res != ERR_SUCCESS)
    return res;

  int rebuild_fixups = user_random(user_arg,2);     // 1=rebuild 0=remove

re:
#ifdef DUMP_MSG
  printf("þ recalculating addresses\n");
#endif // DUMP_MSG

  my_memset(fasthooy, 0, 4*(pe->pe_imagesize + 1));

  DWORD v = 0, p = 0;
  for (hooy* h = root; h; h=h->next)
  {
    if (h->flags & FL_LABEL)
      fasthooy[h->oldrva] = h;

    h->newrva = v;
    h->newofs = p;

    if (h->flags & FL_SECTALIGN)
    {
      v = align(v, pe->pe_objectalign);
      p = align(p, pe->pe_filealign);
    }
    else
    {
      if (h->flags & FL_VPRESENT) v += h->datalen;
      if (h->flags & FL_PRESENT)  p += h->datalen;
    }
  }

#ifdef DUMP_MSG
  printf("þ rebuilding fixup table\n");
#endif // DUMP_MSG

  if (rebuild_fixups==1)
  {

      // find entry that describes whole fixup structure
      hooy* x = hooybyoldrvaEx(root, pe->pe_fixuprva, FL_DATA);

      if (x->datalen < MAX_FIXUP_SIZE)
      {
        x->datalen = MAX_FIXUP_SIZE;
        x->dataptr = (BYTE*) user_malloc(user_arg,x->datalen);
        if (x->dataptr==0) return ERR_NOMEMORY;
      }

      DWORD xptr = 0, o = 0, xbase;
      for (hooy* h=root; h; h=h->next)
      {
        if (h->flags & FL_FIXUP)
        {
          if (o == 0)
          {
    c7:     xbase = h->newrva & 0xFFFFF000;
            *(DWORD*)&(x->dataptr[xptr+0]) = xbase;
            o = 8;
          }
          if (h->newrva - xbase > 0xFFF)
          {
            *(DWORD*)&(x->dataptr[xptr+4]) = o;
            xptr += o;
            goto c7;
          }
          if (xptr+o+2 >= MAX_FIXUP_SIZE)
            return ERR_BADFILE;
          *(WORD*)&(x->dataptr[xptr+o]) = (h->newrva - xbase) | 0x3000;
          o += 2;
        }
      }
      if (o != 0)
      {
        *(DWORD*)&(x->dataptr[xptr+4]) = o;
        xptr += o;
      }

      x->datalen = xptr;

      if (xptr==0)
        return ERR_BADFILE;         // new fixup table size == 0

      x = hooybyoldrvaEx(root, pe0+0xA4, FL_DELTA);   //A4=fixupsize
      if (*(DWORD*)x->dataptr != xptr)
      {
        *(DWORD*)x->dataptr = xptr;
        goto re;
      }

  }//1/2
  if (rebuild_fixups == 0)
  {
      rebuild_fixups = -1;       // alredy removed!

      hooy *a, *b, *x;

      // .reloc section data
      a = hooybyoldrvaEx(root, pe->pe_fixuprva, FL_SECTALIGN);
      for(b=a->next; (b->flags & FL_SECTALIGN) == 0; b=b->next) ;
      my_memcpy(a, b, sizeof(hooy));

      // .reloc section object entry
      a = hooybyoldrvaEx(root, oe0+0x28*(pe->pe_numofobjects-1)+0x00, FL_DATA);
      b = hooybyoldrvaEx(root, oe0+0x28*(pe->pe_numofobjects-1)+0x28, FL_DATA);
      my_memcpy(a, b, sizeof(hooy));

      // fixup rva/size
      x = hooybyoldrvaEx(root, pe0+0xA0, FL_RVA);     //A0=fixuprva
      x->flags ^= FL_RVA;
      *(DWORD*)x->dataptr = 0;
      x->datalen = 4;
      x = hooybyoldrvaEx(root, pe0+0xA4, FL_DELTA);   //A4=fixupsize
      x->flags ^= FL_DELTA ^ FL_DATA;
      *(DWORD*)x->dataptr = 0;
      x->datalen = 4;

      // pe header entries
      x = root;
      x->dataptr[pe0+0x06]--;                         // numofobjects
      pe->pe_numofobjects--;
      *(WORD*)&x->dataptr[pe0+0x16] |= 1;             // relocs stripped

  }

#ifdef DUMP_MSG
  printf("þ recalculating pointers\n");
#endif // DUMP_MSG

  int expanded = 0;

#define sethooy(x,y)  hooy* x = (y) <= pe->pe_imagesize ? fasthooy[ y ] : NULL;

  for (hooy* h = root; h; h=h->next)
  {
    if (h->flags & FL_RVA)
    {
      sethooy(h1, h->arg1);
      if (h1)
      if (h->flags & FL_PHYS)
        *(DWORD*)h->dataptr = h1->newofs;
      else
        *(DWORD*)h->dataptr = h1->newrva;
    }
    if (h->flags & FL_FIXUP)
    {
      sethooy(h1, h->arg1);
      if (h1)
      *(DWORD*)h->dataptr = h1->newrva + pe->pe_imagebase;
    }
    if (h->flags & FL_DELTA)
    {
      sethooy(h1, h->arg1);
      sethooy(h2, h->arg2);
      if (h1)
      if (h2)
      if (h->flags & FL_PHYS)
        *(DWORD*)h->dataptr = h2->newofs - h1->newofs;
      else
        *(DWORD*)h->dataptr = h2->newrva - h1->newrva;
    }
    if (h->flags & FL_RES8)
    {
      *(DWORD*)h->dataptr |= 0x80000000;
    }
    if (h->flags & FL_FORCEOBJALIGN)
    {
      *(DWORD*)h->dataptr = align(*(DWORD*)h->dataptr, pe->pe_objectalign);
    }
    if (h->flags & FL_FORCEFILEALIGN)
    {
      *(DWORD*)h->dataptr = align(*(DWORD*)h->dataptr, pe->pe_filealign);
    }
    if (h->flags & FL_HAVEREL)
    {
      sethooy(h1, h->arg1);
      if (h1)
      {
        DWORD t = h1->newrva - (h->newrva + h->datalen);

        if (h->arg2 == 1)
        {
          if ((long)t != (char)t)
          {
            if (h->dataptr[0] == 0xEB)
            {
              h->dataptr[0]=0xE9;
              h->datalen=5;
            }
            else
            if ((h->dataptr[0] & 0xF0) == 0x70)
            {
              h->dataptr[1]=h->dataptr[0]^0x70^0x80;
              h->dataptr[0]=0x0F;
              h->datalen=6;
            }
            else
            if (h->dataptr[0]==0xE3)
            {
#ifdef DUMP_MSG
              printf("expanding JECXZ at .%08X\n", h->oldrva);
#endif // DUMP_MSG
              h->dataptr[0]=0x09;     // or ecx, ecx
              h->dataptr[1]=0xC9;
              h->dataptr[2]=0x0F;     // jz
              h->dataptr[3]=0x84;
              h->datalen=2+6;
            }
            else
            if (h->dataptr[0]==0xE2)
            {
#ifdef DUMP_MSG
              printf("expanding LOOP at .%08X\n", h->oldrva);
#endif // DUMP_MSG
              h->dataptr[0]=0x49;     // dec ecx
              h->dataptr[1]=0x0F;     // jnz
              h->dataptr[2]=0x85;
              h->datalen=1+6;
            }
            else
            {
#ifdef DUMP_MSG
              printf("short-rel-arg error at .%08X\n", h->oldrva);
#endif // DUMP_MSG
              return ERR_SHORTSUX;
            }
            h->arg2 = 4;
            expanded++;
          }
          else
            h->dataptr[h->datalen-1] = t;
        }

        if (h->arg2 == 4)
        {
          *(DWORD*)&(h->dataptr[h->datalen-4]) = t;
        }
      }
    }
  } // for h

  if (expanded)
  {
#ifdef DUMP_MSG
    printf("+pass\n");
#endif // DUMP_MSG
    goto re;
  }

#ifdef DUMP_MSG
  printf("þ assembling\n");
#endif // DUMP_MSG

  for (hooy* h=root; h; h=h->next)
    p = h->newofs;
  p = align(p, pe->pe_filealign);
  if (p + ovr_size > maxbufsize)
  {
#ifdef DUMP_MSG
    printf("engine: not enough maxbufsize\n");
#endif // DUMP_MSG
    return ERR_NOMEMORY;
  }

  DWORD p0 = p;
  if (ovr_size > 0)
  {
#ifdef DUMP_MSG
    printf("new overlay offs at %08X\n", p);
#endif // DUMP_MSG
    my_memcpy(&buf[p], &buf[ovr_offs], ovr_size);
    p += ovr_size;
  }
  my_memset(buf, 0, p0);

  *outbufsize = p;

  for (hooy* h = root; h; h=h->next)
  if (h->flags & FL_PRESENT)
  {
    my_memcpy(&buf[h->newofs], h->dataptr, h->datalen);
  }

#ifdef DUMP_MSG
  printf("þ recalculating checksum\n");
#endif

  mz = (MZ_HEADER*) &buf[0];
  pe = (PE_HEADER*) &buf[ mz->mz_neptr ];
  if (pe->pe_checksum != 0)
  {
    pe->pe_checksum = 0;
    pe->pe_checksum = calc_csum(buf, p);
  }

#ifdef DUMP_LOG
  dump(root,"mistfall2.log");
#endif // DUMP_LOG

#ifdef DUMP_MSG
  printf("þ complete\n");
#endif // DUMP_MSG

  return ERR_SUCCESS;
} // engine

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

hooy* __fastcall hooybyoldrvaEx(hooy* root, DWORD oldrva, DWORD needflags)
{
  for (hooy* h=root; h; h=h->next)
    if (h->flags & needflags)
    if (h->oldrva == oldrva)
      return h;
#ifdef DUMP_MSG
  printf("oldrva error at .%08X\n",oldrva);
#endif
  return NULL;
}

hooy* __fastcall hooybyoldrva(hooy* root, DWORD oldrva)
{
  return hooybyoldrvaEx(root, oldrva, FL_LABEL);
}

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

void __fastcall process_import(PE_HEADER* pe,
                    BYTE* memb,
                    DWORD* flag,
                    DWORD* arg1,
                    DWORD a)
{
  if (memd[a] == 0) return;
  markrvadata(a);
  a = memd[a];
  while (memd[a])
  {
    if (memd[a] < pe->pe_imagesize)
      markrvadata(a);
    a += 4;
  } // while
} // process_import

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

void __fastcall process_rsrc(PE_HEADER *pe,
                  BYTE* memb,
                  DWORD* flag,
                  DWORD* arg1,
                  DWORD* arg2,
                  DWORD x)
{
// 00h  DWord  Flags
// 04h  DWord  Time/Date Stamp
// 08h  Word   Major Version
// 0Ah  Word   Minor Version
// 0Ch  Word   Name Entry
// 0Eh  Word   ID_Num Entry
//
  DWORD c = memw[x + 0x0C] + memw[x + 0x0E];
  DWORD t = x + 0x10;
  while (c--)
  {
    if (memd[t] & 0x80000000)
    {
      flag[t] |= FL_RES8;
      DWORD q = memd[t] & 0x7FFFFFFF;
      markdelta(t, pe->pe_resourcerva, q);
    }
    t += 4;
    if (memd[t] & 0x80000000)
    {
      flag[t] |= FL_RES8;
      DWORD q = memd[t] & 0x7FFFFFFF;
      markdelta(t, pe->pe_resourcerva, q);
      process_rsrc(pe,memb,flag,arg1,arg2, pe->pe_resourcerva + q);
    }
    else
    {
      markdelta(t, pe->pe_resourcerva, memd[t]);
      markrvadata(pe->pe_resourcerva + memd[t]);
    }
    t += 4;
  } // while
} // process_rsrc

DWORD __fastcall calc_csum(BYTE* buf, DWORD size)
{
  WORD csum = 0;
  for (DWORD i=0; i<size; i+=2)
  {
    csum += *(WORD*)&buf[i];
    csum += _FLAGS & 1;         // to be compiled with Borland-C
  }
  return csum+size;
}

void __fastcall my_memcpy(void *dest, void *src, DWORD n)
{
  while (n--) *((BYTE*)dest)++ = *((BYTE*)src)++;
}
void __fastcall my_memset(void *dest, int c, DWORD n)
{
  while (n--) *((BYTE*)dest)++ = c;
}

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

#ifdef DUMP_LOG

void __fastcall dump(hooy* root,char* fname)
{
#ifdef DUMP_MSG
  printf("þ dump (%s)\n",fname);
#endif
  FILE*f=fopen(fname,"wb");
  assert(f);
  for (hooy* h=root; h; h=h->next)
  {
    fprintf(f,"%08X %08X %08X: ",h->oldrva,h->newrva,h->newofs);
    if (h->flags&FL_SECTALIGN)
    {
      fprintf(f,"SECTALIGN\n");
    }
    else
    if (h->flags&FL_LABEL)
    {
      fprintf(f,"LABEL");
      if (h->flags&FL_CREF) fprintf(f,", CREF");
      if (h->flags&FL_DREF) fprintf(f,", DREF");
      if (h->flags&FL_DATA) fprintf(f,", DATA");
      fprintf(f," (flag=%08X)\n",h->flags);
    }
    else
    if (h->flags&FL_DELTA)
    {
       fprintf(f,"DELTA %08X    /*%08X..%08X*/ ",
         *(DWORD*)h->dataptr, h->arg1,h->arg2);
       if (h->flags&FL_RES8) fprintf(f," [RES8]");
       fprintf(f,"\n");
    }
    else
    if (h->flags&FL_RVA)
    {
      fprintf(f,"RVA %08X\n",*(DWORD*)h->dataptr);
    }
    else
    if (h->flags&FL_FIXUP)
    {
      fprintf(f,"FIXUP %08X\n",h->arg1);
    }
    else
    if (h->flags&FL_OPCODE)
    {
      fprintf(f,"OPCODE ");
      for (DWORD i=0; i<h->datalen; i++)
        fprintf(f," %02X",h->dataptr[i]);
      fprintf(f,"\n");
    }
    else
    if (h->flags&FL_DATA)
    {
      fprintf(f,"DATA (%04X) ",h->datalen);
      for (DWORD i=0; i<MIN(h->datalen,8); i++)
        fprintf(f," %02X",h->dataptr[i]);
      if (h->datalen>8) fprintf(f," ...");
      fprintf(f,"\n");
    }
    else
    __emit__(0xcc);
  } // for h

  fclose(f);
} //dump

#endif // DUMP_LOG

////////x///////x///////x///////x///////x///////x///////x///////x///////x////

void id2() { __emit__( 0xEB,0x02,0xFF,2 ); }

////////x///////x///////x///////x///////x///////x///////x///////x///////x////
