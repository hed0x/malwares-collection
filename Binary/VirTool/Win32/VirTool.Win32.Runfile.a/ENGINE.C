
// ENGINE.C - main engine
// Copyright (C) 1998 Z0MBiE/29A

//byte    command[max_cmd][32];

dword   code_base;

dword   codesize;
byte    ii[max_code_size];
byte    oo[max_code_size];

#define UNUSED          '-'
#define MARKED          'x'
#define FORNEXTPASS     'N'
byte    buf_mark[max_code_size];

void mark_opcode(pchar p, dword size, byte filler)
  {
    dword    i;

    i = (dword) p - (dword) &ii;

    for (; size>0; size--, i++)
      if (buf_mark[i] != MARKED)
        buf_mark[i] = filler;

  }

void process_marking(pchar p)
  {
    tcmdrec rec;
    pchar q;
    dword t;

cycle:
    if (buf_mark[(dword) p - (dword) &ii] == MARKED)
      return;

    //printf("<%D>: ", (dword) p - (dword) &ii);
    disasm(p, &rec);
    mark_opcode(p, rec.size, MARKED);

    if (rec.type == ct_ret)
      {
        //printf("-- ct_ret\n");
        return;
      }
    if (rec.type == ct_jmp)
      {
        //printf("-- ct_jmp\n");

        t = (dword)p + rec.jmpdata+rec.size;
        t = t - (dword) &ii + code_base;
        if (t > 0x80000000)
          {
             printf("extra jmp to %D\n", t);
             return;
          }

        p += rec.jmpdata+rec.size;
        goto cycle;
      }
    if (rec.type == ct_jmpMODRM)
      {
        //printf("-- ct_jmpMODRM\n");
        return;
      }
    if ((rec.type == ct_call) || (rec.type == ct_jcc))
      {
        //printf("-- ct_call/ct_jcc\n");
        q = (pchar) ( (dword) p + rec.jmpdata+rec.size );
        mark_opcode(q, 1, FORNEXTPASS);
      }

    p += rec.size;
    goto cycle;

  }

void mark_input(void)
  {
    dword   i,progress;

    // init
    fillchar(buf_mark, sizeof(buf_mark), UNUSED);

    // entrypoint(s)
    mark_opcode((pchar) &ii, 1, FORNEXTPASS);

    // main cycle

cycle:
    progress=0;
    for (i=0; i<codesize; i++)
      {
        if (buf_mark[i] == FORNEXTPASS)
          {
            //printf("found FORNEXTPASS at %D\n", i);
            process_marking( (pchar) ( i + (dword) &ii  ) );
            progress++;
          }
      }
    if (progress != 0)
      goto cycle;

  }

             // exchange (E)BX & (E)CX

             // a c d b    b=3  c=1
             // al cl dl bl ah ch dh bh

byte reg8_repl[8]    = {0,3,2,1,4,7,6,5};   // ebx <--> ecx
byte reg1632_repl[8] = {0,3,2,1,4,5,6,7};   //

//byte reg8_repl[8]    = {0,1,2,3,4,5,6,7};
//byte reg1632_repl[8] = {0,1,2,3,4,5,6,7};

void engine_main(void)  // mutate ii[] -> oo[]
  {
    #ifdef DEBUG_FILES
    handle   h;
    #endif
    dword    i,j,k,c;
    byte     b,b0;
    tcmdrec  rec;

    fillchar(&oo, codesize, 0xCC);

    printf("marking\n");

    mark_input();

    printf("assembling ii -> oo\n");

    i = 0;
cycle:
    if (buf_mark[i] == UNUSED)
      i++;
    else
      {
        disasm(&ii[i], &rec);
        move(&ii[i], &oo[i], rec.size);

        if ((rec.opcode == 0xFF) && (rec.modrm == 0x25))
          {
            j = (dword) &oo[i+2];
            j = * (dword *) j;
            j = * (dword *) j;
            j = j - (code_base + i + 5);
            oo[i+0] = 0xE9;
            k = (dword) &oo[i+1];
            * (dword *) k = j;
            oo[i+5] = 0x90;

            i+= rec.size;  // +6
          }
        else
          {

          //  printf("before: i=%D regcount=%d opcode=%B modrm=%B sib=%B mem=%d data=%d\n",
          //    i, rec.regcount, rec.opcode, rec.modrm, rec.sib, rec.memsize, rec.datasize);

            c = 0;

            for (k=0; k<rec.regcount; k++)
              {

                if (rec.regtype[k] == rt_opcode0)    b = rec.opcode & 7;
                if (rec.regtype[k] == rt_modrm_reg)  b = rec.reg;
                if (rec.regtype[k] == rt_modrm_rm)   b = rec.rm;
                if (rec.regtype[k] == rt_sib0_32)    b = rec.base;
                if (rec.regtype[k] == rt_sib3_32)    b = rec.index;

                b0 = b;

                if (rec.regsize[k] == 1)
                  b = reg8_repl[b];
                else
                  b = reg1632_repl[b];

                if (b != b0) c++;

                if (rec.regtype[k] == rt_opcode0)
                  rec.opcode = (rec.opcode & 0xF8) | b;
                if (rec.regtype[k] == rt_modrm_reg)  rec.reg    = b;
                if (rec.regtype[k] == rt_modrm_rm)   rec.rm     = b;
                if (rec.regtype[k] == rt_sib0_32)    rec.base   = b;
                if (rec.regtype[k] == rt_sib3_32)    rec.index  = b;

              }

            rec.modrm = (rec.mod << 6) + (rec.reg << 3) + (rec.rm);
            rec.sib   = (rec.scale << 6) + (rec.index << 3) + (rec.base);

            j = i;

   #define  store_byte(b)          oo[j++] = (b)

   //#define  store_byte(b)          oo[j++] = (0x90)    //debug

   #define  flag(x)                ((rec.flags & (x)) != 0)

            if (c != 0)
              {

                if (!flag(cf_66)) store_byte(0x66);
                if (!flag(cf_67)) store_byte(0x67);
                if flag(cf_lock)  store_byte(0xF0);
                if flag(cf_rep)   store_byte(rec.px_rep);
                if flag(cf_seg)   store_byte(rec.px_seg);
                if flag(cf_0F)    store_byte(0x0F);
                store_byte(rec.opcode);
                if flag(cf_modrm) store_byte(rec.modrm);
                if flag(cf_sib)   store_byte(rec.sib);
                for (k=0; k<rec.memsize; k++)
                  store_byte(rec.mem.b[k]);
                for (k=0; k<rec.datasize; k++)
                  store_byte(rec.data.b[k]);

              }

            i+= rec.size;

          //  printf("after: i=%D j=%D  opcode=%B modrm=%B sib=%B \n",
          //    i,j, rec.opcode, rec.modrm, rec.sib);

            if (c != 0)
            if (i != j)
              {
                printf("command assembling error");
                exit(0);
              }

          }

      }
    if (i < codesize)
      goto cycle;

    #ifdef DEBUG_FILES
    h = createfile("_mark");
    writefile(h, buf_mark, codesize);
    closefile(h);
    #endif

  }

void run_engine(pchar inbuf, pchar outbuf, dword _codesize_)
  {
    #ifdef DEBUG_FILES
    handle h;
    #endif

    code_base = (dword) inbuf;

    printf("Executing engine\n");

    // initialize
    zero(ii);
    zero(oo);
    codesize = _codesize_;
    move(inbuf, &ii, codesize);

    #ifdef DEBUG_FILES
    h = createfile("_inbuf");  writefile(h, ii, codesize); closefile(h);
    #endif

    engine_main();

    #ifdef DEBUG_FILES
    h = createfile("_outbuf"); writefile(h, oo, codesize); closefile(h);
    #endif

    // returning outbuf
    move(&oo, outbuf, codesize);

    printf("Engine completed\n");
  }

