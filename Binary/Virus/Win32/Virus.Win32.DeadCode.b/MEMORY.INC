;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;VOID* MALLOC (DWORD bytes_count);
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
malloc:
		pusha

		push 4 ptr[esp+8*4+4]
		push GMEM_FIXED
		kernelCall GlobalAlloc

memory_exit:		
		mov [esp._eax],eax
		popa
		ret


;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;FREE  (VOID* bufer);
;IN:	EAX=bufer
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
free:
		pusha

		push 4 ptr[esp+8*4+4]
		kernelCall GlobalFree
		popa
		ret
