
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

z_decode:               pusha
                        mov    esi, [esp+32+4]
                        mov    edi, [esp+32+8]
                        call   z_decode_asm
                        popa
                        ret 4*2

z_decode_asm:           pusha

                        sub    edx, edx         ; code
                        sub    ecx, ecx         ; len

                        lodsd                   ; packed size
                        lodsd                   ; unpacked size

.cycle:                mov    eax, edi
                        sub    eax, [esp]      ; pusha.edi = dst_buf
                        mov    ebp, [esp+4]    ; pusha.esi = src_buf
                        cmp    eax, [ebp+4]    ; unpacked size
                        jb     near .cont
;.exit:
                        popa
                        ret

.getbit:               call   .suck_in
                        dec    ecx
                        shr    edx, 1
                        setc   al
                        ret

.cont:                 call   .getbit
                        jnc    near .k0
                        call   .getbit
                        jnc    near .k10
                        call   .getbit
                        jnc    near .k110
                        call   .getbit
                        jnc    near .k1110
                        call   .getbit
                        jnc    near .k11110
.c_7003:
.k11111:               dec    eax              ; eax<--0, doesnt modify CF
                        stosd
                        call   .getbyte
                        xchg   al, ah
.c1:                   or     ah, ah
                        jz     near .cycle
                        stosb
                        dec    ah
                        jmp near     .c1

.c_7002:
.k11110:               stosb
.c_7001:
.k1110:                sub    eax, eax
                        stosb
.stosb_jmpcycle:       stosb
.jmpcycle:             jmp near   .cycle

.c_7000:
.k0:                   call   .getbyte
                        jmp near     .stosb_jmpcycle

.c_7004:
.k10:                  call   .getbit
                        xchg   ebp, eax
                        call   .getbit
                        rcl    ebp, 1
                        jmp near    .cpy

.c_7005:
.k110:                 call   .getbyte
                        xchg   ebp, eax

.cpy:                  inc    ebp
                        inc    ebp


                        call   .getbyte
                        xchg   ebx, eax

                        call   .getbit
                        jnc near    .byte

                        call   .getbyte
                        mov    bh, al
.byte:
                        add    ebx, ebp
                        neg    ebx

.c2:                   mov    al, [ebx+edi]
                        stosb
                        dec    ebp
                        jnz near    .c2

                        jmp near     .jmpcycle

.getbyte:              call   .suck_in
                        sub    cl, 8
                        mov    al, dl
                        shr    edx, 8
                        ret

.suck_in:              sub    eax, eax
                        cmp    cl, 8
                        jae    near .rt
                        lodsb
                        ror    edx, cl
                        or     dl, al
                        rol    edx, cl
                        add    cl, 8
.rt:                   ret

; ---------------------------------------------------------------------------
