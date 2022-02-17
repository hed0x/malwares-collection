; RIPEMD-128 in x86 ASM 
;
; Last modified May 2003 - bcom@hushmail.com
; 

FF	macro	dwA, dwB, dwC, dwD, dwW, rS
	mov	edi, dwC

	xor	edi, dwD
	xor	edi, dwB

	add	edi, [dwW]
	add	dwA, edi
	rol	dwA, rS
ENDM

GG	macro	dwA, dwB, dwC, dwD, dwW, rS, dwK
	mov	edi, dwC

	xor	edi, dwD
	and	edi, dwB
	xor	edi, dwD

	add	edi, [dwW]
	lea	dwA, [dwA + edi + dwK]
	rol	dwA, rS
ENDM

HH	macro	dwA, dwB, dwC, dwD, dwW, rS, dwK
	mov	edi, -1

	xor	edi, dwC
	or	edi, dwB
	xor	edi, dwD

	add	edi, [dwW]
	lea	dwA, [dwA + edi + dwK]
	rol	dwA, rS
ENDM

II	macro	dwA, dwB, dwC, dwD, dwW, rS, dwK
	mov	edi, dwC

	xor	edi, dwB
	and	edi, dwD
	xor	edi, dwC

	add	edi, [dwW]
	lea	dwA, [dwA + edi + dwK]
	rol	dwA, rS
ENDM

.code

RIPEMD128:
	
	push	ebp
	push	edi
	
	mov	eax, 067452301h			; A
	mov	ebx, 0efcdab89h			; B
	mov	ecx, 098badcfeh			; C
	mov	edx, 010325476h			; D
	mov	ebp, [esp + (03 * 04)]		; message

	;========================================

	FF	eax, ebx, ecx, edx, ebp+(00*04), 11
	FF	edx, eax, ebx, ecx, ebp+(01*04), 14
	FF	ecx, edx, eax, ebx, ebp+(02*04), 15
	FF	ebx, ecx, edx, eax, ebp+(03*04), 12

	FF	eax, ebx, ecx, edx, ebp+(04*04), 05
	FF	edx, eax, ebx, ecx, ebp+(05*04), 08
	FF	ecx, edx, eax, ebx, ebp+(06*04), 07
	FF	ebx, ecx, edx, eax, ebp+(07*04), 09

	FF	eax, ebx, ecx, edx, ebp+(08*04), 11
	FF	edx, eax, ebx, ecx, ebp+(09*04), 13
	FF	ecx, edx, eax, ebx, ebp+(10*04), 14
	FF	ebx, ecx, edx, eax, ebp+(11*04), 15

	FF	eax, ebx, ecx, edx, ebp+(12*04), 06
	FF	edx, eax, ebx, ecx, ebp+(13*04), 07
	FF	ecx, edx, eax, ebx, ebp+(14*04), 09
	FF	ebx, ecx, edx, eax, ebp+(15*04), 08
	
	;====================================================

	GG	eax, ebx, ecx, edx, ebp+(07*04), 07, 05a827999h
	GG	edx, eax, ebx, ecx, ebp+(04*04), 06, 05a827999h
	GG	ecx, edx, eax, ebx, ebp+(13*04), 08, 05a827999h
	GG	ebx, ecx, edx, eax, ebp+(01*04), 13, 05a827999h

	GG	eax, ebx, ecx, edx, ebp+(10*04), 11, 05a827999h
	GG	edx, eax, ebx, ecx, ebp+(06*04), 09, 05a827999h
	GG	ecx, edx, eax, ebx, ebp+(15*04), 07, 05a827999h
	GG	ebx, ecx, edx, eax, ebp+(03*04), 15, 05a827999h

	GG	eax, ebx, ecx, edx, ebp+(12*04), 07, 05a827999h
	GG	edx, eax, ebx, ecx, ebp+(00*04), 12, 05a827999h
	GG	ecx, edx, eax, ebx, ebp+(09*04), 15, 05a827999h
	GG	ebx, ecx, edx, eax, ebp+(05*04), 09, 05a827999h

	GG	eax, ebx, ecx, edx, ebp+(02*04), 11, 05a827999h
	GG	edx, eax, ebx, ecx, ebp+(14*04), 07, 05a827999h
	GG	ecx, edx, eax, ebx, ebp+(11*04), 13, 05a827999h
	GG	ebx, ecx, edx, eax, ebp+(08*04), 12, 05a827999h

	;====================================================

	HH	eax, ebx, ecx, edx, ebp+(03*04), 11, 06ed9eba1h
	HH	edx, eax, ebx, ecx, ebp+(10*04), 13, 06ed9eba1h
	HH	ecx, edx, eax, ebx, ebp+(14*04), 06, 06ed9eba1h
	HH	ebx, ecx, edx, eax, ebp+(04*04), 07, 06ed9eba1h

	HH	eax, ebx, ecx, edx, ebp+(09*04), 14, 06ed9eba1h
	HH	edx, eax, ebx, ecx, ebp+(15*04), 09, 06ed9eba1h
	HH	ecx, edx, eax, ebx, ebp+(08*04), 13, 06ed9eba1h
	HH	ebx, ecx, edx, eax, ebp+(01*04), 15, 06ed9eba1h

	HH	eax, ebx, ecx, edx, ebp+(02*04), 14, 06ed9eba1h
	HH	edx, eax, ebx, ecx, ebp+(07*04), 08, 06ed9eba1h
	HH	ecx, edx, eax, ebx, ebp+(00*04), 13, 06ed9eba1h
	HH	ebx, ecx, edx, eax, ebp+(06*04), 06, 06ed9eba1h

	HH	eax, ebx, ecx, edx, ebp+(13*04), 05, 06ed9eba1h
	HH	edx, eax, ebx, ecx, ebp+(11*04), 12, 06ed9eba1h
	HH	ecx, edx, eax, ebx, ebp+(05*04), 07, 06ed9eba1h
	HH	ebx, ecx, edx, eax, ebp+(12*04), 05, 06ed9eba1h

	;====================================================

	II	eax, ebx, ecx, edx, ebp+(01*04), 11, 08f1bbcdch
	II	edx, eax, ebx, ecx, ebp+(09*04), 12, 08f1bbcdch
	II	ecx, edx, eax, ebx, ebp+(11*04), 14, 08f1bbcdch
	II	ebx, ecx, edx, eax, ebp+(10*04), 15, 08f1bbcdch

	II	eax, ebx, ecx, edx, ebp+(00*04), 14, 08f1bbcdch
	II	edx, eax, ebx, ecx, ebp+(08*04), 15, 08f1bbcdch
	II	ecx, edx, eax, ebx, ebp+(12*04), 09, 08f1bbcdch
	II	ebx, ecx, edx, eax, ebp+(04*04), 08, 08f1bbcdch

	II	eax, ebx, ecx, edx, ebp+(13*04), 09, 08f1bbcdch
	II	edx, eax, ebx, ecx, ebp+(03*04), 14, 08f1bbcdch
	II	ecx, edx, eax, ebx, ebp+(07*04), 05, 08f1bbcdch
	II	ebx, ecx, edx, eax, ebp+(15*04), 06, 08f1bbcdch

	II	eax, ebx, ecx, edx, ebp+(14*04), 08, 08f1bbcdch
	II	edx, eax, ebx, ecx, ebp+(05*04), 06, 08f1bbcdch
	II	ecx, edx, eax, ebx, ebp+(06*04), 05, 08f1bbcdch
	II	ebx, ecx, edx, eax, ebp+(02*04), 12, 08f1bbcdch

	;====================================================

	mov	[RMDValues], eax
	mov	[RMDValues + 4], ebx
	mov	[RMDValues + 8], ecx
	mov	[RMDValues + 12], edx

	mov	eax, 067452301h			; A
	mov	ebx, 0efcdab89h			; B
	mov	ecx, 098badcfeh			; C
	mov	edx, 010325476h			; D

	;====================================================

	II	eax, ebx, ecx, edx, ebp+(05*04), 08, 050a28be6h 
	II	edx, eax, ebx, ecx, ebp+(14*04), 09, 050a28be6h
	II	ecx, edx, eax, ebx, ebp+(07*04), 09, 050a28be6h
	II	ebx, ecx, edx, eax, ebp+(00*04), 11, 050a28be6h

	II	eax, ebx, ecx, edx, ebp+(09*04), 13, 050a28be6h
	II	edx, eax, ebx, ecx, ebp+(02*04), 15, 050a28be6h
	II	ecx, edx, eax, ebx, ebp+(11*04), 15, 050a28be6h
	II	ebx, ecx, edx, eax, ebp+(04*04), 05, 050a28be6h

	II	eax, ebx, ecx, edx, ebp+(13*04), 07, 050a28be6h
	II	edx, eax, ebx, ecx, ebp+(06*04), 07, 050a28be6h
	II	ecx, edx, eax, ebx, ebp+(15*04), 08, 050a28be6h
	II	ebx, ecx, edx, eax, ebp+(08*04), 11, 050a28be6h

	II	eax, ebx, ecx, edx, ebp+(01*04), 14, 050a28be6h
	II	edx, eax, ebx, ecx, ebp+(10*04), 14, 050a28be6h
	II	ecx, edx, eax, ebx, ebp+(03*04), 12, 050a28be6h
	II	ebx, ecx, edx, eax, ebp+(12*04), 06, 050a28be6h

	;====================================================

	HH	eax, ebx, ecx, edx, ebp+(06*04), 09, 05c4dd124h 
	HH	edx, eax, ebx, ecx, ebp+(11*04), 13, 05c4dd124h
	HH	ecx, edx, eax, ebx, ebp+(03*04), 15, 05c4dd124h
	HH	ebx, ecx, edx, eax, ebp+(07*04), 07, 05c4dd124h

	HH	eax, ebx, ecx, edx, ebp+(00*04), 12, 05c4dd124h
	HH	edx, eax, ebx, ecx, ebp+(13*04), 08, 05c4dd124h
	HH	ecx, edx, eax, ebx, ebp+(05*04), 09, 05c4dd124h
	HH	ebx, ecx, edx, eax, ebp+(10*04), 11, 05c4dd124h

	HH	eax, ebx, ecx, edx, ebp+(14*04), 07, 05c4dd124h
	HH	edx, eax, ebx, ecx, ebp+(15*04), 07, 05c4dd124h
	HH	ecx, edx, eax, ebx, ebp+(08*04), 12, 05c4dd124h
	HH	ebx, ecx, edx, eax, ebp+(12*04), 07, 05c4dd124h

	HH	eax, ebx, ecx, edx, ebp+(04*04), 06, 05c4dd124h
	HH	edx, eax, ebx, ecx, ebp+(09*04), 15, 05c4dd124h
	HH	ecx, edx, eax, ebx, ebp+(01*04), 13, 05c4dd124h
	HH	ebx, ecx, edx, eax, ebp+(02*04), 11, 05c4dd124h

	;====================================================

	GG	eax, ebx, ecx, edx, ebp+(15*04), 09, 06d703ef3h 
	GG	edx, eax, ebx, ecx, ebp+(05*04), 07, 06d703ef3h
	GG	ecx, edx, eax, ebx, ebp+(01*04), 15, 06d703ef3h
	GG	ebx, ecx, edx, eax, ebp+(03*04), 11, 06d703ef3h

	GG	eax, ebx, ecx, edx, ebp+(07*04), 08, 06d703ef3h
	GG	edx, eax, ebx, ecx, ebp+(14*04), 06, 06d703ef3h
	GG	ecx, edx, eax, ebx, ebp+(06*04), 06, 06d703ef3h
	GG	ebx, ecx, edx, eax, ebp+(09*04), 14, 06d703ef3h

	GG	eax, ebx, ecx, edx, ebp+(11*04), 12, 06d703ef3h
	GG	edx, eax, ebx, ecx, ebp+(08*04), 13, 06d703ef3h
	GG	ecx, edx, eax, ebx, ebp+(12*04), 05, 06d703ef3h
	GG	ebx, ecx, edx, eax, ebp+(02*04), 14, 06d703ef3h

	GG	eax, ebx, ecx, edx, ebp+(10*04), 13, 06d703ef3h
	GG	edx, eax, ebx, ecx, ebp+(00*04), 13, 06d703ef3h
	GG	ecx, edx, eax, ebx, ebp+(04*04), 07, 06d703ef3h
	GG	ebx, ecx, edx, eax, ebp+(13*04), 05, 06d703ef3h

	;====================================================

	FF	eax, ebx, ecx, edx, ebp+(08*04), 15 
	FF	edx, eax, ebx, ecx, ebp+(06*04), 05
	FF	ecx, edx, eax, ebx, ebp+(04*04), 08
	FF	ebx, ecx, edx, eax, ebp+(01*04), 11

	FF	eax, ebx, ecx, edx, ebp+(03*04), 14
	FF	edx, eax, ebx, ecx, ebp+(11*04), 14
	FF	ecx, edx, eax, ebx, ebp+(15*04), 06
	FF	ebx, ecx, edx, eax, ebp+(00*04), 14

	FF	eax, ebx, ecx, edx, ebp+(05*04), 06
	FF	edx, eax, ebx, ecx, ebp+(12*04), 09
	FF	ecx, edx, eax, ebx, ebp+(02*04), 12
	FF	ebx, ecx, edx, eax, ebp+(13*04), 09

	FF	eax, ebx, ecx, edx, ebp+(09*04), 12
	FF	edx, eax, ebx, ecx, ebp+(07*04), 05
	FF	ecx, edx, eax, ebx, ebp+(10*04), 15
	FF	ebx, ecx, edx, eax, ebp+(14*04), 08

	;========================================

	lea	ebp, [RMDValues]
	mov	edi, eax
	mov	esi, ebx
	;----------------------------------
	mov	eax, [ebp + 8]				; cc
	lea	eax, [eax + edx + 0efcdab89h]		; a = cc + ddd 
	;----------------------------------
	mov	ebx, [ebp + 12]				; dd
	lea	ebx, [ebx + edi + 098badcfeh]		; b = dd + aaa
	;----------------------------------
	mov	edi, ecx
	mov	ecx, [ebp]					; aa
	lea	ecx, [ecx + esi + 010325476h]		; c = aa + bbb
	;----------------------------------
	mov	edx, [ebp + 4]				; bb
	lea	edx, [edx + edi + 067452301h]		; d = bb + ccc

	pop	edi
	pop	ebp

	retn	(01 * 04)