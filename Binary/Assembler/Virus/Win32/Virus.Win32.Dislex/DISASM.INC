DF_66            equ 00000001h
DF_67            equ 00000002h
DF_LOCK          equ 00000004h
DF_REP           equ 00000008h
DF_SEG           equ 00000010h
DF_0F            equ 00000020h
DF_OPCODE        equ 00000040h
DF_W             equ 00000080h
DF_MODRM         equ 00000100h
DF_SIB           equ 00000200h
DF_MEM           equ 00000400h
DF_DATA          equ 00000800h
DF_DATAREL       equ 00001000h
DF_EXIT          equ 00002000h




; 32-bit disassembler

; input:  ESI=command
; output: CF=0  disasm_xxx vars filled
;         CF=1  unknown opcode



cmd                     macro   a,b
                        am      = 0
                        cm      = 0
                        irpc    i,<a>
                        am      = am * 2
                        cm      = cm * 2
                        ifidn   <i>,<0>
                        am      = am + 1
                        cm      = cm + 0
                        endif
                        ifidn   <i>,<1>
                        am      = am + 1
                        cm      = cm + 1
                        endif
                        ifidn   <i>,<x>
                        am      = am + 0
                        cm      = cm + 0
                        endif
                        endm
                        if      am ne 255
                        push    eax
                        and     al, am
                        endif
                        cmp     al, cm
                        if      am ne 255
                        pop     eax
                        endif
                        je      b
                        endm



disasm:                 pusha

                        mov     disasm_offs, esi
                        xor     eax, eax
                        mov     disasm_flag, eax
                        mov     disasm_size, eax
                        mov     disasm_memsize, al
                        mov     disasm_datasize, al

__getopcode:            mov     eax, [esi]
                        inc     esi

                        shr     ah, 3
                        and     ah, 111b

                        cmd     11110000,__lock
                        cmd     1111001x,__rep
                        cmd     001xx110,__seg
                        cmd     0110010x,__seg
                        cmd     01100110,__66
                        cmd     01100111,__67

                        cmd     00001111,__0F

                        or      disasm_flag, DF_OPCODE
                        mov     disasm_opcode, al

                        cmd     00xxx0xx,__modrm_exit
                        cmd     00xxx00x,__modrm_exit
                        cmd     00xxx10x,__w_data66_exit
                        cmd     0101xxxx,__exit
                        cmd     01101010,__byte_exit
                        cmd     01101000,__data66_exit
                        cmd     0110000x,__exit

                        cmd     0111xxxx,__rel_byte_exit

                        cmd     100010xx,__modrm_exit
                        cmd     10110xxx,__byte_exit
                        cmd     10111xxx,__data66_exit
                        cmd     101000xx,__memd_exit
                        cmd     10010xxx,__exit
                        cmd     1000011x,__modrm_exit
                        cmd     10010000,__exit
                        cmd     10001101,__modrm_exit
                        cmd     1000010x,__modrm_exit
                        cmd     1010100x,__w_data66_exit
                        cmd     1001100x,__exit
                        cmd     1100000x,__modrm_byte_exit
                        cmd     110100xx,__modrm_exit
                        cmd     11101000,__rel_data66_exit
                        cmd     11101001,__exit_rel_data66_exit
                        cmd     11101011,__exit_rel_byte_exit
                        cmd     111000xx,__rel_byte_exit
                        cmd     1000000x,__modrm_w_data66_exit
                        cmd     1000001x,__modrm_byte_exit
                        cmd     11000011,__exit_exit
                        cmd     11001x11,__exit_exit
                        cmd     11000010,__exit_word_exit
                        cmd     0100xxxx,__exit
                        cmd     1010011x,__exit
                        cmd     11010111,__exit
                        cmd     11001001,__exit
                        cmd     1010x1xx,__exit
                        cmd     10101011,__exit
                        cmd     000xx11x,__exit
                        cmd     100011x0,__modrm_exit
                        cmd     1001110x,__exit
                        cmd     1111110x,__exit
                        cmd     1111101x,__exit
                        cmd     11111000,__exit
                        cmd     11001000,__tribyte_exit
                        cmd     1100010x,__modrm_exit
                        cmd     11001100,__exit
                        cmd     01101011,__modrm_byte_exit
                        cmd     01101001,__modrm_data66_exit

                        cmd     1010x10x,__exit
                        cmd     1010101x,__exit
                        cmd     1010x11x,__exit

                        cmd     11111x0x,__exit
                        cmd     1111101x,__exit
                        cmd     100111xx,__exit
                        cmd     11110101,__exit


                        cmp     ah, 111b
                        jne     __c4
                        cmd     1111011x,__modrm_exit

__c4:
                        cmp     ah, 110b
                        jne     __c2
                        cmd     11111111,__modrm_exit
__c2:

                        cmp     ah, 000b
                        jne     __c1
                        cmd     1100011x,__modrm_w_data66_exit
                        cmd     10001111,__modrm_exit
                        cmd     1111011x,__modrm_w_data66_exit
                        cmd     1111111x,__modrm_exit

__c1:
                        cmp     ah, 001h
                        jne     __c3
                        cmd     1111111x,__modrm_exit

__c3:
                        cmp     ah, 100b
                        jne     __c5
                        cmd     11111111,__exit_modrm_exit
                        cmd     1111011x,__modrm_exit

__c5:                   cmp     ah, 010b
                        jne     __c6
                        cmd     1111011x,__modrm_exit
                        cmd     11111111,__modrm_exit

__c6:
                        cmp     ah, 011b
                        jne     __c7
                        cmd     1111011x,__modrm_exit
                        cmd     11111111,__modrm_exit
__c7:

                        cmp     ah, 101b
                        jne     __c8
                        cmd     1111011x,__modrm_exit

__c8:
                        cmp     ah, 110b
                        jne     __c9
                        cmd     1111011x,__modrm_exit
__c9:

                        int 3

;                        nop
                        jmp     __exitbad

__0F:
                        or      disasm_flag, DF_0F

                        mov     eax, [esi]
                        inc     esi

                        shr     ah, 3
                        and     ah, 7

                        cmd     1000xxxx,__rel_data66_exit
                        cmd     1011x11x,__modrm_exit
                        cmd     10xxx00x,__exit
                        cmd     00000011,__modrm_exit
                        cmd     1011110x,__modrm_exit
                        cmd     1010x100,__modrm_byte_exit
                        cmd     1010x101,__modrm_exit
                        cmd     10101011,__modrm_exit
                        cmd     1011x011,__modrm_exit
                        cmd     1011010x,__modrm_exit
                        cmd     10110110,__modrm_exit
                        cmd     10101111,__modrm_exit
                        cmd     10100010,__exit
                        cmd     10100011,__modrm_exit

                        cmp     ah, 000b
                        jne     __d0
                        cmd     1001xxxx,__modrm_exit
__d0:

                        cmp     ah, 100b
                        jne     __d1
                        cmd     00000000,__modrm_exit
                        cmd     10111010,__modrm_byte_exit
__d1:
                        cmp     ah, 101b
                        jne     __d2
                        cmd     00000000,__modrm_exit
                        cmd     10111010,__modrm_byte_exit

__d2:
                        cmp     ah, 110b
                        jne     __d3
                        cmd     10111010,__modrm_byte_exit

__d3:

                        cmp     ah, 111b
                        jne     __d4
                        cmd     10111010,__modrm_byte_exit
__d4:

                        int 3

;                        nop
;                        nop

                        jmp     __exitbad

__exit:
                        xor     eax, eax
                        mov     disasm_mem, eax
                        mov     disasm_data, eax

                        movzx   ecx, disasm_memsize
                        test    ecx, ecx
                        jz      __nomem

                        or      disasm_flag, DF_MEM

                        lea     edi, disasm_mem
                        rep     movsb

__nomem:
                        movzx   ecx, disasm_datasize
                        test    ecx, ecx
                        jz      __nodata

                        cmp     cl, 66h
                        jne     __x3
                        test    disasm_flag, DF_W
                        jz      __x4
                        test    disasm_opcode, 1
                        jnz     __x4
                        mov     cl, 1
                        jmp     __x3
__x4:                   mov     cl, 4
                        test    disasm_flag, DF_66
                        jz      __x3
                        mov     cl, 2
__x3:
                        mov     disasm_datasize, cl

                        or      disasm_flag, DF_DATA

                        lea     edi, disasm_data
                        rep     movsb

                        test    disasm_flag, DF_DATAREL
                        jz      __nodatarel

                        mov     eax, disasm_data

                        cmp     disasm_datasize, 1
                        jne     __x1
                        movsx   eax, al
__x1:
                        cmp     disasm_datasize, 2
                        jne     __x2
                        movsx   eax, ax
__x2:
                        mov     disasm_datarel, eax

__nodatarel:
__nodata:

                        sub     esi, disasm_offs
                        mov     disasm_size, esi

                        clc

                        popa
                        ret

__exitbad:              mov     disasm_size, 16

                        stc

                        popa
                        ret

__lock:                 or      disasm_flag, DF_LOCK
                        jmp     __getopcode

__rep:                  mov     disasm_rep, al
                        or      disasm_flag, DF_REP
                        jmp     __getopcode

__seg:                  mov     disasm_seg, al
                        or      disasm_flag, DF_SEG
                        jmp     __getopcode

__66:                   or      disasm_flag, DF_66
                        jmp     __getopcode

__67:                   or      disasm_flag, DF_67
                        jmp     __getopcode

__exit_rel_byte_exit:   or      disasm_flag, DF_EXIT
__rel_byte_exit:        or      disasm_flag, DF_DATAREL
__byte_exit:            mov     disasm_datasize, 1
                        jmp     __exit

__exit_rel_data66_exit: or      disasm_flag, DF_EXIT
__rel_data66_exit:      or      disasm_flag, DF_DATAREL
__data66_exit:          mov     disasm_datasize, 66h
                        jmp     __exit

__modrm_w_data66_exit:  call    __modrm
__w_data66_exit:        or      disasm_flag, DF_W
                        jmp     __data66_exit

__modrm_data66_exit:    call    __modrm
                        jmp     __data66_exit

__exit_word_exit:       mov     disasm_datasize, 2
__exit_exit:            or      disasm_flag, DF_EXIT
                        jmp     __exit

__memd_exit:            mov     disasm_memsize, 4
                        jmp     __exit

__tribyte_exit:         mov     disasm_datasize, 3
                        jmp     __exit

__modrm_byte_exit:      call    __modrm
                        jmp     __byte_exit

__exit_modrm_exit:      or      disasm_flag, DF_EXIT
                        jmp     __modrm_exit

__w_modrm_exit:         or      disasm_flag, DF_W
__modrm_exit:           call    __modrm
                        jmp     __exit

__rel_modrm_exit:       or      disasm_flag, DF_DATAREL
                        jmp     __modrm_exit

__modrm:                or      disasm_flag, DF_MODRM

                        lodsb
                        mov     disasm_modrm, al

                        mov     bl, al
                        mov     bh, al

                        shr     bl, 6
                        mov     disasm_modrm_mod, bl

                        shr     al, 3
                        and     al, 7
                        mov     disasm_modrm_reg, al

                        and     bh, 7
                        mov     disasm_modrm_rm, bh

                        cmp     bl, 11b
                        je      __modrm__exit

                        test    disasm_flag, DF_67
                        jnz     __modrm16

                        cmp     bl, 01b
                        jne     __2
                        mov     disasm_memsize, 1
__2:

                        cmp     bl, 10b
                        jne     __3
                        mov     disasm_memsize, 4
__3:

                        cmp     bh, 4
                        je      __modrm__sib

                        cmp     bx, 0500h
                        jne     __4
                        mov     disasm_memsize, 4

__4:

__modrm__exit:          ret


__modrm__sib:           or      disasm_flag, DF_SIB

                        lodsb
                        mov     disasm_sib, al

                        mov     dl, al
                        mov     dh, al

                        shr     dl, 6
                        mov     disasm_sib_scale, dl

                        shr     al, 3
                        and     al, 7
                        mov     disasm_sib_index, al

                        and     dh, 7
                        mov     disasm_sib_base, dh

                        cmp     dh, 5
                        jne     __modrm__exit
                        cmp     bl, 0
                        jne     __modrm__exit

                        mov     disasm_memsize, 4

                        jmp     __modrm__exit

__modrm16:




                        jmp     __modrm__exit
