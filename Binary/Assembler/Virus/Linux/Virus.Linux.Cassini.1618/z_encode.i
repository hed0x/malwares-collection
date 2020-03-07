   ; ---------------------------------------------------------------------------
   ; subroutine: z_encode                                               (x) 2001
   ; action:     compress buffer (slow). details in Z_CODING.TXT
   ; input:      ESI=buffer
   ;             ECX=buffer size
   ;             EDI=compressed buffer
   ; output:     none
   ; size:       ~37X bytes
   ; ---------------------------------------------------------------------------

   WINDOW_SIZE             equ     4096    ; 4=min,fast ..... 65000=max,slow

   ; void __cdecl z_encode(BYTE* ibuf, DWORD isize, BYTE* obuf);

   z_encode:           pusha

                           stosd              ; compressed
                           xchg    ecx, eax
                           stosd              ; decompressed

                           xor     edx, edx   ; code
                           xor     ecx, ecx   ; len

   .cycle:                mov     eax, esi
                           sub     eax, [esp+1*4]  ; pusha.esi
                           cmp     eax, [esp+6*4]  ; pusha.ecx
                           jb      .cont

   .exit:                 jecxz   .suck6

                           xchg    edx, eax
                           stosb

   .suck6:                xchg    edi, eax
                           mov     edi, [esp]      ; pusha.edi
                           sub     eax, edi
                           stosd

                           popa
                           retn

   .cont:                 xor     ebx, ebx

   .cycle1:               lea     eax, [esi+ebx]
                           cmp     [eax], ch       ; 0?
                           jne     .suck1
                           sub     eax, [esp+1*4]  ; pusha.esi
                           cmp     eax, [esp+6*4]  ; pusha.ecx
                           jae     .suck1
                           inc     ebx
                           cmp     bx, 255+4
                           jbe     .cycle1
                           dec     ebx

   .suck1:                dec     ebx
                           dec     ebx
                           jz near     .c_7001
                           dec     ebx
                           jz near     .c_7002
                           jg near     .c_7003

                           xor     ebx, ebx

                           push    edx             ; code

                           lea     edx, [esi - WINDOW_SIZE]
                           cmp     edx, [4+esp + 1*4]   ; pusha.esi
                           jae     .cycle2
                           mov     edx, [4+esp + 1*4]   ; pusha.esi

   .cycle2:               xor     ebp, ebp

   .cycle3:               lea     eax, [edx+ebp]
                           cmp     eax, esi
                           jae     .suck3
                           mov     al, [eax]
                           cmp     al, [esi+ebp]
                           jne     .suck3
                           inc     ebp
                           cmp     bp, 255+2
                           jbe     .cycle3
                           dec     ebp

   .suck3:                cmp     ebx, ebp
                           ja      .cont2

                           mov     ebx, ebp
                           mov     [4+esp+3*4], edx  ; pusha.esp (was: unused)

   .cont2:                inc     edx
                           cmp     edx, esi
                           jb      .cycle2

                           pop     edx             ; code

                           cmp     ebx, by 2
                           jb      .c_7000

                           mov     ebp, esi
                           sub     ebp, [esp+3*4]
                           sub     ebp, ebx

   ;                       movzx   eax, bp         ; check if EBP <= 0x0000FFFF
   ;                       cmp     eax, ebp        ;
   ;                       jne     .c_7000

   ; //    if ((  (c<=5 ? 2+2:3+8) + 1 + (d<=255?8:16)  ) < maxc*8 )
                           push    2+2+1+8
                           pop     eax
                           cmp     bl, 5
                           jbe     .i1
                           mov     al, 3+8+1+8
   .i1:                   cmp     ebp, 255
                           jbe     .i2
                           add     al, 8
   .i2:                   shl     ebx, 3
                           cmp     eax, ebx
                           jae     .c_7000
                           shr     ebx, 3

                           dec     ebx
                           dec     ebx

                           cmp     bl, 5-2
                           jbe     .c_7004
                           jmps     .c_7005

   .c_7000:               call    .outbit_0
                           lodsb
                           call    .outbyte
   .jmpscycle:             jmp     .cycle

   .c_7002:               inc     esi
                           call    .outbit_1

   .c_7001:               mov     ch, 3
                           call    .out1s
                           call    .outbit_0
                           jmps     .o2

   .c_7003:               mov     ch, 5
                           call    .out1s
                           dec     ebx
                           mov     eax, ebx
                           inc     esi
                           inc     esi
   .o3:                   call    .outbyte
   .o2:                   inc     esi
                           inc     esi
                           add     esi, ebx        ;ebx=0
                           jmps     .jmpscycle

   .c_7004:               call    .outbit_1
                           call    .outbit_0
                           bt      ebx, 1
                           call    .outbit_cf
                           bt      ebx, 0
                           call    .outbit_cf
                           jmps     .c_45

   .c_7005:               mov     ch, 2
                           call    .out1s
                           call    .outbit_0
                           mov     al, bl
                           call    .outbyte

   .c_45:                 mov     eax, ebp
                           call    .outbyte

                           shr     ebp, 8
                           cmp     ebp, by 1
                           cmc
                           call    .outbit_cf

                           or      ebp, ebp
                           jz      .o2
                           xchg    ebp, eax
                           jmps     .o3

   .out1s:                call    .outbit_1
                           dec     ch
                           jnz     .out1s
   .rt:                   retn

   .outbyte:              movzx   eax, al
                           shl     eax, cl
                           add     cl, 7
                           jmps     .outxxx

   .outbit_cf:            jnc     .outbit_0
   .outbit_1:             xor     eax, eax
                           inc     eax
   .outbit:               shl     eax, cl
   .outxxx:               or      edx, eax
   .outbit_0:             inc     ecx
   .flush:                cmp     cl, 8
                           jb      .rt
                           mov     al, dl
                           stosb
                           shr     edx, 8
                           sub     cl, 8
                           jmps     .flush

   ; ---------------------------------------------------------------------------
