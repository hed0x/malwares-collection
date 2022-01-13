
; ---------------------------------------------------------------------------

mz_struc                struc
mz_id                   dw      ?
mz_last512              dw      ?
mz_num512               dw      ?
mz_relnum               dw      ?
mz_headersize           dw      ?
mz_minmem               dw      ?
mz_maxmem               dw      ?
mz_ss                   dw      ?
mz_sp                   dw      ?
mz_checksum             dw      ?
mz_ip                   dw      ?
mz_cs                   dw      ?
mz_relofs               dw      ?
mz_ovrnum               dw      ?
                        db      8 dup (?)
mz_oemid                dw      ?
mz_oeminfo              dw      ?
                        db      20 dup (?)
mz_neptr                dd      ?
                        ends

; ---------------------------------------------------------------------------
