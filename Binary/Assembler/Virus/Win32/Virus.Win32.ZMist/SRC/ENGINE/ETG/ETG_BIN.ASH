
; ---------------------------------------------------------------------------
; Executable Trash Generator (ETG) Engine
; version 2.00
; (x) 2000 Z0MBiE, z0mbie.cjb.net
; ---------------------------------------------------------------------------

                        locals  __

ETG_MOVRR               equ     00000000000000000000000000000001b
ETG_MOVRC               equ     00000000000000000000000000000010b
ETG_MOVSXZX             equ     00000000000000000000000000000100b
ETG_XCHG                equ     00000000000000000000000000001000b
ETG_LEA                 equ     00000000000000000000000000010000b
ETG_TTTRR               equ     00000000000000000000000000100000b
ETG_TTTRC               equ     00000000000000000000000001000000b
ETG_INCDEC              equ     00000000000000000000000010000000b
ETG_NOTNEG              equ     00000000000000000000000100000000b
ETG_TESTRR              equ     00000000000000000000001000000000b
ETG_TESTRC              equ     00000000000000000000010000000000b
ETG_IMUL                equ     00000000000000000000100000000000b
ETG_SHIFT               equ     00000000000000000001000000000000b
ETG_SHxD                equ     00000000000000000010000000000000b
ETG_BSWAP               equ     00000000000000000100000000000000b
ETG_XADD                equ     00000000000000001000000000000000b
ETG_BSx                 equ     00000000000000010000000000000000b
ETG_BTx                 equ     00000000000000100000000000000000b
ETG_JMPS                equ     00000000000001000000000000000000b
ETG_SEG                 equ     00000000000010000000000000000000b
ETG_REP                 equ     00000000000100000000000000000000b
ETG_ALL                 equ     00000000000111111111111111111111b
ETG_DEFAULT             equ     ETG_TTTRC ; used if no cmds specified

REG_EAX                 equ     00000001h
REG_ECX                 equ     00000002h
REG_EDX                 equ     00000004h
REG_EBX                 equ     00000008h
REG_ESP                 equ     00000010h
REG_EBP                 equ     00000020h
REG_ESI                 equ     00000040h
REG_EDI                 equ     00000080h
REG_ALL                 equ     (not REG_ESP) and 255
REG_DEFAULT             equ     REG_EAX   ; used if no regs specified

