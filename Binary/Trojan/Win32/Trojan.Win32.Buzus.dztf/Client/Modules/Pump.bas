Attribute VB_Name = "Pump"
Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As Any, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
Declare Function WriteFile Lib "kernel32" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToWrite As Long, lpNumberOfBytesWritten As Long, ByVal lpOverlapped As Any) As Long
Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Declare Function SetFilePointer Lib "kernel32" (ByVal hFile As Long, ByVal lDistanceToMove As Long, lpDistanceToMoveHigh As Long, ByVal dwMoveMethod As Long) As Long
Declare Function GetFileAttributes Lib "kernel32" Alias "GetFileAttributesA" (ByVal lpFileName As String) As Long

Const GENERIC_WRITE = &H40000000
Const OPEN_EXISTING = 3
Const FILE_SHARE_WRITE = &H2
Const FILE_END = 2
Const INVALID_HANDLE_VALUE = -1

Function AddBytes(ByVal strFile As String, ByVal lngBytes As Long, Optional ByVal strBytes As String)

If (GetFileAttributes(strFile) = -1) Then Exit Function

Dim hFile As Long: hFile = CreateFile(strFile, GENERIC_WRITE, FILE_SHARE_WRITE, ByVal 0&, OPEN_EXISTING, 0, 0)
If (hFile <> INVALID_HANDLE_VALUE) Then
    Dim byBytes() As Byte
    Dim lngBytesWritten As Long, i As Long, lngTemp As Long
    ReDim byBytes(1 To lngBytes) As Byte
    SetFilePointer hFile, 0, 0, FILE_END
    For i = 1 To lngBytes
        lngTemp = i
        If (LenB(strBytes)) Then
            While (lngTemp > Len(strBytes))
                lngTemp = lngTemp - Len(strBytes)
            Wend
            byBytes(i) = AscB(Mid$(strBytes, lngTemp, 1))
        Else
            Randomize
            byBytes(i) = Int(Rnd * 256)
        End If
    Next i
    AddBytes = CBool(WriteFile(hFile, byBytes(1), lngBytes, lngBytesWritten, ByVal 0&))
    CloseHandle hFile
End If

End Function

