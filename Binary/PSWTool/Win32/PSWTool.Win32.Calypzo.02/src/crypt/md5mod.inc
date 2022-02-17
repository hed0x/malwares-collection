; MD5 in x86 ASM
;
; Last modified: May 2003 - bcom@hushmail.com
;

FF	macro	dwA, dwB, dwC, dwD, dwX, rS, dwT
 	
	mov	eax, dwC
	mov	ebp, [dwX]

	xor	eax, dwD
	and	eax, dwB
	xor	eax, dwD
		
	lea	dwA, [ebp + dwA + dwT]
	add	dwA, eax
	rol	dwA, rS
	add	dwA, dwB
endm

FFMOD	macro	dwA, dwB, dwC, dwD, rS, dwT
	mov	eax, dwC
	
	xor	eax, dwD
	and	eax, dwB
	xor	eax, dwD
	
	lea	dwA, [dwA + eax + dwT]
	rol	dwA, rS
	add	dwA, dwB
endm

GG	macro	dwA, dwB, dwC, dwD, dwX, rS, dwT

	mov	eax, dwC
	mov	ebp, [dwX]

	xor	eax, dwB
	and	eax, dwD
	xor	eax, dwC
	
	lea	dwA, [ebp + dwA + dwT]
	add	dwA, eax
	rol	dwA, rS
	add	dwA, dwB
endm

GGMOD	macro	dwA, dwB, dwC, dwD, rS, dwT
	mov	eax, dwC
	
	xor	eax, dwB
	and	eax, dwD
	xor	eax, dwC
	
	lea	dwA, [dwA + eax + dwT]
	rol	dwA, rS
	add	dwA, dwB
endm

HH	macro	dwA, dwB, dwC, dwD, dwX, rS, dwT

	mov	eax, dwC
	mov	ebp, [dwX]

	xor	eax, dwD
	xor	eax, dwB
	
	lea	dwA, [ebp + dwA + dwT]
	add	dwA, eax
	rol	dwA, rS
	add	dwA, dwB
endm

HHMOD	macro	dwA, dwB, dwC, dwD, rS, dwT
	mov	eax, dwC
	
	xor	eax, dwD
	xor	eax, dwB
	
	lea	dwA, [dwA + eax + dwT]
	rol	dwA, rS
	add	dwA, dwB
endm

II	macro	dwA, dwB, dwC, dwD, dwX, rS, dwT
	
	mov	ebp, [dwX]
	mov	eax, -1

	xor	eax, dwD
	or	eax, dwB
	xor	eax, dwC

	lea	dwA, [ebp + dwA + dwT]
	add	dwA, eax
	rol	dwA, rS
	add	dwA, dwB
endm

IIMOD	macro	dwA, dwB, dwC, dwD, rS, dwT
	mov	eax, -1
	
	xor	eax, dwD
	or	eax, dwB
	xor	eax, dwC
	
	lea	dwA, [dwA + eax + dwT]
	rol	dwA, rS
	add	dwA, dwB
endm

.code

MD5:	
	mov	[edi_], edi
	mov	[ebp_], ebp

	mov	edi, 067452301h
	mov	ebx, 0efcdab89h
	mov	ecx, 098badcfeh
	mov	edx, 010325476h
	mov	esi, [esp + (03 * 04)]

	;==================================================

	FF	edi, ebx, ecx, edx, esi+(00*4), 07, 0d76aa478h
	FF	edx, edi, ebx, ecx, esi+(01*4), 12, 0e8c7b756h
	FF	ecx, edx, edi, ebx, esi+(02*4), 17, 0242070dbh
	FF	ebx, ecx, edx, edi, esi+(03*4), 22, 0c1bdceeeh
	
	FFMOD	edi, ebx, ecx, edx, 		  07, 0f57c0fafh
	FFMOD	edx, edi, ebx, ecx, 		  12, 04787c62ah
	FFMOD	ecx, edx, edi, ebx,		  17, 0a8304613h
	FFMOD	ebx, ecx, edx, edi,		  22, 0fd469501h
	
	FFMOD	edi, ebx, ecx, edx, 		  07, 0698098d8h 
	FFMOD	edx, edi, ebx, ecx, 		  12, 08b44f7afh
	FFMOD	ecx, edx, edi, ebx, 		  17, 0ffff5bb1h
	FFMOD	ebx, ecx, edx, edi, 		  22, 0895cd7beh

	FFMOD	edi, ebx, ecx, edx, 		  07, 06b901122h
	FFMOD	edx, edi, ebx, ecx, 		  12, 0fd987193h
	FF	ecx, edx, edi, ebx, esi+(14*4), 17, 0a679438eh
	FFMOD	ebx, ecx, edx, edi, 		  22, 049b40821h

	;==================================================

	GG	edi, ebx, ecx, edx, esi+(01*4), 05, 0f61e2562h
	GGMOD	edx, edi, ebx, ecx, 		  09, 0c040b340h
	GGMOD	ecx, edx, edi, ebx, 		  14, 0265e5a51h
	GG	ebx, ecx, edx, edi, esi+(00*4), 20, 0e9b6c7aah 
	
	GGMOD	edi, ebx, ecx, edx, 		  05, 0d62f105dh
	GGMOD	edx, edi, ebx, ecx, 		  09, 002441453h
	GGMOD	ecx, edx, edi, ebx, 		  14, 0d8a1e681h
	GGMOD	ebx, ecx, edx, edi, 		  20, 0e7d3fbc8h
	
	GGMOD	edi, ebx, ecx, edx, 		  05, 021e1cde6h
	GG	edx, edi, ebx, ecx, esi+(14*4), 09, 0c33707d6h
	GG	ecx, edx, edi, ebx, esi+(03*4), 14, 0f4d50d87h
	GGMOD	ebx, ecx, edx, edi, 		  20, 0455a14edh

	GGMOD	edi, ebx, ecx, edx, 		  05, 0a9e3e905h
	GG	edx, edi, ebx, ecx, esi+(02*4), 09, 0fcefa3f8h
	GGMOD	ecx, edx, edi, ebx, 		  14, 0676f02d9h
	GGMOD	ebx, ecx, edx, edi, 		  20, 08d2a4c8ah

	;==================================================
	
	HHMOD	edi, ebx, ecx, edx, 		  04, 0fffa3942h
	HHMOD	edx, edi, ebx, ecx, 		  11, 08771f681h
	HHMOD	ecx, edx, edi, ebx, 		  16, 06d9d6122h
	HH	ebx, ecx, edx, edi, esi+(14*4), 23, 0fde5380ch
	
	HH	edi, ebx, ecx, edx, esi+(01*4), 04, 0a4beea44h
	HHMOD	edx, edi, ebx, ecx, 		  11, 04bdecfa9h
	HHMOD	ecx, edx, edi, ebx, 		  16, 0f6bb4b60h
	HHMOD	ebx, ecx, edx, edi, 		  23, 0bebfbc70h
	
	HHMOD	edi, ebx, ecx, edx, 		  04, 0289b7ec6h
	HH	edx, edi, ebx, ecx, esi+(00*4), 11, 0eaa127fah
	HH	ecx, edx, edi, ebx, esi+(03*4), 16, 0d4ef3085h
	HHMOD	ebx, ecx, edx, edi, 		  23, 004881d05h

	HHMOD	edi, ebx, ecx, edx, 		  04, 0d9d4d039h
	HHMOD	edx, edi, ebx, ecx, 		  11, 0e6db99e5h
	HHMOD	ecx, edx, edi, ebx, 		  16, 01fa27cf8h
	HH	ebx, ecx, edx, edi, esi+(02*4), 23, 0c4ac5665h

	;==================================================

	II	edi, ebx, ecx, edx, esi+(00*4), 06, 0f4292244h
	IIMOD	edx, edi, ebx, ecx, 		  10, 0432aff97h
	II	ecx, edx, edi, ebx, esi+(14*4), 15, 0ab9423a7h
	IIMOD	ebx, ecx, edx, edi, 		  21, 0fc93a039h	

	IIMOD	edi, ebx, ecx, edx, 		  06, 0655b59c3h
	II	edx, edi, ebx, ecx, esi+(03*4), 10, 08f0ccc92h
	IIMOD	ecx, edx, edi, ebx, 		  15, 0ffeff47dh
	II	ebx, ecx, edx, edi, esi+(01*4), 21, 085845dd1h
	
	IIMOD	edi, ebx, ecx, edx, 		  06, 06fa87e4fh
	IIMOD	edx, edi, ebx, ecx, 		  10, 0fe2ce6e0h
	IIMOD	ecx, edx, edi, ebx, 		  15, 0a3014314h
	IIMOD	ebx, ecx, edx, edi, 		  21, 04e0811a1h

	IIMOD	edi, ebx, ecx, edx, 		  06, 0f7537e82h
	IIMOD	edx, edi, ebx, ecx, 		  10, 0bd3af235h
	II	ecx, edx, edi, ebx, esi+(02*4), 15, 02ad7d2bbh
	IIMOD	ebx, ecx, edx, edi, 		  21, 0eb86d391h

	;==================================================

	lea	eax, [edi + 067452301h]
	add	ebx, 0efcdab89h
	add	ecx, 098badcfeh
	add	edx, 010325476h
	
	mov	edi, [edi_]
	mov	ebp, [ebp_]
	
	retn	04