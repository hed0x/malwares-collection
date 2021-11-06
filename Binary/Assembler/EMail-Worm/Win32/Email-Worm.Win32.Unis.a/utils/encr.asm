;program for module rsa encryption, part of Universe project.


.386p
.model flat

include	..\win32api.inc
include	..\useful.inc


invoke	macro	api					;macro for API callz
	extrn	api:PROC				;declare API
	call	api					;call it...
endm


.data
	ckey_start:
	include	..\key.inc				;simple key
	ckey_end:

	ckeypp_start:
	include ..\key_pp.inc				;private/public key pair
	ckeypp_end:

	cProvider	dd	?			;crypto provider handle
	cKey_pp		dd	?			;priv/pub. key handle
	cKey		dd	?			;simple key handle
	tmp		dd	?			;misc.


.code
Start:
	invoke	GetCommandLineA
	mov	edi,eax					;to EDI
	xchg	eax,esi
l_gca:	lodsb
	test	al,al
	je	exit_proc
	cmp	al,20h
	jne	l_gca					;skip from filename

l_par:	lodsb						;skip from parameterz 
	cmp	al,20h
	je	l_par
	test	al,al
	je	exit_proc				;no parameterz

	dec	esi					;yep, parameter present

	push	10h
	push	1
	push	0
	@pushsz	'Universe'
	push	offset cProvider			;delete previously used
	invoke	CryptAcquireContextA			;crypto record
	push	8
	push	1
	push	0
	@pushsz	'Universe'
	push	offset cProvider
	invoke	CryptAcquireContextA			;create new one
	dec	eax
	jne	exit_proc				;quit if error

	push	offset cKey_pp
	push	0
	push	0
	push	ckeypp_end-ckeypp_start
	push	offset ckeypp_start
	push	[cProvider]				;import public/private
	invoke	CryptImportKey				;keyz
	dec	eax
	jne	exit_proc				;quit if error

	push	offset cKey_pp
	push	1
	push	[cProvider]
	invoke	CryptGetUserKey				;get its handle

	push	offset cKey
	push	0
	push	[cKey_pp]
	push	ckey_end-ckey_start
	push	offset ckey_start
	push	[cProvider]
	invoke	CryptImportKey				;import simple key
	dec	eax
	jne	exit_proc				;quit if error

	push	0
	push	FILE_ATTRIBUTE_NORMAL
	push	OPEN_EXISTING
	push	0
	push	FILE_SHARE_READ
	push	GENERIC_WRITE or GENERIC_READ
	push	esi
	invoke	CreateFileA				;open file
	inc	eax
	je	exit_proc
	dec	eax
	mov	[hFile],eax

	push	eax
	push	0
	push	eax
	invoke	GetFileSize				;get its size
	mov	[fsize],eax
	xchg	eax,ecx
	add	ecx,8
	pop	eax

	cdq
	push	edx
	push	ecx
	push	edx
	push	PAGE_READWRITE
	push	edx
	push	eax
	invoke	CreateFileMappingA
	test	eax,eax
	je	err_dm22
	mov	[hMapFile],eax

	xor	edx,edx
	mov	ecx,[fsize]
	add	ecx,8
	push	ecx
	push	edx
	push	edx
	push	FILE_MAP_WRITE
	push	eax
	invoke	MapViewOfFile				;map it
	test	eax,eax
	je	err_dm33
	mov	[lpFile],eax

	mov	ecx,12345678h
fsize = dword ptr $-4
	mov	[tmp],ecx
	add	ecx,8
	push	ecx
	push	offset tmp
	push	eax
	push	0
	push	1
	push	0
	push	[cKey]
	invoke	CryptEncrypt				;encrypt it

err_dm44:
	push	12345678h
lpFile = dword ptr $-4
	invoke	UnmapViewOfFile				;unmap it
err_dm33:
	push	12345678h
hMapFile = dword ptr $-4
	invoke	CloseHandle
err_dm22:
	push	12345678h
hFile = dword ptr $-4
	invoke	CloseHandle				;close it

exit_proc:
	push	0
	invoke	ExitProcess				;and quit, simple eh? :)
End	Start
