
; input:  EDX=data, ECX=size, EAX=crc
; output: EAX=crc, EDX+=ECX, ECX=0

xcrc32:                 jecxz   __4
                        push    ebx
                        not     eax
__1:                    xor     al, [edx]
                        inc     edx
                        mov     bl, 8
__2:                    shr     eax, 1
                        jnc     __3
                        xor     eax, 0EDB88320h
__3:                    dec     bl
                        jnz     __2
                        loop    __1
                        not     eax
                        pop     ebx
__4:                    ret

