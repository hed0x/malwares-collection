
; Linux Exception Handling Functions

set_seh:
       pusha
       xor     ebx, ebx
       mov     edx, 830009F8h
.cycle:
       shr     edx, 1
       jnc     .chk
       push    48      ; _NR_signal
       pop     eax
       mov     ecx, [esp+(8*4)+4]
       int     80h
.chk:  inc     ebx
       cmp     bl, 31
       jbe     .cycle
       popa
       ret     4

clean_seh:
       push    0       ; SIG_DFL
       call    set_seh
       ret
