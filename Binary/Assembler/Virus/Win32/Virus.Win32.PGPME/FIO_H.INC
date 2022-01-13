
; ---------------------------------------------------------------------------

fa_readonly             equ     000000001h
fa_hidden               equ     000000002h
fa_system               equ     000000004h
fa_directory            equ     000000010h
fa_archive              equ     000000020h
fa_normal               equ     000000080h
fa_temporary            equ     000000100h
fa_atomic_write         equ     000000200h
fa_xaction_write        equ     000000400h

; ---------------------------------------------------------------------------

OPEN_EXISTING           equ     3
CREATE_ALWAYS           equ     2

GENERIC_READ            equ     080000000h
GENERIC_WRITE           equ     040000000h

FILE_SHARE_READ         equ     000000001h
FILE_SHARE_WRITE        equ     000000002h

FILE_ATTRIBUTE_NORMAL   equ     000000080h

FILE_BEGIN              equ     0

; ---------------------------------------------------------------------------
