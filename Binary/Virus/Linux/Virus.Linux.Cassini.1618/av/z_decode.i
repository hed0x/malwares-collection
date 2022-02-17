; ---------------------------------------------------------------------------
; subroutine: z_decode                                               (x) 2001
; action:     decompress buffer (fast!). details in Z_CODING.TXT
; input:      ESI=compressed buffer
;             EDI=decompressed buffer
; output:     none
; size:       17X bytes
; ---------------------------------------------------------------------------

; void __cdecl z_decode(BYTE* ibuf, BYTE* obuf);
;                           ESI        EDI

z_decode:           pusha

                        xor    edx, edx         ; code
                        xor    ecx, ecx         ; len

                        lodsd                   ; packed size
                        lodsd                   ; unpacked size

                        call   .addr1

.getbit:               call   .suck_in
                        dec    ecx
                        shr    edx, 1
                        setc   al
                        retn

.addr1:                pop    ebx             ; ebx = .getbit

.cycle:                mov    eax, edi
                        sub    eax, [esp]      ; pusha.edi = dst_buf
                        mov    ebp, [esp+4]    ; pusha.esi = src_buf
                        cmp    eax, [ebp+4]    ; unpacked size
                        jb     .cont
;.exit:
                        popa
                        retn

.cont:                 call   ebx              ; .getbit
                        jnc    .k0
                        call   ebx              ; .getbit
                        jnc    .k10
                        call   ebx              ; .getbit
                        jnc    .k110
                        call   ebx              ; .getbit
                        jnc    .k1110
                        call   ebx              ; .getbit
                        jnc    .k11110
.c_7003:
.k11111:               dec    eax              ; eax<--0, doesnt modify CF
                        stosd
                        call   .getbyte
                        xchg   al, ah
.c1:                   or     ah, ah
                        jz     .cycle
                        stosb
                        dec    ah
                        jmp    .c1

.c_7002:
.k11110:               stosb
.c_7001:
.k1110:                sub    eax, eax
                        stosb
.stosb_jmpcycle:       stosb
.jmpcycle:             jmp    .cycle

.c_7000:
.k0:                   call   .getbyte
                        jmp    .stosb_jmpcycle

.c_7004:
.k10:                  call   ebx              ; .getbit
                        xchg   ebp, eax
                        call   ebx              ; .getbit
                        rcl    ebp, 1
                        jmp    .cpy

.c_7005:
.k110:                 call   .getbyte
                        xchg   ebp, eax

.cpy:                  inc    ebp
                        inc    ebp

                        push   ebx

                        call   .getbyte
                        xchg   ebx, eax

                        call   eax              ; .getbit
                        jnc    .byte

                        call   .getbyte
                        mov    bh, al
.byte:
                        add    ebx, ebp
                        neg    ebx

.c2:                   mov    al, [ebx+edi]
                        stosb
                        dec    ebp
                        jnz    .c2

                        pop    ebx
                        jmp    .jmpcycle

.getbyte:              call   .suck_in
                        sub    cl, 8
                        mov    al, dl
                        shr    edx, 8
                        retn

.suck_in:              xor    eax, eax
                        cmp    cl, 8
                        jae    .rt
                        lodsb
                        ror    edx, cl
                        or     dl, al
                        rol    edx, cl
                        add    cl, 8
.rt:                   retn

; ---------------------------------------------------------------------------
