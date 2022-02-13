
; as fast as possible

                        gen_modexp      128             ; see RSALIB3.INC
                        gen_modexp      256
                        gen_modexp      512
                        gen_modexp      1024
                        gen_modexp      2048

; main modexp() subroutine.
; input:  keylen -- key length (in BITs)
;         rsa_x  -- number to be raised to a power
;         rsa_e  -- exponent
;         rsa_n  -- modulus
;         rsa_e_len -- length of e number, in BITs
; output: rsa_y  -- resulting number
; action: y = (x^e) mod n

crypto:
                        mov     eax, keylen
                        cmp     eax, 128
                        je      __rsa128
                        cmp     eax, 256
                        je      __rsa256
                        cmp     eax, 512
                        je      __rsa512
                        cmp     eax, 1024
                        je      __rsa1024
                        cmp     eax, 2048
                        je      __rsa2048

                        push    offset rsa_t2   ; temp2 // size * 2
                        push    offset rsa_t1   ; temp1
                        push    offset rsa_n    ; n
                        push    offset rsa_e    ; e
                        push    offset rsa_x    ; input
                        push    offset rsa_y    ; output
                        push    eax             ; e.maxbit (e==3==11b)
                        call    modexp
                        add     esp, 7*4
                        retn

__rsa128:               call    pushit
                        call    rsa_modexp_128
                        jmp     __rsa_xxx

__rsa256:               call    pushit
                        call    rsa_modexp_256
                        jmp     __rsa_xxx

__rsa512:               call    pushit
                        call    rsa_modexp_512
                        jmp     __rsa_xxx

__rsa1024:              call    pushit
                        call    rsa_modexp_1024
                        jmp     __rsa_xxx

__rsa2048:              call    pushit
                        call    rsa_modexp_2048

__rsa_xxx:              add     esp, 7*4
                        retn

pushit:                 pop     eax
                        push    offset rsa_t2   ; temp2 // size * 2
                        push    offset rsa_t1   ; temp1
                        push    offset rsa_n    ; n
                        push    offset rsa_e    ; e
                        push    offset rsa_x    ; input
                        push    offset rsa_y    ; output
                        push    rsa_e_len       ; e.maxbit (e==3==11b)
                        jmp     eax

; pre-calculates length of the rsa_e numbers, to avoid N calculations.
; input: rsa_e  -- exponent (both e and d here)
;        keylen --  key length in bits
; output: rsa_e_len -- length of the rsa_e number, in BITs

calc_e_len:             pusha
                        lea     eax, rsa_e
                        mov     ebx, keylen
                        dec     ebx
__bs1:                  bt      [eax], ebx
                        jc      __bs2
                        dec     ebx
                        jnz     __bs1
__bs2:                  inc     ebx
                        mov     rsa_e_len, ebx
                        popa
                        retn
