   .xlist
   ;ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
   ;º The STructured AssembleR language macros º
   ;ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
   ;      (C) Dmitry Timchenko 1989-1991

   ;       Version 1.4
   ; Turbo Assembler Version. LONG specifier is UNNECESSARY


       ifndef  ??version
   .err    **** Turbo Assembler required. For MASM use STAR13.INC ****
       endif

       if  ??version lt 0200h
   .err    **** Turbo Assembler 2.0 or higher required. Use STAR13T.INC ****
       endif


       ;JUMPS       ;It makes all dirty work of SHORT/LONG
               ; recognizing ( see STAR13.INC )


   ;ÚÄÄÄÄÄ Auxiliary (implementation) macros ÄÄÄÄÄ¿

   ;  Current level counters settings

   S@  MACRO   PN,PL,PV
   PN&@&PL =   PN&@&PL&PV
   T@&PN   =   PN&@&PL
       ENDM

   S@T MACRO   PL
   T@B =   B@&PL
   T@E =   E@&PL
   T@X =   X@&PL
       ENDM


   ;  Label (MARK) settings

   M@  MACRO   PM,PL,PN
   PM&PL&PN    = $
       ENDM


   ;  Forward jump vector generation
   ;   PC  conditon code ( Z/NZ/C/NC... )
   ;   PM  label header
   ;   PL  nesting level
   ;   PN  counter for this level
   ;   INV 0/1 - inverse condition

   J@F MACRO   PC,PM,PL,PN,INV

   V@  =   PM&PL&PN    ;Label to jump to

       IFB <PC>        ;Command: "JMP"

       IF  INV EQ 0    ;INV=0 --> Need command
       jmp V@
       ENDIF           ;else  --> Needn't command

       ELSE            ;Command: "J<PC>"

       IF  INV EQ 0    ;YesJump - straight condition
       _YJ&PC  V@
       ELSE
       _NJ&PC  V@      ;NoJmp - reverse condition
       ENDIF

       ENDIF           ;(Command)
       ENDM


   ;  Reverse jump vector generation
   J@R MACRO   PC,PM,PL,PN
   V@  =   PM&PL&PN

       IFB <PC>;;      Command: JMP
       jmp V@
       ELSE;;          Command: J<PC>
       _YJ&PC  V@
       ENDIF;;         (Command)
       ENDM


   ;  ELSE mode settings
   EL@I    MACRO   PL,VAL
       IFNB    <VAL>
   L@I&PL  =   VAL
       ENDIF
   TL@ =   L@I&PL
       ENDM

   ;  An auxiliary macro
   ;  for counters initialization
   I@NIT   MACRO   PL
   B@&PL   =   0
   E@&PL   =   0
   X@&PL   =   0
   L@I&PL  =   0
       ENDM


   ;   Variables initial settings macro.

   INITS   MACRO   ;;**********

   L@  =   10
       REPT    10
   L@  =   L@-1
       I@NIT   %L@
       ENDM

   _YJO    EQU JO
   _YJNO   EQU JNO
   _YJB    EQU JB
    _YJNAE  EQU     _YJB
    _YJC    EQU     _YJB
   _YJAE   EQU JAE
    _YJNB   EQU     _YJAE
    _YJNC   EQU     _YJAE
   _YJE    EQU JE
    _YJZ    EQU     _YJE
   _YJNE   EQU JNE
    _YJNZ   EQU     _YJNE
   _YJBE   EQU JBE
    _YJNA   EQU     _YJBE
   _YJA    EQU JA
    _YJNBE  EQU     _YJA
   _YJS    EQU JS
   _YJNS   EQU JNS
   _YJP    EQU JP
    _YJPE   EQU     _YJP
   _YJNP   EQU JNP
    _YJPO   EQU     _YJNP
   _YJL    EQU JL
    _YJNGE  EQU     _YJL
   _YJGE   EQU JGE
    _YJNL   EQU     _YJGE
   _YJLE   EQU JLE
    _YJNG   EQU     _YJLE
   _YJG    EQU JG
    _YJNLE  EQU     _YJG

   _YJCXZ  EQU JCXZ
   _YJLU   EQU LOOP
   _YJLUNE EQU LOOPNE
    _YJLUNZ EQU     _YJLUNE
   _YJLUE  EQU LOOPE
    _YJLUZ  EQU     _YJLUNE

   _NJO    EQU JNO
   _NJNO   EQU JO
   _NJB    EQU JNB
    _NJNAE  EQU     _NJB
    _NJC    EQU     _NJB
   _NJAE   EQU JNAE
    _NJNB   EQU     _NJAE
    _NJNC   EQU     _NJAE
   _NJE    EQU JNE
    _NJZ    EQU     _NJE
   _NJNE   EQU JE
    _NJNZ   EQU     _NJNE
   _NJBE   EQU JNBE
    _NJNA   EQU     _NJBE
   _NJA    EQU JNA
    _NJNBE  EQU     _NJA
   _NJS    EQU JNS
   _NJNS   EQU JS
   _NJP    EQU JNP
    _NJPE   EQU     _NJP
   _NJNP   EQU JP
    _NJPO   EQU     _NJNP
   _NJL    EQU JNL
    _NJNGE  EQU     _NJL
   _NJGE   EQU JNGE
    _NJNL   EQU     _NJGE
   _NJLE   EQU JNLE
    _NJNG   EQU     _NJLE
   _NJG    EQU JNG
    _NJNLE  EQU     _NJG

   ; There are no mirror commands for LOOPxx & JCXZ,
   ; so we're forced to use MACROS in these cases

   S@KIP   MACRO   opcod,target
       local   Skip_Label
       opcod   Skip_Label
       jmp target
   Skip_Label  label near
       ENDM

   _NJCXZ  MACRO   target
       S@KIP   JCXZ,target
       ENDM

   _NJLU   MACRO   target
       S@KIP   LOOP,target
       ENDM

   _NJLUNE MACRO   target
       S@KIP   LOOPNE,target
       ENDM

   _NJLUNZ MACRO   target
       S@KIP   LOOPNZ,target
       ENDM

   _NJLUE  MACRO   target
       S@KIP   LOOPE,target
       ENDM

   _NJLUZ  MACRO   target
       S@KIP   LOOPZ,target
       ENDM

       ENDM    ;;**********

   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ


   ;ÚÄÄÄÄÄ        Language macros            ÄÄÄÄÄ¿


   ;  Pass next block till the end or DOELSE
   PASS    MACRO   CND
       S@T %L@+1
       J@F CND,E@,%L@+1,%T@E,0
       S@T %L@
       EL@I    %L@,0
       ENDM

   ;  Enter next block immediately
   GOIN    MACRO   CND
       S@  B,%L@+1,+1
       J@F CND,B@,%L@+1,%T@B,0
       S@  B,%L@+1,-1
       ENDM

   ;  Go to the begin of current block
   REPEAT  MACRO   CND
       J@R CND,B@,%L@,%T@B,0
       ENDM

   ;  Go to the end of current block
   ;   (skip all DOELSE's)
   EXIT    MACRO   CND
       J@F CND,X@,%L@,%T@X,0
       ENDM
   ;
   BREAK   MACRO   CND
       EXIT CND
       ENDM

   ANDIF   MACRO   CND
       J@F CND,E@,%L@,%T@E,1
       ENDM

   ;  Go to the next DOELSE if present
   ;   or to the end of current block
   NEXT    MACRO   CND
       J@F CND,E@,%L@,%T@E,0
       ENDM

   ;  The begin of a block without
   ;  test of condition
   DO  MACRO
   L@  =   L@+1
       S@  B,%L@,+1
       M@  B@,%L@,%T@B
       S@T %L@
       EL@I    %L@,0
       ENDM

   ;  The end of a block without loop
   DONE    MACRO
       M@  X@,%L@,%T@X
       M@  E@,%L@,%T@E
       S@  X,%L@,+1
       S@  E,%L@,+1
   L@  =   L@-1
       S@T %L@
       EL@I    %L@,0
       ENDM

   ;  The end of a loop-block
   CYCLE   MACRO   CND
       REPEAT  CND
       DONE
       ENDM

   ;  The begin of a block with
   ;  condition test
   DOIF    MACRO   CND
   L@  =   L@+1
       S@T %L@
       J@F CND,E@,%L@,%T@E,1
       S@  B,%L@,+1
       M@  B@,%L@,%T@B
       EL@I    %L@,0
       ENDM

   DOWHILE MACRO   CND
       DO
       J@F CND,E@,%L@,%T@E,1
       ENDM

   ;  The alternative block part begin operator
   DOELSE  MACRO
       EXIT    ,LNG
       S@T %L@
       M@  E@,%L@,%T@E
       S@  E,%L@,+1
       EL@I    %L@,1
       ENDM

   ;  The enclosed IF (DOIF-{DOELSE-ELSIF...}-DONE)
   ELSIF   MACRO   CND
       EL@I    %L@
       IF  TL@ NE 1
   .err    *****   STAR error:  ELSIF without DOELSE or with PASS   *****
       ELSE
       J@F CND,E@,%L@,%T@E,1
       S@  B,%L@+1,+1
       M@  B@,%L@+1,%T@B
       S@T %L@
       ENDIF
       EL@I    %L@,0
       ENDM

   DOELSEIF MACRO  CND
       DOELSE
       ELSIF CND
       ENDM

   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

       INITS       ;Variables initialization
   .list
