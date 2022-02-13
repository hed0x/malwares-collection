#define NONE                    0xFFFFFFFF
#define memw                    *(WORD*)&memb
#define memd                    *(DWORD*)&memb
#define ALIGN(x,y)              (((x)+(y)-1)&(~((y)-1)))
#define MIN(x,y)                ((x)<(y)?(x):(y))
#define MAX(x,y)                ((x)>(y)?(x):(y))

CMistfall::CMistfall()
{
  memset(this, 0x00, sizeof(CMistfall));
} // CMistfall::CMistfall()

CMistfall::~CMistfall()
{
  xfree( (void**)&ade32_table );
  xfree( (void**)&i_phys_mem );
  xfree( (void**)&o_phys_mem );
  xfree( (void**)&memb );
  xfree( (void**)&flag );
  xfree( (void**)&arg1 );
  xfree( (void**)&arg2 );
  xfree( (void**)&fasthooy );
  xfree( (void**)&edit_header );
  free_list();

#ifdef DUMP_MSG
  if (xmemsize != 0)
    printf("ERROR:xmemsize=%i\n", xmemsize);   // must be 0
#endif

} // CMistfall::~CMistfall()

void CMistfall::free_list()
{
  if (root)
  for(HOOY*h=root; h; )
  {
    if ((h->flags & FL_HEADER)==0)
      xfree((void**)&h->dataptr);
    HOOY* h0 = h->next;
    xfree((void**)&h);
    h = h0;
  }
  root = tail = NULL;
} // CMistfall::free_list()

void* CMistfall::xalloc(DWORD size)
{
  xmemsize++;
  return (void*)GlobalAlloc( GMEM_ZEROINIT,size );
} // CMistfall::xalloc()

void CMistfall::xfree(void** ptr)
{
  if (*ptr == NULL) return;
  GlobalFree(*ptr);
  *ptr = NULL;
  xmemsize--;
} // CMistfall::xfree()

void* CMistfall::xrealloc(void* ptr, DWORD size)
{
  if (ptr != NULL)
  {
    GlobalFree(ptr);
    xmemsize--;
  }
  return xalloc(size);
} // CMistfall::realloc()

int CMistfall::LoadFile(char* fname)
{
  FILE* f = fopen(fname, "rb");
  if (f == NULL) return MF_ERR_CANTOPENFILE;

  i_phys_len = filelength(fileno(f));
  if ( (i_phys_len < MF_PHYSFILE_MIN_SIZE) ||
       (i_phys_len > MF_PHYSFILE_MAX_SIZE) )
  {
    fclose(f);
    return MF_ERR_BADFILESIZE;
  }

  i_phys_mem = (BYTE*)xrealloc( i_phys_mem, i_phys_len+1 );
  if (i_phys_mem == NULL)
  {
    fclose(f);
    return MF_ERR_NOMEMORY;
  }

  fread(i_phys_mem, 1, i_phys_len, f);

  fclose(f);

  return MF_ERR_SUCCESS;
} // CMistfall::LoadFile()

int CMistfall::SaveFile(char* fname)
{
  if (o_phys_mem == NULL) return MF_ERR_NOTASSEMBLED;
  FILE* f = fopen(fname, "wb");
  if (f == NULL) return MF_ERR_CANTCREATEFILE;
  fwrite(o_phys_mem, 1, o_phys_len, f);
  fclose(f);
  return MF_ERR_SUCCESS;
} // CMistfall::LoadFile()

DWORD CMistfall::disasm_opcode( BYTE* opcode, disasm_struct* ds )
{
  if (ade32_table == NULL)
  {
    ade32_table = (DWORD*)xalloc( 512*4 );
    if (ade32_table == NULL)
      return 0;
    ade32_init( ade32_table );
  }
  ds->disasm_defdata = 4;
  ds->disasm_defaddr = 4;
  return ade32_disasm( opcode, ds, ade32_table );
} // CMistfall::disasm_opcode()

void CMistfall::process_import(DWORD addr)
{
  if (memd[addr] == 0) return;
  markrvadata(addr);
  addr = memd[addr];
  while (memd[addr])
  {
    if (memd[addr] < pe->pe_imagesize)
      markrvadata(addr);
    addr += 4;
  } // while
} // CMistfall::process_import()

void CMistfall::process_rsrc(DWORD addr)
{
// 00h  DWord  Flags
// 04h  DWord  Time/Date Stamp
// 08h  Word   Major Version
// 0Ah  Word   Minor Version
// 0Ch  Word   Name Entry
// 0Eh  Word   ID_Num Entry
//
  DWORD c = memw[addr + 0x0C] + memw[addr + 0x0E];
  DWORD t = addr + 0x10;
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
      process_rsrc( pe->pe_resourcerva + q );
    }
    else
    {
      markdelta(t, pe->pe_resourcerva, memd[t]);
      markrvadata(pe->pe_resourcerva + memd[t]);
    }
    t += 4;
  } // while
} // CMistfall::process_rsrc()

void CMistfall::DumpLog(char* logfile)
{
  FILE*f=fopen(logfile, "wb");
  if (f==NULL) return;

  for (HOOY* h=root; h; h=h->next)
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
} // CMistfall::DumpLog()


int CMistfall::Disasm(DWORD dflags)
{
  disasm_struct diza;

#ifdef DUMP_MSG
  printf("+ checking file format\n");
#endif // DUMP_MSG

  // check file format

  mz = (MZ_HEADER*) &i_phys_mem[0];

  if ( (mz->mz_id != 'MZ') ||
       (mz->mz_neptr & 3)  ||
       (mz->mz_neptr <  sizeof(MZ_HEADER)) ||
       (mz->mz_neptr + 1024 >= i_phys_len) )
    return MF_ERR_BADMZHDR;

  pe = (PE_HEADER*) &i_phys_mem[ mz->mz_neptr ];

  if (pe->pe_id != 'PE\x00\x00')
    return MF_ERR_BADPEHDR;

  if (pe->pe_ntheadersize != 0xE0)
    return MF_ERR_BADPEHDR;

  if ((pe->pe_fixuprva==0) || (pe->pe_flags & 1))
    return MF_ERR_NOFIXUPS;

  if ( (pe->pe_numofobjects == 0) ||
       (pe->pe_numofobjects > MF_PE_MAXSECTIONS) )
    return MF_ERR_BADNSECT;

  if (pe->pe_headersize > MIN(i_phys_len, pe->pe_imagesize))
    return MF_ERR_BADPEHDR;

  oe = (PE_OBJENTRY*) &i_phys_mem[ mz->mz_neptr + sizeof(PE_HEADER) ];

  for(DWORD n=0; n<(DWORD)pe->pe_numofobjects; n++)
  {
    if ( (oe[n].oe_physoffs == 0) ||
         (oe[n].oe_physsize == 0) ||
         (oe[n].oe_virtrva  == 0) ||
         (oe[n].oe_virtsize == 0) )
      return MF_ERR_BADOBJTABLE;
    // force alignment
    oe[n].oe_virtsize = ALIGN(oe[n].oe_virtsize, pe->pe_objectalign);
    oe[n].oe_physsize = ALIGN(oe[n].oe_physsize, pe->pe_filealign);
  }

  // calc ovr. params
  DWORD t = pe->pe_numofobjects - 1;
  ovr_offs = oe[t].oe_physoffs + oe[t].oe_physsize;
  ovr_size = i_phys_len - ovr_offs;
  if ((signed)ovr_size < 0)
    return MF_ERR_BADOVRSIZE;

  // check if overlay is just zero-bytes alignment at end of file
  t = 0;
  for (DWORD i=0; i<ovr_size; i++)
    t |= i_phys_mem[ovr_offs + i];
  if (t == 0)
    ovr_size = 0;

  if (dflags & DF_STDSECT)
  {
    for(DWORD n=0; n<(DWORD)pe->pe_numofobjects; n++)
    {
      DWORD t = ~( *(DWORD*)&oe[n].oe_name[0] ^      // 8 bytes
                   *(DWORD*)&oe[n].oe_name[4] );
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
        return MF_ERR_BADSECTNAME;
      }
    } // for n
  } // DF_STDSECT

#ifdef DUMP_MSG
  printf("+ allocating virtual memory\n");
#endif // DUMP_MSG

  // allocate virtual memory

  if (pe->pe_imagesize > MF_PE_MAXIMAGESIZE)
    return MF_ERR_BADIMAGESIZE;

  t = pe->pe_imagesize + 1;  // +1 because we may have last virtual entry

  memb = (BYTE*)xrealloc(memb, t);
  if (memb == NULL) return MF_ERR_NOMEMORY;

  t <<= 2; // now allocating DWORDs

  flag = (DWORD*)xrealloc(flag, t);
  if (flag == NULL) return MF_ERR_NOMEMORY;

  arg1 = (DWORD*)xrealloc(arg1, t);
  if (arg1 == NULL) return MF_ERR_NOMEMORY;

  arg2 = (DWORD*)xrealloc(arg2, t);
  if (arg2 == NULL) return MF_ERR_NOMEMORY;

#ifdef DUMP_MSG
  printf("+ loading into virtual addresses\n");
#endif // DUMP_MSG

  // load into virtual addresses

  memcpy(memb, i_phys_mem, pe->pe_headersize);
  for (DWORD i=0; i<pe->pe_headersize; i++)
    flag[i] |= FL_PRESENT | FL_VPRESENT;

  for(DWORD n=0; n<(DWORD)pe->pe_numofobjects; n++)
  {
    // copy section image
    memcpy(&memb[ oe[n].oe_virtrva ],
           &i_phys_mem[ oe[n].oe_physoffs ],
           MIN(oe[n].oe_physsize, oe[n].oe_virtsize));
    // set presence flags
    for (DWORD i=0; i<oe[n].oe_physsize; i++)
      flag[oe[n].oe_virtrva + i] |= FL_PRESENT;
    for (DWORD i=0; i<oe[n].oe_virtsize; i++)
      flag[oe[n].oe_virtrva + i] |= FL_VPRESENT;
  } // for n

  // analyze PE structure

#ifdef DUMP_MSG
  printf("+ PE header\n");
#endif // DUMP_MSG

  // PE header

  t = mz->mz_neptr + sizeof(PE_HEADER);

  for (DWORD n=0; n<(DWORD)pe->pe_numofobjects; n++)
  {
    flag[oe[n].oe_virtrva] |= FL_SECTALIGN;

    markdelta(t+0x08, oe[n].oe_virtrva, oe[n].oe_virtsize); // 08=virtsize

    markrva(t+0x0C);                                        // 0C=virtrva

    markdelta(t+0x10, oe[n].oe_virtrva, oe[n].oe_physsize); // 10=physsize
    flag[t+0x10] |= FL_PHYS | FL_FORCEFILEALIGN;            // 10=physsize

    flag[t+0x14] |= FL_PHYS | FL_RVA;                       // 14=physoffs
    arg1[t+0x14] = oe[n].oe_virtrva;                        // 14=physoffs

    t += sizeof(PE_OBJENTRY);
  }
  flag[pe->pe_imagesize] |= FL_SECTALIGN;

  t = mz->mz_neptr;

  if (pe->pe_entrypointrva)
    markrva(t + 0x28);                 // EntryPointRVA

  markrva(t + 0x2C);                   // 2C=baseofcode
  markrva(t + 0x30);                   // 30=baseofdata

  markdelta(t+0x1C, pe->pe_baseofcode, pe->pe_sizeofcode); // 1C=sizeofcode
  flag[t+0x1C] |= FL_FORCEOBJALIGN;

//markdelta(t+0x20, pe->pe_baseofdata, pe->pe_sizeofidata);// 20=sizeofidata
//flag[t+0x20] |= FL_FORCEOBJALIGN;

  markrva(t + 0x50);                       // 50=imagesize
  markrvadata(t + 0x54);                   // 54=headersize

  for(DWORD i=0; i<pe->pe_numofrvaandsizes; i++)
  {
    t = mz->mz_neptr + 0x78 + i * 8;              // rva/size #i
    if ( memd[t] )
    {
      markrvadata(t);
      markdelta(t+4, memd[t], memd[t+4]);
      for (DWORD i=memd[t]; i<memd[t]+memd[t+4]; i++)
        flag[i] |= FL_DATA;
    }
  }

  // import

  if (pe->pe_importrva)
  {
#ifdef DUMP_MSG
  printf("+ imports\n");
#endif // DUMP_MSG

    DWORD imp0 = pe->pe_importrva;
    flag[imp0] |= FL_LABEL;
    while ( memd[imp0 + 0x10] )              // 10=addresstable
    {
      process_import(imp0 + 0x00);           // 00=lookup
      process_import(imp0 + 0x10);           // 10=addresstable
      markrvadata(imp0 + 0x0C);              // 0C=name
      imp0 += sizeof(PE_IMPORT);
    }
  }

  // export

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

  // fixups

  if ((pe->pe_fixuprva) && ((pe->pe_flags & 1)==0))
  {
#ifdef DUMP_MSG
  printf("+ fixups\n");
#endif // DUMP_MSG

    DWORD fixupcount = 0;

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
//#ifdef NEWBASE
//        memd[j] = memd[j] - pe->pe_imagebase + NEWBASE;
//#endif
        }
      k += fx->fx_blocksize;
      (DWORD)fx += fx->fx_blocksize;
    }
//#ifdef NEWBASE
//  pe->pe_imagebase = NEWBASE;
//#endif

    if (fixupcount == 0)
      return MF_ERR_NOFIXUPS; // # fixups == 0
  }

  // resources

  if (pe->pe_resourcerva)
  {
#ifdef DUMP_MSG
  printf("+ resources\n");
#endif // DUMP_MSG

    process_rsrc( pe->pe_resourcerva );
  }

  // sigman-1

#ifdef DUMP_MSG
  printf("+ analyzing code\n");
#endif // DUMP_MSG

  // analyze code

  DWORD code_start;
  DWORD code_end;
  if (dflags & DF_CODEFIRST)
  {
    code_start = oe[0].oe_virtrva;
    code_end   = oe[0].oe_virtrva + oe[0].oe_physsize;
  }
  else
  {
    code_start = pe->pe_headersize;
    code_end   = pe->pe_imagesize - 16;
  }

  if (pe->pe_entrypointrva)
    flag[ pe->pe_entrypointrva ] |= FL_NEXT;

  DWORD ip;

  // find & mark subroutines

  for (ip = code_start; ip < code_end; ip++)
  {
    if (~(memd[ip] & 0x00FFFFFF) == ~0x00EC8B55U) // to avoid fail on self
      flag[ip] |= FL_NEXT;
    if (memw[ip] == 0x8B55)
      if (flag[ip] & FL_DREF)
        flag[ip] |= FL_NEXT;
  } // for ip

#ifdef DUMP_MSG
  printf("+ disassembling\n");
#endif // DUMP_MSG

  // disassemble

  for (;;)
  {

    for (ip = 0; ip < pe->pe_imagesize; ip++)
      if (flag[ip] & FL_NEXT)
        goto c1;

    if (dflags & DF_TRY_DREF)
    {
      for (ip = code_start; ip < code_end; ip++)
      if (flag[ip] & FL_DREF)
      if (!(flag[ip] & (FL_NEXT | FL_ANALYZED | FL_FIXUP | FL_DATA)))
      if (memb[ip] != 0x00)
      {

        flag[ip] |= FL_ANALYZED;

        DWORD j = ip;
        for (/*int opcount=0*/; j < pe->pe_imagesize - 16; /*opcount++*/)
        {
          DWORD len = disasm_opcode( &memb[j], &diza );
          if (len==0) break;

          if (diza.disasm_flag & C_BAD) break;

          DWORD rel = NONE;
          if (diza.disasm_flag & C_REL)
          {
            if (diza.disasm_datasize == 1) rel = j + len + diza.disasm_data_c[0];
            if (diza.disasm_datasize == 2) rel = j + len + diza.disasm_data_s[0];
            if (diza.disasm_datasize == 4) rel = j + len + diza.disasm_data_l[0];
          }

          if (rel != NONE)
          {
            if (rel > code_end)
              break;
            if (flag[rel] & (FL_DATA | FL_FIXUP))
              break;
            if ( (flag[rel] & FL_CODE) && (!(flag[rel] & FL_OPCODE)) )
              break;
          }

          if (   (diza.disasm_flag & C_STOP) ||
                 (flag[j] & FL_OPCODE)   )
          {
  //        if (opcount < 2) break;
            flag[ip] |= FL_NEXT;
            goto c1;
          }

          if (flag[j] & (FL_DATA | FL_FIXUP))
            break;

          for (DWORD i=j+1; i<j+len; i++)
            if ( flag[i] & (FL_LABEL|FL_OPCODE|FL_DATA) )
              goto c2;

          if (len>4)
          for (DWORD i=j+len-3; i<j+len; i++)
            if ( flag[i] & FL_FIXUP )
              goto c2;

          j += len;

          if (j > code_end)
            break;

        }
  c2:
      } // FL_DREF
    } // DF_TRY_DREF

    if (dflags & DF_TRY_RELREF)
    {
      for (ip = code_start; ip < code_end; ip++)
      if (!(flag[ip] & FL_ANALYZED))
      {
        DWORD rel = NONE, arg = 0;
        BYTE o = memb[ip];
        WORD w = memw[ip];
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
        if (rel < code_end)
          if (flag[rel] & FL_OPCODE)
          {
            flag[ip] |= FL_NEXT;
            goto c1;
          }
      }
    } // DF_TRY_RELREF

    break;

c1:

    for (;;)
    {
      flag[ip] &= ~FL_NEXT;
      flag[ip] |= FL_ANALYZED;

      if (ip == 0) break;

      DWORD len = disasm_opcode( &memb[ip], &diza );
      if (len==0) break;

      for (DWORD i = 1; i < len; i++)
        if (flag[ip + i] & (FL_LABEL | FL_CODE | FL_OPCODE | FL_ANALYZED))
        if (!(flag[ip + i] & (FL_FIXUP | FL_SIGNATURE)))
        {
          if (dflags & DF_ENABLE_ERRDISASM)
            return MF_ERR_DISASM;
          else
            goto c3;
        }

      DWORD nxt = ip + len;
      DWORD rel = NONE;

      if (diza.disasm_flag & C_REL)
      {
        if (diza.disasm_datasize == 1) // jcc,jcxz,loop/z/nz,jmps
        {
          rel = nxt + diza.disasm_data_c[0];
          arg2[ip] = 1;
        }
        if (diza.disasm_datasize == 2) break;
        if (diza.disasm_datasize == 4) // jcc near,call,jmp
        {
          rel = nxt + diza.disasm_data_l[0];
          arg2[ip] = 4;
        }
      }

      if (diza.disasm_flag & C_STOP)
        nxt=NONE; // ret/ret#/retf/retf#/iret/jmp modrm

      if (rel != NONE)
      {
        if (rel > code_end)
        {
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

      if (ip > code_end)
        break;

      if (flag[ip] & FL_CODE) break;

    } // cycle until RET
c3:
  } // main cycle

  // sigman-2

#ifdef DUMP_MSG
  printf("+ building tree\n");
#endif // DUMP_MSG

  // build tree

  edit_header = (BYTE*)xrealloc(edit_header, pe->pe_headersize);
  if (edit_header == NULL) return MF_ERR_NOMEMORY;
  memcpy(edit_header, memb, pe->pe_headersize);

  edit_mz = (MZ_HEADER*)   &edit_header[ 0 ];
  edit_pe = (PE_HEADER*)   &edit_header[ edit_mz->mz_neptr ];
  edit_oe = (PE_OBJENTRY*) &edit_header[ edit_mz->mz_neptr + sizeof(PE_HEADER) ];

  free_list();

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
      l = disasm_opcode( &memb[i], &diza );
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

    HOOY* t = (HOOY*)xalloc( sizeof(HOOY) );
    if (t==0) return MF_ERR_NOMEMORY;
    t->flags = flag[i];
    t->oldrva = i;
    t->datalen = l;
    if (l)
    {
      if (t->oldrva < pe->pe_headersize)
      {
        t->flags |= FL_HEADER;
        t->dataptr = &edit_header[i];
      }
      else
      {
        t->dataptr = (BYTE*) xalloc( l );
        if (t->dataptr==0) return MF_ERR_NOMEMORY;
        memcpy(t->dataptr, &memb[i], l);
      }
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

  xfree((void**)&memb);
  xfree((void**)&flag);
  xfree((void**)&arg1);
  xfree((void**)&arg2);

  return MF_ERR_SUCCESS;
} // CMistfall::Disasm()

HOOY* CMistfall::hooybyoldrva(DWORD oldrva, DWORD needflags)
{
  for (HOOY* h=root; h; h=h->next)
    if (h->flags & needflags)
    if (h->oldrva == oldrva)
      return h;
  return NULL;
} // hooybyoldrva

int CMistfall::Asm()
{
#ifdef DUMP_MSG
  printf("+ asm()\n");
#endif // DUMP_MSG

  fasthooy = (HOOY**)xrealloc( fasthooy, (pe->pe_imagesize+1)*4 );
  if (fasthooy == NULL) return MF_ERR_NOMEMORY;

  // find entry that describes whole fixup structure
  HOOY* fxrva  = hooybyoldrva(pe->pe_fixuprva, FL_DATA);
  if (fxrva==NULL) return MF_ERR_INTERNAL1;
  HOOY* fxsize = hooybyoldrva(mz->mz_neptr+0xA4, FL_DELTA);   //A4=fixupsize
  if (fxsize==NULL) return MF_ERR_INTERNAL2;

re:
#ifdef DUMP_MSG
  printf("+ recalculating addresses\n");
#endif // DUMP_MSG

  // recalculate addresses

  memset(fasthooy, 0x00, (pe->pe_imagesize+1)*4);

  DWORD v = 0, p = 0;
  for (HOOY* h = root; h; h=h->next)
  {
    if (h->flags & FL_LABEL)
      fasthooy[h->oldrva] = h;

    h->newrva = v;
    h->newofs = p;

    if (h->flags & FL_SECTALIGN)
    {
      v = ALIGN(v, pe->pe_objectalign);
      p = ALIGN(p, pe->pe_filealign);
    }
    else
    {
      if (h->flags & FL_VPRESENT) v += h->datalen;
      if (h->flags & FL_PRESENT)  p += h->datalen;
    }
  }

#ifdef DUMP_MSG
  printf("+ rebuilding fixup table\n");
#endif // DUMP_MSG

  // rebuild fixup table

  DWORD xptr = 0, o = 0, xbase;
  for (HOOY* h=root; h; h=h->next)
  {
    if (h->flags & FL_FIXUP)
    {
      if (o == 0)
      {
c7:     xbase = h->newrva & 0xFFFFF000;
        *(DWORD*)&(fxrva->dataptr[xptr+0]) = xbase;
        o = 8;
      }
      if (h->newrva - xbase > 0xFFF)
      {
        *(DWORD*)&(fxrva->dataptr[xptr+4]) = o;
        xptr += o;
        goto c7;
      }
      if (xptr+o+2 > fxrva->datalen)
      {
        fxrva->datalen += 65536;
        fxrva->dataptr = (BYTE*) xrealloc( fxrva->dataptr, fxrva->datalen );
        if (fxrva->dataptr == NULL) return MF_ERR_NOMEMORY;
        goto re;
      }
      *(WORD*)&(fxrva->dataptr[xptr+o]) = (h->newrva - xbase) | 0x3000;
      o += 2;
    }
  }
  if (o != 0)
  {
    *(DWORD*)&(fxrva->dataptr[xptr+4]) = o;
    xptr += o;
  }

  if (xptr==0)
    return MF_ERR_NOFIXUPS;         // new fixup table size == 0

  fxrva->datalen = xptr;

  if (*(DWORD*)fxsize->dataptr != xptr)
  {
    *(DWORD*)fxsize->dataptr = xptr;
    goto re;
  }

#ifdef DUMP_MSG
  printf("+ recalculating pointers\n");
#endif // DUMP_MSG

  // recalc pointers

  int expanded = 0;

#define SETHOOY(x,y)  HOOY* x = (y) <= pe->pe_imagesize ? fasthooy[ y ] : NULL;

  for (HOOY* h = root; h; h=h->next)
  {
    if (h->flags & FL_RVA)
    {
      SETHOOY(h1, h->arg1);
      if (h1)
      if (h->flags & FL_PHYS)
        *(DWORD*)h->dataptr = h1->newofs;
      else
        *(DWORD*)h->dataptr = h1->newrva;
    }
    if (h->flags & FL_FIXUP)
    {
      SETHOOY(h1, h->arg1);
      if (h1)
      *(DWORD*)h->dataptr = h1->newrva + pe->pe_imagebase;
    }
    if (h->flags & FL_DELTA)
    {
      SETHOOY(h1, h->arg1);
      SETHOOY(h2, h->arg2);
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
      *(DWORD*)h->dataptr = ALIGN(*(DWORD*)h->dataptr, pe->pe_objectalign);
    }
    if (h->flags & FL_FORCEFILEALIGN)
    {
      *(DWORD*)h->dataptr = ALIGN(*(DWORD*)h->dataptr, pe->pe_filealign);
    }
    if (h->flags & FL_HAVEREL)
    {
      SETHOOY(h1, h->arg1);
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
              h->dataptr[0]=0x09;     // or ecx, ecx
              h->dataptr[1]=0xC9;
              h->dataptr[2]=0x0F;     // jz
              h->dataptr[3]=0x84;
              h->datalen=2+6;
            }
            else
            if (h->dataptr[0]==0xE2)
            {
              h->dataptr[0]=0x49;     // dec ecx
              h->dataptr[1]=0x0F;     // jnz
              h->dataptr[2]=0x85;
              h->datalen=1+6;
            }
            else
            {
              return MF_ERR_CANTEXPAND;
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
    // +pass
    goto re;
  }

#ifdef DUMP_MSG
  printf("+ assembling\n");
#endif // DUMP_MSG

  // assembling

  for (HOOY* h=root; h; h=h->next)
    p = h->newofs;
  p = ALIGN(p, pe->pe_filealign);

  o_phys_len = p + ovr_size;
  o_phys_mem = (BYTE*)xrealloc(o_phys_mem, o_phys_len);
  if (o_phys_mem == NULL) return MF_ERR_NOMEMORY;

  for (HOOY* h = root; h; h=h->next)
  if (h->flags & FL_PRESENT)
    memcpy(
    &o_phys_mem[h->newofs], h->dataptr, h->datalen);

  if (ovr_size > 0)
    memcpy(&o_phys_mem[p], &i_phys_mem[ovr_offs], ovr_size);

  // recalc csum

  MZ_HEADER* tmz = (MZ_HEADER*) &o_phys_mem[0];
  PE_HEADER* tpe = (PE_HEADER*) &o_phys_mem[ tmz->mz_neptr ];
  if (tpe->pe_checksum != 0)
  {
    tpe->pe_checksum = 0;
    tpe->pe_checksum = calc_pe_csum(o_phys_mem, o_phys_len);
  }

  xfree((void**)&fasthooy);

  return MF_ERR_SUCCESS;
} // CMistfall::Asm()

DWORD CMistfall::calc_pe_csum(BYTE* buf, DWORD size)
{
  WORD csum = 0;
  for (DWORD i=0; i<size; i+=2)
  {
    csum += *(WORD*)&buf[i];
    csum += _FLAGS & 1;         // to be compiled with Borland-C
  }
  return csum+size;
} // CMistfall::calc_pe_csum()

void CMistfall::markrva(DWORD x)
{
  flag[x] |= FL_RVA | FL_DATA;
  flag[memd[x]] |= FL_LABEL | FL_DREF;
  arg1[x] = memd[x];
} // CMistfall::markrva()

void CMistfall::markrvadata(DWORD x)
{
  flag[x] |= FL_RVA | FL_DATA;
  flag[memd[x]] |= FL_LABEL | FL_DREF | FL_DATA;
  arg1[x] = memd[x];
} // CMistfall::markrvadata()

void CMistfall::markfixup(DWORD x)
{
  flag[ x ] |= FL_FIXUP;
  arg1[x] = memd[x] - pe->pe_imagebase;
  flag[ arg1[x] ] |= FL_LABEL | FL_DREF;
} // CMistfall::markfixup()

void CMistfall::markdelta(DWORD x,DWORD y,DWORD z)
{
  flag[x] |= FL_DELTA;
  arg1[x] = y;
  arg2[x] = y+z;
  flag[y]   |= FL_LABEL | FL_DREF;
  flag[y+z] |= FL_LABEL | FL_DREF;
} // CMistfall::markdelta()