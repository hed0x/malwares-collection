; CPL (Control Panel Extension) file generator, acts like .exe files
; #########################################################################

.code

CreateCPLFile proc uses ebx esi edi InFile, OutFile: DWORD
        LOCAL   buf, stub: DWORD
        LOCAL   hFileIn, hFileOut: DWORD
        LOCAL   dwTemp, bRead, bWritten, flen: DWORD

        xor     ebx, ebx
        invoke  GlobalAlloc, GMEM_FIXED, 8192
        mov     buf, eax

        invoke  GlobalAlloc, GMEM_FIXED, CplStubLen+256
        mov     stub, eax
        mov     ecx, CplStubLen
        mov     esi, offset CplStub
        mov     edi, eax
        rep movsb

        invoke  CreateFile, InFile, GENERIC_READ, FILE_SHARE_READ or FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL
        mov     hFileIn, eax
        inc     eax
        jz      @cpf_ret

        invoke  CreateFile, OutFile, GENERIC_WRITE or GENERIC_READ, FILE_SHARE_READ or FILE_SHARE_WRITE, NULL, CREATE_ALWAYS, 0, NULL
        mov     hFileOut, eax
        inc     eax
        jz      @cpf_ret

        invoke  GetFileSize, hFileIn, 0
        mov     flen, eax
        add     eax, 4
        invoke  AddEPSection, stub, eax, FALSE

        ; Write RVA in stub
        mov     esi, stub
@l:
        inc     esi
        cmp     dword ptr[esi], 'KEWL'
        jnz     @l
        
        add     eax, 10000000h ; ImageBase
        mov     dword ptr[esi], eax

        mov     ecx, esi
        sub     ecx, stub
        add     ecx, 1000h-200h ; RVA

        PEPtrB  edx, stub

        ; Fix relocs table
        mov     eax, dword ptr[edx+0A4h]
        add     dword ptr[edx+0A4h], 12 ; Fix up, data size
        add     eax, stub
        add     eax, 400h
        mov     dword ptr[eax], 1000h
        mov     dword ptr[eax+4], 12
        mov     dword ptr[eax+8], ecx
        or      dword ptr[eax+8], 3 shl 12

        ; Write stub to file
        invoke  WriteFile, hFileOut, stub, CplStubLen, addr bWritten, 0
        m2m     dwTemp, flen

        ; Write filelength to file
        invoke  WriteFile, hFileOut, addr dwTemp, 4, addr bWritten, 0

        ; Write infile to outfile
@l2:
        invoke  ReadFile, hFileIn, buf, 1024, addr bRead, NULL
        .IF     bRead
                invoke  WriteFile, hFileOut, buf, bRead, addr bWritten, NULL
                jmp     @l2
        .ENDIF

        invoke  CloseHandle, hFileIn
        invoke  CloseHandle, hFileOut
        inc     ebx

@cpf_ret:
        invoke  GlobalFree, buf
        invoke  GlobalFree, stub
        mov     eax, ebx
        ret
CreateCPLFile endp
