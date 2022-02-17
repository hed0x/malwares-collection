
seh_init                macro
                        call    __seh_init
                        mov     esp, [esp+8]
                        stc
                        jmp     __seh_error
__seh_init:             push    dword ptr fs:[0]
                        mov     fs:[0], esp
                        endm

seh_done                macro
                        clc
__seh_error:            pop     dword ptr fs:[0]
                        lea     esp, [esp+4]

                        jnc     __seh_done
                        push    250        ; delay, [ms]
                        push    3300       ; freq, [Hz]
                        callX   Beep
                        stc

__seh_done:             endm
