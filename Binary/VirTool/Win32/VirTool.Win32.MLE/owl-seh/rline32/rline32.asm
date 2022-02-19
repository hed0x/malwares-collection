%include "../inc/win32n.inc"

extern	_ExitProcess@4
extern	_GetTickCount@0
extern	_GetStdHandle@4
extern	_MessageBeep@4
extern	_WriteConsoleA@20

global _mainCRTStartup

SEGMENT .text USE32 class=code

_mainCRTStartup
	push	dword STD_OUTPUT_HANDLE	; get handle for stdout just for
	call	_GetStdHandle@4		; debugging purposes... cos we're
	mov	[stdout],eax		; gonna write out addresses we trace

	xor	ebx,ebx			; set up Structured Exception Handler
	push	dword eh		; address of our handler
	push	dword [fs:ebx]		; save previous head of the list
	mov	[fs:ebx],esp		; prepend our handler to the list

	pushf				; now, it's show time ;-)
	pushf
	or	[esp],word 0x100

;	call	_GetTickCount@0		; for measuring execution speed
;	mov	ebx,eax

	popf
	nop
	nop
	nop
	nop
;	TIMES 10000 db 0x90		; for measuring execution speed
	popf

;	call	_GetTickCount@0		; for measuring execution speed
;	sub	eax,ebx
;	mov	ebx,eax
;	call	printaddress

	pop	dword [fs:0]		; clean up SEH frame
	add	esp,4

	push	dword MB_ICONASTERISK	; bingo, we're done
	call	_MessageBeep@4

	push	dword 0
	call	_ExitProcess@4
;	retn

eh
	push	ebp			; our handler, let's set up the stack
	mov	ebp,esp			; frame cos we're gonna access
	push	ebx			; parameters passed on the stack
	push	ecx

	mov	eax,[ebp+8]		; let's see if it is stack unwinding
	test	dword [eax+4],6		; should not be of course in our case
	jz	.cont			; but one never knows
	push	dword 0
	push	dword written
	push	dword 2
	push	dword oi
	push	dword [stdout]
	call	_WriteConsoleA@20
	mov	eax,1
	retn

.cont
	mov	ebx,[ebp+8]		; check whether it was an
	cmp	dword [ebx],0x80000004	; EXCEPTION_SINGLE_STEP or not
	mov	eax,1			; if not, terminate the application
	jne	.e
	mov	eax,[ebp+0x10]		; here comes the trick: we get the
	mov	ebx,[eax+CONTEXT.cx_Eip]; context handle and check what the
	cmp	byte[ebx],0x9D		; next instruction to be executed is
	jne	.a			; if POPFD and it would turn off the
	mov	ecx,[eax+CONTEXT.cx_Esp]; T flag, we won't turn it on either
	test	[ecx],word 0x100	; tests for other instructions can be
	jz	.b			; added as necessary
.a
	or	[eax+192],word 0x100	; turn on T flag (kernel cleared it)
.b
	mov	dword [eax+CONTEXT.cx_SegCs],0x15F
	call	printaddress		; print the address of the debug trap

;	push    dword MB_OK
;	call    _MessageBeep@4

;	push    dword 0
;	push    dword written
;	push    dword 1
;	push    dword onedot
;	push    dword [stdout]
;	call    _WriteConsoleA@20

	xor     eax,eax			; tell the kernel to continue execution
.e
	pop	ecx			; destroy stack frame and return
	pop	ebx
	mov	esp,ebp
	pop	ebp
	retn

printaddress
	push	ecx			; just a lame routine to print out
	push	edx			; a hex address, no explanations ;-)

	xor	ecx,ecx
.n
	rol	ebx,4
	mov	dl,bl
	and	dl,0x0F
	cmp	dl,0x9
	ja	.abcdef
	add	dl,'0'
	jmp	.a
.abcdef
	add	dl,'A'-0xA
.a
	mov	[ecx+address],dl
	inc	cl
	cmp	cl,8
	jne	.n

	push	dword 0
	push	dword written
	push	dword 9
	push	dword address
	push	dword [stdout]
	call	_WriteConsoleA@20

	pop	edx
	pop	ecx
	retn

SEGMENT .data USE32 class=data

stdout	dd 0
onedot	db '.'
oi	db '!',0x0A
written	dd 0
address	db 0,1,2,3,4,5,6,7,0x0A
