
; input:  EDX=data, ECX=size, EAX=crc
; output: EAX=crc, EDX+=ECX, ECX=BL=0

xcrc16:                 jecxz   .h4
.h1:                    xor     al, [edx]
                        inc     edx
                        mov     bl, 8
.h2:                    shr     eax, 1
                        jnc     .h3
                        xor     ax, 0A001h
.h3:                    dec     bl
                        jnz     .h2
                        loop    .h1
.h4:                    ret

