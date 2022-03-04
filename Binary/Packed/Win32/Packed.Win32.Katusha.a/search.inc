
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
; FindFirst
;
;In:  EDX= mask offset
;     EDI= pointer to returned info
;
;Out: EAX= handler
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
findfirst:
		pusha

		push edi
		push edx
		kernelCall FindFirstFileA

		mov [esp._eax],eax
		popa
		ret

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;
; FindNext
;
;In:  EAX=SEARCH handler
;     EDI=pointer to returned info
;Out: jz=1 if error occured
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
findnext:
		pusha

		push edi
		push eax
		kernelCall FindNextFileA

		or eax,eax
		popa
		ret


;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
; Walk
;
;In:	EDX=dirname offset
;	EBX=proc offset
;
;proc params:
;       EDX=filename offset
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
walk:
		pusha

		ntsub <SIZE f_struc+1024>
		mov edi,esp

		push edi

		mov esi,edx
		lea edx,[edi+SIZE f_struc]			; edx=edi=
		mov edi,edx                                     ; directory name
	 
w_dircpy:       
		lodsb						; copy
		stosb                                           ; directory name
		or al,al                                        ;
		jne w_dircpy                                    

		dec edi
		dec edi

		mov al,'\'                                      ;
		scasb						; '\' ?
		jz w_stars                                      ;

		stosb
w_stars:
		mov ecx,edi					;mask place
		mov eax,'*.*'
		stosd
		pop edi

		;edx=directory name+mask
		;edi=name bufer
		call findfirst

		dec eax                                         ;
		jz w_error					;handler=-1?
		inc eax                                         ;
		
w_check:
		;eax=handle
		;ecx=mask position
		;edx=dirname+mask

		push edi
		push eax

		lea esi,[edi.ff_fullname]
		mov edi,ecx
w_write_name:							;add name
		lodsb                                           ;to directory
		stosb                                           ;name
		or al,al                                        ;
		jne w_write_name				;

		pop eax
		pop edi

		cmp 1 ptr[esi-2],'.'				;'.' or '..' in
		jz w_next                                       ;the end

		test [edi.ff_attr],FILE_ATTRIBUTE_DIRECTORY
		jz w_file

;///// directory /////

		;edx=dirname,ebx=proc
		call walk
		jmp w_next
w_file:

;///// file /////
		;edx=filename
		call ebx					;proccess file
w_next:

ifndef DEBUG
		push eax
		mov eax,1000
		call sleep
		pop eax
endif
		;eax=handle,edi=bufer
		call findnext
		jnz w_check

		push eax
		kernelCall FindClose
w_error:
		ntadd <SIZE f_struc+1024>
		popa
		ret

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
; GetDriveType
;
;In:	EDX=drive root name offset
;Out:	EAX = drive type
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
getdrivetype:
		pusha

		push edx
		kernelCall GetDriveTypeA

		mov [esp._eax],eax
		popa
		ret


