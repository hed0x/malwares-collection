
; Z1 hashing algorithm ;-)

hash_z1                 proc    c

                        arg     ibuf    ; input buffer
                        arg     isize   ; input buffer size
                        arg     obuf    ; output hash buffer
                        arg     osize   ; output hash size, MIN = 16 bytes

                        pusha
                        cld

                        mov     ecx, osize
                        sub     osize, 16
                        jc      __exit
                        mov     edi, obuf       ; zerofill hash buf
                        xor     eax, eax
                        rep     stosb

                        mov     ecx, isize
                        jecxz   __exit

                        ; temp hash regs
                        mov     eax, 052CD2C45h
                        mov     ebx, 09A4D5B64h
                        mov     ecx, 085FE0C33h
                        mov     edx, 0C1D496A1h

                        xor     esi, esi        ; src index
                        xor     edi, edi        ; dst index

__cycle:                add     esi, ibuf       ; get byte
                        xor     ah, [esi]
                        add     bh, [esi]
                        sub     ch, [esi]
                        rol     dh, cl
                        sub     esi, ibuf

                        call    __hashfuck      ; pervert hash regs

                        add     edi, obuf
                        add     [edi+0], eax      ; accumulate
                        adc     [edi+4], ebx
                        sbb     [edi+8], ecx
                        adc     [edi+12], edx
                        sub     edi, obuf

                        inc     edi             ; dst++
                        cmp     edi, osize
                        jb      __cont
                        xor     edi, edi
__cont:
                        inc     esi             ; src++
                        cmp     esi, isize
                        jb      __cycle

__exit:                 popa
                        ret

; input: eax,ebx,ecx,edx=hash, esi,edi=indexes

__hashfuck:             push    ebp

                        mov     ebp, esi
                        imul    ebp, eax
                        imul    ebp, ebx
                        imul    ebp, ecx
                        imul    ebp, edx
                        and     ebp, 127
                        add     ebp, 127

__hfcycle:              add     eax, ebx
                        xor     ebx, ecx
                        sub     ecx, edx
                        xor     edx, eax

                        xchg    al, bl
                        xchg    bl, cl
                        xchg    cl, dl
                        xchg    dl, ah
                        xchg    ah, bh
                        xchg    bh, ch
                        xchg    ch, dh

                        xor     eax, esi
                        sub     ebx, ebp
                        xor     ecx, edi
                        add     edx, ebp

                        rol     eax, 11
                        ror     ebx, 13
                        rol     ecx, 17
                        ror     edx, 19

                        shl     eax, 1
                        jnc     __skip1
                        xor     eax, 0E9B6C7AAH
__skip1:
                        shl     ebx, 1
                        jnc     __skip2
                        xor     ebx, 0F7537E82H
__skip2:
                        shl     ecx, 1
                        jnc     __skip3
                        xor     ecx, 0655B59C3H
__skip3:
                        shl     edx, 1
                        jnc     __skip4
                        xor     edx, 0A3014314H
__skip4:
                        dec     ebp
                        jnz     __hfcycle

                        pop     ebp
                        retn

hash_z1                 endp
