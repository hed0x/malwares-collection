Attribute VB_Name = "MainMod"
Public Declare Function GetTempPath Lib "kernel32" Alias "GetTempPathA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long
Public Declare Function GetShortPathName Lib "kernel32" Alias "GetShortPathNameA" (ByVal lpszLongPath As String, ByVal lpszShortPath As String, ByVal cchBuffer As Long) As Long
Public Declare Function StrFormatByteSize Lib "shlwapi" Alias "StrFormatByteSizeA" (ByVal dw As Long, ByVal pszBuf As String, ByRef cchBuf As Long) As String
Public Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
Public Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Declare Function ExtractIcon Lib "shell32.dll" Alias "ExtractIconA" (ByVal hInst As Long, ByVal lpszExeFileName As String, ByVal nIconIndex As Long) As Long
Declare Function DrawIcon Lib "user32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal hIcon As Long) As Long
Declare Function DestroyIcon Lib "user32" (ByVal hIcon As Long) As Long
Public Declare Function SHGetFileInfo Lib "shell32.dll" Alias "SHGetFileInfoA" (ByVal pszPath As String, ByVal dwFileAttributes As Long, psfi As SHFILEINFO, ByVal cbSizeFileInfo As Long, ByVal uFlags As Long) As Long
Public Declare Function ImageList_Draw Lib "comctl32.dll" (ByVal himl&, ByVal I&, ByVal hDCDest&, ByVal X&, ByVal Y&, ByVal flags&) As Long

Public Const ArchType01 = "CYT5.0"
Public Const ArchType02 = "CYT6.0"
Public Const ArchType03 = "CYT7.0"
Public Const ArchType04 = "CYT8.0"

Public ERROR_LIST As String

Public Const MAX_PATH = 260

Public Type SHFILEINFO
    hIcon As Long
    iIcon As Long
    dwAttributes As Long
    szDisplayName As String * MAX_PATH
    szTypeName As String * 80
End Type

Public Const SHGFI_DISPLAYNAME = &H200
Public Const SHGFI_EXETYPE = &H2000
Public Const SHGFI_SYSICONINDEX = &H4000 'system icon index
Public Const SHGFI_LARGEICON = &H0 'large icon
Public Const SHGFI_SMALLICON = &H1 'small icon
Public Const ILD_TRANSPARENT = &H1 'display transparent
Public Const SHGFI_SHELLICONSIZE = &H4
Public Const SHGFI_TYPENAME = &H400
Public Const BASIC_SHGFI_FLAGS = SHGFI_TYPENAME _
Or SHGFI_SHELLICONSIZE Or SHGFI_SYSICONINDEX _
Or SHGFI_DISPLAYNAME Or SHGFI_EXETYPE

Public IconInfo As SHFILEINFO

Public ExtractSize As Variant
Public AllSize As Variant

Public QuickViewPath As String
Public QViewDirectory As String
Public QViewAlert As Boolean
Public QViewON As Boolean

Public VirusScanPath As String
Public VScanDirectory As String
Public VScanAlert As Boolean
Public VScanON As Boolean

Global lngIcon
Global strProgram
Global strProgramA
Global strSaveIconFile

Public Const MIN_BYTE_IN_FILE = 1

Public ChkPro As Integer
Public SelectOption As Integer
Public ChkNewResult As Integer
Public CompressionLevel As Integer
Public lnglngResult As Long
Public LoadProg As Boolean
Public ChkWarningMsg As Boolean
Public ExtractPath As String
Public sString As String
Public EncryptionAgent As Boolean
Public CompressionAgent As Boolean
Public SwapAgent As Boolean
Public EncryptionAgentA As Boolean
Public CompressionAgentA As Boolean
Public SwapAgentA As Boolean
Public lLength As Long
Public dFileName As String
Public FolIndex As Long
Public LastDrive As String
Public ChkIfLoad As Boolean
Public FileNumberADD As Variant
Public FileNumberCyT As Variant
Public M As Variant
Public D As Variant
Public Z As Integer
Public Files As Variant
Public FileNumber As Variant
Public GetChr0 As Variant
Public GetChr1 As Variant
Public GetChr2 As Variant
Public LoadArchive As Boolean
Public ArchiveName As String
Public ChkFastLoad As Boolean
Public CyTFile As String
Public Position As Variant
Public DestinationNumber As Variant
Public ChkLoad As Boolean
Public FileListStart As Long
Public Header As String
Public TmpFile As String
Public FileList As String

Public Sub GetIcon(Path As String, Destination As PictureBox)
    
    Dim hImgSmall As Long
    hImgSmall = SHGetFileInfo(Path, 0&, IconInfo, Len(IconInfo), BASIC_SHGFI_FLAGS Or SHGFI_LARGEICON)
    ImageList_Draw hImgSmall, IconInfo.iIcon, Destination.hdc, 0, 0, ILD_TRANSPARENT

End Sub

Public Sub KillFile(Name As String)
    On Error Resume Next
    Kill Name
End Sub

'Kills the file after loading the data
Public Sub ClearTempFile()
    On Error Resume Next
    Close
    Kill TempRootS & "\" & frmMain.ListFiles.SelectedItem
End Sub

Public Sub GetListData()
    
    On Error Resume Next
    
    If ArchiveName = "" Then
        frmMain.StatusBar.Panels.Item(1).Text = "Choose " & Chr(34) & "New" & Chr(34) & " to create or " & Chr(34) & "Open" & Chr(34) & " to open an archive"
    ElseIf ArchiveName <> "" Then
        frmMain.StatusBar.Panels.Item(1).Text = "CyberCrypt (" & ArchiveName & ")"
    End If

End Sub

Public Function KillArchive(Archive As String) As Boolean
    On Error GoTo FinaliseError
    Close
    Kill Archive
    KillArchive = True
    Exit Function
FinaliseError:
    KillArchive = False
End Function

Public Function FolderExist(Pathn As String) As Boolean
    If Dir$(Pathn) = "" Then FolderExist = False Else FolderExist = True
End Function

Public Function GetTemporaryFilename(Optional Prefix As String = "") As String
    On Error Resume Next
    Dim lngReturnVal As Long
    Dim strTempPath As String * 255
    lngReturnVal = GetTempPath(254, strTempPath)
    GetTemporaryFilename = strTempPath
End Function

Public Function GetShortName(ByVal sLongFileName As String) As String
    On Error Resume Next
    Dim lRetVal As Long, sShortPathName As String, iLen As Integer
    sShortPathName = Space(255)
    iLen = Len(sShortPathName)
    lRetVal = GetShortPathName(sLongFileName, sShortPathName, iLen)
    GetShortName = Left(sShortPathName, lRetVal)
End Function

'This function checks the compression level that wants
'to be used on your archives.
Public Function ChkCompressLvl(level As Long) As Long
    If level = 0 Then CompressionLevel = 9 ' - Highest compression
    If level = 1 Then CompressionLevel = 6 ' - Medium compression
    If level = 2 Then CompressionLevel = -1 ' - Default
    If level = 3 Then CompressionLevel = 3 ' - Low compression
    If level = 4 Then CompressionLevel = 1 ' - Very low compression
    If level = 5 Then CompressionLevel = 0 ' - No compression
    If level = 6 Then CompressionLevel = 2
    If level = 7 Then CompressionLevel = 4
    If level = 8 Then CompressionLevel = 5
    If level = 9 Then CompressionLevel = 7
    If level = 10 Then CompressionLevel = 8
    ChkCompressLvl = CompressionLevel
End Function

Public Function KillFileActive(Filen As String) As Boolean
    On Error GoTo FinaliseError
    Kill Filen
    KillFileActive = True
    Exit Function
FinaliseError:
    KillFileActive = False
End Function

'shlwapi.dll is used to get the format of converting bytes
'into bytes, KB, MB and GB
Public Function FormatKB(ByVal Amount As Long) As String
    Dim Buffer As String
    Dim Result As String
    Buffer = Space$(255)
    Result = StrFormatByteSize(Amount, Buffer, Len(Buffer))
    If InStr(Result, vbNullChar) > 1 Then FormatKB = Left$(Result, InStr(Result, vbNullChar) - 1)
End Function

Public Function RemoveBackSlash(FileName As String) As String
    For M = 1 To Len(FileName)
        GetChr1 = Right(FileName, M)
        GetChr2 = Left(GetChr1, 1)
        If GetChr2 = "\" Or GetChr2 = "/" Then
            RemoveBackSlash = Right(GetChr1, Len(GetChr1) - 1)
            Exit Function
        End If
    Next M
End Function

'This sub is designed to centre a picture to a fixed set ratio
'of the oraginal size (In other words sets the ratio of the picture
'so it fits perfectly into the picture box returned by the target value
'without off setting the ratio size).
Public Sub CentrePic(Target As PictureBox, Source As StdPicture)
    On Error Resume Next
    Dim PicWidth As Integer
    Dim PicHeight As Integer
    Dim NewWidth As Integer
    Dim NewHeight As Integer
    Dim CenterX As Integer
    Dim CenterY As Integer
    PicWidth = Source.Width / 16.763
    PicHeight = Source.Height / 16.763
    Aspect = PicWidth / PicHeight
    If PicWidth > PicHeight Then
        NewWidth = Target.Width - 240
        NewHeight = Target.Width / Aspect
    Else
        NewWidth = Target.Height * Aspect
        NewHeight = Target.Height - 240
    End If
    CenterX = Target.Width / 2 - NewWidth / 2
    CenterY = Target.Height / 2 - NewHeight / 2
    Target.PaintPicture Source, CenterX, CenterY, NewWidth, NewHeight
End Sub
