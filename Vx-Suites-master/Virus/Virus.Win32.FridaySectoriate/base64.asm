;*******************************************************************************;
;			base64.asm, v 0.1 12.11.2000
;			~~~~~~~~~~
;
;	written by:	caspar
;	group:		/CookieCrk/
;
;	contact:	caspar@cookiecrk.org
;			caspar@ae.pl
;
;	visit us at:	http://www.cookiecrk.org
;
;
; base64.asm
;
;	usage:		see test.asm
;
;	output:		number of bytes encoded - decoded
;			Base64_Encode - _Str receives encoded data
;			as a null terminated string
;
;	rights:		unless you modify it or earn on it it's freeware
;			it would be nice if you mentioned me in your proggie 8-]
;
;
; CookieCrk 2000
; All rights reversed
;*******************************************************************************;




.data

base64 db 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/',0


.code


pos PROC uses ebx ecx, Ci:DWORD

	lea eax, base64
	mov ebx, eax
	mov ecx, Ci

_loop:

	cmp byte ptr [ebx], 0
	je _none

	cmp byte ptr [ebx], cl
	je _found

	inc ebx

	jmp _loop

_found:

	sub ebx, eax
	mov eax, ebx

	ret

_none:

	mov eax, -1

	ret

pos ENDP



Base64_Encode PROC uses edi esi ebx, Data:DWORD, _Size:DWORD, _Str:DWORD
	LOCAL s:DWORD

	mov eax, _Size
	sal eax, 2
	xor ebx, ebx
	xor edx, edx
	mov bl, 3
	div ebx
	add eax, 4

	push eax
	push 0
	call GlobalAlloc

	mov s, eax
	mov edi, eax
	mov ebx, Data

	xor esi, esi

_loop_:

	cmp esi, _Size
	jge _end

	xor ecx, ecx
	mov cl, byte ptr [ebx + esi]
	inc esi
	sal ecx, 8

	cmp esi, _Size
	jge next

	xor edx, edx
	mov dl, byte ptr [ebx + esi]
	add ecx, edx

next:

	inc esi
	sal ecx, 8

	cmp esi, _Size
	jge _next

	xor edx, edx
	mov dl, byte ptr [ebx + esi]
	add ecx, edx

_next:

	inc esi

	mov eax, ecx
	and eax, 0fc0000h
	shr eax, 18
	mov dl, byte ptr [eax + base64]
	mov byte ptr [edi], dl

	mov eax, ecx
	and eax, 3f000h
	shr eax, 12
	mov dl, byte ptr [eax + base64]
	mov byte ptr [edi + 1], dl

	mov eax, ecx
	and eax, 0fc0h
	shr eax, 6
	mov dl, byte ptr [eax + base64]
	mov byte ptr [edi + 2], dl

	mov eax, ecx
	and eax, 3fh
	mov dl, byte ptr [eax + base64]
	mov byte ptr [edi + 3], dl

	cmp esi, _Size
	jle __next

	mov byte ptr [edi + 3], '='

__next:

	mov edx, _Size
	inc edx

	cmp esi, edx
	jle ___next

	mov byte ptr [edi + 2], '='

___next:

	add edi, 4

	jmp _loop_

_end:

	mov byte ptr [edi], 0
	mov edi, s

	push edi
	push _Str
	call lstrcpy

	push _Str
	call lstrlen

	ret

Base64_Encode ENDP



Base64_Decode PROC uses edi esi ebx, _Str_:DWORD, Data:DWORD
	LOCAL done:DWORD

	mov done, 0
	mov ebx, Data
	mov edi, _Str_

loop_:

	cmp byte ptr [edi], 0
	je end_

	cmp done, 0
	jne end_

	mov dl, byte ptr [edi]

	push edx
	call pos

	cmp eax, 0			; ---- if 
	jl else_

	mov ecx, eax

	jmp next_

else_:					; ---- else

	mov done, 3
	jmp end_

next_:					; ---- endif

	sal ecx, 6

	mov dl, byte ptr [edi + 1]

	push edx
	call pos

	cmp eax, 0			; ---- if
	jl else__			

	add ecx, eax

	jmp next__

else__:					; ---- else

	mov eax, -1

	ret

next__:					; ---- endif

	sal ecx, 6

	cmp byte ptr [edi + 2], '='	; ---- if
	jne else___

	inc done

	jmp next___

else___:				; ---- else

	mov dl, byte ptr [edi + 2]

	push edx
	call pos

	cmp eax, 0				; -- if
	jl else____

	add ecx, eax

	jmp next___

else____:					; -- else

	mov eax, -1

	ret
						; -- endif
next___:				; ---- endif

	sal ecx, 6

	cmp byte ptr [edi + 3], '='	; ---- if
	jne else_____

	inc done

	jmp next_____

else_____:				; ---- else

	cmp done, 0				; -- if
	jle else______

	mov eax, -1

	ret

else______:					; -- else

	mov dl, byte ptr [edi + 3]

	push edx
	call pos

	cmp eax, 0					; if
	jl else_______

	add ecx, eax

	jmp next_____

else_______:						; else

	mov eax, -1

	ret
							; endif
next_____:					; -- endif
					; ---- endif sic(!)
	cmp done, 3			; musze sie na masm'a przerzucic...
	jge ne_

	mov eax, ecx
	and eax, 0ff0000h
	shr eax, 16
	mov byte ptr [ebx], al
	inc ebx

ne_:

	cmp done, 2
	jge ne__

	mov eax, ecx
	and eax, 0ff00h
	shr eax, 8
	mov byte ptr [ebx], al
	inc ebx

ne__:

	cmp done, 1
	jge ne___

	mov eax, ecx
	and eax, 0ffh
	mov byte ptr [ebx], al
	inc ebx

ne___:

	add edi, 4

	jmp loop_

end_:

	mov eax, ebx
	sub eax, Data

	ret

Base64_Decode ENDP


