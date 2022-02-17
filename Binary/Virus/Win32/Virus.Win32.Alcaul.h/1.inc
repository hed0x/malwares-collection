;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;Registers opcodes
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

@eax 		equ 	000b	  	;0
@ecx 		equ 	001b 		;1
@edx 		equ 	010b 		;2
@ebx 		equ 	011b 		;3
@esp 		equ 	100b 		;4
@ebp 		equ 	101b 		;5
@esi 		equ 	110b 		;6
@edi 		equ 	111b 		;7

__eax equ @eax				;old values conpatible variables
__ecx equ @ecx				;
__edx equ @edx                          ;
__ebx equ @ebx                          ;
__esp equ @esp                          ;
__ebp equ @ebp                          ;
__esi equ @esi                          ;
__edi equ @edi                          ;


;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

smov macro p1,p2
if p2 gt 07fh
	if p2 eq eax
		xor eax,eax
	        mov al,&p2&
	elseif p2 equ ebx
		xor ebx,ebx
	        mov bl,&p2&
	elseif p2 equ ecx
		xor ecx,ecx
	        mov cl,&p2&
	elseif p2 equ edx
		xor edx,edx
	        mov dl,&p2&
	else
		mov &p1&,&p2&
	endif
else
     push &p2&
     pop  &p1&
endif


endm
