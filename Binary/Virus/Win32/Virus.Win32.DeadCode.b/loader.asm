
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
; PE Loader
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

l_seed		equ	4 ptr[ebp-4]

l_imagebase	equ	4 ptr[ebp-8]

l_import	equ	4 ptr[ebp-12]
l_fixup		equ	4 ptr[ebp-16]
l_tlsCallback	equ	4 ptr[ebp-20]

l_importSize	equ	4 ptr[ebp-24]
l_fixupSize	equ	4 ptr[ebp-28]
l_key		equ	4 ptr[ebp-36]

loader:
		pushf 
		pusha
		mov ebp,esp
		sub esp,36

;		int 3

		call console_alloc

		pushx <[inPEctor]^^^Passkey^:#>		;
		mov esi,esp                             ; Banner
		call prints	                        ; 
		add esp,xsize           		;

		sub esp,256

		mov esi,esp
		mov edi,esi

		xor eax,eax

		mov ecx,16				;
		push ecx                                ;
		rep stosb				; Clear bufer
		pop ecx                                 ;
		                                        ;
		call console_read

		lodsd					;
		xchg ebx,eax                            ;
		lodsd                                   ;
		xchg ecx,eax                            ;
		lodsd                                   ; Read passphrase
		xor ebx,eax                             ;
		lodsd                                   ;
		xor ecx,eax                             ;

		mov l_key,ebx
		mov l_key+4,ecx

		add esp,256


;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
		mov l_imagebase,'!IMB'			; imagebase

		mov l_import,'!IMP'                     ; import
		mov l_tlsCallback,'TLSC'                ; tls callback

		mov l_fixup,'!FXP' 	                ; fixup
		mov l_fixupSize,'FXPS'    	        ; fixup size

		mov l_importSize,'IMPS'                 ; import size
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

		mov l_seed,12345678h
	
		push (18+256*4)*4
		call malloc
		add esp,4

		xchg edi,eax				; EDI = P
		lea esi,[edi+18*4]			; ESI = S

        	push edi

;---------------------------------------------------------------------------
	        mov ecx,18
blowf_rnd_P2:
	        push 0FFFFFFFFh

		lea eax,l_seed
		push eax

	        call rnd                                ; Init P
	        add esp,8                               ;
	        stosd                                   ;
	        loop blowf_rnd_P2                       ;

;---------------------------------------------------------------------------

	        mov edi,esi				;
	        mov ecx,256*4                           ;
blowf_rnd_S2:
	        push 0FFFFFFFFh

		lea eax,l_seed
		push eax

	        call rnd                                ;
	        add esp,8                               ;
	        stosd                                   ;
	        loop blowf_rnd_S2                       ;

;---------------------------------------------------------------------------
	        pop edi

		lea edx,l_key
		; EDX = key      			;
		; ESI = S                               ; Init Blowfish
		; EDI = P                               ;
		call BlowfishInit                       ;


;°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°

                call get_module_handle			; EDX = current 
		xchg eax,edx                            ;         imagebase
		
	        mov ebx,[edx.mz_peOffset]
		add ebx,edx

		movzx eax,[ebx.pe_NThsize]
		lea eax,[ebx+eax+18h]
	
                movzx ecx,[ebx.pe_objcnt]
		dec ecx

                pusha

		xchg ebx,eax				; EBX = Obj Table		
		mov ebp,edx				; EBP = Image

;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

decrypt_obj:
		push ecx
		push ebp

	        cmp [ebx+18h],0FFFFFD65h
		jne decrypt_next

		mov ecx,[ebx.pe_Obj_pSize]		; ECX = physical size/8

		cmp ecx,[ebx.pe_Obj_vSize]
		jbe decrypt_gotobegin

		mov ecx,[ebx.pe_Obj_vSize]

decrypt_gotobegin:

		push ecx				;
		lea eax,[ecx-8]				;
		shr ecx,3                               ;

		add ebp,[ebx.pe_Obj_RVA]		; EBP = Last block
		cmp [ebp],1
		add ebp,eax                             ;

;-----------------------------------------------------------------------------
blowfish_8d:
		mov eax,[ebp]
		mov edx,[ebp+4]
		call BlowfishDecrypt

		dec ecx
		jz blowfish_8d_write

		xor eax,[ebp-8]
		xor edx,[ebp-4]

blowfish_8d_write:

		mov [ebp],eax
		mov [ebp+4],edx

		sub ebp,8

		or ecx,ecx
		jnz blowfish_8d

		pop ecx
		push edi		
		lea edi,[ebp+8]
		call CRC32
		pop edi

		cmp [ebx+1Ch],eax
		je decrypt_next
;-----------------------------------------------------------------------------
		add esp,8
		popa
		jmp loader_error
;-----------------------------------------------------------------------------
decrypt_next:
		pop ebp
		pop ecx
		add ebx,40
		loop decrypt_obj

		push edi				;
		call free                               ; Release Bufer
		add esp,4

;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²

		popa

		push edx
		push ebx

		mov ebx,l_import
		or ebx,ebx
		jz loader_exit

		add ebx,edx				; EBX = import
		mov ecx,edx

;------------------------------------------------------------------------------
import_dll:
		mov eax,[ebx.import_nameRVA]
		or eax,eax
		jz import_exit

		add eax,edx

		mov esi,[ebx.import_lookupRVA]
		mov edi,[ebx.import_adrRVA]
		or esi,esi				; 2nd import type?
		jnz import_dll_1

		mov esi,edi

import_dll_1:
		add esi,edx
		add edi,edx

		push edx
		; EAX = asciiz name
		call load_library
		xchg edx,eax				; EDX = DLL
import_f:
		lodsd					; EAX = function
		or eax,eax
		jz import_f_exit
		
		test eax,80000000h			; by ordinal?
		jz import_f_asciiz

		xor eax,80000000h
;		add eax,ecx
;		movzx eax,2 ptr[eax]			; EAX = Ordinal
 		jmp import_f_get
import_f_asciiz:
		add eax,ecx
		inc eax                                 ; EAX = ASCIIZ name
		inc eax                                 ;
import_f_get:
		call get_proc_addr
		stosd					; Write
		jmp import_f

import_f_exit:
		pop edx

		add ebx,14h
		jmp import_dll
;------------------------------------------------------------------------------
			
import_exit:
                pop ebx
		pop edx


;°° Load Fixups °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°

		cmp edx,l_imagebase
;		je loader_tls

		mov esi,l_fixup				; Fixups is present?
		or esi,esi                              ;
		jz loader_tls

		mov ecx,l_fixupSize
		cmp ecx,8
		jbe loader_tls

		mov edi,edx        			; EDI = delta
		sub edi,l_imagebase                     ;

		add esi,edx
		push ebx

;-----------------------------------------------------------------------------
load_fixup:
                lodsd                                   ; EBX = Page
                xchg ebx,eax
                lodsd                                   ; EAX = Block Size

                sub ecx,eax
                sub eax,8
                shr eax,1
load_fixup_el:
                push eax

                lodsw                                           ; AX = type+address
                ror eax,4
                or ah,ah
                jz load_fixup_el_next

                rol eax,4                                       ; EAX = fixup delta
                and ah,0Fh                                      ;
                add eax,ebx                                     ; + Page

		add 4 ptr[edx+eax],edi				; Patch

load_fixup_el_next:
		pop eax
                dec eax
                jnz load_fixup_el

                or ecx,ecx
                jnz load_fixup

		pop ebx

;°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
loader_tls:
		mov esi,l_tlsCallback
		or esi,esi
		jz loader_crt_check

		lodsd
		or eax,eax		
		jz loader_crt_check
		
		pusha
		call eax
		popa

loader_crt_check:

		cmp [ebx.pe_sybsystem],SSYSTEM_WINCUI
		je loader_exit

		call console_free

loader_exit:
		mov esp,ebp
		popa
		popf


		db 068h					;  to old RVA
		dd 12345678h                            ; 
		ret

;°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
loader_error:

		mov esp,ebp
		popa
		popf
		
		pushx ~|*LOADER^ERROR!#
		mov esi,esp
		call prints
		add esp,xsize

		push 0
		kernelCall ExitProcess
