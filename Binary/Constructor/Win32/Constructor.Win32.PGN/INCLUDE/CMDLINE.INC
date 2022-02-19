
getcmdline:             pusha

                        callW   GetCommandLineA
                        xchg    esi, eax

                        mov     argc, 0

                        lea     edx, argv0
                        call    getargv
                        lea     edx, argv1
                        call    getargv
                        lea     edx, argv2
                        call    getargv
                        lea     edx, argv3
                        call    getargv
                        lea     edx, argv4
                        call    getargv

                        popa
                        retn

getargv:                mov     edi, edx

__1:                    lodsb
                        cmp     al, 0
                        je      __2
                        cmp     al, 32
                        je      __1
                        cmp     al, 9
                        je      __1
__2:                    dec     esi

__3:                    lodsb
                        stosb
                        cmp     al, 32
                        je      __4
                        cmp     al, 9
                        je      __4
                        cmp     al, 0
                        jne     __3
__4:                    dec     esi

                        sub     [edi-1], al

                        cmp     byte ptr [edx], 0
                        setne   al
                        movzx   eax, al
                        add     argc, eax

                        retn
