; on NT all the action is moved into a Kernel Mode Driver...

INCLUDE  KMD\IoCtrl.INC

;------------CONST-----------------------------------------------------------------------
.CONST
szDrvSym                               DB "\\.\INVISIBILITY", 0
szErrDrvUnavailable                    DB "Invisibility.SYS driver not registered yet and/or not running !", 0
szNTDLL                                DB "NtDll", 0
szNQSI                                 DB "NtQuerySystemInformation", 0

;------------DATA------------------------------------------------------------------------
.DATA
hDrv                                   DD -1

;------------CODE------------------------------------------------------------------------
.CODE

;
; Purpose:       Passes needed information to Invisibility.sys and make it hook the targets
;
; Return type:   void
;
FeedRunDriver PROC hDriver : HANDLE, PID
	LOCAL   buff    : DWORD                                                ; buffer 4 DeviceIoControl
	LOCAL   dwcOut  : DWORD

	; pass ntdll!NtQuerySystemInformation address to driver
	push    offset szNTDLL
	call    LoadLibraryA
	push    offset szNQSI
	push    eax
	call    GetProcAddress
	test    eax, eax
	jz      @@exit
	mov     buff, eax
	push    NULL
	lea     eax, dwcOut
	push    eax
	push    0
	push    NULL
	push    4
	lea     eax, buff
	push    eax
	push    IOC_PROVIDE1                                                   ; IO control code
	push    hDriver
	call    DeviceIoControl
	
	; pass target PID to driver
	push    PID
	pop     buff
	push    NULL
	lea     eax, dwcOut
	push    eax
	push    0
	push    NULL
	push    4
	lea     eax, buff
	push    eax
	push    IOC_PROVIDE2
	push    hDriver
	call    DeviceIoControl
	
	; pass user32!EnumWindows address 2 driver
	APIAddressFromIT <EnumWindows>, <EAX>
	mov     buff, eax
	push    NULL
	lea     eax, dwcOut
	push    eax
	push    0
	push    NULL
	push    4
	lea     eax, buff
	push    eax
	push    IOC_PROVIDE3
	push    hDriver
	call    DeviceIoControl
	
	; pass user32!GetWindowThreadProcessId address 2 driver
	APIAddressFromIT <GetWindowThreadProcessId>, <EAX>
	mov     buff, eax
	push    NULL
	lea     eax, dwcOut
	push    eax
	push    0
	push    NULL
	push    4
	lea     eax, buff
	push    eax
	push    IOC_PROVIDE4
	push    hDriver
	call    DeviceIoControl	
	
	; command driver to install the hook
	push    NULL
	lea     eax, dwcOut
	push    eax
	push    0
	push    NULL
	push    0
	push    NULL
	push    IOC_HOOK
	push    hDriver
	call    DeviceIoControl
  @@exit:
	ret
FeedRunDriver ENDP

;
; Return type:   BOOL
;
; Remarks:       Handles errors alone via MsgBoxs
;
HideMyProcessNt PROC dwPID : DWORD
	; get handle to our driver
	push    0
	push    FILE_ATTRIBUTE_NORMAL
	push    OPEN_EXISTING
	push    NULL
	push    0
	push    GENERIC_READ or GENERIC_WRITE
	push    offset szDrvSym
	call    CreateFileA
	mov     hDrv, eax
	inc     eax
	jnz     @F
	push    MB_ICONERROR
	push    offset szErr
	push    offset szErrDrvUnavailable
	push    0
	call    MessageBoxA
	sub     eax, eax
	jmp     @@exit
  @@:
  	; pass infos 2 driver
  	push    dwPID
  	push    hDrv
  	call    FeedRunDriver	
  @@exit:
	ret
HideMyProcessNt ENDP

;
; Return value: void
;
UnhideMyProcessNt PROC
	LOCAL   dwcOut   : DWORD
	
;	int     3
	; command driver to unhook the NT service
	push    NULL
	lea     eax, dwcOut
	push    eax
	push    0
	push    NULL
	push    0
	push    NULL
	push    IOC_UNHOOK
	push    hDrv
	call    DeviceIoControl		
	; close driver handle
	cmp     hDrv, INVALID_HANDLE_VALUE
	jz      @F
	push    hDrv
	call    CloseHandle
  @@:
	ret
UnhideMyProcessNt ENDP