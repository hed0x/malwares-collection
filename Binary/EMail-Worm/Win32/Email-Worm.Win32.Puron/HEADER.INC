mz_header:
.magic                  dw "MZ"
.cblp                   dw 0
.cp                     dw 1
.crlc                   dw 0
.cparhdr                dw 4
.minalloc               dw 0
.maxalloc               dw 0
.ss                     dw 1
.sp                     dw 0
.csum                   dw 0
.ip                     dw 0
.cs                     dw 0
.lfarlc                 dw 40h
.ovno                   dw 0
.res                    times 4 dw 0
.oemid                  dw 0
.oeminfo                dw 0
.res2                   times 10 dw 0
.lfanew                 dd pe_header

dos_stub:
       mov ah, 4ch
       int 21h

pe_header:
.Signature              dd "PE"
.Machine                dw 14Ch
.NumberOfSections       dw 1
.TimeDateStamp          dd 0
.PointerToSymbolTable   dd 0
.NumberOfSymbols        dd 0
.SizeOfOptionalHeader   dw 0e0h
.Characteristics        dw 838fh
.Magic                  dw 10Bh
.MajorLinkerVersion     db 0
.MinorLinkerVersion     db 0
.SizeOfCode             dd 3000h
.SizeOfInitializedData  dd 0
.SizeOfUninitialzedData dd 0
.AddressOfEntryPoint    dd code+RVA_diff
.BaseOfCode             dd 1000h
.BaseOfData             dd 1000h
.ImageBase              dd imagebase
.SectionAlignment       dd 1000h
.FileAlignment          dd 200h
.MajorOperSystemVersion dw 0
.MinorOperSystemVersion dw 0
.MajorImageVersion      dw 0
.MinorImageVersion      dw 0
.MajorSubsystemVersion  dw 0
.MinorSubsystemVersion  dw 0
.Reserved1              dd 0
.SizeOfImage            dd 4000h
.SizeOfHeaders          dd 200h
.CheckSum               dd 0
.Subsystem              dw 2
.DllCharacteristics     dw 0
.SizeOfStackReserve     dd 100000h
.SizeOfStackCommit      dd 2000h
.SizeOfHeapReserve      dd 100000h
.SizeOfHeapCommit       dd 1000h
.LoaderFlags            dd 0
.NumberOfRvaAndSizes    dd 10h
.export                 times 2 dd 0
.import                 dd import+RVA_diff, code-import
.misc_sectionz          times 28 dd 0

sections:
.SectionName            db "(c)Vecna"
.VirtualSize            dd 3000h
.VirtualAddress         dd 1000h
.SizeOfRawData          dd code_end-code_start
.PointerToRawData       dd 200h
.PointerToRelocations   dd 0
.PointerToLinenumbers   dd 0
.NumberOfRelocations    dw 0
.NumberOfLinenumbers    dw 0
.Characteristics        dd 0e0000020h

