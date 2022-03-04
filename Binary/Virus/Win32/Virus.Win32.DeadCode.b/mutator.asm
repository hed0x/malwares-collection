;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께

@cr		equ	<+8*4>
@@free		equ	4 ptr [ebp+32 @cr]+4
@@malloc	equ	4 ptr [ebp+28 @cr]+4
@@seed		equ	4 ptr [ebp+24 @cr]+4
@@rnd		equ	4 ptr [ebp+20 @cr]+4
@@params	equ	4 ptr [ebp+16 @cr]+4
@@flags		equ	4 ptr [ebp+12 @cr]+4
@@last_label	equ	4 ptr [ebp+8  @cr]+4
@@list		equ 	4 ptr [ebp+4  @cr]+4
@@size  	equ     4 ptr [ebp    @cr]+4
my_mutator:
		pusha
		mov ebp,esp

		mov esi,@@list
		mov edi,[esi.list_first]

my_modify:
		mov eax,4 ptr[edi.one_data.ltmed_command]
		and eax,00FFFFFFh

		cmp eax,0F845C7h
		je my_imagebase


		cmp eax,0F445C7h
		je my_import

		cmp eax,0F045C7h
		je my_fixup

		cmp eax,0E445C7h
		je my_fixupSize

		cmp eax,0E845C7h
		je my_importSize

		cmp eax,0EC45C7h
		je my_tlsc

		cmp al,68h
		je my_rva

		jmp my_next

;------------------------------------------------------------------------------
my_imagebase:
		lea eax,[edi.one_data.ltmed_command+3]
		cmp 4 ptr[eax],'!IMB'
		jne my_next
		
		push 4 ptr _params.x_imagebase
		jmp my_correct
;------------------------------------------------------------------------------
my_import:
		lea eax,[edi.one_data.ltmed_command+3]
		cmp 4 ptr[eax],'!IMP'
		jne my_next
		
		push 4 ptr _params.x_importn
		jmp my_correct

;------------------------------------------------------------------------------
my_tlsc:
		lea eax,[edi.one_data.ltmed_command+3]
		cmp 4 ptr[eax],'TLSC'
		jne my_next
		
		push 4 ptr _params.x_tlsCallback
		jmp my_correct

;------------------------------------------------------------------------------
my_importSize:
		lea eax,[edi.one_data.ltmed_command+3]
		cmp 4 ptr[eax],'IMPS'
		jne my_next
		
		push 4 ptr _params.x_importSn
		jmp my_correct

;------------------------------------------------------------------------------
my_fixup:
		lea eax,[edi.one_data.ltmed_command+3]
		cmp 4 ptr[eax],'!FXP'
		jne my_next
		
		push 4 ptr _params.x_fixup
		jmp my_correct

;------------------------------------------------------------------------------
my_fixupSize:
		lea eax,[edi.one_data.ltmed_command+3]
		cmp 4 ptr[eax],'FXPS'
		jne my_next
		
		push 4 ptr _params.x_fixupSize
		jmp my_correct
;------------------------------------------------------------------------------
my_rva:
		lea eax,[edi.one_data.ltmed_command+1]
		cmp 4 ptr[eax],12345678h
		jne my_next
		
		push 4 ptr _params.x_RVA

;------------------------------------------------------------------------------
my_correct:

		pop  4 ptr [eax]

;------------------------------------------------------------------------------
my_next:
		cmp edi,[esi.list_last]
		je my_end

		mov edi,[edi.one_next]
		jmp my_modify
my_end:

		push @@free
		push @@malloc
		push @@seed
		push @@rnd
		push @@params
		push @@flags
		push @@last_label
		push @@list
		push @@size
		call ltme_mutator				;call original mutator
		add esp,4*9

		popa
		ret