HttpdProc proto :dword, :dword, :dword, :dword, :dword
ServeFile proto :dword
Httpd proto :dword


HTTP_SERVE_FILE struct
  dwsocket                dword ?
  bsync                   byte ?
  szfile                  byte 261 dup (?)
HTTP_SERVE_FILE ends

HTTP_SERVER struct
  dwsocket                dword ?
  dwport                  dword ?
  bsync                   byte ?
  szfile                  byte 261 dup (?)
HTTP_SERVER ends

Httpd proto :dword
ServeFile proto :dword

.data
szHeader                  byte 'HTTP/1.1 200 OK', 13, 10, 'Accept-Ranges: bytes', 13, 10,
                               'Content-Length: %d', 13, 10,
                               'Keep-Alive: timeout=15, max=100', 13, 10,
                               'Connection: Keep-Alive', 13, 10,
                               'Content-Type: application/octet-stream', 13, 10, 13, 10, 0
.data?
szHttpdFile               byte 261 dup (?)
szHttpdPort               byte 8 dup (?)

.code
HttpdProc proc uses edx ecx esi edi dwSocket:dword, szUser:dword, szReply:dword, szCmd:dword, szArguments:dword
local http:HTTP_SERVER
invoke lstrcmpi, szCmd, addr szHTTPD
.if eax == 0
  invoke GetToken, addr szDataBuffer, szArguments, 32, 2, FALSE
  invoke lstrcpy, addr szHttpdFile, addr szDataBuffer
  invoke GetToken, addr szDataBuffer, szArguments, 32, 3, FALSE
  invoke lstrcpy, addr szHttpdPort, addr szDataBuffer
  invoke atodw, addr szHttpdPort
  mov http.dwport, eax
  mov http.bsync, 0
  invoke CopyMemory, addr http.szfile, addr szHttpdFile, 261
  invoke CreateThread, 0, 0, addr Httpd, addr http, 0, 0
  push eax
  .while http.bsync != 1
    invoke Sleep, 10
  .endw
  invoke wsprintf, addr szSendBuffer, addr szHttpdThread, addr szHttpdFile, addr szHttpdPort
  pop eax
  invoke AddThread, eax, addr szSendBuffer, http.dwsocket, 0
  invoke wsprintf, addr szSendBuffer, addr szHttpd, addr szHttpdFile, addr szHttpdPort
  invoke SendMsg, dwSocket, szReply, addr szSendBuffer
  mov eax, TRUE
  jmp @F
.endif
mov eax, FALSE
@@:
ret
HttpdProc endp

ServeFile proc lpParam:dword
local hFile:dword
local pBuffer[4096]:byte
local dwBytesRead:dword
local serve:HTTP_SERVE_FILE
invoke CopyMemory, addr serve, lpParam, sizeof serve
mov eax, lpParam
assume eax:ptr HTTP_SERVE_FILE
mov [eax].bsync, 1
assume eax:nothing

invoke CreateFile, addr serve.szfile, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0
mov hFile, eax
invoke GetFileSize, hFile, 0
invoke wsprintf, addr pBuffer, addr szHeader, eax
invoke lstrlen, addr pBuffer
invoke send, serve.dwsocket, addr pBuffer, eax, 0
.repeat
  invoke RtlZeroMemory, addr pBuffer, sizeof pBuffer
  invoke ReadFile, hFile, addr pBuffer, sizeof pBuffer, addr dwBytesRead, 0
@@:
  invoke send, serve.dwsocket, addr pBuffer, dwBytesRead, 0
  .if eax == SOCKET_ERROR
    invoke GetLastError
    .if eax == WSAEWOULDBLOCK
      invoke Sleep, 1
      jmp @B
    .endif
  .endif
  invoke Sleep, 1
.until dwBytesRead == 0
invoke CloseHandle, hFile
invoke closesocket, serve.dwsocket
invoke ExitThread, 0
ret
ServeFile endp

Httpd proc lpParam:dword
local http:HTTP_SERVER
local serve:HTTP_SERVE_FILE
local SockAddrIn:sockaddr_in
local ClientSockAddrIn:sockaddr_in
local ServerSocket:dword
local dwMode:dword
invoke CopyMemory, addr http, lpParam, sizeof http
invoke CopyMemory, addr serve.szfile, addr http.szfile, 261
invoke socket, PF_INET, SOCK_STREAM, 0
mov ServerSocket, eax
mov eax, lpParam
assume eax:ptr HTTP_SERVER
mov ecx, ServerSocket
mov [eax].dwsocket, ecx
mov [eax].bsync, 1
assume eax:nothing
mov SockAddrIn.sin_family, AF_INET
mov eax, http.dwport
invoke htons, eax
mov SockAddrIn.sin_port, ax
xor eax, eax
mov SockAddrIn.sin_addr, eax
invoke bind, ServerSocket, addr SockAddrIn, sizeof SockAddrIn
mov dwMode, 1
invoke ioctlsocket, ServerSocket, FIONBIO, addr dwMode
invoke listen, ServerSocket, SOMAXCONN
@@:
invoke accept, ServerSocket, addr ClientSockAddrIn, 0
.if eax == INVALID_SOCKET
  invoke Sleep, 100
  jmp @B
.endif
mov serve.dwsocket, eax
invoke CreateThread, 0, 0, addr ServeFile, addr serve, 0, 0
push eax
.while serve.bsync != 1
  invoke Sleep, 10
.endw
pop eax
invoke CloseHandle, eax
invoke Sleep, 1000
jmp @B
ret
Httpd endp