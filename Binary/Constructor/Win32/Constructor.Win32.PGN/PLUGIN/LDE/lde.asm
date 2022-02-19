
; LDE32, Length-Disassembler Engine, 32-bit, (x) 1999-2000
; special edition for PGN2 project

; version 1.05.2

include                 LDE.INC

C_MEM1                  equ     0001h       ; |
C_MEM2                  equ     0002h       ; |may be used simultaneously
C_MEM4                  equ     0004h       ; |
C_DATA1                 equ     0100h       ; |
C_DATA2                 equ     0200h       ; |may be used simultaneously
C_DATA4                 equ     0400h       ; |
C_67                    equ     0010h       ; used with C_PREFIX
C_MEM67                 equ     0020h       ; C_67 ? C_MEM2 : C_MEM4
C_66                    equ     1000h       ; used with C_PREFIX
C_DATA66                equ     2000h       ; C_66 ? C_DATA2 : C_DATA4
C_PREFIX                equ     0008h       ; prefix. take opcode again
C_MODRM                 equ     4000h       ; MODxxxR/M
C_DATAW0                equ     8000h       ; opc&1 ? C_DATA66 : C_DATA1

                        p386
                        model   flat
                        locals  @@

                        .data

;0F      -- analyzed in code, no flags (i.e.flags must be 0)
;F6,F7   -- --//-- (ttt=000 -- 3 bytes, otherwise 2 bytes)
;CD      -- --//-- (6 bytes if CD 20, 2 bytes otherwise)

table_1                 label   dword   ; normal instructions

dd C_MODRM              ; 00
dd C_MODRM              ; 01
dd C_MODRM              ; 02
dd C_MODRM              ; 03
dd C_DATAW0             ; 04
dd C_DATAW0             ; 05
dd 0                    ; 06
dd 0                    ; 07
dd C_MODRM              ; 08
dd C_MODRM              ; 09
dd C_MODRM              ; 0A
dd C_MODRM              ; 0B
dd C_DATAW0             ; 0C
dd C_DATAW0             ; 0D
dd 0                    ; 0E
dd 0                    ; 0F
dd C_MODRM              ; 10
dd C_MODRM              ; 11
dd C_MODRM              ; 12
dd C_MODRM              ; 13
dd C_DATAW0             ; 14
dd C_DATAW0             ; 15
dd 0                    ; 16
dd 0                    ; 17
dd C_MODRM              ; 18
dd C_MODRM              ; 19
dd C_MODRM              ; 1A
dd C_MODRM              ; 1B
dd C_DATAW0             ; 1C
dd C_DATAW0             ; 1D
dd 0                    ; 1E
dd 0                    ; 1F
dd C_MODRM              ; 20
dd C_MODRM              ; 21
dd C_MODRM              ; 22
dd C_MODRM              ; 23
dd C_DATAW0             ; 24
dd C_DATAW0             ; 25
dd C_PREFIX             ; 26
dd 0                    ; 27
dd C_MODRM              ; 28
dd C_MODRM              ; 29
dd C_MODRM              ; 2A
dd C_MODRM              ; 2B
dd C_DATAW0             ; 2C
dd C_DATAW0             ; 2D
dd C_PREFIX             ; 2E
dd 0                    ; 2F
dd C_MODRM              ; 30
dd C_MODRM              ; 31
dd C_MODRM              ; 32
dd C_MODRM              ; 33
dd C_DATAW0             ; 34
dd C_DATAW0             ; 35
dd C_PREFIX             ; 36
dd 0                    ; 37
dd C_MODRM              ; 38
dd C_MODRM              ; 39
dd C_MODRM              ; 3A
dd C_MODRM              ; 3B
dd C_DATAW0             ; 3C
dd C_DATAW0             ; 3D
dd C_PREFIX             ; 3E
dd 0                    ; 3F
dd 0                    ; 40
dd 0                    ; 41
dd 0                    ; 42
dd 0                    ; 43
dd 0                    ; 44
dd 0                    ; 45
dd 0                    ; 46
dd 0                    ; 47
dd 0                    ; 48
dd 0                    ; 49
dd 0                    ; 4A
dd 0                    ; 4B
dd 0                    ; 4C
dd 0                    ; 4D
dd 0                    ; 4E
dd 0                    ; 4F
dd 0                    ; 50
dd 0                    ; 51
dd 0                    ; 52
dd 0                    ; 53
dd 0                    ; 54
dd 0                    ; 55
dd 0                    ; 56
dd 0                    ; 57
dd 0                    ; 58
dd 0                    ; 59
dd 0                    ; 5A
dd 0                    ; 5B
dd 0                    ; 5C
dd 0                    ; 5D
dd 0                    ; 5E
dd 0                    ; 5F
dd 0                    ; 60
dd 0                    ; 61
dd C_MODRM              ; 62
dd C_MODRM              ; 63
dd C_PREFIX             ; 64
dd C_PREFIX             ; 65
dd C_PREFIX+C_66        ; 66
dd C_PREFIX+C_67        ; 67
dd C_DATA66             ; 68
dd C_MODRM+C_DATA66     ; 69
dd C_DATA1              ; 6A
dd C_MODRM+C_DATA1      ; 6B
dd 0                    ; 6C
dd 0                    ; 6D
dd 0                    ; 6E
dd 0                    ; 6F
dd C_DATA1              ; 70
dd C_DATA1              ; 71
dd C_DATA1              ; 72
dd C_DATA1              ; 73
dd C_DATA1              ; 74
dd C_DATA1              ; 75
dd C_DATA1              ; 76
dd C_DATA1              ; 77
dd C_DATA1              ; 78
dd C_DATA1              ; 79
dd C_DATA1              ; 7A
dd C_DATA1              ; 7B
dd C_DATA1              ; 7C
dd C_DATA1              ; 7D
dd C_DATA1              ; 7E
dd C_DATA1              ; 7F
dd C_MODRM+C_DATA1      ; 80
dd C_MODRM+C_DATA66     ; 81
dd C_MODRM+C_DATA1      ; 82
dd C_MODRM+C_DATA1      ; 83
dd C_MODRM              ; 84
dd C_MODRM              ; 85
dd C_MODRM              ; 86
dd C_MODRM              ; 87
dd C_MODRM              ; 88
dd C_MODRM              ; 89
dd C_MODRM              ; 8A
dd C_MODRM              ; 8B
dd C_MODRM              ; 8C
dd C_MODRM              ; 8D
dd C_MODRM              ; 8E
dd C_MODRM              ; 8F
dd 0                    ; 90
dd 0                    ; 91
dd 0                    ; 92
dd 0                    ; 93
dd 0                    ; 94
dd 0                    ; 95
dd 0                    ; 96
dd 0                    ; 97
dd 0                    ; 98
dd 0                    ; 99
dd C_DATA66+C_MEM2      ; 9A
dd 0                    ; 9B
dd 0                    ; 9C
dd 0                    ; 9D
dd 0                    ; 9E
dd 0                    ; 9F
dd C_MEM67              ; A0
dd C_MEM67              ; A1
dd C_MEM67              ; A2
dd C_MEM67              ; A3
dd 0                    ; A4
dd 0                    ; A5
dd 0                    ; A6
dd 0                    ; A7
dd C_DATA1              ; A8
dd C_DATA66             ; A9
dd 0                    ; AA
dd 0                    ; AB
dd 0                    ; AC
dd 0                    ; AD
dd 0                    ; AE
dd 0                    ; AF
dd C_DATA1              ; B0
dd C_DATA1              ; B1
dd C_DATA1              ; B2
dd C_DATA1              ; B3
dd C_DATA1              ; B4
dd C_DATA1              ; B5
dd C_DATA1              ; B6
dd C_DATA1              ; B7
dd C_DATA66             ; B8
dd C_DATA66             ; B9
dd C_DATA66             ; BA
dd C_DATA66             ; BB
dd C_DATA66             ; BC
dd C_DATA66             ; BD
dd C_DATA66             ; BE
dd C_DATA66             ; BF
dd C_MODRM+C_DATA1      ; C0
dd C_MODRM+C_DATA1      ; C1
dd C_DATA2              ; C2
dd 0                    ; C3
dd C_MODRM              ; C4
dd C_MODRM              ; C5
dd C_MODRM+C_DATA1      ; C6
dd C_MODRM+C_DATA66     ; C7
dd C_DATA2+C_DATA1      ; C8
dd 0                    ; C9
dd C_DATA2              ; CA
dd 0                    ; CB
dd 0                    ; CC
dd 0                    ; CD
dd 0                    ; CE
dd 0                    ; CF
dd C_MODRM              ; D0
dd C_MODRM              ; D1
dd C_MODRM              ; D2
dd C_MODRM              ; D3
dd C_DATA1              ; D4
dd C_DATA1              ; D5
dd 0                    ; D6
dd 0                    ; D7
dd C_MODRM              ; D8
dd C_MODRM              ; D9
dd C_MODRM              ; DA
dd C_MODRM              ; DB
dd C_MODRM              ; DC
dd C_MODRM              ; DD
dd C_MODRM              ; DE
dd C_MODRM              ; DF
dd C_DATA1              ; E0
dd C_DATA1              ; E1
dd C_DATA1              ; E2
dd C_DATA1              ; E3
dd C_DATA1              ; E4
dd C_DATA1              ; E5
dd C_DATA1              ; E6
dd C_DATA1              ; E7
dd C_DATA66             ; E8
dd C_DATA66             ; E9
dd C_DATA66+C_MEM2      ; EA
dd C_DATA1              ; EB
dd 0                    ; EC
dd 0                    ; ED
dd 0                    ; EE
dd 0                    ; EF
dd C_PREFIX             ; F0
dd 0                    ; F1
dd C_PREFIX             ; F2
dd C_PREFIX             ; F3
dd 0                    ; F4
dd 0                    ; F5
dd 0                    ; F6
dd 0                    ; F7
dd 0                    ; F8
dd 0                    ; F9
dd 0                    ; FA
dd 0                    ; FB
dd 0                    ; FC
dd 0                    ; FD
dd C_MODRM              ; FE
dd C_MODRM              ; FF

table_0F                label   dword   ; 0F-prefixed instructions

dd C_MODRM              ; 00
dd C_MODRM              ; 01
dd C_MODRM              ; 02
dd C_MODRM              ; 03
dd -1                   ; 04
dd -1                   ; 05
dd 0                    ; 06
dd -1                   ; 07
dd 0                    ; 08
dd 0                    ; 09
dd 0                    ; 0A
dd 0                    ; 0B
dd -1                   ; 0C
dd -1                   ; 0D
dd -1                   ; 0E
dd -1                   ; 0F
dd -1                   ; 10
dd -1                   ; 11
dd -1                   ; 12
dd -1                   ; 13
dd -1                   ; 14
dd -1                   ; 15
dd -1                   ; 16
dd -1                   ; 17
dd -1                   ; 18
dd -1                   ; 19
dd -1                   ; 1A
dd -1                   ; 1B
dd -1                   ; 1C
dd -1                   ; 1D
dd -1                   ; 1E
dd -1                   ; 1F
dd -1                   ; 20
dd -1                   ; 21
dd -1                   ; 22
dd -1                   ; 23
dd -1                   ; 24
dd -1                   ; 25
dd -1                   ; 26
dd -1                   ; 27
dd -1                   ; 28
dd -1                   ; 29
dd -1                   ; 2A
dd -1                   ; 2B
dd -1                   ; 2C
dd -1                   ; 2D
dd -1                   ; 2E
dd -1                   ; 2F
dd -1                   ; 30
dd -1                   ; 31
dd -1                   ; 32
dd -1                   ; 33
dd -1                   ; 34
dd -1                   ; 35
dd -1                   ; 36
dd -1                   ; 37
dd -1                   ; 38
dd -1                   ; 39
dd -1                   ; 3A
dd -1                   ; 3B
dd -1                   ; 3C
dd -1                   ; 3D
dd -1                   ; 3E
dd -1                   ; 3F
dd -1                   ; 40
dd -1                   ; 41
dd -1                   ; 42
dd -1                   ; 43
dd -1                   ; 44
dd -1                   ; 45
dd -1                   ; 46
dd -1                   ; 47
dd -1                   ; 48
dd -1                   ; 49
dd -1                   ; 4A
dd -1                   ; 4B
dd -1                   ; 4C
dd -1                   ; 4D
dd -1                   ; 4E
dd -1                   ; 4F
dd -1                   ; 50
dd -1                   ; 51
dd -1                   ; 52
dd -1                   ; 53
dd -1                   ; 54
dd -1                   ; 55
dd -1                   ; 56
dd -1                   ; 57
dd -1                   ; 58
dd -1                   ; 59
dd -1                   ; 5A
dd -1                   ; 5B
dd -1                   ; 5C
dd -1                   ; 5D
dd -1                   ; 5E
dd -1                   ; 5F
dd -1                   ; 60
dd -1                   ; 61
dd -1                   ; 62
dd -1                   ; 63
dd -1                   ; 64
dd -1                   ; 65
dd -1                   ; 66
dd -1                   ; 67
dd -1                   ; 68
dd -1                   ; 69
dd -1                   ; 6A
dd -1                   ; 6B
dd -1                   ; 6C
dd -1                   ; 6D
dd -1                   ; 6E
dd -1                   ; 6F
dd -1                   ; 70
dd -1                   ; 71
dd -1                   ; 72
dd -1                   ; 73
dd -1                   ; 74
dd -1                   ; 75
dd -1                   ; 76
dd -1                   ; 77
dd -1                   ; 78
dd -1                   ; 79
dd -1                   ; 7A
dd -1                   ; 7B
dd -1                   ; 7C
dd -1                   ; 7D
dd -1                   ; 7E
dd -1                   ; 7F
dd C_DATA66             ; 80
dd C_DATA66             ; 81
dd C_DATA66             ; 82
dd C_DATA66             ; 83
dd C_DATA66             ; 84
dd C_DATA66             ; 85
dd C_DATA66             ; 86
dd C_DATA66             ; 87
dd C_DATA66             ; 88
dd C_DATA66             ; 89
dd C_DATA66             ; 8A
dd C_DATA66             ; 8B
dd C_DATA66             ; 8C
dd C_DATA66             ; 8D
dd C_DATA66             ; 8E
dd C_DATA66             ; 8F
dd C_MODRM              ; 90
dd C_MODRM              ; 91
dd C_MODRM              ; 92
dd C_MODRM              ; 93
dd C_MODRM              ; 94
dd C_MODRM              ; 95
dd C_MODRM              ; 96
dd C_MODRM              ; 97
dd C_MODRM              ; 98
dd C_MODRM              ; 99
dd C_MODRM              ; 9A
dd C_MODRM              ; 9B
dd C_MODRM              ; 9C
dd C_MODRM              ; 9D
dd C_MODRM              ; 9E
dd C_MODRM              ; 9F
dd 0                    ; A0
dd 0                    ; A1
dd 0                    ; A2
dd C_MODRM              ; A3
dd C_MODRM+C_DATA1      ; A4
dd C_MODRM              ; A5
dd -1                   ; A6
dd -1                   ; A7
dd 0                    ; A8
dd 0                    ; A9
dd 0                    ; AA
dd C_MODRM              ; AB
dd C_MODRM+C_DATA1      ; AC
dd C_MODRM              ; AD
dd -1                   ; AE
dd C_MODRM              ; AF
dd C_MODRM              ; B0
dd C_MODRM              ; B1
dd C_MODRM              ; B2
dd C_MODRM              ; B3
dd C_MODRM              ; B4
dd C_MODRM              ; B5
dd C_MODRM              ; B6
dd C_MODRM              ; B7
dd -1                   ; B8
dd -1                   ; B9
dd C_MODRM+C_DATA1      ; BA
dd C_MODRM              ; BB
dd C_MODRM              ; BC
dd C_MODRM              ; BD
dd C_MODRM              ; BE
dd C_MODRM              ; BF
dd C_MODRM              ; C0
dd C_MODRM              ; C1
dd -1                   ; C2
dd -1                   ; C3
dd -1                   ; C4
dd -1                   ; C5
dd -1                   ; C6
dd -1                   ; C7
dd 0                    ; C8
dd 0                    ; C9
dd 0                    ; CA
dd 0                    ; CB
dd 0                    ; CC
dd 0                    ; CD
dd 0                    ; CE
dd 0                    ; CF
dd -1                   ; D0
dd -1                   ; D1
dd -1                   ; D2
dd -1                   ; D3
dd -1                   ; D4
dd -1                   ; D5
dd -1                   ; D6
dd -1                   ; D7
dd -1                   ; D8
dd -1                   ; D9
dd -1                   ; DA
dd -1                   ; DB
dd -1                   ; DC
dd -1                   ; DD
dd -1                   ; DE
dd -1                   ; DF
dd -1                   ; E0
dd -1                   ; E1
dd -1                   ; E2
dd -1                   ; E3
dd -1                   ; E4
dd -1                   ; E5
dd -1                   ; E6
dd -1                   ; E7
dd -1                   ; E8
dd -1                   ; E9
dd -1                   ; EA
dd -1                   ; EB
dd -1                   ; EC
dd -1                   ; ED
dd -1                   ; EE
dd -1                   ; EF
dd -1                   ; F0
dd -1                   ; F1
dd -1                   ; F2
dd -1                   ; F3
dd -1                   ; F4
dd -1                   ; F5
dd -1                   ; F6
dd -1                   ; F7
dd -1                   ; F8
dd -1                   ; F9
dd -1                   ; FA
dd -1                   ; FB
dd -1                   ; FC
dd -1                   ; FD
dd -1                   ; FE
dd -1                   ; FF

                        .code

; input: pointer to opcode
; returns: opcode length in EAX or -1 if error

                        public  disasm

disasm:                 mov     ecx, [esp+4]    ; ECX = opcode ptr

                        xor     edx, edx        ; flags
                        xor     eax, eax

@@prefix:               and     dl, not C_PREFIX

                        mov     al, [ecx]
                        inc     ecx

                        or      edx, table_1[eax*4]

                        test    dl, C_PREFIX
                        jnz     @@prefix

                        cmp     al, 0F6h
                        je      @@test
                        cmp     al, 0F7h
                        je      @@test

                        cmp     al, 0CDh
                        je      @@int

                        cmp     al, 0Fh
                        je      @@0F
@@cont:
                        test    dh, C_DATAW0 shr 8
                        jnz     @@dataw0
@@dataw0done:
                        test    dh, C_MODRM shr 8
                        jnz     @@modrm
@@exitmodrm:
                        test    dl, C_MEM67
                        jnz     @@mem67
@@mem67done:
                        test    dh, C_DATA66 shr 8
                        jnz     @@data66
@@data66done:
                        mov     eax, ecx
                        sub     eax, [esp+4]

                        and     edx, C_MEM1+C_MEM2+C_MEM4 + C_DATA1+C_DATA2+C_DATA4
                        add     al, dl
                        add     al, dh

@@exit:                 retn

@@test:                 or      dh, C_MODRM shr 8
                        test    byte ptr [ecx], 00111000b  ; F6/F7 -- test
                        jnz     @@cont
                        or      dh, C_DATAW0 shr 8
                        jmp     @@cont

@@int:                  or      dh, C_DATA1 shr 8
                        cmp     byte ptr [ecx], 20h
                        jne     @@cont
                        or      dh, C_DATA4 shr 8
                        jmp     @@cont

@@0F:                   mov     al, [ecx]
                        inc     ecx
                        or      edx, table_0F[eax*4]

                        cmp     edx, -1
                        jne     @@cont

@@error:                mov     eax, edx
                        jmp     @@exit

@@dataw0:               xor     dh, C_DATA66 shr 8
                        test    al, 00000001b
                        jnz     @@dataw0done
                        xor     dh, (C_DATA66+C_DATA1) shr 8
                        jmp     @@dataw0done

@@mem67:                xor     dl, C_MEM2
                        test    dl, C_67
                        jnz     @@mem67done
                        xor     dl, C_MEM4+C_MEM2
                        jmp     @@mem67done

@@data66:               xor     dh, C_DATA2 shr 8
                        test    dh, C_66 shr 8
                        jnz     @@data66done
                        xor     dh, (C_DATA4+C_DATA2) shr 8
                        jmp     @@data66done

@@modrm:                mov     al, [ecx]
                        inc     ecx

                        mov     ah, al  ; ah=mod, al=rm

                        and     ax, 0C007h
                        cmp     ah, 0C0h
                        je      @@exitmodrm

                        test    dl, C_67
                        jnz     @@modrm16

@@modrm32:              cmp     al, 04h
                        jne     @@a

                        mov     al, [ecx]       ; sib
                        inc     ecx
                        and     al, 07h

@@a:                    cmp     ah, 40h
                        je      @@mem1
                        cmp     ah, 80h
                        je      @@mem4

                        cmp     ax, 0005h
                        jne     @@exitmodrm

@@mem4:                 or      dl, C_MEM4
                        jmp     @@exitmodrm

@@mem1:                 or      dl, C_MEM1
                        jmp     @@exitmodrm

@@modrm16:              cmp     ax, 0006h
                        je      @@mem2
                        cmp     ah, 40h
                        je      @@mem1
                        cmp     ah, 80h
                        jne     @@exitmodrm

@@mem2:                 or      dl, C_MEM2
                        jmp     @@exitmodrm

                        end
