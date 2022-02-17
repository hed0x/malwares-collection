.386
.MODEL FLAT, STDCALL

extrn CreateFileA 	:PROC
extrn ReadFile	  	:PROC
extrn WriteFile   	:PROC
extrn VirtualAlloc	:PROC
extrn CloseHandle 	:PROC
extrn SetFilePointer	:PROC

.data

MEM_COMMIT		equ	000001000h
GENERIC_READ		equ	080000000h
GENERIC_WRITE		equ	040000000h
FILE_SHARE_READ		equ	000000001h
FILE_SHARE_WRITE	equ	000000002h
PAGE_READWRITE		equ	000000004h
OPEN_EXISTING		equ	000000003h
FILE_ATTRIBUTE_NORMAL	equ	000000080h
FILE_BEGIN		equ	000000000h

filename 		db "chapter2.exe",0					; change this to use another filename...
nbytes   		dd ?
ubytes   		dd ?

.code

main:
    call VirtualAlloc, 0, 1024*1024, MEM_COMMIT, PAGE_READWRITE			; alloc the space we need in mem
    mov ebx, eax
    call CreateFileA, offset filename, GENERIC_READ+GENERIC_WRITE, FILE_SHARE_READ+FILE_SHARE_WRITE, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0
    mov ebp, eax
    call ReadFile, eax, ebx, 1024*1024, offset ubytes, 0			; read file contents into alloc'ed space
    mov edi, ebx
    mov ecx, 1000h+1
    mov eax, 'EDOC'
    repnz scasd
    add edi, 20h								; points to CODE in pe header + 20h = section attribs
    mov [edi], 0E0000020h							; set attrib to E0000020h, which means we can write there
    call SetFilePointer, ebp, 0, 0, FILE_BEGIN					; set the file pointer to beginning, so we can re-write the whole deal
    mov eax, [ubytes]
    call WriteFile, ebp, ebx, eax, offset nbytes, 0				; re-write it all...
    call CloseHandle, ebp
    mov ebp, esp
    ret
end main

