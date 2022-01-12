
; LDE32 -- Length-Disassembler Engine
; FREEWARE
;
; programmed by Z0MBiE, http://z0mbie.cjb.net
;
; release 1.00          8-12-99
; release 1.01          9-12-99
; release 1.02         17-03-00  0xF6/0xF7 'test' opcode bugfixed
; release 1.03         21-04-00  bugfix: some prefixes before 0F were cleared
;                                bugfix: error in MODRM analysis
;                                CD 20 now is 6 bytes length
; release 1.04          1-05-00  AAM & AAD bugfixed (was 1-byte len)

                        locals  @@

C_ERROR                 equ     -1              ; never change it

C_PREFIX                equ     00000001h       ; prefix. take opcode again
C_66                    equ     00000002h       ; used with C_PREFIX
C_67                    equ     00000004h       ; used with C_PREFIX
C_DATA66                equ     00000008h       ; C_66 ? C_DATA2 : C_DATA4
C_DATA1                 equ     00000010h       ; |
C_DATA2                 equ     00000020h       ; |may be used simultaneously
C_DATA4                 equ     00000040h       ; |
C_MEM67                 equ     00000080h       ; C_67 ? C_MEM2 : C_MEM4
C_MEM1                  equ     00000100h       ; |
C_MEM2                  equ     00000200h       ; |may be used simultaneously
C_MEM4                  equ     00000400h       ; |
C_MODRM                 equ     00000800h       ; MODxxxR/M
C_DATAW0                equ     00001000h       ; opc&1 ? C_DATA66 : C_DATA1
;C_FUCKINGTEST          equ     00002000h ; ttt==0 ? C_MODRM+C_DATAW0:C_MODRM
;C_FLAG_0F              equ     00004000h

        IFDEF   TEXTID
                        db      '[disasm_init:]'
        ENDIF

; void pascal disasm_init(void* tableptr);

DISASM_INIT             proc    pascal
                        arg     tableptr:DWORD
                        pusha
                        mov     edi, tableptr
                        cld
                        call    @@buildflagtbl
                        popa
                        ret
include                 flagtbl1.inc
                        endp

        IFDEF   TEXTID
                        db      '[disasm_init_end:]'
                        db      '[disasm_main:]'
        ENDIF

; int pascal disasm_main(void* opcodeptr, void* tableptr)
; {

DISASM_MAIN             proc    pascal
                        arg     tableptr:DWORD
                        arg     cmdptr:DWORD
                        pusha
;  BYTE* iptr = iptr0;
                        mov     esi, cmdptr
                        cld
;  DWORD f = 0;
                        xor     ebx, ebx        ; flags
;prefix:
;  BYTE b = *iptr++;
@@prefix:               xor     eax, eax
                        lodsb
;  f |= table_1[b];
                        mov     ecx, tableptr
                        or      ebx, [ecx+eax*4]
;  if (f&C_FUCKINGTEST)
;    if (((*iptr)&0x38)==0x00)   // ttt
;      f=C_MODRM+C_DATAW0;       // TEST
;    else
;      f=C_MODRM;                // NOT,NEG,MUL,IMUL,DIV,IDIV
;                       test    ebx, C_FUCKINGTEST
;                       jz      @@1
                        cmp     al, 0F6h
                        je      @@1n
                        cmp     al, 0F7h
                        jne     @@1
                        ; 1.02: mov -> or (2 times)
@@1n:                   or      ebx, C_MODRM    ; NOT,NEG,MUL,IMUL,DIV,IDIV
                        test    byte ptr [esi], 00111000b
                        jnz     @@1
                        or      ebx, C_MODRM+C_DATAW0 ; TEST
@@1:

; 1.03 -- CD 20 analysis
                        cmp     al, 0CDh
                        jne     @@x
                        or      ebx, C_DATA1
                        cmp     byte ptr [esi], 20h
                        jne     @@x
                        or      ebx, C_DATA4
@@x:

;  if (f&C_TABLE_0F) {
;    b = *iptr++;
;    f = table_0F[b];
;  }
;                       test    ebx, C_TABLE_0F
;                       jz      @@2
                        cmp     al, 0Fh
                        jne     @@2
                        lodsb

;                        cmp     al, 0B7h
;                        jne     @@xx
;                        cmp     byte ptr [esi],34h
;                        jne     @@xx
;                        int 3
;@@xx:

                        or      ebx, [ecx+eax*4+256*4]  ; 1.03: mov -> or
@@2:
;  if (f==C_ERROR) return C_ERROR;
                        cmp     ebx, C_ERROR
                        jne     @@3
                        mov     [esp+7*4], ebx
                        jmp     @@exit
@@3:
;  if (f&C_PREFIX) {
;    f&=~C_PREFIX;
;    goto prefix;
;  }
                        test    ebx, C_PREFIX
                        jz      @@4
                        xor     ebx, C_PREFIX
                        jmp     @@prefix
@@4:
;  if (f&C_DATAW0) if (b&0x01) f|=C_DATA66; else f|=C_DATA1;
                        test    ebx, C_DATAW0
                        jz      @@5
                        xor     ebx, C_DATA66
                        test    al, 00000001b
                        jnz     @@5
                        xor     ebx, C_DATA66+C_DATA1
@@5:
;  if (f&C_MODRM)
;  {
                        test    ebx, C_MODRM
                        jz      @@exitmodrm
;    b = *iptr++;
                        lodsb
;    BYTE mod = b & 0xC0;
;    BYTE rm  = b & 0x07;
                        mov     ch, al  ; mod
                        mov     cl, al  ; rm
                        and     cx, 0C007h
;    if (mod!=0xC0)
;    {
                        cmp     ch, 0C0h
                        je      @@exitmodrm
;      if (f&C_67)         // modrm16
;      {
                        test    ebx, C_67
                        jz      @@modrm32
@@modrm16:
;        if ((mod==0x00)&&(rm==0x06)) f|=C_MEM2;
                        cmp     cx, 0006h
                        je      @@mem2
;        if (mod==0x40) f|=C_MEM1;
                        cmp     ch, 40h
                        je      @@mem1
;        if (mod==0x80) f|=C_MEM2;
                        cmp     ch, 80h
                        jne     @@exitmodrm   ; 1.03: was: modrm32
@@mem2:                 or      ebx, C_MEM2
                        jmp     @@exitmodrm
;      }
;      else                // modrm32
;      {
@@modrm32:
;        if (rm==0x04) rm = (*iptr++) & 0x07;    // rm<-sib.base
                        cmp     cl, 04h
                        jne     @@a
                        mov     cl, [esi]
                        inc     esi
                        and     cl, 07h
@@a:
;        if (mod==0x40) f|=C_MEM1;
                        cmp     ch, 40h
                        jne     @@b
@@mem1:                 or      ebx, C_MEM1
                        jmp     @@exitmodrm
@@b:
;        if (mod==0x80) f|=C_MEM4;
                        cmp     ch, 80h
                        je      @@mem4
;        if ((rm==0x05)&&(mod==0x00)) f|=C_MEM4;
                        cmp     cx, 0005h
                        jne     @@exitmodrm
@@mem4:                 or      ebx, C_MEM4
;      }
;    }
;  } // C_MODRM
@@exitmodrm:
;  if (f&C_MEM67)  if (f&C_67) f|=C_MEM2;  else f|=C_MEM4;
                        test    ebx, C_MEM67
                        jz      @@7
                        xor     ebx, C_MEM2
                        test    ebx, C_67
                        jnz     @@7
                        xor     ebx, C_MEM4+C_MEM2
@@7:
;  if (f&C_DATA66) if (f&C_66) f|=C_DATA2; else f|=C_DATA4;
                        test    ebx, C_DATA66
                        jz      @@8
                        xor     ebx, C_DATA2
                        test    ebx, C_66
                        jnz     @@8
                        xor     ebx, C_DATA4+C_DATA2
@@8:
;  if (f&C_MEM1)  iptr++;
;  if (f&C_MEM2)  iptr+=2;
;  if (f&C_MEM4)  iptr+=4;
                        test    ebx, C_MEM1
                        jz      @@x1
                        lodsb
@@x1:                   test    ebx, C_MEM2
                        jz      @@x2
                        lodsw
@@x2:                   test    ebx, C_MEM4
                        jz      @@x3
                        lodsd
@@x3:
;  if (f&C_DATA1) iptr++;
;  if (f&C_DATA2) iptr+=2;
;  if (f&C_DATA4) iptr+=4;
                        test    ebx, C_DATA1
                        jz      @@y1
                        lodsb
@@y1:                   test    ebx, C_DATA2
                        jz      @@y2
                        lodsw
@@y2:                   test    ebx, C_DATA4
                        jz      @@y3
                        lodsd
@@y3:
;  return iptr - iptr0;
                        sub     esi, cmdptr
                        mov     [esp+7*4], esi
;}
@@exit:                 popa
                        ret
                        endp

        IFDEF   TEXTID
                        db      '[disasm_main_end:]'
        ENDIF
