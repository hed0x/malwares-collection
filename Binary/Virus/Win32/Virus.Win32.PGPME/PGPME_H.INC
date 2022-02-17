
FS_CONST1               equ     10h             ; where to store (-ESP)
FS_CONST2               equ     20h             ; where to store FS:[0000h]

PGP_BUF_MAX_SIZE        equ     32768
PGP_ICHAR               equ     'AA'

reg_eax                 equ     0
reg_ecx                 equ     1
reg_edx                 equ     2
reg_ebx                 equ     3
reg_esp                 equ     4
reg_ebp                 equ     5
reg_esi                 equ     6
reg_edi                 equ     7
                               ;76543210
bit_eax                 equ     00000001b
bit_ecx                 equ     00000010b
bit_edx                 equ     00000100b
bit_ebx                 equ     00001000b
bit_esp                 equ     00010000b
bit_ebp                 equ     00100000b
bit_esi                 equ     01000000b
bit_edi                 equ     10000000b
bit_stack               equ    100000000b

bit_all                 equ     -1

_free                   macro   x
                        and     pgp_regused[ebp], not (x)
                        endm

_use                    macro   x
                        or      pgp_regused[ebp], x
                        endm
