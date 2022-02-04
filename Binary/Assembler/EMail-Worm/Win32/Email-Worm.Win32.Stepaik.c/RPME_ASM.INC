
; ---------------------------------------------------------------------------
; RPME 1.20
; ---------------------------------------------------------------------------

; exit codes (EAX)
RPME_ERR_SUCCESS        equ     0       ; success, code permutated
RPME_ERR_DISASM         equ     1       ; cant disassemble instruction
RPME_ERR_SMALLBUF       equ     2       ; not enough space in output buffer
RPME_ERR_NOMEMORY       equ     3       ; not enough memory
RPME_ERR_NOTPROGRAMMED  equ     4       ; some situation not programmed yet
RPME_ERR_BADJMP         equ     5       ; bad relative jmp/call within ibuf

; entry flags
CM_STOP                 equ     1       ; JMP/RET-alike instruction
CM_HAVEREL              equ     2       ; have relative argument (CALL,etc)
CM_EXTREL               equ     4       ; rel. arg points to external label
CM_ASSEMBLED            equ     8       ; alredy assembled
CM_XREF                 equ     16      ; label, i.e. have XREF
CM_USER1                equ     32      ; used by mutate()

MAXCMDLEN               equ     16      ; max length of command

; list entry structure
rpme_hooy               struc
rh_opcode               db      MAXCMDLEN dup (?) ; opcode
rh_ofs                  dd      ? ; pointer to current location (temporary)
rh_len                  dd      ? ; length of command
rh_flags                dd      ? ; CM_xxx
rh_rel                  dd      ? ; CM_HAVEREL: 0=NULL 1= CM_EXTREL: 0=hooy* 1=BYTE*
rh_nxt                  dd      ? ; CM_STOP: 1=NULL 0=hooy* (opcode 'thread')
rh_next                 dd      ? ; next entry or NULL
                        ends
