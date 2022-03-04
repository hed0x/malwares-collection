;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께�
;
; Rnd(DWORD* Seed, DWORD range)
;
;OUT: EAX=value(0<->range)
;
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께�
@r		equ	<+8*4+4>

@mmod		equ	[esp+4 @r]
@seed		equ	[esp   @r]

rnd:
		pusha

		mov edi,@seed
		imul eax,4 ptr[edi],00019660Dh			; *a
		add eax,03C6EF35Fh                              ; +c

		mov [edi],eax
		xor edx,edx

		mov ecx,@mmod
		or ecx,ecx					; JECXZ replaced
		jz rnd_exit                                     ;

		cmp ecx,100h					; Byte?
		ja rnd4                                         ;

		mov ebx,eax
		shr ebx,16
		xor al,bh
rnd4:
		div ecx
rnd_exit:
		mov [esp._eax],edx
		popa
		ret