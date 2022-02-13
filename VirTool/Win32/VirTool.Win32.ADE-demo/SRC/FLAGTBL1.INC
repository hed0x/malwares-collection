; GENERATED FILE. DO NOT EDIT
;  1.                          C_ERROR    178  00
;  2.                          C_MODRM     95  11
;  3.                                0     65  011
;  4.                            C_BAD     46  101
;  5.                   C_DATA66+C_REL     17  01010
;  6.                          C_DATA1     15  10001
;  7.                         C_DATA66     15  10000
;  8.                    C_DATA1+C_REL     14  10010
;  9.                    C_DATA1+C_BAD     10  010001
; 10.                  C_MODRM+C_DATA1      9  010011
; 11.                    C_MODRM+C_BAD      9  010010
; 12.              C_DATA1+C_REL+C_BAD      6  100111
; 13.                      C_SEG+C_BAD      5  0100001
; 14.                         C_ADDR67      4  1001100
; 15.                   C_DATA66+C_BAD      3  01000000
; 16.                 C_MODRM+C_DATA66      3  1001101
; 17.           C_DATA66+C_DATA2+C_BAD      2  01011111
; 18.                            C_REP      2  01011110
; 19.                     C_STOP+C_BAD      2  01011101
; 20.                            C_SEG      1  010111001
; 21.                   C_DATA2+C_STOP      1  010111000
; 22.                           C_STOP      1  010110111
; 23.                  C_DATA2+C_DATA1      1  010110110
; 24.             C_DATA2+C_STOP+C_BAD      1  010110101
; 25.                             C_66      1  010110100
; 26.                             C_67      1  010110011
; 27.            C_DATA66+C_REL+C_STOP      1  010110010
; 28.             C_DATA1+C_REL+C_STOP      1  010110001
; 29.                     C_LOCK+C_BAD      1  010110000
; 30.            C_MODRM+C_DATA1+C_BAD      1  010000011
; 31.                        C_OPCODE2      1  010000010
                pusha
                mov     edi, [esp+32+4]  ; ptr to 2K flag table to build
                cld
                xor     eax, eax
                push    eax
                push    eax
                push    eax
                push    0000DA3B6h
                push    0D8003FFFh
                push    0C83FFFF3h
                push    0CBDB0797h
                push    0B6FFFFFFh
                push    0FF5294A5h
                push    0294A5294h
                push    0A5294A00h
                push    eax
                push    eax
                push    eax
                push    eax
                push    eax
                push    eax
                push    eax
                push    0DB6307FFh
                push    0ED6EDF6Bh
                push    0D3D50D5Bh
                push    06C6BE934h
                push    0A8A28A24h
                push    0A79E7FFFh
                push    0ED8A2FFBh
                push    0AB6DD56Bh
                push    036ACE492h
                push    05DA1D659h
                push    004210208h
                push    04218A28Ch
                push    06318C6EBh
                push    0B60C76D8h
                push    0C993266Dh
                push    0B77D6B6Dh
                push    0B76DA5A5h
                push    0FFFF960Ah
                push    0CE494A53h
                push    0CF294A52h
                push    094A53CF3h
                push    06DB946C8h
                push    07345A853h
                push    0A492B76Dh
                push    076DB6DB6h
                push    0DB6D76DBh
                push    06D76DAC2h
                push    00C7FEC20h
                push    0C7FEC20Ch
                push    07FEC20C7h
                push    0FED028BFh
                push    04AD028B4h
                push    0B4905431h
                push    0FFB431FFh
                xor     ecx, ecx
                mov     ch, 2  ; ecx=512
                xor     ebx, ebx
                call    @@pop_ebp
; getbit()
                or      ebx, ebx
                jnz     @@skip
                pop     ebx
                pop     esi
                pop     edx
                push    esi
                push    ebx
                push    32
                pop     ebx
@@skip:
                dec     ebx
                shr     edx, 1
                retn
@@pop_ebp:
                pop     ebp
@@cycle:
                xor     eax, eax
                call    @@tree
                stosd
                loop    @@cycle
                popa
                retn
@@tree:
                call    ebp
                jnc     @@tree0
@@tree1:
                call    ebp
                jnc     @@tree10
@@tree11:
                mov     ah, (C_MODRM) shr 8
                retn
@@tree10:
                call    ebp
                jc      @@tree101
@@tree100:
                call    ebp
                jnc     @@tree1000
@@tree1001:
                call    ebp
                jnc     @@tree10010
@@tree10011:
                call    ebp
                jc      @@tree100111
@@tree100110:
                call    ebp
                jnc     @@tree1001100
@@tree1001101:
                mov     ah, (C_MODRM+C_DATA66) shr 8
                retn
@@tree1001100:
                mov     ah, (C_ADDR67) shr 8
                retn
@@tree100111:
                mov     eax, C_DATA1+C_REL+C_BAD
                retn
@@tree10010:
                mov     eax, C_DATA1+C_REL
                retn
@@tree1000:
                call    ebp
                jnc     @@tree10000
@@tree10001:
                mov     ah, (C_DATA1) shr 8
                retn
@@tree10000:
                mov     ah, (C_DATA66) shr 8
                retn
@@tree101:
                mov     ah, (C_BAD) shr 8
                retn
@@tree0:
                call    ebp
                jnc     @@tree00
@@tree01:
                call    ebp
                jnc     @@tree010
@@tree011:
                retn
@@tree010:
                call    ebp
                jnc     @@tree0100
@@tree0101:
                call    ebp
                jnc     @@tree01010
@@tree01011:
                call    ebp
                jnc     @@tree010110
@@tree010111:
                call    ebp
                jc      @@tree0101111
@@tree0101110:
                call    ebp
                jnc     @@tree01011100
@@tree01011101:
                mov     eax, C_STOP+C_BAD
                retn
@@tree01011100:
                call    ebp
                jnc     @@tree010111000
@@tree010111001:
                mov     al, C_SEG
                retn
@@tree010111000:
                mov     eax, C_DATA2+C_STOP
                retn
@@tree0101111:
                call    ebp
                jc      @@tree01011111
@@tree01011110:
                mov     al, C_REP
                retn
@@tree01011111:
                mov     ah, (C_DATA66+C_DATA2+C_BAD) shr 8
                retn
@@tree010110:
                call    ebp
                jnc     @@tree0101100
@@tree0101101:
                call    ebp
                jc      @@tree01011011
@@tree01011010:
                call    ebp
                jnc     @@tree010110100
@@tree010110101:
                mov     eax, C_DATA2+C_STOP+C_BAD
                retn
@@tree010110100:
                mov     al, C_66
                retn
@@tree01011011:
                call    ebp
                jc      @@tree010110111
@@tree010110110:
                mov     ah, (C_DATA2+C_DATA1) shr 8
                retn
@@tree010110111:
                btc     eax, C_STOP_LG2
                retn
@@tree0101100:
                call    ebp
                jc      @@tree01011001
@@tree01011000:
                call    ebp
                jc      @@tree010110001
@@tree010110000:
                mov     ax, C_LOCK+C_BAD
                retn
@@tree010110001:
                mov     eax, C_DATA1+C_REL+C_STOP
                retn
@@tree01011001:
                call    ebp
                jnc     @@tree010110010
@@tree010110011:
                mov     al, C_67
                retn
@@tree010110010:
                mov     eax, C_DATA66+C_REL+C_STOP
                retn
@@tree01010:
                mov     eax, C_DATA66+C_REL
                retn
@@tree0100:
                call    ebp
                jnc     @@tree01000
@@tree01001:
                call    ebp
                jnc     @@tree010010
@@tree010011:
                mov     ah, (C_MODRM+C_DATA1) shr 8
                retn
@@tree010010:
                mov     ah, (C_MODRM+C_BAD) shr 8
                retn
@@tree01000:
                call    ebp
                jnc     @@tree010000
@@tree010001:
                mov     ah, (C_DATA1+C_BAD) shr 8
                retn
@@tree010000:
                call    ebp
                jnc     @@tree0100000
@@tree0100001:
                mov     ax, C_SEG+C_BAD
                retn
@@tree0100000:
                call    ebp
                jc      @@tree01000001
@@tree01000000:
                mov     eax, C_DATA66+C_BAD
                retn
@@tree01000001:
                call    ebp
                jnc     @@tree010000010
@@tree010000011:
                mov     ah, (C_MODRM+C_DATA1+C_BAD) shr 8
                retn
@@tree010000010:
                btc     eax, C_OPCODE2_LG2
                retn
@@tree00:
                dec     eax
                retn
