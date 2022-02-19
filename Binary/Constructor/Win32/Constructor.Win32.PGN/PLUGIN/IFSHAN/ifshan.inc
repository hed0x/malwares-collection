
EV_IFSHAN_GOT_FILENAME  equ     0EF9F699Fh+0    ; param=filename

ifs_onstack_struc       struc
                        dd      ? ; return address
                        dd      ? ; the address of the FSD function that is to be called for this API
_function               dd      ? ; the function that is being performed
_drive                  dd      ? ; the 1-based drive the operation is being performed on (-1 if UNC)
                        dd      ? ; the kind of resource the operation is being performed on
_codepage               dd      ? ; the codepage that the user string was passed in on
_ioreq_ptr              dd      ? ; pointer to IOREQ structure
                        ends

ioreq_struc             struc
ir_length               dd      ?            ; length of user buffer (eCX)
ir_flags                db      ?            ; misc. status flags (AL)
ir_user                 db      ?            ; user ID for this request
ir_sfn                  dw      ?            ; System File Number of file handle
ir_pid                  dd      ?            ; process ID of requesting task
ir_ppath                dd      ?            ; unicode pathname
ir_aux1                 dd      ?            ; secondary user data buffer (CurDTA)
ir_data                 dd      ?            ; ptr to user data buffer (DS:eDX)
ir_options              dw      ?            ; request handling options
ir_error                dw      ?            ; error code (0 if OK)
ir_rh                   dd      ?            ; resource handle
ir_fh                   dd      ?            ; file (or find) handle
ir_pos                  dd      ?            ; file position for request
ir_aux2                 dd      ?            ; misc. extra API parameters
ir_aux3                 dd      ?            ; misc. extra API parameters
ir_pev                  dd      ?            ; ptr to IFSMgr event for async requests
ir_fsd                  db      16 dup (?)   ; Provider work space
                        ends
