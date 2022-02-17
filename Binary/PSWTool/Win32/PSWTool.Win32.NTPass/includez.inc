include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

include des_ecb\str_to_key.asm
include des_ecb\set_odd.asm
include des_ecb\set_key.asm
include des_ecb\des.asm

include md4.inc

.586
.code
;#################################################################################
;==============================================
; Win32 Console Parsing Routine for MASM/TASM.
;
; Input:None
;
; Output:
;	   eax = Pointer to arguement table.
;	   ecx = Number of arguements in the table.
; Error:
;	   eax = NULL
;
; Use GetLastError for more information.
;----------------------------------------------
GetMainArgs:
	call	GetCommandLineA
	xor	ebx, ebx
	mov	dx, 2009h
@countarg:
	push	eax
	inc	ebx
@skip1:					
	inc	eax
	cmp	[eax], dl
	je	@skip2
	cmp	[eax], dh
	je	@skip2
	cmp	[eax], bh
	jne	@skip1
	jmp	@endcount
@skip2:
	mov	[eax], bh
	inc	eax
	cmp	[eax], dl
	je	@skip2
	cmp	[eax], dh
	je	@skip2
	cmp	[eax], bh
	jne	@countarg
@endcount:
	xor	esi, esi
	lea	edi, [esi + ebx * 4]

	push	edi
	push	esi
	call	GlobalAlloc
	test	eax, eax
	je	@argserr

	add	eax, edi
	mov	ecx, ebx
@saveargs:
	sub	eax, 4
	pop	[eax]
	loop	@saveargs
	mov	ecx, ebx
	retn
@argserr:
	add	esp, edi
	retn
;#################################################################################
cout:
	szText	equ	ebp+(02*04)
	;----------------------------
	enter	00h, 00h
	pushad
	mov	edx, [szText]
	push	edx
	call	lstrlenA
	push	0h
	push	esp
	push	eax
	push	edx
	push	-11
	call	GetStdHandle
	push	eax
	call	WriteFile
	popad
	leave
	retn	04
