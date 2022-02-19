;----------------------------------------------------------------------------
; RSA-encryption library (modexp subroutine)                         (x) 2001
;----------------------------------------------------------------------------

; version 1.10, advanced (added two instructions)

; þ variable keylength
; þ small code, but slow
; þ main operations: bit-wise cycles, using RCL,ADC,CMP,SBB
; þ additional high-bit doesn't required anymore

; subroutine: rsa_main
; action:     x = (a^b) mod m

                        locals  @@

modexp                  proc    c
                        arg     bn_bit:DWORD    ; keylen, in BITs
                        arg     x:DWORD         ; result
                        arg     a:DWORD         ; base
                        arg     b:DWORD         ; exponent
                        arg     m:DWORD         ; modulus
                        arg     p:DWORD         ; temporary (a^i) mod m
                        arg     t:DWORD         ; temporary bgnumber
                        local   bn_dword
                        pusha

                        cld

                        mov     ecx, bn_bit
                        add     ecx, 31         ; fixed
                        shr     ecx, 5
                        mov     bn_dword, ecx

; x = 1
                        mov     edi, x
                        xor     eax, eax
                        inc     eax
                        stosd
                        dec     ecx
                        dec     eax
                        rep     stosd

; p = a
                        mov     edi, p
                        mov     esi, a
                        mov     ecx, bn_dword
                        rep     movsd

; ebx = highestbit(b)
                        mov     edi, b
                        call    @@bitscan

; for (edx=0; edx<=ebx; edx++)

                        xor     edx, edx
@@pwr_cycle:            push    edx
                        push    ebx

; if (b.bit[edx])
                        mov     eax, b
                        bt      [eax], edx
                        jnc     @@pwr_nobit

; x=(x*p) mod m
                        mov     edx, x
                        call    @@mulmod

@@pwr_nobit:

; p=(p*p) mod m
                        mov     edx, p
                        call    @@mulmod

; } // for
                        pop     ebx
                        pop     edx

                        inc     edx
                        cmp     edx, ebx
                        jbe     @@pwr_cycle

                        popa
                        ret

; input:  x in EDX
; action: x=(x*p) mod m
; used:   t

                        align   4
@@mulmod:

; t = 0
                        mov     edi, t
                        mov     ecx, bn_dword
                        xor     eax, eax
                        rep     stosd

; ebx = highestbit(p)
                        mov     edi, p
                        call    @@bitscan

; while (ebx >= 0)
; {

@@mul_cycle:

; t *= 2
                        mov     edi, t
                        mov     ecx, bn_dword
                        xor     eax, eax
@@shl_cycle:            rcl     dword ptr [edi], 1
                        lea     edi, [edi+4]
                        loop    @@shl_cycle

                        call    @@cmpsub

; if (p.bit[ebx])
                        mov     eax, p
                        bt      [eax], ebx
                        jnc     @@mul_nobit

; t += x
                        mov     esi, edx
                        mov     edi, t
                        xor     eax, eax
                        mov     ecx, bn_dword
@@add_cycle:            mov     eax, [esi]
                        adc     [edi], eax
                        lea     esi, [esi+4]
                        lea     edi, [edi+4]
                        loop    @@add_cycle

                        call    @@cmpsub

; }

@@mul_nobit:            dec     ebx
                        jns     @@mul_cycle

; x = t
                        mov     edi, edx
                        mov     esi, t
                        mov     ecx, bn_dword
                        rep     movsd

                        retn

; input:  EDI=bignumber
; output: EBX=number of highest bit (0-based)

@@bitscan:              mov     ebx, bn_bit
                        dec     ebx
@@bitscan_cycle:        bt      [edi], ebx
                        jc      @@bitscan_exit
                        dec     ebx
                        jnz     @@bitscan_cycle
@@bitscan_exit:         retn

; action: if (CF:t>=m) CF:t-=m;

                        align   4
@@cmpsub:
                        jc      @@sub           ; fixed

                        mov     esi, t
                        mov     edi, m
                        mov     ecx, bn_dword
                        dec     ecx
@@cmp_cycle:            mov     eax, [esi+ecx*4]
                        cmp     eax, [edi+ecx*4]
                        jb      @@cmpsub_exit
                        ja      @@sub
                        dec     ecx
                        jns     @@cmp_cycle
@@sub:
                        mov     esi, m
                        mov     edi, t
                        mov     ecx, bn_dword
                        xor     eax, eax        ; CF=0
@@sub_cycle:            mov     eax, [esi]
                        sbb     [edi], eax
                        lea     esi, [esi+4]    ; LODSD/SCASD are too slow
                        lea     edi, [edi+4]
                        loop    @@sub_cycle
@@cmpsub_exit:
                        retn

                        endp
