
; input:  EDX=data, ECX=size, EAX=crc
; output: EAX=crc, EDX+=ECX, ECX=BL=0

rcrc32:                 jecxz   .l4
                        not     eax
.l1:                    mov     bl, byte [edx+ecx-1]
                        shl     ebx, 24
                        xor     eax, ebx
                        mov     bl, 8
.l2:                    shl     eax, 1
                        jnc     .l3
                        xor     eax, 0DB710641h
.l3:                    dec     bl
                        jnz     .l2
                        loop    .l1
                        not     eax
.l4:                    ret
