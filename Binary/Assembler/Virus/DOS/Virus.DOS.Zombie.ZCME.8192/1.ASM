
msg             macro   text
                  local   t3
                  t4      = 0
                  irpc    x, <text>
                    t3      = "&x&"
                    if      t3 ne "'"
                      mov     al, t3
                      stosb
                    endif
                  endm ; irpc
                endm ; macro

msg1310         macro   text
                msg     text
                mov     ax, 0A0Dh
                stosw
                mov     al, '$'
                stosb
                endm

msg0            macro   text
                msg     text
                xor     al, al
                stosb
                endm

include         rulez.inc
include         jmps386.inc

P               equ     5       ; если rnd(P) = 0 то добавить JMPxx
Q               equ     3       ; кол-во NOPов после каждой команды = rnd(Q)

                org     100h
start:
                lea     di, vars
                mov     dx, di
                msg1310 'Z0MBiE`s Code Mutation Engine  (ZCME)  Version 0.00'
                mov     ah, 9
                int     21h

RESTART:        xor     sp, sp

                lea     di, vars
                mov     cx, 32768
                xor     al, al
                cld
                rep     stosb

; ---------------------------------------------------------------------------

mutation:       lea     si, start
                lea     di, newcode
                xor     bx, bx

                push    -1

@@1:            mov     ax, [si]

                cmp     al, 90h
                jne     @@5

                inc     si
                jmp     @@1

@@5:            cmp     al, 0E9h
                jne     @@3

                add     si, [si+1]
                add     si, 3

@@3:            call    getcmdsize

                push    si              ; старый оффсет
                push    di              ; новый  оффсет

                mov     ax, [si]

                rep     movsb

                inc     ax
                jz      @@exit

                cmp     ds:[0080h].b0, 0
                jne     @@1

                mov      ax, Q
                call     rnd
                xchg     cx, ax
                jcxz     @@4

                mov      al, 90h
                rep      stosb

@@4:            cmp     di, offset newcode + 8192 - 50
                ja      @@2

                push    di
                mov     cx, 40
                xor     al, al
                repe    scasb
                pop     di
                jne     @@2

                mov      ax, P
                call     rnd
                or       ax, ax
                jnz      @@1

@@2:            mov     ax, 8192 - 50
                call    rnd
                add     ax, offset newcode
                mov     dx, ax

                push    di
                xchg    di, ax
                mov     cx, 40+10
                xor     al, al
                repe    scasb
                pop     di
                jne     @@2

                add     dx, 10

                mov     al, 0E9h
                stosb
                mov     ax, dx
                sub     ax, di
                dec     ax
                dec     ax
                stosw

                mov     di, dx

                jmp     @@1

@@exit:

; ---------------------------------------------------------------------------

               ; mov     ds:[00F0H], di
                mov     ds:[00F0H].w0, offset newcode + 8192

; ---------------------------------------------------------------------------

correctjmps:

@@1:            pop     di              ; новый  оффсет

                inc     di              ; -1
                jz      @@exit
                dec     di

                pop     si              ; старый оффсет

                call    check_jmp

                jmp     @@1

@@exit:

; ---------------------------------------------------------------------------

                mov     di, 80h
                mov     dx, di

                msg0    '1.COM'

                mov     ah, 3ch
                xor     cx, cx
                int     21h

                xchg    bx, ax

                mov     ah, 40h
                lea     dx, newcode
                mov     cx, ds:[00F0H]
                sub     cx, dx
                int     21h

                mov     ah, 3eh
                int     21h

                lea     di, vars
                mov     dx, di
                msg1310 'Mutation complete'
                mov     ah, 9
                int     21h

                mov     ax, 4c00h
                int     21h

; ---------------------------------------------------------------------------

check_jmp:      push    bx

@@1:            dec     bx
                dec     bx
                js      @@exit

                cmp     si, jmpaddr[bx]
                jne     @@1

                mov     bp, jmpcorr[bx]

                mov     ax, di
                sub     ax, bp

                dec     ax
                dec     ax

                mov     cs:[bp], ax

                jmp     @@1

@@exit:         pop     bx
                ret

; ---------------------------------------------------------------------------

                ; input:  si=command
                ; output: cx=command size
                ;         jmpcorr,
                ;         jmpaddr - updated

prefix:         inc     bp
                inc     cx
                jmp     getprefix

getcmdsize:     push    di

                mov     bp, si
                xor     cx, cx

getprefix:      mov     ax, cs:[bp]

                mov     dl, al          ; es: cs: ss: ds:
                and     dl, 11100111b
                cmp     dl, 00100110b
                je      prefix

                mov     dl, al          ; fs: gs: 66 67
                and     dl, 11111100b
                cmp     dl, 01100100b
                je      prefix

                cmp     al, 0f0h        ; lock
                je      prefix

                cmp     al, 0f2h        ; repnz
                je      prefix
                cmp     al, 0f3h        ; repz
                je      prefix

                inc     cx              ; 1

                cmp     al, 0fch        ; cld
                je      @@exit

                mov     dl, al
                and     dl, 0f0h

                cmp     al, 9ah         ; call far xxxx:yyyy
                je      @@9a
                cmp     dl, 90h         ; xchg ax, r16
                je      @@exit          ; cbw cwd wait pushf popf sahf lahf

                cmp     dl, 40h         ; inc r16   dec r16
                je      @@exit

                cmp     dl, 50h         ; push r16  pop r16
                je      @@exit

                cmp     al, 60h         ; pusha
                je      @@exit
                cmp     al, 61h         ; popa
                je      @@exit

                cmp     al, 0c3h        ; ret
                je      @@exit
                cmp     al, 0cbh        ; retf
                je      @@exit
                cmp     al, 0c9h        ; leave
                je      @@exit
                cmp     al, 0cfh        ; iret
                je      @@exit

                mov     dl, al
                and     dl, 11111100b

                cmp     dl, 10100100b   ; movs, cmps
                je      @@exit

                cmp     dl, 10101100b   ; lods, scas
                je      @@exit

                cmp     al, 0AAh        ; stosb
                je      @@exit
                cmp     al, 0ABh        ; stosw
                je      @@exit

                cmp     al, 0CCh        ; int 3
                je      @@exit

                cmp     al, 0f8h        ; clc
                je      @@exit
                cmp     al, 0f9h        ; stc
                je      @@exit

                inc     cx              ; 2

                cmp     ax, 0ffffh
                je      @@exit

                cmp     al, 6Ah         ; push ssxx
                je      @@exit

                mov     dx, ax          ; mov r, r
                and     dx, 1100000011111100b
                cmp     dx, 1100000010001000b
                je      @@exit          ;

                mov     dx, ax          ; add/or/adc/sbb/and/sub/xor/cmp r,r
                and     dx, 1100000011000100b
                cmp     dx, 1100000000000000b
                je      @@exit

                mov     dl, al          ; mov r8, xx
                and     dl, 11111000b
                cmp     dl, 10110000b
                je      @@exit

                mov     dx, ax          ; ror/rol,... reg,1/cl
                and     dx, 1100000011111100b
                cmp     dx, 1100000011010000b
                je      @@exit

                cmp     al, 0cdh        ; int xx
                je      @@exit

                cmp     al, 0A8h        ; test al, xx
                je      @@exit

                cmp     ax, 8A05h       ; mov al, [di]
                je      @@exit
                cmp     ax, 058Bh       ; mov ax, [di]
                je      @@exit
                cmp     ax, 048Bh       ; mov ax, [si]
                je      @@exit
                cmp     ax, 048ah       ; mov al, [si]
                je      @@exit

                cmp     al, 03Ch        ; cmp al, xx
                je      @@exit
                cmp     al, 034h        ; xor al, xx
                je      @@exit
                cmp     al, 004h        ; add al, xx
                je      @@exit
                cmp     al, 02ch        ; sub al, xx
                je      @@exit

                cmp     al, 0E4h        ; in al, xx
                je      @@exit

                cmp     ax, 0F3F7H      ; div bx
                je      @@exit

                inc     cx              ; 3

                cmp     ax, 7403h       ; add si, [si+xx]
                je      @@exit

                mov     dx, ax          ; add r16, xx
                and     dh, 11000000b
                cmp     dx, 0c083h
                je      @@exit

                cmp     al, 03Dh        ; cmp ax, xxxx
                je      @@exit
                cmp     al, 005h        ; add ax, xxxx
                je      @@exit
                cmp     al, 02dh        ; sub ax, xxxx
                je      @@exit

                mov     dx, ax          ; add/or/adc/sbb/and/sub/xor/cmp r8,xx
                and     dh, 11000000b
                cmp     dx, 1100000010000000b
                je      @@exit

                cmp     al, 0A9h        ; test ax, xxxx
                je      @@exit

                cmp     al, 0e8h        ; call xxxx
                je      @@jmp2

                mov     dl, al          ; mov r16, xxxx
                and     dl, 11111000b
                cmp     dl, 10111000b
                je      @@exit

                mov     dl, al          ; mov al, [xxxx]  mov [xxxx], al
                and     dl, 11111100b   ; mov ax, [xxxx]  mov [xxxx], ax
                cmp     dl, 10100000b
                je      @@exit

                cmp     ax, 04688h      ; mov [bp+xx], al
                je      @@exit
                cmp     ax, 04689h      ; mov [bp+xx], ax
                je      @@exit
                cmp     ax, 0468Ah      ; mov al, [bp+xx]
                je      @@exit
                cmp     ax, 0468Bh      ; mov ax, [bp+xx]
                je      @@exit

                inc     cx              ; 4

                mov     dx, ax          ; add/or/adc/sbb/and/sub/xor/cmp r16,xxxx
                and     dh, 11000000b
                cmp     dx, 1100000010000001b
                je      @@exit

                mov     dx, ax                  ; mov [xxxx], r
                and     dx, 1100011111111101b   ; mov r, [xxxx]
                cmp     dx, 0000011010001001b
                je      @@exit

                cmp     ax, 0B73BH      ; cmp si, [bx+xxxx]
                je      @@exit
                cmp     ax, 0AF8BH      ; mov bp, [bx+xxxx]
                je      @@exit

                cmp     al, 0fh         ; jcc xxxx
                jne     @@1
                mov     dl, ah
                and     dl, 0f0h
                cmp     dl, 80h
                je      @@jmp3
@@1:
                cmp     ax, 0BF89h      ; mov [bx+xxxx], di
                je      @@exit
                cmp     ax, 08789h      ; mov [bx+xxxx], ax
                je      @@exit

                inc     cx              ; 5

                cmp     al, 0eah
@@9a:           je      @@exit

                cmp     ax, 3E80h       ; cmp [xxxx], yy
                je      @@exit

                inc     cx              ; 6

                cmp     ax, 06C7h       ; mov [xxxx], yyyy
                je      @@exit

                inc     cx              ; 7

                int 3

@@jmp3:         inc     di              ; CC CC xxxx
                mov     ax, cs:[bp+2]
                jmp     @@jmp

@@jmp2:         mov     ax, cs:[bp+1]   ; CC xxxx

@@jmp:          inc     di
                mov     jmpcorr[bx], di

                add     ax, bp
                add     ax, cx

                mov     jmpaddr[bx], ax

                inc     bx
                inc     bx

@@exit:         pop     di
                ret

; ---------------------------------------------------------------------------

random:         push    bx
                in      al, 40h
                xor     bl, al
                in      al, 40h
                add     bh, al
                in      al, 41h
                sub     bl, al
                in      al, 41h
                xor     bh, al
                in      al, 42h
                add     bl, al
                in      al, 42h
                sub     bh, al
                xchg    bx, ax
                pop     bx
                test    al, 1
                ret

rnd:            push    bx
                push    dx
                xchg    bx, ax
                call    random
                xor     dx, dx
                div     bx
                xchg    dx, ax
                pop     dx
                pop     bx
                test    al, 1
                ret

; ---------------------------------------------------------------------------

                dw      -1

; ---------------------------------------------------------------------------

                org     16384

vars:

jmpcorr         dw      1024 dup (?)
jmpaddr         dw      1024 dup (?)

newcode         db      8192 dup (?)

                end     start
