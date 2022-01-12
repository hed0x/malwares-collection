;These structures are well-known ...

CONTEXT 			STRUC
cx_ContextFlags 		DD ?

cx_Dr0				DD ?		 ;04
cx_Dr1				DD ?		 ;08
cx_Dr2				DD ?		 ;0C
cx_Dr3				DD ?		 ;10
cx_Dr6				DD ?		 ;14
cx_Dr7				DD ?		 ;18

;FPU
cx_ControlWord			DD ?
cx_StatusWord			DD ?
cx_TagWord			DD ?
cx_ErrorOffset			DD ?
cx_ErrorSelector		DD ?
cx_DataOffset			DD ?
cx_DataSelector 		DD ?
cx_RegisterArea 		DB 80 DUP (?)
cx_Cr0NpxState			DD ?

cx_SegGs			DD ?		 ;8C
cx_SegFs			DD ?		 ;90
cx_SegEs			DD ?		 ;94
cx_SegDs			DD ?		 ;98

cx_Edi				DD ?		 ;9C
cx_Esi				DD ?		 ;A0
cx_Ebx				DD ?		 ;A4
cx_Edx				DD ?		 ;A8
cx_Ecx				DD ?		 ;AC
cx_Eax				DD ?		 ;B0

cx_Ebp				DD ?		 ;B4
cx_Eip				DD ?		 ;B8
cx_SegCs			DD ?		 ;BC
cx_EFlags			DD ?		 ;C0
cx_Esp				DD ?		 ;C4
cx_SegSs			DD ?		 ;C8
CONTEXT 			ENDS

CONTEXT_i386			EQU 000010000H
CONTEXT_i486			EQU 000010000H
CONTEXT_CONTROL 		EQU CONTEXT_i386+00000001H
CONTEXT_INTEGER 		EQU CONTEXT_i386+00000002H
CONTEXT_SEGMENTS		EQU CONTEXT_i386+00000004H
CONTEXT_FLOATING_POINT		EQU CONTEXT_i386+00000008H
CONTEXT_DEBUG_REGISTERS 	EQU CONTEXT_i386+00000010H
;------------------------------------------------------------------------------

EXCEPTION_RECORD		STRUC
	ExceptionCode		DD ?
	ExceptionFlags		DD ?             ; bit 0=1..uncontinuable
	EXCEPTION_RECORD_PTR	DD ?
	ExceptionAddress	DD ?
	NumberParameters	DD ?
	EXCEPTION_MAXIMUM_PARAMETERS  EQU 15     ; pro forma
	ExceptionInformation	DD EXCEPTION_MAXIMUM_PARAMETERS DUP (?)
EXCEPTION_RECORD		ENDS
;------------------------------------------------------------------------------

STATUS_WAIT_0			EQU 000000000H
STATUS_ABANDONED_WAIT_0 	EQU 000000080H
STATUS_USER_APC 		EQU 0000000C0H
STATUS_TIMEOUT			EQU 000000102H
STATUS_PENDING			EQU 000000103H
STATUS_SEGMENT_NOTIFICATION	EQU 040000005H
STATUS_GUARD_PAGE_VIOLATION	EQU 080000001H
STATUS_DATATYPE_MISALIGNMENT	EQU 080000002H   ; exception 17
STATUS_BREAKPOINT		EQU 080000003H   ; exception 3
STATUS_SINGLE_STEP		EQU 080000004H   ; exception 1
STATUS_ACCESS_VIOLATION 	EQU 0C0000005H   ; typically exception 13
STATUS_IN_PAGE_ERROR		EQU 0C0000006H
STATUS_NO_MEMORY		EQU 0C0000017H
STATUS_ILLEGAL_INSTRUCTION	EQU 0C000001DH
STATUS_NONCONTINUABLE_EXCEPTION EQU 0C0000025H
STATUS_INVALID_DISPOSITION	EQU 0C0000026H
STATUS_ARRAY_BOUNDS_EXCEEDED	EQU 0C000008CH   ; exception 5
STATUS_FLOAT_DENORMAL_OPERAND	EQU 0C000008DH
STATUS_FLOAT_DIVIDE_BY_ZERO	EQU 0C000008EH
STATUS_FLOAT_INEXACT_RESULT	EQU 0C000008FH
STATUS_FLOAT_INVALID_OPERATION	EQU 0C0000090H
STATUS_FLOAT_OVERFLOW		EQU 0C0000091H
STATUS_FLOAT_STACK_CHECK	EQU 0C0000092H
STATUS_FLOAT_UNDERFLOW		EQU 0C0000093H
STATUS_INTEGER_DIVIDE_BY_ZERO	EQU 0C0000094H   ; exception 0
STATUS_INTEGER_OVERFLOW 	EQU 0C0000095H   ; exception 4
STATUS_PRIVILEGED_INSTRUCTION	EQU 0C0000096H   ; typically exception 13
STATUS_STACK_OVERFLOW		EQU 0C00000FDH
STATUS_CONTROL_C_EXIT		EQU 0C000013AH

;------------------------------------------------------------------------------

;useful constants

; for DR6
M_HIT0	                        EQU 1
M_HIT1	                        EQU 2
M_HIT2	                        EQU 4
M_HIT3	                        EQU 8
M_BD	                        EQU 2000H        ; DRX access
M_BS	                        EQU 4000H        ; single step
M_BT	                        EQU 8000H        ; task switch

; for DR7
M_DR0	                        EQU 01	         ; for multit. environ. I set only Li (=1)
M_DR1	                        EQU M_DR0    SHL 02
M_DR2	                        EQU M_DR1    SHL 02
M_DR3	                        EQU M_DR2    SHL 02

M_LE	                        EQU 01	     SHL 08
M_GE	                        EQU M_LE     SHL 01

;DRX access
M_GD	                        EQU M_BD

;instruction fetch
M_INSTR0                        EQU 00
M_INSTR1                        EQU 00
M_INSTR2                        EQU 00
M_INSTR3                        EQU 00

;memory write
M_WRITE0                        EQU 01 SHL 16
M_WRITE1                        EQU M_WRITE0 SHL 04
M_WRITE2                        EQU M_WRITE1 SHL 04
M_WRITE3                        EQU M_WRITE2 SHL 04

;port watches: 586+ only and CR4 bit DE (=08) must be 1
M_PORT0                         EQU 02 SHL 16
M_PORT1                         EQU M_PORT0  SHL 04
M_PORT2                         EQU M_PORT1  SHL 04
M_PORT3                         EQU M_PORT2  SHL 04

;memory access
M_RW0	                        EQU 03 SHL 16
M_RW1	                        EQU M_RW0    SHL 04
M_RW2	                        EQU M_RW1    SHL 04
M_RW3	                        EQU M_RW2    SHL 04

;lengths
M_BYTE0                         EQU 00	         ; use byte for instruction too
M_BYTE1                         EQU 00
M_BYTE2                         EQU 00
M_BYTE3                         EQU 00

M_WORD0                         EQU 01 SHL 18
M_WORD1                         EQU M_WORD0  SHL 04
M_WORD2                         EQU M_WORD1  SHL 04
M_WORD3                         EQU M_WORD2  SHL 04

M_DWORD0                        EQU 03 SHL 18
M_DWORD1                        EQU M_DWORD0 SHL 04
M_DWORD2                        EQU M_DWORD1 SHL 04
M_DWORD3                        EQU M_DWORD2 SHL 04


;------------------------------------------------------------------------------

; .. and these structrures I created according to softice command xframe
; and kernel analysis

xFrame_RECORD			STRUC ; aka exception_registration
       NextxFrame		DD ?  ; ptr or -1 for last member
       xHandler 		DD ?  ; ptr
       xTable			DD ?  ; ptr to xTableArray
       xScope			DD ?  ; 1st index of xTable_RECORD or -1 for end
xFrame_RECORD			ENDS


; xTableArray			xTable_RECORD  MAX_xTable_RECORDs  DUP (?)

xTable_RECORD			STRUC
       NextxScope		DD ?  ; index of next xTable_RECORD or -1 for end
       filter			DD ?  ; ptr on code
       handler			DD ?  ; ptr on code
xTable_RECORD			ENDS
;------------------------------------------------------------------------------
