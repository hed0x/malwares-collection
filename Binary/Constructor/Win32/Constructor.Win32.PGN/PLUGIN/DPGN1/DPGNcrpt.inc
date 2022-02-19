
;----------------------------------------------------------------------------
; these subroutines used both in DPGNHASH utility and DPGN-decryption plugin.
;----------------------------------------------------------------------------

; input: ESI=rsa_x
;        ECX=keylen [bit]

xorcrypt:               shr     ecx, 3
                        dec     ecx
__cycle:                xor     [esi+ecx-1], cl
                        loop    __cycle
                        ret

; input: ESI=rsa_x
;        ECX=keylen [bit]

calc_hash:              shr     ecx, 5
                        xor     eax, eax
__cycle:                add     eax, [esi]
                        rol     eax, cl
                        add     esi, 4
                        loop    __cycle
                        retn

;----------------------------------------------------------------------------
; this subroutine used in the DPGN-decryption plugin.
;----------------------------------------------------------------------------

; for (unsigned i=0; i<datalen; i++)   <-- encryption, as in DPGN.CPP
;   data[i] ^= hash[i%hashlen];

; input:
;        ESI=data
;        ECX=datalen
;        EDI=hash    (rsa_x)
;        EBX=hashsize (keylen/8)

decr_data:              xor     edx, edx
__cycle:                mov     al, [edi+edx]   ; rsa_x[ i % (keylen/8) ]
                        inc     edx
                        xor     [esi], al       ; data[i]
                        inc     esi
                        cmp     edx, ebx
                        jb      __cont
                        xor     edx, edx
__cont:                 loop    __cycle
                        retn

;----------------------------------------------------------------------------

