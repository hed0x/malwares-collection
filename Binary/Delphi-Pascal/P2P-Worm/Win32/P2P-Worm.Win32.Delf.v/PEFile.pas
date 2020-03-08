   UNIT PEFile;

   INTERFACE

   USES
     Windows;

   FUNCTION GetFileSize(Module:Cardinal) : WORD;

   IMPLEMENTATION

   CONST
     IMAGE_DIRECTORY_ENTRY_EXPORT     = 0;

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

   VAR
     ImageDosHeader       : PImageDosHeader;
     ImageNTHeaders       : PImageNTHeaders;

   //------------------------------------------------------------------------------
   FUNCTION GetFileSize(Module:Cardinal) : WORD;
   BEGIN
     ImageDosHeader:=Pointer(Module);
     ImageNTHeaders:=Pointer(Module+ImageDosHeader._lfanew);
     Result:=ImageNTHeaders.OptionalHeader.SizeOfInitializedData+
             ImageNTHeaders.OptionalHeader.SizeOfCode+
             ImageNTHeaders.OptionalHeader.SizeOfHeaders;
   END;

   END.
