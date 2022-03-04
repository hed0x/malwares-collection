
include blowfish\feistel.ash

;² INIT    ²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
;
;In:    EDI=P table
;       ESI=S table
;       EDX=Key
;
KEY_LENGHT      equ     8                               ; bytes = 64 bits
BlowfishInit:
        pusha

;--[random P XOR P]----------------------------------------------------------
        push edi
        push esi

        mov ecx,18
        xor ebx,ebx                                     ; key delta
        mov esi,edi
init_P:
        lodsd
        xor eax,[edx+ebx]                               ; XOR key part
        stosd

        add ebx,4
        cmp ebx,KEY_LENGHT
        jne init_P_next

        xor ebx,ebx

init_P_next:
        loop init_P

        pop esi
        pop edi
;---------------------------------------------------------------------------

        xor eax,eax                                     ; EAX=EDX=0
        cdq                                             ;

        mov ecx,18/2
        xor ebx,ebx

encrypt_P:
        call BlowfishEncrypt
        mov [edi+ebx],eax                               ; P[i]=Low
        mov [edi+ebx+4],edx                             ; P[i+1]=High

        add ebx,8
        loop encrypt_P

;---------------------------------------------------------------------------

        mov ecx,4
        xor ebx,ebx                                     ; S delta

encrypt_S4:
        xor eax,eax                                     ; EAX=EDX=0
        cdq                                             ;

        push ecx
        mov ecx,256/2
;---------------------------------------------------------------------------
encrypt_S256:

        call BlowfishEncrypt
        mov [esi+ebx],eax
        mov [esi+ebx+4],edx

        add ebx,8
        loop encrypt_S256

;---------------------------------------------------------------------------
        pop ecx
        loop encrypt_S4


        popa
        ret

;² ENCRYPT ²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
;In:    EAX=Low
;       EDX=High
;       ESI=S
;       EDI=P
;Out:   EAX=Encrypted Low
;       EDX=Encrypted High
BlowfishEncrypt:
        push ecx
        push ebx
        push edi

        mov ecx,16

feistel_e:

        feistel

        add edi,4
        loop feistel_e

        xchg eax,edx

        xor edx,[edi]                                   ; xR=xR XOR P[17]
        xor eax,[edi+4]                                 ; xL=xL XOR P[18]

        pop edi
        pop ebx
        pop ecx
        ret

;² DECRYPT ²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
;In:    EAX=Low
;       EDX=High
;       ESI=S
;       EDI=P
;Out:   EAX=Encrypted Low
;       EDX=Encrypted High
BlowfishDecrypt:
        push ecx
        push ebx
        push edi


        add edi,17*4
        mov ecx,16

feistel_d:

        feistel                                        ; Fiestel

        sub edi,4
        loop feistel_d

        xchg eax,edx

        xor edx,[edi]                                   ; xR=xR XOR P[2]
        xor eax,[edi-4]                                 ; xL=xL XOR P[1]

        pop edi
        pop ebx
        pop ecx
        ret
