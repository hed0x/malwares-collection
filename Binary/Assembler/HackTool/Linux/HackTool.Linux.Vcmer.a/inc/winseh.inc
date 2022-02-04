
; Windows Structured Exception Handling Functions

set_seh:
       pop     eax
       pop     ebx
       push    esp
       sub     dword [esp], 3*4
       push    ebx
       push    dword [fs:0]
       mov     [fs:0], esp
       jmp     eax

clean_seh:
       pop     eax
       mov     esp, [esp+8]
       pop     dword [fs:0]
       add     esp, 2*4
       jmp     eax

