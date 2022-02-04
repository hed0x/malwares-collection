
; console io

dump_bignum:            pusha
                        shr     ecx, 3
.cycle:                 mov     al, [esi+ecx-1]
                        call    dump_hexbyte
                        loop    .cycle
                        popa
                        retn

dump_asciiz_edx:        pusha
.cycle:                 mov     al, [edx]
                        inc     edx
                        or      al, al
                        jz      .endcycle
                        call    dump_al
                        jmp     .cycle
.endcycle:              popa
                        retn

dump_al:                pusha
                        push    -11 ; STD_OUTPUT_HANDLE
                        call    dword [GetStdHandle]
                        lea     ebx, [esp+(7*4)]
                        push    0
                        push    esp
                        push    1
                        push    ebx
                        push    eax
                        call    dword [WriteFile]
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

dump_hexword:           push    ecx
                        mov     ecx, 4
                        rol     ax, 4
                        call    dump_hexchar
                        loop    $-5-4
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
                        jz      .done
                        call    dump_dec
.done:                  pop     eax
                        add     al, '0'
                        call    dump_al
                        popa
                        retn
