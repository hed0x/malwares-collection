/* asm/jump.nasm   asm code of some kinds of jumps
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */


;I need to verify the jump
;opcodes, using:
;operand-size override



global main
extern printf
extern exit


main:


ltr1: db 0ebh,0fh   ; dump1 
ltr2: db 66h,0e9h,12,2  ;NOOO this works only in real mode!
ltr3: db 0e9h,0,0,0,0  ;nexti 

endtr:
	nop
	call _exit_



dump1:
	push dword str1
	call printf
	add esp,4
	jmp ltr2

dump2:
	push dword str2
	call printf
	add esp,4
	jmp ltr3

dump3:
	push dword str3
	call printf
	add esp,4
	jmp endtr

_exit_:
	call exit

str1 db 'string 111111111',10,0
str2 db 'string 222222222',10,0
str3 db 'string 333333333',10,0

