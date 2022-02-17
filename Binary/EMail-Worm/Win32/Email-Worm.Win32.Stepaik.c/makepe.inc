locals __
locals @@
__x equ rec
makepe proc
; This procedure makes PE file with only ret command
	; parameter: 
__fname	equ ebx+4 ptr 8		; pointer to filename
	
;	locals
__ahand		equ ebx-4 ptr 8
__fbase		equ ebx-4 ptr 0Ch	
__hmap		equ ebx-4 ptr 10h	

__localssize	equ 900h

	push ebx
	mov ebx, esp
	sub esp, __localssize

	; open file for writing
	sub esi, esi
	push esi
	push FILE_ATTRIBUTE_NORMAL;FILE_ATTRIBUTE_HIDDEN
	push CREATE_ALWAYS
	push esi
	push FILE_SHARE_READ+FILE_SHARE_WRITE
	push GENERIC_READ+GENERIC_WRITE
	push [__fname]
	xcall CreateFileA
	mov [__ahand], eax

	inc eax
	jz __fail	; if (eax==-1) return 0;

	; create mapping
	sub esi, esi
	push esi
	push 7168	; size of file
	push esi PAGE_READWRITE esi
	push eax
	xcall CreateFileMappingA
	mov [__hmap], eax
	push esi
	push esi
	push esi FILE_MAP_ALL_ACCESS
	push eax
	xcall MapViewOfFile
	test eax, eax
	jz __fail

	mov edx, eax ; edx -> file buffer

	; fill map with zeroes - to fix the bug in win9x
	mov edi, edx
	sub eax, eax
	mov ecx, 7168
	rep stosb
	
	; copy mz header
	mov edi, edx
	mov ecx, mzh_size
	lea esi, [ebp+mzheader-__x]
	rep movsb
	
	; copy pe header
	mov edi, edx
	add edi, 200h
	mov ecx, peh_size
	lea esi, [ebp+peheader-__x]
	rep movsb

	; write code
	mov edi, edx
	add edi, 600h
	mov ecx, 200h
	push ecx edx
	rdtsc
	and eax, 1ffh
	pop edx ecx
	add ecx, eax
	mov al, 090h
	rep stosb
	mov al, 0C3h
	stosb
	
	; exe is ready, close it
	push edx;[__fbase]
	xcall UnmapViewOfFile
	push [__hmap]
	xcall CloseHandle
	push [__ahand]
	xcall CloseHandle

__ok:
	sub eax, eax
	inc eax
	jmp __ret

__fail:
	sub eax, eax
__ret:
	add esp, __localssize
	pop ebx
	ret 4
makepe endp

mzheader:
include mzheader.inc
mzh_size equ $-mzheader
peheader:
include peheader.inc
peh_size equ $-peheader
