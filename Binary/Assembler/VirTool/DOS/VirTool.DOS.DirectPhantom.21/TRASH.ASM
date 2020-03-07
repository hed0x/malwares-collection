
;  Форм т слов  ст тус  для REG/MEM trash
;
;  WD = 00 - W нет D нет             0,1 Wbit & Dbit
;   01 - W=0,1 D нет
;   10 - W=0,1 D=1
;   11 - W=0,1 D=0,1
;
;  TR = 0 - не тестиров ть поле REG      2   TestREG
;   1 - тестиров ть поле REG
;
;                        3   TestREG/MEM
;  TRM = 0 - не тестить поле REG/MEM
;    1 - тестить н  регистр
;
;  MemOnly = 0 - произвольно             4   MemOnly
;        1 - только в п мять
;
;  PLCMD = 00 - нет дополнительной ком нды   5,6 PLaceCoMmanD
;      01 - в КОП'e              местоположение
;      10 - в ModeRM
;
;  ImmF = 0 - нет дополнительного опер нд     7   Immediate
;     1 - есть дополнительный опер нд
;
;                        8,9,10
;                        дополнительн я ком нд 
;                        11,12,13
;                        дополнительный КОП
;
;  KillAD = 0 - не портит AX и DX        14  KillAX,DX
;       1 - портит AX и DX

Wbit        equ 0
WDbit       equ 00000011b
TR      equ 00000100b
TRM     equ 00001000b
MemOnly     equ 00010000b
CMDinCOP    equ 00100000b
CMDinRM     equ 01000000b
ImmF        equ 10000000b
;       High Byte
XtraCMD     equ 00000111b
XtraCOP     equ 00111000b
KillAD      equ 01000000b

RMTAB       equ $

db  10001010b,10b+TR,0          ; MOV REG,REG/MEM
db  10000110b,01b+TR+TRM,0          ; XCHG REG,REG
db  10001101b,00b+TR+MemOnly,0      ; LEA REG,MEM
db  00000010b,10b+TR+CMDinCOP,111b      ; ARCMD REG,REG/MEM
db  00111000b,11b,0             ; CMP REG,REG/MEM
db  10000100b,01b,0             ; TEST REG,REG/MEM
db  11000110b,01b+TR+CMDinRM+TRM+ImmF,0 ; MOV REG,Imm8/16
db  10000000b,01b+TR+CMDinRM+TRM+ImmF,111b  ; ARCMD REG,Imm8/16
db  11110110b,01b+TR+CMDinRM+ImmF,0     ; TEST REG/MEM,Imm8/16
db  11111110b,01b+TR+CMDinRM+TRM,1      ; INC/DEC REG
db  11110110b,01b+TR+CMDinRM+TRM,1+010000b  ; NOT/NEG REG
db  11110110b,01b+TR+CMDinRM,1+100000b+KillAD    ; MUL/IMUL REG/MEM
db  10001100b,00b+TR+CMDinRM+TRM,11b    ; MOV REG,SREG
db  11010000b,01b+TR+CMDinRM+TRM,111b   ; SHIFT REG,1
db  11010010b,01b+TR+CMDinRM+TRM,111b   ; SHIFT REG,CL

; З меч ния :
;       Нет сдвигового мусор  через НОП imm8
;       Нет р сширения НОП'  до полного р змер  в ARCMD , S=0

ENDRMTAB    equ $

; Т блиц  offset'ов н  SUB'ы
SUBOFFS     dq  0h
        dq  0h

; Т блиц  простого мусор 

RotF        equ 00000010b
KillAX      equ 00001000b
SmplyCMD    equ 01110000b

SimplyTAB   equ $

db  10110000b,01b+TR+ImmF           ; MOV REG,Imm8/16
db  10010000b,00b+TR+KillAX         ; XCHG AX,REG
db  01000000b,00b+TR+RotF+10000b        ; INC/DEC REG
db  10100001b,00b+KillAX+ImmF       ; MOV AX,MEM
db  00000100b,01b+KillAX+RotF+ImmF+SmplyCMD ; ARCMD AL/AX,Imm8/16
db  10101000b,01b+ImmF          ; TEST AL/AX,Imm8/16
db  00100111b,00b+KillAX+RotF+110000b   ; DAA/DAS/AAA/AAS
db  11111000b,00b+1010000b          ; STI,CLI,STD,CLD,STC,CLC
db  11110101b,00b               ; CMC
db  10011000b,00b+KillAX            ; CBW
db  11010111b,00b+KillAX            ; XLAT
db  11001100b,00b               ; INT 3
db  10011110b,00b+KillAX+10000b     ; SAHF,LAHF
db  10010000b,00b               ; NOP
db  00100110b,00b+RotF+110000b      ; ES/CS/SS/DS

SimplyEND   equ $

; З меч ния :
;       Нет мусор  ввод  в  ккумулятор из порт 
;       Нет мусор  AAM,AAD
;       Нет MOV AL,MEM

; Т блиц  мусорных процедур

TRCMDs      dw  offset SimplyTRASH
        dw  offset SUBROUTINE
        dw  offset CALLtoSUB
        dw  offset RMTRASH
        dw  offset JUMPTRASH
        dw  offset PUSHPOPTRASH
TREND       equ $
;----------------------------------------------------------------------------

GETVAL      proc
;       Взять зн чение по случ йному индексу
        call    RND
        shl dl,1
        movzx   bx,dl
        mov ax,[si+bx]
        ret
GETVAL      endp
;-------------------
GETTRASHREG proc
        bt  bx,Wbit       ; Истинный Wbit
        cmc
        call    GETFREEREG    ; Берем нез нятый регистр
        call    FREEREG       ; Но не помеч ем его к к з нятый -
                      ; это же мусор
        ret
GETTRASHREG endp
;-------------------
AddImmediate    proc
; Доб вление непосредственного опер нд 
        test    bl,ImmF
        jz  ExitImmed

        in  al,40h
        stosb
        bt  bx,Wbit
        jnc ExitImmed
        in  al,40h
        stosb
ExitImmed:
        ret
AddImmediate    endp
;-------------------
AddXtraCMD  PROC
; Доб вление дополнительной ком нды
        mov dl,bh
        and dl,XtraCOP
        or  al,dl

        mov dl,bh         ; Доб вляем дополнительную ком нду
        and dl,XtraCMD
        call    RND
        shl dl,3          ; влево н  3
        or  al,dl
        ret
AddXtraCMD  ENDP
;-------------------
MAKE_WDbits PROC
; Enter : Bl - flags
; Exit  : Dl - WDbits
;     Bl - Real WDbits

        mov cl,bl          ; CL - индекс WDbits
        and bl,NOT WDbit   ; Сбросим индекс WDbits
        and cl,WDbit
        pushf
        push    ax
;              ┌┬─┬─┬──────── RND bits
        mov dl,10100100b
WDbits      equ $ - 1
        shl cl,1
        shr dl,cl
        and dl,3

        in  al,40h
        and al,11010100b
        xor byte ptr [WDbits],al

        pop ax
        or  al,dl          ; Истинные биты W и D
        or  bl,dl          ; Во фл ге ком нды з меним индекс WD
                       ; н  истинное зн чение
        popf
        jnz ExitWDbits
        inc bx         ; Если Wbit не присутствует в ком нде
                       ; то он по умолч нию W=1
ExitWDbits:
        ret
MAKE_WDbits ENDP
;-------------------
MAKE_ModeRM PROC
; Enter : AL - ModeRM б йт
;     BX - status с RealWD

        test    bl,TR
        jnz COPorREG

        mov dl,7          ; Не тестируем регистр
        call    RND
        jmp AddREG
COPorREG:
        test    bl,CMDinRM
        jz  AddFreeREG

        call    AddXtraCMD    ; Доб вим ком нду
        jmp REGMEM
AddFreeREG:
        call    GETTRASHREG    ; Берем нез нятый регистр
AddREG:
        shl dl,3          ; + REG
        or  al,dl
REGMEM:
        test    bl,TRM
        jnz TestRM

        mov dl,3         ; Mode
        test    bl,MemOnly   ; Mode!=11b - только в п мять
        jz  falce
        dec dl
falce:
        call    RND
        mov dh,dl        ; DH=Mode

        mov dl,7         ; DL=REG/MEM
        call    RND
        jmp RMdone
TestRM:
        call    GETTRASHREG
        mov dh,3
RMdone:
        ror dh,2
        or  al,dh         ; + Mode
        or  al,dl         ; + RM
        stosb

        test    dh,dh        ; Индексн я без НОП'a
        jnz NextMode
        cmp dl,00000110b     ; НОП опер нд MEM
        je  Index16

NextMode:
        cmp dh,01000000b     ; Индексн я + imm8
        je  Index8
        cmp dh,10000000b     ; Регистров я  дрес ция
        jne ExitModeRM
Index16:                 ; Индексн я + imm16
        in  al,40h
        and al,7Fh
        stosb
Index8:
        in  al,40h
        and al,7Fh
        stosb
ExitModeRM:
        ret
MAKE_ModeRM ENDP
;-------------------
FinishJP    proc
        push    ax
        test    al,JRQ
        jz  FinishPP
        call    JUMPTRASH      ;з кроем JMP
FinishPP:
        pop ax
        push    ax
        test    al,PRQ
        jz  JPisFinished
        call    PUSHPOPTRASH       ;з кроем PUSH/POP
JPisFinished:
        pop ax
        ret
FinishJP    endp
;-------------------
JUMPTRASH   PROC
;       Мусор из условных переходов

        test    [PH_FLAGS],JRQ
        jnz AddRel8toJMP          ;З кончим Jump

        mov al,01110000B          ;Jxx Rel8

        mov dl,0Fh
        call    RND

        or  al,dl   ;Тип Jump'a готов
        stosb

        mov word ptr [JmpPLACE],di   ; дрес мест  для Relative

        inc di
        or  [PH_FLAGS],JRQ  ;Уст новим Jump Request
        ret
AddRel8toJMP:
        mov ax,di
        mov bx,1234h
JmpPLACE    equ $ - 2
        sub ax,bx
        dec al
        mov es:[bx],al

        xor [PH_FLAGS],JRQ ;Сбросим з прос н  з вершение Jmp'a
        ret
JUMPTRASH   ENDP
;-------------------
PUSHPOPTRASH    PROC
;       Мусорные push'истые pop'ы

        test    [PH_FLAGS],JRQ  ; Если есть фл г з прос  jmp'a ,то
                    ; дел ть PUSH/POP нельзя
        jnz PPExit

        mov al,01010000b    ; PUSH/POP

        test    [PH_FLAGS],PRQ  ; PUSH/POP request is set ?
        jnz MakePOP
MakePUSH:
        and [PH_FLAGS],not PRQ

        mov dl,7        ; RND регистр или SREG
        call    RND
        call    DROPCOIN    ; PUSH reg или PUSH Sreg
        jz  DonePUSHPOP

        mov al,00000110b    ; PUSH Sreg
        and dl,00000011b
        shl dl,3
        jmp DonePUSHPOP
MakePOP:
        or  al,00001000b    ; POP Reg
        clc
        call    GETFREEREG
        call    FREEREG
        or  [PH_FLAGS],PRQ
DonePUSHPOP:
        or  al,dl
        stosb
        xor [PH_FLAGS],PRQ
PPExit:
        ret
PUSHPOPTRASH    ENDP
;-------------------
SUBROUTINE  PROC

        mov ax,word ptr [PH_FLAGS]   ; Р сширенные фл ги

        test    al,SRQ       ; SRQ уст новлен ?
        jnz FinishSUB

        test    al,CRQ       ; Не дел ем процедуру
        jz  SUBExit      ; если нет CALL'a

        test    ax,JRQ or PRQ or MSR  ; Не дел ем процедуру
        jnz SUBExit           ; если JRQ,PRQ=1
                          ; Или з м скиров но

        or  al,SRQ       ; Уст новим SUB request
        and al,not FCR   ; Теперь можно дел ть CALL'ы

        mov [PH_FLAGS],al

        mov al,0E9h      ; JMP Relative 8 bit
        stosb
        mov word ptr [JMPovrSUB],di
        inc di
        inc di

        call    RMTRASH     ; + м ленько мусор 
        call    SimplyTRASH

        mov bx,0000b
SubPtr      equ $ - 2

        mov [bx+offset SUBOFFS],di  ; З носим  дрес процедуры
        inc bx          ; в т блицу смещений н  SUB'ы
        inc bx
        and bx,00000111b        ; т блиц  из 4х релокейшнов
        mov word ptr [SubPtr],bx
        jmp SUBExit
FinishSUB:
        call    FinishJP    ; З кончим JMP и PUSH/POP мусор
                    ; (если он есть)
        call    SimplyTRASH
        call    RMTRASH

        mov al,0C3h
        stosb

        mov bx,0000h
JMPovrSUB   equ $ - 2
        mov ax,di
        sub ax,bx
        dec ax
        dec ax
        mov es:[bx],ax
        xor [PH_FLAGS],SRQ
SUBExit:
        ret
SUBROUTINE  ENDP
;-------------------
CALLtoSUB   PROC

        mov ax,word ptr [PH_FLAGS]

        test    ax,MSR       ; Уст новлен MaskCALL/SUBRequest ?
        jnz ExitCALL     ; З прещено внешней прогр ммой

        test    al,CRQ       ; З вершим
        jnz FinishCALL

        or  al,CRQ or FCR    ; З претим з вершение CALL'a
                     ; пок  не будет сдел н  хоть
                     ; одн  SUB'рутин 
        mov [PH_FLAGS],al

        mov al,0E8h
        stosb
        mov word ptr [CALLPlace],di
        inc di
        inc di
        jmp ExitCALL

FinishCALL:
        test    al,FCR     ; Finish CALL Request is Set ?
        jnz ExitCALL   ; Д  - процедуры не сдел но
NextSUB:
        mov dl,00000011b      ; 4 offset'a н  CALL'ы
        mov si,offset SUBOFFS
        call    GETVAL

        mov bx,1234
CALLPlace   equ $ - 2

        sub ax,bx          ; Зто ст р я SUB'рутин 
        jc  NextSUB        ; Берем другую

        sub ax,2
        mov es:[bx],ax
        xor [PH_FLAGS],CRQ
ExitCALL:
        ret
CALLtoSUB   ENDP
;-------------------
RMTRASH     PROC

        mov dl,(ENDRMTAB-RMTAB)/3-1
        call    RND

        xchg    al,dl
        mov dl,3
        mul dl

        movzx   bx,al          ; Index

        mov al,[bx+offset RMTAB]     ; Load Code Operation
        mov bx,[bx+offset RMTAB+1]   ; Load Status Word

        test    bh,KillAD
        jz  SimplyCMD      ; Портит ли ком нд  AX,DX ?

        test    [REG_USED],00000101b ; А можно ли ?
        jnz ExitRMtrash
SimplyCMD:
        call    MAKE_WDbits    ; Сдел ем биты W и D

        test    bl,CMDinCOP    ; Есть дополнительн я ком нд  ?
        jz  OneCommand
        call    AddXtraCMD
OneCommand:
        stosb
        xor al,al          ; б йт ModeRM
        call    MAKE_ModeRM
        call    AddImmediate
ExitRMtrash:
        ret
RMTRASH     ENDP
;-------------------
SimplyTRASH proc

        mov dl,(SimplyEND - SimplyTAB)/2-1
        mov si,offset SimplyTAB     ; AL - COP
        call    GETVAL              ; AH - StatByte

        test    ah,KillAX
        jz  GoodCMD      ; Портит ли ком нд  AX ?

        test    [REG_USED],00000001b ; А можно ли ?
        jnz ExitSimply
GoodCMD:
        mov bl,ah

        mov dh,RotF     ; Выделим бит RotF
        and dh,bl
        xor bl,dh

        mov bh,al
        xor al,al
        call    Make_WDbits
        or  bl,dh       ; Уст новим обр тно бит RotF

        test    bl,TR
        jz  DontREG

        shl al,3
        or  al,bh

        call    GETTRASHREG ; Берем нез нятый регистр
        or  al,dl
        jmp AddCMD
DontREG:
        or  al,bh
AddCMD:
        mov dl,bl
        and dl,SmplyCMD
        ror dl,4
        call    RND
        test    bl,RotF
        jz  DontRot
        shl dl,3
DontRot:
        or  al,dl
        stosb
        call    AddImmediate
ExitSimply:
        ret
SimplyTRASH endp
;-------------------
TRCHAIN     proc
        pusha

        mov dl,8     ; От 8 до 16 мусорных ком нд
        call    RND
        add dl,8
        movzx   cx,dl
AddTRCommand:
        push    cx

        mov si,offset TRCMDs   ; м ссив мусорных процедур
        mov dl,(TREND-TRCMDs)/2-1
        call    GETVAL         ; Возьмем offset
        call    ax         ; Вызовем

        pop cx
        loop    AddTRCommand

        mov al,[PH_FLAGS]
        call    FinishJP       ; З кончим JMP и PUSH/POP trash

        test    al,SRQ
        jz  ExitTRchain
        call    SUBROUTINE     ; З кончим SUB'рутину
        call    RMTRASH
ExitTRchain:
        pop ax         ; Не имеет зн чения
        push    di
        popa
        ret
TRCHAIN     endp
;-------------------
FinishTR    proc

        test    [PH_FLAGS],CRQ
        jz  ExitTRASH

        test    [PH_FLAGS],FCR   ; Нечем з к нчив ть CALL -
        jnz KillCALL     ; не сдел ли ни одной SUB'рутины
        call    CALLtoSUB
        jmp ExitTRASH
KillCALL:
        mov bx,word ptr [CALLPlace]
        mov byte ptr es:[bx-1],90h

        mov dx,26F8h     ; ES/CS/SS/DS,STI/CLI/STD/CLD
        in  ax,40h
        and ax,1803h
        xor dx,ax
        mov es:[bx],dx
ExitTRASH:
        ret
FinishTR    endp
