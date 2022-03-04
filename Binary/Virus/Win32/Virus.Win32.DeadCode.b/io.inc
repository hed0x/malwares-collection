
;께 Allocate console 께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;In/Out:	n/a
console_alloc:
		pusha
	        kernelCall AllocConsole
		popa
		ret

;께 Free console 께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;In/Out:	n/a
console_free:
		pusha
	        kernelCall FreeConsole
		popa
		ret

;께 Get output handle 께께께께께께께께께께께께께께께께께께께께께께께께께께께께�
;Out:	EAX = handle
get_out:
		pusha

	        push STD_OUTPUT_HANDLE
	        kernelCall GetStdHandle
		jmp get_exit

;께 Get input handle 께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;Out:	EAX = handle
get_in:
		pusha

	        push STD_INPUT_HANDLE
	        kernelCall GetStdHandle
get_exit:
		mov [esp._eax],eax
		popa
		ret


;께 Read from console 께께께께께께께께께께께께께께께께께께께께께께께께께께께께�
;In:	ESI = bufer,
;	ECX = reading bytes count
console_read:
		pusha

		push eax
		mov edi,esp

		push 0
		push edi
		push ecx
		push esi
				
		call get_in
		push eax
		kernelCall ReadConsoleA

		pop eax

		popa
		ret

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;In:            ESI = ASCIIZ string offset
prints:
                pusha

                xor eax,eax
                xor ecx,ecx
                dec ecx
                mov edi,esi
                repnz scasb
                neg ecx
                dec ecx
                dec ecx

                call printc
                popa
                ret

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;In:            ESI= bufer
;               ECX= bufer length
printc:
                pusha

                call get_out
                xchg ebx,eax

                push edi
                mov edi,esp                             ;ebx=bytes writed

                push 0                                  ;reserved
                push edi                                ;bytes writed

                push ecx                                ;count
                push esi                                ;bufer
                push ebx                                ;handle
                kernelCall WriteConsoleA

                pop eax                                 ;clear stack

                popa
                ret

comment ~
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;In:            EAX = value
print4d:
                pusha

                push eax
                fild 4 ptr[esp]
                pop eax

                sub esp,10
                fbstp 10 ptr[esp]

                mov eax,[esp]
                call print4h

                add esp,10

                popa
                ret
~

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;In:            EAX = value
print4h:
                pusha

                mov ecx,8

print4h_main:
                rol eax,4

                push eax

                and al,0Fh
                cmp al,10                               ;
                sbb al,69h                              ; hex->ascii
                das                                     ;

                push ecx
                push ecx                                ; esp= temp bufer

                mov [esp],eax
                mov esi,esp
                xor ecx,ecx
                inc ecx
                call printc

                pop ecx
                pop ecx

                pop eax
                loop print4h_main

                popa
                ret

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;in:            Al=byte to print
print1b:
                pusha

                mov ecx,8
@@next_bit:
                mov ah,'0'

                shl al,1
                jnc nextbitprint

                inc ah                                  ; AH = '1'
nextbitprint:
                xchg ebx,ecx

                push  ecx
                mov 1 ptr[esp],ah
                mov esi,esp
                mov ecx,1
                call printc
                pop ecx

                xchg ebx,ecx

                loop @@next_bit

                popa
                ret