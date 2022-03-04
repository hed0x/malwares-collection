ifdef DEBUG
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;     	In:edx=offset to filename
;	Out:eax=file handle,cf=1 if error occured
fcreate:
		pusha

		push 0
		push FILE_ATTRIBUTE_NORMAL
		push OPEN_ALWAYS
		push 0
		push FILE_SHARE_READ
		push GENERIC_READ+GENERIC_WRITE
		push edx
		kernelCall CreateFileA

		mov [esp._ebx],eax
		popa
		ret
endif

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;     	In:edx=offset to filename
;	Out:ebx=file handle
fopen:
		pusha

		push 0
		push FILE_ATTRIBUTE_NORMAL
		push OPEN_EXISTING
		push 0
		push FILE_SHARE_READ+FILE_SHARE_WRITE
		push GENERIC_READ+GENERIC_WRITE
		push edx
		kernelCall CreateFileA

		mov [esp._ebx],eax
		popa
		ret


;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;	In:ebx=file handle
fclose:
		pusha

		push ebx
		kernelCall CloseHandle

		popa
		ret

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;	In:ebx=file handle,edx=offset bufer,ecx=count bytes
fread:
		pusha


		push eax
		mov eax,esp

		push 0
		push eax					;bytes_cnt_ptr
		push ecx					;bytes_cnt
		push edx                                        ;bufer
		push ebx					;handle
		kernelCall ReadFile

		pop eax						;clear
		popa
		ret

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;	In:ebx=file handle,edx=offset bufer,ecx=count bytes
fwrite:
		pusha

		push eax
		mov eax,esp

		push 0
		push eax					;bytes_cnt_ptr
		push ecx					;bytes_cnt
		push edx                                        ;bufer
		push ebx					;handle
		kernelCall WriteFile

		pop eax						;clear
		popa
		ret

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;	In: ebx=handle
;	    ecx=bytes count
;	    eax=type
fseek:
		pusha

		push eax					;type
		push 0                                          ;hdword
		push ecx	                                ;ldword
		push ebx                                        ;handler
		kernelCall SetFilePointer

		popa
		ret


;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;In:	ebx=handle
;	edi=bufer ( size=3*sizeof(FILETIME) )

fgettime:
                pusha
						
		push edi				;LastWrite
		scasd
		scasd
		push edi				;LastAccess
		scasd
		scasd
		push edi				;LastCreation
		push ebx
		kernelCall GetFileTime
		
		popa
		ret

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;In:	ebx=handle
;	edi=bufer from fgettime

fsettime:
                pusha

		push edi				;LastWrite
		scasd
		scasd
		push edi				;LastAccess
		scasd
		scasd
		push edi				;LastCreation
		push ebx
		kernelCall SetFileTime
		
		popa
		ret

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;In:		edx=ASCIIZ filename,eax=attributes
fsetattrb:
		pusha

		push eax
		push edx
		kernelCall SetFileAttributesA

		popa
		ret

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;In:		edx=ASCIIZ filename
;Out:		eax=attributes
fgetattrb:
		pusha

		push edx
		kernelCall GetFileAttributesA

		jmp fio_exitEAX

;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
;in:		ebx=handel
;out:		eax=size
fsize:
		pusha

		push 0
		push ebx
		kernelCall GetFileSize

fio_exitEAX:
		mov [esp._eax],eax
		popa
		ret
