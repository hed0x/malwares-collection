;--------------------------------------------------------------
_valloc:
;eax - size
	push ebx ecx edx esi edi
	push PAGE_READWRITE
	push MEM_COMMIT
	push eax
	push 0
	xcall VirtualAlloc  ; does not use heap
;	push eax
;	push 40h
;	xcall GlobalAlloc
	or eax, eax
	pop edi esi edx ecx ebx
	retn

_vfree:
; eax - addr
	push ebx ecx edx esi edi
	push MEM_RELEASE
	push 0
	push eax
	xcall VirtualFree
;	push eax
;	xcall GlobalFree
	pop edi esi edx ecx ebx
	ret
