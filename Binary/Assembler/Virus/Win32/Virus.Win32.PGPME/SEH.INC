
; ---------------------------------------------------------------------------

; seh management, taken from 29A#2.3_3 by Jacky Qwerty

; ---------------------------------------------------------------------------

eh_struc                struc

eh_dummy                dd      ?       ; ret address
eh_exceptionrecord      dd      ?
eh_establisherframe     dd      ?
eh_contextrecord        dd      ?
eh_dispatchercontext    dd      ?

                        ends

; ---------------------------------------------------------------------------

seh_init                macro

                        call    __seh_init
                        mov     esp, [esp].eh_establisherframe
                        jmp     __seh_done
__seh_init:             xor     eax, eax
                        push    dword ptr fs:[eax]
                        mov     fs:[eax], esp

                        endm

; ---------------------------------------------------------------------------

seh_done                macro

__seh_done:             xor     eax, eax
                        pop     dword ptr fs:[eax]
                        pop     eax

                        endm

; ---------------------------------------------------------------------------
