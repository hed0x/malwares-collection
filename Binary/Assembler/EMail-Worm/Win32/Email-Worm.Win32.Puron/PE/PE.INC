IMAGE_DIRECTORY_ENTRY_EXPORT equ 0
IMAGE_DIRECTORY_ENTRY_IMPORT equ 1
IMAGE_DIRECTORY_ENTRY_RESOURCE equ 2
IMAGE_DIRECTORY_ENTRY_EXCEPTION equ 3
IMAGE_DIRECTORY_ENTRY_SECURITY equ 4
IMAGE_DIRECTORY_ENTRY_BASERELOC equ 5
IMAGE_DIRECTORY_ENTRY_DEBUG equ 6
IMAGE_DIRECTORY_ENTRY_COPYRIGHT equ 7
IMAGE_DIRECTORY_ENTRY_GLOBALPTR equ 8
IMAGE_DIRECTORY_ENTRY_TLS equ 9
IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG equ 10
IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT equ 11
IMAGE_DIRECTORY_ENTRY_IAT equ 12
IMAGE_NUMBEROF_DIRECTORY_ENTRIES equ 16

STRUC IMAGE_DATA_DIRECTORY
.VirtualAddress RESD 1
.isize RESD 1
ENDSTRUC

STRUC PE_HEADER
.Signature RESD 1
.Machine RESW 1
.NumberOfSections RESW 1
.TimeDateStamp RESD 1
.PointerToSymbolTable RESD 1
.NumberOfSymbols RESD 1
.SizeOfOptionalHeader RESW 1
.Characteristics RESW 1
.Magic RESW 1
.MajorLinkerVersion RESB 1
.MinorLinkerVersion RESB 1
.SizeOfCode RESD 1
.SizeOfInitializedData RESD 1
.SizeOfUninitializedData RESD 1
.AddressOfEntryPoint RESD 1
.BaseOfCode RESD 1
.BaseOfData RESD 1
.ImageBase RESD 1
.SectionAlignment RESD 1
.FileAlignment RESD 1
.MajorOperatingSystemVersion RESW 1
.MinorOperatingSystemVersion RESW 1
.MajorImageVersion RESW 1
.MinorImageVersion RESW 1
.MajorSubsystemVersion RESW 1
.MinorSubsystemVersion RESW 1
.Reserved1 RESD 1
.SizeOfImage RESD 1
.SizeOfHeaders RESD 1
.CheckSum RESD 1
.Subsystem RESW 1
.DllCharacteristics RESW 1
.SizeOfStackReserve RESD 1
.SizeOfStackCommit RESD 1
.SizeOfHeapReserve RESD 1
.SizeOfHeapCommit RESD 1
.LoaderFlags RESD 1
.NumberOfRvaAndSizes RESD 1
.DataDirectory RESQ 1
ENDSTRUC

STRUC SECTION_HEADER
.SectionName RESB 8
.VirtualSize RESD 1
.VirtualAddress RESD 1
.SizeOfRawData RESD 1
.PointerToRawData RESD 1
.PointerToRelocations RESD 1
.PointerToLinenumbers RESD 1
.NumberOfRelocations RESW 1
.NumberOfLinenumbers RESW 1
.Characteristics RESD 1
ENDSTRUC

PE_HEADER_SIZE equ 0f8h