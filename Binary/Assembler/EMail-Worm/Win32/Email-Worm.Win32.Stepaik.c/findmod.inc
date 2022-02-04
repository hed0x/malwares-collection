findmodules	proc
; arguments:
__mbuf	equ ebx+4 ptr 8h
__procid	equ ebx+4 ptr 0Ch
__hprocess	equ ebx+4 ptr 10h
; locals
__hth	equ ebx-4 ptr 28h
__me32	equ ebx-4 ptr 4FCh
__nbytes 	equ ebx-4 ptr 500h

	push 	ebx
	mov ebx, esp
;	pushad
	sub esp, 600h

	xcall GetVersion
	not eax
	ror eax, 31
	and eax, 1
	or eax, eax
	jnz __nt_getmodules

__w9x_getmodules: ; obtaining the list of modules in win 9x

	mov [__nbytes], 0

TH32CS_SNAPMODULE	equ 00000008h
	push dword ptr [__procid]
	push TH32CS_SNAPMODULE
	xcall CreateToolhelp32Snapshot
	mov [__hth], eax
	cmp eax, -1
	jz __fm_fail
__me_size	equ 	224h
	mov dword ptr [__me32+0], __me_size
	lea eax, [__me32]
	push eax
	push dword ptr [__hth]
	xcall Module32First
	or eax, eax
	jz __fm_fail
	jmp __w9x_module_search

__w9xmodule_next:
	lea eax, [__me32]
	push eax
	push dword ptr [__hth]
	xcall Module32Next
	or eax, eax
	jz __fm_ok
__w9x_module_search:
	; found HMODULE
	mov ecx, [__nbytes]
	add [__nbytes], 4
	cmp ecx, __hmnum*4-4
	jg __fm_fail
	mov esi, [__mbuf]
	mov eax, [__me32+1Ch]	; eax=HMODULE
	mov [esi+ecx], eax
	jmp __w9xmodule_next

__nt_getmodules:
	; get HMODULEs
	lea eax, [__nbytes]
	push eax
	push __hmnum*4
	push dword ptr [__mbuf]
	push dword ptr [__hprocess]
	xcall EnumProcessModules
	or eax, eax
	jz __fm_fail

__fm_ok:
	add esp, 600h
;	popad
	mov eax, [__nbytes]
	mov esp, ebx
	pop ebx
	ret 12

__fm_fail:
	add esp, 600h
;	popad
	mov esp, ebx
	pop ebx
	sub eax, eax
	ret 12

findmodules	endp

