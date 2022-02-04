;------------CONST-----------------------------------------------------------------------
.CONST
inject_code_size                       EQU inject_code_end - inject_code_start
szK32                                  DB "Kernel32", 0
szRSP                                  DB "RegisterServiceProcess", 0
szP32F                                 DB "Process32First", 0
szP32N                                 DB "Process32Next", 0
bP32FSign                              DB 053h, 056h, 057h, 033h, 0DBh
bP32NSign                              DB 053h, 056h, 057h, 033h, 0F6h

;------------DATA------------------------------------------------------------------------
.DATA
pP32F                                  DD ?
pP32N                                  DD ?
pICode                                 DD ?                                    ; address of the hook procedures in shared mem

;------------CODE------------------------------------------------------------------------
.CODE

;
; hook procedures
;

inject_code_start:
;
;   BOOL WINAPI Process32First(
;     HANDLE hSnapshot,      
;     LPPROCESSENTRY32 lppe  
;   );
;
NewProcess32First:
	pushfd
	pushad
	
;	int     3

	; get base delta
	call    call_me
  call_me:
	pop     ebp
	sub     ebp,offset call_me
	mov     eax, [ebp + ic_pP32F]
	mov     [esp].PUSHA_STRUCT._EAX, eax                                   ; write our API entry (+5) to popad'ed regs
	
	;
	; we don't do here something because hiding the kernel32 process (first one) is not wished
	; (Anyway it would be easy to implement. Call P32F. Is it the process we want to hide then
	;  call also P32N with the client's buffer.)
	;
	
	popad
	popfd	
	
	; jump to APIs OEP
	push    ebx                                                            ; the instructions we overwrote
	push    esi                                                            ; ...
	push    edi                                       
	xor     ebx, ebx
	JMP     eax
		
;
;   BOOL WINAPI Process32Next(
;     HANDLE hSnapshot,      
;     LPPROCESSENTRY32 lppe  
;   );
; 
NewProcess32Next:
	pushfd
	pushad
	
;	int     3
;	nop

	; get base delta
	call    call_me2
  call_me2:
	pop     ebp
	sub     ebp,offset call_me2                                            ; EBP -> delta
	lea     edi, [esp + sizeof PUSHA_STRUCT + 4 + 4]                       ; EDI -> argument list ptr
	
	push    [edi + 4]                                                      ; push P32N arg2
	push    [edi]                                                          ; push P32N arg1
	lea     eax, [ebp + @F]
	push    eax                                                            ; push NEW return value
	; jump to APIs OEP
	push    ebx                                                            ; the instructions we overwrote
	push    esi                                                            ; ...
	push    edi                                       
	xor     esi, esi
	jmp     [ebp + ic_pP32N]
  @@:
  	mov     edx, eax                                                       ; EDX -> P32N ret value
  	; did we snap the process we want to hide ? Save result in ECX (1 == we must hide the process)
  	sub     ecx, ecx
  	mov     esi, [edi + 4]                                                 ; ESI -> ptr to clients PROCESSENTRY32
  	mov     ebx, [esi].PROCESSENTRY32.th32ProcessID
  	cmp     ebx, [ebp + ic_dwHidePID]
  	jnz     @F
  	inc     ecx  	  	
  @@:
  	; save ECX/EDX to popad'ed REGS
  	mov     [esp].PUSHA_STRUCT._ECX, ecx  	
  	mov     [esp].PUSHA_STRUCT._EDX, edx  		
  	push    [ebp + ic_pP32N]
  	pop     [esp].PUSHA_STRUCT._EAX                                        ; place P32N address in popad'ed EAX
	popad
	popfd
	
	; was it an unsuccessful call ?
	cmp     edx, FALSE
	jz      np32n_exit
	; eventually recall the API
	cmp     ecx, 0
	jz      np32n_exit
	
	; jump to APIs OEP
	push    ebx                                                            ; the instructions we overwrote
	push    esi                                                            ; ...
	push    edi                                       
	xor     esi, esi
	jmp     eax
	
	;
	; this place is never reached
	;	
	
  np32n_exit:
	mov     eax, edx                                                       ; place ret value in EAX
	ret     8
	
	ic_pP32F                       DD ?                                    ; --> API entry + 5
	ic_pP32N                       DD ?                                    ; /
	ic_dwHidePID                   DD ?
	
inject_code_end:

;
; Return type: BOOL
;
HookToolhelp32API9x PROC dwPID : DWORD
	; get the API addresses
	push    offset szK32
	call    LoadLibraryA
	xchg    esi, eax                                                       ; ESI -> kernel32 base
	push    offset szP32F
	push    esi
	call    GetProcAddress
	test    eax, eax
	jz      @@exit
	mov     pP32F, eax
	push    offset szP32N
	push    esi
	call    GetProcAddress
	test    eax, eax
	jz      @@exit
	mov     pP32N, eax
	
	; signature check
	mov     esi, pP32F                                                     ; ESI -> Process32First address
	lodsd
	cmp     eax, dword ptr [bP32FSign]
	jz      @F
	xor     eax, eax
	jmp     @@exit
  @@:
	lodsb
	cmp     al, byte ptr [bP32FSign + 4]
	jz      @F
	xor     eax, eax
	jmp     @@exit
  @@:
	mov     esi, pP32N                                                     ; ESI -> Process32Next address
	lodsd
	cmp     eax, dword ptr [bP32NSign]
	jz      @F
	xor     eax, eax
	jmp     @@exit
  @@:
  	lodsb
  	cmp     al, byte ptr [bP32NSign + 4]
  	jz      @F
  	xor     eax, eax
  	jmp     @@exit
  @@:
  	; setup hook procedures and share them in system memory area
  	push    pP32F
  	pop     ic_pP32F
  	add     ic_pP32F, 5
  	push    pP32N
  	pop     ic_pP32N
  	add     ic_pP32N, 5
	push    dwPID
	pop     ic_dwHidePID
  	
  	push    inject_code_size
  	call    VirtualSharedAlloc9x
  	test    eax, eax
  	jz      @@exit
  	mov     pICode, eax
  	mov     ecx, inject_code_size
  	mov     edi, eax
  	mov     esi, inject_code_start
  	rep     movsb  	
  	
  	; patch API EntryPoints
  	mov     edi, pP32F                                                     ; EDI -> Process32First address
  	push    5
  	push    edi
  	call    ObtainWriteAccessInSharedArea9x
  	push    pICode
  	push    edi
  	call    AssembleJump
  	mov     edi, pP32N                                                     ; EDI -> Process32Next address
  	push    5
  	push    edi
  	call    ObtainWriteAccessInSharedArea9x
  	mov     eax, pICode
  	add     eax, (NewProcess32Next - inject_code_start)
  	push    eax
  	push    edi
  	call    AssembleJump  
	
	; return TRUE
	xor     eax, eax
	inc     eax
  @@exit:	
	ret
HookToolhelp32API9x ENDP

;
; Return type: BOOL
;
HideMyProcess9x PROC dwPID : DWORD
	
	;
	; wipe the process from the CTRL+ALT+DEL window list
	; (it's just a little add-on -> don't handle the return value)
	;
	push    TRUE
	push    dwPID
	call    RegisterServiceProcess
	
	;
	; hook Process32First/Process32Next TH32 APIs
	;
	push    dwPID
	call    HookToolhelp32API9x
	
	ret
HideMyProcess9x ENDP

;
; Return value: void
;
UnhideMyProcess9x PROC
;	int     3
	; recall RSP
	call    GetCurrentProcessId
	push    FALSE
	push    eax
	call    RegisterServiceProcess
	; wipe the redirection jump at our target TH32 APIs
	mov     ecx, 5
	mov     edi, pP32F
	test    edi, edi
	jz      @F
	mov     esi, offset bP32FSign
	push    ecx
	rep     movsb
	pop     ecx
  @@:
	mov     edi, pP32N
	test    edi, edi
	jz      @F
	mov     esi, offset bP32NSign
	rep     movsb	
  @@:
	; free hook procedure memory
	mov     eax, pICode
	test    eax, eax
	jz      @F
	push    eax
	call    VirtualSharedFree9x	
  @@:
	ret
UnhideMyProcess9x ENDP