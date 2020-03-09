;Simple tool helped in creating that Divinorum virus
;CopyLeft- Fakedminded 2007

.586
.model flat,stdcall
option casemap:none
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include \masm32\include\windows.inc
include \masm32\include\masm32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\masm32.lib


;function_number=12               ;change it according to the function number 

.data
func1 db "CreateFileA",0
db "CloseHandle",0
db "WriteFile",0
db "ReadFile",0

db "GetFileSize",0
db "GlobalAlloc",0
db "SetFilePointer",0
db "GetProcAddress",0
db "GetVersionExA",0
db "GetDateFormatA",0
db "Sleep",0
db "FindFirstFileA",0
db "FindNextFileA",0
db "FindClose",0
db "GetLastError",0
db "ExitProcess",0
db "LoadLibraryA",0
db "FreeLibrary",0
db "ExpandEnvironmentStringsA",0
db "GetModuleHandleA",0
db "GetModuleFileNameA",0
db "CopyFileA",0
db "GetCurrentDirectoryA",0
db"SetCurrentDirectoryA",0
db "GetFileAttributesA",0
db "GetTickCount",0
db "CreateThread",0

db "IsDebuggerPresent",0
db "CreateMutexA",0
db "GetLogicalDriveStringsA",0
db "GetDriveTypeA",0
db "VirtualProtect",0
db "GetEnvironmentVariableA",0
db "CreateProcessA",0
db "WaitForSingleObject",0
db "WSACleanup",0
db "WSAStartup",0
db "WSASocketA",0
db "htons",0
db "htonl",0
db "connect",0
db "accept",0
db "listen",0
db "recv",0
db "send",0
db "bind",0
db "inet_addr",0

DragQueryFileF db "DragQueryFileA",0


OpenClipboardF db "OpenClipboard",0
CloseClipboardF db "CloseClipboard",0
GetClipboardDataF db "GetClipboardData",0
MessageBoxF db "MessageBoxA",0
dd 0ffh
hexA db " equ <dword ptr [eax+0%xh]>",13,10,0
eques_file db "equals.inc",0

.data?
buffer db 256 dup(?)
file_handle dd ?

.code
start:
invoke CreateFile,offset eques_file,40000000h,0,0,2,0,0
mov file_handle,eax
mov esi,offset func1
xor ecx,ecx
start_1:
pusha
call @f
db "A",0
@@:
pop ebx
push 0
push esp
pop edx
invoke WriteFile,file_handle,ebx,1,edx,0
add esp,4
popa

push ecx
push esi
invoke lstrlen,esi
pop esi
pop ecx
push ecx
push esi

push 0
push esp
pop edx
invoke WriteFile,file_handle,esi,eax,edx,0
add esp,4
pop esi
pop ecx
push ecx
push esi
invoke wsprintf,offset buffer,offset hexA,ecx
invoke lstrlen,offset buffer
push 0
push esp
pop edx
invoke WriteFile,file_handle,offset buffer,eax,edx,0
add esp,4
pop esi
@@:
mov al,byte ptr[esi]
or al,al
jz @f
inc esi
jmp @b
@@:
inc esi
pop ecx
add ecx,4
cmp byte ptr[esi],0ffh
je @f
jmp start_1

@@:
call crc_hasher
exit:
invoke CloseHandle,file_handle
invoke ExitProcess,0

.data

crc_file db "crc_file.inc",0 ;file to output the crc32 results



crc_32 db "F",9h," dd 0%xh",13,10,0
.data?
;buffer db 20  dup(?)
;file_handle dd ?

.code

;-----------------------------------___________________________----------
;-----------------------------------Coded by fakedminded/2007  ----------
;-----------------------------------All shits are not reserved ----------
;-----------------------------------ass-koder.de.vu            ----------
;-----------------------------------___________________________----------


crc_hasher:

invoke CreateFile,offset crc_file,40000000h,0,0,2,0,0
mov file_handle,eax
mov esi,offset func1

@11:

call size_string
push esi
push ecx
push 0
push esp
pop edx
invoke WriteFile,file_handle,esi,ecx,edx,0
add esp,4
pop ecx
mov esi,[esp]
call crc_
invoke wsprintf,offset buffer,offset crc_32,eax

mov esi,offset buffer
call size_string
push ecx

push 0
push esp
pop edx
invoke WriteFile,file_handle,offset buffer,ecx,edx,0
add esp,4

mov esi,offset buffer
pop ecx
call zero_mem

pop esi
@@:
xor eax,eax
lodsb
or eax,eax
jz @f
jmp @b
@@:
lodsb
sub eax,0ffh
or eax,eax
jz @f
dec esi
jmp @11
@@:
invoke CloseHandle,file_handle
call @f
db "Function crc32 is done :voila!!",0
@@:
pop edx
xor eax,eax
invoke MessageBox,eax,edx,edx,eax

exit_this:
ret





;--------------------------------------------------------
crc_:       ;Original code by Sepultura. ,re-styled by me :)
xor edx,edx
dec edx

@0:
lodsb
xor dl,al
push ecx
mov cx,8
@1:
shr edx,1
jnc @f
xor edx,0EDB88320h
@@:
loop @1
pop ecx
loop @0
not edx
xchg edx,eax
ret
;--------------------------------------------------------


;---------------------Some Accessory function I use
;//////////////size string esi=offset sring,ecx=the result
size_string:
push esi
xor ecx,ecx
loop_size:
cmp byte ptr [esi],0
je sized
inc esi
inc ecx
jmp loop_size

sized:
pop esi
ret

;/////zeroing the memory
zero_mem:
mov byte ptr [esi],0
inc esi
loop zero_mem
ret

end start

end start