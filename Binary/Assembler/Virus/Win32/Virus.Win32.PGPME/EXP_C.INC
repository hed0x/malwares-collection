
; subroutine:           init_exp
; input:                ebx = any address inside of KERNEL32.DLL
; output:               zf=1      if error
;                       zf=0      otherwise

init_exp:               pusha

                        call    get_base_ebp

                        call    export_findlibrary

                        xor     edx, edx
                        lea     esi, exp_names[ebp]

__cycle:                cmp     [esi], dh
                        je      __exit_nz

                        call    export_getprocaddress
                        jz      __exit                          ; zr

                        mov     exp_addrs[edx*4][ebp], eax

                        mov     edi, esi
                        call    string_strlen
                        lea     esi, [esi + ecx + 1]

                        inc     edx

                        jmp     __cycle

__exit_nz:              inc     edx                             ; nz

__exit:                 popa
                        ret
