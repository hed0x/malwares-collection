
feistel        macro

        xor eax,[edi]                                   ; xL=xL xor P[i]

        push eax
        push edx

        mov edx,eax

        movzx eax,dl                                    ;
        mov ebx,[(esi+256*0)+eax]                       ; +S1,a

        movzx eax,dh                                    ;
        add ebx,[(esi+256*1)+eax]                       ; +S2,b

        shr edx,16
        movzx eax,dl                                    ; XOR S1,c
        xor ebx,[(esi+256*2)+eax]                       ;

        movzx eax,dh                                    ; + S4,d
        add ebx,[(esi+256*3)+eax]                       ;

        pop edx
        pop eax

        ; EBX = F(xL)

        xor edx,ebx                                     ; xR=xR XOR F(xL)
        xchg eax,edx

        endm