;같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같�
; Inpector 1.666
;
; 	* File cryptor
;	* Permutating decryptor
;	* Blowfish used
;
; (c) 451 2002-03
;같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같�

include win32api.ash
include import.ash
include macros.ash

include ldizx\ldizx.ash
include ltme\ltme.ash
include ltme\list.ash

include pe.ash
include inpector.ash

includelib import32.lib
extrn ExitProcess:near

	.386
	.model flat
	.data

banner		db 		13,10,20h,"inPEctor v 1.666 ",13,10
		db		20h,"Passkey to set:",0

ussage_msg	db		13,10,20h,"inPEctor v 1.666 ",13,10
		db		20h,"Use:  inPEctor < filename >",13,10
		db      	20h,"[passkey <1-8 symbols>",13,10,0

waiting		db		20h,"Wait...",13,10,0

error_msg	db		20h,"Error...Can't intrude to file . Maybe file is incorrect,already encrypted",13,10
		db		20h,"or non-intrudable.",13,10,0

ok_msg		db		20h,"Ok! File was crypted...",13,10,0

seed		dd		?

_params 	ltmeparam	<>
_align_v	dd		?	
_align_p	dd		?
_pe_header	dd		?
_file_size	dd		?
_new_object	dd		?
_seed		dd		?
_tls		dd		?

_handle		dd		?
_bufer		dd		?
_stack		dd		?

_key		dd		?
		dd		?

	.code

_start:
		int 3

		call console_alloc

		kernelCall GetCommandLineA		;
		xchg esi,eax				; EDI = Command line

get_param:
		lodsb
		or AL,AL
                jz ussage

		cmp AL,20h                              ; Get parameter
		jne get_param

		mov edx,esi				; EDX = filename

		lodsb
		or eax,eax
		jz ussage

;같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같같

		
		mov esi,offset banner
		call prints

		sub esp,256

		mov esi,esp
		mov edi,esi

		xor eax,eax				;
		mov ecx,16                              ;
		push ecx                                ; Clear 9 bytes
		rep stosb				;
		pop ecx                                 ;
		call console_read

		lodsd					;
		xchg ebx,eax                            ;
		lodsd                                   ;
		xchg ecx,eax                            ;
		lodsd                                   ; Read passphrase
		xor ebx,eax                             ;
		lodsd                                   ;
		xor ecx,eax                             ;
		add esp,256
		                                        ;
		mov _key,ebx                            ;
		mov _key+4,ecx                          ;

		mov esi,offset waiting
		call prints

		call infect

		cmp eax,'ipen'
		jne error

		mov esi,offset ok_msg
		call prints
exit:
		call console_free

		push 0
		call ExitProcess
ussage:		

		mov esi,offset ussage_msg
		call prints

		jmp exit		
error:
		mov esi,offset error_msg
		call prints

		jmp exit		

include ltme\ltme_core.inc
include ltme\ltme_mutator.inc
include ldizx\ldizx.inc

include infect.asm
include mutator.asm
include fio.inc

;------------------------------------------------------------------------------
include loader.asm					; 
include system.inc					;
include io.inc                                          ; Main routines  
include import.inc					;
include rnd.inc						;
include blowfish\blowfish.inc				;
@loader_size		equ	$-offset loader		;

ascii_size @loader_size
;------------------------------------------------------------------------------

end	_start