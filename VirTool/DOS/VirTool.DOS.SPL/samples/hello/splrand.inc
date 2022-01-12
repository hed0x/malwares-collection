;   SPL for Windows V2.00
;   (c)1997 by ANAX	   
;
;   Description	:
;    This file contain the random generator function "splrand" 
;   Copy this function to your source file or put the command:
;   "INCLUDE splrand.inc" in your source file.   
; -------------------------------------------------------------






;------------------------------------------------------
;Fuction <splrand>
;The random number generator.
;You must call this fuction before <sple>.
;Input:
;	ES:0000= Segment adress of a memory block.
;Output:
;	Registers and Flags are not effected.
;       The first 256 words (512 bytes) of this block will be used
;       as variable area. All variables of your engine are located 
;	there. <splrand> sets all variables to random values.
;
;------------------------------------------------------
splrand PROC NEAR 
        PUSHF 
        PUSH AX 
        PUSH BX 
        MOV BX,512        
splrandloop: 
        IN AL,040h        
        XOR ES:[BX-1],AL
        DEC BX
        JNZ splrandloop 
        POP BX 
        POP AX 
        POPF 
        RET 
splrand ENDP 
;------------------------------------------------------

