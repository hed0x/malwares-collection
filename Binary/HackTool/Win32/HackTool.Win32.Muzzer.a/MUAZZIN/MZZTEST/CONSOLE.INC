
; console io

dump_bignum:            pusha
                        shr     ecx, 3
__cycle:                mov     al, [esi+ecx-1]
                        call    dump_hexbyte
                        loop    __cycle
                        popa
                        retn

dump_msg:               pop     esi
                        push    eax
                        cld
__cycle:                lodsb
                        or      al, al
                        jz      __endcycle
                        call    dump_al
                        jmp     __cycle
__endcycle:             pop     eax
                        jmp     esi

dump_asciiz_edx:        pusha
__cycle:                mov     al, [edx]
                        inc     edx
                        or      al, al
                        jz      __endcycle
                        call    dump_al
                        jmp     __cycle
__endcycle:             popa
                        retn

dump_al:                pusha
IFNDEF VISUALGAY
                        push    -11             ; STD_OUTPUT_HANDLE
                        callW   GetStdHandle
                        lea     ebx, [esp].popa_eax
                        push    0
                        push    esp
                        push    1
                        push    ebx
                        push    eax
                        callW   WriteConsoleA
ELSE
       mov esi, [visual_buffer]
       mov ecx, [visual_size]
       mov by [esi+ecx], al
       inc dwo [visual_size]
ENDIF
                        popa
                        ret

dump_space:             push    eax
                        mov     al, 32
                        call    dump_al
                        pop     eax
                        ret

dump_crlf:              push    eax
                        mov     al, 13
                        call    dump_al
                        mov     al, 10
                        call    dump_al
                        pop     eax
                        ret

dump_hexchar:           push    eax
                        and     al, 15
                        aam     10
                        aad     'A'-'0'
                        add     al, '0'
                        call    dump_al
                        pop     eax
                        ret

dump_hexbyte:           push    ecx
                        mov     ecx, 2
                        rol     al, 4
                        call    dump_hexchar
                        loop    $-5-3
                        pop     ecx
                        ret

dump_hexdword:          push    ecx
                        mov     ecx, 8
                        rol     eax, 4
                        call    dump_hexchar
                        loop    $-5-3
                        pop     ecx
                        ret

dump_dec:               pusha
                        xor     edx, edx
                        mov     ebx, 10
                        div     ebx
                        push    edx
                        or      eax, eax
                        jz      __done
                        call    dump_dec
__done:                 pop     eax
                        add     al, '0'
                        call    dump_al
                        popa
                        retn
