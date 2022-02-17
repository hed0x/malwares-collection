; Message Digest Auditor for MD4/MD5/RIPEMD-128/RIPEMD-160 & SHA-1 hashes.
; Copyright (C) 2003  bcom@hushmail.com
;
; This program is free software; you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation; either version 1, or (at your option)
; any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program; if not, write to the Free Software
; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
;
; These routines are part of Calypzo 
;
;	Last modified July 4th 2003 - bcom@hushmail.com
;
includelib	C:\masm32\lib\user32.lib
includelib	C:\masm32\lib\kernel32.lib

include	C:\masm32\include\windows.inc
include	C:\masm32\include\kernel32.inc
include	C:\masm32\include\user32.inc

IFDEF	MORE_THAN_FIFTEEN

include	crypt\md4.inc
include	crypt\md5.inc
include	crypt\ripemd128.inc
include	crypt\ripemd160.inc
include	crypt\sha1.inc

ENDIF

IFNDEF MORE_THAN_FIFTEEN

include	crypt\md4mod.inc
include	crypt\md5mod.inc
include	crypt\ripemd128mod.inc
include	crypt\ripemd160mod.inc
include	crypt\sha1.inc

ENDIF

CRLF		equ	13,10
NULL		equ	00
TAB		equ	09

LOWDW		equ	56
HIGHDW	equ	60

MAXCHARLEN	equ	32

MAXSIZE		equ	260

BIG_ENDIAN		equ	0
LITTLE_ENDIAN	equ	1

ONE_TWENTY_EIGHT_BITS	equ	32
ONE_SIXTY_BITS		equ	40
NUMBER_OF_ALGORITHMS	equ	4

pushz	macro	sText
	local	@next
	call	@next
	db	sText, 0
@next:
endm

.code
	align 4
;#################################################################################
;---------------------------------------------------------------------------------
;
;	BOOL IsValidHash (
;			pLen,			; Length hash should be. 
;			*szHash, 		; offset/pointer to ascii hash string.
;
;	Returns TRUE for valid hash, FALSE for invalid.
;
; NOTE:This only checks for length supplied by user, and keyboard characters..
;
; bcom@hushmail.com
;=================================================================================
IsValidHash:
	pLen		equ	ebp+(02*04)
	szHash	equ	ebp+(03*04)
	;----------------------------
	enter	00h, 00h
	pushad
	mov	esi, [szHash]
	mov	edi, esi
	or	ecx, -1
@findlen:						; check length of hash with user arguement
	lodsb
	inc	ecx
	or	al, al
	jnz	@findlen
	cmp	ecx, [pLen]
	jne	@invalid
	;----------------
	mov	esi, edi
	mov	ebx, ecx
	mov	edx, edi
@tolower:						; convert hash to lowercase
	lodsb
	cmp	al, 'Z'
	ja	@isok
	cmp	al, 'A'
	jb	@isok
	add	al, 'a' - 'A'
@isok:
	stosb
	loop	@tolower
@hexcheck:						; make sure only 0-9/a-f characters
	mov	esi, edx
	mov	ecx, ebx
@checkloop:
	lodsb
	cmp	al, 'f'
	ja	@invalid
	cmp	al, '0'
	jb	@invalid
	dec	ecx
	jnz	@checkloop
	mov	esi, edx
@scanmain:						; check hash for invalid keyboard characters
	call	@loadchars
	db	"¬`!",22h,"£$%^&*()_+-={}:@~<>?[];'#,./|\"
@loadchars:
	pop	edi
	push	34
	pop	ecx
@scanloop:
	pushad
	cmpsb
	popad
	je	@invalid
	inc	edi
	loop	@scanloop
	inc	esi
	dec	ebx
	jnz	@scanmain
@isvalid:
	push	1
	pop	eax
	jmp	@return
@invalid:
	xor	eax, eax
@return:
	mov	[esp + 28], eax
	popad
	leave
	retn	(02*04)
;#################################################################################
;---------------------------------------------------------------------------------
;
;	BOOL StoreAsciiHash (
;			szAsciiHash,	; pointer/offset to ascii hash
;			lpHashStruc,	; pointer to MDSTRUCTURE
;			pHashLen,		; length of ascii hash
;			pEndian		; LITTLE_ENDIAN(1) or BIG_ENDIAN(0)
;
;	Returns 1 for valid hash and stored OK, -1 for invalid hash, not stored.
;
; bcom@hushmail.com
;=================================================================================
StoreAsciiHash:
	szAsciiHash		equ	ebp+(02*04)
	lpHashStruc		equ	ebp+(03*04)
	pHashLen		equ	ebp+(04*04)
	pEndian		equ	ebp+(05*04)
	;----------------------------------
	enter	00h,00h
	pushad
	mov	esi, [szAsciiHash]
	push	esi
	push	[pHashLen]
	call	IsValidHash				; valid hash supplied?
	dec	eax
	jnz	@endstore
	;-----------------
	mov	edi, [lpHashStruc]
	mov	ecx, [pHashLen]
	shr	ecx, 3				; divide by 8
@convert:
	push	ecx
	xor	eax, eax
	xor	ebx, ebx
	push	8
	pop	ecx
@next:
	shl	eax, 4
	mov	bl, [esi]
	cmp	bl, 'a'
	jb	@calc
	sub	bl, 'a'-10-'0'
@calc:
	lea	eax, [eax + ebx - '0']
	inc	esi
	loop	@next
	mov	ecx, [pEndian]
	jecxz	@store
	bswap	eax
@store:
	stosd
	pop	ecx
	loop	@convert
	xor	eax, eax
	inc	eax
@endstore:
	mov	[esp + 28], eax
	popad
	leave
	retn	(04*04)
	
;#################################################################################
;---------------------------------------------------------------------------------
;	Original code by Greenant - http://greenant.cjb.net/
;
;	VOID CreatePass (
;			*pRoutine,		; offset of routine to call 
;			pMax, 		; maximum number of characters to create
;			pMin, 		; minimum to start with
;			pCharSet, 		; offset to ascii string to use in creation
;			pCharEnd		; = strlen(offset pCharSet)+offset pCharSet 
;			pBuffer		; pointer to memory buffers
;
; if pMax > 64, routine will eventually crash.(assumed)
;
; esi, edi and ebp must be saved and restored when returning from *pRoutine
; have pRoutine return 1 (TRUE) in ecx to terminate before passing max chars.
;
; bcom@hushmail.com
;=================================================================================
CreatePass:
	pRoutine	equ	ebp+(02*04)
	pMax		equ	ebp+(03*04)
	pMin		equ	ebp+(04*04)
	pCharSet	equ	ebp+(05*04)
	pCharEnd	equ	ebp+(06*04)
	pBuffer	equ	ebp+(07*04)
	;----------------------------
	hPointers	equ	ebp-(64*04)
	;----------------------------
	enter	(64*04), 00h

	lea	edi, [hPointers]
	push	edi
	mov	ecx, [pMax]
	mov	eax, [pCharSet]
	rep	stosd							; store pointer to charset in memory

	pop	esi
	mov	edi, [pMin]
	xor	ebx, ebx
	mov	ecx, [pBuffer]
@first:
	mov	edx, [esi + ebx * 4]				; load offset to charset
	mov	al, [edx]						; move byte into al
	mov	[ebx + ecx], al					; store al in buffer
	inc	ebx
	cmp	ebx, edi						; less than?
	jne	@first

	push	ecx
	call	dword ptr [pRoutine]				; call routine..
	dec	ecx
	jz	@end
@reload:
	mov	ecx, [pBuffer]
	mov	edx, edi
	xor	ebx, ebx
	dec	edx
@second:
	inc	dword ptr [esi + edx * 4]			; increase pointer to charset
	
	mov	eax, [pCharEnd]
	cmp	dword ptr [esi + edx * 4], eax		; end of charset?
	jne	@first

	mov	eax, [pCharSet]
	mov	dword ptr [esi + edx * 4], eax		; store start
	dec	edx
	jns	@second

	inc	edi							; increase length
	add	dword ptr [pBuffer], 64				; advance buffer
	cmp	edi, [pMax]
	jna	@first
	or	ecx, -1
@end:
	leave
	retn	(06*04)
;#################################################################################
;---------------------------------------------------------------------------------
;
;	push	[pQWLen]			; HIGHDW or LOWDW
;	push	[MinLen]			; Minimum length of characters
;	push	[MaxLen]			; max..
;	call	SetupBuffers
;
;	returns pointer to buffers, or NULL
; 
; Setup buffers for auditing md4/md5/ripemd160 sha1 hashes
;
; bcom@hushmail.com
;=================================================================================
SetupBuffers:
	pMaxLen	equ	ebp+(02*04)
	pMinLen	equ	ebp+(03*04)
	pQWLen	equ	ebp+(04*04)
	;----------------------------
	enter	00h, 00h
	pushad					; save all registers
	imul	esi, [pMaxLen], 64		; MaxLen * 64 bytes buffer allocation.
	push	esi
	push	40h
	call	GlobalAlloc
	test	eax, eax
	mov	edi, eax
	mov	[esp + 28], eax
	jz	@setuperr

	mov	ecx, [pMaxLen]
	mov	ebx, [pMinLen]
@setuploop:
	mov	byte ptr [edi + ebx], 80h	; add end bit
	lea	edx, [ebx * 8]			; length * 8 (bits) 
	mov	eax, [pQWLen]
	cmp	eax, HIGHDW				; byte ordering..
	jne	@storelen
	bswap	edx
@storelen:
	mov	[edi + eax], edx
	add	edi, 64
	inc	ebx					; increase length
	loop	@setuploop
@setuperr:
	popad
	leave
	retn	(03*04)
;#################################################################################
;---------------------------------------------------------------------------------
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
;=================================================================================
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
;#################################################################################
; This works, but could cause some problems.
DictionaryAttack:
	enter	72, 00h
	pFile			equ	ebp+8
	pRoutine		equ	ebp+12
	;-----------------------------
	hMemSize		equ	ebp-4
	hFile			equ	ebp-8
	szWordBuf		equ	ebp-72
	;-----------------------------
	pushad
	
	push	[pFile]
	call	@ShowAttack
	db	CRLF,"Dictionary attack running.."
	db	CRLF,"Reading words from %s", CRLF, CRLF, NULL
@ShowAttack:
	call	printf
	add	esp, (02 * 04)

	xor	esi, esi
	push	esi
	push	80h			; FILE_ATTRIBUTE_NORMAL
	push	03h			; OPEN_EXISTING
	push	esi
	push	01h			; FILE_SHARE_READ
	push	80000000h		; GENERIC_READ
	push	[pFile]
	call	CreateFileA		; open the selected file
	mov	ebx, eax
	inc	eax
	je	@endDA

	push	esi
	push	ebx
	call	GetFileSize
	mov	edi, eax
	test	eax, eax
	jz	@endDA
	
	push	04h				; PAGE_READWRITE
	push	1000h				; MEM_COMMIT
	push	eax				; size
	push	esi				; null
	call	VirtualAlloc		; allocate memory for file
	test	eax, eax
	je	@closefile
	
	push	esi
	mov	esi, eax
	push	esp
	push	edi
	push	esi
	push	ebx
	call	ReadFile
	dec	eax
	jnz	@dealloc
	
	push	edi
	lea	edi, [szWordBuf]
	push	esi
@savewordbuf:
	lea	edi, [szWordBuf]
	push	edi
	xor	eax, eax
	push	64/4
	pop	ecx
	rep	stosd

	pop	edi
	push	edi
	xor	ecx, ecx
@wordloop:
	inc	ecx
	mov	al, [esi]
	inc	esi
	cmp	al, 0dh
	jz	@callproc
	mov	[edi], al
	inc	edi
	or	al, al
	jnz	@wordloop
@callproc:
	dec	ecx
	mov	byte ptr [edi + 1], 00h
	pop	edi
	pushad
	push	ecx				; length of word
	push	edi				; buffer of word
	call	dword ptr [pRoutine]
	test	ecx, ecx
	popad
	jz	@skipnext
	inc	esi
	cmp	byte ptr [esi], 00h
	jnz	@savewordbuf
@skipnext:
	pop	esi
	pop	edi
@dealloc:
	push	4000h				;MEM_DECOMMIT
	push	edi
	push	esi
	call	VirtualFree			; free allocated memory buffer
@closefile:	
	push	ebx
	call	CloseHandle			; close input file.
@endDA:
	mov	[esp + 28], eax
	popad
	leave
	retn	(02 * 04)
;#################################################################################
toupper:
	szString	equ	ebp+(02*04)
	;----------------------------
	enter	00h, 00h
	pushad
	mov	esi, [szString]
	call	strlen
	mov	[esp + 28], esi
@upperloop:
	mov	al, [esi]
	cmp	al, 'a'
	jb	@upperok
	cmp	al, 'z'
	ja	@upperok
	sub	al, 'a' - 'A'
	mov	[esi], al
@upperok:
	inc	esi
	dec	ecx
	jnz	@upperloop
	popad
	leave
	retn	04
;#################################################################################
strlen:
	push	esi
	push	eax
	or	ecx, -1
@getlen:
	mov	al, [esi]
	inc	esi
	inc	ecx
	or	al, al
	jnz	@getlen
	pop	eax
	pop	esi
	retn
;#################################################################################
tolower:
	enter	00h, 00h
	pushad
	mov	esi, [szString]
	call	strlen
	mov	[esp + 28], esi
@lowerloop:
	mov	al, [esi]
	cmp	al, 'Z'
	ja	@lowerok
	cmp	al, 'A'
	jb	@lowerok
	add	al, 'a' - 'A'
	mov	[esi], al
@lowerok:
	inc	esi
	dec	ecx
	jnz	@lowerloop
	popad
	leave
	retn	4
;#################################################################################
;---------------------------------------------------------------------------------
; Convert Ascii number to hexadecimal value
;
; push offset szString
; push szStringLen
; call AsciiToHex		
;
; return number in eax..
;
;=================================================================================
AsciiToHex:
	szLen		equ	ebp+(02*04)
	szText	equ	ebp+(03*04)
	;----------------------------
	enter	00h, 00h
	pushad
	mov	esi, [szText]
	mov	ecx, [szLen]
	
	xor	eax, eax
	xor	ebx, ebx
@convert2:
	lodsb
	xor	al, '0'
	cmp	al, 10
	jnc	@endcon
	imul	ebx, ebx, 10
	add	ebx, eax
@endcon:
	loop	@convert2
	mov	[esp + 28], ebx
	popad
	leave
	retn	(02*04)
