cr	equ rec
locals __
sethook proc
; set hook in prosess

;sethook(pid, hwnd, thid, hevent)
; args
__pid 	equ ebx+4 ptr 28h 	; process id
__hwnd	equ ebx+4 ptr 2Ch	; 
__thid	equ ebx+4 ptr 30h	; thread id
__hevent 	equ ebx+4 ptr 34h	; event to rise


; locals
__fname	equ ebx-400h ;?
__hproc	equ ebx-4 ptr 500h
__ptch	equ ebx-4 ptr 504h
__inj_addr	equ ebx-4 ptr 50Ch
__hmemmap 	equ ebx-4 ptr 510h
__mapmem	equ ebx-4 ptr 518h
__hmemdup 	equ ebx-4 ptr 51Ch
__hhook	equ ebx-4 ptr 528h

; consts
__args_size	equ 4*4
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
	jz __sethook_fail

	; obtain memory for our HMODULES
	mov eax, __hmnum*4
	call _valloc
	mov [__hmemmap], eax
	or eax, eax
	jz __sethook_fail
	
	push [__hproc]
	push [__pid]
	push eax
	call findmodules
	or eax, eax
	jz __sethook_fail

__search_mem:	
	mov ecx, eax ; get number of obtained HMODULEs
	sar ecx, 2 ; divide by 4
	mov esi, [__hmemmap]
__enum_loop:
	mov eax, [esi+ecx*4-4]
	mov edx, [__hproc]
	call _memorysearch
	or eax, eax
	jnz __mem_found
	loop __enum_loop
	jmp __sethook_fail
__mem_found:
	; free memory!
	pushad
	mov eax, [__hmemmap]
	call _vfree
	popad

__inject:

	; eax->address where we're injecting our code
	mov [__inj_addr], eax
	apiaddr SetEvent, cr
	mov [ebp+__mSetEvent-cr], eax
	apiaddr CallNextHookEx, cr
	mov [ebp+__mCallNextHookEx-cr], eax
	apiaddr ExitProcess, cr
	mov [ebp+__mExitProcess-cr], eax

	; создаем дубль хандла события 
	mov eax, [__hevent]
	mov esi, [__hproc]
	call _duphandle
	mov dword ptr [ebp+__hev-cr], eax
	or eax, eax
	jz __sethook_fail

	; patching
	; 1. copy the loader
	mov esi, __icsize
	lea edi, [ebp+__inj_code-cr]
	mov edx, [__hproc]
	mov ecx, [__inj_addr]
	call _memwrite
	or eax, eax
	jz __sethook_fail
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
	push WH_CALLWNDPROC;WH_MOUSE;WH_JOURNALRECORD;
	xcall SetWindowsHookEx
	or eax, eax
	jz __sethook_fail

__sethook_end:
	mov esp, ebx
	pop ebx
	popad
	sub eax, eax
	inc eax
	ret __args_size

__sethook_fail:
	mov esp, ebx
	pop ebx
	popad
	sub eax, eax ; return 0
	ret __args_size

__inj_code:; ---/ZAIKA
; хуй, вставляемый в процесс
; hook
;LRESULT CALLBACK CallWndProc(int nCode,	// hook code
;    WPARAM wParam,	// current-process flag
;    LPARAM lParam 	// address of structure with message data
;   );
__lparam 	equ ebx+4 ptr 18
__wparam	equ ebx+4 ptr 1Ch
__ncode	equ ebx+4 ptr 20h

cwpstruct	struc
cwp_lparam	dd ?
cwp_wparam	dd ?
cwp_msg	dd ?
cwp_hwnd	dd ?
cwpstruct	ends

eventmsgstruct	struc
em_msg	dd ?
em_paraml	dd ?
em_paramh	dd ?
em_time	dd ?
em_hwnd	dd ?
eventmsgstruct	ends

	pushad
	call __re2
__re2:
__r2	db 5Dh ; pop ebp
	push ebx
	mov ebx, esp
	
	mov eax, [__lparam]
	cmp [eax].cwp_msg, WM_CREATE
	jnz __return_back
	; rise event if message sent
;	push 4 ptr [ebp+__hev-__r2]
;	call [ebp+__mSetEvent-__r2]
	; this is not necessarily because debugging terminated as soon hook snaps into action
	
__return_back:
	mov esp, ebx
	pop ebx
	popad
	sub eax, eax
	ret 12
; API
__mSetEvent	dd 0
__mCallNextHookEx	dd 0
__mExitProcess	dd 0
; locals
__hev	dd 0
__first	db 0

__icsize 	equ $-__inj_code
sethook endp