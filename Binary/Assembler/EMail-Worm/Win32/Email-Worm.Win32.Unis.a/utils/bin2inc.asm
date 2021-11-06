;program for simple converting binary filez to assembler include filez, part of
;Universe project.


.386p
.model flat

include ..\useful.inc
include ..\win32api.inc

invoke	macro	api					;macro for API callz
	extrn	api:PROC				;declare API
	call	api					;call it...
endm


.data
	hex_buffer	db	'	db	0'
	hex_write	db	'00h',CRLF
	buffer		db	?
	tmp		db	?


.code
Start:	pushad
	@SEH_SetupFrame	<jmp	exit_proc>

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

	push	0
	push	FILE_ATTRIBUTE_NORMAL
	push	OPEN_EXISTING
	push	0
	push	0
	push	GENERIC_READ
	push	esi
	invoke	CreateFileA				;open the file
	inc	eax
	je	exit_proc
	dec	eax
	xchg	eax,esi					;handle to esi

	push	0
	push	esi
	invoke	GetFileSize				;get its size
	mov	[count],eax				;save it

	push	0
	push	FILE_ATTRIBUTE_NORMAL
	push	CREATE_ALWAYS
	push	0
	push	0
	push	GENERIC_WRITE
	@pushsz	'output.inc'
	invoke	CreateFileA				;create output file
	inc	eax
	je	exit_proc
	dec	eax
	xchg	eax,edi					;handle to edi

wr_loop:push	0
	push	offset tmp
	push	1
	push	offset buffer
	push	esi
	invoke	ReadFile				;read one byte

	pushad
	mov	al,[buffer]
	mov	edi,offset hex_write
	call	HexWrite8				;convert it to hexa-string
	popad

	push	0
	push	offset tmp
	push	10
	push	offset hex_buffer
	push	edi
	invoke	WriteFile				;write it

	mov	ecx,12345678h
count = dword ptr $-4
	dec	[count]
	loop	wr_loop					;in a loop

	push	esi
	push	edi
	invoke	CloseHandle
	invoke	CloseHandle				;close those filez

exit_proc:
	@SEH_RemoveFrame
	popad
	push	0
	invoke	ExitProcess				;and quit





;-----------------------------------------------------------------------------
HexWrite8 proc
;
; AL has two hex digits that will be written to ES:EDI in ASCII form
;

        mov     ah, al
        and     al, 0fh
        shr     ah, 4
        or      ax, 3030h
        xchg    al, ah
        cmp     ah, 39h
        ja      @@4
@@1:    cmp     al, 39h
        ja      @@3
@@2:    stosw
        ret
@@3:    sub     al, 30h
        add     al, 'A' - 10
        jmp     @@2
@@4:    sub     ah, 30h
        add     ah, 'A' - 10
        jmp     @@1
HexWrite8 endp
ends
End	Start
