
rnd_dword:              pusha
                        mov     ecx, 4
__1:                    push    255
                        call    rnd
                        add     esp, 4
                        inc     eax             ; [1..255], zero sucks
                        shl     edx, 8
                        or      edx, eax
                        loop    __1
                        mov     [esp].popa_eax, edx
                        popa
                        retn

rnd:                    mov     eax, randseed
                        imul    eax, 214013
                        add     eax, 2531011
                        mov     randseed, eax
                        shr     eax, 16
                        imul    eax, [esp+4]
                        shr     eax, 16
                        test    eax, eax
                        retn

randomize:              pusha
                        callW   GetTickCount
                        sub     randseed, eax
                        popa
                        retn
