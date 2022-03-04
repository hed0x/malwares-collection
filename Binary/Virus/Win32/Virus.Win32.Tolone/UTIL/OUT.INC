
;------------------------------------------------------------------------------
;In: 		esi=ASCIIZ string
printf:
		pusha

		mov edi,esi
		xor ecx,ecx
		dec ecx
		xor eax,eax
		repnz scasb

		neg ecx
		dec ecx
		dec ecx

		call print_c
		popa
		ret		

;------------------------------------------------------------------------------
;In:	   	esi=bufer
;		ecx=bytes count

print_c:
	        pusha

		call out_handle
		xchg ebx,eax

		push edi
		mov edi,esp

	        push 0                  		; reserved
	        push edi				; bytes wrt ptr

	        push ecx				; cnt
	        push esi                		; bufer
		push ebx                		; handle
	        xcall WriteFile

		pop eax					; clear stack

	        popa
	        ret

;------------------------------------------------------------------------------
;out:		eax=output handle
out_handle:
		pusha

	        push STD_OUTPUT_HANDLE
	        xcall GetStdHandle
		mov [esp._eax],eax
		
		popa
		ret
