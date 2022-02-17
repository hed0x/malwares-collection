
; input:  EDX=data, ECX=size, EAX=crc
; output: EAX=crc, EDX+=ECX, ECX=BL=0

xcrc32:                 jecxz   .l4
                        not     eax
.l1:                    xor     al, [edx]
                        inc     edx
                        mov     bl, 8
.l2:                    shr     eax, 1
                        jnc     .l3
                        xor     eax, 0EDB88320h
.l3:                    dec     bl
                        jnz     .l2
                        loop    .l1
                        not     eax
.l4:                    ret
