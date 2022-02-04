; debug console
locals __
locals @@
__x	equ rec
_init:
	; no params
	pushad
	xcall AllocConsole
	or eax, eax
	jz __iret
	push -11	;STD_OUTPUT_HANDLE
	xcall GetStdHandle
	mov [ebp+console-__x], eax
__iret:
	popad
	ret
_cout:
; [esp]->output string
	pushad
	mov edi, [esp+24h]
	sub eax, eax
	push eax
	lea eax, [ebp+wrtn-__x]
	push eax
	mov edx, edi
	sub ecx, ecx
	dec ecx
	sub eax, eax
	repnz scasb
	neg ecx
	add ecx, -2
	push ecx
	push edx
	push 4 ptr [ebp+console-__x]
	xcall WriteFile
	popad
	ret 4


console	dd 0
wrtn	dd 08