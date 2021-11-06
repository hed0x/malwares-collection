;program for generating rsa keyz, part of Universe project.


.386p
.model	flat
.data


invoke	macro	api					;macro for API callz
	extrn	api:PROC				;declare API
	call	api					;call it...
endm


include	..\useful.inc
include	..\win32api.inc

.data
	len		dd	?			;length of keyz
	hProvider	dd	?			;crypto provider handle
	hKey		dd	?			;private/public key pair handle
	hXchgKey	dd	?			;simple key handle
	key		db	4096 dup (?)		;maximal size of key
	tmp		dd	?			;misc.

.code
Start:
	push	10h
	push	1
	push	0
	@pushsz	'Universe'
	push	offset hProvider
	invoke	CryptAcquireContextA			;delete crypto record

	push	8
	push	1
	push	0
	@pushsz	'Universe'
	push	offset hProvider
	invoke	CryptAcquireContextA			;create new one

	push	offset hKey
	push	1
	push	1
	push	[hProvider]
	invoke	CryptGenKey				;create new simple key

	push	offset hKey
	push	1
	push	00006602h
	push	[hProvider]
	invoke	CryptGenKey				;create RSA priv./pub. keyz

	push	offset hXchgKey
	push	1
	push	[hProvider]
	invoke	CryptGetUserKey				;get handle to xchg key

	push	offset len
	push	0
	push	0
	push	1
	push	[hXchgKey]
	push	[hKey]
	invoke	CryptExportKey				;get its length

	push	offset len
	push	offset key
	push	0
	push	1
	push	[hXchgKey]
	push	[hKey]
	invoke	CryptExportKey				;and export it

	push	0
	push	FILE_ATTRIBUTE_NORMAL
	push	CREATE_ALWAYS
	push	0
	push	0
	push	GENERIC_WRITE
	@pushsz	'crypt.key'
	invoke	CreateFileA
	push	eax
	push	0
	push	offset tmp
	push	[len]
	push	offset key
	push	eax
	invoke	WriteFile				;write the key to file
	invoke	CloseHandle

	push	offset len
	push	0
	push	0
	push	7
	push	0
	push	[hXchgKey]
	invoke	CryptExportKey				;get length of simple key

	push	offset len
	push	offset key
	push	0
	push	7
	push	0
	push	[hXchgKey]
	invoke	CryptExportKey				;export it

	push	0
	push	FILE_ATTRIBUTE_NORMAL
	push	CREATE_ALWAYS
	push	0
	push	0
	push	GENERIC_WRITE
	@pushsz	'crypt_pp.key'
	invoke	CreateFileA
	push	eax
	push	0
	push	offset tmp
	push	[len]
	push	offset key
	push	eax
	invoke	WriteFile				;write it to file
	invoke	CloseHandle

	push	0
	invoke	ExitProcess				;and quit
ends
end    Start
