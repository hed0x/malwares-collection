; MD4 in x86 ASM
;
; Last modified: May 2003 - bcom@hushmail.com
;

FF	macro	dwA, dwB, dwC, dwD, dwX, rS
	mov	edi, dwC
	mov	ebp, [dwX]

	xor	edi, dwD
	and	edi, dwB
	xor	edi, dwD
		
	lea	dwA, [ebp + dwA]
	add	dwA, edi
	rol	dwA, rS
endm

GG	macro	dwA, dwB, dwC, dwD, dwX, rS, dwT
				
	mov	edi, dwC
	and	edi, dwD
	mov	ebp, dwB
	and	ebp, dwC
	or	edi, ebp
	;-------------
	mov	ebp, dwB
	and	ebp, dwD
	or	edi, ebp

	mov	ebp, [dwX]

	lea	dwA, [ebp + dwT + dwA]
	add	dwA, edi
	rol	dwA, rS
endm

HH	macro	dwA, dwB, dwC, dwD, dwX, rS, dwT
	mov	edi, dwB
	mov	ebp, [dwX]

	xor	edi, dwC
	xor	edi, dwD
	
	lea	dwA, [ebp + dwT + dwA]
	add	dwA, edi
	rol	dwA, rS
endm

.code

MD4:
	push	edi
	push	ebp

	mov	eax, 067452301h
	mov	ebx, 0efcdab89h
	mov	ecx, 098badcfeh
	mov	edx, 010325476h
	mov	esi, [esp + (03 * 04)]
	
	;================================================

	FF	eax, ebx, ecx, edx, esi+(00*4), 03
	FF	edx, eax, ebx, ecx, esi+(01*4), 07
	FF	ecx, edx, eax, ebx, esi+(02*4), 11
	FF	ebx, ecx, edx, eax, esi+(03*4), 19
	
	FF	eax, ebx, ecx, edx, esi+(04*4), 03 
	FF	edx, eax, ebx, ecx, esi+(05*4), 07 
	FF	ecx, edx, eax, ebx, esi+(06*4), 11 
	FF	ebx, ecx, edx, eax, esi+(07*4), 19 
	
	FF	eax, ebx, ecx, edx, esi+(08*4), 03 
	FF	edx, eax, ebx, ecx, esi+(09*4), 07 
	FF	ecx, edx, eax, ebx, esi+(10*4), 11 
	FF	ebx, ecx, edx, eax, esi+(11*4), 19 

	FF	eax, ebx, ecx, edx, esi+(12*4), 03 
	FF	edx, eax, ebx, ecx, esi+(13*4), 07 
	FF	ecx, edx, eax, ebx, esi+(14*4), 11 
	FF	ebx, ecx, edx, eax, esi+(15*4), 19 
	
	;==================================================

	GG	eax, ebx, ecx, edx, esi+(00*4), 03, 05a827999h
	GG	edx, eax, ebx, ecx, esi+(04*4), 05, 05a827999h 
	GG	ecx, edx, eax, ebx, esi+(08*4), 09, 05a827999h 
	GG	ebx, ecx, edx, eax, esi+(12*4), 13, 05a827999h 
	
	GG	eax, ebx, ecx, edx, esi+(01*4), 03, 05a827999h
	GG	edx, eax, ebx, ecx, esi+(05*4), 05, 05a827999h
	GG	ecx, edx, eax, ebx, esi+(09*4), 09, 05a827999h
	GG	ebx, ecx, edx, eax, esi+(13*4), 13, 05a827999h

	GG	eax, ebx, ecx, edx, esi+(02*4), 03, 05a827999h
	GG	edx, eax, ebx, ecx, esi+(06*4), 05, 05a827999h
	GG	ecx, edx, eax, ebx, esi+(10*4), 09, 05a827999h
	GG	ebx, ecx, edx, eax, esi+(14*4), 13, 05a827999h

	GG	eax, ebx, ecx, edx, esi+(03*4), 03, 05a827999h
	GG	edx, eax, ebx, ecx, esi+(07*4), 05, 05a827999h
	GG	ecx, edx, eax, ebx, esi+(11*4), 09, 05a827999h
	GG	ebx, ecx, edx, eax, esi+(15*4), 13, 05a827999h

	;==================================================

	HH	eax, ebx, ecx, edx, esi+(00*4), 03, 06ed9eba1h
	HH	edx, eax, ebx, ecx, esi+(08*4), 09, 06ed9eba1h
	HH	ecx, edx, eax, ebx, esi+(04*4), 11, 06ed9eba1h
	HH	ebx, ecx, edx, eax, esi+(12*4), 15, 06ed9eba1h
	
	HH	eax, ebx, ecx, edx, esi+(02*4), 03, 06ed9eba1h
	HH	edx, eax, ebx, ecx, esi+(10*4), 09, 06ed9eba1h
	HH	ecx, edx, eax, ebx, esi+(06*4), 11, 06ed9eba1h
	HH	ebx, ecx, edx, eax, esi+(14*4), 15, 06ed9eba1h

	HH	eax, ebx, ecx, edx, esi+(01*4), 03, 06ed9eba1h
	HH	edx, eax, ebx, ecx, esi+(09*4), 09, 06ed9eba1h
	HH	ecx, edx, eax, ebx, esi+(05*4), 11, 06ed9eba1h
	HH	ebx, ecx, edx, eax, esi+(13*4), 15, 06ed9eba1h

	HH	eax, ebx, ecx, edx, esi+(03*4), 03, 06ed9eba1h
	HH	edx, eax, ebx, ecx, esi+(11*4), 09, 06ed9eba1h
	HH	ecx, edx, eax, ebx, esi+(07*4), 11, 06ed9eba1h
	HH	ebx, ecx, edx, eax, esi+(15*4), 15, 06ed9eba1h

	;==================================================

	add	eax, 067452301h
	add	ebx, 0efcdab89h
	add	ecx, 098badcfeh
	add	edx, 010325476h
	
	pop	ebp
	pop	edi

	retn	04