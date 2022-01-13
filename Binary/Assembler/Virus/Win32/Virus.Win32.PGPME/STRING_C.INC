
; ---------------------------------------------------------------------------

; subroutine:           string_strlen
; input:                edi = asciiz string VA
; output:               ecx = string len
; registers modified:   df=1

; ---------------------------------------------------------------------------

string_strlen:          push    eax
                        push    edi

                        xor     eax, eax

                        xor     ecx, ecx
                        dec     ecx

                        cld
                        repnz   scasb

                        neg     ecx

                        dec     ecx
                        dec     ecx

                        pop     edi
                        pop     eax

                        ret

; ---------------------------------------------------------------------------
