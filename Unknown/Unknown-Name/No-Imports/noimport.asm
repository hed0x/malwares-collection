   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;
   ; [INTRO]
   ; Resolving API dynamically to work with our viruses is indeed required
   ; so we are going to make an importless virus that will work currently
   ; on both win9x and winXP but not on win2k because you always need to
   ; have kernel32 mapped to your virus memort space so this is a bit of
   ; inconvient but atleast we are going to make it run on other platforms :)
   ;
   ;
   ; [STEPS]
   ; 1) Locate the image base of kernel32
   ; 2) Locate LoadLibraryA by examining the exports of kernel32
   ; 3) Load user32.dll
   ; 4) Locate MessageBoxA by examining the exports of user32.dll
   ;    but you can use whatever API you want from user32 however in this case
   ;    i choosed to use a simple message to show my point
   ; 5) Locate ExitProcess
   ; 6) Exit safetly
   ;
   ; [Bug-Fix for win2k]
   ; It's not that much of a solution but it will solve the crashing problem
   ; in the virus as i have mentioned before why it will crash?, anyway we can
   ; solve that bye adding a fake import table to compelle the loader to map
   ; kernel32 so exmaine the following exmaple:
   ;
   ; 000006B0: C8 03 CA 03 01 C3 00 00 4B 45 52 4E 45 4C 33 32 KERNEL32.DLL....
   ; 000006C0: 2E 44 4C 4C 00 00 00 00 00 11 00 00 00 00 00 00 ................
   ; 000006D0: 00 00 00 00 B0 10 00 00 00 11 00 00 00 00 00 00 ................
   ; 000006E0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
   ;
   ; you can easily do that with the help of a hex-editor since we want it to work
   ; on win2k, now this won't solve the problem entirely but it will prevent the
   ; crashing only ;) anyway let me explain what is going on, as you can see we have
   ; added the name of the DLL but not the name of any API since we don't want to use
   ; any API other than an importless virus, after the name of the DLL i have placed
   ; the fake import table you can see that OriginalFirstThunk = FirstThunk
   ; and that both are pointing to a place that has a zeroe dword once it's mapped in
   ; memory so therefore, when the loader has loaded kernel32 and goes to load each of
   ; the APIs we request it simply finds that no API is asked and so terminates and not
   ; crash, so in another words the name of the API points to kernel32
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


   .386p

   .model flat, stdcall

   .DATA
       szTitle     db 'Dynamic API Resolving',0
       szText      db 'I Succeeded',0

       ; DLL name we are going to import
       __DLL_User32        db 'User32', 0

       ; API's we are going to use
       __API_LoadLibraryA      db 'LoadLibraryA', 0

       __API_MessageBoxA       db 'MessageBoxA', 0
       __API_ExitProcess       db 'ExitProcess', 0

       __ADDR_MessageBoxA      dd 0 ; Address of MessageBoxA
       __ADDR_ExitProcess      dd 0 ; Address of ExitProcess
       _User32     dd 0 ; Handle to user32
       _Kernel32   dd 0 ; Handle to kernel32



   .CODE

   Main:
       call    GetDelta

   GetDelta:
       pop ebp
       sub ebp, offset GetDelta

       mov eax, [esp]          ; at the very beginning the first dword on the stack
                       ; contains a pointer inside kernel32
       or eax, 00000FFFh       ; the image base has to be a multiple of the memory alignment
       xor eax,00000FFFh

   compare:
       cmp word ptr [eax], 'ZM'
       je kernel32_found
       sub eax, 1000h
       jmp compare

   kernel32_found:
       mov dword ptr [ebp + _Kernel32], eax
       lea esi, [ebp + __API_LoadLibraryA]
       call    GetFunctionAddress
       lea ebx, [ebp + offset __DLL_User32]
       push    ebx
       call    eax            ; Load user32.dll
                          ; in return, eax = image base of user32
       lea esi, [ebp + __API_MessageBoxA]
       call    GetFunctionAddress
       mov [ebp + __ADDR_MessageBoxA], eax

       push    0
       push    offset szTitle
       push    offset szText
       push    0
       call    [ebp + __ADDR_MessageBoxA]            ; call MessageBoxA


       mov eax, [ebp + _Kernel32]
       lea esi, [ebp + __API_ExitProcess]
       call    GetFunctionAddress
       mov [ebp + __ADDR_ExitProcess], eax

       push    0
       call    [ebp + __ADDR_ExitProcess]            ; call ExitProcess


   ;---------------------------------------------------------------------------
   ; GetFunctionAddress
   ;---------------------------------------------------------------------------
   ; Input parameters:
   ; esi = offset of a zeroe terminated string with the name of the Api.
   ; eax = image base of the dll where the API resides
   ; Returns:
   ; eax = address of desired API
   ;---------------------------------------------------------------------------
   GetFunctionAddress PROC
       mov ebx, [eax + 3Ch]          ; pointer to pe header
       add ebx, eax
       add ebx, 120
       mov ebx, [ebx]
       add ebx, eax              ; EBX = Export Address
       xor edx, edx
       mov ecx, [ebx + 32]
       add ecx, eax
       push    esi
       push    edx

   CompareNext:
       pop edx
       pop esi
       inc edx
       mov edi, [ecx]
       add edi, eax
       add ecx, 4
       push    esi
       push    edx

   CompareName:
       mov dl, [edi]
       mov dh, [esi]
       cmp dl, dh
       jne CompareNext
       inc edi
       inc esi
       cmp byte ptr [esi], 0
       je  GetAddress
       jmp CompareName

   GetAddress:
       pop edx
       pop esi
       dec edx
       shl edx, 1
       mov ecx, [ebx + 36]
       add ecx, eax
       add ecx, edx
       xor edx, edx
       mov dx, [ecx]
       shl edx, 2
       mov ecx, [ebx + 28]
       add ecx, eax
       add ecx, edx
       add eax, [ecx]

       ret

   GetFunctionAddress ENDP

   End Main
