
dump_al:                pusha
                        push    -11             ; STD_OUTPUT_HANDLE
                        callW   GetStdHandle
                        lea     ebx, [esp+7*4]
                        push    0
                        push    esp
                        push    1
                        push    ebx
                        push    eax
                        callW   WriteConsoleA
                        popa
                        ret

dump_space:             mov     al, 32
                        call    dump_al
                        ret

dump_crlf:              mov     al, 13
                        call    dump_al
                        mov     al, 10
                        call    dump_al
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
