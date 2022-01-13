
engine_u_start:

pgp_hdr_num             dd      ?
pgp_linecount           dd      ?
pgp_regused             dd      ?

pgp_data_va             dd      ?
pgp_buf_size            dd      ?
pgp_buf_eip             dd      ?
pgp_buf                 db      PGP_BUF_MAX_SIZE dup (?)

engine_u_size           equ     $-engine_u_start
