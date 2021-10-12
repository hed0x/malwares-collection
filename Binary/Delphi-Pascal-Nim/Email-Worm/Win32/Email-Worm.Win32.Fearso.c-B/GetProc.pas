   {$I CompMode.INI}

   {$IFDEF Debug}
   UNIT GetProc;
   {$ELSE}
   UNIT A3;
   {$ENDIF}

   INTERFACE

   FUNCTION GetProcAddress(DllBase:LongWord;ApiName:PChar) : Pointer; PASCAL;

   IMPLEMENTATION

   CONST
     SIZE_OF_80387_REGISTERS          = 80;
     IMAGE_NT_SIGNATURE               = $00004550;
     IMAGE_NUMBEROF_DIRECTORY_ENTRIES = 16;
     IMAGE_DOS_SIGNATURE              = $5A4D;
     MIN_KERNEL_SEARCH_BASE           = $70000000;
     MAX_API_STRING_LENGTH            = 150;
     IMAGE_DIRECTORY_ENTRY_EXPORT     = 0;

   TYPE
     PFloatingSaveArea             =^TFloatingSaveArea;
     TFloatingSaveArea             = RECORD
       ControlWord                 : LongWord;
       StatusWord                  : LongWord;
       TagWord                     : LongWord;
       ErrorOffset                 : LongWord;
       ErrorSelector               : LongWord;
       DataOffset                  : LongWord;
       DataSelector                : LongWord;
       RegisterArea                : ARRAY [0..SIZE_OF_80387_REGISTERS-1] OF BYTE;
       Cr0NpxState                 : LongWord;
     END;

     PContext                      =^TContext;
     TContext                      = RECORD
       ContextFlags                : LongWord;
       Dr0                         : LongWord;
       Dr1                         : LongWord;
       Dr2                         : LongWord;
       Dr3                         : LongWord;
       Dr6                         : LongWord;
       Dr7                         : LongWord;
       FloatSave                   : TFloatingSaveArea;
       SegGs                       : LongWord;
       SegFs                       : LongWord;
       SegEs                       : LongWord;
       SegDs                       : LongWord;
       Edi                         : LongWord;
       Esi                         : LongWord;
       Ebx                         : LongWord;
       Edx                         : LongWord;
       Ecx                         : LongWord;
       Eax                         : LongWord;
       Ebp                         : LongWord;
       Eip                         : LongWord;
       SegCs                       : LongWord;
       EFlags                      : LongWord;
       Esp                         : LongWord;
       SegSs                       : LongWord;
     END;

     PSEHStruct                    =^TSEHStruct;
     TSEHStruct                    = RECORD
       saveEsp                     : Cardinal;
       saveEbp                     : Cardinal;
       gotoEip                     : Cardinal;
     END;

   VAR
     SEH : TSEHStruct;

   FUNCTION SEHHandler(p1,p2,p3,p4:Pointer) : Cardinal; CDECL;
   BEGIN
     WITH PContext(p3)^ DO BEGIN
       Esp:=SEH.saveEsp;
       Ebp:=SEH.saveEbp;
       Eip:=SEH.gotoEip;
     END;
     RESULT:=0;  // ExceptionContinueExecution
   END;

   TYPE
    PImageDosHeader                =^TImageDosHeader;
     TImageDosHeader               = PACKED RECORD
       e_magic                     : WORD;
       e_cblp                      : WORD;
       e_cp                        : WORD;
       e_crlc                      : WORD;
       e_cparhdr                   : WORD;
       e_minalloc                  : WORD;
       e_maxalloc                  : WORD;
       e_ss                        : WORD;
       e_sp                        : WORD;
       e_csum                      : WORD;
       e_ip                        : WORD;
       e_cs                        : WORD;
       e_lfarlc                    : WORD;
       e_ovno                      : WORD;
       e_res                       : ARRAY [0..3] OF WORD;
       e_oemid                     : WORD;
       e_oeminfo                   : WORD;
       e_res2                      : ARRAY [0..9] OF WORD;
       _lfanew                     : LongInt;
     END;

     PImageFileHeader              =^TImageFileHeader;
     TImageFileHeader              = PACKED RECORD
       Machine                     : WORD;
       NumberOfSections            : WORD;
       TimeDateStamp               : LongWord;
       PointerToSymbolTable        : LongWord;
       NumberOfSymbols             : LongWord;
       SizeOfOptionalHeader        : WORD;
       Characteristics             : WORD;
     END;

     PImageDataDirectory           =^TImageDataDirectory;
     TImageDataDirectory           = RECORD
       VirtualAddress              : LongWord;
       Size                        : LongWord;
     END;

     PImageOptionalHeader          =^TImageOptionalHeader;
     TImageOptionalHeader          = PACKED RECORD
       Magic                       : WORD;
       MajorLinkerVersion          : Byte;
       MinorLinkerVersion          : Byte;
       SizeOfCode                  : LongWord;
       SizeOfInitializedData       : LongWord;
       SizeOfUninitializedData     : LongWord;
       AddressOfEntryPoint         : LongWord;
       BaseOfCode                  : LongWord;
       BaseOfData                  : LongWord;
       ImageBase                   : LongWord;
       SectionAlignment            : LongWord;
       FileAlignment               : LongWord;
       MajorOperatingSystemVersion : WORD;
       MinorOperatingSystemVersion : WORD;
       MajorImageVersion           : WORD;
       MinorImageVersion           : WORD;
       MajorSubsystemVersion       : WORD;
       MinorSubsystemVersion       : WORD;
       Win32VersionValue           : LongWord;
       SizeOfImage                 : LongWord;
       SizeOfHeaders               : LongWord;
       CheckSum                    : LongWord;
       Subsystem                   : WORD;
       DllCharacteristics          : WORD;
       SizeOfStackReserve          : LongWord;
       SizeOfStackCommit           : LongWord;
       SizeOfHeapReserve           : LongWord;
       SizeOfHeapCommit            : LongWord;
       LoaderFlags                 : LongWord;
       NumberOfRvaAndSizes         : LongWord;
       DataDirectory               : PACKED ARRAY[0..IMAGE_NUMBEROF_DIRECTORY_ENTRIES-1] OF TImageDataDirectory;
     END;

     PImageNtHeaders               =^TImageNtHeaders;
     TImageNtHeaders               = PACKED RECORD
       Signature                   : LongWord;
       FileHeader                  : TImageFileHeader;
       OptionalHeader              : TImageOptionalHeader;
     END;

     PImageExportDirectory         =^TImageExportDirectory;
     TImageExportDirectory         = PACKED RECORD
       Characteristics             : LongWord;
       TimeDateStamp               : LongWord;
       MajorVersion                : WORD;
       MinorVersion                : WORD;
       Name                        : LongWord;
       Base                        : LongWord;
       NumberOfFunctions           : LongWord;
       NumberOfNames               : LongWord;
       AddressOfFunctions          :^PLongWord;
       AddressOfNames              :^PLongWord;
       AddressOfNameOrdinals       :^PWord;
     END;

   FUNCTION GetProcAddress(DllBase:LongWord;ApiName:PChar) : Pointer; PASCAL;
     {directive "pascal" to force stack frame}
   ASM
     {save used registers}
     PUSH ESI
     PUSH EDI
     PUSH ECX
     PUSH EBX
     PUSH EDX
     {using [EDX] saves some space over [0]}
     XOR  EDX,EDX
     {set up SEH frame}
     PUSH OFFSET SEHHandler
     PUSH DWORD PTR FS:[EDX]
     MOV  SEH.saveEsp,ESP
     MOV  SEH.saveEbp,EBP
     MOV  SEH.gotoEip,OFFSET @@NotFound
     MOV  FS:[EDX],ESP
     {string length the target api}
     MOV  EDI,ApiName
     MOV  ECX,MAX_API_STRING_LENGTH
     XOR  AL,AL
     REPNZ SCASB
     MOV  ECX,EDI
     SUB  ECX,ApiName
     {get and check PE file header}
     MOV  EDX,DllBase
     CMP  [EDX].TImageDosHeader.e_magic,IMAGE_DOS_SIGNATURE
     JNZ  @@NotFound
     ADD  EDX,[EDX].TImageDosHeader._lfanew
     CMP  [EDX].TImageNtHeaders.Signature,IMAGE_NT_SIGNATURE
     JNZ  @@NotFound
     {get and check export directory}
     MOV  EDX,[EDX].TImageNtHeaders.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].TImageDataDirectory.VirtualAddress
     OR   EDX,EDX
     JZ   @@NotFound
     ADD  EDX,DllBase
     {scan names}
     MOV  EBX,[EDX].TImageExportDirectory.AddressOfNames
     ADD  EBX,DllBase
     XOR  EAX,EAX
   @@Loop:
     MOV  EDI,[EBX]
     ADD  EDI,DllBase
     MOV  ESI,ApiName
     PUSH ECX
     REPZ CMPSB
     POP  ECX
     JE   @@Found
     ADD  EBX,4
     INC  EAX
     CMP  EAX,[EDX].TImageExportDirectory.NumberOfNames
     JB   @@Loop
     JMP  @@NotFound
   @@Found:
     {name->ordinal}
     SHL  EAX,1
     ADD  EAX,[EDX].TImageExportDirectory.AddressOfNameOrdinals
     ADD  EAX,DllBase
     MOV  AX,[EAX]
     AND  EAX,$0000FFFF
     {ordinal->function}
     SHL  EAX,2
     ADD  EAX,[EDX].TImageExportDirectory.AddressOfFunctions
     ADD  EAX,DllBase
     MOV  EAX,[EAX]
     ADD  EAX,DllBase
     JMP  @@Exit
   @@NotFound:
     {return 0 on error}
     XOR  EAX, EAX
   @@Exit:
     {clean up SEH frame}
     XOR   EDX,EDX
     POP   DWORD PTR FS:[EDX]
     ADD   ESP,4
     {restore used registers}
     POP  EDX
     POP  EBX
     POP  ECX
     POP  EDI
     POP  ESI
   END;

   END.
