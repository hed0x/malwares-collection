GENERIC_WRITE                   equ     40000000h
GENERIC_READ                    equ     80000000h

OPEN_EXISTING                   equ     3

tebProcessEnvironmentBlock      equ     30h

pebImageBaseAddress             equ     8
pebLdr                          equ     0ch

ldrInLoadOrderModuleList        equ     1ch

mlDllBase                       equ     8

e_lfanew                        equ     3ch

IMAGE_DIRECTORY_ENTRY_EXPORT    equ     78h

edAddressOfFunctions            equ     1ch

ohImageBase                     equ     34h

erExceptionCode                 equ     0
erExceptionAddress              equ     0ch
erExceptionInformation          equ     18h

ctxEdi                          equ     09ch
ctxEsi                          equ     0a0h
ctxEbx                          equ     0a4h
ctxEdx                          equ     0a8h
ctxEcx                          equ     0ach
ctxEax                          equ     0b0h
ctxEbp                          equ     0b4h
ctxEip                          equ     0b8h
ctxEFlags                       equ     0c0h
ctxEsp                          equ     0c4h

PAGE_NOACCESS                   equ     1
PAGE_READONLY                   equ     2
PAGE_READWRITE                  equ     4
PAGE_EXECUTE                    equ     10h
PAGE_EXECUTE_READ               equ     20h
PAGE_EXECUTE_READWRITE          equ     40h

MEM_COMMIT                      equ     1000h
MEM_RESERVE                     equ     2000h

STATUS_ACCESS_VIOLATION         equ     0C0000005h

_IMAGE_FILE_HEADER      struc
fhMachine               dw      ?
fhNumberOfSections      dw      ?
fhTimeDateStamp         dd      ?
fhPointerToSymbolTable  dd      ?
fhNumberOfSymbols       dd      ?
fhSizeOfOptionalHeader  dw      ?
fhCharacteristics       dw      ?
_IMAGE_FILE_HEADER      ends

_IMAGE_OPTIONAL_HEADER          struc
ohMagic                         dw      ?
ohMajorLinkerVersion            db      ?
ohMinorLinkerVersion            db      ?
ohSizeOfCode                    dd      ?
ohSizeOfInitializedData         dd      ?
ohSizeOfUninitializedData       dd      ?
ohAddressOfEntryPoint           dd      ?
ohBaseOfCode                    dd      ?
ohBaseOfData                    dd      ?
ohImageBasex                    dd      ?
ohSectionAlignment              dd      ?
ohFileAlignment                 dd      ?
ohMajorOperatingSystemVersion   dw      ?
ohMinorOperatingSystemVersion   dw      ?
ohMajorImageVersion             dw      ?
ohMinorImageVersion             dw      ?
ohMajorSubsystemVersion         dw      ?
ohMinorSubsystemVersion         dw      ?
ohWin32VersionValue             dd      ?
ohSizeOfImage                   dd      ?
ohSizeOfHeaders                 dd      ?
ohCheckSum                      dd      ?
_IMAGE_OPTIONAL_HEADER          ends

_IMAGE_NT_HEADERS       struc
nthSignature            dd                     ?
nthFileHeader           _IMAGE_FILE_HEADER     <?>
nthOptionalHeader       _IMAGE_OPTIONAL_HEADER <?>
_IMAGE_NT_HEADERS       ends

_IMAGE_SECTION_HEADER   struc
shName                  db      8 dup (?)
shVirtualSize           dd      ?
shVirtualAddress        dd      ?
shSizeOfRawData         dd      ?
shPointerToRawData      dd      ?
shPointerToRelocations  dd      ?
shPointerToLinenumbers  dd      ?
shNumberOfRelocations   dw      ?
shNumberOfLinenumbers   dw      ?
shCharacteristics       dd      ?
_IMAGE_SECTION_HEADER   ends

_MEMORY_BASIC_INFORMATION       struc
mbiBaseAddress          dd      ?
mbiAllocationBase       dd      ?
mbiAllocationProtect    dd      ?
mbiRegionSize           dd      ?
mbiState                dd      ?
mbiProtect              dd      ?
mbiType                 dd      ?
_MEMORY_BASIC_INFORMATION       ends
