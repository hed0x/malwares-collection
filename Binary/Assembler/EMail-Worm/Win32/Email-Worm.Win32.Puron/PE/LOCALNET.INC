;FOR NASM

;push ofs callback
;push byte 0
;call NetSearch

NetSearch:
       pushad
       call delta
       push byte 0
       push esp
       push dword [esp+8*4+4+2*4]
       push byte 0
       push byte RESOURCETYPE_ANY
       push byte RESOURCE_CONNECTED
       call [ebp+WNetOpenEnumA]
       test eax, eax
       pop ebx
       jnz .done
       push dword 16*1024h
       push byte 40h
       call [ebp+GlobalFree]
       test eax, eax
       jz .done1
       mov esi, eax
       push byte -1
       mov ecx, esp
       push dword 16*1024
       push esp
       push esi
       push ecx
       push ebx
       call [ebp+WNetEnumResourceA]
       test eax, eax
       pop edi
       pop edi
       jnz .done2
  .next_entry:
       test dword [esi+NETRESOURCE.dwType], RESOURCETYPE_DISK
       jz .go_next_entry
       mov eax, [esi+NETRESOURCE.lpLocalName]
       test eax, eax
       jz .empty_name
       push dword [esi+NETRESOURCE.lpRemoteName]
       mov eax, [esp+8*4+8+4]
       call eax
  .empty_name:
       test dword [esi+NETRESOURCE.dwUsage], RESOURCEUSAGE_CONTAINER
       jz .go_next_entry
       push dword [esp+8*4+8]
       push esi
       call NetSearch
  .go_next_entry:
       add esi, NETRESOURCE_size
       dec edi
       jnz .next_entry
  .done2:
       push esi
       call [ebp+GlobalFree]
  .done1:
       push ebx
       call [ebp+WNetCloseEnum]
  .done:
       popad
       ret 8


STRUC NETRESOURCE
.dwScope       RESW 1
.dwType        RESW 1
.dwDisplayType RESW 1
.dwUsage       RESW 1
.lpLocalName   RESD 1
.lpRemoteName  RESD 1
.lpComment     RESD 1
.lpProvider    RESD 1
ENDSTRUC


RESOURCE_CONNECTED      EQU 00000001h
RESOURCETYPE_ANY        EQU 00000000h
RESOURCETYPE_DISK       EQU 00000001h
RESOURCEUSAGE_CONTAINER EQU 00000002h

