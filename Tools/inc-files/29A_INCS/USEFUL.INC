;
;                       . .: .:.. :.. .. .:.::. :. ..:
;                     <<-==ÜÛÛÛÛÛÜ=ÜÛÛÛÛÛÜ=ÜÛÛÛÛÛÜ===<
;                      .:: ÛÛÛ ÛÛÛ:ÛÛÛ ÛÛÛ.ÛÛÛ ÛÛÛ .:.
;                      . .:.ÜÜÜÛÛß.ßÛÛÛÛÛÛ.ÛÛÛÛÛÛÛ:..
;                       ...ÛÛÛÜÜÜÜ:ÜÜÜÜÛÛÛ:ÛÛÛ ÛÛÛ.::.
;                      >===ÛÛÛÛÛÛÛ=ÛÛÛÛÛÛß=ÛÛÛ ÛÛÛ=->>
;                     .: .:.. ..:. .: ..:.::. ::.. :.:.
;
;                              [29A INC files]
;                          Basic useful structurez
;                            by Jacky Qwerty/29A
;
; Description
; ÄÄÄÄÄÄÄÄÄÄÄ
; This include file contains all basic constantz and general common structu-
; rez needed to work with other include and source ASM filez. This file will
; work only with TASM(32), of course. MASM sucks.. :P
;
; Disclaimer
; ÄÄÄÄÄÄÄÄÄÄ
; This file was built up by Jacky Qwerty from 29A. The author is not respon-
; sible for any problemz caused due to use/misuse of this file.
;
;
; (c) 1997. No rightz reserved. Use without permision >8P.


LF      equ     10
CR      equ     13
CRLF    equ     <13,10>

lo_hi_byte_word struc
		union
		struc
        lob     db      ?
        hib     db      ?
		ends
	lo_w	dw	?
		ends
        hiw     dw      ?
lo_hi_byte_word ends

Pusha_struc             struc
        Pusha_di        dw      ?
        Pusha_si        dw      ?
        Pusha_bp        dw      ?
        Pusha_sp        dw      ?
        Pusha_bx        dw      ?
        Pusha_dx        dw      ?
        Pusha_cx        dw      ?
        Pusha_ax        dw      ?
Pusha_struc             ends 

cPusha          equ     size Pusha_struc

Pushad_struc            struc
        Pushad_edi      dd      ?
        Pushad_esi      dd      ?
        Pushad_ebp      dd      ?
        Pushad_esp      dd      ?
        Pushad_ebx      dd      ?
        Pushad_edx      dd      ?
        Pushad_ecx      dd      ?
        Pushad_eax      dd      ?
Pushad_struc            ends

cPushad         equ     size Pushad_struc

@copysz		macro
	        local   nxtchr
	nxtchr: lodsb
	        stosb
	        or      al,al
	        jnz     nxtchr
endm

@endsz  	macro
	        local   nxtchr
	nxtchr: lodsb
	        test    al,al
	        jnz     nxtchr
endm

@pushsz         macro   msg2psh, empty
                local   next_instr
                ifnb    <empty>
                %out    too much arguments in macro '@pushsz'
                .err
                endif
                call    next_instr
                db      msg2psh,0
    next_instr:
endm

@pushbytes      macro   bts2psh, empty
                local   next_instr
                ifnb    <empty>
                %out    too much arguments in macro '@push_bytes'
                .err
                endif
                call    next_instr
                db      bts2psh
    next_instr:
endm

if @WordSize eq 2       ; 16 bits

API_Args        struc
        RetAddr dw      ?
        union
        Pshd    dw      ?       ;pushed
        Arg1    dw      ?
        ends
        irp Num, <2,3,4,5,6,7,8,9,10,11,12,13,14,15,16>
        Arg&Num dw      ?
        endm
API_Args        ends

endif

if @WordSize eq 4       ; 32 bits

API_Args        struc
        RetAddr dd      ?
        union
        Pshd    dd      ?       ;pushed
        Arg1    dd      ?
        ends
        irp Num, <2,3,4,5,6,7,8,9,10,11,12,13,14,15,16>
        Arg&Num dd      ?
        endm
API_Args        ends

endif
