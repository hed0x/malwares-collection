
engine_i_start:

pgp_text1a              db      'Type Bits/KeyID    Date       User ID',13,10
                        db      'pub  %/%% %/%/% ',0

                             ; 1   2   3
                             ; rnd,mul,add, size,base
pgp_text1b              dd      4,1024,1024, 4,10
                        dd      65536,1,0, 4,16
                        dd      65536,1,0, 4,16
                        dd      10,1,1990, 4,10
                        dd      12,1,1, 2,10
                        dd      28,1,1, 2,10

pgp_gopnik1             db      'Igor Daniloff <antivir@DialogNauka.ru>',0
pgp_gopnik2             db      'Igor Daniloff <Igor.Daniloff@DialogNauka.ru>',0
pgp_gopnik3             db      'Igor Daniloff <id@drweb.ru>',0
pgp_gopnik4             db      'Eugene Kaspersky <support@avp.ru>',0
pgp_gopnik5             db      'Natasha Kasperskaya <natalya@avp.ru>',0

pgp_msg1a               db      '-----BEGIN PGP PUBLIC KEY BLOCK-----',13,10,0
pgp_msg1b               db      '-----END PGP PUBLIC KEY BLOCK-----',13,10,0

pgp_msg2a               db      '-----BEGIN PGP SECRET KEY BLOCK-----',13,10,0
pgp_msg2b               db      '-----END PGP SECRET KEY BLOCK-----',13,10,0

pgp_msg3a               db      '-----BEGIN PGP MESSAGE-----',13,10,0
pgp_msg3b               db      '-----END PGP MESSAGE-----',13,10,0

pgp_msg4a               db      '-----BEGIN PGP SIGNED MESSAGE-----',13,10,0
pgp_msg4b               db      '-----END PGP SIGNED MESSAGE-----',13,10,0

pgp_msg5a               db      '-----BEGIN PGP SIGNATURE-----',13,10,0
pgp_msg5b               db      '-----END PGP SIGNATURE-----',13,10,0

pgp_ver1                db      'Version: 2.6.2i',13,10,0
pgp_ver2                db      'Version: 2.6.3',13,10,0
pgp_ver3                db      'Version: 2.6.3i',13,10,0
pgp_ver4                db      'Version: 2.6.3ia',13,10,0
pgp_ver5                db      'Version: PGPfreeware 5.0i for non-commercial use',13,10,0
pgp_ver6                db      'Version: 2.6.2i',13,10,0

pgp_cmt1                db      0
pgp_cmt2                db      'Comment: Requires PGP version 2.6 or later.',13,10,0
pgp_cmt3                db      'Charset: cp850',13,10,0

pgp_hdr_max             equ     5
pgp_hdr_maxkey          equ     2

pgp_hdr_offs            dd      pgp_msg1a, pgp_msg1b
                        dd      pgp_msg2a, pgp_msg2b
                        dd      pgp_msg3a, pgp_msg3b
                        dd      pgp_msg4a, pgp_msg4b
                        dd      pgp_msg5a, pgp_msg5b

pgp_gopnik_max          equ     5
pgp_gopnik_offs         dd      pgp_gopnik1
                        dd      pgp_gopnik2
                        dd      pgp_gopnik3
                        dd      pgp_gopnik4
                        dd      pgp_gopnik5

pgp_ver_max             equ     6
pgp_ver_offs            dd      pgp_ver1
                        dd      pgp_ver2
                        dd      pgp_ver3
                        dd      pgp_ver4
                        dd      pgp_ver5
                        dd      pgp_ver6

pgp_cmt_max             equ     3
pgp_cmt_offs            dd      pgp_cmt1
                        dd      pgp_cmt2
                        dd      pgp_cmt3

pgp_keyinit             db      'mQENAz',0
pgp_keydone             db      '==',13,10,'=',0

engine_i_size           equ     $-engine_i_start
