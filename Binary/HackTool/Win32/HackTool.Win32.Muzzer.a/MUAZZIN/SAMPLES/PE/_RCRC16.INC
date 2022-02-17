
; input:  EDX=data, ECX=size, EAX=crc
; output: EAX=crc, EDX+=ECX, ECX=BL=0

rcrc16:                 jecxz   .p4
.p1:                    xor     ah, byte [edx+ecx-1]
                        mov     bl, 8
.p2:                    shl     ax, 1
                        jnc     .p3
                        xor     ax, 4003h
.p3:                    dec     bl
                        jnz     .p2
                        loop    .p1
.p4:                    ret
