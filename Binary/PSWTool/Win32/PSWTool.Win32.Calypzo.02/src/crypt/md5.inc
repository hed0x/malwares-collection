; MD5 in x86 ASM
;
; Last modified: May 2003 - bcom@hushmail.com
;

FF	macro	dwA, dwB, dwC, dwD, dwX, rS, dwT
	mov	edi, dwC
	mov	ebp, [dwX]

	xor	edi, dwD
	and	edi, dwB
	xor	edi, dwD
		
	lea	dwA, [ebp + dwT + dwA]
	add	dwA, edi
	rol	dwA, rS
	add	dwA, dwB
endm

GG	macro	dwA, dwB, dwC, dwD, dwX, rS, dwT
	mov	edi, dwC
	mov	ebp, [dwX]

	xor	edi, dwB
	and	edi, dwD
	xor	edi, dwC
	
	lea	dwA, [ebp + dwT + dwA]
	add	dwA, edi
	rol	dwA, rS
	add	dwA, dwB
endm

HH	macro	dwA, dwB, dwC, dwD, dwX, rS, dwT
	mov	edi, dwC
	mov	ebp, [dwX]

	xor	edi, dwD
	xor	edi, dwB
	
	lea	dwA, [ebp + dwT + dwA]
	add	dwA, edi
	rol	dwA, rS
	add	dwA, dwB
endm

II	macro	dwA, dwB, dwC, dwD, dwX, rS, dwT
	mov	ebp, [dwX]
	mov	edi, -1

	xor	edi, dwD
	or	edi, dwB
	xor	edi, dwC

	lea	dwA, [ebp + dwT + dwA]
	add	dwA, edi
	rol	dwA, rS
	add	dwA, dwB
endm

.code
MD5:	
	push	ebp
	push	edi

	mov	eax, 067452301h
	mov	ebx, 0efcdab89h
	mov	ecx, 098badcfeh
	mov	edx, 010325476h
	mov	esi, [esp + (03 * 04)]
	
	;==================================================

	FF	eax, ebx, ecx, edx, esi+(00*4), 07, 0d76aa478h
	FF	edx, eax, ebx, ecx, esi+(01*4), 12, 0e8c7b756h
	FF	ecx, edx, eax, ebx, esi+(02*4), 17, 0242070dbh
	FF	ebx, ecx, edx, eax, esi+(03*4), 22, 0c1bdceeeh
	
	FF	eax, ebx, ecx, edx, esi+(04*4), 07, 0f57c0fafh 
	FF	edx, eax, ebx, ecx, esi+(05*4), 12, 04787c62ah 
	FF	ecx, edx, eax, ebx, esi+(06*4), 17, 0a8304613h 
	FF	ebx, ecx, edx, eax, esi+(07*4), 22, 0fd469501h 
	
	FF	eax, ebx, ecx, edx, esi+(08*4), 07, 0698098d8h 
	FF	edx, eax, ebx, ecx, esi+(09*4), 12, 08b44f7afh 
	FF	ecx, edx, eax, ebx, esi+(10*4), 17, 0ffff5bb1h 
	FF	ebx, ecx, edx, eax, esi+(11*4), 22, 0895cd7beh 

	FF	eax, ebx, ecx, edx, esi+(12*4), 07, 06b901122h 
	FF	edx, eax, ebx, ecx, esi+(13*4), 12, 0fd987193h 
	FF	ecx, edx, eax, ebx, esi+(14*4), 17, 0a679438eh 
	FF	ebx, ecx, edx, eax, esi+(15*4), 22, 049b40821h 
	
	;==================================================

	GG	eax, ebx, ecx, edx, esi+(01*4), 05, 0f61e2562h 
	GG	edx, eax, ebx, ecx, esi+(06*4), 09, 0c040b340h 
	GG	ecx, edx, eax, ebx, esi+(11*4), 14, 0265e5a51h 
	GG	ebx, ecx, edx, eax, esi+(00*4), 20, 0e9b6c7aah 
	
	GG	eax, ebx, ecx, edx, esi+(05*4), 05, 0d62f105dh
	GG	edx, eax, ebx, ecx, esi+(10*4), 09, 002441453h
	GG	ecx, edx, eax, ebx, esi+(15*4), 14, 0d8a1e681h
	GG	ebx, ecx, edx, eax, esi+(04*4), 20, 0e7d3fbc8h

	GG	eax, ebx, ecx, edx, esi+(09*4), 05, 021e1cde6h
	GG	edx, eax, ebx, ecx, esi+(14*4), 09, 0c33707d6h
	GG	ecx, edx, eax, ebx, esi+(03*4), 14, 0f4d50d87h
	GG	ebx, ecx, edx, eax, esi+(08*4), 20, 0455a14edh

	GG	eax, ebx, ecx, edx, esi+(13*4), 05, 0a9e3e905h
	GG	edx, eax, ebx, ecx, esi+(02*4), 09, 0fcefa3f8h
	GG	ecx, edx, eax, ebx, esi+(07*4), 14, 0676f02d9h
	GG	ebx, ecx, edx, eax, esi+(12*4), 20, 08d2a4c8ah

	;==================================================

	HH	eax, ebx, ecx, edx, esi+(05*4), 04, 0fffa3942h
	HH	edx, eax, ebx, ecx, esi+(08*4), 11, 08771f681h
	HH	ecx, edx, eax, ebx, esi+(11*4), 16, 06d9d6122h
	HH	ebx, ecx, edx, eax, esi+(14*4), 23, 0fde5380ch
	
	HH	eax, ebx, ecx, edx, esi+(01*4), 04, 0a4beea44h
	HH	edx, eax, ebx, ecx, esi+(04*4), 11, 04bdecfa9h
	HH	ecx, edx, eax, ebx, esi+(07*4), 16, 0f6bb4b60h
	HH	ebx, ecx, edx, eax, esi+(10*4), 23, 0bebfbc70h

	HH	eax, ebx, ecx, edx, esi+(13*4), 04, 0289b7ec6h
	HH	edx, eax, ebx, ecx, esi+(00*4), 11, 0eaa127fah
	HH	ecx, edx, eax, ebx, esi+(03*4), 16, 0d4ef3085h
	HH	ebx, ecx, edx, eax, esi+(06*4), 23, 004881d05h

	HH	eax, ebx, ecx, edx, esi+(09*4), 04, 0d9d4d039h
	HH	edx, eax, ebx, ecx, esi+(12*4), 11, 0e6db99e5h
	HH	ecx, edx, eax, ebx, esi+(15*4), 16, 01fa27cf8h
	HH	ebx, ecx, edx, eax, esi+(02*4), 23, 0c4ac5665h

	;==================================================

	II	eax, ebx, ecx, edx, esi+(00*4), 06, 0f4292244h 
	II	edx, eax, ebx, ecx, esi+(07*4), 10, 0432aff97h
	II	ecx, edx, eax, ebx, esi+(14*4), 15, 0ab9423a7h
	II	ebx, ecx, edx, eax, esi+(05*4), 21, 0fc93a039h
	
	II	eax, ebx, ecx, edx, esi+(12*4), 06, 0655b59c3h 
	II	edx, eax, ebx, ecx, esi+(03*4), 10, 08f0ccc92h
	II	ecx, edx, eax, ebx, esi+(10*4), 15, 0ffeff47dh
	II	ebx, ecx, edx, eax, esi+(01*4), 21, 085845dd1h

	II	eax, ebx, ecx, edx, esi+(08*4), 06, 06fa87e4fh
	II	edx, eax, ebx, ecx, esi+(15*4), 10, 0fe2ce6e0h
	II	ecx, edx, eax, ebx, esi+(06*4), 15, 0a3014314h
	II	ebx, ecx, edx, eax, esi+(13*4), 21, 04e0811a1h

	II	eax, ebx, ecx, edx, esi+(04*4), 06, 0f7537e82h
	II	edx, eax, ebx, ecx, esi+(11*4), 10, 0bd3af235h
	II	ecx, edx, eax, ebx, esi+(02*4), 15, 02ad7d2bbh
	II	ebx, ecx, edx, eax, esi+(09*4), 21, 0eb86d391h

	;==================================================

	add	eax, 067452301h
	add	ebx, 0efcdab89h
	add	ecx, 098badcfeh
	add	edx, 010325476h
	
	pop	edi
	pop	ebp
	
	retn	04