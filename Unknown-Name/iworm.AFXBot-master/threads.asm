SendMsg proto :dword, :dword, :dword
AddThread proto :dword, :dword, :dword, :dword
ThreadProc proto :dword, :dword, :dword, :dword, :dword
KillThread proto :dword, :dword, :dword
ListThreads proto :dword, :dword
RemoveThread proto :dword

THREAD struct
  btaken                  byte ?
  dwhandle                dword ?
  dwselfhandle            dword ?
  dwsocket                dword ?
  szname                  byte 64 dup (?)
THREAD ends

.data?
aThread                   THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>
                          THREAD <>

.code
ThreadProc proc uses edx ecx esi edi dwSocket:dword, szUser:dword, szReply:dword, szCmd:dword, szArguments:dword
local szThreadBuffer[1024]:byte
;kill a thread
invoke lstrcmpi, szCmd, addr szKILLTHREAD
.if eax == 0
  invoke GetToken, addr szThreadBuffer, szArguments, 32, 2, FALSE
  invoke atodw, addr szThreadBuffer
  invoke KillThread, dwSocket, eax, szReply
  mov eax, TRUE
  jmp @F
.endif

;list running threads
invoke lstrcmpi, szCmd, addr szTHREADS
.if eax == 0
  invoke ListThreads, dwSocket, szReply
  mov eax, TRUE
  jmp @F
.endif
mov eax, FALSE
@@:
ret
ThreadProc endp

AddThread proc uses ecx esi edi dwThread:dword, szName:dword, dwSocket:dword, dwSelfHandle:dword
mov esi, offset aThread
assume esi:ptr THREAD
xor ecx, ecx
.while ecx < 31
  push ecx
  .if [esi].btaken != 1
     mov [esi].btaken, 1
     mov ecx, dwThread
     mov [esi].dwhandle, ecx 
     mov ecx, dwSocket
     mov [esi].dwsocket, ecx 
     mov ecx, dwSelfHandle
     mov [esi].dwselfhandle, ecx 
     invoke CopyMemory, addr [esi].szname, szName, 64
     pop ecx
     jmp @F
  .endif
  add esi, sizeof THREAD
  pop ecx
  inc ecx
.endw  
@@:
assume esi:NOTHING
ret
AddThread endp

ListThreads proc uses ecx esi edi dwSocket:dword, szReply:dword
local szListNumber[8]:byte
local szListBuffer[128]:byte
invoke SendMsg, dwSocket, szReply, addr szThreads
mov esi, offset aThread
assume esi:ptr THREAD
xor ecx, ecx
.while ecx < 31
  push ecx
  .if [esi].btaken == 1
    push esi
    invoke dwtoa, ecx, addr szListNumber
    invoke wsprintf, addr szListBuffer, addr szThread, addr szListNumber, addr [esi].szname
    invoke SendMsg, dwSocket, szReply, addr szListBuffer
    pop esi
  .endif  
  add esi, sizeof THREAD
  pop ecx
  inc ecx
.endw
assume esi:NOTHING
ret
ListThreads endp

KillThread proc uses ecx edx esi edi dwSocket:dword, dwThread:dword, szReply:dword
mov esi, offset aThread
assume esi:ptr THREAD
xor ecx, ecx
.while ecx < 31
  push ecx
  .if ecx == dwThread
    .if [esi].btaken == 1
      mov [esi].btaken, 0
      push esi
      push esi
      invoke RtlZeroMemory, addr [esi].szname, 64
      pop esi
      invoke closesocket, [esi].dwsocket
      pop esi
      invoke TerminateThread, [esi].dwhandle, 0
      pop ecx
      jmp @F
    .endif
  .endif    
  assume esi:NOTHING
  add esi, sizeof THREAD
  pop ecx
  inc ecx
.endw
@@:
assume esi:NOTHING
invoke SendMsg, dwSocket, szReply, addr szThreadsKilled
ret
KillThread endp

RemoveThread proc uses ecx edx esi edi dwThread:dword
mov esi, offset aThread
assume esi:ptr THREAD
xor ecx, ecx
.while ecx < 31
  push ecx
  .if [esi].btaken == 1
    mov eax, dwThread
    .if eax == [esi].dwselfhandle
      mov [esi].btaken, 0
      push esi
      invoke RtlZeroMemory, addr [esi].szname, 64
      pop esi
      invoke closesocket, [esi].dwsocket
      pop ecx
      jmp @F
    .endif
  .endif    
  assume esi:NOTHING
  add esi, sizeof THREAD
  pop ecx
  inc ecx
.endw
@@:
assume esi:NOTHING
ret
RemoveThread endp
