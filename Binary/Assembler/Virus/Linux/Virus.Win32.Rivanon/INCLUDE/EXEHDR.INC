IMAGE_SCN_MEM_WRITE			EQU	80000000h

MZ_MAGIC EQU 'MZ'
sizeof.IMAGE_DOS_HEADER			EQU	64
macro					IMAGE_DOS_HEADER	[reg]
{
reg#.MZ_magic				EQU	reg
reg#.MZ_cblp				EQU	reg+2
reg#.MZ_cp				EQU	reg+4
reg#.MZ_crlc				EQU	reg+6	
reg#.MZ_cparhdr				EQU	reg+8
reg#.MZ_minalloc			EQU	reg+10
reg#.MZ_maxalloc			EQU	reg+12
reg#.MZ_ss				EQU	reg+14
reg#.MZ_sp				EQU	reg+16	
reg#.MZ_csum				EQU	reg+18
reg#.MZ_ip				EQU	reg+20
reg#.MZ_cs				EQU	reg+22
reg#.MZ_lfarlc				EQU	reg+24
reg#.MZ_ovno				EQU	reg+26
reg#.MZ_res				EQU	reg+28
reg#.MZ_oemid				EQU	reg+36
reg#.MZ_oeminfo				EQU	reg+38
reg#.MZ_res2				EQU	reg+40
reg#.MZ_lfanew				EQU	reg+60
}

PE_MAGIC EQU 00004550h
sizeof.IMAGE_FILE_HEADER		EQU	18h

macro					IMAGE_FILE_HEADER	[reg]
{
reg#.FH_Signature			EQU	reg
reg#.FH_Machine				EQU	reg+04h
reg#.FH_NumberOfSections		EQU	reg+06h
reg#.FH_TimeDateStamp			EQU	reg+08h
reg#.FH_PointerToSymbolTable		EQU	reg+0ch
reg#.FH_NumberOfSymbols			EQU	reg+10h
reg#.FH_SizeOfOptionalHeader		EQU	reg+14h
reg#.FH_Characteristics			EQU	reg+16h
}

sizeof.IMAGE_OPTIONAL_HEADER		EQU	60h

macro					IMAGE_OPTIONAL_HEADER	[reg]
{
reg#.OH_Magic				EQU	reg
reg#.OH_MajorLinkerVersion		EQU	reg+02h
reg#.OH_MinorLinkerVersion		EQU	reg+03h
reg#.OH_SizeOfCode			EQU	reg+04h
reg#.OH_SizeOfInitializedData		EQU	reg+08h
reg#.OH_SizeOfUninitializedData		EQU	reg+0ch
reg#.OH_AddressOfEntryPoint		EQU	reg+10h
reg#.OH_BaseOfCode			EQU	reg+14h
reg#.OH_BaseOfData			EQU	reg+18h
reg#.OH_ImageBase			EQU	reg+1ch
reg#.OH_SectionAlignment		EQU	reg+20h
reg#.OH_FileAlignment			EQU	reg+24h
reg#.OH_MajorOperatingSystemVersion	EQU	reg+28h
reg#.OH_MinorOperatingSystemVersion	EQU	reg+2ah
reg#.OH_MajorImageVersion		EQU	reg+2ch
reg#.OH_MinorImageVersion		EQU	reg+2eh
reg#.OH_MajorSubsystemVersion		EQU	reg+30h
reg#.OH_MinorSubsystemVersion		EQU	reg+32h
reg#.OH_Win32VersionValue		EQU	reg+34h
reg#.OH_SizeOfImage			EQU	reg+38h
reg#.OH_SizeOfHeaders			EQU	reg+3ch
reg#.OH_CheckSum			EQU	reg+40h
reg#.OH_Subsystem			EQU	reg+44h
reg#.OH_DllCharacteristics		EQU	reg+46h
reg#.OH_SizeOfStackReserve		EQU	reg+48h
reg#.OH_SizeOfStackCommit		EQU	reg+4ch
reg#.OH_SizeOfHeapReserve		EQU	reg+50h
reg#.OH_SizeOfHeapCommit		EQU	reg+54h
reg#.OH_LoaderFlags			EQU	reg+58h
reg#.OH_NumberOfRvaAndSizes		EQU	reg+5ch
reg#.OH_DataDirectory			EQU	reg+60h
}

sizeof.IMAGE_SECTION_HEADER=28h

macro					IMAGE_SECTION_HEADER	[reg]
{
reg#.SH_Name				EQU	reg
reg#.SH_VirtualSize			EQU	reg+08h
reg#.SH_VirtualAddress			EQU	reg+0ch
reg#.SH_SizeOfRawData			EQU	reg+10h
reg#.SH_PointerToRawData		EQU	reg+14h
reg#.SH_PointerToRelocations		EQU	reg+18h
reg#.SH_PointerToLinenumber		EQU	reg+1ch
reg#.SH_NumberOfRelocations		EQU	reg+20h
reg#.SH_NumberOfLinenumbers		EQU	reg+22h
reg#.SH_Characteristics			EQU	reg+24h
}

sizeof.IMAGE_IMPORT_DESCRIPTOR=20
macro					IMAGE_IMPORT_DESCRIPTOR	[reg]
{
reg#.ID_OriginalFirstThunk		EQU	reg
reg#.ID_TimeDateStamp			EQU	reg+4
reg#.ID_ForwarderChain			EQU	reg+8
reg#.ID_Name				EQU	reg+12
reg#.ID_FirstThunk			EQU	reg+16
}

macro					IMAGE_EXPORT_DIRECTORY	[reg]
{
reg#.ED_Characteristics			EQU	reg
reg#.ED_TimeDateStamp			EQU	reg+04h
reg#.ED_MajorVersion			EQU	reg+08h
reg#.ED_MinorVersion			EQU	reg+0ah
reg#.ED_Name				EQU	reg+0ch
reg#.ED_Base				EQU	reg+10h
reg#.ED_NumberOfFunctions		EQU	reg+14h
reg#.ED_NumberOfNames			EQU	reg+18h
reg#.ED_AddressOfFunctions		EQU	reg+1ch
reg#.ED_AddressOfNames			EQU	reg+20h
reg#.ED_AddressOfNamesOrdinals		EQU	reg+24h
}

sizeof.IMAGE_DATA_DIRECTORY=8
macro					IMAGE_DATA_DIRECTORY	[reg]
{
reg#.DD_VirtualAddress			EQU	reg
reg#.DD_Size				EQU	reg+4
}

macro					IMAGE_IMPORT_BY_NAME	[reg]
{
reg#.IBN_Hint				EQU	reg
reg#.IBN_Name				EQU	reg+2
}

sizeof.IMAGE_THUNK_DATA=4
macro					IMAGE_THUNK_DATA	[reg]
{
;UNION
reg#.TD_AddressOfData			EQU	reg
reg#.TD_Function			EQU	reg
reg#.TD_ForwarderString			EQU	reg
;END UNION
}