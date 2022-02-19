;----------------------------------------------------------------------------
; RSA-encryption library (modexp subroutine)                         (x) 2001
;----------------------------------------------------------------------------

; version 3.10 (fixed keylength)

; þ fixed keylength
; þ lots of code (depending on keylength)
; þ main operations: MUL,CMP,SBB
;   (used CPU's multiplication, 2 times faster than v1.00)
; þ a bit bugfixed, so additional dword doesn't required anymore

gen_modexp              macro   k

bn_bit                  =       k
bn_dword                =       bn_bit/32

; action:     x = (a^e) mod m

                        locals  @@

rsa_modexp_&k           proc    c

                        arg     e_len:DWORD     ; in BITs
                        arg     x_ptr:DWORD     ; result --output
                        arg     a_ptr:DWORD     ; base   --input
                        arg     e_ptr:DWORD     ; exponent
                        arg     m_ptr:DWORD     ; modulus
                        arg     p_ptr:DWORD     ; temp
                        arg     t_ptr:DWORD     ; temp (size*2)

                        local   x1
                        local   x2

                        pusha
                        cld

; x = 1
                        mov     edi, x_ptr
                        mov     edx, edi
                        xor     eax, eax
                        mov     ecx, bn_dword
                        rep     stosd
                        inc     dword ptr [edx]

; p = a
                        mov     esi, a_ptr
                        mov     edi, p_ptr
                        mov     ecx, bn_dword
                        rep     movsd

; for (x1 = 0; x1 < e_len; x1++)

                        mov     x1, 0

                        align   4
@@exp_cycle:

; if (e.bit[x1])
                        mov     eax, e_ptr
                        mov     edx, x1
                        inc     x1
                        bt      [eax], edx
                        jnc     @@exp_nobit

; x=(x*p) mod m
                        mov     ecx, x_ptr
                        call    @@mulmod

                        align   4
@@exp_nobit:

                        dec     e_len
                        jz      @@exp_exit
; p=(p*p) mod m
                        mov     ecx, p_ptr
                        call    @@mulmod

; } // for
                        jmp     @@exp_cycle
@@exp_exit:
                        popa
                        ret

; input:  x in ECX
; action: t = x * p
; used:   x = t mod m

                        align   4
@@mulmod:

; t = 0
                        xor     eax, eax

                        mov     edi, t_ptr
                        i=0
                        rept    bn_dword*2
;                       mov     [edi+i], eax
                        stosd
                        i=i+4
                        endm

; esi = maxdword(edx)
                        mov     esi, (bn_dword-1)*4
                        align   4
@@x2:                   cmp     [ecx+esi], eax
                        jne     @@x1
                        sub     esi, 4
                        jnz     @@x2
                        align   4
@@x1:

; edi = maxdword(p)
                        mov     edi, (bn_dword-1)*4
                        mov     ebx, p_ptr
                        align   4
@@x3:                   cmp     [ebx+edi], eax
                        jne     @@x4
                        sub     edi, 4
                        jnz     @@x3
                        align   4
@@x4:
                        mov     x2, edi

; for (int i=maxi; i>=0; i-=4)
; for (int j=maxj; j>=0; j-=4)

                        align   4
@@cycle_1:
                        mov     edi, x2

                        align   4
@@cycle_2:

; t[j+1]:t[j] += x[i] * p[j];

                        mov     eax, [esi+ecx]      ; x[i]
                        mov     edx, p_ptr
                        mov     edx, [edx+edi]      ; p[j]
                        nop
                        mul     edx

;                       lea     ebx, t[esi+edi]         ; t[i+j]
                        mov     ebx, t_ptr
                        add     ebx, esi
                        add     ebx, edi
                        add     [ebx], eax
                        lea     ebx, [ebx+4]
                        adc     [ebx], edx

                        align   4
@@x5:                   lea     ebx, [ebx+4]
                        adc     dword ptr [ebx], 0
                        jc      @@x5


; }; // for
; }; // for
                        sub     edi, 4
                        jns     @@cycle_2
                        sub     esi, 4
                        jns     @@cycle_1

; action: x = t % m
                        mov     esi, t_ptr

; x = hi(t)
                        q = 1           ; bn_dword..0, ok=1

                        i=0
                        rept    bn_dword-q ; <-- *** MUST BE: bn_dword-1 ***
                        mov     eax, [esi+2*bn_bit/8-(bn_dword-q)*4+i]
                        mov     [ecx+i], eax
                        i=i+4
                        endm
                        j=i
                        rept    q
                        if j eq i
                        xor     eax, eax
                        endif
                        mov     [ecx+j], eax
                        j=j+4
                        endm

; for (int i=scanmaxbit(t); i>=0; i--)
; {
                        mov     ebx, 2*bn_bit - 1 - i*8

                        align   4
@@cycle_3:

; x = (x<<1) | bn_getbit(t,i);
                        bt      [esi], ebx

                        i=0
                        rept    bn_dword
                        rcl     dword ptr [ecx+i], 1
                        i=i+4
                        endm

                        ;;
                        jc      @@sub           ; fixed
                        ;;

; if (x>=m) x-=m;
                        mov     edx, m_ptr

                        i       = (bn_dword - 1) * 4
                        rept    bn_dword
                        mov     eax, [ecx+i]
                        cmp     eax, [edx+i]
                        jb      @@nosub
                        ja      @@sub
                        i       = i - 4
                        endm

                        align   4
@@sub:
                        i=0
                        rept    bn_dword
                        mov     eax, [edx+i]
                        if i eq 0
                        sub     [ecx+i], eax
                        else
                        sbb     [ecx+i], eax
                        endif
                        i=i+4
                        endm

                        align   4
@@nosub:

; }; // for
                        dec     ebx
                        jns     @@cycle_3

                        retn

                        endp

                        endm

