 comment %
	Stone's Win32 Winice Detector. NT compatible - however not all methods
	detect winice in WinNT.

	To compile: Run make with TASM in your path.

	
	2nd&mi

	stone@one.se

	%	

.386P
LOCALS
JUMPS
.MODEL FLAT, STDCALL			; with STDCALL we must reverse the sequence of pushes 
					; before a APIn call. 

UNICODE = 0				; Needed for w32.inc
INCLUDE W32.inc				; Windows definitions
include excep.inc

extrn	LoadLibraryA		: PROC
extrn	GetProcAddress		: PROC

.DATA
pIDT	    db 6 dup  (?)				; data used by method 5
lpSICE9x    db "\\.\SICE",0				; data used by method 4
lpSICENT    db "\\.\NTICE",0				; data used by method 4
lpSIWVID    db "\\.\SIWVID",0				; data used by method 6
lpszNmsym   db "C:\siw95\nmtrans.dll",0			; data used by method 7 - 95
lpszNmSymNT db "C:\ntice\nmtrans.dll",0			; data used by method 7 - NT
lpszNmIsSoftIceLoaded db "NmSymIsSoftICELoaded",0 	; data used by method 7

lpszCaption db "Stone's Win32 Winice detector",0 ; caption
lpszMethod1 db "Method 1: Int 68h",0
lpszMethod2 db "Method 2: Int 3 - The BCHK interface",0
lpszMethod3 db "Method 3: 'WINICE.BR' string found in V86 MEMORY",0
lpszMethod4 db "Method 4: SoftIce Device Driver",0
lpszMethod5 db "Method 5: IDT",0
lpszMethod6 db "Method 6: SoftIce Video Driver",0
lpszMethod7 db "Method 7: NmTrans.dll told me",0

.CODE

start:

NotIceTF:
	call	IsIceInt68
	test	eax,eax
	jz	NotInt68

	call	MessageBoxA, 0,  offset lpszMethod1, offset lpszCaption, 0

NotInt68:
	call	IsIceInt3
	test	eax,eax
	jz	NotInt3
		
	call	MessageBoxA, 0,  offset lpszMethod2, offset lpszCaption, 0

NotInt3:
;	call	IsIceLowMem		; This method is unstabile when SI 3.23
	test	eax,eax			; is loaded. It's efficient against
	jz	NotLowMem		; 3.0 and works when no ice is loaded!

	call	MessageBoxA, 0,  offset lpszMethod3, offset lpszCaption, 0

NotLowMem:	
	call	IsIceDrv
	test	eax,eax
	jz	NotDrv

	call	MessageBoxA, 0,  offset lpszMethod4, offset lpszCaption, 0

NotDrv:
	call	IsIceSIDT
	test	eax,eax
	jz	NotIDT

	call	MessageBoxA, 0,  offset lpszMethod5, offset lpszCaption, 0

NotIDT:
	call	IsIceSiwVid
	test	eax,eax
	jz	NotSiwVid

	call	MessageBoxA, 0, offset lpszMethod6, offset lpszCaption, 0

NotSiwVid:
	call	IsIceNmTrans
	test	eax,eax
	jz      NotIceNmTrans
	
	call	MessageBoxA, 0, offset lpszMethod7, offset lpszCaption, 0

NotIceNmTrans:

	call	ExitProcess, -1
;------------------------------------------------------------------------------
IsIceDrv	PROC
	CALL	CreateFileA, OFFSET lpSICE9x, FALSE, FALSE, NULL, FALSE,\
			     OPEN_EXISTING, NULL
	CMP	EAX, -1
	JZ	@@NoSICE9x
	mov	eax, TRUE
	RET	
@@NoSICE9x:

	CALL	CreateFileA, OFFSET lpSICENT, FALSE, FALSE, NULL, FALSE,\
			     OPEN_EXISTING, NULL
	CMP	EAX, -1
	JZ	@@NoSICENT

	mov	eax, TRUE
	RET
@@NoSICENT:
	xor	eax,eax
	ret
IsIceDrv	ENDP

;------------------------------------------------------------------------------

IsIceLowMem PROC	; Searches for the string "WINICE.BR" in V86 MEMORY.
	mov	al,  "W"   
	mov	edi, 10000h
	mov	ecx, 400000h-10000h
	SetExceptionFrame
@@More:
	repnz	SCASB			; "W"
	jecxz	@@NotFound
	cmp	dword ptr [edi], "CINI"	; INIC
	jz	@@Ok1

	jmp	@@More
@@Ok1:	
	add	edi, 4
	cmp	dword ptr [edi], "RB.E"	; 
	jnz	@@More
	mov	eax,1
@@NotFound:
	RestoreExceptionFrame
	ret
IsIceLowMem	ENDP
;------------------------------------------------------------------------------

IsIceInt3  PROC
	SetExceptionFrame
	mov	eax, 4
	mov 	ebp, "BCHK"
	int	3
	RestoreExceptionFrame
	mov	eax, TRUE
	ret
IsIceInt3  ENDP

;------------------------------------------------------------------------------

IsIceInt68 PROC
	SetExceptionFrame
	mov ah, 43h
	int	68h
	RestoreExceptionFrame
	cmp	ax, 0f386h
	jz	@@Exit
	xor	eax,eax
	ret
@@Exit:
	mov	eax, TRUE
	ret
IsIceInt68  ENDP

;------------------------------------------------------------------------------

IsIceSIDT	PROC

	SetExceptionFrame		; Exit with "FALSE" if exception
					; remember to restore exeption filter
					; with the appropriate macro
					; this isn't strictly needed.
;----- Here starts the actual detection routine
	sidt	fword ptr pIDT		; Get IDT
	mov	eax, dword ptr [pIDT+2] ; eax -> IDT
	add	eax,8			; eax -> int 1 "vector"
	mov	ebx, [eax]		; ebx == int 1 "vector"
	add	eax, 16			; eax -> int 3 "vector"
	mov	eax, [eax]		; eax == int 3 "vector"
	and	eax, 0ffffh		; don't use the selector
	and	ebx, 0ffffh		; ditto
	sub	eax, ebx		; find displacement
	cmp	eax, 01eh		; if it's 1eh then it's Siw95 3.0
	jz	@@end
	xor	eax,eax

@@end:	

	RestoreExceptionFrame		; Macro that restores the UnhandledExceptionFilter

	ret

IsIceSIDT ENDP
;------------------------------------------------------------------------------
IsIceSiwVid  PROC
	CALL	CreateFileA, OFFSET lpSIWVID, FALSE, FALSE, NULL, FALSE,\
			     OPEN_EXISTING, NULL
	CMP	EAX, -1
	JZ	@@NoSIWVID

	mov	eax, TRUE
@@NoSIWVID:

	RET
IsIceSiwVid	ENDP

;------------------------------------------------------------------------------

IsIceNmTrans PROC
	call	LoadLibraryA, offset lpszNmsym
	test	eax, eax
	jz	@@Not95

	call	GetProcAddress, eax, offset lpszNmIsSoftIceLoaded
	test	eax, eax
	jz	@@Not95

	call	eax
	test	eax,eax
	jnz	@@Exit
@@Not95:
	call	LoadLibraryA, offset lpszNmSymNT
	test	eax,eax
	jz	@@Exit

	call	GetProcAddress, eax, offset lpszNmIsSoftIceLoaded
	test	eax,eax
	jz	@@Exit
	
	call	eax
@@Exit:
	ret
IsIceNmTrans ENDP

;------------------------------------------------------------------------------



ends
end start
	
SetExceptionFrame Macro 

@@Continiue:
EndM

RestoreExceptionFrame Macro
	pop	edx
	mov	fs:[0],edx
	pop	edx		; adjust stack
EndM


.data
	OldStack	dd 0	; static data
	OldEbp		dd 0


