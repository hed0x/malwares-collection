
seh_init                macro
                        call    __seh_init
                        mov     esp, [esp+8]
                        jmp     __seh_error
__seh_init:             push    dword ptr fs:[0]
                        mov     fs:[0], esp
                        endm

seh_done                macro
__seh_error:            pop     dword ptr fs:[0]
                        lea     esp, [esp+4]
                        endm

