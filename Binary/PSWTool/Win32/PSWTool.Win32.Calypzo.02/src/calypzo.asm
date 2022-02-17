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
; Compile with MASM
;
; ml /Cp /coff /c calypzo.asm
; link /SUBSYSTEM:CONSOLE calypzo.obj
;
;
; Last modified July 21st 2003 - bcom@hushmail.com  
;
; Supported Algorithms to date:
;
; 	SHA-1
; 	MD4
; 	MD5
; 	RIPEMD-128
; 	RIPEMD-160
;
.586
.model flat, stdcall

;MORE_THAN_FIFTEEN		EQU	1	; uncomment to try passwords 
							; greater than 15 characters

include includez.inc
include	data.inc

.code
	align 4
main:
	call	getprintf
	mov	printf, eax

	call	GetMainArgs
	push	[eax]
	pop	[hCmdLine]
	test	eax, eax
	jz	@error
	push	ecx
	dec	ecx				; less than one arguement?
	pop	ecx
	jz	@usage
	
	lea	esi, [eax + 4]		; skip module name
@getopt:
	lodsd
	dec	ecx
	jz	@continue
	mov	ebx, [eax]
	bswap	ebx
	cmp	ebx, '-alg'
	je	@getalgorithm
	
	cmp	ebx, '-max'
	je	@getmaxlen
	
	cmp	ebx, '-min'
	je	@getminlen
	
	cmp	ebx, '-set'
	je	@getcharset
	
	cmp	ebx, '-wrd'
	je	@enableDA

	cmp	ebx, '-noi'
	je	@disableinfo

	mov	[hMessage], eax		; if not option, assume hash message
	jmp	@getopt
;-----------------------
@getcharset:
	dec	ecx
	mov	ebx, [esi]
	add	esi, 4
	push	ebx
	call	lstrlenA
	test	eax, eax			; zero length character set?
	jz	@usage

	mov	[hCharSet], ebx		; offset to character set
	add	ebx, eax
	mov	[hCharEnd], ebx		; offset + length of set
	jmp	@getopt
@enableDA:
	dec	ecx
	lodsd
	mov	[szFile], eax
	jmp	@getopt
@disableinfo:
	inc	[hInfo]
	jmp	@getopt
;-----------------------
@getminlen:
	mov	edx, offset MinLen
	jmp	@getlenvalue
;-----------------------
@getmaxlen:
	mov	edx, offset MaxLen
;-----------------------
@getlenvalue:
	dec	ecx
	lodsd
	push	eax
	push	2
	call	AsciiToHex
	test	eax, eax
	jz	@usage
	cmp	eax, MAXCHARLEN
	jae	@usage
	mov	[edx], eax
	jmp	@getopt
;=================================================
@getalgorithm:
	dec	ecx
	lodsd
	push	ebx
	push	ecx
	;--------
	push	eax
	push	1
	call	AsciiToHex
	cmp	eax, NUMBER_OF_ALGORITHMS
	ja	@endget
	mov	ecx, eax
	xor	eax, eax

	push	[offset pAlgTable + ecx * 4]
	pop	[hAlgorithm]

	push	[offset AsciiTable + ecx * 4]
	pop	[szAlgorithm]

	jmp	[offset pSetOptions + ecx * 4]
@setsha1:
	mov	[LenOrder], HIGHDW
@setoptions:
	mov	[ByteOrder], BIG_ENDIAN
	mov	[HashLen], ONE_SIXTY_BITS
	mov	[AuditRoutine], offset Audit160
	inc	dword ptr [Dictionary]
@endget:
	pop	ecx
	pop	ebx
	test	eax, eax
	jnz	@usage
	jmp	@getopt
;=================================================
@continue:
	mov	eax, [hMessage]
	test	eax, eax
	jz	@usage
	;-----------------------
@getmsg:
	push	[ByteOrder]
	push	[HashLen]
	push	offset Passwd
	push	eax
	call	StoreAsciiHash
	inc	eax
	jz	@invalidhash

@bruteforce:
	dec	[hInfo]
	jns	@dictionary

	push	[hCharSet]
	push	[MaxLen]
	push	[MinLen]
	push	[szAlgorithm]
	push	[hMessage]
	push	offset szInfo
	call	printf					; display user/default arguements.
	add	esp, (06*04)

@dictionary:
	mov	ecx, [szFile]
	jecxz	@setupbuf
	
	push	offset PadWord
	push	ecx
	call	GetTickCount
	mov	[StartTime], eax
	call	DictionaryAttack
	test	eax, eax
	jne	isfound
	
	call	displayerror
isfound:
	cmp	[hFound], 1
	je	@showtimer

;-----------------------------
@setupbuf:
	push	[LenOrder]
	push	[MinLen]
	push	[MaxLen]
	call	SetupBuffers				; setup the buffers
	mov	[hBuffers], eax
;-----------------------------
	call	GetTickCount				; get start time
	mov	[StartTime], eax
;-----------------------------
	push	[hBuffers]
	push	[hCharEnd]
	push	[hCharSet]
	push	[MinLen]
	push	[MaxLen]
	push	[AuditRoutine]
	call	CreatePass				; begin audit
	inc	ecx
	jnz	@showtimer
;-----------------------------
	pushz	"Couldn't find password"
	call	printf
	add	esp, 4
	call	GetTickCount
	sub	eax, [StartTime]
	mov	[StartTime], eax
@showtimer:
	mov	eax, [StartTime]
	mov	ecx, 1000
	xor	ebx, ebx
	xor	edx, edx
	div	ecx

	push	eax
	call	@showtime
	db	CRLF,"Rough Inaccurate Time Elapsed in seconds:%d", 0
@showtime:
	call	printf
	add	esp, (02*04)
exit:
	push	eax
	call	ExitProcess
@error:
	jmp	exit
@usage:
	push	[hCmdLine]
	push	offset szUsage
	call	printf
	add	esp, (02*04)
	jmp	exit
@invalidhash:
	pushz	"Invalid Hash, should be only 0-9/a-f and 32/40-bytes in length"
	call	printf
	jmp	exit
;################################################################
Audit128:
	szPassword		equ	esp+(01*04)
	;----------------------------------
	mov	[esi_], esi

	push	[szPassword]
	call	dword ptr [hAlgorithm]
	
	cmp	eax, [Passwd].dwSumA
	jne	@notfound
	cmp	ebx, [Passwd].dwSumB
	jne	@notfound
	cmp	ecx, [Passwd].dwSumC
	jne	@notfound
	cmp	edx, [Passwd].dwSumD
	je	@ShowPassword

@notfound:
	mov	esi, [esi_]
	retn	04
;##############################################################
Audit160:
	mov	[esi_], esi

	push	[szPassword]
	call	dword ptr [hAlgorithm]
	
	cmp	eax, [Passwd].dwSumA
	jne	@notfound
	cmp	ebx, [Passwd].dwSumB
	jne	@notfound
	cmp	ecx, [Passwd].dwSumC
	jne	@notfound
	cmp	edx, [Passwd].dwSumD
	jne	@notfound
	cmp	esi, [Passwd].dwSumE
	jne	@notfound

@ShowPassword:
	call	GetTickCount
	sub	eax, [StartTime]
	mov	[StartTime], eax

	mov	ebx, [szPassword]
	mov	byte ptr [ebx + edi], 00h
	push	ebx
	push	offset szFound
	call	printf
	add	esp, (02 * 04)
	xor	ecx, ecx
	inc	ecx
	jmp	@notfound

getprintf:
	pushz	"MSVCRT.DLL"
	call	LoadLibraryA
	pushz	"printf"
	push	eax
	call	GetProcAddress
	ret
;##############################################################
;##############################################################
; this really needs cleaning up!..very messy, I know.
; what it does, take the word, add end bit, append 64-bit length
; try normally first, then as lowercase, then uppercase.
;
PadWord:
	szWord	equ	esp+4
	szLen		equ	esp+8
	;----------------------
	mov	edi, [szWord]
	mov	eax, [szLen]
	mov	byte ptr [edi + eax], 80h	
	lea	ebx, [eax * 8]
	mov	edx, [LenOrder]
	cmp	edx, HIGHDW				; byte ordering..
	jne	@storedword
	bswap	ebx
@storedword:
	mov	[edi + edx], ebx
	push	2
	pop	ecx
	cmp	[Dictionary], 0
	jne	@d160loop

;#################################################
@d128loop:
	push	ecx

	push	edi
	call	dword ptr [offset pRoutines + ecx * 4]
@skipproc:
	push	edi
	call	dword ptr [hAlgorithm]

	cmp	eax, [Passwd].dwSumA
	jne	@testend128
	cmp	ebx, [Passwd].dwSumB
	jne	@testend128
	cmp	ecx, [Passwd].dwSumC
	jne	@testend128
	cmp	edx, [Passwd].dwSumD
	je	@found_word
@testend128:
	pop	ecx
	dec	ecx
	jnz	@d128loop
	or	ecx, -1
	jmp	@xit
@xit:
	retn	(02 * 04)
;#################################################
@d160loop:
	push	ecx

	push	edi
	call	dword ptr [offset pRoutines + ecx * 4]
@skipproc2:
	push	edi
	call	dword ptr [hAlgorithm]

	cmp	eax, [Passwd].dwSumA
	jne	@testend
	cmp	ebx, [Passwd].dwSumB
	jne	@testend
	cmp	ecx, [Passwd].dwSumC
	jne	@testend
	cmp	edx, [Passwd].dwSumD
	jne	@testend
	cmp	esi, [Passwd].dwSumE
	je	@found_word
@testend:
	pop	ecx
	dec	ecx
	jnz	@d160loop
	or	ecx, -1
	jmp	@xit
@dummy:
	add	esp, 8		; edi + return address.. :PP
	cmp	[Dictionary], 0
	je	@skipproc
	jmp	@skipproc2
;================================
@found_word:
	pop	ecx
	pushad
	call	GetTickCount
	sub	eax, [StartTime]
	mov	[StartTime], eax
	popad
	mov	ecx, [szLen]
	mov	byte ptr [edi + ecx], 00h
	
	push	[szWord]
	push	offset szFound
	call	printf
	add	esp, (02 *04)
	xor	ecx, ecx
	inc	dword ptr [hFound]
	jmp	@xit

displayerror:
	enter	04h, 00h
	pushad
	xor	ebx, ebx
	
	push	ebx
	push	ebx
	lea	eax, [ebp - 4]
	push	eax
	push	ebx
	call	GetLastError
	push	eax
	push	ebx			; language SUBLANG_DEFAULT
	push	100h or 1000h	; FORMAT_MESSAGE_ALLOCATE_BUFFER \
					; or	FORMAT_MESSAGE_FROM_SYSTEM
	call	FormatMessageA
	push	dword ptr[ebp - 4]
	call	cout
	popad
	leave
	retn

end	main