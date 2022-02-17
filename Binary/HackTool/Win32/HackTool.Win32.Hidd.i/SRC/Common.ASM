INCLUDELIB  Lib\K32Lib.lib
VxDCall4    PROTO :DWORD, :DWORD, :DWORD, :DWORD, :DWORD

PUSHA_STRUCT STRUCT 1
	_EDI              DWORD ?
	_ESI              DWORD ?
	_EBP              DWORD ?
	_ESP              DWORD ?
	_EBX              DWORD ?
	_EDX              DWORD ?
	_ECX              DWORD ?
	_EAX              DWORD ?
PUSHA_STRUCT ENDS

APIAddressFromIT MACRO api, reg
  	mov     reg, api                                                       ; REG = ptr to 'JMP DWORD PTR [THUNK]'
  	mov     reg, [reg + 2]                                                 ; REG = THUNK address
  	mov     reg, [reg]                                                     ; REG = THUNK value/API address
ENDM

;------------CONST-----------------------------------------------------------------------
.CONST
_PageModifyPermissions                 EQU 00001000Dh
PC_USER                                EQU 000040000h
PC_STATIC                              EQU 020000000h
PC_WRITEABLE	                       EQU 000020000h
VA_SHARED                              EQU 08000000h       ; Matt Pietrek

;------------CODE------------------------------------------------------------------------
.CODE

;
; Args:
; pAddr       - address where the jump should be assembled to
; pJumpTarget - jump target addresse
;
AssembleJump PROC USES EBX ESI EDI, pAddr : LPVOID, pJumpTarget : LPVOID
	MOV    EDI, pAddr                                                      ; EDI -> assemble address
	MOV    BYTE PTR [EDI], 0E9h                                            ; stamp jump opcode
	MOV    EAX, pJumpTarget
	SUB    EAX, EDI
	SUB    EAX, 5
	MOV    DWORD PTR [EDI + 1], EAX                                        ; stamp jump target
	RET
AssembleJump ENDP

;
; Return type: BOOL
;
RegisterServiceProcess PROC dwPID : DWORD, bHide : BOOL
	; convert current PID -> 0
	call    GetCurrentProcessId
	cmp     dwPID, eax
	jnz     @F
	sub     eax, eax
	mov     dwPID, eax
  @@:
	; get the address of 'RegisterServiceProcess' API
	push    offset szK32
	call    LoadLibraryA
	test    eax, eax
	jz      @F
	push    offset szRSP
	push    eax
	call    GetProcAddress
	test    eax, eax
	jz      @F
	; ...and exec
	push    bHide
	push    dwPID
	call    eax
  @@:
	ret
RegisterServiceProcess ENDP

;
; Return type: void
;
VirtualSharedAlloc9x PROC dwSize : DWORD
	INVOKE  VirtualAlloc, NULL, dwSize, MEM_COMMIT + VA_SHARED, PAGE_EXECUTE_READWRITE
	ret
VirtualSharedAlloc9x ENDP

;
; Return type: BOOL
;
VirtualSharedFree9x PROC p : LPVOID
	INVOKE  VirtualFree, p, 0, MEM_RELEASE
	ret
VirtualSharedFree9x ENDP

;
; Args:
; p          - pointer to region begin
; dwc        - sizeof in bytes of the region beginning from 'p' to modify
;
ObtainWriteAccessInSharedArea9x PROC USES EBX ESI EDI, p : LPVOID, dwc : DWORD
	; calc page addr/size
	mov     ecx, dwc
	add     ecx, 4096
	shr     ecx, 12                                                        ; ECX -> page count
	mov     edi, p
	shr     edi, 12                                                        ; EDI -> page index/addr
	
	; perform VxDCall
	push    PC_STATIC or PC_WRITEABLE or PC_USER                           ; OR  mask
	push    0                                                              ; AND mask
	push    ecx
	push    edi
	push    _PageModifyPermissions
	call    VxDCall4
	ret
ObtainWriteAccessInSharedArea9x ENDP