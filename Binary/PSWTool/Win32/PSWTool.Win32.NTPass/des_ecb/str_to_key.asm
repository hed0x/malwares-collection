.586
@stk	macro	pOffs
	shl	byte ptr [ecx + pOffs], 01h
ENDM
.code
str_to_key:
	push	esi
	push	edi
	push	ebp
	
	mov	esi, [esp + (04*04)]
	mov	ecx, [esp + (05*04)]

		;mov	ecx, [esp+8]
		;push	esi
		;mov	esi, [esp+8]

		mov	al, [esi]
		shr	al, 1
		mov	[ecx], al
		mov	dl, [esi]
		mov	al, [esi+1]
		and	dl, 1
		shl	dl, 6
		shr	al, 2
		or	dl, al

		mov	[ecx+1], dl
		mov	dl, [esi+1]
		mov	al, [esi+2]
		and	dl, 3
		shl	dl, 5
		shr	al, 3
		or	dl, al

		mov	[ecx+2], dl
		mov	dl, [esi+2]
		mov	al, [esi+3]
		and	dl, 7
		shl	dl, 4
		shr	al, 4
		or	dl, al

		mov	[ecx+3], dl
		mov	dl, [esi+3]
		mov	al, [esi+4]
		and	dl, 0Fh
		shl	dl, 3
		shr	al, 5
		or	dl, al

		mov	[ecx+4], dl
		mov	al, [esi+4]
		mov	dl, [esi+5]
		and	al, 1Fh
		shr	dl, 6
		shl	al, 2
		or	dl, al

		mov	[ecx+5], dl
		mov	al, [esi+5]
		mov	dl, [esi+6]
		and	al, 3Fh
		shr	dl, 7
		shl	al, 1
		or	dl, al

		mov	[ecx+6], dl
		mov	dl, [esi+6]
		and	dl, 7Fh
		xor	eax, eax
		mov	[ecx+7], dl

	;-------------------------------
	@stk	00h
	@stk	01h
	@stk	02h
	@stk	03h
	@stk	04h
	@stk	05h
	@stk	06h
	@stk	07h
	
	push	ecx
	call	des_set_odd_parity

	pop	ebp
	pop	edi
	pop	esi
	retn	(02 * 04)
	