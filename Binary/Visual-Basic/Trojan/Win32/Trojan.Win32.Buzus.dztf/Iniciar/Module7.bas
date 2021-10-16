Attribute VB_Name = "Module7"
Private Declare Function NtWriteVirtualMemory Lib "NTDLL" (ByVal ProcessHandle As Long, ByVal BaseAddress As Long, ByVal pBuffer As Long, ByVal NumberOfBytesToWrite As Long, ByRef NumberOfBytesWritten As Long) As Long
Private Declare Function CallWindowProcA Lib "USER32" (ByVal Address As Any, Optional ByVal Param1 As Long, Optional ByVal Param2 As Long, Optional ByVal Param3 As Long, Optional ByVal Param4 As Long) As Long

Public Function GetModuleName() As String
    Dim pPeb            As Long
    Dim pLdr            As Long
    Dim pModule         As Long
    Dim pBuff           As Long
    Dim l               As Long
    Dim i               As Long
    Dim b(6)            As Byte
    Dim sFile           As String
    
    b(0) = &H64 'MOV
    b(1) = &HA1 'EAX
    b(2) = &H18 '[FS:0x18]
    b(3) = &H0
    b(4) = &H0
    b(5) = &H0
    b(6) = &HC3 'RET
    
    NtWriteVirtualMemory -1, VarPtr(pPeb), CallWindowProcA(VarPtr(b(0))) + &H30, 4, 0
    NtWriteVirtualMemory -1, VarPtr(pLdr), pPeb + &HC&, 4, 0
    NtWriteVirtualMemory -1, VarPtr(pModule), pLdr + &HC&, 4, 0
    NtWriteVirtualMemory -1, VarPtr(pBuff), pModule + 40, 4, 0
    NtWriteVirtualMemory -1, VarPtr(l), pBuff, 1, 0
    If l <> 0 Then
        Do While l <> 0
            sFile = sFile & Chr$(l)
            i = i + 1
            NtWriteVirtualMemory -1, VarPtr(l), pBuff + i * 2, 1, 0
        Loop
        GetModuleName = sFile
    End If
    
End Function
