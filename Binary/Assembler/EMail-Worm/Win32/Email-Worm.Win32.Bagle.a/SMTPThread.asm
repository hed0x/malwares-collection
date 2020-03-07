; SMTP Client Thread Manager, manages threads for SMTP client
; #########################################################################

.const

SMTP_QUEUE_ENTRY struct
        MsgCount        DWORD   ?
        lpRoot          DWORD   ?
        lpLast          DWORD   ?
SMTP_QUEUE_ENTRY ends

.data?
        lpSMTPLastUsed  dd      ?
        lpSMTPThreads   dd      ?
        lpSMTPQueue     dd      MaxSmtpThreads dup(?)
        lpSMTPMootex    dd      ?

.code

; Initialization, memory allocation
InitSMTPQueue proc uses edi ebx
        invoke  CreateMutex, NULL, FALSE, NULL
        mov     lpSMTPMootex, eax

        mov     lpSMTPLastUsed, 0
        mov     lpSMTPThreads, 0
        mov     ebx, MaxSmtpThreads

        mov     edi, offset lpSMTPQueue
@ismtp_l:
        invoke  GlobalAlloc, GPTR, sizeof SMTP_QUEUE_ENTRY
        cld
        stosd
        dec     ebx
        jnz     @ismtp_l

        ret
InitSMTPQueue endp

; Main working thread, reads list of emails and sends them to destination
SMTPQueueWorkingThread proc uses ebx edi lpParam: DWORD
        LOCAL   lpEmail, lpUser, lpHost: DWORD

        xor     eax, eax
        mov     ebx, lpParam
        assume  ebx: ptr SMTP_QUEUE_ENTRY

@queue_loop:
        invoke  WaitForSingleObject, lpSMTPMootex, INFINITE
        ; Thread-safe

        ; Pop email-list entry
        mov     ecx, [ebx].lpRoot
        .IF     ecx
                assume  ecx: ptr EMAIL_ENTRY
                m2m     lpEmail, [ecx].EMAILStr
                m2m     lpUser, [ecx].EMAILHash
                m2m     lpHost, [ecx].Host
                m2m     [ebx].lpRoot, [ecx].Next        ; Move to Next ptr
                assume  ecx: nothing

                ; Free email-list entry
                invoke  GlobalFree, ecx
                invoke  ReleaseMutex, lpSMTPMootex

                invoke  WaitUntilConnected

                ; Send message
                mov     edi, MaxSmtpAttemps
        @try_send:
                invoke  DoSendEmailBody, lpEmail, lpUser, lpHost
                test    eax, eax
                jnz     @sent_ok
                dec     edi
                jg      @try_send

        @sent_ok:
                ; Free memory
                invoke  GlobalFree, lpEmail
                invoke  LocalFree, lpUser
                invoke  LocalFree, lpHost
        .ELSE
                invoke  ReleaseMutex, lpSMTPMootex
        .ENDIF

        dec     [ebx].MsgCount
        jg      @queue_loop

        assume  ebx: nothing

        xor     eax, eax
        ret
SMTPQueueWorkingThread endp

; Add a e-mail message to queue
SMTPQueueAdd proc uses ebx lpEmail, lpUser, lpHost: DWORD
        LOCAL   lpThreadId: DWORD

        invoke  WaitForSingleObject, lpSMTPMootex, INFINITE
        ; Thread-safe

        .IF     lpSMTPLastUsed >= MaxSmtpThreads
                mov     lpSMTPLastUsed, 0
        .ENDIF

        ; Point eax to a needed array item
        xor     edx, edx
        mov     eax, 4
        mul     lpSMTPLastUsed
        add     eax, offset lpSMTPQueue

        assume  ebx: ptr SMTP_QUEUE_ENTRY
        mov     ebx, eax
        mov     ebx, dword ptr[ebx]

        ; Write SMTP_QUEUE_ENTRY & EMAIL_ENTRY data
        invoke  StrDup, lpHost
        push    eax
        invoke  StrDup, lpUser
        pop     edx
        invoke  EmailListAdd, addr [ebx].lpRoot, addr [ebx].lpLast, lpEmail, eax, edx

        ; Cycle through queue threads
        inc     lpSMTPLastUsed
        
        .IF     [ebx].MsgCount == 0
                ; Start thread
                invoke  CreateThread, NULL, 0, offset SMTPQueueWorkingThread, ebx, 0, addr lpThreadId
        .ENDIF

        inc     [ebx].MsgCount
        assume  ebx: nothing

        invoke  ReleaseMutex, lpSMTPMootex
        ret
SMTPQueueAdd endp
