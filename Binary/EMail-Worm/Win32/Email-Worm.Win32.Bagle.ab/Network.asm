; Common networking functions
; #########################################################################

WaitUntilConnected      proto
                        ; lpHost
NetResolve              proto :DWORD
                        ; s, timeout
NetWaitRecv             proto :DWORD, :DWORD
                        ; s, stream, bytes, first_timeout, read_timeout
NetRecvUntilBytes       proto :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
                        ; s, stream, maxlen, char, timeout
NetRecvUntilChar        proto :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
                        ; szHost, IP, port
NetConnect              proto :DWORD, :DWORD, :DWORD

.data
                        CurConnections  dd      0       ; Number of current connections (threads)

.code

; Waits until connected to internet
WaitUntilConnected proc
        @l:
                invoke  InternetGetConnectedState, 0, 0
                .IF     eax
                        ret
                .ENDIF
                invoke  Sleep, 2000
        jmp     @l
        ret
WaitUntilConnected endp

; Returns local IP address (1st adapter), or 0 on error
NetLocalIP proc uses ebx
        LOCAL   buf[256]: BYTE
        xor     ebx, ebx

        invoke  ZeroMemory, addr buf, 256

        invoke  gethostname, addr buf, 255
        test    eax, eax
        jnz     @glip_err

        invoke  gethostbyname, addr buf
        test    eax, eax
        jz      @glip_err
        
        assume  eax: ptr hostent
        mov     eax, [eax].h_list
        assume  eax: nothing
        test    eax, eax
        jz      @glip_err

        mov     eax, [eax]
        mov     ebx, [eax]

@glip_err:
        mov     eax, ebx

        ret
NetLocalIP endp

; Returns resolved IP, or INADDR_NONE
NetResolve proc lpHost: DWORD
        invoke  inet_addr, lpHost
        cmp     eax, INADDR_NONE
        jnz     @res_err

        invoke  gethostbyname, lpHost
        .IF     eax == 0
                mov     eax, INADDR_NONE
        .ELSE
                mov     eax, [eax][hostent.h_list]
                .IF     !eax
                        mov     eax, INADDR_NONE
                        jmp     @res_err
                .ENDIF
                mov     eax, [eax]
                mov     eax, [eax]
        .ENDIF

@res_err:
        ret
NetResolve endp

; Waits for timeout until avaible some data for recv, returns TRUE on SUCCESS
NetWaitRecv proc s, timeout: DWORD
        LOCAL   fd: fd_set
        LOCAL   to: timeval

        m2m     to.tv_sec, timeout
        mov     to.tv_usec, 0

        mov     fd.fd_count, 1          ; FD_ZERO
        lea     eax, fd.fd_array
        m2m     [eax], s                ; FD_SET

        invoke  select, 0, addr fd, NULL, NULL, addr to
        .IF     (eax == SOCKET_ERROR) || (eax == 0)
                xor     eax, eax
        .ELSE
                mov     al, 1
        .ENDIF
        ret
NetWaitRecv endp

; Receives needed amount of bytes, returns TRUE on SUCCESS
NetRecvUntilBytes proc uses ebx s, stream, bytes, first_timeout, read_timeout: DWORD
        LOCAL   lpBuf[128]: BYTE

        mov     ebx, bytes

        invoke  NetWaitRecv, s, first_timeout
        .IF     eax
        @@:
                .IF     ebx > 128
                        mov     ecx, 128
                .ELSE
                        mov     ecx, ebx
                .ENDIF
                jecxz   @nrb_ret
                invoke  recv, s, addr lpBuf, ecx, 0
                test    eax, eax
                jle     @nrb_ret
                sub     ebx, eax
                coinvoke stream, IStream, Write, addr lpBuf, eax, 0

                .IF     read_timeout != 0
                        jmp     @nrb_ret
                .ENDIF
                jmp     @B
        .ENDIF

@nrb_ret:
        xor     eax, eax
        test    ebx, ebx
        setz    al
        ret
NetRecvUntilBytes endp

; Receives until specified char is reached, returns TRUE on SUCCESS
NetRecvUntilChar proc uses ebx s, stream, maxlen, char, timeout: DWORD
        LOCAL   lpBuf: BYTE

        sub     ebx, ebx
        invoke  NetWaitRecv, s, timeout
        .IF     eax
        @@:
                invoke  recv, s, addr lpBuf, 1, 0
                test    eax, eax
                jle     @nrc_ret

                mov     eax, char
                .IF     lpBuf == al
                        mov     bl, 1
                .ENDIF

                coinvoke stream, IStream, Write, addr lpBuf, 1, 0
                invoke  StreamGetLength, stream
                .IF     eax >= maxlen
                        jmp     @nrc_ret
                .ENDIF

                test    ebx, ebx
                jz      @B
        .ENDIF

@nrc_ret:
        mov     eax, ebx
        ret
NetRecvUntilChar endp

; Receive until CRLF
NetRecvSMTPLine proc s, stream, maxlen, timeout: DWORD
        LOCAL   buf[5]: BYTE
        LOCAL   ofs: DWORD

@smtp_recv:
        invoke  StreamClear, stream
        invoke  StreamSeekOffset, stream, 0, OFS_CUR
        mov     ofs, eax

        invoke  ZeroMemory, addr buf, 5
        invoke  NetRecvUntilChar, s, stream, maxlen, 10, timeout
        test    eax, eax
        jz      @smtp_ret

        invoke  StreamSeekOffset, stream, ofs, OFS_BEGIN
        coinvoke stream, IStream, Read, addr buf, 4, 0
        invoke  StreamGotoEnd, stream
        .IF     buf[3] == ' '
                ; Finished
                mov     eax, 1
                ret
        .ELSEIF buf[3] != '-'
                ; Not a valid status
                xor     eax, eax
                ret
        .ENDIF        
        jmp     @smtp_recv

@smtp_ret:
        ret
NetRecvSMTPLine endp

; Connects to Host/IP with needed port, returns socket or 0 on error
NetConnect proc uses ebx szHost, IP, port: DWORD
        LOCAL   sin: sockaddr_in

        xor     ebx, ebx

        invoke  socket, AF_INET, SOCK_STREAM, IPPROTO_TCP
        .IF     eax == INVALID_SOCKET 
                jmp     @nc_ret
        .ENDIF
        mov     ebx, eax
        invoke  ZeroMemory, addr sin, sizeof sockaddr_in
                
        mov     sin.sin_family, AF_INET
        mov     ecx, port
        ;xchg    cl, ch
        mov     sin.sin_port, cx

        .IF     (IP)
                mov     eax, IP
        .ELSEIF !((IP)||(szHost))
                jmp     @sock_err
        .ELSE
                invoke  NetResolve, szHost
                .IF     eax == INADDR_NONE
                        jmp     @sock_err
                .ENDIF
        .ENDIF
        mov     sin.sin_addr.S_un.S_addr, eax

        invoke  connect, ebx, addr sin, sizeof sockaddr_in
        .IF     eax == SOCKET_ERROR
@sock_err:
                invoke  closesocket, ebx
                xor     ebx, ebx
        .ENDIF

@nc_ret:
        mov     eax, ebx
        ret
NetConnect endp

; Common winsock listening thread
AbstractServerDaemonThread proc uses esi ebx lpParam: DWORD
        LOCAL   sin: sockaddr_in
        LOCAL   lpThreadId: DWORD

        invoke  ZeroMemory, addr sin, sizeof sockaddr_in
        mov     sin.sin_family, AF_INET
        mov     esi, lpParam
        mov     eax, [esi]
        mov     esi, [esi+4]
        xchg    al, ah
        mov     sin.sin_port, ax
        mov     sin.sin_addr.S_un.S_addr, INADDR_ANY
        invoke  socket, AF_INET, SOCK_STREAM, IPPROTO_TCP
        mov     ebx, eax
        invoke  GlobalFree, lpParam

        .IF     ebx == INVALID_SOCKET 
                xor     ebx, ebx
                jmp     @sdaemon_err
        .ENDIF

        invoke  bind, ebx, addr sin, sizeof sockaddr_in
        .IF     eax
                jmp     @sdaemon_err
        .ENDIF

        invoke  listen, ebx, SOMAXCONN
        .IF     eax
                jmp     @sdaemon_err
        .ENDIF

@infinite:
        mov     lpThreadId, sizeof sockaddr_in
        invoke  accept, ebx, addr sin, addr lpThreadId
        .IF     eax == INVALID_SOCKET
                jmp     @sdaemon_err
        .ENDIF

        xchg     eax, ecx 

        mov     edx, CurConnections
        .IF     edx < MaxConnections
                invoke  CreateThread, NULL, 0, esi, ecx, 0, addr lpThreadId
        .ELSE
                invoke  closesocket, ecx
        .ENDIF
        jmp     @infinite

@sdaemon_err:
        .IF     ebx
                invoke  closesocket, ebx
                mov     ebx, 0
        .ENDIF
        xor     eax, eax
        ret
AbstractServerDaemonThread endp

; Bind server
AbstractStartServer proc Port, Thread: DWORD
        LOCAL   lpBuf: DWORD
        LOCAL   lpThreadId: DWORD

        invoke  GlobalAlloc, GMEM_FIXED, 8
        mov     lpBuf, eax

        m2m     [eax], Port
        m2m     [eax+4], Thread

        invoke  CreateThread, NULL, 0, offset AbstractServerDaemonThread, lpBuf, 0, addr lpThreadId
        ret
AbstractStartServer endp
