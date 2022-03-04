
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;In:    edi     =       bufer with data
;       ecx     =       data lenght
;Out:   eax     =       crc32

CRC32:
                pusha

                mov ebx,04C11DB7h
		mov esi,edi
                xor edx,edx

next_8_bites:
                push ecx

                xor eax,eax
                lodsb
                shl  eax,32-8-1
                mov ecx,8
carry_find:

                shl eax,1
                shld edx,eax,1
                jnc not_carry

                xor edx,ebx
not_carry:

                loop carry_find

                pop ecx

                loop next_8_bites

                ;add null bites

                mov ecx,32
@carry_find:
                shl edx,1
                jnc @not_carry
                xor edx,ebx
@not_carry:
                loop    @carry_find

                mov [esp._eax],edx                      ;return CRC in eax
                popa
                ret

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;osimport (DWORD crc,VOID* kernel)
osimport:

                pusha

                mov ebx,[esp+8*4]+4                     ;crc
                mov edx,[esp+8*4+4]+4                   ;kernel

                mov ebp,[edx+3Ch]                       ;pe_header
                mov ebp,[edx+ebp+78h]                   ;export
                add ebp,edx

                mov esi,[ebp+20h]                       ;names
		add esi,edx

		mov edi,[ebp+24h]			;ords
		add edi,edx

		mov ecx,[ebp+18h]			;cnt of names
os_name:
		lodsd					;adress
		add eax,edx

		push edi
		push ecx
		push ebx

		mov ebx,eax				;ebx=string
		xchg edi,eax				;edi=offset
                xor eax,eax
		mov ecx,eax				;string size
		dec ecx                                 ;
                repnz scasb

                mov ecx,edi
                sub ecx,ebx
                dec ecx                                 ;ecx=size

		mov edi,ebx
		;edi=data,ecx=size
                call CRC32

		pop ebx
		pop ecx
		pop edi

                cmp ebx,eax
                jne os_next

;-----------------------------------------------------------------------------
		movzx eax,2 ptr[edi]			;ordinal
		add eax,[ebp+10h]			;ord base
		dec eax					;correct ord=>array

		mov esi,[ebp+1Ch]			;adresses
		add esi,edx

		mov eax,[esi+eax*4]			;eax=function adress
		add eax,edx
os_ret:
                mov [esp._eax],eax                      ;return result
                popa
                ret 8
;-----------------------------------------------------------------------------
os_next:
		scasw					;next ord
		loop os_name
os_name_end:
                xor eax,eax                             ;error occured
                jmp os_ret


;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께

seh_fkernel:
		pusha


	        xor eax,eax

		cdq					;edx=-1
		dec edx                                 ;

	        mov eax,fs:[eax]
scan:
	        cmp [eax],edx				;[eax]==-1
	        je s_end

	        mov eax,[eax]
	        jmp scan
s_end:
	        mov esi,[eax+4]

;-----------------------------------------------------------------------------

		xor ecx,ecx					;ecx=1024
		mov ch,4                                        ;

	        xor si,si
page_scan:
	        cmp 2 ptr[esi],'ZM'
	        jne page_scan_next

	        mov eax,[esi+3Ch]
	        cmp 4 ptr[esi+eax],'EP'
	        jne page_scan_next

page_scan_exit:
		mov [esp._eax],esi
		popa
		ret

page_scan_next:
	        sub esi,1000h
	        loop page_scan

		xor esi,esi					;error
		jmp page_scan_exit                              ;

