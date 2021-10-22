
// DISASM.C - disassembler module for AZCME/32
// Copyright (C) 1998 Z0MBiE/29A

#define cf_66           0x00000001
#define cf_67           0x00000002
#define cf_lock         0x00000004
#define cf_rep          0x00000008
#define cf_seg          0x00000010
#define cf_0F           0x00000020
#define cf_w            0x00000040
#define cf_modrm        0x00000080
#define cf_sib          0x00000100
#define cf_mem          0x00000200
#define cf_data         0x00000400
#define cf_datarel      0x00000800
#define cf_ttt          0x00001000

#define ct_unknown      0       // by default
#define ct_ret          1
#define ct_call         2
#define ct_jmp          3
#define ct_jcc          4
#define ct_jmpMODRM     5

#define rt_undefined    0       // by default

#define rt_opcode0      1
#define rt_modrm_reg    2
#define rt_modrm_rm     3
#define rt_sib0_32      6
#define rt_sib3_32      7
#define rt_a            8       // eax/ax/al
#define rt_ebp          9       // ebp


typedef union dwordunion
  {
    dword      d[1];
    word       w[2];
    byte       b[4];
  } dwordunion;

typedef struct tcmdrec
  {
    dword       size;           // total command size in bytes

    dword       flags;          // cf_xxxx
    dword       type;           // ct_xxxx

    byte        px_rep;         // prefixes
    byte        px_seg;

    byte        opcode;         // opcode

    byte        modrm;          // modrm
    byte        sib;            // sib

    dword       memsize;        // memory size in bytes
    dwordunion  mem;            // mem

    dword       datasize;       // data size in bytes
    dwordunion  data;           // data

    byte        mod;            // splitted modrm
    byte        reg;            //
    byte        rm;             //

    byte        scale;          // splitted sib
    byte        index;          //
    byte        base;           //

    dword       regcount;       // reg. count
    dword       regtype[3];     // rt_xxxx
    dword       regsize[3];     // 0,1,2,4

    dword       jmpdata;

  } tcmdrec;

#define pcmdrec         tcmdrec *


void debug_dump(pchar cmd, dword size)
  {
    printf("%D ", (dword) cmd);
    for (; size>0; size--, cmd++)
      printf(" %B", (byte) *cmd);
    printf_crlf();
  }

pchar ip;
tcmdrec r;
byte b;
byte ttt;

#define flagset(flag)           ((r.flags & (flag)) != 0)  // func
#define andflag(flag)           r.flags &= (~(flag))       // proc
#define setflag(flag)           r.flags |= (flag)          // proc

#define getbyte         ((byte) *ip++)
#define getbyteNI       ((byte) *ip  )      // NI=no increment

void modrm_real(void)
  {
    setflag(cf_modrm);

    b = getbyte;

    r.modrm = b;

    r.mod   = b >> 6;
    r.reg   = (b >> 3) & 7;
    r.rm    = b & 7;

    if (r.mod == 0x03)
      {

        if ((r.flags & cf_ttt) == 0)
          {
            r.regtype[r.regcount  ] = rt_modrm_reg;
            r.regsize[r.regcount++] = 4;
          }
        
        r.regtype[r.regcount  ] = rt_modrm_rm;
        r.regsize[r.regcount++] = 0x66;
        goto done;
      };

    if flagset(cf_67)
      goto modrm_32;
    else
      goto modrm_16;

modrm_16:
    asm int 3 end;

    goto done;

modrm_32:

    if ((r.flags & cf_ttt) == 0)
      {
        r.regtype[r.regcount  ] = rt_modrm_reg;
        r.regsize[r.regcount++] = 4;
      }

    if (r.mod == 0x01)
      {
        setflag(cf_mem);
        r.memsize = 1;
      }
    if (r.mod == 0x02)
      {
        setflag(cf_mem);
        r.memsize = 4;
      }

    if (r.rm == 0x04)
      {
        setflag(cf_sib);

        b = getbyte;
        r.sib = b;

        r.scale = b >> 6;
        r.index = (b >> 3) & 7;
        r.base  = b & 7;

        r.regtype[r.regcount  ] = rt_sib3_32;  // index
        r.regsize[r.regcount++] = 4;

        if (r.base == 5)
          {

            if (r.mod == 0)
              {
                setflag(cf_mem);
                r.memsize = 4;
              }
            else
              {
                r.regtype[r.regcount  ] = rt_ebp;
                r.regsize[r.regcount++] = 4;
              }

            goto done;
          }

        r.regtype[r.regcount  ] = rt_sib0_32;  // base
        r.regsize[r.regcount++] = 4;

      }
    else
      {
        if ( (r.rm == 0x05) && (r.mod == 0) )
          {
            setflag(cf_mem);
            r.memsize = 4;
          }
        else
          {
            r.regtype[r.regcount  ] = rt_modrm_rm;
            r.regsize[r.regcount++] = 4;
          }
      }

    goto done;

done:

  }

void disasm(pchar cmd, pcmdrec rec)
  {
    word i;
    ip = cmd;

    zero(r);
    r.flags = (cf_66 | cf_67);   // by default: 32-bit addressing

prefix:
    b = getbyte;
    ttt = (getbyteNI >> 3) & 7;

    if (b == 0x66)
      {
        andflag(cf_66);
        goto prefix;
      }

    if (b == 0x67)
      {
        andflag(cf_67);
        goto prefix;
      }

    if (b == 0xF0)
      {
        setflag(cf_lock);
        goto prefix;
      }

    if ((b == 0xF2) || (b == 0xF3))
      {
        setflag(cf_rep);
        r.px_rep = b;
        goto prefix;
      }

    if ((b == 0x26) || (b == 0x2E) || (b == 0x3E) || (b == 0x36) ||
        (b == 0x64) || (b == 0x65))
      {
        setflag(cf_seg);
        r.px_seg = b;
        goto prefix;
      }


    if (b == 0x0F)
      goto prefix_0F;

    r.opcode = b;

#define cmpEx(data,andmask,cmpmask)    ((data & andmask) == cmpmask)



    if (b == 0x90)
      goto done;
    if (b == 0xCC)
      goto done;

    if (b == 0xE9)
      {
        r.type = ct_jmp;
        goto data_66_rel;
      }

    if (b == 0xE8)
      {
        r.type = ct_call;
        goto data_66_rel;
      }




    if cmpEx(b,0xF8,0x50)
      {
        //r.type = ct_push;
        goto reg_opcode0;
      }
    if cmpEx(b,0xF8,0x58)
      {
        //r.type = ct_pop;
        goto reg_opcode0;
      }

    if cmpEx(b,0xFC,0x88)
      {
        //r.type = ct_mov;
        goto w_modrm;
      }

    if (b == 0xC2)
      {
        r.type = ct_ret;
        goto data_word;
      }
    if (b == 0xC3)
      {
        r.type = ct_ret;
        goto done;
      }

    if (b == 0xFC)
      {
        //r.type = ct_cld;
        goto done;
      }

    if (b == 0x99)      // cwd
      goto done;

    if cmpEx(b,0xFE,0xAA)
      {
        //r.type = ct_stos;
        goto done;
      }
    if cmpEx(b,0xFE,0xA4)
      {
        //r.type = ct_movs;
        goto done;
      }

    if cmpEx(b,0xFE,0xAE)
      {
        //r.type = ct_scas;
        goto done;
      }
    if cmpEx(b,0xFE,0xAC)
      {
        //r.type = ct_lods;
        goto done;
      }
    if cmpEx(b,0xFE,0xA6)
      {
        //r.type = ct_cmps;
        goto done;
      }

    if cmpEx(b,0xF8,0xB8)
      {
        //r.type = ct_mov;
        goto reg_opcode0_data_66;
      }
    if cmpEx(b,0xF8,0xB0)
      {
        //r.type = ct_mov;
        goto data_byte;
      }

    if cmpEx(b,0xC4,0x00)
      {
        //r.type = ct_ttt_opcode3;
        goto w_modrm;
      }


    if ( cmpEx(b,0xFE,0xF6) && cmpEx(ttt,0x06,0x02) )
      {
        //r.type = ct_notneg;
        goto ttt_w_modrm;
      }


    if cmpEx(b,0xF0,0x40)
      {
        //r.type = ct_incdec;
        goto reg_opcode0;
      }


    if cmpEx(b,0xF8,0x90)
      {
        //r.type = ct_xchg;
        goto reg_opcode0;
      }

    if (b == 0x6A)              // push
      goto data_byte;
    if (b == 0x68)              // push
      goto data_66;

    if ((b == 0xFF) && (ttt == 0x06))    // inc modrm
      goto ttt_modrm;

    if (b == 0x8D)              // lea
      goto modrm;

    if cmpEx(b,0xFC,0xA0)       // mov ax, [xxxxx]
      goto data_66;

    if cmpEx(b,0xFC,0x80)       // ttt rm, data
      goto ttt_modrm_data_s_w_66;

    if cmpEx(b,0xFE,0xC0)       // ttt rm, data    (shifts)
      goto ttt_modrm_data_byte;

    if cmpEx(b,0xF0,0x70)
      {
         r.type = ct_jcc;
         goto data_byte_rel;
      }

    if (b == 0xEB)
      {
         r.type = ct_jmp;
         goto data_byte_rel;
      }


    if ( cmpEx(b,0xFE,0xF6) && cmpEx(ttt,0x06,0x06) )   // div,idiv (ax)
      {
        goto ttt_a_w_modrm;
      }

    if cmpEx(b,0xFE,0x84)   // test
      goto w_modrm;

    if (cmpEx(b,0xFE,0xC6) && (ttt == 0x00))    // mov rm, data
      goto ttt_modrm_data_w_66;

    if (cmpEx(b,0xFE,0xF6) && (ttt == 0x00))    // test rm, data
      goto ttt_modrm_data_w_66;

    if cmpEx(b,0xFE,0x3C)       // cmp a
      {
        goto a_data_w_66;
      }

    if ( cmpEx(b,0xFE,0xFE) && cmpEx(ttt,0x06,0x00) )  // inc
      goto ttt_w_modrm;

    if cmpEx(b,0xC4,0x04)       // and
      goto data_w_66;

    if ( (b == 0xFF) && (ttt == 0x04) )     // jmp modrm
      {
        r.type = ct_jmpMODRM;
        goto ttt_modrm;
      }

    if (b == 0xEC)              // in al, dx
      goto done;
    if (b == 0xE4)              // in al, port
      goto data_byte;


    if (b == 0x69)              // imul
      goto modrm_data_w_66;

    if (cmpEx(b,0xFE,0xF6) && (ttt == 0x04) )  // mul [a,] rm
      goto ttt_modrm;

    if cmpEx(b,0xFC,0xD0)     // shr rm, 1/cl
      goto w_modrm;

    if (b == 0xA8)              // test al,xx
      goto data_byte;

    if cmpEx(b,0xFE,0x9C)       // push/popf
      goto done;



error:
    debug_dump(cmd, 10);
    printf("<- unknown command, opcode %B\n", r.opcode);
    exit(1);

prefix_0F:
    setflag(cf_0F);
    b = getbyte;
    r.opcode = b;
    ttt = (getbyteNI >> 3) & 7;


    if cmpEx(b,0xF6,0xB6)
      {
        //r.type = ct_movXx;    // movsx/movzx
        goto w_modrm;
      }


    if cmpEx(b,0xF0,0x80)
      {
         r.type = ct_jcc;
         goto data_66_rel;
      }

    goto error;

a_data_w_66:
    r.regtype[r.regcount  ] = rt_a;
    r.regsize[r.regcount++] = 0x66;
    goto data_w_66;

ttt_a_w_modrm:
    setflag(cf_ttt);
    goto a_w_modrm;

a_w_modrm:
    r.regtype[r.regcount  ] = rt_a;
    r.regsize[r.regcount++] = 0x66;
    goto w_modrm;

ttt_modrm_data_byte:
    setflag(cf_ttt);
    goto modrm_data_byte;

modrm_data_byte:
    modrm_real();
    goto data_byte;

ttt_modrm_data_s_w_66:
    setflag(cf_ttt);
    goto modrm_data_s_w_66;

modrm_data_s_w_66:
    modrm_real();
    goto data_s_w_66;

ttt_modrm_data_w_66:
    setflag(cf_ttt);
    goto modrm_data_w_66;

modrm_data_w_66:
    modrm_real();
    goto data_w_66;

data_s_w_66:
    if ((r.opcode & 0x02) != 0)
      goto data_byte;
    else
      goto data_w_66;

data_66_rel:
    setflag(cf_datarel);
    goto data_66;

data_byte_rel:
    setflag(cf_datarel);
    goto data_byte;

data_66:
    r.datasize = 0x66;
    goto data;

data_byte:
    r.datasize = 1;
    goto data;

data_word:
    r.datasize = 2;
    goto data;

data_dword:
    r.datasize = 4;
    goto data;

data:
    r.flags |= cf_data;
    goto done;

reg_opcode0_data_66:
    r.regtype[r.regcount  ] = rt_opcode0;
    r.regsize[r.regcount++] = 0x66;
    goto data_66;

reg_opcode0:
    r.regtype[r.regcount  ] = rt_opcode0;
    r.regsize[r.regcount++] = 0x66;

    goto done;

data_w_66:
    setflag(cf_w);
    goto data_66;

ttt_w_modrm:
    setflag(cf_ttt);
    goto w_modrm;

w_modrm:
    setflag(cf_w);
    goto modrm;

ttt_modrm:
    setflag(cf_ttt);
    goto modrm;

modrm:
    modrm_real();

done:
    if (r.datasize == 0x66)
      if ( flagset(cf_w) && ((r.opcode & 0x01) == 0) )
        r.datasize = 1;
      else
      if flagset(cf_66)
        r.datasize = 4;
      else
        r.datasize = 2;

    for (i=0; i<r.regcount; i++)
    if (r.regsize[i] == 0x66)
      {
         if ( flagset(cf_w) && ((r.opcode & 0x01) == 0) )
           r.regsize[i] = 1;
         else
         if flagset(cf_66)
           r.regsize[i] = 4;
         else
           r.regsize[i] = 2;
      }

    if flagset(cf_mem)
      {
        for (i=0; i<r.memsize; i++)
          r.mem.b[i] = getbyte;
      }

    if flagset(cf_data)
      {
        for (i=0; i<r.datasize; i++)
          r.data.b[i] = getbyte;
      }

    if flagset(cf_datarel)
      {
        if (r.datasize == 1)  r.jmpdata = (signed char) r.data.b[0];
        if (r.datasize == 2)  r.jmpdata = (short) r.data.w[0];
        if (r.datasize == 4)  r.jmpdata = r.data.d[0];
      }

    r.size = ip - cmd;
    move((pchar) &r, (pchar) rec, sizeof(tcmdrec));

    #ifdef      FULL_DUMP

    printf("\n\n========= DUMP ==========\n");
    printf("flags: ");
    if (!flagset(cf_66))   printf("-66 ");
    if (!flagset(cf_67))   printf("-67 ");
    if flagset(cf_lock) printf("lock ");
    if flagset(cf_rep)  printf("rep ");
    if flagset(cf_seg)  printf("seg ");
    if flagset(cf_0F)   printf("0F ");
    printf("<opcode> ");
    if flagset(cf_w) printf("w ");
    if flagset(cf_modrm)printf("modrm ");
    if flagset(cf_sib)  printf("sib ");
    if flagset(cf_mem)  printf("mem ");
    if flagset(cf_data) printf("data ");
    if flagset(cf_datarel) printf("datarel ");
    printf("\n");

    if flagset(cf_rep) printf("r.px_rep = %B\n",r.px_rep);
    if flagset(cf_seg) printf("r.px_seg = %B\n",r.px_seg);

    printf("r.opcode = %B\n",r.opcode);
    if (r.type == ct_jmp)  printf("r.type = ct_jmp\n");
    if (r.type == ct_jcc)  printf("r.type = ct_jcc\n");
    if (r.type == ct_ret)  printf("r.type = ct_ret\n");
    if (r.type == ct_call) printf("r.type = ct_call\n");

    if flagset(cf_modrm)
      {
        printf("r.modrm = %B\n", r.modrm);
        printf("r.mod   = %B\n", r.mod);
        printf("r.reg   = %B\n", r.reg);
        printf("r.rm    = %B\n", r.rm);
      }

    if flagset(cf_sib)
      printf("r.sib = %B\n", r.sib);

    if flagset(cf_mem)
      {
        printf("r.memsize = %d\n", r.memsize);
        if (r.memsize == 1) printf("r.mem = %B\n",r.mem.b[0]);
        if (r.memsize == 2) printf("r.mem = %W\n",r.mem.w[0]);
        if (r.memsize == 4) printf("r.mem = %D\n",r.mem.d[0]);
      }
    if flagset(cf_data)
      {
        printf("r.datasize = %d\n", r.datasize);
        if (r.datasize == 1) printf("r.data = %B\n",r.data.b[0]);
        if (r.datasize == 2) printf("r.data = %W\n",r.data.w[0]);
        if (r.datasize == 4) printf("r.data = %D\n",r.data.d[0]);
      }

    if (r.regcount != 0)
      {
        printf("r.regcount = %d\n",r.regcount);
        for (i=0; i<r.regcount; i++)
          {
            printf("r.regtype[%w] = ",i);
            if (r.regtype[i] == rt_undefined) printf("rt_undefined");
            if (r.regtype[i] == rt_opcode0)   printf("rt_opcode0");
            if (r.regtype[i] == rt_modrm_reg) printf("rt_modrm_reg");
            if (r.regtype[i] == rt_modrm_rm)  printf("rt_modrm_rm");
            if (r.regtype[i] == rt_sib0_32) printf("rt_sib0_32");
            if (r.regtype[i] == rt_sib3_32) printf("rt_sib3_32");
            if (r.regtype[i] == rt_a) printf("rt_a");
            if (r.regtype[i] == rt_ebp) printf("rt_ebp");

            printf("\n");
          }
      }

    #endif

    #ifdef SHORT_DUMP

    debug_dump(cmd, r.size);

    #endif
  }

