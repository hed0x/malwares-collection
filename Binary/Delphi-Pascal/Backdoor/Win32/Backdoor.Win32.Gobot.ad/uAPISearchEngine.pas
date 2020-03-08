   UNIT uAPISearchEngine;

   INTERFACE

   USES
     uCRC32;

   VAR
     DllModule : Integer;

   FUNCTION GetProcAddressCRC32(ProcessCRC:Cardinal) : Pointer;

   IMPLEMENTATION

   CONST
     IMAGE_DIRECTORY_ENTRY_EXPORT     = 0;
     SIZE_OF_80387_REGISTERS          = 80;
     IMAGE_NUMBEROF_DIRECTORY_ENTRIES = 16;
     MAX_API_STRING_LENGTH            = 150;
     IMAGE_DOS_SIGNATURE              = $5A4D;
     IMAGE_NT_SIGNATURE               = $00004550;
     MIN_KERNEL_SEARCH_BASE           = $70000000;

   TYPE
     PImageDosHeader               =^TImageDosHeader;
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

   //------------------------------------------------------------------------------
   FUNCTION GetProcAddressCRC32(ProcessCRC:Cardinal) : Pointer;
   VAR
     ExportName           : pChar;
     Address              : Cardinal;
     J                    : Cardinal;
     ImageDosHeader       : PImageDosHeader;
     ImageNTHeaders       : PImageNTHeaders;
     ImageExportDirectory : PImageExportDirectory;
   BEGIN
     ImageDosHeader:=Pointer(DllModule);
     ImageNTHeaders:=Pointer(DllModule+ImageDosHeader._lfanew);
     ImageExportDirectory:=Pointer(ImageNtHeaders.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress+DllModule);
     J:=0;
     Address:=0;
     REPEAT
       ExportName:=Pointer(Cardinal(Pointer(Cardinal(ImageExportDirectory.AddressOfNames)+DllModule+J*4)^)+DllModule);
       IF CalculateCRC32(ExportName^,Length(ExportName))=ProcessCRC THEN
         Address:=Cardinal(Pointer(Word(Pointer(J SHL 1+Cardinal(
                  ImageExportDirectory.AddressOfNameOrdinals)+DllModule)^) AND
                  $0000FFFF SHL 2+Cardinal(ImageExportDirectory.AddressOfFunctions)
                  +DllModule)^)+DllModule;
       Inc(J);
     UNTIL (Address<>0)OR(J=ImageExportDirectory.NumberOfNames);
     Result:=Pointer(Address);
   END;

   END.
