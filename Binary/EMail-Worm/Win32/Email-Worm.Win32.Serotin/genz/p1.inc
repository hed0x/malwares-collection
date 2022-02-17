;Descr:	This gen pairs two genotypes
;
;Type:	GEN_PAIRGENOTYPES
;
;INPUT:
;[EBX]	DWORD	address of 1st genotype
;[EBX+4]DWORD	address of 2nd genotype
;
;OUTPUT:
;(EAX)	DWORD	address of new paired genotype
;

pair1	Proc
	pushad
	@SEH_SetupFrame	<jmp	p1_seh>			;__try block

	call	p1_delta
p1_delta:
	pop	ebp					;get delta offset

	push	ebx
	@pushsz	'KERNEL32'
	call	esi					;get address of KERNEL32.dll
	@pushsz	'VirtualAlloc'
	push	eax
	call	edi					;get address of VirtualAlloc API
	mov	[ebp + p1_VirtualAlloc - p1_delta],eax
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
	mov	[ebp + p1_newgenotype - p1_delta],eax
	xchg	eax,edi

	mov	esi,[ebx+4]				;get 2nd genotype
	mov	[ebp + p1_genotype2base - p1_delta],esi
	lodsd
	xchg	eax,ecx					;get count of genz to ECX
	mov	[ebp + p1_genotype2ptr - p1_delta],esi
	mov	[ebp + p1_genotype2count - p1_delta],ecx

	mov	esi,[ebx]				;get 1st genotype
	mov	[ebp + p1_genotypebase - p1_delta],esi
	lodsd						;get count of genz to EAX
	push	eax
	mov	[ebp + p1_genotypeptr - p1_delta],esi
	add	eax,ecx
	stosd						;save total count of genz

	mov	[ebp + p1_newgentable - p1_delta],edi
	imul	eax,GEN_SIZEOFGEN			;calculate size of genotype header
	add	edi,eax
	mov	[ebp + p1_newgenptr - p1_delta],edi
	pop	ecx					;count of genz in 1st genotype
	call	p1_copy_genz				;copy genz from 1st genotype

	;correct some variablez for 2nd pass

	mov	[ebp + p1_genotypebase - p1_delta],12345678h
p1_genotype2base = dword ptr $-4
	mov	[ebp + p1_genotypeptr - p1_delta],12345678h
p1_genotype2ptr = dword ptr $-4
	mov	ecx,12345678h
p1_genotype2count = dword ptr $-4
	call	p1_copy_genz				;copy genz from 2nd genotype

p1_seh:	@SEH_RemoveFrame				;__except block
	popad
	mov	eax,12345678h				;return address of new genotype
p1_newgenotype = dword ptr $-4				;in EAX
	ret



p1_copy_genz:
	pushad
	mov	esi,12345678h				;get ptr to old genotype header
p1_genotypeptr = dword ptr $-4
	mov	edi,12345678h				;get ptr to new genotype header
p1_newgentable = dword ptr $-4
	movsb						;save type of gen item
	mov	eax,12345678h				; * get ptr to new gen in genotype
p1_newgenptr = dword ptr $-4
	push	eax
	sub	eax,[ebp + p1_newgenotype - p1_delta]
	stosd						;save address of gen
	lodsd
	xchg	eax,ecx
	lodsd
	stosd						;save size of gen
	xchg	eax,ecx
	pop	edi					; * to EDI
	mov	esi,12345678h
p1_genotypebase = dword ptr $-4
	add	esi,eax					;get source address of gen


	push	GEN_SIZEOFGEN
	pop	eax
	add	[ebp + p1_newgentable - p1_delta],eax	;get to next gen
	add	[ebp + p1_genotypeptr - p1_delta],eax	; ---- " " ----


p1_copy_genz2:
	call	p1_new_eh				;__try block


	;__except block

	mov	ecx,[esp.EH_ContextRecord]		;get address of context
	mov	esi,[ecx.CONTEXT_Esi]			;repair ESI register
	mov	edi,[ecx.CONTEXT_Edi]			;repair EDI register
	mov	ebp,[ecx.CONTEXT_Ebp]			;repair EBP register
	mov	ecx,[ecx.CONTEXT_Ecx]			;repair ECX register
	mov	esp,[esp.EH_EstablisherFrame]		;repair ESP register


	;alloc one page

	pushad
	push	PAGE_READWRITE
	push	MEM_COMMIT
	push	1000h
	push	edi
	mov	eax,12345678h
p1_VirtualAlloc = dword ptr $-4
	call	eax					;allocate next 4096 bytez
	popad
	@SEH_RemoveFrame				;remove SEH handler
	jmp	p1_copy_genz2				;and try again



p1_new_eh:
	xor	edx,edx
	push	dword ptr fs:[edx]
	mov	fs:[edx],esp
	rep	movsb					;copy the gen
	@SEH_RemoveFrame				;remove SEH handler
	mov	[ebp + p1_newgenptr - p1_delta],edi	;actualize the address
	popad
	dec	ecx
	jne	p1_copy_genz				;copy next gen
	ret
end_pair1:
pair1	EndP