   ;  ”®à¬ â á«®¢  áâ âãá  ¤«ï REG/MEM trash
   ;
   ;  WD = 00 - W ¥â D ¥â             0,1 Wbit & Dbit
   ;   01 - W=0,1 D ¥â
   ;   10 - W=0,1 D=1
   ;   11 - W=0,1 D=0,1
   ;
   ;  TR = 0 - ¥ â¥áâ¨à®¢ âì ¯®«¥ REG      2   TestREG
   ;   1 - â¥áâ¨à®¢ âì ¯®«¥ REG
   ;
   ;                        3   TestREG/MEM
   ;  TRM = 0 - ¥ â¥áâ¨âì ¯®«¥ REG/MEM
   ;    1 - â¥áâ¨âì   à¥£¨áâà
   ;
   ;  MemOnly = 0 - ¯à®¨§¢®«ì®             4   MemOnly
   ;        1 - â®«ìª® ¢ ¯ ¬ïâì
   ;
   ;  PLCMD = 00 - ¥â ¤®¯®«¨â¥«ì®© ª®¬ ¤ë   5,6 PLaceCoMmanD
   ;      01 - ¢ ŠŽ*'e              ¬¥áâ®¯®«®¦¥¨¥
   ;      10 - ¢ ModeRM
   ;
   ;  ImmF = 0 - ¥â ¤®¯®«¨â¥«ì®£® ®¯¥à ¤     7   Immediate
   ;     1 - ¥áâì ¤®¯®«¨â¥«ìë© ®¯¥à ¤
   ;
   ;                        8,9,10
   ;                        ¤®¯®«¨â¥«ì ï ª®¬ ¤ 
   ;                        11,12,13
   ;                        ¤®¯®«¨â¥«ìë© ŠŽ*
   ;
   ;  KillAD = 0 - ¥ ¯®àâ¨â AX ¨ DX        14  KillAX,DX
   ;       1 - ¯®àâ¨â AX ¨ DX

   Wbit        equ 0
   WDbit       equ 00000011b
   TR      equ 00000100b
   TRM     equ 00001000b
   MemOnly     equ 00010000b
   CMDinCOP    equ 00100000b
   CMDinRM     equ 01000000b
   ImmF        equ 10000000b
   ;       High Byte
   XtraCMD     equ 00000111b
   XtraCOP     equ 00111000b
   KillAD      equ 01000000b

   RMTAB       equ $

   db  10001010b,10b+TR,0          ; MOV REG,REG/MEM
   db  10000110b,01b+TR+TRM,0          ; XCHG REG,REG
   db  10001101b,00b+TR+MemOnly,0      ; LEA REG,MEM
   db  00000010b,10b+TR+CMDinCOP,111b      ; ARCMD REG,REG/MEM
   db  00111000b,11b,0             ; CMP REG,REG/MEM
   db  10000100b,01b,0             ; TEST REG,REG/MEM
   db  11000110b,01b+TR+CMDinRM+TRM+ImmF,0 ; MOV REG,Imm8/16
   db  10000000b,01b+TR+CMDinRM+TRM+ImmF,111b  ; ARCMD REG,Imm8/16
   db  11110110b,01b+TR+CMDinRM+ImmF,0     ; TEST REG/MEM,Imm8/16
   db  11111110b,01b+TR+CMDinRM+TRM,1      ; INC/DEC REG
   db  11110110b,01b+TR+CMDinRM+TRM,1+010000b  ; NOT/NEG REG
   db  11110110b,01b+TR+CMDinRM,1+100000b+KillAD    ; MUL/IMUL REG/MEM
   db  10001100b,00b+TR+CMDinRM+TRM,11b    ; MOV REG,SREG
   db  11010000b,01b+TR+CMDinRM+TRM,111b   ; SHIFT REG,1
   db  11010010b,01b+TR+CMDinRM+TRM,111b   ; SHIFT REG,CL

   ; ‡ ¬¥ç ¨ï :
   ;       *¥â á¤¢¨£®¢®£® ¬ãá®à  ç¥à¥§ *Ž* imm8
   ;       *¥â à áè¨à¥¨ï *Ž*'  ¤® ¯®«®£® à §¬¥à  ¢ ARCMD , S=0

   ENDRMTAB    equ $

   ; ’ ¡«¨æ  offset'®¢   SUB'ë
   SUBOFFS     dq  0h
           dq  0h

   ; ’ ¡«¨æ  ¯à®áâ®£® ¬ãá®à 

   RotF        equ 00000010b
   KillAX      equ 00001000b
   SmplyCMD    equ 01110000b

   SimplyTAB   equ $

   db  10110000b,01b+TR+ImmF           ; MOV REG,Imm8/16
   db  10010000b,00b+TR+KillAX         ; XCHG AX,REG
   db  01000000b,00b+TR+RotF+10000b        ; INC/DEC REG
   db  10100001b,00b+KillAX+ImmF       ; MOV AX,MEM
   db  00000100b,01b+KillAX+RotF+ImmF+SmplyCMD ; ARCMD AL/AX,Imm8/16
   db  10101000b,01b+ImmF          ; TEST AL/AX,Imm8/16
   db  00100111b,00b+KillAX+RotF+110000b   ; DAA/DAS/AAA/AAS
   db  11111000b,00b+1010000b          ; STI,CLI,STD,CLD,STC,CLC
   db  11110101b,00b               ; CMC
   db  10011000b,00b+KillAX            ; CBW
   db  11010111b,00b+KillAX            ; XLAT
   db  11001100b,00b               ; INT 3
   db  10011110b,00b+KillAX+10000b     ; SAHF,LAHF
   db  10010000b,00b               ; NOP
   db  00100110b,00b+RotF+110000b      ; ES/CS/SS/DS

   SimplyEND   equ $

   ; ‡ ¬¥ç ¨ï :
   ;       *¥â ¬ãá®à  ¢¢®¤  ¢  ªªã¬ã«ïâ®à ¨§ ¯®àâ 
   ;       *¥â ¬ãá®à  AAM,AAD
   ;       *¥â MOV AL,MEM

   ; ’ ¡«¨æ  ¬ãá®àëå ¯à®æ¥¤ãà

   TRCMDs      dw  offset SimplyTRASH
           dw  offset SUBROUTINE
           dw  offset CALLtoSUB
           dw  offset RMTRASH
           dw  offset JUMPTRASH
           dw  offset PUSHPOPTRASH
   TREND       equ $
   ;----------------------------------------------------------------------------

   GETVAL      proc
   ;       ‚§ïâì § ç¥¨¥ ¯® á«ãç ©®¬ã ¨¤¥ªáã
           call    RND
           shl dl,1
           movzx   bx,dl
           mov ax,[si+bx]
           ret
   GETVAL      endp
   ;-------------------
   GETTRASHREG proc
           bt  bx,Wbit       ; ˆáâ¨ë© Wbit
           cmc
           call    GETFREEREG    ; *¥à¥¬ ¥§ ïâë© à¥£¨áâà
           call    FREEREG       ; *® ¥ ¯®¬¥ç ¥¬ ¥£® ª ª § ïâë© -
                         ; íâ® ¦¥ ¬ãá®à
           ret
   GETTRASHREG endp
   ;-------------------
   AddImmediate    proc
   ; „®¡ ¢«¥¨¥ ¥¯®áà¥¤áâ¢¥®£® ®¯¥à ¤ 
           test    bl,ImmF
           jz  ExitImmed

           in  al,40h
           stosb
           bt  bx,Wbit
           jnc ExitImmed
           in  al,40h
           stosb
   ExitImmed:
           ret
   AddImmediate    endp
   ;-------------------
   AddXtraCMD  PROC
   ; „®¡ ¢«¥¨¥ ¤®¯®«¨â¥«ì®© ª®¬ ¤ë
           mov dl,bh
           and dl,XtraCOP
           or  al,dl

           mov dl,bh         ; „®¡ ¢«ï¥¬ ¤®¯®«¨â¥«ìãî ª®¬ ¤ã
           and dl,XtraCMD
           call    RND
           shl dl,3          ; ¢«¥¢®   3
           or  al,dl
           ret
   AddXtraCMD  ENDP
   ;-------------------
   MAKE_WDbits PROC
   ; Enter : Bl - flags
   ; Exit  : Dl - WDbits
   ;     Bl - Real WDbits

           mov cl,bl          ; CL - ¨¤¥ªá WDbits
           and bl,NOT WDbit   ; ‘¡à®á¨¬ ¨¤¥ªá WDbits
           and cl,WDbit
           pushf
           push    ax
   ;              ÚÂÄÂÄÂÄÄÄÄÄÄÄÄ RND bits
           mov dl,10100100b
   WDbits      equ $ - 1
           shl cl,1
           shr dl,cl
           and dl,3

           in  al,40h
           and al,11010100b
           xor byte ptr [WDbits],al

           pop ax
           or  al,dl          ; ˆáâ¨ë¥ ¡¨âë W ¨ D
           or  bl,dl          ; ‚® ä« £¥ ª®¬ ¤ë § ¬¥¨¬ ¨¤¥ªá WD
                          ;   ¨áâ¨®¥ § ç¥¨¥
           popf
           jnz ExitWDbits
           inc bx         ; …á«¨ Wbit ¥ ¯à¨áãâáâ¢ã¥â ¢ ª®¬ ¤¥
                          ; â® ® ¯® ã¬®«ç ¨î W=1
   ExitWDbits:
           ret
   MAKE_WDbits ENDP
   ;-------------------
   MAKE_ModeRM PROC
   ; Enter : AL - ModeRM ¡ ©â
   ;     BX - status á RealWD

           test    bl,TR
           jnz COPorREG

           mov dl,7          ; *¥ â¥áâ¨àã¥¬ à¥£¨áâà
           call    RND
           jmp AddREG
   COPorREG:
           test    bl,CMDinRM
           jz  AddFreeREG

           call    AddXtraCMD    ; „®¡ ¢¨¬ ª®¬ ¤ã
           jmp REGMEM
   AddFreeREG:
           call    GETTRASHREG    ; *¥à¥¬ ¥§ ïâë© à¥£¨áâà
   AddREG:
           shl dl,3          ; + REG
           or  al,dl
   REGMEM:
           test    bl,TRM
           jnz TestRM

           mov dl,3         ; Mode
           test    bl,MemOnly   ; Mode!=11b - â®«ìª® ¢ ¯ ¬ïâì
           jz  falce
           dec dl
   falce:
           call    RND
           mov dh,dl        ; DH=Mode

           mov dl,7         ; DL=REG/MEM
           call    RND
           jmp RMdone
   TestRM:
           call    GETTRASHREG
           mov dh,3
   RMdone:
           ror dh,2
           or  al,dh         ; + Mode
           or  al,dl         ; + RM
           stosb

           test    dh,dh        ; ˆ¤¥ªá ï ¡¥§ *Ž*'a
           jnz NextMode
           cmp dl,00000110b     ; *Ž* ®¯¥à ¤ MEM
           je  Index16

   NextMode:
           cmp dh,01000000b     ; ˆ¤¥ªá ï + imm8
           je  Index8
           cmp dh,10000000b     ; *¥£¨áâà®¢ ï  ¤à¥á æ¨ï
           jne ExitModeRM
   Index16:                 ; ˆ¤¥ªá ï + imm16
           in  al,40h
           and al,7Fh
           stosb
   Index8:
           in  al,40h
           and al,7Fh
           stosb
   ExitModeRM:
           ret
   MAKE_ModeRM ENDP
   ;-------------------
   FinishJP    proc
           push    ax
           test    al,JRQ
           jz  FinishPP
           call    JUMPTRASH      ;§ ªà®¥¬ JMP
   FinishPP:
           pop ax
           push    ax
           test    al,PRQ
           jz  JPisFinished
           call    PUSHPOPTRASH       ;§ ªà®¥¬ PUSH/POP
   JPisFinished:
           pop ax
           ret
   FinishJP    endp
   ;-------------------
   JUMPTRASH   PROC
   ;       Œãá®à ¨§ ãá«®¢ëå ¯¥à¥å®¤®¢

           test    [PH_FLAGS],JRQ
           jnz AddRel8toJMP          ;‡ ª®ç¨¬ Jump

           mov al,01110000B          ;Jxx Rel8

           mov dl,0Fh
           call    RND

           or  al,dl   ;’¨¯ Jump'a £®â®¢
           stosb

           mov word ptr [JmpPLACE],di   ; ¤à¥á ¬¥áâ  ¤«ï Relative

           inc di
           or  [PH_FLAGS],JRQ  ;“áâ ®¢¨¬ Jump Request
           ret
   AddRel8toJMP:
           mov ax,di
           mov bx,1234h
   JmpPLACE    equ $ - 2
           sub ax,bx
           dec al
           mov es:[bx],al

           xor [PH_FLAGS],JRQ ;‘¡à®á¨¬ § ¯à®á   § ¢¥àè¥¨¥ Jmp'a
           ret
   JUMPTRASH   ENDP
   ;-------------------
   PUSHPOPTRASH    PROC
   ;       Œãá®àë¥ push'¨áâë¥ pop'ë

           test    [PH_FLAGS],JRQ  ; …á«¨ ¥áâì ä« £ § ¯à®á  jmp'a ,â®
                       ; ¤¥« âì PUSH/POP ¥«ì§ï
           jnz PPExit

           mov al,01010000b    ; PUSH/POP

           test    [PH_FLAGS],PRQ  ; PUSH/POP request is set ?
           jnz MakePOP
   MakePUSH:
           and [PH_FLAGS],not PRQ

           mov dl,7        ; RND à¥£¨áâà ¨«¨ SREG
           call    RND
           call    DROPCOIN    ; PUSH reg ¨«¨ PUSH Sreg
           jz  DonePUSHPOP

           mov al,00000110b    ; PUSH Sreg
           and dl,00000011b
           shl dl,3
           jmp DonePUSHPOP
   MakePOP:
           or  al,00001000b    ; POP Reg
           clc
           call    GETFREEREG
           call    FREEREG
           or  [PH_FLAGS],PRQ
   DonePUSHPOP:
           or  al,dl
           stosb
           xor [PH_FLAGS],PRQ
   PPExit:
           ret
   PUSHPOPTRASH    ENDP
   ;-------------------
   SUBROUTINE  PROC

           mov ax,word ptr [PH_FLAGS]   ; * áè¨à¥ë¥ ä« £¨

           test    al,SRQ       ; SRQ ãáâ ®¢«¥ ?
           jnz FinishSUB

           test    al,CRQ       ; *¥ ¤¥« ¥¬ ¯à®æ¥¤ãàã
           jz  SUBExit      ; ¥á«¨ ¥â CALL'a

           test    ax,JRQ or PRQ or MSR  ; *¥ ¤¥« ¥¬ ¯à®æ¥¤ãàã
           jnz SUBExit           ; ¥á«¨ JRQ,PRQ=1
                             ; ˆ«¨ § ¬ áª¨à®¢ ®

           or  al,SRQ       ; “áâ ®¢¨¬ SUB request
           and al,not FCR   ; ’¥¯¥àì ¬®¦® ¤¥« âì CALL'ë

           mov [PH_FLAGS],al

           mov al,0E9h      ; JMP Relative 8 bit
           stosb
           mov word ptr [JMPovrSUB],di
           inc di
           inc di

           call    RMTRASH     ; + ¬ «¥ìª® ¬ãá®à 
           call    SimplyTRASH

           mov bx,0000b
   SubPtr      equ $ - 2

           mov [bx+offset SUBOFFS],di  ; ‡ ®á¨¬  ¤à¥á ¯à®æ¥¤ãàë
           inc bx          ; ¢ â ¡«¨æã á¬¥é¥¨©   SUB'ë
           inc bx
           and bx,00000111b        ; â ¡«¨æ  ¨§ 4å à¥«®ª¥©è®¢
           mov word ptr [SubPtr],bx
           jmp SUBExit
   FinishSUB:
           call    FinishJP    ; ‡ ª®ç¨¬ JMP ¨ PUSH/POP ¬ãá®à
                       ; (¥á«¨ ® ¥áâì)
           call    SimplyTRASH
           call    RMTRASH

           mov al,0C3h
           stosb

           mov bx,0000h
   JMPovrSUB   equ $ - 2
           mov ax,di
           sub ax,bx
           dec ax
           dec ax
           mov es:[bx],ax
           xor [PH_FLAGS],SRQ
   SUBExit:
           ret
   SUBROUTINE  ENDP
   ;-------------------
   CALLtoSUB   PROC

           mov ax,word ptr [PH_FLAGS]

           test    ax,MSR       ; “áâ ®¢«¥ MaskCALL/SUBRequest ?
           jnz ExitCALL     ; ‡ ¯à¥é¥® ¢¥è¥© ¯à®£à ¬¬®©

           test    al,CRQ       ; ‡ ¢¥àè¨¬
           jnz FinishCALL

           or  al,CRQ or FCR    ; ‡ ¯à¥â¨¬ § ¢¥àè¥¨¥ CALL'a
                        ; ¯®ª  ¥ ¡ã¤¥â á¤¥«   å®âì
                        ; ®¤  SUB'àãâ¨ 
           mov [PH_FLAGS],al

           mov al,0E8h
           stosb
           mov word ptr [CALLPlace],di
           inc di
           inc di
           jmp ExitCALL

   FinishCALL:
           test    al,FCR     ; Finish CALL Request is Set ?
           jnz ExitCALL   ; „  - ¯à®æ¥¤ãàë ¥ á¤¥« ®
   NextSUB:
           mov dl,00000011b      ; 4 offset'a   CALL'ë
           mov si,offset SUBOFFS
           call    GETVAL

           mov bx,1234
   CALLPlace   equ $ - 2

           sub ax,bx          ; ‡â® áâ à ï SUB'àãâ¨ 
           jc  NextSUB        ; *¥à¥¬ ¤àã£ãî

           sub ax,2
           mov es:[bx],ax
           xor [PH_FLAGS],CRQ
   ExitCALL:
           ret
   CALLtoSUB   ENDP
   ;-------------------
   RMTRASH     PROC

           mov dl,(ENDRMTAB-RMTAB)/3-1
           call    RND

           xchg    al,dl
           mov dl,3
           mul dl

           movzx   bx,al          ; Index

           mov al,[bx+offset RMTAB]     ; Load Code Operation
           mov bx,[bx+offset RMTAB+1]   ; Load Status Word

           test    bh,KillAD
           jz  SimplyCMD      ; *®àâ¨â «¨ ª®¬ ¤  AX,DX ?

           test    [REG_USED],00000101b ; € ¬®¦® «¨ ?
           jnz ExitRMtrash
   SimplyCMD:
           call    MAKE_WDbits    ; ‘¤¥« ¥¬ ¡¨âë W ¨ D

           test    bl,CMDinCOP    ; …áâì ¤®¯®«¨â¥«ì ï ª®¬ ¤  ?
           jz  OneCommand
           call    AddXtraCMD
   OneCommand:
           stosb
           xor al,al          ; ¡ ©â ModeRM
           call    MAKE_ModeRM
           call    AddImmediate
   ExitRMtrash:
           ret
   RMTRASH     ENDP
   ;-------------------
   SimplyTRASH proc

           mov dl,(SimplyEND - SimplyTAB)/2-1
           mov si,offset SimplyTAB     ; AL - COP
           call    GETVAL              ; AH - StatByte

           test    ah,KillAX
           jz  GoodCMD      ; *®àâ¨â «¨ ª®¬ ¤  AX ?

           test    [REG_USED],00000001b ; € ¬®¦® «¨ ?
           jnz ExitSimply
   GoodCMD:
           mov bl,ah

           mov dh,RotF     ; ‚ë¤¥«¨¬ ¡¨â RotF
           and dh,bl
           xor bl,dh

           mov bh,al
           xor al,al
           call    Make_WDbits
           or  bl,dh       ; “áâ ®¢¨¬ ®¡à â® ¡¨â RotF

           test    bl,TR
           jz  DontREG

           shl al,3
           or  al,bh

           call    GETTRASHREG ; *¥à¥¬ ¥§ ïâë© à¥£¨áâà
           or  al,dl
           jmp AddCMD
   DontREG:
           or  al,bh
   AddCMD:
           mov dl,bl
           and dl,SmplyCMD
           ror dl,4
           call    RND
           test    bl,RotF
           jz  DontRot
           shl dl,3
   DontRot:
           or  al,dl
           stosb
           call    AddImmediate
   ExitSimply:
           ret
   SimplyTRASH endp
   ;-------------------
   TRCHAIN     proc
           pusha

           mov dl,8     ; Žâ 8 ¤® 16 ¬ãá®àëå ª®¬ ¤
           call    RND
           add dl,8
           movzx   cx,dl
   AddTRCommand:
           push    cx

           mov si,offset TRCMDs   ; ¬ áá¨¢ ¬ãá®àëå ¯à®æ¥¤ãà
           mov dl,(TREND-TRCMDs)/2-1
           call    GETVAL         ; ‚®§ì¬¥¬ offset
           call    ax         ; ‚ë§®¢¥¬

           pop cx
           loop    AddTRCommand

           mov al,[PH_FLAGS]
           call    FinishJP       ; ‡ ª®ç¨¬ JMP ¨ PUSH/POP trash

           test    al,SRQ
           jz  ExitTRchain
           call    SUBROUTINE     ; ‡ ª®ç¨¬ SUB'àãâ¨ã
           call    RMTRASH
   ExitTRchain:
           pop ax         ; *¥ ¨¬¥¥â § ç¥¨ï
           push    di
           popa
           ret
   TRCHAIN     endp
   ;-------------------
   FinishTR    proc

           test    [PH_FLAGS],CRQ
           jz  ExitTRASH

           test    [PH_FLAGS],FCR   ; *¥ç¥¬ § ª ç¨¢ âì CALL -
           jnz KillCALL     ; ¥ á¤¥« «¨ ¨ ®¤®© SUB'àãâ¨ë
           call    CALLtoSUB
           jmp ExitTRASH
   KillCALL:
           mov bx,word ptr [CALLPlace]
           mov byte ptr es:[bx-1],90h

           mov dx,26F8h     ; ES/CS/SS/DS,STI/CLI/STD/CLD
           in  ax,40h
           and ax,1803h
           xor dx,ax
           mov es:[bx],dx
   ExitTRASH:
           ret
   FinishTR    endp
