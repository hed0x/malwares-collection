;@GOTO TRANSLATE

; COMMENT $
; 
; Inspiration: CodeSafe by Zhang De Hua
;        (http://www.geocities.com/SiliconValley/Park/9031)
; 
; CodeSafe is one-year-old(!) very nice PE protector/compressor.
; Under other protectors you can use hardware breakpoints without problems
; (where you can't bpx, there you can bpm x or bphx, of course bpm, etc..).
; CodeSafe uses "context trick"(I call it so) before it accesses module/procedure.
; It calls CreateThread, WaitForSingleObject, TerminateThread, GetExitCodeThread
; and other protector/debugger-typical functions. First 5 bytes of every called
; function are checked for INT3 presence - it's now standard too.
; But most interesting is receiving of function address. Standard is calling
; GetProcAddress, but CodeSafe calculates adress by other way. If procedure is
; in kernel32.dll, it takes kernel32 image as beeing located at 77F00000H(NT) or
; 0BFF70000H(95), then it calculates PE header and section positions and from
; them procedure addresses.
; CodeSafe distinguishes NT and 95 according to their reaction on setting GD in
; DR7.
; 
; I present here extensions to (and variations on theme) context trick and
; something more.
; The tricks not only destroy hardware breakpoints set by debugger but you can
; set own. Tricks are used for indirect execution flow (untraceability) too.
; 
; All I tested under W95 and NT4 only.
; 
; Gurus don't laugh: I don't have any undocumentation.
; 
; ------------------------------------------------------------------------------
; 
; Miscelaneous:
;  1) NTice detection
;  - can be used under NT only
;    a) execute INT 1 instruction (95 incompatible)
;    b) it raises exception, catch it by xHandler
;    c) check ExceptionCode: normally it should be STATUS_ACCESS_VIOLATION
;       and cx_Eip should point to INT 1 instruction
;       but when NTice is present code will be STATUS_SINGLE_STEP
;       and cx_Eip will point to instruction following INT 1
;  - it's de facto the same trick as my WinICE detection 1 (IntGate 1 has DPL=3)
; 
;  2) Say bye to antisoftice tricks  (BoundsChecker and CreateFile)
;  - by patching *ice files
;    a) WinICE:
;       - find string "KHCB" in winice.exe and replace it by something new
;       - find string "SICE" in winice.exe and nmtrans.dll
;   and replace it by something new
;    b) NTice:
;       - find string "KHCB" in ntice.sys and replace it by something new
;       - find UNICODE string "DosDevices\NTice" in ntice.sys (it will look
;   like "D o s D e v i ..") and change "NTice" to something new,
;   find string "NTICE" in nmtrans.dll and replace it by something new
;       - update ntice.sys's checksum
;  - of course update BoundsChecker itself
; 
; ------------------------------------------------------------------------------
;  $


.586P
.MODEL FLAT, STDCALL

 EXTRN MessageBeep:PROC
 EXTRN ExitProcess:PROC

 INCLUDE ETricks.INC

.CODE
 START:

 ; when you need to distinguish platform
 ; CALL  GetVersion        ; or  MOV EAX,DS
 ; TEST  EAX,EAX           ;     TEST AL,4   ; No LDT under NT
 ; JS    Win9XPresent      ;     SETNE Win9XPresent



 ; prepare xFrame structure in stack:

 PUSH MyxScope             ; not needed usually -1, here for illustration
 PUSH OFFSET MyxTable      ; not needed           , here for illustration
 SUB  EAX, EAX             ; offset 0
 PUSH OFFSET MyxHandler    ; it's me
 PUSH DWORD PTR FS:[EAX]   ; ptr on first xFrame structure, FS:0 very popular
                           ; execute command xframe in softice ..@
 MOV  FS:[EAX], ESP    ; i'm in chain now

@0:
 MOV  EAX, [EAX]       ; violate!
 ; or you can use
 ; MOV  EAX,-1         ; or another nonsens
 ; MOV  GS,EAX         ; or other Sreg

 ; these are (the only) "95&NT common" ACCESS_VIOLATIONs
 ; because under:
 ; 1) Win95 are some CPL0 instructions and CLI/STI emulated/ignored and
 ;    some (L?DT,LTR,cache manipulation) cause ACCESS_VIOLATION
 ; 2) WinNT cause all CPL0 AND CLI/STI instructions PRIVILEGED_INSTRUCTION
 
 JMP  @0


@2:
 PUSHFD
 MOV  EAX, JMPTable
@BPT1:
 PUSHFD
 POP  EAX
 OR   AH,  1
 PUSH EAX
 POPFD
 ;running line here

 POPFD
 JMP  @2


@6:
                           ; ..@ and execute command xframe here       
 POP  DWORD PTR FS:0       ; restore old ptr
 ADD  ESP,4*3          ; pro forma restore init stack

 CALL MessageBeep,-1       ; you should hear something if all was successful
 CALL ExitProcess, 0       ; bye Kafka


@3:
 SUB  EAX,EAX
 DIV  EAX
 JMP  @3


@5:
 BOUND EAX,Bound4
 JMP   @5


@1:
 NOP
@BPT0:
 NOP
 INT  3            ; ICEBP (0F1H) I can't recommend - it's undocummented
 JMP  @1           ; and handled differently by different CPUs


@4:
 INC  EAX
 ROR  EAX,1
 INTO
 JMP  @4
;------------------------------------------------------------------------------

MyxHandler PROC C          ; aka "try-except exception handler" 
                           ; handler of handlers

 USES EBX, ESI, EDI    ; these registers should be preserved

 ARG  EXCEPTION_REC_ptr    ; ok
 ARG  xFrame           ; aka exception_registration
 ARG  CONTEXT_ptr      ; ok
 ARG  DispatcherContext    ; ??

 CLD
 MOV  ESI, JMPPtr
 MOV  EBX, EXCEPTION_REC_ptr
 IMUL ESI, SIZE HelpStruc
 INC       JMPPtr
 ADD  ESI, OFFSET JMPTable
 MOV  EDI, CONTEXT_ptr
 LODSD
 CMP  EAX, [EBX].ExceptionCode ; code (type) of exception
 JNE  GoUnhandled
 LODSD
 MOV  [EDI].cx_ContextFlags, CONTEXT_CONTROL OR CONTEXT_INTEGER \
                 OR CONTEXT_SEGMENTS OR CONTEXT_DEBUG_REGISTERS
               ; (everything but FPU, 10017H) - what will be updated
 MOV  [EDI].cx_Eip, EAX
 ADD  EDI,  cx_Dr0
 MOV  ECX,  6
 REP  MOVSD
 ; CRC check here to eliminate bpx

 SUB  EAX,  EAX        ; return code is important; 0, 1, 2
 JMP  Okay                 ; 0 - ok, I handled this exception

                           ; _VWIN32_Set_Thread_Context or 
                           ; NTCALL 13H will be called
                           ; I think hooking of those services could be good 
                           ; idea for an intelligent debugger 

                           ; 1 - no I can't handle it; control is passed to the
                           ; xHandler of next xFrame in chain 
                           ; 2 - similar to 1 
GoUnhandled:
 SUB  EAX,  EAX
 INC  EAX          ; >2 INVALID_DISPOSITION?

Okay:
 RET
MyxHandler ENDP

; for illustration
filter0:
filter1:
filter2:
filter3:
filter4:
 SUB  EAX, EAX
 DEC  EAX
handler0:
handler1:
handler2:
handler3:
handler4:
 RET
 


;------------------------------------------------------------------------------


.DATA

HelpStruc      STRUC
 ExcCode       DD  ?
 @Label        DD  ?
 _DR0          DD  ?
 _DR1          DD  ?
 _DR2          DD  ?
 _DR3          DD  ?
 _DR6          DD  ?
 _DR7          DD  ?
HelpStruc      ENDS

JMPPtr         DD 0

JMPTable       LABEL DWORD
 HelpStruc     <STATUS_ACCESS_VIOLATION,@1,\
        @BPT0,0,0,0,0,M_LE+M_DR0+M_INSTR0>

 HelpStruc     <STATUS_SINGLE_STEP, @BPT0, 0,0,0,0    ,0,0>

 HelpStruc     <STATUS_BREAKPOINT,  @2,\
        JMPTable,START,@BPT1,MyxHandler,0,M_LE+M_DR0+M_DR1+M_DR2+M_DR3\
        +M_RW0+M_RW1+M_RW2+M_RW3>  ; >>ANTI-VOYEUR<<

 HelpStruc     <STATUS_SINGLE_STEP, @BPT1, 0,0,0,0    ,0,0>

 HelpStruc     <STATUS_SINGLE_STEP, @3   , 0,0,0,0    ,0,0>

 ;additional
 HelpStruc     <STATUS_INTEGER_DIVIDE_BY_ZERO, @4 ,0,0,0,0,0,0>
 HelpStruc     <STATUS_INTEGER_OVERFLOW,       @5 ,0,0,0,0,0,0>
 HelpStruc     <STATUS_ARRAY_BOUNDS_EXCEEDED,  @6 ,0,0,0,0,0,0>

 Bound4        DQ  0

 ; for illustration
 MyxScope      EQU 2                    ; index 2
 MyxTable      LABEL    xTable_RECORD   ; array of 5 xTable_RECORDs
 xTable_RECORD <-1, filter0, handler0>  ; 0
 xTable_RECORD < 3, filter1, handler1>  ; 1
 xTable_RECORD < 4, filter2, handler2>  ; 2 MyxScope points to this
 xTable_RECORD < 0, filter3, handler3>  ; 3
 xTable_RECORD < 1, filter4, handler4>  ; 4
 ; xFrame.xScope=2 -> 4 -> 1 -> 3 -> 0

END START

------------------------------------------------------------------------------









                    It was
                  fILTER/W #1
                      by
                                 elicz@email.cz








------------------------------------------------------------------------------

:TRANSLATE
@ECHO OFF
TASM  /M /Q /T  ETricks.BAT
REM WLINK FORMAT Windows NT FILE ETricks  @ETricks.IMP
REM LINK386     ETricks,,,,ETricks
TLINK32         ETricks,,,,ETricks
DEL             ETricks.OBJ
