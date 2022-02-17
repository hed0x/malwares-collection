
; ---------------------------------------------------------------------------

pe_struc                struc

pe_id                   dd      ?       ; 00 01 02 03
pe_cputype              dw      ?       ; 04 05
pe_objectnum            dw      ?       ; 06 07
pe_datetime             dd      ?       ; 08 09 0A 0B
pe_coffptr              dd      ?       ; 0C 0D 0E 0F
pe_coffsize             dd      ?       ; 10 11 12 13
pe_ntheadersize         dw      ?       ; 14 15
pe_flags                dw      ?       ; 16 17
                        ; nt header
pe_ntheader_id          dw      ?       ; 18 19
pe_linker_major         db      ?       ; 1A
pe_linker_minor         db      ?       ; 1B
pe_codesize             dd      ?       ; 1C 1D 1E 1F
pe_idatasize            dd      ?       ; 20 21 22 23
pe_udatasize            dd      ?       ; 24 25 26 27
pe_entrypointrva        dd      ?       ; 28 29 2A 2B
pe_codebase             dd      ?       ; 2C 2D 2E 2F
pe_database             dd      ?       ; 30 31 32 33
pe_imagebase            dd      ?       ; 34 35 36 37
pe_objectalign          dd      ?       ; 38 39 3A 3B
pe_filealign            dd      ?       ; 3C 3D 3E 3F
pe_os_major             dw      ?       ; 40 41
pe_os_minor             dw      ?       ; 42 43
pe_user_major           dw      ?       ; 44 45
pe_user_minor           dw      ?       ; 46 47
pe_subsys_major         dw      ?       ; 48 49
pe_subsys_minor         dw      ?       ; 4A 4B
pe_reserved             dd      ?       ; 4C 4D 4E 4F
pe_imagesize            dd      ?       ; 50 51 52 53
pe_headersize           dd      ?       ; 54 55 56 56
pe_checksum             dd      ?       ; 58 59 5A 5B
pe_subsystem            dw      ?       ; 5C 5D
pe_dllflags             dw      ?       ; 5E 5F
pe_stackreserve         dd      ?       ; 60 61 62 63
pe_stackcommit          dd      ?       ; 64 65 66 67
pe_heapreserve          dd      ?       ; 67 60 6A 6B
pe_heapcommit           dd      ?       ; 6C 6D 6E 6F
pe_loaderflags          dd      ?       ; 70 71 72 73
pe_numofrvasizes        dd      ?       ; 74 75 76 77
                        ; rva and sizes
pe_exportrva            dd      ?       ; 78 79 7A 7B
pe_exportsize           dd      ?       ; 7C 7D 7E 7F
pe_importrva            dd      ?       ; 80 81 82 83
pe_importsize           dd      ?       ; 84 85 86 87
pe_resourcerva          dd      ?       ; 88 89 8A 8B
pe_resourcesize         dd      ?       ; 8C 8D 8E 8F
pe_exceptionrva         dd      ?       ; 90 91 92 93
pe_exceptionsize        dd      ?       ; 94 95 96 97
pe_securityrva          dd      ?       ; 98 99 9A 9B
pe_securitysize         dd      ?       ; 9C 9D 9E 9F
pe_fixuprva             dd      ?       ; A0 A1 A2 A3
pe_fixupsize            dd      ?       ; A4 A5 A6 A7
pe_debugrva             dd      ?       ; A8 A9 AA AB
pe_debugsize            dd      ?       ; AC AD AE AF
pe_descriptionrva       dd      ?       ; B0 B1 B2 B3
pe_descriptionsize      dd      ?       ; B4 B5 B6 B7
pe_machinerva           dd      ?       ; B8 B9 BA BB
pe_machinesize          dd      ?       ; BC BD BE BF
pe_tlsrva               dd      ?       ; C0 C1 C2 C3
pe_tlssize              dd      ?       ; C4 C5 C6 C7
pe_loadconfigrva        dd      ?       ; C8 C9 CA CB
pe_loadconfigsize       dd      ?       ; CC CD CE CF
                        dd      ?,?     ; D0 D1 D2 D3 D4 D5 D6 D7
pe_iatrva               dd      ?       ; D8 D9 DA DB
pe_iatsize              dd      ?       ; DC DD DE DF
                        dd      ?,?     ; E0 E1 E2 E3 E4 E5 E6 E7
                        dd      ?,?     ; E8 E9 EA EB EC ED EE EF
                        dd      ?,?     ; F0 F1 F2 F3 F4 F5 F6 F7

                        ; total size = 0xF8

                        ends

; ---------------------------------------------------------------------------

oe_struc                struc

oe_name                 db      8 dup (?)
oe_virt_size            dd      ?       ; 08 09 0A 0B
oe_virt_rva             dd      ?       ; 0C 0D 0E 0F
oe_phys_size            dd      ?       ; 10 11 12 13
oe_phys_offs            dd      ?       ; 14 15 16 17
                        dd      ?,?,?   ; 18 19 1A 1B 1C 1D 1E 1F 20 21 22 23
oe_flags                dd      ?       ; 24 25 26 27

                        ; total size = 0x28

                        ends

; ---------------------------------------------------------------------------
