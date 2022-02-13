
EV_LDRWIN32_STARTUP     equ     08F8135D1h+0
EV_LDRWIN32_ATTACHED    equ     08F8135D1h+1
EV_LDRWIN32_SEHERROR    equ     08F8135D1h+2
EV_LDRWIN32_DETACHED    equ     08F8135D1h+3

UT_UNINSTALL            equ     1
UT_UPDATE               equ     2

ldrwin32_info_struct    struc
ldrwin32_ptr            dd      ?       ; pointer to loader (.bin)
ldrwin32_size           dd      ?       ; size of loader
ldrwin32_entry          dd      ?       ; entry, relative
                        ends
